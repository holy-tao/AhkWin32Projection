#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Win32.System.Rpc
 * @version v4.0.30319
 */
class Rpc {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_BINDING_INFINITE_TIMEOUT => 10

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_BINDING_MIN_TIMEOUT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_BINDING_DEFAULT_TIMEOUT => 5

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_BINDING_MAX_TIMEOUT => 9

    /**
     * @type {Integer (Int32)}
     */
    static RPC_C_CANCEL_INFINITE_TIMEOUT => -1

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_LISTEN_MAX_CALLS_DEFAULT => 1234

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_PROTSEQ_MAX_REQS_DEFAULT => 10

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_BIND_TO_ALL_NICS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_USE_INTERNET_PORT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_USE_INTRANET_PORT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_DONT_FAIL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_RPCHTTP_USE_LOAD_BALANCE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_TRY_ENFORCE_MAX_CALLS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_MQ_TEMPORARY => 0

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_MQ_PERMANENT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_MQ_CLEAR_ON_OPEN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_MQ_USE_EXISTING_SECURITY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_MQ_AUTHN_LEVEL_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_MQ_AUTHN_LEVEL_PKT_INTEGRITY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_MQ_AUTHN_LEVEL_PKT_PRIVACY => 16

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_MQ_EXPRESS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_MQ_RECOVERABLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_MQ_JOURNAL_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_MQ_JOURNAL_DEADLETTER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_MQ_JOURNAL_ALWAYS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_OPT_MQ_DELIVERY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_OPT_MQ_PRIORITY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_OPT_MQ_JOURNAL => 3

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_OPT_MQ_ACKNOWLEDGE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_OPT_MQ_AUTHN_SERVICE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_OPT_MQ_AUTHN_LEVEL => 6

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_OPT_MQ_TIME_TO_REACH_QUEUE => 7

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_OPT_MQ_TIME_TO_BE_RECEIVED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_OPT_BINDING_NONCAUSAL => 9

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_OPT_SECURITY_CALLBACK => 10

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_OPT_UNIQUE_BINDING => 11

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_OPT_MAX_OPTIONS => 12

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_OPT_CALL_TIMEOUT => 12

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_OPT_DONT_LINGER => 13

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_OPT_TRANS_SEND_BUFFER_SIZE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_OPT_TRUST_PEER => 14

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_OPT_ASYNC_BLOCK => 15

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_OPT_OPTIMIZE_TIME => 16

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_FULL_CERT_CHAIN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_STATS_CALLS_IN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_STATS_CALLS_OUT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_STATS_PKTS_IN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_STATS_PKTS_OUT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_AUTHN_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_AUTHN_DCE_PRIVATE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_AUTHN_DCE_PUBLIC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_AUTHN_DEC_PUBLIC => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_AUTHN_GSS_NEGOTIATE => 9

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_AUTHN_WINNT => 10

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_AUTHN_GSS_SCHANNEL => 14

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_AUTHN_GSS_KERBEROS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_AUTHN_DPA => 17

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_AUTHN_MSN => 18

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_AUTHN_DIGEST => 21

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_AUTHN_KERNEL => 20

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_AUTHN_NEGO_EXTENDER => 30

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_AUTHN_PKU2U => 31

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_AUTHN_LIVE_SSP => 32

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_AUTHN_LIVEXP_SSP => 35

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_AUTHN_CLOUD_AP => 36

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_AUTHN_MSONLINE => 82

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_AUTHN_MQ => 100

    /**
     * @type {Integer (Int32)}
     */
    static RPC_C_AUTHN_DEFAULT => -1

    /**
     * @type {Integer (Int32)}
     */
    static RPC_C_SECURITY_QOS_VERSION => 1

    /**
     * @type {Integer (Int32)}
     */
    static RPC_C_SECURITY_QOS_VERSION_1 => 1

    /**
     * @type {Integer (Int32)}
     */
    static RPC_C_SECURITY_QOS_VERSION_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_HTTP_AUTHN_SCHEME_BASIC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_HTTP_AUTHN_SCHEME_NTLM => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_HTTP_AUTHN_SCHEME_PASSPORT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_HTTP_AUTHN_SCHEME_DIGEST => 8

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_HTTP_AUTHN_SCHEME_NEGOTIATE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_HTTP_AUTHN_SCHEME_CERT => 65536

    /**
     * @type {Integer (Int32)}
     */
    static RPC_C_SECURITY_QOS_VERSION_3 => 3

    /**
     * @type {Integer (Int32)}
     */
    static RPC_C_SECURITY_QOS_VERSION_4 => 4

    /**
     * @type {Integer (Int32)}
     */
    static RPC_C_SECURITY_QOS_VERSION_5 => 5

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_PROTSEQ_TCP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_PROTSEQ_NMP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_PROTSEQ_LRPC => 3

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_PROTSEQ_HTTP => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_BHT_OBJECT_UUID_VALID => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_BHO_EXCLUSIVE_AND_GUARANTEED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_AUTHZ_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_AUTHZ_NAME => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_AUTHZ_DCE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_AUTHZ_DEFAULT => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static DCE_C_ERROR_STRING_LEN => 256

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_EP_ALL_ELTS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_EP_MATCH_BY_IF => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_EP_MATCH_BY_OBJ => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_EP_MATCH_BY_BOTH => 3

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_VERS_ALL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_VERS_COMPATIBLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_VERS_EXACT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_VERS_MAJOR_ONLY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_VERS_UPTO => 5

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_MGMT_INQ_IF_IDS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_MGMT_INQ_PRINC_NAME => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_MGMT_INQ_STATS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_MGMT_IS_SERVER_LISTEN => 3

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_MGMT_STOP_SERVER_LISTEN => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_PARM_MAX_PACKET_LENGTH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_PARM_BUFFER_LENGTH => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_IF_AUTOLISTEN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_IF_OLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_IF_ALLOW_UNKNOWN_AUTHORITY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_IF_ALLOW_SECURE_ONLY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_IF_ALLOW_CALLBACKS_WITH_NO_AUTH => 16

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_IF_ALLOW_LOCAL_ONLY => 32

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_IF_SEC_NO_CACHE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_IF_SEC_CACHE_PER_PROC => 128

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_IF_ASYNC_CALLBACK => 256

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_FW_IF_FLAG_DCOM => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_NOTIFY_ON_SEND_COMPLETE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MaxNumberOfEEInfoParams => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_EEINFO_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EEInfoPreviousRecordsMissing => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EEInfoNextRecordsMissing => 2

    /**
     * @type {Integer (UInt32)}
     */
    static EEInfoUseFileTime => 4

    /**
     * @type {Integer (UInt32)}
     */
    static EEInfoGCCOM => 11

    /**
     * @type {Integer (UInt32)}
     */
    static EEInfoGCFRS => 12

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_CALL_ATTRIBUTES_VERSION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_QUERY_SERVER_PRINCIPAL_NAME => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_QUERY_CLIENT_PRINCIPAL_NAME => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_QUERY_CALL_LOCAL_ADDRESS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_QUERY_CLIENT_PID => 16

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_QUERY_IS_CLIENT_LOCAL => 32

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_QUERY_NO_AUTH_REQUIRED => 64

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_QUERY_CLIENT_ID => 128

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_CALL_STATUS_CANCELLED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_CALL_STATUS_DISCONNECTED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_CONTEXT_HANDLE_DEFAULT_FLAGS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_CONTEXT_HANDLE_FLAGS => 805306368

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_CONTEXT_HANDLE_SERIALIZE => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_CONTEXT_HANDLE_DONT_SERIALIZE => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_TYPE_STRICT_CONTEXT_HANDLE => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_TYPE_DISCONNECT_EVENT_CONTEXT_HANDLE => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_NCA_FLAGS_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_NCA_FLAGS_IDEMPOTENT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_NCA_FLAGS_BROADCAST => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_NCA_FLAGS_MAYBE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RPCFLG_HAS_GUARANTEE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static RPCFLG_WINRT_REMOTE_ASYNC => 32

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_BUFFER_COMPLETE => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_BUFFER_PARTIAL => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_BUFFER_EXTRA => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_BUFFER_ASYNC => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_BUFFER_NONOTIFY => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static RPCFLG_MESSAGE => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static RPCFLG_AUTO_COMPLETE => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static RPCFLG_LOCAL_CALL => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static RPCFLG_INPUT_SYNCHRONOUS => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static RPCFLG_ASYNCHRONOUS => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static RPCFLG_NON_NDR => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static RPCFLG_HAS_MULTI_SYNTAXES => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static RPCFLG_HAS_CALLBACK => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static RPCFLG_ACCESSIBILITY_BIT1 => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static RPCFLG_ACCESSIBILITY_BIT2 => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static RPCFLG_ACCESS_LOCAL => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static NDR_CUSTOM_OR_DEFAULT_ALLOCATOR => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static NDR_DEFAULT_ALLOCATOR => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static RPCFLG_NDR64_CONTAINS_ARM_LAYOUT => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static RPCFLG_SENDER_WAITING_FOR_REPLY => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_FLAGS_VALID_BIT => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static NT351_INTERFACE_SIZE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_INTERFACE_HAS_PIPES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_SYSTEM_HANDLE_FREE_UNRETRIEVED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_SYSTEM_HANDLE_FREE_RETRIEVED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_SYSTEM_HANDLE_FREE_ALL => 3

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_SYSTEM_HANDLE_FREE_ERROR_ON_CLOSE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TRANSPORT_TYPE_CN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TRANSPORT_TYPE_DG => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TRANSPORT_TYPE_LPC => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TRANSPORT_TYPE_WMSG => 8

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_P_ADDR_FORMAT_TCP_IPV4 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_P_ADDR_FORMAT_TCP_IPV6 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_OPT_SESSION_ID => 6

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_OPT_COOKIE_AUTH => 7

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_OPT_RESOURCE_TYPE_UUID => 8

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_PROXY_CONNECTION_TYPE_IN_PROXY => 0

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_PROXY_CONNECTION_TYPE_OUT_PROXY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_OPT_PRIVATE_SUPPRESS_WAKE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_OPT_PRIVATE_DO_NOT_DISTURB => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_OPT_PRIVATE_BREAK_ON_SUSPEND => 3

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_PROFILE_DEFAULT_ELT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_PROFILE_ALL_ELT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_PROFILE_ALL_ELTS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_PROFILE_MATCH_BY_IF => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_PROFILE_MATCH_BY_MBR => 3

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_PROFILE_MATCH_BY_BOTH => 4

    /**
     * @type {Integer (Int32)}
     */
    static RPC_C_NS_DEFAULT_EXP_AGE => -1

    /**
     * @type {Integer (UInt32)}
     */
    static TARGET_IS_NT1012_OR_LATER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TARGET_IS_NT102_OR_LATER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TARGET_IS_NT100_OR_LATER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TARGET_IS_NT63_OR_LATER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TARGET_IS_NT62_OR_LATER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TARGET_IS_NT61_OR_LATER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TARGET_IS_NT60_OR_LATER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TARGET_IS_NT51_OR_LATER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TARGET_IS_NT50_OR_LATER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TARGET_IS_NT40_OR_LATER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TARGET_IS_NT351_OR_WIN95_OR_LATER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static cbNDRContext => 20

    /**
     * @type {Integer (UInt32)}
     */
    static USER_CALL_IS_ASYNC => 256

    /**
     * @type {Integer (UInt32)}
     */
    static USER_CALL_NEW_CORRELATION_DESC => 512

    /**
     * @type {Integer (Int32)}
     */
    static MIDL_WINRT_TYPE_SERIALIZATION_INFO_CURRENT_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static USER_MARSHAL_FC_BYTE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static USER_MARSHAL_FC_CHAR => 2

    /**
     * @type {Integer (UInt32)}
     */
    static USER_MARSHAL_FC_SMALL => 3

    /**
     * @type {Integer (UInt32)}
     */
    static USER_MARSHAL_FC_USMALL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static USER_MARSHAL_FC_WCHAR => 5

    /**
     * @type {Integer (UInt32)}
     */
    static USER_MARSHAL_FC_SHORT => 6

    /**
     * @type {Integer (UInt32)}
     */
    static USER_MARSHAL_FC_USHORT => 7

    /**
     * @type {Integer (UInt32)}
     */
    static USER_MARSHAL_FC_LONG => 8

    /**
     * @type {Integer (UInt32)}
     */
    static USER_MARSHAL_FC_ULONG => 9

    /**
     * @type {Integer (UInt32)}
     */
    static USER_MARSHAL_FC_FLOAT => 10

    /**
     * @type {Integer (UInt32)}
     */
    static USER_MARSHAL_FC_HYPER => 11

    /**
     * @type {Integer (UInt32)}
     */
    static USER_MARSHAL_FC_DOUBLE => 12

    /**
     * @type {Integer (UInt32)}
     */
    static INVALID_FRAGMENT_ID => 0

    /**
     * @type {Integer (UInt32)}
     */
    static NDR64_FC_EXPLICIT_HANDLE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static NDR64_FC_BIND_GENERIC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDR64_FC_BIND_PRIMITIVE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDR64_FC_AUTO_HANDLE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static NDR64_FC_CALLBACK_HANDLE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NDR64_FC_NO_HANDLE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static __RPCPROXY_H_VERSION__ => 477

    /**
     * @type {Integer (Int32)}
     */
    static MidlInterceptionInfoVersionOne => 1

    /**
     * @type {Integer (Int32)}
     */
    static MidlWinrtTypeSerializationInfoVersionOne => 1
;@endregion Constants

;@region Methods
    /**
     * The IUnknown_QueryInterface_Proxy function implements the QueryInterface method for all interface proxies.
     * @param {Pointer<IUnknown>} This_R 
     * @param {Pointer<Guid>} riid IID of the interface to be queried.
     * @param {Pointer<Void>} ppvObject Address to a pointer whose interface is queried or null when an interface is not supported.
     * @returns {HRESULT} Returns S_OK on success.
     * @see https://docs.microsoft.com/windows/win32/api//unknwnbase/nf-unknwnbase-iunknown_queryinterface_proxy
     * @since windows5.0
     */
    static IUnknown_QueryInterface_Proxy(This_R, riid, ppvObject) {
        result := DllCall("RPCRT4.dll\IUnknown_QueryInterface_Proxy", "ptr", This_R, "ptr", riid, "ptr", ppvObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The IUnknown_AddRef_Proxy function implements the AddRef method for all interface proxies.
     * @param {Pointer<IUnknown>} This_R 
     * @returns {Integer} Returns an integer from 1 to <i>n</i>, indicating the value of the new reference count.
     * @see https://docs.microsoft.com/windows/win32/api//unknwnbase/nf-unknwnbase-iunknown_addref_proxy
     * @since windows5.0
     */
    static IUnknown_AddRef_Proxy(This_R) {
        result := DllCall("RPCRT4.dll\IUnknown_AddRef_Proxy", "ptr", This_R, "uint")
        return result
    }

    /**
     * The IUnknown_Release_Proxy function implements the Release method for all interface proxies.
     * @param {Pointer<IUnknown>} This_R 
     * @returns {Integer} Returns an integer from 1 to <i>n</i>, indicating the value of the new reference count.
     * @see https://docs.microsoft.com/windows/win32/api//unknwnbase/nf-unknwnbase-iunknown_release_proxy
     * @since windows5.0
     */
    static IUnknown_Release_Proxy(This_R) {
        result := DllCall("RPCRT4.dll\IUnknown_Release_Proxy", "ptr", This_R, "uint")
        return result
    }

    /**
     * The RpcBindingCopy function copies binding information and creates a new binding handle.
     * @param {Pointer<Void>} SourceBinding Server binding handle whose referenced binding information is copied.
     * @param {Pointer<Void>} DestinationBinding Returns a pointer to the server binding handle that refers to the copied binding information.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The binding handle was invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_WRONG_KIND_OF_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This was the wrong kind of binding for the operation.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcbindingcopy
     * @since windows5.0
     */
    static RpcBindingCopy(SourceBinding, DestinationBinding) {
        result := DllCall("RPCRT4.dll\RpcBindingCopy", "ptr", SourceBinding, "ptr", DestinationBinding, "int")
        return result
    }

    /**
     * The RpcBindingFree function releases binding-handle resources.
     * @param {Pointer<Void>} Binding Pointer to the server binding to be freed.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The binding handle was invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_WRONG_KIND_OF_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This was the wrong kind of binding for the operation.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcbindingfree
     * @since windows5.0
     */
    static RpcBindingFree(Binding) {
        result := DllCall("RPCRT4.dll\RpcBindingFree", "ptr", Binding, "int")
        return result
    }

    /**
     * The RpcBindingSetOption function enables client applications to specify message-queuing options on a binding handle.
     * @param {Pointer<Void>} hBinding Server binding to modify.
     * @param {Integer} option Binding property to modify. For a list of binding options and their possible values, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Rpc/binding-option-constants">Binding Option Constants</a>. See Remarks for information on the RPC Call time-out feature.
     * @param {Pointer} optionValue New value for the binding property. See Remarks.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_CANNOT_SUPPORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function is not supported for either the operating system or the transport. Note that calling 
     * <b>RpcBindingSetOption</b> on binding handles that use any protocol sequence other than <b>ncacn_*</b> will fail and return this value.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcbindingsetoption
     * @since windows5.0
     */
    static RpcBindingSetOption(hBinding, option, optionValue) {
        result := DllCall("RPCRT4.dll\RpcBindingSetOption", "ptr", hBinding, "uint", option, "ptr", optionValue, "int")
        return result
    }

    /**
     * RPC client processes use RpcBindingInqOption to determine current values of the binding options for a given binding handle.
     * @param {Pointer<Void>} hBinding Server binding about which to determine binding-option values.
     * @param {Integer} option Binding handle property to inquire about.
     * @param {Pointer<UIntPtr>} pOptionValue Memory location to place the value for the specified <i>Option</i>
     * 
     * <div class="alert"><b>Note</b>  For a list of binding options and their possible values, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Rpc/binding-option-constants">Binding Option Constants</a>.</div>
     * <div> </div>
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_CANNOT_SUPPORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function is not supported for either the operating system or the transport.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcbindinginqoption
     * @since windows5.0
     */
    static RpcBindingInqOption(hBinding, option, pOptionValue) {
        result := DllCall("RPCRT4.dll\RpcBindingInqOption", "ptr", hBinding, "uint", option, "ptr*", pOptionValue, "int")
        return result
    }

    /**
     * Returns a binding handle from a string representation of a binding handle.
     * @param {PSTR} StringBinding Pointer to a string representation of a binding handle.
     * @param {Pointer<Void>} Binding Returns a pointer to the server binding handle.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_STRING_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The string binding is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_PROTSEQ_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Protocol sequence not supported on this host.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_RPC_PROTSEQ</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The protocol sequence is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_ENDPOINT_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The endpoint format is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_STRING_TOO_LONG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * String too long.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_NET_ADDR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network address is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_ARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument was not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_NAF_ID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network address family identifier is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcbindingfromstringbindinga
     * @since windows5.0
     */
    static RpcBindingFromStringBindingA(StringBinding, Binding) {
        StringBinding := StringBinding is String ? StrPtr(StringBinding) : StringBinding

        result := DllCall("RPCRT4.dll\RpcBindingFromStringBindingA", "ptr", StringBinding, "ptr", Binding, "int")
        return result
    }

    /**
     * Returns a binding handle from a string representation of a binding handle.
     * @param {PWSTR} StringBinding Pointer to a string representation of a binding handle.
     * @param {Pointer<Void>} Binding Returns a pointer to the server binding handle.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_STRING_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The string binding is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_PROTSEQ_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Protocol sequence not supported on this host.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_RPC_PROTSEQ</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The protocol sequence is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_ENDPOINT_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The endpoint format is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_STRING_TOO_LONG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * String too long.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_NET_ADDR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network address is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_ARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument was not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_NAF_ID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network address family identifier is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcbindingfromstringbindingw
     * @since windows5.0
     */
    static RpcBindingFromStringBindingW(StringBinding, Binding) {
        StringBinding := StringBinding is String ? StrPtr(StringBinding) : StringBinding

        result := DllCall("RPCRT4.dll\RpcBindingFromStringBindingW", "ptr", StringBinding, "ptr", Binding, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} ContextHandle 
     * @param {Pointer<Void>} Binding 
     * @returns {Integer} 
     */
    static RpcSsGetContextBinding(ContextHandle, Binding) {
        result := DllCall("RPCRT4.dll\RpcSsGetContextBinding", "ptr", ContextHandle, "ptr", Binding, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Binding 
     * @param {Pointer<UInt32>} MaxCalls 
     * @returns {Integer} 
     */
    static RpcBindingInqMaxCalls(Binding, MaxCalls) {
        result := DllCall("RPCRT4.dll\RpcBindingInqMaxCalls", "ptr", Binding, "uint*", MaxCalls, "int")
        return result
    }

    /**
     * The RpcBindingInqObject function returns the object UUID from a binding handle.
     * @param {Pointer<Void>} Binding Client or server binding handle.
     * @param {Pointer<Guid>} ObjectUuid Returns a pointer to the object 
     * <a href="https://msdn.microsoft.com/">UUID</a> found in the <i>Binding</i> parameter. <i>ObjectUuid</i> is a unique identifier of an object to which a remote procedure call can be made.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The binding handle was invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcbindinginqobject
     * @since windows5.0
     */
    static RpcBindingInqObject(Binding, ObjectUuid) {
        result := DllCall("RPCRT4.dll\RpcBindingInqObject", "ptr", Binding, "ptr", ObjectUuid, "int")
        return result
    }

    /**
     * The RpcBindingReset function resets a binding handle so that the host is specified but the server on that host is unspecified.
     * @param {Pointer<Void>} Binding Server binding handle to reset.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The binding handle was invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_WRONG_KIND_OF_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This was the wrong kind of binding for the operation.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcbindingreset
     * @since windows5.0
     */
    static RpcBindingReset(Binding) {
        result := DllCall("RPCRT4.dll\RpcBindingReset", "ptr", Binding, "int")
        return result
    }

    /**
     * The RpcBindingSetObject function sets the object UUID value in a binding handle.
     * @param {Pointer<Void>} Binding Server binding into which the <i>ObjectUuid</i> is set.
     * @param {Pointer<Guid>} ObjectUuid Pointer to the 
     * <a href="https://docs.microsoft.com/windows/win32/rpc/rpcdce/ns-rpcdce-uuid">UUID</a> of the object serviced by the server specified in the <i>Binding</i> parameter. <i>ObjectUuid</i> is a unique identifier of an object to which a remote procedure call can be made.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The binding handle was invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_WRONG_KIND_OF_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This was the wrong kind of binding for the operation.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcbindingsetobject
     * @since windows5.0
     */
    static RpcBindingSetObject(Binding, ObjectUuid) {
        result := DllCall("RPCRT4.dll\RpcBindingSetObject", "ptr", Binding, "ptr", ObjectUuid, "int")
        return result
    }

    /**
     * The RpcMgmtInqDefaultProtectLevel function returns the default authentication level for an authentication service.
     * @param {Integer} AuthnSvc Authentication service for which to return the default authentication level. Valid values are the constant for any valid security provider.
     * @param {Pointer<UInt32>} AuthnLevel Returns the default authentication level for the specified authentication service. The authentication level determines the degree to which authenticated communications between the client and server are protected. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Rpc/authentication-level-constants">Authentication Level Constants</a>.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_UNKNOWN_AUTH_SERVICE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unknown authentication service.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcmgmtinqdefaultprotectlevel
     * @since windows5.0
     */
    static RpcMgmtInqDefaultProtectLevel(AuthnSvc, AuthnLevel) {
        result := DllCall("RPCRT4.dll\RpcMgmtInqDefaultProtectLevel", "uint", AuthnSvc, "uint*", AuthnLevel, "int")
        return result
    }

    /**
     * The RpcBindingToStringBinding function returns a string representation of a binding handle.
     * @param {Pointer<Void>} Binding Client or server binding handle to convert to a string representation of a binding handle.
     * @param {Pointer<PSTR>} StringBinding Returns a pointer to a pointer to the string representation of the binding handle specified in the <i>Binding</i> parameter. 
     * 
     * 
     * 
     * 
     * Specify a null value to prevent 
     * <b>RpcBindingToStringBinding</b> from returning the <i>StringBinding</i> parameter. In this case, the application does not call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcstringfree">RpcStringFree</a> function.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The binding handle was invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcbindingtostringbindinga
     * @since windows5.0
     */
    static RpcBindingToStringBindingA(Binding, StringBinding) {
        result := DllCall("RPCRT4.dll\RpcBindingToStringBindingA", "ptr", Binding, "ptr", StringBinding, "int")
        return result
    }

    /**
     * The RpcBindingToStringBinding function returns a string representation of a binding handle.
     * @param {Pointer<Void>} Binding Client or server binding handle to convert to a string representation of a binding handle.
     * @param {Pointer<PWSTR>} StringBinding Returns a pointer to a pointer to the string representation of the binding handle specified in the <i>Binding</i> parameter. 
     * 
     * 
     * 
     * 
     * Specify a null value to prevent 
     * <b>RpcBindingToStringBinding</b> from returning the <i>StringBinding</i> parameter. In this case, the application does not call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcstringfree">RpcStringFree</a> function.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The binding handle was invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcbindingtostringbindingw
     * @since windows5.0
     */
    static RpcBindingToStringBindingW(Binding, StringBinding) {
        result := DllCall("RPCRT4.dll\RpcBindingToStringBindingW", "ptr", Binding, "ptr", StringBinding, "int")
        return result
    }

    /**
     * The RpcBindingVectorFree function frees the binding handles contained in the vector and the vector itself.
     * @param {Pointer<RPC_BINDING_VECTOR>} BindingVector Pointer to a pointer to a vector of server binding handles. On return, the pointer is set to <b>NULL</b>.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_ARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument was invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The binding handle was invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_WRONG_KIND_OF_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This was the wrong kind of binding for the operation.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcbindingvectorfree
     * @since windows5.0
     */
    static RpcBindingVectorFree(BindingVector) {
        result := DllCall("RPCRT4.dll\RpcBindingVectorFree", "ptr", BindingVector, "int")
        return result
    }

    /**
     * The RpcStringBindingCompose function creates a string binding handle.
     * @param {PSTR} ObjUuid Pointer to a <b>null</b>-terminated string representation of an object 
     * <a href="https://msdn.microsoft.com/">UUID</a>. For example, the string 6B29FC40-CA47-1067-B31D-00DD010662DA represents a valid UUID.
     * @param {PSTR} ProtSeq Pointer to a <b>null</b>-terminated string representation of a protocol sequence. See Note.
     * @param {PSTR} NetworkAddr Pointer to a <b>null</b>-terminated string representation of a network address. The network-address format is associated with the protocol sequence. See Note.
     * @param {PSTR} Endpoint Pointer to a <b>null</b>-terminated string representation of an endpoint. The endpoint format and content are associated with the protocol sequence. For example, the endpoint associated with the protocol sequence <b>ncacn_np</b> is a pipe name in the format \pipe\pipename. See Note.
     * @param {PSTR} Options Pointer to a <b>null</b>-terminated string representation of network options. The option string is associated with the protocol sequence. See Note.
     * @param {Pointer<PSTR>} StringBinding Returns a pointer to a pointer to a <b>null</b>-terminated string representation of a binding handle. 
     * 
     * 
     * 
     * 
     * Specify a <b>NULL</b> value to prevent 
     * <b>RpcStringBindingCompose</b> from returning the <i>StringBinding</i> parameter. In this case, the application does not call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcstringfree">RpcStringFree</a>. See Note.
     * 
     * <div class="alert"><b>Note</b>  For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Rpc/string-binding">String Binding</a>.</div>
     * <div> </div>
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_STRING_UUID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The string representation of the UUID is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcstringbindingcomposea
     * @since windows5.0
     */
    static RpcStringBindingComposeA(ObjUuid, ProtSeq, NetworkAddr, Endpoint, Options, StringBinding) {
        ObjUuid := ObjUuid is String ? StrPtr(ObjUuid) : ObjUuid
        ProtSeq := ProtSeq is String ? StrPtr(ProtSeq) : ProtSeq
        NetworkAddr := NetworkAddr is String ? StrPtr(NetworkAddr) : NetworkAddr
        Endpoint := Endpoint is String ? StrPtr(Endpoint) : Endpoint
        Options := Options is String ? StrPtr(Options) : Options

        result := DllCall("RPCRT4.dll\RpcStringBindingComposeA", "ptr", ObjUuid, "ptr", ProtSeq, "ptr", NetworkAddr, "ptr", Endpoint, "ptr", Options, "ptr", StringBinding, "int")
        return result
    }

    /**
     * The RpcStringBindingCompose function creates a string binding handle.
     * @param {PWSTR} ObjUuid Pointer to a <b>null</b>-terminated string representation of an object 
     * <a href="https://msdn.microsoft.com/">UUID</a>. For example, the string 6B29FC40-CA47-1067-B31D-00DD010662DA represents a valid UUID.
     * @param {PWSTR} ProtSeq Pointer to a <b>null</b>-terminated string representation of a protocol sequence. See Note.
     * @param {PWSTR} NetworkAddr Pointer to a <b>null</b>-terminated string representation of a network address. The network-address format is associated with the protocol sequence. See Note.
     * @param {PWSTR} Endpoint Pointer to a <b>null</b>-terminated string representation of an endpoint. The endpoint format and content are associated with the protocol sequence. For example, the endpoint associated with the protocol sequence <b>ncacn_np</b> is a pipe name in the format \pipe\pipename. See Note.
     * @param {PWSTR} Options Pointer to a <b>null</b>-terminated string representation of network options. The option string is associated with the protocol sequence. See Note.
     * @param {Pointer<PWSTR>} StringBinding Returns a pointer to a pointer to a <b>null</b>-terminated string representation of a binding handle. 
     * 
     * 
     * 
     * 
     * Specify a <b>NULL</b> value to prevent 
     * <b>RpcStringBindingCompose</b> from returning the <i>StringBinding</i> parameter. In this case, the application does not call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcstringfree">RpcStringFree</a>. See Note.
     * 
     * <div class="alert"><b>Note</b>  For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Rpc/string-binding">String Binding</a>.</div>
     * <div> </div>
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_STRING_UUID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The string representation of the UUID is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcstringbindingcomposew
     * @since windows5.0
     */
    static RpcStringBindingComposeW(ObjUuid, ProtSeq, NetworkAddr, Endpoint, Options, StringBinding) {
        ObjUuid := ObjUuid is String ? StrPtr(ObjUuid) : ObjUuid
        ProtSeq := ProtSeq is String ? StrPtr(ProtSeq) : ProtSeq
        NetworkAddr := NetworkAddr is String ? StrPtr(NetworkAddr) : NetworkAddr
        Endpoint := Endpoint is String ? StrPtr(Endpoint) : Endpoint
        Options := Options is String ? StrPtr(Options) : Options

        result := DllCall("RPCRT4.dll\RpcStringBindingComposeW", "ptr", ObjUuid, "ptr", ProtSeq, "ptr", NetworkAddr, "ptr", Endpoint, "ptr", Options, "ptr", StringBinding, "int")
        return result
    }

    /**
     * The RpcStringBindingParse function returns the object UUID part and the address parts of a string binding as separate strings.
     * @param {PSTR} StringBinding Pointer to a <b>null</b>-terminated string representation of a binding.
     * @param {Pointer<PSTR>} ObjUuid Returns a pointer to a pointer to a <b>null</b>-terminated string representation of an object 
     * <a href="https://msdn.microsoft.com/">UUID</a>. 
     * 
     * 
     * 
     * 
     * Specify a <b>NULL</b> value to prevent 
     * <b>RpcStringBindingParse</b> from returning the <i>ObjectUuid</i> parameter. In this case, the application does not call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcstringfree">RpcStringFree</a>.
     * @param {Pointer<PSTR>} Protseq Returns a pointer to a pointer to a <b>null</b>-terminated string representation of a protocol sequence. For a list of Microsoft RPC supported protocol sequences, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Rpc/string-binding">String Binding</a>. 
     * 
     * 
     * 
     * 
     * Specify a <b>NULL</b> value to prevent 
     * <b>RpcStringBindingParse</b> from returning the <i>ProtSeq</i> parameter. In this case, the application does not call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcstringfree">RpcStringFree</a>.
     * @param {Pointer<PSTR>} NetworkAddr Returns a pointer to a pointer to a <b>null</b>-terminated string representation of a network address. Specify a <b>NULL</b> value to prevent 
     * <b>RpcStringBindingParse</b> from returning the <i>NetworkAddr</i> parameter. In this case, the application does not call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcstringfree">RpcStringFree</a>.
     * @param {Pointer<PSTR>} Endpoint Returns a pointer to a pointer to a <b>null</b>-terminated string representation of an endpoint. Specify a <b>NULL</b> value to prevent 
     * <b>RpcStringBindingParse</b> from returning the <i>EndPoint</i> parameter. In this case, the application does not call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcstringfree">RpcStringFree</a>.
     * @param {Pointer<PSTR>} NetworkOptions Returns a pointer to a pointer to a <b>null</b>-terminated string representation of network options. 
     * 
     * 
     * 
     * 
     * Specify a <b>NULL</b> value to prevent 
     * <b>RpcStringBindingParse</b> from returning the <i>NetworkOptions</i> parameter. In this case, the application does not call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcstringfree">RpcStringFree</a>.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_STRING_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The string binding is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcstringbindingparsea
     * @since windows5.0
     */
    static RpcStringBindingParseA(StringBinding, ObjUuid, Protseq, NetworkAddr, Endpoint, NetworkOptions) {
        StringBinding := StringBinding is String ? StrPtr(StringBinding) : StringBinding

        result := DllCall("RPCRT4.dll\RpcStringBindingParseA", "ptr", StringBinding, "ptr", ObjUuid, "ptr", Protseq, "ptr", NetworkAddr, "ptr", Endpoint, "ptr", NetworkOptions, "int")
        return result
    }

    /**
     * The RpcStringBindingParse function returns the object UUID part and the address parts of a string binding as separate strings.
     * @param {PWSTR} StringBinding Pointer to a <b>null</b>-terminated string representation of a binding.
     * @param {Pointer<PWSTR>} ObjUuid Returns a pointer to a pointer to a <b>null</b>-terminated string representation of an object 
     * <a href="https://msdn.microsoft.com/">UUID</a>. 
     * 
     * 
     * 
     * 
     * Specify a <b>NULL</b> value to prevent 
     * <b>RpcStringBindingParse</b> from returning the <i>ObjectUuid</i> parameter. In this case, the application does not call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcstringfree">RpcStringFree</a>.
     * @param {Pointer<PWSTR>} Protseq Returns a pointer to a pointer to a <b>null</b>-terminated string representation of a protocol sequence. For a list of Microsoft RPC supported protocol sequences, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Rpc/string-binding">String Binding</a>. 
     * 
     * 
     * 
     * 
     * Specify a <b>NULL</b> value to prevent 
     * <b>RpcStringBindingParse</b> from returning the <i>ProtSeq</i> parameter. In this case, the application does not call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcstringfree">RpcStringFree</a>.
     * @param {Pointer<PWSTR>} NetworkAddr Returns a pointer to a pointer to a <b>null</b>-terminated string representation of a network address. Specify a <b>NULL</b> value to prevent 
     * <b>RpcStringBindingParse</b> from returning the <i>NetworkAddr</i> parameter. In this case, the application does not call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcstringfree">RpcStringFree</a>.
     * @param {Pointer<PWSTR>} Endpoint Returns a pointer to a pointer to a <b>null</b>-terminated string representation of an endpoint. Specify a <b>NULL</b> value to prevent 
     * <b>RpcStringBindingParse</b> from returning the <i>EndPoint</i> parameter. In this case, the application does not call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcstringfree">RpcStringFree</a>.
     * @param {Pointer<PWSTR>} NetworkOptions Returns a pointer to a pointer to a <b>null</b>-terminated string representation of network options. 
     * 
     * 
     * 
     * 
     * Specify a <b>NULL</b> value to prevent 
     * <b>RpcStringBindingParse</b> from returning the <i>NetworkOptions</i> parameter. In this case, the application does not call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcstringfree">RpcStringFree</a>.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_STRING_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The string binding is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcstringbindingparsew
     * @since windows5.0
     */
    static RpcStringBindingParseW(StringBinding, ObjUuid, Protseq, NetworkAddr, Endpoint, NetworkOptions) {
        StringBinding := StringBinding is String ? StrPtr(StringBinding) : StringBinding

        result := DllCall("RPCRT4.dll\RpcStringBindingParseW", "ptr", StringBinding, "ptr", ObjUuid, "ptr", Protseq, "ptr", NetworkAddr, "ptr", Endpoint, "ptr", NetworkOptions, "int")
        return result
    }

    /**
     * The RpcStringFree function frees a character string allocated by the RPC run-time library.
     * @param {Pointer<PSTR>} String Pointer to a pointer to the character string to free.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcstringfreea
     * @since windows5.0
     */
    static RpcStringFreeA(String) {
        result := DllCall("RPCRT4.dll\RpcStringFreeA", "ptr", String, "int")
        return result
    }

    /**
     * The RpcStringFree function frees a character string allocated by the RPC run-time library.
     * @param {Pointer<PWSTR>} String Pointer to a pointer to the character string to free.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcstringfreew
     * @since windows5.0
     */
    static RpcStringFreeW(String) {
        result := DllCall("RPCRT4.dll\RpcStringFreeW", "ptr", String, "int")
        return result
    }

    /**
     * The RpcIfInqId function returns the interface-identification part of an interface specification.
     * @param {Pointer<Void>} RpcIfHandle Stub-generated structure specifying the interface to query.
     * @param {Pointer<RPC_IF_ID>} RpcIfId Returns a pointer to the interface identification. The application provides memory for the returned data.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcifinqid
     * @since windows5.0
     */
    static RpcIfInqId(RpcIfHandle, RpcIfId) {
        result := DllCall("RPCRT4.dll\RpcIfInqId", "ptr", RpcIfHandle, "ptr", RpcIfId, "int")
        return result
    }

    /**
     * The RpcNetworkIsProtseqValid function tells whether the specified protocol sequence is supported by both the RPC run-time library and the operating system. Server applications often use RpcNetworkInqProtseqs.
     * @param {PSTR} Protseq Pointer to a string identifier of the protocol sequence to be checked. 
     * 
     * 
     * 
     * 
     * If the <i>Protseq</i> parameter is not a valid protocol sequence string, 
     * <b>RpcNetworkIsProtseqValid</b> returns RPC_S_INVALID_RPC_PROTSEQ.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.; protocol sequence supported
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_PROTSEQ_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Protocol sequence not supported on this host.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_RPC_PROTSEQ</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid protocol sequence.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcnetworkisprotseqvalida
     * @since windows5.0
     */
    static RpcNetworkIsProtseqValidA(Protseq) {
        Protseq := Protseq is String ? StrPtr(Protseq) : Protseq

        result := DllCall("RPCRT4.dll\RpcNetworkIsProtseqValidA", "ptr", Protseq, "int")
        return result
    }

    /**
     * The RpcNetworkIsProtseqValid function tells whether the specified protocol sequence is supported by both the RPC run-time library and the operating system. Server applications often use RpcNetworkInqProtseqs.
     * @param {PWSTR} Protseq Pointer to a string identifier of the protocol sequence to be checked. 
     * 
     * 
     * 
     * 
     * If the <i>Protseq</i> parameter is not a valid protocol sequence string, 
     * <b>RpcNetworkIsProtseqValid</b> returns RPC_S_INVALID_RPC_PROTSEQ.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.; protocol sequence supported
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_PROTSEQ_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Protocol sequence not supported on this host.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_RPC_PROTSEQ</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid protocol sequence.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcnetworkisprotseqvalidw
     * @since windows5.0
     */
    static RpcNetworkIsProtseqValidW(Protseq) {
        Protseq := Protseq is String ? StrPtr(Protseq) : Protseq

        result := DllCall("RPCRT4.dll\RpcNetworkIsProtseqValidW", "ptr", Protseq, "int")
        return result
    }

    /**
     * The RpcMgmtInqComTimeout function returns the binding-communications time-out value in a binding handle.
     * @param {Pointer<Void>} Binding Specifies a binding.
     * @param {Pointer<UInt32>} Timeout Returns a pointer to the time-out value from the <i>Binding</i> parameter.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The binding handle was invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_WRONG_KIND_OF_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This was the wrong kind of binding for the operation.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcmgmtinqcomtimeout
     * @since windows5.0
     */
    static RpcMgmtInqComTimeout(Binding, Timeout) {
        result := DllCall("RPCRT4.dll\RpcMgmtInqComTimeout", "ptr", Binding, "uint*", Timeout, "int")
        return result
    }

    /**
     * The RpcMgmtSetComTimeout function sets the binding-communications time-out value in a binding handle.
     * @param {Pointer<Void>} Binding Server binding handle whose time-out value is set.
     * @param {Integer} Timeout Communications time-out value, from zero to 10. These values are not seconds; they represent a relative amount of time on a scale of zero to 10.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The binding handle was invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_TIMEOUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The time-out value was invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_WRONG_KIND_OF_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This was the wrong kind of binding for the operation.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcmgmtsetcomtimeout
     * @since windows5.0
     */
    static RpcMgmtSetComTimeout(Binding, Timeout) {
        result := DllCall("RPCRT4.dll\RpcMgmtSetComTimeout", "ptr", Binding, "uint", Timeout, "int")
        return result
    }

    /**
     * The RpcMgmtSetCancelTimeout function sets the lower bound on the time to wait before timing out after forwarding a cancel.
     * @param {Integer} Timeout Seconds to wait for a server to acknowledge a cancel command. To specify that a client waits an indefinite amount of time, supply the value RPC_C_CANCEL_INFINITE_TIMEOUT.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_CANNOT_SUPPORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Called from an MS-DOS or Windows 3.<i>x</i> client.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcmgmtsetcanceltimeout
     * @since windows5.0
     */
    static RpcMgmtSetCancelTimeout(Timeout) {
        result := DllCall("RPCRT4.dll\RpcMgmtSetCancelTimeout", "int", Timeout, "int")
        return result
    }

    /**
     * The RpcNetworkInqProtseqs function returns all protocol sequences supported by both the RPC run-time library and the operating system.
     * @param {Pointer<RPC_PROTSEQ_VECTORA>} ProtseqVector Returns a pointer to a pointer to a protocol sequence vector.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NO_PROTSEQS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No supported protocol sequences.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcnetworkinqprotseqsa
     * @since windows5.0
     */
    static RpcNetworkInqProtseqsA(ProtseqVector) {
        result := DllCall("RPCRT4.dll\RpcNetworkInqProtseqsA", "ptr", ProtseqVector, "int")
        return result
    }

    /**
     * The RpcNetworkInqProtseqs function returns all protocol sequences supported by both the RPC run-time library and the operating system.
     * @param {Pointer<RPC_PROTSEQ_VECTORW>} ProtseqVector Returns a pointer to a pointer to a protocol sequence vector.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NO_PROTSEQS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No supported protocol sequences.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcnetworkinqprotseqsw
     * @since windows5.0
     */
    static RpcNetworkInqProtseqsW(ProtseqVector) {
        result := DllCall("RPCRT4.dll\RpcNetworkInqProtseqsW", "ptr", ProtseqVector, "int")
        return result
    }

    /**
     * The RpcObjectInqType function returns the type of an object.
     * @param {Pointer<Guid>} ObjUuid Pointer to the object UUID whose associated type UUID is returned.
     * @param {Pointer<Guid>} TypeUuid Returns a pointer to the type UUID of the <i>ObjUuid</i> parameter. 
     * 
     * 
     * 
     * 
     * Specify a parameter value of <b>NULL</b> to prevent the return of a type UUID. In this way, an application can determine (from the returned status) whether <i>ObjUuid</i> is registered without specifying an output type UUID variable.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OBJECT_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Object not found.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcobjectinqtype
     * @since windows5.0
     */
    static RpcObjectInqType(ObjUuid, TypeUuid) {
        result := DllCall("RPCRT4.dll\RpcObjectInqType", "ptr", ObjUuid, "ptr", TypeUuid, "int")
        return result
    }

    /**
     * The RpcObjectSetInqFn function registers an object-inquiry function. A null value turns off a previously registered object-inquiry function.
     * @param {Pointer<RPC_OBJECT_INQ_FN>} InquiryFn Object-type inquiry function. See 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nc-rpcdce-rpc_object_inq_fn">RPC_OBJECT_INQ_FN</a>. When an application calls 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcobjectinqtype">RpcObjectInqType</a> and the RPC run-time library finds that the specified object is not registered, the run-time library automatically calls 
     * <b>RpcObjectSetInqFn</b> to determine the object's type.
     * @returns {Integer} This function returns the following value.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcobjectsetinqfn
     * @since windows5.0
     */
    static RpcObjectSetInqFn(InquiryFn) {
        result := DllCall("RPCRT4.dll\RpcObjectSetInqFn", "ptr", InquiryFn, "int")
        return result
    }

    /**
     * The RpcObjectSetType function assigns the type of an object.
     * @param {Pointer<Guid>} ObjUuid Pointer to an object UUID to associate with the type UUID in the <i>TypeUuid</i> parameter.
     * @param {Pointer<Guid>} TypeUuid Pointer to the type UUID of the <i>ObjUuid</i> parameter. 
     * 
     * 
     * 
     * 
     * Specify a parameter value of NULL or a nil UUID to reset the object type to the default association of object UUID/nil-type UUID.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_OBJECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_ALREADY_REGISTERED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object is already registered.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OUT_OF_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system is out of memory.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcobjectsettype
     * @since windows5.0
     */
    static RpcObjectSetType(ObjUuid, TypeUuid) {
        result := DllCall("RPCRT4.dll\RpcObjectSetType", "ptr", ObjUuid, "ptr", TypeUuid, "int")
        return result
    }

    /**
     * The RpcProtseqVectorFree function frees the protocol sequences contained in the vector and the vector itself.
     * @param {Pointer<RPC_PROTSEQ_VECTORA>} ProtseqVector Pointer to a pointer to a vector of protocol sequences. On return, the pointer is set to NULL.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcprotseqvectorfreea
     * @since windows5.0
     */
    static RpcProtseqVectorFreeA(ProtseqVector) {
        result := DllCall("RPCRT4.dll\RpcProtseqVectorFreeA", "ptr", ProtseqVector, "int")
        return result
    }

    /**
     * The RpcProtseqVectorFree function frees the protocol sequences contained in the vector and the vector itself.
     * @param {Pointer<RPC_PROTSEQ_VECTORW>} ProtseqVector Pointer to a pointer to a vector of protocol sequences. On return, the pointer is set to NULL.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcprotseqvectorfreew
     * @since windows5.0
     */
    static RpcProtseqVectorFreeW(ProtseqVector) {
        result := DllCall("RPCRT4.dll\RpcProtseqVectorFreeW", "ptr", ProtseqVector, "int")
        return result
    }

    /**
     * The RpcServerInqBindings function returns the binding handles over which remote procedure calls can be received.
     * @param {Pointer<RPC_BINDING_VECTOR>} BindingVector Returns a pointer to a pointer to a vector of server binding handles.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NO_BINDINGS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are no bindings.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcserverinqbindings
     * @since windows5.0
     */
    static RpcServerInqBindings(BindingVector) {
        result := DllCall("RPCRT4.dll\RpcServerInqBindings", "ptr", BindingVector, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} SecurityDescriptor 
     * @param {Pointer<RPC_BINDING_VECTOR>} BindingVector 
     * @returns {Integer} 
     */
    static RpcServerInqBindingsEx(SecurityDescriptor, BindingVector) {
        result := DllCall("RPCRT4.dll\RpcServerInqBindingsEx", "ptr", SecurityDescriptor, "ptr", BindingVector, "int")
        return result
    }

    /**
     * The RpcServerInqIf function returns the manager entry-point vector (EPV) registered for an interface.
     * @param {Pointer<Void>} IfSpec Interface whose manager EPV is returned.
     * @param {Pointer<Guid>} MgrTypeUuid Pointer to the manager type UUID whose manager EPV is returned. 
     * 
     * 
     * 
     * 
     * Specifying a parameter value of <b>NULL</b> (or a nil UUID) signifies to return the manager EPV registered with <i>IfSpec</i> and the nil manager type UUID.
     * @param {Pointer<Void>} MgrEpv Returns a pointer to the manager EPV for the requested interface.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_UNKNOWN_IF</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The interface is unknown.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_UNKNOWN_MGR_TYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The manager type is unknown.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcserverinqif
     * @since windows5.0
     */
    static RpcServerInqIf(IfSpec, MgrTypeUuid, MgrEpv) {
        result := DllCall("RPCRT4.dll\RpcServerInqIf", "ptr", IfSpec, "ptr", MgrTypeUuid, "ptr", MgrEpv, "int")
        return result
    }

    /**
     * The RpcServerListen function signals the RPC run-time library to listen for remote procedure calls. This function will not affect auto-listen interfaces; use RpcServerRegisterIfEx if you need that functionality.
     * @param {Integer} MinimumCallThreads Hint to the RPC run time that specifies the minimum number of call threads that should be created and maintained in the given server. This value is only a hint and is interpreted differently in different versions of Windows. In Windows XP, this value is the number of previously created threads in each thread pool that the RPC run time creates. An application should specify one for this parameter, and defer thread creation decisions to the RPC run time.
     * @param {Integer} MaxCalls Recommended maximum number of concurrent remote procedure calls the server can execute. To allow efficient performance, the RPC run-time libraries interpret the <i>MaxCalls</i> parameter as a suggested limit rather than as an absolute upper bound. 
     * 
     * 
     * 
     * 
     * Use RPC_C_LISTEN_MAX_CALLS_DEFAULT to specify the default value.
     * @param {Integer} DontWait Flag controlling the return from 
     * <b>RpcServerListen</b>. A value of nonzero indicates that 
     * <b>RpcServerListen</b> should return immediately after completing function processing. A value of zero indicates that 
     * <b>RpcServerListen</b> should not return until the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcmgmtstopserverlistening">RpcMgmtStopServerListening</a> function has been called and all remote calls have completed.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_ALREADY_LISTENING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The server is already listening.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NO_PROTSEQS_REGISTERED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are no protocol sequences registered.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_MAX_CALLS_TOO_SMALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The maximum calls value is too small.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcserverlisten
     * @since windows5.0
     */
    static RpcServerListen(MinimumCallThreads, MaxCalls, DontWait) {
        result := DllCall("RPCRT4.dll\RpcServerListen", "uint", MinimumCallThreads, "uint", MaxCalls, "uint", DontWait, "int")
        return result
    }

    /**
     * The RpcServerRegisterIf function registers an interface with the RPC run-time library.
     * @param {Pointer<Void>} IfSpec MIDL-generated structure indicating the interface to register.
     * @param {Pointer<Guid>} MgrTypeUuid Pointer to a type UUID to associate with the <i>MgrEpv</i> parameter. Specifying a null parameter value (or a nil UUID) registers <i>IfSpec</i> with a nil-type UUID.
     * @param {Pointer<Void>} MgrEpv Manager routines' entry-point vector (EPV). To use the MIDL-generated default EPV, specify a null value. For more information, please see <a href="https://docs.microsoft.com/windows/desktop/Rpc/rpc-mgr-epv">RPC_MGR_EPV</a>.
     * @returns {Integer} Returns RPC_S_OK upon success.
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcserverregisterif
     * @since windows5.0
     */
    static RpcServerRegisterIf(IfSpec, MgrTypeUuid, MgrEpv) {
        result := DllCall("RPCRT4.dll\RpcServerRegisterIf", "ptr", IfSpec, "ptr", MgrTypeUuid, "ptr", MgrEpv, "int")
        return result
    }

    /**
     * The RpcServerRegisterIfEx function registers an interface with the RPC run-time library.
     * @param {Pointer<Void>} IfSpec MIDL-generated structure indicating the interface to register.
     * @param {Pointer<Guid>} MgrTypeUuid Pointer to a type UUID to associate with the <i>MgrEpv</i> parameter. Specifying a <b>null</b> parameter value (or a nil UUID) registers <i>IfSpec</i> with a nil-type UUID.
     * @param {Pointer<Void>} MgrEpv Manager routines' entry-point vector (EPV). To use the MIDL-generated default EPV, specify a <b>null</b> value. For more information, please see <a href="https://docs.microsoft.com/windows/desktop/Rpc/rpc-mgr-epv">RPC_MGR_EPV</a>.
     * @param {Integer} Flags Flags. For a list of flag values, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Rpc/interface-registration-flags">Interface Registration Flags</a>.
     * @param {Integer} MaxCalls Maximum number of concurrent remote procedure call requests the server can accept on an auto-listen interface. The <i>MaxCalls</i> parameters is only applicable on an auto-listen interface, and is ignored on interfaces that are not auto-listen. The RPC run-time library makes its best effort to ensure the server does not allow more concurrent call requests than the number of calls specified in <i>MaxCalls</i>. The actual number can be greater and can vary for each protocol sequence. 
     * 
     * 
     * 
     * 
     * Calls on other interfaces are governed by the value of the process-wide <i>MaxCalls</i> parameter specified in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcserverlisten">RpcServerListen</a> function call.
     * 
     * If the number of concurrent calls is not a concern, you can achieve slightly better server-side performance by specifying the default value using RPC_C_LISTEN_MAX_CALLS_DEFAULT. Doing so relieves the RPC run-time environment from enforcing an unnecessary restriction.
     * @param {Pointer<RPC_IF_CALLBACK_FN>} IfCallback Security-callback function, or <b>NULL</b> for no callback. Each registered interface can have a different callback function. See Remarks for more details.
     * @returns {Integer} Returns RPC_S_OK upon success.
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcserverregisterifex
     * @since windows5.1.2600
     */
    static RpcServerRegisterIfEx(IfSpec, MgrTypeUuid, MgrEpv, Flags, MaxCalls, IfCallback) {
        result := DllCall("RPCRT4.dll\RpcServerRegisterIfEx", "ptr", IfSpec, "ptr", MgrTypeUuid, "ptr", MgrEpv, "uint", Flags, "uint", MaxCalls, "ptr", IfCallback, "int")
        return result
    }

    /**
     * The RpcServerRegisterIf2 function registers an interface with the RPC run-time library.
     * @param {Pointer<Void>} IfSpec MIDL-generated structure indicating the interface to register.
     * @param {Pointer<Guid>} MgrTypeUuid Pointer to a type <b>UUID</b> to associate with the <i>MgrEpv</i> parameter. Specifying a <b>null</b> parameter value (or a nil <b>UUID</b>) registers <i>IfSpec</i> with a nil-type <b>UUID</b>.
     * @param {Pointer<Void>} MgrEpv Manager routines' entry-point vector (EPV). To use the MIDL-generated default EPV, specify a <b>null</b> value. For more information, please see <a href="https://docs.microsoft.com/windows/desktop/Rpc/rpc-mgr-epv">RPC_MGR_EPV</a>.
     * @param {Integer} Flags Flags. For a list of flag values, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Rpc/interface-registration-flags">Interface Registration Flags</a>.
     * @param {Integer} MaxCalls Maximum number of concurrent remote procedure call requests the server can accept on an <b>auto-listen</b> interface. The <i>MaxCalls</i> parameter is only applicable on an <b>auto-listen</b> interface, and is ignored on interfaces that are not <b>auto-listen</b>. The RPC run-time library makes its best effort to ensure the server does not allow more concurrent call requests than the number of calls specified in <i>MaxCalls</i>. The actual number can be greater and can vary for each protocol sequence. 
     * 
     * 
     * 
     * 
     * Calls on other interfaces are governed by the value of the process-wide <i>MaxCalls</i> parameter specified in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcserverlisten">RpcServerListen</a> function call.
     * 
     * If the number of concurrent calls is not a concern, you can achieve slightly better server-side performance by specifying the default value using RPC_C_LISTEN_MAX_CALLS_DEFAULT. Doing so relieves the RPC run-time environment from enforcing an unnecessary restriction.
     * @param {Integer} MaxRpcSize Maximum size of incoming data blocks, in bytes. This parameter may be used to help prevent malicious denial-of-service attacks. If the data block of a remote procedure call is larger than <i>MaxRpcSize</i>, the RPC run-time library rejects the call and sends an RPC_S_ACCESS_DENIED error to the client. Specifying a value of (unsigned int) –1 for this parameter removes the limit on the size of incoming data blocks. This parameter has no effect on calls made over the <a href="https://docs.microsoft.com/windows/desktop/Midl/ncalrpc">ncalrpc</a> protocol.
     * @param {Pointer<RPC_IF_CALLBACK_FN>} IfCallbackFn Security-callback function, or <b>NULL</b> for no callback. Each registered interface can have a different callback function. See Remarks.
     * @returns {Integer} Returns RPC_S_OK upon success.
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcserverregisterif2
     * @since windows5.0
     */
    static RpcServerRegisterIf2(IfSpec, MgrTypeUuid, MgrEpv, Flags, MaxCalls, MaxRpcSize, IfCallbackFn) {
        result := DllCall("RPCRT4.dll\RpcServerRegisterIf2", "ptr", IfSpec, "ptr", MgrTypeUuid, "ptr", MgrEpv, "uint", Flags, "uint", MaxCalls, "uint", MaxRpcSize, "ptr", IfCallbackFn, "int")
        return result
    }

    /**
     * The RpcServerRegisterIf3 function registers an interface with the RPC run-time library.
     * @param {Pointer<Void>} IfSpec MIDL-generated  structure indicating the interface to register.
     * @param {Pointer<Guid>} MgrTypeUuid Pointer to a type <b>UUID</b> to associate with the <i>MgrEpv</i> parameter. Specifying a <b>null</b> parameter value (or a nil <b>UUID</b>) registers <i>IfSpec</i> with a nil-type <b>UUID</b>.
     * @param {Pointer<Void>} MgrEpv Manager routines' entry-point vector (EPV). To use the MIDL-generated default EPV, specify a <b>null</b> value. For more information, please see <a href="https://docs.microsoft.com/windows/desktop/Rpc/rpc-mgr-epv">RPC_MGR_EPV</a>.
     * @param {Integer} Flags Flags. For a list of flag values, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Rpc/interface-registration-flags">Interface Registration Flags</a>.
     * @param {Integer} MaxCalls Maximum number of concurrent remote procedure call requests the server can accept on an <b>auto-listen</b> interface. The <i>MaxCalls</i> parameter is only applicable on an <b>auto-listen</b> interface, and is ignored on interfaces that are not <b>auto-listen</b>. The RPC run-time library makes its best effort to ensure the server does not allow more concurrent call requests than the number of calls specified in <i>MaxCalls</i>. The actual number can be greater and can vary for each protocol sequence. 
     * 
     * 
     * 
     * 
     * Calls on other interfaces are governed by the value of the process-wide <i>MaxCalls</i> parameter specified in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcserverlisten">RpcServerListen</a> function call.
     * 
     * If the number of concurrent calls is not a concern, you can achieve slightly better server-side performance by specifying the default value using RPC_C_LISTEN_MAX_CALLS_DEFAULT. Doing so relieves the RPC run-time environment from enforcing an unnecessary restriction.
     * @param {Integer} MaxRpcSize Maximum size of incoming data blocks, in bytes. This parameter may be used to help prevent malicious denial-of-service attacks. If the data block of a remote procedure call is larger than <i>MaxRpcSize</i>, the RPC run-time library rejects the call and sends an RPC_S_ACCESS_DENIED error to the client. Specifying a value of (unsigned int) –1 for this parameter removes the limit on the size of incoming data blocks. This parameter has no effect on calls made over the <a href="https://docs.microsoft.com/windows/desktop/Midl/ncalrpc">ncalrpc</a> protocol.
     * @param {Pointer<RPC_IF_CALLBACK_FN>} IfCallback Security-callback function, or <b>NULL</b> for no callback. Each registered interface can have a different callback function. See the Remarks on <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcserverregisterif2">RpcServerRegisterIf2</a>.
     * @param {Pointer<Void>} SecurityDescriptor Security descriptor for accessing the RPC interface. Each registered interface can have a different security descriptor.
     * @returns {Integer} Returns RPC_S_OK upon success.
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcserverregisterif3
     * @since windows8.0
     */
    static RpcServerRegisterIf3(IfSpec, MgrTypeUuid, MgrEpv, Flags, MaxCalls, MaxRpcSize, IfCallback, SecurityDescriptor) {
        result := DllCall("RPCRT4.dll\RpcServerRegisterIf3", "ptr", IfSpec, "ptr", MgrTypeUuid, "ptr", MgrEpv, "uint", Flags, "uint", MaxCalls, "uint", MaxRpcSize, "ptr", IfCallback, "ptr", SecurityDescriptor, "int")
        return result
    }

    /**
     * The RpcServerUnregisterIf function removes an interface from the RPC run-time library registry.
     * @param {Pointer<Void>} IfSpec Interface to remove from the registry. 
     * 
     * 
     * 
     * 
     * Specify a <b>null</b> value to remove all interfaces previously registered with the type UUID value specified in the <i>MgrTypeUuid</i> parameter.
     * @param {Pointer<Guid>} MgrTypeUuid Pointer to the type UUID of the manager entry-point vector (EPV) to remove from the registry. The value of <i>MgrTypeUuid</i> should be the same value as was provided in a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcserverregisterif">RpcServerRegisterIf</a> function, <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcserverregisterif2">RpcServerRegisterIf2</a> function, or the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcserverregisterifex">RpcServerRegisterIfEx</a> function. 
     * 
     * 
     * 
     * 
     * Specify a <b>null</b> value to remove the interface specified in the <i>IfSpec</i> parameter for all previously registered type UUIDs from the registry.
     * 
     * Specify a nil UUID to remove the MIDL-generated default manager EPV from the registry. In this case, all manager EPVs registered with a non-nil type UUID remain registered.
     * @param {Integer} WaitForCallsToComplete Flag that indicates whether to remove the interface from the registry immediately or to wait until all current calls are complete. 
     * 
     * 
     * 
     * 
     * Specify a value of zero to disregard calls in progress and remove the interface from the registry immediately. Specify any nonzero value to wait until all active calls complete.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_UNKNOWN_MGR_TYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The manager type is unknown.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_UNKNOWN_IF</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The interface is unknown.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcserverunregisterif
     * @since windows5.0
     */
    static RpcServerUnregisterIf(IfSpec, MgrTypeUuid, WaitForCallsToComplete) {
        result := DllCall("RPCRT4.dll\RpcServerUnregisterIf", "ptr", IfSpec, "ptr", MgrTypeUuid, "uint", WaitForCallsToComplete, "int")
        return result
    }

    /**
     * The RpcServerUnregisterIfEx function removes an interface from the RPC run-time library registry. This function extends the functionality of the RpcServerUnregisterIf function.
     * @param {Pointer<Void>} IfSpec Interface to remove from the registry. 
     * 
     * 
     * 
     * 
     * Specify a null value to remove all interfaces previously registered with the type UUID value specified in the <i>MgrTypeUuid</i> parameter.
     * @param {Pointer<Guid>} MgrTypeUuid Pointer to the type UUID of the manager entry-point vector (EPV) to remove from the registry. The value of <i>MgrTypeUuid</i> should be the same value as was provided in a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcserverregisterif">RpcServerRegisterIf</a> function, <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcserverregisterif2">RpcServerRegisterIf2</a> function, or the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcserverregisterifex">RpcServerRegisterIfEx</a> function. 
     * 
     * 
     * 
     * 
     * Specify a null value to remove the interface specified in the <i>IfSpec</i> parameter for all previously registered type UUIDs from the registry.
     * 
     * Specify a nil UUID to remove the MIDL-generated default manager EPV from the registry. In this case, all manager EPVs registered with a non-nil type UUID remain registered.
     * @param {Integer} RundownContextHandles Specifies whether rundown is called for active context handles. If non-zero, the rundown is called once all calls on the interface have completed. If set to zero, the RPC run time assumes the server has already destroyed its portion of the context handle and it will not call the rundown routines.
     * @returns {Integer} Returns RPC status. 
     * <b>RpcServerUnregisterIfEx</b> does not fail unless supplied with invalid values.
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcserverunregisterifex
     * @since windows5.1.2600
     */
    static RpcServerUnregisterIfEx(IfSpec, MgrTypeUuid, RundownContextHandles) {
        result := DllCall("RPCRT4.dll\RpcServerUnregisterIfEx", "ptr", IfSpec, "ptr", MgrTypeUuid, "int", RundownContextHandles, "int")
        return result
    }

    /**
     * The RpcServerUseAllProtseqs function tells the RPC run-time library to use all supported protocol sequences for receiving remote procedure calls.
     * @param {Integer} MaxCalls Backlog queue length for the <a href="https://docs.microsoft.com/windows/desktop/Midl/ncacn-ip-tcp">ncacn_ip_tcp</a> protocol sequence. All other protocol sequences ignore this parameter. Use RPC_C_PROTSEQ_MAX_REQS_DEFAULT to specify the default value. See Remarks.
     * @param {Pointer<Void>} SecurityDescriptor Pointer to an optional parameter provided for the security subsystem. Used only for <a href="https://docs.microsoft.com/windows/desktop/Midl/ncacn-np">ncacn_np</a> and <a href="https://docs.microsoft.com/windows/desktop/Midl/ncalrpc">ncalrpc</a> protocol sequences. All other protocol sequences ignore this parameter. Using a security descriptor on the endpoint in order to make a server secure is not recommended. This parameter does not appear in the DCE specification for this API.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NO_PROTSEQS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are no supported protocol sequences.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OUT_OF_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Sufficient memory is not available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_SECURITY_DESC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The security descriptor is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcserveruseallprotseqs
     * @since windows5.0
     */
    static RpcServerUseAllProtseqs(MaxCalls, SecurityDescriptor) {
        result := DllCall("RPCRT4.dll\RpcServerUseAllProtseqs", "uint", MaxCalls, "ptr", SecurityDescriptor, "int")
        return result
    }

    /**
     * The RpcServerUseAllProtseqsEx function tells the RPC run-time library to use all supported protocol sequences for receiving remote procedure calls.
     * @param {Integer} MaxCalls Backlog queue length for the <a href="https://docs.microsoft.com/windows/desktop/Midl/ncacn-ip-tcp">ncacn_ip_tcp</a> protocol sequence. All other protocol sequences ignore this parameter. Use RPC_C_PROTSEQ_MAX_REQS_DEFAULT to specify the default value. See Remarks.
     * @param {Pointer<Void>} SecurityDescriptor Pointer to an optional parameter provided for the security subsystem. Used only for <a href="https://docs.microsoft.com/windows/desktop/Midl/ncacn-np">ncacn_np</a> and <a href="https://docs.microsoft.com/windows/desktop/Midl/ncalrpc">ncalrpc</a> protocol sequences. All other protocol sequences ignore this parameter. Using a security descriptor on the endpoint in order to make a server secure is not recommended. This parameter does not appear in the DCE specification for this API.
     * @param {Pointer<RPC_POLICY>} Policy Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/ns-rpcdce-rpc_policy">RPC_POLICY</a> structure, which allows you to override the default policies for dynamic port allocation and binding to network interface cards (NICs) on multihomed computers (computers with multiple network cards).
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NO_PROTSEQS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are no supported protocol sequences.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OUT_OF_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Sufficient memory is not available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_SECURITY_DESC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The security descriptor is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcserveruseallprotseqsex
     * @since windows5.0
     */
    static RpcServerUseAllProtseqsEx(MaxCalls, SecurityDescriptor, Policy) {
        result := DllCall("RPCRT4.dll\RpcServerUseAllProtseqsEx", "uint", MaxCalls, "ptr", SecurityDescriptor, "ptr", Policy, "int")
        return result
    }

    /**
     * The RpcServerUseAllProtseqsIf function tells the RPC run-time library to use all specified protocol sequences and endpoints in the interface specification for receiving remote procedure calls.
     * @param {Integer} MaxCalls Backlog queue length for the <a href="https://docs.microsoft.com/windows/desktop/Midl/ncacn-ip-tcp">ncacn_ip_tcp</a> protocol sequence. All other protocol sequences ignore this parameter. Use RPC_C_PROTSEQ_MAX_REQS_DEFAULT to specify the default value. See Remarks.
     * @param {Pointer<Void>} IfSpec Interface containing the protocol sequences and corresponding endpoint information to use in creating binding handles.
     * @param {Pointer<Void>} SecurityDescriptor Pointer to an optional parameter provided for the security subsystem. Used only for <a href="https://docs.microsoft.com/windows/desktop/Midl/ncacn-np">ncacn_np</a> and <a href="https://docs.microsoft.com/windows/desktop/Midl/ncalrpc">ncalrpc</a> protocol sequences. All other protocol sequences ignore this parameter. Using a security descriptor on the endpoint in order to make a server secure is not recommended. This parameter does not appear in the DCE specification for this API.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NO_PROTSEQS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are no supported protocol sequences.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_ENDPOINT_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The endpoint format.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OUT_OF_MEMORY</b></dt>
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
     * <dt><b>RPC_S_DUPLICATE_ENDPOINT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The endpoint is a duplicate.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_SECURITY_DESC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The security descriptor is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_RPC_PROTSEQ</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * RPC protocol sequence invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcserveruseallprotseqsif
     * @since windows5.0
     */
    static RpcServerUseAllProtseqsIf(MaxCalls, IfSpec, SecurityDescriptor) {
        result := DllCall("RPCRT4.dll\RpcServerUseAllProtseqsIf", "uint", MaxCalls, "ptr", IfSpec, "ptr", SecurityDescriptor, "int")
        return result
    }

    /**
     * The RpcServerUseAllProtseqsIfEx function tells the RPC run-time library to use all the specified protocol sequences and endpoints in the interface specification for receiving remote procedure calls.
     * @param {Integer} MaxCalls Backlog queue length for the <a href="https://docs.microsoft.com/windows/desktop/Midl/ncacn-ip-tcp">ncacn_ip_tcp</a> protocol sequence. All other protocol sequences ignore this parameter. Use RPC_C_PROTSEQ_MAX_REQS_DEFAULT to specify the default value. See Remarks.
     * @param {Pointer<Void>} IfSpec Interface containing the protocol sequences and corresponding endpoint information to use in creating binding handles.
     * @param {Pointer<Void>} SecurityDescriptor Pointer to an optional parameter provided for the security subsystem. Used only for <a href="https://docs.microsoft.com/windows/desktop/Midl/ncacn-np">ncacn_np</a> and <a href="https://docs.microsoft.com/windows/desktop/Midl/ncalrpc">ncalrpc</a> protocol sequences. All other protocol sequences ignore this parameter. Using a security descriptor on the endpoint in order to make a server secure is not recommended. This parameter does not appear in the DCE specification for this API.
     * @param {Pointer<RPC_POLICY>} Policy Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/ns-rpcdce-rpc_policy">RPC_POLICY</a> structure, which contains flags to restrict port allocation for dynamic ports and allow multihomed computers to selectively bind to network interface cards.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NO_PROTSEQS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are no supported protocol sequences.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_ENDPOINT_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The endpoint format.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OUT_OF_MEMORY</b></dt>
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
     * <dt><b>RPC_S_DUPLICATE_ENDPOINT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The endpoint is a duplicate.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_SECURITY_DESC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The security descriptor is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_RPC_PROTSEQ</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The RPC protocol sequence is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcserveruseallprotseqsifex
     * @since windows5.1.2600
     */
    static RpcServerUseAllProtseqsIfEx(MaxCalls, IfSpec, SecurityDescriptor, Policy) {
        result := DllCall("RPCRT4.dll\RpcServerUseAllProtseqsIfEx", "uint", MaxCalls, "ptr", IfSpec, "ptr", SecurityDescriptor, "ptr", Policy, "int")
        return result
    }

    /**
     * The RpcServerUseProtseq function tells the RPC run-time library to use the specified protocol sequence for receiving remote procedure calls.
     * @param {PSTR} Protseq Pointer to a string identifier of the protocol sequence to register with the RPC run-time library.
     * @param {Integer} MaxCalls Backlog queue length for the <b>ncacn_ip_tcp</b> protocol sequence. All other protocol sequences ignore this parameter. Use RPC_C_PROTSEQ_MAX_REQS_DEFAULT to specify the default value. See Remarks.
     * @param {Pointer<Void>} SecurityDescriptor Pointer to an optional parameter provided for the security subsystem. Used only for <b>ncacn_np</b> and <b>ncalrpc</b> protocol sequences. All other protocol sequences ignore this parameter. Using a security descriptor on the endpoint in order to make a server secure is not recommended. This parameter does not appear in the DCE specification for this API.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_PROTSEQ_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The protocol sequence is not supported on this host.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_RPC_PROTSEQ</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The protocol sequence.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OUT_OF_MEMORY</b></dt>
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
     * <dt><b>RPC_S_INVALID_SECURITY_DESC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The security descriptor is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcserveruseprotseqa
     * @since windows5.0
     */
    static RpcServerUseProtseqA(Protseq, MaxCalls, SecurityDescriptor) {
        Protseq := Protseq is String ? StrPtr(Protseq) : Protseq

        result := DllCall("RPCRT4.dll\RpcServerUseProtseqA", "ptr", Protseq, "uint", MaxCalls, "ptr", SecurityDescriptor, "int")
        return result
    }

    /**
     * The RpcServerUseProtseqEx function tells the RPC run-time library to use the specified protocol sequence for receiving remote procedure calls.
     * @param {PSTR} Protseq Pointer to a string identifier of the protocol sequence to register with the RPC run-time library.
     * @param {Integer} MaxCalls Backlog queue length for the <b>ncacn_ip_tcp</b> protocol sequence. All other protocol sequences ignore this parameter. Use RPC_C_PROTSEQ_MAX_REQS_DEFAULT to specify the default value. See Remarks.
     * @param {Pointer<Void>} SecurityDescriptor Pointer to an optional parameter provided for the Windows XP/2000/NT security subsystem. Used only for <b>ncacn_np</b> and <b>ncalrpc</b> protocol sequences. All other protocol sequences ignore this parameter. Using a security descriptor on the endpoint in order to make a server secure is not recommended. This parameter does not appear in the DCE specification for this API.
     * @param {Pointer<RPC_POLICY>} Policy Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/ns-rpcdce-rpc_policy">RPC_POLICY</a> structure, which contains flags to restrict port allocation for dynamic ports and allow multihomed computers to selectively bind to network interface cards. The 
     * <b>RPC_POLICY</b> structure enables the caller to direct the RPC run-time library to use an intranet port or an Internet port, among other options.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_PROTSEQ_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The protocol sequence is not supported on this host.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_RPC_PROTSEQ</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The protocol sequence.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OUT_OF_MEMORY</b></dt>
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
     * <dt><b>RPC_S_INVALID_SECURITY_DESC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The security descriptor is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcserveruseprotseqexa
     * @since windows5.0
     */
    static RpcServerUseProtseqExA(Protseq, MaxCalls, SecurityDescriptor, Policy) {
        Protseq := Protseq is String ? StrPtr(Protseq) : Protseq

        result := DllCall("RPCRT4.dll\RpcServerUseProtseqExA", "ptr", Protseq, "uint", MaxCalls, "ptr", SecurityDescriptor, "ptr", Policy, "int")
        return result
    }

    /**
     * The RpcServerUseProtseq function tells the RPC run-time library to use the specified protocol sequence for receiving remote procedure calls.
     * @param {PWSTR} Protseq Pointer to a string identifier of the protocol sequence to register with the RPC run-time library.
     * @param {Integer} MaxCalls Backlog queue length for the <b>ncacn_ip_tcp</b> protocol sequence. All other protocol sequences ignore this parameter. Use RPC_C_PROTSEQ_MAX_REQS_DEFAULT to specify the default value. See Remarks.
     * @param {Pointer<Void>} SecurityDescriptor Pointer to an optional parameter provided for the security subsystem. Used only for <b>ncacn_np</b> and <b>ncalrpc</b> protocol sequences. All other protocol sequences ignore this parameter. Using a security descriptor on the endpoint in order to make a server secure is not recommended. This parameter does not appear in the DCE specification for this API.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_PROTSEQ_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The protocol sequence is not supported on this host.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_RPC_PROTSEQ</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The protocol sequence.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OUT_OF_MEMORY</b></dt>
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
     * <dt><b>RPC_S_INVALID_SECURITY_DESC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The security descriptor is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcserveruseprotseqw
     * @since windows5.0
     */
    static RpcServerUseProtseqW(Protseq, MaxCalls, SecurityDescriptor) {
        Protseq := Protseq is String ? StrPtr(Protseq) : Protseq

        result := DllCall("RPCRT4.dll\RpcServerUseProtseqW", "ptr", Protseq, "uint", MaxCalls, "ptr", SecurityDescriptor, "int")
        return result
    }

    /**
     * The RpcServerUseProtseqEx function tells the RPC run-time library to use the specified protocol sequence for receiving remote procedure calls.
     * @param {PWSTR} Protseq Pointer to a string identifier of the protocol sequence to register with the RPC run-time library.
     * @param {Integer} MaxCalls Backlog queue length for the <b>ncacn_ip_tcp</b> protocol sequence. All other protocol sequences ignore this parameter. Use RPC_C_PROTSEQ_MAX_REQS_DEFAULT to specify the default value. See Remarks.
     * @param {Pointer<Void>} SecurityDescriptor Pointer to an optional parameter provided for the Windows XP/2000/NT security subsystem. Used only for <b>ncacn_np</b> and <b>ncalrpc</b> protocol sequences. All other protocol sequences ignore this parameter. Using a security descriptor on the endpoint in order to make a server secure is not recommended. This parameter does not appear in the DCE specification for this API.
     * @param {Pointer<RPC_POLICY>} Policy Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/ns-rpcdce-rpc_policy">RPC_POLICY</a> structure, which contains flags to restrict port allocation for dynamic ports and allow multihomed computers to selectively bind to network interface cards. The 
     * <b>RPC_POLICY</b> structure enables the caller to direct the RPC run-time library to use an intranet port or an Internet port, among other options.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_PROTSEQ_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The protocol sequence is not supported on this host.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_RPC_PROTSEQ</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The protocol sequence.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OUT_OF_MEMORY</b></dt>
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
     * <dt><b>RPC_S_INVALID_SECURITY_DESC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The security descriptor is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcserveruseprotseqexw
     * @since windows5.0
     */
    static RpcServerUseProtseqExW(Protseq, MaxCalls, SecurityDescriptor, Policy) {
        Protseq := Protseq is String ? StrPtr(Protseq) : Protseq

        result := DllCall("RPCRT4.dll\RpcServerUseProtseqExW", "ptr", Protseq, "uint", MaxCalls, "ptr", SecurityDescriptor, "ptr", Policy, "int")
        return result
    }

    /**
     * The RpcServerUseProtseqEp function tells the RPC run-time library to use the specified protocol sequence combined with the specified endpoint for receiving remote procedure calls.
     * @param {PSTR} Protseq Pointer to a string identifier of the protocol sequence to register with the RPC run-time library.
     * @param {Integer} MaxCalls Backlog queue length for the <b>ncacn_ip_tcp</b> protocol sequence. All other protocol sequences ignore this parameter. Use RPC_C_PROTSEQ_MAX_REQS_DEFAULT to specify the default value. See Remarks.
     * @param {PSTR} Endpoint Pointer to the endpoint-address information to use in creating a binding for the protocol sequence specified in the <i>Protseq</i> parameter.
     * @param {Pointer<Void>} SecurityDescriptor Pointer to an optional parameter provided for the security subsystem. Used only for <b>ncacn_np</b> and <b>ncalrpc</b> protocol sequences. All other protocol sequences ignore this parameter. Using a security descriptor on the endpoint in order to make a server secure is not recommended. This parameter does not appear in the DCE specification for this API.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_PROTSEQ_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The protocol sequence is not supported on this host.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_RPC_PROTSEQ</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The protocol sequence is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_ENDPOINT_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The endpoint format is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OUT_OF_MEMORY</b></dt>
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
     * <dt><b>RPC_S_DUPLICATE_ENDPOINT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The endpoint is a duplicate.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_SECURITY_DESC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The security descriptor is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcserveruseprotseqepa
     * @since windows5.0
     */
    static RpcServerUseProtseqEpA(Protseq, MaxCalls, Endpoint, SecurityDescriptor) {
        Protseq := Protseq is String ? StrPtr(Protseq) : Protseq
        Endpoint := Endpoint is String ? StrPtr(Endpoint) : Endpoint

        result := DllCall("RPCRT4.dll\RpcServerUseProtseqEpA", "ptr", Protseq, "uint", MaxCalls, "ptr", Endpoint, "ptr", SecurityDescriptor, "int")
        return result
    }

    /**
     * The RpcServerUseProtseqEpEx function tells the RPC run-time library to use the specified protocol sequence combined with the specified endpoint for receiving remote procedure calls.
     * @param {PSTR} Protseq Pointer to a string identifier of the protocol sequence to register with the RPC run-time library.
     * @param {Integer} MaxCalls Backlog queue length for the <b>ncacn_ip_tcp</b> protocol sequence. All other protocol sequences ignore this parameter. Use RPC_C_PROTSEQ_MAX_REQS_DEFAULT to specify the default value. See Remarks.
     * @param {PSTR} Endpoint Pointer to the endpoint-address information to use in creating a binding for the protocol sequence specified by <i>Protseq</i>.
     * @param {Pointer<Void>} SecurityDescriptor Pointer to an optional parameter provided for the security subsystem. Used only for <b>ncacn_np</b> and <i>ncalrpc</i> protocol sequences. All other protocol sequences ignore this parameter. Using a security descriptor on the endpoint in order to make a server secure is not recommended. This parameter does not appear in the DCE specification for this API.
     * @param {Pointer<RPC_POLICY>} Policy Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/ns-rpcdce-rpc_policy">RPC_POLICY</a> structure, which contains flags that set transport-specific attributes. In the case of the <b>ncadg_mq</b> transport, these flags specify the properties of the server process–receive queue. In the case of the <b>ncacn_ip_tcp</b> or <b>ncadg_ip_udp</b> transports, these flags restrict port allocation for dynamic ports and allow multihomed computers to selectively bind to network interface cards. 
     * 
     * 
     * 
     * 
     * The flag settings in the <b>Policy</b> field are effective only when the <b>ncacn_ip_tcp</b>, <b>ncadg_ip_udp</b>, or <b>ncadg_mq</b> protocol sequences are in use. For all other protocol sequences, the RPC run time ignores these values.
     * 
     * <div class="alert"><b>Note</b>  Portions of the policy associated with dynamic endpoints are ignored when the RpcServerUseProtseqEpEx function is called, since the port is specified in the endpoint itself.</div>
     * <div> </div>
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_PROTSEQ_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The protocol sequence is not supported on this host.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_RPC_PROTSEQ</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The protocol sequence is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_ENDPOINT_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The endpoint format is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OUT_OF_MEMORY</b></dt>
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
     * <dt><b>RPC_S_DUPLICATE_ENDPOINT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The endpoint is a duplicate.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_SECURITY_DESC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The security descriptor is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcserveruseprotseqepexa
     * @since windows5.0
     */
    static RpcServerUseProtseqEpExA(Protseq, MaxCalls, Endpoint, SecurityDescriptor, Policy) {
        Protseq := Protseq is String ? StrPtr(Protseq) : Protseq
        Endpoint := Endpoint is String ? StrPtr(Endpoint) : Endpoint

        result := DllCall("RPCRT4.dll\RpcServerUseProtseqEpExA", "ptr", Protseq, "uint", MaxCalls, "ptr", Endpoint, "ptr", SecurityDescriptor, "ptr", Policy, "int")
        return result
    }

    /**
     * The RpcServerUseProtseqEp function tells the RPC run-time library to use the specified protocol sequence combined with the specified endpoint for receiving remote procedure calls.
     * @param {PWSTR} Protseq Pointer to a string identifier of the protocol sequence to register with the RPC run-time library.
     * @param {Integer} MaxCalls Backlog queue length for the <b>ncacn_ip_tcp</b> protocol sequence. All other protocol sequences ignore this parameter. Use RPC_C_PROTSEQ_MAX_REQS_DEFAULT to specify the default value. See Remarks.
     * @param {PWSTR} Endpoint Pointer to the endpoint-address information to use in creating a binding for the protocol sequence specified in the <i>Protseq</i> parameter.
     * @param {Pointer<Void>} SecurityDescriptor Pointer to an optional parameter provided for the security subsystem. Used only for <b>ncacn_np</b> and <b>ncalrpc</b> protocol sequences. All other protocol sequences ignore this parameter. Using a security descriptor on the endpoint in order to make a server secure is not recommended. This parameter does not appear in the DCE specification for this API.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_PROTSEQ_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The protocol sequence is not supported on this host.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_RPC_PROTSEQ</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The protocol sequence is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_ENDPOINT_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The endpoint format is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OUT_OF_MEMORY</b></dt>
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
     * <dt><b>RPC_S_DUPLICATE_ENDPOINT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The endpoint is a duplicate.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_SECURITY_DESC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The security descriptor is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcserveruseprotseqepw
     * @since windows5.0
     */
    static RpcServerUseProtseqEpW(Protseq, MaxCalls, Endpoint, SecurityDescriptor) {
        Protseq := Protseq is String ? StrPtr(Protseq) : Protseq
        Endpoint := Endpoint is String ? StrPtr(Endpoint) : Endpoint

        result := DllCall("RPCRT4.dll\RpcServerUseProtseqEpW", "ptr", Protseq, "uint", MaxCalls, "ptr", Endpoint, "ptr", SecurityDescriptor, "int")
        return result
    }

    /**
     * The RpcServerUseProtseqEpEx function tells the RPC run-time library to use the specified protocol sequence combined with the specified endpoint for receiving remote procedure calls.
     * @param {PWSTR} Protseq Pointer to a string identifier of the protocol sequence to register with the RPC run-time library.
     * @param {Integer} MaxCalls Backlog queue length for the <b>ncacn_ip_tcp</b> protocol sequence. All other protocol sequences ignore this parameter. Use RPC_C_PROTSEQ_MAX_REQS_DEFAULT to specify the default value. See Remarks.
     * @param {PWSTR} Endpoint Pointer to the endpoint-address information to use in creating a binding for the protocol sequence specified by <i>Protseq</i>.
     * @param {Pointer<Void>} SecurityDescriptor Pointer to an optional parameter provided for the security subsystem. Used only for <b>ncacn_np</b> and <i>ncalrpc</i> protocol sequences. All other protocol sequences ignore this parameter. Using a security descriptor on the endpoint in order to make a server secure is not recommended. This parameter does not appear in the DCE specification for this API.
     * @param {Pointer<RPC_POLICY>} Policy Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/ns-rpcdce-rpc_policy">RPC_POLICY</a> structure, which contains flags that set transport-specific attributes. In the case of the <b>ncadg_mq</b> transport, these flags specify the properties of the server process–receive queue. In the case of the <b>ncacn_ip_tcp</b> or <b>ncadg_ip_udp</b> transports, these flags restrict port allocation for dynamic ports and allow multihomed computers to selectively bind to network interface cards. 
     * 
     * 
     * 
     * 
     * The flag settings in the <b>Policy</b> field are effective only when the <b>ncacn_ip_tcp</b>, <b>ncadg_ip_udp</b>, or <b>ncadg_mq</b> protocol sequences are in use. For all other protocol sequences, the RPC run time ignores these values.
     * 
     * <div class="alert"><b>Note</b>  Portions of the policy associated with dynamic endpoints are ignored when the RpcServerUseProtseqEpEx function is called, since the port is specified in the endpoint itself.</div>
     * <div> </div>
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_PROTSEQ_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The protocol sequence is not supported on this host.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_RPC_PROTSEQ</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The protocol sequence is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_ENDPOINT_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The endpoint format is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OUT_OF_MEMORY</b></dt>
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
     * <dt><b>RPC_S_DUPLICATE_ENDPOINT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The endpoint is a duplicate.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_SECURITY_DESC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The security descriptor is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcserveruseprotseqepexw
     * @since windows5.0
     */
    static RpcServerUseProtseqEpExW(Protseq, MaxCalls, Endpoint, SecurityDescriptor, Policy) {
        Protseq := Protseq is String ? StrPtr(Protseq) : Protseq
        Endpoint := Endpoint is String ? StrPtr(Endpoint) : Endpoint

        result := DllCall("RPCRT4.dll\RpcServerUseProtseqEpExW", "ptr", Protseq, "uint", MaxCalls, "ptr", Endpoint, "ptr", SecurityDescriptor, "ptr", Policy, "int")
        return result
    }

    /**
     * The RpcServerUseProtseqIf function tells the RPC run-time library to use the specified protocol sequence combined with the endpoints in the interface specification for receiving remote procedure calls.
     * @param {PSTR} Protseq Pointer to a string identifier of the protocol sequence to register with the RPC run-time library.
     * @param {Integer} MaxCalls Backlog queue length for the <b>ncacn_ip_tcp</b> protocol sequence. All other protocol sequences ignore this parameter. Use RPC_C_PROTSEQ_MAX_REQS_DEFAULT to specify the default value. See Remarks.
     * @param {Pointer<Void>} IfSpec Interface containing endpoint information to use in creating a binding for the protocol sequence specified in the <i>Protseq</i> parameter.
     * @param {Pointer<Void>} SecurityDescriptor Pointer to an optional parameter provided for the security subsystem. Used only for <b>ncacn_np</b> and <b>ncalrpc</b> protocol sequences. All other protocol sequences ignore this parameter. Using a security descriptor on the endpoint in order to make a server secure is not recommended. This parameter does not appear in the DCE specification for this API.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_PROTSEQ_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The endpoint for this protocol sequence is not specified in the IDL file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_PROTSEQ_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The protocol sequence is not supported on this host.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_RPC_PROTSEQ</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The protocol sequence is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_ENDPOINT_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The endpoint format is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OUT_OF_MEMORY</b></dt>
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
     * <dt><b>RPC_S_INVALID_SECURITY_DESC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The security descriptor is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcserveruseprotseqifa
     * @since windows5.0
     */
    static RpcServerUseProtseqIfA(Protseq, MaxCalls, IfSpec, SecurityDescriptor) {
        Protseq := Protseq is String ? StrPtr(Protseq) : Protseq

        result := DllCall("RPCRT4.dll\RpcServerUseProtseqIfA", "ptr", Protseq, "uint", MaxCalls, "ptr", IfSpec, "ptr", SecurityDescriptor, "int")
        return result
    }

    /**
     * The RpcServerUseProtseqIfEx function tells the RPC run-time library to use the specified protocol sequence combined with the endpoints in the interface specification for receiving remote procedure calls.
     * @param {PSTR} Protseq Pointer to a string identifier of the protocol sequence to register with the RPC run-time library.
     * @param {Integer} MaxCalls Backlog queue length for the <b>ncacn_ip_tcp</b> protocol sequence. All other protocol sequences ignore this parameter. Use RPC_C_PROTSEQ_MAX_REQS_DEFAULT to specify the default value. See Remarks.
     * @param {Pointer<Void>} IfSpec Interface containing endpoint information to use in creating a binding for the protocol sequence specified in the <i>Protseq</i> parameter.
     * @param {Pointer<Void>} SecurityDescriptor Pointer to an optional parameter provided for the security subsystem. Used only for <b>ncacn_np</b> and <b>ncalrpc</b> protocol sequences. All other protocol sequences ignore this parameter. Using a security descriptor on the endpoint in order to make a server secure is not recommended. This parameter does not appear in the DCE specification for this API.
     * @param {Pointer<RPC_POLICY>} Policy Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/ns-rpcdce-rpc_policy">RPC_POLICY</a> structure, which contains flags to restrict port allocation for dynamic ports and that allow multihomed computers to selectively bind to network interface cards.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_PROTSEQ_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The endpoint for this protocol sequence is not specified in the IDL file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_PROTSEQ_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The protocol sequence is not supported on this host.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_RPC_PROTSEQ</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The protocol sequence is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_ENDPOINT_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The endpoint format is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OUT_OF_MEMORY</b></dt>
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
     * <dt><b>RPC_S_INVALID_SECURITY_DESC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The security descriptor is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcserveruseprotseqifexa
     * @since windows5.1.2600
     */
    static RpcServerUseProtseqIfExA(Protseq, MaxCalls, IfSpec, SecurityDescriptor, Policy) {
        Protseq := Protseq is String ? StrPtr(Protseq) : Protseq

        result := DllCall("RPCRT4.dll\RpcServerUseProtseqIfExA", "ptr", Protseq, "uint", MaxCalls, "ptr", IfSpec, "ptr", SecurityDescriptor, "ptr", Policy, "int")
        return result
    }

    /**
     * The RpcServerUseProtseqIf function tells the RPC run-time library to use the specified protocol sequence combined with the endpoints in the interface specification for receiving remote procedure calls.
     * @param {PWSTR} Protseq Pointer to a string identifier of the protocol sequence to register with the RPC run-time library.
     * @param {Integer} MaxCalls Backlog queue length for the <b>ncacn_ip_tcp</b> protocol sequence. All other protocol sequences ignore this parameter. Use RPC_C_PROTSEQ_MAX_REQS_DEFAULT to specify the default value. See Remarks.
     * @param {Pointer<Void>} IfSpec Interface containing endpoint information to use in creating a binding for the protocol sequence specified in the <i>Protseq</i> parameter.
     * @param {Pointer<Void>} SecurityDescriptor Pointer to an optional parameter provided for the security subsystem. Used only for <b>ncacn_np</b> and <b>ncalrpc</b> protocol sequences. All other protocol sequences ignore this parameter. Using a security descriptor on the endpoint in order to make a server secure is not recommended. This parameter does not appear in the DCE specification for this API.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_PROTSEQ_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The endpoint for this protocol sequence is not specified in the IDL file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_PROTSEQ_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The protocol sequence is not supported on this host.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_RPC_PROTSEQ</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The protocol sequence is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_ENDPOINT_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The endpoint format is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OUT_OF_MEMORY</b></dt>
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
     * <dt><b>RPC_S_INVALID_SECURITY_DESC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The security descriptor is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcserveruseprotseqifw
     * @since windows5.0
     */
    static RpcServerUseProtseqIfW(Protseq, MaxCalls, IfSpec, SecurityDescriptor) {
        Protseq := Protseq is String ? StrPtr(Protseq) : Protseq

        result := DllCall("RPCRT4.dll\RpcServerUseProtseqIfW", "ptr", Protseq, "uint", MaxCalls, "ptr", IfSpec, "ptr", SecurityDescriptor, "int")
        return result
    }

    /**
     * The RpcServerUseProtseqIfEx function tells the RPC run-time library to use the specified protocol sequence combined with the endpoints in the interface specification for receiving remote procedure calls.
     * @param {PWSTR} Protseq Pointer to a string identifier of the protocol sequence to register with the RPC run-time library.
     * @param {Integer} MaxCalls Backlog queue length for the <b>ncacn_ip_tcp</b> protocol sequence. All other protocol sequences ignore this parameter. Use RPC_C_PROTSEQ_MAX_REQS_DEFAULT to specify the default value. See Remarks.
     * @param {Pointer<Void>} IfSpec Interface containing endpoint information to use in creating a binding for the protocol sequence specified in the <i>Protseq</i> parameter.
     * @param {Pointer<Void>} SecurityDescriptor Pointer to an optional parameter provided for the security subsystem. Used only for <b>ncacn_np</b> and <b>ncalrpc</b> protocol sequences. All other protocol sequences ignore this parameter. Using a security descriptor on the endpoint in order to make a server secure is not recommended. This parameter does not appear in the DCE specification for this API.
     * @param {Pointer<RPC_POLICY>} Policy Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/ns-rpcdce-rpc_policy">RPC_POLICY</a> structure, which contains flags to restrict port allocation for dynamic ports and that allow multihomed computers to selectively bind to network interface cards.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_PROTSEQ_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The endpoint for this protocol sequence is not specified in the IDL file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_PROTSEQ_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The protocol sequence is not supported on this host.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_RPC_PROTSEQ</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The protocol sequence is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_ENDPOINT_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The endpoint format is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OUT_OF_MEMORY</b></dt>
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
     * <dt><b>RPC_S_INVALID_SECURITY_DESC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The security descriptor is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcserveruseprotseqifexw
     * @since windows5.1.2600
     */
    static RpcServerUseProtseqIfExW(Protseq, MaxCalls, IfSpec, SecurityDescriptor, Policy) {
        Protseq := Protseq is String ? StrPtr(Protseq) : Protseq

        result := DllCall("RPCRT4.dll\RpcServerUseProtseqIfExW", "ptr", Protseq, "uint", MaxCalls, "ptr", IfSpec, "ptr", SecurityDescriptor, "ptr", Policy, "int")
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    static RpcServerYield() {
        DllCall("RPCRT4.dll\RpcServerYield")
    }

    /**
     * The RpcMgmtStatsVectorFree function frees a statistics vector.
     * @param {Pointer<RPC_STATS_VECTOR>} StatsVector Pointer to a pointer to a statistics vector. On return, the pointer is set to <b>NULL</b>.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcmgmtstatsvectorfree
     * @since windows5.0
     */
    static RpcMgmtStatsVectorFree(StatsVector) {
        result := DllCall("RPCRT4.dll\RpcMgmtStatsVectorFree", "ptr", StatsVector, "int")
        return result
    }

    /**
     * The RpcMgmtInqStats function returns RPC run-time statistics.
     * @param {Pointer<Void>} Binding To receive statistics about a remote application, specify a server binding handle for that application. To receive statistics about your own (local) application, specify a value of <b>NULL</b>.
     * @param {Pointer<RPC_STATS_VECTOR>} Statistics Returns a pointer to a pointer to the statistics about the server specified by the <i>Binding</i> parameter. Each statistic is an <b>unsigned long</b> value.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The binding handle was invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_WRONG_KIND_OF_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This was the wrong kind of binding for the operation.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcmgmtinqstats
     * @since windows5.0
     */
    static RpcMgmtInqStats(Binding, Statistics) {
        result := DllCall("RPCRT4.dll\RpcMgmtInqStats", "ptr", Binding, "ptr", Statistics, "int")
        return result
    }

    /**
     * The RpcMgmtIsServerListening function tells whether a server is listening for remote procedure calls.
     * @param {Pointer<Void>} Binding To determine whether a remote application is listening for remote procedure calls, specify a server binding handle for that application. To determine whether your own (local) application is listening for remote procedure calls, specify a value of <b>NULL</b>.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Server listening for remote procedure calls.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NOT_LISTENING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Server not listening for remote procedure calls, or the interface is auto-listening.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The binding handle was invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_WRONG_KIND_OF_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This was the wrong kind of binding for the operation.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * 
     * <div> </div>
     * 
     * 
     * The 
     * <b>RpcMgmtIsServerListening</b> function returns correct results only for interfaces that are not auto-listening. If the server application is auto-listening and calls the 
     * <b>RpcMgmtIsServerListening</b> function, 
     * <b>RpcMgmtIsServerListening</b> returns RPC_SERVER_NOT_LISTENING, yet the server may be listening, and subsequent RPC calls may succeed.
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcmgmtisserverlistening
     * @since windows5.0
     */
    static RpcMgmtIsServerListening(Binding) {
        result := DllCall("RPCRT4.dll\RpcMgmtIsServerListening", "ptr", Binding, "int")
        return result
    }

    /**
     * The RpcMgmtStopServerListening function tells a server to stop listening for remote procedure calls. This function will not affect auto-listen interfaces. See RpcServerRegisterIfEx for more details.
     * @param {Pointer<Void>} Binding To direct a remote application to stop listening for remote procedure calls, specify a server binding handle for that application. To direct your own (local) application to stop listening for remote procedure calls, specify a value of <b>NULL</b>.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The binding handle was invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_WRONG_KIND_OF_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This was the wrong kind of binding for the operation.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcmgmtstopserverlistening
     * @since windows5.0
     */
    static RpcMgmtStopServerListening(Binding) {
        result := DllCall("RPCRT4.dll\RpcMgmtStopServerListening", "ptr", Binding, "int")
        return result
    }

    /**
     * The RpcMgmtWaitServerListen function performs the wait operation usually associated with RpcServerListen.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * All remote procedure calls are complete.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_ALREADY_LISTENING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Another thread has called 
     * <b>RpcMgmtWaitServerListen</b> and has not yet returned.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NOT_LISTENING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The server application must call 
     * <a href="/windows/desktop/api/rpcdce/nf-rpcdce-rpcserverlisten">RpcServerListen</a> before calling 
     * <b>RpcMgmtWaitServerListen</b>.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcmgmtwaitserverlisten
     * @since windows5.0
     */
    static RpcMgmtWaitServerListen() {
        result := DllCall("RPCRT4.dll\RpcMgmtWaitServerListen", "int")
        return result
    }

    /**
     * The RpcMgmtSetServerStackSize function specifies the stack size for server threads created by the RPC run time.
     * @param {Integer} ThreadStackSize Stack size allocated for each thread created by the RPC run time, in bytes. This value is applied to all threads created for the server, but not to threads already created. Select this value based on the stack requirements of the remote procedures offered by the server.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_ARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument was invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcmgmtsetserverstacksize
     * @since windows5.0
     */
    static RpcMgmtSetServerStackSize(ThreadStackSize) {
        result := DllCall("RPCRT4.dll\RpcMgmtSetServerStackSize", "uint", ThreadStackSize, "int")
        return result
    }

    /**
     * The RpcSsDontSerializeContext function disables run-time serialization of multiple calls dispatched to server-manager routines on the same context handle.
     * @remarks
     * 
     * The 
     * <b>RpcSsDontSerializeContext</b> function prevents the run time from performing this serialization service, allowing multiple calls to be dispatched on a given context handle. Calling this function does not disable serialization entirely—when a context run down occurs, your context run-down routine will not run until all outstanding client requests have completed. Changes to the context handle state, including freeing the context handle typically, must continue to be serialized.
     * 
     * It is recommended that, if your distributed application invokes the 
     * <b>RpcSsDontSerializeContext</b> function, the call should be made before the server program begins handling remote procedure calls.
     * 
     * <div class="alert"><b>Note</b>  Typically, the RPC run-time serializes calls on the same context handle dispatched to server manager routines. Context handles are maintained on a per-client basis and typically represent the server-side state. This means that your server manager does not have to guard against another thread from the same client changing the context or against the context running down while a call is dispatched.</div>
     * <div> </div>
     * <div class="alert"><b>Note</b>  After it is called, the 
     * <b>RpcSsDontSerializeContext</b> function is not revertible for the life of the process.</div>
     * <div> </div>
     * 
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcssdontserializecontext
     * @since windows5.0
     */
    static RpcSsDontSerializeContext() {
        DllCall("RPCRT4.dll\RpcSsDontSerializeContext")
    }

    /**
     * The RpcMgmtEnableIdleCleanup function enables RPC to close idle resources, such as network connections, on the client.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OUT_OF_THREADS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Out of threads.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OUT_OF_RESOURCES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Out of resources.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OUT_OF_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Out of memory.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcmgmtenableidlecleanup
     * @since windows5.0
     */
    static RpcMgmtEnableIdleCleanup() {
        result := DllCall("RPCRT4.dll\RpcMgmtEnableIdleCleanup", "int")
        return result
    }

    /**
     * The RpcMgmtInqIfIds function returns a vector containing the identifiers of the interfaces offered by the server.
     * @param {Pointer<Void>} Binding To receive interface identifiers about a remote application, specify a server binding handle for that application. To receive interface information about your own application, specify a value of <b>NULL</b>.
     * @param {Pointer<RPC_IF_ID_VECTOR>} IfIdVector Returns the address of an interface identifier vector.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The binding handle was invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_WRONG_KIND_OF_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This was the wrong kind of binding for the operation.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcmgmtinqifids
     * @since windows5.0
     */
    static RpcMgmtInqIfIds(Binding, IfIdVector) {
        result := DllCall("RPCRT4.dll\RpcMgmtInqIfIds", "ptr", Binding, "ptr", IfIdVector, "int")
        return result
    }

    /**
     * The RpcIfIdVectorFree function frees the vector and the interface-identification structures contained in the vector.
     * @param {Pointer<RPC_IF_ID_VECTOR>} IfIdVector Address of a pointer to a vector of interface information. On return, the pointer is set to <b>NULL</b>.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_ARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument was invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcifidvectorfree
     * @since windows5.0
     */
    static RpcIfIdVectorFree(IfIdVector) {
        result := DllCall("RPCNS4.dll\RpcIfIdVectorFree", "ptr", IfIdVector, "int")
        return result
    }

    /**
     * The RpcMgmtInqServerPrincName function returns a server's principal name.
     * @param {Pointer<Void>} Binding To receive the principal name for a server, specify a server binding handle for that server. To receive the principal name for your own (local) application, specify a value of <b>NULL</b>.
     * @param {Integer} AuthnSvc Authentication service for which a principal name is returned. Valid values are the constant for any valid security provider.
     * @param {Pointer<PSTR>} ServerPrincName Returns a principal name that is registered for the authentication service in <i>AuthnSvc</i> by the server referenced in <i>Binding</i>. If multiple names are registered, only one name is returned.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The binding handle was invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_WRONG_KIND_OF_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This was the wrong kind of binding for the operation.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcmgmtinqserverprincnamea
     * @since windows5.0
     */
    static RpcMgmtInqServerPrincNameA(Binding, AuthnSvc, ServerPrincName) {
        result := DllCall("RPCRT4.dll\RpcMgmtInqServerPrincNameA", "ptr", Binding, "uint", AuthnSvc, "ptr", ServerPrincName, "int")
        return result
    }

    /**
     * The RpcMgmtInqServerPrincName function returns a server's principal name.
     * @param {Pointer<Void>} Binding To receive the principal name for a server, specify a server binding handle for that server. To receive the principal name for your own (local) application, specify a value of <b>NULL</b>.
     * @param {Integer} AuthnSvc Authentication service for which a principal name is returned. Valid values are the constant for any valid security provider.
     * @param {Pointer<PWSTR>} ServerPrincName Returns a principal name that is registered for the authentication service in <i>AuthnSvc</i> by the server referenced in <i>Binding</i>. If multiple names are registered, only one name is returned.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The binding handle was invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_WRONG_KIND_OF_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This was the wrong kind of binding for the operation.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcmgmtinqserverprincnamew
     * @since windows5.0
     */
    static RpcMgmtInqServerPrincNameW(Binding, AuthnSvc, ServerPrincName) {
        result := DllCall("RPCRT4.dll\RpcMgmtInqServerPrincNameW", "ptr", Binding, "uint", AuthnSvc, "ptr", ServerPrincName, "int")
        return result
    }

    /**
     * The RpcServerInqDefaultPrincName function obtains the default principal name for a given authentication service.
     * @param {Integer} AuthnSvc Authentication service to use when the server receives a request for a remote procedure call.
     * @param {Pointer<PSTR>} PrincName Upon success, contains the default principal name for the given authentication service as specified by the <i>AuthnSvc</i> parameter. The authentication service in use defines the content of the name and its syntax. This principal name must be used as the <i>ServerPrincName</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcserverregisterauthinfo">RpcServerRegisterAuthInfo</a> function. If the function succeeds, <i>PrincName</i> must be freed using the <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcstringfree">RpcStringFree</a> function. If the function fails, the contents of <i>PrincName</i> is undefined and the caller has no obligation to free it.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OUT_OF_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcserverinqdefaultprincnamea
     * @since windows5.0
     */
    static RpcServerInqDefaultPrincNameA(AuthnSvc, PrincName) {
        result := DllCall("RPCRT4.dll\RpcServerInqDefaultPrincNameA", "uint", AuthnSvc, "ptr", PrincName, "int")
        return result
    }

    /**
     * The RpcServerInqDefaultPrincName function obtains the default principal name for a given authentication service.
     * @param {Integer} AuthnSvc Authentication service to use when the server receives a request for a remote procedure call.
     * @param {Pointer<PWSTR>} PrincName Upon success, contains the default principal name for the given authentication service as specified by the <i>AuthnSvc</i> parameter. The authentication service in use defines the content of the name and its syntax. This principal name must be used as the <i>ServerPrincName</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcserverregisterauthinfo">RpcServerRegisterAuthInfo</a> function. If the function succeeds, <i>PrincName</i> must be freed using the <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcstringfree">RpcStringFree</a> function. If the function fails, the contents of <i>PrincName</i> is undefined and the caller has no obligation to free it.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OUT_OF_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcserverinqdefaultprincnamew
     * @since windows5.0
     */
    static RpcServerInqDefaultPrincNameW(AuthnSvc, PrincName) {
        result := DllCall("RPCRT4.dll\RpcServerInqDefaultPrincNameW", "uint", AuthnSvc, "ptr", PrincName, "int")
        return result
    }

    /**
     * The RpcEpResolveBinding function resolves a partially-bound server binding handle into a fully-bound server binding handle.
     * @param {Pointer<Void>} Binding Partially-bound server binding handle to resolve to a fully-bound server binding handle.
     * @param {Pointer<Void>} IfSpec Stub-generated structure specifying the interface of interest.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The binding handle was invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_WRONG_KIND_OF_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This was the wrong kind of binding for the operation.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcepresolvebinding
     * @since windows5.0
     */
    static RpcEpResolveBinding(Binding, IfSpec) {
        result := DllCall("RPCRT4.dll\RpcEpResolveBinding", "ptr", Binding, "ptr", IfSpec, "int")
        return result
    }

    /**
     * The RpcNsBindingInqEntryName function returns the entry name from which the binding handle came.
     * @param {Pointer<Void>} Binding Binding handle whose name-service database entry name is returned.
     * @param {Integer} EntryNameSyntax Syntax used in <i>EntryName</i>. 
     * 
     * 
     * 
     * 
     * To use the syntax specified in the registry value entry
     * 
     * <b>HKEY_LOCAL_MACHINE\Software\Microsoft\Rpc\NameService\DefaultSyntax</b>, provide a value of RPC_C_NS_SYNTAX_DEFAULT.
     * @param {Pointer<PSTR>} EntryName Returns the address of a pointer to the name of the name-service database entry in which <i>Binding</i> was found. 
     * 
     * 
     * 
     * 
     * Specify a null value to prevent 
     * <b>RpcNsBindingInqEntryName</b> from returning the <i>EntryName</i> parameter. In this case, the application does not call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcstringfree">RpcStringFree</a> function.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The binding handle was invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NO_ENTRY_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No entry name for binding.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_NAME_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name syntax is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_UNSUPPORTED_NAME_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name syntax is unsupported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INCOMPLETE_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name is incomplete.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcnsbindinginqentrynamea
     * @since windows5.0
     */
    static RpcNsBindingInqEntryNameA(Binding, EntryNameSyntax, EntryName) {
        result := DllCall("RPCRT4.dll\RpcNsBindingInqEntryNameA", "ptr", Binding, "uint", EntryNameSyntax, "ptr", EntryName, "int")
        return result
    }

    /**
     * The RpcNsBindingInqEntryName function returns the entry name from which the binding handle came.
     * @param {Pointer<Void>} Binding Binding handle whose name-service database entry name is returned.
     * @param {Integer} EntryNameSyntax Syntax used in <i>EntryName</i>. 
     * 
     * 
     * 
     * 
     * To use the syntax specified in the registry value entry
     * 
     * <b>HKEY_LOCAL_MACHINE\Software\Microsoft\Rpc\NameService\DefaultSyntax</b>, provide a value of RPC_C_NS_SYNTAX_DEFAULT.
     * @param {Pointer<PWSTR>} EntryName Returns the address of a pointer to the name of the name-service database entry in which <i>Binding</i> was found. 
     * 
     * 
     * 
     * 
     * Specify a null value to prevent 
     * <b>RpcNsBindingInqEntryName</b> from returning the <i>EntryName</i> parameter. In this case, the application does not call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcstringfree">RpcStringFree</a> function.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The binding handle was invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NO_ENTRY_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No entry name for binding.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_NAME_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name syntax is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_UNSUPPORTED_NAME_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name syntax is unsupported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INCOMPLETE_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name is incomplete.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcnsbindinginqentrynamew
     * @since windows5.0
     */
    static RpcNsBindingInqEntryNameW(Binding, EntryNameSyntax, EntryName) {
        result := DllCall("RPCRT4.dll\RpcNsBindingInqEntryNameW", "ptr", Binding, "uint", EntryNameSyntax, "ptr", EntryName, "int")
        return result
    }

    /**
     * The RpcBindingCreate function creates a new fast RPC binding handle based on a supplied template.
     * @param {Pointer<RPC_BINDING_HANDLE_TEMPLATE_V1_A>} Template <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/ns-rpcdce-rpc_binding_handle_template_v1_a">RPC_BINDING_HANDLE_TEMPLATE</a> structure that describes the binding handle to be created by this call. This data may be overwritten during the call, so the API does not maintain a reference to this data. The caller must free the memory used by this structure when the API returns.
     * @param {Pointer<RPC_BINDING_HANDLE_SECURITY_V1_A>} Security <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/ns-rpcdce-rpc_binding_handle_security_v1_a">RPC_BINDING_HANDLE_SECURITY</a> structure that describes the security options for this binding handle. This data may be overwritten during the call, so the API does not maintain a reference to this data. The caller must free the memory used by this structure when the API returns.
     * 
     * This parameter is optional. If this parameter is set to <b>NULL</b>, the default security settings for <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/ns-rpcdce-rpc_binding_handle_security_v1_a">RPC_BINDING_HANDLE_SECURITY</a> will be used.
     * @param {Pointer<RPC_BINDING_HANDLE_OPTIONS_V1>} Options <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/ns-rpcdce-rpc_binding_handle_options_v1">RPC_BINDING_HANDLE_OPTIONS</a> structure that describes additional options for the binding handle. This data may be overwritten during the call, so the API does not maintain a reference to this data. The caller must free the memory used by this structure when the API returns.
     * 
     * This parameter is optional. If this parameter is set to <b>NULL</b>, the default options for <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/ns-rpcdce-rpc_binding_handle_options_v1">RPC_BINDING_HANDLE_OPTIONS</a> will be used.
     * @param {Pointer<Void>} Binding <a href="https://docs.microsoft.com/windows/desktop/Rpc/rpc-binding-handle">RPC_BINDING_HANDLE</a> structure that contains the newly-created binding handle. If this function did not return RPC_S_OK, then the contents of this structure are undefined. For non-local RPC calls, this handle must be passed to <a href="https://docs.microsoft.com/windows/desktop/api/rpcasync/nf-rpcasync-rpcbindingbind">RpcBindingBind</a>.
     * @returns {Integer} This function returns RPC_S_OK on success; otherwise, an RPC_S_* error code is returned. For information on these error codes, see <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The binding handle was successfully created.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_CANNOT_SUPPORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An obsolete feature of RPC was requested for this binding handle.
     * 
     * <div class="alert"><b>Note</b>  The only supported protocol sequences for this API is <b>ncalrpc</b>; choosing another protocol sequence results in the return of this error status code.</div>
     * <div> </div>
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcbindingcreatea
     * @since windows6.0.6000
     */
    static RpcBindingCreateA(Template, Security, Options, Binding) {
        result := DllCall("RPCRT4.dll\RpcBindingCreateA", "ptr", Template, "ptr", Security, "ptr", Options, "ptr", Binding, "int")
        return result
    }

    /**
     * The RpcBindingCreate function creates a new fast RPC binding handle based on a supplied template.
     * @param {Pointer<RPC_BINDING_HANDLE_TEMPLATE_V1_W>} Template <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/ns-rpcdce-rpc_binding_handle_template_v1_a">RPC_BINDING_HANDLE_TEMPLATE</a> structure that describes the binding handle to be created by this call. This data may be overwritten during the call, so the API does not maintain a reference to this data. The caller must free the memory used by this structure when the API returns.
     * @param {Pointer<RPC_BINDING_HANDLE_SECURITY_V1_W>} Security <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/ns-rpcdce-rpc_binding_handle_security_v1_a">RPC_BINDING_HANDLE_SECURITY</a> structure that describes the security options for this binding handle. This data may be overwritten during the call, so the API does not maintain a reference to this data. The caller must free the memory used by this structure when the API returns.
     * 
     * This parameter is optional. If this parameter is set to <b>NULL</b>, the default security settings for <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/ns-rpcdce-rpc_binding_handle_security_v1_a">RPC_BINDING_HANDLE_SECURITY</a> will be used.
     * @param {Pointer<RPC_BINDING_HANDLE_OPTIONS_V1>} Options <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/ns-rpcdce-rpc_binding_handle_options_v1">RPC_BINDING_HANDLE_OPTIONS</a> structure that describes additional options for the binding handle. This data may be overwritten during the call, so the API does not maintain a reference to this data. The caller must free the memory used by this structure when the API returns.
     * 
     * This parameter is optional. If this parameter is set to <b>NULL</b>, the default options for <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/ns-rpcdce-rpc_binding_handle_options_v1">RPC_BINDING_HANDLE_OPTIONS</a> will be used.
     * @param {Pointer<Void>} Binding <a href="https://docs.microsoft.com/windows/desktop/Rpc/rpc-binding-handle">RPC_BINDING_HANDLE</a> structure that contains the newly-created binding handle. If this function did not return RPC_S_OK, then the contents of this structure are undefined. For non-local RPC calls, this handle must be passed to <a href="https://docs.microsoft.com/windows/desktop/api/rpcasync/nf-rpcasync-rpcbindingbind">RpcBindingBind</a>.
     * @returns {Integer} This function returns RPC_S_OK on success; otherwise, an RPC_S_* error code is returned. For information on these error codes, see <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The binding handle was successfully created.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_CANNOT_SUPPORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An obsolete feature of RPC was requested for this binding handle.
     * 
     * <div class="alert"><b>Note</b>  The only supported protocol sequences for this API is <b>ncalrpc</b>; choosing another protocol sequence results in the return of this error status code.</div>
     * <div> </div>
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcbindingcreatew
     * @since windows6.0.6000
     */
    static RpcBindingCreateW(Template, Security, Options, Binding) {
        result := DllCall("RPCRT4.dll\RpcBindingCreateW", "ptr", Template, "ptr", Security, "ptr", Options, "ptr", Binding, "int")
        return result
    }

    /**
     * Obtains the binding handle for RPC calls serviced by the thread in which RpcServerInqBindingHandle is called.
     * @param {Pointer<Void>} Binding <a href="https://docs.microsoft.com/windows/desktop/Rpc/rpc-binding-handle">RPC_BINDING_HANDLE</a> structure that, upon success, receives the binding handle for the call serviced by the thread on which <b>RpcServerInqBindingHandle</b> is also called.
     * 
     * If the call fails, this parameter is undefined.
     * @returns {Integer} This function returns RPC_S_OK on success; otherwise, an RPC_S_* error code is returned. This function cannot fail unless it is called on a thread that is not currently servicing an RPC call.
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcserverinqbindinghandle
     * @since windows6.0.6000
     */
    static RpcServerInqBindingHandle(Binding) {
        result := DllCall("RPCRT4.dll\RpcServerInqBindingHandle", "ptr", Binding, "int")
        return result
    }

    /**
     * A server thread that is processing client remote procedure calls can call the RpcImpersonateClient function to impersonate the active client.
     * @param {Pointer<Void>} BindingHandle Binding handle on the server that represents a binding to a client. The server impersonates the client indicated by this handle. If a value of zero is specified, the server impersonates the client that is being served by this server thread.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NO_CALL_ACTIVE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No client is active on this server thread.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_CANNOT_SUPPORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function is not supported for either the operating system, the transport, or this security subsystem.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The binding handle was invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_WRONG_KIND_OF_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This was the wrong kind of binding for the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NO_CONTEXT_AVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The server does not have permission to impersonate the client.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcimpersonateclient
     * @since windows5.0
     */
    static RpcImpersonateClient(BindingHandle) {
        result := DllCall("RPCRT4.dll\RpcImpersonateClient", "ptr", BindingHandle, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} BindingHandle 
     * @returns {Integer} 
     */
    static RpcImpersonateClient2(BindingHandle) {
        result := DllCall("RPCRT4.dll\RpcImpersonateClient2", "ptr", BindingHandle, "int")
        return result
    }

    /**
     * The RpcRevertToSelfEx function allows a server to impersonate a client and then revert in a multithreaded operation where the call to impersonate a client can come from a thread other than the thread originally dispatched from the RPC.
     * @param {Pointer<Void>} BindingHandle Binding handle on the server that represents a binding to the client that the server impersonated. A value of zero specifies the client handle of the current thread; in this case, the functionality of 
     * <b>RpcRevertToSelfEx</b> is identical to that of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcreverttoself">RpcRevertToSelf</a> function.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NO_CALL_ACTIVE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The server does not have a client to impersonate.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The binding handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_WRONG_KIND_OF_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This is the wrong kind of binding for this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_CANNOT_SUPPORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call is not supported for this operating system, this transport, or this security subsystem.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcreverttoselfex
     * @since windows5.0
     */
    static RpcRevertToSelfEx(BindingHandle) {
        result := DllCall("RPCRT4.dll\RpcRevertToSelfEx", "ptr", BindingHandle, "int")
        return result
    }

    /**
     * After calling RpcImpersonateClient and completing any tasks that require client impersonation, the server calls RpcRevertToSelf to end impersonation and to reestablish its own security identity.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NO_CALL_ACTIVE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The server does not have a client to impersonate.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The binding handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_WRONG_KIND_OF_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This is the wrong kind of binding for this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_CANNOT_SUPPORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call is not supported for this operating system, this transport, or this security subsystem.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcreverttoself
     * @since windows5.0
     */
    static RpcRevertToSelf() {
        result := DllCall("RPCRT4.dll\RpcRevertToSelf", "int")
        return result
    }

    /**
     * RpcImpersonateClientContainer may be altered or unavailable.
     * @param {Pointer<Void>} BindingHandle Reserved.
     * @returns {Integer} Reserved.
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcimpersonateclientcontainer
     * @since windows10.0.10240
     */
    static RpcImpersonateClientContainer(BindingHandle) {
        result := DllCall("RPCRT4.dll\RpcImpersonateClientContainer", "ptr", BindingHandle, "int")
        return result
    }

    /**
     * RpcRevertContainerImpersonation may be altered or unavailable.
     * @returns {Integer} Reserved.
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcrevertcontainerimpersonation
     * @since windows10.0.10240
     */
    static RpcRevertContainerImpersonation() {
        result := DllCall("RPCRT4.dll\RpcRevertContainerImpersonation", "int")
        return result
    }

    /**
     * A server application calls the RpcBindingInqAuthClient function to obtain the principal name or privilege attributes of the authenticated client that made the remote procedure call.
     * @param {Pointer<Void>} ClientBinding Client binding handle of the client that made the remote procedure call. This value can be zero. See Remarks.
     * @param {Pointer<Void>} Privs Returns a pointer to a handle to the privileged information for the client application that made the remote procedure call on the <i>ClientBinding</i> binding handle. For <b>ncalrpc</b> calls, <i>Privs</i> contains a string with the client's principal name.
     * 
     * The data referenced by this parameter is read-only and should not be modified by the server application. If the server wants to preserve any of the returned data, the server must copy the data into server-allocated memory.
     * 
     * The data that the <i>Privs</i> parameter points to comes directly from the SSP. Therefore, the format of the data is specific to the SSP. For more information on SSPs, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Rpc/security-support-providers-ssps-">Security Support Providers (SSPs)</a>.
     * @param {Pointer<PSTR>} ServerPrincName Returns a pointer to a pointer to the server principal name specified by the server application that called the <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcserverregisterauthinfo">RpcServerRegisterAuthInfo</a> function. The content of the returned name and its syntax are defined by the authentication service in use. For the SCHANNEL SSP, the principal name is in Microsoft-standard (msstd) format. For further information on msstd format, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Rpc/principal-names">Principal Names</a>.
     * 
     * Specify a null value to prevent 
     * <b>RpcBindingInqAuthClient</b> from returning the <i>ServerPrincName</i> parameter. In this case, the application does not call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcstringfree">RpcStringFree</a> function.
     * @param {Pointer<UInt32>} AuthnLevel Returns a pointer set to the level of authentication requested by the client application that made the remote procedure call on the <i>ClientBinding</i> binding handle.
     * 
     * Specify a null value to prevent 
     * <b>RpcBindingInqAuthClient</b> from returning the <i>AuthnLevel</i> parameter.
     * @param {Pointer<UInt32>} AuthnSvc Returns a pointer set to the authentication service requested by the client application that made the remote procedure call on the <i>ClientBinding</i> binding handle. For a list of the RPC-supported authentication levels, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Rpc/authentication-level-constants">Authentication-Level Constants</a>.
     * 
     * Specify a null value to prevent 
     * <b>RpcBindingInqAuthClient</b> from returning the <i>AuthnSvc</i> parameter.
     * @param {Pointer<UInt32>} AuthzSvc Returns a pointer set to the authorization service requested by the client application that made the remote procedure call on the <i>ClientBinding</i> binding handle.
     * 
     * Specify a null value to prevent 
     * <b>RpcBindingInqAuthClient</b> from returning the <i>AuthzSvc</i> parameter. This parameter is not used by the RPC_C_AUTHN_WINNT authentication service. The returned value will always be RPC_C_AUTHZ_NONE.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The binding handle was invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_WRONG_KIND_OF_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This was the wrong kind of binding for the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_BINDING_HAS_NO_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Binding has no authentication information.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcbindinginqauthclienta
     * @since windows5.0
     */
    static RpcBindingInqAuthClientA(ClientBinding, Privs, ServerPrincName, AuthnLevel, AuthnSvc, AuthzSvc) {
        result := DllCall("RPCRT4.dll\RpcBindingInqAuthClientA", "ptr", ClientBinding, "ptr", Privs, "ptr", ServerPrincName, "uint*", AuthnLevel, "uint*", AuthnSvc, "uint*", AuthzSvc, "int")
        return result
    }

    /**
     * A server application calls the RpcBindingInqAuthClient function to obtain the principal name or privilege attributes of the authenticated client that made the remote procedure call.
     * @param {Pointer<Void>} ClientBinding Client binding handle of the client that made the remote procedure call. This value can be zero. See Remarks.
     * @param {Pointer<Void>} Privs Returns a pointer to a handle to the privileged information for the client application that made the remote procedure call on the <i>ClientBinding</i> binding handle. For <b>ncalrpc</b> calls, <i>Privs</i> contains a string with the client's principal name.
     * 
     * The data referenced by this parameter is read-only and should not be modified by the server application. If the server wants to preserve any of the returned data, the server must copy the data into server-allocated memory.
     * 
     * The data that the <i>Privs</i> parameter points to comes directly from the SSP. Therefore, the format of the data is specific to the SSP. For more information on SSPs, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Rpc/security-support-providers-ssps-">Security Support Providers (SSPs)</a>.
     * @param {Pointer<PWSTR>} ServerPrincName Returns a pointer to a pointer to the server principal name specified by the server application that called the <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcserverregisterauthinfo">RpcServerRegisterAuthInfo</a> function. The content of the returned name and its syntax are defined by the authentication service in use. For the SCHANNEL SSP, the principal name is in Microsoft-standard (msstd) format. For further information on msstd format, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Rpc/principal-names">Principal Names</a>.
     * 
     * Specify a null value to prevent 
     * <b>RpcBindingInqAuthClient</b> from returning the <i>ServerPrincName</i> parameter. In this case, the application does not call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcstringfree">RpcStringFree</a> function.
     * @param {Pointer<UInt32>} AuthnLevel Returns a pointer set to the level of authentication requested by the client application that made the remote procedure call on the <i>ClientBinding</i> binding handle.
     * 
     * Specify a null value to prevent 
     * <b>RpcBindingInqAuthClient</b> from returning the <i>AuthnLevel</i> parameter.
     * @param {Pointer<UInt32>} AuthnSvc Returns a pointer set to the authentication service requested by the client application that made the remote procedure call on the <i>ClientBinding</i> binding handle. For a list of the RPC-supported authentication levels, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Rpc/authentication-level-constants">Authentication-Level Constants</a>.
     * 
     * Specify a null value to prevent 
     * <b>RpcBindingInqAuthClient</b> from returning the <i>AuthnSvc</i> parameter.
     * @param {Pointer<UInt32>} AuthzSvc Returns a pointer set to the authorization service requested by the client application that made the remote procedure call on the <i>ClientBinding</i> binding handle.
     * 
     * Specify a null value to prevent 
     * <b>RpcBindingInqAuthClient</b> from returning the <i>AuthzSvc</i> parameter. This parameter is not used by the RPC_C_AUTHN_WINNT authentication service. The returned value will always be RPC_C_AUTHZ_NONE.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The binding handle was invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_WRONG_KIND_OF_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This was the wrong kind of binding for the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_BINDING_HAS_NO_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Binding has no authentication information.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcbindinginqauthclientw
     * @since windows5.0
     */
    static RpcBindingInqAuthClientW(ClientBinding, Privs, ServerPrincName, AuthnLevel, AuthnSvc, AuthzSvc) {
        result := DllCall("RPCRT4.dll\RpcBindingInqAuthClientW", "ptr", ClientBinding, "ptr", Privs, "ptr", ServerPrincName, "uint*", AuthnLevel, "uint*", AuthnSvc, "uint*", AuthzSvc, "int")
        return result
    }

    /**
     * A server application calls the RpcBindingInqAuthClientEx function to obtain extended information about the client program that made the remote procedure call.
     * @param {Pointer<Void>} ClientBinding Client binding handle of the client that made the remote procedure call. This value can be zero. See Remarks.
     * @param {Pointer<Void>} Privs Returns a pointer to a handle to the privileged information for the client application that made the remote procedure call on the <i>ClientBinding</i> binding handle. For <b>ncalrpc</b> calls, <i>Privs</i> contains a string with the client's principal name.
     * 
     * The server application must cast the <i>Privs</i> parameter to the data type specified by the <i>AuthnSvc</i> parameter. The data referenced by this argument is read-only and should not be modified by the server application. If the server wants to preserve any of the returned data, the server must copy the data into server-allocated memory.
     * 
     * For more information on SSPs, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Rpc/security-support-providers-ssps-">Security Support Providers (SSPs)</a>.
     * @param {Pointer<PSTR>} ServerPrincName Returns a pointer to a pointer to the server principal name specified by the server application that called the <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcserverregisterauthinfo">RpcServerRegisterAuthInfo</a> function. The content of the returned name and its syntax are defined by the authentication service in use. For the SCHANNEL SSP, the principal name is in msstd format. For further information on msstd format, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Rpc/principal-names">Principal Names</a>.
     * 
     * Specify a null value to prevent 
     * <b>RpcBindingInqAuthClientEx</b> from returning the <i>ServerPrincName</i> parameter. In this case, the application does not call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcstringfree">RpcStringFree</a> function.
     * @param {Pointer<UInt32>} AuthnLevel Returns a pointer set to the level of authentication requested by the client application that made the remote procedure call on the <i>ClientBinding</i> binding handle. For a list of the RPC-supported authentication levels, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Rpc/authentication-level-constants">Authentication-Level Constants</a>.
     * 
     * Specify a null value to prevent 
     * <b>RpcBindingInqAuthClientEx</b> from returning the <i>AuthnLevel</i> parameter.
     * @param {Pointer<UInt32>} AuthnSvc Returns a pointer set to the authentication service requested by the client application that made the remote procedure call on the <i>ClientBinding</i> binding handle. For a list of the RPC-supported authentication services, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Rpc/authentication-service-constants">Authentication-Service Constants</a>.
     * 
     * Specify a null value to prevent 
     * <b>RpcBindingInqAuthClientEx</b> from returning the <i>AuthnSvc</i> parameter.
     * 
     * <div class="alert"><b>Note</b>  <i>AuthnSvc</i> corresponds to the <b>SECURITY_STATUS</b> returned by <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-querycontextattributesa">QueryContextAttributes</a> on each certificate-based SSP for  <b>SECPKG_ATTR_DCE_INFO</b> or<b> SECPKG_ATTR_REMOTE_CERT_CONTEXT</b>.</div>
     * <div> </div>
     * @param {Pointer<UInt32>} AuthzSvc Returns a pointer set to the authorization service requested by the client application that made the remote procedure call on the <i>Binding</i> binding handle. For a list of the RPC-supported authorization services, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Rpc/authorization-service-constants">Authorization-Service Constants </a>.
     * 
     * Specify a null value to prevent 
     * <b>RpcBindingInqAuthClientEx</b> from returning the <i>AuthzSvc</i> parameter. This parameter is not used by the RPC_C_AUTHN_WINNT authentication service. The returned value will always be RPC_S_AUTHZ_NONE.
     * @param {Integer} Flags Controls the format of the principal name. This parameter can be set to the following value.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RPC_C_FULL_CERT_CHAIN"></a><a id="rpc_c_full_cert_chain"></a><dl>
     * <dt><b>RPC_C_FULL_CERT_CHAIN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Passes back the principal name in 
     * <a href="https://docs.microsoft.com/windows/desktop/Rpc/principal-names">fullsic</a> format.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The binding handle was invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_WRONG_KIND_OF_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This was the wrong kind of binding for the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_BINDING_HAS_NO_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Binding has no authentication information.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcbindinginqauthclientexa
     * @since windows5.0
     */
    static RpcBindingInqAuthClientExA(ClientBinding, Privs, ServerPrincName, AuthnLevel, AuthnSvc, AuthzSvc, Flags) {
        result := DllCall("RPCRT4.dll\RpcBindingInqAuthClientExA", "ptr", ClientBinding, "ptr", Privs, "ptr", ServerPrincName, "uint*", AuthnLevel, "uint*", AuthnSvc, "uint*", AuthzSvc, "uint", Flags, "int")
        return result
    }

    /**
     * A server application calls the RpcBindingInqAuthClientEx function to obtain extended information about the client program that made the remote procedure call.
     * @param {Pointer<Void>} ClientBinding Client binding handle of the client that made the remote procedure call. This value can be zero. See Remarks.
     * @param {Pointer<Void>} Privs Returns a pointer to a handle to the privileged information for the client application that made the remote procedure call on the <i>ClientBinding</i> binding handle. For <b>ncalrpc</b> calls, <i>Privs</i> contains a string with the client's principal name.
     * 
     * The server application must cast the <i>Privs</i> parameter to the data type specified by the <i>AuthnSvc</i> parameter. The data referenced by this argument is read-only and should not be modified by the server application. If the server wants to preserve any of the returned data, the server must copy the data into server-allocated memory.
     * 
     * For more information on SSPs, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Rpc/security-support-providers-ssps-">Security Support Providers (SSPs)</a>.
     * @param {Pointer<PWSTR>} ServerPrincName Returns a pointer to a pointer to the server principal name specified by the server application that called the <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcserverregisterauthinfo">RpcServerRegisterAuthInfo</a> function. The content of the returned name and its syntax are defined by the authentication service in use. For the SCHANNEL SSP, the principal name is in msstd format. For further information on msstd format, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Rpc/principal-names">Principal Names</a>.
     * 
     * Specify a null value to prevent 
     * <b>RpcBindingInqAuthClientEx</b> from returning the <i>ServerPrincName</i> parameter. In this case, the application does not call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcstringfree">RpcStringFree</a> function.
     * @param {Pointer<UInt32>} AuthnLevel Returns a pointer set to the level of authentication requested by the client application that made the remote procedure call on the <i>ClientBinding</i> binding handle. For a list of the RPC-supported authentication levels, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Rpc/authentication-level-constants">Authentication-Level Constants</a>.
     * 
     * Specify a null value to prevent 
     * <b>RpcBindingInqAuthClientEx</b> from returning the <i>AuthnLevel</i> parameter.
     * @param {Pointer<UInt32>} AuthnSvc Returns a pointer set to the authentication service requested by the client application that made the remote procedure call on the <i>ClientBinding</i> binding handle. For a list of the RPC-supported authentication services, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Rpc/authentication-service-constants">Authentication-Service Constants</a>.
     * 
     * Specify a null value to prevent 
     * <b>RpcBindingInqAuthClientEx</b> from returning the <i>AuthnSvc</i> parameter.
     * 
     * <div class="alert"><b>Note</b>  <i>AuthnSvc</i> corresponds to the <b>SECURITY_STATUS</b> returned by <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-querycontextattributesa">QueryContextAttributes</a> on each certificate-based SSP for  <b>SECPKG_ATTR_DCE_INFO</b> or<b> SECPKG_ATTR_REMOTE_CERT_CONTEXT</b>.</div>
     * <div> </div>
     * @param {Pointer<UInt32>} AuthzSvc Returns a pointer set to the authorization service requested by the client application that made the remote procedure call on the <i>Binding</i> binding handle. For a list of the RPC-supported authorization services, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Rpc/authorization-service-constants">Authorization-Service Constants </a>.
     * 
     * Specify a null value to prevent 
     * <b>RpcBindingInqAuthClientEx</b> from returning the <i>AuthzSvc</i> parameter. This parameter is not used by the RPC_C_AUTHN_WINNT authentication service. The returned value will always be RPC_S_AUTHZ_NONE.
     * @param {Integer} Flags Controls the format of the principal name. This parameter can be set to the following value.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RPC_C_FULL_CERT_CHAIN"></a><a id="rpc_c_full_cert_chain"></a><dl>
     * <dt><b>RPC_C_FULL_CERT_CHAIN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Passes back the principal name in 
     * <a href="https://docs.microsoft.com/windows/desktop/Rpc/principal-names">fullsic</a> format.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The binding handle was invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_WRONG_KIND_OF_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This was the wrong kind of binding for the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_BINDING_HAS_NO_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Binding has no authentication information.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcbindinginqauthclientexw
     * @since windows5.0
     */
    static RpcBindingInqAuthClientExW(ClientBinding, Privs, ServerPrincName, AuthnLevel, AuthnSvc, AuthzSvc, Flags) {
        result := DllCall("RPCRT4.dll\RpcBindingInqAuthClientExW", "ptr", ClientBinding, "ptr", Privs, "ptr", ServerPrincName, "uint*", AuthnLevel, "uint*", AuthnSvc, "uint*", AuthzSvc, "uint", Flags, "int")
        return result
    }

    /**
     * The RpcBindingInqAuthInfo function returns authentication and authorization information from a binding handle.
     * @param {Pointer<Void>} Binding Server binding handle from which authentication and authorization information is returned.
     * @param {Pointer<PSTR>} ServerPrincName Returns a pointer to a pointer to the expected principal name of the server referenced in <i>Binding</i>. The content of the returned name and its syntax are defined by the authentication service in use.
     * 
     * Specify a null value to prevent 
     * <b>RpcBindingInqAuthInfo</b> from returning the <i>ServerPrincName</i> parameter. In this case, the application does not call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcstringfree">RpcStringFree</a> function.
     * @param {Pointer<UInt32>} AuthnLevel Returns a pointer set to the level of authentication used for remote procedure calls made using <i>Binding</i>. See Note.
     * 
     * Specify a null value to prevent the function from returning the <i>AuthnLevel</i> parameter.
     * 
     * The level returned in the <i>AuthnLevel</i> parameter may be different from the level specified when the client called the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcbindingsetauthinfo">RpcBindingSetAuthInfo</a> function. This discrepancy occurs when the RPC run-time library does not support the authentication level specified by the client and automatically upgrades to the next higher authentication level.
     * @param {Pointer<UInt32>} AuthnSvc Returns a pointer set to the authentication service specified for remote procedure calls made using <i>Binding</i>. See Note.
     * 
     * Specify a null value to prevent 
     * <b>RpcBindingInqAuthInfo</b> from returning the <i>AuthnSvc</i> parameter.
     * @param {Pointer<Void>} AuthIdentity Returns a pointer to a handle to the data structure that contains the client's authentication and authorization credentials specified for remote procedure calls made using <i>Binding</i>.
     * 
     * Specify a null value to prevent 
     * <b>RpcBindingInqAuthInfo</b> from returning the <i>AuthIdentity</i> parameter.
     * @param {Pointer<UInt32>} AuthzSvc Returns a pointer set to the authorization service requested by the client application that made the remote procedure call on <i>Binding</i> See Note.
     * 
     * Specify a null value to prevent 
     * <b>RpcBindingInqAuthInfo</b> from returning the <i>AuthzSvc</i> parameter.
     * 
     * <div class="alert"><b>Note</b>  For a list of the RPC-supported authentication services, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Rpc/authentication-service-constants">Authentication-Service Constants</a>.</div>
     * <div> </div>
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The binding handle was invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_WRONG_KIND_OF_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This was the wrong kind of binding for the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_BINDING_HAS_NO_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Binding has no authentication information.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcbindinginqauthinfoa
     * @since windows5.0
     */
    static RpcBindingInqAuthInfoA(Binding, ServerPrincName, AuthnLevel, AuthnSvc, AuthIdentity, AuthzSvc) {
        result := DllCall("RPCRT4.dll\RpcBindingInqAuthInfoA", "ptr", Binding, "ptr", ServerPrincName, "uint*", AuthnLevel, "uint*", AuthnSvc, "ptr", AuthIdentity, "uint*", AuthzSvc, "int")
        return result
    }

    /**
     * The RpcBindingInqAuthInfo function returns authentication and authorization information from a binding handle.
     * @param {Pointer<Void>} Binding Server binding handle from which authentication and authorization information is returned.
     * @param {Pointer<PWSTR>} ServerPrincName Returns a pointer to a pointer to the expected principal name of the server referenced in <i>Binding</i>. The content of the returned name and its syntax are defined by the authentication service in use.
     * 
     * Specify a null value to prevent 
     * <b>RpcBindingInqAuthInfo</b> from returning the <i>ServerPrincName</i> parameter. In this case, the application does not call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcstringfree">RpcStringFree</a> function.
     * @param {Pointer<UInt32>} AuthnLevel Returns a pointer set to the level of authentication used for remote procedure calls made using <i>Binding</i>. See Note.
     * 
     * Specify a null value to prevent the function from returning the <i>AuthnLevel</i> parameter.
     * 
     * The level returned in the <i>AuthnLevel</i> parameter may be different from the level specified when the client called the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcbindingsetauthinfo">RpcBindingSetAuthInfo</a> function. This discrepancy occurs when the RPC run-time library does not support the authentication level specified by the client and automatically upgrades to the next higher authentication level.
     * @param {Pointer<UInt32>} AuthnSvc Returns a pointer set to the authentication service specified for remote procedure calls made using <i>Binding</i>. See Note.
     * 
     * Specify a null value to prevent 
     * <b>RpcBindingInqAuthInfo</b> from returning the <i>AuthnSvc</i> parameter.
     * @param {Pointer<Void>} AuthIdentity Returns a pointer to a handle to the data structure that contains the client's authentication and authorization credentials specified for remote procedure calls made using <i>Binding</i>.
     * 
     * Specify a null value to prevent 
     * <b>RpcBindingInqAuthInfo</b> from returning the <i>AuthIdentity</i> parameter.
     * @param {Pointer<UInt32>} AuthzSvc Returns a pointer set to the authorization service requested by the client application that made the remote procedure call on <i>Binding</i> See Note.
     * 
     * Specify a null value to prevent 
     * <b>RpcBindingInqAuthInfo</b> from returning the <i>AuthzSvc</i> parameter.
     * 
     * <div class="alert"><b>Note</b>  For a list of the RPC-supported authentication services, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Rpc/authentication-service-constants">Authentication-Service Constants</a>.</div>
     * <div> </div>
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The binding handle was invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_WRONG_KIND_OF_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This was the wrong kind of binding for the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_BINDING_HAS_NO_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Binding has no authentication information.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcbindinginqauthinfow
     * @since windows5.0
     */
    static RpcBindingInqAuthInfoW(Binding, ServerPrincName, AuthnLevel, AuthnSvc, AuthIdentity, AuthzSvc) {
        result := DllCall("RPCRT4.dll\RpcBindingInqAuthInfoW", "ptr", Binding, "ptr", ServerPrincName, "uint*", AuthnLevel, "uint*", AuthnSvc, "ptr", AuthIdentity, "uint*", AuthzSvc, "int")
        return result
    }

    /**
     * The RpcBindingSetAuthInfo function sets a binding handle's authentication and authorization information.
     * @param {Pointer<Void>} Binding Server binding handle to which authentication and authorization information is to be applied.
     * @param {PSTR} ServerPrincName Pointer to the expected principal name of the server referenced by <i>Binding</i>. The content of the name and its syntax are defined by the authentication service in use. 
     * 
     * <div class="alert"><b>Note</b>  For the set of allowable target names for SSPs, please refer to the comments in the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-initializesecuritycontexta">InitializeSecurityContext</a> documentation.</div>
     * <div> </div>
     * @param {Integer} AuthnLevel Level of authentication to be performed on remote procedure calls made using <i>Binding</i>. For a list of the RPC-supported authentication levels, see the list of 
     * <a href="https://docs.microsoft.com/windows/desktop/Rpc/authentication-level-constants">Authentication-Level Constants</a>.
     * @param {Integer} AuthnSvc Authentication service to use. See Note. 
     * 
     * 
     * 
     * 
     * Specify RPC_C_AUTHN_NONE to turn off authentication for remote procedure calls made using <i>Binding</i>.
     * 
     * If RPC_C_AUTHN_DEFAULT is specified, the RPC run-time library uses the RPC_C_AUTHN_WINNT authentication service for remote procedure calls made using <i>Binding</i>.
     * @param {Pointer<Void>} AuthIdentity Handle to the structure containing the client's authentication and authorization credentials appropriate for the selected authentication and authorization service.When using the RPC_C_AUTHN_WINNT authentication service <i>AuthIdentity</i> should be a pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/ns-rpcdce-sec_winnt_auth_identity_a">SEC_WINNT_AUTH_IDENTITY</a> structure (defined in Rpcdce.h). Kerberos and Negotiate authentication services also use the 
     * <b>SEC_WINNT_AUTH_IDENTITY</b> structure. 
     * 
     * 
     * 
     * 
     * When you select the RPC_C_AUTHN_GSS_SCHANNEL authentication service, the <i>AuthIdentity</i> parameter should be a pointer to an <b>SCHANNEL_CRED</b> structure (defined in Schannel.h). Specify a null value to use the security login context for the current address space. Pass the value RPC_C_NO_CREDENTIALS to use an anonymous log-in context.
     * 
     * <div class="alert"><b>Note</b>  When selecting the RPC_C_AUTHN_GSS_SCHANNEL authentication service, the <i>AuthIdentity</i> parameter may also be a pointer to a <b>SCH_CRED</b> structure. However, in Windows XP and later releases of Windows, the only acceptable structure to be passed as the <i>AuthIdentity</i> parameter for the RPC_C_AUTHN_GSS_SCHANNEL authentication service is the <b>SCHANNEL_CRED</b> structure.</div>
     * <div> </div>
     * @param {Integer} AuthzSvc Authorization service implemented by the server for the interface of interest. See Note. 
     * 
     * 
     * 
     * 
     * The validity and trustworthiness of authorization data, like any application data, depends on the authentication service and authentication level selected. This parameter is ignored when using the RPC_C_AUTHN_WINNT authentication service.
     * 
     * <div class="alert"><b>Note</b>  For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Rpc/authentication-service-constants">Authentication-Service Constants</a>.</div>
     * <div> </div>
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The binding handle was invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_WRONG_KIND_OF_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This was the wrong kind of binding for the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_UNKNOWN_AUTHN_SERVICE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unknown authentication service.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcbindingsetauthinfoa
     * @since windows5.0
     */
    static RpcBindingSetAuthInfoA(Binding, ServerPrincName, AuthnLevel, AuthnSvc, AuthIdentity, AuthzSvc) {
        ServerPrincName := ServerPrincName is String ? StrPtr(ServerPrincName) : ServerPrincName

        result := DllCall("RPCRT4.dll\RpcBindingSetAuthInfoA", "ptr", Binding, "ptr", ServerPrincName, "uint", AuthnLevel, "uint", AuthnSvc, "ptr", AuthIdentity, "uint", AuthzSvc, "int")
        return result
    }

    /**
     * The RpcBindingSetAuthInfoEx function sets a binding handle's authentication, authorization, and security quality-of-service information.
     * @param {Pointer<Void>} Binding Server binding handle into which authentication and authorization information is set.
     * @param {PSTR} ServerPrincName Pointer to the expected principal name of the server referenced by <i>Binding</i>. The content of the name and its syntax are defined by the authentication service in use.
     * 
     * <div class="alert"><b>Note</b>  For the set of allowable target names for SSPs, please refer to the comments in the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-initializesecuritycontexta">InitializeSecurityContext</a> documentation.</div>
     * <div> </div>
     * @param {Integer} AuthnLevel Level of authentication to be performed on remote procedure calls made using <i>Binding</i>. For a list of the RPC-supported authentication levels, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Rpc/authentication-level-constants">Authentication-Level Constants</a>.
     * @param {Integer} AuthnSvc Authentication service to use.
     * 
     * Specify RPC_C_AUTHN_NONE to turn off authentication for remote procedure calls made using <i>Binding</i>.
     * 
     * If RPC_C_AUTHN_DEFAULT is specified, the RPC run-time library uses the RPC_C_AUTHN_WINNT authentication service for remote procedure calls made using <i>Binding</i>.
     * @param {Pointer<Void>} AuthIdentity Handle for the structure that contains the client's authentication and authorization credentials appropriate for the selected authentication and authorization service. 
     * 
     * 
     * 
     * 
     * When using the <a href="https://docs.microsoft.com/windows/desktop/Rpc/authentication-service-constants">RPC_C_AUTHN_WINNT</a>authentication service <i>AuthIdentity</i> should be a pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/ns-rpcdce-sec_winnt_auth_identity_a">SEC_WINNT_AUTH_IDENTITY</a> structure (defined in Rpcdce.h). Kerberos and Negotiate authentication services also use the 
     * <b>SEC_WINNT_AUTH_IDENTITY</b> structure.
     * 
     * Specify a null value to use the security login context for the current address space. Pass the value RPC_C_NO_CREDENTIALS to use an anonymous log-in context. Note that RPC_C_NO_CREDENTIALS is only valid if RPC_C_AUTHN_GSS_SCHANNEL is selected as the authentication service.
     * @param {Integer} AuthzSvc Authorization service implemented by the server for the interface of interest. The validity and trustworthiness of authorization data, like any application data, depends on the authentication service and authentication level selected. This parameter is ignored when using the RPC_C_AUTHN_WINNT authentication service. See Note.
     * @param {Pointer<RPC_SECURITY_QOS>} SecurityQos TBD
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The binding handle was invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_WRONG_KIND_OF_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This was the wrong kind of binding for the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_UNKNOWN_AUTHN_SERVICE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unknown authentication service.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcbindingsetauthinfoexa
     * @since windows5.0
     */
    static RpcBindingSetAuthInfoExA(Binding, ServerPrincName, AuthnLevel, AuthnSvc, AuthIdentity, AuthzSvc, SecurityQos) {
        ServerPrincName := ServerPrincName is String ? StrPtr(ServerPrincName) : ServerPrincName

        result := DllCall("RPCRT4.dll\RpcBindingSetAuthInfoExA", "ptr", Binding, "ptr", ServerPrincName, "uint", AuthnLevel, "uint", AuthnSvc, "ptr", AuthIdentity, "uint", AuthzSvc, "ptr", SecurityQos, "int")
        return result
    }

    /**
     * The RpcBindingSetAuthInfo function sets a binding handle's authentication and authorization information.
     * @param {Pointer<Void>} Binding Server binding handle to which authentication and authorization information is to be applied.
     * @param {PWSTR} ServerPrincName Pointer to the expected principal name of the server referenced by <i>Binding</i>. The content of the name and its syntax are defined by the authentication service in use. 
     * 
     * <div class="alert"><b>Note</b>  For the set of allowable target names for SSPs, please refer to the comments in the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-initializesecuritycontexta">InitializeSecurityContext</a> documentation.</div>
     * <div> </div>
     * @param {Integer} AuthnLevel Level of authentication to be performed on remote procedure calls made using <i>Binding</i>. For a list of the RPC-supported authentication levels, see the list of 
     * <a href="https://docs.microsoft.com/windows/desktop/Rpc/authentication-level-constants">Authentication-Level Constants</a>.
     * @param {Integer} AuthnSvc Authentication service to use. See Note. 
     * 
     * 
     * 
     * 
     * Specify RPC_C_AUTHN_NONE to turn off authentication for remote procedure calls made using <i>Binding</i>.
     * 
     * If RPC_C_AUTHN_DEFAULT is specified, the RPC run-time library uses the RPC_C_AUTHN_WINNT authentication service for remote procedure calls made using <i>Binding</i>.
     * @param {Pointer<Void>} AuthIdentity Handle to the structure containing the client's authentication and authorization credentials appropriate for the selected authentication and authorization service.When using the RPC_C_AUTHN_WINNT authentication service <i>AuthIdentity</i> should be a pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/ns-rpcdce-sec_winnt_auth_identity_a">SEC_WINNT_AUTH_IDENTITY</a> structure (defined in Rpcdce.h). Kerberos and Negotiate authentication services also use the 
     * <b>SEC_WINNT_AUTH_IDENTITY</b> structure. 
     * 
     * When you select the RPC_C_AUTHN_GSS_SCHANNEL authentication service, the <i>AuthIdentity</i> parameter should be a pointer to an <b>SCHANNEL_CRED</b> structure (defined in Schannel.h). Specify a null value to use the security login context for the current address space. Pass the value RPC_C_NO_CREDENTIALS to use an anonymous log-in context.
     * 
     * <div class="alert"><b>Note</b>  When selecting the RPC_C_AUTHN_GSS_SCHANNEL authentication service, the <i>AuthIdentity</i> parameter may also be a pointer to a <b>SCH_CRED</b> structure. However, in Windows XP and later releases of Windows, the only acceptable structure to be passed as the <i>AuthIdentity</i> parameter for the RPC_C_AUTHN_GSS_SCHANNEL authentication service is the <b>SCHANNEL_CRED</b> structure.</div>
     * <div> </div>
     * @param {Integer} AuthzSvc Authorization service implemented by the server for the interface of interest. See Note. 
     * 
     * 
     * 
     * 
     * The validity and trustworthiness of authorization data, like any application data, depends on the authentication service and authentication level selected. This parameter is ignored when using the RPC_C_AUTHN_WINNT authentication service.
     * 
     * <div class="alert"><b>Note</b>  For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Rpc/authentication-service-constants">Authentication-Service Constants</a>.</div>
     * <div> </div>
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The binding handle was invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_WRONG_KIND_OF_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This was the wrong kind of binding for the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_UNKNOWN_AUTHN_SERVICE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unknown authentication service.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcbindingsetauthinfow
     * @since windows5.0
     */
    static RpcBindingSetAuthInfoW(Binding, ServerPrincName, AuthnLevel, AuthnSvc, AuthIdentity, AuthzSvc) {
        ServerPrincName := ServerPrincName is String ? StrPtr(ServerPrincName) : ServerPrincName

        result := DllCall("RPCRT4.dll\RpcBindingSetAuthInfoW", "ptr", Binding, "ptr", ServerPrincName, "uint", AuthnLevel, "uint", AuthnSvc, "ptr", AuthIdentity, "uint", AuthzSvc, "int")
        return result
    }

    /**
     * The RpcBindingSetAuthInfoEx function sets a binding handle's authentication, authorization, and security quality-of-service information.
     * @param {Pointer<Void>} Binding Server binding handle into which authentication and authorization information is set.
     * @param {PWSTR} ServerPrincName Pointer to the expected principal name of the server referenced by <i>Binding</i>. The content of the name and its syntax are defined by the authentication service in use.
     * 
     * <div class="alert"><b>Note</b>  For the set of allowable target names for SSPs, please refer to the comments in the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-initializesecuritycontexta">InitializeSecurityContext</a> documentation.</div>
     * <div> </div>
     * @param {Integer} AuthnLevel Level of authentication to be performed on remote procedure calls made using <i>Binding</i>. For a list of the RPC-supported authentication levels, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Rpc/authentication-level-constants">Authentication-Level Constants</a>.
     * @param {Integer} AuthnSvc Authentication service to use.
     * 
     * Specify RPC_C_AUTHN_NONE to turn off authentication for remote procedure calls made using <i>Binding</i>.
     * 
     * If RPC_C_AUTHN_DEFAULT is specified, the RPC run-time library uses the RPC_C_AUTHN_WINNT authentication service for remote procedure calls made using <i>Binding</i>.
     * @param {Pointer<Void>} AuthIdentity Handle for the structure that contains the client's authentication and authorization credentials appropriate for the selected authentication and authorization service. 
     * 
     * 
     * 
     * 
     * When using the <a href="https://docs.microsoft.com/windows/desktop/Rpc/authentication-service-constants">RPC_C_AUTHN_WINNT</a>authentication service <i>AuthIdentity</i> should be a pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/ns-rpcdce-sec_winnt_auth_identity_a">SEC_WINNT_AUTH_IDENTITY</a> structure (defined in Rpcdce.h). Kerberos and Negotiate authentication services also use the 
     * <b>SEC_WINNT_AUTH_IDENTITY</b> structure.
     * 
     * Specify a null value to use the security login context for the current address space. Pass the value RPC_C_NO_CREDENTIALS to use an anonymous log-in context. Note that RPC_C_NO_CREDENTIALS is only valid if RPC_C_AUTHN_GSS_SCHANNEL is selected as the authentication service.
     * @param {Integer} AuthzSvc Authorization service implemented by the server for the interface of interest. The validity and trustworthiness of authorization data, like any application data, depends on the authentication service and authentication level selected. This parameter is ignored when using the RPC_C_AUTHN_WINNT authentication service. See Note.
     * @param {Pointer<RPC_SECURITY_QOS>} SecurityQOS Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/ns-rpcdce-rpc_security_qos">RPC_SECURITY_QOS</a> structure, which defines the security quality-of-service. 
     * 
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  For a list of the RPC-supported authentication services, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Rpc/authentication-service-constants">Authentication-Service Constants</a>.</div>
     * <div> </div>
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The binding handle was invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_WRONG_KIND_OF_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This was the wrong kind of binding for the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_UNKNOWN_AUTHN_SERVICE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unknown authentication service.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcbindingsetauthinfoexw
     * @since windows5.0
     */
    static RpcBindingSetAuthInfoExW(Binding, ServerPrincName, AuthnLevel, AuthnSvc, AuthIdentity, AuthzSvc, SecurityQOS) {
        ServerPrincName := ServerPrincName is String ? StrPtr(ServerPrincName) : ServerPrincName

        result := DllCall("RPCRT4.dll\RpcBindingSetAuthInfoExW", "ptr", Binding, "ptr", ServerPrincName, "uint", AuthnLevel, "uint", AuthnSvc, "ptr", AuthIdentity, "uint", AuthzSvc, "ptr", SecurityQOS, "int")
        return result
    }

    /**
     * The RpcBindingInqAuthInfoEx function returns authentication, authorization, and security quality-of-service information from a binding handle.
     * @param {Pointer<Void>} Binding Server binding handle from which authentication and authorization information is returned.
     * @param {Pointer<PSTR>} ServerPrincName Returns a pointer to a pointer to the expected principal name of the server referenced in <i>Binding</i>. The content of the returned name and its syntax are defined by the authentication service in use.
     * 
     * Specify a null value to prevent 
     * <b>RpcBindingInqAuthInfoEx</b> from returning the <i>ServerPrincName</i> parameter. In this case, the application does not call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcstringfree">RpcStringFree</a> function.
     * @param {Pointer<UInt32>} AuthnLevel Returns a pointer set to the level of authentication used for remote procedure calls made using <i>Binding</i>. For a list of the RPC-supported authentication levels, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Rpc/authentication-level-constants">Authentication-Level Constants</a>. Specify a null value to prevent the function from returning the <i>AuthnLevel</i> parameter.
     * 
     * The level returned in the <i>AuthnLevel</i> parameter may be different from the level specified when the client called the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcbindingsetauthinfoexa">RpcBindingSetAuthInfoEx</a> function. This discrepancy happens when the RPC run-time library does not support the authentication level specified by the client and automatically upgrades to the next higher authentication level.
     * @param {Pointer<UInt32>} AuthnSvc Returns a pointer set to the authentication service specified for remote procedure calls made using <i>Binding</i>. For a list of the RPC-supported authentication services, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Rpc/authentication-service-constants">Authentication-Service Constants</a>.
     * 
     * Specify a null value to prevent 
     * <b>RpcBindingInqAuthInfoEx</b> from returning the <i>AuthnSvc</i> parameter.
     * @param {Pointer<Void>} AuthIdentity Returns a pointer to a handle to the data structure that contains the client's authentication and authorization credentials specified for remote procedure calls made using <i>Binding</i>.
     * 
     * Specify a null value to prevent 
     * <b>RpcBindingInqAuthInfoEx</b> from returning the <i>AuthIdentity</i> parameter.
     * @param {Pointer<UInt32>} AuthzSvc Returns a pointer set to the authorization service requested by the client application that made the remote procedure call on <i>Binding</i>. For a list of the RPC-supported authentication services, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Rpc/authentication-service-constants">Authentication-Service Constants</a>.
     * 
     * Specify a null value to prevent 
     * <b>RpcBindingInqAuthInfoEx</b> from returning the <i>AuthzSvc</i> parameter.
     * @param {Integer} RpcQosVersion Passes value of current version (needed for forward compatibility if extensions are made to this function). Always set this parameter to RPC_C_SECURITY_QOS_VERSION.
     * @param {Pointer<RPC_SECURITY_QOS>} SecurityQOS Returns pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/ns-rpcdce-rpc_security_qos">RPC_SECURITY_QOS</a> structure, which defines quality-of-service settings.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The binding handle was invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_WRONG_KIND_OF_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This was the wrong kind of binding for the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_BINDING_HAS_NO_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Binding has no authentication information.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcbindinginqauthinfoexa
     * @since windows5.0
     */
    static RpcBindingInqAuthInfoExA(Binding, ServerPrincName, AuthnLevel, AuthnSvc, AuthIdentity, AuthzSvc, RpcQosVersion, SecurityQOS) {
        result := DllCall("RPCRT4.dll\RpcBindingInqAuthInfoExA", "ptr", Binding, "ptr", ServerPrincName, "uint*", AuthnLevel, "uint*", AuthnSvc, "ptr", AuthIdentity, "uint*", AuthzSvc, "uint", RpcQosVersion, "ptr", SecurityQOS, "int")
        return result
    }

    /**
     * The RpcBindingInqAuthInfoEx function returns authentication, authorization, and security quality-of-service information from a binding handle.
     * @param {Pointer<Void>} Binding Server binding handle from which authentication and authorization information is returned.
     * @param {Pointer<PWSTR>} ServerPrincName Returns a pointer to a pointer to the expected principal name of the server referenced in <i>Binding</i>. The content of the returned name and its syntax are defined by the authentication service in use.
     * 
     * Specify a null value to prevent 
     * <b>RpcBindingInqAuthInfoEx</b> from returning the <i>ServerPrincName</i> parameter. In this case, the application does not call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcstringfree">RpcStringFree</a> function.
     * @param {Pointer<UInt32>} AuthnLevel Returns a pointer set to the level of authentication used for remote procedure calls made using <i>Binding</i>. For a list of the RPC-supported authentication levels, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Rpc/authentication-level-constants">Authentication-Level Constants</a>. Specify a null value to prevent the function from returning the <i>AuthnLevel</i> parameter.
     * 
     * The level returned in the <i>AuthnLevel</i> parameter may be different from the level specified when the client called the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcbindingsetauthinfoexa">RpcBindingSetAuthInfoEx</a> function. This discrepancy happens when the RPC run-time library does not support the authentication level specified by the client and automatically upgrades to the next higher authentication level.
     * @param {Pointer<UInt32>} AuthnSvc Returns a pointer set to the authentication service specified for remote procedure calls made using <i>Binding</i>. For a list of the RPC-supported authentication services, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Rpc/authentication-service-constants">Authentication-Service Constants</a>.
     * 
     * Specify a null value to prevent 
     * <b>RpcBindingInqAuthInfoEx</b> from returning the <i>AuthnSvc</i> parameter.
     * @param {Pointer<Void>} AuthIdentity Returns a pointer to a handle to the data structure that contains the client's authentication and authorization credentials specified for remote procedure calls made using <i>Binding</i>.
     * 
     * Specify a null value to prevent 
     * <b>RpcBindingInqAuthInfoEx</b> from returning the <i>AuthIdentity</i> parameter.
     * @param {Pointer<UInt32>} AuthzSvc Returns a pointer set to the authorization service requested by the client application that made the remote procedure call on <i>Binding</i>. For a list of the RPC-supported authentication services, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Rpc/authentication-service-constants">Authentication-Service Constants</a>.
     * 
     * Specify a null value to prevent 
     * <b>RpcBindingInqAuthInfoEx</b> from returning the <i>AuthzSvc</i> parameter.
     * @param {Integer} RpcQosVersion Passes value of current version (needed for forward compatibility if extensions are made to this function). Always set this parameter to RPC_C_SECURITY_QOS_VERSION.
     * @param {Pointer<RPC_SECURITY_QOS>} SecurityQOS Returns pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/ns-rpcdce-rpc_security_qos">RPC_SECURITY_QOS</a> structure, which defines quality-of-service settings.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The binding handle was invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_WRONG_KIND_OF_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This was the wrong kind of binding for the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_BINDING_HAS_NO_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Binding has no authentication information.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcbindinginqauthinfoexw
     * @since windows5.0
     */
    static RpcBindingInqAuthInfoExW(Binding, ServerPrincName, AuthnLevel, AuthnSvc, AuthIdentity, AuthzSvc, RpcQosVersion, SecurityQOS) {
        result := DllCall("RPCRT4.dll\RpcBindingInqAuthInfoExW", "ptr", Binding, "ptr", ServerPrincName, "uint*", AuthnLevel, "uint*", AuthnSvc, "ptr", AuthIdentity, "uint*", AuthzSvc, "uint", RpcQosVersion, "ptr", SecurityQOS, "int")
        return result
    }

    /**
     * The RpcServerCompleteSecurityCallback function completes an asynchronous security callback.
     * @param {Pointer<Void>} BindingHandle The Server Call that this function dispatches or fails.
     * @param {Integer} Status Specifies an RPC status. If this value is not <b>RPC_S_OK</b>, the Server Call is failed with a value of <b>RPC_S_ACCESS_DENIED</b>.
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @returns {Integer} This function returns RPC_STATUS.
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcservercompletesecuritycallback
     * @since windows5.0
     */
    static RpcServerCompleteSecurityCallback(BindingHandle, Status) {
        result := DllCall("RPCRT4.dll\RpcServerCompleteSecurityCallback", "ptr", BindingHandle, "int", Status, "int")
        return result
    }

    /**
     * The RpcServerRegisterAuthInfo function registers authentication information with the RPC run-time library.
     * @param {PSTR} ServerPrincName Pointer to the principal name to use for the server when authenticating remote procedure calls using the service specified by the <i>AuthnSvc</i> parameter. The content of the name and its syntax are defined by the authentication service in use. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Rpc/principal-names">Principal Names</a>.
     * @param {Integer} AuthnSvc Authentication service to use when the server receives a request for a remote procedure call.
     * @param {Pointer<RPC_AUTH_KEY_RETRIEVAL_FN>} GetKeyFn Address of a server-application-provided routine that returns encryption keys. See 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nc-rpcdce-rpc_auth_key_retrieval_fn">RPC_AUTH_KEY_RETRIEVAL_FN</a>. 
     * 
     * 
     * 
     * 
     * Specify a <b>NULL</b> parameter value to use the default method of encryption-key acquisition. In this case, the authentication service specifies the default behavior. Set this parameter to <b>NULL</b> when using the RPC_C_AUTHN_WINNT authentication service.
     * 
     * <table>
     * <tr>
     * <th>Authentication service</th>
     * <th>GetKeyFn</th>
     * <th>Arg</th>
     * <th>Run-time behavior</th>
     * </tr>
     * <tr>
     * <td>RPC_C_AUTHN_DPA</td>
     * <td>Ignored</td>
     * <td>Ignored</td>
     * <td>Does not support</td>
     * </tr>
     * <tr>
     * <td>RPC_C_AUTHN_GSS_KERBEROS</td>
     * <td>Ignored</td>
     * <td>Ignored</td>
     * <td>Does not support</td>
     * </tr>
     * <tr>
     * <td>RPC_C_AUTHN_GSS_NEGOTIATE</td>
     * <td>Ignored</td>
     * <td>Ignored</td>
     * <td>Does not support</td>
     * </tr>
     * <tr>
     * <td>RPC_C_AUTHN_GSS_SCHANNEL</td>
     * <td>Ignored</td>
     * <td>Ignored</td>
     * <td>Does not support</td>
     * </tr>
     * <tr>
     * <td>RPC_C_AUTHN_MQ</td>
     * <td>Ignored</td>
     * <td>Ignored</td>
     * <td>Does not support</td>
     * </tr>
     * <tr>
     * <td>RPC_C_AUTHN_MSN</td>
     * <td>Ignored</td>
     * <td>Ignored</td>
     * <td>Does not support</td>
     * </tr>
     * <tr>
     * <td>RPC_C_AUTHN_WINNT</td>
     * <td>Ignored</td>
     * <td>Ignored</td>
     * <td>Does not support</td>
     * </tr>
     * <tr>
     * <td>RPC_C_AUTHN_DCE_PRIVATE</td>
     * <td><b>NULL</b></td>
     * <td>Non-<b>null</b></td>
     * <td>Uses default method of encryption-key acquisition from specified key table; specified argument is passed to default acquisition function.</td>
     * </tr>
     * <tr>
     * <td>RPC_C_AUTHN_DCE_PRIVATE</td>
     * <td>Non-<b>null</b></td>
     * <td><b>NULL</b></td>
     * <td>Uses specified encryption-key acquisition function to obtain keys from default key table.</td>
     * </tr>
     * <tr>
     * <td>RPC_C_AUTHN_DCE_PRIVATE</td>
     * <td>Non-<b>null</b></td>
     * <td>Non-<b>null</b></td>
     * <td>Uses specified encryption-key acquisition function to obtain keys from specified key table; specified argument is passed to acquisition function.</td>
     * </tr>
     * <tr>
     * <td>RPC_C_AUTHN_DEC_PUBLIC</td>
     * <td>Ignored</td>
     * <td>Ignored</td>
     * <td>Reserved for future use.</td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * 
     * 
     * The RPC run-time library passes the <i>ServerPrincName</i> parameter value from 
     * <b>RpcServerRegisterAuthInfo</b> as the <i>ServerPrincName</i> parameter value to the <i>GetKeyFn</i> acquisition function. The RPC run-time library automatically provides a value for the key version (<i>KeyVer</i>) parameter. For a <i>KeyVer</i> parameter value of zero, the acquisition function must return the most recent key available. The retrieval function returns the authentication key in the <i>Key</i> parameter.
     * 
     * If the acquisition function called from 
     * <b>RpcServerRegisterAuthInfo</b> returns a status other than RPC_S_OK, then this function fails and returns an error code to the server application. If the acquisition function called by the RPC run-time library while authenticating a client's remote procedure call request returns a status other than RPC_S_OK, the request fails and the RPC run-time library returns an error code to the client application.
     * @param {Pointer<Void>} Arg Pointer to a parameter to pass to the <i>GetKeyFn</i> routine, if specified. This parameter can also be used to pass a pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/schannel/ns-schannel-schannel_cred">SCHANNEL_CRED</a> structure to specify explicit credentials if the authentication service is set to SCHANNEL. 
     * 
     * 
     * If the <i>Arg</i> parameter is set to <b>NULL</b>, this function will use the default certificate or credential if it has been set up in the directory service.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_UNKNOWN_AUTHN_SERVICE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The authentication service is unknown.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcserverregisterauthinfoa
     * @since windows5.0
     */
    static RpcServerRegisterAuthInfoA(ServerPrincName, AuthnSvc, GetKeyFn, Arg) {
        ServerPrincName := ServerPrincName is String ? StrPtr(ServerPrincName) : ServerPrincName

        result := DllCall("RPCRT4.dll\RpcServerRegisterAuthInfoA", "ptr", ServerPrincName, "uint", AuthnSvc, "ptr", GetKeyFn, "ptr", Arg, "int")
        return result
    }

    /**
     * The RpcServerRegisterAuthInfo function registers authentication information with the RPC run-time library.
     * @param {PWSTR} ServerPrincName Pointer to the principal name to use for the server when authenticating remote procedure calls using the service specified by the <i>AuthnSvc</i> parameter. The content of the name and its syntax are defined by the authentication service in use. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Rpc/principal-names">Principal Names</a>.
     * @param {Integer} AuthnSvc Authentication service to use when the server receives a request for a remote procedure call.
     * @param {Pointer<RPC_AUTH_KEY_RETRIEVAL_FN>} GetKeyFn Address of a server-application-provided routine that returns encryption keys. See 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nc-rpcdce-rpc_auth_key_retrieval_fn">RPC_AUTH_KEY_RETRIEVAL_FN</a>. 
     * 
     * 
     * 
     * 
     * Specify a <b>NULL</b> parameter value to use the default method of encryption-key acquisition. In this case, the authentication service specifies the default behavior. Set this parameter to <b>NULL</b> when using the RPC_C_AUTHN_WINNT authentication service.
     * 
     * <table>
     * <tr>
     * <th>Authentication service</th>
     * <th>GetKeyFn</th>
     * <th>Arg</th>
     * <th>Run-time behavior</th>
     * </tr>
     * <tr>
     * <td>RPC_C_AUTHN_DPA</td>
     * <td>Ignored</td>
     * <td>Ignored</td>
     * <td>Does not support</td>
     * </tr>
     * <tr>
     * <td>RPC_C_AUTHN_GSS_KERBEROS</td>
     * <td>Ignored</td>
     * <td>Ignored</td>
     * <td>Does not support</td>
     * </tr>
     * <tr>
     * <td>RPC_C_AUTHN_GSS_NEGOTIATE</td>
     * <td>Ignored</td>
     * <td>Ignored</td>
     * <td>Does not support</td>
     * </tr>
     * <tr>
     * <td>RPC_C_AUTHN_GSS_SCHANNEL</td>
     * <td>Ignored</td>
     * <td>Ignored</td>
     * <td>Does not support</td>
     * </tr>
     * <tr>
     * <td>RPC_C_AUTHN_MQ</td>
     * <td>Ignored</td>
     * <td>Ignored</td>
     * <td>Does not support</td>
     * </tr>
     * <tr>
     * <td>RPC_C_AUTHN_MSN</td>
     * <td>Ignored</td>
     * <td>Ignored</td>
     * <td>Does not support</td>
     * </tr>
     * <tr>
     * <td>RPC_C_AUTHN_WINNT</td>
     * <td>Ignored</td>
     * <td>Ignored</td>
     * <td>Does not support</td>
     * </tr>
     * <tr>
     * <td>RPC_C_AUTHN_DCE_PRIVATE</td>
     * <td><b>NULL</b></td>
     * <td>Non-<b>null</b></td>
     * <td>Uses default method of encryption-key acquisition from specified key table; specified argument is passed to default acquisition function.</td>
     * </tr>
     * <tr>
     * <td>RPC_C_AUTHN_DCE_PRIVATE</td>
     * <td>Non-<b>null</b></td>
     * <td><b>NULL</b></td>
     * <td>Uses specified encryption-key acquisition function to obtain keys from default key table.</td>
     * </tr>
     * <tr>
     * <td>RPC_C_AUTHN_DCE_PRIVATE</td>
     * <td>Non-<b>null</b></td>
     * <td>Non-<b>null</b></td>
     * <td>Uses specified encryption-key acquisition function to obtain keys from specified key table; specified argument is passed to acquisition function.</td>
     * </tr>
     * <tr>
     * <td>RPC_C_AUTHN_DEC_PUBLIC</td>
     * <td>Ignored</td>
     * <td>Ignored</td>
     * <td>Reserved for future use.</td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * 
     * 
     * The RPC run-time library passes the <i>ServerPrincName</i> parameter value from 
     * <b>RpcServerRegisterAuthInfo</b> as the <i>ServerPrincName</i> parameter value to the <i>GetKeyFn</i> acquisition function. The RPC run-time library automatically provides a value for the key version (<i>KeyVer</i>) parameter. For a <i>KeyVer</i> parameter value of zero, the acquisition function must return the most recent key available. The retrieval function returns the authentication key in the <i>Key</i> parameter.
     * 
     * If the acquisition function called from 
     * <b>RpcServerRegisterAuthInfo</b> returns a status other than RPC_S_OK, then this function fails and returns an error code to the server application. If the acquisition function called by the RPC run-time library while authenticating a client's remote procedure call request returns a status other than RPC_S_OK, the request fails and the RPC run-time library returns an error code to the client application.
     * @param {Pointer<Void>} Arg Pointer to a parameter to pass to the <i>GetKeyFn</i> routine, if specified. This parameter can also be used to pass a pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/schannel/ns-schannel-schannel_cred">SCHANNEL_CRED</a> structure to specify explicit credentials if the authentication service is set to SCHANNEL.  
     * 
     * 
     * If the <i>Arg</i> parameter is set to <b>NULL</b>, this function will use the default certificate or credential if it has been set up in the directory service.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_UNKNOWN_AUTHN_SERVICE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The authentication service is unknown.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcserverregisterauthinfow
     * @since windows5.0
     */
    static RpcServerRegisterAuthInfoW(ServerPrincName, AuthnSvc, GetKeyFn, Arg) {
        ServerPrincName := ServerPrincName is String ? StrPtr(ServerPrincName) : ServerPrincName

        result := DllCall("RPCRT4.dll\RpcServerRegisterAuthInfoW", "ptr", ServerPrincName, "uint", AuthnSvc, "ptr", GetKeyFn, "ptr", Arg, "int")
        return result
    }

    /**
     * An application calls RpcBindingServerFromClient to convert a client binding handle into a partially-bound server binding handle.
     * @param {Pointer<Void>} ClientBinding Client binding handle to convert to a server binding handle. If a value of zero is specified, the server impersonates the client that is being served by this server thread.
     * 
     * <div class="alert"><b>Note</b>  This parameter cannot be <b>NULL</b> in Windows NT 4.0.</div>
     * <div> </div>
     * @param {Pointer<Void>} ServerBinding Returns a server binding handle.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The binding handle was invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_WRONG_KIND_OF_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This was the wrong kind of binding for the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_CANNOT_SUPPORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Cannot determine the client's host. See Remarks for a list of supported protocol sequences.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcbindingserverfromclient
     * @since windows5.0
     */
    static RpcBindingServerFromClient(ClientBinding, ServerBinding) {
        result := DllCall("RPCRT4.dll\RpcBindingServerFromClient", "ptr", ClientBinding, "ptr", ServerBinding, "int")
        return result
    }

    /**
     * Use the RpcRaiseException function to raise an exception. The function does not return to the caller.
     * @param {Integer} exception Exception code for the exception.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcraiseexception
     * @since windows5.0
     */
    static RpcRaiseException(exception) {
        DllCall("RPCRT4.dll\RpcRaiseException", "int", exception)
    }

    /**
     * The RpcTestCancel function checks for a cancel indication.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call has been canceled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other values</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call has not been canceled.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * It is not unusual for the 
     * <b>RpcTestCancel</b> function to return the value ERROR_ACCESS_DENIED. This indicates that the remote procedure call has not been canceled.
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpctestcancel
     * @since windows5.0
     */
    static RpcTestCancel() {
        result := DllCall("RPCRT4.dll\RpcTestCancel", "int")
        return result
    }

    /**
     * The server calls RpcServerTestCancel to test for client cancel requests.
     * @param {Pointer<Void>} BindingHandle Call to test for cancel commands. If a value of zero is specified, the server impersonates the client that is being served by this server thread.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call was canceled by the client. The server must still complete or abort the call.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NO_CALL_ACTIVE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is no active call on the current thread.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_CALL_IN_PROGRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call was not canceled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcservertestcancel
     * @since windows5.0
     */
    static RpcServerTestCancel(BindingHandle) {
        result := DllCall("RPCRT4.dll\RpcServerTestCancel", "ptr", BindingHandle, "int")
        return result
    }

    /**
     * The RpcCancelThread function cancels a thread. The RpcCancelThread function should not be used to cancel asynchronous RPC calls; instead, use the RpcAsyncCancelCall function to cancel an asynchronous RPC call.
     * @param {Pointer<Void>} Thread Handle of the thread to cancel.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Thread handle does not have privilege. Thread handles must have THREAD_SET_CONTEXT set properly for the function to execute properly.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_CANNOT_SUPPORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Called by an MS-DOS or Windows 3.x client.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpccancelthread
     * @since windows5.0
     */
    static RpcCancelThread(Thread) {
        result := DllCall("RPCRT4.dll\RpcCancelThread", "ptr", Thread, "int")
        return result
    }

    /**
     * The RpcCancelThreadEx function stops the execution of a thread.
     * @param {Pointer<Void>} Thread Handle of the thread to cancel.
     * @param {Integer} Timeout Number of seconds to wait for the thread to be canceled before this function returns. To specify that a client waits an indefinite amount of time, pass the value RPC_C_CANCEL_INFINITE_TIMEOUT.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Thread handle does not have privilege. Thread handles must have THREAD_SET_CONTEXT set properly for the function to execute properly.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_CANNOT_SUPPORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Called by an MS-DOS or Windows 3.<i>x</i> client.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/win32/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpccancelthreadex
     * @since windows5.0
     */
    static RpcCancelThreadEx(Thread, Timeout) {
        result := DllCall("RPCRT4.dll\RpcCancelThreadEx", "ptr", Thread, "int", Timeout, "int")
        return result
    }

    /**
     * The UuidCreate function creates a new UUID.
     * @param {Pointer<Guid>} Uuid Returns a pointer to the created <a href="https://docs.microsoft.com/windows/win32/rpc/rpcdce/ns-rpcdce-uuid">UUID</a>.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_UUID_LOCAL_ONLY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="/windows/win32/rpc/rpcdce/ns-rpcdce-uuid">UUID</a> is guaranteed to be unique to this computer only.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_UUID_NO_ADDRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Cannot get Ethernet or token-ring hardware address for this computer.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-uuidcreate
     * @since windows5.0
     */
    static UuidCreate(Uuid) {
        result := DllCall("RPCRT4.dll\UuidCreate", "ptr", Uuid, "int")
        return result
    }

    /**
     * The UuidCreateSequential function creates a new UUID.
     * @param {Pointer<Guid>} Uuid Returns a pointer to the created <a href="https://docs.microsoft.com/windows/win32/rpc/rpcdce/ns-rpcdce-uuid">UUID</a>.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_UUID_LOCAL_ONLY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="/windows/win32/rpc/rpcdce/ns-rpcdce-uuid">UUID</a> is guaranteed to be unique to this computer only. For more information please see: <a href="https://support.microsoft.com/help/981080">KB article 981080</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_UUID_NO_ADDRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Cannot get Ethernet or token-ring hardware address for this computer.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-uuidcreatesequential
     * @since windows5.0
     */
    static UuidCreateSequential(Uuid) {
        result := DllCall("RPCRT4.dll\UuidCreateSequential", "ptr", Uuid, "int")
        return result
    }

    /**
     * The UuidToString function converts a UUID to a string.
     * @param {Pointer<Guid>} Uuid Pointer to a binary 
     * <a href="https://docs.microsoft.com/windows/win32/rpc/rpcdce/ns-rpcdce-uuid">UUID</a>.
     * @param {Pointer<PSTR>} StringUuid Pointer to the null-terminated string into which the <a href="https://docs.microsoft.com/windows/win32/rpc/rpcdce/ns-rpcdce-uuid">UUID</a> specified in the <i>Uuid</i> parameter will be placed.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OUT_OF_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system is out of memory.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-uuidtostringa
     * @since windows5.0
     */
    static UuidToStringA(Uuid, StringUuid) {
        result := DllCall("RPCRT4.dll\UuidToStringA", "ptr", Uuid, "ptr", StringUuid, "int")
        return result
    }

    /**
     * The UuidFromString function converts a string to a UUID.
     * @param {PSTR} StringUuid Pointer to a string representation of a 
     * <a href="https://docs.microsoft.com/windows/win32/rpc/rpcdce/ns-rpcdce-uuid">UUID</a>.
     * @param {Pointer<Guid>} Uuid Returns a pointer to a <a href="https://docs.microsoft.com/windows/win32/rpc/rpcdce/ns-rpcdce-uuid">UUID</a> in binary form.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_STRING_UUID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The string <a href="/windows/win32/rpc/rpcdce/ns-rpcdce-uuid">UUID</a> is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-uuidfromstringa
     * @since windows5.0
     */
    static UuidFromStringA(StringUuid, Uuid) {
        StringUuid := StringUuid is String ? StrPtr(StringUuid) : StringUuid

        result := DllCall("RPCRT4.dll\UuidFromStringA", "ptr", StringUuid, "ptr", Uuid, "int")
        return result
    }

    /**
     * The UuidToString function converts a UUID to a string.
     * @param {Pointer<Guid>} Uuid Pointer to a binary 
     * <a href="https://docs.microsoft.com/windows/win32/rpc/rpcdce/ns-rpcdce-uuid">UUID</a>.
     * @param {Pointer<PWSTR>} StringUuid Pointer to the null-terminated string into which the <a href="https://docs.microsoft.com/windows/win32/rpc/rpcdce/ns-rpcdce-uuid">UUID</a> specified in the <i>Uuid</i> parameter will be placed.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OUT_OF_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system is out of memory.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-uuidtostringw
     * @since windows5.0
     */
    static UuidToStringW(Uuid, StringUuid) {
        result := DllCall("RPCRT4.dll\UuidToStringW", "ptr", Uuid, "ptr", StringUuid, "int")
        return result
    }

    /**
     * The UuidFromString function converts a string to a UUID.
     * @param {PWSTR} StringUuid Pointer to a string representation of a 
     * <a href="https://docs.microsoft.com/windows/win32/rpc/rpcdce/ns-rpcdce-uuid">UUID</a>.
     * @param {Pointer<Guid>} Uuid Returns a pointer to a <a href="https://docs.microsoft.com/windows/win32/rpc/rpcdce/ns-rpcdce-uuid">UUID</a> in binary form.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_STRING_UUID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The string <a href="/windows/win32/rpc/rpcdce/ns-rpcdce-uuid">UUID</a> is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-uuidfromstringw
     * @since windows5.0
     */
    static UuidFromStringW(StringUuid, Uuid) {
        StringUuid := StringUuid is String ? StrPtr(StringUuid) : StringUuid

        result := DllCall("RPCRT4.dll\UuidFromStringW", "ptr", StringUuid, "ptr", Uuid, "int")
        return result
    }

    /**
     * An application calls the UuidCompare function to compare two UUIDs and determine their order. The returned value gives the order.
     * @param {Pointer<Guid>} Uuid1 Pointer to a 
     * <a href="https://docs.microsoft.com/windows/win32/rpc/rpcdce/ns-rpcdce-uuid">UUID</a>. This <b>UUID</b> is compared with the <b>UUID</b> specified in the <i>Uuid2</i> parameter.
     * @param {Pointer<Guid>} Uuid2 Pointer to a <a href="https://docs.microsoft.com/windows/win32/rpc/rpcdce/ns-rpcdce-uuid">UUID</a>. This <b>UUID</b> is compared with the <b>UUID</b> specified in the <i>Uuid1</i> parameter.
     * @param {Pointer<Int32>} Status Returns any errors that may occur, and will typically be set by the function to RPC_S_OK upon return.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>–1</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>Uuid1</i> parameter is less than the <i>Uuid2</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>0</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>Uuid1</i> parameter is equal to the <i>Uuid2</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>1</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>Uuid1</i> parameter is greater than the <i>Uuid2</i> parameter.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-uuidcompare
     * @since windows5.0
     */
    static UuidCompare(Uuid1, Uuid2, Status) {
        result := DllCall("RPCRT4.dll\UuidCompare", "ptr", Uuid1, "ptr", Uuid2, "int*", Status, "int")
        return result
    }

    /**
     * The UuidCreateNil function creates a nil-valued UUID.
     * @param {Pointer<Guid>} NilUuid Returns a nil-valued 
     * <a href="https://docs.microsoft.com/windows/win32/rpc/rpcdce/ns-rpcdce-uuid">UUID</a>.
     * @returns {Integer} Returns RPC_S_OK.
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-uuidcreatenil
     * @since windows5.0
     */
    static UuidCreateNil(NilUuid) {
        result := DllCall("RPCRT4.dll\UuidCreateNil", "ptr", NilUuid, "int")
        return result
    }

    /**
     * An application calls the UuidEqual function to compare two UUIDs and determine whether they are equal.
     * @param {Pointer<Guid>} Uuid1 Pointer to a 
     * <a href="https://docs.microsoft.com/windows/win32/rpc/rpcdce/ns-rpcdce-uuid">UUID</a>. This <b>UUID</b> is compared with the <b>UUID</b> specified in the <i>Uuid2</i> parameter.
     * @param {Pointer<Guid>} Uuid2 Pointer to a <a href="https://docs.microsoft.com/windows/win32/rpc/rpcdce/ns-rpcdce-uuid">UUID</a>. This <b>UUID</b> is compared with the <b>UUID</b> specified in the <i>Uuid1</i> parameter.
     * @param {Pointer<Int32>} Status Returns RPC_S_OK.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TRUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>Uuid1</i> parameter is equal to the <i>Uuid2</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>Uuid1</i> parameter is not equal to the <i>Uuid2</i> parameter.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-uuidequal
     * @since windows5.0
     */
    static UuidEqual(Uuid1, Uuid2, Status) {
        result := DllCall("RPCRT4.dll\UuidEqual", "ptr", Uuid1, "ptr", Uuid2, "int*", Status, "int")
        return result
    }

    /**
     * An application calls the UuidHash function to generate a hash value for a specified UUID.
     * @param {Pointer<Guid>} Uuid <a href="https://docs.microsoft.com/windows/win32/rpc/rpcdce/ns-rpcdce-uuid">UUID</a> for which a hash value is created.
     * @param {Pointer<Int32>} Status Returns RPC_S_OK.
     * @returns {Integer} <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-uuidhash
     * @since windows5.0
     */
    static UuidHash(Uuid, Status) {
        result := DllCall("RPCRT4.dll\UuidHash", "ptr", Uuid, "int*", Status, "ushort")
        return result
    }

    /**
     * An application calls the UuidIsNil function to determine whether the specified UUID is a nil-valued UUID.
     * @param {Pointer<Guid>} Uuid <a href="https://docs.microsoft.com/windows/win32/rpc/rpcdce/ns-rpcdce-uuid">UUID</a> to test for nil value.
     * @param {Pointer<Int32>} Status Returns RPC_S_OK.
     * @returns {Integer} <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-uuidisnil
     * @since windows5.0
     */
    static UuidIsNil(Uuid, Status) {
        result := DllCall("RPCRT4.dll\UuidIsNil", "ptr", Uuid, "int*", Status, "int")
        return result
    }

    /**
     * The RpcEpRegisterNoReplace function adds server-address information to the local endpoint-map database.
     * @param {Pointer<Void>} IfSpec Interface to register with the local endpoint-map database.
     * @param {Pointer<RPC_BINDING_VECTOR>} BindingVector Pointer to a vector of binding handles over which the server can receive remote procedure calls.
     * @param {Pointer<UUID_VECTOR>} UuidVector Pointer to a vector of object UUIDs offered by the server. The server application constructs this vector. 
     * 
     * 
     * 
     * 
     * A null parameter value indicates there are no object UUIDs to register.
     * @param {PSTR} Annotation Pointer to the character-string comment applied to each cross-product element added to the local endpoint-map database. The string can be up to 64 characters long, including the null-terminating character. Specify a null value or a null-terminated string ("\0") if there is no annotation string. 
     * 
     * 
     * 
     * 
     * The annotation string is used by applications for information only. RPC does not use this string to determine which server instance a client communicates with or to enumerate elements in the endpoint-map database.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NO_BINDINGS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No bindings.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The binding handle was invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_WRONG_KIND_OF_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This was the wrong kind of binding for the operation.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcepregisternoreplacea
     * @since windows5.0
     */
    static RpcEpRegisterNoReplaceA(IfSpec, BindingVector, UuidVector, Annotation) {
        Annotation := Annotation is String ? StrPtr(Annotation) : Annotation

        result := DllCall("RPCRT4.dll\RpcEpRegisterNoReplaceA", "ptr", IfSpec, "ptr", BindingVector, "ptr", UuidVector, "ptr", Annotation, "int")
        return result
    }

    /**
     * The RpcEpRegisterNoReplace function adds server-address information to the local endpoint-map database.
     * @param {Pointer<Void>} IfSpec Interface to register with the local endpoint-map database.
     * @param {Pointer<RPC_BINDING_VECTOR>} BindingVector Pointer to a vector of binding handles over which the server can receive remote procedure calls.
     * @param {Pointer<UUID_VECTOR>} UuidVector Pointer to a vector of object UUIDs offered by the server. The server application constructs this vector. 
     * 
     * 
     * 
     * 
     * A null parameter value indicates there are no object UUIDs to register.
     * @param {PWSTR} Annotation Pointer to the character-string comment applied to each cross-product element added to the local endpoint-map database. The string can be up to 64 characters long, including the null-terminating character. Specify a null value or a null-terminated string ("\0") if there is no annotation string. 
     * 
     * 
     * 
     * 
     * The annotation string is used by applications for information only. RPC does not use this string to determine which server instance a client communicates with or to enumerate elements in the endpoint-map database.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NO_BINDINGS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No bindings.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The binding handle was invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_WRONG_KIND_OF_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This was the wrong kind of binding for the operation.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcepregisternoreplacew
     * @since windows5.0
     */
    static RpcEpRegisterNoReplaceW(IfSpec, BindingVector, UuidVector, Annotation) {
        Annotation := Annotation is String ? StrPtr(Annotation) : Annotation

        result := DllCall("RPCRT4.dll\RpcEpRegisterNoReplaceW", "ptr", IfSpec, "ptr", BindingVector, "ptr", UuidVector, "ptr", Annotation, "int")
        return result
    }

    /**
     * The RpcEpRegister function adds to or replaces server address information in the local endpoint-map database.
     * @param {Pointer<Void>} IfSpec Interface to register with the local endpoint-map database.
     * @param {Pointer<RPC_BINDING_VECTOR>} BindingVector Pointer to a vector of binding handles over which the server can receive remote procedure calls.
     * @param {Pointer<UUID_VECTOR>} UuidVector Pointer to a vector of object UUIDs offered by the server. The server application constructs this vector.A null argument value indicates there are no object UUIDs to register.
     * @param {PSTR} Annotation Pointer to the character-string comment applied to each cross-product element added to the local endpoint-map database. The string can be up to 64 characters long, including the null terminating character. Specify a null value or a null-terminated string ("\0") if there is no annotation string. 
     * 
     * 
     * 
     * 
     * The annotation string is used by applications for information only. RPC does not use this string to determine which server instance a client communicates with or for enumerating elements in the endpoint-map database.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NO_BINDINGS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No bindings.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The binding handle was invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_WRONG_KIND_OF_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This was the wrong kind of binding for the operation.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcepregistera
     * @since windows5.0
     */
    static RpcEpRegisterA(IfSpec, BindingVector, UuidVector, Annotation) {
        Annotation := Annotation is String ? StrPtr(Annotation) : Annotation

        result := DllCall("RPCRT4.dll\RpcEpRegisterA", "ptr", IfSpec, "ptr", BindingVector, "ptr", UuidVector, "ptr", Annotation, "int")
        return result
    }

    /**
     * The RpcEpRegister function adds to or replaces server address information in the local endpoint-map database.
     * @param {Pointer<Void>} IfSpec Interface to register with the local endpoint-map database.
     * @param {Pointer<RPC_BINDING_VECTOR>} BindingVector Pointer to a vector of binding handles over which the server can receive remote procedure calls.
     * @param {Pointer<UUID_VECTOR>} UuidVector Pointer to a vector of object UUIDs offered by the server. The server application constructs this vector.A null argument value indicates there are no object UUIDs to register.
     * @param {PWSTR} Annotation Pointer to the character-string comment applied to each cross-product element added to the local endpoint-map database. The string can be up to 64 characters long, including the null terminating character. Specify a null value or a null-terminated string ("\0") if there is no annotation string. 
     * 
     * 
     * 
     * 
     * The annotation string is used by applications for information only. RPC does not use this string to determine which server instance a client communicates with or for enumerating elements in the endpoint-map database.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NO_BINDINGS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No bindings.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The binding handle was invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_WRONG_KIND_OF_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This was the wrong kind of binding for the operation.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcepregisterw
     * @since windows5.0
     */
    static RpcEpRegisterW(IfSpec, BindingVector, UuidVector, Annotation) {
        Annotation := Annotation is String ? StrPtr(Annotation) : Annotation

        result := DllCall("RPCRT4.dll\RpcEpRegisterW", "ptr", IfSpec, "ptr", BindingVector, "ptr", UuidVector, "ptr", Annotation, "int")
        return result
    }

    /**
     * The RpcEpUnregister function removes server-address information from the local endpoint-map database.
     * @param {Pointer<Void>} IfSpec Interface to unregister from the local endpoint-map database.
     * @param {Pointer<RPC_BINDING_VECTOR>} BindingVector Pointer to a vector of binding handles to unregister.
     * @param {Pointer<UUID_VECTOR>} UuidVector Pointer to an optional vector of object UUIDs to unregister. The server application constructs this vector. 
     * <b>RpcEpUnregister</b> unregisters all endpoint-map database elements that match the specified <i>IfSpec</i> and <i>BindingVector</i> parameters and the object UUID(s). 
     * 
     * 
     * 
     * 
     * A null parameter value indicates there are no object UUIDs to unregister.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NO_BINDINGS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No bindings.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The binding handle was invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_WRONG_KIND_OF_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This was the wrong kind of binding for the operation.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcepunregister
     * @since windows5.0
     */
    static RpcEpUnregister(IfSpec, BindingVector, UuidVector) {
        result := DllCall("RPCRT4.dll\RpcEpUnregister", "ptr", IfSpec, "ptr", BindingVector, "ptr", UuidVector, "int")
        return result
    }

    /**
     * The DceErrorInqText function returns the message text for a status code.
     * @param {Integer} RpcStatus Status code to convert to a text string.
     * @param {PSTR} ErrorText Returns the text corresponding to the error code.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RPC_S_OK"></a><a id="rpc_s_ok"></a><dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RPC_S_INVALID_ARG"></a><a id="rpc_s_invalid_arg"></a><dl>
     * <dt><b>RPC_S_INVALID_ARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unknown error code.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} This function returns RPC_S_OK if it is successful, or an error code if not.
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-dceerrorinqtexta
     * @since windows5.0
     */
    static DceErrorInqTextA(RpcStatus, ErrorText) {
        ErrorText := ErrorText is String ? StrPtr(ErrorText) : ErrorText

        result := DllCall("RPCRT4.dll\DceErrorInqTextA", "int", RpcStatus, "ptr", ErrorText, "int")
        return result
    }

    /**
     * The DceErrorInqText function returns the message text for a status code.
     * @param {Integer} RpcStatus Status code to convert to a text string.
     * @param {PWSTR} ErrorText Returns the text corresponding to the error code.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RPC_S_OK"></a><a id="rpc_s_ok"></a><dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RPC_S_INVALID_ARG"></a><a id="rpc_s_invalid_arg"></a><dl>
     * <dt><b>RPC_S_INVALID_ARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unknown error code.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} This function returns RPC_S_OK if it is successful, or an error code if not.
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-dceerrorinqtextw
     * @since windows5.0
     */
    static DceErrorInqTextW(RpcStatus, ErrorText) {
        ErrorText := ErrorText is String ? StrPtr(ErrorText) : ErrorText

        result := DllCall("RPCRT4.dll\DceErrorInqTextW", "int", RpcStatus, "ptr", ErrorText, "int")
        return result
    }

    /**
     * The RpcMgmtEpEltInqBegin function creates an inquiry context for viewing the elements in an endpoint map.
     * @param {Pointer<Void>} EpBinding Binding handle to a host whose endpoint-map elements is to be viewed. Specify <b>NULL</b> to view elements from the local host. If a binding handle is specified, the object UUID on the binding handle must be <b>NULL</b>. If present, the endpoint on the binding handle is ignored and the endpoint to the endpoint mapper database on the given host is used.
     * @param {Integer} InquiryType Integer value that indicates the type of inquiry to perform on the endpoint map. The following are valid inquiry types. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RPC_C_EP_ALL_ELTS"></a><a id="rpc_c_ep_all_elts"></a><dl>
     * <dt><b>RPC_C_EP_ALL_ELTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returns every element from the endpoint map. The <i>IfId</i>, <i>VersOption</i>, and <i>ObjectUuid</i> parameters are ignored.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RPC_C_EP_MATCH_BY_IF"></a><a id="rpc_c_ep_match_by_if"></a><dl>
     * <dt><b>RPC_C_EP_MATCH_BY_IF</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Searches the endpoint map for elements that contain the interface identifier specified by the <i>IfId</i> and <i>VersOption</i> values.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RPC_C_EP_MATCH_BY_OBJ"></a><a id="rpc_c_ep_match_by_obj"></a><dl>
     * <dt><b>RPC_C_EP_MATCH_BY_OBJ</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Searches the endpoint map for elements that contain the object UUID specified by <i>ObjectUuid</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RPC_C_EP_MATCH_BY_BOTH"></a><a id="rpc_c_ep_match_by_both"></a><dl>
     * <dt><b>RPC_C_EP_MATCH_BY_BOTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Searches the endpoint map for elements that contain the interface identifier and object UUID specified by <i>IfId</i>, <i>VersOption</i>, and <i>ObjectUuid</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<RPC_IF_ID>} IfId Interface identifier of the endpoint-map elements to be returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcmgmtepeltinqnext">RpcMgmtEpEltInqNext</a>. This parameter is only used when <i>InquiryType</i> is either RPC_C_EP_MATCH_BY_IF or RPC_C_EP_MATCH_BY_BOTH. Otherwise, it is ignored.
     * @param {Integer} VersOption Specifies how 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcmgmtepeltinqnext">RpcMgmtEpEltInqNext</a> uses the <i>IfId</i> parameter. This parameter is only used when <i>InquiryType</i> is either RPC_C_EP_MATCH_BY_IF or RPC_C_EP_MATCH_BY_BOTH. Otherwise, it is ignored. The following are valid values for this parameter. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RPC_C_VERS_ALL"></a><a id="rpc_c_vers_all"></a><dl>
     * <dt><b>RPC_C_VERS_ALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returns endpoint-map elements that offer the specified interface 
     * <a href="https://docs.microsoft.com/windows/win32/rpc/rpcdce/ns-rpcdce-uuid">UUID</a>, regardless of the version numbers.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RPC_C_VERS_COMPATIBLE"></a><a id="rpc_c_vers_compatible"></a><dl>
     * <dt><b>RPC_C_VERS_COMPATIBLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returns endpoint-map elements that offer the same major version of the specified interface 
     * <a href="https://docs.microsoft.com/windows/win32/rpc/rpcdce/ns-rpcdce-uuid">UUID</a> and a minor version greater than or equal to the minor version of the specified interface 
     * <b>UUID</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RPC_C_VERS_EXACT"></a><a id="rpc_c_vers_exact"></a><dl>
     * <dt><b>RPC_C_VERS_EXACT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returns endpoint-map elements that offer the specified version of the specified interface 
     * <a href="https://docs.microsoft.com/windows/win32/rpc/rpcdce/ns-rpcdce-uuid">UUID</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RPC_C_VERS_MAJOR_ONLY"></a><a id="rpc_c_vers_major_only"></a><dl>
     * <dt><b>RPC_C_VERS_MAJOR_ONLY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returns endpoint-map elements that offer the same major version of the specified interface 
     * <a href="https://docs.microsoft.com/windows/win32/rpc/rpcdce/ns-rpcdce-uuid">UUID</a> and ignores the minor version.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RPC_C_VERS_UPTO"></a><a id="rpc_c_vers_upto"></a><dl>
     * <dt><b>RPC_C_VERS_UPTO</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returns endpoint-map elements that offer a version of the specified interface 
     * <a href="https://docs.microsoft.com/windows/win32/rpc/rpcdce/ns-rpcdce-uuid">UUID</a> less than or equal to the specified major and minor version.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Guid>} ObjectUuid The object UUID that 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcmgmtepeltinqnext">RpcMgmtEpEltInqNext</a> looks for in endpoint-map elements. This parameter is used only when <i>InquiryType</i> is either RPC_C_EP_MATCH_BY_OBJ or RPC_C_EP_MATCH_BY_BOTH.
     * @param {Pointer<Void>} InquiryContext Returns an inquiry context for use with 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcmgmtepeltinqnext">RpcMgmtEpEltInqNext</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcmgmtepeltinqdone">RpcMgmtEpEltInqDone</a>. See 
     * <a href="https://docs.microsoft.com/windows/desktop/Rpc/rpc-ep-inq-handle">RPC_EP_INQ_HANDLE</a>.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcmgmtepeltinqbegin
     * @since windows5.0
     */
    static RpcMgmtEpEltInqBegin(EpBinding, InquiryType, IfId, VersOption, ObjectUuid, InquiryContext) {
        result := DllCall("RPCRT4.dll\RpcMgmtEpEltInqBegin", "ptr", EpBinding, "uint", InquiryType, "ptr", IfId, "uint", VersOption, "ptr", ObjectUuid, "ptr", InquiryContext, "int")
        return result
    }

    /**
     * The RpcMgmtEpEltInqDone function deletes the inquiry context for viewing the elements in an endpoint map.
     * @param {Pointer<Void>} InquiryContext Inquiry context to delete and returns the value <b>NULL</b>.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcmgmtepeltinqdone
     * @since windows5.0
     */
    static RpcMgmtEpEltInqDone(InquiryContext) {
        result := DllCall("RPCRT4.dll\RpcMgmtEpEltInqDone", "ptr", InquiryContext, "int")
        return result
    }

    /**
     * The RpcMgmtEpEltInqNext function returns one element from an endpoint map.
     * @param {Pointer<Void>} InquiryContext Specifies an inquiry context. The inquiry context is returned from 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcmgmtepeltinqbegin">RpcMgmtEpEltInqBegin</a>.
     * @param {Pointer<RPC_IF_ID>} IfId Returns the interface identifier of the endpoint-map element.
     * @param {Pointer<Void>} Binding Optional. Returns the binding handle from the endpoint-map element.
     * @param {Pointer<Guid>} ObjectUuid Optional. Returns the object UUID from the endpoint-map element.
     * @param {Pointer<PSTR>} Annotation Optional. Returns the annotation string for the endpoint-map element. When there is no annotation string in the endpoint-map element, the empty string ("") is returned.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcmgmtepeltinqnexta
     * @since windows5.0
     */
    static RpcMgmtEpEltInqNextA(InquiryContext, IfId, Binding, ObjectUuid, Annotation) {
        result := DllCall("RPCRT4.dll\RpcMgmtEpEltInqNextA", "ptr", InquiryContext, "ptr", IfId, "ptr", Binding, "ptr", ObjectUuid, "ptr", Annotation, "int")
        return result
    }

    /**
     * The RpcMgmtEpEltInqNext function returns one element from an endpoint map.
     * @param {Pointer<Void>} InquiryContext Specifies an inquiry context. The inquiry context is returned from 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcmgmtepeltinqbegin">RpcMgmtEpEltInqBegin</a>.
     * @param {Pointer<RPC_IF_ID>} IfId Returns the interface identifier of the endpoint-map element.
     * @param {Pointer<Void>} Binding Optional. Returns the binding handle from the endpoint-map element.
     * @param {Pointer<Guid>} ObjectUuid Optional. Returns the object UUID from the endpoint-map element.
     * @param {Pointer<PWSTR>} Annotation Optional. Returns the annotation string for the endpoint-map element. When there is no annotation string in the endpoint-map element, the empty string ("") is returned.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcmgmtepeltinqnextw
     * @since windows5.0
     */
    static RpcMgmtEpEltInqNextW(InquiryContext, IfId, Binding, ObjectUuid, Annotation) {
        result := DllCall("RPCRT4.dll\RpcMgmtEpEltInqNextW", "ptr", InquiryContext, "ptr", IfId, "ptr", Binding, "ptr", ObjectUuid, "ptr", Annotation, "int")
        return result
    }

    /**
     * The RpcMgmtEpUnregister function removes server address information from an endpoint map.
     * @param {Pointer<Void>} EpBinding Host whose endpoint-map elements are to be unregistered. To remove elements from the same host as the calling application, the application specifies a value of <b>NULL</b>. To remove elements from another host, the application specifies a server binding handle for any server residing on that host. Note that the application can specify the same binding handle it is using to make other remote procedure calls.
     * @param {Pointer<RPC_IF_ID>} IfId Interface identifier to remove from the endpoint map.
     * @param {Pointer<Void>} Binding Binding handle to remove.
     * @param {Pointer<Guid>} ObjectUuid Optional object UUID to remove. The value <b>NULL</b> indicates there is no object UUID to remove.
     * @returns {Integer} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_CANT_PERFORM_OP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Cannot perform the requested operation.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcmgmtepunregister
     */
    static RpcMgmtEpUnregister(EpBinding, IfId, Binding, ObjectUuid) {
        result := DllCall("RPCRT4.dll\RpcMgmtEpUnregister", "ptr", EpBinding, "ptr", IfId, "ptr", Binding, "ptr", ObjectUuid, "int")
        return result
    }

    /**
     * The RpcMgmtSetAuthorizationFn function establishes an authorization function for processing remote calls to a server's management functions.
     * @param {Pointer<RPC_MGMT_AUTHORIZATION_FN>} AuthorizationFn Specifies an authorization function. The RPC server run-time library automatically calls this function whenever the server run-time receives a client request to execute one of the remote management functions. The server must implement this function. Applications specify a value of <b>NULL</b> to unregister a previously registered authorization function. After such a call, default authorizations are used.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcmgmtsetauthorizationfn
     * @since windows5.0
     */
    static RpcMgmtSetAuthorizationFn(AuthorizationFn) {
        result := DllCall("RPCRT4.dll\RpcMgmtSetAuthorizationFn", "ptr", AuthorizationFn, "int")
        return result
    }

    /**
     * A default exception filter that determines whether an exception is fatal or non-fatal.
     * @param {Integer} ExceptionCode Value of an exception. Any of the following exception values will return <b>EXCEPTION_CONTINUE_SEARCH</b>:
     * 
     * <a id="STATUS_ACCESS_VIOLATION"></a>
     * <a id="status_access_violation"></a>
     * @returns {Integer} A value that specifies whether the exception was fatal or non-fatal.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>EXCEPTION_CONTINUE_SEARCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The exception is fatal and must be handled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>EXCEPTION_EXECUTE_HANDLER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The exception is not fatal.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcexceptionfilter
     * @since windows6.0.6000
     */
    static RpcExceptionFilter(ExceptionCode) {
        result := DllCall("RPCRT4.dll\RpcExceptionFilter", "uint", ExceptionCode, "int")
        return result
    }

    /**
     * The RpcServerInterfaceGroupCreate function creates an RPC server interface group for the server application.
     * @param {Pointer<RPC_INTERFACE_TEMPLATEW>} Interfaces A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/ns-rpcdce-rpc_interface_template">RPC_INTERFACE_TEMPLATE</a> structures that define the interfaces exposed by the interface group.
     * @param {Integer} NumIfs The number of elements in <i>Interfaces</i>.
     * @param {Pointer<RPC_ENDPOINT_TEMPLATEW>} Endpoints A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/ns-rpcdce-rpc_endpoint_template">RPC_ENDPOINT_TEMPLATE</a> structures that define the endpoints used by the interface group.
     * @param {Integer} NumEndpoints The number of elements in <i>Endpoints</i>.
     * @param {Integer} IdlePeriod The length of time in seconds after the interface group becomes idle that the RPC runtime should wait before invoking the idle callback.  0 means the callback is invoked immediately. <b>INFINITE</b> means the server application does not care about the interface group’s idle state.
     * @param {Pointer<RPC_INTERFACE_GROUP_IDLE_CALLBACK_FN>} IdleCallbackFn A <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nc-rpcdce-rpc_interface_group_idle_callback_fn">RPC_INTERFACE_GROUP_IDLE_CALLBACK_FN</a> callback that the RPC runtime will invoke once the interface group is idle for the length of time given in <i>IdlePeriod</i>.  Can be <b>NULL</b> only if <i>IdlePeriod</i> is <b>INFINITE</b>.
     * @param {Pointer<Void>} IdleCallbackContext A user-defined pointer to be passed to the idle callback in <i>IdleCallbackFn</i>.
     * @param {Pointer<Void>} IfGroup If successful, a pointer to an <b>RPC_INTERFACE_GROUP</b> buffer that receives the handle to the newly created interface group.  If this function fails, <i>IfGroup</i> is undefined.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcserverinterfacegroupcreatew
     * @since windows8.0
     */
    static RpcServerInterfaceGroupCreateW(Interfaces, NumIfs, Endpoints, NumEndpoints, IdlePeriod, IdleCallbackFn, IdleCallbackContext, IfGroup) {
        result := DllCall("RPCRT4.dll\RpcServerInterfaceGroupCreateW", "ptr", Interfaces, "uint", NumIfs, "ptr", Endpoints, "uint", NumEndpoints, "uint", IdlePeriod, "ptr", IdleCallbackFn, "ptr", IdleCallbackContext, "ptr", IfGroup, "int")
        return result
    }

    /**
     * The RpcServerInterfaceGroupCreate function creates an RPC server interface group for the server application.
     * @param {Pointer<RPC_INTERFACE_TEMPLATEA>} Interfaces A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/ns-rpcdce-rpc_interface_template">RPC_INTERFACE_TEMPLATE</a> structures that define the interfaces exposed by the interface group.
     * @param {Integer} NumIfs The number of elements in <i>Interfaces</i>.
     * @param {Pointer<RPC_ENDPOINT_TEMPLATEA>} Endpoints A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/ns-rpcdce-rpc_endpoint_template">RPC_ENDPOINT_TEMPLATE</a> structures that define the endpoints used by the interface group.
     * @param {Integer} NumEndpoints The number of elements in <i>Endpoints</i>.
     * @param {Integer} IdlePeriod The length of time in seconds after the interface group becomes idle that the RPC runtime should wait before invoking the idle callback.  0 means the callback is invoked immediately. <b>INFINITE</b> means the server application does not care about the interface group’s idle state.
     * @param {Pointer<RPC_INTERFACE_GROUP_IDLE_CALLBACK_FN>} IdleCallbackFn A <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nc-rpcdce-rpc_interface_group_idle_callback_fn">RPC_INTERFACE_GROUP_IDLE_CALLBACK_FN</a> callback that the RPC runtime will invoke once the interface group is idle for the length of time given in <i>IdlePeriod</i>.  Can be <b>NULL</b> only if <i>IdlePeriod</i> is <b>INFINITE</b>.
     * @param {Pointer<Void>} IdleCallbackContext A user-defined pointer to be passed to the idle callback in <i>IdleCallbackFn</i>.
     * @param {Pointer<Void>} IfGroup If successful, a pointer to an <b>RPC_INTERFACE_GROUP</b> buffer that receives the handle to the newly created interface group.  If this function fails, <i>IfGroup</i> is undefined.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcserverinterfacegroupcreatea
     * @since windows8.0
     */
    static RpcServerInterfaceGroupCreateA(Interfaces, NumIfs, Endpoints, NumEndpoints, IdlePeriod, IdleCallbackFn, IdleCallbackContext, IfGroup) {
        result := DllCall("RPCRT4.dll\RpcServerInterfaceGroupCreateA", "ptr", Interfaces, "uint", NumIfs, "ptr", Endpoints, "uint", NumEndpoints, "uint", IdlePeriod, "ptr", IdleCallbackFn, "ptr", IdleCallbackContext, "ptr", IfGroup, "int")
        return result
    }

    /**
     * The RpcServerInterfaceGroupClose function is used to free an interface group.
     * @param {Pointer<Void>} IfGroup A <b>RPC_INTERFACE_GROUP</b> from <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcserverinterfacegroupcreate">RpcServerInterfaceGroupCreate</a> that defines the interface group to close.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_ARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>IfGroup</i> is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcserverinterfacegroupclose
     * @since windows8.0
     */
    static RpcServerInterfaceGroupClose(IfGroup) {
        result := DllCall("RPCRT4.dll\RpcServerInterfaceGroupClose", "ptr", IfGroup, "int")
        return result
    }

    /**
     * The RpcServerInterfaceGroupActivate function tells the RPC server runtime to register the interface group’s interfaces and endpoints and begin listening for calls.
     * @param {Pointer<Void>} IfGroup A <b>RPC_INTERFACE_GROUP</b> from <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcserverinterfacegroupcreate">RpcServerInterfaceGroupCreate</a> that defines the interface group to activate.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_PROTSEQ_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The protocol sequence is not supported on this host.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_RPC_PROTSEQ</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The protocol sequence is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_ENDPOINT_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The endpoint format is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OUT_OF_MEMORY</b></dt>
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
     * <dt><b>RPC_S_INVALID_SECURITY_DESC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The security descriptor for an endpoint or interface is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcserverinterfacegroupactivate
     * @since windows8.0
     */
    static RpcServerInterfaceGroupActivate(IfGroup) {
        result := DllCall("RPCRT4.dll\RpcServerInterfaceGroupActivate", "ptr", IfGroup, "int")
        return result
    }

    /**
     * The RpcServerInterfaceGroupDeactivate function tells the RPC runtime to attempt to close the given interface group, optionally aborting the operation if there is outstanding client activity.
     * @param {Pointer<Void>} IfGroup A <b>RPC_INTERFACE_GROUP</b> from <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcserverinterfacegroupcreate">RpcServerInterfaceGroupCreate</a> that defines the interface group to deactivate
     * @param {Integer} ForceDeactivation If <b>TRUE</b>, the RPC runtime should ignore client activity and unconditionally deactivate the interface group.  If <b>FALSE</b>, the operation should be aborted if new activity takes place.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_SERVER_TOO_BUSY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>ForceDeactivation</i> is <b>FALSE</b> and there is outstanding client activity.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcserverinterfacegroupdeactivate
     * @since windows8.0
     */
    static RpcServerInterfaceGroupDeactivate(IfGroup, ForceDeactivation) {
        result := DllCall("RPCRT4.dll\RpcServerInterfaceGroupDeactivate", "ptr", IfGroup, "uint", ForceDeactivation, "int")
        return result
    }

    /**
     * The RpcServerInterfaceGroupInqBindings function returns the binding handles over which remote procedure calls can be received for the given interface group.
     * @param {Pointer<Void>} IfGroup A <b>RPC_INTERFACE_GROUP</b> from <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcserverinterfacegroupcreate">RpcServerInterfaceGroupCreate</a> that defines the interface group for which the bindings should be queried.
     * @param {Pointer<RPC_BINDING_VECTOR>} BindingVector Returns a pointer to a pointer to a vector of server binding handles.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NO_BINDINGS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are no bindings.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdce/nf-rpcdce-rpcserverinterfacegroupinqbindings
     * @since windows8.0
     */
    static RpcServerInterfaceGroupInqBindings(IfGroup, BindingVector) {
        result := DllCall("RPCRT4.dll\RpcServerInterfaceGroupInqBindings", "ptr", IfGroup, "ptr", BindingVector, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<RPC_MESSAGE>} Message 
     * @returns {Integer} 
     */
    static I_RpcNegotiateTransferSyntax(Message) {
        result := DllCall("RPCRT4.dll\I_RpcNegotiateTransferSyntax", "ptr", Message, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<RPC_MESSAGE>} Message 
     * @returns {Integer} 
     */
    static I_RpcGetBuffer(Message) {
        result := DllCall("RPCRT4.dll\I_RpcGetBuffer", "ptr", Message, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<RPC_MESSAGE>} Message 
     * @param {Pointer<Guid>} ObjectUuid 
     * @returns {Integer} 
     */
    static I_RpcGetBufferWithObject(Message, ObjectUuid) {
        result := DllCall("RPCRT4.dll\I_RpcGetBufferWithObject", "ptr", Message, "ptr", ObjectUuid, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<RPC_MESSAGE>} Message 
     * @returns {Integer} 
     */
    static I_RpcSendReceive(Message) {
        result := DllCall("RPCRT4.dll\I_RpcSendReceive", "ptr", Message, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<RPC_MESSAGE>} Message 
     * @returns {Integer} 
     */
    static I_RpcFreeBuffer(Message) {
        result := DllCall("RPCRT4.dll\I_RpcFreeBuffer", "ptr", Message, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<RPC_MESSAGE>} Message 
     * @returns {Integer} 
     */
    static I_RpcSend(Message) {
        result := DllCall("RPCRT4.dll\I_RpcSend", "ptr", Message, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<RPC_MESSAGE>} Message 
     * @param {Integer} Size 
     * @returns {Integer} 
     */
    static I_RpcReceive(Message, Size) {
        result := DllCall("RPCRT4.dll\I_RpcReceive", "ptr", Message, "uint", Size, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<RPC_MESSAGE>} Message 
     * @returns {Integer} 
     */
    static I_RpcFreePipeBuffer(Message) {
        result := DllCall("RPCRT4.dll\I_RpcFreePipeBuffer", "ptr", Message, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<RPC_MESSAGE>} Message 
     * @param {Integer} NewSize 
     * @returns {Integer} 
     */
    static I_RpcReallocPipeBuffer(Message, NewSize) {
        result := DllCall("RPCRT4.dll\I_RpcReallocPipeBuffer", "ptr", Message, "uint", NewSize, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Mutex 
     * @returns {String} Nothing - always returns an empty string
     */
    static I_RpcRequestMutex(Mutex) {
        DllCall("RPCRT4.dll\I_RpcRequestMutex", "ptr", Mutex)
    }

    /**
     * 
     * @param {Pointer<Void>} Mutex 
     * @returns {String} Nothing - always returns an empty string
     */
    static I_RpcClearMutex(Mutex) {
        DllCall("RPCRT4.dll\I_RpcClearMutex", "ptr", Mutex)
    }

    /**
     * 
     * @param {Pointer<Void>} Mutex 
     * @returns {String} Nothing - always returns an empty string
     */
    static I_RpcDeleteMutex(Mutex) {
        DllCall("RPCRT4.dll\I_RpcDeleteMutex", "ptr", Mutex)
    }

    /**
     * 
     * @param {Integer} Size 
     * @returns {Pointer<Void>} 
     */
    static I_RpcAllocate(Size) {
        result := DllCall("RPCRT4.dll\I_RpcAllocate", "uint", Size, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Object 
     * @returns {String} Nothing - always returns an empty string
     */
    static I_RpcFree(Object) {
        DllCall("RPCRT4.dll\I_RpcFree", "ptr", Object)
    }

    /**
     * 
     * @param {Integer} Milliseconds 
     * @returns {String} Nothing - always returns an empty string
     */
    static I_RpcPauseExecution(Milliseconds) {
        DllCall("RPCRT4.dll\I_RpcPauseExecution", "uint", Milliseconds)
    }

    /**
     * 
     * @returns {Integer} 
     */
    static I_RpcGetExtendedError() {
        result := DllCall("RPCRT4.dll\I_RpcGetExtendedError", "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Handle 
     * @param {Integer} ActualType 
     * @param {Integer} IdlType 
     * @param {Integer} MarshalDirection 
     * @returns {Integer} 
     */
    static I_RpcSystemHandleTypeSpecificWork(Handle, ActualType, IdlType, MarshalDirection) {
        result := DllCall("RPCRT4.dll\I_RpcSystemHandleTypeSpecificWork", "ptr", Handle, "char", ActualType, "char", IdlType, "int", MarshalDirection, "int")
        return result
    }

    /**
     * 
     * @returns {Pointer<Void>} 
     */
    static I_RpcGetCurrentCallHandle() {
        result := DllCall("RPCRT4.dll\I_RpcGetCurrentCallHandle", "ptr")
        return result
    }

    /**
     * 
     * @param {Integer} EntryNameSyntax 
     * @param {Pointer<UInt16>} EntryName 
     * @param {Pointer<RPC_SERVER_INTERFACE>} RpcInterfaceInformation 
     * @returns {Integer} 
     */
    static I_RpcNsInterfaceExported(EntryNameSyntax, EntryName, RpcInterfaceInformation) {
        result := DllCall("RPCRT4.dll\I_RpcNsInterfaceExported", "uint", EntryNameSyntax, "ushort*", EntryName, "ptr", RpcInterfaceInformation, "int")
        return result
    }

    /**
     * 
     * @param {Integer} EntryNameSyntax 
     * @param {Pointer<UInt16>} EntryName 
     * @param {Pointer<RPC_SERVER_INTERFACE>} RpcInterfaceInformation 
     * @returns {Integer} 
     */
    static I_RpcNsInterfaceUnexported(EntryNameSyntax, EntryName, RpcInterfaceInformation) {
        result := DllCall("RPCRT4.dll\I_RpcNsInterfaceUnexported", "uint", EntryNameSyntax, "ushort*", EntryName, "ptr", RpcInterfaceInformation, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Binding 
     * @param {Pointer<UInt16>} StringBinding 
     * @returns {Integer} 
     */
    static I_RpcBindingToStaticStringBindingW(Binding, StringBinding) {
        result := DllCall("RPCRT4.dll\I_RpcBindingToStaticStringBindingW", "ptr", Binding, "ushort*", StringBinding, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Binding 
     * @param {Pointer<Void>} SecurityContextHandle 
     * @returns {Integer} 
     */
    static I_RpcBindingInqSecurityContext(Binding, SecurityContextHandle) {
        result := DllCall("RPCRT4.dll\I_RpcBindingInqSecurityContext", "ptr", Binding, "ptr", SecurityContextHandle, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Binding 
     * @param {Pointer<Void>} KeyInfo 
     * @returns {Integer} 
     */
    static I_RpcBindingInqSecurityContextKeyInfo(Binding, KeyInfo) {
        result := DllCall("RPCRT4.dll\I_RpcBindingInqSecurityContextKeyInfo", "ptr", Binding, "ptr", KeyInfo, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Binding 
     * @param {Pointer<Byte>} WireId 
     * @returns {Integer} 
     */
    static I_RpcBindingInqWireIdForSnego(Binding, WireId) {
        result := DllCall("RPCRT4.dll\I_RpcBindingInqWireIdForSnego", "ptr", Binding, "char*", WireId, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Binding 
     * @param {Pointer<UInt32>} MarshalledTargetInfoSize 
     * @param {Pointer<PSTR>} MarshalledTargetInfo 
     * @returns {Integer} 
     */
    static I_RpcBindingInqMarshalledTargetInfo(Binding, MarshalledTargetInfoSize, MarshalledTargetInfo) {
        result := DllCall("RPCRT4.dll\I_RpcBindingInqMarshalledTargetInfo", "ptr", Binding, "uint*", MarshalledTargetInfoSize, "ptr", MarshalledTargetInfo, "int")
        return result
    }

    /**
     * Obtains a client process ID.
     * @param {Pointer<Void>} Binding <b>RPC_BINDING_HANDLE</b> that specifies the binding handle for an explicit RPC binding from the client to a server application.
     * @param {Pointer<UInt32>} Pid Contains the process ID of the client that issued the call upon return.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function call was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NO_CALL_ACTIVE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The current thread does not have an active RPC call.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The RPC binding handle is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcdcep/nf-rpcdcep-i_rpcbindinginqlocalclientpid
     * @since windows5.1.2600
     */
    static I_RpcBindingInqLocalClientPID(Binding, Pid) {
        result := DllCall("RPCRT4.dll\I_RpcBindingInqLocalClientPID", "ptr", Binding, "uint*", Pid, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Binding 
     * @param {Pointer<Void>} AsyncHandle 
     * @returns {Integer} 
     */
    static I_RpcBindingHandleToAsyncHandle(Binding, AsyncHandle) {
        result := DllCall("RPCRT4.dll\I_RpcBindingHandleToAsyncHandle", "ptr", Binding, "ptr", AsyncHandle, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Binding 
     * @param {Integer} EntryNameSyntax 
     * @param {PWSTR} EntryName 
     * @returns {Integer} 
     */
    static I_RpcNsBindingSetEntryNameW(Binding, EntryNameSyntax, EntryName) {
        EntryName := EntryName is String ? StrPtr(EntryName) : EntryName

        result := DllCall("RPCRT4.dll\I_RpcNsBindingSetEntryNameW", "ptr", Binding, "uint", EntryNameSyntax, "ptr", EntryName, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Binding 
     * @param {Integer} EntryNameSyntax 
     * @param {PSTR} EntryName 
     * @returns {Integer} 
     */
    static I_RpcNsBindingSetEntryNameA(Binding, EntryNameSyntax, EntryName) {
        EntryName := EntryName is String ? StrPtr(EntryName) : EntryName

        result := DllCall("RPCRT4.dll\I_RpcNsBindingSetEntryNameA", "ptr", Binding, "uint", EntryNameSyntax, "ptr", EntryName, "int")
        return result
    }

    /**
     * 
     * @param {PSTR} NetworkAddress 
     * @param {PSTR} Protseq 
     * @param {Integer} MaxCalls 
     * @param {PSTR} Endpoint 
     * @param {Pointer<Void>} SecurityDescriptor 
     * @param {Pointer<Void>} Policy 
     * @returns {Integer} 
     */
    static I_RpcServerUseProtseqEp2A(NetworkAddress, Protseq, MaxCalls, Endpoint, SecurityDescriptor, Policy) {
        NetworkAddress := NetworkAddress is String ? StrPtr(NetworkAddress) : NetworkAddress
        Protseq := Protseq is String ? StrPtr(Protseq) : Protseq
        Endpoint := Endpoint is String ? StrPtr(Endpoint) : Endpoint

        result := DllCall("RPCRT4.dll\I_RpcServerUseProtseqEp2A", "ptr", NetworkAddress, "ptr", Protseq, "uint", MaxCalls, "ptr", Endpoint, "ptr", SecurityDescriptor, "ptr", Policy, "int")
        return result
    }

    /**
     * 
     * @param {PWSTR} NetworkAddress 
     * @param {PWSTR} Protseq 
     * @param {Integer} MaxCalls 
     * @param {PWSTR} Endpoint 
     * @param {Pointer<Void>} SecurityDescriptor 
     * @param {Pointer<Void>} Policy 
     * @returns {Integer} 
     */
    static I_RpcServerUseProtseqEp2W(NetworkAddress, Protseq, MaxCalls, Endpoint, SecurityDescriptor, Policy) {
        NetworkAddress := NetworkAddress is String ? StrPtr(NetworkAddress) : NetworkAddress
        Protseq := Protseq is String ? StrPtr(Protseq) : Protseq
        Endpoint := Endpoint is String ? StrPtr(Endpoint) : Endpoint

        result := DllCall("RPCRT4.dll\I_RpcServerUseProtseqEp2W", "ptr", NetworkAddress, "ptr", Protseq, "uint", MaxCalls, "ptr", Endpoint, "ptr", SecurityDescriptor, "ptr", Policy, "int")
        return result
    }

    /**
     * 
     * @param {PWSTR} NetworkAddress 
     * @param {PWSTR} Protseq 
     * @param {Integer} MaxCalls 
     * @param {Pointer<Void>} SecurityDescriptor 
     * @param {Pointer<Void>} Policy 
     * @returns {Integer} 
     */
    static I_RpcServerUseProtseq2W(NetworkAddress, Protseq, MaxCalls, SecurityDescriptor, Policy) {
        NetworkAddress := NetworkAddress is String ? StrPtr(NetworkAddress) : NetworkAddress
        Protseq := Protseq is String ? StrPtr(Protseq) : Protseq

        result := DllCall("RPCRT4.dll\I_RpcServerUseProtseq2W", "ptr", NetworkAddress, "ptr", Protseq, "uint", MaxCalls, "ptr", SecurityDescriptor, "ptr", Policy, "int")
        return result
    }

    /**
     * 
     * @param {PSTR} NetworkAddress 
     * @param {PSTR} Protseq 
     * @param {Integer} MaxCalls 
     * @param {Pointer<Void>} SecurityDescriptor 
     * @param {Pointer<Void>} Policy 
     * @returns {Integer} 
     */
    static I_RpcServerUseProtseq2A(NetworkAddress, Protseq, MaxCalls, SecurityDescriptor, Policy) {
        NetworkAddress := NetworkAddress is String ? StrPtr(NetworkAddress) : NetworkAddress
        Protseq := Protseq is String ? StrPtr(Protseq) : Protseq

        result := DllCall("RPCRT4.dll\I_RpcServerUseProtseq2A", "ptr", NetworkAddress, "ptr", Protseq, "uint", MaxCalls, "ptr", SecurityDescriptor, "ptr", Policy, "int")
        return result
    }

    /**
     * 
     * @param {PWSTR} Protseq 
     * @param {PWSTR} Endpoint 
     * @param {Pointer<Void>} IfSpec 
     * @returns {Integer} 
     */
    static I_RpcServerStartService(Protseq, Endpoint, IfSpec) {
        Protseq := Protseq is String ? StrPtr(Protseq) : Protseq
        Endpoint := Endpoint is String ? StrPtr(Endpoint) : Endpoint

        result := DllCall("RPCRT4.dll\I_RpcServerStartService", "ptr", Protseq, "ptr", Endpoint, "ptr", IfSpec, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Binding 
     * @param {Pointer<PWSTR>} DynamicEndpoint 
     * @returns {Integer} 
     */
    static I_RpcBindingInqDynamicEndpointW(Binding, DynamicEndpoint) {
        result := DllCall("RPCRT4.dll\I_RpcBindingInqDynamicEndpointW", "ptr", Binding, "ptr", DynamicEndpoint, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Binding 
     * @param {Pointer<PSTR>} DynamicEndpoint 
     * @returns {Integer} 
     */
    static I_RpcBindingInqDynamicEndpointA(Binding, DynamicEndpoint) {
        result := DllCall("RPCRT4.dll\I_RpcBindingInqDynamicEndpointA", "ptr", Binding, "ptr", DynamicEndpoint, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Context 
     * @returns {Integer} 
     */
    static I_RpcServerCheckClientRestriction(Context) {
        result := DllCall("RPCRT4.dll\I_RpcServerCheckClientRestriction", "ptr", Context, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Binding 
     * @param {Pointer<UInt32>} Type 
     * @returns {Integer} 
     */
    static I_RpcBindingInqTransportType(Binding, Type) {
        result := DllCall("RPCRT4.dll\I_RpcBindingInqTransportType", "ptr", Binding, "uint*", Type, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} RpcIfHandle 
     * @param {Pointer<RPC_TRANSFER_SYNTAX>} TransferSyntaxes 
     * @param {Integer} TransferSyntaxSize 
     * @param {Pointer<UInt32>} TransferSyntaxCount 
     * @returns {Integer} 
     */
    static I_RpcIfInqTransferSyntaxes(RpcIfHandle, TransferSyntaxes, TransferSyntaxSize, TransferSyntaxCount) {
        result := DllCall("RPCRT4.dll\I_RpcIfInqTransferSyntaxes", "ptr", RpcIfHandle, "ptr", TransferSyntaxes, "uint", TransferSyntaxSize, "uint*", TransferSyntaxCount, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Uuid 
     * @returns {Integer} 
     */
    static I_UuidCreate(Uuid) {
        result := DllCall("RPCRT4.dll\I_UuidCreate", "ptr", Uuid, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} SourceBinding 
     * @param {Pointer<Void>} DestinationBinding 
     * @returns {Integer} 
     */
    static I_RpcBindingCopy(SourceBinding, DestinationBinding) {
        result := DllCall("RPCRT4.dll\I_RpcBindingCopy", "ptr", SourceBinding, "ptr", DestinationBinding, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} BindingHandle 
     * @param {Pointer<UInt32>} ClientLocalFlag 
     * @returns {Integer} 
     */
    static I_RpcBindingIsClientLocal(BindingHandle, ClientLocalFlag) {
        result := DllCall("RPCRT4.dll\I_RpcBindingIsClientLocal", "ptr", BindingHandle, "uint*", ClientLocalFlag, "int")
        return result
    }

    /**
     * 
     * @param {PWSTR} ServerName 
     * @param {PWSTR} ServiceName 
     * @param {PWSTR} NetworkOptions 
     * @param {Pointer<Void>} Binding 
     * @returns {Integer} 
     */
    static I_RpcBindingCreateNP(ServerName, ServiceName, NetworkOptions, Binding) {
        ServerName := ServerName is String ? StrPtr(ServerName) : ServerName
        ServiceName := ServiceName is String ? StrPtr(ServiceName) : ServiceName
        NetworkOptions := NetworkOptions is String ? StrPtr(NetworkOptions) : NetworkOptions

        result := DllCall("RPCRT4.dll\I_RpcBindingCreateNP", "ptr", ServerName, "ptr", ServiceName, "ptr", NetworkOptions, "ptr", Binding, "int")
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    static I_RpcSsDontSerializeContext() {
        DllCall("RPCRT4.dll\I_RpcSsDontSerializeContext")
    }

    /**
     * 
     * @param {Pointer<RPC_FORWARD_FUNCTION>} pForwardFunction 
     * @returns {Integer} 
     */
    static I_RpcServerRegisterForwardFunction(pForwardFunction) {
        result := DllCall("RPCRT4.dll\I_RpcServerRegisterForwardFunction", "ptr", pForwardFunction, "int")
        return result
    }

    /**
     * 
     * @returns {Pointer<RPC_ADDRESS_CHANGE_FN>} 
     */
    static I_RpcServerInqAddressChangeFn() {
        result := DllCall("RPCRT4.dll\I_RpcServerInqAddressChangeFn", "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<RPC_ADDRESS_CHANGE_FN>} pAddressChangeFn 
     * @returns {Integer} 
     */
    static I_RpcServerSetAddressChangeFn(pAddressChangeFn) {
        result := DllCall("RPCRT4.dll\I_RpcServerSetAddressChangeFn", "ptr", pAddressChangeFn, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Binding 
     * @param {Pointer<Void>} Buffer 
     * @param {Pointer<UInt32>} BufferSize 
     * @param {Pointer<UInt32>} AddressFormat 
     * @returns {Integer} 
     */
    static I_RpcServerInqLocalConnAddress(Binding, Buffer, BufferSize, AddressFormat) {
        result := DllCall("RPCRT4.dll\I_RpcServerInqLocalConnAddress", "ptr", Binding, "ptr", Buffer, "uint*", BufferSize, "uint*", AddressFormat, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Binding 
     * @param {Pointer<Void>} Buffer 
     * @param {Pointer<UInt32>} BufferSize 
     * @param {Pointer<UInt32>} AddressFormat 
     * @returns {Integer} 
     */
    static I_RpcServerInqRemoteConnAddress(Binding, Buffer, BufferSize, AddressFormat) {
        result := DllCall("RPCRT4.dll\I_RpcServerInqRemoteConnAddress", "ptr", Binding, "ptr", Buffer, "uint*", BufferSize, "uint*", AddressFormat, "int")
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    static I_RpcSessionStrictContextHandle() {
        DllCall("RPCRT4.dll\I_RpcSessionStrictContextHandle")
    }

    /**
     * 
     * @returns {Integer} 
     */
    static I_RpcTurnOnEEInfoPropagation() {
        result := DllCall("RPCRT4.dll\I_RpcTurnOnEEInfoPropagation", "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} Type 
     * @returns {Integer} 
     */
    static I_RpcServerInqTransportType(Type) {
        result := DllCall("RPCRT4.dll\I_RpcServerInqTransportType", "uint*", Type, "int")
        return result
    }

    /**
     * 
     * @param {Integer} Status 
     * @returns {Integer} 
     */
    static I_RpcMapWin32Status(Status) {
        result := DllCall("RPCRT4.dll\I_RpcMapWin32Status", "int", Status, "int")
        return result
    }

    /**
     * 
     * @param {Integer} RpcStatus 
     * @param {Pointer<RDR_CALLOUT_STATE>} CallOutState 
     * @param {Pointer<UInt16>} DllName 
     * @returns {String} Nothing - always returns an empty string
     */
    static I_RpcRecordCalloutFailure(RpcStatus, CallOutState, DllName) {
        DllCall("RPCRT4.dll\I_RpcRecordCalloutFailure", "int", RpcStatus, "ptr", CallOutState, "ushort*", DllName)
    }

    /**
     * 
     * @returns {Integer} 
     */
    static I_RpcMgmtEnableDedicatedThreadPool() {
        result := DllCall("RPCRT4.dll\I_RpcMgmtEnableDedicatedThreadPool", "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} ppSecurityDescriptor 
     * @returns {Integer} 
     */
    static I_RpcGetDefaultSD(ppSecurityDescriptor) {
        result := DllCall("RPCRT4.dll\I_RpcGetDefaultSD", "ptr", ppSecurityDescriptor, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Binding 
     * @param {Integer} DesiredAccess 
     * @param {Pointer<Void>} ClientProcess 
     * @returns {Integer} 
     */
    static I_RpcOpenClientProcess(Binding, DesiredAccess, ClientProcess) {
        result := DllCall("RPCRT4.dll\I_RpcOpenClientProcess", "ptr", Binding, "uint", DesiredAccess, "ptr", ClientProcess, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Binding 
     * @param {Pointer<UInt32>} ServerLocalFlag 
     * @returns {Integer} 
     */
    static I_RpcBindingIsServerLocal(Binding, ServerLocalFlag) {
        result := DllCall("RPCRT4.dll\I_RpcBindingIsServerLocal", "ptr", Binding, "uint*", ServerLocalFlag, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hBinding 
     * @param {Integer} option 
     * @param {Pointer} optionValue 
     * @returns {Integer} 
     */
    static I_RpcBindingSetPrivateOption(hBinding, option, optionValue) {
        result := DllCall("RPCRT4.dll\I_RpcBindingSetPrivateOption", "ptr", hBinding, "uint", option, "ptr", optionValue, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Binding 
     * @param {Pointer<Void>} hEvent 
     * @returns {Integer} 
     */
    static I_RpcServerSubscribeForDisconnectNotification(Binding, hEvent) {
        result := DllCall("RPCRT4.dll\I_RpcServerSubscribeForDisconnectNotification", "ptr", Binding, "ptr", hEvent, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Binding 
     * @param {Pointer<UInt32>} AssociationID 
     * @returns {Integer} 
     */
    static I_RpcServerGetAssociationID(Binding, AssociationID) {
        result := DllCall("RPCRT4.dll\I_RpcServerGetAssociationID", "ptr", Binding, "uint*", AssociationID, "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    static I_RpcServerDisableExceptionFilter() {
        result := DllCall("RPCRT4.dll\I_RpcServerDisableExceptionFilter", "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Binding 
     * @param {Pointer<Void>} hEvent 
     * @param {Pointer<Guid>} SubscriptionId 
     * @returns {Integer} 
     */
    static I_RpcServerSubscribeForDisconnectNotification2(Binding, hEvent, SubscriptionId) {
        result := DllCall("RPCRT4.dll\I_RpcServerSubscribeForDisconnectNotification2", "ptr", Binding, "ptr", hEvent, "ptr", SubscriptionId, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Binding 
     * @param {Pointer<Guid>} SubscriptionId 
     * @returns {Integer} 
     */
    static I_RpcServerUnsubscribeForDisconnectNotification(Binding, SubscriptionId) {
        result := DllCall("RPCRT4.dll\I_RpcServerUnsubscribeForDisconnectNotification", "ptr", Binding, "ptr", SubscriptionId, "int")
        return result
    }

    /**
     * The RpcNsBindingExport function establishes a name service�database entry with multiple binding handles and multiple objects for a server.
     * @param {Integer} EntryNameSyntax Syntax of <i>EntryName</i>. 
     * 
     * 
     * 
     * 
     * To use the syntax specified in the registry value entry <b>HKEY_LOCAL_MACHINE\Software\Microsoft\Rpc\NameService\DefaultSyntax</b>, provide a value of RPC_C_NS_SYNTAX_DEFAULT.
     * @param {PSTR} EntryName Pointer to the entry name to which binding handles and object UUIDs are exported. You cannot provide a null or empty string. The client and the server must both use the same entry name.
     * @param {Pointer<Void>} IfSpec Stub-generated data structure specifying the interface to export. A null value indicates there are no binding handles to export (only object UUIDs are to be exported) and <i>BindingVec</i> is ignored.
     * @param {Pointer<RPC_BINDING_VECTOR>} BindingVec Pointer to server bindings to export. A null value indicates there are no binding handles to export (only object UUIDs are to be exported).
     * @param {Pointer<UUID_VECTOR>} ObjectUuidVec Pointer to a vector of object UUIDs offered by the server. The server application constructs this vector. A null value indicates there are no object UUIDs to export (only binding handles are to be exported).
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NOTHING_TO_EXPORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There was nothing to export.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The binding handle was invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_WRONG_KIND_OF_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This was the wrong kind of binding for the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_NAME_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name syntax is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_UNSUPPORTED_NAME_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name syntax is unsupported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INCOMPLETE_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name is incomplete.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NO_NS_PRIVILEGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No privilege for name-service operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NAME_SERVICE_UNAVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name service is unavailable.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcnsi/nf-rpcnsi-rpcnsbindingexporta
     * @since windows5.0
     */
    static RpcNsBindingExportA(EntryNameSyntax, EntryName, IfSpec, BindingVec, ObjectUuidVec) {
        EntryName := EntryName is String ? StrPtr(EntryName) : EntryName

        result := DllCall("RPCNS4.dll\RpcNsBindingExportA", "uint", EntryNameSyntax, "ptr", EntryName, "ptr", IfSpec, "ptr", BindingVec, "ptr", ObjectUuidVec, "int")
        return result
    }

    /**
     * The RpcNsBindingUnexport function removes the binding handles for an interface and objects from an entry in the name-service database.
     * @param {Integer} EntryNameSyntax Syntax of <i>EntryName</i>. 
     * 
     * 
     * 
     * 
     * To use the syntax specified in the registry value entry <b>HKEY_LOCAL_MACHINE\Software\Microsoft\Rpc\NameService\DefaultSyntax</b>, provide a value of RPC_C_NS_SYNTAX_DEFAULT.
     * @param {PSTR} EntryName Pointer to the entry name from which to remove binding handles and object UUIDs.
     * @param {Pointer<Void>} IfSpec Interface specification for the binding handles to be removed from the name service database. A null parameter value indicates not to unexport any binding handles (only object UUIDs are to be unexported).
     * @param {Pointer<UUID_VECTOR>} ObjectUuidVec Pointer to a vector of object UUIDs that the server no longer wants to offer. The application constructs this vector. A null value indicates there are no object UUIDs to unexport (only binding handles are to be unexported).
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_VERS_OPTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The version option is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_NAME_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name syntax is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_UNSUPPORTED_NAME_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name syntax is unsupported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INCOMPLETE_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name is incomplete.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_ENTRY_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name-service entry was not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NAME_SERVICE_UNAVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name service is unavailable.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INTERFACE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The interface was not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NOT_ALL_OBJS_UNEXPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not all objects unexported.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcnsi/nf-rpcnsi-rpcnsbindingunexporta
     * @since windows5.0
     */
    static RpcNsBindingUnexportA(EntryNameSyntax, EntryName, IfSpec, ObjectUuidVec) {
        EntryName := EntryName is String ? StrPtr(EntryName) : EntryName

        result := DllCall("RPCNS4.dll\RpcNsBindingUnexportA", "uint", EntryNameSyntax, "ptr", EntryName, "ptr", IfSpec, "ptr", ObjectUuidVec, "int")
        return result
    }

    /**
     * The RpcNsBindingExport function establishes a name service�database entry with multiple binding handles and multiple objects for a server.
     * @param {Integer} EntryNameSyntax Syntax of <i>EntryName</i>. 
     * 
     * 
     * 
     * 
     * To use the syntax specified in the registry value entry <b>HKEY_LOCAL_MACHINE\Software\Microsoft\Rpc\NameService\DefaultSyntax</b>, provide a value of RPC_C_NS_SYNTAX_DEFAULT.
     * @param {PWSTR} EntryName Pointer to the entry name to which binding handles and object UUIDs are exported. You cannot provide a null or empty string. The client and the server must both use the same entry name.
     * @param {Pointer<Void>} IfSpec Stub-generated data structure specifying the interface to export. A null value indicates there are no binding handles to export (only object UUIDs are to be exported) and <i>BindingVec</i> is ignored.
     * @param {Pointer<RPC_BINDING_VECTOR>} BindingVec Pointer to server bindings to export. A null value indicates there are no binding handles to export (only object UUIDs are to be exported).
     * @param {Pointer<UUID_VECTOR>} ObjectUuidVec Pointer to a vector of object UUIDs offered by the server. The server application constructs this vector. A null value indicates there are no object UUIDs to export (only binding handles are to be exported).
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NOTHING_TO_EXPORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There was nothing to export.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The binding handle was invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_WRONG_KIND_OF_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This was the wrong kind of binding for the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_NAME_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name syntax is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_UNSUPPORTED_NAME_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name syntax is unsupported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INCOMPLETE_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name is incomplete.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NO_NS_PRIVILEGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No privilege for name-service operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NAME_SERVICE_UNAVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name service is unavailable.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcnsi/nf-rpcnsi-rpcnsbindingexportw
     * @since windows5.0
     */
    static RpcNsBindingExportW(EntryNameSyntax, EntryName, IfSpec, BindingVec, ObjectUuidVec) {
        EntryName := EntryName is String ? StrPtr(EntryName) : EntryName

        result := DllCall("RPCNS4.dll\RpcNsBindingExportW", "uint", EntryNameSyntax, "ptr", EntryName, "ptr", IfSpec, "ptr", BindingVec, "ptr", ObjectUuidVec, "int")
        return result
    }

    /**
     * The RpcNsBindingUnexport function removes the binding handles for an interface and objects from an entry in the name-service database.
     * @param {Integer} EntryNameSyntax Syntax of <i>EntryName</i>. 
     * 
     * 
     * 
     * 
     * To use the syntax specified in the registry value entry <b>HKEY_LOCAL_MACHINE\Software\Microsoft\Rpc\NameService\DefaultSyntax</b>, provide a value of RPC_C_NS_SYNTAX_DEFAULT.
     * @param {PWSTR} EntryName Pointer to the entry name from which to remove binding handles and object UUIDs.
     * @param {Pointer<Void>} IfSpec Interface specification for the binding handles to be removed from the name service database. A null parameter value indicates not to unexport any binding handles (only object UUIDs are to be unexported).
     * @param {Pointer<UUID_VECTOR>} ObjectUuidVec Pointer to a vector of object UUIDs that the server no longer wants to offer. The application constructs this vector. A null value indicates there are no object UUIDs to unexport (only binding handles are to be unexported).
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_VERS_OPTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The version option is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_NAME_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name syntax is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_UNSUPPORTED_NAME_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name syntax is unsupported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INCOMPLETE_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name is incomplete.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_ENTRY_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name-service entry was not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NAME_SERVICE_UNAVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name service is unavailable.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INTERFACE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The interface was not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NOT_ALL_OBJS_UNEXPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not all objects unexported.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcnsi/nf-rpcnsi-rpcnsbindingunexportw
     * @since windows5.0
     */
    static RpcNsBindingUnexportW(EntryNameSyntax, EntryName, IfSpec, ObjectUuidVec) {
        EntryName := EntryName is String ? StrPtr(EntryName) : EntryName

        result := DllCall("RPCNS4.dll\RpcNsBindingUnexportW", "uint", EntryNameSyntax, "ptr", EntryName, "ptr", IfSpec, "ptr", ObjectUuidVec, "int")
        return result
    }

    /**
     * The RpcNsBindingExportPnP function establishes a name-service database entry with multiple binding handles and multiple objects for a server that supports Plug and Play.
     * @param {Integer} EntryNameSyntax Syntax of <i>EntryName</i>. 
     * 
     * 
     * 
     * 
     * To use the syntax specified in the registry value entry <b>HKEY_LOCAL_MACHINE\Software\Microsoft\Rpc\NameService\DefaultSyntax</b>, provide a value of RPC_C_NS_SYNTAX_DEFAULT.
     * @param {PSTR} EntryName Pointer to the entry name to which binding handles and object UUIDs are exported. You cannot provide a null or empty string. 
     * 
     * 
     * 
     * 
     * To use the entry name specified in the registry value entry <b>HKEY_LOCAL_MACHINE\Software\Microsoft\Rpc\NameService\DefaultEntry</b>, provide a null pointer or an empty string. In this case, the <i>EntryNameSyntax</i> parameter is ignored and the run-time library uses the default syntax.
     * @param {Pointer<Void>} IfSpec Stub-generated data structure specifying the interface to export. A null value indicates there are no binding handles to export (only object UUIDs are to be exported) and <i>BindingVec</i> is ignored.
     * @param {Pointer<UUID_VECTOR>} ObjectVector Pointer to a vector of object UUIDs offered by the server. The server application constructs this vector. A null value indicates there are no object UUIDs to export (only binding handles are to be exported).
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NOTHING_TO_EXPORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There was nothing to export.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The binding handle was invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_WRONG_KIND_OF_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This was the wrong kind of binding for the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_NAME_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name syntax is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_UNSUPPORTED_NAME_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name syntax is unsupported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INCOMPLETE_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name is incomplete.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NO_NS_PRIVILEGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No privilege for name-service operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NAME_SERVICE_UNAVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name service is unavailable.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcnsi/nf-rpcnsi-rpcnsbindingexportpnpa
     * @since windows5.0
     */
    static RpcNsBindingExportPnPA(EntryNameSyntax, EntryName, IfSpec, ObjectVector) {
        EntryName := EntryName is String ? StrPtr(EntryName) : EntryName

        result := DllCall("RPCNS4.dll\RpcNsBindingExportPnPA", "uint", EntryNameSyntax, "ptr", EntryName, "ptr", IfSpec, "ptr", ObjectVector, "int")
        return result
    }

    /**
     * The RpcNsBindingUnexportPnP function removes the binding handles for Plug and Play interfaces and objects from an entry in the name-service database.
     * @param {Integer} EntryNameSyntax Syntax of <i>EntryName</i>. 
     * 
     * 
     * 
     * 
     * To use the syntax specified in the registry value entry <b>HKEY_LOCAL_MACHINE\Software\Microsoft\Rpc\NameService\DefaultSyntax</b>, provide a value of RPC_C_NS_SYNTAX_DEFAULT.
     * @param {PSTR} EntryName Pointer to the entry name from which to remove binding handles and object UUIDs.
     * @param {Pointer<Void>} IfSpec Interface specification for the binding handles to be removed from the name service database. A null parameter value indicates not to unexport any binding handles (only object UUIDs are to be unexported).
     * @param {Pointer<UUID_VECTOR>} ObjectVector Pointer to a vector of object UUIDs that the server no longer wants to offer. The application constructs this vector. A null value indicates there are no object UUIDs to unexport (only binding handles are to be unexported).
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_VERS_OPTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The version option is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_NAME_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name syntax is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_UNSUPPORTED_NAME_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name syntax is unsupported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INCOMPLETE_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name is incomplete.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_ENTRY_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name-service entry was not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NAME_SERVICE_UNAVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name service is unavailable.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INTERFACE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The interface was not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NOT_ALL_OBJS_UNEXPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not all objects unexported.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcnsi/nf-rpcnsi-rpcnsbindingunexportpnpa
     * @since windows5.0
     */
    static RpcNsBindingUnexportPnPA(EntryNameSyntax, EntryName, IfSpec, ObjectVector) {
        EntryName := EntryName is String ? StrPtr(EntryName) : EntryName

        result := DllCall("RPCNS4.dll\RpcNsBindingUnexportPnPA", "uint", EntryNameSyntax, "ptr", EntryName, "ptr", IfSpec, "ptr", ObjectVector, "int")
        return result
    }

    /**
     * The RpcNsBindingExportPnP function establishes a name-service database entry with multiple binding handles and multiple objects for a server that supports Plug and Play.
     * @param {Integer} EntryNameSyntax Syntax of <i>EntryName</i>. 
     * 
     * 
     * 
     * 
     * To use the syntax specified in the registry value entry <b>HKEY_LOCAL_MACHINE\Software\Microsoft\Rpc\NameService\DefaultSyntax</b>, provide a value of RPC_C_NS_SYNTAX_DEFAULT.
     * @param {PWSTR} EntryName Pointer to the entry name to which binding handles and object UUIDs are exported. You cannot provide a null or empty string. 
     * 
     * 
     * 
     * 
     * To use the entry name specified in the registry value entry <b>HKEY_LOCAL_MACHINE\Software\Microsoft\Rpc\NameService\DefaultEntry</b>, provide a null pointer or an empty string. In this case, the <i>EntryNameSyntax</i> parameter is ignored and the run-time library uses the default syntax.
     * @param {Pointer<Void>} IfSpec Stub-generated data structure specifying the interface to export. A null value indicates there are no binding handles to export (only object UUIDs are to be exported) and <i>BindingVec</i> is ignored.
     * @param {Pointer<UUID_VECTOR>} ObjectVector Pointer to a vector of object UUIDs offered by the server. The server application constructs this vector. A null value indicates there are no object UUIDs to export (only binding handles are to be exported).
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NOTHING_TO_EXPORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There was nothing to export.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The binding handle was invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_WRONG_KIND_OF_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This was the wrong kind of binding for the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_NAME_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name syntax is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_UNSUPPORTED_NAME_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name syntax is unsupported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INCOMPLETE_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name is incomplete.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NO_NS_PRIVILEGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No privilege for name-service operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NAME_SERVICE_UNAVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name service is unavailable.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcnsi/nf-rpcnsi-rpcnsbindingexportpnpw
     * @since windows5.0
     */
    static RpcNsBindingExportPnPW(EntryNameSyntax, EntryName, IfSpec, ObjectVector) {
        EntryName := EntryName is String ? StrPtr(EntryName) : EntryName

        result := DllCall("RPCNS4.dll\RpcNsBindingExportPnPW", "uint", EntryNameSyntax, "ptr", EntryName, "ptr", IfSpec, "ptr", ObjectVector, "int")
        return result
    }

    /**
     * The RpcNsBindingUnexportPnP function removes the binding handles for Plug and Play interfaces and objects from an entry in the name-service database.
     * @param {Integer} EntryNameSyntax Syntax of <i>EntryName</i>. 
     * 
     * 
     * 
     * 
     * To use the syntax specified in the registry value entry <b>HKEY_LOCAL_MACHINE\Software\Microsoft\Rpc\NameService\DefaultSyntax</b>, provide a value of RPC_C_NS_SYNTAX_DEFAULT.
     * @param {PWSTR} EntryName Pointer to the entry name from which to remove binding handles and object UUIDs.
     * @param {Pointer<Void>} IfSpec Interface specification for the binding handles to be removed from the name service database. A null parameter value indicates not to unexport any binding handles (only object UUIDs are to be unexported).
     * @param {Pointer<UUID_VECTOR>} ObjectVector Pointer to a vector of object UUIDs that the server no longer wants to offer. The application constructs this vector. A null value indicates there are no object UUIDs to unexport (only binding handles are to be unexported).
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_VERS_OPTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The version option is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_NAME_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name syntax is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_UNSUPPORTED_NAME_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name syntax is unsupported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INCOMPLETE_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name is incomplete.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_ENTRY_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name-service entry was not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NAME_SERVICE_UNAVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name service is unavailable.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INTERFACE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The interface was not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NOT_ALL_OBJS_UNEXPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not all objects unexported.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcnsi/nf-rpcnsi-rpcnsbindingunexportpnpw
     * @since windows5.0
     */
    static RpcNsBindingUnexportPnPW(EntryNameSyntax, EntryName, IfSpec, ObjectVector) {
        EntryName := EntryName is String ? StrPtr(EntryName) : EntryName

        result := DllCall("RPCNS4.dll\RpcNsBindingUnexportPnPW", "uint", EntryNameSyntax, "ptr", EntryName, "ptr", IfSpec, "ptr", ObjectVector, "int")
        return result
    }

    /**
     * The RpcNsBindingLookupBegin function creates a lookup context for an interface and an object.
     * @param {Integer} EntryNameSyntax Syntax of the <i>EntryName</i> parameter. 
     * 
     * 
     * 
     * 
     * To use the syntax specified in the registry value entry <b>HKEY_LOCAL_MACHINE\Software\Microsoft\Rpc\NameService\DefaultSyntax</b>, provide a value of RPC_C_NS_SYNTAX_DEFAULT.
     * @param {PSTR} EntryName Pointer to an entry name at which the search for compatible bindings begins. 
     * 
     * 
     * 
     * 
     * To use the entry name specified in the registry value entry <b>HKEY_LOCAL_MACHINE\Software\Microsoft\Rpc\NameService\DefaultEntry</b>, provide a null pointer or an empty string. In this case, the <i>EntryNameSyntax</i> parameter is ignored and the run-time library uses the default syntax.
     * @param {Pointer<Void>} IfSpec Stub-generated structure indicating the interface to look up. If the interface specification has not been exported or is of no concern to the caller, specify a null value for this parameter. In this case, the bindings returned are only guaranteed to be of a compatible and supported protocol sequence and to contain the specified object UUID. The desired interface might not be supported by the contacted server.
     * @param {Pointer<Guid>} ObjUuid Pointer to an optional object UUID. 
     * 
     * 
     * 
     * 
     * For a nonzero UUID, compatible binding handles are returned from an entry only if the server has exported the specified object UUID.
     * 
     * For a null pointer value or a nil UUID for this parameter, the returned binding handles contain one of the object UUIDs exported by the compatible server. If the server did not export any object UUIDs, the returned compatible binding handles contain a nil object UUID.
     * @param {Integer} BindingMaxCount Maximum number of bindings to return in the <i>BindingVec</i> parameter from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcnsi/nf-rpcnsi-rpcnsbindinglookupnext">RpcNsBindingLookupNext</a> function. 
     * 
     * 
     * 
     * 
     * Specify a value of zero to use the default count of RPC_C_BINDING_MAX_COUNT_DEFAULT.
     * @param {Pointer<Void>} LookupContext Returns a pointer to a name-service handle for use with the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcnsi/nf-rpcnsi-rpcnsbindinglookupnext">RpcNsBindingLookupNext</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcnsi/nf-rpcnsi-rpcnsbindinglookupdone">RpcNsBindingLookupDone</a> functions.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_NAME_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name syntax is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_UNSUPPORTED_NAME_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name syntax is unsupported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INCOMPLETE_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name is incomplete.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_ENTRY_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name-service entry was not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NAME_SERVICE_UNAVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name service is unavailable.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_OBJECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid object.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcnsi/nf-rpcnsi-rpcnsbindinglookupbegina
     * @since windows5.0
     */
    static RpcNsBindingLookupBeginA(EntryNameSyntax, EntryName, IfSpec, ObjUuid, BindingMaxCount, LookupContext) {
        EntryName := EntryName is String ? StrPtr(EntryName) : EntryName

        result := DllCall("RPCNS4.dll\RpcNsBindingLookupBeginA", "uint", EntryNameSyntax, "ptr", EntryName, "ptr", IfSpec, "ptr", ObjUuid, "uint", BindingMaxCount, "ptr", LookupContext, "int")
        return result
    }

    /**
     * The RpcNsBindingLookupBegin function creates a lookup context for an interface and an object.
     * @param {Integer} EntryNameSyntax Syntax of the <i>EntryName</i> parameter. 
     * 
     * 
     * 
     * 
     * To use the syntax specified in the registry value entry <b>HKEY_LOCAL_MACHINE\Software\Microsoft\Rpc\NameService\DefaultSyntax</b>, provide a value of RPC_C_NS_SYNTAX_DEFAULT.
     * @param {PWSTR} EntryName Pointer to an entry name at which the search for compatible bindings begins. 
     * 
     * 
     * 
     * 
     * To use the entry name specified in the registry value entry <b>HKEY_LOCAL_MACHINE\Software\Microsoft\Rpc\NameService\DefaultEntry</b>, provide a null pointer or an empty string. In this case, the <i>EntryNameSyntax</i> parameter is ignored and the run-time library uses the default syntax.
     * @param {Pointer<Void>} IfSpec Stub-generated structure indicating the interface to look up. If the interface specification has not been exported or is of no concern to the caller, specify a null value for this parameter. In this case, the bindings returned are only guaranteed to be of a compatible and supported protocol sequence and to contain the specified object UUID. The desired interface might not be supported by the contacted server.
     * @param {Pointer<Guid>} ObjUuid Pointer to an optional object UUID. 
     * 
     * 
     * 
     * 
     * For a nonzero UUID, compatible binding handles are returned from an entry only if the server has exported the specified object UUID.
     * 
     * For a null pointer value or a nil UUID for this parameter, the returned binding handles contain one of the object UUIDs exported by the compatible server. If the server did not export any object UUIDs, the returned compatible binding handles contain a nil object UUID.
     * @param {Integer} BindingMaxCount Maximum number of bindings to return in the <i>BindingVec</i> parameter from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcnsi/nf-rpcnsi-rpcnsbindinglookupnext">RpcNsBindingLookupNext</a> function. 
     * 
     * 
     * 
     * 
     * Specify a value of zero to use the default count of RPC_C_BINDING_MAX_COUNT_DEFAULT.
     * @param {Pointer<Void>} LookupContext Returns a pointer to a name-service handle for use with the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcnsi/nf-rpcnsi-rpcnsbindinglookupnext">RpcNsBindingLookupNext</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcnsi/nf-rpcnsi-rpcnsbindinglookupdone">RpcNsBindingLookupDone</a> functions.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_NAME_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name syntax is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_UNSUPPORTED_NAME_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name syntax is unsupported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INCOMPLETE_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name is incomplete.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_ENTRY_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name-service entry was not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NAME_SERVICE_UNAVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name service is unavailable.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_OBJECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid object.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcnsi/nf-rpcnsi-rpcnsbindinglookupbeginw
     * @since windows5.0
     */
    static RpcNsBindingLookupBeginW(EntryNameSyntax, EntryName, IfSpec, ObjUuid, BindingMaxCount, LookupContext) {
        EntryName := EntryName is String ? StrPtr(EntryName) : EntryName

        result := DllCall("RPCNS4.dll\RpcNsBindingLookupBeginW", "uint", EntryNameSyntax, "ptr", EntryName, "ptr", IfSpec, "ptr", ObjUuid, "uint", BindingMaxCount, "ptr", LookupContext, "int")
        return result
    }

    /**
     * The RpcNsBindingLookupNext function returns a list of compatible binding handles for a specified interface and optionally an object.
     * @param {Pointer<Void>} LookupContext Name-service handle returned from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcnsi/nf-rpcnsi-rpcnsbindinglookupbegina">RpcNsBindingLookupBegin</a> function.
     * @param {Pointer<RPC_BINDING_VECTOR>} BindingVec Returns the address of a pointer to a vector of client-compatible server binding handles.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NO_MORE_BINDINGS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No more bindings.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NAME_SERVICE_UNAVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name service is unavailable.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcnsi/nf-rpcnsi-rpcnsbindinglookupnext
     * @since windows5.0
     */
    static RpcNsBindingLookupNext(LookupContext, BindingVec) {
        result := DllCall("RPCNS4.dll\RpcNsBindingLookupNext", "ptr", LookupContext, "ptr", BindingVec, "int")
        return result
    }

    /**
     * The RpcNsBindingLookupDone function signifies that a client has finished looking for compatible servers and deletes the lookup context.
     * @param {Pointer<Void>} LookupContext Pointer to the name-service handle to free. The name-service handle <i>LookupContext</i> points to is created by calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcnsi/nf-rpcnsi-rpcnsbindinglookupbegina">RpcNsBindingLookupBegin</a> function. 
     * 
     * 
     * 
     * 
     * An argument value of <b>NULL</b> is returned.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcnsi/nf-rpcnsi-rpcnsbindinglookupdone
     * @since windows5.0
     */
    static RpcNsBindingLookupDone(LookupContext) {
        result := DllCall("RPCNS4.dll\RpcNsBindingLookupDone", "ptr", LookupContext, "int")
        return result
    }

    /**
     * The RpcNsGroupDelete function deletes a group attribute.
     * @param {Integer} GroupNameSyntax 
     * @param {PSTR} GroupName Pointer to the name of the name-service group to delete.
     * @returns {Integer} This function returns one of the following values:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_NAME_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name syntax is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_UNSUPPORTED_NAME_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name syntax is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INCOMPLETE_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name is incomplete.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_ENTRY_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name-service entry was not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NAME_SERVICE_UNAVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name service is unavailable.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcnsi/nf-rpcnsi-rpcnsgroupdeletea
     * @since windows5.0
     */
    static RpcNsGroupDeleteA(GroupNameSyntax, GroupName) {
        GroupName := GroupName is String ? StrPtr(GroupName) : GroupName

        result := DllCall("RPCNS4.dll\RpcNsGroupDeleteA", "uint", GroupNameSyntax, "ptr", GroupName, "int")
        return result
    }

    /**
     * The RpcNsGroupMbrAdd function adds an entry name to a group. If necessary, it creates the entry.
     * @param {Integer} GroupNameSyntax Syntax of <i>GroupName</i>. 
     * 
     * 
     * 
     * 
     * To use the syntax specified in the registry value entry <b>HKEY_LOCAL_MACHINE\Software\Microsoft\Rpc\NameService\DefaultSyntax</b>, provide a value of RPC_C_NS_SYNTAX_DEFAULT.
     * @param {PSTR} GroupName Pointer to the name of the RPC group to receive a new member.
     * @param {Integer} MemberNameSyntax Syntax to use in <i>MemberName</i>. 
     * 
     * 
     * 
     * 
     * To use the syntax specified in the registry value entry <b>HKEY_LOCAL_MACHINE\Software\Microsoft\Rpc\NameService\DefaultSyntax</b>, provide a value of RPC_C_NS_SYNTAX_DEFAULT.
     * @param {PSTR} MemberName Pointer to the name of the new RPC group member.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_NAME_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name syntax is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_UNSUPPORTED_NAME_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name syntax is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INCOMPLETE_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name is incomplete.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NAME_SERVICE_UNAVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name service is unavailable.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcnsi/nf-rpcnsi-rpcnsgroupmbradda
     * @since windows5.0
     */
    static RpcNsGroupMbrAddA(GroupNameSyntax, GroupName, MemberNameSyntax, MemberName) {
        GroupName := GroupName is String ? StrPtr(GroupName) : GroupName
        MemberName := MemberName is String ? StrPtr(MemberName) : MemberName

        result := DllCall("RPCNS4.dll\RpcNsGroupMbrAddA", "uint", GroupNameSyntax, "ptr", GroupName, "uint", MemberNameSyntax, "ptr", MemberName, "int")
        return result
    }

    /**
     * The RpcNsGroupMbrRemove function removes an entry name from a group.
     * @param {Integer} GroupNameSyntax Syntax of <i>GroupName</i>. 
     * 
     * 
     * 
     * 
     * To use the syntax specified in the registry value entry <b>HKEY_LOCAL_MACHINE\Software\Microsoft\Rpc\NameService\DefaultSyntax</b>, provide a value of RPC_C_NS_SYNTAX_DEFAULT.
     * @param {PSTR} GroupName Pointer to the name of the RPC group from which to remove the member name.
     * @param {Integer} MemberNameSyntax Syntax to use in the <i>MemberName</i> parameter. 
     * 
     * 
     * 
     * 
     * To use the syntax specified in the registry value entry <b>HKEY_LOCAL_MACHINE\Software\Microsoft\Rpc\NameService\DefaultSyntax</b>, provide a value of RPC_C_NS_SYNTAX_DEFAULT.
     * @param {PSTR} MemberName Pointer to the name of the member to remove from the RPC group attribute in the entry <i>GroupName</i>.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_NAME_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name syntax is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_UNSUPPORTED_NAME_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name syntax is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INCOMPLETE_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name is incomplete.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_ENTRY_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name-service entry was not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NAME_SERVICE_UNAVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name service is unavailable.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_GROUP_MEMBER_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The group member was not found.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcnsi/nf-rpcnsi-rpcnsgroupmbrremovea
     * @since windows5.0
     */
    static RpcNsGroupMbrRemoveA(GroupNameSyntax, GroupName, MemberNameSyntax, MemberName) {
        GroupName := GroupName is String ? StrPtr(GroupName) : GroupName
        MemberName := MemberName is String ? StrPtr(MemberName) : MemberName

        result := DllCall("RPCNS4.dll\RpcNsGroupMbrRemoveA", "uint", GroupNameSyntax, "ptr", GroupName, "uint", MemberNameSyntax, "ptr", MemberName, "int")
        return result
    }

    /**
     * The RpcNsGroupMbrInqBegin function creates an inquiry context for viewing group members.
     * @param {Integer} GroupNameSyntax Syntax of <i>GroupName</i>. 
     * 
     * 
     * 
     * 
     * To use the syntax specified in the registry value entry <b>HKEY_LOCAL_MACHINE\Software\Microsoft\Rpc\NameService\DefaultSyntax</b>, provide a value of RPC_C_NS_SYNTAX_DEFAULT.
     * @param {PSTR} GroupName Pointer to the name of the RPC group to view.
     * @param {Integer} MemberNameSyntax Syntax of the return parameter, <i>MemberName</i>, in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcnsi/nf-rpcnsi-rpcnsgroupmbrinqnexta">RpcNsGroupMbrInqNext</a> function. 
     * 
     * 
     * 
     * 
     * To use the syntax specified in the registry value entry <b>HKEY_LOCAL_MACHINE\Software\Microsoft\Rpc\NameService\DefaultSyntax</b>, provide a value of RPC_C_NS_SYNTAX_DEFAULT.
     * @param {Pointer<Void>} InquiryContext Returns a pointer to a name-service handle for use with the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcnsi/nf-rpcnsi-rpcnsgroupmbrinqnexta">RpcNsGroupMbrInqNext</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcnsi/nf-rpcnsi-rpcnsgroupmbrinqdone">RpcNsGroupMbrInqDone</a> functions.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_NAME_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name syntax is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_UNSUPPORTED_NAME_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name syntax is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INCOMPLETE_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name is incomplete.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_ENTRY_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name-service entry was not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NAME_SERVICE_UNAVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name service is unavailable.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcnsi/nf-rpcnsi-rpcnsgroupmbrinqbegina
     * @since windows5.0
     */
    static RpcNsGroupMbrInqBeginA(GroupNameSyntax, GroupName, MemberNameSyntax, InquiryContext) {
        GroupName := GroupName is String ? StrPtr(GroupName) : GroupName

        result := DllCall("RPCNS4.dll\RpcNsGroupMbrInqBeginA", "uint", GroupNameSyntax, "ptr", GroupName, "uint", MemberNameSyntax, "ptr", InquiryContext, "int")
        return result
    }

    /**
     * The RpcNsGroupMbrInqNext function returns one entry name from a group at a time.
     * @param {Pointer<Void>} InquiryContext Name service handle.
     * @param {Pointer<PSTR>} MemberName Returns the address of a pointer to an RPC group member name. The syntax of the returned name was specified by the <i>MemberNameSyntax</i> parameter in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcnsi/nf-rpcnsi-rpcnsgroupmbrinqbegina">RpcNsGroupMbrInqBegin</a> function. 
     * 
     * 
     * 
     * 
     * Specify a null value to prevent 
     * <b>RpcNsGroupMbrInqNext</b> from returning the <i>MemberName</i> parameter. In this case, the application does not call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcstringfree">RpcStringFree</a> function.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_NS_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name-service handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NO_MORE_MEMBERS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No more members.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NAME_SERVICE_UNAVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name service is unavailable.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcnsi/nf-rpcnsi-rpcnsgroupmbrinqnexta
     * @since windows5.0
     */
    static RpcNsGroupMbrInqNextA(InquiryContext, MemberName) {
        result := DllCall("RPCNS4.dll\RpcNsGroupMbrInqNextA", "ptr", InquiryContext, "ptr", MemberName, "int")
        return result
    }

    /**
     * The RpcNsGroupDelete function deletes a group attribute.
     * @param {Integer} GroupNameSyntax 
     * @param {PWSTR} GroupName Pointer to the name of the name-service group to delete.
     * @returns {Integer} This function returns one of the following values:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_NAME_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name syntax is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_UNSUPPORTED_NAME_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name syntax is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INCOMPLETE_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name is incomplete.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_ENTRY_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name-service entry was not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NAME_SERVICE_UNAVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name service is unavailable.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcnsi/nf-rpcnsi-rpcnsgroupdeletew
     * @since windows5.0
     */
    static RpcNsGroupDeleteW(GroupNameSyntax, GroupName) {
        GroupName := GroupName is String ? StrPtr(GroupName) : GroupName

        result := DllCall("RPCNS4.dll\RpcNsGroupDeleteW", "uint", GroupNameSyntax, "ptr", GroupName, "int")
        return result
    }

    /**
     * The RpcNsGroupMbrAdd function adds an entry name to a group. If necessary, it creates the entry.
     * @param {Integer} GroupNameSyntax Syntax of <i>GroupName</i>. 
     * 
     * 
     * 
     * 
     * To use the syntax specified in the registry value entry <b>HKEY_LOCAL_MACHINE\Software\Microsoft\Rpc\NameService\DefaultSyntax</b>, provide a value of RPC_C_NS_SYNTAX_DEFAULT.
     * @param {PWSTR} GroupName Pointer to the name of the RPC group to receive a new member.
     * @param {Integer} MemberNameSyntax Syntax to use in <i>MemberName</i>. 
     * 
     * 
     * 
     * 
     * To use the syntax specified in the registry value entry <b>HKEY_LOCAL_MACHINE\Software\Microsoft\Rpc\NameService\DefaultSyntax</b>, provide a value of RPC_C_NS_SYNTAX_DEFAULT.
     * @param {PWSTR} MemberName Pointer to the name of the new RPC group member.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_NAME_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name syntax is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_UNSUPPORTED_NAME_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name syntax is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INCOMPLETE_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name is incomplete.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NAME_SERVICE_UNAVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name service is unavailable.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcnsi/nf-rpcnsi-rpcnsgroupmbraddw
     * @since windows5.0
     */
    static RpcNsGroupMbrAddW(GroupNameSyntax, GroupName, MemberNameSyntax, MemberName) {
        GroupName := GroupName is String ? StrPtr(GroupName) : GroupName
        MemberName := MemberName is String ? StrPtr(MemberName) : MemberName

        result := DllCall("RPCNS4.dll\RpcNsGroupMbrAddW", "uint", GroupNameSyntax, "ptr", GroupName, "uint", MemberNameSyntax, "ptr", MemberName, "int")
        return result
    }

    /**
     * The RpcNsGroupMbrRemove function removes an entry name from a group.
     * @param {Integer} GroupNameSyntax Syntax of <i>GroupName</i>. 
     * 
     * 
     * 
     * 
     * To use the syntax specified in the registry value entry <b>HKEY_LOCAL_MACHINE\Software\Microsoft\Rpc\NameService\DefaultSyntax</b>, provide a value of RPC_C_NS_SYNTAX_DEFAULT.
     * @param {PWSTR} GroupName Pointer to the name of the RPC group from which to remove the member name.
     * @param {Integer} MemberNameSyntax Syntax to use in the <i>MemberName</i> parameter. 
     * 
     * 
     * 
     * 
     * To use the syntax specified in the registry value entry <b>HKEY_LOCAL_MACHINE\Software\Microsoft\Rpc\NameService\DefaultSyntax</b>, provide a value of RPC_C_NS_SYNTAX_DEFAULT.
     * @param {PWSTR} MemberName Pointer to the name of the member to remove from the RPC group attribute in the entry <i>GroupName</i>.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_NAME_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name syntax is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_UNSUPPORTED_NAME_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name syntax is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INCOMPLETE_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name is incomplete.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_ENTRY_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name-service entry was not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NAME_SERVICE_UNAVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name service is unavailable.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_GROUP_MEMBER_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The group member was not found.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcnsi/nf-rpcnsi-rpcnsgroupmbrremovew
     * @since windows5.0
     */
    static RpcNsGroupMbrRemoveW(GroupNameSyntax, GroupName, MemberNameSyntax, MemberName) {
        GroupName := GroupName is String ? StrPtr(GroupName) : GroupName
        MemberName := MemberName is String ? StrPtr(MemberName) : MemberName

        result := DllCall("RPCNS4.dll\RpcNsGroupMbrRemoveW", "uint", GroupNameSyntax, "ptr", GroupName, "uint", MemberNameSyntax, "ptr", MemberName, "int")
        return result
    }

    /**
     * The RpcNsGroupMbrInqBegin function creates an inquiry context for viewing group members.
     * @param {Integer} GroupNameSyntax Syntax of <i>GroupName</i>. 
     * 
     * 
     * 
     * 
     * To use the syntax specified in the registry value entry <b>HKEY_LOCAL_MACHINE\Software\Microsoft\Rpc\NameService\DefaultSyntax</b>, provide a value of RPC_C_NS_SYNTAX_DEFAULT.
     * @param {PWSTR} GroupName Pointer to the name of the RPC group to view.
     * @param {Integer} MemberNameSyntax Syntax of the return parameter, <i>MemberName</i>, in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcnsi/nf-rpcnsi-rpcnsgroupmbrinqnexta">RpcNsGroupMbrInqNext</a> function. 
     * 
     * 
     * 
     * 
     * To use the syntax specified in the registry value entry <b>HKEY_LOCAL_MACHINE\Software\Microsoft\Rpc\NameService\DefaultSyntax</b>, provide a value of RPC_C_NS_SYNTAX_DEFAULT.
     * @param {Pointer<Void>} InquiryContext Returns a pointer to a name-service handle for use with the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcnsi/nf-rpcnsi-rpcnsgroupmbrinqnexta">RpcNsGroupMbrInqNext</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcnsi/nf-rpcnsi-rpcnsgroupmbrinqdone">RpcNsGroupMbrInqDone</a> functions.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_NAME_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name syntax is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_UNSUPPORTED_NAME_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name syntax is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INCOMPLETE_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name is incomplete.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_ENTRY_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name-service entry was not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NAME_SERVICE_UNAVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name service is unavailable.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcnsi/nf-rpcnsi-rpcnsgroupmbrinqbeginw
     * @since windows5.0
     */
    static RpcNsGroupMbrInqBeginW(GroupNameSyntax, GroupName, MemberNameSyntax, InquiryContext) {
        GroupName := GroupName is String ? StrPtr(GroupName) : GroupName

        result := DllCall("RPCNS4.dll\RpcNsGroupMbrInqBeginW", "uint", GroupNameSyntax, "ptr", GroupName, "uint", MemberNameSyntax, "ptr", InquiryContext, "int")
        return result
    }

    /**
     * The RpcNsGroupMbrInqNext function returns one entry name from a group at a time.
     * @param {Pointer<Void>} InquiryContext Name service handle.
     * @param {Pointer<PWSTR>} MemberName Returns the address of a pointer to an RPC group member name. The syntax of the returned name was specified by the <i>MemberNameSyntax</i> parameter in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcnsi/nf-rpcnsi-rpcnsgroupmbrinqbegina">RpcNsGroupMbrInqBegin</a> function. 
     * 
     * 
     * 
     * 
     * Specify a null value to prevent 
     * <b>RpcNsGroupMbrInqNext</b> from returning the <i>MemberName</i> parameter. In this case, the application does not call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcstringfree">RpcStringFree</a> function.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_NS_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name-service handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NO_MORE_MEMBERS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No more members.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NAME_SERVICE_UNAVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name service is unavailable.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcnsi/nf-rpcnsi-rpcnsgroupmbrinqnextw
     * @since windows5.0
     */
    static RpcNsGroupMbrInqNextW(InquiryContext, MemberName) {
        result := DllCall("RPCNS4.dll\RpcNsGroupMbrInqNextW", "ptr", InquiryContext, "ptr", MemberName, "int")
        return result
    }

    /**
     * The RpcNsGroupMbrInqDone function deletes the inquiry context for a group.
     * @param {Pointer<Void>} InquiryContext Pointer to a name-service handle to free. A value of NULL is returned.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_NS_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name-service handle is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcnsi/nf-rpcnsi-rpcnsgroupmbrinqdone
     * @since windows5.0
     */
    static RpcNsGroupMbrInqDone(InquiryContext) {
        result := DllCall("RPCNS4.dll\RpcNsGroupMbrInqDone", "ptr", InquiryContext, "int")
        return result
    }

    /**
     * The RpcNsProfileDelete function deletes a profile attribute.
     * @param {Integer} ProfileNameSyntax Integer value indicating the syntax of the next parameter, <i>ProfileName</i>. 
     * 
     * 
     * 
     * 
     * To use the syntax specified in the registry value <b>HKEY_LOCAL_MACHINE\Software\Microsoft\Rpc\NameService\DefaultSyntax</b>, provide a value of RPC_C_NS_SYNTAX_DEFAULT.
     * @param {PSTR} ProfileName Pointer to the name of the profile to delete.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_NAME_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name syntax is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_UNSUPPORTED_NAME_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name syntax is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INCOMPLETE_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name is incomplete.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_ENTRY_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name-service entry was not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NAME_SERVICE_UNAVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name service is unavailable.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcnsi/nf-rpcnsi-rpcnsprofiledeletea
     * @since windows5.0
     */
    static RpcNsProfileDeleteA(ProfileNameSyntax, ProfileName) {
        ProfileName := ProfileName is String ? StrPtr(ProfileName) : ProfileName

        result := DllCall("RPCNS4.dll\RpcNsProfileDeleteA", "uint", ProfileNameSyntax, "ptr", ProfileName, "int")
        return result
    }

    /**
     * The RpcNsProfileEltAdd function adds an element to a profile. If necessary, it creates the entry.
     * @param {Integer} ProfileNameSyntax Syntax of <i>ProfileName</i>. 
     * 
     * 
     * 
     * 
     * To use the syntax specified in the registry value entry <b>HKEY_LOCAL_MACHINE\Software\Microsoft\Rpc\NameService\DefaultSyntax</b>, provide a value of RPC_C_NS_SYNTAX_DEFAULT.
     * @param {PSTR} ProfileName Pointer to the name of the profile to receive a new element.
     * @param {Pointer<RPC_IF_ID>} IfId Pointer to the interface identification of the new profile element. To add or replace the default profile element, specify a null value.
     * @param {Integer} MemberNameSyntax Syntax of <i>MemberName</i>. 
     * 
     * 
     * 
     * 
     * To use the syntax specified in the registry value entry <b>HKEY_LOCAL_MACHINE\Software\Microsoft\Rpc\NameService\DefaultSyntax</b>, provide a value of RPC_C_NS_SYNTAX_DEFAULT.
     * @param {PSTR} MemberName Pointer to a name service–entry name to include in the new profile element.
     * @param {Integer} Priority Integer value (0 through 7) that indicates the relative priority for using the new profile element during the import and lookup operations. A value of 0 is the highest priority; a value of 7 is the lowest priority. When adding a default profile member, use a value of 0.
     * @param {PSTR} Annotation Pointer to an annotation string stored as part of the new profile element. Specify a null value or a null-terminated string if there is no annotation string. 
     * 
     * 
     * 
     * 
     * The string is used by applications for informational purposes only. For example, an application can use this string to store the interface-name string specified in the IDL file. RPC does not use the annotation string during lookup or import operations or for enumerating profile elements.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_NAME_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name syntax is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_UNSUPPORTED_NAME_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name syntax is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INCOMPLETE_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name is incomplete.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NAME_SERVICE_UNAVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name service is unavailable.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcnsi/nf-rpcnsi-rpcnsprofileeltadda
     * @since windows5.0
     */
    static RpcNsProfileEltAddA(ProfileNameSyntax, ProfileName, IfId, MemberNameSyntax, MemberName, Priority, Annotation) {
        ProfileName := ProfileName is String ? StrPtr(ProfileName) : ProfileName
        MemberName := MemberName is String ? StrPtr(MemberName) : MemberName
        Annotation := Annotation is String ? StrPtr(Annotation) : Annotation

        result := DllCall("RPCNS4.dll\RpcNsProfileEltAddA", "uint", ProfileNameSyntax, "ptr", ProfileName, "ptr", IfId, "uint", MemberNameSyntax, "ptr", MemberName, "uint", Priority, "ptr", Annotation, "int")
        return result
    }

    /**
     * The RpcNsProfileEltRemove function removes an element from a profile.
     * @param {Integer} ProfileNameSyntax Syntax of <i>ProfileName</i>. 
     * 
     * 
     * 
     * 
     * To use the syntax specified in the registry value entry <b>HKEY_LOCAL_MACHINE\Software\Microsoft\Rpc\NameService\DefaultSyntax</b>, provide a value of RPC_C_NS_SYNTAX_DEFAULT.
     * @param {PSTR} ProfileName Pointer to the name of the profile from which to remove an element.
     * @param {Pointer<RPC_IF_ID>} IfId Pointer to the interface identification of the profile element to be removed. 
     * 
     * 
     * 
     * 
     * Specify a null value to remove the default profile member.
     * @param {Integer} MemberNameSyntax Syntax of <i>MemberName</i>. 
     * 
     * 
     * 
     * 
     * To use the syntax specified in the registry value entry <b>HKEY_LOCAL_MACHINE\Software\Microsoft\Rpc\NameService\DefaultSyntax</b>, provide a value of RPC_C_NS_SYNTAX_DEFAULT.
     * @param {PSTR} MemberName Pointer to the name service–entry name in the profile element to remove.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_NAME_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name syntax is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_UNSUPPORTED_NAME_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name syntax is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INCOMPLETE_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name is incomplete.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_ENTRY_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name-service entry was not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NAME_SERVICE_UNAVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name service is unavailable.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcnsi/nf-rpcnsi-rpcnsprofileeltremovea
     * @since windows5.0
     */
    static RpcNsProfileEltRemoveA(ProfileNameSyntax, ProfileName, IfId, MemberNameSyntax, MemberName) {
        ProfileName := ProfileName is String ? StrPtr(ProfileName) : ProfileName
        MemberName := MemberName is String ? StrPtr(MemberName) : MemberName

        result := DllCall("RPCNS4.dll\RpcNsProfileEltRemoveA", "uint", ProfileNameSyntax, "ptr", ProfileName, "ptr", IfId, "uint", MemberNameSyntax, "ptr", MemberName, "int")
        return result
    }

    /**
     * The RpcNsProfileEltInqBegin function creates an inquiry context for viewing the elements in a profile.
     * @param {Integer} ProfileNameSyntax Syntax of <i>ProfileName</i>. 
     * 
     * 
     * 
     * 
     * To use the syntax specified in the registry value entry <b>HKEY_LOCAL_MACHINE\Software\Microsoft\Rpc\NameService\DefaultSyntax</b>, provide a value of RPC_C_NS_SYNTAX_DEFAULT.
     * @param {PSTR} ProfileName Pointer to the name of the profile to view.
     * @param {Integer} InquiryType Type of inquiry to perform on the profile. The following table lists valid inquiry types. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Inquiry type</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RPC_C_PROFILE_DEFAULT_ELT"></a><a id="rpc_c_profile_default_elt"></a><dl>
     * <dt><b>RPC_C_PROFILE_DEFAULT_ELT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Searches the profile for the default profile element, if any. The <i>IfId</i>, <i>VersOption</i>, and <i>MemberName</i> parameters are ignored.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RPC_C_PROFILE_ALL_ELTS"></a><a id="rpc_c_profile_all_elts"></a><dl>
     * <dt><b>RPC_C_PROFILE_ALL_ELTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returns every element from the profile. The <i>IfId</i>, <i>VersOption</i>, and <i>MemberName</i> parameters are ignored.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RPC_C_PROFILE_MATCH_BY_IF"></a><a id="rpc_c_profile_match_by_if"></a><dl>
     * <dt><b>RPC_C_PROFILE_MATCH_BY_IF</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Searches the profile for elements that contain the interface identification specified by <i>IfId</i> and <i>VersOption</i>. The <i>MemberName</i> parameter is ignored.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RPC_C_PROFILE_MATCH_BY_MBR"></a><a id="rpc_c_profile_match_by_mbr"></a><dl>
     * <dt><b>RPC_C_PROFILE_MATCH_BY_MBR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Searches the profile for elements that contain <i>MemberName</i>. The <i>IfId</i> and <i>VersOption</i> parameters are ignored.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RPC_C_PROFILE_MATCH_BY_BOTH"></a><a id="rpc_c_profile_match_by_both"></a><dl>
     * <dt><b>RPC_C_PROFILE_MATCH_BY_BOTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Searches the profile for elements that contain the interface identification and member identified by the <i>IfId</i>, <i>VersOption</i>, and <i>MemberName</i> parameters.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<RPC_IF_ID>} IfId Pointer to the interface identification of the profile elements to be returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcnsi/nf-rpcnsi-rpcnsprofileeltinqnexta">RpcNsProfileEltInqNext</a> function. 
     * 
     * 
     * 
     * 
     * The <i>IfId</i> parameter is used only when specifying a value of RPC_C_PROFILE_MATCH_BY_IF or RPC_C_PROFILE_MATCH_BY_BOTH for the <i>InquiryType</i> parameter. Otherwise, <i>IfId</i> is ignored and a null value can be specified.
     * @param {Integer} VersOption Specifies how the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcnsi/nf-rpcnsi-rpcnsprofileeltinqnexta">RpcNsProfileEltInqNext</a> function uses the <i>IfId</i> parameter. This parameter is used only when specifying a value of RPC_C_PROFILE_MATCH_BY_IF or RPC_C_PROFILE_MATCH_BY_BOTH for <i>InquiryType</i>. Otherwise, this parameter is ignored and a 0 value can be specified. 
     * 
     * 
     * 
     * 
     * The following table describes valid values for <i>VersOption</i>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RPC_C_VERS_ALL"></a><a id="rpc_c_vers_all"></a><dl>
     * <dt><b>RPC_C_VERS_ALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returns profile elements that offer the specified interface UUID, regardless of the version numbers. For this value, specify 0 for both the major and minor versions in <i>IfId</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RPC_C_VERS_COMPATIBLE"></a><a id="rpc_c_vers_compatible"></a><dl>
     * <dt><b>RPC_C_VERS_COMPATIBLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returns profile elements that offer the same major version of the specified interface UUID and a minor version greater than or equal to the minor version of the specified interface UUID.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RPC_C_VERS_EXACT"></a><a id="rpc_c_vers_exact"></a><dl>
     * <dt><b>RPC_C_VERS_EXACT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returns profile elements that offer the specified version of the specified interface UUID.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RPC_C_VERS_MAJOR_ONLY"></a><a id="rpc_c_vers_major_only"></a><dl>
     * <dt><b>RPC_C_VERS_MAJOR_ONLY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returns profile elements that offer the same major version of the specified interface UUID (ignores the minor version). For this value, specify 0 for the minor version in <i>IfId</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RPC_C_VERS_UPTO"></a><a id="rpc_c_vers_upto"></a><dl>
     * <dt><b>RPC_C_VERS_UPTO</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returns profile elements that offer a version of the specified interface UUID less than or equal to the specified major and minor version. (For example, if the <i>IfId</i> contained V2.0 and the profile contained elements with V1.3, V2.0, and V2.1, the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcnsi/nf-rpcnsi-rpcnsprofileeltinqnexta">RpcNsProfileEltInqNext</a> function returns elements with V1.3 and V2.0.)
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} MemberNameSyntax Syntax of <i>MemberName</i>, and the return parameter <i>MemberName</i> in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcnsi/nf-rpcnsi-rpcnsprofileeltinqnexta">RpcNsProfileEltInqNext</a> function. 
     * 
     * 
     * 
     * 
     * To use the syntax specified in the registry value entry <b>HKEY_LOCAL_MACHINE\Software\Microsoft\Rpc\NameService\DefaultSyntax</b>, provide a value of RPC_C_NS_SYNTAX_DEFAULT.
     * @param {PSTR} MemberName Pointer to the member name that the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcnsi/nf-rpcnsi-rpcnsprofileeltinqnexta">RpcNsProfileEltInqNext</a> function looks for in profile elements. The <i>MemberName</i> parameter is used only when specifying a value of RPC_C_PROFILE_MATCH_BY_MBR or RPC_C_PROFILE_MATCH_BY_BOTH for <i>InquiryType</i>. Otherwise, <i>MemberName</i> is ignored and a null value can be specified.
     * @param {Pointer<Void>} InquiryContext Returns a pointer to a name-service handle for use with the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcnsi/nf-rpcnsi-rpcnsprofileeltinqnexta">RpcNsProfileEltInqNext</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcnsi/nf-rpcnsi-rpcnsprofileeltinqdone">RpcNsProfileEltInqDone</a> functions.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_VERS_OPTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The version option is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_NAME_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name syntax is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_UNSUPPORTED_NAME_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name syntax is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INCOMPLETE_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name is incomplete.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_ENTRY_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name-service entry was not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NAME_SERVICE_UNAVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name service is unavailable.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcnsi/nf-rpcnsi-rpcnsprofileeltinqbegina
     * @since windows5.0
     */
    static RpcNsProfileEltInqBeginA(ProfileNameSyntax, ProfileName, InquiryType, IfId, VersOption, MemberNameSyntax, MemberName, InquiryContext) {
        ProfileName := ProfileName is String ? StrPtr(ProfileName) : ProfileName
        MemberName := MemberName is String ? StrPtr(MemberName) : MemberName

        result := DllCall("RPCNS4.dll\RpcNsProfileEltInqBeginA", "uint", ProfileNameSyntax, "ptr", ProfileName, "uint", InquiryType, "ptr", IfId, "uint", VersOption, "uint", MemberNameSyntax, "ptr", MemberName, "ptr", InquiryContext, "int")
        return result
    }

    /**
     * The RpcNsProfileEltInqNext function returns one element at a time from a profile.
     * @param {Pointer<Void>} InquiryContext Name-service handle returned from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcnsi/nf-rpcnsi-rpcnsprofileeltinqbegina">RpcNsProfileEltInqBegin</a> function.
     * @param {Pointer<RPC_IF_ID>} IfId Returns a pointer to the interface identification of the profile element.
     * @param {Pointer<PSTR>} MemberName Returns a pointer to a pointer to the profile element's member name.The syntax of the returned name was specified by the <i>MemberNameSyntax</i> parameter in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcnsi/nf-rpcnsi-rpcnsprofileeltinqbegina">RpcNsProfileEltInqBegin</a> function. 
     * 
     * 
     * 
     * 
     * Specify a null value to prevent 
     * <b>RpcNsProfileEltInqNext</b> from returning the <i>MemberName</i> parameter. In this case, the application does not call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcstringfree">RpcStringFree</a> function.
     * @param {Pointer<UInt32>} Priority Returns a pointer to the profile-element priority.
     * @param {Pointer<PSTR>} Annotation Returns a pointer to a pointer to the annotation string for the profile element. If there is no annotation string in the profile element, the string \0 is returned. 
     * 
     * 
     * 
     * 
     * Specify a null value to prevent 
     * <b>RpcNsProfileEltInqNext</b> from returning the <i>Annotation</i> parameter. In this case, the application does not need to call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcstringfree">RpcStringFree</a> function.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INCOMPLETE_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name is incomplete.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NAME_SERVICE_UNAVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name service is unavailable.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NO_MORE_ELEMENTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No more elements.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcnsi/nf-rpcnsi-rpcnsprofileeltinqnexta
     * @since windows5.0
     */
    static RpcNsProfileEltInqNextA(InquiryContext, IfId, MemberName, Priority, Annotation) {
        result := DllCall("RPCNS4.dll\RpcNsProfileEltInqNextA", "ptr", InquiryContext, "ptr", IfId, "ptr", MemberName, "uint*", Priority, "ptr", Annotation, "int")
        return result
    }

    /**
     * The RpcNsProfileDelete function deletes a profile attribute.
     * @param {Integer} ProfileNameSyntax Integer value indicating the syntax of the next parameter, <i>ProfileName</i>. 
     * 
     * 
     * 
     * 
     * To use the syntax specified in the registry value <b>HKEY_LOCAL_MACHINE\Software\Microsoft\Rpc\NameService\DefaultSyntax</b>, provide a value of RPC_C_NS_SYNTAX_DEFAULT.
     * @param {PWSTR} ProfileName Pointer to the name of the profile to delete.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_NAME_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name syntax is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_UNSUPPORTED_NAME_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name syntax is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INCOMPLETE_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name is incomplete.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_ENTRY_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name-service entry was not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NAME_SERVICE_UNAVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name service is unavailable.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcnsi/nf-rpcnsi-rpcnsprofiledeletew
     * @since windows5.0
     */
    static RpcNsProfileDeleteW(ProfileNameSyntax, ProfileName) {
        ProfileName := ProfileName is String ? StrPtr(ProfileName) : ProfileName

        result := DllCall("RPCNS4.dll\RpcNsProfileDeleteW", "uint", ProfileNameSyntax, "ptr", ProfileName, "int")
        return result
    }

    /**
     * The RpcNsProfileEltAdd function adds an element to a profile. If necessary, it creates the entry.
     * @param {Integer} ProfileNameSyntax Syntax of <i>ProfileName</i>. 
     * 
     * 
     * 
     * 
     * To use the syntax specified in the registry value entry <b>HKEY_LOCAL_MACHINE\Software\Microsoft\Rpc\NameService\DefaultSyntax</b>, provide a value of RPC_C_NS_SYNTAX_DEFAULT.
     * @param {PWSTR} ProfileName Pointer to the name of the profile to receive a new element.
     * @param {Pointer<RPC_IF_ID>} IfId Pointer to the interface identification of the new profile element. To add or replace the default profile element, specify a null value.
     * @param {Integer} MemberNameSyntax Syntax of <i>MemberName</i>. 
     * 
     * 
     * 
     * 
     * To use the syntax specified in the registry value entry <b>HKEY_LOCAL_MACHINE\Software\Microsoft\Rpc\NameService\DefaultSyntax</b>, provide a value of RPC_C_NS_SYNTAX_DEFAULT.
     * @param {PWSTR} MemberName Pointer to a name service–entry name to include in the new profile element.
     * @param {Integer} Priority Integer value (0 through 7) that indicates the relative priority for using the new profile element during the import and lookup operations. A value of 0 is the highest priority; a value of 7 is the lowest priority. When adding a default profile member, use a value of 0.
     * @param {PWSTR} Annotation Pointer to an annotation string stored as part of the new profile element. Specify a null value or a null-terminated string if there is no annotation string. 
     * 
     * 
     * 
     * 
     * The string is used by applications for informational purposes only. For example, an application can use this string to store the interface-name string specified in the IDL file. RPC does not use the annotation string during lookup or import operations or for enumerating profile elements.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_NAME_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name syntax is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_UNSUPPORTED_NAME_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name syntax is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INCOMPLETE_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name is incomplete.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NAME_SERVICE_UNAVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name service is unavailable.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcnsi/nf-rpcnsi-rpcnsprofileeltaddw
     * @since windows5.0
     */
    static RpcNsProfileEltAddW(ProfileNameSyntax, ProfileName, IfId, MemberNameSyntax, MemberName, Priority, Annotation) {
        ProfileName := ProfileName is String ? StrPtr(ProfileName) : ProfileName
        MemberName := MemberName is String ? StrPtr(MemberName) : MemberName
        Annotation := Annotation is String ? StrPtr(Annotation) : Annotation

        result := DllCall("RPCNS4.dll\RpcNsProfileEltAddW", "uint", ProfileNameSyntax, "ptr", ProfileName, "ptr", IfId, "uint", MemberNameSyntax, "ptr", MemberName, "uint", Priority, "ptr", Annotation, "int")
        return result
    }

    /**
     * The RpcNsProfileEltRemove function removes an element from a profile.
     * @param {Integer} ProfileNameSyntax Syntax of <i>ProfileName</i>. 
     * 
     * 
     * 
     * 
     * To use the syntax specified in the registry value entry <b>HKEY_LOCAL_MACHINE\Software\Microsoft\Rpc\NameService\DefaultSyntax</b>, provide a value of RPC_C_NS_SYNTAX_DEFAULT.
     * @param {PWSTR} ProfileName Pointer to the name of the profile from which to remove an element.
     * @param {Pointer<RPC_IF_ID>} IfId Pointer to the interface identification of the profile element to be removed. 
     * 
     * 
     * 
     * 
     * Specify a null value to remove the default profile member.
     * @param {Integer} MemberNameSyntax Syntax of <i>MemberName</i>. 
     * 
     * 
     * 
     * 
     * To use the syntax specified in the registry value entry <b>HKEY_LOCAL_MACHINE\Software\Microsoft\Rpc\NameService\DefaultSyntax</b>, provide a value of RPC_C_NS_SYNTAX_DEFAULT.
     * @param {PWSTR} MemberName Pointer to the name service–entry name in the profile element to remove.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_NAME_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name syntax is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_UNSUPPORTED_NAME_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name syntax is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INCOMPLETE_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name is incomplete.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_ENTRY_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name-service entry was not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NAME_SERVICE_UNAVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name service is unavailable.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcnsi/nf-rpcnsi-rpcnsprofileeltremovew
     * @since windows5.0
     */
    static RpcNsProfileEltRemoveW(ProfileNameSyntax, ProfileName, IfId, MemberNameSyntax, MemberName) {
        ProfileName := ProfileName is String ? StrPtr(ProfileName) : ProfileName
        MemberName := MemberName is String ? StrPtr(MemberName) : MemberName

        result := DllCall("RPCNS4.dll\RpcNsProfileEltRemoveW", "uint", ProfileNameSyntax, "ptr", ProfileName, "ptr", IfId, "uint", MemberNameSyntax, "ptr", MemberName, "int")
        return result
    }

    /**
     * The RpcNsProfileEltInqBegin function creates an inquiry context for viewing the elements in a profile.
     * @param {Integer} ProfileNameSyntax Syntax of <i>ProfileName</i>. 
     * 
     * 
     * 
     * 
     * To use the syntax specified in the registry value entry <b>HKEY_LOCAL_MACHINE\Software\Microsoft\Rpc\NameService\DefaultSyntax</b>, provide a value of RPC_C_NS_SYNTAX_DEFAULT.
     * @param {PWSTR} ProfileName Pointer to the name of the profile to view.
     * @param {Integer} InquiryType Type of inquiry to perform on the profile. The following table lists valid inquiry types. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Inquiry type</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RPC_C_PROFILE_DEFAULT_ELT"></a><a id="rpc_c_profile_default_elt"></a><dl>
     * <dt><b>RPC_C_PROFILE_DEFAULT_ELT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Searches the profile for the default profile element, if any. The <i>IfId</i>, <i>VersOption</i>, and <i>MemberName</i> parameters are ignored.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RPC_C_PROFILE_ALL_ELTS"></a><a id="rpc_c_profile_all_elts"></a><dl>
     * <dt><b>RPC_C_PROFILE_ALL_ELTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returns every element from the profile. The <i>IfId</i>, <i>VersOption</i>, and <i>MemberName</i> parameters are ignored.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RPC_C_PROFILE_MATCH_BY_IF"></a><a id="rpc_c_profile_match_by_if"></a><dl>
     * <dt><b>RPC_C_PROFILE_MATCH_BY_IF</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Searches the profile for elements that contain the interface identification specified by <i>IfId</i> and <i>VersOption</i>. The <i>MemberName</i> parameter is ignored.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RPC_C_PROFILE_MATCH_BY_MBR"></a><a id="rpc_c_profile_match_by_mbr"></a><dl>
     * <dt><b>RPC_C_PROFILE_MATCH_BY_MBR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Searches the profile for elements that contain <i>MemberName</i>. The <i>IfId</i> and <i>VersOption</i> parameters are ignored.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RPC_C_PROFILE_MATCH_BY_BOTH"></a><a id="rpc_c_profile_match_by_both"></a><dl>
     * <dt><b>RPC_C_PROFILE_MATCH_BY_BOTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Searches the profile for elements that contain the interface identification and member identified by the <i>IfId</i>, <i>VersOption</i>, and <i>MemberName</i> parameters.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<RPC_IF_ID>} IfId Pointer to the interface identification of the profile elements to be returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcnsi/nf-rpcnsi-rpcnsprofileeltinqnexta">RpcNsProfileEltInqNext</a> function. 
     * 
     * 
     * 
     * 
     * The <i>IfId</i> parameter is used only when specifying a value of RPC_C_PROFILE_MATCH_BY_IF or RPC_C_PROFILE_MATCH_BY_BOTH for the <i>InquiryType</i> parameter. Otherwise, <i>IfId</i> is ignored and a null value can be specified.
     * @param {Integer} VersOption Specifies how the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcnsi/nf-rpcnsi-rpcnsprofileeltinqnexta">RpcNsProfileEltInqNext</a> function uses the <i>IfId</i> parameter. This parameter is used only when specifying a value of RPC_C_PROFILE_MATCH_BY_IF or RPC_C_PROFILE_MATCH_BY_BOTH for <i>InquiryType</i>. Otherwise, this parameter is ignored and a 0 value can be specified. 
     * 
     * 
     * 
     * 
     * The following table describes valid values for <i>VersOption</i>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RPC_C_VERS_ALL"></a><a id="rpc_c_vers_all"></a><dl>
     * <dt><b>RPC_C_VERS_ALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returns profile elements that offer the specified interface UUID, regardless of the version numbers. For this value, specify 0 for both the major and minor versions in <i>IfId</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RPC_C_VERS_COMPATIBLE"></a><a id="rpc_c_vers_compatible"></a><dl>
     * <dt><b>RPC_C_VERS_COMPATIBLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returns profile elements that offer the same major version of the specified interface UUID and a minor version greater than or equal to the minor version of the specified interface UUID.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RPC_C_VERS_EXACT"></a><a id="rpc_c_vers_exact"></a><dl>
     * <dt><b>RPC_C_VERS_EXACT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returns profile elements that offer the specified version of the specified interface UUID.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RPC_C_VERS_MAJOR_ONLY"></a><a id="rpc_c_vers_major_only"></a><dl>
     * <dt><b>RPC_C_VERS_MAJOR_ONLY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returns profile elements that offer the same major version of the specified interface UUID (ignores the minor version). For this value, specify 0 for the minor version in <i>IfId</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RPC_C_VERS_UPTO"></a><a id="rpc_c_vers_upto"></a><dl>
     * <dt><b>RPC_C_VERS_UPTO</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returns profile elements that offer a version of the specified interface UUID less than or equal to the specified major and minor version. (For example, if the <i>IfId</i> contained V2.0 and the profile contained elements with V1.3, V2.0, and V2.1, the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcnsi/nf-rpcnsi-rpcnsprofileeltinqnexta">RpcNsProfileEltInqNext</a> function returns elements with V1.3 and V2.0.)
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} MemberNameSyntax Syntax of <i>MemberName</i>, and the return parameter <i>MemberName</i> in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcnsi/nf-rpcnsi-rpcnsprofileeltinqnexta">RpcNsProfileEltInqNext</a> function. 
     * 
     * 
     * 
     * 
     * To use the syntax specified in the registry value entry <b>HKEY_LOCAL_MACHINE\Software\Microsoft\Rpc\NameService\DefaultSyntax</b>, provide a value of RPC_C_NS_SYNTAX_DEFAULT.
     * @param {PWSTR} MemberName Pointer to the member name that the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcnsi/nf-rpcnsi-rpcnsprofileeltinqnexta">RpcNsProfileEltInqNext</a> function looks for in profile elements. The <i>MemberName</i> parameter is used only when specifying a value of RPC_C_PROFILE_MATCH_BY_MBR or RPC_C_PROFILE_MATCH_BY_BOTH for <i>InquiryType</i>. Otherwise, <i>MemberName</i> is ignored and a null value can be specified.
     * @param {Pointer<Void>} InquiryContext Returns a pointer to a name-service handle for use with the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcnsi/nf-rpcnsi-rpcnsprofileeltinqnexta">RpcNsProfileEltInqNext</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcnsi/nf-rpcnsi-rpcnsprofileeltinqdone">RpcNsProfileEltInqDone</a> functions.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_VERS_OPTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The version option is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_NAME_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name syntax is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_UNSUPPORTED_NAME_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name syntax is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INCOMPLETE_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name is incomplete.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_ENTRY_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name-service entry was not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NAME_SERVICE_UNAVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name service is unavailable.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcnsi/nf-rpcnsi-rpcnsprofileeltinqbeginw
     * @since windows5.0
     */
    static RpcNsProfileEltInqBeginW(ProfileNameSyntax, ProfileName, InquiryType, IfId, VersOption, MemberNameSyntax, MemberName, InquiryContext) {
        ProfileName := ProfileName is String ? StrPtr(ProfileName) : ProfileName
        MemberName := MemberName is String ? StrPtr(MemberName) : MemberName

        result := DllCall("RPCNS4.dll\RpcNsProfileEltInqBeginW", "uint", ProfileNameSyntax, "ptr", ProfileName, "uint", InquiryType, "ptr", IfId, "uint", VersOption, "uint", MemberNameSyntax, "ptr", MemberName, "ptr", InquiryContext, "int")
        return result
    }

    /**
     * The RpcNsProfileEltInqNext function returns one element at a time from a profile.
     * @param {Pointer<Void>} InquiryContext Name-service handle returned from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcnsi/nf-rpcnsi-rpcnsprofileeltinqbegina">RpcNsProfileEltInqBegin</a> function.
     * @param {Pointer<RPC_IF_ID>} IfId Returns a pointer to the interface identification of the profile element.
     * @param {Pointer<PWSTR>} MemberName Returns a pointer to a pointer to the profile element's member name.The syntax of the returned name was specified by the <i>MemberNameSyntax</i> parameter in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcnsi/nf-rpcnsi-rpcnsprofileeltinqbegina">RpcNsProfileEltInqBegin</a> function. 
     * 
     * 
     * 
     * 
     * Specify a null value to prevent 
     * <b>RpcNsProfileEltInqNext</b> from returning the <i>MemberName</i> parameter. In this case, the application does not call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcstringfree">RpcStringFree</a> function.
     * @param {Pointer<UInt32>} Priority Returns a pointer to the profile-element priority.
     * @param {Pointer<PWSTR>} Annotation Returns a pointer to a pointer to the annotation string for the profile element. If there is no annotation string in the profile element, the string \0 is returned. 
     * 
     * 
     * 
     * 
     * Specify a null value to prevent 
     * <b>RpcNsProfileEltInqNext</b> from returning the <i>Annotation</i> parameter. In this case, the application does not need to call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcstringfree">RpcStringFree</a> function.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INCOMPLETE_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name is incomplete.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NAME_SERVICE_UNAVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name service is unavailable.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NO_MORE_ELEMENTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No more elements.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcnsi/nf-rpcnsi-rpcnsprofileeltinqnextw
     * @since windows5.0
     */
    static RpcNsProfileEltInqNextW(InquiryContext, IfId, MemberName, Priority, Annotation) {
        result := DllCall("RPCNS4.dll\RpcNsProfileEltInqNextW", "ptr", InquiryContext, "ptr", IfId, "ptr", MemberName, "uint*", Priority, "ptr", Annotation, "int")
        return result
    }

    /**
     * The RpcNsProfileEltInqDone function deletes the inquiry context for viewing the elements in a profile.
     * @param {Pointer<Void>} InquiryContext Pointer to a name-service handle to free. The name-service handle that <i>InquiryContext</i> points to is created by calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcnsi/nf-rpcnsi-rpcnsprofileeltinqbegina">RpcNsProfileEltInqBegin</a> function. 
     * 
     * 
     * 
     * 
     * An argument value of NULL is returned.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcnsi/nf-rpcnsi-rpcnsprofileeltinqdone
     * @since windows5.0
     */
    static RpcNsProfileEltInqDone(InquiryContext) {
        result := DllCall("RPCNS4.dll\RpcNsProfileEltInqDone", "ptr", InquiryContext, "int")
        return result
    }

    /**
     * The RpcNsEntryObjectInqBegin function creates an inquiry context for the objects of a name-service database entry.
     * @param {Integer} EntryNameSyntax Syntax to use in <i>EntryName</i>. 
     * 
     * 
     * 
     * 
     * To use the syntax specified in the registry value entry <b>HKEY_LOCAL_MACHINE\Software\Microsoft\Rpc\NameService\DefaultSyntax</b>, provide a value of RPC_C_NS_SYNTAX_DEFAULT.
     * @param {PSTR} EntryName Pointer to the name-service database entry name for which object UUIDs are to be viewed.
     * @param {Pointer<Void>} InquiryContext Returns a pointer to a name-service handle for use with the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcnsi/nf-rpcnsi-rpcnsentryobjectinqnext">RpcNsEntryObjectInqNext</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcnsi/nf-rpcnsi-rpcnsentryobjectinqdone">RpcNsEntryObjectInqDone</a> functions.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_NAME_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name syntax is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_UNSUPPORTED_NAME_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name syntax is unsupported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INCOMPLETE_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name is incomplete.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_ENTRY_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name-service entry was not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NAME_SERVICE_UNAVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name service is unavailable.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcnsi/nf-rpcnsi-rpcnsentryobjectinqbegina
     * @since windows5.0
     */
    static RpcNsEntryObjectInqBeginA(EntryNameSyntax, EntryName, InquiryContext) {
        EntryName := EntryName is String ? StrPtr(EntryName) : EntryName

        result := DllCall("RPCNS4.dll\RpcNsEntryObjectInqBeginA", "uint", EntryNameSyntax, "ptr", EntryName, "ptr", InquiryContext, "int")
        return result
    }

    /**
     * The RpcNsEntryObjectInqBegin function creates an inquiry context for the objects of a name-service database entry.
     * @param {Integer} EntryNameSyntax Syntax to use in <i>EntryName</i>. 
     * 
     * 
     * 
     * 
     * To use the syntax specified in the registry value entry <b>HKEY_LOCAL_MACHINE\Software\Microsoft\Rpc\NameService\DefaultSyntax</b>, provide a value of RPC_C_NS_SYNTAX_DEFAULT.
     * @param {PWSTR} EntryName Pointer to the name-service database entry name for which object UUIDs are to be viewed.
     * @param {Pointer<Void>} InquiryContext Returns a pointer to a name-service handle for use with the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcnsi/nf-rpcnsi-rpcnsentryobjectinqnext">RpcNsEntryObjectInqNext</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcnsi/nf-rpcnsi-rpcnsentryobjectinqdone">RpcNsEntryObjectInqDone</a> functions.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_NAME_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name syntax is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_UNSUPPORTED_NAME_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name syntax is unsupported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INCOMPLETE_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name is incomplete.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_ENTRY_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name-service entry was not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NAME_SERVICE_UNAVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name service is unavailable.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcnsi/nf-rpcnsi-rpcnsentryobjectinqbeginw
     * @since windows5.0
     */
    static RpcNsEntryObjectInqBeginW(EntryNameSyntax, EntryName, InquiryContext) {
        EntryName := EntryName is String ? StrPtr(EntryName) : EntryName

        result := DllCall("RPCNS4.dll\RpcNsEntryObjectInqBeginW", "uint", EntryNameSyntax, "ptr", EntryName, "ptr", InquiryContext, "int")
        return result
    }

    /**
     * The RpcNsEntryObjectInqNext function returns one object at a time from a name-service database entry.
     * @param {Pointer<Void>} InquiryContext Name-service handle that indicates the object UUIDs for a name-service database entry.
     * @param {Pointer<Guid>} ObjUuid Returns a pointer to an exported object UUID.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NO_MORE_MEMBERS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No more members.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INCOMPLETE_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name is incomplete.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_ENTRY_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name-service entry was not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NAME_SERVICE_UNAVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name service is unavailable.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcnsi/nf-rpcnsi-rpcnsentryobjectinqnext
     * @since windows5.0
     */
    static RpcNsEntryObjectInqNext(InquiryContext, ObjUuid) {
        result := DllCall("RPCNS4.dll\RpcNsEntryObjectInqNext", "ptr", InquiryContext, "ptr", ObjUuid, "int")
        return result
    }

    /**
     * The RpcNsEntryObjectInqDone function deletes the inquiry context for a name-service database entry's objects.
     * @param {Pointer<Void>} InquiryContext Pointer to a name-service handle specifying the object UUIDs exported to the <i>EntryName</i> parameter specified in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcnsi/nf-rpcnsi-rpcnsentryobjectinqbegina">RpcNsEntryObjectInqBegin</a> function. 
     * 
     * 
     * 
     * 
     * An argument value of <b>NULL</b> is returned.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcnsi/nf-rpcnsi-rpcnsentryobjectinqdone
     * @since windows5.0
     */
    static RpcNsEntryObjectInqDone(InquiryContext) {
        result := DllCall("RPCNS4.dll\RpcNsEntryObjectInqDone", "ptr", InquiryContext, "int")
        return result
    }

    /**
     * The RpcNsEntryExpandName function expands a name-service entry name. This function is supported by Active Directory.
     * @param {Integer} EntryNameSyntax Syntax of <i>EntryName</i>. 
     * 
     * 
     * 
     * 
     * To use the syntax specified in the registry value entry <b>HKEY_LOCAL_MACHINE\Software\Microsoft\Rpc\NameService\DefaultSyntax</b>, provide a value of <b>RPC_C_NS_SYNTAX_DEFAULT</b>.
     * @param {PSTR} EntryName Pointer to the entry name to expand.
     * @param {Pointer<PSTR>} ExpandedName Returns a pointer to a pointer to the expanded version of <i>EntryName</i>.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INCOMPLETE_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name is incomplete.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcnsi/nf-rpcnsi-rpcnsentryexpandnamea
     * @since windows5.0
     */
    static RpcNsEntryExpandNameA(EntryNameSyntax, EntryName, ExpandedName) {
        EntryName := EntryName is String ? StrPtr(EntryName) : EntryName

        result := DllCall("RPCNS4.dll\RpcNsEntryExpandNameA", "uint", EntryNameSyntax, "ptr", EntryName, "ptr", ExpandedName, "int")
        return result
    }

    /**
     * The RpcNsMgmtBindingUnexport function removes multiple binding handles and objects from an entry in the name-service database.
     * @param {Integer} EntryNameSyntax Syntax of <i>EntryName</i>. 
     * 
     * 
     * 
     * 
     * To use the syntax specified in the registry value entry <b>HKEY_LOCAL_MACHINE\Software\Microsoft\Rpc\NameService\DefaultSyntax</b>, provide a value of RPC_C_NS_SYNTAX_DEFAULT.
     * @param {PSTR} EntryName Pointer to the name of the entry from which to remove binding handles and object UUIDs.
     * @param {Pointer<RPC_IF_ID>} IfId Pointer to an interface identification. A null parameter value indicates that binding handles are not to be unexported—only object UUIDs are to be unexported.
     * @param {Integer} VersOption Specifies how the 
     * <b>RpcNsMgmtBindingUnexport</b> function uses the <b>VersMajor</b> and <b>VersMinor</b> members of the structure pointed to by the <i>IfId</i> parameter. 
     * 
     * 
     * 
     * 
     * The following table describes valid values for the <i>VersOption</i> parameter.
     * 
     * <table>
     * <tr>
     * <th>VersOption values</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RPC_C_VERS_ALL"></a><a id="rpc_c_vers_all"></a><dl>
     * <dt><b>RPC_C_VERS_ALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unexports all bindings for the interface UUID in <i>IfId</i>, regardless of the version numbers. For this value, specify 0 for both the major and minor versions in <i>IfId</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RPC_C_VERS_IF_ID"></a><a id="rpc_c_vers_if_id"></a><dl>
     * <dt><b>RPC_C_VERS_IF_ID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unexports the bindings for the compatible interface UUID in <i>IfId</i> with the same major version and with a minor version greater than or equal to the minor version in <i>IfId</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RPC_C_VERS_EXACT"></a><a id="rpc_c_vers_exact"></a><dl>
     * <dt><b>RPC_C_VERS_EXACT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unexports the bindings for the interface UUID in <i>IfId</i> with the same major and minor versions as in <i>IfId</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RPC_C_VERS_MAJOR_ONLY"></a><a id="rpc_c_vers_major_only"></a><dl>
     * <dt><b>RPC_C_VERS_MAJOR_ONLY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unexports the bindings for the interface UUID in <i>IfId</i> with the same major version as in <i>IfId</i> (ignores the minor version). For this value, specify 0 for the minor version in <i>IfId</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RPC_C_VERS_UPTO"></a><a id="rpc_c_vers_upto"></a><dl>
     * <dt><b>RPC_C_VERS_UPTO</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unexports the bindings that offer a version of the specified interface UUID less than or equal to the specified major and minor version. (For example, if the <i>IfId</i> contained V2.0 and the name service–database entry contained binding handles with the versions 1.3, 2.0, and 2.1, the 
     * <b>RpcNsMgmtBindingUnexport</b> function would unexport the binding handles with versions 1.3 and 2.0.)
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<UUID_VECTOR>} ObjectUuidVec Pointer to a vector of object UUIDs that the server no longer wants to offer. The application constructs this vector. A null value indicates there are no object UUIDs to unexport—only binding handles are to be unexported.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_VERS_OPTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The version option is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_NAME_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name syntax is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_UNSUPPORTED_NAME_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name syntax is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INCOMPLETE_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name is incomplete.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_ENTRY_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name-service entry was not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NAME_SERVICE_UNAVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name service is unavailable.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INTERFACE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The interface was not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NOT_ALL_OBJS_UNEXPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not all objects unexported.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcnsi/nf-rpcnsi-rpcnsmgmtbindingunexporta
     * @since windows5.0
     */
    static RpcNsMgmtBindingUnexportA(EntryNameSyntax, EntryName, IfId, VersOption, ObjectUuidVec) {
        EntryName := EntryName is String ? StrPtr(EntryName) : EntryName

        result := DllCall("RPCNS4.dll\RpcNsMgmtBindingUnexportA", "uint", EntryNameSyntax, "ptr", EntryName, "ptr", IfId, "uint", VersOption, "ptr", ObjectUuidVec, "int")
        return result
    }

    /**
     * The RpcNsMgmtEntryCreate function creates a name service�database entry.
     * @param {Integer} EntryNameSyntax Syntax of <i>EntryName</i>. 
     * 
     * 
     * 
     * 
     * To use the syntax specified in the registry value entry <b>HKEY_LOCAL_MACHINE\Software\Microsoft\Rpc\NameService\DefaultSyntax</b>, provide a value of RPC_C_NS_SYNTAX_DEFAULT.
     * @param {PSTR} EntryName Pointer to the name of the entry to create.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_NAME_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name syntax is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_UNSUPPORTED_NAME_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name syntax is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INCOMPLETE_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name is incomplete.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_ENTRY_ALREADY_EXISTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name-service entry already exists.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NAME_SERVICE_UNAVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name service is unavailable.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcnsi/nf-rpcnsi-rpcnsmgmtentrycreatea
     * @since windows5.0
     */
    static RpcNsMgmtEntryCreateA(EntryNameSyntax, EntryName) {
        EntryName := EntryName is String ? StrPtr(EntryName) : EntryName

        result := DllCall("RPCNS4.dll\RpcNsMgmtEntryCreateA", "uint", EntryNameSyntax, "ptr", EntryName, "int")
        return result
    }

    /**
     * The RpcNsMgmtEntryDelete function deletes a name service�database entry.
     * @param {Integer} EntryNameSyntax Syntax of <i>EntryName</i>. 
     * 
     * 
     * 
     * 
     * To use the syntax specified in the registry value entry <b>HKEY_LOCAL_MACHINE\Software\Microsoft\Rpc\NameService\DefaultSyntax</b>, provide a value of RPC_C_NS_SYNTAX_DEFAULT.
     * @param {PSTR} EntryName Pointer to the name of the entry to delete.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_NAME_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name syntax is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_UNSUPPORTED_NAME_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name syntax is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INCOMPLETE_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name is incomplete.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_ENTRY_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name-service entry was not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NAME_SERVICE_UNAVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name service is unavailable.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NOT_RPC_ENTRY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not an RPC entry.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcnsi/nf-rpcnsi-rpcnsmgmtentrydeletea
     * @since windows5.0
     */
    static RpcNsMgmtEntryDeleteA(EntryNameSyntax, EntryName) {
        EntryName := EntryName is String ? StrPtr(EntryName) : EntryName

        result := DllCall("RPCNS4.dll\RpcNsMgmtEntryDeleteA", "uint", EntryNameSyntax, "ptr", EntryName, "int")
        return result
    }

    /**
     * The RpcNsMgmtEntryInqIfIds function returns the list of interfaces exported to a name service�database entry.
     * @param {Integer} EntryNameSyntax Syntax of <i>EntryName</i>. 
     * 
     * 
     * 
     * 
     * To use the syntax specified in the registry value entry <b>HKEY_LOCAL_MACHINE\Software\Microsoft\Rpc\NameService\DefaultSyntax</b>, provide a value of RPC_C_NS_SYNTAX_DEFAULT.
     * @param {PSTR} EntryName Pointer to the name service–database entry name for which an interface-identification vector is returned.
     * @param {Pointer<RPC_IF_ID_VECTOR>} IfIdVec Returns an address of a pointer to the interface-identification vector.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_NAME_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name syntax is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_UNSUPPORTED_NAME_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name syntax is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INCOMPLETE_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name is incomplete.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_ENTRY_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name-service entry was not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NAME_SERVICE_UNAVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name service is unavailable.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcnsi/nf-rpcnsi-rpcnsmgmtentryinqifidsa
     * @since windows5.0
     */
    static RpcNsMgmtEntryInqIfIdsA(EntryNameSyntax, EntryName, IfIdVec) {
        EntryName := EntryName is String ? StrPtr(EntryName) : EntryName

        result := DllCall("RPCNS4.dll\RpcNsMgmtEntryInqIfIdsA", "uint", EntryNameSyntax, "ptr", EntryName, "ptr", IfIdVec, "int")
        return result
    }

    /**
     * The RpcNsMgmtHandleSetExpAge function sets the expiration age of a name-service handle for local copies of name-service data.
     * @param {Pointer<Void>} NsHandle Name-service handle for which an expiration age is set. A name-service handle is returned from a name service begin operation.
     * @param {Integer} ExpirationAge Integer value, in seconds, that sets the expiration age of local name-service data read by all next routines using the specified <i>NsHandle</i> parameter. 
     * 
     * 
     * 
     * 
     * An expiration age of 0 causes an immediate update of the local name-service data.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NAME_SERVICE_UNAVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name service is unavailable.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcnsi/nf-rpcnsi-rpcnsmgmthandlesetexpage
     * @since windows5.0
     */
    static RpcNsMgmtHandleSetExpAge(NsHandle, ExpirationAge) {
        result := DllCall("RPCNS4.dll\RpcNsMgmtHandleSetExpAge", "ptr", NsHandle, "uint", ExpirationAge, "int")
        return result
    }

    /**
     * The RpcNsMgmtInqExpAge function returns the global expiration age for local copies of name-service data.
     * @param {Pointer<UInt32>} ExpirationAge Pointer to the default expiration age, in seconds. This value is used by all name service next operations.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcnsi/nf-rpcnsi-rpcnsmgmtinqexpage
     * @since windows5.0
     */
    static RpcNsMgmtInqExpAge(ExpirationAge) {
        result := DllCall("RPCNS4.dll\RpcNsMgmtInqExpAge", "uint*", ExpirationAge, "int")
        return result
    }

    /**
     * The RpcNsMgmtSetExpAge function modifies the application's global expiration age for local copies of name-service data.
     * @param {Integer} ExpirationAge Pointer to the default expiration age, in seconds. This value is used by all name service–next operations. An expiration age of 0 causes an immediate update of the local name-service data. 
     * 
     * 
     * 
     * 
     * To reset the expiration age to an RPC-assigned default value of two hours, specify a value of RPC_C_NS_DEFAULT_EXP_AGE.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NAME_SERVICE_UNAVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name service is unavailable.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcnsi/nf-rpcnsi-rpcnsmgmtsetexpage
     * @since windows5.0
     */
    static RpcNsMgmtSetExpAge(ExpirationAge) {
        result := DllCall("RPCNS4.dll\RpcNsMgmtSetExpAge", "uint", ExpirationAge, "int")
        return result
    }

    /**
     * The RpcNsEntryExpandName function expands a name-service entry name. This function is supported by Active Directory.
     * @param {Integer} EntryNameSyntax Syntax of <i>EntryName</i>. 
     * 
     * 
     * 
     * 
     * To use the syntax specified in the registry value entry <b>HKEY_LOCAL_MACHINE\Software\Microsoft\Rpc\NameService\DefaultSyntax</b>, provide a value of <b>RPC_C_NS_SYNTAX_DEFAULT</b>.
     * @param {PWSTR} EntryName Pointer to the entry name to expand.
     * @param {Pointer<PWSTR>} ExpandedName Returns a pointer to a pointer to the expanded version of <i>EntryName</i>.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INCOMPLETE_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name is incomplete.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcnsi/nf-rpcnsi-rpcnsentryexpandnamew
     * @since windows5.0
     */
    static RpcNsEntryExpandNameW(EntryNameSyntax, EntryName, ExpandedName) {
        EntryName := EntryName is String ? StrPtr(EntryName) : EntryName

        result := DllCall("RPCNS4.dll\RpcNsEntryExpandNameW", "uint", EntryNameSyntax, "ptr", EntryName, "ptr", ExpandedName, "int")
        return result
    }

    /**
     * The RpcNsMgmtBindingUnexport function removes multiple binding handles and objects from an entry in the name-service database.
     * @param {Integer} EntryNameSyntax Syntax of <i>EntryName</i>. 
     * 
     * 
     * 
     * 
     * To use the syntax specified in the registry value entry <b>HKEY_LOCAL_MACHINE\Software\Microsoft\Rpc\NameService\DefaultSyntax</b>, provide a value of RPC_C_NS_SYNTAX_DEFAULT.
     * @param {PWSTR} EntryName Pointer to the name of the entry from which to remove binding handles and object UUIDs.
     * @param {Pointer<RPC_IF_ID>} IfId Pointer to an interface identification. A null parameter value indicates that binding handles are not to be unexported—only object UUIDs are to be unexported.
     * @param {Integer} VersOption Specifies how the 
     * <b>RpcNsMgmtBindingUnexport</b> function uses the <b>VersMajor</b> and <b>VersMinor</b> members of the structure pointed to by the <i>IfId</i> parameter. 
     * 
     * 
     * 
     * 
     * The following table describes valid values for the <i>VersOption</i> parameter.
     * 
     * <table>
     * <tr>
     * <th>VersOption values</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RPC_C_VERS_ALL"></a><a id="rpc_c_vers_all"></a><dl>
     * <dt><b>RPC_C_VERS_ALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unexports all bindings for the interface UUID in <i>IfId</i>, regardless of the version numbers. For this value, specify 0 for both the major and minor versions in <i>IfId</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RPC_C_VERS_IF_ID"></a><a id="rpc_c_vers_if_id"></a><dl>
     * <dt><b>RPC_C_VERS_IF_ID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unexports the bindings for the compatible interface UUID in <i>IfId</i> with the same major version and with a minor version greater than or equal to the minor version in <i>IfId</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RPC_C_VERS_EXACT"></a><a id="rpc_c_vers_exact"></a><dl>
     * <dt><b>RPC_C_VERS_EXACT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unexports the bindings for the interface UUID in <i>IfId</i> with the same major and minor versions as in <i>IfId</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RPC_C_VERS_MAJOR_ONLY"></a><a id="rpc_c_vers_major_only"></a><dl>
     * <dt><b>RPC_C_VERS_MAJOR_ONLY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unexports the bindings for the interface UUID in <i>IfId</i> with the same major version as in <i>IfId</i> (ignores the minor version). For this value, specify 0 for the minor version in <i>IfId</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RPC_C_VERS_UPTO"></a><a id="rpc_c_vers_upto"></a><dl>
     * <dt><b>RPC_C_VERS_UPTO</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unexports the bindings that offer a version of the specified interface UUID less than or equal to the specified major and minor version. (For example, if the <i>IfId</i> contained V2.0 and the name service–database entry contained binding handles with the versions 1.3, 2.0, and 2.1, the 
     * <b>RpcNsMgmtBindingUnexport</b> function would unexport the binding handles with versions 1.3 and 2.0.)
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<UUID_VECTOR>} ObjectUuidVec Pointer to a vector of object UUIDs that the server no longer wants to offer. The application constructs this vector. A null value indicates there are no object UUIDs to unexport—only binding handles are to be unexported.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_VERS_OPTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The version option is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_NAME_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name syntax is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_UNSUPPORTED_NAME_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name syntax is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INCOMPLETE_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name is incomplete.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_ENTRY_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name-service entry was not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NAME_SERVICE_UNAVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name service is unavailable.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INTERFACE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The interface was not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NOT_ALL_OBJS_UNEXPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not all objects unexported.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcnsi/nf-rpcnsi-rpcnsmgmtbindingunexportw
     * @since windows5.0
     */
    static RpcNsMgmtBindingUnexportW(EntryNameSyntax, EntryName, IfId, VersOption, ObjectUuidVec) {
        EntryName := EntryName is String ? StrPtr(EntryName) : EntryName

        result := DllCall("RPCNS4.dll\RpcNsMgmtBindingUnexportW", "uint", EntryNameSyntax, "ptr", EntryName, "ptr", IfId, "uint", VersOption, "ptr", ObjectUuidVec, "int")
        return result
    }

    /**
     * The RpcNsMgmtEntryCreate function creates a name service�database entry.
     * @param {Integer} EntryNameSyntax Syntax of <i>EntryName</i>. 
     * 
     * 
     * 
     * 
     * To use the syntax specified in the registry value entry <b>HKEY_LOCAL_MACHINE\Software\Microsoft\Rpc\NameService\DefaultSyntax</b>, provide a value of RPC_C_NS_SYNTAX_DEFAULT.
     * @param {PWSTR} EntryName Pointer to the name of the entry to create.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_NAME_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name syntax is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_UNSUPPORTED_NAME_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name syntax is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INCOMPLETE_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name is incomplete.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_ENTRY_ALREADY_EXISTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name-service entry already exists.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NAME_SERVICE_UNAVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name service is unavailable.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcnsi/nf-rpcnsi-rpcnsmgmtentrycreatew
     * @since windows5.0
     */
    static RpcNsMgmtEntryCreateW(EntryNameSyntax, EntryName) {
        EntryName := EntryName is String ? StrPtr(EntryName) : EntryName

        result := DllCall("RPCNS4.dll\RpcNsMgmtEntryCreateW", "uint", EntryNameSyntax, "ptr", EntryName, "int")
        return result
    }

    /**
     * The RpcNsMgmtEntryDelete function deletes a name service�database entry.
     * @param {Integer} EntryNameSyntax Syntax of <i>EntryName</i>. 
     * 
     * 
     * 
     * 
     * To use the syntax specified in the registry value entry <b>HKEY_LOCAL_MACHINE\Software\Microsoft\Rpc\NameService\DefaultSyntax</b>, provide a value of RPC_C_NS_SYNTAX_DEFAULT.
     * @param {PWSTR} EntryName Pointer to the name of the entry to delete.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_NAME_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name syntax is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_UNSUPPORTED_NAME_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name syntax is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INCOMPLETE_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name is incomplete.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_ENTRY_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name-service entry was not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NAME_SERVICE_UNAVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name service is unavailable.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NOT_RPC_ENTRY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not an RPC entry.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcnsi/nf-rpcnsi-rpcnsmgmtentrydeletew
     * @since windows5.0
     */
    static RpcNsMgmtEntryDeleteW(EntryNameSyntax, EntryName) {
        EntryName := EntryName is String ? StrPtr(EntryName) : EntryName

        result := DllCall("RPCNS4.dll\RpcNsMgmtEntryDeleteW", "uint", EntryNameSyntax, "ptr", EntryName, "int")
        return result
    }

    /**
     * The RpcNsMgmtEntryInqIfIds function returns the list of interfaces exported to a name service�database entry.
     * @param {Integer} EntryNameSyntax Syntax of <i>EntryName</i>. 
     * 
     * 
     * 
     * 
     * To use the syntax specified in the registry value entry <b>HKEY_LOCAL_MACHINE\Software\Microsoft\Rpc\NameService\DefaultSyntax</b>, provide a value of RPC_C_NS_SYNTAX_DEFAULT.
     * @param {PWSTR} EntryName Pointer to the name service–database entry name for which an interface-identification vector is returned.
     * @param {Pointer<RPC_IF_ID_VECTOR>} IfIdVec Returns an address of a pointer to the interface-identification vector.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_NAME_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name syntax is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_UNSUPPORTED_NAME_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name syntax is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INCOMPLETE_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name is incomplete.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_ENTRY_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name-service entry was not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NAME_SERVICE_UNAVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name service is unavailable.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcnsi/nf-rpcnsi-rpcnsmgmtentryinqifidsw
     * @since windows5.0
     */
    static RpcNsMgmtEntryInqIfIdsW(EntryNameSyntax, EntryName, IfIdVec) {
        EntryName := EntryName is String ? StrPtr(EntryName) : EntryName

        result := DllCall("RPCNS4.dll\RpcNsMgmtEntryInqIfIdsW", "uint", EntryNameSyntax, "ptr", EntryName, "ptr", IfIdVec, "int")
        return result
    }

    /**
     * The RpcNsBindingImportBegin function creates an import context for importing client-compatible binding handles for servers that offer the specified interface and object.
     * @param {Integer} EntryNameSyntax Syntax of <i>EntryName</i>. 
     * 
     * 
     * 
     * 
     * To use the syntax specified in the registry value entry <b>HKEY_LOCAL_MACHINE\Software\Microsoft\Rpc\NameService\DefaultSyntax</b>, specify RPC_C_NS_SYNTAX_DEFAULT.
     * @param {PSTR} EntryName Pointer to an entry name at which the search for compatible binding handles begins. 
     * 
     * 
     * 
     * 
     * To use the entry name specified in the registry value entry <b>HKEY_LOCAL_MACHINE\Software\Microsoft\Rpc\NameService\DefaultEntry</b>, provide a null pointer or an empty string. In this case, the <i>EntryNameSyntax</i> parameter is ignored and the run-time library uses the default syntax.
     * @param {Pointer<Void>} IfSpec Stub-generated data structure indicating the interface to import. If the interface specification has not been exported or is of no concern to the caller, specify a null value for this parameter. In this case, the bindings returned are only guaranteed to be of a compatible and supported protocol sequence and to contain the specified object UUID. The contacted server might not support the desired interface.
     * @param {Pointer<Guid>} ObjUuid Pointer to an optional object UUID. 
     * 
     * 
     * 
     * 
     * For a nonzero UUID, compatible binding handles are returned from an entry only if the server has exported the specified object UUID.
     * 
     * When <i>ObjUuid</i> has a null pointer value or a nil UUID, the returned binding handles contain one of the object UUIDs exported by the compatible server. If the server did not export any object UUIDs, the returned compatible binding handles contain a nil object UUID.
     * @param {Pointer<Void>} ImportContext Name-service handle returned for use with the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcnsi/nf-rpcnsi-rpcnsbindingimportnext">RpcNsBindingImportNext</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcnsi/nf-rpcnsi-rpcnsbindingimportdone">RpcNsBindingImportDone</a> functions.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_NAME_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name syntax is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NAME_SERVICE_UNAVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name exceeds the maximum length.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_UNSUPPORTED_NAME_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name syntax is unsupported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INCOMPLETE_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name is incomplete.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_ENTRY_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name-service entry was not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NAME_SERVICE_UNAVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name service is unavailable.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_OBJECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid object.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcnsi/nf-rpcnsi-rpcnsbindingimportbegina
     * @since windows5.0
     */
    static RpcNsBindingImportBeginA(EntryNameSyntax, EntryName, IfSpec, ObjUuid, ImportContext) {
        EntryName := EntryName is String ? StrPtr(EntryName) : EntryName

        result := DllCall("RPCNS4.dll\RpcNsBindingImportBeginA", "uint", EntryNameSyntax, "ptr", EntryName, "ptr", IfSpec, "ptr", ObjUuid, "ptr", ImportContext, "int")
        return result
    }

    /**
     * The RpcNsBindingImportBegin function creates an import context for importing client-compatible binding handles for servers that offer the specified interface and object.
     * @param {Integer} EntryNameSyntax Syntax of <i>EntryName</i>. 
     * 
     * 
     * 
     * 
     * To use the syntax specified in the registry value entry <b>HKEY_LOCAL_MACHINE\Software\Microsoft\Rpc\NameService\DefaultSyntax</b>, specify RPC_C_NS_SYNTAX_DEFAULT.
     * @param {PWSTR} EntryName Pointer to an entry name at which the search for compatible binding handles begins. 
     * 
     * 
     * 
     * 
     * To use the entry name specified in the registry value entry <b>HKEY_LOCAL_MACHINE\Software\Microsoft\Rpc\NameService\DefaultEntry</b>, provide a null pointer or an empty string. In this case, the <i>EntryNameSyntax</i> parameter is ignored and the run-time library uses the default syntax.
     * @param {Pointer<Void>} IfSpec Stub-generated data structure indicating the interface to import. If the interface specification has not been exported or is of no concern to the caller, specify a null value for this parameter. In this case, the bindings returned are only guaranteed to be of a compatible and supported protocol sequence and to contain the specified object UUID. The contacted server might not support the desired interface.
     * @param {Pointer<Guid>} ObjUuid Pointer to an optional object UUID. 
     * 
     * 
     * 
     * 
     * For a nonzero UUID, compatible binding handles are returned from an entry only if the server has exported the specified object UUID.
     * 
     * When <i>ObjUuid</i> has a null pointer value or a nil UUID, the returned binding handles contain one of the object UUIDs exported by the compatible server. If the server did not export any object UUIDs, the returned compatible binding handles contain a nil object UUID.
     * @param {Pointer<Void>} ImportContext Name-service handle returned for use with the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcnsi/nf-rpcnsi-rpcnsbindingimportnext">RpcNsBindingImportNext</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcnsi/nf-rpcnsi-rpcnsbindingimportdone">RpcNsBindingImportDone</a> functions.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_NAME_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name syntax is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NAME_SERVICE_UNAVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name exceeds the maximum length.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_UNSUPPORTED_NAME_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name syntax is unsupported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INCOMPLETE_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name is incomplete.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_ENTRY_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name-service entry was not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NAME_SERVICE_UNAVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name service is unavailable.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_OBJECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid object.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcnsi/nf-rpcnsi-rpcnsbindingimportbeginw
     * @since windows5.0
     */
    static RpcNsBindingImportBeginW(EntryNameSyntax, EntryName, IfSpec, ObjUuid, ImportContext) {
        EntryName := EntryName is String ? StrPtr(EntryName) : EntryName

        result := DllCall("RPCNS4.dll\RpcNsBindingImportBeginW", "uint", EntryNameSyntax, "ptr", EntryName, "ptr", IfSpec, "ptr", ObjUuid, "ptr", ImportContext, "int")
        return result
    }

    /**
     * The RpcNsBindingImportNext function looks up an interface (and optionally an object from a name-service database) and returns a binding handle of a compatible server, if found.
     * @param {Pointer<Void>} ImportContext Name-service handle returned from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcnsi/nf-rpcnsi-rpcnsbindingimportbegina">RpcNsBindingImportBegin</a> function.
     * @param {Pointer<Void>} Binding Returns a pointer to a client-compatible server binding handle for a server.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NO_MORE_BINDINGS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No more bindings.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NAME_SERVICE_UNAVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name service is unavailable.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcnsi/nf-rpcnsi-rpcnsbindingimportnext
     * @since windows5.0
     */
    static RpcNsBindingImportNext(ImportContext, Binding) {
        result := DllCall("RPCNS4.dll\RpcNsBindingImportNext", "ptr", ImportContext, "ptr", Binding, "int")
        return result
    }

    /**
     * The RpcNsBindingImportDone function signals that a client has finished looking for a compatible server and deletes the import context.
     * @param {Pointer<Void>} ImportContext Pointer to a name-service handle to free. The name-service handle <i>ImportContext</i> points to is created by calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcnsi/nf-rpcnsi-rpcnsbindingimportbegina">RpcNsBindingImportBegin</a> function. 
     * 
     * 
     * 
     * 
     * An argument value of <b>NULL</b> is returned.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcnsi/nf-rpcnsi-rpcnsbindingimportdone
     * @since windows5.0
     */
    static RpcNsBindingImportDone(ImportContext) {
        result := DllCall("RPCNS4.dll\RpcNsBindingImportDone", "ptr", ImportContext, "int")
        return result
    }

    /**
     * The RpcNsBindingSelect function returns a binding handle from a list of compatible binding handles.
     * @param {Pointer<RPC_BINDING_VECTOR>} BindingVec Pointer to the vector of client-compatible server binding handles from which a binding handle is selected. The returned binding vector no longer references the selected binding handle, which is returned separately in the <i>Binding</i> parameter.
     * @param {Pointer<Void>} Binding Pointer to a selected binding handle.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NO_MORE_BINDINGS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No more bindings.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcnsi/nf-rpcnsi-rpcnsbindingselect
     * @since windows5.0
     */
    static RpcNsBindingSelect(BindingVec, Binding) {
        result := DllCall("RPCNS4.dll\RpcNsBindingSelect", "ptr", BindingVec, "ptr", Binding, "int")
        return result
    }

    /**
     * The RpcAsyncRegisterInfo function is obsolete.
     * @param {Pointer<RPC_ASYNC_STATE>} pAsync TBD
     * @returns {Integer} This function does not return a value.
     * @see https://docs.microsoft.com/windows/win32/api//rpcasync/nf-rpcasync-rpcasyncregisterinfo
     * @since windows5.0
     */
    static RpcAsyncRegisterInfo(pAsync) {
        result := DllCall("RPCRT4.dll\RpcAsyncRegisterInfo", "ptr", pAsync, "int")
        return result
    }

    /**
     * The client calls the RpcAsyncInitializeHandle function to initialize the RPC_ASYNC_STATE structure to be used to make an asynchronous call.
     * @param {Pointer} pAsync Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcasync/ns-rpcasync-rpc_async_state">RPC_ASYNC_STATE</a> structure that contains asynchronous call information.
     * @param {Integer} Size Size of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcasync/ns-rpcasync-rpc_async_state">RPC_ASYNC_STATE</a> structure.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_ARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The size is either too small or too large.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_ASYNC_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>pAsync</i> points to invalid memory.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcasync/nf-rpcasync-rpcasyncinitializehandle
     * @since windows5.0
     */
    static RpcAsyncInitializeHandle(pAsync, Size) {
        result := DllCall("RPCRT4.dll\RpcAsyncInitializeHandle", "ptr", pAsync, "uint", Size, "int")
        return result
    }

    /**
     * The client calls the RpcAsyncGetCallStatus function to determine the current status of an asynchronous remote call.
     * @param {Pointer<RPC_ASYNC_STATE>} pAsync Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcasync/ns-rpcasync-rpc_async_state">RPC_ASYNC_STATE</a> structure that contains asynchronous call information.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call was completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_ASYNC_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The asynchronous call handle is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_ASYNC_CALL_PENDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call has not yet completed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other error codes</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call failed. The client application must call 
     * <a href="/windows/desktop/api/rpcasync/nf-rpcasync-rpcasynccompletecall">RpcAsyncCompleteCall</a> to receive the application-specific error code.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcasync/nf-rpcasync-rpcasyncgetcallstatus
     * @since windows5.0
     */
    static RpcAsyncGetCallStatus(pAsync) {
        result := DllCall("RPCRT4.dll\RpcAsyncGetCallStatus", "ptr", pAsync, "int")
        return result
    }

    /**
     * The client and the server call the RpcAsyncCompleteCall function to complete an asynchronous remote procedure call.
     * @param {Pointer<RPC_ASYNC_STATE>} pAsync Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcasync/ns-rpcasync-rpc_async_state">RPC_ASYNC_STATE</a> structure that contains asynchronous call information.
     * @param {Pointer<Void>} Reply Pointer to a buffer containing the return value of the remote procedure call.
     * @returns {Integer} In addition to the following values, 
     * <b>RpcAsyncCompleteCall</b> can also return any general RPC or application-specific error. 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call was completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_ASYNC_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The asynchronous call handle is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_ASYNC_CALL_PENDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call has not yet completed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_CALL_CANCELLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call was canceled.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcasync/nf-rpcasync-rpcasynccompletecall
     * @since windows5.0
     */
    static RpcAsyncCompleteCall(pAsync, Reply) {
        result := DllCall("RPCRT4.dll\RpcAsyncCompleteCall", "ptr", pAsync, "ptr", Reply, "int")
        return result
    }

    /**
     * The server calls RpcAsyncAbortCall to abort an asynchronous call.
     * @param {Pointer<RPC_ASYNC_STATE>} pAsync Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcasync/ns-rpcasync-rpc_async_state">RPC_ASYNC_STATE</a> structure that contains asynchronous call information.
     * @param {Integer} ExceptionCode A nonzero application-specific exception code. Can be an application-defined error code, or a standard RPC error code. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Call cancelation successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_ASYNC_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Asynchronous handle is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcasync/nf-rpcasync-rpcasyncabortcall
     * @since windows5.0
     */
    static RpcAsyncAbortCall(pAsync, ExceptionCode) {
        result := DllCall("RPCRT4.dll\RpcAsyncAbortCall", "ptr", pAsync, "uint", ExceptionCode, "int")
        return result
    }

    /**
     * The client calls the RpcAsyncCancelCall function to cancel an asynchronous call.
     * @param {Pointer<RPC_ASYNC_STATE>} pAsync Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcasync/ns-rpcasync-rpc_async_state">RPC_ASYNC_STATE</a> structure that contains asynchronous call information.
     * @param {BOOL} fAbort If <b>TRUE</b>, the call is canceled immediately. If <b>FALSE</b>, wait for the server to complete the call.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The cancellation request was processed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_ASYNC_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The asynchronous handle is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcasync/nf-rpcasync-rpcasynccancelcall
     * @since windows5.0
     */
    static RpcAsyncCancelCall(pAsync, fAbort) {
        result := DllCall("RPCRT4.dll\RpcAsyncCancelCall", "ptr", pAsync, "int", fAbort, "int")
        return result
    }

    /**
     * The RpcErrorStartEnumeration function begins enumeration of extended error information.
     * @param {Pointer<RPC_ERROR_ENUM_HANDLE>} EnumHandle Pointer to the enumeration handle, in the form of an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcasync/ns-rpcasync-rpc_error_enum_handle">RPC_ERROR_ENUM_HANDLE</a> structure. The structure must be allocated by the caller, and cannot be freed until the operation is complete. All members are ignored on input.
     * @returns {Integer} Successful completion returns RPC_S_OK.
     * 
     * Returns RPC_S_ENTRY_NOT_FOUND if no extended error information is on the thread. If an enumeration is in progress, starting a second enumeration starts from the beginning.
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcasync/nf-rpcasync-rpcerrorstartenumeration
     * @since windows5.1.2600
     */
    static RpcErrorStartEnumeration(EnumHandle) {
        result := DllCall("RPCRT4.dll\RpcErrorStartEnumeration", "ptr", EnumHandle, "int")
        return result
    }

    /**
     * The RpcErrorGetNextRecord function retrieves the next extended error information record for an enumeration handle.
     * @param {Pointer<RPC_ERROR_ENUM_HANDLE>} EnumHandle Pointer to the enumeration handle, in the form of an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcasync/ns-rpcasync-rpc_error_enum_handle">RPC_ERROR_ENUM_HANDLE</a> structure. The structure must be allocated by the caller, and cannot be freed until the operation is complete. All members are ignored on input.
     * @param {BOOL} CopyStrings Specifies whether the string fields in <i>ErrorInfo</i> are copied to the default system heap, at which point ownership of those buffers is transferred to the caller. 
     * 
     * 
     * 
     * 
     * TRUE indicates the strings are to be copied to the system heap.
     * 
     * FALSE indicates the strings in <i>ErrorInfo</i> point to internal RPC data structures; the caller cannot free or write to them, and they become invalid once the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcasync/nf-rpcasync-rpcerrorendenumeration">RpcErrorEndEnumeration</a> function is called.
     * @param {Pointer<RPC_EXTENDED_ERROR_INFO>} ErrorInfo Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcasync/ns-rpcasync-rpc_extended_error_info">RPC_EXTENDED_ERROR_INFO</a> structure. See Remarks.
     * @returns {Integer} If <i>CopyStrings</i> is false the function call cannot fail unless its parameters are invalid. When the last extended error record is retrieved, 
     * <b>RpcErrorGetNextRecord</b> returns RPC_S_OK. Any subsequent calls return RPC_S_ENTRY_NOT_FOUND.
     * 
     * Upon any error, the enumeration position is not advanced.
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcasync/nf-rpcasync-rpcerrorgetnextrecord
     * @since windows5.1.2600
     */
    static RpcErrorGetNextRecord(EnumHandle, CopyStrings, ErrorInfo) {
        result := DllCall("RPCRT4.dll\RpcErrorGetNextRecord", "ptr", EnumHandle, "int", CopyStrings, "ptr", ErrorInfo, "int")
        return result
    }

    /**
     * The RpcErrorEndEnumeration function ends enumeration of extended error information and frees all resources allocated by RPC for the enumeration.
     * @param {Pointer<RPC_ERROR_ENUM_HANDLE>} EnumHandle Pointer to the enumeration handle.
     * @returns {Integer} Successful completion returns RPC_S_OK. The 
     * <b>RpcErrorEndEnumeration</b> function call cannot fail unless its parameters are invalid.
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcasync/nf-rpcasync-rpcerrorendenumeration
     * @since windows5.1.2600
     */
    static RpcErrorEndEnumeration(EnumHandle) {
        result := DllCall("RPCRT4.dll\RpcErrorEndEnumeration", "ptr", EnumHandle, "int")
        return result
    }

    /**
     * The RpcErrorResetEnumeration function resets an enumeration cursor for any in-process enumeration, resetting the process such that a subsequent call to the RpcErrorGetNextRecord retrieves the first extended error information record.
     * @param {Pointer<RPC_ERROR_ENUM_HANDLE>} EnumHandle Pointer to the enumeration handle.
     * @returns {Integer} Successful completion returns RPC_S_OK. The 
     * <b>RpcErrorResetEnumeration</b> function call cannot fail unless its parameters are invalid.
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcasync/nf-rpcasync-rpcerrorresetenumeration
     * @since windows5.1.2600
     */
    static RpcErrorResetEnumeration(EnumHandle) {
        result := DllCall("RPCRT4.dll\RpcErrorResetEnumeration", "ptr", EnumHandle, "int")
        return result
    }

    /**
     * The RpcErrorGetNumberOfRecords function returns the number of records in the extended error information.
     * @param {Pointer<RPC_ERROR_ENUM_HANDLE>} EnumHandle Pointer to the enumeration handle.
     * @param {Pointer<Int32>} Records Number of records for the extended error information.
     * @returns {Integer} Successful completion returns RPC_S_OK. The <b>RpcErrorGetNumberOfRecords</b> function call cannot fail unless its parameters are invalid.
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcasync/nf-rpcasync-rpcerrorgetnumberofrecords
     * @since windows5.1.2600
     */
    static RpcErrorGetNumberOfRecords(EnumHandle, Records) {
        result := DllCall("RPCRT4.dll\RpcErrorGetNumberOfRecords", "ptr", EnumHandle, "int*", Records, "int")
        return result
    }

    /**
     * The RpcErrorSaveErrorInfo function returns all error information for an enumeration handle as a BLOB.
     * @param {Pointer<RPC_ERROR_ENUM_HANDLE>} EnumHandle Pointer to the enumeration handle.
     * @param {Pointer<Void>} ErrorBlob Pointer to the BLOB containing the error information.
     * @param {Pointer<UIntPtr>} BlobSize Size of <i>ErrorBlob</i>, in bytes.
     * @returns {Integer} Successful completion returns RPC_S_OK. The 
     * <b>RpcErrorSaveErrorInfo</b> function call may fail if not enough memory is available.
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcasync/nf-rpcasync-rpcerrorsaveerrorinfo
     * @since windows5.1.2600
     */
    static RpcErrorSaveErrorInfo(EnumHandle, ErrorBlob, BlobSize) {
        result := DllCall("RPCRT4.dll\RpcErrorSaveErrorInfo", "ptr", EnumHandle, "ptr", ErrorBlob, "ptr*", BlobSize, "int")
        return result
    }

    /**
     * The RpcErrorLoadErrorInfo function converts a BLOB obtained by a call to RpcErrorSaveErrorInfo into extended error information.
     * @param {Pointer} ErrorBlob Pointer to the BLOB containing the error information.
     * @param {Pointer} BlobSize Size of <i>ErrorBlob</i>, in bytes.
     * @param {Pointer<RPC_ERROR_ENUM_HANDLE>} EnumHandle Pointer to the enumeration handle associated with the extended error information.
     * @returns {Integer} Successful completion returns RPC_S_OK. The <b>RpcErrorLoadInfo</b> function call can fail if not enough memory is available.
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcasync/nf-rpcasync-rpcerrorloaderrorinfo
     * @since windows5.1.2600
     */
    static RpcErrorLoadErrorInfo(ErrorBlob, BlobSize, EnumHandle) {
        result := DllCall("RPCRT4.dll\RpcErrorLoadErrorInfo", "ptr", ErrorBlob, "ptr", BlobSize, "ptr", EnumHandle, "int")
        return result
    }

    /**
     * The RpcErrorAddRecord function adds extended error information to a chain of extended error information records.
     * @param {Pointer<RPC_EXTENDED_ERROR_INFO>} ErrorInfo Error information to be added, in the form of an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcasync/ns-rpcasync-rpc_extended_error_info">RPC_EXTENDED_ERROR_INFO</a> structure.
     * @returns {Integer} Successful completion returns RPC_S_OK.
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcasync/nf-rpcasync-rpcerroraddrecord
     * @since windows5.1.2600
     */
    static RpcErrorAddRecord(ErrorInfo) {
        result := DllCall("RPCRT4.dll\RpcErrorAddRecord", "ptr", ErrorInfo, "int")
        return result
    }

    /**
     * The RpcErrorClearInformation function clears all extended error information on the current thread.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//rpcasync/nf-rpcasync-rpcerrorclearinformation
     * @since windows5.1.2600
     */
    static RpcErrorClearInformation() {
        DllCall("RPCRT4.dll\RpcErrorClearInformation")
    }

    /**
     * The RpcGetAuthorizationContextForClient function returns the Authz context for an RPC client that can be used with Authz functions for high-performance authentication. Supported for ncalrpc and ncacn_* protocol sequences only.
     * @param {Pointer<Void>} ClientBinding Binding handle on the server that represents a binding to a client. The server impersonates the client indicated by this handle. If a value of zero is specified, the server impersonates the client that is being served by this server thread.
     * @param {BOOL} ImpersonateOnReturn Directs the function to impersonate the client on return, and then return an <b>AUTHZ_CLIENT_CONTEXT_HANDLE</b> structure. Set this parameter to nonzero to impersonate the client. See Remarks.
     * @param {Pointer<Void>} Reserved1 Reserved. Must be null.
     * @param {Pointer<Int64>} pExpirationTime Pointer to the expiration date and time of the token. If no value is passed, the token never expires. Expiration time is not currently enforced.
     * @param {LUID} Reserved2 Reserved. Must be a <b>LUID</b> structure with each member set to zero.
     * @param {Integer} Reserved3 Reserved. Must be zero.
     * @param {Pointer<Void>} Reserved4 Reserved. Must be null.
     * @param {Pointer<Void>} pAuthzClientContext Pointer to an <b>AUTHZ_CLIENT_CONTEXT_HANDLE</b> structure that can be passed directly to Authz functions. If the function fails, the content of this parameter is undefined.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A reserved parameter is different than its prescribed value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_NO_CONTEXT_AVAILABLE </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The RPC client has not been authenticated successfully.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * Failure returns an RPC_S_* error code, or a Windows error code. Extended error information is available through standard RPC or Windows error code retrieval mechanisms. For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//rpcasync/nf-rpcasync-rpcgetauthorizationcontextforclient
     * @since windows5.1.2600
     */
    static RpcGetAuthorizationContextForClient(ClientBinding, ImpersonateOnReturn, Reserved1, pExpirationTime, Reserved2, Reserved3, Reserved4, pAuthzClientContext) {
        result := DllCall("RPCRT4.dll\RpcGetAuthorizationContextForClient", "ptr", ClientBinding, "int", ImpersonateOnReturn, "ptr", Reserved1, "int64*", pExpirationTime, "ptr", Reserved2, "uint", Reserved3, "ptr", Reserved4, "ptr", pAuthzClientContext, "int")
        return result
    }

    /**
     * The RpcFreeAuthorizationContext function frees an Authz context obtained by a previous call to the RpcGetAuthorizationContextForClient function.
     * @param {Pointer<Void>} pAuthzClientContext Pointer to the previously obtained Authz client context to be freed.
     * @returns {Integer} Successful completion returns RPC_S_OK. This function does not fail unless an invalid parameter is provided.
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcasync/nf-rpcasync-rpcfreeauthorizationcontext
     * @since windows5.1.2600
     */
    static RpcFreeAuthorizationContext(pAuthzClientContext) {
        result := DllCall("RPCRT4.dll\RpcFreeAuthorizationContext", "ptr", pAuthzClientContext, "int")
        return result
    }

    /**
     * The RpcSsContextLockExclusive function enables an application to begin using a context handle in exclusive mode.
     * @param {Pointer<Void>} ServerBindingHandle Binding handle on the server that represents a binding to a client. The server impersonates the client indicated by this handle. If a value of zero is specified, the server impersonates the client that is being served by this server thread.
     * @param {Pointer<Void>} UserContext Pointer passed to the manager or server routine by RPC. See Remarks. 
     * 
     * 
     * 
     * 
     * For out-only context handles, the 
     * <b>RpcSsContextLockExclusive</b> function performs no operation.
     * @returns {Integer} Returns RPC_S_OK upon successful execution, indicating the thread now has access to the context handle in exclusive mode. Returns ERROR_MORE_WRITES when multiple threads attempt an exclusive lock on the context handle. See Remarks.
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcasync/nf-rpcasync-rpcsscontextlockexclusive
     * @since windows5.1.2600
     */
    static RpcSsContextLockExclusive(ServerBindingHandle, UserContext) {
        result := DllCall("RPCRT4.dll\RpcSsContextLockExclusive", "ptr", ServerBindingHandle, "ptr", UserContext, "int")
        return result
    }

    /**
     * The RpcSsContextLockShared function enables an application to begin using a context handle in shared mode.
     * @param {Pointer<Void>} ServerBindingHandle Binding handle on the server that represents a binding to a client. The server impersonates the client indicated by this handle. If a value of zero is specified, the server impersonates the client that is being served by this server thread.
     * @param {Pointer<Void>} UserContext Pointer passed to the manager or server routine by RPC. See Remarks for more information. 
     * 
     * 
     * 
     * 
     * For [out] only context handles, the 
     * <b>RpcSsContextLockShared</b> function performs no operation.
     * @returns {Integer} Returns RPC_S_OK upon successful execution, indicating the thread now has access to the context handle in shared mode.
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcasync/nf-rpcasync-rpcsscontextlockshared
     * @since windows5.1.2600
     */
    static RpcSsContextLockShared(ServerBindingHandle, UserContext) {
        result := DllCall("RPCRT4.dll\RpcSsContextLockShared", "ptr", ServerBindingHandle, "ptr", UserContext, "int")
        return result
    }

    /**
     * The RpcServerInqCallAttributes function is an RPC server call that obtains client security context attributes.
     * @param {Pointer<Void>} ClientBinding Optional. For explicit binding within a server routine, <i>ClientBinding</i> is the binding handle with which the manager routine was called. See Remarks.
     * @param {Pointer<Void>} RpcCallAttributes <a href="https://docs.microsoft.com/windows/desktop/api/rpcasync/ns-rpcasync-rpc_call_attributes_v2_a">RPC_CALL_ATTRIBUTES_V2</a> structure that receives call attributes.
     * @returns {Integer} Returns RPC_S_OK upon success, and <i>RpcCallAttributes</i> is filled. If ERROR_MORE_DATA is returned, one or more fields in <i>RpcCallAttributes</i> was of insufficient length and could not be filled. See Remarks in 
     * <a href="/windows/desktop/api/rpcasync/ns-rpcasync-rpc_call_attributes_v2_a">RPC_CALL_ATTRIBUTES_V2</a> for details on handling ERROR_MORE_DATA.
     * 
     * Upon failure, the contents of <i>RpcCallAttributes</i> is undefined and may be partially modified by RPC.
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcasync/nf-rpcasync-rpcserverinqcallattributesw
     * @since windows5.1.2600
     */
    static RpcServerInqCallAttributesW(ClientBinding, RpcCallAttributes) {
        result := DllCall("RPCRT4.dll\RpcServerInqCallAttributesW", "ptr", ClientBinding, "ptr", RpcCallAttributes, "int")
        return result
    }

    /**
     * The RpcServerInqCallAttributes function is an RPC server call that obtains client security context attributes.
     * @param {Pointer<Void>} ClientBinding Optional. For explicit binding within a server routine, <i>ClientBinding</i> is the binding handle with which the manager routine was called. See Remarks.
     * @param {Pointer<Void>} RpcCallAttributes <a href="https://docs.microsoft.com/windows/desktop/api/rpcasync/ns-rpcasync-rpc_call_attributes_v2_a">RPC_CALL_ATTRIBUTES_V2</a> structure that receives call attributes.
     * @returns {Integer} Returns RPC_S_OK upon success, and <i>RpcCallAttributes</i> is filled. If ERROR_MORE_DATA is returned, one or more fields in <i>RpcCallAttributes</i> was of insufficient length and could not be filled. See Remarks in 
     * <a href="/windows/desktop/api/rpcasync/ns-rpcasync-rpc_call_attributes_v2_a">RPC_CALL_ATTRIBUTES_V2</a> for details on handling ERROR_MORE_DATA.
     * 
     * Upon failure, the contents of <i>RpcCallAttributes</i> is undefined and may be partially modified by RPC.
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcasync/nf-rpcasync-rpcserverinqcallattributesa
     * @since windows5.1.2600
     */
    static RpcServerInqCallAttributesA(ClientBinding, RpcCallAttributes) {
        result := DllCall("RPCRT4.dll\RpcServerInqCallAttributesA", "ptr", ClientBinding, "ptr", RpcCallAttributes, "int")
        return result
    }

    /**
     * Subscribes the server for RPC notifications.
     * @param {Pointer<Void>} Binding <a href="https://docs.microsoft.com/windows/desktop/Rpc/rpc-binding-handle">RPC_BINDING_HANDLE</a> structure that contains the binding handle for the current call. If this function is called on the same thread that RPC has dispatched a call on, this parameter can be set to <b>NULL</b>; otherwise, an explicit binding handle must be passed in this parameter.
     * @param {Integer} Notification Bitwise combination of the <a href="https://docs.microsoft.com/windows/desktop/api/rpcasync/ne-rpcasync-rpc_notifications">RPC_NOTIFICATIONS</a> enumeration values that specifies the type of notification requested from RPC by the server.
     * 
     * <b>Windows Vista:  </b>Currently, only <b>RpcNotificationClientDisconnect</b> and <b>RpcNotificationCallCancel</b> are supported. If any other value is specified for this parameter, the RPC_S_CANNOT_SUPPORT error code is returned.
     * @param {Integer} NotificationType <a href="https://docs.microsoft.com/windows/desktop/api/rpcasync/ne-rpcasync-rpc_notification_types">RPC_NOTIFICATION_TYPES</a> enumeration value that specifies the method by which RPC will notify the server.
     * 
     * <b>Windows Vista:  </b><b>RpcNotificationTypeNone</b> is not supported. If this value is specified, the RPC_S_INVALID_ARG error code is returned.
     * @param {Pointer<RPC_ASYNC_NOTIFICATION_INFO>} NotificationInfo Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/rpcasync/ns-rpcasync-rpc_async_notification_info">RPC_ASYNC_NOTIFICATION_INFO</a> union that contains the specific information necessary for RPC to contact the server for notification. The data contained in this union is specific to the method passed to the <i>NotificationType</i> parameter. 
     * 
     * If the <b>RpcNotificationTypeCallback</b> method is specified in <i>NotificationTypes</i>, the <b>NotificationRoutine</b> member of the corresponding branch of the union is set to the binding handle for synchronous calls and the async handle for asynchronous calls.
     * 
     * RPC makes a copy of this parameter during a successful call to this function. The caller can free or update this parameter when the API returns.
     * @returns {Integer} This function returns RPC_S_OK on success; otherwise, an RPC_S_* error code is returned. 
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcasync/nf-rpcasync-rpcserversubscribefornotification
     * @since windows6.0.6000
     */
    static RpcServerSubscribeForNotification(Binding, Notification, NotificationType, NotificationInfo) {
        result := DllCall("RPCRT4.dll\RpcServerSubscribeForNotification", "ptr", Binding, "int", Notification, "int", NotificationType, "ptr", NotificationInfo, "int")
        return result
    }

    /**
     * Unsubscribes the server from RPC notifications.
     * @param {Pointer<Void>} Binding <a href="https://docs.microsoft.com/windows/desktop/Rpc/rpc-binding-handle">RPC_BINDING_HANDLE</a> structure that contains the binding handle for the current RPC call specified in a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/rpcasync/nf-rpcasync-rpcserversubscribefornotification">RpcServerSubscribeForNotification</a>. If this function is called on the same thread that RPC has dispatched a call on, this parameter can be set to <b>NULL</b>; otherwise, an explicit binding handle must be passed in this parameter.
     * @param {Integer} Notification A value from the <a href="https://docs.microsoft.com/windows/desktop/api/rpcasync/ne-rpcasync-rpc_notifications">RPC_NOTIFICATIONS</a> enumeration that specifies the type of notification requested from RPC by the server.  Notifications must be unsubscribed individually, multiple values are not supported.
     * 
     * <b>Windows Vista:  </b>Currently, only <b>RpcNotificationClientDisconnect</b> and <b>RpcNotificationCallCancel</b> are supported. If any other value is specified for this parameter, the RPC_S_CANNOT_SUPPORT error code is returned.
     * @param {Pointer<UInt32>} NotificationsQueued A required pointer to a value that receives the number of notifications that the RPC runtime queued for the specified RPC call. The pointer must be supplied; it is not optional.
     * 
     * Your code should keep track of the number of notifications that it receives. When you unsubscribe from RPC notifications, you should check if the number of notifications that the RPC runtime queued matches the number of notifications that you received. If the numbers do not match, some notifications could still be incoming on another thread.  You should delay cleaning up the notification state until you receive all incoming notifications.
     * @returns {Integer} This function returns RPC_S_OK on success; otherwise, an RPC_S_* error code is returned.
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcasync/nf-rpcasync-rpcserverunsubscribefornotification
     * @since windows6.0.6000
     */
    static RpcServerUnsubscribeForNotification(Binding, Notification, NotificationsQueued) {
        result := DllCall("RPCRT4.dll\RpcServerUnsubscribeForNotification", "ptr", Binding, "int", Notification, "uint*", NotificationsQueued, "int")
        return result
    }

    /**
     * The RpcBindingBind function contacts an RPC server and binds to it.
     * @param {Pointer<RPC_ASYNC_STATE>} pAsync Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcasync/ns-rpcasync-rpc_async_state">RPC_ASYNC_STATE</a> structure that contains asynchronous call information. This state information contains the completion method used to signal when the bind operation is complete.
     * @param {Pointer<Void>} Binding <a href="https://docs.microsoft.com/windows/desktop/Rpc/rpc-binding-handle">RPC_BINDING_HANDLE</a> structure that contains the binding handle created with a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcbindingcreatea">RpcBindingCreate</a>.
     * @param {Pointer<Void>} IfSpec <a href="https://docs.microsoft.com/windows/desktop/Rpc/rpc-if-handle">RPC_IF_HANDLE</a> value that specifies the interface on which calls for this binding handle will be made.
     * @returns {Integer} This function returns RPC_S_OK on success; otherwise, an RPC_S_* error code is returned. For information on these error codes, see <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The RPC is successfully bound to the server and remote calls can be made.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_CANNOT_SUPPORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An obsolete feature of RPC was requested for this binding operation.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcasync/nf-rpcasync-rpcbindingbind
     * @since windows6.0.6000
     */
    static RpcBindingBind(pAsync, Binding, IfSpec) {
        result := DllCall("RPCRT4.dll\RpcBindingBind", "ptr", pAsync, "ptr", Binding, "ptr", IfSpec, "int")
        return result
    }

    /**
     * Unbinds a binding handle previously bound by RpcBindingBind.
     * @param {Pointer<Void>} Binding <a href="https://docs.microsoft.com/windows/desktop/Rpc/rpc-binding-handle">RPC_BINDING_HANDLE</a> structure that contains the binding handle to unbind from the RPC server.
     * @returns {Integer} This function returns RPC_S_OK on success; otherwise, an RPC_S_* error code is returned.
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcasync/nf-rpcasync-rpcbindingunbind
     * @since windows6.0.6000
     */
    static RpcBindingUnbind(Binding) {
        result := DllCall("RPCRT4.dll\RpcBindingUnbind", "ptr", Binding, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<RPC_MESSAGE>} Message 
     * @param {Pointer<RPC_ASYNC_STATE>} pAsync 
     * @returns {Integer} 
     */
    static I_RpcAsyncSetHandle(Message, pAsync) {
        result := DllCall("RPCRT4.dll\I_RpcAsyncSetHandle", "ptr", Message, "ptr", pAsync, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<RPC_ASYNC_STATE>} pAsync 
     * @param {Integer} ExceptionCode 
     * @returns {Integer} 
     */
    static I_RpcAsyncAbortCall(pAsync, ExceptionCode) {
        result := DllCall("RPCRT4.dll\I_RpcAsyncAbortCall", "ptr", pAsync, "uint", ExceptionCode, "int")
        return result
    }

    /**
     * Determines whether an exception is fatal or non-fatal
     * @param {Integer} ExceptionCode Value of an exception. Any of the following exception values will return EXCEPTION_CONTINUE_SEARCH:
     * 
     * - STATUS_ACCESS_VIOLATION
     * - STATUS_POSSIBLE_DEADLOCK
     * - STATUS_INSTRUCTION_MISALIGNMENT
     * - STATUS_DATATYPE_MISALIGNMENT
     * - STATUS_PRIVILEGED_INSTRUCTION
     * - STATUS_ILLEGAL_INSTRUCTION
     * - STATUS_BREAKPOINT
     * - STATUS_STACK_OVERFLOW
     * - STATUS_HANDLE_NOT_CLOSABLE
     * - STATUS_IN_PAGE_ERROR
     * - STATUS_ASSERTION_FAILURE
     * - STATUS_STACK_BUFFER_OVERRUN
     * - STATUS_GUARD_PAGE_VIOLATION
     * - STATUS_REG_NAT_CONSUMPTION
     * @returns {Integer} A value that specifies whether the exception was fatal or non-fatal.
     * 
     * | Return code | Description
     * |-------------|------------|
     * | EXCEPTION_CONTINUE_SEARCH | The exception is fatal and must be handled. |
     * | EXCEPTION_EXECUTE_HANDLER | The exception is not fatal. |
     * @see https://docs.microsoft.com/windows/win32/api//rpcasync/nf-rpcasync-i_rpcexceptionfilter
     */
    static I_RpcExceptionFilter(ExceptionCode) {
        result := DllCall("RPCRT4.dll\I_RpcExceptionFilter", "uint", ExceptionCode, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Binding 
     * @param {Pointer<LUID>} TokenId 
     * @param {Pointer<LUID>} AuthenticationId 
     * @param {Pointer<LUID>} ModifiedId 
     * @returns {Integer} 
     */
    static I_RpcBindingInqClientTokenAttributes(Binding, TokenId, AuthenticationId, ModifiedId) {
        result := DllCall("RPCRT4.dll\I_RpcBindingInqClientTokenAttributes", "ptr", Binding, "ptr", TokenId, "ptr", AuthenticationId, "ptr", ModifiedId, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<RPC_MESSAGE>} Message 
     * @returns {Integer} 
     */
    static I_RpcNsGetBuffer(Message) {
        result := DllCall("RPCNS4.dll\I_RpcNsGetBuffer", "ptr", Message, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<RPC_MESSAGE>} Message 
     * @param {Pointer<Void>} Handle 
     * @returns {Integer} 
     */
    static I_RpcNsSendReceive(Message, Handle) {
        result := DllCall("RPCNS4.dll\I_RpcNsSendReceive", "ptr", Message, "ptr", Handle, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<RPC_MESSAGE>} Message 
     * @param {Integer} Status 
     * @returns {String} Nothing - always returns an empty string
     */
    static I_RpcNsRaiseException(Message, Status) {
        DllCall("RPCNS4.dll\I_RpcNsRaiseException", "ptr", Message, "int", Status)
    }

    /**
     * 
     * @param {Pointer<RPC_MESSAGE>} Message 
     * @returns {Integer} 
     */
    static I_RpcReBindBuffer(Message) {
        result := DllCall("RPCNS4.dll\I_RpcReBindBuffer", "ptr", Message, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} CContext 
     * @returns {Pointer<Void>} 
     */
    static NDRCContextBinding(CContext) {
        result := DllCall("RPCRT4.dll\NDRCContextBinding", "ptr", CContext, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer} CContext 
     * @param {Pointer<Void>} pBuff 
     * @returns {String} Nothing - always returns an empty string
     */
    static NDRCContextMarshall(CContext, pBuff) {
        DllCall("RPCRT4.dll\NDRCContextMarshall", "ptr", CContext, "ptr", pBuff)
    }

    /**
     * 
     * @param {Pointer<IntPtr>} pCContext 
     * @param {Pointer<Void>} hBinding 
     * @param {Pointer<Void>} pBuff 
     * @param {Integer} DataRepresentation 
     * @returns {String} Nothing - always returns an empty string
     */
    static NDRCContextUnmarshall(pCContext, hBinding, pBuff, DataRepresentation) {
        DllCall("RPCRT4.dll\NDRCContextUnmarshall", "ptr*", pCContext, "ptr", hBinding, "ptr", pBuff, "uint", DataRepresentation)
    }

    /**
     * 
     * @param {Pointer<NDR_SCONTEXT>} CContext 
     * @param {Pointer<Void>} pBuff 
     * @param {Pointer<NDR_RUNDOWN>} userRunDownIn 
     * @returns {String} Nothing - always returns an empty string
     */
    static NDRSContextMarshall(CContext, pBuff, userRunDownIn) {
        DllCall("RPCRT4.dll\NDRSContextMarshall", "ptr", CContext, "ptr", pBuff, "ptr", userRunDownIn)
    }

    /**
     * 
     * @param {Pointer<Void>} pBuff 
     * @param {Integer} DataRepresentation 
     * @returns {Pointer<NDR_SCONTEXT>} 
     */
    static NDRSContextUnmarshall(pBuff, DataRepresentation) {
        result := DllCall("RPCRT4.dll\NDRSContextUnmarshall", "ptr", pBuff, "uint", DataRepresentation, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} BindingHandle 
     * @param {Pointer<NDR_SCONTEXT>} CContext 
     * @param {Pointer<Void>} pBuff 
     * @param {Pointer<NDR_RUNDOWN>} userRunDownIn 
     * @returns {String} Nothing - always returns an empty string
     */
    static NDRSContextMarshallEx(BindingHandle, CContext, pBuff, userRunDownIn) {
        DllCall("RPCRT4.dll\NDRSContextMarshallEx", "ptr", BindingHandle, "ptr", CContext, "ptr", pBuff, "ptr", userRunDownIn)
    }

    /**
     * 
     * @param {Pointer<Void>} BindingHandle 
     * @param {Pointer<NDR_SCONTEXT>} CContext 
     * @param {Pointer<Void>} pBuff 
     * @param {Pointer<NDR_RUNDOWN>} userRunDownIn 
     * @param {Pointer<Void>} CtxGuard 
     * @param {Integer} Flags 
     * @returns {String} Nothing - always returns an empty string
     */
    static NDRSContextMarshall2(BindingHandle, CContext, pBuff, userRunDownIn, CtxGuard, Flags) {
        DllCall("RPCRT4.dll\NDRSContextMarshall2", "ptr", BindingHandle, "ptr", CContext, "ptr", pBuff, "ptr", userRunDownIn, "ptr", CtxGuard, "uint", Flags)
    }

    /**
     * 
     * @param {Pointer<Void>} BindingHandle 
     * @param {Pointer<Void>} pBuff 
     * @param {Integer} DataRepresentation 
     * @returns {Pointer<NDR_SCONTEXT>} 
     */
    static NDRSContextUnmarshallEx(BindingHandle, pBuff, DataRepresentation) {
        result := DllCall("RPCRT4.dll\NDRSContextUnmarshallEx", "ptr", BindingHandle, "ptr", pBuff, "uint", DataRepresentation, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} BindingHandle 
     * @param {Pointer<Void>} pBuff 
     * @param {Integer} DataRepresentation 
     * @param {Pointer<Void>} CtxGuard 
     * @param {Integer} Flags 
     * @returns {Pointer<NDR_SCONTEXT>} 
     */
    static NDRSContextUnmarshall2(BindingHandle, pBuff, DataRepresentation, CtxGuard, Flags) {
        result := DllCall("RPCRT4.dll\NDRSContextUnmarshall2", "ptr", BindingHandle, "ptr", pBuff, "uint", DataRepresentation, "ptr", CtxGuard, "uint", Flags, "ptr")
        return result
    }

    /**
     * The RpcSsDestroyClientContext function destroys a context handle no longer needed by the client, without contacting the server.
     * @param {Pointer<Void>} ContextHandle Context handle to be destroyed. The handle is set to <b>NULL</b> before 
     * <b>RpcSsDestroyClientContext</b> returns.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//rpcndr/nf-rpcndr-rpcssdestroyclientcontext
     * @since windows5.0
     */
    static RpcSsDestroyClientContext(ContextHandle) {
        DllCall("RPCRT4.dll\RpcSsDestroyClientContext", "ptr", ContextHandle)
    }

    /**
     * The NdrSimpleTypeMarshall function marshalls a simple type.
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/rpcndr/ns-rpcndr-midl_stub_message">MIDL_STUB_MESSAGE</a> structure that maintains the current status of the RPC stub. Structure is for internal use only; do not modify.
     * @param {Pointer<Byte>} pMemory Pointer to the simple type to be marshalled.
     * @param {Integer} FormatChar Simple type format character.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//rpcndr/nf-rpcndr-ndrsimpletypemarshall
     * @since windows5.0
     */
    static NdrSimpleTypeMarshall(pStubMsg, pMemory, FormatChar) {
        DllCall("RPCRT4.dll\NdrSimpleTypeMarshall", "ptr", pStubMsg, "char*", pMemory, "char", FormatChar)
    }

    /**
     * The NdrPointerMarshall function marshalls a top level pointer to anything. Pointers embedded in structures, arrays, or unions call NdrPointerMarshall directly.
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/rpcndr/ns-rpcndr-midl_stub_message">MIDL_STUB_MESSAGE</a> structure that maintains the current status of the RPC stub. Structure is for internal use only; do not modify.
     * @param {Pointer<Byte>} pMemory Pointer to the pointer to be marshalled.
     * @param {Pointer<Byte>} pFormat Pointer to the format string description.
     * @returns {Pointer<Byte>} Returns <b>NULL</b> upon success. If an error occurs, the function throws one of the following exception codes. 
     * 
     * <table>
     * <tr>
     * <th>Error</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>STATUS_ACCESS_VIOLATION</td>
     * <td>An access violation occurred.</td>
     * </tr>
     * <tr>
     * <td>RPC_S_INTERNAL_ERROR</td>
     * <td>An error occurred in RPC.</td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//rpcndr/nf-rpcndr-ndrpointermarshall
     * @since windows5.0
     */
    static NdrPointerMarshall(pStubMsg, pMemory, pFormat) {
        result := DllCall("RPCRT4.dll\NdrPointerMarshall", "ptr", pStubMsg, "char*", pMemory, "char*", pFormat, "char*")
        return result
    }

    /**
     * The NdrSimpleStructMarshall function marshals the simple structure into a network buffer.
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/rpcndr/ns-rpcndr-midl_stub_message">MIDL_STUB_MESSAGE</a> structure that maintains the current status of the RPC stub. The  <b>MIDL_STUB_MESSAGE</b> structure is for internal use only, and must not be modified.
     * @param {Pointer<Byte>} pMemory Pointer to the simple structure to be marshaled.
     * @param {Pointer<Byte>} pFormat Pointer to the format string description.
     * @returns {Pointer<Byte>} Returns null upon success. Raises one of the following exceptions upon failure.
     * 
     * <table>
     * <tr>
     * <th>Error</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>STATUS_ACCESS_VIOLATION</td>
     * <td>An access violation occurred.</td>
     * </tr>
     * <tr>
     * <td>RPC_S_INTERNAL_ERROR</td>
     * <td>An error occurred in RPC.</td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//rpcndr/nf-rpcndr-ndrsimplestructmarshall
     * @since windows5.0
     */
    static NdrSimpleStructMarshall(pStubMsg, pMemory, pFormat) {
        result := DllCall("RPCRT4.dll\NdrSimpleStructMarshall", "ptr", pStubMsg, "char*", pMemory, "char*", pFormat, "char*")
        return result
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer<Byte>} pMemory 
     * @param {Pointer<Byte>} pFormat 
     * @returns {Pointer<Byte>} 
     */
    static NdrConformantStructMarshall(pStubMsg, pMemory, pFormat) {
        result := DllCall("RPCRT4.dll\NdrConformantStructMarshall", "ptr", pStubMsg, "char*", pMemory, "char*", pFormat, "char*")
        return result
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer<Byte>} pMemory 
     * @param {Pointer<Byte>} pFormat 
     * @returns {Pointer<Byte>} 
     */
    static NdrConformantVaryingStructMarshall(pStubMsg, pMemory, pFormat) {
        result := DllCall("RPCRT4.dll\NdrConformantVaryingStructMarshall", "ptr", pStubMsg, "char*", pMemory, "char*", pFormat, "char*")
        return result
    }

    /**
     * The NdrComplexStructMarshall function marshals the complex structure into a network buffer.
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/rpcndr/ns-rpcndr-midl_stub_message">MIDL_STUB_MESSAGE</a> structure that maintains the current status of the RPC stub. The  <b>MIDL_STUB_MESSAGE</b> structure is for internal use only, and must not be modified.
     * @param {Pointer<Byte>} pMemory Pointer to the complex structure to be marshaled.
     * @param {Pointer<Byte>} pFormat Pointer to the format string description.
     * @returns {Pointer<Byte>} Returns null upon success. Raises one of the following exceptions upon failure.
     * 
     * <table>
     * <tr>
     * <th>Error</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>STATUS_ACCESS_VIOLATION</td>
     * <td>An access violation occurred.</td>
     * </tr>
     * <tr>
     * <td>RPC_S_INTERNAL_ERROR</td>
     * <td>An error occurred in RPC.</td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//rpcndr/nf-rpcndr-ndrcomplexstructmarshall
     * @since windows5.0
     */
    static NdrComplexStructMarshall(pStubMsg, pMemory, pFormat) {
        result := DllCall("RPCRT4.dll\NdrComplexStructMarshall", "ptr", pStubMsg, "char*", pMemory, "char*", pFormat, "char*")
        return result
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer<Byte>} pMemory 
     * @param {Pointer<Byte>} pFormat 
     * @returns {Pointer<Byte>} 
     */
    static NdrFixedArrayMarshall(pStubMsg, pMemory, pFormat) {
        result := DllCall("RPCRT4.dll\NdrFixedArrayMarshall", "ptr", pStubMsg, "char*", pMemory, "char*", pFormat, "char*")
        return result
    }

    /**
     * The NdrConformantArrayMarshall function marshals the conformant array into a network buffer.
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/rpcndr/ns-rpcndr-midl_stub_message">MIDL_STUB_MESSAGE</a> structure that maintains the current status of the RPC stub. The  <b>MIDL_STUB_MESSAGE</b> structure is for internal use only, and must not be modified.
     * @param {Pointer<Byte>} pMemory Pointer to the conformant array to be marshaled.
     * @param {Pointer<Byte>} pFormat Pointer to the format string description.
     * @returns {Pointer<Byte>} Returns null upon success. Raises one of the following exceptions upon failure.
     * 
     * <table>
     * <tr>
     * <th>Error</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>STATUS_ACCESS_VIOLATION</td>
     * <td>An access violation occurred.</td>
     * </tr>
     * <tr>
     * <td>RPC_S_INTERNAL_ERROR</td>
     * <td>An error occurred in RPC.</td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//rpcndr/nf-rpcndr-ndrconformantarraymarshall
     */
    static NdrConformantArrayMarshall(pStubMsg, pMemory, pFormat) {
        result := DllCall("RPCRT4.dll\NdrConformantArrayMarshall", "ptr", pStubMsg, "char*", pMemory, "char*", pFormat, "char*")
        return result
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer<Byte>} pMemory 
     * @param {Pointer<Byte>} pFormat 
     * @returns {Pointer<Byte>} 
     */
    static NdrConformantVaryingArrayMarshall(pStubMsg, pMemory, pFormat) {
        result := DllCall("RPCRT4.dll\NdrConformantVaryingArrayMarshall", "ptr", pStubMsg, "char*", pMemory, "char*", pFormat, "char*")
        return result
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer<Byte>} pMemory 
     * @param {Pointer<Byte>} pFormat 
     * @returns {Pointer<Byte>} 
     */
    static NdrVaryingArrayMarshall(pStubMsg, pMemory, pFormat) {
        result := DllCall("RPCRT4.dll\NdrVaryingArrayMarshall", "ptr", pStubMsg, "char*", pMemory, "char*", pFormat, "char*")
        return result
    }

    /**
     * The NdrComplexArrayMarshall function marshals the complex array into a network buffer.
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/rpcndr/ns-rpcndr-midl_stub_message">MIDL_STUB_MESSAGE</a> structure that maintains the current status of the RPC stub. The  <b>MIDL_STUB_MESSAGE</b> structure is for internal use only, and must not be modified.
     * @param {Pointer<Byte>} pMemory Pointer to the complex array to be marshaled.
     * @param {Pointer<Byte>} pFormat Pointer to the format string description.
     * @returns {Pointer<Byte>} Returns null upon success. Raises one of the following exceptions  upon failure.
     * 
     * <table>
     * <tr>
     * <th>Error</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>STATUS_ACCESS_VIOLATION</td>
     * <td>An access violation occurred.</td>
     * </tr>
     * <tr>
     * <td>RPC_S_INTERNAL_ERROR</td>
     * <td>An error occurred in RPC.</td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//rpcndr/nf-rpcndr-ndrcomplexarraymarshall
     * @since windows5.0
     */
    static NdrComplexArrayMarshall(pStubMsg, pMemory, pFormat) {
        result := DllCall("RPCRT4.dll\NdrComplexArrayMarshall", "ptr", pStubMsg, "char*", pMemory, "char*", pFormat, "char*")
        return result
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer<Byte>} pMemory 
     * @param {Pointer<Byte>} pFormat 
     * @returns {Pointer<Byte>} 
     */
    static NdrNonConformantStringMarshall(pStubMsg, pMemory, pFormat) {
        result := DllCall("RPCRT4.dll\NdrNonConformantStringMarshall", "ptr", pStubMsg, "char*", pMemory, "char*", pFormat, "char*")
        return result
    }

    /**
     * The NdrConformantStringMarshall function marshals the conformant string into a network buffer to be sent to the server.
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/rpcndr/ns-rpcndr-midl_stub_message">MIDL_STUB_MESSAGE</a> structure that maintains the current status of the RPC stub. This structure is for internal use only and should not be modified.
     * @param {Pointer<Byte>} pMemory Pointer to the null-terminated conformant string to be marshaled.
     * @param {Pointer<Byte>} pFormat Pointer to the format string description.
     * @returns {Pointer<Byte>} Returns null upon success. If an error occurs, the function throws one of the following exception codes.
     * 
     * <table>
     * <tr>
     * <th>Error</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>STATUS_ACCESS_VIOLATION</td>
     * <td>An access violation occurred.</td>
     * </tr>
     * <tr>
     * <td>RPC_S_INTERNAL_ERROR</td>
     * <td>An error occurred in RPC.</td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//rpcndr/nf-rpcndr-ndrconformantstringmarshall
     * @since windows5.0
     */
    static NdrConformantStringMarshall(pStubMsg, pMemory, pFormat) {
        result := DllCall("RPCRT4.dll\NdrConformantStringMarshall", "ptr", pStubMsg, "char*", pMemory, "char*", pFormat, "char*")
        return result
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer<Byte>} pMemory 
     * @param {Pointer<Byte>} pFormat 
     * @returns {Pointer<Byte>} 
     */
    static NdrEncapsulatedUnionMarshall(pStubMsg, pMemory, pFormat) {
        result := DllCall("RPCRT4.dll\NdrEncapsulatedUnionMarshall", "ptr", pStubMsg, "char*", pMemory, "char*", pFormat, "char*")
        return result
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer<Byte>} pMemory 
     * @param {Pointer<Byte>} pFormat 
     * @returns {Pointer<Byte>} 
     */
    static NdrNonEncapsulatedUnionMarshall(pStubMsg, pMemory, pFormat) {
        result := DllCall("RPCRT4.dll\NdrNonEncapsulatedUnionMarshall", "ptr", pStubMsg, "char*", pMemory, "char*", pFormat, "char*")
        return result
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer<Byte>} pMemory 
     * @param {Pointer<Byte>} pFormat 
     * @returns {Pointer<Byte>} 
     */
    static NdrByteCountPointerMarshall(pStubMsg, pMemory, pFormat) {
        result := DllCall("RPCRT4.dll\NdrByteCountPointerMarshall", "ptr", pStubMsg, "char*", pMemory, "char*", pFormat, "char*")
        return result
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer<Byte>} pMemory 
     * @param {Pointer<Byte>} pFormat 
     * @returns {Pointer<Byte>} 
     */
    static NdrXmitOrRepAsMarshall(pStubMsg, pMemory, pFormat) {
        result := DllCall("RPCRT4.dll\NdrXmitOrRepAsMarshall", "ptr", pStubMsg, "char*", pMemory, "char*", pFormat, "char*")
        return result
    }

    /**
     * The NdrUserMarshalMarshall function marshals the supplied data buffer.
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/rpcndr/ns-rpcndr-midl_stub_message">MIDL_STUB_MESSAGE</a> structure that maintains the current status of the RPC stub. Structure is for internal use only; do not modify.
     * @param {Pointer<Byte>} pMemory Pointer to user data object to be marshaled.
     * @param {Pointer<Byte>} pFormat Pointer's format string description.
     * @returns {Pointer<Byte>} Returns <b>NULL</b> upon success. If an error occurs, the function throws one of the following exception codes. 
     * 
     * <table>
     * <tr>
     * <th>Error</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>STATUS_ACCESS_VIOLATION</td>
     * <td>An access violation occurred.</td>
     * </tr>
     * <tr>
     * <td>RPC_S_INTERNAL_ERROR</td>
     * <td>An error occurred in RPC.</td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//rpcndr/nf-rpcndr-ndrusermarshalmarshall
     * @since windows5.0
     */
    static NdrUserMarshalMarshall(pStubMsg, pMemory, pFormat) {
        result := DllCall("RPCRT4.dll\NdrUserMarshalMarshall", "ptr", pStubMsg, "char*", pMemory, "char*", pFormat, "char*")
        return result
    }

    /**
     * The NdrInterfacePointerMarshall function marshals the interface pointer into a network buffer to be sent to the server.
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/rpcndr/ns-rpcndr-midl_stub_message">MIDL_STUB_MESSAGE</a> structure that maintains the current status of the RPC stub. This structure is for internal use only and should not be modified.
     * @param {Pointer<Byte>} pMemory Pointer to the interface pointer to be marshaled.
     * @param {Pointer<Byte>} pFormat Pointer to the format string description.
     * @returns {Pointer<Byte>} Returns null upon success. If an error occurs, the function throws one of the following exception codes. In addition, the function can throw exception codes from <a href="/windows/desktop/api/combaseapi/nf-combaseapi-comarshalinterface">CoMarshalInterface</a>.
     * 
     * <table>
     * <tr>
     * <th>Error</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>STATUS_ACCESS_VIOLATION</td>
     * <td>An access violation occurred.</td>
     * </tr>
     * <tr>
     * <td>RPC_S_INTERNAL_ERROR</td>
     * <td>An error occurred in RPC.</td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//rpcndr/nf-rpcndr-ndrinterfacepointermarshall
     * @since windows5.0
     */
    static NdrInterfacePointerMarshall(pStubMsg, pMemory, pFormat) {
        result := DllCall("RPCRT4.dll\NdrInterfacePointerMarshall", "ptr", pStubMsg, "char*", pMemory, "char*", pFormat, "char*")
        return result
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer} ContextHandle 
     * @param {Integer} fCheck 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdrClientContextMarshall(pStubMsg, ContextHandle, fCheck) {
        DllCall("RPCRT4.dll\NdrClientContextMarshall", "ptr", pStubMsg, "ptr", ContextHandle, "int", fCheck)
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer<NDR_SCONTEXT>} ContextHandle 
     * @param {Pointer<NDR_RUNDOWN>} RundownRoutine 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdrServerContextMarshall(pStubMsg, ContextHandle, RundownRoutine) {
        DllCall("RPCRT4.dll\NdrServerContextMarshall", "ptr", pStubMsg, "ptr", ContextHandle, "ptr", RundownRoutine)
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer<NDR_SCONTEXT>} ContextHandle 
     * @param {Pointer<NDR_RUNDOWN>} RundownRoutine 
     * @param {Pointer<Byte>} pFormat 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdrServerContextNewMarshall(pStubMsg, ContextHandle, RundownRoutine, pFormat) {
        DllCall("RPCRT4.dll\NdrServerContextNewMarshall", "ptr", pStubMsg, "ptr", ContextHandle, "ptr", RundownRoutine, "char*", pFormat)
    }

    /**
     * The NdrSimpleTypeUnmarshall function unmarshalls a simple type.
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/rpcndr/ns-rpcndr-midl_stub_message">MIDL_STUB_MESSAGE</a> structure that maintains the current status of the RPC stub. Structure is for internal use only; do not modify.
     * @param {Pointer<Byte>} pMemory Pointer to memory to unmarshall.
     * @param {Integer} FormatChar Format string of the simple type.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//rpcndr/nf-rpcndr-ndrsimpletypeunmarshall
     * @since windows5.0
     */
    static NdrSimpleTypeUnmarshall(pStubMsg, pMemory, FormatChar) {
        DllCall("RPCRT4.dll\NdrSimpleTypeUnmarshall", "ptr", pStubMsg, "char*", pMemory, "char", FormatChar)
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer<Byte>} ppMemory 
     * @param {Pointer<Byte>} pFormat 
     * @param {Integer} fMustAlloc 
     * @returns {Pointer<Byte>} 
     */
    static NdrRangeUnmarshall(pStubMsg, ppMemory, pFormat, fMustAlloc) {
        result := DllCall("RPCRT4.dll\NdrRangeUnmarshall", "ptr", pStubMsg, "char*", ppMemory, "char*", pFormat, "char", fMustAlloc, "char*")
        return result
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer<Void>} pMemory 
     * @param {Integer} CacheSize 
     * @param {Integer} flags 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdrCorrelationInitialize(pStubMsg, pMemory, CacheSize, flags) {
        DllCall("RPCRT4.dll\NdrCorrelationInitialize", "ptr", pStubMsg, "ptr", pMemory, "uint", CacheSize, "uint", flags)
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdrCorrelationPass(pStubMsg) {
        DllCall("RPCRT4.dll\NdrCorrelationPass", "ptr", pStubMsg)
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdrCorrelationFree(pStubMsg) {
        DllCall("RPCRT4.dll\NdrCorrelationFree", "ptr", pStubMsg)
    }

    /**
     * The NdrPointerUnmarshall function unmarshalls a top level pointer to anything. Pointers embedded in structures, arrays, or unions call NdrPointerUnmarshall directly.
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/rpcndr/ns-rpcndr-midl_stub_message">MIDL_STUB_MESSAGE</a> structure that maintains the current status of the RPC stub. Structure is for internal use only; do not modify.
     * @param {Pointer<Byte>} ppMemory Pointer to memory where pointer will be unmarshalled. Please see MCCP Buffer Protection for information on buffer overrun protections in RPC: <a href="https://docs.microsoft.com/windows/desktop/Rpc/mccp-buffer-protection">http://msdn.microsoft.com/en-us/library/ff621497(VS.85).aspx</a>
     * @param {Pointer<Byte>} pFormat Pointer to the format string description.
     * @param {Integer} fMustAlloc Unused.
     * @returns {Pointer<Byte>} Returns <b>NULL</b> upon success. If an error occurs, the function throws one of the following exception codes.
     * 
     * <table>
     * <tr>
     * <th>Error</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>RPC_BAD_STUB_DATA or RPC_X_INVALID_BOUND  </td>
     * <td>The network  buffer is incorrect.</td>
     * </tr>
     * <tr>
     * <td>RPC_S_OUT_OF_MEMORY</td>
     * <td>The system is out of memory.</td>
     * </tr>
     * <tr>
     * <td>STATUS_ACCESS_VIOLATION</td>
     * <td>An access violation occurred.</td>
     * </tr>
     * <tr>
     * <td>RPC_S_INTERNAL_ERROR</td>
     * <td>An error occurred in RPC.</td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//rpcndr/nf-rpcndr-ndrpointerunmarshall
     * @since windows5.0
     */
    static NdrPointerUnmarshall(pStubMsg, ppMemory, pFormat, fMustAlloc) {
        result := DllCall("RPCRT4.dll\NdrPointerUnmarshall", "ptr", pStubMsg, "char*", ppMemory, "char*", pFormat, "char", fMustAlloc, "char*")
        return result
    }

    /**
     * The NdrSimpleStructUnmarshall function unmarshals the simple structure from the network buffer to memory.
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/rpcndr/ns-rpcndr-midl_stub_message">MIDL_STUB_MESSAGE</a> structure that maintains the current status of the RPC stub. The  <b>MIDL_STUB_MESSAGE</b> structure is for internal use only, and must not be modified.
     * @param {Pointer<Byte>} ppMemory Address to a pointer to the unmarshalled simple structure. If set to null, or if the <i>fMustAlloc</i> parameter is set to <b>TRUE</b>, the stub will allocate the memory.
     * @param {Pointer<Byte>} pFormat Pointer to the format string description.
     * @param {Integer} fMustAlloc Flag that specifies whether the stub must allocate the memory into which the simple structure is to be marshaled.  Specify <b>TRUE</b> if RPC must allocate <i>ppMemory</i>.
     * @returns {Pointer<Byte>} Returns null upon success. Raises one of the following exceptions upon failure.
     * 
     * <table>
     * <tr>
     * <th>Error</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>RPC_BAD_STUB_DATA or RPC_X_INVALID_BOUND</td>
     * <td>The network  is incorrect.</td>
     * </tr>
     * <tr>
     * <td>RPC_S_OUT_OF_MEMORY</td>
     * <td>Out of memory.</td>
     * </tr>
     * <tr>
     * <td>STATUS_ACCESS_VIOLATION</td>
     * <td>An access violation occurred.</td>
     * </tr>
     * <tr>
     * <td>RPC_S_INTERNAL_ERROR</td>
     * <td>An error occurred in RPC.</td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//rpcndr/nf-rpcndr-ndrsimplestructunmarshall
     * @since windows5.0
     */
    static NdrSimpleStructUnmarshall(pStubMsg, ppMemory, pFormat, fMustAlloc) {
        result := DllCall("RPCRT4.dll\NdrSimpleStructUnmarshall", "ptr", pStubMsg, "char*", ppMemory, "char*", pFormat, "char", fMustAlloc, "char*")
        return result
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer<Byte>} ppMemory 
     * @param {Pointer<Byte>} pFormat 
     * @param {Integer} fMustAlloc 
     * @returns {Pointer<Byte>} 
     */
    static NdrConformantStructUnmarshall(pStubMsg, ppMemory, pFormat, fMustAlloc) {
        result := DllCall("RPCRT4.dll\NdrConformantStructUnmarshall", "ptr", pStubMsg, "char*", ppMemory, "char*", pFormat, "char", fMustAlloc, "char*")
        return result
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer<Byte>} ppMemory 
     * @param {Pointer<Byte>} pFormat 
     * @param {Integer} fMustAlloc 
     * @returns {Pointer<Byte>} 
     */
    static NdrConformantVaryingStructUnmarshall(pStubMsg, ppMemory, pFormat, fMustAlloc) {
        result := DllCall("RPCRT4.dll\NdrConformantVaryingStructUnmarshall", "ptr", pStubMsg, "char*", ppMemory, "char*", pFormat, "char", fMustAlloc, "char*")
        return result
    }

    /**
     * The NdrComplexStructUnmarshall function unmarshals the complex structure from the network buffer to memory.
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/rpcndr/ns-rpcndr-midl_stub_message">MIDL_STUB_MESSAGE</a> structure that maintains the current status of the RPC stub. The  <b>MIDL_STUB_MESSAGE</b> structure is for internal use only, and must not be modified.
     * @param {Pointer<Byte>} ppMemory Address to a pointer to the unmarshalled complex structure. If set to null, or if the <i>fMustAlloc</i> parameter is set to <b>TRUE</b>, the stub will allocate the memory.
     * @param {Pointer<Byte>} pFormat Pointer to the format string description.
     * @param {Integer} fMustAlloc Flag that specifies whether the stub must allocate the memory into which the complex structure is to be marshaled.  Specify <b>TRUE</b> if RPC must allocate <i>ppMemory</i>.
     * @returns {Pointer<Byte>} Returns null upon success. Raises one of the following exceptions upon failure.
     * 
     * <table>
     * <tr>
     * <th>Error</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>RPC_BAD_STUB_DATA or RPC_X_INVALID_BOUND</td>
     * <td>The network  is incorrect.</td>
     * </tr>
     * <tr>
     * <td>RPC_S_OUT_OF_MEMORY</td>
     * <td>Out of memory.</td>
     * </tr>
     * <tr>
     * <td>STATUS_ACCESS_VIOLATION</td>
     * <td>An access violation occurred.</td>
     * </tr>
     * <tr>
     * <td>RPC_S_INTERNAL_ERROR</td>
     * <td>An error occurred in RPC.</td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//rpcndr/nf-rpcndr-ndrcomplexstructunmarshall
     * @since windows5.0
     */
    static NdrComplexStructUnmarshall(pStubMsg, ppMemory, pFormat, fMustAlloc) {
        result := DllCall("RPCRT4.dll\NdrComplexStructUnmarshall", "ptr", pStubMsg, "char*", ppMemory, "char*", pFormat, "char", fMustAlloc, "char*")
        return result
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer<Byte>} ppMemory 
     * @param {Pointer<Byte>} pFormat 
     * @param {Integer} fMustAlloc 
     * @returns {Pointer<Byte>} 
     */
    static NdrFixedArrayUnmarshall(pStubMsg, ppMemory, pFormat, fMustAlloc) {
        result := DllCall("RPCRT4.dll\NdrFixedArrayUnmarshall", "ptr", pStubMsg, "char*", ppMemory, "char*", pFormat, "char", fMustAlloc, "char*")
        return result
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer<Byte>} ppMemory 
     * @param {Pointer<Byte>} pFormat 
     * @param {Integer} fMustAlloc 
     * @returns {Pointer<Byte>} 
     * @since windows5.0
     */
    static NdrConformantArrayUnmarshall(pStubMsg, ppMemory, pFormat, fMustAlloc) {
        result := DllCall("RPCRT4.dll\NdrConformantArrayUnmarshall", "ptr", pStubMsg, "char*", ppMemory, "char*", pFormat, "char", fMustAlloc, "char*")
        return result
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer<Byte>} ppMemory 
     * @param {Pointer<Byte>} pFormat 
     * @param {Integer} fMustAlloc 
     * @returns {Pointer<Byte>} 
     */
    static NdrConformantVaryingArrayUnmarshall(pStubMsg, ppMemory, pFormat, fMustAlloc) {
        result := DllCall("RPCRT4.dll\NdrConformantVaryingArrayUnmarshall", "ptr", pStubMsg, "char*", ppMemory, "char*", pFormat, "char", fMustAlloc, "char*")
        return result
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer<Byte>} ppMemory 
     * @param {Pointer<Byte>} pFormat 
     * @param {Integer} fMustAlloc 
     * @returns {Pointer<Byte>} 
     */
    static NdrVaryingArrayUnmarshall(pStubMsg, ppMemory, pFormat, fMustAlloc) {
        result := DllCall("RPCRT4.dll\NdrVaryingArrayUnmarshall", "ptr", pStubMsg, "char*", ppMemory, "char*", pFormat, "char", fMustAlloc, "char*")
        return result
    }

    /**
     * The NdrComplexArrayUnmarshall function unmarshals the complex array from the network buffer to memory.
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/rpcndr/ns-rpcndr-midl_stub_message">MIDL_STUB_MESSAGE</a> structure that maintains the current status of the RPC stub. The  <b>MIDL_STUB_MESSAGE</b> structure is for internal use only, and must not be modified.
     * @param {Pointer<Byte>} ppMemory Address to a pointer to the unmarshalled complex array. If set to null, or if the <i>fMustAlloc</i> parameter is set to <b>TRUE</b>, the stub will allocate the memory.
     * @param {Pointer<Byte>} pFormat Pointer to the format string description.
     * @param {Integer} fMustAlloc Flag that specifies whether the stub must allocate the memory into which the complex array is to be marshaled.  Specify <b>TRUE</b> if RPC must allocate <i>ppMemory</i>.
     * @returns {Pointer<Byte>} Returns null upon success. Raises one of the following exceptions  upon failure.
     * 
     * <table>
     * <tr>
     * <th>Error</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>RPC_BAD_STUB_DATA or RPC_X_INVALID_BOUND</td>
     * <td>The network  is incorrect.</td>
     * </tr>
     * <tr>
     * <td>RPC_S_OUT_OF_MEMORY</td>
     * <td>Out of memory.</td>
     * </tr>
     * <tr>
     * <td>STATUS_ACCESS_VIOLATION</td>
     * <td>An access violation occurred.</td>
     * </tr>
     * <tr>
     * <td>RPC_S_INTERNAL_ERROR</td>
     * <td>An error occurred in RPC.</td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//rpcndr/nf-rpcndr-ndrcomplexarrayunmarshall
     * @since windows5.0
     */
    static NdrComplexArrayUnmarshall(pStubMsg, ppMemory, pFormat, fMustAlloc) {
        result := DllCall("RPCRT4.dll\NdrComplexArrayUnmarshall", "ptr", pStubMsg, "char*", ppMemory, "char*", pFormat, "char", fMustAlloc, "char*")
        return result
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer<Byte>} ppMemory 
     * @param {Pointer<Byte>} pFormat 
     * @param {Integer} fMustAlloc 
     * @returns {Pointer<Byte>} 
     */
    static NdrNonConformantStringUnmarshall(pStubMsg, ppMemory, pFormat, fMustAlloc) {
        result := DllCall("RPCRT4.dll\NdrNonConformantStringUnmarshall", "ptr", pStubMsg, "char*", ppMemory, "char*", pFormat, "char", fMustAlloc, "char*")
        return result
    }

    /**
     * The NdrConformantStringUnmarshall function unmarshals the conformant string from the network buffer to memory.
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/rpcndr/ns-rpcndr-midl_stub_message">MIDL_STUB_MESSAGE</a> structure that maintains the current status of the RPC stub. This structure is for internal use only and should not be modified.
     * @param {Pointer<Byte>} ppMemory Address to a pointer to the unmarshalled conformant string. If set to null, or if the <i>fMustAlloc</i> is set to <b>TRUE</b>, the stub will allocate the memory.
     * @param {Pointer<Byte>} pFormat Pointer to the format string description.
     * @param {Integer} fMustAlloc Flag that specifies whether the stub must allocate the memory into which the conformant string is to be marshaled.  Specify <b>TRUE</b> if RPC must allocate <i>ppMemory</i>.
     * @returns {Pointer<Byte>} Returns null upon success. If an error occurs, the function throws one of the following exception codes.
     * 
     * <table>
     * <tr>
     * <th>Error</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>RPC_BAD_STUB_DATA or RPC_X_INVALID_BOUND</td>
     * <td>The network  is incorrect.</td>
     * </tr>
     * <tr>
     * <td>RPC_S_OUT_OF_MEMORY</td>
     * <td>Out of memory.</td>
     * </tr>
     * <tr>
     * <td>STATUS_ACCESS_VIOLATION</td>
     * <td>An access violation occurred.</td>
     * </tr>
     * <tr>
     * <td>RPC_S_INTERNAL_ERROR</td>
     * <td>An error occurred in RPC.</td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//rpcndr/nf-rpcndr-ndrconformantstringunmarshall
     * @since windows5.0
     */
    static NdrConformantStringUnmarshall(pStubMsg, ppMemory, pFormat, fMustAlloc) {
        result := DllCall("RPCRT4.dll\NdrConformantStringUnmarshall", "ptr", pStubMsg, "char*", ppMemory, "char*", pFormat, "char", fMustAlloc, "char*")
        return result
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer<Byte>} ppMemory 
     * @param {Pointer<Byte>} pFormat 
     * @param {Integer} fMustAlloc 
     * @returns {Pointer<Byte>} 
     */
    static NdrEncapsulatedUnionUnmarshall(pStubMsg, ppMemory, pFormat, fMustAlloc) {
        result := DllCall("RPCRT4.dll\NdrEncapsulatedUnionUnmarshall", "ptr", pStubMsg, "char*", ppMemory, "char*", pFormat, "char", fMustAlloc, "char*")
        return result
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer<Byte>} ppMemory 
     * @param {Pointer<Byte>} pFormat 
     * @param {Integer} fMustAlloc 
     * @returns {Pointer<Byte>} 
     */
    static NdrNonEncapsulatedUnionUnmarshall(pStubMsg, ppMemory, pFormat, fMustAlloc) {
        result := DllCall("RPCRT4.dll\NdrNonEncapsulatedUnionUnmarshall", "ptr", pStubMsg, "char*", ppMemory, "char*", pFormat, "char", fMustAlloc, "char*")
        return result
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer<Byte>} ppMemory 
     * @param {Pointer<Byte>} pFormat 
     * @param {Integer} fMustAlloc 
     * @returns {Pointer<Byte>} 
     */
    static NdrByteCountPointerUnmarshall(pStubMsg, ppMemory, pFormat, fMustAlloc) {
        result := DllCall("RPCRT4.dll\NdrByteCountPointerUnmarshall", "ptr", pStubMsg, "char*", ppMemory, "char*", pFormat, "char", fMustAlloc, "char*")
        return result
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer<Byte>} ppMemory 
     * @param {Pointer<Byte>} pFormat 
     * @param {Integer} fMustAlloc 
     * @returns {Pointer<Byte>} 
     */
    static NdrXmitOrRepAsUnmarshall(pStubMsg, ppMemory, pFormat, fMustAlloc) {
        result := DllCall("RPCRT4.dll\NdrXmitOrRepAsUnmarshall", "ptr", pStubMsg, "char*", ppMemory, "char*", pFormat, "char", fMustAlloc, "char*")
        return result
    }

    /**
     * The NdrUserMarshalUnmarshall function calls a user-defined unmarshal routine to unmarshal data with the attribute.
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/rpcndr/ns-rpcndr-midl_stub_message">MIDL_STUB_MESSAGE</a> structure that maintains the current status of the RPC stub. The  <b>MIDL_STUB_MESSAGE</b> structure is for internal use only, and must not be modified.
     * @param {Pointer<Byte>} ppMemory Pointer to user data object to be unmarshalled.
     * @param {Pointer<Byte>} pFormat Format string description of the pointer.
     * @param {Integer} fMustAlloc Flag that specifies whether the stub must allocate the memory into which the user data object is to be unmarshalled.  Specify <b>TRUE</b> if RPC must allocate <i>ppMemory</i>.
     * @returns {Pointer<Byte>} Returns <b>NULL</b> upon success. Returns one of the following exception codes upon error.
     * 
     * <table>
     * <tr>
     * <th>Error</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>STATUS_ACCESS_VIOLATION</td>
     * <td>An access violation occurred.</td>
     * </tr>
     * <tr>
     * <td>RPC_S_INTERNAL_ERROR</td>
     * <td>An error occurred in RPC.</td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//rpcndr/nf-rpcndr-ndrusermarshalunmarshall
     * @since windows5.0
     */
    static NdrUserMarshalUnmarshall(pStubMsg, ppMemory, pFormat, fMustAlloc) {
        result := DllCall("RPCRT4.dll\NdrUserMarshalUnmarshall", "ptr", pStubMsg, "char*", ppMemory, "char*", pFormat, "char", fMustAlloc, "char*")
        return result
    }

    /**
     * The NdrInterfacePointerUnmarshall function unmarshalls the data referenced by the interface pointer from the network buffer to memory.
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/rpcndr/ns-rpcndr-midl_stub_message">MIDL_STUB_MESSAGE</a> structure that maintains the current status of the RPC stub. Structure is for internal use only; do not modify.
     * @param {Pointer<Byte>} ppMemory Pointer to a pointer to the unmarshalled interface pointer.
     * @param {Pointer<Byte>} pFormat Pointer to the format string description.
     * @param {Integer} fMustAlloc Unused.
     * @returns {Pointer<Byte>} Returns NULL upon success. If an error occurs, the function throws one of the following exception codes. In addition, the function can throw exception codes from <a href="/windows/desktop/api/combaseapi/nf-combaseapi-counmarshalinterface">CoUnmarshalInterface</a>.
     * 
     * <table>
     * <tr>
     * <th>Error</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>RPC_BAD_STUB_DATA  </td>
     * <td>The network  buffer is incorrect.</td>
     * </tr>
     * <tr>
     * <td>RPC_S_OUT_OF_MEMORY</td>
     * <td>The system is out of memory.</td>
     * </tr>
     * <tr>
     * <td>STATUS_ACCESS_VIOLATION</td>
     * <td>An access violation occurred.</td>
     * </tr>
     * <tr>
     * <td>RPC_S_INTERNAL_ERROR</td>
     * <td>An error occurred in RPC.</td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//rpcndr/nf-rpcndr-ndrinterfacepointerunmarshall
     * @since windows5.0
     */
    static NdrInterfacePointerUnmarshall(pStubMsg, ppMemory, pFormat, fMustAlloc) {
        result := DllCall("RPCRT4.dll\NdrInterfacePointerUnmarshall", "ptr", pStubMsg, "char*", ppMemory, "char*", pFormat, "char", fMustAlloc, "char*")
        return result
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer<IntPtr>} pContextHandle 
     * @param {Pointer<Void>} BindHandle 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdrClientContextUnmarshall(pStubMsg, pContextHandle, BindHandle) {
        DllCall("RPCRT4.dll\NdrClientContextUnmarshall", "ptr", pStubMsg, "ptr*", pContextHandle, "ptr", BindHandle)
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @returns {Pointer<NDR_SCONTEXT>} 
     */
    static NdrServerContextUnmarshall(pStubMsg) {
        result := DllCall("RPCRT4.dll\NdrServerContextUnmarshall", "ptr", pStubMsg, "ptr")
        return result
    }

    /**
     * Initializes a new RPC context handle.
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/rpcndr/ns-rpcndr-midl_stub_message">MIDL_STUB_MESSAGE</a> structure that contains the current status of the RPC stub. Structure is for internal use only; do not modify.
     * @param {Pointer<Byte>} pFormat Pointer to a <b>FORMAT_STRING</b> structure that contains the format of the new context handle.
     * @returns {Pointer<NDR_SCONTEXT>} Returns a NDR_SCONTEXT structure that provides a newly initialized context on return or raises exception upon error.
     * @see https://docs.microsoft.com/windows/win32/api//rpcndr/nf-rpcndr-ndrcontexthandleinitialize
     * @since windows5.1.2600
     */
    static NdrContextHandleInitialize(pStubMsg, pFormat) {
        result := DllCall("RPCRT4.dll\NdrContextHandleInitialize", "ptr", pStubMsg, "char*", pFormat, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer<Byte>} pFormat 
     * @returns {Pointer<NDR_SCONTEXT>} 
     */
    static NdrServerContextNewUnmarshall(pStubMsg, pFormat) {
        result := DllCall("RPCRT4.dll\NdrServerContextNewUnmarshall", "ptr", pStubMsg, "char*", pFormat, "ptr")
        return result
    }

    /**
     * The NdrPointerBufferSize function computes the needed buffer size, in bytes, for a top-level pointer to anything.
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/rpcndr/ns-rpcndr-midl_stub_message">MIDL_STUB_MESSAGE</a> structure that maintains the current status of the RPC stub. The <b>BufferLength</b> member contains the size of the buffer. This structure is for internal use only and should not be modified.
     * @param {Pointer<Byte>} pMemory Pointer to the data being sized.
     * @param {Pointer<Byte>} pFormat Pointer to the format string description.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//rpcndr/nf-rpcndr-ndrpointerbuffersize
     * @since windows5.0
     */
    static NdrPointerBufferSize(pStubMsg, pMemory, pFormat) {
        DllCall("RPCRT4.dll\NdrPointerBufferSize", "ptr", pStubMsg, "char*", pMemory, "char*", pFormat)
    }

    /**
     * The NdrSimpleStructBufferSize function calculates the required buffer size, in bytes, to marshal the simple structure.
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/rpcndr/ns-rpcndr-midl_stub_message">MIDL_STUB_MESSAGE</a> structure that maintains the current status of the RPC stub. The <b>BufferLength</b> member contains the size of the buffer. The <b>MIDL_STUB_MESSAGE</b> structure is for internal use only, and must not be modified.
     * @param {Pointer<Byte>} pMemory Pointer to the simple structure to be calculated.
     * @param {Pointer<Byte>} pFormat Pointer to the format string description.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//rpcndr/nf-rpcndr-ndrsimplestructbuffersize
     * @since windows5.0
     */
    static NdrSimpleStructBufferSize(pStubMsg, pMemory, pFormat) {
        DllCall("RPCRT4.dll\NdrSimpleStructBufferSize", "ptr", pStubMsg, "char*", pMemory, "char*", pFormat)
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer<Byte>} pMemory 
     * @param {Pointer<Byte>} pFormat 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdrConformantStructBufferSize(pStubMsg, pMemory, pFormat) {
        DllCall("RPCRT4.dll\NdrConformantStructBufferSize", "ptr", pStubMsg, "char*", pMemory, "char*", pFormat)
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer<Byte>} pMemory 
     * @param {Pointer<Byte>} pFormat 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdrConformantVaryingStructBufferSize(pStubMsg, pMemory, pFormat) {
        DllCall("RPCRT4.dll\NdrConformantVaryingStructBufferSize", "ptr", pStubMsg, "char*", pMemory, "char*", pFormat)
    }

    /**
     * The NdrComplexStructBufferSize function calculates the required buffer size, in bytes, to marshal the complex structure.
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/rpcndr/ns-rpcndr-midl_stub_message">MIDL_STUB_MESSAGE</a> structure that maintains the current status of the RPC stub. The <b>BufferLength</b> member contains the size of the buffer. The <b>MIDL_STUB_MESSAGE</b> structure is for internal use only, and must not be modified.
     * @param {Pointer<Byte>} pMemory Pointer to the complex structure to be calculated.
     * @param {Pointer<Byte>} pFormat Pointer to the format string description.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//rpcndr/nf-rpcndr-ndrcomplexstructbuffersize
     * @since windows5.0
     */
    static NdrComplexStructBufferSize(pStubMsg, pMemory, pFormat) {
        DllCall("RPCRT4.dll\NdrComplexStructBufferSize", "ptr", pStubMsg, "char*", pMemory, "char*", pFormat)
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer<Byte>} pMemory 
     * @param {Pointer<Byte>} pFormat 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdrFixedArrayBufferSize(pStubMsg, pMemory, pFormat) {
        DllCall("RPCRT4.dll\NdrFixedArrayBufferSize", "ptr", pStubMsg, "char*", pMemory, "char*", pFormat)
    }

    /**
     * The NdrConformantArrayBufferSize function calculates the required buffer size, in bytes, to marshal the conformant array.
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/rpcndr/ns-rpcndr-midl_stub_message">MIDL_STUB_MESSAGE</a> structure that maintains the current status of the RPC stub. The <b>BufferLength</b> member contains the size of the buffer. The <b>MIDL_STUB_MESSAGE</b> structure is for internal use only, and must not be modified.
     * @param {Pointer<Byte>} pMemory Pointer to the conformant array to be calculated.
     * @param {Pointer<Byte>} pFormat Pointer to the format string description.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//rpcndr/nf-rpcndr-ndrconformantarraybuffersize
     */
    static NdrConformantArrayBufferSize(pStubMsg, pMemory, pFormat) {
        DllCall("RPCRT4.dll\NdrConformantArrayBufferSize", "ptr", pStubMsg, "char*", pMemory, "char*", pFormat)
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer<Byte>} pMemory 
     * @param {Pointer<Byte>} pFormat 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdrConformantVaryingArrayBufferSize(pStubMsg, pMemory, pFormat) {
        DllCall("RPCRT4.dll\NdrConformantVaryingArrayBufferSize", "ptr", pStubMsg, "char*", pMemory, "char*", pFormat)
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer<Byte>} pMemory 
     * @param {Pointer<Byte>} pFormat 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdrVaryingArrayBufferSize(pStubMsg, pMemory, pFormat) {
        DllCall("RPCRT4.dll\NdrVaryingArrayBufferSize", "ptr", pStubMsg, "char*", pMemory, "char*", pFormat)
    }

    /**
     * The NdrComplexArrayBufferSize function calculates the required buffer size, in bytes, to marshal the complex array.
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/rpcndr/ns-rpcndr-midl_stub_message">MIDL_STUB_MESSAGE</a> structure that maintains the current status of the RPC stub. The <b>BufferLength</b> member contains the size of the buffer. The <b>MIDL_STUB_MESSAGE</b> structure is for internal use only, and must not be modified.
     * @param {Pointer<Byte>} pMemory Pointer to the  complex array to be calculated.
     * @param {Pointer<Byte>} pFormat Pointer to the format string description.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//rpcndr/nf-rpcndr-ndrcomplexarraybuffersize
     * @since windows5.0
     */
    static NdrComplexArrayBufferSize(pStubMsg, pMemory, pFormat) {
        DllCall("RPCRT4.dll\NdrComplexArrayBufferSize", "ptr", pStubMsg, "char*", pMemory, "char*", pFormat)
    }

    /**
     * The NdrConformantStringBufferSize function calculates the size of the buffer, in bytes, needed to marshal the conformant string.
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/rpcndr/ns-rpcndr-midl_stub_message">MIDL_STUB_MESSAGE</a> structure that maintains the current status of the RPC stub. The <b>BufferLength</b> member contains the size of the buffer. Structure is for internal use only; do not modify.
     * @param {Pointer<Byte>} pMemory Pointer to the null-terminated conformant string to be calculated.
     * @param {Pointer<Byte>} pFormat Pointer to the format string description.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//rpcndr/nf-rpcndr-ndrconformantstringbuffersize
     * @since windows5.0
     */
    static NdrConformantStringBufferSize(pStubMsg, pMemory, pFormat) {
        DllCall("RPCRT4.dll\NdrConformantStringBufferSize", "ptr", pStubMsg, "char*", pMemory, "char*", pFormat)
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer<Byte>} pMemory 
     * @param {Pointer<Byte>} pFormat 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdrNonConformantStringBufferSize(pStubMsg, pMemory, pFormat) {
        DllCall("RPCRT4.dll\NdrNonConformantStringBufferSize", "ptr", pStubMsg, "char*", pMemory, "char*", pFormat)
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer<Byte>} pMemory 
     * @param {Pointer<Byte>} pFormat 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdrEncapsulatedUnionBufferSize(pStubMsg, pMemory, pFormat) {
        DllCall("RPCRT4.dll\NdrEncapsulatedUnionBufferSize", "ptr", pStubMsg, "char*", pMemory, "char*", pFormat)
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer<Byte>} pMemory 
     * @param {Pointer<Byte>} pFormat 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdrNonEncapsulatedUnionBufferSize(pStubMsg, pMemory, pFormat) {
        DllCall("RPCRT4.dll\NdrNonEncapsulatedUnionBufferSize", "ptr", pStubMsg, "char*", pMemory, "char*", pFormat)
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer<Byte>} pMemory 
     * @param {Pointer<Byte>} pFormat 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdrByteCountPointerBufferSize(pStubMsg, pMemory, pFormat) {
        DllCall("RPCRT4.dll\NdrByteCountPointerBufferSize", "ptr", pStubMsg, "char*", pMemory, "char*", pFormat)
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer<Byte>} pMemory 
     * @param {Pointer<Byte>} pFormat 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdrXmitOrRepAsBufferSize(pStubMsg, pMemory, pFormat) {
        DllCall("RPCRT4.dll\NdrXmitOrRepAsBufferSize", "ptr", pStubMsg, "char*", pMemory, "char*", pFormat)
    }

    /**
     * The NdrUserMarshalBufferSize function calculates the size of the buffer, in bytes, needed to marshal the user marshal object.
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/rpcndr/ns-rpcndr-midl_stub_message">MIDL_STUB_MESSAGE</a> structure that maintains the current status of the RPC stub. The <b>BufferLength</b> member contains the size of the buffer. Structure is for internal use only; do not modify.
     * @param {Pointer<Byte>} pMemory Pointer to the user marshal object to be calculated.
     * @param {Pointer<Byte>} pFormat Pointer to the format string description.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//rpcndr/nf-rpcndr-ndrusermarshalbuffersize
     * @since windows5.0
     */
    static NdrUserMarshalBufferSize(pStubMsg, pMemory, pFormat) {
        DllCall("RPCRT4.dll\NdrUserMarshalBufferSize", "ptr", pStubMsg, "char*", pMemory, "char*", pFormat)
    }

    /**
     * The NdrInterfacePointerBufferSize function calculates the size of the buffer, in bytes, needed to marshal the interface pointer.
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/rpcndr/ns-rpcndr-midl_stub_message">MIDL_STUB_MESSAGE</a> structure that maintains the current status of the RPC stub. The <b>BufferLength</b> member contains the size of the buffer. This structure is for internal use only and should not be modified.
     * @param {Pointer<Byte>} pMemory Pointer to the interface pointer to be calculated.
     * @param {Pointer<Byte>} pFormat Pointer to the format string description.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//rpcndr/nf-rpcndr-ndrinterfacepointerbuffersize
     * @since windows5.0
     */
    static NdrInterfacePointerBufferSize(pStubMsg, pMemory, pFormat) {
        DllCall("RPCRT4.dll\NdrInterfacePointerBufferSize", "ptr", pStubMsg, "char*", pMemory, "char*", pFormat)
    }

    /**
     * The NdrContextHandleSize function returns the size of the supplied RPC context handle.
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/rpcndr/ns-rpcndr-midl_stub_message">MIDL_STUB_MESSAGE</a> structure that contains the current status of the RPC stub. The <b>BufferLength</b> member contains the size of the context handle, in bytes. Structure is for internal use only; do not modify.
     * @param {Pointer<Byte>} pMemory Pointer to a string buffer that contains an RPC context handle.
     * @param {Pointer<Byte>} pFormat Pointer to a <b>FORMAT_STRING</b> structure that contains the format of the context handle specified in <i>pMemory</i>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//rpcndr/nf-rpcndr-ndrcontexthandlesize
     * @since windows5.1.2600
     */
    static NdrContextHandleSize(pStubMsg, pMemory, pFormat) {
        DllCall("RPCRT4.dll\NdrContextHandleSize", "ptr", pStubMsg, "char*", pMemory, "char*", pFormat)
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer<Byte>} pFormat 
     * @returns {Integer} 
     */
    static NdrPointerMemorySize(pStubMsg, pFormat) {
        result := DllCall("RPCRT4.dll\NdrPointerMemorySize", "ptr", pStubMsg, "char*", pFormat, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer<Byte>} pFormat 
     * @returns {Integer} 
     */
    static NdrSimpleStructMemorySize(pStubMsg, pFormat) {
        result := DllCall("RPCRT4.dll\NdrSimpleStructMemorySize", "ptr", pStubMsg, "char*", pFormat, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer<Byte>} pFormat 
     * @returns {Integer} 
     */
    static NdrConformantStructMemorySize(pStubMsg, pFormat) {
        result := DllCall("RPCRT4.dll\NdrConformantStructMemorySize", "ptr", pStubMsg, "char*", pFormat, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer<Byte>} pFormat 
     * @returns {Integer} 
     */
    static NdrConformantVaryingStructMemorySize(pStubMsg, pFormat) {
        result := DllCall("RPCRT4.dll\NdrConformantVaryingStructMemorySize", "ptr", pStubMsg, "char*", pFormat, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer<Byte>} pFormat 
     * @returns {Integer} 
     */
    static NdrComplexStructMemorySize(pStubMsg, pFormat) {
        result := DllCall("RPCRT4.dll\NdrComplexStructMemorySize", "ptr", pStubMsg, "char*", pFormat, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer<Byte>} pFormat 
     * @returns {Integer} 
     */
    static NdrFixedArrayMemorySize(pStubMsg, pFormat) {
        result := DllCall("RPCRT4.dll\NdrFixedArrayMemorySize", "ptr", pStubMsg, "char*", pFormat, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer<Byte>} pFormat 
     * @returns {Integer} 
     */
    static NdrConformantArrayMemorySize(pStubMsg, pFormat) {
        result := DllCall("RPCRT4.dll\NdrConformantArrayMemorySize", "ptr", pStubMsg, "char*", pFormat, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer<Byte>} pFormat 
     * @returns {Integer} 
     */
    static NdrConformantVaryingArrayMemorySize(pStubMsg, pFormat) {
        result := DllCall("RPCRT4.dll\NdrConformantVaryingArrayMemorySize", "ptr", pStubMsg, "char*", pFormat, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer<Byte>} pFormat 
     * @returns {Integer} 
     */
    static NdrVaryingArrayMemorySize(pStubMsg, pFormat) {
        result := DllCall("RPCRT4.dll\NdrVaryingArrayMemorySize", "ptr", pStubMsg, "char*", pFormat, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer<Byte>} pFormat 
     * @returns {Integer} 
     */
    static NdrComplexArrayMemorySize(pStubMsg, pFormat) {
        result := DllCall("RPCRT4.dll\NdrComplexArrayMemorySize", "ptr", pStubMsg, "char*", pFormat, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer<Byte>} pFormat 
     * @returns {Integer} 
     */
    static NdrConformantStringMemorySize(pStubMsg, pFormat) {
        result := DllCall("RPCRT4.dll\NdrConformantStringMemorySize", "ptr", pStubMsg, "char*", pFormat, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer<Byte>} pFormat 
     * @returns {Integer} 
     */
    static NdrNonConformantStringMemorySize(pStubMsg, pFormat) {
        result := DllCall("RPCRT4.dll\NdrNonConformantStringMemorySize", "ptr", pStubMsg, "char*", pFormat, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer<Byte>} pFormat 
     * @returns {Integer} 
     */
    static NdrEncapsulatedUnionMemorySize(pStubMsg, pFormat) {
        result := DllCall("RPCRT4.dll\NdrEncapsulatedUnionMemorySize", "ptr", pStubMsg, "char*", pFormat, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer<Byte>} pFormat 
     * @returns {Integer} 
     */
    static NdrNonEncapsulatedUnionMemorySize(pStubMsg, pFormat) {
        result := DllCall("RPCRT4.dll\NdrNonEncapsulatedUnionMemorySize", "ptr", pStubMsg, "char*", pFormat, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer<Byte>} pFormat 
     * @returns {Integer} 
     */
    static NdrXmitOrRepAsMemorySize(pStubMsg, pFormat) {
        result := DllCall("RPCRT4.dll\NdrXmitOrRepAsMemorySize", "ptr", pStubMsg, "char*", pFormat, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer<Byte>} pFormat 
     * @returns {Integer} 
     */
    static NdrUserMarshalMemorySize(pStubMsg, pFormat) {
        result := DllCall("RPCRT4.dll\NdrUserMarshalMemorySize", "ptr", pStubMsg, "char*", pFormat, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer<Byte>} pFormat 
     * @returns {Integer} 
     */
    static NdrInterfacePointerMemorySize(pStubMsg, pFormat) {
        result := DllCall("RPCRT4.dll\NdrInterfacePointerMemorySize", "ptr", pStubMsg, "char*", pFormat, "uint")
        return result
    }

    /**
     * The NdrPointerFree function frees memory.
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/rpcndr/ns-rpcndr-midl_stub_message">MIDL_STUB_MESSAGE</a> structure that maintains the current status of the RPC stub.  This structure is for internal use only and should not be modified.
     * @param {Pointer<Byte>} pMemory Pointer to memory to be freed.
     * @param {Pointer<Byte>} pFormat Pointer to the format string description.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//rpcndr/nf-rpcndr-ndrpointerfree
     * @since windows5.0
     */
    static NdrPointerFree(pStubMsg, pMemory, pFormat) {
        DllCall("RPCRT4.dll\NdrPointerFree", "ptr", pStubMsg, "char*", pMemory, "char*", pFormat)
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer<Byte>} pMemory 
     * @param {Pointer<Byte>} pFormat 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdrSimpleStructFree(pStubMsg, pMemory, pFormat) {
        DllCall("RPCRT4.dll\NdrSimpleStructFree", "ptr", pStubMsg, "char*", pMemory, "char*", pFormat)
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer<Byte>} pMemory 
     * @param {Pointer<Byte>} pFormat 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdrConformantStructFree(pStubMsg, pMemory, pFormat) {
        DllCall("RPCRT4.dll\NdrConformantStructFree", "ptr", pStubMsg, "char*", pMemory, "char*", pFormat)
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer<Byte>} pMemory 
     * @param {Pointer<Byte>} pFormat 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdrConformantVaryingStructFree(pStubMsg, pMemory, pFormat) {
        DllCall("RPCRT4.dll\NdrConformantVaryingStructFree", "ptr", pStubMsg, "char*", pMemory, "char*", pFormat)
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer<Byte>} pMemory 
     * @param {Pointer<Byte>} pFormat 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdrComplexStructFree(pStubMsg, pMemory, pFormat) {
        DllCall("RPCRT4.dll\NdrComplexStructFree", "ptr", pStubMsg, "char*", pMemory, "char*", pFormat)
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer<Byte>} pMemory 
     * @param {Pointer<Byte>} pFormat 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdrFixedArrayFree(pStubMsg, pMemory, pFormat) {
        DllCall("RPCRT4.dll\NdrFixedArrayFree", "ptr", pStubMsg, "char*", pMemory, "char*", pFormat)
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer<Byte>} pMemory 
     * @param {Pointer<Byte>} pFormat 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdrConformantArrayFree(pStubMsg, pMemory, pFormat) {
        DllCall("RPCRT4.dll\NdrConformantArrayFree", "ptr", pStubMsg, "char*", pMemory, "char*", pFormat)
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer<Byte>} pMemory 
     * @param {Pointer<Byte>} pFormat 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdrConformantVaryingArrayFree(pStubMsg, pMemory, pFormat) {
        DllCall("RPCRT4.dll\NdrConformantVaryingArrayFree", "ptr", pStubMsg, "char*", pMemory, "char*", pFormat)
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer<Byte>} pMemory 
     * @param {Pointer<Byte>} pFormat 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdrVaryingArrayFree(pStubMsg, pMemory, pFormat) {
        DllCall("RPCRT4.dll\NdrVaryingArrayFree", "ptr", pStubMsg, "char*", pMemory, "char*", pFormat)
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer<Byte>} pMemory 
     * @param {Pointer<Byte>} pFormat 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdrComplexArrayFree(pStubMsg, pMemory, pFormat) {
        DllCall("RPCRT4.dll\NdrComplexArrayFree", "ptr", pStubMsg, "char*", pMemory, "char*", pFormat)
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer<Byte>} pMemory 
     * @param {Pointer<Byte>} pFormat 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdrEncapsulatedUnionFree(pStubMsg, pMemory, pFormat) {
        DllCall("RPCRT4.dll\NdrEncapsulatedUnionFree", "ptr", pStubMsg, "char*", pMemory, "char*", pFormat)
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer<Byte>} pMemory 
     * @param {Pointer<Byte>} pFormat 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdrNonEncapsulatedUnionFree(pStubMsg, pMemory, pFormat) {
        DllCall("RPCRT4.dll\NdrNonEncapsulatedUnionFree", "ptr", pStubMsg, "char*", pMemory, "char*", pFormat)
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer<Byte>} pMemory 
     * @param {Pointer<Byte>} pFormat 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdrByteCountPointerFree(pStubMsg, pMemory, pFormat) {
        DllCall("RPCRT4.dll\NdrByteCountPointerFree", "ptr", pStubMsg, "char*", pMemory, "char*", pFormat)
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer<Byte>} pMemory 
     * @param {Pointer<Byte>} pFormat 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdrXmitOrRepAsFree(pStubMsg, pMemory, pFormat) {
        DllCall("RPCRT4.dll\NdrXmitOrRepAsFree", "ptr", pStubMsg, "char*", pMemory, "char*", pFormat)
    }

    /**
     * The NdrUserMarshalFree function frees the user marshal object.
     * @remarks
     * 
     * You should never free the top level object, it is freed by the system.
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/rpcndr/ns-rpcndr-midl_stub_message">MIDL_STUB_MESSAGE</a> structure that maintains the current status of the RPC stub. Structure is for internal use only; do not modify.
     * @param {Pointer<Byte>} pMemory Pointer to be freed.
     * @param {Pointer<Byte>} pFormat Pointer's format string description.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//rpcndr/nf-rpcndr-ndrusermarshalfree
     * @since windows5.0
     */
    static NdrUserMarshalFree(pStubMsg, pMemory, pFormat) {
        DllCall("RPCRT4.dll\NdrUserMarshalFree", "ptr", pStubMsg, "char*", pMemory, "char*", pFormat)
    }

    /**
     * The NdrInterfacePointerFree function releases the interface pointer.
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/rpcndr/ns-rpcndr-midl_stub_message">MIDL_STUB_MESSAGE</a> structure that maintains the current status of the RPC stub. This structure is for internal use only and should not be modified.
     * @param {Pointer<Byte>} pMemory Pointer to the interface pointer to be released.
     * @param {Pointer<Byte>} pFormat Pointer to the format string description.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//rpcndr/nf-rpcndr-ndrinterfacepointerfree
     * @since windows5.0
     */
    static NdrInterfacePointerFree(pStubMsg, pMemory, pFormat) {
        DllCall("RPCRT4.dll\NdrInterfacePointerFree", "ptr", pStubMsg, "char*", pMemory, "char*", pFormat)
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer<Byte>} pFormat 
     * @param {Integer} NumberParams 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdrConvert2(pStubMsg, pFormat, NumberParams) {
        DllCall("RPCRT4.dll\NdrConvert2", "ptr", pStubMsg, "char*", pFormat, "int", NumberParams)
    }

    /**
     * The NdrConvert function converts the network buffer from the data representation of the sender to the data representation of the receiver if they are different.
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/rpcndr/ns-rpcndr-midl_stub_message">MIDL_STUB_MESSAGE</a> structure that maintains the current status of the RPC stub. The <b>pRpcMsg</b> member points to a structure whose <b>Buffer</b> member contains the data to convert. This structure is for internal use only and should not be modified.
     * @param {Pointer<Byte>} pFormat Pointer to type format  of the data to convert.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//rpcndr/nf-rpcndr-ndrconvert
     * @since windows5.0
     */
    static NdrConvert(pStubMsg, pFormat) {
        DllCall("RPCRT4.dll\NdrConvert", "ptr", pStubMsg, "char*", pFormat)
    }

    /**
     * 
     * @param {Pointer<UInt32>} pFlags 
     * @param {Pointer<Byte>} pBuffer 
     * @param {Integer} FormatChar 
     * @returns {Pointer<Byte>} 
     */
    static NdrUserMarshalSimpleTypeConvert(pFlags, pBuffer, FormatChar) {
        result := DllCall("RPCRT4.dll\NdrUserMarshalSimpleTypeConvert", "uint*", pFlags, "char*", pBuffer, "char", FormatChar, "char*")
        return result
    }

    /**
     * 
     * @param {Pointer<RPC_MESSAGE>} pRpcMsg 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer<MIDL_STUB_DESC>} pStubDescriptor 
     * @param {Integer} ProcNum 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdrClientInitializeNew(pRpcMsg, pStubMsg, pStubDescriptor, ProcNum) {
        DllCall("RPCRT4.dll\NdrClientInitializeNew", "ptr", pRpcMsg, "ptr", pStubMsg, "ptr", pStubDescriptor, "uint", ProcNum)
    }

    /**
     * 
     * @param {Pointer<RPC_MESSAGE>} pRpcMsg 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer<MIDL_STUB_DESC>} pStubDescriptor 
     * @returns {Pointer<Byte>} 
     */
    static NdrServerInitializeNew(pRpcMsg, pStubMsg, pStubDescriptor) {
        result := DllCall("RPCRT4.dll\NdrServerInitializeNew", "ptr", pRpcMsg, "ptr", pStubMsg, "ptr", pStubDescriptor, "char*")
        return result
    }

    /**
     * 
     * @param {Pointer<RPC_MESSAGE>} pRpcMsg 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer<MIDL_STUB_DESC>} pStubDescriptor 
     * @param {Integer} RequestedBufferSize 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdrServerInitializePartial(pRpcMsg, pStubMsg, pStubDescriptor, RequestedBufferSize) {
        DllCall("RPCRT4.dll\NdrServerInitializePartial", "ptr", pRpcMsg, "ptr", pStubMsg, "ptr", pStubDescriptor, "uint", RequestedBufferSize)
    }

    /**
     * 
     * @param {Pointer<RPC_MESSAGE>} pRpcMsg 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer<MIDL_STUB_DESC>} pStubDescriptor 
     * @param {Integer} ProcNum 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdrClientInitialize(pRpcMsg, pStubMsg, pStubDescriptor, ProcNum) {
        DllCall("RPCRT4.dll\NdrClientInitialize", "ptr", pRpcMsg, "ptr", pStubMsg, "ptr", pStubDescriptor, "uint", ProcNum)
    }

    /**
     * 
     * @param {Pointer<RPC_MESSAGE>} pRpcMsg 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer<MIDL_STUB_DESC>} pStubDescriptor 
     * @returns {Pointer<Byte>} 
     */
    static NdrServerInitialize(pRpcMsg, pStubMsg, pStubDescriptor) {
        result := DllCall("RPCRT4.dll\NdrServerInitialize", "ptr", pRpcMsg, "ptr", pStubMsg, "ptr", pStubDescriptor, "char*")
        return result
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer<MIDL_STUB_DESC>} pStubDescriptor 
     * @param {Pointer<RPC_MESSAGE>} pRpcMsg 
     * @returns {Pointer<Byte>} 
     */
    static NdrServerInitializeUnmarshall(pStubMsg, pStubDescriptor, pRpcMsg) {
        result := DllCall("RPCRT4.dll\NdrServerInitializeUnmarshall", "ptr", pStubMsg, "ptr", pStubDescriptor, "ptr", pRpcMsg, "char*")
        return result
    }

    /**
     * 
     * @param {Pointer<RPC_MESSAGE>} pRpcMsg 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdrServerInitializeMarshall(pRpcMsg, pStubMsg) {
        DllCall("RPCRT4.dll\NdrServerInitializeMarshall", "ptr", pRpcMsg, "ptr", pStubMsg)
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Integer} BufferLength 
     * @param {Pointer<Void>} Handle 
     * @returns {Pointer<Byte>} 
     */
    static NdrGetBuffer(pStubMsg, BufferLength, Handle) {
        result := DllCall("RPCRT4.dll\NdrGetBuffer", "ptr", pStubMsg, "uint", BufferLength, "ptr", Handle, "char*")
        return result
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Integer} BufferLength 
     * @param {Pointer<Void>} Handle 
     * @returns {Pointer<Byte>} 
     */
    static NdrNsGetBuffer(pStubMsg, BufferLength, Handle) {
        result := DllCall("RPCRT4.dll\NdrNsGetBuffer", "ptr", pStubMsg, "uint", BufferLength, "ptr", Handle, "char*")
        return result
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer<Byte>} pBufferEnd 
     * @returns {Pointer<Byte>} 
     */
    static NdrSendReceive(pStubMsg, pBufferEnd) {
        result := DllCall("RPCRT4.dll\NdrSendReceive", "ptr", pStubMsg, "char*", pBufferEnd, "char*")
        return result
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer<Byte>} pBufferEnd 
     * @param {Pointer<Void>} pAutoHandle 
     * @returns {Pointer<Byte>} 
     */
    static NdrNsSendReceive(pStubMsg, pBufferEnd, pAutoHandle) {
        result := DllCall("RPCRT4.dll\NdrNsSendReceive", "ptr", pStubMsg, "char*", pBufferEnd, "ptr", pAutoHandle, "char*")
        return result
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdrFreeBuffer(pStubMsg) {
        DllCall("RPCRT4.dll\NdrFreeBuffer", "ptr", pStubMsg)
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer<RPC_VERSION>} pVersion 
     * @returns {HRESULT} 
     */
    static NdrGetDcomProtocolVersion(pStubMsg, pVersion) {
        result := DllCall("RPCRT4.dll\NdrGetDcomProtocolVersion", "ptr", pStubMsg, "ptr", pVersion, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The NdrClientCall2 function is the client-side entry point for the /Oicf mode stub.
     * @param {Pointer<MIDL_STUB_DESC>} pStubDescriptor Pointer to the MIDL-generated <a href="https://docs.microsoft.com/windows/desktop/api/rpcndr/ns-rpcndr-midl_stub_desc">MIDL_STUB_DESC</a> structure that contains information about the description of the remote interface.
     * @param {Pointer<Byte>} pFormat Pointer to the MIDL-generated procedure format string that describes the method and parameters.
     * @returns {CLIENT_CALL_RETURN} Return value of the remote call. The maximum size of a return value is equivalent to the register size of the system. MIDL switches to the <a href="/windows/desktop/Midl/-os">/Os</a> mode stub if the return value size is larger than the register size.
     * 
     * Depending on the method definition, this function can throw an exception if there is a network or server failure.
     * @see https://docs.microsoft.com/windows/win32/api//rpcndr/nf-rpcndr-ndrclientcall2
     * @since windows5.0
     */
    static NdrClientCall2(pStubDescriptor, pFormat) {
        result := DllCall("RPCRT4.dll\NdrClientCall2", "ptr", pStubDescriptor, "char*", pFormat, "CDecl ptr")
        return result
    }

    /**
     * The NdrAsyncClientCall function is the asynchronous client-side entry point for the /Oi and /Oic mode stub.
     * @param {Pointer<MIDL_STUB_DESC>} pStubDescriptor Pointer to the MIDL-generated <a href="https://docs.microsoft.com/windows/desktop/api/rpcndr/ns-rpcndr-midl_stub_desc">MIDL_STUB_DESC</a> structure that contains information about the description of the remote interface.
     * @param {Pointer<Byte>} pFormat Pointer to the MIDL-generated procedure format string that describes the method and parameters.
     * @returns {CLIENT_CALL_RETURN} Return value of the remote call. The maximum size of a return value is equivalent to the register size of the system. MIDL switches to the <a href="/windows/desktop/Midl/-os">/Os</a> mode stub if the return value size is larger than the register size.
     * 
     * Depending on the method definition, this function can throw an exception if there is a network or server failure.
     * @see https://docs.microsoft.com/windows/win32/api//rpcndr/nf-rpcndr-ndrasyncclientcall
     * @since windows5.0
     */
    static NdrAsyncClientCall(pStubDescriptor, pFormat) {
        result := DllCall("RPCRT4.dll\NdrAsyncClientCall", "ptr", pStubDescriptor, "char*", pFormat, "CDecl ptr")
        return result
    }

    /**
     * NdrDcomAsyncClientCall may be altered or unavailable.
     * @param {Pointer<MIDL_STUB_DESC>} pStubDescriptor Reserved.
     * @param {Pointer<Byte>} pFormat Reserved.
     * @returns {CLIENT_CALL_RETURN} Reserved.
     * @see https://docs.microsoft.com/windows/win32/api//rpcndr/nf-rpcndr-ndrdcomasyncclientcall
     * @since windows5.0
     */
    static NdrDcomAsyncClientCall(pStubDescriptor, pFormat) {
        result := DllCall("RPCRT4.dll\NdrDcomAsyncClientCall", "ptr", pStubDescriptor, "char*", pFormat, "CDecl ptr")
        return result
    }

    /**
     * NdrAsyncServerCall is not intended to be directly called by applications.
     * @param {Pointer<RPC_MESSAGE>} pRpcMsg Reserved.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//rpcndr/nf-rpcndr-ndrasyncservercall
     * @since windows5.0
     */
    static NdrAsyncServerCall(pRpcMsg) {
        DllCall("RPCRT4.dll\NdrAsyncServerCall", "ptr", pRpcMsg)
    }

    /**
     * 
     * @param {Pointer<IRpcStubBuffer>} pThis 
     * @param {Pointer<IRpcChannelBuffer>} pChannel 
     * @param {Pointer<RPC_MESSAGE>} pRpcMsg 
     * @param {Pointer<UInt32>} pdwStubPhase 
     * @returns {Integer} 
     */
    static NdrDcomAsyncStubCall(pThis, pChannel, pRpcMsg, pdwStubPhase) {
        result := DllCall("RPCRT4.dll\NdrDcomAsyncStubCall", "ptr", pThis, "ptr", pChannel, "ptr", pRpcMsg, "uint*", pdwStubPhase, "int")
        return result
    }

    /**
     * The NdrStubCall2 function is the server-side entry point for /Oicf mode stubs.
     * @param {Pointer<Void>} pThis Pointer to an instance of the CStdStubBuffer object, implementing  <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-irpcstubbuffer">IRpcStubBuffer</a>, for the DCOM interface.  Set to <b>NULL</b> for nonobject RPC interfaces.
     * @param {Pointer<Void>} pChannel Pointer to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-irpcchannelbuffer">IRpcChannelBuffer</a> for the DCOM interface, often provided by OLE. Set to <b>NULL</b> for nonobject interfaces.
     * @param {Pointer<RPC_MESSAGE>} pRpcMsg Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/rpcdcep/ns-rpcdcep-rpc_message">RPC_MESSAGE</a> structure that  contains information about the RPC request. In nonobject interfaces, <i>pRpcMsg</i> also contains information about the remoting method.
     * @param {Pointer<UInt32>} pdwStubPhase Pointer to a flag that tracks the current interpreter call's activity.
     * @returns {Integer} Returns S_OK upon success. Raises an exception upon error.
     * @see https://docs.microsoft.com/windows/win32/api//rpcndr/nf-rpcndr-ndrstubcall2
     * @since windows5.0
     */
    static NdrStubCall2(pThis, pChannel, pRpcMsg, pdwStubPhase) {
        result := DllCall("RPCRT4.dll\NdrStubCall2", "ptr", pThis, "ptr", pChannel, "ptr", pRpcMsg, "uint*", pdwStubPhase, "int")
        return result
    }

    /**
     * NdrServerCall2 is not intended to be directly called by applications.
     * @param {Pointer<RPC_MESSAGE>} pRpcMsg Reserved.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//rpcndr/nf-rpcndr-ndrservercall2
     * @since windows5.0
     */
    static NdrServerCall2(pRpcMsg) {
        DllCall("RPCRT4.dll\NdrServerCall2", "ptr", pRpcMsg)
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer<UInt32>} pCommStatus 
     * @param {Pointer<UInt32>} pFaultStatus 
     * @param {Integer} Status 
     * @returns {Integer} 
     */
    static NdrMapCommAndFaultStatus(pStubMsg, pCommStatus, pFaultStatus, Status) {
        result := DllCall("RPCRT4.dll\NdrMapCommAndFaultStatus", "ptr", pStubMsg, "uint*", pCommStatus, "uint*", pFaultStatus, "int", Status, "int")
        return result
    }

    /**
     * The RpcSsAllocate function allocates memory within the RPC stub memory-management function, and returns a pointer to the allocated memory or NULL.
     * @param {Pointer} Size Size of memory to allocate, in bytes.
     * @returns {Pointer<Void>} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OUT_OF_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system is out of memory.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcndr/nf-rpcndr-rpcssallocate
     * @since windows5.0
     */
    static RpcSsAllocate(Size) {
        result := DllCall("RPCRT4.dll\RpcSsAllocate", "ptr", Size, "ptr")
        return result
    }

    /**
     * The RpcSsDisableAllocate function frees resources and memory within the stub memory�management environment.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//rpcndr/nf-rpcndr-rpcssdisableallocate
     * @since windows5.0
     */
    static RpcSsDisableAllocate() {
        DllCall("RPCRT4.dll\RpcSsDisableAllocate")
    }

    /**
     * The RpcSsEnableAllocate function establishes the stub memory�management environment.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//rpcndr/nf-rpcndr-rpcssenableallocate
     * @since windows5.0
     */
    static RpcSsEnableAllocate() {
        DllCall("RPCRT4.dll\RpcSsEnableAllocate")
    }

    /**
     * The RpcSsFree function releases memory allocated by RpcSsAllocate.
     * @remarks
     * 
     * An application uses 
     * <b>RpcSsFree</b> to free memory that was allocated with 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcndr/nf-rpcndr-rpcssallocate">RpcSsAllocate</a>. In cases where the stub allocates the memory for the environment, 
     * <b>RpcSsFree</b> can also be used to release memory. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Rpc/memory-management">Memory Management</a>.
     * 
     * Note that the handle of the thread calling 
     * <b>RpcSsFree</b> must match the handle of the thread that allocated the memory by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcndr/nf-rpcndr-rpcssallocate">RpcSsAllocate</a>. Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcndr/nf-rpcndr-rpcssgetthreadhandle">RpcSsGetThreadHandle</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcndr/nf-rpcndr-rpcsssetthreadhandle">RpcSsSetThreadHandle</a> to pass handles from thread to thread.
     * 
     * 
     * @param {Pointer<Void>} NodeToFree Pointer to memory allocated by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcndr/nf-rpcndr-rpcssallocate">RpcSsAllocate</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcndr/nf-rpcndr-rpcsmallocate">RpcSmAllocate</a>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//rpcndr/nf-rpcndr-rpcssfree
     * @since windows5.0
     */
    static RpcSsFree(NodeToFree) {
        DllCall("RPCRT4.dll\RpcSsFree", "ptr", NodeToFree)
    }

    /**
     * The RpcSsGetThreadHandle function returns a thread handle for the stub memory�management environment.
     * @returns {Pointer<Void>} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcndr/nf-rpcndr-rpcssgetthreadhandle
     * @since windows5.0
     */
    static RpcSsGetThreadHandle() {
        result := DllCall("RPCRT4.dll\RpcSsGetThreadHandle", "ptr")
        return result
    }

    /**
     * The RpcSsSetClientAllocFree function enables the memory allocation and release mechanisms used by the client stubs.
     * @param {Pointer<RPC_CLIENT_ALLOC>} ClientAlloc Memory-allocation function.
     * @param {Pointer<RPC_CLIENT_FREE>} ClientFree Memory-releasing function used with the memory-allocation function specified by <i>pfnAllocate</i>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//rpcndr/nf-rpcndr-rpcsssetclientallocfree
     * @since windows5.0
     */
    static RpcSsSetClientAllocFree(ClientAlloc, ClientFree) {
        DllCall("RPCRT4.dll\RpcSsSetClientAllocFree", "ptr", ClientAlloc, "ptr", ClientFree)
    }

    /**
     * The RpcSsSetThreadHandle function sets a thread handle for the stub memory–management environment.
     * @remarks
     * 
     * An application calls 
     * <b>RpcSsSetThreadHandle</b> to set a thread handle for the stub memory–management environment. A thread used to manage memory for the stub memory–management environment calls 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcndr/nf-rpcndr-rpcssgetthreadhandle">RpcSsGetThreadHandle</a> to obtain a handle for its memory environment. In this way, another thread that calls 
     * <b>RpcSsSetThreadHandle</b> by using this handle can then use the same memory-management environment.
     * 
     * The same thread handle must be used by multiple threads calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcndr/nf-rpcndr-rpcssallocate">RpcSsAllocate</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcndr/nf-rpcndr-rpcssfree">RpcSsFree</a> in order to manage the same memory. Before spawning new threads to manage the same memory, the thread that established the memory-management environment (parent thread) calls 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcndr/nf-rpcndr-rpcssgetthreadhandle">RpcSsGetThreadHandle</a> to obtain a thread handle for this environment. Then, the spawned threads call 
     * <b>RpcSsSetThreadHandle</b> with the handle provided by the parent thread.
     * 
     * Typically, a thread spawned by a server manager procedure calls 
     * <b>RpcSsSetThreadHandle</b>. The stub sets up the memory-management environment for the manager procedure, and the manager calls 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcndr/nf-rpcndr-rpcssgetthreadhandle">RpcSsGetThreadHandle</a> to obtain a thread handle. Then, each spawned thread calls 
     * <b>RpcSsGetThreadHandle</b> to get access to the manager's memory-management environment.
     * 
     * A thread can also call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcndr/nf-rpcndr-rpcssgetthreadhandle">RpcSsGetThreadHandle</a> and 
     * <b>RpcSsSetThreadHandle</b> to save and restore its memory-management environment.
     * 
     * <div class="alert"><b>Note</b>  The 
     * <b>RpcSsSetThreadHandle</b> routine raises exceptions, while the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcndr/nf-rpcndr-rpcsmsetthreadhandle">RpcSmSetThreadHandle</a> routine returns the error code.</div>
     * <div> </div>
     * 
     * 
     * @param {Pointer<Void>} Id Thread handle returned by a call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcndr/nf-rpcndr-rpcssgetthreadhandle">RpcSsGetThreadHandle</a>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//rpcndr/nf-rpcndr-rpcsssetthreadhandle
     * @since windows5.0
     */
    static RpcSsSetThreadHandle(Id) {
        DllCall("RPCRT4.dll\RpcSsSetThreadHandle", "ptr", Id)
    }

    /**
     * The RpcSsSwapClientAllocFree function exchanges the memory allocation and release mechanisms used by the client stubs with those supplied by the client.
     * @param {Pointer<RPC_CLIENT_ALLOC>} ClientAlloc New function to allocate memory.
     * @param {Pointer<RPC_CLIENT_FREE>} ClientFree New function to release memory.
     * @param {Pointer<RPC_CLIENT_ALLOC>} OldClientAlloc Returns the previous memory-allocation function.
     * @param {Pointer<RPC_CLIENT_FREE>} OldClientFree Returns the previous memory-freeing function.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//rpcndr/nf-rpcndr-rpcssswapclientallocfree
     * @since windows5.0
     */
    static RpcSsSwapClientAllocFree(ClientAlloc, ClientFree, OldClientAlloc, OldClientFree) {
        DllCall("RPCRT4.dll\RpcSsSwapClientAllocFree", "ptr", ClientAlloc, "ptr", ClientFree, "ptr", OldClientAlloc, "ptr", OldClientFree)
    }

    /**
     * The RpcSmAllocate function allocates memory within the RPC stub memory management function and returns a pointer to the allocated memory or NULL.
     * @param {Pointer} Size Size of memory to allocate, in bytes.
     * @param {Pointer<Int32>} pStatus Pointer to the returned status.
     * @returns {Pointer<Void>} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OUT_OF_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system is out of memory.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcndr/nf-rpcndr-rpcsmallocate
     * @since windows5.0
     */
    static RpcSmAllocate(Size, pStatus) {
        result := DllCall("RPCRT4.dll\RpcSmAllocate", "ptr", Size, "int*", pStatus, "ptr")
        return result
    }

    /**
     * The RpcSmClientFree function frees memory returned from a client stub.
     * @param {Pointer<Void>} pNodeToFree Pointer to memory returned from a client stub.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcndr/nf-rpcndr-rpcsmclientfree
     * @since windows5.0
     */
    static RpcSmClientFree(pNodeToFree) {
        result := DllCall("RPCRT4.dll\RpcSmClientFree", "ptr", pNodeToFree, "int")
        return result
    }

    /**
     * The RpcSmDestroyClientContext function reclaims the client memory resources for a context handle and makes the context handle NULL.
     * @param {Pointer<Void>} ContextHandle Context handle that can no longer be used. The handle is set to <b>NULL</b> before <b>RpcSMDestroyClientContext</b> returns.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_X_SS_CONTEXT_MISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcndr/nf-rpcndr-rpcsmdestroyclientcontext
     * @since windows5.0
     */
    static RpcSmDestroyClientContext(ContextHandle) {
        result := DllCall("RPCRT4.dll\RpcSmDestroyClientContext", "ptr", ContextHandle, "int")
        return result
    }

    /**
     * The RpcSmDisableAllocate function frees resources and memory within the stub memory�management environment.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcndr/nf-rpcndr-rpcsmdisableallocate
     * @since windows5.0
     */
    static RpcSmDisableAllocate() {
        result := DllCall("RPCRT4.dll\RpcSmDisableAllocate", "int")
        return result
    }

    /**
     * The RpcSmEnableAllocate function establishes the stub memory�management environment.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OUT_OF_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system is out of memory.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcndr/nf-rpcndr-rpcsmenableallocate
     * @since windows5.0
     */
    static RpcSmEnableAllocate() {
        result := DllCall("RPCRT4.dll\RpcSmEnableAllocate", "int")
        return result
    }

    /**
     * The RpcSmFree function releases memory allocated by RpcSmAllocate.
     * @param {Pointer<Void>} NodeToFree Pointer to memory allocated by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcndr/nf-rpcndr-rpcsmallocate">RpcSmAllocate</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcndr/nf-rpcndr-rpcssallocate">RpcSsAllocate</a>.
     * @returns {Integer} The function 
     * <b>RpcSmFree</b> returns the following value.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcndr/nf-rpcndr-rpcsmfree
     * @since windows5.0
     */
    static RpcSmFree(NodeToFree) {
        result := DllCall("RPCRT4.dll\RpcSmFree", "ptr", NodeToFree, "int")
        return result
    }

    /**
     * The RpcSmGetThreadHandle function returns a thread handle, or NULL, for the stub memory�management environment.
     * @param {Pointer<Int32>} pStatus Pointer to the returned status.
     * @returns {Pointer<Void>} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcndr/nf-rpcndr-rpcsmgetthreadhandle
     * @since windows5.0
     */
    static RpcSmGetThreadHandle(pStatus) {
        result := DllCall("RPCRT4.dll\RpcSmGetThreadHandle", "int*", pStatus, "ptr")
        return result
    }

    /**
     * The RpcSmSetClientAllocFree function enables the memory allocation and release mechanisms used by the client stubs.
     * @param {Pointer<RPC_CLIENT_ALLOC>} ClientAlloc Function used to allocate memory.
     * @param {Pointer<RPC_CLIENT_FREE>} ClientFree Function used to release memory and used with the function specified by <i>pfnAllocate</i>.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OUT_OF_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system is out of memory.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcndr/nf-rpcndr-rpcsmsetclientallocfree
     * @since windows5.0
     */
    static RpcSmSetClientAllocFree(ClientAlloc, ClientFree) {
        result := DllCall("RPCRT4.dll\RpcSmSetClientAllocFree", "ptr", ClientAlloc, "ptr", ClientFree, "int")
        return result
    }

    /**
     * The RpcSmSetThreadHandle function sets a thread handle for the stub memory�management environment.
     * @param {Pointer<Void>} Id Thread handle returned by a call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcndr/nf-rpcndr-rpcsmgetthreadhandle">RpcSmGetThreadHandle</a>.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcndr/nf-rpcndr-rpcsmsetthreadhandle
     * @since windows5.0
     */
    static RpcSmSetThreadHandle(Id) {
        result := DllCall("RPCRT4.dll\RpcSmSetThreadHandle", "ptr", Id, "int")
        return result
    }

    /**
     * The RpcSmSwapClientAllocFree function exchanges the client stub's memory-allocation and memory-freeing mechanisms with those supplied by the client.
     * @param {Pointer<RPC_CLIENT_ALLOC>} ClientAlloc New memory-allocation function.
     * @param {Pointer<RPC_CLIENT_FREE>} ClientFree New memory-releasing function.
     * @param {Pointer<RPC_CLIENT_ALLOC>} OldClientAlloc Returns the previous memory-allocation function before the call to this function.
     * @param {Pointer<RPC_CLIENT_FREE>} OldClientFree Returns the previous memory-releasing function before the call to this function.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_ARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//rpcndr/nf-rpcndr-rpcsmswapclientallocfree
     * @since windows5.0
     */
    static RpcSmSwapClientAllocFree(ClientAlloc, ClientFree, OldClientAlloc, OldClientFree) {
        result := DllCall("RPCRT4.dll\RpcSmSwapClientAllocFree", "ptr", ClientAlloc, "ptr", ClientFree, "ptr", OldClientAlloc, "ptr", OldClientFree, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pMessage 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdrRpcSsEnableAllocate(pMessage) {
        DllCall("RPCRT4.dll\NdrRpcSsEnableAllocate", "ptr", pMessage)
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pMessage 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdrRpcSsDisableAllocate(pMessage) {
        DllCall("RPCRT4.dll\NdrRpcSsDisableAllocate", "ptr", pMessage)
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pMessage 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdrRpcSmSetClientToOsf(pMessage) {
        DllCall("RPCRT4.dll\NdrRpcSmSetClientToOsf", "ptr", pMessage)
    }

    /**
     * 
     * @param {Pointer} Size 
     * @returns {Pointer<Void>} 
     */
    static NdrRpcSmClientAllocate(Size) {
        result := DllCall("RPCRT4.dll\NdrRpcSmClientAllocate", "ptr", Size, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} NodeToFree 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdrRpcSmClientFree(NodeToFree) {
        DllCall("RPCRT4.dll\NdrRpcSmClientFree", "ptr", NodeToFree)
    }

    /**
     * 
     * @param {Pointer} Size 
     * @returns {Pointer<Void>} 
     */
    static NdrRpcSsDefaultAllocate(Size) {
        result := DllCall("RPCRT4.dll\NdrRpcSsDefaultAllocate", "ptr", Size, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} NodeToFree 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdrRpcSsDefaultFree(NodeToFree) {
        DllCall("RPCRT4.dll\NdrRpcSsDefaultFree", "ptr", NodeToFree)
    }

    /**
     * 
     * @param {Integer} NumberOfPointers 
     * @param {Integer} XlatSide 
     * @returns {Pointer<FULL_PTR_XLAT_TABLES>} 
     */
    static NdrFullPointerXlatInit(NumberOfPointers, XlatSide) {
        result := DllCall("RPCRT4.dll\NdrFullPointerXlatInit", "uint", NumberOfPointers, "int", XlatSide, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<FULL_PTR_XLAT_TABLES>} pXlatTables 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdrFullPointerXlatFree(pXlatTables) {
        DllCall("RPCRT4.dll\NdrFullPointerXlatFree", "ptr", pXlatTables)
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer} Len 
     * @returns {Pointer<Void>} 
     */
    static NdrAllocate(pStubMsg, Len) {
        result := DllCall("RPCRT4.dll\NdrAllocate", "ptr", pStubMsg, "ptr", Len, "ptr")
        return result
    }

    /**
     * The NdrClearOutParameters function frees resources of the out parameter and clears its memory if the RPC call to the server fails.
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg Pointer to <a href="https://docs.microsoft.com/windows/desktop/api/rpcndr/ns-rpcndr-midl_stub_message">MIDL_STUB_MESSAGE</a> structure that maintains the current status of the RPC stub. The structure is for internal use only and should not be modified.
     * @param {Pointer<Byte>} pFormat Pointer to the format string description.
     * @param {Pointer<Void>} ArgAddr Pointer to the out parameter to be freed.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//rpcndr/nf-rpcndr-ndrclearoutparameters
     * @since windows5.0
     */
    static NdrClearOutParameters(pStubMsg, pFormat, ArgAddr) {
        DllCall("RPCRT4.dll\NdrClearOutParameters", "ptr", pStubMsg, "char*", pFormat, "ptr", ArgAddr)
    }

    /**
     * The NdrOleAllocate function is used by RPC to allocate memory for an object interface. This function is a wrapper for the CoTaskMemAlloc function.
     * @param {Pointer} Size Memory to allocate, in bytes.
     * @returns {Pointer<Void>} Returns a void pointer to the allocated space upon success. Returns null upon failure due to insufficient memory.
     * @see https://docs.microsoft.com/windows/win32/api//rpcndr/nf-rpcndr-ndroleallocate
     * @since windows5.0
     */
    static NdrOleAllocate(Size) {
        result := DllCall("RPCRT4.dll\NdrOleAllocate", "ptr", Size, "ptr")
        return result
    }

    /**
     * The NdrOleFree function is a wrapper for the CoTaskMemFree function.
     * @param {Pointer<Void>} NodeToFree Pointer to the memory to be freed.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//rpcndr/nf-rpcndr-ndrolefree
     * @since windows5.0
     */
    static NdrOleFree(NodeToFree) {
        DllCall("RPCRT4.dll\NdrOleFree", "ptr", NodeToFree)
    }

    /**
     * The NdrGetUserMarshalInfo function provides additional information to wire_marshal and user_marshal helper functions.
     * @param {Pointer<UInt32>} pFlags Pointer by the same name that RPC passed to the helper function.
     * @param {Integer} InformationLevel Desired level of detail to be received. Different levels imply different sets of information fields. Only level 1 is currently defined.
     * @param {Pointer<NDR_USER_MARSHAL_INFO>} pMarshalInfo Address of a memory buffer, supplied by the application, to receive the requested information. The buffer must be at least as large as the information structure indicated by <i>InformationLevel</i>.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_ARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one of the arguments was not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_X_INVALID_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Current marshaling buffer was not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//rpcndr/nf-rpcndr-ndrgetusermarshalinfo
     * @since windows5.0
     */
    static NdrGetUserMarshalInfo(pFlags, InformationLevel, pMarshalInfo) {
        result := DllCall("RPCRT4.dll\NdrGetUserMarshalInfo", "uint*", pFlags, "uint", InformationLevel, "ptr", pMarshalInfo, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IRpcStubBuffer>} pStub 
     * @param {Pointer<RPC_SERVER_INTERFACE>} pServerIf 
     * @returns {Integer} 
     */
    static NdrCreateServerInterfaceFromStub(pStub, pServerIf) {
        result := DllCall("RPCRT4.dll\NdrCreateServerInterfaceFromStub", "ptr", pStub, "ptr", pServerIf, "int")
        return result
    }

    /**
     * NdrClientCall3 may be altered or unavailable.
     * @param {Pointer<MIDL_STUBLESS_PROXY_INFO>} pProxyInfo Reserved.
     * @param {Integer} nProcNum Reserved.
     * @param {Pointer<Void>} pReturnValue Reserved.
     * @returns {CLIENT_CALL_RETURN} Reserved.
     * @see https://docs.microsoft.com/windows/win32/api//rpcndr/nf-rpcndr-ndrclientcall3
     * @since windows5.0
     */
    static NdrClientCall3(pProxyInfo, nProcNum, pReturnValue) {
        result := DllCall("RPCRT4.dll\NdrClientCall3", "ptr", pProxyInfo, "uint", nProcNum, "ptr", pReturnValue, "CDecl ptr")
        return result
    }

    /**
     * Ndr64AsyncClientCall is not intended to be directly called by applications.
     * @param {Pointer<MIDL_STUBLESS_PROXY_INFO>} pProxyInfo Reserved.
     * @param {Integer} nProcNum Reserved.
     * @param {Pointer<Void>} pReturnValue Reserved.
     * @returns {CLIENT_CALL_RETURN} Reserved.
     * @see https://docs.microsoft.com/windows/win32/api//rpcndr/nf-rpcndr-ndr64asyncclientcall
     * @since windows5.1.2600
     */
    static Ndr64AsyncClientCall(pProxyInfo, nProcNum, pReturnValue) {
        result := DllCall("RPCRT4.dll\Ndr64AsyncClientCall", "ptr", pProxyInfo, "uint", nProcNum, "ptr", pReturnValue, "CDecl ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<MIDL_STUBLESS_PROXY_INFO>} pProxyInfo 
     * @param {Integer} nProcNum 
     * @param {Pointer<Void>} pReturnValue 
     * @returns {CLIENT_CALL_RETURN} 
     */
    static Ndr64DcomAsyncClientCall(pProxyInfo, nProcNum, pReturnValue) {
        result := DllCall("RPCRT4.dll\Ndr64DcomAsyncClientCall", "ptr", pProxyInfo, "uint", nProcNum, "ptr", pReturnValue, "CDecl ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<RPC_MESSAGE>} pRpcMsg 
     * @returns {String} Nothing - always returns an empty string
     */
    static Ndr64AsyncServerCall64(pRpcMsg) {
        DllCall("RPCRT4.dll\Ndr64AsyncServerCall64", "ptr", pRpcMsg)
    }

    /**
     * Ndr64AsyncServerCallAll is not intended to be directly called by applications.
     * @param {Pointer<RPC_MESSAGE>} pRpcMsg Reserved.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//rpcndr/nf-rpcndr-ndr64asyncservercallall
     * @since windows5.1.2600
     */
    static Ndr64AsyncServerCallAll(pRpcMsg) {
        DllCall("RPCRT4.dll\Ndr64AsyncServerCallAll", "ptr", pRpcMsg)
    }

    /**
     * 
     * @param {Pointer<IRpcStubBuffer>} pThis 
     * @param {Pointer<IRpcChannelBuffer>} pChannel 
     * @param {Pointer<RPC_MESSAGE>} pRpcMsg 
     * @param {Pointer<UInt32>} pdwStubPhase 
     * @returns {Integer} 
     */
    static Ndr64DcomAsyncStubCall(pThis, pChannel, pRpcMsg, pdwStubPhase) {
        result := DllCall("RPCRT4.dll\Ndr64DcomAsyncStubCall", "ptr", pThis, "ptr", pChannel, "ptr", pRpcMsg, "uint*", pdwStubPhase, "int")
        return result
    }

    /**
     * NdrStubCall3 is not intended to be directly called by applications.
     * @param {Pointer<Void>} pThis Reserved.
     * @param {Pointer<Void>} pChannel Reserved.
     * @param {Pointer<RPC_MESSAGE>} pRpcMsg Reserved.
     * @param {Pointer<UInt32>} pdwStubPhase Reserved.
     * @returns {Integer} Reserved.
     * @see https://docs.microsoft.com/windows/win32/api//rpcndr/nf-rpcndr-ndrstubcall3
     * @since windows5.1.2600
     */
    static NdrStubCall3(pThis, pChannel, pRpcMsg, pdwStubPhase) {
        result := DllCall("RPCRT4.dll\NdrStubCall3", "ptr", pThis, "ptr", pChannel, "ptr", pRpcMsg, "uint*", pdwStubPhase, "int")
        return result
    }

    /**
     * NdrServerCallAll is not intended to be directly called by applications.
     * @param {Pointer<RPC_MESSAGE>} pRpcMsg Reserved.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//rpcndr/nf-rpcndr-ndrservercallall
     * @since windows5.1.2600
     */
    static NdrServerCallAll(pRpcMsg) {
        DllCall("RPCRT4.dll\NdrServerCallAll", "ptr", pRpcMsg)
    }

    /**
     * 
     * @param {Pointer<RPC_MESSAGE>} pRpcMsg 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdrServerCallNdr64(pRpcMsg) {
        DllCall("RPCRT4.dll\NdrServerCallNdr64", "ptr", pRpcMsg)
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer<Void>} pMemory 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdrPartialIgnoreClientMarshall(pStubMsg, pMemory) {
        DllCall("RPCRT4.dll\NdrPartialIgnoreClientMarshall", "ptr", pStubMsg, "ptr", pMemory)
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer<Void>} ppMemory 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdrPartialIgnoreServerUnmarshall(pStubMsg, ppMemory) {
        DllCall("RPCRT4.dll\NdrPartialIgnoreServerUnmarshall", "ptr", pStubMsg, "ptr", ppMemory)
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer<Void>} pMemory 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdrPartialIgnoreClientBufferSize(pStubMsg, pMemory) {
        DllCall("RPCRT4.dll\NdrPartialIgnoreClientBufferSize", "ptr", pStubMsg, "ptr", pMemory)
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} pStubMsg 
     * @param {Pointer<Void>} ppMemory 
     * @param {Pointer<Byte>} pFormat 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdrPartialIgnoreServerInitialize(pStubMsg, ppMemory, pFormat) {
        DllCall("RPCRT4.dll\NdrPartialIgnoreServerInitialize", "ptr", pStubMsg, "ptr", ppMemory, "char*", pFormat)
    }

    /**
     * RpcUserFree may be altered or unavailable.
     * @param {Pointer<Void>} AsyncHandle Reserved.
     * @param {Pointer<Void>} pBuffer Reserved.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//rpcndr/nf-rpcndr-rpcuserfree
     * @since windows5.1.2600
     */
    static RpcUserFree(AsyncHandle, pBuffer) {
        DllCall("RPCRT4.dll\RpcUserFree", "ptr", AsyncHandle, "ptr", pBuffer)
    }

    /**
     * The MesEncodeIncrementalHandleCreate function creates an encoding and then initializes it for the incremental style of serialization.
     * @param {Pointer<Void>} UserState Pointer to the user-supplied state object that coordinates the user-supplied <b>Alloc</b>, <b>Write</b>, and <b>Read</b> functions.
     * @param {Pointer<MIDL_ES_ALLOC>} AllocFn Pointer to the user-supplied <b>Alloc</b> function.
     * @param {Pointer<MIDL_ES_WRITE>} WriteFn Pointer to the user-supplied <b>Write</b> function.
     * @param {Pointer<Void>} pHandle Pointer to the newly created handle.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_ARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument was invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OUT_OF_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Out of memory.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//midles/nf-midles-mesencodeincrementalhandlecreate
     * @since windows5.0
     */
    static MesEncodeIncrementalHandleCreate(UserState, AllocFn, WriteFn, pHandle) {
        result := DllCall("RPCRT4.dll\MesEncodeIncrementalHandleCreate", "ptr", UserState, "ptr", AllocFn, "ptr", WriteFn, "ptr", pHandle, "int")
        return result
    }

    /**
     * The MesDecodeIncrementalHandleCreate function creates a decoding handle for the incremental style of serialization.
     * @param {Pointer<Void>} UserState Pointer to the user-supplied state object that coordinates the user-supplied <b>Alloc</b>, <b>Write</b>, and <b>Read</b> functions.
     * @param {Pointer<MIDL_ES_READ>} ReadFn Pointer to the <b>Read</b> function.
     * @param {Pointer<Void>} pHandle Pointer to the newly created handle.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_ARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument was invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OUT_OF_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Out of memory.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//midles/nf-midles-mesdecodeincrementalhandlecreate
     * @since windows5.0
     */
    static MesDecodeIncrementalHandleCreate(UserState, ReadFn, pHandle) {
        result := DllCall("RPCRT4.dll\MesDecodeIncrementalHandleCreate", "ptr", UserState, "ptr", ReadFn, "ptr", pHandle, "int")
        return result
    }

    /**
     * The MesIncrementalHandleReset function re-initializes the handle for incremental serialization.
     * @param {Pointer<Void>} Handle Handle to be re-initialized.
     * @param {Pointer<Void>} UserState Depending on the function, pointer to the user-supplied block that coordinates successive calls to the user-supplied <b>Alloc</b>, <b>Write</b>, and <b>Read</b> functions.
     * @param {Pointer<MIDL_ES_ALLOC>} AllocFn Pointer to the user-supplied <b>Alloc</b> function. This parameter can be <b>NULL</b> if the operation does not require it, or if the handle was previously initiated with the pointer.
     * @param {Pointer<MIDL_ES_WRITE>} WriteFn Pointer to the user-supplied <b>Write</b> function. This parameter can be <b>NULL</b> if the operation does not require it, or if the handle was previously initiated with the pointer.
     * @param {Pointer<MIDL_ES_READ>} ReadFn Pointer to the user-supplied <b>Read</b> function. This parameter can be <b>NULL</b> if the operation does not require it, or if the handle was previously initiated with the pointer.
     * @param {Integer} Operation Specifies the operation. Valid operations are <b>MES_ENCODE</b>, <b>MES_ENCODE_NDR64</b>, or <b>MES_DECODE</b>.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_ARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument was invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OUT_OF_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Out of memory.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//midles/nf-midles-mesincrementalhandlereset
     * @since windows5.0
     */
    static MesIncrementalHandleReset(Handle, UserState, AllocFn, WriteFn, ReadFn, Operation) {
        result := DllCall("RPCRT4.dll\MesIncrementalHandleReset", "ptr", Handle, "ptr", UserState, "ptr", AllocFn, "ptr", WriteFn, "ptr", ReadFn, "int", Operation, "int")
        return result
    }

    /**
     * The MesEncodeFixedBufferHandleCreate function creates an encoding handle and then initializes it for a fixed buffer style of serialization.
     * @param {Pointer} pBuffer Pointer to the user-supplied buffer.
     * @param {Integer} BufferSize Size of the user-supplied buffer, in bytes.
     * @param {Pointer<UInt32>} pEncodedSize Pointer to the size of the completed encoding. The size will be written to the pointee by the subsequent encoding operation(s).
     * @param {Pointer<Void>} pHandle Pointer to the newly created handle.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_ARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument was invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OUT_OF_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Out of memory.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//midles/nf-midles-mesencodefixedbufferhandlecreate
     * @since windows5.0
     */
    static MesEncodeFixedBufferHandleCreate(pBuffer, BufferSize, pEncodedSize, pHandle) {
        result := DllCall("RPCRT4.dll\MesEncodeFixedBufferHandleCreate", "ptr", pBuffer, "uint", BufferSize, "uint*", pEncodedSize, "ptr", pHandle, "int")
        return result
    }

    /**
     * The MesEncodeDynBufferHandleCreate function creates an encoding handle and then initializes it for a dynamic buffer style of serialization.
     * @param {Pointer<SByte>} pBuffer Pointer to a pointer to the stub-supplied buffer containing the encoding after serialization is complete.
     * @param {Pointer<UInt32>} pEncodedSize Pointer to the size of the completed encoding. The size will be written to the memory location pointed to by <i>pEncodedSize</i> by subsequent encoding operations.
     * @param {Pointer<Void>} pHandle Pointer to the address to which the handle will be written.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_ARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument was invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OUT_OF_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Out of memory.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//midles/nf-midles-mesencodedynbufferhandlecreate
     * @since windows5.0
     */
    static MesEncodeDynBufferHandleCreate(pBuffer, pEncodedSize, pHandle) {
        result := DllCall("RPCRT4.dll\MesEncodeDynBufferHandleCreate", "char*", pBuffer, "uint*", pEncodedSize, "ptr", pHandle, "int")
        return result
    }

    /**
     * The MesDecodeBufferHandleCreate function creates a decoding handle and initializes it for a (fixed) buffer style of serialization.
     * @param {Pointer} Buffer Pointer to the buffer containing the data to decode.
     * @param {Integer} BufferSize Bytes of data to decode in the buffer.
     * @param {Pointer<Void>} pHandle Pointer to the address to which the handle will be written.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_ARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument was not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OUT_OF_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Out of memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_X_INVALID_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer was not valid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//midles/nf-midles-mesdecodebufferhandlecreate
     * @since windows5.0
     */
    static MesDecodeBufferHandleCreate(Buffer, BufferSize, pHandle) {
        result := DllCall("RPCRT4.dll\MesDecodeBufferHandleCreate", "ptr", Buffer, "uint", BufferSize, "ptr", pHandle, "int")
        return result
    }

    /**
     * The MesBufferHandleReset function re-initializes the handle for buffer serialization.
     * @param {Pointer<Void>} Handle Handle to be initialized.
     * @param {Integer} HandleStyle Style of <i>Handle</i>. Valid styles are <b>MES_FIXED_BUFFER_HANDLE</b> or <b>MES_DYNAMIC_BUFFER_HANDLE</b>.
     * @param {Integer} Operation Operation code. Valid codes are <b>MES_ENCODE</b>, <b>MES_ENCODE_NDR64</b>, or <b>MES_DECODE</b>.
     * @param {Pointer} pBuffer For <b>MES_DECODE</b>, pointer to a pointer to the buffer containing the data to be decoded. 
     * 
     * 
     * 
     * 
     * For <b>MES_ENCODE</b>, pointer to a pointer to the buffer for 
     * <a href="https://docs.microsoft.com/windows/desktop/Rpc/fixed-buffer-serialization">fixed buffer style</a>, and pointer to a pointer to return the buffer address for 
     * <a href="https://docs.microsoft.com/windows/desktop/Rpc/dynamic-buffer-serialization">dynamic buffer style of serialization</a>.
     * 
     * For <b>MES_ENCODE_NDR64</b>, pointer to a pointer to the buffer for fixed buffer style, and pointer to a pointer to return the buffer address for dynamic buffer style of serialization, but explicitly uses NDR64 to encode the buffer. The user-provided buffer must be aligned to 16.
     * @param {Integer} BufferSize Bytes of data to be decoded in the buffer. Note that this is used only for the fixed buffer style of serialization.
     * @param {Pointer<UInt32>} pEncodedSize Pointer to the size of the completed encoding. Note that this is used only when the operation is <b>MES_ENCODE</b> or <b>MES_ENCODE_NDR64</b>.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_ARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument was invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//midles/nf-midles-mesbufferhandlereset
     * @since windows5.0
     */
    static MesBufferHandleReset(Handle, HandleStyle, Operation, pBuffer, BufferSize, pEncodedSize) {
        result := DllCall("RPCRT4.dll\MesBufferHandleReset", "ptr", Handle, "uint", HandleStyle, "int", Operation, "ptr", pBuffer, "uint", BufferSize, "uint*", pEncodedSize, "int")
        return result
    }

    /**
     * The MesHandleFree function frees the memory allocated by the serialization handle.
     * @param {Pointer<Void>} Handle Handle to be freed.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//midles/nf-midles-meshandlefree
     * @since windows5.0
     */
    static MesHandleFree(Handle) {
        result := DllCall("RPCRT4.dll\MesHandleFree", "ptr", Handle, "int")
        return result
    }

    /**
     * The MesInqProcEncodingId function provides the identity of an encoding.
     * @param {Pointer<Void>} Handle An encoding or decoding handle.
     * @param {Pointer<RPC_SYNTAX_IDENTIFIER>} pInterfaceId Pointer to the address in which the identity of the interface used to encode the data will be written. The <i>pInterfaceId</i> consists of the interface universally unique identifier 
     * <a href="https://docs.microsoft.com/windows/win32/rpc/rpcdce/ns-rpcdce-uuid">UUID</a> and the version number.
     * @param {Pointer<UInt32>} pProcNum Number of the function used to encode the data.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_ARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument was not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_OUT_OF_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Out of memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_UNKNOWN_IF</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unknown interface.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_UNSUPPORTED_TRANS_SYN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Transfer syntax not supported by server.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_X_INVALID_ES_ACTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Operation for a given handle was not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_X_WRONG_ES_VERSION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Incompatible version of the serializing package.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_X_SS_INVALID_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Buffer not valid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  For a list of valid error codes, see 
     * <a href="/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//midles/nf-midles-mesinqprocencodingid
     * @since windows5.0
     */
    static MesInqProcEncodingId(Handle, pInterfaceId, pProcNum) {
        result := DllCall("RPCRT4.dll\MesInqProcEncodingId", "ptr", Handle, "ptr", pInterfaceId, "uint*", pProcNum, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} param0 
     * @returns {Pointer} 
     */
    static NdrMesSimpleTypeAlignSize(param0) {
        result := DllCall("RPCRT4.dll\NdrMesSimpleTypeAlignSize", "ptr", param0, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Handle 
     * @param {Pointer<Void>} pObject 
     * @param {Integer} Size 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdrMesSimpleTypeDecode(Handle, pObject, Size) {
        DllCall("RPCRT4.dll\NdrMesSimpleTypeDecode", "ptr", Handle, "ptr", pObject, "short", Size)
    }

    /**
     * 
     * @param {Pointer<Void>} Handle 
     * @param {Pointer<MIDL_STUB_DESC>} pStubDesc 
     * @param {Pointer<Void>} pObject 
     * @param {Integer} Size 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdrMesSimpleTypeEncode(Handle, pStubDesc, pObject, Size) {
        DllCall("RPCRT4.dll\NdrMesSimpleTypeEncode", "ptr", Handle, "ptr", pStubDesc, "ptr", pObject, "short", Size)
    }

    /**
     * 
     * @param {Pointer<Void>} Handle 
     * @param {Pointer<MIDL_STUB_DESC>} pStubDesc 
     * @param {Pointer<Byte>} pFormatString 
     * @param {Pointer<Void>} pObject 
     * @returns {Pointer} 
     */
    static NdrMesTypeAlignSize(Handle, pStubDesc, pFormatString, pObject) {
        result := DllCall("RPCRT4.dll\NdrMesTypeAlignSize", "ptr", Handle, "ptr", pStubDesc, "char*", pFormatString, "ptr", pObject, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Handle 
     * @param {Pointer<MIDL_STUB_DESC>} pStubDesc 
     * @param {Pointer<Byte>} pFormatString 
     * @param {Pointer<Void>} pObject 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdrMesTypeEncode(Handle, pStubDesc, pFormatString, pObject) {
        DllCall("RPCRT4.dll\NdrMesTypeEncode", "ptr", Handle, "ptr", pStubDesc, "char*", pFormatString, "ptr", pObject)
    }

    /**
     * 
     * @param {Pointer<Void>} Handle 
     * @param {Pointer<MIDL_STUB_DESC>} pStubDesc 
     * @param {Pointer<Byte>} pFormatString 
     * @param {Pointer<Void>} pObject 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdrMesTypeDecode(Handle, pStubDesc, pFormatString, pObject) {
        DllCall("RPCRT4.dll\NdrMesTypeDecode", "ptr", Handle, "ptr", pStubDesc, "char*", pFormatString, "ptr", pObject)
    }

    /**
     * 
     * @param {Pointer<Void>} Handle 
     * @param {Pointer<MIDL_TYPE_PICKLING_INFO>} pPicklingInfo 
     * @param {Pointer<MIDL_STUB_DESC>} pStubDesc 
     * @param {Pointer<Byte>} pFormatString 
     * @param {Pointer<Void>} pObject 
     * @returns {Pointer} 
     */
    static NdrMesTypeAlignSize2(Handle, pPicklingInfo, pStubDesc, pFormatString, pObject) {
        result := DllCall("RPCRT4.dll\NdrMesTypeAlignSize2", "ptr", Handle, "ptr", pPicklingInfo, "ptr", pStubDesc, "char*", pFormatString, "ptr", pObject, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Handle 
     * @param {Pointer<MIDL_TYPE_PICKLING_INFO>} pPicklingInfo 
     * @param {Pointer<MIDL_STUB_DESC>} pStubDesc 
     * @param {Pointer<Byte>} pFormatString 
     * @param {Pointer<Void>} pObject 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdrMesTypeEncode2(Handle, pPicklingInfo, pStubDesc, pFormatString, pObject) {
        DllCall("RPCRT4.dll\NdrMesTypeEncode2", "ptr", Handle, "ptr", pPicklingInfo, "ptr", pStubDesc, "char*", pFormatString, "ptr", pObject)
    }

    /**
     * 
     * @param {Pointer<Void>} Handle 
     * @param {Pointer<MIDL_TYPE_PICKLING_INFO>} pPicklingInfo 
     * @param {Pointer<MIDL_STUB_DESC>} pStubDesc 
     * @param {Pointer<Byte>} pFormatString 
     * @param {Pointer<Void>} pObject 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdrMesTypeDecode2(Handle, pPicklingInfo, pStubDesc, pFormatString, pObject) {
        DllCall("RPCRT4.dll\NdrMesTypeDecode2", "ptr", Handle, "ptr", pPicklingInfo, "ptr", pStubDesc, "char*", pFormatString, "ptr", pObject)
    }

    /**
     * 
     * @param {Pointer<Void>} Handle 
     * @param {Pointer<MIDL_TYPE_PICKLING_INFO>} pPicklingInfo 
     * @param {Pointer<MIDL_STUB_DESC>} pStubDesc 
     * @param {Pointer<Byte>} pFormatString 
     * @param {Pointer<Void>} pObject 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdrMesTypeFree2(Handle, pPicklingInfo, pStubDesc, pFormatString, pObject) {
        DllCall("RPCRT4.dll\NdrMesTypeFree2", "ptr", Handle, "ptr", pPicklingInfo, "ptr", pStubDesc, "char*", pFormatString, "ptr", pObject)
    }

    /**
     * 
     * @param {Pointer<Void>} Handle 
     * @param {Pointer<MIDL_STUB_DESC>} pStubDesc 
     * @param {Pointer<Byte>} pFormatString 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdrMesProcEncodeDecode(Handle, pStubDesc, pFormatString) {
        DllCall("RPCRT4.dll\NdrMesProcEncodeDecode", "ptr", Handle, "ptr", pStubDesc, "char*", pFormatString, "CDecl ")
    }

    /**
     * NdrMesProcEncodeDecode2 may be altered or unavailable.
     * @param {Pointer<Void>} Handle Reserved.
     * @param {Pointer<MIDL_STUB_DESC>} pStubDesc Reserved.
     * @param {Pointer<Byte>} pFormatString Reserved.
     * @returns {CLIENT_CALL_RETURN} Reserved.
     * @see https://docs.microsoft.com/windows/win32/api//midles/nf-midles-ndrmesprocencodedecode2
     * @since windows5.0
     */
    static NdrMesProcEncodeDecode2(Handle, pStubDesc, pFormatString) {
        result := DllCall("RPCRT4.dll\NdrMesProcEncodeDecode2", "ptr", Handle, "ptr", pStubDesc, "char*", pFormatString, "CDecl ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Handle 
     * @param {Pointer<MIDL_TYPE_PICKLING_INFO>} pPicklingInfo 
     * @param {Pointer<MIDL_STUBLESS_PROXY_INFO>} pProxyInfo 
     * @param {Pointer<UInt32>} ArrTypeOffset 
     * @param {Integer} nTypeIndex 
     * @param {Pointer<Void>} pObject 
     * @returns {Pointer} 
     */
    static NdrMesTypeAlignSize3(Handle, pPicklingInfo, pProxyInfo, ArrTypeOffset, nTypeIndex, pObject) {
        result := DllCall("RPCRT4.dll\NdrMesTypeAlignSize3", "ptr", Handle, "ptr", pPicklingInfo, "ptr", pProxyInfo, "uint*", ArrTypeOffset, "uint", nTypeIndex, "ptr", pObject, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Handle 
     * @param {Pointer<MIDL_TYPE_PICKLING_INFO>} pPicklingInfo 
     * @param {Pointer<MIDL_STUBLESS_PROXY_INFO>} pProxyInfo 
     * @param {Pointer<UInt32>} ArrTypeOffset 
     * @param {Integer} nTypeIndex 
     * @param {Pointer<Void>} pObject 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdrMesTypeEncode3(Handle, pPicklingInfo, pProxyInfo, ArrTypeOffset, nTypeIndex, pObject) {
        DllCall("RPCRT4.dll\NdrMesTypeEncode3", "ptr", Handle, "ptr", pPicklingInfo, "ptr", pProxyInfo, "uint*", ArrTypeOffset, "uint", nTypeIndex, "ptr", pObject)
    }

    /**
     * 
     * @param {Pointer<Void>} Handle 
     * @param {Pointer<MIDL_TYPE_PICKLING_INFO>} pPicklingInfo 
     * @param {Pointer<MIDL_STUBLESS_PROXY_INFO>} pProxyInfo 
     * @param {Pointer<UInt32>} ArrTypeOffset 
     * @param {Integer} nTypeIndex 
     * @param {Pointer<Void>} pObject 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdrMesTypeDecode3(Handle, pPicklingInfo, pProxyInfo, ArrTypeOffset, nTypeIndex, pObject) {
        DllCall("RPCRT4.dll\NdrMesTypeDecode3", "ptr", Handle, "ptr", pPicklingInfo, "ptr", pProxyInfo, "uint*", ArrTypeOffset, "uint", nTypeIndex, "ptr", pObject)
    }

    /**
     * 
     * @param {Pointer<Void>} Handle 
     * @param {Pointer<MIDL_TYPE_PICKLING_INFO>} pPicklingInfo 
     * @param {Pointer<MIDL_STUBLESS_PROXY_INFO>} pProxyInfo 
     * @param {Pointer<UInt32>} ArrTypeOffset 
     * @param {Integer} nTypeIndex 
     * @param {Pointer<Void>} pObject 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdrMesTypeFree3(Handle, pPicklingInfo, pProxyInfo, ArrTypeOffset, nTypeIndex, pObject) {
        DllCall("RPCRT4.dll\NdrMesTypeFree3", "ptr", Handle, "ptr", pPicklingInfo, "ptr", pProxyInfo, "uint*", ArrTypeOffset, "uint", nTypeIndex, "ptr", pObject)
    }

    /**
     * 
     * @param {Pointer<Void>} Handle 
     * @param {Pointer<MIDL_STUBLESS_PROXY_INFO>} pProxyInfo 
     * @param {Integer} nProcNum 
     * @param {Pointer<Void>} pReturnValue 
     * @returns {CLIENT_CALL_RETURN} 
     */
    static NdrMesProcEncodeDecode3(Handle, pProxyInfo, nProcNum, pReturnValue) {
        result := DllCall("RPCRT4.dll\NdrMesProcEncodeDecode3", "ptr", Handle, "ptr", pProxyInfo, "uint", nProcNum, "ptr", pReturnValue, "CDecl ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Handle 
     * @param {Pointer<MIDL_STUBLESS_PROXY_INFO>} pProxyInfo 
     * @param {Pointer<Void>} pObject 
     * @param {Integer} Size 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdrMesSimpleTypeDecodeAll(Handle, pProxyInfo, pObject, Size) {
        DllCall("RPCRT4.dll\NdrMesSimpleTypeDecodeAll", "ptr", Handle, "ptr", pProxyInfo, "ptr", pObject, "short", Size)
    }

    /**
     * 
     * @param {Pointer<Void>} Handle 
     * @param {Pointer<MIDL_STUBLESS_PROXY_INFO>} pProxyInfo 
     * @param {Pointer<Void>} pObject 
     * @param {Integer} Size 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdrMesSimpleTypeEncodeAll(Handle, pProxyInfo, pObject, Size) {
        DllCall("RPCRT4.dll\NdrMesSimpleTypeEncodeAll", "ptr", Handle, "ptr", pProxyInfo, "ptr", pObject, "short", Size)
    }

    /**
     * 
     * @param {Pointer<Void>} Handle 
     * @param {Pointer<MIDL_STUBLESS_PROXY_INFO>} pProxyInfo 
     * @returns {Pointer} 
     */
    static NdrMesSimpleTypeAlignSizeAll(Handle, pProxyInfo) {
        result := DllCall("RPCRT4.dll\NdrMesSimpleTypeAlignSizeAll", "ptr", Handle, "ptr", pProxyInfo, "ptr")
        return result
    }

    /**
     * Server programs use the RpcCertGeneratePrincipalName function to generate principal names for security certificates.
     * @param {Pointer<CERT_CONTEXT>} Context Pointer to the security-certificate context.
     * @param {Integer} Flags Currently, the only valid flag for this parameter is RPC_C_FULL_CERT_CHAIN. Using this flag causes the principal name to be generated in fullsic format.
     * @param {Pointer<PWSTR>} pBuffer Pointer to a pointer. The 
     * <b>RpcCertGeneratePrincipalName</b> function sets this to point at a null-terminated string that contains the 
     * <a href="https://docs.microsoft.com/windows/desktop/Rpc/principal-names">principal name</a>.
     * @returns {Integer} This function does not return a value.
     * @see https://docs.microsoft.com/windows/win32/api//rpcssl/nf-rpcssl-rpccertgenerateprincipalnamew
     * @since windows5.0
     */
    static RpcCertGeneratePrincipalNameW(Context, Flags, pBuffer) {
        result := DllCall("RPCRT4.dll\RpcCertGeneratePrincipalNameW", "ptr", Context, "uint", Flags, "ptr", pBuffer, "int")
        return result
    }

    /**
     * Server programs use the RpcCertGeneratePrincipalName function to generate principal names for security certificates.
     * @param {Pointer<CERT_CONTEXT>} Context Pointer to the security-certificate context.
     * @param {Integer} Flags Currently, the only valid flag for this parameter is RPC_C_FULL_CERT_CHAIN. Using this flag causes the principal name to be generated in fullsic format.
     * @param {Pointer<PSTR>} pBuffer Pointer to a pointer. The 
     * <b>RpcCertGeneratePrincipalName</b> function sets this to point at a null-terminated string that contains the 
     * <a href="https://docs.microsoft.com/windows/desktop/Rpc/principal-names">principal name</a>.
     * @returns {Integer} This function does not return a value.
     * @see https://docs.microsoft.com/windows/win32/api//rpcssl/nf-rpcssl-rpccertgenerateprincipalnamea
     * @since windows5.0
     */
    static RpcCertGeneratePrincipalNameA(Context, Flags, pBuffer) {
        result := DllCall("RPCRT4.dll\RpcCertGeneratePrincipalNameA", "ptr", Context, "uint", Flags, "ptr", pBuffer, "int")
        return result
    }

;@endregion Methods
}
