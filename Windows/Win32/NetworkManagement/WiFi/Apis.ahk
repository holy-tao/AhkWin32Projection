#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class WiFi {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static L2_REASON_CODE_DOT11_AC_BASE => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static L2_REASON_CODE_DOT11_MSM_BASE => 196608

    /**
     * @type {Integer (UInt32)}
     */
    static L2_REASON_CODE_DOT11_SECURITY_BASE => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static L2_REASON_CODE_ONEX_BASE => 327680

    /**
     * @type {Integer (UInt32)}
     */
    static L2_REASON_CODE_DOT3_AC_BASE => 393216

    /**
     * @type {Integer (UInt32)}
     */
    static L2_REASON_CODE_DOT3_MSM_BASE => 458752

    /**
     * @type {Integer (UInt32)}
     */
    static L2_REASON_CODE_PROFILE_BASE => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static L2_REASON_CODE_IHV_BASE => 589824

    /**
     * @type {Integer (UInt32)}
     */
    static L2_REASON_CODE_WIMAX_BASE => 655360

    /**
     * @type {Integer (UInt32)}
     */
    static L2_REASON_CODE_RESERVED_BASE => 720896

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_SUCCESS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_UNKNOWN => 65537

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_RANGE_SIZE => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_BASE => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_AC_BASE => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_AC_CONNECT_BASE => 163840

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_AC_END => 196607

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_PROFILE_BASE => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_PROFILE_CONNECT_BASE => 557056

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_PROFILE_END => 589823

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_MSM_BASE => 196608

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_MSM_CONNECT_BASE => 229376

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_MSM_END => 262143

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_MSMSEC_BASE => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_MSMSEC_CONNECT_BASE => 294912

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_MSMSEC_END => 327679

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_RESERVED_BASE => 720896

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_RESERVED_END => 786431

    /**
     * @type {Integer (UInt32)}
     */
    static L2_PROFILE_MAX_NAME_LENGTH => 256

    /**
     * @type {Integer (UInt32)}
     */
    static L2_NOTIFICATION_SOURCE_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static L2_NOTIFICATION_SOURCE_DOT3_AUTO_CONFIG => 1

    /**
     * @type {Integer (UInt32)}
     */
    static L2_NOTIFICATION_SOURCE_SECURITY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static L2_NOTIFICATION_SOURCE_ONEX => 4

    /**
     * @type {Integer (UInt32)}
     */
    static L2_NOTIFICATION_SOURCE_WLAN_ACM => 8

    /**
     * @type {Integer (UInt32)}
     */
    static L2_NOTIFICATION_SOURCE_WLAN_MSM => 16

    /**
     * @type {Integer (UInt32)}
     */
    static L2_NOTIFICATION_SOURCE_WLAN_SECURITY => 32

    /**
     * @type {Integer (UInt32)}
     */
    static L2_NOTIFICATION_SOURCE_WLAN_IHV => 64

    /**
     * @type {Integer (UInt32)}
     */
    static L2_NOTIFICATION_SOURCE_WLAN_HNWK => 128

    /**
     * @type {Integer (UInt32)}
     */
    static L2_NOTIFICATION_SOURCE_WCM => 256

    /**
     * @type {Integer (UInt32)}
     */
    static L2_NOTIFICATION_SOURCE_WCM_CSP => 512

    /**
     * @type {Integer (UInt32)}
     */
    static L2_NOTIFICATION_SOURCE_WFD => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static L2_NOTIFICATION_SOURCE_WLAN_DEVICE_SERVICE => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static L2_NOTIFICATION_SOURCE_ALL => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static L2_NOTIFICATION_CODE_PUBLIC_BEGIN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static L2_NOTIFICATION_CODE_GROUP_SIZE => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static L2_REASON_CODE_GROUP_SIZE => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static L2_REASON_CODE_GEN_BASE => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static L2_REASON_CODE_SUCCESS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static L2_REASON_CODE_UNKNOWN => 65537

    /**
     * @type {Integer (UInt32)}
     */
    static L2_REASON_CODE_PROFILE_MISSING => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_BSSID_LIST_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_HESSID_LENGTH => 6

    /**
     * @type {Integer (UInt32)}
     */
    static RSNA_OUI_PREFIX => 11276032

    /**
     * @type {Integer (UInt32)}
     */
    static WPA_OUI_PREFIX => 15880192

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_RATE_SET_MAX_LENGTH => 126

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_WFD_SERVICE_NAME_MAX_LENGTH => 255

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_WFD_APS2_SERVICE_TYPE_MAX_LENGTH => 21

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_WFD_ASP2_INSTANCE_NAME_MAX_LENGTH => 63

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_WFD_SERVICE_INFORMATION_MAX_LENGTH => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_MAX_REQUESTED_SERVICE_INFORMATION_LENGTH => 255

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_WFD_SESSION_INFO_MAX_LENGTH => 144

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PACKET_TYPE_802_11_DIRECTED_DATA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PACKET_TYPE_802_11_BROADCAST_DATA => 8

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PACKET_TYPE_802_11_MULTICAST_DATA => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PACKET_TYPE_802_11_ALL_MULTICAST_DATA => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PACKET_TYPE_802_11_PROMISCUOUS_DATA => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_MAX_PDU_SIZE => 2346

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_MIN_PDU_SIZE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_MAX_NUM_DEFAULT_KEY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_MAX_NUM_DEFAULT_KEY_MFP => 6

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_NDIS_START => 218170112

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_OFFLOAD_CAPABILITY => 218170112

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_HW_WEP_SUPPORTED_TX => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_HW_WEP_SUPPORTED_RX => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_HW_FRAGMENTATION_SUPPORTED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_HW_DEFRAGMENTATION_SUPPORTED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_HW_MSDU_AUTH_SUPPORTED_TX => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_HW_MSDU_AUTH_SUPPORTED_RX => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_CONF_ALGO_WEP_RC4 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_CONF_ALGO_TKIP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_AUTH_ALGO_MICHAEL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_CURRENT_OFFLOAD_CAPABILITY => 218170113

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_WEP_OFFLOAD => 218170114

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_WEP_UPLOAD => 218170115

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_DEFAULT_WEP_OFFLOAD => 218170116

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_DEFAULT_WEP_UPLOAD => 218170117

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_MPDU_MAX_LENGTH => 218170118

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_OPERATION_MODE_CAPABILITY => 218170119

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_OPERATION_MODE_UNKNOWN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_OPERATION_MODE_STATION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_OPERATION_MODE_AP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_OPERATION_MODE_EXTENSIBLE_STATION => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_OPERATION_MODE_EXTENSIBLE_AP => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_OPERATION_MODE_WFD_DEVICE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_OPERATION_MODE_WFD_GROUP_OWNER => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_OPERATION_MODE_WFD_CLIENT => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_OPERATION_MODE_MANUFACTURING => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_OPERATION_MODE_NETWORK_MONITOR => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_CURRENT_OPERATION_MODE => 218170120

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_CURRENT_PACKET_FILTER => 218170121

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_PACKET_TYPE_DIRECTED_CTRL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_PACKET_TYPE_DIRECTED_MGMT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_PACKET_TYPE_DIRECTED_DATA => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_PACKET_TYPE_MULTICAST_CTRL => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_PACKET_TYPE_MULTICAST_MGMT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_PACKET_TYPE_MULTICAST_DATA => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_PACKET_TYPE_BROADCAST_CTRL => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_PACKET_TYPE_BROADCAST_MGMT => 128

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_PACKET_TYPE_BROADCAST_DATA => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_PACKET_TYPE_PROMISCUOUS_CTRL => 512

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_PACKET_TYPE_PROMISCUOUS_MGMT => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_PACKET_TYPE_PROMISCUOUS_DATA => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_PACKET_TYPE_ALL_MULTICAST_CTRL => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_PACKET_TYPE_ALL_MULTICAST_MGMT => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_PACKET_TYPE_ALL_MULTICAST_DATA => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_ATIM_WINDOW => 218170122

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_SCAN_REQUEST => 218170123

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_CURRENT_PHY_TYPE => 218170124

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_PHY_TYPE_LIST_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_JOIN_REQUEST => 218170125

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_CAPABILITY_INFO_ESS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_CAPABILITY_INFO_IBSS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_CAPABILITY_INFO_CF_POLLABLE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_CAPABILITY_INFO_CF_POLL_REQ => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_CAPABILITY_INFO_PRIVACY => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_CAPABILITY_SHORT_PREAMBLE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_CAPABILITY_PBCC => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_CAPABILITY_CHANNEL_AGILITY => 128

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_CAPABILITY_SHORT_SLOT_TIME => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_CAPABILITY_DSSSOFDM => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_START_REQUEST => 218170126

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_UPDATE_IE => 218170127

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_RESET_REQUEST => 218170128

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_NIC_POWER_STATE => 218170129

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_OPTIONAL_CAPABILITY => 218170130

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_CURRENT_OPTIONAL_CAPABILITY => 218170131

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_STATION_ID => 218170132

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_MEDIUM_OCCUPANCY_LIMIT => 218170133

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_CF_POLLABLE => 218170134

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_CFP_PERIOD => 218170135

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_CFP_MAX_DURATION => 218170136

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_POWER_MGMT_MODE => 218170137

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_POWER_SAVE_LEVEL_MAX_PSP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_POWER_SAVE_LEVEL_FAST_PSP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_OPERATIONAL_RATE_SET => 218170138

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_BEACON_PERIOD => 218170139

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_DTIM_PERIOD => 218170140

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_WEP_ICV_ERROR_COUNT => 218170141

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_MAC_ADDRESS => 218170142

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_RTS_THRESHOLD => 218170143

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_SHORT_RETRY_LIMIT => 218170144

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_LONG_RETRY_LIMIT => 218170145

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_FRAGMENTATION_THRESHOLD => 218170146

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_MAX_TRANSMIT_MSDU_LIFETIME => 218170147

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_MAX_RECEIVE_LIFETIME => 218170148

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_COUNTERS_ENTRY => 218170149

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_SUPPORTED_PHY_TYPES => 218170150

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_CURRENT_REG_DOMAIN => 218170151

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_REG_DOMAIN_OTHER => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_REG_DOMAIN_FCC => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_REG_DOMAIN_DOC => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_REG_DOMAIN_ETSI => 48

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_REG_DOMAIN_SPAIN => 49

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_REG_DOMAIN_FRANCE => 50

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_REG_DOMAIN_MKK => 64

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_TEMP_TYPE => 218170152

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_CURRENT_TX_ANTENNA => 218170153

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_DIVERSITY_SUPPORT => 218170154

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_CURRENT_RX_ANTENNA => 218170155

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_SUPPORTED_POWER_LEVELS => 218170156

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_CURRENT_TX_POWER_LEVEL => 218170157

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_HOP_TIME => 218170158

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_CURRENT_CHANNEL_NUMBER => 218170159

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_MAX_DWELL_TIME => 218170160

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_CURRENT_DWELL_TIME => 218170161

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_CURRENT_SET => 218170162

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_CURRENT_PATTERN => 218170163

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_CURRENT_INDEX => 218170164

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_CURRENT_CHANNEL => 218170165

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_CCA_MODE_SUPPORTED => 218170166

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_CCA_MODE_ED_ONLY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_CCA_MODE_CS_ONLY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_CCA_MODE_ED_and_CS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_CCA_MODE_CS_WITH_TIMER => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_CCA_MODE_HRCS_AND_ED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_CURRENT_CCA_MODE => 218170167

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_ED_THRESHOLD => 218170168

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_CCA_WATCHDOG_TIMER_MAX => 218170169

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_CCA_WATCHDOG_COUNT_MAX => 218170170

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_CCA_WATCHDOG_TIMER_MIN => 218170171

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_CCA_WATCHDOG_COUNT_MIN => 218170172

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_REG_DOMAINS_SUPPORT_VALUE => 218170173

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_SUPPORTED_TX_ANTENNA => 218170174

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_SUPPORTED_RX_ANTENNA => 218170175

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_DIVERSITY_SELECTION_RX => 218170176

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_SUPPORTED_DATA_RATES_VALUE => 218170177

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_NUM_SUPPORTED_RATES => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_NUM_SUPPORTED_RATES_V2 => 255

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_CURRENT_FREQUENCY => 218170178

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_TI_THRESHOLD => 218170179

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_FREQUENCY_BANDS_SUPPORTED => 218170180

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_FREQUENCY_BANDS_LOWER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_FREQUENCY_BANDS_MIDDLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_FREQUENCY_BANDS_UPPER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_SHORT_PREAMBLE_OPTION_IMPLEMENTED => 218170181

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_PBCC_OPTION_IMPLEMENTED => 218170182

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_CHANNEL_AGILITY_PRESENT => 218170183

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_CHANNEL_AGILITY_ENABLED => 218170184

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_HR_CCA_MODE_SUPPORTED => 218170185

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_HR_CCA_MODE_ED_ONLY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_HR_CCA_MODE_CS_ONLY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_HR_CCA_MODE_CS_AND_ED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_HR_CCA_MODE_CS_WITH_TIMER => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_HR_CCA_MODE_HRCS_AND_ED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_MULTI_DOMAIN_CAPABILITY_IMPLEMENTED => 218170186

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_MULTI_DOMAIN_CAPABILITY_ENABLED => 218170187

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_COUNTRY_STRING => 218170188

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_MULTI_DOMAIN_CAPABILITY => 218170189

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_EHCC_PRIME_RADIX => 218170190

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_EHCC_NUMBER_OF_CHANNELS_FAMILY_INDEX => 218170191

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_EHCC_CAPABILITY_IMPLEMENTED => 218170192

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_EHCC_CAPABILITY_ENABLED => 218170193

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_HOP_ALGORITHM_ADOPTED => 218170194

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_RANDOM_TABLE_FLAG => 218170195

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_NUMBER_OF_HOPPING_SETS => 218170196

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_HOP_MODULUS => 218170197

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_HOP_OFFSET => 218170198

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_HOPPING_PATTERN => 218170199

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_RANDOM_TABLE_FIELD_NUMBER => 218170200

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_WPA_TSC => 218170201

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_RSSI_RANGE => 218170202

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_RF_USAGE => 218170203

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_NIC_SPECIFIC_EXTENSION => 218170204

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_AP_JOIN_REQUEST => 218170205

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_ERP_PBCC_OPTION_IMPLEMENTED => 218170206

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_ERP_PBCC_OPTION_ENABLED => 218170207

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_DSSS_OFDM_OPTION_IMPLEMENTED => 218170208

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_DSSS_OFDM_OPTION_ENABLED => 218170209

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_SHORT_SLOT_TIME_OPTION_IMPLEMENTED => 218170210

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_SHORT_SLOT_TIME_OPTION_ENABLED => 218170211

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_MAX_MAC_ADDRESS_STATES => 218170212

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_RECV_SENSITIVITY_LIST => 218170213

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_WME_IMPLEMENTED => 218170214

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_WME_ENABLED => 218170215

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_WME_AC_PARAMETERS => 218170216

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_WME_UPDATE_IE => 218170217

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_QOS_TX_QUEUES_SUPPORTED => 218170218

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_QOS_TX_DURATION => 218170219

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_QOS_TX_MEDIUM_TIME => 218170220

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_SUPPORTED_OFDM_FREQUENCY_LIST => 218170221

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_SUPPORTED_DSSS_CHANNEL_LIST => 218170222

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_BSS_ENTRY_BYTE_ARRAY_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_POWER_SAVING_NO_POWER_SAVING => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_POWER_SAVING_FAST_PSP => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_POWER_SAVING_MAX_PSP => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_POWER_SAVING_MAXIMUM_LEVEL => 24

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_SSID_LIST_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_MAC_ADDRESS_LIST_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_PMKID_LIST_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_STATISTICS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_EXEMPT_NO_EXEMPTION => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_EXEMPT_ALWAYS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_EXEMPT_ON_KEY_MAPPING_KEY_UNAVAILABLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_EXEMPT_UNICAST => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_EXEMPT_MULTICAST => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_EXEMPT_BOTH => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_PRIVACY_EXEMPTION_LIST_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_AUTH_ALGORITHM_LIST_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_AUTH_CIPHER_PAIR_LIST_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_CIPHER_ALGORITHM_LIST_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_CIPHER_DEFAULT_KEY_VALUE_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_CIPHER_KEY_MAPPING_KEY_VALUE_BYTE_ARRAY_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_ASSOCIATION_INFO_LIST_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_PHY_ID_LIST_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_EXTSTA_CAPABILITY_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_DATA_RATE_MAPPING_TABLE_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_COUNTRY_OR_REGION_STRING_LIST_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_PORT_STATE_NOTIFICATION_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_IBSS_PARAMS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_QOS_PARAMS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_ASSOCIATION_PARAMS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_MAX_NUM_OF_FRAGMENTS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_PRIORITY_CONTENTION => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_PRIORITY_CONTENTION_FREE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_SERVICE_CLASS_REORDERABLE_MULTICAST => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_SERVICE_CLASS_STRICTLY_ORDERED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_FLAGS_80211B_SHORT_PREAMBLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_FLAGS_80211B_PBCC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_FLAGS_80211B_CHANNEL_AGILITY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_FLAGS_PS_ON => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_FLAGS_80211G_DSSS_OFDM => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_FLAGS_80211G_USE_PROTECTION => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_FLAGS_80211G_NON_ERP_PRESENT => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_FLAGS_80211G_BARKER_PREAMBLE_MODE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_WME_PACKET => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_PHY_ATTRIBUTES_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_EXTSTA_ATTRIBUTES_SAFEMODE_OID_SUPPORTED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_EXTSTA_ATTRIBUTES_SAFEMODE_CERTIFIED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_EXTSTA_ATTRIBUTES_SAFEMODE_RESERVED => 12

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_EXTSTA_ATTRIBUTES_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_EXTSTA_ATTRIBUTES_REVISION_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_EXTSTA_ATTRIBUTES_REVISION_3 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_EXTSTA_ATTRIBUTES_REVISION_4 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_SEND_CONTEXT_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_RECV_CONTEXT_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_STATUS_SUCCESS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_STATUS_RETRY_LIMIT_EXCEEDED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_STATUS_UNSUPPORTED_PRIORITY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_STATUS_UNSUPPORTED_SERVICE_CLASS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_STATUS_UNAVAILABLE_PRIORITY => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_STATUS_UNAVAILABLE_SERVICE_CLASS => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_STATUS_XMIT_MSDU_TIMER_EXPIRED => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_STATUS_UNAVAILABLE_BSS => 128

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_STATUS_EXCESSIVE_DATA_LENGTH => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_STATUS_ENCRYPTION_FAILED => 512

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_STATUS_WEP_KEY_UNAVAILABLE => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_STATUS_ICV_VERIFIED => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_STATUS_PACKET_REASSEMBLED => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_STATUS_PACKET_NOT_REASSEMBLED => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_STATUS_GENERATE_AUTH_FAILED => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_STATUS_AUTH_NOT_VERIFIED => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_STATUS_AUTH_VERIFIED => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_STATUS_AUTH_FAILED => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_STATUS_PS_LIFETIME_EXPIRED => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_STATUS_RESET_CONFIRM => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_STATUS_SCAN_CONFIRM => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_STATUS_JOIN_CONFIRM => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_STATUS_START_CONFIRM => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_STATUS_AP_JOIN_CONFIRM => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_STATUS_MPDU_MAX_LENGTH_CHANGED => 6

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_MPDU_MAX_LENGTH_INDICATION_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_ASSOCIATION_START_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_ENCAP_RFC_1042 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_ENCAP_802_1H => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_ASSOC_STATUS_SUCCESS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_ASSOCIATION_COMPLETION_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_ASSOCIATION_COMPLETION_PARAMETERS_REVISION_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_CONNECTION_START_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_CONNECTION_STATUS_SUCCESS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_CONNECTION_COMPLETION_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_ROAMING_START_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_ROAMING_COMPLETION_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_DISASSOCIATION_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_TKIPMIC_FAILURE_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_PMKID_CANDIDATE_LIST_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_PHY_STATE_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_LINK_QUALITY_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_EXTSTA_SEND_CONTEXT_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_EXTSTA_RECV_CONTEXT_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_PRIVATE_OIDS_START => 218171136

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_CURRENT_ADDRESS => 218171138

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_PERMANENT_ADDRESS => 218171139

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_MULTICAST_LIST => 218171140

    /**
     * @type {Integer (UInt32)}
     */
    static OID_DOT11_MAXIMUM_LIST_SIZE => 218171141

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_EXTAP_ATTRIBUTES_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_INCOMING_ASSOC_STARTED_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_INCOMING_ASSOC_REQUEST_RECEIVED_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_ASSOC_ERROR_SOURCE_OS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_ASSOC_ERROR_SOURCE_REMOTE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_ASSOC_ERROR_SOURCE_OTHER => 255

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_INCOMING_ASSOC_COMPLETION_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_STOP_AP_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_STOP_AP_REASON_FREQUENCY_NOT_AVAILABLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_STOP_AP_REASON_CHANNEL_NOT_AVAILABLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_STOP_AP_REASON_AP_ACTIVE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_STOP_AP_REASON_IHV_START => 4278190080

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_STOP_AP_REASON_IHV_END => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_PHY_FREQUENCY_ADOPTED_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_CAN_SUSTAIN_AP_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_CAN_SUSTAIN_AP_REASON_IHV_START => 4278190080

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_CAN_SUSTAIN_AP_REASON_IHV_END => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_AVAILABLE_CHANNEL_LIST_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_AVAILABLE_FREQUENCY_LIST_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_DISASSOCIATE_PEER_REQUEST_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_INCOMING_ASSOC_DECISION_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_INCOMING_ASSOC_DECISION_REVISION_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_ADDITIONAL_IE_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_EXTAP_SEND_CONTEXT_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_EXTAP_RECV_CONTEXT_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_PEER_INFO_LIST_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_VWIFI_COMBINATION_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_VWIFI_COMBINATION_REVISION_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_VWIFI_COMBINATION_REVISION_3 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_VWIFI_ATTRIBUTES_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_MAC_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_WFD_ATTRIBUTES_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_WFD_STATUS_SUCCESS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_WFD_STATUS_FAILED_INFORMATION_IS_UNAVAILABLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_WFD_STATUS_FAILED_INCOMPATIBLE_PARAMETERS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_WFD_STATUS_FAILED_LIMIT_REACHED => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_WFD_STATUS_FAILED_INVALID_PARAMETERS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_WFD_STATUS_FAILED_UNABLE_TO_ACCOMODATE_REQUEST => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_WFD_STATUS_FAILED_PREVIOUS_PROTOCOL_ERROR => 6

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_WFD_STATUS_FAILED_NO_COMMON_CHANNELS => 7

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_WFD_STATUS_FAILED_UNKNOWN_WFD_GROUP => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_WFD_STATUS_FAILED_MATCHING_MAX_INTENT => 9

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_WFD_STATUS_FAILED_INCOMPATIBLE_PROVISIONING_METHOD => 10

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_WFD_STATUS_FAILED_REJECTED_BY_USER => 11

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_WFD_STATUS_SUCCESS_ACCEPTED_BY_USER => 12

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_WFD_MINOR_REASON_SUCCESS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_WFD_MINOR_REASON_DISASSOCIATED_FROM_WLAN_CROSS_CONNECTION_POLICY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_WFD_MINOR_REASON_DISASSOCIATED_NOT_MANAGED_INFRASTRUCTURE_CAPABLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_WFD_MINOR_REASON_DISASSOCIATED_WFD_COEXISTENCE_POLICY => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_WFD_MINOR_REASON_DISASSOCIATED_INFRASTRUCTURE_MANAGED_POLICY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_WPS_VERSION_1_0 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_WPS_VERSION_2_0 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_WFD_DEVICE_CAPABILITY_SERVICE_DISCOVERY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_WFD_DEVICE_CAPABILITY_P2P_CLIENT_DISCOVERABILITY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_WFD_DEVICE_CAPABILITY_CONCURRENT_OPERATION => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_WFD_DEVICE_CAPABILITY_P2P_INFRASTRUCTURE_MANAGED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_WFD_DEVICE_CAPABILITY_P2P_DEVICE_LIMIT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_WFD_DEVICE_CAPABILITY_P2P_INVITATION_PROCEDURE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_WFD_DEVICE_CAPABILITY_RESERVED_6 => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_WFD_DEVICE_CAPABILITY_RESERVED_7 => 128

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_WFD_GROUP_CAPABILITY_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_WFD_GROUP_CAPABILITY_GROUP_OWNER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_WFD_GROUP_CAPABILITY_PERSISTENT_GROUP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_WFD_GROUP_CAPABILITY_GROUP_LIMIT_REACHED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_WFD_GROUP_CAPABILITY_INTRABSS_DISTRIBUTION_SUPPORTED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_WFD_GROUP_CAPABILITY_CROSS_CONNECTION_SUPPORTED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_WFD_GROUP_CAPABILITY_PERSISTENT_RECONNECT_SUPPORTED => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_WFD_GROUP_CAPABILITY_IN_GROUP_FORMATION => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_WFD_GROUP_CAPABILITY_RESERVED_7 => 128

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_WFD_GROUP_CAPABILITY_EAPOL_KEY_IP_ADDRESS_ALLOCATION_SUPPORTED => 128

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_WPS_DEVICE_NAME_MAX_LENGTH => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_WPS_MAX_PASSKEY_LENGTH => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_WPS_MAX_MODEL_NAME_LENGTH => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_WPS_MAX_MODEL_NUMBER_LENGTH => 32

    /**
     * @type {Integer (UInt32)}
     */
    static WFDSVC_CONNECTION_CAPABILITY_NEW => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WFDSVC_CONNECTION_CAPABILITY_CLIENT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WFDSVC_CONNECTION_CAPABILITY_GO => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_WFD_DISCOVER_COMPLETE_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_WFD_DISCOVER_COMPLETE_MAX_LIST_SIZE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_GO_NEGOTIATION_REQUEST_SEND_COMPLETE_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_RECEIVED_GO_NEGOTIATION_REQUEST_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_GO_NEGOTIATION_RESPONSE_SEND_COMPLETE_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_RECEIVED_GO_NEGOTIATION_RESPONSE_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_GO_NEGOTIATION_CONFIRMATION_SEND_COMPLETE_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_RECEIVED_GO_NEGOTIATION_CONFIRMATION_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_INVITATION_REQUEST_SEND_COMPLETE_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_RECEIVED_INVITATION_REQUEST_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_INVITATION_RESPONSE_SEND_COMPLETE_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_RECEIVED_INVITATION_RESPONSE_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_PROVISION_DISCOVERY_REQUEST_SEND_COMPLETE_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_RECEIVED_PROVISION_DISCOVERY_REQUEST_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_PROVISION_DISCOVERY_RESPONSE_SEND_COMPLETE_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_RECEIVED_PROVISION_DISCOVERY_RESPONSE_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_ANQP_QUERY_COMPLETE_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_WFD_DEVICE_CAPABILITY_CONFIG_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_WFD_GROUP_OWNER_CAPABILITY_CONFIG_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_WFD_GROUP_OWNER_CAPABILITY_CONFIG_REVISION_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_WFD_DEVICE_INFO_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_WFD_SECONDARY_DEVICE_TYPE_LIST_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DISCOVERY_FILTER_BITMASK_DEVICE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DISCOVERY_FILTER_BITMASK_GO => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DISCOVERY_FILTER_BITMASK_ANY => 15

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_WFD_DISCOVER_REQUEST_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_DEVICE_ENTRY_BYTE_ARRAY_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_WFD_DEVICE_NOT_DISCOVERABLE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_WFD_DEVICE_AUTO_AVAILABILITY => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_WFD_DEVICE_HIGH_AVAILABILITY => 24

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_WFD_ADDITIONAL_IE_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_SEND_GO_NEGOTIATION_REQUEST_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_SEND_GO_NEGOTIATION_RESPONSE_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_SEND_GO_NEGOTIATION_CONFIRMATION_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_SEND_INVITATION_REQUEST_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_SEND_INVITATION_RESPONSE_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_SEND_PROVISION_DISCOVERY_REQUEST_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_SEND_PROVISION_DISCOVERY_RESPONSE_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_WFD_DEVICE_LISTEN_CHANNEL_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_WFD_GROUP_START_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_WFD_GROUP_JOIN_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_POWER_MGMT_AUTO_MODE_ENABLED_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_POWER_MGMT_MODE_STATUS_INFO_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_MAX_CHANNEL_HINTS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_INVALID_CHANNEL_NUMBER => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_NLO_FLAG_STOP_NLO_INDICATION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_NLO_FLAG_SCAN_ON_AOAC_PLATFORM => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_NLO_FLAG_SCAN_AT_SYSTEM_RESUME => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_OFFLOAD_NETWORK_LIST_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_OFFLOAD_NETWORK_STATUS_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_MANUFACTURING_TEST_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_MANUFACTURING_CALLBACK_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_SSID_MAX_LENGTH => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_OI_MAX_LENGTH => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_OI_MIN_LENGTH => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_API_VERSION_1_0 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_API_VERSION_2_0 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_API_VERSION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_MAX_NAME_LENGTH => 256

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_PROFILE_GROUP_POLICY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_PROFILE_USER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_PROFILE_GET_PLAINTEXT_KEY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_PROFILE_CONNECTION_MODE_SET_BY_CLIENT => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_PROFILE_CONNECTION_MODE_AUTO => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_PSD_IE_MAX_DATA_SIZE => 240

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_PSD_IE_MAX_ENTRY_NUMBER => 5

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_NETWORK_NOT_COMPATIBLE => 131073

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_PROFILE_NOT_COMPATIBLE => 131074

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_NO_AUTO_CONNECTION => 163841

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_NOT_VISIBLE => 163842

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_GP_DENIED => 163843

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_USER_DENIED => 163844

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_BSS_TYPE_NOT_ALLOWED => 163845

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_IN_FAILED_LIST => 163846

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_IN_BLOCKED_LIST => 163847

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_SSID_LIST_TOO_LONG => 163848

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_CONNECT_CALL_FAIL => 163849

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_SCAN_CALL_FAIL => 163850

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_NETWORK_NOT_AVAILABLE => 163851

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_PROFILE_CHANGED_OR_DELETED => 163852

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_KEY_MISMATCH => 163853

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_USER_NOT_RESPOND => 163854

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_AP_PROFILE_NOT_ALLOWED_FOR_CLIENT => 163855

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_AP_PROFILE_NOT_ALLOWED => 163856

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_HOTSPOT2_PROFILE_DENIED => 163857

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_INVALID_PROFILE_SCHEMA => 524289

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_PROFILE_MISSING => 524290

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_INVALID_PROFILE_NAME => 524291

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_INVALID_PROFILE_TYPE => 524292

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_INVALID_PHY_TYPE => 524293

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_MSM_SECURITY_MISSING => 524294

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_IHV_SECURITY_NOT_SUPPORTED => 524295

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_IHV_OUI_MISMATCH => 524296

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_IHV_OUI_MISSING => 524297

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_IHV_SETTINGS_MISSING => 524298

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_CONFLICT_SECURITY => 524299

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_SECURITY_MISSING => 524300

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_INVALID_BSS_TYPE => 524301

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_INVALID_ADHOC_CONNECTION_MODE => 524302

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_NON_BROADCAST_SET_FOR_ADHOC => 524303

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_AUTO_SWITCH_SET_FOR_ADHOC => 524304

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_AUTO_SWITCH_SET_FOR_MANUAL_CONNECTION => 524305

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_IHV_SECURITY_ONEX_MISSING => 524306

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_PROFILE_SSID_INVALID => 524307

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_TOO_MANY_SSID => 524308

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_IHV_CONNECTIVITY_NOT_SUPPORTED => 524309

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_BAD_MAX_NUMBER_OF_CLIENTS_FOR_AP => 524310

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_INVALID_CHANNEL => 524311

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_OPERATION_MODE_NOT_SUPPORTED => 524312

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_AUTO_AP_PROFILE_NOT_ALLOWED => 524313

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_AUTO_CONNECTION_NOT_ALLOWED => 524314

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_HOTSPOT2_PROFILE_NOT_ALLOWED => 524315

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_UNSUPPORTED_SECURITY_SET_BY_OS => 196609

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_UNSUPPORTED_SECURITY_SET => 196610

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_BSS_TYPE_UNMATCH => 196611

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_PHY_TYPE_UNMATCH => 196612

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_DATARATE_UNMATCH => 196613

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_USER_CANCELLED => 229377

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_ASSOCIATION_FAILURE => 229378

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_ASSOCIATION_TIMEOUT => 229379

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_PRE_SECURITY_FAILURE => 229380

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_START_SECURITY_FAILURE => 229381

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_SECURITY_FAILURE => 229382

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_SECURITY_TIMEOUT => 229383

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_ROAMING_FAILURE => 229384

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_ROAMING_SECURITY_FAILURE => 229385

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_ADHOC_SECURITY_FAILURE => 229386

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_DRIVER_DISCONNECTED => 229387

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_DRIVER_OPERATION_FAILURE => 229388

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_IHV_NOT_AVAILABLE => 229389

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_IHV_NOT_RESPONDING => 229390

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_DISCONNECT_TIMEOUT => 229391

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_INTERNAL_FAILURE => 229392

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_UI_REQUEST_TIMEOUT => 229393

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_TOO_MANY_SECURITY_ATTEMPTS => 229394

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_AP_STARTING_FAILURE => 229395

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_NO_VISIBLE_AP => 229396

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_MSMSEC_MIN => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_MSMSEC_PROFILE_INVALID_KEY_INDEX => 262145

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_MSMSEC_PROFILE_PSK_PRESENT => 262146

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_MSMSEC_PROFILE_KEY_LENGTH => 262147

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_MSMSEC_PROFILE_PSK_LENGTH => 262148

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_MSMSEC_PROFILE_NO_AUTH_CIPHER_SPECIFIED => 262149

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_MSMSEC_PROFILE_TOO_MANY_AUTH_CIPHER_SPECIFIED => 262150

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_MSMSEC_PROFILE_DUPLICATE_AUTH_CIPHER => 262151

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_MSMSEC_PROFILE_RAWDATA_INVALID => 262152

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_MSMSEC_PROFILE_INVALID_AUTH_CIPHER => 262153

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_MSMSEC_PROFILE_ONEX_DISABLED => 262154

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_MSMSEC_PROFILE_ONEX_ENABLED => 262155

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_MSMSEC_PROFILE_INVALID_PMKCACHE_MODE => 262156

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_MSMSEC_PROFILE_INVALID_PMKCACHE_SIZE => 262157

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_MSMSEC_PROFILE_INVALID_PMKCACHE_TTL => 262158

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_MSMSEC_PROFILE_INVALID_PREAUTH_MODE => 262159

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_MSMSEC_PROFILE_INVALID_PREAUTH_THROTTLE => 262160

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_MSMSEC_PROFILE_PREAUTH_ONLY_ENABLED => 262161

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_MSMSEC_CAPABILITY_NETWORK => 262162

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_MSMSEC_CAPABILITY_NIC => 262163

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_MSMSEC_CAPABILITY_PROFILE => 262164

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_MSMSEC_CAPABILITY_DISCOVERY => 262165

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_MSMSEC_PROFILE_PASSPHRASE_CHAR => 262166

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_MSMSEC_PROFILE_KEYMATERIAL_CHAR => 262167

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_MSMSEC_PROFILE_WRONG_KEYTYPE => 262168

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_MSMSEC_MIXED_CELL => 262169

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_MSMSEC_PROFILE_AUTH_TIMERS_INVALID => 262170

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_MSMSEC_PROFILE_INVALID_GKEY_INTV => 262171

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_MSMSEC_TRANSITION_NETWORK => 262172

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_MSMSEC_PROFILE_KEY_UNMAPPED_CHAR => 262173

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_MSMSEC_CAPABILITY_PROFILE_AUTH => 262174

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_MSMSEC_CAPABILITY_PROFILE_CIPHER => 262175

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_MSMSEC_PROFILE_SAFE_MODE => 262176

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_MSMSEC_CAPABILITY_PROFILE_SAFE_MODE_NIC => 262177

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_MSMSEC_CAPABILITY_PROFILE_SAFE_MODE_NW => 262178

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_MSMSEC_PROFILE_UNSUPPORTED_AUTH => 262179

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_MSMSEC_PROFILE_UNSUPPORTED_CIPHER => 262180

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_MSMSEC_CAPABILITY_MFP_NW_NIC => 262181

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_MSMSEC_UI_REQUEST_FAILURE => 294913

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_MSMSEC_AUTH_START_TIMEOUT => 294914

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_MSMSEC_AUTH_SUCCESS_TIMEOUT => 294915

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_MSMSEC_KEY_START_TIMEOUT => 294916

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_MSMSEC_KEY_SUCCESS_TIMEOUT => 294917

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_MSMSEC_M3_MISSING_KEY_DATA => 294918

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_MSMSEC_M3_MISSING_IE => 294919

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_MSMSEC_M3_MISSING_GRP_KEY => 294920

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_MSMSEC_PR_IE_MATCHING => 294921

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_MSMSEC_SEC_IE_MATCHING => 294922

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_MSMSEC_NO_PAIRWISE_KEY => 294923

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_MSMSEC_G1_MISSING_KEY_DATA => 294924

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_MSMSEC_G1_MISSING_GRP_KEY => 294925

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_MSMSEC_PEER_INDICATED_INSECURE => 294926

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_MSMSEC_NO_AUTHENTICATOR => 294927

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_MSMSEC_NIC_FAILURE => 294928

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_MSMSEC_CANCELLED => 294929

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_MSMSEC_KEY_FORMAT => 294930

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_MSMSEC_DOWNGRADE_DETECTED => 294931

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_MSMSEC_PSK_MISMATCH_SUSPECTED => 294932

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_MSMSEC_FORCED_FAILURE => 294933

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_MSMSEC_M3_TOO_MANY_RSNIE => 294934

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_MSMSEC_M2_MISSING_KEY_DATA => 294935

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_MSMSEC_M2_MISSING_IE => 294936

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_MSMSEC_AUTH_WCN_COMPLETED => 294937

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_MSMSEC_M3_MISSING_MGMT_GRP_KEY => 294938

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_MSMSEC_G1_MISSING_MGMT_GRP_KEY => 294939

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_REASON_CODE_MSMSEC_MAX => 327679

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_AVAILABLE_NETWORK_CONNECTED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_AVAILABLE_NETWORK_HAS_PROFILE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_AVAILABLE_NETWORK_CONSOLE_USER_PROFILE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_AVAILABLE_NETWORK_INTERWORKING_SUPPORTED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_AVAILABLE_NETWORK_HOTSPOT2_ENABLED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_AVAILABLE_NETWORK_ANQP_SUPPORTED => 32

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_AVAILABLE_NETWORK_HOTSPOT2_DOMAIN => 64

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_AVAILABLE_NETWORK_HOTSPOT2_ROAMING => 128

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_AVAILABLE_NETWORK_AUTO_CONNECT_FAILED => 256

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_AVAILABLE_NETWORK_INCLUDE_ALL_ADHOC_PROFILES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_AVAILABLE_NETWORK_INCLUDE_ALL_MANUAL_HIDDEN_PROFILES => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_MAX_PHY_TYPE_NUMBER => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_MAX_PHY_INDEX => 64

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_CONNECTION_HIDDEN_NETWORK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_CONNECTION_ADHOC_JOIN_ONLY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_CONNECTION_IGNORE_PRIVACY_BIT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_CONNECTION_EAPOL_PASSTHROUGH => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_CONNECTION_PERSIST_DISCOVERY_PROFILE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_CONNECTION_PERSIST_DISCOVERY_PROFILE_CONNECTION_MODE_AUTO => 32

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_CONNECTION_PERSIST_DISCOVERY_PROFILE_OVERWRITE_EXISTING => 64

    /**
     * @type {Integer (UInt32)}
     */
    static WFD_API_VERSION_1_0 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WFD_API_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_UI_API_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_UI_API_INITIAL_VERSION => 1

    /**
     * @type {String}
     */
    static GUID_DEVINTERFACE_WIFIDIRECT_DEVICE => "{439b20af-8955-405b-99f0-a62af0c68d43}"

    /**
     * @type {String}
     */
    static GUID_AEPSERVICE_WIFIDIRECT_DEVICE => "{cc29827c-9caf-4928-99a9-18f7c2381389}"

    /**
     * @type {String}
     */
    static GUID_DEVINTERFACE_ASP_INFRA_DEVICE => "{ff823995-7a72-4c80-8757-c67ee13d1a49}"

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11EXT_PSK_MAX_LENGTH => 64

    /**
     * @type {Integer (UInt32)}
     */
    static WDIAG_IHV_WLAN_ID_FLAG_SECURITY_ENABLED => 1

    /**
     * @type {String}
     */
    static IHV_VERSION_FUNCTION_NAME => "Dot11ExtIhvGetVersionInfo"

    /**
     * @type {String}
     */
    static IHV_INIT_FUNCTION_NAME => "Dot11ExtIhvInitService"

    /**
     * @type {String}
     */
    static IHV_INIT_VS_FUNCTION_NAME => "Dot11ExtIhvInitVirtualStation"

    /**
     * @type {Integer (UInt32)}
     */
    static MS_MAX_PROFILE_NAME_LENGTH => 256

    /**
     * @type {Integer (UInt32)}
     */
    static MS_PROFILE_GROUP_POLICY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MS_PROFILE_USER => 2
;@endregion Constants

;@region Methods
    /**
     * Opens a connection to the server.
     * @param {Integer} dwClientVersion The highest version of the WLAN API that the client supports. 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Client version for Windows XP with SP3 and Wireless LAN API for Windows XP with SP2.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Client version for Windows Vista and Windows Server 2008
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} pdwNegotiatedVersion The version of the WLAN API that will be used in this session.  This value is usually the highest version supported by both the client and server.
     * @param {Pointer<HANDLE>} phClientHandle A handle for the client to use in this session.  This handle is used by other functions throughout the session.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value may be one of the following return codes.
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
     * <i>pdwNegotiatedVersion</i> is <b>NULL</b>, <i>phClientHandle</i> is <b>NULL</b>, or <i>pReserved</i> is not <b>NULL</b>.
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
     * Failed to allocate memory to create the client context.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_STATUS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Various error codes.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_REMOTE_SESSION_LIMIT_EXCEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Too many handles have been issued by the server.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wlanapi/nf-wlanapi-wlanopenhandle
     * @since windows6.0.6000
     */
    static WlanOpenHandle(dwClientVersion, pdwNegotiatedVersion, phClientHandle) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        pdwNegotiatedVersionMarshal := pdwNegotiatedVersion is VarRef ? "uint*" : "ptr"

        result := DllCall("wlanapi.dll\WlanOpenHandle", "uint", dwClientVersion, "ptr", pReserved, pdwNegotiatedVersionMarshal, pdwNegotiatedVersion, "ptr", phClientHandle, "uint")
        return result
    }

    /**
     * Closes a connection to the server.
     * @param {HANDLE} hClientHandle The client's session handle, which identifies the connection to be closed. This handle was  obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value may be one of the following return codes.
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
     * <i>hClientHandle</i> is <b>NULL</b> or invalid, or <i>pReserved</i> is not <b>NULL</b>.
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
     * The handle <i>hClientHandle</i>  was not found in the handle table.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_STATUS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Various error codes.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wlanapi/nf-wlanapi-wlanclosehandle
     * @since windows6.0.6000
     */
    static WlanCloseHandle(hClientHandle) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        hClientHandle := hClientHandle is Win32Handle ? NumGet(hClientHandle, "ptr") : hClientHandle

        result := DllCall("wlanapi.dll\WlanCloseHandle", "ptr", hClientHandle, "ptr", pReserved, "uint")
        return result
    }

    /**
     * Enumerates all of the wireless LAN interfaces currently enabled on the local computer.
     * @param {HANDLE} hClientHandle The client's session handle, obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
     * @param {Pointer<Pointer<WLAN_INTERFACE_INFO_LIST>>} ppInterfaceList A pointer to storage for a pointer to receive the returned list of wireless LAN interfaces in a <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_interface_info_list">WLAN_INTERFACE_INFO_LIST</a> structure.
     * 
     * The buffer for the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_interface_info_list">WLAN_INTERFACE_INFO_LIST</a> returned is allocated by the <b>WlanEnumInterfaces</b> function if the call succeeds.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value may be one of the following return codes.
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
     * A parameter is incorrect. This error is returned if the <i>hClientHandle</i> or <i>ppInterfaceList</i> parameter is <b>NULL</b>. This error is returned if the <i>pReserved</i> is not <b>NULL</b>.  This error is also returned if the <i>hClientHandle</i> parameter is not valid.
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
     * The handle <i>hClientHandle</i>  was not found in the handle table.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_STATUS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Various error codes.
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
     * Not enough memory is available to process this request and allocate memory for the query results.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wlanapi/nf-wlanapi-wlanenuminterfaces
     * @since windows6.0.6000
     */
    static WlanEnumInterfaces(hClientHandle, ppInterfaceList) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        hClientHandle := hClientHandle is Win32Handle ? NumGet(hClientHandle, "ptr") : hClientHandle

        ppInterfaceListMarshal := ppInterfaceList is VarRef ? "ptr*" : "ptr"

        result := DllCall("wlanapi.dll\WlanEnumInterfaces", "ptr", hClientHandle, "ptr", pReserved, ppInterfaceListMarshal, ppInterfaceList, "uint")
        return result
    }

    /**
     * Sets parameters for the automatic configuration service.
     * @param {HANDLE} hClientHandle The client's session handle, obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
     * @param {Integer} OpCode A <a href="https://docs.microsoft.com/windows/win32/api/wlanapi/ne-wlanapi-wlan_autoconf_opcode-r1">WLAN_AUTOCONF_OPCODE</a> value that specifies the parameter to be set. Only some of the opcodes in the <b>WLAN_AUTOCONF_OPCODE</b> enumeration support set operations.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="wlan_autoconf_opcode_show_denied_networks"></a><a id="WLAN_AUTOCONF_OPCODE_SHOW_DENIED_NETWORKS"></a><dl>
     * <dt><b>wlan_autoconf_opcode_show_denied_networks</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When set, the <i>pData</i> parameter will contain a <b>BOOL</b> value indicating whether user and group policy-denied networks will be included in the available networks list. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="wlan_autoconf_opcode_allow_explicit_creds"></a><a id="WLAN_AUTOCONF_OPCODE_ALLOW_EXPLICIT_CREDS"></a><dl>
     * <dt><b>wlan_autoconf_opcode_allow_explicit_creds</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When set, the <i>pData</i> parameter will contain a <b>BOOL</b> value indicating whether the current wireless interface has shared user credentials allowed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="wlan_autoconf_opcode_block_period"></a><a id="WLAN_AUTOCONF_OPCODE_BLOCK_PERIOD"></a><dl>
     * <dt><b>wlan_autoconf_opcode_block_period</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When set, the <i>pData</i> parameter will contain a <b>DWORD</b> value for the blocked period setting for the current wireless interface. The blocked period is the amount of time, in seconds, for which automatic connection to a wireless network will not be attempted after a previous failure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="wlan_autoconf_opcode_allow_virtual_station_extensibility"></a><a id="WLAN_AUTOCONF_OPCODE_ALLOW_VIRTUAL_STATION_EXTENSIBILITY"></a><dl>
     * <dt><b>wlan_autoconf_opcode_allow_virtual_station_extensibility</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When set, the <i>pData</i> parameter will contain a <b>BOOL</b> value indicating whether extensibility on a virtual station is allowed. By default, extensibility on a virtual station is allowed. The value for this opcode is persisted across restarts.
     * 
     * This enumeration value is supported on Windows 7 and on Windows Server 2008 R2 with the Wireless LAN Service installed.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} dwDataSize The size of the <i>pData</i> parameter, in bytes. This parameter must be set to <c>sizeof(BOOL)</code> for a BOOL or <code>sizeof(DWORD)</c> for a DWORD, depending on the value of the <i>OpCode</i> parameter.
     * @param {Pointer} pData The value to be set for the parameter specified in <i>OpCode</i> parameter. The <i>pData</i> parameter must point to a boolean or DWORD value, depending on the value of the <i>OpCode</i> parameter. The <i>pData</i> parameter must not be <b>NULL</b>.
     * 
     * <div class="alert"><b>Note</b>  The <i>pData</i> parameter may point to an integer value when a boolean is required. If <i>pData</i> points to 0, then the value is converted to <b>FALSE</b>. If <i>pData</i> points to a nonzero integer, then the value is converted to <b>TRUE</b>. </div>
     * <div> </div>
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value may be one of the following return codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Access is denied. This error is returned if the caller does not have sufficient permissions to set the configuration parameter when the <i>OpCode</i> parameter is wlan_autoconf_opcode_show_denied_networks or wlan_autoconf_opcode_allow_virtual_station_extensibility. When the <i>OpCode</i> parameter is set to one of these values, the <a href="/windows/desktop/api/wlanapi/nf-wlanapi-wlansetautoconfigparameter">WlanSetAutoConfigParameter</a>  function retrieves the discretionary access control list (DACL) stored for opcode object. If the DACL does not contain an access control entry (ACE) that grants WLAN_WRITE_ACCESS permission to the access token of the calling thread, then <b>WlanSetAutoConfigParameter</b>  returns <b>ERROR_ACCESS_DENIED</b>.
     * 
     * This error is also returned if the configuration parameter is set by group policy on a domain. When group policy is set for an opcode, applications are prevented from making changes. For the following <i>OpCode</i> parameters may be set by group policy: wlan_autoconf_opcode_show_denied_networks, wlan_autoconf_opcode_allow_explicit_creds, and wlan_autoconf_opcode_block_period
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
     * A parameter was bad. This error is returned if the <i>hClientHandle</i> parameter is <b>NULL</b>, the <i>pData</i> parameter is <b>NULL</b>, or the <i>pReserved</i> parameter is not <b>NULL</b>. This error is also returned if <i>OpCode</i> parameter specified is not one of the <a href="/windows/win32/api/wlanapi/ne-wlanapi-wlan_autoconf_opcode-r1">WLAN_AUTOCONF_OPCODE</a> values for a configuration parameter that can be set. This error is also returned if the <i>dwDataSize</i> parameter is not set to <code>sizeof(BOOL)</code>, or the <i>dwDataSize</i> is not set to <code>sizeof(BOOL)</code> depending on the value of the <i>OpCode</i> parameter.
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
     * The handle <i>hClientHandle</i>  was not found in the handle table.
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
     * This function was called from an unsupported platform. This value will be returned if this function was called from a Windows XP with SP3 or Wireless LAN API for Windows XP with SP2 client.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_STATUS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Various error codes.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wlanapi/nf-wlanapi-wlansetautoconfigparameter
     * @since windows6.0.6000
     */
    static WlanSetAutoConfigParameter(hClientHandle, OpCode, dwDataSize, pData) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        hClientHandle := hClientHandle is Win32Handle ? NumGet(hClientHandle, "ptr") : hClientHandle

        result := DllCall("wlanapi.dll\WlanSetAutoConfigParameter", "ptr", hClientHandle, "int", OpCode, "uint", dwDataSize, "ptr", pData, "ptr", pReserved, "uint")
        return result
    }

    /**
     * Queries for the parameters of the auto configuration service.
     * @param {HANDLE} hClientHandle The client's session handle, obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
     * @param {Integer} OpCode A value that specifies the configuration parameter to be queried.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="wlan_autoconf_opcode_show_denied_networks"></a><a id="WLAN_AUTOCONF_OPCODE_SHOW_DENIED_NETWORKS"></a><dl>
     * <dt><b>wlan_autoconf_opcode_show_denied_networks</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When set, the <i>ppData</i> parameter will contain a <b>BOOL</b> value indicating whether user and group policy-denied networks will be included in the available networks list. 
     * 
     * If the function returns ERROR_SUCCESS and <i>ppData</i> points to <b>TRUE</b>, then user and group policy-denied networks will be included in the available networks list; if <b>FALSE</b>, user and group policy-denied networks will not be included in the available networks list. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="wlan_autoconf_opcode_power_setting"></a><a id="WLAN_AUTOCONF_OPCODE_POWER_SETTING"></a><dl>
     * <dt><b>wlan_autoconf_opcode_power_setting</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When set, the <i>ppData</i> parameter will contain a <a href="https://docs.microsoft.com/windows/win32/api/wlanapi/ne-wlanapi-wlan_power_setting-r1">WLAN_POWER_SETTING</a> value specifying the power settings.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="wlan_autoconf_opcode_only_use_gp_profiles_for_allowed_networks"></a><a id="WLAN_AUTOCONF_OPCODE_ONLY_USE_GP_PROFILES_FOR_ALLOWED_NETWORKS"></a><dl>
     * <dt><b>wlan_autoconf_opcode_only_use_gp_profiles_for_allowed_networks</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When set, the <i>ppData</i> parameter will contain a <b>BOOL</b> value indicating whether profiles not created by group policy can be used to connect to an allowed network with a matching group policy profile. 
     * 
     * If the function returns ERROR_SUCCESS and <i>ppData</i> points to <b>TRUE</b>, then only profiles created by group policy can be used; if <b>FALSE</b>, any profile can be used. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="wlan_autoconf_opcode_allow_explicit_creds"></a><a id="WLAN_AUTOCONF_OPCODE_ALLOW_EXPLICIT_CREDS"></a><dl>
     * <dt><b>wlan_autoconf_opcode_allow_explicit_creds</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When set, the <i>ppData</i> parameter will contain a <b>BOOL</b> value indicating whether the current wireless interface has shared user credentials allowed. 
     * 
     * If the function returns ERROR_SUCCESS and <i>ppData</i> points to <b>TRUE</b>, then the current wireless interface has shared user credentials allowed; if <b>FALSE</b>, the current wireless interface does not allow shared user credentials. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="wlan_autoconf_opcode_block_period"></a><a id="WLAN_AUTOCONF_OPCODE_BLOCK_PERIOD"></a><dl>
     * <dt><b>wlan_autoconf_opcode_block_period</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When set, the <i>ppData</i> parameter will contain a <b>DWORD</b> value that indicates the blocked period setting for the current wireless interface. The blocked period is the amount of time, in seconds, for which automatic connection to a wireless network will not be attempted after a previous failure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="wlan_autoconf_opcode_allow_virtual_station_extensibility"></a><a id="WLAN_AUTOCONF_OPCODE_ALLOW_VIRTUAL_STATION_EXTENSIBILITY"></a><dl>
     * <dt><b>wlan_autoconf_opcode_allow_virtual_station_extensibility</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When set, the <i>ppData</i> parameter will contain a <b>BOOL</b> value indicating whether extensibility on a virtual station is allowed. By default, extensibility on a virtual station is allowed. The value for this opcode is persisted across restarts. 
     * 
     * If the function returns ERROR_SUCCESS and <i>ppData</i> points to <b>TRUE</b>, then extensibility on a virtual station is allowed; if <b>FALSE</b>, extensibility on a virtual station is not allowed. 
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} pdwDataSize Specifies the size of the <i>ppData</i> parameter, in bytes.
     * @param {Pointer<Pointer<Void>>} ppData Pointer to the memory that contains the queried value for the parameter specified in <i>OpCode</i>.
     * 
     * <div class="alert"><b>Note</b>  If <i>OpCode</i> is set to <b>wlan_autoconf_opcode_show_denied_networks</b>, then the pointer referenced by <i>ppData</i> may point to an integer value. If the pointer referenced by <i>ppData</i> points to 0, then the integer value should be converted  to the boolean value <b>FALSE</b>. If the pointer referenced by <i>ppData</i> points to a nonzero integer, then the integer value should be converted  to the boolean value <b>TRUE</b>. </div>
     * <div> </div>
     * @param {Pointer<Integer>} pWlanOpcodeValueType A <a href="https://docs.microsoft.com/windows/win32/api/wlanapi/ne-wlanapi-wlan_opcode_value_type-r1">WLAN_OPCODE_VALUE_TYPE</a> value.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value may be one of the following return codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have sufficient permissions to get configuration parameters. 
     * 
     * When called with <i>OpCode</i> set to <b>wlan_autoconf_opcode_show_denied_networks</b>, <a href="/windows/desktop/api/wlanapi/nf-wlanapi-wlanqueryautoconfigparameter">WlanQueryAutoConfigParameter</a> retrieves the discretionary access control list (DACL) stored with the  <b>wlan_secure_show_denied</b> object. If the DACL does not contain an access control entry (ACE) that grants WLAN_READ_ACCESS permission to the access token of the calling thread, then <b>WlanQueryAutoConfigParameter</b>  returns <b>ERROR_ACCESS_DENIED</b>.
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
     * <i>hClientHandle</i> is <b>NULL</b> or invalid, <i>pReserved</i> is not <b>NULL</b>, <i>ppData</i> is <b>NULL</b>, or <i>pdwDataSize</i> is <b>NULL</b>.
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
     * The handle <i>hClientHandle</i>  was not found in the handle table.
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
     * This function was called from an unsupported platform. This value will be returned if this function was called from a Windows XP with SP3 or Wireless LAN API for Windows XP with SP2 client.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_STATUS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Various error codes.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wlanapi/nf-wlanapi-wlanqueryautoconfigparameter
     * @since windows6.0.6000
     */
    static WlanQueryAutoConfigParameter(hClientHandle, OpCode, pdwDataSize, ppData, pWlanOpcodeValueType) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        hClientHandle := hClientHandle is Win32Handle ? NumGet(hClientHandle, "ptr") : hClientHandle

        pdwDataSizeMarshal := pdwDataSize is VarRef ? "uint*" : "ptr"
        ppDataMarshal := ppData is VarRef ? "ptr*" : "ptr"
        pWlanOpcodeValueTypeMarshal := pWlanOpcodeValueType is VarRef ? "int*" : "ptr"

        result := DllCall("wlanapi.dll\WlanQueryAutoConfigParameter", "ptr", hClientHandle, "int", OpCode, "ptr", pReserved, pdwDataSizeMarshal, pdwDataSize, ppDataMarshal, ppData, pWlanOpcodeValueTypeMarshal, pWlanOpcodeValueType, "uint")
        return result
    }

    /**
     * Retrieves the capabilities of an interface.
     * @param {HANDLE} hClientHandle The client's session handle, obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
     * @param {Pointer<Guid>} pInterfaceGuid The GUID of this interface.
     * @param {Pointer<Pointer<WLAN_INTERFACE_CAPABILITY>>} ppCapability A <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_interface_capability">WLAN_INTERFACE_CAPABILITY</a> structure that contains information about the capabilities of the specified interface.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value may be one of the following return codes.
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
     * <i>hClientHandle</i> is <b>NULL</b> or invalid,  <i>pInterfaceGuid</i> is <b>NULL</b>, <i>pReserved</i> is not <b>NULL</b>, or <i>ppCapability</i> is <b>NULL</b>.
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
     * The handle <i>hClientHandle</i>  was not found in the handle table.
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
     * This function was called from an unsupported platform. This value will be returned if this function was called from a Windows XP with SP3 or Wireless LAN API for Windows XP with SP2 client.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_STATUS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Various error codes.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wlanapi/nf-wlanapi-wlangetinterfacecapability
     * @since windows6.0.6000
     */
    static WlanGetInterfaceCapability(hClientHandle, pInterfaceGuid, ppCapability) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        hClientHandle := hClientHandle is Win32Handle ? NumGet(hClientHandle, "ptr") : hClientHandle

        ppCapabilityMarshal := ppCapability is VarRef ? "ptr*" : "ptr"

        result := DllCall("wlanapi.dll\WlanGetInterfaceCapability", "ptr", hClientHandle, "ptr", pInterfaceGuid, "ptr", pReserved, ppCapabilityMarshal, ppCapability, "uint")
        return result
    }

    /**
     * Sets user-configurable parameters.
     * @param {HANDLE} hClientHandle The client's session handle, obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
     * @param {Pointer<Guid>} pInterfaceGuid The GUID of the interface to be configured.
     * @param {Integer} OpCode A <a href="https://docs.microsoft.com/windows/win32/api/wlanapi/ne-wlanapi-wlan_intf_opcode-r1">WLAN_INTF_OPCODE</a> value that specifies the parameter to be set.  The following table lists the valid constants along with the data type of the parameter in <i>pData</i>.
     * 
     * <table>
     * <tr>
     * <th><b>WLAN_INTF_OPCODE</b> value</th>
     * <th><i>pData</i> data type</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>
     * <b>wlan_intf_opcode_autoconf_enabled</b>
     * 
     * </td>
     * <td><b>BOOL</b></td>
     * <td>
     * Enables or disables auto config for the indicated interface.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <b>wlan_intf_opcode_background_scan_enabled</b>
     * 
     * </td>
     * <td><b>BOOL</b></td>
     * <td>
     * Enables or disables background scan for the indicated interface.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <b>wlan_intf_opcode_radio_state</b>
     * 
     * </td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_phy_radio_state">WLAN_PHY_RADIO_STATE</a>
     * </td>
     * <td>
     * Sets the software radio state of a specific physical layer (PHY) for the interface.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <b>wlan_intf_opcode_bss_type</b>
     * 
     * </td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/dot11-bss-type">DOT11_BSS_TYPE</a>
     * </td>
     * <td>
     * Sets the BSS type.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <b>wlan_intf_opcode_media_streaming_mode</b>
     * 
     * </td>
     * <td><b>BOOL</b></td>
     * <td>
     * Sets media streaming mode for the driver.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <b>wlan_intf_opcode_current_operation_mode</b>
     * 
     * </td>
     * <td><b>ULONG</b></td>
     * <td>
     * Sets the current operation mode for the interface. For more information, see Remarks.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <b>Windows XP with SP3 and Wireless LAN API for Windows XP with SP2:  </b>Only the <b>wlan_intf_opcode_autoconf_enabled</b> and <b>wlan_intf_opcode_bss_type</b> constants are valid.
     * @param {Integer} dwDataSize The size of the <i>pData</i> parameter, in bytes. If <i>dwDataSize</i> is larger than the actual amount of memory allocated to <i>pData</i>, then an access violation will occur in the calling program.
     * @param {Pointer} pData The value to be set as specified by the <i>OpCode</i> parameter. The type of data pointed to by <i>pData</i> must be appropriate for the specified <i>OpCode</i>. Use the table above to determine the type of data to use.
     * 
     * <div class="alert"><b>Note</b>  If <i>OpCode</i> is set to <b>wlan_intf_opcode_autoconf_enabled</b>, <b>wlan_intf_opcode_background_scan_enabled</b>, or <b>wlan_intf_opcode_media_streaming_mode</b>, then <i>pData</i> may point to an integer value. If <i>pData</i> points to 0, then the value is converted to <b>FALSE</b>. If <i>pData</i> points to a nonzero integer, then the value is converted to <b>TRUE</b>. </div>
     * <div> </div>
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value may be one of the following return codes.
     * @see https://docs.microsoft.com/windows/win32/api//wlanapi/nf-wlanapi-wlansetinterface
     * @since windows6.0.6000
     */
    static WlanSetInterface(hClientHandle, pInterfaceGuid, OpCode, dwDataSize, pData) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        hClientHandle := hClientHandle is Win32Handle ? NumGet(hClientHandle, "ptr") : hClientHandle

        result := DllCall("wlanapi.dll\WlanSetInterface", "ptr", hClientHandle, "ptr", pInterfaceGuid, "int", OpCode, "uint", dwDataSize, "ptr", pData, "ptr", pReserved, "uint")
        return result
    }

    /**
     * The WlanQueryInterface function queries various parameters of a specified interface.
     * @param {HANDLE} hClientHandle The client's session handle, obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
     * @param {Pointer<Guid>} pInterfaceGuid The GUID of the interface to be queried.
     * @param {Integer} OpCode A <a href="https://docs.microsoft.com/windows/win32/api/wlanapi/ne-wlanapi-wlan_intf_opcode-r1">WLAN_INTF_OPCODE</a> value that specifies the parameter to be queried.  The following table lists the valid constants along with the data type of the parameter in <i>ppData</i>.
     * 
     * <table>
     * <tr>
     * <th><b>WLAN_INTF_OPCODE</b> value</th>
     * <th><i>ppData</i> data type</th>
     * </tr>
     * <tr>
     * <td>wlan_intf_opcode_autoconf_enabled</td>
     * <td>BOOL</td>
     * </tr>
     * <tr>
     * <td>wlan_intf_opcode_background_scan_enabled </td>
     * <td>BOOL</td>
     * </tr>
     * <tr>
     * <td>wlan_intf_opcode_radio_state </td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_radio_state">WLAN_RADIO_STATE</a>
     * </td>
     * </tr>
     * <tr>
     * <td>wlan_intf_opcode_bss_type </td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/dot11-bss-type">DOT11_BSS_TYPE</a>
     * </td>
     * </tr>
     * <tr>
     * <td>wlan_intf_opcode_interface_state </td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/win32/api/wlanapi/ne-wlanapi-wlan_interface_state-r1">WLAN_INTERFACE_STATE</a>
     * </td>
     * </tr>
     * <tr>
     * <td>wlan_intf_opcode_current_connection </td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_connection_attributes">WLAN_CONNECTION_ATTRIBUTES</a>
     * </td>
     * </tr>
     * <tr>
     * <td>wlan_intf_opcode_channel_number 
     * </td>
     * <td>ULONG</td>
     * </tr>
     * <tr>
     * <td>wlan_intf_opcode_supported_infrastructure_auth_cipher_pairs 
     * </td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_auth_cipher_pair_list">WLAN_AUTH_CIPHER_PAIR_LIST</a>
     * </td>
     * </tr>
     * <tr>
     * <td>wlan_intf_opcode_supported_adhoc_auth_cipher_pairs </td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_auth_cipher_pair_list">WLAN_AUTH_CIPHER_PAIR_LIST</a>
     * </td>
     * </tr>
     * <tr>
     * <td>wlan_intf_opcode_supported_country_or_region_string_list </td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_country_or_region_string_list">WLAN_COUNTRY_OR_REGION_STRING_LIST</a>
     * </td>
     * </tr>
     * <tr>
     * <td>wlan_intf_opcode_media_streaming_mode </td>
     * <td>BOOL</td>
     * </tr>
     * <tr>
     * <td>wlan_intf_opcode_statistics </td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_statistics">WLAN_STATISTICS</a>
     * </td>
     * </tr>
     * <tr>
     * <td>wlan_intf_opcode_rssi</td>
     * <td>LONG</td>
     * </tr>
     * <tr>
     * <td>wlan_intf_opcode_current_operation_mode </td>
     * <td>ULONG</td>
     * </tr>
     * <tr>
     * <td>wlan_intf_opcode_supported_safe_mode</td>
     * <td>BOOL</td>
     * </tr>
     * <tr>
     * <td>wlan_intf_opcode_certified_safe_mode</td>
     * <td>BOOL</td>
     * </tr>
     * </table>
     *  
     * 
     * <b>Windows XP with SP3 and Wireless LAN API for Windows XP with SP2:  </b>Only the <b>wlan_intf_opcode_autoconf_enabled</b>, <b>wlan_intf_opcode_bss_type</b>, <b>wlan_intf_opcode_interface_state</b>, and  <b>wlan_intf_opcode_current_connection</b> constants are valid.
     * @param {Pointer<Integer>} pdwDataSize The size of the <i>ppData</i> parameter, in bytes.
     * @param {Pointer<Pointer<Void>>} ppData Pointer to the memory location that contains the queried value of the parameter specified by the <i>OpCode</i> parameter.
     * 
     * <div class="alert"><b>Note</b>  If <i>OpCode</i> is set to <b>wlan_intf_opcode_autoconf_enabled</b>, <b>wlan_intf_opcode_background_scan_enabled</b>, or <b>wlan_intf_opcode_media_streaming_mode</b>, then the pointer referenced by <i>ppData</i> may point to an integer value. If the pointer referenced by <i>ppData</i> points to 0, then the integer value should be converted  to the boolean value <b>FALSE</b>. If the pointer referenced by <i>ppData</i> points to a nonzero integer, then the integer value should be converted  to the boolean value <b>TRUE</b>. </div>
     * <div> </div>
     * @param {Pointer<Integer>} pWlanOpcodeValueType If passed a non-<b>NULL</b> value, points to a <a href="https://docs.microsoft.com/windows/win32/api/wlanapi/ne-wlanapi-wlan_opcode_value_type-r1">WLAN_OPCODE_VALUE_TYPE</a> value that specifies the type of opcode returned. This parameter may be <b>NULL</b>.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value may be one of the following return codes.
     * @see https://docs.microsoft.com/windows/win32/api//wlanapi/nf-wlanapi-wlanqueryinterface
     * @since windows6.0.6000
     */
    static WlanQueryInterface(hClientHandle, pInterfaceGuid, OpCode, pdwDataSize, ppData, pWlanOpcodeValueType) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        hClientHandle := hClientHandle is Win32Handle ? NumGet(hClientHandle, "ptr") : hClientHandle

        pdwDataSizeMarshal := pdwDataSize is VarRef ? "uint*" : "ptr"
        ppDataMarshal := ppData is VarRef ? "ptr*" : "ptr"
        pWlanOpcodeValueTypeMarshal := pWlanOpcodeValueType is VarRef ? "int*" : "ptr"

        result := DllCall("wlanapi.dll\WlanQueryInterface", "ptr", hClientHandle, "ptr", pInterfaceGuid, "int", OpCode, "ptr", pReserved, pdwDataSizeMarshal, pdwDataSize, ppDataMarshal, ppData, pWlanOpcodeValueTypeMarshal, pWlanOpcodeValueType, "uint")
        return result
    }

    /**
     * Provides a mechanism for independent hardware vendor (IHV) control of WLAN drivers or services.
     * @param {HANDLE} hClientHandle The client's session handle, obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
     * @param {Pointer<Guid>} pInterfaceGuid The GUID of the interface.
     * @param {Integer} Type A <a href="https://docs.microsoft.com/windows/win32/api/wlanapi/ne-wlanapi-wlan_ihv_control_type-r1">WLAN_IHV_CONTROL_TYPE</a> structure that specifies the type of software bypassed by the IHV control function.
     * @param {Integer} dwInBufferSize The size, in bytes, of the input buffer.
     * @param {Pointer} pInBuffer A generic buffer for driver or service interface input.
     * @param {Integer} dwOutBufferSize The size, in bytes, of the output buffer.
     * @param {Pointer} pOutBuffer A generic buffer for driver or service interface output.
     * @param {Pointer<Integer>} pdwBytesReturned The number of bytes returned.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value may be one of the following return codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have sufficient permissions to perform this operation. When called, <a href="/windows/desktop/api/wlanapi/nf-wlanapi-wlanihvcontrol">WlanIhvControl</a>  retrieves the discretionary access control list (DACL) stored with the  <b>wlan_secure_ihv_control</b> object. If the DACL does not contain an access control entry (ACE) that grants WLAN_WRITE_ACCESS permission to the access token of the calling thread, then <b>WlanIhvControl</b>    returns <b>ERROR_ACCESS_DENIED</b>.
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
     * <i>hClientHandle</i> is <b>NULL</b> or invalid, <i>pInterfaceGuid</i> is <b>NULL</b>, or <i>pdwBytesReturned</i> is <b>NULL</b>.
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
     * The handle <i>hClientHandle</i>  was not found in the handle table.
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
     * This function was called from an unsupported platform. This value will be returned if this function was called from a Windows XP with SP3 or Wireless LAN API for Windows XP with SP2 client.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_STATUS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Various error codes.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wlanapi/nf-wlanapi-wlanihvcontrol
     * @since windows6.0.6000
     */
    static WlanIhvControl(hClientHandle, pInterfaceGuid, Type, dwInBufferSize, pInBuffer, dwOutBufferSize, pOutBuffer, pdwBytesReturned) {
        hClientHandle := hClientHandle is Win32Handle ? NumGet(hClientHandle, "ptr") : hClientHandle

        pdwBytesReturnedMarshal := pdwBytesReturned is VarRef ? "uint*" : "ptr"

        result := DllCall("wlanapi.dll\WlanIhvControl", "ptr", hClientHandle, "ptr", pInterfaceGuid, "int", Type, "uint", dwInBufferSize, "ptr", pInBuffer, "uint", dwOutBufferSize, "ptr", pOutBuffer, pdwBytesReturnedMarshal, pdwBytesReturned, "uint")
        return result
    }

    /**
     * Requests a scan for available networks on the indicated interface.
     * @param {HANDLE} hClientHandle The client's session handle, obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
     * @param {Pointer<Guid>} pInterfaceGuid The GUID of the interface to be queried.
     * 
     *  The GUID of each wireless LAN interface enabled on a local computer can be determined using the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanenuminterfaces">WlanEnumInterfaces</a> function.
     * @param {Pointer<DOT11_SSID>} pDot11Ssid A pointer to a <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/dot11-ssid">DOT11_SSID</a> structure that specifies the SSID of the network to be scanned. This parameter is optional. When set to <b>NULL</b>, the returned list contains all available networks. 
     * <b>Windows XP with SP3 and Wireless LAN API for Windows XP with SP2:  </b>This parameter must be <b>NULL</b>.
     * @param {Pointer<WLAN_RAW_DATA>} pIeData A pointer to an information element to include in probe requests. This parameter points to a <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_raw_data">WLAN_RAW_DATA</a> structure that may include client provisioning availability information and 802.1X authentication requirements.<b>Windows XP with SP3 and Wireless LAN API for Windows XP with SP2:  </b>This parameter must be <b>NULL</b>.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value may be one of the following return codes.
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
     * <i>hClientHandle</i> is <b>NULL</b> or invalid,  <i>pInterfaceGuid</i> is <b>NULL</b>, or <i>pReserved</i> is not <b>NULL</b>.
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
     * The handle <i>hClientHandle</i>  was not found in the handle table.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_STATUS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Various error codes.
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
     * Failed to allocate memory for the query results.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wlanapi/nf-wlanapi-wlanscan
     * @since windows6.0.6000
     */
    static WlanScan(hClientHandle, pInterfaceGuid, pDot11Ssid, pIeData) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        hClientHandle := hClientHandle is Win32Handle ? NumGet(hClientHandle, "ptr") : hClientHandle

        result := DllCall("wlanapi.dll\WlanScan", "ptr", hClientHandle, "ptr", pInterfaceGuid, "ptr", pDot11Ssid, "ptr", pIeData, "ptr", pReserved, "uint")
        return result
    }

    /**
     * Retrieves the list of available networks on a wireless LAN interface.
     * @param {HANDLE} hClientHandle The client's session handle, obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
     * @param {Pointer<Guid>} pInterfaceGuid A pointer to the GUID of the wireless LAN interface to be queried.
     * 
     *  The GUID of each wireless LAN interface enabled on a local computer can be determined using the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanenuminterfaces">WlanEnumInterfaces</a> function.
     * @param {Integer} dwFlags A set of flags that control the type of networks returned in the list.  This parameter can be a combination of these possible values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WLAN_AVAILABLE_NETWORK_INCLUDE_ALL_ADHOC_PROFILES"></a><a id="wlan_available_network_include_all_adhoc_profiles"></a><dl>
     * <dt><b>WLAN_AVAILABLE_NETWORK_INCLUDE_ALL_ADHOC_PROFILES</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Include all ad hoc network profiles in the available network list, including profiles that are not visible.
     * 
     * <div class="alert"><b>Note</b>  If this flag is specified on Windows XP with SP3 and Wireless LAN API for Windows XP with SP2, it is consider considered an invalid parameter.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WLAN_AVAILABLE_NETWORK_INCLUDE_ALL_MANUAL_HIDDEN_PROFILES"></a><a id="wlan_available_network_include_all_manual_hidden_profiles"></a><dl>
     * <dt><b>WLAN_AVAILABLE_NETWORK_INCLUDE_ALL_MANUAL_HIDDEN_PROFILES</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Include all hidden network profiles in the available network list, including profiles that are not visible.
     * 
     * <div class="alert"><b>Note</b>  If this flag is specified on Windows XP with SP3 and Wireless LAN API for Windows XP with SP2, it is consider considered an invalid parameter.</div>
     * <div> </div>
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Pointer<WLAN_AVAILABLE_NETWORK_LIST>>} ppAvailableNetworkList A pointer to storage for a pointer to receive the returned list of visible networks in a <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_available_network_list">WLAN_AVAILABLE_NETWORK_LIST</a> structure.
     * 
     * The buffer for the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_available_network_list">WLAN_AVAILABLE_NETWORK_LIST</a> returned is allocated by the <b>WlanGetAvailableNetworkList</b> function if the call succeeds.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value may be one of the following return codes.
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
     * A parameter is incorrect. This error is returned if the <i>hClientHandle</i>,  <i>pInterfaceGuid</i>, or <i>ppAvailableNetworkList</i> parameter is <b>NULL</b>. This error is returned if the <i>pReserved</i> is not <b>NULL</b>. This error is also returned if the <i>dwFlags</i> parameter value is set to value that is not valid or the <i>hClientHandle</i> parameter is not valid.
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
     * The handle <i>hClientHandle</i>  was not found in the handle table.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NDIS_DOT11_POWER_STATE_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The radio associated with the interface is turned off. There are no available networks when the radio is off. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_STATUS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Various error codes.
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
     * Not enough memory is available to process this request and allocate memory for the query results.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wlanapi/nf-wlanapi-wlangetavailablenetworklist
     * @since windows6.0.6000
     */
    static WlanGetAvailableNetworkList(hClientHandle, pInterfaceGuid, dwFlags, ppAvailableNetworkList) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        hClientHandle := hClientHandle is Win32Handle ? NumGet(hClientHandle, "ptr") : hClientHandle

        ppAvailableNetworkListMarshal := ppAvailableNetworkList is VarRef ? "ptr*" : "ptr"

        result := DllCall("wlanapi.dll\WlanGetAvailableNetworkList", "ptr", hClientHandle, "ptr", pInterfaceGuid, "uint", dwFlags, "ptr", pReserved, ppAvailableNetworkListMarshal, ppAvailableNetworkList, "uint")
        return result
    }

    /**
     * 
     * @param {HANDLE} hClientHandle 
     * @param {Pointer<Guid>} pInterfaceGuid 
     * @param {Integer} dwFlags 
     * @param {Pointer<Pointer<WLAN_AVAILABLE_NETWORK_LIST_V2>>} ppAvailableNetworkList 
     * @returns {Integer} 
     */
    static WlanGetAvailableNetworkList2(hClientHandle, pInterfaceGuid, dwFlags, ppAvailableNetworkList) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        hClientHandle := hClientHandle is Win32Handle ? NumGet(hClientHandle, "ptr") : hClientHandle

        ppAvailableNetworkListMarshal := ppAvailableNetworkList is VarRef ? "ptr*" : "ptr"

        result := DllCall("wlanapi.dll\WlanGetAvailableNetworkList2", "ptr", hClientHandle, "ptr", pInterfaceGuid, "uint", dwFlags, "ptr", pReserved, ppAvailableNetworkListMarshal, ppAvailableNetworkList, "uint")
        return result
    }

    /**
     * Retrieves a list of the basic service set (BSS) entries of the wireless network or networks on a given wireless LAN interface.
     * @param {HANDLE} hClientHandle The client's session handle, obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
     * @param {Pointer<Guid>} pInterfaceGuid A pointer to the GUID of the wireless LAN interface to be queried.
     * 
     *  The GUID of each wireless LAN interface enabled on a local computer can be determined using the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanenuminterfaces">WlanEnumInterfaces</a> function.
     * @param {Pointer<DOT11_SSID>} pDot11Ssid A pointer to a <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/dot11-ssid">DOT11_SSID</a> structure that specifies the SSID of the network from which the BSS list is requested.  This parameter is optional. When set to <b>NULL</b>, the returned list contains all of available BSS entries on a wireless LAN interface.
     * 
     * If a pointer to a <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/dot11-ssid">DOT11_SSID</a> structure is specified, the SSID length specified in the <b>uSSIDLength</b> member of <b>DOT11_SSID</b> structure must be less than or equal to <b>DOT11_SSID_MAX_LENGTH</b> defined in the <i>Wlantypes.h</i> header file. In addition, the <i>dot11BssType</i> parameter must be set to either <b>dot11_BSS_type_infrastructure</b> or <b>dot11_BSS_type_independent</b> and the <i>bSecurityEnabled</i> parameter must be specified.
     * @param {Integer} dot11BssType The BSS type of the network. This parameter is ignored if the SSID of the network for the BSS list is unspecified (the <i>pDot11Ssid</i> parameter is <b>NULL</b>).
     * @param {BOOL} bSecurityEnabled A value that indicates whether security is enabled on the network.  This parameter is only valid when the SSID of the network for the BSS list is specified (the <i>pDot11Ssid</i> parameter is not <b>NULL</b>).
     * @param {Pointer<Pointer<WLAN_BSS_LIST>>} ppWlanBssList A pointer to storage for a pointer to receive the returned list of of BSS entries in a <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_bss_list">WLAN_BSS_LIST</a> structure. 
     * 
     * The buffer for the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_bss_list">WLAN_BSS_LIST</a> returned is allocated by the <b>WlanGetNetworkBssList</b> function if the call succeeds.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value may be one of the following return codes.
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
     * The handle <i>hClientHandle</i>  was not found in the handle table.
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
     * A parameter is incorrect. This error is returned if the <i>hClientHandle</i>,  <i>pInterfaceGuid</i>, or <i>ppWlanBssList</i> parameter is <b>NULL</b>. This error is returned if the <i>pReserved</i> is not <b>NULL</b>. This error is also returned if the <i>hClientHandle</i>, the SSID specified in the <i>pDot11Ssid</i> parameter, or the BSS type specified in the <i>dot11BssType</i> parameter is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NDIS_DOT11_POWER_STATE_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The radio associated with the interface is turned off. The BSS list is not available when the radio is off.
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
     * Not enough memory is available to process this request and allocate memory for the query results.
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
     * The element was not found. This error is returned if the GUID of the interface to be queried that was specified in the <i>pInterfaceGuid</i> parameter could not be found.
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
     * The request is not supported. This error is returned if this function was called from a  Windows XP with SP3 or Wireless LAN API for Windows XP with SP2 client. This error is also returned if the WLAN AutoConfig service is disabled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SERVICE_NOT_ACTIVE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The WLAN AutoConfig service has not been started.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_STATUS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Various error codes.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wlanapi/nf-wlanapi-wlangetnetworkbsslist
     * @since windows6.0.6000
     */
    static WlanGetNetworkBssList(hClientHandle, pInterfaceGuid, pDot11Ssid, dot11BssType, bSecurityEnabled, ppWlanBssList) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        hClientHandle := hClientHandle is Win32Handle ? NumGet(hClientHandle, "ptr") : hClientHandle

        ppWlanBssListMarshal := ppWlanBssList is VarRef ? "ptr*" : "ptr"

        result := DllCall("wlanapi.dll\WlanGetNetworkBssList", "ptr", hClientHandle, "ptr", pInterfaceGuid, "ptr", pDot11Ssid, "int", dot11BssType, "int", bSecurityEnabled, "ptr", pReserved, ppWlanBssListMarshal, ppWlanBssList, "uint")
        return result
    }

    /**
     * Attempts to connect to a specific network.
     * @param {HANDLE} hClientHandle The client's session handle, returned by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
     * @param {Pointer<Guid>} pInterfaceGuid The GUID of the interface to use for the connection.
     * @param {Pointer<WLAN_CONNECTION_PARAMETERS>} pConnectionParameters Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_connection_parameters">WLAN_CONNECTION_PARAMETERS</a> structure that specifies the connection type, mode, network profile, SSID that identifies the network, and other parameters.
     * 
     * <b>Windows XP with SP3 and Wireless LAN API for Windows XP with SP2:  </b>There are some constraints on  the  <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_connection_parameters">WLAN_CONNECTION_PARAMETERS</a> members. This means that structures that are valid for   Windows Server 2008 and Windows Vista may not be valid for Windows XP with SP3 or Wireless LAN API for Windows XP with SP2. For a list of constraints, see <b>WLAN_CONNECTION_PARAMETERS</b>.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value may be one of the following return codes.
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
     * One of the following conditions occurred:
     * 
     * <ul>
     * <li><i>hClientHandle</i> is <b>NULL</b> or invalid.</li>
     * <li><i>pInterfaceGuid</i> is <b>NULL</b>.</li>
     * <li><i>pConnectionParameters</i> is <b>NULL</b>.</li>
     * <li>The <b>dwFlags</b> member of the  structure pointed to by <i>pConnectionParameters</i> is not set to one of the values specified on the <a href="/windows/desktop/api/wlanapi/ns-wlanapi-wlan_connection_parameters">WLAN_CONNECTION_PARAMETERS</a> page.</li>
     * <li>The <b>wlanConnectionMode</b> member of the  structure pointed to by <i>pConnectionParameters</i> is set to <b>wlan_connection_mode_discovery_secure</b> or <b>wlan_connection_mode_discovery_unsecure</b>, and the <b>pDot11Ssid</b> member of the same structure is <b>NULL</b>.</li>
     * <li>The <b>wlanConnectionMode</b> member of the  structure pointed to by <i>pConnectionParameters</i> is set to <b>wlan_connection_mode_discovery_secure</b> or <b>wlan_connection_mode_discovery_unsecure</b>, and the <b>dot11BssType</b> member of the same structure is set to <b>dot11_BSS_type_any</b>.</li>
     * <li>The <b>wlanConnectionMode</b> member of the  structure pointed to by <i>pConnectionParameters</i> is set to <b>wlan_connection_mode_profile</b>, and the <b>strProfile</b> member of the same structure is <b>NULL</b> or  the length of the profile exceeds WLAN_MAX_NAME_LENGTH.</li>
     * <li>The <b>wlanConnectionMode</b> member of the  structure pointed to by <i>pConnectionParameters</i> is set to <b>wlan_connection_mode_profile</b>, and the <b>strProfile</b> member of the same structure is <b>NULL</b> or  the length of the profile is zero.</li>
     * <li>The <b>wlanConnectionMode</b> member of the  structure pointed to by <i>pConnectionParameters</i> is set to <b>wlan_connection_mode_invalid</b> or <b>wlan_connection_mode_auto</b>.</li>
     * <li>The <b>dot11BssType</b> member of the  structure pointed to by <i>pConnectionParameters</i> is set to <b>dot11_BSS_type_infrastructure</b>, and the <b>dwFlags</b> member of the same structure is set to <b>WLAN_CONNECTION_ADHOC_JOIN_ONLY</b>.</li>
     * <li>The <b>dot11BssType</b> member of the  structure pointed to by <i>pConnectionParameters</i> is set to <b>dot11_BSS_type_independent</b>, and the <b>dwFlags</b> member of the same structure is set to <b>WLAN_CONNECTION_HIDDEN_NETWORK</b>.</li>
     * <li>The <b>dwFlags</b> member of the  structure pointed to by <i>pConnectionParameters</i> is set to <b>WLAN_CONNECTION_IGNORE_PRIVACY_BIT</b>, and either the <b>wlanConnectionMode</b> member of the same structure is not set to <b>wlan_connection_mode_temporary_profile</b> or the <b>dot11BssType</b> member of the same structure is set to <b>dot11_BSS_type_independent</b>.</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle <i>hClientHandle</i>  was not found in the handle table.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_STATUS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Various error codes.
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
     * The caller does not have sufficient permissions. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wlanapi/nf-wlanapi-wlanconnect
     * @since windows6.0.6000
     */
    static WlanConnect(hClientHandle, pInterfaceGuid, pConnectionParameters) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        hClientHandle := hClientHandle is Win32Handle ? NumGet(hClientHandle, "ptr") : hClientHandle

        result := DllCall("wlanapi.dll\WlanConnect", "ptr", hClientHandle, "ptr", pInterfaceGuid, "ptr", pConnectionParameters, "ptr", pReserved, "uint")
        return result
    }

    /**
     * 
     * @param {HANDLE} hClientHandle 
     * @param {Pointer<Guid>} pInterfaceGuid 
     * @param {Pointer<WLAN_CONNECTION_PARAMETERS_V2>} pConnectionParameters 
     * @returns {Integer} 
     */
    static WlanConnect2(hClientHandle, pInterfaceGuid, pConnectionParameters) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        hClientHandle := hClientHandle is Win32Handle ? NumGet(hClientHandle, "ptr") : hClientHandle

        result := DllCall("wlanapi.dll\WlanConnect2", "ptr", hClientHandle, "ptr", pInterfaceGuid, "ptr", pConnectionParameters, "ptr", pReserved, "uint")
        return result
    }

    /**
     * Disconnects an interface from its current network.
     * @param {HANDLE} hClientHandle The client's session handle, obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
     * @param {Pointer<Guid>} pInterfaceGuid The GUID of the interface to be disconnected.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value may be one of the following return codes.
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
     * <i>hClientHandle</i> is <b>NULL</b> or invalid,  <i>pInterfaceGuid</i> is <b>NULL</b>, or <i>pReserved</i> is not <b>NULL</b>.
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
     * The handle <i>hClientHandle</i>  was not found in the handle table.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_STATUS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Various error codes.
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
     * Failed to allocate memory for the query results.
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
     * The caller does not have sufficient permissions. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wlanapi/nf-wlanapi-wlandisconnect
     * @since windows6.0.6000
     */
    static WlanDisconnect(hClientHandle, pInterfaceGuid) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        hClientHandle := hClientHandle is Win32Handle ? NumGet(hClientHandle, "ptr") : hClientHandle

        result := DllCall("wlanapi.dll\WlanDisconnect", "ptr", hClientHandle, "ptr", pInterfaceGuid, "ptr", pReserved, "uint")
        return result
    }

    /**
     * Is used to register and unregister notifications on all wireless interfaces.
     * @param {HANDLE} hClientHandle The client's session handle, obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
     * @param {Integer} dwNotifSource The notification sources to be registered. These flags may be combined. When this parameter is set to <b>WLAN_NOTIFICATION_SOURCE_NONE</b>, <b>WlanRegisterNotification</b> unregisters notifications on all wireless interfaces. 
     * 
     * The possible values for this parameter are defined in the <i>Wlanapi.h</i> and <i>L2cmn.h</i> header files.
     * 
     * 
     * The following table shows possible values.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WLAN_NOTIFICATION_SOURCE_NONE"></a><a id="wlan_notification_source_none"></a><dl>
     * <dt><b>WLAN_NOTIFICATION_SOURCE_NONE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unregisters notifications.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WLAN_NOTIFICATION_SOURCE_ALL"></a><a id="wlan_notification_source_all"></a><dl>
     * <dt><b>WLAN_NOTIFICATION_SOURCE_ALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Registers for all notifications available on the version of the operating system, including those generated by the 802.1X module. 
     * 
     * For Windows XP with SP3 and Wireless LAN API for Windows XP with SP2, setting <i>dwNotifSource</i> to <b>WLAN_NOTIFICATION_SOURCE_ALL</b> is functionally equivalent to setting <i>dwNotifSource</i> to <b>WLAN_NOTIFICATION_SOURCE_ACM</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WLAN_NOTIFICATION_SOURCE_ACM"></a><a id="wlan_notification_source_acm"></a><dl>
     * <dt><b>WLAN_NOTIFICATION_SOURCE_ACM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Registers for notifications generated by the auto configuration module.
     * 
     * <b>Windows XP with SP3 and Wireless LAN API for Windows XP with SP2:  </b>Only the wlan_notification_acm_connection_complete and wlan_notification_acm_disconnected notifications are available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WLAN_NOTIFICATION_SOURCE_HNWK"></a><a id="wlan_notification_source_hnwk"></a><dl>
     * <dt><b>WLAN_NOTIFICATION_SOURCE_HNWK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Registers for notifications generated by the wireless Hosted Network. This notification source is available on Windows 7 and  on Windows Server 2008 R2 with the Wireless LAN Service installed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WLAN_NOTIFICATION_SOURCE_ONEX"></a><a id="wlan_notification_source_onex"></a><dl>
     * <dt><b>WLAN_NOTIFICATION_SOURCE_ONEX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Registers for notifications generated by 802.1X.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WLAN_NOTIFICATION_SOURCE_MSM"></a><a id="wlan_notification_source_msm"></a><dl>
     * <dt><b>WLAN_NOTIFICATION_SOURCE_MSM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Registers for notifications generated by MSM.
     * 
     * <b>Windows XP with SP3 and Wireless LAN API for Windows XP with SP2:  </b>This value is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WLAN_NOTIFICATION_SOURCE_SECURITY"></a><a id="wlan_notification_source_security"></a><dl>
     * <dt><b>WLAN_NOTIFICATION_SOURCE_SECURITY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Registers for notifications generated by the security module.
     * 
     * No notifications are currently defined for <b>WLAN_NOTIFICATION_SOURCE_SECURITY</b>.
     * 
     * <b>Windows XP with SP3 and Wireless LAN API for Windows XP with SP2:  </b>This value is not supported.
     * 
     * </td>
     * </tr>
     * 
     * <tr>
     * <td width="40%"><a id="WLAN_NOTIFICATION_SOURCE_IHV"></a><a id="wlan_notification_source_ihv"></a><dl>
     * <dt><b>WLAN_NOTIFICATION_SOURCE_IHV</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Registers for notifications generated by independent hardware vendors (IHV).
     * <b>Windows XP with SP3 and Wireless LAN API for Windows XP with SP2:  </b>This value is not supported.
     * </td>
     * </tr>
     * 
     * <tr>
     * <td width="40%"><a id="WLAN_NOTIFICATION_SOURCE_DEVICE_SERVICE"></a><a id="wlan_notification_source_ihv"></a><dl>
     * <dt><b>WLAN_NOTIFICATION_SOURCE_DEVICE_SERVICE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">Registers for notifications generated by device services.</td>
     * </tr>
     * 
     * </table>
     * 
     * <b>Windows XP with SP3 and Wireless LAN API for Windows XP with SP2:  </b>This parameter must be set to WLAN_NOTIFICATION_SOURCE_NONE, WLAN_NOTIFICATION_SOURCE_ALL, or WLAN_NOTIFICATION_SOURCE_ACM.
     * @param {BOOL} bIgnoreDuplicate Specifies whether duplicate notifications will be ignored.  If set to <b>TRUE</b>, a notification will not be sent to the client if it is identical to the previous one.
     * 
     * <b>Windows XP with SP3 and Wireless LAN API for Windows XP with SP2:  </b>This parameter is ignored.
     * @param {Pointer<WLAN_NOTIFICATION_CALLBACK>} funcCallback A <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nc-wlanapi-wlan_notification_callback">WLAN_NOTIFICATION_CALLBACK</a>  type that defines the type of notification callback function.
     * 
     * This parameter can be <b>NULL</b> if the <i>dwNotifSource</i> parameter is set to <b>WLAN_NOTIFICATION_SOURCE_NONE</b> to unregister notifications on all wireless interfaces,
     * @param {Pointer<Void>} pCallbackContext A pointer to the client context that will be passed to the callback function with the notification.
     * @param {Pointer<Integer>} pdwPrevNotifSource A pointer to the previously registered notification sources.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value may be one of the following return codes.
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
     * A  parameter is incorrect. This error is returned if <i>hClientHandle</i> is <b>NULL</b> or not valid or if <i>pReserved</i> is not <b>NULL</b>.
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
     * The handle <i>hClientHandle</i>  was not found in the handle table.
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
     * Failed to allocate memory for the query results.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_STATUS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Various error codes.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wlanapi/nf-wlanapi-wlanregisternotification
     * @since windows6.0.6000
     */
    static WlanRegisterNotification(hClientHandle, dwNotifSource, bIgnoreDuplicate, funcCallback, pCallbackContext, pdwPrevNotifSource) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        hClientHandle := hClientHandle is Win32Handle ? NumGet(hClientHandle, "ptr") : hClientHandle

        pCallbackContextMarshal := pCallbackContext is VarRef ? "ptr" : "ptr"
        pdwPrevNotifSourceMarshal := pdwPrevNotifSource is VarRef ? "uint*" : "ptr"

        result := DllCall("wlanapi.dll\WlanRegisterNotification", "ptr", hClientHandle, "uint", dwNotifSource, "int", bIgnoreDuplicate, "ptr", funcCallback, pCallbackContextMarshal, pCallbackContext, "ptr", pReserved, pdwPrevNotifSourceMarshal, pdwPrevNotifSource, "uint")
        return result
    }

    /**
     * Retrieves all information about a specified wireless profile.
     * @param {HANDLE} hClientHandle The client's session handle, obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
     * @param {Pointer<Guid>} pInterfaceGuid The GUID of the wireless interface. 
     * 
     * A list of the GUIDs for wireless interfaces on the local computer can be retrieved using the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanenuminterfaces">WlanEnumInterfaces</a> function.
     * @param {PWSTR} strProfileName The name of the profile. Profile names are case-sensitive. This string must be NULL-terminated. The maximum length of the profile name is 255 characters. This means that the maximum length of this string, including the NULL terminator, is 256 characters.
     * 
     * <b>Windows XP with SP3 and Wireless LAN API for Windows XP with SP2:  </b>The name of the profile is derived automatically from the SSID of the network. For infrastructure network profiles, the name of the profile is the SSID of the network. For ad hoc network profiles, the name of the profile is the SSID of the ad hoc network followed by <c>-adhoc</c>.
     * @param {Pointer<PWSTR>} pstrProfileXml A string that is the XML representation of the queried profile. There is no predefined maximum string length.
     * @param {Pointer<Integer>} pdwFlags On input, a pointer to the address location used to provide additional information about the request. If this parameter is <b>NULL</b> on input, then no information on profile flags will be returned. On output,  a pointer to the address location used to receive profile flags.
     * 
     * <b>Windows XP with SP3 and Wireless LAN API for Windows XP with SP2:  </b>Per-user profiles are not supported. Set this parameter to <b>NULL</b>. 
     * 
     * 
     * The <i>pdwFlags</i> parameter can point to an address location that contains the following values:
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WLAN_PROFILE_GET_PLAINTEXT_KEY"></a><a id="wlan_profile_get_plaintext_key"></a><dl>
     * <dt><b>WLAN_PROFILE_GET_PLAINTEXT_KEY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * On input, this flag indicates that the caller wants to retrieve the plain text key from a wireless profile. If the calling thread has the required permissions, the  <b>WlanGetProfile</b> function returns the plain text key in the <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/wlan-profileschema-keymaterial-sharedkey-element">keyMaterial</a> element of the profile returned in the buffer pointed to by the   <i>pstrProfileXml</i> parameter.
     * 
     * For the <b>WlanGetProfile</b> call to return the plain text key, the <b>wlan_secure_get_plaintext_key</b> permissions from the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ne-wlanapi-wlan_securable_object">WLAN_SECURABLE_OBJECT</a> enumerated type must be set on the calling thread. The DACL must also contain an ACE that grants <b>WLAN_READ_ACCESS</b> permission to the access token of the calling thread. By default,  the permissions for retrieving the plain text key is allowed only to the members of the Administrators group on a local machine.
     * 
     * 
     * 
     * If the calling thread lacks the required permissions, the <b>WlanGetProfile</b> function returns the encrypted key in the <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/wlan-profileschema-keymaterial-sharedkey-element">keyMaterial</a> element of the profile returned in the buffer pointed to by the   <i>pstrProfileXml</i> parameter. No error is returned if the calling thread lacks the required permissions. 
     * 
     * <b>Windows 7:  </b>This flag passed on input is an extension to native wireless APIs added on Windows 7 and  later.  The <i>pdwFlags</i> parameter is an __inout_opt parameter on Windows 7 and  later.  
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WLAN_PROFILE_GROUP_POLICY"></a><a id="wlan_profile_group_policy"></a><dl>
     * <dt><b>WLAN_PROFILE_GROUP_POLICY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * On output when the <b>WlanGetProfile</b> call is successful, this flag indicates that this profile was created by group policy.  A group policy profile is read-only. Neither the content nor the preference order of the profile can be changed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WLAN_PROFILE_USER"></a><a id="wlan_profile_user"></a><dl>
     * <dt><b>WLAN_PROFILE_USER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * On output when the <b>WlanGetProfile</b> call is successful, this flag indicates that the profile is a user profile for the specific user in whose context the calling thread resides. If not set, this profile is an all-user profile.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} pdwGrantedAccess The access mask of the all-user profile.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>WLAN_READ_ACCESS</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user can view the contents of the profile.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>WLAN_EXECUTE_ACCESS</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user has read access, and the user can also connect to and disconnect from a network using the profile. If a user has WLAN_EXECUTE_ACCESS, then the user also has WLAN_READ_ACCESS. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>WLAN_WRITE_ACCESS</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user has execute access and the user can also modify the content of the  profile or delete the profile. If a user has WLAN_WRITE_ACCESS, then the user also has WLAN_EXECUTE_ACCESS and WLAN_READ_ACCESS.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value may be one of the following return codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have sufficient permissions.  This error is returned if the <i>pstrProfileXml</i> parameter specifies an all-user profile, but the caller does not have read access on the profile. 
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
     * A handle is invalid. This error is returned if the handle specified in the <i>hClientHandle</i>  parameter was not found in the handle table.
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
     * A parameter is incorrect. This error is returned if any of the following conditions occur:<ul>
     * <li><i>hClientHandle</i> is <b>NULL</b>.</li>
     * <li><i>pInterfaceGuid</i> is <b>NULL</b>.</li>
     * <li><i>pstrProfileXml</i>  is <b>NULL</b>.</li>
     * <li><i>pReserved</i> is not <b>NULL</b>.</li>
     * </ul>
     * 
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
     * Not enough storage is available to process this command. This error is returned if the system was unable to allocate memory for the profile.
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
     * The profile specified by <i>strProfileName</i> was not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Various RPC and other error codes. Use 
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wlanapi/nf-wlanapi-wlangetprofile
     * @since windows6.0.6000
     */
    static WlanGetProfile(hClientHandle, pInterfaceGuid, strProfileName, pstrProfileXml, pdwFlags, pdwGrantedAccess) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        hClientHandle := hClientHandle is Win32Handle ? NumGet(hClientHandle, "ptr") : hClientHandle
        strProfileName := strProfileName is String ? StrPtr(strProfileName) : strProfileName

        pstrProfileXmlMarshal := pstrProfileXml is VarRef ? "ptr*" : "ptr"
        pdwFlagsMarshal := pdwFlags is VarRef ? "uint*" : "ptr"
        pdwGrantedAccessMarshal := pdwGrantedAccess is VarRef ? "uint*" : "ptr"

        result := DllCall("wlanapi.dll\WlanGetProfile", "ptr", hClientHandle, "ptr", pInterfaceGuid, "ptr", strProfileName, "ptr", pReserved, pstrProfileXmlMarshal, pstrProfileXml, pdwFlagsMarshal, pdwFlags, pdwGrantedAccessMarshal, pdwGrantedAccess, "uint")
        return result
    }

    /**
     * Sets the Extensible Authentication Protocol (EAP) user credentials as specified by raw EAP data.
     * @param {HANDLE} hClientHandle The client's session handle, obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
     * @param {Pointer<Guid>} pInterfaceGuid The GUID of the interface.
     * @param {PWSTR} strProfileName The name of the profile associated with the EAP user data. Profile names are case-sensitive. This string must be NULL-terminated.
     * @param {EAP_METHOD_TYPE} eapType An <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_method_type">EAP_METHOD_TYPE</a> structure that contains the method for which the caller is supplying EAP user credentials.
     * @param {Integer} dwFlags A set of flags that modify the behavior of the function. 
     * 
     * On Windows Vista and Windows Server 2008, this parameter is reserved and should be set to zero.
     * @param {Integer} dwEapUserDataSize The size, in bytes, of the data pointed to by <i>pbEapUserData</i>.
     * @param {Pointer} pbEapUserData A pointer to the raw EAP data used to set the user credentials.
     * 
     * On Windows Vista and Windows Server 2008, this parameter must not be <b>NULL</b>. 
     * 
     * On Windows 7, Windows Server 2008 R2,  and later, this parameter can be set to <b>NULL</b> to delete the stored credentials for this profile if the <i>dwFlags</i> parameter contains <b>WLAN_SET_EAPHOST_DATA_ALL_USERS</b>  and the <i>dwEapUserDataSize</i> parameter is 0.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value may be one of the following return codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Access is denied. This value is returned if the caller does not have write access to the profile.
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
     * A parameter is incorrect. This value is returned if any of the following conditions occur:
     * 
     * <ul>
     * <li><i>hClientHandle</i> is <b>NULL</b>.</li>
     * <li><i>pInterfaceGuid</i> is <b>NULL</b>.</li>
     * <li><i>strProfileName</i> is <b>NULL</b></li>
     * <li><i>pvReserved</i> is not <b>NULL</b>.</li>
     * </ul>
     * 
     * 
     * On Windows Vista and Windows Server 2008, this value is returned if the <i>pbEapUserData</i> parameter is <b>NULL</b>. 
     * 
     * On Windows 7, Windows Server 2008 R2 ,  and later, this error is returned if the <i>pbEapUserData</i> parameter is <b>NULL</b>, but the <i>dwEapUserDataSize</i> parameter is not 0 or the <i>dwFlags</i> parameter does not contain <b>WLAN_SET_EAPHOST_DATA_ALL_USERS</b>.
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
     * A handle is invalid. This error is returned if the handle <i>hClientHandle</i>  was not found in the handle table.
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
     * Not enough storage is available to process this command.
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
     * This value is returned when profile settings do not permit storage of user data. This can occur when single signon (SSO) is enabled  or when the request was to delete the stored credentials for this profile (the <i>pbEapUserData</i> parameter was <b>NULL</b>, the  <i>dwFlags</i> parameter contains <b>WLAN_SET_EAPHOST_DATA_ALL_USERS</b>,   and the <i>dwEapUserDataSize</i> parameter is 0). 
     * 
     * On Windows 10, Windows Server 2016 ,  and later, this value is returned if the <a href="/windows/desktop/api/wlanapi/nf-wlanapi-wlansetprofileeapuserdata">WlanSetProfileEapUserData</a> function was called on a profile that uses a method other than 802.1X for authentication. 
     * 
     * This value is also returned if this function was called from a Windows XP with SP3 or Wireless LAN API for Windows XP with SP2 client.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SERVICE_NOT_ACTIVE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service has not been started. This value is returned if the Wireless LAN service is not running.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_STATUS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Various error codes.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wlanapi/nf-wlanapi-wlansetprofileeapuserdata
     * @since windows6.0.6000
     */
    static WlanSetProfileEapUserData(hClientHandle, pInterfaceGuid, strProfileName, eapType, dwFlags, dwEapUserDataSize, pbEapUserData) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        hClientHandle := hClientHandle is Win32Handle ? NumGet(hClientHandle, "ptr") : hClientHandle
        strProfileName := strProfileName is String ? StrPtr(strProfileName) : strProfileName

        result := DllCall("wlanapi.dll\WlanSetProfileEapUserData", "ptr", hClientHandle, "ptr", pInterfaceGuid, "ptr", strProfileName, "ptr", eapType, "uint", dwFlags, "uint", dwEapUserDataSize, "ptr", pbEapUserData, "ptr", pReserved, "uint")
        return result
    }

    /**
     * Sets the Extensible Authentication Protocol (EAP) user credentials as specified by an XML string.
     * @param {HANDLE} hClientHandle The client's session handle, obtained by a previous call to the <a href="https://docs.microsoft.com/windows/win32/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
     * @param {Pointer<Guid>} pInterfaceGuid The GUID of the interface.
     * @param {PWSTR} strProfileName The name of the profile associated with the EAP user data. Profile names are case-sensitive. This string must be NULL-terminated.
     * 
     * <b>Windows XP with SP3 and Wireless LAN API for Windows XP with SP2:  </b>The supplied name must match the profile name derived automatically from the SSID of the network. For an infrastructure network profile, the SSID must be supplied for the profile name. For an ad hoc network profile, the supplied name must be the SSID of the ad hoc network followed by <c>-adhoc</c>.
     * @param {Integer} dwFlags A set of flags that modify the behavior of the function. 
     * 
     * On Wireless LAN API for Windows XP with SP2, Windows XP with SP3,Windows Vista, and Windows Server 2008, this parameter is reserved and should be set to zero.
     * @param {PWSTR} strEapXmlUserData A pointer to XML data used to set the user credentials. 
     * 
     * The XML data must be based on the <a href="https://docs.microsoft.com/windows/win32/eaphost/eaphostusercredentialsschema-schema">EAPHost User Credentials schema</a>. To view sample user credential XML data, see EAPHost <a href="https://docs.microsoft.com/windows/win32/eaphost/user-profiles">User Properties</a>.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value may be one of the following return codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Access is denied. This value is returned if the caller does not have write access to the profile.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_PROFILE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network connection profile is corrupted. This error is returned if the profile specified in the <i>strProfileName</i> parameter could not be parsed.
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
     * A parameter is incorrect. This value is returned if any of the following conditions occur:<ul>
     * <li><i>hClientHandle</i> is <b>NULL</b>.</li>
     * <li><i>pInterfaceGuid</i> is <b>NULL</b>.</li>
     * <li><i>strProfileName</i> is <b>NULL</b>.</li>
     * <li><i>strEapXmlUserData</i> is <b>NULL</b>.</li>
     * <li><i>pReserved</i> is not <b>NULL</b>.</li>
     * </ul>
     * 
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
     * A handle is invalid. This error is returned if the handle <i>hClientHandle</i>  was not found in the handle table.
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
     * Not enough storage is available to process this command.
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
     * This value is returned when profile settings do not permit storage of user data. This can occur when single signon (SSO) is enabled. 
     * 
     * On Windows 7, Windows Server 2008 R2 ,  and later, this value is returned if the <a href="/windows/win32/api/wlanapi/nf-wlanapi-wlansetprofileeapxmluserdata">WlanSetProfileEapXmlUserData</a> function was called on a profile that uses a method other than 802.1X for authentication. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SERVICE_NOT_ACTIVE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service has not been started. This value is returned if the Wireless LAN service is not running.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_STATUS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Various error codes.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wlanapi/nf-wlanapi-wlansetprofileeapxmluserdata
     * @since windows6.0.6000
     */
    static WlanSetProfileEapXmlUserData(hClientHandle, pInterfaceGuid, strProfileName, dwFlags, strEapXmlUserData) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        hClientHandle := hClientHandle is Win32Handle ? NumGet(hClientHandle, "ptr") : hClientHandle
        strProfileName := strProfileName is String ? StrPtr(strProfileName) : strProfileName
        strEapXmlUserData := strEapXmlUserData is String ? StrPtr(strEapXmlUserData) : strEapXmlUserData

        result := DllCall("wlanapi.dll\WlanSetProfileEapXmlUserData", "ptr", hClientHandle, "ptr", pInterfaceGuid, "ptr", strProfileName, "uint", dwFlags, "ptr", strEapXmlUserData, "ptr", pReserved, "uint")
        return result
    }

    /**
     * Sets the content of a specific profile.
     * @param {HANDLE} hClientHandle The client's session handle, obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
     * @param {Pointer<Guid>} pInterfaceGuid The GUID of the interface.
     * @param {Integer} dwFlags The flags to set on the profile.
     * 
     * <b>Windows XP with SP3 and Wireless LAN API for Windows XP with SP2:  </b><i>dwFlags</i> must be 0. Per-user profiles are not supported.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id=""></a><dl>
     * <dt><b></b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The profile is an all-user profile.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WLAN_PROFILE_GROUP_POLICY"></a><a id="wlan_profile_group_policy"></a><dl>
     * <dt><b>WLAN_PROFILE_GROUP_POLICY</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The profile is a group policy profile.  
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WLAN_PROFILE_USER"></a><a id="wlan_profile_user"></a><dl>
     * <dt><b>WLAN_PROFILE_USER</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The profile is a per-user profile.  
     * 
     * </td>
     * </tr>
     * </table>
     * @param {PWSTR} strProfileXml Contains the XML representation of the profile. The <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/wlan-profileschema-wlanprofile-element">WLANProfile</a> element is the root profile element. To view sample profiles, see <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/wireless-profile-samples">Wireless Profile Samples</a>. There is no predefined maximum string length.
     * 
     * <b>Windows XP with SP3 and Wireless LAN API for Windows XP with SP2:  </b>The supplied profile must meet the compatibility criteria described in <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/wireless-profile-compatibility">Wireless Profile Compatibility</a>.
     * @param {PWSTR} strAllUserProfileSecurity Sets the security descriptor string on the all-user profile.  For more information about profile permissions, see the Remarks section.
     * 
     * If <i>dwFlags</i> is set to WLAN_PROFILE_USER, this parameter is ignored.
     * 
     * If this parameter is set to <b>NULL</b> for a new all-user profile, the security descriptor associated with the  wlan_secure_add_new_all_user_profiles object is used. If the security descriptor has not been modified by a <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlansetsecuritysettings">WlanSetSecuritySettings</a> call,  all users have default permissions on a new all-user profile. Call <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlangetsecuritysettings">WlanGetSecuritySettings</a> to get the default permissions associated with the   wlan_secure_add_new_all_user_profiles object.
     * 
     * If this parameter is set to <b>NULL</b> for an existing all-user profile, the permissions of the profile are not changed.
     * 
     * If this parameter is not <b>NULL</b> for an all-user profile, the security descriptor string associated with the profile is created or modified  after the security descriptor object is created and parsed as a string.
     * 
     * <b>Windows XP with SP3 and Wireless LAN API for Windows XP with SP2:  </b>This parameter must be <b>NULL</b>.
     * @param {BOOL} bOverwrite Specifies whether this profile is overwriting an existing profile.  If this parameter is <b>FALSE</b> and the profile already exists, the existing profile will not be overwritten and an error will be returned.
     * @param {Pointer<Integer>} pdwReasonCode A <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/wlan-reason-code">WLAN_REASON_CODE</a> value that indicates why the profile is not valid.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value may be one of the following return codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have sufficient permissions to set the profile.  
     * 
     * When called with <i>dwFlags</i> set to 0 - that is, when setting an all-user profile -  <a href="/windows/desktop/api/wlanapi/nf-wlanapi-wlansetprofile">WlanSetProfile</a>  retrieves the discretionary access control list (DACL) stored with the  <b>wlan_secure_add_new_all_user_profiles</b> object. When called with <i>dwFlags</i> set to <b>WLAN_PROFILE_USER</b> - that is, when setting a per-user profile -  <b>WlanSetProfile</b>  retrieves the discretionary access control list (DACL) stored with the  <b>wlan_secure_add_new_per_user_profiles</b> object. In either case, if the DACL does not contain an access control entry (ACE) that grants WLAN_WRITE_ACCESS permission to the access token of the calling thread, then <b>WlanSetProfile</b> returns <b>ERROR_ACCESS_DENIED</b>.
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
     * <i>strProfileXml</i> specifies a network that already exists. Typically, this return value is used when <i>bOverwrite</i> is <b>FALSE</b>; however, if <i>bOverwrite</i> is <b>TRUE</b> and <i>dwFlags</i> specifies a different profile type than the one used by the existing profile,   then the existing profile will not be overwritten and <b>ERROR_ALREADY_EXISTS</b> will be returned.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_PROFILE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The profile specified by <i>strProfileXml</i> is not valid. If this value is returned, <i>pdwReasonCode</i> specifies the reason the profile is invalid.
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
     * One of the following conditions occurred:
     * 
     * <ul>
     * <li><i>hClientHandle</i> is <b>NULL</b> or invalid.</li>
     * <li><i>pInterfaceGuid</i> is <b>NULL</b>.</li>
     * <li><i>pReserved</i> is not <b>NULL</b>.</li>
     * <li><i>strProfileXml</i> is <b>NULL</b>.</li>
     * [ConfigBlob](/windows/desktop/eaphost/eaphostconfigschema-configblob-eaphostconfig-element). If the profile must have an empty <b>ConfigBlob</b>, use <code>&lt;ConfigBlob&gt;00&lt;/ConfigBlob&gt;</code> in the profile.</li>
     * <li><i>pdwReasonCode</i> is <b>NULL</b>.</li>
     * <li><i>dwFlags</i> is not set to one of the specified values.</li>
     * <li><i>dwFlags</i> is set to WLAN_PROFILE_GROUP_POLICY and <i>bOverwrite</i> is set to <b>FALSE</b>.</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_MATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The interface does not support one or more of the capabilities specified in the profile. For example, if a profile specifies the use of WPA2 when the NIC only supports WPA, then this error code is returned. Also, if a profile specifies the use of FIPS mode when the NIC does not support FIPS mode, then this error code is returned.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_STATUS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Various error codes.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wlanapi/nf-wlanapi-wlansetprofile
     * @since windows6.0.6000
     */
    static WlanSetProfile(hClientHandle, pInterfaceGuid, dwFlags, strProfileXml, strAllUserProfileSecurity, bOverwrite, pdwReasonCode) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        hClientHandle := hClientHandle is Win32Handle ? NumGet(hClientHandle, "ptr") : hClientHandle
        strProfileXml := strProfileXml is String ? StrPtr(strProfileXml) : strProfileXml
        strAllUserProfileSecurity := strAllUserProfileSecurity is String ? StrPtr(strAllUserProfileSecurity) : strAllUserProfileSecurity

        pdwReasonCodeMarshal := pdwReasonCode is VarRef ? "uint*" : "ptr"

        result := DllCall("wlanapi.dll\WlanSetProfile", "ptr", hClientHandle, "ptr", pInterfaceGuid, "uint", dwFlags, "ptr", strProfileXml, "ptr", strAllUserProfileSecurity, "int", bOverwrite, "ptr", pReserved, pdwReasonCodeMarshal, pdwReasonCode, "uint")
        return result
    }

    /**
     * Deletes a wireless profile for a wireless interface on the local computer.
     * @param {HANDLE} hClientHandle The client's session handle, obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
     * @param {Pointer<Guid>} pInterfaceGuid The GUID of the interface from which to delete the profile.
     * @param {PWSTR} strProfileName The name of the profile to be deleted. Profile names are case-sensitive. This string must be NULL-terminated.
     * 
     * <b>Windows XP with SP3 and Wireless LAN API for Windows XP with SP2:  </b>The supplied name must match the profile name derived automatically from the SSID of the network. For an infrastructure network profile, the SSID must be supplied for the profile name. For an ad hoc network profile, the supplied name must be the SSID of the ad hoc network followed by <c>-adhoc</c>.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value may be one of the following return codes.
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
     * The <i>hClientHandle</i> parameter is <b>NULL</b> or  not valid,  the <i>pInterfaceGuid</i> parameter is <b>NULL</b>, the <i>strProfileName</i> parameter is <b>NULL</b>, or <i>pReserved</i> is not <b>NULL</b>.
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
     * The handle specified in the <i>hClientHandle</i>  parameter was not found in the handle table.
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
     * The wireless profile specified by <i>strProfileName</i> was not found in the profile store.
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
     * The caller does not have sufficient permissions to delete the profile. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_STATUS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Various error codes.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wlanapi/nf-wlanapi-wlandeleteprofile
     * @since windows6.0.6000
     */
    static WlanDeleteProfile(hClientHandle, pInterfaceGuid, strProfileName) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        hClientHandle := hClientHandle is Win32Handle ? NumGet(hClientHandle, "ptr") : hClientHandle
        strProfileName := strProfileName is String ? StrPtr(strProfileName) : strProfileName

        result := DllCall("wlanapi.dll\WlanDeleteProfile", "ptr", hClientHandle, "ptr", pInterfaceGuid, "ptr", strProfileName, "ptr", pReserved, "uint")
        return result
    }

    /**
     * Renames the specified profile.
     * @param {HANDLE} hClientHandle The client's session handle, obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
     * @param {Pointer<Guid>} pInterfaceGuid The GUID of the interface.
     * @param {PWSTR} strOldProfileName The profile name to be changed.
     * @param {PWSTR} strNewProfileName The new name of the profile.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value may be one of the following return codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>hClientHandle</i> is <b>NULL</b> or not valid,  <i>pInterfaceGuid</i> is <b>NULL</b>, <i>strOldProfileName</i> is <b>NULL</b>, <i>strNewProfileName</i> is <b>NULL</b>, or <i>pReserved</i> is not <b>NULL</b>.
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
     * The handle <i>hClientHandle</i>  was not found in the handle table.
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
     * The profile specified by <i>strOldProfileName</i> was not found in the profile store.
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
     * The caller does not have sufficient permissions to rename the profile. 
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
     * This function was called from an unsupported platform. This value will be returned if this function was called from a Windows XP with SP3 or Wireless LAN API for Windows XP with SP2 client.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_STATUS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Various error codes.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wlanapi/nf-wlanapi-wlanrenameprofile
     * @since windows6.0.6000
     */
    static WlanRenameProfile(hClientHandle, pInterfaceGuid, strOldProfileName, strNewProfileName) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        hClientHandle := hClientHandle is Win32Handle ? NumGet(hClientHandle, "ptr") : hClientHandle
        strOldProfileName := strOldProfileName is String ? StrPtr(strOldProfileName) : strOldProfileName
        strNewProfileName := strNewProfileName is String ? StrPtr(strNewProfileName) : strNewProfileName

        result := DllCall("wlanapi.dll\WlanRenameProfile", "ptr", hClientHandle, "ptr", pInterfaceGuid, "ptr", strOldProfileName, "ptr", strNewProfileName, "ptr", pReserved, "uint")
        return result
    }

    /**
     * Retrieves the list of profiles.
     * @param {HANDLE} hClientHandle The client's session handle, obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
     * @param {Pointer<Guid>} pInterfaceGuid The GUID of the wireless interface. 
     * 
     * A list of the GUIDs for wireless interfaces on the local computer can be retrieved using the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanenuminterfaces">WlanEnumInterfaces</a> function.
     * @param {Pointer<Pointer<WLAN_PROFILE_INFO_LIST>>} ppProfileList A <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_profile_info_list">PWLAN_PROFILE_INFO_LIST</a> structure that contains the list of profile information.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value may be one of the following return codes.
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
     * The handle <i>hClientHandle</i>  was not found in the handle table.
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
     * A parameter is incorrect. This error is returned if any of the following conditions occur:<ul>
     * <li><i>hClientHandle</i> is <b>NULL</b>.</li>
     * <li><i>pInterfaceGuid</i> is <b>NULL</b>.</li>
     * <li><i>ppProfileList</i>  is <b>NULL</b>.</li>
     * <li><i>pReserved</i> is not <b>NULL</b>.</li>
     * </ul>
     * 
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
     * Not enough memory is available to process this request and allocate memory for the query results.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_STATUS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Various error codes.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wlanapi/nf-wlanapi-wlangetprofilelist
     * @since windows6.0.6000
     */
    static WlanGetProfileList(hClientHandle, pInterfaceGuid, ppProfileList) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        hClientHandle := hClientHandle is Win32Handle ? NumGet(hClientHandle, "ptr") : hClientHandle

        ppProfileListMarshal := ppProfileList is VarRef ? "ptr*" : "ptr"

        result := DllCall("wlanapi.dll\WlanGetProfileList", "ptr", hClientHandle, "ptr", pInterfaceGuid, "ptr", pReserved, ppProfileListMarshal, ppProfileList, "uint")
        return result
    }

    /**
     * Sets the preference order of profiles.
     * @param {HANDLE} hClientHandle The client's session handle, obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
     * @param {Pointer<Guid>} pInterfaceGuid The GUID of the interface.
     * @param {Integer} dwItems The number of profiles in the <i>strProfileNames</i> parameter.
     * @param {Pointer<PWSTR>} strProfileNames The names of the profiles in the desired order. Profile names are case-sensitive. This string must be NULL-terminated.
     * 
     * <b>Windows XP with SP3 and Wireless LAN API for Windows XP with SP2:  </b>The supplied names must match the profile names derived automatically from the SSID of the network. For infrastructure network profiles, the SSID must be supplied for the profile name. For ad hoc network profiles, the supplied name must be the SSID of the ad hoc network followed by <c>-adhoc</c>.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value may be one of the following return codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have sufficient permissions to change the profile list.  
     * 
     * Before <a href="/windows/desktop/api/wlanapi/nf-wlanapi-wlansetprofilelist">WlanSetProfileList</a> performs an operation that changes the relative order of all-user profiles in the profile list  or moves an all-user profile to a lower position in the profile list,  <b>WlanSetProfileList</b> retrieves the discretionary access control list (DACL) stored with the  <b>wlan_secure_all_user_profiles_order</b> object. If the DACL does not contain an access control entry (ACE) that grants WLAN_WRITE_ACCESS permission to the access token of the calling thread, then <b>WlanSetProfileList</b> returns <b>ERROR_ACCESS_DENIED</b>.
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
     * The handle <i>hClientHandle</i>  was not found in the handle table.
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
     * One of the following conditions occurred:
     * 
     * <ul>
     * <li><i>hClientHandle</i> is <b>NULL</b> or invalid.</li>
     * <li><i>pInterfaceGuid</i> is <b>NULL</b>.</li>
     * <li><i>dwItems</i> is 0.</li>
     * <li><i>strProfileNames</i> is <b>NULL</b>.</li>
     * <li>The same profile name appears more than once in <i>strProfileNames</i>.</li>
     * <li><i>pReserved</i> is not <b>NULL</b>.</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>strProfileNames</i> contains the name of a profile that is not present in the profile store.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_STATUS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Various error codes.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wlanapi/nf-wlanapi-wlansetprofilelist
     * @since windows6.0.6000
     */
    static WlanSetProfileList(hClientHandle, pInterfaceGuid, dwItems, strProfileNames) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        hClientHandle := hClientHandle is Win32Handle ? NumGet(hClientHandle, "ptr") : hClientHandle

        strProfileNamesMarshal := strProfileNames is VarRef ? "ptr*" : "ptr"

        result := DllCall("wlanapi.dll\WlanSetProfileList", "ptr", hClientHandle, "ptr", pInterfaceGuid, "uint", dwItems, strProfileNamesMarshal, strProfileNames, "ptr", pReserved, "uint")
        return result
    }

    /**
     * Sets the position of a single, specified profile in the preference list.
     * @param {HANDLE} hClientHandle The client's session handle, obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
     * @param {Pointer<Guid>} pInterfaceGuid The GUID of the interface.
     * @param {PWSTR} strProfileName The name of the profile. Profile names are case-sensitive. This string must be NULL-terminated.
     * 
     * <b>Windows XP with SP3 and Wireless LAN API for Windows XP with SP2:  </b>The supplied name must match the profile name derived automatically from the SSID of the network. For an infrastructure network profile, the SSID must be supplied for the profile name. For an ad hoc network profile, the supplied name must be the SSID of the ad hoc network followed by <c>-adhoc</c>.
     * @param {Integer} dwPosition Indicates the position in the preference list that the profile should be shifted to.  0 (zero) corresponds to the first profile in the list that is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlangetprofilelist">WlanGetProfileList</a> function.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value may be one of the following return codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have sufficient permissions to change the profile position.  
     * 
     * Before <a href="/windows/desktop/api/wlanapi/nf-wlanapi-wlansetprofileposition">WlanSetProfilePosition</a> performs an operation that changes the relative order of all-user profiles in the profile list  or moves an all-user profile to a lower position in the profile list,  <b>WlanSetProfilePosition</b>  retrieves the discretionary access control list (DACL) stored with the  <b>wlan_secure_all_user_profiles_order</b> object. If the DACL does not contain an access control entry (ACE) that grants WLAN_WRITE_ACCESS permission to the access token of the calling thread, then <b>WlanSetProfilePosition</b>  returns <b>ERROR_ACCESS_DENIED</b>.
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
     * <i>hClientHandle</i> is <b>NULL</b> or invalid,  <i>pInterfaceGuid</i> is <b>NULL</b>, <i>strProfileName</i> is <b>NULL</b>, or <i>pReserved</i> is not <b>NULL</b>.
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
     * The handle <i>hClientHandle</i>  was not found in the handle table.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_STATUS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Various error codes.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wlanapi/nf-wlanapi-wlansetprofileposition
     * @since windows6.0.6000
     */
    static WlanSetProfilePosition(hClientHandle, pInterfaceGuid, strProfileName, dwPosition) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        hClientHandle := hClientHandle is Win32Handle ? NumGet(hClientHandle, "ptr") : hClientHandle
        strProfileName := strProfileName is String ? StrPtr(strProfileName) : strProfileName

        result := DllCall("wlanapi.dll\WlanSetProfilePosition", "ptr", hClientHandle, "ptr", pInterfaceGuid, "ptr", strProfileName, "uint", dwPosition, "ptr", pReserved, "uint")
        return result
    }

    /**
     * Sets the custom user data associated with a profile.
     * @param {HANDLE} hClientHandle The client's session handle, obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
     * @param {Pointer<Guid>} pInterfaceGuid The GUID of the interface.
     * @param {PWSTR} strProfileName The name of the profile associated with the custom user data. Profile names are case-sensitive. This string must be NULL-terminated.
     * @param {Integer} dwDataSize The size of <i>pData</i>, in bytes.
     * @param {Pointer} pData A pointer to the user data to be set.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value may be one of the following return codes.
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
     * One of the following conditions occurred:
     * 
     * <ul>
     * <li><i>hClientHandle</i> is <b>NULL</b> or invalid.</li>
     * <li><i>pInterfaceGuid</i> is <b>NULL</b>.</li>
     * <li><i>strProfileName</i> is <b>NULL</b>.</li>
     * <li><i>pReserved</i> is not <b>NULL</b>.</li>
     * <li><i>dwDataSize</i> is not 0 and <i>pData</i> is <b>NULL</b>.</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle <i>hClientHandle</i>  was not found in the handle table.
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
     * This function was called from an unsupported platform. This value will be returned if this function was called from a Windows XP with SP3 or Wireless LAN API for Windows XP with SP2 client.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_STATUS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Various error codes.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wlanapi/nf-wlanapi-wlansetprofilecustomuserdata
     * @since windows6.0.6000
     */
    static WlanSetProfileCustomUserData(hClientHandle, pInterfaceGuid, strProfileName, dwDataSize, pData) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        hClientHandle := hClientHandle is Win32Handle ? NumGet(hClientHandle, "ptr") : hClientHandle
        strProfileName := strProfileName is String ? StrPtr(strProfileName) : strProfileName

        result := DllCall("wlanapi.dll\WlanSetProfileCustomUserData", "ptr", hClientHandle, "ptr", pInterfaceGuid, "ptr", strProfileName, "uint", dwDataSize, "ptr", pData, "ptr", pReserved, "uint")
        return result
    }

    /**
     * Gets the custom user data associated with a wireless profile.
     * @param {HANDLE} hClientHandle The client's session handle, obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
     * @param {Pointer<Guid>} pInterfaceGuid A pointer to the GUID of the wireless LAN interface.
     * @param {PWSTR} strProfileName The name of the profile with which the custom user data is associated. Profile names are case-sensitive. This string must be NULL-terminated.
     * @param {Pointer<Integer>} pdwDataSize The size, in bytes,  of the user data buffer pointed to by the <i>ppData</i>parameter.
     * @param {Pointer<Pointer<Integer>>} ppData A pointer to the user data.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value may be one of the following return codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system cannot find the file specified. This error is returned if no user custom data exists for the profile specified.
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
     * The <i>hClientHandle</i> parameter is <b>NULL</b> or  not valid, the <i>pInterfaceGuid</i> parameter is <b>NULL</b>, the <i>strProfileName</i> parameter is <b>NULL</b>, the <i>pReserved</i> parameter is not <b>NULL</b>, the <i>pdwDataSize</i> parameter is 0, or the <i>ppData</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system cannot find the file specified. This error is returned if no custom user data exists for the profile specified.
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
     * The handle <i>hClientHandle</i>  was not found in the handle table.
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
     * This function was called from an unsupported platform. This value will be returned if this function was called from a Windows XP with SP3 or Wireless LAN API for Windows XP with SP2 client.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_STATUS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Various error codes.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wlanapi/nf-wlanapi-wlangetprofilecustomuserdata
     * @since windows6.0.6000
     */
    static WlanGetProfileCustomUserData(hClientHandle, pInterfaceGuid, strProfileName, pdwDataSize, ppData) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        hClientHandle := hClientHandle is Win32Handle ? NumGet(hClientHandle, "ptr") : hClientHandle
        strProfileName := strProfileName is String ? StrPtr(strProfileName) : strProfileName

        pdwDataSizeMarshal := pdwDataSize is VarRef ? "uint*" : "ptr"
        ppDataMarshal := ppData is VarRef ? "ptr*" : "ptr"

        result := DllCall("wlanapi.dll\WlanGetProfileCustomUserData", "ptr", hClientHandle, "ptr", pInterfaceGuid, "ptr", strProfileName, "ptr", pReserved, pdwDataSizeMarshal, pdwDataSize, ppDataMarshal, ppData, "uint")
        return result
    }

    /**
     * Sets the permit/deny list.
     * @param {HANDLE} hClientHandle The client's session handle, obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
     * @param {Integer} wlanFilterListType A <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ne-wlanapi-wlan_filter_list_type">WLAN_FILTER_LIST_TYPE</a> value that specifies the type of filter list.  The value must be either <b>wlan_filter_list_type_user_permit</b> or <b>wlan_filter_list_type_user_deny</b>.  Group policy-defined lists cannot be set using this function.
     * @param {Pointer<DOT11_NETWORK_LIST>} pNetworkList Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-dot11_network_list">DOT11_NETWORK_LIST</a> structure that contains the list of networks to permit or deny. The <b>dwIndex</b> member of the structure must have a value less than the value of the <b>dwNumberOfItems</b> member of the structure; otherwise, an access violation may occur.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value may be one of the following return codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have sufficient permissions to set the filter list. 
     * 
     * When called with <i>wlanFilterListType</i> set to <b>wlan_filter_list_type_user_permit</b>, <a href="/windows/desktop/api/wlanapi/nf-wlanapi-wlansetfilterlist">WlanSetFilterList</a> retrieves the discretionary access control list (DACL) stored with the  <b>wlan_secure_permit_list</b> object. When called with <i>wlanFilterListType</i>  set to <b>wlan_filter_list_type_user_deny</b>, <b>WlanSetFilterList</b> retrieves the DACL stored with the  <b>wlan_secure_deny_list</b> object. In either of these cases, if the DACL does not contain an access control entry (ACE) that grants WLAN_WRITE_ACCESS permission to the access token of the calling thread, then <b>WlanSetFilterList</b>  returns <b>ERROR_ACCESS_DENIED</b>.
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
     * <i>hClientHandle</i> is <b>NULL</b> or invalid or <i>pReserved</i> is not <b>NULL</b>.
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
     * The handle <i>hClientHandle</i>  was not found in the handle table.
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
     * This function was called from an unsupported platform. This value will be returned if this function was called from a Windows XP with SP3 or Wireless LAN API for Windows XP with SP2 client.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_STATUS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Various error codes.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wlanapi/nf-wlanapi-wlansetfilterlist
     * @since windows6.0.6000
     */
    static WlanSetFilterList(hClientHandle, wlanFilterListType, pNetworkList) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        hClientHandle := hClientHandle is Win32Handle ? NumGet(hClientHandle, "ptr") : hClientHandle

        result := DllCall("wlanapi.dll\WlanSetFilterList", "ptr", hClientHandle, "int", wlanFilterListType, "ptr", pNetworkList, "ptr", pReserved, "uint")
        return result
    }

    /**
     * Retrieves a group policy or user permission list.
     * @param {HANDLE} hClientHandle The client's session handle, obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
     * @param {Integer} wlanFilterListType A <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ne-wlanapi-wlan_filter_list_type">WLAN_FILTER_LIST_TYPE</a> value that specifies the type of filter list.  All user defined and group policy filter lists can be queried.
     * @param {Pointer<Pointer<DOT11_NETWORK_LIST>>} ppNetworkList Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-dot11_network_list">DOT11_NETWORK_LIST</a> structure that contains the list of permitted or denied networks.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value may be one of the following return codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have sufficient permissions to get the filter list. 
     * 
     * When called with <i>wlanFilterListType</i> set to <b>wlan_filter_list_type_user_permit</b>, <a href="/windows/desktop/api/wlanapi/nf-wlanapi-wlangetfilterlist">WlanGetFilterList</a> retrieves the discretionary access control list (DACL) stored with the  <b>wlan_secure_permit_list</b> object. When called with <i>wlanFilterListType</i> set to <b>wlan_filter_list_type_user_deny</b>, <b>WlanGetFilterList</b> retrieves the DACL stored with the  <b>wlan_secure_deny_list</b> object. In either of these cases, if the DACL does not contain an access control entry (ACE) that grants WLAN_READ_ACCESS permission to the access token of the calling thread, then <b>WlanGetFilterList</b>  returns <b>ERROR_ACCESS_DENIED</b>.
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
     * <i>hClientHandle</i> is <b>NULL</b> or invalid, <i>ppNetworkList</i> is <b>NULL</b>, or <i>pReserved</i> is not <b>NULL</b>.
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
     * The handle <i>hClientHandle</i>  was not found in the handle table.
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
     * This function was called from an unsupported platform. This value will be returned if this function was called from a Windows XP with SP3 or Wireless LAN API for Windows XP with SP2 client.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_STATUS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Various error codes.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wlanapi/nf-wlanapi-wlangetfilterlist
     * @since windows6.0.6000
     */
    static WlanGetFilterList(hClientHandle, wlanFilterListType, ppNetworkList) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        hClientHandle := hClientHandle is Win32Handle ? NumGet(hClientHandle, "ptr") : hClientHandle

        ppNetworkListMarshal := ppNetworkList is VarRef ? "ptr*" : "ptr"

        result := DllCall("wlanapi.dll\WlanGetFilterList", "ptr", hClientHandle, "int", wlanFilterListType, "ptr", pReserved, ppNetworkListMarshal, ppNetworkList, "uint")
        return result
    }

    /**
     * Sets the proximity service discovery (PSD) information element (IE) data list.
     * @param {HANDLE} hClientHandle The client's session handle, obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
     * @param {PWSTR} strFormat The format of a PSD IE in the PSD IE data list passed in the <i>pPsdIEDataList</i> parameter. This is a NULL-terminated URI string that specifies the namespace of the protocol used for discovery.
     * @param {Pointer<WLAN_RAW_DATA_LIST>} pPsdIEDataList A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_raw_data_list">WLAN_RAW_DATA_LIST</a> structure that contains the PSD IE data list to be set.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value may be one of the following return codes.
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
     * A  parameter is incorrect. This error is returned if the <i>hClientHandle</i> is <b>NULL</b> or not valid or <i>pReserved</i> is not <b>NULL</b>.
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
     * The handle <i>hClientHandle</i>  was not found in the handle table.
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
     * This function was called from an unsupported platform. This value is returned if the function was called from a Windows XP with SP3 or Wireless LAN API for Windows XP with SP2 client.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_STATUS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Various error codes.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wlanapi/nf-wlanapi-wlansetpsdiedatalist
     * @since windows6.0.6000
     */
    static WlanSetPsdIEDataList(hClientHandle, strFormat, pPsdIEDataList) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        hClientHandle := hClientHandle is Win32Handle ? NumGet(hClientHandle, "ptr") : hClientHandle
        strFormat := strFormat is String ? StrPtr(strFormat) : strFormat

        result := DllCall("wlanapi.dll\WlanSetPsdIEDataList", "ptr", hClientHandle, "ptr", strFormat, "ptr", pPsdIEDataList, "ptr", pReserved, "uint")
        return result
    }

    /**
     * Saves a temporary profile to the profile store.
     * @param {HANDLE} hClientHandle The client's session handle, obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
     * @param {Pointer<Guid>} pInterfaceGuid The GUID of the interface.
     * @param {PWSTR} strProfileName The name of the profile to be saved. Profile names are case-sensitive. This string must be NULL-terminated.
     * @param {PWSTR} strAllUserProfileSecurity Sets the security descriptor string on the all-user profile.  By default, for a new all-user profile, all users have write access on the profile. For more information about profile permissions, see the Remarks section.
     * 
     * If <i>dwFlags</i> is set to WLAN_PROFILE_USER, this parameter is ignored.
     * 
     * If this parameter is set to <b>NULL</b> for an all-user profile, the default permissions are used.
     * 
     * If this parameter is not <b>NULL</b> for an all-user profile, the security descriptor string associated with the profile is created or modified  after the security descriptor object is created and parsed as a string.
     * @param {Integer} dwFlags Specifies the flags to set on the profile. The flags can be combined.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id=""></a><dl>
     * <dt><b></b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The profile is an all-user profile.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WLAN_PROFILE_USER"></a><a id="wlan_profile_user"></a><dl>
     * <dt><b>WLAN_PROFILE_USER</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The profile is a per-user profile.  
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WLAN_PROFILE_CONNECTION_MODE_SET_BY_CLIENT"></a><a id="wlan_profile_connection_mode_set_by_client"></a><dl>
     * <dt><b>WLAN_PROFILE_CONNECTION_MODE_SET_BY_CLIENT</b></dt>
     * <dt>0x00010000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The profile was created by the client.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WLAN_PROFILE_CONNECTION_MODE_AUTO"></a><a id="wlan_profile_connection_mode_auto"></a><dl>
     * <dt><b>WLAN_PROFILE_CONNECTION_MODE_AUTO</b></dt>
     * <dt>0x00020000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The profile was created by the automatic configuration module.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {BOOL} bOverWrite Specifies whether this profile is overwriting an existing profile.  If this parameter is <b>FALSE</b> and the profile already exists, the existing profile will not be overwritten and an error will be returned.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value may be one of the following return codes.
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
     * One of the following conditions occurred:
     * 
     * <ul>
     * <li><i>hClientHandle</i> is <b>NULL</b> or invalid.</li>
     * <li><i>pInterfaceGuid</i> is <b>NULL</b>.</li>
     * <li><i>pReserved</i> is not <b>NULL</b>.</li>
     * <li><i>dwFlags</i> is not set to a combination of one or more  of the values specified in the table above.</li>
     * <li><i>dwFlags</i> is set to WLAN_PROFILE_CONNECTION_MODE_AUTO and <i>strProfileName</i> is <b>NULL</b>.</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle <i>hClientHandle</i>  was not found in the handle table.
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
     * This function was called from an unsupported platform. This value will be returned if this function was called from a Windows XP with SP3 or Wireless LAN API for Windows XP with SP2 client.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_STATUS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Various error codes.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The interface is not currently connected using a temporary profile.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wlanapi/nf-wlanapi-wlansavetemporaryprofile
     * @since windows6.0.6000
     */
    static WlanSaveTemporaryProfile(hClientHandle, pInterfaceGuid, strProfileName, strAllUserProfileSecurity, dwFlags, bOverWrite) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        hClientHandle := hClientHandle is Win32Handle ? NumGet(hClientHandle, "ptr") : hClientHandle
        strProfileName := strProfileName is String ? StrPtr(strProfileName) : strProfileName
        strAllUserProfileSecurity := strAllUserProfileSecurity is String ? StrPtr(strAllUserProfileSecurity) : strAllUserProfileSecurity

        result := DllCall("wlanapi.dll\WlanSaveTemporaryProfile", "ptr", hClientHandle, "ptr", pInterfaceGuid, "ptr", strProfileName, "ptr", strAllUserProfileSecurity, "uint", dwFlags, "int", bOverWrite, "ptr", pReserved, "uint")
        return result
    }

    /**
     * Allows an OEM or IHV component to communicate with a device service on a particular wireless LAN interface.
     * @param {HANDLE} hClientHandle Type: **[HANDLE](/windows/win32/winprog/windows-data-types)**
     * 
     * The client's session handle, obtained by a previous call to the [WlanOpenHandle](./nf-wlanapi-wlanopenhandle.md) function.
     * @param {Pointer<Guid>} pInterfaceGuid Type: **CONST [GUID](../guiddef/ns-guiddef-guid.md)\***
     * 
     * A pointer to the **GUID** of the wireless LAN interface to be queried. You can determine the **GUID** of each wireless LAN interface enabled on a local computer by using the [WlanEnumInterfaces](./nf-wlanapi-wlanenuminterfaces.md) function.
     * @param {Pointer<Guid>} pDeviceServiceGuid Type: **[GUID](../guiddef/ns-guiddef-guid.md)\***
     * 
     * The **GUID** identifying the device service for this command.
     * @param {Integer} dwOpCode Type: **[DWORD](/windows/win32/winprog/windows-data-types)**
     * 
     * The operational code identifying the operation to be performed on the device service.
     * @param {Integer} dwInBufferSize Type: **[DWORD](/windows/win32/winprog/windows-data-types)**
     * 
     * The size, in bytes, of the input buffer.
     * @param {Pointer} pInBuffer Type: **[PVOID](/windows/win32/winprog/windows-data-types)**
     * 
     * A generic buffer for command input.
     * @param {Integer} dwOutBufferSize Type: **[DWORD](/windows/win32/winprog/windows-data-types)**
     * 
     * The size, in bytes, of the output buffer.
     * @param {Pointer} pOutBuffer Type: **[PVOID](/windows/win32/winprog/windows-data-types)**
     * 
     * A generic buffer for command output.
     * @param {Pointer<Integer>} pdwBytesReturned Type: **[PDWORD](/windows/win32/winprog/windows-data-types)**
     * 
     * The number of bytes returned.
     * @returns {Integer} Type: **[HRESULT](/windows/win32/com/structure-of-com-error-codes)**
     * 
     * If the function succeeds, the return value is **ERROR_SUCCESS**. If the function fails with **ERROR_ACCESS_DENIED**, then the caller doesn't have sufficient permissions to perform this operation. The caller needs to either have admin privilege, or needs to be a UMDF driver.
     * @see https://docs.microsoft.com/windows/win32/api//wlanapi/nf-wlanapi-wlandeviceservicecommand
     */
    static WlanDeviceServiceCommand(hClientHandle, pInterfaceGuid, pDeviceServiceGuid, dwOpCode, dwInBufferSize, pInBuffer, dwOutBufferSize, pOutBuffer, pdwBytesReturned) {
        hClientHandle := hClientHandle is Win32Handle ? NumGet(hClientHandle, "ptr") : hClientHandle

        pdwBytesReturnedMarshal := pdwBytesReturned is VarRef ? "uint*" : "ptr"

        result := DllCall("wlanapi.dll\WlanDeviceServiceCommand", "ptr", hClientHandle, "ptr", pInterfaceGuid, "ptr", pDeviceServiceGuid, "uint", dwOpCode, "uint", dwInBufferSize, "ptr", pInBuffer, "uint", dwOutBufferSize, "ptr", pOutBuffer, pdwBytesReturnedMarshal, pdwBytesReturned, "uint")
        return result
    }

    /**
     * Retrieves a list of the supported device services on a given wireless LAN interface.
     * @param {HANDLE} hClientHandle Type: **[HANDLE](/windows/win32/winprog/windows-data-types)**
     * 
     * The client's session handle, obtained by a previous call to the [WlanOpenHandle](./nf-wlanapi-wlanopenhandle.md) function.
     * @param {Pointer<Guid>} pInterfaceGuid Type: **CONST [GUID](../guiddef/ns-guiddef-guid.md)\***
     * 
     * A pointer to the **GUID** of the wireless LAN interface to be queried. You can determine the **GUID** of each wireless LAN interface enabled on a local computer by using the [WlanEnumInterfaces](./nf-wlanapi-wlanenuminterfaces.md) function.
     * @param {Pointer<Pointer<WLAN_DEVICE_SERVICE_GUID_LIST>>} ppDevSvcGuidList Type: **[PWLAN_DEVICE_SERVICE_GUID_LIST](./ns-wlanapi-wlan_device_service_guid_list.md)\***
     * 
     * A pointer to storage for a pointer to receive the returned list of device service **GUID**s in a [WLAN_DEVICE_SERVICE_GUID_LIST](./ns-wlanapi-wlan_device_service_guid_list.md) structure. If the call succeeds, then the buffer for the **WLAN_DEVICE_SERVICE_GUID_LIST** returned is allocated by the **WlanGetSupportedDeviceServices** function.
     * @returns {Integer} Type: **[HRESULT](/windows/win32/com/structure-of-com-error-codes)**
     * 
     * If the function succeeds, the return value is **ERROR_SUCCESS**. If the function fails with **ERROR_ACCESS_DENIED**, then the caller doesn't have sufficient permissions to perform this operation. The caller needs to either have admin privilege, or needs to be a UMDF driver.
     * @see https://docs.microsoft.com/windows/win32/api//wlanapi/nf-wlanapi-wlangetsupporteddeviceservices
     */
    static WlanGetSupportedDeviceServices(hClientHandle, pInterfaceGuid, ppDevSvcGuidList) {
        hClientHandle := hClientHandle is Win32Handle ? NumGet(hClientHandle, "ptr") : hClientHandle

        ppDevSvcGuidListMarshal := ppDevSvcGuidList is VarRef ? "ptr*" : "ptr"

        result := DllCall("wlanapi.dll\WlanGetSupportedDeviceServices", "ptr", hClientHandle, "ptr", pInterfaceGuid, ppDevSvcGuidListMarshal, ppDevSvcGuidList, "uint")
        return result
    }

    /**
     * Allows user mode clients with admin privileges, or User-Mode Driver Framework (UMDF) drivers, to register for unsolicited notifications corresponding to device services that they're interested in.
     * @param {HANDLE} hClientHandle Type: **[HANDLE](/windows/win32/winprog/windows-data-types)**
     * 
     * The client's session handle, obtained by a previous call to the [WlanOpenHandle](./nf-wlanapi-wlanopenhandle.md) function.
     * @param {Pointer<WLAN_DEVICE_SERVICE_GUID_LIST>} pDevSvcGuidList Type: **CONST [PWLAN_DEVICE_SERVICE_GUID_LIST](./ns-wlanapi-wlan_device_service_guid_list.md)**
     * 
     * An optional pointer to a constant [WLAN_DEVICE_SERVICE_GUID_LIST](./ns-wlanapi-wlan_device_service_guid_list.md) structure representing the device service **GUID**s for which you're interested in receiving notifications. The *dwIndex* member of the structure must have a value less than the value of its *dwNumberOfItems* member; otherwise, an access violation may occur. Every time you call this API, the previous device services list is replaced by the new one.
     * 
     * To unregister, set *pDevSvcGuidList* to `nullptr`, or pass a pointer to a **WLAN_DEVICE_SERVICE_GUID_LIST** structure that has the `dwNumberOfItems` member set to 0.
     * @returns {Integer} Type: **[HRESULT](/windows/win32/com/structure-of-com-error-codes)**
     * 
     * If the function succeeds, the return value is **ERROR_SUCCESS**. If the function fails with **ERROR_ACCESS_DENIED**, then the caller doesn't have sufficient permissions to perform this operation. The caller needs to either have admin privilege, or needs to be a UMDF driver.
     * @see https://docs.microsoft.com/windows/win32/api//wlanapi/nf-wlanapi-wlanregisterdeviceservicenotification
     */
    static WlanRegisterDeviceServiceNotification(hClientHandle, pDevSvcGuidList) {
        hClientHandle := hClientHandle is Win32Handle ? NumGet(hClientHandle, "ptr") : hClientHandle

        result := DllCall("wlanapi.dll\WlanRegisterDeviceServiceNotification", "ptr", hClientHandle, "ptr", pDevSvcGuidList, "uint")
        return result
    }

    /**
     * Extracts the proximity service discovery (PSD) information element (IE) data list from raw IE data included in a beacon.
     * @param {HANDLE} hClientHandle The client's session handle, obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
     * @param {Integer} dwIeDataSize The size, in bytes, of the <i>pRawIeData</i> parameter.
     * @param {Pointer} pRawIeData The raw IE data for all IEs in the list.
     * @param {PWSTR} strFormat Describes the format of a PSD IE. Only IEs with a matching format are returned.
     * @param {Pointer<Pointer<WLAN_RAW_DATA_LIST>>} ppPsdIEDataList A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_raw_data_list">PWLAN_RAW_DATA_LIST</a> structure that contains the formatted data list.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value may be one of the following return codes.
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
     * <i>hClientHandle</i> is <b>NULL</b> or invalid, <i>dwIeDataSize</i> is 0, <i>pRawIeData</i> is <b>NULL</b>, or <i>pReserved</i> is not <b>NULL</b>.
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
     * The handle <i>hClientHandle</i>  was not found in the handle table.
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
     * This function was called from an unsupported platform. This value will be returned if this function was called from a Windows XP with SP3 or Wireless LAN API for Windows XP with SP2 client.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_STATUS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Various error codes.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wlanapi/nf-wlanapi-wlanextractpsdiedatalist
     * @since windows6.0.6000
     */
    static WlanExtractPsdIEDataList(hClientHandle, dwIeDataSize, pRawIeData, strFormat, ppPsdIEDataList) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        hClientHandle := hClientHandle is Win32Handle ? NumGet(hClientHandle, "ptr") : hClientHandle
        strFormat := strFormat is String ? StrPtr(strFormat) : strFormat

        ppPsdIEDataListMarshal := ppPsdIEDataList is VarRef ? "ptr*" : "ptr"

        result := DllCall("wlanapi.dll\WlanExtractPsdIEDataList", "ptr", hClientHandle, "uint", dwIeDataSize, "ptr", pRawIeData, "ptr", strFormat, "ptr", pReserved, ppPsdIEDataListMarshal, ppPsdIEDataList, "uint")
        return result
    }

    /**
     * Retrieves a string that describes a specified reason code.
     * @param {Integer} dwReasonCode A <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/wlan-reason-code">WLAN_REASON_CODE</a> value of which the string description is requested.
     * @param {Integer} dwBufferSize The size of the buffer used to store the string, in <b>WCHAR</b>.  If the reason code string is longer than the buffer, it will be truncated and NULL-terminated. If <i>dwBufferSize</i> is larger than the actual amount of memory allocated to <i>pStringBuffer</i>, then an access violation will occur in the calling program.
     * @param {PWSTR} pStringBuffer Pointer to a buffer that will receive the string. The caller must allocate memory to <i>pStringBuffer</i> before calling <b>WlanReasonCodeToString</b>.
     * @returns {Integer} If the function succeeds, the return value is a pointer to a constant string.
     * 
     * If the function fails, the return value may be one of the following return codes.
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
     * A parameter is incorrect. This error is returned if any of the following conditions occur:<ul>
     * <li><i>dwBufferSize</i> is 0.</li>
     * <li><i>pStringBuffer</i> is <b>NULL</b>.</li>
     * <li><i>pReserved</i> is not <b>NULL</b>.</li>
     * </ul>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Various RPC and other error codes. Use 
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wlanapi/nf-wlanapi-wlanreasoncodetostring
     * @since windows6.0.6000
     */
    static WlanReasonCodeToString(dwReasonCode, dwBufferSize, pStringBuffer) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        pStringBuffer := pStringBuffer is String ? StrPtr(pStringBuffer) : pStringBuffer

        result := DllCall("wlanapi.dll\WlanReasonCodeToString", "uint", dwReasonCode, "uint", dwBufferSize, "ptr", pStringBuffer, "ptr", pReserved, "uint")
        return result
    }

    /**
     * Allocates memory.
     * @param {Integer} dwMemorySize Amount of  memory being requested, in bytes.
     * @returns {Pointer<Void>} If the call is successful, the function returns a pointer to the allocated memory.
     * 
     * If the memory could not be allocated for any reason or if the <i>dwMemorySize</i> parameter is 0, the returned pointer is <b>NULL</b>.
     * 
     * An application can call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> to obtain extended error information.
     * @see https://docs.microsoft.com/windows/win32/api//wlanapi/nf-wlanapi-wlanallocatememory
     * @since windows6.0.6000
     */
    static WlanAllocateMemory(dwMemorySize) {
        A_LastError := 0

        result := DllCall("wlanapi.dll\WlanAllocateMemory", "uint", dwMemorySize, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Frees memory.
     * @remarks
     * 
     * If <i>pMemory</i> points to memory that has already been freed, an access violation or heap corruption may occur.
     * 
     * There is a hotfix available for  Wireless LAN API for Windows XP with Service Pack 2 (SP2) that can help improve the performance of applications that call <b>WlanFreeMemory</b> and <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlangetavailablenetworklist">WlanGetAvailableNetworkList</a> many times. For more information, see Help and Knowledge Base article 940541, entitled "FIX: The private bytes of the application continuously increase when an application calls the WlanGetAvailableNetworkList function and the WlanFreeMemory function on a Windows XP Service Pack 2-based computer", in the Help and Support Knowledge Base at <a href="https://support.microsoft.com/kb/940541">https://go.microsoft.com/fwlink/p/?linkid=102216</a>.
     * 
     * 
     * @param {Pointer<Void>} pMemory Pointer to the memory to be freed.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//wlanapi/nf-wlanapi-wlanfreememory
     * @since windows6.0.6000
     */
    static WlanFreeMemory(pMemory) {
        pMemoryMarshal := pMemory is VarRef ? "ptr" : "ptr"

        DllCall("wlanapi.dll\WlanFreeMemory", pMemoryMarshal, pMemory)
    }

    /**
     * Sets the security settings for a configurable object.
     * @param {HANDLE} hClientHandle The client's session handle, obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
     * @param {Integer} SecurableObject A <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ne-wlanapi-wlan_securable_object">WLAN_SECURABLE_OBJECT</a> value that specifies the object to which the security settings will be applied.
     * @param {PWSTR} strModifiedSDDL A security descriptor string that specifies the new security settings for the object. This string must be NULL-terminated. For more information, see the Remarks section.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value may be one of the following return codes.
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
     * A parameter is incorrect. This error is returned if any of the following conditions occur:<ul>
     * <li><i>hClientHandle</i> is <b>NULL</b>.</li>
     * <li><i>strModifiedSDDL</i> is <b>NULL</b>.</li>
     * <li><i>SecurableObject</i> is set to a value greater than or equal to <b>WLAN_SECURABLE_OBJECT_COUNT</b> (12).</li>
     * </ul>
     * 
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
     * A handle is invalid. This error is returned if the handle specified in the <i>hClientHandle</i>  parameter was not found in the handle table.
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
     * The caller does not have sufficient permissions. 
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
     * This function was called from an unsupported platform. This value will be returned if this function was called from a Windows XP with SP3 or Wireless LAN API for Windows XP with SP2 client.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wlanapi/nf-wlanapi-wlansetsecuritysettings
     * @since windows6.0.6000
     */
    static WlanSetSecuritySettings(hClientHandle, SecurableObject, strModifiedSDDL) {
        hClientHandle := hClientHandle is Win32Handle ? NumGet(hClientHandle, "ptr") : hClientHandle
        strModifiedSDDL := strModifiedSDDL is String ? StrPtr(strModifiedSDDL) : strModifiedSDDL

        result := DllCall("wlanapi.dll\WlanSetSecuritySettings", "ptr", hClientHandle, "int", SecurableObject, "ptr", strModifiedSDDL, "uint")
        return result
    }

    /**
     * Gets the security settings associated with a configurable object.
     * @param {HANDLE} hClientHandle The client's session handle, obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
     * @param {Integer} SecurableObject A <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ne-wlanapi-wlan_securable_object">WLAN_SECURABLE_OBJECT</a> value that specifies the object to which the security settings apply.
     * @param {Pointer<Integer>} pValueType A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/wlanapi/ne-wlanapi-wlan_opcode_value_type-r1">WLAN_OPCODE_VALUE_TYPE</a> value that specifies the source of the security settings.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="wlan_opcode_value_type_set_by_group_policy"></a><a id="WLAN_OPCODE_VALUE_TYPE_SET_BY_GROUP_POLICY"></a><dl>
     * <dt><b>wlan_opcode_value_type_set_by_group_policy</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The security settings were set by group policy.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="wlan_opcode_value_type_set_by_user"></a><a id="WLAN_OPCODE_VALUE_TYPE_SET_BY_USER"></a><dl>
     * <dt><b>wlan_opcode_value_type_set_by_user</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The security settings were set by the user. A user can set security settings by calling <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlansetsecuritysettings">WlanSetSecuritySettings</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<PWSTR>} pstrCurrentSDDL On input, this parameter must be <b>NULL</b>. 
     * 
     * On output, this parameter receives a pointer to the security descriptor string that specifies the security settings for the object if the function call succeeds. For more information about this string, see <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlansetsecuritysettings">WlanSetSecuritySettings</a> function.
     * @param {Pointer<Integer>} pdwGrantedAccess The access mask of the object.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>WLAN_READ_ACCESS</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller can view the object's permissions.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>WLAN_EXECUTE_ACCESS</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller can read from and execute the object. WLAN_EXECUTE_ACCESS has the same value as the bitwise OR combination WLAN_READ_ACCESS | WLAN_EXECUTE_ACCESS.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>WLAN_WRITE_ACCESS</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller can read from, execute, and write to the object. WLAN_WRITE_ACCESS has the same value as the bitwise OR combination WLAN_READ_ACCESS | WLAN_EXECUTE_ACCESS | WLAN_WRITE_ACCESS.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value may be one of the following return codes.
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
     * A parameter is incorrect. This error is returned if any of the following conditions occur:<ul>
     * <li><i>hClientHandle</i> is <b>NULL</b>.</li>
     * <li><i>pstrCurrentSDDL</i> is <b>NULL</b>.</li>
     * <li><i>pdwGrantedAccess</i> is <b>NULL</b>.</li>
     * <li><i>SecurableObject</i> is set to a value greater than or equal to <b>WLAN_SECURABLE_OBJECT_COUNT</b> (12).</li>
     * </ul>
     * 
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
     * A handle is invalid. This error is returned if the handle specified in the <i>hClientHandle</i>  parameter was not found in the handle table.
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
     * The caller does not have sufficient permissions. 
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
     * This function was called from an unsupported platform. This value will be returned if this function was called from a Windows XP with SP3 or Wireless LAN API for Windows XP with SP2 client.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wlanapi/nf-wlanapi-wlangetsecuritysettings
     * @since windows6.0.6000
     */
    static WlanGetSecuritySettings(hClientHandle, SecurableObject, pValueType, pstrCurrentSDDL, pdwGrantedAccess) {
        hClientHandle := hClientHandle is Win32Handle ? NumGet(hClientHandle, "ptr") : hClientHandle

        pValueTypeMarshal := pValueType is VarRef ? "int*" : "ptr"
        pstrCurrentSDDLMarshal := pstrCurrentSDDL is VarRef ? "ptr*" : "ptr"
        pdwGrantedAccessMarshal := pdwGrantedAccess is VarRef ? "uint*" : "ptr"

        result := DllCall("wlanapi.dll\WlanGetSecuritySettings", "ptr", hClientHandle, "int", SecurableObject, pValueTypeMarshal, pValueType, pstrCurrentSDDLMarshal, pstrCurrentSDDL, pdwGrantedAccessMarshal, pdwGrantedAccess, "uint")
        return result
    }

    /**
     * Displays the wireless profile user interface (UI).
     * @param {Integer} dwClientVersion Specifies the highest version of the WLAN API that the client supports. 
     * Values other than WLAN_UI_API_VERSION will be ignored.
     * @param {PWSTR} wstrProfileName Contains the name of the profile to be viewed or edited. Profile names are case-sensitive. This string must be NULL-terminated.
     * 
     * The supplied profile must be present on the interface <i>pInterfaceGuid</i>. That means the profile must have been previously created and saved in the profile store and that the profile must be valid for the supplied interface.
     * @param {Pointer<Guid>} pInterfaceGuid The GUID of the interface.
     * @param {HWND} hWnd The handle of the  application window requesting the UI display.
     * @param {Integer} wlStartPage A <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ne-wlanapi-wl_display_pages">WL_DISPLAY_PAGES</a> value that specifies the active tab when the UI dialog box appears.
     * @param {Pointer<Integer>} pWlanReasonCode A pointer to a <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/wlan-reason-code">WLAN_REASON_CODE</a> value that indicates why the UI display failed.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value may be one of the following return codes.
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
     * One of the supplied parameters is not valid.
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
     * This function was called from an unsupported platform. This value will be returned if this function was called from a Windows XP with SP3 or Wireless LAN API for Windows XP with SP2 client.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_STATUS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Various error codes.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wlanapi/nf-wlanapi-wlanuieditprofile
     * @since windows6.0.6000
     */
    static WlanUIEditProfile(dwClientVersion, wstrProfileName, pInterfaceGuid, hWnd, wlStartPage, pWlanReasonCode) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        wstrProfileName := wstrProfileName is String ? StrPtr(wstrProfileName) : wstrProfileName
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        pWlanReasonCodeMarshal := pWlanReasonCode is VarRef ? "uint*" : "ptr"

        result := DllCall("wlanui.dll\WlanUIEditProfile", "uint", dwClientVersion, "ptr", wstrProfileName, "ptr", pInterfaceGuid, "ptr", hWnd, "int", wlStartPage, "ptr", pReserved, pWlanReasonCodeMarshal, pWlanReasonCode, "uint")
        return result
    }

    /**
     * Starts the wireless Hosted Network.
     * @param {HANDLE} hClientHandle The client's session handle, returned by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
     * @param {Pointer<Integer>} pFailReason An optional pointer to a value that receives the failure reason,  if the call to the <b>WlanHostedNetworkStartUsing</b> function fails. Possible values for the failure reason are from the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ne-wlanapi-wlan_hosted_network_reason">WLAN_HOSTED_NETWORK_REASON</a> enumeration type defined in the <i>Wlanapi.h </i>header file.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value may be one of the following return codes.
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
     * A parameter is incorrect. This error is returned if any of the following conditions occur:<ul>
     * <li><i>hClientHandle</i> is <b>NULL</b>.</li>
     * <li><i>pvReserved</i> is not <b>NULL</b>.</li>
     * </ul>
     * 
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
     * A handle is invalid. This error is returned if the handle specified in the <i>hClientHandle</i>  parameter was not found in the handle table.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The resource is not in the correct state to perform the requested operation. This error is returned if the wireless Hosted Network is disabled by group policy on a domain.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SERVICE_NOT_ACTIVE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service has not been started. This error is returned if the WLAN AutoConfig Service is not running.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Various RPC and other error codes. Use 
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wlanapi/nf-wlanapi-wlanhostednetworkstartusing
     * @since windows6.1
     */
    static WlanHostedNetworkStartUsing(hClientHandle, pFailReason) {
        static pvReserved := 0 ;Reserved parameters must always be NULL

        hClientHandle := hClientHandle is Win32Handle ? NumGet(hClientHandle, "ptr") : hClientHandle

        pFailReasonMarshal := pFailReason is VarRef ? "int*" : "ptr"

        result := DllCall("wlanapi.dll\WlanHostedNetworkStartUsing", "ptr", hClientHandle, pFailReasonMarshal, pFailReason, "ptr", pvReserved, "uint")
        return result
    }

    /**
     * Stops the wireless Hosted Network.
     * @param {HANDLE} hClientHandle The client's session handle, returned by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
     * @param {Pointer<Integer>} pFailReason An optional pointer to a value that receives the failure reason  if the call to the <b>WlanHostedNetworkStopUsing</b> function fails. Possible values for the failure reason are from the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ne-wlanapi-wlan_hosted_network_reason">WLAN_HOSTED_NETWORK_REASON</a> enumeration type defined in the <i>Wlanapi.h </i>header file.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value may be one of the following return codes.
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
     * A handle is invalid. This error is returned if the handle specified in the <i>hClientHandle</i>  parameter was not found in the handle table.
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
     * A parameter is incorrect. This error is returned if any of the following conditions occur:<ul>
     * <li><i>hClientHandle</i> is <b>NULL</b>.</li>
     * <li><i>pvReserved</i> is not <b>NULL</b>.</li>
     * </ul>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The resource is not in the correct state to perform the requested operation. This can occur if the wireless Hosted Network was in the process of shutting down.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SERVICE_NOT_ACTIVE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service has not been started. This error is returned if the WLAN AutoConfig Service is not running.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Various RPC and other error codes. Use 
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wlanapi/nf-wlanapi-wlanhostednetworkstopusing
     * @since windows6.1
     */
    static WlanHostedNetworkStopUsing(hClientHandle, pFailReason) {
        static pvReserved := 0 ;Reserved parameters must always be NULL

        hClientHandle := hClientHandle is Win32Handle ? NumGet(hClientHandle, "ptr") : hClientHandle

        pFailReasonMarshal := pFailReason is VarRef ? "int*" : "ptr"

        result := DllCall("wlanapi.dll\WlanHostedNetworkStopUsing", "ptr", hClientHandle, pFailReasonMarshal, pFailReason, "ptr", pvReserved, "uint")
        return result
    }

    /**
     * Transitions the wireless Hosted Network to the wlan_hosted_network_active state without associating the request with the application's calling handle.
     * @param {HANDLE} hClientHandle The client's session handle, returned by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
     * @param {Pointer<Integer>} pFailReason An optional pointer to a value that receives the failure reason  if the call to the <b>WlanHostedNetworkForceStart</b> function fails. Possible values for the failure reason are from the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ne-wlanapi-wlan_hosted_network_reason">WLAN_HOSTED_NETWORK_REASON</a> enumeration type defined in the <i>Wlanapi.h </i>header file.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value may be one of the following return codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have sufficient permissions. 
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
     * A handle is invalid. This error is returned if the handle specified in the <i>hClientHandle</i>  parameter was not found in the handle table.
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
     * A parameter is incorrect. This error is returned if any of the following conditions occur:<ul>
     * <li><i>hClientHandle</i> is <b>NULL</b>.</li>
     * <li><i>pvReserved</i> is not <b>NULL</b>.</li>
     * </ul>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The resource is not in the correct state to perform the requested operation.
     * 
     * This error is returned if the wireless Hosted Network is disabled by group policy on a domain.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SERVICE_NOT_ACTIVE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service has not been started. This error is returned if the WLAN AutoConfig Service is not running.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Various RPC and other error codes. Use 
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wlanapi/nf-wlanapi-wlanhostednetworkforcestart
     * @since windows6.1
     */
    static WlanHostedNetworkForceStart(hClientHandle, pFailReason) {
        static pvReserved := 0 ;Reserved parameters must always be NULL

        hClientHandle := hClientHandle is Win32Handle ? NumGet(hClientHandle, "ptr") : hClientHandle

        pFailReasonMarshal := pFailReason is VarRef ? "int*" : "ptr"

        result := DllCall("wlanapi.dll\WlanHostedNetworkForceStart", "ptr", hClientHandle, pFailReasonMarshal, pFailReason, "ptr", pvReserved, "uint")
        return result
    }

    /**
     * Transitions the wireless Hosted Network to the wlan_hosted_network_idle without associating the request with the application's calling handle.
     * @param {HANDLE} hClientHandle The client's session handle, returned by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
     * @param {Pointer<Integer>} pFailReason An optional pointer to a value that receives the failure reason,  if the call to the <b>WlanHostedNetworkForceStop</b> function fails. Possible values for the failure reason are from the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ne-wlanapi-wlan_hosted_network_reason">WLAN_HOSTED_NETWORK_REASON</a> enumeration type defined in the <i>Wlanapi.h </i>header file.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value may be one of the following return codes.
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
     * A handle is invalid. This error is returned if the handle specified in the <i>hClientHandle</i>  parameter was not found in the handle table.
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
     * A parameter is incorrect. This error is returned if any of the following conditions occur:<ul>
     * <li><i>hClientHandle</i> is <b>NULL</b>.</li>
     * <li><i>pvReserved</i> is not <b>NULL</b>.</li>
     * </ul>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The resource is not in the correct state to perform the requested operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SERVICE_NOT_ACTIVE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service has not been started. This error is returned if the WLAN AutoConfig Service is not running.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Various RPC and other error codes. Use 
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wlanapi/nf-wlanapi-wlanhostednetworkforcestop
     * @since windows6.1
     */
    static WlanHostedNetworkForceStop(hClientHandle, pFailReason) {
        static pvReserved := 0 ;Reserved parameters must always be NULL

        hClientHandle := hClientHandle is Win32Handle ? NumGet(hClientHandle, "ptr") : hClientHandle

        pFailReasonMarshal := pFailReason is VarRef ? "int*" : "ptr"

        result := DllCall("wlanapi.dll\WlanHostedNetworkForceStop", "ptr", hClientHandle, pFailReasonMarshal, pFailReason, "ptr", pvReserved, "uint")
        return result
    }

    /**
     * Queries the current static properties of the wireless Hosted Network.
     * @param {HANDLE} hClientHandle The client's session handle, returned by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
     * @param {Integer} OpCode The identifier for property to be queried. This identifier can be any of the values in the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ne-wlanapi-wlan_hosted_network_opcode">WLAN_HOSTED_NETWORK_OPCODE</a> enumeration defined in the <i>Wlanapi.h </i>header file.
     * @param {Pointer<Integer>} pdwDataSize A pointer to a value that specifies the size, in bytes, of the buffer returned in the <i>ppvData</i> parameter, if the call to the <b>WlanHostedNetworkQueryProperty</b> function succeeds.
     * @param {Pointer<Pointer<Void>>} ppvData On input, this parameter must be <b>NULL</b>. 
     * 
     * On output, this parameter receives a pointer to a buffer returned with the static property requested,  if the call to the <b>WlanHostedNetworkQueryProperty</b> function succeeds.  The data type associated with this buffer depends upon the value of <i>OpCode</i> parameter.
     * @param {Pointer<Integer>} pWlanOpcodeValueType A pointer to a value that receives the value type of the wireless Hosted Network property,  if the call to the <b>WlanHostedNetworkQueryProperty</b> function succeeds. The returned value is an enumerated type in the <a href="https://docs.microsoft.com/windows/win32/api/wlanapi/ne-wlanapi-wlan_opcode_value_type-r1">WLAN_OPCODE_VALUE_TYPE</a> enumeration defined in the <i>Wlanapi.h </i>header file.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value may be one of the following return codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_CONFIGURATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The configuration data for the wireless Hosted Network is unconfigured.  This error is returned if the application calls the <a href="/windows/desktop/api/wlanapi/nf-wlanapi-wlanhostednetworkqueryproperty">WlanHostedNetworkQueryProperty</a> function with the <i>OpCode</i> parameter set to  <b>wlan_hosted_network_opcode_station_profile</b> or <b>wlan_hosted_network_opcode_connection_settings</b> before a SSID is configured in the wireless Hosted Network.
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
     * A handle is invalid. This error is returned if the handle specified in the <i>hClientHandle</i>  parameter was not found in the handle table.
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
     * A parameter is incorrect. This error is returned if any of the following conditions occur:<ul>
     * <li><i>hClientHandle</i> is <b>NULL</b>.</li>
     * <li><i>OpCode</i> is not one of the enumerated values defined in the <a href="/windows/desktop/api/wlanapi/ne-wlanapi-wlan_hosted_network_opcode">WLAN_HOSTED_NETWORK_OPCODE</a>.</li>
     * <li><i>pdwDataSize</i> is <b>NULL</b>.</li>
     * <li><i>ppvData</i> is <b>NULL</b>.</li>
     * <li><i>pWlanOpcodeValueType</i> is <b>NULL</b>.</li>
     * <li><i>pvReserved</i> is not <b>NULL</b>.</li>
     * </ul>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The resource is not in the correct state to perform the requested operation. This can occur if the wireless Hosted Network was in the process of shutting down.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough storage is available to complete this operation. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SERVICE_NOT_ACTIVE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service has not been started. This error is returned if the WLAN AutoConfig Service is not running.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Various RPC and other error codes. Use 
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wlanapi/nf-wlanapi-wlanhostednetworkqueryproperty
     * @since windows6.1
     */
    static WlanHostedNetworkQueryProperty(hClientHandle, OpCode, pdwDataSize, ppvData, pWlanOpcodeValueType) {
        static pvReserved := 0 ;Reserved parameters must always be NULL

        hClientHandle := hClientHandle is Win32Handle ? NumGet(hClientHandle, "ptr") : hClientHandle

        pdwDataSizeMarshal := pdwDataSize is VarRef ? "uint*" : "ptr"
        ppvDataMarshal := ppvData is VarRef ? "ptr*" : "ptr"
        pWlanOpcodeValueTypeMarshal := pWlanOpcodeValueType is VarRef ? "int*" : "ptr"

        result := DllCall("wlanapi.dll\WlanHostedNetworkQueryProperty", "ptr", hClientHandle, "int", OpCode, pdwDataSizeMarshal, pdwDataSize, ppvDataMarshal, ppvData, pWlanOpcodeValueTypeMarshal, pWlanOpcodeValueType, "ptr", pvReserved, "uint")
        return result
    }

    /**
     * Sets static properties of the wireless Hosted Network.
     * @param {HANDLE} hClientHandle The client's session handle, returned by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
     * @param {Integer} OpCode The identifier for the property to be set. This identifier can only be the following values in the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ne-wlanapi-wlan_hosted_network_opcode">WLAN_HOSTED_NETWORK_OPCODE</a> enumeration defined in the <i>Wlanapi.h </i>header file:
     * 
     * * **wlan_hosted_network_opcode_connection_settings**
     * 
     * The Hosted Network connection settings.
     * 
     * * **wlan_hosted_network_opcode_enable**
     * 
     * The Hosted Network enabled flag.
     * @param {Integer} dwDataSize A value that specifies the size, in bytes, of the buffer pointed to by the <i>pvData</i> parameter.
     * @param {Pointer} pvData A pointer to a buffer with the static property to set.  The data type associated with this buffer depends upon the value of <i>OpCode</i> parameter.
     * @param {Pointer<Integer>} pFailReason An optional pointer to a value that receives the failure reason,  if the call to the <b>WlanHostedNetworkSetProperty</b> function fails. Possible values for the failure reason are from the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ne-wlanapi-wlan_hosted_network_reason">WLAN_HOSTED_NETWORK_REASON</a> enumeration type defined in the <i>Wlanapi.h </i>header file.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value may be one of the following return codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have sufficient permissions. This error is also returned if the <i>OpCode</i> parameter  was <b>wlan_hosted_network_opcode_enable</b> and the wireless Hosted Network is disabled by group policy on a domain. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_PROFILE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network connection profile used by the wireless Hosted Network is corrupted.
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
     * A handle is invalid. This error is returned if the handle specified in the <i>hClientHandle</i>  parameter was not found in the handle table.
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
     * A parameter is incorrect. This error is returned if any of the following conditions occur:<ul>
     * <li><i>hClientHandle</i> is <b>NULL</b>.</li>
     * <li><i>OpCode</i> is not one of the enumerated values defined in the <a href="/windows/desktop/api/wlanapi/ne-wlanapi-wlan_hosted_network_opcode">WLAN_HOSTED_NETWORK_OPCODE</a>.</li>
     * <li><i>dwDataSize</i> is zero.</li>
     * <li><i>pvData</i> is <b>NULL</b>.</li>
     * <li><i>pvData</i> does not point to a well- formed static property.</li>
     * <li><i>pvReserved</i> is not <b>NULL</b>.</li>
     * </ul>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The resource is not in the correct state to perform the requested operation. This can occur if the wireless Hosted Network was in the process of shutting down.
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
     * The request is not supported. This error is returned if the application calls the <a href="/windows/desktop/api/wlanapi/nf-wlanapi-wlanhostednetworksetproperty">WlanHostedNetworkSetProperty</a> function with the <i>OpCode</i> parameter set to  <b>wlan_hosted_network_opcode_station_profile</b> or <b>wlan_hosted_network_opcode_security_settings</b>. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SERVICE_NOT_ACTIVE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service has not been started. This error is returned if the WLAN AutoConfig Service is not running.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Various RPC and other error codes. Use 
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wlanapi/nf-wlanapi-wlanhostednetworksetproperty
     * @since windows6.1
     */
    static WlanHostedNetworkSetProperty(hClientHandle, OpCode, dwDataSize, pvData, pFailReason) {
        static pvReserved := 0 ;Reserved parameters must always be NULL

        hClientHandle := hClientHandle is Win32Handle ? NumGet(hClientHandle, "ptr") : hClientHandle

        pFailReasonMarshal := pFailReason is VarRef ? "int*" : "ptr"

        result := DllCall("wlanapi.dll\WlanHostedNetworkSetProperty", "ptr", hClientHandle, "int", OpCode, "uint", dwDataSize, "ptr", pvData, pFailReasonMarshal, pFailReason, "ptr", pvReserved, "uint")
        return result
    }

    /**
     * Configures and persists to storage the network connection settings (SSID and maximum number of peers, for example) on the wireless Hosted Network if these settings are not already configured.
     * @param {HANDLE} hClientHandle The client's session handle, returned by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
     * @param {Pointer<Integer>} pFailReason An optional pointer to a value that receives the failure reason  if the call to the <b>WlanHostedNetworkInitSettings</b> function fails. Possible values for the failure reason are from the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ne-wlanapi-wlan_hosted_network_reason">WLAN_HOSTED_NETWORK_REASON</a> enumeration type defined in the <i>Wlanapi.h </i>header file.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value may be one of the following return codes.
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
     * A handle is invalid. This error is returned if the handle specified in the <i>hClientHandle</i>  parameter was not found in the handle table.
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
     * A parameter is incorrect. This error is returned if any of the following conditions occur:<ul>
     * <li><i>hClientHandle</i> is <b>NULL</b>.</li>
     * <li><i>pvReserved</i> is not <b>NULL</b>.</li>
     * </ul>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The resource is not in the correct state to perform the requested operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SERVICE_NOT_ACTIVE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service has not been started. This error is returned if the WLAN AutoConfig Service is not running.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Various RPC and other error codes. Use 
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wlanapi/nf-wlanapi-wlanhostednetworkinitsettings
     * @since windows6.1
     */
    static WlanHostedNetworkInitSettings(hClientHandle, pFailReason) {
        static pvReserved := 0 ;Reserved parameters must always be NULL

        hClientHandle := hClientHandle is Win32Handle ? NumGet(hClientHandle, "ptr") : hClientHandle

        pFailReasonMarshal := pFailReason is VarRef ? "int*" : "ptr"

        result := DllCall("wlanapi.dll\WlanHostedNetworkInitSettings", "ptr", hClientHandle, pFailReasonMarshal, pFailReason, "ptr", pvReserved, "uint")
        return result
    }

    /**
     * Refreshes the configurable and auto-generated parts of the wireless Hosted Network security settings.
     * @param {HANDLE} hClientHandle The client's session handle, returned by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
     * @param {Pointer<Integer>} pFailReason An optional pointer to a value that receives the failure reason,  if the call to the <b>WlanHostedNetworkRefreshSecuritySettings</b> function fails. Possible values for the failure reason are from the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ne-wlanapi-wlan_hosted_network_reason">WLAN_HOSTED_NETWORK_REASON</a> enumeration type defined in the <i>Wlanapi.h </i>header file.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value may be one of the following return codes.
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
     * A handle is invalid. This error is returned if the handle specified in the <i>hClientHandle</i>  parameter was not found in the handle table.
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
     * A parameter is incorrect. This error is returned if any of the following conditions occur:<ul>
     * <li><i>hClientHandle</i> is <b>NULL</b>.</li>
     * <li><i>pvReserved</i> is not <b>NULL</b>.</li>
     * </ul>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The resource is not in the correct state to perform the requested operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SERVICE_NOT_ACTIVE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service has not been started. This error is returned if the WLAN AutoConfig Service is not running.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Various RPC and other error codes. Use 
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wlanapi/nf-wlanapi-wlanhostednetworkrefreshsecuritysettings
     * @since windows6.1
     */
    static WlanHostedNetworkRefreshSecuritySettings(hClientHandle, pFailReason) {
        static pvReserved := 0 ;Reserved parameters must always be NULL

        hClientHandle := hClientHandle is Win32Handle ? NumGet(hClientHandle, "ptr") : hClientHandle

        pFailReasonMarshal := pFailReason is VarRef ? "int*" : "ptr"

        result := DllCall("wlanapi.dll\WlanHostedNetworkRefreshSecuritySettings", "ptr", hClientHandle, pFailReasonMarshal, pFailReason, "ptr", pvReserved, "uint")
        return result
    }

    /**
     * Queries the current status of the wireless Hosted Network.
     * @param {HANDLE} hClientHandle The client's session handle, returned by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
     * @param {Pointer<Pointer<WLAN_HOSTED_NETWORK_STATUS>>} ppWlanHostedNetworkStatus On input, this parameter must be <b>NULL</b>. 
     * 
     * On output, this parameter receives a pointer to the current status of the wireless Hosted Network,  if the call to the <b>WlanHostedNetworkQueryStatus</b> function succeeds. The current status is returned in a <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_hosted_network_status">WLAN_HOSTED_NETWORK_STATUS</a> structure.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value may be one of the following return codes.
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
     * A handle is invalid. This error is returned if the handle specified in the <i>hClientHandle</i>  parameter was not found in the handle table.
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
     * A parameter is incorrect. This error is returned if any of the following conditions occur:<ul>
     * <li><i>hClientHandle</i> is <b>NULL</b>.</li>
     * <li>ppWlanHostedNetworkStatus is <b>NULL</b>.</li>
     * <li><i>pvReserved</i> is not <b>NULL</b>.</li>
     * </ul>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The resource is not in the correct state to perform the requested operation. This can occur if the wireless Hosted Network was in the process of shutting down.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SERVICE_NOT_ACTIVE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service has not been started. This error is returned if the WLAN AutoConfig Service is not running.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Various RPC and other error codes. Use 
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wlanapi/nf-wlanapi-wlanhostednetworkquerystatus
     * @since windows6.1
     */
    static WlanHostedNetworkQueryStatus(hClientHandle, ppWlanHostedNetworkStatus) {
        static pvReserved := 0 ;Reserved parameters must always be NULL

        hClientHandle := hClientHandle is Win32Handle ? NumGet(hClientHandle, "ptr") : hClientHandle

        ppWlanHostedNetworkStatusMarshal := ppWlanHostedNetworkStatus is VarRef ? "ptr*" : "ptr"

        result := DllCall("wlanapi.dll\WlanHostedNetworkQueryStatus", "ptr", hClientHandle, ppWlanHostedNetworkStatusMarshal, ppWlanHostedNetworkStatus, "ptr", pvReserved, "uint")
        return result
    }

    /**
     * Configures the secondary security key that will be used by the wireless Hosted Network.
     * @param {HANDLE} hClientHandle The client's session handle, returned by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
     * @param {Integer} dwKeyLength The number of valid data bytes in the key data array pointed to by the <i>pucKeyData</i> parameter. This key length should include the terminating ‘\0’ if the key is a passphrase.
     * @param {Pointer} pucKeyData A pointer to a buffer that contains the key data. The number of valid data bytes in the buffer must be at least the value specified in <i>dwKeyLength</i> parameter.
     * @param {BOOL} bIsPassPhrase A Boolean value that indicates if the key data array pointed to by the <i>pucKeyData</i> parameter is in passphrase format. 
     * 
     * If this parameter is <b>TRUE</b>, the key data array is in passphrase format. If this parameter is <b>FALSE</b>, the key data array is not in passphrase format.
     * @param {BOOL} bPersistent A Boolean value that indicates if the key data array pointed to by the <i>pucKeyData</i> parameter is to be stored and reused later or is for one-time use only. 
     * 
     * If this parameter is <b>TRUE</b>, the key data array is to be stored and reused later. If this parameter is <b>FALSE</b>, the key data array is to be used for one session (either the current session or the next session if the Hosted Network is not started).
     * @param {Pointer<Integer>} pFailReason An optional pointer to a value that receives the failure reason,  if the call to the <b>WlanHostedNetworkSetSecondaryKey</b> function fails. Possible values for the failure reason are from the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ne-wlanapi-wlan_hosted_network_reason">WLAN_HOSTED_NETWORK_REASON</a> enumeration type defined in the <i>Wlanapi.h </i>header file.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value may be one of the following return codes.
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
     * A handle is invalid. This error is returned if the handle specified in the <i>hClientHandle</i>  parameter was not found in the handle table.
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
     * A parameter is incorrect. This error is returned if any of the following conditions occur:<ul>
     * <li><i>hClientHandle</i> is <b>NULL</b>.</li>
     * <li><i>pucKeyData</i> is <b>NULL</b>.</li>
     * <li><i>pucKeyData</i> does not point to a well- formed valid key.</li>
     * <li><i>pvReserved</i> is not <b>NULL</b>.</li>
     * </ul>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The resource is not in the correct state to perform the requested operation. This can occur if the wireless Hosted Network was in the process of shutting down.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SERVICE_NOT_ACTIVE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service has not been started. This error is returned if the WLAN AutoConfig Service is not running.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Various RPC and other error codes. Use 
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wlanapi/nf-wlanapi-wlanhostednetworksetsecondarykey
     * @since windows6.1
     */
    static WlanHostedNetworkSetSecondaryKey(hClientHandle, dwKeyLength, pucKeyData, bIsPassPhrase, bPersistent, pFailReason) {
        static pvReserved := 0 ;Reserved parameters must always be NULL

        hClientHandle := hClientHandle is Win32Handle ? NumGet(hClientHandle, "ptr") : hClientHandle

        pFailReasonMarshal := pFailReason is VarRef ? "int*" : "ptr"

        result := DllCall("wlanapi.dll\WlanHostedNetworkSetSecondaryKey", "ptr", hClientHandle, "uint", dwKeyLength, "ptr", pucKeyData, "int", bIsPassPhrase, "int", bPersistent, pFailReasonMarshal, pFailReason, "ptr", pvReserved, "uint")
        return result
    }

    /**
     * Queries the secondary security key that is configured to be used by the wireless Hosted Network.
     * @param {HANDLE} hClientHandle The client's session handle, returned by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
     * @param {Pointer<Integer>} pdwKeyLength A pointer to a value that specifies number of valid data bytes in the key data array pointed to by the <i>ppucKeyData</i> parameter, if the call to the <b>WlanHostedNetworkQuerySecondaryKey</b> function succeeds. 
     * 
     * This key length includes the terminating ‘\0’ if the key is a passphrase.
     * @param {Pointer<Pointer<Integer>>} ppucKeyData A pointer to a value that receives a pointer to the buffer returned with the secondary security key data,  if the call to the <b>WlanHostedNetworkQuerySecondaryKey</b> function succeeds.
     * @param {Pointer<BOOL>} pbIsPassPhrase A pointer to a Boolean value that indicates if the key data array pointed to by the <i>ppucKeyData</i> parameter is in passphrase format. 
     * 
     * If this parameter is <b>TRUE</b>, the key data array is in passphrase format. If this parameter is <b>FALSE</b>, the key data array is not in passphrase format.
     * @param {Pointer<BOOL>} pbPersistent A pointer to a Boolean value that indicates if the key data array pointed to by the <i>ppucKeyData</i> parameter is to be stored and reused later or is for one-time use only. 
     * 
     * If this parameter is <b>TRUE</b>, the key data array is to be stored and reused later. If this parameter is <b>FALSE</b>, the key data array is for one-time use only.
     * @param {Pointer<Integer>} pFailReason An optional pointer to a value that receives the failure reason,  if the call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanhostednetworksetsecondarykey">WlanHostedNetworkSetSecondaryKey</a> function fails. Possible values for the failure reason are from the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ne-wlanapi-wlan_hosted_network_reason">WLAN_HOSTED_NETWORK_REASON</a> enumeration type defined in the <i>Wlanapi.h </i>header file.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value may be one of the following return codes.
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
     * A handle is invalid. This error is returned if the handle specified in the <i>hClientHandle</i>  parameter was not found in the handle table.
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
     * A parameter is incorrect. This error is returned if any of the following conditions occur:<ul>
     * <li><i>hClientHandle</i> is <b>NULL</b>.</li>
     * <li><i>pdwKeyLength</i> is <b>NULL</b>.</li>
     * <li><i>ppucKeyData</i> is <b>NULL</b> or invalid.</li>
     * <li><i>pbIsPassPhrase</i> is <b>NULL</b> or invalid.</li>
     * <li><i>pbPersistent</i> is <b>NULL</b>.</li>
     * <li><i>pvReserved</i> is not <b>NULL</b>.</li>
     * </ul>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The resource is not in the correct state to perform the requested operation. This can occur if the wireless Hosted Network was in the process of shutting down.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough storage is available to complete this operation. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SERVICE_NOT_ACTIVE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service has not been started. This error is returned if the WLAN AutoConfig Service is not running.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Various RPC and other error codes. Use 
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wlanapi/nf-wlanapi-wlanhostednetworkquerysecondarykey
     * @since windows6.1
     */
    static WlanHostedNetworkQuerySecondaryKey(hClientHandle, pdwKeyLength, ppucKeyData, pbIsPassPhrase, pbPersistent, pFailReason) {
        static pvReserved := 0 ;Reserved parameters must always be NULL

        hClientHandle := hClientHandle is Win32Handle ? NumGet(hClientHandle, "ptr") : hClientHandle

        pdwKeyLengthMarshal := pdwKeyLength is VarRef ? "uint*" : "ptr"
        ppucKeyDataMarshal := ppucKeyData is VarRef ? "ptr*" : "ptr"
        pbIsPassPhraseMarshal := pbIsPassPhrase is VarRef ? "int*" : "ptr"
        pbPersistentMarshal := pbPersistent is VarRef ? "int*" : "ptr"
        pFailReasonMarshal := pFailReason is VarRef ? "int*" : "ptr"

        result := DllCall("wlanapi.dll\WlanHostedNetworkQuerySecondaryKey", "ptr", hClientHandle, pdwKeyLengthMarshal, pdwKeyLength, ppucKeyDataMarshal, ppucKeyData, pbIsPassPhraseMarshal, pbIsPassPhrase, pbPersistentMarshal, pbPersistent, pFailReasonMarshal, pFailReason, "ptr", pvReserved, "uint")
        return result
    }

    /**
     * Is used to register and unregister notifications on a virtual station.
     * @param {HANDLE} hClientHandle The client's session handle, obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
     * @param {BOOL} bRegister A value that specifies whether to receive notifications on a virtual station.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value may be one of the following return codes.
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
     * A parameter is incorrect. This error is returned if any of the following conditions occur:<ul>
     * <li><i>hClientHandle</i> is <b>NULL</b>.</li>
     * <li><i>pvReserved</i> is not <b>NULL</b>.</li>
     * </ul>
     * 
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
     * A handle is invalid. This error is returned if the handle specified in the <i>hClientHandle</i>  parameter was not found in the handle table.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The resource is not in the correct state to perform the requested operation. This error is returned if the wireless Hosted Network is disabled by group policy on a domain.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SERVICE_NOT_ACTIVE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service has not been started. This error is returned if the WLAN AutoConfig Service is not running.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Various RPC and other error codes. Use 
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wlanapi/nf-wlanapi-wlanregistervirtualstationnotification
     * @since windows6.1
     */
    static WlanRegisterVirtualStationNotification(hClientHandle, bRegister) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        hClientHandle := hClientHandle is Win32Handle ? NumGet(hClientHandle, "ptr") : hClientHandle

        result := DllCall("wlanapi.dll\WlanRegisterVirtualStationNotification", "ptr", hClientHandle, "int", bRegister, "ptr", pReserved, "uint")
        return result
    }

    /**
     * Opens a handle to the Wi-Fi Direct service and negotiates a version of the Wi-FI Direct API to use.
     * @param {Integer} dwClientVersion The highest version of the Wi-Fi Direct API the client supports.
     * 
     * For Windows 8 and Windows Server 2012, this parameter should be set to <b>WFD_API_VERSION</b>, constant defined in the <i>Wlanapi.h</i> header file.
     * @param {Pointer<Integer>} pdwNegotiatedVersion A pointer to a <b>DWORD</b> to received the negotiated version.
     * 
     * If the <b>WFDOpenHandle</b> function is successful, the version negotiated with the Wi-Fi Direct Service to be used by this session is returned. This value is usually the highest version supported by both the client and Wi-Fi Direct service.
     * @param {Pointer<HANDLE>} phClientHandle A pointer to a <b>HANDLE</b> to receive the handle to the Wi-Fi Direct service for this session.
     * 
     * If the <b>WFDOpenHandle</b> function is successful, a handle to the Wi-Fi Direct service to use in this session is returned.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value may be one of the following return codes.
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
     * The parameter is incorrect. 
     * 
     * This error is returned if the <i>pdwNegotiatedVersion</i> parameter is <b>NULL</b> or the <i>phClientHandle</i> parameter is <b>NULL</b>. This value is also returned if the <i>dwClientVersion</i> parameter is not equal to <b>WFD_API_VERSION</b>.
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
     * Not enough storage is available to process this command.
     * 
     * This error is returned if the system was unable to allocate memory to create the client context.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_REMOTE_SESSION_LIMIT_EXCEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An attempt was made to establish a session to a network server, but there are already too many sessions established to that server.
     * 
     * This error is returned if too many handles have been issued by the Wi-Fi Direct service.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_STATUS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Various error codes.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wlanapi/nf-wlanapi-wfdopenhandle
     * @since windows8.0
     */
    static WFDOpenHandle(dwClientVersion, pdwNegotiatedVersion, phClientHandle) {
        pdwNegotiatedVersionMarshal := pdwNegotiatedVersion is VarRef ? "uint*" : "ptr"

        result := DllCall("wlanapi.dll\WFDOpenHandle", "uint", dwClientVersion, pdwNegotiatedVersionMarshal, pdwNegotiatedVersion, "ptr", phClientHandle, "uint")
        return result
    }

    /**
     * Closes a handle to the Wi-Fi Direct service.
     * @param {HANDLE} hClientHandle A client handle to the Wi-Fi Direct service. This handle was  obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wfdopenhandle">WFDOpenHandle</a> function.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value may be one of the following return codes.
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
     * The handle is invalid. 
     * 
     * This error is returned if the handle specified in the <i>hClientHandle</i>  parameter was not found in the handle table.
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
     * The parameter is incorrect. 
     * 
     * This error is returned if the <i>hClientHandle</i> parameter is <b>NULL</b> or not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_STATUS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Various error codes.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wlanapi/nf-wlanapi-wfdclosehandle
     * @since windows8.0
     */
    static WFDCloseHandle(hClientHandle) {
        hClientHandle := hClientHandle is Win32Handle ? NumGet(hClientHandle, "ptr") : hClientHandle

        result := DllCall("wlanapi.dll\WFDCloseHandle", "ptr", hClientHandle, "uint")
        return result
    }

    /**
     * Starts an on-demand connection to a specific Wi-Fi Direct device, which has been previously paired through the Windows Pairing experience.
     * @param {HANDLE} hClientHandle A client handle to the Wi-Fi Direct service. This handle was  obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wfdopenhandle">WFDOpenHandle</a> function.
     * @param {Pointer<Pointer<Integer>>} pDeviceAddress A pointer to the target device’s Wi-Fi Direct device address. This is the MAC address of the target Wi-Fi device.
     * @param {Pointer<Void>} pvContext An optional context pointer which is passed to the callback function specified in the <i>pfnCallback</i> parameter.
     * @param {Pointer<WFD_OPEN_SESSION_COMPLETE_CALLBACK>} pfnCallback A pointer to the callback function to be called once the <b>WFDStartOpenSession</b> request has completed.
     * @param {Pointer<HANDLE>} phSessionHandle A handle to this specific Wi-Fi Direct session.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value may be one of the following return codes.
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
     * The handle is invalid. 
     * 
     * This error is returned if the handle specified in the <i>hClientHandle</i>  parameter was not found in the handle table.
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
     * The parameter is incorrect. 
     * 
     * This error is returned if the <i>hClientHandle</i> parameter is <b>NULL</b> or not valid. This error is also returned if the <i>pDeviceAddress</i> parameter is <b>NULL</b>, the <i>pfnCallback</i> parameter is <b>NULL</b>, or the <i>phSessionHandle</i> parameter is <b>NULL</b>. This value is also returned if the <i>dwClientVersion</i> parameter is not equal to <b>WFD_API_VERSION</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The group or resource is not in the correct state to perform the requested operation.
     * 
     * This error is returned if the Wi-Fi Direct service is disabled by group policy on a domain.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SERVICE_NOT_ACTIVE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service has not been started.
     * 
     * This error is returned if the WLAN AutoConfig Service is not running.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_STATUS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Various error codes.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wlanapi/nf-wlanapi-wfdstartopensession
     * @since windows8.0
     */
    static WFDStartOpenSession(hClientHandle, pDeviceAddress, pvContext, pfnCallback, phSessionHandle) {
        hClientHandle := hClientHandle is Win32Handle ? NumGet(hClientHandle, "ptr") : hClientHandle

        pDeviceAddressMarshal := pDeviceAddress is VarRef ? "ptr*" : "ptr"
        pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

        result := DllCall("wlanapi.dll\WFDStartOpenSession", "ptr", hClientHandle, pDeviceAddressMarshal, pDeviceAddress, pvContextMarshal, pvContext, "ptr", pfnCallback, "ptr", phSessionHandle, "uint")
        return result
    }

    /**
     * Indicates that the application wants to cancel a pending WFDStartOpenSession function that has not completed.
     * @param {HANDLE} hSessionHandle A session handle to a Wi-Fi Direct session to cancel. This is a session handle previously returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wfdstartopensession">WFDStartOpenSession</a> function.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value may be one of the following return codes.
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
     * The handle is invalid. 
     * 
     * This error is returned if the handle specified in the <i>hSessionHandle</i>  parameter was not found in the handle table.
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
     * The parameter is incorrect. 
     * 
     * This error is returned if the <i>hSessionHandle</i> parameter is <b>NULL</b> or not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_STATUS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Various error codes.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wlanapi/nf-wlanapi-wfdcancelopensession
     * @since windows8.0
     */
    static WFDCancelOpenSession(hSessionHandle) {
        hSessionHandle := hSessionHandle is Win32Handle ? NumGet(hSessionHandle, "ptr") : hSessionHandle

        result := DllCall("wlanapi.dll\WFDCancelOpenSession", "ptr", hSessionHandle, "uint")
        return result
    }

    /**
     * Retrieves and applies a stored profile for a Wi-Fi Direct legacy device.
     * @param {HANDLE} hClientHandle A <b>HANDLE</b> to the Wi-Fi Direct service for this session. This parameter is retrieved using the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wfdopenhandle">WFDOpenHandle</a> function.
     * @param {Pointer<Pointer<Integer>>} pLegacyMacAddress A pointer to Wi-Fi Direct device address of the legacy client device.
     * @param {Pointer<HANDLE>} phSessionHandle A pointer to a <b>HANDLE</b> to receive the handle to the Wi-Fi Direct service for this session.
     * 
     * If the <b>WFDOpenLegacySession</b> function is successful, a handle to the Wi-Fi Direct service to use in this session is returned.
     * @param {Pointer<Guid>} pGuidSessionInterface A pointer to the GUID of the network interface for this session.
     * 
     * If the <b>WFDOpenLegacySession</b> function is successful, a GUID of the network interface on which Wi-Fi Direct session is returned.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value may be one of the following return codes.
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
     * The parameter is incorrect. 
     * 
     * This error is returned if the <i>phClientHandle</i> or the <i>pLegacyMacAddress</i> parameter is <b>NULL</b>. 
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
     * Not enough storage is available to process this command.
     * 
     * This error is returned if the system was unable to allocate memory to create the client context.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_STATUS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Various error codes.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wlanapi/nf-wlanapi-wfdopenlegacysession
     * @since windows8.0
     */
    static WFDOpenLegacySession(hClientHandle, pLegacyMacAddress, phSessionHandle, pGuidSessionInterface) {
        hClientHandle := hClientHandle is Win32Handle ? NumGet(hClientHandle, "ptr") : hClientHandle

        pLegacyMacAddressMarshal := pLegacyMacAddress is VarRef ? "ptr*" : "ptr"

        result := DllCall("wlanapi.dll\WFDOpenLegacySession", "ptr", hClientHandle, pLegacyMacAddressMarshal, pLegacyMacAddress, "ptr", phSessionHandle, "ptr", pGuidSessionInterface, "uint")
        return result
    }

    /**
     * Closes a session after a previously successful call to the WFDStartOpenSession function.
     * @param {HANDLE} hSessionHandle A session handle to a Wi-Fi Direct session. This is a session handle previously returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wfdstartopensession">WFDStartOpenSession</a> function.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value may be one of the following return codes.
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
     * The handle is invalid. 
     * 
     * This error is returned if the handle specified in the <i>hSessionHandle</i>  parameter was not found in the handle table.
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
     * The parameter is incorrect. 
     * 
     * This error is returned if the <i>hSessionHandle</i> parameter is <b>NULL</b> or not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The group or resource is not in the correct state to perform the requested operation.
     * 
     * This error is returned if the Wi-Fi Direct service is disabled by group policy on a domain.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_STATUS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Various error codes.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wlanapi/nf-wlanapi-wfdclosesession
     * @since windows8.0
     */
    static WFDCloseSession(hSessionHandle) {
        hSessionHandle := hSessionHandle is Win32Handle ? NumGet(hSessionHandle, "ptr") : hSessionHandle

        result := DllCall("wlanapi.dll\WFDCloseSession", "ptr", hSessionHandle, "uint")
        return result
    }

    /**
     * Updates device visibility for the Wi-Fi Direct device address for a given installed Wi-Fi Direct device node.
     * @param {Pointer<Pointer<Integer>>} pDeviceAddress A pointer to the Wi-Fi Direct device address of the client device.
     * 
     * This device address must be obtained from a Device Node created as a result of the Inbox pairing experience.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value may be one of the following return codes.
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
     * The parameter is incorrect. 
     * 
     * This error is returned if the  <i>pDeviceAddress</i> parameter is <b>NULL</b>. 
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
     * Not enough storage is available to process this command.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_STATUS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Various error codes.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wlanapi/nf-wlanapi-wfdupdatedevicevisibility
     * @since windows8.0
     */
    static WFDUpdateDeviceVisibility(pDeviceAddress) {
        pDeviceAddressMarshal := pDeviceAddress is VarRef ? "ptr*" : "ptr"

        result := DllCall("wlanapi.dll\WFDUpdateDeviceVisibility", pDeviceAddressMarshal, pDeviceAddress, "uint")
        return result
    }

;@endregion Methods
}
