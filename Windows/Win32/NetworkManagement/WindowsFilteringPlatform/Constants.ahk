#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global FWPM_NET_EVENT_KEYWORD_INBOUND_MCAST := 1

/**
 * @type {Integer (UInt32)}
 */
export global FWPM_NET_EVENT_KEYWORD_INBOUND_BCAST := 2

/**
 * @type {Integer (UInt32)}
 */
export global FWPM_NET_EVENT_KEYWORD_CAPABILITY_DROP := 4

/**
 * @type {Integer (UInt32)}
 */
export global FWPM_NET_EVENT_KEYWORD_CAPABILITY_ALLOW := 8

/**
 * @type {Integer (UInt32)}
 */
export global FWPM_NET_EVENT_KEYWORD_CLASSIFY_ALLOW := 16

/**
 * @type {Integer (UInt32)}
 */
export global FWPM_NET_EVENT_KEYWORD_PORT_SCANNING_DROP := 32

/**
 * @type {Integer (UInt32)}
 */
export global FWPM_ENGINE_OPTION_PACKET_QUEUE_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global FWPM_ENGINE_OPTION_PACKET_QUEUE_INBOUND := 1

/**
 * @type {Integer (UInt32)}
 */
export global FWPM_ENGINE_OPTION_PACKET_QUEUE_FORWARD := 2

/**
 * @type {Integer (UInt32)}
 */
export global FWPM_ENGINE_OPTION_PACKET_BATCH_INBOUND := 4

/**
 * @type {Integer (UInt32)}
 */
export global FWPM_SESSION_FLAG_DYNAMIC := 1

/**
 * @type {Integer (UInt32)}
 */
export global FWPM_SESSION_FLAG_RESERVED := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global FWPM_PROVIDER_FLAG_PERSISTENT := 1

/**
 * @type {Integer (UInt32)}
 */
export global FWPM_PROVIDER_FLAG_DISABLED := 16

/**
 * @type {Integer (UInt32)}
 */
export global FWPM_PROVIDER_CONTEXT_FLAG_PERSISTENT := 1

/**
 * @type {Integer (UInt32)}
 */
export global FWPM_PROVIDER_CONTEXT_FLAG_DOWNLEVEL := 2

/**
 * @type {Integer (UInt32)}
 */
export global FWPM_SUBLAYER_FLAG_PERSISTENT := 1

/**
 * @type {Integer (UInt32)}
 */
export global FWPM_LAYER_FLAG_KERNEL := 1

/**
 * @type {Integer (UInt32)}
 */
export global FWPM_LAYER_FLAG_BUILTIN := 2

/**
 * @type {Integer (UInt32)}
 */
export global FWPM_LAYER_FLAG_CLASSIFY_MOSTLY := 4

/**
 * @type {Integer (UInt32)}
 */
export global FWPM_LAYER_FLAG_BUFFERED := 8

/**
 * @type {Integer (UInt32)}
 */
export global FWPM_CALLOUT_FLAG_PERSISTENT := 65536

/**
 * @type {Integer (UInt32)}
 */
export global FWPM_CALLOUT_FLAG_USES_PROVIDER_CONTEXT := 131072

/**
 * @type {Integer (UInt32)}
 */
export global FWPM_CALLOUT_FLAG_REGISTERED := 262144

/**
 * @type {Integer (UInt32)}
 */
export global FWPM_FILTER_FLAG_HAS_SECURITY_REALM_PROVIDER_CONTEXT := 128

/**
 * @type {Integer (UInt32)}
 */
export global FWPM_FILTER_FLAG_SYSTEMOS_ONLY := 256

/**
 * @type {Integer (UInt32)}
 */
export global FWPM_FILTER_FLAG_GAMEOS_ONLY := 512

/**
 * @type {Integer (UInt32)}
 */
export global FWPM_FILTER_FLAG_SILENT_MODE := 1024

/**
 * @type {Integer (UInt32)}
 */
export global FWPM_FILTER_FLAG_IPSEC_NO_ACQUIRE_INITIATE := 2048

/**
 * @type {Integer (UInt32)}
 */
export global FWPM_FILTER_FLAG_RESERVED0 := 4096

/**
 * @type {Integer (UInt32)}
 */
export global FWPM_FILTER_FLAG_RESERVED1 := 8192

/**
 * @type {Integer (UInt32)}
 */
export global FWPM_FILTER_FLAG_RESERVED2 := 16384

/**
 * @type {Integer (UInt32)}
 */
export global FWPM_NET_EVENT_FLAG_IP_PROTOCOL_SET := 1

/**
 * @type {Integer (UInt32)}
 */
export global FWPM_NET_EVENT_FLAG_LOCAL_ADDR_SET := 2

/**
 * @type {Integer (UInt32)}
 */
export global FWPM_NET_EVENT_FLAG_REMOTE_ADDR_SET := 4

/**
 * @type {Integer (UInt32)}
 */
export global FWPM_NET_EVENT_FLAG_LOCAL_PORT_SET := 8

/**
 * @type {Integer (UInt32)}
 */
export global FWPM_NET_EVENT_FLAG_REMOTE_PORT_SET := 16

/**
 * @type {Integer (UInt32)}
 */
export global FWPM_NET_EVENT_FLAG_APP_ID_SET := 32

/**
 * @type {Integer (UInt32)}
 */
export global FWPM_NET_EVENT_FLAG_USER_ID_SET := 64

/**
 * @type {Integer (UInt32)}
 */
export global FWPM_NET_EVENT_FLAG_SCOPE_ID_SET := 128

/**
 * @type {Integer (UInt32)}
 */
export global FWPM_NET_EVENT_FLAG_IP_VERSION_SET := 256

/**
 * @type {Integer (UInt32)}
 */
export global FWPM_NET_EVENT_FLAG_REAUTH_REASON_SET := 512

/**
 * @type {Integer (UInt32)}
 */
export global FWPM_NET_EVENT_FLAG_PACKAGE_ID_SET := 1024

/**
 * @type {Integer (UInt32)}
 */
export global FWPM_NET_EVENT_FLAG_ENTERPRISE_ID_SET := 2048

/**
 * @type {Integer (UInt32)}
 */
export global FWPM_NET_EVENT_FLAG_POLICY_FLAGS_SET := 4096

/**
 * @type {Integer (UInt32)}
 */
export global FWPM_NET_EVENT_FLAG_EFFECTIVE_NAME_SET := 8192

/**
 * @type {Integer (UInt32)}
 */
export global IKEEXT_CERT_HASH_LEN := 20

/**
 * @type {Integer (UInt32)}
 */
export global FWPM_NET_EVENT_IKEEXT_MM_FAILURE_FLAG_BENIGN := 1

/**
 * @type {Integer (UInt32)}
 */
export global FWPM_NET_EVENT_IKEEXT_MM_FAILURE_FLAG_MULTIPLE := 2

/**
 * @type {Integer (UInt32)}
 */
export global FWPM_NET_EVENT_IKEEXT_EM_FAILURE_FLAG_MULTIPLE := 1

/**
 * @type {Integer (UInt32)}
 */
export global FWPM_NET_EVENT_IKEEXT_EM_FAILURE_FLAG_BENIGN := 2

/**
 * @type {Integer (UInt32)}
 */
export global FWPM_CONNECTION_ENUM_FLAG_QUERY_BYTES_TRANSFERRED := 1

/**
 * @type {Integer (UInt32)}
 */
export global FWPS_FILTER_FLAG_CLEAR_ACTION_RIGHT := 1

/**
 * @type {Integer (UInt32)}
 */
export global FWPS_FILTER_FLAG_PERMIT_IF_CALLOUT_UNREGISTERED := 2

/**
 * @type {Integer (UInt32)}
 */
export global FWPS_FILTER_FLAG_OR_CONDITIONS := 4

/**
 * @type {Integer (UInt32)}
 */
export global FWPS_FILTER_FLAG_HAS_SECURITY_REALM_PROVIDER_CONTEXT := 8

/**
 * @type {Integer (UInt32)}
 */
export global FWPS_FILTER_FLAG_SILENT_MODE := 16

/**
 * @type {Integer (UInt32)}
 */
export global FWPS_FILTER_FLAG_IPSEC_NO_ACQUIRE_INITIATE := 32

/**
 * @type {Integer (UInt32)}
 */
export global FWPS_FILTER_FLAG_RESERVED0 := 64

/**
 * @type {Integer (UInt32)}
 */
export global FWPS_FILTER_FLAG_RESERVED1 := 128

/**
 * @type {Integer (UInt32)}
 */
export global FWPS_FILTER_FLAG_RESERVED2 := 256

/**
 * @type {Integer (UInt32)}
 */
export global FWPS_INCOMING_FLAG_CACHE_SAFE := 1

/**
 * @type {Integer (UInt32)}
 */
export global FWPS_INCOMING_FLAG_ENFORCE_QUERY := 2

/**
 * @type {Integer (UInt32)}
 */
export global FWPS_INCOMING_FLAG_ABSORB := 4

/**
 * @type {Integer (UInt32)}
 */
export global FWPS_INCOMING_FLAG_CONNECTION_FAILING_INDICATION := 8

/**
 * @type {Integer (UInt32)}
 */
export global FWPS_INCOMING_FLAG_MID_STREAM_INSPECTION := 16

/**
 * @type {Integer (UInt32)}
 */
export global FWPS_INCOMING_FLAG_RECLASSIFY := 32

/**
 * @type {Integer (UInt32)}
 */
export global FWPS_INCOMING_FLAG_IS_LOOSE_SOURCE_FLOW := 64

/**
 * @type {Integer (UInt32)}
 */
export global FWPS_INCOMING_FLAG_IS_LOCAL_ONLY_FLOW := 128

/**
 * @type {Integer (UInt32)}
 */
export global FWPS_L2_INCOMING_FLAG_IS_RAW_IPV4_FRAMING := 1

/**
 * @type {Integer (UInt32)}
 */
export global FWPS_L2_INCOMING_FLAG_IS_RAW_IPV6_FRAMING := 2

/**
 * @type {Integer (UInt32)}
 */
export global FWPS_L2_INCOMING_FLAG_RECLASSIFY_MULTI_DESTINATION := 8

/**
 * @type {Integer (UInt32)}
 */
export global FWPS_INCOMING_FLAG_RESERVED0 := 256

/**
 * @type {Integer (UInt32)}
 */
export global FWPS_RIGHT_ACTION_WRITE := 1

/**
 * @type {Integer (UInt32)}
 */
export global FWPS_CLASSIFY_OUT_FLAG_ABSORB := 1

/**
 * @type {Integer (UInt32)}
 */
export global FWPS_CLASSIFY_OUT_FLAG_BUFFER_LIMIT_REACHED := 2

/**
 * @type {Integer (UInt32)}
 */
export global FWPS_CLASSIFY_OUT_FLAG_NO_MORE_DATA := 4

/**
 * @type {Integer (UInt32)}
 */
export global FWPS_CLASSIFY_OUT_FLAG_ALE_FAST_CACHE_CHECK := 8

/**
 * @type {Integer (UInt32)}
 */
export global FWPS_CLASSIFY_OUT_FLAG_ALE_FAST_CACHE_POSSIBLE := 16

/**
 * @type {Integer (UInt32)}
 */
export global FWPS_ALE_ENDPOINT_FLAG_IPSEC_SECURED := 1

/**
 * @type {Integer (UInt32)}
 */
export global FWP_BYTEMAP_ARRAY64_SIZE := 8

/**
 * @type {Integer (UInt32)}
 */
export global FWP_BYTE_ARRAY6_SIZE := 6

/**
 * @type {Integer (UInt32)}
 */
export global FWP_V6_ADDR_SIZE := 16

/**
 * @type {Integer (UInt32)}
 */
export global FWP_ACTRL_MATCH_FILTER := 1

/**
 * @type {Integer (UInt32)}
 */
export global FWP_OPTION_VALUE_ALLOW_MULTICAST_STATE := 0

/**
 * @type {Integer (UInt32)}
 */
export global FWP_OPTION_VALUE_DENY_MULTICAST_STATE := 1

/**
 * @type {Integer (UInt32)}
 */
export global FWP_OPTION_VALUE_ALLOW_GLOBAL_MULTICAST_STATE := 2

/**
 * @type {Integer (UInt32)}
 */
export global FWP_OPTION_VALUE_DISABLE_LOOSE_SOURCE := 0

/**
 * @type {Integer (UInt32)}
 */
export global FWP_OPTION_VALUE_ENABLE_LOOSE_SOURCE := 1

/**
 * @type {Integer (UInt32)}
 */
export global FWP_OPTION_VALUE_DISABLE_LOCAL_ONLY_MAPPING := 0

/**
 * @type {Integer (UInt32)}
 */
export global FWP_OPTION_VALUE_ENABLE_LOCAL_ONLY_MAPPING := 1

/**
 * @type {Integer (UInt32)}
 */
export global FWP_ACTION_FLAG_TERMINATING := 4096

/**
 * @type {Integer (UInt32)}
 */
export global FWP_ACTION_FLAG_NON_TERMINATING := 8192

/**
 * @type {Integer (UInt32)}
 */
export global FWP_ACTION_FLAG_CALLOUT := 16384

/**
 * @type {Integer (UInt32)}
 */
export global FWP_CONDITION_FLAG_IS_LOOPBACK := 1

/**
 * @type {Integer (UInt32)}
 */
export global FWP_CONDITION_FLAG_IS_IPSEC_SECURED := 2

/**
 * @type {Integer (UInt32)}
 */
export global FWP_CONDITION_FLAG_IS_REAUTHORIZE := 4

/**
 * @type {Integer (UInt32)}
 */
export global FWP_CONDITION_FLAG_IS_WILDCARD_BIND := 8

/**
 * @type {Integer (UInt32)}
 */
export global FWP_CONDITION_FLAG_IS_RAW_ENDPOINT := 16

/**
 * @type {Integer (UInt32)}
 */
export global FWP_CONDITION_FLAG_IS_FRAGMENT := 32

/**
 * @type {Integer (UInt32)}
 */
export global FWP_CONDITION_FLAG_IS_FRAGMENT_GROUP := 64

/**
 * @type {Integer (UInt32)}
 */
export global FWP_CONDITION_FLAG_IS_IPSEC_NATT_RECLASSIFY := 128

/**
 * @type {Integer (UInt32)}
 */
export global FWP_CONDITION_FLAG_REQUIRES_ALE_CLASSIFY := 256

/**
 * @type {Integer (UInt32)}
 */
export global FWP_CONDITION_FLAG_IS_IMPLICIT_BIND := 512

/**
 * @type {Integer (UInt32)}
 */
export global FWP_CONDITION_FLAG_IS_REASSEMBLED := 1024

/**
 * @type {Integer (UInt32)}
 */
export global FWP_CONDITION_FLAG_IS_NAME_APP_SPECIFIED := 16384

/**
 * @type {Integer (UInt32)}
 */
export global FWP_CONDITION_FLAG_IS_PROMISCUOUS := 32768

/**
 * @type {Integer (UInt32)}
 */
export global FWP_CONDITION_FLAG_IS_AUTH_FW := 65536

/**
 * @type {Integer (UInt32)}
 */
export global FWP_CONDITION_FLAG_IS_RECLASSIFY := 131072

/**
 * @type {Integer (UInt32)}
 */
export global FWP_CONDITION_FLAG_IS_OUTBOUND_PASS_THRU := 262144

/**
 * @type {Integer (UInt32)}
 */
export global FWP_CONDITION_FLAG_IS_INBOUND_PASS_THRU := 524288

/**
 * @type {Integer (UInt32)}
 */
export global FWP_CONDITION_FLAG_IS_CONNECTION_REDIRECTED := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global FWP_CONDITION_FLAG_IS_PROXY_CONNECTION := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global FWP_CONDITION_FLAG_IS_APPCONTAINER_LOOPBACK := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global FWP_CONDITION_FLAG_IS_NON_APPCONTAINER_LOOPBACK := 8388608

/**
 * @type {Integer (UInt32)}
 */
export global FWP_CONDITION_FLAG_IS_RESERVED := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global FWP_CONDITION_FLAG_IS_HONORING_POLICY_AUTHORIZE := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global FWP_CONDITION_REAUTHORIZE_REASON_POLICY_CHANGE := 1

/**
 * @type {Integer (UInt32)}
 */
export global FWP_CONDITION_REAUTHORIZE_REASON_NEW_ARRIVAL_INTERFACE := 2

/**
 * @type {Integer (UInt32)}
 */
export global FWP_CONDITION_REAUTHORIZE_REASON_NEW_NEXTHOP_INTERFACE := 4

/**
 * @type {Integer (UInt32)}
 */
export global FWP_CONDITION_REAUTHORIZE_REASON_PROFILE_CROSSING := 8

/**
 * @type {Integer (UInt32)}
 */
export global FWP_CONDITION_REAUTHORIZE_REASON_CLASSIFY_COMPLETION := 16

/**
 * @type {Integer (UInt32)}
 */
export global FWP_CONDITION_REAUTHORIZE_REASON_IPSEC_PROPERTIES_CHANGED := 32

/**
 * @type {Integer (UInt32)}
 */
export global FWP_CONDITION_REAUTHORIZE_REASON_MID_STREAM_INSPECTION := 64

/**
 * @type {Integer (UInt32)}
 */
export global FWP_CONDITION_REAUTHORIZE_REASON_SOCKET_PROPERTY_CHANGED := 128

/**
 * @type {Integer (UInt32)}
 */
export global FWP_CONDITION_REAUTHORIZE_REASON_NEW_INBOUND_MCAST_BCAST_PACKET := 256

/**
 * @type {Integer (UInt32)}
 */
export global FWP_CONDITION_REAUTHORIZE_REASON_EDP_POLICY_CHANGED := 512

/**
 * @type {Integer (UInt32)}
 */
export global FWP_CONDITION_REAUTHORIZE_REASON_PROXY_HANDLE_CHANGED := 16384

/**
 * @type {Integer (UInt32)}
 */
export global FWP_CONDITION_REAUTHORIZE_REASON_CHECK_OFFLOAD := 65536

/**
 * @type {Integer (UInt32)}
 */
export global FWP_CONDITION_SOCKET_PROPERTY_FLAG_IS_SYSTEM_PORT_RPC := 1

/**
 * @type {Integer (UInt32)}
 */
export global FWP_CONDITION_SOCKET_PROPERTY_FLAG_ALLOW_EDGE_TRAFFIC := 2

/**
 * @type {Integer (UInt32)}
 */
export global FWP_CONDITION_SOCKET_PROPERTY_FLAG_DENY_EDGE_TRAFFIC := 4

/**
 * @type {Integer (UInt32)}
 */
export global FWP_CONDITION_L2_IS_NATIVE_ETHERNET := 1

/**
 * @type {Integer (UInt32)}
 */
export global FWP_CONDITION_L2_IS_WIFI := 2

/**
 * @type {Integer (UInt32)}
 */
export global FWP_CONDITION_L2_IS_MOBILE_BROADBAND := 4

/**
 * @type {Integer (UInt32)}
 */
export global FWP_CONDITION_L2_IS_WIFI_DIRECT_DATA := 8

/**
 * @type {Integer (UInt32)}
 */
export global FWP_CONDITION_L2_IS_VM2VM := 16

/**
 * @type {Integer (UInt32)}
 */
export global FWP_CONDITION_L2_IS_MALFORMED_PACKET := 32

/**
 * @type {Integer (UInt32)}
 */
export global FWP_CONDITION_L2_IS_IP_FRAGMENT_GROUP := 64

/**
 * @type {Integer (UInt32)}
 */
export global FWP_CONDITION_L2_IF_CONNECTOR_PRESENT := 128

/**
 * @type {Integer (UInt32)}
 */
export global FWP_FILTER_ENUM_FLAG_BEST_TERMINATING_MATCH := 1

/**
 * @type {Integer (UInt32)}
 */
export global FWP_FILTER_ENUM_FLAG_SORTED := 2

/**
 * @type {Integer (UInt32)}
 */
export global FWP_FILTER_ENUM_FLAG_BOOTTIME_ONLY := 4

/**
 * @type {Integer (UInt32)}
 */
export global FWP_FILTER_ENUM_FLAG_INCLUDE_BOOTTIME := 8

/**
 * @type {Integer (UInt32)}
 */
export global FWP_FILTER_ENUM_FLAG_INCLUDE_DISABLED := 16

/**
 * @type {Integer (UInt32)}
 */
export global FWP_FILTER_ENUM_FLAG_RESERVED1 := 32

/**
 * @type {Integer (UInt32)}
 */
export global FWP_CALLOUT_FLAG_CONDITIONAL_ON_FLOW := 1

/**
 * @type {Integer (UInt32)}
 */
export global FWP_CALLOUT_FLAG_ALLOW_OFFLOAD := 2

/**
 * @type {Integer (UInt32)}
 */
export global FWP_CALLOUT_FLAG_ENABLE_COMMIT_ADD_NOTIFY := 4

/**
 * @type {Integer (UInt32)}
 */
export global FWP_CALLOUT_FLAG_ALLOW_MID_STREAM_INSPECTION := 8

/**
 * @type {Integer (UInt32)}
 */
export global FWP_CALLOUT_FLAG_ALLOW_RECLASSIFY := 16

/**
 * @type {Integer (UInt32)}
 */
export global FWP_CALLOUT_FLAG_RESERVED1 := 32

/**
 * @type {Integer (UInt32)}
 */
export global FWP_CALLOUT_FLAG_ALLOW_RSC := 64

/**
 * @type {Integer (UInt32)}
 */
export global FWP_CALLOUT_FLAG_ALLOW_L2_BATCH_CLASSIFY := 128

/**
 * @type {Integer (UInt32)}
 */
export global FWP_CALLOUT_FLAG_ALLOW_USO := 256

/**
 * @type {Integer (UInt32)}
 */
export global FWP_CALLOUT_FLAG_ALLOW_URO := 512

/**
 * @type {Integer (UInt32)}
 */
export global FWP_CALLOUT_FLAG_RESERVED2 := 1024

/**
 * @type {Integer (UInt32)}
 */
export global IKEEXT_CERT_AUTH_FLAG_DISABLE_CRL_CHECK := 2

/**
 * @type {Integer (UInt32)}
 */
export global IKEEXT_CERT_AUTH_FLAG_DISABLE_REQUEST_PAYLOAD := 64

/**
 * @type {Integer (UInt32)}
 */
export global IKEEXT_KERB_AUTH_FORCE_PROXY_ON_INITIATOR := 4

/**
 * @type {Integer (UInt32)}
 */
export global IKEEXT_NTLM_V2_AUTH_DONT_ACCEPT_EXPLICIT_CREDENTIALS := 1

/**
 * @type {Integer (UInt32)}
 */
export global IKEEXT_POLICY_FLAG_MOBIKE_NOT_SUPPORTED := 16

/**
 * @type {Integer (UInt32)}
 */
export global IKEEXT_POLICY_FLAG_SITE_TO_SITE := 32

/**
 * @type {Integer (UInt32)}
 */
export global IKEEXT_POLICY_FLAG_IMS_VPN := 64

/**
 * @type {Integer (UInt32)}
 */
export global IKEEXT_POLICY_ENABLE_IKEV2_FRAGMENTATION := 128

/**
 * @type {Integer (UInt32)}
 */
export global IKEEXT_POLICY_SUPPORT_LOW_POWER_MODE := 256

/**
 * @type {Integer (UInt32)}
 */
export global IKEEXT_POLICY_FLAG_POINT_TO_SITE := 512

/**
 * @type {Integer (UInt32)}
 */
export global IKEEXT_CERT_CREDENTIAL_FLAG_NAP_CERT := 1

/**
 * @type {Integer (UInt32)}
 */
export global IPSEC_AUTH_CONFIG_HMAC_MD5_96 := 0

/**
 * @type {Integer (UInt32)}
 */
export global IPSEC_AUTH_CONFIG_HMAC_SHA_1_96 := 1

/**
 * @type {Integer (UInt32)}
 */
export global IPSEC_AUTH_CONFIG_HMAC_SHA_256_128 := 2

/**
 * @type {Integer (UInt32)}
 */
export global IPSEC_AUTH_CONFIG_GCM_AES_128 := 3

/**
 * @type {Integer (UInt32)}
 */
export global IPSEC_AUTH_CONFIG_GCM_AES_192 := 4

/**
 * @type {Integer (UInt32)}
 */
export global IPSEC_AUTH_CONFIG_GCM_AES_256 := 5

/**
 * @type {Integer (UInt32)}
 */
export global IPSEC_AUTH_CONFIG_MAX := 6

/**
 * @type {Integer (UInt32)}
 */
export global IPSEC_CIPHER_CONFIG_CBC_DES := 1

/**
 * @type {Integer (UInt32)}
 */
export global IPSEC_CIPHER_CONFIG_CBC_3DES := 2

/**
 * @type {Integer (UInt32)}
 */
export global IPSEC_CIPHER_CONFIG_CBC_AES_128 := 3

/**
 * @type {Integer (UInt32)}
 */
export global IPSEC_CIPHER_CONFIG_CBC_AES_192 := 4

/**
 * @type {Integer (UInt32)}
 */
export global IPSEC_CIPHER_CONFIG_CBC_AES_256 := 5

/**
 * @type {Integer (UInt32)}
 */
export global IPSEC_CIPHER_CONFIG_GCM_AES_128 := 6

/**
 * @type {Integer (UInt32)}
 */
export global IPSEC_CIPHER_CONFIG_GCM_AES_192 := 7

/**
 * @type {Integer (UInt32)}
 */
export global IPSEC_CIPHER_CONFIG_GCM_AES_256 := 8

/**
 * @type {Integer (UInt32)}
 */
export global IPSEC_CIPHER_CONFIG_MAX := 9

/**
 * @type {Integer (UInt32)}
 */
export global IPSEC_POLICY_FLAG_KEY_MANAGER_ALLOW_NOTIFY_KEY := 16384

/**
 * @type {Integer (UInt32)}
 */
export global IPSEC_POLICY_FLAG_RESERVED1 := 32768

/**
 * @type {Integer (UInt32)}
 */
export global IPSEC_POLICY_FLAG_SITE_TO_SITE_TUNNEL := 65536

/**
 * @type {Integer (UInt32)}
 */
export global IPSEC_POLICY_FLAG_POINT_TO_SITE_TUNNEL := 131072

/**
 * @type {Integer (UInt32)}
 */
export global IPSEC_POLICY_FLAG_BANDWIDTH1 := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global IPSEC_POLICY_FLAG_BANDWIDTH2 := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global IPSEC_POLICY_FLAG_BANDWIDTH3 := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global IPSEC_POLICY_FLAG_BANDWIDTH4 := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global IPSEC_KEYING_POLICY_FLAG_TERMINATING_MATCH := 1

/**
 * @type {Integer (UInt32)}
 */
export global IPSEC_SA_BUNDLE_FLAG_NLB := 16

/**
 * @type {Integer (UInt32)}
 */
export global IPSEC_SA_BUNDLE_FLAG_NO_MACHINE_LUID_VERIFY := 32

/**
 * @type {Integer (UInt32)}
 */
export global IPSEC_SA_BUNDLE_FLAG_NO_IMPERSONATION_LUID_VERIFY := 64

/**
 * @type {Integer (UInt32)}
 */
export global IPSEC_SA_BUNDLE_FLAG_NO_EXPLICIT_CRED_MATCH := 128

/**
 * @type {Integer (UInt32)}
 */
export global IPSEC_SA_BUNDLE_FLAG_FORCE_INBOUND_CONNECTIONS := 32768

/**
 * @type {Integer (UInt32)}
 */
export global IPSEC_SA_BUNDLE_FLAG_FORCE_OUTBOUND_CONNECTIONS := 65536

/**
 * @type {Integer (UInt32)}
 */
export global IPSEC_SA_BUNDLE_FLAG_FORWARD_PATH_INITIATOR := 131072

/**
 * @type {Integer (UInt32)}
 */
export global IPSEC_SA_BUNDLE_FLAG_ENABLE_OPTIONAL_ASYMMETRIC_IDLE := 262144

/**
 * @type {Integer (UInt32)}
 */
export global IPSEC_SA_BUNDLE_FLAG_USING_DICTATED_KEYS := 524288

/**
 * @type {Integer (UInt32)}
 */
export global IPSEC_SA_BUNDLE_FLAG_LOCALLY_DICTATED_KEYS := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global IPSEC_SA_BUNDLE_FLAG_SA_OFFLOADED := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global IPSEC_SA_BUNDLE_FLAG_IP_IN_IP_PKT := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global IPSEC_SA_BUNDLE_FLAG_LOW_POWER_MODE_SUPPORT := 8388608

/**
 * @type {Integer (UInt32)}
 */
export global IPSEC_SA_BUNDLE_FLAG_TUNNEL_BANDWIDTH1 := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global IPSEC_SA_BUNDLE_FLAG_TUNNEL_BANDWIDTH2 := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global IPSEC_SA_BUNDLE_FLAG_TUNNEL_BANDWIDTH3 := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global IPSEC_SA_BUNDLE_FLAG_TUNNEL_BANDWIDTH4 := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global IPSEC_DOSP_DSCP_DISABLE_VALUE := 255

/**
 * @type {Integer (UInt32)}
 */
export global IPSEC_DOSP_RATE_LIMIT_DISABLE_VALUE := 0

/**
 * @type {Integer (UInt32)}
 */
export global IPSEC_KEY_MANAGER_FLAG_DICTATE_KEY := 1

/**
 * @type {Guid}
 */
export global FWPM_LAYER_INBOUND_IPPACKET_V4 := Guid("{c86fd1bf-21cd-497e-a0bb-17425c885c58}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_INBOUND_IPPACKET_V4_DISCARD := Guid("{b5a230d0-a8c0-44f2-916e-991b53ded1f7}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_INBOUND_IPPACKET_V6 := Guid("{f52032cb-991c-46e7-971d-2601459a91ca}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_INBOUND_IPPACKET_V6_DISCARD := Guid("{bb24c279-93b4-47a2-83ad-ae1698b50885}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_OUTBOUND_IPPACKET_V4 := Guid("{1e5c9fae-8a84-4135-a331-950b54229ecd}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_OUTBOUND_IPPACKET_V4_DISCARD := Guid("{08e4bcb5-b647-48f3-953c-e5ddbd03937e}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_OUTBOUND_IPPACKET_V6 := Guid("{a3b3ab6b-3564-488c-9117-f34e82142763}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_OUTBOUND_IPPACKET_V6_DISCARD := Guid("{9513d7c4-a934-49dc-91a7-6ccb80cc02e3}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_IPFORWARD_V4 := Guid("{a82acc24-4ee1-4ee1-b465-fd1d25cb10a4}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_IPFORWARD_V4_DISCARD := Guid("{9e9ea773-2fae-4210-8f17-34129ef369eb}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_IPFORWARD_V6 := Guid("{7b964818-19c7-493a-b71f-832c3684d28c}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_IPFORWARD_V6_DISCARD := Guid("{31524a5d-1dfe-472f-bb93-518ee945d8a2}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_INBOUND_TRANSPORT_V4 := Guid("{5926dfc8-e3cf-4426-a283-dc393f5d0f9d}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_INBOUND_TRANSPORT_V4_DISCARD := Guid("{ac4a9833-f69d-4648-b261-6dc84835ef39}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_INBOUND_TRANSPORT_V6 := Guid("{634a869f-fc23-4b90-b0c1-bf620a36ae6f}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_INBOUND_TRANSPORT_V6_DISCARD := Guid("{2a6ff955-3b2b-49d2-9848-ad9d72dcaab7}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_OUTBOUND_TRANSPORT_V4 := Guid("{09e61aea-d214-46e2-9b21-b26b0b2f28c8}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_OUTBOUND_TRANSPORT_V4_DISCARD := Guid("{c5f10551-bdb0-43d7-a313-50e211f4d68a}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_OUTBOUND_TRANSPORT_V6 := Guid("{e1735bde-013f-4655-b351-a49e15762df0}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_OUTBOUND_TRANSPORT_V6_DISCARD := Guid("{f433df69-ccbd-482e-b9b2-57165658c3b3}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_STREAM_V4 := Guid("{3b89653c-c170-49e4-b1cd-e0eeeee19a3e}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_STREAM_V4_DISCARD := Guid("{25c4c2c2-25ff-4352-82f9-c54a4a4726dc}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_STREAM_V6 := Guid("{47c9137a-7ec4-46b3-b6e4-48e926b1eda4}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_STREAM_V6_DISCARD := Guid("{10a59fc7-b628-4c41-9eb8-cf37d55103cf}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_DATAGRAM_DATA_V4 := Guid("{3d08bf4e-45f6-4930-a922-417098e20027}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_DATAGRAM_DATA_V4_DISCARD := Guid("{18e330c6-7248-4e52-aaab-472ed67704fd}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_DATAGRAM_DATA_V6 := Guid("{fa45fe2f-3cba-4427-87fc-57b9a4b10d00}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_DATAGRAM_DATA_V6_DISCARD := Guid("{09d1dfe1-9b86-4a42-be9d-8c315b92a5d0}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_INBOUND_ICMP_ERROR_V4 := Guid("{61499990-3cb6-4e84-b950-53b94b6964f3}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_INBOUND_ICMP_ERROR_V4_DISCARD := Guid("{a6b17075-ebaf-4053-a4e7-213c8121ede5}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_INBOUND_ICMP_ERROR_V6 := Guid("{65f9bdff-3b2d-4e5d-b8c6-c720651fe898}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_INBOUND_ICMP_ERROR_V6_DISCARD := Guid("{a6e7ccc0-08fb-468d-a472-9771d5595e09}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_OUTBOUND_ICMP_ERROR_V4 := Guid("{41390100-564c-4b32-bc1d-718048354d7c}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_OUTBOUND_ICMP_ERROR_V4_DISCARD := Guid("{b3598d36-0561-4588-a6bf-e955e3f6264b}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_OUTBOUND_ICMP_ERROR_V6 := Guid("{7fb03b60-7b8d-4dfa-badd-980176fc4e12}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_OUTBOUND_ICMP_ERROR_V6_DISCARD := Guid("{65f2e647-8d0c-4f47-b19b-33a4d3f1357c}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_ALE_RESOURCE_ASSIGNMENT_V4 := Guid("{1247d66d-0b60-4a15-8d44-7155d0f53a0c}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_ALE_RESOURCE_ASSIGNMENT_V4_DISCARD := Guid("{0b5812a2-c3ff-4eca-b88d-c79e20ac6322}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_ALE_RESOURCE_ASSIGNMENT_V6 := Guid("{55a650e1-5f0a-4eca-a653-88f53b26aa8c}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_ALE_RESOURCE_ASSIGNMENT_V6_DISCARD := Guid("{cbc998bb-c51f-4c1a-bb4f-9775fcacab2f}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_ALE_AUTH_LISTEN_V4 := Guid("{88bb5dad-76d7-4227-9c71-df0a3ed7be7e}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_ALE_AUTH_LISTEN_V4_DISCARD := Guid("{371dfada-9f26-45fd-b4eb-c29eb212893f}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_ALE_AUTH_LISTEN_V6 := Guid("{7ac9de24-17dd-4814-b4bd-a9fbc95a321b}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_ALE_AUTH_LISTEN_V6_DISCARD := Guid("{60703b07-63c8-48e9-ada3-12b1af40a617}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_ALE_AUTH_RECV_ACCEPT_V4 := Guid("{e1cd9fe7-f4b5-4273-96c0-592e487b8650}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_ALE_AUTH_RECV_ACCEPT_V4_DISCARD := Guid("{9eeaa99b-bd22-4227-919f-0073c63357b1}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_ALE_AUTH_RECV_ACCEPT_V6 := Guid("{a3b42c97-9f04-4672-b87e-cee9c483257f}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_ALE_AUTH_RECV_ACCEPT_V6_DISCARD := Guid("{89455b97-dbe1-453f-a224-13da895af396}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_ALE_AUTH_CONNECT_V4 := Guid("{c38d57d1-05a7-4c33-904f-7fbceee60e82}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_ALE_AUTH_CONNECT_V4_DISCARD := Guid("{d632a801-f5ba-4ad6-96e3-607017d9836a}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_ALE_AUTH_CONNECT_V6 := Guid("{4a72393b-319f-44bc-84c3-ba54dcb3b6b4}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_ALE_AUTH_CONNECT_V6_DISCARD := Guid("{c97bc3b8-c9a3-4e33-8695-8e17aad4de09}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_ALE_FLOW_ESTABLISHED_V4 := Guid("{af80470a-5596-4c13-9992-539e6fe57967}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_ALE_FLOW_ESTABLISHED_V4_DISCARD := Guid("{146ae4a9-a1d2-4d43-a31a-4c42682b8e4f}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_ALE_FLOW_ESTABLISHED_V6 := Guid("{7021d2b3-dfa4-406e-afeb-6afaf7e70efd}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_ALE_FLOW_ESTABLISHED_V6_DISCARD := Guid("{46928636-bbca-4b76-941d-0fa7f5d7d372}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_INBOUND_MAC_FRAME_ETHERNET := Guid("{effb7edb-0055-4f9a-a231-4ff8131ad191}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_OUTBOUND_MAC_FRAME_ETHERNET := Guid("{694673bc-d6db-4870-adee-0acdbdb7f4b2}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_INBOUND_MAC_FRAME_NATIVE := Guid("{d4220bd3-62ce-4f08-ae88-b56e8526df50}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_OUTBOUND_MAC_FRAME_NATIVE := Guid("{94c44912-9d6f-4ebf-b995-05ab8a088d1b}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_INGRESS_VSWITCH_ETHERNET := Guid("{7d98577a-9a87-41ec-9718-7cf589c9f32d}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_EGRESS_VSWITCH_ETHERNET := Guid("{86c872b0-76fa-4b79-93a4-0750530ae292}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_INGRESS_VSWITCH_TRANSPORT_V4 := Guid("{b2696ff6-774f-4554-9f7d-3da3945f8e85}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_INGRESS_VSWITCH_TRANSPORT_V6 := Guid("{5ee314fc-7d8a-47f4-b7e3-291a36da4e12}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_EGRESS_VSWITCH_TRANSPORT_V4 := Guid("{b92350b6-91f0-46b6-bdc4-871dfd4a7c98}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_EGRESS_VSWITCH_TRANSPORT_V6 := Guid("{1b2def23-1881-40bd-82f4-4254e63141cb}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_INBOUND_TRANSPORT_FAST := Guid("{e41d2719-05c7-40f0-8983-ea8d17bbc2f6}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_OUTBOUND_TRANSPORT_FAST := Guid("{13ed4388-a070-4815-9935-7a9be6408b78}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_INBOUND_MAC_FRAME_NATIVE_FAST := Guid("{853aaa8e-2b78-4d24-a804-36db08b29711}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_OUTBOUND_MAC_FRAME_NATIVE_FAST := Guid("{470df946-c962-486f-9446-8293cbc75eb8}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_IPSEC_KM_DEMUX_V4 := Guid("{f02b1526-a459-4a51-b9e3-759de52b9d2c}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_IPSEC_KM_DEMUX_V6 := Guid("{2f755cf6-2fd4-4e88-b3e4-a91bca495235}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_IPSEC_V4 := Guid("{eda65c74-610d-4bc5-948f-3c4f89556867}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_IPSEC_V6 := Guid("{13c48442-8d87-4261-9a29-59d2abc348b4}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_IKEEXT_V4 := Guid("{b14b7bdb-dbbd-473e-bed4-8b4708d4f270}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_IKEEXT_V6 := Guid("{b64786b3-f687-4eb9-89d2-8ef32acdabe2}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_RPC_UM := Guid("{75a89dda-95e4-40f3-adc7-7688a9c847e1}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_RPC_EPMAP := Guid("{9247bc61-eb07-47ee-872c-bfd78bfd1616}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_RPC_EP_ADD := Guid("{618dffc7-c450-4943-95db-99b4c16a55d4}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_RPC_PROXY_CONN := Guid("{94a4b50b-ba5c-4f27-907a-229fac0c2a7a}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_RPC_PROXY_IF := Guid("{f8a38615-e12c-41ac-98df-121ad981aade}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_KM_AUTHORIZATION := Guid("{4aa226e9-9020-45fb-956a-c0249d841195}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_NAME_RESOLUTION_CACHE_V4 := Guid("{0c2aa681-905b-4ccd-a467-4dd811d07b7b}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_NAME_RESOLUTION_CACHE_V6 := Guid("{92d592fa-6b01-434a-9dea-d1e96ea97da9}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_ALE_RESOURCE_RELEASE_V4 := Guid("{74365cce-ccb0-401a-bfc1-b89934ad7e15}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_ALE_RESOURCE_RELEASE_V6 := Guid("{f4e5ce80-edcc-4e13-8a2f-b91454bb057b}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_ALE_ENDPOINT_CLOSURE_V4 := Guid("{b4766427-e2a2-467a-bd7e-dbcd1bd85a09}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_ALE_ENDPOINT_CLOSURE_V6 := Guid("{bb536ccd-4755-4ba9-9ff7-f9edf8699c7b}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_ALE_CONNECT_REDIRECT_V4 := Guid("{c6e63c8c-b784-4562-aa7d-0a67cfcaf9a3}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_ALE_CONNECT_REDIRECT_V6 := Guid("{587e54a7-8046-42ba-a0aa-b716250fc7fd}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_ALE_BIND_REDIRECT_V4 := Guid("{66978cad-c704-42ac-86ac-7c1a231bd253}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_ALE_BIND_REDIRECT_V6 := Guid("{bef02c9c-606b-4536-8c26-1c2fc7b631d4}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_STREAM_PACKET_V4 := Guid("{af52d8ec-cb2d-44e5-ad92-f8dc38d2eb29}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_STREAM_PACKET_V6 := Guid("{779a8ca3-f099-468f-b5d4-83535c461c02}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_INBOUND_RESERVED2 := Guid("{f4fb8d55-c076-46d8-a2c7-6a4c722ca4ed}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_OUTBOUND_NETWORK_CONNECTION_POLICY_V4 := Guid("{037f317a-d696-494a-bba5-bffc265e6052}")

/**
 * @type {Guid}
 */
export global FWPM_LAYER_OUTBOUND_NETWORK_CONNECTION_POLICY_V6 := Guid("{22a4fdb1-6d7e-48ae-ae77-3742525c3119}")

/**
 * @type {Guid}
 */
export global FWPM_SUBLAYER_RPC_AUDIT := Guid("{758c84f4-fb48-4de9-9aeb-3ed9551ab1fd}")

/**
 * @type {Guid}
 */
export global FWPM_SUBLAYER_IPSEC_TUNNEL := Guid("{83f299ed-9ff4-4967-aff4-c309f4dab827}")

/**
 * @type {Guid}
 */
export global FWPM_SUBLAYER_UNIVERSAL := Guid("{eebecc03-ced4-4380-819a-2734397b2b74}")

/**
 * @type {Guid}
 */
export global FWPM_SUBLAYER_LIPS := Guid("{1b75c0ce-ff60-4711-a70f-b4958cc3b2d0}")

/**
 * @type {Guid}
 */
export global FWPM_SUBLAYER_SECURE_SOCKET := Guid("{15a66e17-3f3c-4f7b-aa6c-812aa613dd82}")

/**
 * @type {Guid}
 */
export global FWPM_SUBLAYER_TCP_CHIMNEY_OFFLOAD := Guid("{337608b9-b7d5-4d5f-82f9-3618618bc058}")

/**
 * @type {Guid}
 */
export global FWPM_SUBLAYER_INSPECTION := Guid("{877519e1-e6a9-41a5-81b4-8c4f118e4a60}")

/**
 * @type {Guid}
 */
export global FWPM_SUBLAYER_TEREDO := Guid("{ba69dc66-5176-4979-9c89-26a7b46a8327}")

/**
 * @type {Guid}
 */
export global FWPM_SUBLAYER_IPSEC_FORWARD_OUTBOUND_TUNNEL := Guid("{a5082e73-8f71-4559-8a9a-101cea04ef87}")

/**
 * @type {Guid}
 */
export global FWPM_SUBLAYER_IPSEC_DOSP := Guid("{e076d572-5d3d-48ef-802b-909eddb098bd}")

/**
 * @type {Guid}
 */
export global FWPM_SUBLAYER_TCP_TEMPLATES := Guid("{24421dcf-0ac5-4caa-9e14-50f6e3636af0}")

/**
 * @type {Guid}
 */
export global FWPM_SUBLAYER_IPSEC_SECURITY_REALM := Guid("{37a57701-5884-4964-92b8-3e704688b0ad}")

/**
 * @type {Guid}
 */
export global FWPM_SUBLAYER_MPSSVC_WSH := Guid("{b3cdd441-af90-41ba-a745-7c6008ff2300}")

/**
 * @type {Guid}
 */
export global FWPM_SUBLAYER_MPSSVC_WF := Guid("{b3cdd441-af90-41ba-a745-7c6008ff2301}")

/**
 * @type {Guid}
 */
export global FWPM_SUBLAYER_MPSSVC_QUARANTINE := Guid("{b3cdd441-af90-41ba-a745-7c6008ff2302}")

/**
 * @type {Guid}
 */
export global FWPM_SUBLAYER_MPSSVC_EDP := Guid("{09a47e38-fa97-471b-b123-18bcd7e65071}")

/**
 * @type {Guid}
 */
export global FWPM_SUBLAYER_MPSSVC_TENANT_RESTRICTIONS := Guid("{1ec6c7e1-fdd9-478a-b55f-ff8ba1d2c17d}")

/**
 * @type {Guid}
 */
export global FWPM_SUBLAYER_MPSSVC_APP_ISOLATION := Guid("{ffe221c3-92a8-4564-a59f-dafb70756020}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_ALE_PACKAGE_FAMILY_NAME := Guid("{81bc78fb-f28d-4886-a604-6acc261f261b}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_INTERFACE_MAC_ADDRESS := Guid("{f6e63dce-1f4b-4c6b-b6ef-1165e71f8ee7}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_MAC_LOCAL_ADDRESS := Guid("{d999e981-7948-4c83-b742-c84e3b678f8f}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_MAC_REMOTE_ADDRESS := Guid("{408f2ed4-3a70-4b4d-92a6-415ac20e2f12}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_ETHER_TYPE := Guid("{fd08948d-a219-4d52-bb98-1a5540ee7b4e}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_VLAN_ID := Guid("{938eab21-3618-4e64-9ca5-2141ebda1ca2}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_VSWITCH_TENANT_NETWORK_ID := Guid("{dc04843c-79e6-4e44-a025-65b9bb0f9f94}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_NDIS_PORT := Guid("{db7bb42b-2dac-4cd4-a59a-e0bdce1e6834}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_NDIS_MEDIA_TYPE := Guid("{cb31cef1-791d-473b-89d1-61c5984304a0}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_NDIS_PHYSICAL_MEDIA_TYPE := Guid("{34c79823-c229-44f2-b83c-74020882ae77}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_L2_FLAGS := Guid("{7bc43cbf-37ba-45f1-b74a-82ff518eeb10}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_MAC_LOCAL_ADDRESS_TYPE := Guid("{cc31355c-3073-4ffb-a14f-79415cb1ead1}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_MAC_REMOTE_ADDRESS_TYPE := Guid("{027fedb4-f1c1-4030-b564-ee777fd867ea}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_ALE_PACKAGE_ID := Guid("{71bc78fa-f17c-4997-a602-6abb261f351c}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_MAC_SOURCE_ADDRESS := Guid("{7b795451-f1f6-4d05-b7cb-21779d802336}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_MAC_DESTINATION_ADDRESS := Guid("{04ea2a93-858c-4027-b613-b43180c7859e}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_MAC_SOURCE_ADDRESS_TYPE := Guid("{5c1b72e4-299e-4437-a298-bc3f014b3dc2}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_MAC_DESTINATION_ADDRESS_TYPE := Guid("{ae052932-ef42-4e99-b129-f3b3139e34f7}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_IP_SOURCE_PORT := Guid("{a6afef91-3df4-4730-a214-f5426aebf821}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_IP_DESTINATION_PORT := Guid("{ce6def45-60fb-4a7b-a304-af30a117000e}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_VSWITCH_ID := Guid("{c4a414ba-437b-4de6-9946-d99c1b95b312}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_VSWITCH_NETWORK_TYPE := Guid("{11d48b4b-e77a-40b4-9155-392c906c2608}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_VSWITCH_SOURCE_INTERFACE_ID := Guid("{7f4ef24b-b2c1-4938-ba33-a1ecbed512ba}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_VSWITCH_DESTINATION_INTERFACE_ID := Guid("{8ed48be4-c926-49f6-a4f6-ef3030e3fc16}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_VSWITCH_SOURCE_VM_ID := Guid("{9c2a9ec2-9fc6-42bc-bdd8-406d4da0be64}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_VSWITCH_DESTINATION_VM_ID := Guid("{6106aace-4de1-4c84-9671-3637f8bcf731}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_VSWITCH_SOURCE_INTERFACE_TYPE := Guid("{e6b040a2-edaf-4c36-908b-f2f58ae43807}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_VSWITCH_DESTINATION_INTERFACE_TYPE := Guid("{fa9b3f06-2f1a-4c57-9e68-a7098b28dbfe}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_ALE_SECURITY_ATTRIBUTE_FQBN_VALUE := Guid("{37a57699-5883-4963-92b8-3e704688b0ad}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_IPSEC_SECURITY_REALM_ID := Guid("{37a57700-5884-4964-92b8-3e704688b0ad}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_ALE_EFFECTIVE_NAME := Guid("{b1277b9a-b781-40fc-9671-e5f1b989f34e}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_IP_LOCAL_ADDRESS := Guid("{d9ee00de-c1ef-4617-bfe3-ffd8f5a08957}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_IP_REMOTE_ADDRESS := Guid("{b235ae9a-1d64-49b8-a44c-5ff3d9095045}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_IP_SOURCE_ADDRESS := Guid("{ae96897e-2e94-4bc9-b313-b27ee80e574d}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_IP_DESTINATION_ADDRESS := Guid("{2d79133b-b390-45c6-8699-acaceaafed33}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_IP_LOCAL_ADDRESS_TYPE := Guid("{6ec7f6c4-376b-45d7-9e9c-d337cedcd237}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_IP_DESTINATION_ADDRESS_TYPE := Guid("{1ec1b7c9-4eea-4f5e-b9ef-76beaaaf17ee}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_IP_NEXTHOP_ADDRESS := Guid("{eabe448a-a711-4d64-85b7-3f76b65299c7}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_IP_LOCAL_INTERFACE := Guid("{4cd62a49-59c3-4969-b7f3-bda5d32890a4}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_IP_ARRIVAL_INTERFACE := Guid("{618a9b6d-386b-4136-ad6e-b51587cfb1cd}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_ARRIVAL_INTERFACE_TYPE := Guid("{89f990de-e798-4e6d-ab76-7c9558292e6f}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_ARRIVAL_TUNNEL_TYPE := Guid("{511166dc-7a8c-4aa7-b533-95ab59fb0340}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_ARRIVAL_INTERFACE_INDEX := Guid("{cc088db3-1792-4a71-b0f9-037d21cd828b}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_NEXTHOP_SUB_INTERFACE_INDEX := Guid("{ef8a6122-0577-45a7-9aaf-825fbeb4fb95}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_IP_NEXTHOP_INTERFACE := Guid("{93ae8f5b-7f6f-4719-98c8-14e97429ef04}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_NEXTHOP_INTERFACE_TYPE := Guid("{97537c6c-d9a3-4767-a381-e942675cd920}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_NEXTHOP_TUNNEL_TYPE := Guid("{72b1a111-987b-4720-99dd-c7c576fa2d4c}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_NEXTHOP_INTERFACE_INDEX := Guid("{138e6888-7ab8-4d65-9ee8-0591bcf6a494}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_ORIGINAL_PROFILE_ID := Guid("{46ea1551-2255-492b-8019-aabeee349f40}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_CURRENT_PROFILE_ID := Guid("{ab3033c9-c0e3-4759-937d-5758c65d4ae3}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_LOCAL_INTERFACE_PROFILE_ID := Guid("{4ebf7562-9f18-4d06-9941-a7a625744d71}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_ARRIVAL_INTERFACE_PROFILE_ID := Guid("{cdfe6aab-c083-4142-8679-c08f95329c61}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_NEXTHOP_INTERFACE_PROFILE_ID := Guid("{d7ff9a56-cdaa-472b-84db-d23963c1d1bf}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_REAUTHORIZE_REASON := Guid("{11205e8c-11ae-457a-8a44-477026dd764a}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_ORIGINAL_ICMP_TYPE := Guid("{076dfdbe-c56c-4f72-ae8a-2cfe7e5c8286}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_IP_PHYSICAL_ARRIVAL_INTERFACE := Guid("{da50d5c8-fa0d-4c89-b032-6e62136d1e96}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_IP_PHYSICAL_NEXTHOP_INTERFACE := Guid("{f09bd5ce-5150-48be-b098-c25152fb1f92}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_INTERFACE_QUARANTINE_EPOCH := Guid("{cce68d5e-053b-43a8-9a6f-33384c28e4f6}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_INTERFACE_TYPE := Guid("{daf8cd14-e09e-4c93-a5ae-c5c13b73ffca}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_TUNNEL_TYPE := Guid("{77a40437-8779-4868-a261-f5a902f1c0cd}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_IP_FORWARD_INTERFACE := Guid("{1076b8a5-6323-4c5e-9810-e8d3fc9e6136}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_IP_PROTOCOL := Guid("{3971ef2b-623e-4f9a-8cb1-6e79b806b9a7}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_IP_LOCAL_PORT := Guid("{0c1ba1af-5765-453f-af22-a8f791ac775b}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_IP_REMOTE_PORT := Guid("{c35a604d-d22b-4e1a-91b4-68f674ee674b}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_EMBEDDED_LOCAL_ADDRESS_TYPE := Guid("{4672a468-8a0a-4202-abb4-849e92e66809}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_EMBEDDED_REMOTE_ADDRESS := Guid("{77ee4b39-3273-4671-b63b-ab6feb66eeb6}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_EMBEDDED_PROTOCOL := Guid("{07784107-a29e-4c7b-9ec7-29c44afafdbc}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_EMBEDDED_LOCAL_PORT := Guid("{bfca394d-acdb-484e-b8e6-2aff79757345}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_EMBEDDED_REMOTE_PORT := Guid("{cae4d6a1-2968-40ed-a4ce-547160dda88d}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_FLAGS := Guid("{632ce23b-5167-435c-86d7-e903684aa80c}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_DIRECTION := Guid("{8784c146-ca97-44d6-9fd1-19fb1840cbf7}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_INTERFACE_INDEX := Guid("{667fd755-d695-434a-8af5-d3835a1259bc}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_SUB_INTERFACE_INDEX := Guid("{0cd42473-d621-4be3-ae8c-72a348d283e1}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_SOURCE_INTERFACE_INDEX := Guid("{2311334d-c92d-45bf-9496-edf447820e2d}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_SOURCE_SUB_INTERFACE_INDEX := Guid("{055edd9d-acd2-4361-8dab-f9525d97662f}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_DESTINATION_INTERFACE_INDEX := Guid("{35cf6522-4139-45ee-a0d5-67b80949d879}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_DESTINATION_SUB_INTERFACE_INDEX := Guid("{2b7d4399-d4c7-4738-a2f5-e994b43da388}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_ALE_APP_ID := Guid("{d78e1e87-8644-4ea5-9437-d809ecefc971}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_ALE_ORIGINAL_APP_ID := Guid("{0e6cd086-e1fb-4212-842f-8a9f993fb3f6}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_ALE_USER_ID := Guid("{af043a0a-b34d-4f86-979c-c90371af6e66}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_ALE_REMOTE_USER_ID := Guid("{f63073b7-0189-4ab0-95a4-6123cbfab862}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_ALE_REMOTE_MACHINE_ID := Guid("{1aa47f51-7f93-4508-a271-81abb00c9cab}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_ALE_PROMISCUOUS_MODE := Guid("{1c974776-7182-46e9-afd3-b02910e30334}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_ALE_SIO_FIREWALL_SYSTEM_PORT := Guid("{b9f4e088-cb98-4efb-a2c7-ad07332643db}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_ALE_REAUTH_REASON := Guid("{b482d227-1979-4a98-8044-18bbe6237542}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_ALE_NAP_CONTEXT := Guid("{46275a9d-c03f-4d77-b784-1c57f4d02753}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_KM_AUTH_NAP_CONTEXT := Guid("{35d0ea0e-15ca-492b-900e-97fd46352cce}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_REMOTE_USER_TOKEN := Guid("{9bf0ee66-06c9-41b9-84da-288cb43af51f}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_RPC_IF_UUID := Guid("{7c9c7d9f-0075-4d35-a0d1-8311c4cf6af1}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_RPC_IF_VERSION := Guid("{eabfd9b7-1262-4a2e-adaa-5f96f6fe326d}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_RPC_IF_FLAG := Guid("{238a8a32-3199-467d-871c-272621ab3896}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_DCOM_APP_ID := Guid("{ff2e7b4d-3112-4770-b636-4d24ae3a6af2}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_IMAGE_NAME := Guid("{d024de4d-deaa-4317-9c85-e40ef6e140c3}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_RPC_PROTOCOL := Guid("{2717bc74-3a35-4ce7-b7ef-c838fabdec45}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_RPC_AUTH_TYPE := Guid("{daba74ab-0d67-43e7-986e-75b84f82f594}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_RPC_AUTH_LEVEL := Guid("{e5a0aed5-59ac-46ea-be05-a5f05ecf446e}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_SEC_ENCRYPT_ALGORITHM := Guid("{0d306ef0-e974-4f74-b5c7-591b0da7d562}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_SEC_KEY_SIZE := Guid("{4772183b-ccf8-4aeb-bce1-c6c6161c8fe4}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_IP_LOCAL_ADDRESS_V4 := Guid("{03a629cb-6e52-49f8-9c41-5709633c09cf}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_IP_LOCAL_ADDRESS_V6 := Guid("{2381be84-7524-45b3-a05b-1e637d9c7a6a}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_PIPE := Guid("{1bd0741d-e3df-4e24-8634-762046eef6eb}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_IP_REMOTE_ADDRESS_V4 := Guid("{1febb610-3bcc-45e1-bc36-2e067e2cb186}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_IP_REMOTE_ADDRESS_V6 := Guid("{246e1d8c-8bee-4018-9b98-31d4582f3361}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_RPC_OPNUM := Guid("{d58efb76-aab7-4148-a87e-9581134129b9}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_PROCESS_WITH_RPC_IF_UUID := Guid("{e31180a8-bbbd-4d14-a65e-7157b06233bb}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_RPC_EP_VALUE := Guid("{dccea0b9-0886-4360-9c6a-ab043a24fba9}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_RPC_EP_FLAGS := Guid("{218b814a-0a39-49b8-8e71-c20c39c7dd2e}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_CLIENT_TOKEN := Guid("{c228fc1e-403a-4478-be05-c9baa4c05ace}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_RPC_SERVER_NAME := Guid("{b605a225-c3b3-48c7-9833-7aefa9527546}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_RPC_SERVER_PORT := Guid("{8090f645-9ad5-4e3b-9f9f-8023ca097909}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_RPC_PROXY_AUTH_TYPE := Guid("{40953fe2-8565-4759-8488-1771b4b4b5db}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_CLIENT_CERT_KEY_LENGTH := Guid("{a3ec00c7-05f4-4df7-91f2-5f60d91ff443}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_CLIENT_CERT_OID := Guid("{c491ad5e-f882-4283-b916-436b103ff4ad}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_NET_EVENT_TYPE := Guid("{206e9996-490e-40cf-b831-b38641eb6fcb}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_PEER_NAME := Guid("{9b539082-eb90-4186-a6cc-de5b63235016}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_REMOTE_ID := Guid("{f68166fd-0682-4c89-b8f5-86436c7ef9b7}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_AUTHENTICATION_TYPE := Guid("{eb458cd5-da7b-4ef9-8d43-7b0a840332f2}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_KM_TYPE := Guid("{ff0f5f49-0ceb-481b-8638-1479791f3f2c}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_KM_MODE := Guid("{feef4582-ef8f-4f7b-858b-9077d122de47}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_IPSEC_POLICY_KEY := Guid("{ad37dee3-722f-45cc-a4e3-068048124452}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_QM_MODE := Guid("{f64fc6d1-f9cb-43d2-8a5f-e13bc894f265}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_COMPARTMENT_ID := Guid("{35a791ab-04ac-4ff2-a6bb-da6cfac71806}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_RESERVED0 := Guid("{678f4deb-45af-4882-93fe-19d4729d9834}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_RESERVED1 := Guid("{d818f827-5c69-48eb-bf80-d86b17755f97}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_RESERVED2 := Guid("{53d4123d-e15b-4e84-b7a8-dce16f7b62d9}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_RESERVED3 := Guid("{7f6e8ca3-6606-4932-97c7-e1f20710af3b}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_RESERVED4 := Guid("{5f58e642-b937-495e-a94b-f6b051a49250}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_RESERVED5 := Guid("{9ba8f6cd-f77c-43e6-8847-11939dc5db5a}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_RESERVED6 := Guid("{f13d84bd-59d5-44c4-8817-5ecdae1805bd}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_RESERVED7 := Guid("{65a0f930-45dd-4983-aa33-efc7b611af08}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_RESERVED8 := Guid("{4f424974-0c12-4816-9b47-9a547db39a32}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_RESERVED9 := Guid("{ce78e10f-13ff-4c70-8643-36ad1879afa3}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_RESERVED10 := Guid("{b979e282-d621-4c8c-b184-b105a61c36ce}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_RESERVED11 := Guid("{2d62ee4d-023d-411f-9582-43acbb795975}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_RESERVED12 := Guid("{a3677c32-7e35-4ddc-93da-e8c33fc923c7}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_RESERVED13 := Guid("{335a3e90-84aa-42f5-9e6f-59309536a44c}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_RESERVED14 := Guid("{30e44da2-2f1a-4116-a559-f907de83604a}")

/**
 * @type {Guid}
 */
export global FWPM_CONDITION_RESERVED15 := Guid("{bab8340f-afe0-43d1-80d8-5ca456962de3}")

/**
 * @type {Guid}
 */
export global FWPM_PROVIDER_IKEEXT := Guid("{10ad9216-ccde-456c-8b16-e9f04e60a90b}")

/**
 * @type {Guid}
 */
export global FWPM_PROVIDER_IPSEC_DOSP_CONFIG := Guid("{3c6c05a9-c05c-4bb9-8338-2327814ce8bf}")

/**
 * @type {Guid}
 */
export global FWPM_PROVIDER_TCP_CHIMNEY_OFFLOAD := Guid("{896aa19e-9a34-4bcb-ae79-beb9127c84b9}")

/**
 * @type {Guid}
 */
export global FWPM_PROVIDER_TCP_TEMPLATES := Guid("{76cfcd30-3394-432d-bed3-441ae50e63c3}")

/**
 * @type {Guid}
 */
export global FWPM_PROVIDER_MPSSVC_WSH := Guid("{4b153735-1049-4480-aab4-d1b9bdc03710}")

/**
 * @type {Guid}
 */
export global FWPM_PROVIDER_MPSSVC_WF := Guid("{decc16ca-3f33-4346-be1e-8fb4ae0f3d62}")

/**
 * @type {Guid}
 */
export global FWPM_PROVIDER_MPSSVC_EDP := Guid("{a90296f7-46b8-4457-8f84-b05e05d3c622}")

/**
 * @type {Guid}
 */
export global FWPM_PROVIDER_MPSSVC_TENANT_RESTRICTIONS := Guid("{d0718ff9-44da-4f50-9dc2-c963a4247613}")

/**
 * @type {Guid}
 */
export global FWPM_PROVIDER_MPSSVC_APP_ISOLATION := Guid("{3cc2631f-2d5d-43a0-b174-614837d863a1}")

/**
 * @type {Guid}
 */
export global FWPM_CALLOUT_IPSEC_INBOUND_TRANSPORT_V4 := Guid("{5132900d-5e84-4b5f-80e4-01741e81ff10}")

/**
 * @type {Guid}
 */
export global FWPM_CALLOUT_IPSEC_INBOUND_TRANSPORT_V6 := Guid("{49d3ac92-2a6c-4dcf-955f-1c3be009dd99}")

/**
 * @type {Guid}
 */
export global FWPM_CALLOUT_IPSEC_OUTBOUND_TRANSPORT_V4 := Guid("{4b46bf0a-4523-4e57-aa38-a87987c910d9}")

/**
 * @type {Guid}
 */
export global FWPM_CALLOUT_IPSEC_OUTBOUND_TRANSPORT_V6 := Guid("{38d87722-ad83-4f11-a91f-df0fb077225b}")

/**
 * @type {Guid}
 */
export global FWPM_CALLOUT_IPSEC_INBOUND_TUNNEL_V4 := Guid("{191a8a46-0bf8-46cf-b045-4b45dfa6a324}")

/**
 * @type {Guid}
 */
export global FWPM_CALLOUT_IPSEC_INBOUND_TUNNEL_V6 := Guid("{80c342e3-1e53-4d6f-9b44-03df5aeee154}")

/**
 * @type {Guid}
 */
export global FWPM_CALLOUT_IPSEC_OUTBOUND_TUNNEL_V4 := Guid("{70a4196c-835b-4fb0-98e8-075f4d977d46}")

/**
 * @type {Guid}
 */
export global FWPM_CALLOUT_IPSEC_OUTBOUND_TUNNEL_V6 := Guid("{f1835363-a6a5-4e62-b180-23db789d8da6}")

/**
 * @type {Guid}
 */
export global FWPM_CALLOUT_IPSEC_FORWARD_INBOUND_TUNNEL_V4 := Guid("{28829633-c4f0-4e66-873f-844db2a899c7}")

/**
 * @type {Guid}
 */
export global FWPM_CALLOUT_IPSEC_FORWARD_INBOUND_TUNNEL_V6 := Guid("{af50bec2-c686-429a-884d-b74443e7b0b4}")

/**
 * @type {Guid}
 */
export global FWPM_CALLOUT_IPSEC_FORWARD_OUTBOUND_TUNNEL_V4 := Guid("{fb532136-15cb-440b-937c-1717ca320c40}")

/**
 * @type {Guid}
 */
export global FWPM_CALLOUT_IPSEC_FORWARD_OUTBOUND_TUNNEL_V6 := Guid("{dae640cc-e021-4bee-9eb6-a48b275c8c1d}")

/**
 * @type {Guid}
 */
export global FWPM_CALLOUT_IPSEC_INBOUND_INITIATE_SECURE_V4 := Guid("{7dff309b-ba7d-4aba-91aa-ae5c6640c944}")

/**
 * @type {Guid}
 */
export global FWPM_CALLOUT_IPSEC_INBOUND_INITIATE_SECURE_V6 := Guid("{a9a0d6d9-c58c-474e-8aeb-3cfe99d6d53d}")

/**
 * @type {Guid}
 */
export global FWPM_CALLOUT_IPSEC_INBOUND_TUNNEL_ALE_ACCEPT_V4 := Guid("{3df6e7de-fd20-48f2-9f26-f854444cba79}")

/**
 * @type {Guid}
 */
export global FWPM_CALLOUT_IPSEC_INBOUND_TUNNEL_ALE_ACCEPT_V6 := Guid("{a1e392d3-72ac-47bb-87a7-0122c69434ab}")

/**
 * @type {Guid}
 */
export global FWPM_CALLOUT_IPSEC_ALE_CONNECT_V4 := Guid("{6ac141fc-f75d-4203-b9c8-48e6149c2712}")

/**
 * @type {Guid}
 */
export global FWPM_CALLOUT_IPSEC_ALE_CONNECT_V6 := Guid("{4c0dda05-e31f-4666-90b0-b3dfad34129a}")

/**
 * @type {Guid}
 */
export global FWPM_CALLOUT_IPSEC_DOSP_FORWARD_V6 := Guid("{6d08a342-db9e-4fbe-9ed2-57374ce89f79}")

/**
 * @type {Guid}
 */
export global FWPM_CALLOUT_IPSEC_DOSP_FORWARD_V4 := Guid("{2fcb56ec-cd37-4b4f-b108-62c2b1850a0c}")

/**
 * @type {Guid}
 */
export global FWPM_CALLOUT_WFP_TRANSPORT_LAYER_V4_SILENT_DROP := Guid("{eda08606-2494-4d78-89bc-67837c03b969}")

/**
 * @type {Guid}
 */
export global FWPM_CALLOUT_WFP_TRANSPORT_LAYER_V6_SILENT_DROP := Guid("{8693cc74-a075-4156-b476-9286eece814e}")

/**
 * @type {Guid}
 */
export global FWPM_CALLOUT_TCP_CHIMNEY_CONNECT_LAYER_V4 := Guid("{f3e10ab3-2c25-4279-ac36-c30fc181bec4}")

/**
 * @type {Guid}
 */
export global FWPM_CALLOUT_TCP_CHIMNEY_CONNECT_LAYER_V6 := Guid("{39e22085-a341-42fc-a279-aec94e689c56}")

/**
 * @type {Guid}
 */
export global FWPM_CALLOUT_TCP_CHIMNEY_ACCEPT_LAYER_V4 := Guid("{e183ecb2-3a7f-4b54-8ad9-76050ed880ca}")

/**
 * @type {Guid}
 */
export global FWPM_CALLOUT_TCP_CHIMNEY_ACCEPT_LAYER_V6 := Guid("{0378cf41-bf98-4603-81f2-7f12586079f6}")

/**
 * @type {Guid}
 */
export global FWPM_CALLOUT_SET_OPTIONS_AUTH_CONNECT_LAYER_V4 := Guid("{bc582280-1677-41e9-94ab-c2fcb15c2eeb}")

/**
 * @type {Guid}
 */
export global FWPM_CALLOUT_SET_OPTIONS_AUTH_CONNECT_LAYER_V6 := Guid("{98e5373c-b884-490f-b65f-2f6a4a575195}")

/**
 * @type {Guid}
 */
export global FWPM_CALLOUT_SET_OPTIONS_AUTH_RECV_ACCEPT_LAYER_V4 := Guid("{2d55f008-0c01-4f92-b26e-a08a94569b8d}")

/**
 * @type {Guid}
 */
export global FWPM_CALLOUT_SET_OPTIONS_AUTH_RECV_ACCEPT_LAYER_V6 := Guid("{63018537-f281-4dc4-83d3-8dec18b7ade2}")

/**
 * @type {Guid}
 */
export global FWPM_CALLOUT_RESERVED_AUTH_CONNECT_LAYER_V4 := Guid("{288b524d-0566-4e19-b612-8f441a2e5949}")

/**
 * @type {Guid}
 */
export global FWPM_CALLOUT_RESERVED_AUTH_CONNECT_LAYER_V6 := Guid("{00b84b92-2b5e-4b71-ab0e-aaca43e387e6}")

/**
 * @type {Guid}
 */
export global FWPM_CALLOUT_TEREDO_ALE_RESOURCE_ASSIGNMENT_V6 := Guid("{31b95392-066e-42a2-b7db-92f8acdd56f9}")

/**
 * @type {Guid}
 */
export global FWPM_CALLOUT_EDGE_TRAVERSAL_ALE_RESOURCE_ASSIGNMENT_V4 := Guid("{079b1010-f1c5-4fcd-ae05-da41107abd0b}")

/**
 * @type {Guid}
 */
export global FWPM_CALLOUT_TEREDO_ALE_LISTEN_V6 := Guid("{81a434e7-f60c-4378-bab8-c625a30f0197}")

/**
 * @type {Guid}
 */
export global FWPM_CALLOUT_EDGE_TRAVERSAL_ALE_LISTEN_V4 := Guid("{33486ab5-6d5e-4e65-a00b-a7afed0ba9a1}")

/**
 * @type {Guid}
 */
export global FWPM_CALLOUT_TCP_TEMPLATES_CONNECT_LAYER_V4 := Guid("{215a0b39-4b7e-4eda-8ce4-179679df6224}")

/**
 * @type {Guid}
 */
export global FWPM_CALLOUT_TCP_TEMPLATES_CONNECT_LAYER_V6 := Guid("{838b37a1-5c12-4d34-8b38-078728b2d25c}")

/**
 * @type {Guid}
 */
export global FWPM_CALLOUT_TCP_TEMPLATES_ACCEPT_LAYER_V4 := Guid("{2f23f5d0-40c4-4c41-a254-46d8dba8957c}")

/**
 * @type {Guid}
 */
export global FWPM_CALLOUT_TCP_TEMPLATES_ACCEPT_LAYER_V6 := Guid("{b25152f0-991c-4f53-bbe7-d24b45fe632c}")

/**
 * @type {Guid}
 */
export global FWPM_CALLOUT_POLICY_SILENT_MODE_AUTH_CONNECT_LAYER_V4 := Guid("{5fbfc31d-a51c-44dc-acb6-0624a030a700}")

/**
 * @type {Guid}
 */
export global FWPM_CALLOUT_POLICY_SILENT_MODE_AUTH_CONNECT_LAYER_V6 := Guid("{5fbfc31d-a51c-44dc-acb6-0624a030a701}")

/**
 * @type {Guid}
 */
export global FWPM_CALLOUT_POLICY_SILENT_MODE_AUTH_RECV_ACCEPT_LAYER_V4 := Guid("{5fbfc31d-a51c-44dc-acb6-0624a030a702}")

/**
 * @type {Guid}
 */
export global FWPM_CALLOUT_POLICY_SILENT_MODE_AUTH_RECV_ACCEPT_LAYER_V6 := Guid("{5fbfc31d-a51c-44dc-acb6-0624a030a703}")

/**
 * @type {Guid}
 */
export global FWPM_CALLOUT_HTTP_TEMPLATE_SSL_HANDSHAKE := Guid("{b3423249-8d09-4858-9210-95c7fda8e30f}")

/**
 * @type {Guid}
 */
export global FWPM_CALLOUT_OUTBOUND_NETWORK_CONNECTION_POLICY_LAYER_V4 := Guid("{103090d4-8e28-4fd6-9894-d1d67d6b10c9}")

/**
 * @type {Guid}
 */
export global FWPM_CALLOUT_OUTBOUND_NETWORK_CONNECTION_POLICY_LAYER_V6 := Guid("{4ed3446d-8dc7-459b-b09f-c1cb7a8f8689}")

/**
 * @type {Guid}
 */
export global FWPM_CALLOUT_BUILT_IN_RESERVED_1 := Guid("{779719a4-e695-47b6-a199-7999fec9163b}")

/**
 * @type {Guid}
 */
export global FWPM_CALLOUT_BUILT_IN_RESERVED_2 := Guid("{ef9661b6-7c5e-48fd-a130-96678ceacc41}")

/**
 * @type {Guid}
 */
export global FWPM_CALLOUT_BUILT_IN_RESERVED_3 := Guid("{18729c7a-2f62-4be0-966f-974b21b86df1}")

/**
 * @type {Guid}
 */
export global FWPM_CALLOUT_BUILT_IN_RESERVED_4 := Guid("{6c3fb801-daff-40e9-91e6-f7ff7e52f7d9}")

/**
 * @type {Guid}
 */
export global FWPM_PROVIDER_CONTEXT_SECURE_SOCKET_AUTHIP := Guid("{b25ea800-0d02-46ed-92bd-7fa84bb73e9d}")

/**
 * @type {Guid}
 */
export global FWPM_PROVIDER_CONTEXT_SECURE_SOCKET_IPSEC := Guid("{8c2d4144-f8e0-42c0-94ce-7ccfc63b2f9b}")

/**
 * @type {Guid}
 */
export global FWPM_KEYING_MODULE_IKE := Guid("{a9bbf787-82a8-45bb-a400-5d7e5952c7a9}")

/**
 * @type {Guid}
 */
export global FWPM_KEYING_MODULE_AUTHIP := Guid("{11e3dae0-dd26-4590-857d-ab4b28d1a095}")

/**
 * @type {Guid}
 */
export global FWPM_KEYING_MODULE_IKEV2 := Guid("{041792cc-8f07-419d-a394-716968cb1647}")

/**
 * @type {Integer (UInt32)}
 */
export global FWPM_AUTO_WEIGHT_BITS := 60

/**
 * @type {Integer (UInt32)}
 */
export global FWPM_WEIGHT_RANGE_IPSEC := 0

/**
 * @type {Integer (UInt32)}
 */
export global FWPM_WEIGHT_RANGE_IKE_EXEMPTIONS := 12

/**
 * @type {Integer (UInt32)}
 */
export global FWPM_ACTRL_ADD := 1

/**
 * @type {Integer (UInt32)}
 */
export global FWPM_ACTRL_ADD_LINK := 2

/**
 * @type {Integer (UInt32)}
 */
export global FWPM_ACTRL_BEGIN_READ_TXN := 4

/**
 * @type {Integer (UInt32)}
 */
export global FWPM_ACTRL_BEGIN_WRITE_TXN := 8

/**
 * @type {Integer (UInt32)}
 */
export global FWPM_ACTRL_CLASSIFY := 16

/**
 * @type {Integer (UInt32)}
 */
export global FWPM_ACTRL_ENUM := 32

/**
 * @type {Integer (UInt32)}
 */
export global FWPM_ACTRL_OPEN := 64

/**
 * @type {Integer (UInt32)}
 */
export global FWPM_ACTRL_READ := 128

/**
 * @type {Integer (UInt32)}
 */
export global FWPM_ACTRL_READ_STATS := 256

/**
 * @type {Integer (UInt32)}
 */
export global FWPM_ACTRL_SUBSCRIBE := 512

/**
 * @type {Integer (UInt32)}
 */
export global FWPM_ACTRL_WRITE := 1024

/**
 * @type {Integer (UInt32)}
 */
export global FWPM_TXN_READ_ONLY := 1

/**
 * @type {Integer (UInt32)}
 */
export global FWPM_TUNNEL_FLAG_POINT_TO_POINT := 1

/**
 * @type {Integer (UInt32)}
 */
export global FWPM_TUNNEL_FLAG_ENABLE_VIRTUAL_IF_TUNNELING := 2

/**
 * @type {Integer (UInt32)}
 */
export global FWPM_TUNNEL_FLAG_RESERVED0 := 4

/**
 * @type {Integer (UInt32)}
 */
export global FWPS_METADATA_FIELD_DISCARD_REASON := 1

/**
 * @type {Integer (UInt32)}
 */
export global FWPS_METADATA_FIELD_FLOW_HANDLE := 2

/**
 * @type {Integer (UInt32)}
 */
export global FWPS_METADATA_FIELD_IP_HEADER_SIZE := 4

/**
 * @type {Integer (UInt32)}
 */
export global FWPS_METADATA_FIELD_PROCESS_PATH := 8

/**
 * @type {Integer (UInt32)}
 */
export global FWPS_METADATA_FIELD_TOKEN := 16

/**
 * @type {Integer (UInt32)}
 */
export global FWPS_METADATA_FIELD_PROCESS_ID := 32

/**
 * @type {Integer (UInt32)}
 */
export global FWPS_METADATA_FIELD_SYSTEM_FLAGS := 64

/**
 * @type {Integer (UInt32)}
 */
export global FWPS_METADATA_FIELD_RESERVED := 128

/**
 * @type {Integer (UInt32)}
 */
export global FWPS_METADATA_FIELD_SOURCE_INTERFACE_INDEX := 256

/**
 * @type {Integer (UInt32)}
 */
export global FWPS_METADATA_FIELD_DESTINATION_INTERFACE_INDEX := 512

/**
 * @type {Integer (UInt32)}
 */
export global FWPS_METADATA_FIELD_TRANSPORT_HEADER_SIZE := 1024

/**
 * @type {Integer (UInt32)}
 */
export global FWPS_METADATA_FIELD_COMPARTMENT_ID := 2048

/**
 * @type {Integer (UInt32)}
 */
export global FWPS_METADATA_FIELD_FRAGMENT_DATA := 4096

/**
 * @type {Integer (UInt32)}
 */
export global FWPS_METADATA_FIELD_PATH_MTU := 8192

/**
 * @type {Integer (UInt32)}
 */
export global FWPS_METADATA_FIELD_COMPLETION_HANDLE := 16384

/**
 * @type {Integer (UInt32)}
 */
export global FWPS_METADATA_FIELD_TRANSPORT_ENDPOINT_HANDLE := 32768

/**
 * @type {Integer (UInt32)}
 */
export global FWPS_METADATA_FIELD_TRANSPORT_CONTROL_DATA := 65536

/**
 * @type {Integer (UInt32)}
 */
export global FWPS_METADATA_FIELD_REMOTE_SCOPE_ID := 131072

/**
 * @type {Integer (UInt32)}
 */
export global FWPS_METADATA_FIELD_PACKET_DIRECTION := 262144

/**
 * @type {Integer (UInt32)}
 */
export global FWPS_METADATA_FIELD_PACKET_SYSTEM_CRITICAL := 524288

/**
 * @type {Integer (UInt32)}
 */
export global FWPS_METADATA_FIELD_FORWARD_LAYER_OUTBOUND_PASS_THRU := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global FWPS_METADATA_FIELD_FORWARD_LAYER_INBOUND_PASS_THRU := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global FWPS_METADATA_FIELD_ALE_CLASSIFY_REQUIRED := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global FWPS_METADATA_FIELD_TRANSPORT_HEADER_INCLUDE_HEADER := 8388608

/**
 * @type {Integer (UInt32)}
 */
export global FWPS_METADATA_FIELD_DESTINATION_PREFIX := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global FWPS_METADATA_FIELD_ETHER_FRAME_LENGTH := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global FWPS_METADATA_FIELD_PARENT_ENDPOINT_HANDLE := 67108864

/**
 * @type {Integer (UInt32)}
 */
export global FWPS_METADATA_FIELD_ICMP_ID_AND_SEQUENCE := 134217728

/**
 * @type {Integer (UInt32)}
 */
export global FWPS_METADATA_FIELD_LOCAL_REDIRECT_TARGET_PID := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global FWPS_METADATA_FIELD_ORIGINAL_DESTINATION := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global FWPS_METADATA_FIELD_REDIRECT_RECORD_HANDLE := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global FWPS_METADATA_FIELD_SUB_PROCESS_TAG := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global FWPS_L2_METADATA_FIELD_ETHERNET_MAC_HEADER_SIZE := 1

/**
 * @type {Integer (UInt32)}
 */
export global FWPS_L2_METADATA_FIELD_WIFI_OPERATION_MODE := 2

/**
 * @type {Integer (UInt32)}
 */
export global FWPS_L2_METADATA_FIELD_VSWITCH_SOURCE_PORT_ID := 4

/**
 * @type {Integer (UInt32)}
 */
export global FWPS_L2_METADATA_FIELD_VSWITCH_SOURCE_NIC_INDEX := 8

/**
 * @type {Integer (UInt32)}
 */
export global FWPS_L2_METADATA_FIELD_VSWITCH_PACKET_CONTEXT := 16

/**
 * @type {Integer (UInt32)}
 */
export global FWPS_L2_METADATA_FIELD_VSWITCH_DESTINATION_PORT_ID := 32

/**
 * @type {Integer (UInt32)}
 */
export global FWPS_L2_METADATA_FIELD_RESERVED := 2147483648
;@endregion Constants
