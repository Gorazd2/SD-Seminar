codeunit 50104 "DIR Install Customer API"

{
    Subtype = Install;

    trigger OnInstallAppPerCompany()
    var
        WebServiceMgt: Codeunit "Web Service Management";
        ObjectType2: Option TableData,Table,,Report,,Codeunit,XMLport,MenuSuite,Page,Query,System,FieldNumber;
    begin
        WebServiceMgt.CreateTenantWebService(ObjectType2::Page, Page::"DIR WS Customer SOAP", 'wsCustomerSOAP', true);
        WebServiceMgt.CreateTenantWebService(ObjectType2::Page, Page::"DIR WS Customer OData", 'wsCustomerSOAP', true);
        WebServiceMgt.CreateTenantWebService(ObjectType2::Page, Page::"DIR WS Customer API", 'wsCustomerAPI', true);
    end;
}