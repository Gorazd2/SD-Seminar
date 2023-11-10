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
            }
        }
    }
}

