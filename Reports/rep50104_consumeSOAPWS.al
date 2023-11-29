report 50104 "DIR Consume SOAP WS"
{
    Caption = 'Consume SOAP WS';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    //DefaultRenderingLayout = LayoutName;
    ProcessingOnly = TRUE;
    UseRequestPage = FALSE;


    trigger OnPreReport()
    begin
        // if not client.Get(Url, Response) then
        //     Error(NoConnectTxt, url);
        // if not Response.IsSuccessStatusCode then
        //     Error(NoConnectTxt2, Response.HttpStatusCode, Response.ReasonPhrase);
        // Response.Content.ReadAs(JsonResponse);
        // JsonResponse := '['+JsonResponse+']';
        // Error('Error Text \%1', JsonResponse)
        XMLText := '<soap:Envelope ' +
                   'xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" ' +
                   'xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" ' +
                   'xmlns:xsd="http://www.w3.org/2001/XMLSchema">' +
                   '<soap:Body>' +
                   ' <ReadMultiple xmlns="urn:microsoft-dynamics-schemas/page/wscustomersoap">' +
                   '   <filter>' +
                   '     <Field>No</Field>' +
                   '     <Criteria />' +
                   '   </filter>' +
                   '   <bookmarkKey />' +
                   '   <setSize>0</setSize>' +
                   ' </ReadMultiple>' +
                   '</soap:Body>' +
                   '</soap:Envelope>';
        Url := 'http://navtraining:7047/BC140/WS/CRONUS%20International%20Ltd./Page/WSCustomerSOAP';


    end;

    var
        XMLText: Text;
        HttpContent: HttpContent;
        HttpRequestMessage: HttpRequestMessage;
        HttpHeaders: HttpHeaders;
        HttpClient: HttpClient;
        Url: Text;
        HttpResponse: HttpResponseMessage;
        XMLoptions: XmlReadOptions;
        XMLDoc: XmlDocument;
        XmlNodeList: XmlNodeList;
        XmlNode: XmlNode;
        TempCust: Record Customer temporary;
        BalanceLCY: Decimal;
}