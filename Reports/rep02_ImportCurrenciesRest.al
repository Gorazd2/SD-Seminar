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
        Error('Error Text \%1', JsonResponse)

    end;

    var
        client: HttpClient;
        Response: HttpResponseMessage;
        JsonResponse: Text;
        Url: label 'https://www.floatrates.com/daily/gbp.json';
        NoConnectTxt: label 'Error getting response from server';
        NoConnectTxt2: label 'Error getting response from server - Error is %1 Error is %2', comment = '%1 = Status - %2 Error Text';
}