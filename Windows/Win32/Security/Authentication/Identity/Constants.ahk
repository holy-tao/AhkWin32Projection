#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */

;@region Constants

/**
 * @type {String}
 */
export global NTLMSP_NAME_A := "NTLM"

/**
 * @type {String}
 */
export global NTLMSP_NAME := "NTLM"

/**
 * @type {String}
 */
export global MICROSOFT_KERBEROS_NAME_A := "Kerberos"

/**
 * @type {String}
 */
export global MICROSOFT_KERBEROS_NAME_W := "Kerberos"

/**
 * @type {String}
 */
export global MICROSOFT_KERBEROS_NAME := "Kerberos"

/**
 * @type {String}
 */
export global NEGOSSP_NAME_W := "Negotiate"

/**
 * @type {String}
 */
export global NEGOSSP_NAME_A := "Negotiate"

/**
 * @type {String}
 */
export global NEGOSSP_NAME := "Negotiate"

/**
 * @type {String}
 */
export global CLOUDAP_NAME_W := "CloudAP"

/**
 * @type {String}
 */
export global ClOUDAP_NAME_A := "CloudAP"

/**
 * @type {String}
 */
export global CLOUDAP_NAME := "CloudAP"

/**
 * @type {Integer (UInt32)}
 */
export global ISSP_LEVEL := 32

/**
 * @type {Integer (UInt32)}
 */
export global ISSP_MODE := 1

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_FLAG_INTEGRITY := 1

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_FLAG_PRIVACY := 2

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_FLAG_TOKEN_ONLY := 4

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_FLAG_DATAGRAM := 8

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_FLAG_CONNECTION := 16

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_FLAG_MULTI_REQUIRED := 32

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_FLAG_CLIENT_ONLY := 64

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_FLAG_EXTENDED_ERROR := 128

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_FLAG_IMPERSONATION := 256

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_FLAG_ACCEPT_WIN32_NAME := 512

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_FLAG_STREAM := 1024

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_FLAG_NEGOTIABLE := 2048

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_FLAG_GSS_COMPATIBLE := 4096

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_FLAG_LOGON := 8192

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_FLAG_ASCII_BUFFERS := 16384

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_FLAG_FRAGMENT := 32768

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_FLAG_MUTUAL_AUTH := 65536

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_FLAG_DELEGATION := 131072

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_FLAG_READONLY_WITH_CHECKSUM := 262144

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_FLAG_RESTRICTED_TOKENS := 524288

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_FLAG_NEGO_EXTENDER := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_FLAG_NEGOTIABLE2 := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_FLAG_APPCONTAINER_PASSTHROUGH := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_FLAG_APPCONTAINER_CHECKS := 8388608

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_FLAG_CREDENTIAL_ISOLATION_ENABLED := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_FLAG_APPLY_LOOPBACK := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_ID_NONE := 65535

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_CALLFLAGS_APPCONTAINER := 1

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_CALLFLAGS_APPCONTAINER_AUTHCAPABLE := 2

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_CALLFLAGS_FORCE_SUPPLIED := 4

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_CALLFLAGS_APPCONTAINER_UPNCAPABLE := 8

/**
 * @type {Integer (UInt32)}
 */
export global SECBUFFER_VERSION := 0

/**
 * @type {Integer (UInt32)}
 */
export global SECBUFFER_EMPTY := 0

/**
 * @type {Integer (UInt32)}
 */
export global SECBUFFER_DATA := 1

/**
 * @type {Integer (UInt32)}
 */
export global SECBUFFER_TOKEN := 2

/**
 * @type {Integer (UInt32)}
 */
export global SECBUFFER_PKG_PARAMS := 3

/**
 * @type {Integer (UInt32)}
 */
export global SECBUFFER_MISSING := 4

/**
 * @type {Integer (UInt32)}
 */
export global SECBUFFER_EXTRA := 5

/**
 * @type {Integer (UInt32)}
 */
export global SECBUFFER_STREAM_TRAILER := 6

/**
 * @type {Integer (UInt32)}
 */
export global SECBUFFER_STREAM_HEADER := 7

/**
 * @type {Integer (UInt32)}
 */
export global SECBUFFER_NEGOTIATION_INFO := 8

/**
 * @type {Integer (UInt32)}
 */
export global SECBUFFER_PADDING := 9

/**
 * @type {Integer (UInt32)}
 */
export global SECBUFFER_STREAM := 10

/**
 * @type {Integer (UInt32)}
 */
export global SECBUFFER_MECHLIST := 11

/**
 * @type {Integer (UInt32)}
 */
export global SECBUFFER_MECHLIST_SIGNATURE := 12

/**
 * @type {Integer (UInt32)}
 */
export global SECBUFFER_TARGET := 13

/**
 * @type {Integer (UInt32)}
 */
export global SECBUFFER_CHANNEL_BINDINGS := 14

/**
 * @type {Integer (UInt32)}
 */
export global SECBUFFER_CHANGE_PASS_RESPONSE := 15

/**
 * @type {Integer (UInt32)}
 */
export global SECBUFFER_TARGET_HOST := 16

/**
 * @type {Integer (UInt32)}
 */
export global SECBUFFER_ALERT := 17

/**
 * @type {Integer (UInt32)}
 */
export global SECBUFFER_APPLICATION_PROTOCOLS := 18

/**
 * @type {Integer (UInt32)}
 */
export global SECBUFFER_SRTP_PROTECTION_PROFILES := 19

/**
 * @type {Integer (UInt32)}
 */
export global SECBUFFER_SRTP_MASTER_KEY_IDENTIFIER := 20

/**
 * @type {Integer (UInt32)}
 */
export global SECBUFFER_TOKEN_BINDING := 21

/**
 * @type {Integer (UInt32)}
 */
export global SECBUFFER_PRESHARED_KEY := 22

/**
 * @type {Integer (UInt32)}
 */
export global SECBUFFER_PRESHARED_KEY_IDENTITY := 23

/**
 * @type {Integer (UInt32)}
 */
export global SECBUFFER_DTLS_MTU := 24

/**
 * @type {Integer (UInt32)}
 */
export global SECBUFFER_SEND_GENERIC_TLS_EXTENSION := 25

/**
 * @type {Integer (UInt32)}
 */
export global SECBUFFER_SUBSCRIBE_GENERIC_TLS_EXTENSION := 26

/**
 * @type {Integer (UInt32)}
 */
export global SECBUFFER_FLAGS := 27

/**
 * @type {Integer (UInt32)}
 */
export global SECBUFFER_TRAFFIC_SECRETS := 28

/**
 * @type {Integer (UInt32)}
 */
export global SECBUFFER_CERTIFICATE_REQUEST_CONTEXT := 29

/**
 * @type {Integer (UInt32)}
 */
export global SECBUFFER_CHANNEL_BINDINGS_RESULT := 30

/**
 * @type {Integer (UInt32)}
 */
export global SECBUFFER_APP_SESSION_STATE := 31

/**
 * @type {Integer (UInt32)}
 */
export global SECBUFFER_SESSION_TICKET := 32

/**
 * @type {Integer (UInt32)}
 */
export global SECBUFFER_ATTRMASK := 4026531840

/**
 * @type {Integer (UInt32)}
 */
export global SECBUFFER_READONLY := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global SECBUFFER_READONLY_WITH_CHECKSUM := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global SECBUFFER_RESERVED := 1610612736

/**
 * @type {Integer (UInt32)}
 */
export global SEC_CHANNEL_BINDINGS_AUDIT_BINDINGS := 1

/**
 * @type {Integer (UInt32)}
 */
export global SEC_CHANNEL_BINDINGS_VALID_FLAGS := 1

/**
 * @type {Integer (UInt32)}
 */
export global SEC_CHANNEL_BINDINGS_RESULT_CLIENT_SUPPORT := 1

/**
 * @type {Integer (UInt32)}
 */
export global SEC_CHANNEL_BINDINGS_RESULT_ABSENT := 2

/**
 * @type {Integer (UInt32)}
 */
export global SEC_CHANNEL_BINDINGS_RESULT_NOTVALID_MISMATCH := 4

/**
 * @type {Integer (UInt32)}
 */
export global SEC_CHANNEL_BINDINGS_RESULT_NOTVALID_MISSING := 8

/**
 * @type {Integer (UInt32)}
 */
export global SEC_CHANNEL_BINDINGS_RESULT_VALID_MATCHED := 16

/**
 * @type {Integer (UInt32)}
 */
export global SEC_CHANNEL_BINDINGS_RESULT_VALID_PROXY := 32

/**
 * @type {Integer (UInt32)}
 */
export global SEC_CHANNEL_BINDINGS_RESULT_VALID_MISSING := 64

/**
 * @type {Integer (UInt32)}
 */
export global SZ_ALG_MAX_SIZE := 64

/**
 * @type {Integer (UInt32)}
 */
export global SECURITY_NATIVE_DREP := 16

/**
 * @type {Integer (UInt32)}
 */
export global SECURITY_NETWORK_DREP := 0

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_CRED_BOTH := 3

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_CRED_DEFAULT := 4

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_CRED_RESERVED := 4026531840

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_CRED_AUTOLOGON_RESTRICTED := 16

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_CRED_PROCESS_POLICY_ONLY := 32

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_CRED_KERB_ANCHOR_DS_VERSION := 64

/**
 * @type {Integer (UInt32)}
 */
export global ISC_RET_DELEGATE := 1

/**
 * @type {Integer (UInt32)}
 */
export global ISC_RET_MUTUAL_AUTH := 2

/**
 * @type {Integer (UInt32)}
 */
export global ISC_RET_REPLAY_DETECT := 4

/**
 * @type {Integer (UInt32)}
 */
export global ISC_RET_SEQUENCE_DETECT := 8

/**
 * @type {Integer (UInt32)}
 */
export global ISC_RET_CONFIDENTIALITY := 16

/**
 * @type {Integer (UInt32)}
 */
export global ISC_RET_USE_SESSION_KEY := 32

/**
 * @type {Integer (UInt32)}
 */
export global ISC_RET_USED_COLLECTED_CREDS := 64

/**
 * @type {Integer (UInt32)}
 */
export global ISC_RET_USED_SUPPLIED_CREDS := 128

/**
 * @type {Integer (UInt32)}
 */
export global ISC_RET_ALLOCATED_MEMORY := 256

/**
 * @type {Integer (UInt32)}
 */
export global ISC_RET_USED_DCE_STYLE := 512

/**
 * @type {Integer (UInt32)}
 */
export global ISC_RET_DATAGRAM := 1024

/**
 * @type {Integer (UInt32)}
 */
export global ISC_RET_CONNECTION := 2048

/**
 * @type {Integer (UInt32)}
 */
export global ISC_RET_INTERMEDIATE_RETURN := 4096

/**
 * @type {Integer (UInt32)}
 */
export global ISC_RET_CALL_LEVEL := 8192

/**
 * @type {Integer (UInt32)}
 */
export global ISC_RET_EXTENDED_ERROR := 16384

/**
 * @type {Integer (UInt32)}
 */
export global ISC_RET_STREAM := 32768

/**
 * @type {Integer (UInt32)}
 */
export global ISC_RET_INTEGRITY := 65536

/**
 * @type {Integer (UInt32)}
 */
export global ISC_RET_IDENTIFY := 131072

/**
 * @type {Integer (UInt32)}
 */
export global ISC_RET_NULL_SESSION := 262144

/**
 * @type {Integer (UInt32)}
 */
export global ISC_RET_MANUAL_CRED_VALIDATION := 524288

/**
 * @type {Integer (UInt32)}
 */
export global ISC_RET_RESERVED1 := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global ISC_RET_FRAGMENT_ONLY := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global ISC_RET_FORWARD_CREDENTIALS := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global ISC_RET_USED_HTTP_STYLE := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global ISC_RET_NO_ADDITIONAL_TOKEN := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global ISC_RET_REAUTHENTICATION := 134217728

/**
 * @type {Integer (UInt32)}
 */
export global ISC_RET_CONFIDENTIALITY_ONLY := 1073741824

/**
 * @type {Integer (UInt64)}
 */
export global ISC_RET_MESSAGES := 4294967296

/**
 * @type {Integer (UInt64)}
 */
export global ISC_RET_DEFERRED_CRED_VALIDATION := 8589934592

/**
 * @type {Integer (UInt64)}
 */
export global ISC_RET_NO_POST_HANDSHAKE_AUTH := 17179869184

/**
 * @type {Integer (UInt64)}
 */
export global ISC_RET_REUSE_SESSION_TICKETS := 34359738368

/**
 * @type {Integer (UInt64)}
 */
export global ISC_RET_EXPLICIT_SESSION := 68719476736

/**
 * @type {Integer (UInt32)}
 */
export global ASC_RET_DELEGATE := 1

/**
 * @type {Integer (UInt32)}
 */
export global ASC_RET_MUTUAL_AUTH := 2

/**
 * @type {Integer (UInt32)}
 */
export global ASC_RET_REPLAY_DETECT := 4

/**
 * @type {Integer (UInt32)}
 */
export global ASC_RET_SEQUENCE_DETECT := 8

/**
 * @type {Integer (UInt32)}
 */
export global ASC_RET_CONFIDENTIALITY := 16

/**
 * @type {Integer (UInt32)}
 */
export global ASC_RET_USE_SESSION_KEY := 32

/**
 * @type {Integer (UInt32)}
 */
export global ASC_RET_SESSION_TICKET := 64

/**
 * @type {Integer (UInt32)}
 */
export global ASC_RET_ALLOCATED_MEMORY := 256

/**
 * @type {Integer (UInt32)}
 */
export global ASC_RET_USED_DCE_STYLE := 512

/**
 * @type {Integer (UInt32)}
 */
export global ASC_RET_DATAGRAM := 1024

/**
 * @type {Integer (UInt32)}
 */
export global ASC_RET_CONNECTION := 2048

/**
 * @type {Integer (UInt32)}
 */
export global ASC_RET_CALL_LEVEL := 8192

/**
 * @type {Integer (UInt32)}
 */
export global ASC_RET_THIRD_LEG_FAILED := 16384

/**
 * @type {Integer (UInt32)}
 */
export global ASC_RET_EXTENDED_ERROR := 32768

/**
 * @type {Integer (UInt32)}
 */
export global ASC_RET_STREAM := 65536

/**
 * @type {Integer (UInt32)}
 */
export global ASC_RET_INTEGRITY := 131072

/**
 * @type {Integer (UInt32)}
 */
export global ASC_RET_LICENSING := 262144

/**
 * @type {Integer (UInt32)}
 */
export global ASC_RET_IDENTIFY := 524288

/**
 * @type {Integer (UInt32)}
 */
export global ASC_RET_NULL_SESSION := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global ASC_RET_ALLOW_NON_USER_LOGONS := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global ASC_RET_ALLOW_CONTEXT_REPLAY := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global ASC_RET_FRAGMENT_ONLY := 8388608

/**
 * @type {Integer (UInt32)}
 */
export global ASC_RET_NO_TOKEN := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global ASC_RET_NO_ADDITIONAL_TOKEN := 33554432

/**
 * @type {Integer (UInt64)}
 */
export global ASC_RET_MESSAGES := 4294967296

/**
 * @type {Integer (UInt64)}
 */
export global ASC_RET_REUSE_SESSION_TICKETS := 34359738368

/**
 * @type {Integer (UInt64)}
 */
export global ASC_RET_EXPLICIT_SESSION := 68719476736

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_CRED_ATTR_NAMES := 1

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_CRED_ATTR_SSI_PROVIDER := 2

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_CRED_ATTR_KDC_PROXY_SETTINGS := 3

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_CRED_ATTR_KDC_NETWORK_SETTINGS := 3

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_CRED_ATTR_CERT := 4

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_CRED_ATTR_PAC_BYPASS := 5

/**
 * @type {Integer (UInt32)}
 */
export global KDC_PROXY_SETTINGS_V1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global KDC_NETWORK_SETTINGS_V2 := 2

/**
 * @type {Integer (UInt32)}
 */
export global KDC_PROXY_SETTINGS_FLAGS_FORCEPROXY := 1

/**
 * @type {Integer (UInt32)}
 */
export global KDC_NETWORK_SETTINGS_FLAGS_FORCEPROXY := 1

/**
 * @type {Integer (UInt32)}
 */
export global KDC_NETWORK_SETTINGS_FLAGS_CONFIGURE_PROXY := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global KDC_NETWORK_SETTINGS_FLAGS_CONFIGURE_DISCOVERY := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global KDC_NETWORK_DISCOVERY_FLAGS_DS13_REQUIRED := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_ATTR_PROTO_INFO := 7

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_ATTR_USER_FLAGS := 11

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_ATTR_USE_VALIDATED := 15

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_ATTR_CREDENTIAL_NAME := 16

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_ATTR_TARGET := 19

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_ATTR_AUTHENTICATION_ID := 20

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_ATTR_LOGOFF_TIME := 21

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_ATTR_NEGO_KEYS := 22

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_ATTR_PROMPTING_NEEDED := 24

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_ATTR_NEGO_PKG_INFO := 31

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_ATTR_NEGO_STATUS := 32

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_ATTR_CONTEXT_DELETED := 33

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_ATTR_APPLICATION_PROTOCOL := 35

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_ATTR_NEGOTIATED_TLS_EXTENSIONS := 36

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_ATTR_IS_LOOPBACK := 37

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_ATTR_NEGO_INFO_FLAG_NO_KERBEROS := 1

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_ATTR_NEGO_INFO_FLAG_NO_NTLM := 2

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_NEGOTIATION_COMPLETE := 0

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_NEGOTIATION_OPTIMISTIC := 1

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_NEGOTIATION_IN_PROGRESS := 2

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_NEGOTIATION_DIRECT := 3

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_NEGOTIATION_TRY_MULTICRED := 4

/**
 * @type {Integer (UInt32)}
 */
export global MAX_PROTOCOL_ID_SIZE := 255

/**
 * @type {Integer (UInt32)}
 */
export global SECQOP_WRAP_NO_ENCRYPT := 2147483649

/**
 * @type {Integer (UInt32)}
 */
export global SECQOP_WRAP_OOB_DATA := 1073741824

/**
 * @type {String}
 */
export global SECURITY_ENTRYPOINT_ANSIW := "InitSecurityInterfaceW"

/**
 * @type {String}
 */
export global SECURITY_ENTRYPOINT_ANSIA := "InitSecurityInterfaceA"

/**
 * @type {String}
 */
export global SECURITY_ENTRYPOINT16 := "INITSECURITYINTERFACEA"

/**
 * @type {String}
 */
export global SECURITY_ENTRYPOINT_ANSI := "InitSecurityInterfaceW"

/**
 * @type {String}
 */
export global SECURITY_ENTRYPOINT := "INITSECURITYINTERFACEA"

/**
 * @type {Integer (UInt32)}
 */
export global SECURITY_SUPPORT_PROVIDER_INTERFACE_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global SECURITY_SUPPORT_PROVIDER_INTERFACE_VERSION_2 := 2

/**
 * @type {Integer (UInt32)}
 */
export global SECURITY_SUPPORT_PROVIDER_INTERFACE_VERSION_3 := 3

/**
 * @type {Integer (UInt32)}
 */
export global SECURITY_SUPPORT_PROVIDER_INTERFACE_VERSION_4 := 4

/**
 * @type {Integer (UInt32)}
 */
export global SECURITY_SUPPORT_PROVIDER_INTERFACE_VERSION_5 := 5

/**
 * @type {Integer (UInt32)}
 */
export global SASL_OPTION_SEND_SIZE := 1

/**
 * @type {Integer (UInt32)}
 */
export global SASL_OPTION_RECV_SIZE := 2

/**
 * @type {Integer (UInt32)}
 */
export global SASL_OPTION_AUTHZ_STRING := 3

/**
 * @type {Integer (UInt32)}
 */
export global SASL_OPTION_AUTHZ_PROCESSING := 4

/**
 * @type {Integer (UInt32)}
 */
export global SEC_WINNT_AUTH_IDENTITY_VERSION_2 := 513

/**
 * @type {Integer (UInt32)}
 */
export global SEC_WINNT_AUTH_IDENTITY_VERSION := 512

/**
 * @type {Integer (UInt32)}
 */
export global SEC_WINNT_AUTH_IDENTITY_FLAGS_PROCESS_ENCRYPTED := 16

/**
 * @type {Integer (UInt32)}
 */
export global SEC_WINNT_AUTH_IDENTITY_FLAGS_SYSTEM_PROTECTED := 32

/**
 * @type {Integer (UInt32)}
 */
export global SEC_WINNT_AUTH_IDENTITY_FLAGS_USER_PROTECTED := 64

/**
 * @type {Integer (UInt32)}
 */
export global SEC_WINNT_AUTH_IDENTITY_FLAGS_SYSTEM_ENCRYPTED := 128

/**
 * @type {Integer (UInt32)}
 */
export global SEC_WINNT_AUTH_IDENTITY_FLAGS_RESERVED := 65536

/**
 * @type {Integer (UInt32)}
 */
export global SEC_WINNT_AUTH_IDENTITY_FLAGS_NULL_USER := 131072

/**
 * @type {Integer (UInt32)}
 */
export global SEC_WINNT_AUTH_IDENTITY_FLAGS_NULL_DOMAIN := 262144

/**
 * @type {Integer (UInt32)}
 */
export global SEC_WINNT_AUTH_IDENTITY_FLAGS_ID_PROVIDER := 524288

/**
 * @type {Integer (UInt32)}
 */
export global SEC_WINNT_AUTH_IDENTITY_FLAGS_SSPIPFC_USE_MASK := 4278190080

/**
 * @type {Integer (UInt32)}
 */
export global SEC_WINNT_AUTH_IDENTITY_FLAGS_SSPIPFC_CREDPROV_DO_NOT_SAVE := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global SEC_WINNT_AUTH_IDENTITY_FLAGS_SSPIPFC_SAVE_CRED_BY_CALLER := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global SEC_WINNT_AUTH_IDENTITY_FLAGS_SSPIPFC_SAVE_CRED_CHECKED := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global SEC_WINNT_AUTH_IDENTITY_FLAGS_SSPIPFC_NO_CHECKBOX := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global SEC_WINNT_AUTH_IDENTITY_FLAGS_SSPIPFC_CREDPROV_DO_NOT_LOAD := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global SSPIPFC_CREDPROV_DO_NOT_SAVE := 1

/**
 * @type {Integer (UInt32)}
 */
export global SSPIPFC_SAVE_CRED_BY_CALLER := 1

/**
 * @type {Integer (UInt32)}
 */
export global SSPIPFC_NO_CHECKBOX := 2

/**
 * @type {Integer (UInt32)}
 */
export global SSPIPFC_CREDPROV_DO_NOT_LOAD := 4

/**
 * @type {Integer (UInt32)}
 */
export global SSPIPFC_USE_CREDUIBROKER := 8

/**
 * @type {Integer (UInt32)}
 */
export global NGC_DATA_FLAG_KERB_CERTIFICATE_LOGON_FLAG_CHECK_DUPLICATES := 1

/**
 * @type {Integer (UInt32)}
 */
export global NGC_DATA_FLAG_KERB_CERTIFICATE_LOGON_FLAG_USE_CERTIFICATE_INFO := 2

/**
 * @type {Integer (UInt32)}
 */
export global NGC_DATA_FLAG_IS_SMARTCARD_DATA := 4

/**
 * @type {Integer (UInt32)}
 */
export global NGC_DATA_FLAG_IS_CLOUD_TRUST_CRED := 8

/**
 * @type {Integer (UInt32)}
 */
export global SEC_WINNT_AUTH_IDENTITY_ENCRYPT_SAME_LOGON := 1

/**
 * @type {Integer (UInt32)}
 */
export global SEC_WINNT_AUTH_IDENTITY_ENCRYPT_SAME_PROCESS := 2

/**
 * @type {Integer (UInt32)}
 */
export global SEC_WINNT_AUTH_IDENTITY_ENCRYPT_FOR_SYSTEM := 4

/**
 * @type {Integer (UInt32)}
 */
export global SEC_WINNT_AUTH_IDENTITY_MARSHALLED := 4

/**
 * @type {Integer (UInt32)}
 */
export global SEC_WINNT_AUTH_IDENTITY_ONLY := 8

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_OPTIONS_PERMANENT := 1

/**
 * @type {Integer (UInt32)}
 */
export global LOOKUP_VIEW_LOCAL_INFORMATION := 1

/**
 * @type {Integer (UInt32)}
 */
export global LOOKUP_TRANSLATE_NAMES := 2048

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_ATTR_ISSUER_LIST := 80

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_ATTR_REMOTE_CRED := 81

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_ATTR_SUPPORTED_ALGS := 86

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_ATTR_CIPHER_STRENGTHS := 87

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_ATTR_SUPPORTED_PROTOCOLS := 88

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_ATTR_MAPPED_CRED_ATTR := 92

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_ATTR_REMOTE_CERTIFICATES := 95

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_ATTR_CLIENT_CERT_POLICY := 96

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_ATTR_CC_POLICY_RESULT := 97

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_ATTR_USE_NCRYPT := 98

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_ATTR_LOCAL_CERT_INFO := 99

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_ATTR_CIPHER_INFO := 100

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_ATTR_REMOTE_CERT_CHAIN := 103

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_ATTR_UI_INFO := 104

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_ATTR_KEYING_MATERIAL := 107

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_ATTR_SRTP_PARAMETERS := 108

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_ATTR_TOKEN_BINDING := 109

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_ATTR_CONNECTION_INFO_EX := 110

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_ATTR_KEYING_MATERIAL_TOKEN_BINDING := 111

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_ATTR_KEYING_MATERIAL_INPROC := 112

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_ATTR_CERT_CHECK_RESULT := 113

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_ATTR_CERT_CHECK_RESULT_INPROC := 114

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_ATTR_SESSION_TICKET_KEYS := 115

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_ATTR_SERIALIZED_REMOTE_CERT_CONTEXT_INPROC := 116

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_ATTR_SERIALIZED_REMOTE_CERT_CONTEXT := 117

/**
 * @type {Integer (UInt32)}
 */
export global SESSION_TICKET_INFO_V0 := 0

/**
 * @type {Integer (UInt32)}
 */
export global SESSION_TICKET_INFO_VERSION := 0

/**
 * @type {Integer (Int32)}
 */
export global LSA_MODE_PASSWORD_PROTECTED := 1

/**
 * @type {Integer (Int32)}
 */
export global LSA_MODE_INDIVIDUAL_ACCOUNTS := 2

/**
 * @type {Integer (Int32)}
 */
export global LSA_MODE_MANDATORY_ACCESS := 4

/**
 * @type {Integer (Int32)}
 */
export global LSA_MODE_LOG_FULL := 8

/**
 * @type {Integer (Int32)}
 */
export global LSA_MAXIMUM_SID_COUNT := 256

/**
 * @type {Integer (UInt32)}
 */
export global LSA_MAXIMUM_ENUMERATION_LENGTH := 32000

/**
 * @type {Integer (UInt32)}
 */
export global LSA_CALL_LICENSE_SERVER := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global SE_ADT_OBJECT_ONLY := 1

/**
 * @type {Integer (UInt32)}
 */
export global SE_MAX_AUDIT_PARAMETERS := 32

/**
 * @type {Integer (UInt32)}
 */
export global SE_MAX_GENERIC_AUDIT_PARAMETERS := 28

/**
 * @type {Integer (UInt32)}
 */
export global SE_ADT_PARAMETERS_SELF_RELATIVE := 1

/**
 * @type {Integer (UInt32)}
 */
export global SE_ADT_PARAMETERS_SEND_TO_LSA := 2

/**
 * @type {Integer (UInt32)}
 */
export global SE_ADT_PARAMETER_EXTENSIBLE_AUDIT := 4

/**
 * @type {Integer (UInt32)}
 */
export global SE_ADT_PARAMETER_GENERIC_AUDIT := 8

/**
 * @type {Integer (UInt32)}
 */
export global SE_ADT_PARAMETER_WRITE_SYNCHRONOUS := 16

/**
 * @type {String}
 */
export global LSA_ADT_SECURITY_SOURCE_NAME := "Microsoft-Windows-Security-Auditing"

/**
 * @type {String}
 */
export global LSA_ADT_LEGACY_SECURITY_SOURCE_NAME := "Security"

/**
 * @type {Integer (UInt32)}
 */
export global SE_ADT_POLICY_AUDIT_EVENT_TYPE_EX_BEGIN := 100

/**
 * @type {Integer (Int32)}
 */
export global POLICY_AUDIT_EVENT_UNCHANGED := 0

/**
 * @type {Integer (Int32)}
 */
export global POLICY_AUDIT_EVENT_SUCCESS := 1

/**
 * @type {Integer (Int32)}
 */
export global POLICY_AUDIT_EVENT_FAILURE := 2

/**
 * @type {Integer (Int32)}
 */
export global POLICY_AUDIT_EVENT_NONE := 4

/**
 * @type {String}
 */
export global LSA_AP_NAME_INITIALIZE_PACKAGE := "LsaApInitializePackage" Chr(0) ""

/**
 * @type {String}
 */
export global LSA_AP_NAME_LOGON_USER := "LsaApLogonUser" Chr(0) ""

/**
 * @type {String}
 */
export global LSA_AP_NAME_LOGON_USER_EX := "LsaApLogonUserEx" Chr(0) ""

/**
 * @type {String}
 */
export global LSA_AP_NAME_CALL_PACKAGE := "LsaApCallPackage" Chr(0) ""

/**
 * @type {String}
 */
export global LSA_AP_NAME_LOGON_TERMINATED := "LsaApLogonTerminated" Chr(0) ""

/**
 * @type {String}
 */
export global LSA_AP_NAME_CALL_PACKAGE_UNTRUSTED := "LsaApCallPackageUntrusted" Chr(0) ""

/**
 * @type {String}
 */
export global LSA_AP_NAME_CALL_PACKAGE_PASSTHROUGH := "LsaApCallPackagePassthrough" Chr(0) ""

/**
 * @type {Integer (Int32)}
 */
export global POLICY_VIEW_LOCAL_INFORMATION := 1

/**
 * @type {Integer (Int32)}
 */
export global POLICY_VIEW_AUDIT_INFORMATION := 2

/**
 * @type {Integer (Int32)}
 */
export global POLICY_GET_PRIVATE_INFORMATION := 4

/**
 * @type {Integer (Int32)}
 */
export global POLICY_TRUST_ADMIN := 8

/**
 * @type {Integer (Int32)}
 */
export global POLICY_CREATE_ACCOUNT := 16

/**
 * @type {Integer (Int32)}
 */
export global POLICY_CREATE_SECRET := 32

/**
 * @type {Integer (Int32)}
 */
export global POLICY_CREATE_PRIVILEGE := 64

/**
 * @type {Integer (Int32)}
 */
export global POLICY_SET_DEFAULT_QUOTA_LIMITS := 128

/**
 * @type {Integer (Int32)}
 */
export global POLICY_SET_AUDIT_REQUIREMENTS := 256

/**
 * @type {Integer (Int32)}
 */
export global POLICY_AUDIT_LOG_ADMIN := 512

/**
 * @type {Integer (Int32)}
 */
export global POLICY_SERVER_ADMIN := 1024

/**
 * @type {Integer (Int32)}
 */
export global POLICY_LOOKUP_NAMES := 2048

/**
 * @type {Integer (Int32)}
 */
export global POLICY_NOTIFICATION := 4096

/**
 * @type {Integer (UInt32)}
 */
export global POLICY_MODE_COUNT := 11

/**
 * @type {Integer (UInt32)}
 */
export global LSA_LOOKUP_ISOLATED_AS_LOCAL := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global LSA_LOOKUP_DISALLOW_CONNECTED_ACCOUNT_INTERNET_SID := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global LSA_LOOKUP_PREFER_INTERNET_NAMES := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global PER_USER_POLICY_UNCHANGED := 0

/**
 * @type {Integer (UInt32)}
 */
export global PER_USER_AUDIT_SUCCESS_INCLUDE := 1

/**
 * @type {Integer (UInt32)}
 */
export global PER_USER_AUDIT_SUCCESS_EXCLUDE := 2

/**
 * @type {Integer (UInt32)}
 */
export global PER_USER_AUDIT_FAILURE_INCLUDE := 4

/**
 * @type {Integer (UInt32)}
 */
export global PER_USER_AUDIT_FAILURE_EXCLUDE := 8

/**
 * @type {Integer (UInt32)}
 */
export global PER_USER_AUDIT_NONE := 16

/**
 * @type {Integer (UInt32)}
 */
export global POLICY_QOS_SCHANNEL_REQUIRED := 1

/**
 * @type {Integer (UInt32)}
 */
export global POLICY_QOS_OUTBOUND_INTEGRITY := 2

/**
 * @type {Integer (UInt32)}
 */
export global POLICY_QOS_OUTBOUND_CONFIDENTIALITY := 4

/**
 * @type {Integer (UInt32)}
 */
export global POLICY_QOS_INBOUND_INTEGRITY := 8

/**
 * @type {Integer (UInt32)}
 */
export global POLICY_QOS_INBOUND_CONFIDENTIALITY := 16

/**
 * @type {Integer (UInt32)}
 */
export global POLICY_QOS_ALLOW_LOCAL_ROOT_CERT_STORE := 32

/**
 * @type {Integer (UInt32)}
 */
export global POLICY_QOS_RAS_SERVER_ALLOWED := 64

/**
 * @type {Integer (UInt32)}
 */
export global POLICY_QOS_DHCP_SERVER_ALLOWED := 128

/**
 * @type {Integer (UInt32)}
 */
export global POLICY_KERBEROS_VALIDATE_CLIENT := 128

/**
 * @type {Integer (Int32)}
 */
export global ACCOUNT_VIEW := 1

/**
 * @type {Integer (Int32)}
 */
export global ACCOUNT_ADJUST_PRIVILEGES := 2

/**
 * @type {Integer (Int32)}
 */
export global ACCOUNT_ADJUST_QUOTAS := 4

/**
 * @type {Integer (Int32)}
 */
export global ACCOUNT_ADJUST_SYSTEM_ACCESS := 8

/**
 * @type {Integer (Int32)}
 */
export global TRUSTED_QUERY_DOMAIN_NAME := 1

/**
 * @type {Integer (Int32)}
 */
export global TRUSTED_QUERY_CONTROLLERS := 2

/**
 * @type {Integer (Int32)}
 */
export global TRUSTED_SET_CONTROLLERS := 4

/**
 * @type {Integer (Int32)}
 */
export global TRUSTED_QUERY_POSIX := 8

/**
 * @type {Integer (Int32)}
 */
export global TRUSTED_SET_POSIX := 16

/**
 * @type {Integer (Int32)}
 */
export global TRUSTED_SET_AUTH := 32

/**
 * @type {Integer (Int32)}
 */
export global TRUSTED_QUERY_AUTH := 64

/**
 * @type {Integer (UInt32)}
 */
export global LSAD_AES_CRYPT_SHA512_HASH_SIZE := 64

/**
 * @type {Integer (UInt32)}
 */
export global LSAD_AES_KEY_SIZE := 16

/**
 * @type {Integer (UInt32)}
 */
export global LSAD_AES_SALT_SIZE := 16

/**
 * @type {Integer (UInt32)}
 */
export global LSAD_AES_BLOCK_SIZE := 16

/**
 * @type {Integer (UInt32)}
 */
export global TRUST_TYPE_AAD := 5

/**
 * @type {Integer (UInt32)}
 */
export global TRUST_ATTRIBUTE_TREE_PARENT := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global TRUST_ATTRIBUTE_TREE_ROOT := 8388608

/**
 * @type {Integer (UInt32)}
 */
export global TRUST_ATTRIBUTES_VALID := 4278386687

/**
 * @type {Integer (UInt32)}
 */
export global TRUST_ATTRIBUTE_QUARANTINED_DOMAIN := 4

/**
 * @type {Integer (UInt32)}
 */
export global TRUST_ATTRIBUTE_TRUST_USES_RC4_ENCRYPTION := 128

/**
 * @type {Integer (UInt32)}
 */
export global TRUST_ATTRIBUTE_TRUST_USES_AES_KEYS := 256

/**
 * @type {Integer (UInt32)}
 */
export global TRUST_ATTRIBUTE_CROSS_ORGANIZATION_NO_TGT_DELEGATION := 512

/**
 * @type {Integer (UInt32)}
 */
export global TRUST_ATTRIBUTE_PIM_TRUST := 1024

/**
 * @type {Integer (UInt32)}
 */
export global TRUST_ATTRIBUTE_CROSS_ORGANIZATION_ENABLE_TGT_DELEGATION := 2048

/**
 * @type {Integer (UInt32)}
 */
export global TRUST_ATTRIBUTE_DISABLE_AUTH_TARGET_VALIDATION := 4096

/**
 * @type {Integer (UInt32)}
 */
export global TRUST_ATTRIBUTES_USER := 4278190080

/**
 * @type {Integer (UInt32)}
 */
export global LSA_FOREST_TRUST_RECORD_TYPE_UNRECOGNIZED := 2147483648

/**
 * @type {Integer (Int32)}
 */
export global LSA_FTRECORD_DISABLED_REASONS := 65535

/**
 * @type {Integer (Int32)}
 */
export global LSA_TLN_DISABLED_NEW := 1

/**
 * @type {Integer (Int32)}
 */
export global LSA_TLN_DISABLED_ADMIN := 2

/**
 * @type {Integer (Int32)}
 */
export global LSA_TLN_DISABLED_CONFLICT := 4

/**
 * @type {Integer (Int32)}
 */
export global LSA_SID_DISABLED_ADMIN := 1

/**
 * @type {Integer (Int32)}
 */
export global LSA_SID_DISABLED_CONFLICT := 2

/**
 * @type {Integer (Int32)}
 */
export global LSA_NB_DISABLED_ADMIN := 4

/**
 * @type {Integer (Int32)}
 */
export global LSA_NB_DISABLED_CONFLICT := 8

/**
 * @type {Integer (Int32)}
 */
export global LSA_SCANNER_INFO_DISABLE_AUTH_TARGET_VALIDATION := 1

/**
 * @type {Integer (Int32)}
 */
export global LSA_SCANNER_INFO_ADMIN_ALL_FLAGS := 1

/**
 * @type {Integer (UInt32)}
 */
export global MAX_RECORDS_IN_FOREST_TRUST_INFO := 4000

/**
 * @type {Integer (Int32)}
 */
export global SECRET_SET_VALUE := 1

/**
 * @type {Integer (Int32)}
 */
export global SECRET_QUERY_VALUE := 2

/**
 * @type {String}
 */
export global LSA_GLOBAL_SECRET_PREFIX := "G$"

/**
 * @type {Integer (UInt32)}
 */
export global LSA_GLOBAL_SECRET_PREFIX_LENGTH := 2

/**
 * @type {String}
 */
export global LSA_LOCAL_SECRET_PREFIX := "L$"

/**
 * @type {Integer (UInt32)}
 */
export global LSA_LOCAL_SECRET_PREFIX_LENGTH := 2

/**
 * @type {String}
 */
export global LSA_MACHINE_SECRET_PREFIX := "M$"

/**
 * @type {Integer (Int32)}
 */
export global LSA_SECRET_MAXIMUM_COUNT := 4096

/**
 * @type {Integer (Int32)}
 */
export global LSA_SECRET_MAXIMUM_LENGTH := 512

/**
 * @type {Integer (UInt32)}
 */
export global MAXIMUM_CAPES_PER_CAP := 127

/**
 * @type {Integer (UInt32)}
 */
export global CENTRAL_ACCESS_POLICY_OWNER_RIGHTS_PRESENT_FLAG := 1

/**
 * @type {Integer (UInt32)}
 */
export global CENTRAL_ACCESS_POLICY_STAGED_OWNER_RIGHTS_PRESENT_FLAG := 256

/**
 * @type {Integer (UInt32)}
 */
export global CENTRAL_ACCESS_POLICY_STAGED_FLAG := 65536

/**
 * @type {Integer (UInt32)}
 */
export global LSASETCAPS_RELOAD_FLAG := 1

/**
 * @type {Integer (UInt32)}
 */
export global LSASETCAPS_VALID_FLAG_MASK := 1

/**
 * @type {String}
 */
export global SE_INTERACTIVE_LOGON_NAME := "SeInteractiveLogonRight"

/**
 * @type {String}
 */
export global SE_NETWORK_LOGON_NAME := "SeNetworkLogonRight"

/**
 * @type {String}
 */
export global SE_BATCH_LOGON_NAME := "SeBatchLogonRight"

/**
 * @type {String}
 */
export global SE_SERVICE_LOGON_NAME := "SeServiceLogonRight"

/**
 * @type {String}
 */
export global SE_DENY_INTERACTIVE_LOGON_NAME := "SeDenyInteractiveLogonRight"

/**
 * @type {String}
 */
export global SE_DENY_NETWORK_LOGON_NAME := "SeDenyNetworkLogonRight"

/**
 * @type {String}
 */
export global SE_DENY_BATCH_LOGON_NAME := "SeDenyBatchLogonRight"

/**
 * @type {String}
 */
export global SE_DENY_SERVICE_LOGON_NAME := "SeDenyServiceLogonRight"

/**
 * @type {String}
 */
export global SE_REMOTE_INTERACTIVE_LOGON_NAME := "SeRemoteInteractiveLogonRight"

/**
 * @type {String}
 */
export global SE_DENY_REMOTE_INTERACTIVE_LOGON_NAME := "SeDenyRemoteInteractiveLogonRight"

/**
 * @type {Integer (UInt32)}
 */
export global NEGOTIATE_MAX_PREFIX := 32

/**
 * @type {Integer (UInt32)}
 */
export global NEGOTIATE_ALLOW_NTLM := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global NEGOTIATE_NEG_NTLM := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global MAX_USER_RECORDS := 1000

/**
 * @type {Integer (UInt32)}
 */
export global versionbyte := 1

/**
 * @type {Integer (UInt32)}
 */
export global versionbyte_length := 1

/**
 * @type {String}
 */
export global LSAD_AES_256_ALG := "AEAD-AES-256-CBC-HMAC-SHA512"

/**
 * @type {String}
 */
export global LSAD_AES256_ENC_KEY_STRING := "Microsoft LSAD encryption key AEAD-AES-256-CBC-HMAC-SHA512 16"

/**
 * @type {String}
 */
export global LSAD_AES256_MAC_KEY_STRING := "Microsoft LSAD MAC key AEAD-AES-256-CBC-HMAC-SHA512 16"

/**
 * @type {Guid}
 */
export global Audit_System_SecurityStateChange := Guid("{0cce9210-69ae-11d9-bed3-505054503030}")

/**
 * @type {Guid}
 */
export global Audit_System_SecuritySubsystemExtension := Guid("{0cce9211-69ae-11d9-bed3-505054503030}")

/**
 * @type {Guid}
 */
export global Audit_System_Integrity := Guid("{0cce9212-69ae-11d9-bed3-505054503030}")

/**
 * @type {Guid}
 */
export global Audit_System_IPSecDriverEvents := Guid("{0cce9213-69ae-11d9-bed3-505054503030}")

/**
 * @type {Guid}
 */
export global Audit_System_Others := Guid("{0cce9214-69ae-11d9-bed3-505054503030}")

/**
 * @type {Guid}
 */
export global Audit_Logon_Logon := Guid("{0cce9215-69ae-11d9-bed3-505054503030}")

/**
 * @type {Guid}
 */
export global Audit_Logon_Logoff := Guid("{0cce9216-69ae-11d9-bed3-505054503030}")

/**
 * @type {Guid}
 */
export global Audit_Logon_AccountLockout := Guid("{0cce9217-69ae-11d9-bed3-505054503030}")

/**
 * @type {Guid}
 */
export global Audit_Logon_IPSecMainMode := Guid("{0cce9218-69ae-11d9-bed3-505054503030}")

/**
 * @type {Guid}
 */
export global Audit_Logon_IPSecQuickMode := Guid("{0cce9219-69ae-11d9-bed3-505054503030}")

/**
 * @type {Guid}
 */
export global Audit_Logon_IPSecUserMode := Guid("{0cce921a-69ae-11d9-bed3-505054503030}")

/**
 * @type {Guid}
 */
export global Audit_Logon_SpecialLogon := Guid("{0cce921b-69ae-11d9-bed3-505054503030}")

/**
 * @type {Guid}
 */
export global Audit_Logon_Others := Guid("{0cce921c-69ae-11d9-bed3-505054503030}")

/**
 * @type {Guid}
 */
export global Audit_ObjectAccess_FileSystem := Guid("{0cce921d-69ae-11d9-bed3-505054503030}")

/**
 * @type {Guid}
 */
export global Audit_ObjectAccess_Registry := Guid("{0cce921e-69ae-11d9-bed3-505054503030}")

/**
 * @type {Guid}
 */
export global Audit_ObjectAccess_Kernel := Guid("{0cce921f-69ae-11d9-bed3-505054503030}")

/**
 * @type {Guid}
 */
export global Audit_ObjectAccess_Sam := Guid("{0cce9220-69ae-11d9-bed3-505054503030}")

/**
 * @type {Guid}
 */
export global Audit_ObjectAccess_CertificationServices := Guid("{0cce9221-69ae-11d9-bed3-505054503030}")

/**
 * @type {Guid}
 */
export global Audit_ObjectAccess_ApplicationGenerated := Guid("{0cce9222-69ae-11d9-bed3-505054503030}")

/**
 * @type {Guid}
 */
export global Audit_ObjectAccess_Handle := Guid("{0cce9223-69ae-11d9-bed3-505054503030}")

/**
 * @type {Guid}
 */
export global Audit_ObjectAccess_Share := Guid("{0cce9224-69ae-11d9-bed3-505054503030}")

/**
 * @type {Guid}
 */
export global Audit_ObjectAccess_FirewallPacketDrops := Guid("{0cce9225-69ae-11d9-bed3-505054503030}")

/**
 * @type {Guid}
 */
export global Audit_ObjectAccess_FirewallConnection := Guid("{0cce9226-69ae-11d9-bed3-505054503030}")

/**
 * @type {Guid}
 */
export global Audit_ObjectAccess_Other := Guid("{0cce9227-69ae-11d9-bed3-505054503030}")

/**
 * @type {Guid}
 */
export global Audit_PrivilegeUse_Sensitive := Guid("{0cce9228-69ae-11d9-bed3-505054503030}")

/**
 * @type {Guid}
 */
export global Audit_PrivilegeUse_NonSensitive := Guid("{0cce9229-69ae-11d9-bed3-505054503030}")

/**
 * @type {Guid}
 */
export global Audit_PrivilegeUse_Others := Guid("{0cce922a-69ae-11d9-bed3-505054503030}")

/**
 * @type {Guid}
 */
export global Audit_DetailedTracking_ProcessCreation := Guid("{0cce922b-69ae-11d9-bed3-505054503030}")

/**
 * @type {Guid}
 */
export global Audit_DetailedTracking_ProcessTermination := Guid("{0cce922c-69ae-11d9-bed3-505054503030}")

/**
 * @type {Guid}
 */
export global Audit_DetailedTracking_DpapiActivity := Guid("{0cce922d-69ae-11d9-bed3-505054503030}")

/**
 * @type {Guid}
 */
export global Audit_DetailedTracking_RpcCall := Guid("{0cce922e-69ae-11d9-bed3-505054503030}")

/**
 * @type {Guid}
 */
export global Audit_PolicyChange_AuditPolicy := Guid("{0cce922f-69ae-11d9-bed3-505054503030}")

/**
 * @type {Guid}
 */
export global Audit_PolicyChange_AuthenticationPolicy := Guid("{0cce9230-69ae-11d9-bed3-505054503030}")

/**
 * @type {Guid}
 */
export global Audit_PolicyChange_AuthorizationPolicy := Guid("{0cce9231-69ae-11d9-bed3-505054503030}")

/**
 * @type {Guid}
 */
export global Audit_PolicyChange_MpsscvRulePolicy := Guid("{0cce9232-69ae-11d9-bed3-505054503030}")

/**
 * @type {Guid}
 */
export global Audit_PolicyChange_WfpIPSecPolicy := Guid("{0cce9233-69ae-11d9-bed3-505054503030}")

/**
 * @type {Guid}
 */
export global Audit_PolicyChange_Others := Guid("{0cce9234-69ae-11d9-bed3-505054503030}")

/**
 * @type {Guid}
 */
export global Audit_AccountManagement_UserAccount := Guid("{0cce9235-69ae-11d9-bed3-505054503030}")

/**
 * @type {Guid}
 */
export global Audit_AccountManagement_ComputerAccount := Guid("{0cce9236-69ae-11d9-bed3-505054503030}")

/**
 * @type {Guid}
 */
export global Audit_AccountManagement_SecurityGroup := Guid("{0cce9237-69ae-11d9-bed3-505054503030}")

/**
 * @type {Guid}
 */
export global Audit_AccountManagement_DistributionGroup := Guid("{0cce9238-69ae-11d9-bed3-505054503030}")

/**
 * @type {Guid}
 */
export global Audit_AccountManagement_ApplicationGroup := Guid("{0cce9239-69ae-11d9-bed3-505054503030}")

/**
 * @type {Guid}
 */
export global Audit_AccountManagement_Others := Guid("{0cce923a-69ae-11d9-bed3-505054503030}")

/**
 * @type {Guid}
 */
export global Audit_DSAccess_DSAccess := Guid("{0cce923b-69ae-11d9-bed3-505054503030}")

/**
 * @type {Guid}
 */
export global Audit_DsAccess_AdAuditChanges := Guid("{0cce923c-69ae-11d9-bed3-505054503030}")

/**
 * @type {Guid}
 */
export global Audit_Ds_Replication := Guid("{0cce923d-69ae-11d9-bed3-505054503030}")

/**
 * @type {Guid}
 */
export global Audit_Ds_DetailedReplication := Guid("{0cce923e-69ae-11d9-bed3-505054503030}")

/**
 * @type {Guid}
 */
export global Audit_AccountLogon_CredentialValidation := Guid("{0cce923f-69ae-11d9-bed3-505054503030}")

/**
 * @type {Guid}
 */
export global Audit_AccountLogon_Kerberos := Guid("{0cce9240-69ae-11d9-bed3-505054503030}")

/**
 * @type {Guid}
 */
export global Audit_AccountLogon_Others := Guid("{0cce9241-69ae-11d9-bed3-505054503030}")

/**
 * @type {Guid}
 */
export global Audit_AccountLogon_KerbCredentialValidation := Guid("{0cce9242-69ae-11d9-bed3-505054503030}")

/**
 * @type {Guid}
 */
export global Audit_Logon_NPS := Guid("{0cce9243-69ae-11d9-bed3-505054503030}")

/**
 * @type {Guid}
 */
export global Audit_ObjectAccess_DetailedFileShare := Guid("{0cce9244-69ae-11d9-bed3-505054503030}")

/**
 * @type {Guid}
 */
export global Audit_ObjectAccess_RemovableStorage := Guid("{0cce9245-69ae-11d9-bed3-505054503030}")

/**
 * @type {Guid}
 */
export global Audit_ObjectAccess_CbacStaging := Guid("{0cce9246-69ae-11d9-bed3-505054503030}")

/**
 * @type {Guid}
 */
export global Audit_Logon_Claims := Guid("{0cce9247-69ae-11d9-bed3-505054503030}")

/**
 * @type {Guid}
 */
export global Audit_DetailedTracking_PnpActivity := Guid("{0cce9248-69ae-11d9-bed3-505054503030}")

/**
 * @type {Guid}
 */
export global Audit_Logon_Groups := Guid("{0cce9249-69ae-11d9-bed3-505054503030}")

/**
 * @type {Guid}
 */
export global Audit_DetailedTracking_TokenRightAdjusted := Guid("{0cce924a-69ae-11d9-bed3-505054503030}")

/**
 * @type {Guid}
 */
export global Audit_Logon_AccessRights := Guid("{0cce924b-69ae-11d9-bed3-505054503030}")

/**
 * @type {Guid}
 */
export global Audit_System := Guid("{69979848-797a-11d9-bed3-505054503030}")

/**
 * @type {Guid}
 */
export global Audit_Logon := Guid("{69979849-797a-11d9-bed3-505054503030}")

/**
 * @type {Guid}
 */
export global Audit_ObjectAccess := Guid("{6997984a-797a-11d9-bed3-505054503030}")

/**
 * @type {Guid}
 */
export global Audit_PrivilegeUse := Guid("{6997984b-797a-11d9-bed3-505054503030}")

/**
 * @type {Guid}
 */
export global Audit_DetailedTracking := Guid("{6997984c-797a-11d9-bed3-505054503030}")

/**
 * @type {Guid}
 */
export global Audit_PolicyChange := Guid("{6997984d-797a-11d9-bed3-505054503030}")

/**
 * @type {Guid}
 */
export global Audit_AccountManagement := Guid("{6997984e-797a-11d9-bed3-505054503030}")

/**
 * @type {Guid}
 */
export global Audit_DirectoryServiceAccess := Guid("{6997984f-797a-11d9-bed3-505054503030}")

/**
 * @type {Guid}
 */
export global Audit_AccountLogon := Guid("{69979850-797a-11d9-bed3-505054503030}")

/**
 * @type {Integer (Int32)}
 */
export global DOMAIN_NO_LM_OWF_CHANGE := 64

/**
 * @type {String}
 */
export global SAM_PASSWORD_CHANGE_NOTIFY_ROUTINE := "PasswordChangeNotify"

/**
 * @type {String}
 */
export global SAM_INIT_NOTIFICATION_ROUTINE := "InitializeChangeNotify"

/**
 * @type {String}
 */
export global SAM_PASSWORD_FILTER_ROUTINE := "PasswordFilter"

/**
 * @type {String}
 */
export global MSV1_0_PACKAGE_NAME := "MICROSOFT_AUTHENTICATION_PACKAGE_V1_0"

/**
 * @type {String}
 */
export global MSV1_0_PACKAGE_NAMEW := "MICROSOFT_AUTHENTICATION_PACKAGE_V1_0"

/**
 * @type {String}
 */
export global MSV1_0_SUBAUTHENTICATION_KEY := "SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0"

/**
 * @type {String}
 */
export global MSV1_0_SUBAUTHENTICATION_VALUE := "Auth"

/**
 * @type {Integer (UInt32)}
 */
export global MSV1_0_CHALLENGE_LENGTH := 8

/**
 * @type {Integer (UInt32)}
 */
export global MSV1_0_USER_SESSION_KEY_LENGTH := 16

/**
 * @type {Integer (UInt32)}
 */
export global MSV1_0_LANMAN_SESSION_KEY_LENGTH := 8

/**
 * @type {Integer (UInt32)}
 */
export global MSV1_0_USE_CLIENT_CHALLENGE := 128

/**
 * @type {Integer (UInt32)}
 */
export global MSV1_0_DISABLE_PERSONAL_FALLBACK := 4096

/**
 * @type {Integer (UInt32)}
 */
export global MSV1_0_ALLOW_FORCE_GUEST := 8192

/**
 * @type {Integer (UInt32)}
 */
export global MSV1_0_CLEARTEXT_PASSWORD_SUPPLIED := 16384

/**
 * @type {Integer (UInt32)}
 */
export global MSV1_0_USE_DOMAIN_FOR_ROUTING_ONLY := 32768

/**
 * @type {Integer (UInt32)}
 */
export global MSV1_0_SUBAUTHENTICATION_DLL_EX := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global MSV1_0_ALLOW_MSVCHAPV2 := 65536

/**
 * @type {Integer (UInt32)}
 */
export global MSV1_0_S4U2SELF := 131072

/**
 * @type {Integer (UInt32)}
 */
export global MSV1_0_CHECK_LOGONHOURS_FOR_S4U := 262144

/**
 * @type {Integer (UInt32)}
 */
export global MSV1_0_INTERNET_DOMAIN := 524288

/**
 * @type {Integer (UInt32)}
 */
export global MSV1_0_SUBAUTHENTICATION_DLL := 4278190080

/**
 * @type {Integer (UInt32)}
 */
export global MSV1_0_SUBAUTHENTICATION_DLL_SHIFT := 24

/**
 * @type {Integer (UInt32)}
 */
export global MSV1_0_MNS_LOGON := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global MSV1_0_SUBAUTHENTICATION_DLL_RAS := 2

/**
 * @type {Integer (UInt32)}
 */
export global MSV1_0_SUBAUTHENTICATION_DLL_IIS := 132

/**
 * @type {Integer (UInt32)}
 */
export global MSV1_0_S4U_LOGON_FLAG_CHECK_LOGONHOURS := 2

/**
 * @type {Integer (UInt32)}
 */
export global LOGON_NTLMV2_ENABLED := 256

/**
 * @type {Integer (UInt32)}
 */
export global LOGON_NT_V2 := 2048

/**
 * @type {Integer (UInt32)}
 */
export global LOGON_LM_V2 := 4096

/**
 * @type {Integer (UInt32)}
 */
export global LOGON_NTLM_V2 := 8192

/**
 * @type {Integer (UInt32)}
 */
export global LOGON_OPTIMIZED := 16384

/**
 * @type {Integer (UInt32)}
 */
export global LOGON_WINLOGON := 32768

/**
 * @type {Integer (UInt32)}
 */
export global LOGON_PKINIT := 65536

/**
 * @type {Integer (UInt32)}
 */
export global LOGON_NO_OPTIMIZED := 131072

/**
 * @type {Integer (UInt32)}
 */
export global LOGON_NO_ELEVATION := 262144

/**
 * @type {Integer (UInt32)}
 */
export global LOGON_MANAGED_SERVICE := 524288

/**
 * @type {Integer (UInt32)}
 */
export global MSV1_0_SUBAUTHENTICATION_FLAGS := 4278190080

/**
 * @type {Integer (UInt32)}
 */
export global LOGON_GRACE_LOGON := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global MSV1_0_OWF_PASSWORD_LENGTH := 16

/**
 * @type {Integer (UInt32)}
 */
export global MSV1_0_SHA_PASSWORD_LENGTH := 20

/**
 * @type {Integer (UInt32)}
 */
export global MSV1_0_CREDENTIAL_KEY_LENGTH := 20

/**
 * @type {Integer (UInt32)}
 */
export global MSV1_0_CRED_REMOVED := 4

/**
 * @type {Integer (UInt32)}
 */
export global MSV1_0_CRED_CREDKEY_PRESENT := 8

/**
 * @type {Integer (UInt32)}
 */
export global MSV1_0_CRED_SHA_PRESENT := 16

/**
 * @type {Integer (UInt32)}
 */
export global MSV1_0_CRED_VERSION_V2 := 2

/**
 * @type {Integer (UInt32)}
 */
export global MSV1_0_CRED_VERSION_V3 := 4

/**
 * @type {Integer (UInt32)}
 */
export global MSV1_0_CRED_VERSION_IUM := 4294901761

/**
 * @type {Integer (UInt32)}
 */
export global MSV1_0_CRED_VERSION_REMOTE := 4294901762

/**
 * @type {Integer (UInt32)}
 */
export global MSV1_0_CRED_VERSION_ARSO := 4294901763

/**
 * @type {Integer (UInt32)}
 */
export global MSV1_0_CRED_VERSION_RESERVED_1 := 4294967294

/**
 * @type {Integer (UInt32)}
 */
export global MSV1_0_CRED_VERSION_INVALID := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global MSV1_0_NTLM3_RESPONSE_LENGTH := 16

/**
 * @type {Integer (UInt32)}
 */
export global MSV1_0_NTLM3_OWF_LENGTH := 16

/**
 * @type {Integer (UInt32)}
 */
export global MSV1_0_MAX_NTLM3_LIFE := 1800

/**
 * @type {Integer (UInt32)}
 */
export global MSV1_0_MAX_AVL_SIZE := 64000

/**
 * @type {Integer (UInt32)}
 */
export global MSV1_0_AV_FLAG_FORCE_GUEST := 1

/**
 * @type {Integer (UInt32)}
 */
export global MSV1_0_AV_FLAG_MIC_HANDSHAKE_MESSAGES := 2

/**
 * @type {Integer (UInt32)}
 */
export global MSV1_0_AV_FLAG_UNVERIFIED_TARGET := 4

/**
 * @type {Integer (UInt32)}
 */
export global RTL_ENCRYPT_MEMORY_SIZE := 8

/**
 * @type {Integer (UInt32)}
 */
export global RTL_ENCRYPT_OPTION_CROSS_PROCESS := 1

/**
 * @type {Integer (UInt32)}
 */
export global RTL_ENCRYPT_OPTION_SAME_LOGON := 2

/**
 * @type {Integer (UInt32)}
 */
export global RTL_ENCRYPT_OPTION_FOR_SYSTEM := 4

/**
 * @type {Integer (UInt32)}
 */
export global KERBEROS_VERSION := 5

/**
 * @type {Integer (UInt32)}
 */
export global KERBEROS_REVISION := 6

/**
 * @type {Integer (UInt32)}
 */
export global KERB_ETYPE_AES128_CTS_HMAC_SHA1_96 := 17

/**
 * @type {Integer (UInt32)}
 */
export global KERB_ETYPE_AES256_CTS_HMAC_SHA1_96 := 18

/**
 * @type {Integer (UInt32)}
 */
export global KERB_ETYPE_AES128_CTS_HMAC_SHA256 := 19

/**
 * @type {Integer (UInt32)}
 */
export global KERB_ETYPE_AES256_CTS_HMAC_SHA384 := 20

/**
 * @type {Integer (Int32)}
 */
export global KERB_ETYPE_RC4_PLAIN2 := -129

/**
 * @type {Integer (Int32)}
 */
export global KERB_ETYPE_RC4_LM := -130

/**
 * @type {Integer (Int32)}
 */
export global KERB_ETYPE_RC4_SHA := -131

/**
 * @type {Integer (Int32)}
 */
export global KERB_ETYPE_DES_PLAIN := -132

/**
 * @type {Integer (Int32)}
 */
export global KERB_ETYPE_RC4_HMAC_OLD := -133

/**
 * @type {Integer (Int32)}
 */
export global KERB_ETYPE_RC4_PLAIN_OLD := -134

/**
 * @type {Integer (Int32)}
 */
export global KERB_ETYPE_RC4_HMAC_OLD_EXP := -135

/**
 * @type {Integer (Int32)}
 */
export global KERB_ETYPE_RC4_PLAIN_OLD_EXP := -136

/**
 * @type {Integer (Int32)}
 */
export global KERB_ETYPE_RC4_PLAIN := -140

/**
 * @type {Integer (Int32)}
 */
export global KERB_ETYPE_RC4_PLAIN_EXP := -141

/**
 * @type {Integer (Int32)}
 */
export global KERB_ETYPE_AES128_CTS_HMAC_SHA1_96_PLAIN := -148

/**
 * @type {Integer (Int32)}
 */
export global KERB_ETYPE_AES256_CTS_HMAC_SHA1_96_PLAIN := -149

/**
 * @type {Integer (UInt32)}
 */
export global KERB_ETYPE_DSA_SHA1_CMS := 9

/**
 * @type {Integer (UInt32)}
 */
export global KERB_ETYPE_RSA_MD5_CMS := 10

/**
 * @type {Integer (UInt32)}
 */
export global KERB_ETYPE_RSA_SHA1_CMS := 11

/**
 * @type {Integer (UInt32)}
 */
export global KERB_ETYPE_RC2_CBC_ENV := 12

/**
 * @type {Integer (UInt32)}
 */
export global KERB_ETYPE_RSA_ENV := 13

/**
 * @type {Integer (UInt32)}
 */
export global KERB_ETYPE_RSA_ES_OEAP_ENV := 14

/**
 * @type {Integer (UInt32)}
 */
export global KERB_ETYPE_DES_EDE3_CBC_ENV := 15

/**
 * @type {Integer (UInt32)}
 */
export global KERB_ETYPE_DSA_SIGN := 8

/**
 * @type {Integer (UInt32)}
 */
export global KERB_ETYPE_RSA_PRIV := 9

/**
 * @type {Integer (UInt32)}
 */
export global KERB_ETYPE_RSA_PUB := 10

/**
 * @type {Integer (UInt32)}
 */
export global KERB_ETYPE_RSA_PUB_MD5 := 11

/**
 * @type {Integer (UInt32)}
 */
export global KERB_ETYPE_RSA_PUB_SHA1 := 12

/**
 * @type {Integer (UInt32)}
 */
export global KERB_ETYPE_PKCS7_PUB := 13

/**
 * @type {Integer (UInt32)}
 */
export global KERB_ETYPE_DES3_CBC_MD5 := 5

/**
 * @type {Integer (UInt32)}
 */
export global KERB_ETYPE_DES3_CBC_SHA1 := 7

/**
 * @type {Integer (UInt32)}
 */
export global KERB_ETYPE_DES3_CBC_SHA1_KD := 16

/**
 * @type {Integer (UInt32)}
 */
export global KERB_ETYPE_DES_CBC_MD5_NT := 20

/**
 * @type {Integer (UInt32)}
 */
export global KERB_ETYPE_RC4_HMAC_NT_EXP := 24

/**
 * @type {Integer (UInt32)}
 */
export global KERB_CHECKSUM_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global KERB_CHECKSUM_CRC32 := 1

/**
 * @type {Integer (UInt32)}
 */
export global KERB_CHECKSUM_MD4 := 2

/**
 * @type {Integer (UInt32)}
 */
export global KERB_CHECKSUM_KRB_DES_MAC := 4

/**
 * @type {Integer (UInt32)}
 */
export global KERB_CHECKSUM_KRB_DES_MAC_K := 5

/**
 * @type {Integer (UInt32)}
 */
export global KERB_CHECKSUM_MD5 := 7

/**
 * @type {Integer (UInt32)}
 */
export global KERB_CHECKSUM_MD5_DES := 8

/**
 * @type {Integer (UInt32)}
 */
export global KERB_CHECKSUM_SHA1_NEW := 14

/**
 * @type {Integer (UInt32)}
 */
export global KERB_CHECKSUM_HMAC_SHA1_96_AES128 := 15

/**
 * @type {Integer (UInt32)}
 */
export global KERB_CHECKSUM_HMAC_SHA1_96_AES256 := 16

/**
 * @type {Integer (Int32)}
 */
export global KERB_CHECKSUM_LM := -130

/**
 * @type {Integer (Int32)}
 */
export global KERB_CHECKSUM_SHA1 := -131

/**
 * @type {Integer (Int32)}
 */
export global KERB_CHECKSUM_REAL_CRC32 := -132

/**
 * @type {Integer (Int32)}
 */
export global KERB_CHECKSUM_DES_MAC := -133

/**
 * @type {Integer (Int32)}
 */
export global KERB_CHECKSUM_DES_MAC_MD5 := -134

/**
 * @type {Integer (Int32)}
 */
export global KERB_CHECKSUM_MD25 := -135

/**
 * @type {Integer (Int32)}
 */
export global KERB_CHECKSUM_RC4_MD5 := -136

/**
 * @type {Integer (Int32)}
 */
export global KERB_CHECKSUM_MD5_HMAC := -137

/**
 * @type {Integer (Int32)}
 */
export global KERB_CHECKSUM_HMAC_MD5 := -138

/**
 * @type {Integer (Int32)}
 */
export global KERB_CHECKSUM_SHA256 := -139

/**
 * @type {Integer (Int32)}
 */
export global KERB_CHECKSUM_SHA384 := -140

/**
 * @type {Integer (Int32)}
 */
export global KERB_CHECKSUM_SHA512 := -141

/**
 * @type {Integer (Int32)}
 */
export global KERB_CHECKSUM_HMAC_SHA1_96_AES128_Ki := -150

/**
 * @type {Integer (Int32)}
 */
export global KERB_CHECKSUM_HMAC_SHA1_96_AES256_Ki := -151

/**
 * @type {Integer (UInt32)}
 */
export global AUTH_REQ_ALLOW_FORWARDABLE := 1

/**
 * @type {Integer (UInt32)}
 */
export global AUTH_REQ_ALLOW_PROXIABLE := 2

/**
 * @type {Integer (UInt32)}
 */
export global AUTH_REQ_ALLOW_POSTDATE := 4

/**
 * @type {Integer (UInt32)}
 */
export global AUTH_REQ_ALLOW_RENEWABLE := 8

/**
 * @type {Integer (UInt32)}
 */
export global AUTH_REQ_ALLOW_NOADDRESS := 16

/**
 * @type {Integer (UInt32)}
 */
export global AUTH_REQ_ALLOW_ENC_TKT_IN_SKEY := 32

/**
 * @type {Integer (UInt32)}
 */
export global AUTH_REQ_ALLOW_VALIDATE := 64

/**
 * @type {Integer (UInt32)}
 */
export global AUTH_REQ_VALIDATE_CLIENT := 128

/**
 * @type {Integer (UInt32)}
 */
export global AUTH_REQ_OK_AS_DELEGATE := 256

/**
 * @type {Integer (UInt32)}
 */
export global AUTH_REQ_PREAUTH_REQUIRED := 512

/**
 * @type {Integer (UInt32)}
 */
export global AUTH_REQ_TRANSITIVE_TRUST := 1024

/**
 * @type {Integer (UInt32)}
 */
export global AUTH_REQ_ALLOW_S4U_DELEGATE := 2048

/**
 * @type {Integer (UInt32)}
 */
export global KERB_TICKET_FLAGS_name_canonicalize := 65536

/**
 * @type {Integer (UInt32)}
 */
export global KERB_TICKET_FLAGS_cname_in_pa_data := 262144

/**
 * @type {Integer (UInt32)}
 */
export global KERB_TICKET_FLAGS_enc_pa_rep := 65536

/**
 * @type {Integer (UInt32)}
 */
export global KRB_NT_UNKNOWN := 0

/**
 * @type {Integer (UInt32)}
 */
export global KRB_NT_PRINCIPAL := 1

/**
 * @type {Integer (Int32)}
 */
export global KRB_NT_PRINCIPAL_AND_ID := -131

/**
 * @type {Integer (UInt32)}
 */
export global KRB_NT_SRV_INST := 2

/**
 * @type {Integer (Int32)}
 */
export global KRB_NT_SRV_INST_AND_ID := -132

/**
 * @type {Integer (UInt32)}
 */
export global KRB_NT_SRV_HST := 3

/**
 * @type {Integer (UInt32)}
 */
export global KRB_NT_SRV_XHST := 4

/**
 * @type {Integer (UInt32)}
 */
export global KRB_NT_UID := 5

/**
 * @type {Integer (UInt32)}
 */
export global KRB_NT_ENTERPRISE_PRINCIPAL := 10

/**
 * @type {Integer (UInt32)}
 */
export global KRB_NT_WELLKNOWN := 11

/**
 * @type {Integer (Int32)}
 */
export global KRB_NT_ENT_PRINCIPAL_AND_ID := -130

/**
 * @type {Integer (Int32)}
 */
export global KRB_NT_MS_PRINCIPAL := -128

/**
 * @type {Integer (Int32)}
 */
export global KRB_NT_MS_PRINCIPAL_AND_ID := -129

/**
 * @type {Integer (Int32)}
 */
export global KRB_NT_MS_BRANCH_ID := -133

/**
 * @type {Integer (UInt32)}
 */
export global KRB_NT_X500_PRINCIPAL := 6

/**
 * @type {String}
 */
export global KRB_WELLKNOWN_STRING := "WELLKNOWN"

/**
 * @type {String}
 */
export global KRB_ANONYMOUS_STRING := "ANONYMOUS"

/**
 * @type {Integer (UInt32)}
 */
export global KERB_WRAP_NO_ENCRYPT := 2147483649

/**
 * @type {Integer (UInt32)}
 */
export global KERB_CERTIFICATE_LOGON_FLAG_CHECK_DUPLICATES := 1

/**
 * @type {Integer (UInt32)}
 */
export global KERB_CERTIFICATE_LOGON_FLAG_USE_CERTIFICATE_INFO := 2

/**
 * @type {Integer (UInt32)}
 */
export global KERB_CERTIFICATE_S4U_LOGON_FLAG_CHECK_DUPLICATES := 1

/**
 * @type {Integer (UInt32)}
 */
export global KERB_CERTIFICATE_S4U_LOGON_FLAG_CHECK_LOGONHOURS := 2

/**
 * @type {Integer (UInt32)}
 */
export global KERB_CERTIFICATE_S4U_LOGON_FLAG_FAIL_IF_NT_AUTH_POLICY_REQUIRED := 4

/**
 * @type {Integer (UInt32)}
 */
export global KERB_CERTIFICATE_S4U_LOGON_FLAG_IDENTIFY := 8

/**
 * @type {Integer (UInt32)}
 */
export global KERB_LOGON_FLAG_ALLOW_EXPIRED_TICKET := 1

/**
 * @type {Integer (UInt32)}
 */
export global KERB_LOGON_FLAG_REDIRECTED := 2

/**
 * @type {Integer (UInt32)}
 */
export global KERB_S4U_LOGON_FLAG_CHECK_LOGONHOURS := 2

/**
 * @type {Integer (UInt32)}
 */
export global KERB_S4U_LOGON_FLAG_IDENTIFY := 8

/**
 * @type {Integer (UInt32)}
 */
export global KERB_USE_DEFAULT_TICKET_FLAGS := 0

/**
 * @type {Integer (UInt32)}
 */
export global KERB_RETRIEVE_TICKET_DEFAULT := 0

/**
 * @type {Integer (UInt32)}
 */
export global KERB_RETRIEVE_TICKET_DONT_USE_CACHE := 1

/**
 * @type {Integer (UInt32)}
 */
export global KERB_RETRIEVE_TICKET_USE_CACHE_ONLY := 2

/**
 * @type {Integer (UInt32)}
 */
export global KERB_RETRIEVE_TICKET_USE_CREDHANDLE := 4

/**
 * @type {Integer (UInt32)}
 */
export global KERB_RETRIEVE_TICKET_AS_KERB_CRED := 8

/**
 * @type {Integer (UInt32)}
 */
export global KERB_RETRIEVE_TICKET_WITH_SEC_CRED := 16

/**
 * @type {Integer (UInt32)}
 */
export global KERB_RETRIEVE_TICKET_CACHE_TICKET := 32

/**
 * @type {Integer (UInt32)}
 */
export global KERB_RETRIEVE_TICKET_MAX_LIFETIME := 64

/**
 * @type {Integer (UInt32)}
 */
export global KERB_ETYPE_DEFAULT := 0

/**
 * @type {Integer (UInt32)}
 */
export global KERB_PURGE_ALL_TICKETS := 1

/**
 * @type {Integer (UInt32)}
 */
export global KERB_S4U2PROXY_CACHE_ENTRY_INFO_FLAG_NEGATIVE := 1

/**
 * @type {Integer (UInt32)}
 */
export global KERB_S4U2PROXY_CRED_FLAG_NEGATIVE := 1

/**
 * @type {Integer (UInt32)}
 */
export global KERB_REFRESH_POLICY_KERBEROS := 1

/**
 * @type {Integer (UInt32)}
 */
export global KERB_REFRESH_POLICY_KDC := 2

/**
 * @type {Integer (UInt32)}
 */
export global KERB_CLOUD_KERBEROS_DEBUG_DATA_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global DS_UNKNOWN_ADDRESS_TYPE := 0

/**
 * @type {Integer (UInt32)}
 */
export global KERB_SETPASS_USE_LOGONID := 1

/**
 * @type {Integer (UInt32)}
 */
export global KERB_SETPASS_USE_CREDHANDLE := 2

/**
 * @type {Integer (UInt32)}
 */
export global KERB_DECRYPT_FLAG_DEFAULT_KEY := 1

/**
 * @type {Integer (UInt32)}
 */
export global KERB_REFRESH_SCCRED_RELEASE := 0

/**
 * @type {Integer (UInt32)}
 */
export global KERB_REFRESH_SCCRED_GETTGT := 1

/**
 * @type {Integer (UInt32)}
 */
export global KERB_REQUEST_CRED_LOCAL_ACCOUNT := 8

/**
 * @type {Integer (UInt32)}
 */
export global KERB_TRANSFER_CRED_WITH_TICKETS := 1

/**
 * @type {Integer (UInt32)}
 */
export global KERB_TRANSFER_CRED_CLEANUP_CREDENTIALS := 2

/**
 * @type {Integer (UInt32)}
 */
export global KERB_QUERY_DOMAIN_EXTENDED_POLICIES_RESPONSE_FLAG_DAC_DISABLED := 1

/**
 * @type {Integer (UInt32)}
 */
export global AUDIT_SET_SYSTEM_POLICY := 1

/**
 * @type {Integer (UInt32)}
 */
export global AUDIT_QUERY_SYSTEM_POLICY := 2

/**
 * @type {Integer (UInt32)}
 */
export global AUDIT_SET_USER_POLICY := 4

/**
 * @type {Integer (UInt32)}
 */
export global AUDIT_QUERY_USER_POLICY := 8

/**
 * @type {Integer (UInt32)}
 */
export global AUDIT_ENUMERATE_USERS := 16

/**
 * @type {Integer (UInt32)}
 */
export global AUDIT_SET_MISC_POLICY := 32

/**
 * @type {Integer (UInt32)}
 */
export global AUDIT_QUERY_MISC_POLICY := 64

/**
 * @type {String}
 */
export global PKU2U_PACKAGE_NAME_A := "pku2u"

/**
 * @type {String}
 */
export global PKU2U_PACKAGE_NAME := "pku2u"

/**
 * @type {String}
 */
export global PKU2U_PACKAGE_NAME_W := "pku2u"

/**
 * @type {String}
 */
export global SAM_CREDENTIAL_UPDATE_NOTIFY_ROUTINE := "CredentialUpdateNotify"

/**
 * @type {String}
 */
export global SAM_CREDENTIAL_UPDATE_REGISTER_ROUTINE := "CredentialUpdateRegister"

/**
 * @type {String}
 */
export global SAM_CREDENTIAL_UPDATE_FREE_ROUTINE := "CredentialUpdateFree"

/**
 * @type {String}
 */
export global SAM_CREDENTIAL_UPDATE_REGISTER_MAPPED_ENTRYPOINTS_ROUTINE := "RegisterMappedEntrypoints"

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_CLIENT_PROCESS_TERMINATED := 1

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_CLIENT_THREAD_TERMINATED := 2

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_CALL_KERNEL_MODE := 1

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_CALL_ANSI := 2

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_CALL_URGENT := 4

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_CALL_RECURSIVE := 8

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_CALL_IN_PROC := 16

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_CALL_CLEANUP := 32

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_CALL_WOWCLIENT := 64

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_CALL_THREAD_TERM := 128

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_CALL_PROCESS_TERM := 256

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_CALL_IS_TCB := 512

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_CALL_NETWORK_ONLY := 1024

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_CALL_WINLOGON := 2048

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_CALL_ASYNC_UPDATE := 4096

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_CALL_SYSTEM_PROC := 8192

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_CALL_NEGO := 16384

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_CALL_NEGO_EXTENDER := 32768

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_CALL_BUFFER_MARSHAL := 65536

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_CALL_UNLOCK := 131072

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_CALL_CLOUDAP_CONNECT := 262144

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_CALL_WOWX86 := 64

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_CALL_WOWA32 := 262144

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_CREDENTIAL_VERSION := 201

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_CREDENTIAL_FLAGS_CALLER_HAS_TCB := 1

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_CREDENTIAL_FLAGS_CREDMAN_CRED := 2

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_SURROGATE_LOGON_VERSION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global SECBUFFER_UNMAPPED := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global SECBUFFER_KERNEL_MAP := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global PRIMARY_CRED_CLEAR_PASSWORD := 1

/**
 * @type {Integer (UInt32)}
 */
export global PRIMARY_CRED_OWF_PASSWORD := 2

/**
 * @type {Integer (UInt32)}
 */
export global PRIMARY_CRED_UPDATE := 4

/**
 * @type {Integer (UInt32)}
 */
export global PRIMARY_CRED_CACHED_LOGON := 8

/**
 * @type {Integer (UInt32)}
 */
export global PRIMARY_CRED_LOGON_NO_TCB := 16

/**
 * @type {Integer (UInt32)}
 */
export global PRIMARY_CRED_LOGON_LUA := 32

/**
 * @type {Integer (UInt32)}
 */
export global PRIMARY_CRED_INTERACTIVE_SMARTCARD_LOGON := 64

/**
 * @type {Integer (UInt32)}
 */
export global PRIMARY_CRED_REFRESH_NEEDED := 128

/**
 * @type {Integer (UInt32)}
 */
export global PRIMARY_CRED_INTERNET_USER := 256

/**
 * @type {Integer (UInt32)}
 */
export global PRIMARY_CRED_AUTH_ID := 512

/**
 * @type {Integer (UInt32)}
 */
export global PRIMARY_CRED_DO_NOT_SPLIT := 1024

/**
 * @type {Integer (UInt32)}
 */
export global PRIMARY_CRED_PROTECTED_USER := 2048

/**
 * @type {Integer (UInt32)}
 */
export global PRIMARY_CRED_EX := 4096

/**
 * @type {Integer (UInt32)}
 */
export global PRIMARY_CRED_TRANSFER := 8192

/**
 * @type {Integer (UInt32)}
 */
export global PRIMARY_CRED_RESTRICTED_TS := 16384

/**
 * @type {Integer (UInt32)}
 */
export global PRIMARY_CRED_PACKED_CREDS := 32768

/**
 * @type {Integer (UInt32)}
 */
export global PRIMARY_CRED_ENTERPRISE_INTERNET_USER := 65536

/**
 * @type {Integer (UInt32)}
 */
export global PRIMARY_CRED_ENCRYPTED_CREDGUARD_PASSWORD := 131072

/**
 * @type {Integer (UInt32)}
 */
export global PRIMARY_CRED_CACHED_INTERACTIVE_LOGON := 262144

/**
 * @type {Integer (UInt32)}
 */
export global PRIMARY_CRED_INTERACTIVE_NGC_LOGON := 524288

/**
 * @type {Integer (UInt32)}
 */
export global PRIMARY_CRED_INTERACTIVE_FIDO_LOGON := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global PRIMARY_CRED_ARSO_LOGON := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global PRIMARY_CRED_SUPPLEMENTAL := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global PRIMARY_CRED_FOR_PASSWORD_CHANGE := 8388608

/**
 * @type {Integer (UInt32)}
 */
export global PRIMARY_CRED_LOCAL_USER := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global PRIMARY_CRED_LOGON_PACKAGE_SHIFT := 24

/**
 * @type {Integer (UInt32)}
 */
export global PRIMARY_CRED_PACKAGE_MASK := 4278190080

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_PRIMARY_CRED_EX_FLAGS_EX_DELEGATION_TOKEN := 1

/**
 * @type {Integer (UInt32)}
 */
export global MAX_CRED_SIZE := 1024

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_STATE_ENCRYPTION_PERMITTED := 1

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_STATE_STRONG_ENCRYPTION_PERMITTED := 2

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_STATE_DOMAIN_CONTROLLER := 4

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_STATE_WORKSTATION := 8

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_STATE_STANDALONE := 16

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_STATE_CRED_ISOLATION_ENABLED := 32

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_STATE_RESERVED_1 := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_MAX_OID_LENGTH := 32

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_MSVAV_FLAGS_VALID := 1

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_MSVAV_TIMESTAMP_VALID := 2

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_ATTR_SASL_CONTEXT := 65536

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_ATTR_THUNK_ALL := 65536

/**
 * @type {Integer (UInt32)}
 */
export global UNDERSTANDS_LONG_NAMES := 1

/**
 * @type {Integer (UInt32)}
 */
export global NO_LONG_NAMES := 2

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_CALL_PACKAGE_TRANSFER_CRED_REQUEST_FLAG_OPTIMISTIC_LOGON := 1

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_CALL_PACKAGE_TRANSFER_CRED_REQUEST_FLAG_CLEANUP_CREDENTIALS := 2

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_CALL_PACKAGE_TRANSFER_CRED_REQUEST_FLAG_TO_SSO_SESSION := 4

/**
 * @type {Guid}
 */
export global SECPKG_REDIRECTED_LOGON_GUID_INITIALIZER := Guid("{c2be5457-82eb-483e-ae4e-7468ef14d509}")

/**
 * @type {Integer (UInt32)}
 */
export global NOTIFIER_FLAG_NEW_THREAD := 1

/**
 * @type {Integer (UInt32)}
 */
export global NOTIFIER_FLAG_ONE_SHOT := 2

/**
 * @type {Integer (UInt32)}
 */
export global NOTIFIER_FLAG_SECONDS := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global NOTIFIER_TYPE_INTERVAL := 1

/**
 * @type {Integer (UInt32)}
 */
export global NOTIFIER_TYPE_HANDLE_WAIT := 2

/**
 * @type {Integer (UInt32)}
 */
export global NOTIFIER_TYPE_STATE_CHANGE := 3

/**
 * @type {Integer (UInt32)}
 */
export global NOTIFIER_TYPE_NOTIFY_EVENT := 4

/**
 * @type {Integer (UInt32)}
 */
export global NOTIFIER_TYPE_IMMEDIATE := 16

/**
 * @type {Integer (UInt32)}
 */
export global NOTIFY_CLASS_PACKAGE_CHANGE := 1

/**
 * @type {Integer (UInt32)}
 */
export global NOTIFY_CLASS_ROLE_CHANGE := 2

/**
 * @type {Integer (UInt32)}
 */
export global NOTIFY_CLASS_DOMAIN_CHANGE := 3

/**
 * @type {Integer (UInt32)}
 */
export global NOTIFY_CLASS_REGISTRY_CHANGE := 4

/**
 * @type {Integer (UInt32)}
 */
export global LSA_QUERY_CLIENT_PRELOGON_SESSION_ID := 1

/**
 * @type {Integer (UInt32)}
 */
export global CREDP_FLAGS_IN_PROCESS := 1

/**
 * @type {Integer (UInt32)}
 */
export global CREDP_FLAGS_USE_MIDL_HEAP := 2

/**
 * @type {Integer (UInt32)}
 */
export global CREDP_FLAGS_DONT_CACHE_TI := 4

/**
 * @type {Integer (UInt32)}
 */
export global CREDP_FLAGS_CLEAR_PASSWORD := 8

/**
 * @type {Integer (UInt32)}
 */
export global CREDP_FLAGS_USER_ENCRYPTED_PASSWORD := 16

/**
 * @type {Integer (UInt32)}
 */
export global CREDP_FLAGS_TRUSTED_CALLER := 32

/**
 * @type {Integer (UInt32)}
 */
export global CREDP_FLAGS_VALIDATE_PROXY_TARGET := 64

/**
 * @type {Integer (UInt32)}
 */
export global CRED_MARSHALED_TI_SIZE_SIZE := 12

/**
 * @type {String}
 */
export global LSA_AP_NAME_LOGON_USER_EX2 := "LsaApLogonUserEx2" Chr(0) ""

/**
 * @type {String}
 */
export global SP_ACCEPT_CREDENTIALS_NAME := "SpAcceptCredentials" Chr(0) ""

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_UNICODE_ATTRIBUTE := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_ANSI_ATTRIBUTE := 0

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_CREDENTIAL_ATTRIBUTE := 0

/**
 * @type {String}
 */
export global SECPKG_LSAMODEINIT_NAME := "SpLsaModeInitialize"

/**
 * @type {String}
 */
export global SECPKG_USERMODEINIT_NAME := "SpUserModeInitialize"

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_INTERFACE_VERSION := 65536

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_INTERFACE_VERSION_2 := 131072

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_INTERFACE_VERSION_3 := 262144

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_INTERFACE_VERSION_4 := 524288

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_INTERFACE_VERSION_5 := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_INTERFACE_VERSION_6 := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_INTERFACE_VERSION_7 := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_INTERFACE_VERSION_8 := 8388608

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_INTERFACE_VERSION_9 := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_INTERFACE_VERSION_10 := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_INTERFACE_VERSION_11 := 67108864

/**
 * @type {String}
 */
export global UNISP_NAME_A := "Microsoft Unified Security Protocol Provider"

/**
 * @type {String}
 */
export global UNISP_NAME_W := "Microsoft Unified Security Protocol Provider"

/**
 * @type {String}
 */
export global SSL2SP_NAME_A := "Microsoft SSL 2.0"

/**
 * @type {String}
 */
export global SSL2SP_NAME_W := "Microsoft SSL 2.0"

/**
 * @type {String}
 */
export global SSL3SP_NAME_A := "Microsoft SSL 3.0"

/**
 * @type {String}
 */
export global SSL3SP_NAME_W := "Microsoft SSL 3.0"

/**
 * @type {String}
 */
export global TLS1SP_NAME_A := "Microsoft TLS 1.0"

/**
 * @type {String}
 */
export global TLS1SP_NAME_W := "Microsoft TLS 1.0"

/**
 * @type {String}
 */
export global PCT1SP_NAME_A := "Microsoft PCT 1.0"

/**
 * @type {String}
 */
export global PCT1SP_NAME_W := "Microsoft PCT 1.0"

/**
 * @type {String}
 */
export global SCHANNEL_NAME_A := "Schannel"

/**
 * @type {String}
 */
export global SCHANNEL_NAME_W := "Schannel"

/**
 * @type {String}
 */
export global DEFAULT_TLS_SSP_NAME_A := "Default TLS SSP"

/**
 * @type {String}
 */
export global DEFAULT_TLS_SSP_NAME_W := "Default TLS SSP"

/**
 * @type {String}
 */
export global UNISP_NAME := "Microsoft Unified Security Protocol Provider"

/**
 * @type {String}
 */
export global PCT1SP_NAME := "Microsoft PCT 1.0"

/**
 * @type {String}
 */
export global SSL2SP_NAME := "Microsoft SSL 2.0"

/**
 * @type {String}
 */
export global SSL3SP_NAME := "Microsoft SSL 3.0"

/**
 * @type {String}
 */
export global TLS1SP_NAME := "Microsoft TLS 1.0"

/**
 * @type {String}
 */
export global SCHANNEL_NAME := "Schannel"

/**
 * @type {String}
 */
export global DEFAULT_TLS_SSP_NAME := "Default TLS SSP"

/**
 * @type {Integer (UInt32)}
 */
export global UNISP_RPC_ID := 14

/**
 * @type {Integer (UInt32)}
 */
export global RCRED_STATUS_NOCRED := 0

/**
 * @type {Integer (UInt32)}
 */
export global RCRED_CRED_EXISTS := 1

/**
 * @type {Integer (UInt32)}
 */
export global RCRED_STATUS_UNKNOWN_ISSUER := 2

/**
 * @type {Integer (UInt32)}
 */
export global LCRED_STATUS_NOCRED := 0

/**
 * @type {Integer (UInt32)}
 */
export global LCRED_CRED_EXISTS := 1

/**
 * @type {Integer (UInt32)}
 */
export global LCRED_STATUS_UNKNOWN_ISSUER := 2

/**
 * @type {Integer (UInt32)}
 */
export global SECPKGCONTEXT_CONNECTION_INFO_EX_V1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global SECPKGCONTEXT_CIPHERINFO_V1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global SSL_SESSION_RECONNECT := 1

/**
 * @type {Integer (UInt32)}
 */
export global KERN_CONTEXT_CERT_INFO_V1 := 0

/**
 * @type {Integer (UInt32)}
 */
export global ENABLE_TLS_CLIENT_EARLY_START := 1

/**
 * @type {Integer (UInt32)}
 */
export global SCH_CRED_V1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global SCH_CRED_V2 := 2

/**
 * @type {Integer (UInt32)}
 */
export global SCH_CRED_VERSION := 2

/**
 * @type {Integer (UInt32)}
 */
export global SCH_CRED_V3 := 3

/**
 * @type {Integer (UInt32)}
 */
export global SCHANNEL_CRED_VERSION := 4

/**
 * @type {Integer (UInt32)}
 */
export global SCH_CREDENTIALS_VERSION := 5

/**
 * @type {String}
 */
export global SCHANNEL_RSA_PSS_PADDING_ALGORITHM := "SCH_RSA_PSS_PAD"

/**
 * @type {String}
 */
export global SCHANNEL_RSA_PKCS_PADDING_ALGORITHM := "SCH_RSA_PKCS_PAD"

/**
 * @type {Integer (UInt32)}
 */
export global TLS_PARAMS_OPTIONAL := 1

/**
 * @type {Integer (UInt32)}
 */
export global SCH_CRED_MAX_SUPPORTED_PARAMETERS := 16

/**
 * @type {Integer (UInt32)}
 */
export global SCH_CRED_MAX_SUPPORTED_ALPN_IDS := 16

/**
 * @type {Integer (UInt32)}
 */
export global SCH_CRED_MAX_SUPPORTED_CRYPTO_SETTINGS := 16

/**
 * @type {Integer (UInt32)}
 */
export global SCH_CRED_MAX_SUPPORTED_CHAINING_MODES := 16

/**
 * @type {Integer (UInt32)}
 */
export global SCH_MAX_EXT_SUBSCRIPTIONS := 2

/**
 * @type {Integer (UInt32)}
 */
export global SCH_CRED_FORMAT_CERT_CONTEXT := 0

/**
 * @type {Integer (UInt32)}
 */
export global SCH_CRED_FORMAT_CERT_HASH := 1

/**
 * @type {Integer (UInt32)}
 */
export global SCH_CRED_FORMAT_CERT_HASH_STORE := 2

/**
 * @type {Integer (UInt32)}
 */
export global SCH_CRED_MAX_STORE_NAME_SIZE := 128

/**
 * @type {Integer (UInt32)}
 */
export global SCH_CRED_MAX_SUPPORTED_ALGS := 256

/**
 * @type {Integer (UInt32)}
 */
export global SCH_CRED_MAX_SUPPORTED_CERTS := 100

/**
 * @type {Integer (UInt32)}
 */
export global SCH_MACHINE_CERT_HASH := 1

/**
 * @type {Integer (UInt32)}
 */
export global SCH_CRED_DISABLE_RECONNECTS := 128

/**
 * @type {Integer (UInt32)}
 */
export global SCH_CRED_RESTRICTED_ROOTS := 8192

/**
 * @type {Integer (UInt32)}
 */
export global SCH_CRED_REVOCATION_CHECK_CACHE_ONLY := 16384

/**
 * @type {Integer (UInt32)}
 */
export global SCH_CRED_CACHE_ONLY_URL_RETRIEVAL := 32768

/**
 * @type {Integer (UInt32)}
 */
export global SCH_CRED_MEMORY_STORE_CERT := 65536

/**
 * @type {Integer (UInt32)}
 */
export global SCH_CRED_SNI_CREDENTIAL := 524288

/**
 * @type {Integer (UInt32)}
 */
export global SCH_CRED_SNI_ENABLE_OCSP := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global SCH_USE_DTLS_ONLY := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global SCH_ALLOW_NULL_ENCRYPTION := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global SCH_CRED_DEFERRED_CRED_VALIDATION := 67108864

/**
 * @type {Integer (UInt32)}
 */
export global SCHANNEL_RENEGOTIATE := 0

/**
 * @type {Integer (UInt32)}
 */
export global SCHANNEL_SHUTDOWN := 1

/**
 * @type {Integer (UInt32)}
 */
export global SCHANNEL_ALERT := 2

/**
 * @type {Integer (UInt32)}
 */
export global SCHANNEL_SESSION := 3

/**
 * @type {Integer (UInt32)}
 */
export global TLS1_ALERT_CLOSE_NOTIFY := 0

/**
 * @type {Integer (UInt32)}
 */
export global TLS1_ALERT_UNEXPECTED_MESSAGE := 10

/**
 * @type {Integer (UInt32)}
 */
export global TLS1_ALERT_BAD_RECORD_MAC := 20

/**
 * @type {Integer (UInt32)}
 */
export global TLS1_ALERT_DECRYPTION_FAILED := 21

/**
 * @type {Integer (UInt32)}
 */
export global TLS1_ALERT_RECORD_OVERFLOW := 22

/**
 * @type {Integer (UInt32)}
 */
export global TLS1_ALERT_DECOMPRESSION_FAIL := 30

/**
 * @type {Integer (UInt32)}
 */
export global TLS1_ALERT_HANDSHAKE_FAILURE := 40

/**
 * @type {Integer (UInt32)}
 */
export global TLS1_ALERT_BAD_CERTIFICATE := 42

/**
 * @type {Integer (UInt32)}
 */
export global TLS1_ALERT_UNSUPPORTED_CERT := 43

/**
 * @type {Integer (UInt32)}
 */
export global TLS1_ALERT_CERTIFICATE_REVOKED := 44

/**
 * @type {Integer (UInt32)}
 */
export global TLS1_ALERT_CERTIFICATE_EXPIRED := 45

/**
 * @type {Integer (UInt32)}
 */
export global TLS1_ALERT_CERTIFICATE_UNKNOWN := 46

/**
 * @type {Integer (UInt32)}
 */
export global TLS1_ALERT_ILLEGAL_PARAMETER := 47

/**
 * @type {Integer (UInt32)}
 */
export global TLS1_ALERT_UNKNOWN_CA := 48

/**
 * @type {Integer (UInt32)}
 */
export global TLS1_ALERT_ACCESS_DENIED := 49

/**
 * @type {Integer (UInt32)}
 */
export global TLS1_ALERT_DECODE_ERROR := 50

/**
 * @type {Integer (UInt32)}
 */
export global TLS1_ALERT_DECRYPT_ERROR := 51

/**
 * @type {Integer (UInt32)}
 */
export global TLS1_ALERT_EXPORT_RESTRICTION := 60

/**
 * @type {Integer (UInt32)}
 */
export global TLS1_ALERT_PROTOCOL_VERSION := 70

/**
 * @type {Integer (UInt32)}
 */
export global TLS1_ALERT_INSUFFIENT_SECURITY := 71

/**
 * @type {Integer (UInt32)}
 */
export global TLS1_ALERT_INTERNAL_ERROR := 80

/**
 * @type {Integer (UInt32)}
 */
export global TLS1_ALERT_USER_CANCELED := 90

/**
 * @type {Integer (UInt32)}
 */
export global TLS1_ALERT_NO_RENEGOTIATION := 100

/**
 * @type {Integer (UInt32)}
 */
export global TLS1_ALERT_UNSUPPORTED_EXT := 110

/**
 * @type {Integer (UInt32)}
 */
export global TLS1_ALERT_UNKNOWN_PSK_IDENTITY := 115

/**
 * @type {Integer (UInt32)}
 */
export global TLS1_ALERT_NO_APP_PROTOCOL := 120

/**
 * @type {Integer (UInt32)}
 */
export global SP_PROT_PCT1_SERVER := 1

/**
 * @type {Integer (UInt32)}
 */
export global SP_PROT_PCT1_CLIENT := 2

/**
 * @type {Integer (UInt32)}
 */
export global SP_PROT_SSL2_SERVER := 4

/**
 * @type {Integer (UInt32)}
 */
export global SP_PROT_SSL2_CLIENT := 8

/**
 * @type {Integer (UInt32)}
 */
export global SP_PROT_SSL3_SERVER := 16

/**
 * @type {Integer (UInt32)}
 */
export global SP_PROT_SSL3_CLIENT := 32

/**
 * @type {Integer (UInt32)}
 */
export global SP_PROT_TLS1_SERVER := 64

/**
 * @type {Integer (UInt32)}
 */
export global SP_PROT_TLS1_CLIENT := 128

/**
 * @type {Integer (UInt32)}
 */
export global SP_PROT_UNI_SERVER := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global SP_PROT_UNI_CLIENT := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global SP_PROT_ALL := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global SP_PROT_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global SP_PROT_TLS1_0_SERVER := 64

/**
 * @type {Integer (UInt32)}
 */
export global SP_PROT_TLS1_0_CLIENT := 128

/**
 * @type {Integer (UInt32)}
 */
export global SP_PROT_TLS1_1_SERVER := 256

/**
 * @type {Integer (UInt32)}
 */
export global SP_PROT_TLS1_1_CLIENT := 512

/**
 * @type {Integer (UInt32)}
 */
export global SP_PROT_TLS1_2_SERVER := 1024

/**
 * @type {Integer (UInt32)}
 */
export global SP_PROT_TLS1_2_CLIENT := 2048

/**
 * @type {Integer (UInt32)}
 */
export global SP_PROT_TLS1_3_SERVER := 4096

/**
 * @type {Integer (UInt32)}
 */
export global SP_PROT_TLS1_3_CLIENT := 8192

/**
 * @type {Integer (UInt32)}
 */
export global SP_PROT_DTLS_SERVER := 65536

/**
 * @type {Integer (UInt32)}
 */
export global SP_PROT_DTLS_CLIENT := 131072

/**
 * @type {Integer (UInt32)}
 */
export global SP_PROT_DTLS1_0_SERVER := 65536

/**
 * @type {Integer (UInt32)}
 */
export global SP_PROT_DTLS1_0_CLIENT := 131072

/**
 * @type {Integer (UInt32)}
 */
export global SP_PROT_DTLS1_2_SERVER := 262144

/**
 * @type {Integer (UInt32)}
 */
export global SP_PROT_DTLS1_2_CLIENT := 524288

/**
 * @type {Integer (UInt32)}
 */
export global SP_PROT_TLS1_3PLUS_SERVER := 4096

/**
 * @type {Integer (UInt32)}
 */
export global SP_PROT_TLS1_3PLUS_CLIENT := 8192

/**
 * @type {Integer (UInt32)}
 */
export global SCHANNEL_SECRET_TYPE_CAPI := 1

/**
 * @type {Integer (UInt32)}
 */
export global SCHANNEL_SECRET_PRIVKEY := 2

/**
 * @type {Integer (UInt32)}
 */
export global SCH_CRED_X509_CERTCHAIN := 1

/**
 * @type {Integer (UInt32)}
 */
export global SCH_CRED_X509_CAPI := 2

/**
 * @type {Integer (UInt32)}
 */
export global SCH_CRED_CERT_CONTEXT := 3

/**
 * @type {String}
 */
export global SSL_CRACK_CERTIFICATE_NAME := "SslCrackCertificate"

/**
 * @type {String}
 */
export global SSL_FREE_CERTIFICATE_NAME := "SslFreeCertificate"

/**
 * @type {String}
 */
export global SL_INFO_KEY_CHANNEL := "Channel"

/**
 * @type {String}
 */
export global SL_INFO_KEY_NAME := "Name"

/**
 * @type {String}
 */
export global SL_INFO_KEY_AUTHOR := "Author"

/**
 * @type {String}
 */
export global SL_INFO_KEY_DESCRIPTION := "Description"

/**
 * @type {String}
 */
export global SL_INFO_KEY_LICENSOR_URL := "LicensorUrl"

/**
 * @type {String}
 */
export global SL_INFO_KEY_DIGITAL_PID := "DigitalPID"

/**
 * @type {String}
 */
export global SL_INFO_KEY_DIGITAL_PID2 := "DigitalPID2"

/**
 * @type {String}
 */
export global SL_INFO_KEY_PARTIAL_PRODUCT_KEY := "PartialProductKey"

/**
 * @type {String}
 */
export global SL_INFO_KEY_PRODUCT_SKU_ID := "ProductSkuId"

/**
 * @type {String}
 */
export global SL_INFO_KEY_LICENSE_TYPE := "LicenseType"

/**
 * @type {String}
 */
export global SL_INFO_KEY_VERSION := "Version"

/**
 * @type {String}
 */
export global SL_INFO_KEY_SYSTEM_STATE := "SystemState"

/**
 * @type {String}
 */
export global SL_INFO_KEY_ACTIVE_PLUGINS := "ActivePlugins"

/**
 * @type {String}
 */
export global SL_INFO_KEY_SECURE_STORE_ID := "SecureStoreId"

/**
 * @type {String}
 */
export global SL_INFO_KEY_BIOS_PKEY := "BiosProductKey"

/**
 * @type {String}
 */
export global SL_INFO_KEY_BIOS_SLIC_STATE := "BiosSlicState"

/**
 * @type {String}
 */
export global SL_INFO_KEY_BIOS_OA2_MINOR_VERSION := "BiosOA2MinorVersion"

/**
 * @type {String}
 */
export global SL_INFO_KEY_BIOS_PKEY_DESCRIPTION := "BiosProductKeyDescription"

/**
 * @type {String}
 */
export global SL_INFO_KEY_BIOS_PKEY_PKPN := "BiosProductKeyPkPn"

/**
 * @type {String}
 */
export global SL_INFO_KEY_SECURE_PROCESSOR_ACTIVATION_URL := "SPCURL"

/**
 * @type {String}
 */
export global SL_INFO_KEY_RIGHT_ACCOUNT_ACTIVATION_URL := "RACURL"

/**
 * @type {String}
 */
export global SL_INFO_KEY_PRODUCT_KEY_ACTIVATION_URL := "PKCURL"

/**
 * @type {String}
 */
export global SL_INFO_KEY_USE_LICENSE_ACTIVATION_URL := "EULURL"

/**
 * @type {String}
 */
export global SL_INFO_KEY_IS_KMS := "IsKeyManagementService"

/**
 * @type {String}
 */
export global SL_INFO_KEY_KMS_CURRENT_COUNT := "KeyManagementServiceCurrentCount"

/**
 * @type {String}
 */
export global SL_INFO_KEY_KMS_REQUIRED_CLIENT_COUNT := "KeyManagementServiceRequiredClientCount"

/**
 * @type {String}
 */
export global SL_INFO_KEY_KMS_UNLICENSED_REQUESTS := "KeyManagementServiceUnlicensedRequests"

/**
 * @type {String}
 */
export global SL_INFO_KEY_KMS_LICENSED_REQUESTS := "KeyManagementServiceLicensedRequests"

/**
 * @type {String}
 */
export global SL_INFO_KEY_KMS_OOB_GRACE_REQUESTS := "KeyManagementServiceOOBGraceRequests"

/**
 * @type {String}
 */
export global SL_INFO_KEY_KMS_OOT_GRACE_REQUESTS := "KeyManagementServiceOOTGraceRequests"

/**
 * @type {String}
 */
export global SL_INFO_KEY_KMS_NON_GENUINE_GRACE_REQUESTS := "KeyManagementServiceNonGenuineGraceRequests"

/**
 * @type {String}
 */
export global SL_INFO_KEY_KMS_NOTIFICATION_REQUESTS := "KeyManagementServiceNotificationRequests"

/**
 * @type {String}
 */
export global SL_INFO_KEY_KMS_TOTAL_REQUESTS := "KeyManagementServiceTotalRequests"

/**
 * @type {String}
 */
export global SL_INFO_KEY_KMS_FAILED_REQUESTS := "KeyManagementServiceFailedRequests"

/**
 * @type {String}
 */
export global SL_INFO_KEY_IS_PRS := "IsPRS"

/**
 * @type {String}
 */
export global SL_PKEY_MS2005 := "msft:rm/algorithm/pkey/2005"

/**
 * @type {String}
 */
export global SL_PKEY_MS2009 := "msft:rm/algorithm/pkey/2009"

/**
 * @type {String}
 */
export global SL_PKEY_DETECT := "msft:rm/algorithm/pkey/detect"

/**
 * @type {String}
 */
export global SL_EVENT_LICENSING_STATE_CHANGED := "msft:rm/event/licensingstatechanged"

/**
 * @type {String}
 */
export global SL_EVENT_POLICY_CHANGED := "msft:rm/event/policychanged"

/**
 * @type {String}
 */
export global SL_EVENT_USER_NOTIFICATION := "msft:rm/event/usernotification"

/**
 * @type {Integer (UInt32)}
 */
export global SL_SYSTEM_STATE_REBOOT_POLICY_FOUND := 1

/**
 * @type {Integer (UInt32)}
 */
export global SL_SYSTEM_STATE_TAMPERED := 2

/**
 * @type {Integer (UInt32)}
 */
export global SL_REARM_REBOOT_REQUIRED := 1

/**
 * @type {Integer (UInt32)}
 */
export global SPP_MIGRATION_GATHER_MIGRATABLE_APPS := 1

/**
 * @type {Integer (UInt32)}
 */
export global SPP_MIGRATION_GATHER_ACTIVATED_WINDOWS_STATE := 2

/**
 * @type {Integer (UInt32)}
 */
export global SPP_MIGRATION_GATHER_ALL := 4294967295

/**
 * @type {String}
 */
export global SL_PROP_BRT_DATA := "SL_BRT_DATA"

/**
 * @type {String}
 */
export global SL_PROP_BRT_COMMIT := "SL_BRT_COMMIT"

/**
 * @type {String}
 */
export global SL_PROP_GENUINE_RESULT := "SL_GENUINE_RESULT"

/**
 * @type {String}
 */
export global SL_PROP_NONGENUINE_GRACE_FLAG := "SL_NONGENUINE_GRACE_FLAG"

/**
 * @type {String}
 */
export global SL_PROP_GET_GENUINE_AUTHZ := "SL_GET_GENUINE_AUTHZ"

/**
 * @type {String}
 */
export global SL_PROP_GET_GENUINE_SERVER_AUTHZ := "SL_GET_GENUINE_SERVER_AUTHZ"

/**
 * @type {String}
 */
export global SL_PROP_LAST_ACT_ATTEMPT_HRESULT := "SL_LAST_ACT_ATTEMPT_HRESULT"

/**
 * @type {String}
 */
export global SL_PROP_LAST_ACT_ATTEMPT_TIME := "SL_LAST_ACT_ATTEMPT_TIME"

/**
 * @type {String}
 */
export global SL_PROP_LAST_ACT_ATTEMPT_SERVER_FLAGS := "SL_LAST_ACT_ATTEMPT_SERVER_FLAGS"

/**
 * @type {String}
 */
export global SL_PROP_ACTIVATION_VALIDATION_IN_PROGRESS := "SL_ACTIVATION_VALIDATION_IN_PROGRESS"

/**
 * @type {String}
 */
export global SL_POLICY_EVALUATION_MODE_ENABLED := "Security-SPP-EvaluationModeEnabled"

/**
 * @type {String}
 */
export global SL_DEFAULT_MIGRATION_ENCRYPTOR_URI := "msft:spp/migrationencryptor/tokenact/1.0"

/**
 * @type {String}
 */
export global ID_CAP_SLAPI := "slapiQueryLicenseValue"

/**
 * @type {Integer (UInt32)}
 */
export global USER_ACCOUNT_DISABLED := 1

/**
 * @type {Integer (UInt32)}
 */
export global USER_HOME_DIRECTORY_REQUIRED := 2

/**
 * @type {Integer (UInt32)}
 */
export global USER_PASSWORD_NOT_REQUIRED := 4

/**
 * @type {Integer (UInt32)}
 */
export global USER_TEMP_DUPLICATE_ACCOUNT := 8

/**
 * @type {Integer (UInt32)}
 */
export global USER_NORMAL_ACCOUNT := 16

/**
 * @type {Integer (UInt32)}
 */
export global USER_MNS_LOGON_ACCOUNT := 32

/**
 * @type {Integer (UInt32)}
 */
export global USER_INTERDOMAIN_TRUST_ACCOUNT := 64

/**
 * @type {Integer (UInt32)}
 */
export global USER_WORKSTATION_TRUST_ACCOUNT := 128

/**
 * @type {Integer (UInt32)}
 */
export global USER_SERVER_TRUST_ACCOUNT := 256

/**
 * @type {Integer (UInt32)}
 */
export global USER_DONT_EXPIRE_PASSWORD := 512

/**
 * @type {Integer (UInt32)}
 */
export global USER_ACCOUNT_AUTO_LOCKED := 1024

/**
 * @type {Integer (UInt32)}
 */
export global USER_ENCRYPTED_TEXT_PASSWORD_ALLOWED := 2048

/**
 * @type {Integer (UInt32)}
 */
export global USER_SMARTCARD_REQUIRED := 4096

/**
 * @type {Integer (UInt32)}
 */
export global USER_TRUSTED_FOR_DELEGATION := 8192

/**
 * @type {Integer (UInt32)}
 */
export global USER_NOT_DELEGATED := 16384

/**
 * @type {Integer (UInt32)}
 */
export global USER_USE_DES_KEY_ONLY := 32768

/**
 * @type {Integer (UInt32)}
 */
export global USER_DONT_REQUIRE_PREAUTH := 65536

/**
 * @type {Integer (UInt32)}
 */
export global USER_PASSWORD_EXPIRED := 131072

/**
 * @type {Integer (UInt32)}
 */
export global USER_TRUSTED_TO_AUTHENTICATE_FOR_DELEGATION := 262144

/**
 * @type {Integer (UInt32)}
 */
export global USER_NO_AUTH_DATA_REQUIRED := 524288

/**
 * @type {Integer (UInt32)}
 */
export global USER_PARTIAL_SECRETS_ACCOUNT := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global USER_USE_AES_KEYS := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global USER_SHADOW_ACCOUNT := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global SAM_DAYS_PER_WEEK := 7

/**
 * @type {Integer (UInt32)}
 */
export global USER_ALL_PARAMETERS := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global CLEAR_BLOCK_LENGTH := 8

/**
 * @type {Integer (UInt32)}
 */
export global CYPHER_BLOCK_LENGTH := 8

/**
 * @type {Integer (UInt32)}
 */
export global NETLOGON_TARGET_INFO_TYPE_NTLM := 1

/**
 * @type {Integer (UInt32)}
 */
export global NETLOGON_TARGET_INFO_TYPE_KERBEROS := 2

/**
 * @type {Integer (UInt32)}
 */
export global MSV1_0_KERBEROS_LOGON := 4

/**
 * @type {Integer (UInt32)}
 */
export global MSV1_0_VALIDATION_LOGOFF_TIME := 1

/**
 * @type {Integer (UInt32)}
 */
export global MSV1_0_VALIDATION_KICKOFF_TIME := 2

/**
 * @type {Integer (UInt32)}
 */
export global MSV1_0_VALIDATION_LOGON_SERVER := 4

/**
 * @type {Integer (UInt32)}
 */
export global MSV1_0_VALIDATION_LOGON_DOMAIN := 8

/**
 * @type {Integer (UInt32)}
 */
export global MSV1_0_VALIDATION_SESSION_KEY := 16

/**
 * @type {Integer (UInt32)}
 */
export global MSV1_0_VALIDATION_USER_FLAGS := 32

/**
 * @type {Integer (UInt32)}
 */
export global MSV1_0_VALIDATION_USER_ID := 64

/**
 * @type {Integer (UInt32)}
 */
export global MSV1_0_SUBAUTH_ACCOUNT_DISABLED := 1

/**
 * @type {Integer (UInt32)}
 */
export global MSV1_0_SUBAUTH_PASSWORD := 2

/**
 * @type {Integer (UInt32)}
 */
export global MSV1_0_SUBAUTH_WORKSTATIONS := 4

/**
 * @type {Integer (UInt32)}
 */
export global MSV1_0_SUBAUTH_LOGON_HOURS := 8

/**
 * @type {Integer (UInt32)}
 */
export global MSV1_0_SUBAUTH_ACCOUNT_EXPIRY := 16

/**
 * @type {Integer (UInt32)}
 */
export global MSV1_0_SUBAUTH_PASSWORD_EXPIRY := 32

/**
 * @type {Integer (UInt32)}
 */
export global MSV1_0_SUBAUTH_ACCOUNT_TYPE := 64

/**
 * @type {Integer (UInt32)}
 */
export global MSV1_0_SUBAUTH_LOCKOUT := 128

/**
 * @type {Integer (UInt32)}
 */
export global SL_MDOLLAR_ZONE := 40960

/**
 * @type {Integer (UInt32)}
 */
export global SL_SERVER_ZONE := 45056

/**
 * @type {Integer (UInt32)}
 */
export global SL_MSCH_ZONE := 49152

/**
 * @type {Integer (UInt32)}
 */
export global SL_INTERNAL_ZONE := 57344

/**
 * @type {Integer (UInt32)}
 */
export global SL_CLIENTAPI_ZONE := 61440

/**
 * @type {Integer (UInt32)}
 */
export global FACILITY_SL_ITF := 4

/**
 * @type {Integer (UInt32)}
 */
export global _FACILITY_WINDOWS_STORE := 63

/**
 * @type {Integer (Int32)}
 */
export global SL_E_SRV_INVALID_PUBLISH_LICENSE := -1073434623

/**
 * @type {Integer (Int32)}
 */
export global SL_E_SRV_INVALID_PRODUCT_KEY_LICENSE := -1073434622

/**
 * @type {Integer (Int32)}
 */
export global SL_E_SRV_INVALID_RIGHTS_ACCOUNT_LICENSE := -1073434621

/**
 * @type {Integer (Int32)}
 */
export global SL_E_SRV_INVALID_LICENSE_STRUCTURE := -1073434620

/**
 * @type {Integer (Int32)}
 */
export global SL_E_SRV_AUTHORIZATION_FAILED := -1073434619

/**
 * @type {Integer (Int32)}
 */
export global SL_E_SRV_INVALID_BINDING := -1073434618

/**
 * @type {Integer (Int32)}
 */
export global SL_E_SRV_SERVER_PONG := -1073434617

/**
 * @type {Integer (Int32)}
 */
export global SL_E_SRV_INVALID_PAYLOAD := -1073434616

/**
 * @type {Integer (Int32)}
 */
export global SL_E_SRV_INVALID_SECURITY_PROCESSOR_LICENSE := -1073434615

/**
 * @type {Integer (Int32)}
 */
export global SL_E_SRV_BUSINESS_TOKEN_ENTRY_NOT_FOUND := -1073434608

/**
 * @type {Integer (Int32)}
 */
export global SL_E_SRV_CLIENT_CLOCK_OUT_OF_SYNC := -1073434607

/**
 * @type {Integer (Int32)}
 */
export global SL_E_SRV_GENERAL_ERROR := -1073434368

/**
 * @type {Integer (Int32)}
 */
export global SL_E_CHPA_PRODUCT_KEY_OUT_OF_RANGE := -1073430527

/**
 * @type {Integer (Int32)}
 */
export global SL_E_CHPA_INVALID_BINDING := -1073430526

/**
 * @type {Integer (Int32)}
 */
export global SL_E_CHPA_PRODUCT_KEY_BLOCKED := -1073430525

/**
 * @type {Integer (Int32)}
 */
export global SL_E_CHPA_INVALID_PRODUCT_KEY := -1073430524

/**
 * @type {Integer (Int32)}
 */
export global SL_E_CHPA_BINDING_NOT_FOUND := -1073430523

/**
 * @type {Integer (Int32)}
 */
export global SL_E_CHPA_BINDING_MAPPING_NOT_FOUND := -1073430522

/**
 * @type {Integer (Int32)}
 */
export global SL_E_CHPA_UNSUPPORTED_PRODUCT_KEY := -1073430521

/**
 * @type {Integer (Int32)}
 */
export global SL_E_CHPA_MAXIMUM_UNLOCK_EXCEEDED := -1073430520

/**
 * @type {Integer (Int32)}
 */
export global SL_E_CHPA_ACTCONFIG_ID_NOT_FOUND := -1073430519

/**
 * @type {Integer (Int32)}
 */
export global SL_E_CHPA_INVALID_PRODUCT_DATA_ID := -1073430518

/**
 * @type {Integer (Int32)}
 */
export global SL_E_CHPA_INVALID_PRODUCT_DATA := -1073430517

/**
 * @type {Integer (Int32)}
 */
export global SL_E_CHPA_SYSTEM_ERROR := -1073430516

/**
 * @type {Integer (Int32)}
 */
export global SL_E_CHPA_INVALID_ACTCONFIG_ID := -1073430515

/**
 * @type {Integer (Int32)}
 */
export global SL_E_CHPA_INVALID_PRODUCT_KEY_LENGTH := -1073430514

/**
 * @type {Integer (Int32)}
 */
export global SL_E_CHPA_INVALID_PRODUCT_KEY_FORMAT := -1073430513

/**
 * @type {Integer (Int32)}
 */
export global SL_E_CHPA_INVALID_PRODUCT_KEY_CHAR := -1073430512

/**
 * @type {Integer (Int32)}
 */
export global SL_E_CHPA_INVALID_BINDING_URI := -1073430511

/**
 * @type {Integer (Int32)}
 */
export global SL_E_CHPA_NETWORK_ERROR := -1073430510

/**
 * @type {Integer (Int32)}
 */
export global SL_E_CHPA_DATABASE_ERROR := -1073430509

/**
 * @type {Integer (Int32)}
 */
export global SL_E_CHPA_INVALID_ARGUMENT := -1073430508

/**
 * @type {Integer (Int32)}
 */
export global SL_E_CHPA_DMAK_LIMIT_EXCEEDED := -1073430496

/**
 * @type {Integer (Int32)}
 */
export global SL_E_CHPA_DMAK_EXTENSION_LIMIT_EXCEEDED := -1073430495

/**
 * @type {Integer (Int32)}
 */
export global SL_E_CHPA_REISSUANCE_LIMIT_NOT_FOUND := -1073430494

/**
 * @type {Integer (Int32)}
 */
export global SL_E_CHPA_OVERRIDE_REQUEST_NOT_FOUND := -1073430493

/**
 * @type {Integer (Int32)}
 */
export global SL_E_CHPA_OEM_SLP_COA0 := -1073430506

/**
 * @type {Integer (Int32)}
 */
export global SL_E_CHPA_PRODUCT_KEY_BLOCKED_IPLOCATION := -1073430505

/**
 * @type {Integer (Int32)}
 */
export global SL_E_CHPA_RESPONSE_NOT_AVAILABLE := -1073430507

/**
 * @type {Integer (Int32)}
 */
export global SL_E_CHPA_GENERAL_ERROR := -1073430448

/**
 * @type {Integer (Int32)}
 */
export global SL_E_CHPA_TIMEBASED_ACTIVATION_BEFORE_START_DATE := -1073430480

/**
 * @type {Integer (Int32)}
 */
export global SL_E_CHPA_TIMEBASED_ACTIVATION_AFTER_END_DATE := -1073430479

/**
 * @type {Integer (Int32)}
 */
export global SL_E_CHPA_TIMEBASED_ACTIVATION_NOT_AVAILABLE := -1073430478

/**
 * @type {Integer (Int32)}
 */
export global SL_E_CHPA_TIMEBASED_PRODUCT_KEY_NOT_CONFIGURED := -1073430477

/**
 * @type {Integer (Int32)}
 */
export global SL_E_CHPA_NO_RULES_TO_ACTIVATE := -1073430449

/**
 * @type {Integer (Int32)}
 */
export global SL_E_CHPA_DIGITALMARKER_INVALID_BINDING := -1073430447

/**
 * @type {Integer (Int32)}
 */
export global SL_E_CHPA_DIGITALMARKER_BINDING_NOT_CONFIGURED := -1073430446

/**
 * @type {Integer (Int32)}
 */
export global SL_E_CHPA_DYNAMICALLY_BLOCKED_PRODUCT_KEY := -1073430432

/**
 * @type {Integer (Int32)}
 */
export global SL_E_CHPA_MSCH_RESPONSE_NOT_AVAILABLE_VGA := -1073429505

/**
 * @type {Integer (Int32)}
 */
export global SL_E_CHPA_BUSINESS_RULE_INPUT_NOT_FOUND := -1073428736

/**
 * @type {Integer (Int32)}
 */
export global SL_E_CHPA_NULL_VALUE_FOR_PROPERTY_NAME_OR_ID := -1073428656

/**
 * @type {Integer (Int32)}
 */
export global SL_E_CHPA_UNKNOWN_PROPERTY_NAME := -1073428655

/**
 * @type {Integer (Int32)}
 */
export global SL_E_CHPA_UNKNOWN_PROPERTY_ID := -1073428654

/**
 * @type {Integer (Int32)}
 */
export global SL_E_CHPA_FAILED_TO_UPDATE_PRODUCTKEY_BINDING := -1073428651

/**
 * @type {Integer (Int32)}
 */
export global SL_E_CHPA_FAILED_TO_INSERT_PRODUCTKEY_BINDING := -1073428650

/**
 * @type {Integer (Int32)}
 */
export global SL_E_CHPA_FAILED_TO_DELETE_PRODUCTKEY_BINDING := -1073428649

/**
 * @type {Integer (Int32)}
 */
export global SL_E_CHPA_FAILED_TO_PROCESS_PRODUCT_KEY_BINDINGS_XML := -1073428648

/**
 * @type {Integer (Int32)}
 */
export global SL_E_CHPA_FAILED_TO_INSERT_PRODUCT_KEY_PROPERTY := -1073428646

/**
 * @type {Integer (Int32)}
 */
export global SL_E_CHPA_FAILED_TO_UPDATE_PRODUCT_KEY_PROPERTY := -1073428645

/**
 * @type {Integer (Int32)}
 */
export global SL_E_CHPA_FAILED_TO_DELETE_PRODUCT_KEY_PROPERTY := -1073428644

/**
 * @type {Integer (Int32)}
 */
export global SL_E_CHPA_UNKNOWN_PRODUCT_KEY_TYPE := -1073428636

/**
 * @type {Integer (Int32)}
 */
export global SL_E_CHPA_PRODUCT_KEY_BEING_USED := -1073428624

/**
 * @type {Integer (Int32)}
 */
export global SL_E_CHPA_FAILED_TO_INSERT_PRODUCT_KEY_RECORD := -1073428608

/**
 * @type {Integer (Int32)}
 */
export global SL_E_CHPA_FAILED_TO_UPDATE_PRODUCT_KEY_RECORD := -1073428607

/**
 * @type {Integer (Int32)}
 */
export global SL_E_INVALID_LICENSE_STATE_BREACH_GRACE := -1073429871

/**
 * @type {Integer (Int32)}
 */
export global SL_E_INVALID_LICENSE_STATE_BREACH_GRACE_EXPIRED := -1073429870

/**
 * @type {Integer (Int32)}
 */
export global SL_E_INVALID_TEMPLATE_ID := -1073429770

/**
 * @type {Integer (Int32)}
 */
export global SL_E_INVALID_XML_BLOB := -1073429766

/**
 * @type {Integer (Int32)}
 */
export global SL_E_VALIDATION_BLOB_PARAM_NOT_FOUND := -1073429721

/**
 * @type {Integer (Int32)}
 */
export global SL_E_INVALID_CLIENT_TOKEN := -1073429720

/**
 * @type {Integer (Int32)}
 */
export global SL_E_INVALID_OFFLINE_BLOB := -1073429719

/**
 * @type {Integer (Int32)}
 */
export global SL_E_OFFLINE_VALIDATION_BLOB_PARAM_NOT_FOUND := -1073429718

/**
 * @type {Integer (Int32)}
 */
export global SL_E_INVALID_OSVERSION_TEMPLATEID := -1073429717

/**
 * @type {Integer (Int32)}
 */
export global SL_E_OFFLINE_GENUINE_BLOB_REVOKED := -1073429716

/**
 * @type {Integer (Int32)}
 */
export global SL_E_OFFLINE_GENUINE_BLOB_NOT_FOUND := -1073429715

/**
 * @type {Integer (Int32)}
 */
export global SL_E_INVALID_OS_FOR_PRODUCT_KEY := -1073429503

/**
 * @type {Integer (Int32)}
 */
export global SL_E_INVALID_FILE_HASH := -1073429343

/**
 * @type {Integer (Int32)}
 */
export global SL_E_VALIDATION_BLOCKED_PRODUCT_KEY := -1073429342

/**
 * @type {Integer (Int32)}
 */
export global SL_E_MISMATCHED_KEY_TYPES := -1073429340

/**
 * @type {Integer (Int32)}
 */
export global SL_E_VALIDATION_INVALID_PRODUCT_KEY := -1073429339

/**
 * @type {Integer (Int32)}
 */
export global SL_E_INVALID_OEM_OR_VOLUME_BINDING_DATA := -1073429337

/**
 * @type {Integer (Int32)}
 */
export global SL_E_INVALID_LICENSE_STATE := -1073429336

/**
 * @type {Integer (Int32)}
 */
export global SL_E_IP_LOCATION_FALIED := -1073429335

/**
 * @type {Integer (Int32)}
 */
export global SL_E_SOFTMOD_EXPLOIT_DETECTED := -1073429333

/**
 * @type {Integer (Int32)}
 */
export global SL_E_INVALID_TOKEN_DATA := -1073429332

/**
 * @type {Integer (Int32)}
 */
export global SL_E_HEALTH_CHECK_FAILED_NEUTRAL_FILES := -1073429331

/**
 * @type {Integer (Int32)}
 */
export global SL_E_HEALTH_CHECK_FAILED_MUI_FILES := -1073429330

/**
 * @type {Integer (Int32)}
 */
export global SL_E_INVALID_AD_DATA := -1073429329

/**
 * @type {Integer (Int32)}
 */
export global SL_E_INVALID_RSDP_COUNT := -1073429328

/**
 * @type {Integer (Int32)}
 */
export global SL_E_ENGINE_DETECTED_EXPLOIT := -1073429327

/**
 * @type {Integer (Int32)}
 */
export global SL_E_NON_GENUINE_STATUS_LAST := -1073428992

/**
 * @type {Integer (Int32)}
 */
export global SL_E_NOTIFICATION_BREACH_DETECTED := -1073429199

/**
 * @type {Integer (Int32)}
 */
export global SL_E_NOTIFICATION_GRACE_EXPIRED := -1073429198

/**
 * @type {Integer (Int32)}
 */
export global SL_E_NOTIFICATION_OTHER_REASONS := -1073429197

/**
 * @type {Integer (Int32)}
 */
export global SL_E_INVALID_CONTEXT := -1073422335

/**
 * @type {Integer (Int32)}
 */
export global SL_E_TOKEN_STORE_INVALID_STATE := -1073422334

/**
 * @type {Integer (Int32)}
 */
export global SL_E_EVALUATION_FAILED := -1073422333

/**
 * @type {Integer (Int32)}
 */
export global SL_E_NOT_EVALUATED := -1073422332

/**
 * @type {Integer (Int32)}
 */
export global SL_E_NOT_ACTIVATED := -1073422331

/**
 * @type {Integer (Int32)}
 */
export global SL_E_INVALID_GUID := -1073422330

/**
 * @type {Integer (Int32)}
 */
export global SL_E_TOKSTO_TOKEN_NOT_FOUND := -1073422329

/**
 * @type {Integer (Int32)}
 */
export global SL_E_TOKSTO_NO_PROPERTIES := -1073422328

/**
 * @type {Integer (Int32)}
 */
export global SL_E_TOKSTO_NOT_INITIALIZED := -1073422327

/**
 * @type {Integer (Int32)}
 */
export global SL_E_TOKSTO_ALREADY_INITIALIZED := -1073422326

/**
 * @type {Integer (Int32)}
 */
export global SL_E_TOKSTO_NO_ID_SET := -1073422325

/**
 * @type {Integer (Int32)}
 */
export global SL_E_TOKSTO_CANT_CREATE_FILE := -1073422324

/**
 * @type {Integer (Int32)}
 */
export global SL_E_TOKSTO_CANT_WRITE_TO_FILE := -1073422323

/**
 * @type {Integer (Int32)}
 */
export global SL_E_TOKSTO_CANT_READ_FILE := -1073422322

/**
 * @type {Integer (Int32)}
 */
export global SL_E_TOKSTO_CANT_PARSE_PROPERTIES := -1073422321

/**
 * @type {Integer (Int32)}
 */
export global SL_E_TOKSTO_PROPERTY_NOT_FOUND := -1073422320

/**
 * @type {Integer (Int32)}
 */
export global SL_E_TOKSTO_INVALID_FILE := -1073422319

/**
 * @type {Integer (Int32)}
 */
export global SL_E_TOKSTO_CANT_CREATE_MUTEX := -1073422318

/**
 * @type {Integer (Int32)}
 */
export global SL_E_TOKSTO_CANT_ACQUIRE_MUTEX := -1073422317

/**
 * @type {Integer (Int32)}
 */
export global SL_E_TOKSTO_NO_TOKEN_DATA := -1073422316

/**
 * @type {Integer (Int32)}
 */
export global SL_E_EUL_CONSUMPTION_FAILED := -1073422315

/**
 * @type {Integer (Int32)}
 */
export global SL_E_PKEY_INVALID_CONFIG := -1073422314

/**
 * @type {Integer (Int32)}
 */
export global SL_E_PKEY_INVALID_UNIQUEID := -1073422313

/**
 * @type {Integer (Int32)}
 */
export global SL_E_PKEY_INVALID_ALGORITHM := -1073422312

/**
 * @type {Integer (Int32)}
 */
export global SL_E_PKEY_INTERNAL_ERROR := -1073422311

/**
 * @type {Integer (Int32)}
 */
export global SL_E_LICENSE_INVALID_ADDON_INFO := -1073422310

/**
 * @type {Integer (Int32)}
 */
export global SL_E_HWID_ERROR := -1073422309

/**
 * @type {Integer (Int32)}
 */
export global SL_E_PKEY_INVALID_KEYCHANGE1 := -1073422308

/**
 * @type {Integer (Int32)}
 */
export global SL_E_PKEY_INVALID_KEYCHANGE2 := -1073422307

/**
 * @type {Integer (Int32)}
 */
export global SL_E_PKEY_INVALID_KEYCHANGE3 := -1073422306

/**
 * @type {Integer (Int32)}
 */
export global SL_E_POLICY_OTHERINFO_MISMATCH := -1073422304

/**
 * @type {Integer (Int32)}
 */
export global SL_E_PRODUCT_UNIQUENESS_GROUP_ID_INVALID := -1073422303

/**
 * @type {Integer (Int32)}
 */
export global SL_E_SECURE_STORE_ID_MISMATCH := -1073422302

/**
 * @type {Integer (Int32)}
 */
export global SL_E_INVALID_RULESET_RULE := -1073422301

/**
 * @type {Integer (Int32)}
 */
export global SL_E_INVALID_CONTEXT_DATA := -1073422300

/**
 * @type {Integer (Int32)}
 */
export global SL_E_INVALID_HASH := -1073422299

/**
 * @type {Integer (Int32)}
 */
export global SL_E_INVALID_USE_OF_ADD_ON_PKEY := -2147164122

/**
 * @type {Integer (Int32)}
 */
export global SL_E_WINDOWS_VERSION_MISMATCH := -1073422297

/**
 * @type {Integer (Int32)}
 */
export global SL_E_ACTIVATION_IN_PROGRESS := -1073422296

/**
 * @type {Integer (Int32)}
 */
export global SL_E_STORE_UPGRADE_TOKEN_REQUIRED := -1073422295

/**
 * @type {Integer (Int32)}
 */
export global SL_E_STORE_UPGRADE_TOKEN_WRONG_EDITION := -1073422294

/**
 * @type {Integer (Int32)}
 */
export global SL_E_STORE_UPGRADE_TOKEN_WRONG_PID := -1073422293

/**
 * @type {Integer (Int32)}
 */
export global SL_E_STORE_UPGRADE_TOKEN_NOT_PRS_SIGNED := -1073422292

/**
 * @type {Integer (Int32)}
 */
export global SL_E_STORE_UPGRADE_TOKEN_WRONG_VERSION := -1073422291

/**
 * @type {Integer (Int32)}
 */
export global SL_E_STORE_UPGRADE_TOKEN_NOT_AUTHORIZED := -1073422290

/**
 * @type {Integer (Int32)}
 */
export global SL_E_SFS_INVALID_FS_VERSION := -2147163903

/**
 * @type {Integer (Int32)}
 */
export global SL_E_SFS_INVALID_FD_TABLE := -2147163902

/**
 * @type {Integer (Int32)}
 */
export global SL_E_SFS_INVALID_SYNC := -2147163901

/**
 * @type {Integer (Int32)}
 */
export global SL_E_SFS_BAD_TOKEN_NAME := -2147163900

/**
 * @type {Integer (Int32)}
 */
export global SL_E_SFS_BAD_TOKEN_EXT := -2147163899

/**
 * @type {Integer (Int32)}
 */
export global SL_E_SFS_DUPLICATE_TOKEN_NAME := -2147163898

/**
 * @type {Integer (Int32)}
 */
export global SL_E_SFS_TOKEN_SIZE_MISMATCH := -2147163897

/**
 * @type {Integer (Int32)}
 */
export global SL_E_SFS_INVALID_TOKEN_DATA_HASH := -2147163896

/**
 * @type {Integer (Int32)}
 */
export global SL_E_SFS_FILE_READ_ERROR := -2147163895

/**
 * @type {Integer (Int32)}
 */
export global SL_E_SFS_FILE_WRITE_ERROR := -2147163894

/**
 * @type {Integer (Int32)}
 */
export global SL_E_SFS_INVALID_FILE_POSITION := -2147163893

/**
 * @type {Integer (Int32)}
 */
export global SL_E_SFS_NO_ACTIVE_TRANSACTION := -2147163892

/**
 * @type {Integer (Int32)}
 */
export global SL_E_SFS_INVALID_FS_HEADER := -2147163891

/**
 * @type {Integer (Int32)}
 */
export global SL_E_SFS_INVALID_TOKEN_DESCRIPTOR := -2147163890

/**
 * @type {Integer (Int32)}
 */
export global SL_E_INTERNAL_ERROR := -1073418239

/**
 * @type {Integer (Int32)}
 */
export global SL_E_RIGHT_NOT_CONSUMED := -1073418238

/**
 * @type {Integer (Int32)}
 */
export global SL_E_USE_LICENSE_NOT_INSTALLED := -1073418237

/**
 * @type {Integer (Int32)}
 */
export global SL_E_MISMATCHED_PKEY_RANGE := -1073418236

/**
 * @type {Integer (Int32)}
 */
export global SL_E_MISMATCHED_PID := -1073418235

/**
 * @type {Integer (Int32)}
 */
export global SL_E_EXTERNAL_SIGNATURE_NOT_FOUND := -1073418234

/**
 * @type {Integer (Int32)}
 */
export global SL_E_RAC_NOT_AVAILABLE := -1073418233

/**
 * @type {Integer (Int32)}
 */
export global SL_E_SPC_NOT_AVAILABLE := -1073418232

/**
 * @type {Integer (Int32)}
 */
export global SL_E_GRACE_TIME_EXPIRED := -1073418231

/**
 * @type {Integer (Int32)}
 */
export global SL_E_MISMATCHED_APPID := -1073418230

/**
 * @type {Integer (Int32)}
 */
export global SL_E_NO_PID_CONFIG_DATA := -1073418229

/**
 * @type {Integer (Int32)}
 */
export global SL_I_OOB_GRACE_PERIOD := 1074065420

/**
 * @type {Integer (Int32)}
 */
export global SL_I_OOT_GRACE_PERIOD := 1074065421

/**
 * @type {Integer (Int32)}
 */
export global SL_E_MISMATCHED_SECURITY_PROCESSOR := -1073418226

/**
 * @type {Integer (Int32)}
 */
export global SL_E_OUT_OF_TOLERANCE := -1073418225

/**
 * @type {Integer (Int32)}
 */
export global SL_E_INVALID_PKEY := -1073418224

/**
 * @type {Integer (Int32)}
 */
export global SL_E_LICENSE_FILE_NOT_INSTALLED := -1073418223

/**
 * @type {Integer (Int32)}
 */
export global SL_E_VALUE_NOT_FOUND := -1073418222

/**
 * @type {Integer (Int32)}
 */
export global SL_E_RIGHT_NOT_GRANTED := -1073418221

/**
 * @type {Integer (Int32)}
 */
export global SL_E_PKEY_NOT_INSTALLED := -1073418220

/**
 * @type {Integer (Int32)}
 */
export global SL_E_PRODUCT_SKU_NOT_INSTALLED := -1073418219

/**
 * @type {Integer (Int32)}
 */
export global SL_E_NOT_SUPPORTED := -1073418218

/**
 * @type {Integer (Int32)}
 */
export global SL_E_PUBLISHING_LICENSE_NOT_INSTALLED := -1073418217

/**
 * @type {Integer (Int32)}
 */
export global SL_E_LICENSE_SERVER_URL_NOT_FOUND := -1073418216

/**
 * @type {Integer (Int32)}
 */
export global SL_E_INVALID_EVENT_ID := -1073418215

/**
 * @type {Integer (Int32)}
 */
export global SL_E_EVENT_NOT_REGISTERED := -1073418214

/**
 * @type {Integer (Int32)}
 */
export global SL_E_EVENT_ALREADY_REGISTERED := -1073418213

/**
 * @type {Integer (Int32)}
 */
export global SL_E_DECRYPTION_LICENSES_NOT_AVAILABLE := -1073418212

/**
 * @type {Integer (Int32)}
 */
export global SL_E_LICENSE_SIGNATURE_VERIFICATION_FAILED := -1073418211

/**
 * @type {Integer (Int32)}
 */
export global SL_E_DATATYPE_MISMATCHED := -1073418210

/**
 * @type {Integer (Int32)}
 */
export global SL_E_INVALID_LICENSE := -1073418209

/**
 * @type {Integer (Int32)}
 */
export global SL_E_INVALID_PACKAGE := -1073418208

/**
 * @type {Integer (Int32)}
 */
export global SL_E_VALIDITY_TIME_EXPIRED := -1073418207

/**
 * @type {Integer (Int32)}
 */
export global SL_E_LICENSE_AUTHORIZATION_FAILED := -1073418206

/**
 * @type {Integer (Int32)}
 */
export global SL_E_LICENSE_DECRYPTION_FAILED := -1073418205

/**
 * @type {Integer (Int32)}
 */
export global SL_E_WINDOWS_INVALID_LICENSE_STATE := -1073418204

/**
 * @type {Integer (Int32)}
 */
export global SL_E_LUA_ACCESSDENIED := -1073418203

/**
 * @type {Integer (Int32)}
 */
export global SL_E_PROXY_KEY_NOT_FOUND := -1073418202

/**
 * @type {Integer (Int32)}
 */
export global SL_E_TAMPER_DETECTED := -1073418201

/**
 * @type {Integer (Int32)}
 */
export global SL_E_POLICY_CACHE_INVALID := -1073418200

/**
 * @type {Integer (Int32)}
 */
export global SL_E_INVALID_RUNNING_MODE := -1073418199

/**
 * @type {Integer (Int32)}
 */
export global SL_E_SLP_NOT_SIGNED := -1073418198

/**
 * @type {Integer (Int32)}
 */
export global SL_E_CIDIID_INVALID_DATA := -1073418196

/**
 * @type {Integer (Int32)}
 */
export global SL_E_CIDIID_INVALID_VERSION := -1073418195

/**
 * @type {Integer (Int32)}
 */
export global SL_E_CIDIID_VERSION_NOT_SUPPORTED := -1073418194

/**
 * @type {Integer (Int32)}
 */
export global SL_E_CIDIID_INVALID_DATA_LENGTH := -1073418193

/**
 * @type {Integer (Int32)}
 */
export global SL_E_CIDIID_NOT_DEPOSITED := -1073418192

/**
 * @type {Integer (Int32)}
 */
export global SL_E_CIDIID_MISMATCHED := -1073418191

/**
 * @type {Integer (Int32)}
 */
export global SL_E_INVALID_BINDING_BLOB := -1073418190

/**
 * @type {Integer (Int32)}
 */
export global SL_E_PRODUCT_KEY_INSTALLATION_NOT_ALLOWED := -1073418189

/**
 * @type {Integer (Int32)}
 */
export global SL_E_EUL_NOT_AVAILABLE := -1073418188

/**
 * @type {Integer (Int32)}
 */
export global SL_E_VL_NOT_WINDOWS_SLP := -1073418187

/**
 * @type {Integer (Int32)}
 */
export global SL_E_VL_NOT_ENOUGH_COUNT := -1073418184

/**
 * @type {Integer (Int32)}
 */
export global SL_E_VL_BINDING_SERVICE_NOT_ENABLED := -1073418183

/**
 * @type {Integer (Int32)}
 */
export global SL_E_VL_INFO_PRODUCT_USER_RIGHT := 1074065472

/**
 * @type {Integer (Int32)}
 */
export global SL_E_VL_KEY_MANAGEMENT_SERVICE_NOT_ACTIVATED := -1073418175

/**
 * @type {Integer (Int32)}
 */
export global SL_E_VL_KEY_MANAGEMENT_SERVICE_ID_MISMATCH := -1073418174

/**
 * @type {Integer (Int32)}
 */
export global SL_E_PROXY_POLICY_NOT_UPDATED := -1073418169

/**
 * @type {Integer (Int32)}
 */
export global SL_E_CIDIID_INVALID_CHECK_DIGITS := -1073418163

/**
 * @type {Integer (Int32)}
 */
export global SL_E_LICENSE_MANAGEMENT_DATA_NOT_FOUND := -1073418161

/**
 * @type {Integer (Int32)}
 */
export global SL_E_INVALID_PRODUCT_KEY := -1073418160

/**
 * @type {Integer (Int32)}
 */
export global SL_E_BLOCKED_PRODUCT_KEY := -1073418159

/**
 * @type {Integer (Int32)}
 */
export global SL_E_DUPLICATE_POLICY := -1073418158

/**
 * @type {Integer (Int32)}
 */
export global SL_E_MISSING_OVERRIDE_ONLY_ATTRIBUTE := -1073418157

/**
 * @type {Integer (Int32)}
 */
export global SL_E_LICENSE_MANAGEMENT_DATA_DUPLICATED := -1073418156

/**
 * @type {Integer (Int32)}
 */
export global SL_E_BASE_SKU_NOT_AVAILABLE := -1073418155

/**
 * @type {Integer (Int32)}
 */
export global SL_E_VL_MACHINE_NOT_BOUND := -1073418154

/**
 * @type {Integer (Int32)}
 */
export global SL_E_SLP_MISSING_ACPI_SLIC := -1073418153

/**
 * @type {Integer (Int32)}
 */
export global SL_E_SLP_MISSING_SLP_MARKER := -1073418152

/**
 * @type {Integer (Int32)}
 */
export global SL_E_SLP_BAD_FORMAT := -1073418151

/**
 * @type {Integer (Int32)}
 */
export global SL_E_INVALID_PACKAGE_VERSION := -1073418144

/**
 * @type {Integer (Int32)}
 */
export global SL_E_PKEY_INVALID_UPGRADE := -1073418143

/**
 * @type {Integer (Int32)}
 */
export global SL_E_ISSUANCE_LICENSE_NOT_INSTALLED := -1073418142

/**
 * @type {Integer (Int32)}
 */
export global SL_E_SLP_OEM_CERT_MISSING := -1073418141

/**
 * @type {Integer (Int32)}
 */
export global SL_E_NONGENUINE_GRACE_TIME_EXPIRED := -1073418140

/**
 * @type {Integer (Int32)}
 */
export global SL_I_NONGENUINE_GRACE_PERIOD := 1074065509

/**
 * @type {Integer (Int32)}
 */
export global SL_E_DEPENDENT_PROPERTY_NOT_SET := -1073418138

/**
 * @type {Integer (Int32)}
 */
export global SL_E_NONGENUINE_GRACE_TIME_EXPIRED_2 := -1073418137

/**
 * @type {Integer (Int32)}
 */
export global SL_I_NONGENUINE_GRACE_PERIOD_2 := 1074065512

/**
 * @type {Integer (Int32)}
 */
export global SL_E_MISMATCHED_PRODUCT_SKU := -1073418135

/**
 * @type {Integer (Int32)}
 */
export global SL_E_OPERATION_NOT_ALLOWED := -1073418134

/**
 * @type {Integer (Int32)}
 */
export global SL_E_VL_KEY_MANAGEMENT_SERVICE_VM_NOT_SUPPORTED := -1073418133

/**
 * @type {Integer (Int32)}
 */
export global SL_E_VL_INVALID_TIMESTAMP := -1073418132

/**
 * @type {Integer (Int32)}
 */
export global SL_E_PLUGIN_INVALID_MANIFEST := -1073418127

/**
 * @type {Integer (Int32)}
 */
export global SL_E_APPLICATION_POLICIES_MISSING := -1073418126

/**
 * @type {Integer (Int32)}
 */
export global SL_E_APPLICATION_POLICIES_NOT_LOADED := -1073418125

/**
 * @type {Integer (Int32)}
 */
export global SL_E_VL_BINDING_SERVICE_UNAVAILABLE := -1073418124

/**
 * @type {Integer (Int32)}
 */
export global SL_E_SERVICE_STOPPING := -1073418123

/**
 * @type {Integer (Int32)}
 */
export global SL_E_PLUGIN_NOT_REGISTERED := -1073418122

/**
 * @type {Integer (Int32)}
 */
export global SL_E_AUTHN_WRONG_VERSION := -1073418121

/**
 * @type {Integer (Int32)}
 */
export global SL_E_AUTHN_MISMATCHED_KEY := -1073418120

/**
 * @type {Integer (Int32)}
 */
export global SL_E_AUTHN_CHALLENGE_NOT_SET := -1073418119

/**
 * @type {Integer (Int32)}
 */
export global SL_E_AUTHN_CANT_VERIFY := -1073418118

/**
 * @type {Integer (Int32)}
 */
export global SL_E_SERVICE_RUNNING := -1073418117

/**
 * @type {Integer (Int32)}
 */
export global SL_E_SLP_INVALID_MARKER_VERSION := -1073418116

/**
 * @type {Integer (Int32)}
 */
export global SL_E_INVALID_PRODUCT_KEY_TYPE := -1073418115

/**
 * @type {Integer (Int32)}
 */
export global SL_E_CIDIID_MISMATCHED_PKEY := -1073418114

/**
 * @type {Integer (Int32)}
 */
export global SL_E_CIDIID_NOT_BOUND := -1073418113

/**
 * @type {Integer (Int32)}
 */
export global SL_E_LICENSE_NOT_BOUND := -1073418112

/**
 * @type {Integer (Int32)}
 */
export global SL_E_VL_AD_AO_NOT_FOUND := -1073418111

/**
 * @type {Integer (Int32)}
 */
export global SL_E_VL_AD_AO_NAME_TOO_LONG := -1073418110

/**
 * @type {Integer (Int32)}
 */
export global SL_E_VL_AD_SCHEMA_VERSION_NOT_SUPPORTED := -1073418109

/**
 * @type {Integer (Int32)}
 */
export global SL_E_SLP_MSOA_BAD_FORMAT := -1073418096

/**
 * @type {Integer (Int32)}
 */
export global SL_E_SLP_MSOA_BAD_DATA_HEADER := -1073418095

/**
 * @type {Integer (Int32)}
 */
export global SL_E_SLP_MSOA_INVALID_DATA_LENGTH := -1073418094

/**
 * @type {Integer (Int32)}
 */
export global SL_E_SLP_MSOA_INVALID_PRODUCT_KEY := -1073418093

/**
 * @type {Integer (Int32)}
 */
export global SL_E_INCOMPLETE_OR_OLD_DISM_BINARIES := -1073418092

/**
 * @type {Integer (Int32)}
 */
export global SL_E_SLP_MSOA_PRODUCT_KEY_MISMATCH := -1073418091

/**
 * @type {Integer (Int32)}
 */
export global SL_E_NOT_GENUINE := -1073417728

/**
 * @type {Integer (Int32)}
 */
export global SL_E_EDITION_MISMATCHED := -1073417712

/**
 * @type {Integer (Int32)}
 */
export global SL_E_HWID_CHANGED := -1073417711

/**
 * @type {Integer (Int32)}
 */
export global SL_E_OEM_KEY_EDITION_MISMATCH := -1073417710

/**
 * @type {Integer (Int32)}
 */
export global SL_E_NO_PRODUCT_KEY_FOUND := -1073417709

/**
 * @type {Integer (Int32)}
 */
export global SL_E_DOWNLEVEL_SETUP_KEY := -1073417708

/**
 * @type {Integer (Int32)}
 */
export global SL_E_BIOS_KEY := -1073417707

/**
 * @type {Integer (Int32)}
 */
export global SL_E_TKA_CHALLENGE_EXPIRED := -1073417471

/**
 * @type {Integer (Int32)}
 */
export global SL_E_TKA_SILENT_ACTIVATION_FAILURE := -1073417470

/**
 * @type {Integer (Int32)}
 */
export global SL_E_TKA_INVALID_CERT_CHAIN := -1073417469

/**
 * @type {Integer (Int32)}
 */
export global SL_E_TKA_GRANT_NOT_FOUND := -1073417468

/**
 * @type {Integer (Int32)}
 */
export global SL_E_TKA_CERT_NOT_FOUND := -1073417467

/**
 * @type {Integer (Int32)}
 */
export global SL_E_TKA_INVALID_SKU_ID := -1073417466

/**
 * @type {Integer (Int32)}
 */
export global SL_E_TKA_INVALID_BLOB := -1073417465

/**
 * @type {Integer (Int32)}
 */
export global SL_E_TKA_TAMPERED_CERT_CHAIN := -1073417464

/**
 * @type {Integer (Int32)}
 */
export global SL_E_TKA_CHALLENGE_MISMATCH := -1073417463

/**
 * @type {Integer (Int32)}
 */
export global SL_E_TKA_INVALID_CERTIFICATE := -1073417462

/**
 * @type {Integer (Int32)}
 */
export global SL_E_TKA_INVALID_SMARTCARD := -1073417461

/**
 * @type {Integer (Int32)}
 */
export global SL_E_TKA_FAILED_GRANT_PARSING := -1073417460

/**
 * @type {Integer (Int32)}
 */
export global SL_E_TKA_INVALID_THUMBPRINT := -1073417459

/**
 * @type {Integer (Int32)}
 */
export global SL_E_TKA_THUMBPRINT_CERT_NOT_FOUND := -1073417458

/**
 * @type {Integer (Int32)}
 */
export global SL_E_TKA_CRITERIA_MISMATCH := -1073417457

/**
 * @type {Integer (Int32)}
 */
export global SL_E_TKA_TPID_MISMATCH := -1073417456

/**
 * @type {Integer (Int32)}
 */
export global SL_E_TKA_SOFT_CERT_DISALLOWED := -1073417455

/**
 * @type {Integer (Int32)}
 */
export global SL_E_TKA_SOFT_CERT_INVALID := -1073417454

/**
 * @type {Integer (Int32)}
 */
export global SL_E_TKA_CERT_CNG_NOT_AVAILABLE := -1073417453

/**
 * @type {Integer (Int32)}
 */
export global SL_I_STORE_BASED_ACTIVATION := 1074066433

/**
 * @type {Integer (Int32)}
 */
export global E_RM_UNKNOWN_ERROR := -1073415165

/**
 * @type {Integer (Int32)}
 */
export global SL_I_TIMEBASED_VALIDITY_PERIOD := 1074068484

/**
 * @type {Integer (Int32)}
 */
export global SL_I_PERPETUAL_OOB_GRACE_PERIOD := 1074068485

/**
 * @type {Integer (Int32)}
 */
export global SL_I_TIMEBASED_EXTENDED_GRACE_PERIOD := 1074068486

/**
 * @type {Integer (Int32)}
 */
export global SL_E_VALIDITY_PERIOD_EXPIRED := -1073415161

/**
 * @type {Integer (Int32)}
 */
export global SL_E_IA_THROTTLE_LIMIT_EXCEEDED := -1073414912

/**
 * @type {Integer (Int32)}
 */
export global SL_E_IA_INVALID_VIRTUALIZATION_PLATFORM := -1073414911

/**
 * @type {Integer (Int32)}
 */
export global SL_E_IA_PARENT_PARTITION_NOT_ACTIVATED := -1073414910

/**
 * @type {Integer (Int32)}
 */
export global SL_E_IA_ID_MISMATCH := -1073414909

/**
 * @type {Integer (Int32)}
 */
export global SL_E_IA_MACHINE_NOT_BOUND := -1073414908

/**
 * @type {Integer (Int32)}
 */
export global SL_E_TAMPER_RECOVERY_REQUIRES_ACTIVATION := -1073414656

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_SP_PUB_GENERAL_NOT_INITIALIZED := -1073426175

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_SP_STATUS_SYSTEM_TIME_SKEWED := -2147167998

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_SP_STATUS_GENERIC_FAILURE := -1073426173

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_SP_STATUS_INVALIDARG := -1073426172

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_SP_STATUS_ALREADY_EXISTS := -1073426171

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_SP_STATUS_INSUFFICIENT_BUFFER := -1073426169

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_SP_STATUS_INVALIDDATA := -1073426168

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_SP_STATUS_INVALID_SPAPI_CALL := -1073426167

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_SP_STATUS_INVALID_SPAPI_VERSION := -1073426166

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_SP_STATUS_DEBUGGER_DETECTED := -2147167989

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_SP_STATUS_NO_MORE_DATA := -1073426164

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_SP_PUB_CRYPTO_INVALID_KEYLENGTH := -1073425919

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_SP_PUB_CRYPTO_INVALID_BLOCKLENGTH := -1073425918

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_SP_PUB_CRYPTO_INVALID_CIPHER := -1073425917

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_SP_PUB_CRYPTO_INVALID_CIPHERMODE := -1073425916

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_SP_PUB_CRYPTO_UNKNOWN_PROVIDERID := -1073425915

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_SP_PUB_CRYPTO_UNKNOWN_KEYID := -1073425914

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_SP_PUB_CRYPTO_UNKNOWN_HASHID := -1073425913

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_SP_PUB_CRYPTO_UNKNOWN_ATTRIBUTEID := -1073425912

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_SP_PUB_CRYPTO_HASH_FINALIZED := -1073425911

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_SP_PUB_CRYPTO_KEY_NOT_AVAILABLE := -1073425910

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_SP_PUB_CRYPTO_KEY_NOT_FOUND := -1073425909

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_SP_PUB_CRYPTO_NOT_BLOCK_ALIGNED := -1073425908

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_SP_PUB_CRYPTO_INVALID_SIGNATURELENGTH := -1073425907

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_SP_PUB_CRYPTO_INVALID_SIGNATURE := -1073425906

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_SP_PUB_CRYPTO_INVALID_BLOCK := -1073425905

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_SP_PUB_CRYPTO_INVALID_FORMAT := -1073425904

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_SP_PUB_CRYPTO_INVALID_PADDING := -1073425903

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_SP_PUB_TS_TAMPERED := -1073425663

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_SP_PUB_TS_REARMED := -1073425662

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_SP_PUB_TS_RECREATED := -1073425661

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_SP_PUB_TS_ENTRY_KEY_NOT_FOUND := -1073425660

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_SP_PUB_TS_ENTRY_KEY_ALREADY_EXISTS := -1073425659

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_SP_PUB_TS_ENTRY_KEY_SIZE_TOO_BIG := -1073425658

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_SP_PUB_TS_MAX_REARM_REACHED := -1073425657

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_SP_PUB_TS_DATA_SIZE_TOO_BIG := -1073425656

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_SP_PUB_TS_INVALID_HW_BINDING := -1073425655

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_SP_PUB_TIMER_ALREADY_EXISTS := -1073425654

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_SP_PUB_TIMER_NOT_FOUND := -1073425653

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_SP_PUB_TIMER_EXPIRED := -1073425652

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_SP_PUB_TIMER_NAME_SIZE_TOO_BIG := -1073425651

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_SP_PUB_TS_FULL := -1073425650

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_SP_PUB_TRUSTED_TIME_OK := 1074057999

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_SP_PUB_TS_ENTRY_READ_ONLY := -1073425648

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_SP_PUB_TIMER_READ_ONLY := -1073425647

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_SP_PUB_TS_ATTRIBUTE_READ_ONLY := -1073425646

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_SP_PUB_TS_ATTRIBUTE_NOT_FOUND := -1073425645

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_SP_PUB_TS_ACCESS_DENIED := -1073425644

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_SP_PUB_TS_NAMESPACE_NOT_FOUND := -1073425643

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_SP_PUB_TS_NAMESPACE_IN_USE := -1073425642

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_SP_PUB_TS_TAMPERED_BREADCRUMB_LOAD_INVALID := -1073425641

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_SP_PUB_TS_TAMPERED_BREADCRUMB_GENERATION := -1073425640

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_SP_PUB_TS_TAMPERED_INVALID_DATA := -1073425639

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_SP_PUB_TS_TAMPERED_NO_DATA := -1073425638

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_SP_PUB_TS_TAMPERED_DATA_BREADCRUMB_MISMATCH := -1073425637

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_SP_PUB_TS_TAMPERED_DATA_VERSION_MISMATCH := -1073425636

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_SP_PUB_TAMPER_MODULE_AUTHENTICATION := -1073425407

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_SP_PUB_TAMPER_SECURITY_PROCESSOR_PATCHED := -1073425406

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_SP_PUB_KM_CACHE_TAMPER := -1073425151

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_SP_PUB_KM_CACHE_TAMPER_RESTORE_FAILED := -1073425150

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_SP_PUB_KM_CACHE_IDENTICAL := 1074058753

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_SP_PUB_KM_CACHE_POLICY_CHANGED := 1074058754

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_SP_STATUS_PUSHKEY_CONFLICT := -1073424639

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_SP_PUB_PROXY_SOFT_TAMPER := -1073424638

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_SP_PUB_API_INVALID_LICENSE := -1073426432

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_SP_PUB_API_INVALID_ALGORITHM_TYPE := -1073426423

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_SP_PUB_API_TOO_MANY_LOADED_ENVIRONMENTS := -1073426420

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_SP_PUB_API_BAD_GET_INFO_QUERY := -1073426414

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_SP_PUB_API_INVALID_HANDLE := -1073426388

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_SP_PUB_API_INVALID_KEY_LENGTH := -1073426347

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_SP_PUB_API_NO_AES_PROVIDER := -1073426317

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_SP_PUB_API_HANDLE_NOT_COMMITED := -1073426303

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_MDOLLAR_PRODUCT_KEY_OUT_OF_RANGE := -2143313819

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_MDOLLAR_INVALID_BINDING := -2143313818

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_MDOLLAR_PRODUCT_KEY_BLOCKED := -2143313817

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_MDOLLAR_INVALID_PRODUCT_KEY := -2143313816

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_MDOLLAR_UNSUPPORTED_PRODUCT_KEY := -2143313812

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_MDOLLAR_MAXIMUM_UNLOCK_EXCEEDED := -2143313807

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_MDOLLAR_INVALID_PRODUCT_DATA_ID := -2143313805

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_MDOLLAR_INVALID_PRODUCT_DATA := -2143313804

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_MDOLLAR_INVALID_ACTCONFIG_ID := -2143313802

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_MDOLLAR_INVALID_PRODUCT_KEY_LENGTH := -2143313801

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_MDOLLAR_INVALID_PRODUCT_KEY_FORMAT := -2143313800

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_MDOLLAR_INVALID_BINDING_URI := -2143313798

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_MDOLLAR_INVALID_ARGUMENT := -2143313795

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_MDOLLAR_DMAK_LIMIT_EXCEEDED := -2143313793

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_MDOLLAR_DMAK_EXTENSION_LIMIT_EXCEEDED := -2143313792

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_MDOLLAR_OEM_SLP_COA0 := -2143313789

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_MDOLLAR_CIDIID_INVALID_VERSION := -2143313779

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_MDOLLAR_CIDIID_INVALID_DATA := -2143313778

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_MDOLLAR_CIDIID_INVALID_DATA_LENGTH := -2143313777

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_MDOLLAR_CIDIID_INVALID_CHECK_DIGITS := -2143313776

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_MDOLLAR_TIMEBASED_ACTIVATION_BEFORE_START_DATE := -2143313769

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_MDOLLAR_TIMEBASED_ACTIVATION_AFTER_END_DATE := -2143313768

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_MDOLLAR_TIMEBASED_ACTIVATION_NOT_AVAILABLE := -2143313767

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_MDOLLAR_TIMEBASED_PRODUCT_KEY_NOT_CONFIGURED := -2143313766

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_MDOLLAR_NO_RULES_TO_ACTIVATE := -2143313720

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_MDOLLAR_PRODUCT_KEY_BLOCKED_IPLOCATION := -2143313717

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_MDOLLAR_DIGITALMARKER_INVALID_BINDING := -2143313709

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_MDOLLAR_DIGITALMARKER_BINDING_NOT_CONFIGURED := -2143313708

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_MDOLLAR_ROT_OVERRIDE_LIMIT_REACHED := -2143313707

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_MDOLLAR_DMAK_OVERRIDE_LIMIT_REACHED := -2143313706

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_MDOLLAR_FREE_OFFER_EXPIRED := -2143312896

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_MDOLLAR_OSR_DONOR_HWID_NO_ENTITLEMENT := -2143310920

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_MDOLLAR_OSR_GENERIC_ERROR := -2143310919

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_MDOLLAR_OSR_NO_ASSOCIATION := -2143310918

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_MDOLLAR_OSR_NOT_ADMIN := -2143310917

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_MDOLLAR_OSR_USER_THROTTLED := -2143310916

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_MDOLLAR_OSR_LICENSE_THROTTLED := -2143310915

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_MDOLLAR_OSR_DEVICE_THROTTLED := -2143310914

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_MDOLLAR_OSR_GP_DISABLED := -2143310913

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_MDOLLAR_OSR_HARDWARE_BLOCKED := -2143310912

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_MDOLLAR_OSR_USER_BLOCKED := -2143310911

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_MDOLLAR_OSR_LICENSE_BLOCKED := -2143310910

/**
 * @type {Integer (Int32)}
 */
export global SL_REMAPPING_MDOLLAR_OSR_DEVICE_BLOCKED := -2143310909

/**
 * @type {Guid}
 */
export global WINDOWS_SLID := Guid("{55c92734-d682-4d71-983e-d6ec3f16059f}")

/**
 * @type {String}
 */
export global WDIGEST_SP_NAME_A := "WDigest"

/**
 * @type {String}
 */
export global WDIGEST_SP_NAME_W := "WDigest"

/**
 * @type {String}
 */
export global WDIGEST_SP_NAME := "WDigest"
;@endregion Constants
