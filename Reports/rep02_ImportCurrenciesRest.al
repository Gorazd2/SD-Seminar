report 50102 "CSD Import Currencies Rest"
{
    Caption = 'SCD Import Currencies Rest';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    ProcessingOnly = true;

    trigger OnPreReport()
    begin
        if not client.Get(Url, Response) then
            Error(NoConnectTxt, url);
        if not Response.IsSuccessStatusCode then
            Error(NoConnectTxt2, Response.HttpStatusCode, Response.ReasonPhrase);
        Response.Content.ReadAs(JsonResponse);
        JsonResponse := '[' + JsonResponse + ']';

        if Currency.FindSet() then
            repeat
                SearchKey := lowercase(Currency.Code);
                if Object.SelectToken(SearchKey, Token) then begin
                    if Token.IsObject then begin
                        Object2 := Token.AsObject;
                        InsertCurrencyRate(Object2);
                    end;
                end;
            until Currency.Next() = 0;

        //page.Run(Page::"Currency Exchange Rates", CurrencyRate);
    end;






    var
        Object2: JsonObject;
        SearchKey: Text;
        client: HttpClient;
        Response: HttpResponseMessage;
        Token: JsonToken;
        Object: JsonObject;
        Array: JsonArray;
        Value: JsonValue;
        JsonResponse: Text;
        LowerCurrCode: Text[10];
        Url: label 'https://www.floatrates.com/daily/gbp.json';
        NoConnectTxt: label 'Error getting response from server';
        Currency: Record Currency;
        NoConnectTxt2: label 'Error getting response from server - Error is %1 Error is %2', comment = '%1 = Status - %2 Error Text';

    local procedure ConvertDate(inDateTxt: Text[50]): Date;
    var
        DayTxt: Text[10];
        MonthTxt: Text[10];
        YearTxt: Text[10];
        DayNo: Integer;
        MonthNo: Integer;
        YearNo: Integer;
        DateTxt: Text[50];




    begin
        //date":"Thu, 27 Sep 2018 00:00:01
        DateTxt := copystr(inDateTxt, strpos(inDateTxt, ',') + 1);
        DateTxt := DelChr(DateTxt, '<', ' ');
        DayTxt := CopyStr(DateTxt, 1, StrPos(DateTxt, ' '));
        DateTxt := copystr(DateTxt, strpos(DateTxt, ' ') + 1);
        MonthTxt := CopyStr(DateTxt, 1, StrPos(DateTxt, ' '));
        DateTxt := copystr(DateTxt, strpos(DateTxt, ' ') + 1);
        YearTxt := CopyStr(DateTxt, 1, StrPos(DateTxt, ' '));
        evaluate(DayNo, DayTxt);
        evaluate(YearNo, YearTxt);
        case lowercase(delchr(MonthTxt, '=', ' ')) of
            'jan':
                MonthNo := 1;
            'feb':
                MonthNo := 2;
            'mar':
                MonthNo := 3;
            'apr':
                MonthNo := 4;
            'may':
                MonthNo := 5;
            'jun':
                MonthNo := 6;
            'jul':
                MonthNo := 7;
            'aug':
                MonthNo := 8;
            'sep':
                MonthNo := 9;
            'oct':
                MonthNo := 10;
            'nov':
                MonthNo := 11;
            'dec':
                MonthNo := 12;
        end;
        exit(DMY2Date(DayNo, MonthNo, YearNo));
    end;

    local procedure InsertCurrencyRate(inObject: JsonObject);
    var
        TokenName: Text[50];
        CurrencyRate: Record "Currency Exchange Rate";
        InvExchRate: Decimal;
        InvExchRateTxt: Text;

    begin
        CurrencyRate.init;
        TokenName := '$.' + LowerCurrCode + '.code';
        CurrencyRate."Currency Code" := format(SelectJsonToken(inObject, TokenName));
        CurrencyRate."Exchange Rate Amount" := 100;
        TokenName := '$.' + LowerCurrCode + '.inverseRate';
        InvExchRateTxt := format(SelectJsonToken(inObject, TokenNAme));
        evaluate(InvExchRate, format(SelectJsonToken(inObject, TokenName)));
        CurrencyRate."Relational Exch. Rate Amount" := InvExchRate;
        TokenName := '$.' + LowerCurrCode + '.date';
        CurrencyRate."Starting Date" := ConvertDate(format(SelectJsonToken(inObject, TokenName)));
        if CurrencyRate.Insert then;
    end;


    /// <summary>
    /// SelectJsonToken.
    /// </summary>
    /// <param name="JsonObject">JsonObject.</param>
    /// <param name="Path">text.</param>
    /// <returns>Return variable JsonToken of type JsonToken.</returns>
    procedure SelectJsonToken(JsonObject: JsonObject; Path: text) JsonToken: JsonToken
    begin
        if not JsonObject.SelectToken(Path, JsonToken) then
            Error('Could not find a token with path %1', Path);
    end;

}