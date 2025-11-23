#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class Search {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static SI_TEMPORARY => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static SUBSINFO_ALLFLAGS => 61311

    /**
     * @type {Integer (UInt32)}
     */
    static RS_READY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RS_SUSPENDED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RS_UPDATING => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RS_SUSPENDONIDLE => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static RS_MAYBOTHERUSER => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static RS_COMPLETED => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static SUBSMGRUPDATE_MINIMIZE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBSMGRUPDATE_MASK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBSMGRENUM_TEMP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBSMGRENUM_MASK => 1

    /**
     * @type {Integer (Int32)}
     */
    static INET_E_AGENT_MAX_SIZE_EXCEEDED => -2146693248

    /**
     * @type {Integer (Int32)}
     */
    static INET_S_AGENT_PART_FAIL => 790401

    /**
     * @type {Integer (Int32)}
     */
    static INET_E_AGENT_CACHE_SIZE_EXCEEDED => -2146693246

    /**
     * @type {Integer (Int32)}
     */
    static INET_E_AGENT_CONNECTION_FAILED => -2146693245

    /**
     * @type {Integer (Int32)}
     */
    static INET_E_SCHEDULED_UPDATES_DISABLED => -2146693244

    /**
     * @type {Integer (Int32)}
     */
    static INET_E_SCHEDULED_UPDATES_RESTRICTED => -2146693243

    /**
     * @type {Integer (Int32)}
     */
    static INET_E_SCHEDULED_UPDATE_INTERVAL => -2146693242

    /**
     * @type {Integer (Int32)}
     */
    static INET_E_SCHEDULED_EXCLUDE_RANGE => -2146693241

    /**
     * @type {Integer (Int32)}
     */
    static INET_E_AGENT_EXCEEDING_CACHE_SIZE => -2146693232

    /**
     * @type {Integer (Int32)}
     */
    static INET_S_AGENT_INCREASED_CACHE_SIZE => 790416

    /**
     * @type {Integer (UInt32)}
     */
    static OLEDBVER => 624

    /**
     * @type {Integer (UInt32)}
     */
    static DB_NULL_HACCESSOR => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DB_INVALID_HACCESSOR => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DB_NULL_HROW => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DB_NULL_HCHAPTER => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DB_INVALID_HCHAPTER => 0

    /**
     * @type {Integer (UInt32)}
     */
    static STD_BOOKMARKLENGTH => 1

    /**
     * @type {Guid}
     */
    static DBCIDGUID => Guid("{0c733a81-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * @type {Guid}
     */
    static DB_NULLGUID => Guid("{00000000-0000-0000-0000-000000000000}")

    /**
     * @type {Guid}
     */
    static DBGUID_ROWURL => Guid("{0c733ab6-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * @type {Guid}
     */
    static DBGUID_ROWDEFAULTSTREAM => Guid("{0c733ab7-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_BMK_NUMERIC => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_BMK_KEY => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_CL_START => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_CL_END => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_CU_DML_STATEMENTS => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_CU_TABLE_DEFINITION => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_CU_INDEX_DEFINITION => 4

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_CU_PRIVILEGE_DEFINITION => 8

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_CD_NOTNULL => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_CB_NULL => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_CB_NON_NULL => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_FU_NOT_SUPPORTED => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_FU_COLUMN => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_FU_TABLE => 4

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_FU_CATALOG => 8

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_GB_NOT_SUPPORTED => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_GB_EQUALS_SELECT => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_GB_CONTAINS_SELECT => 4

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_GB_NO_RELATION => 8

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_HT_DIFFERENT_CATALOGS => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_HT_DIFFERENT_PROVIDERS => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_IC_UPPER => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_IC_LOWER => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_IC_SENSITIVE => 4

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_IC_MIXED => 8

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_LM_NONE => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_LM_READ => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_LM_INTENT => 4

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_LM_RITE => 8

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_NP_OKTODO => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_NP_ABOUTTODO => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_NP_SYNCHAFTER => 4

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_NP_FAILEDTODO => 8

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_NP_DIDEVENT => 16

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_NC_END => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_NC_HIGH => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_NC_LOW => 4

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_NC_START => 8

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_OO_BLOB => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_OO_IPERSIST => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_CB_DELETE => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_CB_PRESERVE => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_SU_DML_STATEMENTS => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_SU_TABLE_DEFINITION => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_SU_INDEX_DEFINITION => 4

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_SU_PRIVILEGE_DEFINITION => 8

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_SQ_CORRELATEDSUBQUERIES => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_SQ_COMPARISON => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_SQ_EXISTS => 4

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_SQ_IN => 8

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_SQ_QUANTIFIED => 16

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_SQ_TABLE => 32

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_SS_ISEQUENTIALSTREAM => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_SS_ISTREAM => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_SS_ISTORAGE => 4

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_SS_ILOCKBYTES => 8

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_TI_CHAOS => 16

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_TI_READUNCOMMITTED => 256

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_TI_BROWSE => 256

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_TI_CURSORSTABILITY => 4096

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_TI_READCOMMITTED => 4096

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_TI_REPEATABLEREAD => 65536

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_TI_SERIALIZABLE => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_TI_ISOLATED => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_TR_COMMIT_DC => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_TR_COMMIT => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_TR_COMMIT_NO => 4

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_TR_ABORT_DC => 8

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_TR_ABORT => 16

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_TR_ABORT_NO => 32

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_TR_DONTCARE => 64

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_TR_BOTH => 128

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_TR_NONE => 256

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_TR_OPTIMISTIC => 512

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_RT_FREETHREAD => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_RT_APTMTTHREAD => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_RT_SINGLETHREAD => 4

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_UP_CHANGE => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_UP_DELETE => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_UP_INSERT => 4

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_SQL_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_SQL_ODBC_MINIMUM => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_SQL_ODBC_CORE => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_SQL_ODBC_EXTENDED => 4

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_SQL_ANSI89_IEF => 8

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_SQL_ANSI92_ENTRY => 16

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_SQL_FIPS_TRANSITIONAL => 32

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_SQL_ANSI92_INTERMEDIATE => 64

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_SQL_ANSI92_FULL => 128

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_SQL_ESCAPECLAUSES => 256

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_IT_BTREE => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_IT_HASH => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_IT_CONTENT => 3

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_IT_OTHER => 4

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_IN_DISALLOWNULL => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_IN_IGNORENULL => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_IN_IGNOREANYNULL => 4

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_TC_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_TC_DML => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_TC_DDL_COMMIT => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_TC_DDL_IGNORE => 4

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_TC_ALL => 8

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_OA_NOTSUPPORTED => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_OA_ATEXECUTE => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_OA_ATROWRELEASE => 4

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_MR_NOTSUPPORTED => 0

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_MR_SUPPORTED => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_MR_CONCURRENT => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_PT_GUID_NAME => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_PT_GUID_PROPID => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_PT_NAME => 4

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_PT_GUID => 8

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_PT_PROPID => 16

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_PT_PGUID_NAME => 32

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_PT_PGUID_PROPID => 64

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_NT_SINGLEROW => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_NT_MULTIPLEROWS => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_ASYNCH_INITIALIZE => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_ASYNCH_SEQUENTIALPOPULATION => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_ASYNCH_RANDOMPOPULATION => 4

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_OP_EQUAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_OP_RELATIVE => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_OP_STRING => 4

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_CO_EQUALITY => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_CO_STRING => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_CO_CASESENSITIVE => 4

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_CO_CASEINSENSITIVE => 8

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_CO_CONTAINS => 16

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_CO_BEGINSWITH => 32

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_ASYNCH_BACKGROUNDPOPULATION => 8

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_ASYNCH_PREPOPULATE => 16

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_ASYNCH_POPULATEONDEMAND => 32

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_LM_SINGLEROW => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_SQL_SUBMINIMUM => 512

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_DST_TDP => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_DST_MDP => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_DST_TDPANDMDP => 3

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_AU_UNSUPPORTED => 0

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_AU_UNCHANGED => 1

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_AU_UNKNOWN => 2

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_MF_WITH_CALCMEMBERS => 1

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_MF_WITH_NAMEDSETS => 2

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_MF_CREATE_CALCMEMBERS => 4

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_MF_CREATE_NAMEDSETS => 8

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_MF_SCOPE_SESSION => 16

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_MF_SCOPE_GLOBAL => 32

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_MMF_COUSIN => 1

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_MMF_PARALLELPERIOD => 2

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_MMF_OPENINGPERIOD => 4

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_MMF_CLOSINGPERIOD => 8

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_MNF_MEDIAN => 1

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_MNF_VAR => 2

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_MNF_STDDEV => 4

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_MNF_RANK => 8

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_MNF_AGGREGATE => 16

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_MNF_COVARIANCE => 32

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_MNF_CORRELATION => 64

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_MNF_LINREGSLOPE => 128

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_MNF_LINREGVARIANCE => 256

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_MNF_LINREG2 => 512

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_MNF_LINREGPOINT => 1024

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_MNF_DRILLDOWNLEVEL => 2048

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_MNF_DRILLDOWNMEMBERTOP => 4096

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_MNF_DRILLDOWNMEMBERBOTTOM => 8192

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_MNF_DRILLDOWNLEVELTOP => 16384

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_MNF_DRILLDOWNLEVELBOTTOM => 32768

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_MNF_DRILLUPMEMBER => 65536

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_MNF_DRILLUPLEVEL => 131072

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_MSF_TOPPERCENT => 1

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_MSF_BOTTOMPERCENT => 2

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_MSF_TOPSUM => 4

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_MSF_BOTTOMSUM => 8

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_MSF_PERIODSTODATE => 16

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_MSF_LASTPERIODS => 32

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_MSF_YTD => 64

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_MSF_QTD => 128

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_MSF_MTD => 256

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_MSF_WTD => 512

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_MSF_DRILLDOWNMEMBBER => 1024

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_MSF_DRILLDOWNLEVEL => 2048

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_MSF_DRILLDOWNMEMBERTOP => 4096

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_MSF_DRILLDOWNMEMBERBOTTOM => 8192

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_MSF_DRILLDOWNLEVELTOP => 16384

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_MSF_DRILLDOWNLEVELBOTTOM => 32768

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_MSF_DRILLUPMEMBER => 65536

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_MSF_DRILLUPLEVEL => 131072

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_MSF_TOGGLEDRILLSTATE => 262144

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_MD_SELF => 1

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_MD_BEFORE => 2

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_MD_AFTER => 4

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_MSC_LESSTHAN => 1

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_MSC_GREATERTHAN => 2

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_MSC_LESSTHANEQUAL => 4

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_MSC_GREATERTHANEQUAL => 8

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_MC_SINGLECASE => 1

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_MC_SEARCHEDCASE => 2

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_MOQ_OUTERREFERENCE => 1

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_MOQ_DATASOURCE_CUBE => 1

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_MOQ_CATALOG_CUBE => 2

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_MOQ_SCHEMA_CUBE => 4

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_MOQ_CUBE_DIM => 8

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_MOQ_DIM_HIER => 16

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_MOQ_DIMHIER_LEVEL => 32

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_MOQ_LEVEL_MEMBER => 64

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_MOQ_MEMBER_MEMBER => 128

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_MOQ_DIMHIER_MEMBER => 256

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_FS_FULL_SUPPORT => 1

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_FS_GENERATED_COLUMN => 2

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_FS_GENERATED_DIMENSION => 3

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_FS_NO_SUPPORT => 4

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_NL_NAMEDLEVELS => 1

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_NL_NUMBEREDLEVELS => 2

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_MJC_SINGLECUBE => 1

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_MJC_MULTICUBES => 2

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_MJC_IMPLICITCUBE => 4

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_RR_NORANGEROWSET => 1

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_RR_READONLY => 2

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_RR_UPDATE => 4

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_MS_MULTIPLETUPLES => 1

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_MS_SINGLETUPLE => 2

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_NME_ALLDIMENSIONS => 0

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_NME_MEASURESONLY => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_AO_SEQUENTIAL => 0

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_AO_SEQUENTIALSTORAGEOBJECTS => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_AO_RANDOM => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_BD_ROWSET => 0

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_BD_INTRANSACTION => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_BD_XTRANSACTION => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_BD_REORGANIZATION => 3

    /**
     * @type {Integer (Int32)}
     */
    static BMK_DURABILITY_ROWSET => 0

    /**
     * @type {Integer (Int32)}
     */
    static BMK_DURABILITY_INTRANSACTION => 1

    /**
     * @type {Integer (Int32)}
     */
    static BMK_DURABILITY_XTRANSACTION => 2

    /**
     * @type {Integer (Int32)}
     */
    static BMK_DURABILITY_REORGANIZATION => 3

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_BO_NOLOG => 0

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_BO_NOINDEXUPDATE => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_BO_REFINTEGRITY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DBPROPVAL_STGM_DIRECT => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static DBPROPVAL_STGM_TRANSACTED => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static DBPROPVAL_STGM_CONVERT => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static DBPROPVAL_STGM_FAILIFTHERE => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static DBPROPVAL_STGM_PRIORITY => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static DBPROPVAL_STGM_DELETEONRELEASE => 2097152

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_GB_COLLATE => 16

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_CS_UNINITIALIZED => 0

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_CS_INITIALIZED => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_CS_COMMUNICATIONFAILURE => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_RD_RESETALL => -1

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_OS_RESOURCEPOOLING => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_OS_TXNENLISTMENT => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_OS_CLIENTCURSOR => 4

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_OS_ENABLEALL => -1

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_BI_CROSSROWSET => 1

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_NL_SCHEMAONLY => 4

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_OS_DISABLEALL => 0

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_OO_ROWOBJECT => 4

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_OO_SCOPED => 8

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_OO_DIRECTBIND => 16

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_DST_DOCSOURCE => 4

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_GU_NOTSUPPORTED => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_GU_SUFFIX => 2

    /**
     * @type {Integer (Int32)}
     */
    static DB_BINDFLAGS_DELAYFETCHCOLUMNS => 1

    /**
     * @type {Integer (Int32)}
     */
    static DB_BINDFLAGS_DELAYFETCHSTREAM => 2

    /**
     * @type {Integer (Int32)}
     */
    static DB_BINDFLAGS_RECURSIVE => 4

    /**
     * @type {Integer (Int32)}
     */
    static DB_BINDFLAGS_OUTPUT => 8

    /**
     * @type {Integer (Int32)}
     */
    static DB_BINDFLAGS_COLLECTION => 16

    /**
     * @type {Integer (Int32)}
     */
    static DB_BINDFLAGS_OPENIFEXISTS => 32

    /**
     * @type {Integer (Int32)}
     */
    static DB_BINDFLAGS_OVERWRITE => 64

    /**
     * @type {Integer (Int32)}
     */
    static DB_BINDFLAGS_ISSTRUCTUREDDOCUMENT => 128

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_ORS_TABLE => 0

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_ORS_INDEX => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_ORS_INTEGRATEDINDEX => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_TC_DDL_LOCK => 16

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_ORS_STOREDPROC => 4

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_IN_ALLOWNULL => 0

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_OO_SINGLETON => 32

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_OS_AGR_AFTERSESSION => 8

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_CM_TRANSACTIONS => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_TS_CARDINALITY => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_TS_HISTOGRAM => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPVAL_ORS_HISTOGRAM => 8

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_VISUAL_MODE_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_VISUAL_MODE_VISUAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static MDPROPVAL_VISUAL_MODE_VISUAL_OFF => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DB_IMP_LEVEL_ANONYMOUS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DB_IMP_LEVEL_IDENTIFY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DB_IMP_LEVEL_IMPERSONATE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DB_IMP_LEVEL_DELEGATE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DBPROMPT_PROMPT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DBPROMPT_COMPLETE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DBPROMPT_COMPLETEREQUIRED => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DBPROMPT_NOPROMPT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DB_PROT_LEVEL_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DB_PROT_LEVEL_CONNECT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DB_PROT_LEVEL_CALL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DB_PROT_LEVEL_PKT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DB_PROT_LEVEL_PKT_INTEGRITY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DB_PROT_LEVEL_PKT_PRIVACY => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DB_MODE_READ => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DB_MODE_WRITE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DB_MODE_READWRITE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DB_MODE_SHARE_DENY_READ => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DB_MODE_SHARE_DENY_WRITE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DB_MODE_SHARE_EXCLUSIVE => 12

    /**
     * @type {Integer (UInt32)}
     */
    static DB_MODE_SHARE_DENY_NONE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DBCOMPUTEMODE_COMPUTED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DBCOMPUTEMODE_DYNAMIC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DBCOMPUTEMODE_NOTCOMPUTED => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DBPROPVAL_DF_INITIALLY_DEFERRED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DBPROPVAL_DF_INITIALLY_IMMEDIATE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DBPROPVAL_DF_NOT_DEFERRABLE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DBPARAMTYPE_INPUT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DBPARAMTYPE_INPUTOUTPUT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DBPARAMTYPE_OUTPUT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DBPARAMTYPE_RETURNVALUE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DB_PT_UNKNOWN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DB_PT_PROCEDURE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DB_PT_FUNCTION => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DB_REMOTE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DB_LOCAL_SHARED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DB_LOCAL_EXCLUSIVE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DB_COLLATION_ASC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DB_COLLATION_DESC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DB_UNSEARCHABLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DB_LIKE_ONLY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DB_ALL_EXCEPT_LIKE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DB_SEARCHABLE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MDTREEOP_CHILDREN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MDTREEOP_SIBLINGS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MDTREEOP_PARENT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MDTREEOP_SELF => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MDTREEOP_DESCENDANTS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MDTREEOP_ANCESTORS => 32

    /**
     * @type {Integer (UInt32)}
     */
    static MD_DIMTYPE_UNKNOWN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MD_DIMTYPE_TIME => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MD_DIMTYPE_MEASURE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MD_DIMTYPE_OTHER => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MDLEVEL_TYPE_UNKNOWN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MDLEVEL_TYPE_REGULAR => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MDLEVEL_TYPE_ALL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MDLEVEL_TYPE_CALCULATED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MDLEVEL_TYPE_TIME => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MDLEVEL_TYPE_RESERVED1 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MDLEVEL_TYPE_TIME_YEARS => 20

    /**
     * @type {Integer (UInt32)}
     */
    static MDLEVEL_TYPE_TIME_HALF_YEAR => 36

    /**
     * @type {Integer (UInt32)}
     */
    static MDLEVEL_TYPE_TIME_QUARTERS => 68

    /**
     * @type {Integer (UInt32)}
     */
    static MDLEVEL_TYPE_TIME_MONTHS => 132

    /**
     * @type {Integer (UInt32)}
     */
    static MDLEVEL_TYPE_TIME_WEEKS => 260

    /**
     * @type {Integer (UInt32)}
     */
    static MDLEVEL_TYPE_TIME_DAYS => 516

    /**
     * @type {Integer (UInt32)}
     */
    static MDLEVEL_TYPE_TIME_HOURS => 772

    /**
     * @type {Integer (UInt32)}
     */
    static MDLEVEL_TYPE_TIME_MINUTES => 1028

    /**
     * @type {Integer (UInt32)}
     */
    static MDLEVEL_TYPE_TIME_SECONDS => 2052

    /**
     * @type {Integer (UInt32)}
     */
    static MDLEVEL_TYPE_TIME_UNDEFINED => 4100

    /**
     * @type {Integer (UInt32)}
     */
    static MDMEASURE_AGGR_UNKNOWN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MDMEASURE_AGGR_SUM => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MDMEASURE_AGGR_COUNT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MDMEASURE_AGGR_MIN => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MDMEASURE_AGGR_MAX => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MDMEASURE_AGGR_AVG => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MDMEASURE_AGGR_VAR => 6

    /**
     * @type {Integer (UInt32)}
     */
    static MDMEASURE_AGGR_STD => 7

    /**
     * @type {Integer (UInt32)}
     */
    static MDMEASURE_AGGR_CALCULATED => 127

    /**
     * @type {Integer (UInt32)}
     */
    static MDPROP_MEMBER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MDPROP_CELL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MDMEMBER_TYPE_UNKNOWN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MDMEMBER_TYPE_REGULAR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MDMEMBER_TYPE_ALL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MDMEMBER_TYPE_MEASURE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MDMEMBER_TYPE_FORMULA => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MDMEMBER_TYPE_RESERVE1 => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MDMEMBER_TYPE_RESERVE2 => 6

    /**
     * @type {Integer (UInt32)}
     */
    static MDMEMBER_TYPE_RESERVE3 => 7

    /**
     * @type {Integer (UInt32)}
     */
    static MDMEMBER_TYPE_RESERVE4 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MDDISPINFO_DRILLED_DOWN => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static MDDISPINFO_PARENT_SAME_AS_PREV => 131072

    /**
     * @type {Integer (Int32)}
     */
    static DB_COUNTUNAVAILABLE => -1

    /**
     * @type {Integer (UInt32)}
     */
    static MDFF_BOLD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MDFF_ITALIC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MDFF_UNDERLINE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MDFF_STRIKEOUT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MDAXIS_COLUMNS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MDAXIS_ROWS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MDAXIS_PAGES => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MDAXIS_SECTIONS => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MDAXIS_CHAPTERS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MDAXIS_SLICERS => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static CRESTRICTIONS_DBSCHEMA_ASSERTIONS => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CRESTRICTIONS_DBSCHEMA_CATALOGS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CRESTRICTIONS_DBSCHEMA_CHARACTER_SETS => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CRESTRICTIONS_DBSCHEMA_COLLATIONS => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CRESTRICTIONS_DBSCHEMA_COLUMNS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CRESTRICTIONS_DBSCHEMA_CHECK_CONSTRAINTS => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CRESTRICTIONS_DBSCHEMA_CONSTRAINT_COLUMN_USAGE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CRESTRICTIONS_DBSCHEMA_CONSTRAINT_TABLE_USAGE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CRESTRICTIONS_DBSCHEMA_KEY_COLUMN_USAGE => 7

    /**
     * @type {Integer (UInt32)}
     */
    static CRESTRICTIONS_DBSCHEMA_REFERENTIAL_CONSTRAINTS => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CRESTRICTIONS_DBSCHEMA_TABLE_CONSTRAINTS => 7

    /**
     * @type {Integer (UInt32)}
     */
    static CRESTRICTIONS_DBSCHEMA_COLUMN_DOMAIN_USAGE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CRESTRICTIONS_DBSCHEMA_INDEXES => 5

    /**
     * @type {Integer (UInt32)}
     */
    static CRESTRICTIONS_DBSCHEMA_OBJECT_ACTIONS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CRESTRICTIONS_DBSCHEMA_OBJECTS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CRESTRICTIONS_DBSCHEMA_COLUMN_PRIVILEGES => 6

    /**
     * @type {Integer (UInt32)}
     */
    static CRESTRICTIONS_DBSCHEMA_TABLE_PRIVILEGES => 5

    /**
     * @type {Integer (UInt32)}
     */
    static CRESTRICTIONS_DBSCHEMA_USAGE_PRIVILEGES => 6

    /**
     * @type {Integer (UInt32)}
     */
    static CRESTRICTIONS_DBSCHEMA_PROCEDURES => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CRESTRICTIONS_DBSCHEMA_SCHEMATA => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CRESTRICTIONS_DBSCHEMA_SQL_LANGUAGES => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CRESTRICTIONS_DBSCHEMA_STATISTICS => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CRESTRICTIONS_DBSCHEMA_TABLES => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CRESTRICTIONS_DBSCHEMA_TRANSLATIONS => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CRESTRICTIONS_DBSCHEMA_PROVIDER_TYPES => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CRESTRICTIONS_DBSCHEMA_VIEWS => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CRESTRICTIONS_DBSCHEMA_VIEW_COLUMN_USAGE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CRESTRICTIONS_DBSCHEMA_VIEW_TABLE_USAGE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CRESTRICTIONS_DBSCHEMA_PROCEDURE_PARAMETERS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CRESTRICTIONS_DBSCHEMA_FOREIGN_KEYS => 6

    /**
     * @type {Integer (UInt32)}
     */
    static CRESTRICTIONS_DBSCHEMA_PRIMARY_KEYS => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CRESTRICTIONS_DBSCHEMA_PROCEDURE_COLUMNS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CRESTRICTIONS_DBSCHEMA_TABLES_INFO => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CRESTRICTIONS_MDSCHEMA_CUBES => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CRESTRICTIONS_MDSCHEMA_DIMENSIONS => 5

    /**
     * @type {Integer (UInt32)}
     */
    static CRESTRICTIONS_MDSCHEMA_HIERARCHIES => 6

    /**
     * @type {Integer (UInt32)}
     */
    static CRESTRICTIONS_MDSCHEMA_LEVELS => 7

    /**
     * @type {Integer (UInt32)}
     */
    static CRESTRICTIONS_MDSCHEMA_MEASURES => 5

    /**
     * @type {Integer (UInt32)}
     */
    static CRESTRICTIONS_MDSCHEMA_PROPERTIES => 9

    /**
     * @type {Integer (UInt32)}
     */
    static CRESTRICTIONS_MDSCHEMA_MEMBERS => 12

    /**
     * @type {Integer (UInt32)}
     */
    static CRESTRICTIONS_DBSCHEMA_TRUSTEE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CRESTRICTIONS_DBSCHEMA_TABLE_STATISTICS => 7

    /**
     * @type {Integer (UInt32)}
     */
    static CRESTRICTIONS_DBSCHEMA_CHECK_CONSTRAINTS_BY_TABLE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static CRESTRICTIONS_MDSCHEMA_FUNCTIONS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CRESTRICTIONS_MDSCHEMA_ACTIONS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CRESTRICTIONS_MDSCHEMA_COMMANDS => 5

    /**
     * @type {Integer (UInt32)}
     */
    static CRESTRICTIONS_MDSCHEMA_SETS => 5

    /**
     * @type {Integer (UInt32)}
     */
    static IDENTIFIER_SDK_MASK => 4026531840

    /**
     * @type {Integer (UInt32)}
     */
    static IDENTIFIER_SDK_ERROR => 268435456

    /**
     * @type {Guid}
     */
    static CLSID_CISimpleCommandCreator => Guid("{c7b6c04a-cbb5-11d0-bb4c-00c04fc2f410}")

    /**
     * @type {Integer (UInt32)}
     */
    static DBPROP_MSDAORA_DETERMINEKEYCOLUMNS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DBPROP_MSDAORA8_DETERMINEKEYCOLUMNS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PWPROP_OSPVALUE => 2

    /**
     * @type {Integer (Int32)}
     */
    static STGM_COLLECTION => 8192

    /**
     * @type {Integer (Int32)}
     */
    static STGM_OUTPUT => 32768

    /**
     * @type {Integer (Int32)}
     */
    static STGM_OPEN => -2147483648

    /**
     * @type {Integer (Int32)}
     */
    static STGM_RECURSIVE => 16777216

    /**
     * @type {Integer (Int32)}
     */
    static STGM_STRICTOPEN => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static KAGPROP_QUERYBASEDUPDATES => 2

    /**
     * @type {Integer (UInt32)}
     */
    static KAGPROP_MARSHALLABLE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static KAGPROP_POSITIONONNEWROW => 4

    /**
     * @type {Integer (UInt32)}
     */
    static KAGPROP_IRowsetChangeExtInfo => 5

    /**
     * @type {Integer (UInt32)}
     */
    static KAGPROP_CURSOR => 6

    /**
     * @type {Integer (UInt32)}
     */
    static KAGPROP_CONCURRENCY => 7

    /**
     * @type {Integer (UInt32)}
     */
    static KAGPROP_BLOBSONFOCURSOR => 8

    /**
     * @type {Integer (UInt32)}
     */
    static KAGPROP_INCLUDENONEXACT => 9

    /**
     * @type {Integer (UInt32)}
     */
    static KAGPROP_FORCESSFIREHOSEMODE => 10

    /**
     * @type {Integer (UInt32)}
     */
    static KAGPROP_FORCENOPARAMETERREBIND => 11

    /**
     * @type {Integer (UInt32)}
     */
    static KAGPROP_FORCENOPREPARE => 12

    /**
     * @type {Integer (UInt32)}
     */
    static KAGPROP_FORCENOREEXECUTE => 13

    /**
     * @type {Integer (UInt32)}
     */
    static KAGPROP_ACCESSIBLEPROCEDURES => 2

    /**
     * @type {Integer (UInt32)}
     */
    static KAGPROP_ACCESSIBLETABLES => 3

    /**
     * @type {Integer (UInt32)}
     */
    static KAGPROP_ODBCSQLOPTIEF => 4

    /**
     * @type {Integer (UInt32)}
     */
    static KAGPROP_OJCAPABILITY => 5

    /**
     * @type {Integer (UInt32)}
     */
    static KAGPROP_PROCEDURES => 6

    /**
     * @type {Integer (UInt32)}
     */
    static KAGPROP_DRIVERNAME => 7

    /**
     * @type {Integer (UInt32)}
     */
    static KAGPROP_DRIVERVER => 8

    /**
     * @type {Integer (UInt32)}
     */
    static KAGPROP_DRIVERODBCVER => 9

    /**
     * @type {Integer (UInt32)}
     */
    static KAGPROP_LIKEESCAPECLAUSE => 10

    /**
     * @type {Integer (UInt32)}
     */
    static KAGPROP_SPECIALCHARACTERS => 11

    /**
     * @type {Integer (UInt32)}
     */
    static KAGPROP_MAXCOLUMNSINGROUPBY => 12

    /**
     * @type {Integer (UInt32)}
     */
    static KAGPROP_MAXCOLUMNSININDEX => 13

    /**
     * @type {Integer (UInt32)}
     */
    static KAGPROP_MAXCOLUMNSINORDERBY => 14

    /**
     * @type {Integer (UInt32)}
     */
    static KAGPROP_MAXCOLUMNSINSELECT => 15

    /**
     * @type {Integer (UInt32)}
     */
    static KAGPROP_MAXCOLUMNSINTABLE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static KAGPROP_NUMERICFUNCTIONS => 17

    /**
     * @type {Integer (UInt32)}
     */
    static KAGPROP_ODBCSQLCONFORMANCE => 18

    /**
     * @type {Integer (UInt32)}
     */
    static KAGPROP_OUTERJOINS => 19

    /**
     * @type {Integer (UInt32)}
     */
    static KAGPROP_STRINGFUNCTIONS => 20

    /**
     * @type {Integer (UInt32)}
     */
    static KAGPROP_SYSTEMFUNCTIONS => 21

    /**
     * @type {Integer (UInt32)}
     */
    static KAGPROP_TIMEDATEFUNCTIONS => 22

    /**
     * @type {Integer (UInt32)}
     */
    static KAGPROP_FILEUSAGE => 23

    /**
     * @type {Integer (UInt32)}
     */
    static KAGPROP_ACTIVESTATEMENTS => 24

    /**
     * @type {Integer (UInt32)}
     */
    static KAGPROP_AUTH_TRUSTEDCONNECTION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static KAGPROP_AUTH_SERVERINTEGRATED => 3

    /**
     * @type {Integer (UInt32)}
     */
    static KAGPROPVAL_CONCUR_ROWVER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KAGPROPVAL_CONCUR_VALUES => 2

    /**
     * @type {Integer (UInt32)}
     */
    static KAGPROPVAL_CONCUR_LOCK => 4

    /**
     * @type {Integer (UInt32)}
     */
    static KAGPROPVAL_CONCUR_READ_ONLY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static ODBCVER => 896

    /**
     * @type {Integer (UInt32)}
     */
    static ODBC_ADD_DSN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ODBC_CONFIG_DSN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ODBC_REMOVE_DSN => 3

    /**
     * @type {Integer (UInt32)}
     */
    static ODBC_ADD_SYS_DSN => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ODBC_CONFIG_SYS_DSN => 5

    /**
     * @type {Integer (UInt32)}
     */
    static ODBC_REMOVE_SYS_DSN => 6

    /**
     * @type {Integer (UInt32)}
     */
    static ODBC_REMOVE_DEFAULT_DSN => 7

    /**
     * @type {Integer (UInt32)}
     */
    static ODBC_INSTALL_INQUIRY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ODBC_INSTALL_COMPLETE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ODBC_INSTALL_DRIVER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ODBC_REMOVE_DRIVER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ODBC_CONFIG_DRIVER => 3

    /**
     * @type {Integer (UInt32)}
     */
    static ODBC_CONFIG_DRIVER_MAX => 100

    /**
     * @type {Integer (UInt32)}
     */
    static ODBC_BOTH_DSN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static ODBC_USER_DSN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ODBC_SYSTEM_DSN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ODBC_ERROR_GENERAL_ERR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ODBC_ERROR_INVALID_BUFF_LEN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ODBC_ERROR_INVALID_HWND => 3

    /**
     * @type {Integer (UInt32)}
     */
    static ODBC_ERROR_INVALID_STR => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ODBC_ERROR_INVALID_REQUEST_TYPE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static ODBC_ERROR_COMPONENT_NOT_FOUND => 6

    /**
     * @type {Integer (UInt32)}
     */
    static ODBC_ERROR_INVALID_NAME => 7

    /**
     * @type {Integer (UInt32)}
     */
    static ODBC_ERROR_INVALID_KEYWORD_VALUE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static ODBC_ERROR_INVALID_DSN => 9

    /**
     * @type {Integer (UInt32)}
     */
    static ODBC_ERROR_INVALID_INF => 10

    /**
     * @type {Integer (UInt32)}
     */
    static ODBC_ERROR_REQUEST_FAILED => 11

    /**
     * @type {Integer (UInt32)}
     */
    static ODBC_ERROR_INVALID_PATH => 12

    /**
     * @type {Integer (UInt32)}
     */
    static ODBC_ERROR_LOAD_LIB_FAILED => 13

    /**
     * @type {Integer (UInt32)}
     */
    static ODBC_ERROR_INVALID_PARAM_SEQUENCE => 14

    /**
     * @type {Integer (UInt32)}
     */
    static ODBC_ERROR_INVALID_LOG_FILE => 15

    /**
     * @type {Integer (UInt32)}
     */
    static ODBC_ERROR_USER_CANCELED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static ODBC_ERROR_USAGE_UPDATE_FAILED => 17

    /**
     * @type {Integer (UInt32)}
     */
    static ODBC_ERROR_CREATE_DSN_FAILED => 18

    /**
     * @type {Integer (UInt32)}
     */
    static ODBC_ERROR_WRITING_SYSINFO_FAILED => 19

    /**
     * @type {Integer (UInt32)}
     */
    static ODBC_ERROR_REMOVE_DSN_FAILED => 20

    /**
     * @type {Integer (UInt32)}
     */
    static ODBC_ERROR_OUT_OF_MEM => 21

    /**
     * @type {Integer (UInt32)}
     */
    static ODBC_ERROR_OUTPUT_STRING_TRUNCATED => 22

    /**
     * @type {Integer (UInt32)}
     */
    static ODBC_ERROR_NOTRANINFO => 23

    /**
     * @type {Integer (UInt32)}
     */
    static ODBC_ERROR_MAX => 23

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_MAX_SQLSERVERNAME => 128

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_COPT_SS_BASE => 1200

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_COPT_SS_REMOTE_PWD => 1201

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_COPT_SS_USE_PROC_FOR_PREP => 1202

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_COPT_SS_INTEGRATED_SECURITY => 1203

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_COPT_SS_PRESERVE_CURSORS => 1204

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_COPT_SS_USER_DATA => 1205

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_COPT_SS_FALLBACK_CONNECT => 1210

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_COPT_SS_PERF_DATA => 1211

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_COPT_SS_PERF_DATA_LOG => 1212

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_COPT_SS_PERF_QUERY_INTERVAL => 1213

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_COPT_SS_PERF_QUERY_LOG => 1214

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_COPT_SS_PERF_QUERY => 1215

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_COPT_SS_PERF_DATA_LOG_NOW => 1216

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_COPT_SS_QUOTED_IDENT => 1217

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_COPT_SS_ANSI_NPW => 1218

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_COPT_SS_BCP => 1219

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_COPT_SS_TRANSLATE => 1220

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_COPT_SS_ATTACHDBFILENAME => 1221

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_COPT_SS_CONCAT_NULL => 1222

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_COPT_SS_ENCRYPT => 1223

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_COPT_SS_MAX_USED => 1223

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_SOPT_SS_BASE => 1225

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_SOPT_SS_TEXTPTR_LOGGING => 1225

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_SOPT_SS_CURRENT_COMMAND => 1226

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_SOPT_SS_HIDDEN_COLUMNS => 1227

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_SOPT_SS_NOBROWSETABLE => 1228

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_SOPT_SS_REGIONALIZE => 1229

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_SOPT_SS_CURSOR_OPTIONS => 1230

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_SOPT_SS_NOCOUNT_STATUS => 1231

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_SOPT_SS_DEFER_PREPARE => 1232

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_SOPT_SS_MAX_USED => 1232

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_COPT_SS_BASE_EX => 1240

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_COPT_SS_BROWSE_CONNECT => 1241

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_COPT_SS_BROWSE_SERVER => 1242

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_COPT_SS_WARN_ON_CP_ERROR => 1243

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_COPT_SS_CONNECTION_DEAD => 1244

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_COPT_SS_BROWSE_CACHE_DATA => 1245

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_COPT_SS_RESET_CONNECTION => 1246

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_COPT_SS_EX_MAX_USED => 1246

    /**
     * @type {Integer (Int32)}
     */
    static SQL_UP_OFF => 0

    /**
     * @type {Integer (Int32)}
     */
    static SQL_UP_ON => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_UP_ON_DROP => 2

    /**
     * @type {Integer (Int32)}
     */
    static SQL_UP_DEFAULT => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_IS_OFF => 0

    /**
     * @type {Integer (Int32)}
     */
    static SQL_IS_ON => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_IS_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static SQL_PC_OFF => 0

    /**
     * @type {Integer (Int32)}
     */
    static SQL_PC_ON => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_PC_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static SQL_XL_OFF => 0

    /**
     * @type {Integer (Int32)}
     */
    static SQL_XL_ON => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_XL_DEFAULT => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FB_OFF => 0

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FB_ON => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FB_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static SQL_BCP_OFF => 0

    /**
     * @type {Integer (Int32)}
     */
    static SQL_BCP_ON => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_BCP_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static SQL_QI_OFF => 0

    /**
     * @type {Integer (Int32)}
     */
    static SQL_QI_ON => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_QI_DEFAULT => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_AD_OFF => 0

    /**
     * @type {Integer (Int32)}
     */
    static SQL_AD_ON => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_AD_DEFAULT => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CN_OFF => 0

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CN_ON => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CN_DEFAULT => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_TL_OFF => 0

    /**
     * @type {Integer (Int32)}
     */
    static SQL_TL_ON => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_TL_DEFAULT => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_HC_OFF => 0

    /**
     * @type {Integer (Int32)}
     */
    static SQL_HC_ON => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_HC_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static SQL_NB_OFF => 0

    /**
     * @type {Integer (Int32)}
     */
    static SQL_NB_ON => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_NB_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static SQL_RE_OFF => 0

    /**
     * @type {Integer (Int32)}
     */
    static SQL_RE_ON => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_RE_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CO_OFF => 0

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CO_FFO => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CO_AF => 2

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CO_FIREHOSE_AF => 4

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CO_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static SQL_NC_OFF => 0

    /**
     * @type {Integer (Int32)}
     */
    static SQL_NC_ON => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DP_OFF => 0

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DP_ON => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_EN_OFF => 0

    /**
     * @type {Integer (Int32)}
     */
    static SQL_EN_ON => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_MORE_INFO_NO => 0

    /**
     * @type {Integer (Int32)}
     */
    static SQL_MORE_INFO_YES => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CACHE_DATA_NO => 0

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CACHE_DATA_YES => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_RESET_YES => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_WARN_NO => 0

    /**
     * @type {Integer (Int32)}
     */
    static SQL_WARN_YES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CURSOR_FAST_FORWARD_ONLY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CA_SS_BASE => 1200

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CA_SS_COLUMN_SSTYPE => 1200

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CA_SS_COLUMN_UTYPE => 1201

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CA_SS_NUM_ORDERS => 1202

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CA_SS_COLUMN_ORDER => 1203

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CA_SS_COLUMN_VARYLEN => 1204

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CA_SS_NUM_COMPUTES => 1205

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CA_SS_COMPUTE_ID => 1206

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CA_SS_COMPUTE_BYLIST => 1207

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CA_SS_COLUMN_ID => 1208

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CA_SS_COLUMN_OP => 1209

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CA_SS_COLUMN_SIZE => 1210

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CA_SS_COLUMN_HIDDEN => 1211

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CA_SS_COLUMN_KEY => 1212

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CA_SS_COLUMN_COLLATION => 1214

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CA_SS_VARIANT_TYPE => 1215

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CA_SS_VARIANT_SQL_TYPE => 1216

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CA_SS_VARIANT_SERVER_TYPE => 1217

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CA_SS_MAX_USED => 1218

    /**
     * @type {Integer (UInt32)}
     */
    static SQLTEXT => 35

    /**
     * @type {Integer (UInt32)}
     */
    static SQLVARBINARY => 37

    /**
     * @type {Integer (UInt32)}
     */
    static SQLINTN => 38

    /**
     * @type {Integer (UInt32)}
     */
    static SQLVARCHAR => 39

    /**
     * @type {Integer (UInt32)}
     */
    static SQLBINARY => 45

    /**
     * @type {Integer (UInt32)}
     */
    static SQLIMAGE => 34

    /**
     * @type {Integer (UInt32)}
     */
    static SQLCHARACTER => 47

    /**
     * @type {Integer (UInt32)}
     */
    static SQLINT1 => 48

    /**
     * @type {Integer (UInt32)}
     */
    static SQLBIT => 50

    /**
     * @type {Integer (UInt32)}
     */
    static SQLINT2 => 52

    /**
     * @type {Integer (UInt32)}
     */
    static SQLINT4 => 56

    /**
     * @type {Integer (UInt32)}
     */
    static SQLMONEY => 60

    /**
     * @type {Integer (UInt32)}
     */
    static SQLDATETIME => 61

    /**
     * @type {Integer (UInt32)}
     */
    static SQLFLT8 => 62

    /**
     * @type {Integer (UInt32)}
     */
    static SQLFLTN => 109

    /**
     * @type {Integer (UInt32)}
     */
    static SQLMONEYN => 110

    /**
     * @type {Integer (UInt32)}
     */
    static SQLDATETIMN => 111

    /**
     * @type {Integer (UInt32)}
     */
    static SQLFLT4 => 59

    /**
     * @type {Integer (UInt32)}
     */
    static SQLMONEY4 => 122

    /**
     * @type {Integer (UInt32)}
     */
    static SQLDATETIM4 => 58

    /**
     * @type {Integer (UInt32)}
     */
    static SQLDECIMAL => 106

    /**
     * @type {Integer (UInt32)}
     */
    static SQLNUMERIC => 108

    /**
     * @type {Integer (UInt32)}
     */
    static SQLUNIQUEID => 36

    /**
     * @type {Integer (UInt32)}
     */
    static SQLBIGCHAR => 175

    /**
     * @type {Integer (UInt32)}
     */
    static SQLBIGVARCHAR => 167

    /**
     * @type {Integer (UInt32)}
     */
    static SQLBIGBINARY => 173

    /**
     * @type {Integer (UInt32)}
     */
    static SQLBIGVARBINARY => 165

    /**
     * @type {Integer (UInt32)}
     */
    static SQLBITN => 104

    /**
     * @type {Integer (UInt32)}
     */
    static SQLNCHAR => 239

    /**
     * @type {Integer (UInt32)}
     */
    static SQLNVARCHAR => 231

    /**
     * @type {Integer (UInt32)}
     */
    static SQLNTEXT => 99

    /**
     * @type {Integer (UInt32)}
     */
    static SQLINT8 => 127

    /**
     * @type {Integer (UInt32)}
     */
    static SQLVARIANT => 98

    /**
     * @type {Integer (UInt32)}
     */
    static SQLudtBINARY => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SQLudtBIT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SQLudtBITN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQLudtCHAR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQLudtDATETIM4 => 22

    /**
     * @type {Integer (UInt32)}
     */
    static SQLudtDATETIME => 12

    /**
     * @type {Integer (UInt32)}
     */
    static SQLudtDATETIMN => 15

    /**
     * @type {Integer (UInt32)}
     */
    static SQLudtDECML => 24

    /**
     * @type {Integer (UInt32)}
     */
    static SQLudtDECMLN => 26

    /**
     * @type {Integer (UInt32)}
     */
    static SQLudtFLT4 => 23

    /**
     * @type {Integer (UInt32)}
     */
    static SQLudtFLT8 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SQLudtFLTN => 14

    /**
     * @type {Integer (UInt32)}
     */
    static SQLudtIMAGE => 20

    /**
     * @type {Integer (UInt32)}
     */
    static SQLudtINT1 => 5

    /**
     * @type {Integer (UInt32)}
     */
    static SQLudtINT2 => 6

    /**
     * @type {Integer (UInt32)}
     */
    static SQLudtINT4 => 7

    /**
     * @type {Integer (UInt32)}
     */
    static SQLudtINTN => 13

    /**
     * @type {Integer (UInt32)}
     */
    static SQLudtMONEY => 11

    /**
     * @type {Integer (UInt32)}
     */
    static SQLudtMONEY4 => 21

    /**
     * @type {Integer (UInt32)}
     */
    static SQLudtMONEYN => 17

    /**
     * @type {Integer (UInt32)}
     */
    static SQLudtNUM => 10

    /**
     * @type {Integer (UInt32)}
     */
    static SQLudtNUMN => 25

    /**
     * @type {Integer (UInt32)}
     */
    static SQLudtSYSNAME => 18

    /**
     * @type {Integer (UInt32)}
     */
    static SQLudtTEXT => 19

    /**
     * @type {Integer (UInt32)}
     */
    static SQLudtTIMESTAMP => 80

    /**
     * @type {Integer (UInt32)}
     */
    static SQLudtUNIQUEIDENTIFIER => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQLudtVARBINARY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SQLudtVARCHAR => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MIN_USER_DATATYPE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static SQLAOPSTDEV => 48

    /**
     * @type {Integer (UInt32)}
     */
    static SQLAOPSTDEVP => 49

    /**
     * @type {Integer (UInt32)}
     */
    static SQLAOPVAR => 50

    /**
     * @type {Integer (UInt32)}
     */
    static SQLAOPVARP => 51

    /**
     * @type {Integer (UInt32)}
     */
    static SQLAOPCNT => 75

    /**
     * @type {Integer (UInt32)}
     */
    static SQLAOPSUM => 77

    /**
     * @type {Integer (UInt32)}
     */
    static SQLAOPAVG => 79

    /**
     * @type {Integer (UInt32)}
     */
    static SQLAOPMIN => 81

    /**
     * @type {Integer (UInt32)}
     */
    static SQLAOPMAX => 82

    /**
     * @type {Integer (UInt32)}
     */
    static SQLAOPANY => 83

    /**
     * @type {Integer (UInt32)}
     */
    static SQLAOPNOOP => 86

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_INFO_SS_FIRST => 1199

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_INFO_SS_NETLIB_NAMEW => 1199

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_INFO_SS_NETLIB_NAMEA => 1200

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_INFO_SS_MAX_USED => 1200

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_INFO_SS_NETLIB_NAME => 1199

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SS_VARIANT => -150

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DIAG_SS_BASE => -1150

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DIAG_SS_MSGSTATE => -1150

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DIAG_SS_SEVERITY => -1151

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DIAG_SS_SRVNAME => -1152

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DIAG_SS_PROCNAME => -1153

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DIAG_SS_LINE => -1154

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DIAG_DFC_SS_BASE => -200

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DIAG_DFC_SS_ALTER_DATABASE => -200

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DIAG_DFC_SS_CHECKPOINT => -201

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DIAG_DFC_SS_CONDITION => -202

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DIAG_DFC_SS_CREATE_DATABASE => -203

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DIAG_DFC_SS_CREATE_DEFAULT => -204

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DIAG_DFC_SS_CREATE_PROCEDURE => -205

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DIAG_DFC_SS_CREATE_RULE => -206

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DIAG_DFC_SS_CREATE_TRIGGER => -207

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DIAG_DFC_SS_CURSOR_DECLARE => -208

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DIAG_DFC_SS_CURSOR_OPEN => -209

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DIAG_DFC_SS_CURSOR_FETCH => -210

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DIAG_DFC_SS_CURSOR_CLOSE => -211

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DIAG_DFC_SS_DEALLOCATE_CURSOR => -212

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DIAG_DFC_SS_DBCC => -213

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DIAG_DFC_SS_DISK => -214

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DIAG_DFC_SS_DROP_DATABASE => -215

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DIAG_DFC_SS_DROP_DEFAULT => -216

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DIAG_DFC_SS_DROP_PROCEDURE => -217

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DIAG_DFC_SS_DROP_RULE => -218

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DIAG_DFC_SS_DROP_TRIGGER => -219

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DIAG_DFC_SS_DUMP_DATABASE => -220

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DIAG_DFC_SS_DUMP_TABLE => -221

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DIAG_DFC_SS_DUMP_TRANSACTION => -222

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DIAG_DFC_SS_GOTO => -223

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DIAG_DFC_SS_INSERT_BULK => -224

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DIAG_DFC_SS_KILL => -225

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DIAG_DFC_SS_LOAD_DATABASE => -226

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DIAG_DFC_SS_LOAD_HEADERONLY => -227

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DIAG_DFC_SS_LOAD_TABLE => -228

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DIAG_DFC_SS_LOAD_TRANSACTION => -229

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DIAG_DFC_SS_PRINT => -230

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DIAG_DFC_SS_RAISERROR => -231

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DIAG_DFC_SS_READTEXT => -232

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DIAG_DFC_SS_RECONFIGURE => -233

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DIAG_DFC_SS_RETURN => -234

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DIAG_DFC_SS_SELECT_INTO => -235

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DIAG_DFC_SS_SET => -236

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DIAG_DFC_SS_SET_IDENTITY_INSERT => -237

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DIAG_DFC_SS_SET_ROW_COUNT => -238

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DIAG_DFC_SS_SET_STATISTICS => -239

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DIAG_DFC_SS_SET_TEXTSIZE => -240

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DIAG_DFC_SS_SETUSER => -241

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DIAG_DFC_SS_SHUTDOWN => -242

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DIAG_DFC_SS_TRANS_BEGIN => -243

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DIAG_DFC_SS_TRANS_COMMIT => -244

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DIAG_DFC_SS_TRANS_PREPARE => -245

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DIAG_DFC_SS_TRANS_ROLLBACK => -246

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DIAG_DFC_SS_TRANS_SAVE => -247

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DIAG_DFC_SS_TRUNCATE_TABLE => -248

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DIAG_DFC_SS_UPDATE_STATISTICS => -249

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DIAG_DFC_SS_UPDATETEXT => -250

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DIAG_DFC_SS_USE => -251

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DIAG_DFC_SS_WAITFOR => -252

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DIAG_DFC_SS_WRITETEXT => -253

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DIAG_DFC_SS_DENY => -254

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DIAG_DFC_SS_SET_XCTLVL => -255

    /**
     * @type {Integer (UInt32)}
     */
    static EX_ANY => 0

    /**
     * @type {Integer (UInt32)}
     */
    static EX_INFO => 10

    /**
     * @type {Integer (UInt32)}
     */
    static EX_MAXISEVERITY => 10

    /**
     * @type {Integer (UInt32)}
     */
    static EX_MISSING => 11

    /**
     * @type {Integer (UInt32)}
     */
    static EX_TYPE => 12

    /**
     * @type {Integer (UInt32)}
     */
    static EX_DEADLOCK => 13

    /**
     * @type {Integer (UInt32)}
     */
    static EX_PERMIT => 14

    /**
     * @type {Integer (UInt32)}
     */
    static EX_SYNTAX => 15

    /**
     * @type {Integer (UInt32)}
     */
    static EX_USER => 16

    /**
     * @type {Integer (UInt32)}
     */
    static EX_RESOURCE => 17

    /**
     * @type {Integer (UInt32)}
     */
    static EX_INTOK => 18

    /**
     * @type {Integer (UInt32)}
     */
    static MAXUSEVERITY => 18

    /**
     * @type {Integer (UInt32)}
     */
    static EX_LIMIT => 19

    /**
     * @type {Integer (UInt32)}
     */
    static EX_CMDFATAL => 20

    /**
     * @type {Integer (UInt32)}
     */
    static MINFATALERR => 20

    /**
     * @type {Integer (UInt32)}
     */
    static EX_DBFATAL => 21

    /**
     * @type {Integer (UInt32)}
     */
    static EX_TABCORRUPT => 22

    /**
     * @type {Integer (UInt32)}
     */
    static EX_DBCORRUPT => 23

    /**
     * @type {Integer (UInt32)}
     */
    static EX_HARDWARE => 24

    /**
     * @type {Integer (UInt32)}
     */
    static EX_CONTROL => 25

    /**
     * @type {Integer (UInt32)}
     */
    static DBMAXCHAR => 8001

    /**
     * @type {Integer (UInt32)}
     */
    static MAXNAME => 129

    /**
     * @type {Integer (UInt32)}
     */
    static MAXNUMERICLEN => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_PERF_START => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_PERF_STOP => 2

    /**
     * @type {String}
     */
    static SQL_SS_DL_DEFAULT => "STATS.LOG"

    /**
     * @type {String}
     */
    static SQL_SS_QL_DEFAULT => "QUERY.LOG"

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_SS_QI_DEFAULT => 30000

    /**
     * @type {Integer (UInt32)}
     */
    static SUCCEED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FAIL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SUCCEED_ABORT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SUCCEED_ASYNC => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DB_IN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DB_OUT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static BCPMAXERRS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static BCPFIRST => 2

    /**
     * @type {Integer (UInt32)}
     */
    static BCPLAST => 3

    /**
     * @type {Integer (UInt32)}
     */
    static BCPBATCH => 4

    /**
     * @type {Integer (UInt32)}
     */
    static BCPKEEPNULLS => 5

    /**
     * @type {Integer (UInt32)}
     */
    static BCPABORT => 6

    /**
     * @type {Integer (UInt32)}
     */
    static BCPODBC => 7

    /**
     * @type {Integer (UInt32)}
     */
    static BCPKEEPIDENTITY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static BCP6xFILEFMT => 9

    /**
     * @type {Integer (UInt32)}
     */
    static BCPHINTSA => 10

    /**
     * @type {Integer (UInt32)}
     */
    static BCPHINTSW => 11

    /**
     * @type {Integer (UInt32)}
     */
    static BCPFILECP => 12

    /**
     * @type {Integer (UInt32)}
     */
    static BCPUNICODEFILE => 13

    /**
     * @type {Integer (UInt32)}
     */
    static BCPTEXTFILE => 14

    /**
     * @type {Integer (UInt32)}
     */
    static BCPFILEFMT => 15

    /**
     * @type {Integer (UInt32)}
     */
    static BCPFILECP_ACP => 0

    /**
     * @type {Integer (UInt32)}
     */
    static BCPFILECP_OEMCP => 1

    /**
     * @type {Integer (Int32)}
     */
    static BCPFILECP_RAW => -1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_VARLEN_DATA => -10

    /**
     * @type {Integer (UInt32)}
     */
    static BCPHINTS => 11

    /**
     * @type {Integer (UInt32)}
     */
    static BCP_FMT_TYPE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static BCP_FMT_INDICATOR_LEN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static BCP_FMT_DATA_LEN => 3

    /**
     * @type {Integer (UInt32)}
     */
    static BCP_FMT_TERMINATOR => 4

    /**
     * @type {Integer (UInt32)}
     */
    static BCP_FMT_SERVER_COL => 5

    /**
     * @type {Integer (UInt32)}
     */
    static BCP_FMT_COLLATION => 6

    /**
     * @type {Integer (UInt32)}
     */
    static BCP_FMT_COLLATION_ID => 7

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_FAST_CONNECT => 1200

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FC_OFF => 0

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FC_ON => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FC_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_COPT_SS_ANSI_OEM => 1206

    /**
     * @type {Integer (Int32)}
     */
    static SQL_AO_OFF => 0

    /**
     * @type {Integer (Int32)}
     */
    static SQL_AO_ON => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_AO_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_REMOTE_PWD => 1201

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_USE_PROCEDURE_FOR_PREPARE => 1202

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_INTEGRATED_SECURITY => 1203

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_PRESERVE_CURSORS => 1204

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_TEXTPTR_LOGGING => 1225

    /**
     * @type {Integer (UInt32)}
     */
    static SQLDECIMALN => 106

    /**
     * @type {Integer (UInt32)}
     */
    static SQLNUMERICN => 108

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_BOGUS => -2147217665

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_BADACCESSORHANDLE => -2147217920

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_ROWLIMITEXCEEDED => -2147217919

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_READONLYACCESSOR => -2147217918

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_SCHEMAVIOLATION => -2147217917

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_BADROWHANDLE => -2147217916

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_OBJECTOPEN => -2147217915

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_BADCHAPTER => -2147217914

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_CANTCONVERTVALUE => -2147217913

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_BADBINDINFO => -2147217912

    /**
     * @type {Integer (Int32)}
     */
    static DB_SEC_E_PERMISSIONDENIED => -2147217911

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_NOTAREFERENCECOLUMN => -2147217910

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_LIMITREJECTED => -2147217909

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_NOCOMMAND => -2147217908

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_COSTLIMIT => -2147217907

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_BADBOOKMARK => -2147217906

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_BADLOCKMODE => -2147217905

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_PARAMNOTOPTIONAL => -2147217904

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_BADCOLUMNID => -2147217903

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_BADRATIO => -2147217902

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_BADVALUES => -2147217901

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_ERRORSINCOMMAND => -2147217900

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_CANTCANCEL => -2147217899

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_DIALECTNOTSUPPORTED => -2147217898

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_DUPLICATEDATASOURCE => -2147217897

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_CANNOTRESTART => -2147217896

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_NOTFOUND => -2147217895

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_NEWLYINSERTED => -2147217893

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_CANNOTFREE => -2147217894

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_GOALREJECTED => -2147217892

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_UNSUPPORTEDCONVERSION => -2147217891

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_BADSTARTPOSITION => -2147217890

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_NOQUERY => -2147217889

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_NOTREENTRANT => -2147217888

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_ERRORSOCCURRED => -2147217887

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_NOAGGREGATION => -2147217886

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_DELETEDROW => -2147217885

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_CANTFETCHBACKWARDS => -2147217884

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_ROWSNOTRELEASED => -2147217883

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_BADSTORAGEFLAG => -2147217882

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_BADCOMPAREOP => -2147217881

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_BADSTATUSVALUE => -2147217880

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_CANTSCROLLBACKWARDS => -2147217879

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_BADREGIONHANDLE => -2147217878

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_NONCONTIGUOUSRANGE => -2147217877

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_INVALIDTRANSITION => -2147217876

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_NOTASUBREGION => -2147217875

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_MULTIPLESTATEMENTS => -2147217874

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_INTEGRITYVIOLATION => -2147217873

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_BADTYPENAME => -2147217872

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_ABORTLIMITREACHED => -2147217871

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_ROWSETINCOMMAND => -2147217870

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_CANTTRANSLATE => -2147217869

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_DUPLICATEINDEXID => -2147217868

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_NOINDEX => -2147217867

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_INDEXINUSE => -2147217866

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_NOTABLE => -2147217865

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_CONCURRENCYVIOLATION => -2147217864

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_BADCOPY => -2147217863

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_BADPRECISION => -2147217862

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_BADSCALE => -2147217861

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_BADTABLEID => -2147217860

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_BADID => -2147217860

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_BADTYPE => -2147217859

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_DUPLICATECOLUMNID => -2147217858

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_DUPLICATETABLEID => -2147217857

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_TABLEINUSE => -2147217856

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_NOLOCALE => -2147217855

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_BADRECORDNUM => -2147217854

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_BOOKMARKSKIPPED => -2147217853

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_BADPROPERTYVALUE => -2147217852

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_INVALID => -2147217851

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_BADACCESSORFLAGS => -2147217850

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_BADSTORAGEFLAGS => -2147217849

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_BYREFACCESSORNOTSUPPORTED => -2147217848

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_NULLACCESSORNOTSUPPORTED => -2147217847

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_NOTPREPARED => -2147217846

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_BADACCESSORTYPE => -2147217845

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_WRITEONLYACCESSOR => -2147217844

    /**
     * @type {Integer (Int32)}
     */
    static DB_SEC_E_AUTH_FAILED => -2147217843

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_CANCELED => -2147217842

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_CHAPTERNOTRELEASED => -2147217841

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_BADSOURCEHANDLE => -2147217840

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_PARAMUNAVAILABLE => -2147217839

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_ALREADYINITIALIZED => -2147217838

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_NOTSUPPORTED => -2147217837

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_MAXPENDCHANGESEXCEEDED => -2147217836

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_BADORDINAL => -2147217835

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_PENDINGCHANGES => -2147217834

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_DATAOVERFLOW => -2147217833

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_BADHRESULT => -2147217832

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_BADLOOKUPID => -2147217831

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_BADDYNAMICERRORID => -2147217830

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_PENDINGINSERT => -2147217829

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_BADCONVERTFLAG => -2147217828

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_BADPARAMETERNAME => -2147217827

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_MULTIPLESTORAGE => -2147217826

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_CANTFILTER => -2147217825

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_CANTORDER => -2147217824

    /**
     * @type {Integer (Int32)}
     */
    static MD_E_BADTUPLE => -2147217823

    /**
     * @type {Integer (Int32)}
     */
    static MD_E_BADCOORDINATE => -2147217822

    /**
     * @type {Integer (Int32)}
     */
    static MD_E_INVALIDAXIS => -2147217821

    /**
     * @type {Integer (Int32)}
     */
    static MD_E_INVALIDCELLRANGE => -2147217820

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_NOCOLUMN => -2147217819

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_COMMANDNOTPERSISTED => -2147217817

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_DUPLICATEID => -2147217816

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_OBJECTCREATIONLIMITREACHED => -2147217815

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_BADINDEXID => -2147217806

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_BADINITSTRING => -2147217805

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_NOPROVIDERSREGISTERED => -2147217804

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_MISMATCHEDPROVIDER => -2147217803

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_BADCOMMANDID => -2147217802

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_PERMISSIONDENIED => -2147217911

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_BADTRUSTEEID => -2147217814

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_NOTRUSTEEID => -2147217813

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_NOMEMBERSHIPSUPPORT => -2147217812

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_INVALIDOBJECT => -2147217811

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_NOOWNER => -2147217810

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_INVALIDACCESSENTRYLIST => -2147217809

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_INVALIDOWNER => -2147217808

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_INVALIDACCESSENTRY => -2147217807

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_BADCONSTRAINTTYPE => -2147217801

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_BADCONSTRAINTFORM => -2147217800

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_BADDEFERRABILITY => -2147217799

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_BADMATCHTYPE => -2147217792

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_BADUPDATEDELETERULE => -2147217782

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_BADCONSTRAINTID => -2147217781

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_BADCOMMANDFLAGS => -2147217780

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_OBJECTMISMATCH => -2147217779

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_NOSOURCEOBJECT => -2147217775

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_RESOURCELOCKED => -2147217774

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_NOTCOLLECTION => -2147217773

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_READONLY => -2147217772

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_ASYNCNOTSUPPORTED => -2147217771

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_CANNOTCONNECT => -2147217770

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_TIMEOUT => -2147217769

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_RESOURCEEXISTS => -2147217768

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_RESOURCEOUTOFSCOPE => -2147217778

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_DROPRESTRICTED => -2147217776

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_DUPLICATECONSTRAINTID => -2147217767

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_OUTOFSPACE => -2147217766

    /**
     * @type {Integer (Int32)}
     */
    static DB_SEC_E_SAFEMODE_DENIED => -2147217765

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_NOSTATISTIC => -2147217764

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_ALTERRESTRICTED => -2147217763

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_RESOURCENOTSUPPORTED => -2147217762

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_NOCONSTRAINT => -2147217761

    /**
     * @type {Integer (Int32)}
     */
    static DB_E_COLUMNUNAVAILABLE => -2147217760

    /**
     * @type {Integer (Int32)}
     */
    static DB_S_ROWLIMITEXCEEDED => 265920

    /**
     * @type {Integer (Int32)}
     */
    static DB_S_COLUMNTYPEMISMATCH => 265921

    /**
     * @type {Integer (Int32)}
     */
    static DB_S_TYPEINFOOVERRIDDEN => 265922

    /**
     * @type {Integer (Int32)}
     */
    static DB_S_BOOKMARKSKIPPED => 265923

    /**
     * @type {Integer (Int32)}
     */
    static DB_S_NONEXTROWSET => 265925

    /**
     * @type {Integer (Int32)}
     */
    static DB_S_ENDOFROWSET => 265926

    /**
     * @type {Integer (Int32)}
     */
    static DB_S_COMMANDREEXECUTED => 265927

    /**
     * @type {Integer (Int32)}
     */
    static DB_S_BUFFERFULL => 265928

    /**
     * @type {Integer (Int32)}
     */
    static DB_S_NORESULT => 265929

    /**
     * @type {Integer (Int32)}
     */
    static DB_S_CANTRELEASE => 265930

    /**
     * @type {Integer (Int32)}
     */
    static DB_S_GOALCHANGED => 265931

    /**
     * @type {Integer (Int32)}
     */
    static DB_S_UNWANTEDOPERATION => 265932

    /**
     * @type {Integer (Int32)}
     */
    static DB_S_DIALECTIGNORED => 265933

    /**
     * @type {Integer (Int32)}
     */
    static DB_S_UNWANTEDPHASE => 265934

    /**
     * @type {Integer (Int32)}
     */
    static DB_S_UNWANTEDREASON => 265935

    /**
     * @type {Integer (Int32)}
     */
    static DB_S_ASYNCHRONOUS => 265936

    /**
     * @type {Integer (Int32)}
     */
    static DB_S_COLUMNSCHANGED => 265937

    /**
     * @type {Integer (Int32)}
     */
    static DB_S_ERRORSRETURNED => 265938

    /**
     * @type {Integer (Int32)}
     */
    static DB_S_BADROWHANDLE => 265939

    /**
     * @type {Integer (Int32)}
     */
    static DB_S_DELETEDROW => 265940

    /**
     * @type {Integer (Int32)}
     */
    static DB_S_TOOMANYCHANGES => 265941

    /**
     * @type {Integer (Int32)}
     */
    static DB_S_STOPLIMITREACHED => 265942

    /**
     * @type {Integer (Int32)}
     */
    static DB_S_LOCKUPGRADED => 265944

    /**
     * @type {Integer (Int32)}
     */
    static DB_S_PROPERTIESCHANGED => 265945

    /**
     * @type {Integer (Int32)}
     */
    static DB_S_ERRORSOCCURRED => 265946

    /**
     * @type {Integer (Int32)}
     */
    static DB_S_PARAMUNAVAILABLE => 265947

    /**
     * @type {Integer (Int32)}
     */
    static DB_S_MULTIPLECHANGES => 265948

    /**
     * @type {Integer (Int32)}
     */
    static DB_S_NOTSINGLETON => 265943

    /**
     * @type {Integer (Int32)}
     */
    static DB_S_NOROWSPECIFICCOLUMNS => 265949

    /**
     * @type {Integer (UInt32)}
     */
    static DBPROPFLAGS_PERSIST => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static DBPROPVAL_PERSIST_ADTG => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DBPROPVAL_PERSIST_XML => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DBPROP_PersistFormat => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DBPROP_PersistSchema => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DBPROP_HCHAPTER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DBPROP_MAINTAINPROPS => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DBPROP_Unicode => 6

    /**
     * @type {Integer (UInt32)}
     */
    static DBPROP_INTERLEAVEDROWS => 8

    /**
     * @type {String}
     */
    static MS_PERSIST_PROGID => "MSPersist"

    /**
     * @type {Guid}
     */
    static DBQUERYGUID => Guid("{49691c90-7e17-101a-a91c-08002b2ecda9}")

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_QUERY_RANKVECTOR => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_QUERY_RANK => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_QUERY_HITCOUNT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_QUERY_WORKID => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_QUERY_ALL => 6

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_QUERY_UNFILTERED => 7

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_QUERY_REVNAME => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_QUERY_VIRTUALPATH => 9

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_QUERY_LASTSEENTIME => 10

    /**
     * @type {Integer (UInt32)}
     */
    static CQUERYDISPIDS => 11

    /**
     * @type {Guid}
     */
    static PSGUID_QUERY_METADATA => Guid("{624c9360-93d0-11cf-a787-00004c752752}")

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_QUERY_METADATA_VROOTUSED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_QUERY_METADATA_VROOTAUTOMATIC => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_QUERY_METADATA_VROOTMANUAL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_QUERY_METADATA_PROPGUID => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_QUERY_METADATA_PROPDISPID => 6

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_QUERY_METADATA_PROPNAME => 7

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_QUERY_METADATA_STORELEVEL => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_QUERY_METADATA_PROPMODIFIABLE => 9

    /**
     * @type {Integer (UInt32)}
     */
    static CQUERYMETADISPIDS => 10

    /**
     * @type {Guid}
     */
    static DBBMKGUID => Guid("{c8b52232-5cf3-11ce-ade5-00aa0044773d}")

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_DBBMK_BOOKMARK => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_DBBMK_CHAPTER => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CDBBMKDISPIDS => 8

    /**
     * @type {Guid}
     */
    static DBSELFGUID => Guid("{c8b52231-5cf3-11ce-ade5-00aa0044773d}")

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_DBSELF_SELF => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CDBSELFDISPIDS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CDBCOLDISPIDS => 28

    /**
     * @type {Integer (UInt32)}
     */
    static CQUERYPROPERTY => 64

    /**
     * @type {Guid}
     */
    static PSGUID_CHARACTERIZATION => Guid("{560c36c0-503a-11cf-baa1-00004c752a9a}")

    /**
     * @type {Integer (UInt32)}
     */
    static QUERY_VALIDBITS => 3

    /**
     * @type {Integer (UInt32)}
     */
    static RTNone => 0

    /**
     * @type {Integer (UInt32)}
     */
    static RTAnd => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RTOr => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RTNot => 3

    /**
     * @type {Integer (UInt32)}
     */
    static RTContent => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RTProperty => 5

    /**
     * @type {Integer (UInt32)}
     */
    static RTProximity => 6

    /**
     * @type {Integer (UInt32)}
     */
    static RTVector => 7

    /**
     * @type {Integer (UInt32)}
     */
    static RTNatLanguage => 8

    /**
     * @type {Integer (UInt32)}
     */
    static GENERATE_METHOD_PREFIXMATCH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GENERATE_METHOD_STEMMED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PRRE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static PRAllBits => 7

    /**
     * @type {Integer (UInt32)}
     */
    static PRSomeBits => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PRAll => 256

    /**
     * @type {Integer (UInt32)}
     */
    static PRAny => 512

    /**
     * @type {Integer (UInt32)}
     */
    static QUERY_SORTXASCEND => 2

    /**
     * @type {Integer (UInt32)}
     */
    static QUERY_SORTXDESCEND => 3

    /**
     * @type {Integer (UInt32)}
     */
    static QUERY_SORTDEFAULT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CATEGORIZE_UNIQUE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CATEGORIZE_CLUSTER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CATEGORIZE_BUCKETS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static BUCKET_LINEAR => 0

    /**
     * @type {Integer (UInt32)}
     */
    static BUCKET_EXPONENTIAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CATEGORIZE_RANGE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static OCC_INVALID => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_QUERY_RANK => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static OSP_IndexLabel => 0

    /**
     * @type {Integer (Int32)}
     */
    static SQL_NULL_DATA => -1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DATA_AT_EXEC => -2

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_SUCCESS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_SUCCESS_WITH_INFO => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_NO_DATA => 100

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_PARAM_DATA_AVAILABLE => 101

    /**
     * @type {Integer (Int32)}
     */
    static SQL_ERROR => -1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_INVALID_HANDLE => -2

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_STILL_EXECUTING => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_NEED_DATA => 99

    /**
     * @type {Integer (Int32)}
     */
    static SQL_NTS => -3

    /**
     * @type {Integer (Int32)}
     */
    static SQL_NTSL => -3

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_MAX_MESSAGE_LENGTH => 512

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DATE_LEN => 10

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_TIME_LEN => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_TIMESTAMP_LEN => 19

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_HANDLE_ENV => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_HANDLE_DBC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_HANDLE_STMT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_HANDLE_DESC => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ATTR_OUTPUT_NTS => 10001

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ATTR_AUTO_IPD => 10001

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ATTR_METADATA_ID => 10014

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ATTR_APP_ROW_DESC => 10010

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ATTR_APP_PARAM_DESC => 10011

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ATTR_IMP_ROW_DESC => 10012

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ATTR_IMP_PARAM_DESC => 10013

    /**
     * @type {Integer (Int32)}
     */
    static SQL_ATTR_CURSOR_SCROLLABLE => -1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_ATTR_CURSOR_SENSITIVITY => -2

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_NONSCROLLABLE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_SCROLLABLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DESC_COUNT => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DESC_TYPE => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DESC_LENGTH => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DESC_OCTET_LENGTH_PTR => 1004

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DESC_PRECISION => 1005

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DESC_SCALE => 1006

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DESC_DATETIME_INTERVAL_CODE => 1007

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DESC_NULLABLE => 1008

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DESC_INDICATOR_PTR => 1009

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DESC_DATA_PTR => 1010

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DESC_NAME => 1011

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DESC_UNNAMED => 1012

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DESC_OCTET_LENGTH => 1013

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DESC_ALLOC_TYPE => 1099

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DIAG_RETURNCODE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DIAG_NUMBER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DIAG_ROW_COUNT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DIAG_SQLSTATE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DIAG_NATIVE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DIAG_MESSAGE_TEXT => 6

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DIAG_DYNAMIC_FUNCTION => 7

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DIAG_CLASS_ORIGIN => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DIAG_SUBCLASS_ORIGIN => 9

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DIAG_CONNECTION_NAME => 10

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DIAG_SERVER_NAME => 11

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DIAG_DYNAMIC_FUNCTION_CODE => 12

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DIAG_ALTER_DOMAIN => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DIAG_ALTER_TABLE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DIAG_CALL => 7

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DIAG_CREATE_ASSERTION => 6

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DIAG_CREATE_CHARACTER_SET => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DIAG_CREATE_COLLATION => 10

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DIAG_CREATE_DOMAIN => 23

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DIAG_CREATE_INDEX => -1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DIAG_CREATE_SCHEMA => 64

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DIAG_CREATE_TABLE => 77

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DIAG_CREATE_TRANSLATION => 79

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DIAG_CREATE_VIEW => 84

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DIAG_DELETE_WHERE => 19

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DIAG_DROP_ASSERTION => 24

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DIAG_DROP_CHARACTER_SET => 25

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DIAG_DROP_COLLATION => 26

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DIAG_DROP_DOMAIN => 27

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DIAG_DROP_INDEX => -2

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DIAG_DROP_SCHEMA => 31

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DIAG_DROP_TABLE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DIAG_DROP_TRANSLATION => 33

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DIAG_DROP_VIEW => 36

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DIAG_DYNAMIC_DELETE_CURSOR => 38

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DIAG_DYNAMIC_UPDATE_CURSOR => 81

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DIAG_GRANT => 48

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DIAG_INSERT => 50

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DIAG_REVOKE => 59

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DIAG_SELECT_CURSOR => 85

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DIAG_UNKNOWN_STATEMENT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DIAG_UPDATE_WHERE => 82

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_UNKNOWN_TYPE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CHAR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_NUMERIC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DECIMAL => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_INTEGER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_SMALLINT => 5

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_FLOAT => 6

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_REAL => 7

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DOUBLE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DATETIME => 9

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_VARCHAR => 12

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_TYPE_DATE => 91

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_TYPE_TIME => 92

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_TYPE_TIMESTAMP => 93

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_UNSPECIFIED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_INSENSITIVE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_SENSITIVE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ALL_TYPES => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DEFAULT => 99

    /**
     * @type {Integer (Int32)}
     */
    static SQL_ARD_TYPE => -99

    /**
     * @type {Integer (Int32)}
     */
    static SQL_APD_TYPE => -100

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CODE_DATE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CODE_TIME => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CODE_TIMESTAMP => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_FALSE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_TRUE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_NO_NULLS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_NULLABLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_NULLABLE_UNKNOWN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_PRED_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_PRED_CHAR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_PRED_BASIC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_NAMED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_UNNAMED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DESC_ALLOC_AUTO => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DESC_ALLOC_USER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CLOSE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DROP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_UNBIND => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_RESET_PARAMS => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_FETCH_NEXT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_FETCH_FIRST => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_FETCH_LAST => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_FETCH_PRIOR => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_FETCH_ABSOLUTE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_FETCH_RELATIVE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_COMMIT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ROLLBACK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_NULL_HENV => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_NULL_HDBC => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_NULL_HSTMT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_NULL_HDESC => 0

    /**
     * @type {Integer (Int32)}
     */
    static SQL_NULL_HANDLE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_SCOPE_CURROW => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_SCOPE_TRANSACTION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_SCOPE_SESSION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_PC_UNKNOWN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_PC_NON_PSEUDO => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_PC_PSEUDO => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ROW_IDENTIFIER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_INDEX_UNIQUE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_INDEX_ALL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_INDEX_CLUSTERED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_INDEX_HASHED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_INDEX_OTHER => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_SQLALLOCCONNECT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_SQLALLOCENV => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_SQLALLOCHANDLE => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_SQLALLOCSTMT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_SQLBINDCOL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_SQLBINDPARAM => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_SQLCANCEL => 5

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_SQLCLOSECURSOR => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_SQLCOLATTRIBUTE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_SQLCOLUMNS => 40

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_SQLCONNECT => 7

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_SQLCOPYDESC => 1004

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_SQLDATASOURCES => 57

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_SQLDESCRIBECOL => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_SQLDISCONNECT => 9

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_SQLENDTRAN => 1005

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_SQLERROR => 10

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_SQLEXECDIRECT => 11

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_SQLEXECUTE => 12

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_SQLFETCH => 13

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_SQLFETCHSCROLL => 1021

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_SQLFREECONNECT => 14

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_SQLFREEENV => 15

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_SQLFREEHANDLE => 1006

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_SQLFREESTMT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_SQLGETCONNECTATTR => 1007

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_SQLGETCONNECTOPTION => 42

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_SQLGETCURSORNAME => 17

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_SQLGETDATA => 43

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_SQLGETDESCFIELD => 1008

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_SQLGETDESCREC => 1009

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_SQLGETDIAGFIELD => 1010

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_SQLGETDIAGREC => 1011

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_SQLGETENVATTR => 1012

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_SQLGETFUNCTIONS => 44

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_SQLGETINFO => 45

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_SQLGETSTMTATTR => 1014

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_SQLGETSTMTOPTION => 46

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_SQLGETTYPEINFO => 47

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_SQLNUMRESULTCOLS => 18

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_SQLPARAMDATA => 48

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_SQLPREPARE => 19

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_SQLPUTDATA => 49

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_SQLROWCOUNT => 20

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_SQLSETCONNECTATTR => 1016

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_SQLSETCONNECTOPTION => 50

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_SQLSETCURSORNAME => 21

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_SQLSETDESCFIELD => 1017

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_SQLSETDESCREC => 1018

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_SQLSETENVATTR => 1019

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_SQLSETPARAM => 22

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_SQLSETSTMTATTR => 1020

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_SQLSETSTMTOPTION => 51

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_SQLSPECIALCOLUMNS => 52

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_SQLSTATISTICS => 53

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_SQLTABLES => 54

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_SQLTRANSACT => 23

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_SQLCANCELHANDLE => 1550

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_SQLCOMPLETEASYNC => 1551

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_MAX_DRIVER_CONNECTIONS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_MAXIMUM_DRIVER_CONNECTIONS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_MAX_CONCURRENT_ACTIVITIES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_MAXIMUM_CONCURRENT_ACTIVITIES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DATA_SOURCE_NAME => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_FETCH_DIRECTION => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_SERVER_NAME => 13

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_SEARCH_PATTERN_ESCAPE => 14

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DBMS_NAME => 17

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DBMS_VER => 18

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ACCESSIBLE_TABLES => 19

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ACCESSIBLE_PROCEDURES => 20

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CURSOR_COMMIT_BEHAVIOR => 23

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DATA_SOURCE_READ_ONLY => 25

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DEFAULT_TXN_ISOLATION => 26

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_IDENTIFIER_CASE => 28

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_IDENTIFIER_QUOTE_CHAR => 29

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_MAX_COLUMN_NAME_LEN => 30

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_MAXIMUM_COLUMN_NAME_LENGTH => 30

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_MAX_CURSOR_NAME_LEN => 31

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_MAXIMUM_CURSOR_NAME_LENGTH => 31

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_MAX_SCHEMA_NAME_LEN => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_MAXIMUM_SCHEMA_NAME_LENGTH => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_MAX_CATALOG_NAME_LEN => 34

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_MAXIMUM_CATALOG_NAME_LENGTH => 34

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_MAX_TABLE_NAME_LEN => 35

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_SCROLL_CONCURRENCY => 43

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_TXN_CAPABLE => 46

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_TRANSACTION_CAPABLE => 46

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_USER_NAME => 47

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_TXN_ISOLATION_OPTION => 72

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_TRANSACTION_ISOLATION_OPTION => 72

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_INTEGRITY => 73

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_GETDATA_EXTENSIONS => 81

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_NULL_COLLATION => 85

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ALTER_TABLE => 86

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ORDER_BY_COLUMNS_IN_SELECT => 90

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_SPECIAL_CHARACTERS => 94

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_MAX_COLUMNS_IN_GROUP_BY => 97

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_MAXIMUM_COLUMNS_IN_GROUP_BY => 97

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_MAX_COLUMNS_IN_INDEX => 98

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_MAXIMUM_COLUMNS_IN_INDEX => 98

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_MAX_COLUMNS_IN_ORDER_BY => 99

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_MAXIMUM_COLUMNS_IN_ORDER_BY => 99

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_MAX_COLUMNS_IN_SELECT => 100

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_MAXIMUM_COLUMNS_IN_SELECT => 100

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_MAX_COLUMNS_IN_TABLE => 101

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_MAX_INDEX_SIZE => 102

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_MAXIMUM_INDEX_SIZE => 102

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_MAX_ROW_SIZE => 104

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_MAXIMUM_ROW_SIZE => 104

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_MAX_STATEMENT_LEN => 105

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_MAXIMUM_STATEMENT_LENGTH => 105

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_MAX_TABLES_IN_SELECT => 106

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_MAXIMUM_TABLES_IN_SELECT => 106

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_MAX_USER_NAME_LEN => 107

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_MAXIMUM_USER_NAME_LENGTH => 107

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_OJ_CAPABILITIES => 115

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_OUTER_JOIN_CAPABILITIES => 115

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_XOPEN_CLI_YEAR => 10000

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CURSOR_SENSITIVITY => 10001

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DESCRIBE_PARAMETER => 10002

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CATALOG_NAME => 10003

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_COLLATION_SEQ => 10004

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_MAX_IDENTIFIER_LEN => 10005

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_MAXIMUM_IDENTIFIER_LENGTH => 10005

    /**
     * @type {Integer (Int32)}
     */
    static SQL_AT_ADD_COLUMN => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_AT_DROP_COLUMN => 2

    /**
     * @type {Integer (Int32)}
     */
    static SQL_AT_ADD_CONSTRAINT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_AM_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_AM_CONNECTION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_AM_STATEMENT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CB_DELETE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CB_CLOSE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CB_PRESERVE => 2

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FD_FETCH_NEXT => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FD_FETCH_FIRST => 2

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FD_FETCH_LAST => 4

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FD_FETCH_PRIOR => 8

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FD_FETCH_ABSOLUTE => 16

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FD_FETCH_RELATIVE => 32

    /**
     * @type {Integer (Int32)}
     */
    static SQL_GD_ANY_COLUMN => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_GD_ANY_ORDER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_IC_UPPER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_IC_LOWER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_IC_SENSITIVE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_IC_MIXED => 4

    /**
     * @type {Integer (Int32)}
     */
    static SQL_OJ_LEFT => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_OJ_RIGHT => 2

    /**
     * @type {Integer (Int32)}
     */
    static SQL_OJ_FULL => 4

    /**
     * @type {Integer (Int32)}
     */
    static SQL_OJ_NESTED => 8

    /**
     * @type {Integer (Int32)}
     */
    static SQL_OJ_NOT_ORDERED => 16

    /**
     * @type {Integer (Int32)}
     */
    static SQL_OJ_INNER => 32

    /**
     * @type {Integer (Int32)}
     */
    static SQL_OJ_ALL_COMPARISON_OPS => 64

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SCCO_READ_ONLY => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SCCO_LOCK => 2

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SCCO_OPT_ROWVER => 4

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SCCO_OPT_VALUES => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_TC_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_TC_DML => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_TC_ALL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_TC_DDL_COMMIT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_TC_DDL_IGNORE => 4

    /**
     * @type {Integer (Int32)}
     */
    static SQL_TXN_READ_UNCOMMITTED => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_TRANSACTION_READ_UNCOMMITTED => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_TXN_READ_COMMITTED => 2

    /**
     * @type {Integer (Int32)}
     */
    static SQL_TRANSACTION_READ_COMMITTED => 2

    /**
     * @type {Integer (Int32)}
     */
    static SQL_TXN_REPEATABLE_READ => 4

    /**
     * @type {Integer (Int32)}
     */
    static SQL_TRANSACTION_REPEATABLE_READ => 4

    /**
     * @type {Integer (Int32)}
     */
    static SQL_TXN_SERIALIZABLE => 8

    /**
     * @type {Integer (Int32)}
     */
    static SQL_TRANSACTION_SERIALIZABLE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_NC_HIGH => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_NC_LOW => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_SPEC_MAJOR => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_SPEC_MINOR => 80

    /**
     * @type {String}
     */
    static SQL_SPEC_STRING => "03.80"

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_SQLSTATE_SIZE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_MAX_DSN_LENGTH => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_MAX_OPTION_STRING_LENGTH => 256

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_NO_DATA_FOUND => 100

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_HANDLE_SENV => 5

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ATTR_ODBC_VERSION => 200

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ATTR_CONNECTION_POOLING => 201

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ATTR_CP_MATCH => 202

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ATTR_APPLICATION_KEY => 203

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CP_OFF => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CP_ONE_PER_DRIVER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CP_ONE_PER_HENV => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CP_DRIVER_AWARE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CP_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CP_STRICT_MATCH => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CP_RELAXED_MATCH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CP_MATCH_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_OV_ODBC2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_OV_ODBC3 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_OV_ODBC3_80 => 380

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ACCESS_MODE => 101

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_AUTOCOMMIT => 102

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_LOGIN_TIMEOUT => 103

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_OPT_TRACE => 104

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_OPT_TRACEFILE => 105

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_TRANSLATE_DLL => 106

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_TRANSLATE_OPTION => 107

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_TXN_ISOLATION => 108

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CURRENT_QUALIFIER => 109

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ODBC_CURSORS => 110

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_QUIET_MODE => 111

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_PACKET_SIZE => 112

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ATTR_ACCESS_MODE => 101

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ATTR_AUTOCOMMIT => 102

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ATTR_CONNECTION_TIMEOUT => 113

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ATTR_CURRENT_CATALOG => 109

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ATTR_DISCONNECT_BEHAVIOR => 114

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ATTR_ENLIST_IN_DTC => 1207

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ATTR_ENLIST_IN_XA => 1208

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ATTR_LOGIN_TIMEOUT => 103

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ATTR_ODBC_CURSORS => 110

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ATTR_PACKET_SIZE => 112

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ATTR_QUIET_MODE => 111

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ATTR_TRACE => 104

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ATTR_TRACEFILE => 105

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ATTR_TRANSLATE_LIB => 106

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ATTR_TRANSLATE_OPTION => 107

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ATTR_TXN_ISOLATION => 108

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ATTR_CONNECTION_DEAD => 1209

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ATTR_ANSI_APP => 115

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ATTR_RESET_CONNECTION => 116

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ATTR_ASYNC_DBC_FUNCTIONS_ENABLE => 117

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ATTR_ASYNC_DBC_EVENT => 119

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CONNECT_OPT_DRVR_START => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CONN_OPT_MAX => 112

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CONN_OPT_MIN => 101

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_MODE_READ_WRITE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_MODE_READ_ONLY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_MODE_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_AUTOCOMMIT_OFF => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_AUTOCOMMIT_ON => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_AUTOCOMMIT_DEFAULT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_LOGIN_TIMEOUT_DEFAULT => 15

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_OPT_TRACE_OFF => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_OPT_TRACE_ON => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_OPT_TRACE_DEFAULT => 0

    /**
     * @type {String}
     */
    static SQL_OPT_TRACE_FILE_DEFAULT => "\SQL.LOG"

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CUR_USE_IF_NEEDED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CUR_USE_ODBC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CUR_USE_DRIVER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CUR_DEFAULT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DB_RETURN_TO_POOL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DB_DISCONNECT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DB_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DTC_DONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CD_TRUE => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CD_FALSE => 0

    /**
     * @type {Integer (Int32)}
     */
    static SQL_AA_TRUE => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_AA_FALSE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_RESET_CONNECTION_YES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ASYNC_DBC_ENABLE_ON => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ASYNC_DBC_ENABLE_OFF => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ASYNC_DBC_ENABLE_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_QUERY_TIMEOUT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_MAX_ROWS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_NOSCAN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_MAX_LENGTH => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ASYNC_ENABLE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_BIND_TYPE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CURSOR_TYPE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CONCURRENCY => 7

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_KEYSET_SIZE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ROWSET_SIZE => 9

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_SIMULATE_CURSOR => 10

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_RETRIEVE_DATA => 11

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_USE_BOOKMARKS => 12

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_GET_BOOKMARK => 13

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ROW_NUMBER => 14

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ATTR_ASYNC_ENABLE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ATTR_CONCURRENCY => 7

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ATTR_CURSOR_TYPE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ATTR_ENABLE_AUTO_IPD => 15

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ATTR_FETCH_BOOKMARK_PTR => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ATTR_KEYSET_SIZE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ATTR_MAX_LENGTH => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ATTR_MAX_ROWS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ATTR_NOSCAN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ATTR_PARAM_BIND_OFFSET_PTR => 17

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ATTR_PARAM_BIND_TYPE => 18

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ATTR_PARAM_OPERATION_PTR => 19

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ATTR_PARAM_STATUS_PTR => 20

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ATTR_PARAMS_PROCESSED_PTR => 21

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ATTR_PARAMSET_SIZE => 22

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ATTR_QUERY_TIMEOUT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ATTR_RETRIEVE_DATA => 11

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ATTR_ROW_BIND_OFFSET_PTR => 23

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ATTR_ROW_BIND_TYPE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ATTR_ROW_NUMBER => 14

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ATTR_ROW_OPERATION_PTR => 24

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ATTR_ROW_STATUS_PTR => 25

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ATTR_ROWS_FETCHED_PTR => 26

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ATTR_ROW_ARRAY_SIZE => 27

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ATTR_SIMULATE_CURSOR => 10

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ATTR_USE_BOOKMARKS => 12

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ATTR_ASYNC_STMT_EVENT => 29

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_STMT_OPT_MAX => 14

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_STMT_OPT_MIN => 0

    /**
     * @type {Integer (Int32)}
     */
    static SQL_IS_POINTER => -4

    /**
     * @type {Integer (Int32)}
     */
    static SQL_IS_UINTEGER => -5

    /**
     * @type {Integer (Int32)}
     */
    static SQL_IS_INTEGER => -6

    /**
     * @type {Integer (Int32)}
     */
    static SQL_IS_USMALLINT => -7

    /**
     * @type {Integer (Int32)}
     */
    static SQL_IS_SMALLINT => -8

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_PARAM_BIND_BY_COLUMN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_PARAM_BIND_TYPE_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_QUERY_TIMEOUT_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_MAX_ROWS_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_NOSCAN_OFF => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_NOSCAN_ON => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_NOSCAN_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_MAX_LENGTH_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ASYNC_ENABLE_OFF => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ASYNC_ENABLE_ON => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ASYNC_ENABLE_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_BIND_BY_COLUMN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_BIND_TYPE_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CONCUR_READ_ONLY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CONCUR_LOCK => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CONCUR_ROWVER => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CONCUR_VALUES => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CONCUR_DEFAULT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CURSOR_FORWARD_ONLY => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CURSOR_KEYSET_DRIVEN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CURSOR_DYNAMIC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CURSOR_STATIC => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CURSOR_TYPE_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ROWSET_SIZE_DEFAULT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_KEYSET_SIZE_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_SC_NON_UNIQUE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_SC_TRY_UNIQUE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_SC_UNIQUE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_RD_OFF => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_RD_ON => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_RD_DEFAULT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_UB_OFF => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_UB_ON => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_UB_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_UB_FIXED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_UB_VARIABLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DESC_ARRAY_SIZE => 20

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DESC_ARRAY_STATUS_PTR => 21

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DESC_BASE_COLUMN_NAME => 22

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DESC_BASE_TABLE_NAME => 23

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DESC_BIND_OFFSET_PTR => 24

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DESC_BIND_TYPE => 25

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DESC_DATETIME_INTERVAL_PRECISION => 26

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DESC_LITERAL_PREFIX => 27

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DESC_LITERAL_SUFFIX => 28

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DESC_LOCAL_TYPE_NAME => 29

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DESC_MAXIMUM_SCALE => 30

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DESC_MINIMUM_SCALE => 31

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DESC_NUM_PREC_RADIX => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DESC_PARAMETER_TYPE => 33

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DESC_ROWS_PROCESSED_PTR => 34

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DESC_ROWVER => 35

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DIAG_CURSOR_ROW_COUNT => -1249

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DIAG_ROW_NUMBER => -1248

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DIAG_COLUMN_NUMBER => -1247

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DATE => 9

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_INTERVAL => 10

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_TIME => 10

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_TIMESTAMP => 11

    /**
     * @type {Integer (Int32)}
     */
    static SQL_LONGVARCHAR => -1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_BINARY => -2

    /**
     * @type {Integer (Int32)}
     */
    static SQL_VARBINARY => -3

    /**
     * @type {Integer (Int32)}
     */
    static SQL_LONGVARBINARY => -4

    /**
     * @type {Integer (Int32)}
     */
    static SQL_BIGINT => -5

    /**
     * @type {Integer (Int32)}
     */
    static SQL_TINYINT => -6

    /**
     * @type {Integer (Int32)}
     */
    static SQL_BIT => -7

    /**
     * @type {Integer (Int32)}
     */
    static SQL_GUID => -11

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CODE_YEAR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CODE_MONTH => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CODE_DAY => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CODE_HOUR => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CODE_MINUTE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CODE_SECOND => 6

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CODE_YEAR_TO_MONTH => 7

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CODE_DAY_TO_HOUR => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CODE_DAY_TO_MINUTE => 9

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CODE_DAY_TO_SECOND => 10

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CODE_HOUR_TO_MINUTE => 11

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CODE_HOUR_TO_SECOND => 12

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CODE_MINUTE_TO_SECOND => 13

    /**
     * @type {Integer (Int32)}
     */
    static SQL_INTERVAL_YEAR => -80

    /**
     * @type {Integer (Int32)}
     */
    static SQL_INTERVAL_MONTH => -81

    /**
     * @type {Integer (Int32)}
     */
    static SQL_INTERVAL_YEAR_TO_MONTH => -82

    /**
     * @type {Integer (Int32)}
     */
    static SQL_INTERVAL_DAY => -83

    /**
     * @type {Integer (Int32)}
     */
    static SQL_INTERVAL_HOUR => -84

    /**
     * @type {Integer (Int32)}
     */
    static SQL_INTERVAL_MINUTE => -85

    /**
     * @type {Integer (Int32)}
     */
    static SQL_INTERVAL_SECOND => -86

    /**
     * @type {Integer (Int32)}
     */
    static SQL_INTERVAL_DAY_TO_HOUR => -87

    /**
     * @type {Integer (Int32)}
     */
    static SQL_INTERVAL_DAY_TO_MINUTE => -88

    /**
     * @type {Integer (Int32)}
     */
    static SQL_INTERVAL_DAY_TO_SECOND => -89

    /**
     * @type {Integer (Int32)}
     */
    static SQL_INTERVAL_HOUR_TO_MINUTE => -90

    /**
     * @type {Integer (Int32)}
     */
    static SQL_INTERVAL_HOUR_TO_SECOND => -91

    /**
     * @type {Integer (Int32)}
     */
    static SQL_INTERVAL_MINUTE_TO_SECOND => -92

    /**
     * @type {Integer (Int32)}
     */
    static SQL_UNICODE => -95

    /**
     * @type {Integer (Int32)}
     */
    static SQL_UNICODE_VARCHAR => -96

    /**
     * @type {Integer (Int32)}
     */
    static SQL_UNICODE_LONGVARCHAR => -97

    /**
     * @type {Integer (Int32)}
     */
    static SQL_UNICODE_CHAR => -95

    /**
     * @type {Integer (Int32)}
     */
    static SQL_TYPE_DRIVER_START => -80

    /**
     * @type {Integer (Int32)}
     */
    static SQL_TYPE_DRIVER_END => -97

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_C_CHAR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_C_LONG => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_C_SHORT => 5

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_C_FLOAT => 7

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_C_DOUBLE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_C_NUMERIC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_C_DEFAULT => 99

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SIGNED_OFFSET => -20

    /**
     * @type {Integer (Int32)}
     */
    static SQL_UNSIGNED_OFFSET => -22

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_C_DATE => 9

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_C_TIME => 10

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_C_TIMESTAMP => 11

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_C_TYPE_DATE => 91

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_C_TYPE_TIME => 92

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_C_TYPE_TIMESTAMP => 93

    /**
     * @type {Integer (Int32)}
     */
    static SQL_C_INTERVAL_YEAR => -80

    /**
     * @type {Integer (Int32)}
     */
    static SQL_C_INTERVAL_MONTH => -81

    /**
     * @type {Integer (Int32)}
     */
    static SQL_C_INTERVAL_DAY => -83

    /**
     * @type {Integer (Int32)}
     */
    static SQL_C_INTERVAL_HOUR => -84

    /**
     * @type {Integer (Int32)}
     */
    static SQL_C_INTERVAL_MINUTE => -85

    /**
     * @type {Integer (Int32)}
     */
    static SQL_C_INTERVAL_SECOND => -86

    /**
     * @type {Integer (Int32)}
     */
    static SQL_C_INTERVAL_YEAR_TO_MONTH => -82

    /**
     * @type {Integer (Int32)}
     */
    static SQL_C_INTERVAL_DAY_TO_HOUR => -87

    /**
     * @type {Integer (Int32)}
     */
    static SQL_C_INTERVAL_DAY_TO_MINUTE => -88

    /**
     * @type {Integer (Int32)}
     */
    static SQL_C_INTERVAL_DAY_TO_SECOND => -89

    /**
     * @type {Integer (Int32)}
     */
    static SQL_C_INTERVAL_HOUR_TO_MINUTE => -90

    /**
     * @type {Integer (Int32)}
     */
    static SQL_C_INTERVAL_HOUR_TO_SECOND => -91

    /**
     * @type {Integer (Int32)}
     */
    static SQL_C_INTERVAL_MINUTE_TO_SECOND => -92

    /**
     * @type {Integer (Int32)}
     */
    static SQL_C_BINARY => -2

    /**
     * @type {Integer (Int32)}
     */
    static SQL_C_BIT => -7

    /**
     * @type {Integer (Int32)}
     */
    static SQL_C_TINYINT => -6

    /**
     * @type {Integer (Int32)}
     */
    static SQL_C_GUID => -11

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_TYPE_NULL => 0

    /**
     * @type {Integer (Int32)}
     */
    static SQL_TYPE_MIN => -7

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_TYPE_MAX => 12

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DRIVER_C_TYPE_BASE => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DRIVER_SQL_TYPE_BASE => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DRIVER_DESC_FIELD_BASE => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DRIVER_DIAG_FIELD_BASE => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DRIVER_INFO_TYPE_BASE => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DRIVER_CONN_ATTR_BASE => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DRIVER_STMT_ATTR_BASE => 16384

    /**
     * @type {Integer (Int32)}
     */
    static SQL_C_VARBOOKMARK => -2

    /**
     * @type {Integer (Int32)}
     */
    static SQL_NO_ROW_NUMBER => -1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_NO_COLUMN_NUMBER => -1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_ROW_NUMBER_UNKNOWN => -2

    /**
     * @type {Integer (Int32)}
     */
    static SQL_COLUMN_NUMBER_UNKNOWN => -2

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DEFAULT_PARAM => -5

    /**
     * @type {Integer (Int32)}
     */
    static SQL_IGNORE => -6

    /**
     * @type {Integer (Int32)}
     */
    static SQL_COLUMN_IGNORE => -6

    /**
     * @type {Integer (Int32)}
     */
    static SQL_LEN_DATA_AT_EXEC_OFFSET => -100

    /**
     * @type {Integer (Int32)}
     */
    static SQL_LEN_BINARY_ATTR_OFFSET => -100

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SETPARAM_VALUE_MAX => -1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_COLUMN_COUNT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_COLUMN_NAME => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_COLUMN_TYPE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_COLUMN_LENGTH => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_COLUMN_PRECISION => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_COLUMN_SCALE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_COLUMN_DISPLAY_SIZE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_COLUMN_NULLABLE => 7

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_COLUMN_UNSIGNED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_COLUMN_MONEY => 9

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_COLUMN_UPDATABLE => 10

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_COLUMN_AUTO_INCREMENT => 11

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_COLUMN_CASE_SENSITIVE => 12

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_COLUMN_SEARCHABLE => 13

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_COLUMN_TYPE_NAME => 14

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_COLUMN_TABLE_NAME => 15

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_COLUMN_OWNER_NAME => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_COLUMN_QUALIFIER_NAME => 17

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_COLUMN_LABEL => 18

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_COLATT_OPT_MAX => 18

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_COLUMN_DRIVER_START => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_COLATT_OPT_MIN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ATTR_READONLY => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ATTR_WRITE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ATTR_READWRITE_UNKNOWN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_UNSEARCHABLE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_LIKE_ONLY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ALL_EXCEPT_LIKE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_SEARCHABLE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_PRED_SEARCHABLE => 3

    /**
     * @type {Integer (Int32)}
     */
    static SQL_NO_TOTAL => -4

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_SQLALLOCHANDLESTD => 73

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_SQLBULKOPERATIONS => 24

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_SQLBINDPARAMETER => 72

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_SQLBROWSECONNECT => 55

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_SQLCOLATTRIBUTES => 6

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_SQLCOLUMNPRIVILEGES => 56

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_SQLDESCRIBEPARAM => 58

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_SQLDRIVERCONNECT => 41

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_SQLDRIVERS => 71

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_SQLPRIVATEDRIVERS => 79

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_SQLEXTENDEDFETCH => 59

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_SQLFOREIGNKEYS => 60

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_SQLMORERESULTS => 61

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_SQLNATIVESQL => 62

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_SQLNUMPARAMS => 63

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_SQLPARAMOPTIONS => 64

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_SQLPRIMARYKEYS => 65

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_SQLPROCEDURECOLUMNS => 66

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_SQLPROCEDURES => 67

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_SQLSETPOS => 68

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_SQLSETSCROLLOPTIONS => 69

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_SQLTABLEPRIVILEGES => 70

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_EXT_API_LAST => 72

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_NUM_FUNCTIONS => 23

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_EXT_API_START => 40

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_ALL_FUNCTIONS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_LOADBYORDINAL => 199

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_ODBC3_ALL_FUNCTIONS => 999

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_API_ODBC3_ALL_FUNCTIONS_SIZE => 250

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_INFO_FIRST => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ACTIVE_CONNECTIONS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ACTIVE_STATEMENTS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DRIVER_HDBC => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DRIVER_HENV => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DRIVER_HSTMT => 5

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DRIVER_NAME => 6

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DRIVER_VER => 7

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ODBC_API_CONFORMANCE => 9

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ODBC_VER => 10

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ROW_UPDATES => 11

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ODBC_SAG_CLI_CONFORMANCE => 12

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ODBC_SQL_CONFORMANCE => 15

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_PROCEDURES => 21

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CONCAT_NULL_BEHAVIOR => 22

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CURSOR_ROLLBACK_BEHAVIOR => 24

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_EXPRESSIONS_IN_ORDERBY => 27

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_MAX_OWNER_NAME_LEN => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_MAX_PROCEDURE_NAME_LEN => 33

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_MAX_QUALIFIER_NAME_LEN => 34

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_MULT_RESULT_SETS => 36

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_MULTIPLE_ACTIVE_TXN => 37

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_OUTER_JOINS => 38

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_OWNER_TERM => 39

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_PROCEDURE_TERM => 40

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_QUALIFIER_NAME_SEPARATOR => 41

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_QUALIFIER_TERM => 42

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_SCROLL_OPTIONS => 44

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_TABLE_TERM => 45

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CONVERT_FUNCTIONS => 48

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_NUMERIC_FUNCTIONS => 49

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_STRING_FUNCTIONS => 50

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_SYSTEM_FUNCTIONS => 51

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_TIMEDATE_FUNCTIONS => 52

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CONVERT_BIGINT => 53

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CONVERT_BINARY => 54

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CONVERT_BIT => 55

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CONVERT_CHAR => 56

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CONVERT_DATE => 57

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CONVERT_DECIMAL => 58

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CONVERT_DOUBLE => 59

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CONVERT_FLOAT => 60

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CONVERT_INTEGER => 61

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CONVERT_LONGVARCHAR => 62

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CONVERT_NUMERIC => 63

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CONVERT_REAL => 64

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CONVERT_SMALLINT => 65

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CONVERT_TIME => 66

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CONVERT_TIMESTAMP => 67

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CONVERT_TINYINT => 68

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CONVERT_VARBINARY => 69

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CONVERT_VARCHAR => 70

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CONVERT_LONGVARBINARY => 71

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ODBC_SQL_OPT_IEF => 73

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CORRELATION_NAME => 74

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_NON_NULLABLE_COLUMNS => 75

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DRIVER_HLIB => 76

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DRIVER_ODBC_VER => 77

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_LOCK_TYPES => 78

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_POS_OPERATIONS => 79

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_POSITIONED_STATEMENTS => 80

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_BOOKMARK_PERSISTENCE => 82

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_STATIC_SENSITIVITY => 83

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_FILE_USAGE => 84

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_COLUMN_ALIAS => 87

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_GROUP_BY => 88

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_KEYWORDS => 89

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_OWNER_USAGE => 91

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_QUALIFIER_USAGE => 92

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_QUOTED_IDENTIFIER_CASE => 93

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_SUBQUERIES => 95

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_UNION => 96

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_MAX_ROW_SIZE_INCLUDES_LONG => 103

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_MAX_CHAR_LITERAL_LEN => 108

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_TIMEDATE_ADD_INTERVALS => 109

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_TIMEDATE_DIFF_INTERVALS => 110

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_NEED_LONG_DATA_LEN => 111

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_MAX_BINARY_LITERAL_LEN => 112

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_LIKE_ESCAPE_CLAUSE => 113

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_QUALIFIER_LOCATION => 114

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_INFO_LAST => 114

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_INFO_DRIVER_START => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ACTIVE_ENVIRONMENTS => 116

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ALTER_DOMAIN => 117

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_SQL_CONFORMANCE => 118

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DATETIME_LITERALS => 119

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ASYNC_MODE => 10021

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_BATCH_ROW_COUNT => 120

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_BATCH_SUPPORT => 121

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CATALOG_LOCATION => 114

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CATALOG_NAME_SEPARATOR => 41

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CATALOG_TERM => 42

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CATALOG_USAGE => 92

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CONVERT_WCHAR => 122

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CONVERT_INTERVAL_DAY_TIME => 123

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CONVERT_INTERVAL_YEAR_MONTH => 124

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CONVERT_WLONGVARCHAR => 125

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CONVERT_WVARCHAR => 126

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CREATE_ASSERTION => 127

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CREATE_CHARACTER_SET => 128

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CREATE_COLLATION => 129

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CREATE_DOMAIN => 130

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CREATE_SCHEMA => 131

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CREATE_TABLE => 132

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CREATE_TRANSLATION => 133

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CREATE_VIEW => 134

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DRIVER_HDESC => 135

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DROP_ASSERTION => 136

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DROP_CHARACTER_SET => 137

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DROP_COLLATION => 138

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DROP_DOMAIN => 139

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DROP_SCHEMA => 140

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DROP_TABLE => 141

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DROP_TRANSLATION => 142

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DROP_VIEW => 143

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DYNAMIC_CURSOR_ATTRIBUTES1 => 144

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DYNAMIC_CURSOR_ATTRIBUTES2 => 145

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_FORWARD_ONLY_CURSOR_ATTRIBUTES1 => 146

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_FORWARD_ONLY_CURSOR_ATTRIBUTES2 => 147

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_INDEX_KEYWORDS => 148

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_INFO_SCHEMA_VIEWS => 149

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_KEYSET_CURSOR_ATTRIBUTES1 => 150

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_KEYSET_CURSOR_ATTRIBUTES2 => 151

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_MAX_ASYNC_CONCURRENT_STATEMENTS => 10022

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ODBC_INTERFACE_CONFORMANCE => 152

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_PARAM_ARRAY_ROW_COUNTS => 153

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_PARAM_ARRAY_SELECTS => 154

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_SCHEMA_TERM => 39

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_SCHEMA_USAGE => 91

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_SQL92_DATETIME_FUNCTIONS => 155

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_SQL92_FOREIGN_KEY_DELETE_RULE => 156

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_SQL92_FOREIGN_KEY_UPDATE_RULE => 157

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_SQL92_GRANT => 158

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_SQL92_NUMERIC_VALUE_FUNCTIONS => 159

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_SQL92_PREDICATES => 160

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_SQL92_RELATIONAL_JOIN_OPERATORS => 161

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_SQL92_REVOKE => 162

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_SQL92_ROW_VALUE_CONSTRUCTOR => 163

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_SQL92_STRING_FUNCTIONS => 164

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_SQL92_VALUE_EXPRESSIONS => 165

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_STANDARD_CLI_CONFORMANCE => 166

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_STATIC_CURSOR_ATTRIBUTES1 => 167

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_STATIC_CURSOR_ATTRIBUTES2 => 168

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_AGGREGATE_FUNCTIONS => 169

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DDL_INDEX => 170

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DM_VER => 171

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_INSERT_STATEMENT => 172

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CONVERT_GUID => 173

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_UNION_STATEMENT => 96

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ASYNC_DBC_FUNCTIONS => 10023

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DRIVER_AWARE_POOLING_SUPPORTED => 10024

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ASYNC_NOTIFICATION => 10025

    /**
     * @type {Integer (Int32)}
     */
    static SQL_ASYNC_NOTIFICATION_NOT_CAPABLE => 0

    /**
     * @type {Integer (Int32)}
     */
    static SQL_ASYNC_NOTIFICATION_CAPABLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DTC_TRANSITION_COST => 1750

    /**
     * @type {Integer (Int32)}
     */
    static SQL_AT_ADD_COLUMN_SINGLE => 32

    /**
     * @type {Integer (Int32)}
     */
    static SQL_AT_ADD_COLUMN_DEFAULT => 64

    /**
     * @type {Integer (Int32)}
     */
    static SQL_AT_ADD_COLUMN_COLLATION => 128

    /**
     * @type {Integer (Int32)}
     */
    static SQL_AT_SET_COLUMN_DEFAULT => 256

    /**
     * @type {Integer (Int32)}
     */
    static SQL_AT_DROP_COLUMN_DEFAULT => 512

    /**
     * @type {Integer (Int32)}
     */
    static SQL_AT_DROP_COLUMN_CASCADE => 1024

    /**
     * @type {Integer (Int32)}
     */
    static SQL_AT_DROP_COLUMN_RESTRICT => 2048

    /**
     * @type {Integer (Int32)}
     */
    static SQL_AT_ADD_TABLE_CONSTRAINT => 4096

    /**
     * @type {Integer (Int32)}
     */
    static SQL_AT_DROP_TABLE_CONSTRAINT_CASCADE => 8192

    /**
     * @type {Integer (Int32)}
     */
    static SQL_AT_DROP_TABLE_CONSTRAINT_RESTRICT => 16384

    /**
     * @type {Integer (Int32)}
     */
    static SQL_AT_CONSTRAINT_NAME_DEFINITION => 32768

    /**
     * @type {Integer (Int32)}
     */
    static SQL_AT_CONSTRAINT_INITIALLY_DEFERRED => 65536

    /**
     * @type {Integer (Int32)}
     */
    static SQL_AT_CONSTRAINT_INITIALLY_IMMEDIATE => 131072

    /**
     * @type {Integer (Int32)}
     */
    static SQL_AT_CONSTRAINT_DEFERRABLE => 262144

    /**
     * @type {Integer (Int32)}
     */
    static SQL_AT_CONSTRAINT_NON_DEFERRABLE => 524288

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CVT_CHAR => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CVT_NUMERIC => 2

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CVT_DECIMAL => 4

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CVT_INTEGER => 8

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CVT_SMALLINT => 16

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CVT_FLOAT => 32

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CVT_REAL => 64

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CVT_DOUBLE => 128

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CVT_VARCHAR => 256

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CVT_LONGVARCHAR => 512

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CVT_BINARY => 1024

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CVT_VARBINARY => 2048

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CVT_BIT => 4096

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CVT_TINYINT => 8192

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CVT_BIGINT => 16384

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CVT_DATE => 32768

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CVT_TIME => 65536

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CVT_TIMESTAMP => 131072

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CVT_LONGVARBINARY => 262144

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CVT_INTERVAL_YEAR_MONTH => 524288

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CVT_INTERVAL_DAY_TIME => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CVT_WCHAR => 2097152

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CVT_WLONGVARCHAR => 4194304

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CVT_WVARCHAR => 8388608

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CVT_GUID => 16777216

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_CVT_CONVERT => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_CVT_CAST => 2

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_STR_CONCAT => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_STR_INSERT => 2

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_STR_LEFT => 4

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_STR_LTRIM => 8

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_STR_LENGTH => 16

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_STR_LOCATE => 32

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_STR_LCASE => 64

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_STR_REPEAT => 128

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_STR_REPLACE => 256

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_STR_RIGHT => 512

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_STR_RTRIM => 1024

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_STR_SUBSTRING => 2048

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_STR_UCASE => 4096

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_STR_ASCII => 8192

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_STR_CHAR => 16384

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_STR_DIFFERENCE => 32768

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_STR_LOCATE_2 => 65536

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_STR_SOUNDEX => 131072

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_STR_SPACE => 262144

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_STR_BIT_LENGTH => 524288

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_STR_CHAR_LENGTH => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_STR_CHARACTER_LENGTH => 2097152

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_STR_OCTET_LENGTH => 4194304

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_STR_POSITION => 8388608

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SSF_CONVERT => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SSF_LOWER => 2

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SSF_UPPER => 4

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SSF_SUBSTRING => 8

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SSF_TRANSLATE => 16

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SSF_TRIM_BOTH => 32

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SSF_TRIM_LEADING => 64

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SSF_TRIM_TRAILING => 128

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_NUM_ABS => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_NUM_ACOS => 2

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_NUM_ASIN => 4

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_NUM_ATAN => 8

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_NUM_ATAN2 => 16

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_NUM_CEILING => 32

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_NUM_COS => 64

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_NUM_COT => 128

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_NUM_EXP => 256

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_NUM_FLOOR => 512

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_NUM_LOG => 1024

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_NUM_MOD => 2048

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_NUM_SIGN => 4096

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_NUM_SIN => 8192

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_NUM_SQRT => 16384

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_NUM_TAN => 32768

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_NUM_PI => 65536

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_NUM_RAND => 131072

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_NUM_DEGREES => 262144

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_NUM_LOG10 => 524288

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_NUM_POWER => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_NUM_RADIANS => 2097152

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_NUM_ROUND => 4194304

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_NUM_TRUNCATE => 8388608

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SNVF_BIT_LENGTH => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SNVF_CHAR_LENGTH => 2

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SNVF_CHARACTER_LENGTH => 4

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SNVF_EXTRACT => 8

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SNVF_OCTET_LENGTH => 16

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SNVF_POSITION => 32

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_TD_NOW => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_TD_CURDATE => 2

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_TD_DAYOFMONTH => 4

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_TD_DAYOFWEEK => 8

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_TD_DAYOFYEAR => 16

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_TD_MONTH => 32

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_TD_QUARTER => 64

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_TD_WEEK => 128

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_TD_YEAR => 256

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_TD_CURTIME => 512

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_TD_HOUR => 1024

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_TD_MINUTE => 2048

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_TD_SECOND => 4096

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_TD_TIMESTAMPADD => 8192

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_TD_TIMESTAMPDIFF => 16384

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_TD_DAYNAME => 32768

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_TD_MONTHNAME => 65536

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_TD_CURRENT_DATE => 131072

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_TD_CURRENT_TIME => 262144

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_TD_CURRENT_TIMESTAMP => 524288

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_TD_EXTRACT => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SDF_CURRENT_DATE => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SDF_CURRENT_TIME => 2

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SDF_CURRENT_TIMESTAMP => 4

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_SYS_USERNAME => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_SYS_DBNAME => 2

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_SYS_IFNULL => 4

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_TSI_FRAC_SECOND => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_TSI_SECOND => 2

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_TSI_MINUTE => 4

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_TSI_HOUR => 8

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_TSI_DAY => 16

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_TSI_WEEK => 32

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_TSI_MONTH => 64

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_TSI_QUARTER => 128

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FN_TSI_YEAR => 256

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CA1_NEXT => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CA1_ABSOLUTE => 2

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CA1_RELATIVE => 4

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CA1_BOOKMARK => 8

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CA1_LOCK_NO_CHANGE => 64

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CA1_LOCK_EXCLUSIVE => 128

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CA1_LOCK_UNLOCK => 256

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CA1_POS_POSITION => 512

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CA1_POS_UPDATE => 1024

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CA1_POS_DELETE => 2048

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CA1_POS_REFRESH => 4096

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CA1_POSITIONED_UPDATE => 8192

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CA1_POSITIONED_DELETE => 16384

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CA1_SELECT_FOR_UPDATE => 32768

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CA1_BULK_ADD => 65536

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CA1_BULK_UPDATE_BY_BOOKMARK => 131072

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CA1_BULK_DELETE_BY_BOOKMARK => 262144

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CA1_BULK_FETCH_BY_BOOKMARK => 524288

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CA2_READ_ONLY_CONCURRENCY => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CA2_LOCK_CONCURRENCY => 2

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CA2_OPT_ROWVER_CONCURRENCY => 4

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CA2_OPT_VALUES_CONCURRENCY => 8

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CA2_SENSITIVITY_ADDITIONS => 16

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CA2_SENSITIVITY_DELETIONS => 32

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CA2_SENSITIVITY_UPDATES => 64

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CA2_MAX_ROWS_SELECT => 128

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CA2_MAX_ROWS_INSERT => 256

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CA2_MAX_ROWS_DELETE => 512

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CA2_MAX_ROWS_UPDATE => 1024

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CA2_MAX_ROWS_CATALOG => 2048

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CA2_CRC_EXACT => 4096

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CA2_CRC_APPROXIMATE => 8192

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CA2_SIMULATE_NON_UNIQUE => 16384

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CA2_SIMULATE_TRY_UNIQUE => 32768

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CA2_SIMULATE_UNIQUE => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_OAC_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_OAC_LEVEL1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_OAC_LEVEL2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_OSCC_NOT_COMPLIANT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_OSCC_COMPLIANT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_OSC_MINIMUM => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_OSC_CORE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_OSC_EXTENDED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CB_NULL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CB_NON_NULL => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SO_FORWARD_ONLY => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SO_KEYSET_DRIVEN => 2

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SO_DYNAMIC => 4

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SO_MIXED => 8

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SO_STATIC => 16

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FD_FETCH_RESUME => 64

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FD_FETCH_BOOKMARK => 128

    /**
     * @type {Integer (Int32)}
     */
    static SQL_TXN_VERSIONING => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CN_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CN_DIFFERENT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CN_ANY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_NNC_NULL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_NNC_NON_NULL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_NC_START => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_NC_END => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_FILE_NOT_SUPPORTED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_FILE_TABLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_FILE_QUALIFIER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_FILE_CATALOG => 2

    /**
     * @type {Integer (Int32)}
     */
    static SQL_GD_BLOCK => 4

    /**
     * @type {Integer (Int32)}
     */
    static SQL_GD_BOUND => 8

    /**
     * @type {Integer (Int32)}
     */
    static SQL_GD_OUTPUT_PARAMS => 16

    /**
     * @type {Integer (Int32)}
     */
    static SQL_PS_POSITIONED_DELETE => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_PS_POSITIONED_UPDATE => 2

    /**
     * @type {Integer (Int32)}
     */
    static SQL_PS_SELECT_FOR_UPDATE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_GB_NOT_SUPPORTED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_GB_GROUP_BY_EQUALS_SELECT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_GB_GROUP_BY_CONTAINS_SELECT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_GB_NO_RELATION => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_GB_COLLATE => 4

    /**
     * @type {Integer (Int32)}
     */
    static SQL_OU_DML_STATEMENTS => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_OU_PROCEDURE_INVOCATION => 2

    /**
     * @type {Integer (Int32)}
     */
    static SQL_OU_TABLE_DEFINITION => 4

    /**
     * @type {Integer (Int32)}
     */
    static SQL_OU_INDEX_DEFINITION => 8

    /**
     * @type {Integer (Int32)}
     */
    static SQL_OU_PRIVILEGE_DEFINITION => 16

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SU_DML_STATEMENTS => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SU_PROCEDURE_INVOCATION => 2

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SU_TABLE_DEFINITION => 4

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SU_INDEX_DEFINITION => 8

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SU_PRIVILEGE_DEFINITION => 16

    /**
     * @type {Integer (Int32)}
     */
    static SQL_QU_DML_STATEMENTS => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_QU_PROCEDURE_INVOCATION => 2

    /**
     * @type {Integer (Int32)}
     */
    static SQL_QU_TABLE_DEFINITION => 4

    /**
     * @type {Integer (Int32)}
     */
    static SQL_QU_INDEX_DEFINITION => 8

    /**
     * @type {Integer (Int32)}
     */
    static SQL_QU_PRIVILEGE_DEFINITION => 16

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CU_DML_STATEMENTS => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CU_PROCEDURE_INVOCATION => 2

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CU_TABLE_DEFINITION => 4

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CU_INDEX_DEFINITION => 8

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CU_PRIVILEGE_DEFINITION => 16

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SQ_COMPARISON => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SQ_EXISTS => 2

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SQ_IN => 4

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SQ_QUANTIFIED => 8

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SQ_CORRELATED_SUBQUERIES => 16

    /**
     * @type {Integer (Int32)}
     */
    static SQL_U_UNION => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_U_UNION_ALL => 2

    /**
     * @type {Integer (Int32)}
     */
    static SQL_BP_CLOSE => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_BP_DELETE => 2

    /**
     * @type {Integer (Int32)}
     */
    static SQL_BP_DROP => 4

    /**
     * @type {Integer (Int32)}
     */
    static SQL_BP_TRANSACTION => 8

    /**
     * @type {Integer (Int32)}
     */
    static SQL_BP_UPDATE => 16

    /**
     * @type {Integer (Int32)}
     */
    static SQL_BP_OTHER_HSTMT => 32

    /**
     * @type {Integer (Int32)}
     */
    static SQL_BP_SCROLL => 64

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SS_ADDITIONS => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SS_DELETIONS => 2

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SS_UPDATES => 4

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CV_CREATE_VIEW => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CV_CHECK_OPTION => 2

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CV_CASCADED => 4

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CV_LOCAL => 8

    /**
     * @type {Integer (Int32)}
     */
    static SQL_LCK_NO_CHANGE => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_LCK_EXCLUSIVE => 2

    /**
     * @type {Integer (Int32)}
     */
    static SQL_LCK_UNLOCK => 4

    /**
     * @type {Integer (Int32)}
     */
    static SQL_POS_POSITION => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_POS_REFRESH => 2

    /**
     * @type {Integer (Int32)}
     */
    static SQL_POS_UPDATE => 4

    /**
     * @type {Integer (Int32)}
     */
    static SQL_POS_DELETE => 8

    /**
     * @type {Integer (Int32)}
     */
    static SQL_POS_ADD => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_QL_START => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_QL_END => 2

    /**
     * @type {Integer (Int32)}
     */
    static SQL_AF_AVG => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_AF_COUNT => 2

    /**
     * @type {Integer (Int32)}
     */
    static SQL_AF_MAX => 4

    /**
     * @type {Integer (Int32)}
     */
    static SQL_AF_MIN => 8

    /**
     * @type {Integer (Int32)}
     */
    static SQL_AF_SUM => 16

    /**
     * @type {Integer (Int32)}
     */
    static SQL_AF_DISTINCT => 32

    /**
     * @type {Integer (Int32)}
     */
    static SQL_AF_ALL => 64

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SC_SQL92_ENTRY => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SC_FIPS127_2_TRANSITIONAL => 2

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SC_SQL92_INTERMEDIATE => 4

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SC_SQL92_FULL => 8

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DL_SQL92_DATE => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DL_SQL92_TIME => 2

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DL_SQL92_TIMESTAMP => 4

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DL_SQL92_INTERVAL_YEAR => 8

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DL_SQL92_INTERVAL_MONTH => 16

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DL_SQL92_INTERVAL_DAY => 32

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DL_SQL92_INTERVAL_HOUR => 64

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DL_SQL92_INTERVAL_MINUTE => 128

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DL_SQL92_INTERVAL_SECOND => 256

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DL_SQL92_INTERVAL_YEAR_TO_MONTH => 512

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DL_SQL92_INTERVAL_DAY_TO_HOUR => 1024

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DL_SQL92_INTERVAL_DAY_TO_MINUTE => 2048

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DL_SQL92_INTERVAL_DAY_TO_SECOND => 4096

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DL_SQL92_INTERVAL_HOUR_TO_MINUTE => 8192

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DL_SQL92_INTERVAL_HOUR_TO_SECOND => 16384

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DL_SQL92_INTERVAL_MINUTE_TO_SECOND => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CL_START => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CL_END => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_BRC_PROCEDURES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_BRC_EXPLICIT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_BRC_ROLLED_UP => 4

    /**
     * @type {Integer (Int32)}
     */
    static SQL_BS_SELECT_EXPLICIT => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_BS_ROW_COUNT_EXPLICIT => 2

    /**
     * @type {Integer (Int32)}
     */
    static SQL_BS_SELECT_PROC => 4

    /**
     * @type {Integer (Int32)}
     */
    static SQL_BS_ROW_COUNT_PROC => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_PARC_BATCH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_PARC_NO_BATCH => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_PAS_BATCH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_PAS_NO_BATCH => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_PAS_NO_SELECT => 3

    /**
     * @type {Integer (Int32)}
     */
    static SQL_IK_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static SQL_IK_ASC => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_IK_DESC => 2

    /**
     * @type {Integer (Int32)}
     */
    static SQL_ISV_ASSERTIONS => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_ISV_CHARACTER_SETS => 2

    /**
     * @type {Integer (Int32)}
     */
    static SQL_ISV_CHECK_CONSTRAINTS => 4

    /**
     * @type {Integer (Int32)}
     */
    static SQL_ISV_COLLATIONS => 8

    /**
     * @type {Integer (Int32)}
     */
    static SQL_ISV_COLUMN_DOMAIN_USAGE => 16

    /**
     * @type {Integer (Int32)}
     */
    static SQL_ISV_COLUMN_PRIVILEGES => 32

    /**
     * @type {Integer (Int32)}
     */
    static SQL_ISV_COLUMNS => 64

    /**
     * @type {Integer (Int32)}
     */
    static SQL_ISV_CONSTRAINT_COLUMN_USAGE => 128

    /**
     * @type {Integer (Int32)}
     */
    static SQL_ISV_CONSTRAINT_TABLE_USAGE => 256

    /**
     * @type {Integer (Int32)}
     */
    static SQL_ISV_DOMAIN_CONSTRAINTS => 512

    /**
     * @type {Integer (Int32)}
     */
    static SQL_ISV_DOMAINS => 1024

    /**
     * @type {Integer (Int32)}
     */
    static SQL_ISV_KEY_COLUMN_USAGE => 2048

    /**
     * @type {Integer (Int32)}
     */
    static SQL_ISV_REFERENTIAL_CONSTRAINTS => 4096

    /**
     * @type {Integer (Int32)}
     */
    static SQL_ISV_SCHEMATA => 8192

    /**
     * @type {Integer (Int32)}
     */
    static SQL_ISV_SQL_LANGUAGES => 16384

    /**
     * @type {Integer (Int32)}
     */
    static SQL_ISV_TABLE_CONSTRAINTS => 32768

    /**
     * @type {Integer (Int32)}
     */
    static SQL_ISV_TABLE_PRIVILEGES => 65536

    /**
     * @type {Integer (Int32)}
     */
    static SQL_ISV_TABLES => 131072

    /**
     * @type {Integer (Int32)}
     */
    static SQL_ISV_TRANSLATIONS => 262144

    /**
     * @type {Integer (Int32)}
     */
    static SQL_ISV_USAGE_PRIVILEGES => 524288

    /**
     * @type {Integer (Int32)}
     */
    static SQL_ISV_VIEW_COLUMN_USAGE => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static SQL_ISV_VIEW_TABLE_USAGE => 2097152

    /**
     * @type {Integer (Int32)}
     */
    static SQL_ISV_VIEWS => 4194304

    /**
     * @type {Integer (Int32)}
     */
    static SQL_AD_CONSTRAINT_NAME_DEFINITION => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_AD_ADD_DOMAIN_CONSTRAINT => 2

    /**
     * @type {Integer (Int32)}
     */
    static SQL_AD_DROP_DOMAIN_CONSTRAINT => 4

    /**
     * @type {Integer (Int32)}
     */
    static SQL_AD_ADD_DOMAIN_DEFAULT => 8

    /**
     * @type {Integer (Int32)}
     */
    static SQL_AD_DROP_DOMAIN_DEFAULT => 16

    /**
     * @type {Integer (Int32)}
     */
    static SQL_AD_ADD_CONSTRAINT_INITIALLY_DEFERRED => 32

    /**
     * @type {Integer (Int32)}
     */
    static SQL_AD_ADD_CONSTRAINT_INITIALLY_IMMEDIATE => 64

    /**
     * @type {Integer (Int32)}
     */
    static SQL_AD_ADD_CONSTRAINT_DEFERRABLE => 128

    /**
     * @type {Integer (Int32)}
     */
    static SQL_AD_ADD_CONSTRAINT_NON_DEFERRABLE => 256

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CS_CREATE_SCHEMA => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CS_AUTHORIZATION => 2

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CS_DEFAULT_CHARACTER_SET => 4

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CTR_CREATE_TRANSLATION => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CA_CREATE_ASSERTION => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CA_CONSTRAINT_INITIALLY_DEFERRED => 16

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CA_CONSTRAINT_INITIALLY_IMMEDIATE => 32

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CA_CONSTRAINT_DEFERRABLE => 64

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CA_CONSTRAINT_NON_DEFERRABLE => 128

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CCS_CREATE_CHARACTER_SET => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CCS_COLLATE_CLAUSE => 2

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CCS_LIMITED_COLLATION => 4

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CCOL_CREATE_COLLATION => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CDO_CREATE_DOMAIN => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CDO_DEFAULT => 2

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CDO_CONSTRAINT => 4

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CDO_COLLATION => 8

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CDO_CONSTRAINT_NAME_DEFINITION => 16

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CDO_CONSTRAINT_INITIALLY_DEFERRED => 32

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CDO_CONSTRAINT_INITIALLY_IMMEDIATE => 64

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CDO_CONSTRAINT_DEFERRABLE => 128

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CDO_CONSTRAINT_NON_DEFERRABLE => 256

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CT_CREATE_TABLE => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CT_COMMIT_PRESERVE => 2

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CT_COMMIT_DELETE => 4

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CT_GLOBAL_TEMPORARY => 8

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CT_LOCAL_TEMPORARY => 16

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CT_CONSTRAINT_INITIALLY_DEFERRED => 32

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CT_CONSTRAINT_INITIALLY_IMMEDIATE => 64

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CT_CONSTRAINT_DEFERRABLE => 128

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CT_CONSTRAINT_NON_DEFERRABLE => 256

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CT_COLUMN_CONSTRAINT => 512

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CT_COLUMN_DEFAULT => 1024

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CT_COLUMN_COLLATION => 2048

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CT_TABLE_CONSTRAINT => 4096

    /**
     * @type {Integer (Int32)}
     */
    static SQL_CT_CONSTRAINT_NAME_DEFINITION => 8192

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DI_CREATE_INDEX => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DI_DROP_INDEX => 2

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DC_DROP_COLLATION => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DD_DROP_DOMAIN => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DD_RESTRICT => 2

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DD_CASCADE => 4

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DS_DROP_SCHEMA => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DS_RESTRICT => 2

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DS_CASCADE => 4

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DCS_DROP_CHARACTER_SET => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DA_DROP_ASSERTION => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DT_DROP_TABLE => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DT_RESTRICT => 2

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DT_CASCADE => 4

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DTR_DROP_TRANSLATION => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DV_DROP_VIEW => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DV_RESTRICT => 2

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DV_CASCADE => 4

    /**
     * @type {Integer (Int32)}
     */
    static SQL_IS_INSERT_LITERALS => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_IS_INSERT_SEARCHED => 2

    /**
     * @type {Integer (Int32)}
     */
    static SQL_IS_SELECT_INTO => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_OIC_CORE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_OIC_LEVEL1 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_OIC_LEVEL2 => 3

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SFKD_CASCADE => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SFKD_NO_ACTION => 2

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SFKD_SET_DEFAULT => 4

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SFKD_SET_NULL => 8

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SFKU_CASCADE => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SFKU_NO_ACTION => 2

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SFKU_SET_DEFAULT => 4

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SFKU_SET_NULL => 8

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SG_USAGE_ON_DOMAIN => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SG_USAGE_ON_CHARACTER_SET => 2

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SG_USAGE_ON_COLLATION => 4

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SG_USAGE_ON_TRANSLATION => 8

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SG_WITH_GRANT_OPTION => 16

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SG_DELETE_TABLE => 32

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SG_INSERT_TABLE => 64

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SG_INSERT_COLUMN => 128

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SG_REFERENCES_TABLE => 256

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SG_REFERENCES_COLUMN => 512

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SG_SELECT_TABLE => 1024

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SG_UPDATE_TABLE => 2048

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SG_UPDATE_COLUMN => 4096

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SP_EXISTS => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SP_ISNOTNULL => 2

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SP_ISNULL => 4

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SP_MATCH_FULL => 8

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SP_MATCH_PARTIAL => 16

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SP_MATCH_UNIQUE_FULL => 32

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SP_MATCH_UNIQUE_PARTIAL => 64

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SP_OVERLAPS => 128

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SP_UNIQUE => 256

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SP_LIKE => 512

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SP_IN => 1024

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SP_BETWEEN => 2048

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SP_COMPARISON => 4096

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SP_QUANTIFIED_COMPARISON => 8192

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SRJO_CORRESPONDING_CLAUSE => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SRJO_CROSS_JOIN => 2

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SRJO_EXCEPT_JOIN => 4

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SRJO_FULL_OUTER_JOIN => 8

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SRJO_INNER_JOIN => 16

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SRJO_INTERSECT_JOIN => 32

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SRJO_LEFT_OUTER_JOIN => 64

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SRJO_NATURAL_JOIN => 128

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SRJO_RIGHT_OUTER_JOIN => 256

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SRJO_UNION_JOIN => 512

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SR_USAGE_ON_DOMAIN => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SR_USAGE_ON_CHARACTER_SET => 2

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SR_USAGE_ON_COLLATION => 4

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SR_USAGE_ON_TRANSLATION => 8

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SR_GRANT_OPTION_FOR => 16

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SR_CASCADE => 32

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SR_RESTRICT => 64

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SR_DELETE_TABLE => 128

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SR_INSERT_TABLE => 256

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SR_INSERT_COLUMN => 512

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SR_REFERENCES_TABLE => 1024

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SR_REFERENCES_COLUMN => 2048

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SR_SELECT_TABLE => 4096

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SR_UPDATE_TABLE => 8192

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SR_UPDATE_COLUMN => 16384

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SRVC_VALUE_EXPRESSION => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SRVC_NULL => 2

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SRVC_DEFAULT => 4

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SRVC_ROW_SUBQUERY => 8

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SVE_CASE => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SVE_CAST => 2

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SVE_COALESCE => 4

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SVE_NULLIF => 8

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SCC_XOPEN_CLI_VERSION1 => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SCC_ISO92_CLI => 2

    /**
     * @type {Integer (Int32)}
     */
    static SQL_US_UNION => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_US_UNION_ALL => 2

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DRIVER_AWARE_POOLING_NOT_CAPABLE => 0

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DRIVER_AWARE_POOLING_CAPABLE => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DTC_ENLIST_EXPENSIVE => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_DTC_UNENLIST_EXPENSIVE => 2

    /**
     * @type {Integer (Int32)}
     */
    static SQL_ASYNC_DBC_NOT_CAPABLE => 0

    /**
     * @type {Integer (Int32)}
     */
    static SQL_ASYNC_DBC_CAPABLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_FETCH_FIRST_USER => 31

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_FETCH_FIRST_SYSTEM => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ENTIRE_ROWSET => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_POSITION => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_REFRESH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_UPDATE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DELETE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ADD => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_SETPOS_MAX_OPTION_VALUE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_UPDATE_BY_BOOKMARK => 5

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DELETE_BY_BOOKMARK => 6

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_FETCH_BY_BOOKMARK => 7

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_LOCK_NO_CHANGE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_LOCK_EXCLUSIVE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_LOCK_UNLOCK => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_SETPOS_MAX_LOCK_VALUE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_BEST_ROWID => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ROWVER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_PC_NOT_PSEUDO => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_QUICK => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ENSURE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_TABLE_STAT => 0

    /**
     * @type {String}
     */
    static SQL_ALL_CATALOGS => "%"

    /**
     * @type {String}
     */
    static SQL_ALL_SCHEMAS => "%"

    /**
     * @type {String}
     */
    static SQL_ALL_TABLE_TYPES => "%"

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DRIVER_NOPROMPT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DRIVER_COMPLETE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DRIVER_PROMPT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DRIVER_COMPLETE_REQUIRED => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_FETCH_BOOKMARK => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ROW_SUCCESS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ROW_DELETED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ROW_UPDATED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ROW_NOROW => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ROW_ADDED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ROW_ERROR => 5

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ROW_SUCCESS_WITH_INFO => 6

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ROW_PROCEED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ROW_IGNORE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_PARAM_SUCCESS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_PARAM_SUCCESS_WITH_INFO => 6

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_PARAM_ERROR => 5

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_PARAM_UNUSED => 7

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_PARAM_DIAG_UNAVAILABLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_PARAM_PROCEED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_PARAM_IGNORE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CASCADE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_RESTRICT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_SET_NULL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_NO_ACTION => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_SET_DEFAULT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_INITIALLY_DEFERRED => 5

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_INITIALLY_IMMEDIATE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_NOT_DEFERRABLE => 7

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_PARAM_TYPE_UNKNOWN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_PARAM_INPUT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_PARAM_INPUT_OUTPUT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_RESULT_COL => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_PARAM_OUTPUT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_RETURN_VALUE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_PARAM_INPUT_OUTPUT_STREAM => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_PARAM_OUTPUT_STREAM => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_PT_UNKNOWN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_PT_PROCEDURE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_PT_FUNCTION => 2

    /**
     * @type {String}
     */
    static SQL_ODBC_KEYWORDS => "ABSOLUTE,ACTION,ADA,ADD,ALL,ALLOCATE,ALTER,AND,ANY,ARE,AS,ASC,ASSERTION,AT,AUTHORIZATION,AVG,BEGIN,BETWEEN,BIT,BIT_LENGTH,BOTH,BY,CASCADE,CASCADED,CASE,CAST,CATALOG,CHAR,CHAR_LENGTH,CHARACTER,CHARACTER_LENGTH,CHECK,CLOSE,COALESCE,COLLATE,COLLATION,COLUMN,COMMIT,CONNECT,CONNECTION,CONSTRAINT,CONSTRAINTS,CONTINUE,CONVERT,CORRESPONDING,COUNT,CREATE,CROSS,CURRENT,CURRENT_DATE,CURRENT_TIME,CURRENT_TIMESTAMP,CURRENT_USER,CURSOR,DATE,DAY,DEALLOCATE,DEC,DECIMAL,DECLARE,DEFAULT,DEFERRABLE,DEFERRED,DELETE,DESC,DESCRIBE,DESCRIPTOR,DIAGNOSTICS,DISCONNECT,DISTINCT,DOMAIN,DOUBLE,DROP,ELSE,END,END-EXEC,ESCAPE,EXCEPT,EXCEPTION,EXEC,EXECUTE,EXISTS,EXTERNAL,EXTRACT,FALSE,FETCH,FIRST,FLOAT,FOR,FOREIGN,FORTRAN,FOUND,FROM,FULL,GET,GLOBAL,GO,GOTO,GRANT,GROUP,HAVING,HOUR,IDENTITY,IMMEDIATE,IN,INCLUDE,INDEX,INDICATOR,INITIALLY,INNER,INPUT,INSENSITIVE,INSERT,INT,INTEGER,INTERSECT,INTERVAL,INTO,IS,ISOLATION,JOIN,KEY,LANGUAGE,LAST,LEADING,LEFT,LEVEL,LIKE,LOCAL,LOWER,MATCH,MAX,MIN,MINUTE,MODULE,MONTH,NAMES,NATIONAL,NATURAL,NCHAR,NEXT,NO,NONE,NOT,NULL,NULLIF,NUMERIC,OCTET_LENGTH,OF,ON,ONLY,OPEN,OPTION,OR,ORDER,OUTER,OUTPUT,OVERLAPS,PAD,PARTIAL,PASCAL,PLI,POSITION,PRECISION,PREPARE,PRESERVE,PRIMARY,PRIOR,PRIVILEGES,PROCEDURE,PUBLIC,READ,REAL,REFERENCES,RELATIVE,RESTRICT,REVOKE,RIGHT,ROLLBACK,ROWSSCHEMA,SCROLL,SECOND,SECTION,SELECT,SESSION,SESSION_USER,SET,SIZE,SMALLINT,SOME,SPACE,SQL,SQLCA,SQLCODE,SQLERROR,SQLSTATE,SQLWARNING,SUBSTRING,SUM,SYSTEM_USER,TABLE,TEMPORARY,THEN,TIME,TIMESTAMP,TIMEZONE_HOUR,TIMEZONE_MINUTE,TO,TRAILING,TRANSACTION,TRANSLATE,TRANSLATION,TRIM,TRUE,UNION,UNIQUE,UNKNOWN,UPDATE,UPPER,USAGE,USER,USING,VALUE,VALUES,VARCHAR,VARYING,VIEW,WHEN,WHENEVER,WHERE,WITH,WORK,WRITE,YEAR,ZONE"

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_YEAR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_MONTH => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DAY => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_HOUR => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_MINUTE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_SECOND => 6

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_YEAR_TO_MONTH => 7

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DAY_TO_HOUR => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DAY_TO_MINUTE => 9

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DAY_TO_SECOND => 10

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_HOUR_TO_MINUTE => 11

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_HOUR_TO_SECOND => 12

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_MINUTE_TO_SECOND => 13

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_DATABASE_NAME => 16

    /**
     * @type {Integer (Int32)}
     */
    static SQL_FD_FETCH_PREV => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_FETCH_PREV => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CONCUR_TIMESTAMP => 3

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SCCO_OPT_TIMESTAMP => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CC_DELETE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CR_DELETE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CC_CLOSE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CR_CLOSE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CC_PRESERVE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CR_PRESERVE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_FETCH_RESUME => 7

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SCROLL_FORWARD_ONLY => 0

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SCROLL_KEYSET_DRIVEN => -1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SCROLL_DYNAMIC => -2

    /**
     * @type {Integer (Int32)}
     */
    static SQL_SCROLL_STATIC => -3

    /**
     * @type {Integer (UInt32)}
     */
    static TRACE_VERSION => 1000

    /**
     * @type {Integer (Int32)}
     */
    static TRACE_ON => 1

    /**
     * @type {Integer (Int32)}
     */
    static TRACE_VS_EVENT_ON => 2

    /**
     * @type {Integer (Int32)}
     */
    static ODBC_VS_FLAG_UNICODE_ARG => 1

    /**
     * @type {Integer (Int32)}
     */
    static ODBC_VS_FLAG_UNICODE_COR => 2

    /**
     * @type {Integer (Int32)}
     */
    static ODBC_VS_FLAG_RETCODE => 4

    /**
     * @type {Integer (Int32)}
     */
    static ODBC_VS_FLAG_STOP => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CRESTRICTIONS_DBSCHEMA_LINKEDSERVERS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SSPROP_ENABLEFASTLOAD => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SSPROP_UNICODELCID => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SSPROP_UNICODECOMPARISONSTYLE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SSPROP_COLUMNLEVELCOLLATION => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SSPROP_CHARACTERSET => 5

    /**
     * @type {Integer (UInt32)}
     */
    static SSPROP_SORTORDER => 6

    /**
     * @type {Integer (UInt32)}
     */
    static SSPROP_CURRENTCOLLATION => 7

    /**
     * @type {Integer (UInt32)}
     */
    static SSPROP_INIT_CURRENTLANGUAGE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SSPROP_INIT_NETWORKADDRESS => 5

    /**
     * @type {Integer (UInt32)}
     */
    static SSPROP_INIT_NETWORKLIBRARY => 6

    /**
     * @type {Integer (UInt32)}
     */
    static SSPROP_INIT_USEPROCFORPREP => 7

    /**
     * @type {Integer (UInt32)}
     */
    static SSPROP_INIT_AUTOTRANSLATE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SSPROP_INIT_PACKETSIZE => 9

    /**
     * @type {Integer (UInt32)}
     */
    static SSPROP_INIT_APPNAME => 10

    /**
     * @type {Integer (UInt32)}
     */
    static SSPROP_INIT_WSID => 11

    /**
     * @type {Integer (UInt32)}
     */
    static SSPROP_INIT_FILENAME => 12

    /**
     * @type {Integer (UInt32)}
     */
    static SSPROP_INIT_ENCRYPT => 13

    /**
     * @type {Integer (UInt32)}
     */
    static SSPROP_AUTH_REPL_SERVER_NAME => 14

    /**
     * @type {Integer (UInt32)}
     */
    static SSPROP_INIT_TAGCOLUMNCOLLATION => 15

    /**
     * @type {Integer (UInt32)}
     */
    static SSPROPVAL_USEPROCFORPREP_OFF => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SSPROPVAL_USEPROCFORPREP_ON => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SSPROPVAL_USEPROCFORPREP_ON_DROP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SSPROP_QUOTEDCATALOGNAMES => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SSPROP_ALLOWNATIVEVARIANT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SSPROP_SQLXMLXPROGID => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SSPROP_MAXBLOBLENGTH => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SSPROP_FASTLOADOPTIONS => 9

    /**
     * @type {Integer (UInt32)}
     */
    static SSPROP_FASTLOADKEEPNULLS => 10

    /**
     * @type {Integer (UInt32)}
     */
    static SSPROP_FASTLOADKEEPIDENTITY => 11

    /**
     * @type {Integer (UInt32)}
     */
    static SSPROP_CURSORAUTOFETCH => 12

    /**
     * @type {Integer (UInt32)}
     */
    static SSPROP_DEFERPREPARE => 13

    /**
     * @type {Integer (UInt32)}
     */
    static SSPROP_IRowsetFastLoad => 14

    /**
     * @type {Integer (UInt32)}
     */
    static SSPROP_COL_COLLATIONNAME => 14

    /**
     * @type {Integer (UInt32)}
     */
    static SSPROP_STREAM_MAPPINGSCHEMA => 15

    /**
     * @type {Integer (UInt32)}
     */
    static SSPROP_STREAM_XSL => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SSPROP_STREAM_BASEPATH => 17

    /**
     * @type {Integer (UInt32)}
     */
    static SSPROP_STREAM_COMMANDTYPE => 18

    /**
     * @type {Integer (UInt32)}
     */
    static SSPROP_STREAM_XMLROOT => 19

    /**
     * @type {Integer (UInt32)}
     */
    static SSPROP_STREAM_FLAGS => 20

    /**
     * @type {Integer (UInt32)}
     */
    static SSPROP_STREAM_CONTENTTYPE => 23

    /**
     * @type {Integer (UInt32)}
     */
    static STREAM_FLAGS_DISALLOW_URL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static STREAM_FLAGS_DISALLOW_ABSOLUTE_PATH => 2

    /**
     * @type {Integer (UInt32)}
     */
    static STREAM_FLAGS_DISALLOW_QUERY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static STREAM_FLAGS_DONTCACHEMAPPINGSCHEMA => 8

    /**
     * @type {Integer (UInt32)}
     */
    static STREAM_FLAGS_DONTCACHETEMPLATE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static STREAM_FLAGS_DONTCACHEXSL => 32

    /**
     * @type {Integer (UInt32)}
     */
    static STREAM_FLAGS_DISALLOW_UPDATEGRAMS => 64

    /**
     * @type {Integer (UInt32)}
     */
    static STREAM_FLAGS_RESERVED => 4294901760

    /**
     * @type {Integer (UInt32)}
     */
    static SSPROPVAL_COMMANDTYPE_REGULAR => 21

    /**
     * @type {Integer (UInt32)}
     */
    static SSPROPVAL_COMMANDTYPE_BULKLOAD => 22

    /**
     * @type {Integer (UInt32)}
     */
    static DBTYPE_SQLVARIANT => 144

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_HANDLE_DBC_INFO_TOKEN => 6

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CONN_POOL_RATING_BEST => 100

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CONN_POOL_RATING_GOOD_ENOUGH => 99

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_CONN_POOL_RATING_USELESS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ATTR_DBC_INFO_TOKEN => 118

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ATTR_ASYNC_DBC_NOTIFICATION_CALLBACK => 120

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ATTR_ASYNC_DBC_NOTIFICATION_CONTEXT => 121

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ATTR_ASYNC_STMT_NOTIFICATION_CALLBACK => 30

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_ATTR_ASYNC_STMT_NOTIFICATION_CONTEXT => 31

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_MAX_NUMERIC_LEN => 16

    /**
     * @type {Integer (Int32)}
     */
    static SQL_WCHAR => -8

    /**
     * @type {Integer (Int32)}
     */
    static SQL_WVARCHAR => -9

    /**
     * @type {Integer (Int32)}
     */
    static SQL_WLONGVARCHAR => -10

    /**
     * @type {Integer (Int32)}
     */
    static SQL_C_WCHAR => -8

    /**
     * @type {Integer (Int32)}
     */
    static SQL_C_TCHAR => -8

    /**
     * @type {Integer (UInt32)}
     */
    static SQL_SQLSTATE_SIZEW => 10

    /**
     * @type {Guid}
     */
    static PSGUID_STORAGE => Guid("{b725f130-47ef-101a-a5f1-02608c9eebac}")

    /**
     * @type {Integer (UInt32)}
     */
    static CSTORAGEPROPERTY => 23

    /**
     * @type {Integer (Int32)}
     */
    static CATEGORY_SEARCH => 1

    /**
     * @type {Integer (Int32)}
     */
    static CATEGORY_COLLATOR => 2

    /**
     * @type {Integer (Int32)}
     */
    static CATEGORY_GATHERER => 3

    /**
     * @type {Integer (Int32)}
     */
    static CATEGORY_INDEXER => 4

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_SSSEARCH_STARTED => 1073742827

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_SSSEARCH_STARTING_SETUP => 1073742828

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_SSSEARCH_SETUP_SUCCEEDED => 1073742829

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_SSSEARCH_SETUP_FAILED => -1073740818

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_OUTOFMEMORY => -1073740817

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_SSSEARCH_SETUP_CLEANUP_STARTED => -2147482640

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_EXCEPTION => -1073740815

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_SSSEARCH_SETUP_CLEANUP_SUCCEEDED => 1073742834

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_SSSEARCH_SETUP_CLEANUP_FAILED => -1073740813

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_SSSEARCH_STOPPED => 1073742837

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_SSSEARCH_CREATE_PATH_RULES_FAILED => -2147482634

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_SSSEARCH_DROPPED_EVENTS => -2147482633

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_SSSEARCH_DATAFILES_MOVE_FAILED => -1073740808

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_SSSEARCH_DATAFILES_MOVE_SUCCEEDED => 1073742841

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_SSSEARCH_DATAFILES_MOVE_ROLLBACK_ERRORS => -2147482630

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_SSSEARCH_CSM_SAVE_FAILED => -1073740805

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_CONFIG_SYNTAX => -2147482604

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_UNPRIVILEGED_SERVICE_ACCOUNT => -2147482596

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_SYSTEM_EXCEPTION => -2147482595

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_CONFIG_ERROR => -1073738821

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_GATHERSVC_PERFMON => -1073738818

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_GATHERER_PERFMON => -1073738817

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_HASHMAP_INSERT => -1073738816

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_TRANSLOG_CREATE_TRX => -1073738815

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_TRANSLOG_APPEND => -1073738814

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_TRANSLOG_UPDATE => -1073738813

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_HASHMAP_UPDATE => -1073738811

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_GATHER_EXCEPTION => -1073738810

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_TRANSACTION_READ => -1073738809

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_GATHER_END_CRAWL => 1073744842

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_GATHER_START_CRAWL => 1073744843

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_GATHER_INTERNAL => -1073738804

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_GATHER_CRAWL_NOT_STARTED => -2147480625

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_GATHER_CRAWL_SEED_ERROR => -2147480624

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_GATHER_CRITICAL_ERROR => -1073738799

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_GATHER_ADVISE_FAILED => -1073738798

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_GATHER_TRANSACTION_FAIL => -1073738797

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_GATHER_OBJ_INIT_FAILED => -1073738796

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_GATHER_PLUGIN_INIT_FAILED => -1073738795

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_GATHER_SERVICE_INIT => -1073738794

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_GATHER_CANT_CREATE_DOCID => -1073738793

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_GATHER_CANT_DELETE_DOCID => -1073738792

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_TRANSLOG_CREATE => -1073738791

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_REG_VERSION => -1073738790

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_GATHER_CRAWL_SEED_FAILED => -2147480612

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_GATHER_CRAWL_SEED_FAILED_INIT => -2147480611

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_GATHER_REG_MISSING => -2147480610

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_GATHER_CRAWL_IN_PROGRESS => -2147480609

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_GATHER_LOCK_FAILED => -1073738784

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_GATHER_RESET_START => 1073744865

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_GATHER_START_PAUSE => -2147480606

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_GATHER_THROTTLE => 1073744867

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_GATHER_RESUME => 1073744868

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_GATHER_AUTODESCLEN_ADJUSTED => -2147480603

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_GATHER_NO_CRAWL_SEEDS => -2147480602

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_GATHER_END_INCREMENTAL => 1073744871

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_GATHER_FROM_NOT_SET => -1073738776

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_GATHER_DELETING_HISTORY_ITEMS => -1073738774

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_GATHER_STOP_START => 1073744876

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_GATHER_START_CRAWL_IF_RESET => -2147480595

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_GATHER_DISK_FULL => -2147480594

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_GATHER_NO_SCHEMA => -2147480593

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_GATHER_AUTODESCENCODE_INVALID => -2147480592

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_GATHER_PLUGINMGR_INIT_FAILED => -1073738767

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_GATHER_APP_INIT_FAILED => -1073738766

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_FAILED_INITIALIZE_CRAWL => -1073738765

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_CRAWL_SCHEDULED => 1073744884

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_FAILED_CREATE_GATHERER_LOG => -2147480587

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_WBREAKER_NOT_LOADED => -2147480586

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_LEARN_PROPAGATION_COPY_FAILED => -2147480585

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_LEARN_CREATE_DB_FAILED => -2147480584

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_LEARN_COMPILE_FAILED => -2147480583

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_LEARN_PROPAGATION_FAILED => -2147480582

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_GATHER_END_ADAPTIVE => 1073744891

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_USING_DIFFERENT_WORD_BREAKER => -2147480580

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_GATHER_RESTORE_COMPLETE => 3069

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_GATHER_RESTORE_ERROR => -1073738754

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_AUTOCAT_PERFMON => -1073738753

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_GATHER_DIRTY_STARTUP => -2147480576

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_GATHER_HISTORY_CORRUPTION_DETECTED => -2147480575

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_GATHER_RESTOREAPP_ERROR => -1073738750

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_GATHER_RESTOREAPP_COMPLETE => 3075

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_GATHER_BACKUPAPP_ERROR => -1073738748

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_GATHER_BACKUPAPP_COMPLETE => 3077

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_GATHER_DAEMON_TERMINATED => -2147480570

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_NOTIFICATION_FAILURE => -1073738745

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_NOTIFICATION_FAILURE_SCOPE_EXCEEDED_LOGGING => -2147480568

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_NOTIFICATION_RESTORED => 1073744905

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_NOTIFICATION_RESTORED_SCOPE_EXCEEDED_LOGGING => -2147480566

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_GATHER_PROTOCOLHANDLER_LOAD_FAILED => -1073738741

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_GATHER_PROTOCOLHANDLER_INIT_FAILED => -1073738740

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_GATHER_INVALID_NETWORK_ACCESS_ACCOUNT => -1073738739

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_GATHER_SYSTEM_LCID_CHANGED => -2147480562

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_GATHER_FLUSH_FAILED => -1073738737

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_GATHER_CHECKPOINT_FAILED => -1073738736

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_GATHER_SAVE_FAILED => -1073738735

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_GATHER_RESTORE_CHECKPOINT_FAILED => -1073738734

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_GATHER_READ_CHECKPOINT_FAILED => -1073738733

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_GATHER_CHECKPOINT_CORRUPT => -1073738732

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_GATHER_CHECKPOINT_FILE_MISSING => -1073738731

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_STS_INIT_SECURITY_FAILED => -2147480554

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_LOCAL_GROUP_NOT_EXPANDED => 1073744919

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_LOCAL_GROUPS_CACHE_FLUSHED => 1073744920

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_GATHERER_DATASOURCE => -1073738727

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_AUTOCAT_CANT_CREATE_FILE_SHARE => -1073738726

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_NOTIFICATION_THREAD_EXIT_FAILED => -1073738725

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_FILTER_HOST_NOT_INITIALIZED => -1073738724

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_FILTER_HOST_NOT_TERMINATED => -1073738723

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_FILTERPOOL_ADD_FAILED => -1073738722

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_FILTERPOOL_DELETE_FAILED => -1073738721

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_ENUMERATE_SESSIONS_FAILED => -1073738720

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_DETAILED_FILTERPOOL_ADD_FAILED => -1073738719

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_AUDIENCECOMPUTATION_CANNOTSTART => -1073738223

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_GATHER_RECOVERY_FAILURE => -1073738222

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_GATHER_INPLACE_INDEX_REBUILD => 1073745427

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_INDEXER_STARTED => 1073748824

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_INDEXER_SCHEMA_COPY_ERROR => -1073734823

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_INDEXER_INIT_ERROR => -1073734814

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_INDEXER_INVALID_DIRECTORY => -1073734813

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_INDEXER_PROP_ERROR => -1073734812

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_INDEXER_PAUSED_FOR_DISKFULL => -1073734811

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_INDEXER_PROP_STOPPED => -2147476633

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_INDEXER_PROP_SUCCEEDED => 7016

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_INDEXER_PROP_STARTED => 1073748841

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_INDEXER_NO_SEARCH_SERVERS => -2147476630

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_INDEXER_ADD_DSS_SUCCEEDED => 7019

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_INDEXER_REMOVE_DSS_SUCCEEDED => 7020

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_INDEXER_ADD_DSS_FAILED => -2147476627

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_INDEXER_REMOVE_DSS_FAILED => -1073734801

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_INDEXER_DSS_CONTACT_FAILED => -1073734800

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_INDEXER_BUILD_FAILED => -1073734797

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_INDEXER_REG_MISSING => -1073734796

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_INDEXER_PROPSTORE_INIT_FAILED => -1073734787

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_INDEXER_CI_LOAD_ERROR => -1073734785

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_INDEXER_RESET_FOR_CORRUPTION => -1073734784

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_INDEXER_SHUTDOWN => 1073748866

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_INDEXER_LOAD_FAIL => -1073734781

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_INDEXER_PROP_STATE_CORRUPT => -1073734780

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_INDEXER_DSS_ALREADY_ADDED => 1073748870

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_INDEXER_BUILD_START => 1073748872

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_INDEXER_BUILD_ENDED => 1073748873

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_INDEXER_VERIFY_PROP_ACCOUNT => -1073734768

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_INDEXER_ADD_DSS_DISCONNECT => -2147476585

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_INDEXER_PERFMON => -1073734760

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_INDEXER_MISSING_APP_DIRECTORY => -1073734758

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_INDEXER_REG_ERROR => -1073734756

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_INDEXER_DSS_UNABLE_TO_REMOVE => -1073734755

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_INDEXER_NEW_PROJECT => -1073734754

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_INDEXER_REMOVED_PROJECT => -1073734753

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_INDEXER_PROP_COMMITTED => 1073748898

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_INDEXER_PROP_ABORTED => 1073748899

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_DSS_NOT_ENABLED => -2147476572

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_INDEXER_PROP_COMMIT_FAILED => -1073734747

    /**
     * @type {Integer (Int32)}
     */
    static JET_INIT_ERROR => -1073732824

    /**
     * @type {Integer (Int32)}
     */
    static JET_NEW_PROP_STORE_ERROR => -1073732823

    /**
     * @type {Integer (Int32)}
     */
    static JET_GET_PROP_STORE_ERROR => -1073732822

    /**
     * @type {Integer (Int32)}
     */
    static JET_MULTIINSTANCE_DISABLED => -2147474645

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_WARNING_CANNOT_UPGRADE_NOISE_FILES => -2147473635

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_WARNING_CANNOT_UPGRADE_NOISE_FILE => -2147473634

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_WIN32_ERROR => -2147473633

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_PERF_COUNTERS_NOT_LOADED => -2147473628

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_PERF_COUNTERS_REGISTRY_TROUBLE => -2147473627

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_PERF_COUNTERS_ALREADY_EXISTS => -2147473626

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_PROTOCOL_HOST_FORCE_TERMINATE => -2147473625

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_FILTER_HOST_FORCE_TERMINATE => -2147473624

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_INDEXER_OUT_OF_DATABASE_INSTANCE => -1073731799

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_INDEXER_FAIL_TO_SET_MAX_JETINSTANCE => -1073731798

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_INDEXER_FAIL_TO_CREATE_PER_USER_CATALOG => -1073731797

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_INDEXER_FAIL_TO_UNLOAD_PER_USER_CATALOG => -1073731796

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SOURCE_NETWORKING => 768

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SOURCE_DATASOURCE => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SOURCE_COLLATOR => 1280

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SOURCE_CONNMGR => 1536

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SOURCE_QUERY => 1792

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SOURCE_SCHEMA => 3072

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SOURCE_GATHERER => 3328

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SOURCE_INDEXER => 4352

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SOURCE_SETUP => 4864

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SOURCE_SECURITY => 5120

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SOURCE_CMDLINE => 5376

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SOURCE_NLADMIN => 6400

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SOURCE_SCRIPTPI => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SOURCE_MSS => 8448

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SOURCE_XML => 8704

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SOURCE_DAV => 8960

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SOURCE_FLTRDMN => 9216

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SOURCE_OLEDB_BINDER => 9472

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SOURCE_NOTESPH => 9728

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SOURCE_EXSTOREPH => 9984

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SOURCE_SRCH_SCHEMA_CACHE => 13056

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SOURCE_CONTENT_SOURCE => 13312

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SOURCE_REMOTE_EXSTOREPH => 13568

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SOURCE_PEOPLE_IMPORT => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_FTE => 13824

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_FTE_CB => 51968

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_FTE_FD => 64768

    /**
     * @type {Integer (Int32)}
     */
    static XML_E_NODEFAULTNS => -2147212800

    /**
     * @type {Integer (Int32)}
     */
    static XML_E_BADSXQL => -2147212799

    /**
     * @type {Integer (Int32)}
     */
    static MSS_E_INVALIDAPPNAME => -2147213056

    /**
     * @type {Integer (Int32)}
     */
    static MSS_E_APPNOTFOUND => -2147213055

    /**
     * @type {Integer (Int32)}
     */
    static MSS_E_APPALREADYEXISTS => -2147213054

    /**
     * @type {Integer (Int32)}
     */
    static MSS_E_CATALOGNOTFOUND => -2147213053

    /**
     * @type {Integer (Int32)}
     */
    static MSS_E_CATALOGSTOPPING => -2147213052

    /**
     * @type {Integer (Int32)}
     */
    static MSS_E_UNICODEFILEHEADERMISSING => -2147213051

    /**
     * @type {Integer (Int32)}
     */
    static MSS_E_CATALOGALREADYEXISTS => -2147213050

    /**
     * @type {Integer (Int32)}
     */
    static NET_E_GENERAL => -2147220736

    /**
     * @type {Integer (Int32)}
     */
    static NET_E_DISCONNECTED => -2147220733

    /**
     * @type {Integer (Int32)}
     */
    static NET_E_INVALIDPARAMS => -2147220728

    /**
     * @type {Integer (Int32)}
     */
    static NET_E_OPERATIONINPROGRESS => -2147220727

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_INVALIDCONTEXT => -2147216381

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_INITFAILED => -2147216383

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_NOTINITIALIZED => -2147216382

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_ACCESSDENIED => -2147216129

    /**
     * @type {Integer (Int32)}
     */
    static DS_E_NOMOREDATA => -2147220480

    /**
     * @type {Integer (Int32)}
     */
    static DS_E_INVALIDDATASOURCE => -2147220479

    /**
     * @type {Integer (Int32)}
     */
    static DS_E_DATASOURCENOTAVAILABLE => -2147220478

    /**
     * @type {Integer (Int32)}
     */
    static DS_E_QUERYCANCELED => -2147220477

    /**
     * @type {Integer (Int32)}
     */
    static DS_E_UNKNOWNREQUEST => -2147220476

    /**
     * @type {Integer (Int32)}
     */
    static DS_E_BADREQUEST => -2147220475

    /**
     * @type {Integer (Int32)}
     */
    static DS_E_SERVERCAPACITY => -2147220474

    /**
     * @type {Integer (Int32)}
     */
    static DS_E_BADSEQUENCE => -2147220473

    /**
     * @type {Integer (Int32)}
     */
    static DS_E_MESSAGETOOLONG => -2147220472

    /**
     * @type {Integer (Int32)}
     */
    static DS_E_SERVERERROR => -2147220471

    /**
     * @type {Integer (Int32)}
     */
    static DS_E_CONFIGBAD => -2147220470

    /**
     * @type {Integer (Int32)}
     */
    static DS_E_DATANOTPRESENT => -2147220464

    /**
     * @type {Integer (Int32)}
     */
    static DS_E_SETSTATUSINPROGRESS => -2147220463

    /**
     * @type {Integer (Int32)}
     */
    static DS_E_DUPLICATEID => -2147220462

    /**
     * @type {Integer (Int32)}
     */
    static DS_E_TOOMANYDATASOURCES => -2147220461

    /**
     * @type {Integer (Int32)}
     */
    static DS_E_REGISTRY => -2147220460

    /**
     * @type {Integer (Int32)}
     */
    static DS_E_DATASOURCENOTDISABLED => -2147220459

    /**
     * @type {Integer (Int32)}
     */
    static DS_E_INVALIDTAGDB => -2147220458

    /**
     * @type {Integer (Int32)}
     */
    static DS_E_INVALIDCATALOGNAME => -2147220457

    /**
     * @type {Integer (Int32)}
     */
    static DS_E_CONFIGNOTRIGHTTYPE => -2147220456

    /**
     * @type {Integer (Int32)}
     */
    static DS_E_PROTOCOLVERSION => -2147220455

    /**
     * @type {Integer (Int32)}
     */
    static DS_E_ALREADYENABLED => -2147220454

    /**
     * @type {Integer (Int32)}
     */
    static DS_E_INDEXDIRECTORY => -2147220452

    /**
     * @type {Integer (Int32)}
     */
    static DS_E_VALUETOOLARGE => -2147220451

    /**
     * @type {Integer (Int32)}
     */
    static DS_E_UNKNOWNPARAM => -2147220450

    /**
     * @type {Integer (Int32)}
     */
    static DS_E_BUFFERTOOSMALL => -2147220449

    /**
     * @type {Integer (Int32)}
     */
    static DS_E_PARAMOUTOFRANGE => -2147220448

    /**
     * @type {Integer (Int32)}
     */
    static DS_E_ALREADYDISABLED => -2147220447

    /**
     * @type {Integer (Int32)}
     */
    static DS_E_QUERYHUNG => -2147220446

    /**
     * @type {Integer (Int32)}
     */
    static DS_E_BADRESULT => -2147220445

    /**
     * @type {Integer (Int32)}
     */
    static DS_E_CANNOTWRITEREGISTRY => -2147220444

    /**
     * @type {Integer (Int32)}
     */
    static DS_E_CANNOTREMOVECONCURRENT => -2147220443

    /**
     * @type {Integer (Int32)}
     */
    static DS_E_SEARCHCATNAMECOLLISION => -2147220442

    /**
     * @type {Integer (Int32)}
     */
    static DS_E_PROPVERSIONMISMATCH => -2147220441

    /**
     * @type {Integer (Int32)}
     */
    static DS_E_MISSINGCATALOG => -2147220440

    /**
     * @type {Integer (Int32)}
     */
    static COLL_E_BADSEQUENCE => -2147220223

    /**
     * @type {Integer (Int32)}
     */
    static COLL_E_NOMOREDATA => -2147220222

    /**
     * @type {Integer (Int32)}
     */
    static COLL_E_INCOMPATIBLECOLUMNS => -2147220221

    /**
     * @type {Integer (Int32)}
     */
    static COLL_E_BUFFERTOOSMALL => -2147220220

    /**
     * @type {Integer (Int32)}
     */
    static COLL_E_BADRESULT => -2147220218

    /**
     * @type {Integer (Int32)}
     */
    static COLL_E_NOSORTCOLUMN => -2147220217

    /**
     * @type {Integer (Int32)}
     */
    static COLL_E_DUPLICATEDBID => -2147220216

    /**
     * @type {Integer (Int32)}
     */
    static COLL_E_TOOMANYMERGECOLUMNS => -2147220215

    /**
     * @type {Integer (Int32)}
     */
    static COLL_E_NODEFAULTCATALOG => -2147220214

    /**
     * @type {Integer (Int32)}
     */
    static COLL_E_MAXCONNEXCEEDED => -2147220213

    /**
     * @type {Integer (Int32)}
     */
    static CM_E_TOOMANYDATASERVERS => -2147219967

    /**
     * @type {Integer (Int32)}
     */
    static CM_E_TOOMANYDATASOURCES => -2147219966

    /**
     * @type {Integer (Int32)}
     */
    static CM_E_NOQUERYCONNECTIONS => -2147219965

    /**
     * @type {Integer (Int32)}
     */
    static CM_E_DATASOURCENOTAVAILABLE => -2147219964

    /**
     * @type {Integer (Int32)}
     */
    static CM_E_CONNECTIONTIMEOUT => -2147219963

    /**
     * @type {Integer (Int32)}
     */
    static CM_E_SERVERNOTFOUND => -2147219962

    /**
     * @type {Integer (Int32)}
     */
    static CM_S_NODATASERVERS => 263687

    /**
     * @type {Integer (Int32)}
     */
    static CM_E_REGISTRY => -2147219960

    /**
     * @type {Integer (Int32)}
     */
    static CM_E_INVALIDDATASOURCE => -2147219959

    /**
     * @type {Integer (Int32)}
     */
    static CM_E_TIMEOUT => -2147219958

    /**
     * @type {Integer (Int32)}
     */
    static CM_E_INSUFFICIENTBUFFER => -2147219957

    /**
     * @type {Integer (Int32)}
     */
    static QRY_E_QUERYSYNTAX => -2147219711

    /**
     * @type {Integer (Int32)}
     */
    static QRY_E_TYPEMISMATCH => -2147219710

    /**
     * @type {Integer (Int32)}
     */
    static QRY_E_UNHANDLEDTYPE => -2147219709

    /**
     * @type {Integer (Int32)}
     */
    static QRY_S_NOROWSFOUND => 263940

    /**
     * @type {Integer (Int32)}
     */
    static QRY_E_TOOMANYCOLUMNS => -2147219707

    /**
     * @type {Integer (Int32)}
     */
    static QRY_E_TOOMANYDATABASES => -2147219706

    /**
     * @type {Integer (Int32)}
     */
    static QRY_E_STARTHITTOBIG => -2147219705

    /**
     * @type {Integer (Int32)}
     */
    static QRY_E_TOOMANYQUERYTERMS => -2147219704

    /**
     * @type {Integer (Int32)}
     */
    static QRY_E_NODATASOURCES => -2147219703

    /**
     * @type {Integer (Int32)}
     */
    static QRY_E_TIMEOUT => -2147219702

    /**
     * @type {Integer (Int32)}
     */
    static QRY_E_COLUMNNOTSORTABLE => -2147219701

    /**
     * @type {Integer (Int32)}
     */
    static QRY_E_COLUMNNOTSEARCHABLE => -2147219700

    /**
     * @type {Integer (Int32)}
     */
    static QRY_E_INVALIDCOLUMN => -2147219699

    /**
     * @type {Integer (Int32)}
     */
    static QRY_E_QUERYCORRUPT => -2147219698

    /**
     * @type {Integer (Int32)}
     */
    static QRY_E_PREFIXWILDCARD => -2147219697

    /**
     * @type {Integer (Int32)}
     */
    static QRY_E_INFIXWILDCARD => -2147219696

    /**
     * @type {Integer (Int32)}
     */
    static QRY_E_WILDCARDPREFIXLENGTH => -2147219695

    /**
     * @type {Integer (Int32)}
     */
    static QRY_S_TERMIGNORED => 263954

    /**
     * @type {Integer (Int32)}
     */
    static QRY_E_ENGINEFAILED => -2147219693

    /**
     * @type {Integer (Int32)}
     */
    static QRY_E_SEARCHTOOBIG => -2147219692

    /**
     * @type {Integer (Int32)}
     */
    static QRY_E_NULLQUERY => -2147219691

    /**
     * @type {Integer (Int32)}
     */
    static QRY_S_INEXACTRESULTS => 263958

    /**
     * @type {Integer (Int32)}
     */
    static QRY_E_NOCOLUMNS => -2147219689

    /**
     * @type {Integer (Int32)}
     */
    static QRY_E_INVALIDSCOPES => -2147219688

    /**
     * @type {Integer (Int32)}
     */
    static QRY_E_INVALIDCATALOG => -2147219687

    /**
     * @type {Integer (Int32)}
     */
    static QRY_E_SCOPECARDINALIDY => -2147219686

    /**
     * @type {Integer (Int32)}
     */
    static QRY_E_UNEXPECTED => -2147219685

    /**
     * @type {Integer (Int32)}
     */
    static QRY_E_INVALIDPATH => -2147219684

    /**
     * @type {Integer (Int32)}
     */
    static QRY_E_LMNOTINITIALIZED => -2147219683

    /**
     * @type {Integer (Int32)}
     */
    static QRY_E_INVALIDINTERVAL => -2147219682

    /**
     * @type {Integer (Int32)}
     */
    static QRY_E_NOLOGMANAGER => -2147219681

    /**
     * @type {Integer (Int32)}
     */
    static SCHEMA_E_LOAD_SPECIAL => -2147218431

    /**
     * @type {Integer (Int32)}
     */
    static SCHEMA_E_FILENOTFOUND => -2147218430

    /**
     * @type {Integer (Int32)}
     */
    static SCHEMA_E_NESTEDTAG => -2147218429

    /**
     * @type {Integer (Int32)}
     */
    static SCHEMA_E_UNEXPECTEDTAG => -2147218428

    /**
     * @type {Integer (Int32)}
     */
    static SCHEMA_E_VERSIONMISMATCH => -2147218427

    /**
     * @type {Integer (Int32)}
     */
    static SCHEMA_E_CANNOTCREATEFILE => -2147218426

    /**
     * @type {Integer (Int32)}
     */
    static SCHEMA_E_CANNOTWRITEFILE => -2147218425

    /**
     * @type {Integer (Int32)}
     */
    static SCHEMA_E_EMPTYFILE => -2147218424

    /**
     * @type {Integer (Int32)}
     */
    static SCHEMA_E_INVALIDFILETYPE => -2147218423

    /**
     * @type {Integer (Int32)}
     */
    static SCHEMA_E_INVALIDDATATYPE => -2147218422

    /**
     * @type {Integer (Int32)}
     */
    static SCHEMA_E_CANNOTCREATENOISEWORDFILE => -2147218421

    /**
     * @type {Integer (Int32)}
     */
    static SCHEMA_E_ADDSTOPWORDS => -2147218420

    /**
     * @type {Integer (Int32)}
     */
    static SCHEMA_E_NAMEEXISTS => -2147218419

    /**
     * @type {Integer (Int32)}
     */
    static SCHEMA_E_INVALIDVALUE => -2147218418

    /**
     * @type {Integer (Int32)}
     */
    static SCHEMA_E_BADPROPSPEC => -2147218417

    /**
     * @type {Integer (Int32)}
     */
    static SCHEMA_E_NOMORECOLUMNS => -2147218416

    /**
     * @type {Integer (Int32)}
     */
    static SCHEMA_E_FILECHANGED => -2147218415

    /**
     * @type {Integer (Int32)}
     */
    static SCHEMA_E_BADCOLUMNNAME => -2147218414

    /**
     * @type {Integer (Int32)}
     */
    static SCHEMA_E_BADPROPPID => -2147218413

    /**
     * @type {Integer (Int32)}
     */
    static SCHEMA_E_BADATTRIBUTE => -2147218412

    /**
     * @type {Integer (Int32)}
     */
    static SCHEMA_E_BADFILENAME => -2147218411

    /**
     * @type {Integer (Int32)}
     */
    static SCHEMA_E_PROPEXISTS => -2147218410

    /**
     * @type {Integer (Int32)}
     */
    static SCHEMA_E_DUPLICATENOISE => -2147218409

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_DUPLICATE_OBJECT => -2147218174

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_UNABLE_TO_READ_REGISTRY => -2147218173

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_ERROR_WRITING_REGISTRY => -2147218172

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_ERROR_INITIALIZING_PERFMON => -2147218171

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_ERROR_OBJECT_NOT_FOUND => -2147218170

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_URL_EXCLUDED => -2147218169

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_CONFIG_DUP_PROJECT => -2147218166

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_CONFIG_DUP_EXTENSION => -2147218165

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_DUPLICATE_URL => -2147218163

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_TOO_MANY_PLUGINS => -2147218162

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_INVALIDFUNCTION => -2147218161

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_NOFILTERSINK => -2147218160

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_FILTER_PROCESS_TERMINATED => -2147218159

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_FILTER_INVALID_MESSAGE => -2147218158

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_UNSUPPORTED_PROPERTY_TYPE => -2147218157

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_NAME_TOO_LONG => -2147218156

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_NO_IDENTITY => -2147218155

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_FILTER_NOT_FOUND => -2147218154

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_FILTER_NO_MORE_THREADS => -2147218153

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_PRT_HNDLR_PROGID_MISSING => -2147218152

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_FILTER_PROCESS_TERMINATED_QUOTA => -2147218151

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_UNKNOWN_PROTOCOL => -2147218150

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_PROJECT_NOT_INITIALIZED => -2147218149

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_S_STATUS_CHANGE_IGNORED => 265500

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_S_STATUS_END_CRAWL => 265501

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_S_STATUS_RESET => 265502

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_S_STATUS_THROTTLE => 265503

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_S_STATUS_RESUME => 265504

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_S_STATUS_PAUSE => 265505

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_INVALID_PROJECT_NAME => -2147218142

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_SHUTTING_DOWN => -2147218141

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_S_END_STD_CHUNKS => 265508

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_VALUE_NOT_AVAILABLE => -2147218139

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_OUT_OF_DOC_ID => -2147218138

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_NOTIFICATION_START_PAGE => -2147218137

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_DUP_PROPERTY_MAPPING => -2147218134

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_S_NO_CRAWL_SEEDS => 265515

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_INVALID_ACCOUNT => -2147218132

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_FILTER_INIT => -2147218130

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_INVALID_ACCOUNT_SYNTAX => -2147218129

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_S_CANNOT_FILTER => 265520

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_PROXY_NAME => -2147218127

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_SERVER_UNAVAILABLE => -2147218126

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_S_STATUS_STOP => 265523

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_INVALID_PATH => -2147218124

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_FILTER_NO_CODEPAGE => -2147218123

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_S_STATUS_START => 265526

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_NO_PRTCLHNLR => -2147218121

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_IE_OFFLINE => -2147218120

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_BAD_FILTER_DAEMON => -2147218119

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_INVALID_MAPPING => -2147218112

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_USER_AGENT_NOT_SPECIFIED => -2147218111

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_FROM_NOT_SPECIFIED => -2147218109

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_INVALID_STREAM_LOGS_COUNT => -2147218108

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_INVALID_EXTENSION => -2147218107

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_INVALID_GROW_FACTOR => -2147218106

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_INVALID_TIME_OUT => -2147218105

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_INVALID_RETRIES => -2147218104

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_INVALID_LOG_FILE_NAME => -2147218103

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_INVALID_HOST_NAME => -2147218096

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_INVALID_START_PAGE => -2147218095

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_DUPLICATE_PROJECT => -2147218094

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_INVALID_DIRECTORY => -2147218093

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_FILTER_INTERRUPTED => -2147218092

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_INVALID_PROXY_PORT => -2147218091

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_S_CONFIG_HAS_ACCOUNTS => 265558

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_SECRET_NOT_FOUND => -2147218089

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_INVALID_PATH_EXPRESSION => -2147218088

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_INVALID_START_PAGE_HOST => -2147218087

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_INVALID_START_PAGE_PATH => -2147218080

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_APPLICATION_NOT_FOUND => -2147218079

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_CANNOT_REMOVE_PLUGINMGR => -2147218078

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_INVALID_APPLICATION_NAME => -2147218077

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_FILTER_FAULT => -2147218075

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_NON_FIXED_DRIVE => -2147218074

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_S_PROB_NOT_MODIFIED => 265575

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_S_CRAWL_SCHEDULED => 265576

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_S_TRANSACTION_IGNORED => 265577

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_S_START_FILTER_FROM_PROTOCOL => 265578

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_FILTER_SINGLE_THREADED => -2147218069

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_S_BAD_FILE_LINK => 265580

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_URL_UNIDENTIFIED => -2147218067

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_S_NOT_ALL_PARTS => 265582

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_FORCE_NOTIFICATION_RESET => -2147218065

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_S_END_PROCESS_LOOP_NOTIFY_QUEUE => 265584

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_S_START_FILTER_FROM_BODY => 265585

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_CONTENT_ID_CONFLICT => -2147218062

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_UNABLE_TO_READ_EXCHANGE_STORE => -2147218061

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_RECOVERABLE_EXOLEDB_ERROR => -2147218060

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_INVALID_CALL_FROM_WBREAKER => -2147218058

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_PROPERTY_LIST_NOT_INITIALIZED => -2147218057

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_S_MODIFIED_PARTS => 265592

    /**
     * @type {Integer (Int32)}
     */
    static GHTR_E_LOCAL_SERVER_UNAVAILABLE => -2147218055

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_SCHEMA_ERRORS_OCCURRED => -2147218054

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_TIMEOUT => -2147218053

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_S_CRAWL_FULL => 265603

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_S_CRAWL_INCREMENTAL => 265604

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_S_CRAWL_ADAPTIVE => 265605

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_NOTIFICATION_START_ADDRESS_INVALID => -2147218042

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_NOTIFICATION_TYPE_NOT_SUPPORTED => -2147218041

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_NOTIFICATION_FILE_SHARE_INFO_NOT_AVAILABLE => -2147218040

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_NOTIFICATION_LOCAL_PATH_MUST_USE_FIXED_DRIVE => -2147218039

    /**
     * @type {Integer (Int32)}
     */
    static GHTR_E_INSUFFICIENT_DISK_SPACE => -2147218037

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_INVALID_RESOURCE_ID => -2147218035

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_NESTED_HIERARCHICAL_START_ADDRESSES => -2147218034

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_S_NO_INDEX => 265616

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_S_PAUSE_REASON_EXTERNAL => 265618

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_S_PAUSE_REASON_UPGRADING => 265619

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_S_PAUSE_REASON_BACKOFF => 265620

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_RETRY => -2147218027

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_JET_BACKUP_ERROR => -2147218026

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_JET_RESTORE_ERROR => -2147218025

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_S_OFFICE_CHILD => 265626

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_PLUGIN_NOT_REGISTERED => -2147218021

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_NOTIF_ACCESS_TOKEN_UPDATED => -2147218020

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_DIRMON_NOT_INITIALZED => -2147218019

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_NOTIF_BEING_REMOVED => -2147218018

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_NOTIF_EXCESSIVE_THROUGHPUT => -2147218017

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_INVALID_PATH_SPEC => -2147218016

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_INSUFFICIENT_FEATURE_TERMS => -2147218015

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_INSUFFICIENT_EXAMPLE_CATEGORIES => -2147218014

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_INSUFFICIENT_EXAMPLE_DOCUMENTS => -2147218013

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_AUTOCAT_UNEXPECTED => -2147218012

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_SINGLE_THREADED_EMBEDDING => -2147218011

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_S_CANNOT_WORDBREAK => 265638

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_S_USE_MIME_FILTER => 265639

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_FOLDER_CRAWLED_BY_ANOTHER_WORKSPACE => -2147218007

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_EMPTY_DACL => -2147218006

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_OBJECT_NOT_VALID => -2147218005

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_CANNOT_ENABLE_CHECKPOINT => -2147218002

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_SCOPES_EXCEEDED => -2147218001

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_PROPERTIES_EXCEEDED => -2147218000

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_INVALID_START_ADDRESS => -2147217998

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_S_PAUSE_REASON_PROFILE_IMPORT => 265651

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_PIPE_NOT_CONNECTTED => -2147217996

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_BACKUP_VALIDATION_FAIL => -2147217994

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_BAD_FILTER_HOST => -2147217993

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_NTF_CLIENT_NOT_SUBSCRIBED => -1073476167

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_FILTERPOOL_NOTFOUND => -2147217990

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_ADDLINKS_FAILED_WILL_RETRY_PARENT => -2147217989

    /**
     * @type {Integer (Int32)}
     */
    static IDX_E_INVALIDTAG => -2147217151

    /**
     * @type {Integer (Int32)}
     */
    static IDX_E_METAFILE_CORRUPT => -2147217150

    /**
     * @type {Integer (Int32)}
     */
    static IDX_E_TOO_MANY_SEARCH_SERVERS => -2147217149

    /**
     * @type {Integer (Int32)}
     */
    static IDX_E_SEARCH_SERVER_ALREADY_EXISTS => -2147217148

    /**
     * @type {Integer (Int32)}
     */
    static IDX_E_BUILD_IN_PROGRESS => -2147217147

    /**
     * @type {Integer (Int32)}
     */
    static IDX_E_IDXLSTFILE_CORRUPT => -2147217146

    /**
     * @type {Integer (Int32)}
     */
    static IDX_E_REGISTRY_ENTRY => -2147217145

    /**
     * @type {Integer (Int32)}
     */
    static IDX_E_OBJECT_NOT_FOUND => -2147217144

    /**
     * @type {Integer (Int32)}
     */
    static IDX_E_SEARCH_SERVER_NOT_FOUND => -2147217143

    /**
     * @type {Integer (Int32)}
     */
    static IDX_E_WB_NOTFOUND => -2147217142

    /**
     * @type {Integer (Int32)}
     */
    static IDX_E_NOISELIST_NOTFOUND => -2147217141

    /**
     * @type {Integer (Int32)}
     */
    static IDX_E_STEMMER_NOTFOUND => -2147217140

    /**
     * @type {Integer (Int32)}
     */
    static IDX_E_PROP_STOPPED => -2147217139

    /**
     * @type {Integer (Int32)}
     */
    static IDX_E_DISKFULL => -2147217138

    /**
     * @type {Integer (Int32)}
     */
    static IDX_E_INVALID_INDEX => -2147217137

    /**
     * @type {Integer (Int32)}
     */
    static IDX_E_CORRUPT_INDEX => -2147217136

    /**
     * @type {Integer (Int32)}
     */
    static IDX_E_PROPSTORE_INIT_FAILED => -2147217134

    /**
     * @type {Integer (Int32)}
     */
    static IDX_E_PROP_STATE_CORRUPT => -2147217133

    /**
     * @type {Integer (Int32)}
     */
    static IDX_S_NO_BUILD_IN_PROGRESS => 266516

    /**
     * @type {Integer (Int32)}
     */
    static IDX_S_SEARCH_SERVER_ALREADY_EXISTS => 266517

    /**
     * @type {Integer (Int32)}
     */
    static IDX_S_SEARCH_SERVER_DOES_NOT_EXIST => 266518

    /**
     * @type {Integer (Int32)}
     */
    static IDX_E_NOT_LOADED => -2147217129

    /**
     * @type {Integer (Int32)}
     */
    static IDX_E_PROP_MAJOR_VERSION_MISMATCH => -2147217128

    /**
     * @type {Integer (Int32)}
     */
    static IDX_E_PROP_MINOR_VERSION_MISMATCH => -2147217127

    /**
     * @type {Integer (Int32)}
     */
    static IDX_E_DSS_NOT_CONNECTED => -2147217126

    /**
     * @type {Integer (Int32)}
     */
    static IDX_E_DOCUMENT_ABORTED => -2147217125

    /**
     * @type {Integer (Int32)}
     */
    static IDX_E_CATALOG_DISMOUNTED => -2147217124

    /**
     * @type {Integer (Int32)}
     */
    static IDX_S_DSS_NOT_AVAILABLE => 266525

    /**
     * @type {Integer (Int32)}
     */
    static IDX_E_USE_DEFAULT_CONTENTCLASS => -2147217121

    /**
     * @type {Integer (Int32)}
     */
    static IDX_E_USE_APPGLOBAL_PROPTABLE => -2147217120

    /**
     * @type {Integer (Int32)}
     */
    static JPS_E_JET_ERR => -2147217025

    /**
     * @type {Integer (Int32)}
     */
    static JPS_S_DUPLICATE_DOC_DETECTED => 266624

    /**
     * @type {Integer (Int32)}
     */
    static JPS_E_CATALOG_DECSRIPTION_MISSING => -2147217023

    /**
     * @type {Integer (Int32)}
     */
    static JPS_E_MISSING_INFORMATION => -2147217022

    /**
     * @type {Integer (Int32)}
     */
    static JPS_E_INSUFFICIENT_VERSION_STORAGE => -2147217021

    /**
     * @type {Integer (Int32)}
     */
    static JPS_E_INSUFFICIENT_DATABASE_SESSIONS => -2147217020

    /**
     * @type {Integer (Int32)}
     */
    static JPS_E_INSUFFICIENT_DATABASE_RESOURCES => -2147217019

    /**
     * @type {Integer (Int32)}
     */
    static JPS_E_SCHEMA_ERROR => -2147217018

    /**
     * @type {Integer (Int32)}
     */
    static JPS_E_PROPAGATION_FILE => -2147217017

    /**
     * @type {Integer (Int32)}
     */
    static JPS_E_PROPAGATION_CORRUPTION => -2147217016

    /**
     * @type {Integer (Int32)}
     */
    static JPS_E_PROPAGATION_VERSION_MISMATCH => -2147217015

    /**
     * @type {Integer (Int32)}
     */
    static JPS_E_SHARING_VIOLATION => -2147217014

    /**
     * @type {Integer (Int32)}
     */
    static EXCI_E_NO_CONFIG => -2147216992

    /**
     * @type {Integer (Int32)}
     */
    static EXCI_E_INVALID_SERVER_CONFIG => -2147216991

    /**
     * @type {Integer (Int32)}
     */
    static EXCI_E_ACCESS_DENIED => -2147216990

    /**
     * @type {Integer (Int32)}
     */
    static EXCI_E_INVALID_EXCHANGE_SERVER => -2147216989

    /**
     * @type {Integer (Int32)}
     */
    static EXCI_E_BADCONFIG_OR_ACCESSDENIED => -2147216988

    /**
     * @type {Integer (Int32)}
     */
    static EXCI_E_WRONG_SERVER_OR_ACCT => -2147216987

    /**
     * @type {Integer (Int32)}
     */
    static EXCI_E_NOT_ADMIN_OR_WRONG_SITE => -2147216986

    /**
     * @type {Integer (Int32)}
     */
    static EXCI_E_NO_MAPI => -2147216985

    /**
     * @type {Integer (Int32)}
     */
    static EXCI_E_INVALID_ACCOUNT_INFO => -2147216984

    /**
     * @type {Integer (Int32)}
     */
    static PRTH_E_INTERNAL_ERROR => -2147216892

    /**
     * @type {Integer (Int32)}
     */
    static PRTH_S_MAX_GROWTH => 266761

    /**
     * @type {Integer (Int32)}
     */
    static PRTH_E_WININET => -2147216886

    /**
     * @type {Integer (Int32)}
     */
    static PRTH_E_RETRY => -2147216885

    /**
     * @type {Integer (Int32)}
     */
    static PRTH_S_MAX_DOWNLOAD => 266764

    /**
     * @type {Integer (Int32)}
     */
    static PRTH_E_MIME_EXCLUDED => -2147216883

    /**
     * @type {Integer (Int32)}
     */
    static PRTH_E_CANT_TRANSFORM_EXTERNAL_ACL => -2147216882

    /**
     * @type {Integer (Int32)}
     */
    static PRTH_E_CANT_TRANSFORM_DENIED_ACE => -2147216881

    /**
     * @type {Integer (Int32)}
     */
    static PRTH_E_NO_PROPERTY => -2147216877

    /**
     * @type {Integer (Int32)}
     */
    static PRTH_S_USE_ROSEBUD => 266772

    /**
     * @type {Integer (Int32)}
     */
    static PRTH_E_DATABASE_OPEN_ERROR => -2147216875

    /**
     * @type {Integer (Int32)}
     */
    static PRTH_E_OPLOCK_BROKEN => -2147216874

    /**
     * @type {Integer (Int32)}
     */
    static PRTH_E_LOAD_FAILED => -2147216873

    /**
     * @type {Integer (Int32)}
     */
    static PRTH_E_INIT_FAILED => -2147216872

    /**
     * @type {Integer (Int32)}
     */
    static PRTH_E_VOLUME_MOUNT_POINT => -2147216871

    /**
     * @type {Integer (Int32)}
     */
    static PRTH_E_TRUNCATED => -2147216870

    /**
     * @type {Integer (Int32)}
     */
    static GTHR_E_LOCAL_GROUPS_EXPANSION_INTERNAL_ERROR => -2147216867

    /**
     * @type {Integer (Int32)}
     */
    static PRTH_E_HTTPS_CERTIFICATE_ERROR => -2147216861

    /**
     * @type {Integer (Int32)}
     */
    static PRTH_E_HTTPS_REQUIRE_CERTIFICATE => -2147216860

    /**
     * @type {Integer (Int32)}
     */
    static PRTH_S_TRY_IMPERSONATING => 266789

    /**
     * @type {Integer (Int32)}
     */
    static PRTH_E_TRANSACTION_FAILED => -2147216858

    /**
     * @type {Integer (Int32)}
     */
    static CMDLINE_E_UNEXPECTED => -2147216127

    /**
     * @type {Integer (Int32)}
     */
    static CMDLINE_E_PAREN => -2147216126

    /**
     * @type {Integer (Int32)}
     */
    static CMDLINE_E_PARAM_SIZE => -2147216125

    /**
     * @type {Integer (Int32)}
     */
    static CMDLINE_E_NOT_INIT => -2147216124

    /**
     * @type {Integer (Int32)}
     */
    static CMDLINE_E_ALREADY_INIT => -2147216123

    /**
     * @type {Integer (Int32)}
     */
    static CMDLINE_E_NUM_PARAMS => -2147216122

    /**
     * @type {Integer (Int32)}
     */
    static NLADMIN_E_DUPLICATE_CATALOG => -2147215103

    /**
     * @type {Integer (Int32)}
     */
    static NLADMIN_S_NOT_ALL_BUILD_CATALOGS_INITIALIZED => 268546

    /**
     * @type {Integer (Int32)}
     */
    static NLADMIN_E_FAILED_TO_GIVE_ACCOUNT_PRIVILEGE => -2147215101

    /**
     * @type {Integer (Int32)}
     */
    static NLADMIN_E_BUILD_CATALOG_NOT_INITIALIZED => -2147215100

    /**
     * @type {Integer (Int32)}
     */
    static SCRIPTPI_E_CHUNK_NOT_TEXT => -2147213312

    /**
     * @type {Integer (Int32)}
     */
    static SCRIPTPI_E_PID_NOT_NAME => -2147213311

    /**
     * @type {Integer (Int32)}
     */
    static SCRIPTPI_E_PID_NOT_NUMERIC => -2147213310

    /**
     * @type {Integer (Int32)}
     */
    static SCRIPTPI_E_CHUNK_NOT_VALUE => -2147213309

    /**
     * @type {Integer (Int32)}
     */
    static SCRIPTPI_E_CANNOT_ALTER_CHUNK => -2147213308

    /**
     * @type {Integer (Int32)}
     */
    static SCRIPTPI_E_ALREADY_COMPLETED => -2147213307

    /**
     * @type {Integer (Int32)}
     */
    static _MAPI_E_NO_SUPPORT => -2147221246

    /**
     * @type {Integer (Int32)}
     */
    static _MAPI_E_BAD_CHARWIDTH => -2147221245

    /**
     * @type {Integer (Int32)}
     */
    static _MAPI_E_STRING_TOO_LONG => -2147221243

    /**
     * @type {Integer (Int32)}
     */
    static _MAPI_E_UNKNOWN_FLAGS => -2147221242

    /**
     * @type {Integer (Int32)}
     */
    static _MAPI_E_INVALID_ENTRYID => -2147221241

    /**
     * @type {Integer (Int32)}
     */
    static _MAPI_E_INVALID_OBJECT => -2147221240

    /**
     * @type {Integer (Int32)}
     */
    static _MAPI_E_OBJECT_CHANGED => -2147221239

    /**
     * @type {Integer (Int32)}
     */
    static _MAPI_E_OBJECT_DELETED => -2147221238

    /**
     * @type {Integer (Int32)}
     */
    static _MAPI_E_BUSY => -2147221237

    /**
     * @type {Integer (Int32)}
     */
    static _MAPI_E_NOT_ENOUGH_DISK => -2147221235

    /**
     * @type {Integer (Int32)}
     */
    static _MAPI_E_NOT_ENOUGH_RESOURCES => -2147221234

    /**
     * @type {Integer (Int32)}
     */
    static _MAPI_E_NOT_FOUND => -2147221233

    /**
     * @type {Integer (Int32)}
     */
    static _MAPI_E_VERSION => -2147221232

    /**
     * @type {Integer (Int32)}
     */
    static _MAPI_E_LOGON_FAILED => -2147221231

    /**
     * @type {Integer (Int32)}
     */
    static _MAPI_E_SESSION_LIMIT => -2147221230

    /**
     * @type {Integer (Int32)}
     */
    static _MAPI_E_USER_CANCEL => -2147221229

    /**
     * @type {Integer (Int32)}
     */
    static _MAPI_E_UNABLE_TO_ABORT => -2147221228

    /**
     * @type {Integer (Int32)}
     */
    static _MAPI_E_NETWORK_ERROR => -2147221227

    /**
     * @type {Integer (Int32)}
     */
    static _MAPI_E_DISK_ERROR => -2147221226

    /**
     * @type {Integer (Int32)}
     */
    static _MAPI_E_TOO_COMPLEX => -2147221225

    /**
     * @type {Integer (Int32)}
     */
    static _MAPI_E_BAD_COLUMN => -2147221224

    /**
     * @type {Integer (Int32)}
     */
    static _MAPI_E_EXTENDED_ERROR => -2147221223

    /**
     * @type {Integer (Int32)}
     */
    static _MAPI_E_COMPUTED => -2147221222

    /**
     * @type {Integer (Int32)}
     */
    static _MAPI_E_CORRUPT_DATA => -2147221221

    /**
     * @type {Integer (Int32)}
     */
    static _MAPI_E_UNCONFIGURED => -2147221220

    /**
     * @type {Integer (Int32)}
     */
    static _MAPI_E_FAILONEPROVIDER => -2147221219

    /**
     * @type {Integer (Int32)}
     */
    static _MAPI_E_UNKNOWN_CPID => -2147221218

    /**
     * @type {Integer (Int32)}
     */
    static _MAPI_E_UNKNOWN_LCID => -2147221217

    /**
     * @type {Integer (Int32)}
     */
    static _MAPI_E_PASSWORD_CHANGE_REQUIRED => -2147221216

    /**
     * @type {Integer (Int32)}
     */
    static _MAPI_E_PASSWORD_EXPIRED => -2147221215

    /**
     * @type {Integer (Int32)}
     */
    static _MAPI_E_INVALID_WORKSTATION_ACCOUNT => -2147221214

    /**
     * @type {Integer (Int32)}
     */
    static _MAPI_E_INVALID_ACCESS_TIME => -2147221213

    /**
     * @type {Integer (Int32)}
     */
    static _MAPI_E_ACCOUNT_DISABLED => -2147221212

    /**
     * @type {Integer (Int32)}
     */
    static _MAPI_E_END_OF_SESSION => -2147220992

    /**
     * @type {Integer (Int32)}
     */
    static _MAPI_E_UNKNOWN_ENTRYID => -2147220991

    /**
     * @type {Integer (Int32)}
     */
    static _MAPI_E_MISSING_REQUIRED_COLUMN => -2147220990

    /**
     * @type {Integer (Int32)}
     */
    static _MAPI_W_NO_SERVICE => 262659

    /**
     * @type {Integer (Int32)}
     */
    static MSG_TEST_MESSAGE => 1074008064

    /**
     * @type {Integer (Int32)}
     */
    static FLTRDMN_E_UNEXPECTED => -2147212287

    /**
     * @type {Integer (Int32)}
     */
    static FLTRDMN_E_QI_FILTER_FAILED => -2147212286

    /**
     * @type {Integer (Int32)}
     */
    static FLTRDMN_E_FILTER_INIT_FAILED => -2147212284

    /**
     * @type {Integer (Int32)}
     */
    static FLTRDMN_E_ENCRYPTED_DOCUMENT => -2147212283

    /**
     * @type {Integer (Int32)}
     */
    static FLTRDMN_E_CANNOT_DECRYPT_PASSWORD => -2147212282

    /**
     * @type {Integer (Int32)}
     */
    static OLEDB_BINDER_CUSTOM_ERROR => -2147212032

    /**
     * @type {Integer (Int32)}
     */
    static NOTESPH_E_UNEXPECTED_STATE => -2147211775

    /**
     * @type {Integer (Int32)}
     */
    static NOTESPH_S_IGNORE_ID => 271874

    /**
     * @type {Integer (Int32)}
     */
    static NOTESPH_E_UNSUPPORTED_CONTENT_FIELD_TYPE => -2147211773

    /**
     * @type {Integer (Int32)}
     */
    static NOTESPH_E_ITEM_NOT_FOUND => -2147211772

    /**
     * @type {Integer (Int32)}
     */
    static NOTESPH_E_SERVER_CONFIG => -2147211771

    /**
     * @type {Integer (Int32)}
     */
    static NOTESPH_E_ATTACHMENTS => -2147211770

    /**
     * @type {Integer (Int32)}
     */
    static NOTESPH_E_NO_NTID => -2147211769

    /**
     * @type {Integer (Int32)}
     */
    static NOTESPH_E_DB_ACCESS_DENIED => -2147211768

    /**
     * @type {Integer (Int32)}
     */
    static NOTESPH_E_NOTESSETUP_ID_MAPPING_ERROR => -2147211767

    /**
     * @type {Integer (Int32)}
     */
    static NOTESPH_S_LISTKNOWNFIELDS => 271888

    /**
     * @type {Integer (Int32)}
     */
    static NOTESPH_E_FAIL => -2147211759

    /**
     * @type {Integer (Int32)}
     */
    static STS_ABORTXMLPARSE => -2147211756

    /**
     * @type {Integer (Int32)}
     */
    static STS_WS_ERROR => -2147211754

    /**
     * @type {Integer (Int32)}
     */
    static SPS_WS_ERROR => -2147211753

    /**
     * @type {Integer (Int32)}
     */
    static EXSTOREPH_E_UNEXPECTED => -2147211519

    /**
     * @type {Integer (Int32)}
     */
    static CERT_E_NOT_FOUND_OR_NO_PERMISSSION => -2147211263

    /**
     * @type {Integer (Int32)}
     */
    static SRCH_SCHEMA_CACHE_E_UNEXPECTED => -2147208447

    /**
     * @type {Integer (Int32)}
     */
    static CONTENT_SOURCE_E_PROPERTY_MAPPING_READ => -2147208191

    /**
     * @type {Integer (Int32)}
     */
    static CONTENT_SOURCE_E_UNEXPECTED_NULL_POINTER => -2147208190

    /**
     * @type {Integer (Int32)}
     */
    static CONTENT_SOURCE_E_PROPERTY_MAPPING_BAD_VECTOR_SIZE => -2147208189

    /**
     * @type {Integer (Int32)}
     */
    static CONTENT_SOURCE_E_CONTENT_CLASS_READ => -2147208188

    /**
     * @type {Integer (Int32)}
     */
    static CONTENT_SOURCE_E_UNEXPECTED_EXCEPTION => -2147208187

    /**
     * @type {Integer (Int32)}
     */
    static CONTENT_SOURCE_E_NULL_CONTENT_CLASS_BSTR => -2147208186

    /**
     * @type {Integer (Int32)}
     */
    static CONTENT_SOURCE_E_CONTENT_SOURCE_COLUMN_TYPE => -2147208185

    /**
     * @type {Integer (Int32)}
     */
    static CONTENT_SOURCE_E_OUT_OF_RANGE => -2147208184

    /**
     * @type {Integer (Int32)}
     */
    static CONTENT_SOURCE_E_NULL_URI => -2147208183

    /**
     * @type {Integer (Int32)}
     */
    static REXSPH_E_INVALID_CALL => -2147207936

    /**
     * @type {Integer (Int32)}
     */
    static REXSPH_S_REDIRECTED => 275713

    /**
     * @type {Integer (Int32)}
     */
    static REXSPH_E_REDIRECT_ON_SECURITY_UPDATE => -2147207934

    /**
     * @type {Integer (Int32)}
     */
    static REXSPH_E_MULTIPLE_REDIRECT => -2147207933

    /**
     * @type {Integer (Int32)}
     */
    static REXSPH_E_NO_PROPERTY_ON_ROW => -2147207932

    /**
     * @type {Integer (Int32)}
     */
    static REXSPH_E_TYPE_MISMATCH_ON_READ => -2147207931

    /**
     * @type {Integer (Int32)}
     */
    static REXSPH_E_UNEXPECTED_DATA_STATUS => -2147207930

    /**
     * @type {Integer (Int32)}
     */
    static REXSPH_E_UNKNOWN_DATA_TYPE => -2147207929

    /**
     * @type {Integer (Int32)}
     */
    static REXSPH_E_UNEXPECTED_FILTER_STATE => -2147207928

    /**
     * @type {Integer (Int32)}
     */
    static REXSPH_E_DUPLICATE_PROPERTY => -2147207927

    /**
     * @type {Integer (Int32)}
     */
    static PEOPLE_IMPORT_E_DBCONNFAIL => -2147205120

    /**
     * @type {Integer (Int32)}
     */
    static PEOPLE_IMPORT_NODSDEFINED => -2147205119

    /**
     * @type {Integer (Int32)}
     */
    static PEOPLE_IMPORT_E_FAILTOGETDSDEF => -2147205118

    /**
     * @type {Integer (Int32)}
     */
    static PEOPLE_IMPORT_NOMAPPINGDEFINED => -2147205117

    /**
     * @type {Integer (Int32)}
     */
    static PEOPLE_IMPORT_E_FAILTOGETDSMAPPING => -2147205116

    /**
     * @type {Integer (Int32)}
     */
    static PEOPLE_IMPORT_E_DATATYPENOTSUPPORTED => -2147205115

    /**
     * @type {Integer (Int32)}
     */
    static PEOPLE_IMPORT_E_NOCASTINGSUPPORTED => -2147205114

    /**
     * @type {Integer (Int32)}
     */
    static PEOPLE_IMPORT_E_UPDATE_DIRSYNC_COOKIE => -2147205113

    /**
     * @type {Integer (Int32)}
     */
    static PEOPLE_IMPORT_E_DIRSYNC_ZERO_COOKIE => -2147205112

    /**
     * @type {Integer (Int32)}
     */
    static PEOPLE_IMPORT_E_LDAPPATH_TOOLONG => -2147205111

    /**
     * @type {Integer (Int32)}
     */
    static PEOPLE_IMPORT_E_CANONICALURL_TOOLONG => -2147205110

    /**
     * @type {Integer (Int32)}
     */
    static PEOPLE_IMPORT_E_USERNAME_NOTRESOLVED => -2147205109

    /**
     * @type {Integer (Int32)}
     */
    static PEOPLE_IMPORT_E_DC_NOT_AVAILABLE => -2147205108

    /**
     * @type {Integer (Int32)}
     */
    static PEOPLE_IMPORT_E_DOMAIN_DISCOVER_FAILED => -2147205107

    /**
     * @type {Integer (Int32)}
     */
    static PEOPLE_IMPORT_E_FAILTOGETLCID => -2147205106

    /**
     * @type {Integer (Int32)}
     */
    static PEOPLE_IMPORT_E_DOMAIN_REMOVED => -2147205105

    /**
     * @type {Integer (Int32)}
     */
    static PEOPLE_IMPORT_E_ENUM_ACCESSDENIED => -2147205104

    /**
     * @type {Integer (Int32)}
     */
    static PEOPLE_IMPORT_E_DIRSYNC_NOTREFRESHED => -2147205103

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_SECRET_NOT_FOUND => -2147207678

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_PIPE_NOT_CONNECTED => -2147207677

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_ADMIN_BLOB_CORRUPT => -2147207676

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_FILTER_SINGLE_THREADED => -2147207675

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_ERROR_WRITING_REGISTRY => -2147207674

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_PROJECT_SHUTDOWN => -2147207673

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_PROJECT_NOT_INITALIZED => -2147207672

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_PIPE_DATA_CORRUPTED => -2147207671

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_URB_TOO_BIG => -2147207664

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_INVALID_DOCID => -2147207663

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_PAUSE_EXTERNAL => -2147207662

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_REJECTED_DUE_TO_PROJECT_STATUS => -2147207661

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_FD_DID_NOT_CONNECT => -2147207660

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_PROGID_REQUIRED => -2147207658

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_STATIC_THREAD_INVALID_ARGUMENTS => -2147207657

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_CATALOG_ALREADY_EXISTS => -2147207656

    /**
     * @type {Integer (Int32)}
     */
    static FTE_S_RESOURCES_STARTING_TO_GET_LOW => 275993

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_PATH_TOO_LONG => -2147207654

    /**
     * @type {Integer (Int32)}
     */
    static FTE_INVALID_ADMIN_CLIENT => -2147207653

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_COM_SIGNATURE_VALIDATION => -2147207652

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_AFFINITY_MASK => -2147207651

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_FD_OWNERSHIP_OBSOLETE => -2147207650

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_EXCEEDED_MAX_PLUGINS => -2147207647

    /**
     * @type {Integer (Int32)}
     */
    static FTE_S_BEYOND_QUOTA => 276002

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_DUPLICATE_OBJECT => -2147207644

    /**
     * @type {Integer (Int32)}
     */
    static FTE_S_REDUNDANT => 276005

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_REDUNDANT_TRAN_FAILURE => -2147207642

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_DEPENDENT_TRAN_FAILED_TO_PERSIST => -2147207641

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_FD_SHUTDOWN => -2147207640

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_CATALOG_DOES_NOT_EXIST => -2147207639

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_NO_PLUGINS => -2147207638

    /**
     * @type {Integer (Int32)}
     */
    static FTE_S_STATUS_CHANGE_REQUEST => 276011

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_BATCH_ABORTED => -2147207636

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_ANOTHER_STATUS_CHANGE_IS_ALREADY_ACTIVE => -2147207635

    /**
     * @type {Integer (Int32)}
     */
    static FTE_S_RESUME => 276014

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_NOT_PROCESSED_DUE_TO_PREVIOUS_ERRORS => -2147207633

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_FD_TIMEOUT => -2147207632

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_RESOURCE_SHUTDOWN => -2147207631

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_INVALID_PROPERTY => -2147207630

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_NO_MORE_PROPERTIES => -2147207629

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_UNKNOWN_PLUGIN => -2147207628

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_LIBRARY_NOT_LOADED => -2147207627

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_PERFMON_FULL => -2147207626

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_FAILED_TO_CREATE_ACCESSOR => -2147207625

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_INVALID_TYPE => -2147207624

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_OUT_OF_RANGE => -2147207623

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_CORRUPT_PROPERTY_STORE => -2147207622

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_PROPERTY_STORE_WORKID_NOTVALID => -2147207621

    /**
     * @type {Integer (Int32)}
     */
    static FTE_S_PROPERTY_STORE_END_OF_ENUMERATION => 276028

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_CORRUPT_GATHERER_HASH_MAP => -2147207619

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_KEY_NOT_CACHED => -2147207618

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_UPGRADE_INTERFACE_ALREADY_SHUTDOWN => -2147207617

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_UPGRADE_INTERFACE_ALREADY_INSTANTIATED => -2147207616

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_STACK_CORRUPTED => -2147207615

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_INVALID_PROG_ID => -2147207614

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_SERIAL_STREAM_CORRUPT => -2147207613

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_READONLY_CATALOG => -2147207612

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_PERF_NOT_LOADED => -2147207611

    /**
     * @type {Integer (Int32)}
     */
    static FTE_S_READONLY_CATALOG => 276038

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_RETRY_HUGE_DOC => -2147207608

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_UNKNOWN_FD_TYPE => -2147207607

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_DOC_TOO_HUGE => -2147207606

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_DATATYPE_MISALIGNMENT => -2147207605

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_ALREADY_INITIALIZED => -2147207604

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_FD_USED_TOO_MUCH_MEMORY => -2147207603

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_UNEXPECTED_EXIT => -2147207602

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_HIGH_MEMORY_PRESSURE => -2147207601

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_INVALID_ISOLATE_ERROR_BATCH => -2147207600

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_RETRY_SINGLE_DOC_PER_BATCH => -2147207599

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_INVALID_PROJECT_ID => -2147207598

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_FAILURE_TO_POST_SETCOMPLETION_STATUS => -2147207597

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_INVALID_CODEPAGE => -2147207596

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_FD_IDLE => -2147207595

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_FD_UNRESPONSIVE => -2147207594

    /**
     * @type {Integer (Int32)}
     */
    static FTE_S_TRY_TO_FLUSH => 276055

    /**
     * @type {Integer (Int32)}
     */
    static FTE_S_CATALOG_BLOB_MISMATCHED => 276056

    /**
     * @type {Integer (Int32)}
     */
    static FTE_S_PROPERTY_RESET => 276057

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_NO_PROPERTY_STORE => -1073465766

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_CB_OUT_OF_MEMORY => -2147169536

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_CB_CBID_OUT_OF_BOUND => -2147169535

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_CB_NOT_ENOUGH_AVAIL_PHY_MEM => -2147169534

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_CB_NOT_ENOUGH_OCC_BUFFER => -2147169533

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_CORRUPT_WORDLIST => -2147169532

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_FD_NO_IPERSIST_INTERFACE => -2147156736

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_FD_IFILTER_INIT_FAILED => -2147156735

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_FD_FAILED_TO_LOAD_IFILTER => -2147156734

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_FD_DOC_TIMEOUT => -2147156733

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_FD_UNEXPECTED_EXIT => -2147156732

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_FD_DOC_UNEXPECTED_EXIT => -2147156731

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_FD_NOISE_NO_TEXT_FILTER => -2147156730

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_FD_NOISE_NO_IPERSISTSTREAM_ON_TEXT_FILTER => -2147156729

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_FD_NOISE_TEXT_FILTER_LOAD_FAILED => -2147156728

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_FD_NOISE_TEXT_FILTER_INIT_FAILED => -2147156727

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_FD_OCCURRENCE_OVERFLOW => -2147156726

    /**
     * @type {Integer (Int32)}
     */
    static FTE_E_FD_FILTER_CAUSED_SHARING_VIOLATION => -2147156725

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SOURCE_PROTHNDLR => 4608

    /**
     * @type {Integer (UInt32)}
     */
    static PRTH_E_COMM_ERROR => 2147750400

    /**
     * @type {Integer (UInt32)}
     */
    static PRTH_E_OBJ_NOT_FOUND => 2147750401

    /**
     * @type {Integer (UInt32)}
     */
    static PRTH_E_REQUEST_ERROR => 2147750402

    /**
     * @type {Integer (UInt32)}
     */
    static PRTH_S_NOT_MODIFIED => 266755

    /**
     * @type {Integer (UInt32)}
     */
    static PRTH_E_ACCESS_DENIED => 2147750405

    /**
     * @type {Integer (UInt32)}
     */
    static PRTH_E_SERVER_ERROR => 2147750406

    /**
     * @type {Integer (UInt32)}
     */
    static PRTH_E_NOT_REDIRECTED => 2147750407

    /**
     * @type {Integer (UInt32)}
     */
    static PRTH_E_BAD_REQUEST => 2147750408

    /**
     * @type {Integer (UInt32)}
     */
    static PRTH_E_HTTP_CANNOT_CONNECT => 2147750409

    /**
     * @type {Integer (UInt32)}
     */
    static PRTH_S_ACL_IS_READ_EVERYONE => 266768

    /**
     * @type {Integer (UInt32)}
     */
    static PRTH_E_ACL_IS_READ_NONE => 2147750417

    /**
     * @type {Integer (UInt32)}
     */
    static PRTH_E_ACL_TOO_BIG => 2147750418

    /**
     * @type {Integer (UInt32)}
     */
    static PRTH_S_NOT_ALL_PARTS => 266779

    /**
     * @type {Integer (Int32)}
     */
    static QUERY_E_ALLNOISE_AND_NO_RELDOC => -2147215859

    /**
     * @type {Integer (Int32)}
     */
    static QUERY_E_NO_RELDOC => -2147215858

    /**
     * @type {Integer (Int32)}
     */
    static QUERY_E_ALLNOISE_AND_NO_RELPROP => -2147215857

    /**
     * @type {Integer (Int32)}
     */
    static QUERY_E_NO_RELPROP => -2147215856

    /**
     * @type {Integer (Int32)}
     */
    static QUERY_E_REPEATED_RELDOC => -2147215855

    /**
     * @type {Integer (Int32)}
     */
    static QUERY_E_RELDOC_SYNTAX_NOT_SUPPORTED => -2147215854

    /**
     * @type {Integer (Int32)}
     */
    static QUERY_E_INVALID_DOCUMENT_IDENTIFIER => -2147215853

    /**
     * @type {Integer (Int32)}
     */
    static QUERY_E_INCORRECT_VERSION => -2147215852

    /**
     * @type {Integer (Int32)}
     */
    static QUERY_E_INVALIDSCOPE_COALESCE => -2147215851

    /**
     * @type {Integer (Int32)}
     */
    static QUERY_E_INVALIDSORT_COALESCE => -2147215850

    /**
     * @type {Integer (Int32)}
     */
    static QUERY_E_INVALIDCOALESCE => -2147215849

    /**
     * @type {Integer (Int32)}
     */
    static QUERY_E_UPGRADEINPROGRESS => -2147215848

    /**
     * @type {Integer (Int32)}
     */
    static QUERY_E_AGGREGATE_NOT_SUPPORTED => -2147215847

    /**
     * @type {Integer (Int32)}
     */
    static QUERY_E_TOP_LEVEL_IN_GROUP => -2147215846

    /**
     * @type {Integer (Int32)}
     */
    static QUERY_E_DUPLICATE_RANGE_NAME => -2147215845

    /**
     * @type {Integer (Int32)}
     */
    static CI_S_NEW_AUXMETADATA => 268329

    /**
     * @type {Integer (Int32)}
     */
    static CI_E_NO_AUXMETADATA => -2147215318

    /**
     * @type {Integer (Int32)}
     */
    static CI_S_CLIENT_REQUESTED_ABORT => 268331

    /**
     * @type {Integer (Int32)}
     */
    static CI_S_RETRY_DOCUMENT => 268332

    /**
     * @type {Integer (Int32)}
     */
    static CI_E_CORRUPT_FWIDX => -1073473491

    /**
     * @type {Integer (Int32)}
     */
    static CI_E_DIACRITIC_SETTINGS_DIFFER => -1073473490

    /**
     * @type {Integer (Int32)}
     */
    static CI_E_INVALID_CATALOG_LIST_VERSION => -2147215313

    /**
     * @type {Integer (Int32)}
     */
    static CI_S_CATALOG_RESET => 268336

    /**
     * @type {Integer (Int32)}
     */
    static CI_E_NO_CATALOG_MANAGER => -1073473487

    /**
     * @type {Integer (Int32)}
     */
    static CI_E_INCONSISTENT_TRANSACTION => -1073473486

    /**
     * @type {Integer (Int32)}
     */
    static CI_E_PROTECTED_CATALOG_NOT_AVAILABLE => -1073473485

    /**
     * @type {Integer (Int32)}
     */
    static CI_E_NO_PROTECTED_USER => -1073473484

    /**
     * @type {Integer (Int32)}
     */
    static CI_E_MULTIPLE_PROTECTED_USERS_UNSUPPORTED => -1073473483

    /**
     * @type {Integer (Int32)}
     */
    static CI_E_PROTECTED_CATALOG_SID_MISMATCH => -1073473482

    /**
     * @type {Integer (Int32)}
     */
    static CI_E_PROTECTED_CATALOG_NON_INTERACTIVE_USER => -1073473481

    /**
     * @type {Integer (Int32)}
     */
    static CI_DATABASE_DECRYPTION_FAILED => -1073473480

    /**
     * @type {Integer (Int32)}
     */
    static CI_DATABASE_ENCRYPTION_FAILED => -1073473479

    /**
     * @type {Integer (Int32)}
     */
    static FILTER_E_NO_IMAGE_FRAMES => -2147215602

    /**
     * @type {Integer (Int32)}
     */
    static MSG_CI_MASTER_MERGE_STARTED => 1073745926

    /**
     * @type {Integer (Int32)}
     */
    static MSG_CI_MASTER_MERGE_COMPLETED => 1073745927

    /**
     * @type {Integer (Int32)}
     */
    static MSG_CI_MASTER_MERGE_ABORTED => 1073745928

    /**
     * @type {Integer (Int32)}
     */
    static MSG_CI_MASTER_MERGE_CANT_START => -1073737719

    /**
     * @type {Integer (Int32)}
     */
    static MSG_CI_MASTER_MERGE_CANT_RESTART => -1073737718

    /**
     * @type {Integer (Int32)}
     */
    static MSG_CI_MASTER_MERGE_RESTARTED => 1073745945

    /**
     * @type {Integer (Int32)}
     */
    static MSG_CI_CORRUPT_INDEX_COMPONENT => 1073745962

    /**
     * @type {Integer (Int32)}
     */
    static MSG_CI_MASTER_MERGE_ABORTED_LOW_DISK => 1073745987

    /**
     * @type {Integer (Int32)}
     */
    static MSG_CI_MASTER_MERGE_REASON_EXTERNAL => 1073745988

    /**
     * @type {Integer (Int32)}
     */
    static MSG_CI_MASTER_MERGE_REASON_INDEX_LIMIT => 1073745989

    /**
     * @type {Integer (Int32)}
     */
    static MSG_CI_MASTER_MERGE_REASON_EXPECTED_DOCS => 1073745990

    /**
     * @type {Integer (Int32)}
     */
    static MSG_CI_MASTER_MERGE_REASON_NUMBER => 1073745991

    /**
     * @type {Integer (Int32)}
     */
    static MSG_CI_CREATE_SEVER_ITEM_FAILED => -2147479480

    /**
     * @type {Integer (Int32)}
     */
    static NOT_N_PARSE_ERROR => 526638

    /**
     * @type {Integer (Int32)}
     */
    static IDS_MON_DEFAULT_ERROR => 264495

    /**
     * @type {Integer (Int32)}
     */
    static IDS_MON_ILLEGAL_PASSTHROUGH => 264496

    /**
     * @type {Integer (Int32)}
     */
    static IDS_MON_PARSE_ERR_1_PARAM => 264497

    /**
     * @type {Integer (Int32)}
     */
    static IDS_MON_PARSE_ERR_2_PARAM => 264498

    /**
     * @type {Integer (Int32)}
     */
    static IDS_MON_SEMI_COLON => 264499

    /**
     * @type {Integer (Int32)}
     */
    static IDS_MON_ORDINAL_OUT_OF_RANGE => 264500

    /**
     * @type {Integer (Int32)}
     */
    static IDS_MON_VIEW_NOT_DEFINED => 264501

    /**
     * @type {Integer (Int32)}
     */
    static IDS_MON_COLUMN_NOT_DEFINED => 264502

    /**
     * @type {Integer (Int32)}
     */
    static IDS_MON_BUILTIN_VIEW => 264503

    /**
     * @type {Integer (Int32)}
     */
    static IDS_MON_OUT_OF_MEMORY => 264504

    /**
     * @type {Integer (Int32)}
     */
    static IDS_MON_SELECT_STAR => 264505

    /**
     * @type {Integer (Int32)}
     */
    static IDS_MON_OR_NOT => 264506

    /**
     * @type {Integer (Int32)}
     */
    static IDS_MON_CANNOT_CONVERT => 264507

    /**
     * @type {Integer (Int32)}
     */
    static IDS_MON_OUT_OF_RANGE => 264508

    /**
     * @type {Integer (Int32)}
     */
    static IDS_MON_RELATIVE_INTERVAL => 264509

    /**
     * @type {Integer (Int32)}
     */
    static IDS_MON_NOT_COLUMN_OF_VIEW => 264510

    /**
     * @type {Integer (Int32)}
     */
    static IDS_MON_BUILTIN_PROPERTY => 264511

    /**
     * @type {Integer (Int32)}
     */
    static IDS_MON_WEIGHT_OUT_OF_RANGE => 264512

    /**
     * @type {Integer (Int32)}
     */
    static IDS_MON_MATCH_STRING => 264513

    /**
     * @type {Integer (Int32)}
     */
    static IDS_MON_PROPERTY_NAME_IN_VIEW => 264514

    /**
     * @type {Integer (Int32)}
     */
    static IDS_MON_VIEW_ALREADY_DEFINED => 264515

    /**
     * @type {Integer (Int32)}
     */
    static IDS_MON_INVALID_CATALOG => 264516

    /**
     * @type {Integer (Int32)}
     */
    static IDS_MON_INVALIDSELECT_COALESCE => 264517

    /**
     * @type {Integer (Int32)}
     */
    static IDS_MON_CANNOT_CAST => 264518

    /**
     * @type {Integer (Int32)}
     */
    static IDS_MON_DATE_OUT_OF_RANGE => 264519

    /**
     * @type {Integer (Int32)}
     */
    static IDS_MON_INVALID_IN_GROUP_CLAUSE => 264520

    /**
     * @type {Guid}
     */
    static DBPROPSET_MSDAORA_ROWSET => Guid("{e8cc4cbd-fdff-11d0-b865-00a0c9081c1d}")

    /**
     * @type {Guid}
     */
    static DBPROPSET_MSDAORA8_ROWSET => Guid("{7f06a375-dd6a-43db-b4e0-1fc121e5e62b}")

    /**
     * @type {Guid}
     */
    static CLSID_MSDASQL => Guid("{c8b522cb-5cf3-11ce-ade5-00aa0044773d}")

    /**
     * @type {Guid}
     */
    static CLSID_MSDASQL_ENUMERATOR => Guid("{c8b522cd-5cf3-11ce-ade5-00aa0044773d}")

    /**
     * @type {Guid}
     */
    static DBPROPSET_PROVIDERDATASOURCEINFO => Guid("{497c60e0-7123-11cf-b171-00aa0057599e}")

    /**
     * @type {Guid}
     */
    static DBPROPSET_PROVIDERROWSET => Guid("{497c60e1-7123-11cf-b171-00aa0057599e}")

    /**
     * @type {Guid}
     */
    static DBPROPSET_PROVIDERDBINIT => Guid("{497c60e2-7123-11cf-b171-00aa0057599e}")

    /**
     * @type {Guid}
     */
    static DBPROPSET_PROVIDERSTMTATTR => Guid("{497c60e3-7123-11cf-b171-00aa0057599e}")

    /**
     * @type {Guid}
     */
    static DBPROPSET_PROVIDERCONNATTR => Guid("{497c60e4-7123-11cf-b171-00aa0057599e}")

    /**
     * @type {Guid}
     */
    static CLSID_DataShapeProvider => Guid("{3449a1c8-c56c-11d0-ad72-00c04fc29863}")

    /**
     * @type {Guid}
     */
    static DBPROPSET_MSDSDBINIT => Guid("{55cb91a8-5c7a-11d1-adad-00c04fc29863}")

    /**
     * @type {Guid}
     */
    static DBPROPSET_MSDSSESSION => Guid("{edf17536-afbf-11d1-8847-0000f879f98c}")

    /**
     * @type {Guid}
     */
    static CLSID_MSPersist => Guid("{7c07e0d0-4418-11d2-9212-00c04fbbbfb3}")

    /**
     * @type {Guid}
     */
    static DBPROPSET_PERSIST => Guid("{4d7839a0-5b8e-11d1-a6b3-00a0c9138c66}")

    /**
     * @type {String}
     */
    static PROGID_MSPersist_W => "MSPersist"

    /**
     * @type {String}
     */
    static PROGID_MSPersist_Version_W => "MSPersist.1"

    /**
     * @type {Guid}
     */
    static CLSID_SQLOLEDB => Guid("{0c7ff16c-38e3-11d0-97ab-00c04fc2ad98}")

    /**
     * @type {Guid}
     */
    static CLSID_SQLOLEDB_ERROR => Guid("{c0932c62-38e5-11d0-97ab-00c04fc2ad98}")

    /**
     * @type {Guid}
     */
    static CLSID_SQLOLEDB_ENUMERATOR => Guid("{dfa22b8e-e68d-11d0-97e4-00c04fc2ad98}")

    /**
     * @type {Guid}
     */
    static DBGUID_MSSQLXML => Guid("{5d531cb2-e6ed-11d2-b252-00c04f681b71}")

    /**
     * @type {Guid}
     */
    static DBGUID_XPATH => Guid("{ec2a4293-e898-11d2-b1b7-00c04f680c56}")

    /**
     * @type {Guid}
     */
    static DBSCHEMA_LINKEDSERVERS => Guid("{9093caf4-2eac-11d1-9809-00c04fc2ad98}")

    /**
     * @type {Guid}
     */
    static DBPROPSET_SQLSERVERDATASOURCE => Guid("{28efaee4-2d2c-11d1-9807-00c04fc2ad98}")

    /**
     * @type {Guid}
     */
    static DBPROPSET_SQLSERVERDATASOURCEINFO => Guid("{df10cb94-35f6-11d2-9c54-00c04f7971d3}")

    /**
     * @type {Guid}
     */
    static DBPROPSET_SQLSERVERDBINIT => Guid("{5cf4ca10-ef21-11d0-97e7-00c04fc2ad98}")

    /**
     * @type {Guid}
     */
    static DBPROPSET_SQLSERVERROWSET => Guid("{5cf4ca11-ef21-11d0-97e7-00c04fc2ad98}")

    /**
     * @type {Guid}
     */
    static DBPROPSET_SQLSERVERSESSION => Guid("{28efaee5-2d2c-11d1-9807-00c04fc2ad98}")

    /**
     * @type {Guid}
     */
    static DBPROPSET_SQLSERVERCOLUMN => Guid("{3b63fb5e-3fbb-11d3-9f29-00c04f8ee9dc}")

    /**
     * @type {Guid}
     */
    static DBPROPSET_SQLSERVERSTREAM => Guid("{9f79c073-8a6d-4bca-a8a8-c9b79a9b962d}")
;@endregion Constants

;@region Methods
    /**
     * 
     * @param {Pointer<Void>} StatementHandle 
     * @param {Integer} ColumnNumber 
     * @param {Integer} TargetType 
     * @param {Pointer<Void>} TargetValue 
     * @param {Integer} BufferLength 
     * @param {Pointer<Integer>} StrLen_or_Ind 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlbindcol-function
     */
    static SQLBindCol(StatementHandle, ColumnNumber, TargetType, TargetValue, BufferLength, StrLen_or_Ind) {
        StatementHandleMarshal := StatementHandle is VarRef ? "ptr" : "ptr"
        TargetValueMarshal := TargetValue is VarRef ? "ptr" : "ptr"
        StrLen_or_IndMarshal := StrLen_or_Ind is VarRef ? "int64*" : "ptr"

        result := DllCall("ODBC32.dll\SQLBindCol", StatementHandleMarshal, StatementHandle, "ushort", ColumnNumber, "short", TargetType, TargetValueMarshal, TargetValue, "int64", BufferLength, StrLen_or_IndMarshal, StrLen_or_Ind, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} StatementHandle 
     * @param {Integer} ParameterNumber 
     * @param {Integer} ValueType 
     * @param {Integer} ParameterType 
     * @param {Integer} LengthPrecision 
     * @param {Integer} ParameterScale 
     * @param {Pointer<Void>} ParameterValue 
     * @param {Pointer<Integer>} StrLen_or_Ind 
     * @returns {Integer} 
     * @deprecated ODBC API: SQLBindParam is deprecated. Please use SQLBindParameter instead.
     */
    static SQLBindParam(StatementHandle, ParameterNumber, ValueType, ParameterType, LengthPrecision, ParameterScale, ParameterValue, StrLen_or_Ind) {
        StatementHandleMarshal := StatementHandle is VarRef ? "ptr" : "ptr"
        ParameterValueMarshal := ParameterValue is VarRef ? "ptr" : "ptr"
        StrLen_or_IndMarshal := StrLen_or_Ind is VarRef ? "int64*" : "ptr"

        result := DllCall("ODBC32.dll\SQLBindParam", StatementHandleMarshal, StatementHandle, "ushort", ParameterNumber, "short", ValueType, "short", ParameterType, "uint", LengthPrecision, "short", ParameterScale, ParameterValueMarshal, ParameterValue, StrLen_or_IndMarshal, StrLen_or_Ind, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} StatementHandle 
     * @param {Integer} ColumnNumber 
     * @param {Integer} FieldIdentifier 
     * @param {Pointer} CharacterAttribute 
     * @param {Integer} BufferLength 
     * @param {Pointer<Integer>} StringLength 
     * @param {Pointer<Integer>} NumericAttribute 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlcolattribute-function
     */
    static SQLColAttribute(StatementHandle, ColumnNumber, FieldIdentifier, CharacterAttribute, BufferLength, StringLength, NumericAttribute) {
        StatementHandleMarshal := StatementHandle is VarRef ? "ptr" : "ptr"
        StringLengthMarshal := StringLength is VarRef ? "short*" : "ptr"
        NumericAttributeMarshal := NumericAttribute is VarRef ? "int64*" : "ptr"

        result := DllCall("ODBC32.dll\SQLColAttribute", StatementHandleMarshal, StatementHandle, "ushort", ColumnNumber, "ushort", FieldIdentifier, "ptr", CharacterAttribute, "short", BufferLength, StringLengthMarshal, StringLength, NumericAttributeMarshal, NumericAttribute, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} StatementHandle 
     * @param {Integer} ColumnNumber 
     * @param {Pointer<Integer>} ColumnName 
     * @param {Integer} BufferLength 
     * @param {Pointer<Integer>} NameLength 
     * @param {Pointer<Integer>} DataType 
     * @param {Pointer<Integer>} ColumnSize 
     * @param {Pointer<Integer>} DecimalDigits 
     * @param {Pointer<Integer>} Nullable 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqldescribecol-function
     */
    static SQLDescribeCol(StatementHandle, ColumnNumber, ColumnName, BufferLength, NameLength, DataType, ColumnSize, DecimalDigits, Nullable) {
        StatementHandleMarshal := StatementHandle is VarRef ? "ptr" : "ptr"
        ColumnNameMarshal := ColumnName is VarRef ? "char*" : "ptr"
        NameLengthMarshal := NameLength is VarRef ? "short*" : "ptr"
        DataTypeMarshal := DataType is VarRef ? "short*" : "ptr"
        ColumnSizeMarshal := ColumnSize is VarRef ? "uint*" : "ptr"
        DecimalDigitsMarshal := DecimalDigits is VarRef ? "short*" : "ptr"
        NullableMarshal := Nullable is VarRef ? "short*" : "ptr"

        result := DllCall("ODBC32.dll\SQLDescribeCol", StatementHandleMarshal, StatementHandle, "ushort", ColumnNumber, ColumnNameMarshal, ColumnName, "short", BufferLength, NameLengthMarshal, NameLength, DataTypeMarshal, DataType, ColumnSizeMarshal, ColumnSize, DecimalDigitsMarshal, DecimalDigits, NullableMarshal, Nullable, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} StatementHandle 
     * @param {Integer} FetchOrientation 
     * @param {Integer} FetchOffset 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlfetchscroll-function
     */
    static SQLFetchScroll(StatementHandle, FetchOrientation, FetchOffset) {
        StatementHandleMarshal := StatementHandle is VarRef ? "ptr" : "ptr"

        result := DllCall("ODBC32.dll\SQLFetchScroll", StatementHandleMarshal, StatementHandle, "short", FetchOrientation, "int64", FetchOffset, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} StatementHandle 
     * @param {Integer} ColumnNumber 
     * @param {Integer} TargetType 
     * @param {Pointer<Void>} TargetValue 
     * @param {Integer} BufferLength 
     * @param {Pointer<Integer>} StrLen_or_IndPtr 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlgetdata-function
     */
    static SQLGetData(StatementHandle, ColumnNumber, TargetType, TargetValue, BufferLength, StrLen_or_IndPtr) {
        StatementHandleMarshal := StatementHandle is VarRef ? "ptr" : "ptr"
        TargetValueMarshal := TargetValue is VarRef ? "ptr" : "ptr"
        StrLen_or_IndPtrMarshal := StrLen_or_IndPtr is VarRef ? "int64*" : "ptr"

        result := DllCall("ODBC32.dll\SQLGetData", StatementHandleMarshal, StatementHandle, "ushort", ColumnNumber, "short", TargetType, TargetValueMarshal, TargetValue, "int64", BufferLength, StrLen_or_IndPtrMarshal, StrLen_or_IndPtr, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} DescriptorHandle 
     * @param {Integer} RecNumber 
     * @param {Pointer<Integer>} Name 
     * @param {Integer} BufferLength 
     * @param {Pointer<Integer>} StringLengthPtr 
     * @param {Pointer<Integer>} TypePtr 
     * @param {Pointer<Integer>} SubTypePtr 
     * @param {Pointer<Integer>} LengthPtr 
     * @param {Pointer<Integer>} PrecisionPtr 
     * @param {Pointer<Integer>} ScalePtr 
     * @param {Pointer<Integer>} NullablePtr 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlgetdescrec-function
     */
    static SQLGetDescRec(DescriptorHandle, RecNumber, Name, BufferLength, StringLengthPtr, TypePtr, SubTypePtr, LengthPtr, PrecisionPtr, ScalePtr, NullablePtr) {
        DescriptorHandleMarshal := DescriptorHandle is VarRef ? "ptr" : "ptr"
        NameMarshal := Name is VarRef ? "char*" : "ptr"
        StringLengthPtrMarshal := StringLengthPtr is VarRef ? "short*" : "ptr"
        TypePtrMarshal := TypePtr is VarRef ? "short*" : "ptr"
        SubTypePtrMarshal := SubTypePtr is VarRef ? "short*" : "ptr"
        LengthPtrMarshal := LengthPtr is VarRef ? "int64*" : "ptr"
        PrecisionPtrMarshal := PrecisionPtr is VarRef ? "short*" : "ptr"
        ScalePtrMarshal := ScalePtr is VarRef ? "short*" : "ptr"
        NullablePtrMarshal := NullablePtr is VarRef ? "short*" : "ptr"

        result := DllCall("ODBC32.dll\SQLGetDescRec", DescriptorHandleMarshal, DescriptorHandle, "short", RecNumber, NameMarshal, Name, "short", BufferLength, StringLengthPtrMarshal, StringLengthPtr, TypePtrMarshal, TypePtr, SubTypePtrMarshal, SubTypePtr, LengthPtrMarshal, LengthPtr, PrecisionPtrMarshal, PrecisionPtr, ScalePtrMarshal, ScalePtr, NullablePtrMarshal, NullablePtr, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} StatementHandle 
     * @param {Pointer<Void>} Data 
     * @param {Integer} StrLen_or_Ind 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlputdata-function
     */
    static SQLPutData(StatementHandle, Data, StrLen_or_Ind) {
        StatementHandleMarshal := StatementHandle is VarRef ? "ptr" : "ptr"
        DataMarshal := Data is VarRef ? "ptr" : "ptr"

        result := DllCall("ODBC32.dll\SQLPutData", StatementHandleMarshal, StatementHandle, DataMarshal, Data, "int64", StrLen_or_Ind, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} StatementHandle 
     * @param {Pointer<Integer>} RowCount 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlrowcount-function
     */
    static SQLRowCount(StatementHandle, RowCount) {
        StatementHandleMarshal := StatementHandle is VarRef ? "ptr" : "ptr"
        RowCountMarshal := RowCount is VarRef ? "int64*" : "ptr"

        result := DllCall("ODBC32.dll\SQLRowCount", StatementHandleMarshal, StatementHandle, RowCountMarshal, RowCount, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} ConnectionHandle 
     * @param {Integer} Option 
     * @param {Integer} Value 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlsetconnectoption-function
     * @deprecated ODBC API: SQLSetConnectOption is deprecated. Please use SQLSetConnectAttr instead.
     */
    static SQLSetConnectOption(ConnectionHandle, Option, Value) {
        ConnectionHandleMarshal := ConnectionHandle is VarRef ? "ptr" : "ptr"

        result := DllCall("ODBC32.dll\SQLSetConnectOption", ConnectionHandleMarshal, ConnectionHandle, "ushort", Option, "uint", Value, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} DescriptorHandle 
     * @param {Integer} RecNumber 
     * @param {Integer} Type 
     * @param {Integer} SubType 
     * @param {Integer} Length 
     * @param {Integer} Precision 
     * @param {Integer} Scale 
     * @param {Pointer} Data 
     * @param {Pointer<Integer>} StringLength 
     * @param {Pointer<Integer>} Indicator 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlsetdescrec-function
     */
    static SQLSetDescRec(DescriptorHandle, RecNumber, Type, SubType, Length, Precision, Scale, Data, StringLength, Indicator) {
        DescriptorHandleMarshal := DescriptorHandle is VarRef ? "ptr" : "ptr"
        StringLengthMarshal := StringLength is VarRef ? "int64*" : "ptr"
        IndicatorMarshal := Indicator is VarRef ? "int64*" : "ptr"

        result := DllCall("ODBC32.dll\SQLSetDescRec", DescriptorHandleMarshal, DescriptorHandle, "short", RecNumber, "short", Type, "short", SubType, "int64", Length, "short", Precision, "short", Scale, "ptr", Data, StringLengthMarshal, StringLength, IndicatorMarshal, Indicator, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} StatementHandle 
     * @param {Integer} ParameterNumber 
     * @param {Integer} ValueType 
     * @param {Integer} ParameterType 
     * @param {Integer} LengthPrecision 
     * @param {Integer} ParameterScale 
     * @param {Pointer<Void>} ParameterValue 
     * @param {Pointer<Integer>} StrLen_or_Ind 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlsetparam-function
     * @deprecated ODBC API: SQLSetParam is deprecated. Please use SQLBindParameter instead.
     */
    static SQLSetParam(StatementHandle, ParameterNumber, ValueType, ParameterType, LengthPrecision, ParameterScale, ParameterValue, StrLen_or_Ind) {
        StatementHandleMarshal := StatementHandle is VarRef ? "ptr" : "ptr"
        ParameterValueMarshal := ParameterValue is VarRef ? "ptr" : "ptr"
        StrLen_or_IndMarshal := StrLen_or_Ind is VarRef ? "int64*" : "ptr"

        result := DllCall("ODBC32.dll\SQLSetParam", StatementHandleMarshal, StatementHandle, "ushort", ParameterNumber, "short", ValueType, "short", ParameterType, "uint", LengthPrecision, "short", ParameterScale, ParameterValueMarshal, ParameterValue, StrLen_or_IndMarshal, StrLen_or_Ind, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} StatementHandle 
     * @param {Integer} Option 
     * @param {Integer} Value 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlsetstmtoption-function
     * @deprecated ODBC API: SQLSetStmtOption is deprecated. Please use SQLSetStmtAttr instead.
     */
    static SQLSetStmtOption(StatementHandle, Option, Value) {
        StatementHandleMarshal := StatementHandle is VarRef ? "ptr" : "ptr"

        result := DllCall("ODBC32.dll\SQLSetStmtOption", StatementHandleMarshal, StatementHandle, "ushort", Option, "uint", Value, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Integer} icol 
     * @param {Integer} fDescType 
     * @param {Pointer<Void>} rgbDesc 
     * @param {Integer} cbDescMax 
     * @param {Pointer<Integer>} pcbDesc 
     * @param {Pointer<Integer>} pfDesc 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlcolattributes-function
     */
    static SQLColAttributes(hstmt, icol, fDescType, rgbDesc, cbDescMax, pcbDesc, pfDesc) {
        hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
        rgbDescMarshal := rgbDesc is VarRef ? "ptr" : "ptr"
        pcbDescMarshal := pcbDesc is VarRef ? "short*" : "ptr"
        pfDescMarshal := pfDesc is VarRef ? "int64*" : "ptr"

        result := DllCall("ODBC32.dll\SQLColAttributes", hstmtMarshal, hstmt, "ushort", icol, "ushort", fDescType, rgbDescMarshal, rgbDesc, "short", cbDescMax, pcbDescMarshal, pcbDesc, pfDescMarshal, pfDesc, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Integer} ipar 
     * @param {Pointer<Integer>} pfSqlType 
     * @param {Pointer<Integer>} pcbParamDef 
     * @param {Pointer<Integer>} pibScale 
     * @param {Pointer<Integer>} pfNullable 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqldescribeparam-function
     */
    static SQLDescribeParam(hstmt, ipar, pfSqlType, pcbParamDef, pibScale, pfNullable) {
        hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
        pfSqlTypeMarshal := pfSqlType is VarRef ? "short*" : "ptr"
        pcbParamDefMarshal := pcbParamDef is VarRef ? "uint*" : "ptr"
        pibScaleMarshal := pibScale is VarRef ? "short*" : "ptr"
        pfNullableMarshal := pfNullable is VarRef ? "short*" : "ptr"

        result := DllCall("ODBC32.dll\SQLDescribeParam", hstmtMarshal, hstmt, "ushort", ipar, pfSqlTypeMarshal, pfSqlType, pcbParamDefMarshal, pcbParamDef, pibScaleMarshal, pibScale, pfNullableMarshal, pfNullable, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Integer} fFetchType 
     * @param {Integer} irow 
     * @param {Pointer<Integer>} pcrow 
     * @param {Pointer<Integer>} rgfRowStatus 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlextendedfetch-function
     */
    static SQLExtendedFetch(hstmt, fFetchType, irow, pcrow, rgfRowStatus) {
        hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
        pcrowMarshal := pcrow is VarRef ? "uint*" : "ptr"
        rgfRowStatusMarshal := rgfRowStatus is VarRef ? "ushort*" : "ptr"

        result := DllCall("ODBC32.dll\SQLExtendedFetch", hstmtMarshal, hstmt, "ushort", fFetchType, "int64", irow, pcrowMarshal, pcrow, rgfRowStatusMarshal, rgfRowStatus, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Integer} crow 
     * @param {Pointer<Integer>} pirow 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlparamoptions-function
     */
    static SQLParamOptions(hstmt, crow, pirow) {
        hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
        pirowMarshal := pirow is VarRef ? "uint*" : "ptr"

        result := DllCall("ODBC32.dll\SQLParamOptions", hstmtMarshal, hstmt, "uint", crow, pirowMarshal, pirow, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Integer} irow 
     * @param {Integer} fOption 
     * @param {Integer} fLock 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlsetpos-function
     */
    static SQLSetPos(hstmt, irow, fOption, fLock) {
        hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"

        result := DllCall("ODBC32.dll\SQLSetPos", hstmtMarshal, hstmt, "uint", irow, "ushort", fOption, "ushort", fLock, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Integer} ipar 
     * @param {Integer} fParamType 
     * @param {Integer} fCType 
     * @param {Integer} fSqlType 
     * @param {Integer} cbColDef 
     * @param {Integer} ibScale 
     * @param {Pointer<Void>} rgbValue 
     * @param {Integer} cbValueMax 
     * @param {Pointer<Integer>} pcbValue 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlbindparameter-function
     */
    static SQLBindParameter(hstmt, ipar, fParamType, fCType, fSqlType, cbColDef, ibScale, rgbValue, cbValueMax, pcbValue) {
        hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
        rgbValueMarshal := rgbValue is VarRef ? "ptr" : "ptr"
        pcbValueMarshal := pcbValue is VarRef ? "int64*" : "ptr"

        result := DllCall("ODBC32.dll\SQLBindParameter", hstmtMarshal, hstmt, "ushort", ipar, "short", fParamType, "short", fCType, "short", fSqlType, "uint", cbColDef, "short", ibScale, rgbValueMarshal, rgbValue, "int64", cbValueMax, pcbValueMarshal, pcbValue, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Integer} fConcurrency 
     * @param {Integer} crowKeyset 
     * @param {Integer} crowRowset 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlsetscrolloptions-function
     */
    static SQLSetScrollOptions(hstmt, fConcurrency, crowKeyset, crowRowset) {
        hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"

        result := DllCall("ODBC32.dll\SQLSetScrollOptions", hstmtMarshal, hstmt, "ushort", fConcurrency, "int64", crowKeyset, "ushort", crowRowset, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Integer} iCol 
     * @param {Integer} iField 
     * @param {Pointer} pCharAttr 
     * @param {Integer} cbDescMax 
     * @param {Pointer<Integer>} pcbCharAttr 
     * @param {Pointer<Integer>} pNumAttr 
     * @returns {Integer} 
     */
    static SQLColAttributeW(hstmt, iCol, iField, pCharAttr, cbDescMax, pcbCharAttr, pNumAttr) {
        hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
        pcbCharAttrMarshal := pcbCharAttr is VarRef ? "short*" : "ptr"
        pNumAttrMarshal := pNumAttr is VarRef ? "int64*" : "ptr"

        result := DllCall("ODBC32.dll\SQLColAttributeW", hstmtMarshal, hstmt, "ushort", iCol, "ushort", iField, "ptr", pCharAttr, "short", cbDescMax, pcbCharAttrMarshal, pcbCharAttr, pNumAttrMarshal, pNumAttr, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Integer} icol 
     * @param {Integer} fDescType 
     * @param {Pointer} rgbDesc 
     * @param {Integer} cbDescMax 
     * @param {Pointer<Integer>} pcbDesc 
     * @param {Pointer<Integer>} pfDesc 
     * @returns {Integer} 
     */
    static SQLColAttributesW(hstmt, icol, fDescType, rgbDesc, cbDescMax, pcbDesc, pfDesc) {
        hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
        pcbDescMarshal := pcbDesc is VarRef ? "short*" : "ptr"
        pfDescMarshal := pfDesc is VarRef ? "int64*" : "ptr"

        result := DllCall("ODBC32.dll\SQLColAttributesW", hstmtMarshal, hstmt, "ushort", icol, "ushort", fDescType, "ptr", rgbDesc, "short", cbDescMax, pcbDescMarshal, pcbDesc, pfDescMarshal, pfDesc, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Integer} icol 
     * @param {Pointer<Integer>} szColName 
     * @param {Integer} cchColNameMax 
     * @param {Pointer<Integer>} pcchColName 
     * @param {Pointer<Integer>} pfSqlType 
     * @param {Pointer<Integer>} pcbColDef 
     * @param {Pointer<Integer>} pibScale 
     * @param {Pointer<Integer>} pfNullable 
     * @returns {Integer} 
     */
    static SQLDescribeColW(hstmt, icol, szColName, cchColNameMax, pcchColName, pfSqlType, pcbColDef, pibScale, pfNullable) {
        hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
        szColNameMarshal := szColName is VarRef ? "ushort*" : "ptr"
        pcchColNameMarshal := pcchColName is VarRef ? "short*" : "ptr"
        pfSqlTypeMarshal := pfSqlType is VarRef ? "short*" : "ptr"
        pcbColDefMarshal := pcbColDef is VarRef ? "uint*" : "ptr"
        pibScaleMarshal := pibScale is VarRef ? "short*" : "ptr"
        pfNullableMarshal := pfNullable is VarRef ? "short*" : "ptr"

        result := DllCall("ODBC32.dll\SQLDescribeColW", hstmtMarshal, hstmt, "ushort", icol, szColNameMarshal, szColName, "short", cchColNameMax, pcchColNameMarshal, pcchColName, pfSqlTypeMarshal, pfSqlType, pcbColDefMarshal, pcbColDef, pibScaleMarshal, pibScale, pfNullableMarshal, pfNullable, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hdesc 
     * @param {Integer} iRecord 
     * @param {Pointer<Integer>} szName 
     * @param {Integer} cchNameMax 
     * @param {Pointer<Integer>} pcchName 
     * @param {Pointer<Integer>} pfType 
     * @param {Pointer<Integer>} pfSubType 
     * @param {Pointer<Integer>} pLength 
     * @param {Pointer<Integer>} pPrecision 
     * @param {Pointer<Integer>} pScale 
     * @param {Pointer<Integer>} pNullable 
     * @returns {Integer} 
     */
    static SQLGetDescRecW(hdesc, iRecord, szName, cchNameMax, pcchName, pfType, pfSubType, pLength, pPrecision, pScale, pNullable) {
        hdescMarshal := hdesc is VarRef ? "ptr" : "ptr"
        szNameMarshal := szName is VarRef ? "ushort*" : "ptr"
        pcchNameMarshal := pcchName is VarRef ? "short*" : "ptr"
        pfTypeMarshal := pfType is VarRef ? "short*" : "ptr"
        pfSubTypeMarshal := pfSubType is VarRef ? "short*" : "ptr"
        pLengthMarshal := pLength is VarRef ? "int64*" : "ptr"
        pPrecisionMarshal := pPrecision is VarRef ? "short*" : "ptr"
        pScaleMarshal := pScale is VarRef ? "short*" : "ptr"
        pNullableMarshal := pNullable is VarRef ? "short*" : "ptr"

        result := DllCall("ODBC32.dll\SQLGetDescRecW", hdescMarshal, hdesc, "short", iRecord, szNameMarshal, szName, "short", cchNameMax, pcchNameMarshal, pcchName, pfTypeMarshal, pfType, pfSubTypeMarshal, pfSubType, pLengthMarshal, pLength, pPrecisionMarshal, pPrecision, pScaleMarshal, pScale, pNullableMarshal, pNullable, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hdbc 
     * @param {Integer} fOption 
     * @param {Integer} vParam 
     * @returns {Integer} 
     */
    static SQLSetConnectOptionW(hdbc, fOption, vParam) {
        hdbcMarshal := hdbc is VarRef ? "ptr" : "ptr"

        result := DllCall("ODBC32.dll\SQLSetConnectOptionW", hdbcMarshal, hdbc, "ushort", fOption, "uint", vParam, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Integer} iCol 
     * @param {Integer} iField 
     * @param {Pointer} pCharAttr 
     * @param {Integer} cbCharAttrMax 
     * @param {Pointer<Integer>} pcbCharAttr 
     * @param {Pointer<Integer>} pNumAttr 
     * @returns {Integer} 
     */
    static SQLColAttributeA(hstmt, iCol, iField, pCharAttr, cbCharAttrMax, pcbCharAttr, pNumAttr) {
        hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
        pcbCharAttrMarshal := pcbCharAttr is VarRef ? "short*" : "ptr"
        pNumAttrMarshal := pNumAttr is VarRef ? "int64*" : "ptr"

        result := DllCall("ODBC32.dll\SQLColAttributeA", hstmtMarshal, hstmt, "short", iCol, "short", iField, "ptr", pCharAttr, "short", cbCharAttrMax, pcbCharAttrMarshal, pcbCharAttr, pNumAttrMarshal, pNumAttr, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Integer} icol 
     * @param {Integer} fDescType 
     * @param {Pointer} rgbDesc 
     * @param {Integer} cbDescMax 
     * @param {Pointer<Integer>} pcbDesc 
     * @param {Pointer<Integer>} pfDesc 
     * @returns {Integer} 
     */
    static SQLColAttributesA(hstmt, icol, fDescType, rgbDesc, cbDescMax, pcbDesc, pfDesc) {
        hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
        pcbDescMarshal := pcbDesc is VarRef ? "short*" : "ptr"
        pfDescMarshal := pfDesc is VarRef ? "int64*" : "ptr"

        result := DllCall("ODBC32.dll\SQLColAttributesA", hstmtMarshal, hstmt, "ushort", icol, "ushort", fDescType, "ptr", rgbDesc, "short", cbDescMax, pcbDescMarshal, pcbDesc, pfDescMarshal, pfDesc, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Integer} icol 
     * @param {Pointer<Integer>} szColName 
     * @param {Integer} cbColNameMax 
     * @param {Pointer<Integer>} pcbColName 
     * @param {Pointer<Integer>} pfSqlType 
     * @param {Pointer<Integer>} pcbColDef 
     * @param {Pointer<Integer>} pibScale 
     * @param {Pointer<Integer>} pfNullable 
     * @returns {Integer} 
     */
    static SQLDescribeColA(hstmt, icol, szColName, cbColNameMax, pcbColName, pfSqlType, pcbColDef, pibScale, pfNullable) {
        hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
        szColNameMarshal := szColName is VarRef ? "char*" : "ptr"
        pcbColNameMarshal := pcbColName is VarRef ? "short*" : "ptr"
        pfSqlTypeMarshal := pfSqlType is VarRef ? "short*" : "ptr"
        pcbColDefMarshal := pcbColDef is VarRef ? "uint*" : "ptr"
        pibScaleMarshal := pibScale is VarRef ? "short*" : "ptr"
        pfNullableMarshal := pfNullable is VarRef ? "short*" : "ptr"

        result := DllCall("ODBC32.dll\SQLDescribeColA", hstmtMarshal, hstmt, "ushort", icol, szColNameMarshal, szColName, "short", cbColNameMax, pcbColNameMarshal, pcbColName, pfSqlTypeMarshal, pfSqlType, pcbColDefMarshal, pcbColDef, pibScaleMarshal, pibScale, pfNullableMarshal, pfNullable, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hdesc 
     * @param {Integer} iRecord 
     * @param {Pointer<Integer>} szName 
     * @param {Integer} cbNameMax 
     * @param {Pointer<Integer>} pcbName 
     * @param {Pointer<Integer>} pfType 
     * @param {Pointer<Integer>} pfSubType 
     * @param {Pointer<Integer>} pLength 
     * @param {Pointer<Integer>} pPrecision 
     * @param {Pointer<Integer>} pScale 
     * @param {Pointer<Integer>} pNullable 
     * @returns {Integer} 
     */
    static SQLGetDescRecA(hdesc, iRecord, szName, cbNameMax, pcbName, pfType, pfSubType, pLength, pPrecision, pScale, pNullable) {
        hdescMarshal := hdesc is VarRef ? "ptr" : "ptr"
        szNameMarshal := szName is VarRef ? "char*" : "ptr"
        pcbNameMarshal := pcbName is VarRef ? "short*" : "ptr"
        pfTypeMarshal := pfType is VarRef ? "short*" : "ptr"
        pfSubTypeMarshal := pfSubType is VarRef ? "short*" : "ptr"
        pLengthMarshal := pLength is VarRef ? "int64*" : "ptr"
        pPrecisionMarshal := pPrecision is VarRef ? "short*" : "ptr"
        pScaleMarshal := pScale is VarRef ? "short*" : "ptr"
        pNullableMarshal := pNullable is VarRef ? "short*" : "ptr"

        result := DllCall("ODBC32.dll\SQLGetDescRecA", hdescMarshal, hdesc, "short", iRecord, szNameMarshal, szName, "short", cbNameMax, pcbNameMarshal, pcbName, pfTypeMarshal, pfType, pfSubTypeMarshal, pfSubType, pLengthMarshal, pLength, pPrecisionMarshal, pPrecision, pScaleMarshal, pScale, pNullableMarshal, pNullable, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hdbc 
     * @param {Integer} fOption 
     * @param {Integer} vParam 
     * @returns {Integer} 
     */
    static SQLSetConnectOptionA(hdbc, fOption, vParam) {
        hdbcMarshal := hdbc is VarRef ? "ptr" : "ptr"

        result := DllCall("ODBC32.dll\SQLSetConnectOptionA", hdbcMarshal, hdbc, "ushort", fOption, "uint", vParam, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} EnvironmentHandle 
     * @param {Pointer<Pointer<Void>>} ConnectionHandle 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlallocconnect-function
     */
    static SQLAllocConnect(EnvironmentHandle, ConnectionHandle) {
        EnvironmentHandleMarshal := EnvironmentHandle is VarRef ? "ptr" : "ptr"
        ConnectionHandleMarshal := ConnectionHandle is VarRef ? "ptr*" : "ptr"

        result := DllCall("ODBC32.dll\SQLAllocConnect", EnvironmentHandleMarshal, EnvironmentHandle, ConnectionHandleMarshal, ConnectionHandle, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} EnvironmentHandle 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlallocenv-function
     */
    static SQLAllocEnv(EnvironmentHandle) {
        EnvironmentHandleMarshal := EnvironmentHandle is VarRef ? "ptr*" : "ptr"

        result := DllCall("ODBC32.dll\SQLAllocEnv", EnvironmentHandleMarshal, EnvironmentHandle, "short")
        return result
    }

    /**
     * 
     * @param {Integer} HandleType 
     * @param {Pointer<Void>} InputHandle 
     * @param {Pointer<Pointer<Void>>} OutputHandle 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlallochandle-function
     */
    static SQLAllocHandle(HandleType, InputHandle, OutputHandle) {
        InputHandleMarshal := InputHandle is VarRef ? "ptr" : "ptr"
        OutputHandleMarshal := OutputHandle is VarRef ? "ptr*" : "ptr"

        result := DllCall("ODBC32.dll\SQLAllocHandle", "short", HandleType, InputHandleMarshal, InputHandle, OutputHandleMarshal, OutputHandle, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} ConnectionHandle 
     * @param {Pointer<Pointer<Void>>} StatementHandle 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlallocstmt-function
     */
    static SQLAllocStmt(ConnectionHandle, StatementHandle) {
        ConnectionHandleMarshal := ConnectionHandle is VarRef ? "ptr" : "ptr"
        StatementHandleMarshal := StatementHandle is VarRef ? "ptr*" : "ptr"

        result := DllCall("ODBC32.dll\SQLAllocStmt", ConnectionHandleMarshal, ConnectionHandle, StatementHandleMarshal, StatementHandle, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} StatementHandle 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlcancel-function
     */
    static SQLCancel(StatementHandle) {
        StatementHandleMarshal := StatementHandle is VarRef ? "ptr" : "ptr"

        result := DllCall("ODBC32.dll\SQLCancel", StatementHandleMarshal, StatementHandle, "short")
        return result
    }

    /**
     * 
     * @param {Integer} HandleType 
     * @param {Pointer<Void>} InputHandle 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlcancelhandle-function
     */
    static SQLCancelHandle(HandleType, InputHandle) {
        InputHandleMarshal := InputHandle is VarRef ? "ptr" : "ptr"

        result := DllCall("ODBC32.dll\SQLCancelHandle", "short", HandleType, InputHandleMarshal, InputHandle, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} StatementHandle 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlclosecursor-function
     */
    static SQLCloseCursor(StatementHandle) {
        StatementHandleMarshal := StatementHandle is VarRef ? "ptr" : "ptr"

        result := DllCall("ODBC32.dll\SQLCloseCursor", StatementHandleMarshal, StatementHandle, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} StatementHandle 
     * @param {Pointer<Integer>} CatalogName 
     * @param {Integer} NameLength1 
     * @param {Pointer<Integer>} SchemaName 
     * @param {Integer} NameLength2 
     * @param {Pointer<Integer>} TableName 
     * @param {Integer} NameLength3 
     * @param {Pointer<Integer>} ColumnName 
     * @param {Integer} NameLength4 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlcolumns-function
     */
    static SQLColumns(StatementHandle, CatalogName, NameLength1, SchemaName, NameLength2, TableName, NameLength3, ColumnName, NameLength4) {
        StatementHandleMarshal := StatementHandle is VarRef ? "ptr" : "ptr"
        CatalogNameMarshal := CatalogName is VarRef ? "char*" : "ptr"
        SchemaNameMarshal := SchemaName is VarRef ? "char*" : "ptr"
        TableNameMarshal := TableName is VarRef ? "char*" : "ptr"
        ColumnNameMarshal := ColumnName is VarRef ? "char*" : "ptr"

        result := DllCall("ODBC32.dll\SQLColumns", StatementHandleMarshal, StatementHandle, CatalogNameMarshal, CatalogName, "short", NameLength1, SchemaNameMarshal, SchemaName, "short", NameLength2, TableNameMarshal, TableName, "short", NameLength3, ColumnNameMarshal, ColumnName, "short", NameLength4, "short")
        return result
    }

    /**
     * 
     * @param {Integer} HandleType 
     * @param {Pointer<Void>} Handle 
     * @param {Pointer<Integer>} AsyncRetCodePtr 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlcompleteasync-function
     */
    static SQLCompleteAsync(HandleType, Handle, AsyncRetCodePtr) {
        HandleMarshal := Handle is VarRef ? "ptr" : "ptr"
        AsyncRetCodePtrMarshal := AsyncRetCodePtr is VarRef ? "short*" : "ptr"

        result := DllCall("ODBC32.dll\SQLCompleteAsync", "short", HandleType, HandleMarshal, Handle, AsyncRetCodePtrMarshal, AsyncRetCodePtr, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} ConnectionHandle 
     * @param {Pointer<Integer>} ServerName 
     * @param {Integer} NameLength1 
     * @param {Pointer<Integer>} UserName 
     * @param {Integer} NameLength2 
     * @param {Pointer<Integer>} Authentication 
     * @param {Integer} NameLength3 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlconnect-function
     */
    static SQLConnect(ConnectionHandle, ServerName, NameLength1, UserName, NameLength2, Authentication, NameLength3) {
        ConnectionHandleMarshal := ConnectionHandle is VarRef ? "ptr" : "ptr"
        ServerNameMarshal := ServerName is VarRef ? "char*" : "ptr"
        UserNameMarshal := UserName is VarRef ? "char*" : "ptr"
        AuthenticationMarshal := Authentication is VarRef ? "char*" : "ptr"

        result := DllCall("ODBC32.dll\SQLConnect", ConnectionHandleMarshal, ConnectionHandle, ServerNameMarshal, ServerName, "short", NameLength1, UserNameMarshal, UserName, "short", NameLength2, AuthenticationMarshal, Authentication, "short", NameLength3, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} SourceDescHandle 
     * @param {Pointer<Void>} TargetDescHandle 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlcopydesc-function
     */
    static SQLCopyDesc(SourceDescHandle, TargetDescHandle) {
        SourceDescHandleMarshal := SourceDescHandle is VarRef ? "ptr" : "ptr"
        TargetDescHandleMarshal := TargetDescHandle is VarRef ? "ptr" : "ptr"

        result := DllCall("ODBC32.dll\SQLCopyDesc", SourceDescHandleMarshal, SourceDescHandle, TargetDescHandleMarshal, TargetDescHandle, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} EnvironmentHandle 
     * @param {Integer} Direction 
     * @param {Pointer<Integer>} ServerName 
     * @param {Integer} BufferLength1 
     * @param {Pointer<Integer>} NameLength1Ptr 
     * @param {Pointer<Integer>} Description 
     * @param {Integer} BufferLength2 
     * @param {Pointer<Integer>} NameLength2Ptr 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqldatasources-function
     */
    static SQLDataSources(EnvironmentHandle, Direction, ServerName, BufferLength1, NameLength1Ptr, Description, BufferLength2, NameLength2Ptr) {
        EnvironmentHandleMarshal := EnvironmentHandle is VarRef ? "ptr" : "ptr"
        ServerNameMarshal := ServerName is VarRef ? "char*" : "ptr"
        NameLength1PtrMarshal := NameLength1Ptr is VarRef ? "short*" : "ptr"
        DescriptionMarshal := Description is VarRef ? "char*" : "ptr"
        NameLength2PtrMarshal := NameLength2Ptr is VarRef ? "short*" : "ptr"

        result := DllCall("ODBC32.dll\SQLDataSources", EnvironmentHandleMarshal, EnvironmentHandle, "ushort", Direction, ServerNameMarshal, ServerName, "short", BufferLength1, NameLength1PtrMarshal, NameLength1Ptr, DescriptionMarshal, Description, "short", BufferLength2, NameLength2PtrMarshal, NameLength2Ptr, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} ConnectionHandle 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqldisconnect-function
     */
    static SQLDisconnect(ConnectionHandle) {
        ConnectionHandleMarshal := ConnectionHandle is VarRef ? "ptr" : "ptr"

        result := DllCall("ODBC32.dll\SQLDisconnect", ConnectionHandleMarshal, ConnectionHandle, "short")
        return result
    }

    /**
     * 
     * @param {Integer} HandleType 
     * @param {Pointer<Void>} Handle 
     * @param {Integer} CompletionType 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlendtran-function
     */
    static SQLEndTran(HandleType, Handle, CompletionType) {
        HandleMarshal := Handle is VarRef ? "ptr" : "ptr"

        result := DllCall("ODBC32.dll\SQLEndTran", "short", HandleType, HandleMarshal, Handle, "short", CompletionType, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} EnvironmentHandle 
     * @param {Pointer<Void>} ConnectionHandle 
     * @param {Pointer<Void>} StatementHandle 
     * @param {Pointer<Integer>} Sqlstate 
     * @param {Pointer<Integer>} NativeError 
     * @param {Pointer<Integer>} MessageText 
     * @param {Integer} BufferLength 
     * @param {Pointer<Integer>} TextLength 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlerror-function
     */
    static SQLError(EnvironmentHandle, ConnectionHandle, StatementHandle, Sqlstate, NativeError, MessageText, BufferLength, TextLength) {
        EnvironmentHandleMarshal := EnvironmentHandle is VarRef ? "ptr" : "ptr"
        ConnectionHandleMarshal := ConnectionHandle is VarRef ? "ptr" : "ptr"
        StatementHandleMarshal := StatementHandle is VarRef ? "ptr" : "ptr"
        SqlstateMarshal := Sqlstate is VarRef ? "char*" : "ptr"
        NativeErrorMarshal := NativeError is VarRef ? "int*" : "ptr"
        MessageTextMarshal := MessageText is VarRef ? "char*" : "ptr"
        TextLengthMarshal := TextLength is VarRef ? "short*" : "ptr"

        result := DllCall("ODBC32.dll\SQLError", EnvironmentHandleMarshal, EnvironmentHandle, ConnectionHandleMarshal, ConnectionHandle, StatementHandleMarshal, StatementHandle, SqlstateMarshal, Sqlstate, NativeErrorMarshal, NativeError, MessageTextMarshal, MessageText, "short", BufferLength, TextLengthMarshal, TextLength, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} StatementHandle 
     * @param {Pointer<Integer>} StatementText 
     * @param {Integer} TextLength 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlexecdirect-function
     */
    static SQLExecDirect(StatementHandle, StatementText, TextLength) {
        StatementHandleMarshal := StatementHandle is VarRef ? "ptr" : "ptr"
        StatementTextMarshal := StatementText is VarRef ? "char*" : "ptr"

        result := DllCall("ODBC32.dll\SQLExecDirect", StatementHandleMarshal, StatementHandle, StatementTextMarshal, StatementText, "int", TextLength, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} StatementHandle 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlexecute-function
     */
    static SQLExecute(StatementHandle) {
        StatementHandleMarshal := StatementHandle is VarRef ? "ptr" : "ptr"

        result := DllCall("ODBC32.dll\SQLExecute", StatementHandleMarshal, StatementHandle, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} StatementHandle 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlfetch-function
     */
    static SQLFetch(StatementHandle) {
        StatementHandleMarshal := StatementHandle is VarRef ? "ptr" : "ptr"

        result := DllCall("ODBC32.dll\SQLFetch", StatementHandleMarshal, StatementHandle, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} ConnectionHandle 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlfreeconnect-function
     */
    static SQLFreeConnect(ConnectionHandle) {
        ConnectionHandleMarshal := ConnectionHandle is VarRef ? "ptr" : "ptr"

        result := DllCall("ODBC32.dll\SQLFreeConnect", ConnectionHandleMarshal, ConnectionHandle, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} EnvironmentHandle 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlfreeenv-function
     */
    static SQLFreeEnv(EnvironmentHandle) {
        EnvironmentHandleMarshal := EnvironmentHandle is VarRef ? "ptr" : "ptr"

        result := DllCall("ODBC32.dll\SQLFreeEnv", EnvironmentHandleMarshal, EnvironmentHandle, "short")
        return result
    }

    /**
     * 
     * @param {Integer} HandleType 
     * @param {Pointer<Void>} Handle 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlfreehandle-function
     */
    static SQLFreeHandle(HandleType, Handle) {
        HandleMarshal := Handle is VarRef ? "ptr" : "ptr"

        result := DllCall("ODBC32.dll\SQLFreeHandle", "short", HandleType, HandleMarshal, Handle, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} StatementHandle 
     * @param {Integer} Option 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlfreestmt-function
     */
    static SQLFreeStmt(StatementHandle, Option) {
        StatementHandleMarshal := StatementHandle is VarRef ? "ptr" : "ptr"

        result := DllCall("ODBC32.dll\SQLFreeStmt", StatementHandleMarshal, StatementHandle, "ushort", Option, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} ConnectionHandle 
     * @param {Integer} Attribute 
     * @param {Pointer<Void>} Value 
     * @param {Integer} BufferLength 
     * @param {Pointer<Integer>} StringLengthPtr 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlgetconnectattr-function
     */
    static SQLGetConnectAttr(ConnectionHandle, Attribute, Value, BufferLength, StringLengthPtr) {
        ConnectionHandleMarshal := ConnectionHandle is VarRef ? "ptr" : "ptr"
        ValueMarshal := Value is VarRef ? "ptr" : "ptr"
        StringLengthPtrMarshal := StringLengthPtr is VarRef ? "int*" : "ptr"

        result := DllCall("ODBC32.dll\SQLGetConnectAttr", ConnectionHandleMarshal, ConnectionHandle, "int", Attribute, ValueMarshal, Value, "int", BufferLength, StringLengthPtrMarshal, StringLengthPtr, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} ConnectionHandle 
     * @param {Integer} Option 
     * @param {Pointer<Void>} Value 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlgetconnectoption-function
     * @deprecated ODBC API: SQLGetConnectOption is deprecated. Please use SQLGetConnectAttr instead.
     */
    static SQLGetConnectOption(ConnectionHandle, Option, Value) {
        ConnectionHandleMarshal := ConnectionHandle is VarRef ? "ptr" : "ptr"
        ValueMarshal := Value is VarRef ? "ptr" : "ptr"

        result := DllCall("ODBC32.dll\SQLGetConnectOption", ConnectionHandleMarshal, ConnectionHandle, "ushort", Option, ValueMarshal, Value, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} StatementHandle 
     * @param {Pointer<Integer>} CursorName 
     * @param {Integer} BufferLength 
     * @param {Pointer<Integer>} NameLengthPtr 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlgetcursorname-function
     */
    static SQLGetCursorName(StatementHandle, CursorName, BufferLength, NameLengthPtr) {
        StatementHandleMarshal := StatementHandle is VarRef ? "ptr" : "ptr"
        CursorNameMarshal := CursorName is VarRef ? "char*" : "ptr"
        NameLengthPtrMarshal := NameLengthPtr is VarRef ? "short*" : "ptr"

        result := DllCall("ODBC32.dll\SQLGetCursorName", StatementHandleMarshal, StatementHandle, CursorNameMarshal, CursorName, "short", BufferLength, NameLengthPtrMarshal, NameLengthPtr, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} DescriptorHandle 
     * @param {Integer} RecNumber 
     * @param {Integer} FieldIdentifier 
     * @param {Pointer<Void>} Value 
     * @param {Integer} BufferLength 
     * @param {Pointer<Integer>} StringLength 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlgetdescfield-function
     */
    static SQLGetDescField(DescriptorHandle, RecNumber, FieldIdentifier, Value, BufferLength, StringLength) {
        DescriptorHandleMarshal := DescriptorHandle is VarRef ? "ptr" : "ptr"
        ValueMarshal := Value is VarRef ? "ptr" : "ptr"
        StringLengthMarshal := StringLength is VarRef ? "int*" : "ptr"

        result := DllCall("ODBC32.dll\SQLGetDescField", DescriptorHandleMarshal, DescriptorHandle, "short", RecNumber, "short", FieldIdentifier, ValueMarshal, Value, "int", BufferLength, StringLengthMarshal, StringLength, "short")
        return result
    }

    /**
     * 
     * @param {Integer} HandleType 
     * @param {Pointer<Void>} Handle 
     * @param {Integer} RecNumber 
     * @param {Integer} DiagIdentifier 
     * @param {Pointer<Void>} DiagInfo 
     * @param {Integer} BufferLength 
     * @param {Pointer<Integer>} StringLength 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlgetdiagfield-function
     */
    static SQLGetDiagField(HandleType, Handle, RecNumber, DiagIdentifier, DiagInfo, BufferLength, StringLength) {
        HandleMarshal := Handle is VarRef ? "ptr" : "ptr"
        DiagInfoMarshal := DiagInfo is VarRef ? "ptr" : "ptr"
        StringLengthMarshal := StringLength is VarRef ? "short*" : "ptr"

        result := DllCall("ODBC32.dll\SQLGetDiagField", "short", HandleType, HandleMarshal, Handle, "short", RecNumber, "short", DiagIdentifier, DiagInfoMarshal, DiagInfo, "short", BufferLength, StringLengthMarshal, StringLength, "short")
        return result
    }

    /**
     * 
     * @param {Integer} HandleType 
     * @param {Pointer<Void>} Handle 
     * @param {Integer} RecNumber 
     * @param {Pointer<Integer>} Sqlstate 
     * @param {Pointer<Integer>} NativeError 
     * @param {Pointer<Integer>} MessageText 
     * @param {Integer} BufferLength 
     * @param {Pointer<Integer>} TextLength 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlgetdiagrec-function
     */
    static SQLGetDiagRec(HandleType, Handle, RecNumber, Sqlstate, NativeError, MessageText, BufferLength, TextLength) {
        HandleMarshal := Handle is VarRef ? "ptr" : "ptr"
        SqlstateMarshal := Sqlstate is VarRef ? "char*" : "ptr"
        NativeErrorMarshal := NativeError is VarRef ? "int*" : "ptr"
        MessageTextMarshal := MessageText is VarRef ? "char*" : "ptr"
        TextLengthMarshal := TextLength is VarRef ? "short*" : "ptr"

        result := DllCall("ODBC32.dll\SQLGetDiagRec", "short", HandleType, HandleMarshal, Handle, "short", RecNumber, SqlstateMarshal, Sqlstate, NativeErrorMarshal, NativeError, MessageTextMarshal, MessageText, "short", BufferLength, TextLengthMarshal, TextLength, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} EnvironmentHandle 
     * @param {Integer} Attribute 
     * @param {Pointer<Void>} Value 
     * @param {Integer} BufferLength 
     * @param {Pointer<Integer>} StringLength 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlgetenvattr-function
     */
    static SQLGetEnvAttr(EnvironmentHandle, Attribute, Value, BufferLength, StringLength) {
        EnvironmentHandleMarshal := EnvironmentHandle is VarRef ? "ptr" : "ptr"
        ValueMarshal := Value is VarRef ? "ptr" : "ptr"
        StringLengthMarshal := StringLength is VarRef ? "int*" : "ptr"

        result := DllCall("ODBC32.dll\SQLGetEnvAttr", EnvironmentHandleMarshal, EnvironmentHandle, "int", Attribute, ValueMarshal, Value, "int", BufferLength, StringLengthMarshal, StringLength, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} ConnectionHandle 
     * @param {Integer} FunctionId 
     * @param {Pointer<Integer>} Supported 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlgetfunctions-function
     */
    static SQLGetFunctions(ConnectionHandle, FunctionId, Supported) {
        ConnectionHandleMarshal := ConnectionHandle is VarRef ? "ptr" : "ptr"
        SupportedMarshal := Supported is VarRef ? "ushort*" : "ptr"

        result := DllCall("ODBC32.dll\SQLGetFunctions", ConnectionHandleMarshal, ConnectionHandle, "ushort", FunctionId, SupportedMarshal, Supported, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} ConnectionHandle 
     * @param {Integer} InfoType 
     * @param {Pointer} InfoValue 
     * @param {Integer} BufferLength 
     * @param {Pointer<Integer>} StringLengthPtr 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlgetinfo-function
     */
    static SQLGetInfo(ConnectionHandle, InfoType, InfoValue, BufferLength, StringLengthPtr) {
        ConnectionHandleMarshal := ConnectionHandle is VarRef ? "ptr" : "ptr"
        StringLengthPtrMarshal := StringLengthPtr is VarRef ? "short*" : "ptr"

        result := DllCall("ODBC32.dll\SQLGetInfo", ConnectionHandleMarshal, ConnectionHandle, "ushort", InfoType, "ptr", InfoValue, "short", BufferLength, StringLengthPtrMarshal, StringLengthPtr, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} StatementHandle 
     * @param {Integer} Attribute 
     * @param {Pointer<Void>} Value 
     * @param {Integer} BufferLength 
     * @param {Pointer<Integer>} StringLength 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlgetstmtattr-function
     */
    static SQLGetStmtAttr(StatementHandle, Attribute, Value, BufferLength, StringLength) {
        StatementHandleMarshal := StatementHandle is VarRef ? "ptr" : "ptr"
        ValueMarshal := Value is VarRef ? "ptr" : "ptr"
        StringLengthMarshal := StringLength is VarRef ? "int*" : "ptr"

        result := DllCall("ODBC32.dll\SQLGetStmtAttr", StatementHandleMarshal, StatementHandle, "int", Attribute, ValueMarshal, Value, "int", BufferLength, StringLengthMarshal, StringLength, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} StatementHandle 
     * @param {Integer} Option 
     * @param {Pointer<Void>} Value 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlgetstmtoption-function
     * @deprecated ODBC API: SQLGetStmtOption is deprecated. Please use SQLGetStmtAttr instead.
     */
    static SQLGetStmtOption(StatementHandle, Option, Value) {
        StatementHandleMarshal := StatementHandle is VarRef ? "ptr" : "ptr"
        ValueMarshal := Value is VarRef ? "ptr" : "ptr"

        result := DllCall("ODBC32.dll\SQLGetStmtOption", StatementHandleMarshal, StatementHandle, "ushort", Option, ValueMarshal, Value, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} StatementHandle 
     * @param {Integer} DataType 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlgettypeinfo-function
     */
    static SQLGetTypeInfo(StatementHandle, DataType) {
        StatementHandleMarshal := StatementHandle is VarRef ? "ptr" : "ptr"

        result := DllCall("ODBC32.dll\SQLGetTypeInfo", StatementHandleMarshal, StatementHandle, "short", DataType, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} StatementHandle 
     * @param {Pointer<Integer>} ColumnCount 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlnumresultcols-function
     */
    static SQLNumResultCols(StatementHandle, ColumnCount) {
        StatementHandleMarshal := StatementHandle is VarRef ? "ptr" : "ptr"
        ColumnCountMarshal := ColumnCount is VarRef ? "short*" : "ptr"

        result := DllCall("ODBC32.dll\SQLNumResultCols", StatementHandleMarshal, StatementHandle, ColumnCountMarshal, ColumnCount, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} StatementHandle 
     * @param {Pointer<Pointer<Void>>} Value 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlparamdata-function
     */
    static SQLParamData(StatementHandle, Value) {
        StatementHandleMarshal := StatementHandle is VarRef ? "ptr" : "ptr"
        ValueMarshal := Value is VarRef ? "ptr*" : "ptr"

        result := DllCall("ODBC32.dll\SQLParamData", StatementHandleMarshal, StatementHandle, ValueMarshal, Value, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} StatementHandle 
     * @param {Pointer<Integer>} StatementText 
     * @param {Integer} TextLength 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlprepare-function
     */
    static SQLPrepare(StatementHandle, StatementText, TextLength) {
        StatementHandleMarshal := StatementHandle is VarRef ? "ptr" : "ptr"
        StatementTextMarshal := StatementText is VarRef ? "char*" : "ptr"

        result := DllCall("ODBC32.dll\SQLPrepare", StatementHandleMarshal, StatementHandle, StatementTextMarshal, StatementText, "int", TextLength, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} ConnectionHandle 
     * @param {Integer} Attribute 
     * @param {Pointer} Value 
     * @param {Integer} StringLength 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlsetconnectattr-function
     */
    static SQLSetConnectAttr(ConnectionHandle, Attribute, Value, StringLength) {
        ConnectionHandleMarshal := ConnectionHandle is VarRef ? "ptr" : "ptr"

        result := DllCall("ODBC32.dll\SQLSetConnectAttr", ConnectionHandleMarshal, ConnectionHandle, "int", Attribute, "ptr", Value, "int", StringLength, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} StatementHandle 
     * @param {Pointer<Integer>} CursorName 
     * @param {Integer} NameLength 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlsetcursorname-function
     */
    static SQLSetCursorName(StatementHandle, CursorName, NameLength) {
        StatementHandleMarshal := StatementHandle is VarRef ? "ptr" : "ptr"
        CursorNameMarshal := CursorName is VarRef ? "char*" : "ptr"

        result := DllCall("ODBC32.dll\SQLSetCursorName", StatementHandleMarshal, StatementHandle, CursorNameMarshal, CursorName, "short", NameLength, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} DescriptorHandle 
     * @param {Integer} RecNumber 
     * @param {Integer} FieldIdentifier 
     * @param {Pointer<Void>} Value 
     * @param {Integer} BufferLength 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlsetdescfield-function
     */
    static SQLSetDescField(DescriptorHandle, RecNumber, FieldIdentifier, Value, BufferLength) {
        DescriptorHandleMarshal := DescriptorHandle is VarRef ? "ptr" : "ptr"
        ValueMarshal := Value is VarRef ? "ptr" : "ptr"

        result := DllCall("ODBC32.dll\SQLSetDescField", DescriptorHandleMarshal, DescriptorHandle, "short", RecNumber, "short", FieldIdentifier, ValueMarshal, Value, "int", BufferLength, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} EnvironmentHandle 
     * @param {Integer} Attribute 
     * @param {Pointer} Value 
     * @param {Integer} StringLength 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlsetenvattr-function
     */
    static SQLSetEnvAttr(EnvironmentHandle, Attribute, Value, StringLength) {
        EnvironmentHandleMarshal := EnvironmentHandle is VarRef ? "ptr" : "ptr"

        result := DllCall("ODBC32.dll\SQLSetEnvAttr", EnvironmentHandleMarshal, EnvironmentHandle, "int", Attribute, "ptr", Value, "int", StringLength, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} StatementHandle 
     * @param {Integer} Attribute 
     * @param {Pointer<Void>} Value 
     * @param {Integer} StringLength 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlsetstmtattr-function
     */
    static SQLSetStmtAttr(StatementHandle, Attribute, Value, StringLength) {
        StatementHandleMarshal := StatementHandle is VarRef ? "ptr" : "ptr"
        ValueMarshal := Value is VarRef ? "ptr" : "ptr"

        result := DllCall("ODBC32.dll\SQLSetStmtAttr", StatementHandleMarshal, StatementHandle, "int", Attribute, ValueMarshal, Value, "int", StringLength, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} StatementHandle 
     * @param {Integer} IdentifierType 
     * @param {Pointer<Integer>} CatalogName 
     * @param {Integer} NameLength1 
     * @param {Pointer<Integer>} SchemaName 
     * @param {Integer} NameLength2 
     * @param {Pointer<Integer>} TableName 
     * @param {Integer} NameLength3 
     * @param {Integer} Scope 
     * @param {Integer} Nullable 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlspecialcolumns-function
     */
    static SQLSpecialColumns(StatementHandle, IdentifierType, CatalogName, NameLength1, SchemaName, NameLength2, TableName, NameLength3, Scope, Nullable) {
        StatementHandleMarshal := StatementHandle is VarRef ? "ptr" : "ptr"
        CatalogNameMarshal := CatalogName is VarRef ? "char*" : "ptr"
        SchemaNameMarshal := SchemaName is VarRef ? "char*" : "ptr"
        TableNameMarshal := TableName is VarRef ? "char*" : "ptr"

        result := DllCall("ODBC32.dll\SQLSpecialColumns", StatementHandleMarshal, StatementHandle, "ushort", IdentifierType, CatalogNameMarshal, CatalogName, "short", NameLength1, SchemaNameMarshal, SchemaName, "short", NameLength2, TableNameMarshal, TableName, "short", NameLength3, "ushort", Scope, "ushort", Nullable, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} StatementHandle 
     * @param {Pointer<Integer>} CatalogName 
     * @param {Integer} NameLength1 
     * @param {Pointer<Integer>} SchemaName 
     * @param {Integer} NameLength2 
     * @param {Pointer<Integer>} TableName 
     * @param {Integer} NameLength3 
     * @param {Integer} Unique 
     * @param {Integer} Reserved 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlstatistics-function
     */
    static SQLStatistics(StatementHandle, CatalogName, NameLength1, SchemaName, NameLength2, TableName, NameLength3, Unique, Reserved) {
        StatementHandleMarshal := StatementHandle is VarRef ? "ptr" : "ptr"
        CatalogNameMarshal := CatalogName is VarRef ? "char*" : "ptr"
        SchemaNameMarshal := SchemaName is VarRef ? "char*" : "ptr"
        TableNameMarshal := TableName is VarRef ? "char*" : "ptr"

        result := DllCall("ODBC32.dll\SQLStatistics", StatementHandleMarshal, StatementHandle, CatalogNameMarshal, CatalogName, "short", NameLength1, SchemaNameMarshal, SchemaName, "short", NameLength2, TableNameMarshal, TableName, "short", NameLength3, "ushort", Unique, "ushort", Reserved, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} StatementHandle 
     * @param {Pointer<Integer>} CatalogName 
     * @param {Integer} NameLength1 
     * @param {Pointer<Integer>} SchemaName 
     * @param {Integer} NameLength2 
     * @param {Pointer<Integer>} TableName 
     * @param {Integer} NameLength3 
     * @param {Pointer<Integer>} TableType 
     * @param {Integer} NameLength4 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqltables-function
     */
    static SQLTables(StatementHandle, CatalogName, NameLength1, SchemaName, NameLength2, TableName, NameLength3, TableType, NameLength4) {
        StatementHandleMarshal := StatementHandle is VarRef ? "ptr" : "ptr"
        CatalogNameMarshal := CatalogName is VarRef ? "char*" : "ptr"
        SchemaNameMarshal := SchemaName is VarRef ? "char*" : "ptr"
        TableNameMarshal := TableName is VarRef ? "char*" : "ptr"
        TableTypeMarshal := TableType is VarRef ? "char*" : "ptr"

        result := DllCall("ODBC32.dll\SQLTables", StatementHandleMarshal, StatementHandle, CatalogNameMarshal, CatalogName, "short", NameLength1, SchemaNameMarshal, SchemaName, "short", NameLength2, TableNameMarshal, TableName, "short", NameLength3, TableTypeMarshal, TableType, "short", NameLength4, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} EnvironmentHandle 
     * @param {Pointer<Void>} ConnectionHandle 
     * @param {Integer} CompletionType 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqltransact-function
     */
    static SQLTransact(EnvironmentHandle, ConnectionHandle, CompletionType) {
        EnvironmentHandleMarshal := EnvironmentHandle is VarRef ? "ptr" : "ptr"
        ConnectionHandleMarshal := ConnectionHandle is VarRef ? "ptr" : "ptr"

        result := DllCall("ODBC32.dll\SQLTransact", EnvironmentHandleMarshal, EnvironmentHandle, ConnectionHandleMarshal, ConnectionHandle, "ushort", CompletionType, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} param0 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-batch
     */
    static bcp_batch(param0) {
        param0Marshal := param0 is VarRef ? "ptr" : "ptr"

        result := DllCall("odbcbcp.dll\bcp_batch", param0Marshal, param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} param0 
     * @param {Pointer<Integer>} param1 
     * @param {Integer} param2 
     * @param {Integer} param3 
     * @param {Pointer<Integer>} param4 
     * @param {Integer} param5 
     * @param {Integer} param6 
     * @param {Integer} param7 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-bind
     */
    static bcp_bind(param0, param1, param2, param3, param4, param5, param6, param7) {
        param0Marshal := param0 is VarRef ? "ptr" : "ptr"
        param1Marshal := param1 is VarRef ? "char*" : "ptr"
        param4Marshal := param4 is VarRef ? "char*" : "ptr"

        result := DllCall("odbcbcp.dll\bcp_bind", param0Marshal, param0, param1Marshal, param1, "int", param2, "int", param3, param4Marshal, param4, "int", param5, "int", param6, "int", param7, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} param0 
     * @param {Integer} param1 
     * @param {Integer} param2 
     * @param {Integer} param3 
     * @param {Integer} param4 
     * @param {Pointer<Integer>} param5 
     * @param {Integer} param6 
     * @param {Integer} param7 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-colfmt
     */
    static bcp_colfmt(param0, param1, param2, param3, param4, param5, param6, param7) {
        param0Marshal := param0 is VarRef ? "ptr" : "ptr"
        param5Marshal := param5 is VarRef ? "char*" : "ptr"

        result := DllCall("odbcbcp.dll\bcp_colfmt", param0Marshal, param0, "int", param1, "char", param2, "int", param3, "int", param4, param5Marshal, param5, "int", param6, "int", param7, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} param0 
     * @param {Integer} param1 
     * @param {Integer} param2 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-collen
     */
    static bcp_collen(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "ptr" : "ptr"

        result := DllCall("odbcbcp.dll\bcp_collen", param0Marshal, param0, "int", param1, "int", param2, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} param0 
     * @param {Pointer<Integer>} param1 
     * @param {Integer} param2 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-colptr
     */
    static bcp_colptr(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "ptr" : "ptr"
        param1Marshal := param1 is VarRef ? "char*" : "ptr"

        result := DllCall("odbcbcp.dll\bcp_colptr", param0Marshal, param0, param1Marshal, param1, "int", param2, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} param0 
     * @param {Integer} param1 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-columns
     */
    static bcp_columns(param0, param1) {
        param0Marshal := param0 is VarRef ? "ptr" : "ptr"

        result := DllCall("odbcbcp.dll\bcp_columns", param0Marshal, param0, "int", param1, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} param0 
     * @param {Integer} param1 
     * @param {Pointer<Void>} param2 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-control
     */
    static bcp_control(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "ptr" : "ptr"
        param2Marshal := param2 is VarRef ? "ptr" : "ptr"

        result := DllCall("odbcbcp.dll\bcp_control", param0Marshal, param0, "int", param1, param2Marshal, param2, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} param0 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-done
     */
    static bcp_done(param0) {
        param0Marshal := param0 is VarRef ? "ptr" : "ptr"

        result := DllCall("odbcbcp.dll\bcp_done", param0Marshal, param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} param0 
     * @param {Pointer<Integer>} param1 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-exec
     */
    static bcp_exec(param0, param1) {
        param0Marshal := param0 is VarRef ? "ptr" : "ptr"
        param1Marshal := param1 is VarRef ? "int*" : "ptr"

        result := DllCall("odbcbcp.dll\bcp_exec", param0Marshal, param0, param1Marshal, param1, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} param0 
     * @param {Integer} param1 
     * @param {Integer} param2 
     * @param {Pointer<Void>} param3 
     * @param {Integer} param4 
     * @param {Pointer<Integer>} param5 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-getcolfmt
     */
    static bcp_getcolfmt(param0, param1, param2, param3, param4, param5) {
        param0Marshal := param0 is VarRef ? "ptr" : "ptr"
        param3Marshal := param3 is VarRef ? "ptr" : "ptr"
        param5Marshal := param5 is VarRef ? "int*" : "ptr"

        result := DllCall("odbcbcp.dll\bcp_getcolfmt", param0Marshal, param0, "int", param1, "int", param2, param3Marshal, param3, "int", param4, param5Marshal, param5, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} param0 
     * @param {PSTR} param1 
     * @param {PSTR} param2 
     * @param {PSTR} param3 
     * @param {Integer} param4 
     * @returns {Integer} 
     */
    static bcp_initA(param0, param1, param2, param3, param4) {
        param1 := param1 is String ? StrPtr(param1) : param1
        param2 := param2 is String ? StrPtr(param2) : param2
        param3 := param3 is String ? StrPtr(param3) : param3

        param0Marshal := param0 is VarRef ? "ptr" : "ptr"

        result := DllCall("odbcbcp.dll\bcp_initA", param0Marshal, param0, "ptr", param1, "ptr", param2, "ptr", param3, "int", param4, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} param0 
     * @param {PWSTR} param1 
     * @param {PWSTR} param2 
     * @param {PWSTR} param3 
     * @param {Integer} param4 
     * @returns {Integer} 
     */
    static bcp_initW(param0, param1, param2, param3, param4) {
        param1 := param1 is String ? StrPtr(param1) : param1
        param2 := param2 is String ? StrPtr(param2) : param2
        param3 := param3 is String ? StrPtr(param3) : param3

        param0Marshal := param0 is VarRef ? "ptr" : "ptr"

        result := DllCall("odbcbcp.dll\bcp_initW", param0Marshal, param0, "ptr", param1, "ptr", param2, "ptr", param3, "int", param4, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} param0 
     * @param {Integer} param1 
     * @param {Pointer<Integer>} param2 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-moretext
     */
    static bcp_moretext(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "ptr" : "ptr"
        param2Marshal := param2 is VarRef ? "char*" : "ptr"

        result := DllCall("odbcbcp.dll\bcp_moretext", param0Marshal, param0, "int", param1, param2Marshal, param2, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} param0 
     * @param {PSTR} param1 
     * @returns {Integer} 
     */
    static bcp_readfmtA(param0, param1) {
        param1 := param1 is String ? StrPtr(param1) : param1

        param0Marshal := param0 is VarRef ? "ptr" : "ptr"

        result := DllCall("odbcbcp.dll\bcp_readfmtA", param0Marshal, param0, "ptr", param1, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} param0 
     * @param {PWSTR} param1 
     * @returns {Integer} 
     */
    static bcp_readfmtW(param0, param1) {
        param1 := param1 is String ? StrPtr(param1) : param1

        param0Marshal := param0 is VarRef ? "ptr" : "ptr"

        result := DllCall("odbcbcp.dll\bcp_readfmtW", param0Marshal, param0, "ptr", param1, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} param0 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-sendrow
     */
    static bcp_sendrow(param0) {
        param0Marshal := param0 is VarRef ? "ptr" : "ptr"

        result := DllCall("odbcbcp.dll\bcp_sendrow", param0Marshal, param0, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} param0 
     * @param {Integer} param1 
     * @param {Integer} param2 
     * @param {Pointer<Void>} param3 
     * @param {Integer} param4 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-setcolfmt
     */
    static bcp_setcolfmt(param0, param1, param2, param3, param4) {
        param0Marshal := param0 is VarRef ? "ptr" : "ptr"
        param3Marshal := param3 is VarRef ? "ptr" : "ptr"

        result := DllCall("odbcbcp.dll\bcp_setcolfmt", param0Marshal, param0, "int", param1, "int", param2, param3Marshal, param3, "int", param4, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} param0 
     * @param {PSTR} param1 
     * @returns {Integer} 
     */
    static bcp_writefmtA(param0, param1) {
        param1 := param1 is String ? StrPtr(param1) : param1

        param0Marshal := param0 is VarRef ? "ptr" : "ptr"

        result := DllCall("odbcbcp.dll\bcp_writefmtA", param0Marshal, param0, "ptr", param1, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} param0 
     * @param {PWSTR} param1 
     * @returns {Integer} 
     */
    static bcp_writefmtW(param0, param1) {
        param1 := param1 is String ? StrPtr(param1) : param1

        param0Marshal := param0 is VarRef ? "ptr" : "ptr"

        result := DllCall("odbcbcp.dll\bcp_writefmtW", param0Marshal, param0, "ptr", param1, "short")
        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @returns {PSTR} 
     */
    static dbprtypeA(param0) {
        result := DllCall("odbcbcp.dll\dbprtypeA", "int", param0, "ptr")
        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @returns {PWSTR} 
     */
    static dbprtypeW(param0) {
        result := DllCall("odbcbcp.dll\dbprtypeW", "int", param0, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} param0 
     * @returns {Integer} 
     */
    static SQLLinkedServers(param0) {
        param0Marshal := param0 is VarRef ? "ptr" : "ptr"

        result := DllCall("odbcbcp.dll\SQLLinkedServers", param0Marshal, param0, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} param0 
     * @param {PSTR} param1 
     * @param {Integer} param2 
     * @returns {Integer} 
     */
    static SQLLinkedCatalogsA(param0, param1, param2) {
        param1 := param1 is String ? StrPtr(param1) : param1

        param0Marshal := param0 is VarRef ? "ptr" : "ptr"

        result := DllCall("odbcbcp.dll\SQLLinkedCatalogsA", param0Marshal, param0, "ptr", param1, "short", param2, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} param0 
     * @param {PWSTR} param1 
     * @param {Integer} param2 
     * @returns {Integer} 
     */
    static SQLLinkedCatalogsW(param0, param1, param2) {
        param1 := param1 is String ? StrPtr(param1) : param1

        param0Marshal := param0 is VarRef ? "ptr" : "ptr"

        result := DllCall("odbcbcp.dll\SQLLinkedCatalogsW", param0Marshal, param0, "ptr", param1, "short", param2, "short")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwchServerName 
     * @param {PWSTR} pwchInstanceName 
     * @returns {HANDLE} 
     */
    static SQLInitEnumServers(pwchServerName, pwchInstanceName) {
        pwchServerName := pwchServerName is String ? StrPtr(pwchServerName) : pwchServerName
        pwchInstanceName := pwchInstanceName is String ? StrPtr(pwchInstanceName) : pwchInstanceName

        result := DllCall("odbcbcp.dll\SQLInitEnumServers", "ptr", pwchServerName, "ptr", pwchInstanceName, "ptr")
        return HANDLE({Value: result}, True)
    }

    /**
     * 
     * @param {HANDLE} hEnumHandle 
     * @param {Pointer<Integer>} prgEnumData 
     * @param {Pointer<Integer>} piEnumLength 
     * @returns {Integer} 
     */
    static SQLGetNextEnumeration(hEnumHandle, prgEnumData, piEnumLength) {
        hEnumHandle := hEnumHandle is Win32Handle ? NumGet(hEnumHandle, "ptr") : hEnumHandle

        prgEnumDataMarshal := prgEnumData is VarRef ? "char*" : "ptr"
        piEnumLengthMarshal := piEnumLength is VarRef ? "int*" : "ptr"

        result := DllCall("odbcbcp.dll\SQLGetNextEnumeration", "ptr", hEnumHandle, prgEnumDataMarshal, prgEnumData, piEnumLengthMarshal, piEnumLength, "short")
        return result
    }

    /**
     * 
     * @param {HANDLE} hEnumHandle 
     * @returns {Integer} 
     */
    static SQLCloseEnumServers(hEnumHandle) {
        hEnumHandle := hEnumHandle is Win32Handle ? NumGet(hEnumHandle, "ptr") : hEnumHandle

        result := DllCall("odbcbcp.dll\SQLCloseEnumServers", "ptr", hEnumHandle, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hdbc 
     * @param {Pointer} hwnd 
     * @param {Pointer<Integer>} szConnStrIn 
     * @param {Integer} cchConnStrIn 
     * @param {Pointer<Integer>} szConnStrOut 
     * @param {Integer} cchConnStrOutMax 
     * @param {Pointer<Integer>} pcchConnStrOut 
     * @param {Integer} fDriverCompletion 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqldriverconnect-function
     */
    static SQLDriverConnect(hdbc, hwnd, szConnStrIn, cchConnStrIn, szConnStrOut, cchConnStrOutMax, pcchConnStrOut, fDriverCompletion) {
        hdbcMarshal := hdbc is VarRef ? "ptr" : "ptr"
        szConnStrInMarshal := szConnStrIn is VarRef ? "char*" : "ptr"
        szConnStrOutMarshal := szConnStrOut is VarRef ? "char*" : "ptr"
        pcchConnStrOutMarshal := pcchConnStrOut is VarRef ? "short*" : "ptr"

        result := DllCall("ODBC32.dll\SQLDriverConnect", hdbcMarshal, hdbc, "ptr", hwnd, szConnStrInMarshal, szConnStrIn, "short", cchConnStrIn, szConnStrOutMarshal, szConnStrOut, "short", cchConnStrOutMax, pcchConnStrOutMarshal, pcchConnStrOut, "ushort", fDriverCompletion, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hdbc 
     * @param {Pointer<Integer>} szConnStrIn 
     * @param {Integer} cchConnStrIn 
     * @param {Pointer<Integer>} szConnStrOut 
     * @param {Integer} cchConnStrOutMax 
     * @param {Pointer<Integer>} pcchConnStrOut 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlbrowseconnect-function
     */
    static SQLBrowseConnect(hdbc, szConnStrIn, cchConnStrIn, szConnStrOut, cchConnStrOutMax, pcchConnStrOut) {
        hdbcMarshal := hdbc is VarRef ? "ptr" : "ptr"
        szConnStrInMarshal := szConnStrIn is VarRef ? "char*" : "ptr"
        szConnStrOutMarshal := szConnStrOut is VarRef ? "char*" : "ptr"
        pcchConnStrOutMarshal := pcchConnStrOut is VarRef ? "short*" : "ptr"

        result := DllCall("ODBC32.dll\SQLBrowseConnect", hdbcMarshal, hdbc, szConnStrInMarshal, szConnStrIn, "short", cchConnStrIn, szConnStrOutMarshal, szConnStrOut, "short", cchConnStrOutMax, pcchConnStrOutMarshal, pcchConnStrOut, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} StatementHandle 
     * @param {Integer} Operation 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlbulkoperations-function
     */
    static SQLBulkOperations(StatementHandle, Operation) {
        StatementHandleMarshal := StatementHandle is VarRef ? "ptr" : "ptr"

        result := DllCall("ODBC32.dll\SQLBulkOperations", StatementHandleMarshal, StatementHandle, "short", Operation, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Pointer<Integer>} szCatalogName 
     * @param {Integer} cchCatalogName 
     * @param {Pointer<Integer>} szSchemaName 
     * @param {Integer} cchSchemaName 
     * @param {Pointer<Integer>} szTableName 
     * @param {Integer} cchTableName 
     * @param {Pointer<Integer>} szColumnName 
     * @param {Integer} cchColumnName 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlcolumnprivileges-function
     */
    static SQLColumnPrivileges(hstmt, szCatalogName, cchCatalogName, szSchemaName, cchSchemaName, szTableName, cchTableName, szColumnName, cchColumnName) {
        hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
        szCatalogNameMarshal := szCatalogName is VarRef ? "char*" : "ptr"
        szSchemaNameMarshal := szSchemaName is VarRef ? "char*" : "ptr"
        szTableNameMarshal := szTableName is VarRef ? "char*" : "ptr"
        szColumnNameMarshal := szColumnName is VarRef ? "char*" : "ptr"

        result := DllCall("ODBC32.dll\SQLColumnPrivileges", hstmtMarshal, hstmt, szCatalogNameMarshal, szCatalogName, "short", cchCatalogName, szSchemaNameMarshal, szSchemaName, "short", cchSchemaName, szTableNameMarshal, szTableName, "short", cchTableName, szColumnNameMarshal, szColumnName, "short", cchColumnName, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Pointer<Integer>} szPkCatalogName 
     * @param {Integer} cchPkCatalogName 
     * @param {Pointer<Integer>} szPkSchemaName 
     * @param {Integer} cchPkSchemaName 
     * @param {Pointer<Integer>} szPkTableName 
     * @param {Integer} cchPkTableName 
     * @param {Pointer<Integer>} szFkCatalogName 
     * @param {Integer} cchFkCatalogName 
     * @param {Pointer<Integer>} szFkSchemaName 
     * @param {Integer} cchFkSchemaName 
     * @param {Pointer<Integer>} szFkTableName 
     * @param {Integer} cchFkTableName 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlforeignkeys-function
     */
    static SQLForeignKeys(hstmt, szPkCatalogName, cchPkCatalogName, szPkSchemaName, cchPkSchemaName, szPkTableName, cchPkTableName, szFkCatalogName, cchFkCatalogName, szFkSchemaName, cchFkSchemaName, szFkTableName, cchFkTableName) {
        hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
        szPkCatalogNameMarshal := szPkCatalogName is VarRef ? "char*" : "ptr"
        szPkSchemaNameMarshal := szPkSchemaName is VarRef ? "char*" : "ptr"
        szPkTableNameMarshal := szPkTableName is VarRef ? "char*" : "ptr"
        szFkCatalogNameMarshal := szFkCatalogName is VarRef ? "char*" : "ptr"
        szFkSchemaNameMarshal := szFkSchemaName is VarRef ? "char*" : "ptr"
        szFkTableNameMarshal := szFkTableName is VarRef ? "char*" : "ptr"

        result := DllCall("ODBC32.dll\SQLForeignKeys", hstmtMarshal, hstmt, szPkCatalogNameMarshal, szPkCatalogName, "short", cchPkCatalogName, szPkSchemaNameMarshal, szPkSchemaName, "short", cchPkSchemaName, szPkTableNameMarshal, szPkTableName, "short", cchPkTableName, szFkCatalogNameMarshal, szFkCatalogName, "short", cchFkCatalogName, szFkSchemaNameMarshal, szFkSchemaName, "short", cchFkSchemaName, szFkTableNameMarshal, szFkTableName, "short", cchFkTableName, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlmoreresults-function
     */
    static SQLMoreResults(hstmt) {
        hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"

        result := DllCall("ODBC32.dll\SQLMoreResults", hstmtMarshal, hstmt, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hdbc 
     * @param {Pointer<Integer>} szSqlStrIn 
     * @param {Integer} cchSqlStrIn 
     * @param {Pointer<Integer>} szSqlStr 
     * @param {Integer} cchSqlStrMax 
     * @param {Pointer<Integer>} pcbSqlStr 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlnativesql-function
     */
    static SQLNativeSql(hdbc, szSqlStrIn, cchSqlStrIn, szSqlStr, cchSqlStrMax, pcbSqlStr) {
        hdbcMarshal := hdbc is VarRef ? "ptr" : "ptr"
        szSqlStrInMarshal := szSqlStrIn is VarRef ? "char*" : "ptr"
        szSqlStrMarshal := szSqlStr is VarRef ? "char*" : "ptr"
        pcbSqlStrMarshal := pcbSqlStr is VarRef ? "int*" : "ptr"

        result := DllCall("ODBC32.dll\SQLNativeSql", hdbcMarshal, hdbc, szSqlStrInMarshal, szSqlStrIn, "int", cchSqlStrIn, szSqlStrMarshal, szSqlStr, "int", cchSqlStrMax, pcbSqlStrMarshal, pcbSqlStr, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Pointer<Integer>} pcpar 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlnumparams-function
     */
    static SQLNumParams(hstmt, pcpar) {
        hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
        pcparMarshal := pcpar is VarRef ? "short*" : "ptr"

        result := DllCall("ODBC32.dll\SQLNumParams", hstmtMarshal, hstmt, pcparMarshal, pcpar, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Pointer<Integer>} szCatalogName 
     * @param {Integer} cchCatalogName 
     * @param {Pointer<Integer>} szSchemaName 
     * @param {Integer} cchSchemaName 
     * @param {Pointer<Integer>} szTableName 
     * @param {Integer} cchTableName 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlprimarykeys-function
     */
    static SQLPrimaryKeys(hstmt, szCatalogName, cchCatalogName, szSchemaName, cchSchemaName, szTableName, cchTableName) {
        hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
        szCatalogNameMarshal := szCatalogName is VarRef ? "char*" : "ptr"
        szSchemaNameMarshal := szSchemaName is VarRef ? "char*" : "ptr"
        szTableNameMarshal := szTableName is VarRef ? "char*" : "ptr"

        result := DllCall("ODBC32.dll\SQLPrimaryKeys", hstmtMarshal, hstmt, szCatalogNameMarshal, szCatalogName, "short", cchCatalogName, szSchemaNameMarshal, szSchemaName, "short", cchSchemaName, szTableNameMarshal, szTableName, "short", cchTableName, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Pointer<Integer>} szCatalogName 
     * @param {Integer} cchCatalogName 
     * @param {Pointer<Integer>} szSchemaName 
     * @param {Integer} cchSchemaName 
     * @param {Pointer<Integer>} szProcName 
     * @param {Integer} cchProcName 
     * @param {Pointer<Integer>} szColumnName 
     * @param {Integer} cchColumnName 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlprocedurecolumns-function
     */
    static SQLProcedureColumns(hstmt, szCatalogName, cchCatalogName, szSchemaName, cchSchemaName, szProcName, cchProcName, szColumnName, cchColumnName) {
        hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
        szCatalogNameMarshal := szCatalogName is VarRef ? "char*" : "ptr"
        szSchemaNameMarshal := szSchemaName is VarRef ? "char*" : "ptr"
        szProcNameMarshal := szProcName is VarRef ? "char*" : "ptr"
        szColumnNameMarshal := szColumnName is VarRef ? "char*" : "ptr"

        result := DllCall("ODBC32.dll\SQLProcedureColumns", hstmtMarshal, hstmt, szCatalogNameMarshal, szCatalogName, "short", cchCatalogName, szSchemaNameMarshal, szSchemaName, "short", cchSchemaName, szProcNameMarshal, szProcName, "short", cchProcName, szColumnNameMarshal, szColumnName, "short", cchColumnName, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Pointer<Integer>} szCatalogName 
     * @param {Integer} cchCatalogName 
     * @param {Pointer<Integer>} szSchemaName 
     * @param {Integer} cchSchemaName 
     * @param {Pointer<Integer>} szProcName 
     * @param {Integer} cchProcName 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlprocedures-function
     */
    static SQLProcedures(hstmt, szCatalogName, cchCatalogName, szSchemaName, cchSchemaName, szProcName, cchProcName) {
        hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
        szCatalogNameMarshal := szCatalogName is VarRef ? "char*" : "ptr"
        szSchemaNameMarshal := szSchemaName is VarRef ? "char*" : "ptr"
        szProcNameMarshal := szProcName is VarRef ? "char*" : "ptr"

        result := DllCall("ODBC32.dll\SQLProcedures", hstmtMarshal, hstmt, szCatalogNameMarshal, szCatalogName, "short", cchCatalogName, szSchemaNameMarshal, szSchemaName, "short", cchSchemaName, szProcNameMarshal, szProcName, "short", cchProcName, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Pointer<Integer>} szCatalogName 
     * @param {Integer} cchCatalogName 
     * @param {Pointer<Integer>} szSchemaName 
     * @param {Integer} cchSchemaName 
     * @param {Pointer<Integer>} szTableName 
     * @param {Integer} cchTableName 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqltableprivileges-function
     */
    static SQLTablePrivileges(hstmt, szCatalogName, cchCatalogName, szSchemaName, cchSchemaName, szTableName, cchTableName) {
        hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
        szCatalogNameMarshal := szCatalogName is VarRef ? "char*" : "ptr"
        szSchemaNameMarshal := szSchemaName is VarRef ? "char*" : "ptr"
        szTableNameMarshal := szTableName is VarRef ? "char*" : "ptr"

        result := DllCall("ODBC32.dll\SQLTablePrivileges", hstmtMarshal, hstmt, szCatalogNameMarshal, szCatalogName, "short", cchCatalogName, szSchemaNameMarshal, szSchemaName, "short", cchSchemaName, szTableNameMarshal, szTableName, "short", cchTableName, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} henv 
     * @param {Integer} fDirection 
     * @param {Pointer<Integer>} szDriverDesc 
     * @param {Integer} cchDriverDescMax 
     * @param {Pointer<Integer>} pcchDriverDesc 
     * @param {Pointer<Integer>} szDriverAttributes 
     * @param {Integer} cchDrvrAttrMax 
     * @param {Pointer<Integer>} pcchDrvrAttr 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqldrivers-function
     */
    static SQLDrivers(henv, fDirection, szDriverDesc, cchDriverDescMax, pcchDriverDesc, szDriverAttributes, cchDrvrAttrMax, pcchDrvrAttr) {
        henvMarshal := henv is VarRef ? "ptr" : "ptr"
        szDriverDescMarshal := szDriverDesc is VarRef ? "char*" : "ptr"
        pcchDriverDescMarshal := pcchDriverDesc is VarRef ? "short*" : "ptr"
        szDriverAttributesMarshal := szDriverAttributes is VarRef ? "char*" : "ptr"
        pcchDrvrAttrMarshal := pcchDrvrAttr is VarRef ? "short*" : "ptr"

        result := DllCall("ODBC32.dll\SQLDrivers", henvMarshal, henv, "ushort", fDirection, szDriverDescMarshal, szDriverDesc, "short", cchDriverDescMax, pcchDriverDescMarshal, pcchDriverDesc, szDriverAttributesMarshal, szDriverAttributes, "short", cchDrvrAttrMax, pcchDrvrAttrMarshal, pcchDrvrAttr, "short")
        return result
    }

    /**
     * 
     * @param {Integer} fHandleType 
     * @param {Pointer<Void>} hInput 
     * @param {Pointer<Pointer<Void>>} phOutput 
     * @returns {Integer} 
     */
    static SQLAllocHandleStd(fHandleType, hInput, phOutput) {
        hInputMarshal := hInput is VarRef ? "ptr" : "ptr"
        phOutputMarshal := phOutput is VarRef ? "ptr*" : "ptr"

        result := DllCall("ODBC32.dll\SQLAllocHandleStd", "short", fHandleType, hInputMarshal, hInput, phOutputMarshal, phOutput, "short")
        return result
    }

    /**
     * 
     * @param {Integer} dwValue 
     * @returns {BOOL} 
     */
    static ODBCSetTryWaitValue(dwValue) {
        result := DllCall("ODBC32.dll\ODBCSetTryWaitValue", "uint", dwValue, "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    static ODBCGetTryWaitValue() {
        result := DllCall("ODBC32.dll\ODBCGetTryWaitValue", "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hdbc 
     * @param {Pointer<Integer>} szDSN 
     * @param {Integer} cchDSN 
     * @param {Pointer<Integer>} szUID 
     * @param {Integer} cchUID 
     * @param {Pointer<Integer>} szAuthStr 
     * @param {Integer} cchAuthStr 
     * @returns {Integer} 
     */
    static SQLConnectW(hdbc, szDSN, cchDSN, szUID, cchUID, szAuthStr, cchAuthStr) {
        hdbcMarshal := hdbc is VarRef ? "ptr" : "ptr"
        szDSNMarshal := szDSN is VarRef ? "ushort*" : "ptr"
        szUIDMarshal := szUID is VarRef ? "ushort*" : "ptr"
        szAuthStrMarshal := szAuthStr is VarRef ? "ushort*" : "ptr"

        result := DllCall("ODBC32.dll\SQLConnectW", hdbcMarshal, hdbc, szDSNMarshal, szDSN, "short", cchDSN, szUIDMarshal, szUID, "short", cchUID, szAuthStrMarshal, szAuthStr, "short", cchAuthStr, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} henv 
     * @param {Pointer<Void>} hdbc 
     * @param {Pointer<Void>} hstmt 
     * @param {Pointer<Integer>} wszSqlState 
     * @param {Pointer<Integer>} pfNativeError 
     * @param {Pointer<Integer>} wszErrorMsg 
     * @param {Integer} cchErrorMsgMax 
     * @param {Pointer<Integer>} pcchErrorMsg 
     * @returns {Integer} 
     */
    static SQLErrorW(henv, hdbc, hstmt, wszSqlState, pfNativeError, wszErrorMsg, cchErrorMsgMax, pcchErrorMsg) {
        henvMarshal := henv is VarRef ? "ptr" : "ptr"
        hdbcMarshal := hdbc is VarRef ? "ptr" : "ptr"
        hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
        wszSqlStateMarshal := wszSqlState is VarRef ? "ushort*" : "ptr"
        pfNativeErrorMarshal := pfNativeError is VarRef ? "int*" : "ptr"
        wszErrorMsgMarshal := wszErrorMsg is VarRef ? "ushort*" : "ptr"
        pcchErrorMsgMarshal := pcchErrorMsg is VarRef ? "short*" : "ptr"

        result := DllCall("ODBC32.dll\SQLErrorW", henvMarshal, henv, hdbcMarshal, hdbc, hstmtMarshal, hstmt, wszSqlStateMarshal, wszSqlState, pfNativeErrorMarshal, pfNativeError, wszErrorMsgMarshal, wszErrorMsg, "short", cchErrorMsgMax, pcchErrorMsgMarshal, pcchErrorMsg, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Pointer<Integer>} szSqlStr 
     * @param {Integer} TextLength 
     * @returns {Integer} 
     */
    static SQLExecDirectW(hstmt, szSqlStr, TextLength) {
        hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
        szSqlStrMarshal := szSqlStr is VarRef ? "ushort*" : "ptr"

        result := DllCall("ODBC32.dll\SQLExecDirectW", hstmtMarshal, hstmt, szSqlStrMarshal, szSqlStr, "int", TextLength, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hdbc 
     * @param {Integer} fAttribute 
     * @param {Pointer<Void>} rgbValue 
     * @param {Integer} cbValueMax 
     * @param {Pointer<Integer>} pcbValue 
     * @returns {Integer} 
     */
    static SQLGetConnectAttrW(hdbc, fAttribute, rgbValue, cbValueMax, pcbValue) {
        hdbcMarshal := hdbc is VarRef ? "ptr" : "ptr"
        rgbValueMarshal := rgbValue is VarRef ? "ptr" : "ptr"
        pcbValueMarshal := pcbValue is VarRef ? "int*" : "ptr"

        result := DllCall("ODBC32.dll\SQLGetConnectAttrW", hdbcMarshal, hdbc, "int", fAttribute, rgbValueMarshal, rgbValue, "int", cbValueMax, pcbValueMarshal, pcbValue, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Pointer<Integer>} szCursor 
     * @param {Integer} cchCursorMax 
     * @param {Pointer<Integer>} pcchCursor 
     * @returns {Integer} 
     */
    static SQLGetCursorNameW(hstmt, szCursor, cchCursorMax, pcchCursor) {
        hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
        szCursorMarshal := szCursor is VarRef ? "ushort*" : "ptr"
        pcchCursorMarshal := pcchCursor is VarRef ? "short*" : "ptr"

        result := DllCall("ODBC32.dll\SQLGetCursorNameW", hstmtMarshal, hstmt, szCursorMarshal, szCursor, "short", cchCursorMax, pcchCursorMarshal, pcchCursor, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} DescriptorHandle 
     * @param {Integer} RecNumber 
     * @param {Integer} FieldIdentifier 
     * @param {Pointer<Void>} Value 
     * @param {Integer} BufferLength 
     * @returns {Integer} 
     */
    static SQLSetDescFieldW(DescriptorHandle, RecNumber, FieldIdentifier, Value, BufferLength) {
        DescriptorHandleMarshal := DescriptorHandle is VarRef ? "ptr" : "ptr"
        ValueMarshal := Value is VarRef ? "ptr" : "ptr"

        result := DllCall("ODBC32.dll\SQLSetDescFieldW", DescriptorHandleMarshal, DescriptorHandle, "short", RecNumber, "short", FieldIdentifier, ValueMarshal, Value, "int", BufferLength, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hdesc 
     * @param {Integer} iRecord 
     * @param {Integer} iField 
     * @param {Pointer<Void>} rgbValue 
     * @param {Integer} cbBufferLength 
     * @param {Pointer<Integer>} StringLength 
     * @returns {Integer} 
     */
    static SQLGetDescFieldW(hdesc, iRecord, iField, rgbValue, cbBufferLength, StringLength) {
        hdescMarshal := hdesc is VarRef ? "ptr" : "ptr"
        rgbValueMarshal := rgbValue is VarRef ? "ptr" : "ptr"
        StringLengthMarshal := StringLength is VarRef ? "int*" : "ptr"

        result := DllCall("ODBC32.dll\SQLGetDescFieldW", hdescMarshal, hdesc, "short", iRecord, "short", iField, rgbValueMarshal, rgbValue, "int", cbBufferLength, StringLengthMarshal, StringLength, "short")
        return result
    }

    /**
     * 
     * @param {Integer} fHandleType 
     * @param {Pointer<Void>} handle 
     * @param {Integer} iRecord 
     * @param {Integer} fDiagField 
     * @param {Pointer<Void>} rgbDiagInfo 
     * @param {Integer} cbBufferLength 
     * @param {Pointer<Integer>} pcbStringLength 
     * @returns {Integer} 
     */
    static SQLGetDiagFieldW(fHandleType, handle, iRecord, fDiagField, rgbDiagInfo, cbBufferLength, pcbStringLength) {
        handleMarshal := handle is VarRef ? "ptr" : "ptr"
        rgbDiagInfoMarshal := rgbDiagInfo is VarRef ? "ptr" : "ptr"
        pcbStringLengthMarshal := pcbStringLength is VarRef ? "short*" : "ptr"

        result := DllCall("ODBC32.dll\SQLGetDiagFieldW", "short", fHandleType, handleMarshal, handle, "short", iRecord, "short", fDiagField, rgbDiagInfoMarshal, rgbDiagInfo, "short", cbBufferLength, pcbStringLengthMarshal, pcbStringLength, "short")
        return result
    }

    /**
     * 
     * @param {Integer} fHandleType 
     * @param {Pointer<Void>} handle 
     * @param {Integer} iRecord 
     * @param {Pointer<Integer>} szSqlState 
     * @param {Pointer<Integer>} pfNativeError 
     * @param {Pointer<Integer>} szErrorMsg 
     * @param {Integer} cchErrorMsgMax 
     * @param {Pointer<Integer>} pcchErrorMsg 
     * @returns {Integer} 
     */
    static SQLGetDiagRecW(fHandleType, handle, iRecord, szSqlState, pfNativeError, szErrorMsg, cchErrorMsgMax, pcchErrorMsg) {
        handleMarshal := handle is VarRef ? "ptr" : "ptr"
        szSqlStateMarshal := szSqlState is VarRef ? "ushort*" : "ptr"
        pfNativeErrorMarshal := pfNativeError is VarRef ? "int*" : "ptr"
        szErrorMsgMarshal := szErrorMsg is VarRef ? "ushort*" : "ptr"
        pcchErrorMsgMarshal := pcchErrorMsg is VarRef ? "short*" : "ptr"

        result := DllCall("ODBC32.dll\SQLGetDiagRecW", "short", fHandleType, handleMarshal, handle, "short", iRecord, szSqlStateMarshal, szSqlState, pfNativeErrorMarshal, pfNativeError, szErrorMsgMarshal, szErrorMsg, "short", cchErrorMsgMax, pcchErrorMsgMarshal, pcchErrorMsg, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Pointer<Integer>} szSqlStr 
     * @param {Integer} cchSqlStr 
     * @returns {Integer} 
     */
    static SQLPrepareW(hstmt, szSqlStr, cchSqlStr) {
        hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
        szSqlStrMarshal := szSqlStr is VarRef ? "ushort*" : "ptr"

        result := DllCall("ODBC32.dll\SQLPrepareW", hstmtMarshal, hstmt, szSqlStrMarshal, szSqlStr, "int", cchSqlStr, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hdbc 
     * @param {Integer} fAttribute 
     * @param {Pointer} rgbValue 
     * @param {Integer} cbValue 
     * @returns {Integer} 
     */
    static SQLSetConnectAttrW(hdbc, fAttribute, rgbValue, cbValue) {
        hdbcMarshal := hdbc is VarRef ? "ptr" : "ptr"

        result := DllCall("ODBC32.dll\SQLSetConnectAttrW", hdbcMarshal, hdbc, "int", fAttribute, "ptr", rgbValue, "int", cbValue, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Pointer<Integer>} szCursor 
     * @param {Integer} cchCursor 
     * @returns {Integer} 
     */
    static SQLSetCursorNameW(hstmt, szCursor, cchCursor) {
        hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
        szCursorMarshal := szCursor is VarRef ? "ushort*" : "ptr"

        result := DllCall("ODBC32.dll\SQLSetCursorNameW", hstmtMarshal, hstmt, szCursorMarshal, szCursor, "short", cchCursor, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Pointer<Integer>} szCatalogName 
     * @param {Integer} cchCatalogName 
     * @param {Pointer<Integer>} szSchemaName 
     * @param {Integer} cchSchemaName 
     * @param {Pointer<Integer>} szTableName 
     * @param {Integer} cchTableName 
     * @param {Pointer<Integer>} szColumnName 
     * @param {Integer} cchColumnName 
     * @returns {Integer} 
     */
    static SQLColumnsW(hstmt, szCatalogName, cchCatalogName, szSchemaName, cchSchemaName, szTableName, cchTableName, szColumnName, cchColumnName) {
        hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
        szCatalogNameMarshal := szCatalogName is VarRef ? "ushort*" : "ptr"
        szSchemaNameMarshal := szSchemaName is VarRef ? "ushort*" : "ptr"
        szTableNameMarshal := szTableName is VarRef ? "ushort*" : "ptr"
        szColumnNameMarshal := szColumnName is VarRef ? "ushort*" : "ptr"

        result := DllCall("ODBC32.dll\SQLColumnsW", hstmtMarshal, hstmt, szCatalogNameMarshal, szCatalogName, "short", cchCatalogName, szSchemaNameMarshal, szSchemaName, "short", cchSchemaName, szTableNameMarshal, szTableName, "short", cchTableName, szColumnNameMarshal, szColumnName, "short", cchColumnName, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hdbc 
     * @param {Integer} fOption 
     * @param {Pointer<Void>} pvParam 
     * @returns {Integer} 
     */
    static SQLGetConnectOptionW(hdbc, fOption, pvParam) {
        hdbcMarshal := hdbc is VarRef ? "ptr" : "ptr"
        pvParamMarshal := pvParam is VarRef ? "ptr" : "ptr"

        result := DllCall("ODBC32.dll\SQLGetConnectOptionW", hdbcMarshal, hdbc, "ushort", fOption, pvParamMarshal, pvParam, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hdbc 
     * @param {Integer} fInfoType 
     * @param {Pointer} rgbInfoValue 
     * @param {Integer} cbInfoValueMax 
     * @param {Pointer<Integer>} pcbInfoValue 
     * @returns {Integer} 
     */
    static SQLGetInfoW(hdbc, fInfoType, rgbInfoValue, cbInfoValueMax, pcbInfoValue) {
        hdbcMarshal := hdbc is VarRef ? "ptr" : "ptr"
        pcbInfoValueMarshal := pcbInfoValue is VarRef ? "short*" : "ptr"

        result := DllCall("ODBC32.dll\SQLGetInfoW", hdbcMarshal, hdbc, "ushort", fInfoType, "ptr", rgbInfoValue, "short", cbInfoValueMax, pcbInfoValueMarshal, pcbInfoValue, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} StatementHandle 
     * @param {Integer} DataType 
     * @returns {Integer} 
     */
    static SQLGetTypeInfoW(StatementHandle, DataType) {
        StatementHandleMarshal := StatementHandle is VarRef ? "ptr" : "ptr"

        result := DllCall("ODBC32.dll\SQLGetTypeInfoW", StatementHandleMarshal, StatementHandle, "short", DataType, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Integer} fColType 
     * @param {Pointer<Integer>} szCatalogName 
     * @param {Integer} cchCatalogName 
     * @param {Pointer<Integer>} szSchemaName 
     * @param {Integer} cchSchemaName 
     * @param {Pointer<Integer>} szTableName 
     * @param {Integer} cchTableName 
     * @param {Integer} fScope 
     * @param {Integer} fNullable 
     * @returns {Integer} 
     */
    static SQLSpecialColumnsW(hstmt, fColType, szCatalogName, cchCatalogName, szSchemaName, cchSchemaName, szTableName, cchTableName, fScope, fNullable) {
        hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
        szCatalogNameMarshal := szCatalogName is VarRef ? "ushort*" : "ptr"
        szSchemaNameMarshal := szSchemaName is VarRef ? "ushort*" : "ptr"
        szTableNameMarshal := szTableName is VarRef ? "ushort*" : "ptr"

        result := DllCall("ODBC32.dll\SQLSpecialColumnsW", hstmtMarshal, hstmt, "ushort", fColType, szCatalogNameMarshal, szCatalogName, "short", cchCatalogName, szSchemaNameMarshal, szSchemaName, "short", cchSchemaName, szTableNameMarshal, szTableName, "short", cchTableName, "ushort", fScope, "ushort", fNullable, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Pointer<Integer>} szCatalogName 
     * @param {Integer} cchCatalogName 
     * @param {Pointer<Integer>} szSchemaName 
     * @param {Integer} cchSchemaName 
     * @param {Pointer<Integer>} szTableName 
     * @param {Integer} cchTableName 
     * @param {Integer} fUnique 
     * @param {Integer} fAccuracy 
     * @returns {Integer} 
     */
    static SQLStatisticsW(hstmt, szCatalogName, cchCatalogName, szSchemaName, cchSchemaName, szTableName, cchTableName, fUnique, fAccuracy) {
        hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
        szCatalogNameMarshal := szCatalogName is VarRef ? "ushort*" : "ptr"
        szSchemaNameMarshal := szSchemaName is VarRef ? "ushort*" : "ptr"
        szTableNameMarshal := szTableName is VarRef ? "ushort*" : "ptr"

        result := DllCall("ODBC32.dll\SQLStatisticsW", hstmtMarshal, hstmt, szCatalogNameMarshal, szCatalogName, "short", cchCatalogName, szSchemaNameMarshal, szSchemaName, "short", cchSchemaName, szTableNameMarshal, szTableName, "short", cchTableName, "ushort", fUnique, "ushort", fAccuracy, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Pointer<Integer>} szCatalogName 
     * @param {Integer} cchCatalogName 
     * @param {Pointer<Integer>} szSchemaName 
     * @param {Integer} cchSchemaName 
     * @param {Pointer<Integer>} szTableName 
     * @param {Integer} cchTableName 
     * @param {Pointer<Integer>} szTableType 
     * @param {Integer} cchTableType 
     * @returns {Integer} 
     */
    static SQLTablesW(hstmt, szCatalogName, cchCatalogName, szSchemaName, cchSchemaName, szTableName, cchTableName, szTableType, cchTableType) {
        hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
        szCatalogNameMarshal := szCatalogName is VarRef ? "ushort*" : "ptr"
        szSchemaNameMarshal := szSchemaName is VarRef ? "ushort*" : "ptr"
        szTableNameMarshal := szTableName is VarRef ? "ushort*" : "ptr"
        szTableTypeMarshal := szTableType is VarRef ? "ushort*" : "ptr"

        result := DllCall("ODBC32.dll\SQLTablesW", hstmtMarshal, hstmt, szCatalogNameMarshal, szCatalogName, "short", cchCatalogName, szSchemaNameMarshal, szSchemaName, "short", cchSchemaName, szTableNameMarshal, szTableName, "short", cchTableName, szTableTypeMarshal, szTableType, "short", cchTableType, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} henv 
     * @param {Integer} fDirection 
     * @param {Pointer<Integer>} szDSN 
     * @param {Integer} cchDSNMax 
     * @param {Pointer<Integer>} pcchDSN 
     * @param {Pointer<Integer>} wszDescription 
     * @param {Integer} cchDescriptionMax 
     * @param {Pointer<Integer>} pcchDescription 
     * @returns {Integer} 
     */
    static SQLDataSourcesW(henv, fDirection, szDSN, cchDSNMax, pcchDSN, wszDescription, cchDescriptionMax, pcchDescription) {
        henvMarshal := henv is VarRef ? "ptr" : "ptr"
        szDSNMarshal := szDSN is VarRef ? "ushort*" : "ptr"
        pcchDSNMarshal := pcchDSN is VarRef ? "short*" : "ptr"
        wszDescriptionMarshal := wszDescription is VarRef ? "ushort*" : "ptr"
        pcchDescriptionMarshal := pcchDescription is VarRef ? "short*" : "ptr"

        result := DllCall("ODBC32.dll\SQLDataSourcesW", henvMarshal, henv, "ushort", fDirection, szDSNMarshal, szDSN, "short", cchDSNMax, pcchDSNMarshal, pcchDSN, wszDescriptionMarshal, wszDescription, "short", cchDescriptionMax, pcchDescriptionMarshal, pcchDescription, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hdbc 
     * @param {Pointer} hwnd 
     * @param {Pointer<Integer>} szConnStrIn 
     * @param {Integer} cchConnStrIn 
     * @param {Pointer<Integer>} szConnStrOut 
     * @param {Integer} cchConnStrOutMax 
     * @param {Pointer<Integer>} pcchConnStrOut 
     * @param {Integer} fDriverCompletion 
     * @returns {Integer} 
     */
    static SQLDriverConnectW(hdbc, hwnd, szConnStrIn, cchConnStrIn, szConnStrOut, cchConnStrOutMax, pcchConnStrOut, fDriverCompletion) {
        hdbcMarshal := hdbc is VarRef ? "ptr" : "ptr"
        szConnStrInMarshal := szConnStrIn is VarRef ? "ushort*" : "ptr"
        szConnStrOutMarshal := szConnStrOut is VarRef ? "ushort*" : "ptr"
        pcchConnStrOutMarshal := pcchConnStrOut is VarRef ? "short*" : "ptr"

        result := DllCall("ODBC32.dll\SQLDriverConnectW", hdbcMarshal, hdbc, "ptr", hwnd, szConnStrInMarshal, szConnStrIn, "short", cchConnStrIn, szConnStrOutMarshal, szConnStrOut, "short", cchConnStrOutMax, pcchConnStrOutMarshal, pcchConnStrOut, "ushort", fDriverCompletion, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hdbc 
     * @param {Pointer<Integer>} szConnStrIn 
     * @param {Integer} cchConnStrIn 
     * @param {Pointer<Integer>} szConnStrOut 
     * @param {Integer} cchConnStrOutMax 
     * @param {Pointer<Integer>} pcchConnStrOut 
     * @returns {Integer} 
     */
    static SQLBrowseConnectW(hdbc, szConnStrIn, cchConnStrIn, szConnStrOut, cchConnStrOutMax, pcchConnStrOut) {
        hdbcMarshal := hdbc is VarRef ? "ptr" : "ptr"
        szConnStrInMarshal := szConnStrIn is VarRef ? "ushort*" : "ptr"
        szConnStrOutMarshal := szConnStrOut is VarRef ? "ushort*" : "ptr"
        pcchConnStrOutMarshal := pcchConnStrOut is VarRef ? "short*" : "ptr"

        result := DllCall("ODBC32.dll\SQLBrowseConnectW", hdbcMarshal, hdbc, szConnStrInMarshal, szConnStrIn, "short", cchConnStrIn, szConnStrOutMarshal, szConnStrOut, "short", cchConnStrOutMax, pcchConnStrOutMarshal, pcchConnStrOut, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Pointer<Integer>} szCatalogName 
     * @param {Integer} cchCatalogName 
     * @param {Pointer<Integer>} szSchemaName 
     * @param {Integer} cchSchemaName 
     * @param {Pointer<Integer>} szTableName 
     * @param {Integer} cchTableName 
     * @param {Pointer<Integer>} szColumnName 
     * @param {Integer} cchColumnName 
     * @returns {Integer} 
     */
    static SQLColumnPrivilegesW(hstmt, szCatalogName, cchCatalogName, szSchemaName, cchSchemaName, szTableName, cchTableName, szColumnName, cchColumnName) {
        hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
        szCatalogNameMarshal := szCatalogName is VarRef ? "ushort*" : "ptr"
        szSchemaNameMarshal := szSchemaName is VarRef ? "ushort*" : "ptr"
        szTableNameMarshal := szTableName is VarRef ? "ushort*" : "ptr"
        szColumnNameMarshal := szColumnName is VarRef ? "ushort*" : "ptr"

        result := DllCall("ODBC32.dll\SQLColumnPrivilegesW", hstmtMarshal, hstmt, szCatalogNameMarshal, szCatalogName, "short", cchCatalogName, szSchemaNameMarshal, szSchemaName, "short", cchSchemaName, szTableNameMarshal, szTableName, "short", cchTableName, szColumnNameMarshal, szColumnName, "short", cchColumnName, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Integer} fAttribute 
     * @param {Pointer<Void>} rgbValue 
     * @param {Integer} cbValueMax 
     * @param {Pointer<Integer>} pcbValue 
     * @returns {Integer} 
     */
    static SQLGetStmtAttrW(hstmt, fAttribute, rgbValue, cbValueMax, pcbValue) {
        hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
        rgbValueMarshal := rgbValue is VarRef ? "ptr" : "ptr"
        pcbValueMarshal := pcbValue is VarRef ? "int*" : "ptr"

        result := DllCall("ODBC32.dll\SQLGetStmtAttrW", hstmtMarshal, hstmt, "int", fAttribute, rgbValueMarshal, rgbValue, "int", cbValueMax, pcbValueMarshal, pcbValue, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Integer} fAttribute 
     * @param {Pointer<Void>} rgbValue 
     * @param {Integer} cbValueMax 
     * @returns {Integer} 
     */
    static SQLSetStmtAttrW(hstmt, fAttribute, rgbValue, cbValueMax) {
        hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
        rgbValueMarshal := rgbValue is VarRef ? "ptr" : "ptr"

        result := DllCall("ODBC32.dll\SQLSetStmtAttrW", hstmtMarshal, hstmt, "int", fAttribute, rgbValueMarshal, rgbValue, "int", cbValueMax, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Pointer<Integer>} szPkCatalogName 
     * @param {Integer} cchPkCatalogName 
     * @param {Pointer<Integer>} szPkSchemaName 
     * @param {Integer} cchPkSchemaName 
     * @param {Pointer<Integer>} szPkTableName 
     * @param {Integer} cchPkTableName 
     * @param {Pointer<Integer>} szFkCatalogName 
     * @param {Integer} cchFkCatalogName 
     * @param {Pointer<Integer>} szFkSchemaName 
     * @param {Integer} cchFkSchemaName 
     * @param {Pointer<Integer>} szFkTableName 
     * @param {Integer} cchFkTableName 
     * @returns {Integer} 
     */
    static SQLForeignKeysW(hstmt, szPkCatalogName, cchPkCatalogName, szPkSchemaName, cchPkSchemaName, szPkTableName, cchPkTableName, szFkCatalogName, cchFkCatalogName, szFkSchemaName, cchFkSchemaName, szFkTableName, cchFkTableName) {
        hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
        szPkCatalogNameMarshal := szPkCatalogName is VarRef ? "ushort*" : "ptr"
        szPkSchemaNameMarshal := szPkSchemaName is VarRef ? "ushort*" : "ptr"
        szPkTableNameMarshal := szPkTableName is VarRef ? "ushort*" : "ptr"
        szFkCatalogNameMarshal := szFkCatalogName is VarRef ? "ushort*" : "ptr"
        szFkSchemaNameMarshal := szFkSchemaName is VarRef ? "ushort*" : "ptr"
        szFkTableNameMarshal := szFkTableName is VarRef ? "ushort*" : "ptr"

        result := DllCall("ODBC32.dll\SQLForeignKeysW", hstmtMarshal, hstmt, szPkCatalogNameMarshal, szPkCatalogName, "short", cchPkCatalogName, szPkSchemaNameMarshal, szPkSchemaName, "short", cchPkSchemaName, szPkTableNameMarshal, szPkTableName, "short", cchPkTableName, szFkCatalogNameMarshal, szFkCatalogName, "short", cchFkCatalogName, szFkSchemaNameMarshal, szFkSchemaName, "short", cchFkSchemaName, szFkTableNameMarshal, szFkTableName, "short", cchFkTableName, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hdbc 
     * @param {Pointer<Integer>} szSqlStrIn 
     * @param {Integer} cchSqlStrIn 
     * @param {Pointer<Integer>} szSqlStr 
     * @param {Integer} cchSqlStrMax 
     * @param {Pointer<Integer>} pcchSqlStr 
     * @returns {Integer} 
     */
    static SQLNativeSqlW(hdbc, szSqlStrIn, cchSqlStrIn, szSqlStr, cchSqlStrMax, pcchSqlStr) {
        hdbcMarshal := hdbc is VarRef ? "ptr" : "ptr"
        szSqlStrInMarshal := szSqlStrIn is VarRef ? "ushort*" : "ptr"
        szSqlStrMarshal := szSqlStr is VarRef ? "ushort*" : "ptr"
        pcchSqlStrMarshal := pcchSqlStr is VarRef ? "int*" : "ptr"

        result := DllCall("ODBC32.dll\SQLNativeSqlW", hdbcMarshal, hdbc, szSqlStrInMarshal, szSqlStrIn, "int", cchSqlStrIn, szSqlStrMarshal, szSqlStr, "int", cchSqlStrMax, pcchSqlStrMarshal, pcchSqlStr, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Pointer<Integer>} szCatalogName 
     * @param {Integer} cchCatalogName 
     * @param {Pointer<Integer>} szSchemaName 
     * @param {Integer} cchSchemaName 
     * @param {Pointer<Integer>} szTableName 
     * @param {Integer} cchTableName 
     * @returns {Integer} 
     */
    static SQLPrimaryKeysW(hstmt, szCatalogName, cchCatalogName, szSchemaName, cchSchemaName, szTableName, cchTableName) {
        hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
        szCatalogNameMarshal := szCatalogName is VarRef ? "ushort*" : "ptr"
        szSchemaNameMarshal := szSchemaName is VarRef ? "ushort*" : "ptr"
        szTableNameMarshal := szTableName is VarRef ? "ushort*" : "ptr"

        result := DllCall("ODBC32.dll\SQLPrimaryKeysW", hstmtMarshal, hstmt, szCatalogNameMarshal, szCatalogName, "short", cchCatalogName, szSchemaNameMarshal, szSchemaName, "short", cchSchemaName, szTableNameMarshal, szTableName, "short", cchTableName, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Pointer<Integer>} szCatalogName 
     * @param {Integer} cchCatalogName 
     * @param {Pointer<Integer>} szSchemaName 
     * @param {Integer} cchSchemaName 
     * @param {Pointer<Integer>} szProcName 
     * @param {Integer} cchProcName 
     * @param {Pointer<Integer>} szColumnName 
     * @param {Integer} cchColumnName 
     * @returns {Integer} 
     */
    static SQLProcedureColumnsW(hstmt, szCatalogName, cchCatalogName, szSchemaName, cchSchemaName, szProcName, cchProcName, szColumnName, cchColumnName) {
        hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
        szCatalogNameMarshal := szCatalogName is VarRef ? "ushort*" : "ptr"
        szSchemaNameMarshal := szSchemaName is VarRef ? "ushort*" : "ptr"
        szProcNameMarshal := szProcName is VarRef ? "ushort*" : "ptr"
        szColumnNameMarshal := szColumnName is VarRef ? "ushort*" : "ptr"

        result := DllCall("ODBC32.dll\SQLProcedureColumnsW", hstmtMarshal, hstmt, szCatalogNameMarshal, szCatalogName, "short", cchCatalogName, szSchemaNameMarshal, szSchemaName, "short", cchSchemaName, szProcNameMarshal, szProcName, "short", cchProcName, szColumnNameMarshal, szColumnName, "short", cchColumnName, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Pointer<Integer>} szCatalogName 
     * @param {Integer} cchCatalogName 
     * @param {Pointer<Integer>} szSchemaName 
     * @param {Integer} cchSchemaName 
     * @param {Pointer<Integer>} szProcName 
     * @param {Integer} cchProcName 
     * @returns {Integer} 
     */
    static SQLProceduresW(hstmt, szCatalogName, cchCatalogName, szSchemaName, cchSchemaName, szProcName, cchProcName) {
        hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
        szCatalogNameMarshal := szCatalogName is VarRef ? "ushort*" : "ptr"
        szSchemaNameMarshal := szSchemaName is VarRef ? "ushort*" : "ptr"
        szProcNameMarshal := szProcName is VarRef ? "ushort*" : "ptr"

        result := DllCall("ODBC32.dll\SQLProceduresW", hstmtMarshal, hstmt, szCatalogNameMarshal, szCatalogName, "short", cchCatalogName, szSchemaNameMarshal, szSchemaName, "short", cchSchemaName, szProcNameMarshal, szProcName, "short", cchProcName, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Pointer<Integer>} szCatalogName 
     * @param {Integer} cchCatalogName 
     * @param {Pointer<Integer>} szSchemaName 
     * @param {Integer} cchSchemaName 
     * @param {Pointer<Integer>} szTableName 
     * @param {Integer} cchTableName 
     * @returns {Integer} 
     */
    static SQLTablePrivilegesW(hstmt, szCatalogName, cchCatalogName, szSchemaName, cchSchemaName, szTableName, cchTableName) {
        hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
        szCatalogNameMarshal := szCatalogName is VarRef ? "ushort*" : "ptr"
        szSchemaNameMarshal := szSchemaName is VarRef ? "ushort*" : "ptr"
        szTableNameMarshal := szTableName is VarRef ? "ushort*" : "ptr"

        result := DllCall("ODBC32.dll\SQLTablePrivilegesW", hstmtMarshal, hstmt, szCatalogNameMarshal, szCatalogName, "short", cchCatalogName, szSchemaNameMarshal, szSchemaName, "short", cchSchemaName, szTableNameMarshal, szTableName, "short", cchTableName, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} henv 
     * @param {Integer} fDirection 
     * @param {Pointer<Integer>} szDriverDesc 
     * @param {Integer} cchDriverDescMax 
     * @param {Pointer<Integer>} pcchDriverDesc 
     * @param {Pointer<Integer>} szDriverAttributes 
     * @param {Integer} cchDrvrAttrMax 
     * @param {Pointer<Integer>} pcchDrvrAttr 
     * @returns {Integer} 
     */
    static SQLDriversW(henv, fDirection, szDriverDesc, cchDriverDescMax, pcchDriverDesc, szDriverAttributes, cchDrvrAttrMax, pcchDrvrAttr) {
        henvMarshal := henv is VarRef ? "ptr" : "ptr"
        szDriverDescMarshal := szDriverDesc is VarRef ? "ushort*" : "ptr"
        pcchDriverDescMarshal := pcchDriverDesc is VarRef ? "short*" : "ptr"
        szDriverAttributesMarshal := szDriverAttributes is VarRef ? "ushort*" : "ptr"
        pcchDrvrAttrMarshal := pcchDrvrAttr is VarRef ? "short*" : "ptr"

        result := DllCall("ODBC32.dll\SQLDriversW", henvMarshal, henv, "ushort", fDirection, szDriverDescMarshal, szDriverDesc, "short", cchDriverDescMax, pcchDriverDescMarshal, pcchDriverDesc, szDriverAttributesMarshal, szDriverAttributes, "short", cchDrvrAttrMax, pcchDrvrAttrMarshal, pcchDrvrAttr, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hdbc 
     * @param {Pointer<Integer>} szDSN 
     * @param {Integer} cbDSN 
     * @param {Pointer<Integer>} szUID 
     * @param {Integer} cbUID 
     * @param {Pointer<Integer>} szAuthStr 
     * @param {Integer} cbAuthStr 
     * @returns {Integer} 
     */
    static SQLConnectA(hdbc, szDSN, cbDSN, szUID, cbUID, szAuthStr, cbAuthStr) {
        hdbcMarshal := hdbc is VarRef ? "ptr" : "ptr"
        szDSNMarshal := szDSN is VarRef ? "char*" : "ptr"
        szUIDMarshal := szUID is VarRef ? "char*" : "ptr"
        szAuthStrMarshal := szAuthStr is VarRef ? "char*" : "ptr"

        result := DllCall("ODBC32.dll\SQLConnectA", hdbcMarshal, hdbc, szDSNMarshal, szDSN, "short", cbDSN, szUIDMarshal, szUID, "short", cbUID, szAuthStrMarshal, szAuthStr, "short", cbAuthStr, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} henv 
     * @param {Pointer<Void>} hdbc 
     * @param {Pointer<Void>} hstmt 
     * @param {Pointer<Integer>} szSqlState 
     * @param {Pointer<Integer>} pfNativeError 
     * @param {Pointer<Integer>} szErrorMsg 
     * @param {Integer} cbErrorMsgMax 
     * @param {Pointer<Integer>} pcbErrorMsg 
     * @returns {Integer} 
     */
    static SQLErrorA(henv, hdbc, hstmt, szSqlState, pfNativeError, szErrorMsg, cbErrorMsgMax, pcbErrorMsg) {
        henvMarshal := henv is VarRef ? "ptr" : "ptr"
        hdbcMarshal := hdbc is VarRef ? "ptr" : "ptr"
        hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
        szSqlStateMarshal := szSqlState is VarRef ? "char*" : "ptr"
        pfNativeErrorMarshal := pfNativeError is VarRef ? "int*" : "ptr"
        szErrorMsgMarshal := szErrorMsg is VarRef ? "char*" : "ptr"
        pcbErrorMsgMarshal := pcbErrorMsg is VarRef ? "short*" : "ptr"

        result := DllCall("ODBC32.dll\SQLErrorA", henvMarshal, henv, hdbcMarshal, hdbc, hstmtMarshal, hstmt, szSqlStateMarshal, szSqlState, pfNativeErrorMarshal, pfNativeError, szErrorMsgMarshal, szErrorMsg, "short", cbErrorMsgMax, pcbErrorMsgMarshal, pcbErrorMsg, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Pointer<Integer>} szSqlStr 
     * @param {Integer} cbSqlStr 
     * @returns {Integer} 
     */
    static SQLExecDirectA(hstmt, szSqlStr, cbSqlStr) {
        hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
        szSqlStrMarshal := szSqlStr is VarRef ? "char*" : "ptr"

        result := DllCall("ODBC32.dll\SQLExecDirectA", hstmtMarshal, hstmt, szSqlStrMarshal, szSqlStr, "int", cbSqlStr, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hdbc 
     * @param {Integer} fAttribute 
     * @param {Pointer<Void>} rgbValue 
     * @param {Integer} cbValueMax 
     * @param {Pointer<Integer>} pcbValue 
     * @returns {Integer} 
     */
    static SQLGetConnectAttrA(hdbc, fAttribute, rgbValue, cbValueMax, pcbValue) {
        hdbcMarshal := hdbc is VarRef ? "ptr" : "ptr"
        rgbValueMarshal := rgbValue is VarRef ? "ptr" : "ptr"
        pcbValueMarshal := pcbValue is VarRef ? "int*" : "ptr"

        result := DllCall("ODBC32.dll\SQLGetConnectAttrA", hdbcMarshal, hdbc, "int", fAttribute, rgbValueMarshal, rgbValue, "int", cbValueMax, pcbValueMarshal, pcbValue, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Pointer<Integer>} szCursor 
     * @param {Integer} cbCursorMax 
     * @param {Pointer<Integer>} pcbCursor 
     * @returns {Integer} 
     */
    static SQLGetCursorNameA(hstmt, szCursor, cbCursorMax, pcbCursor) {
        hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
        szCursorMarshal := szCursor is VarRef ? "char*" : "ptr"
        pcbCursorMarshal := pcbCursor is VarRef ? "short*" : "ptr"

        result := DllCall("ODBC32.dll\SQLGetCursorNameA", hstmtMarshal, hstmt, szCursorMarshal, szCursor, "short", cbCursorMax, pcbCursorMarshal, pcbCursor, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hdesc 
     * @param {Integer} iRecord 
     * @param {Integer} iField 
     * @param {Pointer<Void>} rgbValue 
     * @param {Integer} cbBufferLength 
     * @param {Pointer<Integer>} StringLength 
     * @returns {Integer} 
     */
    static SQLGetDescFieldA(hdesc, iRecord, iField, rgbValue, cbBufferLength, StringLength) {
        hdescMarshal := hdesc is VarRef ? "ptr" : "ptr"
        rgbValueMarshal := rgbValue is VarRef ? "ptr" : "ptr"
        StringLengthMarshal := StringLength is VarRef ? "int*" : "ptr"

        result := DllCall("ODBC32.dll\SQLGetDescFieldA", hdescMarshal, hdesc, "short", iRecord, "short", iField, rgbValueMarshal, rgbValue, "int", cbBufferLength, StringLengthMarshal, StringLength, "short")
        return result
    }

    /**
     * 
     * @param {Integer} fHandleType 
     * @param {Pointer<Void>} handle 
     * @param {Integer} iRecord 
     * @param {Integer} fDiagField 
     * @param {Pointer<Void>} rgbDiagInfo 
     * @param {Integer} cbDiagInfoMax 
     * @param {Pointer<Integer>} pcbDiagInfo 
     * @returns {Integer} 
     */
    static SQLGetDiagFieldA(fHandleType, handle, iRecord, fDiagField, rgbDiagInfo, cbDiagInfoMax, pcbDiagInfo) {
        handleMarshal := handle is VarRef ? "ptr" : "ptr"
        rgbDiagInfoMarshal := rgbDiagInfo is VarRef ? "ptr" : "ptr"
        pcbDiagInfoMarshal := pcbDiagInfo is VarRef ? "short*" : "ptr"

        result := DllCall("ODBC32.dll\SQLGetDiagFieldA", "short", fHandleType, handleMarshal, handle, "short", iRecord, "short", fDiagField, rgbDiagInfoMarshal, rgbDiagInfo, "short", cbDiagInfoMax, pcbDiagInfoMarshal, pcbDiagInfo, "short")
        return result
    }

    /**
     * 
     * @param {Integer} fHandleType 
     * @param {Pointer<Void>} handle 
     * @param {Integer} iRecord 
     * @param {Pointer<Integer>} szSqlState 
     * @param {Pointer<Integer>} pfNativeError 
     * @param {Pointer<Integer>} szErrorMsg 
     * @param {Integer} cbErrorMsgMax 
     * @param {Pointer<Integer>} pcbErrorMsg 
     * @returns {Integer} 
     */
    static SQLGetDiagRecA(fHandleType, handle, iRecord, szSqlState, pfNativeError, szErrorMsg, cbErrorMsgMax, pcbErrorMsg) {
        handleMarshal := handle is VarRef ? "ptr" : "ptr"
        szSqlStateMarshal := szSqlState is VarRef ? "char*" : "ptr"
        pfNativeErrorMarshal := pfNativeError is VarRef ? "int*" : "ptr"
        szErrorMsgMarshal := szErrorMsg is VarRef ? "char*" : "ptr"
        pcbErrorMsgMarshal := pcbErrorMsg is VarRef ? "short*" : "ptr"

        result := DllCall("ODBC32.dll\SQLGetDiagRecA", "short", fHandleType, handleMarshal, handle, "short", iRecord, szSqlStateMarshal, szSqlState, pfNativeErrorMarshal, pfNativeError, szErrorMsgMarshal, szErrorMsg, "short", cbErrorMsgMax, pcbErrorMsgMarshal, pcbErrorMsg, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Integer} fAttribute 
     * @param {Pointer<Void>} rgbValue 
     * @param {Integer} cbValueMax 
     * @param {Pointer<Integer>} pcbValue 
     * @returns {Integer} 
     */
    static SQLGetStmtAttrA(hstmt, fAttribute, rgbValue, cbValueMax, pcbValue) {
        hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
        rgbValueMarshal := rgbValue is VarRef ? "ptr" : "ptr"
        pcbValueMarshal := pcbValue is VarRef ? "int*" : "ptr"

        result := DllCall("ODBC32.dll\SQLGetStmtAttrA", hstmtMarshal, hstmt, "int", fAttribute, rgbValueMarshal, rgbValue, "int", cbValueMax, pcbValueMarshal, pcbValue, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} StatementHandle 
     * @param {Integer} DataType 
     * @returns {Integer} 
     */
    static SQLGetTypeInfoA(StatementHandle, DataType) {
        StatementHandleMarshal := StatementHandle is VarRef ? "ptr" : "ptr"

        result := DllCall("ODBC32.dll\SQLGetTypeInfoA", StatementHandleMarshal, StatementHandle, "short", DataType, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Pointer<Integer>} szSqlStr 
     * @param {Integer} cbSqlStr 
     * @returns {Integer} 
     */
    static SQLPrepareA(hstmt, szSqlStr, cbSqlStr) {
        hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
        szSqlStrMarshal := szSqlStr is VarRef ? "char*" : "ptr"

        result := DllCall("ODBC32.dll\SQLPrepareA", hstmtMarshal, hstmt, szSqlStrMarshal, szSqlStr, "int", cbSqlStr, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hdbc 
     * @param {Integer} fAttribute 
     * @param {Pointer} rgbValue 
     * @param {Integer} cbValue 
     * @returns {Integer} 
     */
    static SQLSetConnectAttrA(hdbc, fAttribute, rgbValue, cbValue) {
        hdbcMarshal := hdbc is VarRef ? "ptr" : "ptr"

        result := DllCall("ODBC32.dll\SQLSetConnectAttrA", hdbcMarshal, hdbc, "int", fAttribute, "ptr", rgbValue, "int", cbValue, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Pointer<Integer>} szCursor 
     * @param {Integer} cbCursor 
     * @returns {Integer} 
     */
    static SQLSetCursorNameA(hstmt, szCursor, cbCursor) {
        hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
        szCursorMarshal := szCursor is VarRef ? "char*" : "ptr"

        result := DllCall("ODBC32.dll\SQLSetCursorNameA", hstmtMarshal, hstmt, szCursorMarshal, szCursor, "short", cbCursor, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Pointer<Integer>} szCatalogName 
     * @param {Integer} cbCatalogName 
     * @param {Pointer<Integer>} szSchemaName 
     * @param {Integer} cbSchemaName 
     * @param {Pointer<Integer>} szTableName 
     * @param {Integer} cbTableName 
     * @param {Pointer<Integer>} szColumnName 
     * @param {Integer} cbColumnName 
     * @returns {Integer} 
     */
    static SQLColumnsA(hstmt, szCatalogName, cbCatalogName, szSchemaName, cbSchemaName, szTableName, cbTableName, szColumnName, cbColumnName) {
        hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
        szCatalogNameMarshal := szCatalogName is VarRef ? "char*" : "ptr"
        szSchemaNameMarshal := szSchemaName is VarRef ? "char*" : "ptr"
        szTableNameMarshal := szTableName is VarRef ? "char*" : "ptr"
        szColumnNameMarshal := szColumnName is VarRef ? "char*" : "ptr"

        result := DllCall("ODBC32.dll\SQLColumnsA", hstmtMarshal, hstmt, szCatalogNameMarshal, szCatalogName, "short", cbCatalogName, szSchemaNameMarshal, szSchemaName, "short", cbSchemaName, szTableNameMarshal, szTableName, "short", cbTableName, szColumnNameMarshal, szColumnName, "short", cbColumnName, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hdbc 
     * @param {Integer} fOption 
     * @param {Pointer<Void>} pvParam 
     * @returns {Integer} 
     */
    static SQLGetConnectOptionA(hdbc, fOption, pvParam) {
        hdbcMarshal := hdbc is VarRef ? "ptr" : "ptr"
        pvParamMarshal := pvParam is VarRef ? "ptr" : "ptr"

        result := DllCall("ODBC32.dll\SQLGetConnectOptionA", hdbcMarshal, hdbc, "ushort", fOption, pvParamMarshal, pvParam, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hdbc 
     * @param {Integer} fInfoType 
     * @param {Pointer} rgbInfoValue 
     * @param {Integer} cbInfoValueMax 
     * @param {Pointer<Integer>} pcbInfoValue 
     * @returns {Integer} 
     */
    static SQLGetInfoA(hdbc, fInfoType, rgbInfoValue, cbInfoValueMax, pcbInfoValue) {
        hdbcMarshal := hdbc is VarRef ? "ptr" : "ptr"
        pcbInfoValueMarshal := pcbInfoValue is VarRef ? "short*" : "ptr"

        result := DllCall("ODBC32.dll\SQLGetInfoA", hdbcMarshal, hdbc, "ushort", fInfoType, "ptr", rgbInfoValue, "short", cbInfoValueMax, pcbInfoValueMarshal, pcbInfoValue, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Integer} fColType 
     * @param {Pointer<Integer>} szCatalogName 
     * @param {Integer} cbCatalogName 
     * @param {Pointer<Integer>} szSchemaName 
     * @param {Integer} cbSchemaName 
     * @param {Pointer<Integer>} szTableName 
     * @param {Integer} cbTableName 
     * @param {Integer} fScope 
     * @param {Integer} fNullable 
     * @returns {Integer} 
     */
    static SQLSpecialColumnsA(hstmt, fColType, szCatalogName, cbCatalogName, szSchemaName, cbSchemaName, szTableName, cbTableName, fScope, fNullable) {
        hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
        szCatalogNameMarshal := szCatalogName is VarRef ? "char*" : "ptr"
        szSchemaNameMarshal := szSchemaName is VarRef ? "char*" : "ptr"
        szTableNameMarshal := szTableName is VarRef ? "char*" : "ptr"

        result := DllCall("ODBC32.dll\SQLSpecialColumnsA", hstmtMarshal, hstmt, "ushort", fColType, szCatalogNameMarshal, szCatalogName, "short", cbCatalogName, szSchemaNameMarshal, szSchemaName, "short", cbSchemaName, szTableNameMarshal, szTableName, "short", cbTableName, "ushort", fScope, "ushort", fNullable, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Pointer<Integer>} szCatalogName 
     * @param {Integer} cbCatalogName 
     * @param {Pointer<Integer>} szSchemaName 
     * @param {Integer} cbSchemaName 
     * @param {Pointer<Integer>} szTableName 
     * @param {Integer} cbTableName 
     * @param {Integer} fUnique 
     * @param {Integer} fAccuracy 
     * @returns {Integer} 
     */
    static SQLStatisticsA(hstmt, szCatalogName, cbCatalogName, szSchemaName, cbSchemaName, szTableName, cbTableName, fUnique, fAccuracy) {
        hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
        szCatalogNameMarshal := szCatalogName is VarRef ? "char*" : "ptr"
        szSchemaNameMarshal := szSchemaName is VarRef ? "char*" : "ptr"
        szTableNameMarshal := szTableName is VarRef ? "char*" : "ptr"

        result := DllCall("ODBC32.dll\SQLStatisticsA", hstmtMarshal, hstmt, szCatalogNameMarshal, szCatalogName, "short", cbCatalogName, szSchemaNameMarshal, szSchemaName, "short", cbSchemaName, szTableNameMarshal, szTableName, "short", cbTableName, "ushort", fUnique, "ushort", fAccuracy, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Pointer<Integer>} szCatalogName 
     * @param {Integer} cbCatalogName 
     * @param {Pointer<Integer>} szSchemaName 
     * @param {Integer} cbSchemaName 
     * @param {Pointer<Integer>} szTableName 
     * @param {Integer} cbTableName 
     * @param {Pointer<Integer>} szTableType 
     * @param {Integer} cbTableType 
     * @returns {Integer} 
     */
    static SQLTablesA(hstmt, szCatalogName, cbCatalogName, szSchemaName, cbSchemaName, szTableName, cbTableName, szTableType, cbTableType) {
        hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
        szCatalogNameMarshal := szCatalogName is VarRef ? "char*" : "ptr"
        szSchemaNameMarshal := szSchemaName is VarRef ? "char*" : "ptr"
        szTableNameMarshal := szTableName is VarRef ? "char*" : "ptr"
        szTableTypeMarshal := szTableType is VarRef ? "char*" : "ptr"

        result := DllCall("ODBC32.dll\SQLTablesA", hstmtMarshal, hstmt, szCatalogNameMarshal, szCatalogName, "short", cbCatalogName, szSchemaNameMarshal, szSchemaName, "short", cbSchemaName, szTableNameMarshal, szTableName, "short", cbTableName, szTableTypeMarshal, szTableType, "short", cbTableType, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} henv 
     * @param {Integer} fDirection 
     * @param {Pointer<Integer>} szDSN 
     * @param {Integer} cbDSNMax 
     * @param {Pointer<Integer>} pcbDSN 
     * @param {Pointer<Integer>} szDescription 
     * @param {Integer} cbDescriptionMax 
     * @param {Pointer<Integer>} pcbDescription 
     * @returns {Integer} 
     */
    static SQLDataSourcesA(henv, fDirection, szDSN, cbDSNMax, pcbDSN, szDescription, cbDescriptionMax, pcbDescription) {
        henvMarshal := henv is VarRef ? "ptr" : "ptr"
        szDSNMarshal := szDSN is VarRef ? "char*" : "ptr"
        pcbDSNMarshal := pcbDSN is VarRef ? "short*" : "ptr"
        szDescriptionMarshal := szDescription is VarRef ? "char*" : "ptr"
        pcbDescriptionMarshal := pcbDescription is VarRef ? "short*" : "ptr"

        result := DllCall("ODBC32.dll\SQLDataSourcesA", henvMarshal, henv, "ushort", fDirection, szDSNMarshal, szDSN, "short", cbDSNMax, pcbDSNMarshal, pcbDSN, szDescriptionMarshal, szDescription, "short", cbDescriptionMax, pcbDescriptionMarshal, pcbDescription, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hdbc 
     * @param {Pointer} hwnd 
     * @param {Pointer<Integer>} szConnStrIn 
     * @param {Integer} cbConnStrIn 
     * @param {Pointer<Integer>} szConnStrOut 
     * @param {Integer} cbConnStrOutMax 
     * @param {Pointer<Integer>} pcbConnStrOut 
     * @param {Integer} fDriverCompletion 
     * @returns {Integer} 
     */
    static SQLDriverConnectA(hdbc, hwnd, szConnStrIn, cbConnStrIn, szConnStrOut, cbConnStrOutMax, pcbConnStrOut, fDriverCompletion) {
        hdbcMarshal := hdbc is VarRef ? "ptr" : "ptr"
        szConnStrInMarshal := szConnStrIn is VarRef ? "char*" : "ptr"
        szConnStrOutMarshal := szConnStrOut is VarRef ? "char*" : "ptr"
        pcbConnStrOutMarshal := pcbConnStrOut is VarRef ? "short*" : "ptr"

        result := DllCall("ODBC32.dll\SQLDriverConnectA", hdbcMarshal, hdbc, "ptr", hwnd, szConnStrInMarshal, szConnStrIn, "short", cbConnStrIn, szConnStrOutMarshal, szConnStrOut, "short", cbConnStrOutMax, pcbConnStrOutMarshal, pcbConnStrOut, "ushort", fDriverCompletion, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hdbc 
     * @param {Pointer<Integer>} szConnStrIn 
     * @param {Integer} cbConnStrIn 
     * @param {Pointer<Integer>} szConnStrOut 
     * @param {Integer} cbConnStrOutMax 
     * @param {Pointer<Integer>} pcbConnStrOut 
     * @returns {Integer} 
     */
    static SQLBrowseConnectA(hdbc, szConnStrIn, cbConnStrIn, szConnStrOut, cbConnStrOutMax, pcbConnStrOut) {
        hdbcMarshal := hdbc is VarRef ? "ptr" : "ptr"
        szConnStrInMarshal := szConnStrIn is VarRef ? "char*" : "ptr"
        szConnStrOutMarshal := szConnStrOut is VarRef ? "char*" : "ptr"
        pcbConnStrOutMarshal := pcbConnStrOut is VarRef ? "short*" : "ptr"

        result := DllCall("ODBC32.dll\SQLBrowseConnectA", hdbcMarshal, hdbc, szConnStrInMarshal, szConnStrIn, "short", cbConnStrIn, szConnStrOutMarshal, szConnStrOut, "short", cbConnStrOutMax, pcbConnStrOutMarshal, pcbConnStrOut, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Pointer<Integer>} szCatalogName 
     * @param {Integer} cbCatalogName 
     * @param {Pointer<Integer>} szSchemaName 
     * @param {Integer} cbSchemaName 
     * @param {Pointer<Integer>} szTableName 
     * @param {Integer} cbTableName 
     * @param {Pointer<Integer>} szColumnName 
     * @param {Integer} cbColumnName 
     * @returns {Integer} 
     */
    static SQLColumnPrivilegesA(hstmt, szCatalogName, cbCatalogName, szSchemaName, cbSchemaName, szTableName, cbTableName, szColumnName, cbColumnName) {
        hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
        szCatalogNameMarshal := szCatalogName is VarRef ? "char*" : "ptr"
        szSchemaNameMarshal := szSchemaName is VarRef ? "char*" : "ptr"
        szTableNameMarshal := szTableName is VarRef ? "char*" : "ptr"
        szColumnNameMarshal := szColumnName is VarRef ? "char*" : "ptr"

        result := DllCall("ODBC32.dll\SQLColumnPrivilegesA", hstmtMarshal, hstmt, szCatalogNameMarshal, szCatalogName, "short", cbCatalogName, szSchemaNameMarshal, szSchemaName, "short", cbSchemaName, szTableNameMarshal, szTableName, "short", cbTableName, szColumnNameMarshal, szColumnName, "short", cbColumnName, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Pointer<Integer>} szPkCatalogName 
     * @param {Integer} cbPkCatalogName 
     * @param {Pointer<Integer>} szPkSchemaName 
     * @param {Integer} cbPkSchemaName 
     * @param {Pointer<Integer>} szPkTableName 
     * @param {Integer} cbPkTableName 
     * @param {Pointer<Integer>} szFkCatalogName 
     * @param {Integer} cbFkCatalogName 
     * @param {Pointer<Integer>} szFkSchemaName 
     * @param {Integer} cbFkSchemaName 
     * @param {Pointer<Integer>} szFkTableName 
     * @param {Integer} cbFkTableName 
     * @returns {Integer} 
     */
    static SQLForeignKeysA(hstmt, szPkCatalogName, cbPkCatalogName, szPkSchemaName, cbPkSchemaName, szPkTableName, cbPkTableName, szFkCatalogName, cbFkCatalogName, szFkSchemaName, cbFkSchemaName, szFkTableName, cbFkTableName) {
        hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
        szPkCatalogNameMarshal := szPkCatalogName is VarRef ? "char*" : "ptr"
        szPkSchemaNameMarshal := szPkSchemaName is VarRef ? "char*" : "ptr"
        szPkTableNameMarshal := szPkTableName is VarRef ? "char*" : "ptr"
        szFkCatalogNameMarshal := szFkCatalogName is VarRef ? "char*" : "ptr"
        szFkSchemaNameMarshal := szFkSchemaName is VarRef ? "char*" : "ptr"
        szFkTableNameMarshal := szFkTableName is VarRef ? "char*" : "ptr"

        result := DllCall("ODBC32.dll\SQLForeignKeysA", hstmtMarshal, hstmt, szPkCatalogNameMarshal, szPkCatalogName, "short", cbPkCatalogName, szPkSchemaNameMarshal, szPkSchemaName, "short", cbPkSchemaName, szPkTableNameMarshal, szPkTableName, "short", cbPkTableName, szFkCatalogNameMarshal, szFkCatalogName, "short", cbFkCatalogName, szFkSchemaNameMarshal, szFkSchemaName, "short", cbFkSchemaName, szFkTableNameMarshal, szFkTableName, "short", cbFkTableName, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hdbc 
     * @param {Pointer<Integer>} szSqlStrIn 
     * @param {Integer} cbSqlStrIn 
     * @param {Pointer<Integer>} szSqlStr 
     * @param {Integer} cbSqlStrMax 
     * @param {Pointer<Integer>} pcbSqlStr 
     * @returns {Integer} 
     */
    static SQLNativeSqlA(hdbc, szSqlStrIn, cbSqlStrIn, szSqlStr, cbSqlStrMax, pcbSqlStr) {
        hdbcMarshal := hdbc is VarRef ? "ptr" : "ptr"
        szSqlStrInMarshal := szSqlStrIn is VarRef ? "char*" : "ptr"
        szSqlStrMarshal := szSqlStr is VarRef ? "char*" : "ptr"
        pcbSqlStrMarshal := pcbSqlStr is VarRef ? "int*" : "ptr"

        result := DllCall("ODBC32.dll\SQLNativeSqlA", hdbcMarshal, hdbc, szSqlStrInMarshal, szSqlStrIn, "int", cbSqlStrIn, szSqlStrMarshal, szSqlStr, "int", cbSqlStrMax, pcbSqlStrMarshal, pcbSqlStr, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Pointer<Integer>} szCatalogName 
     * @param {Integer} cbCatalogName 
     * @param {Pointer<Integer>} szSchemaName 
     * @param {Integer} cbSchemaName 
     * @param {Pointer<Integer>} szTableName 
     * @param {Integer} cbTableName 
     * @returns {Integer} 
     */
    static SQLPrimaryKeysA(hstmt, szCatalogName, cbCatalogName, szSchemaName, cbSchemaName, szTableName, cbTableName) {
        hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
        szCatalogNameMarshal := szCatalogName is VarRef ? "char*" : "ptr"
        szSchemaNameMarshal := szSchemaName is VarRef ? "char*" : "ptr"
        szTableNameMarshal := szTableName is VarRef ? "char*" : "ptr"

        result := DllCall("ODBC32.dll\SQLPrimaryKeysA", hstmtMarshal, hstmt, szCatalogNameMarshal, szCatalogName, "short", cbCatalogName, szSchemaNameMarshal, szSchemaName, "short", cbSchemaName, szTableNameMarshal, szTableName, "short", cbTableName, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Pointer<Integer>} szCatalogName 
     * @param {Integer} cbCatalogName 
     * @param {Pointer<Integer>} szSchemaName 
     * @param {Integer} cbSchemaName 
     * @param {Pointer<Integer>} szProcName 
     * @param {Integer} cbProcName 
     * @param {Pointer<Integer>} szColumnName 
     * @param {Integer} cbColumnName 
     * @returns {Integer} 
     */
    static SQLProcedureColumnsA(hstmt, szCatalogName, cbCatalogName, szSchemaName, cbSchemaName, szProcName, cbProcName, szColumnName, cbColumnName) {
        hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
        szCatalogNameMarshal := szCatalogName is VarRef ? "char*" : "ptr"
        szSchemaNameMarshal := szSchemaName is VarRef ? "char*" : "ptr"
        szProcNameMarshal := szProcName is VarRef ? "char*" : "ptr"
        szColumnNameMarshal := szColumnName is VarRef ? "char*" : "ptr"

        result := DllCall("ODBC32.dll\SQLProcedureColumnsA", hstmtMarshal, hstmt, szCatalogNameMarshal, szCatalogName, "short", cbCatalogName, szSchemaNameMarshal, szSchemaName, "short", cbSchemaName, szProcNameMarshal, szProcName, "short", cbProcName, szColumnNameMarshal, szColumnName, "short", cbColumnName, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Pointer<Integer>} szCatalogName 
     * @param {Integer} cbCatalogName 
     * @param {Pointer<Integer>} szSchemaName 
     * @param {Integer} cbSchemaName 
     * @param {Pointer<Integer>} szProcName 
     * @param {Integer} cbProcName 
     * @returns {Integer} 
     */
    static SQLProceduresA(hstmt, szCatalogName, cbCatalogName, szSchemaName, cbSchemaName, szProcName, cbProcName) {
        hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
        szCatalogNameMarshal := szCatalogName is VarRef ? "char*" : "ptr"
        szSchemaNameMarshal := szSchemaName is VarRef ? "char*" : "ptr"
        szProcNameMarshal := szProcName is VarRef ? "char*" : "ptr"

        result := DllCall("ODBC32.dll\SQLProceduresA", hstmtMarshal, hstmt, szCatalogNameMarshal, szCatalogName, "short", cbCatalogName, szSchemaNameMarshal, szSchemaName, "short", cbSchemaName, szProcNameMarshal, szProcName, "short", cbProcName, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Pointer<Integer>} szCatalogName 
     * @param {Integer} cbCatalogName 
     * @param {Pointer<Integer>} szSchemaName 
     * @param {Integer} cbSchemaName 
     * @param {Pointer<Integer>} szTableName 
     * @param {Integer} cbTableName 
     * @returns {Integer} 
     */
    static SQLTablePrivilegesA(hstmt, szCatalogName, cbCatalogName, szSchemaName, cbSchemaName, szTableName, cbTableName) {
        hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
        szCatalogNameMarshal := szCatalogName is VarRef ? "char*" : "ptr"
        szSchemaNameMarshal := szSchemaName is VarRef ? "char*" : "ptr"
        szTableNameMarshal := szTableName is VarRef ? "char*" : "ptr"

        result := DllCall("ODBC32.dll\SQLTablePrivilegesA", hstmtMarshal, hstmt, szCatalogNameMarshal, szCatalogName, "short", cbCatalogName, szSchemaNameMarshal, szSchemaName, "short", cbSchemaName, szTableNameMarshal, szTableName, "short", cbTableName, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} henv 
     * @param {Integer} fDirection 
     * @param {Pointer<Integer>} szDriverDesc 
     * @param {Integer} cbDriverDescMax 
     * @param {Pointer<Integer>} pcbDriverDesc 
     * @param {Pointer<Integer>} szDriverAttributes 
     * @param {Integer} cbDrvrAttrMax 
     * @param {Pointer<Integer>} pcbDrvrAttr 
     * @returns {Integer} 
     */
    static SQLDriversA(henv, fDirection, szDriverDesc, cbDriverDescMax, pcbDriverDesc, szDriverAttributes, cbDrvrAttrMax, pcbDrvrAttr) {
        henvMarshal := henv is VarRef ? "ptr" : "ptr"
        szDriverDescMarshal := szDriverDesc is VarRef ? "char*" : "ptr"
        pcbDriverDescMarshal := pcbDriverDesc is VarRef ? "short*" : "ptr"
        szDriverAttributesMarshal := szDriverAttributes is VarRef ? "char*" : "ptr"
        pcbDrvrAttrMarshal := pcbDrvrAttr is VarRef ? "short*" : "ptr"

        result := DllCall("ODBC32.dll\SQLDriversA", henvMarshal, henv, "ushort", fDirection, szDriverDescMarshal, szDriverDesc, "short", cbDriverDescMax, pcbDriverDescMarshal, pcbDriverDesc, szDriverAttributesMarshal, szDriverAttributes, "short", cbDrvrAttrMax, pcbDrvrAttrMarshal, pcbDrvrAttr, "short")
        return result
    }

;@endregion Methods
}
