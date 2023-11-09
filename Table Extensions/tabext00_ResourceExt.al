tableextension 50100 "CSD Resource" extends Resource
{
    fields
    {
        field(50101; "CSD Resource Type"; Option)
        {
            Caption = 'Resource Type';
            DataClassification = AccountData;
            OptionMembers = "Internal","External";
        }

        field(50102; "CSD Maximum Participants"; Integer)
        {
            Caption = 'Maximum Paricipants';
        }
        field(50103; "CSD Quantity Per Day"; Decimal)
        {
            Caption = 'Quanity Per Day';
        }
    }
}