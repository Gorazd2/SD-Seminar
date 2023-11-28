table 50140 "CSD Seminar Cue"
{
    DataClassification = ToBeClassified;
    Caption = 'Seminar Cue';

    fields
    {
        field(10; "Primary Key"; Code[10])
        {
            DataClassification = SystemMetadata;
        }
        field(20; Planned; Integer)
        {
            Caption = 'Planned';
            FieldClass = FlowField;
            CalcFormula = Count("CSD Seminar Reg. Header" where(Status = const(Planning)));
        }
        field(30; Registered; Integer)
        {
            Caption = 'Registered';
            FieldClass = FlowField;
            CalcFormula = Count("CSD Seminar Reg. Header" where(Status = const(Registration)));
        }
        field(40; Closed; Integer)
        {
            Caption = 'Closed';
            FieldClass = FlowField;
            CalcFormula = Count("CSD Seminar Reg. Header" where(Status = const(Closed)));
        }
        field(50; "Job Queue Errors"; Integer)
        {
            Caption = 'Job Queue Errors';
            FieldClass = FlowField;
            CalcFormula = Count("Job Queue Entry" where(Status = const(Error)));
            Editable = false;
        }
        field(60; "Job Queues on-hold"; Integer)
        {
            Caption = 'Job Queues on-hold';
            FieldClass = FlowField;
            CalcFormula = Count("Job Queue Entry" where(Status = const("On Hold")));
            Editable = false;
        }
    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}