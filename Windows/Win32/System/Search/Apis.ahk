#Requires AutoHotkey v2.0.0 64-bit

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
     * @type {String}
     */
    static DBCIDGUID => "{0c733a81-2a1c-11ce-ade5-00aa0044773d}"

    /**
     * @type {String}
     */
    static DB_NULLGUID => "{00000000-0000-0000-0000-000000000000}"

    /**
     * @type {String}
     */
    static DBGUID_ROWURL => "{0c733ab6-2a1c-11ce-ade5-00aa0044773d}"

    /**
     * @type {String}
     */
    static DBGUID_ROWDEFAULTSTREAM => "{0c733ab7-2a1c-11ce-ade5-00aa0044773d}"

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
     * @type {String}
     */
    static CLSID_CISimpleCommandCreator => "{c7b6c04a-cbb5-11d0-bb4c-00c04fc2f410}"

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
     * @type {String}
     */
    static DBQUERYGUID => "{49691c90-7e17-101a-a91c-08002b2ecda9}"

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
     * @type {String}
     */
    static PSGUID_QUERY_METADATA => "{624c9360-93d0-11cf-a787-00004c752752}"

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
     * @type {String}
     */
    static DBBMKGUID => "{c8b52232-5cf3-11ce-ade5-00aa0044773d}"

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
     * @type {String}
     */
    static DBSELFGUID => "{c8b52231-5cf3-11ce-ade5-00aa0044773d}"

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
     * @type {String}
     */
    static PSGUID_CHARACTERIZATION => "{560c36c0-503a-11cf-baa1-00004c752a9a}"

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
     * @type {String}
     */
    static PSGUID_STORAGE => "{b725f130-47ef-101a-a5f1-02608c9eebac}"

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
     * @type {String}
     */
    static DBPROPSET_MSDAORA_ROWSET => "{e8cc4cbd-fdff-11d0-b865-00a0c9081c1d}"

    /**
     * @type {String}
     */
    static DBPROPSET_MSDAORA8_ROWSET => "{7f06a375-dd6a-43db-b4e0-1fc121e5e62b}"

    /**
     * @type {String}
     */
    static CLSID_MSDASQL => "{c8b522cb-5cf3-11ce-ade5-00aa0044773d}"

    /**
     * @type {String}
     */
    static CLSID_MSDASQL_ENUMERATOR => "{c8b522cd-5cf3-11ce-ade5-00aa0044773d}"

    /**
     * @type {String}
     */
    static DBPROPSET_PROVIDERDATASOURCEINFO => "{497c60e0-7123-11cf-b171-00aa0057599e}"

    /**
     * @type {String}
     */
    static DBPROPSET_PROVIDERROWSET => "{497c60e1-7123-11cf-b171-00aa0057599e}"

    /**
     * @type {String}
     */
    static DBPROPSET_PROVIDERDBINIT => "{497c60e2-7123-11cf-b171-00aa0057599e}"

    /**
     * @type {String}
     */
    static DBPROPSET_PROVIDERSTMTATTR => "{497c60e3-7123-11cf-b171-00aa0057599e}"

    /**
     * @type {String}
     */
    static DBPROPSET_PROVIDERCONNATTR => "{497c60e4-7123-11cf-b171-00aa0057599e}"

    /**
     * @type {String}
     */
    static CLSID_DataShapeProvider => "{3449a1c8-c56c-11d0-ad72-00c04fc29863}"

    /**
     * @type {String}
     */
    static DBPROPSET_MSDSDBINIT => "{55cb91a8-5c7a-11d1-adad-00c04fc29863}"

    /**
     * @type {String}
     */
    static DBPROPSET_MSDSSESSION => "{edf17536-afbf-11d1-8847-0000f879f98c}"

    /**
     * @type {String}
     */
    static CLSID_MSPersist => "{7c07e0d0-4418-11d2-9212-00c04fbbbfb3}"

    /**
     * @type {String}
     */
    static DBPROPSET_PERSIST => "{4d7839a0-5b8e-11d1-a6b3-00a0c9138c66}"

    /**
     * @type {String}
     */
    static PROGID_MSPersist_W => "MSPersist"

    /**
     * @type {String}
     */
    static PROGID_MSPersist_Version_W => "MSPersist.1"

    /**
     * @type {String}
     */
    static CLSID_SQLOLEDB => "{0c7ff16c-38e3-11d0-97ab-00c04fc2ad98}"

    /**
     * @type {String}
     */
    static CLSID_SQLOLEDB_ERROR => "{c0932c62-38e5-11d0-97ab-00c04fc2ad98}"

    /**
     * @type {String}
     */
    static CLSID_SQLOLEDB_ENUMERATOR => "{dfa22b8e-e68d-11d0-97e4-00c04fc2ad98}"

    /**
     * @type {String}
     */
    static DBGUID_MSSQLXML => "{5d531cb2-e6ed-11d2-b252-00c04f681b71}"

    /**
     * @type {String}
     */
    static DBGUID_XPATH => "{ec2a4293-e898-11d2-b1b7-00c04f680c56}"

    /**
     * @type {String}
     */
    static DBSCHEMA_LINKEDSERVERS => "{9093caf4-2eac-11d1-9809-00c04fc2ad98}"

    /**
     * @type {String}
     */
    static DBPROPSET_SQLSERVERDATASOURCE => "{28efaee4-2d2c-11d1-9807-00c04fc2ad98}"

    /**
     * @type {String}
     */
    static DBPROPSET_SQLSERVERDATASOURCEINFO => "{df10cb94-35f6-11d2-9c54-00c04f7971d3}"

    /**
     * @type {String}
     */
    static DBPROPSET_SQLSERVERDBINIT => "{5cf4ca10-ef21-11d0-97e7-00c04fc2ad98}"

    /**
     * @type {String}
     */
    static DBPROPSET_SQLSERVERROWSET => "{5cf4ca11-ef21-11d0-97e7-00c04fc2ad98}"

    /**
     * @type {String}
     */
    static DBPROPSET_SQLSERVERSESSION => "{28efaee5-2d2c-11d1-9807-00c04fc2ad98}"

    /**
     * @type {String}
     */
    static DBPROPSET_SQLSERVERCOLUMN => "{3b63fb5e-3fbb-11d3-9f29-00c04f8ee9dc}"

    /**
     * @type {String}
     */
    static DBPROPSET_SQLSERVERSTREAM => "{9f79c073-8a6d-4bca-a8a8-c9b79a9b962d}"
;@endregion Constants

;@region Methods
    /**
     * SQLBindCol Function
     * @remarks
     * **SQLBindCol** is used to associate, or *bind,* columns in the result set to data buffers and length/indicator buffers in the application. When the application calls **SQLFetch**, **SQLFetchScroll**, or **SQLSetPos** to fetch data, the driver returns the data for the bound columns in the specified buffers; for more information, see [SQLFetch Function](../../../odbc/reference/syntax/sqlfetch-function.md). When the application calls **SQLBulkOperations** to update or insert a row or **SQLSetPos** to update a row, the driver retrieves the data for the bound columns from the specified buffers; for more information, see [SQLBulkOperations Function](../../../odbc/reference/syntax/sqlbulkoperations-function.md) or [SQLSetPos Function](../../../odbc/reference/syntax/sqlsetpos-function.md). For more information about binding, see [Retrieving Results (Basic)](../../../odbc/reference/develop-app/retrieving-results-basic.md).  
     *   
     *  Notice that columns do not have to be bound to retrieve data from them. An application can also call **SQLGetData** to retrieve data from columns. Although it is possible to bind some columns in a row and call **SQLGetData** for others, this is subject to some restrictions. For more information, see [SQLGetData](../../../odbc/reference/syntax/sqlgetdata-function.md).
     * @param {Pointer<Void>} StatementHandle [Input] Statement handle.
     * @param {Integer} ColumnNumber [Input] Number of the result set column to bind. Columns are numbered in increasing column order starting at 0, where column 0 is the bookmark column. If bookmarks are not used - that is, the SQL_ATTR_USE_BOOKMARKS statement attribute is set to SQL_UB_OFF - then column numbers start at 1.
     * @param {Integer} TargetType [Input] The identifier of the C data type of the \**TargetValuePtr* buffer. When it is retrieving data from the data source with **SQLFetch**, **SQLFetchScroll**, **SQLBulkOperations**, or **SQLSetPos**, the driver converts the data to this type; when it sends data to the data source with **SQLBulkOperations** or **SQLSetPos**, the driver converts the data from this type. For a list of valid C data types and type identifiers, see the [C Data Types](../../../odbc/reference/appendixes/c-data-types.md) section in Appendix D: Data Types.  
     *   
     *  If the *TargetType* argument is an interval data type, the default interval leading precision (2) and the default interval seconds precision (6), as set in the SQL_DESC_DATETIME_INTERVAL_PRECISION and SQL_DESC_PRECISION fields of the ARD, respectively, are used for the data. If the *TargetType* argument is SQL_C_NUMERIC, the default precision (driver-defined) and default scale (0), as set in the SQL_DESC_PRECISION and SQL_DESC_SCALE fields of the ARD, are used for the data. If any default precision or scale is not appropriate, the application should explicitly set the appropriate descriptor field by a call to **SQLSetDescField** or **SQLSetDescRec**.  
     *   
     *  You can also specify an extended C data type. For more information, see [C Data Types in ODBC](../../../odbc/reference/develop-app/c-data-types-in-odbc.md).
     * @param {Pointer<Void>} TargetValue 
     * @param {Integer} BufferLength [Input] Length of the \**TargetValuePtr* buffer in bytes.  
     *   
     *  The driver uses *BufferLength* to avoid writing past the end of the \**TargetValuePtr* buffer when it returns variable-length data, such as character or binary data. Notice that the driver counts the null-termination character when it returns character data to \**TargetValuePtr*. \**TargetValuePtr* must therefore contain space for the null-termination character or the driver will truncate the data.  
     *   
     *  When the driver returns fixed-length data, such as an integer or a date structure, the driver ignores *BufferLength* and assumes the buffer is large enough to hold the data. Therefore, it is important for the application to allocate a large enough buffer for fixed-length data or the driver will write past the end of the buffer.
     * @param {Pointer<Int64>} StrLen_or_Ind 
     * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_ERROR, or SQL_INVALID_HANDLE.
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlbindcol-function
     */
    static SQLBindCol(StatementHandle, ColumnNumber, TargetType, TargetValue, BufferLength, StrLen_or_Ind) {
        result := DllCall("ODBC32.dll\SQLBindCol", "ptr", StatementHandle, "ushort", ColumnNumber, "short", TargetType, "ptr", TargetValue, "int64", BufferLength, "ptr", StrLen_or_Ind, "short")
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
     * @param {Pointer<Int64>} StrLen_or_Ind 
     * @returns {Integer} 
     * @deprecated
     */
    static SQLBindParam(StatementHandle, ParameterNumber, ValueType, ParameterType, LengthPrecision, ParameterScale, ParameterValue, StrLen_or_Ind) {
        result := DllCall("ODBC32.dll\SQLBindParam", "ptr", StatementHandle, "ushort", ParameterNumber, "short", ValueType, "short", ParameterType, "uint", LengthPrecision, "short", ParameterScale, "ptr", ParameterValue, "ptr", StrLen_or_Ind, "short")
        return result
    }

    /**
     * SQLColAttribute Function
     * @remarks
     * For information about how applications use the information returned by **SQLColAttribute**, see [Result Set Metadata](../../../odbc/reference/develop-app/result-set-metadata.md).  
     *   
     *  **SQLColAttribute** returns information either in \**NumericAttributePtr* or in \**CharacterAttributePtr*. Integer information is returned in \**NumericAttributePtr* as a SQLLEN value; all other formats of information are returned in \**CharacterAttributePtr*. When information is returned in \**NumericAttributePtr*, the driver ignores *CharacterAttributePtr*, *BufferLength*, and *StringLengthPtr*. When information is returned in \**CharacterAttributePtr*, the driver ignores *NumericAttributePtr*.  
     *   
     *  **SQLColAttribute** returns values from the descriptor fields of the IRD. The function is called with a statement handle rather than a descriptor handle. The values returned by **SQLColAttribute** for the *FieldIdentifier* values listed later in this section can also be retrieved by calling **SQLGetDescField** with the appropriate IRD handle.  
     *   
     *  The currently defined descriptor fields, the version of ODBC in which they were introduced, and the arguments in which information is returned for them are shown later in this section; more descriptor types may be defined by drivers to take advantage of different data sources.  
     *   
     *  An ODBC 3.*x* driver must return a value for each of the descriptor fields. If a descriptor field does not apply to a driver or data source and unless otherwise stated, the driver returns 0 in \**StringLengthPtr* or an empty string in **CharacterAttributePtr*.
     * @param {Pointer<Void>} StatementHandle [Input] Statement handle.
     * @param {Integer} ColumnNumber [Input] The number of the record in the IRD from which the field value is to be retrieved. This argument corresponds to the column number of result data, ordered sequentially in increasing column order, starting at 1. Columns can be described in any order.  
     *   
     *  Column 0 can be specified in this argument, but all values except SQL_DESC_TYPE and SQL_DESC_OCTET_LENGTH will return undefined values.
     * @param {Integer} FieldIdentifier [Input] The descriptor handle. This handle defines which field in the IRD should be queried (for example, SQL_COLUMN_TABLE_NAME).
     * @param {Pointer<Void>} CharacterAttribute 
     * @param {Integer} BufferLength [Input] If *FieldIdentifier* is an ODBC-defined field and *CharacterAttributePtr* points to a character string or binary buffer, this argument should be the length of \**CharacterAttributePtr*. If *FieldIdentifier* is an ODBC-defined field and \**CharacterAttribute*Ptr is an integer, this field is ignored. If the *\*CharacterAttributePtr* is a Unicode string (when calling **SQLColAttributeW**), the *BufferLength* argument must be an even number. If *FieldIdentifier* is a driver-defined field, the application indicates the nature of the field to the Driver Manager by setting the *BufferLength* argument. *BufferLength* can have the following values:  
     *   
     * -   If *CharacterAttributePtr* is a pointer to a pointer, *BufferLength* should have the value SQL_IS_POINTER.  
     *   
     * -   If *CharacterAttributePtr* is a pointer to a character string, the *BufferLength* is the length of the buffer.  
     *   
     * -   If *CharacterAttributePtr* is a pointer to a binary buffer, the application places the result of the SQL_LEN_BINARY_ATTR(*length*) macro in *BufferLength*. This places a negative value in *BufferLength*.  
     *   
     * -   If *CharacterAttributePtr* is a pointer to a fixed-length data type, *BufferLength* must be one of the following: SQL_IS_INTEGER, SQL_IS_UINTEGER, SQL_IS_SMALLINT, or SQL_IS_USMALLINT.
     * @param {Pointer<Int16>} StringLength 
     * @param {Pointer<Int64>} NumericAttribute 
     * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_STILL_EXECUTING, SQL_ERROR, or SQL_INVALID_HANDLE.
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlcolattribute-function
     */
    static SQLColAttribute(StatementHandle, ColumnNumber, FieldIdentifier, CharacterAttribute, BufferLength, StringLength, NumericAttribute) {
        result := DllCall("ODBC32.dll\SQLColAttribute", "ptr", StatementHandle, "ushort", ColumnNumber, "ushort", FieldIdentifier, "ptr", CharacterAttribute, "short", BufferLength, "ptr", StringLength, "ptr", NumericAttribute, "short")
        return result
    }

    /**
     * SQLDescribeCol Function
     * @remarks
     * An application typically calls **SQLDescribeCol** after a call to **SQLPrepare** and before or after the associated call to **SQLExecute**. An application can also call **SQLDescribeCol** after a call to **SQLExecDirect**. For more information, see [Result Set Metadata](../../../odbc/reference/develop-app/result-set-metadata.md).  
     *   
     *  **SQLDescribeCol** retrieves the column name, type, and length generated by a **SELECT** statement. If the column is an expression, **ColumnName* is either an empty string or a driver-defined name.  
     *   
     * > [!NOTE]  
     * >  ODBC supports SQL_NULLABLE_UNKNOWN as an extension, even though the Open Group and SQL Access Group Call Level Interface specification does not specify the option for **SQLDescribeCol**.
     * @param {Pointer<Void>} StatementHandle [Input] Statement handle.
     * @param {Integer} ColumnNumber [Input] Column number of result data, ordered sequentially in increasing column order, starting at 1. The *ColumnNumber* argument can also be set to 0 to describe the bookmark column.
     * @param {Pointer<Byte>} ColumnName [Output] Pointer to a null-terminated buffer in which to return the column name. This value is read from the SQL_DESC_NAME field of the IRD. If the column is unnamed or the column name cannot be determined, the driver returns an empty string.  
     *   
     *  If *ColumnName* is NULL, *NameLengthPtr* will still return the total number of characters (excluding the null-termination character for character data) available to return in the buffer pointed to by *ColumnName*.
     * @param {Integer} BufferLength [Input] Length of the **ColumnName* buffer, in characters.
     * @param {Pointer<Int16>} NameLength 
     * @param {Pointer<Int16>} DataType 
     * @param {Pointer<UInt64>} ColumnSize 
     * @param {Pointer<Int16>} DecimalDigits 
     * @param {Pointer<Int16>} Nullable 
     * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_STILL_EXECUTING, SQL_ERROR, or SQL_INVALID_HANDLE.
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqldescribecol-function
     */
    static SQLDescribeCol(StatementHandle, ColumnNumber, ColumnName, BufferLength, NameLength, DataType, ColumnSize, DecimalDigits, Nullable) {
        result := DllCall("ODBC32.dll\SQLDescribeCol", "ptr", StatementHandle, "ushort", ColumnNumber, "ptr", ColumnName, "short", BufferLength, "ptr", NameLength, "ptr", DataType, "ptr", ColumnSize, "ptr", DecimalDigits, "ptr", Nullable, "short")
        return result
    }

    /**
     * SQLFetchScroll Function
     * @remarks
     * **SQLFetchScroll** returns a specified rowset from the result set. Rowsets can be specified by absolute or relative position or by bookmark. **SQLFetchScroll** can be called only while a result set exists - that is, after a call that creates a result set and before the cursor over that result set is closed. If any columns are bound, it returns the data in those columns. If the application has specified a pointer to a row status array or a buffer in which to return the number of rows fetched, **SQLFetchScroll** returns this information as well. Calls to **SQLFetchScroll** can be mixed with calls to **SQLFetch** but cannot be mixed with calls to **SQLExtendedFetch**.  
     *   
     *  For more information, see [Using Block Cursors](../../../odbc/reference/develop-app/using-block-cursors.md) and [Using Scrollable Cursors](../../../odbc/reference/develop-app/using-scrollable-cursors.md).
     * @param {Pointer<Void>} StatementHandle [Input] Statement handle.
     * @param {Integer} FetchOrientation [Input]  
     *   
     *  Type of fetch:  
     *   
     *  SQL_FETCH_NEXT  
     *   
     *  SQL_FETCH_PRIOR  
     *   
     *  SQL_FETCH_FIRST  
     *   
     *  SQL_FETCH_LAST  
     *   
     *  SQL_FETCH_ABSOLUTE  
     *   
     *  SQL_FETCH_RELATIVE  
     *   
     *  SQL_FETCH_BOOKMARK  
     *   
     *  For more information, see "Positioning the Cursor" in the "Comments" section.
     * @param {Integer} FetchOffset [Input]  
     *   
     *  Number of the row to fetch. The interpretation of this argument depends on the value of the *FetchOrientation* argument. For more information, see "Positioning the Cursor" in the "Comments" section.
     * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_NO_DATA, SQL_STILL_EXECUTING, SQL_ERROR, or SQL_INVALID_HANDLE.
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlfetchscroll-function
     */
    static SQLFetchScroll(StatementHandle, FetchOrientation, FetchOffset) {
        result := DllCall("ODBC32.dll\SQLFetchScroll", "ptr", StatementHandle, "short", FetchOrientation, "int64", FetchOffset, "short")
        return result
    }

    /**
     * SQLGetData Function
     * @remarks
     * **SQLGetData** returns the data in a specified column. **SQLGetData** can be called only after one or more rows have been fetched from the result set by **SQLFetch**, **SQLFetchScroll**, or **SQLExtendedFetch**. If variable-length data is too large to be returned in a single call to **SQLGetData** (due to a limitation in the application), **SQLGetData** can retrieve it in parts. It is possible to bind some columns in a row and call **SQLGetData** for others, although this is subject to some restrictions. For more information, see [Getting Long Data](../../../odbc/reference/develop-app/getting-long-data.md).  
     *   
     *  For information about using **SQLGetData** with streamed output parameters, see [Retrieving Output Parameters Using SQLGetData](../../../odbc/reference/develop-app/retrieving-output-parameters-using-sqlgetdata.md).
     * @param {Pointer<Void>} StatementHandle [Input] Statement handle.
     * @param {Integer} ColumnNumber 
     * @param {Integer} TargetType [Input] The type identifier of the C data type of the **TargetValuePtr* buffer. For a list of valid C data types and type identifiers, see the [C Data Types](../../../odbc/reference/appendixes/c-data-types.md) section in Appendix D: Data Types.  
     *   
     *  If *TargetType* is SQL_ARD_TYPE, the driver uses the type identifier specified in the SQL_DESC_CONCISE_TYPE field of the ARD. If *TargetType* is SQL_APD_TYPE, **SQLGetData** will use the same C data type that was specified in **SQLBindParameter**. Otherwise, the C data type specified in **SQLGetData** overrides the C data type specified in **SQLBindParameter**. If it is SQL_C_DEFAULT, the driver selects the default C data type based on the SQL data type of the source.  
     *   
     *  You can also specify an extended C data type. For more information, see [C Data Types in ODBC](../../../odbc/reference/develop-app/c-data-types-in-odbc.md).
     * @param {Pointer<Void>} TargetValue 
     * @param {Integer} BufferLength [Input] Length of the **TargetValuePtr* buffer in bytes.  
     *   
     *  The driver uses *BufferLength* to avoid writing past the end of the \**TargetValuePtr* buffer when returning variable-length data, such as character or binary data. Note that the driver counts the null-termination character when returning character data to \**TargetValuePtr*. **TargetValuePtr* must therefore contain space for the null-termination character, or the driver will truncate the data.  
     *   
     *  When the driver returns fixed-length data, such as an integer or a date structure, the driver ignores *BufferLength* and assumes the buffer is large enough to hold the data. It is therefore important for the application to allocate a large enough buffer for fixed-length data or the driver will write past the end of the buffer.
     * @param {Pointer<Int64>} StrLen_or_IndPtr [Output] Pointer to the buffer in which to return the length or indicator value. If this is a null pointer, no length or indicator value is returned. This returns an error when the data being fetched is NULL.
     * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_NO_DATA, SQL_STILL_EXECUTING, SQL_ERROR, or SQL_INVALID_HANDLE.
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlgetdata-function
     */
    static SQLGetData(StatementHandle, ColumnNumber, TargetType, TargetValue, BufferLength, StrLen_or_IndPtr) {
        result := DllCall("ODBC32.dll\SQLGetData", "ptr", StatementHandle, "ushort", ColumnNumber, "short", TargetType, "ptr", TargetValue, "int64", BufferLength, "ptr", StrLen_or_IndPtr, "short")
        return result
    }

    /**
     * SQLGetDescRec Function
     * @remarks
     * An application can call **SQLGetDescRec** to retrieve the values of the following descriptor fields for a single column or parameter:  
     *   
     * -   SQL_DESC_NAME  
     *   
     * -   SQL_DESC_TYPE  
     *   
     * -   SQL_DESC_DATETIME_INTERVAL_CODE (for records whose type is SQL_DATETIME or SQL_INTERVAL)  
     *   
     * -   SQL_DESC_OCTET_LENGTH  
     *   
     * -   SQL_DESC_PRECISION  
     *   
     * -   SQL_DESC_SCALE  
     *   
     * -   SQL_DESC_NULLABLE  
     *   
     *  **SQLGetDescRec** does not retrieve the values for header fields.  
     *   
     *  An application can prevent the return of a field's setting by setting the argument that corresponds to the field to a null pointer.  
     *   
     *  When an application calls **SQLGetDescRec** to retrieve the value of a field that is undefined for a particular descriptor type, the function returns SQL_SUCCESS but the value returned for the field is undefined. For example, calling **SQLGetDescRec** for the SQL_DESC_NAME or SQL_DESC_NULLABLE field of an APD or ARD will return SQL_SUCCESS but an undefined value for the field.  
     *   
     *  When an application calls **SQLGetDescRec** to retrieve the value of a field that is defined for a particular descriptor type but that has no default value and has not been set yet, the function returns SQL_SUCCESS but the value returned for the field is undefined. For more information, see "Initialization of Descriptor Fields" in [SQLSetDescField](../../../odbc/reference/syntax/sqlsetdescfield-function.md).  
     *   
     *  The values of fields can also be retrieved individually by a call to **SQLGetDescField**. For a description of the fields in a descriptor header or record, see [SQLSetDescField](../../../odbc/reference/syntax/sqlsetdescfield-function.md). For more information about descriptors, see [Descriptors](../../../odbc/reference/develop-app/descriptors.md).
     * @param {Pointer<Void>} DescriptorHandle [Input] Descriptor handle.
     * @param {Integer} RecNumber [Input] Indicates the descriptor record from which the application seeks information. Descriptor records are numbered from 1, with record number 0 being the bookmark record. The *RecNumber* argument must be less than or equal to the value of SQL_DESC_COUNT. If *RecNumber* is less than or equal to SQL_DESC_COUNT but the row does not contain data for a column or parameter, a call to **SQLGetDescRec** will return the default values of the fields. (For more information, see "Initialization of Descriptor Fields" in [SQLSetDescField](../../../odbc/reference/syntax/sqlsetdescfield-function.md).)
     * @param {Pointer<Byte>} Name [Output] A pointer to a buffer in which to return the SQL_DESC_NAME field for the descriptor record.  
     *   
     *  If *Name* is NULL, *StringLengthPtr* will still return the total number of characters (excluding the null-termination character for character data) available to return in the buffer pointed to by *Name*.
     * @param {Integer} BufferLength [Input] Length of the **Name* buffer, in characters.
     * @param {Pointer<Int16>} StringLengthPtr [Output] A pointer to a buffer in which to return the number of characters of data available to return in the \**Name* buffer, excluding the null-termination character. If the number of characters was greater than or equal to *BufferLength*, the data in \**Name* is truncated to *BufferLength* minus the length of a null-termination character, and is null-terminated by the driver.
     * @param {Pointer<Int16>} TypePtr [Output] A pointer to a buffer in which to return the value of the SQL_DESC_TYPE field for the descriptor record.
     * @param {Pointer<Int16>} SubTypePtr [Output] For records whose type is SQL_DATETIME or SQL_INTERVAL, this is a pointer to a buffer in which to return the value of the SQL_DESC_DATETIME_INTERVAL_CODE field.
     * @param {Pointer<Int64>} LengthPtr [Output] A pointer to a buffer in which to return the value of the SQL_DESC_OCTET_LENGTH field for the descriptor record.
     * @param {Pointer<Int16>} PrecisionPtr [Output] A pointer to a buffer in which to return the value of the SQL_DESC_PRECISION field for the descriptor record.
     * @param {Pointer<Int16>} ScalePtr [Output] A pointer to a buffer in which to return the value of the SQL_DESC_SCALE field for the descriptor record.
     * @param {Pointer<Int16>} NullablePtr [Output] A pointer to a buffer in which to return the value of the SQL_DESC_NULLABLE field for the descriptor record.
     * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_ERROR, SQL_NO_DATA, or SQL_INVALID_HANDLE.  
     *   
     *  SQL_NO_DATA is returned if *RecNumber* is greater than the current number of descriptor records.  
     *   
     *  SQL_NO_DATA is returned if *DescriptorHandle* is an IRD handle and the statement is in the prepared or executed state but there was no open cursor associated with it.
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlgetdescrec-function
     */
    static SQLGetDescRec(DescriptorHandle, RecNumber, Name, BufferLength, StringLengthPtr, TypePtr, SubTypePtr, LengthPtr, PrecisionPtr, ScalePtr, NullablePtr) {
        result := DllCall("ODBC32.dll\SQLGetDescRec", "ptr", DescriptorHandle, "short", RecNumber, "ptr", Name, "short", BufferLength, "ptr", StringLengthPtr, "ptr", TypePtr, "ptr", SubTypePtr, "ptr", LengthPtr, "ptr", PrecisionPtr, "ptr", ScalePtr, "ptr", NullablePtr, "short")
        return result
    }

    /**
     * SQLPutData Function
     * @remarks
     * **SQLPutData** can be called to supply data-at-execution data for two uses: parameter data to be used in a call to **SQLExecute** or **SQLExecDirect**, or column data to be used when a row is updated or added by a call to **SQLBulkOperations** or is updated by a call to **SQLSetPos**.  
     *   
     *  When an application calls **SQLParamData** to determine which data it should send, the driver returns an indicator that the application can use to determine which parameter data to send or where column data can be found. It also returns SQL_NEED_DATA, which is an indicator to the application that it should call **SQLPutData** to send the data. In the *DataPtr* argument to **SQLPutData**, the application passes a pointer to the buffer containing the actual data for the parameter or column.  
     *   
     *  When the driver returns SQL_SUCCESS for **SQLPutData**, the application calls **SQLParamData** again. **SQLParamData** returns SQL_NEED_DATA if more data needs to be sent, in which case the application calls **SQLPutData** again. It returns SQL_SUCCESS if all data-at-execution data has been sent. The application then calls **SQLParamData** again. If the driver returns SQL_NEED_DATA and another indicator in *\*ValuePtrPtr*, it requires data for another parameter or column and **SQLPutData** is called again. If the driver returns SQL_SUCCESS, then all data-at-execution data has been sent and the SQL statement can be executed or the **SQLBulkOperations** or **SQLSetPos** call can be processed.  
     *   
     *  For more information on how data-at-execution parameter data is passed at statement execution time, see "Passing Parameter Values" in [SQLBindParameter](../../../odbc/reference/syntax/sqlbindparameter-function.md) and [Sending Long Data](../../../odbc/reference/develop-app/sending-long-data.md). For more information on how data-at-execution column data is updated or added, see the section "Using SQLSetPos" in [SQLSetPos](../../../odbc/reference/syntax/sqlsetpos-function.md), "Performing Bulk Updates Using Bookmarks" in [SQLBulkOperations](../../../odbc/reference/syntax/sqlbulkoperations-function.md), and [Long Data and SQLSetPos and SQLBulkOperations](../../../odbc/reference/develop-app/long-data-and-sqlsetpos-and-sqlbulkoperations.md).  
     *   
     * > [!NOTE]  
     * >  An application can use **SQLPutData** to send data in parts only when sending character C data to a column with a character, binary, or data source-specific data type or when sending binary C data to a column with a character, binary, or data source-specific data type. If **SQLPutData** is called more than once under any other conditions, it returns SQL_ERROR and SQLSTATE HY019 (Non-character and non-binary data sent in pieces).
     * @param {Pointer<Void>} StatementHandle [Input] Statement handle.
     * @param {Pointer<Void>} Data 
     * @param {Integer} StrLen_or_Ind [Input] Length of \**DataPtr*. Specifies the amount of data sent in a call to **SQLPutData**. The amount of data can vary with each call for a given parameter or column. *StrLen_or_Ind* is ignored unless it meets one of the following conditions:  
     *   
     * -   *StrLen_or_Ind* is SQL_NTS, SQL_NULL_DATA, or SQL_DEFAULT_PARAM.  
     *   
     * -   The C data type specified in **SQLBindParameter** or **SQLBindCol** is SQL_C_CHAR or SQL_C_BINARY.  
     *   
     * -   The C data type is SQL_C_DEFAULT, and the default C data type for the specified SQL data type is SQL_C_CHAR or SQL_C_BINARY.  
     *   
     *  For all other types of C data, if *StrLen_or_Ind* is not SQL_NULL_DATA or SQL_DEFAULT_PARAM, the driver assumes that the size of the \**DataPtr* buffer is the size of the C data type specified with *ValueType* or *TargetType* and sends the entire data value. For more information, see [Converting Data from C to SQL Data Types](../../../odbc/reference/appendixes/converting-data-from-c-to-sql-data-types.md) in Appendix D: Data Types.
     * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_STILL_EXECUTING, SQL_ERROR, or SQL_INVALID_HANDLE.
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlputdata-function
     */
    static SQLPutData(StatementHandle, Data, StrLen_or_Ind) {
        result := DllCall("ODBC32.dll\SQLPutData", "ptr", StatementHandle, "ptr", Data, "int64", StrLen_or_Ind, "short")
        return result
    }

    /**
     * SQLRowCount Function
     * @remarks
     * If the last SQL statement executed on the statement handle was not an **UPDATE**, **INSERT**, or **DELETE** statement or if the *Operation* argument in the previous call to **SQLBulkOperations** was not SQL_ADD, SQL_UPDATE_BY_BOOKMARK, or SQL_DELETE_BY_BOOKMARK, or if the *Operation* argument in the previous call to **SQLSetPos** was not SQL_UPDATE or SQL_DELETE, the value of **RowCountPtr* is driver-defined. For more information, see [Determining the Number of Affected Rows](../../../odbc/reference/develop-app/determining-the-number-of-affected-rows.md).
     * @param {Pointer<Void>} StatementHandle [Input] Statement handle.
     * @param {Pointer<Int64>} RowCount 
     * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_ERROR, or SQL_INVALID_HANDLE.
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlrowcount-function
     */
    static SQLRowCount(StatementHandle, RowCount) {
        result := DllCall("ODBC32.dll\SQLRowCount", "ptr", StatementHandle, "ptr", RowCount, "short")
        return result
    }

    /**
     * SQLSetConnectOption Function
     * @remarks
     * See [ODBC 64-Bit Information](../../../odbc/reference/odbc-64-bit-information.md), if your application will run on a 64-bit operating system.  
     *   
     * > [!NOTE]  
     * >  The attribute SQL_ASYNC_DBC_FUNCTION_ENABLE introduced in ODBC 3.8 is not supported by **SQLSetConnectOption**. Applications that use the asynchronous operation on connection handle must use **SQLSetConnectAttr**.
     * @param {Pointer<Void>} ConnectionHandle 
     * @param {Integer} Option 
     * @param {Integer} Value 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlsetconnectoption-function
     * @deprecated
     */
    static SQLSetConnectOption(ConnectionHandle, Option, Value) {
        result := DllCall("ODBC32.dll\SQLSetConnectOption", "ptr", ConnectionHandle, "ushort", Option, "uint", Value, "short")
        return result
    }

    /**
     * SQLSetDescRec Function
     * @remarks
     * An application can call **SQLSetDescRec** to set the following fields for a single column or parameter:  
     *   
     * -   SQL_DESC_TYPE  
     *   
     * -   SQL_DESC_DATETIME_INTERVAL_CODE (for records whose type is SQL_DATETIME or SQL_INTERVAL)  
     *   
     * -   SQL_DESC_OCTET_LENGTH  
     *   
     * -   SQL_DESC_PRECISION  
     *   
     * -   SQL_DESC_SCALE  
     *   
     * -   SQL_DESC_DATA_PTR  
     *   
     * -   SQL_DESC_OCTET_LENGTH_PTR  
     *   
     * -   SQL_DESC_INDICATOR_PTR  
     *   
     * > [!NOTE]  
     * >  If a call to **SQLSetDescRec** fails, the contents of the descriptor record identified by the *RecNumber* argument are undefined.  
     *   
     *  When binding a column or parameter, **SQLSetDescRec** allows you to change multiple fields affecting the binding without calling **SQLBindCol** or **SQLBindParameter** or making multiple calls to **SQLSetDescField**. **SQLSetDescRec** can set fields on a descriptor not currently associated with a statement. Note that **SQLBindParameter** sets more fields than **SQLSetDescRec**, can set fields on both an APD and an IPD in one call, and does not require a descriptor handle.  
     *   
     * > [!NOTE]  
     * >  The statement attribute SQL_ATTR_USE_BOOKMARKS should always be set before calling **SQLSetDescRec** with a *RecNumber* argument of 0 to set bookmark fields. While this is not mandatory, it is strongly recommended.
     * @param {Pointer<Void>} DescriptorHandle [Input] Descriptor handle. This must not be an IRD handle.
     * @param {Integer} RecNumber [Input] Indicates the descriptor record that contains the fields to be set. Descriptor records are numbered from 0, with record number 0 being the bookmark record. This argument must be equal to or greater than 0. If *RecNumber* is greater than the value of SQL_DESC_COUNT, SQL_DESC_COUNTis changed to the value of *RecNumber*.
     * @param {Integer} Type [Input] The value to which to set the SQL_DESC_TYPE field for the descriptor record.
     * @param {Integer} SubType [Input] For records whose type is SQL_DATETIME or SQL_INTERVAL, this is the value to which to set the SQL_DESC_DATETIME_INTERVAL_CODE field.
     * @param {Integer} Length [Input] The value to which to set the SQL_DESC_OCTET_LENGTH field for the descriptor record.
     * @param {Integer} Precision [Input] The value to which to set the SQL_DESC_PRECISION field for the descriptor record.
     * @param {Integer} Scale [Input] The value to which to set the SQL_DESC_SCALE field for the descriptor record.
     * @param {Pointer<Void>} Data 
     * @param {Pointer<Int64>} StringLength 
     * @param {Pointer<Int64>} Indicator 
     * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_ERROR, or SQL_INVALID_HANDLE.
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlsetdescrec-function
     */
    static SQLSetDescRec(DescriptorHandle, RecNumber, Type, SubType, Length, Precision, Scale, Data, StringLength, Indicator) {
        result := DllCall("ODBC32.dll\SQLSetDescRec", "ptr", DescriptorHandle, "short", RecNumber, "short", Type, "short", SubType, "int64", Length, "short", Precision, "short", Scale, "ptr", Data, "ptr", StringLength, "ptr", Indicator, "short")
        return result
    }

    /**
     * SQLSetParam Function
     * @remarks
     * See [ODBC 64-Bit Information](../../../odbc/reference/odbc-64-bit-information.md), if your application will run on a 64-bit operating system.
     * @param {Pointer<Void>} StatementHandle 
     * @param {Integer} ParameterNumber 
     * @param {Integer} ValueType 
     * @param {Integer} ParameterType 
     * @param {Integer} LengthPrecision 
     * @param {Integer} ParameterScale 
     * @param {Pointer<Void>} ParameterValue 
     * @param {Pointer<Int64>} StrLen_or_Ind 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlsetparam-function
     * @deprecated
     */
    static SQLSetParam(StatementHandle, ParameterNumber, ValueType, ParameterType, LengthPrecision, ParameterScale, ParameterValue, StrLen_or_Ind) {
        result := DllCall("ODBC32.dll\SQLSetParam", "ptr", StatementHandle, "ushort", ParameterNumber, "short", ValueType, "short", ParameterType, "uint", LengthPrecision, "short", ParameterScale, "ptr", ParameterValue, "ptr", StrLen_or_Ind, "short")
        return result
    }

    /**
     * SQLSetStmtOption Function
     * @remarks
     * See [ODBC 64-Bit Information](../../../odbc/reference/odbc-64-bit-information.md), if your application will run on a 64-bit operating system.
     * @param {Pointer<Void>} StatementHandle 
     * @param {Integer} Option 
     * @param {Integer} Value 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlsetstmtoption-function
     * @deprecated
     */
    static SQLSetStmtOption(StatementHandle, Option, Value) {
        result := DllCall("ODBC32.dll\SQLSetStmtOption", "ptr", StatementHandle, "ushort", Option, "uint", Value, "short")
        return result
    }

    /**
     * SQLColAttributes Function
     * @param {Pointer<Void>} hstmt 
     * @param {Integer} icol 
     * @param {Integer} fDescType 
     * @param {Pointer<Void>} rgbDesc 
     * @param {Integer} cbDescMax 
     * @param {Pointer<Int16>} pcbDesc 
     * @param {Pointer<Int64>} pfDesc 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlcolattributes-function
     */
    static SQLColAttributes(hstmt, icol, fDescType, rgbDesc, cbDescMax, pcbDesc, pfDesc) {
        result := DllCall("ODBC32.dll\SQLColAttributes", "ptr", hstmt, "ushort", icol, "ushort", fDescType, "ptr", rgbDesc, "short", cbDescMax, "ptr", pcbDesc, "ptr", pfDesc, "short")
        return result
    }

    /**
     * SQLDescribeParam Function
     * @remarks
     * Parameter markers are numbered in increasing parameter order, starting with 1, in the order they appear in the SQL statement.  
     *   
     *  **SQLDescribeParam** does not return the type (input, input/output, or output) of a parameter in an SQL statement. Except in calls to procedures, all parameters in SQL statements are input parameters. To determine the type of each parameter in a call to a procedure, an application calls **SQLProcedureColumns**.  
     *   
     *  For more information, see [Describing Parameters](../../../odbc/reference/develop-app/describing-parameters.md).
     * @param {Pointer<Void>} hstmt 
     * @param {Integer} ipar 
     * @param {Pointer<Int16>} pfSqlType 
     * @param {Pointer<UInt64>} pcbParamDef 
     * @param {Pointer<Int16>} pibScale 
     * @param {Pointer<Int16>} pfNullable 
     * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_STILL_EXECUTING, SQL_ERROR, or SQL_INVALID_HANDLE.
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqldescribeparam-function
     */
    static SQLDescribeParam(hstmt, ipar, pfSqlType, pcbParamDef, pibScale, pfNullable) {
        result := DllCall("ODBC32.dll\SQLDescribeParam", "ptr", hstmt, "ushort", ipar, "ptr", pfSqlType, "ptr", pcbParamDef, "ptr", pibScale, "ptr", pfNullable, "short")
        return result
    }

    /**
     * SQLExtendedFetch Function
     * @remarks
     * The behavior of **SQLExtendedFetch** is identical to that of **SQLFetchScroll**, with the following exceptions:  
     *   
     * -   **SQLExtendedFetch** and **SQLFetchScroll** use different methods to return the number of rows fetched. **SQLExtendedFetch** returns the number of rows fetched in *\*RowCountPtr*; **SQLFetchScroll** returns the number of rows fetched directly to the buffer pointed to by SQL_ATTR_ROWS_FETCHED_PTR. For more information, see the *RowCountPtr* argument.  
     *   
     * -   **SQLExtendedFetch** and **SQLFetchScroll** return the status of each row in different arrays. For more information, see the *RowStatusArray* argument.  
     *   
     * -   **SQLExtendedFetch** and **SQLFetchScroll** use different methods to retrieve the bookmark when *FetchOrientation* is SQL_FETCH_BOOKMARK. **SQLExtendedFetch** does not support variable-length bookmarks or fetching rowsets at an offset other than 0 from a bookmark. For more information, see the *FetchOffset* argument.  
     *   
     * -   **SQLExtendedFetch** and **SQLFetchScroll** use different rowset sizes. **SQLExtendedFetch** uses the value of the SQL_ROWSET_SIZE statement attribute, and **SQLFetchScroll** uses the value of the SQL_ATTR_ROW_ARRAY_SIZE statement attribute.  
     *   
     * -   **SQLExtendedFetch** has slightly different error handling semantics than **SQLFetchScroll**. For more information, see "Error Handling" in the "Comments" section of [SQLFetchScroll](../../../odbc/reference/syntax/sqlfetchscroll-function.md).  
     *   
     * -   **SQLExtendedFetch** does not support binding offsets (the SQL_ATTR_ROW_BIND_OFFSET_PTR statement attribute).  
     *   
     * -   Calls to **SQLExtendedFetch** cannot be mixed with calls to **SQLFetch** or **SQLFetchScroll**, and if **SQLBulkOperations** is called before any fetch function is called, **SQLExtendedFetch** cannot be called until the cursor is closed and reopened. That is, **SQLExtendedFetch** can be called only in statement state S7. For more information, see [Statement Transitions](../../../odbc/reference/appendixes/statement-transitions.md) in Appendix B: ODBC State Transition Tables.  
     *   
     *  When an application calls **SQLFetchScroll** while using an ODBC 2*.x* driver, the Driver Manager maps this call to **SQLExtendedFetch**. For more information, see "SQLFetchScroll and ODBC 2*.x* Drivers" in [SQLFetchScroll](../../../odbc/reference/syntax/sqlfetchscroll-function.md).  
     *   
     *  In ODBC 2*.x*, **SQLExtendedFetch** was called to fetch multiple rows and **SQLFetch** was called to fetch a single row. In ODBC 3*.x*, on the other hand, **SQLFetch** can be called to fetch multiple rows.
     * @param {Pointer<Void>} hstmt 
     * @param {Integer} fFetchType 
     * @param {Integer} irow 
     * @param {Pointer<UInt64>} pcrow 
     * @param {Pointer<UInt16>} rgfRowStatus 
     * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_NO_DATA, SQL_STILL_EXECUTING, SQL_ERROR, or SQL_INVALID_HANDLE.
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlextendedfetch-function
     */
    static SQLExtendedFetch(hstmt, fFetchType, irow, pcrow, rgfRowStatus) {
        result := DllCall("ODBC32.dll\SQLExtendedFetch", "ptr", hstmt, "ushort", fFetchType, "int64", irow, "ptr", pcrow, "ptr", rgfRowStatus, "short")
        return result
    }

    /**
     * SQLParamOptions Function
     * @remarks
     * See [ODBC 64-Bit Information](../../../odbc/reference/odbc-64-bit-information.md), if your application will run on a 64-bit operating system.
     * @param {Pointer<Void>} hstmt 
     * @param {Integer} crow 
     * @param {Pointer<UInt64>} pirow 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlparamoptions-function
     */
    static SQLParamOptions(hstmt, crow, pirow) {
        result := DllCall("ODBC32.dll\SQLParamOptions", "ptr", hstmt, "uint", crow, "ptr", pirow, "short")
        return result
    }

    /**
     * SQLSetPos Function
     * @remarks
     * > [!CAUTION]
     * >  For information on the statement states that **SQLSetPos** can be called in and what it needs to do for compatibility with ODBC *2.x* applications, see [Block Cursors, Scrollable Cursors, and Backward Compatibility](../../../odbc/reference/appendixes/block-cursors-scrollable-cursors-and-backward-compatibility.md).
     * @param {Pointer<Void>} hstmt 
     * @param {Integer} irow 
     * @param {Integer} fOption 
     * @param {Integer} fLock 
     * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_NEED_DATA, SQL_STILL_EXECUTING, SQL_ERROR, or SQL_INVALID_HANDLE.
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlsetpos-function
     */
    static SQLSetPos(hstmt, irow, fOption, fLock) {
        result := DllCall("ODBC32.dll\SQLSetPos", "ptr", hstmt, "uint", irow, "ushort", fOption, "ushort", fLock, "short")
        return result
    }

    /**
     * SQLBindParameter Function
     * @remarks
     * An application calls **SQLBindParameter** to bind each parameter marker in an SQL statement. Bindings remain in effect until the application calls **SQLBindParameter** again, calls **SQLFreeStmt** with the SQL_RESET_PARAMS option, or calls **SQLSetDescField** to set the SQL_DESC_COUNT header field of the APD to 0.  
     *   
     *  For more information about parameters, see [Statement Parameters](../../../odbc/reference/develop-app/statement-parameters.md). For more information about parameter data types and parameter markers, see [Parameter Data Types](../../../odbc/reference/appendixes/parameter-data-types.md) and [Parameter Markers](../../../odbc/reference/appendixes/parameter-markers.md) in Appendix C: SQL Grammar.
     * @param {Pointer<Void>} hstmt 
     * @param {Integer} ipar 
     * @param {Integer} fParamType 
     * @param {Integer} fCType 
     * @param {Integer} fSqlType 
     * @param {Integer} cbColDef 
     * @param {Integer} ibScale 
     * @param {Pointer<Void>} rgbValue 
     * @param {Integer} cbValueMax 
     * @param {Pointer<Int64>} pcbValue 
     * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_ERROR, or SQL_INVALID_HANDLE.
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlbindparameter-function
     */
    static SQLBindParameter(hstmt, ipar, fParamType, fCType, fSqlType, cbColDef, ibScale, rgbValue, cbValueMax, pcbValue) {
        result := DllCall("ODBC32.dll\SQLBindParameter", "ptr", hstmt, "ushort", ipar, "short", fParamType, "short", fCType, "short", fSqlType, "uint", cbColDef, "short", ibScale, "ptr", rgbValue, "int64", cbValueMax, "ptr", pcbValue, "short")
        return result
    }

    /**
     * SQLSetScrollOptions Function
     * @remarks
     * If your application will run on a 64-bit operating system, see [ODBC 64-Bit Information](../../../odbc/reference/odbc-64-bit-information.md).
     * @param {Pointer<Void>} hstmt 
     * @param {Integer} fConcurrency 
     * @param {Integer} crowKeyset 
     * @param {Integer} crowRowset 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlsetscrolloptions-function
     */
    static SQLSetScrollOptions(hstmt, fConcurrency, crowKeyset, crowRowset) {
        result := DllCall("ODBC32.dll\SQLSetScrollOptions", "ptr", hstmt, "ushort", fConcurrency, "int64", crowKeyset, "ushort", crowRowset, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Integer} iCol 
     * @param {Integer} iField 
     * @param {Pointer<Void>} pCharAttr 
     * @param {Integer} cbDescMax 
     * @param {Pointer<Int16>} pcbCharAttr 
     * @param {Pointer<Int64>} pNumAttr 
     * @returns {Integer} 
     */
    static SQLColAttributeW(hstmt, iCol, iField, pCharAttr, cbDescMax, pcbCharAttr, pNumAttr) {
        result := DllCall("ODBC32.dll\SQLColAttributeW", "ptr", hstmt, "ushort", iCol, "ushort", iField, "ptr", pCharAttr, "short", cbDescMax, "ptr", pcbCharAttr, "ptr", pNumAttr, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Integer} icol 
     * @param {Integer} fDescType 
     * @param {Pointer<Void>} rgbDesc 
     * @param {Integer} cbDescMax 
     * @param {Pointer<Int16>} pcbDesc 
     * @param {Pointer<Int64>} pfDesc 
     * @returns {Integer} 
     */
    static SQLColAttributesW(hstmt, icol, fDescType, rgbDesc, cbDescMax, pcbDesc, pfDesc) {
        result := DllCall("ODBC32.dll\SQLColAttributesW", "ptr", hstmt, "ushort", icol, "ushort", fDescType, "ptr", rgbDesc, "short", cbDescMax, "ptr", pcbDesc, "ptr", pfDesc, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Integer} icol 
     * @param {Pointer<UInt16>} szColName 
     * @param {Integer} cchColNameMax 
     * @param {Pointer<Int16>} pcchColName 
     * @param {Pointer<Int16>} pfSqlType 
     * @param {Pointer<UInt64>} pcbColDef 
     * @param {Pointer<Int16>} pibScale 
     * @param {Pointer<Int16>} pfNullable 
     * @returns {Integer} 
     */
    static SQLDescribeColW(hstmt, icol, szColName, cchColNameMax, pcchColName, pfSqlType, pcbColDef, pibScale, pfNullable) {
        result := DllCall("ODBC32.dll\SQLDescribeColW", "ptr", hstmt, "ushort", icol, "ptr", szColName, "short", cchColNameMax, "ptr", pcchColName, "ptr", pfSqlType, "ptr", pcbColDef, "ptr", pibScale, "ptr", pfNullable, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hdesc 
     * @param {Integer} iRecord 
     * @param {Pointer<UInt16>} szName 
     * @param {Integer} cchNameMax 
     * @param {Pointer<Int16>} pcchName 
     * @param {Pointer<Int16>} pfType 
     * @param {Pointer<Int16>} pfSubType 
     * @param {Pointer<Int64>} pLength 
     * @param {Pointer<Int16>} pPrecision 
     * @param {Pointer<Int16>} pScale 
     * @param {Pointer<Int16>} pNullable 
     * @returns {Integer} 
     */
    static SQLGetDescRecW(hdesc, iRecord, szName, cchNameMax, pcchName, pfType, pfSubType, pLength, pPrecision, pScale, pNullable) {
        result := DllCall("ODBC32.dll\SQLGetDescRecW", "ptr", hdesc, "short", iRecord, "ptr", szName, "short", cchNameMax, "ptr", pcchName, "ptr", pfType, "ptr", pfSubType, "ptr", pLength, "ptr", pPrecision, "ptr", pScale, "ptr", pNullable, "short")
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
        result := DllCall("ODBC32.dll\SQLSetConnectOptionW", "ptr", hdbc, "ushort", fOption, "uint", vParam, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Integer} iCol 
     * @param {Integer} iField 
     * @param {Pointer<Void>} pCharAttr 
     * @param {Integer} cbCharAttrMax 
     * @param {Pointer<Int16>} pcbCharAttr 
     * @param {Pointer<Int64>} pNumAttr 
     * @returns {Integer} 
     */
    static SQLColAttributeA(hstmt, iCol, iField, pCharAttr, cbCharAttrMax, pcbCharAttr, pNumAttr) {
        result := DllCall("ODBC32.dll\SQLColAttributeA", "ptr", hstmt, "short", iCol, "short", iField, "ptr", pCharAttr, "short", cbCharAttrMax, "ptr", pcbCharAttr, "ptr", pNumAttr, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Integer} icol 
     * @param {Integer} fDescType 
     * @param {Pointer<Void>} rgbDesc 
     * @param {Integer} cbDescMax 
     * @param {Pointer<Int16>} pcbDesc 
     * @param {Pointer<Int64>} pfDesc 
     * @returns {Integer} 
     */
    static SQLColAttributesA(hstmt, icol, fDescType, rgbDesc, cbDescMax, pcbDesc, pfDesc) {
        result := DllCall("ODBC32.dll\SQLColAttributesA", "ptr", hstmt, "ushort", icol, "ushort", fDescType, "ptr", rgbDesc, "short", cbDescMax, "ptr", pcbDesc, "ptr", pfDesc, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Integer} icol 
     * @param {Pointer<Byte>} szColName 
     * @param {Integer} cbColNameMax 
     * @param {Pointer<Int16>} pcbColName 
     * @param {Pointer<Int16>} pfSqlType 
     * @param {Pointer<UInt64>} pcbColDef 
     * @param {Pointer<Int16>} pibScale 
     * @param {Pointer<Int16>} pfNullable 
     * @returns {Integer} 
     */
    static SQLDescribeColA(hstmt, icol, szColName, cbColNameMax, pcbColName, pfSqlType, pcbColDef, pibScale, pfNullable) {
        result := DllCall("ODBC32.dll\SQLDescribeColA", "ptr", hstmt, "ushort", icol, "ptr", szColName, "short", cbColNameMax, "ptr", pcbColName, "ptr", pfSqlType, "ptr", pcbColDef, "ptr", pibScale, "ptr", pfNullable, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hdesc 
     * @param {Integer} iRecord 
     * @param {Pointer<Byte>} szName 
     * @param {Integer} cbNameMax 
     * @param {Pointer<Int16>} pcbName 
     * @param {Pointer<Int16>} pfType 
     * @param {Pointer<Int16>} pfSubType 
     * @param {Pointer<Int64>} pLength 
     * @param {Pointer<Int16>} pPrecision 
     * @param {Pointer<Int16>} pScale 
     * @param {Pointer<Int16>} pNullable 
     * @returns {Integer} 
     */
    static SQLGetDescRecA(hdesc, iRecord, szName, cbNameMax, pcbName, pfType, pfSubType, pLength, pPrecision, pScale, pNullable) {
        result := DllCall("ODBC32.dll\SQLGetDescRecA", "ptr", hdesc, "short", iRecord, "ptr", szName, "short", cbNameMax, "ptr", pcbName, "ptr", pfType, "ptr", pfSubType, "ptr", pLength, "ptr", pPrecision, "ptr", pScale, "ptr", pNullable, "short")
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
        result := DllCall("ODBC32.dll\SQLSetConnectOptionA", "ptr", hdbc, "ushort", fOption, "uint", vParam, "short")
        return result
    }

    /**
     * SQLAllocConnect Function
     * @param {Pointer<Void>} EnvironmentHandle 
     * @param {Pointer<Void>} ConnectionHandle 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlallocconnect-function
     */
    static SQLAllocConnect(EnvironmentHandle, ConnectionHandle) {
        result := DllCall("ODBC32.dll\SQLAllocConnect", "ptr", EnvironmentHandle, "ptr", ConnectionHandle, "short")
        return result
    }

    /**
     * SQLAllocEnv Function
     * @param {Pointer<Void>} EnvironmentHandle 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlallocenv-function
     */
    static SQLAllocEnv(EnvironmentHandle) {
        result := DllCall("ODBC32.dll\SQLAllocEnv", "ptr", EnvironmentHandle, "short")
        return result
    }

    /**
     * SQLAllocHandle Function
     * @remarks
     * **SQLAllocHandle** is used to allocate handles for environments, connections, statements, and descriptors, as described in the following sections. For general information about handles, see [Handles](../../../odbc/reference/develop-app/handles.md).  
     *   
     *  More than one environment, connection, or statement handle can be allocated by an application at a time if multiple allocations are supported by the driver. In ODBC, no limit is defined on the number of environment, connection, statement, or descriptor handles that can be allocated at any one time. Drivers may impose a limit on the number of a certain type of handle that can be allocated at a time; for more information, see the driver documentation.  
     *   
     *  If the application calls **SQLAllocHandle** with *\*OutputHandlePtr* set to an environment, connection, statement, or descriptor handle that already exists, the driver overwrites the information associated with the *handle*, unless the application is using connection pooling (see "Allocating an Environment Attribute for Connection Pooling" later in this section). The Driver Manager does not check to see whether the *handle* entered in *\*OutputHandlePtr* is already being used, nor does it check the previous contents of a handle before overwriting them.  
     *   
     * > [!NOTE]  
     * >  It is incorrect ODBC application programming to call **SQLAllocHandle** two times with the same application variable defined for *\*OutputHandlePtr* without calling **SQLFreeHandle** to free the handle before reallocating it. Overwriting ODBC handles in such a manner could lead to inconsistent behavior or errors on the part of ODBC drivers.  
     *   
     *  On operating systems that support multiple threads, applications can use the same environment, connection, statement, or descriptor handle on different threads. Drivers must therefore support safe, multithread access to this information; one way to achieve this, for example, is by using a critical section or a semaphore. For more information about threading, see [Multithreading](../../../odbc/reference/develop-app/multithreading.md).  
     *   
     *  **SQLAllocHandle** does not set the SQL_ATTR_ODBC_VERSION environment attribute when it is called to allocate an environment handle; the environment attribute must be set by the application, or SQLSTATE HY010 (Function sequence error) will be returned when **SQLAllocHandle** is called to allocate a connection handle.  
     *   
     *  For standards-compliant applications, **SQLAllocHandle** is mapped to **SQLAllocHandleStd** at compile time. The difference between these two functions is that **SQLAllocHandleStd** sets the SQL_ATTR_ODBC_VERSION environment attribute to SQL_OV_ODBC3 when it is called with the *HandleType* argument set to SQL_HANDLE_ENV. This is done because standards-compliant applications are always ODBC 3.*x* applications. Moreover, the standards do not require the application version to be registered. This is the only difference between these two functions; otherwise, they are identical. **SQLAllocHandleStd** is mapped to **SQLAllocHandle** inside the driver manager. Therefore, third-party drivers do not have to implement **SQLAllocHandleStd**.  
     *   
     *  ODBC 3.8 applications should use:  
     *   
     * -   **SQLAllocHandle and not SQLAllocHandleStd** to allocate an environment handle.  
     *   
     * -   **SQLSetEnvAttr** to set the SQL_ATTR_ODBC_VERSION environment attribute to SQL_OV_ODBC3_80.
     * @param {Integer} HandleType [Input] The type of handle to be allocated by **SQLAllocHandle**. Must be one of the following values:  
     *   
     * -   SQL_HANDLE_DBC  
     *   
     * -   SQL_HANDLE_DBC_INFO_TOKEN  
     *   
     * -   SQL_HANDLE_DESC  
     *   
     * -   SQL_HANDLE_ENV  
     *   
     * -   SQL_HANDLE_STMT  
     *   
     *  SQL_HANDLE_DBC_INFO_TOKEN handle is used only by the Driver Manager and driver. Applications should not use this handle type. For more information about SQL_HANDLE_DBC_INFO_TOKEN, see [Developing Connection-Pool Awareness in an ODBC Driver](../../../odbc/reference/develop-driver/developing-connection-pool-awareness-in-an-odbc-driver.md).
     * @param {Pointer<Void>} InputHandle [Input] The input handle in whose context the new handle is to be allocated. If *HandleType* is SQL_HANDLE_ENV, this is SQL_NULL_HANDLE. If *HandleType* is SQL_HANDLE_DBC, this must be an environment handle, and if it is SQL_HANDLE_STMT or SQL_HANDLE_DESC, it must be a connection handle.
     * @param {Pointer<Void>} OutputHandle 
     * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_INVALID_HANDLE, or SQL_ERROR.  
     *   
     *  When allocating a handle other than an environment handle, if **SQLAllocHandle** returns SQL_ERROR, it sets *OutputHandlePtr* to SQL_NULL_HDBC, SQL_NULL_HSTMT, or SQL_NULL_HDESC, depending on the value of *HandleType*, unless the output argument is a null pointer. The application can then obtain additional information from the diagnostic data structure associated with the handle in the *InputHandle* argument.
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlallochandle-function
     */
    static SQLAllocHandle(HandleType, InputHandle, OutputHandle) {
        result := DllCall("ODBC32.dll\SQLAllocHandle", "short", HandleType, "ptr", InputHandle, "ptr", OutputHandle, "short")
        return result
    }

    /**
     * SQLAllocStmt Function
     * @param {Pointer<Void>} ConnectionHandle 
     * @param {Pointer<Void>} StatementHandle 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlallocstmt-function
     */
    static SQLAllocStmt(ConnectionHandle, StatementHandle) {
        result := DllCall("ODBC32.dll\SQLAllocStmt", "ptr", ConnectionHandle, "ptr", StatementHandle, "short")
        return result
    }

    /**
     * SQLCancel Function
     * @remarks
     * **SQLCancel** can cancel the following types of processing on a statement:  
     *   
     * -   A function running asynchronously on the statement.  
     *   
     * -   A function on a statement that needs data.  
     *   
     * -   A function running on the statement on another thread.  
     *   
     *  In ODBC 2.*x*, if an application calls **SQLCancel** when no processing is being done on the statement, **SQLCancel** has the same effect as **SQLFreeStmt** with the SQL_CLOSE option; this behavior is defined only for completeness and applications should call **SQLFreeStmt** or **SQLCloseCursor** to close cursors.  
     *   
     *  When **SQLCancel** is called to cancel a function running asynchronously in a statement or a function on a statement that needs data, diagnostic records posted by the function being canceled are cleared, and **SQLCancel** posts its own diagnostic records; when **SQLCancel** is called to cancel a function running on a statement on another thread, however, it does not clear the diagnostic records of the being canceled function and does not post its own diagnostic records.
     * @param {Pointer<Void>} StatementHandle [Input] Statement handle.
     * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_ERROR, or SQL_INVALID_HANDLE.
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlcancel-function
     */
    static SQLCancel(StatementHandle) {
        result := DllCall("ODBC32.dll\SQLCancel", "ptr", StatementHandle, "short")
        return result
    }

    /**
     * SQLCancelHandle Function
     * @remarks
     * This function is similar to **SQLCancel** but may take either a connection or statement handle as a parameter rather than only a statement handle. The Driver Manager maps a call to **SQLCancelHandle** to a call to **SQLCancel** when *HandleType* is SQL_HANDLE_STMT. This allows applications to use **SQLCancelHandle** to cancel statement operations even if the driver does not implement **SQLCancelHandle**.  
     *   
     *  For more information about cancelling a statement operation, see [SQLCancel Function](../../../odbc/reference/syntax/sqlcancel-function.md).  
     *   
     *  If there are no operations in progress on *Handle* the call to **SQLCancelHandle** has no effect.  
     *   
     *  **SQLCancelHandle** on a connection handle can cancel the following types of processing:  
     *   
     * -   A function running asynchronously on the connection.  
     *   
     * -   A function running on the connection handle on another thread.  
     *   
     *  When **SQLCancelHandle** is called to cancel a function running asynchronously in a connection, diagnostic records posted by **SQLCancelHandle** are appended to those returned by the operation being canceled; **SQLCancelHandle** does not return diagnostic records, however, when canceling a function running on a connection on another thread.  
     *   
     *  Using **SQLCancelHandle** to cancel **SQLEndTran** may put the connection in suspended state. For more information on suspended state, see [SQLEndTran Function](../../../odbc/reference/syntax/sqlendtran-function.md).  
     *   
     * > [!NOTE]  
     * >  For information about how to use **SQLCancelHandle** in an application that will be deployed on a Windows operating system older than Windows 7, see [Compatibility Matrix](../../../odbc/reference/develop-app/compatibility-matrix.md).
     * @param {Integer} HandleType [Input] The type of the handle on which to cacel processing. Valid values are SQL_HANDLE_DBC or SQL_HANDLE_STMT.
     * @param {Pointer<Void>} InputHandle 
     * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_ERROR, or SQL_INVALID_HANDLE.
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlcancelhandle-function
     */
    static SQLCancelHandle(HandleType, InputHandle) {
        result := DllCall("ODBC32.dll\SQLCancelHandle", "short", HandleType, "ptr", InputHandle, "short")
        return result
    }

    /**
     * SQLCloseCursor Function
     * @remarks
     * **SQLCloseCursor** returns SQLSTATE 24000 (Invalid cursor state) if no cursor is open. Calling **SQLCloseCursor** is equivalent to calling **SQLFreeStmt** with the SQL_CLOSE option, with the exception that **SQLFreeStmt** with SQL_CLOSE has no effect on the application if no cursor is open on the statement, while **SQLCloseCursor** returns SQLSTATE 24000 (Invalid cursor state).  
     *   
     * > [!NOTE]  
     * >  If an ODBC 3.*x* application working with an ODBC 2.*x* driver calls **SQLCloseCursor** when no cursor is open, SQLSTATE 24000 (Invalid cursor state) is not returned, because the Driver Manager maps **SQLCloseCursor** to **SQLFreeStmt** with SQL_CLOSE.  
     *   
     *  For more information, see [Closing the Cursor](../../../odbc/reference/develop-app/closing-the-cursor.md).
     * @param {Pointer<Void>} StatementHandle [Input] Statement handle.
     * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_ERROR, or SQL_INVALID_HANDLE.
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlclosecursor-function
     */
    static SQLCloseCursor(StatementHandle) {
        result := DllCall("ODBC32.dll\SQLCloseCursor", "ptr", StatementHandle, "short")
        return result
    }

    /**
     * SQLColumns Function
     * @remarks
     * This function typically is used before statement execution to retrieve information about columns for a table or tables from the data source's catalog. **SQLColumns** can be used to retrieve data for all types of items returned by **SQLTables**. In addition to base tables, this may include (but is not limited to) views, synonyms, system tables, and so on. By contrast, the functions **SQLColAttribute** and **SQLDescribeCol** describe the columns in a result set and the function **SQLNumResultCols** returns the number of columns in a result set. For more information, see [Uses of Catalog Data](../../../odbc/reference/develop-app/uses-of-catalog-data.md).  
     *   
     * > [!NOTE]  
     * >  For more information about the general use, arguments, and returned data of ODBC catalog functions, see [Catalog Functions](../../../odbc/reference/develop-app/catalog-functions.md).  
     *   
     *  **SQLColumns** returns the results as a standard result set, ordered by TABLE_CAT, TABLE_SCHEM, TABLE_NAME, and ORDINAL_POSITION.  
     *   
     * > [!NOTE]  
     * >  When an application works with an ODBC 2.*x* driver, no ORDINAL_POSITION column is returned in the result set. As a result, when working with ODBC 2.*x* drivers, the order of the columns in the column list returned by **SQLColumns** is not necessarily the same as the order of the columns returned when the application performs a SELECT statement on all columns in that table.  
     *   
     * > [!NOTE]  
     * >  **SQLColumns** might not return all columns. For example, a driver might not return information about pseudo-columns, such as Oracle ROWID. Applications can use any valid column, whether it is returned by **SQLColumns**.  
     * >   
     * >  Some columns that can be returned by **SQLStatistics** are not returned by **SQLColumns**. For example, **SQLColumns** does not return the columns in an index created over an expression or filter, such as SALARY + BENEFITS or DEPT = 0012.  
     *   
     *  The lengths of VARCHAR columns are not shown in the table; the actual lengths depend on the data source. To determine the actual lengths of the TABLE_CAT, TABLE_SCHEM, TABLE_NAME, and COLUMN_NAME columns, an application can call **SQLGetInfo** with the SQL_MAX_CATALOG_NAME_LEN, SQL_MAX_SCHEMA_NAME_LEN, SQL_MAX_TABLE_NAME_LEN, and SQL_MAX_COLUMN_NAME_LEN options.  
     *   
     *  The following columns have been renamed for ODBC 3.*x*. The column name changes do not affect backward compatibility because applications bind by column number.  
     *   
     * |ODBC 2.0 column|ODBC 3.*x* column|  
     * |---------------------|-----------------------|  
     * |TABLE_QUALIFIER|TABLE_CAT|  
     * |TABLE_OWNER|TABLE_SCHEM|  
     * |PRECISION|COLUMN_SIZE|  
     * |LENGTH|BUFFER_LENGTH|  
     * |SCALE|DECIMAL_DIGITS|  
     * |RADIX|NUM_PREC_RADIX|  
     *   
     *  The following columns have been added to the result set returned by **SQLColumns** for ODBC 3.*x*:  
     * 
     * :::row:::
     *     :::column:::
     *         CHAR_OCTET_LENGTH  
     *         COLUMN_DEF  
     *     :::column-end:::
     *     :::column:::
     *         IS_NULLABLE  
     *         ORDINAL_POSITION  
     *     :::column-end:::
     *     :::column:::
     *         SQL_DATA_TYPE  
     *         SQL_DATETIME_SUB  
     *     :::column-end:::
     * :::row-end:::
     * 
     *  The following table lists the columns in the result set. Additional columns beyond column 18 (IS_NULLABLE) can be defined by the driver. An application should gain access to driver-specific columns by counting down from the end of the result set instead of specifying an explicit ordinal position. For more information, see [Data Returned by Catalog Functions](../../../odbc/reference/develop-app/data-returned-by-catalog-functions.md).  
     *   
     * |Column name|Column<br /><br /> number|Data type|Comments|  
     * |-----------------|-----------------------|---------------|--------------|  
     * |TABLE_CAT (ODBC 1.0)|1|Varchar|Catalog name; NULL if not applicable to the data source. If a driver supports catalogs for some tables but not for others, such as when the driver retrieves data from different DBMSs, it returns an empty string ("") for those tables that do not have catalogs.|  
     * |TABLE_SCHEM (ODBC 1.0)|2|Varchar|Schema name; NULL if not applicable to the data source. If a driver supports schemas for some tables but not for others, such as when the driver retrieves data from different DBMSs, it returns an empty string ("") for those tables that do not have schemas.|  
     * |TABLE_NAME (ODBC 1.0)|3|Varchar not NULL|Table name.|  
     * |COLUMN_NAME (ODBC 1.0)|4|Varchar not NULL|Column name. The driver returns an empty string for a column that does not have a name.|  
     * |DATA_TYPE (ODBC 1.0)|5|Smallint not NULL|SQL data type. This can be an ODBC SQL data type or a driver-specific SQL data type. For datetime and interval data types, this column returns the concise data type (such as SQL_TYPE_DATE or SQL_INTERVAL_YEAR_TO_MONTH, instead of the nonconcise data type such as SQL_DATETIME or SQL_INTERVAL). For a list of valid ODBC SQL data types, see [SQL Data Types](../../../odbc/reference/appendixes/sql-data-types.md) in Appendix D: Data Types. For information about driver-specific SQL data types, see the driver's documentation.<br /><br /> The data types returned for ODBC 3.*x* and ODBC 2.*x* applications may be different. For more information, see [Backward Compatibility and Standards Compliance](../../../odbc/reference/develop-app/backward-compatibility-and-standards-compliance.md).|  
     * |TYPE_NAME (ODBC 1.0)|6|Varchar not NULL|Data source-dependent data type name; for example, "CHAR", "VARCHAR", "MONEY", "LONG VARBINAR", or "CHAR ( ) FOR BIT DATA".|  
     * |COLUMN_SIZE (ODBC 1.0)|7|Integer|If DATA_TYPE is SQL_CHAR or SQL_VARCHAR, this column contains the maximum length in characters of the column. For datetime data types, this is the total number of characters required to display the value when it is converted to characters. For numeric data types, this is either the total number of digits or the total number of bits allowed in the column, according to the NUM_PREC_RADIX column. For interval data types, this is the number of characters in the character representation of the interval literal (as defined by the interval leading precision, see [Interval Data Type Length](../../../odbc/reference/appendixes/interval-data-type-length.md) in Appendix D: Data Types). For more information, see [Column Size, Decimal Digits, Transfer Octet Length, and Display Size](../../../odbc/reference/appendixes/column-size-decimal-digits-transfer-octet-length-and-display-size.md) in Appendix D: Data Types.|  
     * |BUFFER_LENGTH (ODBC 1.0)|8|Integer|The length in bytes of data transferred on an SQLGetData, SQLFetch, or SQLFetchScroll operation if SQL_C_DEFAULT is specified. For numeric data, this size may differ from the size of the data stored on the data source. This value might differ from COLUMN_SIZE column for character data. For more information about length, see [Column Size, Decimal Digits, Transfer Octet Length, and Display Size](../../../odbc/reference/appendixes/column-size-decimal-digits-transfer-octet-length-and-display-size.md) in Appendix D: Data Types.|  
     * |DECIMAL_DIGITS (ODBC 1.0)|9|Smallint|The total number of significant digits to the right of the decimal point. For SQL_TYPE_TIME and SQL_TYPE_TIMESTAMP, this column contains the number of digits in the fractional seconds component. For the other data types, this is the decimal digits of the column on the data source. For interval data types that contain a time component, this column contains the number of digits to the right of the decimal point (fractional seconds). For interval data types that do not contain a time component, this column is 0. For more information about decimal digits, see [Column Size, Decimal Digits, Transfer Octet Length, and Display Size](../../../odbc/reference/appendixes/column-size-decimal-digits-transfer-octet-length-and-display-size.md) in Appendix D: Data Types. NULL is returned for data types where DECIMAL_DIGITS is not applicable.|  
     * |NUM_PREC_RADIX (ODBC 1.0)|10|Smallint|For numeric data types, either 10 or 2. If it is 10, the values in COLUMN_SIZE and DECIMAL_DIGITS give the number of decimal digits allowed for the column. For example, a DECIMAL(12,5) column would return a NUM_PREC_RADIX of 10, a COLUMN_SIZE of 12, and a DECIMAL_DIGITS of 5; a FLOAT column could return a NUM_PREC_RADIX of 10, a COLUMN_SIZE of 15, and a DECIMAL_DIGITS of NULL.<br /><br /> If it is 2, the values in COLUMN_SIZE and DECIMAL_DIGITS give the number of bits allowed in the column. For example, a FLOAT column could return a RADIX of 2, a COLUMN_SIZE of 53, and a DECIMAL_DIGITS of NULL.<br /><br /> NULL is returned for data types where NUM_PREC_RADIX is not applicable.|  
     * |NULLABLE (ODBC 1.0)|11|Smallint not NULL|SQL_NO_NULLS if the column could not include NULL values.<br /><br /> SQL_NULLABLE if the column accepts NULL values.<br /><br /> SQL_NULLABLE_UNKNOWN if it is not known whether the column accepts NULL values.<br /><br /> The value returned for this column differs from the value returned for the IS_NULLABLE column. The NULLABLE column indicates with certainty that a column can accept NULLs, but cannot indicate with certainty that a column does not accept NULLs. The IS_NULLABLE column indicates with certainty that a column cannot accept NULLs, but cannot indicate with certainty that a column accepts NULLs.|  
     * |REMARKS (ODBC 1.0)|12|Varchar|A description of the column.|  
     * |COLUMN_DEF (ODBC 3.0)|13|Varchar|The default value of the column. The value in this column should be interpreted as a string if it is enclosed in quotation marks.<br /><br /> If NULL was specified as the default value, this column is the word NULL, not enclosed in quotation marks. If the default value cannot be represented without truncation, this column contains TRUNCATED, without enclosing single quotation marks. If no default value was specified, this column is NULL.<br /><br /> The value of COLUMN_DEF can be used in generating a new column definition, except when it contains the value TRUNCATED.|  
     * |SQL_DATA_TYPE (ODBC 3.0)|14|Smallint not NULL|SQL data type, as it appears in the SQL_DESC_TYPE record field in the IRD. This can be an ODBC SQL data type or a driver-specific SQL data type. This column is the same as the DATA_TYPE column, except for datetime and interval data types. This column returns the nonconcise data type (such as SQL_DATETIME or SQL_INTERVAL), instead of the concise data type (such as SQL_TYPE_DATE or SQL_INTERVAL_YEAR_TO_MONTH) for datetime and interval data types. If this column returns SQL_DATETIME or SQL_INTERVAL, the specific data type can be determined from the SQL_DATETIME_SUB column. For a list of valid ODBC SQL data types, see [SQL Data Types](../../../odbc/reference/appendixes/sql-data-types.md) in Appendix D: Data Types. For information about driver-specific SQL data types, see the driver's documentation.<br /><br /> The data types returned for ODBC 3.*x* and ODBC 2.*x* applications may be different. For more information, see [Backward Compatibility and Standards Compliance](../../../odbc/reference/develop-app/backward-compatibility-and-standards-compliance.md).|  
     * |SQL_DATETIME_SUB (ODBC 3.0)|15|Smallint|The subtype code for datetime and interval data types. For other data types, this column returns a NULL. For more information about datetime and interval subcodes, see "SQL_DESC_DATETIME_INTERVAL_CODE" in [SQLSetDescField](../../../odbc/reference/syntax/sqlsetdescfield-function.md).|  
     * |CHAR_OCTET_LENGTH (ODBC 3.0)|16|Integer|The maximum length in bytes of a character or binary data type column. For all other data types, this column returns a NULL.|  
     * |ORDINAL_POSITION (ODBC 3.0)|17|Integer not NULL|The ordinal position of the column in the table. The first column in the table is number 1.|  
     * |IS_NULLABLE (ODBC 3.0)|18|Varchar|"NO" if the column does not include NULLs.<br /><br /> "YES" if the column could include NULLs.<br /><br /> This column returns a zero-length string if nullability is unknown.<br /><br /> ISO rules are followed to determine nullability. An ISO SQL-compliant DBMS cannot return an empty string.<br /><br /> The value returned for this column differs from the value returned for the NULLABLE column. (See the description of the NULLABLE column.)|
     * @param {Pointer<Void>} StatementHandle [Input] Statement handle.
     * @param {Pointer<Byte>} CatalogName [Input] Catalog name. If a driver supports catalogs for some tables but not for others, such as when the driver retrieves data from different DBMSs, an empty string ("") indicates those tables that do not have catalogs. *CatalogName* cannot contain a string search pattern.  
     *   
     * > [!NOTE]  
     * >  If the SQL_ATTR_METADATA_ID statement attribute is set to SQL_TRUE, *CatalogName* is treated as an identifier and its case is not significant. If it is SQL_FALSE, *CatalogName* is an ordinary argument; it is treated literally, and its case is significant. For more information, see [Arguments in Catalog Functions](../../../odbc/reference/develop-app/arguments-in-catalog-functions.md).
     * @param {Integer} NameLength1 [Input] Length in characters of **CatalogName*.
     * @param {Pointer<Byte>} SchemaName [Input] String search pattern for schema names. If a driver supports schemas for some tables but not for others, such as when the driver retrieves data from different DBMSs, an empty string ("") indicates those tables that do not have schemas.  
     *   
     * > [!NOTE]  
     * >  If the SQL_ATTR_METADATA_ID statement attribute is set to SQL_TRUE, *SchemaName* is treated as an identifier and its case is not significant. If it is SQL_FALSE, *SchemaName* is a pattern value argument; it is treated literally, and its case is significant.
     * @param {Integer} NameLength2 [Input] Length in characters of **SchemaName*.
     * @param {Pointer<Byte>} TableName [Input] String search pattern for table names.  
     *   
     * > [!NOTE]  
     * >  If the SQL_ATTR_METADATA_ID statement attribute is set to SQL_TRUE, *TableName* is treated as an identifier and its case is not significant. If it is SQL_FALSE, *TableName* is a pattern value argument; it is treated literally, and its case is significant.
     * @param {Integer} NameLength3 [Input] Length in characters of **TableName*.
     * @param {Pointer<Byte>} ColumnName [Input] String search pattern for column names.  
     *   
     * > [!NOTE]  
     * >  If the SQL_ATTR_METADATA_ID statement attribute is set to SQL_TRUE, *ColumnName* is treated as an identifier and its case is not significant. If it is SQL_FALSE, *ColumnName* is a pattern value argument; it is treated literally, and its case is significant.
     * @param {Integer} NameLength4 [Input] Length in characters of **ColumnName*.
     * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_STILL_EXECUTING, SQL_ERROR, or SQL_INVALID_HANDLE.
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlcolumns-function
     */
    static SQLColumns(StatementHandle, CatalogName, NameLength1, SchemaName, NameLength2, TableName, NameLength3, ColumnName, NameLength4) {
        result := DllCall("ODBC32.dll\SQLColumns", "ptr", StatementHandle, "ptr", CatalogName, "short", NameLength1, "ptr", SchemaName, "short", NameLength2, "ptr", TableName, "short", NameLength3, "ptr", ColumnName, "short", NameLength4, "short")
        return result
    }

    /**
     * SQLCompleteAsync Function
     * @remarks
     * In polling based asynchronous processing mode, *AsyncRetCodePtr* might be SQL_STILL_EXECUTING when **SQLCompleteAsync** returns SQL_SUCCESS. Application should keep polling until *AsyncRetCodePtr* is not SQL_STILL_EXECUTING. In notification based asynchronous processing mode, *AsyncRetCodePtr* will never be SQL_STILL_EXECUTING.
     * @param {Integer} HandleType [Input] The type of the handle on which to complete asynchronous processing. Valid values are SQL_HANDLE_DBC or SQL_HANDLE_STMT.
     * @param {Pointer<Void>} Handle [Input] The handle on which to complete asynchronous processing. If *Handle* is not a valid handle of the type specified by *HandleType*, **SQLCompleteAsync** returns SQL_INVALID_HANDLE.  
     *   
     *  If *Handle* is not a valid handle of the type specified by *HandleType*, **SQLCompleteAsync** returns SQL_INVALID_HANDLE.
     * @param {Pointer<Int16>} AsyncRetCodePtr [Output] Pointer to a buffer that will contain the return code of the asynchronous API. If *AsyncRetCodePtr* is NULL, **SQLCompleteAsync** returns SQL_ERROR.
     * @returns {Integer} SQL_SUCCESS, SQL_ERROR, SQL_NO_DATA, or SQL_INVALID_HANDLE.
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlcompleteasync-function
     */
    static SQLCompleteAsync(HandleType, Handle, AsyncRetCodePtr) {
        result := DllCall("ODBC32.dll\SQLCompleteAsync", "short", HandleType, "ptr", Handle, "ptr", AsyncRetCodePtr, "short")
        return result
    }

    /**
     * SQLConnect Function
     * @remarks
     * For information about why an application uses **SQLConnect**, see [Connecting with SQLConnect](../../../odbc/reference/develop-app/connecting-with-sqlconnect.md).  
     *   
     *  The Driver Manager does not connect to a driver until the application calls a function (**SQLConnect**, **SQLDriverConnect**, or **SQLBrowseConnect**) to connect to the driver. Until that point, the Driver Manager works with its own handles and manages connection information. When the application calls a connection function, the Driver Manager checks whether a driver is currently connected to for the specified *ConnectionHandle*:  
     *   
     * -   If a driver is not connected to, the Driver Manager connects to the driver and calls **SQLAllocHandle** with a *HandleType* of SQL_HANDLE_ENV, **SQLAllocHandle** with a *HandleType* of SQL_HANDLE_DBC, **SQLSetConnectAttr** (if the application specified any connection attributes), and the connection function in the driver. The Driver Manager returns SQLSTATE IM006 (Driver's **SQLSetConnectOption** failed) and SQL_SUCCESS_WITH_INFO for the connection function if the driver returned an error for **SQLSetConnectAttr**. For more information, see [Connecting to a Data Source or Driver](../../../odbc/reference/develop-app/connecting-to-a-data-source-or-driver.md).  
     *   
     * -   If the specified driver is already connected to on the *ConnectionHandle*, the Driver Manager calls only the connection function in the driver. In this case, the driver must make sure that all connection attributes for the *ConnectionHandle* maintain their current settings.  
     *   
     * -   If a different driver is connected to, the Driver Manager calls **SQLFreeHandle** with a *HandleType* of SQL_HANDLE_DBC, and then, if no other driver is connected to in that environment, it calls **SQLFreeHandle** with a *HandleType* of SQL_HANDLE_ENV in the connected driver and then disconnects that driver. It then performs the same operations as when a driver is not connected to.  
     *   
     *  The driver then allocates handles and initializes itself.  
     *   
     *  When the application calls **SQLDisconnect**, the Driver Manager calls **SQLDisconnect** in the driver. However, it does not disconnect the driver. This keeps the driver in memory for applications that repeatedly connect to and disconnect from a data source. When the application calls **SQLFreeHandle** with a *HandleType* of SQL_HANDLE_DBC, the Driver Manager calls **SQLFreeHandle** with a *HandleType* of SQL_HANDLE_DBC and then **SQLFreeHandle** with a *HandleType* of SQL_HANDLE_ENV in the driver, and then disconnects the driver.  
     *   
     *  An ODBC application can establish more than one connection.
     * @param {Pointer<Void>} ConnectionHandle [Input] Connection handle.
     * @param {Pointer<Byte>} ServerName [Input] Data source name. The data might be located on the same computer as the program, or on another computer somewhere on a network. For information about how an application chooses a data source, see [Choosing a Data Source or Driver](../../../odbc/reference/develop-app/choosing-a-data-source-or-driver.md).
     * @param {Integer} NameLength1 [Input] Length of **ServerName* in characters.
     * @param {Pointer<Byte>} UserName [Input] User identifier.
     * @param {Integer} NameLength2 [Input] Length of **UserName* in characters.
     * @param {Pointer<Byte>} Authentication [Input] Authentication string (typically the password).
     * @param {Integer} NameLength3 [Input] Length of **Authentication* in characters.
     * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_ERROR, SQL_INVALID_HANDLE, or SQL_STILL_EXECUTING.
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlconnect-function
     */
    static SQLConnect(ConnectionHandle, ServerName, NameLength1, UserName, NameLength2, Authentication, NameLength3) {
        result := DllCall("ODBC32.dll\SQLConnect", "ptr", ConnectionHandle, "ptr", ServerName, "short", NameLength1, "ptr", UserName, "short", NameLength2, "ptr", Authentication, "short", NameLength3, "short")
        return result
    }

    /**
     * SQLCopyDesc Function
     * @remarks
     * A call to **SQLCopyDesc** copies the fields of the source descriptor handle to the target descriptor handle. Fields can be copied only to an application descriptor or an IPD, but not to an IRD. Fields can be copied from either an application or an implementation descriptor.  
     *   
     *  Fields can be copied from an IRD only if the statement handle is in the prepared or executed state; otherwise, the function returns SQLSTATE HY007 (Associated statement is not prepared).  
     *   
     *  Fields can be copied from an IPD whether or not a statement has been prepared. If an SQL statement with dynamic parameters has been prepared and automatic population of the IPD is supported and enabled, then the IPD is populated by the driver. When **SQLCopyDesc** is called with the IPD as the *SourceDescHandle*, the populated fields are copied. If the IPD is not populated by the driver, the contents of the fields originally in the IPD are copied.  
     *   
     *  All fields of the descriptor, except SQL_DESC_ALLOC_TYPE (which specifies whether the descriptor handle was automatically or explicitly allocated), are copied, whether or not the field is defined for the destination descriptor. Copied fields overwrite the existing fields.  
     *   
     *  The driver copies all descriptor fields if the *SourceDescHandle* and *TargetDescHandle* arguments are associated with the same driver, even if the drivers are on two different connections or environments. If the *SourceDescHandle* and *TargetDescHandle* arguments are associated with different drivers, the Driver Manager copies ODBC-defined fields, but does not copy driver-defined fields or fields that are not defined by ODBC for the type of descriptor.  
     *   
     *  The call to **SQLCopyDesc** is aborted immediately if an error occurs.  
     *   
     *  When the SQL_DESC_DATA_PTR field is copied, a consistency check is performed on the target descriptor. If the consistency check fails, SQLSTATE HY021 (Inconsistent descriptor information) is returned and the call to **SQLCopyDesc** is immediately aborted. For more information on consistency checks, see "Consistency Checks" in [SQLSetDescRec Function](../../../odbc/reference/syntax/sqlsetdescrec-function.md).  
     *   
     *  Descriptor handles can be copied across connections even if the connections are under different environments. If the Driver Manager detects that the source and the destination descriptor handles do not belong to the same connection and the two connections belong to separate drivers, it implements **SQLCopyDesc** by performing a field-by-field copy using **SQLGetDescField** and **SQLSetDescField**.  
     *   
     *  When **SQLCopyDesc** is called with a *SourceDescHandle* on one driver and a *TargetDescHandle* on another driver, the error queue of the *SourceDescHandle* is cleared. This occurs because **SQLCopyDesc** in this case is implemented by calls to **SQLGetDescField** and **SQLSetDescField**.  
     *   
     * > [!NOTE]  
     * >  An application might be able to associate an explicitly allocated descriptor handle with a *StatementHandle*, rather than calling **SQLCopyDesc** to copy fields from one descriptor to another. An explicitly allocated descriptor can be associated with another *StatementHandle* on the same *ConnectionHandle* by setting the SQL_ATTR_APP_ROW_DESC or SQL_ATTR_APP_PARAM_DESC statement attribute to the handle of the explicitly allocated descriptor. When this is done, **SQLCopyDesc** does not have to be called to copy descriptor field values from one descriptor to another. A descriptor handle cannot be associated with a *StatementHandle* on another *ConnectionHandle*, however; to use the same descriptor field values on *StatementHandles* on different *ConnectionHandles*, **SQLCopyDesc** has to be called.  
     *   
     *  For a description of the fields in a descriptor header or record, see [SQLSetDescField Function](../../../odbc/reference/syntax/sqlsetdescfield-function.md). For more information on descriptors, see [Descriptors](../../../odbc/reference/develop-app/descriptors.md).
     * @param {Pointer<Void>} SourceDescHandle [Input] Source descriptor handle.
     * @param {Pointer<Void>} TargetDescHandle [Input] Target descriptor handle. The *TargetDescHandle* argument can be a handle to an application descriptor or an IPD. *TargetDescHandle* cannot be set to a handle to an IRD, or **SQLCopyDesc** will return SQLSTATE HY016 (Cannot modify an implementation row descriptor).
     * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_ERROR, or SQL_INVALID_HANDLE.
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlcopydesc-function
     */
    static SQLCopyDesc(SourceDescHandle, TargetDescHandle) {
        result := DllCall("ODBC32.dll\SQLCopyDesc", "ptr", SourceDescHandle, "ptr", TargetDescHandle, "short")
        return result
    }

    /**
     * SQLDataSources Function
     * @remarks
     * Because **SQLDataSources** is implemented in the Driver Manager, it is supported for all drivers regardless of a particular driver's standards compliance.  
     *   
     *  An application can call **SQLDataSources** multiple times to retrieve all data source names. The Driver Manager retrieves this information from the system information. When there are no more data source names, the Driver Manager returns SQL_NO_DATA. If **SQLDataSources** is called with SQL_FETCH_NEXT immediately after it returns SQL_NO_DATA, it will return the first data source name. For information about how an application uses the information returned by **SQLDataSources**, see [Choosing a Data Source or Driver](../../../odbc/reference/develop-app/choosing-a-data-source-or-driver.md).  
     *   
     *  If SQL_FETCH_NEXT is passed to **SQLDataSources** the very first time it is called, it will return the first data source name.  
     *   
     *  The driver determines how data source names are mapped to actual data sources.
     * @param {Pointer<Void>} EnvironmentHandle [Input] Environment handle.
     * @param {Integer} Direction [Input] Determines which data source the Driver Manager returns information about. Can be:  
     *   
     *  SQL_FETCH_NEXT (to fetch the next data source name in the list), SQL_FETCH_FIRST (to fetch from the beginning of the list), SQL_FETCH_FIRST_USER (to fetch the first user DSN), or SQL_FETCH_FIRST_SYSTEM (to fetch the first system DSN).  
     *   
     *  When *Direction* is set to SQL_FETCH_FIRST, subsequent calls to **SQLDataSources** with *Direction* set to SQL_FETCH_NEXT return both user and system DSNs. When *Direction* is set to SQL_FETCH_FIRST_USER, all subsequent calls to **SQLDataSources** with *Direction* set to SQL_FETCH_NEXT return only user DSNs. When *Direction* is set to SQL_FETCH_FIRST_SYSTEM, all subsequent calls to **SQLDataSources** with *Direction* set to SQL_FETCH_NEXT return only system DSNs.
     * @param {Pointer<Byte>} ServerName [Output] Pointer to a buffer in which to return the data source name.  
     *   
     *  If *ServerName* is NULL, *NameLength1Ptr* will still return the total number of characters (excluding the null-termination character for character data) available to return in the buffer pointed to by *ServerName*.
     * @param {Integer} BufferLength1 [Input] Length of the **ServerName* buffer, in characters; this does not need to be longer than SQL_MAX_DSN_LENGTH plus the null-termination character.
     * @param {Pointer<Int16>} NameLength1Ptr [Output] Pointer to a buffer in which to return the total number of characters (excluding the null-termination character) available to return in \**ServerName*. If the number of characters available to return is greater than or equal to *BufferLength1*, the data source name in \**ServerName* is truncated to *BufferLength1* minus the length of a null-termination character.
     * @param {Pointer<Byte>} Description [Output] Pointer to a buffer in which to return the description of the driver associated with the data source. For example, dBASE or SQL Server.  
     *   
     *  If *Description* is NULL, *NameLength2Ptr* will still return the total number of characters (excluding the null-termination character for character data) available to return in the buffer pointed to by *Description*.
     * @param {Integer} BufferLength2 [Input] Length in characters of the **Description* buffer.
     * @param {Pointer<Int16>} NameLength2Ptr [Output] Pointer to a buffer in which to return the total number of characters (excluding the null-termination character) available to return in \**Description*. If the number of characters available to return is greater than or equal to *BufferLength2*, the driver description in \**Description* is truncated to *BufferLength2* minus the length of a null-termination character.
     * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_NO_DATA, SQL_ERROR, or SQL_INVALID_HANDLE.
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqldatasources-function
     */
    static SQLDataSources(EnvironmentHandle, Direction, ServerName, BufferLength1, NameLength1Ptr, Description, BufferLength2, NameLength2Ptr) {
        result := DllCall("ODBC32.dll\SQLDataSources", "ptr", EnvironmentHandle, "ushort", Direction, "ptr", ServerName, "short", BufferLength1, "ptr", NameLength1Ptr, "ptr", Description, "short", BufferLength2, "ptr", NameLength2Ptr, "short")
        return result
    }

    /**
     * SQLDisconnect Function
     * @remarks
     * If an application calls **SQLDisconnect** after **SQLBrowseConnect** returns SQL_NEED_DATA and before it returns a different return code, the driver cancels the connection browsing process and returns the connection to an unconnected state.  
     *   
     *  If an application calls **SQLDisconnect** while there is an incomplete transaction associated with the connection handle, the driver returns SQLSTATE 25000 (Invalid transaction state), indicating that the transaction is unchanged and the connection is open. An incomplete transaction is one that has not been committed or rolled back with **SQLEndTran**.  
     *   
     *  If an application calls **SQLDisconnect** before it has freed all statements associated with the connection, the driver, after it successfully disconnects from the data source, frees those statements and all descriptors that have been explicitly allocated on the connection. However, if one or more of the statements associated with the connection are still executing asynchronously, **SQLDisconnect** returns SQL_ERROR with a SQLSTATE value of HY010 (Function sequence error). Also, **SQLDisconnect** will free all associated statements and all descriptors that have been explicitly allocated on the connection, if the connection is in a suspended state or if **SQLDisconnect** was successfully canceled by **SQLCancelHandle**.  
     *   
     *  For information about how an application uses **SQLDisconnect**, see [Disconnecting from a Data Source or Driver](../../../odbc/reference/develop-app/disconnecting-from-a-data-source-or-driver.md).
     * @param {Pointer<Void>} ConnectionHandle [Input] Connection handle.
     * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_ERROR, SQL_INVALID_HANDLE, or SQL_STILL_EXECUTING.
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqldisconnect-function
     */
    static SQLDisconnect(ConnectionHandle) {
        result := DllCall("ODBC32.dll\SQLDisconnect", "ptr", ConnectionHandle, "short")
        return result
    }

    /**
     * SQLEndTran Function
     * @remarks
     * For an ODBC 3.*x* driver, if *HandleType* is SQL_HANDLE_ENV and *Handle* is a valid environment handle, then the Driver Manager will call **SQLEndTran** in each driver associated with the environment. The *Handle* argument for the call to a driver will be the driver's environment handle. For an ODBC 2.*x* driver, if *HandleType* is SQL_HANDLE_ENV and *Handle* is a valid environment handle, and there are multiple connections in a connected state in that environment, then the Driver Manager will call **SQLTransact** in the driver once for each connection in a connected state in that environment. The *Handle* argument in each call will be the connection's handle. In either case, the driver will attempt to commit or roll back transactions, depending on the value of *CompletionType*, on all connections that are in a connected state on that environment. Connections that are not active do not affect the transaction.  
     *   
     * > [!NOTE]  
     * >  **SQLEndTran** cannot be used to commit or roll back transactions on a shared environment. SQLSTATE HY092 (Invalid attribute/option identifier) will be returned if **SQLEndTran** is called with *Handle* set to either the handle of a shared environment or the handle of a connection on a shared environment.  
     *   
     *  The Driver Manager will return SQL_SUCCESS only if it receives SQL_SUCCESS for each connection. If the Driver Manager receives SQL_ERROR on one or more connections, it returns SQL_ERROR to the application, and the diagnostic information is placed in the diagnostic data structure of the environment. To determine which connection or connections failed during the commit or rollback operation, the application can call **SQLGetDiagRec** for each connection.  
     *   
     * > [!NOTE]  
     * >  The Driver Manager does not simulate a global transaction across all connections and therefore does not use two-phase commit protocols.  
     *   
     *  If *CompletionType* is SQL_COMMIT, **SQLEndTran** issues a commit request for all active operations on any statement associated with an affected connection. If *CompletionType* is SQL_ROLLBACK, **SQLEndTran** issues a rollback request for all active operations on any statement associated with an affected connection. If no transactions are active, **SQLEndTran** returns SQL_SUCCESS with no effect on any data sources. For more information, see [Committing and Rolling Back Transactions](../../../odbc/reference/develop-app/committing-and-rolling-back-transactions.md).  
     *   
     *  If the driver is in manual-commit mode (by calling **SQLSetConnectAttr** with the SQL_ATTR_AUTOCOMMIT attribute set to SQL_AUTOCOMMIT_OFF), a new transaction is implicitly started when an SQL statement that can be contained within a transaction is executed against the current data source. For more information, see [Commit Mode](../../../odbc/reference/develop-app/commit-mode.md).  
     *   
     *  To determine how transaction operations affect cursors, an application calls **SQLGetInfo** with the SQL_CURSOR_ROLLBACK_BEHAVIOR and SQL_CURSOR_COMMIT_BEHAVIOR options. For more information, see the following paragraphs and also see [Effect of Transactions on Cursors and Prepared Statements](../../../odbc/reference/develop-app/effect-of-transactions-on-cursors-and-prepared-statements.md).  
     *   
     *  If the SQL_CURSOR_ROLLBACK_BEHAVIOR or SQL_CURSOR_COMMIT_BEHAVIOR value equals SQL_CB_DELETE, **SQLEndTran** closes and deletes all open cursors on all statements associated with the connection and discards all pending results. **SQLEndTran** leaves any statement present in an allocated (unprepared) state; the application can reuse them for subsequent SQL requests or can call **SQLFreeStmt** or **SQLFreeHandle** with a *HandleType* of SQL_HANDLE_STMT to deallocate them.  
     *   
     *  If the SQL_CURSOR_ROLLBACK_BEHAVIOR or SQL_CURSOR_COMMIT_BEHAVIOR value equals SQL_CB_CLOSE, **SQLEndTran** closes all open cursors on all statements associated with the connection. **SQLEndTran** leaves any statement present in a prepared state; the application can call **SQLExecute** for a statement associated with the connection without first calling **SQLPrepare**.  
     *   
     *  If the SQL_CURSOR_ROLLBACK_BEHAVIOR or SQL_CURSOR_COMMIT_BEHAVIOR value equals SQL_CB_PRESERVE, **SQLEndTran** does not affect open cursors associated with the connection. Cursors remain at the row they pointed to prior to the call to **SQLEndTran**.  
     *   
     *  For drivers and data sources that support transactions, calling **SQLEndTran** with either SQL_COMMIT or SQL_ROLLBACK when no transaction is active returns SQL_SUCCESS (indicating that there is no work to be committed or rolled back) and has no effect on the data source.  
     *   
     *  When a driver is in autocommit mode, the Driver Manager does not call **SQLEndTran** in the driver. **SQLEndTran** always returns SQL_SUCCESS regardless of whether it is called with a *CompletionType* of SQL_COMMIT or SQL_ROLLBACK.  
     *   
     *  Drivers or data sources that do not support transactions (**SQLGetInfo** *option* SQL_TXN_CAPABLE is SQL_TC_NONE) are effectively always in autocommit mode and therefore always return SQL_SUCCESS for **SQLEndTran** whether or not they are called with a *CompletionType* of SQL_COMMIT or SQL_ROLLBACK. Such drivers and data sources do not actually roll back transactions when requested to do so.
     * @param {Integer} HandleType [Input] Handle type identifier. Contains either SQL_HANDLE_ENV (if *Handle* is an environment handle) or SQL_HANDLE_DBC (if *Handle* is a connection handle).
     * @param {Pointer<Void>} Handle [Input] The handle, of the type indicated by *HandleType*, indicating the scope of the transaction. See "Comments" for more information.
     * @param {Integer} CompletionType [Input] One of the following two values:  
     *   
     *  SQL_COMMIT SQL_ROLLBACK
     * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_ERROR, SQL_INVALID_HANDLE, or SQL_STILL_EXECUTING.
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlendtran-function
     */
    static SQLEndTran(HandleType, Handle, CompletionType) {
        result := DllCall("ODBC32.dll\SQLEndTran", "short", HandleType, "ptr", Handle, "short", CompletionType, "short")
        return result
    }

    /**
     * SQLError Function
     * @param {Pointer<Void>} EnvironmentHandle 
     * @param {Pointer<Void>} ConnectionHandle 
     * @param {Pointer<Void>} StatementHandle 
     * @param {Pointer<Byte>} Sqlstate 
     * @param {Pointer<Int32>} NativeError 
     * @param {Pointer<Byte>} MessageText 
     * @param {Integer} BufferLength 
     * @param {Pointer<Int16>} TextLength 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlerror-function
     */
    static SQLError(EnvironmentHandle, ConnectionHandle, StatementHandle, Sqlstate, NativeError, MessageText, BufferLength, TextLength) {
        result := DllCall("ODBC32.dll\SQLError", "ptr", EnvironmentHandle, "ptr", ConnectionHandle, "ptr", StatementHandle, "ptr", Sqlstate, "ptr", NativeError, "ptr", MessageText, "short", BufferLength, "ptr", TextLength, "short")
        return result
    }

    /**
     * SQLExecDirect Function
     * @remarks
     * The application calls **SQLExecDirect** to send an SQL statement to the data source. For more information about direct execution, see [Direct Execution](../../../odbc/reference/develop-app/direct-execution-odbc.md). The driver modifies the statement to use the form of SQL used by the data source and then submits it to the data source. In particular, the driver modifies the escape sequences used to define certain features in SQL. For the syntax of escape sequences, see [Escape Sequences in ODBC](../../../odbc/reference/develop-app/escape-sequences-in-odbc.md).  
     *   
     *  The application can include one or more parameter markers in the SQL statement. To include a parameter marker, the application embeds a question mark (?) into the SQL statement at the appropriate position. For information about parameters, see [Statement Parameters](../../../odbc/reference/develop-app/statement-parameters.md).  
     *   
     *  If the SQL statement is a **SELECT** statement and if the application called **SQLSetCursorName** to associate a cursor with a statement, then the driver uses the specified cursor. Otherwise, the driver generates a cursor name.  
     *   
     *  If the data source is in manual-commit mode (requiring explicit transaction initiation) and a transaction has not already been initiated, the driver initiates a transaction before it sends the SQL statement. For more information, see [Manual-Commit Mode](../../../odbc/reference/develop-app/manual-commit-mode.md).  
     *   
     *  If an application uses **SQLExecDirect** to submit a **COMMIT** or **ROLLBACK** statement, it will not be interoperable between DBMS products. To commit or roll back a transaction, an application calls **SQLEndTran**.  
     *   
     *  If **SQLExecDirect** encounters a data-at-execution parameter, it returns SQL_NEED_DATA. The application sends the data using **SQLParamData** and **SQLPutData**. See [SQLBindParameter](../../../odbc/reference/syntax/sqlbindparameter-function.md), [SQLParamData](../../../odbc/reference/syntax/sqlparamdata-function.md), [SQLPutData](../../../odbc/reference/syntax/sqlputdata-function.md), and [Sending Long Data](../../../odbc/reference/develop-app/sending-long-data.md).  
     *   
     *  If **SQLExecDirect** executes a searched update, insert, or delete statement that does not affect any rows at the data source, the call to **SQLExecDirect** returns SQL_NO_DATA.  
     *   
     *  If the value of the SQL_ATTR_PARAMSET_SIZE statement attribute is greater than 1 and the SQL statement contains at least one parameter marker, **SQLExecDirect** will execute the SQL statement once for each set of parameter values from the arrays pointed to by the *ParameterValuePointer* argument in the call to **SQLBindParameter**. For more information, see [Arrays of Parameter Values](../../../odbc/reference/develop-app/arrays-of-parameter-values.md).  
     *   
     *  If bookmarks are turned on and a query is executed that cannot support bookmarks, the driver should attempt to coerce the environment to one that supports bookmarks by changing an attribute value and returning SQLSTATE 01S02 (Option value changed). If the attribute cannot be changed, the driver should return SQLSTATE HY024 (Invalid attribute value).  
     *   
     * > [!NOTE]  
     * >  When using connection pooling, an application must not execute SQL statements that change the database or the context of the database, such as the **USE** _database_ statement in SQL Server, which changes the catalog used by a data source.
     * @param {Pointer<Void>} StatementHandle [Input] Statement handle.
     * @param {Pointer<Byte>} StatementText [Input] SQL statement to be executed.
     * @param {Integer} TextLength [Input] Length of **StatementText* in characters.
     * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_NEED_DATA, SQL_STILL_EXECUTING, SQL_ERROR, SQL_NO_DATA, SQL_INVALID_HANDLE, or SQL_PARAM_DATA_AVAILABLE.
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlexecdirect-function
     */
    static SQLExecDirect(StatementHandle, StatementText, TextLength) {
        result := DllCall("ODBC32.dll\SQLExecDirect", "ptr", StatementHandle, "ptr", StatementText, "int", TextLength, "short")
        return result
    }

    /**
     * SQLExecute Function
     * @remarks
     * **SQLExecute** executes a statement prepared by **SQLPrepare**. After the application processes or discards the results from a call to **SQLExecute**, the application can call **SQLExecute** again with new parameter values. For more information about prepared execution, see [Prepared Execution](../../../odbc/reference/develop-app/prepared-execution-odbc.md).  
     *   
     *  To execute a **SELECT** statement more than once, the application must call **SQLCloseCursor** before reexecuting the **SELECT** statement.  
     *   
     *  If the data source is in manual-commit mode (requiring explicit transaction initiation) and a transaction has not already been initiated, the driver initiates a transaction before it sends the SQL statement. For more information, see [Transactions](../../../odbc/reference/develop-app/transactions-odbc.md).  
     *   
     *  If an application uses **SQLPrepare** to prepare and **SQLExecute** to submit a **COMMIT** or **ROLLBACK** statement, it will not be interoperable between DBMS products. To commit or roll back a transaction, call **SQLEndTran**.  
     *   
     *  If **SQLExecute** encounters a data-at-execution parameter, it returns SQL_NEED_DATA. The application sends the data using **SQLParamData** and **SQLPutData**. See [SQLBindParameter](../../../odbc/reference/syntax/sqlbindparameter-function.md), [SQLParamData](../../../odbc/reference/syntax/sqlparamdata-function.md), [SQLPutData](../../../odbc/reference/syntax/sqlputdata-function.md), and [Sending Long Data](../../../odbc/reference/develop-app/sending-long-data.md).  
     *   
     *  If **SQLExecute** executes a searched update, insert, or delete statement that does not affect any rows at the data source, the call to **SQLExecute** returns SQL_NO_DATA.  
     *   
     *  If the value of the SQL_ATTR_PARAMSET_SIZE statement attribute is greater than 1 and the SQL statement contains at least one parameter marker, **SQLExecute** executes the SQL statement once for each set of parameter values in the arrays pointed to by the *\*ParameterValuePtr* argument in the calls to **SQLBindParameter**. For more information, see [Arrays of Parameter Values](../../../odbc/reference/develop-app/arrays-of-parameter-values.md).  
     *   
     *  If bookmarks are enabled and a query is executed that cannot support bookmarks, the driver should attempt to coerce the environment to one that supports bookmarks by changing an attribute value and returning SQLSTATE 01S02 (Option value changed). If the attribute cannot be changed, the driver should return SQLSTATE HY024 (Invalid attribute value).  
     *   
     * > [!NOTE]  
     * >  When using connection pooling, an application must not execute SQL statements that change the database or the context of the database, such as the **USE** _database_ statement in SQL Server, which changes the catalog used by a data source.
     * @param {Pointer<Void>} StatementHandle [Input] Statement handle.
     * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_NEED_DATA, SQL_STILL_EXECUTING, SQL_ERROR, SQL_NO_DATA, SQL_INVALID_HANDLE, or SQL_PARAM_DATA_AVAILABLE.
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlexecute-function
     */
    static SQLExecute(StatementHandle) {
        result := DllCall("ODBC32.dll\SQLExecute", "ptr", StatementHandle, "short")
        return result
    }

    /**
     * SQLFetch Function
     * @remarks
     * **SQLFetch** returns the next rowset in the result set. It can be called only while a result set exists: that is, after a call that creates a result set and before the cursor over that result set is closed. If any columns are bound, it returns the data in those columns. If the application has specified a pointer to a row status array or a buffer in which to return the number of rows fetched, **SQLFetch** also returns this information. Calls to **SQLFetch** can be mixed with calls to **SQLFetchScroll** but cannot be mixed with calls to **SQLExtendedFetch**. For more information, see [Fetching a Row of Data](../../../odbc/reference/develop-app/fetching-a-row-of-data.md).  
     *   
     *  If an ODBC 3*.x* application works with an ODBC 2*.x* driver, the Driver Manager maps **SQLFetch** calls to **SQLExtendedFetch** for an ODBC 2*.x* driver that supports **SQLExtendedFetch**. If the ODBC 2*.x* driver does not support **SQLExtendedFetch**, the Driver Manager maps **SQLFetch** calls to **SQLFetch** in the ODBC 2*.x* driver, which can fetch only a single row.  
     *   
     *  For more information, see [Block Cursors, Scrollable Cursors, and Backward Compatibility](../../../odbc/reference/appendixes/block-cursors-scrollable-cursors-and-backward-compatibility.md) in Appendix G: Driver Guidelines for Backward Compatibility.
     * @param {Pointer<Void>} StatementHandle [Input] Statement handle.
     * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_NO_DATA, SQL_STILL_EXECUTING, SQL_ERROR, or SQL_INVALID_HANDLE.
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlfetch-function
     */
    static SQLFetch(StatementHandle) {
        result := DllCall("ODBC32.dll\SQLFetch", "ptr", StatementHandle, "short")
        return result
    }

    /**
     * SQLFreeConnect Function
     * @param {Pointer<Void>} ConnectionHandle 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlfreeconnect-function
     */
    static SQLFreeConnect(ConnectionHandle) {
        result := DllCall("ODBC32.dll\SQLFreeConnect", "ptr", ConnectionHandle, "short")
        return result
    }

    /**
     * SQLFreeEnv Function
     * @param {Pointer<Void>} EnvironmentHandle 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlfreeenv-function
     */
    static SQLFreeEnv(EnvironmentHandle) {
        result := DllCall("ODBC32.dll\SQLFreeEnv", "ptr", EnvironmentHandle, "short")
        return result
    }

    /**
     * SQLFreeHandle Function
     * @remarks
     * **SQLFreeHandle** is used to free handles for environments, connections, statements, and descriptors, as described in the following sections. For general information about handles, see [Handles](../../../odbc/reference/develop-app/handles.md).  
     *   
     *  An application should not use a handle after it has been freed; the Driver Manager does not check the validity of a handle in a function call.
     * @param {Integer} HandleType [Input] The type of handle to be freed by **SQLFreeHandle**. Must be one of the following values:  
     *   
     * -   SQL_HANDLE_DBC  
     *   
     * -   SQL_HANDLE_DBC_INFO_TOKEN  
     *   
     * -   SQL_HANDLE_DESC  
     *   
     * -   SQL_HANDLE_ENV  
     *   
     * -   SQL_HANDLE_STMT  
     *   
     *  SQL_HANDLE_DBC_INFO_TOKEN handle is used only by the Driver Manager and driver. Applications should not use this handle type. For more information about SQL_HANDLE_DBC_INFO_TOKEN, see [Developing Connection-Pool Awareness in an ODBC Driver](../../../odbc/reference/develop-driver/developing-connection-pool-awareness-in-an-odbc-driver.md).  
     *   
     *  If *HandleType* is not one of these values, **SQLFreeHandle** returns SQL_INVALID_HANDLE.
     * @param {Pointer<Void>} Handle [Input] The handle to be freed.
     * @returns {Integer} SQL_SUCCESS, SQL_ERROR, or SQL_INVALID_HANDLE.  
     *   
     *  If **SQLFreeHandle** returns SQL_ERROR, the handle is still valid.
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlfreehandle-function
     */
    static SQLFreeHandle(HandleType, Handle) {
        result := DllCall("ODBC32.dll\SQLFreeHandle", "short", HandleType, "ptr", Handle, "short")
        return result
    }

    /**
     * SQLFreeStmt Function
     * @remarks
     * Calling **SQLFreeStmt** with the SQL_CLOSE option is equivalent to calling **SQLCloseCursor**, except that **SQLFreeStmt** with SQL_CLOSE does not affect the application if no cursor is open on the statement. If no cursor is open, a call to **SQLCloseCursor** returns SQLSTATE 24000 (Invalid cursor state).  
     *   
     *  An application should not use a statement handle after it has been freed; the Driver Manager does not check the validity of a handle in a function call.
     * @param {Pointer<Void>} StatementHandle [Input] Statement handle
     * @param {Integer} Option [Input] One of the following options:  
     *   
     *  SQL_ CLOSE: Closes the cursor associated with *StatementHandle* (if one was defined) and discards all pending results. The application can reopen this cursor later by executing a **SELECT** statement again with the same or different parameter values. If no cursor is open, this option has no effect for the application. **SQLCloseCursor** can also be called to close a cursor. For more information, see [Closing the Cursor](../../../odbc/reference/develop-app/closing-the-cursor.md).  
     *   
     *  SQL_DROP: This option is deprecated. A call to **SQLFreeStmt** with an *Option* of SQL_DROP is mapped in the Driver Manager to [SQLFreeHandle](../../../odbc/reference/syntax/sqlfreehandle-function.md).  
     *   
     *  SQL_UNBIND: Sets the SQL_DESC_COUNT field of the ARD to 0, releasing all column buffers bound by **SQLBindCol** for the given *StatementHandle*. This does not unbind the bookmark column; to do that, the SQL_DESC_DATA_PTR field of the ARD for the bookmark column is set to NULL. Notice that if this operation is performed on an explicitly allocated descriptor that is shared by more than one statement, the operation will affect the bindings of all statements that share the descriptor. For more information, see [Overview of Retrieving Results (Basic)](../../../odbc/reference/develop-app/retrieving-results-basic.md).  
     *   
     *  SQL_RESET_PARAMS: Sets the SQL_DESC_COUNT field of the APD to 0, releasing all parameter buffers set by **SQLBindParameter** for the given *StatementHandle*. If this operation is performed on an explicitly allocated descriptor that is shared by more than one statement, this operation will affect the bindings of all the statements that share the descriptor. For more information, see [Binding Parameters](../../../odbc/reference/develop-app/binding-parameters-odbc.md).
     * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_ERROR, or SQL_INVALID_HANDLE.
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlfreestmt-function
     */
    static SQLFreeStmt(StatementHandle, Option) {
        result := DllCall("ODBC32.dll\SQLFreeStmt", "ptr", StatementHandle, "ushort", Option, "short")
        return result
    }

    /**
     * SQLGetConnectAttr Function
     * @remarks
     * For general information about connection attributes, see [Connection Attributes](../../../odbc/reference/develop-app/connection-attributes.md).  
     *   
     *  For a list of attributes that can be set, see [SQLSetConnectAttr](../../../odbc/reference/syntax/sqlsetconnectattr-function.md). Notice that if *Attribute* specifies an attribute that returns a string, *ValuePtr* must be a pointer to a buffer for the string. The maximum length of the returned string, including the null-termination character, will be *BufferLength* bytes.  
     *   
     *  Depending on the attribute, an application does not have to establish a connection before calling **SQLGetConnectAttr**. However, if **SQLGetConnectAttr** is called and the specified attribute does not have a default and has not been set by a prior call to **SQLSetConnectAttr**, **SQLGetConnectAttr** will return SQL_NO_DATA.  
     *   
     *  If *Attribute* is SQL_ATTR_ TRACE or SQL_ATTR_ TRACEFILE, *ConnectionHandle* does not have to be valid, and **SQLGetConnectAttr** will not return SQL_ERROR or SQL_INVALID_HANDLE if *ConnectionHandle* is invalid. These attributes apply to all connections. **SQLGetConnectAttr** will return SQL_ERROR or SQL_INVALID_HANDLE if another argument is invalid.  
     *   
     *  Although an application can set statement attributes by using **SQLSetConnectAttr**, an application cannot use **SQLGetConnectAttr** to retrieve statement attribute values; it must call **SQLGetStmtAttr** to retrieve the setting of statement attributes.  
     *   
     *  Both SQL_ATTR_AUTO_IPD and SQL_ATTR_CONNECTION_DEAD connection attributes can be returned by a call to **SQLGetConnectAttr** but cannot be set by a call to **SQLSetConnectAttr**.  
     *   
     * > [!NOTE]  
     * >  There is no asynchronous support for **SQLGetConnectAttr**. When implementing **SQLGetConnectAttr**, a driver can improve performance by minimizing the number of times that information is sent or requested from the server.
     * @param {Pointer<Void>} ConnectionHandle [Input] Connection handle.
     * @param {Integer} Attribute [Input] Attribute to retrieve.
     * @param {Pointer<Void>} Value 
     * @param {Integer} BufferLength [Input] If *Attribute* is an ODBC-defined attribute and *ValuePtr* points to a character string or a binary buffer, this argument should be the length of \**ValuePtr*. If *Attribute* is an ODBC-defined attribute and *\*ValuePtr* is an integer, *BufferLength* is ignored. If the value in *\*ValuePtr* is a Unicode string (when calling **SQLGetConnectAttrW**), the *BufferLength* argument must be an even number.  
     *   
     *  If *Attribute* is a driver-defined attribute, the application indicates the nature of the attribute to the Driver Manager by setting the *BufferLength* argument. *BufferLength* can have the following values:  
     *   
     * -   If *\*ValuePtr* is a pointer to a character string, *BufferLength* is the length of the string.  
     *   
     * -   If *\*ValuePtr* is a pointer to a binary buffer, the application places the result of the SQL_LEN_BINARY_ATTR(*length*) macro in *BufferLength*. This places a negative value in *BufferLength*.  
     *   
     * -   If *\*ValuePtr* is a pointer to a value other than a character string or binary string, *BufferLength* should have the value SQL_IS_POINTER.  
     *   
     * -   If *\*ValuePtr* contains a fixed-length data type, *BufferLength* is either SQL_IS_INTEGER or SQL_IS_UINTEGER, as appropriate.
     * @param {Pointer<Int32>} StringLengthPtr [Output] A pointer to a buffer in which to return the total number of bytes (excluding the null-termination character) available to return in \**ValuePtr*. If the attribute value is a character string and the number of bytes available to return is greater than *BufferLength* minus the length of the null-termination character, the data in *\*ValuePtr* is truncated to *BufferLength* minus the length of the null-termination character and is null-terminated by the driver.
     * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_NO_DATA, SQL_ERROR, or SQL_INVALID_HANDLE.
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlgetconnectattr-function
     */
    static SQLGetConnectAttr(ConnectionHandle, Attribute, Value, BufferLength, StringLengthPtr) {
        result := DllCall("ODBC32.dll\SQLGetConnectAttr", "ptr", ConnectionHandle, "int", Attribute, "ptr", Value, "int", BufferLength, "ptr", StringLengthPtr, "short")
        return result
    }

    /**
     * SQLGetConnectOption Function
     * @param {Pointer<Void>} ConnectionHandle 
     * @param {Integer} Option 
     * @param {Pointer<Void>} Value 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlgetconnectoption-function
     * @deprecated
     */
    static SQLGetConnectOption(ConnectionHandle, Option, Value) {
        result := DllCall("ODBC32.dll\SQLGetConnectOption", "ptr", ConnectionHandle, "ushort", Option, "ptr", Value, "short")
        return result
    }

    /**
     * SQLGetCursorName Function
     * @remarks
     * Cursor names are used only in positioned update and delete statements (for example, **UPDATE** _table-name_ ...**WHERE CURRENT OF** _cursor-name_). For more information, see [Positioned Update and Delete Statements](../../../odbc/reference/develop-app/positioned-update-and-delete-statements.md). If the application does not call **SQLSetCursorName** to define a cursor name, the driver generates a name. This name begins with the letters SQL_CUR.  
     *   
     * > [!NOTE]
     * >  In ODBC 2*.x*, when there was no open cursor and no name had been set by a call to **SQLSetCursorName**, a call to **SQLGetCursorName** returned SQLSTATE HY015 (No cursor name available). In ODBC 3*.x*, this is no longer true; regardless of when **SQLGetCursorName** is called, the driver returns the cursor name.  
     *   
     *  **SQLGetCursorName** returns the name of a cursor whether or not the name was created explicitly or implicitly. A cursor name is implicitly generated if **SQLSetCursorName** is not called. **SQLSetCursorName** can be called to rename a cursor on a statement as long as the cursor is in an allocated or prepared state.  
     *   
     *  A cursor name that is set either explicitly or implicitly remains set until the *StatementHandle* with which it is associated is dropped, using **SQLFreeHandle** with a *HandleType* of SQL_HANDLE_STMT.
     * @param {Pointer<Void>} StatementHandle [Input] Statement handle.
     * @param {Pointer<Byte>} CursorName [Output] Pointer to a buffer in which to return the cursor name.  
     *   
     *  If *CursorName* is NULL, *NameLengthPtr* will still return the total number of characters (excluding the null-termination character for character data) available to return in the buffer pointed to by *CursorName*.
     * @param {Integer} BufferLength [Input] Length of \**CursorName*, in characters.
     * @param {Pointer<Int16>} NameLengthPtr [Output] Pointer to memory in which to return the total number of characters (excluding the null-termination character) available to return in \**CursorName*. If the number of characters available to return is greater than or equal to *BufferLength*, the cursor name in \**CursorName* is truncated to *BufferLength* minus the length of a null-termination character.
     * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_ERROR, or SQL_INVALID_HANDLE.
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlgetcursorname-function
     */
    static SQLGetCursorName(StatementHandle, CursorName, BufferLength, NameLengthPtr) {
        result := DllCall("ODBC32.dll\SQLGetCursorName", "ptr", StatementHandle, "ptr", CursorName, "short", BufferLength, "ptr", NameLengthPtr, "short")
        return result
    }

    /**
     * SQLGetDescField Function
     * @remarks
     * An application can call **SQLGetDescField** to return the value of a single field of a descriptor record. A call to **SQLGetDescField** can return the setting of any field in any descriptor type, including header fields, record fields, and bookmark fields. An application can obtain the settings of multiple fields in the same or different descriptors, in arbitrary order, by making repeated calls to **SQLGetDescField**. **SQLGetDescField** can also be called to return driver-defined descriptor fields.  
     *   
     *  For performance reasons, an application should not call **SQLGetDescField** for an IRD before executing a statement.  
     *   
     *  The settings of multiple fields that describe the name, data type, and storage of column or parameter data can also be retrieved in a single call to **SQLGetDescRec**. **SQLGetStmtAttr** can be called to return the setting of a single field in the descriptor header that is also a statement attribute. **SQLColAttribute**, **SQLDescribeCol**, and **SQLDescribeParam** return record or bookmark fields.  
     *   
     *  When an application calls **SQLGetDescField** to retrieve the value of a field that is undefined for a particular descriptor type, the function returns SQL_SUCCESS but the value returned for the field is undefined. For example, calling **SQLGetDescField** for the SQL_DESC_NAME or SQL_DESC_NULLABLE field of an APD or ARD will return SQL_SUCCESS but an undefined value for the field.  
     *   
     *  When an application calls **SQLGetDescField** to retrieve the value of a field that is defined for a particular descriptor type but that has no default value and has not been set yet, the function returns SQL_SUCCESS but the value returned for the field is undefined. For more information on the initialization of descriptor fields and descriptions of the fields, see "Initialization of Descriptor Fields" in [SQLSetDescField](../../../odbc/reference/syntax/sqlsetdescfield-function.md). For more information on descriptors, see [Descriptors](../../../odbc/reference/develop-app/descriptors.md).
     * @param {Pointer<Void>} DescriptorHandle [Input] Descriptor handle.
     * @param {Integer} RecNumber [Input] Indicates the descriptor record from which the application seeks information. Descriptor records are numbered from 0, with record number 0 being the bookmark record. If the *FieldIdentifier* argument indicates a header field, *RecNumber* is ignored. If *RecNumber* is less than or equal to SQL_DESC_COUNT but the row does not contain data for a column or parameter, a call to **SQLGetDescField** will return the default values of the fields. (For more information, see "Initialization of Descriptor Fields" in [SQLSetDescField](../../../odbc/reference/syntax/sqlsetdescfield-function.md).)
     * @param {Integer} FieldIdentifier [Input] Indicates the field of the descriptor whose value is to be returned. For more information, see the "*FieldIdentifier* Argument" section in [SQLSetDescField](../../../odbc/reference/syntax/sqlsetdescfield-function.md).
     * @param {Pointer<Void>} Value 
     * @param {Integer} BufferLength [Input] If *FieldIdentifier* is an ODBC-defined field and *ValuePtr* points to a character string or a binary buffer, this argument should be the length of \**ValuePtr*. If *FieldIdentifier* is an ODBC-defined field and \**ValuePtr* is an integer, *BufferLength* is ignored. If the value in *\*ValuePtr* is of a Unicode data type (when calling **SQLGetDescFieldW**), the *BufferLength* argument must be an even number.  
     *   
     *  If *FieldIdentifier* is a driver-defined field, the application indicates the nature of the field to the Driver Manager by setting the *BufferLength* argument. *BufferLength* can have the following values:  
     *   
     * -   If *\*ValuePtr* is a pointer to a character string, then *BufferLength* is the length of the string or SQL_NTS.  
     *   
     * -   If *\*ValuePtr* is a pointer to a binary buffer, then the application places the result of the SQL_LEN_BINARY_ATTR(*length*) macro in *BufferLength*. This places a negative value in *BufferLength*.  
     *   
     * -   If *\*ValuePtr* is a pointer to a value other than a character string or binary string, then *BufferLength* should have the value SQL_IS_POINTER.  
     *   
     * -   If *\*ValuePtr* is contains a fixed-length data type, then *BufferLength* is either SQL_IS_INTEGER, SQL_IS_UINTEGER, SQL_IS_SMALLINT, or SQL_IS_USMALLINT, as appropriate.
     * @param {Pointer<Int32>} StringLength 
     * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_ERROR, SQL_NO_DATA, or SQL_INVALID_HANDLE.  
     *   
     *  SQL_NO_DATA is returned if *RecNumber* is greater than the current number of descriptor records.  
     *   
     *  SQL_NO_DATA is returned if *DescriptorHandle* is an IRD handle and the statement is in the prepared or executed state but there was no open cursor associated with it.
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlgetdescfield-function
     */
    static SQLGetDescField(DescriptorHandle, RecNumber, FieldIdentifier, Value, BufferLength, StringLength) {
        result := DllCall("ODBC32.dll\SQLGetDescField", "ptr", DescriptorHandle, "short", RecNumber, "short", FieldIdentifier, "ptr", Value, "int", BufferLength, "ptr", StringLength, "short")
        return result
    }

    /**
     * SQLGetDiagField Function
     * @remarks
     * An application typically calls **SQLGetDiagField** to accomplish one of three goals:  
     *   
     * 1.  To obtain specific error or warning information when a function call has returned SQL_ERROR or SQL_SUCCESS_WITH_INFO (or SQL_NEED_DATA for the **SQLBrowseConnect** function).  
     *   
     * 2.  To determine the number of rows in the data source that were affected when insert, delete, or update operations were performed with a call to **SQLExecute**, **SQLExecDirect**, **SQLBulkOperations**, or **SQLSetPos** (from the SQL_DIAG_ROW_COUNT header field), or to determine the number of rows that exist in the current open cursor, if the driver can provide this information (from the SQL_DIAG_CURSOR_ROW_COUNT header field).  
     *   
     * 3.  To determine which function was executed by a call to **SQLExecDirect** or **SQLExecute** (from the SQL_DIAG_DYNAMIC_FUNCTION and SQL_DIAG_DYNAMIC_FUNCTION_CODE header fields).  
     *   
     *  Any ODBC function can post zero or more diagnostic records every time that it is called, so an application can call **SQLGetDiagField** after any ODBC function call. There is no limit to the number of diagnostic records that can be stored at any one time. **SQLGetDiagField** retrieves only the diagnostic information most recently associated with the diagnostic data structure specified in the *Handle* argument. If the application calls an ODBC function other than **SQLGetDiagField** or **SQLGetDiagRec**, any diagnostic information from a previous call with the same handle is lost.  
     *   
     *  An application can scan all diagnostic records by incrementing *RecNumber*, as long as **SQLGetDiagField** returns SQL_SUCCESS. The number of status records is indicated in the SQL_DIAG_NUMBER header field. Calls to **SQLGetDiagField** are nondestructive to the header and record fields. The application can call **SQLGetDiagField** again later to retrieve a field from a record, as long as a function other than the diagnostic functions has not been called in the interim, which would post records on the same handle.  
     *   
     *  An application can call **SQLGetDiagField** to return any diagnostic field at any time, except for SQL_DIAG_CURSOR_ROW_COUNT or SQL_DIAG_ROW_COUNT, which will return SQL_ERROR if *Handle* is not a statement handle. If any other diagnostic field is undefined, the call to **SQLGetDiagField** will return SQL_SUCCESS (provided no other diagnostic is encountered) and an undefined value is returned for the field.  
     *   
     *  For more information, see [Using SQLGetDiagRec and SQLGetDiagField](../../../odbc/reference/develop-app/using-sqlgetdiagrec-and-sqlgetdiagfield.md) and [Implementing SQLGetDiagRec and SQLGetDiagField](../../../odbc/reference/develop-app/implementing-sqlgetdiagrec-and-sqlgetdiagfield.md).  
     *   
     *  Calling an API other than the one that's being executed asynchronously will generate HY010 "Function sequence error". However, the error record cannot be retrieved before the asynchronous operation completes.
     * @param {Integer} HandleType [Input] A handle type identifier that describes the type of handle for which diagnostics are required. Must be one of the following:  
     *   
     * -   SQL_HANDLE_DBC  
     *   
     * -   SQL_HANDLE_DBC_INFO_TOKEN  
     *   
     * -   SQL_HANDLE_DESC  
     *   
     * -   SQL_HANDLE_ENV  
     *   
     * -   SQL_HANDLE_STMT  
     *   
     *  SQL_HANDLE_DBC_INFO_TOKEN handle is used only by the Driver Manager and driver. Applications should not use this handle type. For more information about SQL_HANDLE_DBC_INFO_TOKEN, see [Developing Connection-Pool Awareness in an ODBC Driver](../../../odbc/reference/develop-driver/developing-connection-pool-awareness-in-an-odbc-driver.md).
     * @param {Pointer<Void>} Handle [Input] A handle for the diagnostic data structure, of the type indicated by *HandleType*. If *HandleType* is SQL_HANDLE_ENV, *Handle* can be either a shared or an unshared environment handle.
     * @param {Integer} RecNumber [Input] Indicates the status record from which the application seeks information. Status records are numbered from 1. If the *DiagIdentifier* argument indicates any field of the diagnostics header, *RecNumber* is ignored. If not, it should be more than 0.
     * @param {Integer} DiagIdentifier [Input] Indicates the field of the diagnostic whose value is to be returned. For more information, see the "*DiagIdentifier* Argument" section in "Comments."
     * @param {Pointer<Void>} DiagInfo 
     * @param {Integer} BufferLength [Input] If *DiagIdentifier* is an ODBC-defined diagnostic and *DiagInfoPtr* points to a character string or a binary buffer, this argument should be the length of \**DiagInfoPtr*. If *DiagIdentifier* is an ODBC-defined field and \**DiagInfoPtr* is an integer, *BufferLength* is ignored. If the value in *\*DiagInfoPtr* is a Unicode string (when calling **SQLGetDiagFieldW**), the *BufferLength* argument must be an even number.  
     *   
     *  If *DiagIdentifier* is a driver-defined field, the application indicates the nature of the field to the Driver Manager by setting the *BufferLength* argument. *BufferLength* can have the following values:  
     *   
     * -   If *DiagInfoPtr* is a pointer to a character string, *BufferLength* is the length of the string or SQL_NTS.  
     *   
     * -   If *DiagInfoPtr* is a pointer to a binary buffer, the application places the result of the SQL_LEN_BINARY_ATTR(*length*) macro in *BufferLength*. This places a negative value in *BufferLength*.  
     *   
     * -   If *DiagInfoPtr* is a pointer to a value other than a character string or binary string, *BufferLength* should have the value SQL_IS_POINTER.  
     *   
     * -   If *\*DiagInfoPtr* contains a fixed-length data type, *BufferLength* is SQL_IS_INTEGER, SQL_IS_UINTEGER, SQL_IS_SMALLINT, or SQL_IS_USMALLINT, as appropriate.
     * @param {Pointer<Int16>} StringLength 
     * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_ERROR, SQL_INVALID_HANDLE, or SQL_NO_DATA.
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlgetdiagfield-function
     */
    static SQLGetDiagField(HandleType, Handle, RecNumber, DiagIdentifier, DiagInfo, BufferLength, StringLength) {
        result := DllCall("ODBC32.dll\SQLGetDiagField", "short", HandleType, "ptr", Handle, "short", RecNumber, "short", DiagIdentifier, "ptr", DiagInfo, "short", BufferLength, "ptr", StringLength, "short")
        return result
    }

    /**
     * SQLGetDiagRec Function
     * @remarks
     * An application typically calls **SQLGetDiagRec** when a previous call to an ODBC function has returned SQL_ERROR or SQL_SUCCESS_WITH_INFO. However, because any ODBC function can post zero or more diagnostic records each time it is called, an application can call **SQLGetDiagRec** after any ODBC function call. An application can call **SQLGetDiagRec** multiple times to return some or all of the records in the diagnostic data structure. ODBC imposes no limit to the number of diagnostic records that can be stored at any one time.  
     *   
     *  **SQLGetDiagRec** cannot be used to return fields from the header of the diagnostic data structure. (The *RecNumber* argument must be greater than 0.) The application should call **SQLGetDiagField** for this purpose.  
     *   
     *  **SQLGetDiagRec** retrieves only the diagnostic information most recently associated with the handle specified in the *Handle* argument. If the application calls another ODBC function, except **SQLGetDiagRec**, **SQLGetDiagField**, or **SQLError**, any diagnostic information from the previous calls on the same handle is lost.  
     *   
     *  An application can scan all diagnostic records by looping, incrementing *RecNumber*, as long as **SQLGetDiagRec** returns SQL_SUCCESS. Calls to **SQLGetDiagRec** are nondestructive to the header and record fields. The application can call **SQLGetDiagRec** again at a later time to retrieve a field from a record as long as no other function, except **SQLGetDiagRec**, **SQLGetDiagField**, or **SQLError**, has been called in the interim. The application can also retrieve a count of the total number of diagnostic records available by calling **SQLGetDiagField** to retrieve the value of the SQL_DIAG_NUMBER field, and then calling **SQLGetDiagRec** that many times.  
     *   
     *  For a description of the fields of the diagnostic data structure, see [SQLGetDiagField](../../../odbc/reference/syntax/sqlgetdiagfield-function.md). For more information, see [Using SQLGetDiagRec and SQLGetDiagField](../../../odbc/reference/develop-app/using-sqlgetdiagrec-and-sqlgetdiagfield.md) and [Implementing SQLGetDiagRec and SQLGetDiagField](../../../odbc/reference/develop-app/implementing-sqlgetdiagrec-and-sqlgetdiagfield.md).  
     *   
     *  Calling an API other than the one that's being executed asynchronously will generate HY010 "Function sequence error". However, the error record cannot be retrieved before the asynchronous operation completes.
     * @param {Integer} HandleType [Input] A handle type identifier that describes the type of handle for which diagnostics are required. Must be one of the following:  
     *   
     * -   SQL_HANDLE_DBC  
     *   
     * -   SQL_HANDLE_DBC_INFO_TOKEN  
     *   
     * -   SQL_HANDLE_DESC  
     *   
     * -   SQL_HANDLE_ENV  
     *   
     * -   SQL_HANDLE_STMT  
     *   
     *  SQL_HANDLE_DBC_INFO_TOKEN handle is used only by the Driver Manager and driver. Applications should not use this handle type. For more information about SQL_HANDLE_DBC_INFO_TOKEN, see [Developing Connection-Pool Awareness in an ODBC Driver](../../../odbc/reference/develop-driver/developing-connection-pool-awareness-in-an-odbc-driver.md).
     * @param {Pointer<Void>} Handle [Input] A handle for the diagnostic data structure, of the type indicated by *HandleType*. If *HandleType* is SQL_HANDLE_ENV, *Handle* can be either a shared or an unshared environment handle.
     * @param {Integer} RecNumber [Input] Indicates the status record from which the application seeks information. Status records are numbered from 1.
     * @param {Pointer<Byte>} Sqlstate 
     * @param {Pointer<Int32>} NativeError 
     * @param {Pointer<Byte>} MessageText [Output] Pointer to a buffer in which to return the diagnostic message text string. This information is contained in the SQL_DIAG_MESSAGE_TEXT diagnostic field. For the format of the string, see [Diagnostic Messages](../../../odbc/reference/develop-app/diagnostic-messages.md).  
     *   
     *  If *MessageText* is NULL, *TextLengthPtr* will still return the total number of characters (excluding the null-termination character for character data) available to return in the buffer pointed to by *MessageText*.
     * @param {Integer} BufferLength [Input] Length of the **MessageText* buffer in characters. There is no maximum length of the diagnostic message text.
     * @param {Pointer<Int16>} TextLength 
     * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_ERROR, SQL_NO_DATA, or SQL_INVALID_HANDLE.
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlgetdiagrec-function
     */
    static SQLGetDiagRec(HandleType, Handle, RecNumber, Sqlstate, NativeError, MessageText, BufferLength, TextLength) {
        result := DllCall("ODBC32.dll\SQLGetDiagRec", "short", HandleType, "ptr", Handle, "short", RecNumber, "ptr", Sqlstate, "ptr", NativeError, "ptr", MessageText, "short", BufferLength, "ptr", TextLength, "short")
        return result
    }

    /**
     * SQLGetEnvAttr Function
     * @remarks
     * For a list of attributes, see [SQLSetEnvAttr](../../../odbc/reference/syntax/sqlsetenvattr-function.md). There are no driver-specific environment attributes. If *Attribute* specifies an attribute that returns a string, *ValuePtr* must be a pointer to a buffer in which to return the string. The maximum length of the string, including the null-termination byte, will be *BufferLength* bytes.  
     *   
     *  **SQLGetEnvAttr** can be called at any time between the allocation and the freeing of an environment handle. All environment attributes successfully set by the application for the environment persist until **SQLFreeHandle** is called on the *EnvironmentHandle* with a *HandleType* of SQL_HANDLE_ENV. More than one environment handle can be allocated simultaneously in ODBC 3*.x*. An environment attribute on one environment is not affected when another environment has been allocated.  
     *   
     * > [!NOTE]
     * >  The SQL_ATTR_OUTPUT_NTS environment attribute is supported by standards-compliant applications. When **SQLGetEnvAttr** is called, the ODBC 3*.x* Driver Manager always returns SQL_TRUE for this attribute. SQL_ATTR_OUTPUT_NTS can be set to SQL_TRUE only by a call to **SQLSetEnvAttr**.
     * @param {Pointer<Void>} EnvironmentHandle [Input] Environment handle.
     * @param {Integer} Attribute [Input] Attribute to retrieve.
     * @param {Pointer<Void>} Value 
     * @param {Integer} BufferLength [Input] If *ValuePtr* points to a character string, this argument should be the length of \**ValuePtr*. If \**ValuePtr* is an integer, *BufferLength* is ignored. If *\*ValuePtr* is a Unicode string (when calling **SQLGetEnvAttrW**), the *BufferLength* argument must be an even number. If the attribute value is not a character string, *BufferLength* is unused.
     * @param {Pointer<Int32>} StringLength 
     * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_NO_DATA, SQL_ERROR, or SQL_INVALID_HANDLE.
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlgetenvattr-function
     */
    static SQLGetEnvAttr(EnvironmentHandle, Attribute, Value, BufferLength, StringLength) {
        result := DllCall("ODBC32.dll\SQLGetEnvAttr", "ptr", EnvironmentHandle, "int", Attribute, "ptr", Value, "int", BufferLength, "ptr", StringLength, "short")
        return result
    }

    /**
     * SQLGetFunctions Function
     * @remarks
     * **SQLGetFunctions** always returns that **SQLGetFunctions**, **SQLDataSources**, and **SQLDrivers** are supported. It does this because these functions are implemented in the Driver Manager. The Driver Manager will map an ANSI function to the corresponding Unicode function if the Unicode function exists and will map a Unicode function to the corresponding ANSI function if the ANSI function exists. For information about how applications use **SQLGetFunctions**, see [Interface Conformance Levels](../../../odbc/reference/develop-app/interface-conformance-levels.md).  
     *   
     *  The following is a list of valid values for *FunctionId* for functions that conform to the ISO 92 standards-compliance level:  
     *   
     * |FunctionId Value|FunctionId Value|  
     * |----------|----------|  
     * |SQL_API_SQLALLOCHANDLE|SQL_API_SQLGETDESCFIELD|  
     * |SQL_API_SQLBINDCOL|SQL_API_SQLGETDESCREC|  
     * |SQL_API_SQLCANCEL|SQL_API_SQLGETDIAGFIELD|  
     * |SQL_API_SQLCLOSECURSOR|SQL_API_SQLGETDIAGREC|  
     * |SQL_API_SQLCOLATTRIBUTE|SQL_API_SQLGETENVATTR|  
     * |SQL_API_SQLCONNECT|SQL_API_SQLGETFUNCTIONS|  
     * |SQL_API_SQLCOPYDESC|SQL_API_SQLGETINFO|  
     * |SQL_API_SQLDATASOURCES|SQL_API_SQLGETSTMTATTR|  
     * |SQL_API_SQLDESCRIBECOL|SQL_API_SQLGETTYPEINFO|  
     * |SQL_API_SQLDISCONNECT|SQL_API_SQLNUMRESULTCOLS|  
     * |SQL_API_SQLDRIVERS|SQL_API_SQLPARAMDATA|  
     * |SQL_API_SQLENDTRAN|SQL_API_SQLPREPARE|  
     * |SQL_API_SQLEXECDIRECT|SQL_API_SQLPUTDATA|  
     * |SQL_API_SQLEXECUTE|SQL_API_SQLROWCOUNT|  
     * |SQL_API_SQLFETCH|SQL_API_SQLSETCONNECTATTR|  
     * |SQL_API_SQLFETCHSCROLL|SQL_API_SQLSETCURSORNAME|  
     * |SQL_API_SQLFREEHANDLE|SQL_API_SQLSETDESCFIELD|  
     * |SQL_API_SQLFREESTMT|SQL_API_SQLSETDESCREC|  
     * |SQL_API_SQLGETCONNECTATTR|SQL_API_SQLSETENVATTR|  
     * |SQL_API_SQLGETCURSORNAME|SQL_API_SQLSETSTMTATTR|  
     * |SQL_API_SQLGETDATA| |  
     *   
     *  The following is a list of valid values for *FunctionId* for functions conforming to the Open Group standards-compliance level:  
     *   
     * |FunctionId Value|FunctionId Value|  
     * |-|-|  
     * |SQL_API_SQLCOLUMNS|SQL_API_SQLSTATISTICS|  
     * |SQL_API_SQLSPECIALCOLUMNS|SQL_API_SQLTABLES|  
     *   
     *  The following is a list of valid values for *FunctionId* for functions conforming to the ODBC standards-compliance level.  
     *   
     * |FunctionId Value|FunctionId Value|  
     * |-|-|  
     * |SQL_API_SQLBINDPARAMETER|SQL_API_SQLNATIVESQL|  
     * |SQL_API_SQLBROWSECONNECT|SQL_API_SQLNUMPARAMS|  
     * |SQL_API_SQLBULKOPERATIONS[1]|SQL_API_SQLPRIMARYKEYS|  
     * |SQL_API_SQLCOLUMNPRIVILEGES|SQL_API_SQLPROCEDURECOLUMNS|  
     * |SQL_API_SQLDESCRIBEPARAM|SQL_API_SQLPROCEDURES|  
     * |SQL_API_SQLDRIVERCONNECT|SQL_API_SQLSETPOS|  
     * |SQL_API_SQLFOREIGNKEYS|SQL_API_SQLTABLEPRIVILEGES|  
     * |SQL_API_SQLMORERESULTS| |  
     *   
     *  [1]   When working with an ODBC 2*.x* driver, **SQLBulkOperations** will be returned as supported only if both of the following are true: the ODBC 2*.x* driver supports **SQLSetPos**, and the information type SQL_POS_OPERATIONS returns the SQL_POS_ADD bit as set.  
     *   
     *  The following is a list of valid values for *FunctionId* for functions introduced in ODBC 3.8 or later:  
     *   
     * |FunctionId Value|  
     * |-|  
     * |SQL_API_SQLCANCELHANDLE [2]|  
     *   
     *  [2]   **SQLCancelHandle** will be returned as supported only if the driver supports both **SQLCancel** and **SQLCancelHandle**. If **SQLCancel** is supported but **SQLCancelHandle** is not, the application can still call **SQLCancelHandle** on a statement handle, because it will be mapped to **SQLCancel**.
     * @param {Pointer<Void>} ConnectionHandle [Input] Connection handle.
     * @param {Integer} FunctionId [Input] A **#define** value that identifies the ODBC function of interest; **SQL_API_ODBC3_ALL_FUNCTIONS orSQL_API_ALL_FUNCTIONS**. **SQL_API_ODBC3_ALL_FUNCTIONS** is used by an ODBC 3*.x* application to determine support of ODBC 3*.x* and earlier functions. **SQL_API_ALL_FUNCTIONS** is used by an ODBC 2*.x* application to determine support of ODBC 2*.x* and earlier functions.  
     *   
     *  For a list of **#define** values that identify ODBC functions, see the tables in "Comments."
     * @param {Pointer<UInt16>} Supported 
     * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_ERROR, or SQL_INVALID_HANDLE.
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlgetfunctions-function
     */
    static SQLGetFunctions(ConnectionHandle, FunctionId, Supported) {
        result := DllCall("ODBC32.dll\SQLGetFunctions", "ptr", ConnectionHandle, "ushort", FunctionId, "ptr", Supported, "short")
        return result
    }

    /**
     * SQLGetInfo Function
     * @remarks
     * The currently defined information types are shown in "Information Types," later in this section; it is expected that more will be defined to take advantage of different data sources. A range of information types is reserved by ODBC; driver developers must reserve values for their own driver-specific use from Open Group. **SQLGetInfo** performs no Unicode conversion or *thunking* (see [Appendix A: ODBC Error Codes](../appendixes/appendix-a-odbc-error-codes.md) of the *ODBC Programmer's Reference*) for driver-defined *InfoTypes*. For more information, see [Driver-Specific Data Types, Descriptor Types, Information Types, Diagnostic Types, and Attributes](../develop-app/driver-specific-data-types-descriptor-information-diagnostic.md). The format of the information returned in \**InfoValuePtr* depends on the *InfoType* requested. **SQLGetInfo** will return information in one of five different formats:  
     *   
     * - A null-terminated character string  
     *   
     * - An SQLUSMALLINT value  
     *   
     * - An SQLUINTEGER bitmask  
     *   
     * - An SQLUINTEGER value  
     *   
     * - A SQLUINTEGER binary value  
     *   
     *  The format of each of the following information types is noted in the type's description. The application must cast the value returned in **InfoValuePtr* accordingly. For an example of how an application could retrieve data from a SQLUINTEGER bitmask, see "Code Example."  
     *   
     *  A driver must return a value for each information type that is defined in the following tables. If an information type does not apply to the driver or data source, the driver returns one of the values listed in the following table.  
     * 
     * |Information type|Value|
     * |-|-|
     * |Character string ("Y" or "N")|"N"|
     * |Character string (not "Y" or "N")|Empty string|
     * |SQLUSMALLINT|0|
     * |SQLUINTEGER bitmask or SQLUINTEGER binary value|0L|
     *   
     *  For example, if a data source does not support procedures, **SQLGetInfo** returns the values listed in the following table for the values of *InfoType* that are related to procedures.  
     * 
     * |InfoType|Value|
     * |-|-|
     * |SQL_PROCEDURES|"N"|
     * |SQL_ACCESSIBLE_PROCEDURES|"N"|
     * |SQL_MAX_PROCEDURE_NAME_LEN|0|
     * |SQL_PROCEDURE_TERM|Empty string|
     *   
     *  **SQLGetInfo** returns SQLSTATE HY096 (Invalid argument value) for values of *InfoType* that are in the range of information types reserved for use by ODBC but are not defined by the version of ODBC supported by the driver. To determine what version of ODBC a driver complies with, an application calls **SQLGetInfo** with the SQL_DRIVER_ODBC_VER information type. **SQLGetInfo** returns SQLSTATE HYC00 (Optional feature not implemented) for values of *InfoType* that are in the range of information types reserved for driver-specific use but are not supported by the driver.  
     *   
     *  All calls to **SQLGetInfo** require an open connection, except when the *InfoType* is SQL_ODBC_VER, which returns the version of the Driver Manager.
     * @param {Pointer<Void>} ConnectionHandle [Input] Connection handle.
     * @param {Integer} InfoType [Input] Type of information.
     * @param {Pointer<Void>} InfoValue 
     * @param {Integer} BufferLength [Input] Length of the \**InfoValuePtr* buffer. If the value in *\*InfoValuePtr* is not a character string or if *InfoValuePtr* is a null pointer, the *BufferLength* argument is ignored. The driver assumes that the size of *\*InfoValuePtr* is SQLUSMALLINT or SQLUINTEGER, based on the *InfoType*. If *\*InfoValuePtr* is a Unicode string (when calling **SQLGetInfoW**), the *BufferLength* argument must be an even number; if not, SQLSTATE HY090 (Invalid string or buffer length) is returned.
     * @param {Pointer<Int16>} StringLengthPtr [Output] Pointer to a buffer in which to return the total number of bytes (excluding the null-termination character for character data) available to return in **InfoValuePtr*.  
     *   
     *  For character data, if the number of bytes available to return is greater than or equal to *BufferLength*, the information in \**InfoValuePtr* is truncated to *BufferLength* bytes minus the length of a null-termination character and is null-terminated by the driver.  
     *   
     *  For all other types of data, the value of *BufferLength* is ignored and the driver assumes the size of \**InfoValuePtr* is SQLUSMALLINT or SQLUINTEGER, depending on the *InfoType*.
     * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_ERROR, or SQL_INVALID_HANDLE.
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlgetinfo-function
     */
    static SQLGetInfo(ConnectionHandle, InfoType, InfoValue, BufferLength, StringLengthPtr) {
        result := DllCall("ODBC32.dll\SQLGetInfo", "ptr", ConnectionHandle, "ushort", InfoType, "ptr", InfoValue, "short", BufferLength, "ptr", StringLengthPtr, "short")
        return result
    }

    /**
     * SQLGetStmtAttr Function
     * @remarks
     * For general information about statement attributes, see [Statement Attributes](../../../odbc/reference/develop-app/statement-attributes.md).  
     *   
     *  A call to **SQLGetStmtAttr** returns in *\*ValuePtr* the value of the statement attribute specified in *Attribute*. That value can either be a SQLULEN value or a null-terminated character string. If the value is a SQLULEN value, some drivers may only write the lower 32-bit or 16-bit of a buffer and leave the higher-order bit unchanged. Therefore, applications should use a buffer of SQLULEN and initialize the value to 0 before calling this function. Also, the *BufferLength* and *StringLengthPtr* arguments are not used. If the value is a null-terminated string, the application specifies the maximum length of that string in the *BufferLength* argument, and the driver returns the length of that string in the *\*StringLengthPtr* buffer.  
     *   
     *  To allow applications calling **SQLGetStmtAttr** to work with ODBC 2.*x* drivers, a call to **SQLGetStmtAttr** is mapped in the Driver Manager to **SQLGetStmtOption**.  
     *   
     *  The following statement attributes are read-only, so can be retrieved by **SQLGetStmtAttr**, but not set by **SQLSetStmtAttr**:  
     *   
     * -   SQL_ATTR_IMP_PARAM_DESC  
     *   
     * -   SQL_ATTR_IMP_ROW_DESC  
     *   
     * -   SQL_ATTR_ROW_NUMBER  
     *   
     *  For a list of attributes that can be set and retrieved, see [SQLSetStmtAttr](../../../odbc/reference/syntax/sqlsetstmtattr-function.md).
     * @param {Pointer<Void>} StatementHandle [Input] Statement handle.
     * @param {Integer} Attribute [Input] Attribute to retrieve.
     * @param {Pointer<Void>} Value 
     * @param {Integer} BufferLength [Input] If *Attribute* is an ODBC-defined attribute and *ValuePtr* points to a character string or a binary buffer, this argument should be the length of \**ValuePtr*. If *Attribute* is an ODBC-defined attribute and \**ValuePtr* is an integer, *BufferLength* is ignored. If the value returned in *\*ValuePtr* is a Unicode string (when calling **SQLGetStmtAttrW**), the *BufferLength* argument must be an even number.  
     *   
     *  If *Attribute* is a driver-defined attribute, the application indicates the nature of the attribute to the Driver Manager by setting the *BufferLength* argument. *BufferLength* can have the following values:  
     *   
     * -   If *\*ValuePtr* is a pointer to a character string, then *BufferLength* is the length of the string or SQL_NTS.  
     *   
     * -   If *\*ValuePtr* is a pointer to a binary buffer, then the application places the result of the SQL_LEN_BINARY_ATTR(*length*) macro in *BufferLength*. This places a negative value in *BufferLength*.  
     *   
     * -   If *\*ValuePtr* is a pointer to a value other than a character string or binary string, then *BufferLength* should have the value SQL_IS_POINTER.  
     *   
     * -   If *\*ValuePtr* is contains a fixed-length data type, then *BufferLength* is either SQL_IS_INTEGER or SQL_IS_UINTEGER, as appropriate.
     * @param {Pointer<Int32>} StringLength 
     * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_ERROR, or SQL_INVALID_HANDLE.
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlgetstmtattr-function
     */
    static SQLGetStmtAttr(StatementHandle, Attribute, Value, BufferLength, StringLength) {
        result := DllCall("ODBC32.dll\SQLGetStmtAttr", "ptr", StatementHandle, "int", Attribute, "ptr", Value, "int", BufferLength, "ptr", StringLength, "short")
        return result
    }

    /**
     * SQLGetStmtOption Function
     * @param {Pointer<Void>} StatementHandle 
     * @param {Integer} Option 
     * @param {Pointer<Void>} Value 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlgetstmtoption-function
     * @deprecated
     */
    static SQLGetStmtOption(StatementHandle, Option, Value) {
        result := DllCall("ODBC32.dll\SQLGetStmtOption", "ptr", StatementHandle, "ushort", Option, "ptr", Value, "short")
        return result
    }

    /**
     * SQLGetTypeInfo Function
     * @remarks
     * **SQLGetTypeInfo** returns the results as a standard result set, ordered by DATA_TYPE and then by how closely the data type maps to the corresponding ODBC SQL data type. Data types defined by the data source take precedence over user-defined data types. Consequently, the sort order is not necessarily consistent but can be generalized as DATA_TYPE first, followed by TYPE_NAME, both ascending. For example, suppose that a data source defined INTEGER and COUNTER data types, where COUNTER is auto-incrementing, and that a user-defined data type WHOLENUM has also been defined. These would be returned in the order INTEGER, WHOLENUM, and COUNTER, because WHOLENUM maps closely to the ODBC SQL data type SQL_INTEGER, while the auto-incrementing data type, even though supported by the data source, does not map closely to an ODBC SQL data type. For information about how this information might be used, see [DDL Statements](../../../odbc/reference/develop-app/ddl-statements.md).  
     *   
     *  If the *DataType* argument specifies a data type which is valid for the version of ODBC supported by the driver, but is not supported by the driver, then it will return an empty result set.  
     *   
     * > [!NOTE]  
     * >  For more information about the general use, arguments, and returned data of ODBC catalog functions, see [Catalog Functions](../../../odbc/reference/develop-app/catalog-functions.md).  
     *   
     *  The following columns have been renamed for ODBC 3.*x*. The column name changes do not affect backward compatibility because applications bind by column number.  
     *   
     * |ODBC 2.0 column|ODBC 3.*x* column|  
     * |---------------------|-----------------------|  
     * |PRECISION|COLUMN_SIZE|  
     * |MONEY|FIXED_PREC_SCALE|  
     * |AUTO_INCREMENT|AUTO_UNIQUE_VALUE|  
     *   
     *  The following columns have been added to the results set returned by **SQLGetTypeInfo** for ODBC 3.*x*:  
     *   
     * -   SQL_DATA_TYPE  
     *   
     * -   INTERVAL_PRECISION  
     *   
     * -   SQL_DATETIME_SUB  
     *   
     * -   NUM_PREC_RADIX  
     *   
     *  The following table lists the columns in the result set. Additional columns beyond column 19 (INTERVAL_PRECISION) can be defined by the driver. An application should gain access to driver-specific columns by counting down from the end of the result set rather than specifying an explicit ordinal position. For more information, see [Data Returned by Catalog Functions](../../../odbc/reference/develop-app/data-returned-by-catalog-functions.md).  
     *   
     * > [!NOTE]  
     * >  **SQLGetTypeInfo** might not return all data types. For example, a driver might not return user-defined data types. Applications can use any valid data type, regardless of whether it is returned by **SQLGetTypeInfo**. The data types returned by **SQLGetTypeInfo** are those supported by the data source. They are intended for use in Data Definition Language (DDL) statements. Drivers can return result-set data using data types other than the types returned by **SQLGetTypeInfo**. In creating the result set for a catalog function, the driver might use a data type that is not supported by the data source.  
     *   
     * |Column name|Column<br /><br /> number|Data type|Comments|  
     * |-----------------|-----------------------|---------------|--------------|  
     * |TYPE_NAME (ODBC 2.0)|1|Varchar not NULL|Data source-dependent data-type name; for example, "CHAR()", "VARCHAR()", "MONEY", "LONG VARBINARY", or "CHAR ( ) FOR BIT DATA". Applications must use this name in **CREATE TABLE** and **ALTER TABLE** statements.|  
     * |DATA_TYPE (ODBC 2.0)|2|Smallint not NULL|SQL data type. This can be an ODBC SQL data type or a driver-specific SQL data type. For datetime or interval data types, this column returns the concise data type (such as SQL_TYPE_TIME or SQL_INTERVAL_YEAR_TO_MONTH). For a list of valid ODBC SQL data types, see [SQL Data Types](../../../odbc/reference/appendixes/sql-data-types.md) in Appendix D: Data Types. For information about driver-specific SQL data types, see the driver's documentation.|  
     * |COLUMN_SIZE (ODBC 2.0)|3|Integer|The maximum column size that the server supports for this data type. For numeric data, this is the maximum precision. For string data, this is the length in characters. For datetime data types, this is the length in characters of the string representation (assuming the maximum allowed precision of the fractional seconds component). NULL is returned for data types where column size is not applicable. For interval data types, this is the number of characters in the character representation of the interval literal (as defined by the interval leading precision; see [Interval Data Type Length](../../../odbc/reference/appendixes/interval-data-type-length.md) in Appendix D: Data Types).<br /><br /> For more information on column size, see [Column Size, Decimal Digits, Transfer Octet Length, and Display Size](../../../odbc/reference/appendixes/column-size-decimal-digits-transfer-octet-length-and-display-size.md) in Appendix D: Data Types.|  
     * |LITERAL_PREFIX (ODBC 2.0)|4|Varchar|Character or characters used to prefix a literal; for example, a single quotation mark (') for character data types or 0x for binary data types; NULL is returned for data types where a literal prefix is not applicable.|  
     * |LITERAL_SUFFIX (ODBC 2.0)|5|Varchar|Character or characters used to terminate a literal; for example, a single quotation mark (') for character data types; NULL is returned for data types where a literal suffix is not applicable.|  
     * |CREATE_PARAMS (ODBC 2.0)|6|Varchar|A list of keywords, separated by commas, corresponding to each parameter that the application may specify in parentheses when using the name that is returned in the TYPE_NAME field. The keywords in the list can be any of the following: length, precision, or scale. They appear in the order that the syntax requires them to be used. For example, CREATE_PARAMS for DECIMAL would be "precision,scale"; CREATE_PARAMS for VARCHAR would equal "length." NULL is returned if there are no parameters for the data type definition; for example, INTEGER.<br /><br /> The driver supplies the CREATE_PARAMS text in the language of the country/region where it is used.|  
     * |NULLABLE (ODBC 2.0)|7|Smallint not NULL|Whether the data type accepts a NULL value:<br /><br /> SQL_NO_NULLS if the data type does not accept NULL values.<br /><br /> SQL_NULLABLE if the data type accepts NULL values.<br /><br /> SQL_NULLABLE_UNKNOWN if it is not known whether the column accepts NULL values.|  
     * |CASE_SENSITIVE (ODBC 2.0)|8|Smallint not NULL|Whether a character data type is case-sensitive in collations and comparisons:<br /><br /> SQL_TRUE if the data type is a character data type and is case-sensitive.<br /><br /> SQL_FALSE if the data type is not a character data type or is not case-sensitive.|  
     * |SEARCHABLE (ODBC 2.0)|9|Smallint not NULL|How the data type is used in a **WHERE** clause:<br /><br /> SQL_PRED_NONE if the column cannot be used in a **WHERE** clause. (This is the same as the SQL_UNSEARCHABLE value in ODBC 2.*x*.)<br /><br /> SQL_PRED_CHAR if the column can be used in a **WHERE** clause, but only with the **LIKE** predicate. (This is the same as the SQL_LIKE_ONLY value in ODBC 2.*x*.)<br /><br /> SQL_PRED_BASIC if the column can be used in a **WHERE** clause with all the comparison operators except **LIKE** (comparison, quantified comparison, **BETWEEN**, **DISTINCT**, **IN**, **MATCH**, and **UNIQUE**). (This is the same as the SQL_ALL_EXCEPT_LIKE value in ODBC 2.*x*.)<br /><br /> SQL_SEARCHABLE if the column can be used in a **WHERE** clause with any comparison operator.|  
     * |UNSIGNED_ATTRIBUTE (ODBC 2.0)|10|Smallint|Whether the data type is unsigned:<br /><br /> SQL_TRUE if the data type is unsigned.<br /><br /> SQL_FALSE if the data type is signed.<br /><br /> NULL is returned if the attribute is not applicable to the data type or the data type is not numeric.|  
     * |FIXED_PREC_SCALE (ODBC 2.0)|11|Smallint not NULL|Whether the data type has predefined fixed precision and scale (which are data source-specific), such as a money data type:<br /><br /> SQL_TRUE if it has predefined fixed precision and scale.<br /><br /> SQL_FALSE if it does not have predefined fixed precision and scale.|  
     * |AUTO_UNIQUE_VALUE (ODBC 2.0)|12|Smallint|Whether the data type is autoincrementing:<br /><br /> SQL_TRUE if the data type is autoincrementing.<br /><br /> SQL_FALSE if the data type is not autoincrementing.<br /><br /> NULL is returned if the attribute is not applicable to the data type or the data type is not numeric.<br /><br /> An application can insert values into a column having this attribute, but typically cannot update the values in the column.<br /><br /> When an insert is made into an auto-increment column, a unique value is inserted into the column at insert time. The increment is not defined, but is data source-specific. An application should not assume that an auto-increment column starts at any particular point or increments by any particular value.|  
     * |LOCAL_TYPE_NAME (ODBC 2.0)|13|Varchar|Localized version of the data source-dependent name of the data type. NULL is returned if a localized name is not supported by the data source. This name is intended for display only, such as in dialog boxes.|  
     * |MINIMUM_SCALE (ODBC 2.0)|14|Smallint|The minimum scale of the data type on the data source. If a data type has a fixed scale, the MINIMUM_SCALE and MAXIMUM_SCALE columns both contain this value. For example, an SQL_TYPE_TIMESTAMP column might have a fixed scale for fractional seconds. NULL is returned where scale is not applicable. For more information, see [Column Size, Decimal Digits, Transfer Octet Length, and Display Size](../../../odbc/reference/appendixes/column-size-decimal-digits-transfer-octet-length-and-display-size.md) in Appendix D: Data Types.|  
     * |MAXIMUM_SCALE (ODBC 2.0)|15|Smallint|The maximum scale of the data type on the data source. NULL is returned where scale is not applicable. If the maximum scale is not defined separately on the data source, but is instead defined to be the same as the maximum precision, this column contains the same value as the COLUMN_SIZE column. For more information, see [Column Size, Decimal Digits, Transfer Octet Length, and Display Size](../../../odbc/reference/appendixes/column-size-decimal-digits-transfer-octet-length-and-display-size.md) in Appendix D: Data Types.|  
     * |SQL_DATA_TYPE (ODBC 3.0)|16|Smallint NOT NULL|The value of the SQL data type as it appears in the SQL_DESC_TYPE field of the descriptor. This column is the same as the DATA_TYPE column, except for interval and datetime data types.<br /><br /> For interval and datetime data types, the SQL_DATA_TYPE field in the result set will return SQL_INTERVAL or SQL_DATETIME, and the SQL_DATETIME_SUB field will return the subcode for the specific interval or datetime data type. (See [Appendix D: Data Types](../../../odbc/reference/appendixes/appendix-d-data-types.md).)|  
     * |SQL_DATETIME_SUB (ODBC 3.0)|17|Smallint|When the value of SQL_DATA_TYPE is SQL_DATETIME or SQL_INTERVAL, this column contains the datetime/interval subcode. For data types other than datetime and interval, this field is NULL.<br /><br /> For interval or datetime data types, the SQL_DATA_TYPE field in the result set will return SQL_INTERVAL or SQL_DATETIME, and the SQL_DATETIME_SUB field will return the subcode for the specific interval or datetime data type. (See [Appendix D: Data Types](../../../odbc/reference/appendixes/appendix-d-data-types.md).)|  
     * |NUM_PREC_RADIX (ODBC 3.0)|18|Integer|If the data type is an approximate numeric type, this column contains the value 2 to indicate that COLUMN_SIZE specifies a number of bits. For exact numeric types, this column contains the value 10 to indicate that COLUMN_SIZE specifies a number of decimal digits. Otherwise, this column is NULL.|  
     * |INTERVAL_PRECISION (ODBC 3.0)|19|Smallint|If the data type is an interval data type, then this column contains the value of the interval leading precision. (See [Interval Data Type Precision](../../../odbc/reference/appendixes/interval-data-type-precision.md) in Appendix D: Data Types.) Otherwise, this column is NULL.|  
     *   
     *  Attribute information can apply to data types or to specific columns in a result set. **SQLGetTypeInfo** returns information about attributes associated with data types; **SQLColAttribute** returns information about attributes associated with columns in a result set.
     * @param {Pointer<Void>} StatementHandle [Input] Statement handle for the result set.
     * @param {Integer} DataType [Input] The SQL data type. This must be one of the values in the [SQL Data Types](../../../odbc/reference/appendixes/sql-data-types.md) section of Appendix D: Data Types, or a driver-specific SQL data type. SQL_ALL_TYPES specifies that information about all data types should be returned.
     * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_STILL_EXECUTING, SQL_ERROR, or SQL_INVALID_HANDLE.
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlgettypeinfo-function
     */
    static SQLGetTypeInfo(StatementHandle, DataType) {
        result := DllCall("ODBC32.dll\SQLGetTypeInfo", "ptr", StatementHandle, "short", DataType, "short")
        return result
    }

    /**
     * SQLNumResultCols Function
     * @remarks
     * **SQLNumResultCols** can be called successfully only when the statement is in the prepared, executed, or positioned state.  
     *   
     *  If the statement associated with *StatementHandle* does not return columns, **SQLNumResultCols** sets **ColumnCountPtr* to 0.  
     *   
     *  The number of columns returned by **SQLNumResultCols** is the same value as the SQL_DESC_COUNT field of the IRD.  
     *   
     *  For more information, see [Was a Result Set Created?](../../../odbc/reference/develop-app/was-a-result-set-created.md) and [How is Metadata Used?](../../../odbc/reference/develop-app/how-is-metadata-used.md).
     * @param {Pointer<Void>} StatementHandle [Input] Statement handle.
     * @param {Pointer<Int16>} ColumnCount 
     * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_STILL_EXECUTING, SQL_ERROR, or SQL_INVALID_HANDLE.
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlnumresultcols-function
     */
    static SQLNumResultCols(StatementHandle, ColumnCount) {
        result := DllCall("ODBC32.dll\SQLNumResultCols", "ptr", StatementHandle, "ptr", ColumnCount, "short")
        return result
    }

    /**
     * SQLParamData Function
     * @remarks
     * **SQLParamData** can be called to supply data-at-execution data for two uses: parameter data that will be used in a call to **SQLExecute** or **SQLExecDirect**, or column data that will be used when a row is updated or added by a call to **SQLBulkOperations** or updated by a call to **SQLSetPos**. At execution time, **SQLParamData** returns to the application an indicator of which data the driver requires.  
     *   
     *  When an application calls **SQLExecute**, **SQLExecDirect**, **SQLBulkOperations**, or **SQLSetPos**, the driver returns SQL_NEED_DATA if it needs data-at-execution data. An application then calls **SQLParamData** to determine which data to send. If the driver requires parameter data, the driver returns in the *\*ValuePtrPtr* output buffer the value that the application put in the rowset buffer. The application can use this value to determine which parameter data the driver is requesting. If the driver requires column data, the driver returns in the *\*ValuePtrPtr* buffer the address that the column was originally bound to, as follows:  
     *   
     *  *Bound Address* + *Binding Offset* + ((*Row Number* - 1) x *Element Size*)  
     *   
     *  where the variables are defined as indicated in the following table.  
     *   
     * |Variable|Description|  
     * |--------------|-----------------|  
     * |*Bound Address*|The address specified with the *TargetValuePtr* argument in **SQLBindCol**.|  
     * |*Binding Offset*|The value stored at the address specified with the SQL_ATTR_ROW_BIND_OFFSET_PTR statement attribute.|  
     * |*Row Number*|The 1-based number of the row in the rowset. For single-row fetches, which are the default, this is 1.|  
     * |*Element Size*|The value of the SQL_ATTR_ROW_BIND_TYPE statement attribute for both data and length/indicator buffers.|  
     *   
     *  It also returns SQL_NEED_DATA, which is an indicator to the application that it should call **SQLPutData** to send the data.  
     *   
     *  The application calls **SQLPutData** as many times as necessary to send the data-at-execution data for the column or parameter. After all the data has been sent for the column or parameter, the application calls **SQLParamData** again. If **SQLParamData** again returns SQL_NEED_DATA, data must be sent for another parameter or column. Therefore, the application again calls **SQLPutData**. If all data-at-execution data has been sent for all parameters or columns, then **SQLParamData** returns SQL_SUCCESS or SQL_SUCCESS_WITH_INFO, the value in *\*ValuePtrPtr* is undefined, and the SQL statement can be executed or the **SQLBulkOperations** or **SQLSetPos** call can be processed.  
     *   
     *  If **SQLParamData** supplies parameter data for a searched update or delete statement that does not affect any rows at the data source, the call to **SQLParamData** returns SQL_NO_DATA.  
     *   
     *  For more information about how data-at-execution parameter data is passed at statement execution time, see "Passing Parameter Values" in [SQLBindParameter](../../../odbc/reference/syntax/sqlbindparameter-function.md) and [Sending Long Data](../../../odbc/reference/develop-app/sending-long-data.md). For more information about how data-at-execution column data is updated or added, see the section "Using SQLSetPos" in [SQLSetPos](../../../odbc/reference/syntax/sqlsetpos-function.md), "Performing Bulk Updates Using Bookmarks" in [SQLBulkOperations](../../../odbc/reference/syntax/sqlbulkoperations-function.md), and [Long Data and SQLSetPos and SQLBulkOperations](../../../odbc/reference/develop-app/long-data-and-sqlsetpos-and-sqlbulkoperations.md).  
     *   
     *  **SQLParamData** can be called to retrieve streamed output parameters. When **SQLMoreResults**, **SQLExecute**, **SQLGetData**, or **SQLExecDirect** returns SQL_PARAM_DATA_AVAILABLE, call **SQLParamData** to determine which parameter has a value available. For more information about SQL_PARAM_DATA_AVAILABLE and streamed output parameters, see [Retrieving Output Parameters Using SQLGetData](../../../odbc/reference/develop-app/retrieving-output-parameters-using-sqlgetdata.md).
     * @param {Pointer<Void>} StatementHandle [Input] Statement handle.
     * @param {Pointer<Void>} Value 
     * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_NEED_DATA, SQL_NO_DATA, SQL_STILL_EXECUTING, SQL_ERROR, SQL_INVALID_HANDLE, or SQL_PARAM_DATA_AVAILABLE.
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlparamdata-function
     */
    static SQLParamData(StatementHandle, Value) {
        result := DllCall("ODBC32.dll\SQLParamData", "ptr", StatementHandle, "ptr", Value, "short")
        return result
    }

    /**
     * SQLPrepare Function
     * @remarks
     * The application calls **SQLPrepare** to send an SQL statement to the data source for preparation. For more information about prepared execution, see [Prepared Execution](../../../odbc/reference/develop-app/prepared-execution-odbc.md). The application can include one or more parameter markers in the SQL statement. To include a parameter marker, the application embeds a question mark (?) into the SQL string at the appropriate position. For information about parameters, see [Statement Parameters](../../../odbc/reference/develop-app/statement-parameters.md).  
     *   
     * > [!NOTE]  
     * >  If an application uses **SQLPrepare** to prepare and **SQLExecute** to submit a **COMMIT** or **ROLLBACK** statement, it will not be interoperable between DBMS products. To commit or roll back a transaction, call **SQLEndTran**.  
     *   
     *  The driver can modify the statement to use the form of SQL used by the data source and then submit it to the data source for preparation. In particular, the driver modifies the escape sequences used to define SQL syntax for certain features. (For a description of SQL statement grammar, see [Escape Sequences in ODBC](../../../odbc/reference/develop-app/escape-sequences-in-odbc.md) and [Appendix C: SQL Grammar](../../../odbc/reference/appendixes/appendix-c-sql-grammar.md).) For the driver, a statement handle is similar to a statement identifier in embedded SQL code. If the data source supports statement identifiers, the driver can send a statement identifier and parameter values to the data source.  
     *   
     *  After a statement is prepared, the application uses the statement handle to refer to the statement in later function calls. The prepared statement associated with the statement handle can be re-executed by calling **SQLExecute** until the application frees the statement with a call to **SQLFreeStmt** with the SQL_DROP option or until the statement handle is used in a call to **SQLPrepare**, **SQLExecDirect**, or one of the catalog functions (**SQLColumns**, **SQLTables**, and so on). Once the application prepares a statement, it can request information about the format of the result set. For some implementations, calling **SQLDescribeCol** or **SQLDescribeParam** after **SQLPrepare** might not be as efficient as calling the function after **SQLExecute** or **SQLExecDirect**.  
     *   
     *  Some drivers cannot return syntax errors or access violations when the application calls **SQLPrepare**. A driver can handle syntax errors and access violations, only syntax errors, or neither syntax errors nor access violations. Therefore, an application must be able to handle these conditions when calling subsequent related functions such as **SQLNumResultCols**, **SQLDescribeCol**, **SQLColAttribute**, and **SQLExecute**.  
     *   
     *  Depending on the capabilities of the driver and data source, parameter information (such as data types) might be checked when the statement is prepared (if all parameters have been bound) or when it is executed (if all parameters have not been bound). For maximum interoperability, an application should unbind all parameters that applied to an old SQL statement before preparing a new SQL statement on the same statement. This prevents errors that are due to old parameter information being applied to the new statement.  
     *   
     * > [!IMPORTANT]  
     * >  Committing a transaction, either by explicitly calling **SQLEndTran** or by working in autocommit mode, can cause the data source to delete the access plans for all statements on a connection. For more information, see the SQL_CURSOR_COMMIT_BEHAVIOR and SQL_CURSOR_ROLLBACK_BEHAVIOR information types in [SQLGetInfo](../../../odbc/reference/syntax/sqlgetinfo-function.md) and [Effect of Transactions on Cursors and Prepared Statements](../../../odbc/reference/develop-app/effect-of-transactions-on-cursors-and-prepared-statements.md).
     * @param {Pointer<Void>} StatementHandle [Input] Statement handle.
     * @param {Pointer<Byte>} StatementText [Input] SQL text string.
     * @param {Integer} TextLength [Input] Length of **StatementText* in characters.
     * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_STILL_EXECUTING, SQL_ERROR, or SQL_INVALID_HANDLE.
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlprepare-function
     */
    static SQLPrepare(StatementHandle, StatementText, TextLength) {
        result := DllCall("ODBC32.dll\SQLPrepare", "ptr", StatementHandle, "ptr", StatementText, "int", TextLength, "short")
        return result
    }

    /**
     * SQLSetConnectAttr Function
     * @remarks
     * For general information about connection attributes, see [Connection Attributes](../../../odbc/reference/develop-app/connection-attributes.md).  
     *   
     *  The currently defined attributes and the version of ODBC in which they were introduced are shown in the table later in this section; it is expected that more attributes will be defined to take advantage of different data sources. A range of attributes is reserved by ODBC; driver developers must reserve values for their own driver-specific use from Open Group.  
     *   
     * > [!NOTE]
     * >  The ability to set statement attributes at the connection level by calling **SQLSetConnectAttr** has been deprecated in ODBC 3*.x*. ODBC 3*.x* applications should never set statement attributes at the connection level. ODBC 3*.x* statement attributes cannot be set at the connection level, with the exception of the SQL_ATTR_METADATA_ID and SQL_ATTR_ASYNC_ENABLE attributes, which are both connection attributes and statement attributes and can be set at either the connection level or the statement level.  
     * > 
     * >  ODBC 3*.x* drivers need only support this functionality if they should work with ODBC 2*.x* applications that set ODBC 2*.x* statement options at the connection level. For more information, see [SQLSetConnectOption Mapping](../../../odbc/reference/appendixes/sqlsetconnectoption-mapping.md) in Appendix G: Driver Guidelines for Backward Compatibility.  
     *   
     *  An application can call **SQLSetConnectAttr** at any time between the time the connection is allocated and freed. All connection and statement attributes successfully set by the application for the connection persist until **SQLFreeHandle** is called on the connection. For example, if an application calls **SQLSetConnectAttr** before connecting to a data source, the attribute persists even if **SQLSetConnectAttr** fails in the driver when the application connects to the data source; if an application sets a driver-specific attribute, the attribute persists even if the application connects to a different driver on the connection.  
     *   
     *  Some connection attributes can be set only before a connection has been made; others can be set only after a connection has been made. The following table indicates those connection attributes that must be set either before or after a connection has been made. *Either* indicates that the attribute can be set either before or after connection.  
     *   
     * |Attribute|Set before or after connection?|  
     * |---------------|-------------------------------------|  
     * |SQL_ATTR_ACCESS_MODE|Either[1]|  
     * |SQL_ATTR_ASYNC_DBC_EVENT|Either|  
     * |SQL_ATTR_ASYNC_DBC_FUNCTIONS_ENABLE|Either[4]|  
     * |SQL_ATTR_ASYNC_DBC_PCALLBACK|Either|  
     * |SQL_ATTR_ASYNC_DBC_PCONTEXT|Either|  
     * |SQL_ATTR_ASYNC_ENABLE|Either[2]|  
     * |SQL_ATTR_AUTO_IPD|Either|  
     * |SQL_ATTR_AUTOCOMMIT|Either[5]|  
     * |SQL_ATTR_CONNECTION_DEAD|After|  
     * |SQL_ATTR_CONNECTION_TIMEOUT|Either|  
     * |SQL_ATTR_CURRENT_CATALOG|Either[1]|  
     * |SQL_ATTR_DBC_INFO_TOKEN|After|  
     * |SQL_ATTR_ENLIST_IN_DTC|After|  
     * |SQL_ATTR_LOGIN_TIMEOUT|Before|  
     * |SQL_ATTR_METADATA_ID|Either|  
     * |SQL_ATTR_ODBC_CURSORS|Before|  
     * |SQL_ATTR_PACKET_SIZE|Before|  
     * |SQL_ATTR_QUIET_MODE|Either|  
     * |SQL_ATTR_TRACE|Either|  
     * |SQL_ATTR_TRACEFILE|Either|  
     * |SQL_ATTR_TRANSLATE_LIB|After|  
     * |SQL_ATTR_TRANSLATE_OPTION|After|  
     * |SQL_ATTR_TXN_ISOLATION|Either[3]|  
     *   
     *  [1]   SQL_ATTR_ACCESS_MODE and SQL_ATTR_CURRENT_CATALOG can be set before or after connecting, depending on the driver. However, interoperable applications set them before connecting because some drivers do not support changing these after connecting.  
     *   
     *  [2]   SQL_ATTR_ASYNC_ENABLE must be set before there is an active statement.  
     *   
     *  [3]   SQL_ATTR_TXN_ISOLATION can be set only if there are no open transactions on the connection. Some connection attributes support substitution of a similar value if the data source does not support the value specified in \**ValuePtr*. In such cases, the driver returns SQL_SUCCESS_WITH_INFO and SQLSTATE 01S02 (Option value changed). For example, if *Attribute* is SQL_ATTR_PACKET_SIZE and \**ValuePtr* exceeds the maximum packet size, the driver substitutes the maximum size. To determine the substituted value, an application calls **SQLGetConnectAttr**.  
     *   
     *  [4]    If SQL_ATTR_ASYNC_DBC_FUNCTIONS_ENABLE is set before a connection is open, the Driver Manager will set the driver's attribute when the driver is loaded during a call to **SQLBrowseConnect**, **SQLConnect**, or **SQLDriverConnect**. Before a call to **SQLBrowseConnect**, **SQLConnect**, or **SQLDriverConnect**, the Driver Manager does not know which driver to connect to and does not know whether the driver supports asynchronous connection operations. Therefore, the Driver Manager always returns SQL_SUCCESS. But, in case the driver does not support asynchronous connection operations, the call to **SQLBrowseConnect**, **SQLConnect**, or **SQLDriverConnect** will fail.  
     *   
     *  [5]    When SQL_ATTR_AUTOCOMMIT is set to FALSE, applications should call SQLEndTran(SQL_ROLLBACK) if any API returns SQL_ERROR to ensure transactional consistency.  
     *   
     *  The format of information set in the \**ValuePtr* buffer depends on the specified *Attribute*. **SQLSetConnectAttr** will accept attribute information in one of two different formats: a null-terminated character string or an integer value. The format of each is noted in the attribute's description. Character strings pointed to by the *ValuePtr* argument of **SQLSetConnectAttr** have a length of *StringLength* bytes.  
     *   
     *  The *StringLength* argument is ignored if the length is defined by the attribute, as is the case for all attributes introduced in ODBC 2*.x* or earlier.  
     *   
     * |*Attribute*|*ValuePtr* contents|  
     * |-----------------|-------------------------|  
     * |SQL_ATTR_ACCESS_MODE (ODBC 1.0)|An SQLUINTEGER value. SQL_MODE_READ_ONLY is used by the driver or data source as an indicator that the connection is not required to support SQL statements that cause updates to occur. This mode can be used to optimize locking strategies, transaction management, or other areas as appropriate to the driver or data source. The driver is not required to prevent such statements from being submitted to the data source. The behavior of the driver and data source when asked to process SQL statements that are not read-only during a read-only connection is implementation-defined. SQL_MODE_READ_WRITE is the default.|  
     * |SQL_ATTR_ASYNC_DBC_EVENT (ODBC 3.8)|A SQLPOINTER value that is an event handle.<br /><br /> Notification of the completion of asynchronous functions is enabled by calling **SQLSetConnectAttr** with the SQL_ATTR_ASYNC_STMT_EVENT attribute and specifying the event handle. **Note:**  The notification method is not supported with cursor library. An application will receive error message if it attempts to enable cursor library via SQLSetConnectAttr, when the notification method is enabled.|  
     * |SQL_ATTR_ASYNC_DBC_FUNCTIONS_ENABLE (ODBC 3.8)|A SQLUINTEGER value that enables or disables asynchronous execution of selected functions on the connection handle. For more information, see [Asynchronous Execution (Polling Method)](../../../odbc/reference/develop-app/asynchronous-execution-polling-method.md).<br /><br /> SQL_ASYNC_DBC_ENABLE_ON = Enable asynchronous operation for specified connection-related functions.<br /><br /> SQL_ASYNC_DBC_ENABLE_OFF = (Default) Disable asynchronous operation for specified connection-related functions.<br /><br /> Setting SQL_ATTR_ASYNC_DBC_FUNCTIONS_ENABLE is always synchronous (that is, it will never return SQL_STILL_EXECUTING).<br /><br /> Asynchronous execution of statement operations are enabled with SQL_ATTR_ASYNC_ENABLE.|  
     * |SQL_ATTR_ASYNC_DBC_PCALLBACK (ODBC 3.8)|A SQLPOINTER value that points to context structure.<br /><br /> Only the Driver Manager can call a driver's **SQLSetStmtAttr** function with this attribute.|  
     * |SQL_ATTR_ASYNC_DBC_PCONTEXT (ODBC 3.8)|A SQLPOINTER value that points to the context structure.<br /><br /> Only the Driver Manager can call a driver's **SQLSetStmtAttr** function with this attribute.|  
     * |SQL_ATTR_ASYNC_ENABLE (ODBC 3.0)|A SQLULEN value that specifies whether a function called with a statement on the specified connection is executed asynchronously:<br /><br /> SQL_ASYNC_ENABLE_OFF = Disable connection level asynchronous execution support for statement operations (the default).<br /><br /> SQL_ASYNC_ENABLE_ON = Enable connection level asynchronous execution support for statement operations.<br /><br /> This attribute can be set whether **SQLGetInfo** with the SQL_ASYNC_MODE information type returns SQL_AM_CONNECTION or SQL_AM_STATEMENT.|  
     * |SQL_ATTR_AUTO_IPD (ODBC 3.0)|A read-only SQLUINTEGER value that specifies whether automatic population of the IPD after a call to **SQLPrepare** is supported:<br /><br /> SQL_TRUE = Automatic population of the IPD after a call to **SQLPrepare** is supported by the driver.<br /><br /> SQL_FALSE = Automatic population of the IPD after a call to **SQLPrepare** is not supported by the driver. Servers that do not support prepared statements will not be able to populate the IPD automatically.<br /><br /> If SQL_TRUE is returned for the SQL_ATTR_AUTO_IPD connection attribute, the statement attribute SQL_ATTR_ENABLE_AUTO_IPD can be set to turn automatic population of the IPD on or off. If SQL_ATTR_AUTO_IPD is SQL_FALSE, SQL_ATTR_ENABLE_AUTO_IPD cannot be set to SQL_TRUE. The default value of SQL_ATTR_ENABLE_AUTO_IPD is equal to the value of SQL_ATTR_AUTO_IPD.<br /><br /> This connection attribute can be returned by **SQLGetConnectAttr** but cannot be set by **SQLSetConnectAttr**.|  
     * |SQL_ATTR_AUTOCOMMIT (ODBC 1.0)|A SQLUINTEGER value that specifies whether to use autocommit or manual-commit mode:<br /><br /> SQL_AUTOCOMMIT_OFF = The driver uses manual-commit mode, and the application must explicitly commit or roll back transactions with **SQLEndTran**.<br /><br /> SQL_AUTOCOMMIT_ON = The driver uses autocommit mode. Each statement is committed immediately after it is executed. This is the default. Any open transactions on the connection are committed when SQL_ATTR_AUTOCOMMIT is set to SQL_AUTOCOMMIT_ON to change from manual-commit mode to autocommit mode.<br /><br /> For more information, see [Commit Mode](../../../odbc/reference/develop-app/commit-mode.md). **Important:**  Some data sources delete the access plans and close the cursors for all statements on a connection each time a statement is committed; autocommit mode can cause this to happen after each nonquery statement is executed or when the cursor is closed for a query. For more information, see the SQL_CURSOR_COMMIT_BEHAVIOR and SQL_CURSOR_ROLLBACK_BEHAVIOR information types in [SQLGetInfo](../../../odbc/reference/syntax/sqlgetinfo-function.md) and [Effect of Transactions on Cursors and Prepared Statements](../../../odbc/reference/develop-app/effect-of-transactions-on-cursors-and-prepared-statements.md). <br /><br /> When a batch is executed in autocommit mode, two things are possible. The entire batch can be treated as an autocommitable unit, or each statement in a batch is treated as an autocommitable unit. Certain data sources can support both these behaviors and may provide a way of choosing one or the other. It is driver-defined whether a batch is treated as an autocommitable unit or whether each individual statement within the batch is autocommitable.|  
     * |SQL_ATTR_CONNECTION_DEAD<br /><br /> (ODBC 3.5)|A read-only SQLUINTEGER value that indicates the state of the connection. If SQL_CD_TRUE, the connection has been lost. If SQL_CD_FALSE, the connection is still active.|  
     * |SQL_ATTR_CONNECTION_TIMEOUT (ODBC 3.0)|An SQLUINTEGER value corresponding to the number of seconds to wait for any request on the connection to complete before returning to the application. The driver should return SQLSTATE HYT00 (Timeout expired) anytime that it is possible to time out in a situation not associated with query execution or login.<br /><br /> If *ValuePtr* is equal to 0 (the default), there is no timeout.|  
     * |SQL_ATTR_CURRENT_CATALOG (ODBC 2.0)|A character string containing the name of the catalog to be used by the data source. For example, in SQL Server, the catalog is a database, so the driver sends a **USE** _database_ statement to the data source, where *database* is the database specified in \**ValuePtr*. For a single-tier driver, the catalog might be a directory, so the driver changes its current directory to the directory specified in **ValuePtr*.|  
     * |SQL_ATTR_DBC_INFO_TOKEN (ODBC 3.8|A SQLPOINTER value used to set back the connection info token into the DBC handle when [SQLRateConnection](../../../odbc/reference/syntax/sqlrateconnection-function.md)'s (\**pRating*) parameter is not equal to 100.<br /><br /> SQL_ATTR_DBC_INFO_TOKEN is set-only. It is not possible to use **SQLGetConnectAttr** or **SQLGetConnectOption** to retrieve this value. The Driver Manager's **SQLSetConnectAttr** will not accept SQL_ATTR_DBC_INFO_TOKEN, since an application should not set this attribute.<br /><br /> If a driver returns SQL_ERROR after setting SQL_ATTR_DBC_INFO_TOKEN, the connection just obtained from the pool will be freed. The Driver Manager will then try to obtain another connection from the pool. See [Developing Connection-Pool Awareness in an ODBC Driver](../../../odbc/reference/develop-driver/developing-connection-pool-awareness-in-an-odbc-driver.md) for more information.|  
     * |SQL_ATTR_ENLIST_IN_DTC (ODBC 3.0)|A SQLPOINTER value that specifies whether to use the ODBC driver in distributed transactions coordinated by Microsoft Component Services.<br /><br /> Pass a DTC OLE transaction object that specifies the transaction to export to SQL Server, or SQL_DTC_DONE to end the connection's DTC association.<br /><br /> The client calls the Microsoft Distributed Transaction Coordinator (MS DTC) OLE ITransactionDispenser::BeginTransaction method to begin an MS DTC transaction and create an MS DTC transaction object that represents the transaction. The application then calls SQLSetConnectAttr with the SQL_ATTR_ENLIST_IN_DTC option to associate the transaction object with the ODBC connection. All related database activity will be performed under the protection of the MS DTC transaction. The application calls SQLSetConnectAttr with SQL_DTC_DONE to end the connection's DTC association. For more information, see the MS DTC documentation.|  
     * |SQL_ATTR_LOGIN_TIMEOUT (ODBC 1.0)|An SQLUINTEGER value corresponding to the number of seconds to wait for a login request to complete before returning to the application. The default is driver-dependent. If *ValuePtr* is 0, the timeout is disabled and a connection attempt will wait indefinitely.<br /><br /> If the specified timeout exceeds the maximum login timeout in the data source, the driver substitutes that value and returns SQLSTATE 01S02 (Option value changed).|  
     * |SQL_ATTR_METADATA_ID (ODBC 3.0)|An SQLUINTEGER value that determines how the string arguments of catalog functions are treated.<br /><br /> If SQL_TRUE, the string argument of catalog functions are treated as identifiers. The case is not significant. For nondelimited strings, the driver removes any trailing spaces and the string is folded to uppercase. For delimited strings, the driver removes any leading or trailing spaces and takes literally whatever is between the delimiters. If one of these arguments is set to a null pointer, the function returns SQL_ERROR and SQLSTATE HY009 (Invalid use of null pointer).<br /><br /> If SQL_FALSE, the string arguments of catalog functions are not treated as identifiers. The case is significant. They can either contain a string search pattern or not, depending on the argument.<br /><br /> The default value is SQL_FALSE.<br /><br /> The *TableType* argument of **SQLTables**, which takes a list of values, is not affected by this attribute.<br /><br /> SQL_ATTR_METADATA_ID can also be set on the statement level. (It is the only connection attribute that is also a statement attribute.)<br /><br /> For more information, see [Arguments in Catalog Functions](../../../odbc/reference/develop-app/arguments-in-catalog-functions.md).|  
     * |SQL_ATTR_ODBC_CURSORS (ODBC 2.0)|An SQLULEN  value specifying how the Driver Manager uses the ODBC cursor library:<br /><br /> SQL_CUR_USE_IF_NEEDED = The Driver Manager uses the ODBC cursor library only if it is needed. If the driver supports the SQL_FETCH_PRIOR option in **SQLFetchScroll**, the Driver Manager uses the scrolling capabilities of the driver. Otherwise, it uses the ODBC cursor library.<br /><br /> SQL_CUR_USE_ODBC = The Driver Manager uses the ODBC cursor library.<br /><br /> SQL_CUR_USE_DRIVER = The Driver Manager uses the scrolling capabilities of the driver. This is the default setting.<br /><br /> For more information about the ODBC cursor library, see [Appendix F: ODBC Cursor Library](../../../odbc/reference/appendixes/appendix-f-odbc-cursor-library.md). **Warning:**  The cursor library will be removed in a future version of Windows. Avoid using this feature in new development work and plan to modify applications that currently use this feature. Microsoft recommends using the driver's cursor functionality.|  
     * |SQL_ATTR_PACKET_SIZE (ODBC 2.0)|An SQLUINTEGER value specifying the network packet size in bytes. **Note:**  Many data sources either do not support this option or only can return but not set the network packet size. <br /><br /> If the specified size exceeds the maximum packet size or is smaller than the minimum packet size, the driver substitutes that value and returns SQLSTATE 01S02 (Option value changed).<br /><br /> If the application sets packet size after a connection has already been made, the driver will return SQLSTATE HY011 (Attribute cannot be set now).|  
     * |SQL_ATTR_QUIET_MODE (ODBC 2.0)|A window handle (HWND).<br /><br /> If the window handle is a null pointer, the driver does not display any dialog boxes.<br /><br /> If the window handle is not a null pointer, it should be the parent window handle of the application. This is the default. The driver uses this handle to display dialog boxes. **Note:**  The SQL_ATTR_QUIET_MODE connection attribute does not apply to dialog boxes displayed by **SQLDriverConnect**.|  
     * |SQL_ATTR_TRACE (ODBC 1.0)|An SQLUINTEGER value telling the Driver Manager whether to perform tracing:<br /><br /> SQL_OPT_TRACE_OFF = Tracing off (the default)<br /><br /> SQL_OPT_TRACE_ON = Tracing on<br /><br /> When tracing is on, the Driver Manager writes each ODBC function call to the trace file. **Note:**  When tracing is on, the Driver Manager can return SQLSTATE IM013 (Trace file error) from any function. <br /><br /> An application specifies a trace file with the SQL_ATTR_TRACEFILE option. If the file already exists, the Driver Manager appends to the file. Otherwise, it creates the file. If tracing is on and no trace file has been specified, the Driver Manager writes to the file SQL.LOG in the root directory.<br /><br /> An application can set the variable **ODBCSharedTraceFlag** to enable tracing dynamically. Tracing is then enabled for all ODBC applications currently running. If an application turns tracing off, it is turned off only for that application.<br /><br /> If the **Trace** keyword in the system information is set to 1 when an application calls **SQLAllocHandle** with a *HandleType* of SQL_HANDLE_ENV, tracing is enabled for all handles. It is enabled only for the application that called **SQLAllocHandle**.<br /><br /> Calling **SQLSetConnectAttr** with an *Attribute* of SQL_ATTR_TRACE does not require that the *ConnectionHandle* argument be valid and will not return SQL_ERROR if *ConnectionHandle* is NULL. This attribute applies to all connections.|  
     * |SQL_ATTR_TRACEFILE (ODBC 1.0)|A null-terminated character string containing the name of the trace file.<br /><br /> The default value of the SQL_ATTR_TRACEFILE attribute is specified with the **TraceFile** keyword in the system information. For more information, see [ODBC Subkey](../../../odbc/reference/install/odbc-subkey.md).<br /><br /> Calling **SQLSetConnectAttr** with an *Attribute* of SQL_ATTR_TRACEFILE does not require the *ConnectionHandle* argument to be valid and will not return SQL_ERROR if *ConnectionHandle* is invalid. This attribute applies to all connections.|  
     * |SQL_ATTR_TRANSLATE_LIB (ODBC 1.0)|A null-terminated character string containing the name of a library containing the functions **SQLDriverToDataSource** and **SQLDataSourceToDriver** that the driver accesses to perform tasks such as character set translation. This option may be specified only if the driver has connected to the data source. The setting of this attribute will persist across connections. For more information about translating data, see [Translation DLLs](../../../odbc/reference/develop-app/translation-dlls.md) and [Translation DLL Function Reference](../../../odbc/reference/syntax/translation-dll-api-reference.md).|  
     * |SQL_ATTR_TRANSLATE_OPTION (ODBC 1.0)|A 32-bit flag value that is passed to the translation DLL. This attribute can be specified only if the driver has connected to the data source. For information about translating data, see [Translation DLLs](../../../odbc/reference/develop-app/translation-dlls.md).|  
     * |SQL_ATTR_TXN_ISOLATION (ODBC 1.0)|A 32-bit bitmask that sets the transaction isolation level for the current connection. An application must call **SQLEndTran** to commit or roll back all open transactions on a connection, before calling **SQLSetConnectAttr** with this option.<br /><br /> The valid values for *ValuePtr* can be determined by calling **SQLGetInfo** with *InfoType* equal to SQL_TXN_ISOLATION_OPTIONS.<br /><br /> For a description of transaction isolation levels, see the description of the SQL_DEFAULT_TXN_ISOLATION information type in [SQLGetInfo](../../../odbc/reference/syntax/sqlgetinfo-function.md) and [Transaction Isolation Levels](../../../odbc/reference/develop-app/transaction-isolation-levels.md).|  
     *   
     *  [1]   These functions can be called asynchronously only if the descriptor is an implementation descriptor, not an application descriptor.
     * @param {Pointer<Void>} ConnectionHandle [Input] Connection handle.
     * @param {Integer} Attribute [Input] Attribute to set, listed in "Comments."
     * @param {Pointer<Void>} Value 
     * @param {Integer} StringLength [Input] If *Attribute* is an ODBC-defined attribute and *ValuePtr* points to a character string or a binary buffer, this argument should be the length of **ValuePtr*. For character string data, this argument should contain the number of bytes in the string.  
     *   
     *  If *Attribute* is an ODBC-defined attribute and *ValuePtr* is an integer, *StringLength* is ignored.  
     *   
     *  If *Attribute* is a driver-defined attribute, the application indicates the nature of the attribute to the Driver Manager by setting the *StringLength* argument. *StringLength* can have the following values:  
     *   
     * -   If *ValuePtr* is a pointer to a character string, then *StringLength* is the length of the string or SQL_NTS.  
     *   
     * -   If *ValuePtr* is a pointer to a binary buffer, then the application places the result of the SQL_LEN_BINARY_ATTR(*length*) macro in *StringLength*. This places a negative value in *StringLength*.  
     *   
     * -   If *ValuePtr* is a pointer to a value other than a character string or a binary string, then *StringLength* should have the value SQL_IS_POINTER.  
     *   
     * -   If *ValuePtr* contains a fixed-length value, then *StringLength* is either SQL_IS_INTEGER or SQL_IS_UINTEGER, as appropriate.
     * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_ERROR, SQL_INVALID_HANDLE, or SQL_STILL_EXECUTING.
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlsetconnectattr-function
     */
    static SQLSetConnectAttr(ConnectionHandle, Attribute, Value, StringLength) {
        result := DllCall("ODBC32.dll\SQLSetConnectAttr", "ptr", ConnectionHandle, "int", Attribute, "ptr", Value, "int", StringLength, "short")
        return result
    }

    /**
     * SQLSetCursorName Function
     * @remarks
     * Cursor names are used only in positioned update and delete statements (for example, **UPDATE** _table-name_ ...**WHERE CURRENT OF** _cursor-name_). For more information, see [Positioned Update and Delete Statements](../../../odbc/reference/develop-app/positioned-update-and-delete-statements.md). If the application does not call **SQLSetCursorName** to define a cursor name, on execution of a query statement the driver generates a name that begins with the letters SQL_CUR and does not exceed 18 characters in length.  
     *   
     *  All cursor names within the connection must be unique. The maximum length of a cursor name is defined by the driver. For maximum interoperability, it is recommended that applications limit cursor names to no more than 18 characters. In ODBC 3*.x*, if a cursor name is a quoted identifier, it is treated in a case-sensitive manner and it can contain characters that the syntax of SQL would not permit or would treat specially, such as blanks or reserved keywords. If a cursor name must be treated in a case-sensitive manner, it must be passed as a quoted identifier.  
     *   
     *  A cursor name that is set either explicitly or implicitly remains set until the statement with which it is associated is dropped, using **SQLFreeHandle**. **SQLSetCursorName** can be called to rename a cursor on a statement as long as the cursor is in an allocated or prepared state.
     * @param {Pointer<Void>} StatementHandle [Input] Statement handle.
     * @param {Pointer<Byte>} CursorName [Input] Cursor name. For efficient processing, the cursor name should not include any leading or trailing spaces in the cursor name, and if the cursor name includes a delimited identifier, the delimiter should be positioned as the first character in the cursor name.
     * @param {Integer} NameLength [Input] Length in characters of **CursorName*.
     * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_ERROR, or SQL_INVALID_HANDLE.
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlsetcursorname-function
     */
    static SQLSetCursorName(StatementHandle, CursorName, NameLength) {
        result := DllCall("ODBC32.dll\SQLSetCursorName", "ptr", StatementHandle, "ptr", CursorName, "short", NameLength, "short")
        return result
    }

    /**
     * SQLSetDescField Function
     * @remarks
     * An application can call **SQLSetDescField** to set any descriptor field one at a time. One call to **SQLSetDescField** sets a single field in a single descriptor. This function can be called to set any field in any descriptor type, provided the field can be set. (See the table later in this section.)  
     *   
     * > [!NOTE]  
     * >  If a call to **SQLSetDescField** fails, the contents of the descriptor record identified by the *RecNumber* argument are undefined.  
     *   
     *  Other functions can be called to set multiple descriptor fields with a single call of the function. The **SQLSetDescRec** function sets a variety of fields that affect the data type and buffer bound to a column or parameter (the SQL_DESC_TYPE, SQL_DESC_DATETIME_INTERVAL_CODE, SQL_DESC_OCTET_LENGTH, SQL_DESC_PRECISION, SQL_DESC_SCALE, SQL_DESC_DATA_PTR, SQL_DESC_OCTET_LENGTH_PTR, and SQL_DESC_INDICATOR_PTR fields). **SQLBindCol** or **SQLBindParameter** can be used to make a complete specification for the binding of a column or parameter. These functions set a specific group of descriptor fields with one function call.  
     *   
     *  **SQLSetDescField** can be called to change the binding buffers by adding an offset to the binding pointers (SQL_DESC_DATA_PTR, SQL_DESC_INDICATOR_PTR, or SQL_DESC_OCTET_LENGTH_PTR). This changes the binding buffers without calling **SQLBindCol** or **SQLBindParameter**, which allows an application to change SQL_DESC_DATA_PTR without changing other fields, such as SQL_DESC_DATA_TYPE.  
     *   
     *  If an application calls **SQLSetDescField** to set any field other than SQL_DESC_COUNT or the deferred fields SQL_DESC_DATA_PTR, SQL_DESC_OCTET_LENGTH_PTR, or SQL_DESC_INDICATOR_PTR, the record becomes unbound.  
     *   
     *  Descriptor header fields are set by calling **SQLSetDescField** with the appropriate *FieldIdentifier*. Many header fields are also statement attributes, so they can also be set by a call to **SQLSetStmtAttr**. This allows applications to set a descriptor field without first obtaining a descriptor handle. When **SQLSetDescField** is called to set a header field, the *RecNumber* argument is ignored.  
     *   
     *  A *RecNumber* of 0 is used to set bookmark fields.  
     *   
     * > [!NOTE]  
     * >  The statement attribute SQL_ATTR_USE_BOOKMARKS should always be set before calling **SQLSetDescField** to set bookmark fields. While this is not mandatory, it is strongly recommended.
     * @param {Pointer<Void>} DescriptorHandle [Input] Descriptor handle.
     * @param {Integer} RecNumber [Input] Indicates the descriptor record containing the field that the application seeks to set. Descriptor records are numbered from 0, with record number 0 being the bookmark record. The *RecNumber* argument is ignored for header fields.
     * @param {Integer} FieldIdentifier [Input] Indicates the field of the descriptor whose value is to be set. For more information, see "*FieldIdentifier* Argument" in the "Comments" section.
     * @param {Pointer<Void>} Value 
     * @param {Integer} BufferLength [Input] If *FieldIdentifier* is an ODBC-defined field and *ValuePtr* points to a character string or a binary buffer, this argument should be the length of **ValuePtr*. For character string data, this argument should contain the number of bytes in the string.  
     *   
     *  If *FieldIdentifier* is an ODBC-defined field and *ValuePtr* is an integer, *BufferLength* is ignored.  
     *   
     *  If *FieldIdentifier* is a driver-defined field, the application indicates the nature of the field to the Driver Manager by setting the *BufferLength* argument. *BufferLength* can have the following values:  
     *   
     * -   If *ValuePtr* is a pointer to a character string, then *BufferLength* is the length of the string or SQL_NTS.  
     *   
     * -   If *ValuePtr* is a pointer to a binary buffer, then the application places the result of the SQL_LEN_BINARY_ATTR(*length*) macro in *BufferLength*. This places a negative value in *BufferLength*.  
     *   
     * -   If *ValuePtr* is a pointer to a value other than a character string or a binary string, then *BufferLength* should have the value SQL_IS_POINTER.  
     *   
     * -   If *ValuePtr* contains a fixed-length value, then *BufferLength* is either SQL_IS_INTEGER, SQL_IS_UINTEGER, SQL_IS_SMALLINT, or SQL_IS_USMALLINT, as appropriate.
     * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_ERROR, or SQL_INVALID_HANDLE.
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlsetdescfield-function
     */
    static SQLSetDescField(DescriptorHandle, RecNumber, FieldIdentifier, Value, BufferLength) {
        result := DllCall("ODBC32.dll\SQLSetDescField", "ptr", DescriptorHandle, "short", RecNumber, "short", FieldIdentifier, "ptr", Value, "int", BufferLength, "short")
        return result
    }

    /**
     * SQLSetEnvAttr Function
     * @remarks
     * An application can call **SQLSetEnvAttr** only if no connection handle is allocated on the environment. All environment attributes successfully set by the application for the environment persist until **SQLFreeHandle** is called on the environment. More than one environment handle can be allocated simultaneously in ODBC *3.x*.  
     *   
     *  The format of information set through *ValuePtr* depends on the specified *Attribute*. **SQLSetEnvAttr** will accept attribute information in one of two different formats: a null-terminated character string or a 32-bit integer value. The format of each is noted in the attribute's description.  
     *   
     *  There are no driver-specific environment attributes.  
     *   
     *  Connection attributes cannot be set by a call to **SQLSetEnvAttr**. Trying to do this will return SQLSTATE HY092 (Invalid attribute/option identifier).  
     *   
     * |*Attribute*|*ValuePtr* contents|  
     * |-----------------|-------------------------|  
     * |SQL_ATTR_CONNECTION_POOLING (ODBC 3.8)|A 32-bit SQLUINTEGER value that enables or disables connection pooling at the environment level. The following values are used:<br /><br /> SQL_CP_OFF = Connection pooling is turned off. This is the default.<br /><br /> SQL_CP_ONE_PER_DRIVER = A single connection pool is supported for each driver. Every connection in a pool is associated with one driver.<br /><br /> SQL_CP_ONE_PER_HENV = A single connection pool is supported for each environment. Every connection in a pool is associated with one environment.<br /><br /> SQL_CP_DRIVER_AWARE = Use the connection-pool awareness feature of the driver, if it is available. If the driver does not support connection-pool awareness, SQL_CP_DRIVER_AWARE is ignored and SQL_CP_ONE_PER_HENV is used. For more information, see [Driver-Aware Connection Pooling](../../../odbc/reference/develop-app/driver-aware-connection-pooling.md). In an environment where some drivers support and some drivers do not support connection-pool awareness, SQL_CP_DRIVER_AWARE can enable the connection-pool awareness feature on those supporting drivers, but it is equivalent to setting to SQL_CP_ONE_PER_HENV on those drivers that do not support connection-pool awareness feature.<br /><br /> Connection pooling is enabled by calling **SQLSetEnvAttr** to set the SQL_ATTR_CONNECTION_POOLING attribute to SQL_CP_ONE_PER_DRIVER or SQL_CP_ONE_PER_HENV. This call must be made before the application allocates the shared environment for which connection pooling is to be enabled. The environment handle in the call to **SQLSetEnvAttr** is set to null, which makes SQL_ATTR_CONNECTION_POOLING a process-level attribute. After connection pooling is enabled, the application then allocates an implicit shared environment by calling **SQLAllocHandle** with the *InputHandle* argument set to SQL_HANDLE_ENV.<br /><br /> After connection pooling has been enabled and a shared environment has been selected for an application, SQL_ATTR_CONNECTION_POOLING cannot be reset for that environment, because **SQLSetEnvAttr** is called with a null environment handle when setting this attribute. If this attribute is set while connection pooling is already enabled on a shared environment, the attribute affects only shared environments that are allocated subsequently.<br /><br /> It is also possible to enable connection pooling on an environment. Note the following about environment connection pooling:<br /><br /> -   Enabling connection pooling on a NULL handle is a process-level attribute. Subsequently allocated environments will be a shared environment, and will inherit the process-level connection pooling setting.<br />-   After an environment is allocated, an application can still change its connection pool setting.<br />-   If environment connection pooling is enabled and the connection's driver uses driver pooling, environment pooling takes preference.<br /><br /> SQL_ATTR_CONNECTION_POOLING is implemented inside the Driver Manager. A driver does not need to implement SQL_ATTR_CONNECTION_POOLING. ODBC 2.0 and 3.0 applications can set this environment attribute.<br /><br /> For more information, see [ODBC Connection Pooling](../../../odbc/reference/develop-app/driver-manager-connection-pooling.md).|  
     * |SQL_ATTR_CP_MATCH (ODBC 3.0)|A 32-bit SQLUINTEGER value that determines how a connection is chosen from a connection pool. When **SQLConnect** or **SQLDriverConnect** is called, the Driver Manager determines which connection is reused from the pool. The Driver Manager tries to match the connection options in the call and the connection attributes set by the application to the keywords and connection attributes of the connections in the pool. The value of this attribute determines the level of precision of the matching criteria.<br /><br /> The following values are used to set the value of this attribute:<br /><br /> SQL_CP_STRICT_MATCH = Only connections that exactly match the connection options in the call and the connection attributes set by the application are reused. This is the default.<br /><br /> SQL_CP_RELAXED_MATCH = Connections with matching connection string keywords can be used. Keywords must match, but not all connection attributes must match.<br /><br /> For more information about how the Driver Manager performs the match in connecting to a pooled connection, see [SQLConnect](../../../odbc/reference/syntax/sqlconnect-function.md). For more information about connection pooling, see [ODBC Connection Pooling](../../../odbc/reference/develop-app/driver-manager-connection-pooling.md).|  
     * |SQL_ATTR_ODBC_VERSION (ODBC 3.0)|A 32-bit integer that determines whether certain functionality exhibits ODBC *2.x* behavior or ODBC *3.x* behavior. The following values are used to set the value of this attribute:<br /><br /> SQL_OV_ODBC3_80 = The Driver Manager and driver exhibit the following ODBC 3.8 behavior:<br /><br /> -   The driver returns and expects ODBC *3.x* codes for date, time, and timestamp.<br />-   The driver returns ODBC *3.x* SQLSTATE codes when **SQLError**, **SQLGetDiagField**, or **SQLGetDiagRec** is called.<br />-   The *CatalogName* argument in a call to **SQLTables** accepts a search pattern.<br />-   The Driver Manager supports C data type extensibility. For more information about C data type extensibility, see [C Data Types in ODBC](../../../odbc/reference/develop-app/c-data-types-in-odbc.md).<br /><br /> For more information, see [What's New in ODBC 3.8](../../../odbc/reference/what-s-new-in-odbc-3-8.md).<br /><br /> SQL_OV_ODBC3 = The Driver Manager and driver exhibit the following ODBC *3.x* behavior:<br /><br /> -   The driver returns and expects ODBC *3.x* codes for date, time, and timestamp.<br />-   The driver returns ODBC *3.x* SQLSTATE codes when **SQLError**, **SQLGetDiagField**, or **SQLGetDiagRec** is called.<br />-   The *CatalogName* argument in a call to **SQLTables** accepts a search pattern.<br />-   The Driver Manager does not support C data type extensibility.<br /><br /> SQL_OV_ODBC2 = The Driver Manager and driver exhibit the following ODBC *2.x* behavior. This is especially useful for an ODBC *2.x* application working with an ODBC *3.x* driver.<br /><br /> -   The driver returns and expects ODBC *2.x* codes for date, time, and timestamp.<br />-   The driver returns ODBC *2.x* SQLSTATE codes when **SQLError**, **SQLGetDiagField**, or **SQLGetDiagRec** is called.<br />-   The *CatalogName* argument in a call to **SQLTables** does not accept a search pattern.<br />-   The Driver Manager does not support C data type extensibility.<br /><br /> An application must set this environment attribute before it calls any function that has an SQLHENV argument, or the call will return SQLSTATE HY010 (Function sequence error). It is driver-specific whether additional behavior exists for these environmental flags.<br /><br /> -   For more information, see [Declaring the Application's ODBC Version](../../../odbc/reference/develop-app/declaring-the-application-s-odbc-version.md) and [Behavioral Changes](../../../odbc/reference/develop-app/behavioral-changes.md).|  
     * |SQL_ATTR_OUTPUT_NTS (ODBC 3.0)|A 32-bit integer that determines how the driver returns string data. If SQL_TRUE, the driver returns string data null-terminated. If SQL_FALSE, the driver does not return string data null-terminated.<br /><br /> This attribute defaults to SQL_TRUE. A call to **SQLSetEnvAttr** to set it to SQL_TRUE returns SQL_SUCCESS. A call to **SQLSetEnvAttr** to set it to SQL_FALSE returns SQL_ERROR and SQLSTATE HYC00 (Optional feature not implemented).|
     * @param {Pointer<Void>} EnvironmentHandle [Input] Environment handle.
     * @param {Integer} Attribute [Input] Attribute to set, listed in "Comments."
     * @param {Pointer<Void>} Value 
     * @param {Integer} StringLength [Input] If *ValuePtr* points to a character string or a binary buffer, this argument should be the length of **ValuePtr*. For character string data, this argument should contain the number of bytes in the string.  
     *   
     *  If *ValuePtr* is an integer, *StringLength* is ignored.
     * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_ERROR, or SQL_INVALID_HANDLE.
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlsetenvattr-function
     */
    static SQLSetEnvAttr(EnvironmentHandle, Attribute, Value, StringLength) {
        result := DllCall("ODBC32.dll\SQLSetEnvAttr", "ptr", EnvironmentHandle, "int", Attribute, "ptr", Value, "int", StringLength, "short")
        return result
    }

    /**
     * SQLSetStmtAttr Function
     * @remarks
     * Statement attributes for a statement remain in effect until they are changed by another call to **SQLSetStmtAttr** or until the statement is dropped by calling **SQLFreeHandle**. Calling **SQLFreeStmt** with the SQL_CLOSE, SQL_UNBIND, or SQL_RESET_PARAMS option does not reset statement attributes.  
     *   
     *  Some statement attributes support substitution of a similar value if the data source does not support the value specified in *ValuePtr*. In such cases, the driver returns SQL_SUCCESS_WITH_INFO and SQLSTATE 01S02 (Option value changed). For example, if *Attribute* is SQL_ATTR_CONCURRENCY and *ValuePtr* is SQL_CONCUR_ROWVER, and if the data source does not support this, the driver substitutes SQL_CONCUR_VALUES and returns SQL_SUCCESS_WITH_INFO. To determine the substituted value, an application calls **SQLGetStmtAttr**.  
     *   
     *  The format of information set with *ValuePtr* depends on the specified *Attribute*. **SQLSetStmtAttr** accepts attribute information in one of two different formats: a character string or an integer value. The format of each is noted in the attribute's description. This format applies to the information returned for each attribute in **SQLGetStmtAttr**. Character strings pointed to by the *ValuePtr* argument of **SQLSetStmtAttr** have a length of *StringLength*.  
     *   
     * > [!NOTE]
     * >  The ability to set statement attributes at the connection level by calling **SQLSetConnectAttr** has been deprecated in ODBC *3.x*. ODBC *3.x* applications should never set statement attributes at the connection level. ODBC *3.x* statement attributes cannot be set at the connection level, with the exception of the SQL_ATTR_METADATA_ID and SQL_ATTR_ASYNC_ENABLE attributes, which are both connection attributes and statement attributes, and can be set at either the connection level or the statement level.  
     * > 
     * > [!NOTE]
     * >  ODBC *3.x* drivers need only support this functionality if they should work with ODBC *2.x* applications that set ODBC *2.x* statement options at the connection level. For more information, see "Setting Statement Options on the Connection Level" under [SQLSetConnectOption Mapping](../../../odbc/reference/appendixes/sqlsetconnectoption-mapping.md) in Appendix G: Driver Guidelines for Backward Compatibility.
     * @param {Pointer<Void>} StatementHandle [Input] Statement handle.
     * @param {Integer} Attribute [Input] Option to set, listed in "Comments."
     * @param {Pointer<Void>} Value 
     * @param {Integer} StringLength [Input] If *Attribute* is an ODBC-defined attribute and *ValuePtr* points to a character string or a binary buffer, this argument should be the length of \**ValuePtr*. If *Attribute* is an ODBC-defined attribute and *ValuePtr* is an integer, *StringLength* is ignored.  
     *   
     *  If *Attribute* is a driver-defined attribute, the application indicates the nature of the attribute to the Driver Manager by setting the *StringLength* argument. *StringLength* can have the following values:  
     *   
     * -   If *ValuePtr* is a pointer to a character string, then *StringLength* is the length of the string or SQL_NTS.  
     *   
     * -   If *ValuePtr* is a pointer to a binary buffer, then the application places the result of the SQL_LEN_BINARY_ATTR(*length*) macro in *StringLength*. This places a negative value in *StringLength*.  
     *   
     * -   If *ValuePtr* is a pointer to a value other than a character string or a binary string, then *StringLength* should have the value SQL_IS_POINTER.  
     *   
     * -   If *ValuePtr* contains a fixed-length value, then *StringLength* is either SQL_IS_INTEGER or SQL_IS_UINTEGER, as appropriate.
     * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_ERROR, or SQL_INVALID_HANDLE.
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlsetstmtattr-function
     */
    static SQLSetStmtAttr(StatementHandle, Attribute, Value, StringLength) {
        result := DllCall("ODBC32.dll\SQLSetStmtAttr", "ptr", StatementHandle, "int", Attribute, "ptr", Value, "int", StringLength, "short")
        return result
    }

    /**
     * SQLSpecialColumns Function
     * @remarks
     * When the *IdentifierType* argument is SQL_BEST_ROWID, **SQLSpecialColumns** returns the column or columns that uniquely identify each row in the table. These columns can always be used in a *select-list* or **WHERE** clause. **SQLColumns**, which is used to return a variety of information on the columns of a table, does not necessarily return the columns that uniquely identify each row, or columns that are automatically updated when any value in the row is updated by a transaction. For example, **SQLColumns** might not return the Oracle pseudo-column ROWID. This is why **SQLSpecialColumns** is used to return these columns. For more information, see [Uses of Catalog Data](../../../odbc/reference/develop-app/uses-of-catalog-data.md).  
     *   
     * > [!NOTE]  
     * >  For more information about the general use, arguments, and returned data of ODBC catalog functions, see [Catalog Functions](../../../odbc/reference/develop-app/catalog-functions.md).  
     *   
     *  If there are no columns that uniquely identify each row in the table, **SQLSpecialColumns** returns a rowset with no rows; a subsequent call to **SQLFetch** or **SQLFetchScroll** on the statement returns SQL_NO_DATA.  
     *   
     *  If the *IdentifierType*, *Scope*, or *Nullable* arguments specify characteristics that are not supported by the data source, **SQLSpecialColumns** returns an empty result set.  
     *   
     *  If the SQL_ATTR_METADATA_ID statement attribute is set to SQL_TRUE, the *CatalogName*, *SchemaName*, and *TableName* arguments are treated as identifiers, so they cannot be set to a null pointer in certain situations. (For more information, see [Arguments in Catalog Functions](../../../odbc/reference/develop-app/arguments-in-catalog-functions.md).)  
     *   
     *  **SQLSpecialColumns** returns the results as a standard result set, ordered by SCOPE.  
     *   
     *  The following columns have been renamed for ODBC *3.x*. The column name changes do not affect backward compatibility because applications bind by column number.  
     *   
     * |ODBC 2.0 column|ODBC *3.x* column|  
     * |---------------------|-----------------------|  
     * |PRECISION|COLUMN_SIZE|  
     * |LENGTH|BUFFER_LENGTH|  
     * |SCALE|DECIMAL_DIGITS|  
     *   
     *  To determine the actual length of the COLUMN_NAME column, an application can call **SQLGetInfo** with the SQL_MAX_COLUMN_NAME_LEN option.  
     *   
     *  The following table lists the columns in the result set. Additional columns beyond column 8 (PSEUDO_COLUMN) can be defined by the driver. An application should gain access to driver-specific columns by counting down from the end of the result set rather than specifying an explicit ordinal position. For more information, see [Data Returned by Catalog Functions](../../../odbc/reference/develop-app/data-returned-by-catalog-functions.md).  
     *   
     * |Column name|Column number|Data type|Comments|  
     * |-----------------|-------------------|---------------|--------------|  
     * |SCOPE (ODBC 1.0)|1|Smallint|Actual scope of the rowid. Contains one of the following values:<br /><br /> SQL_SCOPE_CURROW SQL_SCOPE_TRANSACTION SQL_SCOPE_SESSION<br /><br /> NULL is returned when *IdentifierType* is SQL_ROWVER. For a description of each value, see the description of *Scope* in "Syntax," earlier in this section.|  
     * |COLUMN_NAME (ODBC 1.0)|2|Varchar not NULL|Column name. The driver returns an empty string for a column that does not have a name.|  
     * |DATA_TYPE (ODBC 1.0)|3|Smallint not NULL|SQL data type. This can be an ODBC SQL data type or a driver-specific SQL data type. For a list of valid ODBC SQL data types, see [SQL Data Types](../../../odbc/reference/appendixes/sql-data-types.md). For information about driver-specific SQL data types, see the driver's documentation.|  
     * |TYPE_NAME (ODBC 1.0)|4|Varchar not NULL|Data source-dependent data type name; for example, "CHAR", "VARCHAR", "MONEY", "LONG VARBINARY", or "CHAR ( ) FOR BIT DATA".|  
     * |COLUMN_SIZE (ODBC 1.0)|5|Integer|The size of the column on the data source. For more information concerning column size, see [Column Size, Decimal Digits, Transfer Octet Length, and Display Size](../../../odbc/reference/appendixes/column-size-decimal-digits-transfer-octet-length-and-display-size.md).|  
     * |BUFFER_LENGTH (ODBC 1.0)|6|Integer|The length in bytes of data transferred on an **SQLGetData** or **SQLFetch** operation if SQL_C_DEFAULT is specified. For numeric data, this size may be different than the size of the data stored on the data source. This value is the same as the COLUMN_SIZE column for character or binary data. For more information, see [Column Size, Decimal Digits, Transfer Octet Length, and Display Size](../../../odbc/reference/appendixes/column-size-decimal-digits-transfer-octet-length-and-display-size.md).|  
     * |DECIMAL_DIGITS (ODBC 1.0)|7|Smallint|The decimal digits of the column on the data source. NULL is returned for data types where decimal digits are not applicable. For more information concerning decimal digits, see [Column Size, Decimal Digits, Transfer Octet Length, and Display Size](../../../odbc/reference/appendixes/column-size-decimal-digits-transfer-octet-length-and-display-size.md).|  
     * |PSEUDO_COLUMN (ODBC 2.0)|8|Smallint|Indicates whether the column is a pseudo-column, such as Oracle ROWID:<br /><br /> SQL_PC_UNKNOWN SQL_PC_NOT_PSEUDO SQL_PC_PSEUDO **Note:**  For maximum interoperability, pseudo-columns should not be quoted with the identifier quote character returned by **SQLGetInfo**.|  
     *   
     *  After the application retrieves values for SQL_BEST_ROWID, the application can use these values to reselect that row within the defined scope. The **SELECT** statement is guaranteed to return either no rows or one row.  
     *   
     *  If an application reselects a row based on the rowid column or columns and the row is not found, the application can assume that the row was deleted or the rowid columns were modified. The opposite is not true: even if the rowid has not changed, the other columns in the row may have changed.  
     *   
     *  Columns returned for column type SQL_BEST_ROWID are useful for applications that need to scroll forward and back within a result set to retrieve the most recent data from a set of rows. The column or columns of the rowid are guaranteed not to change while positioned on that row.  
     *   
     *  The column or columns of the rowid may remain valid even when the cursor is not positioned on the row; the application can determine this by checking the SCOPE column in the result set.  
     *   
     *  Columns returned for column type SQL_ROWVER are useful for applications that need the ability to check whether any columns in a given row have been updated while the row was reselected using the rowid. For example, after reselecting a row using rowid, the application can compare the previous values in the SQL_ROWVER columns to the ones just fetched. If the value in a SQL_ROWVER column differs from the previous value, the application can alert the user that data on the display has changed.
     * @param {Pointer<Void>} StatementHandle [Input] Statement handle.
     * @param {Integer} IdentifierType [Input] Type of column to return. Must be one of the following values:  
     *   
     *  SQL_BEST_ROWID: Returns the optimal column or set of columns that, by retrieving values from the column or columns, allows any row in the specified table to be uniquely identified. A column can be either a pseudo-column specifically designed for this purpose (as in Oracle ROWID or Ingres TID) or the column or columns of any unique index for the table.  
     *   
     *  SQL_ROWVER: Returns the column or columns in the specified table, if any, that are automatically updated by the data source when any value in the row is updated by any transaction (as in SQLBase ROWID or Sybase TIMESTAMP).
     * @param {Pointer<Byte>} CatalogName [Input] Catalog name for the table. If a driver supports catalogs for some tables but not for others, such as when the driver retrieves data from different DBMSs, an empty string ("") denotes those tables that do not have catalogs. *CatalogName* cannot contain a string search pattern.  
     *   
     *  If the SQL_ATTR_METADATA_ID statement attribute is set to SQL_TRUE, *CatalogName* is treated as an identifier and its case is not significant. If it is SQL_FALSE, *CatalogName* is an ordinary argument; it is treated literally, and its case is significant. For more information, see [Arguments in Catalog Functions](../../../odbc/reference/develop-app/arguments-in-catalog-functions.md).
     * @param {Integer} NameLength1 [Input] Length in characters of **CatalogName*.
     * @param {Pointer<Byte>} SchemaName [Input] Schema name for the table. If a driver supports schemas for some tables but not for others, such as when the driver retrieves data from different DBMSs, an empty string ("") denotes those tables that do not have schemas. *SchemaName* cannot contain a string search pattern.  
     *   
     *  If the SQL_ATTR_METADATA_ID statement attribute is set to SQL_TRUE, *SchemaName* is treated as an identifier and its case is not significant. If it is SQL_FALSE, *SchemaName* is an ordinary argument; it is treated literally, and its case is significant.
     * @param {Integer} NameLength2 [Input] Length in characters of **SchemaName*.
     * @param {Pointer<Byte>} TableName [Input] Table name. This argument cannot be a null pointer. *TableName* cannot contain a string search pattern.  
     *   
     *  If the SQL_ATTR_METADATA_ID statement attribute is set to SQL_TRUE, *TableName* is treated as an identifier and its case is not significant. If it is SQL_FALSE, *TableName* is an ordinary argument; it is treated literally, and its case is significant.
     * @param {Integer} NameLength3 [Input] Length in characters of **TableName*.
     * @param {Integer} Scope [Input] Minimum required scope of the rowid. The returned rowid may be of greater scope. Must be one of the following:  
     *   
     *  SQL_SCOPE_CURROW: The rowid is guaranteed to be valid only while positioned on that row. A later reselect using rowid may not return a row if the row was updated or deleted by another transaction.  
     *   
     *  SQL_SCOPE_TRANSACTION: The rowid is guaranteed to be valid for the duration of the current transaction.  
     *   
     *  SQL_SCOPE_SESSION: The rowid is guaranteed to be valid for the duration of the session (across transaction boundaries).
     * @param {Integer} Nullable [Input] Determines whether to return special columns that can have a NULL value. Must be one of the following:  
     *   
     *  SQL_NO_NULLS: Exclude special columns that can have NULL values. Some drivers cannot support SQL_NO_NULLS, and these drivers will return an empty result set if SQL_NO_NULLS was specified. Applications should be prepared for this case and request SQL_NO_NULLS only if it is absolutely required.  
     *   
     *  SQL_NULLABLE: Return special columns even if they can have NULL values.
     * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_STILL_EXECUTING, SQL_ERROR, or SQL_INVALID_HANDLE.
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlspecialcolumns-function
     */
    static SQLSpecialColumns(StatementHandle, IdentifierType, CatalogName, NameLength1, SchemaName, NameLength2, TableName, NameLength3, Scope, Nullable) {
        result := DllCall("ODBC32.dll\SQLSpecialColumns", "ptr", StatementHandle, "ushort", IdentifierType, "ptr", CatalogName, "short", NameLength1, "ptr", SchemaName, "short", NameLength2, "ptr", TableName, "short", NameLength3, "ushort", Scope, "ushort", Nullable, "short")
        return result
    }

    /**
     * SQLStatistics Function
     * @remarks
     * **SQLStatistics** returns information about a single table as a standard result set, ordered by NON_UNIQUE, TYPE, INDEX_QUALIFIER, INDEX_NAME, and ORDINAL_POSITION. The result set combines statistics information (in the CARDINALITY and PAGES columns of the result set) for the table with information about each index. For information about how this information might be used, see [Uses of Catalog Data](../../../odbc/reference/develop-app/uses-of-catalog-data.md).  
     *   
     *  To determine the actual lengths of the TABLE_CAT, TABLE_SCHEM, TABLE_NAME, and COLUMN_NAME columns, an application can call **SQLGetInfo** with the SQL_MAX_CATALOG_NAME_LEN, SQL_MAX_SCHEMA_NAME_LEN, SQL_MAX_TABLE_NAME_LEN, and SQL_MAX_COLUMN_NAME_LEN options.  
     *   
     * > [!NOTE]  
     * >  For more information about the general use, arguments, and returned data of ODBC catalog functions, see [Catalog Functions](../../../odbc/reference/develop-app/catalog-functions.md).  
     *   
     *  The following columns have been renamed for ODBC *3.x*. The column name changes do not affect backward compatibility because applications bind by column number.  
     *   
     * |ODBC 2.0 column|ODBC *3.x* column|  
     * |---------------------|-----------------------|  
     * |TABLE_QUALIFIER|TABLE_CAT|  
     * |TABLE_OWNER|TABLE_SCHEM|  
     * |SEQ_IN_INDEX|ORDINAL_POSITION|  
     * |COLLATION|ASC_OR_DESC|  
     *   
     *  The following table lists the columns in the result set. Additional columns beyond column 13 (FILTER_CONDITION) can be defined by the driver. An application should gain access to driver-specific columns by counting down from the end of the result set instead of specifying an explicit ordinal position. For more information, see [Data Returned by Catalog Functions](../../../odbc/reference/develop-app/data-returned-by-catalog-functions.md).  
     *   
     * |Column name|Column number|Data type|Comments|  
     * |-----------------|-------------------|---------------|--------------|  
     * |TABLE_CAT (ODBC 1.0)|1|Varchar|Catalog name of the table to which the statistic or index applies; NULL if not applicable to the data source. If a driver supports catalogs for some tables but not for others, such as when the driver retrieves data from different DBMSs, it returns an empty string ("") for those tables that do not have catalogs.|  
     * |TABLE_SCHEM (ODBC 1.0)|2|Varchar|Schema name of the table to which the statistic or index applies; NULL if not applicable to the data source. If a driver supports schemas for some tables but not for others, such as when the driver retrieves data from different DBMSs, it returns an empty string ("") for those tables that do not have schemas.|  
     * |TABLE_NAME (ODBC 1.0)|3|Varchar not NULL|Table name of the table to which the statistic or index applies.|  
     * |NON_UNIQUE (ODBC 1.0)|4|Smallint|Indicates whether the index does not allow duplicate values:<br /><br /> SQL_TRUE if the index values can be nonunique.<br /><br /> SQL_FALSE if the index values must be unique.<br /><br /> NULL is returned if TYPE is SQL_TABLE_STAT.|  
     * |INDEX_QUALIFIER (ODBC 1.0)|5|Varchar|The identifier that is used to qualify the index name doing a **DROP INDEX**; NULL is returned if an index qualifier is not supported by the data source or if TYPE is SQL_TABLE_STAT. If a non-null value is returned in this column, it must be used to qualify the index name on a **DROP INDEX** statement; otherwise, the TABLE_SCHEM should be used to qualify the index name.|  
     * |INDEX_NAME (ODBC 1.0)|6|Varchar|Index name; NULL is returned if TYPE is SQL_TABLE_STAT.|  
     * |TYPE (ODBC 1.0)|7|Smallint not NULL|Type of information being returned:<br /><br /> SQL_TABLE_STAT indicates a statistic for the table (in the CARDINALITY or PAGES column).<br /><br /> SQL_INDEX_BTREE indicates a B-Tree index.<br /><br /> SQL_INDEX_CLUSTERED indicates a clustered index.<br /><br /> SQL_INDEX_CONTENT indicates a content index.<br /><br /> SQL_INDEX_HASHED indicates a hashed index.<br /><br /> SQL_INDEX_OTHER indicates another type of index.|  
     * |ORDINAL_POSITION (ODBC 1.0)|8|Smallint|Column sequence number in index (starting with 1); NULL is returned if TYPE is SQL_TABLE_STAT.|  
     * |COLUMN_NAME (ODBC 1.0)|9|Varchar|Column name. If the column is based on an expression, such as SALARY + BENEFITS, the expression is returned; if the expression cannot be determined, an empty string is returned. NULL is returned if TYPE is SQL_TABLE_STAT.|  
     * |ASC_OR_DESC (ODBC 1.0)|10|Char(1)|Sort sequence for the column: "A" for ascending; "D" for descending; NULL is returned if column sort sequence is not supported by the data source or if TYPE is SQL_TABLE_STAT.|  
     * |CARDINALITY (ODBC 1.0)|11|Integer|Cardinality of table or index; number of rows in table if TYPE is SQL_TABLE_STAT; number of unique values in the index if TYPE is not SQL_TABLE_STAT; NULL is returned if the value is not available from the data source.|  
     * |PAGES (ODBC 1.0)|12|Integer|Number of pages used to store the index or table; number of pages for the table if TYPE is SQL_TABLE_STAT; number of pages for the index if TYPE is not SQL_TABLE_STAT; NULL is returned if the value is not available from the data source or if not applicable to the data source.|  
     * |FILTER_CONDITION (ODBC 2.0)|13|Varchar|If the index is a filtered index, this is the filter condition, such as SALARY > 30000; if the filter condition cannot be determined, this is an empty string.<br /><br /> NULL if the index is not a filtered index, it cannot be determined whether the index is a filtered index, or TYPE is SQL_TABLE_STAT.|  
     *   
     *  If the row in the result set corresponds to a table, the driver sets TYPE to SQL_TABLE_STAT and sets NON_UNIQUE, INDEX_QUALIFIER, INDEX_NAME, ORDINAL_POSITION, COLUMN_NAME, and ASC_OR_DESC to NULL. If CARDINALITY or PAGES are not available from the data source, the driver sets them to NULL.
     * @param {Pointer<Void>} StatementHandle [Input] Statement handle.
     * @param {Pointer<Byte>} CatalogName [Input] Catalog name. If a driver supports catalogs for some tables but not for others, such as when the driver retrieves data from different DBMSs, an empty string ("") indicates those tables that do not have catalogs. *CatalogName* cannot contain a string search pattern.  
     *   
     *  If the SQL_ATTR_METADATA_ID statement attribute is set to SQL_TRUE, *CatalogName* is treated as an identifier and its case is not significant. If it is SQL_FALSE, *CatalogName* is an ordinary argument; it is treated literally, and its case is significant. For more information, see [Arguments in Catalog Functions](../../../odbc/reference/develop-app/arguments-in-catalog-functions.md).
     * @param {Integer} NameLength1 [Input] Length in characters of **CatalogName*.
     * @param {Pointer<Byte>} SchemaName [Input] Schema name. If a driver supports schemas for some tables but not for others, such as when the driver retrieves data from different DBMSs, an empty string ("") indicates those tables that do not have schemas. *SchemaName* cannot contain a string search pattern.  
     *   
     *  If the SQL_ATTR_METADATA_ID statement attribute is set to SQL_TRUE, *SchemaName* is treated as an identifier and its case is not significant. If it is SQL_FALSE, *SchemaName* is an ordinary argument; it is treated literally, and its case is significant.
     * @param {Integer} NameLength2 [Input] Length in characters of **SchemaName*.
     * @param {Pointer<Byte>} TableName [Input] Table name. This argument cannot be a null pointer. *SchemaName* cannot contain a string search pattern.  
     *   
     *  If the SQL_ATTR_METADATA_ID statement attribute is set to SQL_TRUE, *TableName* is treated as an identifier and its case is not significant. If it is SQL_FALSE, *TableName* is an ordinary argument; it is treated literally, and its case is significant.
     * @param {Integer} NameLength3 [Input] Length in characters of **TableName*.
     * @param {Integer} Unique [Input] Type of index: SQL_INDEX_UNIQUE or SQL_INDEX_ALL.
     * @param {Integer} Reserved [Input] Indicates the importance of the CARDINALITY and PAGES columns in the result set. The following options affect the return of the CARDINALITY and PAGES columns only; index information is returned even if CARDINALITY and PAGES are not returned.  
     *   
     *  SQL_ENSURE requests that the driver unconditionally retrieve the statistics. (Drivers that conform only to the Open Group standard and do not support ODBC extensions will not be able to support SQL_ENSURE.)  
     *   
     *  SQL_QUICK requests that the driver retrieve the CARDINALITY and PAGES only if they are readily available from the server. In this case, the driver does not ensure that the values are current. (Applications that are written to the Open Group standard will always get SQL_QUICK behavior from ODBC *3.x*-compliant drivers.)
     * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_STILL_EXECUTING, SQL_ERROR, or SQL_INVALID_HANDLE.
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlstatistics-function
     */
    static SQLStatistics(StatementHandle, CatalogName, NameLength1, SchemaName, NameLength2, TableName, NameLength3, Unique, Reserved) {
        result := DllCall("ODBC32.dll\SQLStatistics", "ptr", StatementHandle, "ptr", CatalogName, "short", NameLength1, "ptr", SchemaName, "short", NameLength2, "ptr", TableName, "short", NameLength3, "ushort", Unique, "ushort", Reserved, "short")
        return result
    }

    /**
     * SQLTables Function
     * @remarks
     * **SQLTables** lists all tables in the requested range. A user may or may not have SELECT privileges to any of these tables. To check accessibility, an application can:  
     *   
     * -   Call **SQLGetInfo** and check the SQL_ACCESSIBLE_TABLES information type.  
     *   
     * -   Call **SQLTablePrivileges** to check the privileges for each table.  
     *   
     *  Otherwise, the application must be able to handle a situation where the user selects a table for which **SELECT** privileges are not granted.  
     *   
     *  The *SchemaName* and *TableName* arguments accept search patterns. The *CatalogName* argument accepts search patterns if the SQL_ODBC_VERSION environment attribute is SQL_OV_ODBC3; it does not accept search patterns if SQL_OV_ODBC2 is set. If SQL_OV_ODBC3 is set, an ODBC 3*.x* driver will require that wildcard characters in the *CatalogName* argument be escaped to be treated literally. For more information about valid search patterns, see [Pattern Value Arguments](../../../odbc/reference/develop-app/pattern-value-arguments.md).  
     *   
     * > [!NOTE]  
     * >  For more information about the general use, arguments, and returned data of ODBC catalog functions, see [Catalog Functions](../../../odbc/reference/develop-app/catalog-functions.md).  
     *   
     *  To support enumeration of catalogs, schemas, and table types, the following special semantics are defined for the *CatalogName*, *SchemaName*, *TableName*, and *TableType* arguments of **SQLTables**:  
     *   
     * -   If *CatalogName* is SQL_ALL_CATALOGS and *SchemaName* and *TableName* are empty strings, the result set contains a list of valid catalogs for the data source. (All columns except the TABLE_CAT column contain NULLs.)  
     *   
     * -   If *SchemaName* is SQL_ALL_SCHEMAS and *CatalogName* and *TableName* are empty strings, the result set contains a list of valid schemas for the data source. (All columns except the TABLE_SCHEM column contain NULLs.)  
     *   
     * -   If *TableType* is SQL_ALL_TABLE_TYPES and *CatalogName*, *SchemaName*, and *TableName* are empty strings, the result set contains a list of valid table types for the data source. (All columns except the TABLE_TYPE column contain NULLs.)  
     *   
     *  If *TableType* is not an empty string, it must contain a list of comma-separated values for the types of interest; each value can be enclosed in single quotation marks (') or unquoted, for example, 'TABLE', 'VIEW' or TABLE, VIEW. An application should always specify the table type in uppercase; the driver should convert the table type to whatever case is needed by the data source. If the data source does not support a specified table type, **SQLTables** does not return any results for that type.  
     *   
     *  **SQLTables** returns the results as a standard result set, ordered by TABLE_TYPE, TABLE_CAT, TABLE_SCHEM, and TABLE_NAME. For information about how this information might be used, see [Uses of Catalog Data](../../../odbc/reference/develop-app/uses-of-catalog-data.md).  
     *   
     *  To determine the actual lengths of the TABLE_CAT, TABLE_SCHEM, and TABLE_NAME columns, an application can call **SQLGetInfo** with the SQL_MAX_CATALOG_NAME_LEN, SQL_MAX_SCHEMA_NAME_LEN, and SQL_MAX_TABLE_NAME_LEN information types.  
     *   
     *  The following columns have been renamed for ODBC 3*.x*. The column name changes do not affect backward compatibility because applications bind by column number.  
     *   
     * |ODBC 2.0 column|ODBC 3*.x* column|  
     * |---------------------|-----------------------|  
     * |TABLE_QUALIFIER|TABLE_CAT|  
     * |TABLE_OWNER|TABLE_SCHEM|  
     *   
     *  The following table lists the columns in the result set. Additional columns beyond column 5 (REMARKS) can be defined by the driver. An application should gain access to driver-specific columns by counting down from the end of the result set instead of specifying an explicit ordinal position. For more information, see [Data Returned by Catalog Functions](../../../odbc/reference/develop-app/data-returned-by-catalog-functions.md).  
     *   
     * |Column name|Column number|Data type|Comments|  
     * |-----------------|-------------------|---------------|--------------|  
     * |TABLE_CAT (ODBC 1.0)|1|Varchar|Catalog name; NULL if not applicable to the data source. If a driver supports catalogs for some tables but not for others, such as when the driver retrieves data from different DBMSs, it returns an empty string ("") for those tables that do not have catalogs.|  
     * |TABLE_SCHEM (ODBC 1.0)|2|Varchar|Schema name; NULL if not applicable to the data source. If a driver supports schemas for some tables but not for others, such as when the driver retrieves data from different DBMSs, it returns an empty string ("") for those tables that do not have schemas.|  
     * |TABLE_NAME (ODBC 1.0)|3|Varchar|Table name.|  
     * |TABLE_TYPE (ODBC 1.0)|4|Varchar|Table type name; one of the following: "TABLE", "VIEW", "SYSTEM TABLE", "GLOBAL TEMPORARY", "LOCAL TEMPORARY", "ALIAS", "SYNONYM", or a data source-specific type name.<br /><br /> The meanings of "ALIAS" and "SYNONYM" are driver-specific.|  
     * |REMARKS (ODBC 1.0)|5|Varchar|A description of the table.|
     * @param {Pointer<Void>} StatementHandle [Input] Statement handle for retrieved results.
     * @param {Pointer<Byte>} CatalogName [Input] Catalog name. The *CatalogName* argument accepts search patterns if the SQL_ODBC_VERSION environment attribute is SQL_OV_ODBC3; it does not accept search patterns if SQL_OV_ODBC2 is set. If a driver supports catalogs for some tables but not for others, such as when a driver retrieves data from different DBMSs, an empty string ("") indicates those tables that do not have catalogs.  
     *   
     *  If the SQL_ATTR_METADATA_ID statement attribute is set to SQL_TRUE, *CatalogName* is treated as an identifier and its case is not significant. If it is SQL_FALSE, *CatalogName* is a pattern value argument; it is treated literally, and its case is significant. For more information, see [Arguments in Catalog Functions](../../../odbc/reference/develop-app/arguments-in-catalog-functions.md).
     * @param {Integer} NameLength1 [Input] Length in characters of **CatalogName*.
     * @param {Pointer<Byte>} SchemaName [Input] String search pattern for schema names. If a driver supports schemas for some tables but not for others, such as when the driver retrieves data from different DBMSs, an empty string ("") indicates those tables that do not have schemas.  
     *   
     *  If the SQL_ATTR_METADATA_ID statement attribute is set to SQL_TRUE, *SchemaName* is treated as an identifier and its case is not significant. If it is SQL_FALSE, *SchemaName* is a pattern value argument; it is treated literally, and its case is significant.
     * @param {Integer} NameLength2 [Input] Length in characters of **SchemaName*.
     * @param {Pointer<Byte>} TableName [Input] String search pattern for table names.  
     *   
     *  If the SQL_ATTR_METADATA_ID statement attribute is set to SQL_TRUE, *TableName* is treated as an identifier and its case is not significant. If it is SQL_FALSE, *TableName* is a pattern value argument; it is treated literally, and its case is significant.
     * @param {Integer} NameLength3 [Input] Length in characters of **TableName*.
     * @param {Pointer<Byte>} TableType [Input] List of table types to match.  
     *   
     *  Notice that the SQL_ATTR_METADATA_ID statement attribute has no effect upon the *TableType* argument. *TableType* is a value list argument, regardless of the setting of SQL_ATTR_METADATA_ID.
     * @param {Integer} NameLength4 [Input] Length in characters of **TableType*.
     * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_STILL_EXECUTING, SQL_ERROR, or SQL_INVALID_HANDLE.
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqltables-function
     */
    static SQLTables(StatementHandle, CatalogName, NameLength1, SchemaName, NameLength2, TableName, NameLength3, TableType, NameLength4) {
        result := DllCall("ODBC32.dll\SQLTables", "ptr", StatementHandle, "ptr", CatalogName, "short", NameLength1, "ptr", SchemaName, "short", NameLength2, "ptr", TableName, "short", NameLength3, "ptr", TableType, "short", NameLength4, "short")
        return result
    }

    /**
     * SQLTransact Function
     * @param {Pointer<Void>} EnvironmentHandle 
     * @param {Pointer<Void>} ConnectionHandle 
     * @param {Integer} CompletionType 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqltransact-function
     */
    static SQLTransact(EnvironmentHandle, ConnectionHandle, CompletionType) {
        result := DllCall("ODBC32.dll\SQLTransact", "ptr", EnvironmentHandle, "ptr", ConnectionHandle, "ushort", CompletionType, "short")
        return result
    }

    /**
     * bcp_batch
     * @remarks
     * Bulk copy batches define transactions. When an application uses [bcp_bind](../../relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-bind.md) and **bcp_sendrow** to bulk copy rows from program variables to SQL Server tables, the rows are committed only when the program calls **bcp_batch** or [bcp_done](../../relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-done.md).  
     *   
     *  You can call **bcp_batch** once every *n* rows or when there is a lull in incoming data (as in a telemetry application). If an application does not call **bcp_batch** the bulk copied rows are committed only when **bcp_done** is called.
     * @param {Pointer<Void>} param0 
     * @returns {Integer} The number of rows saved after the last call to **bcp_batch**, or -1 in case of error.
     * @see https://learn.microsoft.com/sql/relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-batch
     */
    static bcp_batch(param0) {
        result := DllCall("odbcbcp.dll\bcp_batch", "ptr", param0, "int")
        return result
    }

    /**
     * bcp_bind
     * @remarks
     * Use **bcp_bind** for a fast, efficient way to copy data from a program variable into a table in [!INCLUDE[ssNoVersion](../../includes/ssnoversion-md.md)].  
     * 
     * Call [bcp_init](../../relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-init.md) before calling this or any other bulk-copy function. Calling **bcp_init** sets the [!INCLUDE[ssNoVersion](../../includes/ssnoversion-md.md)] target table for bulk copy. When calling **bcp_init** for use with **bcp_bind** and [bcp_sendrow](../../relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-sendrow.md), the **bcp_init** _szDataFile_ parameter, indicating the data file, is set to NULL; the **bcp_init**_eDirection_ parameter is set to DB_IN.  
     * 
     * Make a separate **bcp_bind** call for every column in the [!INCLUDE[ssNoVersion](../../includes/ssnoversion-md.md)] table into which you want to copy. After the necessary **bcp_bind** calls have been made, then call **bcp_sendrow** to send a row of data from your program variables to [!INCLUDE[ssNoVersion](../../includes/ssnoversion-md.md)]. Rebinding a column is not supported.
     * 
     * Whenever you want [!INCLUDE[ssNoVersion](../../includes/ssnoversion-md.md)] to commit the rows already received, call [bcp_batch](../../relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-batch.md). For example, call **bcp_batch** once for every 1000 rows inserted or at any other interval.  
     * 
     * When there are no more rows to be inserted, call [bcp_done](../../relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-done.md). Failure to do so results in an error.
     * 
     * Control parameter settings, specified with [bcp_control](../../relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-control.md), have no effect on **bcp_bind** row transfers.  
     * 
     * If *pData* for a column is set to NULL because its value will be supplied by calls to [bcp_moretext](../../relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-moretext.md), any subsequent columns with *eDataType* set to SQLTEXT, SQLNTEXT, SQLXML, SQLUDT, SQLCHARACTER, SQLVARCHAR, SQLVARBINARY, SQLBINARY, SQLNCHAR, or SQLIMAGE must also be bound with *pData* set to NULL, and their values must also be supplied by calls to **bcp_moretext**.  
     * 
     * For new large value types, such as **varchar(max)**, **varbinary(max)**, or **nvarchar(max)**, you can use SQLCHARACTER, SQLVARCHAR, SQLVARBINARY, SQLBINARY, and SQLNCHAR as type indicators in the *eDataType* parameter.  
     * 
     * If *cbTerm* is not 0, any value (1, 2, 4, or 8) is valid for the prefix (*cbIndicator*). In this situation, [!INCLUDE[ssNoVersion](../../includes/ssnoversion-md.md)] Native Client will search for the terminator, calculate data length with respect to the terminator (*i*), and set the *cbData* to the smaller value of i and the value of prefix.  
     * 
     * If *cbTerm* is 0 and *cbIndicator* (the prefix) is not 0, *cbIndicator* must be 8. The 8-byte prefix can take the following values:  
     * 
     * - 0xFFFFFFFFFFFFFFFF means a null value for the field  
     * 
     * - 0xFFFFFFFFFFFFFFFE is treated as a special prefix value, which is used for efficiently sending data in chunks to the server. The format of data with this special prefix is:  
     * 
     * - <SPECIAL_PREFIX> \<0 or more  DATA CHUNKS> <ZERO_CHUNK> where:  
     * 
     * - SPECIAL_PREFIX is 0xFFFFFFFFFFFFFFFE  
     * 
     * - DATA_CHUNK is a 4-byte prefix containing length of the chunk, followed by the actual data whose length is specified in the 4-byte prefix.  
     * 
     * - ZERO_CHUNK is a 4-byte value containing all zeros (00000000) indicating the end of data.  
     * 
     * - Any other valid 8-byte length is treated as a regular data length.  
     * 
     *  Calling [bcp_columns](../../relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-columns.md) when using **bcp_bind** results in an error.
     * @param {Pointer<Void>} param0 
     * @param {Pointer<Byte>} param1 
     * @param {Integer} param2 
     * @param {Integer} param3 
     * @param {Pointer<Byte>} param4 
     * @param {Integer} param5 
     * @param {Integer} param6 
     * @param {Integer} param7 
     * @returns {Integer} SUCCEED or FAIL.
     * @see https://learn.microsoft.com/sql/relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-bind
     */
    static bcp_bind(param0, param1, param2, param3, param4, param5, param6, param7) {
        result := DllCall("odbcbcp.dll\bcp_bind", "ptr", param0, "ptr", param1, "int", param2, "int", param3, "ptr", param4, "int", param5, "int", param6, "int", param7, "short")
        return result
    }

    /**
     * bcp_colfmt
     * @remarks
     * The **bcp_colfmt** function allows you to specify the user-file format for bulk copies. For bulk copy, a format contains the following parts:  
     *   
     * -   A mapping from user-file columns to database columns.  
     *   
     * -   The data type of each user-file column.  
     *   
     * -   The length of the optional indicator for each column.  
     *   
     * -   The maximum length of data per user-file column.  
     *   
     * -   The optional terminating byte sequence for each column.  
     *   
     * -   The length of the optional terminating byte sequence.  
     *   
     *  Each call to **bcp_colfmt** specifies the format for one user-file column. For example, to change the default settings for three columns in a five-column user data file, first call [bcp_columns](../../relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-columns.md)**(5)**, and then call **bcp_colfmt** five times, with three of those calls setting your custom format. For the remaining two calls, set *eUserDataType* to 0, and set *cbIndicator*, *cbUserData*, and *cbUserDataTerm* to 0, SQL_VARLEN_DATA, and 0 respectively. This procedure copies all five columns, three with your customized format and two with the default format.  
     *   
     *  For *cbIndicator*, a value of 8 to indicate a large value type is now valid. If the prefix is specified for a field whose corresponding column is a new max type, it can only be set to 8. For details, see [bcp_bind](../../relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-bind.md).  
     *   
     *  The **bcp_columns** function must be called before any calls to **bcp_colfmt**.  
     *   
     *  You must call **bcp_colfmt** once for each column in the user file.  
     *   
     *  Calling **bcp_colfmt** more than once for any user-file column causes an error.  
     *   
     *  You do not need to copy all data in a user file to the [!INCLUDE[ssNoVersion](../../includes/ssnoversion-md.md)] table. To skip a column, specify the format of the data for the column, setting the *idxServerCol* parameter to 0. If you want to skip a column, you must specify its type.  
     *   
     *  The [bcp_writefmt](../../relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-writefmt.md) function can be used to persist the format specification.
     * @param {Pointer<Void>} param0 
     * @param {Integer} param1 
     * @param {Integer} param2 
     * @param {Integer} param3 
     * @param {Integer} param4 
     * @param {Pointer<Byte>} param5 
     * @param {Integer} param6 
     * @param {Integer} param7 
     * @returns {Integer} SUCCEED or FAIL.
     * @see https://learn.microsoft.com/sql/relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-colfmt
     */
    static bcp_colfmt(param0, param1, param2, param3, param4, param5, param6, param7) {
        result := DllCall("odbcbcp.dll\bcp_colfmt", "ptr", param0, "int", param1, "char", param2, "int", param3, "int", param4, "ptr", param5, "int", param6, "int", param7, "short")
        return result
    }

    /**
     * bcp_collen
     * @remarks
     * The **bcp_collen** function allows you to change the data length in the program variable for a particular column when copying data to [!INCLUDE[ssNoVersion](../../includes/ssnoversion-md.md)] with [bcp_sendrow](../../relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-sendrow.md).  
     *   
     *  Initially, the data length is determined when [bcp_bind](../../relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-bind.md) is called. If the data length changes between calls to **bcp_sendrow** and no length prefix or terminator is being used, you can call **bcp_collen** to reset the length. The next call to **bcp_sendrow** uses the length set by the call to **bcp_collen**.  
     *   
     *  You must call **bcp_collen** once for each column in the table whose data length you want to modify.
     * @param {Pointer<Void>} param0 
     * @param {Integer} param1 
     * @param {Integer} param2 
     * @returns {Integer} SUCCEED or FAIL.
     * @see https://learn.microsoft.com/sql/relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-collen
     */
    static bcp_collen(param0, param1, param2) {
        result := DllCall("odbcbcp.dll\bcp_collen", "ptr", param0, "int", param1, "int", param2, "short")
        return result
    }

    /**
     * bcp_colptr
     * @remarks
     * The **bcp_colptr** function allows you to change the address of source data for a particular column when copying data to SQL Server with [bcp_sendrow](../../relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-sendrow.md).  
     *   
     *  Initially, the pointer to user data is set by a call to **bcp_bind**. If the program variable data address changes between calls to **bcp_sendrow**, you can call **bcp_colptr** to reset the pointer to the data. The next call to **bcp_sendrow** sends the data addressed by the call to **bcp_colptr**.  
     *   
     *  There must be a separate **bcp_colptr** call for every column in the table whose data address you want to modify.
     * @param {Pointer<Void>} param0 
     * @param {Pointer<Byte>} param1 
     * @param {Integer} param2 
     * @returns {Integer} SUCCEED or FAIL.
     * @see https://learn.microsoft.com/sql/relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-colptr
     */
    static bcp_colptr(param0, param1, param2) {
        result := DllCall("odbcbcp.dll\bcp_colptr", "ptr", param0, "ptr", param1, "int", param2, "short")
        return result
    }

    /**
     * bcp_columns
     * @remarks
     * This function can be called only after [bcp_init](../../relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-init.md) has been called with a valid file name.  
     *   
     *  You should call this function only if you intend to use a user-file format that differs from the default. For more information about a description of the default user-file format, see **bcp_init**.  
     *   
     *  After calling **bcp_columns**, you must call [bcp_colfmt](../../relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-colfmt.md) for each column in the user file to completely define a custom file format.
     * @param {Pointer<Void>} param0 
     * @param {Integer} param1 
     * @returns {Integer} SUCCEED or FAIL.
     * @see https://learn.microsoft.com/sql/relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-columns
     */
    static bcp_columns(param0, param1) {
        result := DllCall("odbcbcp.dll\bcp_columns", "ptr", param0, "int", param1, "short")
        return result
    }

    /**
     * bcp_control
     * @remarks
     * This function sets various control parameters for bulk-copy operations, including the number of errors allowed before canceling a bulk copy, the numbers of the first and last rows to copy from a data file, and the batch size.  
     *   
     *  This function is also used to specify the SELECT statement when bulk copying out from [!INCLUDE[ssNoVersion](../../includes/ssnoversion-md.md)] the result set of a SELECT. Set *eOption* to BCPHINTS and set *iValue* to have a pointer to an SQLTCHAR string containing the SELECT statement.  
     *   
     *  These control parameters are only meaningful when copying between a user file and an [!INCLUDE[ssNoVersion](../../includes/ssnoversion-md.md)] table. Control parameter settings have no effect on rows copied to [!INCLUDE[ssNoVersion](../../includes/ssnoversion-md.md)] with [bcp_sendrow](../../relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-sendrow.md).
     * @param {Pointer<Void>} param0 
     * @param {Integer} param1 
     * @param {Pointer<Void>} param2 
     * @returns {Integer} SUCCEED or FAIL.
     * @see https://learn.microsoft.com/sql/relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-control
     */
    static bcp_control(param0, param1, param2) {
        result := DllCall("odbcbcp.dll\bcp_control", "ptr", param0, "int", param1, "ptr", param2, "short")
        return result
    }

    /**
     * bcp_done
     * @remarks
     * Call **bcp_done** after the last call to [bcp_sendrow](../../relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-sendrow.md) or [bcp_moretext](../../relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-moretext.md). Failure to call **bcp_done** after copying all data results in errors.
     * @param {Pointer<Void>} param0 
     * @returns {Integer} The number of rows permanently saved after the last call to [bcp_batch](../../relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-batch.md) or -1 in case of error.
     * @see https://learn.microsoft.com/sql/relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-done
     */
    static bcp_done(param0) {
        result := DllCall("odbcbcp.dll\bcp_done", "ptr", param0, "int")
        return result
    }

    /**
     * bcp_exec
     * @remarks
     * This function copies data from a user file to a database table or vice versa, depending on the value of the *eDirection* parameter in [bcp_init](../../relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-init.md).  
     *   
     *  Before calling **bcp_exec**, call **bcp_init** with a valid user file name. Failure to do so results in an error.  
     *   
     *  **bcp_exec** is the only bulk copy function that is likely to be outstanding for any length of time. It is therefore the only bulk copy function that supports asynchronous mode. To set asynchronous mode, use [SQLSetConnectAttr](../../relational-databases/native-client-odbc-api/sqlsetconnectattr.md) to set SQL_ATTR_ASYNC_ENABLE to SQL_ASYNC_ENABLE_ON before calling **bcp_exec**. To test for completion, call **bcp_exec** with the same parameters. If the bulk copy has not yet completed, **bcp_exec** returns SUCCEED_ASYNC. It also returns in *pnRowsProcessed* a status count of the number of rows that have been sent to the server. Rows sent to the server are not committed until the end of a batch has been reached.  
     *   
     *  For information about a breaking change in bulk-copying beginning in [!INCLUDE[ssVersion2005](../../includes/ssversion2005-md.md)], see [Performing Bulk Copy Operations &#40;ODBC&#41;](../../relational-databases/native-client-odbc-bulk-copy-operations/performing-bulk-copy-operations-odbc.md).
     * @param {Pointer<Void>} param0 
     * @param {Pointer<Int32>} param1 
     * @returns {Integer} SUCCEED, SUCCEED_ASYNC, or FAIL. The **bcp_exec** function returns SUCCEED if all rows are copied. **bcp_exec** returns SUCCEED_ASYNC if an asynchronous bulk copy operation is still outstanding. **bcp_exec** returns FAIL if a complete failure occurs, or if the number of rows generating errors reaches the value specified for BCPMAXERRS using [bcp_control](../../relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-control.md). BCPMAXERRS defaults to 10. The BCPMAXERRS option affects only the syntax errors detected by the provider while reading the rows from the data file (and not the rows sent to the server). Server aborts the batch when it detects an error with a row. Check the *pnRowsProcessed* parameter for the number of rows successfully copied.
     * @see https://learn.microsoft.com/sql/relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-exec
     */
    static bcp_exec(param0, param1) {
        result := DllCall("odbcbcp.dll\bcp_exec", "ptr", param0, "ptr", param1, "short")
        return result
    }

    /**
     * bcp_getcolfmt
     * @remarks
     * Column format property values are listed in the [bcp_setcolfmt](../../relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-setcolfmt.md) topic. The column format property values are set by calling the **bcp_setcolfmt** function, and the **bcp_getcolfmt** function is used to find the column format property value.  
     *   
     *  Behavior changes may be observed when connecting to a [!INCLUDE[ssSQL11](../../includes/sssql11-md.md)] (or later) server computer, compared to earlier [!INCLUDE[ssNoVersion](../../includes/ssnoversion-md.md)] versions. For more information, see [Metadata Discovery](../../relational-databases/native-client/features/metadata-discovery.md).
     * @param {Pointer<Void>} param0 
     * @param {Integer} param1 
     * @param {Integer} param2 
     * @param {Pointer<Void>} param3 
     * @param {Integer} param4 
     * @param {Pointer<Int32>} param5 
     * @returns {Integer} SUCCEED or FAIL.
     * @see https://learn.microsoft.com/sql/relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-getcolfmt
     */
    static bcp_getcolfmt(param0, param1, param2, param3, param4, param5) {
        result := DllCall("odbcbcp.dll\bcp_getcolfmt", "ptr", param0, "int", param1, "int", param2, "ptr", param3, "int", param4, "ptr", param5, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} param0 
     * @param {Pointer<PSTR>} param1 
     * @param {Pointer<PSTR>} param2 
     * @param {Pointer<PSTR>} param3 
     * @param {Integer} param4 
     * @returns {Integer} 
     */
    static bcp_initA(param0, param1, param2, param3, param4) {
        result := DllCall("odbcbcp.dll\bcp_initA", "ptr", param0, "ptr", param1, "ptr", param2, "ptr", param3, "int", param4, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} param0 
     * @param {Pointer<PWSTR>} param1 
     * @param {Pointer<PWSTR>} param2 
     * @param {Pointer<PWSTR>} param3 
     * @param {Integer} param4 
     * @returns {Integer} 
     */
    static bcp_initW(param0, param1, param2, param3, param4) {
        result := DllCall("odbcbcp.dll\bcp_initW", "ptr", param0, "ptr", param1, "ptr", param2, "ptr", param3, "int", param4, "short")
        return result
    }

    /**
     * bcp_moretext
     * @remarks
     * This function can be used in conjunction with [bcp_bind](../../relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-bind.md) and [bcp_sendrow](../../relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-sendrow.md) to copy long, variable-length data values to SQL Server in a number of smaller chunks. **bcp_moretext** can be used with columns that have the following SQL Server data types: **text**, **ntext**, **image**, **varchar(max)**, **nvarchar(max)**, **varbinary(max)**, user-defined type (UDT), and XML. **bcp_moretext** does not support data conversions, the data supplied must match the data type of the target column.  
     *   
     *  If **bcp_bind** is called with a non-NULL *pData* parameter for data types that are supported by **bcp_moretext**, **bcp_sendrow** sends the entire data value, regardless of length. If, however, **bcp_bind** has a NULL *pData* parameter for supported data types, **bcp_moretext** can be used to copy data immediately after a successful return from **bcp_sendrow** indicating that any bound columns with data present have been processed.  
     *   
     *  If you use **bcp_moretext** to send one supported data type column in a row, you must also use it to send all other supported data type columns in the row. No columns may be skipped. Supported data types are SQLTEXT, SQLNTEXT, SQLIMAGE, SQLUDT and SQLXML. SQLCHARACTER, SQLVARCHAR, SQNCHAR, SQLBINARY and SQLVARBINARY also fall into this category if the column is a varchar(max), nvarchar(max) or varbinary(max), respectively.  
     *   
     *  Calling either **bcp_bind** or [bcp_collen](../../relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-collen.md) sets the total length of all data parts to be copied to the SQL Server column. An attempt to send SQL Server more bytes than specified in the call to **bcp_bind** or **bcp_collen** generates an error. This error would arise, for example, in an application which used **bcp_collen** to set the length of available data for an SQL Server **text** column to 4500, then called **bcp_moretext** five times while indicating on each call that the data buffer length was 1000 bytes long.  
     *   
     *  If a copied row contains more than one long, variable-length column, **bcp_moretext** first sends its data to the lowest ordinally numbered column, followed by the next lowest ordinally numbered column, and so on. Correct setting of the total length of expected data is important. There is no way to signal, outside of the length setting, that all data for a column has been received by bulk copy.  
     *   
     *  When **var(max)** values are sent to the server using bcp_sendrow and bcp_moretext, it is not necessary to call bcp_collen to set the column length. Instead, for these types only, the value is terminated by calling bcp_sendrow with a length of zero.  
     *   
     *  An application normally calls **bcp_sendrow** and **bcp_moretext** within loops to send a number of rows of data. Here's an outline of how to do this for a table containing two **text** columns:  
     *   
     * ```  
     * while (there are still rows to send)  
     * {  
     * bcp_sendrow(...);  
     *   
     * for (all the data in the first varbinary(max) column)  
     * bcp_moretext(...);  
     * bcp_moretext(hdbc, 0, NULL);  
     *   
     * for (all the data in the second varbinary(max) column)  
     * bcp_moretext(...);  
     * bcp_moretext(hdbc, 0, NULL);  
     *   
     * }  
     *   
     * ```
     * @param {Pointer<Void>} param0 
     * @param {Integer} param1 
     * @param {Pointer<Byte>} param2 
     * @returns {Integer} SUCCEED or FAIL.
     * @see https://learn.microsoft.com/sql/relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-moretext
     */
    static bcp_moretext(param0, param1, param2) {
        result := DllCall("odbcbcp.dll\bcp_moretext", "ptr", param0, "int", param1, "ptr", param2, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} param0 
     * @param {Pointer<PSTR>} param1 
     * @returns {Integer} 
     */
    static bcp_readfmtA(param0, param1) {
        result := DllCall("odbcbcp.dll\bcp_readfmtA", "ptr", param0, "ptr", param1, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} param0 
     * @param {Pointer<PWSTR>} param1 
     * @returns {Integer} 
     */
    static bcp_readfmtW(param0, param1) {
        result := DllCall("odbcbcp.dll\bcp_readfmtW", "ptr", param0, "ptr", param1, "short")
        return result
    }

    /**
     * bcp_sendrow
     * @remarks
     * The **bcp_sendrow** function builds a row from program variables and sends it to [!INCLUDE[ssNoVersion](../../includes/ssnoversion-md.md)].  
     *   
     *  Before calling **bcp_sendrow**, you must make calls to [bcp_bind](../../relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-bind.md) to specify the program variables containing row data.  
     *   
     *  If **bcp_bind** is called specifying a long, variable-length data type, for example, an *eDataType* parameter of SQLTEXT and a non-NULL *pData* parameter, **bcp_sendrow** sends the entire data value, just as it does for any other data type. If, however, **bcp_bind** has a NULL *pData* parameter, **bcp_sendrow** returns control to the application immediately after all columns with data specified are sent to [!INCLUDE[ssNoVersion](../../includes/ssnoversion-md.md)]. The application can then call [bcp_moretext](../../relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-moretext.md) repeatedly to send the long, variable-length data to [!INCLUDE[ssNoVersion](../../includes/ssnoversion-md.md)], a chunk at a time. For more information, see [bcp_moretext](../../relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-moretext.md).  
     *   
     *  When **bcp_sendrow** is used to bulk copy rows from program variables into [!INCLUDE[ssNoVersion](../../includes/ssnoversion-md.md)] tables, rows are committed only when the user calls [bcp_batch](../../relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-batch.md) or [bcp_done](../../relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-done.md). The user can choose to call **bcp_batch** once every *n* rows or when there is a lull between periods of incoming data. If **bcp_batch** is never called, the rows are committed when **bcp_done** is called.  
     *   
     *  For information about a breaking change in bulk-copying beginning in [!INCLUDE[ssVersion2005](../../includes/ssversion2005-md.md)], see [Performing Bulk Copy Operations &#40;ODBC&#41;](../../relational-databases/native-client-odbc-bulk-copy-operations/performing-bulk-copy-operations-odbc.md).
     * @param {Pointer<Void>} param0 
     * @returns {Integer} SUCCEED or FAIL.
     * @see https://learn.microsoft.com/sql/relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-sendrow
     */
    static bcp_sendrow(param0) {
        result := DllCall("odbcbcp.dll\bcp_sendrow", "ptr", param0, "short")
        return result
    }

    /**
     * bcp_setcolfmt
     * @remarks
     * This function supersedes the **bcp_colfmt** function. All the functionality of **bcp_colfmt** is provided in **bcp_setcolfmt** function. In addition, support for column collation is also provided. It is recommended that the following column format attributes be set in the order given below:  
     *   
     *  BCP_FMT_SERVER_COL  
     *   
     *  BCP_FMT_DATA_LEN  
     *   
     *  BCP_FMT_TYPE  
     *   
     *  The **bcp_setcolfmt** function allows you to specify the user-file format for bulk copies. For bulk copy, a format contains the following parts:  
     *   
     * -   A mapping from user-file columns to database columns.  
     *   
     * -   The data type of each user-file column.  
     *   
     * -   The length of the optional indicator for each column.  
     *   
     * -   The maximum length of data per user-file column.  
     *   
     * -   The optional terminating byte sequence for each column.  
     *   
     * -   The length of the optional terminating byte sequence.  
     *   
     *  Each call to **bcp_setcolfmt** specifies the format for one user-file column. For example, to change the default settings for three columns in a five-column user data file, first call [bcp_columns](../../relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-columns.md)**(5)**, and then call **bcp_setcolfmt** five times, with three of those calls setting your custom format. For the remaining two calls, set BCP_FMT_TYPE to 0, and set BCP_FMT_INDICATOR_LENGTH, BCP_FMT_DATA_LEN, and *cbValue* to 0, SQL_VARLEN_DATA, and 0 respectively. This procedure copies all five columns, three with your customized format and two with the default format.  
     *   
     *  The **bcp_columns** function must be called before calling **bcp_setcolfmt**.  
     *   
     *  You must call **bcp_setcolfmt** once for each property of each column in the user file.  
     *   
     *  You do not need to copy all data in a user file to the SQL Server table. To skip a column, specify the format of the data for the column, setting the BCP_FMT_SERVER_COL parameter to 0. If you want to skip a column, you must specify its type.  
     *   
     *  The [bcp_writefmt](../../relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-writefmt.md) function can be used to persist the format specification.
     * @param {Pointer<Void>} param0 
     * @param {Integer} param1 
     * @param {Integer} param2 
     * @param {Pointer<Void>} param3 
     * @param {Integer} param4 
     * @returns {Integer} SUCCEED or FAIL.
     * @see https://learn.microsoft.com/sql/relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-setcolfmt
     */
    static bcp_setcolfmt(param0, param1, param2, param3, param4) {
        result := DllCall("odbcbcp.dll\bcp_setcolfmt", "ptr", param0, "int", param1, "int", param2, "ptr", param3, "int", param4, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} param0 
     * @param {Pointer<PSTR>} param1 
     * @returns {Integer} 
     */
    static bcp_writefmtA(param0, param1) {
        result := DllCall("odbcbcp.dll\bcp_writefmtA", "ptr", param0, "ptr", param1, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} param0 
     * @param {Pointer<PWSTR>} param1 
     * @returns {Integer} 
     */
    static bcp_writefmtW(param0, param1) {
        result := DllCall("odbcbcp.dll\bcp_writefmtW", "ptr", param0, "ptr", param1, "short")
        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @returns {Pointer<PSTR>} 
     */
    static dbprtypeA(param0) {
        result := DllCall("odbcbcp.dll\dbprtypeA", "int", param0, "ptr")
        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @returns {Pointer<PWSTR>} 
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
        result := DllCall("odbcbcp.dll\SQLLinkedServers", "ptr", param0, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} param0 
     * @param {Pointer<PSTR>} param1 
     * @param {Integer} param2 
     * @returns {Integer} 
     */
    static SQLLinkedCatalogsA(param0, param1, param2) {
        result := DllCall("odbcbcp.dll\SQLLinkedCatalogsA", "ptr", param0, "ptr", param1, "short", param2, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} param0 
     * @param {Pointer<PWSTR>} param1 
     * @param {Integer} param2 
     * @returns {Integer} 
     */
    static SQLLinkedCatalogsW(param0, param1, param2) {
        result := DllCall("odbcbcp.dll\SQLLinkedCatalogsW", "ptr", param0, "ptr", param1, "short", param2, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} pwchServerName 
     * @param {Pointer<PWSTR>} pwchInstanceName 
     * @returns {Pointer<HANDLE>} 
     */
    static SQLInitEnumServers(pwchServerName, pwchInstanceName) {
        result := DllCall("odbcbcp.dll\SQLInitEnumServers", "ptr", pwchServerName, "ptr", pwchInstanceName, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} hEnumHandle 
     * @param {Pointer<Byte>} prgEnumData 
     * @param {Pointer<Int32>} piEnumLength 
     * @returns {Integer} 
     */
    static SQLGetNextEnumeration(hEnumHandle, prgEnumData, piEnumLength) {
        result := DllCall("odbcbcp.dll\SQLGetNextEnumeration", "ptr", hEnumHandle, "ptr", prgEnumData, "ptr", piEnumLength, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} hEnumHandle 
     * @returns {Integer} 
     */
    static SQLCloseEnumServers(hEnumHandle) {
        result := DllCall("odbcbcp.dll\SQLCloseEnumServers", "ptr", hEnumHandle, "short")
        return result
    }

    /**
     * The SQLDriverConnect function is part of the ODBC API standard and this reference documentation provides information on its syntax.
     * @remarks
     * A connection string has the following syntax:  
     *   
     *  *connection-string* ::= *empty-string*[;] &#124; *attribute*[;] &#124; *attribute*; *connection-string*  
     *   
     *  *empty-string* ::=*attribute* ::= *attribute-keyword*=*attribute-value* &#124; DRIVER=[{]*attribute-value*[}]  
     *   
     *  *attribute-keyword* ::= DSN &#124; UID &#124; PWD &#124; *driver-defined-attribute-keyword*  
     *   
     *  *attribute-value* ::= *character-string*  
     *   
     *  *driver-defined-attribute-keyword* ::= *identifier*  
     *   
     *  where *character-string* has zero or more characters; *identifier* has one or more characters; *attribute-keyword* is not case-sensitive; *attribute-value* may be case-sensitive; and the value of the **DSN** keyword does not consist solely of blanks.  
     *   
     *  Because of connection string and initialization file grammar, keywords and attribute values that contain the characters **[]{}(),;?\*=!@** not enclosed with braces should be avoided. The value of the **DSN** keyword cannot consist only of blanks and should not contain leading blanks. Because of the grammar of the system information, keywords and data source names cannot contain the backslash (\\) character.  
     *   
     *  Applications do not have to add braces around the attribute value after the **DRIVER** keyword unless the attribute contains a semicolon (;), in which case the braces are required. If the attribute value that the driver receives includes braces, the driver should not remove them but they should be part of the returned connection string.  
     *   
     *  A DSN or connection string value enclosed with braces ({}) containing any of the characters **[]{}(),;?\*=!@** is passed intact to the driver. However, when using these characters in a keyword, the Driver Manager returns an error when working with file DSNs but passes the connection string to the driver for regular connection strings. Avoid using embedded braces in a keyword value.  
     *   
     *  The connection string may include any number of driver-defined keywords. Because the **DRIVER** keyword does not use information from the system information, the driver must define enough keywords so that a driver can connect to a data source using only the information in the connection string. (For more information, see "Driver Guidelines," later in this section.) The driver defines which keywords are required to connect to the data source.  
     *   
     *  The following table describes the attribute values of the **DSN**, **FILEDSN**, **DRIVER**, **UID**, **PWD**, and **SAVEFILE** keywords.  
     *   
     * |Keyword|Attribute value description|  
     * |-------------|---------------------------------|  
     * |**DSN**|Name of a data source as returned by **SQLDataSources** or the data sources dialog box of **SQLDriverConnect**.|  
     * |**FILEDSN**|Name of a .dsn file from which a connection string will be built for the data source. These data sources are called file data sources.|  
     * |**DRIVER**|Description of the driver as returned by the **SQLDrivers** function. For example, Rdb or SQL Server.|  
     * |**UID**|A user ID.|  
     * |**PWD**|The password corresponding to the user ID, or an empty string if there is no password for the user ID (PWD=;).|  
     * |**SAVEFILE**|The file name of a .dsn file in which the attribute values of keywords used in making the present, successful connection should be saved.|  
     *   
     *  For information about how an application chooses a data source or driver, see [Choosing a Data Source or Driver](../../../odbc/reference/develop-app/choosing-a-data-source-or-driver.md).  
     *   
     *  If any keywords are repeated in the connection string, the driver uses the value associated with the first occurrence of the keyword. If the **DSN** and **DRIVER** keywords are included in the same connection string, the Driver Manager and the driver use whichever keyword appears first.  
     *   
     *  The **FILEDSN** and **DSN** keywords are mutually exclusive: whichever keyword appears first is used, and the one that appears second is ignored. The **FILEDSN** and **DRIVER** keywords, on the other hand, are not mutually exclusive. If any keyword appears in a connection string with **FILEDSN**, then the attribute value of the keyword in the connection string is used rather than the attribute value of the same keyword in the .dsn file.  
     *   
     *  If the **FILEDSN** keyword is used, the keywords specified in a .dsn file are used to create a connection string. (For more information, see "File Data Sources," later in this section.) The **UID** keyword is optional; a .dsn file may be created with only the **DRIVER** keyword. The **PWD** keyword is not stored in a .dsn file. The default directory for saving and loading a .dsn file will be a combination of the path specified by **CommonFileDir** in HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\ Windows\CurrentVersion and "ODBC\DataSources". (If CommonFileDir were "C:\Program Files\Common Files", the default directory would be "C:\Program Files\Common Files\ODBC\Data Sources".)  
     *   
     * > [!NOTE]  
     * >  A .dsn file can be manipulated directly by calling the [SQLReadFileDSN](../../../odbc/reference/syntax/sqlreadfiledsn-function.md) and [SQLWriteFileDSN](../../../odbc/reference/syntax/sqlwritefiledsn-function.md) functions in the installer DLL.  
     *   
     *  If the **SAVEFILE** keyword is used, the attribute values of keywords used in making the present, successful connection will be saved as a .dsn file with the name of the attribute value of the **SAVEFILE** keyword. The **SAVEFILE** keyword must be used in conjunction with the **DRIVER** keyword, the **FILEDSN** keyword, or both, or the function returns SQL_SUCCESS_WITH_INFO with SQLSTATE 01S09 (Invalid keyword). The **SAVEFILE** keyword must appear before the **DRIVER** keyword in the connection string, or the results will be undefined.
     * @param {Pointer<Void>} hdbc 
     * @param {Pointer} hwnd 
     * @param {Pointer<Byte>} szConnStrIn 
     * @param {Integer} cchConnStrIn 
     * @param {Pointer<Byte>} szConnStrOut 
     * @param {Integer} cchConnStrOutMax 
     * @param {Pointer<Int16>} pcchConnStrOut 
     * @param {Integer} fDriverCompletion 
     * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_NO_DATA, SQL_ERROR, SQL_INVALID_HANDLE, or SQL_STILL_EXECUTING.
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqldriverconnect-function
     */
    static SQLDriverConnect(hdbc, hwnd, szConnStrIn, cchConnStrIn, szConnStrOut, cchConnStrOutMax, pcchConnStrOut, fDriverCompletion) {
        result := DllCall("ODBC32.dll\SQLDriverConnect", "ptr", hdbc, "ptr", hwnd, "ptr", szConnStrIn, "short", cchConnStrIn, "ptr", szConnStrOut, "short", cchConnStrOutMax, "ptr", pcchConnStrOut, "ushort", fDriverCompletion, "short")
        return result
    }

    /**
     * SQLBrowseConnect Function
     * @param {Pointer<Void>} hdbc 
     * @param {Pointer<Byte>} szConnStrIn 
     * @param {Integer} cchConnStrIn 
     * @param {Pointer<Byte>} szConnStrOut 
     * @param {Integer} cchConnStrOutMax 
     * @param {Pointer<Int16>} pcchConnStrOut 
     * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_NEED_DATA, SQL_ERROR, SQL_INVALID_HANDLE, or SQL_STILL_EXECUTING.
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlbrowseconnect-function
     */
    static SQLBrowseConnect(hdbc, szConnStrIn, cchConnStrIn, szConnStrOut, cchConnStrOutMax, pcchConnStrOut) {
        result := DllCall("ODBC32.dll\SQLBrowseConnect", "ptr", hdbc, "ptr", szConnStrIn, "short", cchConnStrIn, "ptr", szConnStrOut, "short", cchConnStrOutMax, "ptr", pcchConnStrOut, "short")
        return result
    }

    /**
     * SQLBulkOperations Function
     * @remarks
     * > [!CAUTION]  
     * >  For information about what statement states **SQLBulkOperations** can be called in and what it must do for compatibility with ODBC 2.*x* applications, see the [Block Cursors, Scrollable Cursors, and Backward Compatibility](../../../odbc/reference/appendixes/block-cursors-scrollable-cursors-and-backward-compatibility.md) section in Appendix G: Driver Guidelines for Backward Compatibility.  
     *   
     *  An application uses **SQLBulkOperations** to perform the following operations on the base table or view that corresponds to the current query:  
     *   
     * -   Add new rows.  
     *   
     * -   Update a set of rows where each row is identified by a bookmark.  
     *   
     * -   Delete a set of rows where each row is identified by a bookmark.  
     *   
     * -   Fetch a set of rows where each row is identified by a bookmark.  
     *   
     *  After a call to **SQLBulkOperations**, the block cursor position is undefined. The application has to call **SQLFetchScroll** to set the cursor position. An application should call **SQLFetchScroll** only with a *FetchOrientation* argument of SQL_FETCH_FIRST, SQL_FETCH_LAST, SQL_FETCH_ABSOLUTE, or SQL_FETCH_BOOKMARK. The cursor position is undefined if the application calls **SQLFetch** or **SQLFetchScroll** with a *FetchOrientation* argument of SQL_FETCH_PRIOR, SQL_FETCH_NEXT, or SQL_FETCH_RELATIVE.  
     *   
     *  A column can be ignored in bulk operations performed by a call to **SQLBulkOperations** by setting the column length/indicator buffer specified in the call to **SQLBindCol**, to SQL_COLUMN_IGNORE.  
     *   
     *  It is not necessary for the application to set the SQL_ATTR_ROW_OPERATION_PTR statement attribute when it calls **SQLBulkOperations** because rows cannot be ignored when performing bulk operations with this function.  
     *   
     *  The buffer pointed to by the SQL_ATTR_ROWS_FETCHED_PTR statement attribute contains the number of rows affected by a call to **SQLBulkOperations**.  
     *   
     *  When the *Operation* argument is SQL_ADD or SQL_UPDATE_BY_BOOKMARK and the select-list of the query specification associated with the cursor contains more than one reference to the same column, it is driver-defined whether an error is generated or the driver ignores the duplicated references and performs the requested operations.  
     *   
     *  For more information about how to use **SQLBulkOperations**, see [Updating Data with SQLBulkOperations](../../../odbc/reference/develop-app/updating-data-with-sqlbulkoperations.md).
     * @param {Pointer<Void>} StatementHandle [Input] Statement handle.
     * @param {Integer} Operation [Input] Operation to perform:  
     *   
     *  SQL_ADD SQL_UPDATE_BY_BOOKMARK SQL_DELETE_BY_BOOKMARK SQL_FETCH_BY_BOOKMARK  
     *   
     *  For more information, see "Comments."
     * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_NEED_DATA, SQL_STILL_EXECUTING, SQL_ERROR, or SQL_INVALID_HANDLE.
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlbulkoperations-function
     */
    static SQLBulkOperations(StatementHandle, Operation) {
        result := DllCall("ODBC32.dll\SQLBulkOperations", "ptr", StatementHandle, "short", Operation, "short")
        return result
    }

    /**
     * SQLColumnPrivileges Function
     * @remarks
     * **SQLColumnPrivileges** returns the results as a standard result set, ordered by TABLE_CAT, TABLE_SCHEM, TABLE_NAME, COLUMN_NAME, and PRIVILEGE.  
     *   
     * > [!NOTE]  
     * >  **SQLColumnPrivileges** might not return privileges for all columns. For example, a driver might not return information about privileges for pseudo-columns, such as Oracle ROWID. Applications can use any valid column, regardless of whether it is returned by **SQLColumnPrivileges**.  
     *   
     *  The lengths of VARCHAR columns are not shown in the table; the actual lengths depend on the data source. To determine the actual lengths of the CATALOG_NAME, SCHEMA_NAME, TABLE_NAME, and COLUMN_NAME columns, an application can call **SQLGetInfo** with the SQL_MAX_CATALOG_NAME_LEN, SQL_MAX_SCHEMA_NAME_LEN, SQL_MAX_TABLE_NAME_LEN, and SQL_MAX_COLUMN_NAME_LEN options.  
     *   
     * > [!NOTE]  
     * >  For more information about the general use, arguments, and returned data of ODBC catalog functions, see [Catalog Functions](../../../odbc/reference/develop-app/catalog-functions.md).  
     *   
     *  The following columns have been renamed for ODBC 3.*x*. The column name changes do not affect backward compatibility because applications bind by column number.  
     *   
     * |ODBC 2.0 column|ODBC 3.*x* column|  
     * |---------------------|-----------------------|  
     * |TABLE_QUALIFIER|TABLE_CAT|  
     * |TABLE_OWNER|TABLE_SCHEM|  
     *   
     *  The following table lists the columns in the result set. Additional columns beyond column 8 (IS_GRANTABLE) can be defined by the driver. An application should gain access to driver-specific columns by counting down from the end of the result set rather than specifying an explicit ordinal position. For more information, see [Data Returned by Catalog Functions](../../../odbc/reference/develop-app/data-returned-by-catalog-functions.md).  
     *   
     * |Column name|Column number|Data type|Comments|  
     * |-----------------|-------------------|---------------|--------------|  
     * |TABLE_CAT  (ODBC 1.0)|1|Varchar|Catalog identifier; NULL if not applicable to the data source. If a driver supports catalogs for some tables but not for others, such as when the driver retrieves data from different DBMSs, it returns an empty string ("") for those tables that do not have catalogs.|  
     * |TABLE_SCHEM (ODBC 1.0)|2|Varchar|Schema identifier; NULL if not applicable to the data source. If a driver supports schemas for some tables but not for others, such as when the driver retrieves data from different DBMSs, it returns an empty string ("") for those tables that do not have schemas.|  
     * |TABLE_NAME (ODBC 1.0)|3|Varchar not NULL|Table identifier.|  
     * |COLUMN_NAME (ODBC 1.0)|4|Varchar not NULL|Column name. The driver returns an empty string for a column that does not have a name.|  
     * |GRANTOR (ODBC 1.0)|5|Varchar|Name of the user who granted the privilege; NULL if not applicable to the data source.<br /><br /> For all rows in which the value in the GRANTEE column is the owner of the object, the GRANTOR column will be "_SYSTEM".|  
     * |GRANTEE (ODBC 1.0)|6|Varchar not NULL|Name of the user to whom the privilege was granted.|  
     * |PRIVILEGE (ODBC 1.0)|7|Varchar not NULL|Identifies the column privilege. May be one of the following (or others supported by the data source when implementation-defined):<br /><br /> SELECT: The grantee is permitted to retrieve data for the column.<br /><br /> INSERT: The grantee is permitted to provide data for the column in new rows that are inserted into the associated table.<br /><br /> UPDATE: The grantee is permitted to update data in the column.<br /><br /> REFERENCES: The grantee is permitted to refer to the column within a constraint (for example, a unique, referential, or table check constraint).|  
     * |IS_GRANTABLE (ODBC 1.0)|8|Varchar|Indicates whether the grantee is permitted to grant the privilege to other users; "YES", "NO", or "NULL" if unknown or not applicable to the data source.<br /><br /> A privilege is either grantable or not grantable, but not both. The result set returned by **SQLColumnPrivileges** will never contain two rows for which all columns except the IS_GRANTABLE column contain the same value.|
     * @param {Pointer<Void>} hstmt 
     * @param {Pointer<Byte>} szCatalogName 
     * @param {Integer} cchCatalogName 
     * @param {Pointer<Byte>} szSchemaName 
     * @param {Integer} cchSchemaName 
     * @param {Pointer<Byte>} szTableName 
     * @param {Integer} cchTableName 
     * @param {Pointer<Byte>} szColumnName 
     * @param {Integer} cchColumnName 
     * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_STILL_EXECUTING, SQL_ERROR, or SQL_INVALID_HANDLE.
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlcolumnprivileges-function
     */
    static SQLColumnPrivileges(hstmt, szCatalogName, cchCatalogName, szSchemaName, cchSchemaName, szTableName, cchTableName, szColumnName, cchColumnName) {
        result := DllCall("ODBC32.dll\SQLColumnPrivileges", "ptr", hstmt, "ptr", szCatalogName, "short", cchCatalogName, "ptr", szSchemaName, "short", cchSchemaName, "ptr", szTableName, "short", cchTableName, "ptr", szColumnName, "short", cchColumnName, "short")
        return result
    }

    /**
     * SQLForeignKeys Function
     * @remarks
     * For information about how the information returned by this function might be used, see [Uses of Catalog Data](../../../odbc/reference/develop-app/uses-of-catalog-data.md).  
     *   
     *  If \**PKTableName* contains a table name, **SQLForeignKeys** returns a result set that contains the primary key of the specified table and all the foreign keys that refer to it. The list of foreign keys in other tables does not include foreign keys that point to unique constraints in the specified table.  
     *   
     *  If \**FKTableName* contains a table name, **SQLForeignKeys** returns a result set that contains all the foreign keys in the specified table that point to primary keys in other tables, and the primary keys in the other tables to which they refer. The list of foreign keys in the specified table does not contain foreign keys that refer to unique constraints in other tables.  
     *   
     *  If both \**PKTableName* and \**FKTableName* contain table names, **SQLForeignKeys** returns the foreign keys in the table specified in \**FKTableName* that refer to the primary key of the table specified in **PKTableName*. This should be one key at most.  
     *   
     * > [!NOTE]  
     * >  For more information about the general use, arguments, and returned data of ODBC catalog functions, see [Catalog Functions](../../../odbc/reference/develop-app/catalog-functions.md).  
     *   
     *  **SQLForeignKeys** returns results as a standard result set. If the foreign keys associated with a primary key are requested, the result set is ordered by FKTABLE_CAT, FKTABLE_SCHEM, FKTABLE_NAME, and KEY_SEQ. If the primary keys associated with a foreign key are requested, the result set is ordered by PKTABLE_CAT, PKTABLE_SCHEM, PKTABLE_NAME, and KEY_SEQ. The following table lists the columns in the result set.  
     *   
     *  The lengths of VARCHAR columns are not shown in the table; the actual lengths depend on the data source. To determine the actual lengths of the PKTABLE_CAT or FKTABLE_CAT, PKTABLE_SCHEM or FKTABLE_SCHEM, PKTABLE_NAME or FKTABLE_NAME, and PKCOLUMN_NAME or FKCOLUMN_NAME columns, an application can call **SQLGetInfo** with the SQL_MAX_CATALOG_NAME_LEN, SQL_MAX_SCHEMA_NAME_LEN, SQL_MAX_TABLE_NAME_LEN, and SQL_MAX_COLUMN_NAME_LEN options.  
     *   
     *  The following columns have been renamed for ODBC 3*.x.* The column name changes do not affect backward compatibility because applications bind by column number.  
     *   
     * |ODBC 2.0 column|ODBC 3*.x* column|  
     * |---------------------|-----------------------|  
     * |PKTABLE_QUALIFIER|PKTABLE_CAT|  
     * |PKTABLE_OWNER|PKTABLE_SCHEM|  
     * |FKTABLE_QUALIFIER|FK_TABLE_CAT|  
     * |FKTABLE_OWNER|FKTABLE_SCHEM|  
     *   
     *  The following table lists the columns in the result set. Additional columns beyond column 14 (REMARKS) can be defined by the driver. An application should gain access to driver-specific columns by counting down from the end of the result set instead of specifying an explicit ordinal position. For more information, see [Data Returned by Catalog Functions](../../../odbc/reference/develop-app/data-returned-by-catalog-functions.md).  
     *   
     * |Column name|Column number|Data type|Comments|  
     * |-----------------|-------------------|---------------|--------------|  
     * |PKTABLE_CAT (ODBC 1.0)|1|Varchar|Primary key table catalog name; NULL if not applicable to the data source. If a driver supports catalogs for some tables but not for others, such as when the driver retrieves data from different DBMSs, it returns an empty string ("") for those tables that do not have catalogs.|  
     * |PKTABLE_SCHEM (ODBC 1.0)|2|Varchar|Primary key table schema name; NULL if not applicable to the data source. If a driver supports schemas for some tables but not for others, such as when the driver retrieves data from different DBMSs, it returns an empty string ("") for those tables that do not have schemas.|  
     * |PKTABLE_NAME (ODBC 1.0)|3|Varchar not NULL|Primary key table name.|  
     * |PKCOLUMN_NAME (ODBC 1.0)|4|Varchar not NULL|Primary key column name. The driver returns an empty string for a column that does not have a name.|  
     * |FKTABLE_CAT (ODBC 1.0)|5|Varchar|Foreign key table catalog name; NULL if not applicable to the data source. If a driver supports catalogs for some tables but not for others, such as when the driver retrieves data from different DBMSs, it returns an empty string ("") for those tables that do not have catalogs.|  
     * |FKTABLE_SCHEM (ODBC 1.0)|6|Varchar|Foreign key table schema name; NULL if not applicable to the data source. If a driver supports schemas for some tables but not for others, such as when the driver retrieves data from different DBMSs, it returns an empty string ("") for those tables that do not have schemas.|  
     * |FKTABLE_NAME (ODBC 1.0)|7|Varchar not NULL|Foreign key table name.|  
     * |FKCOLUMN_NAME (ODBC 1.0)|8|Varchar not NULL|Foreign key column name. The driver returns an empty string for a column that does not have a name.|  
     * |KEY_SEQ (ODBC 1.0)|9|Smallint not NULL|Column sequence number in key (starting with 1).|  
     * |UPDATE_RULE (ODBC 1.0)|10|Smallint|Action to be applied to the foreign key when the SQL operation is **UPDATE**. Can have one of the following values. (The referenced table is the table that has the primary key; the referencing table is the table that has the foreign key.)<br /><br /> SQL_CASCADE: When the primary key of the referenced table is updated, the foreign key of the referencing table is also updated.<br /><br /> SQL_NO_ACTION: If an update of the primary key of the referenced table would cause a "dangling reference" in the referencing table (that is, rows in the referencing table would have no counterparts in the referenced table), the update is rejected. If an update of the foreign key of the referencing table would introduce a value that does not exist as a value of the primary key of the referenced table, the update is rejected. (This action is the same as the SQL_RESTRICT action in ODBC 2*.x*.)<br /><br /> SQL_SET_NULL: When one or more rows in the referenced table are updated in such a way that one or more components of the primary key are changed, the components of the foreign key in the referencing table that correspond to the changed components of the primary key are set to NULL in all matching rows of the referencing table.<br /><br /> SQL_SET_DEFAULT: When one or more rows in the referenced table are updated in such a way that one or more components of the primary key are changed, the components of the foreign key in the referencing table that correspond to the changed components of the primary key are set to the applicable default values in all matching rows of the referencing table.<br /><br /> NULL if not applicable to the data source.|  
     * |DELETE_RULE (ODBC 1.0)|11|Smallint|Action to be applied to the foreign key when the SQL operation is **DELETE**. Can have one of the following values. (The referenced table is the table that has the primary key; the referencing table is the table that has the foreign key.)<br /><br /> SQL_CASCADE: When a row in the referenced table is deleted, all the matching rows in the referencing tables are also deleted.<br /><br /> SQL_NO_ACTION: If a delete of a row in the referenced table would cause a "dangling reference" in the referencing table (that is, rows in the referencing table would have no counterparts in the referenced table), the update is rejected. (This action is the same as the SQL_RESTRICT action in ODBC 2*.x*.)<br /><br /> SQL_SET_NULL: When one or more rows in the referenced table are deleted, each component of the foreign key of the referencing table is set to NULL in all matching rows of the referencing table.<br /><br /> SQL_SET_DEFAULT: When one or more rows in the referenced table are deleted, each component of the foreign key of the referencing table is set to the applicable default in all matching rows of the referencing table.<br /><br /> NULL if not applicable to the data source.|  
     * |FK_NAME (ODBC 2.0)|12|Varchar|Foreign key name. NULL if not applicable to the data source.|  
     * |PK_NAME (ODBC 2.0)|13|Varchar|Primary key name. NULL if not applicable to the data source.|  
     * |DEFERRABILITY (ODBC 3.0)|14|Smallint|SQL_INITIALLY_DEFERRED, SQL_INITIALLY_IMMEDIATE, SQL_NOT_DEFERRABLE.|
     * @param {Pointer<Void>} hstmt 
     * @param {Pointer<Byte>} szPkCatalogName 
     * @param {Integer} cchPkCatalogName 
     * @param {Pointer<Byte>} szPkSchemaName 
     * @param {Integer} cchPkSchemaName 
     * @param {Pointer<Byte>} szPkTableName 
     * @param {Integer} cchPkTableName 
     * @param {Pointer<Byte>} szFkCatalogName 
     * @param {Integer} cchFkCatalogName 
     * @param {Pointer<Byte>} szFkSchemaName 
     * @param {Integer} cchFkSchemaName 
     * @param {Pointer<Byte>} szFkTableName 
     * @param {Integer} cchFkTableName 
     * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_STILL_EXECUTING, SQL_ERROR, or SQL_INVALID_HANDLE.
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlforeignkeys-function
     */
    static SQLForeignKeys(hstmt, szPkCatalogName, cchPkCatalogName, szPkSchemaName, cchPkSchemaName, szPkTableName, cchPkTableName, szFkCatalogName, cchFkCatalogName, szFkSchemaName, cchFkSchemaName, szFkTableName, cchFkTableName) {
        result := DllCall("ODBC32.dll\SQLForeignKeys", "ptr", hstmt, "ptr", szPkCatalogName, "short", cchPkCatalogName, "ptr", szPkSchemaName, "short", cchPkSchemaName, "ptr", szPkTableName, "short", cchPkTableName, "ptr", szFkCatalogName, "short", cchFkCatalogName, "ptr", szFkSchemaName, "short", cchFkSchemaName, "ptr", szFkTableName, "short", cchFkTableName, "short")
        return result
    }

    /**
     * SQLMoreResults Function
     * @remarks
     * **SELECT** statements return result sets. **UPDATE**, **INSERT**, and **DELETE** statements return a count of affected rows. If any of these statements are batched, submitted with arrays of parameters (numbered in increasing parameter order, in the order that they appear in the batch), or in procedures, they can return multiple result sets or row counts. For information about batches of statements and arrays of parameters, see [Batches of SQL Statements](../../../odbc/reference/develop-app/batches-of-sql-statements.md) and [Arrays of Parameter Values](../../../odbc/reference/develop-app/arrays-of-parameter-values.md).  
     *   
     *  After executing the batch, the application is positioned on the first result set. The application can call **SQLBindCol**, **SQLBulkOperations**, **SQLFetch**, **SQLGetData**, **SQLFetchScroll**, **SQLSetPos**, and all the metadata functions, on the first or any subsequent result sets, just as it would if there were just a single result set. Once it is done with the first result set, the application calls **SQLMoreResults** to move to the next result set. If another result set or count is available, **SQLMoreResults** returns SQL_SUCCESS and initializes the result set or count for additional processing. If any row count-generating statements appear in between result set-generating statements, they can be stepped over by calling **SQLMoreResults**.After calling **SQLMoreResults** for **UPDATE**, **INSERT**, or **DELETE** statements, an application can call **SQLRowCount**.  
     *   
     *  If there was a current result set with unfetched rows, **SQLMoreResults** discards that result set and makes the next result set or count available. If all results have been processed, **SQLMoreResults** returns SQL_NO_DATA. For some drivers, output parameters and return values are not available until all result sets and row counts have been processed. For such drivers, output parameters and return values become available when **SQLMoreResults** returns SQL_NO_DATA.  
     *   
     *  Any bindings that were established for the previous result set still remain valid. If the column structures are different for this result set, then calling **SQLFetch** or **SQLFetchScroll** may result in an error or truncation. To prevent this, the application has to call **SQLBindCol** to explicitly rebind as appropriate (or do so by setting descriptor fields). Alternatively, the application can call **SQLFreeStmt** with an *Option* of SQL_UNBIND to unbind all the column buffers.  
     *   
     *  The values of statement attributes, such as cursor type, cursor concurrency, keyset size, or maximum length, may change as the application navigates through the batch by calls to **SQLMoreResults**. If this happens, **SQLMoreResults** will return SQL_SUCCESS_WITH_INFO and SQLSTATE 01S02 (Option value has changed).  
     *   
     *  Calling **SQLCloseCursor**, or **SQLFreeStmt** with an *Option* of SQL_CLOSE, discards all the result sets and row counts that were available as a result of the execution of the batch. The statement handle returns to either the allocated or prepared state. Calling **SQLCancel** to cancel an asynchronously executing function when a batch has been executed and the statement handle is in the executed, cursor-positioned, or asynchronous state results in all the results sets and row counts generated by the batch being discarded if the cancel call was successful. The statement then returns to the prepared or allocated state.  
     *   
     *  If a batch of statements or a procedure mixes other SQL statements with **SELECT**, **UPDATE**, **INSERT**, and **DELETE** statements, these other statements do not affect **SQLMoreResults**.  
     *   
     *  For more information, see [Multiple Results](../../../odbc/reference/develop-app/multiple-results.md).  
     *   
     *  If a searched update, insert, or delete statement in a batch of statements does not affect any rows at the data source, **SQLMoreResults** returns SQL_SUCCESS. This is different from the case of a searched update, insert, or delete statement that is executed through **SQLExecDirect**, **SQLExecute**, or **SQLParamData**, which returns SQL_NO_DATA if it does not affect any rows at the data source. If an application calls **SQLRowCount** to retrieve the row count after a call to **SQLMoreResults** has not affected any rows, **SQLRowCount** will return SQL_NO_DATA.  
     *   
     *  For additional information about the valid sequencing of result-processing functions, see [Appendix B: ODBC State Transition Tables](../../../odbc/reference/appendixes/appendix-b-odbc-state-transition-tables.md).  
     *   
     *  For more information about SQL_PARAM_DATA_AVAILABLE and streamed output parameters, see [Retrieving Output Parameters Using SQLGetData](../../../odbc/reference/develop-app/retrieving-output-parameters-using-sqlgetdata.md).
     * @param {Pointer<Void>} hstmt 
     * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_STILL_EXECUTING, SQL_NO_DATA, SQL_ERROR, SQL_INVALID_HANDLE, OR SQL_PARAM_DATA_AVAILABLE.
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlmoreresults-function
     */
    static SQLMoreResults(hstmt) {
        result := DllCall("ODBC32.dll\SQLMoreResults", "ptr", hstmt, "short")
        return result
    }

    /**
     * SQLNativeSql Function
     * @remarks
     * The following are examples of what **SQLNativeSql** might return for the following input SQL string containing the scalar function CONVERT. Assume that the column empid is of type INTEGER in the data source:  
     *   
     * ```sql  
     * SELECT { fn CONVERT (empid, SQL_SMALLINT) } FROM employee  
     * ```  
     *   
     *  A driver for Microsoft SQL Server might return the following translated SQL string:  
     *   
     * ```sql  
     * SELECT convert (smallint, empid) FROM employee  
     * ```  
     *   
     *  A driver for ORACLE Server might return the following translated SQL string:  
     *   
     * ```sql  
     * SELECT to_number (empid) FROM employee  
     * ```  
     *   
     *  A driver for Ingres might return the following translated SQL string:  
     *   
     * ```sql  
     * SELECT int2 (empid) FROM employee  
     * ```  
     *   
     *  For more information, see [Direct Execution](../../../odbc/reference/develop-app/direct-execution-odbc.md) and [Prepared Execution](../../../odbc/reference/develop-app/prepared-execution-odbc.md).
     * @param {Pointer<Void>} hdbc 
     * @param {Pointer<Byte>} szSqlStrIn 
     * @param {Integer} cchSqlStrIn 
     * @param {Pointer<Byte>} szSqlStr 
     * @param {Integer} cchSqlStrMax 
     * @param {Pointer<Int32>} pcbSqlStr 
     * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_ERROR, or SQL_INVALID_HANDLE.
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlnativesql-function
     */
    static SQLNativeSql(hdbc, szSqlStrIn, cchSqlStrIn, szSqlStr, cchSqlStrMax, pcbSqlStr) {
        result := DllCall("ODBC32.dll\SQLNativeSql", "ptr", hdbc, "ptr", szSqlStrIn, "int", cchSqlStrIn, "ptr", szSqlStr, "int", cchSqlStrMax, "ptr", pcbSqlStr, "short")
        return result
    }

    /**
     * SQLNumParams Function
     * @remarks
     * **SQLNumParams** can be called only after **SQLPrepare** has been called.  
     *   
     *  If the statement associated with *StatementHandle* does not contain parameters, **SQLNumParams** sets **ParameterCountPtr* to 0.  
     *   
     *  The number of parameters returned by **SQLNumParams** is the same value as the SQL_DESC_COUNT field of the IPD.  
     *   
     *  For more information, see [Describing Parameters](../../../odbc/reference/develop-app/describing-parameters.md).
     * @param {Pointer<Void>} hstmt 
     * @param {Pointer<Int16>} pcpar 
     * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_STILL_EXECUTING, SQL_ERROR, or SQL_INVALID_HANDLE.
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlnumparams-function
     */
    static SQLNumParams(hstmt, pcpar) {
        result := DllCall("ODBC32.dll\SQLNumParams", "ptr", hstmt, "ptr", pcpar, "short")
        return result
    }

    /**
     * SQLPrimaryKeys Function
     * @remarks
     * **SQLPrimaryKeys** returns the results as a standard result set, ordered by TABLE_CAT, TABLE_SCHEM, TABLE_NAME, and KEY_SEQ. For information about how this information might be used, see [Uses of Catalog Data](../../../odbc/reference/develop-app/uses-of-catalog-data.md).  
     *   
     *  The following columns have been renamed for ODBC 3.*x*. The column name changes do not affect backward compatibility because applications bind by column number.  
     *   
     * |ODBC 2.0 column|ODBC 3.*x* column|  
     * |---------------------|-----------------------|  
     * |TABLE_QUALIFIER|TABLE_CAT|  
     * |TABLE_OWNER|TABLE_SCHEM|  
     *   
     *  To determine the actual lengths of the TABLE_CAT, TABLE_SCHEM, TABLE_NAME, and COLUMN_NAME columns, call **SQLGetInfo** with the SQL_MAX_CATALOG_NAME_LEN, SQL_MAX_SCHEMA_NAME_LEN, SQL_MAX_TABLE_NAME_LEN, and SQL_MAX_COLUMN_NAME_LEN options.  
     *   
     * > [!NOTE]  
     * >  For more information about the general use, arguments, and returned data of ODBC catalog functions, see [Catalog Functions](../../../odbc/reference/develop-app/catalog-functions.md).  
     *   
     *  The following table lists the columns in the result set. Additional columns beyond column 6 (PK_NAME) can be defined by the driver. An application should gain access to driver-specific columns by counting down from the end of the result set rather than specifying an explicit ordinal position. For more information, see [Data Returned by Catalog Functions](../../../odbc/reference/develop-app/data-returned-by-catalog-functions.md).  
     *   
     * |Column name|Column number|Data type|Comments|  
     * |-----------------|-------------------|---------------|--------------|  
     * |TABLE_CAT (ODBC 1.0)|1|Varchar|Primary key table catalog name; NULL if not applicable to the data source. If a driver supports catalogs for some tables but not for others, such as when the driver retrieves data from different DBMSs, it returns an empty string ("") for those tables that do not have catalogs.|  
     * |TABLE_SCHEM (ODBC 1.0)|2|Varchar|Primary key table schema name; NULL if not applicable to the data source. If a driver supports schemas for some tables but not for others, such as when the driver retrieves data from different DBMSs, it returns an empty string ("") for those tables that do not have schemas.|  
     * |TABLE_NAME (ODBC 1.0)|3|Varchar not NULL|Primary key table name.|  
     * |COLUMN_NAME (ODBC 1.0)|4|Varchar not NULL|Primary key column name. The driver returns an empty string for a column that does not have a name.|  
     * |KEY_SEQ (ODBC 1.0)|5|Smallint not NULL|Column sequence number in key (starting with 1).|  
     * |PK_NAME (ODBC 2.0)|6|Varchar|Primary key name. NULL if not applicable to the data source.|
     * @param {Pointer<Void>} hstmt 
     * @param {Pointer<Byte>} szCatalogName 
     * @param {Integer} cchCatalogName 
     * @param {Pointer<Byte>} szSchemaName 
     * @param {Integer} cchSchemaName 
     * @param {Pointer<Byte>} szTableName 
     * @param {Integer} cchTableName 
     * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_STILL_EXECUTING, SQL_ERROR, or SQL_INVALID_HANDLE.
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlprimarykeys-function
     */
    static SQLPrimaryKeys(hstmt, szCatalogName, cchCatalogName, szSchemaName, cchSchemaName, szTableName, cchTableName) {
        result := DllCall("ODBC32.dll\SQLPrimaryKeys", "ptr", hstmt, "ptr", szCatalogName, "short", cchCatalogName, "ptr", szSchemaName, "short", cchSchemaName, "ptr", szTableName, "short", cchTableName, "short")
        return result
    }

    /**
     * SQLProcedureColumns Function
     * @remarks
     * This function is typically used before statement execution to retrieve information about procedure parameters and the columns that make up the result set or sets returned by the procedure, if any. For more information, see [Procedures](../../../odbc/reference/develop-app/procedures-odbc.md).  
     *   
     * > [!NOTE]  
     * >  **SQLProcedureColumns** might not return all columns used by a procedure. For example, a driver might return only information about the parameters used by a procedure and not the columns in a result set it generates.  
     *   
     *  The *SchemaName*, *ProcName*, and *ColumnName* arguments accept search patterns. For more information about valid search patterns, see [Pattern Value Arguments](../../../odbc/reference/develop-app/pattern-value-arguments.md).  
     *   
     * > [!NOTE]  
     * >  For more information about the general use, arguments, and returned data of ODBC catalog functions, see [Catalog Functions](../../../odbc/reference/develop-app/catalog-functions.md).  
     *   
     *  **SQLProcedureColumns** returns the results as a standard result set, ordered by PROCEDURE_CAT, PROCEDURE_SCHEM, PROCEDURE_NAME, and COLUMN_TYPE. Column names are returned for each procedure in the following order: the name of the return value, the names of each parameter in the procedure invocation (in call order), and then the names of each column in the result set returned by the procedure (in column order).  
     *   
     *  Applications should bind driver-specific columns relative to the end of the result set. For more information, see [Data Returned by Catalog Functions](../../../odbc/reference/develop-app/data-returned-by-catalog-functions.md).  
     *   
     *  To determine the actual lengths of the PROCEDURE_CAT, PROCEDURE_SCHEM, PROCEDURE_NAME, and COLUMN_NAME columns, an application can call **SQLGetInfo** with the SQL_MAX_CATALOG_NAME_LEN, SQL_MAX_SCHEMA_NAME_LEN, SQL_MAX_PROCEDURE_NAME_LEN, and SQL_MAX_COLUMN_NAME_LEN options.  
     *   
     *  The following columns have been renamed for ODBC 3.*x*. The column name changes do not affect backward compatibility because applications bind by column number.  
     *   
     * |ODBC 2.0 column|ODBC 3.*x* column|  
     * |---------------------|-----------------------|  
     * |PROCEDURE_QUALIFIER|PROCEDURE_CAT|  
     * |PROCEDURE _OWNER|PROCEDURE_SCHEM|  
     * |PRECISION|COLUMN_SIZE|  
     * |LENGTH|BUFFER_LENGTH|  
     * |SCALE|DECIMAL_DIGITS|  
     * |RADIX|NUM_PREC_RADIX|  
     *   
     *  The following columns have been added to the results set returned by **SQLProcedureColumns** for ODBC 3.*x*:  
     *   
     * -   COLUMN_DEF  
     *   
     * -   DATETIME_CODE  
     *   
     * -   CHAR_OCTET_LENGTH  
     *   
     * -   ORDINAL_POSITION  
     *   
     * -   IS_NULLABLE  
     *   
     *  The following table lists the columns in the result set. Additional columns beyond column 19 (IS_NULLABLE) can be defined by the driver. An application should gain access to driver-specific columns by counting down from the end of the result set rather than specifying an explicit ordinal position. For more information, see [Data Returned by Catalog Functions](../../../odbc/reference/develop-app/data-returned-by-catalog-functions.md).  
     *   
     * |Column name|Column number|Data type|Comments|  
     * |-----------------|-------------------|---------------|--------------|  
     * |PROCEDURE_CAT (ODBC 2.0)|1|Varchar|Procedure catalog name; NULL if not applicable to the data source. If a driver supports catalogs for some procedures but not for others, such as when the driver retrieves data from different DBMSs, it returns an empty string ("") for those procedures that do not have catalogs.|  
     * |PROCEDURE_SCHEM (ODBC 2.0)|2|Varchar|Procedure schema name; NULL if not applicable to the data source. If a driver supports schemas for some procedures but not for others, such as when the driver retrieves data from different DBMSs, it returns an empty string ("") for those procedures that do not have schemas.|  
     * |PROCEDURE_NAME (ODBC 2.0)|3|Varchar not NULL|Procedure name. An empty string is returned for a procedure that does not have a name.|  
     * |COLUMN_NAME (ODBC 2.0)|4|Varchar not NULL|Procedure column name. The driver returns an empty string for a procedure column that does not have a name.|  
     * |COLUMN_TYPE (ODBC 2.0)|5|Smallint not NULL|Defines the procedure column as a parameter or a result set column:<br /><br /> SQL_PARAM_TYPE_UNKNOWN: The procedure column is a parameter whose type is unknown. (ODBC 1.0)<br /><br /> SQL_PARAM_INPUT: The procedure column is an input parameter. (ODBC 1.0)<br /><br /> SQL_PARAM_INPUT_OUTPUT: The procedure column is an input/output parameter. (ODBC 1.0)<br /><br /> SQL_PARAM_OUTPUT: The procedure column is an output parameter. (ODBC 2.0)<br /><br /> SQL_RETURN_VALUE: The procedure column is the return value of the procedure. (ODBC 2.0)<br /><br /> SQL_RESULT_COL: The procedure column is a result set column. (ODBC 1.0)|  
     * |DATA_TYPE (ODBC 2.0)|6|Smallint not NULL|SQL data type. This can be an ODBC SQL data type or a driver-specific SQL data type. For datetime and interval data types, this column returns the concise data types (for example, SQL_TYPE_TIME or SQL_INTERVAL_YEAR_TO_MONTH). For a list of valid ODBC SQL data types, see [SQL Data Types](../../../odbc/reference/appendixes/sql-data-types.md) in Appendix D: Data Types. For information about driver-specific SQL data types, see the driver's documentation.|  
     * |TYPE_NAME (ODBC 2.0)|7|Varchar not NULL|Data source-dependent data type name; for example, "CHAR", "VARCHAR", "MONEY", "LONG VARBINARY", or "CHAR ( ) FOR BIT DATA".|  
     * |COLUMN_SIZE (ODBC 2.0)|8|Integer|The column size of the procedure column on the data source. NULL is returned for data types where column size is not applicable. For more information concerning precision, see [Column Size, Decimal Digits, Transfer Octet Length, and Display Size](../../../odbc/reference/appendixes/column-size-decimal-digits-transfer-octet-length-and-display-size.md) in Appendix D: Data Types.|  
     * |BUFFER_LENGTH (ODBC 2.0)|9|Integer|The length in bytes of data transferred on an **SQLGetData** or **SQLFetch** operation if SQL_C_DEFAULT is specified. For numeric data, this size may be different than the size of the data stored on the data source. For more information, see [Column Size, Decimal Digits, Transfer Octet Length, and Display Size](../../../odbc/reference/appendixes/column-size-decimal-digits-transfer-octet-length-and-display-size.md), in Appendix D: Data Types.|  
     * |DECIMAL_DIGITS (ODBC 2.0)|10|Smallint|The decimal digits of the procedure column on the data source. NULL is returned for data types where decimal digits is not applicable. For more information concerning decimal digits, see [Column Size, Decimal Digits, Transfer Octet Length, and Display Size](../../../odbc/reference/appendixes/column-size-decimal-digits-transfer-octet-length-and-display-size.md), in Appendix D: Data Types.|  
     * |NUM_PREC_RADIX (ODBC 2.0)|11|Smallint|For numeric data types, either 10 or 2.<br /><br /> If 10, the values in COLUMN_SIZE and DECIMAL_DIGITS give the number of decimal digits allowed for the column. For example, a DECIMAL(12,5) column would return a NUM_PREC_RADIX of 10, a COLUMN_SIZE of 12, and a DECIMAL_DIGITS of 5; a FLOAT column could return a NUM_PREC_RADIX of 10, a COLUMN_SIZE of 15, and a DECIMAL_DIGITS of NULL.<br /><br /> If 2, the values in COLUMN_SIZE and DECIMAL_DIGITS give the number of bits allowed in the column. For example, a FLOAT column could return a NUM_PREC_RADIX of 2, a COLUMN_SIZE of 53, and a DECIMAL_DIGITS of NULL.<br /><br /> NULL is returned for data types where NUM_PREC_RADIX is not applicable.|  
     * |NULLABLE (ODBC 2.0)|12|Smallint not NULL|Whether the procedure column accepts a NULL value:<br /><br /> SQL_NO_NULLS: The procedure column does not accept NULL values.<br /><br /> SQL_NULLABLE: The procedure column accepts NULL values.<br /><br /> SQL_NULLABLE_UNKNOWN: It is not known if the procedure column accepts NULL values.|  
     * |REMARKS (ODBC 2.0)|13|Varchar|A description of the procedure column.|  
     * |COLUMN_DEF (ODBC 3.0)|14|Varchar|The default value of the column.<br /><br /> If NULL was specified as the default value, this column is the word NULL, not enclosed in quotation marks. If the default value cannot be represented without truncation, this column contains TRUNCATED, with no enclosing single quotation marks. If no default value was specified, this column is NULL.<br /><br /> The value of COLUMN_DEF can be used in generating a new column definition, except when it contains the value TRUNCATED.|  
     * |SQL_DATA_TYPE (ODBC 3.0)|15|Smallint not NULL|The value of the SQL data type as it appears in the SQL_DESC_TYPE field of the descriptor. This column is the same as the DATA_TYPE column, except for datetime and interval data types.<br /><br /> For datetime and interval data types, the SQL_DATA_TYPE field in the result set will return SQL_INTERVAL or SQL_DATETIME, and the SQL_DATETIME_SUB field will return the subcode for the specific interval or datetime data type. (See [Appendix D: Data Types](../../../odbc/reference/appendixes/appendix-d-data-types.md).)|  
     * |SQL_DATETIME_SUB (ODBC 3.0)|16|Smallint|The subtype code for datetime and interval data types. For other data types, this column returns a NULL.|  
     * |CHAR_OCTET_LENGTH (ODBC 3.0)|17|Integer|The maximum length in bytes of a character or binary data type column. For all other data types, this column returns a NULL.|  
     * |ORDINAL_POSITION (ODBC 3.0)|18|Integer not NULL|For input and output parameters, the ordinal position of the parameter in the procedure definition (in increasing parameter order, starting at 1). For a return value (if any), 0 is returned. For result-set columns, the ordinal position of the column in the result set, with the first column in the result set being number 1. If there are multiple result sets, column ordinal positions are returned in a driver-specific manner.|  
     * |IS_NULLABLE (ODBC 3.0)|19|Varchar|"NO" if the column does not include NULLs.<br /><br /> "YES" if the column can include NULLs.<br /><br /> This column returns a zero-length string if nullability is unknown.<br /><br /> ISO rules are followed to determine nullability. An ISO SQL-compliant DBMS cannot return an empty string.<br /><br /> The value returned for this column is different from the value returned for the NULLABLE column. (See the description of the NULLABLE column.)|
     * @param {Pointer<Void>} hstmt 
     * @param {Pointer<Byte>} szCatalogName 
     * @param {Integer} cchCatalogName 
     * @param {Pointer<Byte>} szSchemaName 
     * @param {Integer} cchSchemaName 
     * @param {Pointer<Byte>} szProcName 
     * @param {Integer} cchProcName 
     * @param {Pointer<Byte>} szColumnName 
     * @param {Integer} cchColumnName 
     * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_STILL_EXECUTING, SQL_ERROR, or SQL_INVALID_HANDLE.
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlprocedurecolumns-function
     */
    static SQLProcedureColumns(hstmt, szCatalogName, cchCatalogName, szSchemaName, cchSchemaName, szProcName, cchProcName, szColumnName, cchColumnName) {
        result := DllCall("ODBC32.dll\SQLProcedureColumns", "ptr", hstmt, "ptr", szCatalogName, "short", cchCatalogName, "ptr", szSchemaName, "short", cchSchemaName, "ptr", szProcName, "short", cchProcName, "ptr", szColumnName, "short", cchColumnName, "short")
        return result
    }

    /**
     * SQLProcedures Function
     * @remarks
     * **SQLProcedures** lists all procedures in the requested range. A user may or may not have permission to execute any of these procedures. To check accessibility, an application can call **SQLGetInfo** and check the SQL_ACCESSIBLE_PROCEDURES information value. Otherwise, the application must be able to handle a situation where the user selects a procedure that it cannot execute. For information about how this information might be used, see [Procedures](../../../odbc/reference/develop-app/procedures-odbc.md).  
     *   
     * > [!NOTE]  
     * >  For more information about the general use, arguments, and returned data of ODBC catalog functions, see [Catalog Functions](../../../odbc/reference/develop-app/catalog-functions.md).  
     *   
     *  **SQLProcedures** returns the results as a standard result set, ordered by PROCEDURE_CAT, PROCEDURE_SCHEMA, and PROCEDURE_NAME.  
     *   
     * > [!NOTE]  
     * >  **SQLProcedures** might not return all procedures. Applications can use any valid procedure, regardless of whether it is returned by **SQLProcedures**.  
     *   
     *  The following columns have been renamed for ODBC 3*.x*. The column name changes do not affect backward compatibility because applications bind by column number.  
     *   
     * |ODBC 2.0 column|ODBC 3*.x* column|  
     * |---------------------|-----------------------|  
     * |PROCEDURE_QUALIFIER|PROCEDURE_CAT|  
     * |PROCEDURE _OWNER|PROCEDURE _SCHEM|  
     *   
     *  To determine the actual lengths of the PROCEDURE_CAT, PROCEDURE_SCHEM, and PROCEDURE_NAME columns, an application can call **SQLGetInfo** with the SQL_MAX_CATALOG_NAME_LEN, SQL_MAX_SCHEMA_NAME_LEN, and SQL_MAX_PROCEDURE_NAME_LEN options.  
     *   
     *  The following table lists the columns in the result set. Additional columns beyond column 8 (PROCEDURE_TYPE) can be defined by the driver. An application should gain access to driver-specific columns by counting down from the end of the result set rather than specifying an explicit ordinal position. For more information, see [Data Returned by Catalog Functions](../../../odbc/reference/develop-app/data-returned-by-catalog-functions.md).  
     *   
     * |Column name|Column number|Data type|Comments|  
     * |-----------------|-------------------|---------------|--------------|  
     * |PROCEDURE_CAT (ODBC 2.0)|1|Varchar|Procedure catalog identifier; NULL if not applicable to the data source. If a driver supports catalogs for some procedures but not for others, such as when the driver retrieves data from different DBMSs, it returns an empty string ("") for those procedures that do not have catalogs.|  
     * |PROCEDURE_SCHEM (ODBC 2.0)|2|Varchar|Procedure schema identifier; NULL if not applicable to the data source. If a driver supports schemas for some procedures but not for others, such as when the driver retrieves data from different DBMSs, it returns an empty string ("") for those procedures that do not have schemas.|  
     * |PROCEDURE_NAME (ODBC 2.0)|3|Varchar not NULL|Procedure identifier.|  
     * |NUM_INPUT_PARAMS (ODBC 2.0)|4|N/A|Reserved for future use. Applications should not rely on the data returned in these result columns.|  
     * |NUM_OUTPUT_PARAMS (ODBC 2.0)|5|N/A|Reserved for future use. Applications should not rely on the data returned in these result columns.|  
     * |NUM_RESULT_SETS (ODBC 2.0)|6|N/A|Reserved for future use. Applications should not rely on the data returned in these result columns.|  
     * |REMARKS (ODBC 2.0)|7|Varchar|A description of the procedure.|  
     * |PROCEDURE_TYPE (ODBC 2.0)|8|Smallint|Defines the procedure type:<br /><br /> SQL_PT_UNKNOWN: It cannot be determined whether the procedure returns a value.<br /><br /> SQL_PT_PROCEDURE: The returned object is a procedure; that is, it does not have a return value.<br /><br /> SQL_PT_FUNCTION: The returned object is a function; that is, it has a return value.|  
     *   
     *  The *SchemaName* and *ProcName* arguments accept search patterns. For more information about valid search patterns, see [Pattern Value Arguments](../../../odbc/reference/develop-app/pattern-value-arguments.md).
     * @param {Pointer<Void>} hstmt 
     * @param {Pointer<Byte>} szCatalogName 
     * @param {Integer} cchCatalogName 
     * @param {Pointer<Byte>} szSchemaName 
     * @param {Integer} cchSchemaName 
     * @param {Pointer<Byte>} szProcName 
     * @param {Integer} cchProcName 
     * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_STILL_EXECUTING, SQL_ERROR, or SQL_INVALID_HANDLE.
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlprocedures-function
     */
    static SQLProcedures(hstmt, szCatalogName, cchCatalogName, szSchemaName, cchSchemaName, szProcName, cchProcName) {
        result := DllCall("ODBC32.dll\SQLProcedures", "ptr", hstmt, "ptr", szCatalogName, "short", cchCatalogName, "ptr", szSchemaName, "short", cchSchemaName, "ptr", szProcName, "short", cchProcName, "short")
        return result
    }

    /**
     * SQLTablePrivileges Function
     * @remarks
     * The *SchemaName* and *TableName* arguments accept search patterns. For more information about valid search patterns, see [Pattern Value Arguments](../../../odbc/reference/develop-app/pattern-value-arguments.md).  
     *   
     *  **SQLTablePrivileges** returns the results as a standard result set, ordered by TABLE_CAT, TABLE_SCHEM, TABLE_NAME, PRIVILEGE, and GRANTEE.  
     *   
     *  To determine the actual lengths of the TABLE_CAT, TABLE_SCHEM, and TABLE_NAME columns, an application can call **SQLGetInfo** with the SQL_MAX_CATALOG_NAME_LEN, SQL_MAX_SCHEMA_NAME_LEN, and SQL_MAX_TABLE_NAME_LEN options.  
     *   
     * > [!NOTE]  
     * >  For more information about the general use, arguments, and returned data of ODBC catalog functions, see [Catalog Functions](../../../odbc/reference/develop-app/catalog-functions.md).  
     *   
     *  The following columns have been renamed for ODBC *3.x*. The column name changes do not affect backward compatibility because applications bind by column number.  
     *   
     * |ODBC 2.0 column|ODBC *3.x* column|  
     * |---------------------|-----------------------|  
     * |TABLE_QUALIFIER|TABLE_CAT|  
     * |TABLE_OWNER|TABLE_SCHEM|  
     *   
     *  The following table lists the columns in the result set. Additional columns beyond column 7 (IS_GRANTABLE) can be defined by the driver. An application should gain access to driver-specific columns by counting down from the end of the result set rather than specifying an explicit ordinal position. For more information, see [Data Returned by Catalog Functions](../../../odbc/reference/develop-app/data-returned-by-catalog-functions.md).  
     *   
     * |Column name|Column number|Data type|Comments|  
     * |-----------------|-------------------|---------------|--------------|  
     * |TABLE_CAT (ODBC 1.0)|1|Varchar|Catalog name; NULL if not applicable to the data source. If a driver supports catalogs for some tables but not for others, such as when the driver retrieves data from different DBMSs, it returns an empty string ("") for those tables that do not have catalogs.|  
     * |TABLE_SCHEM  (ODBC 1.0)|2|Varchar|Schema name; NULL if not applicable to the data source. If a driver supports schemas for some tables but not for others, such as when the driver retrieves data from different DBMSs, it returns an empty string ("") for those tables that do not have schemas.|  
     * |TABLE_NAME (ODBC 1.0)|3|Varchar not NULL|Table name.|  
     * |GRANTOR (ODBC 1.0)|4|Varchar|Name of the user who granted the privilege; NULL if not applicable to the data source.<br /><br /> For all rows in which the value in the GRANTEE column is the owner of the object, the GRANTOR column will be "_SYSTEM".|  
     * |GRANTEE (ODBC 1.0)|5|Varchar not NULL|Name of the user to whom the privilege was granted.|  
     * |PRIVILEGE (ODBC 1.0)|6|Varchar not NULL|The table privilege. May be one of the following or a data source-specific privilege.<br /><br /> SELECT: The grantee is permitted to retrieve data for one or more columns of the table.<br /><br /> INSERT: The grantee is permitted to insert new rows containing data for one or more columns into the table.<br /><br /> UPDATE: The grantee is permitted to update the data in one or more columns of the table.<br /><br /> DELETE: The grantee is permitted to delete rows of data from the table.<br /><br /> REFERENCES: The grantee is permitted to refer to one or more columns of the table within a constraint (for example, a unique, referential, or table check constraint).<br /><br /> The scope of action permitted the grantee by a given table privilege is data source-dependent. For example, the UPDATE privilege might permit the grantee to update all columns in a table on one data source and only those columns for which the grantor has the UPDATE privilege on another data source.|  
     * |IS_GRANTABLE (ODBC 1.0)|7|Varchar|Indicates whether the grantee is permitted to grant the privilege to other users; "YES", "NO", or NULL if unknown or not applicable to the data source.<br /><br /> A privilege is either grantable or not grantable but not both. The result set returned by **SQLColumnPrivileges** will never contain two rows for which all columns except the IS_GRANTABLE column contain the same value.|
     * @param {Pointer<Void>} hstmt 
     * @param {Pointer<Byte>} szCatalogName 
     * @param {Integer} cchCatalogName 
     * @param {Pointer<Byte>} szSchemaName 
     * @param {Integer} cchSchemaName 
     * @param {Pointer<Byte>} szTableName 
     * @param {Integer} cchTableName 
     * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_STILL_EXECUTING, SQL_ERROR, or SQL_INVALID_HANDLE.
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqltableprivileges-function
     */
    static SQLTablePrivileges(hstmt, szCatalogName, cchCatalogName, szSchemaName, cchSchemaName, szTableName, cchTableName) {
        result := DllCall("ODBC32.dll\SQLTablePrivileges", "ptr", hstmt, "ptr", szCatalogName, "short", cchCatalogName, "ptr", szSchemaName, "short", cchSchemaName, "ptr", szTableName, "short", cchTableName, "short")
        return result
    }

    /**
     * SQLDrivers Function
     * @remarks
     * **SQLDrivers** returns the driver description in the \**DriverDescription* buffer. It returns additional information about the driver in the \**DriverAttributes* buffer as a list of keyword-value pairs. All keywords listed in the system information for drivers will be returned for all drivers, except for **CreateDSN**, which is used to prompt creation of data sources and therefore is optional. Each pair is terminated with a null byte, and the complete list is terminated with a null byte (that is, two null bytes mark the end of the list). For example, a file-based driver using C syntax might return the following list of attributes ("\0" represents a null character):  
     *   
     * ```  
     * FileUsage=1\0FileExtns=*.dbf\0\0  
     * ```  
     *   
     *  If \**DriverAttributes* is not large enough to hold the entire list, the list is truncated, **SQLDrivers** returns SQLSTATE 01004 (Data truncated), and the length of the list (excluding the final null-termination byte) is returned in **AttributesLengthPtr*.  
     *   
     *  Driver attribute keywords are added from the system information when the driver is installed. For more information, see [Installing ODBC Components](../../../odbc/reference/install/installing-odbc-components.md).  
     *   
     *  An application can call **SQLDrivers** multiple times to retrieve all driver descriptions. The Driver Manager retrieves this information from the system information. When there are no more driver descriptions, **SQLDrivers** returns SQL_NO_DATA. If **SQLDrivers** is called with SQL_FETCH_NEXT immediately after it returns SQL_NO_DATA, it returns the first driver description. For information about how an application uses the information returned by **SQLDrivers**, see [Choosing a Data Source or Driver](../../../odbc/reference/develop-app/choosing-a-data-source-or-driver.md).  
     *   
     *  If SQL_FETCH_NEXT is passed to **SQLDrivers** the very first time it is called, **SQLDrivers** returns the first data source name.  
     *   
     *  Because **SQLDrivers** is implemented in the Driver Manager, it is supported for all drivers regardless of a particular driver's standards compliance.
     * @param {Pointer<Void>} henv 
     * @param {Integer} fDirection 
     * @param {Pointer<Byte>} szDriverDesc 
     * @param {Integer} cchDriverDescMax 
     * @param {Pointer<Int16>} pcchDriverDesc 
     * @param {Pointer<Byte>} szDriverAttributes 
     * @param {Integer} cchDrvrAttrMax 
     * @param {Pointer<Int16>} pcchDrvrAttr 
     * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_NO_DATA, SQL_ERROR, or SQL_INVALID_HANDLE.
     * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqldrivers-function
     */
    static SQLDrivers(henv, fDirection, szDriverDesc, cchDriverDescMax, pcchDriverDesc, szDriverAttributes, cchDrvrAttrMax, pcchDrvrAttr) {
        result := DllCall("ODBC32.dll\SQLDrivers", "ptr", henv, "ushort", fDirection, "ptr", szDriverDesc, "short", cchDriverDescMax, "ptr", pcchDriverDesc, "ptr", szDriverAttributes, "short", cchDrvrAttrMax, "ptr", pcchDrvrAttr, "short")
        return result
    }

    /**
     * 
     * @param {Integer} fHandleType 
     * @param {Pointer<Void>} hInput 
     * @param {Pointer<Void>} phOutput 
     * @returns {Integer} 
     */
    static SQLAllocHandleStd(fHandleType, hInput, phOutput) {
        result := DllCall("ODBC32.dll\SQLAllocHandleStd", "short", fHandleType, "ptr", hInput, "ptr", phOutput, "short")
        return result
    }

    /**
     * 
     * @param {Integer} dwValue 
     * @returns {Integer} 
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
     * @param {Pointer<UInt16>} szDSN 
     * @param {Integer} cchDSN 
     * @param {Pointer<UInt16>} szUID 
     * @param {Integer} cchUID 
     * @param {Pointer<UInt16>} szAuthStr 
     * @param {Integer} cchAuthStr 
     * @returns {Integer} 
     */
    static SQLConnectW(hdbc, szDSN, cchDSN, szUID, cchUID, szAuthStr, cchAuthStr) {
        result := DllCall("ODBC32.dll\SQLConnectW", "ptr", hdbc, "ptr", szDSN, "short", cchDSN, "ptr", szUID, "short", cchUID, "ptr", szAuthStr, "short", cchAuthStr, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} henv 
     * @param {Pointer<Void>} hdbc 
     * @param {Pointer<Void>} hstmt 
     * @param {Pointer<UInt16>} wszSqlState 
     * @param {Pointer<Int32>} pfNativeError 
     * @param {Pointer<UInt16>} wszErrorMsg 
     * @param {Integer} cchErrorMsgMax 
     * @param {Pointer<Int16>} pcchErrorMsg 
     * @returns {Integer} 
     */
    static SQLErrorW(henv, hdbc, hstmt, wszSqlState, pfNativeError, wszErrorMsg, cchErrorMsgMax, pcchErrorMsg) {
        result := DllCall("ODBC32.dll\SQLErrorW", "ptr", henv, "ptr", hdbc, "ptr", hstmt, "ptr", wszSqlState, "ptr", pfNativeError, "ptr", wszErrorMsg, "short", cchErrorMsgMax, "ptr", pcchErrorMsg, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Pointer<UInt16>} szSqlStr 
     * @param {Integer} TextLength 
     * @returns {Integer} 
     */
    static SQLExecDirectW(hstmt, szSqlStr, TextLength) {
        result := DllCall("ODBC32.dll\SQLExecDirectW", "ptr", hstmt, "ptr", szSqlStr, "int", TextLength, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hdbc 
     * @param {Integer} fAttribute 
     * @param {Pointer<Void>} rgbValue 
     * @param {Integer} cbValueMax 
     * @param {Pointer<Int32>} pcbValue 
     * @returns {Integer} 
     */
    static SQLGetConnectAttrW(hdbc, fAttribute, rgbValue, cbValueMax, pcbValue) {
        result := DllCall("ODBC32.dll\SQLGetConnectAttrW", "ptr", hdbc, "int", fAttribute, "ptr", rgbValue, "int", cbValueMax, "ptr", pcbValue, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Pointer<UInt16>} szCursor 
     * @param {Integer} cchCursorMax 
     * @param {Pointer<Int16>} pcchCursor 
     * @returns {Integer} 
     */
    static SQLGetCursorNameW(hstmt, szCursor, cchCursorMax, pcchCursor) {
        result := DllCall("ODBC32.dll\SQLGetCursorNameW", "ptr", hstmt, "ptr", szCursor, "short", cchCursorMax, "ptr", pcchCursor, "short")
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
        result := DllCall("ODBC32.dll\SQLSetDescFieldW", "ptr", DescriptorHandle, "short", RecNumber, "short", FieldIdentifier, "ptr", Value, "int", BufferLength, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hdesc 
     * @param {Integer} iRecord 
     * @param {Integer} iField 
     * @param {Pointer<Void>} rgbValue 
     * @param {Integer} cbBufferLength 
     * @param {Pointer<Int32>} StringLength 
     * @returns {Integer} 
     */
    static SQLGetDescFieldW(hdesc, iRecord, iField, rgbValue, cbBufferLength, StringLength) {
        result := DllCall("ODBC32.dll\SQLGetDescFieldW", "ptr", hdesc, "short", iRecord, "short", iField, "ptr", rgbValue, "int", cbBufferLength, "ptr", StringLength, "short")
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
     * @param {Pointer<Int16>} pcbStringLength 
     * @returns {Integer} 
     */
    static SQLGetDiagFieldW(fHandleType, handle, iRecord, fDiagField, rgbDiagInfo, cbBufferLength, pcbStringLength) {
        result := DllCall("ODBC32.dll\SQLGetDiagFieldW", "short", fHandleType, "ptr", handle, "short", iRecord, "short", fDiagField, "ptr", rgbDiagInfo, "short", cbBufferLength, "ptr", pcbStringLength, "short")
        return result
    }

    /**
     * 
     * @param {Integer} fHandleType 
     * @param {Pointer<Void>} handle 
     * @param {Integer} iRecord 
     * @param {Pointer<UInt16>} szSqlState 
     * @param {Pointer<Int32>} pfNativeError 
     * @param {Pointer<UInt16>} szErrorMsg 
     * @param {Integer} cchErrorMsgMax 
     * @param {Pointer<Int16>} pcchErrorMsg 
     * @returns {Integer} 
     */
    static SQLGetDiagRecW(fHandleType, handle, iRecord, szSqlState, pfNativeError, szErrorMsg, cchErrorMsgMax, pcchErrorMsg) {
        result := DllCall("ODBC32.dll\SQLGetDiagRecW", "short", fHandleType, "ptr", handle, "short", iRecord, "ptr", szSqlState, "ptr", pfNativeError, "ptr", szErrorMsg, "short", cchErrorMsgMax, "ptr", pcchErrorMsg, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Pointer<UInt16>} szSqlStr 
     * @param {Integer} cchSqlStr 
     * @returns {Integer} 
     */
    static SQLPrepareW(hstmt, szSqlStr, cchSqlStr) {
        result := DllCall("ODBC32.dll\SQLPrepareW", "ptr", hstmt, "ptr", szSqlStr, "int", cchSqlStr, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hdbc 
     * @param {Integer} fAttribute 
     * @param {Pointer<Void>} rgbValue 
     * @param {Integer} cbValue 
     * @returns {Integer} 
     */
    static SQLSetConnectAttrW(hdbc, fAttribute, rgbValue, cbValue) {
        result := DllCall("ODBC32.dll\SQLSetConnectAttrW", "ptr", hdbc, "int", fAttribute, "ptr", rgbValue, "int", cbValue, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Pointer<UInt16>} szCursor 
     * @param {Integer} cchCursor 
     * @returns {Integer} 
     */
    static SQLSetCursorNameW(hstmt, szCursor, cchCursor) {
        result := DllCall("ODBC32.dll\SQLSetCursorNameW", "ptr", hstmt, "ptr", szCursor, "short", cchCursor, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Pointer<UInt16>} szCatalogName 
     * @param {Integer} cchCatalogName 
     * @param {Pointer<UInt16>} szSchemaName 
     * @param {Integer} cchSchemaName 
     * @param {Pointer<UInt16>} szTableName 
     * @param {Integer} cchTableName 
     * @param {Pointer<UInt16>} szColumnName 
     * @param {Integer} cchColumnName 
     * @returns {Integer} 
     */
    static SQLColumnsW(hstmt, szCatalogName, cchCatalogName, szSchemaName, cchSchemaName, szTableName, cchTableName, szColumnName, cchColumnName) {
        result := DllCall("ODBC32.dll\SQLColumnsW", "ptr", hstmt, "ptr", szCatalogName, "short", cchCatalogName, "ptr", szSchemaName, "short", cchSchemaName, "ptr", szTableName, "short", cchTableName, "ptr", szColumnName, "short", cchColumnName, "short")
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
        result := DllCall("ODBC32.dll\SQLGetConnectOptionW", "ptr", hdbc, "ushort", fOption, "ptr", pvParam, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hdbc 
     * @param {Integer} fInfoType 
     * @param {Pointer<Void>} rgbInfoValue 
     * @param {Integer} cbInfoValueMax 
     * @param {Pointer<Int16>} pcbInfoValue 
     * @returns {Integer} 
     */
    static SQLGetInfoW(hdbc, fInfoType, rgbInfoValue, cbInfoValueMax, pcbInfoValue) {
        result := DllCall("ODBC32.dll\SQLGetInfoW", "ptr", hdbc, "ushort", fInfoType, "ptr", rgbInfoValue, "short", cbInfoValueMax, "ptr", pcbInfoValue, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} StatementHandle 
     * @param {Integer} DataType 
     * @returns {Integer} 
     */
    static SQLGetTypeInfoW(StatementHandle, DataType) {
        result := DllCall("ODBC32.dll\SQLGetTypeInfoW", "ptr", StatementHandle, "short", DataType, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Integer} fColType 
     * @param {Pointer<UInt16>} szCatalogName 
     * @param {Integer} cchCatalogName 
     * @param {Pointer<UInt16>} szSchemaName 
     * @param {Integer} cchSchemaName 
     * @param {Pointer<UInt16>} szTableName 
     * @param {Integer} cchTableName 
     * @param {Integer} fScope 
     * @param {Integer} fNullable 
     * @returns {Integer} 
     */
    static SQLSpecialColumnsW(hstmt, fColType, szCatalogName, cchCatalogName, szSchemaName, cchSchemaName, szTableName, cchTableName, fScope, fNullable) {
        result := DllCall("ODBC32.dll\SQLSpecialColumnsW", "ptr", hstmt, "ushort", fColType, "ptr", szCatalogName, "short", cchCatalogName, "ptr", szSchemaName, "short", cchSchemaName, "ptr", szTableName, "short", cchTableName, "ushort", fScope, "ushort", fNullable, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Pointer<UInt16>} szCatalogName 
     * @param {Integer} cchCatalogName 
     * @param {Pointer<UInt16>} szSchemaName 
     * @param {Integer} cchSchemaName 
     * @param {Pointer<UInt16>} szTableName 
     * @param {Integer} cchTableName 
     * @param {Integer} fUnique 
     * @param {Integer} fAccuracy 
     * @returns {Integer} 
     */
    static SQLStatisticsW(hstmt, szCatalogName, cchCatalogName, szSchemaName, cchSchemaName, szTableName, cchTableName, fUnique, fAccuracy) {
        result := DllCall("ODBC32.dll\SQLStatisticsW", "ptr", hstmt, "ptr", szCatalogName, "short", cchCatalogName, "ptr", szSchemaName, "short", cchSchemaName, "ptr", szTableName, "short", cchTableName, "ushort", fUnique, "ushort", fAccuracy, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Pointer<UInt16>} szCatalogName 
     * @param {Integer} cchCatalogName 
     * @param {Pointer<UInt16>} szSchemaName 
     * @param {Integer} cchSchemaName 
     * @param {Pointer<UInt16>} szTableName 
     * @param {Integer} cchTableName 
     * @param {Pointer<UInt16>} szTableType 
     * @param {Integer} cchTableType 
     * @returns {Integer} 
     */
    static SQLTablesW(hstmt, szCatalogName, cchCatalogName, szSchemaName, cchSchemaName, szTableName, cchTableName, szTableType, cchTableType) {
        result := DllCall("ODBC32.dll\SQLTablesW", "ptr", hstmt, "ptr", szCatalogName, "short", cchCatalogName, "ptr", szSchemaName, "short", cchSchemaName, "ptr", szTableName, "short", cchTableName, "ptr", szTableType, "short", cchTableType, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} henv 
     * @param {Integer} fDirection 
     * @param {Pointer<UInt16>} szDSN 
     * @param {Integer} cchDSNMax 
     * @param {Pointer<Int16>} pcchDSN 
     * @param {Pointer<UInt16>} wszDescription 
     * @param {Integer} cchDescriptionMax 
     * @param {Pointer<Int16>} pcchDescription 
     * @returns {Integer} 
     */
    static SQLDataSourcesW(henv, fDirection, szDSN, cchDSNMax, pcchDSN, wszDescription, cchDescriptionMax, pcchDescription) {
        result := DllCall("ODBC32.dll\SQLDataSourcesW", "ptr", henv, "ushort", fDirection, "ptr", szDSN, "short", cchDSNMax, "ptr", pcchDSN, "ptr", wszDescription, "short", cchDescriptionMax, "ptr", pcchDescription, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hdbc 
     * @param {Pointer} hwnd 
     * @param {Pointer<UInt16>} szConnStrIn 
     * @param {Integer} cchConnStrIn 
     * @param {Pointer<UInt16>} szConnStrOut 
     * @param {Integer} cchConnStrOutMax 
     * @param {Pointer<Int16>} pcchConnStrOut 
     * @param {Integer} fDriverCompletion 
     * @returns {Integer} 
     */
    static SQLDriverConnectW(hdbc, hwnd, szConnStrIn, cchConnStrIn, szConnStrOut, cchConnStrOutMax, pcchConnStrOut, fDriverCompletion) {
        result := DllCall("ODBC32.dll\SQLDriverConnectW", "ptr", hdbc, "ptr", hwnd, "ptr", szConnStrIn, "short", cchConnStrIn, "ptr", szConnStrOut, "short", cchConnStrOutMax, "ptr", pcchConnStrOut, "ushort", fDriverCompletion, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hdbc 
     * @param {Pointer<UInt16>} szConnStrIn 
     * @param {Integer} cchConnStrIn 
     * @param {Pointer<UInt16>} szConnStrOut 
     * @param {Integer} cchConnStrOutMax 
     * @param {Pointer<Int16>} pcchConnStrOut 
     * @returns {Integer} 
     */
    static SQLBrowseConnectW(hdbc, szConnStrIn, cchConnStrIn, szConnStrOut, cchConnStrOutMax, pcchConnStrOut) {
        result := DllCall("ODBC32.dll\SQLBrowseConnectW", "ptr", hdbc, "ptr", szConnStrIn, "short", cchConnStrIn, "ptr", szConnStrOut, "short", cchConnStrOutMax, "ptr", pcchConnStrOut, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Pointer<UInt16>} szCatalogName 
     * @param {Integer} cchCatalogName 
     * @param {Pointer<UInt16>} szSchemaName 
     * @param {Integer} cchSchemaName 
     * @param {Pointer<UInt16>} szTableName 
     * @param {Integer} cchTableName 
     * @param {Pointer<UInt16>} szColumnName 
     * @param {Integer} cchColumnName 
     * @returns {Integer} 
     */
    static SQLColumnPrivilegesW(hstmt, szCatalogName, cchCatalogName, szSchemaName, cchSchemaName, szTableName, cchTableName, szColumnName, cchColumnName) {
        result := DllCall("ODBC32.dll\SQLColumnPrivilegesW", "ptr", hstmt, "ptr", szCatalogName, "short", cchCatalogName, "ptr", szSchemaName, "short", cchSchemaName, "ptr", szTableName, "short", cchTableName, "ptr", szColumnName, "short", cchColumnName, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Integer} fAttribute 
     * @param {Pointer<Void>} rgbValue 
     * @param {Integer} cbValueMax 
     * @param {Pointer<Int32>} pcbValue 
     * @returns {Integer} 
     */
    static SQLGetStmtAttrW(hstmt, fAttribute, rgbValue, cbValueMax, pcbValue) {
        result := DllCall("ODBC32.dll\SQLGetStmtAttrW", "ptr", hstmt, "int", fAttribute, "ptr", rgbValue, "int", cbValueMax, "ptr", pcbValue, "short")
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
        result := DllCall("ODBC32.dll\SQLSetStmtAttrW", "ptr", hstmt, "int", fAttribute, "ptr", rgbValue, "int", cbValueMax, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Pointer<UInt16>} szPkCatalogName 
     * @param {Integer} cchPkCatalogName 
     * @param {Pointer<UInt16>} szPkSchemaName 
     * @param {Integer} cchPkSchemaName 
     * @param {Pointer<UInt16>} szPkTableName 
     * @param {Integer} cchPkTableName 
     * @param {Pointer<UInt16>} szFkCatalogName 
     * @param {Integer} cchFkCatalogName 
     * @param {Pointer<UInt16>} szFkSchemaName 
     * @param {Integer} cchFkSchemaName 
     * @param {Pointer<UInt16>} szFkTableName 
     * @param {Integer} cchFkTableName 
     * @returns {Integer} 
     */
    static SQLForeignKeysW(hstmt, szPkCatalogName, cchPkCatalogName, szPkSchemaName, cchPkSchemaName, szPkTableName, cchPkTableName, szFkCatalogName, cchFkCatalogName, szFkSchemaName, cchFkSchemaName, szFkTableName, cchFkTableName) {
        result := DllCall("ODBC32.dll\SQLForeignKeysW", "ptr", hstmt, "ptr", szPkCatalogName, "short", cchPkCatalogName, "ptr", szPkSchemaName, "short", cchPkSchemaName, "ptr", szPkTableName, "short", cchPkTableName, "ptr", szFkCatalogName, "short", cchFkCatalogName, "ptr", szFkSchemaName, "short", cchFkSchemaName, "ptr", szFkTableName, "short", cchFkTableName, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hdbc 
     * @param {Pointer<UInt16>} szSqlStrIn 
     * @param {Integer} cchSqlStrIn 
     * @param {Pointer<UInt16>} szSqlStr 
     * @param {Integer} cchSqlStrMax 
     * @param {Pointer<Int32>} pcchSqlStr 
     * @returns {Integer} 
     */
    static SQLNativeSqlW(hdbc, szSqlStrIn, cchSqlStrIn, szSqlStr, cchSqlStrMax, pcchSqlStr) {
        result := DllCall("ODBC32.dll\SQLNativeSqlW", "ptr", hdbc, "ptr", szSqlStrIn, "int", cchSqlStrIn, "ptr", szSqlStr, "int", cchSqlStrMax, "ptr", pcchSqlStr, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Pointer<UInt16>} szCatalogName 
     * @param {Integer} cchCatalogName 
     * @param {Pointer<UInt16>} szSchemaName 
     * @param {Integer} cchSchemaName 
     * @param {Pointer<UInt16>} szTableName 
     * @param {Integer} cchTableName 
     * @returns {Integer} 
     */
    static SQLPrimaryKeysW(hstmt, szCatalogName, cchCatalogName, szSchemaName, cchSchemaName, szTableName, cchTableName) {
        result := DllCall("ODBC32.dll\SQLPrimaryKeysW", "ptr", hstmt, "ptr", szCatalogName, "short", cchCatalogName, "ptr", szSchemaName, "short", cchSchemaName, "ptr", szTableName, "short", cchTableName, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Pointer<UInt16>} szCatalogName 
     * @param {Integer} cchCatalogName 
     * @param {Pointer<UInt16>} szSchemaName 
     * @param {Integer} cchSchemaName 
     * @param {Pointer<UInt16>} szProcName 
     * @param {Integer} cchProcName 
     * @param {Pointer<UInt16>} szColumnName 
     * @param {Integer} cchColumnName 
     * @returns {Integer} 
     */
    static SQLProcedureColumnsW(hstmt, szCatalogName, cchCatalogName, szSchemaName, cchSchemaName, szProcName, cchProcName, szColumnName, cchColumnName) {
        result := DllCall("ODBC32.dll\SQLProcedureColumnsW", "ptr", hstmt, "ptr", szCatalogName, "short", cchCatalogName, "ptr", szSchemaName, "short", cchSchemaName, "ptr", szProcName, "short", cchProcName, "ptr", szColumnName, "short", cchColumnName, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Pointer<UInt16>} szCatalogName 
     * @param {Integer} cchCatalogName 
     * @param {Pointer<UInt16>} szSchemaName 
     * @param {Integer} cchSchemaName 
     * @param {Pointer<UInt16>} szProcName 
     * @param {Integer} cchProcName 
     * @returns {Integer} 
     */
    static SQLProceduresW(hstmt, szCatalogName, cchCatalogName, szSchemaName, cchSchemaName, szProcName, cchProcName) {
        result := DllCall("ODBC32.dll\SQLProceduresW", "ptr", hstmt, "ptr", szCatalogName, "short", cchCatalogName, "ptr", szSchemaName, "short", cchSchemaName, "ptr", szProcName, "short", cchProcName, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Pointer<UInt16>} szCatalogName 
     * @param {Integer} cchCatalogName 
     * @param {Pointer<UInt16>} szSchemaName 
     * @param {Integer} cchSchemaName 
     * @param {Pointer<UInt16>} szTableName 
     * @param {Integer} cchTableName 
     * @returns {Integer} 
     */
    static SQLTablePrivilegesW(hstmt, szCatalogName, cchCatalogName, szSchemaName, cchSchemaName, szTableName, cchTableName) {
        result := DllCall("ODBC32.dll\SQLTablePrivilegesW", "ptr", hstmt, "ptr", szCatalogName, "short", cchCatalogName, "ptr", szSchemaName, "short", cchSchemaName, "ptr", szTableName, "short", cchTableName, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} henv 
     * @param {Integer} fDirection 
     * @param {Pointer<UInt16>} szDriverDesc 
     * @param {Integer} cchDriverDescMax 
     * @param {Pointer<Int16>} pcchDriverDesc 
     * @param {Pointer<UInt16>} szDriverAttributes 
     * @param {Integer} cchDrvrAttrMax 
     * @param {Pointer<Int16>} pcchDrvrAttr 
     * @returns {Integer} 
     */
    static SQLDriversW(henv, fDirection, szDriverDesc, cchDriverDescMax, pcchDriverDesc, szDriverAttributes, cchDrvrAttrMax, pcchDrvrAttr) {
        result := DllCall("ODBC32.dll\SQLDriversW", "ptr", henv, "ushort", fDirection, "ptr", szDriverDesc, "short", cchDriverDescMax, "ptr", pcchDriverDesc, "ptr", szDriverAttributes, "short", cchDrvrAttrMax, "ptr", pcchDrvrAttr, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hdbc 
     * @param {Pointer<Byte>} szDSN 
     * @param {Integer} cbDSN 
     * @param {Pointer<Byte>} szUID 
     * @param {Integer} cbUID 
     * @param {Pointer<Byte>} szAuthStr 
     * @param {Integer} cbAuthStr 
     * @returns {Integer} 
     */
    static SQLConnectA(hdbc, szDSN, cbDSN, szUID, cbUID, szAuthStr, cbAuthStr) {
        result := DllCall("ODBC32.dll\SQLConnectA", "ptr", hdbc, "ptr", szDSN, "short", cbDSN, "ptr", szUID, "short", cbUID, "ptr", szAuthStr, "short", cbAuthStr, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} henv 
     * @param {Pointer<Void>} hdbc 
     * @param {Pointer<Void>} hstmt 
     * @param {Pointer<Byte>} szSqlState 
     * @param {Pointer<Int32>} pfNativeError 
     * @param {Pointer<Byte>} szErrorMsg 
     * @param {Integer} cbErrorMsgMax 
     * @param {Pointer<Int16>} pcbErrorMsg 
     * @returns {Integer} 
     */
    static SQLErrorA(henv, hdbc, hstmt, szSqlState, pfNativeError, szErrorMsg, cbErrorMsgMax, pcbErrorMsg) {
        result := DllCall("ODBC32.dll\SQLErrorA", "ptr", henv, "ptr", hdbc, "ptr", hstmt, "ptr", szSqlState, "ptr", pfNativeError, "ptr", szErrorMsg, "short", cbErrorMsgMax, "ptr", pcbErrorMsg, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Pointer<Byte>} szSqlStr 
     * @param {Integer} cbSqlStr 
     * @returns {Integer} 
     */
    static SQLExecDirectA(hstmt, szSqlStr, cbSqlStr) {
        result := DllCall("ODBC32.dll\SQLExecDirectA", "ptr", hstmt, "ptr", szSqlStr, "int", cbSqlStr, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hdbc 
     * @param {Integer} fAttribute 
     * @param {Pointer<Void>} rgbValue 
     * @param {Integer} cbValueMax 
     * @param {Pointer<Int32>} pcbValue 
     * @returns {Integer} 
     */
    static SQLGetConnectAttrA(hdbc, fAttribute, rgbValue, cbValueMax, pcbValue) {
        result := DllCall("ODBC32.dll\SQLGetConnectAttrA", "ptr", hdbc, "int", fAttribute, "ptr", rgbValue, "int", cbValueMax, "ptr", pcbValue, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Pointer<Byte>} szCursor 
     * @param {Integer} cbCursorMax 
     * @param {Pointer<Int16>} pcbCursor 
     * @returns {Integer} 
     */
    static SQLGetCursorNameA(hstmt, szCursor, cbCursorMax, pcbCursor) {
        result := DllCall("ODBC32.dll\SQLGetCursorNameA", "ptr", hstmt, "ptr", szCursor, "short", cbCursorMax, "ptr", pcbCursor, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hdesc 
     * @param {Integer} iRecord 
     * @param {Integer} iField 
     * @param {Pointer<Void>} rgbValue 
     * @param {Integer} cbBufferLength 
     * @param {Pointer<Int32>} StringLength 
     * @returns {Integer} 
     */
    static SQLGetDescFieldA(hdesc, iRecord, iField, rgbValue, cbBufferLength, StringLength) {
        result := DllCall("ODBC32.dll\SQLGetDescFieldA", "ptr", hdesc, "short", iRecord, "short", iField, "ptr", rgbValue, "int", cbBufferLength, "ptr", StringLength, "short")
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
     * @param {Pointer<Int16>} pcbDiagInfo 
     * @returns {Integer} 
     */
    static SQLGetDiagFieldA(fHandleType, handle, iRecord, fDiagField, rgbDiagInfo, cbDiagInfoMax, pcbDiagInfo) {
        result := DllCall("ODBC32.dll\SQLGetDiagFieldA", "short", fHandleType, "ptr", handle, "short", iRecord, "short", fDiagField, "ptr", rgbDiagInfo, "short", cbDiagInfoMax, "ptr", pcbDiagInfo, "short")
        return result
    }

    /**
     * 
     * @param {Integer} fHandleType 
     * @param {Pointer<Void>} handle 
     * @param {Integer} iRecord 
     * @param {Pointer<Byte>} szSqlState 
     * @param {Pointer<Int32>} pfNativeError 
     * @param {Pointer<Byte>} szErrorMsg 
     * @param {Integer} cbErrorMsgMax 
     * @param {Pointer<Int16>} pcbErrorMsg 
     * @returns {Integer} 
     */
    static SQLGetDiagRecA(fHandleType, handle, iRecord, szSqlState, pfNativeError, szErrorMsg, cbErrorMsgMax, pcbErrorMsg) {
        result := DllCall("ODBC32.dll\SQLGetDiagRecA", "short", fHandleType, "ptr", handle, "short", iRecord, "ptr", szSqlState, "ptr", pfNativeError, "ptr", szErrorMsg, "short", cbErrorMsgMax, "ptr", pcbErrorMsg, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Integer} fAttribute 
     * @param {Pointer<Void>} rgbValue 
     * @param {Integer} cbValueMax 
     * @param {Pointer<Int32>} pcbValue 
     * @returns {Integer} 
     */
    static SQLGetStmtAttrA(hstmt, fAttribute, rgbValue, cbValueMax, pcbValue) {
        result := DllCall("ODBC32.dll\SQLGetStmtAttrA", "ptr", hstmt, "int", fAttribute, "ptr", rgbValue, "int", cbValueMax, "ptr", pcbValue, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} StatementHandle 
     * @param {Integer} DataType 
     * @returns {Integer} 
     */
    static SQLGetTypeInfoA(StatementHandle, DataType) {
        result := DllCall("ODBC32.dll\SQLGetTypeInfoA", "ptr", StatementHandle, "short", DataType, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Pointer<Byte>} szSqlStr 
     * @param {Integer} cbSqlStr 
     * @returns {Integer} 
     */
    static SQLPrepareA(hstmt, szSqlStr, cbSqlStr) {
        result := DllCall("ODBC32.dll\SQLPrepareA", "ptr", hstmt, "ptr", szSqlStr, "int", cbSqlStr, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hdbc 
     * @param {Integer} fAttribute 
     * @param {Pointer<Void>} rgbValue 
     * @param {Integer} cbValue 
     * @returns {Integer} 
     */
    static SQLSetConnectAttrA(hdbc, fAttribute, rgbValue, cbValue) {
        result := DllCall("ODBC32.dll\SQLSetConnectAttrA", "ptr", hdbc, "int", fAttribute, "ptr", rgbValue, "int", cbValue, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Pointer<Byte>} szCursor 
     * @param {Integer} cbCursor 
     * @returns {Integer} 
     */
    static SQLSetCursorNameA(hstmt, szCursor, cbCursor) {
        result := DllCall("ODBC32.dll\SQLSetCursorNameA", "ptr", hstmt, "ptr", szCursor, "short", cbCursor, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Pointer<Byte>} szCatalogName 
     * @param {Integer} cbCatalogName 
     * @param {Pointer<Byte>} szSchemaName 
     * @param {Integer} cbSchemaName 
     * @param {Pointer<Byte>} szTableName 
     * @param {Integer} cbTableName 
     * @param {Pointer<Byte>} szColumnName 
     * @param {Integer} cbColumnName 
     * @returns {Integer} 
     */
    static SQLColumnsA(hstmt, szCatalogName, cbCatalogName, szSchemaName, cbSchemaName, szTableName, cbTableName, szColumnName, cbColumnName) {
        result := DllCall("ODBC32.dll\SQLColumnsA", "ptr", hstmt, "ptr", szCatalogName, "short", cbCatalogName, "ptr", szSchemaName, "short", cbSchemaName, "ptr", szTableName, "short", cbTableName, "ptr", szColumnName, "short", cbColumnName, "short")
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
        result := DllCall("ODBC32.dll\SQLGetConnectOptionA", "ptr", hdbc, "ushort", fOption, "ptr", pvParam, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hdbc 
     * @param {Integer} fInfoType 
     * @param {Pointer<Void>} rgbInfoValue 
     * @param {Integer} cbInfoValueMax 
     * @param {Pointer<Int16>} pcbInfoValue 
     * @returns {Integer} 
     */
    static SQLGetInfoA(hdbc, fInfoType, rgbInfoValue, cbInfoValueMax, pcbInfoValue) {
        result := DllCall("ODBC32.dll\SQLGetInfoA", "ptr", hdbc, "ushort", fInfoType, "ptr", rgbInfoValue, "short", cbInfoValueMax, "ptr", pcbInfoValue, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Integer} fColType 
     * @param {Pointer<Byte>} szCatalogName 
     * @param {Integer} cbCatalogName 
     * @param {Pointer<Byte>} szSchemaName 
     * @param {Integer} cbSchemaName 
     * @param {Pointer<Byte>} szTableName 
     * @param {Integer} cbTableName 
     * @param {Integer} fScope 
     * @param {Integer} fNullable 
     * @returns {Integer} 
     */
    static SQLSpecialColumnsA(hstmt, fColType, szCatalogName, cbCatalogName, szSchemaName, cbSchemaName, szTableName, cbTableName, fScope, fNullable) {
        result := DllCall("ODBC32.dll\SQLSpecialColumnsA", "ptr", hstmt, "ushort", fColType, "ptr", szCatalogName, "short", cbCatalogName, "ptr", szSchemaName, "short", cbSchemaName, "ptr", szTableName, "short", cbTableName, "ushort", fScope, "ushort", fNullable, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Pointer<Byte>} szCatalogName 
     * @param {Integer} cbCatalogName 
     * @param {Pointer<Byte>} szSchemaName 
     * @param {Integer} cbSchemaName 
     * @param {Pointer<Byte>} szTableName 
     * @param {Integer} cbTableName 
     * @param {Integer} fUnique 
     * @param {Integer} fAccuracy 
     * @returns {Integer} 
     */
    static SQLStatisticsA(hstmt, szCatalogName, cbCatalogName, szSchemaName, cbSchemaName, szTableName, cbTableName, fUnique, fAccuracy) {
        result := DllCall("ODBC32.dll\SQLStatisticsA", "ptr", hstmt, "ptr", szCatalogName, "short", cbCatalogName, "ptr", szSchemaName, "short", cbSchemaName, "ptr", szTableName, "short", cbTableName, "ushort", fUnique, "ushort", fAccuracy, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Pointer<Byte>} szCatalogName 
     * @param {Integer} cbCatalogName 
     * @param {Pointer<Byte>} szSchemaName 
     * @param {Integer} cbSchemaName 
     * @param {Pointer<Byte>} szTableName 
     * @param {Integer} cbTableName 
     * @param {Pointer<Byte>} szTableType 
     * @param {Integer} cbTableType 
     * @returns {Integer} 
     */
    static SQLTablesA(hstmt, szCatalogName, cbCatalogName, szSchemaName, cbSchemaName, szTableName, cbTableName, szTableType, cbTableType) {
        result := DllCall("ODBC32.dll\SQLTablesA", "ptr", hstmt, "ptr", szCatalogName, "short", cbCatalogName, "ptr", szSchemaName, "short", cbSchemaName, "ptr", szTableName, "short", cbTableName, "ptr", szTableType, "short", cbTableType, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} henv 
     * @param {Integer} fDirection 
     * @param {Pointer<Byte>} szDSN 
     * @param {Integer} cbDSNMax 
     * @param {Pointer<Int16>} pcbDSN 
     * @param {Pointer<Byte>} szDescription 
     * @param {Integer} cbDescriptionMax 
     * @param {Pointer<Int16>} pcbDescription 
     * @returns {Integer} 
     */
    static SQLDataSourcesA(henv, fDirection, szDSN, cbDSNMax, pcbDSN, szDescription, cbDescriptionMax, pcbDescription) {
        result := DllCall("ODBC32.dll\SQLDataSourcesA", "ptr", henv, "ushort", fDirection, "ptr", szDSN, "short", cbDSNMax, "ptr", pcbDSN, "ptr", szDescription, "short", cbDescriptionMax, "ptr", pcbDescription, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hdbc 
     * @param {Pointer} hwnd 
     * @param {Pointer<Byte>} szConnStrIn 
     * @param {Integer} cbConnStrIn 
     * @param {Pointer<Byte>} szConnStrOut 
     * @param {Integer} cbConnStrOutMax 
     * @param {Pointer<Int16>} pcbConnStrOut 
     * @param {Integer} fDriverCompletion 
     * @returns {Integer} 
     */
    static SQLDriverConnectA(hdbc, hwnd, szConnStrIn, cbConnStrIn, szConnStrOut, cbConnStrOutMax, pcbConnStrOut, fDriverCompletion) {
        result := DllCall("ODBC32.dll\SQLDriverConnectA", "ptr", hdbc, "ptr", hwnd, "ptr", szConnStrIn, "short", cbConnStrIn, "ptr", szConnStrOut, "short", cbConnStrOutMax, "ptr", pcbConnStrOut, "ushort", fDriverCompletion, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hdbc 
     * @param {Pointer<Byte>} szConnStrIn 
     * @param {Integer} cbConnStrIn 
     * @param {Pointer<Byte>} szConnStrOut 
     * @param {Integer} cbConnStrOutMax 
     * @param {Pointer<Int16>} pcbConnStrOut 
     * @returns {Integer} 
     */
    static SQLBrowseConnectA(hdbc, szConnStrIn, cbConnStrIn, szConnStrOut, cbConnStrOutMax, pcbConnStrOut) {
        result := DllCall("ODBC32.dll\SQLBrowseConnectA", "ptr", hdbc, "ptr", szConnStrIn, "short", cbConnStrIn, "ptr", szConnStrOut, "short", cbConnStrOutMax, "ptr", pcbConnStrOut, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Pointer<Byte>} szCatalogName 
     * @param {Integer} cbCatalogName 
     * @param {Pointer<Byte>} szSchemaName 
     * @param {Integer} cbSchemaName 
     * @param {Pointer<Byte>} szTableName 
     * @param {Integer} cbTableName 
     * @param {Pointer<Byte>} szColumnName 
     * @param {Integer} cbColumnName 
     * @returns {Integer} 
     */
    static SQLColumnPrivilegesA(hstmt, szCatalogName, cbCatalogName, szSchemaName, cbSchemaName, szTableName, cbTableName, szColumnName, cbColumnName) {
        result := DllCall("ODBC32.dll\SQLColumnPrivilegesA", "ptr", hstmt, "ptr", szCatalogName, "short", cbCatalogName, "ptr", szSchemaName, "short", cbSchemaName, "ptr", szTableName, "short", cbTableName, "ptr", szColumnName, "short", cbColumnName, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Pointer<Byte>} szPkCatalogName 
     * @param {Integer} cbPkCatalogName 
     * @param {Pointer<Byte>} szPkSchemaName 
     * @param {Integer} cbPkSchemaName 
     * @param {Pointer<Byte>} szPkTableName 
     * @param {Integer} cbPkTableName 
     * @param {Pointer<Byte>} szFkCatalogName 
     * @param {Integer} cbFkCatalogName 
     * @param {Pointer<Byte>} szFkSchemaName 
     * @param {Integer} cbFkSchemaName 
     * @param {Pointer<Byte>} szFkTableName 
     * @param {Integer} cbFkTableName 
     * @returns {Integer} 
     */
    static SQLForeignKeysA(hstmt, szPkCatalogName, cbPkCatalogName, szPkSchemaName, cbPkSchemaName, szPkTableName, cbPkTableName, szFkCatalogName, cbFkCatalogName, szFkSchemaName, cbFkSchemaName, szFkTableName, cbFkTableName) {
        result := DllCall("ODBC32.dll\SQLForeignKeysA", "ptr", hstmt, "ptr", szPkCatalogName, "short", cbPkCatalogName, "ptr", szPkSchemaName, "short", cbPkSchemaName, "ptr", szPkTableName, "short", cbPkTableName, "ptr", szFkCatalogName, "short", cbFkCatalogName, "ptr", szFkSchemaName, "short", cbFkSchemaName, "ptr", szFkTableName, "short", cbFkTableName, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hdbc 
     * @param {Pointer<Byte>} szSqlStrIn 
     * @param {Integer} cbSqlStrIn 
     * @param {Pointer<Byte>} szSqlStr 
     * @param {Integer} cbSqlStrMax 
     * @param {Pointer<Int32>} pcbSqlStr 
     * @returns {Integer} 
     */
    static SQLNativeSqlA(hdbc, szSqlStrIn, cbSqlStrIn, szSqlStr, cbSqlStrMax, pcbSqlStr) {
        result := DllCall("ODBC32.dll\SQLNativeSqlA", "ptr", hdbc, "ptr", szSqlStrIn, "int", cbSqlStrIn, "ptr", szSqlStr, "int", cbSqlStrMax, "ptr", pcbSqlStr, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Pointer<Byte>} szCatalogName 
     * @param {Integer} cbCatalogName 
     * @param {Pointer<Byte>} szSchemaName 
     * @param {Integer} cbSchemaName 
     * @param {Pointer<Byte>} szTableName 
     * @param {Integer} cbTableName 
     * @returns {Integer} 
     */
    static SQLPrimaryKeysA(hstmt, szCatalogName, cbCatalogName, szSchemaName, cbSchemaName, szTableName, cbTableName) {
        result := DllCall("ODBC32.dll\SQLPrimaryKeysA", "ptr", hstmt, "ptr", szCatalogName, "short", cbCatalogName, "ptr", szSchemaName, "short", cbSchemaName, "ptr", szTableName, "short", cbTableName, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Pointer<Byte>} szCatalogName 
     * @param {Integer} cbCatalogName 
     * @param {Pointer<Byte>} szSchemaName 
     * @param {Integer} cbSchemaName 
     * @param {Pointer<Byte>} szProcName 
     * @param {Integer} cbProcName 
     * @param {Pointer<Byte>} szColumnName 
     * @param {Integer} cbColumnName 
     * @returns {Integer} 
     */
    static SQLProcedureColumnsA(hstmt, szCatalogName, cbCatalogName, szSchemaName, cbSchemaName, szProcName, cbProcName, szColumnName, cbColumnName) {
        result := DllCall("ODBC32.dll\SQLProcedureColumnsA", "ptr", hstmt, "ptr", szCatalogName, "short", cbCatalogName, "ptr", szSchemaName, "short", cbSchemaName, "ptr", szProcName, "short", cbProcName, "ptr", szColumnName, "short", cbColumnName, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Pointer<Byte>} szCatalogName 
     * @param {Integer} cbCatalogName 
     * @param {Pointer<Byte>} szSchemaName 
     * @param {Integer} cbSchemaName 
     * @param {Pointer<Byte>} szProcName 
     * @param {Integer} cbProcName 
     * @returns {Integer} 
     */
    static SQLProceduresA(hstmt, szCatalogName, cbCatalogName, szSchemaName, cbSchemaName, szProcName, cbProcName) {
        result := DllCall("ODBC32.dll\SQLProceduresA", "ptr", hstmt, "ptr", szCatalogName, "short", cbCatalogName, "ptr", szSchemaName, "short", cbSchemaName, "ptr", szProcName, "short", cbProcName, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hstmt 
     * @param {Pointer<Byte>} szCatalogName 
     * @param {Integer} cbCatalogName 
     * @param {Pointer<Byte>} szSchemaName 
     * @param {Integer} cbSchemaName 
     * @param {Pointer<Byte>} szTableName 
     * @param {Integer} cbTableName 
     * @returns {Integer} 
     */
    static SQLTablePrivilegesA(hstmt, szCatalogName, cbCatalogName, szSchemaName, cbSchemaName, szTableName, cbTableName) {
        result := DllCall("ODBC32.dll\SQLTablePrivilegesA", "ptr", hstmt, "ptr", szCatalogName, "short", cbCatalogName, "ptr", szSchemaName, "short", cbSchemaName, "ptr", szTableName, "short", cbTableName, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} henv 
     * @param {Integer} fDirection 
     * @param {Pointer<Byte>} szDriverDesc 
     * @param {Integer} cbDriverDescMax 
     * @param {Pointer<Int16>} pcbDriverDesc 
     * @param {Pointer<Byte>} szDriverAttributes 
     * @param {Integer} cbDrvrAttrMax 
     * @param {Pointer<Int16>} pcbDrvrAttr 
     * @returns {Integer} 
     */
    static SQLDriversA(henv, fDirection, szDriverDesc, cbDriverDescMax, pcbDriverDesc, szDriverAttributes, cbDrvrAttrMax, pcbDrvrAttr) {
        result := DllCall("ODBC32.dll\SQLDriversA", "ptr", henv, "ushort", fDirection, "ptr", szDriverDesc, "short", cbDriverDescMax, "ptr", pcbDriverDesc, "ptr", szDriverAttributes, "short", cbDrvrAttrMax, "ptr", pcbDrvrAttr, "short")
        return result
    }

;@endregion Methods
}
