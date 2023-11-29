codeunit 50149 "CSD InstallSeminar"
{
    Subtype = Install;

    trigger OnInstallAppPerCompany();
    var
        Webservice: Record "Web Service Aggregate";
        UpdradeTag: Codeunit "Upgrade Tag";
        WebServiceMgt: Codeunit "Web Service Management";
        WebServiceCreatedTxt: LAbel 'WebServiceCreatedTxt';
        SettingsUpdatedForSeminarUsersTxt: Label 'SettingsUpdatedForSeminarUsersTxt';


    begin
        if UpdradeTag.hasupgradetag(WebserviceCreatedTxt) then begin
            WebServiceMgt.CreateTenantWebService(Webservice."Object Type"::Page, 50143, 'WSCustomers', true);
            UpdradeTag.SetUpgradeTag(WebServiceCreatedTxt);
        end;
        if SeminarSetup.Get() then
            exit;
        InitSetup();
        CreateSeminar();
        CreateResources();
    end;

    local procedure InitSetup();
    var
        NoSerie: Record "No. Series";
        NoSerieLine: Record "No. Series Line";

        SourceCodeSetup: Record "Source Code Setup";
        SourceCode: Record "Source Code";
    begin
        SeminarSetup.Init();

        NoSerie.Code := 'SEM';
        NoSerie.Description := 'Seminars';
        NoSerie."Default Nos." := true;
        NoSerie."Manual Nos." := true;

        if NoSerie.Insert() then;

        NoSerieLine."Series Code" := NoSerie.Code;
        NoSerieLine."Starting No." := 'SEM0000';
        if NoSerieLine.Insert() then;
        SeminarSetup."Seminar Nos." := NoSerie.code;

        NoSerie.Code := 'SEMREG';
        NoSerie.Description := 'Seminar Registrations';
        NoSerie."Default Nos." := true;
        NoSerie."Manual Nos." := false;
        if NoSerie.Insert() then;

        NoSerieLine."Series Code" := NoSerie.Code;
        NoSerieLine."Starting No." := 'SEMREG0000';
        if NoSerieLine.Insert() then;
        SeminarSetup."Seminar Registration Nos." := NoSerie.code;

        NoSerie.Code := 'SEMREGPOST';
        NoSerie.Description := 'Posted Seminar Registrations';
        NoSerie."Default Nos." := true;
        NoSerie."Manual Nos." := true;
        if NoSerie.Insert() then;

        NoSerieLine."Series Code" := NoSerie.Code;
        NoSerieLine."Starting No." := 'SEMPREG0000';
        if NoSerieLine.Insert() then;
        SeminarSetup."Posted Seminar Reg. Nos." := NoSerie.code;

        if SeminarSetup.Insert() then;

        SourceCode.Code := 'SEMINAR';
        if SourceCode.Insert() then;
        SourceCodeSetup.Get();
        //SourceCodeSetup."CSD Seminar" := 'SEMINAR';
        SourceCodeSetup.Modify();
    end;

    local procedure CreateSeminar();
    var
        Seminar: Record "CSD Seminar";
    //Course: Record Course;
    begin
        // if Course.FindSet() then
        //     repeat
        //         Seminar."No." := Course.Code;
        //         Seminar.Validate(Name, Course.Description);
        //         Seminar.Validate("Gen. Prod. Posting Group", 'MISC');
        //         Seminar."Maximum Participants" := 12;
        //         Seminar."Minimum Participants" := 4;
        //         Seminar."Seminar Duration" := Course.Duration;
        //         Seminar."Seminar Price" := Course.Price;
        //         if Seminar.Insert()  then;
        //     until course.Next() = 0;
    end;

    local procedure CreateResources();
    var
        Resource: Record Resource;
    begin
        Resource.Init();
        Resource."No." := 'INSTR';
        if Resource.Insert() then;
        Resource.Name := 'Mr. Instructor';
        Resource.validate("Gen. Prod. Posting Group", 'MISC');
        Resource."Direct Unit Cost" := 100;
        Resource."CSD Quantity Per Day" := 8;
        Resource.Type := Resource.Type::Person;
        if Resource.Modify() then;
        Resource."No." := 'ROOM 01';
        if Resource.Insert() then;
        Resource.Name := 'Room 01';
        Resource.Type := Resource.Type::Machine;
        if Resource.Modify() then;
    end;

    var
        SeminarSetup: Record "CSD Seminar Setup";
}