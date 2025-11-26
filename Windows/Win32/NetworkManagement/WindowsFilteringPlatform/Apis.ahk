#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class WindowsFilteringPlatform {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_NET_EVENT_KEYWORD_INBOUND_MCAST => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_NET_EVENT_KEYWORD_INBOUND_BCAST => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_NET_EVENT_KEYWORD_CAPABILITY_DROP => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_NET_EVENT_KEYWORD_CAPABILITY_ALLOW => 8

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_NET_EVENT_KEYWORD_CLASSIFY_ALLOW => 16

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_NET_EVENT_KEYWORD_PORT_SCANNING_DROP => 32

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_ENGINE_OPTION_PACKET_QUEUE_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_ENGINE_OPTION_PACKET_QUEUE_INBOUND => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_ENGINE_OPTION_PACKET_QUEUE_FORWARD => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_ENGINE_OPTION_PACKET_BATCH_INBOUND => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_SESSION_FLAG_DYNAMIC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_SESSION_FLAG_RESERVED => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_PROVIDER_FLAG_PERSISTENT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_PROVIDER_FLAG_DISABLED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_PROVIDER_CONTEXT_FLAG_PERSISTENT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_PROVIDER_CONTEXT_FLAG_DOWNLEVEL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_SUBLAYER_FLAG_PERSISTENT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_LAYER_FLAG_KERNEL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_LAYER_FLAG_BUILTIN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_LAYER_FLAG_CLASSIFY_MOSTLY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_LAYER_FLAG_BUFFERED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_CALLOUT_FLAG_PERSISTENT => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_CALLOUT_FLAG_USES_PROVIDER_CONTEXT => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_CALLOUT_FLAG_REGISTERED => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_FILTER_FLAG_HAS_SECURITY_REALM_PROVIDER_CONTEXT => 128

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_FILTER_FLAG_SYSTEMOS_ONLY => 256

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_FILTER_FLAG_GAMEOS_ONLY => 512

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_FILTER_FLAG_SILENT_MODE => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_FILTER_FLAG_IPSEC_NO_ACQUIRE_INITIATE => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_FILTER_FLAG_RESERVED0 => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_FILTER_FLAG_RESERVED1 => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_FILTER_FLAG_RESERVED2 => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_NET_EVENT_FLAG_IP_PROTOCOL_SET => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_NET_EVENT_FLAG_LOCAL_ADDR_SET => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_NET_EVENT_FLAG_REMOTE_ADDR_SET => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_NET_EVENT_FLAG_LOCAL_PORT_SET => 8

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_NET_EVENT_FLAG_REMOTE_PORT_SET => 16

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_NET_EVENT_FLAG_APP_ID_SET => 32

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_NET_EVENT_FLAG_USER_ID_SET => 64

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_NET_EVENT_FLAG_SCOPE_ID_SET => 128

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_NET_EVENT_FLAG_IP_VERSION_SET => 256

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_NET_EVENT_FLAG_REAUTH_REASON_SET => 512

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_NET_EVENT_FLAG_PACKAGE_ID_SET => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_NET_EVENT_FLAG_ENTERPRISE_ID_SET => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_NET_EVENT_FLAG_POLICY_FLAGS_SET => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_NET_EVENT_FLAG_EFFECTIVE_NAME_SET => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static IKEEXT_CERT_HASH_LEN => 20

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_NET_EVENT_IKEEXT_MM_FAILURE_FLAG_BENIGN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_NET_EVENT_IKEEXT_MM_FAILURE_FLAG_MULTIPLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_NET_EVENT_IKEEXT_EM_FAILURE_FLAG_MULTIPLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_NET_EVENT_IKEEXT_EM_FAILURE_FLAG_BENIGN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_CONNECTION_ENUM_FLAG_QUERY_BYTES_TRANSFERRED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FWPS_FILTER_FLAG_CLEAR_ACTION_RIGHT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FWPS_FILTER_FLAG_PERMIT_IF_CALLOUT_UNREGISTERED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FWPS_FILTER_FLAG_OR_CONDITIONS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FWPS_FILTER_FLAG_HAS_SECURITY_REALM_PROVIDER_CONTEXT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static FWPS_FILTER_FLAG_SILENT_MODE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static FWPS_FILTER_FLAG_IPSEC_NO_ACQUIRE_INITIATE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static FWPS_FILTER_FLAG_RESERVED0 => 64

    /**
     * @type {Integer (UInt32)}
     */
    static FWPS_FILTER_FLAG_RESERVED1 => 128

    /**
     * @type {Integer (UInt32)}
     */
    static FWPS_FILTER_FLAG_RESERVED2 => 256

    /**
     * @type {Integer (UInt32)}
     */
    static FWPS_INCOMING_FLAG_CACHE_SAFE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FWPS_INCOMING_FLAG_ENFORCE_QUERY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FWPS_INCOMING_FLAG_ABSORB => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FWPS_INCOMING_FLAG_CONNECTION_FAILING_INDICATION => 8

    /**
     * @type {Integer (UInt32)}
     */
    static FWPS_INCOMING_FLAG_MID_STREAM_INSPECTION => 16

    /**
     * @type {Integer (UInt32)}
     */
    static FWPS_INCOMING_FLAG_RECLASSIFY => 32

    /**
     * @type {Integer (UInt32)}
     */
    static FWPS_INCOMING_FLAG_IS_LOOSE_SOURCE_FLOW => 64

    /**
     * @type {Integer (UInt32)}
     */
    static FWPS_INCOMING_FLAG_IS_LOCAL_ONLY_FLOW => 128

    /**
     * @type {Integer (UInt32)}
     */
    static FWPS_L2_INCOMING_FLAG_IS_RAW_IPV4_FRAMING => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FWPS_L2_INCOMING_FLAG_IS_RAW_IPV6_FRAMING => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FWPS_L2_INCOMING_FLAG_RECLASSIFY_MULTI_DESTINATION => 8

    /**
     * @type {Integer (UInt32)}
     */
    static FWPS_INCOMING_FLAG_RESERVED0 => 256

    /**
     * @type {Integer (UInt32)}
     */
    static FWPS_RIGHT_ACTION_WRITE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FWPS_CLASSIFY_OUT_FLAG_ABSORB => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FWPS_CLASSIFY_OUT_FLAG_BUFFER_LIMIT_REACHED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FWPS_CLASSIFY_OUT_FLAG_NO_MORE_DATA => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FWPS_CLASSIFY_OUT_FLAG_ALE_FAST_CACHE_CHECK => 8

    /**
     * @type {Integer (UInt32)}
     */
    static FWPS_CLASSIFY_OUT_FLAG_ALE_FAST_CACHE_POSSIBLE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static FWPS_ALE_ENDPOINT_FLAG_IPSEC_SECURED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_BYTEMAP_ARRAY64_SIZE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_BYTE_ARRAY6_SIZE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_V6_ADDR_SIZE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_ACTRL_MATCH_FILTER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_OPTION_VALUE_ALLOW_MULTICAST_STATE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_OPTION_VALUE_DENY_MULTICAST_STATE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_OPTION_VALUE_ALLOW_GLOBAL_MULTICAST_STATE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_OPTION_VALUE_DISABLE_LOOSE_SOURCE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_OPTION_VALUE_ENABLE_LOOSE_SOURCE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_OPTION_VALUE_DISABLE_LOCAL_ONLY_MAPPING => 0

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_OPTION_VALUE_ENABLE_LOCAL_ONLY_MAPPING => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_ACTION_FLAG_TERMINATING => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_ACTION_FLAG_NON_TERMINATING => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_ACTION_FLAG_CALLOUT => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_CONDITION_FLAG_IS_LOOPBACK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_CONDITION_FLAG_IS_IPSEC_SECURED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_CONDITION_FLAG_IS_REAUTHORIZE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_CONDITION_FLAG_IS_WILDCARD_BIND => 8

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_CONDITION_FLAG_IS_RAW_ENDPOINT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_CONDITION_FLAG_IS_FRAGMENT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_CONDITION_FLAG_IS_FRAGMENT_GROUP => 64

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_CONDITION_FLAG_IS_IPSEC_NATT_RECLASSIFY => 128

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_CONDITION_FLAG_REQUIRES_ALE_CLASSIFY => 256

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_CONDITION_FLAG_IS_IMPLICIT_BIND => 512

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_CONDITION_FLAG_IS_REASSEMBLED => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_CONDITION_FLAG_IS_NAME_APP_SPECIFIED => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_CONDITION_FLAG_IS_PROMISCUOUS => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_CONDITION_FLAG_IS_AUTH_FW => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_CONDITION_FLAG_IS_RECLASSIFY => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_CONDITION_FLAG_IS_OUTBOUND_PASS_THRU => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_CONDITION_FLAG_IS_INBOUND_PASS_THRU => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_CONDITION_FLAG_IS_CONNECTION_REDIRECTED => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_CONDITION_FLAG_IS_PROXY_CONNECTION => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_CONDITION_FLAG_IS_APPCONTAINER_LOOPBACK => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_CONDITION_FLAG_IS_NON_APPCONTAINER_LOOPBACK => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_CONDITION_FLAG_IS_RESERVED => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_CONDITION_FLAG_IS_HONORING_POLICY_AUTHORIZE => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_CONDITION_REAUTHORIZE_REASON_POLICY_CHANGE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_CONDITION_REAUTHORIZE_REASON_NEW_ARRIVAL_INTERFACE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_CONDITION_REAUTHORIZE_REASON_NEW_NEXTHOP_INTERFACE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_CONDITION_REAUTHORIZE_REASON_PROFILE_CROSSING => 8

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_CONDITION_REAUTHORIZE_REASON_CLASSIFY_COMPLETION => 16

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_CONDITION_REAUTHORIZE_REASON_IPSEC_PROPERTIES_CHANGED => 32

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_CONDITION_REAUTHORIZE_REASON_MID_STREAM_INSPECTION => 64

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_CONDITION_REAUTHORIZE_REASON_SOCKET_PROPERTY_CHANGED => 128

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_CONDITION_REAUTHORIZE_REASON_NEW_INBOUND_MCAST_BCAST_PACKET => 256

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_CONDITION_REAUTHORIZE_REASON_EDP_POLICY_CHANGED => 512

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_CONDITION_REAUTHORIZE_REASON_PROXY_HANDLE_CHANGED => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_CONDITION_REAUTHORIZE_REASON_CHECK_OFFLOAD => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_CONDITION_SOCKET_PROPERTY_FLAG_IS_SYSTEM_PORT_RPC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_CONDITION_SOCKET_PROPERTY_FLAG_ALLOW_EDGE_TRAFFIC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_CONDITION_SOCKET_PROPERTY_FLAG_DENY_EDGE_TRAFFIC => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_CONDITION_L2_IS_NATIVE_ETHERNET => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_CONDITION_L2_IS_WIFI => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_CONDITION_L2_IS_MOBILE_BROADBAND => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_CONDITION_L2_IS_WIFI_DIRECT_DATA => 8

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_CONDITION_L2_IS_VM2VM => 16

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_CONDITION_L2_IS_MALFORMED_PACKET => 32

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_CONDITION_L2_IS_IP_FRAGMENT_GROUP => 64

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_CONDITION_L2_IF_CONNECTOR_PRESENT => 128

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_FILTER_ENUM_FLAG_BEST_TERMINATING_MATCH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_FILTER_ENUM_FLAG_SORTED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_FILTER_ENUM_FLAG_BOOTTIME_ONLY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_FILTER_ENUM_FLAG_INCLUDE_BOOTTIME => 8

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_FILTER_ENUM_FLAG_INCLUDE_DISABLED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_FILTER_ENUM_FLAG_RESERVED1 => 32

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_CALLOUT_FLAG_CONDITIONAL_ON_FLOW => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_CALLOUT_FLAG_ALLOW_OFFLOAD => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_CALLOUT_FLAG_ENABLE_COMMIT_ADD_NOTIFY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_CALLOUT_FLAG_ALLOW_MID_STREAM_INSPECTION => 8

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_CALLOUT_FLAG_ALLOW_RECLASSIFY => 16

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_CALLOUT_FLAG_RESERVED1 => 32

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_CALLOUT_FLAG_ALLOW_RSC => 64

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_CALLOUT_FLAG_ALLOW_L2_BATCH_CLASSIFY => 128

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_CALLOUT_FLAG_ALLOW_USO => 256

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_CALLOUT_FLAG_ALLOW_URO => 512

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_CALLOUT_FLAG_RESERVED2 => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static IKEEXT_CERT_AUTH_FLAG_DISABLE_CRL_CHECK => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IKEEXT_CERT_AUTH_FLAG_DISABLE_REQUEST_PAYLOAD => 64

    /**
     * @type {Integer (UInt32)}
     */
    static IKEEXT_KERB_AUTH_FORCE_PROXY_ON_INITIATOR => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IKEEXT_NTLM_V2_AUTH_DONT_ACCEPT_EXPLICIT_CREDENTIALS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IKEEXT_POLICY_FLAG_MOBIKE_NOT_SUPPORTED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static IKEEXT_POLICY_FLAG_SITE_TO_SITE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static IKEEXT_POLICY_FLAG_IMS_VPN => 64

    /**
     * @type {Integer (UInt32)}
     */
    static IKEEXT_POLICY_ENABLE_IKEV2_FRAGMENTATION => 128

    /**
     * @type {Integer (UInt32)}
     */
    static IKEEXT_POLICY_SUPPORT_LOW_POWER_MODE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static IKEEXT_CERT_CREDENTIAL_FLAG_NAP_CERT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_AUTH_CONFIG_HMAC_MD5_96 => 0

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_AUTH_CONFIG_HMAC_SHA_1_96 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_AUTH_CONFIG_HMAC_SHA_256_128 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_AUTH_CONFIG_GCM_AES_128 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_AUTH_CONFIG_GCM_AES_192 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_AUTH_CONFIG_GCM_AES_256 => 5

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_AUTH_CONFIG_MAX => 6

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_CIPHER_CONFIG_CBC_DES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_CIPHER_CONFIG_CBC_3DES => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_CIPHER_CONFIG_CBC_AES_128 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_CIPHER_CONFIG_CBC_AES_192 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_CIPHER_CONFIG_CBC_AES_256 => 5

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_CIPHER_CONFIG_GCM_AES_128 => 6

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_CIPHER_CONFIG_GCM_AES_192 => 7

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_CIPHER_CONFIG_GCM_AES_256 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_CIPHER_CONFIG_MAX => 9

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_POLICY_FLAG_KEY_MANAGER_ALLOW_NOTIFY_KEY => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_POLICY_FLAG_RESERVED1 => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_POLICY_FLAG_SITE_TO_SITE_TUNNEL => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_POLICY_FLAG_BANDWIDTH1 => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_POLICY_FLAG_BANDWIDTH2 => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_POLICY_FLAG_BANDWIDTH3 => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_POLICY_FLAG_BANDWIDTH4 => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_KEYING_POLICY_FLAG_TERMINATING_MATCH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_SA_BUNDLE_FLAG_NLB => 16

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_SA_BUNDLE_FLAG_NO_MACHINE_LUID_VERIFY => 32

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_SA_BUNDLE_FLAG_NO_IMPERSONATION_LUID_VERIFY => 64

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_SA_BUNDLE_FLAG_NO_EXPLICIT_CRED_MATCH => 128

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_SA_BUNDLE_FLAG_FORCE_INBOUND_CONNECTIONS => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_SA_BUNDLE_FLAG_FORCE_OUTBOUND_CONNECTIONS => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_SA_BUNDLE_FLAG_FORWARD_PATH_INITIATOR => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_SA_BUNDLE_FLAG_ENABLE_OPTIONAL_ASYMMETRIC_IDLE => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_SA_BUNDLE_FLAG_USING_DICTATED_KEYS => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_SA_BUNDLE_FLAG_LOCALLY_DICTATED_KEYS => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_SA_BUNDLE_FLAG_SA_OFFLOADED => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_SA_BUNDLE_FLAG_IP_IN_IP_PKT => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_SA_BUNDLE_FLAG_LOW_POWER_MODE_SUPPORT => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_SA_BUNDLE_FLAG_TUNNEL_BANDWIDTH1 => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_SA_BUNDLE_FLAG_TUNNEL_BANDWIDTH2 => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_SA_BUNDLE_FLAG_TUNNEL_BANDWIDTH3 => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_SA_BUNDLE_FLAG_TUNNEL_BANDWIDTH4 => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_DOSP_DSCP_DISABLE_VALUE => 255

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_DOSP_RATE_LIMIT_DISABLE_VALUE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_KEY_MANAGER_FLAG_DICTATE_KEY => 1

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_INBOUND_IPPACKET_V4 => Guid("{c86fd1bf-21cd-497e-a0bb-17425c885c58}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_INBOUND_IPPACKET_V4_DISCARD => Guid("{b5a230d0-a8c0-44f2-916e-991b53ded1f7}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_INBOUND_IPPACKET_V6 => Guid("{f52032cb-991c-46e7-971d-2601459a91ca}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_INBOUND_IPPACKET_V6_DISCARD => Guid("{bb24c279-93b4-47a2-83ad-ae1698b50885}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_OUTBOUND_IPPACKET_V4 => Guid("{1e5c9fae-8a84-4135-a331-950b54229ecd}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_OUTBOUND_IPPACKET_V4_DISCARD => Guid("{08e4bcb5-b647-48f3-953c-e5ddbd03937e}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_OUTBOUND_IPPACKET_V6 => Guid("{a3b3ab6b-3564-488c-9117-f34e82142763}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_OUTBOUND_IPPACKET_V6_DISCARD => Guid("{9513d7c4-a934-49dc-91a7-6ccb80cc02e3}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_IPFORWARD_V4 => Guid("{a82acc24-4ee1-4ee1-b465-fd1d25cb10a4}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_IPFORWARD_V4_DISCARD => Guid("{9e9ea773-2fae-4210-8f17-34129ef369eb}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_IPFORWARD_V6 => Guid("{7b964818-19c7-493a-b71f-832c3684d28c}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_IPFORWARD_V6_DISCARD => Guid("{31524a5d-1dfe-472f-bb93-518ee945d8a2}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_INBOUND_TRANSPORT_V4 => Guid("{5926dfc8-e3cf-4426-a283-dc393f5d0f9d}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_INBOUND_TRANSPORT_V4_DISCARD => Guid("{ac4a9833-f69d-4648-b261-6dc84835ef39}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_INBOUND_TRANSPORT_V6 => Guid("{634a869f-fc23-4b90-b0c1-bf620a36ae6f}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_INBOUND_TRANSPORT_V6_DISCARD => Guid("{2a6ff955-3b2b-49d2-9848-ad9d72dcaab7}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_OUTBOUND_TRANSPORT_V4 => Guid("{09e61aea-d214-46e2-9b21-b26b0b2f28c8}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_OUTBOUND_TRANSPORT_V4_DISCARD => Guid("{c5f10551-bdb0-43d7-a313-50e211f4d68a}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_OUTBOUND_TRANSPORT_V6 => Guid("{e1735bde-013f-4655-b351-a49e15762df0}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_OUTBOUND_TRANSPORT_V6_DISCARD => Guid("{f433df69-ccbd-482e-b9b2-57165658c3b3}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_STREAM_V4 => Guid("{3b89653c-c170-49e4-b1cd-e0eeeee19a3e}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_STREAM_V4_DISCARD => Guid("{25c4c2c2-25ff-4352-82f9-c54a4a4726dc}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_STREAM_V6 => Guid("{47c9137a-7ec4-46b3-b6e4-48e926b1eda4}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_STREAM_V6_DISCARD => Guid("{10a59fc7-b628-4c41-9eb8-cf37d55103cf}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_DATAGRAM_DATA_V4 => Guid("{3d08bf4e-45f6-4930-a922-417098e20027}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_DATAGRAM_DATA_V4_DISCARD => Guid("{18e330c6-7248-4e52-aaab-472ed67704fd}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_DATAGRAM_DATA_V6 => Guid("{fa45fe2f-3cba-4427-87fc-57b9a4b10d00}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_DATAGRAM_DATA_V6_DISCARD => Guid("{09d1dfe1-9b86-4a42-be9d-8c315b92a5d0}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_INBOUND_ICMP_ERROR_V4 => Guid("{61499990-3cb6-4e84-b950-53b94b6964f3}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_INBOUND_ICMP_ERROR_V4_DISCARD => Guid("{a6b17075-ebaf-4053-a4e7-213c8121ede5}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_INBOUND_ICMP_ERROR_V6 => Guid("{65f9bdff-3b2d-4e5d-b8c6-c720651fe898}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_INBOUND_ICMP_ERROR_V6_DISCARD => Guid("{a6e7ccc0-08fb-468d-a472-9771d5595e09}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_OUTBOUND_ICMP_ERROR_V4 => Guid("{41390100-564c-4b32-bc1d-718048354d7c}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_OUTBOUND_ICMP_ERROR_V4_DISCARD => Guid("{b3598d36-0561-4588-a6bf-e955e3f6264b}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_OUTBOUND_ICMP_ERROR_V6 => Guid("{7fb03b60-7b8d-4dfa-badd-980176fc4e12}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_OUTBOUND_ICMP_ERROR_V6_DISCARD => Guid("{65f2e647-8d0c-4f47-b19b-33a4d3f1357c}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_ALE_RESOURCE_ASSIGNMENT_V4 => Guid("{1247d66d-0b60-4a15-8d44-7155d0f53a0c}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_ALE_RESOURCE_ASSIGNMENT_V4_DISCARD => Guid("{0b5812a2-c3ff-4eca-b88d-c79e20ac6322}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_ALE_RESOURCE_ASSIGNMENT_V6 => Guid("{55a650e1-5f0a-4eca-a653-88f53b26aa8c}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_ALE_RESOURCE_ASSIGNMENT_V6_DISCARD => Guid("{cbc998bb-c51f-4c1a-bb4f-9775fcacab2f}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_ALE_AUTH_LISTEN_V4 => Guid("{88bb5dad-76d7-4227-9c71-df0a3ed7be7e}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_ALE_AUTH_LISTEN_V4_DISCARD => Guid("{371dfada-9f26-45fd-b4eb-c29eb212893f}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_ALE_AUTH_LISTEN_V6 => Guid("{7ac9de24-17dd-4814-b4bd-a9fbc95a321b}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_ALE_AUTH_LISTEN_V6_DISCARD => Guid("{60703b07-63c8-48e9-ada3-12b1af40a617}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_ALE_AUTH_RECV_ACCEPT_V4 => Guid("{e1cd9fe7-f4b5-4273-96c0-592e487b8650}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_ALE_AUTH_RECV_ACCEPT_V4_DISCARD => Guid("{9eeaa99b-bd22-4227-919f-0073c63357b1}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_ALE_AUTH_RECV_ACCEPT_V6 => Guid("{a3b42c97-9f04-4672-b87e-cee9c483257f}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_ALE_AUTH_RECV_ACCEPT_V6_DISCARD => Guid("{89455b97-dbe1-453f-a224-13da895af396}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_ALE_AUTH_CONNECT_V4 => Guid("{c38d57d1-05a7-4c33-904f-7fbceee60e82}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_ALE_AUTH_CONNECT_V4_DISCARD => Guid("{d632a801-f5ba-4ad6-96e3-607017d9836a}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_ALE_AUTH_CONNECT_V6 => Guid("{4a72393b-319f-44bc-84c3-ba54dcb3b6b4}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_ALE_AUTH_CONNECT_V6_DISCARD => Guid("{c97bc3b8-c9a3-4e33-8695-8e17aad4de09}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_ALE_FLOW_ESTABLISHED_V4 => Guid("{af80470a-5596-4c13-9992-539e6fe57967}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_ALE_FLOW_ESTABLISHED_V4_DISCARD => Guid("{146ae4a9-a1d2-4d43-a31a-4c42682b8e4f}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_ALE_FLOW_ESTABLISHED_V6 => Guid("{7021d2b3-dfa4-406e-afeb-6afaf7e70efd}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_ALE_FLOW_ESTABLISHED_V6_DISCARD => Guid("{46928636-bbca-4b76-941d-0fa7f5d7d372}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_INBOUND_MAC_FRAME_ETHERNET => Guid("{effb7edb-0055-4f9a-a231-4ff8131ad191}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_OUTBOUND_MAC_FRAME_ETHERNET => Guid("{694673bc-d6db-4870-adee-0acdbdb7f4b2}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_INBOUND_MAC_FRAME_NATIVE => Guid("{d4220bd3-62ce-4f08-ae88-b56e8526df50}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_OUTBOUND_MAC_FRAME_NATIVE => Guid("{94c44912-9d6f-4ebf-b995-05ab8a088d1b}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_INGRESS_VSWITCH_ETHERNET => Guid("{7d98577a-9a87-41ec-9718-7cf589c9f32d}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_EGRESS_VSWITCH_ETHERNET => Guid("{86c872b0-76fa-4b79-93a4-0750530ae292}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_INGRESS_VSWITCH_TRANSPORT_V4 => Guid("{b2696ff6-774f-4554-9f7d-3da3945f8e85}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_INGRESS_VSWITCH_TRANSPORT_V6 => Guid("{5ee314fc-7d8a-47f4-b7e3-291a36da4e12}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_EGRESS_VSWITCH_TRANSPORT_V4 => Guid("{b92350b6-91f0-46b6-bdc4-871dfd4a7c98}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_EGRESS_VSWITCH_TRANSPORT_V6 => Guid("{1b2def23-1881-40bd-82f4-4254e63141cb}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_INBOUND_TRANSPORT_FAST => Guid("{e41d2719-05c7-40f0-8983-ea8d17bbc2f6}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_OUTBOUND_TRANSPORT_FAST => Guid("{13ed4388-a070-4815-9935-7a9be6408b78}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_INBOUND_MAC_FRAME_NATIVE_FAST => Guid("{853aaa8e-2b78-4d24-a804-36db08b29711}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_OUTBOUND_MAC_FRAME_NATIVE_FAST => Guid("{470df946-c962-486f-9446-8293cbc75eb8}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_IPSEC_KM_DEMUX_V4 => Guid("{f02b1526-a459-4a51-b9e3-759de52b9d2c}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_IPSEC_KM_DEMUX_V6 => Guid("{2f755cf6-2fd4-4e88-b3e4-a91bca495235}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_IPSEC_V4 => Guid("{eda65c74-610d-4bc5-948f-3c4f89556867}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_IPSEC_V6 => Guid("{13c48442-8d87-4261-9a29-59d2abc348b4}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_IKEEXT_V4 => Guid("{b14b7bdb-dbbd-473e-bed4-8b4708d4f270}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_IKEEXT_V6 => Guid("{b64786b3-f687-4eb9-89d2-8ef32acdabe2}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_RPC_UM => Guid("{75a89dda-95e4-40f3-adc7-7688a9c847e1}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_RPC_EPMAP => Guid("{9247bc61-eb07-47ee-872c-bfd78bfd1616}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_RPC_EP_ADD => Guid("{618dffc7-c450-4943-95db-99b4c16a55d4}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_RPC_PROXY_CONN => Guid("{94a4b50b-ba5c-4f27-907a-229fac0c2a7a}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_RPC_PROXY_IF => Guid("{f8a38615-e12c-41ac-98df-121ad981aade}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_KM_AUTHORIZATION => Guid("{4aa226e9-9020-45fb-956a-c0249d841195}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_NAME_RESOLUTION_CACHE_V4 => Guid("{0c2aa681-905b-4ccd-a467-4dd811d07b7b}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_NAME_RESOLUTION_CACHE_V6 => Guid("{92d592fa-6b01-434a-9dea-d1e96ea97da9}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_ALE_RESOURCE_RELEASE_V4 => Guid("{74365cce-ccb0-401a-bfc1-b89934ad7e15}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_ALE_RESOURCE_RELEASE_V6 => Guid("{f4e5ce80-edcc-4e13-8a2f-b91454bb057b}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_ALE_ENDPOINT_CLOSURE_V4 => Guid("{b4766427-e2a2-467a-bd7e-dbcd1bd85a09}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_ALE_ENDPOINT_CLOSURE_V6 => Guid("{bb536ccd-4755-4ba9-9ff7-f9edf8699c7b}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_ALE_CONNECT_REDIRECT_V4 => Guid("{c6e63c8c-b784-4562-aa7d-0a67cfcaf9a3}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_ALE_CONNECT_REDIRECT_V6 => Guid("{587e54a7-8046-42ba-a0aa-b716250fc7fd}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_ALE_BIND_REDIRECT_V4 => Guid("{66978cad-c704-42ac-86ac-7c1a231bd253}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_ALE_BIND_REDIRECT_V6 => Guid("{bef02c9c-606b-4536-8c26-1c2fc7b631d4}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_STREAM_PACKET_V4 => Guid("{af52d8ec-cb2d-44e5-ad92-f8dc38d2eb29}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_STREAM_PACKET_V6 => Guid("{779a8ca3-f099-468f-b5d4-83535c461c02}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_INBOUND_RESERVED2 => Guid("{f4fb8d55-c076-46d8-a2c7-6a4c722ca4ed}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_OUTBOUND_NETWORK_CONNECTION_POLICY_V4 => Guid("{037f317a-d696-494a-bba5-bffc265e6052}")

    /**
     * @type {Guid}
     */
    static FWPM_LAYER_OUTBOUND_NETWORK_CONNECTION_POLICY_V6 => Guid("{22a4fdb1-6d7e-48ae-ae77-3742525c3119}")

    /**
     * @type {Guid}
     */
    static FWPM_SUBLAYER_RPC_AUDIT => Guid("{758c84f4-fb48-4de9-9aeb-3ed9551ab1fd}")

    /**
     * @type {Guid}
     */
    static FWPM_SUBLAYER_IPSEC_TUNNEL => Guid("{83f299ed-9ff4-4967-aff4-c309f4dab827}")

    /**
     * @type {Guid}
     */
    static FWPM_SUBLAYER_UNIVERSAL => Guid("{eebecc03-ced4-4380-819a-2734397b2b74}")

    /**
     * @type {Guid}
     */
    static FWPM_SUBLAYER_LIPS => Guid("{1b75c0ce-ff60-4711-a70f-b4958cc3b2d0}")

    /**
     * @type {Guid}
     */
    static FWPM_SUBLAYER_SECURE_SOCKET => Guid("{15a66e17-3f3c-4f7b-aa6c-812aa613dd82}")

    /**
     * @type {Guid}
     */
    static FWPM_SUBLAYER_TCP_CHIMNEY_OFFLOAD => Guid("{337608b9-b7d5-4d5f-82f9-3618618bc058}")

    /**
     * @type {Guid}
     */
    static FWPM_SUBLAYER_INSPECTION => Guid("{877519e1-e6a9-41a5-81b4-8c4f118e4a60}")

    /**
     * @type {Guid}
     */
    static FWPM_SUBLAYER_TEREDO => Guid("{ba69dc66-5176-4979-9c89-26a7b46a8327}")

    /**
     * @type {Guid}
     */
    static FWPM_SUBLAYER_IPSEC_FORWARD_OUTBOUND_TUNNEL => Guid("{a5082e73-8f71-4559-8a9a-101cea04ef87}")

    /**
     * @type {Guid}
     */
    static FWPM_SUBLAYER_IPSEC_DOSP => Guid("{e076d572-5d3d-48ef-802b-909eddb098bd}")

    /**
     * @type {Guid}
     */
    static FWPM_SUBLAYER_TCP_TEMPLATES => Guid("{24421dcf-0ac5-4caa-9e14-50f6e3636af0}")

    /**
     * @type {Guid}
     */
    static FWPM_SUBLAYER_IPSEC_SECURITY_REALM => Guid("{37a57701-5884-4964-92b8-3e704688b0ad}")

    /**
     * @type {Guid}
     */
    static FWPM_SUBLAYER_MPSSVC_WSH => Guid("{b3cdd441-af90-41ba-a745-7c6008ff2300}")

    /**
     * @type {Guid}
     */
    static FWPM_SUBLAYER_MPSSVC_WF => Guid("{b3cdd441-af90-41ba-a745-7c6008ff2301}")

    /**
     * @type {Guid}
     */
    static FWPM_SUBLAYER_MPSSVC_QUARANTINE => Guid("{b3cdd441-af90-41ba-a745-7c6008ff2302}")

    /**
     * @type {Guid}
     */
    static FWPM_SUBLAYER_MPSSVC_EDP => Guid("{09a47e38-fa97-471b-b123-18bcd7e65071}")

    /**
     * @type {Guid}
     */
    static FWPM_SUBLAYER_MPSSVC_TENANT_RESTRICTIONS => Guid("{1ec6c7e1-fdd9-478a-b55f-ff8ba1d2c17d}")

    /**
     * @type {Guid}
     */
    static FWPM_SUBLAYER_MPSSVC_APP_ISOLATION => Guid("{ffe221c3-92a8-4564-a59f-dafb70756020}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_ALE_PACKAGE_FAMILY_NAME => Guid("{81bc78fb-f28d-4886-a604-6acc261f261b}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_INTERFACE_MAC_ADDRESS => Guid("{f6e63dce-1f4b-4c6b-b6ef-1165e71f8ee7}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_MAC_LOCAL_ADDRESS => Guid("{d999e981-7948-4c83-b742-c84e3b678f8f}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_MAC_REMOTE_ADDRESS => Guid("{408f2ed4-3a70-4b4d-92a6-415ac20e2f12}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_ETHER_TYPE => Guid("{fd08948d-a219-4d52-bb98-1a5540ee7b4e}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_VLAN_ID => Guid("{938eab21-3618-4e64-9ca5-2141ebda1ca2}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_VSWITCH_TENANT_NETWORK_ID => Guid("{dc04843c-79e6-4e44-a025-65b9bb0f9f94}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_NDIS_PORT => Guid("{db7bb42b-2dac-4cd4-a59a-e0bdce1e6834}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_NDIS_MEDIA_TYPE => Guid("{cb31cef1-791d-473b-89d1-61c5984304a0}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_NDIS_PHYSICAL_MEDIA_TYPE => Guid("{34c79823-c229-44f2-b83c-74020882ae77}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_L2_FLAGS => Guid("{7bc43cbf-37ba-45f1-b74a-82ff518eeb10}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_MAC_LOCAL_ADDRESS_TYPE => Guid("{cc31355c-3073-4ffb-a14f-79415cb1ead1}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_MAC_REMOTE_ADDRESS_TYPE => Guid("{027fedb4-f1c1-4030-b564-ee777fd867ea}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_ALE_PACKAGE_ID => Guid("{71bc78fa-f17c-4997-a602-6abb261f351c}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_MAC_SOURCE_ADDRESS => Guid("{7b795451-f1f6-4d05-b7cb-21779d802336}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_MAC_DESTINATION_ADDRESS => Guid("{04ea2a93-858c-4027-b613-b43180c7859e}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_MAC_SOURCE_ADDRESS_TYPE => Guid("{5c1b72e4-299e-4437-a298-bc3f014b3dc2}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_MAC_DESTINATION_ADDRESS_TYPE => Guid("{ae052932-ef42-4e99-b129-f3b3139e34f7}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_IP_SOURCE_PORT => Guid("{a6afef91-3df4-4730-a214-f5426aebf821}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_IP_DESTINATION_PORT => Guid("{ce6def45-60fb-4a7b-a304-af30a117000e}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_VSWITCH_ID => Guid("{c4a414ba-437b-4de6-9946-d99c1b95b312}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_VSWITCH_NETWORK_TYPE => Guid("{11d48b4b-e77a-40b4-9155-392c906c2608}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_VSWITCH_SOURCE_INTERFACE_ID => Guid("{7f4ef24b-b2c1-4938-ba33-a1ecbed512ba}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_VSWITCH_DESTINATION_INTERFACE_ID => Guid("{8ed48be4-c926-49f6-a4f6-ef3030e3fc16}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_VSWITCH_SOURCE_VM_ID => Guid("{9c2a9ec2-9fc6-42bc-bdd8-406d4da0be64}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_VSWITCH_DESTINATION_VM_ID => Guid("{6106aace-4de1-4c84-9671-3637f8bcf731}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_VSWITCH_SOURCE_INTERFACE_TYPE => Guid("{e6b040a2-edaf-4c36-908b-f2f58ae43807}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_VSWITCH_DESTINATION_INTERFACE_TYPE => Guid("{fa9b3f06-2f1a-4c57-9e68-a7098b28dbfe}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_ALE_SECURITY_ATTRIBUTE_FQBN_VALUE => Guid("{37a57699-5883-4963-92b8-3e704688b0ad}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_IPSEC_SECURITY_REALM_ID => Guid("{37a57700-5884-4964-92b8-3e704688b0ad}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_ALE_EFFECTIVE_NAME => Guid("{b1277b9a-b781-40fc-9671-e5f1b989f34e}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_IP_LOCAL_ADDRESS => Guid("{d9ee00de-c1ef-4617-bfe3-ffd8f5a08957}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_IP_REMOTE_ADDRESS => Guid("{b235ae9a-1d64-49b8-a44c-5ff3d9095045}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_IP_SOURCE_ADDRESS => Guid("{ae96897e-2e94-4bc9-b313-b27ee80e574d}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_IP_DESTINATION_ADDRESS => Guid("{2d79133b-b390-45c6-8699-acaceaafed33}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_IP_LOCAL_ADDRESS_TYPE => Guid("{6ec7f6c4-376b-45d7-9e9c-d337cedcd237}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_IP_DESTINATION_ADDRESS_TYPE => Guid("{1ec1b7c9-4eea-4f5e-b9ef-76beaaaf17ee}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_IP_NEXTHOP_ADDRESS => Guid("{eabe448a-a711-4d64-85b7-3f76b65299c7}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_IP_LOCAL_INTERFACE => Guid("{4cd62a49-59c3-4969-b7f3-bda5d32890a4}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_IP_ARRIVAL_INTERFACE => Guid("{618a9b6d-386b-4136-ad6e-b51587cfb1cd}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_ARRIVAL_INTERFACE_TYPE => Guid("{89f990de-e798-4e6d-ab76-7c9558292e6f}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_ARRIVAL_TUNNEL_TYPE => Guid("{511166dc-7a8c-4aa7-b533-95ab59fb0340}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_ARRIVAL_INTERFACE_INDEX => Guid("{cc088db3-1792-4a71-b0f9-037d21cd828b}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_NEXTHOP_SUB_INTERFACE_INDEX => Guid("{ef8a6122-0577-45a7-9aaf-825fbeb4fb95}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_IP_NEXTHOP_INTERFACE => Guid("{93ae8f5b-7f6f-4719-98c8-14e97429ef04}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_NEXTHOP_INTERFACE_TYPE => Guid("{97537c6c-d9a3-4767-a381-e942675cd920}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_NEXTHOP_TUNNEL_TYPE => Guid("{72b1a111-987b-4720-99dd-c7c576fa2d4c}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_NEXTHOP_INTERFACE_INDEX => Guid("{138e6888-7ab8-4d65-9ee8-0591bcf6a494}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_ORIGINAL_PROFILE_ID => Guid("{46ea1551-2255-492b-8019-aabeee349f40}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_CURRENT_PROFILE_ID => Guid("{ab3033c9-c0e3-4759-937d-5758c65d4ae3}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_LOCAL_INTERFACE_PROFILE_ID => Guid("{4ebf7562-9f18-4d06-9941-a7a625744d71}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_ARRIVAL_INTERFACE_PROFILE_ID => Guid("{cdfe6aab-c083-4142-8679-c08f95329c61}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_NEXTHOP_INTERFACE_PROFILE_ID => Guid("{d7ff9a56-cdaa-472b-84db-d23963c1d1bf}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_REAUTHORIZE_REASON => Guid("{11205e8c-11ae-457a-8a44-477026dd764a}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_ORIGINAL_ICMP_TYPE => Guid("{076dfdbe-c56c-4f72-ae8a-2cfe7e5c8286}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_IP_PHYSICAL_ARRIVAL_INTERFACE => Guid("{da50d5c8-fa0d-4c89-b032-6e62136d1e96}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_IP_PHYSICAL_NEXTHOP_INTERFACE => Guid("{f09bd5ce-5150-48be-b098-c25152fb1f92}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_INTERFACE_QUARANTINE_EPOCH => Guid("{cce68d5e-053b-43a8-9a6f-33384c28e4f6}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_INTERFACE_TYPE => Guid("{daf8cd14-e09e-4c93-a5ae-c5c13b73ffca}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_TUNNEL_TYPE => Guid("{77a40437-8779-4868-a261-f5a902f1c0cd}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_IP_FORWARD_INTERFACE => Guid("{1076b8a5-6323-4c5e-9810-e8d3fc9e6136}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_IP_PROTOCOL => Guid("{3971ef2b-623e-4f9a-8cb1-6e79b806b9a7}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_IP_LOCAL_PORT => Guid("{0c1ba1af-5765-453f-af22-a8f791ac775b}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_IP_REMOTE_PORT => Guid("{c35a604d-d22b-4e1a-91b4-68f674ee674b}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_EMBEDDED_LOCAL_ADDRESS_TYPE => Guid("{4672a468-8a0a-4202-abb4-849e92e66809}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_EMBEDDED_REMOTE_ADDRESS => Guid("{77ee4b39-3273-4671-b63b-ab6feb66eeb6}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_EMBEDDED_PROTOCOL => Guid("{07784107-a29e-4c7b-9ec7-29c44afafdbc}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_EMBEDDED_LOCAL_PORT => Guid("{bfca394d-acdb-484e-b8e6-2aff79757345}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_EMBEDDED_REMOTE_PORT => Guid("{cae4d6a1-2968-40ed-a4ce-547160dda88d}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_FLAGS => Guid("{632ce23b-5167-435c-86d7-e903684aa80c}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_DIRECTION => Guid("{8784c146-ca97-44d6-9fd1-19fb1840cbf7}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_INTERFACE_INDEX => Guid("{667fd755-d695-434a-8af5-d3835a1259bc}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_SUB_INTERFACE_INDEX => Guid("{0cd42473-d621-4be3-ae8c-72a348d283e1}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_SOURCE_INTERFACE_INDEX => Guid("{2311334d-c92d-45bf-9496-edf447820e2d}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_SOURCE_SUB_INTERFACE_INDEX => Guid("{055edd9d-acd2-4361-8dab-f9525d97662f}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_DESTINATION_INTERFACE_INDEX => Guid("{35cf6522-4139-45ee-a0d5-67b80949d879}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_DESTINATION_SUB_INTERFACE_INDEX => Guid("{2b7d4399-d4c7-4738-a2f5-e994b43da388}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_ALE_APP_ID => Guid("{d78e1e87-8644-4ea5-9437-d809ecefc971}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_ALE_ORIGINAL_APP_ID => Guid("{0e6cd086-e1fb-4212-842f-8a9f993fb3f6}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_ALE_USER_ID => Guid("{af043a0a-b34d-4f86-979c-c90371af6e66}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_ALE_REMOTE_USER_ID => Guid("{f63073b7-0189-4ab0-95a4-6123cbfab862}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_ALE_REMOTE_MACHINE_ID => Guid("{1aa47f51-7f93-4508-a271-81abb00c9cab}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_ALE_PROMISCUOUS_MODE => Guid("{1c974776-7182-46e9-afd3-b02910e30334}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_ALE_SIO_FIREWALL_SYSTEM_PORT => Guid("{b9f4e088-cb98-4efb-a2c7-ad07332643db}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_ALE_REAUTH_REASON => Guid("{b482d227-1979-4a98-8044-18bbe6237542}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_ALE_NAP_CONTEXT => Guid("{46275a9d-c03f-4d77-b784-1c57f4d02753}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_KM_AUTH_NAP_CONTEXT => Guid("{35d0ea0e-15ca-492b-900e-97fd46352cce}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_REMOTE_USER_TOKEN => Guid("{9bf0ee66-06c9-41b9-84da-288cb43af51f}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_RPC_IF_UUID => Guid("{7c9c7d9f-0075-4d35-a0d1-8311c4cf6af1}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_RPC_IF_VERSION => Guid("{eabfd9b7-1262-4a2e-adaa-5f96f6fe326d}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_RPC_IF_FLAG => Guid("{238a8a32-3199-467d-871c-272621ab3896}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_DCOM_APP_ID => Guid("{ff2e7b4d-3112-4770-b636-4d24ae3a6af2}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_IMAGE_NAME => Guid("{d024de4d-deaa-4317-9c85-e40ef6e140c3}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_RPC_PROTOCOL => Guid("{2717bc74-3a35-4ce7-b7ef-c838fabdec45}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_RPC_AUTH_TYPE => Guid("{daba74ab-0d67-43e7-986e-75b84f82f594}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_RPC_AUTH_LEVEL => Guid("{e5a0aed5-59ac-46ea-be05-a5f05ecf446e}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_SEC_ENCRYPT_ALGORITHM => Guid("{0d306ef0-e974-4f74-b5c7-591b0da7d562}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_SEC_KEY_SIZE => Guid("{4772183b-ccf8-4aeb-bce1-c6c6161c8fe4}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_IP_LOCAL_ADDRESS_V4 => Guid("{03a629cb-6e52-49f8-9c41-5709633c09cf}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_IP_LOCAL_ADDRESS_V6 => Guid("{2381be84-7524-45b3-a05b-1e637d9c7a6a}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_PIPE => Guid("{1bd0741d-e3df-4e24-8634-762046eef6eb}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_IP_REMOTE_ADDRESS_V4 => Guid("{1febb610-3bcc-45e1-bc36-2e067e2cb186}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_IP_REMOTE_ADDRESS_V6 => Guid("{246e1d8c-8bee-4018-9b98-31d4582f3361}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_RPC_OPNUM => Guid("{d58efb76-aab7-4148-a87e-9581134129b9}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_PROCESS_WITH_RPC_IF_UUID => Guid("{e31180a8-bbbd-4d14-a65e-7157b06233bb}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_RPC_EP_VALUE => Guid("{dccea0b9-0886-4360-9c6a-ab043a24fba9}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_RPC_EP_FLAGS => Guid("{218b814a-0a39-49b8-8e71-c20c39c7dd2e}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_CLIENT_TOKEN => Guid("{c228fc1e-403a-4478-be05-c9baa4c05ace}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_RPC_SERVER_NAME => Guid("{b605a225-c3b3-48c7-9833-7aefa9527546}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_RPC_SERVER_PORT => Guid("{8090f645-9ad5-4e3b-9f9f-8023ca097909}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_RPC_PROXY_AUTH_TYPE => Guid("{40953fe2-8565-4759-8488-1771b4b4b5db}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_CLIENT_CERT_KEY_LENGTH => Guid("{a3ec00c7-05f4-4df7-91f2-5f60d91ff443}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_CLIENT_CERT_OID => Guid("{c491ad5e-f882-4283-b916-436b103ff4ad}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_NET_EVENT_TYPE => Guid("{206e9996-490e-40cf-b831-b38641eb6fcb}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_PEER_NAME => Guid("{9b539082-eb90-4186-a6cc-de5b63235016}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_REMOTE_ID => Guid("{f68166fd-0682-4c89-b8f5-86436c7ef9b7}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_AUTHENTICATION_TYPE => Guid("{eb458cd5-da7b-4ef9-8d43-7b0a840332f2}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_KM_TYPE => Guid("{ff0f5f49-0ceb-481b-8638-1479791f3f2c}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_KM_MODE => Guid("{feef4582-ef8f-4f7b-858b-9077d122de47}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_IPSEC_POLICY_KEY => Guid("{ad37dee3-722f-45cc-a4e3-068048124452}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_QM_MODE => Guid("{f64fc6d1-f9cb-43d2-8a5f-e13bc894f265}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_COMPARTMENT_ID => Guid("{35a791ab-04ac-4ff2-a6bb-da6cfac71806}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_RESERVED0 => Guid("{678f4deb-45af-4882-93fe-19d4729d9834}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_RESERVED1 => Guid("{d818f827-5c69-48eb-bf80-d86b17755f97}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_RESERVED2 => Guid("{53d4123d-e15b-4e84-b7a8-dce16f7b62d9}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_RESERVED3 => Guid("{7f6e8ca3-6606-4932-97c7-e1f20710af3b}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_RESERVED4 => Guid("{5f58e642-b937-495e-a94b-f6b051a49250}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_RESERVED5 => Guid("{9ba8f6cd-f77c-43e6-8847-11939dc5db5a}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_RESERVED6 => Guid("{f13d84bd-59d5-44c4-8817-5ecdae1805bd}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_RESERVED7 => Guid("{65a0f930-45dd-4983-aa33-efc7b611af08}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_RESERVED8 => Guid("{4f424974-0c12-4816-9b47-9a547db39a32}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_RESERVED9 => Guid("{ce78e10f-13ff-4c70-8643-36ad1879afa3}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_RESERVED10 => Guid("{b979e282-d621-4c8c-b184-b105a61c36ce}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_RESERVED11 => Guid("{2d62ee4d-023d-411f-9582-43acbb795975}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_RESERVED12 => Guid("{a3677c32-7e35-4ddc-93da-e8c33fc923c7}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_RESERVED13 => Guid("{335a3e90-84aa-42f5-9e6f-59309536a44c}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_RESERVED14 => Guid("{30e44da2-2f1a-4116-a559-f907de83604a}")

    /**
     * @type {Guid}
     */
    static FWPM_CONDITION_RESERVED15 => Guid("{bab8340f-afe0-43d1-80d8-5ca456962de3}")

    /**
     * @type {Guid}
     */
    static FWPM_PROVIDER_IKEEXT => Guid("{10ad9216-ccde-456c-8b16-e9f04e60a90b}")

    /**
     * @type {Guid}
     */
    static FWPM_PROVIDER_IPSEC_DOSP_CONFIG => Guid("{3c6c05a9-c05c-4bb9-8338-2327814ce8bf}")

    /**
     * @type {Guid}
     */
    static FWPM_PROVIDER_TCP_CHIMNEY_OFFLOAD => Guid("{896aa19e-9a34-4bcb-ae79-beb9127c84b9}")

    /**
     * @type {Guid}
     */
    static FWPM_PROVIDER_TCP_TEMPLATES => Guid("{76cfcd30-3394-432d-bed3-441ae50e63c3}")

    /**
     * @type {Guid}
     */
    static FWPM_PROVIDER_MPSSVC_WSH => Guid("{4b153735-1049-4480-aab4-d1b9bdc03710}")

    /**
     * @type {Guid}
     */
    static FWPM_PROVIDER_MPSSVC_WF => Guid("{decc16ca-3f33-4346-be1e-8fb4ae0f3d62}")

    /**
     * @type {Guid}
     */
    static FWPM_PROVIDER_MPSSVC_EDP => Guid("{a90296f7-46b8-4457-8f84-b05e05d3c622}")

    /**
     * @type {Guid}
     */
    static FWPM_PROVIDER_MPSSVC_TENANT_RESTRICTIONS => Guid("{d0718ff9-44da-4f50-9dc2-c963a4247613}")

    /**
     * @type {Guid}
     */
    static FWPM_PROVIDER_MPSSVC_APP_ISOLATION => Guid("{3cc2631f-2d5d-43a0-b174-614837d863a1}")

    /**
     * @type {Guid}
     */
    static FWPM_CALLOUT_IPSEC_INBOUND_TRANSPORT_V4 => Guid("{5132900d-5e84-4b5f-80e4-01741e81ff10}")

    /**
     * @type {Guid}
     */
    static FWPM_CALLOUT_IPSEC_INBOUND_TRANSPORT_V6 => Guid("{49d3ac92-2a6c-4dcf-955f-1c3be009dd99}")

    /**
     * @type {Guid}
     */
    static FWPM_CALLOUT_IPSEC_OUTBOUND_TRANSPORT_V4 => Guid("{4b46bf0a-4523-4e57-aa38-a87987c910d9}")

    /**
     * @type {Guid}
     */
    static FWPM_CALLOUT_IPSEC_OUTBOUND_TRANSPORT_V6 => Guid("{38d87722-ad83-4f11-a91f-df0fb077225b}")

    /**
     * @type {Guid}
     */
    static FWPM_CALLOUT_IPSEC_INBOUND_TUNNEL_V4 => Guid("{191a8a46-0bf8-46cf-b045-4b45dfa6a324}")

    /**
     * @type {Guid}
     */
    static FWPM_CALLOUT_IPSEC_INBOUND_TUNNEL_V6 => Guid("{80c342e3-1e53-4d6f-9b44-03df5aeee154}")

    /**
     * @type {Guid}
     */
    static FWPM_CALLOUT_IPSEC_OUTBOUND_TUNNEL_V4 => Guid("{70a4196c-835b-4fb0-98e8-075f4d977d46}")

    /**
     * @type {Guid}
     */
    static FWPM_CALLOUT_IPSEC_OUTBOUND_TUNNEL_V6 => Guid("{f1835363-a6a5-4e62-b180-23db789d8da6}")

    /**
     * @type {Guid}
     */
    static FWPM_CALLOUT_IPSEC_FORWARD_INBOUND_TUNNEL_V4 => Guid("{28829633-c4f0-4e66-873f-844db2a899c7}")

    /**
     * @type {Guid}
     */
    static FWPM_CALLOUT_IPSEC_FORWARD_INBOUND_TUNNEL_V6 => Guid("{af50bec2-c686-429a-884d-b74443e7b0b4}")

    /**
     * @type {Guid}
     */
    static FWPM_CALLOUT_IPSEC_FORWARD_OUTBOUND_TUNNEL_V4 => Guid("{fb532136-15cb-440b-937c-1717ca320c40}")

    /**
     * @type {Guid}
     */
    static FWPM_CALLOUT_IPSEC_FORWARD_OUTBOUND_TUNNEL_V6 => Guid("{dae640cc-e021-4bee-9eb6-a48b275c8c1d}")

    /**
     * @type {Guid}
     */
    static FWPM_CALLOUT_IPSEC_INBOUND_INITIATE_SECURE_V4 => Guid("{7dff309b-ba7d-4aba-91aa-ae5c6640c944}")

    /**
     * @type {Guid}
     */
    static FWPM_CALLOUT_IPSEC_INBOUND_INITIATE_SECURE_V6 => Guid("{a9a0d6d9-c58c-474e-8aeb-3cfe99d6d53d}")

    /**
     * @type {Guid}
     */
    static FWPM_CALLOUT_IPSEC_INBOUND_TUNNEL_ALE_ACCEPT_V4 => Guid("{3df6e7de-fd20-48f2-9f26-f854444cba79}")

    /**
     * @type {Guid}
     */
    static FWPM_CALLOUT_IPSEC_INBOUND_TUNNEL_ALE_ACCEPT_V6 => Guid("{a1e392d3-72ac-47bb-87a7-0122c69434ab}")

    /**
     * @type {Guid}
     */
    static FWPM_CALLOUT_IPSEC_ALE_CONNECT_V4 => Guid("{6ac141fc-f75d-4203-b9c8-48e6149c2712}")

    /**
     * @type {Guid}
     */
    static FWPM_CALLOUT_IPSEC_ALE_CONNECT_V6 => Guid("{4c0dda05-e31f-4666-90b0-b3dfad34129a}")

    /**
     * @type {Guid}
     */
    static FWPM_CALLOUT_IPSEC_DOSP_FORWARD_V6 => Guid("{6d08a342-db9e-4fbe-9ed2-57374ce89f79}")

    /**
     * @type {Guid}
     */
    static FWPM_CALLOUT_IPSEC_DOSP_FORWARD_V4 => Guid("{2fcb56ec-cd37-4b4f-b108-62c2b1850a0c}")

    /**
     * @type {Guid}
     */
    static FWPM_CALLOUT_WFP_TRANSPORT_LAYER_V4_SILENT_DROP => Guid("{eda08606-2494-4d78-89bc-67837c03b969}")

    /**
     * @type {Guid}
     */
    static FWPM_CALLOUT_WFP_TRANSPORT_LAYER_V6_SILENT_DROP => Guid("{8693cc74-a075-4156-b476-9286eece814e}")

    /**
     * @type {Guid}
     */
    static FWPM_CALLOUT_TCP_CHIMNEY_CONNECT_LAYER_V4 => Guid("{f3e10ab3-2c25-4279-ac36-c30fc181bec4}")

    /**
     * @type {Guid}
     */
    static FWPM_CALLOUT_TCP_CHIMNEY_CONNECT_LAYER_V6 => Guid("{39e22085-a341-42fc-a279-aec94e689c56}")

    /**
     * @type {Guid}
     */
    static FWPM_CALLOUT_TCP_CHIMNEY_ACCEPT_LAYER_V4 => Guid("{e183ecb2-3a7f-4b54-8ad9-76050ed880ca}")

    /**
     * @type {Guid}
     */
    static FWPM_CALLOUT_TCP_CHIMNEY_ACCEPT_LAYER_V6 => Guid("{0378cf41-bf98-4603-81f2-7f12586079f6}")

    /**
     * @type {Guid}
     */
    static FWPM_CALLOUT_SET_OPTIONS_AUTH_CONNECT_LAYER_V4 => Guid("{bc582280-1677-41e9-94ab-c2fcb15c2eeb}")

    /**
     * @type {Guid}
     */
    static FWPM_CALLOUT_SET_OPTIONS_AUTH_CONNECT_LAYER_V6 => Guid("{98e5373c-b884-490f-b65f-2f6a4a575195}")

    /**
     * @type {Guid}
     */
    static FWPM_CALLOUT_SET_OPTIONS_AUTH_RECV_ACCEPT_LAYER_V4 => Guid("{2d55f008-0c01-4f92-b26e-a08a94569b8d}")

    /**
     * @type {Guid}
     */
    static FWPM_CALLOUT_SET_OPTIONS_AUTH_RECV_ACCEPT_LAYER_V6 => Guid("{63018537-f281-4dc4-83d3-8dec18b7ade2}")

    /**
     * @type {Guid}
     */
    static FWPM_CALLOUT_RESERVED_AUTH_CONNECT_LAYER_V4 => Guid("{288b524d-0566-4e19-b612-8f441a2e5949}")

    /**
     * @type {Guid}
     */
    static FWPM_CALLOUT_RESERVED_AUTH_CONNECT_LAYER_V6 => Guid("{00b84b92-2b5e-4b71-ab0e-aaca43e387e6}")

    /**
     * @type {Guid}
     */
    static FWPM_CALLOUT_TEREDO_ALE_RESOURCE_ASSIGNMENT_V6 => Guid("{31b95392-066e-42a2-b7db-92f8acdd56f9}")

    /**
     * @type {Guid}
     */
    static FWPM_CALLOUT_EDGE_TRAVERSAL_ALE_RESOURCE_ASSIGNMENT_V4 => Guid("{079b1010-f1c5-4fcd-ae05-da41107abd0b}")

    /**
     * @type {Guid}
     */
    static FWPM_CALLOUT_TEREDO_ALE_LISTEN_V6 => Guid("{81a434e7-f60c-4378-bab8-c625a30f0197}")

    /**
     * @type {Guid}
     */
    static FWPM_CALLOUT_EDGE_TRAVERSAL_ALE_LISTEN_V4 => Guid("{33486ab5-6d5e-4e65-a00b-a7afed0ba9a1}")

    /**
     * @type {Guid}
     */
    static FWPM_CALLOUT_TCP_TEMPLATES_CONNECT_LAYER_V4 => Guid("{215a0b39-4b7e-4eda-8ce4-179679df6224}")

    /**
     * @type {Guid}
     */
    static FWPM_CALLOUT_TCP_TEMPLATES_CONNECT_LAYER_V6 => Guid("{838b37a1-5c12-4d34-8b38-078728b2d25c}")

    /**
     * @type {Guid}
     */
    static FWPM_CALLOUT_TCP_TEMPLATES_ACCEPT_LAYER_V4 => Guid("{2f23f5d0-40c4-4c41-a254-46d8dba8957c}")

    /**
     * @type {Guid}
     */
    static FWPM_CALLOUT_TCP_TEMPLATES_ACCEPT_LAYER_V6 => Guid("{b25152f0-991c-4f53-bbe7-d24b45fe632c}")

    /**
     * @type {Guid}
     */
    static FWPM_CALLOUT_POLICY_SILENT_MODE_AUTH_CONNECT_LAYER_V4 => Guid("{5fbfc31d-a51c-44dc-acb6-0624a030a700}")

    /**
     * @type {Guid}
     */
    static FWPM_CALLOUT_POLICY_SILENT_MODE_AUTH_CONNECT_LAYER_V6 => Guid("{5fbfc31d-a51c-44dc-acb6-0624a030a701}")

    /**
     * @type {Guid}
     */
    static FWPM_CALLOUT_POLICY_SILENT_MODE_AUTH_RECV_ACCEPT_LAYER_V4 => Guid("{5fbfc31d-a51c-44dc-acb6-0624a030a702}")

    /**
     * @type {Guid}
     */
    static FWPM_CALLOUT_POLICY_SILENT_MODE_AUTH_RECV_ACCEPT_LAYER_V6 => Guid("{5fbfc31d-a51c-44dc-acb6-0624a030a703}")

    /**
     * @type {Guid}
     */
    static FWPM_CALLOUT_HTTP_TEMPLATE_SSL_HANDSHAKE => Guid("{b3423249-8d09-4858-9210-95c7fda8e30f}")

    /**
     * @type {Guid}
     */
    static FWPM_CALLOUT_OUTBOUND_NETWORK_CONNECTION_POLICY_LAYER_V4 => Guid("{103090d4-8e28-4fd6-9894-d1d67d6b10c9}")

    /**
     * @type {Guid}
     */
    static FWPM_CALLOUT_OUTBOUND_NETWORK_CONNECTION_POLICY_LAYER_V6 => Guid("{4ed3446d-8dc7-459b-b09f-c1cb7a8f8689}")

    /**
     * @type {Guid}
     */
    static FWPM_CALLOUT_BUILT_IN_RESERVED_1 => Guid("{779719a4-e695-47b6-a199-7999fec9163b}")

    /**
     * @type {Guid}
     */
    static FWPM_CALLOUT_BUILT_IN_RESERVED_2 => Guid("{ef9661b6-7c5e-48fd-a130-96678ceacc41}")

    /**
     * @type {Guid}
     */
    static FWPM_CALLOUT_BUILT_IN_RESERVED_3 => Guid("{18729c7a-2f62-4be0-966f-974b21b86df1}")

    /**
     * @type {Guid}
     */
    static FWPM_CALLOUT_BUILT_IN_RESERVED_4 => Guid("{6c3fb801-daff-40e9-91e6-f7ff7e52f7d9}")

    /**
     * @type {Guid}
     */
    static FWPM_PROVIDER_CONTEXT_SECURE_SOCKET_AUTHIP => Guid("{b25ea800-0d02-46ed-92bd-7fa84bb73e9d}")

    /**
     * @type {Guid}
     */
    static FWPM_PROVIDER_CONTEXT_SECURE_SOCKET_IPSEC => Guid("{8c2d4144-f8e0-42c0-94ce-7ccfc63b2f9b}")

    /**
     * @type {Guid}
     */
    static FWPM_KEYING_MODULE_IKE => Guid("{a9bbf787-82a8-45bb-a400-5d7e5952c7a9}")

    /**
     * @type {Guid}
     */
    static FWPM_KEYING_MODULE_AUTHIP => Guid("{11e3dae0-dd26-4590-857d-ab4b28d1a095}")

    /**
     * @type {Guid}
     */
    static FWPM_KEYING_MODULE_IKEV2 => Guid("{041792cc-8f07-419d-a394-716968cb1647}")

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_AUTO_WEIGHT_BITS => 60

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_WEIGHT_RANGE_IPSEC => 0

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_WEIGHT_RANGE_IKE_EXEMPTIONS => 12

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_ACTRL_ADD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_ACTRL_ADD_LINK => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_ACTRL_BEGIN_READ_TXN => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_ACTRL_BEGIN_WRITE_TXN => 8

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_ACTRL_CLASSIFY => 16

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_ACTRL_ENUM => 32

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_ACTRL_OPEN => 64

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_ACTRL_READ => 128

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_ACTRL_READ_STATS => 256

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_ACTRL_SUBSCRIBE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_ACTRL_WRITE => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_TXN_READ_ONLY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_TUNNEL_FLAG_POINT_TO_POINT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_TUNNEL_FLAG_ENABLE_VIRTUAL_IF_TUNNELING => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_TUNNEL_FLAG_RESERVED0 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FWPS_METADATA_FIELD_DISCARD_REASON => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FWPS_METADATA_FIELD_FLOW_HANDLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FWPS_METADATA_FIELD_IP_HEADER_SIZE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FWPS_METADATA_FIELD_PROCESS_PATH => 8

    /**
     * @type {Integer (UInt32)}
     */
    static FWPS_METADATA_FIELD_TOKEN => 16

    /**
     * @type {Integer (UInt32)}
     */
    static FWPS_METADATA_FIELD_PROCESS_ID => 32

    /**
     * @type {Integer (UInt32)}
     */
    static FWPS_METADATA_FIELD_SYSTEM_FLAGS => 64

    /**
     * @type {Integer (UInt32)}
     */
    static FWPS_METADATA_FIELD_RESERVED => 128

    /**
     * @type {Integer (UInt32)}
     */
    static FWPS_METADATA_FIELD_SOURCE_INTERFACE_INDEX => 256

    /**
     * @type {Integer (UInt32)}
     */
    static FWPS_METADATA_FIELD_DESTINATION_INTERFACE_INDEX => 512

    /**
     * @type {Integer (UInt32)}
     */
    static FWPS_METADATA_FIELD_TRANSPORT_HEADER_SIZE => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static FWPS_METADATA_FIELD_COMPARTMENT_ID => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static FWPS_METADATA_FIELD_FRAGMENT_DATA => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static FWPS_METADATA_FIELD_PATH_MTU => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static FWPS_METADATA_FIELD_COMPLETION_HANDLE => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static FWPS_METADATA_FIELD_TRANSPORT_ENDPOINT_HANDLE => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static FWPS_METADATA_FIELD_TRANSPORT_CONTROL_DATA => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static FWPS_METADATA_FIELD_REMOTE_SCOPE_ID => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static FWPS_METADATA_FIELD_PACKET_DIRECTION => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static FWPS_METADATA_FIELD_PACKET_SYSTEM_CRITICAL => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static FWPS_METADATA_FIELD_FORWARD_LAYER_OUTBOUND_PASS_THRU => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static FWPS_METADATA_FIELD_FORWARD_LAYER_INBOUND_PASS_THRU => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static FWPS_METADATA_FIELD_ALE_CLASSIFY_REQUIRED => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static FWPS_METADATA_FIELD_TRANSPORT_HEADER_INCLUDE_HEADER => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static FWPS_METADATA_FIELD_DESTINATION_PREFIX => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static FWPS_METADATA_FIELD_ETHER_FRAME_LENGTH => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static FWPS_METADATA_FIELD_PARENT_ENDPOINT_HANDLE => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static FWPS_METADATA_FIELD_ICMP_ID_AND_SEQUENCE => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static FWPS_METADATA_FIELD_LOCAL_REDIRECT_TARGET_PID => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static FWPS_METADATA_FIELD_ORIGINAL_DESTINATION => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static FWPS_METADATA_FIELD_REDIRECT_RECORD_HANDLE => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static FWPS_METADATA_FIELD_SUB_PROCESS_TAG => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static FWPS_L2_METADATA_FIELD_ETHERNET_MAC_HEADER_SIZE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FWPS_L2_METADATA_FIELD_WIFI_OPERATION_MODE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FWPS_L2_METADATA_FIELD_VSWITCH_SOURCE_PORT_ID => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FWPS_L2_METADATA_FIELD_VSWITCH_SOURCE_NIC_INDEX => 8

    /**
     * @type {Integer (UInt32)}
     */
    static FWPS_L2_METADATA_FIELD_VSWITCH_PACKET_CONTEXT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static FWPS_L2_METADATA_FIELD_VSWITCH_DESTINATION_PORT_ID => 32

    /**
     * @type {Integer (UInt32)}
     */
    static FWPS_L2_METADATA_FIELD_RESERVED => 2147483648
;@endregion Constants

;@region Methods
    /**
     * Is used to release memory resources allocated by the Windows Filtering Platform (WFP) functions.
     * @remarks
     * 
     * <b>FwpmFreeMemory0</b> is used to free memory returned by the various <b>Fwpm*</b> functions, such as <b>FwpmFilterGetByKey0</b>.
     * 
     * <b>Fwpm*</b> functions that return a HANDLE, such as <b>FwpmCalloutCreateEnumHandle0</b>, have specific functions to release memory.
     * 
     * If the caller passes a pointer that is not valid, the behavior is undefined.
     * 
     * <b>FwpmFreeMemory0</b> is a specific implementation of FwpmFreeMemory. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
     * 
     * 
     * @param {Pointer<Pointer<Void>>} p Type: <b>void**</b>
     * 
     * Address of the pointer to be freed.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmfreememory0
     * @since windows6.0.6000
     */
    static FwpmFreeMemory0(p) {
        pMarshal := p is VarRef ? "ptr*" : "ptr"

        DllCall("fwpuclnt.dll\FwpmFreeMemory0", pMarshal, p)
    }

    /**
     * Opens a session to the filter engine.
     * @param {Integer} authnService Type: <b>UINT32</b>
     * 
     * Specifies the authentication service to use. Allowed services are RPC_C_AUTHN_WINNT and RPC_C_AUTHN_DEFAULT.
     * @param {Pointer<SEC_WINNT_AUTH_IDENTITY_W>} authIdentity Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/ns-rpcdce-sec_winnt_auth_identity_a">SEC_WINNT_AUTH_IDENTITY_W</a>*</b>
     * 
     * The authentication and authorization credentials for accessing the filter engine. This pointer is optional and can be <b>NULL</b>. If this pointer is <b>NULL</b>, the calling thread's credentials are used.
     * @param {Pointer<FWPM_SESSION0>} session Type: [FWPM_SESSION0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_session0)*</b>
     * 
     * Session-specific parameters for the session being opened. This pointer is optional and can be <b>NULL</b>.
     * @param {Pointer<HANDLE>} engineHandle Type: <b>HANDLE*</b>
     * 
     * Handle for the open session to the filter engine.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The session was started successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_ALREADY_EXISTS</b></dt>
     * <dt>0x80320009</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A session with the specified <b>sessionKey</b> is already opened.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmengineopen0
     * @since windows6.0.6000
     */
    static FwpmEngineOpen0(authnService, authIdentity, session, engineHandle) {
        static serverName := 0 ;Reserved parameters must always be NULL

        result := DllCall("fwpuclnt.dll\FwpmEngineOpen0", "ptr", serverName, "uint", authnService, "ptr", authIdentity, "ptr", session, "ptr", engineHandle, "uint")
        return result
    }

    /**
     * Closes a session to a filter engine.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The session was closed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmengineclose0
     * @since windows6.0.6000
     */
    static FwpmEngineClose0(engineHandle) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        result := DllCall("fwpuclnt.dll\FwpmEngineClose0", "ptr", engineHandle, "uint")
        return result
    }

    /**
     * Retrieves a filter engine option.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Integer} option Type: [FWPM_ENGINE_OPTION](/windows/desktop/api/fwpmtypes/ne-fwpmtypes-fwpm_engine_option)</b>
     * 
     * The option to be retrieved.
     * @param {Pointer<Pointer<FWP_VALUE0>>} value Type: [FWP_VALUE0](/windows/desktop/api/fwptypes/ns-fwptypes-fwp_value0)**</b>
     * 
     * The option value. The data    type contained in the <i>value</i> parameter will be <b>FWP_UINT32</b>.
     * 
     * 
     * If <i>option</i> is <b>FWPM_ENGINE_COLLECT_NET_EVENTS</b>, <i>value</i> will be one of the following.
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
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Network events are not being collected.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Network events are being collected.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The option was retrieved successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmenginegetoption0
     * @since windows6.0.6000
     */
    static FwpmEngineGetOption0(engineHandle, option, value) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        valueMarshal := value is VarRef ? "ptr*" : "ptr"

        result := DllCall("fwpuclnt.dll\FwpmEngineGetOption0", "ptr", engineHandle, "int", option, valueMarshal, value, "uint")
        return result
    }

    /**
     * Changes the filter engine settings.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Integer} option Type: [FWPM_ENGINE_OPTION](/windows/desktop/api/fwpmtypes/ne-fwpmtypes-fwpm_engine_option)</b>
     * 
     * The option to be set.
     * @param {Pointer<FWP_VALUE0>} newValue Type: [FWP_VALUE0](/windows/desktop/api/fwptypes/ns-fwptypes-fwp_value0)*</b>
     * 
     * The new   option value. The data type contained in the <i>newValue</i> parameter should be  <b>FWP_UINT32</b>. 
     * 
     * 
     * When <i>option</i> is <b>FWPM_ENGINE_COLLECT_NET_EVENTS</b>, <i>newValue</i> should be one of the following.
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
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not collect network events.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Collect network events. This is the default setting.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The option was set successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmenginesetoption0
     * @since windows6.0.6000
     */
    static FwpmEngineSetOption0(engineHandle, option, newValue) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        result := DllCall("fwpuclnt.dll\FwpmEngineSetOption0", "ptr", engineHandle, "int", option, "ptr", newValue, "uint")
        return result
    }

    /**
     * Retrieves a copy of the security descriptor for the filter engine.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Integer} securityInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a></b>
     * 
     * The type of security information to retrieve.
     * @param {Pointer<PSID>} sidOwner Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">PSID</a>*</b>
     * 
     * The owner security identifier (SID) in the returned security descriptor.
     * @param {Pointer<PSID>} sidGroup Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">PSID</a>*</b>
     * 
     * The primary group security identifier (SID) in the returned security descriptor.
     * @param {Pointer<Pointer<ACL>>} dacl Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">PACL</a>*</b>
     * 
     * The discretionary access control list (DACL) in the returned security descriptor.
     * @param {Pointer<Pointer<ACL>>} sacl Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">PACL</a>*</b>
     * 
     * The system access control list (SACL) in the returned security descriptor.
     * @param {Pointer<PSECURITY_DESCRIPTOR>} securityDescriptor Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">PSECURITY_DESCRIPTOR</a>*</b>
     * 
     * The returned security descriptor.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The security descriptor was retrieved successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmenginegetsecurityinfo0
     * @since windows6.0.6000
     */
    static FwpmEngineGetSecurityInfo0(engineHandle, securityInfo, sidOwner, sidGroup, dacl, sacl, securityDescriptor) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        sidOwnerMarshal := sidOwner is VarRef ? "ptr*" : "ptr"
        sidGroupMarshal := sidGroup is VarRef ? "ptr*" : "ptr"
        daclMarshal := dacl is VarRef ? "ptr*" : "ptr"
        saclMarshal := sacl is VarRef ? "ptr*" : "ptr"

        result := DllCall("fwpuclnt.dll\FwpmEngineGetSecurityInfo0", "ptr", engineHandle, "uint", securityInfo, sidOwnerMarshal, sidOwner, sidGroupMarshal, sidGroup, daclMarshal, dacl, saclMarshal, sacl, "ptr", securityDescriptor, "uint")
        return result
    }

    /**
     * Sets specified security information in the security descriptor of the filter engine.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Integer} securityInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a></b>
     * 
     * The type of security information to set.
     * @param {Pointer<SID>} sidOwner Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a>*</b>
     * 
     * The owner's security identifier (SID) to be set in the security descriptor.
     * @param {Pointer<SID>} sidGroup Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a>*</b>
     * 
     * The group's SID to be set in the security descriptor.
     * @param {Pointer<ACL>} dacl Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a>*</b>
     * 
     * The discretionary access control list (DACL) to be set in the security descriptor.
     * @param {Pointer<ACL>} sacl Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a>*</b>
     * 
     * The system access control list (SACL) to be set in the security descriptor.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The security descriptor was set successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmenginesetsecurityinfo0
     * @since windows6.0.6000
     */
    static FwpmEngineSetSecurityInfo0(engineHandle, securityInfo, sidOwner, sidGroup, dacl, sacl) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        result := DllCall("fwpuclnt.dll\FwpmEngineSetSecurityInfo0", "ptr", engineHandle, "uint", securityInfo, "ptr", sidOwner, "ptr", sidGroup, "ptr", dacl, "ptr", sacl, "uint")
        return result
    }

    /**
     * Creates a handle used to enumerate a set of session objects.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Pointer<FWPM_SESSION_ENUM_TEMPLATE0>} enumTemplate Type: [FWPM_SESSION_ENUM_TEMPLATE0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_session_enum_template0)*</b>
     * 
     * Template to selectively restrict the enumeration.
     * @param {Pointer<HANDLE>} enumHandle Type: <b>HANDLE*</b>
     * 
     * Handle for filter enumeration.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The enumerator was created successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmsessioncreateenumhandle0
     * @since windows6.0.6000
     */
    static FwpmSessionCreateEnumHandle0(engineHandle, enumTemplate, enumHandle) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        result := DllCall("fwpuclnt.dll\FwpmSessionCreateEnumHandle0", "ptr", engineHandle, "ptr", enumTemplate, "ptr", enumHandle, "uint")
        return result
    }

    /**
     * Returns the next page of results from the session enumerator.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {HANDLE} enumHandle Type: <b>HANDLE</b>
     * 
     * Handle for a session enumeration created by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmsessioncreateenumhandle0">FwpmSessionCreateEnumHandle0</a>.
     * @param {Integer} numEntriesRequested Type: <b>UINT32</b>
     * 
     * The number of session entries requested.
     * @param {Pointer<Pointer<Pointer<FWPM_SESSION0>>>} entries Type: [FWPM_SESSION0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_session0)***</b>
     * 
     * Addresses of the enumeration entries.
     * @param {Pointer<Integer>} numEntriesReturned Type: <b>UINT32*</b>
     * 
     * The number of session objects returned.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The sessions were enumerated successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmsessionenum0
     * @since windows6.0.6000
     */
    static FwpmSessionEnum0(engineHandle, enumHandle, numEntriesRequested, entries, numEntriesReturned) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle
        enumHandle := enumHandle is Win32Handle ? NumGet(enumHandle, "ptr") : enumHandle

        entriesMarshal := entries is VarRef ? "ptr*" : "ptr"
        numEntriesReturnedMarshal := numEntriesReturned is VarRef ? "uint*" : "ptr"

        result := DllCall("fwpuclnt.dll\FwpmSessionEnum0", "ptr", engineHandle, "ptr", enumHandle, "uint", numEntriesRequested, entriesMarshal, entries, numEntriesReturnedMarshal, numEntriesReturned, "uint")
        return result
    }

    /**
     * Frees a handle returned by FwpmSessionCreateEnumHandle0.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {HANDLE} enumHandle Type: <b>HANDLE</b>
     * 
     * Handle for a session enumeration created by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmsessioncreateenumhandle0">FwpmSessionCreateEnumHandle0</a>.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The enumerator was successfully deleted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmsessiondestroyenumhandle0
     * @since windows6.0.6000
     */
    static FwpmSessionDestroyEnumHandle0(engineHandle, enumHandle) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle
        enumHandle := enumHandle is Win32Handle ? NumGet(enumHandle, "ptr") : enumHandle

        result := DllCall("fwpuclnt.dll\FwpmSessionDestroyEnumHandle0", "ptr", engineHandle, "ptr", enumHandle, "uint")
        return result
    }

    /**
     * Begins an explicit transaction within the current session.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Integer} flags Type: <b>UINT32</b>
     * 
     * Possible values:
     * 
     * <table>
     * <tr>
     * <th>Transaction flag</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Begin read/write transaction.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FWPM_TXN_READ_ONLY"></a><a id="fwpm_txn_read_only"></a><dl>
     * <dt><b>FWPM_TXN_READ_ONLY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Begin read-only transaction.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The transaction was started successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmtransactionbegin0
     * @since windows6.0.6000
     */
    static FwpmTransactionBegin0(engineHandle, flags) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        result := DllCall("fwpuclnt.dll\FwpmTransactionBegin0", "ptr", engineHandle, "uint", flags, "uint")
        return result
    }

    /**
     * Commits the current transaction within the current session.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The transaction was committed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmtransactioncommit0
     * @since windows6.0.6000
     */
    static FwpmTransactionCommit0(engineHandle) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        result := DllCall("fwpuclnt.dll\FwpmTransactionCommit0", "ptr", engineHandle, "uint")
        return result
    }

    /**
     * Causes the current transaction within the current session to abort and rollback.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call  <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The transaction was aborted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmtransactionabort0
     * @since windows6.0.6000
     */
    static FwpmTransactionAbort0(engineHandle) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        result := DllCall("fwpuclnt.dll\FwpmTransactionAbort0", "ptr", engineHandle, "uint")
        return result
    }

    /**
     * Adds a new provider to the system.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call  <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Pointer<FWPM_PROVIDER0>} provider Type: [FWPM_PROVIDER0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_provider0)*</b>
     * 
     * The provider object to be added.
     * @param {PSECURITY_DESCRIPTOR} sd Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">PSECURITY_DESCRIPTOR</a></b>
     * 
     * Security information for the provider object.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provider was successfully added.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmprovideradd0
     * @since windows6.0.6000
     */
    static FwpmProviderAdd0(engineHandle, provider, sd) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle
        sd := sd is Win32Handle ? NumGet(sd, "ptr") : sd

        result := DllCall("fwpuclnt.dll\FwpmProviderAdd0", "ptr", engineHandle, "ptr", provider, "ptr", sd, "uint")
        return result
    }

    /**
     * Removes a provider from the system.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Pointer<Guid>} key Type: <b>const GUID*</b>
     * 
     * Unique identifier of the object being removed from the system. This is the same GUID that was specified when the application called <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmprovideradd0">FwpmProviderAdd0</a>.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provider was successfully deleted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmproviderdeletebykey0
     * @since windows6.0.6000
     */
    static FwpmProviderDeleteByKey0(engineHandle, key) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        result := DllCall("fwpuclnt.dll\FwpmProviderDeleteByKey0", "ptr", engineHandle, "ptr", key, "uint")
        return result
    }

    /**
     * Retrieves a provider.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Pointer<Guid>} key Type: <b>const GUID*</b>
     * 
     * A runtime identifier for the desired object. This is the same GUID that was specified when the application called <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmprovideradd0">FwpmProviderAdd0</a>.
     * @param {Pointer<Pointer<FWPM_PROVIDER0>>} provider Type: [FWPM_PROVIDER0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_provider0)**</b>
     * 
     * The provider information.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provider was retrieved successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmprovidergetbykey0
     * @since windows6.0.6000
     */
    static FwpmProviderGetByKey0(engineHandle, key, provider) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        providerMarshal := provider is VarRef ? "ptr*" : "ptr"

        result := DllCall("fwpuclnt.dll\FwpmProviderGetByKey0", "ptr", engineHandle, "ptr", key, providerMarshal, provider, "uint")
        return result
    }

    /**
     * Creates a handle used to enumerate a set of providers.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Pointer<FWPM_PROVIDER_ENUM_TEMPLATE0>} enumTemplate Type: [FWPM_PROVIDER_ENUM_TEMPLATE0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_provider_enum_template0)*</b>
     * 
     * Template to selectively restrict the enumeration.
     * @param {Pointer<HANDLE>} enumHandle Type: <b>HANDLE*</b>
     * 
     * Handle for provider enumeration.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The enumerator was created successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmprovidercreateenumhandle0
     * @since windows6.0.6000
     */
    static FwpmProviderCreateEnumHandle0(engineHandle, enumTemplate, enumHandle) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        result := DllCall("fwpuclnt.dll\FwpmProviderCreateEnumHandle0", "ptr", engineHandle, "ptr", enumTemplate, "ptr", enumHandle, "uint")
        return result
    }

    /**
     * Returns the next page of results from the provider enumerator.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {HANDLE} enumHandle Type: <b>HANDLE</b>
     * 
     * Handle for a provider  enumeration created by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmprovidercreateenumhandle0">FwpmProviderCreateEnumHandle0</a>.
     * @param {Integer} numEntriesRequested Type: <b>UINT32</b>
     * 
     * The number of provider entries requested.
     * @param {Pointer<Pointer<Pointer<FWPM_PROVIDER0>>>} entries Type: [FWPM_PROVIDER0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_provider0)***</b>
     * 
     * Addresses of the enumeration entries.
     * @param {Pointer<Integer>} numEntriesReturned Type: <b>UINT32*</b>
     * 
     * The number of provider objects returned.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The providers were enumerated successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmproviderenum0
     * @since windows6.0.6000
     */
    static FwpmProviderEnum0(engineHandle, enumHandle, numEntriesRequested, entries, numEntriesReturned) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle
        enumHandle := enumHandle is Win32Handle ? NumGet(enumHandle, "ptr") : enumHandle

        entriesMarshal := entries is VarRef ? "ptr*" : "ptr"
        numEntriesReturnedMarshal := numEntriesReturned is VarRef ? "uint*" : "ptr"

        result := DllCall("fwpuclnt.dll\FwpmProviderEnum0", "ptr", engineHandle, "ptr", enumHandle, "uint", numEntriesRequested, entriesMarshal, entries, numEntriesReturnedMarshal, numEntriesReturned, "uint")
        return result
    }

    /**
     * Frees a handle returned by FwpmProviderCreateEnumHandle0.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {HANDLE} enumHandle Type: <b>HANDLE</b>
     * 
     * Handle of a provider enumeration created by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmprovidercreateenumhandle0">FwpmProviderCreateEnumHandle0</a>.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The enumerator was successfully deleted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmproviderdestroyenumhandle0
     * @since windows6.0.6000
     */
    static FwpmProviderDestroyEnumHandle0(engineHandle, enumHandle) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle
        enumHandle := enumHandle is Win32Handle ? NumGet(enumHandle, "ptr") : enumHandle

        result := DllCall("fwpuclnt.dll\FwpmProviderDestroyEnumHandle0", "ptr", engineHandle, "ptr", enumHandle, "uint")
        return result
    }

    /**
     * Retrieves a copy of the security descriptor for a provider object.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Pointer<Guid>} key Type: <b>const GUID*</b>
     * 
     *  Unique key of the object of interest. This must be the same GUID that was specified when the application called <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmprovideradd0">FwpmProviderAdd0</a> for this object.
     * @param {Integer} securityInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a></b>
     * 
     * The type of security information to retrieve.
     * @param {Pointer<PSID>} sidOwner Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">PSID</a>*</b>
     * 
     * The owner security identifier (SID) in the returned security descriptor.
     * @param {Pointer<PSID>} sidGroup Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">PSID</a>*</b>
     * 
     * The primary group security identifier (SID) in the returned security descriptor.
     * @param {Pointer<Pointer<ACL>>} dacl Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">PACL</a>*</b>
     * 
     * The discretionary access control list (DACL) in the returned security descriptor.
     * @param {Pointer<Pointer<ACL>>} sacl Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">PACL</a>*</b>
     * 
     * The system access control list (SACL) in the returned security descriptor.
     * @param {Pointer<PSECURITY_DESCRIPTOR>} securityDescriptor Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">PSECURITY_DESCRIPTOR</a>*</b>
     * 
     * The returned security descriptor.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The security descriptor was retrieved successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmprovidergetsecurityinfobykey0
     * @since windows6.0.6000
     */
    static FwpmProviderGetSecurityInfoByKey0(engineHandle, key, securityInfo, sidOwner, sidGroup, dacl, sacl, securityDescriptor) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        sidOwnerMarshal := sidOwner is VarRef ? "ptr*" : "ptr"
        sidGroupMarshal := sidGroup is VarRef ? "ptr*" : "ptr"
        daclMarshal := dacl is VarRef ? "ptr*" : "ptr"
        saclMarshal := sacl is VarRef ? "ptr*" : "ptr"

        result := DllCall("fwpuclnt.dll\FwpmProviderGetSecurityInfoByKey0", "ptr", engineHandle, "ptr", key, "uint", securityInfo, sidOwnerMarshal, sidOwner, sidGroupMarshal, sidGroup, daclMarshal, dacl, saclMarshal, sacl, "ptr", securityDescriptor, "uint")
        return result
    }

    /**
     * Sets specified security information in the security descriptor of a provider object.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Pointer<Guid>} key Type: <b>const GUID*</b>
     * 
     *  Unique identifier of the provider. This is the same GUID that was specified when the application called <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmprovideradd0">FwpmProviderAdd0</a> for this object.
     * @param {Integer} securityInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a></b>
     * 
     * The type of security information to set.
     * @param {Pointer<SID>} sidOwner Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a>*</b>
     * 
     * The owner's security identifier (SID) to be set in the security descriptor.
     * @param {Pointer<SID>} sidGroup Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a>*</b>
     * 
     * The group's SID to be set in the security descriptor.
     * @param {Pointer<ACL>} dacl Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a>*</b>
     * 
     * The discretionary access control list (DACL) to be set in the security descriptor.
     * @param {Pointer<ACL>} sacl Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a>*</b>
     * 
     * The system access control list (SACL) to be set in the security descriptor.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The security descriptor was set successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmprovidersetsecurityinfobykey0
     * @since windows6.0.6000
     */
    static FwpmProviderSetSecurityInfoByKey0(engineHandle, key, securityInfo, sidOwner, sidGroup, dacl, sacl) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        result := DllCall("fwpuclnt.dll\FwpmProviderSetSecurityInfoByKey0", "ptr", engineHandle, "ptr", key, "uint", securityInfo, "ptr", sidOwner, "ptr", sidGroup, "ptr", dacl, "ptr", sacl, "uint")
        return result
    }

    /**
     * Is used to request the delivery of notifications regarding changes in a particular provider.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Pointer<FWPM_PROVIDER_SUBSCRIPTION0>} subscription Type: [FWPM_PROVIDER_SUBSCRIPTION0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_provider_subscription0)*</b>
     * 
     * The notifications to be delivered.
     * @param {Pointer<FWPM_PROVIDER_CHANGE_CALLBACK0>} callback Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nc-fwpmu-fwpm_provider_change_callback0">FWPM_PROVIDER_CHANGE_CALLBACK0</a></b>
     * 
     * Function pointer that will be invoked when a notification is ready for delivery.
     * @param {Pointer<Void>} context Type: <b>void*</b>
     * 
     * Optional context pointer. This pointer is passed to the <i>callback</i> function along with details of the change.
     * @param {Pointer<HANDLE>} changeHandle Type: <b>HANDLE*</b>
     * 
     * Handle to the newly created subscription.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The subscription was created successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmprovidersubscribechanges0
     * @since windows6.0.6000
     */
    static FwpmProviderSubscribeChanges0(engineHandle, subscription, callback, context, changeHandle) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        contextMarshal := context is VarRef ? "ptr" : "ptr"

        result := DllCall("fwpuclnt.dll\FwpmProviderSubscribeChanges0", "ptr", engineHandle, "ptr", subscription, "ptr", callback, contextMarshal, context, "ptr", changeHandle, "uint")
        return result
    }

    /**
     * Is used to cancel a provider change subscription and stop receiving change notifications.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {HANDLE} changeHandle Type: <b>HANDLE</b>
     * 
     * Handle of the subscribed change notification. This is the handle returned by the call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmprovidersubscribechanges0">FwpmProviderSubscribeChanges0</a>.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The subscription was deleted successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmproviderunsubscribechanges0
     * @since windows6.0.6000
     */
    static FwpmProviderUnsubscribeChanges0(engineHandle, changeHandle) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle
        changeHandle := changeHandle is Win32Handle ? NumGet(changeHandle, "ptr") : changeHandle

        result := DllCall("fwpuclnt.dll\FwpmProviderUnsubscribeChanges0", "ptr", engineHandle, "ptr", changeHandle, "uint")
        return result
    }

    /**
     * Retrieves an array of all the current provider change notification subscriptions.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Pointer<Pointer<Pointer<FWPM_PROVIDER_SUBSCRIPTION0>>>} entries Type: [FWPM_PROVIDER_SUBSCRIPTION0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_provider_subscription0)***</b>
     * 
     * The current provider change notification subscriptions.
     * @param {Pointer<Integer>} numEntries Type: <b>UINT32*</b>
     * 
     * Pointer to an <b>UINT32</b> variable that will contain the number of entries returned.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The subscriptions were retrieved successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmprovidersubscriptionsget0
     * @since windows6.0.6000
     */
    static FwpmProviderSubscriptionsGet0(engineHandle, entries, numEntries) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        entriesMarshal := entries is VarRef ? "ptr*" : "ptr"
        numEntriesMarshal := numEntries is VarRef ? "uint*" : "ptr"

        result := DllCall("fwpuclnt.dll\FwpmProviderSubscriptionsGet0", "ptr", engineHandle, entriesMarshal, entries, numEntriesMarshal, numEntries, "uint")
        return result
    }

    /**
     * Adds a new provider context to the system.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call  <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Pointer<FWPM_PROVIDER_CONTEXT0>} providerContext Type: [FWPM_PROVIDER_CONTEXT0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_provider_context0)*</b>
     * 
     * The provider context object to be added.
     * @param {PSECURITY_DESCRIPTOR} sd Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">PSECURITY_DESCRIPTOR</a></b>
     * 
     * Security information associated with the provider context object.
     * @param {Pointer<Integer>} id Type: <b>UINT64*</b>
     * 
     * Pointer to a variable that receives a runtime identifier for this provider context.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provider context was successfully added.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
     * <dt>0x32</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The [FWPM_IPSEC_IKE_MM_CONTEXT](/windows/desktop/api/fwpmtypes/ne-fwpmtypes-fwpm_provider_context_type)and     the [IKEEXT_IPV6_CGA](/windows/desktop/api/iketypes/ne-iketypes-ikeext_authentication_method_type) authentication method in the <b>authenticationMethods</b> array, but cryptographically generated address (CGA) is not enabled in
     *       the registry.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmprovidercontextadd0
     * @since windows6.0.6000
     */
    static FwpmProviderContextAdd0(engineHandle, providerContext, sd, id) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle
        sd := sd is Win32Handle ? NumGet(sd, "ptr") : sd

        idMarshal := id is VarRef ? "uint*" : "ptr"

        result := DllCall("fwpuclnt.dll\FwpmProviderContextAdd0", "ptr", engineHandle, "ptr", providerContext, "ptr", sd, idMarshal, id, "uint")
        return result
    }

    /**
     * Adds a new provider context to the system.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call  <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Pointer<FWPM_PROVIDER_CONTEXT1>} providerContext Type: [FWPM_PROVIDER_CONTEXT1](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_provider_context1)*</b>
     * 
     * The provider context object to be added.
     * @param {PSECURITY_DESCRIPTOR} sd Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">PSECURITY_DESCRIPTOR</a></b>
     * 
     * Security information associated with the provider context object.
     * @param {Pointer<Integer>} id Type: <b>UINT64*</b>
     * 
     * Pointer to a variable that receives a runtime identifier for this provider context.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provider context was successfully added.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
     * <dt>0x32</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The [IKEEXT_IPV6_CGA](/windows/desktop/api/iketypes/ne-iketypes-ikeext_authentication_method_type) authentication method in the <b>authenticationMethods</b> array, but cryptographically generated address (CGA) is not enabled in
     *       the registry.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmprovidercontextadd1
     * @since windows6.1
     */
    static FwpmProviderContextAdd1(engineHandle, providerContext, sd, id) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle
        sd := sd is Win32Handle ? NumGet(sd, "ptr") : sd

        idMarshal := id is VarRef ? "uint*" : "ptr"

        result := DllCall("fwpuclnt.dll\FwpmProviderContextAdd1", "ptr", engineHandle, "ptr", providerContext, "ptr", sd, idMarshal, id, "uint")
        return result
    }

    /**
     * Adds a new provider context to the system.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call  <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Pointer<FWPM_PROVIDER_CONTEXT2>} providerContext Type: [FWPM_PROVIDER_CONTEXT2](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_provider_context2)*</b>
     * 
     * The provider context object to be added.
     * @param {PSECURITY_DESCRIPTOR} sd Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">PSECURITY_DESCRIPTOR</a></b>
     * 
     * Security information associated with the provider context object.
     * @param {Pointer<Integer>} id Type: <b>UINT64*</b>
     * 
     * Pointer to a variable that receives a runtime identifier for this provider context.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provider context was successfully added.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
     * <dt>0x32</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The [FWPM_IPSEC_IKE_MM_CONTEXT](/windows/desktop/api/fwpmtypes/ne-fwpmtypes-fwpm_provider_context_type)and     the [IKEEXT_IPV6_CGA](/windows/desktop/api/iketypes/ne-iketypes-ikeext_authentication_method_type) authentication method in the <b>authenticationMethods</b> array, but cryptographically generated address (CGA) is not enabled in
     *       the registry.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmprovidercontextadd2
     * @since windows8.0
     */
    static FwpmProviderContextAdd2(engineHandle, providerContext, sd, id) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle
        sd := sd is Win32Handle ? NumGet(sd, "ptr") : sd

        idMarshal := id is VarRef ? "uint*" : "ptr"

        result := DllCall("fwpuclnt.dll\FwpmProviderContextAdd2", "ptr", engineHandle, "ptr", providerContext, "ptr", sd, idMarshal, id, "uint")
        return result
    }

    /**
     * 
     * @param {HANDLE} engineHandle 
     * @param {Pointer<FWPM_PROVIDER_CONTEXT3>} providerContext 
     * @param {PSECURITY_DESCRIPTOR} sd 
     * @param {Pointer<Integer>} id 
     * @returns {Integer} 
     */
    static FwpmProviderContextAdd3(engineHandle, providerContext, sd, id) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle
        sd := sd is Win32Handle ? NumGet(sd, "ptr") : sd

        idMarshal := id is VarRef ? "uint*" : "ptr"

        result := DllCall("fwpuclnt.dll\FwpmProviderContextAdd3", "ptr", engineHandle, "ptr", providerContext, "ptr", sd, idMarshal, id, "uint")
        return result
    }

    /**
     * Removes a provider context from the system .
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Integer} id Type: <b>UINT64</b>
     * 
     * A runtime identifier for the object  being removed from the system. This is the runtime identifier that was received from the system when the application called <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmprovidercontextadd0">FwpmProviderContextAdd0</a> for this object.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provider context was successfully deleted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmprovidercontextdeletebyid0
     * @since windows6.0.6000
     */
    static FwpmProviderContextDeleteById0(engineHandle, id) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        result := DllCall("fwpuclnt.dll\FwpmProviderContextDeleteById0", "ptr", engineHandle, "uint", id, "uint")
        return result
    }

    /**
     * Removes a provider context from the system.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Pointer<Guid>} key Type: <b>const GUID*</b>
     * 
     * Unique identifier of the object being removed from the system. This is a pointer to the same GUID that was specified when the application called <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmprovidercontextadd0">FwpmProviderContextAdd0</a> for this object.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provider context was successfully deleted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmprovidercontextdeletebykey0
     * @since windows6.0.6000
     */
    static FwpmProviderContextDeleteByKey0(engineHandle, key) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        result := DllCall("fwpuclnt.dll\FwpmProviderContextDeleteByKey0", "ptr", engineHandle, "ptr", key, "uint")
        return result
    }

    /**
     * Retrieves a provider context.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Integer} id Type: <b>UINT64</b>
     * 
     * A run-time identifier for the desired object. This must be the run-time identifier that was received from the system when the application called <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmprovidercontextadd0">FwpmProviderContextAdd0</a> for this object.
     * @param {Pointer<Pointer<FWPM_PROVIDER_CONTEXT0>>} providerContext Type: [FWPM_PROVIDER_CONTEXT0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_provider_context0)**</b>
     * 
     * The provider context information.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provider context was retrieved successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmprovidercontextgetbyid0
     * @since windows6.0.6000
     */
    static FwpmProviderContextGetById0(engineHandle, id, providerContext) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        providerContextMarshal := providerContext is VarRef ? "ptr*" : "ptr"

        result := DllCall("fwpuclnt.dll\FwpmProviderContextGetById0", "ptr", engineHandle, "uint", id, providerContextMarshal, providerContext, "uint")
        return result
    }

    /**
     * Retrieves a provider context.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Integer} id Type: <b>UINT64</b>
     * 
     * A run-time identifier for the desired object. This must be the run-time identifier that was received from the system when the application called <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmprovidercontextadd1">FwpmProviderContextAdd1</a> for this object.
     * @param {Pointer<Pointer<FWPM_PROVIDER_CONTEXT1>>} providerContext Type: [FWPM_PROVIDER_CONTEXT1](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_provider_context1)**</b>
     * 
     * The provider context information.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provider context was retrieved successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmprovidercontextgetbyid1
     * @since windows6.1
     */
    static FwpmProviderContextGetById1(engineHandle, id, providerContext) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        providerContextMarshal := providerContext is VarRef ? "ptr*" : "ptr"

        result := DllCall("fwpuclnt.dll\FwpmProviderContextGetById1", "ptr", engineHandle, "uint", id, providerContextMarshal, providerContext, "uint")
        return result
    }

    /**
     * Retrieves a provider context.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Integer} id Type: <b>UINT64</b>
     * 
     * A run-time identifier for the desired object. This must be the run-time identifier that was received from the system when the application called <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmprovidercontextadd2">FwpmProviderContextAdd2</a> for this object.
     * @param {Pointer<Pointer<FWPM_PROVIDER_CONTEXT2>>} providerContext Type: [FWPM_PROVIDER_CONTEXT2](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_provider_context2)**</b>
     * 
     * The provider context information.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provider context was retrieved successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmprovidercontextgetbyid2
     * @since windows8.0
     */
    static FwpmProviderContextGetById2(engineHandle, id, providerContext) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        providerContextMarshal := providerContext is VarRef ? "ptr*" : "ptr"

        result := DllCall("fwpuclnt.dll\FwpmProviderContextGetById2", "ptr", engineHandle, "uint", id, providerContextMarshal, providerContext, "uint")
        return result
    }

    /**
     * 
     * @param {HANDLE} engineHandle 
     * @param {Integer} id 
     * @param {Pointer<Pointer<FWPM_PROVIDER_CONTEXT3>>} providerContext 
     * @returns {Integer} 
     */
    static FwpmProviderContextGetById3(engineHandle, id, providerContext) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        providerContextMarshal := providerContext is VarRef ? "ptr*" : "ptr"

        result := DllCall("fwpuclnt.dll\FwpmProviderContextGetById3", "ptr", engineHandle, "uint", id, providerContextMarshal, providerContext, "uint")
        return result
    }

    /**
     * Retrieves a provider context.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Pointer<Guid>} key Type: <b>const GUID*</b>
     * 
     * Pointer to a GUID that uniquely identifies the provider context. This is a pointer to the same GUID that was specified when the application called <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmprovidercontextadd0">FwpmProviderContextAdd0</a> for this object.
     * @param {Pointer<Pointer<FWPM_PROVIDER_CONTEXT0>>} providerContext Type: [FWPM_PROVIDER_CONTEXT0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_provider_context0)**</b>
     * 
     * The provider context information.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provider context was retrieved successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmprovidercontextgetbykey0
     * @since windows6.0.6000
     */
    static FwpmProviderContextGetByKey0(engineHandle, key, providerContext) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        providerContextMarshal := providerContext is VarRef ? "ptr*" : "ptr"

        result := DllCall("fwpuclnt.dll\FwpmProviderContextGetByKey0", "ptr", engineHandle, "ptr", key, providerContextMarshal, providerContext, "uint")
        return result
    }

    /**
     * Retrieves a provider context.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Pointer<Guid>} key Type: <b>const GUID*</b>
     * 
     * Pointer to a GUID that uniquely identifies the provider context. This is a pointer to the same GUID that was specified when the application called <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmprovidercontextadd1">FwpmProviderContextAdd1</a> for this object.
     * @param {Pointer<Pointer<FWPM_PROVIDER_CONTEXT1>>} providerContext Type: [FWPM_PROVIDER_CONTEXT1](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_provider_context1)**</b>
     * 
     * The provider context information.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provider context was retrieved successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmprovidercontextgetbykey1
     * @since windows6.1
     */
    static FwpmProviderContextGetByKey1(engineHandle, key, providerContext) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        providerContextMarshal := providerContext is VarRef ? "ptr*" : "ptr"

        result := DllCall("fwpuclnt.dll\FwpmProviderContextGetByKey1", "ptr", engineHandle, "ptr", key, providerContextMarshal, providerContext, "uint")
        return result
    }

    /**
     * Retrieves a provider context.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Pointer<Guid>} key Type: <b>const GUID*</b>
     * 
     * Pointer to a GUID that uniquely identifies the provider context. This is a pointer to the same GUID that was specified when the application called <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmprovidercontextadd2">FwpmProviderContextAdd2</a> for this object.
     * @param {Pointer<Pointer<FWPM_PROVIDER_CONTEXT2>>} providerContext Type: [FWPM_PROVIDER_CONTEXT2](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_provider_context2)**</b>
     * 
     * The provider context information.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provider context was retrieved successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmprovidercontextgetbykey2
     * @since windows8.0
     */
    static FwpmProviderContextGetByKey2(engineHandle, key, providerContext) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        providerContextMarshal := providerContext is VarRef ? "ptr*" : "ptr"

        result := DllCall("fwpuclnt.dll\FwpmProviderContextGetByKey2", "ptr", engineHandle, "ptr", key, providerContextMarshal, providerContext, "uint")
        return result
    }

    /**
     * 
     * @param {HANDLE} engineHandle 
     * @param {Pointer<Guid>} key 
     * @param {Pointer<Pointer<FWPM_PROVIDER_CONTEXT3>>} providerContext 
     * @returns {Integer} 
     */
    static FwpmProviderContextGetByKey3(engineHandle, key, providerContext) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        providerContextMarshal := providerContext is VarRef ? "ptr*" : "ptr"

        result := DllCall("fwpuclnt.dll\FwpmProviderContextGetByKey3", "ptr", engineHandle, "ptr", key, providerContextMarshal, providerContext, "uint")
        return result
    }

    /**
     * Creates a handle used to enumerate a set of provider contexts.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Pointer<FWPM_PROVIDER_CONTEXT_ENUM_TEMPLATE0>} enumTemplate Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_provider_context_enum_template0">FWPM_PROVIDER_CONTEXT_ENUM_TEMPLATE0</a>*</b>
     * 
     * Template to selectively restrict the enumeration.
     * @param {Pointer<HANDLE>} enumHandle Type: <b>HANDLE*</b>
     * 
     * Handle for provider context enumeration.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The enumerator was created successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmprovidercontextcreateenumhandle0
     * @since windows6.0.6000
     */
    static FwpmProviderContextCreateEnumHandle0(engineHandle, enumTemplate, enumHandle) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        result := DllCall("fwpuclnt.dll\FwpmProviderContextCreateEnumHandle0", "ptr", engineHandle, "ptr", enumTemplate, "ptr", enumHandle, "uint")
        return result
    }

    /**
     * Returns the next page of results from the provider context enumerator.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {HANDLE} enumHandle Type: <b>HANDLE</b>
     * 
     * Handle for a provider context enumeration created by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmprovidercontextcreateenumhandle0">FwpmProviderContextCreateEnumHandle0</a>.
     * @param {Integer} numEntriesRequested Type: <b>UINT32</b>
     * 
     * The number of provider context objects requested.
     * @param {Pointer<Pointer<Pointer<FWPM_PROVIDER_CONTEXT0>>>} entries Type: [FWPM_PROVIDER_CONTEXT0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_provider_context0)***</b>
     * 
     * The returned provider context objects.
     * @param {Pointer<Integer>} numEntriesReturned Type: <b>UINT32*</b>
     * 
     * The number of provider context objects returned.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provider contexts were enumerated successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmprovidercontextenum0
     * @since windows6.0.6000
     */
    static FwpmProviderContextEnum0(engineHandle, enumHandle, numEntriesRequested, entries, numEntriesReturned) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle
        enumHandle := enumHandle is Win32Handle ? NumGet(enumHandle, "ptr") : enumHandle

        entriesMarshal := entries is VarRef ? "ptr*" : "ptr"
        numEntriesReturnedMarshal := numEntriesReturned is VarRef ? "uint*" : "ptr"

        result := DllCall("fwpuclnt.dll\FwpmProviderContextEnum0", "ptr", engineHandle, "ptr", enumHandle, "uint", numEntriesRequested, entriesMarshal, entries, numEntriesReturnedMarshal, numEntriesReturned, "uint")
        return result
    }

    /**
     * Returns the next page of results from the provider context enumerator.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {HANDLE} enumHandle Type: <b>HANDLE</b>
     * 
     * Handle for a provider context enumeration created by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmprovidercontextcreateenumhandle0">FwpmProviderContextCreateEnumHandle0</a>.
     * @param {Integer} numEntriesRequested Type: <b>UINT32</b>
     * 
     * The number of provider context objects requested.
     * @param {Pointer<Pointer<Pointer<FWPM_PROVIDER_CONTEXT1>>>} entries Type: [FWPM_PROVIDER_CONTEXT1](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_provider_context1)***</b>
     * 
     * The returned provider context objects.
     * @param {Pointer<Integer>} numEntriesReturned Type: <b>UINT32*</b>
     * 
     * The number of provider context objects returned.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provider contexts were enumerated successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmprovidercontextenum1
     * @since windows6.1
     */
    static FwpmProviderContextEnum1(engineHandle, enumHandle, numEntriesRequested, entries, numEntriesReturned) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle
        enumHandle := enumHandle is Win32Handle ? NumGet(enumHandle, "ptr") : enumHandle

        entriesMarshal := entries is VarRef ? "ptr*" : "ptr"
        numEntriesReturnedMarshal := numEntriesReturned is VarRef ? "uint*" : "ptr"

        result := DllCall("fwpuclnt.dll\FwpmProviderContextEnum1", "ptr", engineHandle, "ptr", enumHandle, "uint", numEntriesRequested, entriesMarshal, entries, numEntriesReturnedMarshal, numEntriesReturned, "uint")
        return result
    }

    /**
     * Returns the next page of results from the provider context enumerator.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {HANDLE} enumHandle Type: <b>HANDLE</b>
     * 
     * Handle for a provider context enumeration created by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmprovidercontextcreateenumhandle0">FwpmProviderContextCreateEnumHandle0</a>.
     * @param {Integer} numEntriesRequested Type: <b>UINT32</b>
     * 
     * Number of provider context objects requested.
     * @param {Pointer<Pointer<Pointer<FWPM_PROVIDER_CONTEXT2>>>} entries Type: [FWPM_PROVIDER_CONTEXT2](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_provider_context2)***</b>
     * 
     * The returned provider context objects.
     * @param {Pointer<Integer>} numEntriesReturned Type: <b>UINT32*</b>
     * 
     * The number of provider context objects returned.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provider contexts were enumerated successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmprovidercontextenum2
     * @since windows8.0
     */
    static FwpmProviderContextEnum2(engineHandle, enumHandle, numEntriesRequested, entries, numEntriesReturned) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle
        enumHandle := enumHandle is Win32Handle ? NumGet(enumHandle, "ptr") : enumHandle

        entriesMarshal := entries is VarRef ? "ptr*" : "ptr"
        numEntriesReturnedMarshal := numEntriesReturned is VarRef ? "uint*" : "ptr"

        result := DllCall("fwpuclnt.dll\FwpmProviderContextEnum2", "ptr", engineHandle, "ptr", enumHandle, "uint", numEntriesRequested, entriesMarshal, entries, numEntriesReturnedMarshal, numEntriesReturned, "uint")
        return result
    }

    /**
     * 
     * @param {HANDLE} engineHandle 
     * @param {HANDLE} enumHandle 
     * @param {Integer} numEntriesRequested 
     * @param {Pointer<Pointer<Pointer<FWPM_PROVIDER_CONTEXT3>>>} entries 
     * @param {Pointer<Integer>} numEntriesReturned 
     * @returns {Integer} 
     */
    static FwpmProviderContextEnum3(engineHandle, enumHandle, numEntriesRequested, entries, numEntriesReturned) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle
        enumHandle := enumHandle is Win32Handle ? NumGet(enumHandle, "ptr") : enumHandle

        entriesMarshal := entries is VarRef ? "ptr*" : "ptr"
        numEntriesReturnedMarshal := numEntriesReturned is VarRef ? "uint*" : "ptr"

        result := DllCall("fwpuclnt.dll\FwpmProviderContextEnum3", "ptr", engineHandle, "ptr", enumHandle, "uint", numEntriesRequested, entriesMarshal, entries, numEntriesReturnedMarshal, numEntriesReturned, "uint")
        return result
    }

    /**
     * Frees a handle returned by FwpmProviderContextCreateEnumHandle0.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {HANDLE} enumHandle Type: <b>HANDLE</b>
     * 
     * Handle of a provider context enumeration created by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmprovidercontextcreateenumhandle0">FwpmProviderContextCreateEnumHandle0</a>.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The enumerator was successfully deleted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmprovidercontextdestroyenumhandle0
     * @since windows6.0.6000
     */
    static FwpmProviderContextDestroyEnumHandle0(engineHandle, enumHandle) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle
        enumHandle := enumHandle is Win32Handle ? NumGet(enumHandle, "ptr") : enumHandle

        result := DllCall("fwpuclnt.dll\FwpmProviderContextDestroyEnumHandle0", "ptr", engineHandle, "ptr", enumHandle, "uint")
        return result
    }

    /**
     * Retrieves a copy of the security descriptor for a provider context object.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Pointer<Guid>} key Type: <b>const GUID*</b>
     * 
     * Unique identifier of the provider context. This is a pointer to the same GUID that was specified when the application called <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmprovidercontextadd0">FwpmProviderContextAdd0</a> for this object.
     * @param {Integer} securityInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a></b>
     * 
     * The type of security information to retrieve.
     * @param {Pointer<PSID>} sidOwner Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">PSID</a>*</b>
     * 
     * The owner security identifier (SID) in the returned security descriptor.
     * @param {Pointer<PSID>} sidGroup Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">PSID</a>*</b>
     * 
     * The primary group security identifier (SID) in the returned security descriptor.
     * @param {Pointer<Pointer<ACL>>} dacl Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">PACL</a>*</b>
     * 
     * The discretionary access control list (DACL) in the returned security descriptor.
     * @param {Pointer<Pointer<ACL>>} sacl Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">PACL</a>*</b>
     * 
     * The system access control list (SACL) in the returned security descriptor.
     * @param {Pointer<PSECURITY_DESCRIPTOR>} securityDescriptor Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">PSECURITY_DESCRIPTOR</a>*</b>
     * 
     * The returned security descriptor.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The security descriptor was retrieved successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmprovidercontextgetsecurityinfobykey0
     * @since windows6.0.6000
     */
    static FwpmProviderContextGetSecurityInfoByKey0(engineHandle, key, securityInfo, sidOwner, sidGroup, dacl, sacl, securityDescriptor) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        sidOwnerMarshal := sidOwner is VarRef ? "ptr*" : "ptr"
        sidGroupMarshal := sidGroup is VarRef ? "ptr*" : "ptr"
        daclMarshal := dacl is VarRef ? "ptr*" : "ptr"
        saclMarshal := sacl is VarRef ? "ptr*" : "ptr"

        result := DllCall("fwpuclnt.dll\FwpmProviderContextGetSecurityInfoByKey0", "ptr", engineHandle, "ptr", key, "uint", securityInfo, sidOwnerMarshal, sidOwner, sidGroupMarshal, sidGroup, daclMarshal, dacl, saclMarshal, sacl, "ptr", securityDescriptor, "uint")
        return result
    }

    /**
     * Sets specified security information in the security descriptor of a provider context object.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Pointer<Guid>} key Type: <b>const GUID*</b>
     * 
     * Unique identifier of the provider context object. This is a pointer to the same GUID that was specified when the application called <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmprovidercontextadd0">FwpmProviderContextAdd0</a> for this object.
     * @param {Integer} securityInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a></b>
     * 
     * The type of security information to set.
     * @param {Pointer<SID>} sidOwner Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a>*</b>
     * 
     * The owner's security identifier (SID) to be set in the security descriptor.
     * @param {Pointer<SID>} sidGroup Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a>*</b>
     * 
     * The group's SID to be set in the security descriptor.
     * @param {Pointer<ACL>} dacl Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a>*</b>
     * 
     * The discretionary access control list (DACL) to be set in the security descriptor.
     * @param {Pointer<ACL>} sacl Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a>*</b>
     * 
     * The system access control list (SACL) to be set in the security descriptor.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The security descriptor was set successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmprovidercontextsetsecurityinfobykey0
     * @since windows6.0.6000
     */
    static FwpmProviderContextSetSecurityInfoByKey0(engineHandle, key, securityInfo, sidOwner, sidGroup, dacl, sacl) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        result := DllCall("fwpuclnt.dll\FwpmProviderContextSetSecurityInfoByKey0", "ptr", engineHandle, "ptr", key, "uint", securityInfo, "ptr", sidOwner, "ptr", sidGroup, "ptr", dacl, "ptr", sacl, "uint")
        return result
    }

    /**
     * Is used to request the delivery of notifications regarding changes in a particular provider context.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Pointer<FWPM_PROVIDER_CONTEXT_SUBSCRIPTION0>} subscription Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_provider_context_subscription0">FWPM_PROVIDER_CONTEXT_SUBSCRIPTION0</a>*</b>
     * 
     * The notifications to be delivered.
     * @param {Pointer<FWPM_PROVIDER_CONTEXT_CHANGE_CALLBACK0>} callback Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nc-fwpmu-fwpm_provider_context_change_callback0">FWPM_PROVIDER_CONTEXT_CHANGE_CALLBACK0</a></b>
     * 
     * Function pointer that will be invoked when a notification is ready for delivery.
     * @param {Pointer<Void>} context Type: <b>void*</b>
     * 
     * Optional context pointer. This pointer is passed to the <i>callback</i> function along with details of the change.
     * @param {Pointer<HANDLE>} changeHandle Type: <b>HANDLE*</b>
     * 
     * Handle to the newly created subscription.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The subscription was created successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmprovidercontextsubscribechanges0
     * @since windows6.0.6000
     */
    static FwpmProviderContextSubscribeChanges0(engineHandle, subscription, callback, context, changeHandle) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        contextMarshal := context is VarRef ? "ptr" : "ptr"

        result := DllCall("fwpuclnt.dll\FwpmProviderContextSubscribeChanges0", "ptr", engineHandle, "ptr", subscription, "ptr", callback, contextMarshal, context, "ptr", changeHandle, "uint")
        return result
    }

    /**
     * Is used to cancel a provider context change subscription and stop receiving change notifications.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {HANDLE} changeHandle Type: <b>HANDLE</b>
     * 
     * Handle of the subscribed change notification. This is the handle returned by <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmprovidercontextsubscribechanges0">FwpmProviderContextSubscribeChanges0</a>.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The subscription was deleted successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmprovidercontextunsubscribechanges0
     * @since windows6.0.6000
     */
    static FwpmProviderContextUnsubscribeChanges0(engineHandle, changeHandle) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle
        changeHandle := changeHandle is Win32Handle ? NumGet(changeHandle, "ptr") : changeHandle

        result := DllCall("fwpuclnt.dll\FwpmProviderContextUnsubscribeChanges0", "ptr", engineHandle, "ptr", changeHandle, "uint")
        return result
    }

    /**
     * Retrieves an array of all the current provider context change notification subscriptions.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Pointer<Pointer<Pointer<FWPM_PROVIDER_CONTEXT_SUBSCRIPTION0>>>} entries Type: <b><a href="https://docs.microsoft.com/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_provider_context_subscription0">FWPM_PROVIDER_CONTEXT_SUBSCRIPTION0</a>***</b>
     * 
     * The current provider context change notification subscriptions.
     * @param {Pointer<Integer>} numEntries Type: <b>UINT32*</b>
     * 
     * The number of entries returned.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The subscriptions were retrieved successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmprovidercontextsubscriptionsget0
     * @since windows6.0.6000
     */
    static FwpmProviderContextSubscriptionsGet0(engineHandle, entries, numEntries) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        entriesMarshal := entries is VarRef ? "ptr*" : "ptr"
        numEntriesMarshal := numEntries is VarRef ? "uint*" : "ptr"

        result := DllCall("fwpuclnt.dll\FwpmProviderContextSubscriptionsGet0", "ptr", engineHandle, entriesMarshal, entries, numEntriesMarshal, numEntries, "uint")
        return result
    }

    /**
     * Adds a new sublayer to the system.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call  <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Pointer<FWPM_SUBLAYER0>} subLayer Type: [FWPM_SUBLAYER0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_sublayer0)*</b>
     * 
     * The sublayer to be added.
     * @param {PSECURITY_DESCRIPTOR} sd Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">PSECURITY_DESCRIPTOR</a></b>
     * 
     * Security information for the sublayer object.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The sublayer was successfully added.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmsublayeradd0
     * @since windows6.0.6000
     */
    static FwpmSubLayerAdd0(engineHandle, subLayer, sd) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle
        sd := sd is Win32Handle ? NumGet(sd, "ptr") : sd

        result := DllCall("fwpuclnt.dll\FwpmSubLayerAdd0", "ptr", engineHandle, "ptr", subLayer, "ptr", sd, "uint")
        return result
    }

    /**
     * Deletes a sublayer from the system by its key.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Pointer<Guid>} key Type: <b>const GUID*</b>
     * 
     * Unique identifier of the sublayer to be removed from the system. This is the same GUID that was specified when the application called  <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmsublayeradd0">FwpmSubLayerAdd0</a>.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The sublayer was successfully deleted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmsublayerdeletebykey0
     * @since windows6.0.6000
     */
    static FwpmSubLayerDeleteByKey0(engineHandle, key) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        result := DllCall("fwpuclnt.dll\FwpmSubLayerDeleteByKey0", "ptr", engineHandle, "ptr", key, "uint")
        return result
    }

    /**
     * Retrieves a sublayer by its key.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Pointer<Guid>} key Type: <b>const GUID*</b>
     * 
     * Unique identifier of  the sublayer. This is the same GUID that was specified when the application called <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmsublayeradd0">FwpmSubLayerAdd0</a>.
     * @param {Pointer<Pointer<FWPM_SUBLAYER0>>} subLayer Type: [FWPM_SUBLAYER0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_sublayer0)**</b>
     * 
     * The sublayer information.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The sublayer was retrieved successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmsublayergetbykey0
     * @since windows6.0.6000
     */
    static FwpmSubLayerGetByKey0(engineHandle, key, subLayer) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        subLayerMarshal := subLayer is VarRef ? "ptr*" : "ptr"

        result := DllCall("fwpuclnt.dll\FwpmSubLayerGetByKey0", "ptr", engineHandle, "ptr", key, subLayerMarshal, subLayer, "uint")
        return result
    }

    /**
     * Creates a handle used to enumerate a set of sublayers.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Pointer<FWPM_SUBLAYER_ENUM_TEMPLATE0>} enumTemplate Type: [FWPM_SUBLAYER_ENUM_TEMPLATE0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_sublayer_enum_template0)*</b>
     * 
     * Template to selectively restrict the enumeration.
     * @param {Pointer<HANDLE>} enumHandle Type: <b>HANDLE*</b>
     * 
     * Handle for sublayer enumeration.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The enumerator was created successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmsublayercreateenumhandle0
     * @since windows6.0.6000
     */
    static FwpmSubLayerCreateEnumHandle0(engineHandle, enumTemplate, enumHandle) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        result := DllCall("fwpuclnt.dll\FwpmSubLayerCreateEnumHandle0", "ptr", engineHandle, "ptr", enumTemplate, "ptr", enumHandle, "uint")
        return result
    }

    /**
     * Returns the next page of results from the sublayer enumerator.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {HANDLE} enumHandle Type: <b>HANDLE</b>
     * 
     * Handle for a sublayer enumeration created by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmsublayercreateenumhandle0">FwpmSubLayerCreateEnumHandle0</a>.
     * @param {Integer} numEntriesRequested Type: <b>UINT32</b>
     * 
     * The number of sublayer entries requested.
     * @param {Pointer<Pointer<Pointer<FWPM_SUBLAYER0>>>} entries Type: [FWPM_SUBLAYER0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_sublayer0)***</b>
     * 
     * Addresses of the enumeration entries.
     * @param {Pointer<Integer>} numEntriesReturned Type: <b>UINT32*</b>
     * 
     * The number of sublayer objects returned.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The sublayers were enumerated successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmsublayerenum0
     * @since windows6.0.6000
     */
    static FwpmSubLayerEnum0(engineHandle, enumHandle, numEntriesRequested, entries, numEntriesReturned) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle
        enumHandle := enumHandle is Win32Handle ? NumGet(enumHandle, "ptr") : enumHandle

        entriesMarshal := entries is VarRef ? "ptr*" : "ptr"
        numEntriesReturnedMarshal := numEntriesReturned is VarRef ? "uint*" : "ptr"

        result := DllCall("fwpuclnt.dll\FwpmSubLayerEnum0", "ptr", engineHandle, "ptr", enumHandle, "uint", numEntriesRequested, entriesMarshal, entries, numEntriesReturnedMarshal, numEntriesReturned, "uint")
        return result
    }

    /**
     * Frees a handle returned by FwpmSubLayerCreateEnumHandle0.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {HANDLE} enumHandle Type: <b>HANDLE</b>
     * 
     * Handle of a sublayer enumeration created by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmsublayercreateenumhandle0">FwpmSubLayerCreateEnumHandle0</a>.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The enumerator was successfully deleted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmsublayerdestroyenumhandle0
     * @since windows6.0.6000
     */
    static FwpmSubLayerDestroyEnumHandle0(engineHandle, enumHandle) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle
        enumHandle := enumHandle is Win32Handle ? NumGet(enumHandle, "ptr") : enumHandle

        result := DllCall("fwpuclnt.dll\FwpmSubLayerDestroyEnumHandle0", "ptr", engineHandle, "ptr", enumHandle, "uint")
        return result
    }

    /**
     * Retrieves a copy of the security descriptor for a sublayer.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Pointer<Guid>} key Type: <b>const GUID*</b>
     * 
     * Unique identifier of the sublayer. This must be the same GUID that was specified when the application called <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmsublayeradd0">FwpmSubLayerAdd0</a>.
     * @param {Integer} securityInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a></b>
     * 
     * The type of security information to retrieve.
     * @param {Pointer<PSID>} sidOwner Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">PSID</a>*</b>
     * 
     * The owner security identifier (SID) in the returned security descriptor.
     * @param {Pointer<PSID>} sidGroup Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">PSID</a>*</b>
     * 
     * The primary group security identifier (SID) in the returned security descriptor.
     * @param {Pointer<Pointer<ACL>>} dacl Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">PACL</a>*</b>
     * 
     * The discretionary access control list (DACL) in the returned security descriptor.
     * @param {Pointer<Pointer<ACL>>} sacl Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">PACL</a>*</b>
     * 
     * The system access control list (SACL) in the returned security descriptor.
     * @param {Pointer<PSECURITY_DESCRIPTOR>} securityDescriptor Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">PSECURITY_DESCRIPTOR</a>*</b>
     * 
     * The returned security descriptor.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The security descriptor was retrieved successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmsublayergetsecurityinfobykey0
     * @since windows6.0.6000
     */
    static FwpmSubLayerGetSecurityInfoByKey0(engineHandle, key, securityInfo, sidOwner, sidGroup, dacl, sacl, securityDescriptor) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        sidOwnerMarshal := sidOwner is VarRef ? "ptr*" : "ptr"
        sidGroupMarshal := sidGroup is VarRef ? "ptr*" : "ptr"
        daclMarshal := dacl is VarRef ? "ptr*" : "ptr"
        saclMarshal := sacl is VarRef ? "ptr*" : "ptr"

        result := DllCall("fwpuclnt.dll\FwpmSubLayerGetSecurityInfoByKey0", "ptr", engineHandle, "ptr", key, "uint", securityInfo, sidOwnerMarshal, sidOwner, sidGroupMarshal, sidGroup, daclMarshal, dacl, saclMarshal, sacl, "ptr", securityDescriptor, "uint")
        return result
    }

    /**
     * Sets specified security information in the security descriptor of a sublayer.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Pointer<Guid>} key Type: <b>const GUID*</b>
     * 
     * Unique identifier of the sublayer. This must be the same GUID that was specified when the application called <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmsublayeradd0">FwpmSubLayerAdd0</a>.
     * @param {Integer} securityInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a></b>
     * 
     * The type of security information to set.
     * @param {Pointer<SID>} sidOwner Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a>*</b>
     * 
     * The owner's security identifier (SID) to be set in the security descriptor.
     * @param {Pointer<SID>} sidGroup Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a>*</b>
     * 
     * The group's SID to be set in the security descriptor.
     * @param {Pointer<ACL>} dacl Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a>*</b>
     * 
     * The discretionary access control list (DACL) to be set in the security descriptor.
     * @param {Pointer<ACL>} sacl Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a>*</b>
     * 
     * The system access control list (SACL) to be set in the security descriptor.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The security descriptor was set successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmsublayersetsecurityinfobykey0
     * @since windows6.0.6000
     */
    static FwpmSubLayerSetSecurityInfoByKey0(engineHandle, key, securityInfo, sidOwner, sidGroup, dacl, sacl) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        result := DllCall("fwpuclnt.dll\FwpmSubLayerSetSecurityInfoByKey0", "ptr", engineHandle, "ptr", key, "uint", securityInfo, "ptr", sidOwner, "ptr", sidGroup, "ptr", dacl, "ptr", sacl, "uint")
        return result
    }

    /**
     * Is used to request the delivery of notifications regarding changes in a particular sublayer.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Pointer<FWPM_SUBLAYER_SUBSCRIPTION0>} subscription Type: [FWPM_SUBLAYER_SUBSCRIPTION0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_sublayer_subscription0)*</b>
     * 
     * The notifications to be delivered.
     * @param {Pointer<FWPM_SUBLAYER_CHANGE_CALLBACK0>} callback Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nc-fwpmu-fwpm_sublayer_change_callback0">FWPM_SUBLAYER_CHANGE_CALLBACK0</a></b>
     * 
     * Function pointer that will be invoked when a notification is ready for delivery.
     * @param {Pointer<Void>} context Type: <b>void*</b>
     * 
     * Optional context pointer. This pointer is passed to the <i>callback</i> function along with details of the change.
     * @param {Pointer<HANDLE>} changeHandle Type: <b>HANDLE*</b>
     * 
     * Handle to the newly created subscription.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The subscription was created successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmsublayersubscribechanges0
     * @since windows6.0.6000
     */
    static FwpmSubLayerSubscribeChanges0(engineHandle, subscription, callback, context, changeHandle) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        contextMarshal := context is VarRef ? "ptr" : "ptr"

        result := DllCall("fwpuclnt.dll\FwpmSubLayerSubscribeChanges0", "ptr", engineHandle, "ptr", subscription, "ptr", callback, contextMarshal, context, "ptr", changeHandle, "uint")
        return result
    }

    /**
     * Is used to cancel a sublayer change subscription and stop receiving change notifications.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {HANDLE} changeHandle Type: <b>HANDLE</b>
     * 
     * Handle of the subscribed change notification. This is the returned handle from the call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmsublayersubscribechanges0">FwpmSubLayerSubscribeChanges0</a>.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The subscription was deleted successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmsublayerunsubscribechanges0
     * @since windows6.0.6000
     */
    static FwpmSubLayerUnsubscribeChanges0(engineHandle, changeHandle) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle
        changeHandle := changeHandle is Win32Handle ? NumGet(changeHandle, "ptr") : changeHandle

        result := DllCall("fwpuclnt.dll\FwpmSubLayerUnsubscribeChanges0", "ptr", engineHandle, "ptr", changeHandle, "uint")
        return result
    }

    /**
     * Retrieves an array of all the current sub-layer change notification subscriptions.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Pointer<Pointer<Pointer<FWPM_SUBLAYER_SUBSCRIPTION0>>>} entries Type: [FWPM_SUBLAYER_SUBSCRIPTION0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_sublayer_subscription0)***</b>
     * 
     * The current sublayer change notification subscriptions.
     * @param {Pointer<Integer>} numEntries Type: <b>UINT32*</b>
     * 
     * The number of entries returned.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The subscriptions were retrieved successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmsublayersubscriptionsget0
     * @since windows6.0.6000
     */
    static FwpmSubLayerSubscriptionsGet0(engineHandle, entries, numEntries) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        entriesMarshal := entries is VarRef ? "ptr*" : "ptr"
        numEntriesMarshal := numEntries is VarRef ? "uint*" : "ptr"

        result := DllCall("fwpuclnt.dll\FwpmSubLayerSubscriptionsGet0", "ptr", engineHandle, entriesMarshal, entries, numEntriesMarshal, numEntries, "uint")
        return result
    }

    /**
     * Retrieves a layer object.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Integer} id Type: <b>UINT16</b>
     * 
     *  Identifier of the desired layer. For a list of possible values, see <a href="https://docs.microsoft.com/windows-hardware/drivers/network/run-time-filtering-layer-identifiers">Run-time Filtering Layer Identifiers</a>  in the WDK documentation for Windows Filtering Platform.
     * @param {Pointer<Pointer<FWPM_LAYER0>>} layer Type: [FWPM_LAYER0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_layer0)**</b>
     * 
     * The layer information.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The layer was retrieved successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmlayergetbyid0
     * @since windows6.0.6000
     */
    static FwpmLayerGetById0(engineHandle, id, layer) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        layerMarshal := layer is VarRef ? "ptr*" : "ptr"

        result := DllCall("fwpuclnt.dll\FwpmLayerGetById0", "ptr", engineHandle, "ushort", id, layerMarshal, layer, "uint")
        return result
    }

    /**
     * Retrieves a layer object.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Pointer<Guid>} key Type: <b>const GUID*</b>
     * 
     * Unique identifier of the layer. See <a href="https://docs.microsoft.com/windows/desktop/FWP/management-filtering-layer-identifiers-">Filtering Layer Identifiers</a> for a list of possible GUID values.
     * @param {Pointer<Pointer<FWPM_LAYER0>>} layer Type: [FWPM_LAYER0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_layer0)**</b>
     * 
     * The layer information.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The layer was retrieved successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmlayergetbykey0
     * @since windows6.0.6000
     */
    static FwpmLayerGetByKey0(engineHandle, key, layer) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        layerMarshal := layer is VarRef ? "ptr*" : "ptr"

        result := DllCall("fwpuclnt.dll\FwpmLayerGetByKey0", "ptr", engineHandle, "ptr", key, layerMarshal, layer, "uint")
        return result
    }

    /**
     * Creates a handle used to enumerate a set of layer objects.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Pointer<FWPM_LAYER_ENUM_TEMPLATE0>} enumTemplate Type: [FWPM_LAYER_ENUM_TEMPLATE0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_layer_enum_template0)*</b>
     * 
     * Template to selectively restrict the enumeration.
     * @param {Pointer<HANDLE>} enumHandle Type: <b>HANDLE*</b>
     * 
     * Handle for the layer enumeration.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The enumerator was created successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmlayercreateenumhandle0
     * @since windows6.0.6000
     */
    static FwpmLayerCreateEnumHandle0(engineHandle, enumTemplate, enumHandle) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        result := DllCall("fwpuclnt.dll\FwpmLayerCreateEnumHandle0", "ptr", engineHandle, "ptr", enumTemplate, "ptr", enumHandle, "uint")
        return result
    }

    /**
     * Returns the next page of results from the layer enumerator.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {HANDLE} enumHandle Type: <b>HANDLE</b>
     * 
     * Handle for a layer enumeration created by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmlayercreateenumhandle0">FwpmLayerCreateEnumHandle0</a>.
     * @param {Integer} numEntriesRequested Type: <b>UINT32</b>
     * 
     * The number of layer entries requested.
     * @param {Pointer<Pointer<Pointer<FWPM_LAYER0>>>} entries Type: [FWPM_LAYER0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_layer0)***</b>
     * 
     * Addresses of the enumeration entries.
     * @param {Pointer<Integer>} numEntriesReturned Type: <b>UINT32*</b>
     * 
     * The number of layer entries returned.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The layers were enumerated successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmlayerenum0
     * @since windows6.0.6000
     */
    static FwpmLayerEnum0(engineHandle, enumHandle, numEntriesRequested, entries, numEntriesReturned) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle
        enumHandle := enumHandle is Win32Handle ? NumGet(enumHandle, "ptr") : enumHandle

        entriesMarshal := entries is VarRef ? "ptr*" : "ptr"
        numEntriesReturnedMarshal := numEntriesReturned is VarRef ? "uint*" : "ptr"

        result := DllCall("fwpuclnt.dll\FwpmLayerEnum0", "ptr", engineHandle, "ptr", enumHandle, "uint", numEntriesRequested, entriesMarshal, entries, numEntriesReturnedMarshal, numEntriesReturned, "uint")
        return result
    }

    /**
     * Frees a handle returned by FwpmFilterCreateEnumHandle0.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {HANDLE} enumHandle Type: <b>HANDLE</b>
     * 
     * Handle of a layer enumeration created by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmlayercreateenumhandle0">FwpmLayerCreateEnumHandle0</a>.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The enumerator was successfully deleted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmlayerdestroyenumhandle0
     * @since windows6.0.6000
     */
    static FwpmLayerDestroyEnumHandle0(engineHandle, enumHandle) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle
        enumHandle := enumHandle is Win32Handle ? NumGet(enumHandle, "ptr") : enumHandle

        result := DllCall("fwpuclnt.dll\FwpmLayerDestroyEnumHandle0", "ptr", engineHandle, "ptr", enumHandle, "uint")
        return result
    }

    /**
     * Retrieves a copy of the security descriptor for a layer object.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Pointer<Guid>} key Type: <b>const GUID*</b>
     * 
     * Unique identifier of the layer. See <a href="https://docs.microsoft.com/windows/desktop/FWP/management-filtering-layer-identifiers-">Filtering Layer Identifiers</a> for a list of possible GUID values.
     * @param {Integer} securityInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a></b>
     * 
     * The type of security information to retrieve.
     * @param {Pointer<PSID>} sidOwner Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">PSID</a>*</b>
     * 
     * The owner security identifier (SID) in the returned security descriptor.
     * @param {Pointer<PSID>} sidGroup Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">PSID</a>*</b>
     * 
     * The primary group security identifier (SID) in the returned security descriptor.
     * @param {Pointer<Pointer<ACL>>} dacl Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">PACL</a>*</b>
     * 
     * The discretionary access control list (DACL) in the returned security descriptor.
     * @param {Pointer<Pointer<ACL>>} sacl Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">PACL</a>*</b>
     * 
     * The system access control list (SACL) in the returned security descriptor.
     * @param {Pointer<PSECURITY_DESCRIPTOR>} securityDescriptor Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">PSECURITY_DESCRIPTOR</a>*</b>
     * 
     * The returned security descriptor.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The security descriptor was retrieved successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmlayergetsecurityinfobykey0
     * @since windows6.0.6000
     */
    static FwpmLayerGetSecurityInfoByKey0(engineHandle, key, securityInfo, sidOwner, sidGroup, dacl, sacl, securityDescriptor) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        sidOwnerMarshal := sidOwner is VarRef ? "ptr*" : "ptr"
        sidGroupMarshal := sidGroup is VarRef ? "ptr*" : "ptr"
        daclMarshal := dacl is VarRef ? "ptr*" : "ptr"
        saclMarshal := sacl is VarRef ? "ptr*" : "ptr"

        result := DllCall("fwpuclnt.dll\FwpmLayerGetSecurityInfoByKey0", "ptr", engineHandle, "ptr", key, "uint", securityInfo, sidOwnerMarshal, sidOwner, sidGroupMarshal, sidGroup, daclMarshal, dacl, saclMarshal, sacl, "ptr", securityDescriptor, "uint")
        return result
    }

    /**
     * Sets specified security information in the security descriptor of a layer object.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Pointer<Guid>} key Type: <b>const GUID*</b>
     * 
     * Unique identifier of the layer. See <a href="https://docs.microsoft.com/windows/desktop/FWP/management-filtering-layer-identifiers-">Filtering Layer Identifiers</a> for a list of possible GUID values.
     * @param {Integer} securityInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a></b>
     * 
     * The type of security information to set.
     * @param {Pointer<SID>} sidOwner Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a>*</b>
     * 
     * The owner's security identifier (SID) to be set in the security descriptor.
     * @param {Pointer<SID>} sidGroup Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a>*</b>
     * 
     * The group's SID to be set in the security descriptor.
     * @param {Pointer<ACL>} dacl Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a>*</b>
     * 
     * The discretionary access control list (DACL) to be set in the security descriptor.
     * @param {Pointer<ACL>} sacl Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a>*</b>
     * 
     * The system access control list (SACL) to be set in the security descriptor.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The security descriptor was set successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmlayersetsecurityinfobykey0
     * @since windows6.0.6000
     */
    static FwpmLayerSetSecurityInfoByKey0(engineHandle, key, securityInfo, sidOwner, sidGroup, dacl, sacl) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        result := DllCall("fwpuclnt.dll\FwpmLayerSetSecurityInfoByKey0", "ptr", engineHandle, "ptr", key, "uint", securityInfo, "ptr", sidOwner, "ptr", sidGroup, "ptr", dacl, "ptr", sacl, "uint")
        return result
    }

    /**
     * Adds a new callout object to the system.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call  <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Pointer<FWPM_CALLOUT0>} callout Type: [FWPM_CALLOUT0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_callout0)*</b>
     * 
     * The callout object to be added.
     * @param {PSECURITY_DESCRIPTOR} sd Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">PSECURITY_DESCRIPTOR</a></b>
     * 
     * The security information associated with the callout.
     * @param {Pointer<Integer>} id Type: <b>UINT32*</b>
     * 
     * Runtime identifier for this callout.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The callout was successfully added.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_INVALID_PARAMETER</b></dt>
     * <dt>0x80320035</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * FWPM_TUNNEL_FLAG_POINT_TO_POINT was not set and conditions other than local/remote
     *    address were specified.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmcalloutadd0
     * @since windows6.0.6000
     */
    static FwpmCalloutAdd0(engineHandle, callout, sd, id) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle
        sd := sd is Win32Handle ? NumGet(sd, "ptr") : sd

        idMarshal := id is VarRef ? "uint*" : "ptr"

        result := DllCall("fwpuclnt.dll\FwpmCalloutAdd0", "ptr", engineHandle, "ptr", callout, "ptr", sd, idMarshal, id, "uint")
        return result
    }

    /**
     * Removes a callout object from the system.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Integer} id Type: <b>UINT32</b>
     * 
     * The runtime identifier for the callout being removed from the system. This identifier was received from the system when the application called <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmcalloutadd0">FwpmCalloutAdd0</a> for this object.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The callout was successfully deleted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmcalloutdeletebyid0
     * @since windows6.0.6000
     */
    static FwpmCalloutDeleteById0(engineHandle, id) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        result := DllCall("fwpuclnt.dll\FwpmCalloutDeleteById0", "ptr", engineHandle, "uint", id, "uint")
        return result
    }

    /**
     * Removes a callout object from the system.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Pointer<Guid>} key Type: <b>const GUID*</b>
     * 
     * Unique identifier of the callout being removed from the system. This GUID was specified in the <b>calloutKey</b> member of the <i>callout</i> parameter when the application called <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmcalloutadd0">FwpmCalloutAdd0</a> for this object.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The callout was successfully deleted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmcalloutdeletebykey0
     * @since windows6.0.6000
     */
    static FwpmCalloutDeleteByKey0(engineHandle, key) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        result := DllCall("fwpuclnt.dll\FwpmCalloutDeleteByKey0", "ptr", engineHandle, "ptr", key, "uint")
        return result
    }

    /**
     * Retrieves a callout object.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Integer} id Type: <b>UINT32</b>
     * 
     * The runtime identifier for the callout. This identifier was received from the system when the application called <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmcalloutadd0">FwpmCalloutAdd0</a> for this object.
     * @param {Pointer<Pointer<FWPM_CALLOUT0>>} callout Type: [FWPM_CALLOUT0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_callout0)**</b>
     * 
     * Information about the state associated with the callout.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The callout was retrieved successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmcalloutgetbyid0
     * @since windows6.0.6000
     */
    static FwpmCalloutGetById0(engineHandle, id, callout) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        calloutMarshal := callout is VarRef ? "ptr*" : "ptr"

        result := DllCall("fwpuclnt.dll\FwpmCalloutGetById0", "ptr", engineHandle, "uint", id, calloutMarshal, callout, "uint")
        return result
    }

    /**
     * Retrieves a callout object.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Pointer<Guid>} key Type: <b>const GUID*</b>
     * 
     * Unique identifier of the callout. This GUID was specified in the <b>calloutKey</b> member of the <i>callout</i> parameter when the application called <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmcalloutadd0">FwpmCalloutAdd0</a> for this object.
     * @param {Pointer<Pointer<FWPM_CALLOUT0>>} callout Type: [FWPM_CALLOUT0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_callout0)**</b>
     * 
     * Information about the state associated with the callout.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The callout was retrieved successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmcalloutgetbykey0
     * @since windows6.0.6000
     */
    static FwpmCalloutGetByKey0(engineHandle, key, callout) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        calloutMarshal := callout is VarRef ? "ptr*" : "ptr"

        result := DllCall("fwpuclnt.dll\FwpmCalloutGetByKey0", "ptr", engineHandle, "ptr", key, calloutMarshal, callout, "uint")
        return result
    }

    /**
     * Creates a handle used to enumerate a set of callout objects.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Pointer<FWPM_CALLOUT_ENUM_TEMPLATE0>} enumTemplate Type: [FWPM_CALLOUT_ENUM_TEMPLATE0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_callout_enum_template0)*</b>
     * 
     * Template to selectively restrict the enumeration.
     * @param {Pointer<HANDLE>} enumHandle Type: <b>HANDLE*</b>
     * 
     * Handle of the newly created enumeration.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The enumerator was created successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmcalloutcreateenumhandle0
     * @since windows6.0.6000
     */
    static FwpmCalloutCreateEnumHandle0(engineHandle, enumTemplate, enumHandle) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        result := DllCall("fwpuclnt.dll\FwpmCalloutCreateEnumHandle0", "ptr", engineHandle, "ptr", enumTemplate, "ptr", enumHandle, "uint")
        return result
    }

    /**
     * Returns the next page of results from the callout enumerator.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {HANDLE} enumHandle Type: <b>HANDLE</b>
     * 
     * Handle for a callout enumeration created by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmcalloutcreateenumhandle0">FwpmCalloutCreateEnumHandle0</a>.
     * @param {Integer} numEntriesRequested Type: <b>UINT32</b>
     * 
     * The number of callout objects requested.
     * @param {Pointer<Pointer<Pointer<FWPM_CALLOUT0>>>} entries Type: [FWP_CALLOUT0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_callout0)***</b>
     * 
     * Addresses of the enumeration entries.
     * @param {Pointer<Integer>} numEntriesReturned Type: <b>UINT32*</b>
     * 
     * The number of callouts returned.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The callouts were enumerated successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmcalloutenum0
     * @since windows6.0.6000
     */
    static FwpmCalloutEnum0(engineHandle, enumHandle, numEntriesRequested, entries, numEntriesReturned) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle
        enumHandle := enumHandle is Win32Handle ? NumGet(enumHandle, "ptr") : enumHandle

        entriesMarshal := entries is VarRef ? "ptr*" : "ptr"
        numEntriesReturnedMarshal := numEntriesReturned is VarRef ? "uint*" : "ptr"

        result := DllCall("fwpuclnt.dll\FwpmCalloutEnum0", "ptr", engineHandle, "ptr", enumHandle, "uint", numEntriesRequested, entriesMarshal, entries, numEntriesReturnedMarshal, numEntriesReturned, "uint")
        return result
    }

    /**
     * Frees a handle returned by FwpmCalloutCreateEnumHandle0.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {HANDLE} enumHandle Type: <b>HANDLE</b>
     * 
     * Handle of a callout enumeration created by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmcalloutcreateenumhandle0">FwpmCalloutCreateEnumHandle0</a>.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The enumerator was successfully deleted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmcalloutdestroyenumhandle0
     * @since windows6.0.6000
     */
    static FwpmCalloutDestroyEnumHandle0(engineHandle, enumHandle) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle
        enumHandle := enumHandle is Win32Handle ? NumGet(enumHandle, "ptr") : enumHandle

        result := DllCall("fwpuclnt.dll\FwpmCalloutDestroyEnumHandle0", "ptr", engineHandle, "ptr", enumHandle, "uint")
        return result
    }

    /**
     * Retrieves a copy of the security descriptor for a callout object.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Pointer<Guid>} key Type: <b>const GUID*</b>
     * 
     * Pointer to a GUID that uniquely identifies the callout. This GUID was specified in the <b>calloutKey</b> member of the <i>callout</i> parameter when the application called <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmcalloutadd0">FwpmCalloutAdd0</a> for this object.
     * @param {Integer} securityInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a></b>
     * 
     * The type of security information to retrieve.
     * @param {Pointer<PSID>} sidOwner Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">PSID</a>*</b>
     * 
     * The owner security identifier (SID) in the returned security descriptor.
     * @param {Pointer<PSID>} sidGroup Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">PSID</a>*</b>
     * 
     * The primary group security identifier (SID) in the returned security descriptor.
     * @param {Pointer<Pointer<ACL>>} dacl Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">PACL</a>*</b>
     * 
     * The discretionary access control list (DACL) in the returned security descriptor.
     * @param {Pointer<Pointer<ACL>>} sacl Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">PACL</a>*</b>
     * 
     * The system access control list (SACL) in the returned security descriptor.
     * @param {Pointer<PSECURITY_DESCRIPTOR>} securityDescriptor Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">PSECURITY_DESCRIPTOR</a>*</b>
     * 
     * The returned security descriptor.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The security descriptor was retrieved successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmcalloutgetsecurityinfobykey0
     * @since windows6.0.6000
     */
    static FwpmCalloutGetSecurityInfoByKey0(engineHandle, key, securityInfo, sidOwner, sidGroup, dacl, sacl, securityDescriptor) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        sidOwnerMarshal := sidOwner is VarRef ? "ptr*" : "ptr"
        sidGroupMarshal := sidGroup is VarRef ? "ptr*" : "ptr"
        daclMarshal := dacl is VarRef ? "ptr*" : "ptr"
        saclMarshal := sacl is VarRef ? "ptr*" : "ptr"

        result := DllCall("fwpuclnt.dll\FwpmCalloutGetSecurityInfoByKey0", "ptr", engineHandle, "ptr", key, "uint", securityInfo, sidOwnerMarshal, sidOwner, sidGroupMarshal, sidGroup, daclMarshal, dacl, saclMarshal, sacl, "ptr", securityDescriptor, "uint")
        return result
    }

    /**
     * Sets specified security information in the security descriptor of a callout object.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Pointer<Guid>} key Type: <b>const GUID*</b>
     * 
     * Pointer to a GUID that uniquely identifies the callout. This GUID was specified in the <b>calloutKey</b> member of the <i>callout</i> parameter when the application called <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmcalloutadd0">FwpmCalloutAdd0</a> for this object.
     * @param {Integer} securityInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a></b>
     * 
     * The type of security information to set.
     * @param {Pointer<SID>} sidOwner Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a>*</b>
     * 
     * The owner's security identifier (SID) to be set in the security descriptor.
     * @param {Pointer<SID>} sidGroup Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a>*</b>
     * 
     * The group's SID to be set in the security descriptor.
     * @param {Pointer<ACL>} dacl Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a>*</b>
     * 
     * The discretionary access control list (DACL) to be set in the security descriptor.
     * @param {Pointer<ACL>} sacl Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a>*</b>
     * 
     * The system access control list (SACL) to be set in the security descriptor.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The security descriptor was set successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmcalloutsetsecurityinfobykey0
     * @since windows6.0.6000
     */
    static FwpmCalloutSetSecurityInfoByKey0(engineHandle, key, securityInfo, sidOwner, sidGroup, dacl, sacl) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        result := DllCall("fwpuclnt.dll\FwpmCalloutSetSecurityInfoByKey0", "ptr", engineHandle, "ptr", key, "uint", securityInfo, "ptr", sidOwner, "ptr", sidGroup, "ptr", dacl, "ptr", sacl, "uint")
        return result
    }

    /**
     * Is used to request the delivery of notifications regarding changes in a particular callout.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Pointer<FWPM_CALLOUT_SUBSCRIPTION0>} subscription Type: [FWPM_CALLOUT_SUBSCRIPTION0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_callout_subscription0)*</b>
     * 
     * The notifications which will be delivered.
     * @param {Pointer<FWPM_CALLOUT_CHANGE_CALLBACK0>} callback Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nc-fwpmu-fwpm_callout_change_callback0">FWPM_CALLOUT_CHANGE_CALLBACK0</a></b>
     * 
     * Function pointer that will be invoked when a notification is ready for delivery.
     * @param {Pointer<Void>} context Type: <b>void*</b>
     * 
     * Optional context pointer. This pointer is passed to the <i>callback</i> function along with details of the change.
     * @param {Pointer<HANDLE>} changeHandle Type: <b>HANDLE*</b>
     * 
     * Handle to the newly created subscription.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The subscription was created successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmcalloutsubscribechanges0
     * @since windows6.0.6000
     */
    static FwpmCalloutSubscribeChanges0(engineHandle, subscription, callback, context, changeHandle) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        contextMarshal := context is VarRef ? "ptr" : "ptr"

        result := DllCall("fwpuclnt.dll\FwpmCalloutSubscribeChanges0", "ptr", engineHandle, "ptr", subscription, "ptr", callback, contextMarshal, context, "ptr", changeHandle, "uint")
        return result
    }

    /**
     * Is used to cancel a callout change subscription and stop receiving change notifications.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {HANDLE} changeHandle Type: <b>HANDLE</b>
     * 
     * Handle of the subscribed change notification. This is the handle returned by the call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmcalloutsubscribechanges0">FwpmCalloutSubscribeChanges0</a>.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The subscription was deleted successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmcalloutunsubscribechanges0
     * @since windows6.0.6000
     */
    static FwpmCalloutUnsubscribeChanges0(engineHandle, changeHandle) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle
        changeHandle := changeHandle is Win32Handle ? NumGet(changeHandle, "ptr") : changeHandle

        result := DllCall("fwpuclnt.dll\FwpmCalloutUnsubscribeChanges0", "ptr", engineHandle, "ptr", changeHandle, "uint")
        return result
    }

    /**
     * Retrieves an array of all the current callout change notification subscriptions.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Pointer<Pointer<Pointer<FWPM_CALLOUT_SUBSCRIPTION0>>>} entries Type: [FWPM_CALLOUT_SUBSCRIPTION0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_callout_subscription0)***</b>
     * 
     * Addresses of the current callout change notification subscriptions.
     * @param {Pointer<Integer>} numEntries Type: <b>UINT32*</b>
     * 
     * The number of entries returned.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The subscriptions were retrieved successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmcalloutsubscriptionsget0
     * @since windows6.0.6000
     */
    static FwpmCalloutSubscriptionsGet0(engineHandle, entries, numEntries) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        entriesMarshal := entries is VarRef ? "ptr*" : "ptr"
        numEntriesMarshal := numEntries is VarRef ? "uint*" : "ptr"

        result := DllCall("fwpuclnt.dll\FwpmCalloutSubscriptionsGet0", "ptr", engineHandle, entriesMarshal, entries, numEntriesMarshal, numEntries, "uint")
        return result
    }

    /**
     * Adds a new filter object to the system.
     * @param {HANDLE} engineHandle Type: **HANDLE**
     * 
     * Handle for an open session to the filter engine. Call  [FwpmEngineOpen0](nf-fwpmu-fwpmengineopen0.md) to open a session to the filter engine.
     * @param {Pointer<FWPM_FILTER0>} filter Type: **[FWPM_FILTER0](../fwpmtypes/ns-fwpmtypes-fwpm_filter0.md)***
     * 
     * The filter object to be added.
     * @param {PSECURITY_DESCRIPTOR} sd Type: **[SECURITY_DESCRIPTOR](../winnt/ns-winnt-security_descriptor.md)**
     * 
     * Security information about the filter object.
     * @param {Pointer<Integer>} id Type: **UINT64***
     * 
     * The runtime identifier for this filter.
     * @returns {Integer} Type: **DWORD**
     * 
     * | Return code/value | Description |
     * | ----------------- | ----------- |
     * | ERROR_SUCCESS <br/> 0 | The filter was successfully added. |
     * | ERROR_INVALID_SECURITY_DESCR <br/> 0x8007053A | The security descriptor structure is invalid. Or, a filter condition contains a security descriptor in absolute format. |
     * | FWP_E_CALLOUT_NOTIFICATION_FAILED <br/> 0x80320037 | The caller added a callout filter and the callout returned an error from its notification routine. |
     * | FWP_E_* error code <br/> 0x80320001—0x80320039 | A Windows Filtering Platform (WFP) specific error. See [WFP Error Codes](/windows/desktop/FWP/wfp-error-codes) for details. |
     * | RPC_* error code <br/> 0x80010001—0x80010122 | Failure to communicate with the remote or local firewall engine. |
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmfilteradd0
     * @since windows6.0.6000
     */
    static FwpmFilterAdd0(engineHandle, filter, sd, id) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle
        sd := sd is Win32Handle ? NumGet(sd, "ptr") : sd

        idMarshal := id is VarRef ? "uint*" : "ptr"

        result := DllCall("fwpuclnt.dll\FwpmFilterAdd0", "ptr", engineHandle, "ptr", filter, "ptr", sd, idMarshal, id, "uint")
        return result
    }

    /**
     * Removes a filter object from the system.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Integer} id Type: <b>UINT64</b>
     * 
     * Runtime identifier for the object  being removed from the system. This value is returned by the  <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmfilteradd0">FwpmFilterAdd0</a> function.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The filter was successfully deleted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmfilterdeletebyid0
     * @since windows6.0.6000
     */
    static FwpmFilterDeleteById0(engineHandle, id) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        result := DllCall("fwpuclnt.dll\FwpmFilterDeleteById0", "ptr", engineHandle, "uint", id, "uint")
        return result
    }

    /**
     * Removes a filter object from the system.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Pointer<Guid>} key Type: <b>const GUID*</b>
     * 
     * Unique identifier of the object being removed from the system. This is the same GUID that was specified when the application called <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmfilteradd0">FwpmFilterAdd0</a> for this object.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The filter was successfully deleted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmfilterdeletebykey0
     * @since windows6.0.6000
     */
    static FwpmFilterDeleteByKey0(engineHandle, key) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        result := DllCall("fwpuclnt.dll\FwpmFilterDeleteByKey0", "ptr", engineHandle, "ptr", key, "uint")
        return result
    }

    /**
     * Retrieves a filter object.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Integer} id Type: <b>UINT64</b>
     * 
     * A runtime identifier for the desired object. This identifier was received from the system when the application called <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmfilteradd0">FwpmFilterAdd0</a> for this object.
     * @param {Pointer<Pointer<FWPM_FILTER0>>} filter Type: [FWPM_FILTER0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_filter0)**</b>
     * 
     * The filter information.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The filter was retrieved successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmfiltergetbyid0
     * @since windows6.0.6000
     */
    static FwpmFilterGetById0(engineHandle, id, filter) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        filterMarshal := filter is VarRef ? "ptr*" : "ptr"

        result := DllCall("fwpuclnt.dll\FwpmFilterGetById0", "ptr", engineHandle, "uint", id, filterMarshal, filter, "uint")
        return result
    }

    /**
     * Retrieves a filter object.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Pointer<Guid>} key Type: <b>const GUID*</b>
     * 
     * Unique identifier of the filter. This GUID was specified in the <b>filterKey</b> member of the <i>filter</i> parameter when the application called <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmfilteradd0">FwpmFilterAdd0</a> for this object.
     * @param {Pointer<Pointer<FWPM_FILTER0>>} filter Type: [FWPM_FILTER0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_filter0)**</b>
     * 
     * The filter information.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The filter was retrieved successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmfiltergetbykey0
     * @since windows6.0.6000
     */
    static FwpmFilterGetByKey0(engineHandle, key, filter) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        filterMarshal := filter is VarRef ? "ptr*" : "ptr"

        result := DllCall("fwpuclnt.dll\FwpmFilterGetByKey0", "ptr", engineHandle, "ptr", key, filterMarshal, filter, "uint")
        return result
    }

    /**
     * Creates a handle used to enumerate a set of filter objects.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Pointer<FWPM_FILTER_ENUM_TEMPLATE0>} enumTemplate Type: [FWPM_FILTER_ENUM_TEMPLATE0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_filter_enum_template0)*</b>
     * 
     * Template to selectively restrict the enumeration.
     * @param {Pointer<HANDLE>} enumHandle Type: <b>HANDLE*</b>
     * 
     * The handle for filter enumeration.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The enumerator was created successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmfiltercreateenumhandle0
     * @since windows6.0.6000
     */
    static FwpmFilterCreateEnumHandle0(engineHandle, enumTemplate, enumHandle) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        result := DllCall("fwpuclnt.dll\FwpmFilterCreateEnumHandle0", "ptr", engineHandle, "ptr", enumTemplate, "ptr", enumHandle, "uint")
        return result
    }

    /**
     * Returns the next page of results from the filter enumerator.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {HANDLE} enumHandle Type: <b>HANDLE</b>
     * 
     * Handle for a filter enumeration created by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmfiltercreateenumhandle0">FwpmFilterCreateEnumHandle0</a>.
     * @param {Integer} numEntriesRequested Type: <b>UINT32</b>
     * 
     * The number of filter objects requested.
     * @param {Pointer<Pointer<Pointer<FWPM_FILTER0>>>} entries Type: [FWPM_FILTER0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_filter0)***</b>
     * 
     * Addresses of enumeration entries.
     * @param {Pointer<Integer>} numEntriesReturned Type: <b>UINT32*</b>
     * 
     * The number of filter objects returned.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The filters were enumerated successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmfilterenum0
     * @since windows6.0.6000
     */
    static FwpmFilterEnum0(engineHandle, enumHandle, numEntriesRequested, entries, numEntriesReturned) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle
        enumHandle := enumHandle is Win32Handle ? NumGet(enumHandle, "ptr") : enumHandle

        entriesMarshal := entries is VarRef ? "ptr*" : "ptr"
        numEntriesReturnedMarshal := numEntriesReturned is VarRef ? "uint*" : "ptr"

        result := DllCall("fwpuclnt.dll\FwpmFilterEnum0", "ptr", engineHandle, "ptr", enumHandle, "uint", numEntriesRequested, entriesMarshal, entries, numEntriesReturnedMarshal, numEntriesReturned, "uint")
        return result
    }

    /**
     * Frees a handle returned by FwpmFilterCreateEnumHandle0.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {HANDLE} enumHandle Type: <b>HANDLE</b>
     * 
     * Handle of a filter enumeration created by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmfiltercreateenumhandle0">FwpmFilterCreateEnumHandle0</a>.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The enumerator was successfully deleted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmfilterdestroyenumhandle0
     * @since windows6.0.6000
     */
    static FwpmFilterDestroyEnumHandle0(engineHandle, enumHandle) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle
        enumHandle := enumHandle is Win32Handle ? NumGet(enumHandle, "ptr") : enumHandle

        result := DllCall("fwpuclnt.dll\FwpmFilterDestroyEnumHandle0", "ptr", engineHandle, "ptr", enumHandle, "uint")
        return result
    }

    /**
     * Retrieves a copy of the security descriptor for a filter object.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Pointer<Guid>} key Type: <b>const GUID*</b>
     * 
     * Unique identifier of the filter. This GUID was specified in the <b>filterKey</b> member of the <i>filter</i> parameter when the application called <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmfilteradd0">FwpmFilterAdd0</a> for this object.
     * @param {Integer} securityInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a></b>
     * 
     * The type of security information to retrieve.
     * @param {Pointer<PSID>} sidOwner Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">PSID</a>*</b>
     * 
     * The owner security identifier (SID) in the returned security descriptor.
     * @param {Pointer<PSID>} sidGroup Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">PSID</a>*</b>
     * 
     * The primary group security identifier (SID) in the returned security descriptor.
     * @param {Pointer<Pointer<ACL>>} dacl Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">PACL</a>*</b>
     * 
     * The discretionary access control list (DACL) in the returned security descriptor.
     * @param {Pointer<Pointer<ACL>>} sacl Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">PACL</a>*</b>
     * 
     * The system access control list (SACL) in the returned security descriptor.
     * @param {Pointer<PSECURITY_DESCRIPTOR>} securityDescriptor Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">PSECURITY_DESCRIPTOR</a>*</b>
     * 
     * The returned security descriptor.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The security descriptor was retrieved successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmfiltergetsecurityinfobykey0
     * @since windows6.0.6000
     */
    static FwpmFilterGetSecurityInfoByKey0(engineHandle, key, securityInfo, sidOwner, sidGroup, dacl, sacl, securityDescriptor) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        sidOwnerMarshal := sidOwner is VarRef ? "ptr*" : "ptr"
        sidGroupMarshal := sidGroup is VarRef ? "ptr*" : "ptr"
        daclMarshal := dacl is VarRef ? "ptr*" : "ptr"
        saclMarshal := sacl is VarRef ? "ptr*" : "ptr"

        result := DllCall("fwpuclnt.dll\FwpmFilterGetSecurityInfoByKey0", "ptr", engineHandle, "ptr", key, "uint", securityInfo, sidOwnerMarshal, sidOwner, sidGroupMarshal, sidGroup, daclMarshal, dacl, saclMarshal, sacl, "ptr", securityDescriptor, "uint")
        return result
    }

    /**
     * Sets specified security information in the security descriptor of a filter object.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Pointer<Guid>} key Type: <b>const GUID*</b>
     * 
     * Unique identifier of the filter. This GUID was specified in the <b>filterKey</b> member of the <i>filter</i> parameter when the application called <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmfilteradd0">FwpmFilterAdd0</a> for this object.
     * @param {Integer} securityInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a></b>
     * 
     * The type of security information to set.
     * @param {Pointer<SID>} sidOwner Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a>*</b>
     * 
     * The owner's security identifier (SID) to be set in the security descriptor.
     * @param {Pointer<SID>} sidGroup Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a>*</b>
     * 
     * The group's SID to be set in the security descriptor.
     * @param {Pointer<ACL>} dacl Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a>*</b>
     * 
     * The discretionary access control list (DACL) to be set in the security descriptor.
     * @param {Pointer<ACL>} sacl Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a>*</b>
     * 
     * The system access control list (SACL) to be set in the security descriptor.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The security descriptor was set successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmfiltersetsecurityinfobykey0
     * @since windows6.0.6000
     */
    static FwpmFilterSetSecurityInfoByKey0(engineHandle, key, securityInfo, sidOwner, sidGroup, dacl, sacl) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        result := DllCall("fwpuclnt.dll\FwpmFilterSetSecurityInfoByKey0", "ptr", engineHandle, "ptr", key, "uint", securityInfo, "ptr", sidOwner, "ptr", sidGroup, "ptr", dacl, "ptr", sacl, "uint")
        return result
    }

    /**
     * Is used to request the delivery of notifications regarding changes in a particular filter.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Pointer<FWPM_FILTER_SUBSCRIPTION0>} subscription Type: [FWPM_FILTER_SUBSCRIPTION0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_filter_subscription0)*</b>
     * 
     * The notifications to be delivered.
     * @param {Pointer<FWPM_FILTER_CHANGE_CALLBACK0>} callback Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nc-fwpmu-fwpm_filter_change_callback0">FWPM_FILTER_CHANGE_CALLBACK0</a></b>
     * 
     * The  function pointer that will be invoked when a notification is ready for delivery.
     * @param {Pointer<Void>} context Type: <b>void*</b>
     * 
     * Optional context pointer. This pointer is passed to the <i>callback</i> function along with details of the change.
     * @param {Pointer<HANDLE>} changeHandle Type: <b>HANDLE*</b>
     * 
     * Handle to the newly created subscription.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The subscription was created successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmfiltersubscribechanges0
     * @since windows6.0.6000
     */
    static FwpmFilterSubscribeChanges0(engineHandle, subscription, callback, context, changeHandle) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        contextMarshal := context is VarRef ? "ptr" : "ptr"

        result := DllCall("fwpuclnt.dll\FwpmFilterSubscribeChanges0", "ptr", engineHandle, "ptr", subscription, "ptr", callback, contextMarshal, context, "ptr", changeHandle, "uint")
        return result
    }

    /**
     * Is used to cancel a filter change subscription and stop receiving change notifications.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {HANDLE} changeHandle Type: <b>HANDLE</b>
     * 
     * Handle of the subscribed change notification. This is the handle returned by the call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmfiltersubscribechanges0">FwpmFilterSubscribeChanges0</a>.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The subscription was deleted successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmfilterunsubscribechanges0
     * @since windows6.0.6000
     */
    static FwpmFilterUnsubscribeChanges0(engineHandle, changeHandle) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle
        changeHandle := changeHandle is Win32Handle ? NumGet(changeHandle, "ptr") : changeHandle

        result := DllCall("fwpuclnt.dll\FwpmFilterUnsubscribeChanges0", "ptr", engineHandle, "ptr", changeHandle, "uint")
        return result
    }

    /**
     * Retrieves an array of all the current filter change notification subscriptions.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Pointer<Pointer<Pointer<FWPM_FILTER_SUBSCRIPTION0>>>} entries Type: [FWPM_FILTER_SUBSCRIPTION0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_filter_subscription0)***</b>
     * 
     * The current filter change notification subscriptions.
     * @param {Pointer<Integer>} numEntries Type: <b>UINT32*</b>
     * 
     * The number of entries returned.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The subscriptions were retrieved successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmfiltersubscriptionsget0
     * @since windows6.0.6000
     */
    static FwpmFilterSubscriptionsGet0(engineHandle, entries, numEntries) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        entriesMarshal := entries is VarRef ? "ptr*" : "ptr"
        numEntriesMarshal := numEntries is VarRef ? "uint*" : "ptr"

        result := DllCall("fwpuclnt.dll\FwpmFilterSubscriptionsGet0", "ptr", engineHandle, entriesMarshal, entries, numEntriesMarshal, numEntries, "uint")
        return result
    }

    /**
     * Retrieves an application identifier from a file name.
     * @param {PWSTR} fileName Type: <b>const wchar_t*</b>
     * 
     * File name from which the application identifier will be retrieved.
     * @param {Pointer<Pointer<FWP_BYTE_BLOB>>} appId Type: [FWP_BYTE_BLOB](/windows/desktop/api/fwptypes/ns-fwptypes-fwp_byte_blob)**</b>
     * 
     * The  retrieved application identifier.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The application identifier  was retrieved successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmgetappidfromfilename0
     * @since windows6.0.6000
     */
    static FwpmGetAppIdFromFileName0(fileName, appId) {
        fileName := fileName is String ? StrPtr(fileName) : fileName

        appIdMarshal := appId is VarRef ? "ptr*" : "ptr"

        result := DllCall("fwpuclnt.dll\FwpmGetAppIdFromFileName0", "ptr", fileName, appIdMarshal, appId, "uint")
        return result
    }

    /**
     * 
     * @param {HANDLE} engineHandle 
     * @param {Integer} flags 
     * @param {Pointer<FWPM_PROVIDER_CONTEXT0>} mainModePolicy 
     * @param {Pointer<FWPM_PROVIDER_CONTEXT0>} tunnelPolicy 
     * @param {Integer} numFilterConditions 
     * @param {Pointer<FWPM_FILTER_CONDITION0>} filterConditions 
     * @param {PSECURITY_DESCRIPTOR} sd 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmipsectunneladd0
     * @since windows6.0.6000
     */
    static FwpmIPsecTunnelAdd0(engineHandle, flags, mainModePolicy, tunnelPolicy, numFilterConditions, filterConditions, sd) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle
        sd := sd is Win32Handle ? NumGet(sd, "ptr") : sd

        result := DllCall("fwpuclnt.dll\FwpmIPsecTunnelAdd0", "ptr", engineHandle, "uint", flags, "ptr", mainModePolicy, "ptr", tunnelPolicy, "uint", numFilterConditions, "ptr", filterConditions, "ptr", sd, "uint")
        return result
    }

    /**
     * 
     * @param {HANDLE} engineHandle 
     * @param {Integer} flags 
     * @param {Pointer<FWPM_PROVIDER_CONTEXT1>} mainModePolicy 
     * @param {Pointer<FWPM_PROVIDER_CONTEXT1>} tunnelPolicy 
     * @param {Integer} numFilterConditions 
     * @param {Pointer<FWPM_FILTER_CONDITION0>} filterConditions 
     * @param {Pointer<Guid>} keyModKey 
     * @param {PSECURITY_DESCRIPTOR} sd 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmipsectunneladd1
     * @since windows6.1
     */
    static FwpmIPsecTunnelAdd1(engineHandle, flags, mainModePolicy, tunnelPolicy, numFilterConditions, filterConditions, keyModKey, sd) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle
        sd := sd is Win32Handle ? NumGet(sd, "ptr") : sd

        result := DllCall("fwpuclnt.dll\FwpmIPsecTunnelAdd1", "ptr", engineHandle, "uint", flags, "ptr", mainModePolicy, "ptr", tunnelPolicy, "uint", numFilterConditions, "ptr", filterConditions, "ptr", keyModKey, "ptr", sd, "uint")
        return result
    }

    /**
     * Adds a new Internet Protocol Security (IPsec) tunnel mode policy to the system.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * A handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Integer} flags Type: <b>UINT32</b>
     * 
     * Possible values:
     * 
     * <table>
     * <tr>
     * <th>IPsec tunnel flag</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FWPM_TUNNEL_FLAG_POINT_TO_POINT"></a><a id="fwpm_tunnel_flag_point_to_point"></a><dl>
     * <dt><b>FWPM_TUNNEL_FLAG_POINT_TO_POINT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Adds a point-to-point tunnel to the system.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FWPM_TUNNEL_FLAG_ENABLE_VIRTUAL_IF_TUNNELING"></a><a id="fwpm_tunnel_flag_enable_virtual_if_tunneling"></a><dl>
     * <dt><b>FWPM_TUNNEL_FLAG_ENABLE_VIRTUAL_IF_TUNNELING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Enables virtual interface-based IPsec tunnel mode.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<FWPM_PROVIDER_CONTEXT2>} mainModePolicy Type: [FWPM_PROVIDER_CONTEXT2](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_provider_context2)*</b>
     * 
     * The Main Mode policy for the IPsec tunnel.
     * @param {Pointer<FWPM_PROVIDER_CONTEXT2>} tunnelPolicy Type: [FWPM_PROVIDER_CONTEXT2](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_provider_context2)*</b>
     * 
     * The Quick Mode policy for the IPsec tunnel.
     * @param {Integer} numFilterConditions Type: <b>UINT32</b>
     * 
     * Number of filter conditions present in the <i>filterConditions</i> parameter.
     * @param {Pointer<FWPM_FILTER_CONDITION0>} filterConditions Type: [FWPM_FILTER_CONDITION0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_filter_condition0)*</b>
     * 
     * Array of filter conditions that describe the traffic which should be tunneled by IPsec.
     * @param {Pointer<Guid>} keyModKey Type: <b>const GUID*</b>
     * 
     * Pointer to a GUID that uniquely identifies the keying module key.
     * 
     * If the caller supplies this parameter, only that keying module will be used for the tunnel. Otherwise, the default keying policy applies.
     * @param {PSECURITY_DESCRIPTOR} sd Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">PSECURITY_DESCRIPTOR</a></b>
     * 
     * The security information associated with the IPsec tunnel.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The IPsec tunnel mode policy was successfully added.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_INVALID_PARAMETER</b></dt>
     * <dt>0x80320035</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * FWPM_TUNNEL_FLAG_POINT_TO_POINT was not set and conditions other than local/remote
     *    address were specified.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmipsectunneladd2
     * @since windows8.0
     */
    static FwpmIPsecTunnelAdd2(engineHandle, flags, mainModePolicy, tunnelPolicy, numFilterConditions, filterConditions, keyModKey, sd) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle
        sd := sd is Win32Handle ? NumGet(sd, "ptr") : sd

        result := DllCall("fwpuclnt.dll\FwpmIPsecTunnelAdd2", "ptr", engineHandle, "uint", flags, "ptr", mainModePolicy, "ptr", tunnelPolicy, "uint", numFilterConditions, "ptr", filterConditions, "ptr", keyModKey, "ptr", sd, "uint")
        return result
    }

    /**
     * 
     * @param {HANDLE} engineHandle 
     * @param {Integer} flags 
     * @param {Pointer<FWPM_PROVIDER_CONTEXT3>} mainModePolicy 
     * @param {Pointer<FWPM_PROVIDER_CONTEXT3>} tunnelPolicy 
     * @param {Integer} numFilterConditions 
     * @param {Pointer<FWPM_FILTER_CONDITION0>} filterConditions 
     * @param {Pointer<Guid>} keyModKey 
     * @param {PSECURITY_DESCRIPTOR} sd 
     * @returns {Integer} 
     */
    static FwpmIPsecTunnelAdd3(engineHandle, flags, mainModePolicy, tunnelPolicy, numFilterConditions, filterConditions, keyModKey, sd) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle
        sd := sd is Win32Handle ? NumGet(sd, "ptr") : sd

        result := DllCall("fwpuclnt.dll\FwpmIPsecTunnelAdd3", "ptr", engineHandle, "uint", flags, "ptr", mainModePolicy, "ptr", tunnelPolicy, "uint", numFilterConditions, "ptr", filterConditions, "ptr", keyModKey, "ptr", sd, "uint")
        return result
    }

    /**
     * Removes an Internet Protocol Security (IPsec) tunnel mode policy from the system.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * A handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Pointer<Guid>} key Type: <b>const GUID*</b>
     * 
     * Unique identifier of the IPsec tunnel.  This GUID was specified in the <b>providerContextKey</b> member of the <i>tunnelPolicy</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmipsectunneladd0">FwpmIPsecTunnelAdd0</a> function.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The IPsec tunnel mode policy was successfully deleted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmipsectunneldeletebykey0
     * @since windows6.0.6000
     */
    static FwpmIPsecTunnelDeleteByKey0(engineHandle, key) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        result := DllCall("fwpuclnt.dll\FwpmIPsecTunnelDeleteByKey0", "ptr", engineHandle, "ptr", key, "uint")
        return result
    }

    /**
     * Retrieves Internet Protocol Security (IPsec) statistics.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Pointer<IPSEC_STATISTICS0>} ipsecStatistics Type: [IPSEC_STATISTICS0](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_statistics0)*</b>
     * 
     * Top-level object of IPsec statistics organization.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The IPsec statistics were successfully retrieved.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-ipsecgetstatistics0
     * @since windows6.0.6000
     */
    static IPsecGetStatistics0(engineHandle, ipsecStatistics) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        result := DllCall("fwpuclnt.dll\IPsecGetStatistics0", "ptr", engineHandle, "ptr", ipsecStatistics, "uint")
        return result
    }

    /**
     * Retrieves Internet Protocol Security (IPsec) statistics.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Pointer<IPSEC_STATISTICS1>} ipsecStatistics Type: [IPSEC_STATISTICS1](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_statistics1)*</b>
     * 
     * Top-level object of IPsec statistics organization.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The IPsec statistics were successfully retrieved.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-ipsecgetstatistics1
     * @since windows6.1
     */
    static IPsecGetStatistics1(engineHandle, ipsecStatistics) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        result := DllCall("fwpuclnt.dll\IPsecGetStatistics1", "ptr", engineHandle, "ptr", ipsecStatistics, "uint")
        return result
    }

    /**
     * Creates an IPsec security association (SA) context.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Pointer<IPSEC_TRAFFIC0>} outboundTraffic Type: [IPSEC_TRAFFIC0](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_traffic0)*</b>
     * 
     * The outbound traffic of the SA.
     * @param {Pointer<Integer>} inboundFilterId Type: <b>UINT64*</b>
     * 
     *  Optional filter identifier of the cached inbound filter corresponding to the <i>outboundTraffic</i> parameter specified by the caller. Base filtering engine (BFE) may cache the inbound filter identifier and return the cached value, if available. Caller must handle the case when BFE does not have a cached value, in which case this parameter will be set to 0.
     * @param {Pointer<Integer>} id Type: <b>UINT64*</b>
     * 
     * The identifier of the  IPsec SA context.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The IPsec SA context was created successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-ipsecsacontextcreate0
     * @since windows6.0.6000
     */
    static IPsecSaContextCreate0(engineHandle, outboundTraffic, inboundFilterId, id) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        inboundFilterIdMarshal := inboundFilterId is VarRef ? "uint*" : "ptr"
        idMarshal := id is VarRef ? "uint*" : "ptr"

        result := DllCall("fwpuclnt.dll\IPsecSaContextCreate0", "ptr", engineHandle, "ptr", outboundTraffic, inboundFilterIdMarshal, inboundFilterId, idMarshal, id, "uint")
        return result
    }

    /**
     * Creates an IPsec security association (SA) context.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Pointer<IPSEC_TRAFFIC1>} outboundTraffic Type: [IPSEC_TRAFFIC1](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_traffic0)*</b>
     * 
     * The outbound traffic of the SA.
     * @param {Pointer<IPSEC_VIRTUAL_IF_TUNNEL_INFO0>} virtualIfTunnelInfo Type: [IPSEC_VIRTUAL_IF_TUNNEL_INFO0](/windows/desktop/api/fwptypes/ns-fwptypes-ipsec_virtual_if_tunnel_info0)*</b>
     * 
     * Details related to virtual interface tunneling.
     * @param {Pointer<Integer>} inboundFilterId Type: <b>UINT64*</b>
     * 
     *  Optional filter identifier of the cached inbound filter corresponding to the <i>outboundTraffic</i> parameter specified by the caller. Base filtering engine (BFE) may cache the inbound filter identifier and return the cached value, if available. Caller must handle the case when BFE does not have a cached value, in which case this parameter will be set to 0.
     * @param {Pointer<Integer>} id Type: <b>UINT64*</b>
     * 
     * The identifier of the  IPsec SA context.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The IPsec SA context was created successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-ipsecsacontextcreate1
     * @since windows6.1
     */
    static IPsecSaContextCreate1(engineHandle, outboundTraffic, virtualIfTunnelInfo, inboundFilterId, id) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        inboundFilterIdMarshal := inboundFilterId is VarRef ? "uint*" : "ptr"
        idMarshal := id is VarRef ? "uint*" : "ptr"

        result := DllCall("fwpuclnt.dll\IPsecSaContextCreate1", "ptr", engineHandle, "ptr", outboundTraffic, "ptr", virtualIfTunnelInfo, inboundFilterIdMarshal, inboundFilterId, idMarshal, id, "uint")
        return result
    }

    /**
     * Deletes an IPsec security association (SA) context.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Integer} id Type: <b>UINT64</b>
     * 
     * A runtime identifier for the object being removed from the system.  This identifier was received from the system when the application called <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-ipsecsacontextcreate0">IPsecSaContextCreate0</a>.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The IPsec SA context was successfully deleted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-ipsecsacontextdeletebyid0
     * @since windows6.0.6000
     */
    static IPsecSaContextDeleteById0(engineHandle, id) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        result := DllCall("fwpuclnt.dll\IPsecSaContextDeleteById0", "ptr", engineHandle, "uint", id, "uint")
        return result
    }

    /**
     * Retrieves an IPsec security association (SA) context.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Integer} id Type: <b>UINT64</b>
     * 
     * A runtime identifier for the SA context. This identifier was received from the system when the application called <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-ipsecsacontextcreate0">IPsecSaContextCreate0</a>.
     * @param {Pointer<Pointer<IPSEC_SA_CONTEXT0>>} saContext Type: [IPSEC_SA_CONTEXT0](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_sa_context0)**</b>
     * 
     * Address of the IPsec SA context.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The IPsec SA context was successfully retrieved.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-ipsecsacontextgetbyid0
     * @since windows6.0.6000
     */
    static IPsecSaContextGetById0(engineHandle, id, saContext) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        saContextMarshal := saContext is VarRef ? "ptr*" : "ptr"

        result := DllCall("fwpuclnt.dll\IPsecSaContextGetById0", "ptr", engineHandle, "uint", id, saContextMarshal, saContext, "uint")
        return result
    }

    /**
     * Retrieves an IPsec security association (SA) context.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Integer} id Type: <b>UINT64</b>
     * 
     * A runtime identifier for the SA context. This identifier was received from the system when the application called <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-ipsecsacontextcreate0">IPsecSaContextCreate0</a>.
     * @param {Pointer<Pointer<IPSEC_SA_CONTEXT1>>} saContext Type: [IPSEC_SA_CONTEXT1](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_sa_context1)**</b>
     * 
     * Address of the IPsec SA context.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The IPsec SA context was successfully retrieved.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-ipsecsacontextgetbyid1
     * @since windows6.1
     */
    static IPsecSaContextGetById1(engineHandle, id, saContext) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        saContextMarshal := saContext is VarRef ? "ptr*" : "ptr"

        result := DllCall("fwpuclnt.dll\IPsecSaContextGetById1", "ptr", engineHandle, "uint", id, saContextMarshal, saContext, "uint")
        return result
    }

    /**
     * Retrieves the security parameters index (SPI) for a security association (SA) context.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Integer} id Type: <b>UINT64</b>
     * 
     * A runtime identifier for the SA context. This identifier was received from the system when the application called <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-ipsecsacontextcreate0">IPsecSaContextCreate0</a>.
     * @param {Pointer<IPSEC_GETSPI0>} getSpi Type: [IPSEC_GETSPI0](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_getspi0)*</b>
     * 
     * The inbound IPsec traffic.
     * @param {Pointer<Integer>} inboundSpi Type: <b>IPSEC_SA_SPI*</b>
     * 
     * The inbound SA SPI. The <b>IPSEC_SA_SPI</b> data type maps to the <b>UINT32</b> data type.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The SPI for the IPsec SA context was retrieved successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-ipsecsacontextgetspi0
     * @since windows6.0.6000
     */
    static IPsecSaContextGetSpi0(engineHandle, id, getSpi, inboundSpi) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        inboundSpiMarshal := inboundSpi is VarRef ? "uint*" : "ptr"

        result := DllCall("fwpuclnt.dll\IPsecSaContextGetSpi0", "ptr", engineHandle, "uint", id, "ptr", getSpi, inboundSpiMarshal, inboundSpi, "uint")
        return result
    }

    /**
     * Retrieves the security parameters index (SPI) for a security association (SA) context.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Integer} id Type: <b>UINT64</b>
     * 
     * A runtime identifier for the SA context. This identifier was received from the system when the application called <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-ipsecsacontextcreate1">IPsecSaContextCreate1</a>.
     * @param {Pointer<IPSEC_GETSPI1>} getSpi Type: [IPSEC_GETSPI1](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_getspi1)*</b>
     * 
     * The inbound IPsec traffic.
     * @param {Pointer<Integer>} inboundSpi Type: <b>IPSEC_SA_SPI*</b>
     * 
     * The inbound SA SPI. The <b>IPSEC_SA_SPI</b> data type maps to the <b>UINT32</b> data type.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The SPI for the IPsec SA context was retrieved successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-ipsecsacontextgetspi1
     * @since windows6.1
     */
    static IPsecSaContextGetSpi1(engineHandle, id, getSpi, inboundSpi) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        inboundSpiMarshal := inboundSpi is VarRef ? "uint*" : "ptr"

        result := DllCall("fwpuclnt.dll\IPsecSaContextGetSpi1", "ptr", engineHandle, "uint", id, "ptr", getSpi, inboundSpiMarshal, inboundSpi, "uint")
        return result
    }

    /**
     * Sets the security parameters index (SPI) for a security association (SA) context.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Integer} id Type: <b>UINT64</b>
     * 
     * A runtime identifier for the SA context. This identifier was received from the system when the application called <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-ipsecsacontextcreate1">IPsecSaContextCreate1</a>.
     * @param {Pointer<IPSEC_GETSPI1>} getSpi Type: [IPSEC_GETSPI1](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_getspi1)*</b>
     * 
     * The inbound IPsec traffic.
     * @param {Integer} inboundSpi Type: <b>IPSEC_SA_SPI</b>
     * 
     * The inbound SA SPI. The <b>IPSEC_SA_SPI</b> data type maps to the <b>UINT32</b> data type.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The SPI for the IPsec SA context was set successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-ipsecsacontextsetspi0
     * @since windows6.1
     */
    static IPsecSaContextSetSpi0(engineHandle, id, getSpi, inboundSpi) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        result := DllCall("fwpuclnt.dll\IPsecSaContextSetSpi0", "ptr", engineHandle, "uint", id, "ptr", getSpi, "uint", inboundSpi, "uint")
        return result
    }

    /**
     * The IPsecSaContextAddInbound0 function adds an inbound IPsec security association (SA) bundle to an existing SA context.Note  IPsecSaContextAddInbound0 is the specific implementation of IPsecSaContextAddInbound used in Windows Vista.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Integer} id Type: <b>UINT64</b>
     * 
     * Identifier for the existing IPsec SA context. This is the value returned in the <i>id</i> parameter by the call to  <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-ipsecsacontextcreate0">IPsecSaContextCreate0</a>.
     * @param {Pointer<IPSEC_SA_BUNDLE0>} inboundBundle Type: [IPSEC_SA_BUNDLE0](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_sa_bundle0)*</b>
     * 
     * The inbound IPsec SA bundle to be added to the SA context.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The IPsec SA bundle was successfully added to the SA context.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-ipsecsacontextaddinbound0
     * @since windows6.0.6000
     */
    static IPsecSaContextAddInbound0(engineHandle, id, inboundBundle) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        result := DllCall("fwpuclnt.dll\IPsecSaContextAddInbound0", "ptr", engineHandle, "uint", id, "ptr", inboundBundle, "uint")
        return result
    }

    /**
     * The IPsecSaContextAddOutbound0 function adds an outbound IPsec security association (SA) bundle to an existing SA context.Note  IPsecSaContextAddOutbound0 is the specific implementation of IPsecSaContextAddOutbound used in Windows Vista.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Integer} id Type: <b>UINT64</b>
     * 
     * Identifier for the existing IPsec SA context. This is the value returned in the <i>id</i> parameter by the call to  <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-ipsecsacontextcreate0">IPsecSaContextCreate0</a>.
     * @param {Pointer<IPSEC_SA_BUNDLE0>} outboundBundle Type: [IPSEC_SA_BUNDLE0](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_sa_bundle0)*</b>
     * 
     * The outbound IPsec SA bundle to be added to the SA context.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The IPsec SA bundle was successfully added to the SA context.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-ipsecsacontextaddoutbound0
     * @since windows6.0.6000
     */
    static IPsecSaContextAddOutbound0(engineHandle, id, outboundBundle) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        result := DllCall("fwpuclnt.dll\IPsecSaContextAddOutbound0", "ptr", engineHandle, "uint", id, "ptr", outboundBundle, "uint")
        return result
    }

    /**
     * The IPsecSaContextAddInbound1 function adds an inbound IPsec security association (SA) bundle to an existing SA context.Note  IPsecSaContextAddInbound1 is the specific implementation of IPsecSaContextAddInbound used in Windows 7 and later.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Integer} id Type: <b>UINT64</b>
     * 
     * Identifier for the existing IPsec SA context. This is the value returned in the <i>id</i> parameter by the call to  <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-ipsecsacontextcreate1">IPsecSaContextCreate1</a>.
     * @param {Pointer<IPSEC_SA_BUNDLE1>} inboundBundle Type: [IPSEC_SA_BUNDLE1](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_sa_bundle1)*</b>
     * 
     * The inbound IPsec SA bundle to be added to the SA context.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The IPsec SA bundle was successfully added to the SA context.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-ipsecsacontextaddinbound1
     * @since windows6.1
     */
    static IPsecSaContextAddInbound1(engineHandle, id, inboundBundle) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        result := DllCall("fwpuclnt.dll\IPsecSaContextAddInbound1", "ptr", engineHandle, "uint", id, "ptr", inboundBundle, "uint")
        return result
    }

    /**
     * The IPsecSaContextAddOutbound1 function adds an outbound IPsec security association (SA) bundle to an existing SA context.Note  IPsecSaContextAddOutbound1 is the specific implementation of IPsecSaContextAddOutbound used in Windows 7 and later.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Integer} id Type: <b>UINT64</b>
     * 
     * Identifier for the existing IPsec SA context. This is the value returned in the <i>id</i> parameter by the call to  <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-ipsecsacontextcreate1">IPsecSaContextCreate1</a>.
     * @param {Pointer<IPSEC_SA_BUNDLE1>} outboundBundle Type: [IPSEC_SA_BUNDLE1](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_sa_bundle1)*</b>
     * 
     * The outbound IPsec SA bundle to be added to the SA context.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The IPsec SA bundle was successfully added to the SA context.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-ipsecsacontextaddoutbound1
     * @since windows6.1
     */
    static IPsecSaContextAddOutbound1(engineHandle, id, outboundBundle) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        result := DllCall("fwpuclnt.dll\IPsecSaContextAddOutbound1", "ptr", engineHandle, "uint", id, "ptr", outboundBundle, "uint")
        return result
    }

    /**
     * Indicates that an IPsec security association (SA) context should be expired.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Integer} id Type: <b>UINT64</b>
     * 
     * A runtime identifier for SA context. This identifier was received from the system when the application called <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-ipsecsacontextcreate0">IPsecSaContextCreate0</a>.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The IPsec SA context was successfully expired.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-ipsecsacontextexpire0
     * @since windows6.0.6000
     */
    static IPsecSaContextExpire0(engineHandle, id) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        result := DllCall("fwpuclnt.dll\IPsecSaContextExpire0", "ptr", engineHandle, "uint", id, "uint")
        return result
    }

    /**
     * Updates an IPsec security association (SA) context.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Integer} flags Type: <b>UINT32</b>
     * 
     * Flags indicating the specific field in the [IPSEC_SA_CONTEXT1](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_sa_context1) structure that is being updated.
     * 
     * Possible values:
     * 
     * <table>
     * <tr>
     * <th>IPsec SA flag</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IPSEC_SA_DETAILS_UPDATE_TRAFFIC"></a><a id="ipsec_sa_details_update_traffic"></a><dl>
     * <dt><b>IPSEC_SA_DETAILS_UPDATE_TRAFFIC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Updates the [IPSEC_SA_DETAILS1](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_sa_details1) structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IPSEC_SA_DETAILS_UPDATE_UDP_ENCAPSULATION"></a><a id="ipsec_sa_details_update_udp_encapsulation"></a><dl>
     * <dt><b>IPSEC_SA_DETAILS_UPDATE_UDP_ENCAPSULATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Updates the [IPSEC_SA_DETAILS1](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_sa_details1) structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IPSEC_SA_BUNDLE_UPDATE_FLAGS"></a><a id="ipsec_sa_bundle_update_flags"></a><dl>
     * <dt><b>IPSEC_SA_BUNDLE_UPDATE_FLAGS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Updates the [IPSEC_SA_BUNDLE1](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_sa_bundle1) structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IPSEC_SA_BUNDLE_UPDATE_NAP_CONTEXT"></a><a id="ipsec_sa_bundle_update_nap_context"></a><dl>
     * <dt><b>IPSEC_SA_BUNDLE_UPDATE_NAP_CONTEXT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Updates the [IPSEC_SA_BUNDLE1](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_sa_bundle1) structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IPSEC_SA_BUNDLE_UPDATE_KEY_MODULE_STATE"></a><a id="ipsec_sa_bundle_update_key_module_state"></a><dl>
     * <dt><b>IPSEC_SA_BUNDLE_UPDATE_KEY_MODULE_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Updates the [IPSEC_SA_BUNDLE1](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_sa_bundle1) structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IPSEC_SA_BUNDLE_UPDATE_PEER_V4_PRIVATE_ADDRESS"></a><a id="ipsec_sa_bundle_update_peer_v4_private_address"></a><dl>
     * <dt><b>IPSEC_SA_BUNDLE_UPDATE_PEER_V4_PRIVATE_ADDRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Updates the [IPSEC_SA_BUNDLE1](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_sa_bundle1) structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IPSEC_SA_BUNDLE_UPDATE_MM_SA_ID"></a><a id="ipsec_sa_bundle_update_mm_sa_id"></a><dl>
     * <dt><b>IPSEC_SA_BUNDLE_UPDATE_MM_SA_ID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Updates the [IPSEC_SA_BUNDLE1](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_sa_bundle1) structure.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<IPSEC_SA_CONTEXT1>} newValues Type: [IPSEC_SA_CONTEXT1](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_sa_context1)*</b>
     * 
     * An inbound and outbound SA pair.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The IPsec SA context was updated successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-ipsecsacontextupdate0
     * @since windows6.1
     */
    static IPsecSaContextUpdate0(engineHandle, flags, newValues) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        result := DllCall("fwpuclnt.dll\IPsecSaContextUpdate0", "ptr", engineHandle, "uint", flags, "ptr", newValues, "uint")
        return result
    }

    /**
     * Creates a handle used to enumerate a set of IPsec security association (SA) context objects.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Pointer<IPSEC_SA_CONTEXT_ENUM_TEMPLATE0>} enumTemplate Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_sa_context_enum_template0">IPSEC_SA_CONTEXT_ENUM_TEMPLATE0</a>*</b>
     * 
     * Template to selectively restrict the enumeration.
     * @param {Pointer<HANDLE>} enumHandle Type: <b>HANDLE*</b>
     * 
     * Address of a <b>HANDLE</b> variable. On function return, it contains the handle for SA context enumeration.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The enumerator was created successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-ipsecsacontextcreateenumhandle0
     * @since windows6.0.6000
     */
    static IPsecSaContextCreateEnumHandle0(engineHandle, enumTemplate, enumHandle) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        result := DllCall("fwpuclnt.dll\IPsecSaContextCreateEnumHandle0", "ptr", engineHandle, "ptr", enumTemplate, "ptr", enumHandle, "uint")
        return result
    }

    /**
     * Returns the next page of results from the IPsec security association (SA) context enumerator.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {HANDLE} enumHandle Type: <b>HANDLE</b>
     * 
     * Handle for an SA context enumeration returned by <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-ipsecsacontextcreateenumhandle0">IPsecSaContextCreateEnumHandle0</a>.
     * @param {Integer} numEntriesRequested Type: <b>UINT32</b>
     * 
     * Number of SA contexts requested.
     * @param {Pointer<Pointer<Pointer<IPSEC_SA_CONTEXT0>>>} entries Type: [IPSEC_SA_CONTEXT0](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_sa_context0)***</b>
     * 
     * Addresses of the enumeration entries.
     * @param {Pointer<Integer>} numEntriesReturned Type: <b>UINT32*</b>
     * 
     * The number of SA contexts returned.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The IPsec SA contexts were enumerated successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-ipsecsacontextenum0
     * @since windows6.0.6000
     */
    static IPsecSaContextEnum0(engineHandle, enumHandle, numEntriesRequested, entries, numEntriesReturned) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle
        enumHandle := enumHandle is Win32Handle ? NumGet(enumHandle, "ptr") : enumHandle

        entriesMarshal := entries is VarRef ? "ptr*" : "ptr"
        numEntriesReturnedMarshal := numEntriesReturned is VarRef ? "uint*" : "ptr"

        result := DllCall("fwpuclnt.dll\IPsecSaContextEnum0", "ptr", engineHandle, "ptr", enumHandle, "uint", numEntriesRequested, entriesMarshal, entries, numEntriesReturnedMarshal, numEntriesReturned, "uint")
        return result
    }

    /**
     * Returns the next page of results from the IPsec security association (SA) context enumerator.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {HANDLE} enumHandle Type: <b>HANDLE</b>
     * 
     * Handle for an SA context enumeration returned by <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-ipsecsacontextcreateenumhandle0">IPsecSaContextCreateEnumHandle0</a>.
     * @param {Integer} numEntriesRequested Type: <b>UINT32</b>
     * 
     * Number of SA contexts requested.
     * @param {Pointer<Pointer<Pointer<IPSEC_SA_CONTEXT1>>>} entries Type: [IPSEC_SA_CONTEXT1](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_sa_context1)***</b>
     * 
     * Addresses of the enumeration entries.
     * @param {Pointer<Integer>} numEntriesReturned Type: <b>UINT32*</b>
     * 
     * The number of SA contexts returned.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The IPsec SA contexts were enumerated successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-ipsecsacontextenum1
     * @since windows6.1
     */
    static IPsecSaContextEnum1(engineHandle, enumHandle, numEntriesRequested, entries, numEntriesReturned) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle
        enumHandle := enumHandle is Win32Handle ? NumGet(enumHandle, "ptr") : enumHandle

        entriesMarshal := entries is VarRef ? "ptr*" : "ptr"
        numEntriesReturnedMarshal := numEntriesReturned is VarRef ? "uint*" : "ptr"

        result := DllCall("fwpuclnt.dll\IPsecSaContextEnum1", "ptr", engineHandle, "ptr", enumHandle, "uint", numEntriesRequested, entriesMarshal, entries, numEntriesReturnedMarshal, numEntriesReturned, "uint")
        return result
    }

    /**
     * Frees a handle returned by IPsecSaContextCreateEnumHandle0.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {HANDLE} enumHandle Type: <b>HANDLE</b>
     * 
     * Handle of an IPsec security association (SA) context enumeration returned by <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-ipsecsacontextcreateenumhandle0">IPsecSaContextCreateEnumHandle0</a>.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The enumerator was successfully deleted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-ipsecsacontextdestroyenumhandle0
     * @since windows6.0.6000
     */
    static IPsecSaContextDestroyEnumHandle0(engineHandle, enumHandle) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle
        enumHandle := enumHandle is Win32Handle ? NumGet(enumHandle, "ptr") : enumHandle

        result := DllCall("fwpuclnt.dll\IPsecSaContextDestroyEnumHandle0", "ptr", engineHandle, "ptr", enumHandle, "uint")
        return result
    }

    /**
     * Is used to request the delivery of notifications regarding a particular IPsec security association (SA) context.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Pointer<IPSEC_SA_CONTEXT_SUBSCRIPTION0>} subscription Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_sa_context_subscription0">IPSEC_SA_CONTEXT_SUBSCRIPTION0</a>*</b>
     * 
     * The notifications which will be delivered.
     * @param {Pointer<IPSEC_SA_CONTEXT_CALLBACK0>} callback Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nc-fwpmu-ipsec_sa_context_callback0">IPSEC_SA_CONTEXT_CALLBACK0</a></b>
     * 
     * Function pointer that will be invoked when a notification is ready for delivery.
     * @param {Pointer<Void>} context Type: <b>void*</b>
     * 
     * Optional context pointer. This pointer is passed to the <i>callback</i> function along with details of the event.
     * @param {Pointer<HANDLE>} eventsHandle Type: <b>HANDLE*</b>
     * 
     * Handle to the newly created subscription.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The subscription was created successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-ipsecsacontextsubscribe0
     * @since windows8.0
     */
    static IPsecSaContextSubscribe0(engineHandle, subscription, callback, context, eventsHandle) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        contextMarshal := context is VarRef ? "ptr" : "ptr"

        result := DllCall("fwpuclnt.dll\IPsecSaContextSubscribe0", "ptr", engineHandle, "ptr", subscription, "ptr", callback, contextMarshal, context, "ptr", eventsHandle, "uint")
        return result
    }

    /**
     * Is used to cancel an IPsec security association (SA) change subscription and stop receiving change notifications.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {HANDLE} eventsHandle Type: <b>HANDLE</b>
     * 
     * Handle of the subscribed SA change notification. This is the returned handle from the call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-ipsecsacontextsubscribe0">IPsecSaContextSubscribe0</a>.
     * 
     * This may be <b>NULL</b>, in which case the function will have no effect.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The subscription was deleted successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-ipsecsacontextunsubscribe0
     * @since windows8.0
     */
    static IPsecSaContextUnsubscribe0(engineHandle, eventsHandle) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle
        eventsHandle := eventsHandle is Win32Handle ? NumGet(eventsHandle, "ptr") : eventsHandle

        result := DllCall("fwpuclnt.dll\IPsecSaContextUnsubscribe0", "ptr", engineHandle, "ptr", eventsHandle, "uint")
        return result
    }

    /**
     * Retrieves an array of all the current IPsec security association (SA) change notification subscriptions.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Pointer<Pointer<Pointer<IPSEC_SA_CONTEXT_SUBSCRIPTION0>>>} entries Type: <b><a href="https://docs.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_sa_context_subscription0">IPSEC_SA_CONTEXT_SUBSCRIPTION0</a>***</b>
     * 
     * The current IPsec SA notification subscriptions.
     * @param {Pointer<Integer>} numEntries Type: <b>UINT32*</b>
     * 
     * The number of entries returned.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The subscriptions were retrieved successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-ipsecsacontextsubscriptionsget0
     * @since windows8.0
     */
    static IPsecSaContextSubscriptionsGet0(engineHandle, entries, numEntries) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        entriesMarshal := entries is VarRef ? "ptr*" : "ptr"
        numEntriesMarshal := numEntries is VarRef ? "uint*" : "ptr"

        result := DllCall("fwpuclnt.dll\IPsecSaContextSubscriptionsGet0", "ptr", engineHandle, entriesMarshal, entries, numEntriesMarshal, numEntries, "uint")
        return result
    }

    /**
     * Creates a handle used to enumerate a set of Internet Protocol Security (IPsec) security association (SA) objects.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Pointer<IPSEC_SA_ENUM_TEMPLATE0>} enumTemplate Type: [IPSEC_SA_ENUM_TEMPLATE0](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_sa_enum_template0)*</b>
     * 
     * Template to selectively restrict the enumeration.
     * @param {Pointer<HANDLE>} enumHandle Type: <b>HANDLE*</b>
     * 
     * Handle of the newly created enumeration.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The enumeration was created successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-ipsecsacreateenumhandle0
     * @since windows6.0.6000
     */
    static IPsecSaCreateEnumHandle0(engineHandle, enumTemplate, enumHandle) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        result := DllCall("fwpuclnt.dll\IPsecSaCreateEnumHandle0", "ptr", engineHandle, "ptr", enumTemplate, "ptr", enumHandle, "uint")
        return result
    }

    /**
     * Returns the next page of results from the IPsec security association (SA) enumerator.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {HANDLE} enumHandle Type: <b>HANDLE</b>
     * 
     * Handle for an IPsec SA enumeration. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-ipsecsacreateenumhandle0">IPsecSaCreateEnumHandle0</a> to obtain an enumeration handle.
     * @param {Integer} numEntriesRequested Type: <b>UINT32</b>
     * 
     * The number of enumeration entries requested.
     * @param {Pointer<Pointer<Pointer<IPSEC_SA_DETAILS0>>>} entries Type: [IPSEC_SA_DETAILS0](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_sa_details0)***</b>
     * 
     * Addresses of the enumeration entries.
     * @param {Pointer<Integer>} numEntriesReturned Type: <b>UINT32*</b>
     * 
     * The number of enumeration entries returned.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The SAs were enumerated successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-ipsecsaenum0
     * @since windows6.0.6000
     */
    static IPsecSaEnum0(engineHandle, enumHandle, numEntriesRequested, entries, numEntriesReturned) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle
        enumHandle := enumHandle is Win32Handle ? NumGet(enumHandle, "ptr") : enumHandle

        entriesMarshal := entries is VarRef ? "ptr*" : "ptr"
        numEntriesReturnedMarshal := numEntriesReturned is VarRef ? "uint*" : "ptr"

        result := DllCall("fwpuclnt.dll\IPsecSaEnum0", "ptr", engineHandle, "ptr", enumHandle, "uint", numEntriesRequested, entriesMarshal, entries, numEntriesReturnedMarshal, numEntriesReturned, "uint")
        return result
    }

    /**
     * Returns the next page of results from the IPsec security association (SA) enumerator.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {HANDLE} enumHandle Type: <b>HANDLE</b>
     * 
     * Handle for an IPsec SA enumeration. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-ipsecsacreateenumhandle0">IPsecSaCreateEnumHandle0</a> to obtain an enumeration handle.
     * @param {Integer} numEntriesRequested Type: <b>UINT32</b>
     * 
     * The number of enumeration entries requested.
     * @param {Pointer<Pointer<Pointer<IPSEC_SA_DETAILS1>>>} entries Type: [IPSEC_SA_DETAILS1](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_sa_details1)***</b>
     * 
     * Addresses of the enumeration entries.
     * @param {Pointer<Integer>} numEntriesReturned Type: <b>UINT32*</b>
     * 
     * The number of enumeration entries returned.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The SAs were enumerated successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-ipsecsaenum1
     * @since windows6.1
     */
    static IPsecSaEnum1(engineHandle, enumHandle, numEntriesRequested, entries, numEntriesReturned) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle
        enumHandle := enumHandle is Win32Handle ? NumGet(enumHandle, "ptr") : enumHandle

        entriesMarshal := entries is VarRef ? "ptr*" : "ptr"
        numEntriesReturnedMarshal := numEntriesReturned is VarRef ? "uint*" : "ptr"

        result := DllCall("fwpuclnt.dll\IPsecSaEnum1", "ptr", engineHandle, "ptr", enumHandle, "uint", numEntriesRequested, entriesMarshal, entries, numEntriesReturnedMarshal, numEntriesReturned, "uint")
        return result
    }

    /**
     * Frees a handle returned by IPsecSaCreateEnumHandle0.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {HANDLE} enumHandle Type: <b>HANDLE</b>
     * 
     * Handle of the enumeration to destroy. Previously created by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-ipsecsacreateenumhandle0">IPsecSaCreateEnumHandle0</a>.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The enumeration was deleted successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-ipsecsadestroyenumhandle0
     * @since windows6.0.6000
     */
    static IPsecSaDestroyEnumHandle0(engineHandle, enumHandle) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle
        enumHandle := enumHandle is Win32Handle ? NumGet(enumHandle, "ptr") : enumHandle

        result := DllCall("fwpuclnt.dll\IPsecSaDestroyEnumHandle0", "ptr", engineHandle, "ptr", enumHandle, "uint")
        return result
    }

    /**
     * Retrieves a copy of the security descriptor for the IPsec security association (SA) database.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Integer} securityInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a></b>
     * 
     * The type of security information to retrieve.
     * @param {Pointer<PSID>} sidOwner Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">PSID</a>*</b>
     * 
     * The owner security identifier (SID) in the returned security descriptor.
     * @param {Pointer<PSID>} sidGroup Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">PSID</a>*</b>
     * 
     * The primary group security identifier (SID) in the returned security descriptor.
     * @param {Pointer<Pointer<ACL>>} dacl Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">PACL</a>*</b>
     * 
     * The discretionary access control list (DACL) in the returned security descriptor.
     * @param {Pointer<Pointer<ACL>>} sacl Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">PACL</a>*</b>
     * 
     * The system access control list (SACL) in the returned security descriptor.
     * @param {Pointer<PSECURITY_DESCRIPTOR>} securityDescriptor Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">PSECURITY_DESCRIPTOR</a>*</b>
     * 
     * The returned security descriptor.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The security descriptor was retrieved successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-ipsecsadbgetsecurityinfo0
     * @since windows6.0.6000
     */
    static IPsecSaDbGetSecurityInfo0(engineHandle, securityInfo, sidOwner, sidGroup, dacl, sacl, securityDescriptor) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        sidOwnerMarshal := sidOwner is VarRef ? "ptr*" : "ptr"
        sidGroupMarshal := sidGroup is VarRef ? "ptr*" : "ptr"
        daclMarshal := dacl is VarRef ? "ptr*" : "ptr"
        saclMarshal := sacl is VarRef ? "ptr*" : "ptr"

        result := DllCall("fwpuclnt.dll\IPsecSaDbGetSecurityInfo0", "ptr", engineHandle, "uint", securityInfo, sidOwnerMarshal, sidOwner, sidGroupMarshal, sidGroup, daclMarshal, dacl, saclMarshal, sacl, "ptr", securityDescriptor, "uint")
        return result
    }

    /**
     * Sets specified security information in the security descriptor of the IPsec security association database.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Integer} securityInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a></b>
     * 
     * The type of security information to set.
     * @param {Pointer<SID>} sidOwner Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a>*</b>
     * 
     * The owner's security identifier (SID) to be set in the security descriptor.
     * @param {Pointer<SID>} sidGroup Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a>*</b>
     * 
     * The group's SID to be set in the security descriptor.
     * @param {Pointer<ACL>} dacl Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a>*</b>
     * 
     * The discretionary access control list (DACL) to be set in the security descriptor.
     * @param {Pointer<ACL>} sacl Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a>*</b>
     * 
     * The system access control list (SACL) to be set in the security descriptor.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The security information was set successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-ipsecsadbsetsecurityinfo0
     * @since windows6.0.6000
     */
    static IPsecSaDbSetSecurityInfo0(engineHandle, securityInfo, sidOwner, sidGroup, dacl, sacl) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        result := DllCall("fwpuclnt.dll\IPsecSaDbSetSecurityInfo0", "ptr", engineHandle, "uint", securityInfo, "ptr", sidOwner, "ptr", sidGroup, "ptr", dacl, "ptr", sacl, "uint")
        return result
    }

    /**
     * The IPsecDospGetStatistics0 function retrieves Internet Protocol Security (IPsec) DoS Protection statistics.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Pointer<IPSEC_DOSP_STATISTICS0>} idpStatistics Type: [IPSEC_DOSP_STATISTICS0](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_dosp_statistics0)*</b>
     * 
     * Top-level object of IPsec DoS Protection statistics organization.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The IPsec DoS Protection statistics were  successfully returned.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-ipsecdospgetstatistics0
     * @since windows6.1
     */
    static IPsecDospGetStatistics0(engineHandle, idpStatistics) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        result := DllCall("fwpuclnt.dll\IPsecDospGetStatistics0", "ptr", engineHandle, "ptr", idpStatistics, "uint")
        return result
    }

    /**
     * Creates a handle used to enumerate a set of IPsec DoS Protection objects.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Pointer<IPSEC_DOSP_STATE_ENUM_TEMPLATE0>} enumTemplate Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_dosp_state_enum_template0">IPSEC_DOSP_STATE_ENUM_TEMPLATE0</a>*</b>
     * 
     * Template for selectively restricting the enumeration.
     * @param {Pointer<HANDLE>} enumHandle Type: <b>HANDLE*</b>
     * 
     * Address of a <b>HANDLE</b> variable. On function return, it contains the handle for the newly created enumeration.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The enumeration was created successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-ipsecdospstatecreateenumhandle0
     * @since windows6.1
     */
    static IPsecDospStateCreateEnumHandle0(engineHandle, enumTemplate, enumHandle) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        result := DllCall("fwpuclnt.dll\IPsecDospStateCreateEnumHandle0", "ptr", engineHandle, "ptr", enumTemplate, "ptr", enumHandle, "uint")
        return result
    }

    /**
     * Returns the next page of results from the IPsec DoS Protection state enumerator. Each IPsec DoS Protection state entry corresponds to a flow that has successfully passed the IPsec DoS Protection authentication checks.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {HANDLE} enumHandle Type: <b>HANDLE</b>
     * 
     * Handle for an IPsec DoS Protection enumeration. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-ipsecdospstatecreateenumhandle0">IPsecDospStateCreateEnumHandle0</a> to obtain an enumeration handle.
     * @param {Integer} numEntriesRequested Type: <b>UINT32</b>
     * 
     * The number of enumeration entries requested.
     * @param {Pointer<Pointer<Pointer<IPSEC_DOSP_STATE0>>>} entries Type: [IPSEC_DOSP_STATE0](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_dosp_state0)***</b>
     * 
     * Addresses of the enumeration entries.
     * @param {Pointer<Integer>} numEntries Type: <b>UINT32*</b>
     * 
     * The number of enumeration entries returned.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The results   were enumerated successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-ipsecdospstateenum0
     * @since windows6.1
     */
    static IPsecDospStateEnum0(engineHandle, enumHandle, numEntriesRequested, entries, numEntries) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle
        enumHandle := enumHandle is Win32Handle ? NumGet(enumHandle, "ptr") : enumHandle

        entriesMarshal := entries is VarRef ? "ptr*" : "ptr"
        numEntriesMarshal := numEntries is VarRef ? "uint*" : "ptr"

        result := DllCall("fwpuclnt.dll\IPsecDospStateEnum0", "ptr", engineHandle, "ptr", enumHandle, "uint", numEntriesRequested, entriesMarshal, entries, numEntriesMarshal, numEntries, "uint")
        return result
    }

    /**
     * Frees a handle returned by IPsecDospStateCreateEnumHandle0.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {HANDLE} enumHandle Type: <b>HANDLE</b>
     * 
     * Handle of the enumeration to destroy. Previously created by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-ipsecdospstatecreateenumhandle0">IPsecDospStateCreateEnumHandle0</a>.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The enumeration was deleted successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-ipsecdospstatedestroyenumhandle0
     * @since windows6.1
     */
    static IPsecDospStateDestroyEnumHandle0(engineHandle, enumHandle) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle
        enumHandle := enumHandle is Win32Handle ? NumGet(enumHandle, "ptr") : enumHandle

        result := DllCall("fwpuclnt.dll\IPsecDospStateDestroyEnumHandle0", "ptr", engineHandle, "ptr", enumHandle, "uint")
        return result
    }

    /**
     * Retrieves a copy of the security descriptor for the IPsec DoS Protection database.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Integer} securityInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a></b>
     * 
     * The type of security information to retrieve.
     * @param {Pointer<PSID>} sidOwner Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">PSID</a>*</b>
     * 
     * The owner security identifier (SID) in the returned security descriptor.
     * @param {Pointer<PSID>} sidGroup Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">PSID</a>*</b>
     * 
     * The primary group security identifier (SID) in the returned security descriptor.
     * @param {Pointer<Pointer<ACL>>} dacl Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">PACL</a>*</b>
     * 
     * The discretionary access control list (DACL) in the returned security descriptor.
     * @param {Pointer<Pointer<ACL>>} sacl Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">PACL</a>*</b>
     * 
     * The system access control list (SACL) in the returned security descriptor.
     * @param {Pointer<PSECURITY_DESCRIPTOR>} securityDescriptor Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">PSECURITY_DESCRIPTOR</a>*</b>
     * 
     * The returned security descriptor.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The security descriptor was retrieved successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-ipsecdospgetsecurityinfo0
     * @since windows6.1
     */
    static IPsecDospGetSecurityInfo0(engineHandle, securityInfo, sidOwner, sidGroup, dacl, sacl, securityDescriptor) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        sidOwnerMarshal := sidOwner is VarRef ? "ptr*" : "ptr"
        sidGroupMarshal := sidGroup is VarRef ? "ptr*" : "ptr"
        daclMarshal := dacl is VarRef ? "ptr*" : "ptr"
        saclMarshal := sacl is VarRef ? "ptr*" : "ptr"

        result := DllCall("fwpuclnt.dll\IPsecDospGetSecurityInfo0", "ptr", engineHandle, "uint", securityInfo, sidOwnerMarshal, sidOwner, sidGroupMarshal, sidGroup, daclMarshal, dacl, saclMarshal, sacl, "ptr", securityDescriptor, "uint")
        return result
    }

    /**
     * The IPsecDospSetSecurityInfo0 function sets specified security information in the security descriptor of the IPsec DoS Protection database.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Integer} securityInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a></b>
     * 
     * The type of security information to set.
     * @param {Pointer<SID>} sidOwner Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a>*</b>
     * 
     * The owner's security identifier (SID) to be set in the security descriptor.
     * @param {Pointer<SID>} sidGroup Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a>*</b>
     * 
     * The group's SID to be set in the security descriptor.
     * @param {Pointer<ACL>} dacl Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a>*</b>
     * 
     * The discretionary access control list (DACL) to be set in the security descriptor.
     * @param {Pointer<ACL>} sacl Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a>*</b>
     * 
     * The system access control list (SACL) to be set in the security descriptor.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The security information was set successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-ipsecdospsetsecurityinfo0
     * @since windows6.1
     */
    static IPsecDospSetSecurityInfo0(engineHandle, securityInfo, sidOwner, sidGroup, dacl, sacl) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        result := DllCall("fwpuclnt.dll\IPsecDospSetSecurityInfo0", "ptr", engineHandle, "uint", securityInfo, "ptr", sidOwner, "ptr", sidGroup, "ptr", dacl, "ptr", sacl, "uint")
        return result
    }

    /**
     * Registers a Trusted Intermediary Agent (TIA) with IPsec.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * A handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Pointer<IPSEC_KEY_MANAGER0>} keyManager Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_key_manager0">IPSEC_KEY_MANAGER0</a>*</b>
     * 
     * The set of key management callbacks which IPsec will invoke.
     * @param {Pointer<IPSEC_KEY_MANAGER_CALLBACKS0>} keyManagerCallbacks Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/ns-fwpmu-ipsec_key_manager_callbacks0">IPSEC_KEY_MANAGER_CALLBACKS0</a>*</b>
     * 
     * The set of callbacks which should be invoked by IPsec at various stages of SA negotiation.
     * @param {Pointer<HANDLE>} keyMgmtHandle Type: <b>HANDLE*</b>
     * 
     * Address of the newly created registration.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The TIA was successfully registered.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_ALREADY_EXISTS</b></dt>
     * <dt>0x80320009L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The TIA was not registered successfully because another TIA has already been registered to dictate keys.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_INVALID_INTERVAL</b></dt>
     * <dt>0x80320021L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The TIA was not registered successfully because <i>keyDictationTimeoutHint</i> exceeded the maximum allowed value of 10 seconds.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_CANNOT_INSTALL</b></dt>
     * <dt>0x80090307L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The TIA was not registered successfully because the binary image has not set the <b>IMAGE_DLLCHARACTERISTICS_FORCE_INTEGRITY</b> property.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-ipseckeymanageraddandregister0
     * @since windows8.0
     */
    static IPsecKeyManagerAddAndRegister0(engineHandle, keyManager, keyManagerCallbacks, keyMgmtHandle) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        result := DllCall("fwpuclnt.dll\IPsecKeyManagerAddAndRegister0", "ptr", engineHandle, "ptr", keyManager, "ptr", keyManagerCallbacks, "ptr", keyMgmtHandle, "uint")
        return result
    }

    /**
     * Unregisters a Trusted Intermediary Agent (TIA) which had previously been registered with IPsec.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * A handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {HANDLE} keyMgmtHandle Type: <b>HANDLE</b>
     * 
     * Address of the previously created registration.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The TIA was successfully unregistered.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-ipseckeymanagerunregisteranddelete0
     * @since windows8.0
     */
    static IPsecKeyManagerUnregisterAndDelete0(engineHandle, keyMgmtHandle) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle
        keyMgmtHandle := keyMgmtHandle is Win32Handle ? NumGet(keyMgmtHandle, "ptr") : keyMgmtHandle

        result := DllCall("fwpuclnt.dll\IPsecKeyManagerUnregisterAndDelete0", "ptr", engineHandle, "ptr", keyMgmtHandle, "uint")
        return result
    }

    /**
     * Returns a list of current Trusted Intermediary Agents (TIAs).
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * A handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Pointer<Pointer<Pointer<IPSEC_KEY_MANAGER0>>>} entries Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_key_manager0">IPSEC_KEY_MANAGER0</a>***</b>
     * 
     * All of the current TIAs.
     * @param {Pointer<Integer>} numEntries Type: <b>UINT32*</b>
     * 
     * The number of entries returned.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The list of current TIAs was successfully returned.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-ipseckeymanagersget0
     * @since windows8.0
     */
    static IPsecKeyManagersGet0(engineHandle, entries, numEntries) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        entriesMarshal := entries is VarRef ? "ptr*" : "ptr"
        numEntriesMarshal := numEntries is VarRef ? "uint*" : "ptr"

        result := DllCall("fwpuclnt.dll\IPsecKeyManagersGet0", "ptr", engineHandle, entriesMarshal, entries, numEntriesMarshal, numEntries, "uint")
        return result
    }

    /**
     * Retrieves a copy of the security descriptor that controls access to the key manager.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * A handle to an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Integer} securityInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a></b>
     * 
     * The type of security information to retrieve.
     * @param {Pointer<PSID>} sidOwner Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">PSID</a>*</b>
     * 
     * The owner security identifier (SID) in the returned security descriptor.
     * @param {Pointer<PSID>} sidGroup Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">PSID</a>*</b>
     * 
     * The primary group security identifier (SID) in the returned security descriptor.
     * @param {Pointer<Pointer<ACL>>} dacl Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">PACL</a>*</b>
     * 
     * The discretionary access control list (DACL) in the returned security descriptor.
     * @param {Pointer<Pointer<ACL>>} sacl Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">PACL</a>*</b>
     * 
     * The system access control list (SACL) in the returned security descriptor.
     * @param {Pointer<PSECURITY_DESCRIPTOR>} securityDescriptor Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">PSECURITY_DESCRIPTOR</a>*</b>
     * 
     * The returned security descriptor.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The security descriptor was successfully retrieved.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-ipseckeymanagergetsecurityinfobykey0
     * @since windows8.0
     */
    static IPsecKeyManagerGetSecurityInfoByKey0(engineHandle, securityInfo, sidOwner, sidGroup, dacl, sacl, securityDescriptor) {
        static reserved := 0 ;Reserved parameters must always be NULL

        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        sidOwnerMarshal := sidOwner is VarRef ? "ptr*" : "ptr"
        sidGroupMarshal := sidGroup is VarRef ? "ptr*" : "ptr"
        daclMarshal := dacl is VarRef ? "ptr*" : "ptr"
        saclMarshal := sacl is VarRef ? "ptr*" : "ptr"

        result := DllCall("fwpuclnt.dll\IPsecKeyManagerGetSecurityInfoByKey0", "ptr", engineHandle, "ptr", reserved, "uint", securityInfo, sidOwnerMarshal, sidOwner, sidGroupMarshal, sidGroup, daclMarshal, dacl, saclMarshal, sacl, "ptr", securityDescriptor, "uint")
        return result
    }

    /**
     * Sets specified security information in the security descriptor that controls access to the key manager.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * A handle to an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Integer} securityInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a></b>
     * 
     * The type of security information to set.
     * @param {Pointer<SID>} sidOwner Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a>*</b>
     * 
     * The owner's security identifier (SID) to be set in the security descriptor.
     * @param {Pointer<SID>} sidGroup Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a>*</b>
     * 
     * The group's SID to be set in the security descriptor.
     * @param {Pointer<ACL>} dacl Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a>*</b>
     * 
     * The discretionary access control list (DACL) to be set in the security descriptor.
     * @param {Pointer<ACL>} sacl Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a>*</b>
     * 
     * The system access control list (SACL) to be set in the security descriptor.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The security information was successfully set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-ipseckeymanagersetsecurityinfobykey0
     * @since windows8.0
     */
    static IPsecKeyManagerSetSecurityInfoByKey0(engineHandle, securityInfo, sidOwner, sidGroup, dacl, sacl) {
        static reserved := 0 ;Reserved parameters must always be NULL

        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        result := DllCall("fwpuclnt.dll\IPsecKeyManagerSetSecurityInfoByKey0", "ptr", engineHandle, "ptr", reserved, "uint", securityInfo, "ptr", sidOwner, "ptr", sidGroup, "ptr", dacl, "ptr", sacl, "uint")
        return result
    }

    /**
     * Retrieves Internet Key Exchange (IKE) and Authenticated Internet Protocol (AuthIP) statistics.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine generated by a previous  call to  <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a>.
     * @param {Pointer<IKEEXT_STATISTICS0>} ikeextStatistics Type: [IKEEXT_STATISTICS0](/windows/desktop/api/iketypes/ns-iketypes-ikeext_statistics0)*</b>
     * 
     * The top-level object of IKE/AuthIP statistics organization.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The information was retrieved successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-ikeextgetstatistics0
     * @since windows6.0.6000
     */
    static IkeextGetStatistics0(engineHandle, ikeextStatistics) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        result := DllCall("fwpuclnt.dll\IkeextGetStatistics0", "ptr", engineHandle, "ptr", ikeextStatistics, "uint")
        return result
    }

    /**
     * Retrieves Internet Key Exchange (IKE) and Authenticated Internet Protocol (AuthIP) statistics.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine generated by a previous  call to  <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a>.
     * @param {Pointer<IKEEXT_STATISTICS1>} ikeextStatistics Type: [IKEEXT_STATISTICS1](/windows/desktop/api/iketypes/ns-iketypes-ikeext_statistics1)*</b>
     * 
     * The top-level object of IKE/AuthIP statistics organization.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The information was retrieved successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-ikeextgetstatistics1
     * @since windows6.1
     */
    static IkeextGetStatistics1(engineHandle, ikeextStatistics) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        result := DllCall("fwpuclnt.dll\IkeextGetStatistics1", "ptr", engineHandle, "ptr", ikeextStatistics, "uint")
        return result
    }

    /**
     * The IkeextSaDeleteById0 function removes a security association (SA) from the database.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine generated by a previous  call to  <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a>.
     * @param {Integer} id Type: <b>UINT64</b>
     * 
     * The SA identifier.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The SA was removed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-ikeextsadeletebyid0
     * @since windows6.0.6000
     */
    static IkeextSaDeleteById0(engineHandle, id) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        result := DllCall("fwpuclnt.dll\IkeextSaDeleteById0", "ptr", engineHandle, "uint", id, "uint")
        return result
    }

    /**
     * Retrieves an IKE/AuthIP security association (SA) from the database.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Integer} id Type: <b>UINT64</b>
     * 
     * The SA identifier.
     * @param {Pointer<Pointer<IKEEXT_SA_DETAILS0>>} sa Type: [IKEEXT_SA_DETAILS0](/windows/desktop/api/iketypes/ns-iketypes-ikeext_sa_details0)**</b>
     * 
     * Address of the SA details.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The SA was retrieved successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-ikeextsagetbyid0
     * @since windows6.0.6000
     */
    static IkeextSaGetById0(engineHandle, id, sa) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        saMarshal := sa is VarRef ? "ptr*" : "ptr"

        result := DllCall("fwpuclnt.dll\IkeextSaGetById0", "ptr", engineHandle, "uint", id, saMarshal, sa, "uint")
        return result
    }

    /**
     * Retrieves an IKE/AuthIP security association (SA) from the database.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Integer} id Type: <b>UINT64</b>
     * 
     * The SA identifier.
     * @param {Pointer<Guid>} saLookupContext Type: <b>GUID*</b>
     * 
     * Optional pointer to the SA lookup context propagated from the SA to data connections flowing over that SA. It is made available to any application that queries socket security properties using the Winsock API <a href="https://docs.microsoft.com/windows/desktop/api/ws2tcpip/nf-ws2tcpip-wsaquerysocketsecurity">WSAQuerySocketSecurity</a> function, allowing the application to obtain detailed IPsec authentication information for its connection.
     * @param {Pointer<Pointer<IKEEXT_SA_DETAILS1>>} sa Type: [IKEEXT_SA_DETAILS1](/windows/desktop/api/iketypes/ns-iketypes-ikeext_sa_details1)**</b>
     * 
     * Address of the SA details.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The SA was retrieved successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-ikeextsagetbyid1
     * @since windows6.1
     */
    static IkeextSaGetById1(engineHandle, id, saLookupContext, sa) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        saMarshal := sa is VarRef ? "ptr*" : "ptr"

        result := DllCall("fwpuclnt.dll\IkeextSaGetById1", "ptr", engineHandle, "uint", id, "ptr", saLookupContext, saMarshal, sa, "uint")
        return result
    }

    /**
     * Retrieves an IKE/AuthIP security association (SA) from the database.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Integer} id Type: <b>UINT64</b>
     * 
     * The SA identifier.
     * @param {Pointer<Guid>} saLookupContext Type: <b>GUID*</b>
     * 
     * Optional pointer to the SA lookup context propagated from the SA to data connections flowing over that SA. It is made available to any application that queries socket security properties using the Winsock API <a href="https://docs.microsoft.com/windows/desktop/api/ws2tcpip/nf-ws2tcpip-wsaquerysocketsecurity">WSAQuerySocketSecurity</a> function, allowing the application to obtain detailed IPsec authentication information for its connection.
     * @param {Pointer<Pointer<IKEEXT_SA_DETAILS2>>} sa Type: [IKEEXT_SA_DETAILS2](/windows/desktop/api/iketypes/ns-iketypes-ikeext_sa_details2)**</b>
     * 
     * Address of the SA details.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The SA was retrieved successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-ikeextsagetbyid2
     * @since windows8.0
     */
    static IkeextSaGetById2(engineHandle, id, saLookupContext, sa) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        saMarshal := sa is VarRef ? "ptr*" : "ptr"

        result := DllCall("fwpuclnt.dll\IkeextSaGetById2", "ptr", engineHandle, "uint", id, "ptr", saLookupContext, saMarshal, sa, "uint")
        return result
    }

    /**
     * Creates a handle used to enumerate a set of Internet Key Exchange (IKE) and Authenticated Internet Protocol (AuthIP) security association (SA) objects.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine generated by a previous  call to  <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a>.
     * @param {Pointer<IKEEXT_SA_ENUM_TEMPLATE0>} enumTemplate Type: [IKEEXT_SA_ENUM_TEMPLATE0](/windows/desktop/api/iketypes/ns-iketypes-ikeext_sa_enum_template0)*</b>
     * 
     * Template for selectively restricting the enumeration.
     * @param {Pointer<HANDLE>} enumHandle Type: <b>HANDLE*</b>
     * 
     * Address of a <b>HANDLE</b> variable. On function return, it contains the handle of the newly created enumeration.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The enumeration was created successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-ikeextsacreateenumhandle0
     * @since windows6.0.6000
     */
    static IkeextSaCreateEnumHandle0(engineHandle, enumTemplate, enumHandle) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        result := DllCall("fwpuclnt.dll\IkeextSaCreateEnumHandle0", "ptr", engineHandle, "ptr", enumTemplate, "ptr", enumHandle, "uint")
        return result
    }

    /**
     * Returns the next page of results from the IKE/AuthIP security association (SA) enumerator.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {HANDLE} enumHandle Type: <b>HANDLE</b>
     * 
     * Handle for an IKE/AuthIP SA enumeration. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-ikeextsacreateenumhandle0">IkeextSaCreateEnumHandle0</a> to obtain an enumeration handle.
     * @param {Integer} numEntriesRequested Type: <b>UINT32</b>
     * 
     * Number of enumeration entries requested.
     * @param {Pointer<Pointer<Pointer<IKEEXT_SA_DETAILS0>>>} entries Type: [IKEEXT_SA_DETAILS0](/windows/desktop/api/iketypes/ns-iketypes-ikeext_sa_details0)***</b>
     * 
     * Addresses of the enumeration entries.
     * @param {Pointer<Integer>} numEntriesReturned Type: <b>UINT32*</b>
     * 
     * The number of enumeration entries returned.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The SAs were enumerated successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-ikeextsaenum0
     * @since windows6.0.6000
     */
    static IkeextSaEnum0(engineHandle, enumHandle, numEntriesRequested, entries, numEntriesReturned) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle
        enumHandle := enumHandle is Win32Handle ? NumGet(enumHandle, "ptr") : enumHandle

        entriesMarshal := entries is VarRef ? "ptr*" : "ptr"
        numEntriesReturnedMarshal := numEntriesReturned is VarRef ? "uint*" : "ptr"

        result := DllCall("fwpuclnt.dll\IkeextSaEnum0", "ptr", engineHandle, "ptr", enumHandle, "uint", numEntriesRequested, entriesMarshal, entries, numEntriesReturnedMarshal, numEntriesReturned, "uint")
        return result
    }

    /**
     * Returns the next page of results from the IKE/AuthIP security association (SA) enumerator.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {HANDLE} enumHandle Type: <b>HANDLE</b>
     * 
     * Handle for an IKE/AuthIP SA enumeration. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-ikeextsacreateenumhandle0">IkeextSaCreateEnumHandle0</a> to obtain an enumeration handle.
     * @param {Integer} numEntriesRequested Type: <b>UINT32</b>
     * 
     * Number of enumeration entries requested.
     * @param {Pointer<Pointer<Pointer<IKEEXT_SA_DETAILS1>>>} entries Type: [IKEEXT_SA_DETAILS1](/windows/desktop/api/iketypes/ns-iketypes-ikeext_sa_details1)***</b>
     * 
     * Addresses of the enumeration entries.
     * @param {Pointer<Integer>} numEntriesReturned Type: <b>UINT32*</b>
     * 
     * The number of enumeration entries returned.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The SAs were enumerated successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-ikeextsaenum1
     * @since windows6.1
     */
    static IkeextSaEnum1(engineHandle, enumHandle, numEntriesRequested, entries, numEntriesReturned) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle
        enumHandle := enumHandle is Win32Handle ? NumGet(enumHandle, "ptr") : enumHandle

        entriesMarshal := entries is VarRef ? "ptr*" : "ptr"
        numEntriesReturnedMarshal := numEntriesReturned is VarRef ? "uint*" : "ptr"

        result := DllCall("fwpuclnt.dll\IkeextSaEnum1", "ptr", engineHandle, "ptr", enumHandle, "uint", numEntriesRequested, entriesMarshal, entries, numEntriesReturnedMarshal, numEntriesReturned, "uint")
        return result
    }

    /**
     * Returns the next page of results from the IKE/AuthIP security association (SA) enumerator.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {HANDLE} enumHandle Type: <b>HANDLE</b>
     * 
     * Handle for an IKE/AuthIP SA enumeration. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-ikeextsacreateenumhandle0">IkeextSaCreateEnumHandle0</a> to obtain an enumeration handle.
     * @param {Integer} numEntriesRequested Type: <b>UINT32</b>
     * 
     * Number of enumeration entries requested.
     * @param {Pointer<Pointer<Pointer<IKEEXT_SA_DETAILS2>>>} entries Type: [IKEEXT_SA_DETAILS2](/windows/desktop/api/iketypes/ns-iketypes-ikeext_sa_details2)***</b>
     * 
     * Addresses of the enumeration entries.
     * @param {Pointer<Integer>} numEntriesReturned Type: <b>UINT32*</b>
     * 
     * The number of enumeration entries returned.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The SAs were enumerated successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-ikeextsaenum2
     * @since windows8.0
     */
    static IkeextSaEnum2(engineHandle, enumHandle, numEntriesRequested, entries, numEntriesReturned) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle
        enumHandle := enumHandle is Win32Handle ? NumGet(enumHandle, "ptr") : enumHandle

        entriesMarshal := entries is VarRef ? "ptr*" : "ptr"
        numEntriesReturnedMarshal := numEntriesReturned is VarRef ? "uint*" : "ptr"

        result := DllCall("fwpuclnt.dll\IkeextSaEnum2", "ptr", engineHandle, "ptr", enumHandle, "uint", numEntriesRequested, entriesMarshal, entries, numEntriesReturnedMarshal, numEntriesReturned, "uint")
        return result
    }

    /**
     * Frees a handle returned by IkeextSaCreateEnumHandle0.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine generated by a previous  call to  <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a>.
     * @param {HANDLE} enumHandle Type: <b>HANDLE</b>
     * 
     * Handle of the enumeration to destroy. Previously created by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-ikeextsacreateenumhandle0">IkeextSaCreateEnumHandle0</a>.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The enumeration was deleted successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-ikeextsadestroyenumhandle0
     * @since windows6.0.6000
     */
    static IkeextSaDestroyEnumHandle0(engineHandle, enumHandle) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle
        enumHandle := enumHandle is Win32Handle ? NumGet(enumHandle, "ptr") : enumHandle

        result := DllCall("fwpuclnt.dll\IkeextSaDestroyEnumHandle0", "ptr", engineHandle, "ptr", enumHandle, "uint")
        return result
    }

    /**
     * The IkeextSaDbGetSecurityInfo0 function retrieves a copy of the security descriptor for a security association (SA) database.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine generated by a previous  call to  <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a>.
     * @param {Integer} securityInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a></b>
     * 
     * The type of security information to retrieve.
     * @param {Pointer<PSID>} sidOwner Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">PSID</a>*</b>
     * 
     * The owner security identifier (SID) in the returned security descriptor.
     * @param {Pointer<PSID>} sidGroup Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">PSID</a>*</b>
     * 
     * The primary group security identifier (SID) in the returned security descriptor.
     * @param {Pointer<Pointer<ACL>>} dacl Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">PACL</a>*</b>
     * 
     * The discretionary access control list (DACL) in the returned security descriptor.
     * @param {Pointer<Pointer<ACL>>} sacl Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">PACL</a>*</b>
     * 
     * The system access control list (SACL) in the returned security descriptor.
     * @param {Pointer<PSECURITY_DESCRIPTOR>} securityDescriptor Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">PSECURITY_DESCRIPTOR</a>*</b>
     * 
     * The returned security descriptor.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The security descriptor was retrieved successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-ikeextsadbgetsecurityinfo0
     * @since windows6.0.6000
     */
    static IkeextSaDbGetSecurityInfo0(engineHandle, securityInfo, sidOwner, sidGroup, dacl, sacl, securityDescriptor) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        sidOwnerMarshal := sidOwner is VarRef ? "ptr*" : "ptr"
        sidGroupMarshal := sidGroup is VarRef ? "ptr*" : "ptr"
        daclMarshal := dacl is VarRef ? "ptr*" : "ptr"
        saclMarshal := sacl is VarRef ? "ptr*" : "ptr"

        result := DllCall("fwpuclnt.dll\IkeextSaDbGetSecurityInfo0", "ptr", engineHandle, "uint", securityInfo, sidOwnerMarshal, sidOwner, sidGroupMarshal, sidGroup, daclMarshal, dacl, saclMarshal, sacl, "ptr", securityDescriptor, "uint")
        return result
    }

    /**
     * The IkeextSaDbSetSecurityInfo0 function sets specified security information in the security descriptor of the IKE/AuthIP security association database.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine generated by a previous  call to  <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a>.
     * @param {Integer} securityInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a></b>
     * 
     * The type of security information to set.
     * @param {Pointer<SID>} sidOwner Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a>*</b>
     * 
     * The owner's security identifier (SID) to be set in the security descriptor.
     * @param {Pointer<SID>} sidGroup Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a>*</b>
     * 
     * The group's SID to be set in the security descriptor.
     * @param {Pointer<ACL>} dacl Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a>*</b>
     * 
     * The discretionary access control list (DACL) to be set in the security descriptor.
     * @param {Pointer<ACL>} sacl Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a>*</b>
     * 
     * The system access control list (SACL) to be set in the security descriptor.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The security information was set successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-ikeextsadbsetsecurityinfo0
     * @since windows6.0.6000
     */
    static IkeextSaDbSetSecurityInfo0(engineHandle, securityInfo, sidOwner, sidGroup, dacl, sacl) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        result := DllCall("fwpuclnt.dll\IkeextSaDbSetSecurityInfo0", "ptr", engineHandle, "uint", securityInfo, "ptr", sidOwner, "ptr", sidGroup, "ptr", dacl, "ptr", sacl, "uint")
        return result
    }

    /**
     * Creates a handle used to enumerate a set of network events.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Pointer<FWPM_NET_EVENT_ENUM_TEMPLATE0>} enumTemplate Type: [FWPM_NET_EVENT_ENUM_TEMPLATE0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_net_event_enum_template0)*</b>
     * 
     *   Template to selectively restrict the enumeration.
     * @param {Pointer<HANDLE>} enumHandle Type: <b>HANDLE*</b>
     * 
     * The handle for network event enumeration.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The enumerator was created successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmneteventcreateenumhandle0
     * @since windows6.0.6000
     */
    static FwpmNetEventCreateEnumHandle0(engineHandle, enumTemplate, enumHandle) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        result := DllCall("fwpuclnt.dll\FwpmNetEventCreateEnumHandle0", "ptr", engineHandle, "ptr", enumTemplate, "ptr", enumHandle, "uint")
        return result
    }

    /**
     * Returns the next page of results from the network event enumerator.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {HANDLE} enumHandle Type: <b>HANDLE</b>
     * 
     * Handle for a network event enumeration created by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmneteventcreateenumhandle0">FwpmNetEventCreateEnumHandle0</a>.
     * @param {Integer} numEntriesRequested Type: <b>UINT32</b>
     * 
     * The number of enumeration entries requested.
     * @param {Pointer<Pointer<Pointer<FWPM_NET_EVENT0>>>} entries Type: [FWPM_NET_EVENT0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_net_event0)***</b>
     * 
     * Addresses of enumeration entries.
     * @param {Pointer<Integer>} numEntriesReturned Type: <b>UINT32*</b>
     * 
     * The number of enumeration entries returned.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network events were enumerated successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_NET_EVENTS_DISABLED</b></dt>
     * <dt>0x80320013</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The collection of network diagnostic events is disabled.
     * Call <a href="/windows/desktop/api/fwpmu/nf-fwpmu-fwpmenginesetoption0">FwpmEngineSetOption0</a> to enable it.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmneteventenum0
     * @since windows6.0.6000
     */
    static FwpmNetEventEnum0(engineHandle, enumHandle, numEntriesRequested, entries, numEntriesReturned) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle
        enumHandle := enumHandle is Win32Handle ? NumGet(enumHandle, "ptr") : enumHandle

        entriesMarshal := entries is VarRef ? "ptr*" : "ptr"
        numEntriesReturnedMarshal := numEntriesReturned is VarRef ? "uint*" : "ptr"

        result := DllCall("fwpuclnt.dll\FwpmNetEventEnum0", "ptr", engineHandle, "ptr", enumHandle, "uint", numEntriesRequested, entriesMarshal, entries, numEntriesReturnedMarshal, numEntriesReturned, "uint")
        return result
    }

    /**
     * Returns the next page of results from the network event enumerator.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {HANDLE} enumHandle Type: <b>HANDLE</b>
     * 
     * Handle for a network event enumeration created by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmneteventcreateenumhandle0">FwpmNetEventCreateEnumHandle0</a>.
     * @param {Integer} numEntriesRequested Type: <b>UINT32</b>
     * 
     * The nmber of enumeration entries requested.
     * @param {Pointer<Pointer<Pointer<FWPM_NET_EVENT1>>>} entries Type: [FWPM_NET_EVENT1](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_net_event1)***</b>
     * 
     * Addresses of enumeration entries.
     * @param {Pointer<Integer>} numEntriesReturned Type: <b>UINT32*</b>
     * 
     * The number of enumeration entries returned.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network events were enumerated successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_NET_EVENTS_DISABLED</b></dt>
     * <dt>0x80320013</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The collection of network diagnostic events is disabled.
     * Call <a href="/windows/desktop/api/fwpmu/nf-fwpmu-fwpmenginesetoption0">FwpmEngineSetOption0</a> to enable it.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmneteventenum1
     * @since windows6.1
     */
    static FwpmNetEventEnum1(engineHandle, enumHandle, numEntriesRequested, entries, numEntriesReturned) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle
        enumHandle := enumHandle is Win32Handle ? NumGet(enumHandle, "ptr") : enumHandle

        entriesMarshal := entries is VarRef ? "ptr*" : "ptr"
        numEntriesReturnedMarshal := numEntriesReturned is VarRef ? "uint*" : "ptr"

        result := DllCall("fwpuclnt.dll\FwpmNetEventEnum1", "ptr", engineHandle, "ptr", enumHandle, "uint", numEntriesRequested, entriesMarshal, entries, numEntriesReturnedMarshal, numEntriesReturned, "uint")
        return result
    }

    /**
     * Returns the next page of results from the network event enumerator.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {HANDLE} enumHandle Type: <b>HANDLE</b>
     * 
     * Handle for a network event enumeration created by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmneteventcreateenumhandle0">FwpmNetEventCreateEnumHandle0</a>.
     * @param {Integer} numEntriesRequested Type: <b>UINT32</b>
     * 
     * The number of enumeration entries requested.
     * @param {Pointer<Pointer<Pointer<FWPM_NET_EVENT2>>>} entries Type: [FWPM_NET_EVENT2](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_net_event2)***</b>
     * 
     * Addresses of enumeration entries.
     * @param {Pointer<Integer>} numEntriesReturned Type: <b>UINT32*</b>
     * 
     * The number of enumeration entries returned.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network events were enumerated successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_NET_EVENTS_DISABLED</b></dt>
     * <dt>0x80320013</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The collection of network diagnostic events is disabled.
     * Call <a href="/windows/desktop/api/fwpmu/nf-fwpmu-fwpmenginesetoption0">FwpmEngineSetOption0</a> to enable it.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmneteventenum2
     * @since windows8.0
     */
    static FwpmNetEventEnum2(engineHandle, enumHandle, numEntriesRequested, entries, numEntriesReturned) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle
        enumHandle := enumHandle is Win32Handle ? NumGet(enumHandle, "ptr") : enumHandle

        entriesMarshal := entries is VarRef ? "ptr*" : "ptr"
        numEntriesReturnedMarshal := numEntriesReturned is VarRef ? "uint*" : "ptr"

        result := DllCall("fwpuclnt.dll\FwpmNetEventEnum2", "ptr", engineHandle, "ptr", enumHandle, "uint", numEntriesRequested, entriesMarshal, entries, numEntriesReturnedMarshal, numEntriesReturned, "uint")
        return result
    }

    /**
     * Returns the next page of results from the network event enumerator.
     * @param {HANDLE} engineHandle Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {HANDLE} enumHandle Handle for a network event enumeration created by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmneteventcreateenumhandle0">FwpmNetEventCreateEnumHandle0</a>.
     * @param {Integer} numEntriesRequested The number of enumeration entries requested.
     * @param {Pointer<Pointer<Pointer<FWPM_NET_EVENT3>>>} entries Addresses of enumeration entries.
     * @param {Pointer<Integer>} numEntriesReturned The number of enumeration entries returned.
     * @returns {Integer} <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network events were enumerated successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_NET_EVENTS_DISABLED</b></dt>
     * <dt>0x80320013</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The collection of network diagnostic events is disabled.
     * Call <a href="/windows/desktop/api/fwpmu/nf-fwpmu-fwpmenginesetoption0">FwpmEngineSetOption0</a> to enable it.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmneteventenum3
     * @since windows10.0.14393
     */
    static FwpmNetEventEnum3(engineHandle, enumHandle, numEntriesRequested, entries, numEntriesReturned) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle
        enumHandle := enumHandle is Win32Handle ? NumGet(enumHandle, "ptr") : enumHandle

        entriesMarshal := entries is VarRef ? "ptr*" : "ptr"
        numEntriesReturnedMarshal := numEntriesReturned is VarRef ? "uint*" : "ptr"

        result := DllCall("fwpuclnt.dll\FwpmNetEventEnum3", "ptr", engineHandle, "ptr", enumHandle, "uint", numEntriesRequested, entriesMarshal, entries, numEntriesReturnedMarshal, numEntriesReturned, "uint")
        return result
    }

    /**
     * 
     * @param {HANDLE} engineHandle 
     * @param {HANDLE} enumHandle 
     * @param {Integer} numEntriesRequested 
     * @param {Pointer<Pointer<Pointer<FWPM_NET_EVENT4>>>} entries 
     * @param {Pointer<Integer>} numEntriesReturned 
     * @returns {Integer} 
     */
    static FwpmNetEventEnum4(engineHandle, enumHandle, numEntriesRequested, entries, numEntriesReturned) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle
        enumHandle := enumHandle is Win32Handle ? NumGet(enumHandle, "ptr") : enumHandle

        entriesMarshal := entries is VarRef ? "ptr*" : "ptr"
        numEntriesReturnedMarshal := numEntriesReturned is VarRef ? "uint*" : "ptr"

        result := DllCall("fwpuclnt.dll\FwpmNetEventEnum4", "ptr", engineHandle, "ptr", enumHandle, "uint", numEntriesRequested, entriesMarshal, entries, numEntriesReturnedMarshal, numEntriesReturned, "uint")
        return result
    }

    /**
     * 
     * @param {HANDLE} engineHandle 
     * @param {HANDLE} enumHandle 
     * @param {Integer} numEntriesRequested 
     * @param {Pointer<Pointer<Pointer<FWPM_NET_EVENT5>>>} entries 
     * @param {Pointer<Integer>} numEntriesReturned 
     * @returns {Integer} 
     */
    static FwpmNetEventEnum5(engineHandle, enumHandle, numEntriesRequested, entries, numEntriesReturned) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle
        enumHandle := enumHandle is Win32Handle ? NumGet(enumHandle, "ptr") : enumHandle

        entriesMarshal := entries is VarRef ? "ptr*" : "ptr"
        numEntriesReturnedMarshal := numEntriesReturned is VarRef ? "uint*" : "ptr"

        result := DllCall("fwpuclnt.dll\FwpmNetEventEnum5", "ptr", engineHandle, "ptr", enumHandle, "uint", numEntriesRequested, entriesMarshal, entries, numEntriesReturnedMarshal, numEntriesReturned, "uint")
        return result
    }

    /**
     * Frees a handle returned by FwpmNetEventCreateEnumHandle0.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {HANDLE} enumHandle Type: <b>HANDLE</b>
     * 
     * Handle of a network event enumeration created by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmneteventcreateenumhandle0">FwpmNetEventCreateEnumHandle0</a>.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The enumerator was successfully deleted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmneteventdestroyenumhandle0
     * @since windows6.0.6000
     */
    static FwpmNetEventDestroyEnumHandle0(engineHandle, enumHandle) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle
        enumHandle := enumHandle is Win32Handle ? NumGet(enumHandle, "ptr") : enumHandle

        result := DllCall("fwpuclnt.dll\FwpmNetEventDestroyEnumHandle0", "ptr", engineHandle, "ptr", enumHandle, "uint")
        return result
    }

    /**
     * The FwpmNetEventsGetSecurityInfo0 function retrieves a copy of the security descriptor for a network event object.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Integer} securityInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a></b>
     * 
     * The type of security information to retrieve.
     * 
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a></b>
     * 
     * The type of security information to retrieve.
     * @param {Pointer<PSID>} sidOwner Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">PSID</a>*</b>
     * 
     * The owner security identifier (SID) in the returned security descriptor.
     * @param {Pointer<PSID>} sidGroup Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">PSID</a>*</b>
     * 
     * The primary group security identifier (SID) in the returned security descriptor.
     * @param {Pointer<Pointer<ACL>>} dacl Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">PACL</a>*</b>
     * 
     * The discretionary access control list (DACL) in the returned security descriptor.
     * @param {Pointer<Pointer<ACL>>} sacl Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">PACL</a>*</b>
     * 
     * The system access control list (SACL) in the returned security descriptor.
     * @param {Pointer<PSECURITY_DESCRIPTOR>} securityDescriptor Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">PSECURITY_DESCRIPTOR</a>*</b>
     * 
     * The returned security descriptor.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The security descriptor was retrieved successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmneteventsgetsecurityinfo0
     * @since windows6.0.6000
     */
    static FwpmNetEventsGetSecurityInfo0(engineHandle, securityInfo, sidOwner, sidGroup, dacl, sacl, securityDescriptor) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        sidOwnerMarshal := sidOwner is VarRef ? "ptr*" : "ptr"
        sidGroupMarshal := sidGroup is VarRef ? "ptr*" : "ptr"
        daclMarshal := dacl is VarRef ? "ptr*" : "ptr"
        saclMarshal := sacl is VarRef ? "ptr*" : "ptr"

        result := DllCall("fwpuclnt.dll\FwpmNetEventsGetSecurityInfo0", "ptr", engineHandle, "uint", securityInfo, sidOwnerMarshal, sidOwner, sidGroupMarshal, sidGroup, daclMarshal, dacl, saclMarshal, sacl, "ptr", securityDescriptor, "uint")
        return result
    }

    /**
     * Sets specified security information in the security descriptor of a network event object.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Integer} securityInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a></b>
     * 
     * The type of security information to set.
     * @param {Pointer<SID>} sidOwner Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a>*</b>
     * 
     * The owner's security identifier (SID) to be set in the security descriptor.
     * @param {Pointer<SID>} sidGroup Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a>*</b>
     * 
     * The group's SID to be set in the security descriptor.
     * @param {Pointer<ACL>} dacl Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a>*</b>
     * 
     * The discretionary access control list (DACL) to be set in the security descriptor.
     * @param {Pointer<ACL>} sacl Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a>*</b>
     * 
     * The system access control list (SACL) to be set in the security descriptor.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The security descriptor was set successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmneteventssetsecurityinfo0
     * @since windows6.0.6000
     */
    static FwpmNetEventsSetSecurityInfo0(engineHandle, securityInfo, sidOwner, sidGroup, dacl, sacl) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        result := DllCall("fwpuclnt.dll\FwpmNetEventsSetSecurityInfo0", "ptr", engineHandle, "uint", securityInfo, "ptr", sidOwner, "ptr", sidGroup, "ptr", dacl, "ptr", sacl, "uint")
        return result
    }

    /**
     * Is used to request the delivery of notifications regarding a particular net event.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Pointer<FWPM_NET_EVENT_SUBSCRIPTION0>} subscription Type: [FWPM_NET_EVENT_SUBSCRIPTION0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_net_event_subscription0)*</b>
     * 
     * The notifications which will be delivered.
     * @param {Pointer<FWPM_NET_EVENT_CALLBACK0>} callback Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nc-fwpmu-fwpm_net_event_callback0">FWPM_NET_EVENT_CALLBACK0</a></b>
     * 
     * Function pointer that will be invoked when a notification is ready for delivery.
     * @param {Pointer<Void>} context Type: <b>void*</b>
     * 
     * Optional context pointer. This pointer is passed to the <i>callback</i> function along with details of the event.
     * @param {Pointer<HANDLE>} eventsHandle Type: <b>HANDLE*</b>
     * 
     * Handle to the newly created subscription.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The subscription was created successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmneteventsubscribe0
     * @since windows6.1
     */
    static FwpmNetEventSubscribe0(engineHandle, subscription, callback, context, eventsHandle) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        contextMarshal := context is VarRef ? "ptr" : "ptr"

        result := DllCall("fwpuclnt.dll\FwpmNetEventSubscribe0", "ptr", engineHandle, "ptr", subscription, "ptr", callback, contextMarshal, context, "ptr", eventsHandle, "uint")
        return result
    }

    /**
     * Is used to cancel a net event subscription and stop receiving notifications.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {HANDLE} eventsHandle Type: <b>HANDLE</b>
     * 
     * Handle of the subscribed event notification. This is the returned handle from the call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmneteventsubscribe0">FwpmNetEventSubscribe0</a>.
     * 
     * This may be <b>NULL</b>, in which case the function will have no effect.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The subscription was deleted successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmneteventunsubscribe0
     * @since windows6.1
     */
    static FwpmNetEventUnsubscribe0(engineHandle, eventsHandle) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle
        eventsHandle := eventsHandle is Win32Handle ? NumGet(eventsHandle, "ptr") : eventsHandle

        result := DllCall("fwpuclnt.dll\FwpmNetEventUnsubscribe0", "ptr", engineHandle, "ptr", eventsHandle, "uint")
        return result
    }

    /**
     * Retrieves an array of all the current net event notification subscriptions.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Pointer<Pointer<Pointer<FWPM_NET_EVENT_SUBSCRIPTION0>>>} entries Type: [FWPM_NET_EVENT_SUBSCRIPTION0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_net_event_subscription0)***</b>
     * 
     * The current net event notification subscriptions.
     * @param {Pointer<Integer>} numEntries Type: <b>UINT32*</b>
     * 
     * The number of entries returned.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The subscriptions were retrieved successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmneteventsubscriptionsget0
     * @since windows6.1
     */
    static FwpmNetEventSubscriptionsGet0(engineHandle, entries, numEntries) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        entriesMarshal := entries is VarRef ? "ptr*" : "ptr"
        numEntriesMarshal := numEntries is VarRef ? "uint*" : "ptr"

        result := DllCall("fwpuclnt.dll\FwpmNetEventSubscriptionsGet0", "ptr", engineHandle, entriesMarshal, entries, numEntriesMarshal, numEntries, "uint")
        return result
    }

    /**
     * Is used to request the delivery of notifications regarding a particular net event.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Pointer<FWPM_NET_EVENT_SUBSCRIPTION0>} subscription Type: [FWPM_NET_EVENT_SUBSCRIPTION0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_net_event_subscription0)*</b>
     * 
     * The notifications which will be delivered.
     * @param {Pointer<FWPM_NET_EVENT_CALLBACK1>} callback Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nc-fwpmu-fwpm_net_event_callback1">FWPM_NET_EVENT_CALLBACK1</a></b>
     * 
     * Function pointer that will be invoked when a notification is ready for delivery.
     * @param {Pointer<Void>} context Type: <b>void*</b>
     * 
     * Optional context pointer. This pointer is passed to the <i>callback</i> function along with details of the event.
     * @param {Pointer<HANDLE>} eventsHandle Type: <b>HANDLE*</b>
     * 
     * Handle to the newly created subscription.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The subscription was created successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmneteventsubscribe1
     * @since windows8.0
     */
    static FwpmNetEventSubscribe1(engineHandle, subscription, callback, context, eventsHandle) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        contextMarshal := context is VarRef ? "ptr" : "ptr"

        result := DllCall("fwpuclnt.dll\FwpmNetEventSubscribe1", "ptr", engineHandle, "ptr", subscription, "ptr", callback, contextMarshal, context, "ptr", eventsHandle, "uint")
        return result
    }

    /**
     * Is used to request the delivery of notifications regarding a particular net event.
     * @param {HANDLE} engineHandle Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Pointer<FWPM_NET_EVENT_SUBSCRIPTION0>} subscription The notifications which will be delivered.
     * @param {Pointer<FWPM_NET_EVENT_CALLBACK2>} callback Function pointer that will be invoked when a notification is ready for delivery.
     * @param {Pointer<Void>} context Optional context pointer. This pointer is passed to the <i>callback</i> function along with details of the event.
     * @param {Pointer<HANDLE>} eventsHandle Handle to the newly created subscription.
     * @returns {Integer} <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The subscription was created successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmneteventsubscribe2
     * @since windows10.0.14393
     */
    static FwpmNetEventSubscribe2(engineHandle, subscription, callback, context, eventsHandle) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        contextMarshal := context is VarRef ? "ptr" : "ptr"

        result := DllCall("fwpuclnt.dll\FwpmNetEventSubscribe2", "ptr", engineHandle, "ptr", subscription, "ptr", callback, contextMarshal, context, "ptr", eventsHandle, "uint")
        return result
    }

    /**
     * 
     * @param {HANDLE} engineHandle 
     * @param {Pointer<FWPM_NET_EVENT_SUBSCRIPTION0>} subscription 
     * @param {Pointer<FWPM_NET_EVENT_CALLBACK3>} callback 
     * @param {Pointer<Void>} context 
     * @param {Pointer<HANDLE>} eventsHandle 
     * @returns {Integer} 
     */
    static FwpmNetEventSubscribe3(engineHandle, subscription, callback, context, eventsHandle) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        contextMarshal := context is VarRef ? "ptr" : "ptr"

        result := DllCall("fwpuclnt.dll\FwpmNetEventSubscribe3", "ptr", engineHandle, "ptr", subscription, "ptr", callback, contextMarshal, context, "ptr", eventsHandle, "uint")
        return result
    }

    /**
     * 
     * @param {HANDLE} engineHandle 
     * @param {Pointer<FWPM_NET_EVENT_SUBSCRIPTION0>} subscription 
     * @param {Pointer<FWPM_NET_EVENT_CALLBACK4>} callback 
     * @param {Pointer<Void>} context 
     * @param {Pointer<HANDLE>} eventsHandle 
     * @returns {Integer} 
     */
    static FwpmNetEventSubscribe4(engineHandle, subscription, callback, context, eventsHandle) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        contextMarshal := context is VarRef ? "ptr" : "ptr"

        result := DllCall("fwpuclnt.dll\FwpmNetEventSubscribe4", "ptr", engineHandle, "ptr", subscription, "ptr", callback, contextMarshal, context, "ptr", eventsHandle, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} flags 
     * @param {Pointer<FWPM_DYNAMIC_KEYWORD_CALLBACK0>} callback 
     * @param {Pointer<Void>} context 
     * @param {Pointer<HANDLE>} subscriptionHandle 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmdynamickeywordsubscribe0
     */
    static FwpmDynamicKeywordSubscribe0(flags, callback, context, subscriptionHandle) {
        contextMarshal := context is VarRef ? "ptr" : "ptr"

        result := DllCall("fwpuclnt.dll\FwpmDynamicKeywordSubscribe0", "uint", flags, "ptr", callback, contextMarshal, context, "ptr", subscriptionHandle, "uint")
        return result
    }

    /**
     * 
     * @param {HANDLE} subscriptionHandle 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmdynamickeywordunsubscribe0
     */
    static FwpmDynamicKeywordUnsubscribe0(subscriptionHandle) {
        subscriptionHandle := subscriptionHandle is Win32Handle ? NumGet(subscriptionHandle, "ptr") : subscriptionHandle

        result := DllCall("fwpuclnt.dll\FwpmDynamicKeywordUnsubscribe0", "ptr", subscriptionHandle, "uint")
        return result
    }

    /**
     * Retrieves an array of all of the system port types.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Optional handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Pointer<Pointer<FWPM_SYSTEM_PORTS0>>} sysPorts Type: [FWPM_SYSTEM_PORTS0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_system_ports0)**</b>
     * 
     * The array of system port types.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The subscriptions were retrieved successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmsystemportsget0
     * @since windows6.1
     */
    static FwpmSystemPortsGet0(engineHandle, sysPorts) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        sysPortsMarshal := sysPorts is VarRef ? "ptr*" : "ptr"

        result := DllCall("fwpuclnt.dll\FwpmSystemPortsGet0", "ptr", engineHandle, sysPortsMarshal, sysPorts, "uint")
        return result
    }

    /**
     * Is used to request the delivery of notifications regarding a particular system port.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Pointer<FWPM_SYSTEM_PORTS_CALLBACK0>} callback Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nc-fwpmu-fwpm_system_ports_callback0">FWPM_SYSTEM_PORTS_CALLBACK0</a></b>
     * 
     * Function pointer that will be invoked when a notification is ready for delivery.
     * @param {Pointer<Void>} context Type: <b>void*</b>
     * 
     * Optional context pointer. This pointer is passed to the <i>callback</i> function along with details of the system port.
     * @param {Pointer<HANDLE>} sysPortsHandle Type: <b>HANDLE*</b>
     * 
     * Handle to the newly created subscription.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The subscription was created successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmsystemportssubscribe0
     * @since windows6.1
     */
    static FwpmSystemPortsSubscribe0(engineHandle, callback, context, sysPortsHandle) {
        static reserved := 0 ;Reserved parameters must always be NULL

        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        contextMarshal := context is VarRef ? "ptr" : "ptr"

        result := DllCall("fwpuclnt.dll\FwpmSystemPortsSubscribe0", "ptr", engineHandle, "ptr", reserved, "ptr", callback, contextMarshal, context, "ptr", sysPortsHandle, "uint")
        return result
    }

    /**
     * Is used to cancel a system port subscription and stop receiving notifications.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {HANDLE} sysPortsHandle Type: <b>HANDLE</b>
     * 
     * Handle of the subscribed system port notification. This is the returned handle from the call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmsystemportssubscribe0">FwpmSystemPortsSubscribe0</a>.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The subscription was deleted successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmsystemportsunsubscribe0
     * @since windows6.1
     */
    static FwpmSystemPortsUnsubscribe0(engineHandle, sysPortsHandle) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle
        sysPortsHandle := sysPortsHandle is Win32Handle ? NumGet(sysPortsHandle, "ptr") : sysPortsHandle

        result := DllCall("fwpuclnt.dll\FwpmSystemPortsUnsubscribe0", "ptr", engineHandle, "ptr", sysPortsHandle, "uint")
        return result
    }

    /**
     * Retrieves a connection object.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Integer} id Type: <b>UINT64</b>
     * 
     * The run-time identifier for the connection.
     * @param {Pointer<Pointer<FWPM_CONNECTION0>>} connection Type: [FWPM_CONNECTION0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_connection0)**</b>
     * 
     * The connection information.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The connection object was retrieved successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmconnectiongetbyid0
     * @since windows8.0
     */
    static FwpmConnectionGetById0(engineHandle, id, connection) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        connectionMarshal := connection is VarRef ? "ptr*" : "ptr"

        result := DllCall("fwpuclnt.dll\FwpmConnectionGetById0", "ptr", engineHandle, "uint", id, connectionMarshal, connection, "uint")
        return result
    }

    /**
     * Returns the next page of results from the connection object enumerator.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {HANDLE} enumHandle Type: <b>HANDLE</b>
     * 
     * Handle for a provider context enumeration created by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmconnectioncreateenumhandle0">FwpmConnectionCreateEnumHandle0</a>.
     * @param {Integer} numEntriesRequested Type: <b>UINT32</b>
     * 
     * Number of connection objects requested.
     * @param {Pointer<Pointer<Pointer<FWPM_CONNECTION0>>>} entries Type: [FWPM_CONNECTION0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_connection0)***</b>
     * 
     * Addresses of enumeration entries.
     * @param {Pointer<Integer>} numEntriesReturned Type: <b>UINT32*</b>
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The connection objects were enumerated successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmconnectionenum0
     * @since windows8.0
     */
    static FwpmConnectionEnum0(engineHandle, enumHandle, numEntriesRequested, entries, numEntriesReturned) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle
        enumHandle := enumHandle is Win32Handle ? NumGet(enumHandle, "ptr") : enumHandle

        entriesMarshal := entries is VarRef ? "ptr*" : "ptr"
        numEntriesReturnedMarshal := numEntriesReturned is VarRef ? "uint*" : "ptr"

        result := DllCall("fwpuclnt.dll\FwpmConnectionEnum0", "ptr", engineHandle, "ptr", enumHandle, "uint", numEntriesRequested, entriesMarshal, entries, numEntriesReturnedMarshal, numEntriesReturned, "uint")
        return result
    }

    /**
     * Creates a handle used to enumerate a set of connection objects.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Pointer<FWPM_CONNECTION_ENUM_TEMPLATE0>} enumTemplate Type: [FWPM_CONNECTION_ENUM_TEMPLATE0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_connection_enum_template0)*</b>
     * 
     * Template for selectively restricting the enumeration.
     * @param {Pointer<HANDLE>} enumHandle Type: <b>HANDLE*</b>
     * 
     * Address of a <b>HANDLE</b> variable. On function return, it contains the handle for the enumeration.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The enumerator was created successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmconnectioncreateenumhandle0
     * @since windows8.0
     */
    static FwpmConnectionCreateEnumHandle0(engineHandle, enumTemplate, enumHandle) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        result := DllCall("fwpuclnt.dll\FwpmConnectionCreateEnumHandle0", "ptr", engineHandle, "ptr", enumTemplate, "ptr", enumHandle, "uint")
        return result
    }

    /**
     * Frees a handle returned by FwpmConnectionCreateEnumHandle0.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {HANDLE} enumHandle Type: <b>HANDLE</b>
     * 
     * Handle of a connection object enumeration created by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmprovidercontextcreateenumhandle0">FwpmProviderContextCreateEnumHandle0</a>.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The enumerator was successfully deleted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmconnectiondestroyenumhandle0
     * @since windows8.0
     */
    static FwpmConnectionDestroyEnumHandle0(engineHandle, enumHandle) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle
        enumHandle := enumHandle is Win32Handle ? NumGet(enumHandle, "ptr") : enumHandle

        result := DllCall("fwpuclnt.dll\FwpmConnectionDestroyEnumHandle0", "ptr", engineHandle, "ptr", enumHandle, "uint")
        return result
    }

    /**
     * Retrieves a copy of the security descriptor for a connection object change event.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Integer} securityInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a></b>
     * 
     * The type of security information to retrieve.
     * @param {Pointer<PSID>} sidOwner Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">PSID</a>*</b>
     * 
     * The owner security identifier (SID) in the returned security descriptor.
     * @param {Pointer<PSID>} sidGroup Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">PSID</a>*</b>
     * 
     * The primary group security identifier (SID) in the returned security descriptor.
     * @param {Pointer<Pointer<ACL>>} dacl Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">PACL</a>*</b>
     * 
     * The discretionary access control list (DACL) in the returned security descriptor.
     * @param {Pointer<Pointer<ACL>>} sacl Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">PACL</a>*</b>
     * 
     * The system access control list (SACL) in the returned security descriptor.
     * @param {Pointer<PSECURITY_DESCRIPTOR>} securityDescriptor Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">PSECURITY_DESCRIPTOR</a>*</b>
     * 
     * The returned security descriptor.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The security descriptor was successfully retrieved.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmconnectiongetsecurityinfo0
     * @since windows8.0
     */
    static FwpmConnectionGetSecurityInfo0(engineHandle, securityInfo, sidOwner, sidGroup, dacl, sacl, securityDescriptor) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        sidOwnerMarshal := sidOwner is VarRef ? "ptr*" : "ptr"
        sidGroupMarshal := sidGroup is VarRef ? "ptr*" : "ptr"
        daclMarshal := dacl is VarRef ? "ptr*" : "ptr"
        saclMarshal := sacl is VarRef ? "ptr*" : "ptr"

        result := DllCall("fwpuclnt.dll\FwpmConnectionGetSecurityInfo0", "ptr", engineHandle, "uint", securityInfo, sidOwnerMarshal, sidOwner, sidGroupMarshal, sidGroup, daclMarshal, dacl, saclMarshal, sacl, "ptr", securityDescriptor, "uint")
        return result
    }

    /**
     * Sets specified security information in the security descriptor for a connection object change event.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * A handle to an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Integer} securityInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a></b>
     * 
     * The type of security information to set.
     * @param {Pointer<SID>} sidOwner Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a>*</b>
     * 
     * The owner's security identifier (SID) to be set in the security descriptor.
     * @param {Pointer<SID>} sidGroup Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a>*</b>
     * 
     * The group's SID to be set in the security descriptor.
     * @param {Pointer<ACL>} dacl Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a>*</b>
     * 
     * The discretionary access control list (DACL) to be set in the security descriptor.
     * @param {Pointer<ACL>} sacl Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a>*</b>
     * 
     * The system access control list (SACL) to be set in the security descriptor.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The security information was successfully set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmconnectionsetsecurityinfo0
     * @since windows8.0
     */
    static FwpmConnectionSetSecurityInfo0(engineHandle, securityInfo, sidOwner, sidGroup, dacl, sacl) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        result := DllCall("fwpuclnt.dll\FwpmConnectionSetSecurityInfo0", "ptr", engineHandle, "uint", securityInfo, "ptr", sidOwner, "ptr", sidGroup, "ptr", dacl, "ptr", sacl, "uint")
        return result
    }

    /**
     * Is used to request the delivery of notifications about changes to a connection object.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Pointer<FWPM_CONNECTION_SUBSCRIPTION0>} subscription Type: [FWPM_CONNECTION_SUBSCRIPTION0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_connection_subscription0)*</b>
     * 
     * The notifications which will be delivered.
     * @param {Pointer<FWPM_CONNECTION_CALLBACK0>} callback Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nc-fwpmu-fwpm_connection_callback0">FWPM_CONNECTION_CALLBACK0</a></b>
     * 
     * Function pointer that will be invoked when a notification is ready for delivery.
     * @param {Pointer<Void>} context Type: <b>void*</b>
     * 
     * Optional context pointer. This pointer is passed to the <i>callback</i> function along with details of the event.
     * @param {Pointer<HANDLE>} eventsHandle Type: <b>HANDLE*</b>
     * 
     * Handle to the newly created subscription.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The subscription was created successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmconnectionsubscribe0
     * @since windows8.0
     */
    static FwpmConnectionSubscribe0(engineHandle, subscription, callback, context, eventsHandle) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        contextMarshal := context is VarRef ? "ptr" : "ptr"

        result := DllCall("fwpuclnt.dll\FwpmConnectionSubscribe0", "ptr", engineHandle, "ptr", subscription, "ptr", callback, contextMarshal, context, "ptr", eventsHandle, "uint")
        return result
    }

    /**
     * Is used to cancel a connection object change event subscription and stop receiving notifications.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {HANDLE} eventsHandle Type: <b>HANDLE</b>
     * 
     * Handle of the subscribed event notification. This is the returned handle from the call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmconnectionsubscribe0">FwpmConnectionSubscribe0</a>.
     * 
     * This may be <b>NULL</b>, in which case the function will have no effect.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The subscription was deleted successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmconnectionunsubscribe0
     * @since windows8.0
     */
    static FwpmConnectionUnsubscribe0(engineHandle, eventsHandle) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle
        eventsHandle := eventsHandle is Win32Handle ? NumGet(eventsHandle, "ptr") : eventsHandle

        result := DllCall("fwpuclnt.dll\FwpmConnectionUnsubscribe0", "ptr", engineHandle, "ptr", eventsHandle, "uint")
        return result
    }

    /**
     * Is used to request the delivery of notifications regarding a particular vSwitch event.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Pointer<FWPM_VSWITCH_EVENT_SUBSCRIPTION0>} subscription Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_vswitch_event_subscription0">FWPM_VSWITCH_EVENT_SUBSCRIPTION0</a>*</b>
     * 
     * The notifications which will be delivered.
     * @param {Pointer<FWPM_VSWITCH_EVENT_CALLBACK0>} callback Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nc-fwpmu-fwpm_vswitch_event_callback0">FWPM_VSWITCH_EVENT_CALLBACK0</a></b>
     * 
     * Function pointer that will be invoked when a notification is ready for delivery.
     * @param {Pointer<Void>} context Type: <b>void*</b>
     * 
     * Optional context pointer. This pointer is passed to the <i>callback</i> function along with details of the event.
     * @param {Pointer<HANDLE>} subscriptionHandle Type: <b>HANDLE*</b>
     * 
     * Handle to the newly created subscription.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The subscription was created successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmvswitcheventsubscribe0
     * @since windows8.0
     */
    static FwpmvSwitchEventSubscribe0(engineHandle, subscription, callback, context, subscriptionHandle) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        contextMarshal := context is VarRef ? "ptr" : "ptr"

        result := DllCall("fwpuclnt.dll\FwpmvSwitchEventSubscribe0", "ptr", engineHandle, "ptr", subscription, "ptr", callback, contextMarshal, context, "ptr", subscriptionHandle, "uint")
        return result
    }

    /**
     * Is used to cancel a vSwitch event subscription and stop receiving notifications.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {HANDLE} subscriptionHandle Type: <b>HANDLE</b>
     * 
     * Handle of the subscribed event notification. This is the returned handle from the call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmvswitcheventsubscribe0">FwpmvSwitchEventSubscribe0</a>.
     * 
     * This may be <b>NULL</b>, in which case the function will have no effect.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The subscription was deleted successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmvswitcheventunsubscribe0
     * @since windows8.0
     */
    static FwpmvSwitchEventUnsubscribe0(engineHandle, subscriptionHandle) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle
        subscriptionHandle := subscriptionHandle is Win32Handle ? NumGet(subscriptionHandle, "ptr") : subscriptionHandle

        result := DllCall("fwpuclnt.dll\FwpmvSwitchEventUnsubscribe0", "ptr", engineHandle, "ptr", subscriptionHandle, "uint")
        return result
    }

    /**
     * Retrieves a copy of the security descriptor for a vSwitch event.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Integer} securityInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a></b>
     * 
     * The type of security information to retrieve.
     * @param {Pointer<PSID>} sidOwner Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">PSID</a>*</b>
     * 
     * The owner security identifier (SID) in the returned security descriptor.
     * @param {Pointer<PSID>} sidGroup Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">PSID</a>*</b>
     * 
     * The primary group security identifier (SID) in the returned security descriptor.
     * @param {Pointer<Pointer<ACL>>} dacl Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">PACL</a>*</b>
     * 
     * The discretionary access control list (DACL) in the returned security descriptor.
     * @param {Pointer<Pointer<ACL>>} sacl Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">PACL</a>*</b>
     * 
     * The system access control list (SACL) in the returned security descriptor.
     * @param {Pointer<PSECURITY_DESCRIPTOR>} securityDescriptor Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">PSECURITY_DESCRIPTOR</a>*</b>
     * 
     * The returned security descriptor.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The security descriptor was successfully retrieved.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmvswitcheventsgetsecurityinfo0
     * @since windows8.0
     */
    static FwpmvSwitchEventsGetSecurityInfo0(engineHandle, securityInfo, sidOwner, sidGroup, dacl, sacl, securityDescriptor) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        sidOwnerMarshal := sidOwner is VarRef ? "ptr*" : "ptr"
        sidGroupMarshal := sidGroup is VarRef ? "ptr*" : "ptr"
        daclMarshal := dacl is VarRef ? "ptr*" : "ptr"
        saclMarshal := sacl is VarRef ? "ptr*" : "ptr"

        result := DllCall("fwpuclnt.dll\FwpmvSwitchEventsGetSecurityInfo0", "ptr", engineHandle, "uint", securityInfo, sidOwnerMarshal, sidOwner, sidGroupMarshal, sidGroup, daclMarshal, dacl, saclMarshal, sacl, "ptr", securityDescriptor, "uint")
        return result
    }

    /**
     * Sets specified security information in the security descriptor for a vSwitch event.
     * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
     * 
     * A handle to an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
     * @param {Integer} securityInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a></b>
     * 
     * The type of security information to set.
     * @param {Pointer<SID>} sidOwner Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a>*</b>
     * 
     * The owner's security identifier (SID) to be set in the security descriptor.
     * @param {Pointer<SID>} sidGroup Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a>*</b>
     * 
     * The group's SID to be set in the security descriptor.
     * @param {Pointer<ACL>} dacl Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a>*</b>
     * 
     * The discretionary access control list (DACL) to be set in the security descriptor.
     * @param {Pointer<ACL>} sacl Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a>*</b>
     * 
     * The system access control list (SACL) to be set in the security descriptor.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The security information was successfully set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fwpmu/nf-fwpmu-fwpmvswitcheventssetsecurityinfo0
     * @since windows8.0
     */
    static FwpmvSwitchEventsSetSecurityInfo0(engineHandle, securityInfo, sidOwner, sidGroup, dacl, sacl) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        result := DllCall("fwpuclnt.dll\FwpmvSwitchEventsSetSecurityInfo0", "ptr", engineHandle, "uint", securityInfo, "ptr", sidOwner, "ptr", sidGroup, "ptr", dacl, "ptr", sacl, "uint")
        return result
    }

    /**
     * 
     * @param {HANDLE} engineHandle 
     * @param {Pointer<FWPM_PROVIDER_CONTEXT3>} connectionPolicy 
     * @param {Integer} ipVersion 
     * @param {Integer} weight 
     * @param {Integer} numFilterConditions 
     * @param {Pointer<FWPM_FILTER_CONDITION0>} filterConditions 
     * @param {PSECURITY_DESCRIPTOR} sd 
     * @returns {Integer} 
     */
    static FwpmConnectionPolicyAdd0(engineHandle, connectionPolicy, ipVersion, weight, numFilterConditions, filterConditions, sd) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle
        sd := sd is Win32Handle ? NumGet(sd, "ptr") : sd

        result := DllCall("fwpuclnt.dll\FwpmConnectionPolicyAdd0", "ptr", engineHandle, "ptr", connectionPolicy, "int", ipVersion, "uint", weight, "uint", numFilterConditions, "ptr", filterConditions, "ptr", sd, "uint")
        return result
    }

    /**
     * 
     * @param {HANDLE} engineHandle 
     * @param {Pointer<Guid>} key 
     * @returns {Integer} 
     */
    static FwpmConnectionPolicyDeleteByKey0(engineHandle, key) {
        engineHandle := engineHandle is Win32Handle ? NumGet(engineHandle, "ptr") : engineHandle

        result := DllCall("fwpuclnt.dll\FwpmConnectionPolicyDeleteByKey0", "ptr", engineHandle, "ptr", key, "uint")
        return result
    }

;@endregion Methods
}
