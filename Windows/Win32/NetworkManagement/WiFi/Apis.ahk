#Requires AutoHotkey v2.0.0 64-bit

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
     * @remarks
     * The version number specified by <i>dwClientVersion</i> and <i>pdwNegotiatedVersion</i> is a composite version number made up of both major and minor versions. The major version is specified by the low-order word, and the minor version is specified by the high-order word. The macros <c>WLAN_API_VERSION_MAJOR(_v)</code> and <code>WLAN_API_VERSION_MINOR(_v)</code> return the major and minor version numbers respectively. You can construct a version number using the macro <code>WLAN_API_MAKE_VERSION(_major, _minor)</c>.
     * 
     * <b>Windows XP with SP3 and Wireless LAN API for Windows XP with SP2:  </b><b>WlanOpenHandle</b> will return an error message if the Wireless Zero Configuration (WZC) service has not been started or if the WZC service is not responsive.
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
     * @param {Pointer<UInt32>} pdwNegotiatedVersion The version of the WLAN API that will be used in this session.  This value is usually the highest version supported by both the client and server.
     * @param {Pointer<Void>} phClientHandle A handle for the client to use in this session.  This handle is used by other functions throughout the session.
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
     * @see https://learn.microsoft.com/windows/win32/api/wlanapi/nf-wlanapi-wlanopenhandle
     * @since windows6.0.6000
     */
    static WlanOpenHandle(dwClientVersion, pdwNegotiatedVersion, phClientHandle) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        result := DllCall("wlanapi.dll\WlanOpenHandle", "uint", dwClientVersion, "ptr", pReserved, "uint*", pdwNegotiatedVersion, "ptr", phClientHandle, "uint")
        return result
    }

    /**
     * Closes a connection to the server.
     * @remarks
     * After a connection has been closed, any attempted use of the closed handle can cause unexpected errors.  Upon closing, all outstanding notifications are discarded.
     * 
     *   Do not call <b>WlanCloseHandle</b> from a callback function. If the client is in the middle of a notification callback when <b>WlanCloseHandle</b> is called, the function waits for the callback to finish before returning a value.  Calling this function inside a callback function will result in the call never completing. If both the callback function and the thread that closes the handle try to acquire the same lock, a deadlock may occur. In addition, do not call <b>WlanCloseHandle</b> from the <b>DllMain</b> function in an application DLL. This could also cause a deadlock.
     * @param {Pointer<Void>} hClientHandle The client's session handle, which identifies the connection to be closed. This handle was  obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
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
     * @see https://learn.microsoft.com/windows/win32/api/wlanapi/nf-wlanapi-wlanclosehandle
     * @since windows6.0.6000
     */
    static WlanCloseHandle(hClientHandle) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        result := DllCall("wlanapi.dll\WlanCloseHandle", "ptr", hClientHandle, "ptr", pReserved, "uint")
        return result
    }

    /**
     * Enumerates all of the wireless LAN interfaces currently enabled on the local computer.
     * @remarks
     * The <b>WlanEnumInterfaces</b> function allocates memory for the list of returned interfaces that is returned in the buffer pointed to by the <i>ppInterfaceList</i> parameter when the function succeeds. The memory used for the buffer pointed to by <i>ppInterfaceList</i> parameter should be released by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanfreememory">WlanFreeMemory</a> function after the buffer is no longer needed.
     * @param {Pointer<Void>} hClientHandle The client's session handle, obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
     * @param {Pointer<WLAN_INTERFACE_INFO_LIST>} ppInterfaceList A pointer to storage for a pointer to receive the returned list of wireless LAN interfaces in a <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_interface_info_list">WLAN_INTERFACE_INFO_LIST</a> structure.
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
     * @see https://learn.microsoft.com/windows/win32/api/wlanapi/nf-wlanapi-wlanenuminterfaces
     * @since windows6.0.6000
     */
    static WlanEnumInterfaces(hClientHandle, ppInterfaceList) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        result := DllCall("wlanapi.dll\WlanEnumInterfaces", "ptr", hClientHandle, "ptr", pReserved, "ptr", ppInterfaceList, "uint")
        return result
    }

    /**
     * Sets parameters for the automatic configuration service.
     * @remarks
     * The <b>WlanSetAutoConfigParameter</b> function sets parameters used by Auto Configuration Module (ACM), the wireless configuration component supported on Windows Vista and  later.
     * 
     * Depending on the value of the <i>OpCode</i> parameter, the data pointed to by <i>pData</i> will be converted to a boolean value before the automatic configuration parameter is set. If <i>pData</i> points to 0, then the parameter is set to <b>FALSE</b>; otherwise, the parameter is set to <b>TRUE</b>.
     * @param {Pointer<Void>} hClientHandle The client's session handle, obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
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
     * Access is denied. This error is returned if the caller does not have sufficient permissions to set the configuration parameter when the <i>OpCode</i> parameter is wlan_autoconf_opcode_show_denied_networks or wlan_autoconf_opcode_allow_virtual_station_extensibility. When the <i>OpCode</i> parameter is set to one of these values, the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlansetautoconfigparameter">WlanSetAutoConfigParameter</a>  function retrieves the discretionary access control list (DACL) stored for opcode object. If the DACL does not contain an access control entry (ACE) that grants WLAN_WRITE_ACCESS permission to the access token of the calling thread, then <b>WlanSetAutoConfigParameter</b>  returns <b>ERROR_ACCESS_DENIED</b>.
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
     * A parameter was bad. This error is returned if the <i>hClientHandle</i> parameter is <b>NULL</b>, the <i>pData</i> parameter is <b>NULL</b>, or the <i>pReserved</i> parameter is not <b>NULL</b>. This error is also returned if <i>OpCode</i> parameter specified is not one of the <a href="https://docs.microsoft.com/windows/win32/api/wlanapi/ne-wlanapi-wlan_autoconf_opcode-r1">WLAN_AUTOCONF_OPCODE</a> values for a configuration parameter that can be set. This error is also returned if the <i>dwDataSize</i> parameter is not set to <c>sizeof(BOOL)</code>, or the <i>dwDataSize</i> is not set to <code>sizeof(BOOL)</c> depending on the value of the <i>OpCode</i> parameter.
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
     * @see https://learn.microsoft.com/windows/win32/api/wlanapi/nf-wlanapi-wlansetautoconfigparameter
     * @since windows6.0.6000
     */
    static WlanSetAutoConfigParameter(hClientHandle, OpCode, dwDataSize, pData) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        result := DllCall("wlanapi.dll\WlanSetAutoConfigParameter", "ptr", hClientHandle, "int", OpCode, "uint", dwDataSize, "ptr", pData, "ptr", pReserved, "uint")
        return result
    }

    /**
     * Queries for the parameters of the auto configuration service.
     * @remarks
     * The <b>WlanQueryAutoConfigParameter</b> function queries for the parameters used by Auto Configuration Module (ACM), the wireless configuration component supported on Windows Vista and  later.
     * @param {Pointer<Void>} hClientHandle The client's session handle, obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
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
     * @param {Pointer<UInt32>} pdwDataSize Specifies the size of the <i>ppData</i> parameter, in bytes.
     * @param {Pointer<Void>} ppData Pointer to the memory that contains the queried value for the parameter specified in <i>OpCode</i>.
     * 
     * <div class="alert"><b>Note</b>  If <i>OpCode</i> is set to <b>wlan_autoconf_opcode_show_denied_networks</b>, then the pointer referenced by <i>ppData</i> may point to an integer value. If the pointer referenced by <i>ppData</i> points to 0, then the integer value should be converted  to the boolean value <b>FALSE</b>. If the pointer referenced by <i>ppData</i> points to a nonzero integer, then the integer value should be converted  to the boolean value <b>TRUE</b>. </div>
     * <div> </div>
     * @param {Pointer<Int32>} pWlanOpcodeValueType A <a href="https://docs.microsoft.com/windows/win32/api/wlanapi/ne-wlanapi-wlan_opcode_value_type-r1">WLAN_OPCODE_VALUE_TYPE</a> value.
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
     * When called with <i>OpCode</i> set to <b>wlan_autoconf_opcode_show_denied_networks</b>, <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanqueryautoconfigparameter">WlanQueryAutoConfigParameter</a> retrieves the discretionary access control list (DACL) stored with the  <b>wlan_secure_show_denied</b> object. If the DACL does not contain an access control entry (ACE) that grants WLAN_READ_ACCESS permission to the access token of the calling thread, then <b>WlanQueryAutoConfigParameter</b>  returns <b>ERROR_ACCESS_DENIED</b>.
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
     * @see https://learn.microsoft.com/windows/win32/api/wlanapi/nf-wlanapi-wlanqueryautoconfigparameter
     * @since windows6.0.6000
     */
    static WlanQueryAutoConfigParameter(hClientHandle, OpCode, pdwDataSize, ppData, pWlanOpcodeValueType) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        result := DllCall("wlanapi.dll\WlanQueryAutoConfigParameter", "ptr", hClientHandle, "int", OpCode, "ptr", pReserved, "uint*", pdwDataSize, "ptr", ppData, "int*", pWlanOpcodeValueType, "uint")
        return result
    }

    /**
     * Retrieves the capabilities of an interface.
     * @remarks
     * The caller is responsible for calling the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanfreememory">WlanFreeMemory</a> function to free the memory allocated to <i>ppCapability</i>.
     * @param {Pointer<Void>} hClientHandle The client's session handle, obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
     * @param {Pointer<Guid>} pInterfaceGuid The GUID of this interface.
     * @param {Pointer<WLAN_INTERFACE_CAPABILITY>} ppCapability A <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_interface_capability">WLAN_INTERFACE_CAPABILITY</a> structure that contains information about the capabilities of the specified interface.
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
     * @see https://learn.microsoft.com/windows/win32/api/wlanapi/nf-wlanapi-wlangetinterfacecapability
     * @since windows6.0.6000
     */
    static WlanGetInterfaceCapability(hClientHandle, pInterfaceGuid, ppCapability) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        result := DllCall("wlanapi.dll\WlanGetInterfaceCapability", "ptr", hClientHandle, "ptr", pInterfaceGuid, "ptr", pReserved, "ptr", ppCapability, "uint")
        return result
    }

    /**
     * Sets user-configurable parameters.
     * @remarks
     * When   <i>OpCode</i> is set to  <b>wlan_intf_opcode_current_operation_mode</b>,  the <b>WlanSetInterface</b>  function sets the current operation mode of the wireless interface. For more information about operation modes, see <a href="https://docs.microsoft.com/windows-hardware/drivers/network/native-802-11-operation-modes">Native 802.11 Operation Modes</a>. Two operation modes are supported: <b>DOT11_OPERATION_MODE_EXTENSIBLE_STATION</b> and  <b>DOT11_OPERATION_MODE_NETWORK_MONITOR</b>. The operation mode constants are defined in the header file Windot11.h. If <i>pData</i> does not point to one of these values when <i>OpCode</i> is set to  <b>wlan_intf_opcode_current_operation_mode</b>, the  <b>WlanSetInterface</b>   function will fail with an error.
     * 
     * To enable or disable the automatic configuration service   at the command line, which is functionally equivalent to calling <b>WlanSetInterface</b> with  <i>OpCode</i> set to  <b>wlan_intf_opcode_autoconf_enabled</b>, use the <b>netsh wlan setautoconfig</b> command. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/cc755301(v=ws.10)">Netsh Commands for Wireless Local Area Network (wlan)</a>. 
     * 
     * The software radio state can be changed by calling the <b>WlanSetInterface</b> function.   The hardware radio state cannot be changed by calling the <b>WlanSetInterface</b> function.  When the <i>OpCode</i> parameter is set to <b>wlan_intf_opcode_radio_state</b>,  the <b>WlanSetInterface</b> function sets the software radio state of a specific PHY. The <i>pData</i> parameter must point to a <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_phy_radio_state">WLAN_PHY_RADIO_STATE</a> structure with the new radio state values to use. The <b>dot11HardwareRadioState</b> member of the <b>WLAN_PHY_RADIO_STATE</b> structure is ignored when  the <b>WlanSetInterface</b> function is called with the <i>OpCode</i> parameter set to <b>wlan_intf_opcode_radio_state</b> and the <i>pData</i> parameter points to a <b>WLAN_PHY_RADIO_STATE</b> structure. The radio state of a PHY is off if either the software radio state (<b>dot11SoftwareRadioState</b> member of the <b>WLAN_PHY_RADIO_STATE</b> structure) or the hardware radio state (<b>dot11HardwareRadioState</b> member of the <b>WLAN_PHY_RADIO_STATE</b> structure) is off.  
     * 
     * Changing the software radio state of a physical network interface could cause related changes in the state of the wireless Hosted Network or virtual wireless adapter radio states. The PHYs of every virtual wireless adapter are linked. For more information, see the <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/about-the-wireless-hosted-network">About the Wireless Hosted Network</a>.
     * @param {Pointer<Void>} hClientHandle The client's session handle, obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
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
     * @see https://learn.microsoft.com/windows/win32/api/wlanapi/nf-wlanapi-wlansetinterface
     * @since windows6.0.6000
     */
    static WlanSetInterface(hClientHandle, pInterfaceGuid, OpCode, dwDataSize, pData) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        result := DllCall("wlanapi.dll\WlanSetInterface", "ptr", hClientHandle, "ptr", pInterfaceGuid, "int", OpCode, "uint", dwDataSize, "ptr", pData, "ptr", pReserved, "uint")
        return result
    }

    /**
     * The WlanQueryInterface function queries various parameters of a specified interface.
     * @remarks
     * The caller is responsible for using <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanfreememory">WlanFreeMemory</a> to free the memory allocated for <i>ppData</i>.
     * 
     * When   <i>OpCode</i> is set to  <b>wlan_intf_opcode_current_operation_mode</b>,  <b>WlanQueryInterface</b>  queries the current operation mode of the wireless interface. For more information about operation modes, see <a href="https://www.microsoft.com/?ref=go">Native 802.11 Operation Modes</a>. Two operation modes are supported: <b>DOT11_OPERATION_MODE_EXTENSIBLE_STATION</b> and  <b>DOT11_OPERATION_MODE_NETWORK_MONITOR</b>. The operation mode constants are defined in the header file Windot11.h. <i>ppData</i> will point to one of these two values.
     * @param {Pointer<Void>} hClientHandle The client's session handle, obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
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
     * @param {Pointer<UInt32>} pdwDataSize The size of the <i>ppData</i> parameter, in bytes.
     * @param {Pointer<Void>} ppData Pointer to the memory location that contains the queried value of the parameter specified by the <i>OpCode</i> parameter.
     * 
     * <div class="alert"><b>Note</b>  If <i>OpCode</i> is set to <b>wlan_intf_opcode_autoconf_enabled</b>, <b>wlan_intf_opcode_background_scan_enabled</b>, or <b>wlan_intf_opcode_media_streaming_mode</b>, then the pointer referenced by <i>ppData</i> may point to an integer value. If the pointer referenced by <i>ppData</i> points to 0, then the integer value should be converted  to the boolean value <b>FALSE</b>. If the pointer referenced by <i>ppData</i> points to a nonzero integer, then the integer value should be converted  to the boolean value <b>TRUE</b>. </div>
     * <div> </div>
     * @param {Pointer<Int32>} pWlanOpcodeValueType If passed a non-<b>NULL</b> value, points to a <a href="https://docs.microsoft.com/windows/win32/api/wlanapi/ne-wlanapi-wlan_opcode_value_type-r1">WLAN_OPCODE_VALUE_TYPE</a> value that specifies the type of opcode returned. This parameter may be <b>NULL</b>.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value may be one of the following return codes.
     * @see https://learn.microsoft.com/windows/win32/api/wlanapi/nf-wlanapi-wlanqueryinterface
     * @since windows6.0.6000
     */
    static WlanQueryInterface(hClientHandle, pInterfaceGuid, OpCode, pdwDataSize, ppData, pWlanOpcodeValueType) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        result := DllCall("wlanapi.dll\WlanQueryInterface", "ptr", hClientHandle, "ptr", pInterfaceGuid, "int", OpCode, "ptr", pReserved, "uint*", pdwDataSize, "ptr", ppData, "int*", pWlanOpcodeValueType, "uint")
        return result
    }

    /**
     * Provides a mechanism for independent hardware vendor (IHV) control of WLAN drivers or services.
     * @param {Pointer<Void>} hClientHandle The client's session handle, obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
     * @param {Pointer<Guid>} pInterfaceGuid The GUID of the interface.
     * @param {Integer} Type A <a href="https://docs.microsoft.com/windows/win32/api/wlanapi/ne-wlanapi-wlan_ihv_control_type-r1">WLAN_IHV_CONTROL_TYPE</a> structure that specifies the type of software bypassed by the IHV control function.
     * @param {Integer} dwInBufferSize The size, in bytes, of the input buffer.
     * @param {Pointer} pInBuffer A generic buffer for driver or service interface input.
     * @param {Integer} dwOutBufferSize The size, in bytes, of the output buffer.
     * @param {Pointer} pOutBuffer A generic buffer for driver or service interface output.
     * @param {Pointer<UInt32>} pdwBytesReturned The number of bytes returned.
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
     * The caller does not have sufficient permissions to perform this operation. When called, <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanihvcontrol">WlanIhvControl</a>  retrieves the discretionary access control list (DACL) stored with the  <b>wlan_secure_ihv_control</b> object. If the DACL does not contain an access control entry (ACE) that grants WLAN_WRITE_ACCESS permission to the access token of the calling thread, then <b>WlanIhvControl</b>    returns <b>ERROR_ACCESS_DENIED</b>.
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
     * @see https://learn.microsoft.com/windows/win32/api/wlanapi/nf-wlanapi-wlanihvcontrol
     * @since windows6.0.6000
     */
    static WlanIhvControl(hClientHandle, pInterfaceGuid, Type, dwInBufferSize, pInBuffer, dwOutBufferSize, pOutBuffer, pdwBytesReturned) {
        result := DllCall("wlanapi.dll\WlanIhvControl", "ptr", hClientHandle, "ptr", pInterfaceGuid, "int", Type, "uint", dwInBufferSize, "ptr", pInBuffer, "uint", dwOutBufferSize, "ptr", pOutBuffer, "uint*", pdwBytesReturned, "uint")
        return result
    }

    /**
     * Requests a scan for available networks on the indicated interface.
     * @remarks
     * The <b>WlanScan</b> function requests that the native 802.11 Wireless LAN driver scan for available wireless networks. The driver may or may not send probe requests (an active scan) depending on its implementation and the values passed in the <i>pDot11Ssid</i> and <i>pIeData</i> parameters. 
     * 
     * If the <i>pIeData</i> parameter is not <b>NULL</b>, the driver will send probe requests during the scan. The probe requests include the information element (IE) pointed to by the <i>pIeData</i> parameter. For instance, the Wi-Fi Protected Setup (WPS) IE can be included in the probe requests to discover WPS-capable access points. The buffer pointed to by the <i>pIeData</i> parameter must contain the complete IE starting from the Element ID.
     * 
     * The <i>pIeData</i> parameter passed to the <b>WlanScan</b> function can contain a pointer to an optional <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_raw_data">WLAN_RAW_DATA</a> structure that contains a proximity service discovery (PSD) IE data entry.   
     * 
     * When used to store a PSD IE, the <b>DOT11_PSD_IE_MAX_DATA_SIZE</b> constant defined in the <i>Wlanapi.h</i> header file is the maximum value of the <b>dwDataSize</b> member.<table>
     * <tr>
     * <th>Constant</th>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td><b>DOT11_PSD_IE_MAX_DATA_SIZE</b></td>
     * <td>240</td>
     * <td>The maximum data size, in bytes, of a PSD IE data entry.</td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * 
     * For more information about PSD IEs, including a discussion of the format of a PSD IE, see the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlansetpsdiedatalist">WlanSetPsdIEDataList</a> function.
     * 
     * When the <b>WlanScan</b> function is called, the native 802.11 Wireless LAN driver may flush the current list of available wireless networks before the scan is initiated. Applications should not assume that calling the <b>WlanScan</b> function will add to the existing list of available wireless networks returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlangetnetworkbsslist">WlanGetNetworkBssList</a> or <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlangetavailablenetworklist">WlanGetAvailableNetworkList</a> functions from previous scans.
     * 
     * The <b>WlanScan</b> function returns immediately.  To be notified when the network scan is complete, a client on Windows Vista and later  must register for notifications by calling <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanregisternotification">WlanRegisterNotification</a>. The <i>dwNotifSource</i> parameter passed to the <b>WlanRegisterNotification</b> function must have the WLAN_NOTIFICATION_SOURCE_ACM bit set to register for notifications generated by the auto configuration module. Wireless network drivers that meet Windows logo requirements are required to complete a <b>WlanScan</b> function request in 4 seconds. 
     * 
     * The Wireless LAN Service does not send notifications when available wireless networks change. The Wireless LAN Service does not track changes to the list of available networks across multiple scans. The current default behavior is that the Wireless LAN Service only asks the wireless interface driver to scan for wireless networks every 60 seconds, and in some cases (when already connected to wireless network) the Wireless LAN Service does not ask for scans at all.
     *  The <b>WlanScan</b> function can be used by an application to track wireless network changes.  The application should first register for WLAN_NOTIFICATION_SOURCE_ACM notifications. The <b>WlanScan</b> function can then be called to initiate a scan. The application should then wait to receive the wlan_notification_acm_scan_complete notification or timeout after 4 seconds. Then the application can call the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlangetnetworkbsslist">WlanGetNetworkBssList</a> or <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlangetavailablenetworklist">WlanGetAvailableNetworkList</a> function to retrieve a list of available wireless networks. This process can be repeated periodically with the application keeping tracking of changes to available wireless networks.
     * 
     * The <b>WlanScan</b> function returns immediately and does not provide a notification when the scan is complete on Windows XP with SP3 or the Wireless LAN API for Windows XP with SP2.  
     * 
     * Since it becomes more difficult for a wireless interface to send and receive data packets while a scan is occurring, the <b>WlanScan</b> function may increase latency until the network scan is complete.
     * @param {Pointer<Void>} hClientHandle The client's session handle, obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
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
     * @see https://learn.microsoft.com/windows/win32/api/wlanapi/nf-wlanapi-wlanscan
     * @since windows6.0.6000
     */
    static WlanScan(hClientHandle, pInterfaceGuid, pDot11Ssid, pIeData) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        result := DllCall("wlanapi.dll\WlanScan", "ptr", hClientHandle, "ptr", pInterfaceGuid, "ptr", pDot11Ssid, "ptr", pIeData, "ptr", pReserved, "uint")
        return result
    }

    /**
     * Retrieves the list of available networks on a wireless LAN interface.
     * @remarks
     * The <b>WlanGetAvailableNetworkList</b> function allocates memory for the list of available networks returned in the buffer pointed to by the <i>ppAvailableNetworkList</i> parameter when the function succeeds. The memory used for the buffer pointed to by <i>ppAvailableNetworkList</i> parameter should be released by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanfreememory">WlanFreeMemory</a> function after the buffer is no longer needed.
     * 
     * 
     * There is a hotfix available for  Wireless LAN API for Windows XP with SP2 that can help improve the performance of applications that call <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanfreememory">WlanFreeMemory</a> and <b>WlanGetAvailableNetworkList</b> many times.
     * @param {Pointer<Void>} hClientHandle The client's session handle, obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
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
     * @param {Pointer<WLAN_AVAILABLE_NETWORK_LIST>} ppAvailableNetworkList A pointer to storage for a pointer to receive the returned list of visible networks in a <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_available_network_list">WLAN_AVAILABLE_NETWORK_LIST</a> structure.
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
     * @see https://learn.microsoft.com/windows/win32/api/wlanapi/nf-wlanapi-wlangetavailablenetworklist
     * @since windows6.0.6000
     */
    static WlanGetAvailableNetworkList(hClientHandle, pInterfaceGuid, dwFlags, ppAvailableNetworkList) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        result := DllCall("wlanapi.dll\WlanGetAvailableNetworkList", "ptr", hClientHandle, "ptr", pInterfaceGuid, "uint", dwFlags, "ptr", pReserved, "ptr", ppAvailableNetworkList, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hClientHandle 
     * @param {Pointer<Guid>} pInterfaceGuid 
     * @param {Integer} dwFlags 
     * @param {Pointer<WLAN_AVAILABLE_NETWORK_LIST_V2>} ppAvailableNetworkList 
     * @returns {Integer} 
     */
    static WlanGetAvailableNetworkList2(hClientHandle, pInterfaceGuid, dwFlags, ppAvailableNetworkList) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        result := DllCall("wlanapi.dll\WlanGetAvailableNetworkList2", "ptr", hClientHandle, "ptr", pInterfaceGuid, "uint", dwFlags, "ptr", pReserved, "ptr", ppAvailableNetworkList, "uint")
        return result
    }

    /**
     * Retrieves a list of the basic service set (BSS) entries of the wireless network or networks on a given wireless LAN interface.
     * @remarks
     * The <b>WlanGetNetworkBssList</b> function retrieves the basic service set list for each wireless network or networks accessible on a given interface. The list of information returned for each wireless network also contains a list of information elements returned by each access point for an infrastructure BSS network or a network peer for an independent BSS network (ad hoc network). The information is returned as a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_bss_list">WLAN_BSS_LIST</a> structure in the <i>ppWlanBssList</i> parameter.  The <b>WLAN_BSS_LIST</b> structure contains an item count followed by an array of <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_bss_entry">WLAN_BSS_ENTRY</a> structure entries.  
     * 
     * Since the information returned by the <b>WlanGetNetworkBssList</b> function is sent by an access point for an infrastructure BSS network or by a network peer for an independent BSS network (ad hoc network), the information returned should not be trusted. The <b>ulIeOffset</b> and <b>ulIeSize</b>  members in the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_bss_entry">WLAN_BSS_ENTRY</a> structure should be used to determine the size of the information element data blob in the <b>WLAN_BSS_ENTRY</b> structure, not the data in the information element data blob itself. The <b>WlanGetNetworkBssList</b> function does not validate that any information returned in the information element data blob pointed to by the <b>ulIeOffset</b> member is a valid information element as defined by the IEEE 802.11 standards for wireless LANs.
     * 
     * If the <i>pDot11Ssid</i> parameter is specified (not <b>NULL</b>), then the <i>dot11BssType</i> parameter specified must be set to either <b>dot11_BSS_type_infrastructure</b> for an infrastructure BSS network or <b>dot11_BSS_type_independent</b> for an independent BSS network (ad hoc network). If the <i>dot11BssType</i> parameter is set to <b>dot11_BSS_type_any</b>, then the <b>WlanGetNetworkBssList</b>  function returns ERROR_SUCCESS  but no BSS entries will be returned.
     * 
     * To return a list of all the infrastructure BSS networks and independent BSS  networks (ad hoc networks) on a wireless LAN interface, set the <i>pDot11Ssid</i> parameter to <b>NULL</b>. When the wireless LAN interface is also operating as  a Wireless Hosted Network , the BSS list will contain an entry for the BSS created for the Wireless Hosted Network.
     * 
     * 
     * 
     * The <b>WlanGetNetworkBssList</b>  function returns ERROR_SUCCESS when an empty BSS list is returned by the WLAN AutoConfig Service. An application that calls  the <b>WlanGetNetworkBssList</b>  function must check that the <b>dwNumberOfItems</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_bss_list">WLAN_BSS_LIST</a> pointed to by the <i>ppWlanBssList</i> parameter is not zero before accessing the <b>wlanBssEntries[0]</b> member in <b>WLAN_BSS_LIST</b> structure. 
     * 
     * The <b>WlanGetNetworkBssList</b> function allocates memory for the basic service set list that is returned in a buffer pointed to by the <i>ppWlanBssList</i> parameter when the function succeeds. The memory used for the buffer pointed to by <i>ppWlanBssList</i> parameter should be released by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanfreememory">WlanFreeMemory</a> function after the buffer is no longer needed.
     * @param {Pointer<Void>} hClientHandle The client's session handle, obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
     * @param {Pointer<Guid>} pInterfaceGuid A pointer to the GUID of the wireless LAN interface to be queried.
     * 
     *  The GUID of each wireless LAN interface enabled on a local computer can be determined using the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanenuminterfaces">WlanEnumInterfaces</a> function.
     * @param {Pointer<DOT11_SSID>} pDot11Ssid A pointer to a <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/dot11-ssid">DOT11_SSID</a> structure that specifies the SSID of the network from which the BSS list is requested.  This parameter is optional. When set to <b>NULL</b>, the returned list contains all of available BSS entries on a wireless LAN interface.
     * 
     * If a pointer to a <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/dot11-ssid">DOT11_SSID</a> structure is specified, the SSID length specified in the <b>uSSIDLength</b> member of <b>DOT11_SSID</b> structure must be less than or equal to <b>DOT11_SSID_MAX_LENGTH</b> defined in the <i>Wlantypes.h</i> header file. In addition, the <i>dot11BssType</i> parameter must be set to either <b>dot11_BSS_type_infrastructure</b> or <b>dot11_BSS_type_independent</b> and the <i>bSecurityEnabled</i> parameter must be specified.
     * @param {Integer} dot11BssType The BSS type of the network. This parameter is ignored if the SSID of the network for the BSS list is unspecified (the <i>pDot11Ssid</i> parameter is <b>NULL</b>).
     * @param {Integer} bSecurityEnabled A value that indicates whether security is enabled on the network.  This parameter is only valid when the SSID of the network for the BSS list is specified (the <i>pDot11Ssid</i> parameter is not <b>NULL</b>).
     * @param {Pointer<WLAN_BSS_LIST>} ppWlanBssList A pointer to storage for a pointer to receive the returned list of of BSS entries in a <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_bss_list">WLAN_BSS_LIST</a> structure. 
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
     * @see https://learn.microsoft.com/windows/win32/api/wlanapi/nf-wlanapi-wlangetnetworkbsslist
     * @since windows6.0.6000
     */
    static WlanGetNetworkBssList(hClientHandle, pInterfaceGuid, pDot11Ssid, dot11BssType, bSecurityEnabled, ppWlanBssList) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        result := DllCall("wlanapi.dll\WlanGetNetworkBssList", "ptr", hClientHandle, "ptr", pInterfaceGuid, "ptr", pDot11Ssid, "int", dot11BssType, "int", bSecurityEnabled, "ptr", pReserved, "ptr", ppWlanBssList, "uint")
        return result
    }

    /**
     * Attempts to connect to a specific network.
     * @remarks
     * The <b>WlanConnect</b> function returns immediately.  To be notified when a connection is established or when no further connections will be attempted, a client must register for notifications by calling <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanregisternotification">WlanRegisterNotification</a>.
     * 
     * The <b>strProfile</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_connection_parameters">WLAN_CONNECTION_PARAMETERS</a> structure pointed to by <i>pConnectionParameters</i> specifies the profile to use for connection. If this profile is an all-user profile, the <b>WlanConnect</b>  caller must have execute access on the profile. Otherwise, the <b>WlanConnect</b> call will fail with return value ERROR_ACCESS_DENIED. The permissions on an all-user profile are established when the profile is created or saved using <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlansetprofile">WlanSetProfile</a> or <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlansavetemporaryprofile">WlanSaveTemporaryProfile</a>.
     * 
     * To perform a connection operation at the command line, use the <b>netsh wlan connect</b> command. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/cc755301(v=ws.10)">Netsh Commands for Wireless Local Area Network (wlan)</a>. 
     * 
     * <b>Windows XP with SP3 and Wireless LAN API for Windows XP with SP2:  </b>You can only use <b>WlanConnect</b> to connect to networks on the preferred network list. To add a network to the preferred network list, call <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlansetprofile">WlanSetProfile</a>.
     * @param {Pointer<Void>} hClientHandle The client's session handle, returned by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
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
     * <li>The <b>dwFlags</b> member of the  structure pointed to by <i>pConnectionParameters</i> is not set to one of the values specified on the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_connection_parameters">WLAN_CONNECTION_PARAMETERS</a> page.</li>
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
     * @see https://learn.microsoft.com/windows/win32/api/wlanapi/nf-wlanapi-wlanconnect
     * @since windows6.0.6000
     */
    static WlanConnect(hClientHandle, pInterfaceGuid, pConnectionParameters) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        result := DllCall("wlanapi.dll\WlanConnect", "ptr", hClientHandle, "ptr", pInterfaceGuid, "ptr", pConnectionParameters, "ptr", pReserved, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hClientHandle 
     * @param {Pointer<Guid>} pInterfaceGuid 
     * @param {Pointer<WLAN_CONNECTION_PARAMETERS_V2>} pConnectionParameters 
     * @returns {Integer} 
     */
    static WlanConnect2(hClientHandle, pInterfaceGuid, pConnectionParameters) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        result := DllCall("wlanapi.dll\WlanConnect2", "ptr", hClientHandle, "ptr", pInterfaceGuid, "ptr", pConnectionParameters, "ptr", pReserved, "uint")
        return result
    }

    /**
     * Disconnects an interface from its current network.
     * @remarks
     * When the connection was established using <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanconnect">WlanConnect</a>, a profile was specified by the <b>strProfile</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_connection_parameters">WLAN_CONNECTION_PARAMETERS</a> structure pointed to by  <i>pConnectionParameters</i>. If that profile was an all-user profile, the <b>WlanDisconnect</b>  caller must have execute access on the profile. Otherwise, the <b>WlanDisconnect</b> call will fail with return value ERROR_ACCESS_DENIED. The permissions on an all-user profile are established when the profile is created or saved using <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlansetprofile">WlanSetProfile</a> or <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlansavetemporaryprofile">WlanSaveTemporaryProfile</a>.
     * 
     * To perform a disconnection operation at the command line, use the <b>netsh wlan disconnect</b> command. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/cc755301(v=ws.10)">Netsh Commands for Wireless Local Area Network (wlan)</a>. 
     * 
     * <b>Windows XP with SP3 and Wireless LAN API for Windows XP with SP2:  </b><b>WlanDisconnect</b> has the side effect of modifying the profile associated with the disconnected network. A network profile becomes an on-demand profile after a <b>WlanDisconnect</b> call. The Wireless Zero Configuration service will not connect automatically to a network with an on-demand profile when the network is in range. Do not call <b>WlanDisconnect</b> before calling <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanconnect">WlanConnect</a> unless you want to change a profile to an on-demand profile. When you call <b>WlanConnect</b> to establish a network connection, any existing network connection is dropped automatically.
     * @param {Pointer<Void>} hClientHandle The client's session handle, obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
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
     * @see https://learn.microsoft.com/windows/win32/api/wlanapi/nf-wlanapi-wlandisconnect
     * @since windows6.0.6000
     */
    static WlanDisconnect(hClientHandle, pInterfaceGuid) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        result := DllCall("wlanapi.dll\WlanDisconnect", "ptr", hClientHandle, "ptr", pInterfaceGuid, "ptr", pReserved, "uint")
        return result
    }

    /**
     * Is used to register and unregister notifications on all wireless interfaces.
     * @remarks
     * The <b>WlanRegisterNotification</b> is used by an application to register and unregister notifications on all wireless interfaces. When registering for notifications, an application must provide a callback function pointed to by the <i>funcCallback</i> parameter. The prototype for this callback function is the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nc-wlanapi-wlan_notification_callback">WLAN_NOTIFICATION_CALLBACK</a>. This callback function will receive notifications that have been registered for in the <i>dwNotifSource</i> parameter passed to the <b>WlanRegisterNotification</b> function. The callback function is called with a pointer to a  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms706902(v=vs.85)">WLAN_NOTIFICATION_DATA</a> structure as the first parameter that contains detailed information on the notification. The callback function also receives a second parameter that contains a pointer to the client context passed in the <i>pCallbackContext</i> parameter to the <b>WlanRegisterNotification</b> function.
     * 
     * The <b>WlanRegisterNotification</b> function will return an error if <i>dwNotifSource</i> is a value other than <b>WLAN_NOTIFICATION_SOURCE_NONE</b> and the client fails to provide a callback function.
     * 
     * Once registered, the callback function will be called whenever a notification is available until the client unregisters or closes the handle.
     * 
     * Any registration to receive notifications caused by this function would be automatically undone if the calling application closes its calling handle (by calling <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanclosehandle">WlanCloseHandle</a> with the <i>hClientHandle</i> parameter) or if the process ends.
     * 
     * 
     *   Do not call <b>WlanRegisterNotification</b> from a callback function. If the client is in the middle of a notification callback when <b>WlanRegisterNotification</b> is called with <i>dwNotifSource</i> set to  <b>WLAN_NOTIFICATION_SOURCE_NONE</b> (that is, when the client is unregistering from notifications), <b>WlanRegisterNotification</b>  will wait for the callback to finish before returning a value. Calling this function inside a callback function will result in the call never completing. If both the callback function and the thread that unregisters from notifications try to acquire the same lock, a deadlock may occur. In addition, do not call <b>WlanRegisterNotification</b> from the <b>DllMain</b> function in an application DLL. This could also cause a deadlock. 
     * 
     * An application can time out and query the current interface state instead of waiting for a notification.
     * 
     * <b>Windows XP with SP3 and Wireless LAN API for Windows XP with SP2:  </b>Notifications are handled by the Netman service. If the Netman service is disabled or unavailable, notifications will not be received. If a notification is not received within a reasonable period of time, an application should time out and query the current interface state.
     * @param {Pointer<Void>} hClientHandle The client's session handle, obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
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
     * @param {Integer} bIgnoreDuplicate Specifies whether duplicate notifications will be ignored.  If set to <b>TRUE</b>, a notification will not be sent to the client if it is identical to the previous one.
     * 
     * <b>Windows XP with SP3 and Wireless LAN API for Windows XP with SP2:  </b>This parameter is ignored.
     * @param {Pointer<WLAN_NOTIFICATION_CALLBACK>} funcCallback A <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nc-wlanapi-wlan_notification_callback">WLAN_NOTIFICATION_CALLBACK</a>  type that defines the type of notification callback function.
     * 
     * This parameter can be <b>NULL</b> if the <i>dwNotifSource</i> parameter is set to <b>WLAN_NOTIFICATION_SOURCE_NONE</b> to unregister notifications on all wireless interfaces,
     * @param {Pointer<Void>} pCallbackContext A pointer to the client context that will be passed to the callback function with the notification.
     * @param {Pointer<UInt32>} pdwPrevNotifSource A pointer to the previously registered notification sources.
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
     * @see https://learn.microsoft.com/windows/win32/api/wlanapi/nf-wlanapi-wlanregisternotification
     * @since windows6.0.6000
     */
    static WlanRegisterNotification(hClientHandle, dwNotifSource, bIgnoreDuplicate, funcCallback, pCallbackContext, pdwPrevNotifSource) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        result := DllCall("wlanapi.dll\WlanRegisterNotification", "ptr", hClientHandle, "uint", dwNotifSource, "int", bIgnoreDuplicate, "ptr", funcCallback, "ptr", pCallbackContext, "ptr", pReserved, "uint*", pdwPrevNotifSource, "uint")
        return result
    }

    /**
     * Retrieves all information about a specified wireless profile.
     * @remarks
     * If the <b>WlanGetProfile</b> function succeeds, the wireless profile is returned in the buffer pointed to by the <i>pstrProfileXml</i> parameter. The buffer contains a string that is the XML representation of the queried profile. For a description of the XML representation of the wireless profile, see <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/wlan-policyschema-schema">WLAN_profile Schema</a>. 
     * 
     * The caller is responsible for calling the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanfreememory">WlanFreeMemory</a> function to free the memory allocated for the buffer pointer to by the <i>pstrProfileXml</i> parameter when the buffer is no longer needed.
     * 
     * If <i>pstrProfileXml</i> specifies an all-user profile, the <b>WlanGetProfile</b>  caller must have read access on the profile. Otherwise, the <b>WlanGetProfile</b> call will fail with a return value of <b>ERROR_ACCESS_DENIED</b>. The permissions on an all-user profile are established when the profile is created or saved using <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlansetprofile">WlanSetProfile</a> or <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlansavetemporaryprofile">WlanSaveTemporaryProfile</a>.
     * 
     * <b>Windows 7:  </b><p class="note">The <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/wlan-profileschema-keymaterial-sharedkey-element">keyMaterial</a> element returned in the profile schema pointed to by the <i>pstrProfileXml</i> may be requested as plaintext if the <b>WlanGetProfile</b> function is called with the <b>WLAN_PROFILE_GET_PLAINTEXT_KEY</b>  flag set in the value pointed to by the <i>pdwFlags</i> parameter on input.   
     * 
     * <p class="note">For a WEP key, both 5 ASCII characters or 10 hexadecimal characters can be used to set the plaintext key when the profile is created or updated. However, a WEP profile will be saved with  10 hexadecimal characters in the key no matter what the original input was used to create the profile. So in the profile returned by the  <b>WlanGetProfile</b> function, the plaintext WEP key  is always returned as 10 hexadecimal characters.
     * 
     * 
     * <p class="note">For the <b>WlanGetProfile</b> call to return the plain text key, the <b>wlan_secure_get_plaintext_key</b> permissions from the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ne-wlanapi-wlan_securable_object">WLAN_SECURABLE_OBJECT</a> enumerated type must be set on the calling thread. The DACL must also contain an ACE that grants <b>WLAN_READ_ACCESS</b> permission to the access token of the calling thread. By default,  the permissions for retrieving the plain text key is allowed only to the members of the Administrators group on a local machine.
     * 
     * 
     * 
     * <p class="note">If the calling thread lacks the required permissions, the <b>WlanGetProfile</b> function returns the encrypted key in the <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/wlan-profileschema-keymaterial-sharedkey-element">keyMaterial</a> element of the profile returned in the buffer pointed to by the   <i>pstrProfileXml</i> parameter. No error is returned if the calling thread lacks the required permissions. 
     * 
     * <p class="note">By default, the <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/wlan-profileschema-keymaterial-sharedkey-element">keyMaterial</a> element returned in the profile pointed to by the <i>pstrProfileXml</i> is encrypted.   If your process runs in the context of the LocalSystem account on the same computer, then you can unencrypt key material by calling the <a href="https://docs.microsoft.com/windows/desktop/api/dpapi/nf-dpapi-cryptunprotectdata">CryptUnprotectData</a> function. 
     * 
     * 
     * 
     * <b>Windows Server 2008 and Windows Vista:  </b>The <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/wlan-profileschema-keymaterial-sharedkey-element">keyMaterial</a> element returned in the profile schema pointed to by the <i>pstrProfileXml</i> is always encrypted.  If your process runs in the context of the LocalSystem account, then you can unencrypt key material by calling the <a href="https://docs.microsoft.com/windows/desktop/api/dpapi/nf-dpapi-cryptunprotectdata">CryptUnprotectData</a> function.
     * 
     * <b>Windows XP with SP3 and Wireless LAN API for Windows XP with SP2:  </b>The key material is never encrypted.
     * @param {Pointer<Void>} hClientHandle The client's session handle, obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
     * @param {Pointer<Guid>} pInterfaceGuid The GUID of the wireless interface. 
     * 
     * A list of the GUIDs for wireless interfaces on the local computer can be retrieved using the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanenuminterfaces">WlanEnumInterfaces</a> function.
     * @param {Pointer<Char>} strProfileName The name of the profile. Profile names are case-sensitive. This string must be NULL-terminated. The maximum length of the profile name is 255 characters. This means that the maximum length of this string, including the NULL terminator, is 256 characters.
     * 
     * <b>Windows XP with SP3 and Wireless LAN API for Windows XP with SP2:  </b>The name of the profile is derived automatically from the SSID of the network. For infrastructure network profiles, the name of the profile is the SSID of the network. For ad hoc network profiles, the name of the profile is the SSID of the ad hoc network followed by <c>-adhoc</c>.
     * @param {Pointer<Char>} pstrProfileXml A string that is the XML representation of the queried profile. There is no predefined maximum string length.
     * @param {Pointer<UInt32>} pdwFlags On input, a pointer to the address location used to provide additional information about the request. If this parameter is <b>NULL</b> on input, then no information on profile flags will be returned. On output,  a pointer to the address location used to receive profile flags.
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
     * @param {Pointer<UInt32>} pdwGrantedAccess The access mask of the all-user profile.
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wlanapi/nf-wlanapi-wlangetprofile
     * @since windows6.0.6000
     */
    static WlanGetProfile(hClientHandle, pInterfaceGuid, strProfileName, pstrProfileXml, pdwFlags, pdwGrantedAccess) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        strProfileName := strProfileName is String? StrPtr(strProfileName) : strProfileName

        result := DllCall("wlanapi.dll\WlanGetProfile", "ptr", hClientHandle, "ptr", pInterfaceGuid, "ptr", strProfileName, "ptr", pReserved, "ptr", pstrProfileXml, "uint*", pdwFlags, "uint*", pdwGrantedAccess, "uint")
        return result
    }

    /**
     * Sets the Extensible Authentication Protocol (EAP) user credentials as specified by raw EAP data.
     * @remarks
     * The  <b>WlanSetProfileEapUserData</b> function sets the EAP user credentials to use on a profile.  On Windows Vista and Windows Server 2008, these credentials can only be used by the caller.
     * 
     * The <i>eapType</i> parameter is an  <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_method_type">EAP_METHOD_TYPE</a> structure that contains type, identification, and author information about an EAP method. The <b>eapType</b> member of the <b>EAP_METHOD_TYPE</b> structure is an  <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_type">EAP_TYPE</a> structure that contains the type and vendor identification information for an EAP method.
     * 
     * 
     * For more information on the allocation of EAP method types, see section 6.2 of <a href="http://tools.ietf.org/html/rfc3748">RFC 3748</a> published by the IETF.
     * 
     * On Windows 7, Windows Server 2008 R2,  and later, the  <b>WlanSetProfileEapUserData</b> function is enhanced. EAP user credentials can be set for all users of  a profile if the <i>dwFlags</i> parameter contains <b>WLAN_SET_EAPHOST_DATA_ALL_USERS</b>. The EAP user credentials on a profile can also be  deleted. To delete the EAP user credentials on a profile, the <i>pbEapUserData</i> parameter must be <b>NULL</b>, the <i>dwFlags</i> parameter must equal <b>WLAN_SET_EAPHOST_DATA_ALL_USERS</b>,  and the <i>dwEapUserDataSize</i> parameter must be 0.
     * 
     * All wireless LAN functions require an interface GUID for the wireless interface when performing profile operations. When a wireless interface is removed, its state is cleared from Wireless LAN Service (WLANSVC)  and no profile operations are possible.
     * 
     * The <b>WlanSetProfileEapUserData</b> function can fail with <b>ERROR_INVALID_PARAMETER</b> if the wireless interface specified in the <i>pInterfaceGuid</i> parameter has been removed from the system (a USB  wireless adapter that has been removed, for example).
     * @param {Pointer<Void>} hClientHandle The client's session handle, obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
     * @param {Pointer<Guid>} pInterfaceGuid The GUID of the interface.
     * @param {Pointer<Char>} strProfileName The name of the profile associated with the EAP user data. Profile names are case-sensitive. This string must be NULL-terminated.
     * @param {Pointer} eapType An <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_method_type">EAP_METHOD_TYPE</a> structure that contains the method for which the caller is supplying EAP user credentials.
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
     * On Windows 10, Windows Server 2016 ,  and later, this value is returned if the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlansetprofileeapuserdata">WlanSetProfileEapUserData</a> function was called on a profile that uses a method other than 802.1X for authentication. 
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
     * @see https://learn.microsoft.com/windows/win32/api/wlanapi/nf-wlanapi-wlansetprofileeapuserdata
     * @since windows6.0.6000
     */
    static WlanSetProfileEapUserData(hClientHandle, pInterfaceGuid, strProfileName, eapType, dwFlags, dwEapUserDataSize, pbEapUserData) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        strProfileName := strProfileName is String? StrPtr(strProfileName) : strProfileName

        result := DllCall("wlanapi.dll\WlanSetProfileEapUserData", "ptr", hClientHandle, "ptr", pInterfaceGuid, "ptr", strProfileName, "ptr", eapType, "uint", dwFlags, "uint", dwEapUserDataSize, "ptr", pbEapUserData, "ptr", pReserved, "uint")
        return result
    }

    /**
     * Sets the Extensible Authentication Protocol (EAP) user credentials as specified by an XML string.
     * @remarks
     * The  **WlanSetProfileEapXmlUserData** function sets the EAP user credentials to use on a profile. This function can be called only on a profile that uses 802.1X for authentication. On Windows Vista and Windows Server 2008, these credentials can only be used by the caller.
     * 
     * The <i>eapType</i> parameter is an  <a href="https://docs.microsoft.com/windows/win32/api/eaptypes/ns-eaptypes-eap_method_type">EAP_METHOD_TYPE</a> structure that contains type, identification, and author information about an EAP method. The <b>eapType</b> member of the <b>EAP_METHOD_TYPE</b> structure is an  <a href="https://docs.microsoft.com/windows/win32/api/eaptypes/ns-eaptypes-eap_type">EAP_TYPE</a> structure that contains the type and vendor identification information for an EAP method.
     * 
     * For more information on the allocation of EAP method types, see section 6.2 of <a href="http://tools.ietf.org/html/rfc3748">RFC 3748</a> published by the IETF.
     * 
     * On Windows 10, Windows Server 2016,  and later, the  **WlanSetProfileEapXmlUserData** function is enhanced. EAP user credentials can be set for all users of  a profile if the <i>dwFlags</i> parameter contains <b>WLAN_SET_EAPHOST_DATA_ALL_USERS</b>. 
     * 
     * All wireless LAN functions require an interface GUID for the wireless interface when performing profile operations. When a wireless interface is removed, its state is cleared from Wireless LAN Service (WLANSVC)  and no profile operations are possible.
     * 
     * The **WlanSetProfileEapXmlUserData** function can fail with <b>ERROR_INVALID_PARAMETER</b> if the wireless interface specified in the <i>pInterfaceGuid</i> parameter has been removed from the system (a USB  wireless adapter that has been removed, for example). 
     * 
     * The **WlanSetProfileEapXmlUserData** might cause wireless connection failure when you use **EAP-TTLS** and the API is called from a 32-bit application running on a 64-bit operating system (OS). Your application should be built for the same CPU architecture as the target OS.
     * 
     * <b>Windows XP with SP3 and Wireless LAN API for Windows XP with SP2: </b>This function can only be used for Protected EAP (PEAP) credentials. It can't be used for other EAP types.
     * @param {Pointer<Void>} hClientHandle The client's session handle, obtained by a previous call to the <a href="https://docs.microsoft.com/windows/win32/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
     * @param {Pointer<Guid>} pInterfaceGuid The GUID of the interface.
     * @param {Pointer<Char>} strProfileName The name of the profile associated with the EAP user data. Profile names are case-sensitive. This string must be NULL-terminated.
     * 
     * <b>Windows XP with SP3 and Wireless LAN API for Windows XP with SP2:  </b>The supplied name must match the profile name derived automatically from the SSID of the network. For an infrastructure network profile, the SSID must be supplied for the profile name. For an ad hoc network profile, the supplied name must be the SSID of the ad hoc network followed by <c>-adhoc</c>.
     * @param {Integer} dwFlags A set of flags that modify the behavior of the function. 
     * 
     * On Wireless LAN API for Windows XP with SP2, Windows XP with SP3,Windows Vista, and Windows Server 2008, this parameter is reserved and should be set to zero.
     * @param {Pointer<Char>} strEapXmlUserData A pointer to XML data used to set the user credentials. 
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
     * On Windows 7, Windows Server 2008 R2 ,  and later, this value is returned if the <a href="https://docs.microsoft.com/windows/win32/api/wlanapi/nf-wlanapi-wlansetprofileeapxmluserdata">WlanSetProfileEapXmlUserData</a> function was called on a profile that uses a method other than 802.1X for authentication. 
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
     * @see https://learn.microsoft.com/windows/win32/api/wlanapi/nf-wlanapi-wlansetprofileeapxmluserdata
     * @since windows6.0.6000
     */
    static WlanSetProfileEapXmlUserData(hClientHandle, pInterfaceGuid, strProfileName, dwFlags, strEapXmlUserData) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        strProfileName := strProfileName is String? StrPtr(strProfileName) : strProfileName
        strEapXmlUserData := strEapXmlUserData is String? StrPtr(strEapXmlUserData) : strEapXmlUserData

        result := DllCall("wlanapi.dll\WlanSetProfileEapXmlUserData", "ptr", hClientHandle, "ptr", pInterfaceGuid, "ptr", strProfileName, "uint", dwFlags, "ptr", strEapXmlUserData, "ptr", pReserved, "uint")
        return result
    }

    /**
     * Sets the content of a specific profile.
     * @remarks
     * The <b>WlanSetProfile</b> function can be used to add a new wireless LAN profile or replace an existing wireless LAN profile. 
     * 
     * A new profile is added at the top of the list after the group policy profiles.   A profile's position in the list is not changed if an existing profile is overwritten.<b>Windows XP with SP3 and Wireless LAN API for Windows XP with SP2:  </b><p class="note">Ad hoc profiles appear after the infrastructure profiles in the profile list. If you create a new ad hoc profile, it is placed at the top of the ad hoc list, after the group policy and infrastructure profiles. 
     * 
     * <p class="note">802.1X guest profiles, Wireless Provisioning Service (WPS) profiles, and profiles with Wi-Fi Protected Access-None (WPA-None)  authentication are not supported. That means such a profile cannot be created, deleted, enumerated, or accessed using Native Wifi functions. Any such profile already in the preferred profile list will remain in the list, and its position in the list relative to other profiles is fixed unless the position of the other profiles change.
     * 
     * 
     * 
     * 
     * 
     * You can call <b>WlanSetProfile</b> on a profile that contains a plaintext key (that is, a profile with the  <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/wlan-profileschema-protected-sharedkey-element">protected</a> element present and set to <b>FALSE</b>).  Before the profile is saved in the profile store, the key material is automatically encrypted. When the profile is subsequently retrieved from the profile store by calling <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlangetprofile">WlanGetProfile</a>, the encrypted key material is returned.<b>Windows XP with SP3 and Wireless LAN API for Windows XP with SP2:  </b>The key material is never encrypted.
     * 
     * 
     * 
     * All-user profiles have three associated permissions: read, write, and execute. If a user has read access, the user can view profile permissions. If a user has execute access, the user has read access and the user can also connect to and disconnect from a network using the profile. If a user has write access, the user has execute access and the user can also modify and delete permissions associated with a profile.
     * 
     * The following describes the procedure for creating a security descriptor object and parsing it as a string.
     * 
     * <ol>
     * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-initializesecuritydescriptor">InitializeSecurityDescriptor</a> to create a security descriptor in memory.</li>
     * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-setsecuritydescriptorowner">SetSecurityDescriptorOwner</a>.</li>
     * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-initializeacl">InitializeAcl</a> to create a discretionary access control list (DACL) in memory.</li>
     * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-addaccessallowedace">AddAccessAllowedAce</a> or <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-addaccessdeniedace">AddAccessDeniedAce</a> to add access control entries (ACEs) to the DACL. Set the <i>AccessMask</i> parameter to one of the following as appropriate:<ul>
     * <li>WLAN_READ_ACCESS</li>
     * <li>WLAN_EXECUTE_ACCESS</li>
     * <li>WLAN_WRITE_ACCESS     </li>
     * </ul>
     * </li>
     * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-setsecuritydescriptordacl">SetSecurityDescriptorDacl</a> to add the DACL to the security descriptor.</li>
     * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/sddl/nf-sddl-convertsecuritydescriptortostringsecuritydescriptora">ConvertSecurityDescriptorToStringSecurityDescriptor</a> to convert the descriptor to string.</li>
     * </ol>
     * The string returned by <a href="https://docs.microsoft.com/windows/desktop/api/sddl/nf-sddl-convertsecuritydescriptortostringsecuritydescriptora">ConvertSecurityDescriptorToStringSecurityDescriptor</a> can then be used as the <i>strAllUserProfileSecurity</i> parameter value when calling <b>WlanSetProfile</b>.
     * 
     * For every wireless LAN profile used by the Native Wifi AutoConfig service, Windows maintains the concept of custom user data.  This custom user data is initially non-existent, but can be set by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlansetprofilecustomuserdata">WlanSetProfileCustomUserData</a> function. The custom user data gets reset to empty any time the profile is modified by calling the <b>WlanSetProfile</b> function. Once custom user data has been set, this data can be accessed using the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlangetprofilecustomuserdata">WlanGetProfileCustomUserData</a> function. 
     * 
     * All wireless LAN functions require an interface GUID for the wireless interface when performing profile operations. When a wireless interface is removed, its state is cleared from Wireless LAN Service (WLANSVC)  and no profile operations are possible.
     * 
     * The <b>WlanSetProfile</b> function can fail with <b>ERROR_INVALID_PARAMETER</b> if the wireless interface specified in the <i>pInterfaceGuid</i> parameter has been removed from the system (a USB  wireless adapter that has been removed, for example). 
     * 
     * The <b>netsh wlan add profile</b> command provides similar functionality at the command line. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/cc755301(v=ws.10)">Netsh Commands for Wireless Local Area Network (wlan)</a>.
     * @param {Pointer<Void>} hClientHandle The client's session handle, obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
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
     * @param {Pointer<Char>} strProfileXml Contains the XML representation of the profile. The <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/wlan-profileschema-wlanprofile-element">WLANProfile</a> element is the root profile element. To view sample profiles, see <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/wireless-profile-samples">Wireless Profile Samples</a>. There is no predefined maximum string length.
     * 
     * <b>Windows XP with SP3 and Wireless LAN API for Windows XP with SP2:  </b>The supplied profile must meet the compatibility criteria described in <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/wireless-profile-compatibility">Wireless Profile Compatibility</a>.
     * @param {Pointer<Char>} strAllUserProfileSecurity Sets the security descriptor string on the all-user profile.  For more information about profile permissions, see the Remarks section.
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
     * @param {Integer} bOverwrite Specifies whether this profile is overwriting an existing profile.  If this parameter is <b>FALSE</b> and the profile already exists, the existing profile will not be overwritten and an error will be returned.
     * @param {Pointer<UInt32>} pdwReasonCode A <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/wlan-reason-code">WLAN_REASON_CODE</a> value that indicates why the profile is not valid.
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
     * When called with <i>dwFlags</i> set to 0 - that is, when setting an all-user profile -  <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlansetprofile">WlanSetProfile</a>  retrieves the discretionary access control list (DACL) stored with the  <b>wlan_secure_add_new_all_user_profiles</b> object. When called with <i>dwFlags</i> set to <b>WLAN_PROFILE_USER</b> - that is, when setting a per-user profile -  <b>WlanSetProfile</b>  retrieves the discretionary access control list (DACL) stored with the  <b>wlan_secure_add_new_per_user_profiles</b> object. In either case, if the DACL does not contain an access control entry (ACE) that grants WLAN_WRITE_ACCESS permission to the access token of the calling thread, then <b>WlanSetProfile</b> returns <b>ERROR_ACCESS_DENIED</b>.
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
     * [ConfigBlob](/windows/desktop/eaphost/eaphostconfigschema-configblob-eaphostconfig-element). If the profile must have an empty <b>ConfigBlob</b>, use <c>&lt;ConfigBlob&gt;00&lt;/ConfigBlob&gt;</c> in the profile.</li>
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
     * @see https://learn.microsoft.com/windows/win32/api/wlanapi/nf-wlanapi-wlansetprofile
     * @since windows6.0.6000
     */
    static WlanSetProfile(hClientHandle, pInterfaceGuid, dwFlags, strProfileXml, strAllUserProfileSecurity, bOverwrite, pdwReasonCode) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        strProfileXml := strProfileXml is String? StrPtr(strProfileXml) : strProfileXml
        strAllUserProfileSecurity := strAllUserProfileSecurity is String? StrPtr(strAllUserProfileSecurity) : strAllUserProfileSecurity

        result := DllCall("wlanapi.dll\WlanSetProfile", "ptr", hClientHandle, "ptr", pInterfaceGuid, "uint", dwFlags, "ptr", strProfileXml, "ptr", strAllUserProfileSecurity, "int", bOverwrite, "ptr", pReserved, "uint*", pdwReasonCode, "uint")
        return result
    }

    /**
     * Deletes a wireless profile for a wireless interface on the local computer.
     * @remarks
     * The <b>WlanDeleteProfile</b> function deletes a wireless profile for a wireless interface on  the local computer. 
     * 
     * All wireless LAN functions require an interface GUID for the wireless interface when performing profile operations. When a wireless interface is removed, its state is cleared from Wireless LAN Service (WLANSVC)  and no profile operations are possible.
     * 
     * The <b>WlanDeleteProfile</b> function can fail with <b>ERROR_INVALID_PARAMETER</b> if the wireless interface specified in the <i>pInterfaceGuid</i> parameter for the wireless LAN profile has been removed from the system (a USB  wireless adapter that has been removed, for example). 
     * 
     * To delete a profile at the command line, use the <b>netsh wlan delete profile</b> command. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/cc755301(v=ws.10)">Netsh Commands for Wireless Local Area Network (wlan)</a>.
     * @param {Pointer<Void>} hClientHandle The client's session handle, obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
     * @param {Pointer<Guid>} pInterfaceGuid The GUID of the interface from which to delete the profile.
     * @param {Pointer<Char>} strProfileName The name of the profile to be deleted. Profile names are case-sensitive. This string must be NULL-terminated.
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
     * @see https://learn.microsoft.com/windows/win32/api/wlanapi/nf-wlanapi-wlandeleteprofile
     * @since windows6.0.6000
     */
    static WlanDeleteProfile(hClientHandle, pInterfaceGuid, strProfileName) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        strProfileName := strProfileName is String? StrPtr(strProfileName) : strProfileName

        result := DllCall("wlanapi.dll\WlanDeleteProfile", "ptr", hClientHandle, "ptr", pInterfaceGuid, "ptr", strProfileName, "ptr", pReserved, "uint")
        return result
    }

    /**
     * Renames the specified profile.
     * @param {Pointer<Void>} hClientHandle The client's session handle, obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
     * @param {Pointer<Guid>} pInterfaceGuid The GUID of the interface.
     * @param {Pointer<Char>} strOldProfileName The profile name to be changed.
     * @param {Pointer<Char>} strNewProfileName The new name of the profile.
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
     * @see https://learn.microsoft.com/windows/win32/api/wlanapi/nf-wlanapi-wlanrenameprofile
     * @since windows6.0.6000
     */
    static WlanRenameProfile(hClientHandle, pInterfaceGuid, strOldProfileName, strNewProfileName) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        strOldProfileName := strOldProfileName is String? StrPtr(strOldProfileName) : strOldProfileName
        strNewProfileName := strNewProfileName is String? StrPtr(strNewProfileName) : strNewProfileName

        result := DllCall("wlanapi.dll\WlanRenameProfile", "ptr", hClientHandle, "ptr", pInterfaceGuid, "ptr", strOldProfileName, "ptr", strNewProfileName, "ptr", pReserved, "uint")
        return result
    }

    /**
     * Retrieves the list of profiles.
     * @remarks
     * The <b>WlanGetProfileList</b> function returns only the basic information on the wireless profiles on a wireless interface. The list of wireless profiles   on a wireless interface are retrieved in the preference order. The <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlansetprofileposition">WlanSetProfilePosition</a> can be used to change the preference order for the wireless profiles on a wireless interface.
     * 
     * More detailed information for a wireless profile on a wireless interface can be retrieved by using the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlangetprofile">WlanGetProfile</a> function. The <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlangetprofilecustomuserdata">WlanGetProfileCustomUserData</a> function can be used to retrieve custom user data for a wireless profile on a wireless interface. A list of the wireless interfaces and associated GUIDs on the local computer can be retrieved using the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanenuminterfaces">WlanEnumInterfaces</a> function.
     * 
     * The  <b>WlanGetProfileList</b> function allocates memory for the list of profiles returned in the buffer pointed to by the <i>ppProfileList</i> parameter. The caller is responsible for freeing this memory using the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanfreememory">WlanFreeMemory</a> function when this buffer is no longer needed.
     * 
     * <b>Windows XP with SP3 and Wireless LAN API for Windows XP with SP2:  </b>Guest profiles, profiles with Wireless Provisioning Service (WPS) authentication, and profiles with Wi-Fi Protected Access-None (WPA-None)  authentication are not supported. These types of profiles are not returned by <b>WlanGetProfileList</b>, even if a profile of this type appears on the preferred profile list.
     * @param {Pointer<Void>} hClientHandle The client's session handle, obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
     * @param {Pointer<Guid>} pInterfaceGuid The GUID of the wireless interface. 
     * 
     * A list of the GUIDs for wireless interfaces on the local computer can be retrieved using the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanenuminterfaces">WlanEnumInterfaces</a> function.
     * @param {Pointer<WLAN_PROFILE_INFO_LIST>} ppProfileList A <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_profile_info_list">PWLAN_PROFILE_INFO_LIST</a> structure that contains the list of profile information.
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
     * @see https://learn.microsoft.com/windows/win32/api/wlanapi/nf-wlanapi-wlangetprofilelist
     * @since windows6.0.6000
     */
    static WlanGetProfileList(hClientHandle, pInterfaceGuid, ppProfileList) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        result := DllCall("wlanapi.dll\WlanGetProfileList", "ptr", hClientHandle, "ptr", pInterfaceGuid, "ptr", pReserved, "ptr", ppProfileList, "uint")
        return result
    }

    /**
     * Sets the preference order of profiles.
     * @remarks
     * The <b>WlanSetProfileList</b> function sets the preference order of wireless LAN profiles for a given wireless interface.
     * 
     * The profiles in the list must be a one-to-one match with the current profiles returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlangetprofilelist">WlanGetProfileList</a> function.  The position of group policy profiles cannot be changed.
     * 
     * All wireless LAN functions require an interface GUID for the wireless interface when performing profile operations. When a wireless interface is removed, its state is cleared from Wireless LAN Service (WLANSVC)  and no profile operations are possible.
     * 
     * The <b>WlanSetProfileList</b> function can fail with <b>ERROR_INVALID_PARAMETER</b> if the wireless interface specified in the <i>pInterfaceGuid</i> parameter has been removed from the system (a USB  wireless adapter that has been removed, for example).
     * @param {Pointer<Void>} hClientHandle The client's session handle, obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
     * @param {Pointer<Guid>} pInterfaceGuid The GUID of the interface.
     * @param {Integer} dwItems The number of profiles in the <i>strProfileNames</i> parameter.
     * @param {Pointer<Char>} strProfileNames The names of the profiles in the desired order. Profile names are case-sensitive. This string must be NULL-terminated.
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
     * Before <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlansetprofilelist">WlanSetProfileList</a> performs an operation that changes the relative order of all-user profiles in the profile list  or moves an all-user profile to a lower position in the profile list,  <b>WlanSetProfileList</b> retrieves the discretionary access control list (DACL) stored with the  <b>wlan_secure_all_user_profiles_order</b> object. If the DACL does not contain an access control entry (ACE) that grants WLAN_WRITE_ACCESS permission to the access token of the calling thread, then <b>WlanSetProfileList</b> returns <b>ERROR_ACCESS_DENIED</b>.
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
     * @see https://learn.microsoft.com/windows/win32/api/wlanapi/nf-wlanapi-wlansetprofilelist
     * @since windows6.0.6000
     */
    static WlanSetProfileList(hClientHandle, pInterfaceGuid, dwItems, strProfileNames) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        result := DllCall("wlanapi.dll\WlanSetProfileList", "ptr", hClientHandle, "ptr", pInterfaceGuid, "uint", dwItems, "ptr", strProfileNames, "ptr", pReserved, "uint")
        return result
    }

    /**
     * Sets the position of a single, specified profile in the preference list.
     * @remarks
     * The position of group policy profiles cannot be changed.
     * 
     * By default, only a user logged on as a member of the Administrators group can change the position of an all-user profile. Call <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlangetsecuritysettings">WlanGetSecuritySettings</a> to determine the actual user rights required to change the position of an all-user profile.
     * 
     * To set the profile position at the command line, use the <b>netsh wlan set profileorder</b> command. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/cc755301(v=ws.10)">Netsh Commands for Wireless Local Area Network (wlan)</a>. 
     * 
     * <b>Windows XP with SP3 and Wireless LAN API for Windows XP with SP2:  </b>Ad hoc profiles appear after the infrastructure profiles in the profile list. If you try to position an ad hoc profile before an infrastructure profile using <b>WlanSetProfilePosition</b>, the   <b>WlanSetProfilePosition</b> call will succeed but the Wireless Zero Configuration service will reorder the profile list such that the ad hoc profile is positioned after all infrastructure network profiles.
     * 
     * Guest profiles, profiles with Wireless Provisioning Service (WPS) authentication, and profiles with Wi-Fi Protected Access-None (WPA-None)  authentication are not supported. Any such profile that appears in the preferred profile list has a fixed position in the profile list. That means its position cannot be changed using <b>WlanSetProfilePosition</b> and that its position is not affected by position changes of other profiles. 
     * 
     * All wireless LAN functions require an interface GUID for the wireless interface when performing profile operations. When a wireless interface is removed, its state is cleared from Wireless LAN Service (WLANSVC)  and no profile operations are possible.
     * 
     * The <b>WlanSetProfilePosition</b> function can fail with <b>ERROR_INVALID_PARAMETER</b> if the wireless interface specified in the <i>pInterfaceGuid</i> parameter has been removed from the system (a USB  wireless adapter that has been removed, for example).
     * @param {Pointer<Void>} hClientHandle The client's session handle, obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
     * @param {Pointer<Guid>} pInterfaceGuid The GUID of the interface.
     * @param {Pointer<Char>} strProfileName The name of the profile. Profile names are case-sensitive. This string must be NULL-terminated.
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
     * Before <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlansetprofileposition">WlanSetProfilePosition</a> performs an operation that changes the relative order of all-user profiles in the profile list  or moves an all-user profile to a lower position in the profile list,  <b>WlanSetProfilePosition</b>  retrieves the discretionary access control list (DACL) stored with the  <b>wlan_secure_all_user_profiles_order</b> object. If the DACL does not contain an access control entry (ACE) that grants WLAN_WRITE_ACCESS permission to the access token of the calling thread, then <b>WlanSetProfilePosition</b>  returns <b>ERROR_ACCESS_DENIED</b>.
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
     * @see https://learn.microsoft.com/windows/win32/api/wlanapi/nf-wlanapi-wlansetprofileposition
     * @since windows6.0.6000
     */
    static WlanSetProfilePosition(hClientHandle, pInterfaceGuid, strProfileName, dwPosition) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        strProfileName := strProfileName is String? StrPtr(strProfileName) : strProfileName

        result := DllCall("wlanapi.dll\WlanSetProfilePosition", "ptr", hClientHandle, "ptr", pInterfaceGuid, "ptr", strProfileName, "uint", dwPosition, "ptr", pReserved, "uint")
        return result
    }

    /**
     * Sets the custom user data associated with a profile.
     * @remarks
     * For every wireless WLAN profile used by the Native Wifi AutoConfig service, Windows maintains the concept of custom user data.  This custom user data is initially non-existent, but can be set by calling the <b>WlanSetProfileCustomUserData</b> function. The custom user data gets reset to empty any time the profile is modified by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlansetprofile">WlanSetProfile</a> function.
     * 
     * Once custom user data has been set, this data can be accessed using the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlangetprofilecustomuserdata">WlanGetProfileCustomUserData</a> function. 
     * 
     * All wireless LAN functions require an interface GUID for the wireless interface when performing profile operations. When a wireless interface is removed, its state is cleared from Wireless LAN Service (WLANSVC)  and no profile operations are possible.
     * 
     * The <b>WlanSetProfileCustomUserData</b> function can fail with <b>ERROR_INVALID_PARAMETER</b> if the wireless interface specified in the <i>pInterfaceGuid</i> parameter has been removed from the system (a USB  wireless adapter that has been removed, for example).
     * @param {Pointer<Void>} hClientHandle The client's session handle, obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
     * @param {Pointer<Guid>} pInterfaceGuid The GUID of the interface.
     * @param {Pointer<Char>} strProfileName The name of the profile associated with the custom user data. Profile names are case-sensitive. This string must be NULL-terminated.
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
     * @see https://learn.microsoft.com/windows/win32/api/wlanapi/nf-wlanapi-wlansetprofilecustomuserdata
     * @since windows6.0.6000
     */
    static WlanSetProfileCustomUserData(hClientHandle, pInterfaceGuid, strProfileName, dwDataSize, pData) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        strProfileName := strProfileName is String? StrPtr(strProfileName) : strProfileName

        result := DllCall("wlanapi.dll\WlanSetProfileCustomUserData", "ptr", hClientHandle, "ptr", pInterfaceGuid, "ptr", strProfileName, "uint", dwDataSize, "ptr", pData, "ptr", pReserved, "uint")
        return result
    }

    /**
     * Gets the custom user data associated with a wireless profile.
     * @remarks
     * For every wireless WLAN profile used by the Native Wifi AutoConfig service, Windows maintains the concept of custom user data.  This custom user data is initially non-existent, but can be set by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlansetprofilecustomuserdata">WlanSetProfileCustomUserData</a> function. The custom user data gets reset to empty any time the profile is modified by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlansetprofile">WlanSetProfile</a> function.
     * 
     * Once custom user data has been set, this data can be accessed using the <b>WlanGetProfileCustomUserData</b> function. 
     * 
     * The caller is responsible for freeing the memory allocated for the buffer pointed to by the <i>ppData</i> parameter using the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanfreememory">WlanFreeMemory</a> function.
     * @param {Pointer<Void>} hClientHandle The client's session handle, obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
     * @param {Pointer<Guid>} pInterfaceGuid A pointer to the GUID of the wireless LAN interface.
     * @param {Pointer<Char>} strProfileName The name of the profile with which the custom user data is associated. Profile names are case-sensitive. This string must be NULL-terminated.
     * @param {Pointer<UInt32>} pdwDataSize The size, in bytes,  of the user data buffer pointed to by the <i>ppData</i> parameter.
     * @param {Pointer<Byte>} ppData A pointer to the user data.
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
     * @see https://learn.microsoft.com/windows/win32/api/wlanapi/nf-wlanapi-wlangetprofilecustomuserdata
     * @since windows6.0.6000
     */
    static WlanGetProfileCustomUserData(hClientHandle, pInterfaceGuid, strProfileName, pdwDataSize, ppData) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        strProfileName := strProfileName is String? StrPtr(strProfileName) : strProfileName

        result := DllCall("wlanapi.dll\WlanGetProfileCustomUserData", "ptr", hClientHandle, "ptr", pInterfaceGuid, "ptr", strProfileName, "ptr", pReserved, "uint*", pdwDataSize, "ptr", ppData, "uint")
        return result
    }

    /**
     * Sets the permit/deny list.
     * @remarks
     * The group policy permit and deny lists take precedence over the user's permit and deny lists. That means access to a network on the user's permit list will be denied if the network appears on the group policy deny list. Similarly, access to a network on the user's deny list will be permitted if the network appears on the group policy permit list. Networks that are not on a user  list or a group policy list will be permitted.  
     * 
     * Denied networks cannot be connected by means of auto config and will not be included on the visible networks list. New user permit and deny lists overwrite previous versions of the user lists.  
     * 
     * To clear a filter list, set the <i>pNetworkList</i> parameter to <b>NULL</b>, or pass a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-dot11_network_list">DOT11_NETWORK_LIST</a> structure that has the <b>dwNumberOfItems</b> member set to 0.
     * 
     * To add all SSIDs to a filter list, pass a pointer to a  <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-dot11_network_list">DOT11_NETWORK_LIST</a> structure with an associated <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-dot11_network">DOT11_NETWORK</a> structure that has the  <b>uSSIDLength</b> member of its <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/dot11-ssid">DOT11_SSID</a> structure set to 0.
     * 
     * To add all BSS types to a filter list, pass a pointer to a  <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-dot11_network_list">DOT11_NETWORK_LIST</a> with an associated <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-dot11_network">DOT11_NETWORK</a> structure that has its <b>dot11BssType</b> member set to <b>dot11_BSS_type_any</b>.
     * 
     * The <b>netsh wlan add filter</b> and <b>netsh wlan delete filter</b> commands provide similar functionality at the command line. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/cc755301(v=ws.10)">Netsh Commands for Wireless Local Area Network (wlan)</a>.
     * @param {Pointer<Void>} hClientHandle The client's session handle, obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
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
     * When called with <i>wlanFilterListType</i> set to <b>wlan_filter_list_type_user_permit</b>, <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlansetfilterlist">WlanSetFilterList</a> retrieves the discretionary access control list (DACL) stored with the  <b>wlan_secure_permit_list</b> object. When called with <i>wlanFilterListType</i>  set to <b>wlan_filter_list_type_user_deny</b>, <b>WlanSetFilterList</b> retrieves the DACL stored with the  <b>wlan_secure_deny_list</b> object. In either of these cases, if the DACL does not contain an access control entry (ACE) that grants WLAN_WRITE_ACCESS permission to the access token of the calling thread, then <b>WlanSetFilterList</b>  returns <b>ERROR_ACCESS_DENIED</b>.
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
     * @see https://learn.microsoft.com/windows/win32/api/wlanapi/nf-wlanapi-wlansetfilterlist
     * @since windows6.0.6000
     */
    static WlanSetFilterList(hClientHandle, wlanFilterListType, pNetworkList) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        result := DllCall("wlanapi.dll\WlanSetFilterList", "ptr", hClientHandle, "int", wlanFilterListType, "ptr", pNetworkList, "ptr", pReserved, "uint")
        return result
    }

    /**
     * Retrieves a group policy or user permission list.
     * @remarks
     * User permission lists can be set by calling <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlansetfilterlist">WlanSetFilterList</a>.
     * @param {Pointer<Void>} hClientHandle The client's session handle, obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
     * @param {Integer} wlanFilterListType A <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ne-wlanapi-wlan_filter_list_type">WLAN_FILTER_LIST_TYPE</a> value that specifies the type of filter list.  All user defined and group policy filter lists can be queried.
     * @param {Pointer<DOT11_NETWORK_LIST>} ppNetworkList Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-dot11_network_list">DOT11_NETWORK_LIST</a> structure that contains the list of permitted or denied networks.
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
     * When called with <i>wlanFilterListType</i> set to <b>wlan_filter_list_type_user_permit</b>, <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlangetfilterlist">WlanGetFilterList</a> retrieves the discretionary access control list (DACL) stored with the  <b>wlan_secure_permit_list</b> object. When called with <i>wlanFilterListType</i> set to <b>wlan_filter_list_type_user_deny</b>, <b>WlanGetFilterList</b> retrieves the DACL stored with the  <b>wlan_secure_deny_list</b> object. In either of these cases, if the DACL does not contain an access control entry (ACE) that grants WLAN_READ_ACCESS permission to the access token of the calling thread, then <b>WlanGetFilterList</b>  returns <b>ERROR_ACCESS_DENIED</b>.
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
     * @see https://learn.microsoft.com/windows/win32/api/wlanapi/nf-wlanapi-wlangetfilterlist
     * @since windows6.0.6000
     */
    static WlanGetFilterList(hClientHandle, wlanFilterListType, ppNetworkList) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        result := DllCall("wlanapi.dll\WlanGetFilterList", "ptr", hClientHandle, "int", wlanFilterListType, "ptr", pReserved, "ptr", ppNetworkList, "uint")
        return result
    }

    /**
     * Sets the proximity service discovery (PSD) information element (IE) data list.
     * @remarks
     * The Proximity Service Discovery Protocol is a Microsoft proprietary protocol that allows a client to discover services in its physical proximity, which is defined by the radio range. The purpose of the Proximity Service Discovery Protocol is to convey service discovery information, such as service advertisements, as part of Beacon frames. Access points (APs) and stations (STAs) that operate in ad hoc mode periodically broadcast beacon frames. The beacon frame can contain single or multiple proprietary information elements that carry discovery information pertaining to the services that the device offers.
     * 
     * A PSD IE is used to transmit compressed information provided by higher-level discovery protocols for the purpose of passive discovery. One such higher-level protocol used for discovery is the WS-Discovery protocol. Any protocol can be used for discovery. 
     * 
     * Windows Vista and Windows Server 2008 with the Wireless LAN Service installed support passive discovery for ad hoc clients, ad hoc services, and infrastructure clients. This means an ad hoc service can advertise an available resource or service by transmitting a PSD IE in one or more beacons. There is no guarantee that this beacon is received by an ad hoc or infrastructure client. 
     * 
     * Windows 7 and Windows Server 2008 R2 with the Wireless LAN Service installed  support passive discovery for ad hoc clients, ad hoc services, and infrastructure clients in the same way as in Windows Vista. In addition, the PSD IE is also supported for the wireless Hosted Network, a software-based wireless access point (AP). Applications on the local computer where the wireless Hosted Network is to be run may use the <b>WlanSetPsdIeDataList</b> function to set the PSD IE before starting the wireless Hosted Network. Once set, the PSD IE will be included in the beacon and probe response after the wireless Hosted Network is started.
     * 
     * Each application sending or receiving beacons maintains its own PSD IE data list. The <i>pPsdIEDataList</i> parameter points to a list of PSD IEs generated by the application.  Each PSD IE has the following format.<table>
     * <tr>
     * <th>Field</th>
     * <th>Description and Value</th>
     * </tr>
     * <tr>
     * <td>Element ID (1 byte)</td>
     * <td>221</td>
     * </tr>
     * <tr>
     * <td>Length (1 byte)</td>
     * <td>The length, in bytes, of Data field plus 8. </td>
     * </tr>
     * <tr>
     * <td>OUI (3 bytes)</td>
     * <td>The Organizational Unique Identifier (OUI) must contain a value of 00-50-F2. This public OUI is registered to Microsoft.</td>
     * </tr>
     * <tr>
     * <td>OUI Type (1 byte)</td>
     * <td>For the Proximity Service Discovery Protocol, the OUI Type must contain a value of 6.</td>
     * </tr>
     * <tr>
     * <td>Format identifier hash(4 bytes)</td>
     * <td>Bits 31-0 of the HMAC computed from the <i>strFormat</i> parameter. </td>
     * </tr>
     * <tr>
     * <td>Data (variable)</td>
     * <td>Contains user-defined data for discovery.  This field must not exceed 240 bytes in length.</td>
     * </tr>
     * </table>
     *  </p>Element ID 221 specifies the Vendor-Specific information element defined in the IEEE 802.11 standards. The Organizational Unique Identifier (OUI) contains a 3-byte, IEEE-assigned OUI of the vendor that defined the content of the information element in the same order that the OUI would be transmitted in an IEEE 802.11 address field. The Element ID, Length, OUI, and OUI Type fields are controlled by the automatic configuration service, while the application controls the rest of the fields. 
     * 
     * The Format identifier hash field describes the format of the information carried in the PSD IE. To ensure uniqueness while circumventing the need for central administration of format identifiers, a string in the form of a Uniform Resource Identifier (URI), as specified in <a href="http://tools.ietf.org/html/rfc3986">RFC 3986</a>, is used to distinguish the format. However, because the transmission must be efficient and space in the information element is limited, the string is not actually transmitted, but, instead, its hash is transmitted. On the client, which is the receiving side of the beacon, the hash is matched against a known set of format identifiers.
     * 
     * The Format identifier hash field is represented by bits 0…31 of a hash-based message authentication code (HMAC) over the format identifier string specified in the <i>strFormat</i> parameter. The HMAC is used to specify the format of the Data field of the PSD  IE. The formula used to calculate the HMAC is described in <a href="https://www.ietf.org/rfc/rfc2104.txt">RFC 2104</a>. Sample code for the calculation of the HMAC is as specified in <a href="http://tools.ietf.org/html/rfc4634">RFC 4634</a>. When calculating the HMAC, use SHA-256 for the hash function. The key used is the "null" key (<b>NULL</b> pointer to the authentication key, and zero length authentication key per the source code in <a href="http://tools.ietf.org/html/rfc4634">RFC 4634</a>). Use the value of <i>strFormat</i> parameter (including any spaces but excluding the NULL-termination character) as the input text encoded as Unicode UTF-16 in little-endian format.
     * 
     * For example, if the <i>strFormat</i> parameter is <c>http://schemas.xmlsoaps.org/ws/2004/10/discovery</code>, then the first four octets of the corresponding HMAC is <code>0xF8 0xCB 0x35 0x15</c>. 
     * 
     * If the <i>strFormat</i> parameter is <c>http://schemas.microsoft.com/networking/discoveryformat/v2</code>, then the four octets of the corresponding HMAC are <code>0xCF 0xF1 0x64 0x17</c>. 
     * 
     * When sending the first 4 octets of an HMAC over the network, send the first (left-most) octet first.
     * 
     * Note that there may be collisions in the truncated HMACs, which means that it may be impossible to uniquely determine the discovery protocol corresponding to the payload of a PSD IE from the given bits of an HMAC. An application receiving a PSD IE must take a best guess at the discovery protocol used from a given HMAC, then re-run the higher-level discovery protocol once a connection has been established.
     * 
     * At most, five PSD IEs can be passed in a list. Also, the total length, in bytes, of the PSD IE list may be restricted by hardware limitations on the length of a beacon.
     * 
     * An application can call  <b>WlanSetPsdIeDataList</b> many times. When <b>WlanSetPsdIeDataList</b>  is called twice with the same <i>strFormat</i>, the contents of the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_raw_data_list">WLAN_RAW_DATA_LIST</a> populated by the first function call are overwritten by the second call's <b>WLAN_RAW_DATA_LIST</b> payload. When <b>WlanSetPsdIeDataList</b>  is called with the <i>pPsdIEDataList</i> parameter set to <b>NULL</b>, the PSD IE list associated with <i>strFormat</i> is cleared. When <b>WlanSetPsdIeDataList</b>  is called with both the <i>pPsdIEDataList</i>  and <i>strFormat</i> parameters set to <b>NULL</b>, all PSD IE lists set by the application are cleared. 
     * 
     * The wireless service processes PSD IE data lists set by different applications and generates  raw IE data blobs. When a machine creates or joins an ad-hoc network on any wireless adapter, it sends beacons that include a PSD IE data blob associated with the network to other machines. 
     * 
     * Stations can call <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanextractpsdiedatalist">WlanExtractPsdIEDataList</a> function to get the PSD IE data list after receiving a beacon from a machine.
     * @param {Pointer<Void>} hClientHandle The client's session handle, obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
     * @param {Pointer<Char>} strFormat The format of a PSD IE in the PSD IE data list passed in the <i>pPsdIEDataList</i> parameter. This is a NULL-terminated URI string that specifies the namespace of the protocol used for discovery.
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
     * @see https://learn.microsoft.com/windows/win32/api/wlanapi/nf-wlanapi-wlansetpsdiedatalist
     * @since windows6.0.6000
     */
    static WlanSetPsdIEDataList(hClientHandle, strFormat, pPsdIEDataList) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        strFormat := strFormat is String? StrPtr(strFormat) : strFormat

        result := DllCall("wlanapi.dll\WlanSetPsdIEDataList", "ptr", hClientHandle, "ptr", strFormat, "ptr", pPsdIEDataList, "ptr", pReserved, "uint")
        return result
    }

    /**
     * Saves a temporary profile to the profile store.
     * @remarks
     * A temporary profile is the one passed to <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanconnect">WlanConnect</a> or generated by the discovery engine.  A network connection can be established using a temporary profile.  Using this API saves the temporary profile and associated user data to the profile store.
     * 
     * A new profile is added at the top of the list after the group policy profiles. A profile's position in the list is not changed if an existing profile is overwritten.
     * 
     * All-user profiles have three associated permissions: read, write, and execute. If a user has read access, the user can view profile permissions. If a user has execute access, the user has read access and the user can also connect to and disconnect from a network using the profile. If a user has write access, the user has execute access and the user can also modify and delete permissions associated with a profile.
     * 
     * The following describes the procedure for creating a security descriptor object and parsing it as a string.
     * 
     * <ol>
     * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-initializesecuritydescriptor">InitializeSecurityDescriptor</a> to create a security descriptor in memory.</li>
     * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-setsecuritydescriptorowner">SetSecurityDescriptorOwner</a>.</li>
     * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-initializeacl">InitializeAcl</a> to create a discretionary access control list (DACL) in memory.</li>
     * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-addaccessallowedace">AddAccessAllowedAce</a> or <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-addaccessdeniedace">AddAccessDeniedAce</a> to add access control entries (ACEs) to the DACL. Set the <i>AccessMask</i> parameter to one of the following bitwise OR combinations as appropriate:<ul>
     * <li>WLAN_READ_ACCESS</li>
     * <li>WLAN_READ_ACCESS | WLAN_EXECUTE_ACCESS</li>
     * <li>WLAN_READ_ACCESS | WLAN_EXECUTE_ACCESS | WLAN_WRITE_ACCESS     </li>
     * </ul>
     * </li>
     * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-setsecuritydescriptordacl">SetSecurityDescriptorDacl</a> to add the DACL to the security descriptor.</li>
     * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/sddl/nf-sddl-convertsecuritydescriptortostringsecuritydescriptora">ConvertSecurityDescriptorToStringSecurityDescriptor</a> to convert the descriptor to string.</li>
     * </ol>
     * The string returned by <a href="https://docs.microsoft.com/windows/desktop/api/sddl/nf-sddl-convertsecuritydescriptortostringsecuritydescriptora">ConvertSecurityDescriptorToStringSecurityDescriptor</a> can then be used as the <i>strAllUserProfileSecurity</i> parameter value when calling <b>WlanSaveTemporaryProfile</b>.
     * @param {Pointer<Void>} hClientHandle The client's session handle, obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
     * @param {Pointer<Guid>} pInterfaceGuid The GUID of the interface.
     * @param {Pointer<Char>} strProfileName The name of the profile to be saved. Profile names are case-sensitive. This string must be NULL-terminated.
     * @param {Pointer<Char>} strAllUserProfileSecurity Sets the security descriptor string on the all-user profile.  By default, for a new all-user profile, all users have write access on the profile. For more information about profile permissions, see the Remarks section.
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
     * @param {Integer} bOverWrite Specifies whether this profile is overwriting an existing profile.  If this parameter is <b>FALSE</b> and the profile already exists, the existing profile will not be overwritten and an error will be returned.
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
     * @see https://learn.microsoft.com/windows/win32/api/wlanapi/nf-wlanapi-wlansavetemporaryprofile
     * @since windows6.0.6000
     */
    static WlanSaveTemporaryProfile(hClientHandle, pInterfaceGuid, strProfileName, strAllUserProfileSecurity, dwFlags, bOverWrite) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        strProfileName := strProfileName is String? StrPtr(strProfileName) : strProfileName
        strAllUserProfileSecurity := strAllUserProfileSecurity is String? StrPtr(strAllUserProfileSecurity) : strAllUserProfileSecurity

        result := DllCall("wlanapi.dll\WlanSaveTemporaryProfile", "ptr", hClientHandle, "ptr", pInterfaceGuid, "ptr", strProfileName, "ptr", strAllUserProfileSecurity, "uint", dwFlags, "int", bOverWrite, "ptr", pReserved, "uint")
        return result
    }

    /**
     * Allows an OEM or IHV component to communicate with a device service on a particular wireless LAN interface.
     * @param {Pointer<Void>} hClientHandle Type: **[HANDLE](/windows/win32/winprog/windows-data-types)**
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
     * @param {Pointer<UInt32>} pdwBytesReturned Type: **[PDWORD](/windows/win32/winprog/windows-data-types)**
     * 
     * The number of bytes returned.
     * @returns {Integer} Type: **[HRESULT](/windows/win32/com/structure-of-com-error-codes)**
     * 
     * If the function succeeds, the return value is **ERROR_SUCCESS**. If the function fails with **ERROR_ACCESS_DENIED**, then the caller doesn't have sufficient permissions to perform this operation. The caller needs to either have admin privilege, or needs to be a UMDF driver.
     * @see https://learn.microsoft.com/windows/win32/api/wlanapi/nf-wlanapi-wlandeviceservicecommand
     */
    static WlanDeviceServiceCommand(hClientHandle, pInterfaceGuid, pDeviceServiceGuid, dwOpCode, dwInBufferSize, pInBuffer, dwOutBufferSize, pOutBuffer, pdwBytesReturned) {
        result := DllCall("wlanapi.dll\WlanDeviceServiceCommand", "ptr", hClientHandle, "ptr", pInterfaceGuid, "ptr", pDeviceServiceGuid, "uint", dwOpCode, "uint", dwInBufferSize, "ptr", pInBuffer, "uint", dwOutBufferSize, "ptr", pOutBuffer, "uint*", pdwBytesReturned, "uint")
        return result
    }

    /**
     * Retrieves a list of the supported device services on a given wireless LAN interface.
     * @remarks
     * If the call succeeds, then the **WlanGetSupportedDeviceServices** function allocates memory for the device services **GUID** list that's returned in a buffer pointed to by the *ppDevSvcGuidList* parameter. When you no longer need the buffer pointed to by *ppDevSvcGuidList*, you should release the memory used for it by calling the [WlanFreeMemory](./nf-wlanapi-wlanfreememory.md) function.
     * @param {Pointer<Void>} hClientHandle Type: **[HANDLE](/windows/win32/winprog/windows-data-types)**
     * 
     * The client's session handle, obtained by a previous call to the [WlanOpenHandle](./nf-wlanapi-wlanopenhandle.md) function.
     * @param {Pointer<Guid>} pInterfaceGuid Type: **CONST [GUID](../guiddef/ns-guiddef-guid.md)\***
     * 
     * A pointer to the **GUID** of the wireless LAN interface to be queried. You can determine the **GUID** of each wireless LAN interface enabled on a local computer by using the [WlanEnumInterfaces](./nf-wlanapi-wlanenuminterfaces.md) function.
     * @param {Pointer<WLAN_DEVICE_SERVICE_GUID_LIST>} ppDevSvcGuidList Type: **[PWLAN_DEVICE_SERVICE_GUID_LIST](./ns-wlanapi-wlan_device_service_guid_list.md)\***
     * 
     * A pointer to storage for a pointer to receive the returned list of device service **GUID**s in a [WLAN_DEVICE_SERVICE_GUID_LIST](./ns-wlanapi-wlan_device_service_guid_list.md) structure. If the call succeeds, then the buffer for the **WLAN_DEVICE_SERVICE_GUID_LIST** returned is allocated by the **WlanGetSupportedDeviceServices** function.
     * @returns {Integer} Type: **[HRESULT](/windows/win32/com/structure-of-com-error-codes)**
     * 
     * If the function succeeds, the return value is **ERROR_SUCCESS**. If the function fails with **ERROR_ACCESS_DENIED**, then the caller doesn't have sufficient permissions to perform this operation. The caller needs to either have admin privilege, or needs to be a UMDF driver.
     * @see https://learn.microsoft.com/windows/win32/api/wlanapi/nf-wlanapi-wlangetsupporteddeviceservices
     */
    static WlanGetSupportedDeviceServices(hClientHandle, pInterfaceGuid, ppDevSvcGuidList) {
        result := DllCall("wlanapi.dll\WlanGetSupportedDeviceServices", "ptr", hClientHandle, "ptr", pInterfaceGuid, "ptr", ppDevSvcGuidList, "uint")
        return result
    }

    /**
     * Allows user mode clients with admin privileges, or User-Mode Driver Framework (UMDF) drivers, to register for unsolicited notifications corresponding to device services that they're interested in.
     * @remarks
     * The **WlanRegisterDeviceServiceNotification** function is an extension to existing native Wi-Fi APIs for WLAN device services.
     * 
     * A client application calls this function to register and unregister notifications for device services that it is interested in.
     * 
     * Any registration to receive notifications for device services caused by this function would be automatically undone if the calling application closes its calling handle (by calling [WlanCloseHandle](./nf-wlanapi-wlanclosehandle.md) with the *hClientHandle* parameter), or if the process ends.
     * 
     * In order to receive these notifications, a client needs to call this function with a valid *pDevSvcGuidList* parameter, and must also call the [WlanRegisterNotification](./nf-wlanapi-wlanregisternotification.md) function with a *dwNotifSource* argument of **WLAN_NOTIFICATION_SOURCE_DEVICE_SERVICE** (which is defined in `wlanapi.h`). The registration to receive notifications for device services is in effect until the application closes the client handle (by calling [WlanCloseHandle](./nf-wlanapi-wlanclosehandle.md) with the *hClientHandle* parameter), or the process ends, or **WlanRegisterDeviceServiceNotification** is called with a *pDevSvcGuidList* argument of `nullptr`, or else has *dwNumberOfItems* set to 0.
     * 
     * When the operating system (OS) receives a device service notification from an independent hardware vendor (IHV) driver, and a client has registered for these notifications using **WlanRegisterDeviceServiceNotification**, the client will receive them via the [WLAN_NOTIFICATION_CALLBACK](./nc-wlanapi-wlan_notification_callback.md) that it had registered through its call to [WlanRegisterNotification](./nf-wlanapi-wlanregisternotification.md). This callback will be called for every notification that the client has received (with a separate buffer for every notification).
     * 
     * The *NotificationSource* member of the [WLAN_NOTIFICATION_DATA](/previous-versions/windows/desktop/legacy/ms706902(v=vs.85)) structure received by the callback function (that is, the *data* member) will be set to **WLAN_NOTIFICATION_SOURCE_DEVICE_SERVICE**. The data blob, the device service **GUID**, and the opcode associated with this notification will be present in the *pData* member of the **WLAN_NOTIFICATION_DATA**, which will point to a structure of type [WLAN_DEVICE_SERVICE_NOTIFICATION_DATA](./ns-wlanapi-wlan_device_service_notification_data.md).
     * 
     * > [!NOTE]
     * > The WLAN service, or the OS, will not check to see whether the device service **GUID**s that the client registers for are actually supported by the IHV driver. It is up to the client to query for supported device services using [WlanGetSupportedDeviceServices](./nf-wlanapi-wlangetsupporteddeviceservices.md) API if they need to.
     * @param {Pointer<Void>} hClientHandle Type: **[HANDLE](/windows/win32/winprog/windows-data-types)**
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
     * @see https://learn.microsoft.com/windows/win32/api/wlanapi/nf-wlanapi-wlanregisterdeviceservicenotification
     */
    static WlanRegisterDeviceServiceNotification(hClientHandle, pDevSvcGuidList) {
        result := DllCall("wlanapi.dll\WlanRegisterDeviceServiceNotification", "ptr", hClientHandle, "ptr", pDevSvcGuidList, "uint")
        return result
    }

    /**
     * Extracts the proximity service discovery (PSD) information element (IE) data list from raw IE data included in a beacon.
     * @remarks
     * For more information about PSD IEs, including a discussion of the format of an IE, see <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlansetpsdiedatalist">WlanSetPsdIEDataList</a>.
     * @param {Pointer<Void>} hClientHandle The client's session handle, obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
     * @param {Integer} dwIeDataSize The size, in bytes, of the <i>pRawIeData</i> parameter.
     * @param {Pointer} pRawIeData The raw IE data for all IEs in the list.
     * @param {Pointer<Char>} strFormat Describes the format of a PSD IE. Only IEs with a matching format are returned.
     * @param {Pointer<WLAN_RAW_DATA_LIST>} ppPsdIEDataList A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_raw_data_list">PWLAN_RAW_DATA_LIST</a> structure that contains the formatted data list.
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
     * @see https://learn.microsoft.com/windows/win32/api/wlanapi/nf-wlanapi-wlanextractpsdiedatalist
     * @since windows6.0.6000
     */
    static WlanExtractPsdIEDataList(hClientHandle, dwIeDataSize, pRawIeData, strFormat, ppPsdIEDataList) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        strFormat := strFormat is String? StrPtr(strFormat) : strFormat

        result := DllCall("wlanapi.dll\WlanExtractPsdIEDataList", "ptr", hClientHandle, "uint", dwIeDataSize, "ptr", pRawIeData, "ptr", strFormat, "ptr", pReserved, "ptr", ppPsdIEDataList, "uint")
        return result
    }

    /**
     * Retrieves a string that describes a specified reason code.
     * @param {Integer} dwReasonCode A <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/wlan-reason-code">WLAN_REASON_CODE</a> value of which the string description is requested.
     * @param {Integer} dwBufferSize The size of the buffer used to store the string, in <b>WCHAR</b>.  If the reason code string is longer than the buffer, it will be truncated and NULL-terminated. If <i>dwBufferSize</i> is larger than the actual amount of memory allocated to <i>pStringBuffer</i>, then an access violation will occur in the calling program.
     * @param {Pointer<Char>} pStringBuffer Pointer to a buffer that will receive the string. The caller must allocate memory to <i>pStringBuffer</i> before calling <b>WlanReasonCodeToString</b>.
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wlanapi/nf-wlanapi-wlanreasoncodetostring
     * @since windows6.0.6000
     */
    static WlanReasonCodeToString(dwReasonCode, dwBufferSize, pStringBuffer) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        pStringBuffer := pStringBuffer is String? StrPtr(pStringBuffer) : pStringBuffer

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
     * An application can call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> to obtain extended error information.
     * @see https://learn.microsoft.com/windows/win32/api/wlanapi/nf-wlanapi-wlanallocatememory
     * @since windows6.0.6000
     */
    static WlanAllocateMemory(dwMemorySize) {
        A_LastError := 0

        result := DllCall("wlanapi.dll\WlanAllocateMemory", "uint", dwMemorySize)
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Frees memory.
     * @remarks
     * If <i>pMemory</i> points to memory that has already been freed, an access violation or heap corruption may occur.
     * 
     * There is a hotfix available for  Wireless LAN API for Windows XP with Service Pack 2 (SP2) that can help improve the performance of applications that call <b>WlanFreeMemory</b> and <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlangetavailablenetworklist">WlanGetAvailableNetworkList</a> many times.
     * @param {Pointer<Void>} pMemory Pointer to the memory to be freed.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wlanapi/nf-wlanapi-wlanfreememory
     * @since windows6.0.6000
     */
    static WlanFreeMemory(pMemory) {
        DllCall("wlanapi.dll\WlanFreeMemory", "ptr", pMemory)
    }

    /**
     * Sets the security settings for a configurable object.
     * @remarks
     * A successful call to the <b>WlanSetSecuritySettings</b> function overrides the default permissions associated with an object. For more information about default permissions, see <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/native-wifi-api-permissions">Native Wifi API Permissions</a>.
     * 
     * The following describes the procedure for creating a security descriptor object and parsing it as a string.
     * 
     * <ol>
     * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-initializesecuritydescriptor">InitializeSecurityDescriptor</a> to create a security descriptor in memory.</li>
     * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-setsecuritydescriptorowner">SetSecurityDescriptorOwner</a> to set the owner information for the security descriptor.</li>
     * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-initializeacl">InitializeAcl</a> to create a discretionary access control list (DACL) in memory.</li>
     * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-addaccessallowedace">AddAccessAllowedAce</a> or <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-addaccessdeniedace">AddAccessDeniedAce</a> to add access control entries (ACEs) to the DACL. Set the <i>AccessMask</i> parameter to one of the following bitwise OR combinations as appropriate:<ul>
     * <li>WLAN_READ_ACCESS</li>
     * <li>WLAN_READ_ACCESS | WLAN_EXECUTE_ACCESS</li>
     * <li>WLAN_READ_ACCESS | WLAN_EXECUTE_ACCESS | WLAN_WRITE_ACCESS</li>
     * </ul>
     * </li>
     * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-setsecuritydescriptordacl">SetSecurityDescriptorDacl</a> to add the DACL to the security descriptor.</li>
     * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/sddl/nf-sddl-convertsecuritydescriptortostringsecuritydescriptora">ConvertSecurityDescriptorToStringSecurityDescriptor</a> to convert the descriptor to string.</li>
     * </ol>
     * The string returned by <a href="https://docs.microsoft.com/windows/desktop/api/sddl/nf-sddl-convertsecuritydescriptortostringsecuritydescriptora">ConvertSecurityDescriptorToStringSecurityDescriptor</a> can then be used as the <i>strModifiedSDDL</i> parameter value when calling <b>WlanSetSecuritySettings</b>.
     * @param {Pointer<Void>} hClientHandle The client's session handle, obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
     * @param {Integer} SecurableObject A <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ne-wlanapi-wlan_securable_object">WLAN_SECURABLE_OBJECT</a> value that specifies the object to which the security settings will be applied.
     * @param {Pointer<Char>} strModifiedSDDL A security descriptor string that specifies the new security settings for the object. This string must be NULL-terminated. For more information, see the Remarks section.
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
     * @see https://learn.microsoft.com/windows/win32/api/wlanapi/nf-wlanapi-wlansetsecuritysettings
     * @since windows6.0.6000
     */
    static WlanSetSecuritySettings(hClientHandle, SecurableObject, strModifiedSDDL) {
        strModifiedSDDL := strModifiedSDDL is String? StrPtr(strModifiedSDDL) : strModifiedSDDL

        result := DllCall("wlanapi.dll\WlanSetSecuritySettings", "ptr", hClientHandle, "int", SecurableObject, "ptr", strModifiedSDDL, "uint")
        return result
    }

    /**
     * Gets the security settings associated with a configurable object.
     * @remarks
     * The caller is responsible for freeing the memory allocated to the security descriptor string pointed to by the <i>pstrCurrentSDDL</i> parameter if the function succeeds. When no longer needed, the memory for the security descriptor string should be freed by calling <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanfreememory">WlanFreeMemory</a> function and passing in the <i>pstrCurrentSDDL</i> parameter.
     * @param {Pointer<Void>} hClientHandle The client's session handle, obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
     * @param {Integer} SecurableObject A <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ne-wlanapi-wlan_securable_object">WLAN_SECURABLE_OBJECT</a> value that specifies the object to which the security settings apply.
     * @param {Pointer<Int32>} pValueType A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/wlanapi/ne-wlanapi-wlan_opcode_value_type-r1">WLAN_OPCODE_VALUE_TYPE</a> value that specifies the source of the security settings.
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
     * @param {Pointer<Char>} pstrCurrentSDDL On input, this parameter must be <b>NULL</b>. 
     * 
     * On output, this parameter receives a pointer to the security descriptor string that specifies the security settings for the object if the function call succeeds. For more information about this string, see <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlansetsecuritysettings">WlanSetSecuritySettings</a> function.
     * @param {Pointer<UInt32>} pdwGrantedAccess The access mask of the object.
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
     * @see https://learn.microsoft.com/windows/win32/api/wlanapi/nf-wlanapi-wlangetsecuritysettings
     * @since windows6.0.6000
     */
    static WlanGetSecuritySettings(hClientHandle, SecurableObject, pValueType, pstrCurrentSDDL, pdwGrantedAccess) {
        result := DllCall("wlanapi.dll\WlanGetSecuritySettings", "ptr", hClientHandle, "int", SecurableObject, "int*", pValueType, "ptr", pstrCurrentSDDL, "uint*", pdwGrantedAccess, "uint")
        return result
    }

    /**
     * Displays the wireless profile user interface (UI).
     * @remarks
     * If <b>WlanUIEditProfile</b> returns ERROR_SUCCESS, any changes to the profile made in the UI will be saved in the profile store.
     * @param {Integer} dwClientVersion Specifies the highest version of the WLAN API that the client supports. 
     * Values other than WLAN_UI_API_VERSION will be ignored.
     * @param {Pointer<Char>} wstrProfileName Contains the name of the profile to be viewed or edited. Profile names are case-sensitive. This string must be NULL-terminated.
     * 
     * The supplied profile must be present on the interface <i>pInterfaceGuid</i>. That means the profile must have been previously created and saved in the profile store and that the profile must be valid for the supplied interface.
     * @param {Pointer<Guid>} pInterfaceGuid The GUID of the interface.
     * @param {Pointer<Void>} hWnd The handle of the  application window requesting the UI display.
     * @param {Integer} wlStartPage A <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ne-wlanapi-wl_display_pages">WL_DISPLAY_PAGES</a> value that specifies the active tab when the UI dialog box appears.
     * @param {Pointer<UInt32>} pWlanReasonCode A pointer to a <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/wlan-reason-code">WLAN_REASON_CODE</a> value that indicates why the UI display failed.
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
     * @see https://learn.microsoft.com/windows/win32/api/wlanapi/nf-wlanapi-wlanuieditprofile
     * @since windows6.0.6000
     */
    static WlanUIEditProfile(dwClientVersion, wstrProfileName, pInterfaceGuid, hWnd, wlStartPage, pWlanReasonCode) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        wstrProfileName := wstrProfileName is String? StrPtr(wstrProfileName) : wstrProfileName

        result := DllCall("wlanui.dll\WlanUIEditProfile", "uint", dwClientVersion, "ptr", wstrProfileName, "ptr", pInterfaceGuid, "ptr", hWnd, "int", wlStartPage, "ptr", pReserved, "uint*", pWlanReasonCode, "uint")
        return result
    }

    /**
     * Starts the wireless Hosted Network.
     * @remarks
     * The <b>WlanHostedNetworkStartUsing</b> function is an extension to native wireless APIs added to support the wireless Hosted Network on Windows 7 and on Windows Server 2008 R2 with the Wireless LAN Service installed. 
     * 
     * A client application calls the <b>WlanHostedNetworkStartUsing</b> function to start the wireless Hosted Network. Successful calls must be matched by calls to <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanhostednetworkstopusing">WlanHostedNetworkStopUsing</a> function.
     * This call could fail if Hosted Network state is <b>wlan_hosted_network_unavailable</b>.
     * 
     * Any Hosted Network state change caused by this function would be automatically undone if the calling application closes its calling handle (by calling <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanclosehandle">WlanCloseHandle</a> with the <i>hClientHandle</i> parameter) or if the process ends.
     * 
     * 
     * Any user can call the <b>WlanHostedNetworkStartUsing</b> function to start the Hosted Network. However, the ability to enable the wireless Hosted Network may be restricted by group policy in a domain.
     * 
     * On Windows 7 and later, the operating system installs a virtual device if a Hosted Network capable wireless adapter is present on the machine. This virtual device normally shows up in the “Network Connections Folder” as ‘Wireless  Network Connection 2’ with a Device Name of ‘Microsoft Virtual WiFi Miniport adapter’ if the computer has a single wireless network adapter. This virtual device is used exclusively for performing software access point (SoftAP) connections and is not present in the list returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanenuminterfaces">WlanEnumInterfaces</a> function. The lifetime of this virtual device is tied to the physical wireless adapter. If the physical wireless adapter is disabled, this virtual device will be removed as well. This feature is also available on Windows Server 2008 R2 with the Wireless LAN Service installed.
     * @param {Pointer<Void>} hClientHandle The client's session handle, returned by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
     * @param {Pointer<Int32>} pFailReason An optional pointer to a value that receives the failure reason,  if the call to the <b>WlanHostedNetworkStartUsing</b> function fails. Possible values for the failure reason are from the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ne-wlanapi-wlan_hosted_network_reason">WLAN_HOSTED_NETWORK_REASON</a> enumeration type defined in the <i>Wlanapi.h </i> header file.
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wlanapi/nf-wlanapi-wlanhostednetworkstartusing
     * @since windows6.1
     */
    static WlanHostedNetworkStartUsing(hClientHandle, pFailReason) {
        static pvReserved := 0 ;Reserved parameters must always be NULL

        result := DllCall("wlanapi.dll\WlanHostedNetworkStartUsing", "ptr", hClientHandle, "int*", pFailReason, "ptr", pvReserved, "uint")
        return result
    }

    /**
     * Stops the wireless Hosted Network.
     * @remarks
     * The <b>WlanHostedNetworkStopUsing</b> function is an extension to native wireless APIs added to support the wireless Hosted Network on Windows 7 and on Windows Server 2008 R2 with the Wireless LAN Service installed. 
     * 
     * An application calls the <b>WlanHostedNetworkStopUsing</b> function to stop the Hosted Network. A application calls the <b>WlanHostedNetworkStopUsing</b> function to match earlier successful calls to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanhostednetworkstartusing">WlanHostedNetworkStartUsing</a> function. The wireless Hosted Network will remain active until all applications have called the <b>WlanHostedNetworkStopUsing</b> function or the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanhostednetworkforcestop">WlanHostedNetworkForceStop</a> function is called to force a stop. When the wireless Hosted Network has stopped, the state switches to <b>wlan_hosted_network_idle</b>. This call could also fail if the Hosted Network state changed because of external events (for example, if the miniport driver for the wireless interface card becomes unavailable). 
     * 
     * Any user can call this function to stop the Hosted Network. However, the ability to enable the wireless Hosted Network may be restricted by group policy in a domain.
     * 
     * On Windows 7 and later, the operating system installs a virtual device if a Hosted Network capable wireless adapter is present on the machine. This virtual device normally shows up in the “Network Connections Folder” as ‘Wireless  Network Connection 2’ with a Device Name of ‘Microsoft Virtual WiFi Miniport adapter’ if the computer has a single wireless network adapter. This virtual device is used exclusively for performing software access point (SoftAP) connections and is not present in the list returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanenuminterfaces">WlanEnumInterfaces</a> function. The lifetime of this virtual device is tied to the physical wireless adapter. If the physical wireless adapter is disabled, this virtual device will be removed as well. This feature is also available on Windows Server 2008 R2 with the Wireless LAN Service installed.
     * @param {Pointer<Void>} hClientHandle The client's session handle, returned by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
     * @param {Pointer<Int32>} pFailReason An optional pointer to a value that receives the failure reason  if the call to the <b>WlanHostedNetworkStopUsing</b> function fails. Possible values for the failure reason are from the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ne-wlanapi-wlan_hosted_network_reason">WLAN_HOSTED_NETWORK_REASON</a> enumeration type defined in the <i>Wlanapi.h </i> header file.
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wlanapi/nf-wlanapi-wlanhostednetworkstopusing
     * @since windows6.1
     */
    static WlanHostedNetworkStopUsing(hClientHandle, pFailReason) {
        static pvReserved := 0 ;Reserved parameters must always be NULL

        result := DllCall("wlanapi.dll\WlanHostedNetworkStopUsing", "ptr", hClientHandle, "int*", pFailReason, "ptr", pvReserved, "uint")
        return result
    }

    /**
     * Transitions the wireless Hosted Network to the wlan_hosted_network_active state without associating the request with the application's calling handle.
     * @remarks
     * The <b>WlanHostedNetworkForceStart</b> function is an extension to native wireless APIs added to support the wireless Hosted Network on Windows 7 and on Windows Server 2008 R2 with the Wireless LAN Service installed. 
     * 
     * A client application calls the <b>WlanHostedNetworkForceStart</b> function to force the start of the wireless Hosted Network by transitioning the wireless Hosted Network to the <b>wlan_hosted_network_active state</b> without associating the request with the application's calling handle. A successful call to the <b>WlanHostedNetworkForceStart</b> function should eventually be matched by a call to <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanhostednetworkforcestop">WlanHostedNetworkForceStop</a> function.
     * Any Hosted Network state change caused by this function would not be automatically undone if the calling application closes its calling handle (by calling <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanclosehandle">WlanCloseHandle</a> with the <i>hClientHandle</i> parameter) or if the process ends.
     * 
     * 
     * The cost of calling the <b>WlanHostedNetworkForceStart</b> function over calling <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanhostednetworkstartusing">WlanHostedNetworkStartUsing</a> is the associated privilege required. An application might call the <b>WlanHostedNetworkForceStart</b> function after ensuring that an elevated system user accepts the increased power requirements involved in running the wireless Hosted Network for extended durations.
     * 
     * The <b>WlanHostedNetworkForceStart</b> function could fail if Hosted Network state is <b>wlan_hosted_network_unavailable</b> or the caller does not have sufficient privileges.
     * 
     * This function to force the start of the Hosted Network can only be called if the user has the appropriate associated privilege. Permissions are stored in a discretionary access control list (DACL) associated with a <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ne-wlanapi-wlan_securable_object">WLAN_SECURABLE_OBJECT</a>.  To call the <b>WlanHostedNetworkForceStart</b>, the client access token of the caller must have elevated privileges exposed by the following enumeration in <b>WLAN_SECURABLE_OBJECT</b>: <ul>
     * <li><b>wlan_secure_hosted_network_elevated_access</b></li>
     * </ul>
     * 
     * 
     * The ability to enable the wireless Hosted Network may also be restricted by group policy in a domain.
     * 
     * On Windows 7 and later, the operating system installs a virtual device if a Hosted Network capable wireless adapter is present on the machine. This virtual device normally shows up in the “Network Connections Folder” as ‘Wireless  Network Connection 2’ with a Device Name of ‘Microsoft Virtual WiFi Miniport adapter’ if the computer has a single wireless network adapter. This virtual device is used exclusively for performing software access point (SoftAP) connections and is not present in the list returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanenuminterfaces">WlanEnumInterfaces</a> function. The lifetime of this virtual device is tied to the physical wireless adapter. If the physical wireless adapter is disabled, this virtual device will be removed as well. This feature is also available on Windows Server 2008 R2 with the Wireless LAN Service installed.
     * @param {Pointer<Void>} hClientHandle The client's session handle, returned by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
     * @param {Pointer<Int32>} pFailReason An optional pointer to a value that receives the failure reason  if the call to the <b>WlanHostedNetworkForceStart</b> function fails. Possible values for the failure reason are from the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ne-wlanapi-wlan_hosted_network_reason">WLAN_HOSTED_NETWORK_REASON</a> enumeration type defined in the <i>Wlanapi.h </i> header file.
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wlanapi/nf-wlanapi-wlanhostednetworkforcestart
     * @since windows6.1
     */
    static WlanHostedNetworkForceStart(hClientHandle, pFailReason) {
        static pvReserved := 0 ;Reserved parameters must always be NULL

        result := DllCall("wlanapi.dll\WlanHostedNetworkForceStart", "ptr", hClientHandle, "int*", pFailReason, "ptr", pvReserved, "uint")
        return result
    }

    /**
     * Transitions the wireless Hosted Network to the wlan_hosted_network_idle without associating the request with the application's calling handle.
     * @remarks
     * The <b>WlanHostedNetworkForceStop</b> function is an extension to native wireless APIs added to support the wireless Hosted Network on Windows 7 and on Windows Server 2008 R2 with the Wireless LAN Service installed. 
     * 
     * A client application calls the <b>WlanHostedNetworkForceStop</b> function to force the stop the Hosted Network and transition the wireless Hosted Network to the <b>wlan_hosted_network_idle</b> without associating the request with the application's calling handle. A client typically calls the <b>WlanHostedNetworkForceStop</b> function to match an earlier successful call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanhostednetworkforcestart">WlanHostedNetworkForceStart</a> function. 
     * 
     * The <b>WlanHostedNetworkForceStop</b> function could fail if Hosted Network state is not <b>wlan_hosted_network_active</b>.
     * 
     * Any Hosted Network state change caused by this function would not be automatically undone if the calling application closes its calling handle (by calling <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanclosehandle">WlanCloseHandle</a> with the <i>hClientHandle</i> parameter) or if the process ends.
     * 
     * 
     * An application might call the <b>WlanHostedNetworkForceStop</b> function to stop the Hosted Network after a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanhostednetworkforcestart">WlanHostedNetworkForceStart</a> by an elevated system user that accepted the increased power requirements involved in running the wireless Hosted Network for extended durations.
     * 
     * Any user can call the <b>WlanHostedNetworkForceStop</b> function to force the stop of the Hosted Network. However, the ability to enable the wireless Hosted Network may be restricted by group policy in a domain.
     * 
     * On Windows 7 and later, the operating system installs a virtual device if a Hosted Network capable wireless adapter is present on the machine. This virtual device normally shows up in the “Network Connections Folder” as ‘Wireless  Network Connection 2’ with a Device Name of ‘Microsoft Virtual WiFi Miniport adapter’ if the computer has a single wireless network adapter. This virtual device is used exclusively for performing software access point (SoftAP) connections and is not present in the list returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanenuminterfaces">WlanEnumInterfaces</a> function. The lifetime of this virtual device is tied to the physical wireless adapter. If the physical wireless adapter is disabled, this virtual device will be removed as well. This feature is also available on Windows Server 2008 R2 with the Wireless LAN Service installed.
     * @param {Pointer<Void>} hClientHandle The client's session handle, returned by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
     * @param {Pointer<Int32>} pFailReason An optional pointer to a value that receives the failure reason,  if the call to the <b>WlanHostedNetworkForceStop</b> function fails. Possible values for the failure reason are from the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ne-wlanapi-wlan_hosted_network_reason">WLAN_HOSTED_NETWORK_REASON</a> enumeration type defined in the <i>Wlanapi.h </i> header file.
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wlanapi/nf-wlanapi-wlanhostednetworkforcestop
     * @since windows6.1
     */
    static WlanHostedNetworkForceStop(hClientHandle, pFailReason) {
        static pvReserved := 0 ;Reserved parameters must always be NULL

        result := DllCall("wlanapi.dll\WlanHostedNetworkForceStop", "ptr", hClientHandle, "int*", pFailReason, "ptr", pvReserved, "uint")
        return result
    }

    /**
     * Queries the current static properties of the wireless Hosted Network.
     * @remarks
     * The <b>WlanHostedNetworkQueryProperty</b> function is an extension to native wireless APIs added to support the wireless Hosted Network on Windows 7 and on Windows Server 2008 R2 with the Wireless LAN Service installed. 
     * 
     * A client application calls the <b>WlanHostedNetworkQueryProperty</b> function to query the current static properties of the wireless Hosted Network. This function does not change the state or properties of the wireless Hosted Network.
     * 
     * If the function succeeds, the <i>ppvData</i> parameter points to a buffer that contains the requested property. The size of this buffer is returned in a pointer returned in the <i>pwdDataSize</i> parameter. The <a href="https://docs.microsoft.com/windows/win32/api/wlanapi/ne-wlanapi-wlan_opcode_value_type-r1">WLAN_OPCODE_VALUE_TYPE</a> is returned in a pointer returned in the <i>pWlanOpcodeValueType</i> parameter. The memory used for the buffer in the <i>ppvData</i> parameter that is returned should be released by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanfreememory">WlanFreeMemory</a> function after the buffer is no longer needed.
     * 
     * The data type associated with the buffer pointed to by the <i>ppvData</i> parameter depends upon the value of <i>OpCode</i> parameter as follows: 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>OpCode</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <a id="wlan_hosted_network_opcode_connection_settings"></a><a id="WLAN_HOSTED_NETWORK_OPCODE_CONNECTION_SETTINGS"></a>wlan_hosted_network_opcode_connection_settings
     * 
     * </td>
     * <td width="60%">
     * A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/wlanapi/ns-wlanapi-wlan_hosted_network_connection_settings">WLAN_HOSTED_NETWORK_CONNECTION_SETTINGS</a> structure is returned.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <a id="wlan_hosted_network_opcode_security_settings"></a><a id="WLAN_HOSTED_NETWORK_OPCODE_SECURITY_SETTINGS"></a>wlan_hosted_network_opcode_security_settings
     * 
     * </td>
     * <td width="60%">
     * A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/wlanapi/ns-wlanapi-wlan_hosted_network_security_settings">WLAN_HOSTED_NETWORK_SECURITY_SETTINGS</a> structure is returned.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <a id="wlan_hosted_network_opcode_station_profile"></a><a id="WLAN_HOSTED_NETWORK_OPCODE_STATION_PROFILE"></a>wlan_hosted_network_opcode_station_profile
     * 
     * </td>
     * <td width="60%">
     * A <b>PWSTR</b> to contains an XML WLAN profile for connecting to the wireless Hosted Network is returned.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <a id="wlan_hosted_network_opcode_enable"></a><a id="WLAN_HOSTED_NETWORK_OPCODE_ENABLE"></a>wlan_hosted_network_opcode_enable
     * 
     * </td>
     * <td width="60%">
     * A <b>PBOOL</b> that indicates if wireless Hosted Network is enabled is returned.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * If the <b>WlanHostedNetworkQueryProperty</b> function is passed any of the following values in the <i>OpCode</i> parameter before a SSID is configured in the wireless Hosted Network, the function will fail with <b>ERROR_BAD_CONFIGURATION</b>: <ul>
     * <li>wlan_hosted_network_opcode_station_profile</li>
     * <li>wlan_hosted_network_opcode_connection_settings</li>
     * </ul>
     * 
     * 
     * Any user can call the <b>WlanHostedNetworkQueryProperty</b> function to query the Hosted Network properties. 
     * 
     * On Windows 7 and later, the operating system installs a virtual device if a Hosted Network capable wireless adapter is present on the machine. This virtual device normally shows up in the “Network Connections Folder” as ‘Wireless  Network Connection 2’ with a Device Name of ‘Microsoft Virtual WiFi Miniport adapter’ if the computer has a single wireless network adapter. This virtual device is used exclusively for performing software access point (SoftAP) connections and is not present in the list returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanenuminterfaces">WlanEnumInterfaces</a> function. The lifetime of this virtual device is tied to the physical wireless adapter. If the physical wireless adapter is disabled, this virtual device will be removed as well. This feature is also available on Windows Server 2008 R2 with the Wireless LAN Service installed.
     * @param {Pointer<Void>} hClientHandle The client's session handle, returned by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
     * @param {Integer} OpCode The identifier for property to be queried. This identifier can be any of the values in the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ne-wlanapi-wlan_hosted_network_opcode">WLAN_HOSTED_NETWORK_OPCODE</a> enumeration defined in the <i>Wlanapi.h </i> header file.
     * @param {Pointer<UInt32>} pdwDataSize A pointer to a value that specifies the size, in bytes, of the buffer returned in the <i>ppvData</i> parameter, if the call to the <b>WlanHostedNetworkQueryProperty</b> function succeeds.
     * @param {Pointer<Void>} ppvData On input, this parameter must be <b>NULL</b>. 
     * 
     * On output, this parameter receives a pointer to a buffer returned with the static property requested,  if the call to the <b>WlanHostedNetworkQueryProperty</b> function succeeds.  The data type associated with this buffer depends upon the value of <i>OpCode</i> parameter.
     * @param {Pointer<Int32>} pWlanOpcodeValueType A pointer to a value that receives the value type of the wireless Hosted Network property,  if the call to the <b>WlanHostedNetworkQueryProperty</b> function succeeds. The returned value is an enumerated type in the <a href="https://docs.microsoft.com/windows/win32/api/wlanapi/ne-wlanapi-wlan_opcode_value_type-r1">WLAN_OPCODE_VALUE_TYPE</a> enumeration defined in the <i>Wlanapi.h </i> header file.
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
     * The configuration data for the wireless Hosted Network is unconfigured.  This error is returned if the application calls the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanhostednetworkqueryproperty">WlanHostedNetworkQueryProperty</a> function with the <i>OpCode</i> parameter set to  <b>wlan_hosted_network_opcode_station_profile</b> or <b>wlan_hosted_network_opcode_connection_settings</b> before a SSID is configured in the wireless Hosted Network.
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
     * <li><i>OpCode</i> is not one of the enumerated values defined in the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ne-wlanapi-wlan_hosted_network_opcode">WLAN_HOSTED_NETWORK_OPCODE</a>.</li>
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wlanapi/nf-wlanapi-wlanhostednetworkqueryproperty
     * @since windows6.1
     */
    static WlanHostedNetworkQueryProperty(hClientHandle, OpCode, pdwDataSize, ppvData, pWlanOpcodeValueType) {
        static pvReserved := 0 ;Reserved parameters must always be NULL

        result := DllCall("wlanapi.dll\WlanHostedNetworkQueryProperty", "ptr", hClientHandle, "int", OpCode, "uint*", pdwDataSize, "ptr", ppvData, "int*", pWlanOpcodeValueType, "ptr", pvReserved, "uint")
        return result
    }

    /**
     * Sets static properties of the wireless Hosted Network.
     * @remarks
     * The <b>WlanHostedNetworkSetProperty</b> function is an extension to native wireless APIs added to support the wireless Hosted Network on Windows 7 and on Windows Server 2008 R2 with the Wireless LAN Service installed. 
     * 
     * A client application calls the <b>WlanHostedNetworkSetProperty</b> function to set the current static properties of the wireless Hosted Network. 
     * Any Hosted Network property change caused by this function would not be automatically undone if the calling application closes its calling handle (by calling <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanclosehandle">WlanCloseHandle</a> with the <i>hClientHandle</i> parameter) or if the process ends.
     * 
     * 
     * The data type associated with the buffer pointed to by the <i>pvData</i> parameter depends upon the value of <i>OpCode</i> parameter as follows: 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>OpCode</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <a id="wlan_hosted_network_opcode_connection_settings"></a><a id="WLAN_HOSTED_NETWORK_OPCODE_CONNECTION_SETTINGS"></a>wlan_hosted_network_opcode_connection_settings
     * 
     * </td>
     * <td width="60%">
     * A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/wlanapi/ns-wlanapi-wlan_hosted_network_connection_settings">WLAN_HOSTED_NETWORK_CONNECTION_SETTINGS</a> structure is passed in the <i>pvData</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <a id="wlan_hosted_network_opcode_enable"></a><a id="WLAN_HOSTED_NETWORK_OPCODE_ENABLE"></a>wlan_hosted_network_opcode_enable
     * 
     * </td>
     * <td width="60%">
     * A pointer to <b>BOOL</b> is passed in the <i>pvData</i> parameter.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * If the <b>WlanHostedNetworkSetProperty</b> function is called with the <i>OpCode</i> parameter set to <b>wlan_hosted_network_opcode_enable</b>, the user must have the appropriate associated privilege. Permissions are stored in a discretionary access control list (DACL) associated with a <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ne-wlanapi-wlan_securable_object">WLAN_SECURABLE_OBJECT</a>.  To call the  <b>WlanHostedNetworkSetProperty</b> function with the <i>OpCode</i> parameter of <b>wlan_hosted_network_opcode_enable</b>, the client access token of the caller must have elevated privileges exposed by the following enumeration in <b>WLAN_SECURABLE_OBJECT</b>: <ul>
     * <li><b>wlan_secure_hosted_network_elevated_access</b></li>
     * </ul>
     * 
     * 
     * If the <b>WlanHostedNetworkSetProperty</b> function is passed any of the following values in the <i>OpCode</i> parameter, the function will fail with <b>ERROR_NOT_SUPPORTED</b>: <ul>
     * <li>wlan_hosted_network_opcode_station_profile</li>
     * <li>wlan_hosted_network_opcode_connection_settings</li>
     * </ul>
     * 
     * 
     * In order to succeed,  the <b>WlanHostedNetworkSetProperty</b> function must persist the new settings which requires that the Hosted Network state be transitioned to <b>wlan_hosted_network_idle</b> if it was currently running (wlan_hosted_network_active). 
     * 
     * Any user can call this function to set the Hosted Network properties. However, to set the <b>wlan_hosted_network_opcode_enable</b> flag requires elevated privileges. The ability to enable the wireless Hosted Network may also be restricted by group policy in a domain.
     * 
     * On Windows 7 and later, the operating system installs a virtual device if a Hosted Network capable wireless adapter is present on the machine. This virtual device normally shows up in the “Network Connections Folder” as ‘Wireless  Network Connection 2’ with a Device Name of ‘Microsoft Virtual WiFi Miniport adapter’ if the computer has a single wireless network adapter. This virtual device is used exclusively for performing software access point (SoftAP) connections and is not present in the list returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanenuminterfaces">WlanEnumInterfaces</a> function. The lifetime of this virtual device is tied to the physical wireless adapter. If the physical wireless adapter is disabled, this virtual device will be removed as well. This feature is also available on Windows Server 2008 R2 with the Wireless LAN Service installed.
     * @param {Pointer<Void>} hClientHandle The client's session handle, returned by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
     * @param {Integer} OpCode The identifier for the property to be set. This identifier can only be the following values in the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ne-wlanapi-wlan_hosted_network_opcode">WLAN_HOSTED_NETWORK_OPCODE</a> enumeration defined in the <i>Wlanapi.h </i> header file:
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
     * @param {Pointer<Int32>} pFailReason An optional pointer to a value that receives the failure reason,  if the call to the <b>WlanHostedNetworkSetProperty</b> function fails. Possible values for the failure reason are from the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ne-wlanapi-wlan_hosted_network_reason">WLAN_HOSTED_NETWORK_REASON</a> enumeration type defined in the <i>Wlanapi.h </i> header file.
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
     * <li><i>OpCode</i> is not one of the enumerated values defined in the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ne-wlanapi-wlan_hosted_network_opcode">WLAN_HOSTED_NETWORK_OPCODE</a>.</li>
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
     * The request is not supported. This error is returned if the application calls the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanhostednetworksetproperty">WlanHostedNetworkSetProperty</a> function with the <i>OpCode</i> parameter set to  <b>wlan_hosted_network_opcode_station_profile</b> or <b>wlan_hosted_network_opcode_security_settings</b>. 
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wlanapi/nf-wlanapi-wlanhostednetworksetproperty
     * @since windows6.1
     */
    static WlanHostedNetworkSetProperty(hClientHandle, OpCode, dwDataSize, pvData, pFailReason) {
        static pvReserved := 0 ;Reserved parameters must always be NULL

        result := DllCall("wlanapi.dll\WlanHostedNetworkSetProperty", "ptr", hClientHandle, "int", OpCode, "uint", dwDataSize, "ptr", pvData, "int*", pFailReason, "ptr", pvReserved, "uint")
        return result
    }

    /**
     * Configures and persists to storage the network connection settings (SSID and maximum number of peers, for example) on the wireless Hosted Network if these settings are not already configured.
     * @remarks
     * The <b>WlanHostedNetworkInitSettings</b> function is an extension to native wireless APIs added to support the wireless Hosted Network on Windows 7 and on Windows Server 2008 R2 with the Wireless LAN Service installed. 
     * 
     * A client application calls the <b>WlanHostedNetworkInitSettings</b> function to configure and persist to storage the network connection settings (SSID and maximum number of peers, for example) on the wireless Hosted Network, if the connections settings are not already configured.  If the network settings on the wireless Hosted Network settings are already configured (the  <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanhostednetworkqueryproperty">WlanHostedNetworkQueryProperty</a> function does not return <b>ERROR_BAD_CONFIGURATION</b> for the station profile or connection settings), then this function call returns <b>ERROR_SUCCESS</b> without changing the configuration of the network connection settings.
     * 
     * A client application should always call the <b>WlanHostedNetworkInitSettings</b> function before using other Hosted Network features on the local computer. This function initializes settings that are required when the wireless Hosted Network is used for the first time on a local computer. The <b>WlanHostedNetworkInitSettings</b> function does not change any configuration if the configuration has already been persisted.  So it is safe to call the <b>WlanHostedNetworkInitSettings</b> function if the configuration has already been persisted. It is recommended that applications that use Hosted Network call the <b>WlanHostedNetworkInitSettings</b> function before using  other Hosted Network functions.
     * 
     * 
     * The <b>WlanHostedNetworkInitSettings</b> function computes a random and readable SSID from the host name and computes a random primary key. This function also uses sets a value for the maximum number of peers allowed that defaults to 100. If an application wants to use a different SSID or a different maximum number of peers, then the application should call the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanhostednetworksetproperty">WlanHostedNetworkSetProperty</a> function to specifically set these properties used by the wireless Hosted Network. 
     * 
     * Any Hosted Network state change caused by this function would not be automatically undone if the calling application closes its calling handle (by calling <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanclosehandle">WlanCloseHandle</a> with the <i>hClientHandle</i> parameter) or if the process ends.
     * 
     * 
     * Any user can call the <b>WlanHostedNetworkInitSettings</b> function to configure and persist to storage network connection settings on the Hosted Network. If the wireless Hosted Network has already been configured, this function does nothing and returns <b>ERROR_SUCCESS</b>. 
     * 
     * On Windows 7 and later, the operating system installs a virtual device if a Hosted Network capable wireless adapter is present on the machine. This virtual device normally shows up in the “Network Connections Folder” as ‘Wireless  Network Connection 2’ with a Device Name of ‘Microsoft Virtual WiFi Miniport adapter’ if the computer has a single wireless network adapter. This virtual device is used exclusively for performing software access point (SoftAP) connections and is not present in the list returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanenuminterfaces">WlanEnumInterfaces</a> function. The lifetime of this virtual device is tied to the physical wireless adapter. If the physical wireless adapter is disabled, this virtual device will be removed as well. This feature is also available on Windows Server 2008 R2 with the Wireless LAN Service installed.
     * @param {Pointer<Void>} hClientHandle The client's session handle, returned by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
     * @param {Pointer<Int32>} pFailReason An optional pointer to a value that receives the failure reason  if the call to the <b>WlanHostedNetworkInitSettings</b> function fails. Possible values for the failure reason are from the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ne-wlanapi-wlan_hosted_network_reason">WLAN_HOSTED_NETWORK_REASON</a> enumeration type defined in the <i>Wlanapi.h </i> header file.
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wlanapi/nf-wlanapi-wlanhostednetworkinitsettings
     * @since windows6.1
     */
    static WlanHostedNetworkInitSettings(hClientHandle, pFailReason) {
        static pvReserved := 0 ;Reserved parameters must always be NULL

        result := DllCall("wlanapi.dll\WlanHostedNetworkInitSettings", "ptr", hClientHandle, "int*", pFailReason, "ptr", pvReserved, "uint")
        return result
    }

    /**
     * Refreshes the configurable and auto-generated parts of the wireless Hosted Network security settings.
     * @remarks
     * The <b>WlanHostedNetworkRefreshSecuritySettings</b> function is an extension to native wireless APIs added to support the wireless Hosted Network on Windows 7 and on Windows Server 2008 R2 with the Wireless LAN Service installed. 
     * 
     * A client application calls the <b>WlanHostedNetworkRefreshSecuritySettings</b> function to force a refresh of the configurable and auto-generated parts of the security settings (the primary key) on the wireless Hosted Network. 
     * 
     * An application might call the <b>WlanHostedNetworkRefreshSecuritySettings</b> function after ensuring that the user accepts the impact of updating the security settings. In order to succeed,  this function must persist the new settings which would require that Hosted Network state be transitioned to wlan_hosted_network_idle if it was currently running (wlan_hosted_network_active). 
     * 
     * <div class="alert"><b>Note</b>  Any network clients (PCs or devices) on the wireless Hosted Network would have to be re-configured after calling the <b>WlanHostedNetworkRefreshSecuritySettings</b> function if their continued usage is a goal. An application would typically call this function in situations where the user feels that the security of the previous primary key used for security by the wireless Hosted Network has been violated. Note that the <b>WlanHostedNetworkRefreshSecuritySettings</b> function does not change or reset the secondary key.</div>
     * <div> </div>
     * Any Hosted Network state change caused by this function would not be automatically undone if the calling application closes its calling handle (by calling <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanclosehandle">WlanCloseHandle</a> with the <i>hClientHandle</i> parameter) or if the process ends.
     * 
     * 
     * Any user can call the <b>WlanHostedNetworkRefreshSecuritySettings</b> function to refresh the security settings on the Hosted Network. However, the ability to enable the wireless Hosted Network may be restricted by group policy in a domain.
     * 
     * On Windows 7 and later, the operating system installs a virtual device if a Hosted Network capable wireless adapter is present on the machine. This virtual device normally shows up in the “Network Connections Folder” as ‘Wireless  Network Connection 2’ with a Device Name of ‘Microsoft Virtual WiFi Miniport adapter’ if the computer has a single wireless network adapter. This virtual device is used exclusively for performing software access point (SoftAP) connections and is not present in the list returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanenuminterfaces">WlanEnumInterfaces</a> function. The lifetime of this virtual device is tied to the physical wireless adapter. If the physical wireless adapter is disabled, this virtual device will be removed as well. This feature is also available on Windows Server 2008 R2 with the Wireless LAN Service installed.
     * @param {Pointer<Void>} hClientHandle The client's session handle, returned by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
     * @param {Pointer<Int32>} pFailReason An optional pointer to a value that receives the failure reason,  if the call to the <b>WlanHostedNetworkRefreshSecuritySettings</b> function fails. Possible values for the failure reason are from the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ne-wlanapi-wlan_hosted_network_reason">WLAN_HOSTED_NETWORK_REASON</a> enumeration type defined in the <i>Wlanapi.h </i> header file.
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wlanapi/nf-wlanapi-wlanhostednetworkrefreshsecuritysettings
     * @since windows6.1
     */
    static WlanHostedNetworkRefreshSecuritySettings(hClientHandle, pFailReason) {
        static pvReserved := 0 ;Reserved parameters must always be NULL

        result := DllCall("wlanapi.dll\WlanHostedNetworkRefreshSecuritySettings", "ptr", hClientHandle, "int*", pFailReason, "ptr", pvReserved, "uint")
        return result
    }

    /**
     * Queries the current status of the wireless Hosted Network.
     * @remarks
     * The <b>WlanHostedNetworkQueryStatus</b> function is an extension to native wireless APIs added to support the wireless Hosted Network on Windows 7 and on Windows Server 2008 R2 with the Wireless LAN Service installed. 
     * 
     * A client application calls the <b>WlanHostedNetworkQueryStatus</b> function to query the current status of the wireless Hosted Network. This function does not change the state of the wireless Hosted Network. 
     * 
     * If the function succeeds, the <i>ppWlanHostedNetworkStatus</i> parameter points to a <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_hosted_network_status">WLAN_HOSTED_NETWORK_STATUS</a> structure with the current status. The memory used for the <b>WLAN_HOSTED_NETWORK_STATUS</b> structure that is returned should be freed after use by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanfreememory">WlanFreeMemory</a> function.
     * 
     * Any user can call the <b>WlanHostedNetworkQueryStatus</b> function to query the Hosted Network. However, the ability to enable the wireless Hosted Network may be restricted by group policy in a domain.
     * 
     * On Windows 7 and later, the operating system installs a virtual device if a Hosted Network capable wireless adapter is present on the machine. This virtual device normally shows up in the “Network Connections Folder” as ‘Wireless  Network Connection 2’ with a Device Name of ‘Microsoft Virtual WiFi Miniport adapter’ if the computer has a single wireless network adapter. This virtual device is used exclusively for performing software access point (SoftAP) connections and is not present in the list returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanenuminterfaces">WlanEnumInterfaces</a> function. The lifetime of this virtual device is tied to the physical wireless adapter. If the physical wireless adapter is disabled, this virtual device will be removed as well. This feature is also available on Windows Server 2008 R2 with the Wireless LAN Service installed.
     * @param {Pointer<Void>} hClientHandle The client's session handle, returned by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
     * @param {Pointer<WLAN_HOSTED_NETWORK_STATUS>} ppWlanHostedNetworkStatus On input, this parameter must be <b>NULL</b>. 
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wlanapi/nf-wlanapi-wlanhostednetworkquerystatus
     * @since windows6.1
     */
    static WlanHostedNetworkQueryStatus(hClientHandle, ppWlanHostedNetworkStatus) {
        static pvReserved := 0 ;Reserved parameters must always be NULL

        result := DllCall("wlanapi.dll\WlanHostedNetworkQueryStatus", "ptr", hClientHandle, "ptr", ppWlanHostedNetworkStatus, "ptr", pvReserved, "uint")
        return result
    }

    /**
     * Configures the secondary security key that will be used by the wireless Hosted Network.
     * @remarks
     * The <b>WlanHostedNetworkSetSecondaryKey</b> function is an extension to native wireless APIs added to support the wireless Hosted Network on Windows 7 and on Windows Server 2008 R2 with the Wireless LAN Service installed. 
     * 
     * A client application calls the <b>WlanHostedNetworkSetSecondaryKey</b> function to configure the secondary security key that will be used by the wireless Hosted Network. 
     * Any Hosted Network change caused by this function would not be automatically undone if the calling application closes its calling handle (by calling <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanclosehandle">WlanCloseHandle</a> with the <i>hClientHandle</i> parameter) or if the process ends.
     * 
     * 
     * Once started, the wireless Hosted Network will allow wireless peers to associate with this secondary security key in addition to the primary security key. The secondary security key is always specified by the user as needed, while the primary security key is generated by the operating system with greater security strength.
     * 
     * The secondary security key passed in the buffer pointed to by the <i>pucKeyData</i> parameter is used with WPA2-Personal authentication and should be in one of the following formats:<ul>
     * <li>A key passphrase that consists of an array of ASCII characters from 8 to 63 characters. The <i>dwKeyLength</i> parameter should include the terminating ‘\0’ in the passphrase. The value of the <i>dwKeyLength</i> parameter should be in the range of 9 to 64. </li>
     * <li>A	binary key that consists of 32 bytes of binary key data. The <i>dwKeyLength</i> parameter should be 32 for binary key.</li>
     * </ul>
     * 
     * 
     * To configure a valid secondary security key, the <i>dwKeyLength</i> parameter should be in the correct range and the <i>pucKeyData</i> parameter should point to a valid memory buffer containing the specified bytes of data. To remove the currently configured secondary security key from the system, the application should call the <b>WlanHostedNetworkSetSecondaryKey</b> function with zero in <i>dwKeyLength</i> parameter and <b>NULL</b> in the <i>pucKeyData</i> parameter. 
     * 
     * The <b>WlanHostedNetworkSetSecondaryKey</b> function will return <b>ERROR_INVALID_PARAMETER</b> if the <i>pucKeyData</i> parameter is <b>NULL</b>, but the <i>dwKeyLength</i> parameter  is not zero.  The <b>WlanHostedNetworkSetSecondaryKey</b> function will also return <b>ERROR_INVALID_PARAMETER</b> if the <i>dwKeyLength</i> parameter  is zero, but <i>pucKeyData</i> parameter  is not <b>NULL</b>.
     * 
     * The secondary security key is usually set before the wireless Hosted Network is started. Then it will be used the next time when the Hosted Network is started. 
     * 
     * A secondary security key can also be set after the Hosted Network has been started. In this case, the secondary security key will be used immediately. Any clients using the previous secondary security key will remain connected, but they will be unable to reconnect if they get disconnected for any reason or if the wireless Hosted Network is restarted.
     * 
     * The secondary security key can be specified as persistent if the <i>bPersistent</i> parameter is set to <b>TRUE</b>. When specified as persistent, the secondary security key would  be used immediately if the Hosted Network is already started, and also reused whenever Hosted Network is started in the future. 
     * 
     * If secondary security key is not specified as persistent, it will be used immediately if the Hosted Network is already started, or only for the next time when Hosted Network is started. After the Hosted Network is stopped, this secondary security key will never be used again and will be removed from the system.
     * 
     * Any user can call this function to configure the secondary security key to be used in the Hosted Network. However, the ability to enable the wireless Hosted Network may be restricted by group policy in a domain.
     * 
     * On Windows 7 and later, the operating system installs a virtual device if a Hosted Network capable wireless adapter is present on the machine. This virtual device normally shows up in the “Network Connections Folder” as ‘Wireless  Network Connection 2’ with a Device Name of ‘Microsoft Virtual WiFi Miniport adapter’ if the computer has a single wireless network adapter. This virtual device is used exclusively for performing software access point (SoftAP) connections and is not present in the list returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanenuminterfaces">WlanEnumInterfaces</a> function. The lifetime of this virtual device is tied to the physical wireless adapter. If the physical wireless adapter is disabled, this virtual device will be removed as well. This feature is also available on Windows Server 2008 R2 with the Wireless LAN Service installed.
     * @param {Pointer<Void>} hClientHandle The client's session handle, returned by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
     * @param {Integer} dwKeyLength The number of valid data bytes in the key data array pointed to by the <i>pucKeyData</i> parameter. This key length should include the terminating ‘\0’ if the key is a passphrase.
     * @param {Pointer} pucKeyData A pointer to a buffer that contains the key data. The number of valid data bytes in the buffer must be at least the value specified in <i>dwKeyLength</i> parameter.
     * @param {Integer} bIsPassPhrase A Boolean value that indicates if the key data array pointed to by the <i>pucKeyData</i> parameter is in passphrase format. 
     * 
     * If this parameter is <b>TRUE</b>, the key data array is in passphrase format. If this parameter is <b>FALSE</b>, the key data array is not in passphrase format.
     * @param {Integer} bPersistent A Boolean value that indicates if the key data array pointed to by the <i>pucKeyData</i> parameter is to be stored and reused later or is for one-time use only. 
     * 
     * If this parameter is <b>TRUE</b>, the key data array is to be stored and reused later. If this parameter is <b>FALSE</b>, the key data array is to be used for one session (either the current session or the next session if the Hosted Network is not started).
     * @param {Pointer<Int32>} pFailReason An optional pointer to a value that receives the failure reason,  if the call to the <b>WlanHostedNetworkSetSecondaryKey</b> function fails. Possible values for the failure reason are from the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ne-wlanapi-wlan_hosted_network_reason">WLAN_HOSTED_NETWORK_REASON</a> enumeration type defined in the <i>Wlanapi.h </i> header file.
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wlanapi/nf-wlanapi-wlanhostednetworksetsecondarykey
     * @since windows6.1
     */
    static WlanHostedNetworkSetSecondaryKey(hClientHandle, dwKeyLength, pucKeyData, bIsPassPhrase, bPersistent, pFailReason) {
        static pvReserved := 0 ;Reserved parameters must always be NULL

        result := DllCall("wlanapi.dll\WlanHostedNetworkSetSecondaryKey", "ptr", hClientHandle, "uint", dwKeyLength, "ptr", pucKeyData, "int", bIsPassPhrase, "int", bPersistent, "int*", pFailReason, "ptr", pvReserved, "uint")
        return result
    }

    /**
     * Queries the secondary security key that is configured to be used by the wireless Hosted Network.
     * @remarks
     * The <b>WlanHostedNetworkQuerySecondaryKey</b> function is an extension to native wireless APIs added to support the wireless Hosted Network on Windows 7 and on Windows Server 2008 R2 with the Wireless LAN Service installed. 
     * 
     * A client application calls the <b>WlanHostedNetworkQuerySecondaryKey</b> function to query the secondary security key that will be used by the wireless Hosted Network. This function will return the key information including key data, key length, whether it is a passphrase, and whether it is persistent or for one-time use. This function does not change the state or properties of the wireless Hosted Network.
     * 
     * The secondary security key is a passphrase if the value pointed to by the <i>pbIsPassPhrase</i> parameter is <b>TRUE</b>.  The secondary security key is a binary key if the value pointed to by the <i>pbIsPassPhrase</i> parameter is <b>FALSE</b>.  
     * 
     * The secondary security key returned in the buffer pointed to by the <i>ppucKeyData</i> parameter is used with WPA2-Personal authentication and is in one of the following formats:<ul>
     * <li>A key passphrase that consists of an array of ASCII characters from 8 to 63 characters. The value pointed to by the <i>pdwKeyLength</i> parameter includes the terminating ‘\0’ in the passphrase. The value pointed to by the <i>pdwKeyLength</i> parameter should be in the range of 9 to 64. </li>
     * <li>A binary key that consists of 32 bytes of binary key data. The value pointed to by the <i>pdwKeyLength</i> parameter should be 32 for binary key.</li>
     * </ul>
     * 
     * 
     * The secondary security key is persistent if the value pointed to by the <i>pbPersistent</i> parameter is <b>TRUE</b>. When persistent, the secondary security key would  be used immediately if the Hosted Network is already started, and also reused whenever Hosted Network is started in the future. 
     * 
     * If secondary security key is not specified as persistent, it will be used immediately if the Hosted Network is already started, or only for the next time when the Hosted Network is started. After the Hosted Network is stopped, this secondary security key will never be used again and will be removed from the system.
     * 
     * If there is no secondary security key currently configured, the returned value pointed to by the <i>pdwKeyLength</i> parameter will be zero, and the value returned in the <i>ppucKeyData</i> parameter will be <b>NULL</b>. In such case, the value returned in the <i>pbIsPassPhrase</i> and <i>pbPersistent</i> parameters will be meaningless.
     * 
     * If the <b>WlanHostedNetworkQuerySecondaryKey</b> function succeeds, the memory used for the buffer in the <i>ppucKeyData</i> parameter that is returned should be freed after use by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanfreememory">WlanFreeMemory</a> function.
     * 
     * Any user can call the <b>WlanHostedNetworkQuerySecondaryKey</b> function to query the secondary security key used in the Hosted Network. However, the ability to enable the wireless Hosted Network may be restricted by group policy in a domain.
     * 
     * On Windows 7 and later, the operating system installs a virtual device if a Hosted Network capable wireless adapter is present on the machine. This virtual device normally shows up in the “Network Connections Folder” as ‘Wireless  Network Connection 2’ with a Device Name of ‘Microsoft Virtual WiFi Miniport adapter’ if the computer has a single wireless network adapter. This virtual device is used exclusively for performing software access point (SoftAP) connections and is not present in the list returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanenuminterfaces">WlanEnumInterfaces</a> function. The lifetime of this virtual device is tied to the physical wireless adapter. If the physical wireless adapter is disabled, this virtual device will be removed as well. This feature is also available on Windows Server 2008 R2 with the Wireless LAN Service installed.
     * @param {Pointer<Void>} hClientHandle The client's session handle, returned by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
     * @param {Pointer<UInt32>} pdwKeyLength A pointer to a value that specifies number of valid data bytes in the key data array pointed to by the <i>ppucKeyData</i> parameter, if the call to the <b>WlanHostedNetworkQuerySecondaryKey</b> function succeeds. 
     * 
     * This key length includes the terminating ‘\0’ if the key is a passphrase.
     * @param {Pointer<Byte>} ppucKeyData A pointer to a value that receives a pointer to the buffer returned with the secondary security key data,  if the call to the <b>WlanHostedNetworkQuerySecondaryKey</b> function succeeds.
     * @param {Pointer<Int32>} pbIsPassPhrase A pointer to a Boolean value that indicates if the key data array pointed to by the <i>ppucKeyData</i> parameter is in passphrase format. 
     * 
     * If this parameter is <b>TRUE</b>, the key data array is in passphrase format. If this parameter is <b>FALSE</b>, the key data array is not in passphrase format.
     * @param {Pointer<Int32>} pbPersistent A pointer to a Boolean value that indicates if the key data array pointed to by the <i>ppucKeyData</i> parameter is to be stored and reused later or is for one-time use only. 
     * 
     * If this parameter is <b>TRUE</b>, the key data array is to be stored and reused later. If this parameter is <b>FALSE</b>, the key data array is for one-time use only.
     * @param {Pointer<Int32>} pFailReason An optional pointer to a value that receives the failure reason,  if the call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanhostednetworksetsecondarykey">WlanHostedNetworkSetSecondaryKey</a> function fails. Possible values for the failure reason are from the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ne-wlanapi-wlan_hosted_network_reason">WLAN_HOSTED_NETWORK_REASON</a> enumeration type defined in the <i>Wlanapi.h </i> header file.
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wlanapi/nf-wlanapi-wlanhostednetworkquerysecondarykey
     * @since windows6.1
     */
    static WlanHostedNetworkQuerySecondaryKey(hClientHandle, pdwKeyLength, ppucKeyData, pbIsPassPhrase, pbPersistent, pFailReason) {
        static pvReserved := 0 ;Reserved parameters must always be NULL

        result := DllCall("wlanapi.dll\WlanHostedNetworkQuerySecondaryKey", "ptr", hClientHandle, "uint*", pdwKeyLength, "ptr", ppucKeyData, "int*", pbIsPassPhrase, "int*", pbPersistent, "int*", pFailReason, "ptr", pvReserved, "uint")
        return result
    }

    /**
     * Is used to register and unregister notifications on a virtual station.
     * @remarks
     * The <b>WlanRegisterVirtualStationNotification</b>  function is an extension to native wireless APIs added to support the wireless Hosted Network on Windows 7 and on Windows Server 2008 R2 with the Wireless LAN Service installed. 
     * 
     * A client application calls the <b>WlanRegisterVirtualStationNotification</b>   function is used to register and unregister notifications on virtual station. 
     * 
     * Any registration to receive notifications from a virtual station caused by this function would be automatically undone if the calling application closes its calling handle (by calling <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanclosehandle">WlanCloseHandle</a> with the <i>hClientHandle</i> parameter) or if the process ends.
     * 
     * 
     * By default, a application client will not receive notifications on a virtual station. In order to receive these notifications, a client needs to call the <b>WlanRegisterVirtualStationNotification</b> function with the <i>bRegister</i> parameter set to <b>TRUE</b> and must also call the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanregisternotification">WlanRegisterNotification</a> function with the <i>dwNotifSource</i> parameter  set to notification sources to be registered. The registration to receive notifications from a virtual station is in effect until the application closes the client handle (by calling <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanclosehandle">WlanCloseHandle</a> with the <i>hClientHandle</i> parameter), the process ends, or the <b>WlanRegisterVirtualStationNotification</b> function is called with the <i>bRegister</i> parameter set to <b>FALSE</b>.
     * 
     * On Windows 7 and later, the operating system installs a virtual device if a Hosted Network capable wireless adapter is present on the machine. This virtual device normally shows up in the “Network Connections Folder” as ‘Wireless  Network Connection 2’ with a Device Name of ‘Microsoft Virtual WiFi Miniport adapter’ if the computer has a single wireless network adapter. This virtual device is used exclusively for performing software access point (SoftAP) connections and is not present in the list returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanenuminterfaces">WlanEnumInterfaces</a> function. The lifetime of this virtual device is tied to the physical wireless adapter. If the physical wireless adapter is disabled, this virtual device will be removed as well. This feature is also available on Windows Server 2008 R2 with the Wireless LAN Service installed.
     * @param {Pointer<Void>} hClientHandle The client's session handle, obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function.
     * @param {Integer} bRegister A value that specifies whether to receive notifications on a virtual station.
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wlanapi/nf-wlanapi-wlanregistervirtualstationnotification
     * @since windows6.1
     */
    static WlanRegisterVirtualStationNotification(hClientHandle, bRegister) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        result := DllCall("wlanapi.dll\WlanRegisterVirtualStationNotification", "ptr", hClientHandle, "int", bRegister, "ptr", pReserved, "uint")
        return result
    }

    /**
     * Opens a handle to the Wi-Fi Direct service and negotiates a version of the Wi-FI Direct API to use.
     * @remarks
     * The <b>WFDOpenHandle</b> function is part of Wi-Fi Direct, a new feature in Windows 8 and Windows Server 2012. Wi-Fi Direct is based on the development of the Wi-Fi Peer-to-Peer Technical Specification v1.1 by the Wi-Fi Alliance (see <a href="https://www.wi-fi.org/featured-topics">Wi-Fi Alliance Published Specifications</a>). The goal of the Wi-Fi Peer-to-Peer Technical Specification is to provide a solution for Wi-Fi device-to-device connectivity without the need for either a Wireless Access Point (wireless AP) to setup the connection or the use of the existing Wi-Fi adhoc (IBSS) mechanism. 
     * 
     * 
     * 
     * In order to use Wi-Fi Direct, an application must first obtain a handle to the Wi-Fi Direct service by calling the <b>WFDOpenHandle</b> function. The Wi-Fi Direct (WFD) handle returned by the  <b>WFDOpenHandle</b> function is used for subsequent calls made to the Wi-Fi Direct service. Once an application is done using the Wi-Fi Direct service, the application should call the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wfdclosehandle">WFDCloseHandle</a> function to signal to the Wi-Fi Direct service that the application is done using the service. This allows the  Wi-Fi Direct service  to release resources used by the application.
     * @param {Integer} dwClientVersion The highest version of the Wi-Fi Direct API the client supports.
     * 
     * For Windows 8 and Windows Server 2012, this parameter should be set to <b>WFD_API_VERSION</b>, constant defined in the <i>Wlanapi.h</i> header file.
     * @param {Pointer<UInt32>} pdwNegotiatedVersion A pointer to a <b>DWORD</b> to received the negotiated version.
     * 
     * If the <b>WFDOpenHandle</b> function is successful, the version negotiated with the Wi-Fi Direct Service to be used by this session is returned. This value is usually the highest version supported by both the client and Wi-Fi Direct service.
     * @param {Pointer<Void>} phClientHandle A pointer to a <b>HANDLE</b> to receive the handle to the Wi-Fi Direct service for this session.
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
     * @see https://learn.microsoft.com/windows/win32/api/wlanapi/nf-wlanapi-wfdopenhandle
     * @since windows8.0
     */
    static WFDOpenHandle(dwClientVersion, pdwNegotiatedVersion, phClientHandle) {
        result := DllCall("wlanapi.dll\WFDOpenHandle", "uint", dwClientVersion, "uint*", pdwNegotiatedVersion, "ptr", phClientHandle, "uint")
        return result
    }

    /**
     * Closes a handle to the Wi-Fi Direct service.
     * @remarks
     * The <b>WFDCloseHandle</b> function is part of Wi-Fi Direct, a new feature in Windows 8 and Windows Server 2012. Wi-Fi Direct is based on the development of the Wi-Fi Peer-to-Peer Technical Specification v1.1 by the Wi-Fi Alliance (see <a href="https://www.wi-fi.org/featured-topics">Wi-Fi Alliance Published Specifications</a>). The goal of the Wi-Fi Peer-to-Peer Technical Specification is to provide a solution for Wi-Fi device-to-device connectivity without the need for either a Wireless Access Point (wireless AP) to setup the connection or the use of the existing Wi-Fi adhoc (IBSS) mechanism. 
     * 
     * 
     * 
     * In order to use Wi-Fi Direct, an application must first obtain a handle to the Wi-Fi Direct service by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wfdopenhandle">WFDOpenHandle</a> function. The Wi-Fi Direct (WFD) handle returned by the  <b>WFDOpenHandle</b> function is used for subsequent calls made to the Wi-Fi Direct service. Once an application is done using the Wi-Fi Direct service, the application should call the <b>WFDCloseHandle</b> function to signal to the Wi-Fi Direct service that the application is done using the service. This allows the  Wi-Fi Direct service  to release resources used by the application.
     * @param {Pointer<Void>} hClientHandle A client handle to the Wi-Fi Direct service. This handle was  obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wfdopenhandle">WFDOpenHandle</a> function.
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
     * @see https://learn.microsoft.com/windows/win32/api/wlanapi/nf-wlanapi-wfdclosehandle
     * @since windows8.0
     */
    static WFDCloseHandle(hClientHandle) {
        result := DllCall("wlanapi.dll\WFDCloseHandle", "ptr", hClientHandle, "uint")
        return result
    }

    /**
     * Starts an on-demand connection to a specific Wi-Fi Direct device, which has been previously paired through the Windows Pairing experience.
     * @remarks
     * The <b>WFDStartOpenSession</b> function is part of Wi-Fi Direct, a new feature in Windows 8 and Windows Server 2012. Wi-Fi Direct is based on the development of the Wi-Fi Peer-to-Peer Technical Specification v1.1 by the Wi-Fi Alliance (see <a href="https://www.wi-fi.org/featured-topics">Wi-Fi Alliance Published Specifications</a>). The goal of the Wi-Fi Peer-to-Peer Technical Specification is to provide a solution for Wi-Fi device-to-device connectivity without the need for either a Wireless Access Point (wireless AP) to setup the connection or the use of the existing Wi-Fi adhoc (IBSS) mechanism. 
     * 
     * 
     * 
     * The  <b>WFDStartOpenSession</b> function starts an asynchronous operation to start an on-demand connection to  a specific Wi-Fi Direct device. The target Wi-Fi device must previously have been paired through the Windows Pairing experience. When the asynchronous operation completes, the callback function specified in the <i>pfnCallback</i> parameter is called.  
     * 
     * If the application attempts to close the handle to the Wi-Fi Direct service by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wfdclosehandle">WFDCloseHandle</a> function before the <b>WFDStartOpenSession</b> function completes asynchronously, the <b>WFDCloseHandle</b> function will wait until the <b>WFDStartOpenSession</b> call is completed.
     * @param {Pointer<Void>} hClientHandle A client handle to the Wi-Fi Direct service. This handle was  obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wfdopenhandle">WFDOpenHandle</a> function.
     * @param {Pointer<Byte>} pDeviceAddress A pointer to the target device’s Wi-Fi Direct device address. This is the MAC address of the target Wi-Fi device.
     * @param {Pointer<Void>} pvContext An optional context pointer which is passed to the callback function specified in the <i>pfnCallback</i> parameter.
     * @param {Pointer<WFD_OPEN_SESSION_COMPLETE_CALLBACK>} pfnCallback A pointer to the callback function to be called once the <b>WFDStartOpenSession</b> request has completed.
     * @param {Pointer<Void>} phSessionHandle A handle to this specific Wi-Fi Direct session.
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
     * @see https://learn.microsoft.com/windows/win32/api/wlanapi/nf-wlanapi-wfdstartopensession
     * @since windows8.0
     */
    static WFDStartOpenSession(hClientHandle, pDeviceAddress, pvContext, pfnCallback, phSessionHandle) {
        result := DllCall("wlanapi.dll\WFDStartOpenSession", "ptr", hClientHandle, "ptr", pDeviceAddress, "ptr", pvContext, "ptr", pfnCallback, "ptr", phSessionHandle, "uint")
        return result
    }

    /**
     * Indicates that the application wants to cancel a pending WFDStartOpenSession function that has not completed.
     * @remarks
     * The <b>WFDCancelOpenSession</b> function is part of Wi-Fi Direct, a new feature in Windows 8 and Windows Server 2012. Wi-Fi Direct is based on the development of the Wi-Fi Peer-to-Peer Technical Specification v1.1 by the Wi-Fi Alliance (see <a href="https://www.wi-fi.org/featured-topics">Wi-Fi Alliance Published Specifications</a>). The goal of the Wi-Fi Peer-to-Peer Technical Specification is to provide a solution for Wi-Fi device-to-device connectivity without the need for either a Wireless Access Point (wireless AP) to setup the connection or the use of the existing Wi-Fi adhoc (IBSS) mechanism. 
     * 
     * 
     * 
     * A call to the <b>WFDCancelOpenSession</b> function notifies the Wi-Fi Direct service that the client requests a cancellation of this session. The <b>WFDCancelOpenSession</b> function does not modify the expected <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wfdstartopensession">WFDStartOpenSession</a> behavior. The  callback function specified to the <b>WFDStartOpenSession</b> function will still be called, and the <b>WFDStartOpenSession</b> function may not be completed immediately.
     * 
     * It is the responsibility of the caller to pass the <b>WFDCancelOpenSession</b> function a handle in the <i>hSessionHandle </i> parameter that was returned from call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wfdstartopensession">WFDStartOpenSession</a> function.
     * @param {Pointer<Void>} hSessionHandle A session handle to a Wi-Fi Direct session to cancel. This is a session handle previously returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wfdstartopensession">WFDStartOpenSession</a> function.
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
     * @see https://learn.microsoft.com/windows/win32/api/wlanapi/nf-wlanapi-wfdcancelopensession
     * @since windows8.0
     */
    static WFDCancelOpenSession(hSessionHandle) {
        result := DllCall("wlanapi.dll\WFDCancelOpenSession", "ptr", hSessionHandle, "uint")
        return result
    }

    /**
     * Retrieves and applies a stored profile for a Wi-Fi Direct legacy device.
     * @remarks
     * The <b>WFDOpenLegacySession</b> function is part of Wi-Fi Direct, a new feature in Windows 8 and Windows Server 2012. Wi-Fi Direct is based on the development of the Wi-Fi Peer-to-Peer Technical Specification v1.1 by the Wi-Fi Alliance (see <a href="https://www.wi-fi.org/featured-topics">Wi-Fi Alliance Published Specifications</a>). The goal of the Wi-Fi Peer-to-Peer Technical Specification is to provide a solution for Wi-Fi device-to-device connectivity without the need for either a Wireless Access Point (wireless AP) to setup the connection or the use of the existing Wi-Fi adhoc (IBSS) mechanism. 
     * 
     * 
     * 
     * In order to use Wi-Fi Direct, an application must first obtain a handle to the Wi-Fi Direct service by calling the <b>WFDOpenLegacySession</b> or <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wfdopenhandle">WFDOpenHandle</a> function. The Wi-Fi Direct (WFD) handle returned by the  <b>WFDOpenHandle</b> function is used for subsequent calls made to the Wi-Fi Direct service. The  <b>WFDOpenLegacySession</b> function is used to retrieve and apply a stored profile for a Wi-Fi Direct legacy device. 
     * 
     * The 	<b>WFDOpenLegacySession</b> function retrieves the stored legacy profile for device from the profile store for the specified legacy device address. This device address must be obtained from a Device Node created as a result of the Inbox pairing experience (Legacy WPS Pairing).
     * 
     * Once an application is done using the Wi-Fi Direct service, the application should call the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wfdclosesession">WFDCloseSession</a> function to close the session and call the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wfdclosehandle">WFDCloseHandle</a> function to signal to the Wi-Fi Direct service that the application is done using the service. This allows the  Wi-Fi Direct service  to release resources used by the application.
     * @param {Pointer<Void>} hClientHandle A <b>HANDLE</b> to the Wi-Fi Direct service for this session. This parameter is retrieved using the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wfdopenhandle">WFDOpenHandle</a> function.
     * @param {Pointer<Byte>} pLegacyMacAddress A pointer to Wi-Fi Direct device address of the legacy client device.
     * @param {Pointer<Void>} phSessionHandle A pointer to a <b>HANDLE</b> to receive the handle to the Wi-Fi Direct service for this session.
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
     * @see https://learn.microsoft.com/windows/win32/api/wlanapi/nf-wlanapi-wfdopenlegacysession
     * @since windows8.0
     */
    static WFDOpenLegacySession(hClientHandle, pLegacyMacAddress, phSessionHandle, pGuidSessionInterface) {
        result := DllCall("wlanapi.dll\WFDOpenLegacySession", "ptr", hClientHandle, "ptr", pLegacyMacAddress, "ptr", phSessionHandle, "ptr", pGuidSessionInterface, "uint")
        return result
    }

    /**
     * Closes a session after a previously successful call to the WFDStartOpenSession function.
     * @remarks
     * The <b>WFDCloseSession</b> function is part of Wi-Fi Direct, a new feature in Windows 8 and Windows Server 2012. Wi-Fi Direct is based on the development of the Wi-Fi Peer-to-Peer Technical Specification v1.1 by the Wi-Fi Alliance (see <a href="https://www.wi-fi.org/featured-topics">Wi-Fi Alliance Published Specifications</a>). The goal of the Wi-Fi Peer-to-Peer Technical Specification is to provide a solution for Wi-Fi device-to-device connectivity without the need for either a Wireless Access Point (wireless AP) to setup the connection or the use of the existing Wi-Fi adhoc (IBSS) mechanism. 
     * 
     * 
     * 
     * The  <b>WFDCloseSession</b> function queues a future work item to close the session, so disconnection may not be immediate.
     * 
     * 
     * 
     * Calling the  <b>WFDCloseSession</b> function  while a <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wfdstartopensession">WFDStartOpenSession</a> call is pending will not close the session.
     * 
     * 
     * It is the responsibility of the caller to pass the <b>WFDCloseSession</b> function a handle in the <i>hSessionHandle </i> parameter that was returned from a successful asynchronous call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wfdstartopensession">WFDStartOpenSession</a> function.
     * 
     * 
     * 
     * Calling the  <b>WFDCloseSession</b> function with a handle that was valid and has become invalid will yield undefined results.
     * @param {Pointer<Void>} hSessionHandle A session handle to a Wi-Fi Direct session. This is a session handle previously returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wfdstartopensession">WFDStartOpenSession</a> function.
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
     * @see https://learn.microsoft.com/windows/win32/api/wlanapi/nf-wlanapi-wfdclosesession
     * @since windows8.0
     */
    static WFDCloseSession(hSessionHandle) {
        result := DllCall("wlanapi.dll\WFDCloseSession", "ptr", hSessionHandle, "uint")
        return result
    }

    /**
     * Updates device visibility for the Wi-Fi Direct device address for a given installed Wi-Fi Direct device node.
     * @remarks
     * The <b>WFDUpdateDeviceVisibility</b> function is part of Wi-Fi Direct, a new feature in Windows 8 and Windows Server 2012. Wi-Fi Direct is based on the development of the Wi-Fi Peer-to-Peer Technical Specification v1.1 by the Wi-Fi Alliance (see <a href="https://www.wi-fi.org/featured-topics">Wi-Fi Alliance Published Specifications</a>). The goal of the Wi-Fi Peer-to-Peer Technical Specification is to provide a solution for Wi-Fi device-to-device connectivity without the need for either a Wireless Access Point (wireless AP) to setup the connection or the use of the existing Wi-Fi adhoc (IBSS) mechanism. 
     * 
     * 
     * 
     * The <b>WFDUpdateDeviceVisibility</b> function will perform a targeted Wi-Fi Direct discovery, and will update the DEVPKEY_WiFiDirect_IsVisibile property key on the device node for the given device.
     * @param {Pointer<Byte>} pDeviceAddress A pointer to the Wi-Fi Direct device address of the client device.
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
     * @see https://learn.microsoft.com/windows/win32/api/wlanapi/nf-wlanapi-wfdupdatedevicevisibility
     * @since windows8.0
     */
    static WFDUpdateDeviceVisibility(pDeviceAddress) {
        result := DllCall("wlanapi.dll\WFDUpdateDeviceVisibility", "ptr", pDeviceAddress, "uint")
        return result
    }

;@endregion Methods
}
