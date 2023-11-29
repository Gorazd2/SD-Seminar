codeunit 50134 "CSD SeminarRegShowLedger"
{
    TableNo = "CSD Seminar Register";

    trigger OnRun();
    begin
        SeminarLedgerEntry.SETRANGE("Entry No.", Rec."From Entry No.", Rec."To Entry No.");
        page.Run(Page::"CSD Seminar Ledger Entries", SeminarLedgerEntry);
    end;

    var
        SeminarLedgerEntry: Record "CSD Seminar Ledger Entry";
}
