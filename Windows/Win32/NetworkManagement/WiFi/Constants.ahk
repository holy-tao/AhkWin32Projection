#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\DEVPROPKEY.ahk" { DEVPROPKEY }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global L2_REASON_CODE_DOT11_AC_BASE := 131072

/**
 * @type {Integer (UInt32)}
 */
export global L2_REASON_CODE_DOT11_MSM_BASE := 196608

/**
 * @type {Integer (UInt32)}
 */
export global L2_REASON_CODE_DOT11_SECURITY_BASE := 262144

/**
 * @type {Integer (UInt32)}
 */
export global L2_REASON_CODE_ONEX_BASE := 327680

/**
 * @type {Integer (UInt32)}
 */
export global L2_REASON_CODE_DOT3_AC_BASE := 393216

/**
 * @type {Integer (UInt32)}
 */
export global L2_REASON_CODE_DOT3_MSM_BASE := 458752

/**
 * @type {Integer (UInt32)}
 */
export global L2_REASON_CODE_PROFILE_BASE := 524288

/**
 * @type {Integer (UInt32)}
 */
export global L2_REASON_CODE_IHV_BASE := 589824

/**
 * @type {Integer (UInt32)}
 */
export global L2_REASON_CODE_WIMAX_BASE := 655360

/**
 * @type {Integer (UInt32)}
 */
export global L2_REASON_CODE_RESERVED_BASE := 720896

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_SUCCESS := 0

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_UNKNOWN := 65537

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_RANGE_SIZE := 65536

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_BASE := 131072

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_AC_BASE := 131072

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_AC_CONNECT_BASE := 163840

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_AC_END := 196607

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_PROFILE_BASE := 524288

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_PROFILE_CONNECT_BASE := 557056

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_PROFILE_END := 589823

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_MSM_BASE := 196608

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_MSM_CONNECT_BASE := 229376

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_MSM_END := 262143

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_MSMSEC_BASE := 262144

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_MSMSEC_CONNECT_BASE := 294912

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_MSMSEC_END := 327679

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_RESERVED_BASE := 720896

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_RESERVED_END := 786431

/**
 * @type {Integer (UInt32)}
 */
export global L2_PROFILE_MAX_NAME_LENGTH := 256

/**
 * @type {Integer (UInt32)}
 */
export global L2_NOTIFICATION_SOURCE_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global L2_NOTIFICATION_SOURCE_DOT3_AUTO_CONFIG := 1

/**
 * @type {Integer (UInt32)}
 */
export global L2_NOTIFICATION_SOURCE_SECURITY := 2

/**
 * @type {Integer (UInt32)}
 */
export global L2_NOTIFICATION_SOURCE_ONEX := 4

/**
 * @type {Integer (UInt32)}
 */
export global L2_NOTIFICATION_SOURCE_WLAN_ACM := 8

/**
 * @type {Integer (UInt32)}
 */
export global L2_NOTIFICATION_SOURCE_WLAN_MSM := 16

/**
 * @type {Integer (UInt32)}
 */
export global L2_NOTIFICATION_SOURCE_WLAN_SECURITY := 32

/**
 * @type {Integer (UInt32)}
 */
export global L2_NOTIFICATION_SOURCE_WLAN_IHV := 64

/**
 * @type {Integer (UInt32)}
 */
export global L2_NOTIFICATION_SOURCE_WLAN_HNWK := 128

/**
 * @type {Integer (UInt32)}
 */
export global L2_NOTIFICATION_SOURCE_WCM := 256

/**
 * @type {Integer (UInt32)}
 */
export global L2_NOTIFICATION_SOURCE_WCM_CSP := 512

/**
 * @type {Integer (UInt32)}
 */
export global L2_NOTIFICATION_SOURCE_WFD := 1024

/**
 * @type {Integer (UInt32)}
 */
export global L2_NOTIFICATION_SOURCE_WLAN_DEVICE_SERVICE := 2048

/**
 * @type {Integer (UInt32)}
 */
export global L2_NOTIFICATION_SOURCE_ALL := 65535

/**
 * @type {Integer (UInt32)}
 */
export global L2_NOTIFICATION_CODE_PUBLIC_BEGIN := 0

/**
 * @type {Integer (UInt32)}
 */
export global L2_NOTIFICATION_CODE_GROUP_SIZE := 4096

/**
 * @type {Integer (UInt32)}
 */
export global L2_REASON_CODE_GROUP_SIZE := 65536

/**
 * @type {Integer (UInt32)}
 */
export global L2_REASON_CODE_GEN_BASE := 65536

/**
 * @type {Integer (UInt32)}
 */
export global L2_REASON_CODE_SUCCESS := 0

/**
 * @type {Integer (UInt32)}
 */
export global L2_REASON_CODE_UNKNOWN := 65537

/**
 * @type {Integer (UInt32)}
 */
export global L2_REASON_CODE_PROFILE_MISSING := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_BSSID_LIST_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_HESSID_LENGTH := 6

/**
 * @type {Integer (UInt32)}
 */
export global RSNA_OUI_PREFIX := 11276032

/**
 * @type {Integer (UInt32)}
 */
export global WPA_OUI_PREFIX := 15880192

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_RATE_SET_MAX_LENGTH := 126

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_WFD_SERVICE_NAME_MAX_LENGTH := 255

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_WFD_APS2_SERVICE_TYPE_MAX_LENGTH := 21

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_WFD_ASP2_INSTANCE_NAME_MAX_LENGTH := 63

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_WFD_SERVICE_INFORMATION_MAX_LENGTH := 65535

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_MAX_REQUESTED_SERVICE_INFORMATION_LENGTH := 255

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_WFD_SESSION_INFO_MAX_LENGTH := 144

/**
 * @type {Integer (UInt32)}
 */
export global NDIS_PACKET_TYPE_802_11_DIRECTED_DATA := 1

/**
 * @type {Integer (UInt32)}
 */
export global NDIS_PACKET_TYPE_802_11_BROADCAST_DATA := 8

/**
 * @type {Integer (UInt32)}
 */
export global NDIS_PACKET_TYPE_802_11_MULTICAST_DATA := 2

/**
 * @type {Integer (UInt32)}
 */
export global NDIS_PACKET_TYPE_802_11_ALL_MULTICAST_DATA := 4

/**
 * @type {Integer (UInt32)}
 */
export global NDIS_PACKET_TYPE_802_11_PROMISCUOUS_DATA := 32

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_MAX_PDU_SIZE := 2346

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_MIN_PDU_SIZE := 256

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_MAX_NUM_DEFAULT_KEY := 4

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_MAX_NUM_DEFAULT_KEY_MFP := 6

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_NDIS_START := 218170112

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_OFFLOAD_CAPABILITY := 218170112

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_HW_WEP_SUPPORTED_TX := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_HW_WEP_SUPPORTED_RX := 2

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_HW_FRAGMENTATION_SUPPORTED := 4

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_HW_DEFRAGMENTATION_SUPPORTED := 8

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_HW_MSDU_AUTH_SUPPORTED_TX := 16

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_HW_MSDU_AUTH_SUPPORTED_RX := 32

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_CONF_ALGO_WEP_RC4 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_CONF_ALGO_TKIP := 2

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_AUTH_ALGO_MICHAEL := 1

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_CURRENT_OFFLOAD_CAPABILITY := 218170113

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_WEP_OFFLOAD := 218170114

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_WEP_UPLOAD := 218170115

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_DEFAULT_WEP_OFFLOAD := 218170116

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_DEFAULT_WEP_UPLOAD := 218170117

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_MPDU_MAX_LENGTH := 218170118

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_OPERATION_MODE_CAPABILITY := 218170119

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_OPERATION_MODE_UNKNOWN := 0

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_OPERATION_MODE_STATION := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_OPERATION_MODE_AP := 2

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_OPERATION_MODE_EXTENSIBLE_STATION := 4

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_OPERATION_MODE_EXTENSIBLE_AP := 8

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_OPERATION_MODE_WFD_DEVICE := 16

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_OPERATION_MODE_WFD_GROUP_OWNER := 32

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_OPERATION_MODE_WFD_CLIENT := 64

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_OPERATION_MODE_MANUFACTURING := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_OPERATION_MODE_NETWORK_MONITOR := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_CURRENT_OPERATION_MODE := 218170120

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_CURRENT_PACKET_FILTER := 218170121

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_PACKET_TYPE_DIRECTED_CTRL := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_PACKET_TYPE_DIRECTED_MGMT := 2

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_PACKET_TYPE_DIRECTED_DATA := 4

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_PACKET_TYPE_MULTICAST_CTRL := 8

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_PACKET_TYPE_MULTICAST_MGMT := 16

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_PACKET_TYPE_MULTICAST_DATA := 32

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_PACKET_TYPE_BROADCAST_CTRL := 64

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_PACKET_TYPE_BROADCAST_MGMT := 128

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_PACKET_TYPE_BROADCAST_DATA := 256

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_PACKET_TYPE_PROMISCUOUS_CTRL := 512

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_PACKET_TYPE_PROMISCUOUS_MGMT := 1024

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_PACKET_TYPE_PROMISCUOUS_DATA := 2048

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_PACKET_TYPE_ALL_MULTICAST_CTRL := 4096

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_PACKET_TYPE_ALL_MULTICAST_MGMT := 8192

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_PACKET_TYPE_ALL_MULTICAST_DATA := 16384

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_ATIM_WINDOW := 218170122

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_SCAN_REQUEST := 218170123

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_CURRENT_PHY_TYPE := 218170124

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_PHY_TYPE_LIST_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_JOIN_REQUEST := 218170125

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_CAPABILITY_INFO_ESS := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_CAPABILITY_INFO_IBSS := 2

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_CAPABILITY_INFO_CF_POLLABLE := 4

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_CAPABILITY_INFO_CF_POLL_REQ := 8

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_CAPABILITY_INFO_PRIVACY := 16

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_CAPABILITY_SHORT_PREAMBLE := 32

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_CAPABILITY_PBCC := 64

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_CAPABILITY_CHANNEL_AGILITY := 128

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_CAPABILITY_SHORT_SLOT_TIME := 1024

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_CAPABILITY_DSSSOFDM := 8192

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_START_REQUEST := 218170126

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_UPDATE_IE := 218170127

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_RESET_REQUEST := 218170128

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_NIC_POWER_STATE := 218170129

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_OPTIONAL_CAPABILITY := 218170130

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_CURRENT_OPTIONAL_CAPABILITY := 218170131

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_STATION_ID := 218170132

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_MEDIUM_OCCUPANCY_LIMIT := 218170133

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_CF_POLLABLE := 218170134

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_CFP_PERIOD := 218170135

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_CFP_MAX_DURATION := 218170136

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_POWER_MGMT_MODE := 218170137

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_POWER_SAVE_LEVEL_MAX_PSP := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_POWER_SAVE_LEVEL_FAST_PSP := 2

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_OPERATIONAL_RATE_SET := 218170138

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_BEACON_PERIOD := 218170139

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_DTIM_PERIOD := 218170140

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_WEP_ICV_ERROR_COUNT := 218170141

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_MAC_ADDRESS := 218170142

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_RTS_THRESHOLD := 218170143

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_SHORT_RETRY_LIMIT := 218170144

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_LONG_RETRY_LIMIT := 218170145

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_FRAGMENTATION_THRESHOLD := 218170146

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_MAX_TRANSMIT_MSDU_LIFETIME := 218170147

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_MAX_RECEIVE_LIFETIME := 218170148

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_COUNTERS_ENTRY := 218170149

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_SUPPORTED_PHY_TYPES := 218170150

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_CURRENT_REG_DOMAIN := 218170151

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_REG_DOMAIN_OTHER := 0

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_REG_DOMAIN_FCC := 16

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_REG_DOMAIN_DOC := 32

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_REG_DOMAIN_ETSI := 48

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_REG_DOMAIN_SPAIN := 49

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_REG_DOMAIN_FRANCE := 50

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_REG_DOMAIN_MKK := 64

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_TEMP_TYPE := 218170152

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_CURRENT_TX_ANTENNA := 218170153

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_DIVERSITY_SUPPORT := 218170154

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_CURRENT_RX_ANTENNA := 218170155

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_SUPPORTED_POWER_LEVELS := 218170156

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_CURRENT_TX_POWER_LEVEL := 218170157

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_HOP_TIME := 218170158

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_CURRENT_CHANNEL_NUMBER := 218170159

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_MAX_DWELL_TIME := 218170160

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_CURRENT_DWELL_TIME := 218170161

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_CURRENT_SET := 218170162

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_CURRENT_PATTERN := 218170163

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_CURRENT_INDEX := 218170164

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_CURRENT_CHANNEL := 218170165

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_CCA_MODE_SUPPORTED := 218170166

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_CCA_MODE_ED_ONLY := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_CCA_MODE_CS_ONLY := 2

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_CCA_MODE_ED_and_CS := 4

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_CCA_MODE_CS_WITH_TIMER := 8

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_CCA_MODE_HRCS_AND_ED := 16

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_CURRENT_CCA_MODE := 218170167

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_ED_THRESHOLD := 218170168

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_CCA_WATCHDOG_TIMER_MAX := 218170169

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_CCA_WATCHDOG_COUNT_MAX := 218170170

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_CCA_WATCHDOG_TIMER_MIN := 218170171

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_CCA_WATCHDOG_COUNT_MIN := 218170172

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_REG_DOMAINS_SUPPORT_VALUE := 218170173

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_SUPPORTED_TX_ANTENNA := 218170174

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_SUPPORTED_RX_ANTENNA := 218170175

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_DIVERSITY_SELECTION_RX := 218170176

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_SUPPORTED_DATA_RATES_VALUE := 218170177

/**
 * @type {Integer (UInt32)}
 */
export global MAX_NUM_SUPPORTED_RATES := 8

/**
 * @type {Integer (UInt32)}
 */
export global MAX_NUM_SUPPORTED_RATES_V2 := 255

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_CURRENT_FREQUENCY := 218170178

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_TI_THRESHOLD := 218170179

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_FREQUENCY_BANDS_SUPPORTED := 218170180

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_FREQUENCY_BANDS_LOWER := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_FREQUENCY_BANDS_MIDDLE := 2

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_FREQUENCY_BANDS_UPPER := 4

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_SHORT_PREAMBLE_OPTION_IMPLEMENTED := 218170181

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_PBCC_OPTION_IMPLEMENTED := 218170182

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_CHANNEL_AGILITY_PRESENT := 218170183

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_CHANNEL_AGILITY_ENABLED := 218170184

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_HR_CCA_MODE_SUPPORTED := 218170185

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_HR_CCA_MODE_ED_ONLY := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_HR_CCA_MODE_CS_ONLY := 2

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_HR_CCA_MODE_CS_AND_ED := 4

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_HR_CCA_MODE_CS_WITH_TIMER := 8

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_HR_CCA_MODE_HRCS_AND_ED := 16

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_MULTI_DOMAIN_CAPABILITY_IMPLEMENTED := 218170186

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_MULTI_DOMAIN_CAPABILITY_ENABLED := 218170187

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_COUNTRY_STRING := 218170188

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_MULTI_DOMAIN_CAPABILITY := 218170189

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_EHCC_PRIME_RADIX := 218170190

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_EHCC_NUMBER_OF_CHANNELS_FAMILY_INDEX := 218170191

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_EHCC_CAPABILITY_IMPLEMENTED := 218170192

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_EHCC_CAPABILITY_ENABLED := 218170193

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_HOP_ALGORITHM_ADOPTED := 218170194

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_RANDOM_TABLE_FLAG := 218170195

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_NUMBER_OF_HOPPING_SETS := 218170196

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_HOP_MODULUS := 218170197

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_HOP_OFFSET := 218170198

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_HOPPING_PATTERN := 218170199

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_RANDOM_TABLE_FIELD_NUMBER := 218170200

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_WPA_TSC := 218170201

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_RSSI_RANGE := 218170202

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_RF_USAGE := 218170203

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_NIC_SPECIFIC_EXTENSION := 218170204

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_AP_JOIN_REQUEST := 218170205

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_ERP_PBCC_OPTION_IMPLEMENTED := 218170206

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_ERP_PBCC_OPTION_ENABLED := 218170207

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_DSSS_OFDM_OPTION_IMPLEMENTED := 218170208

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_DSSS_OFDM_OPTION_ENABLED := 218170209

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_SHORT_SLOT_TIME_OPTION_IMPLEMENTED := 218170210

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_SHORT_SLOT_TIME_OPTION_ENABLED := 218170211

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_MAX_MAC_ADDRESS_STATES := 218170212

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_RECV_SENSITIVITY_LIST := 218170213

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_WME_IMPLEMENTED := 218170214

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_WME_ENABLED := 218170215

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_WME_AC_PARAMETERS := 218170216

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_WME_UPDATE_IE := 218170217

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_QOS_TX_QUEUES_SUPPORTED := 218170218

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_QOS_TX_DURATION := 218170219

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_QOS_TX_MEDIUM_TIME := 218170220

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_SUPPORTED_OFDM_FREQUENCY_LIST := 218170221

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_SUPPORTED_DSSS_CHANNEL_LIST := 218170222

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_BSS_ENTRY_BYTE_ARRAY_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_POWER_SAVING_NO_POWER_SAVING := 0

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_POWER_SAVING_FAST_PSP := 8

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_POWER_SAVING_MAX_PSP := 16

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_POWER_SAVING_MAXIMUM_LEVEL := 24

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_SSID_LIST_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_MAC_ADDRESS_LIST_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_PMKID_LIST_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_STATISTICS_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_EXEMPT_NO_EXEMPTION := 0

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_EXEMPT_ALWAYS := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_EXEMPT_ON_KEY_MAPPING_KEY_UNAVAILABLE := 2

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_EXEMPT_UNICAST := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_EXEMPT_MULTICAST := 2

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_EXEMPT_BOTH := 3

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_PRIVACY_EXEMPTION_LIST_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_AUTH_ALGORITHM_LIST_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_AUTH_CIPHER_PAIR_LIST_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_CIPHER_ALGORITHM_LIST_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_CIPHER_DEFAULT_KEY_VALUE_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_CIPHER_KEY_MAPPING_KEY_VALUE_BYTE_ARRAY_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_ASSOCIATION_INFO_LIST_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_PHY_ID_LIST_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_EXTSTA_CAPABILITY_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_DATA_RATE_MAPPING_TABLE_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_COUNTRY_OR_REGION_STRING_LIST_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_PORT_STATE_NOTIFICATION_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_IBSS_PARAMS_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_QOS_PARAMS_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_ASSOCIATION_PARAMS_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_MAX_NUM_OF_FRAGMENTS := 16

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_PRIORITY_CONTENTION := 0

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_PRIORITY_CONTENTION_FREE := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_SERVICE_CLASS_REORDERABLE_MULTICAST := 0

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_SERVICE_CLASS_STRICTLY_ORDERED := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_FLAGS_80211B_SHORT_PREAMBLE := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_FLAGS_80211B_PBCC := 2

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_FLAGS_80211B_CHANNEL_AGILITY := 4

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_FLAGS_PS_ON := 8

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_FLAGS_80211G_DSSS_OFDM := 16

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_FLAGS_80211G_USE_PROTECTION := 32

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_FLAGS_80211G_NON_ERP_PRESENT := 64

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_FLAGS_80211G_BARKER_PREAMBLE_MODE := 128

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_WME_PACKET := 256

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_PHY_ATTRIBUTES_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_EXTSTA_ATTRIBUTES_SAFEMODE_OID_SUPPORTED := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_EXTSTA_ATTRIBUTES_SAFEMODE_CERTIFIED := 2

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_EXTSTA_ATTRIBUTES_SAFEMODE_RESERVED := 12

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_EXTSTA_ATTRIBUTES_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_EXTSTA_ATTRIBUTES_REVISION_2 := 2

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_EXTSTA_ATTRIBUTES_REVISION_3 := 3

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_EXTSTA_ATTRIBUTES_REVISION_4 := 4

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_SEND_CONTEXT_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_RECV_CONTEXT_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_STATUS_SUCCESS := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_STATUS_RETRY_LIMIT_EXCEEDED := 2

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_STATUS_UNSUPPORTED_PRIORITY := 4

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_STATUS_UNSUPPORTED_SERVICE_CLASS := 8

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_STATUS_UNAVAILABLE_PRIORITY := 16

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_STATUS_UNAVAILABLE_SERVICE_CLASS := 32

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_STATUS_XMIT_MSDU_TIMER_EXPIRED := 64

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_STATUS_UNAVAILABLE_BSS := 128

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_STATUS_EXCESSIVE_DATA_LENGTH := 256

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_STATUS_ENCRYPTION_FAILED := 512

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_STATUS_WEP_KEY_UNAVAILABLE := 1024

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_STATUS_ICV_VERIFIED := 2048

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_STATUS_PACKET_REASSEMBLED := 4096

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_STATUS_PACKET_NOT_REASSEMBLED := 8192

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_STATUS_GENERATE_AUTH_FAILED := 16384

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_STATUS_AUTH_NOT_VERIFIED := 32768

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_STATUS_AUTH_VERIFIED := 65536

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_STATUS_AUTH_FAILED := 131072

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_STATUS_PS_LIFETIME_EXPIRED := 262144

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_STATUS_RESET_CONFIRM := 4

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_STATUS_SCAN_CONFIRM := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_STATUS_JOIN_CONFIRM := 2

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_STATUS_START_CONFIRM := 3

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_STATUS_AP_JOIN_CONFIRM := 5

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_STATUS_MPDU_MAX_LENGTH_CHANGED := 6

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_MPDU_MAX_LENGTH_INDICATION_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_ASSOCIATION_START_PARAMETERS_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_ENCAP_RFC_1042 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_ENCAP_802_1H := 2

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_ASSOC_STATUS_SUCCESS := 0

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_ASSOCIATION_COMPLETION_PARAMETERS_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_ASSOCIATION_COMPLETION_PARAMETERS_REVISION_2 := 2

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_CONNECTION_START_PARAMETERS_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_CONNECTION_STATUS_SUCCESS := 0

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_CONNECTION_COMPLETION_PARAMETERS_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_ROAMING_START_PARAMETERS_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_ROAMING_COMPLETION_PARAMETERS_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_DISASSOCIATION_PARAMETERS_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_TKIPMIC_FAILURE_PARAMETERS_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_PMKID_CANDIDATE_LIST_PARAMETERS_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_PHY_STATE_PARAMETERS_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_LINK_QUALITY_PARAMETERS_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_EXTSTA_SEND_CONTEXT_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_EXTSTA_RECV_CONTEXT_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_PRIVATE_OIDS_START := 218171136

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_CURRENT_ADDRESS := 218171138

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_PERMANENT_ADDRESS := 218171139

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_MULTICAST_LIST := 218171140

/**
 * @type {Integer (UInt32)}
 */
export global OID_DOT11_MAXIMUM_LIST_SIZE := 218171141

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_EXTAP_ATTRIBUTES_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_INCOMING_ASSOC_STARTED_PARAMETERS_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_INCOMING_ASSOC_REQUEST_RECEIVED_PARAMETERS_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_ASSOC_ERROR_SOURCE_OS := 0

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_ASSOC_ERROR_SOURCE_REMOTE := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_ASSOC_ERROR_SOURCE_OTHER := 255

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_INCOMING_ASSOC_COMPLETION_PARAMETERS_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_STOP_AP_PARAMETERS_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_STOP_AP_REASON_FREQUENCY_NOT_AVAILABLE := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_STOP_AP_REASON_CHANNEL_NOT_AVAILABLE := 2

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_STOP_AP_REASON_AP_ACTIVE := 3

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_STOP_AP_REASON_IHV_START := 4278190080

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_STOP_AP_REASON_IHV_END := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_PHY_FREQUENCY_ADOPTED_PARAMETERS_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_CAN_SUSTAIN_AP_PARAMETERS_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_CAN_SUSTAIN_AP_REASON_IHV_START := 4278190080

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_CAN_SUSTAIN_AP_REASON_IHV_END := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_AVAILABLE_CHANNEL_LIST_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_AVAILABLE_FREQUENCY_LIST_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_DISASSOCIATE_PEER_REQUEST_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_INCOMING_ASSOC_DECISION_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_INCOMING_ASSOC_DECISION_REVISION_2 := 2

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_ADDITIONAL_IE_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_EXTAP_SEND_CONTEXT_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_EXTAP_RECV_CONTEXT_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_PEER_INFO_LIST_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_VWIFI_COMBINATION_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_VWIFI_COMBINATION_REVISION_2 := 2

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_VWIFI_COMBINATION_REVISION_3 := 3

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_VWIFI_ATTRIBUTES_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_MAC_PARAMETERS_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_WFD_ATTRIBUTES_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_WFD_STATUS_SUCCESS := 0

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_WFD_STATUS_FAILED_INFORMATION_IS_UNAVAILABLE := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_WFD_STATUS_FAILED_INCOMPATIBLE_PARAMETERS := 2

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_WFD_STATUS_FAILED_LIMIT_REACHED := 3

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_WFD_STATUS_FAILED_INVALID_PARAMETERS := 4

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_WFD_STATUS_FAILED_UNABLE_TO_ACCOMODATE_REQUEST := 5

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_WFD_STATUS_FAILED_PREVIOUS_PROTOCOL_ERROR := 6

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_WFD_STATUS_FAILED_NO_COMMON_CHANNELS := 7

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_WFD_STATUS_FAILED_UNKNOWN_WFD_GROUP := 8

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_WFD_STATUS_FAILED_MATCHING_MAX_INTENT := 9

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_WFD_STATUS_FAILED_INCOMPATIBLE_PROVISIONING_METHOD := 10

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_WFD_STATUS_FAILED_REJECTED_BY_USER := 11

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_WFD_STATUS_SUCCESS_ACCEPTED_BY_USER := 12

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_WFD_MINOR_REASON_SUCCESS := 0

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_WFD_MINOR_REASON_DISASSOCIATED_FROM_WLAN_CROSS_CONNECTION_POLICY := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_WFD_MINOR_REASON_DISASSOCIATED_NOT_MANAGED_INFRASTRUCTURE_CAPABLE := 2

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_WFD_MINOR_REASON_DISASSOCIATED_WFD_COEXISTENCE_POLICY := 3

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_WFD_MINOR_REASON_DISASSOCIATED_INFRASTRUCTURE_MANAGED_POLICY := 4

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_WPS_VERSION_1_0 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_WPS_VERSION_2_0 := 2

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_WFD_DEVICE_CAPABILITY_SERVICE_DISCOVERY := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_WFD_DEVICE_CAPABILITY_P2P_CLIENT_DISCOVERABILITY := 2

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_WFD_DEVICE_CAPABILITY_CONCURRENT_OPERATION := 4

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_WFD_DEVICE_CAPABILITY_P2P_INFRASTRUCTURE_MANAGED := 8

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_WFD_DEVICE_CAPABILITY_P2P_DEVICE_LIMIT := 16

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_WFD_DEVICE_CAPABILITY_P2P_INVITATION_PROCEDURE := 32

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_WFD_DEVICE_CAPABILITY_RESERVED_6 := 64

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_WFD_DEVICE_CAPABILITY_RESERVED_7 := 128

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_WFD_GROUP_CAPABILITY_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_WFD_GROUP_CAPABILITY_GROUP_OWNER := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_WFD_GROUP_CAPABILITY_PERSISTENT_GROUP := 2

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_WFD_GROUP_CAPABILITY_GROUP_LIMIT_REACHED := 4

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_WFD_GROUP_CAPABILITY_INTRABSS_DISTRIBUTION_SUPPORTED := 8

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_WFD_GROUP_CAPABILITY_CROSS_CONNECTION_SUPPORTED := 16

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_WFD_GROUP_CAPABILITY_PERSISTENT_RECONNECT_SUPPORTED := 32

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_WFD_GROUP_CAPABILITY_IN_GROUP_FORMATION := 64

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_WFD_GROUP_CAPABILITY_RESERVED_7 := 128

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_WFD_GROUP_CAPABILITY_EAPOL_KEY_IP_ADDRESS_ALLOCATION_SUPPORTED := 128

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_WPS_DEVICE_NAME_MAX_LENGTH := 32

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_WPS_MAX_PASSKEY_LENGTH := 8

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_WPS_MAX_MODEL_NAME_LENGTH := 32

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_WPS_MAX_MODEL_NUMBER_LENGTH := 32

/**
 * @type {Integer (UInt32)}
 */
export global WFDSVC_CONNECTION_CAPABILITY_NEW := 1

/**
 * @type {Integer (UInt32)}
 */
export global WFDSVC_CONNECTION_CAPABILITY_CLIENT := 2

/**
 * @type {Integer (UInt32)}
 */
export global WFDSVC_CONNECTION_CAPABILITY_GO := 4

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_WFD_DISCOVER_COMPLETE_PARAMETERS_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_WFD_DISCOVER_COMPLETE_MAX_LIST_SIZE := 128

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_GO_NEGOTIATION_REQUEST_SEND_COMPLETE_PARAMETERS_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_RECEIVED_GO_NEGOTIATION_REQUEST_PARAMETERS_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_GO_NEGOTIATION_RESPONSE_SEND_COMPLETE_PARAMETERS_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_RECEIVED_GO_NEGOTIATION_RESPONSE_PARAMETERS_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_GO_NEGOTIATION_CONFIRMATION_SEND_COMPLETE_PARAMETERS_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_RECEIVED_GO_NEGOTIATION_CONFIRMATION_PARAMETERS_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_INVITATION_REQUEST_SEND_COMPLETE_PARAMETERS_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_RECEIVED_INVITATION_REQUEST_PARAMETERS_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_INVITATION_RESPONSE_SEND_COMPLETE_PARAMETERS_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_RECEIVED_INVITATION_RESPONSE_PARAMETERS_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_PROVISION_DISCOVERY_REQUEST_SEND_COMPLETE_PARAMETERS_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_RECEIVED_PROVISION_DISCOVERY_REQUEST_PARAMETERS_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_PROVISION_DISCOVERY_RESPONSE_SEND_COMPLETE_PARAMETERS_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_RECEIVED_PROVISION_DISCOVERY_RESPONSE_PARAMETERS_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_ANQP_QUERY_COMPLETE_PARAMETERS_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_WFD_DEVICE_CAPABILITY_CONFIG_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_WFD_GROUP_OWNER_CAPABILITY_CONFIG_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_WFD_GROUP_OWNER_CAPABILITY_CONFIG_REVISION_2 := 2

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_WFD_DEVICE_INFO_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_WFD_SECONDARY_DEVICE_TYPE_LIST_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DISCOVERY_FILTER_BITMASK_DEVICE := 1

/**
 * @type {Integer (UInt32)}
 */
export global DISCOVERY_FILTER_BITMASK_GO := 2

/**
 * @type {Integer (UInt32)}
 */
export global DISCOVERY_FILTER_BITMASK_ANY := 15

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_WFD_DISCOVER_REQUEST_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_DEVICE_ENTRY_BYTE_ARRAY_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_WFD_DEVICE_NOT_DISCOVERABLE := 0

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_WFD_DEVICE_AUTO_AVAILABILITY := 16

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_WFD_DEVICE_HIGH_AVAILABILITY := 24

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_WFD_ADDITIONAL_IE_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_SEND_GO_NEGOTIATION_REQUEST_PARAMETERS_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_SEND_GO_NEGOTIATION_RESPONSE_PARAMETERS_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_SEND_GO_NEGOTIATION_CONFIRMATION_PARAMETERS_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_SEND_INVITATION_REQUEST_PARAMETERS_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_SEND_INVITATION_RESPONSE_PARAMETERS_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_SEND_PROVISION_DISCOVERY_REQUEST_PARAMETERS_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_SEND_PROVISION_DISCOVERY_RESPONSE_PARAMETERS_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_WFD_DEVICE_LISTEN_CHANNEL_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_WFD_GROUP_START_PARAMETERS_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_WFD_GROUP_JOIN_PARAMETERS_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_POWER_MGMT_AUTO_MODE_ENABLED_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_POWER_MGMT_MODE_STATUS_INFO_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_MAX_CHANNEL_HINTS := 4

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_INVALID_CHANNEL_NUMBER := 0

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_NLO_FLAG_STOP_NLO_INDICATION := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_NLO_FLAG_SCAN_ON_AOAC_PLATFORM := 2

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_NLO_FLAG_SCAN_AT_SYSTEM_RESUME := 4

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_OFFLOAD_NETWORK_LIST_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_OFFLOAD_NETWORK_STATUS_PARAMETERS_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_MANUFACTURING_TEST_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_MANUFACTURING_CALLBACK_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_SSID_MAX_LENGTH := 32

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_OI_MAX_LENGTH := 5

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_OI_MIN_LENGTH := 3

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_PciRootBus_SecondaryInterface := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_PciRootBus_SecondaryInterface.fmtid),
    Guid.Ptr, Guid("{d817fc28-793e-4b9e-9970-469d8be63073}"),
    UInt32, 16)
DEVPKEY_PciRootBus_SecondaryInterface.pid := 1

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_PciRootBus_CurrentSpeedAndMode := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_PciRootBus_CurrentSpeedAndMode.fmtid),
    Guid.Ptr, Guid("{d817fc28-793e-4b9e-9970-469d8be63073}"),
    UInt32, 16)
DEVPKEY_PciRootBus_CurrentSpeedAndMode.pid := 2

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_PciRootBus_SupportedSpeedsAndModes := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_PciRootBus_SupportedSpeedsAndModes.fmtid),
    Guid.Ptr, Guid("{d817fc28-793e-4b9e-9970-469d8be63073}"),
    UInt32, 16)
DEVPKEY_PciRootBus_SupportedSpeedsAndModes.pid := 3

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_PciRootBus_DeviceIDMessagingCapable := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_PciRootBus_DeviceIDMessagingCapable.fmtid),
    Guid.Ptr, Guid("{d817fc28-793e-4b9e-9970-469d8be63073}"),
    UInt32, 16)
DEVPKEY_PciRootBus_DeviceIDMessagingCapable.pid := 4

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_PciRootBus_SecondaryBusWidth := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_PciRootBus_SecondaryBusWidth.fmtid),
    Guid.Ptr, Guid("{d817fc28-793e-4b9e-9970-469d8be63073}"),
    UInt32, 16)
DEVPKEY_PciRootBus_SecondaryBusWidth.pid := 5

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_PciRootBus_ExtendedConfigAvailable := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_PciRootBus_ExtendedConfigAvailable.fmtid),
    Guid.Ptr, Guid("{d817fc28-793e-4b9e-9970-469d8be63073}"),
    UInt32, 16)
DEVPKEY_PciRootBus_ExtendedConfigAvailable.pid := 6

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_PciRootBus_ExtendedPCIConfigOpRegionSupport := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_PciRootBus_ExtendedPCIConfigOpRegionSupport.fmtid),
    Guid.Ptr, Guid("{d817fc28-793e-4b9e-9970-469d8be63073}"),
    UInt32, 16)
DEVPKEY_PciRootBus_ExtendedPCIConfigOpRegionSupport.pid := 7

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_PciRootBus_ASPMSupport := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_PciRootBus_ASPMSupport.fmtid),
    Guid.Ptr, Guid("{d817fc28-793e-4b9e-9970-469d8be63073}"),
    UInt32, 16)
DEVPKEY_PciRootBus_ASPMSupport.pid := 8

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_PciRootBus_ClockPowerManagementSupport := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_PciRootBus_ClockPowerManagementSupport.fmtid),
    Guid.Ptr, Guid("{d817fc28-793e-4b9e-9970-469d8be63073}"),
    UInt32, 16)
DEVPKEY_PciRootBus_ClockPowerManagementSupport.pid := 9

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_PciRootBus_PCISegmentGroupsSupport := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_PciRootBus_PCISegmentGroupsSupport.fmtid),
    Guid.Ptr, Guid("{d817fc28-793e-4b9e-9970-469d8be63073}"),
    UInt32, 16)
DEVPKEY_PciRootBus_PCISegmentGroupsSupport.pid := 10

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_PciRootBus_MSISupport := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_PciRootBus_MSISupport.fmtid),
    Guid.Ptr, Guid("{d817fc28-793e-4b9e-9970-469d8be63073}"),
    UInt32, 16)
DEVPKEY_PciRootBus_MSISupport.pid := 11

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_PciRootBus_PCIExpressNativeHotPlugControl := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_PciRootBus_PCIExpressNativeHotPlugControl.fmtid),
    Guid.Ptr, Guid("{d817fc28-793e-4b9e-9970-469d8be63073}"),
    UInt32, 16)
DEVPKEY_PciRootBus_PCIExpressNativeHotPlugControl.pid := 12

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_PciRootBus_SHPCNativeHotPlugControl := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_PciRootBus_SHPCNativeHotPlugControl.fmtid),
    Guid.Ptr, Guid("{d817fc28-793e-4b9e-9970-469d8be63073}"),
    UInt32, 16)
DEVPKEY_PciRootBus_SHPCNativeHotPlugControl.pid := 13

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_PciRootBus_PCIExpressNativePMEControl := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_PciRootBus_PCIExpressNativePMEControl.fmtid),
    Guid.Ptr, Guid("{d817fc28-793e-4b9e-9970-469d8be63073}"),
    UInt32, 16)
DEVPKEY_PciRootBus_PCIExpressNativePMEControl.pid := 14

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_PciRootBus_PCIExpressAERControl := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_PciRootBus_PCIExpressAERControl.fmtid),
    Guid.Ptr, Guid("{d817fc28-793e-4b9e-9970-469d8be63073}"),
    UInt32, 16)
DEVPKEY_PciRootBus_PCIExpressAERControl.pid := 15

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_PciRootBus_PCIExpressCapabilityControl := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_PciRootBus_PCIExpressCapabilityControl.fmtid),
    Guid.Ptr, Guid("{d817fc28-793e-4b9e-9970-469d8be63073}"),
    UInt32, 16)
DEVPKEY_PciRootBus_PCIExpressCapabilityControl.pid := 16

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_PciRootBus_NativePciExpressControl := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_PciRootBus_NativePciExpressControl.fmtid),
    Guid.Ptr, Guid("{d817fc28-793e-4b9e-9970-469d8be63073}"),
    UInt32, 16)
DEVPKEY_PciRootBus_NativePciExpressControl.pid := 17

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_PciRootBus_SystemMsiSupport := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_PciRootBus_SystemMsiSupport.fmtid),
    Guid.Ptr, Guid("{d817fc28-793e-4b9e-9970-469d8be63073}"),
    UInt32, 16)
DEVPKEY_PciRootBus_SystemMsiSupport.pid := 18

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_PciDevice_DeviceType := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_PciDevice_DeviceType.fmtid),
    Guid.Ptr, Guid("{3ab22e31-8264-4b4e-9af5-a8d2d8e33e62}"),
    UInt32, 16)
DEVPKEY_PciDevice_DeviceType.pid := 1

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_PciDevice_CurrentSpeedAndMode := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_PciDevice_CurrentSpeedAndMode.fmtid),
    Guid.Ptr, Guid("{3ab22e31-8264-4b4e-9af5-a8d2d8e33e62}"),
    UInt32, 16)
DEVPKEY_PciDevice_CurrentSpeedAndMode.pid := 2

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_PciDevice_BaseClass := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_PciDevice_BaseClass.fmtid),
    Guid.Ptr, Guid("{3ab22e31-8264-4b4e-9af5-a8d2d8e33e62}"),
    UInt32, 16)
DEVPKEY_PciDevice_BaseClass.pid := 3

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_PciDevice_SubClass := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_PciDevice_SubClass.fmtid),
    Guid.Ptr, Guid("{3ab22e31-8264-4b4e-9af5-a8d2d8e33e62}"),
    UInt32, 16)
DEVPKEY_PciDevice_SubClass.pid := 4

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_PciDevice_ProgIf := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_PciDevice_ProgIf.fmtid),
    Guid.Ptr, Guid("{3ab22e31-8264-4b4e-9af5-a8d2d8e33e62}"),
    UInt32, 16)
DEVPKEY_PciDevice_ProgIf.pid := 5

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_PciDevice_CurrentPayloadSize := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_PciDevice_CurrentPayloadSize.fmtid),
    Guid.Ptr, Guid("{3ab22e31-8264-4b4e-9af5-a8d2d8e33e62}"),
    UInt32, 16)
DEVPKEY_PciDevice_CurrentPayloadSize.pid := 6

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_PciDevice_MaxPayloadSize := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_PciDevice_MaxPayloadSize.fmtid),
    Guid.Ptr, Guid("{3ab22e31-8264-4b4e-9af5-a8d2d8e33e62}"),
    UInt32, 16)
DEVPKEY_PciDevice_MaxPayloadSize.pid := 7

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_PciDevice_MaxReadRequestSize := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_PciDevice_MaxReadRequestSize.fmtid),
    Guid.Ptr, Guid("{3ab22e31-8264-4b4e-9af5-a8d2d8e33e62}"),
    UInt32, 16)
DEVPKEY_PciDevice_MaxReadRequestSize.pid := 8

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_PciDevice_CurrentLinkSpeed := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_PciDevice_CurrentLinkSpeed.fmtid),
    Guid.Ptr, Guid("{3ab22e31-8264-4b4e-9af5-a8d2d8e33e62}"),
    UInt32, 16)
DEVPKEY_PciDevice_CurrentLinkSpeed.pid := 9

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_PciDevice_CurrentLinkWidth := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_PciDevice_CurrentLinkWidth.fmtid),
    Guid.Ptr, Guid("{3ab22e31-8264-4b4e-9af5-a8d2d8e33e62}"),
    UInt32, 16)
DEVPKEY_PciDevice_CurrentLinkWidth.pid := 10

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_PciDevice_MaxLinkSpeed := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_PciDevice_MaxLinkSpeed.fmtid),
    Guid.Ptr, Guid("{3ab22e31-8264-4b4e-9af5-a8d2d8e33e62}"),
    UInt32, 16)
DEVPKEY_PciDevice_MaxLinkSpeed.pid := 11

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_PciDevice_MaxLinkWidth := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_PciDevice_MaxLinkWidth.fmtid),
    Guid.Ptr, Guid("{3ab22e31-8264-4b4e-9af5-a8d2d8e33e62}"),
    UInt32, 16)
DEVPKEY_PciDevice_MaxLinkWidth.pid := 12

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_PciDevice_ExpressSpecVersion := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_PciDevice_ExpressSpecVersion.fmtid),
    Guid.Ptr, Guid("{3ab22e31-8264-4b4e-9af5-a8d2d8e33e62}"),
    UInt32, 16)
DEVPKEY_PciDevice_ExpressSpecVersion.pid := 13

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_PciDevice_InterruptSupport := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_PciDevice_InterruptSupport.fmtid),
    Guid.Ptr, Guid("{3ab22e31-8264-4b4e-9af5-a8d2d8e33e62}"),
    UInt32, 16)
DEVPKEY_PciDevice_InterruptSupport.pid := 14

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_PciDevice_InterruptMessageMaximum := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_PciDevice_InterruptMessageMaximum.fmtid),
    Guid.Ptr, Guid("{3ab22e31-8264-4b4e-9af5-a8d2d8e33e62}"),
    UInt32, 16)
DEVPKEY_PciDevice_InterruptMessageMaximum.pid := 15

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_PciDevice_BarTypes := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_PciDevice_BarTypes.fmtid),
    Guid.Ptr, Guid("{3ab22e31-8264-4b4e-9af5-a8d2d8e33e62}"),
    UInt32, 16)
DEVPKEY_PciDevice_BarTypes.pid := 16

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_PciDevice_AERCapabilityPresent := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_PciDevice_AERCapabilityPresent.fmtid),
    Guid.Ptr, Guid("{3ab22e31-8264-4b4e-9af5-a8d2d8e33e62}"),
    UInt32, 16)
DEVPKEY_PciDevice_AERCapabilityPresent.pid := 17

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_PciDevice_FirmwareErrorHandling := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_PciDevice_FirmwareErrorHandling.fmtid),
    Guid.Ptr, Guid("{3ab22e31-8264-4b4e-9af5-a8d2d8e33e62}"),
    UInt32, 16)
DEVPKEY_PciDevice_FirmwareErrorHandling.pid := 18

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_PciDevice_Uncorrectable_Error_Mask := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_PciDevice_Uncorrectable_Error_Mask.fmtid),
    Guid.Ptr, Guid("{3ab22e31-8264-4b4e-9af5-a8d2d8e33e62}"),
    UInt32, 16)
DEVPKEY_PciDevice_Uncorrectable_Error_Mask.pid := 19

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_PciDevice_Uncorrectable_Error_Severity := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_PciDevice_Uncorrectable_Error_Severity.fmtid),
    Guid.Ptr, Guid("{3ab22e31-8264-4b4e-9af5-a8d2d8e33e62}"),
    UInt32, 16)
DEVPKEY_PciDevice_Uncorrectable_Error_Severity.pid := 20

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_PciDevice_Correctable_Error_Mask := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_PciDevice_Correctable_Error_Mask.fmtid),
    Guid.Ptr, Guid("{3ab22e31-8264-4b4e-9af5-a8d2d8e33e62}"),
    UInt32, 16)
DEVPKEY_PciDevice_Correctable_Error_Mask.pid := 21

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_PciDevice_ECRC_Errors := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_PciDevice_ECRC_Errors.fmtid),
    Guid.Ptr, Guid("{3ab22e31-8264-4b4e-9af5-a8d2d8e33e62}"),
    UInt32, 16)
DEVPKEY_PciDevice_ECRC_Errors.pid := 22

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_PciDevice_Error_Reporting := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_PciDevice_Error_Reporting.fmtid),
    Guid.Ptr, Guid("{3ab22e31-8264-4b4e-9af5-a8d2d8e33e62}"),
    UInt32, 16)
DEVPKEY_PciDevice_Error_Reporting.pid := 23

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_PciDevice_RootError_Reporting := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_PciDevice_RootError_Reporting.fmtid),
    Guid.Ptr, Guid("{3ab22e31-8264-4b4e-9af5-a8d2d8e33e62}"),
    UInt32, 16)
DEVPKEY_PciDevice_RootError_Reporting.pid := 24

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_PciDevice_S0WakeupSupported := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_PciDevice_S0WakeupSupported.fmtid),
    Guid.Ptr, Guid("{3ab22e31-8264-4b4e-9af5-a8d2d8e33e62}"),
    UInt32, 16)
DEVPKEY_PciDevice_S0WakeupSupported.pid := 25

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_PciDevice_SriovSupport := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_PciDevice_SriovSupport.fmtid),
    Guid.Ptr, Guid("{3ab22e31-8264-4b4e-9af5-a8d2d8e33e62}"),
    UInt32, 16)
DEVPKEY_PciDevice_SriovSupport.pid := 26

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_PciDevice_Label_Id := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_PciDevice_Label_Id.fmtid),
    Guid.Ptr, Guid("{3ab22e31-8264-4b4e-9af5-a8d2d8e33e62}"),
    UInt32, 16)
DEVPKEY_PciDevice_Label_Id.pid := 27

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_PciDevice_Label_String := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_PciDevice_Label_String.fmtid),
    Guid.Ptr, Guid("{3ab22e31-8264-4b4e-9af5-a8d2d8e33e62}"),
    UInt32, 16)
DEVPKEY_PciDevice_Label_String.pid := 28

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_PciDevice_AcsSupport := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_PciDevice_AcsSupport.fmtid),
    Guid.Ptr, Guid("{3ab22e31-8264-4b4e-9af5-a8d2d8e33e62}"),
    UInt32, 16)
DEVPKEY_PciDevice_AcsSupport.pid := 29

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_PciDevice_AriSupport := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_PciDevice_AriSupport.fmtid),
    Guid.Ptr, Guid("{3ab22e31-8264-4b4e-9af5-a8d2d8e33e62}"),
    UInt32, 16)
DEVPKEY_PciDevice_AriSupport.pid := 30

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_PciDevice_AcsCompatibleUpHierarchy := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_PciDevice_AcsCompatibleUpHierarchy.fmtid),
    Guid.Ptr, Guid("{3ab22e31-8264-4b4e-9af5-a8d2d8e33e62}"),
    UInt32, 16)
DEVPKEY_PciDevice_AcsCompatibleUpHierarchy.pid := 31

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_PciDevice_AcsCapabilityRegister := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_PciDevice_AcsCapabilityRegister.fmtid),
    Guid.Ptr, Guid("{3ab22e31-8264-4b4e-9af5-a8d2d8e33e62}"),
    UInt32, 16)
DEVPKEY_PciDevice_AcsCapabilityRegister.pid := 32

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_PciDevice_AtsSupport := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_PciDevice_AtsSupport.fmtid),
    Guid.Ptr, Guid("{3ab22e31-8264-4b4e-9af5-a8d2d8e33e62}"),
    UInt32, 16)
DEVPKEY_PciDevice_AtsSupport.pid := 33

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_PciDevice_RequiresReservedMemoryRegion := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_PciDevice_RequiresReservedMemoryRegion.fmtid),
    Guid.Ptr, Guid("{3ab22e31-8264-4b4e-9af5-a8d2d8e33e62}"),
    UInt32, 16)
DEVPKEY_PciDevice_RequiresReservedMemoryRegion.pid := 34

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_PciDevice_AtomicsSupported := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_PciDevice_AtomicsSupported.fmtid),
    Guid.Ptr, Guid("{3ab22e31-8264-4b4e-9af5-a8d2d8e33e62}"),
    UInt32, 16)
DEVPKEY_PciDevice_AtomicsSupported.pid := 35

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_PciDevice_SupportedLinkSubState := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_PciDevice_SupportedLinkSubState.fmtid),
    Guid.Ptr, Guid("{3ab22e31-8264-4b4e-9af5-a8d2d8e33e62}"),
    UInt32, 16)
DEVPKEY_PciDevice_SupportedLinkSubState.pid := 36

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_PciDevice_OnPostPath := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_PciDevice_OnPostPath.fmtid),
    Guid.Ptr, Guid("{3ab22e31-8264-4b4e-9af5-a8d2d8e33e62}"),
    UInt32, 16)
DEVPKEY_PciDevice_OnPostPath.pid := 37

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_PciDevice_D3ColdSupport := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_PciDevice_D3ColdSupport.fmtid),
    Guid.Ptr, Guid("{3ab22e31-8264-4b4e-9af5-a8d2d8e33e62}"),
    UInt32, 16)
DEVPKEY_PciDevice_D3ColdSupport.pid := 38

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_PciDevice_VirtualChannelControlRegisters := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_PciDevice_VirtualChannelControlRegisters.fmtid),
    Guid.Ptr, Guid("{3ab22e31-8264-4b4e-9af5-a8d2d8e33e62}"),
    UInt32, 16)
DEVPKEY_PciDevice_VirtualChannelControlRegisters.pid := 39

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_PciDevice_SerialNumber := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_PciDevice_SerialNumber.fmtid),
    Guid.Ptr, Guid("{3ab22e31-8264-4b4e-9af5-a8d2d8e33e62}"),
    UInt32, 16)
DEVPKEY_PciDevice_SerialNumber.pid := 40

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_PciDevice_UsbDvsecPortType := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_PciDevice_UsbDvsecPortType.fmtid),
    Guid.Ptr, Guid("{3ab22e31-8264-4b4e-9af5-a8d2d8e33e62}"),
    UInt32, 16)
DEVPKEY_PciDevice_UsbDvsecPortType.pid := 41

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_PciDevice_UsbDvsecPortSpecificAttributes := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_PciDevice_UsbDvsecPortSpecificAttributes.fmtid),
    Guid.Ptr, Guid("{3ab22e31-8264-4b4e-9af5-a8d2d8e33e62}"),
    UInt32, 16)
DEVPKEY_PciDevice_UsbDvsecPortSpecificAttributes.pid := 42

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_PciDevice_UsbComponentRelation := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_PciDevice_UsbComponentRelation.fmtid),
    Guid.Ptr, Guid("{3ab22e31-8264-4b4e-9af5-a8d2d8e33e62}"),
    UInt32, 16)
DEVPKEY_PciDevice_UsbComponentRelation.pid := 43

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_PciDevice_UsbHostRouterName := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_PciDevice_UsbHostRouterName.fmtid),
    Guid.Ptr, Guid("{3ab22e31-8264-4b4e-9af5-a8d2d8e33e62}"),
    UInt32, 16)
DEVPKEY_PciDevice_UsbHostRouterName.pid := 44

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_PciDevice_ParentSerialNumber := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_PciDevice_ParentSerialNumber.fmtid),
    Guid.Ptr, Guid("{3ab22e31-8264-4b4e-9af5-a8d2d8e33e62}"),
    UInt32, 16)
DEVPKEY_PciDevice_ParentSerialNumber.pid := 45

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_PciDevice_SupportsDmwrOnEntireDeviceTree := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_PciDevice_SupportsDmwrOnEntireDeviceTree.fmtid),
    Guid.Ptr, Guid("{3ab22e31-8264-4b4e-9af5-a8d2d8e33e62}"),
    UInt32, 16)
DEVPKEY_PciDevice_SupportsDmwrOnEntireDeviceTree.pid := 46

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_PciDevice_IsTunneledDevice := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_PciDevice_IsTunneledDevice.fmtid),
    Guid.Ptr, Guid("{3ab22e31-8264-4b4e-9af5-a8d2d8e33e62}"),
    UInt32, 16)
DEVPKEY_PciDevice_IsTunneledDevice.pid := 47

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_API_VERSION_1_0 := 1

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_API_VERSION_2_0 := 2

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_API_VERSION := 2

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_MAX_NAME_LENGTH := 256

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_PROFILE_GROUP_POLICY := 1

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_PROFILE_USER := 2

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_PROFILE_GET_PLAINTEXT_KEY := 4

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_PROFILE_CONNECTION_MODE_SET_BY_CLIENT := 65536

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_PROFILE_CONNECTION_MODE_AUTO := 131072

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_PSD_IE_MAX_DATA_SIZE := 240

/**
 * @type {Integer (UInt32)}
 */
export global DOT11_PSD_IE_MAX_ENTRY_NUMBER := 5

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_NETWORK_NOT_COMPATIBLE := 131073

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_PROFILE_NOT_COMPATIBLE := 131074

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_NO_AUTO_CONNECTION := 163841

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_NOT_VISIBLE := 163842

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_GP_DENIED := 163843

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_USER_DENIED := 163844

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_BSS_TYPE_NOT_ALLOWED := 163845

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_IN_FAILED_LIST := 163846

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_IN_BLOCKED_LIST := 163847

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_SSID_LIST_TOO_LONG := 163848

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_CONNECT_CALL_FAIL := 163849

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_SCAN_CALL_FAIL := 163850

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_NETWORK_NOT_AVAILABLE := 163851

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_PROFILE_CHANGED_OR_DELETED := 163852

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_KEY_MISMATCH := 163853

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_USER_NOT_RESPOND := 163854

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_AP_PROFILE_NOT_ALLOWED_FOR_CLIENT := 163855

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_AP_PROFILE_NOT_ALLOWED := 163856

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_HOTSPOT2_PROFILE_DENIED := 163857

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_INVALID_PROFILE_SCHEMA := 524289

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_PROFILE_MISSING := 524290

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_INVALID_PROFILE_NAME := 524291

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_INVALID_PROFILE_TYPE := 524292

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_INVALID_PHY_TYPE := 524293

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_MSM_SECURITY_MISSING := 524294

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_IHV_SECURITY_NOT_SUPPORTED := 524295

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_IHV_OUI_MISMATCH := 524296

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_IHV_OUI_MISSING := 524297

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_IHV_SETTINGS_MISSING := 524298

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_CONFLICT_SECURITY := 524299

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_SECURITY_MISSING := 524300

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_INVALID_BSS_TYPE := 524301

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_INVALID_ADHOC_CONNECTION_MODE := 524302

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_NON_BROADCAST_SET_FOR_ADHOC := 524303

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_AUTO_SWITCH_SET_FOR_ADHOC := 524304

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_AUTO_SWITCH_SET_FOR_MANUAL_CONNECTION := 524305

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_IHV_SECURITY_ONEX_MISSING := 524306

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_PROFILE_SSID_INVALID := 524307

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_TOO_MANY_SSID := 524308

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_IHV_CONNECTIVITY_NOT_SUPPORTED := 524309

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_BAD_MAX_NUMBER_OF_CLIENTS_FOR_AP := 524310

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_INVALID_CHANNEL := 524311

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_OPERATION_MODE_NOT_SUPPORTED := 524312

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_AUTO_AP_PROFILE_NOT_ALLOWED := 524313

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_AUTO_CONNECTION_NOT_ALLOWED := 524314

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_HOTSPOT2_PROFILE_NOT_ALLOWED := 524315

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_UNSUPPORTED_SECURITY_SET_BY_OS := 196609

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_UNSUPPORTED_SECURITY_SET := 196610

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_BSS_TYPE_UNMATCH := 196611

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_PHY_TYPE_UNMATCH := 196612

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_DATARATE_UNMATCH := 196613

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_USER_CANCELLED := 229377

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_ASSOCIATION_FAILURE := 229378

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_ASSOCIATION_TIMEOUT := 229379

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_PRE_SECURITY_FAILURE := 229380

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_START_SECURITY_FAILURE := 229381

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_SECURITY_FAILURE := 229382

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_SECURITY_TIMEOUT := 229383

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_ROAMING_FAILURE := 229384

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_ROAMING_SECURITY_FAILURE := 229385

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_ADHOC_SECURITY_FAILURE := 229386

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_DRIVER_DISCONNECTED := 229387

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_DRIVER_OPERATION_FAILURE := 229388

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_IHV_NOT_AVAILABLE := 229389

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_IHV_NOT_RESPONDING := 229390

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_DISCONNECT_TIMEOUT := 229391

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_INTERNAL_FAILURE := 229392

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_UI_REQUEST_TIMEOUT := 229393

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_TOO_MANY_SECURITY_ATTEMPTS := 229394

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_AP_STARTING_FAILURE := 229395

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_NO_VISIBLE_AP := 229396

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_MSMSEC_MIN := 262144

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_MSMSEC_PROFILE_INVALID_KEY_INDEX := 262145

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_MSMSEC_PROFILE_PSK_PRESENT := 262146

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_MSMSEC_PROFILE_KEY_LENGTH := 262147

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_MSMSEC_PROFILE_PSK_LENGTH := 262148

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_MSMSEC_PROFILE_NO_AUTH_CIPHER_SPECIFIED := 262149

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_MSMSEC_PROFILE_TOO_MANY_AUTH_CIPHER_SPECIFIED := 262150

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_MSMSEC_PROFILE_DUPLICATE_AUTH_CIPHER := 262151

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_MSMSEC_PROFILE_RAWDATA_INVALID := 262152

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_MSMSEC_PROFILE_INVALID_AUTH_CIPHER := 262153

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_MSMSEC_PROFILE_ONEX_DISABLED := 262154

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_MSMSEC_PROFILE_ONEX_ENABLED := 262155

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_MSMSEC_PROFILE_INVALID_PMKCACHE_MODE := 262156

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_MSMSEC_PROFILE_INVALID_PMKCACHE_SIZE := 262157

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_MSMSEC_PROFILE_INVALID_PMKCACHE_TTL := 262158

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_MSMSEC_PROFILE_INVALID_PREAUTH_MODE := 262159

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_MSMSEC_PROFILE_INVALID_PREAUTH_THROTTLE := 262160

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_MSMSEC_PROFILE_PREAUTH_ONLY_ENABLED := 262161

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_MSMSEC_CAPABILITY_NETWORK := 262162

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_MSMSEC_CAPABILITY_NIC := 262163

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_MSMSEC_CAPABILITY_PROFILE := 262164

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_MSMSEC_CAPABILITY_DISCOVERY := 262165

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_MSMSEC_PROFILE_PASSPHRASE_CHAR := 262166

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_MSMSEC_PROFILE_KEYMATERIAL_CHAR := 262167

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_MSMSEC_PROFILE_WRONG_KEYTYPE := 262168

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_MSMSEC_MIXED_CELL := 262169

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_MSMSEC_PROFILE_AUTH_TIMERS_INVALID := 262170

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_MSMSEC_PROFILE_INVALID_GKEY_INTV := 262171

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_MSMSEC_TRANSITION_NETWORK := 262172

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_MSMSEC_PROFILE_KEY_UNMAPPED_CHAR := 262173

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_MSMSEC_CAPABILITY_PROFILE_AUTH := 262174

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_MSMSEC_CAPABILITY_PROFILE_CIPHER := 262175

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_MSMSEC_PROFILE_SAFE_MODE := 262176

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_MSMSEC_CAPABILITY_PROFILE_SAFE_MODE_NIC := 262177

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_MSMSEC_CAPABILITY_PROFILE_SAFE_MODE_NW := 262178

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_MSMSEC_PROFILE_UNSUPPORTED_AUTH := 262179

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_MSMSEC_PROFILE_UNSUPPORTED_CIPHER := 262180

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_MSMSEC_CAPABILITY_MFP_NW_NIC := 262181

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_MSMSEC_UI_REQUEST_FAILURE := 294913

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_MSMSEC_AUTH_START_TIMEOUT := 294914

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_MSMSEC_AUTH_SUCCESS_TIMEOUT := 294915

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_MSMSEC_KEY_START_TIMEOUT := 294916

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_MSMSEC_KEY_SUCCESS_TIMEOUT := 294917

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_MSMSEC_M3_MISSING_KEY_DATA := 294918

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_MSMSEC_M3_MISSING_IE := 294919

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_MSMSEC_M3_MISSING_GRP_KEY := 294920

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_MSMSEC_PR_IE_MATCHING := 294921

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_MSMSEC_SEC_IE_MATCHING := 294922

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_MSMSEC_NO_PAIRWISE_KEY := 294923

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_MSMSEC_G1_MISSING_KEY_DATA := 294924

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_MSMSEC_G1_MISSING_GRP_KEY := 294925

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_MSMSEC_PEER_INDICATED_INSECURE := 294926

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_MSMSEC_NO_AUTHENTICATOR := 294927

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_MSMSEC_NIC_FAILURE := 294928

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_MSMSEC_CANCELLED := 294929

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_MSMSEC_KEY_FORMAT := 294930

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_MSMSEC_DOWNGRADE_DETECTED := 294931

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_MSMSEC_PSK_MISMATCH_SUSPECTED := 294932

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_MSMSEC_FORCED_FAILURE := 294933

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_MSMSEC_M3_TOO_MANY_RSNIE := 294934

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_MSMSEC_M2_MISSING_KEY_DATA := 294935

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_MSMSEC_M2_MISSING_IE := 294936

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_MSMSEC_AUTH_WCN_COMPLETED := 294937

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_MSMSEC_M3_MISSING_MGMT_GRP_KEY := 294938

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_MSMSEC_G1_MISSING_MGMT_GRP_KEY := 294939

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_REASON_CODE_MSMSEC_MAX := 327679

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_AVAILABLE_NETWORK_CONNECTED := 1

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_AVAILABLE_NETWORK_HAS_PROFILE := 2

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_AVAILABLE_NETWORK_CONSOLE_USER_PROFILE := 4

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_AVAILABLE_NETWORK_INTERWORKING_SUPPORTED := 8

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_AVAILABLE_NETWORK_HOTSPOT2_ENABLED := 16

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_AVAILABLE_NETWORK_ANQP_SUPPORTED := 32

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_AVAILABLE_NETWORK_HOTSPOT2_DOMAIN := 64

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_AVAILABLE_NETWORK_HOTSPOT2_ROAMING := 128

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_AVAILABLE_NETWORK_AUTO_CONNECT_FAILED := 256

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_AVAILABLE_NETWORK_INCLUDE_ALL_ADHOC_PROFILES := 1

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_AVAILABLE_NETWORK_INCLUDE_ALL_MANUAL_HIDDEN_PROFILES := 2

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_MAX_PHY_TYPE_NUMBER := 8

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_MAX_PHY_INDEX := 64

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_CONNECTION_HIDDEN_NETWORK := 1

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_CONNECTION_ADHOC_JOIN_ONLY := 2

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_CONNECTION_IGNORE_PRIVACY_BIT := 4

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_CONNECTION_EAPOL_PASSTHROUGH := 8

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_CONNECTION_PERSIST_DISCOVERY_PROFILE := 16

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_CONNECTION_PERSIST_DISCOVERY_PROFILE_CONNECTION_MODE_AUTO := 32

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_CONNECTION_PERSIST_DISCOVERY_PROFILE_OVERWRITE_EXISTING := 64

/**
 * @type {Integer (UInt32)}
 */
export global WFD_API_VERSION_1_0 := 1

/**
 * @type {Integer (UInt32)}
 */
export global WFD_API_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_UI_API_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global WLAN_UI_API_INITIAL_VERSION := 1

/**
 * @type {Guid}
 */
export global GUID_DEVINTERFACE_WIFIDIRECT_DEVICE := Guid("{439b20af-8955-405b-99f0-a62af0c68d43}")

/**
 * @type {Guid}
 */
export global GUID_AEPSERVICE_WIFIDIRECT_DEVICE := Guid("{cc29827c-9caf-4928-99a9-18f7c2381389}")

/**
 * @type {Guid}
 */
export global GUID_DEVINTERFACE_ASP_INFRA_DEVICE := Guid("{ff823995-7a72-4c80-8757-c67ee13d1a49}")

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_WiFiDirect_DeviceAddress := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_WiFiDirect_DeviceAddress.fmtid),
    Guid.Ptr, Guid("{1506935d-e3e7-450f-8637-82233ebe5f6e}"),
    UInt32, 16)
DEVPKEY_WiFiDirect_DeviceAddress.pid := 1

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_WiFiDirect_InterfaceAddress := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_WiFiDirect_InterfaceAddress.fmtid),
    Guid.Ptr, Guid("{1506935d-e3e7-450f-8637-82233ebe5f6e}"),
    UInt32, 16)
DEVPKEY_WiFiDirect_InterfaceAddress.pid := 2

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_WiFiDirect_InterfaceGuid := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_WiFiDirect_InterfaceGuid.fmtid),
    Guid.Ptr, Guid("{1506935d-e3e7-450f-8637-82233ebe5f6e}"),
    UInt32, 16)
DEVPKEY_WiFiDirect_InterfaceGuid.pid := 3

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_WiFiDirect_GroupId := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_WiFiDirect_GroupId.fmtid),
    Guid.Ptr, Guid("{1506935d-e3e7-450f-8637-82233ebe5f6e}"),
    UInt32, 16)
DEVPKEY_WiFiDirect_GroupId.pid := 4

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_WiFiDirect_IsConnected := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_WiFiDirect_IsConnected.fmtid),
    Guid.Ptr, Guid("{1506935d-e3e7-450f-8637-82233ebe5f6e}"),
    UInt32, 16)
DEVPKEY_WiFiDirect_IsConnected.pid := 5

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_WiFiDirect_IsVisible := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_WiFiDirect_IsVisible.fmtid),
    Guid.Ptr, Guid("{1506935d-e3e7-450f-8637-82233ebe5f6e}"),
    UInt32, 16)
DEVPKEY_WiFiDirect_IsVisible.pid := 6

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_WiFiDirect_IsLegacyDevice := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_WiFiDirect_IsLegacyDevice.fmtid),
    Guid.Ptr, Guid("{1506935d-e3e7-450f-8637-82233ebe5f6e}"),
    UInt32, 16)
DEVPKEY_WiFiDirect_IsLegacyDevice.pid := 7

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_WiFiDirect_MiracastVersion := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_WiFiDirect_MiracastVersion.fmtid),
    Guid.Ptr, Guid("{1506935d-e3e7-450f-8637-82233ebe5f6e}"),
    UInt32, 16)
DEVPKEY_WiFiDirect_MiracastVersion.pid := 8

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_WiFiDirect_IsMiracastLCPSupported := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_WiFiDirect_IsMiracastLCPSupported.fmtid),
    Guid.Ptr, Guid("{1506935d-e3e7-450f-8637-82233ebe5f6e}"),
    UInt32, 16)
DEVPKEY_WiFiDirect_IsMiracastLCPSupported.pid := 9

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_WiFiDirect_Services := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_WiFiDirect_Services.fmtid),
    Guid.Ptr, Guid("{1506935d-e3e7-450f-8637-82233ebe5f6e}"),
    UInt32, 16)
DEVPKEY_WiFiDirect_Services.pid := 10

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_WiFiDirect_SupportedChannelList := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_WiFiDirect_SupportedChannelList.fmtid),
    Guid.Ptr, Guid("{1506935d-e3e7-450f-8637-82233ebe5f6e}"),
    UInt32, 16)
DEVPKEY_WiFiDirect_SupportedChannelList.pid := 11

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_WiFiDirect_InformationElements := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_WiFiDirect_InformationElements.fmtid),
    Guid.Ptr, Guid("{1506935d-e3e7-450f-8637-82233ebe5f6e}"),
    UInt32, 16)
DEVPKEY_WiFiDirect_InformationElements.pid := 12

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_WiFiDirect_DeviceAddressCopy := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_WiFiDirect_DeviceAddressCopy.fmtid),
    Guid.Ptr, Guid("{1506935d-e3e7-450f-8637-82233ebe5f6e}"),
    UInt32, 16)
DEVPKEY_WiFiDirect_DeviceAddressCopy.pid := 13

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_WiFiDirect_IsRecentlyAssociated := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_WiFiDirect_IsRecentlyAssociated.fmtid),
    Guid.Ptr, Guid("{1506935d-e3e7-450f-8637-82233ebe5f6e}"),
    UInt32, 16)
DEVPKEY_WiFiDirect_IsRecentlyAssociated.pid := 14

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_WiFiDirect_Service_Aeps := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_WiFiDirect_Service_Aeps.fmtid),
    Guid.Ptr, Guid("{1506935d-e3e7-450f-8637-82233ebe5f6e}"),
    UInt32, 16)
DEVPKEY_WiFiDirect_Service_Aeps.pid := 15

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_WiFiDirect_NoMiracastAutoProject := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_WiFiDirect_NoMiracastAutoProject.fmtid),
    Guid.Ptr, Guid("{1506935d-e3e7-450f-8637-82233ebe5f6e}"),
    UInt32, 16)
DEVPKEY_WiFiDirect_NoMiracastAutoProject.pid := 16

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_InfraCast_Supported := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_InfraCast_Supported.fmtid),
    Guid.Ptr, Guid("{1506935d-e3e7-450f-8637-82233ebe5f6e}"),
    UInt32, 16)
DEVPKEY_InfraCast_Supported.pid := 17

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_InfraCast_StreamSecuritySupported := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_InfraCast_StreamSecuritySupported.fmtid),
    Guid.Ptr, Guid("{1506935d-e3e7-450f-8637-82233ebe5f6e}"),
    UInt32, 16)
DEVPKEY_InfraCast_StreamSecuritySupported.pid := 18

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_InfraCast_AccessPointBssid := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_InfraCast_AccessPointBssid.fmtid),
    Guid.Ptr, Guid("{1506935d-e3e7-450f-8637-82233ebe5f6e}"),
    UInt32, 16)
DEVPKEY_InfraCast_AccessPointBssid.pid := 19

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_InfraCast_SinkHostName := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_InfraCast_SinkHostName.fmtid),
    Guid.Ptr, Guid("{1506935d-e3e7-450f-8637-82233ebe5f6e}"),
    UInt32, 16)
DEVPKEY_InfraCast_SinkHostName.pid := 20

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_InfraCast_ChallengeAep := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_InfraCast_ChallengeAep.fmtid),
    Guid.Ptr, Guid("{1506935d-e3e7-450f-8637-82233ebe5f6e}"),
    UInt32, 16)
DEVPKEY_InfraCast_ChallengeAep.pid := 21

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_WiFiDirect_IsDMGCapable := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_WiFiDirect_IsDMGCapable.fmtid),
    Guid.Ptr, Guid("{1506935d-e3e7-450f-8637-82233ebe5f6e}"),
    UInt32, 16)
DEVPKEY_WiFiDirect_IsDMGCapable.pid := 22

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_InfraCast_DevnodeAep := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_InfraCast_DevnodeAep.fmtid),
    Guid.Ptr, Guid("{1506935d-e3e7-450f-8637-82233ebe5f6e}"),
    UInt32, 16)
DEVPKEY_InfraCast_DevnodeAep.pid := 23

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_WiFiDirect_FoundWsbService := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_WiFiDirect_FoundWsbService.fmtid),
    Guid.Ptr, Guid("{1506935d-e3e7-450f-8637-82233ebe5f6e}"),
    UInt32, 16)
DEVPKEY_WiFiDirect_FoundWsbService.pid := 24

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_InfraCast_HostName_ResolutionMode := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_InfraCast_HostName_ResolutionMode.fmtid),
    Guid.Ptr, Guid("{1506935d-e3e7-450f-8637-82233ebe5f6e}"),
    UInt32, 16)
DEVPKEY_InfraCast_HostName_ResolutionMode.pid := 25

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_InfraCast_SinkIpAddress := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_InfraCast_SinkIpAddress.fmtid),
    Guid.Ptr, Guid("{1506935d-e3e7-450f-8637-82233ebe5f6e}"),
    UInt32, 16)
DEVPKEY_InfraCast_SinkIpAddress.pid := 26

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_WiFiDirect_TransientAssociation := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_WiFiDirect_TransientAssociation.fmtid),
    Guid.Ptr, Guid("{1506935d-e3e7-450f-8637-82233ebe5f6e}"),
    UInt32, 16)
DEVPKEY_WiFiDirect_TransientAssociation.pid := 27

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_WiFiDirect_LinkQuality := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_WiFiDirect_LinkQuality.fmtid),
    Guid.Ptr, Guid("{1506935d-e3e7-450f-8637-82233ebe5f6e}"),
    UInt32, 16)
DEVPKEY_WiFiDirect_LinkQuality.pid := 28

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_InfraCast_PinSupported := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_InfraCast_PinSupported.fmtid),
    Guid.Ptr, Guid("{1506935d-e3e7-450f-8637-82233ebe5f6e}"),
    UInt32, 16)
DEVPKEY_InfraCast_PinSupported.pid := 29

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_InfraCast_RtspTcpConnectionParametersSupported := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_InfraCast_RtspTcpConnectionParametersSupported.fmtid),
    Guid.Ptr, Guid("{1506935d-e3e7-450f-8637-82233ebe5f6e}"),
    UInt32, 16)
DEVPKEY_InfraCast_RtspTcpConnectionParametersSupported.pid := 30

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_WiFiDirect_Miracast_SessionMgmtControlPort := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_WiFiDirect_Miracast_SessionMgmtControlPort.fmtid),
    Guid.Ptr, Guid("{1506935d-e3e7-450f-8637-82233ebe5f6e}"),
    UInt32, 16)
DEVPKEY_WiFiDirect_Miracast_SessionMgmtControlPort.pid := 31

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_WiFiDirect_RtspTcpConnectionParametersSupported := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_WiFiDirect_RtspTcpConnectionParametersSupported.fmtid),
    Guid.Ptr, Guid("{1506935d-e3e7-450f-8637-82233ebe5f6e}"),
    UInt32, 16)
DEVPKEY_WiFiDirect_RtspTcpConnectionParametersSupported.pid := 32

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_WiFiDirectServices_ServiceAddress := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_WiFiDirectServices_ServiceAddress.fmtid),
    Guid.Ptr, Guid("{31b37743-7c5e-4005-93e6-e953f92b82e9}"),
    UInt32, 16)
DEVPKEY_WiFiDirectServices_ServiceAddress.pid := 2

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_WiFiDirectServices_ServiceName := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_WiFiDirectServices_ServiceName.fmtid),
    Guid.Ptr, Guid("{31b37743-7c5e-4005-93e6-e953f92b82e9}"),
    UInt32, 16)
DEVPKEY_WiFiDirectServices_ServiceName.pid := 3

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_WiFiDirectServices_ServiceInformation := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_WiFiDirectServices_ServiceInformation.fmtid),
    Guid.Ptr, Guid("{31b37743-7c5e-4005-93e6-e953f92b82e9}"),
    UInt32, 16)
DEVPKEY_WiFiDirectServices_ServiceInformation.pid := 4

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_WiFiDirectServices_AdvertisementId := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_WiFiDirectServices_AdvertisementId.fmtid),
    Guid.Ptr, Guid("{31b37743-7c5e-4005-93e6-e953f92b82e9}"),
    UInt32, 16)
DEVPKEY_WiFiDirectServices_AdvertisementId.pid := 5

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_WiFiDirectServices_ServiceConfigMethods := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_WiFiDirectServices_ServiceConfigMethods.fmtid),
    Guid.Ptr, Guid("{31b37743-7c5e-4005-93e6-e953f92b82e9}"),
    UInt32, 16)
DEVPKEY_WiFiDirectServices_ServiceConfigMethods.pid := 6

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_WiFiDirectServices_RequestServiceInformation := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_WiFiDirectServices_RequestServiceInformation.fmtid),
    Guid.Ptr, Guid("{31b37743-7c5e-4005-93e6-e953f92b82e9}"),
    UInt32, 16)
DEVPKEY_WiFiDirectServices_RequestServiceInformation.pid := 7

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_WiFi_InterfaceGuid := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_WiFi_InterfaceGuid.fmtid),
    Guid.Ptr, Guid("{ef1167eb-cbfc-4341-a568-a7c91a68982c}"),
    UInt32, 16)
DEVPKEY_WiFi_InterfaceGuid.pid := 2

/**
 * @type {Integer (UInt32)}
 */
export global DOT11EXT_PSK_MAX_LENGTH := 64

/**
 * @type {Integer (UInt32)}
 */
export global WDIAG_IHV_WLAN_ID_FLAG_SECURITY_ENABLED := 1

/**
 * @type {String}
 */
export global IHV_VERSION_FUNCTION_NAME := "Dot11ExtIhvGetVersionInfo"

/**
 * @type {String}
 */
export global IHV_INIT_FUNCTION_NAME := "Dot11ExtIhvInitService"

/**
 * @type {String}
 */
export global IHV_INIT_VS_FUNCTION_NAME := "Dot11ExtIhvInitVirtualStation"

/**
 * @type {Integer (UInt32)}
 */
export global MS_MAX_PROFILE_NAME_LENGTH := 256

/**
 * @type {Integer (UInt32)}
 */
export global MS_PROFILE_GROUP_POLICY := 1

/**
 * @type {Integer (UInt32)}
 */
export global MS_PROFILE_USER := 2
;@endregion Constants
