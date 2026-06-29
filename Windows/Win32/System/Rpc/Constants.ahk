#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

/**
 * @namespace Windows.Win32.System.Rpc
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_BINDING_INFINITE_TIMEOUT := 10

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_BINDING_MIN_TIMEOUT := 0

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_BINDING_DEFAULT_TIMEOUT := 5

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_BINDING_MAX_TIMEOUT := 9

/**
 * @type {Integer (Int32)}
 */
export global RPC_C_CANCEL_INFINITE_TIMEOUT := -1

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_LISTEN_MAX_CALLS_DEFAULT := 1234

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_PROTSEQ_MAX_REQS_DEFAULT := 10

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_BIND_TO_ALL_NICS := 1

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_USE_INTERNET_PORT := 1

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_USE_INTRANET_PORT := 2

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_DONT_FAIL := 4

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_RPCHTTP_USE_LOAD_BALANCE := 8

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_TRY_ENFORCE_MAX_CALLS := 16

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_MQ_TEMPORARY := 0

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_MQ_PERMANENT := 1

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_MQ_CLEAR_ON_OPEN := 2

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_MQ_USE_EXISTING_SECURITY := 4

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_MQ_AUTHN_LEVEL_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_MQ_AUTHN_LEVEL_PKT_INTEGRITY := 8

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_MQ_AUTHN_LEVEL_PKT_PRIVACY := 16

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_MQ_EXPRESS := 0

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_MQ_RECOVERABLE := 1

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_MQ_JOURNAL_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_MQ_JOURNAL_DEADLETTER := 1

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_MQ_JOURNAL_ALWAYS := 2

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_OPT_MQ_DELIVERY := 1

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_OPT_MQ_PRIORITY := 2

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_OPT_MQ_JOURNAL := 3

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_OPT_MQ_ACKNOWLEDGE := 4

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_OPT_MQ_AUTHN_SERVICE := 5

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_OPT_MQ_AUTHN_LEVEL := 6

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_OPT_MQ_TIME_TO_REACH_QUEUE := 7

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_OPT_MQ_TIME_TO_BE_RECEIVED := 8

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_OPT_BINDING_NONCAUSAL := 9

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_OPT_SECURITY_CALLBACK := 10

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_OPT_UNIQUE_BINDING := 11

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_OPT_MAX_OPTIONS := 12

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_OPT_CALL_TIMEOUT := 12

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_OPT_DONT_LINGER := 13

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_OPT_TRANS_SEND_BUFFER_SIZE := 5

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_OPT_TRUST_PEER := 14

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_OPT_ASYNC_BLOCK := 15

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_OPT_OPTIMIZE_TIME := 16

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_FULL_CERT_CHAIN := 1

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_STATS_CALLS_IN := 0

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_STATS_CALLS_OUT := 1

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_STATS_PKTS_IN := 2

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_STATS_PKTS_OUT := 3

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_AUTHN_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_AUTHN_DCE_PRIVATE := 1

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_AUTHN_DCE_PUBLIC := 2

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_AUTHN_DEC_PUBLIC := 4

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_AUTHN_GSS_NEGOTIATE := 9

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_AUTHN_WINNT := 10

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_AUTHN_GSS_SCHANNEL := 14

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_AUTHN_GSS_KERBEROS := 16

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_AUTHN_DPA := 17

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_AUTHN_MSN := 18

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_AUTHN_DIGEST := 21

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_AUTHN_KERNEL := 20

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_AUTHN_NEGO_EXTENDER := 30

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_AUTHN_PKU2U := 31

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_AUTHN_LIVE_SSP := 32

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_AUTHN_LIVEXP_SSP := 35

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_AUTHN_CLOUD_AP := 36

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_AUTHN_MSONLINE := 82

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_AUTHN_MQ := 100

/**
 * @type {Integer (Int32)}
 */
export global RPC_C_AUTHN_DEFAULT := -1

/**
 * @type {Integer (Int32)}
 */
export global RPC_C_SECURITY_QOS_VERSION := 1

/**
 * @type {Integer (Int32)}
 */
export global RPC_C_SECURITY_QOS_VERSION_1 := 1

/**
 * @type {Integer (Int32)}
 */
export global RPC_C_SECURITY_QOS_VERSION_2 := 2

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_HTTP_AUTHN_SCHEME_BASIC := 1

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_HTTP_AUTHN_SCHEME_NTLM := 2

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_HTTP_AUTHN_SCHEME_PASSPORT := 4

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_HTTP_AUTHN_SCHEME_DIGEST := 8

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_HTTP_AUTHN_SCHEME_NEGOTIATE := 16

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_HTTP_AUTHN_SCHEME_CERT := 65536

/**
 * @type {Integer (Int32)}
 */
export global RPC_C_SECURITY_QOS_VERSION_3 := 3

/**
 * @type {Integer (Int32)}
 */
export global RPC_C_SECURITY_QOS_VERSION_4 := 4

/**
 * @type {Integer (Int32)}
 */
export global RPC_C_SECURITY_QOS_VERSION_5 := 5

/**
 * @type {Integer (UInt32)}
 */
export global RPC_PROTSEQ_TCP := 1

/**
 * @type {Integer (UInt32)}
 */
export global RPC_PROTSEQ_NMP := 2

/**
 * @type {Integer (UInt32)}
 */
export global RPC_PROTSEQ_LRPC := 3

/**
 * @type {Integer (UInt32)}
 */
export global RPC_PROTSEQ_HTTP := 4

/**
 * @type {Integer (UInt32)}
 */
export global RPC_BHT_OBJECT_UUID_VALID := 1

/**
 * @type {Integer (UInt32)}
 */
export global RPC_BHO_EXCLUSIVE_AND_GUARANTEED := 4

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_AUTHZ_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_AUTHZ_NAME := 1

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_AUTHZ_DCE := 2

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_AUTHZ_DEFAULT := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global DCE_C_ERROR_STRING_LEN := 256

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_EP_ALL_ELTS := 0

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_EP_MATCH_BY_IF := 1

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_EP_MATCH_BY_OBJ := 2

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_EP_MATCH_BY_BOTH := 3

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_VERS_ALL := 1

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_VERS_COMPATIBLE := 2

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_VERS_EXACT := 3

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_VERS_MAJOR_ONLY := 4

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_VERS_UPTO := 5

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_MGMT_INQ_IF_IDS := 0

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_MGMT_INQ_PRINC_NAME := 1

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_MGMT_INQ_STATS := 2

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_MGMT_IS_SERVER_LISTEN := 3

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_MGMT_STOP_SERVER_LISTEN := 4

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_PARM_MAX_PACKET_LENGTH := 1

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_PARM_BUFFER_LENGTH := 2

/**
 * @type {Integer (UInt32)}
 */
export global RPC_IF_AUTOLISTEN := 1

/**
 * @type {Integer (UInt32)}
 */
export global RPC_IF_OLE := 2

/**
 * @type {Integer (UInt32)}
 */
export global RPC_IF_ALLOW_UNKNOWN_AUTHORITY := 4

/**
 * @type {Integer (UInt32)}
 */
export global RPC_IF_ALLOW_SECURE_ONLY := 8

/**
 * @type {Integer (UInt32)}
 */
export global RPC_IF_ALLOW_CALLBACKS_WITH_NO_AUTH := 16

/**
 * @type {Integer (UInt32)}
 */
export global RPC_IF_ALLOW_LOCAL_ONLY := 32

/**
 * @type {Integer (UInt32)}
 */
export global RPC_IF_SEC_NO_CACHE := 64

/**
 * @type {Integer (UInt32)}
 */
export global RPC_IF_SEC_CACHE_PER_PROC := 128

/**
 * @type {Integer (UInt32)}
 */
export global RPC_IF_ASYNC_CALLBACK := 256

/**
 * @type {Integer (UInt32)}
 */
export global RPC_FW_IF_FLAG_DCOM := 1

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_NOTIFY_ON_SEND_COMPLETE := 1

/**
 * @type {Integer (UInt32)}
 */
export global MaxNumberOfEEInfoParams := 4

/**
 * @type {Integer (UInt32)}
 */
export global RPC_EEINFO_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global EEInfoPreviousRecordsMissing := 1

/**
 * @type {Integer (UInt32)}
 */
export global EEInfoNextRecordsMissing := 2

/**
 * @type {Integer (UInt32)}
 */
export global EEInfoUseFileTime := 4

/**
 * @type {Integer (UInt32)}
 */
export global EEInfoGCCOM := 11

/**
 * @type {Integer (UInt32)}
 */
export global EEInfoGCFRS := 12

/**
 * @type {Integer (UInt32)}
 */
export global RPC_CALL_ATTRIBUTES_VERSION := 2

/**
 * @type {Integer (UInt32)}
 */
export global RPC_QUERY_SERVER_PRINCIPAL_NAME := 2

/**
 * @type {Integer (UInt32)}
 */
export global RPC_QUERY_CLIENT_PRINCIPAL_NAME := 4

/**
 * @type {Integer (UInt32)}
 */
export global RPC_QUERY_CALL_LOCAL_ADDRESS := 8

/**
 * @type {Integer (UInt32)}
 */
export global RPC_QUERY_CLIENT_PID := 16

/**
 * @type {Integer (UInt32)}
 */
export global RPC_QUERY_IS_CLIENT_LOCAL := 32

/**
 * @type {Integer (UInt32)}
 */
export global RPC_QUERY_NO_AUTH_REQUIRED := 64

/**
 * @type {Integer (UInt32)}
 */
export global RPC_QUERY_CLIENT_ID := 128

/**
 * @type {Integer (UInt32)}
 */
export global RPC_CALL_STATUS_CANCELLED := 1

/**
 * @type {Integer (UInt32)}
 */
export global RPC_CALL_STATUS_DISCONNECTED := 2

/**
 * @type {Integer (UInt32)}
 */
export global RPC_CONTEXT_HANDLE_DEFAULT_FLAGS := 0

/**
 * @type {Integer (UInt32)}
 */
export global RPC_CONTEXT_HANDLE_FLAGS := 805306368

/**
 * @type {Integer (UInt32)}
 */
export global RPC_CONTEXT_HANDLE_SERIALIZE := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global RPC_CONTEXT_HANDLE_DONT_SERIALIZE := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global RPC_TYPE_STRICT_CONTEXT_HANDLE := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global RPC_TYPE_DISCONNECT_EVENT_CONTEXT_HANDLE := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global RPC_NCA_FLAGS_DEFAULT := 0

/**
 * @type {Integer (UInt32)}
 */
export global RPC_NCA_FLAGS_IDEMPOTENT := 1

/**
 * @type {Integer (UInt32)}
 */
export global RPC_NCA_FLAGS_BROADCAST := 2

/**
 * @type {Integer (UInt32)}
 */
export global RPC_NCA_FLAGS_MAYBE := 4

/**
 * @type {Integer (UInt32)}
 */
export global RPCFLG_HAS_GUARANTEE := 16

/**
 * @type {Integer (UInt32)}
 */
export global RPCFLG_WINRT_REMOTE_ASYNC := 32

/**
 * @type {Integer (UInt32)}
 */
export global RPC_BUFFER_COMPLETE := 4096

/**
 * @type {Integer (UInt32)}
 */
export global RPC_BUFFER_PARTIAL := 8192

/**
 * @type {Integer (UInt32)}
 */
export global RPC_BUFFER_EXTRA := 16384

/**
 * @type {Integer (UInt32)}
 */
export global RPC_BUFFER_ASYNC := 32768

/**
 * @type {Integer (UInt32)}
 */
export global RPC_BUFFER_NONOTIFY := 65536

/**
 * @type {Integer (UInt32)}
 */
export global RPCFLG_MESSAGE := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global RPCFLG_AUTO_COMPLETE := 134217728

/**
 * @type {Integer (UInt32)}
 */
export global RPCFLG_LOCAL_CALL := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global RPCFLG_INPUT_SYNCHRONOUS := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global RPCFLG_ASYNCHRONOUS := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global RPCFLG_NON_NDR := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global RPCFLG_HAS_MULTI_SYNTAXES := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global RPCFLG_HAS_CALLBACK := 67108864

/**
 * @type {Integer (UInt32)}
 */
export global RPCFLG_ACCESSIBILITY_BIT1 := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global RPCFLG_ACCESSIBILITY_BIT2 := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global RPCFLG_ACCESS_LOCAL := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global NDR_CUSTOM_OR_DEFAULT_ALLOCATOR := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global NDR_DEFAULT_ALLOCATOR := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global RPCFLG_NDR64_CONTAINS_ARM_LAYOUT := 67108864

/**
 * @type {Integer (UInt32)}
 */
export global RPCFLG_SENDER_WAITING_FOR_REPLY := 8388608

/**
 * @type {Integer (UInt32)}
 */
export global RPC_FLAGS_VALID_BIT := 32768

/**
 * @type {Integer (UInt32)}
 */
export global NT351_INTERFACE_SIZE := 64

/**
 * @type {Integer (UInt32)}
 */
export global RPC_INTERFACE_HAS_PIPES := 1

/**
 * @type {Integer (UInt32)}
 */
export global RPC_SYSTEM_HANDLE_FREE_UNRETRIEVED := 1

/**
 * @type {Integer (UInt32)}
 */
export global RPC_SYSTEM_HANDLE_FREE_RETRIEVED := 2

/**
 * @type {Integer (UInt32)}
 */
export global RPC_SYSTEM_HANDLE_FREE_ALL := 3

/**
 * @type {Integer (UInt32)}
 */
export global RPC_SYSTEM_HANDLE_FREE_ERROR_ON_CLOSE := 4

/**
 * @type {Integer (UInt32)}
 */
export global TRANSPORT_TYPE_CN := 1

/**
 * @type {Integer (UInt32)}
 */
export global TRANSPORT_TYPE_DG := 2

/**
 * @type {Integer (UInt32)}
 */
export global TRANSPORT_TYPE_LPC := 4

/**
 * @type {Integer (UInt32)}
 */
export global TRANSPORT_TYPE_WMSG := 8

/**
 * @type {Integer (UInt32)}
 */
export global RPC_P_ADDR_FORMAT_TCP_IPV4 := 1

/**
 * @type {Integer (UInt32)}
 */
export global RPC_P_ADDR_FORMAT_TCP_IPV6 := 2

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_OPT_SESSION_ID := 6

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_OPT_COOKIE_AUTH := 7

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_OPT_RESOURCE_TYPE_UUID := 8

/**
 * @type {Integer (UInt32)}
 */
export global RPC_PROXY_CONNECTION_TYPE_IN_PROXY := 0

/**
 * @type {Integer (UInt32)}
 */
export global RPC_PROXY_CONNECTION_TYPE_OUT_PROXY := 1

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_OPT_PRIVATE_SUPPRESS_WAKE := 1

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_OPT_PRIVATE_DO_NOT_DISTURB := 2

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_OPT_PRIVATE_BREAK_ON_SUSPEND := 3

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_PROFILE_DEFAULT_ELT := 0

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_PROFILE_ALL_ELT := 1

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_PROFILE_ALL_ELTS := 1

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_PROFILE_MATCH_BY_IF := 2

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_PROFILE_MATCH_BY_MBR := 3

/**
 * @type {Integer (UInt32)}
 */
export global RPC_C_PROFILE_MATCH_BY_BOTH := 4

/**
 * @type {Integer (Int32)}
 */
export global RPC_C_NS_DEFAULT_EXP_AGE := -1

/**
 * @type {Integer (UInt32)}
 */
export global TARGET_IS_NT1012_OR_LATER := 1

/**
 * @type {Integer (UInt32)}
 */
export global TARGET_IS_NT102_OR_LATER := 1

/**
 * @type {Integer (UInt32)}
 */
export global TARGET_IS_NT100_OR_LATER := 1

/**
 * @type {Integer (UInt32)}
 */
export global TARGET_IS_NT63_OR_LATER := 1

/**
 * @type {Integer (UInt32)}
 */
export global TARGET_IS_NT62_OR_LATER := 1

/**
 * @type {Integer (UInt32)}
 */
export global TARGET_IS_NT61_OR_LATER := 1

/**
 * @type {Integer (UInt32)}
 */
export global TARGET_IS_NT60_OR_LATER := 1

/**
 * @type {Integer (UInt32)}
 */
export global TARGET_IS_NT51_OR_LATER := 1

/**
 * @type {Integer (UInt32)}
 */
export global TARGET_IS_NT50_OR_LATER := 1

/**
 * @type {Integer (UInt32)}
 */
export global TARGET_IS_NT40_OR_LATER := 1

/**
 * @type {Integer (UInt32)}
 */
export global TARGET_IS_NT351_OR_WIN95_OR_LATER := 1

/**
 * @type {Integer (UInt32)}
 */
export global cbNDRContext := 20

/**
 * @type {Integer (UInt32)}
 */
export global USER_CALL_IS_ASYNC := 256

/**
 * @type {Integer (UInt32)}
 */
export global USER_CALL_NEW_CORRELATION_DESC := 512

/**
 * @type {Integer (Int32)}
 */
export global MIDL_WINRT_TYPE_SERIALIZATION_INFO_CURRENT_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global USER_MARSHAL_FC_BYTE := 1

/**
 * @type {Integer (UInt32)}
 */
export global USER_MARSHAL_FC_CHAR := 2

/**
 * @type {Integer (UInt32)}
 */
export global USER_MARSHAL_FC_SMALL := 3

/**
 * @type {Integer (UInt32)}
 */
export global USER_MARSHAL_FC_USMALL := 4

/**
 * @type {Integer (UInt32)}
 */
export global USER_MARSHAL_FC_WCHAR := 5

/**
 * @type {Integer (UInt32)}
 */
export global USER_MARSHAL_FC_SHORT := 6

/**
 * @type {Integer (UInt32)}
 */
export global USER_MARSHAL_FC_USHORT := 7

/**
 * @type {Integer (UInt32)}
 */
export global USER_MARSHAL_FC_LONG := 8

/**
 * @type {Integer (UInt32)}
 */
export global USER_MARSHAL_FC_ULONG := 9

/**
 * @type {Integer (UInt32)}
 */
export global USER_MARSHAL_FC_FLOAT := 10

/**
 * @type {Integer (UInt32)}
 */
export global USER_MARSHAL_FC_HYPER := 11

/**
 * @type {Integer (UInt32)}
 */
export global USER_MARSHAL_FC_DOUBLE := 12

/**
 * @type {Integer (UInt32)}
 */
export global INVALID_FRAGMENT_ID := 0

/**
 * @type {Integer (UInt32)}
 */
export global NDR64_FC_EXPLICIT_HANDLE := 0

/**
 * @type {Integer (UInt32)}
 */
export global NDR64_FC_BIND_GENERIC := 1

/**
 * @type {Integer (UInt32)}
 */
export global NDR64_FC_BIND_PRIMITIVE := 2

/**
 * @type {Integer (UInt32)}
 */
export global NDR64_FC_AUTO_HANDLE := 3

/**
 * @type {Integer (UInt32)}
 */
export global NDR64_FC_CALLBACK_HANDLE := 4

/**
 * @type {Integer (UInt32)}
 */
export global NDR64_FC_NO_HANDLE := 5

/**
 * @type {Integer (UInt32)}
 */
export global __RPCPROXY_H_VERSION__ := 477

/**
 * @type {Integer (Int32)}
 */
export global MidlInterceptionInfoVersionOne := 1

/**
 * @type {Integer (Int32)}
 */
export global MidlWinrtTypeSerializationInfoVersionOne := 1
;@endregion Constants
