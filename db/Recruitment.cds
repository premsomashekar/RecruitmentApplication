namespace app.recruitment;

using {Country} from '@sap/cds/common';
using {sap.common.CodeList} from '@sap/cds/common';

type BusinessKey : String(10);
type ManagerId   : String(10);
type RecruiterId : String(10);
type SDate       : DateTime;
type LText       : String(1024);

entity Job_Type : CodeList {
    key code : String(1)
};

type JobType     : Association to one Job_Type;

entity Job_Listing {
    key ID              : Integer;
        JOB_DESCRIPTION : Composition of many Job_Description
                              on JOB_DESCRIPTION.INTHeader = $self;
        JOB_TYPE        : JobType;
        POSTING_DATE    : SDate;
        COUNTRY         : Country;
        Manager         : ManagerId;
        Recruiter       : RecruiterId;

};

entity Job_Description {

    key INTHeader : Association to Job_Listing;
    key TEXT_ID   : BusinessKey;
        LANGU     : String(2);
        LOGTEXT   : LText;
};
