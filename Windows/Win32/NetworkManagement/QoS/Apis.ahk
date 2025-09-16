#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class QoS {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static QOS_MAX_OBJECT_STRING_LENGTH => 256

    /**
     * @type {Integer (UInt32)}
     */
    static QOS_TRAFFIC_GENERAL_ID_BASE => 4000

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICETYPE_NOTRAFFIC => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICETYPE_BESTEFFORT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICETYPE_CONTROLLEDLOAD => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICETYPE_GUARANTEED => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICETYPE_NETWORK_UNAVAILABLE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICETYPE_GENERAL_INFORMATION => 5

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICETYPE_NOCHANGE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICETYPE_NONCONFORMING => 9

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICETYPE_NETWORK_CONTROL => 10

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICETYPE_QUALITATIVE => 13

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_BESTEFFORT => 2147549184

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_CONTROLLEDLOAD => 2147614720

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_GUARANTEED => 2147745792

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_QUALITATIVE => 2149580800

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_NO_TRAFFIC_CONTROL => 2164260864

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_NO_QOS_SIGNALING => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static QOS_NOT_SPECIFIED => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static POSITIVE_INFINITY_RATE => 4294967294

    /**
     * @type {Integer (UInt32)}
     */
    static QOS_GENERAL_ID_BASE => 2000

    /**
     * @type {Integer (UInt32)}
     */
    static TC_NONCONF_BORROW => 0

    /**
     * @type {Integer (UInt32)}
     */
    static TC_NONCONF_SHAPE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TC_NONCONF_DISCARD => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TC_NONCONF_BORROW_PLUS => 3

    /**
     * @type {Integer (UInt32)}
     */
    static class_NULL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static class_SESSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static class_SESSION_GROUP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static class_RSVP_HOP => 3

    /**
     * @type {Integer (UInt32)}
     */
    static class_INTEGRITY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static class_TIME_VALUES => 5

    /**
     * @type {Integer (UInt32)}
     */
    static class_ERROR_SPEC => 6

    /**
     * @type {Integer (UInt32)}
     */
    static class_SCOPE => 7

    /**
     * @type {Integer (UInt32)}
     */
    static class_STYLE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static class_FLOWSPEC => 9

    /**
     * @type {Integer (UInt32)}
     */
    static class_IS_FLOWSPEC => 9

    /**
     * @type {Integer (UInt32)}
     */
    static class_FILTER_SPEC => 10

    /**
     * @type {Integer (UInt32)}
     */
    static class_SENDER_TEMPLATE => 11

    /**
     * @type {Integer (UInt32)}
     */
    static class_SENDER_TSPEC => 12

    /**
     * @type {Integer (UInt32)}
     */
    static class_ADSPEC => 13

    /**
     * @type {Integer (UInt32)}
     */
    static class_POLICY_DATA => 14

    /**
     * @type {Integer (UInt32)}
     */
    static class_CONFIRM => 15

    /**
     * @type {Integer (UInt32)}
     */
    static class_MAX => 15

    /**
     * @type {Integer (UInt32)}
     */
    static ctype_SESSION_ipv4 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ctype_SESSION_ipv4GPI => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SESSFLG_E_Police => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ctype_RSVP_HOP_ipv4 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static Opt_Share_mask => 24

    /**
     * @type {Integer (UInt32)}
     */
    static Opt_Distinct => 8

    /**
     * @type {Integer (UInt32)}
     */
    static Opt_Shared => 16

    /**
     * @type {Integer (UInt32)}
     */
    static Opt_SndSel_mask => 7

    /**
     * @type {Integer (UInt32)}
     */
    static Opt_Wildcard => 1

    /**
     * @type {Integer (UInt32)}
     */
    static Opt_Explicit => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ctype_STYLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ctype_FILTER_SPEC_ipv4 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ctype_FILTER_SPEC_ipv4GPI => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ctype_SENDER_TEMPLATE_ipv4 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ctype_SENDER_TEMPLATE_ipv4GPI => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ctype_SCOPE_list_ipv4 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ctype_ERROR_SPEC_ipv4 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SPECF_InPlace => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SPECF_NotGuilty => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ERR_FORWARD_OK => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static ERR_Usage_globl => 0

    /**
     * @type {Integer (UInt32)}
     */
    static ERR_Usage_local => 16

    /**
     * @type {Integer (UInt32)}
     */
    static ERR_Usage_serv => 17

    /**
     * @type {Integer (UInt32)}
     */
    static ERR_global_mask => 4095

    /**
     * @type {Integer (UInt32)}
     */
    static ctype_POLICY_DATA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GENERAL_INFO => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GUARANTEED_SERV => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PREDICTIVE_SERV => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CONTROLLED_DELAY_SERV => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CONTROLLED_LOAD_SERV => 5

    /**
     * @type {Integer (UInt32)}
     */
    static QUALITATIVE_SERV => 6

    /**
     * @type {Integer (UInt32)}
     */
    static INTSERV_VERS_MASK => 240

    /**
     * @type {Integer (UInt32)}
     */
    static INTSERV_VERSION0 => 0

    /**
     * @type {Integer (UInt32)}
     */
    static ISSH_BREAK_BIT => 128

    /**
     * @type {Integer (UInt32)}
     */
    static ISPH_FLG_INV => 128

    /**
     * @type {Integer (UInt32)}
     */
    static ctype_SENDER_TSPEC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ctype_FLOWSPEC_Intserv0 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ctype_ADSPEC_INTSERV => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RSVP_PATH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RSVP_RESV => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RSVP_PATH_ERR => 3

    /**
     * @type {Integer (UInt32)}
     */
    static RSVP_RESV_ERR => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RSVP_PATH_TEAR => 5

    /**
     * @type {Integer (UInt32)}
     */
    static RSVP_RESV_TEAR => 6

    /**
     * @type {Integer (UInt32)}
     */
    static RSVP_Err_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static RSVP_Erv_Nonev => 0

    /**
     * @type {Integer (UInt32)}
     */
    static RSVP_Err_ADMISSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RSVP_Erv_Other => 0

    /**
     * @type {Integer (UInt32)}
     */
    static RSVP_Erv_DelayBnd => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RSVP_Erv_Bandwidth => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RSVP_Erv_MTU => 3

    /**
     * @type {Integer (UInt32)}
     */
    static RSVP_Erv_Flow_Rate => 32769

    /**
     * @type {Integer (UInt32)}
     */
    static RSVP_Erv_Bucket_szie => 32770

    /**
     * @type {Integer (UInt32)}
     */
    static RSVP_Erv_Peak_Rate => 32771

    /**
     * @type {Integer (UInt32)}
     */
    static RSVP_Erv_Min_Policied_size => 32772

    /**
     * @type {Integer (UInt32)}
     */
    static RSVP_Err_POLICY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_ERRV_NO_MORE_INFO => 1

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_ERRV_UNSUPPORTED_CREDENTIAL_TYPE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_ERRV_INSUFFICIENT_PRIVILEGES => 3

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_ERRV_EXPIRED_CREDENTIALS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_ERRV_IDENTITY_CHANGED => 5

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_ERRV_UNKNOWN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_ERRV_GLOBAL_DEF_FLOW_COUNT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_ERRV_GLOBAL_GRP_FLOW_COUNT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_ERRV_GLOBAL_USER_FLOW_COUNT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_ERRV_GLOBAL_UNAUTH_USER_FLOW_COUNT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_ERRV_SUBNET_DEF_FLOW_COUNT => 5

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_ERRV_SUBNET_GRP_FLOW_COUNT => 6

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_ERRV_SUBNET_USER_FLOW_COUNT => 7

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_ERRV_SUBNET_UNAUTH_USER_FLOW_COUNT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_ERRV_GLOBAL_DEF_FLOW_DURATION => 9

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_ERRV_GLOBAL_GRP_FLOW_DURATION => 10

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_ERRV_GLOBAL_USER_FLOW_DURATION => 11

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_ERRV_GLOBAL_UNAUTH_USER_FLOW_DURATION => 12

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_ERRV_SUBNET_DEF_FLOW_DURATION => 13

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_ERRV_SUBNET_GRP_FLOW_DURATION => 14

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_ERRV_SUBNET_USER_FLOW_DURATION => 15

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_ERRV_SUBNET_UNAUTH_USER_FLOW_DURATION => 16

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_ERRV_GLOBAL_DEF_FLOW_RATE => 17

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_ERRV_GLOBAL_GRP_FLOW_RATE => 18

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_ERRV_GLOBAL_USER_FLOW_RATE => 19

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_ERRV_GLOBAL_UNAUTH_USER_FLOW_RATE => 20

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_ERRV_SUBNET_DEF_FLOW_RATE => 21

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_ERRV_SUBNET_GRP_FLOW_RATE => 22

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_ERRV_SUBNET_USER_FLOW_RATE => 23

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_ERRV_SUBNET_UNAUTH_USER_FLOW_RATE => 24

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_ERRV_GLOBAL_DEF_PEAK_RATE => 25

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_ERRV_GLOBAL_GRP_PEAK_RATE => 26

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_ERRV_GLOBAL_USER_PEAK_RATE => 27

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_ERRV_GLOBAL_UNAUTH_USER_PEAK_RATE => 28

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_ERRV_SUBNET_DEF_PEAK_RATE => 29

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_ERRV_SUBNET_GRP_PEAK_RATE => 30

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_ERRV_SUBNET_USER_PEAK_RATE => 31

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_ERRV_SUBNET_UNAUTH_USER_PEAK_RATE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_ERRV_GLOBAL_DEF_SUM_FLOW_RATE => 33

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_ERRV_GLOBAL_GRP_SUM_FLOW_RATE => 34

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_ERRV_GLOBAL_USER_SUM_FLOW_RATE => 35

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_ERRV_GLOBAL_UNAUTH_USER_SUM_FLOW_RATE => 36

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_ERRV_SUBNET_DEF_SUM_FLOW_RATE => 37

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_ERRV_SUBNET_GRP_SUM_FLOW_RATE => 38

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_ERRV_SUBNET_USER_SUM_FLOW_RATE => 39

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_ERRV_SUBNET_UNAUTH_USER_SUM_FLOW_RATE => 40

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_ERRV_GLOBAL_DEF_SUM_PEAK_RATE => 41

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_ERRV_GLOBAL_GRP_SUM_PEAK_RATE => 42

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_ERRV_GLOBAL_USER_SUM_PEAK_RATE => 43

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_ERRV_GLOBAL_UNAUTH_USER_SUM_PEAK_RATE => 44

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_ERRV_SUBNET_DEF_SUM_PEAK_RATE => 45

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_ERRV_SUBNET_GRP_SUM_PEAK_RATE => 46

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_ERRV_SUBNET_USER_SUM_PEAK_RATE => 47

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_ERRV_SUBNET_UNAUTH_USER_SUM_PEAK_RATE => 48

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_ERRV_UNKNOWN_USER => 49

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_ERRV_NO_PRIVILEGES => 50

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_ERRV_EXPIRED_USER_TOKEN => 51

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_ERRV_NO_RESOURCES => 52

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_ERRV_PRE_EMPTED => 53

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_ERRV_USER_CHANGED => 54

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_ERRV_NO_ACCEPTS => 55

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_ERRV_NO_MEMORY => 56

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_ERRV_CRAZY_FLOWSPEC => 57

    /**
     * @type {Integer (UInt32)}
     */
    static RSVP_Err_NO_PATH => 3

    /**
     * @type {Integer (UInt32)}
     */
    static RSVP_Err_NO_SENDER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RSVP_Err_BAD_STYLE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static RSVP_Err_UNKNOWN_STYLE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static RSVP_Err_BAD_DSTPORT => 7

    /**
     * @type {Integer (UInt32)}
     */
    static RSVP_Err_BAD_SNDPORT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static RSVP_Err_AMBIG_FILTER => 9

    /**
     * @type {Integer (UInt32)}
     */
    static RSVP_Err_PREEMPTED => 12

    /**
     * @type {Integer (UInt32)}
     */
    static RSVP_Err_UNKN_OBJ_CLASS => 13

    /**
     * @type {Integer (UInt32)}
     */
    static RSVP_Err_UNKNOWN_CTYPE => 14

    /**
     * @type {Integer (UInt32)}
     */
    static RSVP_Err_API_ERROR => 20

    /**
     * @type {Integer (UInt32)}
     */
    static RSVP_Err_TC_ERROR => 21

    /**
     * @type {Integer (UInt32)}
     */
    static RSVP_Erv_Conflict_Serv => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RSVP_Erv_No_Serv => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RSVP_Erv_Crazy_Flowspec => 3

    /**
     * @type {Integer (UInt32)}
     */
    static RSVP_Erv_Crazy_Tspec => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RSVP_Err_TC_SYS_ERROR => 22

    /**
     * @type {Integer (UInt32)}
     */
    static RSVP_Err_RSVP_SYS_ERROR => 23

    /**
     * @type {Integer (UInt32)}
     */
    static RSVP_Erv_MEMORY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RSVP_Erv_API => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LPM_PE_USER_IDENTITY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LPM_PE_APP_IDENTITY => 3

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_MORE_INFO => 1

    /**
     * @type {Integer (UInt32)}
     */
    static UNSUPPORTED_CREDENTIAL_TYPE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static INSUFFICIENT_PRIVILEGES => 3

    /**
     * @type {Integer (UInt32)}
     */
    static EXPIRED_CREDENTIAL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IDENTITY_CHANGED => 5

    /**
     * @type {Integer (UInt32)}
     */
    static LPM_OK => 0

    /**
     * @type {Integer (UInt32)}
     */
    static INV_LPM_HANDLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LPM_TIME_OUT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static INV_REQ_HANDLE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DUP_RESULTS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static INV_RESULTS => 5

    /**
     * @type {Integer (UInt32)}
     */
    static LPM_PE_ALL_TYPES => 0

    /**
     * @type {Integer (UInt32)}
     */
    static LPM_API_VERSION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PCM_VERSION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LPV_RESERVED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static LPV_MIN_PRIORITY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LPV_MAX_PRIORITY => 65280

    /**
     * @type {Integer (UInt32)}
     */
    static LPV_DROP_MSG => 65533

    /**
     * @type {Integer (UInt32)}
     */
    static LPV_DONT_CARE => 65534

    /**
     * @type {Integer (UInt32)}
     */
    static LPV_REJECT => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static FORCE_IMMEDIATE_REFRESH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LPM_RESULT_READY => 0

    /**
     * @type {Integer (UInt32)}
     */
    static LPM_RESULT_DEFER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RCVD_PATH_TEAR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RCVD_RESV_TEAR => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ADM_CTRL_FAILED => 3

    /**
     * @type {Integer (UInt32)}
     */
    static STATE_TIMEOUT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FLOW_DURATION => 5

    /**
     * @type {Integer (UInt32)}
     */
    static RESOURCES_ALLOCATED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RESOURCES_MODIFIED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CURRENT_TCI_VERSION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TC_NOTIFY_IFC_UP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TC_NOTIFY_IFC_CLOSE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TC_NOTIFY_IFC_CHANGE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static TC_NOTIFY_PARAM_CHANGED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TC_NOTIFY_FLOW_CLOSE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_STRING_LENGTH => 256

    /**
     * @type {Integer (UInt32)}
     */
    static QOS_OUTGOING_DEFAULT_MINIMUM_BANDWIDTH => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static QOS_QUERYFLOW_FRESH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static QOS_NON_ADAPTIVE_FLOW => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RSVP_OBJECT_ID_BASE => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static RSVP_DEFAULT_STYLE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static RSVP_WILDCARD_STYLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RSVP_FIXED_FILTER_STYLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RSVP_SHARED_EXPLICIT_STYLE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static AD_FLAG_BREAK_BIT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static mIOC_IN => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static mIOC_OUT => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static mIOC_VENDOR => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static mCOMPANY => 402653184

    /**
     * @type {Integer (UInt32)}
     */
    static ioctl_code => 1

    /**
     * @type {Integer (UInt32)}
     */
    static QOSSPBASE => 50000

    /**
     * @type {Integer (UInt32)}
     */
    static ALLOWED_TO_SEND_DATA => 50001

    /**
     * @type {Integer (UInt32)}
     */
    static ABLE_TO_RECV_RSVP => 50002

    /**
     * @type {Integer (UInt32)}
     */
    static LINE_RATE => 50003

    /**
     * @type {Integer (UInt32)}
     */
    static LOCAL_TRAFFIC_CONTROL => 50004

    /**
     * @type {Integer (UInt32)}
     */
    static LOCAL_QOSABILITY => 50005

    /**
     * @type {Integer (UInt32)}
     */
    static END_TO_END_QOSABILITY => 50006

    /**
     * @type {Integer (UInt32)}
     */
    static INFO_NOT_AVAILABLE => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static ANY_DEST_ADDR => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static MODERATELY_DELAY_SENSITIVE => 4294967293

    /**
     * @type {Integer (UInt32)}
     */
    static HIGHLY_DELAY_SENSITIVE => 4294967294

    /**
     * @type {Integer (UInt32)}
     */
    static QOSSP_ERR_BASE => 56000

    /**
     * @type {Integer (UInt32)}
     */
    static GQOS_NO_ERRORCODE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static GQOS_NO_ERRORVALUE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static GQOS_ERRORCODE_UNKNOWN => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static GQOS_ERRORVALUE_UNKNOWN => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static GQOS_NET_ADMISSION => 56100

    /**
     * @type {Integer (UInt32)}
     */
    static GQOS_NET_POLICY => 56200

    /**
     * @type {Integer (UInt32)}
     */
    static GQOS_RSVP => 56300

    /**
     * @type {Integer (UInt32)}
     */
    static GQOS_API => 56400

    /**
     * @type {Integer (UInt32)}
     */
    static GQOS_KERNEL_TC_SYS => 56500

    /**
     * @type {Integer (UInt32)}
     */
    static GQOS_RSVP_SYS => 56600

    /**
     * @type {Integer (UInt32)}
     */
    static GQOS_KERNEL_TC => 56700

    /**
     * @type {Integer (UInt32)}
     */
    static PE_TYPE_APPID => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PE_ATTRIB_TYPE_POLICY_LOCATOR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_LOCATOR_SUB_TYPE_ASCII_DN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_LOCATOR_SUB_TYPE_UNICODE_DN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_LOCATOR_SUB_TYPE_ASCII_DN_ENC => 3

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_LOCATOR_SUB_TYPE_UNICODE_DN_ENC => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PE_ATTRIB_TYPE_CREDENTIAL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CREDENTIAL_SUB_TYPE_ASCII_ID => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CREDENTIAL_SUB_TYPE_UNICODE_ID => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CREDENTIAL_SUB_TYPE_KERBEROS_TKT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CREDENTIAL_SUB_TYPE_X509_V3_CERT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CREDENTIAL_SUB_TYPE_PGP_CERT => 5

    /**
     * @type {Integer (UInt32)}
     */
    static TCBASE => 7500

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INCOMPATIBLE_TCI_VERSION => 7501

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_SERVICE_TYPE => 7502

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_TOKEN_RATE => 7503

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_PEAK_RATE => 7504

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_SD_MODE => 7505

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_QOS_PRIORITY => 7506

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_TRAFFIC_CLASS => 7507

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_ADDRESS_TYPE => 7508

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DUPLICATE_FILTER => 7509

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_FILTER_CONFLICT => 7510

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ADDRESS_TYPE_NOT_SUPPORTED => 7511

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TC_SUPPORTED_OBJECTS_EXIST => 7512

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INCOMPATABLE_QOS => 7513

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TC_NOT_SUPPORTED => 7514

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TC_OBJECT_LENGTH_INVALID => 7515

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_FLOW_MODE => 7516

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_DIFFSERV_FLOW => 7517

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_MAPPING_EXISTS => 7518

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_SHAPE_RATE => 7519

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_DS_CLASS => 7520

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TOO_MANY_CLIENTS => 7521

    /**
     * @type {String}
     */
    static GUID_QOS_REMAINING_BANDWIDTH => "{c4c51720-40ec-11d1-2c91-00aa00574915}"

    /**
     * @type {String}
     */
    static GUID_QOS_BESTEFFORT_BANDWIDTH => "{ed885290-40ec-11d1-2c91-00aa00574915}"

    /**
     * @type {String}
     */
    static GUID_QOS_LATENCY => "{fc408ef0-40ec-11d1-2c91-00aa00574915}"

    /**
     * @type {String}
     */
    static GUID_QOS_FLOW_COUNT => "{1147f880-40ed-11d1-2c91-00aa00574915}"

    /**
     * @type {String}
     */
    static GUID_QOS_NON_BESTEFFORT_LIMIT => "{185c44e0-40ed-11d1-2c91-00aa00574915}"

    /**
     * @type {String}
     */
    static GUID_QOS_MAX_OUTSTANDING_SENDS => "{161ffa86-6120-11d1-2c91-00aa00574915}"

    /**
     * @type {String}
     */
    static GUID_QOS_STATISTICS_BUFFER => "{bb2c0980-e900-11d1-b07e-0080c71382bf}"

    /**
     * @type {String}
     */
    static GUID_QOS_FLOW_MODE => "{5c82290a-515a-11d2-8e58-00c04fc9bfcb}"

    /**
     * @type {String}
     */
    static GUID_QOS_ISSLOW_FLOW => "{abf273a4-ee07-11d2-be1b-00a0c99ee63b}"

    /**
     * @type {String}
     */
    static GUID_QOS_TIMER_RESOLUTION => "{ba10cc88-f13e-11d2-be1b-00a0c99ee63b}"

    /**
     * @type {String}
     */
    static GUID_QOS_FLOW_IP_CONFORMING => "{07f99a8b-fcd2-11d2-be1e-00a0c99ee63b}"

    /**
     * @type {String}
     */
    static GUID_QOS_FLOW_IP_NONCONFORMING => "{087a5987-fcd2-11d2-be1e-00a0c99ee63b}"

    /**
     * @type {String}
     */
    static GUID_QOS_FLOW_8021P_CONFORMING => "{08c1e013-fcd2-11d2-be1e-00a0c99ee63b}"

    /**
     * @type {String}
     */
    static GUID_QOS_FLOW_8021P_NONCONFORMING => "{09023f91-fcd2-11d2-be1e-00a0c99ee63b}"

    /**
     * @type {String}
     */
    static GUID_QOS_ENABLE_AVG_STATS => "{bafb6d11-27c4-4801-a46f-ef8080c188c8}"

    /**
     * @type {String}
     */
    static GUID_QOS_ENABLE_WINDOW_ADJUSTMENT => "{aa966725-d3e9-4c55-b335-2a00279a1e64}"

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_TCP_BASE => 18

    /**
     * @type {String}
     */
    static DD_TCP_DEVICE_NAME => "\Device\Tcp"

    /**
     * @type {Integer (UInt32)}
     */
    static IF_MIB_STATS_ID => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IP_MIB_STATS_ID => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IP_MIB_ADDRTABLE_ENTRY_ID => 258

    /**
     * @type {Integer (UInt32)}
     */
    static IP_INTFC_INFO_ID => 259

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_PHYSADDR_SIZE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_PREBOOT_CERT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_POST_CODE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_UNUSED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_NO_ACTION => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_SEPARATOR => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_ACTION => 5

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_EVENT_TAG => 6

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_S_CRTM_CONTENTS => 7

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_S_CRTM_VERSION => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_CPU_MICROCODE => 9

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_PLATFORM_CONFIG_FLAGS => 10

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_TABLE_OF_DEVICES => 11

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_COMPACT_HASH => 12

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_IPL => 13

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_IPL_PARTITION_DATA => 14

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_NONHOST_CODE => 15

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_NONHOST_CONFIG => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_NONHOST_INFO => 17

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_OMIT_BOOT_DEVICE_EVENTS => 18

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_EFI_EVENT_BASE => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_EFI_VARIABLE_DRIVER_CONFIG => 2147483649

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_EFI_VARIABLE_BOOT => 2147483650

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_EFI_BOOT_SERVICES_APPLICATION => 2147483651

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_EFI_BOOT_SERVICES_DRIVER => 2147483652

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_EFI_RUNTIME_SERVICES_DRIVER => 2147483653

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_EFI_GPT_EVENT => 2147483654

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_EFI_ACTION => 2147483655

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_EFI_PLATFORM_FIRMWARE_BLOB => 2147483656

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_EFI_HANDOFF_TABLES => 2147483657

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_EFI_PLATFORM_FIRMWARE_BLOB2 => 2147483658

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_EFI_HANDOFF_TABLES2 => 2147483659

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_EFI_VARIABLE_BOOT2 => 2147483660

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_EFI_HCRTM_EVENT => 2147483664

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_EFI_VARIABLE_AUTHORITY => 2147483872

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_EFI_SPDM_FIRMWARE_BLOB => 2147483873

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_EFI_SPDM_FIRMWARE_CONFIG => 2147483874

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_TXT_EVENT_BASE => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_TXT_PCR_MAPPING => 1025

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_TXT_HASH_START => 1026

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_TXT_COMBINED_HASH => 1027

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_TXT_MLE_HASH => 1028

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_TXT_BIOSAC_REG_DATA => 1034

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_TXT_CPU_SCRTM_STAT => 1035

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_TXT_LCP_CONTROL_HASH => 1036

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_TXT_ELEMENTS_HASH => 1037

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_TXT_STM_HASH => 1038

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_TXT_OSSINITDATA_CAP_HASH => 1039

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_TXT_SINIT_PUBKEY_HASH => 1040

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_TXT_LCP_HASH => 1041

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_TXT_LCP_DETAILS_HASH => 1042

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_TXT_LCP_AUTHORITIES_HASH => 1043

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_TXT_NV_INFO_HASH => 1044

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_TXT_COLD_BOOT_BIOS_HASH => 1045

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_TXT_KM_HASH => 1046

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_TXT_BPM_HASH => 1047

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_TXT_KM_INFO_HASH => 1048

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_TXT_BPM_INFO_HASH => 1049

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_TXT_BOOT_POL_HASH => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_TXT_RANDOM_VALUE => 1278

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_TXT_CAP_VALUE => 1279

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_SL_EVENT_BASE => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_SL_LOAD => 32769

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_SL_PSP_FW_SPLT => 32770

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_SL_TSME_RB_FUSE => 32771

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_SL_PUB_KEY => 32772

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_SL_SVN => 32773

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_SL_LOAD_1 => 32774

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_SL_SEPARATOR => 32775

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENTTYPE_NONMEASURED => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENTTYPE_AGGREGATION => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENTTYPE_CONTAINER => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENTTYPE_INFORMATION => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENTTYPE_ERROR => 196608

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENTTYPE_PREOSPARAMETER => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENTTYPE_OSPARAMETER => 327680

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENTTYPE_AUTHORITY => 393216

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENTTYPE_LOADEDMODULE => 458752

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENTTYPE_TRUSTPOINT => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENTTYPE_ELAM => 589824

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENTTYPE_VBS => 655360

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENTTYPE_KSR => 720896

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENTTYPE_DRTM => 786432

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAERROR_FIRMWAREFAILURE => 196609

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAERROR_INTERNALFAILURE => 196611

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_INFORMATION => 131073

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_BOOTCOUNTER => 131074

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_TRANSFER_CONTROL => 131075

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_APPLICATION_RETURN => 131076

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_BITLOCKER_UNLOCK => 131077

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_EVENTCOUNTER => 131078

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_COUNTERID => 131079

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_MORBIT_NOT_CANCELABLE => 131080

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_APPLICATION_SVN => 131081

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_SVN_CHAIN_STATUS => 131082

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_MORBIT_API_STATUS => 131083

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_BOOTDEBUGGING => 262145

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_BOOT_REVOCATION_LIST => 262146

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_OSKERNELDEBUG => 327681

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_CODEINTEGRITY => 327682

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_TESTSIGNING => 327683

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_DATAEXECUTIONPREVENTION => 327684

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_SAFEMODE => 327685

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_WINPE => 327686

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_PHYSICALADDRESSEXTENSION => 327687

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_OSDEVICE => 327688

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_SYSTEMROOT => 327689

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_HYPERVISOR_LAUNCH_TYPE => 327690

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_HYPERVISOR_PATH => 327691

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_HYPERVISOR_IOMMU_POLICY => 327692

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_HYPERVISOR_DEBUG => 327693

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_DRIVER_LOAD_POLICY => 327694

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_SI_POLICY => 327695

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_HYPERVISOR_MMIO_NX_POLICY => 327696

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_HYPERVISOR_MSR_FILTER_POLICY => 327697

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_VSM_LAUNCH_TYPE => 327698

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_OS_REVOCATION_LIST => 327699

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_SMT_STATUS => 327700

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_VSM_IDK_INFO => 327712

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_FLIGHTSIGNING => 327713

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_PAGEFILE_ENCRYPTION_ENABLED => 327714

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_VSM_IDKS_INFO => 327715

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_HIBERNATION_DISABLED => 327716

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_DUMPS_DISABLED => 327717

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_DUMP_ENCRYPTION_ENABLED => 327718

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_DUMP_ENCRYPTION_KEY_DIGEST => 327719

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_LSAISO_CONFIG => 327720

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_SBCP_INFO => 327721

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_HYPERVISOR_BOOT_DMA_PROTECTION => 327728

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_NOAUTHORITY => 393217

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_AUTHORITYPUBKEY => 393218

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_FILEPATH => 458753

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_IMAGESIZE => 458754

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_HASHALGORITHMID => 458755

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_AUTHENTICODEHASH => 458756

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_AUTHORITYISSUER => 458757

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_AUTHORITYSERIAL => 458758

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_IMAGEBASE => 458759

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_AUTHORITYPUBLISHER => 458760

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_AUTHORITYSHA1THUMBPRINT => 458761

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_IMAGEVALIDATED => 458762

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_MODULE_SVN => 458763

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_MODULE_HSP => 458764

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_ELAM_KEYNAME => 589825

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_ELAM_CONFIGURATION => 589826

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_ELAM_POLICY => 589827

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_ELAM_MEASURED => 589828

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_VBS_VSM_REQUIRED => 655361

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_VBS_SECUREBOOT_REQUIRED => 655362

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_VBS_IOMMU_REQUIRED => 655363

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_VBS_MMIO_NX_REQUIRED => 655364

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_VBS_MSR_FILTERING_REQUIRED => 655365

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_VBS_MANDATORY_ENFORCEMENT => 655366

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_VBS_HVCI_POLICY => 655367

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_VBS_MICROSOFT_BOOT_CHAIN_REQUIRED => 655368

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_VBS_DUMP_USES_AMEROOT => 655369

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_VBS_VSM_NOSECRETS_ENFORCED => 655370

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_KSR_SIGNATURE => 720897

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_DRTM_STATE_AUTH => 786433

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_DRTM_SMM_LEVEL => 786434

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_DRTM_AMD_SMM_HASH => 786435

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_DRTM_AMD_SMM_SIGNER_KEY => 786436

    /**
     * @type {Integer (UInt32)}
     */
    static FVEB_UNLOCK_FLAG_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static FVEB_UNLOCK_FLAG_CACHED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FVEB_UNLOCK_FLAG_MEDIA => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FVEB_UNLOCK_FLAG_TPM => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FVEB_UNLOCK_FLAG_PIN => 16

    /**
     * @type {Integer (UInt32)}
     */
    static FVEB_UNLOCK_FLAG_EXTERNAL => 32

    /**
     * @type {Integer (UInt32)}
     */
    static FVEB_UNLOCK_FLAG_RECOVERY => 64

    /**
     * @type {Integer (UInt32)}
     */
    static FVEB_UNLOCK_FLAG_PASSPHRASE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static FVEB_UNLOCK_FLAG_NBP => 256

    /**
     * @type {Integer (UInt32)}
     */
    static FVEB_UNLOCK_FLAG_AUK_OSFVEINFO => 512

    /**
     * @type {Integer (UInt32)}
     */
    static OSDEVICE_TYPE_UNKNOWN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static OSDEVICE_TYPE_BLOCKIO_HARDDISK => 65537

    /**
     * @type {Integer (UInt32)}
     */
    static OSDEVICE_TYPE_BLOCKIO_REMOVABLEDISK => 65538

    /**
     * @type {Integer (UInt32)}
     */
    static OSDEVICE_TYPE_BLOCKIO_CDROM => 65539

    /**
     * @type {Integer (UInt32)}
     */
    static OSDEVICE_TYPE_BLOCKIO_PARTITION => 65540

    /**
     * @type {Integer (UInt32)}
     */
    static OSDEVICE_TYPE_BLOCKIO_FILE => 65541

    /**
     * @type {Integer (UInt32)}
     */
    static OSDEVICE_TYPE_BLOCKIO_RAMDISK => 65542

    /**
     * @type {Integer (UInt32)}
     */
    static OSDEVICE_TYPE_BLOCKIO_VIRTUALHARDDISK => 65543

    /**
     * @type {Integer (UInt32)}
     */
    static OSDEVICE_TYPE_SERIAL => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static OSDEVICE_TYPE_UDP => 196608

    /**
     * @type {Integer (UInt32)}
     */
    static OSDEVICE_TYPE_VMBUS => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static OSDEVICE_TYPE_COMPOSITE => 327680

    /**
     * @type {Integer (UInt32)}
     */
    static OSDEVICE_TYPE_CIMFS => 393216

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAHDRSIGNATURE => 1279476311

    /**
     * @type {Integer (UInt32)}
     */
    static SIPALOGVERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAKSRHDRSIGNATURE => 1297240907

    /**
     * @type {Integer (UInt32)}
     */
    static WBCL_DIGEST_ALG_ID_SHA_1 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WBCL_DIGEST_ALG_ID_SHA_2_256 => 11

    /**
     * @type {Integer (UInt32)}
     */
    static WBCL_DIGEST_ALG_ID_SHA_2_384 => 12

    /**
     * @type {Integer (UInt32)}
     */
    static WBCL_DIGEST_ALG_ID_SHA_2_512 => 13

    /**
     * @type {Integer (UInt32)}
     */
    static WBCL_DIGEST_ALG_ID_SM3_256 => 18

    /**
     * @type {Integer (UInt32)}
     */
    static WBCL_DIGEST_ALG_ID_SHA3_256 => 39

    /**
     * @type {Integer (UInt32)}
     */
    static WBCL_DIGEST_ALG_ID_SHA3_384 => 40

    /**
     * @type {Integer (UInt32)}
     */
    static WBCL_DIGEST_ALG_ID_SHA3_512 => 41

    /**
     * @type {Integer (UInt32)}
     */
    static WBCL_DIGEST_ALG_BITMAP_SHA_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WBCL_DIGEST_ALG_BITMAP_SHA_2_256 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WBCL_DIGEST_ALG_BITMAP_SHA_2_384 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WBCL_DIGEST_ALG_BITMAP_SHA_2_512 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WBCL_DIGEST_ALG_BITMAP_SM3_256 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static WBCL_DIGEST_ALG_BITMAP_SHA3_256 => 32

    /**
     * @type {Integer (UInt32)}
     */
    static WBCL_DIGEST_ALG_BITMAP_SHA3_384 => 64

    /**
     * @type {Integer (UInt32)}
     */
    static WBCL_DIGEST_ALG_BITMAP_SHA3_512 => 128

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_HSP_UPGRADE_FILENAME_LENGTH => 64

    /**
     * @type {Integer (UInt32)}
     */
    static WBCL_MAX_HSP_UPGRADE_HASH_LEN => 64

    /**
     * @type {Integer (UInt32)}
     */
    static WBCL_HASH_LEN_SHA1 => 20

    /**
     * @type {Integer (Int32)}
     */
    static IS_GUAR_RSPEC => 130

    /**
     * @type {Integer (Int32)}
     */
    static GUAR_ADSPARM_C => 131

    /**
     * @type {Integer (Int32)}
     */
    static GUAR_ADSPARM_D => 132

    /**
     * @type {Integer (Int32)}
     */
    static GUAR_ADSPARM_Ctot => 133

    /**
     * @type {Integer (Int32)}
     */
    static GUAR_ADSPARM_Dtot => 134

    /**
     * @type {Integer (Int32)}
     */
    static GUAR_ADSPARM_Csum => 135

    /**
     * @type {Integer (Int32)}
     */
    static GUAR_ADSPARM_Dsum => 136
;@endregion Constants

;@region Methods
    /**
     * This function initializes the QOS subsystem and the QOSHandle parameter. The QOSHandle parameter is used when calling other QOS functions. QOSCreateHandle must be called before any other functions.
     * @remarks
     * Every process intending to use qWAVE must first call <b>QOSCreateHandle</b>. The handle returned can be used for performing overlapped I/O. For example, this handle can be associated with an I/O completion port (IOCP) to receive overlapped completion notifications. This function can be  called multiple times to obtain multiple handles although a single handle is sufficient for most applications.
     * 
     * If a machine enters a power save mode that interrupts connectivity such as sleep or standby, existing and active network experiments such as <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos2/nf-qos2-qosstarttrackingclient">QOSStartTrackingClient</a> must be reinitiated.  This recreation of the flow mirrors the cleanup and creation activities also necessary for existing sockets. A new handle must be created, and the flow must be recreated and readmitted.
     * @param {Pointer<QOS_VERSION>} Version Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/qos2/ns-qos2-qos_version">QOS_VERSION</a> structure that indicates the version of QOS being used.  The <b>MajorVersion</b> member must be set to 1, and the <b>MinorVersion</b> member must be set to 0.
     * @param {Pointer<HANDLE>} QOSHandle Pointer to a variable that receives a QOS handle.  This handle is used when calling other QOS functions.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is 0.  To get extended error information, call <b>GetLastError</b>.  Some possible error codes follow.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_GEN_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Internal logic error.  Initialization failed.  For example, if the host goes into sleep or standby mode, all existing handles and flows are rendered invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>QOSHandle</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that a memory allocation failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SYSTEM_RESOURCES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are insufficient resources to carry out the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_RESOURCE_DISABLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A resource required by the service is unavailable.  This error may be returned if the user has not enabled the firewall exception for the qWAVE service.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SERVICE_DEPENDENCY_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the dependencies of this service is unavailable.  The qWAVE service could not be started.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/qos2/nf-qos2-qoscreatehandle
     * @since windows6.0.6000
     */
    static QOSCreateHandle(Version, QOSHandle) {
        result := DllCall("qwave.dll\QOSCreateHandle", "ptr", Version, "ptr", QOSHandle, "int")
        return result
    }

    /**
     * The QOSCloseHandle function closes a handle returned by the QOSCreateHandle function.
     * @remarks
     * All flows added on the handle being closed are immediately removed from the system.  Any traffic going out of a socket used to create these flows will no longer be marked with priority values.  Any pending operations on these flows are immediately completed with <b>ERROR_ABORTED</b>.
     * 
     * If any clients were being tracked through the handle being closed by a previous call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos2/nf-qos2-qosstarttrackingclient">QOSStartTrackingClient</a> function, <b>QOSCloseHandle</b> indicates that the application is no longer using the client endpoint.
     * @param {Pointer<HANDLE>} QOSHandle Handle to the QOS subsystem returned by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos2/nf-qos2-qoscreatehandle">QOSCreateHandle</a>.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is 0.  To get extended error information, call <b>GetLastError</b>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>QOSHandle</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/qos2/nf-qos2-qosclosehandle
     * @since windows6.0.6000
     */
    static QOSCloseHandle(QOSHandle) {
        result := DllCall("qwave.dll\QOSCloseHandle", "ptr", QOSHandle, "int")
        return result
    }

    /**
     * The QOSStartTrackingClient function notifies the QOS subsystem of the existence of a new client.
     * @remarks
     * On receipt of a <b>QOSStartTrackingClient</b> call the QoS subsystem begins gathering information about the client such as the QoS capabilities and available bandwidth on the end-to-end path.
     * 
     * An application should call this function as soon as it becomes aware of a client device that may need QoS flow.  For example this function should be called when a media player device first connects to a media server application.
     * 
     * Network experiments performed by <b>QOSStartTrackingClient</b> do not introduce noteworthy load on the network even if no stream is started for a long period of time.  The qWAVE service dynamically adjusts experiment traffic based on QoS subsystem activity.
     * 
     * Link Layer Topology Discovery (LLTD) must be implemented on the sink PC or device for this function to work.
     * @param {Pointer<HANDLE>} QOSHandle Handle to the QOS subsystem returned by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos2/nf-qos2-qoscreatehandle">QOSCreateHandle</a>.
     * @param {Pointer<SOCKADDR>} DestAddr A pointer to a <a href="https://docs.microsoft.com/windows/desktop/WinSock/sockaddr-2">sockaddr</a> structure that contains the IP address of the client device.  Clients are identified by their IP address and address family.  Any port number specified in the sockaddr structure will be ignored.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is 0.  To get extended error information, call <b>GetLastError</b>.  Some possible error codes follow.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>QOSHandle</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>DestAddr</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that a memory allocation failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SYSTEM_RESOURCES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are insufficient resources to carry out the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_IO_DEVICE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The request could not be performed because of an I/O device error.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DEVICE_REINITIALIZATION_NEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The indicated device requires reinitialization due to hardware errors. The application should clean up and call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos2/nf-qos2-qoscreatehandle">QOSCreateHandle</a> again.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The request is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ADAP_HDW_ERR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A network adapter hardware error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_HOST_UNREACHABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network location cannot be reached.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/qos2/nf-qos2-qosstarttrackingclient
     * @since windows6.0.6000
     */
    static QOSStartTrackingClient(QOSHandle, DestAddr) {
        static Flags := 0 ;Reserved parameters must always be NULL

        result := DllCall("qwave.dll\QOSStartTrackingClient", "ptr", QOSHandle, "ptr", DestAddr, "uint", Flags, "int")
        return result
    }

    /**
     * The QOSStopTrackingClient function notifies the QoS subsystem to stop tracking a client that has previously used the QOSStartTrackingClient function. If a flow is currently in progress, this function will not affect it.
     * @remarks
     * The Winsock2.h header file must be included to use Winsock defined identifiers or functions.
     * @param {Pointer<HANDLE>} QOSHandle Handle to the QOS subsystem returned by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos2/nf-qos2-qoscreatehandle">QOSCreateHandle</a>.
     * @param {Pointer<SOCKADDR>} DestAddr Pointer to a <a href="https://docs.microsoft.com/windows/desktop/WinSock/sockaddr-2">sockaddr</a> structure that contains the IP address of the client device.  Clients are identified by their IP address and address family.  A port number is not required and will be ignored.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is 0.  To get extended error information, call <b>GetLastError</b>.  Some possible error codes follow.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>QOSHandle</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>DestAddr</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that a memory allocation failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SYSTEM_RESOURCES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are insufficient resources to carry out the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_IO_DEVICE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The request could not be performed because of an I/O device error.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DEVICE_REINITIALIZATION_NEEDER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The indicated device requires reinitialization due to hardware errors. The application should clean up and call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos2/nf-qos2-qoscreatehandle">QOSCreateHandle</a> again.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ADAP_HDW_ERR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A network adapter hardware error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/qos2/nf-qos2-qosstoptrackingclient
     * @since windows6.0.6000
     */
    static QOSStopTrackingClient(QOSHandle, DestAddr) {
        static Flags := 0 ;Reserved parameters must always be NULL

        result := DllCall("qwave.dll\QOSStopTrackingClient", "ptr", QOSHandle, "ptr", DestAddr, "uint", Flags, "int")
        return result
    }

    /**
     * Enumerates all existing flows.
     * @remarks
     * Successfully calling this function requires administrative privileges
     * 
     * Calling the <b>QOSEnumerateFlows</b> function retrieves a list of <b>QOS_FlowId</b>s currently active on the QOS subsystem.   These <b>QOS_FlowId</b>s could then be used to call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos2/nf-qos2-qosqueryflow">QOSQueryFlow</a> function in order to gain more information on individual flows.
     * 
     * This function has call-twice semantics. First call to get the <i>Buffer</i> size, then call again (with an appropriately sized <i>Buffer</i> if the first call failed with <b>ERROR_INSUFFICIENT_BUFFER</b>) to retrieve the list of flows.  The second call may fail again with <b>ERROR_INSUFFICIENT_BUFFER</b> if new flows ere added since the first call.
     * 
     * Flows from another process cannot be modified.
     * @param {Pointer<HANDLE>} QOSHandle Handle to the QOS subsystem returned by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos2/nf-qos2-qoscreatehandle">QOSCreateHandle</a>.
     * @param {Pointer<UInt32>} Size Indicates the size of the <i>Buffer</i> parameter, in bytes.
     * 
     * On function return, if successful, this parameter will specify the number of bytes copied into <i>Buffer</i>.
     * 
     * If this call fails with <b>ERROR_INSUFFICIENT_BUFFER</b>, this parameter will indicate the minimum required <i>Buffer</i> size in order to successfully complete this operation.
     * @param {Pointer<Void>} Buffer Pointer to an array of <b>QOS_FlowId</b> flow identifiers. A <b>QOS_FlowId</b> is an unsigned 32-bit integer.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is 0.  To get extended error information, call <b>GetLastError</b>.  Some possible error codes follow.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>QOSHandle</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Buffer is too small.  On output, <i>Size</i> will contain the minimum required buffer size. This function should then be called again with a buffer of the indicated size.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>DestAddr</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that a memory allocation failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SYSTEM_RESOURCES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are insufficient resources to carry out the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_IO_DEVICE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The request could not be performed because of an I/O device error.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DEVICE_REINITIALIZATION_NEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The indicated device requires reinitialization due to hardware errors. The application should clean up and call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos2/nf-qos2-qoscreatehandle">QOSCreateHandle</a> again.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/qos2/nf-qos2-qosenumerateflows
     * @since windows6.0.6000
     */
    static QOSEnumerateFlows(QOSHandle, Size, Buffer) {
        result := DllCall("qwave.dll\QOSEnumerateFlows", "ptr", QOSHandle, "ptr", Size, "ptr", Buffer, "int")
        return result
    }

    /**
     * Adds a new flow for traffic.
     * @remarks
     * The use of IPv4/v6 mixed addresses is not supported in qWAVE. The address specified by the <i>DestAddr</i> parameter must be either IPv4 or IPv6.
     * 
     * If there is a requirement for network experiments over a specific network interface, the socket must be bound to that particular interface. Otherwise the most appropriate interface for the experiment, as indicated by the network stack, is assigned by the qWAVE subsystem.
     * 
     * Network traffic associated with this flow is not affected by making this call alone.  For example, packet prioritization does not occur immediately.
     * 
     * There are two categories of applications that use this function:  adaptive and non-adaptive.  An adaptive application makes use of notifications and information in the <a href="https://docs.microsoft.com/windows/desktop/api/qos2/ns-qos2-qos_flow_fundamentals">QOS_FLOW_FUNDAMENTALS</a> structure for adapting to network changes such as congestion.  The qWAVE service uses Link Layer Topology Discovery (LLTD) QoS extensions for adaptive flows which can be present on the destination device.
     * 
     * After calling this function adaptive A/V applications should call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos2/nf-qos2-qossetflow">QOSSetFlow</a> function with an <i>Operation</i> value of <b>QOSSetFlowRate</b> to affect network traffic.
     * 
     * A non-adaptive application either does not adapt to changing network characteristics or is sending traffic to an endpoint that does not support adaptive capabilities as indicated by ERROR_NOT_SUPPORTED.
     * 
     * Non-adaptive applications, or adaptive applications making non-adaptive flows, should call this function with the <b>QOS_NON_ADAPTIVE_FLOW</b> flag.  After calling this function A/V applications should call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos2/nf-qos2-qossetflow">QOSSetFlow</a> function with a <i>Operation</i>. <b>QOSSetFlow</b> does not need to be called unless shaping is desired.
     * @param {Pointer<HANDLE>} QOSHandle Handle to the QOS subsystem returned by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos2/nf-qos2-qoscreatehandle">QOSCreateHandle</a>.
     * @param {Pointer} Socket Identifies the socket that the application will use to flow traffic.
     * @param {Pointer<SOCKADDR>} DestAddr Pointer to a <a href="https://docs.microsoft.com/windows/desktop/WinSock/sockaddr-2">sockaddr</a> structure that contains the destination IP address to which the application will send traffic.  The sockaddr structure must specify a destination port.
     * 
     * <div class="alert"><b>Note</b>  <i>DestAddr</i> is optional if the socket is already connected. If this parameter is specified, the remote IP address and port must match those used in the socket's connect call.<p class="note">If the socket is not connected, this parameter must be specified.  If the socket is already connected, this parameter does not need to be specified.  In this case, if the parameter is still specified, the destination host and port must match what was specified during the socket connect call.
     * 
     * <p class="note">Since, under TCP, the socket connect call can be delayed, <b>QOSAddSocketToFlow</b> can be called before a connection is established, passing in the remote system's IP address and port number in the <i>DestAddr</i> parameter.
     * 
     * </div>
     * <div> </div>
     * @param {Integer} TrafficType A <a href="https://docs.microsoft.com/windows/desktop/api/qos2/ne-qos2-qos_traffic_type">QOS_TRAFFIC_TYPE</a> constant that specifies the type of traffic for which this flow will be used.
     * @param {Integer} Flags Optional flag values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="QOS_NON_ADAPTIVE_FLOW"></a><a id="qos_non_adaptive_flow"></a><dl>
     * <dt><b>QOS_NON_ADAPTIVE_FLOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If specified, the QoS subsystem will not gather data about the network path for this flow.  As a result, functions which rely on bandwidth estimation techniques will not be available.  For example, this would block <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos2/nf-qos2-qosqueryflow">QOSQueryFlow</a> with an <i>Operation</i> value  of <b>QOSQueryFlowFundamentals</b> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos2/nf-qos2-qosnotifyflow">QOSNotifyFlow</a> with an <i>Operation</i> value of <b>QOSNotifyCongested</b>, <b>QOSNotifyUncongested</b>, and <b>QOSNotifyAvailable</b>. 
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<UInt32>} FlowId Pointer to a buffer that receives a flow identifier. On input, this value must be 0.  On output, the buffer contains a flow identifier if the call succeeds.  
     * 
     * If a socket is being added to an existing flow, this parameter will be the identifier of that flow.
     * 
     * An application can make use of this parameter if multiple sockets used can share the same QoS flow properties.  The QoS subsystem, then does not have to incur the overhead of provisioning new flows for subsequent sockets with the same properties.  Note that only non-adaptive flows can have multiple sockets attached to an existing flow.  
     * 
     * A <b>QOS_FLOWID</b> is an unsigned 32-bit integer.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is 0.  To get extended error information, call <b>GetLastError</b>.  Some possible error codes follow.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CONNECTION_REFUSED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote system refused the network connection.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>QOSHandle</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>FlowId</i> parameter is invalid.
     * 
     * <div class="alert"><b>Note</b>  This value is also returned if a IPv4/v6 mixed address was supplied through the <i>DestAddr</i> parameter.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A memory allocation failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SYSTEM_RESOURCES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are insufficient resources to carry out the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_IO_DEVICE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The request could not be performed because of an I/O device error.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DEVICE_REINITIALIZATION_NEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The indicated device requires reinitialization due to hardware errors. The application should clean up and call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos2/nf-qos2-qoscreatehandle">QOSCreateHandle</a> again.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The request is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ADAP_HDW_ERR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A network adapter hardware error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_HOST_UNREACHABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network location cannot be reached.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/qos2/nf-qos2-qosaddsockettoflow
     * @since windows6.0.6000
     */
    static QOSAddSocketToFlow(QOSHandle, Socket, DestAddr, TrafficType, Flags, FlowId) {
        result := DllCall("qwave.dll\QOSAddSocketToFlow", "ptr", QOSHandle, "ptr", Socket, "ptr", DestAddr, "int", TrafficType, "uint", Flags, "ptr", FlowId, "int")
        return result
    }

    /**
     * Notifies the QOS subsystem that a previously added flow has been terminated.
     * @remarks
     * Calling the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos2/nf-qos2-qosclosehandle">QOSCloseHandle</a> function immediately aborts all pending operations and flows added by that handle.  If a handle is closed while a <b>QOSRemoveSocketFromFlow</b> call is still progress, the call will complete with <b>ERROR_OPERATION_ABORTED</b>.
     * @param {Pointer<HANDLE>} QOSHandle Handle to the QOS subsystem returned by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos2/nf-qos2-qoscreatehandle">QOSCreateHandle</a>.
     * @param {Pointer} Socket Socket to be removed from the flow.
     * 
     * Only flows created with the <b>QOS_NON_ADAPTIVE_FLOW</b> flag may have multiple sockets added to the same flow.  By passing the <i>Socket</i> parameter in this call, each socket can be removed individually.  If the <i>Socket</i> parameter is not passed, the entire flow will be destroyed.  If only one socket was attached to the flow, passing this socket as a parameter to this function and passing <b>NULL</b> as a socket are equivalent calls.
     * @param {Integer} FlowId A flow identifier. A <b>QOS_FLOWID</b> is an unsigned 32-bit integer.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is 0.  To get extended error information, call <b>GetLastError</b>.  Some possible error codes follow.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>QOSHandle</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>FlowId</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A memory allocation failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SYSTEM_RESOURCES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are insufficient system resources to carry out the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_OPERATION_ABORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The request was blocked.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_IO_DEVICE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The request could not be performed because of an I/O device error.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DEVICE_REINITIALIZATION_NEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The indicated device requires reinitialization due to hardware errors. The application should clean up and call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos2/nf-qos2-qoscreatehandle">QOSCreateHandle</a> again.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_HOST_UNREACHABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network location cannot be reached.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/qos2/nf-qos2-qosremovesocketfromflow
     * @since windows6.0.6000
     */
    static QOSRemoveSocketFromFlow(QOSHandle, Socket, FlowId) {
        static Flags := 0 ;Reserved parameters must always be NULL

        result := DllCall("qwave.dll\QOSRemoveSocketFromFlow", "ptr", QOSHandle, "ptr", Socket, "uint", FlowId, "uint", Flags, "int")
        return result
    }

    /**
     * Is called by an application to request the QOS subsystem to prioritize the application's packets and change the flow traffic.
     * @remarks
     * If <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos2/nf-qos2-qosstarttrackingclient">QOSStartTrackingClient</a> has not already been called, calling <b>QOSSetFlow</b> will cause the QOS subsystem to perform the following.<ul>
     * <li>Discover whether the end-to-end network path supports prioritization.</li>
     * <li>Track end-to-end network characteristics by way of network experiments.  These experiments do not place any noteworthy stress on the network.</li>
     * </ul>
     * 
     * 
     * If <b>QOSSetFlow</b> returns <b>ERROR_NETWORK_BUSY</b> there is insufficient bandwidth for the specified flow rate and network priority cannot be granted.  The application can still transmit a data stream but the flow will not receive priority marking.  Ideally an application would not attempt to stream at the requested rate if there is insufficient bandwidth. If <b>ERROR_NETWORK_BUSY</b> is returned the following safe strategy is available:<ol>
     * <li>Query the QoS subsystem with <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos2/nf-qos2-qosnotifyflow">QOSNotifyFlow</a> in order to determine the current available bandwidth and begin to stream at the received lower rate with priority if the network supports it.</li>
     * <li>Request notification with <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos2/nf-qos2-qosnotifyflow">QOSNotifyFlow</a> for when the originally desired amount of bandwidth is available.  When notification is received call  <b>QOSSetFlow</b> with the new bandwidth request and send at the new rate again with prioritization if supported.</li>
     * </ol>
     * 
     * 
     * This function may optionally be called asynchronously.
     * @param {Pointer<HANDLE>} QOSHandle Handle to the QOS subsystem returned by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos2/nf-qos2-qoscreatehandle">QOSCreateHandle</a>.
     * @param {Integer} FlowId A flow identifier. A <b>QOS_FLOWID</b> is an unsigned 32-bit integer.
     * @param {Integer} Operation A <a href="https://docs.microsoft.com/windows/desktop/api/qos2/ne-qos2-qos_set_flow">QOS_SET_FLOW</a> enumerated type that identifies what will be changed in the flow.  This parameter specifies what structure the <i>Buffer</i> will contain.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="QOSSetTrafficType"></a><a id="qossettraffictype"></a><a id="QOSSETTRAFFICTYPE"></a><dl>
     * <dt><b>QOSSetTrafficType</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The traffic type of the flow will be changed.  The <i>Buffer</i> will contain a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/qos2/ne-qos2-qos_traffic_type">QOS_TRAFFIC_TYPE</a> constant.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="QOSSetOutgoingRate"></a><a id="qossetoutgoingrate"></a><a id="QOSSETOUTGOINGRATE"></a><dl>
     * <dt><b>QOSSetOutgoingRate</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The flow rate will be changed. The <i>Buffer</i> will contain a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/qos2/ns-qos2-qos_flowrate_outgoing">QOS_FLOWRATE_OUTGOING</a> structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="QOSSetOutgoingDSCPValue"></a><a id="qossetoutgoingdscpvalue"></a><a id="QOSSETOUTGOINGDSCPVALUE"></a><dl>
     * <dt><b>QOSSetOutgoingDSCPValue</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Windows 7, Windows Server 2008 R2, and later: The outgoing DSCP value will be changed. The <i>Buffer</i> will contain a pointer to a <b>DWORD</b> value that defines the arbitrary DSCP value.
     * 
     * <div class="alert"><b>Note</b>  This setting requires the calling application be a member of the Administrators or the  Network Configuration Operators group.</div>
     * <div> </div>
     * </td>
     * </tr>
     * </table>
     * @param {Integer} Size The size of the <i>Buffer</i> parameter, in bytes.
     * @param {Pointer<Void>} Buffer Pointer to the structure specified by the value of the <i>Operation</i> parameter.
     * @param {Pointer<OVERLAPPED>} Overlapped Pointer to an OVERLAPPED structure used for asynchronous output.  This must be set to <b>NULL</b> if this function is not being called asynchronously.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is 0.  To get extended error information, call <b>GetLastError</b>.  Some possible error codes follow.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DISABLED_BY_POLICY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The QoS subsystem is currently configured by policy to not allow this operation on the network path between this host and the destination host.  For example, the default policy prevents qWAVE experiments from running to off-link destinations.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_IO_PENDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The update flow request was successfully received.  Results will be returned during overlapped completion.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling application does not have sufficient privileges for the requested operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>QOSHandle</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>FlowId</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NETWORK_BUSY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested flow properties were not available on this path.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>FlowId</i> parameter specified cannot be found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A memory allocation failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation being performed requires information that the QoS subsystem does not have.  Obtaining this information on this network is currently not supported.  For example, bandwidth estimations cannot be obtained on a network path where the destination host is off-link.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SYSTEM_RESOURCES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are insufficient resources to carry out the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_IO_DEVICE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The request could not be performed because of an I/O device error.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DEVICE_REINITIALIZATION_NEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The indicated device requires reinitialization due to hardware errors. The application should clean up and call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos2/nf-qos2-qoscreatehandle">QOSCreateHandle</a> again.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ADAP_HDW_ERR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A network adapter hardware error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_HOST_UNREACHABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network location cannot be reached.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_RETRY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is currently insufficient data about networking conditions to answer the query.  This is typically a transient state where qWAVE has erred on the side of caution as it awaits more data before ascertaining the state of the network.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_UNEXP_NET_ERR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network connection with the remote host failed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/qos2/nf-qos2-qossetflow
     * @since windows6.0.6000
     */
    static QOSSetFlow(QOSHandle, FlowId, Operation, Size, Buffer, Overlapped) {
        static Flags := 0 ;Reserved parameters must always be NULL

        result := DllCall("qwave.dll\QOSSetFlow", "ptr", QOSHandle, "uint", FlowId, "int", Operation, "uint", Size, "ptr", Buffer, "uint", Flags, "ptr", Overlapped, "int")
        return result
    }

    /**
     * Requests information about a specific flow.
     * @param {Pointer<HANDLE>} QOSHandle Handle to the QOS subsystem returned by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos2/nf-qos2-qoscreatehandle">QOSCreateHandle</a>.
     * @param {Integer} FlowId Specifies a flow identifier. A <b>QOS_FLOWID</b> is an unsigned 32-bit integer.
     * @param {Integer} Operation Specifies which type of flow information is being queried. This parameter specifies what structure the <i>Buffer</i> will contain.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="QOSQueryFlowFundamentals"></a><a id="qosqueryflowfundamentals"></a><a id="QOSQUERYFLOWFUNDAMENTALS"></a><dl>
     * <dt><b>QOSQueryFlowFundamentals</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>Buffer</i> will contain a <a href="https://docs.microsoft.com/windows/desktop/api/qos2/ns-qos2-qos_flow_fundamentals">QOS_FLOW_FUNDAMENTALS</a> structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="QOSQueryPacketPriority"></a><a id="qosquerypacketpriority"></a><a id="QOSQUERYPACKETPRIORITY"></a><dl>
     * <dt><b>QOSQueryPacketPriority</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>Buffer</i> will contain a <a href="https://docs.microsoft.com/windows/desktop/api/qos2/ns-qos2-qos_packet_priority">QOS_PACKET_PRIORITY</a> structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="QOSQueryOutgoingRate"></a><a id="qosqueryoutgoingrate"></a><a id="QOSQUERYOUTGOINGRATE"></a><dl>
     * <dt><b>QOSQueryOutgoingRate</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>Buffer</i> will contain a <b>UINT64</b> value that indicates the flow rate specified when requesting the contract, in bits per second.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<UInt32>} Size Indicates the size of the <i>Buffer</i> parameter, in bytes.
     * 
     * On function return, if successful, this parameter will specify the number of bytes copied into <i>Buffer</i>.
     * 
     * If this call fails with <b>ERROR_INSUFFICIENT_BUFFER</b>, this parameter will indicate the minimum required <i>Buffer</i> size in order to successfully complete this operation.
     * @param {Pointer<Void>} Buffer Pointer to the structure specified by the value of the <i>Operation</i> parameter.
     * @param {Integer} Flags Flags pertaining to the data being returned.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="QOS_QUERYFLOW_FRESH"></a><a id="qos_queryflow_fresh"></a><dl>
     * <dt><b>QOS_QUERYFLOW_FRESH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The QOS subsystem will only return fresh, not cached,  data.  If fresh data is unavailable, it will try to obtain such data, at the expense of possibly taking more time.  If this is not possible, the call will fail with the error code <b>ERROR_RETRY</b>.
     * 
     * This flag is only applicable when the <i>Operation</i> parameter is set to <b>QOSQueryFlowFundamentals</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<OVERLAPPED>} Overlapped Pointer to an OVERLAPPED structure used for asynchronous output. This must be set to <b>NULL</b> if this function is not being called asynchronously.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is 0.  To get extended error information, call <b>GetLastError</b>.  Some possible error codes follow.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DISABLED_BY_POLICY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The QoS subsystem is currently configured by policy to not allow this operation on the network path between this host and the destination host.  For example, the default policy prevents qWAVE experiments from running to off-link destinations.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_TIMEOUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The request to the QOS subsystem timed out before enough useful information could be gathered.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer length as specified by the <b>Size</b> parameter is not sufficient for the queried data.  The <b>Size</b> parameter now contains the minimum required size.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>QOSHandle</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>FlowId</i> parameter or <i>Buffer</i> size is insufficient.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid <i>FlowId</i> specified.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that a memory allocation failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation being performed requires information that the QoS subsystem does not have.  Obtaining this information on this network is currently not supported.  For example, bandwidth estimations cannot be obtained on a network path where the destination host is off-link.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SYSTEM_RESOURCES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are insufficient resources to carry out the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_IO_DEVICE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The request could not be performed because of an I/O device error.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_IO_PENDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the update flow request was successfully initiated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DEVICE_REINITIALIZATION_NEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The indicated device requires reinitialization due to hardware errors. The application should clean up and call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos2/nf-qos2-qoscreatehandle">QOSCreateHandle</a> again.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ADAP_HDW_ERR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A network adapter hardware error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_HOST_UNREACHABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network location cannot be reached.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The is no valid data to be returned.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_RETRY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is currently insufficient data about networking conditions to answer the query.  This is typically a transient state where qWAVE has erred on the side of caution as it awaits more data before ascertaining the state of the network.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/qos2/nf-qos2-qosqueryflow
     * @since windows6.0.6000
     */
    static QOSQueryFlow(QOSHandle, FlowId, Operation, Size, Buffer, Flags, Overlapped) {
        result := DllCall("qwave.dll\QOSQueryFlow", "ptr", QOSHandle, "uint", FlowId, "int", Operation, "ptr", Size, "ptr", Buffer, "uint", Flags, "ptr", Overlapped, "int")
        return result
    }

    /**
     * Registers the calling application to receive a notification.
     * @remarks
     * This function may be called asynchronously.
     * @param {Pointer<HANDLE>} QOSHandle Handle to the QOS subsystem returned by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos2/nf-qos2-qoscreatehandle">QOSCreateHandle</a>.
     * @param {Integer} FlowId Specifies the flow identifier from which the application wishes to receive notifications. A <b>QOS_FLOWID</b> is an unsigned 32-bit integer.
     * @param {Integer} Operation A <a href="https://docs.microsoft.com/windows/desktop/api/qos2/ne-qos2-qos_notify_flow">QOS_NOTIFY_FLOW</a> value that indicates what the type of  notification being requested.
     * @param {Pointer<UInt32>} Size Indicates the size of the <i>Buffer</i> parameter, in bytes.
     * 
     * On function return, if successful, this parameter will specify the number of bytes copied into <i>Buffer</i>.
     * 
     * If this call fails with <b>ERROR_INSUFFICIENT_BUFFER</b>, this parameter will indicate the minimum required <i>Buffer</i> size in order to successfully complete this operation.
     * @param {Pointer<Void>} Buffer Pointer to a UINT64 that indicates the bandwidth at which point a notification will be sent.  This parameter is only used if the <i>Operation</i> parameter is set to <b>QOSNotifyAvailable</b>. For the <b>QOSNotifyCongested</b> and <b>QOSNotifyUncongested</b> options, this parameter must be set to <b>NULL</b> on input.
     * @param {Pointer<OVERLAPPED>} Overlapped Pointer to an OVERLAPPED structure used for asynchronous output. This must be se to <b>NULL</b> if this function is not being called asynchronously.
     * @returns {Integer} If the function succeeds, a return value of nonzero is sent when the conditions set by the <i>Operation</i> parameter are met.
     * 
     * If the function fails, the return value is 0.  To get extended error information, call <b>GetLastError</b>.  Some possible error codes follow.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DISABLED_BY_POLICY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The QoS subsystem is currently configured by policy to not allow this operation on the network path between this host and the destination host.  For example, the default policy prevents qWAVE experiments from running to off-link destinations.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_IO_PENDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that notification request was successfully received.  Results will be returned during overlapped completion.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>QOSHandle</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>FlowId</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that a memory allocation failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid <i>FlowId</i> specified.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation being performed requires information that the QoS subsystem does not have.  Obtaining this information on this network is currently not supported.  For example, bandwidth estimations cannot be obtained on a network path where the destination host is off-link.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SYSTEM_RESOURCES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are insufficient resources to carry out the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_IO_DEVICE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The request could not be performed because of an I/O device error.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DEVICE_REINITIALIZATION_NEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The indicated device requires reinitialization due to hardware errors. The application should clean up and call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos2/nf-qos2-qoscreatehandle">QOSCreateHandle</a> again.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The QOS subsystem has determined that the operation requested could not be completed on the network path specified.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ADAP_HDW_ERR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A network adapter hardware error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_HOST_UNREACHABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network location cannot be reached.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_UNEXP_NET_ERR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network connection with the remote host failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ALREADY_EXISTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is already a request for notifications of the same type pending on this flow.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/qos2/nf-qos2-qosnotifyflow
     * @since windows6.0.6000
     */
    static QOSNotifyFlow(QOSHandle, FlowId, Operation, Size, Buffer, Overlapped) {
        static Flags := 0 ;Reserved parameters must always be NULL

        result := DllCall("qwave.dll\QOSNotifyFlow", "ptr", QOSHandle, "uint", FlowId, "int", Operation, "ptr", Size, "ptr", Buffer, "uint", Flags, "ptr", Overlapped, "int")
        return result
    }

    /**
     * Cancels a pending overlapped operation, like QOSSetFlow.
     * @remarks
     * This function would never be called with a <b>NULL</b><i>Overlapped</i> parameter.
     * 
     * Successfully canceled operations complete normal completion mechanisms and return <b>ERROR_OPERATION_ABORTED</b> as their completion return code.
     * 
     * Closing a handle with the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos2/nf-qos2-qosclosehandle">QOSCloseHandle</a> will automatically abort all pending operations issued with that handle.  If the handle is closed while a <b>QOSCancel</b> is still in progress, the call will complete with <b>ERROR_OPERATION_ABORTED</b> as the return code.
     * @param {Pointer<HANDLE>} QOSHandle Handle to the QOS subsystem returned by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos2/nf-qos2-qoscreatehandle">QOSCreateHandle</a>.
     * @param {Pointer<OVERLAPPED>} Overlapped Pointer to the OVERLAPPED structure used in the operation to be canceled.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is 0.  To get extended error information, call <b>GetLastError</b>. Some possible error codes follow.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>QOSHandle</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>Overlapped</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A memory allocation failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SYSTEM_RESOURCES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are insufficient resources to carry out the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_IO_DEVICE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The request could not be performed because of an I/O device error.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DEVICE_REINITIALIZATION_NEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The indicated device requires reinitialization due to hardware errors. The application should clean up and call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos2/nf-qos2-qoscreatehandle">QOSCreateHandle</a> again.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ADAP_HDW_ERR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A network adapter hardware error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/qos2/nf-qos2-qoscancel
     * @since windows6.0.6000
     */
    static QOSCancel(QOSHandle, Overlapped) {
        result := DllCall("qwave.dll\QOSCancel", "ptr", QOSHandle, "ptr", Overlapped, "int")
        return result
    }

    /**
     * The TcRegisterClient function is used to register a client with the traffic control interface (TCI). The TcRegisterClient function must be the first function call a client makes to the TCI.
     * @remarks
     * Some of the return codes can be found in tcerror.h.
     * 
     * <div class="alert"><b>Note</b>  Use of the 
     * <b>TcRegisterClient</b> function requires administrative privilege.</div>
     * <div> </div>
     * @param {Integer} TciVersion Traffic control version expected by the client, included to ensure compatibility between traffic control and the client. Clients can pass CURRENT_TCI_VERSION, defined in Traffic.h.
     * @param {Pointer<HANDLE>} ClRegCtx Client registration context. <i>ClRegCtx</i> is returned when the client's notification handler function is called. This can be a container to hold an arbitrary client-defined context for this instance of the interface.
     * @param {Pointer<TCI_CLIENT_FUNC_LIST>} ClientHandlerList Pointer to a list of client-supplied handlers. Client-supplied handlers are used for notification events and asynchronous completions. Each completion routine is optional, with the exception of the notification handler. Setting the notification handler to <b>NULL</b> will return an ERROR_INVALID_PARAMETER.
     * @param {Pointer<HANDLE>} pClientHandle Pointer to the buffer that traffic control uses to return a registration handle to the client.
     * @returns {Integer} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NO_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function executed without errors.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system is out of memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INCOMPATIBLE_TCI_VERSION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The TCI version is wrong.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_OPEN_FAILED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Traffic control failed to open a system device. The likely cause is insufficient privileges.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_TOO_MANY_CLIENTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Traffic Control was unable to register with the kernel component GPC. The likely cause is too many traffic control clients are currently connected.
     * 
     * <b>Windows 2000:  </b>This value is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/traffic/nf-traffic-tcregisterclient
     * @since windows5.0
     */
    static TcRegisterClient(TciVersion, ClRegCtx, ClientHandlerList, pClientHandle) {
        result := DllCall("TRAFFIC.dll\TcRegisterClient", "uint", TciVersion, "ptr", ClRegCtx, "ptr", ClientHandlerList, "ptr", pClientHandle, "uint")
        return result
    }

    /**
     * The TcEnumerateInterfaces function enumerates all traffic control�enabled network interfaces. Clients are notified of interface changes through the ClNotifyHandler function.
     * @remarks
     * The client calling the 
     * <b>TcEnumerateInterfaces</b> function must first allocate a buffer, then pass the buffer to traffic control through <i>InterfaceBuffer</i>. Traffic control returns a pointer to an array of interface descriptors in <i>InterfaceBuffer</i>. Each interface descriptor contains two elements:
     * 
     * <ul>
     * <li>The traffic control interface's identifying text string.</li>
     * <li>The network address list descriptor currently associated with the interface.</li>
     * </ul>
     * The network address list descriptor includes the media type, as well as a list of network addresses. The media type determines how the network address list should be interpreted:
     * 
     * <ul>
     * <li>For connectionless media such as a LAN, the network address list contains all the protocol-specific addresses associated with the interface.</li>
     * <li>For connection-oriented media such as a WAN, the network address list contains an even number of network addresses: 
     * 
     * 
     * <ul>
     * <li>The first address in each pair represents the local (source) address of the interface.</li>
     * <li>The second address in each pair represents the remote (destination) address of the interface.</li>
     * </ul>
     * </li>
     * </ul>
     * <div class="alert"><b>Note</b>  Use of the 
     * <b>TcEnumerateInterfaces</b> function requires administrative privilege.</div>
     * <div> </div>
     * @param {Pointer<HANDLE>} ClientHandle Handle used by traffic control to identify the client. Clients receive handles when registering with traffic control through the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nf-traffic-tcregisterclient">TcRegisterClient</a> function.
     * @param {Pointer<UInt32>} pBufferSize Pointer to a value indicating the size of the buffer. For input, this value is the size of the buffer, in bytes, allocated by the caller. For output, this value is the actual size of the buffer, in bytes, used or needed by traffic control. A value of zero on output indicates that no traffic control interfaces are available, indicating that the QOS Packet Scheduler is not installed.
     * @param {Pointer<TC_IFC_DESCRIPTOR>} InterfaceBuffer Pointer to the buffer containing the returned list of interface descriptors.
     * @returns {Integer} Successful completion returns the device name of the interface.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NO_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function executed without errors.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The client handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer is too small to enumerate all interfaces. If this error is returned, the correct (required) size of the buffer is passed back in <i>pBufferSize</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system is out of memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/traffic/nf-traffic-tcenumerateinterfaces
     * @since windows5.0
     */
    static TcEnumerateInterfaces(ClientHandle, pBufferSize, InterfaceBuffer) {
        result := DllCall("TRAFFIC.dll\TcEnumerateInterfaces", "ptr", ClientHandle, "ptr", pBufferSize, "ptr", InterfaceBuffer, "uint")
        return result
    }

    /**
     * The TcOpenInterface function opens an interface. (ANSI)
     * @remarks
     * Use of the 
     * <b>TcOpenInterface</b> function requires administrative privilege.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The traffic.h header defines TcOpenInterface as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<PSTR>} pInterfaceName Pointer to the text string identifying the interface to be opened. This text string is part of the information returned in a previous call to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nf-traffic-tcenumerateinterfaces">TcEnumerateInterfaces</a>.
     * @param {Pointer<HANDLE>} ClientHandle Handle used by traffic control to identify the client, obtained through the <i>pClientHandle</i> parameter of the client's call to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nf-traffic-tcregisterclient">TcRegisterClient</a>.
     * @param {Pointer<HANDLE>} ClIfcCtx Client's interface–context handle for the opened interface. Used as a callback parameter by traffic control when communicating with the client about the opened interface. This can be a container to hold an arbitrary client-defined context for this instance of the interface.
     * @param {Pointer<HANDLE>} pIfcHandle Pointer to the buffer where traffic control can return an interface handle. The interface handle returned to <i>pIfcHandle</i> must be used by the client to identify the interface in subsequent calls to traffic control.
     * @returns {Integer} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NO_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function executed without errors.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system is out of memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Traffic control failed to find an interface with the name provided in <i>pInterfaceName</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The client handle is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/traffic/nf-traffic-tcopeninterfacea
     * @since windows5.0
     */
    static TcOpenInterfaceA(pInterfaceName, ClientHandle, ClIfcCtx, pIfcHandle) {
        result := DllCall("TRAFFIC.dll\TcOpenInterfaceA", "ptr", pInterfaceName, "ptr", ClientHandle, "ptr", ClIfcCtx, "ptr", pIfcHandle, "uint")
        return result
    }

    /**
     * The TcOpenInterface function opens an interface. (Unicode)
     * @remarks
     * Use of the 
     * <b>TcOpenInterface</b> function requires administrative privilege.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The traffic.h header defines TcOpenInterface as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<PWSTR>} pInterfaceName Pointer to the text string identifying the interface to be opened. This text string is part of the information returned in a previous call to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nf-traffic-tcenumerateinterfaces">TcEnumerateInterfaces</a>.
     * @param {Pointer<HANDLE>} ClientHandle Handle used by traffic control to identify the client, obtained through the <i>pClientHandle</i> parameter of the client's call to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nf-traffic-tcregisterclient">TcRegisterClient</a>.
     * @param {Pointer<HANDLE>} ClIfcCtx Client's interface–context handle for the opened interface. Used as a callback parameter by traffic control when communicating with the client about the opened interface. This can be a container to hold an arbitrary client-defined context for this instance of the interface.
     * @param {Pointer<HANDLE>} pIfcHandle Pointer to the buffer where traffic control can return an interface handle. The interface handle returned to <i>pIfcHandle</i> must be used by the client to identify the interface in subsequent calls to traffic control.
     * @returns {Integer} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NO_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function executed without errors.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system is out of memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Traffic control failed to find an interface with the name provided in <i>pInterfaceName</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The client handle is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/traffic/nf-traffic-tcopeninterfacew
     * @since windows5.0
     */
    static TcOpenInterfaceW(pInterfaceName, ClientHandle, ClIfcCtx, pIfcHandle) {
        result := DllCall("TRAFFIC.dll\TcOpenInterfaceW", "ptr", pInterfaceName, "ptr", ClientHandle, "ptr", ClIfcCtx, "ptr", pIfcHandle, "uint")
        return result
    }

    /**
     * The TcCloseInterface function closes an interface previously opened with a call to TcOpenInterface. All flows and filters on a particular interface should be closed before closing the interface with a call to TcCloseInterface.
     * @remarks
     * Regardless of whether 
     * <b>TcCloseInterface</b> is called, an interface will be closed following a TC_NOTIFY_IFC_CLOSE notification event. If the 
     * <b>TcCloseInterface</b> function is called with the handle of an interface that has already been closed, the handle will be invalidated and 
     * <b>TcCloseInterface</b> will return ERROR_INVALID_HANDLE.
     * 
     * <div class="alert"><b>Note</b>  Use of 
     * <b>TcCloseInterface</b> requires administrative privilege.</div>
     * <div> </div>
     * @param {Pointer<HANDLE>} IfcHandle Handle associated with the interface to be closed. This handle is obtained by a previous call to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nf-traffic-tcopeninterfacea">TcOpenInterface</a> function.
     * @returns {Integer} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NO_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function executed without errors.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The interface handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_TC_SUPPORTED_OBJECTS_EXIST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not all flows have been deleted for this interface.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/traffic/nf-traffic-tccloseinterface
     * @since windows5.0
     */
    static TcCloseInterface(IfcHandle) {
        result := DllCall("TRAFFIC.dll\TcCloseInterface", "ptr", IfcHandle, "uint")
        return result
    }

    /**
     * The TcQueryInterface function queries traffic control for related per-interface parameters.
     * @remarks
     * <div class="alert"><b>Note</b>  Use of the 
     * <b>TcQueryInterface</b> function requires administrative privilege.</div>
     * <div> </div>
     * @param {Pointer<HANDLE>} IfcHandle Handle associated with the interface to be queried. This handle is obtained by a previous call to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nf-traffic-tcopeninterfacea">TcOpenInterface</a> function.
     * @param {Pointer<Guid>} pGuidParam Pointer to the globally unique identifier (GUID) that corresponds to the traffic control parameter being queried.
     * @param {Integer} NotifyChange Used to request notifications from traffic control for the parameter being queried. If <b>TRUE</b>, traffic control will notify the client, through the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nc-traffic-tci_notify_handler">ClNotifyHandler</a> function, upon changes to the parameter corresponding to the GUID provided in <i>pGuidParam</i>. Notifications are off by default.
     * @param {Pointer<UInt32>} pBufferSize Indicates the size of the buffer, in bytes. For input, this value is the size of the buffer allocated by the caller. For output, this value is the actual size of the buffer, in bytes, used by traffic control.
     * @param {Pointer<Void>} Buffer Pointer to a client-allocated buffer into which returned data will be written.
     * @returns {Integer} Note that, with regard to a requested notification state, only a return value of NO_ERROR will result in the application of the requested notification state. If a return value other than NO_ERROR is returned from a call to the 
     * <b>TcQueryInterface</b> function, the requested change in notification state will not be accepted.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NO_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function executed without errors.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid interface handle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid or <b>NULL</b> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer is too small to store the results.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Querying for the GUID provided is not supported on the provided interface.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WMI_GUID_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device did not register for this GUID.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WMI_INSTANCE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The instance name was not found, likely because the interface is in the process of being closed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/traffic/nf-traffic-tcqueryinterface
     * @since windows5.0
     */
    static TcQueryInterface(IfcHandle, pGuidParam, NotifyChange, pBufferSize, Buffer) {
        result := DllCall("TRAFFIC.dll\TcQueryInterface", "ptr", IfcHandle, "ptr", pGuidParam, "char", NotifyChange, "ptr", pBufferSize, "ptr", Buffer, "uint")
        return result
    }

    /**
     * The TcSetInterface function sets individual parameters for a given interface.
     * @remarks
     * <div class="alert"><b>Note</b>  Use of the 
     * <b>TcSetInterface</b> function requires administrative privilege. The list of GUIDs that can be set is explained in 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/qos/guid">GUID</a>.</div>
     * <div> </div>
     * @param {Pointer<HANDLE>} IfcHandle Handle associated with the interface to be set. This handle is obtained by a previous call to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nf-traffic-tcopeninterfacea">TcOpenInterface</a> function.
     * @param {Pointer<Guid>} pGuidParam Pointer to the globally unique identifier (GUID) that corresponds to the parameter to be set. A list of available GUIDs can be found in 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/qos/guid">GUID</a>.
     * @param {Integer} BufferSize Size of the client-provided buffer, in bytes.
     * @param {Pointer<Void>} Buffer Pointer to a client-provided buffer. <i>Buffer</i> must contain the value to which the traffic control parameter provided in <i>pGuidParam</i> should be set.
     * @returns {Integer} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NO_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function executed without errors.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid interface handle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Setting the GUID for the provided interface is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WMI_INSTANCE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The GUID is not available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WMI_GUID_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device did not register for this GUID.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/traffic/nf-traffic-tcsetinterface
     * @since windows5.0
     */
    static TcSetInterface(IfcHandle, pGuidParam, BufferSize, Buffer) {
        result := DllCall("TRAFFIC.dll\TcSetInterface", "ptr", IfcHandle, "ptr", pGuidParam, "uint", BufferSize, "ptr", Buffer, "uint")
        return result
    }

    /**
     * The TcQueryFlow function queries traffic control for the value of a specific flow parameter based on the name of the flow. The name of a flow can be retrieved from the TcEnumerateFlows function or from the TcGetFlowName function. (ANSI)
     * @remarks
     * Use of the 
     * <b>TcQueryFlow</b> function requires administrative privilege.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The traffic.h header defines TcQueryFlow as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<PSTR>} pFlowName Name of the flow being queried.
     * @param {Pointer<Guid>} pGuidParam Pointer to the globally unique identifier (GUID) that corresponds to the flow parameter of interest. A list of traffic control's GUIDs can be found in 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/qos/guid">GUID</a>.
     * @param {Pointer<UInt32>} pBufferSize Pointer to the size of the client-provided buffer or the number of bytes used by traffic control. For input, points to the size of <i>Buffer</i>, in bytes. For output, points to the actual amount of buffer space written with returned flow-parameter data, in bytes.
     * @param {Pointer<Void>} Buffer Pointer to the client-provided buffer in which the returned flow parameter is written.
     * @returns {Integer} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NO_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function executed without errors.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provided buffer is too small to hold the results.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested GUID is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WMI_GUID_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device did not register for this GUID.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WMI_INSTANCE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The instance name was not found, likely because the flow or the interface is in the process of being closed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/traffic/nf-traffic-tcqueryflowa
     * @since windows5.0
     */
    static TcQueryFlowA(pFlowName, pGuidParam, pBufferSize, Buffer) {
        result := DllCall("TRAFFIC.dll\TcQueryFlowA", "ptr", pFlowName, "ptr", pGuidParam, "ptr", pBufferSize, "ptr", Buffer, "uint")
        return result
    }

    /**
     * The TcQueryFlow function queries traffic control for the value of a specific flow parameter based on the name of the flow. The name of a flow can be retrieved from the TcEnumerateFlows function or from the TcGetFlowName function. (Unicode)
     * @remarks
     * Use of the 
     * <b>TcQueryFlow</b> function requires administrative privilege.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The traffic.h header defines TcQueryFlow as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<PWSTR>} pFlowName Name of the flow being queried.
     * @param {Pointer<Guid>} pGuidParam Pointer to the globally unique identifier (GUID) that corresponds to the flow parameter of interest. A list of traffic control's GUIDs can be found in 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/qos/guid">GUID</a>.
     * @param {Pointer<UInt32>} pBufferSize Pointer to the size of the client-provided buffer or the number of bytes used by traffic control. For input, points to the size of <i>Buffer</i>, in bytes. For output, points to the actual amount of buffer space written with returned flow-parameter data, in bytes.
     * @param {Pointer<Void>} Buffer Pointer to the client-provided buffer in which the returned flow parameter is written.
     * @returns {Integer} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NO_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function executed without errors.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provided buffer is too small to hold the results.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested GUID is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WMI_GUID_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device did not register for this GUID.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WMI_INSTANCE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The instance name was not found, likely because the flow or the interface is in the process of being closed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/traffic/nf-traffic-tcqueryfloww
     * @since windows5.0
     */
    static TcQueryFlowW(pFlowName, pGuidParam, pBufferSize, Buffer) {
        result := DllCall("TRAFFIC.dll\TcQueryFlowW", "ptr", pFlowName, "ptr", pGuidParam, "ptr", pBufferSize, "ptr", Buffer, "uint")
        return result
    }

    /**
     * The TcSetFlow function sets individual parameters for a given flow. (ANSI)
     * @remarks
     * Use of the 
     * <b>TcSetFlow</b> function requires administrative privilege.
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The traffic.h header defines TcSetFlow as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<PSTR>} pFlowName Name of the flow being set. The value for this parameter is obtained by a previous call to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nf-traffic-tcenumerateflows">TcEnumerateFlows</a> function or the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nf-traffic-tcgetflownamea">TcGetFlowName</a> function.
     * @param {Pointer<Guid>} pGuidParam Pointer to the globally unique identifier (GUID) that corresponds to the parameter to be set. A list of available GUIDs can be found in 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/qos/guid">GUID</a>.
     * @param {Integer} BufferSize Size of the client-provided buffer, in bytes.
     * @param {Pointer<Void>} Buffer Pointer to a client-provided buffer. Buffer must contain the value to which the traffic control parameter provided in <i>pGuidParam</i> should be set.
     * @returns {Integer} The 
     * <b>TcSetFlow</b> function has the following return values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NO_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function executed without errors.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_READY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The flow is currently being modified.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer size was insufficient for the GUID.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Setting the GUID for the provided flow is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WMI_INSTANCE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The instance name was not found, likely due to the flow or the interface being in the process of being closed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WMI_GUID_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device did not register for this GUID.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/traffic/nf-traffic-tcsetflowa
     * @since windows5.0
     */
    static TcSetFlowA(pFlowName, pGuidParam, BufferSize, Buffer) {
        result := DllCall("TRAFFIC.dll\TcSetFlowA", "ptr", pFlowName, "ptr", pGuidParam, "uint", BufferSize, "ptr", Buffer, "uint")
        return result
    }

    /**
     * The TcSetFlow function sets individual parameters for a given flow. (Unicode)
     * @remarks
     * Use of the 
     * <b>TcSetFlow</b> function requires administrative privilege.
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The traffic.h header defines TcSetFlow as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<PWSTR>} pFlowName Name of the flow being set. The value for this parameter is obtained by a previous call to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nf-traffic-tcenumerateflows">TcEnumerateFlows</a> function or the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nf-traffic-tcgetflownamea">TcGetFlowName</a> function.
     * @param {Pointer<Guid>} pGuidParam Pointer to the globally unique identifier (GUID) that corresponds to the parameter to be set. A list of available GUIDs can be found in 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/qos/guid">GUID</a>.
     * @param {Integer} BufferSize Size of the client-provided buffer, in bytes.
     * @param {Pointer<Void>} Buffer Pointer to a client-provided buffer. Buffer must contain the value to which the traffic control parameter provided in <i>pGuidParam</i> should be set.
     * @returns {Integer} The 
     * <b>TcSetFlow</b> function has the following return values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NO_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function executed without errors.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_READY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The flow is currently being modified.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer size was insufficient for the GUID.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Setting the GUID for the provided flow is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WMI_INSTANCE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The instance name was not found, likely due to the flow or the interface being in the process of being closed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WMI_GUID_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device did not register for this GUID.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/traffic/nf-traffic-tcsetfloww
     * @since windows5.0
     */
    static TcSetFlowW(pFlowName, pGuidParam, BufferSize, Buffer) {
        result := DllCall("TRAFFIC.dll\TcSetFlowW", "ptr", pFlowName, "ptr", pGuidParam, "uint", BufferSize, "ptr", Buffer, "uint")
        return result
    }

    /**
     * The TcAddFlow function adds a new flow on the specified interface.
     * @remarks
     * If the 
     * <b>TcAddFlow</b> function returns ERROR_SIGNAL_PENDING, the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nc-traffic-tci_add_flow_complete_handler">ClAddFlowComplete</a> function will be called on a different thread than the thread that called the 
     * <b>TcAddFlow</b> function.
     * 
     * Only the addition of a filter will affect traffic control. However, the addition of a flow will cause resources to be committed within traffic control components. This enables traffic control to prepare for handling traffic on the added flow.
     * 
     * Traffic control may delete a flow for various reasons, including the inability to accommodate the flow due to bandwidth restrictions, and adjusted policy requirements. Clients are notified of deleted flows through the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nc-traffic-tci_notify_handler">ClNotifyHandler</a> callback function, with the TC_NOTIFY_FLOW_CLOSE event.
     * 
     * <div class="alert"><b>Note</b>  Use of the 
     * <b>TcAddFlow</b> function requires administrative privilege.</div>
     * <div> </div>
     * @param {Pointer<HANDLE>} IfcHandle Handle associated with the interface on which the flow is to be added. This handle is obtained by a previous call to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nf-traffic-tcopeninterfacea">TcOpenInterface</a> function.
     * @param {Pointer<HANDLE>} ClFlowCtx Client provided–flow context handle. Used subsequently by traffic control when referring to the added flow.
     * @param {Integer} Flags Reserved for future use. Must be set to zero.
     * @param {Pointer<TC_GEN_FLOW>} pGenericFlow Pointer to a description of the flow being installed.
     * @param {Pointer<HANDLE>} pFlowHandle Pointer to a location into which traffic control will return the flow handle. This flow handle should be used in subsequent calls to traffic control to refer to the installed flow.
     * @returns {Integer} There are many reasons why a request to add a flow might be rejected. Error codes returned by traffic control from calls to 
     * <b>TcAddFlow</b> are provided to aid in determining the reason for rejection.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NO_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function executed without errors.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SIGNAL_PENDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function is being executed asynchronously; the client will be called back through the client-exposed 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nc-traffic-tci_add_flow_complete_handler">ClAddFlowComplete</a> function when the flow has been added or when the process has been completed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The interface handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system is out of memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_SERVICE_TYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified or bad <b>INTSERV</b> service type has been provided.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_TOKEN_RATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified or bad TOKENRATE value has been provided.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PEAK_RATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The PEAKBANDWIDTH value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_SD_MODE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The SHAPEDISCARDMODE is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_QOS_PRIORITY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The priority value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_TRAFFIC_CLASS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The traffic class value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SYSTEM_RESOURCES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are not enough resources to accommodate the requested flow.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_TC_OBJECT_LENGTH_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Bad length specified for the TC objects.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_DIFFSERV_FLOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Applies to Diffserv flows. Indicates that the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/qosobjs/ns-qosobjs-qos_diffserv">QOS_DIFFSERV</a> object was passed with an invalid parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DS_MAPPING_EXISTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Applies to Diffserv flows. Indicates that the QOS_DIFFSERV_RULE specified in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/traffic/ns-traffic-tc_gen_flow">TC_GEN_FLOW</a> already applies to an existing flow on the interface.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_SHAPE_RATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/qos/ns-qos-qos_shaping_rate">QOS_SHAPING_RATE</a> object was passed with an invalid <b>ShapingRate</b> member.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_DS_CLASS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The QOS_DS_CLASS is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NETWORK_UNREACHABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network cable is not plugged into the adapter.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/traffic/nf-traffic-tcaddflow
     * @since windows5.0
     */
    static TcAddFlow(IfcHandle, ClFlowCtx, Flags, pGenericFlow, pFlowHandle) {
        result := DllCall("TRAFFIC.dll\TcAddFlow", "ptr", IfcHandle, "ptr", ClFlowCtx, "uint", Flags, "ptr", pGenericFlow, "ptr", pFlowHandle, "uint")
        return result
    }

    /**
     * The TcGetFlowName function provides the name of a flow that has been created by the calling client. (ANSI)
     * @remarks
     * Use of the 
     * <b>TcGetFlowName</b> function requires administrative privilege.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The traffic.h header defines TcGetFlowName as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<HANDLE>} FlowHandle Handle for the flow.
     * @param {Integer} StrSize Size of the string buffer provided in <i>pFlowName</i>.
     * @param {Pointer<PSTR>} pFlowName Pointer to the output buffer holding the flow name.
     * @returns {Integer} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NO_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function executed without errors.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The flow handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer is too small to contain the results.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/traffic/nf-traffic-tcgetflownamea
     * @since windows5.0
     */
    static TcGetFlowNameA(FlowHandle, StrSize, pFlowName) {
        result := DllCall("TRAFFIC.dll\TcGetFlowNameA", "ptr", FlowHandle, "uint", StrSize, "ptr", pFlowName, "uint")
        return result
    }

    /**
     * The TcGetFlowName function provides the name of a flow that has been created by the calling client. (Unicode)
     * @remarks
     * Use of the 
     * <b>TcGetFlowName</b> function requires administrative privilege.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The traffic.h header defines TcGetFlowName as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<HANDLE>} FlowHandle Handle for the flow.
     * @param {Integer} StrSize Size of the string buffer provided in <i>pFlowName</i>.
     * @param {Pointer<PWSTR>} pFlowName Pointer to the output buffer holding the flow name.
     * @returns {Integer} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NO_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function executed without errors.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The flow handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer is too small to contain the results.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/traffic/nf-traffic-tcgetflownamew
     * @since windows5.0
     */
    static TcGetFlowNameW(FlowHandle, StrSize, pFlowName) {
        result := DllCall("TRAFFIC.dll\TcGetFlowNameW", "ptr", FlowHandle, "uint", StrSize, "ptr", pFlowName, "uint")
        return result
    }

    /**
     * The TcModifyFlow function modifies an existing flow. When calling TcModifyFlow, new Flowspec parameters and any traffic control objects should be filled.
     * @remarks
     * If the 
     * <b>TcModifyFlow</b> function returns ERROR_SIGNAL_PENDING, the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nc-traffic-tci_mod_flow_complete_handler">ClModifyFlowComplete</a> function will be called on a different thread than the thread that called the 
     * <b>TcModifyFlow</b> function.
     * 
     * <div class="alert"><b>Note</b>  Use of the 
     * <b>TcModifyFlow</b> function requires administrative privilege.</div>
     * <div> </div>
     * @param {Pointer<HANDLE>} FlowHandle Handle for the flow, as received from a previous call to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nf-traffic-tcaddflow">TcAddFlow</a> function.
     * @param {Pointer<TC_GEN_FLOW>} pGenericFlow Pointer to a description of the flow modifications.
     * @returns {Integer} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NO_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function executed without errors.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SIGNAL_PENDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function is being executed asynchronously; the client will be called back through the client-exposed 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nc-traffic-tci_mod_flow_complete_handler">ClModifyFlowComplete</a> function when the flow has been added, or when the process has been completed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The interface handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system is out of memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_READY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Action performed on the flow by a previous function call to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nf-traffic-tcaddflow">TcAddFlow</a>, 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nf-traffic-tcmodifyflow">TcModifyFlow</a>, or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nf-traffic-tcdeleteflow">TcDeleteFlow</a> has not yet completed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_SERVICE_TYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified or bad intserv service type has been provided.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_TOKEN_RATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified or bad <i>TokenRate</i> value has been provided.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PEAK_RATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>PeakBandwidth</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_SD_MODE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>ShapeDiscardMode</i> is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_QOS_PRIORITY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The priority value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_TRAFFIC_CLASS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The traffic class value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SYSTEM_RESOURCES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are not enough resources to accommodate the requested flow.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_TC_OBJECT_LENGTH_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Bad length specified for the TC objects.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_DIFFSERV_FLOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Applies to Diffserv flows. Indicates that the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/qosobjs/ns-qosobjs-qos_diffserv">QOS_DIFFSERV</a> object was passed with an invalid parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DS_MAPPING_EXISTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Applies to Diffserv flows. Indicates that the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/qosobjs/ns-qosobjs-qos_diffserv_rule">QOS_DIFFSERV_RULE</a> specified in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/traffic/ns-traffic-tc_gen_flow">TC_GEN_FLOW</a> already applies to an existing flow on the interface.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_SHAPE_RATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/qos/ns-qos-qos_shaping_rate">QOS_SHAPING_RATE</a> was passed with an invalid ShapeRate.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_DS_CLASS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/qosobjs/ns-qosobjs-qos_ds_class">QOS_DS_CLASS</a> is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NETWORK_UNREACHABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network cable is not plugged into the adapter.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/traffic/nf-traffic-tcmodifyflow
     * @since windows5.0
     */
    static TcModifyFlow(FlowHandle, pGenericFlow) {
        result := DllCall("TRAFFIC.dll\TcModifyFlow", "ptr", FlowHandle, "ptr", pGenericFlow, "uint")
        return result
    }

    /**
     * The TcAddFilter function associates a new filter with an existing flow that allows packets matching the filter to be directed to the associated flow.
     * @remarks
     * Filters can be of different types. They are typically used to filter packets belonging to different network layers. Filter types installed on an interface generally correspond to the address types of the network layer addresses associated with the interface. The address type should be specified in the filter structure.
     * 
     * Filters may be rejected for various reasons, including possible conflicts with the requested filter as well as filters already associated with the flow. Error codes specific to traffic control are provided to help the user diagnose the reason behind a rejection to the 
     * <b>TcAddFilter</b> function.
     * 
     * <div class="alert"><b>Note</b>  Use of the 
     * <b>TcAddFilter</b> function requires administrative privilege.</div>
     * <div> </div>
     * In Windows Vista, overlapping and identical filters can be created.  In these situations, the more specific filter takes precedence.
     * @param {Pointer<HANDLE>} FlowHandle Handle for the flow, as received from a previous call to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nf-traffic-tcaddflow">TcAddFlow</a> function.
     * @param {Pointer<TC_GEN_FILTER>} pGenericFilter Pointer to a description of the filter to be installed.
     * @param {Pointer<HANDLE>} pFilterHandle Pointer to a buffer where traffic control returns the filter handle. This filter handle is used by the client in subsequent calls to refer to the added filter.
     * @returns {Integer} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NO_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function executed without errors.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The flow handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_ADDRESS_TYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An invalid address type has been provided.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DUPLICATE_FILTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An identical filter exists on a flow on this interface.
     * 
     * <div class="alert"><b>Note</b>   In Windows Vista, this code will not be returned.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_FILTER_CONFLICT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A conflicting filter exists on a flow on this interface.
     * 
     * <div class="alert"><b>Note</b>   In Windows Vista, this code will not be returned.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system is out of memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT READY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The flow is either being installed, modified, or deleted, and is not in a state that accepts filters.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/traffic/nf-traffic-tcaddfilter
     * @since windows5.0
     */
    static TcAddFilter(FlowHandle, pGenericFilter, pFilterHandle) {
        result := DllCall("TRAFFIC.dll\TcAddFilter", "ptr", FlowHandle, "ptr", pGenericFilter, "ptr", pFilterHandle, "uint")
        return result
    }

    /**
     * The TcDeregisterClient function deregisters a client with the Traffic Control Interface (TCI).
     * @remarks
     * Once a client calls 
     * <b>TcDeregisterClient</b>, the only traffic control function the client is allowed to call is 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nf-traffic-tcregisterclient">TcRegisterClient</a>.
     * 
     * <div class="alert"><b>Note</b>  Use of the 
     * <b>TcDeregisterClient</b> function requires administrative privilege.</div>
     * <div> </div>
     * @param {Pointer<HANDLE>} ClientHandle Handle assigned to the client through the previous call to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nf-traffic-tcregisterclient">TcRegisterClient</a> function.
     * @returns {Integer} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NO_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function executed without errors.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid interface handle, or the handle was set to <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_TC_SUPPORTED_OBJECTS_EXIST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Interfaces are still open for this client. all interfaces must be closed to deregister a client.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/traffic/nf-traffic-tcderegisterclient
     * @since windows5.0
     */
    static TcDeregisterClient(ClientHandle) {
        result := DllCall("TRAFFIC.dll\TcDeregisterClient", "ptr", ClientHandle, "uint")
        return result
    }

    /**
     * The TcDeleteFlow function deletes a flow that has been added with the TcAddFlow function. Clients should delete all filters associated with a flow before deleting it, otherwise, an error will be returned and the function will not delete the flow.
     * @remarks
     * If the 
     * <b>TcDeleteFlow</b> function returns ERROR_SIGNAL_PENDING, the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nc-traffic-tci_del_flow_complete_handler">ClDeleteFlowComplete</a> function will be called on a different thread than the thread that called the 
     * <b>TcDeleteFlow</b> function.
     * 
     * <div class="alert"><b>Note</b>  Use of the 
     * <b>TcDeleteFlow</b> function requires administrative privilege.</div>
     * <div> </div>
     * @param {Pointer<HANDLE>} FlowHandle Handle for the flow, as received from a previous call to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nf-traffic-tcaddflow">TcAddFlow</a> function.
     * @returns {Integer} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NO_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function executed without errors.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SIGNAL_PENDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function is being executed asynchronously; the client will be called back through the client-exposed 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nc-traffic-tci_del_flow_complete_handler">ClDeleteFlowComplete</a> function when the flow has been added, or when the process has been completed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The flow handle is invalid or <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_READY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Action performed on the flow by a previous function call to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nf-traffic-tcmodifyflow">TcModifyFlow</a>, 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nf-traffic-tcdeleteflow">TcDeleteFlow</a>, or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nf-traffic-tcaddflow">TcAddFlow</a> has not yet completed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_TC_SUPPORTED_OBJECTS_EXIST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one filter associated with this flow exists.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/traffic/nf-traffic-tcdeleteflow
     * @since windows5.0
     */
    static TcDeleteFlow(FlowHandle) {
        result := DllCall("TRAFFIC.dll\TcDeleteFlow", "ptr", FlowHandle, "uint")
        return result
    }

    /**
     * The TcDeleteFilter function deletes a filter previously added with the TcAddFilter function.
     * @param {Pointer<HANDLE>} FilterHandle Handle to the filter to be deleted, as received in a previous call to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nf-traffic-tcaddfilter">TcAddFilter</a> function.
     * @returns {Integer} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NO_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function executed without errors.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The filter handle is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  Use of the 
     * <b>TcDeleteFilter</b> function requires administrative privilege.</div>
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/traffic/nf-traffic-tcdeletefilter
     * @since windows5.0
     */
    static TcDeleteFilter(FilterHandle) {
        result := DllCall("TRAFFIC.dll\TcDeleteFilter", "ptr", FilterHandle, "uint")
        return result
    }

    /**
     * The TcEnumerateFlows function enumerates installed flows and their associated filters on an interface.
     * @remarks
     * Do not request zero flows, or pass a buffer with a size equal to zero or pointer to a <b>NULL</b>.
     * 
     * If an enumeration token pointer has been invalidated by traffic control (due to the deletion of a flow), continuing to enumerate flows is not allowed, and the call will return ERROR_INVALID_DATA. Under this circumstance, the process of enumeration must start over. This circumstance can occur when the next flow to be enumerated is deleted while enumeration is in progress.
     * 
     * To get the total number of flows for a given interface, call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nf-traffic-tcqueryinterface">TcQueryInterface</a> and specify <b>GUID_QOS_FLOW_COUNT</b>.
     * 
     * <div class="alert"><b>Note</b>  Use of the 
     * <b>TcEnumerateFlows</b> function requires administrative privilege.</div>
     * <div> </div>
     * @param {Pointer<HANDLE>} IfcHandle Handle associated with the interface on which flows are to be enumerated. This handle is obtained by a previous call to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nf-traffic-tcopeninterfacea">TcOpenInterface</a> function.
     * @param {Pointer<HANDLE>} pEnumHandle Pointer to the enumeration token, used internally by traffic control to maintain returned flow information state. 
     * 
     * 
     * 
     * 
     * For input of the initial call to 
     * <b>TcEnumerateFlows</b>, <i>pEnumToken</i> should be set to <b>NULL</b>. For input on subsequent calls, <i>pEnumToken</i> must be the value returned as the <i>pEnumToken</i> OUT parameter from the immediately preceding call to 
     * <b>TcEnumerateFlows</b>.
     * 
     * For output, <i>pEnumToken</i> is the refreshed enumeration token that must be used in the following call to 
     * <b>TcEnumerateFlows</b>.
     * @param {Pointer<UInt32>} pFlowCount Pointer to the number of requested or returned flows. For input, this parameter designates the number of requested flows or it can be set to <b>0xFFFF</b> to request all flows. For output, <i>pFlowCount</i> returns the number of flows actually returned in <i>Buffer</i>.
     * @param {Pointer<UInt32>} pBufSize Pointer to the size of the client-provided buffer or the number of bytes used by traffic control. For input, points to the size of <i>Buffer</i>, in bytes. For output, points to the actual amount of buffer space, in bytes, written or needed with flow enumerations.
     * @param {Pointer<ENUMERATION_BUFFER>} Buffer Pointer to the buffer containing flow enumerations. See 
     * <a href="https://docs.microsoft.com/windows/desktop/api/traffic/ns-traffic-enumeration_buffer">ENUMERATION_BUFFER</a> for more information about flow enumerations.
     * @returns {Integer} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NO_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function executed without errors.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid interface handle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the pointers is <b>NULL</b>, or <i>pFlowCount</i> or <i>pBufSize</i> are set to zero.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer is too small to store even a single flow's information and attached filters.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system is out of memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The enumeration token is no longer valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/traffic/nf-traffic-tcenumerateflows
     * @since windows5.0
     */
    static TcEnumerateFlows(IfcHandle, pEnumHandle, pFlowCount, pBufSize, Buffer) {
        result := DllCall("TRAFFIC.dll\TcEnumerateFlows", "ptr", IfcHandle, "ptr", pEnumHandle, "ptr", pFlowCount, "ptr", pBufSize, "ptr", Buffer, "uint")
        return result
    }

;@endregion Methods
}
