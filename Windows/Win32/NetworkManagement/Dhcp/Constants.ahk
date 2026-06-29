#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global OPTION_PAD := 0

/**
 * @type {Integer (UInt32)}
 */
export global OPTION_SUBNET_MASK := 1

/**
 * @type {Integer (UInt32)}
 */
export global OPTION_TIME_OFFSET := 2

/**
 * @type {Integer (UInt32)}
 */
export global OPTION_ROUTER_ADDRESS := 3

/**
 * @type {Integer (UInt32)}
 */
export global OPTION_TIME_SERVERS := 4

/**
 * @type {Integer (UInt32)}
 */
export global OPTION_IEN116_NAME_SERVERS := 5

/**
 * @type {Integer (UInt32)}
 */
export global OPTION_DOMAIN_NAME_SERVERS := 6

/**
 * @type {Integer (UInt32)}
 */
export global OPTION_LOG_SERVERS := 7

/**
 * @type {Integer (UInt32)}
 */
export global OPTION_COOKIE_SERVERS := 8

/**
 * @type {Integer (UInt32)}
 */
export global OPTION_LPR_SERVERS := 9

/**
 * @type {Integer (UInt32)}
 */
export global OPTION_IMPRESS_SERVERS := 10

/**
 * @type {Integer (UInt32)}
 */
export global OPTION_RLP_SERVERS := 11

/**
 * @type {Integer (UInt32)}
 */
export global OPTION_HOST_NAME := 12

/**
 * @type {Integer (UInt32)}
 */
export global OPTION_BOOT_FILE_SIZE := 13

/**
 * @type {Integer (UInt32)}
 */
export global OPTION_MERIT_DUMP_FILE := 14

/**
 * @type {Integer (UInt32)}
 */
export global OPTION_DOMAIN_NAME := 15

/**
 * @type {Integer (UInt32)}
 */
export global OPTION_SWAP_SERVER := 16

/**
 * @type {Integer (UInt32)}
 */
export global OPTION_ROOT_DISK := 17

/**
 * @type {Integer (UInt32)}
 */
export global OPTION_EXTENSIONS_PATH := 18

/**
 * @type {Integer (UInt32)}
 */
export global OPTION_BE_A_ROUTER := 19

/**
 * @type {Integer (UInt32)}
 */
export global OPTION_NON_LOCAL_SOURCE_ROUTING := 20

/**
 * @type {Integer (UInt32)}
 */
export global OPTION_POLICY_FILTER_FOR_NLSR := 21

/**
 * @type {Integer (UInt32)}
 */
export global OPTION_MAX_REASSEMBLY_SIZE := 22

/**
 * @type {Integer (UInt32)}
 */
export global OPTION_DEFAULT_TTL := 23

/**
 * @type {Integer (UInt32)}
 */
export global OPTION_PMTU_AGING_TIMEOUT := 24

/**
 * @type {Integer (UInt32)}
 */
export global OPTION_PMTU_PLATEAU_TABLE := 25

/**
 * @type {Integer (UInt32)}
 */
export global OPTION_MTU := 26

/**
 * @type {Integer (UInt32)}
 */
export global OPTION_ALL_SUBNETS_MTU := 27

/**
 * @type {Integer (UInt32)}
 */
export global OPTION_BROADCAST_ADDRESS := 28

/**
 * @type {Integer (UInt32)}
 */
export global OPTION_PERFORM_MASK_DISCOVERY := 29

/**
 * @type {Integer (UInt32)}
 */
export global OPTION_BE_A_MASK_SUPPLIER := 30

/**
 * @type {Integer (UInt32)}
 */
export global OPTION_PERFORM_ROUTER_DISCOVERY := 31

/**
 * @type {Integer (UInt32)}
 */
export global OPTION_ROUTER_SOLICITATION_ADDR := 32

/**
 * @type {Integer (UInt32)}
 */
export global OPTION_STATIC_ROUTES := 33

/**
 * @type {Integer (UInt32)}
 */
export global OPTION_TRAILERS := 34

/**
 * @type {Integer (UInt32)}
 */
export global OPTION_ARP_CACHE_TIMEOUT := 35

/**
 * @type {Integer (UInt32)}
 */
export global OPTION_ETHERNET_ENCAPSULATION := 36

/**
 * @type {Integer (UInt32)}
 */
export global OPTION_TTL := 37

/**
 * @type {Integer (UInt32)}
 */
export global OPTION_KEEP_ALIVE_INTERVAL := 38

/**
 * @type {Integer (UInt32)}
 */
export global OPTION_KEEP_ALIVE_DATA_SIZE := 39

/**
 * @type {Integer (UInt32)}
 */
export global OPTION_NETWORK_INFO_SERVICE_DOM := 40

/**
 * @type {Integer (UInt32)}
 */
export global OPTION_NETWORK_INFO_SERVERS := 41

/**
 * @type {Integer (UInt32)}
 */
export global OPTION_NETWORK_TIME_SERVERS := 42

/**
 * @type {Integer (UInt32)}
 */
export global OPTION_VENDOR_SPEC_INFO := 43

/**
 * @type {Integer (UInt32)}
 */
export global OPTION_NETBIOS_NAME_SERVER := 44

/**
 * @type {Integer (UInt32)}
 */
export global OPTION_NETBIOS_DATAGRAM_SERVER := 45

/**
 * @type {Integer (UInt32)}
 */
export global OPTION_NETBIOS_NODE_TYPE := 46

/**
 * @type {Integer (UInt32)}
 */
export global OPTION_NETBIOS_SCOPE_OPTION := 47

/**
 * @type {Integer (UInt32)}
 */
export global OPTION_XWINDOW_FONT_SERVER := 48

/**
 * @type {Integer (UInt32)}
 */
export global OPTION_XWINDOW_DISPLAY_MANAGER := 49

/**
 * @type {Integer (UInt32)}
 */
export global OPTION_REQUESTED_ADDRESS := 50

/**
 * @type {Integer (UInt32)}
 */
export global OPTION_LEASE_TIME := 51

/**
 * @type {Integer (UInt32)}
 */
export global OPTION_OK_TO_OVERLAY := 52

/**
 * @type {Integer (UInt32)}
 */
export global OPTION_MESSAGE_TYPE := 53

/**
 * @type {Integer (UInt32)}
 */
export global OPTION_SERVER_IDENTIFIER := 54

/**
 * @type {Integer (UInt32)}
 */
export global OPTION_PARAMETER_REQUEST_LIST := 55

/**
 * @type {Integer (UInt32)}
 */
export global OPTION_MESSAGE := 56

/**
 * @type {Integer (UInt32)}
 */
export global OPTION_MESSAGE_LENGTH := 57

/**
 * @type {Integer (UInt32)}
 */
export global OPTION_RENEWAL_TIME := 58

/**
 * @type {Integer (UInt32)}
 */
export global OPTION_REBIND_TIME := 59

/**
 * @type {Integer (UInt32)}
 */
export global OPTION_CLIENT_CLASS_INFO := 60

/**
 * @type {Integer (UInt32)}
 */
export global OPTION_CLIENT_ID := 61

/**
 * @type {Integer (UInt32)}
 */
export global OPTION_TFTP_SERVER_NAME := 66

/**
 * @type {Integer (UInt32)}
 */
export global OPTION_BOOTFILE_NAME := 67

/**
 * @type {Integer (UInt32)}
 */
export global OPTION_IPV6_ONLY_PREFERRED := 108

/**
 * @type {Integer (UInt32)}
 */
export global OPTION_DNR := 162

/**
 * @type {Integer (UInt32)}
 */
export global OPTION_MSFT_IE_PROXY := 252

/**
 * @type {Integer (UInt32)}
 */
export global OPTION_END := 255

/**
 * @type {Integer (UInt32)}
 */
export global DHCPCAPI_REQUEST_PERSISTENT := 1

/**
 * @type {Integer (UInt32)}
 */
export global DHCPCAPI_REQUEST_SYNCHRONOUS := 2

/**
 * @type {Integer (UInt32)}
 */
export global DHCPCAPI_REQUEST_ASYNCHRONOUS := 4

/**
 * @type {Integer (UInt32)}
 */
export global DHCPCAPI_REQUEST_CANCEL := 8

/**
 * @type {Integer (UInt32)}
 */
export global DHCPCAPI_REQUEST_MASK := 15

/**
 * @type {Integer (UInt32)}
 */
export global DHCPCAPI_REGISTER_HANDLE_EVENT := 1

/**
 * @type {Integer (UInt32)}
 */
export global DHCPCAPI_DEREGISTER_HANDLE_EVENT := 1

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_REGISTRY_INIT_FAILED := 20000

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_DATABASE_INIT_FAILED := 20001

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_RPC_INIT_FAILED := 20002

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_NETWORK_INIT_FAILED := 20003

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_SUBNET_EXITS := 20004

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_SUBNET_NOT_PRESENT := 20005

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_PRIMARY_NOT_FOUND := 20006

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_ELEMENT_CANT_REMOVE := 20007

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_OPTION_EXITS := 20009

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_OPTION_NOT_PRESENT := 20010

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_ADDRESS_NOT_AVAILABLE := 20011

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_RANGE_FULL := 20012

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_JET_ERROR := 20013

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_CLIENT_EXISTS := 20014

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_INVALID_DHCP_MESSAGE := 20015

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_INVALID_DHCP_CLIENT := 20016

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_SERVICE_PAUSED := 20017

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_NOT_RESERVED_CLIENT := 20018

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_RESERVED_CLIENT := 20019

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_RANGE_TOO_SMALL := 20020

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_IPRANGE_EXITS := 20021

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_RESERVEDIP_EXITS := 20022

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_INVALID_RANGE := 20023

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_RANGE_EXTENDED := 20024

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_EXTEND_TOO_SMALL := 20025

/**
 * @type {Integer (Int32)}
 */
export global WARNING_EXTENDED_LESS := 20026

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_JET_CONV_REQUIRED := 20027

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_SERVER_INVALID_BOOT_FILE_TABLE := 20028

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_SERVER_UNKNOWN_BOOT_FILE_NAME := 20029

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_SUPER_SCOPE_NAME_TOO_LONG := 20030

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_IP_ADDRESS_IN_USE := 20032

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_LOG_FILE_PATH_TOO_LONG := 20033

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_UNSUPPORTED_CLIENT := 20034

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_JET97_CONV_REQUIRED := 20036

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_ROGUE_INIT_FAILED := 20037

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_ROGUE_SAMSHUTDOWN := 20038

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_ROGUE_NOT_AUTHORIZED := 20039

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_ROGUE_DS_UNREACHABLE := 20040

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_ROGUE_DS_CONFLICT := 20041

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_ROGUE_NOT_OUR_ENTERPRISE := 20042

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_ROGUE_STANDALONE_IN_DS := 20043

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_CLASS_NOT_FOUND := 20044

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_CLASS_ALREADY_EXISTS := 20045

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_SCOPE_NAME_TOO_LONG := 20046

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_DEFAULT_SCOPE_EXITS := 20047

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_CANT_CHANGE_ATTRIBUTE := 20048

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_IPRANGE_CONV_ILLEGAL := 20049

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_NETWORK_CHANGED := 20050

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_CANNOT_MODIFY_BINDINGS := 20051

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_SUBNET_EXISTS := 20052

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_MSCOPE_EXISTS := 20053

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_MSCOPE_RANGE_TOO_SMALL := 20054

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_EXEMPTION_EXISTS := 20055

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_EXEMPTION_NOT_PRESENT := 20056

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_INVALID_PARAMETER_OPTION32 := 20057

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DDS_NO_DS_AVAILABLE := 20070

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DDS_NO_DHCP_ROOT := 20071

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DDS_UNEXPECTED_ERROR := 20072

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DDS_TOO_MANY_ERRORS := 20073

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DDS_DHCP_SERVER_NOT_FOUND := 20074

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DDS_OPTION_ALREADY_EXISTS := 20075

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DDS_OPTION_DOES_NOT_EXIST := 20076

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DDS_CLASS_EXISTS := 20077

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DDS_CLASS_DOES_NOT_EXIST := 20078

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DDS_SERVER_ALREADY_EXISTS := 20079

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DDS_SERVER_DOES_NOT_EXIST := 20080

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DDS_SERVER_ADDRESS_MISMATCH := 20081

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DDS_SUBNET_EXISTS := 20082

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DDS_SUBNET_HAS_DIFF_SSCOPE := 20083

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DDS_SUBNET_NOT_PRESENT := 20084

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DDS_RESERVATION_NOT_PRESENT := 20085

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DDS_RESERVATION_CONFLICT := 20086

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DDS_POSSIBLE_RANGE_CONFLICT := 20087

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DDS_RANGE_DOES_NOT_EXIST := 20088

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_DELETE_BUILTIN_CLASS := 20089

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_INVALID_SUBNET_PREFIX := 20091

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_INVALID_DELAY := 20092

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_LINKLAYER_ADDRESS_EXISTS := 20093

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_LINKLAYER_ADDRESS_RESERVATION_EXISTS := 20094

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_LINKLAYER_ADDRESS_DOES_NOT_EXIST := 20095

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_HARDWARE_ADDRESS_TYPE_ALREADY_EXEMPT := 20101

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_UNDEFINED_HARDWARE_ADDRESS_TYPE := 20102

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_OPTION_TYPE_MISMATCH := 20103

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_POLICY_BAD_PARENT_EXPR := 20104

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_POLICY_EXISTS := 20105

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_POLICY_RANGE_EXISTS := 20106

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_POLICY_RANGE_BAD := 20107

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_RANGE_INVALID_IN_SERVER_POLICY := 20108

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_INVALID_POLICY_EXPRESSION := 20109

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_INVALID_PROCESSING_ORDER := 20110

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_POLICY_NOT_FOUND := 20111

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_SCOPE_RANGE_POLICY_RANGE_CONFLICT := 20112

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_FO_SCOPE_ALREADY_IN_RELATIONSHIP := 20113

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_FO_RELATIONSHIP_EXISTS := 20114

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_FO_RELATIONSHIP_DOES_NOT_EXIST := 20115

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_FO_SCOPE_NOT_IN_RELATIONSHIP := 20116

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_FO_RELATION_IS_SECONDARY := 20117

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_FO_NOT_SUPPORTED := 20118

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_FO_TIME_OUT_OF_SYNC := 20119

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_FO_STATE_NOT_NORMAL := 20120

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_NO_ADMIN_PERMISSION := 20121

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_SERVER_NOT_REACHABLE := 20122

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_SERVER_NOT_RUNNING := 20123

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_SERVER_NAME_NOT_RESOLVED := 20124

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_FO_RELATIONSHIP_NAME_TOO_LONG := 20125

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_REACHED_END_OF_SELECTION := 20126

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_FO_ADDSCOPE_LEASES_NOT_SYNCED := 20127

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_FO_MAX_RELATIONSHIPS := 20128

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_FO_IPRANGE_TYPE_CONV_ILLEGAL := 20129

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_FO_MAX_ADD_SCOPES := 20130

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_FO_BOOT_NOT_SUPPORTED := 20131

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_FO_RANGE_PART_OF_REL := 20132

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_FO_SCOPE_SYNC_IN_PROGRESS := 20133

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_FO_FEATURE_NOT_SUPPORTED := 20134

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_POLICY_FQDN_RANGE_UNSUPPORTED := 20135

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_POLICY_FQDN_OPTION_UNSUPPORTED := 20136

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_POLICY_EDIT_FQDN_UNSUPPORTED := 20137

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DHCP_NAP_NOT_SUPPORTED := 20138

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_LAST_DHCP_SERVER_ERROR := 20139

/**
 * @type {Integer (UInt32)}
 */
export global DHCP_SUBNET_INFO_VQ_FLAG_QUARANTINE := 1

/**
 * @type {Integer (UInt32)}
 */
export global MAX_PATTERN_LENGTH := 255

/**
 * @type {Integer (UInt32)}
 */
export global MAC_ADDRESS_LENGTH := 6

/**
 * @type {Integer (UInt32)}
 */
export global HWTYPE_ETHERNET_10MB := 1

/**
 * @type {Integer (UInt32)}
 */
export global FILTER_STATUS_NONE := 1

/**
 * @type {Integer (UInt32)}
 */
export global FILTER_STATUS_FULL_MATCH_IN_ALLOW_LIST := 2

/**
 * @type {Integer (UInt32)}
 */
export global FILTER_STATUS_FULL_MATCH_IN_DENY_LIST := 4

/**
 * @type {Integer (UInt32)}
 */
export global FILTER_STATUS_WILDCARD_MATCH_IN_ALLOW_LIST := 8

/**
 * @type {Integer (UInt32)}
 */
export global FILTER_STATUS_WILDCARD_MATCH_IN_DENY_LIST := 16

/**
 * @type {Integer (UInt32)}
 */
export global Set_APIProtocolSupport := 1

/**
 * @type {Integer (UInt32)}
 */
export global Set_DatabaseName := 2

/**
 * @type {Integer (UInt32)}
 */
export global Set_DatabasePath := 4

/**
 * @type {Integer (UInt32)}
 */
export global Set_BackupPath := 8

/**
 * @type {Integer (UInt32)}
 */
export global Set_BackupInterval := 16

/**
 * @type {Integer (UInt32)}
 */
export global Set_DatabaseLoggingFlag := 32

/**
 * @type {Integer (UInt32)}
 */
export global Set_RestoreFlag := 64

/**
 * @type {Integer (UInt32)}
 */
export global Set_DatabaseCleanupInterval := 128

/**
 * @type {Integer (UInt32)}
 */
export global Set_DebugFlag := 256

/**
 * @type {Integer (UInt32)}
 */
export global Set_PingRetries := 512

/**
 * @type {Integer (UInt32)}
 */
export global Set_BootFileTable := 1024

/**
 * @type {Integer (UInt32)}
 */
export global Set_AuditLogState := 2048

/**
 * @type {Integer (UInt32)}
 */
export global Set_QuarantineON := 4096

/**
 * @type {Integer (UInt32)}
 */
export global Set_QuarantineDefFail := 8192

/**
 * @type {Integer (UInt32)}
 */
export global CLIENT_TYPE_UNSPECIFIED := 0

/**
 * @type {Integer (UInt32)}
 */
export global CLIENT_TYPE_DHCP := 1

/**
 * @type {Integer (UInt32)}
 */
export global CLIENT_TYPE_BOOTP := 2

/**
 * @type {Integer (UInt32)}
 */
export global CLIENT_TYPE_RESERVATION_FLAG := 4

/**
 * @type {Integer (UInt32)}
 */
export global CLIENT_TYPE_NONE := 100

/**
 * @type {Integer (UInt32)}
 */
export global Set_UnicastFlag := 1

/**
 * @type {Integer (UInt32)}
 */
export global Set_RapidCommitFlag := 2

/**
 * @type {Integer (UInt32)}
 */
export global Set_PreferredLifetime := 4

/**
 * @type {Integer (UInt32)}
 */
export global Set_ValidLifetime := 8

/**
 * @type {Integer (UInt32)}
 */
export global Set_T1 := 16

/**
 * @type {Integer (UInt32)}
 */
export global Set_T2 := 32

/**
 * @type {Integer (UInt32)}
 */
export global Set_PreferredLifetimeIATA := 64

/**
 * @type {Integer (UInt32)}
 */
export global Set_ValidLifetimeIATA := 128

/**
 * @type {Integer (UInt32)}
 */
export global V5_ADDRESS_STATE_OFFERED := 0

/**
 * @type {Integer (UInt32)}
 */
export global V5_ADDRESS_STATE_ACTIVE := 1

/**
 * @type {Integer (UInt32)}
 */
export global V5_ADDRESS_STATE_DECLINED := 2

/**
 * @type {Integer (UInt32)}
 */
export global V5_ADDRESS_STATE_DOOM := 3

/**
 * @type {Integer (UInt32)}
 */
export global V5_ADDRESS_BIT_DELETED := 128

/**
 * @type {Integer (UInt32)}
 */
export global V5_ADDRESS_BIT_UNREGISTERED := 64

/**
 * @type {Integer (UInt32)}
 */
export global V5_ADDRESS_BIT_BOTH_REC := 32

/**
 * @type {Integer (UInt32)}
 */
export global V5_ADDRESS_EX_BIT_DISABLE_PTR_RR := 1

/**
 * @type {Integer (UInt32)}
 */
export global DNS_FLAG_ENABLED := 1

/**
 * @type {Integer (UInt32)}
 */
export global DNS_FLAG_UPDATE_DOWNLEVEL := 2

/**
 * @type {Integer (UInt32)}
 */
export global DNS_FLAG_CLEANUP_EXPIRED := 4

/**
 * @type {Integer (UInt32)}
 */
export global DNS_FLAG_UPDATE_BOTH_ALWAYS := 16

/**
 * @type {Integer (UInt32)}
 */
export global DNS_FLAG_UPDATE_DHCID := 32

/**
 * @type {Integer (UInt32)}
 */
export global DNS_FLAG_DISABLE_PTR_UPDATE := 64

/**
 * @type {Integer (UInt32)}
 */
export global DNS_FLAG_HAS_DNS_SUFFIX := 128

/**
 * @type {Integer (UInt32)}
 */
export global DHCP_OPT_ENUM_IGNORE_VENDOR := 1

/**
 * @type {Integer (UInt32)}
 */
export global DHCP_OPT_ENUM_USE_CLASSNAME := 2

/**
 * @type {Integer (UInt32)}
 */
export global DHCP_FLAGS_DONT_ACCESS_DS := 1

/**
 * @type {Integer (UInt32)}
 */
export global DHCP_FLAGS_DONT_DO_RPC := 2

/**
 * @type {Integer (UInt32)}
 */
export global DHCP_FLAGS_OPTION_IS_VENDOR := 3

/**
 * @type {Integer (UInt32)}
 */
export global DHCP_ATTRIB_BOOL_IS_ROGUE := 1

/**
 * @type {Integer (UInt32)}
 */
export global DHCP_ATTRIB_BOOL_IS_DYNBOOTP := 2

/**
 * @type {Integer (UInt32)}
 */
export global DHCP_ATTRIB_BOOL_IS_PART_OF_DSDC := 3

/**
 * @type {Integer (UInt32)}
 */
export global DHCP_ATTRIB_BOOL_IS_BINDING_AWARE := 4

/**
 * @type {Integer (UInt32)}
 */
export global DHCP_ATTRIB_BOOL_IS_ADMIN := 5

/**
 * @type {Integer (UInt32)}
 */
export global DHCP_ATTRIB_ULONG_RESTORE_STATUS := 6

/**
 * @type {Integer (UInt32)}
 */
export global DHCP_ATTRIB_TYPE_BOOL := 1

/**
 * @type {Integer (UInt32)}
 */
export global DHCP_ATTRIB_TYPE_ULONG := 2

/**
 * @type {Integer (UInt32)}
 */
export global DHCP_ENDPOINT_FLAG_CANT_MODIFY := 1

/**
 * @type {Integer (UInt32)}
 */
export global QUARANTIN_OPTION_BASE := 43220

/**
 * @type {Integer (UInt32)}
 */
export global QUARANTINE_SCOPE_QUARPROFILE_OPTION := 43221

/**
 * @type {Integer (UInt32)}
 */
export global QUARANTINE_CONFIG_OPTION := 43222

/**
 * @type {Integer (UInt32)}
 */
export global ADDRESS_TYPE_IANA := 0

/**
 * @type {Integer (UInt32)}
 */
export global ADDRESS_TYPE_IATA := 1

/**
 * @type {Integer (UInt32)}
 */
export global DHCP_MIN_DELAY := 0

/**
 * @type {Integer (UInt32)}
 */
export global DHCP_MAX_DELAY := 1000

/**
 * @type {Integer (UInt32)}
 */
export global DHCP_FAILOVER_DELETE_SCOPES := 1

/**
 * @type {Integer (UInt32)}
 */
export global DHCP_FAILOVER_MAX_NUM_ADD_SCOPES := 400

/**
 * @type {Integer (UInt32)}
 */
export global DHCP_FAILOVER_MAX_NUM_REL := 31

/**
 * @type {Integer (UInt32)}
 */
export global MCLT := 1

/**
 * @type {Integer (UInt32)}
 */
export global SAFEPERIOD := 2

/**
 * @type {Integer (UInt32)}
 */
export global CHANGESTATE := 4

/**
 * @type {Integer (UInt32)}
 */
export global PERCENTAGE := 8

/**
 * @type {Integer (UInt32)}
 */
export global MODE := 16

/**
 * @type {Integer (UInt32)}
 */
export global PREVSTATE := 32

/**
 * @type {Integer (UInt32)}
 */
export global SHAREDSECRET := 64

/**
 * @type {String}
 */
export global DHCP_CALLOUT_LIST_KEY := "System\CurrentControlSet\Services\DHCPServer\Parameters"

/**
 * @type {String}
 */
export global DHCP_CALLOUT_LIST_VALUE := "CalloutDlls"

/**
 * @type {String}
 */
export global DHCP_CALLOUT_ENTRY_POINT := "DhcpServerCalloutEntry"

/**
 * @type {Integer (UInt32)}
 */
export global DHCP_CONTROL_START := 1

/**
 * @type {Integer (UInt32)}
 */
export global DHCP_CONTROL_STOP := 2

/**
 * @type {Integer (UInt32)}
 */
export global DHCP_CONTROL_PAUSE := 3

/**
 * @type {Integer (UInt32)}
 */
export global DHCP_CONTROL_CONTINUE := 4

/**
 * @type {Integer (UInt32)}
 */
export global DHCP_DROP_DUPLICATE := 1

/**
 * @type {Integer (UInt32)}
 */
export global DHCP_DROP_NOMEM := 2

/**
 * @type {Integer (UInt32)}
 */
export global DHCP_DROP_INTERNAL_ERROR := 3

/**
 * @type {Integer (UInt32)}
 */
export global DHCP_DROP_TIMEOUT := 4

/**
 * @type {Integer (UInt32)}
 */
export global DHCP_DROP_UNAUTH := 5

/**
 * @type {Integer (UInt32)}
 */
export global DHCP_DROP_PAUSED := 6

/**
 * @type {Integer (UInt32)}
 */
export global DHCP_DROP_NO_SUBNETS := 7

/**
 * @type {Integer (UInt32)}
 */
export global DHCP_DROP_INVALID := 8

/**
 * @type {Integer (UInt32)}
 */
export global DHCP_DROP_WRONG_SERVER := 9

/**
 * @type {Integer (UInt32)}
 */
export global DHCP_DROP_NOADDRESS := 10

/**
 * @type {Integer (UInt32)}
 */
export global DHCP_DROP_PROCESSED := 11

/**
 * @type {Integer (UInt32)}
 */
export global DHCP_DROP_GEN_FAILURE := 256

/**
 * @type {Integer (UInt32)}
 */
export global DHCP_SEND_PACKET := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global DHCP_PROB_CONFLICT := 536870913

/**
 * @type {Integer (UInt32)}
 */
export global DHCP_PROB_DECLINE := 536870914

/**
 * @type {Integer (UInt32)}
 */
export global DHCP_PROB_RELEASE := 536870915

/**
 * @type {Integer (UInt32)}
 */
export global DHCP_PROB_NACKED := 536870916

/**
 * @type {Integer (UInt32)}
 */
export global DHCP_GIVE_ADDRESS_NEW := 805306369

/**
 * @type {Integer (UInt32)}
 */
export global DHCP_GIVE_ADDRESS_OLD := 805306370

/**
 * @type {Integer (UInt32)}
 */
export global DHCP_CLIENT_BOOTP := 805306371

/**
 * @type {Integer (UInt32)}
 */
export global DHCP_CLIENT_DHCP := 805306372

/**
 * @type {Integer (UInt32)}
 */
export global DHCPV6_OPTION_CLIENTID := 1

/**
 * @type {Integer (UInt32)}
 */
export global DHCPV6_OPTION_SERVERID := 2

/**
 * @type {Integer (UInt32)}
 */
export global DHCPV6_OPTION_IA_NA := 3

/**
 * @type {Integer (UInt32)}
 */
export global DHCPV6_OPTION_IA_TA := 4

/**
 * @type {Integer (UInt32)}
 */
export global DHCPV6_OPTION_ORO := 6

/**
 * @type {Integer (UInt32)}
 */
export global DHCPV6_OPTION_PREFERENCE := 7

/**
 * @type {Integer (UInt32)}
 */
export global DHCPV6_OPTION_UNICAST := 12

/**
 * @type {Integer (UInt32)}
 */
export global DHCPV6_OPTION_RAPID_COMMIT := 14

/**
 * @type {Integer (UInt32)}
 */
export global DHCPV6_OPTION_USER_CLASS := 15

/**
 * @type {Integer (UInt32)}
 */
export global DHCPV6_OPTION_VENDOR_CLASS := 16

/**
 * @type {Integer (UInt32)}
 */
export global DHCPV6_OPTION_VENDOR_OPTS := 17

/**
 * @type {Integer (UInt32)}
 */
export global DHCPV6_OPTION_RECONF_MSG := 19

/**
 * @type {Integer (UInt32)}
 */
export global DHCPV6_OPTION_SIP_SERVERS_NAMES := 21

/**
 * @type {Integer (UInt32)}
 */
export global DHCPV6_OPTION_SIP_SERVERS_ADDRS := 22

/**
 * @type {Integer (UInt32)}
 */
export global DHCPV6_OPTION_DNS_SERVERS := 23

/**
 * @type {Integer (UInt32)}
 */
export global DHCPV6_OPTION_DOMAIN_LIST := 24

/**
 * @type {Integer (UInt32)}
 */
export global DHCPV6_OPTION_IA_PD := 25

/**
 * @type {Integer (UInt32)}
 */
export global DHCPV6_OPTION_NIS_SERVERS := 27

/**
 * @type {Integer (UInt32)}
 */
export global DHCPV6_OPTION_NISP_SERVERS := 28

/**
 * @type {Integer (UInt32)}
 */
export global DHCPV6_OPTION_NIS_DOMAIN_NAME := 29

/**
 * @type {Integer (UInt32)}
 */
export global DHCPV6_OPTION_NISP_DOMAIN_NAME := 30

/**
 * @type {Integer (UInt32)}
 */
export global DHCPV6_OPTION_DNR := 144
;@endregion Constants
