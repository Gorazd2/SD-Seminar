page 50102 "CSD Seminar List"
{
    ApplicationArea = All;
    Caption = 'Seminar List';
    PageType = List;
    SourceTable = "CSD Seminar";
    Editable = false;
    CardPageId = 50101;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }
                field("Seminar Duration"; Rec."Seminar Duration") { ApplicationArea = All; }
                field("Seminar Price"; Rec."Seminar Price") { ApplicationArea = All; }
                field("Minimum Participants"; Rec."Minimum Participants") { ApplicationArea = All; }
                field("Maximum Participants"; Rec."Maximum Participants") { ApplicationArea = All; }
            }
        }
        area(FactBoxes)
        {
            systempart("Links"; Links) { ApplicationArea = All; }
            systempart("Notes"; Notes) { ApplicationArea = All; }
        }
    }
    actions
    {
        area(Navigation)
        {
            group("Seminar")
            {
                action("Comments")
                {
                    RunObject = page "Comment Sheet";
                    RunPageLink = "Table Name" = const("CSD Seminar"), "No." = field("No.");
                    Image = Comment;
                    ApplicationArea = All;
                }
                action("Ledger Entries")
                {
                    Caption = 'Ledger Entries';
                    RunObject = page "CSD Seminar Ledger Entries";
                    RunPageLink = "Seminar No." = field("No.");
                    ShortcutKey = "Ctrl+F7";
                    Image = WarrantyLedger;
                }

                action("Registrations")
                {
                    Caption = 'Registrations';
                    RunObject = page "CSD Seminar Registration List";
                    RunPageLink = "Seminar No." = field("No.");
                    Image = Timesheet;
                }


            }
        }

        area(Processing)
        {
            action("Seminar Registration")
            {
                RunObject = page "CSD Seminar Registration";
                RunPageLink = "Seminar No." = field("No.");
                RunPageMode = Create;
                Image = NewTimesheet;
            }
        }
        area(Promoted)
        {
            group(Category_New)
            {
                actionref("Seminar Registration_Promoted"; "Seminar Registration")
                {
                }
            }
            group(Category_Process)
            {
                actionref("Ledger Entries_Promoted"; "Ledger Entries")
                {
                }
                actionref(Registrations_Promoted; Registrations)
                {
                }
            }
        }
    }
}
