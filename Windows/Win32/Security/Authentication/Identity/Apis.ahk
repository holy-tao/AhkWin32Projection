#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Handle.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class Identity {

;@region Constants

    /**
     * @type {String}
     */
    static NTLMSP_NAME_A => "NTLM"

    /**
     * @type {String}
     */
    static NTLMSP_NAME => "NTLM"

    /**
     * @type {String}
     */
    static MICROSOFT_KERBEROS_NAME_A => "Kerberos"

    /**
     * @type {String}
     */
    static MICROSOFT_KERBEROS_NAME_W => "Kerberos"

    /**
     * @type {String}
     */
    static MICROSOFT_KERBEROS_NAME => "Kerberos"

    /**
     * @type {String}
     */
    static NEGOSSP_NAME_W => "Negotiate"

    /**
     * @type {String}
     */
    static NEGOSSP_NAME_A => "Negotiate"

    /**
     * @type {String}
     */
    static NEGOSSP_NAME => "Negotiate"

    /**
     * @type {String}
     */
    static CLOUDAP_NAME_W => "CloudAP"

    /**
     * @type {String}
     */
    static ClOUDAP_NAME_A => "CloudAP"

    /**
     * @type {String}
     */
    static CLOUDAP_NAME => "CloudAP"

    /**
     * @type {Integer (UInt32)}
     */
    static ISSP_LEVEL => 32

    /**
     * @type {Integer (UInt32)}
     */
    static ISSP_MODE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_FLAG_INTEGRITY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_FLAG_PRIVACY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_FLAG_TOKEN_ONLY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_FLAG_DATAGRAM => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_FLAG_CONNECTION => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_FLAG_MULTI_REQUIRED => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_FLAG_CLIENT_ONLY => 64

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_FLAG_EXTENDED_ERROR => 128

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_FLAG_IMPERSONATION => 256

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_FLAG_ACCEPT_WIN32_NAME => 512

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_FLAG_STREAM => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_FLAG_NEGOTIABLE => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_FLAG_GSS_COMPATIBLE => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_FLAG_LOGON => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_FLAG_ASCII_BUFFERS => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_FLAG_FRAGMENT => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_FLAG_MUTUAL_AUTH => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_FLAG_DELEGATION => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_FLAG_READONLY_WITH_CHECKSUM => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_FLAG_RESTRICTED_TOKENS => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_FLAG_NEGO_EXTENDER => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_FLAG_NEGOTIABLE2 => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_FLAG_APPCONTAINER_PASSTHROUGH => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_FLAG_APPCONTAINER_CHECKS => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_FLAG_CREDENTIAL_ISOLATION_ENABLED => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_FLAG_APPLY_LOOPBACK => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ID_NONE => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_CALLFLAGS_APPCONTAINER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_CALLFLAGS_APPCONTAINER_AUTHCAPABLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_CALLFLAGS_FORCE_SUPPLIED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_CALLFLAGS_APPCONTAINER_UPNCAPABLE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SECBUFFER_VERSION => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SECBUFFER_EMPTY => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SECBUFFER_DATA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SECBUFFER_TOKEN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SECBUFFER_PKG_PARAMS => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SECBUFFER_MISSING => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SECBUFFER_EXTRA => 5

    /**
     * @type {Integer (UInt32)}
     */
    static SECBUFFER_STREAM_TRAILER => 6

    /**
     * @type {Integer (UInt32)}
     */
    static SECBUFFER_STREAM_HEADER => 7

    /**
     * @type {Integer (UInt32)}
     */
    static SECBUFFER_NEGOTIATION_INFO => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SECBUFFER_PADDING => 9

    /**
     * @type {Integer (UInt32)}
     */
    static SECBUFFER_STREAM => 10

    /**
     * @type {Integer (UInt32)}
     */
    static SECBUFFER_MECHLIST => 11

    /**
     * @type {Integer (UInt32)}
     */
    static SECBUFFER_MECHLIST_SIGNATURE => 12

    /**
     * @type {Integer (UInt32)}
     */
    static SECBUFFER_TARGET => 13

    /**
     * @type {Integer (UInt32)}
     */
    static SECBUFFER_CHANNEL_BINDINGS => 14

    /**
     * @type {Integer (UInt32)}
     */
    static SECBUFFER_CHANGE_PASS_RESPONSE => 15

    /**
     * @type {Integer (UInt32)}
     */
    static SECBUFFER_TARGET_HOST => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SECBUFFER_ALERT => 17

    /**
     * @type {Integer (UInt32)}
     */
    static SECBUFFER_APPLICATION_PROTOCOLS => 18

    /**
     * @type {Integer (UInt32)}
     */
    static SECBUFFER_SRTP_PROTECTION_PROFILES => 19

    /**
     * @type {Integer (UInt32)}
     */
    static SECBUFFER_SRTP_MASTER_KEY_IDENTIFIER => 20

    /**
     * @type {Integer (UInt32)}
     */
    static SECBUFFER_TOKEN_BINDING => 21

    /**
     * @type {Integer (UInt32)}
     */
    static SECBUFFER_PRESHARED_KEY => 22

    /**
     * @type {Integer (UInt32)}
     */
    static SECBUFFER_PRESHARED_KEY_IDENTITY => 23

    /**
     * @type {Integer (UInt32)}
     */
    static SECBUFFER_DTLS_MTU => 24

    /**
     * @type {Integer (UInt32)}
     */
    static SECBUFFER_SEND_GENERIC_TLS_EXTENSION => 25

    /**
     * @type {Integer (UInt32)}
     */
    static SECBUFFER_SUBSCRIBE_GENERIC_TLS_EXTENSION => 26

    /**
     * @type {Integer (UInt32)}
     */
    static SECBUFFER_FLAGS => 27

    /**
     * @type {Integer (UInt32)}
     */
    static SECBUFFER_TRAFFIC_SECRETS => 28

    /**
     * @type {Integer (UInt32)}
     */
    static SECBUFFER_CERTIFICATE_REQUEST_CONTEXT => 29

    /**
     * @type {Integer (UInt32)}
     */
    static SECBUFFER_CHANNEL_BINDINGS_RESULT => 30

    /**
     * @type {Integer (UInt32)}
     */
    static SECBUFFER_APP_SESSION_STATE => 31

    /**
     * @type {Integer (UInt32)}
     */
    static SECBUFFER_SESSION_TICKET => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SECBUFFER_ATTRMASK => 4026531840

    /**
     * @type {Integer (UInt32)}
     */
    static SECBUFFER_READONLY => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static SECBUFFER_READONLY_WITH_CHECKSUM => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static SECBUFFER_RESERVED => 1610612736

    /**
     * @type {Integer (UInt32)}
     */
    static SEC_CHANNEL_BINDINGS_AUDIT_BINDINGS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SEC_CHANNEL_BINDINGS_VALID_FLAGS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SEC_CHANNEL_BINDINGS_RESULT_CLIENT_SUPPORT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SEC_CHANNEL_BINDINGS_RESULT_ABSENT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SEC_CHANNEL_BINDINGS_RESULT_NOTVALID_MISMATCH => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SEC_CHANNEL_BINDINGS_RESULT_NOTVALID_MISSING => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SEC_CHANNEL_BINDINGS_RESULT_VALID_MATCHED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SEC_CHANNEL_BINDINGS_RESULT_VALID_PROXY => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SEC_CHANNEL_BINDINGS_RESULT_VALID_MISSING => 64

    /**
     * @type {Integer (UInt32)}
     */
    static SZ_ALG_MAX_SIZE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static SECURITY_NATIVE_DREP => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SECURITY_NETWORK_DREP => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_CRED_BOTH => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_CRED_DEFAULT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_CRED_RESERVED => 4026531840

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_CRED_AUTOLOGON_RESTRICTED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_CRED_PROCESS_POLICY_ONLY => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_CRED_KERB_ANCHOR_DS_VERSION => 64

    /**
     * @type {Integer (UInt32)}
     */
    static ISC_RET_DELEGATE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ISC_RET_MUTUAL_AUTH => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ISC_RET_REPLAY_DETECT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ISC_RET_SEQUENCE_DETECT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static ISC_RET_CONFIDENTIALITY => 16

    /**
     * @type {Integer (UInt32)}
     */
    static ISC_RET_USE_SESSION_KEY => 32

    /**
     * @type {Integer (UInt32)}
     */
    static ISC_RET_USED_COLLECTED_CREDS => 64

    /**
     * @type {Integer (UInt32)}
     */
    static ISC_RET_USED_SUPPLIED_CREDS => 128

    /**
     * @type {Integer (UInt32)}
     */
    static ISC_RET_ALLOCATED_MEMORY => 256

    /**
     * @type {Integer (UInt32)}
     */
    static ISC_RET_USED_DCE_STYLE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static ISC_RET_DATAGRAM => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static ISC_RET_CONNECTION => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static ISC_RET_INTERMEDIATE_RETURN => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static ISC_RET_CALL_LEVEL => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static ISC_RET_EXTENDED_ERROR => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static ISC_RET_STREAM => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static ISC_RET_INTEGRITY => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static ISC_RET_IDENTIFY => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static ISC_RET_NULL_SESSION => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static ISC_RET_MANUAL_CRED_VALIDATION => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static ISC_RET_RESERVED1 => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static ISC_RET_FRAGMENT_ONLY => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static ISC_RET_FORWARD_CREDENTIALS => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static ISC_RET_USED_HTTP_STYLE => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static ISC_RET_NO_ADDITIONAL_TOKEN => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static ISC_RET_REAUTHENTICATION => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static ISC_RET_CONFIDENTIALITY_ONLY => 1073741824

    /**
     * @type {Integer (UInt64)}
     */
    static ISC_RET_MESSAGES => 4294967296

    /**
     * @type {Integer (UInt64)}
     */
    static ISC_RET_DEFERRED_CRED_VALIDATION => 8589934592

    /**
     * @type {Integer (UInt64)}
     */
    static ISC_RET_NO_POST_HANDSHAKE_AUTH => 17179869184

    /**
     * @type {Integer (UInt64)}
     */
    static ISC_RET_REUSE_SESSION_TICKETS => 34359738368

    /**
     * @type {Integer (UInt64)}
     */
    static ISC_RET_EXPLICIT_SESSION => 68719476736

    /**
     * @type {Integer (UInt32)}
     */
    static ASC_RET_DELEGATE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ASC_RET_MUTUAL_AUTH => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ASC_RET_REPLAY_DETECT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ASC_RET_SEQUENCE_DETECT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static ASC_RET_CONFIDENTIALITY => 16

    /**
     * @type {Integer (UInt32)}
     */
    static ASC_RET_USE_SESSION_KEY => 32

    /**
     * @type {Integer (UInt32)}
     */
    static ASC_RET_SESSION_TICKET => 64

    /**
     * @type {Integer (UInt32)}
     */
    static ASC_RET_ALLOCATED_MEMORY => 256

    /**
     * @type {Integer (UInt32)}
     */
    static ASC_RET_USED_DCE_STYLE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static ASC_RET_DATAGRAM => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static ASC_RET_CONNECTION => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static ASC_RET_CALL_LEVEL => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static ASC_RET_THIRD_LEG_FAILED => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static ASC_RET_EXTENDED_ERROR => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static ASC_RET_STREAM => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static ASC_RET_INTEGRITY => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static ASC_RET_LICENSING => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static ASC_RET_IDENTIFY => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static ASC_RET_NULL_SESSION => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static ASC_RET_ALLOW_NON_USER_LOGONS => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static ASC_RET_ALLOW_CONTEXT_REPLAY => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static ASC_RET_FRAGMENT_ONLY => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static ASC_RET_NO_TOKEN => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static ASC_RET_NO_ADDITIONAL_TOKEN => 33554432

    /**
     * @type {Integer (UInt64)}
     */
    static ASC_RET_MESSAGES => 4294967296

    /**
     * @type {Integer (UInt64)}
     */
    static ASC_RET_REUSE_SESSION_TICKETS => 34359738368

    /**
     * @type {Integer (UInt64)}
     */
    static ASC_RET_EXPLICIT_SESSION => 68719476736

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_CRED_ATTR_NAMES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_CRED_ATTR_SSI_PROVIDER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_CRED_ATTR_KDC_PROXY_SETTINGS => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_CRED_ATTR_KDC_NETWORK_SETTINGS => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_CRED_ATTR_CERT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_CRED_ATTR_PAC_BYPASS => 5

    /**
     * @type {Integer (UInt32)}
     */
    static KDC_PROXY_SETTINGS_V1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KDC_NETWORK_SETTINGS_V2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static KDC_PROXY_SETTINGS_FLAGS_FORCEPROXY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KDC_NETWORK_SETTINGS_FLAGS_FORCEPROXY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KDC_NETWORK_SETTINGS_FLAGS_CONFIGURE_PROXY => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static KDC_NETWORK_SETTINGS_FLAGS_CONFIGURE_DISCOVERY => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static KDC_NETWORK_DISCOVERY_FLAGS_DS13_REQUIRED => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_PROTO_INFO => 7

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_USER_FLAGS => 11

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_USE_VALIDATED => 15

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_CREDENTIAL_NAME => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_TARGET => 19

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_AUTHENTICATION_ID => 20

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_LOGOFF_TIME => 21

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_NEGO_KEYS => 22

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_PROMPTING_NEEDED => 24

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_NEGO_PKG_INFO => 31

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_NEGO_STATUS => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_CONTEXT_DELETED => 33

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_APPLICATION_PROTOCOL => 35

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_NEGOTIATED_TLS_EXTENSIONS => 36

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_IS_LOOPBACK => 37

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_NEGO_INFO_FLAG_NO_KERBEROS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_NEGO_INFO_FLAG_NO_NTLM => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_NEGOTIATION_COMPLETE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_NEGOTIATION_OPTIMISTIC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_NEGOTIATION_IN_PROGRESS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_NEGOTIATION_DIRECT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_NEGOTIATION_TRY_MULTICRED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_PROTOCOL_ID_SIZE => 255

    /**
     * @type {Integer (UInt32)}
     */
    static SECQOP_WRAP_NO_ENCRYPT => 2147483649

    /**
     * @type {Integer (UInt32)}
     */
    static SECQOP_WRAP_OOB_DATA => 1073741824

    /**
     * @type {String}
     */
    static SECURITY_ENTRYPOINT_ANSIW => "InitSecurityInterfaceW"

    /**
     * @type {String}
     */
    static SECURITY_ENTRYPOINT_ANSIA => "InitSecurityInterfaceA"

    /**
     * @type {String}
     */
    static SECURITY_ENTRYPOINT16 => "INITSECURITYINTERFACEA"

    /**
     * @type {String}
     */
    static SECURITY_ENTRYPOINT_ANSI => "InitSecurityInterfaceW"

    /**
     * @type {String}
     */
    static SECURITY_ENTRYPOINT => "INITSECURITYINTERFACEA"

    /**
     * @type {Integer (UInt32)}
     */
    static SECURITY_SUPPORT_PROVIDER_INTERFACE_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SECURITY_SUPPORT_PROVIDER_INTERFACE_VERSION_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SECURITY_SUPPORT_PROVIDER_INTERFACE_VERSION_3 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SECURITY_SUPPORT_PROVIDER_INTERFACE_VERSION_4 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SECURITY_SUPPORT_PROVIDER_INTERFACE_VERSION_5 => 5

    /**
     * @type {Integer (UInt32)}
     */
    static SASL_OPTION_SEND_SIZE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SASL_OPTION_RECV_SIZE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SASL_OPTION_AUTHZ_STRING => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SASL_OPTION_AUTHZ_PROCESSING => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SEC_WINNT_AUTH_IDENTITY_VERSION_2 => 513

    /**
     * @type {Integer (UInt32)}
     */
    static SEC_WINNT_AUTH_IDENTITY_VERSION => 512

    /**
     * @type {Integer (UInt32)}
     */
    static SEC_WINNT_AUTH_IDENTITY_FLAGS_PROCESS_ENCRYPTED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SEC_WINNT_AUTH_IDENTITY_FLAGS_SYSTEM_PROTECTED => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SEC_WINNT_AUTH_IDENTITY_FLAGS_USER_PROTECTED => 64

    /**
     * @type {Integer (UInt32)}
     */
    static SEC_WINNT_AUTH_IDENTITY_FLAGS_SYSTEM_ENCRYPTED => 128

    /**
     * @type {Integer (UInt32)}
     */
    static SEC_WINNT_AUTH_IDENTITY_FLAGS_RESERVED => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static SEC_WINNT_AUTH_IDENTITY_FLAGS_NULL_USER => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static SEC_WINNT_AUTH_IDENTITY_FLAGS_NULL_DOMAIN => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static SEC_WINNT_AUTH_IDENTITY_FLAGS_ID_PROVIDER => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static SEC_WINNT_AUTH_IDENTITY_FLAGS_SSPIPFC_USE_MASK => 4278190080

    /**
     * @type {Integer (UInt32)}
     */
    static SEC_WINNT_AUTH_IDENTITY_FLAGS_SSPIPFC_CREDPROV_DO_NOT_SAVE => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static SEC_WINNT_AUTH_IDENTITY_FLAGS_SSPIPFC_SAVE_CRED_BY_CALLER => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static SEC_WINNT_AUTH_IDENTITY_FLAGS_SSPIPFC_SAVE_CRED_CHECKED => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static SEC_WINNT_AUTH_IDENTITY_FLAGS_SSPIPFC_NO_CHECKBOX => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static SEC_WINNT_AUTH_IDENTITY_FLAGS_SSPIPFC_CREDPROV_DO_NOT_LOAD => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static SSPIPFC_CREDPROV_DO_NOT_SAVE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SSPIPFC_SAVE_CRED_BY_CALLER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SSPIPFC_NO_CHECKBOX => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SSPIPFC_CREDPROV_DO_NOT_LOAD => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SSPIPFC_USE_CREDUIBROKER => 8

    /**
     * @type {Integer (UInt32)}
     */
    static NGC_DATA_FLAG_KERB_CERTIFICATE_LOGON_FLAG_CHECK_DUPLICATES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NGC_DATA_FLAG_KERB_CERTIFICATE_LOGON_FLAG_USE_CERTIFICATE_INFO => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NGC_DATA_FLAG_IS_SMARTCARD_DATA => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NGC_DATA_FLAG_IS_CLOUD_TRUST_CRED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SEC_WINNT_AUTH_IDENTITY_ENCRYPT_SAME_LOGON => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SEC_WINNT_AUTH_IDENTITY_ENCRYPT_SAME_PROCESS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SEC_WINNT_AUTH_IDENTITY_ENCRYPT_FOR_SYSTEM => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SEC_WINNT_AUTH_IDENTITY_MARSHALLED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SEC_WINNT_AUTH_IDENTITY_ONLY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_OPTIONS_PERMANENT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LOOKUP_VIEW_LOCAL_INFORMATION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LOOKUP_TRANSLATE_NAMES => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_ISSUER_LIST => 80

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_REMOTE_CRED => 81

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_SUPPORTED_ALGS => 86

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_CIPHER_STRENGTHS => 87

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_SUPPORTED_PROTOCOLS => 88

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_MAPPED_CRED_ATTR => 92

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_REMOTE_CERTIFICATES => 95

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_CLIENT_CERT_POLICY => 96

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_CC_POLICY_RESULT => 97

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_USE_NCRYPT => 98

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_LOCAL_CERT_INFO => 99

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_CIPHER_INFO => 100

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_REMOTE_CERT_CHAIN => 103

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_UI_INFO => 104

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_KEYING_MATERIAL => 107

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_SRTP_PARAMETERS => 108

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_TOKEN_BINDING => 109

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_CONNECTION_INFO_EX => 110

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_KEYING_MATERIAL_TOKEN_BINDING => 111

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_KEYING_MATERIAL_INPROC => 112

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_CERT_CHECK_RESULT => 113

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_CERT_CHECK_RESULT_INPROC => 114

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_SESSION_TICKET_KEYS => 115

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_SERIALIZED_REMOTE_CERT_CONTEXT_INPROC => 116

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_SERIALIZED_REMOTE_CERT_CONTEXT => 117

    /**
     * @type {Integer (UInt32)}
     */
    static SESSION_TICKET_INFO_V0 => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SESSION_TICKET_INFO_VERSION => 0

    /**
     * @type {Integer (Int32)}
     */
    static LSA_MODE_PASSWORD_PROTECTED => 1

    /**
     * @type {Integer (Int32)}
     */
    static LSA_MODE_INDIVIDUAL_ACCOUNTS => 2

    /**
     * @type {Integer (Int32)}
     */
    static LSA_MODE_MANDATORY_ACCESS => 4

    /**
     * @type {Integer (Int32)}
     */
    static LSA_MODE_LOG_FULL => 8

    /**
     * @type {Integer (Int32)}
     */
    static LSA_MAXIMUM_SID_COUNT => 256

    /**
     * @type {Integer (UInt32)}
     */
    static LSA_MAXIMUM_ENUMERATION_LENGTH => 32000

    /**
     * @type {Integer (UInt32)}
     */
    static LSA_CALL_LICENSE_SERVER => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static SE_ADT_OBJECT_ONLY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SE_MAX_AUDIT_PARAMETERS => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SE_MAX_GENERIC_AUDIT_PARAMETERS => 28

    /**
     * @type {Integer (UInt32)}
     */
    static SE_ADT_PARAMETERS_SELF_RELATIVE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SE_ADT_PARAMETERS_SEND_TO_LSA => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SE_ADT_PARAMETER_EXTENSIBLE_AUDIT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SE_ADT_PARAMETER_GENERIC_AUDIT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SE_ADT_PARAMETER_WRITE_SYNCHRONOUS => 16

    /**
     * @type {String}
     */
    static LSA_ADT_SECURITY_SOURCE_NAME => "Microsoft-Windows-Security-Auditing"

    /**
     * @type {String}
     */
    static LSA_ADT_LEGACY_SECURITY_SOURCE_NAME => "Security"

    /**
     * @type {Integer (UInt32)}
     */
    static SE_ADT_POLICY_AUDIT_EVENT_TYPE_EX_BEGIN => 100

    /**
     * @type {Integer (Int32)}
     */
    static POLICY_AUDIT_EVENT_UNCHANGED => 0

    /**
     * @type {Integer (Int32)}
     */
    static POLICY_AUDIT_EVENT_SUCCESS => 1

    /**
     * @type {Integer (Int32)}
     */
    static POLICY_AUDIT_EVENT_FAILURE => 2

    /**
     * @type {Integer (Int32)}
     */
    static POLICY_AUDIT_EVENT_NONE => 4

    /**
     * @type {String}
     */
    static LSA_AP_NAME_INITIALIZE_PACKAGE => "LsaApInitializePackage" Chr(0) ""

    /**
     * @type {String}
     */
    static LSA_AP_NAME_LOGON_USER => "LsaApLogonUser" Chr(0) ""

    /**
     * @type {String}
     */
    static LSA_AP_NAME_LOGON_USER_EX => "LsaApLogonUserEx" Chr(0) ""

    /**
     * @type {String}
     */
    static LSA_AP_NAME_CALL_PACKAGE => "LsaApCallPackage" Chr(0) ""

    /**
     * @type {String}
     */
    static LSA_AP_NAME_LOGON_TERMINATED => "LsaApLogonTerminated" Chr(0) ""

    /**
     * @type {String}
     */
    static LSA_AP_NAME_CALL_PACKAGE_UNTRUSTED => "LsaApCallPackageUntrusted" Chr(0) ""

    /**
     * @type {String}
     */
    static LSA_AP_NAME_CALL_PACKAGE_PASSTHROUGH => "LsaApCallPackagePassthrough" Chr(0) ""

    /**
     * @type {Integer (Int32)}
     */
    static POLICY_VIEW_LOCAL_INFORMATION => 1

    /**
     * @type {Integer (Int32)}
     */
    static POLICY_VIEW_AUDIT_INFORMATION => 2

    /**
     * @type {Integer (Int32)}
     */
    static POLICY_GET_PRIVATE_INFORMATION => 4

    /**
     * @type {Integer (Int32)}
     */
    static POLICY_TRUST_ADMIN => 8

    /**
     * @type {Integer (Int32)}
     */
    static POLICY_CREATE_ACCOUNT => 16

    /**
     * @type {Integer (Int32)}
     */
    static POLICY_CREATE_SECRET => 32

    /**
     * @type {Integer (Int32)}
     */
    static POLICY_CREATE_PRIVILEGE => 64

    /**
     * @type {Integer (Int32)}
     */
    static POLICY_SET_DEFAULT_QUOTA_LIMITS => 128

    /**
     * @type {Integer (Int32)}
     */
    static POLICY_SET_AUDIT_REQUIREMENTS => 256

    /**
     * @type {Integer (Int32)}
     */
    static POLICY_AUDIT_LOG_ADMIN => 512

    /**
     * @type {Integer (Int32)}
     */
    static POLICY_SERVER_ADMIN => 1024

    /**
     * @type {Integer (Int32)}
     */
    static POLICY_LOOKUP_NAMES => 2048

    /**
     * @type {Integer (Int32)}
     */
    static POLICY_NOTIFICATION => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static LSA_LOOKUP_ISOLATED_AS_LOCAL => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static LSA_LOOKUP_DISALLOW_CONNECTED_ACCOUNT_INTERNET_SID => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static LSA_LOOKUP_PREFER_INTERNET_NAMES => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static PER_USER_POLICY_UNCHANGED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PER_USER_AUDIT_SUCCESS_INCLUDE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PER_USER_AUDIT_SUCCESS_EXCLUDE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PER_USER_AUDIT_FAILURE_INCLUDE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PER_USER_AUDIT_FAILURE_EXCLUDE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PER_USER_AUDIT_NONE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_QOS_SCHANNEL_REQUIRED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_QOS_OUTBOUND_INTEGRITY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_QOS_OUTBOUND_CONFIDENTIALITY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_QOS_INBOUND_INTEGRITY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_QOS_INBOUND_CONFIDENTIALITY => 16

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_QOS_ALLOW_LOCAL_ROOT_CERT_STORE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_QOS_RAS_SERVER_ALLOWED => 64

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_QOS_DHCP_SERVER_ALLOWED => 128

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_KERBEROS_VALIDATE_CLIENT => 128

    /**
     * @type {Integer (Int32)}
     */
    static ACCOUNT_VIEW => 1

    /**
     * @type {Integer (Int32)}
     */
    static ACCOUNT_ADJUST_PRIVILEGES => 2

    /**
     * @type {Integer (Int32)}
     */
    static ACCOUNT_ADJUST_QUOTAS => 4

    /**
     * @type {Integer (Int32)}
     */
    static ACCOUNT_ADJUST_SYSTEM_ACCESS => 8

    /**
     * @type {Integer (Int32)}
     */
    static TRUSTED_QUERY_DOMAIN_NAME => 1

    /**
     * @type {Integer (Int32)}
     */
    static TRUSTED_QUERY_CONTROLLERS => 2

    /**
     * @type {Integer (Int32)}
     */
    static TRUSTED_SET_CONTROLLERS => 4

    /**
     * @type {Integer (Int32)}
     */
    static TRUSTED_QUERY_POSIX => 8

    /**
     * @type {Integer (Int32)}
     */
    static TRUSTED_SET_POSIX => 16

    /**
     * @type {Integer (Int32)}
     */
    static TRUSTED_SET_AUTH => 32

    /**
     * @type {Integer (Int32)}
     */
    static TRUSTED_QUERY_AUTH => 64

    /**
     * @type {Integer (UInt32)}
     */
    static LSAD_AES_CRYPT_SHA512_HASH_SIZE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static LSAD_AES_KEY_SIZE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static LSAD_AES_SALT_SIZE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static LSAD_AES_BLOCK_SIZE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static TRUST_TYPE_AAD => 5

    /**
     * @type {Integer (UInt32)}
     */
    static TRUST_ATTRIBUTE_TREE_PARENT => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static TRUST_ATTRIBUTE_TREE_ROOT => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static TRUST_ATTRIBUTES_VALID => 4278386687

    /**
     * @type {Integer (UInt32)}
     */
    static TRUST_ATTRIBUTE_QUARANTINED_DOMAIN => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TRUST_ATTRIBUTE_TRUST_USES_RC4_ENCRYPTION => 128

    /**
     * @type {Integer (UInt32)}
     */
    static TRUST_ATTRIBUTE_TRUST_USES_AES_KEYS => 256

    /**
     * @type {Integer (UInt32)}
     */
    static TRUST_ATTRIBUTE_CROSS_ORGANIZATION_NO_TGT_DELEGATION => 512

    /**
     * @type {Integer (UInt32)}
     */
    static TRUST_ATTRIBUTE_PIM_TRUST => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static TRUST_ATTRIBUTE_CROSS_ORGANIZATION_ENABLE_TGT_DELEGATION => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static TRUST_ATTRIBUTE_DISABLE_AUTH_TARGET_VALIDATION => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static TRUST_ATTRIBUTES_USER => 4278190080

    /**
     * @type {Integer (UInt32)}
     */
    static LSA_FOREST_TRUST_RECORD_TYPE_UNRECOGNIZED => 2147483648

    /**
     * @type {Integer (Int32)}
     */
    static LSA_FTRECORD_DISABLED_REASONS => 65535

    /**
     * @type {Integer (Int32)}
     */
    static LSA_TLN_DISABLED_NEW => 1

    /**
     * @type {Integer (Int32)}
     */
    static LSA_TLN_DISABLED_ADMIN => 2

    /**
     * @type {Integer (Int32)}
     */
    static LSA_TLN_DISABLED_CONFLICT => 4

    /**
     * @type {Integer (Int32)}
     */
    static LSA_SID_DISABLED_ADMIN => 1

    /**
     * @type {Integer (Int32)}
     */
    static LSA_SID_DISABLED_CONFLICT => 2

    /**
     * @type {Integer (Int32)}
     */
    static LSA_NB_DISABLED_ADMIN => 4

    /**
     * @type {Integer (Int32)}
     */
    static LSA_NB_DISABLED_CONFLICT => 8

    /**
     * @type {Integer (Int32)}
     */
    static LSA_SCANNER_INFO_DISABLE_AUTH_TARGET_VALIDATION => 1

    /**
     * @type {Integer (Int32)}
     */
    static LSA_SCANNER_INFO_ADMIN_ALL_FLAGS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_RECORDS_IN_FOREST_TRUST_INFO => 4000

    /**
     * @type {Integer (Int32)}
     */
    static SECRET_SET_VALUE => 1

    /**
     * @type {Integer (Int32)}
     */
    static SECRET_QUERY_VALUE => 2

    /**
     * @type {String}
     */
    static LSA_GLOBAL_SECRET_PREFIX => "G$"

    /**
     * @type {Integer (UInt32)}
     */
    static LSA_GLOBAL_SECRET_PREFIX_LENGTH => 2

    /**
     * @type {String}
     */
    static LSA_LOCAL_SECRET_PREFIX => "L$"

    /**
     * @type {Integer (UInt32)}
     */
    static LSA_LOCAL_SECRET_PREFIX_LENGTH => 2

    /**
     * @type {String}
     */
    static LSA_MACHINE_SECRET_PREFIX => "M$"

    /**
     * @type {Integer (Int32)}
     */
    static LSA_SECRET_MAXIMUM_COUNT => 4096

    /**
     * @type {Integer (Int32)}
     */
    static LSA_SECRET_MAXIMUM_LENGTH => 512

    /**
     * @type {Integer (UInt32)}
     */
    static MAXIMUM_CAPES_PER_CAP => 127

    /**
     * @type {Integer (UInt32)}
     */
    static CENTRAL_ACCESS_POLICY_OWNER_RIGHTS_PRESENT_FLAG => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CENTRAL_ACCESS_POLICY_STAGED_OWNER_RIGHTS_PRESENT_FLAG => 256

    /**
     * @type {Integer (UInt32)}
     */
    static CENTRAL_ACCESS_POLICY_STAGED_FLAG => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static LSASETCAPS_RELOAD_FLAG => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LSASETCAPS_VALID_FLAG_MASK => 1

    /**
     * @type {String}
     */
    static SE_INTERACTIVE_LOGON_NAME => "SeInteractiveLogonRight"

    /**
     * @type {String}
     */
    static SE_NETWORK_LOGON_NAME => "SeNetworkLogonRight"

    /**
     * @type {String}
     */
    static SE_BATCH_LOGON_NAME => "SeBatchLogonRight"

    /**
     * @type {String}
     */
    static SE_SERVICE_LOGON_NAME => "SeServiceLogonRight"

    /**
     * @type {String}
     */
    static SE_DENY_INTERACTIVE_LOGON_NAME => "SeDenyInteractiveLogonRight"

    /**
     * @type {String}
     */
    static SE_DENY_NETWORK_LOGON_NAME => "SeDenyNetworkLogonRight"

    /**
     * @type {String}
     */
    static SE_DENY_BATCH_LOGON_NAME => "SeDenyBatchLogonRight"

    /**
     * @type {String}
     */
    static SE_DENY_SERVICE_LOGON_NAME => "SeDenyServiceLogonRight"

    /**
     * @type {String}
     */
    static SE_REMOTE_INTERACTIVE_LOGON_NAME => "SeRemoteInteractiveLogonRight"

    /**
     * @type {String}
     */
    static SE_DENY_REMOTE_INTERACTIVE_LOGON_NAME => "SeDenyRemoteInteractiveLogonRight"

    /**
     * @type {Integer (UInt32)}
     */
    static NEGOTIATE_MAX_PREFIX => 32

    /**
     * @type {Integer (UInt32)}
     */
    static NEGOTIATE_ALLOW_NTLM => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static NEGOTIATE_NEG_NTLM => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_USER_RECORDS => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static versionbyte => 1

    /**
     * @type {Integer (UInt32)}
     */
    static versionbyte_length => 1

    /**
     * @type {String}
     */
    static LSAD_AES_256_ALG => "AEAD-AES-256-CBC-HMAC-SHA512"

    /**
     * @type {String}
     */
    static LSAD_AES256_ENC_KEY_STRING => "Microsoft LSAD encryption key AEAD-AES-256-CBC-HMAC-SHA512 16"

    /**
     * @type {String}
     */
    static LSAD_AES256_MAC_KEY_STRING => "Microsoft LSAD MAC key AEAD-AES-256-CBC-HMAC-SHA512 16"

    /**
     * @type {Guid}
     */
    static Audit_System_SecurityStateChange => Guid("{0cce9210-69ae-11d9-bed3-505054503030}")

    /**
     * @type {Guid}
     */
    static Audit_System_SecuritySubsystemExtension => Guid("{0cce9211-69ae-11d9-bed3-505054503030}")

    /**
     * @type {Guid}
     */
    static Audit_System_Integrity => Guid("{0cce9212-69ae-11d9-bed3-505054503030}")

    /**
     * @type {Guid}
     */
    static Audit_System_IPSecDriverEvents => Guid("{0cce9213-69ae-11d9-bed3-505054503030}")

    /**
     * @type {Guid}
     */
    static Audit_System_Others => Guid("{0cce9214-69ae-11d9-bed3-505054503030}")

    /**
     * @type {Guid}
     */
    static Audit_Logon_Logon => Guid("{0cce9215-69ae-11d9-bed3-505054503030}")

    /**
     * @type {Guid}
     */
    static Audit_Logon_Logoff => Guid("{0cce9216-69ae-11d9-bed3-505054503030}")

    /**
     * @type {Guid}
     */
    static Audit_Logon_AccountLockout => Guid("{0cce9217-69ae-11d9-bed3-505054503030}")

    /**
     * @type {Guid}
     */
    static Audit_Logon_IPSecMainMode => Guid("{0cce9218-69ae-11d9-bed3-505054503030}")

    /**
     * @type {Guid}
     */
    static Audit_Logon_IPSecQuickMode => Guid("{0cce9219-69ae-11d9-bed3-505054503030}")

    /**
     * @type {Guid}
     */
    static Audit_Logon_IPSecUserMode => Guid("{0cce921a-69ae-11d9-bed3-505054503030}")

    /**
     * @type {Guid}
     */
    static Audit_Logon_SpecialLogon => Guid("{0cce921b-69ae-11d9-bed3-505054503030}")

    /**
     * @type {Guid}
     */
    static Audit_Logon_Others => Guid("{0cce921c-69ae-11d9-bed3-505054503030}")

    /**
     * @type {Guid}
     */
    static Audit_ObjectAccess_FileSystem => Guid("{0cce921d-69ae-11d9-bed3-505054503030}")

    /**
     * @type {Guid}
     */
    static Audit_ObjectAccess_Registry => Guid("{0cce921e-69ae-11d9-bed3-505054503030}")

    /**
     * @type {Guid}
     */
    static Audit_ObjectAccess_Kernel => Guid("{0cce921f-69ae-11d9-bed3-505054503030}")

    /**
     * @type {Guid}
     */
    static Audit_ObjectAccess_Sam => Guid("{0cce9220-69ae-11d9-bed3-505054503030}")

    /**
     * @type {Guid}
     */
    static Audit_ObjectAccess_CertificationServices => Guid("{0cce9221-69ae-11d9-bed3-505054503030}")

    /**
     * @type {Guid}
     */
    static Audit_ObjectAccess_ApplicationGenerated => Guid("{0cce9222-69ae-11d9-bed3-505054503030}")

    /**
     * @type {Guid}
     */
    static Audit_ObjectAccess_Handle => Guid("{0cce9223-69ae-11d9-bed3-505054503030}")

    /**
     * @type {Guid}
     */
    static Audit_ObjectAccess_Share => Guid("{0cce9224-69ae-11d9-bed3-505054503030}")

    /**
     * @type {Guid}
     */
    static Audit_ObjectAccess_FirewallPacketDrops => Guid("{0cce9225-69ae-11d9-bed3-505054503030}")

    /**
     * @type {Guid}
     */
    static Audit_ObjectAccess_FirewallConnection => Guid("{0cce9226-69ae-11d9-bed3-505054503030}")

    /**
     * @type {Guid}
     */
    static Audit_ObjectAccess_Other => Guid("{0cce9227-69ae-11d9-bed3-505054503030}")

    /**
     * @type {Guid}
     */
    static Audit_PrivilegeUse_Sensitive => Guid("{0cce9228-69ae-11d9-bed3-505054503030}")

    /**
     * @type {Guid}
     */
    static Audit_PrivilegeUse_NonSensitive => Guid("{0cce9229-69ae-11d9-bed3-505054503030}")

    /**
     * @type {Guid}
     */
    static Audit_PrivilegeUse_Others => Guid("{0cce922a-69ae-11d9-bed3-505054503030}")

    /**
     * @type {Guid}
     */
    static Audit_DetailedTracking_ProcessCreation => Guid("{0cce922b-69ae-11d9-bed3-505054503030}")

    /**
     * @type {Guid}
     */
    static Audit_DetailedTracking_ProcessTermination => Guid("{0cce922c-69ae-11d9-bed3-505054503030}")

    /**
     * @type {Guid}
     */
    static Audit_DetailedTracking_DpapiActivity => Guid("{0cce922d-69ae-11d9-bed3-505054503030}")

    /**
     * @type {Guid}
     */
    static Audit_DetailedTracking_RpcCall => Guid("{0cce922e-69ae-11d9-bed3-505054503030}")

    /**
     * @type {Guid}
     */
    static Audit_PolicyChange_AuditPolicy => Guid("{0cce922f-69ae-11d9-bed3-505054503030}")

    /**
     * @type {Guid}
     */
    static Audit_PolicyChange_AuthenticationPolicy => Guid("{0cce9230-69ae-11d9-bed3-505054503030}")

    /**
     * @type {Guid}
     */
    static Audit_PolicyChange_AuthorizationPolicy => Guid("{0cce9231-69ae-11d9-bed3-505054503030}")

    /**
     * @type {Guid}
     */
    static Audit_PolicyChange_MpsscvRulePolicy => Guid("{0cce9232-69ae-11d9-bed3-505054503030}")

    /**
     * @type {Guid}
     */
    static Audit_PolicyChange_WfpIPSecPolicy => Guid("{0cce9233-69ae-11d9-bed3-505054503030}")

    /**
     * @type {Guid}
     */
    static Audit_PolicyChange_Others => Guid("{0cce9234-69ae-11d9-bed3-505054503030}")

    /**
     * @type {Guid}
     */
    static Audit_AccountManagement_UserAccount => Guid("{0cce9235-69ae-11d9-bed3-505054503030}")

    /**
     * @type {Guid}
     */
    static Audit_AccountManagement_ComputerAccount => Guid("{0cce9236-69ae-11d9-bed3-505054503030}")

    /**
     * @type {Guid}
     */
    static Audit_AccountManagement_SecurityGroup => Guid("{0cce9237-69ae-11d9-bed3-505054503030}")

    /**
     * @type {Guid}
     */
    static Audit_AccountManagement_DistributionGroup => Guid("{0cce9238-69ae-11d9-bed3-505054503030}")

    /**
     * @type {Guid}
     */
    static Audit_AccountManagement_ApplicationGroup => Guid("{0cce9239-69ae-11d9-bed3-505054503030}")

    /**
     * @type {Guid}
     */
    static Audit_AccountManagement_Others => Guid("{0cce923a-69ae-11d9-bed3-505054503030}")

    /**
     * @type {Guid}
     */
    static Audit_DSAccess_DSAccess => Guid("{0cce923b-69ae-11d9-bed3-505054503030}")

    /**
     * @type {Guid}
     */
    static Audit_DsAccess_AdAuditChanges => Guid("{0cce923c-69ae-11d9-bed3-505054503030}")

    /**
     * @type {Guid}
     */
    static Audit_Ds_Replication => Guid("{0cce923d-69ae-11d9-bed3-505054503030}")

    /**
     * @type {Guid}
     */
    static Audit_Ds_DetailedReplication => Guid("{0cce923e-69ae-11d9-bed3-505054503030}")

    /**
     * @type {Guid}
     */
    static Audit_AccountLogon_CredentialValidation => Guid("{0cce923f-69ae-11d9-bed3-505054503030}")

    /**
     * @type {Guid}
     */
    static Audit_AccountLogon_Kerberos => Guid("{0cce9240-69ae-11d9-bed3-505054503030}")

    /**
     * @type {Guid}
     */
    static Audit_AccountLogon_Others => Guid("{0cce9241-69ae-11d9-bed3-505054503030}")

    /**
     * @type {Guid}
     */
    static Audit_AccountLogon_KerbCredentialValidation => Guid("{0cce9242-69ae-11d9-bed3-505054503030}")

    /**
     * @type {Guid}
     */
    static Audit_Logon_NPS => Guid("{0cce9243-69ae-11d9-bed3-505054503030}")

    /**
     * @type {Guid}
     */
    static Audit_ObjectAccess_DetailedFileShare => Guid("{0cce9244-69ae-11d9-bed3-505054503030}")

    /**
     * @type {Guid}
     */
    static Audit_ObjectAccess_RemovableStorage => Guid("{0cce9245-69ae-11d9-bed3-505054503030}")

    /**
     * @type {Guid}
     */
    static Audit_ObjectAccess_CbacStaging => Guid("{0cce9246-69ae-11d9-bed3-505054503030}")

    /**
     * @type {Guid}
     */
    static Audit_Logon_Claims => Guid("{0cce9247-69ae-11d9-bed3-505054503030}")

    /**
     * @type {Guid}
     */
    static Audit_DetailedTracking_PnpActivity => Guid("{0cce9248-69ae-11d9-bed3-505054503030}")

    /**
     * @type {Guid}
     */
    static Audit_Logon_Groups => Guid("{0cce9249-69ae-11d9-bed3-505054503030}")

    /**
     * @type {Guid}
     */
    static Audit_DetailedTracking_TokenRightAdjusted => Guid("{0cce924a-69ae-11d9-bed3-505054503030}")

    /**
     * @type {Guid}
     */
    static Audit_System => Guid("{69979848-797a-11d9-bed3-505054503030}")

    /**
     * @type {Guid}
     */
    static Audit_Logon => Guid("{69979849-797a-11d9-bed3-505054503030}")

    /**
     * @type {Guid}
     */
    static Audit_ObjectAccess => Guid("{6997984a-797a-11d9-bed3-505054503030}")

    /**
     * @type {Guid}
     */
    static Audit_PrivilegeUse => Guid("{6997984b-797a-11d9-bed3-505054503030}")

    /**
     * @type {Guid}
     */
    static Audit_DetailedTracking => Guid("{6997984c-797a-11d9-bed3-505054503030}")

    /**
     * @type {Guid}
     */
    static Audit_PolicyChange => Guid("{6997984d-797a-11d9-bed3-505054503030}")

    /**
     * @type {Guid}
     */
    static Audit_AccountManagement => Guid("{6997984e-797a-11d9-bed3-505054503030}")

    /**
     * @type {Guid}
     */
    static Audit_DirectoryServiceAccess => Guid("{6997984f-797a-11d9-bed3-505054503030}")

    /**
     * @type {Guid}
     */
    static Audit_AccountLogon => Guid("{69979850-797a-11d9-bed3-505054503030}")

    /**
     * @type {Integer (Int32)}
     */
    static DOMAIN_NO_LM_OWF_CHANGE => 64

    /**
     * @type {String}
     */
    static SAM_PASSWORD_CHANGE_NOTIFY_ROUTINE => "PasswordChangeNotify"

    /**
     * @type {String}
     */
    static SAM_INIT_NOTIFICATION_ROUTINE => "InitializeChangeNotify"

    /**
     * @type {String}
     */
    static SAM_PASSWORD_FILTER_ROUTINE => "PasswordFilter"

    /**
     * @type {String}
     */
    static MSV1_0_PACKAGE_NAME => "MICROSOFT_AUTHENTICATION_PACKAGE_V1_0"

    /**
     * @type {String}
     */
    static MSV1_0_PACKAGE_NAMEW => "MICROSOFT_AUTHENTICATION_PACKAGE_V1_0"

    /**
     * @type {String}
     */
    static MSV1_0_SUBAUTHENTICATION_KEY => "SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0"

    /**
     * @type {String}
     */
    static MSV1_0_SUBAUTHENTICATION_VALUE => "Auth"

    /**
     * @type {Integer (UInt32)}
     */
    static MSV1_0_CHALLENGE_LENGTH => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MSV1_0_USER_SESSION_KEY_LENGTH => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MSV1_0_LANMAN_SESSION_KEY_LENGTH => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MSV1_0_USE_CLIENT_CHALLENGE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static MSV1_0_DISABLE_PERSONAL_FALLBACK => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static MSV1_0_ALLOW_FORCE_GUEST => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static MSV1_0_CLEARTEXT_PASSWORD_SUPPLIED => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static MSV1_0_USE_DOMAIN_FOR_ROUTING_ONLY => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static MSV1_0_SUBAUTHENTICATION_DLL_EX => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static MSV1_0_ALLOW_MSVCHAPV2 => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static MSV1_0_S4U2SELF => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static MSV1_0_CHECK_LOGONHOURS_FOR_S4U => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static MSV1_0_INTERNET_DOMAIN => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static MSV1_0_SUBAUTHENTICATION_DLL => 4278190080

    /**
     * @type {Integer (UInt32)}
     */
    static MSV1_0_SUBAUTHENTICATION_DLL_SHIFT => 24

    /**
     * @type {Integer (UInt32)}
     */
    static MSV1_0_MNS_LOGON => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static MSV1_0_SUBAUTHENTICATION_DLL_RAS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MSV1_0_SUBAUTHENTICATION_DLL_IIS => 132

    /**
     * @type {Integer (UInt32)}
     */
    static MSV1_0_S4U_LOGON_FLAG_CHECK_LOGONHOURS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LOGON_NTLMV2_ENABLED => 256

    /**
     * @type {Integer (UInt32)}
     */
    static LOGON_NT_V2 => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static LOGON_LM_V2 => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static LOGON_NTLM_V2 => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static LOGON_OPTIMIZED => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static LOGON_WINLOGON => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static LOGON_PKINIT => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static LOGON_NO_OPTIMIZED => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static LOGON_NO_ELEVATION => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static LOGON_MANAGED_SERVICE => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static MSV1_0_SUBAUTHENTICATION_FLAGS => 4278190080

    /**
     * @type {Integer (UInt32)}
     */
    static LOGON_GRACE_LOGON => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static MSV1_0_OWF_PASSWORD_LENGTH => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MSV1_0_SHA_PASSWORD_LENGTH => 20

    /**
     * @type {Integer (UInt32)}
     */
    static MSV1_0_CREDENTIAL_KEY_LENGTH => 20

    /**
     * @type {Integer (UInt32)}
     */
    static MSV1_0_CRED_REMOVED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MSV1_0_CRED_CREDKEY_PRESENT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MSV1_0_CRED_SHA_PRESENT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MSV1_0_CRED_VERSION_V2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MSV1_0_CRED_VERSION_V3 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MSV1_0_CRED_VERSION_IUM => 4294901761

    /**
     * @type {Integer (UInt32)}
     */
    static MSV1_0_CRED_VERSION_REMOTE => 4294901762

    /**
     * @type {Integer (UInt32)}
     */
    static MSV1_0_CRED_VERSION_ARSO => 4294901763

    /**
     * @type {Integer (UInt32)}
     */
    static MSV1_0_CRED_VERSION_RESERVED_1 => 4294967294

    /**
     * @type {Integer (UInt32)}
     */
    static MSV1_0_CRED_VERSION_INVALID => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static MSV1_0_NTLM3_RESPONSE_LENGTH => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MSV1_0_NTLM3_OWF_LENGTH => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MSV1_0_MAX_NTLM3_LIFE => 1800

    /**
     * @type {Integer (UInt32)}
     */
    static MSV1_0_MAX_AVL_SIZE => 64000

    /**
     * @type {Integer (UInt32)}
     */
    static MSV1_0_AV_FLAG_FORCE_GUEST => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MSV1_0_AV_FLAG_MIC_HANDSHAKE_MESSAGES => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MSV1_0_AV_FLAG_UNVERIFIED_TARGET => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RTL_ENCRYPT_MEMORY_SIZE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static RTL_ENCRYPT_OPTION_CROSS_PROCESS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RTL_ENCRYPT_OPTION_SAME_LOGON => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RTL_ENCRYPT_OPTION_FOR_SYSTEM => 4

    /**
     * @type {Integer (UInt32)}
     */
    static KERBEROS_VERSION => 5

    /**
     * @type {Integer (UInt32)}
     */
    static KERBEROS_REVISION => 6

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_ETYPE_AES128_CTS_HMAC_SHA1_96 => 17

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_ETYPE_AES256_CTS_HMAC_SHA1_96 => 18

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_ETYPE_AES128_CTS_HMAC_SHA256 => 19

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_ETYPE_AES256_CTS_HMAC_SHA384 => 20

    /**
     * @type {Integer (Int32)}
     */
    static KERB_ETYPE_RC4_PLAIN2 => -129

    /**
     * @type {Integer (Int32)}
     */
    static KERB_ETYPE_RC4_LM => -130

    /**
     * @type {Integer (Int32)}
     */
    static KERB_ETYPE_RC4_SHA => -131

    /**
     * @type {Integer (Int32)}
     */
    static KERB_ETYPE_DES_PLAIN => -132

    /**
     * @type {Integer (Int32)}
     */
    static KERB_ETYPE_RC4_HMAC_OLD => -133

    /**
     * @type {Integer (Int32)}
     */
    static KERB_ETYPE_RC4_PLAIN_OLD => -134

    /**
     * @type {Integer (Int32)}
     */
    static KERB_ETYPE_RC4_HMAC_OLD_EXP => -135

    /**
     * @type {Integer (Int32)}
     */
    static KERB_ETYPE_RC4_PLAIN_OLD_EXP => -136

    /**
     * @type {Integer (Int32)}
     */
    static KERB_ETYPE_RC4_PLAIN => -140

    /**
     * @type {Integer (Int32)}
     */
    static KERB_ETYPE_RC4_PLAIN_EXP => -141

    /**
     * @type {Integer (Int32)}
     */
    static KERB_ETYPE_AES128_CTS_HMAC_SHA1_96_PLAIN => -148

    /**
     * @type {Integer (Int32)}
     */
    static KERB_ETYPE_AES256_CTS_HMAC_SHA1_96_PLAIN => -149

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_ETYPE_DSA_SHA1_CMS => 9

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_ETYPE_RSA_MD5_CMS => 10

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_ETYPE_RSA_SHA1_CMS => 11

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_ETYPE_RC2_CBC_ENV => 12

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_ETYPE_RSA_ENV => 13

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_ETYPE_RSA_ES_OEAP_ENV => 14

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_ETYPE_DES_EDE3_CBC_ENV => 15

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_ETYPE_DSA_SIGN => 8

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_ETYPE_RSA_PRIV => 9

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_ETYPE_RSA_PUB => 10

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_ETYPE_RSA_PUB_MD5 => 11

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_ETYPE_RSA_PUB_SHA1 => 12

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_ETYPE_PKCS7_PUB => 13

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_ETYPE_DES3_CBC_MD5 => 5

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_ETYPE_DES3_CBC_SHA1 => 7

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_ETYPE_DES3_CBC_SHA1_KD => 16

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_ETYPE_DES_CBC_MD5_NT => 20

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_ETYPE_RC4_HMAC_NT_EXP => 24

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_CHECKSUM_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_CHECKSUM_CRC32 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_CHECKSUM_MD4 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_CHECKSUM_KRB_DES_MAC => 4

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_CHECKSUM_KRB_DES_MAC_K => 5

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_CHECKSUM_MD5 => 7

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_CHECKSUM_MD5_DES => 8

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_CHECKSUM_SHA1_NEW => 14

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_CHECKSUM_HMAC_SHA1_96_AES128 => 15

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_CHECKSUM_HMAC_SHA1_96_AES256 => 16

    /**
     * @type {Integer (Int32)}
     */
    static KERB_CHECKSUM_LM => -130

    /**
     * @type {Integer (Int32)}
     */
    static KERB_CHECKSUM_SHA1 => -131

    /**
     * @type {Integer (Int32)}
     */
    static KERB_CHECKSUM_REAL_CRC32 => -132

    /**
     * @type {Integer (Int32)}
     */
    static KERB_CHECKSUM_DES_MAC => -133

    /**
     * @type {Integer (Int32)}
     */
    static KERB_CHECKSUM_DES_MAC_MD5 => -134

    /**
     * @type {Integer (Int32)}
     */
    static KERB_CHECKSUM_MD25 => -135

    /**
     * @type {Integer (Int32)}
     */
    static KERB_CHECKSUM_RC4_MD5 => -136

    /**
     * @type {Integer (Int32)}
     */
    static KERB_CHECKSUM_MD5_HMAC => -137

    /**
     * @type {Integer (Int32)}
     */
    static KERB_CHECKSUM_HMAC_MD5 => -138

    /**
     * @type {Integer (Int32)}
     */
    static KERB_CHECKSUM_SHA256 => -139

    /**
     * @type {Integer (Int32)}
     */
    static KERB_CHECKSUM_SHA384 => -140

    /**
     * @type {Integer (Int32)}
     */
    static KERB_CHECKSUM_SHA512 => -141

    /**
     * @type {Integer (Int32)}
     */
    static KERB_CHECKSUM_HMAC_SHA1_96_AES128_Ki => -150

    /**
     * @type {Integer (Int32)}
     */
    static KERB_CHECKSUM_HMAC_SHA1_96_AES256_Ki => -151

    /**
     * @type {Integer (UInt32)}
     */
    static AUTH_REQ_ALLOW_FORWARDABLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static AUTH_REQ_ALLOW_PROXIABLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static AUTH_REQ_ALLOW_POSTDATE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static AUTH_REQ_ALLOW_RENEWABLE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static AUTH_REQ_ALLOW_NOADDRESS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static AUTH_REQ_ALLOW_ENC_TKT_IN_SKEY => 32

    /**
     * @type {Integer (UInt32)}
     */
    static AUTH_REQ_ALLOW_VALIDATE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static AUTH_REQ_VALIDATE_CLIENT => 128

    /**
     * @type {Integer (UInt32)}
     */
    static AUTH_REQ_OK_AS_DELEGATE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static AUTH_REQ_PREAUTH_REQUIRED => 512

    /**
     * @type {Integer (UInt32)}
     */
    static AUTH_REQ_TRANSITIVE_TRUST => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static AUTH_REQ_ALLOW_S4U_DELEGATE => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_TICKET_FLAGS_name_canonicalize => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_TICKET_FLAGS_cname_in_pa_data => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_TICKET_FLAGS_enc_pa_rep => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static KRB_NT_UNKNOWN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static KRB_NT_PRINCIPAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static KRB_NT_PRINCIPAL_AND_ID => -131

    /**
     * @type {Integer (UInt32)}
     */
    static KRB_NT_SRV_INST => 2

    /**
     * @type {Integer (Int32)}
     */
    static KRB_NT_SRV_INST_AND_ID => -132

    /**
     * @type {Integer (UInt32)}
     */
    static KRB_NT_SRV_HST => 3

    /**
     * @type {Integer (UInt32)}
     */
    static KRB_NT_SRV_XHST => 4

    /**
     * @type {Integer (UInt32)}
     */
    static KRB_NT_UID => 5

    /**
     * @type {Integer (UInt32)}
     */
    static KRB_NT_ENTERPRISE_PRINCIPAL => 10

    /**
     * @type {Integer (UInt32)}
     */
    static KRB_NT_WELLKNOWN => 11

    /**
     * @type {Integer (Int32)}
     */
    static KRB_NT_ENT_PRINCIPAL_AND_ID => -130

    /**
     * @type {Integer (Int32)}
     */
    static KRB_NT_MS_PRINCIPAL => -128

    /**
     * @type {Integer (Int32)}
     */
    static KRB_NT_MS_PRINCIPAL_AND_ID => -129

    /**
     * @type {Integer (Int32)}
     */
    static KRB_NT_MS_BRANCH_ID => -133

    /**
     * @type {Integer (UInt32)}
     */
    static KRB_NT_X500_PRINCIPAL => 6

    /**
     * @type {String}
     */
    static KRB_WELLKNOWN_STRING => "WELLKNOWN"

    /**
     * @type {String}
     */
    static KRB_ANONYMOUS_STRING => "ANONYMOUS"

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_WRAP_NO_ENCRYPT => 2147483649

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_CERTIFICATE_LOGON_FLAG_CHECK_DUPLICATES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_CERTIFICATE_LOGON_FLAG_USE_CERTIFICATE_INFO => 2

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_CERTIFICATE_S4U_LOGON_FLAG_CHECK_DUPLICATES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_CERTIFICATE_S4U_LOGON_FLAG_CHECK_LOGONHOURS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_CERTIFICATE_S4U_LOGON_FLAG_FAIL_IF_NT_AUTH_POLICY_REQUIRED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_CERTIFICATE_S4U_LOGON_FLAG_IDENTIFY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_LOGON_FLAG_ALLOW_EXPIRED_TICKET => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_LOGON_FLAG_REDIRECTED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_S4U_LOGON_FLAG_CHECK_LOGONHOURS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_S4U_LOGON_FLAG_IDENTIFY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_USE_DEFAULT_TICKET_FLAGS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_RETRIEVE_TICKET_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_RETRIEVE_TICKET_DONT_USE_CACHE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_RETRIEVE_TICKET_USE_CACHE_ONLY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_RETRIEVE_TICKET_USE_CREDHANDLE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_RETRIEVE_TICKET_AS_KERB_CRED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_RETRIEVE_TICKET_WITH_SEC_CRED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_RETRIEVE_TICKET_CACHE_TICKET => 32

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_RETRIEVE_TICKET_MAX_LIFETIME => 64

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_ETYPE_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_PURGE_ALL_TICKETS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_S4U2PROXY_CACHE_ENTRY_INFO_FLAG_NEGATIVE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_S4U2PROXY_CRED_FLAG_NEGATIVE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_REFRESH_POLICY_KERBEROS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_REFRESH_POLICY_KDC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_CLOUD_KERBEROS_DEBUG_DATA_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DS_UNKNOWN_ADDRESS_TYPE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_SETPASS_USE_LOGONID => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_SETPASS_USE_CREDHANDLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_DECRYPT_FLAG_DEFAULT_KEY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_REFRESH_SCCRED_RELEASE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_REFRESH_SCCRED_GETTGT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_REQUEST_CRED_LOCAL_ACCOUNT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_TRANSFER_CRED_WITH_TICKETS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_TRANSFER_CRED_CLEANUP_CREDENTIALS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_QUERY_DOMAIN_EXTENDED_POLICIES_RESPONSE_FLAG_DAC_DISABLED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static AUDIT_SET_SYSTEM_POLICY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static AUDIT_QUERY_SYSTEM_POLICY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static AUDIT_SET_USER_POLICY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static AUDIT_QUERY_USER_POLICY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static AUDIT_ENUMERATE_USERS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static AUDIT_SET_MISC_POLICY => 32

    /**
     * @type {Integer (UInt32)}
     */
    static AUDIT_QUERY_MISC_POLICY => 64

    /**
     * @type {String}
     */
    static PKU2U_PACKAGE_NAME_A => "pku2u"

    /**
     * @type {String}
     */
    static PKU2U_PACKAGE_NAME => "pku2u"

    /**
     * @type {String}
     */
    static PKU2U_PACKAGE_NAME_W => "pku2u"

    /**
     * @type {String}
     */
    static SAM_CREDENTIAL_UPDATE_NOTIFY_ROUTINE => "CredentialUpdateNotify"

    /**
     * @type {String}
     */
    static SAM_CREDENTIAL_UPDATE_REGISTER_ROUTINE => "CredentialUpdateRegister"

    /**
     * @type {String}
     */
    static SAM_CREDENTIAL_UPDATE_FREE_ROUTINE => "CredentialUpdateFree"

    /**
     * @type {String}
     */
    static SAM_CREDENTIAL_UPDATE_REGISTER_MAPPED_ENTRYPOINTS_ROUTINE => "RegisterMappedEntrypoints"

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_CLIENT_PROCESS_TERMINATED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_CLIENT_THREAD_TERMINATED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_CALL_KERNEL_MODE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_CALL_ANSI => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_CALL_URGENT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_CALL_RECURSIVE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_CALL_IN_PROC => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_CALL_CLEANUP => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_CALL_WOWCLIENT => 64

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_CALL_THREAD_TERM => 128

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_CALL_PROCESS_TERM => 256

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_CALL_IS_TCB => 512

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_CALL_NETWORK_ONLY => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_CALL_WINLOGON => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_CALL_ASYNC_UPDATE => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_CALL_SYSTEM_PROC => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_CALL_NEGO => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_CALL_NEGO_EXTENDER => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_CALL_BUFFER_MARSHAL => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_CALL_UNLOCK => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_CALL_CLOUDAP_CONNECT => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_CALL_WOWX86 => 64

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_CALL_WOWA32 => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_CREDENTIAL_VERSION => 201

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_CREDENTIAL_FLAGS_CALLER_HAS_TCB => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_CREDENTIAL_FLAGS_CREDMAN_CRED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_SURROGATE_LOGON_VERSION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SECBUFFER_UNMAPPED => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static SECBUFFER_KERNEL_MAP => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static PRIMARY_CRED_CLEAR_PASSWORD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PRIMARY_CRED_OWF_PASSWORD => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PRIMARY_CRED_UPDATE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PRIMARY_CRED_CACHED_LOGON => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PRIMARY_CRED_LOGON_NO_TCB => 16

    /**
     * @type {Integer (UInt32)}
     */
    static PRIMARY_CRED_LOGON_LUA => 32

    /**
     * @type {Integer (UInt32)}
     */
    static PRIMARY_CRED_INTERACTIVE_SMARTCARD_LOGON => 64

    /**
     * @type {Integer (UInt32)}
     */
    static PRIMARY_CRED_REFRESH_NEEDED => 128

    /**
     * @type {Integer (UInt32)}
     */
    static PRIMARY_CRED_INTERNET_USER => 256

    /**
     * @type {Integer (UInt32)}
     */
    static PRIMARY_CRED_AUTH_ID => 512

    /**
     * @type {Integer (UInt32)}
     */
    static PRIMARY_CRED_DO_NOT_SPLIT => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static PRIMARY_CRED_PROTECTED_USER => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static PRIMARY_CRED_EX => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static PRIMARY_CRED_TRANSFER => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static PRIMARY_CRED_RESTRICTED_TS => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static PRIMARY_CRED_PACKED_CREDS => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static PRIMARY_CRED_ENTERPRISE_INTERNET_USER => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static PRIMARY_CRED_ENCRYPTED_CREDGUARD_PASSWORD => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static PRIMARY_CRED_CACHED_INTERACTIVE_LOGON => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static PRIMARY_CRED_INTERACTIVE_NGC_LOGON => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static PRIMARY_CRED_INTERACTIVE_FIDO_LOGON => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static PRIMARY_CRED_ARSO_LOGON => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static PRIMARY_CRED_SUPPLEMENTAL => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static PRIMARY_CRED_FOR_PASSWORD_CHANGE => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static PRIMARY_CRED_LOGON_PACKAGE_SHIFT => 24

    /**
     * @type {Integer (UInt32)}
     */
    static PRIMARY_CRED_PACKAGE_MASK => 4278190080

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_PRIMARY_CRED_EX_FLAGS_EX_DELEGATION_TOKEN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_CRED_SIZE => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_STATE_ENCRYPTION_PERMITTED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_STATE_STRONG_ENCRYPTION_PERMITTED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_STATE_DOMAIN_CONTROLLER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_STATE_WORKSTATION => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_STATE_STANDALONE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_STATE_CRED_ISOLATION_ENABLED => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_STATE_RESERVED_1 => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_MAX_OID_LENGTH => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_MSVAV_FLAGS_VALID => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_MSVAV_TIMESTAMP_VALID => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_SASL_CONTEXT => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_THUNK_ALL => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static UNDERSTANDS_LONG_NAMES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NO_LONG_NAMES => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_CALL_PACKAGE_TRANSFER_CRED_REQUEST_FLAG_OPTIMISTIC_LOGON => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_CALL_PACKAGE_TRANSFER_CRED_REQUEST_FLAG_CLEANUP_CREDENTIALS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_CALL_PACKAGE_TRANSFER_CRED_REQUEST_FLAG_TO_SSO_SESSION => 4

    /**
     * @type {Guid}
     */
    static SECPKG_REDIRECTED_LOGON_GUID_INITIALIZER => Guid("{c2be5457-82eb-483e-ae4e-7468ef14d509}")

    /**
     * @type {Integer (UInt32)}
     */
    static NOTIFIER_FLAG_NEW_THREAD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NOTIFIER_FLAG_ONE_SHOT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NOTIFIER_FLAG_SECONDS => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static NOTIFIER_TYPE_INTERVAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NOTIFIER_TYPE_HANDLE_WAIT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NOTIFIER_TYPE_STATE_CHANGE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static NOTIFIER_TYPE_NOTIFY_EVENT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NOTIFIER_TYPE_IMMEDIATE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static NOTIFY_CLASS_PACKAGE_CHANGE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NOTIFY_CLASS_ROLE_CHANGE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NOTIFY_CLASS_DOMAIN_CHANGE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static NOTIFY_CLASS_REGISTRY_CHANGE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LSA_QUERY_CLIENT_PRELOGON_SESSION_ID => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CREDP_FLAGS_IN_PROCESS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CREDP_FLAGS_USE_MIDL_HEAP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CREDP_FLAGS_DONT_CACHE_TI => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CREDP_FLAGS_CLEAR_PASSWORD => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CREDP_FLAGS_USER_ENCRYPTED_PASSWORD => 16

    /**
     * @type {Integer (UInt32)}
     */
    static CREDP_FLAGS_TRUSTED_CALLER => 32

    /**
     * @type {Integer (UInt32)}
     */
    static CREDP_FLAGS_VALIDATE_PROXY_TARGET => 64

    /**
     * @type {Integer (UInt32)}
     */
    static CRED_MARSHALED_TI_SIZE_SIZE => 12

    /**
     * @type {String}
     */
    static LSA_AP_NAME_LOGON_USER_EX2 => "LsaApLogonUserEx2" Chr(0) ""

    /**
     * @type {String}
     */
    static SP_ACCEPT_CREDENTIALS_NAME => "SpAcceptCredentials" Chr(0) ""

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_UNICODE_ATTRIBUTE => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ANSI_ATTRIBUTE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_CREDENTIAL_ATTRIBUTE => 0

    /**
     * @type {String}
     */
    static SECPKG_LSAMODEINIT_NAME => "SpLsaModeInitialize"

    /**
     * @type {String}
     */
    static SECPKG_USERMODEINIT_NAME => "SpUserModeInitialize"

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_INTERFACE_VERSION => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_INTERFACE_VERSION_2 => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_INTERFACE_VERSION_3 => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_INTERFACE_VERSION_4 => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_INTERFACE_VERSION_5 => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_INTERFACE_VERSION_6 => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_INTERFACE_VERSION_7 => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_INTERFACE_VERSION_8 => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_INTERFACE_VERSION_9 => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_INTERFACE_VERSION_10 => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_INTERFACE_VERSION_11 => 67108864

    /**
     * @type {String}
     */
    static UNISP_NAME_A => "Microsoft Unified Security Protocol Provider"

    /**
     * @type {String}
     */
    static UNISP_NAME_W => "Microsoft Unified Security Protocol Provider"

    /**
     * @type {String}
     */
    static SSL2SP_NAME_A => "Microsoft SSL 2.0"

    /**
     * @type {String}
     */
    static SSL2SP_NAME_W => "Microsoft SSL 2.0"

    /**
     * @type {String}
     */
    static SSL3SP_NAME_A => "Microsoft SSL 3.0"

    /**
     * @type {String}
     */
    static SSL3SP_NAME_W => "Microsoft SSL 3.0"

    /**
     * @type {String}
     */
    static TLS1SP_NAME_A => "Microsoft TLS 1.0"

    /**
     * @type {String}
     */
    static TLS1SP_NAME_W => "Microsoft TLS 1.0"

    /**
     * @type {String}
     */
    static PCT1SP_NAME_A => "Microsoft PCT 1.0"

    /**
     * @type {String}
     */
    static PCT1SP_NAME_W => "Microsoft PCT 1.0"

    /**
     * @type {String}
     */
    static SCHANNEL_NAME_A => "Schannel"

    /**
     * @type {String}
     */
    static SCHANNEL_NAME_W => "Schannel"

    /**
     * @type {String}
     */
    static DEFAULT_TLS_SSP_NAME_A => "Default TLS SSP"

    /**
     * @type {String}
     */
    static DEFAULT_TLS_SSP_NAME_W => "Default TLS SSP"

    /**
     * @type {String}
     */
    static UNISP_NAME => "Microsoft Unified Security Protocol Provider"

    /**
     * @type {String}
     */
    static PCT1SP_NAME => "Microsoft PCT 1.0"

    /**
     * @type {String}
     */
    static SSL2SP_NAME => "Microsoft SSL 2.0"

    /**
     * @type {String}
     */
    static SSL3SP_NAME => "Microsoft SSL 3.0"

    /**
     * @type {String}
     */
    static TLS1SP_NAME => "Microsoft TLS 1.0"

    /**
     * @type {String}
     */
    static SCHANNEL_NAME => "Schannel"

    /**
     * @type {String}
     */
    static DEFAULT_TLS_SSP_NAME => "Default TLS SSP"

    /**
     * @type {Integer (UInt32)}
     */
    static UNISP_RPC_ID => 14

    /**
     * @type {Integer (UInt32)}
     */
    static RCRED_STATUS_NOCRED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static RCRED_CRED_EXISTS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RCRED_STATUS_UNKNOWN_ISSUER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LCRED_STATUS_NOCRED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static LCRED_CRED_EXISTS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LCRED_STATUS_UNKNOWN_ISSUER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKGCONTEXT_CONNECTION_INFO_EX_V1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKGCONTEXT_CIPHERINFO_V1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SSL_SESSION_RECONNECT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KERN_CONTEXT_CERT_INFO_V1 => 0

    /**
     * @type {Integer (UInt32)}
     */
    static ENABLE_TLS_CLIENT_EARLY_START => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SCH_CRED_V1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SCH_CRED_V2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SCH_CRED_VERSION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SCH_CRED_V3 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SCHANNEL_CRED_VERSION => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SCH_CREDENTIALS_VERSION => 5

    /**
     * @type {String}
     */
    static SCHANNEL_RSA_PSS_PADDING_ALGORITHM => "SCH_RSA_PSS_PAD"

    /**
     * @type {String}
     */
    static SCHANNEL_RSA_PKCS_PADDING_ALGORITHM => "SCH_RSA_PKCS_PAD"

    /**
     * @type {Integer (UInt32)}
     */
    static TLS_PARAMS_OPTIONAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SCH_CRED_MAX_SUPPORTED_PARAMETERS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SCH_CRED_MAX_SUPPORTED_ALPN_IDS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SCH_CRED_MAX_SUPPORTED_CRYPTO_SETTINGS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SCH_CRED_MAX_SUPPORTED_CHAINING_MODES => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SCH_MAX_EXT_SUBSCRIPTIONS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SCH_CRED_FORMAT_CERT_CONTEXT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SCH_CRED_FORMAT_CERT_HASH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SCH_CRED_FORMAT_CERT_HASH_STORE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SCH_CRED_MAX_STORE_NAME_SIZE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static SCH_CRED_MAX_SUPPORTED_ALGS => 256

    /**
     * @type {Integer (UInt32)}
     */
    static SCH_CRED_MAX_SUPPORTED_CERTS => 100

    /**
     * @type {Integer (UInt32)}
     */
    static SCH_MACHINE_CERT_HASH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SCH_CRED_DISABLE_RECONNECTS => 128

    /**
     * @type {Integer (UInt32)}
     */
    static SCH_CRED_RESTRICTED_ROOTS => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static SCH_CRED_REVOCATION_CHECK_CACHE_ONLY => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static SCH_CRED_CACHE_ONLY_URL_RETRIEVAL => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static SCH_CRED_MEMORY_STORE_CERT => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static SCH_CRED_SNI_CREDENTIAL => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static SCH_CRED_SNI_ENABLE_OCSP => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static SCH_USE_DTLS_ONLY => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static SCH_ALLOW_NULL_ENCRYPTION => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static SCH_CRED_DEFERRED_CRED_VALIDATION => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static SCHANNEL_RENEGOTIATE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SCHANNEL_SHUTDOWN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SCHANNEL_ALERT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SCHANNEL_SESSION => 3

    /**
     * @type {Integer (UInt32)}
     */
    static TLS1_ALERT_CLOSE_NOTIFY => 0

    /**
     * @type {Integer (UInt32)}
     */
    static TLS1_ALERT_UNEXPECTED_MESSAGE => 10

    /**
     * @type {Integer (UInt32)}
     */
    static TLS1_ALERT_BAD_RECORD_MAC => 20

    /**
     * @type {Integer (UInt32)}
     */
    static TLS1_ALERT_DECRYPTION_FAILED => 21

    /**
     * @type {Integer (UInt32)}
     */
    static TLS1_ALERT_RECORD_OVERFLOW => 22

    /**
     * @type {Integer (UInt32)}
     */
    static TLS1_ALERT_DECOMPRESSION_FAIL => 30

    /**
     * @type {Integer (UInt32)}
     */
    static TLS1_ALERT_HANDSHAKE_FAILURE => 40

    /**
     * @type {Integer (UInt32)}
     */
    static TLS1_ALERT_BAD_CERTIFICATE => 42

    /**
     * @type {Integer (UInt32)}
     */
    static TLS1_ALERT_UNSUPPORTED_CERT => 43

    /**
     * @type {Integer (UInt32)}
     */
    static TLS1_ALERT_CERTIFICATE_REVOKED => 44

    /**
     * @type {Integer (UInt32)}
     */
    static TLS1_ALERT_CERTIFICATE_EXPIRED => 45

    /**
     * @type {Integer (UInt32)}
     */
    static TLS1_ALERT_CERTIFICATE_UNKNOWN => 46

    /**
     * @type {Integer (UInt32)}
     */
    static TLS1_ALERT_ILLEGAL_PARAMETER => 47

    /**
     * @type {Integer (UInt32)}
     */
    static TLS1_ALERT_UNKNOWN_CA => 48

    /**
     * @type {Integer (UInt32)}
     */
    static TLS1_ALERT_ACCESS_DENIED => 49

    /**
     * @type {Integer (UInt32)}
     */
    static TLS1_ALERT_DECODE_ERROR => 50

    /**
     * @type {Integer (UInt32)}
     */
    static TLS1_ALERT_DECRYPT_ERROR => 51

    /**
     * @type {Integer (UInt32)}
     */
    static TLS1_ALERT_EXPORT_RESTRICTION => 60

    /**
     * @type {Integer (UInt32)}
     */
    static TLS1_ALERT_PROTOCOL_VERSION => 70

    /**
     * @type {Integer (UInt32)}
     */
    static TLS1_ALERT_INSUFFIENT_SECURITY => 71

    /**
     * @type {Integer (UInt32)}
     */
    static TLS1_ALERT_INTERNAL_ERROR => 80

    /**
     * @type {Integer (UInt32)}
     */
    static TLS1_ALERT_USER_CANCELED => 90

    /**
     * @type {Integer (UInt32)}
     */
    static TLS1_ALERT_NO_RENEGOTIATION => 100

    /**
     * @type {Integer (UInt32)}
     */
    static TLS1_ALERT_UNSUPPORTED_EXT => 110

    /**
     * @type {Integer (UInt32)}
     */
    static TLS1_ALERT_UNKNOWN_PSK_IDENTITY => 115

    /**
     * @type {Integer (UInt32)}
     */
    static TLS1_ALERT_NO_APP_PROTOCOL => 120

    /**
     * @type {Integer (UInt32)}
     */
    static SP_PROT_PCT1_SERVER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SP_PROT_PCT1_CLIENT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SP_PROT_SSL2_SERVER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SP_PROT_SSL2_CLIENT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SP_PROT_SSL3_SERVER => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SP_PROT_SSL3_CLIENT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SP_PROT_TLS1_SERVER => 64

    /**
     * @type {Integer (UInt32)}
     */
    static SP_PROT_TLS1_CLIENT => 128

    /**
     * @type {Integer (UInt32)}
     */
    static SP_PROT_UNI_SERVER => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static SP_PROT_UNI_CLIENT => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static SP_PROT_ALL => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static SP_PROT_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SP_PROT_TLS1_0_SERVER => 64

    /**
     * @type {Integer (UInt32)}
     */
    static SP_PROT_TLS1_0_CLIENT => 128

    /**
     * @type {Integer (UInt32)}
     */
    static SP_PROT_TLS1_1_SERVER => 256

    /**
     * @type {Integer (UInt32)}
     */
    static SP_PROT_TLS1_1_CLIENT => 512

    /**
     * @type {Integer (UInt32)}
     */
    static SP_PROT_TLS1_2_SERVER => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static SP_PROT_TLS1_2_CLIENT => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static SP_PROT_TLS1_3_SERVER => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static SP_PROT_TLS1_3_CLIENT => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static SP_PROT_DTLS_SERVER => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static SP_PROT_DTLS_CLIENT => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static SP_PROT_DTLS1_0_SERVER => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static SP_PROT_DTLS1_0_CLIENT => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static SP_PROT_DTLS1_2_SERVER => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static SP_PROT_DTLS1_2_CLIENT => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static SP_PROT_TLS1_3PLUS_SERVER => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static SP_PROT_TLS1_3PLUS_CLIENT => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static SCHANNEL_SECRET_TYPE_CAPI => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SCHANNEL_SECRET_PRIVKEY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SCH_CRED_X509_CERTCHAIN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SCH_CRED_X509_CAPI => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SCH_CRED_CERT_CONTEXT => 3

    /**
     * @type {String}
     */
    static SSL_CRACK_CERTIFICATE_NAME => "SslCrackCertificate"

    /**
     * @type {String}
     */
    static SSL_FREE_CERTIFICATE_NAME => "SslFreeCertificate"

    /**
     * @type {String}
     */
    static SL_INFO_KEY_CHANNEL => "Channel"

    /**
     * @type {String}
     */
    static SL_INFO_KEY_NAME => "Name"

    /**
     * @type {String}
     */
    static SL_INFO_KEY_AUTHOR => "Author"

    /**
     * @type {String}
     */
    static SL_INFO_KEY_DESCRIPTION => "Description"

    /**
     * @type {String}
     */
    static SL_INFO_KEY_LICENSOR_URL => "LicensorUrl"

    /**
     * @type {String}
     */
    static SL_INFO_KEY_DIGITAL_PID => "DigitalPID"

    /**
     * @type {String}
     */
    static SL_INFO_KEY_DIGITAL_PID2 => "DigitalPID2"

    /**
     * @type {String}
     */
    static SL_INFO_KEY_PARTIAL_PRODUCT_KEY => "PartialProductKey"

    /**
     * @type {String}
     */
    static SL_INFO_KEY_PRODUCT_SKU_ID => "ProductSkuId"

    /**
     * @type {String}
     */
    static SL_INFO_KEY_LICENSE_TYPE => "LicenseType"

    /**
     * @type {String}
     */
    static SL_INFO_KEY_VERSION => "Version"

    /**
     * @type {String}
     */
    static SL_INFO_KEY_SYSTEM_STATE => "SystemState"

    /**
     * @type {String}
     */
    static SL_INFO_KEY_ACTIVE_PLUGINS => "ActivePlugins"

    /**
     * @type {String}
     */
    static SL_INFO_KEY_SECURE_STORE_ID => "SecureStoreId"

    /**
     * @type {String}
     */
    static SL_INFO_KEY_BIOS_PKEY => "BiosProductKey"

    /**
     * @type {String}
     */
    static SL_INFO_KEY_BIOS_SLIC_STATE => "BiosSlicState"

    /**
     * @type {String}
     */
    static SL_INFO_KEY_BIOS_OA2_MINOR_VERSION => "BiosOA2MinorVersion"

    /**
     * @type {String}
     */
    static SL_INFO_KEY_BIOS_PKEY_DESCRIPTION => "BiosProductKeyDescription"

    /**
     * @type {String}
     */
    static SL_INFO_KEY_BIOS_PKEY_PKPN => "BiosProductKeyPkPn"

    /**
     * @type {String}
     */
    static SL_INFO_KEY_SECURE_PROCESSOR_ACTIVATION_URL => "SPCURL"

    /**
     * @type {String}
     */
    static SL_INFO_KEY_RIGHT_ACCOUNT_ACTIVATION_URL => "RACURL"

    /**
     * @type {String}
     */
    static SL_INFO_KEY_PRODUCT_KEY_ACTIVATION_URL => "PKCURL"

    /**
     * @type {String}
     */
    static SL_INFO_KEY_USE_LICENSE_ACTIVATION_URL => "EULURL"

    /**
     * @type {String}
     */
    static SL_INFO_KEY_IS_KMS => "IsKeyManagementService"

    /**
     * @type {String}
     */
    static SL_INFO_KEY_KMS_CURRENT_COUNT => "KeyManagementServiceCurrentCount"

    /**
     * @type {String}
     */
    static SL_INFO_KEY_KMS_REQUIRED_CLIENT_COUNT => "KeyManagementServiceRequiredClientCount"

    /**
     * @type {String}
     */
    static SL_INFO_KEY_KMS_UNLICENSED_REQUESTS => "KeyManagementServiceUnlicensedRequests"

    /**
     * @type {String}
     */
    static SL_INFO_KEY_KMS_LICENSED_REQUESTS => "KeyManagementServiceLicensedRequests"

    /**
     * @type {String}
     */
    static SL_INFO_KEY_KMS_OOB_GRACE_REQUESTS => "KeyManagementServiceOOBGraceRequests"

    /**
     * @type {String}
     */
    static SL_INFO_KEY_KMS_OOT_GRACE_REQUESTS => "KeyManagementServiceOOTGraceRequests"

    /**
     * @type {String}
     */
    static SL_INFO_KEY_KMS_NON_GENUINE_GRACE_REQUESTS => "KeyManagementServiceNonGenuineGraceRequests"

    /**
     * @type {String}
     */
    static SL_INFO_KEY_KMS_NOTIFICATION_REQUESTS => "KeyManagementServiceNotificationRequests"

    /**
     * @type {String}
     */
    static SL_INFO_KEY_KMS_TOTAL_REQUESTS => "KeyManagementServiceTotalRequests"

    /**
     * @type {String}
     */
    static SL_INFO_KEY_KMS_FAILED_REQUESTS => "KeyManagementServiceFailedRequests"

    /**
     * @type {String}
     */
    static SL_INFO_KEY_IS_PRS => "IsPRS"

    /**
     * @type {String}
     */
    static SL_PKEY_MS2005 => "msft:rm/algorithm/pkey/2005"

    /**
     * @type {String}
     */
    static SL_PKEY_MS2009 => "msft:rm/algorithm/pkey/2009"

    /**
     * @type {String}
     */
    static SL_PKEY_DETECT => "msft:rm/algorithm/pkey/detect"

    /**
     * @type {String}
     */
    static SL_EVENT_LICENSING_STATE_CHANGED => "msft:rm/event/licensingstatechanged"

    /**
     * @type {String}
     */
    static SL_EVENT_POLICY_CHANGED => "msft:rm/event/policychanged"

    /**
     * @type {String}
     */
    static SL_EVENT_USER_NOTIFICATION => "msft:rm/event/usernotification"

    /**
     * @type {Integer (UInt32)}
     */
    static SL_SYSTEM_STATE_REBOOT_POLICY_FOUND => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SL_SYSTEM_STATE_TAMPERED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SL_REARM_REBOOT_REQUIRED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SPP_MIGRATION_GATHER_MIGRATABLE_APPS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SPP_MIGRATION_GATHER_ACTIVATED_WINDOWS_STATE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SPP_MIGRATION_GATHER_ALL => 4294967295

    /**
     * @type {String}
     */
    static SL_PROP_BRT_DATA => "SL_BRT_DATA"

    /**
     * @type {String}
     */
    static SL_PROP_BRT_COMMIT => "SL_BRT_COMMIT"

    /**
     * @type {String}
     */
    static SL_PROP_GENUINE_RESULT => "SL_GENUINE_RESULT"

    /**
     * @type {String}
     */
    static SL_PROP_NONGENUINE_GRACE_FLAG => "SL_NONGENUINE_GRACE_FLAG"

    /**
     * @type {String}
     */
    static SL_PROP_GET_GENUINE_AUTHZ => "SL_GET_GENUINE_AUTHZ"

    /**
     * @type {String}
     */
    static SL_PROP_GET_GENUINE_SERVER_AUTHZ => "SL_GET_GENUINE_SERVER_AUTHZ"

    /**
     * @type {String}
     */
    static SL_PROP_LAST_ACT_ATTEMPT_HRESULT => "SL_LAST_ACT_ATTEMPT_HRESULT"

    /**
     * @type {String}
     */
    static SL_PROP_LAST_ACT_ATTEMPT_TIME => "SL_LAST_ACT_ATTEMPT_TIME"

    /**
     * @type {String}
     */
    static SL_PROP_LAST_ACT_ATTEMPT_SERVER_FLAGS => "SL_LAST_ACT_ATTEMPT_SERVER_FLAGS"

    /**
     * @type {String}
     */
    static SL_PROP_ACTIVATION_VALIDATION_IN_PROGRESS => "SL_ACTIVATION_VALIDATION_IN_PROGRESS"

    /**
     * @type {String}
     */
    static SL_POLICY_EVALUATION_MODE_ENABLED => "Security-SPP-EvaluationModeEnabled"

    /**
     * @type {String}
     */
    static SL_DEFAULT_MIGRATION_ENCRYPTOR_URI => "msft:spp/migrationencryptor/tokenact/1.0"

    /**
     * @type {String}
     */
    static ID_CAP_SLAPI => "slapiQueryLicenseValue"

    /**
     * @type {Integer (UInt32)}
     */
    static USER_ACCOUNT_DISABLED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static USER_HOME_DIRECTORY_REQUIRED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static USER_PASSWORD_NOT_REQUIRED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static USER_TEMP_DUPLICATE_ACCOUNT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static USER_NORMAL_ACCOUNT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static USER_MNS_LOGON_ACCOUNT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static USER_INTERDOMAIN_TRUST_ACCOUNT => 64

    /**
     * @type {Integer (UInt32)}
     */
    static USER_WORKSTATION_TRUST_ACCOUNT => 128

    /**
     * @type {Integer (UInt32)}
     */
    static USER_SERVER_TRUST_ACCOUNT => 256

    /**
     * @type {Integer (UInt32)}
     */
    static USER_DONT_EXPIRE_PASSWORD => 512

    /**
     * @type {Integer (UInt32)}
     */
    static USER_ACCOUNT_AUTO_LOCKED => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static USER_ENCRYPTED_TEXT_PASSWORD_ALLOWED => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static USER_SMARTCARD_REQUIRED => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static USER_TRUSTED_FOR_DELEGATION => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static USER_NOT_DELEGATED => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static USER_USE_DES_KEY_ONLY => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static USER_DONT_REQUIRE_PREAUTH => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static USER_PASSWORD_EXPIRED => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static USER_TRUSTED_TO_AUTHENTICATE_FOR_DELEGATION => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static USER_NO_AUTH_DATA_REQUIRED => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static USER_PARTIAL_SECRETS_ACCOUNT => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static USER_USE_AES_KEYS => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static USER_SHADOW_ACCOUNT => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static SAM_DAYS_PER_WEEK => 7

    /**
     * @type {Integer (UInt32)}
     */
    static USER_ALL_PARAMETERS => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static CLEAR_BLOCK_LENGTH => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CYPHER_BLOCK_LENGTH => 8

    /**
     * @type {Integer (UInt32)}
     */
    static NETLOGON_TARGET_INFO_TYPE_NTLM => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NETLOGON_TARGET_INFO_TYPE_KERBEROS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MSV1_0_KERBEROS_LOGON => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MSV1_0_VALIDATION_LOGOFF_TIME => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MSV1_0_VALIDATION_KICKOFF_TIME => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MSV1_0_VALIDATION_LOGON_SERVER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MSV1_0_VALIDATION_LOGON_DOMAIN => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MSV1_0_VALIDATION_SESSION_KEY => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MSV1_0_VALIDATION_USER_FLAGS => 32

    /**
     * @type {Integer (UInt32)}
     */
    static MSV1_0_VALIDATION_USER_ID => 64

    /**
     * @type {Integer (UInt32)}
     */
    static MSV1_0_SUBAUTH_ACCOUNT_DISABLED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MSV1_0_SUBAUTH_PASSWORD => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MSV1_0_SUBAUTH_WORKSTATIONS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MSV1_0_SUBAUTH_LOGON_HOURS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MSV1_0_SUBAUTH_ACCOUNT_EXPIRY => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MSV1_0_SUBAUTH_PASSWORD_EXPIRY => 32

    /**
     * @type {Integer (UInt32)}
     */
    static MSV1_0_SUBAUTH_ACCOUNT_TYPE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static MSV1_0_SUBAUTH_LOCKOUT => 128

    /**
     * @type {Integer (UInt32)}
     */
    static SL_MDOLLAR_ZONE => 40960

    /**
     * @type {Integer (UInt32)}
     */
    static SL_SERVER_ZONE => 45056

    /**
     * @type {Integer (UInt32)}
     */
    static SL_MSCH_ZONE => 49152

    /**
     * @type {Integer (UInt32)}
     */
    static SL_INTERNAL_ZONE => 57344

    /**
     * @type {Integer (UInt32)}
     */
    static SL_CLIENTAPI_ZONE => 61440

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_SL_ITF => 4

    /**
     * @type {Integer (UInt32)}
     */
    static _FACILITY_WINDOWS_STORE => 63

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_SRV_INVALID_PUBLISH_LICENSE => -1073434623

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_SRV_INVALID_PRODUCT_KEY_LICENSE => -1073434622

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_SRV_INVALID_RIGHTS_ACCOUNT_LICENSE => -1073434621

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_SRV_INVALID_LICENSE_STRUCTURE => -1073434620

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_SRV_AUTHORIZATION_FAILED => -1073434619

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_SRV_INVALID_BINDING => -1073434618

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_SRV_SERVER_PONG => -1073434617

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_SRV_INVALID_PAYLOAD => -1073434616

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_SRV_INVALID_SECURITY_PROCESSOR_LICENSE => -1073434615

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_SRV_BUSINESS_TOKEN_ENTRY_NOT_FOUND => -1073434608

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_SRV_CLIENT_CLOCK_OUT_OF_SYNC => -1073434607

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_SRV_GENERAL_ERROR => -1073434368

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_CHPA_PRODUCT_KEY_OUT_OF_RANGE => -1073430527

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_CHPA_INVALID_BINDING => -1073430526

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_CHPA_PRODUCT_KEY_BLOCKED => -1073430525

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_CHPA_INVALID_PRODUCT_KEY => -1073430524

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_CHPA_BINDING_NOT_FOUND => -1073430523

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_CHPA_BINDING_MAPPING_NOT_FOUND => -1073430522

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_CHPA_UNSUPPORTED_PRODUCT_KEY => -1073430521

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_CHPA_MAXIMUM_UNLOCK_EXCEEDED => -1073430520

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_CHPA_ACTCONFIG_ID_NOT_FOUND => -1073430519

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_CHPA_INVALID_PRODUCT_DATA_ID => -1073430518

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_CHPA_INVALID_PRODUCT_DATA => -1073430517

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_CHPA_SYSTEM_ERROR => -1073430516

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_CHPA_INVALID_ACTCONFIG_ID => -1073430515

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_CHPA_INVALID_PRODUCT_KEY_LENGTH => -1073430514

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_CHPA_INVALID_PRODUCT_KEY_FORMAT => -1073430513

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_CHPA_INVALID_PRODUCT_KEY_CHAR => -1073430512

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_CHPA_INVALID_BINDING_URI => -1073430511

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_CHPA_NETWORK_ERROR => -1073430510

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_CHPA_DATABASE_ERROR => -1073430509

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_CHPA_INVALID_ARGUMENT => -1073430508

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_CHPA_DMAK_LIMIT_EXCEEDED => -1073430496

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_CHPA_DMAK_EXTENSION_LIMIT_EXCEEDED => -1073430495

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_CHPA_REISSUANCE_LIMIT_NOT_FOUND => -1073430494

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_CHPA_OVERRIDE_REQUEST_NOT_FOUND => -1073430493

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_CHPA_OEM_SLP_COA0 => -1073430506

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_CHPA_PRODUCT_KEY_BLOCKED_IPLOCATION => -1073430505

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_CHPA_RESPONSE_NOT_AVAILABLE => -1073430507

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_CHPA_GENERAL_ERROR => -1073430448

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_CHPA_TIMEBASED_ACTIVATION_BEFORE_START_DATE => -1073430480

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_CHPA_TIMEBASED_ACTIVATION_AFTER_END_DATE => -1073430479

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_CHPA_TIMEBASED_ACTIVATION_NOT_AVAILABLE => -1073430478

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_CHPA_TIMEBASED_PRODUCT_KEY_NOT_CONFIGURED => -1073430477

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_CHPA_NO_RULES_TO_ACTIVATE => -1073430449

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_CHPA_DIGITALMARKER_INVALID_BINDING => -1073430447

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_CHPA_DIGITALMARKER_BINDING_NOT_CONFIGURED => -1073430446

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_CHPA_DYNAMICALLY_BLOCKED_PRODUCT_KEY => -1073430432

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_CHPA_MSCH_RESPONSE_NOT_AVAILABLE_VGA => -1073429505

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_CHPA_BUSINESS_RULE_INPUT_NOT_FOUND => -1073428736

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_CHPA_NULL_VALUE_FOR_PROPERTY_NAME_OR_ID => -1073428656

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_CHPA_UNKNOWN_PROPERTY_NAME => -1073428655

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_CHPA_UNKNOWN_PROPERTY_ID => -1073428654

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_CHPA_FAILED_TO_UPDATE_PRODUCTKEY_BINDING => -1073428651

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_CHPA_FAILED_TO_INSERT_PRODUCTKEY_BINDING => -1073428650

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_CHPA_FAILED_TO_DELETE_PRODUCTKEY_BINDING => -1073428649

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_CHPA_FAILED_TO_PROCESS_PRODUCT_KEY_BINDINGS_XML => -1073428648

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_CHPA_FAILED_TO_INSERT_PRODUCT_KEY_PROPERTY => -1073428646

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_CHPA_FAILED_TO_UPDATE_PRODUCT_KEY_PROPERTY => -1073428645

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_CHPA_FAILED_TO_DELETE_PRODUCT_KEY_PROPERTY => -1073428644

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_CHPA_UNKNOWN_PRODUCT_KEY_TYPE => -1073428636

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_CHPA_PRODUCT_KEY_BEING_USED => -1073428624

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_CHPA_FAILED_TO_INSERT_PRODUCT_KEY_RECORD => -1073428608

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_CHPA_FAILED_TO_UPDATE_PRODUCT_KEY_RECORD => -1073428607

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_INVALID_LICENSE_STATE_BREACH_GRACE => -1073429871

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_INVALID_LICENSE_STATE_BREACH_GRACE_EXPIRED => -1073429870

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_INVALID_TEMPLATE_ID => -1073429770

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_INVALID_XML_BLOB => -1073429766

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_VALIDATION_BLOB_PARAM_NOT_FOUND => -1073429721

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_INVALID_CLIENT_TOKEN => -1073429720

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_INVALID_OFFLINE_BLOB => -1073429719

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_OFFLINE_VALIDATION_BLOB_PARAM_NOT_FOUND => -1073429718

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_INVALID_OSVERSION_TEMPLATEID => -1073429717

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_OFFLINE_GENUINE_BLOB_REVOKED => -1073429716

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_OFFLINE_GENUINE_BLOB_NOT_FOUND => -1073429715

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_INVALID_OS_FOR_PRODUCT_KEY => -1073429503

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_INVALID_FILE_HASH => -1073429343

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_VALIDATION_BLOCKED_PRODUCT_KEY => -1073429342

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_MISMATCHED_KEY_TYPES => -1073429340

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_VALIDATION_INVALID_PRODUCT_KEY => -1073429339

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_INVALID_OEM_OR_VOLUME_BINDING_DATA => -1073429337

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_INVALID_LICENSE_STATE => -1073429336

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_IP_LOCATION_FALIED => -1073429335

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_SOFTMOD_EXPLOIT_DETECTED => -1073429333

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_INVALID_TOKEN_DATA => -1073429332

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_HEALTH_CHECK_FAILED_NEUTRAL_FILES => -1073429331

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_HEALTH_CHECK_FAILED_MUI_FILES => -1073429330

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_INVALID_AD_DATA => -1073429329

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_INVALID_RSDP_COUNT => -1073429328

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_ENGINE_DETECTED_EXPLOIT => -1073429327

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_NON_GENUINE_STATUS_LAST => -1073428992

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_NOTIFICATION_BREACH_DETECTED => -1073429199

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_NOTIFICATION_GRACE_EXPIRED => -1073429198

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_NOTIFICATION_OTHER_REASONS => -1073429197

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_INVALID_CONTEXT => -1073422335

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_TOKEN_STORE_INVALID_STATE => -1073422334

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_EVALUATION_FAILED => -1073422333

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_NOT_EVALUATED => -1073422332

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_NOT_ACTIVATED => -1073422331

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_INVALID_GUID => -1073422330

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_TOKSTO_TOKEN_NOT_FOUND => -1073422329

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_TOKSTO_NO_PROPERTIES => -1073422328

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_TOKSTO_NOT_INITIALIZED => -1073422327

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_TOKSTO_ALREADY_INITIALIZED => -1073422326

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_TOKSTO_NO_ID_SET => -1073422325

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_TOKSTO_CANT_CREATE_FILE => -1073422324

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_TOKSTO_CANT_WRITE_TO_FILE => -1073422323

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_TOKSTO_CANT_READ_FILE => -1073422322

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_TOKSTO_CANT_PARSE_PROPERTIES => -1073422321

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_TOKSTO_PROPERTY_NOT_FOUND => -1073422320

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_TOKSTO_INVALID_FILE => -1073422319

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_TOKSTO_CANT_CREATE_MUTEX => -1073422318

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_TOKSTO_CANT_ACQUIRE_MUTEX => -1073422317

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_TOKSTO_NO_TOKEN_DATA => -1073422316

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_EUL_CONSUMPTION_FAILED => -1073422315

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_PKEY_INVALID_CONFIG => -1073422314

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_PKEY_INVALID_UNIQUEID => -1073422313

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_PKEY_INVALID_ALGORITHM => -1073422312

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_PKEY_INTERNAL_ERROR => -1073422311

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_LICENSE_INVALID_ADDON_INFO => -1073422310

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_HWID_ERROR => -1073422309

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_PKEY_INVALID_KEYCHANGE1 => -1073422308

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_PKEY_INVALID_KEYCHANGE2 => -1073422307

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_PKEY_INVALID_KEYCHANGE3 => -1073422306

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_POLICY_OTHERINFO_MISMATCH => -1073422304

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_PRODUCT_UNIQUENESS_GROUP_ID_INVALID => -1073422303

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_SECURE_STORE_ID_MISMATCH => -1073422302

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_INVALID_RULESET_RULE => -1073422301

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_INVALID_CONTEXT_DATA => -1073422300

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_INVALID_HASH => -1073422299

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_INVALID_USE_OF_ADD_ON_PKEY => -2147164122

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_WINDOWS_VERSION_MISMATCH => -1073422297

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_ACTIVATION_IN_PROGRESS => -1073422296

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_STORE_UPGRADE_TOKEN_REQUIRED => -1073422295

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_STORE_UPGRADE_TOKEN_WRONG_EDITION => -1073422294

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_STORE_UPGRADE_TOKEN_WRONG_PID => -1073422293

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_STORE_UPGRADE_TOKEN_NOT_PRS_SIGNED => -1073422292

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_STORE_UPGRADE_TOKEN_WRONG_VERSION => -1073422291

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_STORE_UPGRADE_TOKEN_NOT_AUTHORIZED => -1073422290

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_SFS_INVALID_FS_VERSION => -2147163903

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_SFS_INVALID_FD_TABLE => -2147163902

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_SFS_INVALID_SYNC => -2147163901

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_SFS_BAD_TOKEN_NAME => -2147163900

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_SFS_BAD_TOKEN_EXT => -2147163899

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_SFS_DUPLICATE_TOKEN_NAME => -2147163898

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_SFS_TOKEN_SIZE_MISMATCH => -2147163897

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_SFS_INVALID_TOKEN_DATA_HASH => -2147163896

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_SFS_FILE_READ_ERROR => -2147163895

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_SFS_FILE_WRITE_ERROR => -2147163894

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_SFS_INVALID_FILE_POSITION => -2147163893

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_SFS_NO_ACTIVE_TRANSACTION => -2147163892

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_SFS_INVALID_FS_HEADER => -2147163891

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_SFS_INVALID_TOKEN_DESCRIPTOR => -2147163890

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_INTERNAL_ERROR => -1073418239

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_RIGHT_NOT_CONSUMED => -1073418238

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_USE_LICENSE_NOT_INSTALLED => -1073418237

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_MISMATCHED_PKEY_RANGE => -1073418236

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_MISMATCHED_PID => -1073418235

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_EXTERNAL_SIGNATURE_NOT_FOUND => -1073418234

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_RAC_NOT_AVAILABLE => -1073418233

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_SPC_NOT_AVAILABLE => -1073418232

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_GRACE_TIME_EXPIRED => -1073418231

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_MISMATCHED_APPID => -1073418230

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_NO_PID_CONFIG_DATA => -1073418229

    /**
     * @type {Integer (Int32)}
     */
    static SL_I_OOB_GRACE_PERIOD => 1074065420

    /**
     * @type {Integer (Int32)}
     */
    static SL_I_OOT_GRACE_PERIOD => 1074065421

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_MISMATCHED_SECURITY_PROCESSOR => -1073418226

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_OUT_OF_TOLERANCE => -1073418225

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_INVALID_PKEY => -1073418224

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_LICENSE_FILE_NOT_INSTALLED => -1073418223

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_VALUE_NOT_FOUND => -1073418222

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_RIGHT_NOT_GRANTED => -1073418221

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_PKEY_NOT_INSTALLED => -1073418220

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_PRODUCT_SKU_NOT_INSTALLED => -1073418219

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_NOT_SUPPORTED => -1073418218

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_PUBLISHING_LICENSE_NOT_INSTALLED => -1073418217

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_LICENSE_SERVER_URL_NOT_FOUND => -1073418216

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_INVALID_EVENT_ID => -1073418215

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_EVENT_NOT_REGISTERED => -1073418214

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_EVENT_ALREADY_REGISTERED => -1073418213

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_DECRYPTION_LICENSES_NOT_AVAILABLE => -1073418212

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_LICENSE_SIGNATURE_VERIFICATION_FAILED => -1073418211

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_DATATYPE_MISMATCHED => -1073418210

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_INVALID_LICENSE => -1073418209

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_INVALID_PACKAGE => -1073418208

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_VALIDITY_TIME_EXPIRED => -1073418207

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_LICENSE_AUTHORIZATION_FAILED => -1073418206

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_LICENSE_DECRYPTION_FAILED => -1073418205

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_WINDOWS_INVALID_LICENSE_STATE => -1073418204

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_LUA_ACCESSDENIED => -1073418203

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_PROXY_KEY_NOT_FOUND => -1073418202

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_TAMPER_DETECTED => -1073418201

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_POLICY_CACHE_INVALID => -1073418200

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_INVALID_RUNNING_MODE => -1073418199

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_SLP_NOT_SIGNED => -1073418198

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_CIDIID_INVALID_DATA => -1073418196

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_CIDIID_INVALID_VERSION => -1073418195

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_CIDIID_VERSION_NOT_SUPPORTED => -1073418194

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_CIDIID_INVALID_DATA_LENGTH => -1073418193

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_CIDIID_NOT_DEPOSITED => -1073418192

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_CIDIID_MISMATCHED => -1073418191

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_INVALID_BINDING_BLOB => -1073418190

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_PRODUCT_KEY_INSTALLATION_NOT_ALLOWED => -1073418189

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_EUL_NOT_AVAILABLE => -1073418188

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_VL_NOT_WINDOWS_SLP => -1073418187

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_VL_NOT_ENOUGH_COUNT => -1073418184

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_VL_BINDING_SERVICE_NOT_ENABLED => -1073418183

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_VL_INFO_PRODUCT_USER_RIGHT => 1074065472

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_VL_KEY_MANAGEMENT_SERVICE_NOT_ACTIVATED => -1073418175

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_VL_KEY_MANAGEMENT_SERVICE_ID_MISMATCH => -1073418174

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_PROXY_POLICY_NOT_UPDATED => -1073418169

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_CIDIID_INVALID_CHECK_DIGITS => -1073418163

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_LICENSE_MANAGEMENT_DATA_NOT_FOUND => -1073418161

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_INVALID_PRODUCT_KEY => -1073418160

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_BLOCKED_PRODUCT_KEY => -1073418159

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_DUPLICATE_POLICY => -1073418158

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_MISSING_OVERRIDE_ONLY_ATTRIBUTE => -1073418157

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_LICENSE_MANAGEMENT_DATA_DUPLICATED => -1073418156

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_BASE_SKU_NOT_AVAILABLE => -1073418155

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_VL_MACHINE_NOT_BOUND => -1073418154

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_SLP_MISSING_ACPI_SLIC => -1073418153

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_SLP_MISSING_SLP_MARKER => -1073418152

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_SLP_BAD_FORMAT => -1073418151

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_INVALID_PACKAGE_VERSION => -1073418144

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_PKEY_INVALID_UPGRADE => -1073418143

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_ISSUANCE_LICENSE_NOT_INSTALLED => -1073418142

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_SLP_OEM_CERT_MISSING => -1073418141

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_NONGENUINE_GRACE_TIME_EXPIRED => -1073418140

    /**
     * @type {Integer (Int32)}
     */
    static SL_I_NONGENUINE_GRACE_PERIOD => 1074065509

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_DEPENDENT_PROPERTY_NOT_SET => -1073418138

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_NONGENUINE_GRACE_TIME_EXPIRED_2 => -1073418137

    /**
     * @type {Integer (Int32)}
     */
    static SL_I_NONGENUINE_GRACE_PERIOD_2 => 1074065512

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_MISMATCHED_PRODUCT_SKU => -1073418135

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_OPERATION_NOT_ALLOWED => -1073418134

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_VL_KEY_MANAGEMENT_SERVICE_VM_NOT_SUPPORTED => -1073418133

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_VL_INVALID_TIMESTAMP => -1073418132

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_PLUGIN_INVALID_MANIFEST => -1073418127

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_APPLICATION_POLICIES_MISSING => -1073418126

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_APPLICATION_POLICIES_NOT_LOADED => -1073418125

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_VL_BINDING_SERVICE_UNAVAILABLE => -1073418124

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_SERVICE_STOPPING => -1073418123

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_PLUGIN_NOT_REGISTERED => -1073418122

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_AUTHN_WRONG_VERSION => -1073418121

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_AUTHN_MISMATCHED_KEY => -1073418120

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_AUTHN_CHALLENGE_NOT_SET => -1073418119

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_AUTHN_CANT_VERIFY => -1073418118

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_SERVICE_RUNNING => -1073418117

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_SLP_INVALID_MARKER_VERSION => -1073418116

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_INVALID_PRODUCT_KEY_TYPE => -1073418115

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_CIDIID_MISMATCHED_PKEY => -1073418114

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_CIDIID_NOT_BOUND => -1073418113

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_LICENSE_NOT_BOUND => -1073418112

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_VL_AD_AO_NOT_FOUND => -1073418111

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_VL_AD_AO_NAME_TOO_LONG => -1073418110

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_VL_AD_SCHEMA_VERSION_NOT_SUPPORTED => -1073418109

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_SLP_MSOA_BAD_FORMAT => -1073418096

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_SLP_MSOA_BAD_DATA_HEADER => -1073418095

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_SLP_MSOA_INVALID_DATA_LENGTH => -1073418094

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_SLP_MSOA_INVALID_PRODUCT_KEY => -1073418093

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_INCOMPLETE_OR_OLD_DISM_BINARIES => -1073418092

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_SLP_MSOA_PRODUCT_KEY_MISMATCH => -1073418091

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_NOT_GENUINE => -1073417728

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_EDITION_MISMATCHED => -1073417712

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_HWID_CHANGED => -1073417711

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_OEM_KEY_EDITION_MISMATCH => -1073417710

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_NO_PRODUCT_KEY_FOUND => -1073417709

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_DOWNLEVEL_SETUP_KEY => -1073417708

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_BIOS_KEY => -1073417707

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_TKA_CHALLENGE_EXPIRED => -1073417471

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_TKA_SILENT_ACTIVATION_FAILURE => -1073417470

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_TKA_INVALID_CERT_CHAIN => -1073417469

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_TKA_GRANT_NOT_FOUND => -1073417468

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_TKA_CERT_NOT_FOUND => -1073417467

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_TKA_INVALID_SKU_ID => -1073417466

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_TKA_INVALID_BLOB => -1073417465

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_TKA_TAMPERED_CERT_CHAIN => -1073417464

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_TKA_CHALLENGE_MISMATCH => -1073417463

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_TKA_INVALID_CERTIFICATE => -1073417462

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_TKA_INVALID_SMARTCARD => -1073417461

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_TKA_FAILED_GRANT_PARSING => -1073417460

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_TKA_INVALID_THUMBPRINT => -1073417459

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_TKA_THUMBPRINT_CERT_NOT_FOUND => -1073417458

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_TKA_CRITERIA_MISMATCH => -1073417457

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_TKA_TPID_MISMATCH => -1073417456

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_TKA_SOFT_CERT_DISALLOWED => -1073417455

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_TKA_SOFT_CERT_INVALID => -1073417454

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_TKA_CERT_CNG_NOT_AVAILABLE => -1073417453

    /**
     * @type {Integer (Int32)}
     */
    static SL_I_STORE_BASED_ACTIVATION => 1074066433

    /**
     * @type {Integer (Int32)}
     */
    static E_RM_UNKNOWN_ERROR => -1073415165

    /**
     * @type {Integer (Int32)}
     */
    static SL_I_TIMEBASED_VALIDITY_PERIOD => 1074068484

    /**
     * @type {Integer (Int32)}
     */
    static SL_I_PERPETUAL_OOB_GRACE_PERIOD => 1074068485

    /**
     * @type {Integer (Int32)}
     */
    static SL_I_TIMEBASED_EXTENDED_GRACE_PERIOD => 1074068486

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_VALIDITY_PERIOD_EXPIRED => -1073415161

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_IA_THROTTLE_LIMIT_EXCEEDED => -1073414912

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_IA_INVALID_VIRTUALIZATION_PLATFORM => -1073414911

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_IA_PARENT_PARTITION_NOT_ACTIVATED => -1073414910

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_IA_ID_MISMATCH => -1073414909

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_IA_MACHINE_NOT_BOUND => -1073414908

    /**
     * @type {Integer (Int32)}
     */
    static SL_E_TAMPER_RECOVERY_REQUIRES_ACTIVATION => -1073414656

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_SP_PUB_GENERAL_NOT_INITIALIZED => -1073426175

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_SP_STATUS_SYSTEM_TIME_SKEWED => -2147167998

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_SP_STATUS_GENERIC_FAILURE => -1073426173

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_SP_STATUS_INVALIDARG => -1073426172

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_SP_STATUS_ALREADY_EXISTS => -1073426171

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_SP_STATUS_INSUFFICIENT_BUFFER => -1073426169

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_SP_STATUS_INVALIDDATA => -1073426168

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_SP_STATUS_INVALID_SPAPI_CALL => -1073426167

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_SP_STATUS_INVALID_SPAPI_VERSION => -1073426166

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_SP_STATUS_DEBUGGER_DETECTED => -2147167989

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_SP_STATUS_NO_MORE_DATA => -1073426164

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_SP_PUB_CRYPTO_INVALID_KEYLENGTH => -1073425919

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_SP_PUB_CRYPTO_INVALID_BLOCKLENGTH => -1073425918

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_SP_PUB_CRYPTO_INVALID_CIPHER => -1073425917

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_SP_PUB_CRYPTO_INVALID_CIPHERMODE => -1073425916

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_SP_PUB_CRYPTO_UNKNOWN_PROVIDERID => -1073425915

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_SP_PUB_CRYPTO_UNKNOWN_KEYID => -1073425914

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_SP_PUB_CRYPTO_UNKNOWN_HASHID => -1073425913

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_SP_PUB_CRYPTO_UNKNOWN_ATTRIBUTEID => -1073425912

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_SP_PUB_CRYPTO_HASH_FINALIZED => -1073425911

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_SP_PUB_CRYPTO_KEY_NOT_AVAILABLE => -1073425910

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_SP_PUB_CRYPTO_KEY_NOT_FOUND => -1073425909

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_SP_PUB_CRYPTO_NOT_BLOCK_ALIGNED => -1073425908

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_SP_PUB_CRYPTO_INVALID_SIGNATURELENGTH => -1073425907

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_SP_PUB_CRYPTO_INVALID_SIGNATURE => -1073425906

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_SP_PUB_CRYPTO_INVALID_BLOCK => -1073425905

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_SP_PUB_CRYPTO_INVALID_FORMAT => -1073425904

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_SP_PUB_CRYPTO_INVALID_PADDING => -1073425903

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_SP_PUB_TS_TAMPERED => -1073425663

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_SP_PUB_TS_REARMED => -1073425662

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_SP_PUB_TS_RECREATED => -1073425661

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_SP_PUB_TS_ENTRY_KEY_NOT_FOUND => -1073425660

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_SP_PUB_TS_ENTRY_KEY_ALREADY_EXISTS => -1073425659

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_SP_PUB_TS_ENTRY_KEY_SIZE_TOO_BIG => -1073425658

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_SP_PUB_TS_MAX_REARM_REACHED => -1073425657

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_SP_PUB_TS_DATA_SIZE_TOO_BIG => -1073425656

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_SP_PUB_TS_INVALID_HW_BINDING => -1073425655

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_SP_PUB_TIMER_ALREADY_EXISTS => -1073425654

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_SP_PUB_TIMER_NOT_FOUND => -1073425653

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_SP_PUB_TIMER_EXPIRED => -1073425652

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_SP_PUB_TIMER_NAME_SIZE_TOO_BIG => -1073425651

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_SP_PUB_TS_FULL => -1073425650

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_SP_PUB_TRUSTED_TIME_OK => 1074057999

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_SP_PUB_TS_ENTRY_READ_ONLY => -1073425648

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_SP_PUB_TIMER_READ_ONLY => -1073425647

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_SP_PUB_TS_ATTRIBUTE_READ_ONLY => -1073425646

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_SP_PUB_TS_ATTRIBUTE_NOT_FOUND => -1073425645

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_SP_PUB_TS_ACCESS_DENIED => -1073425644

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_SP_PUB_TS_NAMESPACE_NOT_FOUND => -1073425643

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_SP_PUB_TS_NAMESPACE_IN_USE => -1073425642

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_SP_PUB_TS_TAMPERED_BREADCRUMB_LOAD_INVALID => -1073425641

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_SP_PUB_TS_TAMPERED_BREADCRUMB_GENERATION => -1073425640

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_SP_PUB_TS_TAMPERED_INVALID_DATA => -1073425639

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_SP_PUB_TS_TAMPERED_NO_DATA => -1073425638

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_SP_PUB_TS_TAMPERED_DATA_BREADCRUMB_MISMATCH => -1073425637

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_SP_PUB_TS_TAMPERED_DATA_VERSION_MISMATCH => -1073425636

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_SP_PUB_TAMPER_MODULE_AUTHENTICATION => -1073425407

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_SP_PUB_TAMPER_SECURITY_PROCESSOR_PATCHED => -1073425406

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_SP_PUB_KM_CACHE_TAMPER => -1073425151

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_SP_PUB_KM_CACHE_TAMPER_RESTORE_FAILED => -1073425150

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_SP_PUB_KM_CACHE_IDENTICAL => 1074058753

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_SP_PUB_KM_CACHE_POLICY_CHANGED => 1074058754

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_SP_STATUS_PUSHKEY_CONFLICT => -1073424639

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_SP_PUB_PROXY_SOFT_TAMPER => -1073424638

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_SP_PUB_API_INVALID_LICENSE => -1073426432

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_SP_PUB_API_INVALID_ALGORITHM_TYPE => -1073426423

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_SP_PUB_API_TOO_MANY_LOADED_ENVIRONMENTS => -1073426420

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_SP_PUB_API_BAD_GET_INFO_QUERY => -1073426414

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_SP_PUB_API_INVALID_HANDLE => -1073426388

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_SP_PUB_API_INVALID_KEY_LENGTH => -1073426347

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_SP_PUB_API_NO_AES_PROVIDER => -1073426317

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_SP_PUB_API_HANDLE_NOT_COMMITED => -1073426303

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_MDOLLAR_PRODUCT_KEY_OUT_OF_RANGE => -2143313819

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_MDOLLAR_INVALID_BINDING => -2143313818

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_MDOLLAR_PRODUCT_KEY_BLOCKED => -2143313817

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_MDOLLAR_INVALID_PRODUCT_KEY => -2143313816

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_MDOLLAR_UNSUPPORTED_PRODUCT_KEY => -2143313812

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_MDOLLAR_MAXIMUM_UNLOCK_EXCEEDED => -2143313807

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_MDOLLAR_INVALID_PRODUCT_DATA_ID => -2143313805

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_MDOLLAR_INVALID_PRODUCT_DATA => -2143313804

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_MDOLLAR_INVALID_ACTCONFIG_ID => -2143313802

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_MDOLLAR_INVALID_PRODUCT_KEY_LENGTH => -2143313801

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_MDOLLAR_INVALID_PRODUCT_KEY_FORMAT => -2143313800

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_MDOLLAR_INVALID_BINDING_URI => -2143313798

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_MDOLLAR_INVALID_ARGUMENT => -2143313795

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_MDOLLAR_DMAK_LIMIT_EXCEEDED => -2143313793

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_MDOLLAR_DMAK_EXTENSION_LIMIT_EXCEEDED => -2143313792

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_MDOLLAR_OEM_SLP_COA0 => -2143313789

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_MDOLLAR_CIDIID_INVALID_VERSION => -2143313779

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_MDOLLAR_CIDIID_INVALID_DATA => -2143313778

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_MDOLLAR_CIDIID_INVALID_DATA_LENGTH => -2143313777

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_MDOLLAR_CIDIID_INVALID_CHECK_DIGITS => -2143313776

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_MDOLLAR_TIMEBASED_ACTIVATION_BEFORE_START_DATE => -2143313769

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_MDOLLAR_TIMEBASED_ACTIVATION_AFTER_END_DATE => -2143313768

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_MDOLLAR_TIMEBASED_ACTIVATION_NOT_AVAILABLE => -2143313767

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_MDOLLAR_TIMEBASED_PRODUCT_KEY_NOT_CONFIGURED => -2143313766

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_MDOLLAR_NO_RULES_TO_ACTIVATE => -2143313720

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_MDOLLAR_PRODUCT_KEY_BLOCKED_IPLOCATION => -2143313717

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_MDOLLAR_DIGITALMARKER_INVALID_BINDING => -2143313709

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_MDOLLAR_DIGITALMARKER_BINDING_NOT_CONFIGURED => -2143313708

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_MDOLLAR_ROT_OVERRIDE_LIMIT_REACHED => -2143313707

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_MDOLLAR_DMAK_OVERRIDE_LIMIT_REACHED => -2143313706

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_MDOLLAR_FREE_OFFER_EXPIRED => -2143312896

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_MDOLLAR_OSR_DONOR_HWID_NO_ENTITLEMENT => -2143310920

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_MDOLLAR_OSR_GENERIC_ERROR => -2143310919

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_MDOLLAR_OSR_NO_ASSOCIATION => -2143310918

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_MDOLLAR_OSR_NOT_ADMIN => -2143310917

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_MDOLLAR_OSR_USER_THROTTLED => -2143310916

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_MDOLLAR_OSR_LICENSE_THROTTLED => -2143310915

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_MDOLLAR_OSR_DEVICE_THROTTLED => -2143310914

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_MDOLLAR_OSR_GP_DISABLED => -2143310913

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_MDOLLAR_OSR_HARDWARE_BLOCKED => -2143310912

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_MDOLLAR_OSR_USER_BLOCKED => -2143310911

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_MDOLLAR_OSR_LICENSE_BLOCKED => -2143310910

    /**
     * @type {Integer (Int32)}
     */
    static SL_REMAPPING_MDOLLAR_OSR_DEVICE_BLOCKED => -2143310909

    /**
     * @type {Guid}
     */
    static WINDOWS_SLID => Guid("{55c92734-d682-4d71-983e-d6ec3f16059f}")

    /**
     * @type {String}
     */
    static WDIGEST_SP_NAME_A => "WDigest"

    /**
     * @type {String}
     */
    static WDIGEST_SP_NAME_W => "WDigest"

    /**
     * @type {String}
     */
    static WDIGEST_SP_NAME => "WDigest"
;@endregion Constants

;@region Methods
    /**
     * Generates a pseudo-random number.
     * @param {Pointer} RandomBuffer A pointer to a buffer that receives the random number as binary data. The size of this buffer is specified by the <i>RandomBufferLength</i> parameter.
     * @param {Integer} RandomBufferLength The length, in bytes, of the <i>RandomBuffer</i> buffer.
     * @returns {BOOLEAN} If the function succeeds, the function returns <b>TRUE</b>.
     * 
     * If the function fails, it returns <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/nf-ntsecapi-rtlgenrandom
     */
    static RtlGenRandom(RandomBuffer, RandomBufferLength) {
        result := DllCall("ADVAPI32.dll\SystemFunction036", "ptr", RandomBuffer, "uint", RandomBufferLength, "char")
        return result
    }

    /**
     * Encrypts memory contents.
     * @param {Pointer} Memory A pointer to the memory to encrypt. The size of the memory must be a multiple of the RTL_ENCRYPT_MEMORY_SIZE constant.
     * @param {Integer} MemorySize Number of bytes to which <i>Memory</i> points. The number of bytes must be a multiple of the RTL_ENCRYPT_MEMORY_SIZE constant.
     * @param {Integer} OptionFlags 
     * @returns {NTSTATUS} If the function is successful, the return value is STATUS_SUCCESS.
     * 
     * If the function fails, the return value is an <b>NTSTATUS</b> code that indicates the error.
     * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/nf-ntsecapi-rtlencryptmemory
     */
    static RtlEncryptMemory(Memory, MemorySize, OptionFlags) {
        result := DllCall("ADVAPI32.dll\SystemFunction040", "ptr", Memory, "uint", MemorySize, "uint", OptionFlags, "int")
        return result
    }

    /**
     * Decrypts memory contents previously encrypted by the RtlEncryptMemory function.
     * @param {Pointer} Memory A pointer to the memory to encrypt. The size of the memory must be a multiple of the RTL_ENCRYPT_MEMORY_SIZE constant.
     * @param {Integer} MemorySize Number of bytes to which <i>Memory</i> points. The number of bytes must be a multiple of the RTL_ENCRYPT_MEMORY_SIZE constant.
     * @param {Integer} OptionFlags 
     * @returns {NTSTATUS} If the function is successful, the return value is STATUS_SUCCESS.
     * 
     * If the function fails, the return value is an <b>NTSTATUS</b> code that indicates the error.
     * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/nf-ntsecapi-rtldecryptmemory
     */
    static RtlDecryptMemory(Memory, MemorySize, OptionFlags) {
        result := DllCall("ADVAPI32.dll\SystemFunction041", "ptr", Memory, "uint", MemorySize, "uint", OptionFlags, "int")
        return result
    }

    /**
     * Establishes a connection to the LSA server and verifies that the caller is a logon application.
     * @param {Pointer<LSA_STRING>} LogonProcessName Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_string">LSA_STRING</a> structure identifying the logon application. This should be a printable name suitable for display to administrators. For example, the Windows logon application might use the name "User32LogonProcess". This name is used by the LSA during auditing. <b>LsaRegisterLogonProcess</b> does not check whether the name is already in use. 
     * 
     * 
     * 
     * 
     * This string must not exceed 127 bytes.
     * @param {Pointer<HANDLE>} LsaHandle Pointer that receives a handle used in future authentication function calls.
     * @param {Pointer<Integer>} SecurityMode The value returned is not meaningful and should be ignored.
     * @returns {NTSTATUS} If the function succeeds, the return value is STATUS_SUCCESS.
     * 
     * If the function fails, the return value is an NTSTATUS code. The following are possible error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_PORT_CONNECTION_REFUSED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have the SeTcbPrivilege privilege, which is required to call this function. 
     * 
     * 
     * 
     * 
     * You can set this privilege by calling 
     * <a href="/windows/desktop/api/ntsecapi/nf-ntsecapi-lsaaddaccountrights">LsaAddAccountRights</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_NAME_TOO_LONG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified logon process name exceeds 127 bytes.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * For more information, see 
     * <a href="/windows/desktop/SecMgmt/management-return-values">LSA Policy Function Return Values</a>.
     * 
     * The 
     * <a href="/windows/desktop/api/ntsecapi/nf-ntsecapi-lsantstatustowinerror">LsaNtStatusToWinError</a> function converts an NTSTATUS code to a Windows error code.
     * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/nf-ntsecapi-lsaregisterlogonprocess
     * @since windows5.1.2600
     */
    static LsaRegisterLogonProcess(LogonProcessName, LsaHandle, SecurityMode) {
        SecurityModeMarshal := SecurityMode is VarRef ? "uint*" : "ptr"

        result := DllCall("SECUR32.dll\LsaRegisterLogonProcess", "ptr", LogonProcessName, "ptr", LsaHandle, SecurityModeMarshal, SecurityMode, "int")
        return result
    }

    /**
     * Authenticates a security principal's logon data by using stored credentials information.
     * @param {HANDLE} LsaHandle A handle obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsaregisterlogonprocess">LsaRegisterLogonProcess</a>.
     * 
     * The caller is required to have <b>SeTcbPrivilege</b> only if one or more of the following is true:
     * 
     * <ul>
     * <li>A Subauthentication package is used.</li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-kerb_s4u_logon">KERB_S4U_LOGON</a> is used, and the caller requests an impersonation token.</li>
     * <li>The <i>LocalGroups</i> parameter is not <b>NULL</b>.</li>
     * </ul>
     *  If <b>SeTcbPrivilege</b> is not required, call <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsaconnectuntrusted">LsaConnectUntrusted</a> to obtain the handle.
     * @param {Pointer<LSA_STRING>} OriginName A string that identifies the origin of the logon attempt. For more information, see Remarks.
     * @param {Integer} LogonType A 
     * value of the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ne-ntsecapi-security_logon_type">SECURITY_LOGON_TYPE</a> enumeration that specifies the type of logon requested. If <i>LogonType</i> is Interactive or Batch, a primary token is generated to represent the new user. If <i>LogonType</i> is Network, an impersonation token is generated.
     * @param {Integer} AuthenticationPackage An identifier of the authentication package to use for the authentication. You can obtain this value by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsalookupauthenticationpackage">LsaLookupAuthenticationPackage</a>.
     * @param {Pointer} AuthenticationInformation A pointer to an input buffer that contains authentication information, such as user name and password. The format and content of this buffer are determined by the authentication package.
     * 
     * This parameter can be one of the following input buffer structures for the MSV1_0 and Kerberos authentication packages.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MSV1_0_INTERACTIVE_LOGON"></a><a id="msv1_0_interactive_logon"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-msv1_0_interactive_logon">MSV1_0_INTERACTIVE_LOGON</a></b></dt>
     * <dt>MSV1_0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Authenticating an interactive user logon.
     * 
     * The <b>LogonDomainName</b>,  <b>UserName</b>, and <b>Password </b> members of the <a href="https://docs.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-msv1_0_interactive_logon">MSV1_0_INTERACTIVE_LOGON</a> structure must point to buffers in memory that are contiguous to the structure itself. The value of the <i>AuthenticationInformationLength</i> parameter must take into account the length of these buffers.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="KERB_INTERACTIVE_LOGON"></a><a id="kerb_interactive_logon"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-kerb_interactive_logon">KERB_INTERACTIVE_LOGON</a></b></dt>
     * <dt>Kerberos</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Authenticating an interactive user logon.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="KERB_TICKET_LOGON"></a><a id="kerb_ticket_logon"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-kerb_ticket_logon">KERB_TICKET_LOGON</a></b></dt>
     * <dt>Kerberos</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Authenticating a user on initial network logon or disconnect.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="KERB_TICKET_UNLOCK_LOGON"></a><a id="kerb_ticket_unlock_logon"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-kerb_ticket_unlock_logon">KERB_TICKET_UNLOCK_LOGON</a></b></dt>
     * <dt>Kerberos</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Authenticating a user on ticket refresh, a variation of the normal workstation unlock logon.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="KERB_CERTIFICATE_LOGON"></a><a id="kerb_certificate_logon"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-kerb_certificate_logon">KERB_CERTIFICATE_LOGON</a></b></dt>
     * <dt>Kerberos</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Authenticating a user using an interactive smart card logon.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="KERB_CERTIFICATE_S4U_LOGON"></a><a id="kerb_certificate_s4u_logon"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-kerb_certificate_s4u_logon">KERB_CERTIFICATE_S4U_LOGON</a></b></dt>
     * <dt>Kerberos</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Authenticating a user using a service for user (S4U) logon.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="KERB_CERTIFICATE_UNLOCK_LOGON"></a><a id="kerb_certificate_unlock_logon"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-kerb_certificate_unlock_logon">KERB_CERTIFICATE_UNLOCK_LOGON</a></b></dt>
     * <dt>Kerberos</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Authenticating a user to unlock a workstation that has been locked during an interactive smart card logon session.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="KERB_SMARTCARD_LOGON"></a><a id="kerb_smartcard_logon"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-kerb_smart_card_logon">KERB_SMARTCARD_LOGON</a></b></dt>
     * <dt>Kerberos</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Authenticating a user smart card logon using LOGON32_PROVIDER_WINNT50 or LOGON32_PROVIDER_DEFAULT.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="KERB_SMARTCARD_UNLOCK_LOGON"></a><a id="kerb_smartcard_unlock_logon"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-kerb_smart_card_unlock_logon">KERB_SMARTCARD_UNLOCK_LOGON</a></b></dt>
     * <dt>Kerberos</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Authenticating a user to unlock a workstation that has been locked during a smart card logon session.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="KERB_S4U_LOGON"></a><a id="kerb_s4u_logon"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-kerb_s4u_logon">KERB_S4U_LOGON</a></b></dt>
     * <dt>Kerberos</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Authenticating a user using S4U client requests. For <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">constrained delegation</a>, a call to LsaLogonUser is not necessary if the client logged on using an LSA-mode authentication package. On Windows operating systems, these include <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/microsoft-kerberos">Kerberos</a>, <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/microsoft-ntlm">NTLM</a>, <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/secure-channel">Secure Channel</a>, and <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/microsoft-digest-ssp">Digest</a>. For this call to succeed, the following must be true:
     * 
     * <ul>
     * <li>The caller must be a domain account (this includes LOCAL_SYSTEM if the computer is a domain member).</li>
     * <li>If using a service account, the account must have <b>SeTcbPrivilege</b> set on the local computer to get an impersonation token. Otherwise, the identity token is used.</li>
     * <li>The caller must be a member of the <b>Pre-Windows 2000 Compatible Access</b> or have read access to the group memberships of the client. Membership in the Windows Authorization Access group guarantees read access to group membership of the client. For information about how to configure the Windows Authorization Access group, see the Microsoft Knowledge Base.</li>
     * </ul>
     * The <b>ClientUpn</b> and <b>ClientRealm</b> members of the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-kerb_s4u_logon">KERB_S4U_LOGON</a> structure must point to buffers in memory that are contiguous to the structure itself. The value of the <i>AuthenticationInformationLength</i> parameter must take into account the length of these buffers.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MSV1_0_LM20_LOGON"></a><a id="msv1_0_lm20_logon"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-msv1_0_lm20_logon">MSV1_0_LM20_LOGON</a></b></dt>
     * <dt>MSV1_0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Processing the second half of an NTLM 2.0 protocol logon. The first half of this type of logon is performed by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsacallauthenticationpackage">LsaCallAuthenticationPackage</a> with the <b>MsV1_0Lm20ChallengeRequest</b> message. For more information, see the description of <b>MsV1_0Lm20ChallengeRequest</b> in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ne-ntsecapi-msv1_0_protocol_message_type">MSV1_0_PROTOCOL_MESSAGE_TYPE</a>.
     * 
     * This type of logon can use a subauthentication package.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MSV1_0_SUBAUTH_LOGON"></a><a id="msv1_0_subauth_logon"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-msv1_0_subauth_logon">MSV1_0_SUBAUTH_LOGON</a></b></dt>
     * <dt>MSV1_0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Authenticating a user with subauthentication.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * For more information about the buffer used by other authentication packages, see the documentation for those authentication packages.
     * @param {Integer} AuthenticationInformationLength The length, in bytes, of the <i>AuthenticationInformation</i> buffer.
     * @param {Pointer<TOKEN_GROUPS>} LocalGroups A list of additional group identifiers to add to the token of the authenticated user. These group identifiers will be added, along with the default group WORLD and the logon type group (Interactive, Batch, or Network), which are automatically included in every user token.
     * @param {Pointer<TOKEN_SOURCE>} SourceContext A <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_source">TOKEN_SOURCE</a> structure that identifies the source module—for example, the session manager—and the context that may be useful to that module. This information is included in the user token and can be retrieved by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-gettokeninformation">GetTokenInformation</a>.
     * @param {Pointer<Pointer<Void>>} ProfileBuffer A pointer to a void pointer that receives the address of an output buffer that contains authentication information, such as the logon shell and home directory.
     * 
     * This parameter can be one of the following output buffer structures for the MSV1_0 and Kerberos authentication packages.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MSV1_0_INTERACTIVE_PROFILE"></a><a id="msv1_0_interactive_profile"></a><dl>
     * <dt><b>MSV1_0_INTERACTIVE_PROFILE</b></dt>
     * <dt>MSV1_0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An interactive user's logon profile.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="KERB_TICKET_PROFILE"></a><a id="kerb_ticket_profile"></a><dl>
     * <dt><b>KERB_TICKET_PROFILE</b></dt>
     * <dt>Kerberos</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Logon, disconnect, and ticket refresh authentication output.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MSV1_0_LM20_LOGON"></a><a id="msv1_0_lm20_logon"></a><dl>
     * <dt><b>MSV1_0_LM20_LOGON</b></dt>
     * <dt>MSV1_0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Output when processing the second half of a NTLM 2.0 protocol logon.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MSV1_0_LM20_LOGON_PROFILE"></a><a id="msv1_0_lm20_logon_profile"></a><dl>
     * <dt><b>MSV1_0_LM20_LOGON_PROFILE</b></dt>
     * <dt>MSV1_0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Output when using authentication with subauthentication.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * For more information about the buffer used by other authentication packages, see the documentation for that authentication package.
     * 
     * When this buffer is no longer needed, the calling application must free this buffer by calling 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsafreereturnbuffer">LsaFreeReturnBuffer</a> function.
     * @param {Pointer<Integer>} ProfileBufferLength A pointer to a <b>ULONG</b> that receives the length, in bytes, of the returned profile buffer.
     * @param {Pointer<LUID>} LogonId A pointer to a buffer that receives an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-luid">LUID</a> that uniquely identifies the logon session. This <b>LUID</b> is assigned by the domain controller that authenticated the logon information.
     * @param {Pointer<HANDLE>} Token A pointer to a handle that receives the new user token created for this session. When you have finished using the token, release it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a> function.
     * @param {Pointer<QUOTA_LIMITS>} Quotas When a primary token is returned, this parameter receives a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-quota_limits">QUOTA_LIMITS</a> structure that contains the process quota limits assigned to the newly logged on user's initial process.
     * @param {Pointer<Integer>} SubStatus If the logon failed due to account restrictions, this parameter receives information about why the logon failed. This value is set only if the account information of the user is valid and the logon is rejected.
     * 
     * This parameter can be one of the following <i>SubStatus</i> values for the MSV1_0 authentication package.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="STATUS_INVALID_LOGON_HOURS"></a><a id="status_invalid_logon_hours"></a><dl>
     * <dt><b>STATUS_INVALID_LOGON_HOURS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user account has time restrictions and cannot be used to log on at this time.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="STATUS_INVALID_WORKSTATION"></a><a id="status_invalid_workstation"></a><dl>
     * <dt><b>STATUS_INVALID_WORKSTATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user account has workstation restrictions and cannot be used to log on from the current workstation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="STATUS_PASSWORD_EXPIRED"></a><a id="status_password_expired"></a><dl>
     * <dt><b>STATUS_PASSWORD_EXPIRED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user-account password has expired.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="STATUS_ACCOUNT_DISABLED"></a><a id="status_account_disabled"></a><dl>
     * <dt><b>STATUS_ACCOUNT_DISABLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user account is currently disabled and cannot be used to log on.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {NTSTATUS} If the function succeeds, the function returns  STATUS_SUCCESS.
     * 
     * If the function fails, it returns  an <b>NTSTATUS</b> code, which can be one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_QUOTA_EXCEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller's memory quota is insufficient to allocate the output buffer returned by the authentication package.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_ACCOUNT_RESTRICTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user account and password are legitimate, but the user account has a restriction that prevents logon at this time. For more information, see the value stored in the <i>SubStatus</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_BAD_VALIDATION_CLASS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The authentication information provided is not recognized by the authentication package.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_LOGON_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The logon attempt failed. The reason for the failure is not specified, but typical reasons include misspelled user names and misspelled passwords.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_NO_LOGON_SERVERS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No domain controllers are available to service the authentication request.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_NO_SUCH_PACKAGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified authentication package is not recognized by the LSA.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_PKINIT_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Kerberos client received a KDC certificate that is not valid. For device logon, strict KDC validation is required, so the KDC must have certificates that use the "Kerberos Authentication" template or equivalent. Also, the KDC certificate could be expired, revoked, or the client is under active attack of sending requests to the wrong server.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_PKINIT_CLIENT_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Kerberos client is using a system certificate that is not valid. For device logon, there must be a DNS name. Also, the system certificate could be expired or the wrong one could be selected.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * For more information, see 
     * <a href="/windows/desktop/SecMgmt/management-return-values">LSA Policy Function Return Values</a>.
     * 
     * The 
     * <a href="/windows/desktop/api/ntsecapi/nf-ntsecapi-lsantstatustowinerror">LsaNtStatusToWinError</a> function converts an <b>NTSTATUS</b> code to a Windows error code.
     * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/nf-ntsecapi-lsalogonuser
     * @since windows5.1.2600
     */
    static LsaLogonUser(LsaHandle, OriginName, LogonType, AuthenticationPackage, AuthenticationInformation, AuthenticationInformationLength, LocalGroups, SourceContext, ProfileBuffer, ProfileBufferLength, LogonId, Token, Quotas, SubStatus) {
        LsaHandle := LsaHandle is Win32Handle ? NumGet(LsaHandle, "ptr") : LsaHandle

        ProfileBufferMarshal := ProfileBuffer is VarRef ? "ptr*" : "ptr"
        ProfileBufferLengthMarshal := ProfileBufferLength is VarRef ? "uint*" : "ptr"
        SubStatusMarshal := SubStatus is VarRef ? "int*" : "ptr"

        result := DllCall("SECUR32.dll\LsaLogonUser", "ptr", LsaHandle, "ptr", OriginName, "int", LogonType, "uint", AuthenticationPackage, "ptr", AuthenticationInformation, "uint", AuthenticationInformationLength, "ptr", LocalGroups, "ptr", SourceContext, ProfileBufferMarshal, ProfileBuffer, ProfileBufferLengthMarshal, ProfileBufferLength, "ptr", LogonId, "ptr", Token, "ptr", Quotas, SubStatusMarshal, SubStatus, "int")
        return result
    }

    /**
     * Obtains the unique identifier of an authentication package.
     * @param {HANDLE} LsaHandle Handle obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsaregisterlogonprocess">LsaRegisterLogonProcess</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsaconnectuntrusted">LsaConnectUntrusted</a>.
     * @param {Pointer<LSA_STRING>} PackageName Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_string">LSA_STRING</a> structure that specifies the name of the authentication package. The package name must not exceed 127 bytes in length. The following table lists the names of the Microsoft-provided authentication packages.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MSV1_0_PACKAGE_NAME"></a><a id="msv1_0_package_name"></a><dl>
     * <dt><b>MSV1_0_PACKAGE_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * ANSI version of the MSV1_0 authentication package name.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MICROSOFT_KERBEROS_NAME_A"></a><a id="microsoft_kerberos_name_a"></a><dl>
     * <dt><b>MICROSOFT_KERBEROS_NAME_A</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * ANSI version of the Kerberos authentication package name.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NEGOSSP_NAME_A"></a><a id="negossp_name_a"></a><dl>
     * <dt><b>NEGOSSP_NAME_A</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * ANSI version of the Negotiate authentication package name.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} AuthenticationPackage Pointer to a <b>ULONG</b> that receives the authentication package identifier.
     * @returns {NTSTATUS} If the function succeeds, the return value is STATUS_SUCCESS.
     * 
     * If the function fails, the return value is an NTSTATUS code. The following are possible error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_NO_SUCH_PACKAGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified authentication package is unknown to the LSA.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_NAME_TOO_LONG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The authentication package name exceeds 127 bytes.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * For more information, see 
     * <a href="/windows/desktop/SecMgmt/management-return-values">LSA Policy Function Return Values</a>.
     * 
     * The 
     * <a href="/windows/desktop/api/ntsecapi/nf-ntsecapi-lsantstatustowinerror">LsaNtStatusToWinError</a> function converts an NTSTATUS code to a Windows error code.
     * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/nf-ntsecapi-lsalookupauthenticationpackage
     * @since windows5.1.2600
     */
    static LsaLookupAuthenticationPackage(LsaHandle, PackageName, AuthenticationPackage) {
        LsaHandle := LsaHandle is Win32Handle ? NumGet(LsaHandle, "ptr") : LsaHandle

        AuthenticationPackageMarshal := AuthenticationPackage is VarRef ? "uint*" : "ptr"

        result := DllCall("SECUR32.dll\LsaLookupAuthenticationPackage", "ptr", LsaHandle, "ptr", PackageName, AuthenticationPackageMarshal, AuthenticationPackage, "int")
        return result
    }

    /**
     * Frees the memory used by a buffer previously allocated by the LSA.
     * @param {Pointer<Void>} Buffer Pointer to the buffer to be freed.
     * @returns {NTSTATUS} If the function succeeds, the return value is STATUS_SUCCESS.
     * 
     * If the function fails, the return value is an NTSTATUS code. For more information, see 
     * <a href="/windows/desktop/SecMgmt/management-return-values">LSA Policy Function Return Values</a>.
     * 
     * The 
     * <a href="/windows/desktop/api/ntsecapi/nf-ntsecapi-lsantstatustowinerror">LsaNtStatusToWinError</a> function converts an NTSTATUS code to a Windows error code.
     * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/nf-ntsecapi-lsafreereturnbuffer
     * @since windows5.1.2600
     */
    static LsaFreeReturnBuffer(Buffer) {
        BufferMarshal := Buffer is VarRef ? "ptr" : "ptr"

        result := DllCall("SECUR32.dll\LsaFreeReturnBuffer", BufferMarshal, Buffer, "int")
        return result
    }

    /**
     * Used by a logon application to communicate with an authentication package.
     * @param {HANDLE} LsaHandle A handle obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsaregisterlogonprocess">LsaRegisterLogonProcess</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsaconnectuntrusted">LsaConnectUntrusted</a>.
     * @param {Integer} AuthenticationPackage Supplies the identifier of the authentication package. This value is obtained by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsalookupauthenticationpackage">LsaLookupAuthenticationPackage</a>.
     * @param {Pointer} ProtocolSubmitBuffer An authentication package–specific message buffer passed to the authentication package.
     * 
     * For information about the format and content of this buffer, see the documentation for the individual authentication package.
     * @param {Integer} SubmitBufferLength Indicates the length, in bytes, of the <i>ProtocolSubmitBuffer</i> buffer.
     * @param {Pointer<Pointer<Void>>} ProtocolReturnBuffer A pointer that receives the address of the buffer returned by the authentication package.
     * 
     * For information about the format and content of this buffer, see the documentation for the individual authentication package.
     * 
     * This buffer is allocated by this function. When you have finished using this buffer, free the memory by calling the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsafreereturnbuffer">LsaFreeReturnBuffer</a> function.
     * @param {Pointer<Integer>} ReturnBufferLength A pointer to a <b>ULONG</b> that receives the length of the returned buffer, in bytes.
     * @param {Pointer<Integer>} ProtocolStatus If the function succeeds, this parameter receives a pointer to an <b>NTSTATUS</b> code that indicates the completion status of the authentication package.
     * @returns {NTSTATUS} If the function succeeds, the return value is STATUS_SUCCESS. Check the <i>ProtocolStatus</i> parameter to obtain the status returned by the authentication package.
     * 
     * If the function fails, the return value is an <b>NTSTATUS</b> code. The following are possible error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_QUOTA_EXCEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call could not be completed because the client's memory quota is not sufficient to allocate the return buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_NO_SUCH_PACKAGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified authentication package is not recognized by the LSA.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_PKINIT_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Kerberos client received a KDC certificate that is not valid. For device logon, strict KDC validation is required, so the KDC must have certificates that use the "Kerberos Authentication" template or equivalent. Also the KDC certificate could be expired, revoked, or the client is under active attack of sending requests to the wrong server.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_PKINIT_CLIENT_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Kerberos client is using a system certificate that is not valid. For device logon, there must be a DNS name. Also, the system certificate could be expired or the wrong one could be selected.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * For more information, see 
     * <a href="/windows/desktop/SecMgmt/management-return-values">LSA Policy Function Return Values</a>.
     * 
     * The 
     * <a href="/windows/desktop/api/ntsecapi/nf-ntsecapi-lsantstatustowinerror">LsaNtStatusToWinError</a> function converts an <b>NTSTATUS</b> code to a Windows error code.
     * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/nf-ntsecapi-lsacallauthenticationpackage
     * @since windows5.1.2600
     */
    static LsaCallAuthenticationPackage(LsaHandle, AuthenticationPackage, ProtocolSubmitBuffer, SubmitBufferLength, ProtocolReturnBuffer, ReturnBufferLength, ProtocolStatus) {
        LsaHandle := LsaHandle is Win32Handle ? NumGet(LsaHandle, "ptr") : LsaHandle

        ProtocolReturnBufferMarshal := ProtocolReturnBuffer is VarRef ? "ptr*" : "ptr"
        ReturnBufferLengthMarshal := ReturnBufferLength is VarRef ? "uint*" : "ptr"
        ProtocolStatusMarshal := ProtocolStatus is VarRef ? "int*" : "ptr"

        result := DllCall("SECUR32.dll\LsaCallAuthenticationPackage", "ptr", LsaHandle, "uint", AuthenticationPackage, "ptr", ProtocolSubmitBuffer, "uint", SubmitBufferLength, ProtocolReturnBufferMarshal, ProtocolReturnBuffer, ReturnBufferLengthMarshal, ReturnBufferLength, ProtocolStatusMarshal, ProtocolStatus, "int")
        return result
    }

    /**
     * Deletes the caller's logon application context and closes the connection to the LSA server.
     * @param {HANDLE} LsaHandle Handle obtained from a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsaregisterlogonprocess">LsaRegisterLogonProcess</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsaconnectuntrusted">LsaConnectUntrusted</a> call.
     * @returns {NTSTATUS} If the function succeeds, the return value is STATUS_SUCCESS.
     * 
     * If the function fails, the return value is an NTSTATUS code. For more information, see 
     * <a href="/windows/desktop/SecMgmt/management-return-values">LSA Policy Function Return Values</a>.
     * 
     * The 
     * <a href="/windows/desktop/api/ntsecapi/nf-ntsecapi-lsantstatustowinerror">LsaNtStatusToWinError</a> function converts an NTSTATUS code to a Windows error code.
     * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/nf-ntsecapi-lsaderegisterlogonprocess
     * @since windows5.1.2600
     */
    static LsaDeregisterLogonProcess(LsaHandle) {
        LsaHandle := LsaHandle is Win32Handle ? NumGet(LsaHandle, "ptr") : LsaHandle

        result := DllCall("SECUR32.dll\LsaDeregisterLogonProcess", "ptr", LsaHandle, "int")
        return result
    }

    /**
     * Establishes an untrusted connection to the LSA server.
     * @param {Pointer<HANDLE>} LsaHandle Pointer to a handle that receives the connection handle, which must be provided in future authentication services.
     * @returns {NTSTATUS} If the function succeeds, the return value is STATUS_SUCCESS.
     * 
     * If the function fails, the return value is an NTSTATUS code. For more information, see 
     * <a href="/windows/desktop/SecMgmt/management-return-values">LSA Policy Function Return Values</a>.
     * 
     * The 
     * <a href="/windows/desktop/api/ntsecapi/nf-ntsecapi-lsantstatustowinerror">LsaNtStatusToWinError</a> function converts an NTSTATUS code to a Windows error code.
     * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/nf-ntsecapi-lsaconnectuntrusted
     * @since windows5.1.2600
     */
    static LsaConnectUntrusted(LsaHandle) {
        result := DllCall("SECUR32.dll\LsaConnectUntrusted", "ptr", LsaHandle, "int")
        return result
    }

    /**
     * The LsaFreeMemory function frees memory allocated for an output buffer by an LSA function call.
     * @param {Pointer<Void>} Buffer Pointer to memory buffer that was allocated by an LSA function call. If <b>LsaFreeMemory</b> is successful, this buffer is freed.
     * @returns {NTSTATUS} If the function succeeds, the return value is STATUS_SUCCESS.
     * 
     * If the function fails, the return value is an NTSTATUS code, which can be the following value or one of the 
     * <a href="/windows/desktop/SecMgmt/management-return-values">LSA Policy Function Return Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_UNSUCCESSFUL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Memory could not be freed because it was not allocated by an LSA function call.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * You can use the 
     * <a href="/windows/desktop/api/ntsecapi/nf-ntsecapi-lsantstatustowinerror">LsaNtStatusToWinError</a> function to convert the NTSTATUS code to a Windows error code.
     * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/nf-ntsecapi-lsafreememory
     * @since windows5.1.2600
     */
    static LsaFreeMemory(Buffer) {
        BufferMarshal := Buffer is VarRef ? "ptr" : "ptr"

        result := DllCall("ADVAPI32.dll\LsaFreeMemory", BufferMarshal, Buffer, "int")
        return result
    }

    /**
     * The LsaClose function closes a handle to a Policy or TrustedDomain object.
     * @param {LSA_HANDLE} ObjectHandle A handle to a <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/policy-object">Policy</a> object returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsaopenpolicy">LsaOpenPolicy</a> function or to a <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/trusteddomain-object">TrustedDomain</a> object returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsaopentrusteddomainbyname">LsaOpenTrustedDomainByName</a> function. Following the completion of this call, the handle is no longer valid.
     * @returns {NTSTATUS} If the function succeeds, the return value is STATUS_SUCCESS.
     * 
     * If the function fails, the return value is an NTSTATUS code. For more information, see 
     * <a href="/windows/desktop/SecMgmt/management-return-values">LSA Policy Function Return Values</a>.
     * 
     * You can use the 
     * <a href="/windows/desktop/api/ntsecapi/nf-ntsecapi-lsantstatustowinerror">LsaNtStatusToWinError</a> function to convert the NTSTATUS code to a Windows error code.
     * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/nf-ntsecapi-lsaclose
     * @since windows5.1.2600
     */
    static LsaClose(ObjectHandle) {
        ObjectHandle := ObjectHandle is Win32Handle ? NumGet(ObjectHandle, "ptr") : ObjectHandle

        result := DllCall("ADVAPI32.dll\LsaClose", "ptr", ObjectHandle, "int")
        return result
    }

    /**
     * Retrieves the set of existing logon session identifiers (LUIDs) and the number of sessions.
     * @param {Pointer<Integer>} LogonSessionCount Pointer to a long integer that receives the number of elements returned in the array returned in <i>LogonSessionList</i> parameter.
     * @param {Pointer<Pointer<LUID>>} LogonSessionList Address of a pointer to a LUID. The pointer receives the first element of an array of logon session identifiers. The memory used by the array is allocated by the LSA. When the array is no longer needed, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsafreereturnbuffer">LSAFreeReturnBuffer</a> function to free it.
     * @returns {NTSTATUS} If the function succeeds, the return value is STATUS_SUCCESS.
     * 
     * If the function fails, the return value is an NTSTATUS code indicating the reason.
     * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/nf-ntsecapi-lsaenumeratelogonsessions
     * @since windows5.1.2600
     */
    static LsaEnumerateLogonSessions(LogonSessionCount, LogonSessionList) {
        LogonSessionCountMarshal := LogonSessionCount is VarRef ? "uint*" : "ptr"
        LogonSessionListMarshal := LogonSessionList is VarRef ? "ptr*" : "ptr"

        result := DllCall("SECUR32.dll\LsaEnumerateLogonSessions", LogonSessionCountMarshal, LogonSessionCount, LogonSessionListMarshal, LogonSessionList, "int")
        return result
    }

    /**
     * Retrieves information about a specified logon session.
     * @param {Pointer<LUID>} LogonId Specifies a pointer to a <b>LUID</b> that identifies the logon session whose information will be retrieved. For information about valid values for this parameter, see Remarks.
     * @param {Pointer<Pointer<SECURITY_LOGON_SESSION_DATA>>} ppLogonSessionData Address of a pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-security_logon_session_data">SECURITY_LOGON_SESSION_DATA</a> structure containing information on the logon session specified by <i>LogonId</i>. This structure is allocated by the LSA. When the information is no longer needed, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsafreereturnbuffer">LsaFreeReturnBuffer</a> function to free the memory used by this structure.
     * @returns {NTSTATUS} If the function succeeds, the return value is STATUS_SUCCESS.
     * 
     * If the function fails, the return value is an <b>NTSTATUS</b> code indicating the reason.
     * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/nf-ntsecapi-lsagetlogonsessiondata
     * @since windows5.1.2600
     */
    static LsaGetLogonSessionData(LogonId, ppLogonSessionData) {
        ppLogonSessionDataMarshal := ppLogonSessionData is VarRef ? "ptr*" : "ptr"

        result := DllCall("SECUR32.dll\LsaGetLogonSessionData", "ptr", LogonId, ppLogonSessionDataMarshal, ppLogonSessionData, "int")
        return result
    }

    /**
     * Opens a handle to the Policy object on a local or remote system.
     * @param {Pointer<LSA_UNICODE_STRING>} SystemName A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_unicode_string">LSA_UNICODE_STRING</a> structure that contains the name of the target system. The name can have the form "<i>ComputerName</i>" or "&#92;&#92;<i>ComputerName</i>". If this parameter is <b>NULL</b>, the function opens the <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/policy-object">Policy</a> object on the local system.
     * @param {Pointer<LSA_OBJECT_ATTRIBUTES>} ObjectAttributes A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_object_attributes">LSA_OBJECT_ATTRIBUTES</a> structure that specifies the connection attributes. The structure members are not used; initialize them to <b>NULL</b> or zero.
     * @param {Integer} DesiredAccess An <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-mask">ACCESS_MASK</a> that specifies the requested access rights. The function fails if the DACL of the target system does not allow the caller the requested access. To determine the access rights that you need, see the documentation for the LSA functions with which you want to use the policy handle.
     * @param {Pointer<LSA_HANDLE>} PolicyHandle A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/lsa-handle">LSA_HANDLE</a> variable that receives a handle to the <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/policy-object">Policy</a> object.
     * 
     * When you no longer need this handle, pass it to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsaclose">LsaClose</a> function to close it.
     * @returns {NTSTATUS} If the function succeeds, the function returns STATUS_SUCCESS.
     * 
     * If the function fails, it returns an <b>NTSTATUS</b> code. For more information, see 
     * <a href="/windows/desktop/SecMgmt/management-return-values">LSA Policy Function Return Values</a>.
     * 
     * You can use the 
     * <a href="/windows/desktop/api/ntsecapi/nf-ntsecapi-lsantstatustowinerror">LsaNtStatusToWinError</a> function to convert the <b>NTSTATUS</b> code to a Windows error code.
     * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/nf-ntsecapi-lsaopenpolicy
     * @since windows5.1.2600
     */
    static LsaOpenPolicy(SystemName, ObjectAttributes, DesiredAccess, PolicyHandle) {
        result := DllCall("ADVAPI32.dll\LsaOpenPolicy", "ptr", SystemName, "ptr", ObjectAttributes, "uint", DesiredAccess, "ptr", PolicyHandle, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<LSA_UNICODE_STRING>} CAPDNs 
     * @param {Integer} CAPDNCount 
     * @param {Integer} Flags 
     * @returns {NTSTATUS} 
     */
    static LsaSetCAPs(CAPDNs, CAPDNCount, Flags) {
        result := DllCall("ADVAPI32.dll\LsaSetCAPs", "ptr", CAPDNs, "uint", CAPDNCount, "uint", Flags, "int")
        return result
    }

    /**
     * Returns an array of central access policies (CAPs) identifiers (CAPIDs) of all the CAPs applied on a specific computer.
     * @param {Pointer<LSA_UNICODE_STRING>} SystemName A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_unicode_string">LSA_UNICODE_STRING</a> structure that contains the name of the specific computer. The name can have the form of "ComputerName" or "\\ComputerName". If this parameter is <b>NULL</b>, then the function returns the CAPIDs of the local computer.
     * @param {Pointer<Pointer<PSID>>} CAPIDs A pointer to a variable that receives an array of pointers to CAPIDs that identify the CAPs available on the specified computer. When you have finished using the CAPIDs, call the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsafreememory">LsaFreeMemory</a> function on each element in the array and the entire array.
     * @param {Pointer<Integer>} CAPIDCount A pointer to a variable that receives the number of CAPs that are available on the specified computer. The array returned in the <i>CAPIDs</i> parameter contains the same number of elements as the <i>CAPIDCount</i> parameter.
     * @returns {NTSTATUS} If the function succeeds, the return value is STATUS_SUCCESS.
     * 
     * If the function fails, the return value is one of the <a href="/windows/desktop/SecMgmt/management-return-values">LSA Policy Function Return Values</a>. You can use the <a href="/windows/desktop/api/ntsecapi/nf-ntsecapi-lsantstatustowinerror">LsaNtStatusToWinError</a> function to  convert the <b>NTSTATUS</b> code to a Windows error code.
     * @see https://docs.microsoft.com/windows/win32/api//ntlsa/nf-ntlsa-lsagetappliedcapids
     * @since windows8.0
     */
    static LsaGetAppliedCAPIDs(SystemName, CAPIDs, CAPIDCount) {
        CAPIDsMarshal := CAPIDs is VarRef ? "ptr*" : "ptr"
        CAPIDCountMarshal := CAPIDCount is VarRef ? "uint*" : "ptr"

        result := DllCall("ADVAPI32.dll\LsaGetAppliedCAPIDs", "ptr", SystemName, CAPIDsMarshal, CAPIDs, CAPIDCountMarshal, CAPIDCount, "int")
        return result
    }

    /**
     * Returns the Central Access Policies (CAPs) for the specified IDs.
     * @param {Pointer<PSID>} CAPIDs A pointer to a variable that contains an array of pointers to CAPIDs that identify the CAPs being queried.
     * @param {Integer} CAPIDCount The number of IDs in the <i>CAPIDs</i> parameter.
     * @param {Pointer<Pointer<CENTRAL_ACCESS_POLICY>>} CAPs Receives a pointer to an array of pointers to <a href="https://docs.microsoft.com/windows/desktop/api/ntlsa/ns-ntlsa-central_access_policy">CENTRAL_ACCESS_POLICY</a> structures representing the queried CAPs.
     * @param {Pointer<Integer>} CAPCount The number of <a href="https://docs.microsoft.com/windows/desktop/api/ntlsa/ns-ntlsa-central_access_policy">CENTRAL_ACCESS_POLICY</a> structure pointers returned in the <i>CAPs</i> parameter.
     * @returns {NTSTATUS} If the function succeeds, the return value is STATUS_SUCCESS.
     * 
     * If the function fails, the return value is an NTSTATUS code, which can be one of the <a href="/windows/desktop/SecMgmt/management-return-values">LSA Policy Function Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//ntlsa/nf-ntlsa-lsaquerycaps
     * @since windows8.0
     */
    static LsaQueryCAPs(CAPIDs, CAPIDCount, CAPs, CAPCount) {
        CAPIDsMarshal := CAPIDs is VarRef ? "ptr*" : "ptr"
        CAPsMarshal := CAPs is VarRef ? "ptr*" : "ptr"
        CAPCountMarshal := CAPCount is VarRef ? "uint*" : "ptr"

        result := DllCall("ADVAPI32.dll\LsaQueryCAPs", CAPIDsMarshal, CAPIDs, "uint", CAPIDCount, CAPsMarshal, CAPs, CAPCountMarshal, CAPCount, "int")
        return result
    }

    /**
     * Retrieves information about a Policy object.
     * @param {LSA_HANDLE} PolicyHandle A handle to a <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/policy-object">Policy</a> object. The required access rights for this handle depend on the value of the <i>InformationClass</i> parameter. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/opening-a-policy-object-handle">Opening a Policy Object Handle</a>.
     * @param {Integer} InformationClass 
     * @param {Pointer<Pointer<Void>>} Buffer Pointer to a variable that receives a pointer to a structure containing the requested information. The type of structure depends on the value of the <i>InformationClass</i> parameter. 
     * 
     * 
     * 
     * 
     * When you no longer need the information, pass the returned pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsafreememory">LsaFreeMemory</a>.
     * @returns {NTSTATUS} If the <b>LsaQueryInformationPolicy</b> function succeeds, the return value is STATUS_SUCCESS.
     * 
     * If the function fails, the return value is an NTSTATUS code. For more information, see 
     * <a href="/windows/desktop/SecMgmt/management-return-values">LSA Policy Function Return Values</a>.
     * 
     * You can use the 
     * <a href="/windows/desktop/api/ntsecapi/nf-ntsecapi-lsantstatustowinerror">LsaNtStatusToWinError</a> function to convert the NTSTATUS code to a Windows error code.
     * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/nf-ntsecapi-lsaqueryinformationpolicy
     * @since windows5.1.2600
     */
    static LsaQueryInformationPolicy(PolicyHandle, InformationClass, Buffer) {
        PolicyHandle := PolicyHandle is Win32Handle ? NumGet(PolicyHandle, "ptr") : PolicyHandle

        BufferMarshal := Buffer is VarRef ? "ptr*" : "ptr"

        result := DllCall("ADVAPI32.dll\LsaQueryInformationPolicy", "ptr", PolicyHandle, "int", InformationClass, BufferMarshal, Buffer, "int")
        return result
    }

    /**
     * Modifies information in a Policy object.
     * @param {LSA_HANDLE} PolicyHandle A handle to a <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/policy-object">Policy</a> object. The required access rights for this handle depend on the value of the <i>InformationClass</i> parameter. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/opening-a-policy-object-handle">Opening a Policy Object Handle</a>.
     * @param {Integer} InformationClass 
     * @param {Pointer<Void>} Buffer Pointer to a structure containing the information to set. The type of structure depends on the value of the <i>InformationClass</i> parameter.
     * @returns {NTSTATUS} If the function succeeds, the return value is STATUS_SUCCESS.
     * 
     * If the function fails, the return value is an NTSTATUS code. For more information, see 
     * <a href="/windows/desktop/SecMgmt/management-return-values">LSA Policy Function Return Values</a>.
     * 
     * You can use the 
     * <a href="/windows/desktop/api/ntsecapi/nf-ntsecapi-lsantstatustowinerror">LsaNtStatusToWinError</a> function to convert the NTSTATUS code to a Windows error code.
     * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/nf-ntsecapi-lsasetinformationpolicy
     * @since windows5.1.2600
     */
    static LsaSetInformationPolicy(PolicyHandle, InformationClass, Buffer) {
        PolicyHandle := PolicyHandle is Win32Handle ? NumGet(PolicyHandle, "ptr") : PolicyHandle

        BufferMarshal := Buffer is VarRef ? "ptr" : "ptr"

        result := DllCall("ADVAPI32.dll\LsaSetInformationPolicy", "ptr", PolicyHandle, "int", InformationClass, BufferMarshal, Buffer, "int")
        return result
    }

    /**
     * Retrieves domain information from the Policyobject.
     * @param {LSA_HANDLE} PolicyHandle A handle to the <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/policy-object">Policy</a> object for the system.
     * @param {Integer} InformationClass <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ne-ntsecapi-policy_domain_information_class">POLICY_DOMAIN_INFORMATION_CLASS</a> enumeration that specifies the information to be returned from the  <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/policy-object">Policy</a>object. The following table shows the possible values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PolicyDomainEfsInformation"></a><a id="policydomainefsinformation"></a><a id="POLICYDOMAINEFSINFORMATION"></a><dl>
     * <dt><b>PolicyDomainEfsInformation</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The information is for <a href="https://docs.microsoft.com/windows/desktop/SecGloss/e-gly">Encrypting File System</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PolicyDomainKerberosTicketInformation"></a><a id="policydomainkerberosticketinformation"></a><a id="POLICYDOMAINKERBEROSTICKETINFORMATION"></a><dl>
     * <dt><b>PolicyDomainKerberosTicketInformation</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The information is for a Kerberos ticket.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Pointer<Void>>} Buffer Pointer to a buffer that receives the requested information.
     * @returns {NTSTATUS} If the function succeeds, the return value is STATUS_SUCCESS.
     * 
     * If the function fails, the return value is an NTSTATUS code, which can be the following value or one of the <a href="/windows/desktop/SecMgmt/management-return-values">LSA Policy Function Return Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_INTERNAL_DB_CORRUPTION</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The policy database is 
     *             corrupt.  The returned policy information is  not valid for
     *             the given class.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/nf-ntsecapi-lsaquerydomaininformationpolicy
     * @since windows5.1.2600
     */
    static LsaQueryDomainInformationPolicy(PolicyHandle, InformationClass, Buffer) {
        PolicyHandle := PolicyHandle is Win32Handle ? NumGet(PolicyHandle, "ptr") : PolicyHandle

        BufferMarshal := Buffer is VarRef ? "ptr*" : "ptr"

        result := DllCall("ADVAPI32.dll\LsaQueryDomainInformationPolicy", "ptr", PolicyHandle, "int", InformationClass, BufferMarshal, Buffer, "int")
        return result
    }

    /**
     * Sets domain information to the Policyobject.
     * @param {LSA_HANDLE} PolicyHandle A handle to the <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/policy-object">Policy</a> object for the system.
     * @param {Integer} InformationClass <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ne-ntsecapi-policy_domain_information_class">POLICY_DOMAIN_INFORMATION_CLASS</a> enumeration that specifies the information to be set to the  <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/policy-object">Policy</a>object. The following table shows the possible values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PolicyDomainEfsInformation"></a><a id="policydomainefsinformation"></a><a id="POLICYDOMAINEFSINFORMATION"></a><dl>
     * <dt><b>PolicyDomainEfsInformation</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The information is for <a href="https://docs.microsoft.com/windows/desktop/SecGloss/e-gly">Encrypting File System</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PolicyDomainKerberosTicketInformation"></a><a id="policydomainkerberosticketinformation"></a><a id="POLICYDOMAINKERBEROSTICKETINFORMATION"></a><dl>
     * <dt><b>PolicyDomainKerberosTicketInformation</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The information is for a Kerberos ticket.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Void>} Buffer Pointer to a buffer that contains  the  information to set to the  <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/policy-object">Policy</a>object.
     * @returns {NTSTATUS} If the function succeeds, the return value is STATUS_SUCCESS.
     * 
     * If the function fails, the return value is an NTSTATUS code, which can be the following value or one of the <a href="/windows/desktop/SecMgmt/management-return-values">LSA Policy Function Return Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_INTERNAL_DB_CORRUPTION</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The policy database is 
     *             corrupt.  The returned policy information is  not valid for
     *             the given class.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/nf-ntsecapi-lsasetdomaininformationpolicy
     * @since windows5.1.2600
     */
    static LsaSetDomainInformationPolicy(PolicyHandle, InformationClass, Buffer) {
        PolicyHandle := PolicyHandle is Win32Handle ? NumGet(PolicyHandle, "ptr") : PolicyHandle

        BufferMarshal := Buffer is VarRef ? "ptr" : "ptr"

        result := DllCall("ADVAPI32.dll\LsaSetDomainInformationPolicy", "ptr", PolicyHandle, "int", InformationClass, BufferMarshal, Buffer, "int")
        return result
    }

    /**
     * The LsaRegisterPolicyChangeNotification function registers an event handle with the local security authority (LSA). This event handle is signaled whenever the indicated LSA policy is modified.
     * @param {Integer} InformationClass A
     * @param {HANDLE} NotificationEventHandle A handle to an event obtained by calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-createeventa">CreateEvent</a> function. The event can be either named or unnamed.
     * @returns {NTSTATUS} If the function succeeds, the return value is STATUS_SUCCESS.
     * 
     * If the function fails, the return value is an NTSTATUS code. For more information, see 
     * <a href="/windows/desktop/SecMgmt/management-return-values">LSA Policy Function Return Values</a>.
     * 
     * You can use the 
     * <a href="/windows/desktop/api/ntsecapi/nf-ntsecapi-lsantstatustowinerror">LsaNtStatusToWinError</a> function to convert the NTSTATUS code to a Windows error code.
     * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/nf-ntsecapi-lsaregisterpolicychangenotification
     * @since windows5.1.2600
     */
    static LsaRegisterPolicyChangeNotification(InformationClass, NotificationEventHandle) {
        NotificationEventHandle := NotificationEventHandle is Win32Handle ? NumGet(NotificationEventHandle, "ptr") : NotificationEventHandle

        result := DllCall("SECUR32.dll\LsaRegisterPolicyChangeNotification", "int", InformationClass, "ptr", NotificationEventHandle, "int")
        return result
    }

    /**
     * The LsaUnregisterPolicyChangeNotification function disables a previously registered notification event.
     * @param {Integer} InformationClass A
     * @param {HANDLE} NotificationEventHandle A handle to the notification event to unregister.
     * @returns {NTSTATUS} If the function succeeds, the return value is STATUS_SUCCESS.
     * 
     * If the function fails, the return value is an NTSTATUS code. For more information, see 
     * <a href="/windows/desktop/SecMgmt/management-return-values">LSA Policy Function Return Values</a>.
     * 
     * You can use the 
     * <a href="/windows/desktop/api/ntsecapi/nf-ntsecapi-lsantstatustowinerror">LsaNtStatusToWinError</a> function to convert the NTSTATUS code to a Windows error code.
     * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/nf-ntsecapi-lsaunregisterpolicychangenotification
     * @since windows5.1.2600
     */
    static LsaUnregisterPolicyChangeNotification(InformationClass, NotificationEventHandle) {
        NotificationEventHandle := NotificationEventHandle is Win32Handle ? NumGet(NotificationEventHandle, "ptr") : NotificationEventHandle

        result := DllCall("SECUR32.dll\LsaUnregisterPolicyChangeNotification", "int", InformationClass, "ptr", NotificationEventHandle, "int")
        return result
    }

    /**
     * The LsaEnumerateTrustedDomains function retrieves the names and SIDs of domains trusted to authenticate logon credentials.
     * @param {LSA_HANDLE} PolicyHandle A handle to a <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/policy-object">Policy</a> object. The handle must have the POLICY_VIEW_LOCAL_INFORMATION access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/opening-a-policy-object-handle">Opening a Policy Object Handle</a>.
     * @param {Pointer<Integer>} EnumerationContext Pointer to an enumeration handle that enables you to make multiple calls to enumerate all the trusted domains. On the first call to <b>LsaEnumerateTrustedDomains</b>, <i>EnumerationContext</i> must point to a variable that has been initialized to zero. On subsequent calls to <b>LsaEnumerateTrustedDomains</b>, <i>EnumerationContext</i> must point to the enumeration handle returned by the previous call.
     * @param {Pointer<Pointer<Void>>} Buffer Receives a pointer to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_trust_information">LSA_TRUST_INFORMATION</a> structures that contain the names and SIDs of one or more trusted domains. 
     * 
     * 
     * 
     * 
     * When you no longer need the information, pass the returned pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsafreememory">LsaFreeMemory</a>.
     * @param {Integer} PreferedMaximumLength Specifies the preferred maximum size, in bytes, of the returned buffer. This information is approximate; the actual number of bytes returned may be greater than this value.
     * @param {Pointer<Integer>} CountReturned Pointer to a variable that receives the number of elements returned in the <i>Buffer</i> parameter.
     * @returns {NTSTATUS} If the function is successful, the return value is one of the following NTSTATUS values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_SUCCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The enumeration has been successfully completed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_MORE_ENTRIES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call was successful, but there are more trusted domains to be enumerated. Call <a href="/windows/desktop/api/ntsecapi/nf-ntsecapi-lsaenumeratetrusteddomains">LsaEnumerateTrustedDomains</a> again, passing the value returned in the <i>EnumerationContext</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_NO_MORE_ENTRIES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are no more trusted domains to enumerate.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * If the function fails, the return value is an NTSTATUS code. For more information, see 
     * <a href="/windows/desktop/SecMgmt/management-return-values">LSA Policy Function Return Values</a>.
     * 
     * You can use the 
     * <a href="/windows/desktop/api/ntsecapi/nf-ntsecapi-lsantstatustowinerror">LsaNtStatusToWinError</a> function to convert the NTSTATUS code to a Windows error code.
     * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/nf-ntsecapi-lsaenumeratetrusteddomains
     * @since windows5.1.2600
     */
    static LsaEnumerateTrustedDomains(PolicyHandle, EnumerationContext, Buffer, PreferedMaximumLength, CountReturned) {
        PolicyHandle := PolicyHandle is Win32Handle ? NumGet(PolicyHandle, "ptr") : PolicyHandle

        EnumerationContextMarshal := EnumerationContext is VarRef ? "uint*" : "ptr"
        BufferMarshal := Buffer is VarRef ? "ptr*" : "ptr"
        CountReturnedMarshal := CountReturned is VarRef ? "uint*" : "ptr"

        result := DllCall("ADVAPI32.dll\LsaEnumerateTrustedDomains", "ptr", PolicyHandle, EnumerationContextMarshal, EnumerationContext, BufferMarshal, Buffer, "uint", PreferedMaximumLength, CountReturnedMarshal, CountReturned, "int")
        return result
    }

    /**
     * Retrieves the security identifiers (SIDs) that correspond to an array of user, group, or local group names.
     * @param {LSA_HANDLE} PolicyHandle A handle to a <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/policy-object">Policy</a> object. The handle must have the POLICY_LOOKUP_NAMES access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/opening-a-policy-object-handle">Opening a Policy Object Handle</a>.
     * @param {Integer} Count Specifies the number of names in the <i>Names</i> array. This is also the number of entries returned in the <i>Sids</i> array. This value must be less than or equal to 1000.
     * @param {Pointer<LSA_UNICODE_STRING>} Names Pointer to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_unicode_string">LSA_UNICODE_STRING</a> structures that contain the names to look up. The strings in these structures can be the names of user, group, or local group accounts, or the names of domains. Domain names can be DNS domain names or NetBIOS domain names. 
     * 
     * 
     * 
     * 
     * For more information about the format of the name strings, see Remarks.
     * @param {Pointer<Pointer<LSA_REFERENCED_DOMAIN_LIST>>} ReferencedDomains Receives a pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_referenced_domain_list">LSA_REFERENCED_DOMAIN_LIST</a> structure. The <b>Domains</b> member of this structure is an array that contains an entry for each domain in which a name was found. The <b>DomainIndex</b> member of each entry in the <i>Sids</i> array is the index of the <b>Domains</b> array entry for the domain in which the name was found. 
     * 
     * 
     * 
     * 
     * When you have finished using the returned pointer, free the memory by calling the  
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsafreememory">LsaFreeMemory</a> function. This memory must be freed even when the function fails with the either of the error codes <b>STATUS_NONE_MAPPED</b> or <b>STATUS_SOME_NOT_MAPPED</b>
     * @param {Pointer<Pointer<LSA_TRANSLATED_SID>>} Sids Receives a pointer to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-lsa_translated_sid">LSA_TRANSLATED_SID</a> structures. Each entry in the <i>Sids</i> array contains the SID information for the corresponding entry in the <i>Names</i> array.  
     * 
     * 
     * 
     * 
     * When you have finished using the returned pointer, free the memory by calling the  
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsafreememory">LsaFreeMemory</a> function. This memory must be freed even when the function fails with the either of the error codes <b>STATUS_NONE_MAPPED</b> or <b>STATUS_SOME_NOT_MAPPED</b>
     * @returns {NTSTATUS} If the function succeeds, the function returns  one of the following <b>NTSTATUS</b> values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_SOME_NOT_MAPPED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Some of the names could not be translated. This is an informational-level return value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_SUCCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * All of the names were found and successfully translated.
     * 
     * </td>
     * </tr>
     * </table>
     * 
     * If the function fails, the return value is the following <b>NTSTATUS</b> value or one of the 
     * <a href="/windows/desktop/SecMgmt/management-return-values">LSA Policy Function Return Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_NONE_MAPPED</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * None of the names were translated.
     * </td>
     * </tr>
     * 
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_TOO_MANY_NAMES</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Names array parameter was too large.
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * Use the 
     * <a href="/windows/desktop/api/ntsecapi/nf-ntsecapi-lsantstatustowinerror">LsaNtStatusToWinError</a> function to convert the <b>NTSTATUS</b> code to a Windows error code.
     * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/nf-ntsecapi-lsalookupnames
     * @since windows5.1.2600
     */
    static LsaLookupNames(PolicyHandle, Count, Names, ReferencedDomains, Sids) {
        PolicyHandle := PolicyHandle is Win32Handle ? NumGet(PolicyHandle, "ptr") : PolicyHandle

        ReferencedDomainsMarshal := ReferencedDomains is VarRef ? "ptr*" : "ptr"
        SidsMarshal := Sids is VarRef ? "ptr*" : "ptr"

        result := DllCall("ADVAPI32.dll\LsaLookupNames", "ptr", PolicyHandle, "uint", Count, "ptr", Names, ReferencedDomainsMarshal, ReferencedDomains, SidsMarshal, Sids, "int")
        return result
    }

    /**
     * Retrieves the security identifiers (SIDs) for specified account names. LsaLookupNames2 can look up the SID for any account in any domain in a Windows forest.
     * @param {LSA_HANDLE} PolicyHandle A handle to a 
     * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/policy-object">Policy</a> object. The handle must have the POLICY_LOOKUP_NAMES access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/opening-a-policy-object-handle">Opening a Policy Object Handle</a>.
     * @param {Integer} Flags Values that control the behavior of this function. The following value is currently defined.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="LSA_LOOKUP_ISOLATED_AS_LOCAL"></a><a id="lsa_lookup_isolated_as_local"></a><dl>
     * <dt><b>LSA_LOOKUP_ISOLATED_AS_LOCAL</b></dt>
     * <dt>0x80000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function searches only on the local systems for names that do not specify a domain. The function does search on remote systems for names that do specify a domain.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} Count Specifies the number of names in the <i>Names</i> array. This is also the number of entries returned in the <i>Sids</i> array.
     * @param {Pointer<LSA_UNICODE_STRING>} Names Pointer to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_unicode_string">LSA_UNICODE_STRING</a> structures that contain the names to look up. These strings can be the names of user, group, or local group accounts, or the names of domains. Domain names can be DNS domain names or NetBIOS domain names. 
     * 
     * 
     * 
     * 
     * For more information about the format of the name strings, see Remarks.
     * @param {Pointer<Pointer<LSA_REFERENCED_DOMAIN_LIST>>} ReferencedDomains Receives a pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_referenced_domain_list">LSA_REFERENCED_DOMAIN_LIST</a> structure. The <b>Domains</b> member of this structure is an array that contains an entry for each domain in which a name was found. The <b>DomainIndex</b> member of each entry in the <i>Sids</i> array is the index of the <b>Domains</b> array entry for the domain in which the name was found.
     * 
     * When you have finished using the returned pointer, free it by calling the  
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsafreememory">LsaFreeMemory</a> function. This memory must be freed even when the function fails with the either of the error codes <b>STATUS_NONE_MAPPED</b> or <b>STATUS_SOME_NOT_MAPPED</b>
     * @param {Pointer<Pointer<LSA_TRANSLATED_SID2>>} Sids Receives a pointer to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_translated_sid2">LSA_TRANSLATED_SID2</a> structures. Each entry in the <i>Sids</i> array contains the SID information for the corresponding entry in the <i>Names</i> array. 
     * 
     * 
     * 
     * 
     * When you have finished using the returned pointer, free it by calling the  
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsafreememory">LsaFreeMemory</a> function. This memory must be freed even when the function fails with the either of the error codes <b>STATUS_NONE_MAPPED</b> or <b>STATUS_SOME_NOT_MAPPED</b>
     * @returns {NTSTATUS} If the function succeeds, the function returns one of the following <b>NTSTATUS</b> values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_SOME_NOT_MAPPED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Some of the names could not be translated. This is an informational-level return value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_SUCCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * All of the names were found and successfully translated.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * If the function fails, the return value is the following <b>NTSTATUS</b> value or one of the 
     * <a href="/windows/desktop/SecMgmt/management-return-values">LSA Policy Function Return Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_NONE_MAPPED</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * None of the names were translated.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * Use the 
     * <a href="/windows/desktop/api/ntsecapi/nf-ntsecapi-lsantstatustowinerror">LsaNtStatusToWinError</a> function to convert the <b>NTSTATUS</b> code to a Windows error code.
     * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/nf-ntsecapi-lsalookupnames2
     * @since windows5.1.2600
     */
    static LsaLookupNames2(PolicyHandle, Flags, Count, Names, ReferencedDomains, Sids) {
        PolicyHandle := PolicyHandle is Win32Handle ? NumGet(PolicyHandle, "ptr") : PolicyHandle

        ReferencedDomainsMarshal := ReferencedDomains is VarRef ? "ptr*" : "ptr"
        SidsMarshal := Sids is VarRef ? "ptr*" : "ptr"

        result := DllCall("ADVAPI32.dll\LsaLookupNames2", "ptr", PolicyHandle, "uint", Flags, "uint", Count, "ptr", Names, ReferencedDomainsMarshal, ReferencedDomains, SidsMarshal, Sids, "int")
        return result
    }

    /**
     * Looks up the names that correspond to an array of security identifiers (SIDs). If LsaLookupSids cannot find a name that corresponds to a SID, the function returns the SID in character form.
     * @param {LSA_HANDLE} PolicyHandle A handle to a <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/policy-object">Policy</a> object. This handle must have the POLICY_LOOKUP_NAMES access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/opening-a-policy-object-handle">Opening a Policy Object Handle</a>.
     * @param {Integer} Count Specifies the number of SIDs in the <i>Sids</i> array. This is also the number of entries returned in the <i>Names</i> array. This value must be less than or equal to 20480.
     * @param {Pointer<PSID>} Sids Pointer to an array of SID pointers to look up. The SIDs can be well-known SIDs, user, group, or local group account SIDs, or domain SIDs.
     * @param {Pointer<Pointer<LSA_REFERENCED_DOMAIN_LIST>>} ReferencedDomains Receives a pointer to a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_referenced_domain_list">LSA_REFERENCED_DOMAIN_LIST</a> structure. The <b>Domains</b> member of this structure is an array that contains an entry for each domain in which a SID was found. The entry for each domain contains the SID and flat name of the domain. For Windows domains, the flat name is the NetBIOS name. For links with non–Windows domains, the flat name is the identifying name of that domain, or it is <b>NULL</b>. 
     * 
     * 
     * 
     * 
     * When you no longer need the information, pass the returned pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsafreememory">LsaFreeMemory</a>. This memory must be freed even when the function fails with the either of the error codes <b>STATUS_NONE_MAPPED</b> or <b>STATUS_SOME_NOT_MAPPED</b>
     * @param {Pointer<Pointer<LSA_TRANSLATED_NAME>>} Names Receives a pointer to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_translated_name">LSA_TRANSLATED_NAME</a> structures. Each entry in the <i>Names</i> array contains the name information for the corresponding entry in the <i>Sids</i> array. For account SIDs, the <b>Name</b> member of each structure contains the isolated name of the account. For domain SIDs, the <b>Name</b> member is not valid. 
     * 
     * 
     * 
     * 
     * The <b>DomainIndex</b> member of each entry in the <i>Names</i> array is the index of an entry in the <b>Domains</b> array returned in the <i>ReferencedDomains</i> parameter. The index identifies the <b>Domains</b> array for the domain in which the SID was found.
     * 
     * When you no longer need the information, pass the returned pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsafreememory">LsaFreeMemory</a>. This memory must be freed even when the function fails with the either of the error codes <b>STATUS_NONE_MAPPED</b> or <b>STATUS_SOME_NOT_MAPPED</b>
     * @returns {NTSTATUS} If the function succeeds, the return value is one of the following <b>NTSTATUS</b> values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_SOME_NOT_MAPPED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Some of the SIDs could not be translated. This is an informational-level return value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_SUCCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * All of the SIDs were found and successfully translated.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * If the function fails, the return value is an <b>NTSTATUS</b> code, which can be one of the following values or one of the 
     * <a href="/windows/desktop/SecMgmt/management-return-values">LSA Policy Function Return Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_NONE_MAPPED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * None of the SIDs were translated. This is an error-level return value.
     * 
     * </td>
     * </tr>
     * 
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_TOO_MANY_SIDS</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Sids array parameter was too large.
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * You can use the 
     * <a href="/windows/desktop/api/ntsecapi/nf-ntsecapi-lsantstatustowinerror">LsaNtStatusToWinError</a> function to convert the <b>NTSTATUS</b> code to a Windows error code.
     * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/nf-ntsecapi-lsalookupsids
     * @since windows5.1.2600
     */
    static LsaLookupSids(PolicyHandle, Count, Sids, ReferencedDomains, Names) {
        PolicyHandle := PolicyHandle is Win32Handle ? NumGet(PolicyHandle, "ptr") : PolicyHandle

        SidsMarshal := Sids is VarRef ? "ptr*" : "ptr"
        ReferencedDomainsMarshal := ReferencedDomains is VarRef ? "ptr*" : "ptr"
        NamesMarshal := Names is VarRef ? "ptr*" : "ptr"

        result := DllCall("ADVAPI32.dll\LsaLookupSids", "ptr", PolicyHandle, "uint", Count, SidsMarshal, Sids, ReferencedDomainsMarshal, ReferencedDomains, NamesMarshal, Names, "int")
        return result
    }

    /**
     * Looks up the names that correspond to an array of security identifiers (SIDs) and supports Internet provider identities. If LsaLookupSids2 cannot find a name that corresponds to a SID, the function returns the SID in character form.
     * @param {LSA_HANDLE} PolicyHandle A handle to a <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/policy-object">Policy</a> object. This handle must have the POLICY_LOOKUP_NAMES access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/opening-a-policy-object-handle">Opening a Policy Object Handle</a>.
     * @param {Integer} LookupOptions Flags that modify the lookup behavior. 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="LSA_LOOKUP_DISALLOW_CONNECTED_ACCOUNT_INTERNET_SID"></a><a id="lsa_lookup_disallow_connected_account_internet_sid"></a><dl>
     * <dt><b>LSA_LOOKUP_DISALLOW_CONNECTED_ACCOUNT_INTERNET_SID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Internet SIDs from identity providers for connected accounts are disallowed. Connected accounts are those accounts which have a corresponding shadow account in the local SAM database connected to an online identity provider.  For example, MicrosoftAccount is a connected account.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="LSA_LOOKUP_PREFER_INTERNET_NAMES"></a><a id="lsa_lookup_prefer_internet_names"></a><dl>
     * <dt><b>LSA_LOOKUP_PREFER_INTERNET_NAMES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  Returns the internet names. Otherwise the NT4 style name (domain\username) is returned. The exception is if the Microsoft Account internet SID is specified, in which case the internet name is returned unless <b>LSA_LOOKUP_DISALLOW_NON_WINDOWS_INTERNET_SID</b>  is specified.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="LSA_LOOKUP_RETURN_LOCAL_NAMES"></a><a id="lsa_lookup_return_local_names"></a><dl>
     * <dt><b>LSA_LOOKUP_RETURN_LOCAL_NAMES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Always returns local SAM account names even for Internet provider identities.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} Count Specifies the number of SIDs in the <i>Sids</i> array. This is also the number of entries returned in the <i>Names</i> array. This value must be less than or equal to 20480.
     * @param {Pointer<PSID>} Sids Pointer to an array of SID pointers to look up. The SIDs can be well-known SIDs, user, group, or local group account SIDs, or domain SIDs.
     * @param {Pointer<Pointer<LSA_REFERENCED_DOMAIN_LIST>>} ReferencedDomains Receives a pointer to a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_referenced_domain_list">LSA_REFERENCED_DOMAIN_LIST</a> structure. The <b>Domains</b> member of this structure is an array that contains an entry for each domain in which a SID was found. The entry for each domain contains the SID and flat name of the domain. For Windows domains, the flat name is the NetBIOS name. For links with non–Windows domains, the flat name is the identifying name of that domain, or it is <b>NULL</b>. 
     * 
     * 
     * 
     * 
     * When you no longer need the information, pass the returned pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsafreememory">LsaFreeMemory</a>. This memory must be freed even when the function fails with the either of the error codes <b>STATUS_NONE_MAPPED</b> or <b>STATUS_SOME_NOT_MAPPED</b>
     * @param {Pointer<Pointer<LSA_TRANSLATED_NAME>>} Names Receives a pointer to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_translated_name">LSA_TRANSLATED_NAME</a> structures. Each entry in the <i>Names</i> array contains the name information for the corresponding entry in the <i>Sids</i> array. For account SIDs, the <b>Name</b> member of each structure contains the isolated name of the account. For domain SIDs, the <b>Name</b> member is not valid. 
     * 
     * 
     * 
     * 
     * The <b>DomainIndex</b> member of each entry in the <i>Names</i> array is the index of an entry in the <b>Domains</b> array returned in the <i>ReferencedDomains</i> parameter. The index identifies the <b>Domains</b> array for the domain in which the SID was found.
     * 
     * When you no longer need the information, pass the returned pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsafreememory">LsaFreeMemory</a>. This memory must be freed even when the function fails with the either of the error codes <b>STATUS_NONE_MAPPED</b> or <b>STATUS_SOME_NOT_MAPPED</b>
     * @returns {NTSTATUS} If the function succeeds, the return value is one of the following <b>NTSTATUS</b> values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_SOME_NOT_MAPPED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Some of the SIDs could not be translated. This is an informational-level return value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_SUCCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * All of the SIDs were found and successfully translated.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * If the function fails, the return value is an <b>NTSTATUS</b> code, which can be one of the following values or one of the 
     * <a href="/windows/desktop/SecMgmt/management-return-values">LSA Policy Function Return Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_NONE_MAPPED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * None of the SIDs were translated. This is an error-level return value.
     * 
     * </td>
     * </tr>
     * 
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_TOO_MANY_SIDS</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Sids array parameter was too large.
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * You can use the 
     * <a href="/windows/desktop/api/ntsecapi/nf-ntsecapi-lsantstatustowinerror">LsaNtStatusToWinError</a> function to convert the <b>NTSTATUS</b> code to a Windows error code.
     * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/nf-ntsecapi-lsalookupsids2
     * @since windows8.0
     */
    static LsaLookupSids2(PolicyHandle, LookupOptions, Count, Sids, ReferencedDomains, Names) {
        PolicyHandle := PolicyHandle is Win32Handle ? NumGet(PolicyHandle, "ptr") : PolicyHandle

        SidsMarshal := Sids is VarRef ? "ptr*" : "ptr"
        ReferencedDomainsMarshal := ReferencedDomains is VarRef ? "ptr*" : "ptr"
        NamesMarshal := Names is VarRef ? "ptr*" : "ptr"

        result := DllCall("ADVAPI32.dll\LsaLookupSids2", "ptr", PolicyHandle, "uint", LookupOptions, "uint", Count, SidsMarshal, Sids, ReferencedDomainsMarshal, ReferencedDomains, NamesMarshal, Names, "int")
        return result
    }

    /**
     * Returns the accounts in the database of a Local Security Authority (LSA) Policy object that hold a specified privilege.
     * @param {LSA_HANDLE} PolicyHandle A handle to a <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/policy-object">Policy</a> object. The handle must have POLICY_LOOKUP_NAMES and POLICY_VIEW_LOCAL_INFORMATION user rights. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/opening-a-policy-object-handle">Opening a Policy Object Handle</a>.
     * @param {Pointer<LSA_UNICODE_STRING>} UserRight Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_unicode_string">LSA_UNICODE_STRING</a> structure that specifies the name of a privilege. For a list of privileges, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/authorization-constants">Privilege Constants</a> and 
     * Account Rights Constants. 
     * 
     * 
     * 
     * 
     * If this parameter is <b>NULL</b>, the function enumerates all accounts in the LSA database of the system associated with the <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/policy-object">Policy</a> object.
     * @param {Pointer<Pointer<Void>>} Buffer Pointer to a variable that receives a pointer to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-lsa_enumeration_information">LSA_ENUMERATION_INFORMATION</a> structures. The <b>Sid</b> member of each structure is a pointer to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a> (SID) of an account that holds the specified privilege. 
     * 
     * 
     * 
     * 
     * When you no longer need the information, free the memory by passing the returned pointer to 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsafreememory">LsaFreeMemory</a> function.
     * @param {Pointer<Integer>} CountReturned Pointer to a variable that receives the number of entries returned in the <i>EnumerationBuffer</i> parameter.
     * @returns {NTSTATUS} If the function succeeds, the function returns STATUS_SUCCESS.
     * 
     * If the function fails, it returns an <b>NTSTATUS</b> code, which can be one of the following values or one of the 
     * <a href="/windows/desktop/SecMgmt/management-return-values">LSA Policy Function Return Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_NO_SUCH_PRIVILEGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The privilege string specified was not a valid privilege.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_NO_MORE_ENTRIES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There were no accounts with the specified privilege.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * You can use the 
     * <a href="/windows/desktop/api/ntsecapi/nf-ntsecapi-lsantstatustowinerror">LsaNtStatusToWinError</a> function to convert the <b>NTSTATUS</b> code to a Windows error code.
     * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/nf-ntsecapi-lsaenumerateaccountswithuserright
     * @since windows5.1.2600
     */
    static LsaEnumerateAccountsWithUserRight(PolicyHandle, UserRight, Buffer, CountReturned) {
        PolicyHandle := PolicyHandle is Win32Handle ? NumGet(PolicyHandle, "ptr") : PolicyHandle

        BufferMarshal := Buffer is VarRef ? "ptr*" : "ptr"
        CountReturnedMarshal := CountReturned is VarRef ? "uint*" : "ptr"

        result := DllCall("ADVAPI32.dll\LsaEnumerateAccountsWithUserRight", "ptr", PolicyHandle, "ptr", UserRight, BufferMarshal, Buffer, CountReturnedMarshal, CountReturned, "int")
        return result
    }

    /**
     * The LsaEnumerateAccountRights function enumerates the privileges assigned to an account.
     * @param {LSA_HANDLE} PolicyHandle A handle to a <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/policy-object">Policy</a> object. The handle must have the POLICY_LOOKUP_NAMES access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/opening-a-policy-object-handle">Opening a Policy Object Handle</a>.
     * @param {PSID} AccountSid Pointer to the SID of the account for which to enumerate privileges.
     * @param {Pointer<Pointer<LSA_UNICODE_STRING>>} UserRights Receives a pointer to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_unicode_string">LSA_UNICODE_STRING</a> structures. Each structure contains the name of a privilege held by the account. For a list of privilege names, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/authorization-constants">Privilege Constants</a>
     * 
     * When you no longer need the information, pass the returned pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsafreememory">LsaFreeMemory</a>.
     * @param {Pointer<Integer>} CountOfRights Pointer to a variable that receives the number of privileges in the <i>UserRights</i> array.
     * @returns {NTSTATUS} If at least one account right is found, the function succeeds and returns STATUS_SUCCESS.
     * 
     * If no account rights are found or if the function fails for any other reason, the function returns an NTSTATUS code such as FILE_NOT_FOUND. For more information, see 
     * <a href="/windows/desktop/SecMgmt/management-return-values">LSA Policy Function Return Values</a>. Use the 
     * <a href="/windows/desktop/api/ntsecapi/nf-ntsecapi-lsantstatustowinerror">LsaNtStatusToWinError</a> function to convert the NTSTATUS code to a Windows error code.
     * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/nf-ntsecapi-lsaenumerateaccountrights
     * @since windows5.1.2600
     */
    static LsaEnumerateAccountRights(PolicyHandle, AccountSid, UserRights, CountOfRights) {
        PolicyHandle := PolicyHandle is Win32Handle ? NumGet(PolicyHandle, "ptr") : PolicyHandle

        UserRightsMarshal := UserRights is VarRef ? "ptr*" : "ptr"
        CountOfRightsMarshal := CountOfRights is VarRef ? "uint*" : "ptr"

        result := DllCall("ADVAPI32.dll\LsaEnumerateAccountRights", "ptr", PolicyHandle, "ptr", AccountSid, UserRightsMarshal, UserRights, CountOfRightsMarshal, CountOfRights, "int")
        return result
    }

    /**
     * Assigns one or more privileges to an account.
     * @param {LSA_HANDLE} PolicyHandle A handle to a <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/policy-object">Policy</a> object. The handle must have the POLICY_LOOKUP_NAMES access right. If the account identified by the <i>AccountSid</i> parameter does not exist, the handle must have the POLICY_CREATE_ACCOUNT access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/opening-a-policy-object-handle">Opening a Policy Object Handle</a>.
     * @param {PSID} AccountSid Pointer to the SID of the account to which the function assigns <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">privileges</a>.
     * @param {Pointer<LSA_UNICODE_STRING>} UserRights Pointer to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_unicode_string">LSA_UNICODE_STRING</a> structures. Each structure contains the name of a privilege to add to the account. For a list of privilege names, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/authorization-constants">Privilege Constants</a>.
     * @param {Integer} CountOfRights Specifies the number of elements in the <i>UserRights</i> array.
     * @returns {NTSTATUS} If the function succeeds, the return value is STATUS_SUCCESS.
     * 
     * If the function fails, the return value is an NTSTATUS code, which can be the following value or one of the 
     * <a href="/windows/desktop/SecMgmt/management-return-values">LSA Policy Function Return Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_NO_SUCH_PRIVILEGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the privilege names is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * You can use the 
     * <a href="/windows/desktop/api/ntsecapi/nf-ntsecapi-lsantstatustowinerror">LsaNtStatusToWinError</a> function to convert the NTSTATUS code to a Windows error code.
     * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/nf-ntsecapi-lsaaddaccountrights
     * @since windows5.1.2600
     */
    static LsaAddAccountRights(PolicyHandle, AccountSid, UserRights, CountOfRights) {
        PolicyHandle := PolicyHandle is Win32Handle ? NumGet(PolicyHandle, "ptr") : PolicyHandle

        result := DllCall("ADVAPI32.dll\LsaAddAccountRights", "ptr", PolicyHandle, "ptr", AccountSid, "ptr", UserRights, "uint", CountOfRights, "int")
        return result
    }

    /**
     * Removes one or more privileges from an account.
     * @param {LSA_HANDLE} PolicyHandle A handle to a <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/policy-object">Policy</a> object. The handle must have the POLICY_LOOKUP_NAMES access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/opening-a-policy-object-handle">Opening a Policy Object Handle</a>.
     * @param {PSID} AccountSid Pointer to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a> (SID) of the account from which the privileges are removed.
     * @param {BOOLEAN} AllRights If <b>TRUE</b>, the function removes all privileges and deletes the account. In this case, the function ignores the <i>UserRights</i> parameter. If <b>FALSE</b>, the function removes the privileges specified by the <i>UserRights</i> parameter.
     * @param {Pointer<LSA_UNICODE_STRING>} UserRights Pointer to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_unicode_string">LSA_UNICODE_STRING</a> structures. Each structure contains the name of a privilege to be removed from the account. For a list of privilege names, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/authorization-constants">Privilege Constants</a>.
     * @param {Integer} CountOfRights Specifies the number of elements in the <i>UserRights</i> array.
     * @returns {NTSTATUS} If the function succeeds, the return value is STATUS_SUCCESS.
     * 
     * If the function fails, the return value is an NTSTATUS code, which can be one of the following values or one of the 
     * <a href="/windows/desktop/SecMgmt/management-return-values">LSA Policy Function Return Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_NO_SUCH_PRIVILEGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the privilege names is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates the <i>UserRights</i> parameter was <b>NULL</b> and the <i>AllRights</i> parameter was <b>FALSE</b>.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * You can use the 
     * <a href="/windows/desktop/api/ntsecapi/nf-ntsecapi-lsantstatustowinerror">LsaNtStatusToWinError</a> function to convert the NTSTATUS code to a Windows error code.
     * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/nf-ntsecapi-lsaremoveaccountrights
     * @since windows5.1.2600
     */
    static LsaRemoveAccountRights(PolicyHandle, AccountSid, AllRights, UserRights, CountOfRights) {
        PolicyHandle := PolicyHandle is Win32Handle ? NumGet(PolicyHandle, "ptr") : PolicyHandle

        result := DllCall("ADVAPI32.dll\LsaRemoveAccountRights", "ptr", PolicyHandle, "ptr", AccountSid, "char", AllRights, "ptr", UserRights, "uint", CountOfRights, "int")
        return result
    }

    /**
     * The LsaOpenTrustedDomainByName function opens the LSA policy handle of a remote trusted domain. You can pass this handle into LSA function calls in order to set or query the LSA policy of the remote machine.
     * @param {LSA_HANDLE} PolicyHandle A handle to a <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/policy-object">Policy</a> object. This is the policy handle of the local machine. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/opening-a-policy-object-handle">Opening a Policy Object Handle</a>.
     * @param {Pointer<LSA_UNICODE_STRING>} TrustedDomainName Name of the trusted domain. This name can be either the flat name, or the Domain Name System (DNS) domain name.
     * @param {Integer} DesiredAccess An 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-mask">ACCESS_MASK</a> structure that specifies the access permissions requested on the remote trusted domain object.
     * @param {Pointer<LSA_HANDLE>} TrustedDomainHandle Pointer that receives the address of the LSA policy handle of the remote trusted domain. You can pass this handle into LSA function calls in order to query and manage the LSA policy of the remote machine. 
     * 
     * 
     * 
     * 
     * When your application no longer needs this handle, it should call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsaclose">LsaClose</a> to delete the handle.
     * @returns {NTSTATUS} If the function succeeds, the return value is STATUS_SUCCESS.
     * 
     * If the function fails, the return value is an NTSTATUS code, which can be one of the following values or one of the 
     * <a href="/windows/desktop/SecMgmt/management-return-values">LSA Policy Function Return Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Caller does not have the appropriate access to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_OBJECT_NAME_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is no Trusted Domain object in the target system's LSA Database having the specified name.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * You can use the 
     * <a href="/windows/desktop/api/ntsecapi/nf-ntsecapi-lsantstatustowinerror">LsaNtStatusToWinError</a> function to convert the NTSTATUS code to a Windows error code.
     * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/nf-ntsecapi-lsaopentrusteddomainbyname
     * @since windows5.1.2600
     */
    static LsaOpenTrustedDomainByName(PolicyHandle, TrustedDomainName, DesiredAccess, TrustedDomainHandle) {
        PolicyHandle := PolicyHandle is Win32Handle ? NumGet(PolicyHandle, "ptr") : PolicyHandle

        result := DllCall("ADVAPI32.dll\LsaOpenTrustedDomainByName", "ptr", PolicyHandle, "ptr", TrustedDomainName, "uint", DesiredAccess, "ptr", TrustedDomainHandle, "int")
        return result
    }

    /**
     * The LsaQueryTrustedDomainInfo function retrieves information about a trusted domain.
     * @param {LSA_HANDLE} PolicyHandle A handle to the <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/policy-object">Policy</a> object of a domain controller that has a trust relationship with the domain identified by the <i>TrustedDomainSid</i> parameter. The handle must have the POLICY_VIEW_LOCAL_INFORMATION access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/opening-a-policy-object-handle">Opening a Policy Object Handle</a>.
     * @param {PSID} TrustedDomainSid Pointer to the SID of the trusted domain to query.
     * @param {Integer} InformationClass 
     * @param {Pointer<Pointer<Void>>} Buffer A pointer to a buffer that receives a pointer to a structure that contains the requested information. The type of structure depends on the value of the <i>InformationClass</i> parameter. 
     * 
     * 
     * 
     * 
     * When you have finished using the information, free the returned pointer by passing it to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsafreememory">LsaFreeMemory</a>.
     * @returns {NTSTATUS} If the function succeeds, the function returns STATUS_SUCCESS.
     * 
     * If the function fails, it returns an <b>NTSTATUS</b> value that indicates the error. For more information, see 
     * <a href="/windows/desktop/SecMgmt/management-return-values">LSA Policy Function Return Values</a>.
     * 
     * You can use the 
     * <a href="/windows/desktop/api/ntsecapi/nf-ntsecapi-lsantstatustowinerror">LsaNtStatusToWinError</a> function to convert the <b>NTSTATUS</b> value to a Windows error code.
     * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/nf-ntsecapi-lsaquerytrusteddomaininfo
     * @since windows5.1.2600
     */
    static LsaQueryTrustedDomainInfo(PolicyHandle, TrustedDomainSid, InformationClass, Buffer) {
        PolicyHandle := PolicyHandle is Win32Handle ? NumGet(PolicyHandle, "ptr") : PolicyHandle

        BufferMarshal := Buffer is VarRef ? "ptr*" : "ptr"

        result := DllCall("ADVAPI32.dll\LsaQueryTrustedDomainInfo", "ptr", PolicyHandle, "ptr", TrustedDomainSid, "int", InformationClass, BufferMarshal, Buffer, "int")
        return result
    }

    /**
     * The LsaSetTrustedDomainInformation function modifies a Policy object's information about a trusted domain.
     * @param {LSA_HANDLE} PolicyHandle A handle to the <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/policy-object">Policy</a> object of a domain controller. The required user rights for this handle depend on the value of the <i>InformationClass</i> parameter. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/opening-a-policy-object-handle">Opening a Policy Object Handle</a>.
     * @param {PSID} TrustedDomainSid Pointer to the SID of the trusted domain whose information is modified. If the <i>InformationClass</i> parameter is set to TrustedDomainNameInformation, this parameter must point to the SID of the domain to add to the list of trusted domains.
     * @param {Integer} InformationClass 
     * @param {Pointer<Void>} Buffer Pointer to a structure containing the information to set. The type of structure depends on the value of the <i>InformationClass</i> parameter.
     * @returns {NTSTATUS} If the function succeeds, the return value is STATUS_SUCCESS.
     * 
     * If the function fails, the return value is an NTSTATUS code. For more information, see 
     * <a href="/windows/desktop/SecMgmt/management-return-values">LSA Policy Function Return Values</a>.
     * 
     * You can use the 
     * <a href="/windows/desktop/api/ntsecapi/nf-ntsecapi-lsantstatustowinerror">LsaNtStatusToWinError</a> function to convert the NTSTATUS code to a Windows error code.
     * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/nf-ntsecapi-lsasettrusteddomaininformation
     * @since windows5.1.2600
     */
    static LsaSetTrustedDomainInformation(PolicyHandle, TrustedDomainSid, InformationClass, Buffer) {
        PolicyHandle := PolicyHandle is Win32Handle ? NumGet(PolicyHandle, "ptr") : PolicyHandle

        BufferMarshal := Buffer is VarRef ? "ptr" : "ptr"

        result := DllCall("ADVAPI32.dll\LsaSetTrustedDomainInformation", "ptr", PolicyHandle, "ptr", TrustedDomainSid, "int", InformationClass, BufferMarshal, Buffer, "int")
        return result
    }

    /**
     * The LsaDeleteTrustedDomain function removes a trusted domain from the list of trusted domains for a system and deletes the associated TrustedDomain object.
     * @param {LSA_HANDLE} PolicyHandle A handle to a <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/policy-object">Policy</a> object. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/opening-a-policy-object-handle">Opening a Policy Object Handle</a>.
     * @param {PSID} TrustedDomainSid Pointer to the SID of the trusted domain to be removed.
     * @returns {NTSTATUS} If the function succeeds, the return value is STATUS_SUCCESS.
     * 
     * If the function fails, the return value is an NTSTATUS code. For more information, see 
     * <a href="/windows/desktop/SecMgmt/management-return-values">LSA Policy Function Return Values</a>.
     * 
     * You can use the 
     * <a href="/windows/desktop/api/ntsecapi/nf-ntsecapi-lsantstatustowinerror">LsaNtStatusToWinError</a> function to convert the NTSTATUS code to a Windows error code.
     * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/nf-ntsecapi-lsadeletetrusteddomain
     * @since windows5.1.2600
     */
    static LsaDeleteTrustedDomain(PolicyHandle, TrustedDomainSid) {
        PolicyHandle := PolicyHandle is Win32Handle ? NumGet(PolicyHandle, "ptr") : PolicyHandle

        result := DllCall("ADVAPI32.dll\LsaDeleteTrustedDomain", "ptr", PolicyHandle, "ptr", TrustedDomainSid, "int")
        return result
    }

    /**
     * The LsaQueryTrustedDomainInfoByName function returns information about a trusted domain.
     * @param {LSA_HANDLE} PolicyHandle A handle to a <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/policy-object">Policy</a> object. This handle must have the POLICY_VIEW_LOCAL_INFORMATION access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/opening-a-policy-object-handle">Opening a Policy Object Handle</a>.
     * @param {Pointer<LSA_UNICODE_STRING>} TrustedDomainName String that contains the name of the trusted domain. This can either be the domain name or the flat name.
     * @param {Integer} InformationClass 
     * @param {Pointer<Pointer<Void>>} Buffer Receives a pointer to the returned buffer that contains the requested information. The format and content of this buffer depend on the information class. For example, if <i>InformationClass</i> is set to TrustedDomainInformationEx, <i>Buffer</i> receives a pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-trusted_domain_information_ex">TRUSTED_DOMAIN_INFORMATION_EX</a> structure. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ne-ntsecapi-trusted_information_class">TRUSTED_INFORMATION_CLASS</a>. 
     * 
     * 
     * 
     * 
     * When you have finished using the buffer, free it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsafreememory">LsaFreeMemory</a> function.
     * @returns {NTSTATUS} If the function succeeds, the function returns STATUS_SUCCESS.
     * 
     * If the function fails, it returns an <b>NTSTATUS</b> value, which can be one of the following values or one of the 
     * <a href="/windows/desktop/SecMgmt/management-return-values">LSA Policy Function Return Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Caller does not have the appropriate access to complete the operation. For a list of the required access types, see the description of the <i>InformationClass</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_INSUFFICIENT_
     * RESOURCES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient system resources, such as memory, to complete the call.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * You can use the 
     * <a href="/windows/desktop/api/ntsecapi/nf-ntsecapi-lsantstatustowinerror">LsaNtStatusToWinError</a> function to convert the <b>NTSTATUS</b> value to a Windows error code.
     * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/nf-ntsecapi-lsaquerytrusteddomaininfobyname
     * @since windows5.1.2600
     */
    static LsaQueryTrustedDomainInfoByName(PolicyHandle, TrustedDomainName, InformationClass, Buffer) {
        PolicyHandle := PolicyHandle is Win32Handle ? NumGet(PolicyHandle, "ptr") : PolicyHandle

        BufferMarshal := Buffer is VarRef ? "ptr*" : "ptr"

        result := DllCall("ADVAPI32.dll\LsaQueryTrustedDomainInfoByName", "ptr", PolicyHandle, "ptr", TrustedDomainName, "int", InformationClass, BufferMarshal, Buffer, "int")
        return result
    }

    /**
     * The LsaSetTrustedDomainInfoByName function sets values for a TrustedDomain object.
     * @param {LSA_HANDLE} PolicyHandle A handle to a <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/policy-object">Policy</a> object. The <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security descriptor</a> of the trusted domain object determines whether the caller's changes are accepted. For information about policy object handles, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/opening-a-policy-object-handle">Opening a Policy Object Handle</a>.
     * @param {Pointer<LSA_UNICODE_STRING>} TrustedDomainName Name of the trusted domain to set values for. This can either be the domain name or the flat name.
     * @param {Integer} InformationClass 
     * @param {Pointer<Void>} Buffer Pointer to a structure that contains the information to set. The type of structure depends on the value of the <i>InformationClass</i> parameter.
     * @returns {NTSTATUS} If the function succeeds, the return value is STATUS_SUCCESS.
     * 
     * If the function fails, the return value is an NTSTATUS code. For more information, see 
     * the "LSA Policy Function Return Values" section of <a href="/windows/desktop/SecMgmt/management-return-values">Security Management Return Values</a>.
     * 
     * You can use the 
     * <a href="/windows/desktop/api/ntsecapi/nf-ntsecapi-lsantstatustowinerror">LsaNtStatusToWinError</a> function to convert the NTSTATUS code to a Windows error code.
     * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/nf-ntsecapi-lsasettrusteddomaininfobyname
     * @since windows5.1.2600
     */
    static LsaSetTrustedDomainInfoByName(PolicyHandle, TrustedDomainName, InformationClass, Buffer) {
        PolicyHandle := PolicyHandle is Win32Handle ? NumGet(PolicyHandle, "ptr") : PolicyHandle

        BufferMarshal := Buffer is VarRef ? "ptr" : "ptr"

        result := DllCall("ADVAPI32.dll\LsaSetTrustedDomainInfoByName", "ptr", PolicyHandle, "ptr", TrustedDomainName, "int", InformationClass, BufferMarshal, Buffer, "int")
        return result
    }

    /**
     * Returns information about the domains trusted by the local system.
     * @param {LSA_HANDLE} PolicyHandle A handle to a <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/policy-object">Policy</a> object. This call requires POLICY_VIEW_LOCAL_INFORMATION access to the <b>Policy</b> object. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/opening-a-policy-object-handle">Opening a Policy Object Handle</a>.
     * @param {Pointer<Integer>} EnumerationContext A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/lsa-enumeration-handle">LSA_ENUMERATION_HANDLE</a> that you can use to make multiple calls to <b>LsaEnumerateTrustedDomainsEx</b>  to retrieve all of the trusted domain information. For more information, see Remarks.
     * @param {Pointer<Pointer<Void>>} Buffer Pointer to a buffer that receives a list of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-trusted_domain_information_ex">TRUSTED_DOMAIN_INFORMATION_EX</a> structures that contain information about the enumerated trusted domains. 
     * 
     * 
     * 
     * 
     * Your application should free this buffer when it is no longer needed by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsafreememory">LsaFreeMemory</a>.
     * @param {Integer} PreferedMaximumLength Preferred maximum length, in bytes, of returned data. This is not a hard upper limit, but serves as a guide. Due to data conversion between systems with different natural data sizes, the actual amount of data returned may be greater than this value.
     * @param {Pointer<Integer>} CountReturned Pointer to a <b>LONG</b> that receives the number of trusted domain objects returned.
     * @returns {NTSTATUS} If the function succeeds, the function returns STATUS_SUCCESS.
     * 
     * If the function fails, it returns an  <b>NTSTATUS</b> code, which can be one of the following values or one of the 
     * <a href="/windows/desktop/SecMgmt/management-return-values">LSA Policy Function Return Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Caller does not have the appropriate access to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_NO_MORE_ENTRIES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are no more entries. This warning is returned if no objects have been enumerated because the <i>EnumerationContext</i> value is too high.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * You can use the 
     * <a href="/windows/desktop/api/ntsecapi/nf-ntsecapi-lsantstatustowinerror">LsaNtStatusToWinError</a> function to convert the <b>NTSTATUS</b> code to a Windows error code.
     * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/nf-ntsecapi-lsaenumeratetrusteddomainsex
     * @since windows5.1.2600
     */
    static LsaEnumerateTrustedDomainsEx(PolicyHandle, EnumerationContext, Buffer, PreferedMaximumLength, CountReturned) {
        PolicyHandle := PolicyHandle is Win32Handle ? NumGet(PolicyHandle, "ptr") : PolicyHandle

        EnumerationContextMarshal := EnumerationContext is VarRef ? "uint*" : "ptr"
        BufferMarshal := Buffer is VarRef ? "ptr*" : "ptr"
        CountReturnedMarshal := CountReturned is VarRef ? "uint*" : "ptr"

        result := DllCall("ADVAPI32.dll\LsaEnumerateTrustedDomainsEx", "ptr", PolicyHandle, EnumerationContextMarshal, EnumerationContext, BufferMarshal, Buffer, "uint", PreferedMaximumLength, CountReturnedMarshal, CountReturned, "int")
        return result
    }

    /**
     * The LsaCreateTrustedDomainEx function establishes a new trusted domain by creating a new TrustedDomain object.
     * @param {LSA_HANDLE} PolicyHandle A handle to a <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/policy-object">Policy</a> object. For the object to be created, the caller must have permission to create children on the <b>System</b> container. For information about policy object handles, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/opening-a-policy-object-handle">Opening a Policy Object Handle</a>.
     * @param {Pointer<TRUSTED_DOMAIN_INFORMATION_EX>} TrustedDomainInformation Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-trusted_domain_information_ex">TRUSTED_DOMAIN_INFORMATION_EX</a> structure that contains the name and SID of the new trusted domain.
     * @param {Pointer<TRUSTED_DOMAIN_AUTH_INFORMATION>} AuthenticationInformation Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-trusted_domain_auth_information">TRUSTED_DOMAIN_AUTH_INFORMATION</a> structure that contains authentication information for the new trusted domain.
     * @param {Integer} DesiredAccess An 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-mask">ACCESS_MASK</a> structure that specifies the accesses to be granted for the new trusted domain.
     * @param {Pointer<LSA_HANDLE>} TrustedDomainHandle Receives the LSA policy handle of the remote trusted domain. You can pass this handle into LSA function calls to manage the LSA policy of the trusted domain. 
     * 
     * 
     * 
     * 
     * When your application no longer needs this handle, it should call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsaclose">LsaClose</a> to delete the handle.
     * @returns {NTSTATUS} If the function succeeds, the function returns STATUS_SUCCESS.
     * 
     * If the function fails, it returns an <b>NTSTATUS</b> code, which can be one of the following values or one of the 
     * <a href="/windows/desktop/SecMgmt/management-return-values">LSA Policy Function Return Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_DIRECTORY_SERVICE_REQUIRED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  The target system (specified in the <i>TrustedDomainInformation</i> parameter) for the <a href="/windows/desktop/SecMgmt/trusteddomain-object">TrustedDomain</a> object is not a domain controller.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_INVALID_SID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified SID is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_UNSUCCESSFUL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to determine whether the target system is a domain controller.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * You can use the 
     * <a href="/windows/desktop/api/ntsecapi/nf-ntsecapi-lsantstatustowinerror">LsaNtStatusToWinError</a> function to convert the <b>NTSTATUS</b> code to a Windows error code.
     * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/nf-ntsecapi-lsacreatetrusteddomainex
     * @since windows5.1.2600
     */
    static LsaCreateTrustedDomainEx(PolicyHandle, TrustedDomainInformation, AuthenticationInformation, DesiredAccess, TrustedDomainHandle) {
        PolicyHandle := PolicyHandle is Win32Handle ? NumGet(PolicyHandle, "ptr") : PolicyHandle

        result := DllCall("ADVAPI32.dll\LsaCreateTrustedDomainEx", "ptr", PolicyHandle, "ptr", TrustedDomainInformation, "ptr", AuthenticationInformation, "uint", DesiredAccess, "ptr", TrustedDomainHandle, "int")
        return result
    }

    /**
     * Retrieves forest trust information for the specified Local Security Authority�TrustedDomain object.
     * @param {LSA_HANDLE} PolicyHandle A handle to the <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/policy-object">Policy</a> object for the system.
     * @param {Pointer<LSA_UNICODE_STRING>} TrustedDomainName Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_unicode_string">LSA_UNICODE_STRING</a> structure that contains the name of the <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/trusteddomain-object">TrustedDomain</a> object for which to retrieve forest trust information.
     * @param {Pointer<Pointer<LSA_FOREST_TRUST_INFORMATION>>} ForestTrustInfo Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-lsa_forest_trust_information">LSA_FOREST_TRUST_INFORMATION</a> structure that returns the forest trust information for the <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/trusteddomain-object">TrustedDomain</a> object specified by the <i>TrustedDomainName</i> parameter.
     * @returns {NTSTATUS} If the function succeeds, the return value is STATUS_SUCCESS.
     * 
     * If the function fails, the return value is an NTSTATUS code, which can be one of the following values or one of the <a href="/windows/desktop/SecMgmt/management-return-values">LSA Policy Function Return Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_INVALID_DOMAIN_ROLE</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is legal only on the primary
     *                                     domain controller.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_INVALID_DOMAIN_STATE</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is legal only on domain
     *                                     controllers in the root domain.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_NO_SUCH_DOMAIN</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified <a href="/windows/desktop/SecMgmt/trusteddomain-object">TrustedDomain</a> object does not exist.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_NOT_FOUND</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified <a href="/windows/desktop/SecMgmt/trusteddomain-object">TrustedDomain</a> object does not contain forest trust information.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/nf-ntsecapi-lsaqueryforesttrustinformation
     * @since windowsserver2003
     */
    static LsaQueryForestTrustInformation(PolicyHandle, TrustedDomainName, ForestTrustInfo) {
        PolicyHandle := PolicyHandle is Win32Handle ? NumGet(PolicyHandle, "ptr") : PolicyHandle

        ForestTrustInfoMarshal := ForestTrustInfo is VarRef ? "ptr*" : "ptr"

        result := DllCall("ADVAPI32.dll\LsaQueryForestTrustInformation", "ptr", PolicyHandle, "ptr", TrustedDomainName, ForestTrustInfoMarshal, ForestTrustInfo, "int")
        return result
    }

    /**
     * Sets the forest trust information for a specified Local Security Authority�TrustedDomain object.
     * @param {LSA_HANDLE} PolicyHandle A handle to the <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/policy-object">Policy</a> object for the system.
     * @param {Pointer<LSA_UNICODE_STRING>} TrustedDomainName Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_unicode_string">LSA_UNICODE_STRING</a> structure that contains the name of the <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/trusteddomain-object">TrustedDomain</a> object to which to set the forest trust information specified by the <i>ForestTrustInfo</i> parameter.
     * @param {Pointer<LSA_FOREST_TRUST_INFORMATION>} ForestTrustInfo Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-lsa_forest_trust_information">LSA_FOREST_TRUST_INFORMATION</a> structure that contains the forest trust information to set to the <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/trusteddomain-object">TrustedDomain</a> object specified by the <i>TrustedDomainName</i> parameter.
     * @param {BOOLEAN} CheckOnly Boolean value that specifies whether changes to the <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/trusteddomain-object">TrustedDomain</a> object are persisted. If this value is <b>TRUE</b>, this function will check for collisions with the specified parameters but will not set the  forest trust information specified by the <i>ForestTrustInfo</i> parameter to the <b>TrustedDomain</b> object specified by the <i>TrustedDomainName</i> parameter. If this value is <b>FALSE</b>, the forest trust information will be set to the  <b>TrustedDomain</b> object.
     * @param {Pointer<Pointer<LSA_FOREST_TRUST_COLLISION_INFORMATION>>} CollisionInfo Pointer to a pointer to an <a href="https://docs.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-lsa_forest_trust_collision_information">LSA_FOREST_TRUST_COLLISION_INFORMATION</a> structure that returns information about any collisions that occurred.
     * @returns {NTSTATUS} If the function succeeds, the return value is STATUS_SUCCESS.
     * 
     * If the function fails, the return value is an NTSTATUS code, which can be one of the following values or one of the <a href="/windows/desktop/SecMgmt/management-return-values">LSA Policy Function Return Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_INVALID_DOMAIN_STATE</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is legal only on domain
     *                                     controllers in the root domain.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_INVALID_DOMAIN_ROLE</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is legal only on the primary
     *                                     domain controller.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/nf-ntsecapi-lsasetforesttrustinformation
     * @since windowsserver2003
     */
    static LsaSetForestTrustInformation(PolicyHandle, TrustedDomainName, ForestTrustInfo, CheckOnly, CollisionInfo) {
        PolicyHandle := PolicyHandle is Win32Handle ? NumGet(PolicyHandle, "ptr") : PolicyHandle

        CollisionInfoMarshal := CollisionInfo is VarRef ? "ptr*" : "ptr"

        result := DllCall("ADVAPI32.dll\LsaSetForestTrustInformation", "ptr", PolicyHandle, "ptr", TrustedDomainName, "ptr", ForestTrustInfo, "char", CheckOnly, CollisionInfoMarshal, CollisionInfo, "int")
        return result
    }

    /**
     * Do not use the LSA private data functions. Instead, use the CryptProtectData and CryptUnprotectData functions.
     * @param {LSA_HANDLE} PolicyHandle A handle to a <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/policy-object">Policy</a> object. The handle must have the POLICY_CREATE_SECRET access right if this is the first time data is being stored under the key specified by the <i>KeyName</i> parameter. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/opening-a-policy-object-handle">Opening a Policy Object Handle</a>.
     * @param {Pointer<LSA_UNICODE_STRING>} KeyName Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_unicode_string">LSA_UNICODE_STRING</a> structure containing the name of the key under which the private data is stored.
     * @param {Pointer<LSA_UNICODE_STRING>} PrivateData Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_unicode_string">LSA_UNICODE_STRING</a> structure containing the private data to store. The function encrypts this data before storing it.
     * 
     * If this parameter is <b>NULL</b>, the function deletes any private data stored under the key and deletes the key. Subsequent attempts to retrieve data from the key will return the STATUS_OBJECT_NAME_NOT_FOUND error code.
     * @returns {NTSTATUS} If the function succeeds, the return value is STATUS_SUCCESS.
     * 
     * If the function fails, the return value is an NTSTATUS code. For more information, see 
     * <a href="/windows/desktop/SecMgmt/management-return-values">LSA Policy Function Return Values</a>.
     * 
     * You can use the 
     * <a href="/windows/desktop/api/ntsecapi/nf-ntsecapi-lsantstatustowinerror">LsaNtStatusToWinError</a> function to convert the NTSTATUS code to a Windows error code.
     * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/nf-ntsecapi-lsastoreprivatedata
     * @since windows5.1.2600
     */
    static LsaStorePrivateData(PolicyHandle, KeyName, PrivateData) {
        PolicyHandle := PolicyHandle is Win32Handle ? NumGet(PolicyHandle, "ptr") : PolicyHandle

        result := DllCall("ADVAPI32.dll\LsaStorePrivateData", "ptr", PolicyHandle, "ptr", KeyName, "ptr", PrivateData, "int")
        return result
    }

    /**
     * Do not use the LSA private data functions. Instead, use the CryptProtectData and CryptUnprotectData functions.
     * @param {LSA_HANDLE} PolicyHandle A handle to a <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/policy-object">Policy</a> object. The handle must have the POLICY_GET_PRIVATE_INFORMATION access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/opening-a-policy-object-handle">Opening a Policy Object Handle</a>.
     * @param {Pointer<LSA_UNICODE_STRING>} KeyName Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_unicode_string">LSA_UNICODE_STRING</a> structure that contains the name of the key under which the private data is stored.
     * 
     * To create a specialized object, add one of the following prefixes to the key name.
     * 
     * <table>
     * <tr>
     * <th>Prefix</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="L_"></a><a id="l_"></a><dl>
     * <dt><b>L$</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * For local objects.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="G_"></a><a id="g_"></a><dl>
     * <dt><b>G$</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * For global objects.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="M_"></a><a id="m_"></a><dl>
     * <dt><b>M$</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * For computer objects.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * If you are not creating one of these specialized types, you do not need to specify a key name prefix. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/private-data-object">Private Data Object</a>.
     * @param {Pointer<Pointer<LSA_UNICODE_STRING>>} PrivateData Pointer to a variable that receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_unicode_string">LSA_UNICODE_STRING</a> structure that contains the private data.
     * 
     * When you no longer need the information, pass the returned pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsafreememory">LsaFreeMemory</a>.
     * @returns {NTSTATUS} If the function succeeds, the function returns STATUS_SUCCESS.
     * 
     * If the function fails, it returns an <b>NTSTATUS</b> value, which can be the following value or one of the 
     * <a href="/windows/desktop/SecMgmt/management-return-values">LSA Policy Function Return Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_OBJECT_NAME_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No private data is stored under the name specified by the <i>KeyName</i> parameter.
     * 							
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * You can use the 
     * <a href="/windows/desktop/api/ntsecapi/nf-ntsecapi-lsantstatustowinerror">LsaNtStatusToWinError</a> function to convert the <b>NTSTATUS</b> value to a Windows error code.
     * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/nf-ntsecapi-lsaretrieveprivatedata
     * @since windows5.1.2600
     */
    static LsaRetrievePrivateData(PolicyHandle, KeyName, PrivateData) {
        PolicyHandle := PolicyHandle is Win32Handle ? NumGet(PolicyHandle, "ptr") : PolicyHandle

        PrivateDataMarshal := PrivateData is VarRef ? "ptr*" : "ptr"

        result := DllCall("ADVAPI32.dll\LsaRetrievePrivateData", "ptr", PolicyHandle, "ptr", KeyName, PrivateDataMarshal, PrivateData, "int")
        return result
    }

    /**
     * The LsaNtStatusToWinError function converts an NTSTATUS code returned by an LSA function to a Windows error code.
     * @param {NTSTATUS} Status An NTSTATUS code returned by an LSA function call. This value will be converted to a 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System error code</a>.
     * @returns {Integer} The return value is the Windows error code that corresponds to the <i>Status</i> parameter. If there is no corresponding Windows error code, the return value is ERROR_MR_MID_NOT_FOUND.
     * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/nf-ntsecapi-lsantstatustowinerror
     * @since windows5.1.2600
     */
    static LsaNtStatusToWinError(Status) {
        result := DllCall("ADVAPI32.dll\LsaNtStatusToWinError", "int", Status, "uint")
        return result
    }

    /**
     * 
     * @param {LSA_HANDLE} PolicyHandle 
     * @param {Pointer<LSA_UNICODE_STRING>} TrustedDomainName 
     * @param {Integer} HighestRecordType 
     * @param {Pointer<Pointer<LSA_FOREST_TRUST_INFORMATION2>>} ForestTrustInfo 
     * @returns {NTSTATUS} 
     */
    static LsaQueryForestTrustInformation2(PolicyHandle, TrustedDomainName, HighestRecordType, ForestTrustInfo) {
        PolicyHandle := PolicyHandle is Win32Handle ? NumGet(PolicyHandle, "ptr") : PolicyHandle

        ForestTrustInfoMarshal := ForestTrustInfo is VarRef ? "ptr*" : "ptr"

        result := DllCall("ADVAPI32.dll\LsaQueryForestTrustInformation2", "ptr", PolicyHandle, "ptr", TrustedDomainName, "int", HighestRecordType, ForestTrustInfoMarshal, ForestTrustInfo, "int")
        return result
    }

    /**
     * 
     * @param {LSA_HANDLE} PolicyHandle 
     * @param {Pointer<LSA_UNICODE_STRING>} TrustedDomainName 
     * @param {Integer} HighestRecordType 
     * @param {Pointer<LSA_FOREST_TRUST_INFORMATION2>} ForestTrustInfo 
     * @param {BOOLEAN} CheckOnly 
     * @param {Pointer<Pointer<LSA_FOREST_TRUST_COLLISION_INFORMATION>>} CollisionInfo 
     * @returns {NTSTATUS} 
     */
    static LsaSetForestTrustInformation2(PolicyHandle, TrustedDomainName, HighestRecordType, ForestTrustInfo, CheckOnly, CollisionInfo) {
        PolicyHandle := PolicyHandle is Win32Handle ? NumGet(PolicyHandle, "ptr") : PolicyHandle

        CollisionInfoMarshal := CollisionInfo is VarRef ? "ptr*" : "ptr"

        result := DllCall("ADVAPI32.dll\LsaSetForestTrustInformation2", "ptr", PolicyHandle, "ptr", TrustedDomainName, "int", HighestRecordType, "ptr", ForestTrustInfo, "char", CheckOnly, CollisionInfoMarshal, CollisionInfo, "int")
        return result
    }

    /**
     * Sets system audit policy for one or more audit-policy subcategories.
     * @param {Pointer<AUDIT_POLICY_INFORMATION>} pAuditPolicy A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-audit_policy_information">AUDIT_POLICY_INFORMATION</a> structures. Each structure specifies system audit policy for one audit-policy subcategory.
     * 
     * The <b>AuditCategoryGuid</b> member of these structures is ignored.
     * @param {Integer} dwPolicyCount The number of elements in the <i>pAuditPolicy</i> array.
     * @returns {BOOLEAN} If the function succeeds, it returns <b>TRUE</b>.
     * 
     * If the function fails, it returns <b>FALSE</b>. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. <b>GetLastError</b> may return one of the following error codes defined in WinError.h.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * <dt>5</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have the privilege or access rights necessary to call this function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * <dt>87</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/nf-ntsecapi-auditsetsystempolicy
     * @since windows6.0.6000
     */
    static AuditSetSystemPolicy(pAuditPolicy, dwPolicyCount) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\AuditSetSystemPolicy", "ptr", pAuditPolicy, "uint", dwPolicyCount, "char")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets per-user audit policy in one or more audit subcategories for the specified principal.
     * @param {PSID} pSid A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure associated with the principal for which to set  audit policy. Per-user policy for group SIDs is not currently supported.
     * @param {Pointer<AUDIT_POLICY_INFORMATION>} pAuditPolicy A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-audit_policy_information">AUDIT_POLICY_INFORMATION</a> structures. Each structure specifies per-user audit policy for one audit subcategory.
     * 
     * The <b>AuditCategoryGuid</b> member of these structures is ignored.
     * @param {Integer} dwPolicyCount The number of elements in the <i>pAuditPolicy</i> array.
     * @returns {BOOLEAN} If the function succeeds, it returns <b>TRUE</b>.
     * 
     * If the function fails, it returns <b>FALSE</b>. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. <b>GetLastError</b> may return one of the following error codes defined in WinError.h.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * <dt>5</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have the privilege or access rights necessary to call this function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * <dt>87</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SUCH_USER</b></dt>
     * <dt>1317</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure specified by the <i>pSID</i> parameter is not associated with an existing user.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/nf-ntsecapi-auditsetperuserpolicy
     * @since windows6.0.6000
     */
    static AuditSetPerUserPolicy(pSid, pAuditPolicy, dwPolicyCount) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\AuditSetPerUserPolicy", "ptr", pSid, "ptr", pAuditPolicy, "uint", dwPolicyCount, "char")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves system audit policy for one or more audit-policy subcategories.
     * @param {Pointer<Guid>} pSubCategoryGuids A pointer to an array of <b>GUID</b> values that specify the subcategories for which to query audit policy. For a list of defined audit-policy subcategories, see <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/auditing-constants">Auditing Constants</a>.
     * @param {Integer} dwPolicyCount The number of elements in each of the <i>pSubCategoryGuids</i> and <i>ppAuditPolicy</i> arrays.
     * @param {Pointer<Pointer<AUDIT_POLICY_INFORMATION>>} ppAuditPolicy A pointer to a single buffer that contains both an array of pointers to <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-audit_policy_information">AUDIT_POLICY_INFORMATION</a> structures and the structures themselves. The <b>AUDIT_POLICY_INFORMATION</b> structures specify the system audit policy for the subcategories specified by the <i>pSubCategoryGuids</i> array. 
     * 
     * When you have finished using this buffer, free it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-auditfree">AuditFree</a> function.
     * @returns {BOOLEAN} If the function succeeds, it returns <b>TRUE</b>.
     * 
     * If the function fails, it returns <b>FALSE</b>. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. <b>GetLastError</b> may return one of the following error codes defined in WinError.h.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No per-user audit policy exists for the principal specified by the <i>pSid</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * <dt>5</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have the privilege or access rights necessary to call this function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * <dt>87</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/nf-ntsecapi-auditquerysystempolicy
     * @since windows6.0.6000
     */
    static AuditQuerySystemPolicy(pSubCategoryGuids, dwPolicyCount, ppAuditPolicy) {
        ppAuditPolicyMarshal := ppAuditPolicy is VarRef ? "ptr*" : "ptr"

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\AuditQuerySystemPolicy", "ptr", pSubCategoryGuids, "uint", dwPolicyCount, ppAuditPolicyMarshal, ppAuditPolicy, "char")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves per-user audit policy in one or more audit-policy subcategories for the specified principal.
     * @param {PSID} pSid A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure associated with the principal for which to query  audit policy. Per-user policy for group SIDs is not currently supported.
     * @param {Pointer<Guid>} pSubCategoryGuids A pointer to an array of <b>GUID</b> values that specify the subcategories for which to query audit policy. For a list of defined audit-policy subcategories, see <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/auditing-constants">Auditing Constants</a>.
     * @param {Integer} dwPolicyCount The number of elements in each of the <i>pSubCategoryGuids</i> and <i>ppAuditPolicy</i> arrays.
     * @param {Pointer<Pointer<AUDIT_POLICY_INFORMATION>>} ppAuditPolicy A pointer to a single buffer that contains both an array of pointers to <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-audit_policy_information">AUDIT_POLICY_INFORMATION</a> structures and the structures themselves. The <b>AUDIT_POLICY_INFORMATION</b> structures specify the per-user audit policy for the subcategories specified by the <i>pSubCategoryGuids</i> array. 
     * 
     * When you have finished using this buffer, free it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-auditfree">AuditFree</a> function.
     * @returns {BOOLEAN} If the function succeeds, it returns <b>TRUE</b>.
     * 
     * If the function fails, it returns <b>FALSE</b>. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. <b>GetLastError</b> may return one of the following error codes defined in WinError.h.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No per-user audit policy exists for the principal specified by the <i>pSid</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * <dt>5</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have the privilege or access rights necessary to call this function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * <dt>87</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/nf-ntsecapi-auditqueryperuserpolicy
     * @since windows6.0.6000
     */
    static AuditQueryPerUserPolicy(pSid, pSubCategoryGuids, dwPolicyCount, ppAuditPolicy) {
        ppAuditPolicyMarshal := ppAuditPolicy is VarRef ? "ptr*" : "ptr"

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\AuditQueryPerUserPolicy", "ptr", pSid, "ptr", pSubCategoryGuids, "uint", dwPolicyCount, ppAuditPolicyMarshal, ppAuditPolicy, "char")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Enumerates users for whom per-user auditing policy is specified.
     * @param {Pointer<Pointer<POLICY_AUDIT_SID_ARRAY>>} ppAuditSidArray A pointer to a single buffer that contains both an array of pointers to <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-policy_audit_sid_array">POLICY_AUDIT_SID_ARRAY</a> structures and the structures themselves. The <b>POLICY_AUDIT_SID_ARRAY</b> structures specify the users for whom per-user audit policy is specified. 
     * 
     * When you have finished using this buffer, free it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-auditfree">AuditFree</a> function.
     * @returns {BOOLEAN} If the function succeeds, it returns <b>TRUE</b>.
     * 
     * If the function fails, it returns <b>FALSE</b>. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. <b>GetLastError</b> may return one of the following error codes defined in WinError.h.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * <dt>5</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have the privilege or access rights necessary to call this function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * <dt>87</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/nf-ntsecapi-auditenumerateperuserpolicy
     * @since windows6.0.6000
     */
    static AuditEnumeratePerUserPolicy(ppAuditSidArray) {
        ppAuditSidArrayMarshal := ppAuditSidArray is VarRef ? "ptr*" : "ptr"

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\AuditEnumeratePerUserPolicy", ppAuditSidArrayMarshal, ppAuditSidArray, "char")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Computes the effective audit policy for one or more subcategories for the specified security principal. The function computes effective audit policy by combining system audit policy with per-user policy.
     * @param {PSID} pSid A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure associated with the principal for which to compute effective audit policy. Per-user policy for group SIDs is not currently supported.
     * @param {Pointer<Guid>} pSubCategoryGuids A pointer to an array of <b>GUID</b> values that specify the subcategories for which to compute effective audit policy. For a list of defined subcategories, see <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/auditing-constants">Auditing Constants</a>.
     * @param {Integer} dwPolicyCount The number of elements in each of the <i>pSubCategoryGuids</i> and <i>ppAuditPolicy</i> arrays.
     * @param {Pointer<Pointer<AUDIT_POLICY_INFORMATION>>} ppAuditPolicy A pointer to a single buffer that contains both an array of pointers to <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-audit_policy_information">AUDIT_POLICY_INFORMATION</a> structures and the structures themselves. The <b>AUDIT_POLICY_INFORMATION</b> structures specify the effective audit policy for the subcategories specified by the <i>pSubCategoryGuids</i> array. 
     * 
     * When you have finished using this buffer, free it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-auditfree">AuditFree</a> function.
     * @returns {BOOLEAN} If the function succeeds, it returns <b>TRUE</b>.
     * 
     * If the function fails, it returns <b>FALSE</b>. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. <b>GetLastError</b> may return one of the following error codes defined in WinError.h.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * <dt>5</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have the privilege or access rights necessary to call this function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * <dt>87 (0x57)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
     * <dt>2 (0x2)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No per-user audit policy exists for the principal specified by the <i>pSid</i> parameter.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/nf-ntsecapi-auditcomputeeffectivepolicybysid
     * @since windows6.0.6000
     */
    static AuditComputeEffectivePolicyBySid(pSid, pSubCategoryGuids, dwPolicyCount, ppAuditPolicy) {
        ppAuditPolicyMarshal := ppAuditPolicy is VarRef ? "ptr*" : "ptr"

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\AuditComputeEffectivePolicyBySid", "ptr", pSid, "ptr", pSubCategoryGuids, "uint", dwPolicyCount, ppAuditPolicyMarshal, ppAuditPolicy, "char")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Computes the effective audit policy for one or more subcategories for the security principal associated with the specified token. The function computes effective audit policy by combining system audit policy with per-user policy.
     * @param {HANDLE} hTokenHandle A handle to the access token associated with the principal for which to compute effective audit policy. The token must have been opened with <b>TOKEN_QUERY</b> access. Per-user policy for group SIDs is not currently supported.
     * @param {Pointer<Guid>} pSubCategoryGuids A pointer to an array of <b>GUID</b> values that specify the subcategories for which to compute effective audit policy. For a list of defined subcategories, see <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/auditing-constants">Auditing Constants</a>.
     * @param {Integer} dwPolicyCount The number of elements in each of the <i>pSubCategoryGuids</i> and <i>ppAuditPolicy</i> arrays.
     * @param {Pointer<Pointer<AUDIT_POLICY_INFORMATION>>} ppAuditPolicy A pointer to a single buffer that contains both an array of pointers to <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-audit_policy_information">AUDIT_POLICY_INFORMATION</a> structures and the structures themselves. The <b>AUDIT_POLICY_INFORMATION</b> structures specify the effective audit policy for the subcategories specified by the <i>pSubCategoryGuids</i> array. 
     * 
     * When you have finished using this buffer, free it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-auditfree">AuditFree</a> function.
     * @returns {BOOLEAN} If the function succeeds, it returns <b>TRUE</b>.
     * 
     * If the function fails, it returns <b>FALSE</b>. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. <b>GetLastError</b> may return one of the following error codes defined in WinError.h.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * <dt>5</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have the privilege or access rights necessary to call this function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * <dt>87</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
     * <dt>2 (0x2)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No per-user audit policy exists for the principal specified by the <i>pSid</i> parameter.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/nf-ntsecapi-auditcomputeeffectivepolicybytoken
     * @since windows6.0.6000
     */
    static AuditComputeEffectivePolicyByToken(hTokenHandle, pSubCategoryGuids, dwPolicyCount, ppAuditPolicy) {
        hTokenHandle := hTokenHandle is Win32Handle ? NumGet(hTokenHandle, "ptr") : hTokenHandle

        ppAuditPolicyMarshal := ppAuditPolicy is VarRef ? "ptr*" : "ptr"

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\AuditComputeEffectivePolicyByToken", "ptr", hTokenHandle, "ptr", pSubCategoryGuids, "uint", dwPolicyCount, ppAuditPolicyMarshal, ppAuditPolicy, "char")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Enumerates the available audit-policy categories.
     * @param {Pointer<Pointer<Guid>>} ppAuditCategoriesArray A pointer to a single buffer that contains both an array of pointers to <b>GUID</b> structures and the structures themselves. The <b>GUID</b> structures specify the audit-policy categories available on the computer. 
     * 
     * When you have finished using this buffer, free it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-auditfree">AuditFree</a> function.
     * @param {Pointer<Integer>} pdwCountReturned A pointer to the number of elements in the <i>ppAuditCategoriesArray</i> array.
     * @returns {BOOLEAN} If the function succeeds, it returns <b>TRUE</b>.
     * 
     * If the function fails, it returns <b>FALSE</b>. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/nf-ntsecapi-auditenumeratecategories
     * @since windows6.0.6000
     */
    static AuditEnumerateCategories(ppAuditCategoriesArray, pdwCountReturned) {
        ppAuditCategoriesArrayMarshal := ppAuditCategoriesArray is VarRef ? "ptr*" : "ptr"
        pdwCountReturnedMarshal := pdwCountReturned is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\AuditEnumerateCategories", ppAuditCategoriesArrayMarshal, ppAuditCategoriesArray, pdwCountReturnedMarshal, pdwCountReturned, "char")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Enumerates the available audit-policy subcategories.
     * @param {Pointer<Guid>} pAuditCategoryGuid The <b>GUID</b> of an audit-policy category for which subcategories are enumerated. If the value of the <i>bRetrieveAllSubCategories</i> parameter is <b>TRUE</b>, this parameter is ignored.
     * @param {BOOLEAN} bRetrieveAllSubCategories <b>TRUE</b> to enumerate all audit-policy subcategories; <b>FALSE</b> to enumerate only the subcategories of the audit-policy category specified by the <i>pAuditCategoryGuid</i> parameter.
     * @param {Pointer<Pointer<Guid>>} ppAuditSubCategoriesArray A pointer to a single buffer that contains both an array of pointers to <b>GUID</b> structures and the structures themselves. The <b>GUID</b> structures specify the audit-policy subcategories available on the computer. 
     * 
     * When you have finished using this buffer, free it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-auditfree">AuditFree</a> function.
     * @param {Pointer<Integer>} pdwCountReturned A pointer to the number of audit-policy subcategories returned in the <i>ppAuditSubCategoriesArray</i> array.
     * @returns {BOOLEAN} If the function succeeds, it returns <b>TRUE</b>.
     * 
     * If the function fails, it returns <b>FALSE</b>. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/nf-ntsecapi-auditenumeratesubcategories
     * @since windows6.0.6000
     */
    static AuditEnumerateSubCategories(pAuditCategoryGuid, bRetrieveAllSubCategories, ppAuditSubCategoriesArray, pdwCountReturned) {
        ppAuditSubCategoriesArrayMarshal := ppAuditSubCategoriesArray is VarRef ? "ptr*" : "ptr"
        pdwCountReturnedMarshal := pdwCountReturned is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\AuditEnumerateSubCategories", "ptr", pAuditCategoryGuid, "char", bRetrieveAllSubCategories, ppAuditSubCategoriesArrayMarshal, ppAuditSubCategoriesArray, pdwCountReturnedMarshal, pdwCountReturned, "char")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the display name of the specified audit-policy category.
     * @param {Pointer<Guid>} pAuditCategoryGuid A pointer to a <b>GUID</b> structure that specifies an audit-policy category.
     * @param {Pointer<PWSTR>} ppszCategoryName The address of a pointer to a null-terminated string that contains the display name of the audit-policy category specified by the <i>pAuditCategoryGuid</i> function.
     * 
     * When you have finished using this string, free it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-auditfree">AuditFree</a> function.
     * @returns {BOOLEAN} If the function succeeds, it returns <b>TRUE</b>.
     * 
     * If the function fails, it returns <b>FALSE</b>. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/nf-ntsecapi-auditlookupcategorynamew
     * @since windows6.0.6000
     */
    static AuditLookupCategoryNameW(pAuditCategoryGuid, ppszCategoryName) {
        ppszCategoryNameMarshal := ppszCategoryName is VarRef ? "ptr*" : "ptr"

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\AuditLookupCategoryNameW", "ptr", pAuditCategoryGuid, ppszCategoryNameMarshal, ppszCategoryName, "char")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the display name of the specified audit-policy category.
     * @param {Pointer<Guid>} pAuditCategoryGuid A pointer to a <b>GUID</b> structure that specifies an audit-policy category.
     * @param {Pointer<PSTR>} ppszCategoryName The address of a pointer to a null-terminated string that contains the display name of the audit-policy category specified by the <i>pAuditCategoryGuid</i> function.
     * 
     * When you have finished using this string, free it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-auditfree">AuditFree</a> function.
     * @returns {BOOLEAN} If the function succeeds, it returns <b>TRUE</b>.
     * 
     * If the function fails, it returns <b>FALSE</b>. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/nf-ntsecapi-auditlookupcategorynamea
     * @since windows6.0.6000
     */
    static AuditLookupCategoryNameA(pAuditCategoryGuid, ppszCategoryName) {
        ppszCategoryNameMarshal := ppszCategoryName is VarRef ? "ptr*" : "ptr"

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\AuditLookupCategoryNameA", "ptr", pAuditCategoryGuid, ppszCategoryNameMarshal, ppszCategoryName, "char")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the display name of the specified audit-policy subcategory.
     * @param {Pointer<Guid>} pAuditSubCategoryGuid A pointer to a <b>GUID</b> structure that specifies an audit-policy subcategory.
     * @param {Pointer<PWSTR>} ppszSubCategoryName The address of a pointer to a null-terminated string that contains the display name of the audit-policy subcategory specified by the <i>pAuditSubCategoryGuid</i> parameter.
     * 
     * When you have finished using this string, free it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-auditfree">AuditFree</a> function.
     * @returns {BOOLEAN} If the function succeeds, it returns <b>TRUE</b>.
     * 
     * If the function fails, it returns <b>FALSE</b>. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/nf-ntsecapi-auditlookupsubcategorynamew
     * @since windows6.0.6000
     */
    static AuditLookupSubCategoryNameW(pAuditSubCategoryGuid, ppszSubCategoryName) {
        ppszSubCategoryNameMarshal := ppszSubCategoryName is VarRef ? "ptr*" : "ptr"

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\AuditLookupSubCategoryNameW", "ptr", pAuditSubCategoryGuid, ppszSubCategoryNameMarshal, ppszSubCategoryName, "char")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the display name of the specified audit-policy subcategory.
     * @param {Pointer<Guid>} pAuditSubCategoryGuid A pointer to a <b>GUID</b> structure that specifies an audit-policy subcategory.
     * @param {Pointer<PSTR>} ppszSubCategoryName The address of a pointer to a null-terminated string that contains the display name of the audit-policy subcategory specified by the <i>pAuditSubCategoryGuid</i> parameter.
     * 
     * When you have finished using this string, free it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-auditfree">AuditFree</a> function.
     * @returns {BOOLEAN} If the function succeeds, it returns <b>TRUE</b>.
     * 
     * If the function fails, it returns <b>FALSE</b>. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/nf-ntsecapi-auditlookupsubcategorynamea
     * @since windows6.0.6000
     */
    static AuditLookupSubCategoryNameA(pAuditSubCategoryGuid, ppszSubCategoryName) {
        ppszSubCategoryNameMarshal := ppszSubCategoryName is VarRef ? "ptr*" : "ptr"

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\AuditLookupSubCategoryNameA", "ptr", pAuditSubCategoryGuid, ppszSubCategoryNameMarshal, ppszSubCategoryName, "char")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves an element of the POLICY_AUDIT_EVENT_TYPE enumeration that represents the specified audit-policy category.
     * @param {Pointer<Guid>} pAuditCategoryGuid A pointer to a <b>GUID</b> structure that specifies an audit-policy category.
     * @param {Pointer<Integer>} pAuditCategoryId A pointer to an element of the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ne-ntsecapi-policy_audit_event_type">POLICY_AUDIT_EVENT_TYPE</a> enumeration that represents the audit-policy category specified by the <i>pAuditCategoryGuid</i> parameter.
     * @returns {BOOLEAN} If the function succeeds, it returns <b>TRUE</b>.
     * 
     * If the function fails, it returns <b>FALSE</b>. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/nf-ntsecapi-auditlookupcategoryidfromcategoryguid
     * @since windows6.0.6000
     */
    static AuditLookupCategoryIdFromCategoryGuid(pAuditCategoryGuid, pAuditCategoryId) {
        pAuditCategoryIdMarshal := pAuditCategoryId is VarRef ? "int*" : "ptr"

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\AuditLookupCategoryIdFromCategoryGuid", "ptr", pAuditCategoryGuid, pAuditCategoryIdMarshal, pAuditCategoryId, "char")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves a GUID structure that represents the specified audit-policy category.
     * @param {Integer} AuditCategoryId An element of the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ne-ntsecapi-policy_audit_event_type">POLICY_AUDIT_EVENT_TYPE</a> enumeration that specifies an audit-policy category.
     * @param {Pointer<Guid>} pAuditCategoryGuid A pointer to a <b>GUID</b> structure that represents the audit-policy category specified by the  <i>AuditCategoryId</i>
     * @returns {BOOLEAN} If the function succeeds, it returns <b>TRUE</b>.
     * 
     * If the function fails, it returns <b>FALSE</b>. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/nf-ntsecapi-auditlookupcategoryguidfromcategoryid
     * @since windows6.0.6000
     */
    static AuditLookupCategoryGuidFromCategoryId(AuditCategoryId, pAuditCategoryGuid) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\AuditLookupCategoryGuidFromCategoryId", "int", AuditCategoryId, "ptr", pAuditCategoryGuid, "char")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets a security descriptor that delegates access to audit policy.
     * @param {Integer} SecurityInformation A <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a> value that specifies which parts of the security descriptor this function sets. Only <b>SACL_SECURITY_INFORMATION</b> and <b>DACL_SECURITY_INFORMATION</b> are supported. Any other values are ignored. If neither <b>SACL_SECURITY_INFORMATION</b> nor <b>DACL_SECURITY_INFORMATION</b> is specified, this function fails and returns <b>ERROR_INVALID_PARAMETER</b>.
     * @param {PSECURITY_DESCRIPTOR} pSecurityDescriptor A pointer to a well-formed <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure that controls access to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">Audit security object</a>. If this parameter is <b>NULL</b>, the function fails and returns <b>ERROR_INVALID_PARAMETER</b>.
     * @returns {BOOLEAN} If the function succeeds, it returns <b>TRUE</b>.
     * 
     * If the function fails, it returns <b>FALSE</b>. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. <b>GetLastError</b> may return one of the following error codes defined in WinError.h.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * <dt>5</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have the privilege or access rights necessary to call this function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * <dt>87</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/nf-ntsecapi-auditsetsecurity
     * @since windows6.0.6000
     */
    static AuditSetSecurity(SecurityInformation, pSecurityDescriptor) {
        pSecurityDescriptor := pSecurityDescriptor is Win32Handle ? NumGet(pSecurityDescriptor, "ptr") : pSecurityDescriptor

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\AuditSetSecurity", "uint", SecurityInformation, "ptr", pSecurityDescriptor, "char")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves security descriptor that delegates access to audit policy.
     * @param {Integer} SecurityInformation A <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a> value that specifies which parts of the security descriptor this function sets. Only <b>SACL_SECURITY_INFORMATION</b> and <b>DACL_SECURITY_INFORMATION</b> are supported. Any other values are ignored. If neither <b>SACL_SECURITY_INFORMATION</b> nor <b>DACL_SECURITY_INFORMATION</b> is specified, this function fails and returns <b>ERROR_INVALID_PARAMETER</b>.
     * @param {Pointer<PSECURITY_DESCRIPTOR>} ppSecurityDescriptor The address of a pointer to a well-formed <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure that controls access to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">Audit security object</a>.
     * @returns {BOOLEAN} If the function succeeds, it returns <b>TRUE</b>.
     * 
     * If the function fails, it returns <b>FALSE</b>. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. <b>GetLastError</b> may return one of the following error codes defined in WinError.h.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * <dt>5</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have the privilege or access rights necessary to call this function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * <dt>87</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/nf-ntsecapi-auditquerysecurity
     * @since windows6.0.6000
     */
    static AuditQuerySecurity(SecurityInformation, ppSecurityDescriptor) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\AuditQuerySecurity", "uint", SecurityInformation, "ptr", ppSecurityDescriptor, "char")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets a global system access control list (SACL) that delegates access to the audit messages.
     * @param {PWSTR} ObjectTypeName A pointer to a null-terminated string specifying the type of object being created or accessed. For setting the global SACL on files, this should be set to "File" and  for setting the global SACL on registry, this should be set to "Key". This string appears in any audit message that the function generates.
     * @param {Pointer<ACL>} Acl A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a> structure.
     * @returns {BOOLEAN} If the function succeeds, it returns <b>TRUE</b>.
     * 
     * If the function fails, it returns <b>FALSE</b>. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. <b>GetLastError</b> may return one of the following error codes defined in WinError.h.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * <dt>5</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have the privilege or access rights necessary to call this function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * <dt>87</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/nf-ntsecapi-auditsetglobalsaclw
     * @since windows6.1
     */
    static AuditSetGlobalSaclW(ObjectTypeName, Acl) {
        ObjectTypeName := ObjectTypeName is String ? StrPtr(ObjectTypeName) : ObjectTypeName

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\AuditSetGlobalSaclW", "ptr", ObjectTypeName, "ptr", Acl, "char")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets a global system access control list (SACL) that delegates access to the audit messages.
     * @param {PSTR} ObjectTypeName A pointer to a null-terminated string specifying the type of object being created or accessed. For setting the global SACL on files, this should be set to "File" and  for setting the global SACL on registry, this should be set to "Key". This string appears in any audit message that the function generates.
     * @param {Pointer<ACL>} Acl A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a> structure.
     * @returns {BOOLEAN} If the function succeeds, it returns <b>TRUE</b>.
     * 
     * If the function fails, it returns <b>FALSE</b>. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. <b>GetLastError</b> may return one of the following error codes defined in WinError.h.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * <dt>5</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have the privilege or access rights necessary to call this function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * <dt>87</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/nf-ntsecapi-auditsetglobalsacla
     * @since windows6.1
     */
    static AuditSetGlobalSaclA(ObjectTypeName, Acl) {
        ObjectTypeName := ObjectTypeName is String ? StrPtr(ObjectTypeName) : ObjectTypeName

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\AuditSetGlobalSaclA", "ptr", ObjectTypeName, "ptr", Acl, "char")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves a global system access control list (SACL) that delegates access to the audit messages.
     * @param {PWSTR} ObjectTypeName A pointer to a null-terminated string specifying the type of object being accessed. This parameter must be either "File" or "Key", depending on whether the object is a file or registry. This string appears in any audit message that the function generates.
     * @param {Pointer<Pointer<ACL>>} Acl A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a> structure that contains the SACL information.  This should be freed later by calling the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> function.
     * @returns {BOOLEAN} If the function succeeds, it returns <b>TRUE</b>.
     * 
     * If the function fails, it returns <b>FALSE</b>. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. <b>GetLastError</b> may return one of the following error codes defined in WinError.h.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * <dt>5</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have the privilege or access rights necessary to call this function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * <dt>87</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/nf-ntsecapi-auditqueryglobalsaclw
     * @since windows6.1
     */
    static AuditQueryGlobalSaclW(ObjectTypeName, Acl) {
        ObjectTypeName := ObjectTypeName is String ? StrPtr(ObjectTypeName) : ObjectTypeName

        AclMarshal := Acl is VarRef ? "ptr*" : "ptr"

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\AuditQueryGlobalSaclW", "ptr", ObjectTypeName, AclMarshal, Acl, "char")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves a global system access control list (SACL) that delegates access to the audit messages.
     * @param {PSTR} ObjectTypeName A pointer to a null-terminated string specifying the type of object being accessed. This parameter must be either "File" or "Key", depending on whether the object is a file or registry. This string appears in any audit message that the function generates.
     * @param {Pointer<Pointer<ACL>>} Acl A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a> structure that contains the SACL information.  This should be freed later by calling the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> function.
     * @returns {BOOLEAN} If the function succeeds, it returns <b>TRUE</b>.
     * 
     * If the function fails, it returns <b>FALSE</b>. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. <b>GetLastError</b> may return one of the following error codes defined in WinError.h.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * <dt>5</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have the privilege or access rights necessary to call this function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * <dt>87</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/nf-ntsecapi-auditqueryglobalsacla
     * @since windows6.1
     */
    static AuditQueryGlobalSaclA(ObjectTypeName, Acl) {
        ObjectTypeName := ObjectTypeName is String ? StrPtr(ObjectTypeName) : ObjectTypeName

        AclMarshal := Acl is VarRef ? "ptr*" : "ptr"

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\AuditQueryGlobalSaclA", "ptr", ObjectTypeName, AclMarshal, Acl, "char")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Frees the memory allocated by audit functions for the specified buffer.
     * @param {Pointer<Void>} Buffer A pointer to the buffer to free.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/nf-ntsecapi-auditfree
     * @since windows6.0.6000
     */
    static AuditFree(Buffer) {
        BufferMarshal := Buffer is VarRef ? "ptr" : "ptr"

        DllCall("ADVAPI32.dll\AuditFree", BufferMarshal, Buffer)
    }

    /**
     * The AcquireCredentialsHandle (CredSSP) function acquires a handle to preexisting credentials of a security principal.
     * @param {PWSTR} pszPrincipal 
     * @param {PWSTR} pszPackage 
     * @param {Integer} fCredentialUse 
     * @param {Pointer<Void>} pvLogonId A pointer to a  <a href="https://docs.microsoft.com/windows/desktop/SecGloss/l-gly">locally unique identifier</a> (LUID) that identifies the user. This parameter is provided for file-system processes such as network redirectors. This parameter can be <b>NULL</b>.
     * @param {Pointer<Void>} pAuthData A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/credssp/ns-credssp-credssp_cred">CREDSSP_CRED</a> structure that specifies authentication data for both Schannel and Negotiate packages.
     * @param {Pointer<SEC_GET_KEY_FN>} pGetKeyFn Reserved. This parameter is not used and should be set to <b>NULL</b>.
     * @param {Pointer<Void>} pvGetKeyArgument Reserved. This parameter must be set to <b>NULL</b>.
     * @param {Pointer<SecHandle>} phCredential A pointer to the <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/sspi-handles">CredHandle</a> structure that will receive the credential handle.
     * @returns {Integer} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/timestamp">TimeStamp</a> structure that receives the time at which the returned credentials expire. The structure value received depends on the security package, which must specify the value in local time.
     * @see https://docs.microsoft.com/windows/win32/api//sspi/nf-sspi-acquirecredentialshandlew
     * @since windows6.0.6000
     */
    static AcquireCredentialsHandleW(pszPrincipal, pszPackage, fCredentialUse, pvLogonId, pAuthData, pGetKeyFn, pvGetKeyArgument, phCredential) {
        pszPrincipal := pszPrincipal is String ? StrPtr(pszPrincipal) : pszPrincipal
        pszPackage := pszPackage is String ? StrPtr(pszPackage) : pszPackage

        pvLogonIdMarshal := pvLogonId is VarRef ? "ptr" : "ptr"
        pAuthDataMarshal := pAuthData is VarRef ? "ptr" : "ptr"
        pvGetKeyArgumentMarshal := pvGetKeyArgument is VarRef ? "ptr" : "ptr"

        result := DllCall("SECUR32.dll\AcquireCredentialsHandleW", "ptr", pszPrincipal, "ptr", pszPackage, "uint", fCredentialUse, pvLogonIdMarshal, pvLogonId, pAuthDataMarshal, pAuthData, "ptr", pGetKeyFn, pvGetKeyArgumentMarshal, pvGetKeyArgument, "ptr", phCredential, "int64*", &ptsExpiry := 0, "int")
        if(result != 0)
            throw OSError(result)

        return ptsExpiry
    }

    /**
     * The AcquireCredentialsHandle (CredSSP) function acquires a handle to preexisting credentials of a security principal.
     * @param {PSTR} pszPrincipal A pointer to a null-terminated string that specifies the name of the principal whose credentials the handle will reference.
     * 
     * <div class="alert"><b>Note</b>  If the process that requests the handle does not have access to the credentials, the function returns an error. A null string indicates that the process requires a handle to the credentials of the user under whose <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security context</a> it is executing.</div>
     * <div> </div>
     * @param {PSTR} pszPackage A pointer to a null-terminated string that specifies the name of the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security package</a> with which these credentials will be used. This is a security package name returned in the <b>Name</b> member of a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secpkginfoa">SecPkgInfo</a> structure returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-enumeratesecuritypackagesa">EnumerateSecurityPackages</a> function. After a context is established, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-querycontextattributesa">QueryContextAttributes (CredSSP)</a> can be called with <i>ulAttribute</i> set to <b>SECPKG_ATTR_PACKAGE_INFO</b> to return information on the security package in use.
     * @param {Integer} fCredentialUse 
     * @param {Pointer<Void>} pvLogonId A pointer to a  <a href="https://docs.microsoft.com/windows/desktop/SecGloss/l-gly">locally unique identifier</a> (LUID) that identifies the user. This parameter is provided for file-system processes such as network redirectors. This parameter can be <b>NULL</b>.
     * @param {Pointer<Void>} pAuthData A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/credssp/ns-credssp-credssp_cred">CREDSSP_CRED</a> structure that specifies authentication data for both Schannel and Negotiate packages.
     * @param {Pointer<SEC_GET_KEY_FN>} pGetKeyFn Reserved. This parameter is not used and should be set to <b>NULL</b>.
     * @param {Pointer<Void>} pvGetKeyArgument Reserved. This parameter must be set to <b>NULL</b>.
     * @param {Pointer<SecHandle>} phCredential A pointer to the <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/sspi-handles">CredHandle</a> structure that will receive the credential handle.
     * @returns {Integer} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/timestamp">TimeStamp</a> structure that receives the time at which the returned credentials expire. The structure value received depends on the security package, which must specify the value in local time.
     * @see https://docs.microsoft.com/windows/win32/api//sspi/nf-sspi-acquirecredentialshandlea
     * @since windows6.0.6000
     */
    static AcquireCredentialsHandleA(pszPrincipal, pszPackage, fCredentialUse, pvLogonId, pAuthData, pGetKeyFn, pvGetKeyArgument, phCredential) {
        pszPrincipal := pszPrincipal is String ? StrPtr(pszPrincipal) : pszPrincipal
        pszPackage := pszPackage is String ? StrPtr(pszPackage) : pszPackage

        pvLogonIdMarshal := pvLogonId is VarRef ? "ptr" : "ptr"
        pAuthDataMarshal := pAuthData is VarRef ? "ptr" : "ptr"
        pvGetKeyArgumentMarshal := pvGetKeyArgument is VarRef ? "ptr" : "ptr"

        result := DllCall("SECUR32.dll\AcquireCredentialsHandleA", "ptr", pszPrincipal, "ptr", pszPackage, "uint", fCredentialUse, pvLogonIdMarshal, pvLogonId, pAuthDataMarshal, pAuthData, "ptr", pGetKeyFn, pvGetKeyArgumentMarshal, pvGetKeyArgument, "ptr", phCredential, "int64*", &ptsExpiry := 0, "int")
        if(result != 0)
            throw OSError(result)

        return ptsExpiry
    }

    /**
     * Notifies the security system that the credentials are no longer needed.
     * @param {Pointer<SecHandle>} phCredential A pointer to the <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/sspi-handles">CredHandle</a> handle obtained by using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-acquirecredentialshandlea">AcquireCredentialsHandle (General)</a> function.
     * @returns {HRESULT} If the function succeeds, the function returns SEC_E_OK.
     * 
     * If the function fails, it returns the following error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle passed to the function is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//sspi/nf-sspi-freecredentialshandle
     * @since windows5.1.2600
     */
    static FreeCredentialsHandle(phCredential) {
        result := DllCall("SECUR32.dll\FreeCredentialsHandle", "ptr", phCredential, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SecHandle>} hCredentials 
     * @param {PWSTR} pszPrincipal 
     * @param {PWSTR} pszPackage 
     * @param {Integer} fCredentialUse 
     * @param {Pointer<Void>} pAuthData 
     * @param {Pointer<SEC_GET_KEY_FN>} pGetKeyFn 
     * @param {Pointer<Void>} pvGetKeyArgument 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-addcredentialsw
     */
    static AddCredentialsW(hCredentials, pszPrincipal, pszPackage, fCredentialUse, pAuthData, pGetKeyFn, pvGetKeyArgument) {
        pszPrincipal := pszPrincipal is String ? StrPtr(pszPrincipal) : pszPrincipal
        pszPackage := pszPackage is String ? StrPtr(pszPackage) : pszPackage

        pAuthDataMarshal := pAuthData is VarRef ? "ptr" : "ptr"
        pvGetKeyArgumentMarshal := pvGetKeyArgument is VarRef ? "ptr" : "ptr"

        result := DllCall("SECUR32.dll\AddCredentialsW", "ptr", hCredentials, "ptr", pszPrincipal, "ptr", pszPackage, "uint", fCredentialUse, pAuthDataMarshal, pAuthData, "ptr", pGetKeyFn, pvGetKeyArgumentMarshal, pvGetKeyArgument, "int64*", &ptsExpiry := 0, "int")
        if(result != 0)
            throw OSError(result)

        return ptsExpiry
    }

    /**
     * 
     * @param {Pointer<SecHandle>} hCredentials 
     * @param {PSTR} pszPrincipal 
     * @param {PSTR} pszPackage 
     * @param {Integer} fCredentialUse 
     * @param {Pointer<Void>} pAuthData 
     * @param {Pointer<SEC_GET_KEY_FN>} pGetKeyFn 
     * @param {Pointer<Void>} pvGetKeyArgument 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-addcredentialsa
     */
    static AddCredentialsA(hCredentials, pszPrincipal, pszPackage, fCredentialUse, pAuthData, pGetKeyFn, pvGetKeyArgument) {
        pszPrincipal := pszPrincipal is String ? StrPtr(pszPrincipal) : pszPrincipal
        pszPackage := pszPackage is String ? StrPtr(pszPackage) : pszPackage

        pAuthDataMarshal := pAuthData is VarRef ? "ptr" : "ptr"
        pvGetKeyArgumentMarshal := pvGetKeyArgument is VarRef ? "ptr" : "ptr"

        result := DllCall("SECUR32.dll\AddCredentialsA", "ptr", hCredentials, "ptr", pszPrincipal, "ptr", pszPackage, "uint", fCredentialUse, pAuthDataMarshal, pAuthData, "ptr", pGetKeyFn, pvGetKeyArgumentMarshal, pvGetKeyArgument, "int64*", &ptsExpiry := 0, "int")
        if(result != 0)
            throw OSError(result)

        return ptsExpiry
    }

    /**
     * Changes the password for a Windows domain account by using the specified Security Support Provider.
     * @param {Pointer<Integer>} pszPackageName The name of the provider to use. The value of this parameter must be either "Kerberos", "Negotiate", or "NTLM".
     * @param {Pointer<Integer>} pszDomainName The domain of the account for which to change the password.
     * @param {Pointer<Integer>} pszAccountName The user name of the account for which to change the password.
     * @param {Pointer<Integer>} pszOldPassword The old password to be changed.
     * @param {Pointer<Integer>} pszNewPassword The new password for the specified account.
     * @param {BOOLEAN} bImpersonating <b>TRUE</b> if the calling process is running as the client; otherwise, <b>FALSE</b>.
     * @param {Integer} dwReserved Reserved. Must be set to zero.
     * @param {Pointer<SecBufferDesc>} pOutput On input, a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbufferdesc">SecBufferDesc</a> structure. The <b>SecBufferDesc</b> structure must contain a single buffer of type <b>SECBUFFER_CHANGE_PASS_RESPONSE</b>. On output, the <b>pvBuffer</b> member of that structure points to a <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-domain_password_information">DOMAIN_PASSWORD_INFORMATION</a> structure.
     * @returns {HRESULT} If the function succeeds, the function returns SEC_E_OK.
     * 
     * If the function fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//sspi/nf-sspi-changeaccountpasswordw
     * @since windows6.0.6000
     */
    static ChangeAccountPasswordW(pszPackageName, pszDomainName, pszAccountName, pszOldPassword, pszNewPassword, bImpersonating, dwReserved, pOutput) {
        pszPackageNameMarshal := pszPackageName is VarRef ? "ushort*" : "ptr"
        pszDomainNameMarshal := pszDomainName is VarRef ? "ushort*" : "ptr"
        pszAccountNameMarshal := pszAccountName is VarRef ? "ushort*" : "ptr"
        pszOldPasswordMarshal := pszOldPassword is VarRef ? "ushort*" : "ptr"
        pszNewPasswordMarshal := pszNewPassword is VarRef ? "ushort*" : "ptr"

        result := DllCall("SECUR32.dll\ChangeAccountPasswordW", pszPackageNameMarshal, pszPackageName, pszDomainNameMarshal, pszDomainName, pszAccountNameMarshal, pszAccountName, pszOldPasswordMarshal, pszOldPassword, pszNewPasswordMarshal, pszNewPassword, "char", bImpersonating, "uint", dwReserved, "ptr", pOutput, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Changes the password for a Windows domain account by using the specified Security Support Provider.
     * @param {Pointer<Integer>} pszPackageName The name of the provider to use. The value of this parameter must be either "Kerberos", "Negotiate", or "NTLM".
     * @param {Pointer<Integer>} pszDomainName The domain of the account for which to change the password.
     * @param {Pointer<Integer>} pszAccountName The user name of the account for which to change the password.
     * @param {Pointer<Integer>} pszOldPassword The old password to be changed.
     * @param {Pointer<Integer>} pszNewPassword The new password for the specified account.
     * @param {BOOLEAN} bImpersonating <b>TRUE</b> if the calling process is running as the client; otherwise, <b>FALSE</b>.
     * @param {Integer} dwReserved Reserved. Must be set to zero.
     * @param {Pointer<SecBufferDesc>} pOutput On input, a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbufferdesc">SecBufferDesc</a> structure. The <b>SecBufferDesc</b> structure must contain a single buffer of type <b>SECBUFFER_CHANGE_PASS_RESPONSE</b>. On output, the <b>pvBuffer</b> member of that structure points to a <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-domain_password_information">DOMAIN_PASSWORD_INFORMATION</a> structure.
     * @returns {HRESULT} If the function succeeds, the function returns SEC_E_OK.
     * 
     * If the function fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//sspi/nf-sspi-changeaccountpassworda
     * @since windows6.0.6000
     */
    static ChangeAccountPasswordA(pszPackageName, pszDomainName, pszAccountName, pszOldPassword, pszNewPassword, bImpersonating, dwReserved, pOutput) {
        pszPackageNameMarshal := pszPackageName is VarRef ? "char*" : "ptr"
        pszDomainNameMarshal := pszDomainName is VarRef ? "char*" : "ptr"
        pszAccountNameMarshal := pszAccountName is VarRef ? "char*" : "ptr"
        pszOldPasswordMarshal := pszOldPassword is VarRef ? "char*" : "ptr"
        pszNewPasswordMarshal := pszNewPassword is VarRef ? "char*" : "ptr"

        result := DllCall("SECUR32.dll\ChangeAccountPasswordA", pszPackageNameMarshal, pszPackageName, pszDomainNameMarshal, pszDomainName, pszAccountNameMarshal, pszAccountName, pszOldPasswordMarshal, pszOldPassword, pszNewPasswordMarshal, pszNewPassword, "char", bImpersonating, "uint", dwReserved, "ptr", pOutput, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Initiates the client side, outbound security context from a credential handle.
     * @param {Pointer<SecHandle>} phCredential A handle to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">credentials</a> returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-acquirecredentialshandlea">AcquireCredentialsHandle (General)</a>. This handle is used to build the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security context</a>. The <b>InitializeSecurityContext (General)</b> function requires at least OUTBOUND credentials.
     * @param {Pointer<SecHandle>} phContext A pointer to a <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/sspi-handles">CtxtHandle</a> structure. On the first call to <b>InitializeSecurityContext (General)</b>, this pointer is <b>NULL</b>. On the second call, this parameter is a pointer to the handle to the partially formed context returned in the <i>phNewContext</i> parameter by the first call.
     * 
     * This parameter is optional with the Microsoft Digest SSP and can be set to <b>NULL</b>.
     * 
     * When using the Schannel SSP, on the first call to <b>InitializeSecurityContext (General)</b>, specify <b>NULL</b>. On future calls, specify the token received in the <i>phNewContext</i> parameter after the first call to this function.
     * @param {Pointer<Integer>} pszTargetName 
     * @param {Integer} fContextReq Bit flags that indicate requests for the context. Not all packages can support all requirements. Flags used for this parameter are prefixed with ISC_REQ_, for example,  ISC_REQ_DELEGATE. This parameter can be one or more of the following attributes flags.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISC_REQ_ALLOCATE_MEMORY"></a><a id="isc_req_allocate_memory"></a><dl>
     * <dt><b>ISC_REQ_ALLOCATE_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The security package allocates output buffers for you. When you have finished using the output buffers, free them by calling the  
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-freecontextbuffer">FreeContextBuffer</a> function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISC_REQ_CONFIDENTIALITY"></a><a id="isc_req_confidentiality"></a><dl>
     * <dt><b>ISC_REQ_CONFIDENTIALITY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Encrypt messages by using the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-encryptmessage">EncryptMessage</a> function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISC_REQ_CONNECTION"></a><a id="isc_req_connection"></a><dl>
     * <dt><b>ISC_REQ_CONNECTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The security context will not handle formatting messages. This value is the default for the Kerberos, Negotiate, and NTLM security packages.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISC_REQ_DELEGATE"></a><a id="isc_req_delegate"></a><dl>
     * <dt><b>ISC_REQ_DELEGATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The server can use the context to authenticate to other servers as the client. The ISC_REQ_MUTUAL_AUTH flag must be set for this flag to work. Valid for Kerberos. Ignore this flag for <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">constrained delegation</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISC_REQ_EXTENDED_ERROR"></a><a id="isc_req_extended_error"></a><dl>
     * <dt><b>ISC_REQ_EXTENDED_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When errors occur, the remote party will be notified.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISC_REQ_HTTP"></a><a id="isc_req_http"></a><dl>
     * <dt><b>ISC_REQ_HTTP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use Digest for HTTP. Omit this flag to use Digest as a SASL mechanism.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISC_REQ_INTEGRITY"></a><a id="isc_req_integrity"></a><dl>
     * <dt><b>ISC_REQ_INTEGRITY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Sign messages and verify signatures by using the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-encryptmessage">EncryptMessage</a> and <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-makesignature">MakeSignature</a> functions.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISC_REQ_MANUAL_CRED_VALIDATION"></a><a id="isc_req_manual_cred_validation"></a><dl>
     * <dt><b>ISC_REQ_MANUAL_CRED_VALIDATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Schannel must not authenticate the server automatically.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISC_REQ_MUTUAL_AUTH"></a><a id="isc_req_mutual_auth"></a><dl>
     * <dt><b>ISC_REQ_MUTUAL_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The mutual authentication policy of the service will be satisfied.
     * 
     * <div class="alert"><b>Caution</b>  This does not necessarily mean that mutual authentication is performed, only that the authentication policy of the service is satisfied. To ensure that mutual authentication is performed, call the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-querycontextattributesa">QueryContextAttributes (General)</a> function.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISC_REQ_NO_INTEGRITY"></a><a id="isc_req_no_integrity"></a><dl>
     * <dt><b>ISC_REQ_NO_INTEGRITY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If this flag is set, the <b>ISC_REQ_INTEGRITY</b> flag is ignored.
     * 
     * This value is supported only by the Negotiate and Kerberos <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security packages</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISC_REQ_REPLAY_DETECT"></a><a id="isc_req_replay_detect"></a><dl>
     * <dt><b>ISC_REQ_REPLAY_DETECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Detect replayed messages that have been encoded by using the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-encryptmessage">EncryptMessage</a> or <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-makesignature">MakeSignature</a> functions.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISC_REQ_SEQUENCE_DETECT"></a><a id="isc_req_sequence_detect"></a><dl>
     * <dt><b>ISC_REQ_SEQUENCE_DETECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Detect messages received out of sequence.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISC_REQ_STREAM"></a><a id="isc_req_stream"></a><dl>
     * <dt><b>ISC_REQ_STREAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Support a stream-oriented connection.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISC_REQ_USE_SESSION_KEY"></a><a id="isc_req_use_session_key"></a><dl>
     * <dt><b>ISC_REQ_USE_SESSION_KEY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A new <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">session key</a> must be negotiated.
     * 
     * This value is supported only by the Kerberos <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security package</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISC_REQ_USE_SUPPLIED_CREDS"></a><a id="isc_req_use_supplied_creds"></a><dl>
     * <dt><b>ISC_REQ_USE_SUPPLIED_CREDS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Schannel must not attempt to supply credentials for the client automatically.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * The requested attributes may not be supported by the client. For more information, see the <i>pfContextAttr</i> parameter.
     * 
     * For  further descriptions of the various attributes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/context-requirements">Context Requirements</a>.
     * @param {Integer} Reserved1 This parameter is reserved and must be set to zero.
     * @param {Integer} TargetDataRep The data representation, such as byte ordering, on the target. This parameter can be either SECURITY_NATIVE_DREP or SECURITY_NETWORK_DREP.
     * 
     * This parameter is not used with Digest or Schannel. Set it to zero.
     * @param {Pointer<SecBufferDesc>} pInput A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbufferdesc">SecBufferDesc</a> structure that contains pointers to the buffers supplied as input to the package. Unless the client context was initiated by the server, the value of this parameter must be <b>NULL</b> on the first call to the function. On subsequent calls to the function or when the client context was initiated by the server, the value of this parameter is a pointer to a buffer allocated with enough memory to hold the token returned by the remote computer.
     * @param {Integer} Reserved2 This parameter is reserved and must be set to zero.
     * @param {Pointer<SecHandle>} phNewContext A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/sspi-handles">CtxtHandle</a> structure. On the first call to <b>InitializeSecurityContext (General)</b>, this pointer receives the new context handle. On the second call, <i>phNewContext</i> can be the same as the handle specified in the <i>phContext</i> parameter.
     * 
     * When using the Schannel SSP,  on calls after the first call, pass the  handle returned here as the <i>phContext</i> parameter and specify <b>NULL</b> for <i>phNewContext</i>.
     * @param {Pointer<SecBufferDesc>} pOutput A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbufferdesc">SecBufferDesc</a> structure that contains pointers to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbuffer">SecBuffer</a> structure that receives the output data. If a buffer was typed as SEC_READWRITE in the input, it will be there on output. The system will allocate a buffer for the security token if requested (through ISC_REQ_ALLOCATE_MEMORY) and fill in the address in the buffer descriptor for the security token.
     * 
     * When using the Microsoft Digest SSP,  this parameter receives the challenge response that must be sent to the server.
     * 
     * When using the Schannel SSP, if the ISC_REQ_ALLOCATE_MEMORY flag is specified, the Schannel SSP will allocate memory for  the buffer and put the appropriate information in the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbufferdesc">SecBufferDesc</a>. In addition, the caller must pass in a buffer of type <b>SECBUFFER_ALERT</b>. On output, if an alert is generated, this buffer  contains information about that alert, and the function fails.
     * @param {Pointer<Integer>} pfContextAttr A pointer to a variable to receive a set of bit flags that indicate the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">attributes</a> of the established <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">context</a>. For a description of the various attributes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/context-requirements">Context Requirements</a>. 
     * 
     * Flags used for this parameter are prefixed with ISC_RET, such as ISC_RET_DELEGATE. 
     * 
     * 
     *  For a list of valid values, see the <i>fContextReq</i> parameter.
     * 
     * Do not check for security-related attributes until the final function call returns successfully. Attribute flags that are not related to security, such as the ASC_RET_ALLOCATED_MEMORY flag, can be checked before the final return.
     * 
     * <div class="alert"><b>Note</b>  Particular context attributes can change during negotiation with a remote peer.</div>
     * <div> </div>
     * @param {Pointer<Integer>} ptsExpiry A pointer to a <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/timestamp">TimeStamp</a> structure that receives the expiration time of the context. It is recommended that the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security package</a> always return this value in local time. This parameter is optional and <b>NULL</b> should be passed for short-lived clients.
     * 
     * There is no expiration time for Microsoft Digest SSP security contexts or <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">credentials</a>.
     * @returns {HRESULT} If the function succeeds, the function returns one of the following success codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_I_COMPLETE_AND_CONTINUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The client must call <a href="/windows/desktop/api/sspi/nf-sspi-completeauthtoken">CompleteAuthToken</a> and then pass the output to the server. The client then waits for a returned token and passes it, in another call, to <a href="/windows/desktop/api/sspi/nf-sspi-initializesecuritycontexta">InitializeSecurityContext (General)</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_I_COMPLETE_NEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The client must finish building the message and then call the 
     * <a href="/windows/desktop/api/sspi/nf-sspi-completeauthtoken">CompleteAuthToken</a> function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_I_CONTINUE_NEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The client must send the output token to the server and wait for a return token. The returned token is then passed in another call to <a href="/windows/desktop/api/sspi/nf-sspi-initializesecuritycontexta">InitializeSecurityContext (General)</a>. The output token can be empty.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_I_INCOMPLETE_CREDENTIALS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use with Schannel. The server has requested client authentication, and the supplied credentials either do not include a certificate or the certificate was not issued by a <a href="/windows/desktop/SecGloss/c-gly">certification authority</a> that is trusted by the server. For more information, see Remarks.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_INCOMPLETE_MESSAGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use with Schannel. Data for the whole message was not read from the wire.
     * 
     * When this value is returned, the <i>pInput</i> buffer contains a <a href="/windows/desktop/api/sspi/ns-sspi-secbuffer">SecBuffer</a> structure with a <b>BufferType</b> member of <b>SECBUFFER_MISSING</b>. The <b>cbBuffer</b> member of <b>SecBuffer</b> contains a value that indicates the number of additional bytes that the function must read from the client before this function succeeds. While this number is not always accurate, using it can help improve performance by avoiding multiple calls to this function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="/windows/desktop/SecGloss/s-gly">security context</a> was successfully initialized. There is no need for another <a href="/windows/desktop/api/sspi/nf-sspi-initializesecuritycontexta">InitializeSecurityContext (General)</a> call. If the function returns an output token, that is, if the SECBUFFER_TOKEN in <i>pOutput</i> is of nonzero length, that token must be sent to the server.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * If the function fails, the function returns one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_INSUFFICIENT_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is not enough memory available to complete the requested action.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_INTERNAL_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred that did not map to an SSPI error code.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle passed to the function is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_INVALID_TOKEN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The error is due to a malformed input token, such as a token corrupted in transit, a token of incorrect size, or a token passed into the wrong security package. Passing a token to the wrong package can happen if the client and server did not negotiate the proper security package.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_LOGON_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The logon failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_NO_AUTHENTICATING_AUTHORITY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No authority could be contacted for authentication. The domain name of the authenticating party could be wrong, the domain could be unreachable, or there might have been a trust relationship failure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_NO_CREDENTIALS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No credentials are available in the <a href="/windows/desktop/SecGloss/s-gly">security package</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_TARGET_UNKNOWN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The target was not recognized.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_UNSUPPORTED_FUNCTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A context attribute flag that is not valid (ISC_REQ_DELEGATE or ISC_REQ_PROMPT_FOR_CREDS) was specified in the <i>fContextReq</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_WRONG_PRINCIPAL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The principal that received the authentication request is not the same as the one passed into the <i>pszTargetName</i> parameter. This indicates a failure in mutual authentication.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//sspi/nf-sspi-initializesecuritycontextw
     * @since windows5.1.2600
     */
    static InitializeSecurityContextW(phCredential, phContext, pszTargetName, fContextReq, Reserved1, TargetDataRep, pInput, Reserved2, phNewContext, pOutput, pfContextAttr, ptsExpiry) {
        pszTargetNameMarshal := pszTargetName is VarRef ? "ushort*" : "ptr"
        pfContextAttrMarshal := pfContextAttr is VarRef ? "uint*" : "ptr"
        ptsExpiryMarshal := ptsExpiry is VarRef ? "int64*" : "ptr"

        result := DllCall("SECUR32.dll\InitializeSecurityContextW", "ptr", phCredential, "ptr", phContext, pszTargetNameMarshal, pszTargetName, "uint", fContextReq, "uint", Reserved1, "uint", TargetDataRep, "ptr", pInput, "uint", Reserved2, "ptr", phNewContext, "ptr", pOutput, pfContextAttrMarshal, pfContextAttr, ptsExpiryMarshal, ptsExpiry, "int")
        return result
    }

    /**
     * Initiates the client side, outbound security context from a credential handle.
     * @param {Pointer<SecHandle>} phCredential A handle to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">credentials</a> returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-acquirecredentialshandlea">AcquireCredentialsHandle (General)</a>. This handle is used to build the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security context</a>. The <b>InitializeSecurityContext (General)</b> function requires at least OUTBOUND credentials.
     * @param {Pointer<SecHandle>} phContext A pointer to a <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/sspi-handles">CtxtHandle</a> structure. On the first call to <b>InitializeSecurityContext (General)</b>, this pointer is <b>NULL</b>. On the second call, this parameter is a pointer to the handle to the partially formed context returned in the <i>phNewContext</i> parameter by the first call.
     * 
     * This parameter is optional with the Microsoft Digest SSP and can be set to <b>NULL</b>.
     * 
     * When using the Schannel SSP, on the first call to <b>InitializeSecurityContext (General)</b>, specify <b>NULL</b>. On future calls, specify the token received in the <i>phNewContext</i> parameter after the first call to this function.
     * @param {Pointer<Integer>} pszTargetName TBD
     * @param {Integer} fContextReq Bit flags that indicate requests for the context. Not all packages can support all requirements. Flags used for this parameter are prefixed with ISC_REQ_, for example,  ISC_REQ_DELEGATE. This parameter can be one or more of the following attributes flags.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISC_REQ_ALLOCATE_MEMORY"></a><a id="isc_req_allocate_memory"></a><dl>
     * <dt><b>ISC_REQ_ALLOCATE_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The security package allocates output buffers for you. When you have finished using the output buffers, free them by calling the  
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-freecontextbuffer">FreeContextBuffer</a> function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISC_REQ_CONFIDENTIALITY"></a><a id="isc_req_confidentiality"></a><dl>
     * <dt><b>ISC_REQ_CONFIDENTIALITY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Encrypt messages by using the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-encryptmessage">EncryptMessage</a> function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISC_REQ_CONNECTION"></a><a id="isc_req_connection"></a><dl>
     * <dt><b>ISC_REQ_CONNECTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The security context will not handle formatting messages. This value is the default for the Kerberos, Negotiate, and NTLM security packages.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISC_REQ_DELEGATE"></a><a id="isc_req_delegate"></a><dl>
     * <dt><b>ISC_REQ_DELEGATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The server can use the context to authenticate to other servers as the client. The ISC_REQ_MUTUAL_AUTH flag must be set for this flag to work. Valid for Kerberos. Ignore this flag for <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">constrained delegation</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISC_REQ_EXTENDED_ERROR"></a><a id="isc_req_extended_error"></a><dl>
     * <dt><b>ISC_REQ_EXTENDED_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When errors occur, the remote party will be notified.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISC_REQ_HTTP"></a><a id="isc_req_http"></a><dl>
     * <dt><b>ISC_REQ_HTTP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use Digest for HTTP. Omit this flag to use Digest as a SASL mechanism.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISC_REQ_INTEGRITY"></a><a id="isc_req_integrity"></a><dl>
     * <dt><b>ISC_REQ_INTEGRITY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Sign messages and verify signatures by using the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-encryptmessage">EncryptMessage</a> and <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-makesignature">MakeSignature</a> functions.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISC_REQ_MANUAL_CRED_VALIDATION"></a><a id="isc_req_manual_cred_validation"></a><dl>
     * <dt><b>ISC_REQ_MANUAL_CRED_VALIDATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Schannel must not authenticate the server automatically.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISC_REQ_MUTUAL_AUTH"></a><a id="isc_req_mutual_auth"></a><dl>
     * <dt><b>ISC_REQ_MUTUAL_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The mutual authentication policy of the service will be satisfied.
     * 
     * <div class="alert"><b>Caution</b>  This does not necessarily mean that mutual authentication is performed, only that the authentication policy of the service is satisfied. To ensure that mutual authentication is performed, call the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-querycontextattributesa">QueryContextAttributes (General)</a> function.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISC_REQ_NO_INTEGRITY"></a><a id="isc_req_no_integrity"></a><dl>
     * <dt><b>ISC_REQ_NO_INTEGRITY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If this flag is set, the <b>ISC_REQ_INTEGRITY</b> flag is ignored.
     * 
     * This value is supported only by the Negotiate and Kerberos <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security packages</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISC_REQ_REPLAY_DETECT"></a><a id="isc_req_replay_detect"></a><dl>
     * <dt><b>ISC_REQ_REPLAY_DETECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Detect replayed messages that have been encoded by using the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-encryptmessage">EncryptMessage</a> or <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-makesignature">MakeSignature</a> functions.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISC_REQ_SEQUENCE_DETECT"></a><a id="isc_req_sequence_detect"></a><dl>
     * <dt><b>ISC_REQ_SEQUENCE_DETECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Detect messages received out of sequence.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISC_REQ_STREAM"></a><a id="isc_req_stream"></a><dl>
     * <dt><b>ISC_REQ_STREAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Support a stream-oriented connection.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISC_REQ_USE_SESSION_KEY"></a><a id="isc_req_use_session_key"></a><dl>
     * <dt><b>ISC_REQ_USE_SESSION_KEY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A new <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">session key</a> must be negotiated.
     * 
     * This value is supported only by the Kerberos <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security package</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISC_REQ_USE_SUPPLIED_CREDS"></a><a id="isc_req_use_supplied_creds"></a><dl>
     * <dt><b>ISC_REQ_USE_SUPPLIED_CREDS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Schannel must not attempt to supply credentials for the client automatically.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * The requested attributes may not be supported by the client. For more information, see the <i>pfContextAttr</i> parameter.
     * 
     * For  further descriptions of the various attributes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/context-requirements">Context Requirements</a>.
     * @param {Integer} Reserved1 This parameter is reserved and must be set to zero.
     * @param {Integer} TargetDataRep The data representation, such as byte ordering, on the target. This parameter can be either SECURITY_NATIVE_DREP or SECURITY_NETWORK_DREP.
     * 
     * This parameter is not used with Digest or Schannel. Set it to zero.
     * @param {Pointer<SecBufferDesc>} pInput A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbufferdesc">SecBufferDesc</a> structure that contains pointers to the buffers supplied as input to the package. Unless the client context was initiated by the server, the value of this parameter must be <b>NULL</b> on the first call to the function. On subsequent calls to the function or when the client context was initiated by the server, the value of this parameter is a pointer to a buffer allocated with enough memory to hold the token returned by the remote computer.
     * @param {Integer} Reserved2 This parameter is reserved and must be set to zero.
     * @param {Pointer<SecHandle>} phNewContext A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/sspi-handles">CtxtHandle</a> structure. On the first call to <b>InitializeSecurityContext (General)</b>, this pointer receives the new context handle. On the second call, <i>phNewContext</i> can be the same as the handle specified in the <i>phContext</i> parameter.
     * 
     * When using the Schannel SSP,  on calls after the first call, pass the  handle returned here as the <i>phContext</i> parameter and specify <b>NULL</b> for <i>phNewContext</i>.
     * @param {Pointer<SecBufferDesc>} pOutput A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbufferdesc">SecBufferDesc</a> structure that contains pointers to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbuffer">SecBuffer</a> structure that receives the output data. If a buffer was typed as SEC_READWRITE in the input, it will be there on output. The system will allocate a buffer for the security token if requested (through ISC_REQ_ALLOCATE_MEMORY) and fill in the address in the buffer descriptor for the security token.
     * 
     * When using the Microsoft Digest SSP,  this parameter receives the challenge response that must be sent to the server.
     * 
     * When using the Schannel SSP, if the ISC_REQ_ALLOCATE_MEMORY flag is specified, the Schannel SSP will allocate memory for  the buffer and put the appropriate information in the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbufferdesc">SecBufferDesc</a>. In addition, the caller must pass in a buffer of type <b>SECBUFFER_ALERT</b>. On output, if an alert is generated, this buffer  contains information about that alert, and the function fails.
     * @param {Pointer<Integer>} pfContextAttr A pointer to a variable to receive a set of bit flags that indicate the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">attributes</a> of the established <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">context</a>. For a description of the various attributes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/context-requirements">Context Requirements</a>. 
     * 
     * Flags used for this parameter are prefixed with ISC_RET, such as ISC_RET_DELEGATE. 
     * 
     * 
     *  For a list of valid values, see the <i>fContextReq</i> parameter.
     * 
     * Do not check for security-related attributes until the final function call returns successfully. Attribute flags that are not related to security, such as the ASC_RET_ALLOCATED_MEMORY flag, can be checked before the final return.
     * 
     * <div class="alert"><b>Note</b>  Particular context attributes can change during negotiation with a remote peer.</div>
     * <div> </div>
     * @param {Pointer<Integer>} ptsExpiry A pointer to a <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/timestamp">TimeStamp</a> structure that receives the expiration time of the context. It is recommended that the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security package</a> always return this value in local time. This parameter is optional and <b>NULL</b> should be passed for short-lived clients.
     * 
     * There is no expiration time for Microsoft Digest SSP security contexts or <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">credentials</a>.
     * @returns {HRESULT} If the function succeeds, the function returns one of the following success codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_I_COMPLETE_AND_CONTINUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The client must call <a href="/windows/desktop/api/sspi/nf-sspi-completeauthtoken">CompleteAuthToken</a> and then pass the output to the server. The client then waits for a returned token and passes it, in another call, to <a href="/windows/desktop/api/sspi/nf-sspi-initializesecuritycontexta">InitializeSecurityContext (General)</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_I_COMPLETE_NEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The client must finish building the message and then call the 
     * <a href="/windows/desktop/api/sspi/nf-sspi-completeauthtoken">CompleteAuthToken</a> function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_I_CONTINUE_NEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The client must send the output token to the server and wait for a return token. The returned token is then passed in another call to <a href="/windows/desktop/api/sspi/nf-sspi-initializesecuritycontexta">InitializeSecurityContext (General)</a>. The output token can be empty.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_I_INCOMPLETE_CREDENTIALS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use with Schannel. The server has requested client authentication, and the supplied credentials either do not include a certificate or the certificate was not issued by a <a href="/windows/desktop/SecGloss/c-gly">certification authority</a> that is trusted by the server. For more information, see Remarks.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_INCOMPLETE_MESSAGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use with Schannel. Data for the whole message was not read from the wire.
     * 
     * When this value is returned, the <i>pInput</i> buffer contains a <a href="/windows/desktop/api/sspi/ns-sspi-secbuffer">SecBuffer</a> structure with a <b>BufferType</b> member of <b>SECBUFFER_MISSING</b>. The <b>cbBuffer</b> member of <b>SecBuffer</b> contains a value that indicates the number of additional bytes that the function must read from the client before this function succeeds. While this number is not always accurate, using it can help improve performance by avoiding multiple calls to this function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="/windows/desktop/SecGloss/s-gly">security context</a> was successfully initialized. There is no need for another <a href="/windows/desktop/api/sspi/nf-sspi-initializesecuritycontexta">InitializeSecurityContext (General)</a> call. If the function returns an output token, that is, if the SECBUFFER_TOKEN in <i>pOutput</i> is of nonzero length, that token must be sent to the server.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * If the function fails, the function returns one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_INSUFFICIENT_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is not enough memory available to complete the requested action.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_INTERNAL_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred that did not map to an SSPI error code.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle passed to the function is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_INVALID_TOKEN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The error is due to a malformed input token, such as a token corrupted in transit, a token of incorrect size, or a token passed into the wrong security package. Passing a token to the wrong package can happen if the client and server did not negotiate the proper security package.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_LOGON_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The logon failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_NO_AUTHENTICATING_AUTHORITY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No authority could be contacted for authentication. The domain name of the authenticating party could be wrong, the domain could be unreachable, or there might have been a trust relationship failure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_NO_CREDENTIALS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No credentials are available in the <a href="/windows/desktop/SecGloss/s-gly">security package</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_TARGET_UNKNOWN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The target was not recognized.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_UNSUPPORTED_FUNCTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A context attribute flag that is not valid (ISC_REQ_DELEGATE or ISC_REQ_PROMPT_FOR_CREDS) was specified in the <i>fContextReq</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_WRONG_PRINCIPAL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The principal that received the authentication request is not the same as the one passed into the <i>pszTargetName</i> parameter. This indicates a failure in mutual authentication.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//sspi/nf-sspi-initializesecuritycontexta
     * @since windows5.1.2600
     */
    static InitializeSecurityContextA(phCredential, phContext, pszTargetName, fContextReq, Reserved1, TargetDataRep, pInput, Reserved2, phNewContext, pOutput, pfContextAttr, ptsExpiry) {
        pszTargetNameMarshal := pszTargetName is VarRef ? "char*" : "ptr"
        pfContextAttrMarshal := pfContextAttr is VarRef ? "uint*" : "ptr"
        ptsExpiryMarshal := ptsExpiry is VarRef ? "int64*" : "ptr"

        result := DllCall("SECUR32.dll\InitializeSecurityContextA", "ptr", phCredential, "ptr", phContext, pszTargetNameMarshal, pszTargetName, "uint", fContextReq, "uint", Reserved1, "uint", TargetDataRep, "ptr", pInput, "uint", Reserved2, "ptr", phNewContext, "ptr", pOutput, pfContextAttrMarshal, pfContextAttr, ptsExpiryMarshal, ptsExpiry, "int")
        return result
    }

    /**
     * Lets the server component of a transport application establish a security context between the server and a remote client.
     * @param {Pointer<SecHandle>} phCredential A handle to the server credentials. To retrieve this handle, the server calls the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-acquirecredentialshandlea">AcquireCredentialsHandle (CredSSP)</a> function with either the SECPKG_CRED_INBOUND or SECPKG_CRED_BOTH flag set.
     * @param {Pointer<SecHandle>} phContext A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/sspi-handles">CtxtHandle</a> structure. On the first call to <b>AcceptSecurityContext (CredSSP)</b>, this pointer is <b>NULL</b>. On subsequent calls, <i>phContext</i> specifies the partially formed context returned in the <i>phNewContext</i> parameter by the first call.
     * @param {Pointer<SecBufferDesc>} pInput A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbufferdesc">SecBufferDesc</a> structure generated by a client call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-initializesecuritycontexta">InitializeSecurityContext (CredSSP)</a>. The structure contains the input buffer descriptor.
     * 
     * The first buffer must be of type <b>SECBUFFER_TOKEN</b> and contain the security token received from the client. The second buffer should be of type <b>SECBUFFER_EMPTY</b>.
     * @param {Integer} fContextReq 
     * @param {Integer} TargetDataRep The data representation, such as byte ordering, on the target. This parameter can be either <b>SECURITY_NATIVE_DREP</b> or <b>SECURITY_NETWORK_DREP</b>.
     * @param {Pointer<SecHandle>} phNewContext A pointer to a <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/sspi-handles">CtxtHandle</a> structure. On the first call to <b>AcceptSecurityContext (CredSSP)</b>, this pointer receives the new context handle. On subsequent calls, <i>phNewContext</i> can be the same as the handle specified in the <i>phContext</i> parameter.
     * @param {Pointer<SecBufferDesc>} pOutput A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbufferdesc">SecBufferDesc</a> structure that contains the output buffer descriptor. This buffer is sent to the client for input into additional calls to <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-initializesecuritycontexta">InitializeSecurityContext (CredSSP)</a>. An output buffer may be generated even if the function returns SEC_E_OK. Any buffer generated must be sent back to the client application.
     * 
     * On output, this buffer receives a token for the security context. The token must be sent to the client. The function can also return a buffer of type SECBUFFER_EXTRA.
     * @param {Pointer<Integer>} pfContextAttr A pointer to a set of bit flags that indicate the attributes of the established context. For a description of the various attributes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/context-requirements">Context Requirements</a>. Flags used for this parameter are prefixed with ASC_RET, for example, ASC_RET_DELEGATE.
     * 
     * Do not check for security-related attributes until the final function call returns successfully. Attribute flags not related to security, such as the ASC_RET_ALLOCATED_MEMORY flag, can be checked before the final return.
     * @param {Pointer<Integer>} ptsExpiry A pointer to a <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/timestamp">TimeStamp</a> structure that receives the expiration time of the context. We recommend that the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security package</a> always return this value in local time.
     * 
     * <div class="alert"><b>Note</b>  Until the last call of the authentication process, the expiration time for the context can be incorrect because more information will be provided during later stages of the negotiation. Therefore, <i>ptsTimeStamp</i> must be <b>NULL</b> until the last call to the function.</div>
     * <div> </div>
     * @returns {HRESULT} This function returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_INCOMPLETE_MESSAGE</b></dt>
     * <dt>0x80090318L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded. The data in the input buffer is incomplete. The application must read additional data from the client and call <a href="/windows/desktop/api/sspi/nf-sspi-acceptsecuritycontext">AcceptSecurityContext (CredSSP)</a> again.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_INSUFFICIENT_MEMORY</b></dt>
     * <dt>0x80090300L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function failed. There is not enough memory available to complete the requested action.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_INTERNAL_ERROR</b></dt>
     * <dt>0x80090304L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function failed. An error occurred that did not map to an SSPI error code.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_INVALID_HANDLE</b></dt>
     * <dt>0x80100003L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function failed. The handle passed to the function is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_INVALID_TOKEN</b></dt>
     * <dt>0x80090308L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function failed. The token passed to the function is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_LOGON_DENIED</b></dt>
     * <dt>0x8009030CL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The logon failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_NO_AUTHENTICATING_AUTHORITY</b></dt>
     * <dt>0x80090311L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function failed. No authority could be contacted for authentication. This could be due to the following conditions:
     * 
     * <ul>
     * <li>The domain name of the authenticating party is incorrect.</li>
     * <li>The domain is unavailable.</li>
     * <li>The trust relationship has failed.</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_NO_CREDENTIALS</b></dt>
     * <dt>0x8009030EL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function failed. The <a href="/windows/desktop/SecGloss/c-gly">credentials</a> handle specified in the <i>phCredential</i> parameter is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_OK</b></dt>
     * <dt>0x00000000L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded. The security context received from the client was accepted. If the function generated an output token, the token must be sent to the client process.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_UNSUPPORTED_FUNCTION</b></dt>
     * <dt>0x80090302L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function failed. The <i>fContextReq</i> parameter specified a context attribute flag (ASC_REQ_DELEGATE or ASC_REQ_PROMPT_FOR_CREDS) that was not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_I_COMPLETE_AND_CONTINUE</b></dt>
     * <dt>0x00090314L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded. The server must call 
     * <a href="/windows/desktop/api/sspi/nf-sspi-completeauthtoken">CompleteAuthToken</a> and pass the output token to the client. The server must then wait for a return token from the client before making another call to <a href="/windows/desktop/api/sspi/nf-sspi-acceptsecuritycontext">AcceptSecurityContext (CredSSP)</a>.
     * 							
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_I_COMPLETE_NEEDED</b></dt>
     * <dt>0x00090313L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded. The server must finish building the message from the client before calling <a href="/windows/desktop/api/sspi/nf-sspi-completeauthtoken">CompleteAuthToken</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_I_CONTINUE_NEEDED</b></dt>
     * <dt>0x00090312L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded. The server must send the output token to the client and wait for a returned token. The returned token should be passed in <i>pInput</i> for another call to <a href="/windows/desktop/api/sspi/nf-sspi-acceptsecuritycontext">AcceptSecurityContext (CredSSP)</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//sspi/nf-sspi-acceptsecuritycontext
     * @since windows6.0.6000
     */
    static AcceptSecurityContext(phCredential, phContext, pInput, fContextReq, TargetDataRep, phNewContext, pOutput, pfContextAttr, ptsExpiry) {
        pfContextAttrMarshal := pfContextAttr is VarRef ? "uint*" : "ptr"
        ptsExpiryMarshal := ptsExpiry is VarRef ? "int64*" : "ptr"

        result := DllCall("SECUR32.dll\AcceptSecurityContext", "ptr", phCredential, "ptr", phContext, "ptr", pInput, "uint", fContextReq, "uint", TargetDataRep, "ptr", phNewContext, "ptr", pOutput, pfContextAttrMarshal, pfContextAttr, ptsExpiryMarshal, ptsExpiry, "int")
        return result
    }

    /**
     * Completes an authentication token.
     * @param {Pointer<SecHandle>} phContext A handle of the context that needs to be completed.
     * @param {Pointer<SecBufferDesc>} pToken A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbufferdesc">SecBufferDesc</a> structure that contains the buffer descriptor for the entire message.
     * @returns {HRESULT} If the function succeeds, the function returns SEC_E_OK.
     * 						
     * 
     * If the function fails, it returns one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle that was passed to the function is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_INVALID_TOKEN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The token that was passed to the function is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_OUT_OF_SEQUENCE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The client's security context was located, but the message number is incorrect. This return value is used with the Digest SSP.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_MESSAGE_ALTERED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The client's security context was located, but the client's message has been tampered with. This return value is used with the Digest SSP.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_INTERNAL_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred that did not map to an SSPI error code.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//sspi/nf-sspi-completeauthtoken
     * @since windows5.1.2600
     */
    static CompleteAuthToken(phContext, pToken) {
        result := DllCall("SECUR32.dll\CompleteAuthToken", "ptr", phContext, "ptr", pToken, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Allows a server to impersonate a client by using a token previously obtained by a call to AcceptSecurityContext (General) or QuerySecurityContextToken.
     * @param {Pointer<SecHandle>} phContext The handle of the context to impersonate. This handle must have been obtained by a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-acceptsecuritycontext">AcceptSecurityContext (General)</a> function.
     * @returns {HRESULT} If the function succeeds, the function returns SEC_E_OK.
     * 
     * If the function fails, it returns the following error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle passed to the function is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_NO_IMPERSONATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The client could not be impersonated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_UNSUPPORTED_FUNCTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This value is returned by Schannel kernel mode to indicate that this function is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//sspi/nf-sspi-impersonatesecuritycontext
     * @since windows5.1.2600
     */
    static ImpersonateSecurityContext(phContext) {
        result := DllCall("SECUR32.dll\ImpersonateSecurityContext", "ptr", phContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Allows a security package to discontinue the impersonation of the caller and restore its own security context.
     * @param {Pointer<SecHandle>} phContext Handle of the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security context</a> being impersonated. This handle must have been obtained in the call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-acceptsecuritycontext">AcceptSecurityContext (General)</a> function and used in the call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-impersonatesecuritycontext">ImpersonateSecurityContext</a> function.
     * @returns {HRESULT} If the function succeeds, the return value is SEC_E_OK.
     * 
     * If the function fails, the return value can be one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle passed to the function is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//sspi/nf-sspi-revertsecuritycontext
     * @since windows5.1.2600
     */
    static RevertSecurityContext(phContext) {
        result := DllCall("SECUR32.dll\RevertSecurityContext", "ptr", phContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Obtains the access token for a client security context and uses it directly.
     * @param {Pointer<SecHandle>} phContext Handle of the context to query.
     * @returns {Pointer<Void>} Returned handle to the access token.
     * @see https://docs.microsoft.com/windows/win32/api//sspi/nf-sspi-querysecuritycontexttoken
     * @since windows5.1.2600
     */
    static QuerySecurityContextToken(phContext) {
        result := DllCall("SECUR32.dll\QuerySecurityContextToken", "ptr", phContext, "ptr*", &Token := 0, "int")
        if(result != 0)
            throw OSError(result)

        return Token
    }

    /**
     * Deletes the local data structures associated with the specified security context initiated by a previous call to the InitializeSecurityContext (General) function or the AcceptSecurityContext (General) function.
     * @param {Pointer<SecHandle>} phContext Handle of the security context to delete.
     * @returns {HRESULT} If the function succeeds or the handle has already been deleted, the return value is <b>SEC_E_OK</b>.
     * 
     * If the function fails, the return value can be the following error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle passed to the function is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//sspi/nf-sspi-deletesecuritycontext
     * @since windows5.1.2600
     */
    static DeleteSecurityContext(phContext) {
        result := DllCall("SECUR32.dll\DeleteSecurityContext", "ptr", phContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Provides a way to apply a control token to a security context.
     * @param {Pointer<SecHandle>} phContext A handle to the context to which the token is applied.
     * 
     * For information about the way the Schannel SSP notifies the remote party of the shutdown, see the Remarks section of <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-decryptmessage">DecryptMessage (Schannel)</a>. For additional information on the use of this function, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/shutting-down-an-schannel-connection">Shutting Down an Schannel Connection</a>.
     * @param {Pointer<SecBufferDesc>} pInput A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbufferdesc">SecBufferDesc</a> structure that contains a pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbuffer">SecBuffer</a> structure that contains the input token to apply to the context.
     * @returns {HRESULT} If the function succeeds, the function returns SEC_E_OK.
     * 
     * If the function fails, it returns a nonzero error code. The following error code is one of the possible error codes that can be returned.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_UNSUPPORTED_FUNCTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This value is returned by Schannel kernel mode to indicate that this function is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//sspi/nf-sspi-applycontroltoken
     * @since windows5.1.2600
     */
    static ApplyControlToken(phContext, pInput) {
        result := DllCall("SECUR32.dll\ApplyControlToken", "ptr", phContext, "ptr", pInput, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Lets a transport application query the Credential Security Support Provider (CredSSP) security package for certain attributes of a security context.
     * @param {Pointer<SecHandle>} phContext A  handle to the security context to be queried.
     * @param {Integer} ulAttribute 
     * @returns {Void} A pointer to a structure that receives the attributes. The structure type depends on the value of the <i>ulAttribute</i> parameter.
     * @see https://docs.microsoft.com/windows/win32/api//sspi/nf-sspi-querycontextattributesw
     * @since windows6.0.6000
     */
    static QueryContextAttributesW(phContext, ulAttribute) {
        result := DllCall("SECUR32.dll\QueryContextAttributesW", "ptr", phContext, "uint", ulAttribute, "ptr", &pBuffer := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pBuffer
    }

    /**
     * Enables a transport application to query a security package for certain attributes of a security context.
     * @param {Pointer<SecHandle>} phContext A handle to the security context to be queried.
     * @param {Integer} ulAttribute 
     * @param {Pointer} pBuffer A pointer to a structure that receives the attributes. The type of structure pointed to depends on the value specified in the <i>ulAttribute</i> parameter.
     * @param {Integer} cbBuffer The size, in bytes, of the <i>pBuffer</i> parameter.
     * @returns {HRESULT} If the function succeeds, the return value is SEC_E_OK.
     * 
     * If the function fails, the return value is a nonzero error code.
     * @see https://docs.microsoft.com/windows/win32/api//sspi/nf-sspi-querycontextattributesexw
     * @since windows5.1.2600
     */
    static QueryContextAttributesExW(phContext, ulAttribute, pBuffer, cbBuffer) {
        result := DllCall("SspiCli.dll\QueryContextAttributesExW", "ptr", phContext, "uint", ulAttribute, "ptr", pBuffer, "uint", cbBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Lets a transport application query the Credential Security Support Provider (CredSSP) security package for certain attributes of a security context.
     * @param {Pointer<SecHandle>} phContext A  handle to the security context to be queried.
     * @param {Integer} ulAttribute 
     * @returns {Void} A pointer to a structure that receives the attributes. The structure type depends on the value of the <i>ulAttribute</i> parameter.
     * @see https://docs.microsoft.com/windows/win32/api//sspi/nf-sspi-querycontextattributesa
     * @since windows6.0.6000
     */
    static QueryContextAttributesA(phContext, ulAttribute) {
        result := DllCall("SECUR32.dll\QueryContextAttributesA", "ptr", phContext, "uint", ulAttribute, "ptr", &pBuffer := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pBuffer
    }

    /**
     * Enables a transport application to query a security package for certain attributes of a security context.
     * @param {Pointer<SecHandle>} phContext A handle to the security context to be queried.
     * @param {Integer} ulAttribute 
     * @param {Pointer} pBuffer A pointer to a structure that receives the attributes. The type of structure pointed to depends on the value specified in the <i>ulAttribute</i> parameter.
     * @param {Integer} cbBuffer The size, in bytes, of the <i>pBuffer</i> parameter.
     * @returns {HRESULT} If the function succeeds, the return value is SEC_E_OK.
     * 
     * If the function fails, the return value is a nonzero error code.
     * @see https://docs.microsoft.com/windows/win32/api//sspi/nf-sspi-querycontextattributesexa
     * @since windows5.1.2600
     */
    static QueryContextAttributesExA(phContext, ulAttribute, pBuffer, cbBuffer) {
        result := DllCall("SspiCli.dll\QueryContextAttributesExA", "ptr", phContext, "uint", ulAttribute, "ptr", pBuffer, "uint", cbBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Enables a transport application to set attributes of a security context for a security package. This function is supported only by the Schannel security package.
     * @param {Pointer<SecHandle>} phContext A handle to the security context to be set.
     * @param {Integer} ulAttribute 
     * @param {Pointer} pBuffer A pointer to a structure that contains  values to set  the attributes to. The type of structure pointed to depends on the value specified in the <i>ulAttribute</i> parameter.
     * @param {Integer} cbBuffer The size, in bytes, of the <i>pBuffer</i> parameter.
     * @returns {HRESULT} If the function succeeds, the function returns SEC_E_OK.
     * 
     * If the function fails, it returns a nonzero error code. The following error code is one of the possible error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_UNSUPPORTED_FUNCTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This value is returned by Schannel kernel mode to indicate that this function is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//sspi/nf-sspi-setcontextattributesw
     * @since windows5.1.2600
     */
    static SetContextAttributesW(phContext, ulAttribute, pBuffer, cbBuffer) {
        result := DllCall("SECUR32.dll\SetContextAttributesW", "ptr", phContext, "uint", ulAttribute, "ptr", pBuffer, "uint", cbBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Enables a transport application to set attributes of a security context for a security package. This function is supported only by the Schannel security package.
     * @param {Pointer<SecHandle>} phContext A handle to the security context to be set.
     * @param {Integer} ulAttribute 
     * @param {Pointer} pBuffer A pointer to a structure that contains  values to set  the attributes to. The type of structure pointed to depends on the value specified in the <i>ulAttribute</i> parameter.
     * @param {Integer} cbBuffer The size, in bytes, of the <i>pBuffer</i> parameter.
     * @returns {HRESULT} If the function succeeds, the function returns SEC_E_OK.
     * 
     * If the function fails, it returns a nonzero error code. The following error code is one of the possible error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_UNSUPPORTED_FUNCTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This value is returned by Schannel kernel mode to indicate that this function is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//sspi/nf-sspi-setcontextattributesa
     * @since windows5.1.2600
     */
    static SetContextAttributesA(phContext, ulAttribute, pBuffer, cbBuffer) {
        result := DllCall("SECUR32.dll\SetContextAttributesA", "ptr", phContext, "uint", ulAttribute, "ptr", pBuffer, "uint", cbBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves the attributes of a credential, such as the name associated with the credential.
     * @param {Pointer<SecHandle>} phCredential A handle of the credentials to be queried.
     * @param {Integer} ulAttribute Specifies the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">attribute</a> to query. This parameter can be any of the following attributes. 
     * 
     * 
     * 
     * 
     * 					
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>SECPKG_CRED_ATTR_CERT</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returns the certificate thumbprint in a <i>pbuffer</i> of type <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secpkgcredentials_cert">SecPkgCredentials_Cert</a>.
     * 
     * This attribute is only supported by Kerberos.
     * 
     * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This attribute is not available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>SECPKG_CRED_ATTR_NAMES</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returns the name of a credential in a <i>pbuffer</i> of type <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secpkgcredentials_namesa">SecPkgCredentials_Names</a>.
     * 
     * This attribute is not supported by Schannel in WOW64 mode.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>SECPKG_ATTR_SUPPORTED_ALGS</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returns the supported algorithms in a <i>pbuffer</i> of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa380102(v=vs.85)">SecPkgCred_SupportedAlgs</a>. All supported algorithms are included, regardless of whether they are supported by the provided certificate or enabled on the local computer.
     * 
     * This attribute is supported only by Schannel.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>SECPKG_ATTR_CIPHER_STRENGTHS</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returns the cipher strengths in a <i>pbuffer</i> of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa380101(v=vs.85)">SecPkgCred_CipherStrengths</a>.
     * 
     * This attribute is supported only by Schannel.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>SECPKG_ATTR_SUPPORTED_PROTOCOLS</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returns the supported algorithms in a <i>pbuffer</i> of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa380103(v=vs.85)">SecPkgCred_SupportedProtocols</a>. All supported protocols are included, regardless of whether they are supported by the provided certificate or enabled on the local computer.
     * 
     * This attribute is supported only by Schannel.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Void>} pBuffer A pointer to a buffer that receives the requested attribute. The type of structure returned depends on the value of <i>ulAttribute</i>.
     * @returns {HRESULT} If the function succeeds, the return value is SEC_E_OK.
     * 
     * If the function fails, the return value may be one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle passed to the function is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_UNSUPPORTED_FUNCTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified <a href="/windows/desktop/SecGloss/a-gly">attribute</a> is not supported by Schannel. This return value will only be returned when the Schannel SSP is being used.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_INSUFFICIENT_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The memory that is available is not sufficient to complete the request.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//sspi/nf-sspi-querycredentialsattributesw
     * @since windows5.1.2600
     */
    static QueryCredentialsAttributesW(phCredential, ulAttribute, pBuffer) {
        pBufferMarshal := pBuffer is VarRef ? "ptr" : "ptr"

        result := DllCall("SECUR32.dll\QueryCredentialsAttributesW", "ptr", phCredential, "uint", ulAttribute, pBufferMarshal, pBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SecHandle>} phCredential 
     * @param {Integer} ulAttribute 
     * @param {Pointer} pBuffer 
     * @param {Integer} cbBuffer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-querycredentialsattributesexw
     */
    static QueryCredentialsAttributesExW(phCredential, ulAttribute, pBuffer, cbBuffer) {
        result := DllCall("SspiCli.dll\QueryCredentialsAttributesExW", "ptr", phCredential, "uint", ulAttribute, "ptr", pBuffer, "uint", cbBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves the attributes of a credential, such as the name associated with the credential.
     * @param {Pointer<SecHandle>} phCredential A handle of the credentials to be queried.
     * @param {Integer} ulAttribute Specifies the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">attribute</a> to query. This parameter can be any of the following attributes. 
     * 
     * 
     * 
     * 
     * 					
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>SECPKG_CRED_ATTR_CERT</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returns the certificate thumbprint in a <i>pbuffer</i> of type <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secpkgcredentials_cert">SecPkgCredentials_Cert</a>.
     * 
     * This attribute is only supported by Kerberos.
     * 
     * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This attribute is not available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>SECPKG_CRED_ATTR_NAMES</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returns the name of a credential in a <i>pbuffer</i> of type <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secpkgcredentials_namesa">SecPkgCredentials_Names</a>.
     * 
     * This attribute is not supported by Schannel in WOW64 mode.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>SECPKG_ATTR_SUPPORTED_ALGS</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returns the supported algorithms in a <i>pbuffer</i> of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa380102(v=vs.85)">SecPkgCred_SupportedAlgs</a>. All supported algorithms are included, regardless of whether they are supported by the provided certificate or enabled on the local computer.
     * 
     * This attribute is supported only by Schannel.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>SECPKG_ATTR_CIPHER_STRENGTHS</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returns the cipher strengths in a <i>pbuffer</i> of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa380101(v=vs.85)">SecPkgCred_CipherStrengths</a>.
     * 
     * This attribute is supported only by Schannel.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>SECPKG_ATTR_SUPPORTED_PROTOCOLS</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returns the supported algorithms in a <i>pbuffer</i> of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa380103(v=vs.85)">SecPkgCred_SupportedProtocols</a>. All supported protocols are included, regardless of whether they are supported by the provided certificate or enabled on the local computer.
     * 
     * This attribute is supported only by Schannel.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Void>} pBuffer A pointer to a buffer that receives the requested attribute. The type of structure returned depends on the value of <i>ulAttribute</i>.
     * @returns {HRESULT} If the function succeeds, the return value is SEC_E_OK.
     * 
     * If the function fails, the return value may be one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle passed to the function is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_UNSUPPORTED_FUNCTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified <a href="/windows/desktop/SecGloss/a-gly">attribute</a> is not supported by Schannel. This return value will only be returned when the Schannel SSP is being used.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_INSUFFICIENT_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The memory that is available is not sufficient to complete the request.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//sspi/nf-sspi-querycredentialsattributesa
     * @since windows5.1.2600
     */
    static QueryCredentialsAttributesA(phCredential, ulAttribute, pBuffer) {
        pBufferMarshal := pBuffer is VarRef ? "ptr" : "ptr"

        result := DllCall("SECUR32.dll\QueryCredentialsAttributesA", "ptr", phCredential, "uint", ulAttribute, pBufferMarshal, pBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SecHandle>} phCredential 
     * @param {Integer} ulAttribute 
     * @param {Pointer} pBuffer 
     * @param {Integer} cbBuffer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-querycredentialsattributesexa
     */
    static QueryCredentialsAttributesExA(phCredential, ulAttribute, pBuffer, cbBuffer) {
        result := DllCall("SspiCli.dll\QueryCredentialsAttributesExA", "ptr", phCredential, "uint", ulAttribute, "ptr", pBuffer, "uint", cbBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Sets the attributes of a credential, such as the name associated with the credential.
     * @param {Pointer<SecHandle>} phCredential A handle of the credentials to be set.
     * @param {Integer} ulAttribute Specifies the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">attribute</a> to set. This parameter can be any of the following attributes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>SECPKG_CRED_ATTR_NAMES</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Sets the name of a credential in a <i>pBuffer</i> parameter of type <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secpkgcredentials_namesa">SecPkgCredentials_Names</a>.
     * 
     * This attribute is not supported by Schannel in WOW64 mode.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>SECPKG_CRED_ATTR_KDC_PROXY_SETTINGS</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Sets the Kerberos proxy setting in a  <i>pBuffer</i> parameter of type <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secpkgcredentials_kdcproxysettingsw">SecPkgCredentials_KdcProxySettings</a>.
     * 
     * This attribute is only supported by Kerberos.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>SECPKG_ATTR_SUPPORTED_ALGS</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Sets the supported algorithms in a  <i>pBuffer</i> parameter of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa380102(v=vs.85)">SecPkgCred_SupportedAlgs</a>. All supported algorithms are included, regardless of whether they are supported by the provided certificate or enabled on the local computer.
     * 
     * This attribute is supported only by Schannel.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>SECPKG_ATTR_CIPHER_STRENGTHS</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Sets the cipher strengths in a <i>pBuffer</i> parameter of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa380101(v=vs.85)">SecPkgCred_CipherStrengths</a>.
     * 
     * This attribute is supported only by Schannel.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>SECPKG_ATTR_SUPPORTED_PROTOCOLS</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Sets the supported algorithms in a <i>pBuffer</i> parameter of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa380103(v=vs.85)">SecPkgCred_SupportedProtocols</a>. All supported protocols are included, regardless of whether they are supported by the provided certificate or enabled on the local computer.
     * 
     * This attribute is supported only by Schannel.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer} pBuffer A pointer to a buffer that contains the new attribute value. The type of structure returned depends on the value of <i>ulAttribute</i>.
     * @param {Integer} cbBuffer The size, in bytes, of the <i>pBuffer</i> buffer.
     * @returns {HRESULT} If the function succeeds, the return value is SEC_E_OK.
     * 
     * If the function fails, the return value may be one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle passed to the function is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_UNSUPPORTED_FUNCTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified <a href="/windows/desktop/SecGloss/a-gly">attribute</a> is not supported by Schannel. This return value will only be returned when the Schannel SSP is being used.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_INSUFFICIENT_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough memory is available to complete the request.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//sspi/nf-sspi-setcredentialsattributesw
     * @since windows5.1.2600
     */
    static SetCredentialsAttributesW(phCredential, ulAttribute, pBuffer, cbBuffer) {
        result := DllCall("SECUR32.dll\SetCredentialsAttributesW", "ptr", phCredential, "uint", ulAttribute, "ptr", pBuffer, "uint", cbBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Sets the attributes of a credential, such as the name associated with the credential.
     * @param {Pointer<SecHandle>} phCredential A handle of the credentials to be set.
     * @param {Integer} ulAttribute Specifies the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">attribute</a> to set. This parameter can be any of the following attributes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>SECPKG_CRED_ATTR_NAMES</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Sets the name of a credential in a <i>pBuffer</i> parameter of type <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secpkgcredentials_namesa">SecPkgCredentials_Names</a>.
     * 
     * This attribute is not supported by Schannel in WOW64 mode.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>SECPKG_CRED_ATTR_KDC_PROXY_SETTINGS</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Sets the Kerberos proxy setting in a  <i>pBuffer</i> parameter of type <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secpkgcredentials_kdcproxysettingsw">SecPkgCredentials_KdcProxySettings</a>.
     * 
     * This attribute is only supported by Kerberos.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>SECPKG_ATTR_SUPPORTED_ALGS</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Sets the supported algorithms in a  <i>pBuffer</i> parameter of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa380102(v=vs.85)">SecPkgCred_SupportedAlgs</a>. All supported algorithms are included, regardless of whether they are supported by the provided certificate or enabled on the local computer.
     * 
     * This attribute is supported only by Schannel.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>SECPKG_ATTR_CIPHER_STRENGTHS</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Sets the cipher strengths in a <i>pBuffer</i> parameter of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa380101(v=vs.85)">SecPkgCred_CipherStrengths</a>.
     * 
     * This attribute is supported only by Schannel.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>SECPKG_ATTR_SUPPORTED_PROTOCOLS</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Sets the supported algorithms in a <i>pBuffer</i> parameter of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa380103(v=vs.85)">SecPkgCred_SupportedProtocols</a>. All supported protocols are included, regardless of whether they are supported by the provided certificate or enabled on the local computer.
     * 
     * This attribute is supported only by Schannel.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer} pBuffer A pointer to a buffer that contains the new attribute value. The type of structure returned depends on the value of <i>ulAttribute</i>.
     * @param {Integer} cbBuffer The size, in bytes, of the <i>pBuffer</i> buffer.
     * @returns {HRESULT} If the function succeeds, the return value is SEC_E_OK.
     * 
     * If the function fails, the return value may be one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle passed to the function is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_UNSUPPORTED_FUNCTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified <a href="/windows/desktop/SecGloss/a-gly">attribute</a> is not supported by Schannel. This return value will only be returned when the Schannel SSP is being used.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_INSUFFICIENT_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough memory is available to complete the request.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//sspi/nf-sspi-setcredentialsattributesa
     * @since windows5.1.2600
     */
    static SetCredentialsAttributesA(phCredential, ulAttribute, pBuffer, cbBuffer) {
        result := DllCall("SECUR32.dll\SetCredentialsAttributesA", "ptr", phCredential, "uint", ulAttribute, "ptr", pBuffer, "uint", cbBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Enables callers of security package functions to free memory buffers allocated by the security package.
     * @param {Pointer<Void>} pvContextBuffer A pointer to memory to be freed.
     * @returns {HRESULT} If the function succeeds, the function returns SEC_E_OK.
     * 
     * If the function fails, it returns a nonzero error code.
     * @see https://docs.microsoft.com/windows/win32/api//sspi/nf-sspi-freecontextbuffer
     * @since windows5.1.2600
     */
    static FreeContextBuffer(pvContextBuffer) {
        pvContextBufferMarshal := pvContextBuffer is VarRef ? "ptr" : "ptr"

        result := DllCall("SECUR32.dll\FreeContextBuffer", pvContextBufferMarshal, pvContextBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} lpIpAddress 
     * @param {Integer} cchIpAddress 
     * @returns {Integer} 
     */
    static SecAllocateAndSetIPAddress(lpIpAddress, cchIpAddress) {
        result := DllCall("SspiCli.dll\SecAllocateAndSetIPAddress", "ptr", lpIpAddress, "uint", cchIpAddress, "int*", &FreeCallContext := 0, "int")
        if(result != 0)
            throw OSError(result)

        return FreeCallContext
    }

    /**
     * 
     * @param {Pointer} lpIpAddress 
     * @param {Integer} cchIpAddress 
     * @param {PWSTR} TargetName 
     * @returns {Integer} 
     */
    static SecAllocateAndSetCallTarget(lpIpAddress, cchIpAddress, TargetName) {
        TargetName := TargetName is String ? StrPtr(TargetName) : TargetName

        result := DllCall("SspiCli.dll\SecAllocateAndSetCallTarget", "ptr", lpIpAddress, "uint", cchIpAddress, "ptr", TargetName, "int*", &FreeCallContext := 0, "int")
        if(result != 0)
            throw OSError(result)

        return FreeCallContext
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    static SecFreeCallContext() {
        DllCall("SspiCli.dll\SecFreeCallContext")
    }

    /**
     * Generates a cryptographic checksum of the message, and also includes sequencing information to prevent message loss or insertion.
     * @param {Pointer<SecHandle>} phContext A handle to the security context to use to sign the message.
     * @param {Integer} fQOP <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">Package</a>-specific flags that indicate the quality of protection. A security package can use this parameter to enable the selection of cryptographic algorithms.
     * 
     * When using the Digest SSP, this parameter must be set to zero.
     * @param {Pointer<SecBufferDesc>} pMessage A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbufferdesc">SecBufferDesc</a> structure. On input, the structure references one or more 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbuffer">SecBuffer</a> structures that contain the message to be signed. The function does not process buffers with the SECBUFFER_READONLY_WITH_CHECKSUM  attribute.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbufferdesc">SecBufferDesc</a> structure also references a <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbuffer">SecBuffer</a> structure of type SECBUFFER_TOKEN that receives the signature.
     * 
     * When the Digest SSP is used as an HTTP authentication protocol, the buffers should be configured as follows.
     * 
     * <table>
     * <tr>
     * <th>Buffer #/buffer type</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="0"></a><dl>
     * <dt><b>0</b></dt>
     * <dt>SECBUFFER_TOKEN</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Empty.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="1"></a><dl>
     * <dt><b>1</b></dt>
     * <dt>SECBUFFER_PKG_PARAMS</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="2"></a><dl>
     * <dt><b>2</b></dt>
     * <dt>SECBUFFER_PKG_PARAMS</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * URL.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="3"></a><dl>
     * <dt><b>3</b></dt>
     * <dt>SECBUFFER_PKG_PARAMS</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * HEntity. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/input-buffers-for-the-digest-challenge-response">Input Buffers for the Digest Challenge Response</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="4"></a><dl>
     * <dt><b>4</b></dt>
     * <dt>SECBUFFER_PADDING</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Empty. Receives the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/d-gly">signature</a>.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * When the Digest SSP is used as an SASL mechanism, the buffers should be configured as follows.
     * 
     * <table>
     * <tr>
     * <th>Buffer #/buffer type</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="0"></a><dl>
     * <dt><b>0</b></dt>
     * <dt>SECBUFFER_TOKEN</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Empty. Receives the signature. This buffer must be large enough to hold the largest possible signature. Determine the size required by calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-querycontextattributesa">QueryContextAttributes (General)</a> function and specifying SECPKG_ATTR_SIZES. Check the returned 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secpkgcontext_sizes">SecPkgContext_Sizes</a> structure member <b>cbMaxSignature</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="1"></a><dl>
     * <dt><b>1</b></dt>
     * <dt>SECBUFFER_DATA</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Message to be signed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="2"></a><dl>
     * <dt><b>2</b></dt>
     * <dt>SECBUFFER_PADDING</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Empty.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} MessageSeqNo The sequence number that the transport application assigned to the message. If the transport application does not maintain sequence numbers, this parameter is zero.
     * 
     * When using the Digest SSP, this parameter must be set to zero. The Digest SSP manages sequence numbering internally.
     * @returns {HRESULT} If the function succeeds, the function returns SEC_E_OK.
     * 
     * If the function fails, it returns one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_I_RENEGOTIATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote party requires a new handshake sequence or the application has just initiated a shutdown. Return to the negotiation loop and call 
     * <a href="/windows/desktop/api/sspi/nf-sspi-acceptsecuritycontext">AcceptSecurityContext (General)</a> or 
     * <a href="/windows/desktop/api/sspi/nf-sspi-initializesecuritycontexta">InitializeSecurityContext (General)</a> again. An empty input buffer is passed in the first call.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The context handle specified by <i>phContext</i> is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_INVALID_TOKEN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>pMessage</i> did not contain a valid SECBUFFER_TOKEN buffer or contained too few buffers.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_OUT_OF_SEQUENCE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="/windows/desktop/SecGloss/n-gly">nonce</a> count is out of sequence.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_NO_AUTHENTICATING_AUTHORITY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="/windows/desktop/SecGloss/s-gly">security context</a> (<i>phContext</i>) must be revalidated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The nonce count is not numeric.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_QOP_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The quality of protection negotiated between the client and server did not include <a href="/windows/desktop/SecGloss/i-gly">integrity</a> checking.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//sspi/nf-sspi-makesignature
     * @since windows5.1.2600
     */
    static MakeSignature(phContext, fQOP, pMessage, MessageSeqNo) {
        result := DllCall("SECUR32.dll\MakeSignature", "ptr", phContext, "uint", fQOP, "ptr", pMessage, "uint", MessageSeqNo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Verifies that a message signed by using the MakeSignature function was received in the correct sequence and has not been modified.
     * @param {Pointer<SecHandle>} phContext A handle to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security context</a> to use for the message.
     * @param {Pointer<SecBufferDesc>} pMessage Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbufferdesc">SecBufferDesc</a> structure that references a set of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbuffer">SecBuffer</a> structures that contain the message and signature to verify. The signature is in a <b>SecBuffer</b> structure of type SECBUFFER_TOKEN.
     * @param {Integer} MessageSeqNo Specifies the sequence number expected by the transport application, if any. If the transport application does not maintain sequence numbers, this parameter is zero.
     * @returns {Integer} Pointer to a <b>ULONG</b> variable that receives package-specific flags that indicate the quality of protection.
     * 
     * Some security packages ignore this parameter.
     * @see https://docs.microsoft.com/windows/win32/api//sspi/nf-sspi-verifysignature
     * @since windows5.1.2600
     */
    static VerifySignature(phContext, pMessage, MessageSeqNo) {
        result := DllCall("SECUR32.dll\VerifySignature", "ptr", phContext, "ptr", pMessage, "uint", MessageSeqNo, "uint*", &pfQOP := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pfQOP
    }

    /**
     * Encrypts a message to provide privacy by using Digest.
     * @param {Pointer<SecHandle>} phContext A handle to the security <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">context</a> to be used to encrypt the message.
     * @param {Integer} fQOP Package-specific flags that indicate the quality of protection. A <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security package</a> can use this parameter to enable the selection of cryptographic algorithms.
     * 
     * When using the Digest SSP, this parameter must be set to zero.
     * @param {Pointer<SecBufferDesc>} pMessage A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbufferdesc">SecBufferDesc</a> structure. On input, the structure references one or more 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbuffer">SecBuffer</a> structures that can be of type SECBUFFER_DATA. That buffer contains the message to be encrypted. The  message is encrypted in place, overwriting the original contents of the structure.
     * 
     * The function does not process buffers with the SECBUFFER_READONLY attribute.
     * 
     * The length of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbuffer">SecBuffer</a> structure that contains the message must be no greater than <b>cbMaximumMessage</b>, which is obtained from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rrascfg/nn-rrascfg-ieapproviderconfig">QueryContextAttributes (Digest)</a> (SECPKG_ATTR_STREAM_SIZES) function.
     * 
     * When using the Digest SSP,  there must be a second buffer of type SECBUFFER_PADDING or SEC_BUFFER_DATA to hold <a href="https://docs.microsoft.com/windows/desktop/SecGloss/d-gly">signature</a> information. To get the size of the output buffer, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rrascfg/nn-rrascfg-ieapproviderconfig">QueryContextAttributes (Digest)</a> function and specify SECPKG_ATTR_SIZES. The function will return a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secpkgcontext_sizes">SecPkgContext_Sizes</a> structure. The size of the output buffer is the sum of the values in the <b>cbMaxSignature</b> and <b>cbBlockSize</b> members.
     * 
     * Applications that do not use SSL must supply a <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbuffer">SecBuffer</a> of type SECBUFFER_PADDING.
     * @param {Integer} MessageSeqNo The sequence number that the transport application assigned to the message. If the transport application does not maintain sequence numbers, this parameter must be zero.
     * 
     * When using the Digest SSP, this parameter must be set to zero. The Digest SSP manages sequence numbering internally.
     * @returns {HRESULT} If the function succeeds, the function returns SEC_E_OK.
     * 
     * If the function fails, it returns one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_BUFFER_TOO_SMALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The output buffer is too small. For more information, see Remarks.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_CONTEXT_EXPIRED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The application is referencing a context that has already been closed. A properly written application should not receive this error.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_CRYPTO_SYSTEM_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="/windows/desktop/SecGloss/c-gly">cipher</a> chosen for the security context is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_INSUFFICIENT_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is not enough memory available to complete the requested action.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A context handle that is not valid was specified in the <i>phContext</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_INVALID_TOKEN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No SECBUFFER_DATA type buffer was found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_QOP_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Neither confidentiality nor <a href="/windows/desktop/SecGloss/i-gly">integrity</a> are supported by the <a href="/windows/desktop/SecGloss/s-gly">security context</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//sspi/nf-sspi-encryptmessage
     * @since windows5.1.2600
     */
    static EncryptMessage(phContext, fQOP, pMessage, MessageSeqNo) {
        result := DllCall("SECUR32.dll\EncryptMessage", "ptr", phContext, "uint", fQOP, "ptr", pMessage, "uint", MessageSeqNo, "int")
        return result
    }

    /**
     * Decrypts a message by using Digest.
     * @param {Pointer<SecHandle>} phContext A handle to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security context</a> to be used to decrypt the message.
     * @param {Pointer<SecBufferDesc>} pMessage A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbufferdesc">SecBufferDesc</a> structure. On input, the structure references one or more 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbuffer">SecBuffer</a> structures. At least one of these must be of type SECBUFFER_DATA. That buffer contains the encrypted message. The encrypted message is decrypted in place, overwriting the original contents of its buffer.
     * 
     * When using the Digest SSP, on input, the structure references one or more 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbuffer">SecBuffer</a> structures. One of these must be of type SECBUFFER_DATA or SECBUFFER_STREAM, and it must contain the encrypted message.
     * @param {Integer} MessageSeqNo The sequence number expected by the transport application, if any. If the transport application does not maintain sequence numbers, this parameter must be set to zero.
     * 
     * When using the Digest SSP, this parameter must be set to zero. The Digest SSP manages sequence numbering internally.
     * @returns {Integer} A pointer to a variable of type <b>ULONG</b> that receives package-specific flags that indicate the quality of protection.
     * 						
     * 
     * This parameter can be one of the following flags.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SECQOP_WRAP_NO_ENCRYPT"></a><a id="secqop_wrap_no_encrypt"></a><dl>
     * <dt><b>SECQOP_WRAP_NO_ENCRYPT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The message was not encrypted, but a header or trailer was produced.
     * 
     * <div class="alert"><b>Note</b>  KERB_WRAP_NO_ENCRYPT has the same value and the same meaning.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SIGN_ONLY_"></a><a id="sign_only_"></a><dl>
     * <dt><b>SIGN_ONLY </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When using the Digest SSP, use this flag when the security context is set to verify the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/d-gly">signature</a> only. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/quality-of-protection">Quality of Protection</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//sspi/nf-sspi-decryptmessage
     * @since windows5.1.2600
     */
    static DecryptMessage(phContext, pMessage, MessageSeqNo) {
        result := DllCall("SECUR32.dll\DecryptMessage", "ptr", phContext, "ptr", pMessage, "uint", MessageSeqNo, "uint*", &pfQOP := 0, "int")
        return pfQOP
    }

    /**
     * Returns an array of SecPkgInfo structures that provide information about the security packages available to the client.
     * @param {Pointer<Integer>} pcPackages A pointer to a <b>ULONG</b> variable that receives the number of packages available on the system. This includes packages that are already loaded and packages available on demand.
     * @param {Pointer<Pointer<SecPkgInfoW>>} ppPackageInfo A pointer to a variable that receives a pointer to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secpkginfoa">SecPkgInfo</a> structures. Each structure contains information from the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security support provider</a> (SSP) that describes the capabilities of the security package available within that SSP.
     * 
     * When you have finished using the array, free the memory by calling the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-freecontextbuffer">FreeContextBuffer</a> function.
     * @returns {HRESULT} If the function succeeds, the function returns <b>SEC_E_OK</b>.
     * 
     * If the function fails, it returns a nonzero error code. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_INSUFFICIENT_MEMORY</b></dt>
     * <dt>0x80090300L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There was not sufficient memory to allocate one or more of the buffers.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_INVALID_HANDLE </b></dt>
     * <dt>0x80090301L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An invalid handle was specified.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_SECPKG_NOT_FOUND</b></dt>
     * <dt>0x80090305L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified package was not found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//sspi/nf-sspi-enumeratesecuritypackagesw
     * @since windows5.1.2600
     */
    static EnumerateSecurityPackagesW(pcPackages, ppPackageInfo) {
        pcPackagesMarshal := pcPackages is VarRef ? "uint*" : "ptr"
        ppPackageInfoMarshal := ppPackageInfo is VarRef ? "ptr*" : "ptr"

        result := DllCall("SECUR32.dll\EnumerateSecurityPackagesW", pcPackagesMarshal, pcPackages, ppPackageInfoMarshal, ppPackageInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Returns an array of SecPkgInfo structures that provide information about the security packages available to the client.
     * @param {Pointer<Integer>} pcPackages A pointer to a <b>ULONG</b> variable that receives the number of packages available on the system. This includes packages that are already loaded and packages available on demand.
     * @param {Pointer<Pointer<SecPkgInfoA>>} ppPackageInfo A pointer to a variable that receives a pointer to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secpkginfoa">SecPkgInfo</a> structures. Each structure contains information from the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security support provider</a> (SSP) that describes the capabilities of the security package available within that SSP.
     * 
     * When you have finished using the array, free the memory by calling the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-freecontextbuffer">FreeContextBuffer</a> function.
     * @returns {HRESULT} If the function succeeds, the function returns <b>SEC_E_OK</b>.
     * 
     * If the function fails, it returns a nonzero error code. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_INSUFFICIENT_MEMORY</b></dt>
     * <dt>0x80090300L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There was not sufficient memory to allocate one or more of the buffers.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_INVALID_HANDLE </b></dt>
     * <dt>0x80090301L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An invalid handle was specified.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_SECPKG_NOT_FOUND</b></dt>
     * <dt>0x80090305L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified package was not found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//sspi/nf-sspi-enumeratesecuritypackagesa
     * @since windows5.1.2600
     */
    static EnumerateSecurityPackagesA(pcPackages, ppPackageInfo) {
        pcPackagesMarshal := pcPackages is VarRef ? "uint*" : "ptr"
        ppPackageInfoMarshal := ppPackageInfo is VarRef ? "ptr*" : "ptr"

        result := DllCall("SECUR32.dll\EnumerateSecurityPackagesA", pcPackagesMarshal, pcPackages, ppPackageInfoMarshal, ppPackageInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves information about a specified security package. This information includes the bounds on sizes of authentication information, credentials, and contexts.
     * @param {PWSTR} pszPackageName 
     * @returns {Pointer<SecPkgInfoW>} Pointer to a variable that receives a pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secpkginfoa">SecPkgInfo</a> structure containing information about the specified security package.
     * @see https://docs.microsoft.com/windows/win32/api//sspi/nf-sspi-querysecuritypackageinfow
     * @since windows5.1.2600
     */
    static QuerySecurityPackageInfoW(pszPackageName) {
        pszPackageName := pszPackageName is String ? StrPtr(pszPackageName) : pszPackageName

        result := DllCall("SECUR32.dll\QuerySecurityPackageInfoW", "ptr", pszPackageName, "ptr*", &ppPackageInfo := 0, "int")
        if(result != 0)
            throw OSError(result)

        return ppPackageInfo
    }

    /**
     * Retrieves information about a specified security package. This information includes the bounds on sizes of authentication information, credentials, and contexts.
     * @param {PSTR} pszPackageName Pointer to a null-terminated string that specifies the name of the security package.
     * @returns {Pointer<SecPkgInfoA>} Pointer to a variable that receives a pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secpkginfoa">SecPkgInfo</a> structure containing information about the specified security package.
     * @see https://docs.microsoft.com/windows/win32/api//sspi/nf-sspi-querysecuritypackageinfoa
     * @since windows5.1.2600
     */
    static QuerySecurityPackageInfoA(pszPackageName) {
        pszPackageName := pszPackageName is String ? StrPtr(pszPackageName) : pszPackageName

        result := DllCall("SECUR32.dll\QuerySecurityPackageInfoA", "ptr", pszPackageName, "ptr*", &ppPackageInfo := 0, "int")
        if(result != 0)
            throw OSError(result)

        return ppPackageInfo
    }

    /**
     * The ExportSecurityContext function creates a serialized representation of a security context that can later be imported into a different process by calling ImportSecurityContext.
     * @param {Pointer<SecHandle>} phContext A handle of the security context to be exported.
     * @param {Integer} fFlags 
     * @param {Pointer<SecBuffer>} pPackedContext A pointer to a buffer of type <b>SECBUFFER_EMPTY</b> that receives the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">serialized</a> security context. When you have finished using this context,  free it by calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-freecontextbuffer">FreeContextBuffer</a> function.
     * @returns {Pointer<Void>} A pointer to receive the handle of the context's token.
     * 
     * When you have finished using the user token, release the handle by calling the <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//sspi/nf-sspi-exportsecuritycontext
     * @since windows5.1.2600
     */
    static ExportSecurityContext(phContext, fFlags, pPackedContext) {
        result := DllCall("SECUR32.dll\ExportSecurityContext", "ptr", phContext, "uint", fFlags, "ptr", pPackedContext, "ptr*", &pToken := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pToken
    }

    /**
     * Imports a security context. The security context must have been exported to the process calling ImportSecurityContext by a previous call to ExportSecurityContext.
     * @param {PWSTR} pszPackage A string that contains the name of the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security package</a> to which the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security context</a> was exported.
     * @param {Pointer<SecBuffer>} pPackedContext A pointer to a buffer that contains the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">serialized</a> security context created by <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-exportsecuritycontext">ExportSecurityContext</a>.
     * @param {Pointer<Void>} Token A handle to the context's token.
     * @param {Pointer<SecHandle>} phContext A handle of the new security context created from <i>pPackedContext</i>. When you have finished using the context, delete it by calling the  <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-deletesecuritycontext">DeleteSecurityContext</a> function.
     * @returns {HRESULT} If the function succeeds, the function returns SEC_E_OK.
     * 
     * If the function fails, it returns one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_UNKNOWN_CREDENTIALS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The credentials supplied to the package were not recognized.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_NO_CREDENTIALS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No credentials are available in the <a href="/windows/desktop/SecGloss/s-gly">security package</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_NOT_OWNER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller of the function does not have the necessary credentials.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_INSUFFICIENT_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is not enough memory available to complete the requested action.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_INTERNAL_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred that did not map to an SSPI error code.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//sspi/nf-sspi-importsecuritycontextw
     * @since windows5.1.2600
     */
    static ImportSecurityContextW(pszPackage, pPackedContext, Token, phContext) {
        pszPackage := pszPackage is String ? StrPtr(pszPackage) : pszPackage

        TokenMarshal := Token is VarRef ? "ptr" : "ptr"

        result := DllCall("SECUR32.dll\ImportSecurityContextW", "ptr", pszPackage, "ptr", pPackedContext, TokenMarshal, Token, "ptr", phContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Imports a security context. The security context must have been exported to the process calling ImportSecurityContext by a previous call to ExportSecurityContext.
     * @param {PSTR} pszPackage A string that contains the name of the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security package</a> to which the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security context</a> was exported.
     * @param {Pointer<SecBuffer>} pPackedContext A pointer to a buffer that contains the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">serialized</a> security context created by <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-exportsecuritycontext">ExportSecurityContext</a>.
     * @param {Pointer<Void>} Token A handle to the context's token.
     * @param {Pointer<SecHandle>} phContext A handle of the new security context created from <i>pPackedContext</i>. When you have finished using the context, delete it by calling the  <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-deletesecuritycontext">DeleteSecurityContext</a> function.
     * @returns {HRESULT} If the function succeeds, the function returns SEC_E_OK.
     * 
     * If the function fails, it returns one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_UNKNOWN_CREDENTIALS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The credentials supplied to the package were not recognized.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_NO_CREDENTIALS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No credentials are available in the <a href="/windows/desktop/SecGloss/s-gly">security package</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_NOT_OWNER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller of the function does not have the necessary credentials.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_INSUFFICIENT_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is not enough memory available to complete the requested action.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_INTERNAL_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred that did not map to an SSPI error code.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//sspi/nf-sspi-importsecuritycontexta
     * @since windows5.1.2600
     */
    static ImportSecurityContextA(pszPackage, pPackedContext, Token, phContext) {
        pszPackage := pszPackage is String ? StrPtr(pszPackage) : pszPackage

        TokenMarshal := Token is VarRef ? "ptr" : "ptr"

        result := DllCall("SECUR32.dll\ImportSecurityContextA", "ptr", pszPackage, "ptr", pPackedContext, TokenMarshal, Token, "ptr", phContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The InitSecurityInterface function returns a pointer to an SSPI dispatch table. This function enables clients to use SSPI without binding directly to an implementation of the interface.
     * @returns {Pointer<SecurityFunctionTableA>} If the function succeeds, the return value is a pointer to a 
     * <a href="/windows/win32/api/sspi/ns-sspi-securityfunctiontablea">SecurityFunctionTable</a> structure.
     * 
     * If the function fails, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//sspi/nf-sspi-initsecurityinterfacea
     * @since windows5.1.2600
     */
    static InitSecurityInterfaceA() {
        result := DllCall("SECUR32.dll\InitSecurityInterfaceA", "ptr")
        return result
    }

    /**
     * The InitSecurityInterface function returns a pointer to an SSPI dispatch table. This function enables clients to use SSPI without binding directly to an implementation of the interface.
     * @returns {Pointer<SecurityFunctionTableW>} If the function succeeds, the return value is a pointer to a 
     * <a href="/windows/win32/api/sspi/ns-sspi-securityfunctiontablea">SecurityFunctionTable</a> structure.
     * 
     * If the function fails, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//sspi/nf-sspi-initsecurityinterfacew
     * @since windows5.1.2600
     */
    static InitSecurityInterfaceW() {
        result := DllCall("SECUR32.dll\InitSecurityInterfaceW", "ptr")
        return result
    }

    /**
     * Lists the packages that provide a SASL interface.
     * @param {Pointer<PSTR>} ProfileList Pointer to a list of Unicode or ANSI strings that contain the names of the packages with SASL wrapper support.
     * @param {Pointer<Integer>} ProfileCount Pointer to an unsigned <b>LONG</b> value that contains the number of packages with SASL wrapper support.
     * @returns {HRESULT} If the call is completed successfully, this function returns SEC_E_OK.
     * 
     * If the function fails, the return value is a nonzero error code.
     * @see https://docs.microsoft.com/windows/win32/api//sspi/nf-sspi-saslenumerateprofilesa
     * @since windowsserver2003
     */
    static SaslEnumerateProfilesA(ProfileList, ProfileCount) {
        ProfileListMarshal := ProfileList is VarRef ? "ptr*" : "ptr"
        ProfileCountMarshal := ProfileCount is VarRef ? "uint*" : "ptr"

        result := DllCall("SECUR32.dll\SaslEnumerateProfilesA", ProfileListMarshal, ProfileList, ProfileCountMarshal, ProfileCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Lists the packages that provide a SASL interface.
     * @param {Pointer<PWSTR>} ProfileList Pointer to a list of Unicode or ANSI strings that contain the names of the packages with SASL wrapper support.
     * @param {Pointer<Integer>} ProfileCount Pointer to an unsigned <b>LONG</b> value that contains the number of packages with SASL wrapper support.
     * @returns {HRESULT} If the call is completed successfully, this function returns SEC_E_OK.
     * 
     * If the function fails, the return value is a nonzero error code.
     * @see https://docs.microsoft.com/windows/win32/api//sspi/nf-sspi-saslenumerateprofilesw
     * @since windowsserver2003
     */
    static SaslEnumerateProfilesW(ProfileList, ProfileCount) {
        ProfileListMarshal := ProfileList is VarRef ? "ptr*" : "ptr"
        ProfileCountMarshal := ProfileCount is VarRef ? "uint*" : "ptr"

        result := DllCall("SECUR32.dll\SaslEnumerateProfilesW", ProfileListMarshal, ProfileList, ProfileCountMarshal, ProfileCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Returns the package information for the specified package.
     * @param {PSTR} ProfileName Unicode or ANSI string that contains the name of the SASL package.
     * @returns {Pointer<SecPkgInfoA>} Pointer to a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secpkginfoa">SecPkgInfo</a> structure that returns the package information for the package specified by the <i>ProfileName</i> parameter.
     * @see https://docs.microsoft.com/windows/win32/api//sspi/nf-sspi-saslgetprofilepackagea
     * @since windowsserver2003
     */
    static SaslGetProfilePackageA(ProfileName) {
        ProfileName := ProfileName is String ? StrPtr(ProfileName) : ProfileName

        result := DllCall("SECUR32.dll\SaslGetProfilePackageA", "ptr", ProfileName, "ptr*", &PackageInfo := 0, "int")
        if(result != 0)
            throw OSError(result)

        return PackageInfo
    }

    /**
     * Returns the package information for the specified package.
     * @param {PWSTR} ProfileName Unicode or ANSI string that contains the name of the SASL package.
     * @returns {Pointer<SecPkgInfoW>} Pointer to a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secpkginfoa">SecPkgInfo</a> structure that returns the package information for the package specified by the <i>ProfileName</i> parameter.
     * @see https://docs.microsoft.com/windows/win32/api//sspi/nf-sspi-saslgetprofilepackagew
     * @since windowsserver2003
     */
    static SaslGetProfilePackageW(ProfileName) {
        ProfileName := ProfileName is String ? StrPtr(ProfileName) : ProfileName

        result := DllCall("SECUR32.dll\SaslGetProfilePackageW", "ptr", ProfileName, "ptr*", &PackageInfo := 0, "int")
        if(result != 0)
            throw OSError(result)

        return PackageInfo
    }

    /**
     * Returns the negotiate prefix that matches the specified SASL negotiation buffer.
     * @param {Pointer<SecBufferDesc>} pInput Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbufferdesc">SecBufferDesc</a> structure that specifies the SASL negotiation buffer for which to find the negotiate prefix.
     * @returns {Pointer<SecPkgInfoA>} Pointer to a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secpkginfoa">SecPkgInfo</a> structure that returns the negotiate prefix for the negotiation buffer specified by the <i>pInput</i> parameter.
     * @see https://docs.microsoft.com/windows/win32/api//sspi/nf-sspi-saslidentifypackagea
     * @since windowsserver2003
     */
    static SaslIdentifyPackageA(pInput) {
        result := DllCall("SECUR32.dll\SaslIdentifyPackageA", "ptr", pInput, "ptr*", &PackageInfo := 0, "int")
        if(result != 0)
            throw OSError(result)

        return PackageInfo
    }

    /**
     * Returns the negotiate prefix that matches the specified SASL negotiation buffer.
     * @param {Pointer<SecBufferDesc>} pInput Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbufferdesc">SecBufferDesc</a> structure that specifies the SASL negotiation buffer for which to find the negotiate prefix.
     * @returns {Pointer<SecPkgInfoW>} Pointer to a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secpkginfoa">SecPkgInfo</a> structure that returns the negotiate prefix for the negotiation buffer specified by the <i>pInput</i> parameter.
     * @see https://docs.microsoft.com/windows/win32/api//sspi/nf-sspi-saslidentifypackagew
     * @since windowsserver2003
     */
    static SaslIdentifyPackageW(pInput) {
        result := DllCall("SECUR32.dll\SaslIdentifyPackageW", "ptr", pInput, "ptr*", &PackageInfo := 0, "int")
        if(result != 0)
            throw OSError(result)

        return PackageInfo
    }

    /**
     * Wraps a standard call to the Security Support Provider Interface InitializeSecurityContext (General) function and processes SASL server cookies from the server.
     * @param {Pointer<SecHandle>} phCredential A handle to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">credentials</a> returned by the  
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-acquirecredentialshandlea">AcquireCredentialsHandle</a> function used to build the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security context</a>. Using the <b>SaslInitializeSecurityContext</b> function requires at least OUTBOUND credentials.
     * @param {Pointer<SecHandle>} phContext Pointer to a <b>CtxtHandle</b> structure. On the first call to the <b>SaslInitializeSecurityContext</b> function, this pointer is <b>NULL</b>. On the second call, this parameter is a pointer to the handle to the partially formed context returned in the <i>phNewContext</i> parameter by the first call.
     * @param {PWSTR} pszTargetName Pointer to a Unicode or ANSI string that indicates the target of the context.
     * @param {Integer} fContextReq Bit flags that indicate the requirements of the context.  Flags used for this parameter are prefixed with ISC_REQ_; for example:  ISC_REQ_DELEGATE. Specify  combinations of the following attributes flags.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISC_REQ_REPLAY_DETECT"></a><a id="isc_req_replay_detect"></a><dl>
     * <dt><b>ISC_REQ_REPLAY_DETECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Detect replayed packets.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISC_REQ_SEQUENCE_DETECT"></a><a id="isc_req_sequence_detect"></a><dl>
     * <dt><b>ISC_REQ_SEQUENCE_DETECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Detect messages received out of sequence.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISC_REQ_CONFIDENTIALITY"></a><a id="isc_req_confidentiality"></a><dl>
     * <dt><b>ISC_REQ_CONFIDENTIALITY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Encrypt messages.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISC_REQ_STREAM"></a><a id="isc_req_stream"></a><dl>
     * <dt><b>ISC_REQ_STREAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Support a stream-oriented connection.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISC_REQ_EXTENDED_ERROR"></a><a id="isc_req_extended_error"></a><dl>
     * <dt><b>ISC_REQ_EXTENDED_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When errors occur, the remote party will be notified.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISC_REQ_CONNECTION"></a><a id="isc_req_connection"></a><dl>
     * <dt><b>ISC_REQ_CONNECTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The security context will not handle formatting messages.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISC_REQ_MUTUAL_AUTH"></a><a id="isc_req_mutual_auth"></a><dl>
     * <dt><b>ISC_REQ_MUTUAL_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Client and server will be authenticated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISC_REQ_INTEGRITY"></a><a id="isc_req_integrity"></a><dl>
     * <dt><b>ISC_REQ_INTEGRITY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Sign messages and verify signatures.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * For  further descriptions of the various attributes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/context-requirements">Context Requirements</a>.
     * @param {Integer} Reserved1 Reserved value; must be zero.
     * @param {Integer} TargetDataRep Indicates the data representation, such as byte ordering, on the target. Can be either SECURITY_NATIVE_DREP or SECURITY_NETWORK_DREP.
     * @param {Pointer<SecBufferDesc>} pInput Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbufferdesc">SecBufferDesc</a> structure that contains pointers to the buffers supplied as input to the package. The pointer must be <b>NULL</b> on the first call to the function. On subsequent calls to the function, it is a pointer to a buffer allocated with enough memory to hold the token returned by the remote peer. 
     * 
     * SASL requires a single buffer of type <b>SECBUFFER_TOKEN</b> that contains the challenge received from the server.
     * @param {Integer} Reserved2 Reserved value; must be zero.
     * @param {Pointer<SecHandle>} phNewContext Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/sspi-handles">CtxtHandle</a> structure. On the first call to the <b>SaslInitializeSecurityContext</b> function, this pointer receives the new context handle. On the second call, <i>phNewContext</i> can be the same as the handle specified in the <i>phContext</i> parameter.
     * @param {Pointer<SecBufferDesc>} pOutput Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbufferdesc">SecBufferDesc</a> structure that contains pointers to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbuffer">SecBuffer</a> structure that receives the output data. If a buffer was typed as SEC_READWRITE in the input, it will be there on output. The system will allocate a buffer for the security token if requested (through ISC_REQ_ALLOCATE_MEMORY) and fill in the address in the buffer descriptor for the security token.
     * @param {Pointer<Integer>} pfContextAttr Pointer to a variable to receive a set of bit flags that indicate the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">attributes</a> of the established <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">context</a>. For a description of the various attributes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/context-requirements">Context Requirements</a>. 
     * 
     * Flags used for this parameter are prefixed with ISC_RET_, such as ISC_RET_DELEGATE. 
     * 
     * 
     *  For a list of valid values, see the <i>fContextReq</i> parameter.
     * 
     * Do not check for security-related attributes until the final function call returns successfully. Attribute flags not related to security, such as the ASC_RET_ALLOCATED_MEMORY flag, can be checked before the final return.
     * 
     * <div class="alert"><b>Note</b>  Particular context attributes can change during a negotiation with a remote peer.</div>
     * <div> </div>
     * @param {Pointer<Integer>} ptsExpiry Pointer to a <b>TimeStamp</b> structure that receives the expiration time of the context. It is recommended that the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security package</a> always return this value in local time. This parameter is optional and <b>NULL</b> should be passed for short-lived clients.
     * @returns {HRESULT} If the call is completed successfully, this function returns SEC_E_OK. The following table shows some possible failure return values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_ALGORITHM_MISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Authz processing is not permitted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_INSUFFICIENT_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough memory is available to complete the request.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_INVALID_TOKEN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No Token buffer is located in the <i>pOutput</i> parameter, or the message failed to decrypt.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//sspi/nf-sspi-saslinitializesecuritycontextw
     * @since windowsserver2003
     */
    static SaslInitializeSecurityContextW(phCredential, phContext, pszTargetName, fContextReq, Reserved1, TargetDataRep, pInput, Reserved2, phNewContext, pOutput, pfContextAttr, ptsExpiry) {
        pszTargetName := pszTargetName is String ? StrPtr(pszTargetName) : pszTargetName

        pfContextAttrMarshal := pfContextAttr is VarRef ? "uint*" : "ptr"
        ptsExpiryMarshal := ptsExpiry is VarRef ? "int64*" : "ptr"

        result := DllCall("SECUR32.dll\SaslInitializeSecurityContextW", "ptr", phCredential, "ptr", phContext, "ptr", pszTargetName, "uint", fContextReq, "uint", Reserved1, "uint", TargetDataRep, "ptr", pInput, "uint", Reserved2, "ptr", phNewContext, "ptr", pOutput, pfContextAttrMarshal, pfContextAttr, ptsExpiryMarshal, ptsExpiry, "int")
        return result
    }

    /**
     * Wraps a standard call to the Security Support Provider Interface InitializeSecurityContext (General) function and processes SASL server cookies from the server.
     * @param {Pointer<SecHandle>} phCredential A handle to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">credentials</a> returned by the  
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-acquirecredentialshandlea">AcquireCredentialsHandle</a> function used to build the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security context</a>. Using the <b>SaslInitializeSecurityContext</b> function requires at least OUTBOUND credentials.
     * @param {Pointer<SecHandle>} phContext Pointer to a <b>CtxtHandle</b> structure. On the first call to the <b>SaslInitializeSecurityContext</b> function, this pointer is <b>NULL</b>. On the second call, this parameter is a pointer to the handle to the partially formed context returned in the <i>phNewContext</i> parameter by the first call.
     * @param {PSTR} pszTargetName Pointer to a Unicode or ANSI string that indicates the target of the context.
     * @param {Integer} fContextReq Bit flags that indicate the requirements of the context.  Flags used for this parameter are prefixed with ISC_REQ_; for example:  ISC_REQ_DELEGATE. Specify  combinations of the following attributes flags.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISC_REQ_REPLAY_DETECT"></a><a id="isc_req_replay_detect"></a><dl>
     * <dt><b>ISC_REQ_REPLAY_DETECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Detect replayed packets.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISC_REQ_SEQUENCE_DETECT"></a><a id="isc_req_sequence_detect"></a><dl>
     * <dt><b>ISC_REQ_SEQUENCE_DETECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Detect messages received out of sequence.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISC_REQ_CONFIDENTIALITY"></a><a id="isc_req_confidentiality"></a><dl>
     * <dt><b>ISC_REQ_CONFIDENTIALITY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Encrypt messages.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISC_REQ_STREAM"></a><a id="isc_req_stream"></a><dl>
     * <dt><b>ISC_REQ_STREAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Support a stream-oriented connection.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISC_REQ_EXTENDED_ERROR"></a><a id="isc_req_extended_error"></a><dl>
     * <dt><b>ISC_REQ_EXTENDED_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When errors occur, the remote party will be notified.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISC_REQ_CONNECTION"></a><a id="isc_req_connection"></a><dl>
     * <dt><b>ISC_REQ_CONNECTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The security context will not handle formatting messages.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISC_REQ_MUTUAL_AUTH"></a><a id="isc_req_mutual_auth"></a><dl>
     * <dt><b>ISC_REQ_MUTUAL_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Client and server will be authenticated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISC_REQ_INTEGRITY"></a><a id="isc_req_integrity"></a><dl>
     * <dt><b>ISC_REQ_INTEGRITY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Sign messages and verify signatures.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * For  further descriptions of the various attributes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/context-requirements">Context Requirements</a>.
     * @param {Integer} Reserved1 Reserved value; must be zero.
     * @param {Integer} TargetDataRep Indicates the data representation, such as byte ordering, on the target. Can be either SECURITY_NATIVE_DREP or SECURITY_NETWORK_DREP.
     * @param {Pointer<SecBufferDesc>} pInput Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbufferdesc">SecBufferDesc</a> structure that contains pointers to the buffers supplied as input to the package. The pointer must be <b>NULL</b> on the first call to the function. On subsequent calls to the function, it is a pointer to a buffer allocated with enough memory to hold the token returned by the remote peer. 
     * 
     * SASL requires a single buffer of type <b>SECBUFFER_TOKEN</b> that contains the challenge received from the server.
     * @param {Integer} Reserved2 Reserved value; must be zero.
     * @param {Pointer<SecHandle>} phNewContext Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/sspi-handles">CtxtHandle</a> structure. On the first call to the <b>SaslInitializeSecurityContext</b> function, this pointer receives the new context handle. On the second call, <i>phNewContext</i> can be the same as the handle specified in the <i>phContext</i> parameter.
     * @param {Pointer<SecBufferDesc>} pOutput Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbufferdesc">SecBufferDesc</a> structure that contains pointers to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbuffer">SecBuffer</a> structure that receives the output data. If a buffer was typed as SEC_READWRITE in the input, it will be there on output. The system will allocate a buffer for the security token if requested (through ISC_REQ_ALLOCATE_MEMORY) and fill in the address in the buffer descriptor for the security token.
     * @param {Pointer<Integer>} pfContextAttr Pointer to a variable to receive a set of bit flags that indicate the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">attributes</a> of the established <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">context</a>. For a description of the various attributes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/context-requirements">Context Requirements</a>. 
     * 
     * Flags used for this parameter are prefixed with ISC_RET_, such as ISC_RET_DELEGATE. 
     * 
     * 
     *  For a list of valid values, see the <i>fContextReq</i> parameter.
     * 
     * Do not check for security-related attributes until the final function call returns successfully. Attribute flags not related to security, such as the ASC_RET_ALLOCATED_MEMORY flag, can be checked before the final return.
     * 
     * <div class="alert"><b>Note</b>  Particular context attributes can change during a negotiation with a remote peer.</div>
     * <div> </div>
     * @param {Pointer<Integer>} ptsExpiry Pointer to a <b>TimeStamp</b> structure that receives the expiration time of the context. It is recommended that the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security package</a> always return this value in local time. This parameter is optional and <b>NULL</b> should be passed for short-lived clients.
     * @returns {HRESULT} If the call is completed successfully, this function returns SEC_E_OK. The following table shows some possible failure return values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_ALGORITHM_MISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Authz processing is not permitted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_INSUFFICIENT_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough memory is available to complete the request.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_INVALID_TOKEN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No Token buffer is located in the <i>pOutput</i> parameter, or the message failed to decrypt.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//sspi/nf-sspi-saslinitializesecuritycontexta
     * @since windowsserver2003
     */
    static SaslInitializeSecurityContextA(phCredential, phContext, pszTargetName, fContextReq, Reserved1, TargetDataRep, pInput, Reserved2, phNewContext, pOutput, pfContextAttr, ptsExpiry) {
        pszTargetName := pszTargetName is String ? StrPtr(pszTargetName) : pszTargetName

        pfContextAttrMarshal := pfContextAttr is VarRef ? "uint*" : "ptr"
        ptsExpiryMarshal := ptsExpiry is VarRef ? "int64*" : "ptr"

        result := DllCall("SECUR32.dll\SaslInitializeSecurityContextA", "ptr", phCredential, "ptr", phContext, "ptr", pszTargetName, "uint", fContextReq, "uint", Reserved1, "uint", TargetDataRep, "ptr", pInput, "uint", Reserved2, "ptr", phNewContext, "ptr", pOutput, pfContextAttrMarshal, pfContextAttr, ptsExpiryMarshal, ptsExpiry, "int")
        return result
    }

    /**
     * Wraps a standard call to the Security Support Provider Interface AcceptSecurityContext (General) function and includes creation of SASL server cookies.
     * @param {Pointer<SecHandle>} phCredential A handle to the server's credentials. The server calls the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-acquirecredentialshandlea">AcquireCredentialsHandle</a> function with the INBOUND flag set to retrieve this handle.
     * @param {Pointer<SecHandle>} phContext Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/sspi-handles">CtxtHandle</a> structure. On the first call to <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-acceptsecuritycontext">AcceptSecurityContext (General)</a>, this pointer is <b>NULL</b>. On subsequent calls, <i>phContext</i> is the handle to the partially formed context that was returned in the <i>phNewContext</i> parameter by the first call.
     * @param {Pointer<SecBufferDesc>} pInput Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbufferdesc">SecBufferDesc</a> structure generated by a client call to 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-initializesecuritycontexta">InitializeSecurityContext (General)</a> function that contains the input buffer descriptor.
     * 
     * SASL requires a single buffer of type <b>SECBUFFER_TOKEN</b>. The buffer is empty for the first call to the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-acceptsecuritycontext">AcceptSecurityContext (General)</a> function and contains the challenge response received from the client for the second call.
     * @param {Integer} fContextReq Bit flags that specify the attributes required by the server to establish the context. Bit flags can be combined using bitwise-<b>OR</b> operations. The following table shows the possible values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ASC_REQ_CONFIDENTIALITY"></a><a id="asc_req_confidentiality"></a><dl>
     * <dt><b>ASC_REQ_CONFIDENTIALITY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Encrypt and decrypt messages. 
     * 
     * Valid with the Digest SSP for SASL only.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ASC_REQ_HTTP"></a><a id="asc_req_http"></a><dl>
     * <dt><b>ASC_REQ_HTTP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use Digest for HTTP. Omit this flag to use Digest as an SASL mechanism.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} TargetDataRep Indicates the data representation, such as byte ordering, on the target. This value can be either SECURITY_NATIVE_DREP or SECURITY_NETWORK_DREP.
     * @param {Pointer<SecHandle>} phNewContext Pointer to a <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/sspi-handles">CtxtHandle</a> structure. On the first call to <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-acceptsecuritycontext">AcceptSecurityContext (General)</a>, this pointer receives the new context handle. On subsequent calls, <i>phNewContext</i> can be the same as the handle specified in the <i>phContext</i> parameter.
     * @param {Pointer<SecBufferDesc>} pOutput Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbufferdesc">SecBufferDesc</a> structure that contains the output buffer descriptor. This buffer is sent to the client for input into additional calls to <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-initializesecuritycontexta">InitializeSecurityContext (General)</a>. An output buffer may be generated even if the function returns SEC_E_OK. Any buffer generated must be sent back to the client application.
     * @param {Pointer<Integer>} pfContextAttr Pointer to a variable that receives a set of bit flags indicating the attributes of the established context. For a description of the various attributes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/context-requirements">Context Requirements</a>. Flags used for this parameter are prefixed with ASC_RET, such as ASC_RET_DELEGATE.
     * 
     * Do not check for security-related attributes until the final function call returns successfully. Attribute flags not related to security, such as the ASC_RET_ALLOCATED_MEMORY flag, can be checked before the final return.
     * @param {Pointer<Integer>} ptsExpiry Pointer to a <b>TimeStamp</b> structure that receives the expiration time of the context. It is recommended that the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security package</a> always return this value in local time. 
     * 
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  Until the last call of the authentication process, the expiration time for the context can be incorrect because more information will be provided during later stages of the negotiation. Therefore, <i>ptsTimeStamp</i> must be <b>NULL</b> until the last call to the function.</div>
     * <div> </div>
     * @returns {HRESULT} If the call is completed successfully, this function returns SEC_E_OK. The following table shows some possible failure return values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_ALGORITHM_MISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Authz processing is not permitted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_INSUFFICIENT_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough memory is available to complete the request.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_INVALID_TOKEN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No Token buffer is located in the <i>pOutput</i> parameter, or the message failed to decrypt.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//sspi/nf-sspi-saslacceptsecuritycontext
     * @since windowsserver2003
     */
    static SaslAcceptSecurityContext(phCredential, phContext, pInput, fContextReq, TargetDataRep, phNewContext, pOutput, pfContextAttr, ptsExpiry) {
        pfContextAttrMarshal := pfContextAttr is VarRef ? "uint*" : "ptr"
        ptsExpiryMarshal := ptsExpiry is VarRef ? "int64*" : "ptr"

        result := DllCall("SECUR32.dll\SaslAcceptSecurityContext", "ptr", phCredential, "ptr", phContext, "ptr", pInput, "uint", fContextReq, "uint", TargetDataRep, "ptr", phNewContext, "ptr", pOutput, pfContextAttrMarshal, pfContextAttr, ptsExpiryMarshal, ptsExpiry, "int")
        return result
    }

    /**
     * Sets the value of the specified property for the specified SASL context.
     * @param {Pointer<SecHandle>} ContextHandle Handle of the SASL context.
     * @param {Integer} Option Property to set for the SASL context. The following table lists the possible values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SASL_OPTION_AUTHZ_PROCESSING"></a><a id="sasl_option_authz_processing"></a><dl>
     * <dt><b>SASL_OPTION_AUTHZ_PROCESSING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Data type of buffer: <b>ULONG</b>
     * 
     * State of SASL processing of the Authz value provided by the SASL application. The valid states for processing are Sasl_AuthZIDForbidden  and Sasl_AuthZIDProcessed. The default value is Sasl_AuthZIDProcessed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SASL_OPTION_AUTHZ_STRING"></a><a id="sasl_option_authz_string"></a><dl>
     * <dt><b>SASL_OPTION_AUTHZ_STRING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Data type of buffer: Array of binary characters
     * 
     * String of characters passed from the SASL client to the server.  If the AuthZ_Processing state is Sasl_AuthZIDForbidden, the  return value SEC_E_UNSUPPORTED_FUNCTION is returned.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SASL_OPTION_RECV_SIZE"></a><a id="sasl_option_recv_size"></a><dl>
     * <dt><b>SASL_OPTION_RECV_SIZE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Data type of buffer: <b>ULONG</b>
     * 
     * Maximum size of the receiving buffer on the local computer. The default value is 0x0FFFF bytes.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SASL_OPTION_SEND_SIZE"></a><a id="sasl_option_send_size"></a><dl>
     * <dt><b>SASL_OPTION_SEND_SIZE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Data type of buffer: <b>ULONG</b>
     * 
     * Maximum message data size that can be transmitted.  This value is  the maximum buffer size that can be transmitted to the remote SASL process minus the block size, the trailer size, and the maximum signature size. The default value is 0x0FFFF bytes.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Void>} Value A pointer to a buffer that contains the value to set to  the requested property. For the data type of the buffer for each value of the <i>Option</i> parameter, see the <i>Option</i> parameter.
     * @param {Integer} Size The size, in bytes, of the buffer specified by the <i>Value</i> parameter.
     * @returns {HRESULT} If the call is completed successfully, this function returns SEC_E_OK. The following table shows some possible error return values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_BUFFER_TOO_SMALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer specified by the <i>Value</i> parameter is not large enough to contain the data value of the property specified by the <i>Option</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The SASL context handle specified by the <i>ContextHandle</i> parameter was not found in the SASL list.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_UNSUPPORTED_FUNCTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The option specified in the <i>Option</i> parameter is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//sspi/nf-sspi-saslsetcontextoption
     * @since windowsserver2003
     */
    static SaslSetContextOption(ContextHandle, Option, Value, Size) {
        ValueMarshal := Value is VarRef ? "ptr" : "ptr"

        result := DllCall("SECUR32.dll\SaslSetContextOption", "ptr", ContextHandle, "uint", Option, ValueMarshal, Value, "uint", Size, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves the specified property of the specified SASL context.
     * @param {Pointer<SecHandle>} ContextHandle Handle of the SASL context.
     * @param {Integer} Option Property to return from the SASL context. The following table lists the possible values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SASL_OPTION_AUTHZ_PROCESSING"></a><a id="sasl_option_authz_processing"></a><dl>
     * <dt><b>SASL_OPTION_AUTHZ_PROCESSING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Data type of buffer: <b>ULONG</b>
     * 
     * State of SASL processing of the Authz value provided by the SASL application. The valid states for processing are Sasl_AuthZIDForbidden  and Sasl_AuthZIDProcessed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SASL_OPTION_AUTHZ_STRING"></a><a id="sasl_option_authz_string"></a><dl>
     * <dt><b>SASL_OPTION_AUTHZ_STRING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Data type of buffer: Array of binary characters
     * 
     * String of characters passed from the SASL client to the server.  If the AuthZ_Processing state is Sasl_AuthZIDForbidden, the  return value SEC_E_UNSUPPORTED_FUNCTION is returned.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SASL_OPTION_RECV_SIZE"></a><a id="sasl_option_recv_size"></a><dl>
     * <dt><b>SASL_OPTION_RECV_SIZE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Data type of buffer: <b>ULONG</b>
     * 
     * Maximum size of the receiving buffer on the local computer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SASL_OPTION_SEND_SIZE"></a><a id="sasl_option_send_size"></a><dl>
     * <dt><b>SASL_OPTION_SEND_SIZE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Data type of buffer: <b>ULONG</b>
     * 
     * Maximum message data size that can be transmitted.  This value is  the maximum buffer size that can be transmitted to the remote SASL process minus the block size, the trailer size, and the maximum signature size.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Void>} Value A pointer to a buffer that receives the requested property. For the data type of the buffer for each value of the <i>Option</i> parameter, see the <i>Option</i> parameter.
     * @param {Integer} Size The size, in bytes, of the buffer specified by the <i>Value</i> parameter.
     * @param {Pointer<Integer>} Needed A pointer to an unsigned <b>LONG</b> value that returns the value if the buffer specified by the <i>Value</i> parameter is not large enough to contain the data value of the property specified by the <i>Option</i> parameter.
     * @returns {HRESULT} If the call is completed successfully, this function returns SEC_E_OK. The following table shows some possible error return values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_BUFFER_TOO_SMALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer specified by the <i>Value</i> parameter is not large enough to contain the data value of the property specified by the <i>Option</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The SASL context handle specified by the <i>ContextHandle</i> parameter was not found in the SASL list.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_UNSUPPORTED_FUNCTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The option specified in the <i>Option</i> parameter is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//sspi/nf-sspi-saslgetcontextoption
     * @since windowsserver2003
     */
    static SaslGetContextOption(ContextHandle, Option, Value, Size, Needed) {
        ValueMarshal := Value is VarRef ? "ptr" : "ptr"
        NeededMarshal := Needed is VarRef ? "uint*" : "ptr"

        result := DllCall("SECUR32.dll\SaslGetContextOption", "ptr", ContextHandle, "uint", Option, ValueMarshal, Value, "uint", Size, NeededMarshal, Needed, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Allows a Security Support Provider Interface (SSPI) application to prompt a user to enter credentials.
     * @param {PWSTR} pszTargetName The name of the target to use.
     * @param {Pointer<Void>} pUiInfo A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincred/ns-wincred-credui_infoa">CREDUI_INFO</a> structure that contains information for customizing the appearance of the dialog box that this function displays. 
     *    
     * 
     * 
     * If the <b>hwndParent</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wincred/ns-wincred-credui_infoa">CREDUI_INFO</a> structure is not <b>NULL</b>, this function displays a modal dialog box centered on the parent window.
     * 
     * If the <b>hwndParent</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wincred/ns-wincred-credui_infoa">CREDUI_INFO</a> structure is <b>NULL</b>, the function displays a dialog box centered on the screen.
     * 
     * This function ignores the  <b>hbmBanner</b> member of the <b>CREDUI_INFO</b> structure.
     * @param {Integer} dwAuthError A Windows error code, defined in Winerror.h, that is displayed in the dialog box. If credentials previously collected were not valid, the caller uses this parameter to pass the error message from the API that collected the credentials (for example, Winlogon) to this function. The corresponding error message is formatted and displayed in the dialog box. Set the  value of this parameter to zero to display no error message.
     * @param {PWSTR} pszPackage The name of the security package to use.
     * @param {Pointer<Void>} pInputAuthIdentity An identity structure that is used to populate credential fields in the dialog box. To leave the credential fields empty, set the value of this parameter to <b>NULL</b>.
     * @param {Pointer<Pointer<Void>>} ppAuthIdentity An identity structure that represents the  credentials this function collects.
     * 
     * When you have finished using this structure, free it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-sspifreeauthidentity">SspiFreeAuthIdentity</a> function.
     * @param {Pointer<Integer>} pfSave A pointer to a Boolean value that, on input, specifies whether the <b>Save</b> check box is selected in the dialog box that this function displays. On output, the value of this parameter specifies whether the <b>Save</b> check box was selected when the user clicked the <b>Submit</b> button in the dialog box. Set this parameter to <b>NULL</b> to ignore the <b>Save</b> check box.
     * 
     * This parameter is ignored if the <b>CREDUIWIN_CHECKBOX</b> flag is not set in the <i>dwFlags</i> parameter.
     * @param {Integer} dwFlags Flags that determine the behavior of this function. The following flag is currently defined.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SSPIPFC_CREDPROV_DO_NOT_SAVE"></a><a id="sspipfc_credprov_do_not_save"></a><dl>
     * <dt><b>SSPIPFC_CREDPROV_DO_NOT_SAVE</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value of the <i>pfSave</i> parameter is ignored, and the credentials collected by this function are not saved.
     * 
     * <b>Windows 7 and Windows Server 2008 R2:  </b>The value of the <i>pfSave</i> parameter is ignored, and the credentials collected by this function are not saved. Only the name of this possible value was SSPIPFC_SAVE_CRED_BY_CALLER. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SSPIPFC_NO_CHECKBOX"></a><a id="sspipfc_no_checkbox"></a><dl>
     * <dt><b>SSPIPFC_NO_CHECKBOX</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value signifies that password and smart card credential providers  will not display the "Remember my credentials" checkbox to the user. The <b>SspiPromptForCredentials</b> function passes this flag value, SSPIPFC_NO_CHECKBOX,  in the <i>pvInAuthBuffer</i> parameter of <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-creduipromptforwindowscredentialsa">CredUIPromptForWindowsCredentials</a> function.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} If the function succeeds, it returns <b>SEC_E_OK</b>.
     * 
     * If the function fails, it returns a nonzero error code.
     * @see https://docs.microsoft.com/windows/win32/api//sspi/nf-sspi-sspipromptforcredentialsw
     * @since windows6.1
     */
    static SspiPromptForCredentialsW(pszTargetName, pUiInfo, dwAuthError, pszPackage, pInputAuthIdentity, ppAuthIdentity, pfSave, dwFlags) {
        pszTargetName := pszTargetName is String ? StrPtr(pszTargetName) : pszTargetName
        pszPackage := pszPackage is String ? StrPtr(pszPackage) : pszPackage

        pUiInfoMarshal := pUiInfo is VarRef ? "ptr" : "ptr"
        pInputAuthIdentityMarshal := pInputAuthIdentity is VarRef ? "ptr" : "ptr"
        ppAuthIdentityMarshal := ppAuthIdentity is VarRef ? "ptr*" : "ptr"
        pfSaveMarshal := pfSave is VarRef ? "int*" : "ptr"

        result := DllCall("credui.dll\SspiPromptForCredentialsW", "ptr", pszTargetName, pUiInfoMarshal, pUiInfo, "uint", dwAuthError, "ptr", pszPackage, pInputAuthIdentityMarshal, pInputAuthIdentity, ppAuthIdentityMarshal, ppAuthIdentity, pfSaveMarshal, pfSave, "uint", dwFlags, "uint")
        return result
    }

    /**
     * Allows a Security Support Provider Interface (SSPI) application to prompt a user to enter credentials.
     * @param {PSTR} pszTargetName The name of the target to use.
     * @param {Pointer<Void>} pUiInfo A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincred/ns-wincred-credui_infoa">CREDUI_INFO</a> structure that contains information for customizing the appearance of the dialog box that this function displays. 
     *    
     * 
     * 
     * If the <b>hwndParent</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wincred/ns-wincred-credui_infoa">CREDUI_INFO</a> structure is not <b>NULL</b>, this function displays a modal dialog box centered on the parent window.
     * 
     * If the <b>hwndParent</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wincred/ns-wincred-credui_infoa">CREDUI_INFO</a> structure is <b>NULL</b>, the function displays a dialog box centered on the screen.
     * 
     * This function ignores the  <b>hbmBanner</b> member of the <b>CREDUI_INFO</b> structure.
     * @param {Integer} dwAuthError A Windows error code, defined in Winerror.h, that is displayed in the dialog box. If credentials previously collected were not valid, the caller uses this parameter to pass the error message from the API that collected the credentials (for example, Winlogon) to this function. The corresponding error message is formatted and displayed in the dialog box. Set the  value of this parameter to zero to display no error message.
     * @param {PSTR} pszPackage The name of the security package to use.
     * @param {Pointer<Void>} pInputAuthIdentity An identity structure that is used to populate credential fields in the dialog box. To leave the credential fields empty, set the value of this parameter to <b>NULL</b>.
     * @param {Pointer<Pointer<Void>>} ppAuthIdentity An identity structure that represents the  credentials this function collects.
     * 
     * When you have finished using this structure, free it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-sspifreeauthidentity">SspiFreeAuthIdentity</a> function.
     * @param {Pointer<Integer>} pfSave A pointer to a Boolean value that, on input, specifies whether the <b>Save</b> check box is selected in the dialog box that this function displays. On output, the value of this parameter specifies whether the <b>Save</b> check box was selected when the user clicked the <b>Submit</b> button in the dialog box. Set this parameter to <b>NULL</b> to ignore the <b>Save</b> check box.
     * 
     * This parameter is ignored if the <b>CREDUIWIN_CHECKBOX</b> flag is not set in the <i>dwFlags</i> parameter.
     * @param {Integer} dwFlags Flags that determine the behavior of this function. The following flag is currently defined.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SSPIPFC_CREDPROV_DO_NOT_SAVE"></a><a id="sspipfc_credprov_do_not_save"></a><dl>
     * <dt><b>SSPIPFC_CREDPROV_DO_NOT_SAVE</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value of the <i>pfSave</i> parameter is ignored, and the credentials collected by this function are not saved.
     * 
     * <b>Windows 7 and Windows Server 2008 R2:  </b>The value of the <i>pfSave</i> parameter is ignored, and the credentials collected by this function are not saved. Only the name of this possible value was SSPIPFC_SAVE_CRED_BY_CALLER. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SSPIPFC_NO_CHECKBOX"></a><a id="sspipfc_no_checkbox"></a><dl>
     * <dt><b>SSPIPFC_NO_CHECKBOX</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value signifies that password and smart card credential providers  will not display the "Remember my credentials" checkbox to the user. The <b>SspiPromptForCredentials</b> function passes this flag value, SSPIPFC_NO_CHECKBOX,  in the <i>pvInAuthBuffer</i> parameter of <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-creduipromptforwindowscredentialsa">CredUIPromptForWindowsCredentials</a> function.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} If the function succeeds, it returns <b>SEC_E_OK</b>.
     * 
     * If the function fails, it returns a nonzero error code.
     * @see https://docs.microsoft.com/windows/win32/api//sspi/nf-sspi-sspipromptforcredentialsa
     * @since windows6.1
     */
    static SspiPromptForCredentialsA(pszTargetName, pUiInfo, dwAuthError, pszPackage, pInputAuthIdentity, ppAuthIdentity, pfSave, dwFlags) {
        pszTargetName := pszTargetName is String ? StrPtr(pszTargetName) : pszTargetName
        pszPackage := pszPackage is String ? StrPtr(pszPackage) : pszPackage

        pUiInfoMarshal := pUiInfo is VarRef ? "ptr" : "ptr"
        pInputAuthIdentityMarshal := pInputAuthIdentity is VarRef ? "ptr" : "ptr"
        ppAuthIdentityMarshal := ppAuthIdentity is VarRef ? "ptr*" : "ptr"
        pfSaveMarshal := pfSave is VarRef ? "int*" : "ptr"

        result := DllCall("credui.dll\SspiPromptForCredentialsA", "ptr", pszTargetName, pUiInfoMarshal, pUiInfo, "uint", dwAuthError, "ptr", pszPackage, pInputAuthIdentityMarshal, pInputAuthIdentity, ppAuthIdentityMarshal, ppAuthIdentity, pfSaveMarshal, pfSave, "uint", dwFlags, "uint")
        return result
    }

    /**
     * Generates a target name and credential type from the specified identity structure.
     * @param {Pointer<Void>} AuthIdentity The identity structure from which to generate the credentials to be passed to the <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-credreada">CredRead</a> function.
     * @param {PWSTR} pszTargetName A target name that can be modified by this function depending on the value of the <i>AuthIdentity</i> parameter.
     * @param {Pointer<Integer>} pCredmanCredentialType The credential type to pass to the <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-credreada">CredRead</a> function.
     * @param {Pointer<PWSTR>} ppszCredmanTargetName The target name to pass to the <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-credreada">CredRead</a> function.
     * @returns {HRESULT} If the function succeeds, it returns <b>SEC_E_OK</b>.
     * 
     * If the function fails, it returns a nonzero error code.
     * @see https://docs.microsoft.com/windows/win32/api//sspi/nf-sspi-sspiprepareforcredread
     * @since windows6.1
     */
    static SspiPrepareForCredRead(AuthIdentity, pszTargetName, pCredmanCredentialType, ppszCredmanTargetName) {
        pszTargetName := pszTargetName is String ? StrPtr(pszTargetName) : pszTargetName

        AuthIdentityMarshal := AuthIdentity is VarRef ? "ptr" : "ptr"
        pCredmanCredentialTypeMarshal := pCredmanCredentialType is VarRef ? "uint*" : "ptr"
        ppszCredmanTargetNameMarshal := ppszCredmanTargetName is VarRef ? "ptr*" : "ptr"

        result := DllCall("SECUR32.dll\SspiPrepareForCredRead", AuthIdentityMarshal, AuthIdentity, "ptr", pszTargetName, pCredmanCredentialTypeMarshal, pCredmanCredentialType, ppszCredmanTargetNameMarshal, ppszCredmanTargetName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Generates values from an identity structure that can be passed as the values of parameters in a call to the CredWrite function.
     * @param {Pointer<Void>} AuthIdentity The identity structure from which to generate the credentials to be passed to the <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-credwritea">CredWrite</a> function.
     * @param {PWSTR} pszTargetName A target name that can be modified by this function depending on the value of the <i>AuthIdentity</i> parameter.
     * 
     * Set the value of this parameter to <b>NULL</b> to use the user name as the target.
     * @param {Pointer<Integer>} pCredmanCredentialType The credential type to pass to the <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-credwritea">CredWrite</a> function.
     * @param {Pointer<PWSTR>} ppszCredmanTargetName The target name to pass to the <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-credwritea">CredWrite</a> function.
     * @param {Pointer<PWSTR>} ppszCredmanUserName The user name to pass to the <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-credwritea">CredWrite</a> function.
     * @param {Pointer<Pointer<Integer>>} ppCredentialBlob The credential <a href="https://docs.microsoft.com/windows/desktop/SecGloss/b-gly">BLOB</a> to send to the <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-credwritea">CredWrite</a> function.
     * @param {Pointer<Integer>} pCredentialBlobSize The size, in bytes, of the <i>ppCredentialBlob</i> buffer.
     * @returns {HRESULT} If the function succeeds, it returns <b>SEC_E_OK</b>.
     * 
     * If the function fails, it returns a nonzero error code.
     * @see https://docs.microsoft.com/windows/win32/api//sspi/nf-sspi-sspiprepareforcredwrite
     * @since windows6.1
     */
    static SspiPrepareForCredWrite(AuthIdentity, pszTargetName, pCredmanCredentialType, ppszCredmanTargetName, ppszCredmanUserName, ppCredentialBlob, pCredentialBlobSize) {
        pszTargetName := pszTargetName is String ? StrPtr(pszTargetName) : pszTargetName

        AuthIdentityMarshal := AuthIdentity is VarRef ? "ptr" : "ptr"
        pCredmanCredentialTypeMarshal := pCredmanCredentialType is VarRef ? "uint*" : "ptr"
        ppszCredmanTargetNameMarshal := ppszCredmanTargetName is VarRef ? "ptr*" : "ptr"
        ppszCredmanUserNameMarshal := ppszCredmanUserName is VarRef ? "ptr*" : "ptr"
        ppCredentialBlobMarshal := ppCredentialBlob is VarRef ? "ptr*" : "ptr"
        pCredentialBlobSizeMarshal := pCredentialBlobSize is VarRef ? "uint*" : "ptr"

        result := DllCall("SECUR32.dll\SspiPrepareForCredWrite", AuthIdentityMarshal, AuthIdentity, "ptr", pszTargetName, pCredmanCredentialTypeMarshal, pCredmanCredentialType, ppszCredmanTargetNameMarshal, ppszCredmanTargetName, ppszCredmanUserNameMarshal, ppszCredmanUserName, ppCredentialBlobMarshal, ppCredentialBlob, pCredentialBlobSizeMarshal, pCredentialBlobSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Encrypts the specified identity structure.
     * @param {Pointer<Void>} AuthData On input, the identity structure to encrypt. On output, the encrypted identity structure.
     * @returns {HRESULT} If the function succeeds, it returns <b>SEC_E_OK</b>.
     * 
     * If the function fails, it returns a nonzero error code.
     * @see https://docs.microsoft.com/windows/win32/api//sspi/nf-sspi-sspiencryptauthidentity
     * @since windows6.1
     */
    static SspiEncryptAuthIdentity(AuthData) {
        AuthDataMarshal := AuthData is VarRef ? "ptr" : "ptr"

        result := DllCall("SECUR32.dll\SspiEncryptAuthIdentity", AuthDataMarshal, AuthData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Encrypts a SEC_WINNT_AUTH_IDENTITY_OPAQUE structure.
     * @param {Integer} Options 
     * @param {Pointer<Void>} AuthData On input, a pointer to an identity buffer to encrypt. This buffer must be prepared for encryption prior to the call to this function. This can be done by calling the function <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-sspiencryptauthidentity">SspiEncryptAuthIdentity</a>. On output, the encrypted identity buffer.
     * @returns {HRESULT} If the function succeeds, it returns SEC_E_OK.
     * 
     * If the function fails, it returns a nonzero error code.
     * @see https://docs.microsoft.com/windows/win32/api//sspi/nf-sspi-sspiencryptauthidentityex
     * @since windows8.0
     */
    static SspiEncryptAuthIdentityEx(Options, AuthData) {
        AuthDataMarshal := AuthData is VarRef ? "ptr" : "ptr"

        result := DllCall("SspiCli.dll\SspiEncryptAuthIdentityEx", "uint", Options, AuthDataMarshal, AuthData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Decrypts the specified encrypted credential.
     * @param {Pointer<Void>} EncryptedAuthData On input, a  pointer to the encrypted credential structure to be decrypted. On output, a pointer to the decrypted credential structure.
     * @returns {HRESULT} If the function succeeds, it returns <b>SEC_E_OK</b>.
     * 
     * If the function fails, it returns a nonzero error code.
     * @see https://docs.microsoft.com/windows/win32/api//sspi/nf-sspi-sspidecryptauthidentity
     * @since windows6.1
     */
    static SspiDecryptAuthIdentity(EncryptedAuthData) {
        EncryptedAuthDataMarshal := EncryptedAuthData is VarRef ? "ptr" : "ptr"

        result := DllCall("SECUR32.dll\SspiDecryptAuthIdentity", EncryptedAuthDataMarshal, EncryptedAuthData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Decrypts a SEC_WINNT_AUTH_IDENTITY_OPAQUE structure.
     * @param {Integer} Options 
     * @param {Pointer<Void>} EncryptedAuthData This buffer is the output of the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-sspiencryptauthidentityex">SspiEncryptAuthIdentityEx</a> function.
     * @returns {HRESULT} If the function succeeds, it returns SEC_E_OK.
     * 
     * If the function fails, it returns a nonzero error code.
     * @see https://docs.microsoft.com/windows/win32/api//sspi/nf-sspi-sspidecryptauthidentityex
     * @since windows8.0
     */
    static SspiDecryptAuthIdentityEx(Options, EncryptedAuthData) {
        EncryptedAuthDataMarshal := EncryptedAuthData is VarRef ? "ptr" : "ptr"

        result := DllCall("SspiCli.dll\SspiDecryptAuthIdentityEx", "uint", Options, EncryptedAuthDataMarshal, EncryptedAuthData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Indicates whether the specified identity structure is encrypted.
     * @param {Pointer<Void>} EncryptedAuthData The identity structure to test.
     * @returns {BOOLEAN} <b>TRUE</b> if the identity structure specified by the <i>EncryptedAuthData</i> parameter is encrypted; otherwise, <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//sspi/nf-sspi-sspiisauthidentityencrypted
     * @since windows6.1
     */
    static SspiIsAuthIdentityEncrypted(EncryptedAuthData) {
        EncryptedAuthDataMarshal := EncryptedAuthData is VarRef ? "ptr" : "ptr"

        result := DllCall("SECUR32.dll\SspiIsAuthIdentityEncrypted", EncryptedAuthDataMarshal, EncryptedAuthData, "char")
        return result
    }

    /**
     * Encodes the specified authentication identity as three strings.
     * @param {Pointer<Void>} pAuthIdentity The credential structure to be encoded.
     * @param {Pointer<PWSTR>} ppszUserName The marshaled user name of the identity specified by the <i>pAuthIdentity</i> parameter.
     * 
     * When you have finished using this string, free it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-sspifreeauthidentity">SspiFreeAuthIdentity</a> function.
     * @param {Pointer<PWSTR>} ppszDomainName The marshaled domain name of the identity specified by the <i>pAuthIdentity</i> parameter.
     * 
     * When you have finished using this string, free it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-sspifreeauthidentity">SspiFreeAuthIdentity</a> function.
     * @param {Pointer<PWSTR>} ppszPackedCredentialsString An encoded string version of a <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-sec_winnt_auth_identity_ex2">SEC_WINNT_AUTH_IDENTITY_EX2</a> structure that specifies the users credentials.
     * 
     * When you have finished using this string, free it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-sspifreeauthidentity">SspiFreeAuthIdentity</a> function.
     * @returns {HRESULT} If the function succeeds, it returns <b>SEC_E_OK</b>.
     * 
     * If the function fails, it returns a nonzero error code. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_INVALID_PARAMETER</b></dt>
     * <dt>0xC000000D</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>SEC_WINNT_AUTH_IDENTITY_FLAGS_PROCESS_ENCRYPTED</b> flag is set in the identity  structure specified by the <i>pAuthIdentity</i> parameter.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//sspi/nf-sspi-sspiencodeauthidentityasstrings
     * @since windows6.1
     */
    static SspiEncodeAuthIdentityAsStrings(pAuthIdentity, ppszUserName, ppszDomainName, ppszPackedCredentialsString) {
        pAuthIdentityMarshal := pAuthIdentity is VarRef ? "ptr" : "ptr"
        ppszUserNameMarshal := ppszUserName is VarRef ? "ptr*" : "ptr"
        ppszDomainNameMarshal := ppszDomainName is VarRef ? "ptr*" : "ptr"
        ppszPackedCredentialsStringMarshal := ppszPackedCredentialsString is VarRef ? "ptr*" : "ptr"

        result := DllCall("SECUR32.dll\SspiEncodeAuthIdentityAsStrings", pAuthIdentityMarshal, pAuthIdentity, ppszUserNameMarshal, ppszUserName, ppszDomainNameMarshal, ppszDomainName, ppszPackedCredentialsStringMarshal, ppszPackedCredentialsString, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Indicates whether the specified identity structure is valid.
     * @param {Pointer<Void>} AuthData The identity structure to test.
     * @returns {HRESULT} If the function succeeds, it returns <b>SEC_E_OK</b>, which indicates that the identity structure specified by the <i>AuthData</i> parameter is valid.
     * 
     * If the function fails, it returns a nonzero error code that indicates that the identity structure specified by the <i>AuthData</i> parameter is not valid.
     * @see https://docs.microsoft.com/windows/win32/api//sspi/nf-sspi-sspivalidateauthidentity
     * @since windows6.1
     */
    static SspiValidateAuthIdentity(AuthData) {
        AuthDataMarshal := AuthData is VarRef ? "ptr" : "ptr"

        result := DllCall("SECUR32.dll\SspiValidateAuthIdentity", AuthDataMarshal, AuthData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a copy of the specified opaque credential structure.
     * @param {Pointer<Void>} AuthData The credential structure to be copied.
     * @returns {Pointer<Void>} The structure that receives the copy of the structure specified by the <i>AuthData</i> parameter.
     * @see https://docs.microsoft.com/windows/win32/api//sspi/nf-sspi-sspicopyauthidentity
     * @since windows6.1
     */
    static SspiCopyAuthIdentity(AuthData) {
        AuthDataMarshal := AuthData is VarRef ? "ptr" : "ptr"

        result := DllCall("SECUR32.dll\SspiCopyAuthIdentity", AuthDataMarshal, AuthData, "ptr*", &AuthDataCopy := 0, "int")
        if(result != 0)
            throw OSError(result)

        return AuthDataCopy
    }

    /**
     * Frees the memory allocated for the specified identity structure.
     * @param {Pointer<Void>} AuthData The identity structure to free.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//sspi/nf-sspi-sspifreeauthidentity
     * @since windows6.1
     */
    static SspiFreeAuthIdentity(AuthData) {
        AuthDataMarshal := AuthData is VarRef ? "ptr" : "ptr"

        DllCall("SECUR32.dll\SspiFreeAuthIdentity", AuthDataMarshal, AuthData)
    }

    /**
     * Fills the block of memory associated with the specified identity structure with zeros.
     * @param {Pointer<Void>} AuthData The identity structure to fill with zeros.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//sspi/nf-sspi-sspizeroauthidentity
     * @since windows6.1
     */
    static SspiZeroAuthIdentity(AuthData) {
        AuthDataMarshal := AuthData is VarRef ? "ptr" : "ptr"

        DllCall("SECUR32.dll\SspiZeroAuthIdentity", AuthDataMarshal, AuthData)
    }

    /**
     * Frees the memory associated with the specified buffer.
     * @param {Pointer<Void>} DataBuffer The buffer to free.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//sspi/nf-sspi-sspilocalfree
     * @since windows6.1
     */
    static SspiLocalFree(DataBuffer) {
        DataBufferMarshal := DataBuffer is VarRef ? "ptr" : "ptr"

        DllCall("SECUR32.dll\SspiLocalFree", DataBufferMarshal, DataBuffer)
    }

    /**
     * Encodes a set of three credential strings as an authentication identity structure.
     * @param {PWSTR} pszUserName The user name associated with the identity to encode.
     * @param {PWSTR} pszDomainName The domain name associated with the identity to encode.
     * @param {PWSTR} pszPackedCredentialsString An encoded string version of a <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-sec_winnt_auth_identity_ex2">SEC_WINNT_AUTH_IDENTITY_EX2</a> structure that specifies the user's credentials.
     * @returns {Pointer<Void>} A pointer to the encoded identity structure.
     * 
     * When you have finished using this structure, free it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-sspifreeauthidentity">SspiFreeAuthIdentity</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//sspi/nf-sspi-sspiencodestringsasauthidentity
     * @since windows6.1
     */
    static SspiEncodeStringsAsAuthIdentity(pszUserName, pszDomainName, pszPackedCredentialsString) {
        pszUserName := pszUserName is String ? StrPtr(pszUserName) : pszUserName
        pszDomainName := pszDomainName is String ? StrPtr(pszDomainName) : pszDomainName
        pszPackedCredentialsString := pszPackedCredentialsString is String ? StrPtr(pszPackedCredentialsString) : pszPackedCredentialsString

        result := DllCall("SECUR32.dll\SspiEncodeStringsAsAuthIdentity", "ptr", pszUserName, "ptr", pszDomainName, "ptr", pszPackedCredentialsString, "ptr*", &ppAuthIdentity := 0, "int")
        if(result != 0)
            throw OSError(result)

        return ppAuthIdentity
    }

    /**
     * Compares the two specified credentials.
     * @param {Pointer<Void>} AuthIdentity1 A pointer to an opaque structure that specifies the first credential to compare.
     * @param {Pointer<Void>} AuthIdentity2 A pointer to an opaque structure that specifies the second credential to compare.
     * @param {Pointer<BOOLEAN>} SameSuppliedUser <b>TRUE</b> if the user account specified by the <i>AuthIdentity1</i> parameter is the same as the user account specified by the <i>AuthIdentity2</i> parameter; otherwise, <b>FALSE</b>.
     * @param {Pointer<BOOLEAN>} SameSuppliedIdentity <b>TRUE</b> if the identity specified by the <i>AuthIdentity1</i> parameter is the same as the identity specified by the <i>AuthIdentity2</i> parameter; otherwise, <b>FALSE</b>.
     * @returns {HRESULT} If the function succeeds, it returns <b>SEC_E_OK</b>.
     * 
     * If the function fails, it returns a nonzero error code.
     * @see https://docs.microsoft.com/windows/win32/api//sspi/nf-sspi-sspicompareauthidentities
     * @since windows6.1
     */
    static SspiCompareAuthIdentities(AuthIdentity1, AuthIdentity2, SameSuppliedUser, SameSuppliedIdentity) {
        AuthIdentity1Marshal := AuthIdentity1 is VarRef ? "ptr" : "ptr"
        AuthIdentity2Marshal := AuthIdentity2 is VarRef ? "ptr" : "ptr"
        SameSuppliedUserMarshal := SameSuppliedUser is VarRef ? "char*" : "ptr"
        SameSuppliedIdentityMarshal := SameSuppliedIdentity is VarRef ? "char*" : "ptr"

        result := DllCall("SECUR32.dll\SspiCompareAuthIdentities", AuthIdentity1Marshal, AuthIdentity1, AuthIdentity2Marshal, AuthIdentity2, SameSuppliedUserMarshal, SameSuppliedUser, SameSuppliedIdentityMarshal, SameSuppliedIdentity, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Serializes the specified identity structure into a byte array.
     * @param {Pointer<Void>} AuthIdentity The identity structure to serialize.
     * @param {Pointer<Integer>} AuthIdentityLength The length, in bytes, of the <i>AuthIdentityByteArray</i> array.
     * @param {Pointer<Pointer<Integer>>} AuthIdentityByteArray A pointer to an array of byte values that represents the identity specified by the <i>AuthIdentity</i> parameter.
     * @returns {HRESULT} If the function succeeds, it returns <b>SEC_E_OK</b>.
     * 
     * If the function fails, it returns a nonzero error code.
     * @see https://docs.microsoft.com/windows/win32/api//sspi/nf-sspi-sspimarshalauthidentity
     * @since windows6.1
     */
    static SspiMarshalAuthIdentity(AuthIdentity, AuthIdentityLength, AuthIdentityByteArray) {
        AuthIdentityMarshal := AuthIdentity is VarRef ? "ptr" : "ptr"
        AuthIdentityLengthMarshal := AuthIdentityLength is VarRef ? "uint*" : "ptr"
        AuthIdentityByteArrayMarshal := AuthIdentityByteArray is VarRef ? "ptr*" : "ptr"

        result := DllCall("SECUR32.dll\SspiMarshalAuthIdentity", AuthIdentityMarshal, AuthIdentity, AuthIdentityLengthMarshal, AuthIdentityLength, AuthIdentityByteArrayMarshal, AuthIdentityByteArray, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Deserializes the specified array of byte values into an identity structure.
     * @param {Integer} AuthIdentityLength The size, in bytes, of the <i>AuthIdentityByteArray</i> array.
     * @param {Pointer} AuthIdentityByteArray The array of byte values to deserialize.
     * @returns {Pointer<Void>} The deserialized identity structure.
     * @see https://docs.microsoft.com/windows/win32/api//sspi/nf-sspi-sspiunmarshalauthidentity
     * @since windows6.1
     */
    static SspiUnmarshalAuthIdentity(AuthIdentityLength, AuthIdentityByteArray) {
        result := DllCall("SECUR32.dll\SspiUnmarshalAuthIdentity", "uint", AuthIdentityLength, "ptr", AuthIdentityByteArray, "ptr*", &ppAuthIdentity := 0, "int")
        if(result != 0)
            throw OSError(result)

        return ppAuthIdentity
    }

    /**
     * Indicates whether an error returned after a call to either the InitializeSecurityContext or the AcceptSecurityContext function requires an additional call to the SspiPromptForCredentials function.
     * @param {Integer} ErrorOrNtStatus The error to test.
     * @returns {BOOLEAN} <b>TRUE</b> if the error specified by the <i>ErrorOrNtStatus</i> parameter indicates that an additional call to <a href="/windows/desktop/api/sspi/nf-sspi-sspipromptforcredentialsa">SspiPromptForCredentials</a> is necessary; otherwise, <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//sspi/nf-sspi-sspiispromptingneeded
     * @since windows6.1
     */
    static SspiIsPromptingNeeded(ErrorOrNtStatus) {
        result := DllCall("credui.dll\SspiIsPromptingNeeded", "uint", ErrorOrNtStatus, "char")
        return result
    }

    /**
     * Gets the host name associated with the specified target.
     * @param {PWSTR} pszTargetName The target for which to get the host name.
     * @returns {PWSTR} The name of the host associated with the target specified by the <i>pszTargetName</i> parameter.
     * @see https://docs.microsoft.com/windows/win32/api//sspi/nf-sspi-sspigettargethostname
     * @since windows6.1
     */
    static SspiGetTargetHostName(pszTargetName) {
        pszTargetName := pszTargetName is String ? StrPtr(pszTargetName) : pszTargetName

        result := DllCall("SECUR32.dll\SspiGetTargetHostName", "ptr", pszTargetName, "ptr*", &pszHostName := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pszHostName
    }

    /**
     * Creates a new identity structure that is a copy of the specified identity structure modified to exclude the specified security support provider (SSP).
     * @param {Pointer<Void>} AuthIdentity The identity structure to modify.
     * @param {PWSTR} pszPackageName The SSP to exclude.
     * @returns {Pointer<Void>} The modified identity structure.
     * @see https://docs.microsoft.com/windows/win32/api//sspi/nf-sspi-sspiexcludepackage
     * @since windows6.1
     */
    static SspiExcludePackage(AuthIdentity, pszPackageName) {
        pszPackageName := pszPackageName is String ? StrPtr(pszPackageName) : pszPackageName

        AuthIdentityMarshal := AuthIdentity is VarRef ? "ptr" : "ptr"

        result := DllCall("SECUR32.dll\SspiExcludePackage", AuthIdentityMarshal, AuthIdentity, "ptr", pszPackageName, "ptr*", &ppNewAuthIdentity := 0, "int")
        if(result != 0)
            throw OSError(result)

        return ppNewAuthIdentity
    }

    /**
     * 
     * @param {Pointer<SecPkgContext_Bindings>} pBindings 
     * @param {Integer} flags 
     * @returns {HRESULT} 
     */
    static SspiSetChannelBindingFlags(pBindings, flags) {
        result := DllCall("SspiCli.dll\SspiSetChannelBindingFlags", "ptr", pBindings, "uint", flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Adds a security support provider to the list of providers supported by Microsoft Negotiate.
     * @param {PSTR} pszPackageName The name of the package to add.
     * @param {Pointer<SECURITY_PACKAGE_OPTIONS>} pOptions A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-security_package_options">SECURITY_PACKAGE_OPTIONS</a> structure that specifies additional information about the security package.
     * @returns {HRESULT} If the function succeeds, it returns <b>SEC_E_OK</b>.
     * 
     * If the function fails, it returns a nonzero error code.
     * @see https://docs.microsoft.com/windows/win32/api//sspi/nf-sspi-addsecuritypackagea
     * @since windows6.1
     */
    static AddSecurityPackageA(pszPackageName, pOptions) {
        pszPackageName := pszPackageName is String ? StrPtr(pszPackageName) : pszPackageName

        result := DllCall("SECUR32.dll\AddSecurityPackageA", "ptr", pszPackageName, "ptr", pOptions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Adds a security support provider to the list of providers supported by Microsoft Negotiate.
     * @param {PWSTR} pszPackageName The name of the package to add.
     * @param {Pointer<SECURITY_PACKAGE_OPTIONS>} pOptions A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-security_package_options">SECURITY_PACKAGE_OPTIONS</a> structure that specifies additional information about the security package.
     * @returns {HRESULT} If the function succeeds, it returns <b>SEC_E_OK</b>.
     * 
     * If the function fails, it returns a nonzero error code.
     * @see https://docs.microsoft.com/windows/win32/api//sspi/nf-sspi-addsecuritypackagew
     * @since windows6.1
     */
    static AddSecurityPackageW(pszPackageName, pOptions) {
        pszPackageName := pszPackageName is String ? StrPtr(pszPackageName) : pszPackageName

        result := DllCall("SECUR32.dll\AddSecurityPackageW", "ptr", pszPackageName, "ptr", pOptions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Deletes a security support provider from the list of providers supported by Microsoft Negotiate.
     * @param {PSTR} pszPackageName The name of the security provider to delete.
     * @returns {HRESULT} If the function succeeds, it returns <b>SEC_E_OK</b>.
     * 
     * If the function fails, it returns a nonzero error code.
     * @see https://docs.microsoft.com/windows/win32/api//sspi/nf-sspi-deletesecuritypackagea
     * @since windows6.1
     */
    static DeleteSecurityPackageA(pszPackageName) {
        pszPackageName := pszPackageName is String ? StrPtr(pszPackageName) : pszPackageName

        result := DllCall("SECUR32.dll\DeleteSecurityPackageA", "ptr", pszPackageName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Deletes a security support provider from the list of providers supported by Microsoft Negotiate.
     * @param {PWSTR} pszPackageName The name of the security provider to delete.
     * @returns {HRESULT} If the function succeeds, it returns <b>SEC_E_OK</b>.
     * 
     * If the function fails, it returns a nonzero error code.
     * @see https://docs.microsoft.com/windows/win32/api//sspi/nf-sspi-deletesecuritypackagew
     * @since windows6.1
     */
    static DeleteSecurityPackageW(pszPackageName) {
        pszPackageName := pszPackageName is String ? StrPtr(pszPackageName) : pszPackageName

        result := DllCall("SECUR32.dll\DeleteSecurityPackageW", "ptr", pszPackageName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Serializes the specified target into an array of byte values.
     * @param {Pointer<CREDENTIAL_TARGET_INFORMATIONW>} InTargetInfo A pointer to a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/u-gly">Unicode</a> version of the <a href="https://docs.microsoft.com/windows/desktop/api/wincred/ns-wincred-credential_target_informationa">CREDENTIAL_TARGET_INFORMATION</a> structure that specifies the target to serialize.
     * @param {Pointer<Pointer<Integer>>} Buffer The serialized array of byte values that represents the target specified by the <i>InTargetInfo</i> parameter.
     * @param {Pointer<Integer>} BufferSize The size, in bytes, of the <i>Buffer</i> array.
     * @returns {NTSTATUS} If the function succeeds, it returns <b>STATUS_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code that indicates the reason it failed.
     * @see https://docs.microsoft.com/windows/win32/api//ntsecpkg/nf-ntsecpkg-credmarshaltargetinfo
     * @since windows6.0.6000
     */
    static CredMarshalTargetInfo(InTargetInfo, Buffer, BufferSize) {
        BufferMarshal := Buffer is VarRef ? "ptr*" : "ptr"
        BufferSizeMarshal := BufferSize is VarRef ? "uint*" : "ptr"

        result := DllCall("SECUR32.dll\CredMarshalTargetInfo", "ptr", InTargetInfo, BufferMarshal, Buffer, BufferSizeMarshal, BufferSize, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Pointer<CREDENTIAL_TARGET_INFORMATIONW>>} RetTargetInfo 
     * @param {Pointer<Integer>} RetActualSize 
     * @returns {NTSTATUS} 
     */
    static CredUnmarshalTargetInfo(Buffer, BufferSize, RetTargetInfo, RetActualSize) {
        RetTargetInfoMarshal := RetTargetInfo is VarRef ? "ptr*" : "ptr"
        RetActualSizeMarshal := RetActualSize is VarRef ? "uint*" : "ptr"

        result := DllCall("SECUR32.dll\CredUnmarshalTargetInfo", "ptr", Buffer, "uint", BufferSize, RetTargetInfoMarshal, RetTargetInfo, RetActualSizeMarshal, RetActualSize, "int")
        return result
    }

    /**
     * Removes the specified string from the Schannel cache.
     * @param {PSTR} pszTargetName A pointer to a null-terminated string that specifies the entry to remove from the cache. If the value of this parameter is <b>NULL</b>, all entries are removed from the cache.
     * @param {Integer} dwFlags This parameter is not used.
     * @returns {BOOL} Returns nonzero if the specified entries are removed from the Schannel cache or zero otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//schannel/nf-schannel-sslemptycachea
     * @since windows5.1.2600
     */
    static SslEmptyCacheA(pszTargetName, dwFlags) {
        pszTargetName := pszTargetName is String ? StrPtr(pszTargetName) : pszTargetName

        result := DllCall("SCHANNEL.dll\SslEmptyCacheA", "ptr", pszTargetName, "uint", dwFlags, "int")
        return result
    }

    /**
     * Removes the specified string from the Schannel cache.
     * @param {PWSTR} pszTargetName A pointer to a null-terminated string that specifies the entry to remove from the cache. If the value of this parameter is <b>NULL</b>, all entries are removed from the cache.
     * @param {Integer} dwFlags This parameter is not used.
     * @returns {BOOL} Returns nonzero if the specified entries are removed from the Schannel cache or zero otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//schannel/nf-schannel-sslemptycachew
     * @since windows5.1.2600
     */
    static SslEmptyCacheW(pszTargetName, dwFlags) {
        pszTargetName := pszTargetName is String ? StrPtr(pszTargetName) : pszTargetName

        result := DllCall("SCHANNEL.dll\SslEmptyCacheW", "ptr", pszTargetName, "uint", dwFlags, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pRandomData 
     * @param {Integer} cRandomData 
     * @returns {String} Nothing - always returns an empty string
     */
    static SslGenerateRandomBits(pRandomData, cRandomData) {
        pRandomDataMarshal := pRandomData is VarRef ? "char*" : "ptr"

        DllCall("SCHANNEL.dll\SslGenerateRandomBits", pRandomDataMarshal, pRandomData, "int", cRandomData)
    }

    /**
     * Returns an X509Certificate structure with the information contained in the specified certificate BLOB.
     * @param {Pointer<Integer>} pbCertificate The certificate BLOB from which to create the new <a href="https://docs.microsoft.com/windows/desktop/api/schannel/ns-schannel-x509certificate">X509Certificate</a> structure.
     * @param {Integer} cbCertificate The length, in bytes, of the BLOB contained in the <i>pbCertificate</i> parameter.
     * @param {Integer} dwFlags Set this value to <b>CF_CERT_FROM_FILE</b> to specify that the certificate BLOB contained in the <i>pbCertificate</i> parameter is from a file.
     * @param {Pointer<Pointer<X509Certificate>>} ppCertificate On return, receives the address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/schannel/ns-schannel-x509certificate">X509Certificate</a> structure that this function creates.
     * 
     * When you have finished using the <a href="https://docs.microsoft.com/windows/desktop/api/schannel/ns-schannel-x509certificate">X509Certificate</a> structure, free it by calling <a href="https://docs.microsoft.com/windows/desktop/api/schannel/nf-schannel-sslfreecertificate">SslFreeCertificate</a>.
     * @returns {BOOL} Returns nonzero if this function successfully created an <a href="/windows/desktop/api/schannel/ns-schannel-x509certificate">X509Certificate</a> structure or zero otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//schannel/nf-schannel-sslcrackcertificate
     * @since windows5.1.2600
     */
    static SslCrackCertificate(pbCertificate, cbCertificate, dwFlags, ppCertificate) {
        pbCertificateMarshal := pbCertificate is VarRef ? "char*" : "ptr"
        ppCertificateMarshal := ppCertificate is VarRef ? "ptr*" : "ptr"

        result := DllCall("SCHANNEL.dll\SslCrackCertificate", pbCertificateMarshal, pbCertificate, "uint", cbCertificate, "uint", dwFlags, ppCertificateMarshal, ppCertificate, "int")
        return result
    }

    /**
     * Frees a certificate that was allocated by a previous call to the SslCrackCertificate function.
     * @param {Pointer<X509Certificate>} pCertificate The certificate to free.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//schannel/nf-schannel-sslfreecertificate
     * @since windows5.1.2600
     */
    static SslFreeCertificate(pCertificate) {
        DllCall("SCHANNEL.dll\SslFreeCertificate", "ptr", pCertificate)
    }

    /**
     * 
     * @param {Integer} Reserved 
     * @returns {Integer} 
     */
    static SslGetMaximumKeySize(Reserved) {
        result := DllCall("SCHANNEL.dll\SslGetMaximumKeySize", "uint", Reserved, "uint")
        return result
    }

    /**
     * Gets the identity of the server.
     * @param {Pointer} ClientHello The message from the client.
     * @param {Integer} ClientHelloSize The size of the client message.
     * @param {Pointer<Pointer<Integer>>} ServerIdentity The pointer inside the message where the server name starts.
     * @param {Pointer<Integer>} ServerIdentitySize The length of the server name.
     * @param {Integer} Flags This parameter is reserved and must be zero.
     * @returns {HRESULT} The status of the call to the function.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters <i>ClientHello</i>, <i>ServerIdentity</i>, or <i>ServerIdentitySize</i> is <b>NULL</b>. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_INCOMPLETE_MESSAGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The  <i>ServerIdentitySize</i> parameter is smaller than the <i>ClientHelloSize</i> parameter.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//schannel/nf-schannel-sslgetserveridentity
     * @since windows8.0
     */
    static SslGetServerIdentity(ClientHello, ClientHelloSize, ServerIdentity, ServerIdentitySize, Flags) {
        ServerIdentityMarshal := ServerIdentity is VarRef ? "ptr*" : "ptr"
        ServerIdentitySizeMarshal := ServerIdentitySize is VarRef ? "uint*" : "ptr"

        result := DllCall("SCHANNEL.dll\SslGetServerIdentity", "ptr", ClientHello, "uint", ClientHelloSize, ServerIdentityMarshal, ServerIdentity, ServerIdentitySizeMarshal, ServerIdentitySize, "uint", Flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} clientHello 
     * @param {Integer} clientHelloByteSize 
     * @param {Pointer<SCH_EXTENSION_DATA>} genericExtensions 
     * @param {Integer} genericExtensionsCount 
     * @param {Integer} flags 
     * @returns {Integer} 
     */
    static SslGetExtensions(clientHello, clientHelloByteSize, genericExtensions, genericExtensionsCount, flags) {
        clientHelloMarshal := clientHello is VarRef ? "char*" : "ptr"

        result := DllCall("SCHANNEL.dll\SslGetExtensions", clientHelloMarshal, clientHello, "uint", clientHelloByteSize, "ptr", genericExtensions, "char", genericExtensionsCount, "uint*", &bytesToRead := 0, "int", flags, "int")
        if(result != 0)
            throw OSError(result)

        return bytesToRead
    }

    /**
     * 
     * @param {CRYPT_INTEGER_BLOB} SerializedCertificateStore 
     * @returns {Pointer<CERT_CONTEXT>} 
     */
    static SslDeserializeCertificateStore(SerializedCertificateStore) {
        result := DllCall("SCHANNEL.dll\SslDeserializeCertificateStore", "ptr", SerializedCertificateStore, "ptr*", &ppCertContext := 0, "int")
        if(result != 0)
            throw OSError(result)

        return ppCertContext
    }

    /**
     * Constructs one token binding that contains the exported public key and signature by using the specified key type for the token binding, a target identifier string for creating and retrieving the token binding key, and the unique data.
     * @param {Integer} keyType The negotiated key type to use. Use a value from the list of key types that you retrieved by calling the <a href="https://docs.microsoft.com/windows/desktop/api/tokenbinding/nf-tokenbinding-tokenbindinggetkeytypesclient">TokenBindingGetKeyTypesClient</a> function.
     * @param {PWSTR} targetURL The target string to use in conjunction with the key type  to generate or retrieve a token binding key for the NCrypt operations that build the buffer for the <i>tokenBinding</i> parameter.
     * @param {Integer} bindingType The type of token binding that <b>TokenBindingGenerateBinding</b> should generate.
     * @param {Pointer} tlsEKM A pointer to the buffer that contains unique data.
     * @param {Integer} tlsEKMSize The size of the buffer that the <i>tlsUnique</i> parameter points to, in bytes.
     * @param {Integer} extensionFormat The format to use to interpret the data in the <i>extensionData</i> parameter. This value must be <b>TOKENBINDING_EXTENSION_FORMAT_UNDEFINED</b>.
     * @param {Pointer<Void>} extensionData A pointer to a buffer that contains extension data. The value of the <i>extensionFormat</i> parameter determines how to interpret this data.
     * @param {Pointer<Pointer<Void>>} tokenBinding A pointer that receives the address of the token binding buffer. Use the <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapalloc">HeapAlloc</a> function to allocate the memory for this buffer, and the <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapfree">HeapFree</a> function to free that memory.
     * @param {Pointer<Integer>} tokenBindingSize Pointer to a variable that receives the size of the buffer allocated for the <i>tokenBinding</i> parameter, in bytes.
     * @param {Pointer<Pointer<TOKENBINDING_RESULT_DATA>>} resultData A pointer that receives the address of the buffer that contains result data that includes the token binding identifier of the token binding that  <b>TokenBindingGenerateBinding</b> generates. Use the <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapalloc">HeapAlloc</a> function to allocate the memory for this buffer, and the <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapfree">HeapFree</a> function to free that memory. Specify NULL is you do not need this information.
     * @returns {HRESULT} Returns a status code that indicates the success or failure of the function.
     * @see https://docs.microsoft.com/windows/win32/api//tokenbinding/nf-tokenbinding-tokenbindinggeneratebinding
     * @since windows10.0.10240
     */
    static TokenBindingGenerateBinding(keyType, targetURL, bindingType, tlsEKM, tlsEKMSize, extensionFormat, extensionData, tokenBinding, tokenBindingSize, resultData) {
        targetURL := targetURL is String ? StrPtr(targetURL) : targetURL

        extensionDataMarshal := extensionData is VarRef ? "ptr" : "ptr"
        tokenBindingMarshal := tokenBinding is VarRef ? "ptr*" : "ptr"
        tokenBindingSizeMarshal := tokenBindingSize is VarRef ? "uint*" : "ptr"
        resultDataMarshal := resultData is VarRef ? "ptr*" : "ptr"

        result := DllCall("TOKENBINDING.dll\TokenBindingGenerateBinding", "int", keyType, "ptr", targetURL, "int", bindingType, "ptr", tlsEKM, "uint", tlsEKMSize, "int", extensionFormat, extensionDataMarshal, extensionData, tokenBindingMarshal, tokenBinding, tokenBindingSizeMarshal, tokenBindingSize, resultDataMarshal, resultData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Assembles the list of token bindings and generates the final message for the client device to the server.
     * @param {Pointer<Pointer<Void>>} tokenBindings Pointer to an array of token binding structures.
     * @param {Pointer<Integer>} tokenBindingsSize An array that contains the sizes of the corresponding token binding structures that the array in the <i>tokenBindings</i> parameter contains, in bytes.
     * @param {Integer} tokenBindingsCount The number of elements that the array in the <i>tokenBindings</i> parameter contains. This value cannot be 0.
     * @param {Pointer<Pointer<Void>>} tokenBindingMessage A pointer that receives the address of the buffer that is allocated for the token binding message.  Use the <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapalloc">HeapAlloc</a> function to allocate the memory for this buffer, and the <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapfree">HeapFree</a> method to free that memory.
     * @param {Pointer<Integer>} tokenBindingMessageSize A pointer to a variable that contains the size of the buffer allocated for the <i>tokenBindingMessage</i> parameter.
     * @returns {HRESULT} Returns a status code that indicates the success or failure of the function.
     * @see https://docs.microsoft.com/windows/win32/api//tokenbinding/nf-tokenbinding-tokenbindinggeneratemessage
     * @since windows10.0.10240
     */
    static TokenBindingGenerateMessage(tokenBindings, tokenBindingsSize, tokenBindingsCount, tokenBindingMessage, tokenBindingMessageSize) {
        tokenBindingsMarshal := tokenBindings is VarRef ? "ptr*" : "ptr"
        tokenBindingsSizeMarshal := tokenBindingsSize is VarRef ? "uint*" : "ptr"
        tokenBindingMessageMarshal := tokenBindingMessage is VarRef ? "ptr*" : "ptr"
        tokenBindingMessageSizeMarshal := tokenBindingMessageSize is VarRef ? "uint*" : "ptr"

        result := DllCall("TOKENBINDING.dll\TokenBindingGenerateMessage", tokenBindingsMarshal, tokenBindings, tokenBindingsSizeMarshal, tokenBindingsSize, "uint", tokenBindingsCount, tokenBindingMessageMarshal, tokenBindingMessage, tokenBindingMessageSizeMarshal, tokenBindingMessageSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Validates the token binding message and verifies the token bindings that the message contains.
     * @param {Pointer} tokenBindingMessage A pointer to the buffer that contains the token binding message.
     * @param {Integer} tokenBindingMessageSize The size of the buffer that the <i>tokenBindingMessage</i> parameter points to, in bytes.
     * @param {Integer} keyType The negotiated key algorithm to use. Use a value from the list of key types that you retrieved by calling the <a href="https://docs.microsoft.com/windows/desktop/api/tokenbinding/nf-tokenbinding-tokenbindinggetkeytypesserver">TokenBindingGetKeyTypesServer</a> function.
     * @param {Pointer} tlsEKM A pointer to a buffer that contains unique data.
     * @param {Integer} tlsEKMSize The size of the buffer that the <i>tlsUnique</i> parameter points to, in bytes.
     * @returns {Pointer<TOKENBINDING_RESULT_LIST>} A pointer that receives the address for the buffer that contains the results for each of the token bindings that <b>TokenBindingVerifyMessage</b>   verifies.
     * 
     * In user mode, use <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapalloc">HeapAlloc</a> to allocate the memory for the buffer, and <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapfree">HeapFree</a> to free that memory. In kernel mode, use <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/wdm/nf-wdm-exallocatepoolwithtag">ExAllocatePoolWithTag</a>  to allocate the memory for the buffer, and <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/ntddk/nf-ntddk-exfreepool">ExFreePool</a> to free that memory.
     * @see https://docs.microsoft.com/windows/win32/api//tokenbinding/nf-tokenbinding-tokenbindingverifymessage
     * @since windows10.0.10240
     */
    static TokenBindingVerifyMessage(tokenBindingMessage, tokenBindingMessageSize, keyType, tlsEKM, tlsEKMSize) {
        result := DllCall("TOKENBINDING.dll\TokenBindingVerifyMessage", "ptr", tokenBindingMessage, "uint", tokenBindingMessageSize, "int", keyType, "ptr", tlsEKM, "uint", tlsEKMSize, "ptr*", &resultList := 0, "int")
        if(result != 0)
            throw OSError(result)

        return resultList
    }

    /**
     * Retrieves a list of the key types that the client device supports.
     * @returns {Pointer<TOKENBINDING_KEY_TYPES>} A pointer to a buffer that contains the list of key types that the client device supports. <b>TokenBindingGetKeyTypesClient</b> returns the string identifiers for well-known algorithms that correspond to the keys that the client device supports. Use <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapalloc">HeapAlloc</a> to allocate the memory for the buffer, and <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapfree">HeapFree</a> to free that memory.
     * @see https://docs.microsoft.com/windows/win32/api//tokenbinding/nf-tokenbinding-tokenbindinggetkeytypesclient
     * @since windows10.0.10240
     */
    static TokenBindingGetKeyTypesClient() {
        result := DllCall("TOKENBINDING.dll\TokenBindingGetKeyTypesClient", "ptr*", &keyTypes := 0, "int")
        if(result != 0)
            throw OSError(result)

        return keyTypes
    }

    /**
     * Retrieves a list of the key types that the server supports.
     * @returns {Pointer<TOKENBINDING_KEY_TYPES>} A pointer to a buffer that contains the list of key types that the server supports. <b>TokenBindingGetKeyTypesServer</b> returns the string identifiers for well-known algorithms that correspond to the keys that the server supports.
     * 
     * In user mode, use <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapalloc">HeapAlloc</a> to allocate the memory for the buffer, and <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapfree">HeapFree</a> to free that memory. In kernel mode, use <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/wdm/nf-wdm-exallocatepoolwithtag">ExAllocatePoolWithTag</a>  to allocate the memory for the buffer, and <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/ntddk/nf-ntddk-exfreepool">ExFreePool</a> to free that memory.
     * @see https://docs.microsoft.com/windows/win32/api//tokenbinding/nf-tokenbinding-tokenbindinggetkeytypesserver
     * @since windows10.0.10240
     */
    static TokenBindingGetKeyTypesServer() {
        result := DllCall("TOKENBINDING.dll\TokenBindingGetKeyTypesServer", "ptr*", &keyTypes := 0, "int")
        if(result != 0)
            throw OSError(result)

        return keyTypes
    }

    /**
     * Deletes the token binding key that is associated with the specified target string.
     * @param {PWSTR} targetURL The target string for which <b>TokenBindingDeleteBinding</b> should delete the associated token binding key.
     * @returns {HRESULT} Returns a status code that indicates the success or failure of the function.
     * @see https://docs.microsoft.com/windows/win32/api//tokenbinding/nf-tokenbinding-tokenbindingdeletebinding
     * @since windows10.0.10240
     */
    static TokenBindingDeleteBinding(targetURL) {
        targetURL := targetURL is String ? StrPtr(targetURL) : targetURL

        result := DllCall("TOKENBINDING.dll\TokenBindingDeleteBinding", "ptr", targetURL, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Deletes all token binding keys that are associated with the calling user or app container.
     * @returns {HRESULT} Returns a status code that indicates the success or failure of the function.
     * @see https://docs.microsoft.com/windows/win32/api//tokenbinding/nf-tokenbinding-tokenbindingdeleteallbindings
     * @since windows10.0.10240
     */
    static TokenBindingDeleteAllBindings() {
        result := DllCall("TOKENBINDING.dll\TokenBindingDeleteAllBindings", "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Constructs the token binding identifier by extracting the signature algorithm from the key type and copying the exported public key.
     * @param {Integer} keyType The negotiated key type to use. Use a value from the list of key types that you retrieved by calling the <a href="https://docs.microsoft.com/windows/desktop/api/tokenbinding/nf-tokenbinding-tokenbindinggetkeytypesclient">TokenBindingGetKeyTypesClient</a> function.
     * @param {Pointer} publicKey An exported public key blob.
     * @param {Integer} publicKeySize The size of the exported public key blob.
     * @returns {Pointer<TOKENBINDING_RESULT_DATA>} A pointer that receives the address of the buffer that is allocated for the token binding result data.  The token binding result data contains the token binding identifier. 
     * 
     * Use the <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapalloc">HeapAlloc</a> function to allocate the memory for this buffer, and the <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapfree">HeapFree</a> method to free that memory.
     * @see https://docs.microsoft.com/windows/win32/api//tokenbinding/nf-tokenbinding-tokenbindinggenerateid
     * @since windows10.0.10240
     */
    static TokenBindingGenerateID(keyType, publicKey, publicKeySize) {
        result := DllCall("TOKENBINDING.dll\TokenBindingGenerateID", "int", keyType, "ptr", publicKey, "uint", publicKeySize, "ptr*", &resultData := 0, "int")
        if(result != 0)
            throw OSError(result)

        return resultData
    }

    /**
     * 
     * @param {Integer} keyType 
     * @param {PWSTR} targetUri 
     * @returns {Pointer<TOKENBINDING_RESULT_DATA>} 
     */
    static TokenBindingGenerateIDForUri(keyType, targetUri) {
        targetUri := targetUri is String ? StrPtr(targetUri) : targetUri

        result := DllCall("TOKENBINDING.dll\TokenBindingGenerateIDForUri", "int", keyType, "ptr", targetUri, "ptr*", &resultData := 0, "int")
        if(result != 0)
            throw OSError(result)

        return resultData
    }

    /**
     * 
     * @param {Pointer<Integer>} majorVersion 
     * @param {Pointer<Integer>} minorVersion 
     * @returns {HRESULT} 
     */
    static TokenBindingGetHighestSupportedVersion(majorVersion, minorVersion) {
        majorVersionMarshal := majorVersion is VarRef ? "char*" : "ptr"
        minorVersionMarshal := minorVersion is VarRef ? "char*" : "ptr"

        result := DllCall("TOKENBINDING.dll\TokenBindingGetHighestSupportedVersion", majorVersionMarshal, majorVersion, minorVersionMarshal, minorVersion, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves the name of the user or other security principal associated with the calling thread. You can specify the format of the returned name.
     * @param {Integer} NameFormat The format of the name. This parameter is a value from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/secext/ne-secext-extended_name_format">EXTENDED_NAME_FORMAT</a> enumeration type. It cannot be <b>NameUnknown</b>. If the user account is not in a domain, only <b>NameSamCompatible</b> is supported.
     * @param {PSTR} lpNameBuffer A pointer to a buffer that receives the name in the specified format. The buffer must include space for the terminating null character.
     * @param {Pointer<Integer>} nSize On input, this variable specifies the size of the <i>lpNameBuffer</i> buffer, in <b>TCHARs</b>. If the function is successful, the variable receives the number of <b>TCHARs</b> copied to the buffer, not including the terminating null character. 
     * 
     * 
     * 
     * 
     * If <i>lpNameBuffer</i> is too small, the function fails and <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns ERROR_MORE_DATA. This parameter receives the required buffer size, in Unicode characters (whether or not Unicode is being used), including the terminating null character.
     * @returns {BOOLEAN} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpNameBuffer</i> buffer is too small. The <i>lpnSize</i> parameter contains the number of bytes required to receive the name.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SUCH_DOMAIN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The domain controller is not available to perform the lookup
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NONE_MAPPED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user name is not available in the specified format.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//secext/nf-secext-getusernameexa
     * @since windows5.0
     */
    static GetUserNameExA(NameFormat, lpNameBuffer, nSize) {
        lpNameBuffer := lpNameBuffer is String ? StrPtr(lpNameBuffer) : lpNameBuffer

        nSizeMarshal := nSize is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("SECUR32.dll\GetUserNameExA", "int", NameFormat, "ptr", lpNameBuffer, nSizeMarshal, nSize, "char")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the name of the user or other security principal associated with the calling thread. You can specify the format of the returned name.
     * @param {Integer} NameFormat The format of the name. This parameter is a value from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/secext/ne-secext-extended_name_format">EXTENDED_NAME_FORMAT</a> enumeration type. It cannot be <b>NameUnknown</b>. If the user account is not in a domain, only <b>NameSamCompatible</b> is supported.
     * @param {PWSTR} lpNameBuffer A pointer to a buffer that receives the name in the specified format. The buffer must include space for the terminating null character.
     * @param {Pointer<Integer>} nSize On input, this variable specifies the size of the <i>lpNameBuffer</i> buffer, in <b>TCHARs</b>. If the function is successful, the variable receives the number of <b>TCHARs</b> copied to the buffer, not including the terminating null character. 
     * 
     * 
     * 
     * 
     * If <i>lpNameBuffer</i> is too small, the function fails and <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns ERROR_MORE_DATA. This parameter receives the required buffer size, in Unicode characters (whether or not Unicode is being used), including the terminating null character.
     * @returns {BOOLEAN} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpNameBuffer</i> buffer is too small. The <i>lpnSize</i> parameter contains the number of bytes required to receive the name.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SUCH_DOMAIN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The domain controller is not available to perform the lookup
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NONE_MAPPED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user name is not available in the specified format.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//secext/nf-secext-getusernameexw
     * @since windows5.0
     */
    static GetUserNameExW(NameFormat, lpNameBuffer, nSize) {
        lpNameBuffer := lpNameBuffer is String ? StrPtr(lpNameBuffer) : lpNameBuffer

        nSizeMarshal := nSize is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("SECUR32.dll\GetUserNameExW", "int", NameFormat, "ptr", lpNameBuffer, nSizeMarshal, nSize, "char")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the local computer's name in a specified format.
     * @param {Integer} NameFormat The format for the name. This parameter is a value from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/secext/ne-secext-extended_name_format">EXTENDED_NAME_FORMAT</a> enumeration type. It cannot be NameUnknown.
     * @param {PSTR} lpNameBuffer A pointer to a buffer that receives the name in the specified format. 
     * 
     * 
     * 
     * 
     * If this parameter is <b>NULL</b>, either the function succeeds and the <i>lpnSize</i> parameter receives the required size, or the function fails with ERROR_INSUFFICIENT_BUFFER and <i>lpnSize</i> receives the required size. The behavior depends on the value of <i>NameFormat</i> and the version of the operating system.
     * @param {Pointer<Integer>} nSize On input, specifies the size of the <i>lpNameBuffer</i> buffer, in <b>TCHARs</b>. On success, receives the size of the name copied to the buffer. If the <i>lpNameBuffer</i> buffer is too small to hold the name, the function fails and <i>lpnSize</i> receives the required buffer size.
     * @returns {BOOLEAN} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//secext/nf-secext-getcomputerobjectnamea
     * @since windows5.0
     */
    static GetComputerObjectNameA(NameFormat, lpNameBuffer, nSize) {
        lpNameBuffer := lpNameBuffer is String ? StrPtr(lpNameBuffer) : lpNameBuffer

        nSizeMarshal := nSize is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("SECUR32.dll\GetComputerObjectNameA", "int", NameFormat, "ptr", lpNameBuffer, nSizeMarshal, nSize, "char")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the local computer's name in a specified format.
     * @param {Integer} NameFormat The format for the name. This parameter is a value from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/secext/ne-secext-extended_name_format">EXTENDED_NAME_FORMAT</a> enumeration type. It cannot be NameUnknown.
     * @param {PWSTR} lpNameBuffer A pointer to a buffer that receives the name in the specified format. 
     * 
     * 
     * 
     * 
     * If this parameter is <b>NULL</b>, either the function succeeds and the <i>lpnSize</i> parameter receives the required size, or the function fails with ERROR_INSUFFICIENT_BUFFER and <i>lpnSize</i> receives the required size. The behavior depends on the value of <i>NameFormat</i> and the version of the operating system.
     * @param {Pointer<Integer>} nSize On input, specifies the size of the <i>lpNameBuffer</i> buffer, in <b>TCHARs</b>. On success, receives the size of the name copied to the buffer. If the <i>lpNameBuffer</i> buffer is too small to hold the name, the function fails and <i>lpnSize</i> receives the required buffer size.
     * @returns {BOOLEAN} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//secext/nf-secext-getcomputerobjectnamew
     * @since windows5.0
     */
    static GetComputerObjectNameW(NameFormat, lpNameBuffer, nSize) {
        lpNameBuffer := lpNameBuffer is String ? StrPtr(lpNameBuffer) : lpNameBuffer

        nSizeMarshal := nSize is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("SECUR32.dll\GetComputerObjectNameW", "int", NameFormat, "ptr", lpNameBuffer, nSizeMarshal, nSize, "char")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Converts a directory service object name from one format to another.
     * @param {PSTR} lpAccountName The name to be translated.
     * @param {Integer} AccountNameFormat The format of the name to be translated. This parameter is a value from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/secext/ne-secext-extended_name_format">EXTENDED_NAME_FORMAT</a> enumeration type.
     * @param {Integer} DesiredNameFormat The format of the converted name. This parameter is a value from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/secext/ne-secext-extended_name_format">EXTENDED_NAME_FORMAT</a> enumeration type. It cannot be NameUnknown.
     * @param {PSTR} lpTranslatedName A pointer to a buffer that receives the converted name.
     * @param {Pointer<Integer>} nSize On input, the variable indicates the size of the <i>lpTranslatedName</i> buffer, in <b>TCHARs</b>. On output, the variable returns the size of the returned string, in <b>TCHARs</b>, including the terminating <b>null</b> character. 
     * 
     * 
     * 
     * 
     * If <i>lpTranslated</i> is <b>NULL</b> and <i>nSize</i> is 0, the function succeeds and <i>nSize</i> receives the required buffer size.
     * 
     * If the <i>lpTranslatedName</i> buffer is too small to hold the converted name, the function fails and <i>nSize</i> receives the required buffer size.
     * @returns {BOOLEAN} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//secext/nf-secext-translatenamea
     * @since windows5.0
     */
    static TranslateNameA(lpAccountName, AccountNameFormat, DesiredNameFormat, lpTranslatedName, nSize) {
        lpAccountName := lpAccountName is String ? StrPtr(lpAccountName) : lpAccountName
        lpTranslatedName := lpTranslatedName is String ? StrPtr(lpTranslatedName) : lpTranslatedName

        nSizeMarshal := nSize is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("SECUR32.dll\TranslateNameA", "ptr", lpAccountName, "int", AccountNameFormat, "int", DesiredNameFormat, "ptr", lpTranslatedName, nSizeMarshal, nSize, "char")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Converts a directory service object name from one format to another.
     * @param {PWSTR} lpAccountName The name to be translated.
     * @param {Integer} AccountNameFormat The format of the name to be translated. This parameter is a value from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/secext/ne-secext-extended_name_format">EXTENDED_NAME_FORMAT</a> enumeration type.
     * @param {Integer} DesiredNameFormat The format of the converted name. This parameter is a value from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/secext/ne-secext-extended_name_format">EXTENDED_NAME_FORMAT</a> enumeration type. It cannot be NameUnknown.
     * @param {PWSTR} lpTranslatedName A pointer to a buffer that receives the converted name.
     * @param {Pointer<Integer>} nSize On input, the variable indicates the size of the <i>lpTranslatedName</i> buffer, in <b>TCHARs</b>. On output, the variable returns the size of the returned string, in <b>TCHARs</b>, including the terminating <b>null</b> character. 
     * 
     * 
     * 
     * 
     * If <i>lpTranslated</i> is <b>NULL</b> and <i>nSize</i> is 0, the function succeeds and <i>nSize</i> receives the required buffer size.
     * 
     * If the <i>lpTranslatedName</i> buffer is too small to hold the converted name, the function fails and <i>nSize</i> receives the required buffer size.
     * @returns {BOOLEAN} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//secext/nf-secext-translatenamew
     * @since windows5.0
     */
    static TranslateNameW(lpAccountName, AccountNameFormat, DesiredNameFormat, lpTranslatedName, nSize) {
        lpAccountName := lpAccountName is String ? StrPtr(lpAccountName) : lpAccountName
        lpTranslatedName := lpTranslatedName is String ? StrPtr(lpTranslatedName) : lpTranslatedName

        nSizeMarshal := nSize is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("SECUR32.dll\TranslateNameW", "ptr", lpAccountName, "int", AccountNameFormat, "int", DesiredNameFormat, "ptr", lpTranslatedName, nSizeMarshal, nSize, "char")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Initializes the Software Licensing Client (SLC) and connects SLC to the Software Licensing Service (SLS).
     * @returns {Pointer<Void>} Type: <b>HSLC*</b>
     * 
     * A pointer to a context handle returned from the Software Licensing Service.
     * @see https://docs.microsoft.com/windows/win32/api//slpublic/nf-slpublic-slopen
     * @since windows8.0
     */
    static SLOpen() {
        result := DllCall("SLC.dll\SLOpen", "ptr*", &phSLC := 0, "int")
        if(result != 0)
            throw OSError(result)

        return phSLC
    }

    /**
     * Closes the Software Licensing Client (SLC) context handle.
     * @param {Pointer<Void>} hSLC Type: <b>HSLC</b>
     * 
     * The handle to the current SLC context.
     * @returns {HRESULT} Type: <b>HRESULT WINAPI</b>
     * 
     * If this function succeeds, it return <b>S_OK</b>.  Otherwise,  it returns an <b>HRESULT</b> error code.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * <dt>0x80070057</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//slpublic/nf-slpublic-slclose
     * @since windows8.0
     */
    static SLClose(hSLC) {
        hSLCMarshal := hSLC is VarRef ? "ptr" : "ptr"

        result := DllCall("SLC.dll\SLClose", hSLCMarshal, hSLC, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Registers the product key with SL.
     * @param {Pointer<Void>} hSLC Type: <b>HSLC</b>
     * 
     * The handle to the current SLC context.
     * @param {PWSTR} pwszPKeyAlgorithm Type: <b>PCWSTR</b>
     * 
     * The product key algorithm.
     * @param {PWSTR} pwszPKeyString Type: <b>PCWSTR</b>
     * 
     * The product key string.
     * @param {Integer} cbPKeySpecificData Type: <b>UINT</b>
     * 
     * The size, in bytes, of product key specific data. If there is no PKey specific data, set <i>cbPKeySpecificData</i> to 0.
     * @param {Pointer} pbPKeySpecificData Type: <b>PBYTE</b>
     * 
     * A pointer to the product key specific data. If there is no PKey specific data, set <i>pbPKeySpecificData</i> to <b>NULL</b>.
     * @param {Pointer<Guid>} pPkeyId Type: <b>SLID*</b>
     * 
     * A pointer to an identifier of the registered product key. This <b>SLID</b> can be used to reference PKey information later.
     * @returns {HRESULT} Type: <b>HRESULT WINAPI</b>
     * 
     * If this function succeeds, it return <b>S_OK</b>.  Otherwise, it returns an <b>HRESULT</b> error code.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * <dt>0x80070057</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * <dt>0x80070005</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Access denied (API requires admin privileges).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SL_E_LUA_ACCESSDENIED</b></dt>
     * <dt>0xC004F025</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The action requires administrator privilege.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SL_E_INVALID_PKEY</b></dt>
     * <dt>0xC004F010</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The product key is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SL_E_PRODUCT_SKU_NOT_INSTALLED</b></dt>
     * <dt>0xC004F015</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The license is not installed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SL_E_PKEY_INVALID_UPGRADE</b></dt>
     * <dt>0xC004F061</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This specified product key can only be used for upgrading, not for clean installations.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//slpublic/nf-slpublic-slinstallproofofpurchase
     * @since windows8.0
     */
    static SLInstallProofOfPurchase(hSLC, pwszPKeyAlgorithm, pwszPKeyString, cbPKeySpecificData, pbPKeySpecificData, pPkeyId) {
        pwszPKeyAlgorithm := pwszPKeyAlgorithm is String ? StrPtr(pwszPKeyAlgorithm) : pwszPKeyAlgorithm
        pwszPKeyString := pwszPKeyString is String ? StrPtr(pwszPKeyString) : pwszPKeyString

        hSLCMarshal := hSLC is VarRef ? "ptr" : "ptr"

        result := DllCall("SLC.dll\SLInstallProofOfPurchase", hSLCMarshal, hSLC, "ptr", pwszPKeyAlgorithm, "ptr", pwszPKeyString, "uint", cbPKeySpecificData, "ptr", pbPKeySpecificData, "ptr", pPkeyId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Unregisters the product key information.
     * @param {Pointer<Void>} hSLC Type: <b>HSLC</b>
     * 
     * The handle to the current SLC context.
     * @param {Pointer<Guid>} pPKeyId Type: <b>const SLID*</b>
     * 
     * A pointer to the identifier of the registered product key.
     * @returns {HRESULT} Type: <b>HRESULT WINAPI</b>
     * 
     * If this function succeeds, it return <b>S_OK</b>.  Otherwise, it returns an <b>HRESULT</b> error code.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * <dt>0x80070057</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * <dt>0x80070005</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Access denied (API requires admin privileges).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SL_E_LUA_ACCESSDENIED</b></dt>
     * <dt>0xC004F025</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The action requires administrator privilege.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SL_E_PKEY_NOT_INSTALLED</b></dt>
     * <dt>0xC004F014</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The product key is not available.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//slpublic/nf-slpublic-sluninstallproofofpurchase
     * @since windows8.0
     */
    static SLUninstallProofOfPurchase(hSLC, pPKeyId) {
        hSLCMarshal := hSLC is VarRef ? "ptr" : "ptr"

        result := DllCall("SLC.dll\SLUninstallProofOfPurchase", hSLCMarshal, hSLC, "ptr", pPKeyId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Stores the specified license and returns a license file ID.
     * @param {Pointer<Void>} hSLC Type: <b>HSLC</b>
     * 
     * The handle to the current SLC context.
     * @param {Integer} cbLicenseBlob Type: <b>UINT</b>
     * 
     * Size of license BLOB.
     * @param {Pointer} pbLicenseBlob Type: <b>const BYTE*</b>
     * 
     * A pointer to the licenses in the BLOB.
     * @param {Pointer<Guid>} pLicenseFileId Type: <b>SLID*</b>
     * 
     * A pointer to the license file ID.
     * @returns {HRESULT} Type: <b>HRESULT WINAPI</b>
     * 
     * If this function succeeds, it return <b>S_OK</b>.  Otherwise, it returns an <b>HRESULT</b> error code.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * <dt>0x80070057</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * <dt>0x80070005</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Access denied (API requires admin privileges).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SL_E_LUA_ACCESSDENIED</b></dt>
     * <dt>0xC004F025</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The action requires administrator privilege.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SL_E_INVALID_LICENSE</b></dt>
     * <dt>0xC004F01F</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The license is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//slpublic/nf-slpublic-slinstalllicense
     * @since windows8.0
     */
    static SLInstallLicense(hSLC, cbLicenseBlob, pbLicenseBlob, pLicenseFileId) {
        hSLCMarshal := hSLC is VarRef ? "ptr" : "ptr"

        result := DllCall("SLC.dll\SLInstallLicense", hSLCMarshal, hSLC, "uint", cbLicenseBlob, "ptr", pbLicenseBlob, "ptr", pLicenseFileId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Uninstalls the license specified by the license file ID and target user option.
     * @param {Pointer<Void>} hSLC Type: <b>HSLC</b>
     * 
     * The handle to the current SLC context.
     * @param {Pointer<Guid>} pLicenseFileId Type: <b>const SLID*</b>
     * 
     * A pointer to the license file ID.
     * @returns {HRESULT} Type: <b>HRESULT WINAPI</b>
     * 
     * If this function succeeds, it return <b>S_OK</b>.  Otherwise, it returns an <b>HRESULT</b> error code.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * <dt>0x80070057</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * <dt>0x80070005</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Access denied (API requires admin privileges)
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SL_E_LUA_ACCESSDENIED</b></dt>
     * <dt>0xC004F025</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The action requires administrator privilege.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SL_E_LICENSE_FILE_NOT_INSTALLED</b></dt>
     * <dt>0xC004F011</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The license file is not installed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//slpublic/nf-slpublic-sluninstalllicense
     * @since windows8.0
     */
    static SLUninstallLicense(hSLC, pLicenseFileId) {
        hSLCMarshal := hSLC is VarRef ? "ptr" : "ptr"

        result := DllCall("SLC.dll\SLUninstallLicense", hSLCMarshal, hSLC, "ptr", pLicenseFileId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Let an application to exercise rights on a locally-stored licenses.
     * @param {Pointer<Void>} hSLC Type: <b>HSLC</b>
     * 
     * The handle to the current SLC context.
     * @param {Pointer<Guid>} pAppId Type: <b>const SLID*</b>
     * 
     * A pointer to the identifier of the application who's right is going to be          
     * 		consumed.
     * @param {Pointer<Guid>} pProductSkuId Type: <b>const SLID*</b>
     * 
     * A pointer to the identifier of product SKU. If set to <b>NULL</b>, all of the  product  SKU's          
     * 		licenses will be consumed.
     * @param {PWSTR} pwszRightName Type: <b>PCWSTR</b>
     * 
     * The name of right to be consumed.
     * @returns {HRESULT} Type: <b>HRESULT WINAPI</b>
     * 
     * If this function succeeds, it return <b>S_OK</b>.  Otherwise,  it returns an <b>HRESULT</b> error code.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * <dt>0x80070057</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SL_E_RIGHT_NOT_GRANTED</b></dt>
     * <dt>0xC004F013</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have permission to run the software.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SL_E_PRODUCT_SKU_NOT_INSTALLED </b></dt>
     * <dt>0xC004F015</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The license is not installed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//slpublic/nf-slpublic-slconsumeright
     * @since windows8.0
     */
    static SLConsumeRight(hSLC, pAppId, pProductSkuId, pwszRightName) {
        static pvReserved := 0 ;Reserved parameters must always be NULL

        pwszRightName := pwszRightName is String ? StrPtr(pwszRightName) : pwszRightName

        hSLCMarshal := hSLC is VarRef ? "ptr" : "ptr"

        result := DllCall("SLC.dll\SLConsumeRight", hSLCMarshal, hSLC, "ptr", pAppId, "ptr", pProductSkuId, "ptr", pwszRightName, "ptr", pvReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Gets information about the specified product SKU.
     * @param {Pointer<Void>} hSLC Type: <b>HSLC</b>
     * 
     * The handle to the current SLC context.
     * @param {Pointer<Guid>} pProductSkuId Type: <b>const SLID*</b>
     * 
     * A pointer to the SKU ID.
     * @param {PWSTR} pwszValueName Type: <b>PCWSTR</b>
     * 
     * The name associated with the value to retrieve.  The following names are valid.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SL_INFO_KEY_NAME"></a><a id="sl_info_key_name"></a><dl>
     * <dt><b>SL_INFO_KEY_NAME</b></dt>
     * <dt>L"Name"</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The product name
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SL_INFO_KEY_DESCRIPTION"></a><a id="sl_info_key_description"></a><dl>
     * <dt><b>SL_INFO_KEY_DESCRIPTION</b></dt>
     * <dt>L"Description" </dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Description of the product
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SL_INFO_KEY_AUTHOR"></a><a id="sl_info_key_author"></a><dl>
     * <dt><b>SL_INFO_KEY_AUTHOR</b></dt>
     * <dt>L"Author"</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Author of the product
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} peDataType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/slpublic/ne-slpublic-sldatatype">SLDATATYPE</a>*</b>
     * 
     * A pointer to a value of the <a href="https://docs.microsoft.com/windows/desktop/api/slpublic/ne-slpublic-sldatatype">SLDATATYPE</a> enumeration that specifies the type of data in the <i>ppbValue</i> buffer.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SL_DATA_SZ"></a><a id="sl_data_sz"></a><dl>
     * <dt><b>SL_DATA_SZ</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * UNICODE string
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SL_DATA_DWORD"></a><a id="sl_data_dword"></a><dl>
     * <dt><b>SL_DATA_DWORD</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * DWORD
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SL_DATA_BINARY"></a><a id="sl_data_binary"></a><dl>
     * <dt><b>SL_DATA_BINARY</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Binary BLOB
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} pcbValue Type: <b>UINT*</b>
     * 
     * A pointer to the size, in bytes,  of the <i>ppbValue</i> buffer.
     * @param {Pointer<Pointer<Integer>>} ppbValue Type: <b>PBYTE*</b>
     * 
     * If successful, the data is returned in the buffer allocated by SLC.         
     * 		When finished using the memory, free it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> function.
     * @returns {HRESULT} Type: <b>HRESULT WINAPI</b>
     * 
     * If this function succeeds, it return <b>S_OK</b>.  Otherwise,  it returns an <b>HRESULT</b> error code.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * <dt>0x80070057</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SL_E_VALUE_NOT_FOUND</b></dt>
     * <dt>0xC004F012</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value for the input key was not found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//slpublic/nf-slpublic-slgetproductskuinformation
     * @since windows8.0
     */
    static SLGetProductSkuInformation(hSLC, pProductSkuId, pwszValueName, peDataType, pcbValue, ppbValue) {
        pwszValueName := pwszValueName is String ? StrPtr(pwszValueName) : pwszValueName

        hSLCMarshal := hSLC is VarRef ? "ptr" : "ptr"
        peDataTypeMarshal := peDataType is VarRef ? "uint*" : "ptr"
        pcbValueMarshal := pcbValue is VarRef ? "uint*" : "ptr"
        ppbValueMarshal := ppbValue is VarRef ? "ptr*" : "ptr"

        result := DllCall("SLC.dll\SLGetProductSkuInformation", hSLCMarshal, hSLC, "ptr", pProductSkuId, "ptr", pwszValueName, peDataTypeMarshal, peDataType, pcbValueMarshal, pcbValue, ppbValueMarshal, ppbValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Gets the information of the specified product key.
     * @param {Pointer<Void>} hSLC Type: <b>HSLC</b>
     * 
     * The handle to the current SLC context.
     * @param {Pointer<Guid>} pPKeyId Type: <b>const SLID*</b>
     * 
     * A pointer to the PKey ID.
     * @param {PWSTR} pwszValueName Type: <b>PCWSTR</b>
     * 
     * The name associated with the value to retrieve.  The following names are valid.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SL_INFO_KEY_DIGITAL_PID"></a><a id="sl_info_key_digital_pid"></a><dl>
     * <dt><b>SL_INFO_KEY_DIGITAL_PID</b></dt>
     * <dt>L"DigitalPID" </dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Formatted PID structure for a PID4
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SL_INFO_KEY_DIGITAL_PID2"></a><a id="sl_info_key_digital_pid2"></a><dl>
     * <dt><b>SL_INFO_KEY_DIGITAL_PID2</b></dt>
     * <dt>L"DigitalPID2"</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Formatted PID structure for a PID2
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SL_INFO_KEY_PARTIAL_PRODUCT_KEY"></a><a id="sl_info_key_partial_product_key"></a><dl>
     * <dt><b>SL_INFO_KEY_PARTIAL_PRODUCT_KEY</b></dt>
     * <dt>L"PartialProductKey"</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * First 5 characters of product key
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SL_INFO_KEY_PRODUCT_SKU_ID"></a><a id="sl_info_key_product_sku_id"></a><dl>
     * <dt><b>SL_INFO_KEY_PRODUCT_SKU_ID</b></dt>
     * <dt>L"ProductSkuId"</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * SKU SLID
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SL_INFO_KEY_CHANNEL"></a><a id="sl_info_key_channel"></a><dl>
     * <dt><b>SL_INFO_KEY_CHANNEL</b></dt>
     * <dt>L"Channel" </dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Channel ID
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} peDataType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/slpublic/ne-slpublic-sldatatype">SLDATATYPE</a>*</b>
     * 
     * The data type.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SL_DATA_SZ"></a><a id="sl_data_sz"></a><dl>
     * <dt><b>SL_DATA_SZ</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * UNICODE string
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SL_DATA_DWORD"></a><a id="sl_data_dword"></a><dl>
     * <dt><b>SL_DATA_DWORD</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * DWORD
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SL_DATA_BINARY"></a><a id="sl_data_binary"></a><dl>
     * <dt><b>SL_DATA_BINARY</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Binary BLOB
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} pcbValue Type: <b>UINT*</b>
     * 
     * A pointer to the size, in bytes, of the <i>ppbValue</i> buffer.
     * @param {Pointer<Pointer<Integer>>} ppbValue Type: <b>PBYTE*</b>
     * 
     * A pointer to the data returned by SLC.          
     * 		When finished using the memory, free it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> function.
     * @returns {HRESULT} Type: <b>HRESULT WINAPI</b>
     * 
     * If this function succeeds, it return <b>S_OK</b>.  Otherwise, it returns an <b>HRESULT</b> error code.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * <dt>0x80070057</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SL_E_PKEY_NOT_INSTALLED</b></dt>
     * <dt>0xC004F014</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The product key is not available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SL_E_NOT_SUPPORTED</b></dt>
     * <dt>0xC004F016</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The request is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//slpublic/nf-slpublic-slgetpkeyinformation
     * @since windows8.0
     */
    static SLGetPKeyInformation(hSLC, pPKeyId, pwszValueName, peDataType, pcbValue, ppbValue) {
        pwszValueName := pwszValueName is String ? StrPtr(pwszValueName) : pwszValueName

        hSLCMarshal := hSLC is VarRef ? "ptr" : "ptr"
        peDataTypeMarshal := peDataType is VarRef ? "uint*" : "ptr"
        pcbValueMarshal := pcbValue is VarRef ? "uint*" : "ptr"
        ppbValueMarshal := ppbValue is VarRef ? "ptr*" : "ptr"

        result := DllCall("SLC.dll\SLGetPKeyInformation", hSLCMarshal, hSLC, "ptr", pPKeyId, "ptr", pwszValueName, peDataTypeMarshal, peDataType, pcbValueMarshal, pcbValue, ppbValueMarshal, ppbValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Gets the specified license information.
     * @param {Pointer<Void>} hSLC Type: <b>HSLC</b>
     * 
     * The handle to the current SLC context.
     * @param {Pointer<Guid>} pSLLicenseId Type: <b>const SLID*</b>
     * 
     * A pointer to the license ID.
     * @param {PWSTR} pwszValueName Type: <b>PCWSTR</b>
     * 
     * The name associated with the value to retrieve.. The following values are valid.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SL_INFO_KEY_DESCRIPTION"></a><a id="sl_info_key_description"></a><dl>
     * <dt><b>SL_INFO_KEY_DESCRIPTION</b></dt>
     * <dt>L"Description"</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The description of the license.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SL_INFO_KEY_LICENSE_TYPE"></a><a id="sl_info_key_license_type"></a><dl>
     * <dt><b>SL_INFO_KEY_LICENSE_TYPE</b></dt>
     * <dt>L"LicenseType"</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The type of the license.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SL_INFO_KEY_VERSION"></a><a id="sl_info_key_version"></a><dl>
     * <dt><b>SL_INFO_KEY_VERSION</b></dt>
     * <dt>L"Version"</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The version of the license.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} peDataType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/slpublic/ne-slpublic-sldatatype">SLDATATYPE</a>*</b>
     * 
     * A pointer to a value of the <a href="https://docs.microsoft.com/windows/desktop/api/slpublic/ne-slpublic-sldatatype">SLDATATYPE</a> enumeration that specifies the type of data in the <i>ppbValue</i> buffer. Acceptable values are:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SL_DATA_SZ"></a><a id="sl_data_sz"></a><dl>
     * <dt><b>SL_DATA_SZ</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * UNICODE string
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SL_DATA_DWORD"></a><a id="sl_data_dword"></a><dl>
     * <dt><b>SL_DATA_DWORD</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * DWORD
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SL_DATA_BINARY"></a><a id="sl_data_binary"></a><dl>
     * <dt><b>SL_DATA_BINARY</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Binary BLOB
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} pcbValue Type: <b>UINT*</b>
     * 
     * A pointer to the size, in bytes, of the <i>ppbValue</i> buffer.
     * @param {Pointer<Pointer<Integer>>} ppbValue Type: <b>PBYTE*</b>
     * 
     * If successful, the data is returned in the buffer allocated by SLC.     
     * 		When finished using the memory, free it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> function.
     * @returns {HRESULT} Type: <b>HRESULT WINAPI</b>
     * 
     * If this function succeeds, it return <b>S_OK</b>.  Otherwise,  it returns an <b>HRESULT</b> error code.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * <dt>0x80070057</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SL_E_VALUE_NOT_FOUND</b></dt>
     * <dt>0xC004F012</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value for the input key was not found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//slpublic/nf-slpublic-slgetlicenseinformation
     * @since windows8.0
     */
    static SLGetLicenseInformation(hSLC, pSLLicenseId, pwszValueName, peDataType, pcbValue, ppbValue) {
        pwszValueName := pwszValueName is String ? StrPtr(pwszValueName) : pwszValueName

        hSLCMarshal := hSLC is VarRef ? "ptr" : "ptr"
        peDataTypeMarshal := peDataType is VarRef ? "uint*" : "ptr"
        pcbValueMarshal := pcbValue is VarRef ? "uint*" : "ptr"
        ppbValueMarshal := ppbValue is VarRef ? "ptr*" : "ptr"

        result := DllCall("SLC.dll\SLGetLicenseInformation", hSLCMarshal, hSLC, "ptr", pSLLicenseId, "ptr", pwszValueName, peDataTypeMarshal, peDataType, pcbValueMarshal, pcbValue, ppbValueMarshal, ppbValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Gets the licensing status of the specified application or SKU.
     * @param {Pointer<Void>} hSLC Type: <b>HSLC</b>
     * 
     * Handle to the current SLC context.
     * @param {Pointer<Guid>} pAppID Type: <b>const SLID*</b>
     * 
     * A pointer to a <b>SLID</b> that represents the application ID.
     * 		
     * 
     * <table>
     * <tr>
     * <th>pAppID</th>
     * <th>pProductSkuId</th>
     * <th>Results</th>
     * </tr>
     * <tr>
     * <td>
     * <b>NULL</b>
     * 
     * </td>
     * <td>
     * <b>NULL</b>
     * 
     * </td>
     * <td>
     * Get previous right consumption result.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <b>NULL</b>
     * 
     * </td>
     * <td>
     * Not <b>NULL</b>
     * 
     * </td>
     * <td>
     * Get licensing status of this SKU.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Not <b>NULL</b>
     * 
     * </td>
     * <td>
     * <b>NULL</b>
     * 
     * </td>
     * <td>
     * Get licensing status of this application.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Not <b>NULL</b>
     * 
     * </td>
     * <td>
     * Not <b>NULL</b>
     * 
     * </td>
     * <td>
     * Get licensing status of this application/SKU.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Guid>} pProductSkuId Type: <b>const SLID*</b>
     * 
     * A pointer to a <b>SLID</b> that represents the product ID.
     * 		
     * 
     * <table>
     * <tr>
     * <th>pAppID</th>
     * <th>pProductSkuId</th>
     * <th>Results</th>
     * </tr>
     * <tr>
     * <td>
     * <b>NULL</b>
     * 
     * </td>
     * <td>
     * <b>NULL</b>
     * 
     * </td>
     * <td>
     * Get previous right consumption result.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <b>NULL</b>
     * 
     * </td>
     * <td>
     * Not <b>NULL</b>
     * 
     * </td>
     * <td>
     * Get licensing status of this SKU.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Not <b>NULL</b>
     * 
     * </td>
     * <td>
     * <b>NULL</b>
     * 
     * </td>
     * <td>
     * Get licensing status of this application.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Not <b>NULL</b>
     * 
     * </td>
     * <td>
     * Not <b>NULL</b>
     * 
     * </td>
     * <td>
     * Get licensing status of this application/SKU.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {PWSTR} pwszRightName Type: <b>PCWSTR</b>
     * 
     * Must be <b>NULL</b>.
     * @param {Pointer<Integer>} pnStatusCount Type: <b>UINT*</b>
     * 
     * A pointer to the number of the SKU's status.
     * @param {Pointer<Pointer<SL_LICENSING_STATUS>>} ppLicensingStatus Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/slpublic/ns-slpublic-sl_licensing_status">SL_LICENSING_STATUS</a>**</b>
     * 
     * A pointer to the licensing status of the SKU.
     * @returns {HRESULT} Type: <b>HRESULT WINAPI</b>
     * 
     * If this function succeeds, it return <b>S_OK</b>.  Otherwise,  it returns an <b>HRESULT</b> error code.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * <dt>0x80070057</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SL_E_RIGHT_NOT_CONSUMED</b></dt>
     * <dt>0xC004F002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The rights consumption failed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//slpublic/nf-slpublic-slgetlicensingstatusinformation
     * @since windows8.0
     */
    static SLGetLicensingStatusInformation(hSLC, pAppID, pProductSkuId, pwszRightName, pnStatusCount, ppLicensingStatus) {
        pwszRightName := pwszRightName is String ? StrPtr(pwszRightName) : pwszRightName

        hSLCMarshal := hSLC is VarRef ? "ptr" : "ptr"
        pnStatusCountMarshal := pnStatusCount is VarRef ? "uint*" : "ptr"
        ppLicensingStatusMarshal := ppLicensingStatus is VarRef ? "ptr*" : "ptr"

        result := DllCall("SLC.dll\SLGetLicensingStatusInformation", hSLCMarshal, hSLC, "ptr", pAppID, "ptr", pProductSkuId, "ptr", pwszRightName, pnStatusCountMarshal, pnStatusCount, ppLicensingStatusMarshal, ppLicensingStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Gets the policy information after right has been consumed successfully.
     * @param {Pointer<Void>} hSLC Type: <b>HSLC</b>
     * 
     * The handle to the current SLC context.
     * @param {PWSTR} pwszValueName Type: <b>PCWSTR</b>
     * 
     * The policy name.
     * @param {Pointer<Integer>} peDataType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/slpublic/ne-slpublic-sldatatype">SLDATATYPE</a>*</b>
     * 
     * A pointer to a value of the <a href="https://docs.microsoft.com/windows/desktop/api/slpublic/ne-slpublic-sldatatype">SLDATATYPE</a> enumeration that specifies the type of data in the <i>ppbValue</i> buffer.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SL_DATA_SZ"></a><a id="sl_data_sz"></a><dl>
     * <dt><b>SL_DATA_SZ</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * UNICODE string
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SL_DATA_DWORD"></a><a id="sl_data_dword"></a><dl>
     * <dt><b>SL_DATA_DWORD</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * DWORD
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SL_DATA_BINARY"></a><a id="sl_data_binary"></a><dl>
     * <dt><b>SL_DATA_BINARY</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Binary BLOB
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} pcbValue Type: <b>UINT*</b>
     * 
     * A pointer to the size, in bytes, of the <i>ppbValue</i> buffer.
     * @param {Pointer<Pointer<Integer>>} ppbValue Type: <b>PBYTE*</b>
     * 
     * If successful, the data is returned in the buffer allocated by SLC. 
     * 		When finished using the memory, free it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> function.
     * @returns {HRESULT} Type: <b>HRESULT WINAPI</b>
     * 
     * If this function succeeds, it return <b>S_OK</b>.  Otherwise, it returns an <b>HRESULT</b> error code.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * <dt>0x80070057</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SL_E_VALUE_NOT_FOUND</b></dt>
     * <dt>0xC004F012</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value for the input key was not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SL_E_RIGHT_NOT_GRANTED</b></dt>
     * <dt>0xC004F013</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have permission to run the software.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//slpublic/nf-slpublic-slgetpolicyinformation
     * @since windows8.0
     */
    static SLGetPolicyInformation(hSLC, pwszValueName, peDataType, pcbValue, ppbValue) {
        pwszValueName := pwszValueName is String ? StrPtr(pwszValueName) : pwszValueName

        hSLCMarshal := hSLC is VarRef ? "ptr" : "ptr"
        peDataTypeMarshal := peDataType is VarRef ? "uint*" : "ptr"
        pcbValueMarshal := pcbValue is VarRef ? "uint*" : "ptr"
        ppbValueMarshal := ppbValue is VarRef ? "ptr*" : "ptr"

        result := DllCall("SLC.dll\SLGetPolicyInformation", hSLCMarshal, hSLC, "ptr", pwszValueName, peDataTypeMarshal, peDataType, pcbValueMarshal, pcbValue, ppbValueMarshal, ppbValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Gets the policy information after right has been consumed successfully.
     * @param {Pointer<Void>} hSLC Type: <b>HSLC</b>
     * 
     * The handle to the current SLC context.
     * @param {PWSTR} pwszValueName Type: <b>PCWSTR</b>
     * 
     * The policy name.
     * @returns {Integer} Type: <b>DWORD*</b>
     * 
     * A pointer to the return value.
     * @see https://docs.microsoft.com/windows/win32/api//slpublic/nf-slpublic-slgetpolicyinformationdword
     * @since windows8.0
     */
    static SLGetPolicyInformationDWORD(hSLC, pwszValueName) {
        pwszValueName := pwszValueName is String ? StrPtr(pwszValueName) : pwszValueName

        hSLCMarshal := hSLC is VarRef ? "ptr" : "ptr"

        result := DllCall("SLC.dll\SLGetPolicyInformationDWORD", hSLCMarshal, hSLC, "ptr", pwszValueName, "uint*", &pdwValue := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pdwValue
    }

    /**
     * Gets global data information.
     * @param {Pointer<Void>} hSLC Type: <b>HSLC</b>
     * 
     * The handle to the current SLC context.
     * @param {PWSTR} pwszValueName Type: <b>PCWSTR</b>
     * 
     * The name associated with the value to retrieve.  The following names are valid.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SL_INFO_KEY_VERSION"></a><a id="sl_info_key_version"></a><dl>
     * <dt><b>SL_INFO_KEY_VERSION</b></dt>
     * <dt>L"Version"</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Version of SL service. e.g. "1.2.3.4"
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SL_INFO_KEY_SYSTEM_STATE"></a><a id="sl_info_key_system_state"></a><dl>
     * <dt><b>SL_INFO_KEY_SYSTEM_STATE</b></dt>
     * <dt>L"SystemState"</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * System State
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SL_INFO_KEY_ACTIVE_PLUGINS"></a><a id="sl_info_key_active_plugins"></a><dl>
     * <dt><b>SL_INFO_KEY_ACTIVE_PLUGINS</b></dt>
     * <dt>L"ActivePlugins" </dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Fully-qualified DLL paths for all active plugins         
     * 				(<b>NULL</b> delimited and double <b>NULL</b>-terminated)
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SL_INFO_KEY_SECURE_STORE_ID"></a><a id="sl_info_key_secure_store_id"></a><dl>
     * <dt><b>SL_INFO_KEY_SECURE_STORE_ID</b></dt>
     * <dt>L"SecureStoreId"</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Secure store ID (GUID)
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SL_INFO_KEY_SESSION_MACHINE_ID"></a><a id="sl_info_key_session_machine_id"></a><dl>
     * <dt><b>SL_INFO_KEY_SESSION_MACHINE_ID</b></dt>
     * <dt>L"SessionMachineId"</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Session machine ID (Binary BLOB)
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} peDataType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/slpublic/ne-slpublic-sldatatype">SLDATATYPE</a>*</b>
     * 
     * A pointer to a value of the <a href="https://docs.microsoft.com/windows/desktop/api/slpublic/ne-slpublic-sldatatype">SLDATATYPE</a> enumeration that specifies the type of data in the <i>ppbValue</i> buffer.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SL_DATA_SZ"></a><a id="sl_data_sz"></a><dl>
     * <dt><b>SL_DATA_SZ</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>UNICODE</b> string
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SL_DATA_DWORD"></a><a id="sl_data_dword"></a><dl>
     * <dt><b>SL_DATA_DWORD</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>DWORD</b>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SL_DATA_BINARY"></a><a id="sl_data_binary"></a><dl>
     * <dt><b>SL_DATA_BINARY</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Binary blob
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SL_DATA_MULTI_SZ"></a><a id="sl_data_multi_sz"></a><dl>
     * <dt><b>SL_DATA_MULTI_SZ</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Double null-terminated <b>UNICODE</b> string array
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} pcbValue Type: <b>UINT*</b>
     * 
     * A pointer to the size, in bytes, of the <i>ppbValue</i> buffer.
     * @param {Pointer<Pointer<Integer>>} ppbValue Type: <b>PBYTE*</b>
     * 
     * If successful, the data is returned in the buffer allocated by SLC.    
     * 		When finished using the memory, free it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> function.
     * @returns {HRESULT} Type: <b>HRESULT WINAPI</b>
     * 
     * If this function succeeds, it return <b>S_OK</b>.  Otherwise, it returns an <b>HRESULT</b> error code.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * <dt>0x80070057</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SL_E_VALUE_NOT_FOUND</b></dt>
     * <dt>0xC004F012</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value for the input key was not found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//slpublic/nf-slpublic-slgetserviceinformation
     * @since windows8.0
     */
    static SLGetServiceInformation(hSLC, pwszValueName, peDataType, pcbValue, ppbValue) {
        pwszValueName := pwszValueName is String ? StrPtr(pwszValueName) : pwszValueName

        hSLCMarshal := hSLC is VarRef ? "ptr" : "ptr"
        peDataTypeMarshal := peDataType is VarRef ? "uint*" : "ptr"
        pcbValueMarshal := pcbValue is VarRef ? "uint*" : "ptr"
        ppbValueMarshal := ppbValue is VarRef ? "ptr*" : "ptr"

        result := DllCall("SLC.dll\SLGetServiceInformation", hSLCMarshal, hSLC, "ptr", pwszValueName, peDataTypeMarshal, peDataType, pcbValueMarshal, pcbValue, ppbValueMarshal, ppbValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Gets information about the specified application.
     * @param {Pointer<Void>} hSLC Type: <b>HSLC</b>
     * 
     * The handle to the current SLC context.
     * @param {Pointer<Guid>} pApplicationId Type: <b>const SLID*</b>
     * 
     * A pointer to the application ID.
     * @param {PWSTR} pwszValueName Type: <b>PCWSTR</b>
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SL_INFO_KEY_IS_KMS"></a><a id="sl_info_key_is_kms"></a><dl>
     * <dt><b>SL_INFO_KEY_IS_KMS</b></dt>
     * <dt>L"IsKeyManagementService"</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates whether the machine has a Key Management Service (KMS) enabled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SL_INFO_KEY_KMS_CURRENT_COUNT"></a><a id="sl_info_key_kms_current_count"></a><dl>
     * <dt><b>SL_INFO_KEY_KMS_CURRENT_COUNT</b></dt>
     * <dt>L"KeyManagementServiceCurrentCount" </dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The number of volume clients on a KMS host that are currently active.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SL_INFO_KEY_KMS_REQUIRED_CLIENT_COUNT"></a><a id="sl_info_key_kms_required_client_count"></a><dl>
     * <dt><b>SL_INFO_KEY_KMS_REQUIRED_CLIENT_COUNT</b></dt>
     * <dt>L"KeyManagementServiceRequiredClientCount"</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The minimum number of VL clients required to connect to a KMS host for enabling activation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SL_INFO_KEY_KMS_UNLICENSED_REQUESTS"></a><a id="sl_info_key_kms_unlicensed_requests"></a><dl>
     * <dt><b>SL_INFO_KEY_KMS_UNLICENSED_REQUESTS</b></dt>
     * <dt>L"KeyManagementServiceUnlicensedRequests"</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The number of KMS requests from VL clients with License Status=Unlicensed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SL_INFO_KEY_KMS_LICENSED_REQUESTS"></a><a id="sl_info_key_kms_licensed_requests"></a><dl>
     * <dt><b>SL_INFO_KEY_KMS_LICENSED_REQUESTS</b></dt>
     * <dt>L"KeyManagementServiceLicensedRequests"</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The number of KMS requests from VL clients with License Status=Licensed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SL_INFO_KEY_KMS_OOB_GRACE_REQUESTS"></a><a id="sl_info_key_kms_oob_grace_requests"></a><dl>
     * <dt><b>SL_INFO_KEY_KMS_OOB_GRACE_REQUESTS</b></dt>
     * <dt>L"KeyManagementServiceOOBGraceRequests"</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The number of KMS requests from VL clients with License Status=OOB Grace.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SL_INFO_KEY_KMS_OOT_GRACE_REQUESTS"></a><a id="sl_info_key_kms_oot_grace_requests"></a><dl>
     * <dt><b>SL_INFO_KEY_KMS_OOT_GRACE_REQUESTS</b></dt>
     * <dt>L"KeyManagementServiceOOTGraceRequests"</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The number of KMS requests from VL clients with License Status=OOT Grace.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SL_INFO_KEY_KMS_NON_GENUINE_GRACE_REQUESTS"></a><a id="sl_info_key_kms_non_genuine_grace_requests"></a><dl>
     * <dt><b>SL_INFO_KEY_KMS_NON_GENUINE_GRACE_REQUESTS</b></dt>
     * <dt>L"KeyManagementServiceNonGenuineGraceRequests"</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The number of KMS requests from VL clients with License Status=Non-Genuine Grace.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SL_INFO_KEY_KMS_NOTIFICATION_REQUESTS"></a><a id="sl_info_key_kms_notification_requests"></a><dl>
     * <dt><b>SL_INFO_KEY_KMS_NOTIFICATION_REQUESTS</b></dt>
     * <dt>L"KeyManagementServiceNotificationRequests"</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The number of KMS requests from VL clients with License Status=Notification.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SL_INFO_KEY_KMS_TOTAL_REQUESTS"></a><a id="sl_info_key_kms_total_requests"></a><dl>
     * <dt><b>SL_INFO_KEY_KMS_TOTAL_REQUESTS</b></dt>
     * <dt>L"KeyManagementServiceTotalRequests"</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Total number of valid KMS requests.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SL_INFO_KEY_KMS_FAILED_REQUESTS"></a><a id="sl_info_key_kms_failed_requests"></a><dl>
     * <dt><b>SL_INFO_KEY_KMS_FAILED_REQUESTS</b></dt>
     * <dt>L"KeyManagementServiceFailedRequests"</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Total number of failed KMS requests.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} peDataType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/slpublic/ne-slpublic-sldatatype">SLDATATYPE</a>*</b>
     * 
     * A pointer to a value of the <a href="https://docs.microsoft.com/windows/desktop/api/slpublic/ne-slpublic-sldatatype">SLDATATYPE</a> enumeration that specifies the type of data in the ppbValue buffer.  The following values are valid.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SL_DATA_SZ"></a><a id="sl_data_sz"></a><dl>
     * <dt><b>SL_DATA_SZ</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * UNICODE string
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SL_DATA_DWORD"></a><a id="sl_data_dword"></a><dl>
     * <dt><b>SL_DATA_DWORD</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * DWORD
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SL_DATA_BINARY"></a><a id="sl_data_binary"></a><dl>
     * <dt><b>SL_DATA_BINARY</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Binary blob
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} pcbValue Type: <b>UINT*</b>
     * 
     * A pointer to the size, in bytes, of the <i>ppbValue</i> buffer.
     * @param {Pointer<Pointer<Integer>>} ppbValue Type: <b>PBYTE*</b>
     * 
     * If successful, the data is returned in the buffer allocated by the SLC.       
     * 		When finished using the memory, free it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> function.
     * @returns {HRESULT} Type: <b>HRESULT WINAPI</b>
     * 
     * If this function succeeds, it return <b>S_OK</b>.  Otherwise, it returns an <b>HRESULT</b> error code.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * <dt>0x80070057</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are  not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SL_E_VALUE_NOT_FOUND</b></dt>
     * <dt>0xC004F012</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value for the input key was not found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//slpublic/nf-slpublic-slgetapplicationinformation
     * @since windows8.0
     */
    static SLGetApplicationInformation(hSLC, pApplicationId, pwszValueName, peDataType, pcbValue, ppbValue) {
        pwszValueName := pwszValueName is String ? StrPtr(pwszValueName) : pwszValueName

        hSLCMarshal := hSLC is VarRef ? "ptr" : "ptr"
        peDataTypeMarshal := peDataType is VarRef ? "uint*" : "ptr"
        pcbValueMarshal := pcbValue is VarRef ? "uint*" : "ptr"
        ppbValueMarshal := ppbValue is VarRef ? "ptr*" : "ptr"

        result := DllCall("SLC.dll\SLGetApplicationInformation", hSLCMarshal, hSLC, "ptr", pApplicationId, "ptr", pwszValueName, peDataTypeMarshal, peDataType, pcbValueMarshal, pcbValue, ppbValueMarshal, ppbValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Acquires a use license from the Software License Server (SLS).
     * @param {Pointer<Void>} hSLC Type: <b>HSLC</b>
     * 
     * The handle to the current SLC context.
     * @param {Pointer<Guid>} pProductSkuId Type: <b>const SLID*</b>
     * 
     *  A pointer to the product ID.
     * @param {Integer} cbAppSpecificData Type: <b>UINT</b>
     * 
     * The size of application specific data.
     * @param {Pointer<Void>} pvAppSpecificData Type: <b>const PVOID</b>
     * 
     * A pointer to application specific data. The license server can use this     
     * 		information to embed application specific run-time information.
     * @param {Pointer<SL_ACTIVATION_INFO_HEADER>} pActivationInfo Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/slpublic/ns-slpublic-sl_activation_info_header">SL_ACTIVATION_INFO_HEADER</a>*</b>
     * 
     * A pointer to additional product activation information.
     * @param {PWSTR} pwszProxyServer Type: <b>PCWSTR</b>
     * 
     * The proxy server name. Set this to <b>NULL</b> to use automatic proxy discovery.
     * @param {Integer} wProxyPort Type: <b>WORD</b>
     * 
     * The proxy server port. To use the default port, set <i>wProxyPort</i> to 0.
     * @returns {HRESULT} Type: <b>HRESULT WINAPI</b>
     * 
     * If this function succeeds, it return <b>S_OK</b>.  Otherwise,  it returns an <b>HRESULT</b> error code.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * <dt>0x80070057</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SL_E_PUBLISHING_LICENSE_NOT_INSTALLED</b></dt>
     * <dt>0xC004F017</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The license is not installed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SL_E_PKEY_NOT_INSTALLED</b></dt>
     * <dt>0xC004F014
     * </dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The product key is not available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SL_E_PRODUCT_SKU_NOT_INSTALLED</b></dt>
     * <dt>0xc004f015</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The license is not installed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//slpublic/nf-slpublic-slactivateproduct
     * @since windows8.0
     */
    static SLActivateProduct(hSLC, pProductSkuId, cbAppSpecificData, pvAppSpecificData, pActivationInfo, pwszProxyServer, wProxyPort) {
        pwszProxyServer := pwszProxyServer is String ? StrPtr(pwszProxyServer) : pwszProxyServer

        hSLCMarshal := hSLC is VarRef ? "ptr" : "ptr"
        pvAppSpecificDataMarshal := pvAppSpecificData is VarRef ? "ptr" : "ptr"

        result := DllCall("slcext.dll\SLActivateProduct", hSLCMarshal, hSLC, "ptr", pProductSkuId, "uint", cbAppSpecificData, pvAppSpecificDataMarshal, pvAppSpecificData, "ptr", pActivationInfo, "ptr", pwszProxyServer, "ushort", wProxyPort, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Checks the server status according to the specified URL and RequestType.
     * @param {PWSTR} pwszServerURL Type: <b>PCWSTR</b>
     * 
     * The URL of the server.
     * @param {PWSTR} pwszAcquisitionType Type: <b>PCWSTR</b>
     * 
     * The acquisition type.
     * @param {PWSTR} pwszProxyServer Type: <b>PCWSTR</b>
     * 
     * The proxy server name. Set to <b>NULL</b> for automatic proxy discovery.
     * @param {Integer} wProxyPort Type: <b>WORD</b>
     * 
     * The proxy server port. Set to 0 to use the default port.
     * @returns {HRESULT} Type: <b>HRESULT*</b>
     * 
     * A pointer to the server status.
     * @see https://docs.microsoft.com/windows/win32/api//slpublic/nf-slpublic-slgetserverstatus
     * @since windows8.0
     */
    static SLGetServerStatus(pwszServerURL, pwszAcquisitionType, pwszProxyServer, wProxyPort) {
        pwszServerURL := pwszServerURL is String ? StrPtr(pwszServerURL) : pwszServerURL
        pwszAcquisitionType := pwszAcquisitionType is String ? StrPtr(pwszAcquisitionType) : pwszAcquisitionType
        pwszProxyServer := pwszProxyServer is String ? StrPtr(pwszProxyServer) : pwszProxyServer

        result := DllCall("slcext.dll\SLGetServerStatus", "ptr", pwszServerURL, "ptr", pwszAcquisitionType, "ptr", pwszProxyServer, "ushort", wProxyPort, "int*", &phrStatus := 0, "int")
        if(result != 0)
            throw OSError(result)

        return phrStatus
    }

    /**
     * Generates the Installation ID (IID).
     * @param {Pointer<Void>} hSLC Type: <b>HSLC</b>
     * 
     * The handle to the current SLC context.
     * @param {Pointer<Guid>} pProductSkuId Type: <b>const SLID*</b>
     * 
     * A pointer to the product ID.
     * @returns {PWSTR} Type: <b>PWSTR*</b>
     * 
     * The Installation ID string. Once you are finished, call the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> function to      
     * 		free the memory.
     * @see https://docs.microsoft.com/windows/win32/api//slpublic/nf-slpublic-slgenerateofflineinstallationid
     * @since windows8.0
     */
    static SLGenerateOfflineInstallationId(hSLC, pProductSkuId) {
        hSLCMarshal := hSLC is VarRef ? "ptr" : "ptr"

        result := DllCall("SLC.dll\SLGenerateOfflineInstallationId", hSLCMarshal, hSLC, "ptr", pProductSkuId, "ptr*", &ppwszInstallationId := 0, "int")
        if(result != 0)
            throw OSError(result)

        return ppwszInstallationId
    }

    /**
     * Generates Installation ID (IID).
     * @param {Pointer<Void>} hSLC Type: <b>HSLC</b>
     * 
     * The handle to the current SLC context.
     * @param {Pointer<Guid>} pProductSkuId Type: <b>const SLID*</b>
     * 
     * A pointer the product ID.
     * @param {Pointer<SL_ACTIVATION_INFO_HEADER>} pActivationInfo Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/slpublic/ns-slpublic-sl_activation_info_header">SL_ACTIVATION_INFO_HEADER</a>*</b>
     * 
     * A pointer to additional information.
     * @returns {PWSTR} Type: <b>PWSTR*</b>
     * 
     * The Installation ID string. Once you are finished, call the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> function to      
     * 		free the memory.
     * @see https://docs.microsoft.com/windows/win32/api//slpublic/nf-slpublic-slgenerateofflineinstallationidex
     * @since windows8.0
     */
    static SLGenerateOfflineInstallationIdEx(hSLC, pProductSkuId, pActivationInfo) {
        hSLCMarshal := hSLC is VarRef ? "ptr" : "ptr"

        result := DllCall("SLC.dll\SLGenerateOfflineInstallationIdEx", hSLCMarshal, hSLC, "ptr", pProductSkuId, "ptr", pActivationInfo, "ptr*", &ppwszInstallationId := 0, "int")
        if(result != 0)
            throw OSError(result)

        return ppwszInstallationId
    }

    /**
     * Deposits Installation ID (IID) and Confirmation ID (CID) for offline activation.
     * @param {Pointer<Void>} hSLC Type: <b>HSLC</b>
     * 
     * The handle to the current SLC context.
     * @param {Pointer<Guid>} pProductSkuId Type: <b>const SLID*</b>
     * 
     * A pointer to the product ID.
     * @param {PWSTR} pwszInstallationId Type: <b>PCWSTR</b>
     * 
     * The Installation ID generated by the <a href="https://docs.microsoft.com/windows/desktop/api/slpublic/nf-slpublic-slgenerateofflineinstallationid">SLGenerateOfflineInstallationId</a> function.
     * @param {PWSTR} pwszConfirmationId Type: <b>PCWSTR</b>
     * 
     * The confirmation ID CSR.
     * @returns {HRESULT} Type: <b>HRESULT WINAPI</b>
     * 
     * If this function succeeds, it return <b>S_OK</b>.  Otherwise,  it returns an <b>HRESULT</b> error code.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * <dt>0x80070057</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SL_E_CIDIID_INVALID_CHECK_DIGITS</b></dt>
     * <dt>0xC004F04D</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Installation ID (IID) or the Confirmation ID (CID) is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SL_E_PRODUCT_SKU_NOT_INSTALLED</b></dt>
     * <dt>0xC004F015</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The license is not installed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//slpublic/nf-slpublic-sldepositofflineconfirmationid
     * @since windows8.0
     */
    static SLDepositOfflineConfirmationId(hSLC, pProductSkuId, pwszInstallationId, pwszConfirmationId) {
        pwszInstallationId := pwszInstallationId is String ? StrPtr(pwszInstallationId) : pwszInstallationId
        pwszConfirmationId := pwszConfirmationId is String ? StrPtr(pwszConfirmationId) : pwszConfirmationId

        hSLCMarshal := hSLC is VarRef ? "ptr" : "ptr"

        result := DllCall("SLC.dll\SLDepositOfflineConfirmationId", hSLCMarshal, hSLC, "ptr", pProductSkuId, "ptr", pwszInstallationId, "ptr", pwszConfirmationId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Deposits Installation ID (IID) and Confirmation ID (CID) for offline activation.
     * @param {Pointer<Void>} hSLC Type: <b>HSLC</b>
     * 
     * The handle to the current SLC context.
     * @param {Pointer<Guid>} pProductSkuId Type: <b>const SLID*</b>
     * 
     * A pointer to the product ID.
     * @param {Pointer<SL_ACTIVATION_INFO_HEADER>} pActivationInfo Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/slpublic/ns-slpublic-sl_activation_info_header">SL_ACTIVATION_INFO_HEADER</a>*</b>
     * 
     * A pointer to additional information.
     * @param {PWSTR} pwszInstallationId Type: <b>PCWSTR</b>
     * 
     * The Installation ID generated by the <a href="https://docs.microsoft.com/windows/desktop/api/slpublic/nf-slpublic-slgenerateofflineinstallationid">SLGenerateOfflineInstallationId</a> function.
     * @param {PWSTR} pwszConfirmationId Type: <b>PCWSTR</b>
     * 
     * The Confirmation ID CSR.
     * @returns {HRESULT} Type: <b>HRESULT WINAPI</b>
     * 
     * If this function succeeds, it return <b>S_OK</b>.  Otherwise,  it returns an <b>HRESULT</b> error code.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * <dt>0x80070057</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SL_E_CIDIID_INVALID_CHECK_DIGITS</b></dt>
     * <dt>0xC004F04D</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Installation ID (IID) or the Confirmation ID (CID) is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SL_E_PRODUCT_SKU_NOT_INSTALLED</b></dt>
     * <dt>0xC004F015</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The license is not installed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//slpublic/nf-slpublic-sldepositofflineconfirmationidex
     * @since windows8.0
     */
    static SLDepositOfflineConfirmationIdEx(hSLC, pProductSkuId, pActivationInfo, pwszInstallationId, pwszConfirmationId) {
        pwszInstallationId := pwszInstallationId is String ? StrPtr(pwszInstallationId) : pwszInstallationId
        pwszConfirmationId := pwszConfirmationId is String ? StrPtr(pwszConfirmationId) : pwszConfirmationId

        hSLCMarshal := hSLC is VarRef ? "ptr" : "ptr"

        result := DllCall("SLC.dll\SLDepositOfflineConfirmationIdEx", hSLCMarshal, hSLC, "ptr", pProductSkuId, "ptr", pActivationInfo, "ptr", pwszInstallationId, "ptr", pwszConfirmationId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Gets the registered product key ID associated with the product.
     * @param {Pointer<Void>} hSLC The handle to the current SLC context.
     * @param {PWSTR} pwszPKeyAlgorithm The product key algorithm.
     * @param {PWSTR} pwszPKeyString The product key string.
     * @param {Integer} cbPKeySpecificData The size, in bytes, of the product key specific data. If there is no PKey specific data, set <i>cbPKeySpecificData</i> to 0.
     * @param {Pointer} pbPKeySpecificData A pointer to the product key specific data. If there is no PKey specific data, set <i>pbPKeySpecificData</i> to <b>NULL</b>.
     * @param {Pointer<Guid>} pPKeyId A pointer to the product key ID.
     * @returns {HRESULT} If this function succeeds, it return <b>S_OK</b>.  Otherwise,  it returns an <b>HRESULT</b> error code.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * <dt>0x80070057</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SL_E_PKEY_NOT_INSTALLED</b></dt>
     * <dt>0xC004F014</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The product key is not available.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//slpublic/nf-slpublic-slgetpkeyid
     * @since windows8.0
     */
    static SLGetPKeyId(hSLC, pwszPKeyAlgorithm, pwszPKeyString, cbPKeySpecificData, pbPKeySpecificData, pPKeyId) {
        pwszPKeyAlgorithm := pwszPKeyAlgorithm is String ? StrPtr(pwszPKeyAlgorithm) : pwszPKeyAlgorithm
        pwszPKeyString := pwszPKeyString is String ? StrPtr(pwszPKeyString) : pwszPKeyString

        hSLCMarshal := hSLC is VarRef ? "ptr" : "ptr"

        result := DllCall("SLC.dll\SLGetPKeyId", hSLCMarshal, hSLC, "ptr", pwszPKeyAlgorithm, "ptr", pwszPKeyString, "uint", cbPKeySpecificData, "ptr", pbPKeySpecificData, "ptr", pPKeyId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * This function returns a list of product key IDs associated with the specified Product SKU ID.
     * @param {Pointer<Void>} hSLC Type: <b>HSLC</b>
     * 
     * The handle to the current SLC session.
     * @param {Pointer<Guid>} pProductSkuId Type: <b>const SLID*</b>
     * 
     * A pointer to the product SKU ID.
     * @param {Pointer<Integer>} pnProductKeyIds Type: <b>UINT*</b>
     * 
     * A pointer to the number of product Key IDs returned.
     * @param {Pointer<Pointer<Guid>>} ppProductKeyIds Type: <b>SLID**</b>
     * 
     * A pointer to an array of the product Key IDs.
     * @returns {HRESULT} Type: <b>HRESULT WINAPI</b>
     * 
     * If this function succeeds, it return <b>S_OK</b>.  Otherwise, it returns an <b>HRESULT</b> error code.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SL_E_VALUE_NOT_FOUND</b></dt>
     * <dt>0xC004F012</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value for the input key was not found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//slpublic/nf-slpublic-slgetinstalledproductkeyids
     * @since windows8.0
     */
    static SLGetInstalledProductKeyIds(hSLC, pProductSkuId, pnProductKeyIds, ppProductKeyIds) {
        hSLCMarshal := hSLC is VarRef ? "ptr" : "ptr"
        pnProductKeyIdsMarshal := pnProductKeyIds is VarRef ? "uint*" : "ptr"
        ppProductKeyIdsMarshal := ppProductKeyIds is VarRef ? "ptr*" : "ptr"

        result := DllCall("SLC.dll\SLGetInstalledProductKeyIds", hSLCMarshal, hSLC, "ptr", pProductSkuId, pnProductKeyIdsMarshal, pnProductKeyIds, ppProductKeyIdsMarshal, ppProductKeyIds, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Sets the current product key to the previously installed product key.
     * @param {Pointer<Void>} hSLC Type: <b>HSLC</b>
     * 
     * The handle to the current SLC context.
     * @param {Pointer<Guid>} pProductSkuId Type: <b>const SLID*</b>
     * 
     * A pointer to the product SKU ID.
     * @param {Pointer<Guid>} pProductKeyId Type: <b>const SLID*</b>
     * 
     * A pointer to the product key ID.
     * @returns {HRESULT} Type: <b>HRESULT WINAPI</b>
     * 
     * If this function succeeds, it return <b>S_OK</b>.  Otherwise, it returns an <b>HRESULT</b> error code.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SL_E_MISMATCHED_PRODUCT_SKU</b></dt>
     * <dt>0xC004F069</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The product SKU is not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SL_E_PKEY_NOT_INSTALLED</b></dt>
     * <dt>0xC004F014</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The product key is not available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SL_E_OPERATION_NOT_ALLOWED</b></dt>
     * <dt>0xC004F06A</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested operation is not allowed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//slpublic/nf-slpublic-slsetcurrentproductkey
     * @since windows8.0
     */
    static SLSetCurrentProductKey(hSLC, pProductSkuId, pProductKeyId) {
        hSLCMarshal := hSLC is VarRef ? "ptr" : "ptr"

        result := DllCall("SLC.dll\SLSetCurrentProductKey", hSLCMarshal, hSLC, "ptr", pProductSkuId, "ptr", pProductKeyId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Gets a list of SLIDs according to the input query ID type and the ID value.
     * @param {Pointer<Void>} hSLC Type: <b>HSLC</b>
     * 
     * The handle to the current SLC context.
     * @param {Integer} eQueryIdType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/slpublic/ne-slpublic-slidtype">SLIDTYPE</a></b>
     * 
     * The type of input ID.
     * @param {Pointer<Guid>} pQueryId Type: <b>const SLID*</b>
     * 
     * A pointer to the input ID.
     * @param {Integer} eReturnIdType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/slpublic/ne-slpublic-slidtype">SLIDTYPE</a></b>
     * 
     * The type of returned IDs.
     * @param {Pointer<Integer>} pnReturnIds Type: <b>UINT*</b>
     * 
     * A pointer to the number of returned IDs.
     * @param {Pointer<Pointer<Guid>>} ppReturnIds Type: <b>SLID**</b>
     * 
     * An array of returned IDs.
     * @returns {HRESULT} Type: <b>HRESULT WINAPI</b>
     * 
     * If this function succeeds, it return <b>S_OK</b>.  Otherwise, it returns an <b>HRESULT</b> error code.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * <dt>0x80070057</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SL_E_VALUE_NOT_FOUND</b></dt>
     * <dt>0xC004F012</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value for the input key was not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SL_E_NOT_SUPPORT</b></dt>
     * <dt>0xC004F016</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The request is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//slpublic/nf-slpublic-slgetslidlist
     * @since windows8.0
     */
    static SLGetSLIDList(hSLC, eQueryIdType, pQueryId, eReturnIdType, pnReturnIds, ppReturnIds) {
        hSLCMarshal := hSLC is VarRef ? "ptr" : "ptr"
        pnReturnIdsMarshal := pnReturnIds is VarRef ? "uint*" : "ptr"
        ppReturnIdsMarshal := ppReturnIds is VarRef ? "ptr*" : "ptr"

        result := DllCall("SLC.dll\SLGetSLIDList", hSLCMarshal, hSLC, "int", eQueryIdType, "ptr", pQueryId, "int", eReturnIdType, pnReturnIdsMarshal, pnReturnIds, ppReturnIdsMarshal, ppReturnIds, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Checks if the license BLOB has been installed already.
     * @param {Pointer<Void>} hSLC The handle to the current SLC context.
     * @param {Integer} cbLicenseBlob The size, in bytes, of the license BLOB.
     * @param {Pointer} pbLicenseBlob A pointer to the number of licenses in the BLOB.
     * @param {Pointer<Guid>} pLicenseFileId A pointer to the license file ID.
     * @returns {HRESULT} If the License has been previously installed, it returns a <b>SLID</b>.  Otherwise,  it returns an <b>HRESULT</b> error code.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * <dt>0x80070057</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SL_E_INVALID_LICENSE</b></dt>
     * <dt>0xC004F01F</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The license is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SL_E_LICENSE_FILE_NOT_INSTALLED</b></dt>
     * <dt>0xC004F011</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The license file is not installed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//slpublic/nf-slpublic-slgetlicensefileid
     * @since windows8.0
     */
    static SLGetLicenseFileId(hSLC, cbLicenseBlob, pbLicenseBlob, pLicenseFileId) {
        hSLCMarshal := hSLC is VarRef ? "ptr" : "ptr"

        result := DllCall("SLC.dll\SLGetLicenseFileId", hSLCMarshal, hSLC, "uint", cbLicenseBlob, "ptr", pbLicenseBlob, "ptr", pLicenseFileId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Returns the license file BLOB.
     * @param {Pointer<Void>} hSLC Type: <b>HSLC</b>
     * 
     * The handle to the current SLC context.
     * @param {Pointer<Guid>} pLicenseFileId Type: <b>const SLID*</b>
     * 
     * A pointer to the license file ID.
     * @param {Pointer<Integer>} pcbLicenseFile Type: <b>UINT*</b>
     * 
     * A pointer to the size, in bytes, of the license file BLOB.
     * @param {Pointer<Pointer<Integer>>} ppbLicenseFile Type: <b>PBYTE*</b>
     * 
     * The license file BLOB.
     * @returns {HRESULT} Type: <b>HRESULT WINAPI</b>
     * 
     * If this function succeeds, it return <b>S_OK</b>.  Otherwise,  it returns an <b>HRESULT</b> error code.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * <dt>0x80070057</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SL_E_LICENSE_FILE_NOT_INSTALLED</b></dt>
     * <dt>0xC004F011</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The license file is not installed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//slpublic/nf-slpublic-slgetlicense
     * @since windows8.0
     */
    static SLGetLicense(hSLC, pLicenseFileId, pcbLicenseFile, ppbLicenseFile) {
        hSLCMarshal := hSLC is VarRef ? "ptr" : "ptr"
        pcbLicenseFileMarshal := pcbLicenseFile is VarRef ? "uint*" : "ptr"
        ppbLicenseFileMarshal := ppbLicenseFile is VarRef ? "ptr*" : "ptr"

        result := DllCall("SLC.dll\SLGetLicense", hSLCMarshal, hSLC, "ptr", pLicenseFileId, pcbLicenseFileMarshal, pcbLicenseFile, ppbLicenseFileMarshal, ppbLicenseFile, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Sends a specified event to a registered listener.
     * @param {Pointer<Void>} hSLC Type: <b>HSLC</b>
     * 
     * The handle to the current SLC context.
     * @param {PWSTR} pwszEventId Type: <b>PCWSTR</b>
     * 
     * The ID of the event to be fired.
     * @param {Pointer<Guid>} pApplicationId Type: <b>const SLID*</b>
     * 
     * A pointer to the application ID.
     * @returns {HRESULT} Type: <b>HRESULT WINAPI</b>
     * 
     * If this function succeeds, it return <b>S_OK</b>.  Otherwise,  it returns an <b>HRESULT</b> error code.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * <dt>0x80070005</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Access denied (API requires admin privileges).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SL_E_INVALID_EVENT_ID</b></dt>
     * <dt>0xC004F019</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested event ID is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SL_E_EVENT_NOT_REGISTERED</b></dt>
     * <dt>0xC004F01A</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested event is not registered with the service.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//slpublic/nf-slpublic-slfireevent
     * @since windows8.0
     */
    static SLFireEvent(hSLC, pwszEventId, pApplicationId) {
        pwszEventId := pwszEventId is String ? StrPtr(pwszEventId) : pwszEventId

        hSLCMarshal := hSLC is VarRef ? "ptr" : "ptr"

        result := DllCall("SLC.dll\SLFireEvent", hSLCMarshal, hSLC, "ptr", pwszEventId, "ptr", pApplicationId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Registers an event in the SL service.
     * @param {Pointer<Void>} hSLC Type: <b>HSLC</b>
     * 
     * The handle to the current SLC session.
     * @param {PWSTR} pwszEventId Type: <b>PCWSTR</b>
     * 
     * The predefined SL event identifier.
     * @param {Pointer<Guid>} pApplicationId Type: <b>const SLID*</b>
     * 
     * A pointer to the  application ID to which the event will be registered.
     * @param {HANDLE} hEvent Type: <b>HANDLE</b>
     * 
     *  The event handle used for notification.
     * @returns {HRESULT} Type: <b>HRESULT WINAPI</b>
     * 
     * If this function succeeds, it return <b>S_OK</b>.  Otherwise, it returns an <b>HRESULT</b> error code.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SL_E_INVALID_EVENT_ID</b></dt>
     * <dt>0xC004F019</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested event ID is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//slpublic/nf-slpublic-slregisterevent
     * @since windows8.0
     */
    static SLRegisterEvent(hSLC, pwszEventId, pApplicationId, hEvent) {
        pwszEventId := pwszEventId is String ? StrPtr(pwszEventId) : pwszEventId
        hEvent := hEvent is Win32Handle ? NumGet(hEvent, "ptr") : hEvent

        hSLCMarshal := hSLC is VarRef ? "ptr" : "ptr"

        result := DllCall("SLC.dll\SLRegisterEvent", hSLCMarshal, hSLC, "ptr", pwszEventId, "ptr", pApplicationId, "ptr", hEvent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Unregisters a registered event in the SL service.
     * @param {Pointer<Void>} hSLC Type: <b>HSLC</b>
     * 
     * The handle to the current SLC session.
     * @param {PWSTR} pwszEventId Type: <b>PCWSTR</b>
     * 
     * The predefined SL event identifier that will be unregistered.
     * @param {Pointer<Guid>} pApplicationId Type: <b>const SLID*</b>
     * 
     * A pointer to the application ID that the event will be unregistered from.
     * @param {HANDLE} hEvent Type: <b>HANDLE</b>
     * 
     * The registered event handle.
     * @returns {HRESULT} Type: <b>HRESULT WINAPI</b>
     * 
     * If this function succeeds, it return <b>S_OK</b>.  Otherwise,  it returns an <b>HRESULT</b> error code.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * <dt>0x80070057</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SL_E_INVALID_EVENT_ID</b></dt>
     * <dt>0xC004F019</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested event ID is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SL_E_EVENT_NOT_REGISTERED</b></dt>
     * <dt>0xC004F01A</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested event is not registered with the service.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//slpublic/nf-slpublic-slunregisterevent
     * @since windows8.0
     */
    static SLUnregisterEvent(hSLC, pwszEventId, pApplicationId, hEvent) {
        pwszEventId := pwszEventId is String ? StrPtr(pwszEventId) : pwszEventId
        hEvent := hEvent is Win32Handle ? NumGet(hEvent, "ptr") : hEvent

        hSLCMarshal := hSLC is VarRef ? "ptr" : "ptr"

        result := DllCall("SLC.dll\SLUnregisterEvent", hSLCMarshal, hSLC, "ptr", pwszEventId, "ptr", pApplicationId, "ptr", hEvent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves the value portion of a name-value pair from the licensing policy of a software component.
     * @param {PWSTR} pwszValueName A pointer to a null-terminated string that contains the name associated with the value to retrieve.
     * @param {Pointer<Integer>} peDataType A pointer to a value of the <a href="https://docs.microsoft.com/windows/desktop/api/slpublic/ne-slpublic-sldatatype">SLDATATYPE</a> enumeration that specifies the type of data in the <i>ppbValue</i> buffer.
     * @param {Pointer<Integer>} pcbValue A pointer to the size, in bytes, of the <i>ppbValue</i> buffer.
     * @param {Pointer<Pointer<Integer>>} ppbValue A pointer to an array of <b>BYTE</b> pointers that specifies the value associated with the name specified by the <i>pwszValueName</i> parameter.
     * 
     * When you have finished using this array, free it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> function.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>.
     * 
     * If the method fails, it returns an error code. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * This function can return the following values defined in Slerror.h.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SL_E_VALUE_NOT_FOUND</b></dt>
     * <dt>0xC004F012</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified name-value pair was not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SL_E_RIGHT_NOT_GRANTED</b></dt>
     * <dt>0xC004F013</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have the permissions necessary to call this function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//slpublic/nf-slpublic-slgetwindowsinformation
     * @since windows6.0.6000
     */
    static SLGetWindowsInformation(pwszValueName, peDataType, pcbValue, ppbValue) {
        pwszValueName := pwszValueName is String ? StrPtr(pwszValueName) : pwszValueName

        peDataTypeMarshal := peDataType is VarRef ? "uint*" : "ptr"
        pcbValueMarshal := pcbValue is VarRef ? "uint*" : "ptr"
        ppbValueMarshal := ppbValue is VarRef ? "ptr*" : "ptr"

        result := DllCall("SLC.dll\SLGetWindowsInformation", "ptr", pwszValueName, peDataTypeMarshal, peDataType, pcbValueMarshal, pcbValue, ppbValueMarshal, ppbValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves the DWORD value portion of a name-value pair from the licensing policy of a software component.
     * @param {PWSTR} pwszValueName A pointer to a null-terminated string that contains the name associated with the value to retrieve.
     * @returns {Integer} A pointer to the value associated with the name specified by the <i>pwszValueName</i> parameter.
     * @see https://docs.microsoft.com/windows/win32/api//slpublic/nf-slpublic-slgetwindowsinformationdword
     * @since windows6.0.6000
     */
    static SLGetWindowsInformationDWORD(pwszValueName) {
        pwszValueName := pwszValueName is String ? StrPtr(pwszValueName) : pwszValueName

        result := DllCall("SLC.dll\SLGetWindowsInformationDWORD", "ptr", pwszValueName, "uint*", &pdwValue := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pdwValue
    }

    /**
     * Checks whether the specified application is a genuine Windows installation.
     * @param {Pointer<Guid>} pAppId A pointer to an <b>SLID</b> structure that specifies the application to check.
     * @param {Pointer<SL_NONGENUINE_UI_OPTIONS>} pUIOptions A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/slpublic/ns-slpublic-sl_nongenuine_ui_options">SL_NONGENUINE_UI_OPTIONS</a> structure that specifies a dialog box to display if the installation is not genuine. If the value of this parameter is <b>NULL</b>, no dialog box is displayed.
     * @returns {Integer} A pointer to a value of the <a href="https://docs.microsoft.com/windows/desktop/api/slpublic/ne-slpublic-sl_genuine_state">SL_GENUINE_STATE</a> enumeration that specifies the state of the installation.
     * @see https://docs.microsoft.com/windows/win32/api//slpublic/nf-slpublic-slisgenuinelocal
     * @since windows6.0.6000
     */
    static SLIsGenuineLocal(pAppId, pUIOptions) {
        result := DllCall("SLWGA.dll\SLIsGenuineLocal", "ptr", pAppId, "int*", &pGenuineState := 0, "ptr", pUIOptions, "int")
        if(result != 0)
            throw OSError(result)

        return pGenuineState
    }

    /**
     * Gets a XrML genuine ticket acquired from the Software Licensing Server (SLS).
     * @param {Pointer<Pointer<Void>>} ppTicketBlob The address of a pointer to a buffer that receives the ticket BLOB. When you have finished using this buffer, free it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> function.
     * @param {Pointer<Integer>} pcbTicketBlob A pointer to the size, in bytes, of the <i>ppTicketBlob</i> buffer.
     * @param {PWSTR} pwszTemplateId A pointer to a null-terminated string that contains the ID of the BLOB template stored on the SLS.
     * @param {PWSTR} pwszServerUrl A pointer to a null-terminated string that contains the URL of the SLS.
     * @param {PWSTR} pwszClientToken Reserved.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>.
     * 
     * If the method fails, it returns an error code. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//slpublic/nf-slpublic-slacquiregenuineticket
     * @since windows6.0.6000
     */
    static SLAcquireGenuineTicket(ppTicketBlob, pcbTicketBlob, pwszTemplateId, pwszServerUrl, pwszClientToken) {
        pwszTemplateId := pwszTemplateId is String ? StrPtr(pwszTemplateId) : pwszTemplateId
        pwszServerUrl := pwszServerUrl is String ? StrPtr(pwszServerUrl) : pwszServerUrl
        pwszClientToken := pwszClientToken is String ? StrPtr(pwszClientToken) : pwszClientToken

        ppTicketBlobMarshal := ppTicketBlob is VarRef ? "ptr*" : "ptr"
        pcbTicketBlobMarshal := pcbTicketBlob is VarRef ? "uint*" : "ptr"

        result := DllCall("slcext.dll\SLAcquireGenuineTicket", ppTicketBlobMarshal, ppTicketBlob, pcbTicketBlobMarshal, pcbTicketBlob, "ptr", pwszTemplateId, "ptr", pwszServerUrl, "ptr", pwszClientToken, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Specifies information about the genuine status of a Windows computer.
     * @param {Pointer<Guid>} pQueryId A pointer to an <b>SLID</b> structure that specifies the application for which to set information.
     * @param {PWSTR} pwszValueName A pointer to a null-terminated string that contains the name associated with the value to set. The following names are valid.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SL_BRT_DATA"></a><a id="sl_brt_data"></a><dl>
     * <dt><b>SL_BRT_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Set information about the genuine state of the computer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SL_BRT_COMMIT"></a><a id="sl_brt_commit"></a><dl>
     * <dt><b>SL_BRT_COMMIT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If the <b>SL_BRT_DATA</b> value  is set, setting <b>SL_BRT_COMMIT</b> puts the computer in nongenuine grace period mode.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} eDataType A pointer to a value of the <a href="https://docs.microsoft.com/windows/desktop/api/slpublic/ne-slpublic-sldatatype">SLDATATYPE</a> enumeration that specifies the type of data in the <i>pbValue</i> buffer.
     * @param {Integer} cbValue A pointer to the size, in bytes, of the <i>pbValue</i> buffer.
     * @param {Pointer} pbValue A pointer to an array of <b>BYTE</b> values that specify the value associated with the name specified by the <i>pwszValueName</i> parameter.
     * 
     * Some name-value pairs allow this parameter to be <b>NULL</b>. In this case, the existing value of the name-value pair is deleted.
     * 
     * When you have finished using this array, free it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> function.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>.
     * 
     * If the method fails, it returns an error code. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * This function can return the following values defined in Winerror.h and Slerror.h.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESS_DENIED</b></dt>
     * <dt>0x80070005</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have administrative privileges.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * <dt>0x80000003</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pbValue</i> parameter cannot be <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>(HRESULT_FROM_WIN32)ERROR_BUFFER_OVERFLOW</b></dt>
     * <dt>0x111</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pbValue</i> buffer is too small to hold the data.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SL_E_DATATYPE_MISMATCHED</b></dt>
     * <dt>0xC004F01E</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The data type of the <i>pbValue</i> parameter does not match the type specified by the <i>eDataType</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SL_E_DEPENDENT_PROPERTY_NOT_SET</b></dt>
     * <dt>0xC004F066</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified name-value pair is dependent on a name-value pair that has not been set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SL_E_NOT_SUPPORTED</b></dt>
     * <dt>0xC004F016</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name specified by the <i>pwszValueName</i> parameter is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//slpublic/nf-slpublic-slsetgenuineinformation
     * @since windows6.0.6000
     */
    static SLSetGenuineInformation(pQueryId, pwszValueName, eDataType, cbValue, pbValue) {
        pwszValueName := pwszValueName is String ? StrPtr(pwszValueName) : pwszValueName

        result := DllCall("SLC.dll\SLSetGenuineInformation", "ptr", pQueryId, "ptr", pwszValueName, "uint", eDataType, "uint", cbValue, "ptr", pbValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Gets referral information for the specified product.
     * @param {Pointer<Void>} hSLC Type: <b>HSLC</b>
     * 
     * The handle retrieved by previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/slpublic/nf-slpublic-slopen">SLOpen</a> function.
     * @param {Integer} eReferralType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/slpublic/ne-slpublic-slreferraltype">SLREFERRALTYPE</a></b>
     * 
     * The referral type.
     * @param {Pointer<Guid>} pSkuOrAppId Type: <b>const SLID*</b>
     * 
     * A pointer to the <b>SLID</b> of the application or SKU from which to obtain information.
     * @param {PWSTR} pwszValueName Type: <b>PCWSTR</b>
     * 
     * The name associated with the value to retrieve.  The following names are valid.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SL_PARTNERID"></a><a id="sl_partnerid"></a><dl>
     * <dt><b>SL_PARTNERID</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Partner ID for the license reseller
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SL_REFERRALID"></a><a id="sl_referralid"></a><dl>
     * <dt><b>SL_REFERRALID</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Referral ID for the license reseller
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SL_MERCHANTCOMMERCEURL"></a><a id="sl_merchantcommerceurl"></a><dl>
     * <dt><b>SL_MERCHANTCOMMERCEURL</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The merchant URL to purchase additional licenses
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SL_MERCHANTUPGRADEURL"></a><a id="sl_merchantupgradeurl"></a><dl>
     * <dt><b>SL_MERCHANTUPGRADEURL</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The merchant URL to purchase additional licenses
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SL_DOWNLOADURL"></a><a id="sl_downloadurl"></a><dl>
     * <dt><b>SL_DOWNLOADURL</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A forward link to download the associated application
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SL_INSTALLATIONPARAMETERS"></a><a id="sl_installationparameters"></a><dl>
     * <dt><b>SL_INSTALLATIONPARAMETERS</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Any parameters that are used when running the associated application's installer
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SL_MERCHANTSUPPORTPHONENUMBER"></a><a id="sl_merchantsupportphonenumber"></a><dl>
     * <dt><b>SL_MERCHANTSUPPORTPHONENUMBER</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The merchant support phone number(s)
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SL_MERCHANTSUPPORTEMAIL"></a><a id="sl_merchantsupportemail"></a><dl>
     * <dt><b>SL_MERCHANTSUPPORTEMAIL</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The merchant support email address
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SL_MERCHANTSUPPORTURL"></a><a id="sl_merchantsupporturl"></a><dl>
     * <dt><b>SL_MERCHANTSUPPORTURL</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The merchant support URL
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SL_SERIALIZEDDATA"></a><a id="sl_serializeddata"></a><dl>
     * <dt><b>SL_SERIALIZEDDATA</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A generic data BLOB
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {PWSTR} Type: <b>PWSTR*</b>
     * 
     * The value to store. When finished using the memory, free it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//slpublic/nf-slpublic-slgetreferralinformation
     * @since windows8.0
     */
    static SLGetReferralInformation(hSLC, eReferralType, pSkuOrAppId, pwszValueName) {
        pwszValueName := pwszValueName is String ? StrPtr(pwszValueName) : pwszValueName

        hSLCMarshal := hSLC is VarRef ? "ptr" : "ptr"

        result := DllCall("slcext.dll\SLGetReferralInformation", hSLCMarshal, hSLC, "int", eReferralType, "ptr", pSkuOrAppId, "ptr", pwszValueName, "ptr*", &ppwszValue := 0, "int")
        if(result != 0)
            throw OSError(result)

        return ppwszValue
    }

    /**
     * Gets information about the genuine state of a Windows computer.
     * @param {Pointer<Guid>} pQueryId A pointer to an <b>SLID</b> structure that specifies the application to check.
     * @param {PWSTR} pwszValueName A pointer to a null-terminated string that contains the name associated with the value to retrieve. The following names are valid.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SL_BRT_DATA"></a><a id="sl_brt_data"></a><dl>
     * <dt><b>SL_BRT_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Get a value that specifies whether the computer is genuine.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SL_BRT_COMMIT"></a><a id="sl_brt_commit"></a><dl>
     * <dt><b>SL_BRT_COMMIT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Get a value that specifies whether the computer is in nongenuine grace period mode.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SL_GENUINE_RESULT"></a><a id="sl_genuine_result"></a><dl>
     * <dt><b>SL_GENUINE_RESULT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Get the value returned from the last call to the <a href="https://docs.microsoft.com/windows/desktop/api/slpublic/nf-slpublic-slacquiregenuineticket">SLAcquireGenuineTicket</a> function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SL_NONGENUINE_GRACE_FLAG"></a><a id="sl_nongenuine_grace_flag"></a><dl>
     * <dt><b>SL_NONGENUINE_GRACE_FLAG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Gets the cause of the computer being put into nongenuine grace period mode.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} peDataType A pointer to a value of the <a href="https://docs.microsoft.com/windows/desktop/api/slpublic/ne-slpublic-sldatatype">SLDATATYPE</a> enumeration that specifies the type of data in the <i>ppbValue</i> buffer.
     * @param {Pointer<Integer>} pcbValue A pointer to the size, in bytes, of the <i>ppbValue</i> buffer.
     * @param {Pointer<Pointer<Integer>>} ppbValue The address of a pointer to an array of <b>BYTE</b> pointers that specifies the value associated with the name specified by the <i>pwszValueName</i> parameter.
     * 
     * When you have finished using this array, free it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> function.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>.
     * 
     * If the method fails, it returns an error code. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * This function can return the following values defined in Slerror.h.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SL_E_NOT_SUPPORTED</b></dt>
     * <dt>0xC004F016</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name specified by the <i>pwszValueName</i> parameter is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SL_E_VALUE_NOT_FOUND</b></dt>
     * <dt>0xC004F012</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified name-value pair was not found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//slpublic/nf-slpublic-slgetgenuineinformation
     * @since windows6.0.6000
     */
    static SLGetGenuineInformation(pQueryId, pwszValueName, peDataType, pcbValue, ppbValue) {
        pwszValueName := pwszValueName is String ? StrPtr(pwszValueName) : pwszValueName

        peDataTypeMarshal := peDataType is VarRef ? "uint*" : "ptr"
        pcbValueMarshal := pcbValue is VarRef ? "uint*" : "ptr"
        ppbValueMarshal := ppbValue is VarRef ? "ptr*" : "ptr"

        result := DllCall("SLC.dll\SLGetGenuineInformation", "ptr", pQueryId, "ptr", pwszValueName, peDataTypeMarshal, peDataType, pcbValueMarshal, pcbValue, ppbValueMarshal, ppbValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Gets the value for the specified component policy.
     * @param {PWSTR} valueName The name of the policy for which you want to get information.
     * @param {Pointer<Integer>} valueType The data type of the policy value. The following table describes the values that this parameter can 
     *        receive.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>REG_DWORD</td>
     * <td>A 32-bit integer.  For this type, the size of the buffer that the <i>dataBuffer</i> 
     *          parameter specifies should be at least 4 bytes.</td>
     * </tr>
     * <tr>
     * <td>REG_BINARY</td>
     * <td>A binary value.</td>
     * </tr>
     * <tr>
     * <td>REG_SZ</td>
     * <td>A wide-character, null-terminated string, including the last null character.</td>
     * </tr>
     * </table>
     * @param {Pointer} dataBuffer A buffer that receives the value of the component policy.
     * @param {Integer} dataSize The size of the supplied buffer, in bytes.
     * @param {Pointer<Integer>} resultDataSize The actual size of the data received for the policy value, in bytes.
     * @returns {HRESULT} If this function succeeds, it return <b>S_OK</b>.  Otherwise, it returns an 
     *       <b>HRESULT</b> error code.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * <dt>0x80070057</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SL_E_VALUE_NOT_FOUND</b></dt>
     * <dt>0xC004F012</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified name-value pair was not found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//slpublic/nf-slpublic-slquerylicensevaluefromapp
     * @since windows10.0.10240
     */
    static SLQueryLicenseValueFromApp(valueName, valueType, dataBuffer, dataSize, resultDataSize) {
        valueName := valueName is String ? StrPtr(valueName) : valueName

        valueTypeMarshal := valueType is VarRef ? "uint*" : "ptr"
        resultDataSizeMarshal := resultDataSize is VarRef ? "uint*" : "ptr"

        result := DllCall("api-ms-win-core-slapi-l1-1-0.dll\SLQueryLicenseValueFromApp", "ptr", valueName, valueTypeMarshal, valueType, "ptr", dataBuffer, "uint", dataSize, resultDataSizeMarshal, resultDataSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Simulates a secure attention sequence (SAS).
     * @remarks
     * 
     * To successfully call the <b>SendSAS</b> function, an application must either be running as a service or have the <b>uiAccess</b> attribute of the <b>requestedExecutionLevel</b> element set to "true" in its application manifest. If an application is not running as a service, it must be running as either the current user or the LocalSystem account to call <b>SendSAS</b>. In addition, if an application is not running as a service, <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/user-account-control">User Account Control</a> must be turned on to call <b>SendSAS</b>. 
     * 
     * <div class="alert"><b>Important</b>  Applications with the <b>uiAccess</b> attribute set to "true" must be signed by using <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/ms537359(v=vs.85)">Authenticode</a>. In addition, the application must reside in a protected location in the file system. Currently, there are two allowable protected locations:<dl>
     * <dd><b>\Program Files\</b></dd>
     * <dd><b>\windows\system32\</b></dd>
     * </dl>
     * </div>
     * <div> </div>
     * The local security policy of a computer must be configured to allow services and applications to simulate a SAS. To configure the policy, modify settings in the Group Policy Editor (GPE) Microsoft Management Console (MMC) snap-in. The GPE settings that control delegation are in the following location:
     * 
     * <b>Computer Configuration | Administrative Templates | Windows Components | Windows Logon Options | Disable or enable software Secure Attention Sequence</b>
     * 
     * A service can impersonate the token of another process that calls that service. In this case, a call to the <b>SendSAS</b> function by that service simulates a SAS on the session associated with the impersonated token.
     * 
     * <b>Windows Server 2008 and Windows Vista:  </b>Sas.dll is not available natively. You must download the Windows 7 version of the Microsoft Windows Software Development Kit (SDK)  to use this function. In addition, an application must refer to Sas.dll to call this function.
     * 
     * @param {BOOL} AsUser <b>TRUE</b> if the caller is running as the current user; otherwise, <b>FALSE</b>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//sas/nf-sas-sendsas
     * @since windows6.1
     */
    static SendSAS(AsUser) {
        DllCall("SAS.dll\SendSAS", "int", AsUser)
    }

;@endregion Methods
}
