codeunit 50102 SeminarRegPrinted
{
    TableNo = "CSD Seminar Reg. Header";

    trigger OnRun();
    begin
        Rec.Find();
        Rec."No. Printed" += 1;
        Rec.Modify();
        Commit();
    end;
}
