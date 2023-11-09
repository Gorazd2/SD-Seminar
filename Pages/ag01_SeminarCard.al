page 50101 "CSD Seminar Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "CSD Seminar";
    Caption = 'Seminar Card';
    
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    AssistEdit=true;
                    trigger OnAssistEdit();
                    begin 
                        if Rec.AssistEdit then
                          CurrPage.Update;
                    end;                                    
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }
                field("Search Name"; Rec."Search Name")
                { 
                    ApplicationArea = All; 
                }
                field("Seminar Duration"; Rec."Seminar Duration")
                { 
                    ApplicationArea = All; 
                }
                field("Minimum Participants"; Rec."Minimum Participants")
                { 
                    ApplicationArea = All; 
                }
                field("Maximum Participants"; Rec."Maximum Participants")
                { 
                    ApplicationArea = All; 
                }
                field("Blocked"; Rec.Blocked)
                { 
                    ApplicationArea = All; 
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                { 
                    ApplicationArea = All; 
                }

            }
             group(Invoicing) 
             {
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                { 
                    ApplicationArea = All; 
                }
                field("VAT Prod. Posting Group";Rec."VAT. Prod. Posting Group")
                { 
                    ApplicationArea = All; 
                }
                field("Seminar Price"; Rec."Seminar Price")
                { 
                    ApplicationArea = All; 
                }
             }


        }
        area(FactBoxes)
        {
            systempart("Links"; Links)
            {
                ApplicationArea = All;
            } 
            systempart("Notes"; Notes)
            { 
                ApplicationArea = All; 
            } 
        }
    }
    
    actions
    {
        area(Navigation)
        {
            group("Seminar")
            {
                action(ActionName)
                {
                    RunObject=page "Comment Sheet";
                    RunPageLink = "Table Name"=const("CSD Seimnar"),"No."=field("No.");
                    Image = Comment;
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ApplicationArea = All;
                }
            }
        }
    }
}
