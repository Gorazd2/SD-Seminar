page 50123 "CSD Seminar Report Selection"
{
    // CSD1.00 - 2018-01-01 - D. E. Veloper
    //   Chapter 9 - Lab 1
    //     - Created new page

    Caption = 'Seminar Report Selection';
    PageType = Worksheet;
    SaveValues = true;
    SourceTable = "CSD Seminar Report Selections";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            field(ReportUsage2; ReportUsage2)
            {
                Caption = 'Usage';
                OptionCaption = 'Registration';
                ApplicationArea = All;

                trigger OnValidate();
                begin
                    SetUsageFilter();
                    ReportUsage2OnAfterValidate();
                end;
            }
            repeater(General)
            {
                field(Sequence; Rec.Sequence)
                {
                    ApplicationArea = All;
                }
                field("Report ID"; REc."Report ID")
                {
                    LookupPageID = "All Objects With Caption";
                    ApplicationArea = All;
                }
                field("Report Name"; Rec."Report Name")
                {
                    DrillDown = false;
                    LookupPageID = "All Objects With Caption";
                    ApplicationArea = All;
                }
            }
        }
        area(factboxes)
        {
            systempart("Links"; Links)
            {
                Visible = false;
                ApplicationArea = All;
            }
            systempart("Notes"; Notes)
            {
                Visible = false;
                ApplicationArea = All;
            }
        }
    }


    trigger OnNewRecord(BelowxRec: Boolean);
    begin
        Rec.NewRecord();
    end;

    trigger OnOpenPage();
    begin
        SetUsageFilter();
    end;

    var
        ReportUsage2: Option Registration;

    local procedure SetUsageFilter();
    begin
        Rec.FILTERGROUP(2);
        CASE ReportUsage2 OF
            ReportUsage2::Registration:
                Rec.SETRANGE(Usage, REc.Usage::Registration);
        end;
        Rec.FILTERGROUP(0);
    end;

    local procedure ReportUsage2OnAfterValidate();
    begin
        CurrPage.Update();
    end;
}

