#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
/**
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class Dhcp {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static OPTION_PAD => 0

    /**
     * @type {Integer (UInt32)}
     */
    static OPTION_SUBNET_MASK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static OPTION_TIME_OFFSET => 2

    /**
     * @type {Integer (UInt32)}
     */
    static OPTION_ROUTER_ADDRESS => 3

    /**
     * @type {Integer (UInt32)}
     */
    static OPTION_TIME_SERVERS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static OPTION_IEN116_NAME_SERVERS => 5

    /**
     * @type {Integer (UInt32)}
     */
    static OPTION_DOMAIN_NAME_SERVERS => 6

    /**
     * @type {Integer (UInt32)}
     */
    static OPTION_LOG_SERVERS => 7

    /**
     * @type {Integer (UInt32)}
     */
    static OPTION_COOKIE_SERVERS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static OPTION_LPR_SERVERS => 9

    /**
     * @type {Integer (UInt32)}
     */
    static OPTION_IMPRESS_SERVERS => 10

    /**
     * @type {Integer (UInt32)}
     */
    static OPTION_RLP_SERVERS => 11

    /**
     * @type {Integer (UInt32)}
     */
    static OPTION_HOST_NAME => 12

    /**
     * @type {Integer (UInt32)}
     */
    static OPTION_BOOT_FILE_SIZE => 13

    /**
     * @type {Integer (UInt32)}
     */
    static OPTION_MERIT_DUMP_FILE => 14

    /**
     * @type {Integer (UInt32)}
     */
    static OPTION_DOMAIN_NAME => 15

    /**
     * @type {Integer (UInt32)}
     */
    static OPTION_SWAP_SERVER => 16

    /**
     * @type {Integer (UInt32)}
     */
    static OPTION_ROOT_DISK => 17

    /**
     * @type {Integer (UInt32)}
     */
    static OPTION_EXTENSIONS_PATH => 18

    /**
     * @type {Integer (UInt32)}
     */
    static OPTION_BE_A_ROUTER => 19

    /**
     * @type {Integer (UInt32)}
     */
    static OPTION_NON_LOCAL_SOURCE_ROUTING => 20

    /**
     * @type {Integer (UInt32)}
     */
    static OPTION_POLICY_FILTER_FOR_NLSR => 21

    /**
     * @type {Integer (UInt32)}
     */
    static OPTION_MAX_REASSEMBLY_SIZE => 22

    /**
     * @type {Integer (UInt32)}
     */
    static OPTION_DEFAULT_TTL => 23

    /**
     * @type {Integer (UInt32)}
     */
    static OPTION_PMTU_AGING_TIMEOUT => 24

    /**
     * @type {Integer (UInt32)}
     */
    static OPTION_PMTU_PLATEAU_TABLE => 25

    /**
     * @type {Integer (UInt32)}
     */
    static OPTION_MTU => 26

    /**
     * @type {Integer (UInt32)}
     */
    static OPTION_ALL_SUBNETS_MTU => 27

    /**
     * @type {Integer (UInt32)}
     */
    static OPTION_BROADCAST_ADDRESS => 28

    /**
     * @type {Integer (UInt32)}
     */
    static OPTION_PERFORM_MASK_DISCOVERY => 29

    /**
     * @type {Integer (UInt32)}
     */
    static OPTION_BE_A_MASK_SUPPLIER => 30

    /**
     * @type {Integer (UInt32)}
     */
    static OPTION_PERFORM_ROUTER_DISCOVERY => 31

    /**
     * @type {Integer (UInt32)}
     */
    static OPTION_ROUTER_SOLICITATION_ADDR => 32

    /**
     * @type {Integer (UInt32)}
     */
    static OPTION_STATIC_ROUTES => 33

    /**
     * @type {Integer (UInt32)}
     */
    static OPTION_TRAILERS => 34

    /**
     * @type {Integer (UInt32)}
     */
    static OPTION_ARP_CACHE_TIMEOUT => 35

    /**
     * @type {Integer (UInt32)}
     */
    static OPTION_ETHERNET_ENCAPSULATION => 36

    /**
     * @type {Integer (UInt32)}
     */
    static OPTION_TTL => 37

    /**
     * @type {Integer (UInt32)}
     */
    static OPTION_KEEP_ALIVE_INTERVAL => 38

    /**
     * @type {Integer (UInt32)}
     */
    static OPTION_KEEP_ALIVE_DATA_SIZE => 39

    /**
     * @type {Integer (UInt32)}
     */
    static OPTION_NETWORK_INFO_SERVICE_DOM => 40

    /**
     * @type {Integer (UInt32)}
     */
    static OPTION_NETWORK_INFO_SERVERS => 41

    /**
     * @type {Integer (UInt32)}
     */
    static OPTION_NETWORK_TIME_SERVERS => 42

    /**
     * @type {Integer (UInt32)}
     */
    static OPTION_VENDOR_SPEC_INFO => 43

    /**
     * @type {Integer (UInt32)}
     */
    static OPTION_NETBIOS_NAME_SERVER => 44

    /**
     * @type {Integer (UInt32)}
     */
    static OPTION_NETBIOS_DATAGRAM_SERVER => 45

    /**
     * @type {Integer (UInt32)}
     */
    static OPTION_NETBIOS_NODE_TYPE => 46

    /**
     * @type {Integer (UInt32)}
     */
    static OPTION_NETBIOS_SCOPE_OPTION => 47

    /**
     * @type {Integer (UInt32)}
     */
    static OPTION_XWINDOW_FONT_SERVER => 48

    /**
     * @type {Integer (UInt32)}
     */
    static OPTION_XWINDOW_DISPLAY_MANAGER => 49

    /**
     * @type {Integer (UInt32)}
     */
    static OPTION_REQUESTED_ADDRESS => 50

    /**
     * @type {Integer (UInt32)}
     */
    static OPTION_LEASE_TIME => 51

    /**
     * @type {Integer (UInt32)}
     */
    static OPTION_OK_TO_OVERLAY => 52

    /**
     * @type {Integer (UInt32)}
     */
    static OPTION_MESSAGE_TYPE => 53

    /**
     * @type {Integer (UInt32)}
     */
    static OPTION_SERVER_IDENTIFIER => 54

    /**
     * @type {Integer (UInt32)}
     */
    static OPTION_PARAMETER_REQUEST_LIST => 55

    /**
     * @type {Integer (UInt32)}
     */
    static OPTION_MESSAGE => 56

    /**
     * @type {Integer (UInt32)}
     */
    static OPTION_MESSAGE_LENGTH => 57

    /**
     * @type {Integer (UInt32)}
     */
    static OPTION_RENEWAL_TIME => 58

    /**
     * @type {Integer (UInt32)}
     */
    static OPTION_REBIND_TIME => 59

    /**
     * @type {Integer (UInt32)}
     */
    static OPTION_CLIENT_CLASS_INFO => 60

    /**
     * @type {Integer (UInt32)}
     */
    static OPTION_CLIENT_ID => 61

    /**
     * @type {Integer (UInt32)}
     */
    static OPTION_TFTP_SERVER_NAME => 66

    /**
     * @type {Integer (UInt32)}
     */
    static OPTION_BOOTFILE_NAME => 67

    /**
     * @type {Integer (UInt32)}
     */
    static OPTION_IPV6_ONLY_PREFERRED => 108

    /**
     * @type {Integer (UInt32)}
     */
    static OPTION_DNR => 162

    /**
     * @type {Integer (UInt32)}
     */
    static OPTION_MSFT_IE_PROXY => 252

    /**
     * @type {Integer (UInt32)}
     */
    static OPTION_END => 255

    /**
     * @type {Integer (UInt32)}
     */
    static DHCPCAPI_REQUEST_PERSISTENT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DHCPCAPI_REQUEST_SYNCHRONOUS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DHCPCAPI_REQUEST_ASYNCHRONOUS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DHCPCAPI_REQUEST_CANCEL => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DHCPCAPI_REQUEST_MASK => 15

    /**
     * @type {Integer (UInt32)}
     */
    static DHCPCAPI_REGISTER_HANDLE_EVENT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DHCPCAPI_DEREGISTER_HANDLE_EVENT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_REGISTRY_INIT_FAILED => 20000

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_DATABASE_INIT_FAILED => 20001

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_RPC_INIT_FAILED => 20002

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_NETWORK_INIT_FAILED => 20003

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_SUBNET_EXITS => 20004

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_SUBNET_NOT_PRESENT => 20005

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_PRIMARY_NOT_FOUND => 20006

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_ELEMENT_CANT_REMOVE => 20007

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_OPTION_EXITS => 20009

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_OPTION_NOT_PRESENT => 20010

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_ADDRESS_NOT_AVAILABLE => 20011

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_RANGE_FULL => 20012

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_JET_ERROR => 20013

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_CLIENT_EXISTS => 20014

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_INVALID_DHCP_MESSAGE => 20015

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_INVALID_DHCP_CLIENT => 20016

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_SERVICE_PAUSED => 20017

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_NOT_RESERVED_CLIENT => 20018

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_RESERVED_CLIENT => 20019

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_RANGE_TOO_SMALL => 20020

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_IPRANGE_EXITS => 20021

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_RESERVEDIP_EXITS => 20022

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_INVALID_RANGE => 20023

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_RANGE_EXTENDED => 20024

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EXTEND_TOO_SMALL => 20025

    /**
     * @type {Integer (Int32)}
     */
    static WARNING_EXTENDED_LESS => 20026

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_JET_CONV_REQUIRED => 20027

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SERVER_INVALID_BOOT_FILE_TABLE => 20028

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SERVER_UNKNOWN_BOOT_FILE_NAME => 20029

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_SUPER_SCOPE_NAME_TOO_LONG => 20030

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_IP_ADDRESS_IN_USE => 20032

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_LOG_FILE_PATH_TOO_LONG => 20033

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_UNSUPPORTED_CLIENT => 20034

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_JET97_CONV_REQUIRED => 20036

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_ROGUE_INIT_FAILED => 20037

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_ROGUE_SAMSHUTDOWN => 20038

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_ROGUE_NOT_AUTHORIZED => 20039

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_ROGUE_DS_UNREACHABLE => 20040

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_ROGUE_DS_CONFLICT => 20041

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_ROGUE_NOT_OUR_ENTERPRISE => 20042

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_ROGUE_STANDALONE_IN_DS => 20043

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_CLASS_NOT_FOUND => 20044

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_CLASS_ALREADY_EXISTS => 20045

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_SCOPE_NAME_TOO_LONG => 20046

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_DEFAULT_SCOPE_EXITS => 20047

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_CANT_CHANGE_ATTRIBUTE => 20048

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_IPRANGE_CONV_ILLEGAL => 20049

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_NETWORK_CHANGED => 20050

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_CANNOT_MODIFY_BINDINGS => 20051

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_SUBNET_EXISTS => 20052

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_MSCOPE_EXISTS => 20053

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MSCOPE_RANGE_TOO_SMALL => 20054

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_EXEMPTION_EXISTS => 20055

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_EXEMPTION_NOT_PRESENT => 20056

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_INVALID_PARAMETER_OPTION32 => 20057

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DDS_NO_DS_AVAILABLE => 20070

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DDS_NO_DHCP_ROOT => 20071

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DDS_UNEXPECTED_ERROR => 20072

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DDS_TOO_MANY_ERRORS => 20073

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DDS_DHCP_SERVER_NOT_FOUND => 20074

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DDS_OPTION_ALREADY_EXISTS => 20075

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DDS_OPTION_DOES_NOT_EXIST => 20076

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DDS_CLASS_EXISTS => 20077

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DDS_CLASS_DOES_NOT_EXIST => 20078

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DDS_SERVER_ALREADY_EXISTS => 20079

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DDS_SERVER_DOES_NOT_EXIST => 20080

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DDS_SERVER_ADDRESS_MISMATCH => 20081

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DDS_SUBNET_EXISTS => 20082

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DDS_SUBNET_HAS_DIFF_SSCOPE => 20083

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DDS_SUBNET_NOT_PRESENT => 20084

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DDS_RESERVATION_NOT_PRESENT => 20085

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DDS_RESERVATION_CONFLICT => 20086

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DDS_POSSIBLE_RANGE_CONFLICT => 20087

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DDS_RANGE_DOES_NOT_EXIST => 20088

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_DELETE_BUILTIN_CLASS => 20089

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_INVALID_SUBNET_PREFIX => 20091

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_INVALID_DELAY => 20092

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_LINKLAYER_ADDRESS_EXISTS => 20093

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_LINKLAYER_ADDRESS_RESERVATION_EXISTS => 20094

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_LINKLAYER_ADDRESS_DOES_NOT_EXIST => 20095

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_HARDWARE_ADDRESS_TYPE_ALREADY_EXEMPT => 20101

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_UNDEFINED_HARDWARE_ADDRESS_TYPE => 20102

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_OPTION_TYPE_MISMATCH => 20103

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_POLICY_BAD_PARENT_EXPR => 20104

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_POLICY_EXISTS => 20105

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_POLICY_RANGE_EXISTS => 20106

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_POLICY_RANGE_BAD => 20107

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_RANGE_INVALID_IN_SERVER_POLICY => 20108

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_INVALID_POLICY_EXPRESSION => 20109

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_INVALID_PROCESSING_ORDER => 20110

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_POLICY_NOT_FOUND => 20111

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SCOPE_RANGE_POLICY_RANGE_CONFLICT => 20112

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_FO_SCOPE_ALREADY_IN_RELATIONSHIP => 20113

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_FO_RELATIONSHIP_EXISTS => 20114

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_FO_RELATIONSHIP_DOES_NOT_EXIST => 20115

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_FO_SCOPE_NOT_IN_RELATIONSHIP => 20116

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_FO_RELATION_IS_SECONDARY => 20117

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_FO_NOT_SUPPORTED => 20118

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_FO_TIME_OUT_OF_SYNC => 20119

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_FO_STATE_NOT_NORMAL => 20120

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_NO_ADMIN_PERMISSION => 20121

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_SERVER_NOT_REACHABLE => 20122

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_SERVER_NOT_RUNNING => 20123

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_SERVER_NAME_NOT_RESOLVED => 20124

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_FO_RELATIONSHIP_NAME_TOO_LONG => 20125

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_REACHED_END_OF_SELECTION => 20126

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_FO_ADDSCOPE_LEASES_NOT_SYNCED => 20127

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_FO_MAX_RELATIONSHIPS => 20128

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_FO_IPRANGE_TYPE_CONV_ILLEGAL => 20129

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_FO_MAX_ADD_SCOPES => 20130

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_FO_BOOT_NOT_SUPPORTED => 20131

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_FO_RANGE_PART_OF_REL => 20132

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_FO_SCOPE_SYNC_IN_PROGRESS => 20133

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_FO_FEATURE_NOT_SUPPORTED => 20134

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_POLICY_FQDN_RANGE_UNSUPPORTED => 20135

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_POLICY_FQDN_OPTION_UNSUPPORTED => 20136

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_POLICY_EDIT_FQDN_UNSUPPORTED => 20137

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_NAP_NOT_SUPPORTED => 20138

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LAST_DHCP_SERVER_ERROR => 20139

    /**
     * @type {Integer (UInt32)}
     */
    static DHCP_SUBNET_INFO_VQ_FLAG_QUARANTINE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_PATTERN_LENGTH => 255

    /**
     * @type {Integer (UInt32)}
     */
    static MAC_ADDRESS_LENGTH => 6

    /**
     * @type {Integer (UInt32)}
     */
    static HWTYPE_ETHERNET_10MB => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FILTER_STATUS_NONE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FILTER_STATUS_FULL_MATCH_IN_ALLOW_LIST => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FILTER_STATUS_FULL_MATCH_IN_DENY_LIST => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FILTER_STATUS_WILDCARD_MATCH_IN_ALLOW_LIST => 8

    /**
     * @type {Integer (UInt32)}
     */
    static FILTER_STATUS_WILDCARD_MATCH_IN_DENY_LIST => 16

    /**
     * @type {Integer (UInt32)}
     */
    static Set_APIProtocolSupport => 1

    /**
     * @type {Integer (UInt32)}
     */
    static Set_DatabaseName => 2

    /**
     * @type {Integer (UInt32)}
     */
    static Set_DatabasePath => 4

    /**
     * @type {Integer (UInt32)}
     */
    static Set_BackupPath => 8

    /**
     * @type {Integer (UInt32)}
     */
    static Set_BackupInterval => 16

    /**
     * @type {Integer (UInt32)}
     */
    static Set_DatabaseLoggingFlag => 32

    /**
     * @type {Integer (UInt32)}
     */
    static Set_RestoreFlag => 64

    /**
     * @type {Integer (UInt32)}
     */
    static Set_DatabaseCleanupInterval => 128

    /**
     * @type {Integer (UInt32)}
     */
    static Set_DebugFlag => 256

    /**
     * @type {Integer (UInt32)}
     */
    static Set_PingRetries => 512

    /**
     * @type {Integer (UInt32)}
     */
    static Set_BootFileTable => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static Set_AuditLogState => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static Set_QuarantineON => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static Set_QuarantineDefFail => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static CLIENT_TYPE_UNSPECIFIED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CLIENT_TYPE_DHCP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CLIENT_TYPE_BOOTP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CLIENT_TYPE_RESERVATION_FLAG => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CLIENT_TYPE_NONE => 100

    /**
     * @type {Integer (UInt32)}
     */
    static Set_UnicastFlag => 1

    /**
     * @type {Integer (UInt32)}
     */
    static Set_RapidCommitFlag => 2

    /**
     * @type {Integer (UInt32)}
     */
    static Set_PreferredLifetime => 4

    /**
     * @type {Integer (UInt32)}
     */
    static Set_ValidLifetime => 8

    /**
     * @type {Integer (UInt32)}
     */
    static Set_T1 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static Set_T2 => 32

    /**
     * @type {Integer (UInt32)}
     */
    static Set_PreferredLifetimeIATA => 64

    /**
     * @type {Integer (UInt32)}
     */
    static Set_ValidLifetimeIATA => 128

    /**
     * @type {Integer (UInt32)}
     */
    static V5_ADDRESS_STATE_OFFERED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static V5_ADDRESS_STATE_ACTIVE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static V5_ADDRESS_STATE_DECLINED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static V5_ADDRESS_STATE_DOOM => 3

    /**
     * @type {Integer (UInt32)}
     */
    static V5_ADDRESS_BIT_DELETED => 128

    /**
     * @type {Integer (UInt32)}
     */
    static V5_ADDRESS_BIT_UNREGISTERED => 64

    /**
     * @type {Integer (UInt32)}
     */
    static V5_ADDRESS_BIT_BOTH_REC => 32

    /**
     * @type {Integer (UInt32)}
     */
    static V5_ADDRESS_EX_BIT_DISABLE_PTR_RR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_FLAG_ENABLED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_FLAG_UPDATE_DOWNLEVEL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_FLAG_CLEANUP_EXPIRED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_FLAG_UPDATE_BOTH_ALWAYS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_FLAG_UPDATE_DHCID => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_FLAG_DISABLE_PTR_UPDATE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_FLAG_HAS_DNS_SUFFIX => 128

    /**
     * @type {Integer (UInt32)}
     */
    static DHCP_OPT_ENUM_IGNORE_VENDOR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DHCP_OPT_ENUM_USE_CLASSNAME => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DHCP_FLAGS_DONT_ACCESS_DS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DHCP_FLAGS_DONT_DO_RPC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DHCP_FLAGS_OPTION_IS_VENDOR => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DHCP_ATTRIB_BOOL_IS_ROGUE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DHCP_ATTRIB_BOOL_IS_DYNBOOTP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DHCP_ATTRIB_BOOL_IS_PART_OF_DSDC => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DHCP_ATTRIB_BOOL_IS_BINDING_AWARE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DHCP_ATTRIB_BOOL_IS_ADMIN => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DHCP_ATTRIB_ULONG_RESTORE_STATUS => 6

    /**
     * @type {Integer (UInt32)}
     */
    static DHCP_ATTRIB_TYPE_BOOL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DHCP_ATTRIB_TYPE_ULONG => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DHCP_ENDPOINT_FLAG_CANT_MODIFY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static QUARANTIN_OPTION_BASE => 43220

    /**
     * @type {Integer (UInt32)}
     */
    static QUARANTINE_SCOPE_QUARPROFILE_OPTION => 43221

    /**
     * @type {Integer (UInt32)}
     */
    static QUARANTINE_CONFIG_OPTION => 43222

    /**
     * @type {Integer (UInt32)}
     */
    static ADDRESS_TYPE_IANA => 0

    /**
     * @type {Integer (UInt32)}
     */
    static ADDRESS_TYPE_IATA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DHCP_MIN_DELAY => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DHCP_MAX_DELAY => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DHCP_FAILOVER_DELETE_SCOPES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DHCP_FAILOVER_MAX_NUM_ADD_SCOPES => 400

    /**
     * @type {Integer (UInt32)}
     */
    static DHCP_FAILOVER_MAX_NUM_REL => 31

    /**
     * @type {Integer (UInt32)}
     */
    static MCLT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SAFEPERIOD => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CHANGESTATE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PERCENTAGE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MODE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static PREVSTATE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SHAREDSECRET => 64

    /**
     * @type {String}
     */
    static DHCP_CALLOUT_LIST_KEY => "System\CurrentControlSet\Services\DHCPServer\Parameters"

    /**
     * @type {String}
     */
    static DHCP_CALLOUT_LIST_VALUE => "CalloutDlls"

    /**
     * @type {String}
     */
    static DHCP_CALLOUT_ENTRY_POINT => "DhcpServerCalloutEntry"

    /**
     * @type {Integer (UInt32)}
     */
    static DHCP_CONTROL_START => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DHCP_CONTROL_STOP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DHCP_CONTROL_PAUSE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DHCP_CONTROL_CONTINUE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DHCP_DROP_DUPLICATE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DHCP_DROP_NOMEM => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DHCP_DROP_INTERNAL_ERROR => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DHCP_DROP_TIMEOUT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DHCP_DROP_UNAUTH => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DHCP_DROP_PAUSED => 6

    /**
     * @type {Integer (UInt32)}
     */
    static DHCP_DROP_NO_SUBNETS => 7

    /**
     * @type {Integer (UInt32)}
     */
    static DHCP_DROP_INVALID => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DHCP_DROP_WRONG_SERVER => 9

    /**
     * @type {Integer (UInt32)}
     */
    static DHCP_DROP_NOADDRESS => 10

    /**
     * @type {Integer (UInt32)}
     */
    static DHCP_DROP_PROCESSED => 11

    /**
     * @type {Integer (UInt32)}
     */
    static DHCP_DROP_GEN_FAILURE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DHCP_SEND_PACKET => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static DHCP_PROB_CONFLICT => 536870913

    /**
     * @type {Integer (UInt32)}
     */
    static DHCP_PROB_DECLINE => 536870914

    /**
     * @type {Integer (UInt32)}
     */
    static DHCP_PROB_RELEASE => 536870915

    /**
     * @type {Integer (UInt32)}
     */
    static DHCP_PROB_NACKED => 536870916

    /**
     * @type {Integer (UInt32)}
     */
    static DHCP_GIVE_ADDRESS_NEW => 805306369

    /**
     * @type {Integer (UInt32)}
     */
    static DHCP_GIVE_ADDRESS_OLD => 805306370

    /**
     * @type {Integer (UInt32)}
     */
    static DHCP_CLIENT_BOOTP => 805306371

    /**
     * @type {Integer (UInt32)}
     */
    static DHCP_CLIENT_DHCP => 805306372

    /**
     * @type {Integer (UInt32)}
     */
    static DHCPV6_OPTION_CLIENTID => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DHCPV6_OPTION_SERVERID => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DHCPV6_OPTION_IA_NA => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DHCPV6_OPTION_IA_TA => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DHCPV6_OPTION_ORO => 6

    /**
     * @type {Integer (UInt32)}
     */
    static DHCPV6_OPTION_PREFERENCE => 7

    /**
     * @type {Integer (UInt32)}
     */
    static DHCPV6_OPTION_UNICAST => 12

    /**
     * @type {Integer (UInt32)}
     */
    static DHCPV6_OPTION_RAPID_COMMIT => 14

    /**
     * @type {Integer (UInt32)}
     */
    static DHCPV6_OPTION_USER_CLASS => 15

    /**
     * @type {Integer (UInt32)}
     */
    static DHCPV6_OPTION_VENDOR_CLASS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DHCPV6_OPTION_VENDOR_OPTS => 17

    /**
     * @type {Integer (UInt32)}
     */
    static DHCPV6_OPTION_RECONF_MSG => 19

    /**
     * @type {Integer (UInt32)}
     */
    static DHCPV6_OPTION_SIP_SERVERS_NAMES => 21

    /**
     * @type {Integer (UInt32)}
     */
    static DHCPV6_OPTION_SIP_SERVERS_ADDRS => 22

    /**
     * @type {Integer (UInt32)}
     */
    static DHCPV6_OPTION_DNS_SERVERS => 23

    /**
     * @type {Integer (UInt32)}
     */
    static DHCPV6_OPTION_DOMAIN_LIST => 24

    /**
     * @type {Integer (UInt32)}
     */
    static DHCPV6_OPTION_IA_PD => 25

    /**
     * @type {Integer (UInt32)}
     */
    static DHCPV6_OPTION_NIS_SERVERS => 27

    /**
     * @type {Integer (UInt32)}
     */
    static DHCPV6_OPTION_NISP_SERVERS => 28

    /**
     * @type {Integer (UInt32)}
     */
    static DHCPV6_OPTION_NIS_DOMAIN_NAME => 29

    /**
     * @type {Integer (UInt32)}
     */
    static DHCPV6_OPTION_NISP_DOMAIN_NAME => 30

    /**
     * @type {Integer (UInt32)}
     */
    static DHCPV6_OPTION_DNR => 144
;@endregion Constants

;@region Methods
    /**
     * The Dhcpv6CApiInitialize function must be the first function call made by users of DHCPv6.
     * @param {Pointer<UInt32>} Version Pointer to the DHCPv6 version implemented by the client.  If a valid pointer is passed, the DHCPv6 client will be returned through it.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//dhcpv6csdk/nf-dhcpv6csdk-dhcpv6capiinitialize
     * @since windows6.0.6000
     */
    static Dhcpv6CApiInitialize(Version) {
        DllCall("dhcpcsvc6.dll\Dhcpv6CApiInitialize", "uint*", Version)
    }

    /**
     * The Dhcpv6CApiCleanup function enables DHCPv6 to properly clean up resources allocated throughout the use of DHCPv6 function calls. The Dhcpv6CApiCleanup function must only be called if a previous call to Dhcpv6CApiInitialize executed successfully.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//dhcpv6csdk/nf-dhcpv6csdk-dhcpv6capicleanup
     * @since windows6.0.6000
     */
    static Dhcpv6CApiCleanup() {
        DllCall("dhcpcsvc6.dll\Dhcpv6CApiCleanup")
    }

    /**
     * Requests options from the DHCPv6 client cache or directly from the DHCPv6 server.
     * @param {BOOL} forceNewInform If this value is set to <b>TRUE</b>, any available cached information will be ignored and new information will be requested.  Otherwise, the request is only sent if there is no cached information.
     * @param {Pointer<Void>} reserved Reserved for future use.  Must be set to <b>NULL</b>.
     * @param {PWSTR} adapterName GUID of the adapter for which this request is meant.  This parameter must not be <b>NULL</b>.
     * @param {Pointer<DHCPV6CAPI_CLASSID>} classId Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpv6csdk/ns-dhcpv6csdk-dhcpv6capi_classid">DHCPV6CAPI_CLASSID</a> structure that contains the binary ClassId information to use to send on the wire. This parameter is optional.
     * @param {DHCPV6CAPI_PARAMS_ARRAY} recdParams A <a href="https://docs.microsoft.com/windows/desktop/api/dhcpv6csdk/ns-dhcpv6csdk-dhcpv6capi_params_array">DHCPV6CAPI_PARAMS_ARRAY</a> structure that contains the parameters to be received from the DHCPV6 server.
     * @param {Pointer<Byte>} buffer A buffer to contain information returned by some pointers in <i>recdParams</i>.
     * @param {Pointer<UInt32>} pSize Size of the buffer.  When the function returns ERROR_MORE_DATA, this parameter will contain the size, in bytes, required to complete the operation.  If the function is successful, this parameter contains the number of bytes used.
     * @returns {Integer} Returns ERROR_SUCCESS upon successful completion.
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
     * Returned if one of the following conditions are true:
     * 
     * <ul>
     * <li><i>reserved</i> has a value that is not <b>NULL</b>.</li>
     * <li><i>AdapterName</i> is <b>NULL</b>. Or no adapter is found with the GUID specified. </li>
     * <li><i>pSize</i> is <b>NULL</b>.</li>
     * <li><i>buffer</i> is <b>NULL</b>.</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call to this API was made with insufficient memory allocated for the <i>Buffer</i> parameter, while <i>pSize</i> contains the actual memory size required.
     * 
     * </td>
     * </tr>
     * 
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>AdapterName</i> is not in the correct format. It should be in this format: {00000000-0000-0000-0000-000000000000}.
     * 
     * </td>
     * </tr>
     * 
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpv6csdk/nf-dhcpv6csdk-dhcpv6requestparams
     * @since windows6.0.6000
     */
    static Dhcpv6RequestParams(forceNewInform, reserved, adapterName, classId, recdParams, buffer, pSize) {
        adapterName := adapterName is String ? StrPtr(adapterName) : adapterName

        result := DllCall("dhcpcsvc6.dll\Dhcpv6RequestParams", "ptr", forceNewInform, "ptr", reserved, "ptr", adapterName, "ptr", classId, "ptr", recdParams, "char*", buffer, "uint*", pSize, "uint")
        return result
    }

    /**
     * Requests a specific prefix.
     * @param {PWSTR} adapterName GUID of the adapter on which the prefix request must be sent.
     * @param {Pointer<DHCPV6CAPI_CLASSID>} pclassId Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpv6csdk/ns-dhcpv6csdk-dhcpv6capi_classid">DHCPV6CAPI_CLASSID</a> structure that contains the binary ClassId information to  send on the wire. This parameter is optional.
     * 
     * <div class="alert"><b>Note</b>  DHCPv6 Option Code 15 (0x000F) is not supported by this API. Typically, the User Class option is used by a client to identify the type or category of user or application it represents. A server selects the configuration information for the client based on the classes identified in this option.</div>
     * <div> </div>
     * @param {Pointer<DHCPV6PrefixLeaseInformation>} prefixleaseInfo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpv6csdk/ns-dhcpv6csdk-dhcpv6prefixleaseinformation">DHCPV6PrefixLeaseInformation</a> structure that contains the prefix lease information.
     * 
     * The following members of the <a href="https://docs.microsoft.com/windows/desktop/api/dhcpv6csdk/ns-dhcpv6csdk-dhcpv6prefixleaseinformation">DHCPV6PrefixLeaseInformation</a> structure must follow these guidelines.
     * 
     * <table>
     * <tr>
     * <th>
     * <a href="https://docs.microsoft.com/windows/desktop/api/dhcpv6csdk/ns-dhcpv6csdk-dhcpv6prefixleaseinformation">DHCPV6PrefixLeaseInformation</a> member</th>
     * <th>Consideration</th>
     * </tr>
     * <tr>
     * <td><b>nPrefixes</b></td>
     * <td>Must contain a maximum value of 10. The caller should have the memory allocated in the   <b>prefixArray</b> member based on the number of prefixes specified.
     *  </td>
     * </tr>
     * <tr>
     * <td><b>iaid</b></td>
     * <td>A unique positive number assigned to this member. This same value should be reused if this function is called again.This mandatory value must be set by the calling application.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td><b>ServerIdLen</b></td>
     * <td>Must contain a maximum value of 128. The caller must have the memory allocated in the <b>ServerId</b> member based on the specified <b>ServerIdLen</b> value.</td>
     * </tr>
     * </table>
     *  
     * 
     * The caller must follow these considerations when assigning the values of the <b>nPrefixes</b>,  <b>iaid</b>, and <b>ServerIdLen</b> members of the <a href="https://docs.microsoft.com/windows/desktop/api/dhcpv6csdk/ns-dhcpv6csdk-dhcpv6prefixleaseinformation">DHCPV6PrefixLeaseInformation</a> structure.  Based on these values, memory must also be  properly allocated to the <b>ServerId</b> and <b>PrefixArray</b> members before the <b>Dhcpv6RequestPrefix</b> function is called.
     * @param {Pointer<UInt32>} pdwTimeToWait Contains the number of seconds a requesting application needs to wait before calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dhcpv6csdk/nf-dhcpv6csdk-dhcpv6renewprefix">Dhcpv6RenewPrefix</a> function to renew its acquired prefixes.  A value of 0xFFFFFFFF indicates that the application does not need to renew its lease.
     * @returns {Integer} Returns ERROR_SUCCESS upon successful completion.
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
     * The value of the <b>nPrefixes</b> or the <b>ServerIdLen</b> member specified is less than the number of prefixes available from the server or the available server ID length. Increase the <b>nPrefixes</b> or the <b>ServerIdLen</b> member  and make sure the corresponding memory has been allocated properly before calling the <a href="/previous-versions/windows/desktop/api/dhcpv6csdk/nf-dhcpv6csdk-dhcpv6requestprefix">Dhcpv6RequestPrefix</a> function again.
     * 
     * 
     * </td>
     * </tr>
     * 
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returned if one of the following conditions are true:
     * 
     * <ul>
     * <li><i>AdapterName</i> is <b>NULL</b>. Or no adapter is found with the GUID specified. </li>
     * <li><i>prefixleaseInfo</i> is <b>NULL</b>.</li>
     * <li><i>pdwTimeToWait</i> is <b>NULL</b>.</li>
     * <li>The <b>iaid</b> member of the <i>prefixleaseInfo</i> is zero.</li>
     * </ul>
     * </td>
     * </tr>
     * 
     * 
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>AdapterName</i> is not in the correct format. It should be in this format: {00000000-0000-0000-0000-000000000000}.
     * 
     * </td>
     * </tr>
     * 
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpv6csdk/nf-dhcpv6csdk-dhcpv6requestprefix
     * @since windows6.0.6000
     */
    static Dhcpv6RequestPrefix(adapterName, pclassId, prefixleaseInfo, pdwTimeToWait) {
        adapterName := adapterName is String ? StrPtr(adapterName) : adapterName

        result := DllCall("dhcpcsvc6.dll\Dhcpv6RequestPrefix", "ptr", adapterName, "ptr", pclassId, "ptr", prefixleaseInfo, "uint*", pdwTimeToWait, "uint")
        return result
    }

    /**
     * Renews a prefix.
     * @param {PWSTR} adapterName GUID of the adapter on which the prefix renewal must be sent.
     * @param {Pointer<DHCPV6CAPI_CLASSID>} pclassId Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpv6csdk/ns-dhcpv6csdk-dhcpv6capi_classid">DHCPV6CAPI_CLASSID</a> structure that contains the binary ClassId information to send on the wire. This parameter is can be <b>NULL</b>.
     * 
     * <div class="alert"><b>Note</b>  DHCPv6 Option Code 15 (0x000F) is not supported by this API. Typically, the User Class option is used by a client to identify the type or category of user or application it represents. A server selects the configuration information for the client based on the classes identified in this option.</div>
     * <div> </div>
     * @param {Pointer<DHCPV6PrefixLeaseInformation>} prefixleaseInfo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpv6csdk/ns-dhcpv6csdk-dhcpv6prefixleaseinformation">DHCPV6PrefixLeaseInformation</a> structure that contains the prefix lease information.
     * @param {Pointer<UInt32>} pdwTimeToWait Contains the number of seconds a requesting application needs to wait before calling the <b>Dhcpv6RenewPrefix</b> function to renew its acquired prefixes.  A value of 0xFFFFFFFF indicates that the application does not need to renew its lease.
     * @param {Integer} bValidatePrefix Specifies  to the DHCPv6 client whether or not to send a REBIND in order to validate the prefix bindings.  <b>TRUE</b> indicates that a REBIND is required.  <b>FALSE</b> indicates RENEW is required.
     * @returns {Integer} Returns ERROR_SUCCESS upon successful completion.
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
     * Returned if one of the following conditions are true:
     * 
     * <ul>
     * <li><i>AdapterName</i> is <b>NULL</b>. Or no adapter is found with the GUID specified. </li>
     * <li><i>prefixleaseInfo</i> is <b>NULL</b>.</li>
     * <li><i>pdwTimeToWait</i> is <b>NULL</b>.</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returned if the API responds with more prefixes than there is memory allocated.
     * 
     * </td>
     * </tr>
     * 
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>AdapterName</i> is not in the correct format. It should be in this format: {00000000-0000-0000-0000-000000000000}.
     * 
     * </td>
     * </tr>
     * 
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpv6csdk/nf-dhcpv6csdk-dhcpv6renewprefix
     * @since windows6.0.6000
     */
    static Dhcpv6RenewPrefix(adapterName, pclassId, prefixleaseInfo, pdwTimeToWait, bValidatePrefix) {
        adapterName := adapterName is String ? StrPtr(adapterName) : adapterName

        result := DllCall("dhcpcsvc6.dll\Dhcpv6RenewPrefix", "ptr", adapterName, "ptr", pclassId, "ptr", prefixleaseInfo, "uint*", pdwTimeToWait, "uint", bValidatePrefix, "uint")
        return result
    }

    /**
     * Releases a prefix.
     * @param {PWSTR} adapterName Name of the adapter on which the PD request must be sent.
     * @param {Pointer<DHCPV6CAPI_CLASSID>} classId Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpv6csdk/ns-dhcpv6csdk-dhcpv6capi_classid">DHCPV6CAPI_CLASSID</a> structure that contains the binary ClassId information to use to send on the wire.
     * 
     * <div class="alert"><b>Note</b>   DHCPv6 Option Code 15 (0x000F) is not supported by this API. Typically, the User Class option is used by a client to identify the type or category of user or application it represents. A server selects the configuration information for the client based on the classes identified in this option.</div>
     * <div> </div>
     * @param {Pointer<DHCPV6PrefixLeaseInformation>} leaseInfo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpv6csdk/ns-dhcpv6csdk-dhcpv6prefixleaseinformation">DHCPV6CAPIPrefixLeaseInformation</a> structure that is used to release the prefix.
     * @returns {Integer} Returns ERROR_SUCCESS upon successful completion.
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
     * Returned if one of the following conditions are true:
     * 
     * <ul>
     * <li><i>AdapterName</i> is <b>NULL</b>. Or no adapter is found with the GUID specified.</li>
     * <li><i>prefixleaseInfo</i> is <b>NULL</b>.</li>
     * </ul>
     * </td>
     * </tr>
     * 
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>AdapterName</i> is not in the correct format. It should be in this format: {00000000-0000-0000-0000-000000000000}.
     * 
     * </td>
     * </tr>
     * 
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpv6csdk/nf-dhcpv6csdk-dhcpv6releaseprefix
     * @since windows6.0.6000
     */
    static Dhcpv6ReleasePrefix(adapterName, classId, leaseInfo) {
        adapterName := adapterName is String ? StrPtr(adapterName) : adapterName

        result := DllCall("dhcpcsvc6.dll\Dhcpv6ReleasePrefix", "ptr", adapterName, "ptr", classId, "ptr", leaseInfo, "uint")
        return result
    }

    /**
     * The DhcpCApiInitialize function must be the first function call made by users of DHCP; it prepares the system for all other DHCP function calls. Other DHCP functions should only be called if the DhcpCApiInitialize function executes successfully.
     * @param {Pointer<UInt32>} Version Pointer to the DHCP version implemented by the client.
     * @returns {Integer} Returns ERROR_SUCCESS upon successful completion.
     * @see https://docs.microsoft.com/windows/win32/api//dhcpcsdk/nf-dhcpcsdk-dhcpcapiinitialize
     * @since windows5.0
     */
    static DhcpCApiInitialize(Version) {
        result := DllCall("dhcpcsvc.dll\DhcpCApiInitialize", "uint*", Version, "uint")
        return result
    }

    /**
     * The DhcpCApiCleanup function enables DHCP to properly clean up resources allocated throughout the use of DHCP function calls. The DhcpCApiCleanup function must only be called if a previous call to DhcpCApiInitialize executed successfully.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//dhcpcsdk/nf-dhcpcsdk-dhcpcapicleanup
     * @since windows5.0
     */
    static DhcpCApiCleanup() {
        DllCall("dhcpcsvc.dll\DhcpCApiCleanup")
    }

    /**
     * The DhcpRequestParams function enables callers to synchronously, or synchronously and persistently obtain DHCP data from a DHCP server.
     * @param {Integer} Flags Flags that specify the data being requested. This parameter is optional. The following possible values are supported and are not mutually exclusive:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DHCPCAPI_REQUEST_PERSISTENT"></a><a id="dhcpcapi_request_persistent"></a><dl>
     * <dt><b>DHCPCAPI_REQUEST_PERSISTENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The request is persisted but no options are fetched.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DHCPCAPI_REQUEST_SYNCHRONOUS"></a><a id="dhcpcapi_request_synchronous"></a><dl>
     * <dt><b>DHCPCAPI_REQUEST_SYNCHRONOUS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Options will be fetched from the server.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Void>} Reserved Reserved for future use. Must be set to <b>NULL</b>.
     * @param {PWSTR} AdapterName GUID of the adapter on which requested data is being made. Must be under 256 characters.
     * @param {Pointer<DHCPCAPI_CLASSID>} ClassId Class identifier (ID) that should be used if DHCP INFORM messages are being transmitted onto the network. This parameter is optional.
     * @param {DHCPCAPI_PARAMS_ARRAY} SendParams Optional data to be requested, in addition to the data requested in the <i>RecdParams</i> array. The <i>SendParams</i> parameter cannot contain any of the standard options that the DHCP client sends by default.
     * @param {DHCPCAPI_PARAMS_ARRAY} RecdParams Array of DHCP data the caller is interested in receiving. This array must be empty prior to the 
     * <b>DhcpRequestParams</b> function call.
     * @param {Pointer} Buffer Buffer used for storing the data associated with requests made in <i>RecdParams</i>.
     * @param {Pointer<UInt32>} pSize Size of <i>Buffer</i>. 
     * 
     * 
     * 
     * 
     * Required size of the buffer, if it is insufficiently sized to hold the data, otherwise indicates size of the buffer which was successfully filled.
     * @param {PWSTR} RequestIdStr Application identifier (ID) used to facilitate a persistent request. Must be a printable string with no special characters (commas, backslashes, colons, or other illegal characters may not be used). The specified application identifier (ID) is used in a subsequent 
     * <b>DhcpUndoRequestParams</b> function call to clear the persistent request, as necessary.
     * @returns {Integer} Returns ERROR_SUCCESS upon successful completion.
     * 
     * Upon return, <i>RecdParams</i> is filled with pointers to requested data, with corresponding data placed in <i>Buffer</i>. If <i>pSize</i> indicates that <i>Buffer</i> has insufficient space to store returned data, the 
     * <b>DhcpRequestParams</b> function returns ERROR_MORE_DATA, and returns the required buffer size in <i>pSize</i>. Note that the required size of <i>Buffer</i> may increase during the time that elapses between the initial function call's return and a subsequent call; therefore, the required size of <i>Buffer</i> (indicated in <i>pSize</i>) provides an indication of the approximate size required of <i>Buffer</i>, rather than guaranteeing that subsequent calls will return successfully if <i>Buffer</i> is set to the size indicated in <i>pSize</i>.
     * 
     * Other errors return appropriate Windows error codes.
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
     * Returned if the AdapterName parameter is over 256 characters long.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BUFFER_OVERFLOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returned if the AdapterName parameter is over 256 characters long.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpcsdk/nf-dhcpcsdk-dhcprequestparams
     * @since windows5.0
     */
    static DhcpRequestParams(Flags, Reserved, AdapterName, ClassId, SendParams, RecdParams, Buffer, pSize, RequestIdStr) {
        AdapterName := AdapterName is String ? StrPtr(AdapterName) : AdapterName
        RequestIdStr := RequestIdStr is String ? StrPtr(RequestIdStr) : RequestIdStr

        result := DllCall("dhcpcsvc.dll\DhcpRequestParams", "uint", Flags, "ptr", Reserved, "ptr", AdapterName, "ptr", ClassId, "ptr", SendParams, "ptr", RecdParams, "ptr", Buffer, "uint*", pSize, "ptr", RequestIdStr, "uint")
        return result
    }

    /**
     * The DhcpUndoRequestParams function removes persistent requests previously made with a DhcpRequestParams function call.
     * @param {PWSTR} AdapterName GUID of the adapter for which information is no longer required.  Must be under 256 characters.
     * 
     * <div class="alert"><b>Note</b>  This parameter is no longer used.</div>
     * <div> </div>
     * @param {PWSTR} RequestIdStr Application identifier (ID) originally used to make a persistent request. This string must match the <i>RequestIdStr</i> parameter used in the 
     * <b>DhcpRequestParams</b> function call that obtained the corresponding persistent request. Note that this must match the previous application identifier (ID) used, and must be a printable string with no special characters (commas, backslashes, colons, or other illegal characters may not be used).
     * @returns {Integer} Returns ERROR_SUCCESS upon successful completion. Otherwise, returns a Windows error code.
     * @see https://docs.microsoft.com/windows/win32/api//dhcpcsdk/nf-dhcpcsdk-dhcpundorequestparams
     * @since windows5.0
     */
    static DhcpUndoRequestParams(AdapterName, RequestIdStr) {
        static Flags := 0, Reserved := 0 ;Reserved parameters must always be NULL

        AdapterName := AdapterName is String ? StrPtr(AdapterName) : AdapterName
        RequestIdStr := RequestIdStr is String ? StrPtr(RequestIdStr) : RequestIdStr

        result := DllCall("dhcpcsvc.dll\DhcpUndoRequestParams", "uint", Flags, "ptr", Reserved, "ptr", AdapterName, "ptr", RequestIdStr, "uint")
        return result
    }

    /**
     * The DhcpRegisterParamChange function enables clients to register for notification of changes in DHCP configuration parameters.
     * @param {Integer} Flags Reserved. Must be set to DHCPCAPI_REGISTER_HANDLE_EVENT. If it is not set to this flag value, the API call will not be successful.
     * @param {PWSTR} AdapterName GUID of the adapter for which event notification is being requested.  Must be under 256 characters.
     * @param {Pointer<DHCPCAPI_CLASSID>} ClassId Reserved. Must be set to <b>NULL</b>.
     * @param {DHCPCAPI_PARAMS_ARRAY} Params Parameters for which the client is interested in registering for notification, in the form of a <a href="https://docs.microsoft.com/windows/win32/api/dhcpcsdk/ns-dhcpcsdk-dhcpcapi_params_array">DHCPCAPI_PARAMS_ARRAY</a> structure.
     * @param {Pointer<Void>} Handle Attributes of <i>Handle</i> are determined by the value of <i>Flags</i>. In version 2 of the DHCP API, <i>Flags</i> must be set to DHCPCAPI_REGISTER_HANDLE_EVENT, and therefore, <i>Handle</i> must be a pointer to a <b>HANDLE</b> variable that will hold the handle to a Windows event that gets signaled when parameters specified in <i>Params</i> change. Note that this <b>HANDLE</b> variable is used in a subsequent call to the 
     * <b>DhcpDeRegisterParamChange</b> function to deregister event notifications associated with this particular call to the 
     * <b>DhcpRegisterParamChange</b> function.
     * @returns {Integer} Returns ERROR_SUCCESS upon successful completion. Otherwise, returns Windows error codes.
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
     * Returned if the AdapterName parameter is over 256 characters long.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpcsdk/nf-dhcpcsdk-dhcpregisterparamchange
     * @since windows5.0
     */
    static DhcpRegisterParamChange(Flags, AdapterName, ClassId, Params, Handle) {
        static Reserved := 0 ;Reserved parameters must always be NULL

        AdapterName := AdapterName is String ? StrPtr(AdapterName) : AdapterName

        result := DllCall("dhcpcsvc.dll\DhcpRegisterParamChange", "uint", Flags, "ptr", Reserved, "ptr", AdapterName, "ptr", ClassId, "ptr", Params, "ptr", Handle, "uint")
        return result
    }

    /**
     * The DhcpDeRegisterParamChange function releases resources associated with previously registered event notifications, and closes the associated event handle.
     * @param {Integer} Flags Reserved. Must be set to zero.
     * @param {Pointer<Void>} Reserved Reserved. Must be set to <b>NULL</b>.
     * @param {Pointer<Void>} Event Must be the same value as the <b>HANDLE</b> variable in the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dhcpcsdk/nf-dhcpcsdk-dhcpregisterparamchange">DhcpRegisterParamChange</a> function call for which the client is deregistering event notification.
     * @returns {Integer} Returns ERROR_SUCCESS upon successful completion. Otherwise, returns Windows error codes.
     * @see https://docs.microsoft.com/windows/win32/api//dhcpcsdk/nf-dhcpcsdk-dhcpderegisterparamchange
     * @since windows5.0
     */
    static DhcpDeRegisterParamChange(Flags, Reserved, Event) {
        result := DllCall("dhcpcsvc.dll\DhcpDeRegisterParamChange", "uint", Flags, "ptr", Reserved, "ptr", Event, "uint")
        return result
    }

    /**
     * The DhcpRemoveDNSRegistrations function removes all DHCP-initiated DNS registrations for the client.
     * @returns {Integer} Returns ERROR_SUCCESS upon successful completion.
     * @see https://docs.microsoft.com/windows/win32/api//dhcpcsdk/nf-dhcpcsdk-dhcpremovednsregistrations
     * @since windows5.0
     */
    static DhcpRemoveDNSRegistrations() {
        result := DllCall("dhcpcsvc.dll\DhcpRemoveDNSRegistrations", "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} sAdapterName 
     * @param {Pointer<UInt32>} dwSubnetMask 
     * @returns {Integer} 
     */
    static DhcpGetOriginalSubnetMask(sAdapterName, dwSubnetMask) {
        sAdapterName := sAdapterName is String ? StrPtr(sAdapterName) : sAdapterName

        result := DllCall("dhcpcsvc.dll\DhcpGetOriginalSubnetMask", "ptr", sAdapterName, "uint*", dwSubnetMask, "uint")
        return result
    }

    /**
     * Adds a link-layer address or address pattern to the allow/deny lists.
     * @param {PWSTR} ServerIpAddress Pointer to a Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Pointer<DHCP_FILTER_ADD_INFO>} AddFilterInfo Pointer to a <a href="https://docs.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_filter_add_info">DHCP_FILTER_ADD_INFO</a> structure that contains a link-layer address or address pattern to add to the DHCP server's allow/deny list.
     * @param {BOOL} ForceFlag If <b>TRUE</b>, any existing matching filter is overwritten; if <b>FALSE</b>, the call fails with <b>ERROR_DHCP_LINKLAYER_ADDRESS_EXISTS</b>.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
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
     * This call was performed by a client who is not a member of the "DHCP Administrators" security group.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_JET_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred while accessing the DHCP server's database.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_LINKLAYER_ADDRESS_EXISTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The address or address pattern already exists in an allow/deny list.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpaddfilterv4
     * @since windowsserver2008
     */
    static DhcpAddFilterV4(ServerIpAddress, AddFilterInfo, ForceFlag) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpAddFilterV4", "ptr", ServerIpAddress, "ptr", AddFilterInfo, "ptr", ForceFlag, "uint")
        return result
    }

    /**
     * Deletes a link-layer address or address pattern from a DHCP server's allow/deny lists.
     * @param {PWSTR} ServerIpAddress Pointer to a Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Pointer<DHCP_ADDR_PATTERN>} DeleteFilterInfo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_addr_pattern">DHCP_ADDR_PATTERN</a> structure that contains the link-layer address or address pattern filter to remove from the DHCP server database.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
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
     * This call was performed by a client who is not a member of the "DHCP Administrators" security group.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_JET_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred while accessing the DHCP server's database.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_LINKLAYER_ADDRESS_DOES_NOT_EXIST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The address or address pattern does not exist in an allow/deny list.
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
     * The address or address pattern supplied in <i>DeleteFilterInfo</i> is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpdeletefilterv4
     * @since windowsserver2008
     */
    static DhcpDeleteFilterV4(ServerIpAddress, DeleteFilterInfo) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpDeleteFilterV4", "ptr", ServerIpAddress, "ptr", DeleteFilterInfo, "uint")
        return result
    }

    /**
     * Enables or disables the allow and deny lists on a DHCP server.
     * @param {PWSTR} ServerIpAddress Pointer to a Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Pointer<DHCP_FILTER_GLOBAL_INFO>} GlobalFilterInfo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_filter_global_info">DHCP_FILTER_GLOBAL_INFO</a> structure that contains information used to enable or disable allow and deny lists.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
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
     * This call was performed by a client who is not a member of the "DHCP Administrators" security group.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_JET_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred while accessing the DHCP server's database.
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
     * One of the parameters provides an invalid value.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpsetfilterv4
     * @since windowsserver2008
     */
    static DhcpSetFilterV4(ServerIpAddress, GlobalFilterInfo) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpSetFilterV4", "ptr", ServerIpAddress, "ptr", GlobalFilterInfo, "uint")
        return result
    }

    /**
     * Retrieves the enable/disable settings for the DHCPv4 server's allow/deny lists.
     * @param {PWSTR} ServerIpAddress Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Pointer<DHCP_FILTER_GLOBAL_INFO>} GlobalFilterInfo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_filter_global_info">DHCP_FILTER_GLOBAL_INFO</a> structure that contains the enable/disable settings for the DHCPv6 server's allow/deny lists.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
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
     * This call was performed by a client who is not a member of the "DHCP Administrators" security group.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_JET_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred while accessing the DHCP server's database.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpgetfilterv4
     * @since windowsserver2008
     */
    static DhcpGetFilterV4(ServerIpAddress, GlobalFilterInfo) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpGetFilterV4", "ptr", ServerIpAddress, "ptr", GlobalFilterInfo, "uint")
        return result
    }

    /**
     * Enumerates all of the filter records from the DHCP server's allow or deny list.
     * @param {PWSTR} ServerIpAddress Pointer to a Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Pointer<DHCP_ADDR_PATTERN>} ResumeHandle Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_addr_pattern">DHCP_ADDR_PATTERN</a> structure that identifies the enumeration operation. Initially this parameter must be set to zero (0), with a successful call returning the address/pattern value used for subsequent enumeration requests.
     * @param {Integer} PreferredMaximum A DWORD value that specifies the preferred maximum number of bytes to return. If the number of remaining unenumerated filter information size is less than this value, then all the filters configured on the particular list on the DHCP server are returned. The maximum value for this is 64 (kilobytes), and the minimum value is 1 (kilobyte).
     * @param {Integer} ListType A <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ne-dhcpsapi-dhcp_filter_list_type">DHCP_FILTER_LIST_TYPE</a> that specifies the list of filters to be enumerated.
     * @param {Pointer<DHCP_FILTER_ENUM_INFO>} EnumFilterInfo Pointer to the address of an array of <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_filter_enum_info">DHCP_FILTER_ENUM_INFO</a> structures that contain the returned link-layer filter information configured on the DHCP server.
     * @param {Pointer<UInt32>} ElementsRead Pointer to a <b>DWORD</b> value that specifies the number of link-layer filter entries returned in <i>EnumFilterInfo</i>.
     * @param {Pointer<UInt32>} ElementsTotal Pointer to a <b>DWORD</b> value that specifies the number of link-layer filter entries defined on the DHCP server that have not yet been enumerated.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
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
     * This call was performed by a client who is not a member of the "DHCP Administrators" security group.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_JET_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred while accessing the DHCP server's database.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are no more elements available for enumeration.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are no more elements left to enumerate.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpenumfilterv4
     * @since windowsserver2008
     */
    static DhcpEnumFilterV4(ServerIpAddress, ResumeHandle, PreferredMaximum, ListType, EnumFilterInfo, ElementsRead, ElementsTotal) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpEnumFilterV4", "ptr", ServerIpAddress, "ptr", ResumeHandle, "uint", PreferredMaximum, "int", ListType, "ptr", EnumFilterInfo, "uint*", ElementsRead, "uint*", ElementsTotal, "uint")
        return result
    }

    /**
     * The DhcpCreateSubnet function creates a new subnet on the DHCP server.
     * @param {PWSTR} ServerIpAddress Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Integer} SubnetAddress <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_ADDRESS</a> value that contains the IP address of the subnet's gateway.
     * @param {Pointer<DHCP_SUBNET_INFO>} SubnetInfo <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_subnet_info">DHCP_SUBNET_INFO</a> structure that contains specific settings for the subnet, including the subnet mask and IP address of the  subnet gateway.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpcreatesubnet
     * @since windowsserver2000
     */
    static DhcpCreateSubnet(ServerIpAddress, SubnetAddress, SubnetInfo) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpCreateSubnet", "ptr", ServerIpAddress, "uint", SubnetAddress, "ptr", SubnetInfo, "uint")
        return result
    }

    /**
     * The DhcpSetSubnetInfo function sets information about a subnet defined on the DHCP server.
     * @param {PWSTR} ServerIpAddress Pointer to a Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Integer} SubnetAddress <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_ADDRESS</a> value that specifies the IP address of the subnet gateway, as well as uniquely identifies the subnet.
     * @param {Pointer<DHCP_SUBNET_INFO>} SubnetInfo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_subnet_info">DHCP_SUBNET_INFO</a> structure that contains the information about the subnet.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpsetsubnetinfo
     * @since windowsserver2000
     */
    static DhcpSetSubnetInfo(ServerIpAddress, SubnetAddress, SubnetInfo) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpSetSubnetInfo", "ptr", ServerIpAddress, "uint", SubnetAddress, "ptr", SubnetInfo, "uint")
        return result
    }

    /**
     * The DhcpGetSubnetInfo function returns information on a specific subnet.
     * @param {PWSTR} ServerIpAddress Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Integer} SubnetAddress <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_ADDRESS</a> value that specifies the subnet ID.
     * @param {Pointer<DHCP_SUBNET_INFO>} SubnetInfo <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_subnet_info">DHCP_SUBNET_INFO</a> structure that contains the returned information for the subnet matching the ID specified by <i>SubnetAddress</i>.
     * 
     * <div class="alert"><b>Note</b>  <p class="note">The memory for this parameter must be free using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dhcpsapi/nf-dhcpsapi-dhcprpcfreememory">DhcpRpcFreeMemory</a>.
     * 
     * </div>
     * <div> </div>
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpgetsubnetinfo
     * @since windowsserver2000
     */
    static DhcpGetSubnetInfo(ServerIpAddress, SubnetAddress, SubnetInfo) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpGetSubnetInfo", "ptr", ServerIpAddress, "uint", SubnetAddress, "ptr", SubnetInfo, "uint")
        return result
    }

    /**
     * The DhcpEnumSubnets function returns an enumerated list of subnets defined on the DHCP server.
     * @param {PWSTR} ServerIpAddress Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Pointer<UInt32>} ResumeHandle Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_RESUME_HANDLE</a> value that identifies the enumeration operation. Initially, this value should be zero, with a successful call returning the handle value used for subsequent enumeration requests. For example, if <i>PreferredMaximum</i> is set to 100, and 200 subnet addresses  are stored on the server, the resume handle can be used after the first 100 subnets are retrieved to obtain the next 100 on a subsequent call, and so forth.
     * @param {Integer} PreferredMaximum Specifies the preferred maximum number of subnet addresses to return. If the number of remaining unenumerated options is less than this value, then that amount will be returned.
     * @param {Pointer<DHCP_IP_ARRAY>} EnumInfo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_ip_array">DHCP_IP_ARRAY</a> structure that contains the subnet IDs available on the DHCP server. If no subnets are defined, this value will be null.
     * @param {Pointer<UInt32>} ElementsRead Pointer to a <b>DWORD</b> value that specifies the number of subnet addresses returned in <i>EnumInfo</i>.
     * @param {Pointer<UInt32>} ElementsTotal Pointer to a <b>DWORD</b> value that specifies the  number of subnets defined on the DHCP server that have not yet been enumerated.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. If a call is made with the same <i>ResumeHandle</i> value and all items on the server have been enumerated, this method returns <b>ERROR_NO_MORE_ITEMS</b> with <i>ElementsRead</i> and <i>ElementsTotal</i> set to 0. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpenumsubnets
     * @since windowsserver2000
     */
    static DhcpEnumSubnets(ServerIpAddress, ResumeHandle, PreferredMaximum, EnumInfo, ElementsRead, ElementsTotal) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpEnumSubnets", "ptr", ServerIpAddress, "uint*", ResumeHandle, "uint", PreferredMaximum, "ptr", EnumInfo, "uint*", ElementsRead, "uint*", ElementsTotal, "uint")
        return result
    }

    /**
     * Adds an element describing a feature or aspect of the subnet to the subnet entry in the DHCP database.
     * @param {PWSTR} ServerIpAddress Pointer to a Unicode string that contains the IPv4 address of the subnet DHCP server.
     * @param {Integer} SubnetAddress <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_ADDRESS</a> structure that contains the IPv4 address of the subnet.
     * @param {Pointer<DHCP_SUBNET_ELEMENT_DATA>} AddElementInfo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_subnet_element_data">DHCP_SUBNET_ELEMENT_DATA</a> structure that contains information about the subnet element corresponding to the IPv4 subnet specified in <i>SubnetAddress</i>.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_JET_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred while accessing the DHCP server database.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_SUBNET_NOT_PRESENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified IPv4 subnet does not exist.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_INVALID_RANGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified IPv4 address range either overlaps an existing range or is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_IPRANGE_CONV_ILLEGAL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Conversion of a scope to a DHCPv4-only scope or to a BOOTP-only scope is not allowed when DHCPv4 and BOOTP clients are present in the scope to convert. Manually delete either the DHCPv4 or the BOOTP clients from the scope, as appropriate for the type of scope being created.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_IPRANGE_EXISTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified IPv4 address range already exists.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_MSCOPE_RANGE_TOO_SMALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The multicast scope range must allow for at least 256 IPv4 addresses.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_NOT_RESERVED_CLIENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified DHCPv4 client is not an IPv4 reserverdclient.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_RESERVEDIP_EXISTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified IPv4 address or hardware address is in use by another DHCPv4 client.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_ADDRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified address is not available.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpaddsubnetelement
     * @since windowsserver2008
     */
    static DhcpAddSubnetElement(ServerIpAddress, SubnetAddress, AddElementInfo) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpAddSubnetElement", "ptr", ServerIpAddress, "uint", SubnetAddress, "ptr", AddElementInfo, "uint")
        return result
    }

    /**
     * Returns an enumerated list of elements for a specific DHCP subnet.
     * @param {PWSTR} ServerIpAddress Unicode string that specifies the IPv4 address of the DHCP server.
     * @param {Integer} SubnetAddress <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_ADDRESS</a> value that specifies the address of the IPv4 subnet whose elements will be enumerated.
     * @param {Integer} EnumElementType <a href="https://docs.microsoft.com/windows/win32/api/dhcpsapi/ne-dhcpsapi-dhcp_subnet_element_type">DHCP_SUBNET_ELEMENT_TYPE</a> enumeration value that indicates the type of subnet element to enumerate.
     * @param {Pointer<UInt32>} ResumeHandle Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_RESUME_HANDLE</a> value that identifies the enumeration operation. Initially, this value should be zero, with a successful call returning the handle value used for subsequent enumeration requests. For example, if <i>PreferredMaximum</i> is set to 1000 bytes, and 2000 bytes worth of subnet elements  are stored on the server, the resume handle can be used after the first 1000 bytes are retrieved to obtain the next 1000 on a subsequent call, and so forth.
     * 
     * The presence of additional enumerable data is indicated when this function returns ERROR_MORE_DATA. If no additional enumerable data is available on the DHCPv4 server, ERROR_NO_MORE_ITEMS is returned.
     * @param {Integer} PreferredMaximum Specifies the preferred maximum number of bytes of subnet elements to return. If the number of remaining unenumerated options (in bytes) is less than this value, then that amount will be returned.
     * 
     * To retrieve all the subnet client elements for the default user and vendor class at the specified level, set this parameter to 0xFFFFFFFF.
     * @param {Pointer<DHCP_SUBNET_ELEMENT_INFO_ARRAY>} EnumElementInfo Pointer to a pointer to a  <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_subnet_element_info_array">DHCP_SUBNET_ELEMENT_INFO_ARRAY</a> structure containing an enumerated list of all elements available for the specified subnet. If no elements are available for enumeration, this value will be null.
     * @param {Pointer<UInt32>} ElementsRead Pointer to a DWORD value that specifies the number of subnet elements returned in <i>EnumElementInfo</i>.
     * @param {Pointer<UInt32>} ElementsTotal Pointer to a DWORD value that specifies the total number of as-yet unenumerated elements remaining on the server for the specified subnet.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_JET_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred while accessing the DHCP server database.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are more elements available to enumerate.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are no more elements left to enumerate.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_SUBNET_NOT_PRESENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified IPv4 subnet does not exist on the DHCP server.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpenumsubnetelements
     * @since windowsserver2000
     */
    static DhcpEnumSubnetElements(ServerIpAddress, SubnetAddress, EnumElementType, ResumeHandle, PreferredMaximum, EnumElementInfo, ElementsRead, ElementsTotal) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpEnumSubnetElements", "ptr", ServerIpAddress, "uint", SubnetAddress, "int", EnumElementType, "uint*", ResumeHandle, "uint", PreferredMaximum, "ptr", EnumElementInfo, "uint*", ElementsRead, "uint*", ElementsTotal, "uint")
        return result
    }

    /**
     * Removes an IPv4 subnet element from an IPv4 subnet defined on the DHCPv4 server.
     * @param {PWSTR} ServerIpAddress Unicode string that specifies the IP address or hostname of the DHCPv4 server.
     * @param {Integer} SubnetAddress <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_ADDRESS</a> value that specifies the IPv4 address of the subnet gateway from which elements are to be removed.
     * @param {Pointer<DHCP_SUBNET_ELEMENT_DATA>} RemoveElementInfo <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_subnet_element_data">DHCP_SUBNET_ELEMENT_DATA</a> structure that contains information used to find the element that will be removed from subnet specified in <i>SubnetAddress</i>.
     * @param {Integer} ForceFlag <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ne-dhcpsapi-dhcp_force_flag">DHCP_FORCE_FLAG</a> enumeration value that indicates whether or not the clients affected by the removal of the subnet element should also be deleted.
     * 
     * <div class="alert"><b>Note</b>  If the flag is set to <b>DhcpNoForce</b> and this subnet has served an IPv4 address to DHCPv4/BOOTP clients, the IPv4 range is not deleted; conversely, if the flag is set to <b>DhcpFullForce</b>, the IPv4 range is deleted along with the DHCPv4 client lease record on the DHCPv4 server.</div>
     * <div> </div>
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_JET_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred while accessing the DHCP server database.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_SUBNET_NOT_PRESENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified IPv4 subnet is not defined on the DHCP server.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_RESERVED_CLIENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified DHCP client is a reserved client.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_INVALID_RANGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified IPv4 address range either overlaps an existing IPv4 address range, or is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_ELEMENT_CANT_REMOVE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one multicast IPv4 address has been leased out to a MADCAP client.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpremovesubnetelement
     * @since windowsserver2008
     */
    static DhcpRemoveSubnetElement(ServerIpAddress, SubnetAddress, RemoveElementInfo, ForceFlag) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpRemoveSubnetElement", "ptr", ServerIpAddress, "uint", SubnetAddress, "ptr", RemoveElementInfo, "int", ForceFlag, "uint")
        return result
    }

    /**
     * The DhcpDeleteSubnet function deletes a subnet from the DHCP server.
     * @param {PWSTR} ServerIpAddress Unicode string that specifies the IP address of the subnet to delete.
     * @param {Integer} SubnetAddress <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_ADDRESS</a> value that contains the IP address of the subnet gateway used to identify the subnet.
     * @param {Integer} ForceFlag <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ne-dhcpsapi-dhcp_force_flag">DHCP_FORCE_FLAG</a> enumeration value that indicates the type of delete operation to perform (full force, failover force, or no force).
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpdeletesubnet
     * @since windowsserver2000
     */
    static DhcpDeleteSubnet(ServerIpAddress, SubnetAddress, ForceFlag) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpDeleteSubnet", "ptr", ServerIpAddress, "uint", SubnetAddress, "int", ForceFlag, "uint")
        return result
    }

    /**
     * Creates an option definition for the default user and vendor class at the default option level.
     * @param {PWSTR} ServerIpAddress Unicode string containing the IPv4 address of the DHCP server.
     * @param {Integer} OptionID <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_OPTION_ID</a> value that contains the unique option ID number (also called an "option code") of the new option. Many of these option ID numbers are defined; a complete list of standard DHCP and BOOTP option codes can be found in  <a href="https://www.ietf.org/rfc/rfc2132.txt">DHCP Options and BOOTP Vendor Extensions</a>.
     * @param {Pointer<DHCP_OPTION>} OptionInfo <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_option">DHCP_OPTION</a> structure that contains information describing the new   DHCP option, including the name, an optional comment, and any related data items.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_JET_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred while accessing the DHCP server database.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_OPTION_EXISTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified option definition already exists in the DHCP server database.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpcreateoption
     * @since windowsserver2008
     */
    static DhcpCreateOption(ServerIpAddress, OptionID, OptionInfo) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpCreateOption", "ptr", ServerIpAddress, "uint", OptionID, "ptr", OptionInfo, "uint")
        return result
    }

    /**
     * Modifies the option definition of the specified option for the default user class and vendor class at the default option level.
     * @param {PWSTR} ServerIpAddress Pointer to a Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Integer} OptionID <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_OPTION_ID</a> value that contains the code uniquely identifying a specific DHCP option.
     * @param {Pointer<DHCP_OPTION>} OptionInfo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_option">DHCP_OPTION</a> structure that contains  information on the option specified by <i>OptionID</i>.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_JET_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred while accessing the DHCP server database.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_OPTION_NOT_PRESENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified option definition could not be found in the DHCP server database.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpsetoptioninfo
     * @since windowsserver2008
     */
    static DhcpSetOptionInfo(ServerIpAddress, OptionID, OptionInfo) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpSetOptionInfo", "ptr", ServerIpAddress, "uint", OptionID, "ptr", OptionInfo, "uint")
        return result
    }

    /**
     * Returns information on a specific DHCP option for the default user and vendor class.
     * @param {PWSTR} ServerIpAddress Unicode string that specifies the IPv4 address of the DHCP server.
     * @param {Integer} OptionID <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_OPTION_ID</a> value that specifies the code for the option to retrieve information on.
     * @param {Pointer<DHCP_OPTION>} OptionInfo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_option">DHCP_OPTION</a> structure that contains the returned information on the option specified by <i>OptionID</i>.
     * 
     * <div class="alert"><b>Note</b>  <p class="note">The memory for this parameter must be free using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dhcpsapi/nf-dhcpsapi-dhcprpcfreememory">DhcpRpcFreeMemory</a>.
     * 
     * </div>
     * <div> </div>
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_JET_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred while accessing the DHCP server database.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_OPTION_NOT_PRESENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified option definition could not be found in the DHCP server database.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpgetoptioninfo
     * @since windowsserver2008
     */
    static DhcpGetOptionInfo(ServerIpAddress, OptionID, OptionInfo) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpGetOptionInfo", "ptr", ServerIpAddress, "uint", OptionID, "ptr", OptionInfo, "uint")
        return result
    }

    /**
     * Returns an enumerated set of options stored on the DHCPv4 server.
     * @param {PWSTR} ServerIpAddress Pointer to a Unicode string that specifies the IPv4 address of the DHCP server.
     * @param {Pointer<UInt32>} ResumeHandle Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_RESUME_HANDLE</a> value that identifies the enumeration operation. Initially, this value should be zero, with a successful call returning the handle value used for subsequent enumeration requests. For example, if <i>PreferredMaximum</i> is set to 1000 bytes, and 2000 bytes worth of options are stored on the server, the resume handle can be used after the first 1000 bytes are retrieved to obtain the next 1000 on a subsequent call, and so forth. 
     * 
     * The presence of additional enumerable data is indicated when this function returns ERROR_MORE_DATA. If no additional enumerable data is available on the DHCPv4 server, ERROR_NO_MORE_ITEMS is returned.
     * @param {Integer} PreferredMaximum Specifies the preferred maximum number of bytes of options to return. If the number of remaining unenumerated options (in bytes) is less than this value, then that amount will be returned.
     * 
     * To retrieve all the option definitions for the default user and vendor class, set this parameter to 0xFFFFFFFF.
     * @param {Pointer<DHCP_OPTION_ARRAY>} Options Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_option_array">DHCP_OPTION_ARRAY</a> structure containing the returned options. If there are no options available on the DHCPv4 server, this parameter will return null.
     * @param {Pointer<UInt32>} OptionsRead Pointer to a DWORD value that specifies the number of options returned in <i>Options</i>.
     * @param {Pointer<UInt32>} OptionsTotal Pointer to a DWORD value that specifies the total number of remaining options stored on the DHCPv4 server.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_JET_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred while accessing the DHCP server database.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are more elements available to enumerate.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are no more elements left to enumerate.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpenumoptions
     * @since windowsserver2008
     */
    static DhcpEnumOptions(ServerIpAddress, ResumeHandle, PreferredMaximum, Options, OptionsRead, OptionsTotal) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpEnumOptions", "ptr", ServerIpAddress, "uint*", ResumeHandle, "uint", PreferredMaximum, "ptr", Options, "uint*", OptionsRead, "uint*", OptionsTotal, "uint")
        return result
    }

    /**
     * Removes the definition of a specific option for the default user class and vendor class at the default option level on the DHCP server.
     * @param {PWSTR} ServerIpAddress Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Integer} OptionID <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_OPTION_ID</a> value that contains the code uniquely identifying the specific option to remove from the DHCP server.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_JET_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred while accessing the DHCP server database.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_OPTION_NOT_PRESENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified option definition could not be found in the DHCP server database.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpremoveoption
     * @since windowsserver2008
     */
    static DhcpRemoveOption(ServerIpAddress, OptionID) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpRemoveOption", "ptr", ServerIpAddress, "uint", OptionID, "uint")
        return result
    }

    /**
     * Sets information for a specific option value on the DHCP server.
     * @param {PWSTR} ServerIpAddress Pointer to a Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Integer} OptionID <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_OPTION_ID</a> value that specifies the unique code for a DHCP option.
     * @param {Pointer<DHCP_OPTION_SCOPE_INFO>} ScopeInfo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_option_scope_info">DHCP_OPTION_SCOPE_INFO</a> structure that contains information describing the level (default, server, scope, or IPv4 reservation) at which this option value will be set.
     * @param {Pointer<DHCP_OPTION_DATA>} OptionValue Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_option_data">DHCP_OPTION_DATA</a> structure that contains the data value corresponding to the DHCP option code specified by <i>OptionID</i>.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_JET_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred while accessing the DHCP server database.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_OPTION_NOT_PRESENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified option definition could not be found in the DHCP server database.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_SUBNET_NOT_PRESENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified IPv4 subnet does not exist on the DHCP server.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_NOT_RESERVED_CLIENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified DHCP client is not a reserved client.
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
     * The multicast scope specified in <i>ScopeInfo</i> was not found on the DHCP server.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpsetoptionvalue
     * @since windowsserver2008
     */
    static DhcpSetOptionValue(ServerIpAddress, OptionID, ScopeInfo, OptionValue) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpSetOptionValue", "ptr", ServerIpAddress, "uint", OptionID, "ptr", ScopeInfo, "ptr", OptionValue, "uint")
        return result
    }

    /**
     * Sets option codes and their associated data values for a specific scope defined on the DHCP server.
     * @param {PWSTR} ServerIpAddress Pointer to a Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Pointer<DHCP_OPTION_SCOPE_INFO>} ScopeInfo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_option_scope_info">DHCP_OPTION_SCOPE_INFO</a> structure that contains information describing the level (default, server, scope, or IPv4 reservation) at which this option value will be set.
     * @param {Pointer<DHCP_OPTION_VALUE_ARRAY>} OptionValues Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_option_value_array">DHCP_OPTION_VALUE_ARRAY</a> structure that contains a list of option codes and the corresponding data value that will be set for them.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_JET_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred while accessing the DHCP server database.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_OPTION_NOT_PRESENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified option definition could not be found in the DHCP server database.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_SUBNET_NOT_PRESENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified IPv4 subnet does not exist on the DHCP server.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_NOT_RESERVED_CLIENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified DHCP client is not a reserved client.
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
     * The multicast scope specified in <i>ScopeInfo</i> was not found on the DHCP server.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpsetoptionvalues
     * @since windowsserver2008
     */
    static DhcpSetOptionValues(ServerIpAddress, ScopeInfo, OptionValues) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpSetOptionValues", "ptr", ServerIpAddress, "ptr", ScopeInfo, "ptr", OptionValues, "uint")
        return result
    }

    /**
     * The DhcpGetOptionValue function retrieves a DHCP option value (the option code and associated data) for a particular scope.
     * @param {PWSTR} ServerIpAddress Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Integer} OptionID <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_OPTION_ID</a> value that specifies the code for the option value to retrieve.
     * @param {Pointer<DHCP_OPTION_SCOPE_INFO>} ScopeInfo <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_option_scope_info">DHCP_OPTION_SCOPE_INFO</a> structure that contains information on the scope where the option value is set.
     * @param {Pointer<DHCP_OPTION_VALUE>} OptionValue <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_option_value">DHCP_OPTION_VALUE</a> structure that contains the returned option code and data.
     * 
     * <div class="alert"><b>Note</b>  <p class="note">The memory for this parameter must be free using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dhcpsapi/nf-dhcpsapi-dhcprpcfreememory">DhcpRpcFreeMemory</a>.
     * 
     * </div>
     * <div> </div>
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpgetoptionvalue
     * @since windowsserver2000
     */
    static DhcpGetOptionValue(ServerIpAddress, OptionID, ScopeInfo, OptionValue) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpGetOptionValue", "ptr", ServerIpAddress, "uint", OptionID, "ptr", ScopeInfo, "ptr", OptionValue, "uint")
        return result
    }

    /**
     * Returns an enumerated list of option values (just the option data and the associated ID number) for a given scope.
     * @param {PWSTR} ServerIpAddress Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Pointer<DHCP_OPTION_SCOPE_INFO>} ScopeInfo <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_option_scope_info">DHCP_OPTION_SCOPE_INFO</a> structure that contains the  level (specifically: default, server, scope, or IPv4 reservation level) for which the option values are defined and should be enumerated.
     * @param {Pointer<UInt32>} ResumeHandle Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_RESUME_HANDLE</a> value that identifies the enumeration operation. Initially, this value should be zero, with a successful call returning the handle value used for subsequent enumeration requests. For example, if <i>PreferredMaximum</i> is set to 1000 bytes, and 2000 bytes worth of option values  are stored on the server, the resume handle can be used after the first 1000 bytes are retrieved to obtain the next 1000 on a subsequent call, and so forth.
     * 
     * The presence of additional enumerable data is indicated when this function returns ERROR_MORE_DATA. If no additional enumerable data is available on the DHCPv4 server, ERROR_NO_MORE_ITEMS is returned.
     * @param {Integer} PreferredMaximum Specifies the preferred maximum number of bytes of option values to return. If the number of remaining unenumerated options (in bytes) is less than this value, then that amount will be returned.
     * 
     * To retrieve all the option values for the default user and vendor class at the specified level, set this parameter to 0xFFFFFFFF.
     * @param {Pointer<DHCP_OPTION_VALUE_ARRAY>} OptionValues Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_option_value_array">DHCP_OPTION_VALUE_ARRAY</a> structure that contains the enumerated option values returned for the specified scope. If there are no option values available for this scope on the DHCP server, this parameter will return null.
     * @param {Pointer<UInt32>} OptionsRead Pointer to a DWORD value that specifies the number of option values returned in <i>OptionValues</i>.
     * @param {Pointer<UInt32>} OptionsTotal Pointer to a DWORD value that specifies the total number of remaining option values for this scope stored on the DHCP server.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_JET_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred while accessing the DHCP server database.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are more elements available to enumerate.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are no more elements left to enumerate.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_SUBNET_NOT_PRESENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified IPv4 subnet does not exist on the DHCP server.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_NOT_RESERVED_CLIENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified DHCPv4 client is not an IPv4 reserved client.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpenumoptionvalues
     * @since windowsserver2008
     */
    static DhcpEnumOptionValues(ServerIpAddress, ScopeInfo, ResumeHandle, PreferredMaximum, OptionValues, OptionsRead, OptionsTotal) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpEnumOptionValues", "ptr", ServerIpAddress, "ptr", ScopeInfo, "uint*", ResumeHandle, "uint", PreferredMaximum, "ptr", OptionValues, "uint*", OptionsRead, "uint*", OptionsTotal, "uint")
        return result
    }

    /**
     * Removes the option value for a specific option on the DHCP4 server for the default user class and vendor class, for the specified scope.
     * @param {PWSTR} ServerIpAddress Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Integer} OptionID <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_OPTION_ID</a> value that contains the code uniquely identifying the specific option to remove from the DHCP server.
     * @param {Pointer<DHCP_OPTION_SCOPE_INFO>} ScopeInfo <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_option_scope_info">DHCP_OPTION_SCOPE_INFO</a> structure that contains information describing the specific scope (default, server, scope, or IPv4 reservation level) from which to remove the option value.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_JET_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred while accessing the DHCP server database.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_OPTION_NOT_PRESENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified option definition could not be found in the DHCP server database.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_SUBNET_NOT_PRESENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified IPv4 subnet is not defined on the DHCP server.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_NOT_RESERVED_CLIENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified DHCP client is not a reserved client.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpremoveoptionvalue
     * @since windowsserver2008
     */
    static DhcpRemoveOptionValue(ServerIpAddress, OptionID, ScopeInfo) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpRemoveOptionValue", "ptr", ServerIpAddress, "uint", OptionID, "ptr", ScopeInfo, "uint")
        return result
    }

    /**
     * Creates the provided DHCP client lease record in the DHCP server database.
     * @param {PWSTR} ServerIpAddress Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Pointer<DHCP_CLIENT_INFO_VQ>} ClientInfo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_client_info_vq">DHCP_CLIENT_INFO_VQ</a> structure that contains the DHCP client lease record information to set on the DHCP server. The caller must populate the <b>ClientIPAddress</b> and <b>ClientHardwareAddress</b> fields of this structure; all others are optional.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
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
     * This call was performed by a client who is not a member of the "DHCP Administrators" security group.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_JET_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred while accessing the DHCP server's database.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_CLIENT_EXISTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provided DHCP client record already exists in the DHCP server database.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpcreateclientinfovq
     * @since windowsserver2008
     */
    static DhcpCreateClientInfoVQ(ServerIpAddress, ClientInfo) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpCreateClientInfoVQ", "ptr", ServerIpAddress, "ptr", ClientInfo, "uint")
        return result
    }

    /**
     * Sets or modifies an existing DHCP client lease record in the DHCP server record database.
     * @param {PWSTR} ServerIpAddress Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Pointer<DHCP_CLIENT_INFO_VQ>} ClientInfo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_client_info_vq">DHCP_CLIENT_INFO_VQ</a> structure that contains the DHCP client lease record to add to or modify in the DHCP server database.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
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
     * This call was performed by a client who is not a member of the "DHCP Administrators" security group.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_JET_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred while accessing the DHCPv6 server's database.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provided client hardware address data is <b>NULL</b> or the length is set to zero, or the subnet mask is incorrect.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpsetclientinfovq
     * @since windowsserver2008
     */
    static DhcpSetClientInfoVQ(ServerIpAddress, ClientInfo) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpSetClientInfoVQ", "ptr", ServerIpAddress, "ptr", ClientInfo, "uint")
        return result
    }

    /**
     * Retrieves DHCP client lease record information from the DHCP server database.
     * @param {PWSTR} ServerIpAddress Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Pointer<DHCP_SEARCH_INFO>} SearchInfo Pointer to a <a href="https://docs.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_search_info">DHCP_SEARCH_INFO</a> structure that defines the key used to search the client lease record database on the DHCP server for a particular client record.
     * @param {Pointer<DHCP_CLIENT_INFO_VQ>} ClientInfo Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_client_info_vq">DHCP_CLIENT_INFO_VQ</a> structure returned by a successful search operation.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
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
     * This call was performed by a client who is not a member of the "DHCP Administrators" security group.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_JET_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred while accessing the DHCP server's database.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpgetclientinfovq
     * @since windowsserver2008
     */
    static DhcpGetClientInfoVQ(ServerIpAddress, SearchInfo, ClientInfo) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpGetClientInfoVQ", "ptr", ServerIpAddress, "ptr", SearchInfo, "ptr", ClientInfo, "uint")
        return result
    }

    /**
     * Retrieves all DHCP clients serviced from the specified IPv4 subnet.
     * @param {PWSTR} ServerIpAddress Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Integer} SubnetAddress <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_ADDRESS</a> value that contains the IPv4 subnet for which the DHCP clients are returned. If this parameter is set to 0, the DHCP clients for all known IPv4 subnets are returned.
     * @param {Pointer<UInt32>} ResumeHandle Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_RESUME_HANDLE</a> value that identifies the enumeration operation on the DHCP server. Initially, this value must be set to 0. A successful call will return a handle value in this parameter, which can be passed to subsequent enumeration requests. The returned handle value is the last IPv4 address retrieved in the enumeration operation.
     * @param {Integer} PreferredMaximum Specifies the preferred maximum number of bytes to return in the enumeration operation. the minimum value is 1024 bytes, and the maximum value is 65536 bytes.
     * @param {Pointer<DHCP_CLIENT_INFO_ARRAY_VQ>} ClientInfo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_client_info_array_vq">DHCP_CLIENT_INFO_ARRAY_VQ</a> structure that contains the DHCP client lease record set returned by the enumeration operation.
     * @param {Pointer<UInt32>} ClientsRead Pointer to a value that specifies the number of DHCP client records returned in <i>ClientInfo</i>.
     * @param {Pointer<UInt32>} ClientsTotal Pointer to a value that specifies the number of DHCP client record remaining and as-yet unreturned.  For example, if there are 100 DHCP client records for a given IPv4 subnet, and if 10 client records are enumerated per call, then after the first call this value would return 90.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
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
     * This call was performed by a client who is not a member of the "DHCP Administrators" security group.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_JET_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred while accessing the DHCP server's database.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are still unenumerated client lease records on the DHCP server for the provided IPv4 subnet. Please call this function again with the returned resume handle to obtain more of them.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpenumsubnetclientsvq
     * @since windowsserver2008
     */
    static DhcpEnumSubnetClientsVQ(ServerIpAddress, SubnetAddress, ResumeHandle, PreferredMaximum, ClientInfo, ClientsRead, ClientsTotal) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpEnumSubnetClientsVQ", "ptr", ServerIpAddress, "uint", SubnetAddress, "uint*", ResumeHandle, "uint", PreferredMaximum, "ptr", ClientInfo, "uint*", ClientsRead, "uint*", ClientsTotal, "uint")
        return result
    }

    /**
     * Enumerates all of the DHCP clients serviced on the specified subnet, and includes link-layer filter status for each of them.
     * @param {PWSTR} ServerIpAddress Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Integer} SubnetAddress <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_ADDRESS</a> value that contains the IPv4 subnet for which the DHCP clients are returned. If this parameter is set to 0, the DHCP clients for all known IPv4 subnets are returned.
     * @param {Pointer<UInt32>} ResumeHandle Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_RESUME_HANDLE</a> value that identifies the enumeration operation on the DHCP server. Initially, this value must be set to 0. A successful call will return a handle value in this parameter, which can be passed to subsequent enumeration requests. The returned handle value is the last IPv4 address retrieved in the enumeration operation.
     * @param {Integer} PreferredMaximum Specifies the preferred maximum number of bytes to return in the enumeration operation. the minimum value is 1024 bytes, and the maximum value is 65536 bytes.
     * @param {Pointer<DHCP_CLIENT_FILTER_STATUS_INFO_ARRAY>} ClientInfo Pointer to a <a href="https://docs.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_client_filter_status_info_array">DHCP_CLIENT_FILTER_STATUS_INFO_ARRAY</a> structure that contains all of the DHCP clients serviced on the specified subnet, as well as any associated link-layer filter status information for each of them.
     * @param {Pointer<UInt32>} ClientsRead Pointer to a value that specifies the number of DHCP client records returned in <i>ClientInfo</i>.
     * @param {Pointer<UInt32>} ClientsTotal Pointer to a value that specifies the number of DHCP client record remaining and as-yet unreturned.  For example, if there are 100 DHCP client records for a given IPv4 subnet, and if 10 client records are enumerated per call, then after the first call this value would return 90.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
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
     * This call was performed by a client who is not a member of the "DHCP Administrators" security group.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_JET_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred while accessing the DHCP server's database.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are still unenumerated client lease records on the DHCP server for the provided IPv4 subnet. Please call this function again with the returned resume handle to obtain more of them.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpenumsubnetclientsfilterstatusinfo
     * @since windowsserver2008
     */
    static DhcpEnumSubnetClientsFilterStatusInfo(ServerIpAddress, SubnetAddress, ResumeHandle, PreferredMaximum, ClientInfo, ClientsRead, ClientsTotal) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpEnumSubnetClientsFilterStatusInfo", "ptr", ServerIpAddress, "uint", SubnetAddress, "uint*", ResumeHandle, "uint", PreferredMaximum, "ptr", ClientInfo, "uint*", ClientsRead, "uint*", ClientsTotal, "uint")
        return result
    }

    /**
     * The DhcpCreateClientInfo function creates a client information record on the DHCP server.
     * @param {PWSTR} ServerIpAddress Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Pointer<DHCP_CLIENT_INFO>} ClientInfo <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_client_info">DHCP_CLIENT_INFO</a> structure that contains information about the DHCP client, including the assigned IP address, subnet mask, and host.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpcreateclientinfo
     * @since windowsserver2000
     */
    static DhcpCreateClientInfo(ServerIpAddress, ClientInfo) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpCreateClientInfo", "ptr", ServerIpAddress, "ptr", ClientInfo, "uint")
        return result
    }

    /**
     * The DhcpSetClientInfo function sets information on a client whose IP address lease is administrated by the DHCP server.
     * @param {PWSTR} ServerIpAddress Pointer to a Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Pointer<DHCP_CLIENT_INFO>} ClientInfo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_client_info">DHCP_CLIENT_INFO</a> structure that contains the information on a client in a subnet served by the DHCP server.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpsetclientinfo
     * @since windowsserver2000
     */
    static DhcpSetClientInfo(ServerIpAddress, ClientInfo) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpSetClientInfo", "ptr", ServerIpAddress, "ptr", ClientInfo, "uint")
        return result
    }

    /**
     * The DhcpGetClientInfo function returns information about a specific DHCP client.
     * @param {PWSTR} ServerIpAddress Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Pointer<DHCP_SEARCH_INFO>} SearchInfo <a href="https://docs.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_search_info">DHCP_SEARCH_INFO</a> structure that contains the parameters for the search.
     * @param {Pointer<DHCP_CLIENT_INFO>} ClientInfo Pointer to a  <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_client_info">DHCP_CLIENT_INFO</a> structure that contains information describing the DHCP client that most closely matches the provided search parameters. If no client is found, this parameter will be null.
     * 
     * <div class="alert"><b>Note</b>  <p class="note">The memory for this parameter must be free using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dhcpsapi/nf-dhcpsapi-dhcprpcfreememory">DhcpRpcFreeMemory</a>.
     * 
     * </div>
     * <div> </div>
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpgetclientinfo
     * @since windowsserver2000
     */
    static DhcpGetClientInfo(ServerIpAddress, SearchInfo, ClientInfo) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpGetClientInfo", "ptr", ServerIpAddress, "ptr", SearchInfo, "ptr", ClientInfo, "uint")
        return result
    }

    /**
     * The DhcpDeleteClientInfo function deletes a client information record from the DHCP server.
     * @param {PWSTR} ServerIpAddress Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Pointer<DHCP_SEARCH_INFO>} ClientInfo <a href="https://docs.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_search_info">DHCP_SEARCH_INFO</a> union structure that contains one of the following items used to search the DHCP client record database: the client IP address, the client MAC address, or the client network name. All records matching the value will be deleted; for example, if a client IP address of 192.1.1.10 is supplied, all records with this address in the <b>ClientIpAddress</b> field will be deleted.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpdeleteclientinfo
     * @since windowsserver2000
     */
    static DhcpDeleteClientInfo(ServerIpAddress, ClientInfo) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpDeleteClientInfo", "ptr", ServerIpAddress, "ptr", ClientInfo, "uint")
        return result
    }

    /**
     * The DhcpEnumSubnetClients function returns an enumerated list of clients with served IP addresses in the specified subnet.
     * @param {PWSTR} ServerIpAddress Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Integer} SubnetAddress <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_ADDRESS</a> value that contains the subnet ID. See <a href="https://www.ietf.org/rfc/rfc0950.txt">RFC 950</a> for more information about subnet ID.
     * @param {Pointer<UInt32>} ResumeHandle Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_RESUME_HANDLE</a> value that identifies the enumeration operation. Initially, this value should be zero, with a successful call returning the handle value used for subsequent enumeration requests. For example, if <i>PreferredMaximum</i> is set to 1000 bytes, and 2000 bytes worth of subnet client information structures  are stored on the server, the resume handle can be used after the first 1000 bytes are retrieved to obtain the next 1000 on a subsequent call, and so forth.
     * @param {Integer} PreferredMaximum Specifies the preferred maximum number of bytes of subnet client information structures to return. If the number of remaining unenumerated options (in bytes) is less than this value, then that amount will be returned.   
     * 
     * The minimum value is 1024 bytes (1KB), and the maximum value is 65536 bytes (64KB); if the input value is greater or less than this range, it will be set to the maximum or minimum value, respectively.
     * @param {Pointer<DHCP_CLIENT_INFO_ARRAY>} ClientInfo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_client_info_array">DHCP_CLIENT_INFO_ARRAY</a> structure that contains information on the clients served under this specific subnet. If no clients are available, this field will be null.
     * @param {Pointer<UInt32>} ClientsRead Pointer to a <b>DWORD</b> value that specifies the number of clients returned in <i>ClientInfo</i>.
     * @param {Pointer<UInt32>} ClientsTotal Pointer to a <b>DWORD</b> value that specifies the  number of clients for the specified subnet that have not yet been enumerated.
     * 
     * <div class="alert"><b>Note</b>  This value is set to the correct value during the final enumeration call; however, prior calls to this function set the value as "0x7FFFFFFF".</div>
     * <div> </div>
     * @returns {Integer} This function returns <b>ERROR_MORE_DATA</b> upon a successful call. The final call to this method with the last set of subnet clients returns <b>ERROR_SUCCESS</b>. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpenumsubnetclients
     * @since windowsserver2000
     */
    static DhcpEnumSubnetClients(ServerIpAddress, SubnetAddress, ResumeHandle, PreferredMaximum, ClientInfo, ClientsRead, ClientsTotal) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpEnumSubnetClients", "ptr", ServerIpAddress, "uint", SubnetAddress, "uint*", ResumeHandle, "uint", PreferredMaximum, "ptr", ClientInfo, "uint*", ClientsRead, "uint*", ClientsTotal, "uint")
        return result
    }

    /**
     * Returns only ERROR_NOT_IMPLEMENTED, as it is not used or supported.
     * @param {PWSTR} ServerIpAddress Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Integer} ClientIpAddress <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_ADDRESS</a> value that specifies the IP address or hostname of the DHCP client  whose option values will be returned.
     * @param {Integer} ClientSubnetMask <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_MASK</a> value that specifies the subnet mask of the DHCP client whose option values will be returned.
     * @param {Pointer<DHCP_OPTION_LIST>} ClientOptions Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_option_list">DHCP_OPTION_LIST</a> structure that contains the returned option values for the DHCP client.
     * 
     * <div class="alert"><b>Note</b>  <p class="note">The memory for this parameter must be free using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dhcpsapi/nf-dhcpsapi-dhcprpcfreememory">DhcpRpcFreeMemory</a>.
     * 
     * </div>
     * <div> </div>
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_IMPLEMENTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function is not implemented and is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpgetclientoptions
     * @since windowsserver2008
     */
    static DhcpGetClientOptions(ServerIpAddress, ClientIpAddress, ClientSubnetMask, ClientOptions) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpGetClientOptions", "ptr", ServerIpAddress, "uint", ClientIpAddress, "uint", ClientSubnetMask, "ptr", ClientOptions, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} ServerIpAddress 
     * @param {Pointer<DHCP_MIB_INFO>} MibInfo 
     * @returns {Integer} 
     */
    static DhcpGetMibInfo(ServerIpAddress, MibInfo) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpGetMibInfo", "ptr", ServerIpAddress, "ptr", MibInfo, "uint")
        return result
    }

    /**
     * Configures a DHCPv4 server with specific settings, including information on the JET database used to store subnet and client lease information, and the supported protocols.
     * @param {PWSTR} ServerIpAddress Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Integer} FieldsToSet Specifies a set of bit flags that indicate which fields in <i>ConfigInfo</i> are set. If a flag is present, the corresponding field must also be populated in the <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_server_config_info">DHCP_SERVER_CONFIG_INFO</a> structure referenced by <i>ConfigInfo</i>, and will be used to set the same value on the DHCP server,
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="Set_APIProtocolSupport"></a><a id="set_apiprotocolsupport"></a><a id="SET_APIPROTOCOLSUPPORT"></a><dl>
     * <dt><b>Set_APIProtocolSupport</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>APIProtocolSupport</b> field is populated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="Set_DatabaseName"></a><a id="set_databasename"></a><a id="SET_DATABASENAME"></a><dl>
     * <dt><b>Set_DatabaseName</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>DatabaseName</b> field is populated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="Set_DatabasePath"></a><a id="set_databasepath"></a><a id="SET_DATABASEPATH"></a><dl>
     * <dt><b>Set_DatabasePath</b></dt>
     * <dt>0x00000004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>DatabasePath</b> field is populated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="Set_BackupPath"></a><a id="set_backuppath"></a><a id="SET_BACKUPPATH"></a><dl>
     * <dt><b>Set_BackupPath</b></dt>
     * <dt>0x00000008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>BackupPath</b> field is populated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="Set_BackupInterval"></a><a id="set_backupinterval"></a><a id="SET_BACKUPINTERVAL"></a><dl>
     * <dt><b>Set_BackupInterval</b></dt>
     * <dt>0x00000010</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>BackupInterval</b> field is populated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="Set_DatabaseLoggingFlag"></a><a id="set_databaseloggingflag"></a><a id="SET_DATABASELOGGINGFLAG"></a><dl>
     * <dt><b>Set_DatabaseLoggingFlag</b></dt>
     * <dt>0x00000020</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>DatabaseLoggingFlag</b> field is populated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="Set_RestoreFlag"></a><a id="set_restoreflag"></a><a id="SET_RESTOREFLAG"></a><dl>
     * <dt><b>Set_RestoreFlag</b></dt>
     * <dt>0x00000040</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>RestoreFlag</b> field is populated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="Set_DatabaseCleanupInterval"></a><a id="set_databasecleanupinterval"></a><a id="SET_DATABASECLEANUPINTERVAL"></a><dl>
     * <dt><b>Set_DatabaseCleanupInterval</b></dt>
     * <dt>0x00000080</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>DatabaseCleanupInterval</b> field is populated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="Set_Set_DebugFlag"></a><a id="set_set_debugflag"></a><a id="SET_SET_DEBUGFLAG"></a><dl>
     * <dt><b>Set_Set_DebugFlag</b></dt>
     * <dt>0x00000100</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>DebugFlag</b> field is populated.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<DHCP_SERVER_CONFIG_INFO>} ConfigInfo <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_server_config_info">DHCP_SERVER_CONFIG_INFO</a> structure that contains the specific configuration information to set on the DHCP server, as indicated by the flags specified in <i>FieldsToSet</i>.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpserversetconfig
     * @since windowsserver2008
     */
    static DhcpServerSetConfig(ServerIpAddress, FieldsToSet, ConfigInfo) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpServerSetConfig", "ptr", ServerIpAddress, "uint", FieldsToSet, "ptr", ConfigInfo, "uint")
        return result
    }

    /**
     * Returns the specific configuration settings of a DHCP server.
     * @param {PWSTR} ServerIpAddress Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Pointer<DHCP_SERVER_CONFIG_INFO>} ConfigInfo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_server_config_info">DHCP_SERVER_CONFIG_INFO</a> structure that contains the specific configuration information for the DHCP server.
     * 
     * <div class="alert"><b>Note</b>  <p class="note">The memory for this parameter must be free using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dhcpsapi/nf-dhcpsapi-dhcprpcfreememory">DhcpRpcFreeMemory</a>.
     * 
     * </div>
     * <div> </div>
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpservergetconfig
     * @since windowsserver2008
     */
    static DhcpServerGetConfig(ServerIpAddress, ConfigInfo) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpServerGetConfig", "ptr", ServerIpAddress, "ptr", ConfigInfo, "uint")
        return result
    }

    /**
     * Enumerates the leased DHCPv4 client IPv4 addresses that are not synchronized between the in-memory cache and the server database.
     * @param {PWSTR} ServerIpAddress Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Integer} SubnetAddress <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_ADDRESS</a> value that specifies the subnet whose leases will be scanned for desynchronized client lease IP addresses.
     * @param {Integer} FixFlag Specifies a set of bit flags that indicate whether the in-memory cache or the client lease database should be the definitive source for fixes when synchronizing the two on the DHCPv4 server. These flags are enumerated in <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ne-dhcpsapi-dhcp_scan_flag">DHCP_SCAN_FLAG</a>.
     * @param {Pointer<DHCP_SCAN_LIST>} ScanList <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_scan_list">DHCP_SCAN_LIST</a> structure that contains the returned list of leased client IP addresses that are not in sync.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
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
     * This call was performed by a client who is not a member of the "DHCP Administrators" security group.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_JET_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred while accessing the DHCPv4 server's database.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_SUBNET_NOT_PRESENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified subnet is not defined on the DHCPv4 server.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpscandatabase
     * @since windowsserver2008
     */
    static DhcpScanDatabase(ServerIpAddress, SubnetAddress, FixFlag, ScanList) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpScanDatabase", "ptr", ServerIpAddress, "uint", SubnetAddress, "uint", FixFlag, "ptr", ScanList, "uint")
        return result
    }

    /**
     * The DhcpRpcFreeMemory function frees a block of buffer space returned as a parameter.
     * @param {Pointer<Void>} BufferPointer Pointer to an address that contains a structure (or structures, in the case of an array) returned as a parameter.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcprpcfreememory
     * @since windowsserver2000
     */
    static DhcpRpcFreeMemory(BufferPointer) {
        DllCall("DHCPSAPI.dll\DhcpRpcFreeMemory", "ptr", BufferPointer)
    }

    /**
     * The DhcpGetVersion function returns the major and minor version numbers of the DHCP server.
     * @param {PWSTR} ServerIpAddress Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Pointer<UInt32>} MajorVersion Specifies the major version number of the DHCP server.
     * @param {Pointer<UInt32>} MinorVersion Specifies the minor version number of the DHCP server.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpgetversion
     * @since windowsserver2000
     */
    static DhcpGetVersion(ServerIpAddress, MajorVersion, MinorVersion) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpGetVersion", "ptr", ServerIpAddress, "uint*", MajorVersion, "uint*", MinorVersion, "uint")
        return result
    }

    /**
     * Adds an element describing a feature or aspect of the subnet to the subnet entry in the DHCP database. This function extends DhcpAddSubnetElement by incorporating subnet elements that consider client type.
     * @param {PWSTR} ServerIpAddress Pointer to a Unicode string that contains the IP address of the subnet DHCP server.
     * @param {Integer} SubnetAddress <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_ADDRESS</a> structure that contains the IP address of the subnet.
     * @param {Pointer<DHCP_SUBNET_ELEMENT_DATA_V4>} AddElementInfo <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_subnet_element_data_v4">DHCP_SUBNET_ELEMENT_DATA_V4</a> structure that contains the element data to add to the subnet. The V4 structure adds support for differentiation between DHCP and BOOTP clients.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_JET_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred while accessing the DHCP server database.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_SUBNET_NOT_PRESENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified IPv4 subnet does not exist.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_OPTION_NOT_PRESENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified option definition does not exist in the DHCP server database.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_INVALID_RANGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified IPv4 address range either overlaps an existing range or is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_IPRANGE_CONV_ILLEGAL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Conversion of a scope to a DHCPv4-only scope or to a BOOTP-only scope is not allowed when DHCPv4 and BOOTP clients are present in the scope to convert. Manually delete either the DHCPv4 or the BOOTP clients from the scope, as appropriate for the type of scope being created.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_IPRANGE_EXISTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified IPv4 address range already exists.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_MSCOPE_RANGE_TOO_SMALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The multicast scope range must allow for at least 256 IPv4 addresses.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_NOT_RESERVED_CLIENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified DHCPv4 client is not an IPv4 reserverdclient.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_RESERVEDIP_EXISTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified IPv4 address or hardware address is in use by another DHCPv4 client.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_ADDRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified address is not available.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpaddsubnetelementv4
     * @since windowsserver2008
     */
    static DhcpAddSubnetElementV4(ServerIpAddress, SubnetAddress, AddElementInfo) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpAddSubnetElementV4", "ptr", ServerIpAddress, "uint", SubnetAddress, "ptr", AddElementInfo, "uint")
        return result
    }

    /**
     * Returns an enumerated list of elements for a specific DHCP subnet. This function extends DhcpEnumSubnetElements by returning a list of DHCP_SUBNET_ELEMENT_DATA_V4 structures, which can contain IP reservations based on client type.
     * @param {PWSTR} ServerIpAddress Unicode string that specifies the IPv4 address of the DHCPv4 server.
     * @param {Integer} SubnetAddress <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_ADDRESS</a> value that specifies the address of the IPv4 subnet whose elements will be enumerated.
     * @param {Integer} EnumElementType <a href="https://docs.microsoft.com/windows/win32/api/dhcpsapi/ne-dhcpsapi-dhcp_subnet_element_type">DHCP_SUBNET_ELEMENT_TYPE</a> enumeration value that indicates the type of subnet element to enumerate.
     * @param {Pointer<UInt32>} ResumeHandle Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_RESUME_HANDLE</a> value that identifies the enumeration operation. Initially, this value should be zero, with a successful call returning the handle value used for subsequent enumeration requests. For example, if <i>PreferredMaximum</i> is set to 1000 bytes, and 2000 bytes worth of subnet elements  are stored on the server, the resume handle can be used after the first 1000 bytes are retrieved to obtain the next 1000 on a subsequent call, and so forth.
     * 
     * The presence of additional enumerable data is indicated when this function returns ERROR_MORE_DATA. If no additional enumerable data is available on the DHCPv4 server, ERROR_NO_MORE_ITEMS is returned.
     * @param {Integer} PreferredMaximum Specifies the preferred maximum number of bytes of subnet elements to return. If the number of remaining unenumerated options (in bytes) is less than this value, then that amount will be returned.
     * 
     * To retrieve all the subnet client elements for the default user and vendor class at the specified level, set this parameter to 0xFFFFFFFF.
     * @param {Pointer<DHCP_SUBNET_ELEMENT_INFO_ARRAY_V4>} EnumElementInfo Pointer to a <a href="https://docs.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_subnet_element_info_array_v4">DHCP_SUBNET_ELEMENT_INFO_ARRAY_V4</a> structure containing an enumerated list of all elements available for the specified subnet. If no elements are available for enumeration, this value will be null.
     * @param {Pointer<UInt32>} ElementsRead Pointer to a DWORD value that specifies the number of subnet elements returned in <i>EnumElementInfo</i>.
     * @param {Pointer<UInt32>} ElementsTotal Pointer to a DWORD value that specifies the total number of as-yet unenumerated elements remaining on the server for the specified subnet.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_JET_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred while accessing the DHCP server database.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are more elements available to enumerate.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are no more elements left to enumerate.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_SUBNET_NOT_PRESENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified IPv4 subnet does not exist on the DHCP server.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpenumsubnetelementsv4
     * @since windowsserver2000
     */
    static DhcpEnumSubnetElementsV4(ServerIpAddress, SubnetAddress, EnumElementType, ResumeHandle, PreferredMaximum, EnumElementInfo, ElementsRead, ElementsTotal) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpEnumSubnetElementsV4", "ptr", ServerIpAddress, "uint", SubnetAddress, "int", EnumElementType, "uint*", ResumeHandle, "uint", PreferredMaximum, "ptr", EnumElementInfo, "uint*", ElementsRead, "uint*", ElementsTotal, "uint")
        return result
    }

    /**
     * Removes an IPv4 subnet element from an IPv4 subnet defined on the DHCPv4 server. The function extends the functionality provided by DhcpRemoveSubnetElement by allowing the specification of a subnet that contains client type (DHCP or BOOTP) information.
     * @param {PWSTR} ServerIpAddress Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Integer} SubnetAddress <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_ADDRESS</a> value that specifies the IP address of the subnet gateway and uniquely identifies it.
     * @param {Pointer<DHCP_SUBNET_ELEMENT_DATA_V4>} RemoveElementInfo <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_subnet_element_data_v4">DHCP_SUBNET_ELEMENT_DATA_V4</a> structure that contains information used to find the element that will be removed from subnet specified in <i>SubnetAddress</i>.
     * @param {Integer} ForceFlag <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ne-dhcpsapi-dhcp_force_flag">DHCP_FORCE_FLAG</a> enumeration value that indicates whether or not the clients affected by the removal of the subnet element should also be deleted.
     * 
     * <div class="alert"><b>Note</b>  If the flag is set to <b>DhcpNoForce</b> and this subnet has served an IPv4 address to DHCPv4/BOOTP clients, the IPv4 range is not deleted; conversely, if the flag is set to <b>DhcpFullForce</b>, the IPv4 range is deleted along with the DHCPv4 client lease record on the DHCPv4 server.</div>
     * <div> </div>
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_JET_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred while accessing the DHCP server database.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_SUBNET_NOT_PRESENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified IPv4 subnet is not defined on the DHCP server.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_RESERVED_CLIENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified DHCP client is a reserved client.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_INVALID_RANGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified IPv4 address range either overlaps an existing IPv4 address range, or is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_ELEMENT_CANT_REMOVE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one multicast IPv4 address has been leased out to a MADCAP client.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpremovesubnetelementv4
     * @since windowsserver2008
     */
    static DhcpRemoveSubnetElementV4(ServerIpAddress, SubnetAddress, RemoveElementInfo, ForceFlag) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpRemoveSubnetElementV4", "ptr", ServerIpAddress, "uint", SubnetAddress, "ptr", RemoveElementInfo, "int", ForceFlag, "uint")
        return result
    }

    /**
     * Creates a client information record on the DHCP server, extending the functionality of DhcpCreateClientInfo by including the client type (DHCP or BOOTP) in the record.
     * @param {PWSTR} ServerIpAddress Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Pointer<DHCP_CLIENT_INFO_V4>} ClientInfo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_client_info_v4">DHCP_CLIENT_INFO_V4</a> structure that contains information about the DHCP client, including the assigned IP address, the subnet mask, the  host, and the client type (DHCP and/or BOOTP).
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
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
     * This call was performed by a client who is not a member of the "DHCP Administrators" security group.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpcreateclientinfov4
     * @since windowsserver2008
     */
    static DhcpCreateClientInfoV4(ServerIpAddress, ClientInfo) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpCreateClientInfoV4", "ptr", ServerIpAddress, "ptr", ClientInfo, "uint")
        return result
    }

    /**
     * Sets information on a client whose IP address lease is administrated by the DHCP server. This function extends the functionality provided by DhcpSetClientInfo by allowing the caller to specify the client type (DHCP or BOOTP).
     * @param {PWSTR} ServerIpAddress Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Pointer<DHCP_CLIENT_INFO_V4>} ClientInfo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_client_info_v4">DHCP_CLIENT_INFO_V4</a> structure that contains the information, including client type, for a client in a subnet served by the DHCP server.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
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
     * This call was performed by a client who is not a member of the "DHCP Administrators" security group.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_JET_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred while accessing the DHCP server's database.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpsetclientinfov4
     * @since windowsserver2008
     */
    static DhcpSetClientInfoV4(ServerIpAddress, ClientInfo) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpSetClientInfoV4", "ptr", ServerIpAddress, "ptr", ClientInfo, "uint")
        return result
    }

    /**
     * Returns information on a specific DHCP client. This function extends DhcpGetClientInfo by returning a DHCP_CLIENT_INFO_V4 structure that contains client type information.
     * @param {PWSTR} ServerIpAddress Specifies the IP address of the DHCP server.
     * @param {Pointer<DHCP_SEARCH_INFO>} SearchInfo <a href="https://docs.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_search_info">DHCP_SEARCH_INFO</a> structure that contains the search parameters used to select a specific DHCP client.
     * @param {Pointer<DHCP_CLIENT_INFO_V4>} ClientInfo <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_client_info_v4">DHCP_CLIENT_INFO_V4</a> structure that contains information that describes the DHCP client that most closely matches the provided search parameters. If no client could be found, this parameter will be null.
     * 
     * <div class="alert"><b>Note</b>  <p class="note">The memory for this parameter must be free using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dhcpsapi/nf-dhcpsapi-dhcprpcfreememory">DhcpRpcFreeMemory</a>.
     * 
     * </div>
     * <div> </div>
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
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
     * This call was performed by a client who is not a member of the "DHCP Administrators" security group.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_JET_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred while accessing the DHCP server's database.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpgetclientinfov4
     * @since windowsserver2008
     */
    static DhcpGetClientInfoV4(ServerIpAddress, SearchInfo, ClientInfo) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpGetClientInfoV4", "ptr", ServerIpAddress, "ptr", SearchInfo, "ptr", ClientInfo, "uint")
        return result
    }

    /**
     * Returns an enumerated list of client lease records with served IP addresses in the specified subnet.
     * @param {PWSTR} ServerIpAddress Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Integer} SubnetAddress <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_ADDRESS</a> value containing the IP address of the subnet gateway.
     * @param {Pointer<UInt32>} ResumeHandle Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_RESUME_HANDLE</a> value that identifies the enumeration operation. Initially, this value should be zero, with a successful call returning the handle value used for subsequent enumeration requests. This parameter contains the last last IPv4 address retrieved from the DHCPv4 client.
     * 
     * The presence of additional enumerable data is indicated when this function returns ERROR_MORE_DATA. If no additional enumerable data is available on the DHCPv4 server, ERROR_NO_MORE_ITEMS is returned.
     * @param {Integer} PreferredMaximum Specifies the preferred maximum number of bytes of subnet client elements to return. If the number of remaining unenumerated elements (in bytes) is less than this value, then that amount will be returned. The minimum value is 1024 bytes, and the maximum value is 65536 bytes.
     * 
     * To retrieve all the subnet client elements for the default user and vendor class at the specified level, set this parameter to 0xFFFFFFFF.
     * @param {Pointer<DHCP_CLIENT_INFO_ARRAY_V4>} ClientInfo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_client_info_array_v4">DHCP_CLIENT_INFO_ARRAY_V4</a> structure that contains the DHCPv4 client lease record array. If no clients are available, this field will be null.
     * @param {Pointer<UInt32>} ClientsRead Pointer to a DWORD value that specifies the number of client lease records returned in <i>ClientInfo</i>.
     * @param {Pointer<UInt32>} ClientsTotal Pointer to a DWORD value that specifies the total number of client lease records remaining on the DHCPv4 server. For example, if there are 100 DHCPv4 lease records for an IPv4 subnet, and if 10 DHCPv4 lease records are enumerated per call, then this parameter would return a value of 90 after the first call.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_JET_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred while accessing the DHCP server database.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are more elements available to enumerate.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are no more elements left to enumerate.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_SUBNET_NOT_PRESENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified IPv4 subnet does not exist on the DHCP server.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpenumsubnetclientsv4
     * @since windowsserver2008
     */
    static DhcpEnumSubnetClientsV4(ServerIpAddress, SubnetAddress, ResumeHandle, PreferredMaximum, ClientInfo, ClientsRead, ClientsTotal) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpEnumSubnetClientsV4", "ptr", ServerIpAddress, "uint", SubnetAddress, "uint*", ResumeHandle, "uint", PreferredMaximum, "ptr", ClientInfo, "uint*", ClientsRead, "uint*", ClientsTotal, "uint")
        return result
    }

    /**
     * The DhcpServerSetConfigV4 function configures a DHCP server with specific settings, including information on the JET database used to store subnet and client lease information, and the supported protocols.
     * @param {PWSTR} ServerIpAddress Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Integer} FieldsToSet Specifies a set of bit flags that indicate which fields in <i>ConfigInfo</i> are set. If a flag is present, the corresponding field must also be populated in the <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_server_config_info_v4">DHCP_SERVER_CONFIG_INFO_V4</a> structure referenced by <i>ConfigInfo</i>, and will be used to set the same value on the DHCP server,
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="Set_APIProtocolSupport"></a><a id="set_apiprotocolsupport"></a><a id="SET_APIPROTOCOLSUPPORT"></a><dl>
     * <dt><b>Set_APIProtocolSupport</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>APIProtocolSupport</b> field is populated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="Set_DatabaseName"></a><a id="set_databasename"></a><a id="SET_DATABASENAME"></a><dl>
     * <dt><b>Set_DatabaseName</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>DatabaseName</b> field is populated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="Set_DatabasePath"></a><a id="set_databasepath"></a><a id="SET_DATABASEPATH"></a><dl>
     * <dt><b>Set_DatabasePath</b></dt>
     * <dt>0x00000004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>DatabasePath</b> field is populated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="Set_BackupPath"></a><a id="set_backuppath"></a><a id="SET_BACKUPPATH"></a><dl>
     * <dt><b>Set_BackupPath</b></dt>
     * <dt>0x00000008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>BackupPath</b> field is populated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="Set_BackupInterval"></a><a id="set_backupinterval"></a><a id="SET_BACKUPINTERVAL"></a><dl>
     * <dt><b>Set_BackupInterval</b></dt>
     * <dt>0x00000010</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>BackupInterval</b> field is populated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="Set_DatabaseLoggingFlag"></a><a id="set_databaseloggingflag"></a><a id="SET_DATABASELOGGINGFLAG"></a><dl>
     * <dt><b>Set_DatabaseLoggingFlag</b></dt>
     * <dt>0x00000020</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>DatabaseLoggingFlag</b> field is populated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="Set_RestoreFlag"></a><a id="set_restoreflag"></a><a id="SET_RESTOREFLAG"></a><dl>
     * <dt><b>Set_RestoreFlag</b></dt>
     * <dt>0x00000040</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>RestoreFlag</b> field is populated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="Set_DatabaseCleanupInterval"></a><a id="set_databasecleanupinterval"></a><a id="SET_DATABASECLEANUPINTERVAL"></a><dl>
     * <dt><b>Set_DatabaseCleanupInterval</b></dt>
     * <dt>0x00000080</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>DatabaseCleanupInterval</b> field is populated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="Set_DebugFlag"></a><a id="set_debugflag"></a><a id="SET_DEBUGFLAG"></a><dl>
     * <dt><b>Set_DebugFlag</b></dt>
     * <dt>0x00000100</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>DebugFlag</b> field is populated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="Set_PingRetries"></a><a id="set_pingretries"></a><a id="SET_PINGRETRIES"></a><dl>
     * <dt><b>Set_PingRetries</b></dt>
     * <dt>0x00000200</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>PingRetries</b> field is populated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="Set_BootFileTable"></a><a id="set_bootfiletable"></a><a id="SET_BOOTFILETABLE"></a><dl>
     * <dt><b>Set_BootFileTable</b></dt>
     * <dt>0x00000400</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>BootFileTable</b> field is populated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="Set_AuditLogState"></a><a id="set_auditlogstate"></a><a id="SET_AUDITLOGSTATE"></a><dl>
     * <dt><b>Set_AuditLogState</b></dt>
     * <dt>0x00000800</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>AuditLogState</b> field is populated.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<DHCP_SERVER_CONFIG_INFO_V4>} ConfigInfo <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_server_config_info_v4">DHCP_SERVER_CONFIG_INFO_V4</a> structure that contains the specific DHCP server configuration settings as indicated by the bit flags set in <i>FieldsToSet</i>.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
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
     * This call was performed by a client who is not a member of the "DHCP Administrators" security group.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_JET_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred while accessing the DHCP server's database.
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
     * One of the parameters provides an invalid value.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpserversetconfigv4
     * @since windowsserver2008
     */
    static DhcpServerSetConfigV4(ServerIpAddress, FieldsToSet, ConfigInfo) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpServerSetConfigV4", "ptr", ServerIpAddress, "uint", FieldsToSet, "ptr", ConfigInfo, "uint")
        return result
    }

    /**
     * Returns the specific configuration settings of a DHCP server.
     * @param {PWSTR} ServerIpAddress Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Pointer<DHCP_SERVER_CONFIG_INFO_V4>} ConfigInfo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_server_config_info_v4">DHCP_SERVER_CONFIG_INFO_V4</a> structure that contains the specific configuration information for the DHCP server.
     * 
     * <div class="alert"><b>Note</b>  <p class="note">The memory for this parameter must be free using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dhcpsapi/nf-dhcpsapi-dhcprpcfreememory">DhcpRpcFreeMemory</a>.
     * 
     * </div>
     * <div> </div>
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
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
     * This call was performed by a client who is not a member of the "DHCP Administrators" security group.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_JET_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred while accessing the DHCP server's database.
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
     * One of the parameters provides an invalid value.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpservergetconfigv4
     * @since windowsserver2008
     */
    static DhcpServerGetConfigV4(ServerIpAddress, ConfigInfo) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpServerGetConfigV4", "ptr", ServerIpAddress, "ptr", ConfigInfo, "uint")
        return result
    }

    /**
     * Sets a subnet as the superscope on a DHCP server.
     * @param {PWSTR} ServerIpAddress Pointer to a Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Integer} SubnetAddress <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_ADDRESS</a> value that contains the IP address of the subnet that will be defined as the superscope.
     * @param {PWSTR} SuperScopeName Pointer to a Unicode string that specifies the new name of the superscope.
     * @param {BOOL} ChangeExisting Specifies whether or not to change an existing superscope to the supplied subnet. If this parameter is <b>TRUE</b> and another subnet is set as the superscope, change the superscope to the supplied subnet; otherwise, if set to <b>FALSE</b> and  another subnet is defined as the superscope, do not change it.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
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
     * This call was performed by a client who is not a member of the "DHCP Administrators" security group.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_JET_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred while accessing the DHCP server's database.
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
     * One of the parameters provides an invalid value.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpsetsuperscopev4
     * @since windowsserver2008
     */
    static DhcpSetSuperScopeV4(ServerIpAddress, SubnetAddress, SuperScopeName, ChangeExisting) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress
        SuperScopeName := SuperScopeName is String ? StrPtr(SuperScopeName) : SuperScopeName

        result := DllCall("DHCPSAPI.dll\DhcpSetSuperScopeV4", "ptr", ServerIpAddress, "uint", SubnetAddress, "ptr", SuperScopeName, "ptr", ChangeExisting, "uint")
        return result
    }

    /**
     * Deletes a superscope from the DHCP server.
     * @param {PWSTR} ServerIpAddress Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {PWSTR} SuperScopeName Unicode string that specifies the name of the superscope to delete.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
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
     * This call was performed by a client who is not a member of the "DHCP Administrators" security group.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_JET_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred while accessing the DHCP server's database.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_SUBNET_NOT_PRESENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified IPv4 subnet does not exist on the DHCP server.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpdeletesuperscopev4
     * @since windowsserver2008
     */
    static DhcpDeleteSuperScopeV4(ServerIpAddress, SuperScopeName) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress
        SuperScopeName := SuperScopeName is String ? StrPtr(SuperScopeName) : SuperScopeName

        result := DllCall("DHCPSAPI.dll\DhcpDeleteSuperScopeV4", "ptr", ServerIpAddress, "ptr", SuperScopeName, "uint")
        return result
    }

    /**
     * Returns information on the superscope of a DHCP server.
     * @param {PWSTR} ServerIpAddress Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Pointer<DHCP_SUPER_SCOPE_TABLE>} SuperScopeTable <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_super_scope_table">DHCP_SUPER_SCOPE_TABLE</a> structure that contains the returned information for the superscope of the supplied DHCP server.
     * 
     * <div class="alert"><b>Note</b>  <p class="note">The memory for this parameter must be free using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dhcpsapi/nf-dhcpsapi-dhcprpcfreememory">DhcpRpcFreeMemory</a>.
     * 
     * </div>
     * <div> </div>
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
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
     * This call was performed by a client who is not a member of the "DHCP Administrators" security group.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpgetsuperscopeinfov4
     * @since windowsserver2008
     */
    static DhcpGetSuperScopeInfoV4(ServerIpAddress, SuperScopeTable) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpGetSuperScopeInfoV4", "ptr", ServerIpAddress, "ptr", SuperScopeTable, "uint")
        return result
    }

    /**
     * Returns an enumerated list of clients with served IP addresses in the specified subnet.
     * @param {PWSTR} ServerIpAddress A UNICODE string that specifies the IP address or hostname of the DHCP server.
     * @param {Integer} SubnetAddress A  value containing the IP address of the subnet gateway. If this parameter is set to 0, then the DHCP clients for all IPv4 subnets defined on the DHCP server are returned.
     * @param {Pointer<UInt32>} ResumeHandle A pointer to a handle that identifies the enumeration operation. Initially, this value should be zero, with a successful call returning the handle value used for subsequent enumeration requests. For example, if <i>PreferredMaximum</i> is set to 1000 bytes, and 2000 bytes worth of subnet client information structures  are stored on the server, the resume handle can be used after the first 1000 bytes are retrieved to obtain the next 1000 on a subsequent call, and so forth.
     * @param {Integer} PreferredMaximum The preferred maximum number of bytes of subnet client information structures to return. If the number of remaining unenumerated options (in bytes) is less than this value, then that amount will be returned.
     * @param {Pointer<DHCP_CLIENT_INFO_ARRAY_V5>} ClientInfo A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_client_info_array_v5">DHCP_CLIENT_INFO_ARRAY_V5</a> structure containing information on the clients served under this specific subnet. If no clients are available, this field will be null.
     * @param {Pointer<UInt32>} ClientsRead A pointer to a value that specifies the number of clients returned in <i>ClientInfo</i>.
     * @param {Pointer<UInt32>} ClientsTotal A pointer to a value that specifies the total number of clients for the specified subnet stored on the DHCP server.
     * @returns {Integer} The <b>DhcpEnumSubnetClientsV5</b> function returns <b>ERROR_SUCCESS</b> upon success. 
     * 
     * On error, the function returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
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
     * The call was performed by a client who is not a member of the "DHCP Administrators" security group.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_JET_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred while accessing the DHCP server's database.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are still un-enumerated client lease records on the DHCP server for the provided IPv4 subnet. Please call this function again with the returned resume handle to obtain more of them.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpenumsubnetclientsv5
     * @since windowsserver2008
     */
    static DhcpEnumSubnetClientsV5(ServerIpAddress, SubnetAddress, ResumeHandle, PreferredMaximum, ClientInfo, ClientsRead, ClientsTotal) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpEnumSubnetClientsV5", "ptr", ServerIpAddress, "uint", SubnetAddress, "uint*", ResumeHandle, "uint", PreferredMaximum, "ptr", ClientInfo, "uint*", ClientsRead, "uint*", ClientsTotal, "uint")
        return result
    }

    /**
     * Creates a DHCP option.
     * @param {PWSTR} ServerIpAddress Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Integer} Flags Flag value that indicates whether the option is for a specific or default vendor class.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0x00000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The option value is retrieved for a default vendor class.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DHCP_FLAGS_OPTION_IS_VENDOR"></a><a id="dhcp_flags_option_is_vendor"></a><dl>
     * <dt><b>DHCP_FLAGS_OPTION_IS_VENDOR</b></dt>
     * <dt>0x00000003</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The option value is retrieved for a specific vendor class. The vendor name is supplied in <i>VendorName</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} OptionId <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_OPTION_ID</a> value that contains the unique option ID number (also called an "option code") of the new option. Many of these option ID numbers are defined; a complete list of standard DHCP and BOOTP option codes can be found in  <a href="https://www.ietf.org/rfc/rfc2132.txt">DHCP Options and BOOTP Vendor Extensions</a>.
     * @param {PWSTR} ClassName Unicode string that specifies the name of the DHCP class that will contain this option. This field is optional.
     * @param {PWSTR} VendorName Unicode string that contains a vendor name string if the class specified in <i>ClassName</i> is a vendor-specific class.
     * @param {Pointer<DHCP_OPTION>} OptionInfo <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_option">DHCP_OPTION</a> structure that contains information describing the new   DHCP option, including the name, an optional comment, and any related data items.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
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
     * This call was performed by a client who is not a member of the "DHCP Administrators" security group.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_JET_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred while accessing the DHCP server's database.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_OPTION_EXISTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified option definition already exists in the DHCP server database.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_CLASS_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified class name is unknown or incorrectly formed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpcreateoptionv5
     * @since windowsserver2008
     */
    static DhcpCreateOptionV5(ServerIpAddress, Flags, OptionId, ClassName, VendorName, OptionInfo) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress
        ClassName := ClassName is String ? StrPtr(ClassName) : ClassName
        VendorName := VendorName is String ? StrPtr(VendorName) : VendorName

        result := DllCall("DHCPSAPI.dll\DhcpCreateOptionV5", "ptr", ServerIpAddress, "uint", Flags, "uint", OptionId, "ptr", ClassName, "ptr", VendorName, "ptr", OptionInfo, "uint")
        return result
    }

    /**
     * Sets information for a specific DHCP option.
     * @param {PWSTR} ServerIpAddress Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Integer} Flags Specifies a bit flag that indicates whether or not the option is vendor-specific. If it is not, this parameter should be 0.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DHCP_FLAGS_OPTION_IS_VENDOR"></a><a id="dhcp_flags_option_is_vendor"></a><dl>
     * <dt><b>DHCP_FLAGS_OPTION_IS_VENDOR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This flag should be set if the option is provided by a vendor.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} OptionID <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_OPTION_ID</a> value that specifies the code for a specific DHCP option.
     * @param {PWSTR} ClassName Pointer to a  Unicode string that specifies the DHCP  class name of the option. This parameter is optional.
     * @param {PWSTR} VendorName Pointer to a Unicode string that specifies the vendor of the option. This parameter is optional, and should be <b>NULL</b> when <i>Flags</i> is not set to DHCP_FLAGS_OPTION_IS_VENDOR.
     * @param {Pointer<DHCP_OPTION>} OptionInfo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_option">DHCP_OPTION</a> structure that contains the information on the option specified by <i>OptionID</i>.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
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
     * This call was performed by a client who is not a member of the "DHCP Administrators" security group.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_JET_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred while accessing the DHCPv6 server's database.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_CLASS_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provided class name is either incorrect or does not exist on the DHCP server.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpsetoptioninfov5
     * @since windowsserver2008
     */
    static DhcpSetOptionInfoV5(ServerIpAddress, Flags, OptionID, ClassName, VendorName, OptionInfo) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress
        ClassName := ClassName is String ? StrPtr(ClassName) : ClassName
        VendorName := VendorName is String ? StrPtr(VendorName) : VendorName

        result := DllCall("DHCPSAPI.dll\DhcpSetOptionInfoV5", "ptr", ServerIpAddress, "uint", Flags, "uint", OptionID, "ptr", ClassName, "ptr", VendorName, "ptr", OptionInfo, "uint")
        return result
    }

    /**
     * The DhcpGetOptionInfoV5 function returns information on a specific DHCP option.
     * @param {PWSTR} ServerIpAddress Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Integer} Flags Specifies a bit flag that indicates whether or not the option is vendor-specific. If it is not, this parameter should be 0.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0x00000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The option value is retrieved for a default vendor class.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DHCP_FLAGS_OPTION_IS_VENDOR"></a><a id="dhcp_flags_option_is_vendor"></a><dl>
     * <dt><b>DHCP_FLAGS_OPTION_IS_VENDOR</b></dt>
     * <dt>0x00000003</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The option value is retrieved for a specific vendor class. The vendor name is supplied in <i>VendorName</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} OptionID <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_OPTION_ID</a> value that specifies the code for the option to retrieve information on.
     * @param {PWSTR} ClassName Unicode string that specifies the DHCP  class name of the option. This parameter is optional.
     * @param {PWSTR} VendorName Unicode string that specifies the vendor of the option. This parameter is optional, and must be null when <i>Flags</i> is not set to DHCP_FLAGS_OPTION_IS_VENDOR. If it is not set, then the option definition for the default vendor class is returned.
     * @param {Pointer<DHCP_OPTION>} OptionInfo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_option">DHCP_OPTION</a> structure that contains the returned information on the option specified by <i>OptionID</i>.
     * 
     * <div class="alert"><b>Note</b>  <p class="note">The memory for this parameter must be free using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dhcpsapi/nf-dhcpsapi-dhcprpcfreememory">DhcpRpcFreeMemory</a>.
     * 
     * </div>
     * <div> </div>
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
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
     * This call was performed by a client who is not a member of the "DHCP Administrators" security group.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_JET_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred while accessing the DHCP server's database.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_SUBNET_NOT_PRESENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified IPv4 subnet is not defined on the DHCP server.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_OPTION_NOT_PRESENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified option definition does not exist in the DHCP server database.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_NOT_RESERVED_CLIENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified DHCP client is not a reserved client. o
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpgetoptioninfov5
     * @since windowsserver2008
     */
    static DhcpGetOptionInfoV5(ServerIpAddress, Flags, OptionID, ClassName, VendorName, OptionInfo) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress
        ClassName := ClassName is String ? StrPtr(ClassName) : ClassName
        VendorName := VendorName is String ? StrPtr(VendorName) : VendorName

        result := DllCall("DHCPSAPI.dll\DhcpGetOptionInfoV5", "ptr", ServerIpAddress, "uint", Flags, "uint", OptionID, "ptr", ClassName, "ptr", VendorName, "ptr", OptionInfo, "uint")
        return result
    }

    /**
     * The DhcpEnumOptionsV5 function returns an enumerated list of DHCP options for a given user or vendor class.
     * @param {PWSTR} ServerIpAddress Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Integer} Flags A set of flags that indicate the option definition for enumeration.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0x00000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The option definitions are enumerated for a default vendor class.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DHCP_FLAGS_OPTION_IS_VENDOR"></a><a id="dhcp_flags_option_is_vendor"></a><dl>
     * <dt><b>DHCP_FLAGS_OPTION_IS_VENDOR</b></dt>
     * <dt>0x00000003</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The option definitions are enumerated for a specific vendor class.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {PWSTR} ClassName Pointer to a Unicode string that contains the name of the class whose options will be enumerated. This parameter is optional.
     * @param {PWSTR} VendorName Pointer to a Unicode string that contains the name of the vendor for the class. This parameter is optional. If a vendor class name is not provided, the default vendor class name is used.
     * @param {Pointer<UInt32>} ResumeHandle Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_RESUME_HANDLE</a> value that identifies the enumeration operation. Initially, this value should be zero, with a successful call returning the handle value used for subsequent enumeration requests. For example, if <i>PreferredMaximum</i> is set to 1000 bytes, and 2000 bytes of option definitions are stored on the server, the resume handle can be used after the first 1000 bytes are retrieved to obtain the next 1000 on a subsequent call, and so forth.
     * @param {Integer} PreferredMaximum Specifies the preferred maximum number of bytes of options to return. If the number of remaining unenumerated option definitions (in bytes) is less than this value, all option definitions are returned.
     * @param {Pointer<DHCP_OPTION_ARRAY>} Options Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_option_array">DHCP_OPTION_ARRAY</a> structure containing the returned option definitions. If there are no option definitions available on the DHCP server, this parameter will return null.
     * @param {Pointer<UInt32>} OptionsRead Pointer to a DWORD value that specifies the number of option definitions returned in <i>Options</i>.
     * @param {Pointer<UInt32>} OptionsTotal Pointer to a DWORD value that specifies the total number of unenumerated option definitions on the DHCP server.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
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
     * This call was performed by a client who is not a member of the "DHCP Administrators" security group.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_CLASS_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The supplied user or vendor class name is either incorrect or unknown.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpenumoptionsv5
     * @since windowsserver2008
     */
    static DhcpEnumOptionsV5(ServerIpAddress, Flags, ClassName, VendorName, ResumeHandle, PreferredMaximum, Options, OptionsRead, OptionsTotal) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress
        ClassName := ClassName is String ? StrPtr(ClassName) : ClassName
        VendorName := VendorName is String ? StrPtr(VendorName) : VendorName

        result := DllCall("DHCPSAPI.dll\DhcpEnumOptionsV5", "ptr", ServerIpAddress, "uint", Flags, "ptr", ClassName, "ptr", VendorName, "uint*", ResumeHandle, "uint", PreferredMaximum, "ptr", Options, "uint*", OptionsRead, "uint*", OptionsTotal, "uint")
        return result
    }

    /**
     * Removes the definition of a specific option for a specific user class and vendor class at the default option level on the DHCP server. This extends the functionality in DhcpRemoveOption with support for specific class and vendor names.
     * @param {PWSTR} ServerIpAddress Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Integer} Flags Specifies a bit flag that indicates whether or not the option is vendor-specific. If it is not, this parameter should be 0.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0x00000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This flag should be set if the option is removed for the default vendor class..
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DHCP_FLAGS_OPTION_IS_VENDOR"></a><a id="dhcp_flags_option_is_vendor"></a><dl>
     * <dt><b>DHCP_FLAGS_OPTION_IS_VENDOR</b></dt>
     * <dt>0x00000003</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This flag should be set if the option is removed for a specific vendor class..
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} OptionID <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_OPTION_ID</a> value that specifies the code for the option  to remove.
     * @param {PWSTR} ClassName Unicode string that specifies the DHCP  class name of the option. This parameter is optional.
     * @param {PWSTR} VendorName Unicode string that specifies the vendor of the option. This parameter is optional, and should be <b>NULL</b> when <i>Flags</i> is not set to DHCP_FLAGS_OPTION_IS_VENDOR.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
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
     * This call was performed by a client who is not a member of the "DHCP Administrators" security group.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_JET_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred while accessing the DHCP server's database.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_OPTION_NOT_PRESENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified option definition does not exist in the DHCP server database.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_CLASS_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The supplied class name is either unknown or incorrect.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpremoveoptionv5
     * @since windowsserver2008
     */
    static DhcpRemoveOptionV5(ServerIpAddress, Flags, OptionID, ClassName, VendorName) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress
        ClassName := ClassName is String ? StrPtr(ClassName) : ClassName
        VendorName := VendorName is String ? StrPtr(VendorName) : VendorName

        result := DllCall("DHCPSAPI.dll\DhcpRemoveOptionV5", "ptr", ServerIpAddress, "uint", Flags, "uint", OptionID, "ptr", ClassName, "ptr", VendorName, "uint")
        return result
    }

    /**
     * The DhcpSetOptionValueV5 function sets information for a specific option value on the DHCP server. This function extends the functionality provided by DhcpSetOptionValue by allowing the caller to specify a class and/or vendor for the option.
     * @param {PWSTR} ServerIpAddress Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Integer} Flags Specifies a bit flag that indicates whether or not the option is vendor-specific. If it is not, this 
     *       parameter should be 0.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DHCP_FLAGS_OPTION_IS_VENDOR"></a><a id="dhcp_flags_option_is_vendor"></a><dl>
     * <dt><b>DHCP_FLAGS_OPTION_IS_VENDOR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This flag should be set if the option is provided by a vendor.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} OptionId DHCP_OPTION_ID value that contains the unique option ID number (also called an "option code") of the 
     *       option being set. Many of these option ID numbers are defined; a complete list of standard DHCP and BOOTP 
     *       option codes can be found at 
     *       <a href="http://www.ietf.org/rfc/rfc2132.txt">http://www.ietf.org/rfc/rfc2132.txt</a>.
     * @param {PWSTR} ClassName Unicode string that specifies the DHCP  class  of the option. This parameter is optional.
     * @param {PWSTR} VendorName Unicode string that specifies the vendor of the option. This parameter is optional, and should be <b>NULL</b> 
     *       when <i>Flags</i> is not set to DHCP_FLAGS_OPTION_IS_VENDOR.
     * @param {Pointer<DHCP_OPTION_SCOPE_INFO>} ScopeInfo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_option_scope_info">DHCP_OPTION_SCOPE_INFO</a> 
     *       structure that contains information describing the DHCP scope this option value will be set on.
     * @param {Pointer<DHCP_OPTION_DATA>} OptionValue Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_option_data">DHCP_OPTION_DATA</a> structure that 
     *       contains the data value corresponding to the DHCP option code specified by 
     *       <i>OptionID</i>.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns 
     *        one of the 
     *        <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpsetoptionvaluev5
     * @since windowsserver2000
     */
    static DhcpSetOptionValueV5(ServerIpAddress, Flags, OptionId, ClassName, VendorName, ScopeInfo, OptionValue) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress
        ClassName := ClassName is String ? StrPtr(ClassName) : ClassName
        VendorName := VendorName is String ? StrPtr(VendorName) : VendorName

        result := DllCall("DHCPSAPI.dll\DhcpSetOptionValueV5", "ptr", ServerIpAddress, "uint", Flags, "uint", OptionId, "ptr", ClassName, "ptr", VendorName, "ptr", ScopeInfo, "ptr", OptionValue, "uint")
        return result
    }

    /**
     * Sets option codes and their associated data values for a specific scope defined on the DHCP server. This function extends the functionality provided by DhcpSetOptionValues by allowing the caller to specify a class and/or vendor for the options.
     * @param {PWSTR} ServerIpAddress Unicode string that specifies the IPv4 address of the DHCP server.
     * @param {Integer} Flags This parameter must be set to 0 and ignored upon receipt.
     * @param {PWSTR} ClassName Unicode string that specifies the DHCP  class  of the options. This parameter is optional.
     * @param {PWSTR} VendorName Unicode string that specifies the vendor of the options. If no vendor class is specified, then the option value is set for the default vendor class. This parameter is optional.
     * @param {Pointer<DHCP_OPTION_SCOPE_INFO>} ScopeInfo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_option_scope_info">DHCP_OPTION_SCOPE_INFO</a> structure that contains information describing the DHCP scope these option values will be set on. This parameter indicates whether the option value is set for the default, server, or scope level, or for an IPv4 reservation.
     * @param {Pointer<DHCP_OPTION_VALUE_ARRAY>} OptionValues Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_option_value_array">DHCP_OPTION_VALUE_ARRAY</a> structure that contains a list of option codes and the corresponding data value that will be set for them.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_JET_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred while accessing the DHCP server database.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_SUBNET_NOT_PRESENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified IPv4 subnet does not exist on the DHCP server.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_OPTION_NOT_PRESENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified option definition could not be found in the DHCP server database.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_NOT_RESERVED_CLIENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified DHCP client is not an IPv4 reserved client.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_CLASS_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified class name cannot be found in the DHCP server database.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpsetoptionvaluesv5
     * @since windowsserver2008
     */
    static DhcpSetOptionValuesV5(ServerIpAddress, Flags, ClassName, VendorName, ScopeInfo, OptionValues) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress
        ClassName := ClassName is String ? StrPtr(ClassName) : ClassName
        VendorName := VendorName is String ? StrPtr(VendorName) : VendorName

        result := DllCall("DHCPSAPI.dll\DhcpSetOptionValuesV5", "ptr", ServerIpAddress, "uint", Flags, "ptr", ClassName, "ptr", VendorName, "ptr", ScopeInfo, "ptr", OptionValues, "uint")
        return result
    }

    /**
     * The DhcpGetOptionValueV5 function retrieves a DHCP option value (the option code and associated data) for a particular scope.
     * @param {PWSTR} ServerIpAddress Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Integer} Flags Flag value that indicates whether the option is for a specific or default vendor class.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0x00000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The option value is retrieved for a default vendor class.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DHCP_FLAGS_OPTION_IS_VENDOR"></a><a id="dhcp_flags_option_is_vendor"></a><dl>
     * <dt><b>DHCP_FLAGS_OPTION_IS_VENDOR</b></dt>
     * <dt>0x00000003</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The option value is retrieved for a specific vendor class. The vendor name is supplied in <i>VendorName</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} OptionID <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_OPTION_ID</a> value that specifies the code for the option value to retrieve.
     * @param {PWSTR} ClassName Unicode string that specifies the DHCP  class name of the option. This parameter is optional.
     * @param {PWSTR} VendorName Unicode string that specifies the vendor of the option. This parameter is optional, and should be null when <i>Flags</i> is not set to DHCP_FLAGS_OPTION_IS_VENDOR. If the vendor class is not specified, the option value is returned for the default vendor class.
     * @param {Pointer<DHCP_OPTION_SCOPE_INFO>} ScopeInfo <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_option_scope_info">DHCP_OPTION_SCOPE_INFO</a> structure that contains information on the scope where the option value is set.
     * @param {Pointer<DHCP_OPTION_VALUE>} OptionValue <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_option_value">DHCP_OPTION_VALUE</a> structure that contains the returned option code and data.
     * 
     * <div class="alert"><b>Note</b>  <p class="note">The memory for this parameter must be free using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dhcpsapi/nf-dhcpsapi-dhcprpcfreememory">DhcpRpcFreeMemory</a>.
     * 
     * </div>
     * <div> </div>
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
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
     * This call was performed by a client who is not a member of the "DHCP Administrators" security group.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_JET_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred while accessing the DHCP server's database.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_SUBNET_NOT_PRESENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified IPv4 subnet is not defined on the DHCP server.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_OPTION_NOT_PRESENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified option definition does not exist in the DHCP server database.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_NOT_RESERVED_CLIENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified DHCP client is not a reserved client.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpgetoptionvaluev5
     * @since windowsserver2008
     */
    static DhcpGetOptionValueV5(ServerIpAddress, Flags, OptionID, ClassName, VendorName, ScopeInfo, OptionValue) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress
        ClassName := ClassName is String ? StrPtr(ClassName) : ClassName
        VendorName := VendorName is String ? StrPtr(VendorName) : VendorName

        result := DllCall("DHCPSAPI.dll\DhcpGetOptionValueV5", "ptr", ServerIpAddress, "uint", Flags, "uint", OptionID, "ptr", ClassName, "ptr", VendorName, "ptr", ScopeInfo, "ptr", OptionValue, "uint")
        return result
    }

    /**
     * Retrieves the option value for a specific option defined on the DHCPv6 server for a specific user or vendor class.
     * @param {PWSTR} ServerIpAddress Unicode string that specifies the IPv6 address or hostname of the DHCPv6 server.
     * @param {Integer} Flags Flag value that indicates whether the option is for a specific or default vendor class.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0x00000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The option value is retrieved for a default vendor class.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DHCP_FLAGS_OPTION_IS_VENDOR"></a><a id="dhcp_flags_option_is_vendor"></a><dl>
     * <dt><b>DHCP_FLAGS_OPTION_IS_VENDOR</b></dt>
     * <dt>0x00000003</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The option value is retrieved for a specific vendor class. The vendor name is supplied in <i>VendorName</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} OptionID <b>DHCP_OPTION_ID</b> value that specifies the option identifier for the option being retrieved.
     * @param {PWSTR} ClassName Pointer to a null-terminated Unicode string that contains the name of the user class for which the option value is being requested. This parameter is optional.
     * @param {PWSTR} VendorName Pointer to a null-terminated Unicode string that contains the name of the vendor class for which the option value is being requested. This parameter is optional; if no value is specified, the default vendor class is assumed.
     * @param {Pointer<DHCP_OPTION_SCOPE_INFO6>} ScopeInfo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_option_scope_info6">DHCP_OPTION_SCOPE_INFO6</a> structure that contains information about the DHCPv6 scope for which the option is value is requested. Specifically, it defines whether the option is being retrieved for the default, server, or scope level, or for a specific IPv6 reservation.
     * @param {Pointer<DHCP_OPTION_VALUE>} OptionValue Pointer to the address of a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_option_value">DHCP_OPTION_VALUE</a> structure returned by the operation, and which contains the option value corresponding to <i>OptionID</i>.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
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
     * This call was performed by a client who is not a member of the "DHCP Administrators" security group.
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
     * The system cannot find the specified file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_SUBNET_NOT_PRESENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified subnet is not defined on the DHCPv6 server.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_OPTION_NOT_PRESENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified option is not defined at the specified level on the DHCPv6 server.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_NOT_RESERVED_CLIENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The reserved IPv6 client is not defined on the DHCPv6 server.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpgetoptionvaluev6
     * @since windowsserver2008
     */
    static DhcpGetOptionValueV6(ServerIpAddress, Flags, OptionID, ClassName, VendorName, ScopeInfo, OptionValue) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress
        ClassName := ClassName is String ? StrPtr(ClassName) : ClassName
        VendorName := VendorName is String ? StrPtr(VendorName) : VendorName

        result := DllCall("DHCPSAPI.dll\DhcpGetOptionValueV6", "ptr", ServerIpAddress, "uint", Flags, "uint", OptionID, "ptr", ClassName, "ptr", VendorName, "ptr", ScopeInfo, "ptr", OptionValue, "uint")
        return result
    }

    /**
     * The DhcpEnumOptionValuesV5 function returns an enumerated list of option values (just the option data and the associated ID number) for a specific scope within a given user or vendor class.
     * @param {PWSTR} ServerIpAddress Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Integer} Flags Specifies a bit flag that indicates whether or not the option is vendor specific. If it is not vendor specific, this parameter must be 0.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0x00000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The option values are enumerated for a default vendor class.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DHCP_FLAGS_OPTION_IS_VENDOR"></a><a id="dhcp_flags_option_is_vendor"></a><dl>
     * <dt><b>DHCP_FLAGS_OPTION_IS_VENDOR</b></dt>
     * <dt>0x00000003</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The option values are enumerated for a specific vendor class.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {PWSTR} ClassName Pointer to a Unicode string that contains the name of the class whose scope option values will be enumerated.
     * @param {PWSTR} VendorName Pointer to a Unicode string that contains the name of the vendor for the class. This parameter is optional. If a vendor class name is not provided, the option values enumerated for a default vendor class.
     * @param {Pointer<DHCP_OPTION_SCOPE_INFO>} ScopeInfo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_option_scope_info">DHCP_OPTION_SCOPE_INFO</a> structure that contains the  scope for which the option values are defined. This value defines the option values that will be retrieved from the server, scope, or default level, or for an IPv4 reservation.
     * @param {Pointer<UInt32>} ResumeHandle Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_RESUME_HANDLE</a> value that identifies the enumeration operation. Initially, this value should be zero, with a successful call returning the handle value used for subsequent enumeration requests. For example, if <i>PreferredMaximum</i> is set to 1000 bytes, and 2000 bytes' worth of option values  are stored on the server, the resume handle can be used after the first 1000 bytes are retrieved to obtain the next 1000 on a subsequent call, and so forth.
     * @param {Integer} PreferredMaximum Specifies the preferred maximum number of bytes of option values to return. If the number of remaining unenumerated options (in bytes) is less than this value, all option values are returned.
     * @param {Pointer<DHCP_OPTION_VALUE_ARRAY>} OptionValues Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_option_value_array">DHCP_OPTION_VALUE_ARRAY</a> structure that contains the enumerated option values returned for the specified scope. If there are no option values available for this scope on the DHCP server, this parameter will return null.
     * @param {Pointer<UInt32>} OptionsRead Pointer to a DWORD value that specifies the number of option values returned in <i>OptionValues</i>.
     * @param {Pointer<UInt32>} OptionsTotal Pointer to a DWORD value that specifies the total number of as-yet unenumerated option values for this scope stored on the DHCP server.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
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
     * This call was performed by a client who is not a member of the "DHCP Administrators" security group.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_CLASS_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The supplied user or vendor class name is either incorrect or unknown.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_SUBNET_NOT_PRESENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified IPv4 subnet is not defined on the DHCP server.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_NOT_RESERVED_CLIENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified DHCP client is not a reserved client.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpenumoptionvaluesv5
     * @since windowsserver2008
     */
    static DhcpEnumOptionValuesV5(ServerIpAddress, Flags, ClassName, VendorName, ScopeInfo, ResumeHandle, PreferredMaximum, OptionValues, OptionsRead, OptionsTotal) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress
        ClassName := ClassName is String ? StrPtr(ClassName) : ClassName
        VendorName := VendorName is String ? StrPtr(VendorName) : VendorName

        result := DllCall("DHCPSAPI.dll\DhcpEnumOptionValuesV5", "ptr", ServerIpAddress, "uint", Flags, "ptr", ClassName, "ptr", VendorName, "ptr", ScopeInfo, "uint*", ResumeHandle, "uint", PreferredMaximum, "ptr", OptionValues, "uint*", OptionsRead, "uint*", OptionsTotal, "uint")
        return result
    }

    /**
     * The DhcpRemoveOptionValueV5 function removes an option value from a scope defined on the DHCP server.
     * @param {PWSTR} ServerIpAddress Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Integer} Flags Specifies a bit flag that indicates whether or not the option is vendor-specific. If it is not, this parameter should be zero.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DHCP_FLAGS_OPTION_IS_VENDOR"></a><a id="dhcp_flags_option_is_vendor"></a><dl>
     * <dt><b>DHCP_FLAGS_OPTION_IS_VENDOR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This flag should be set if the option is provided by a vendor.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} OptionID <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_OPTION_ID</a> value that specifies the code for the option value to remove.
     * @param {PWSTR} ClassName Unicode string that specifies the DHCP  class name of the option value. This parameter is optional.
     * @param {PWSTR} VendorName Unicode string that specifies the vendor of the option. This parameter is optional, and should be <b>NULL</b> when <i>Flags</i> is not set to DHCP_FLAGS_OPTION_IS_VENDOR.
     * @param {Pointer<DHCP_OPTION_SCOPE_INFO>} ScopeInfo <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_option_scope_info">DHCP_OPTION_SCOPE_INFO</a> structure that contains information describing the specific scope to remove the option value from.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpremoveoptionvaluev5
     * @since windowsserver2000
     */
    static DhcpRemoveOptionValueV5(ServerIpAddress, Flags, OptionID, ClassName, VendorName, ScopeInfo) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress
        ClassName := ClassName is String ? StrPtr(ClassName) : ClassName
        VendorName := VendorName is String ? StrPtr(VendorName) : VendorName

        result := DllCall("DHCPSAPI.dll\DhcpRemoveOptionValueV5", "ptr", ServerIpAddress, "uint", Flags, "uint", OptionID, "ptr", ClassName, "ptr", VendorName, "ptr", ScopeInfo, "uint")
        return result
    }

    /**
     * Creates a custom option class.
     * @param {PWSTR} ServerIpAddress Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Integer} ReservedMustBeZero Reserved. This field must be set to zero.
     * @param {Pointer<DHCP_CLASS_INFO>} ClassInfo <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_class_info">DHCP_CLASS_INFO</a> structure that contains the specific option class data.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
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
     * This call was performed by a client who is not a member of the "DHCP Administrators" security group.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_JET_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred while accessing the DHCP server's database.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_CLASS_ALREADY_EXISTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified class name is already defined on the DHCP server, or the class information is already in use..
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpcreateclass
     * @since windowsserver2008
     */
    static DhcpCreateClass(ServerIpAddress, ReservedMustBeZero, ClassInfo) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpCreateClass", "ptr", ServerIpAddress, "uint", ReservedMustBeZero, "ptr", ClassInfo, "uint")
        return result
    }

    /**
     * Modifies a DHCP class defined on the server.
     * @param {PWSTR} ServerIpAddress Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Integer} ReservedMustBeZero Reserved. This value must be set to 0.
     * @param {Pointer<DHCP_CLASS_INFO>} ClassInfo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_class_info">DHCP_CLASS_INFO</a> structure that contains the new information for the class.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
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
     * This call was performed by a client who is not a member of the "DHCP Administrators" security group.
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
     * The <a href="/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_class_info">DHCP_CLASS_INFO</a> structure provided in <i>ClassInfo</i> has null or invalid values for the <b>ClassName</b> or <b>ClassData</b> member (or both).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_CLASS_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A class name could not be found that matches the provided information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_JET_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred while accessing the DHCP server's database.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_CLASS_ALREADY_EXISTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The new class name is currently in use, or the new class information is currently in use.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpmodifyclass
     * @since windowsserver2008
     */
    static DhcpModifyClass(ServerIpAddress, ReservedMustBeZero, ClassInfo) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpModifyClass", "ptr", ServerIpAddress, "uint", ReservedMustBeZero, "ptr", ClassInfo, "uint")
        return result
    }

    /**
     * Deletes a DHCP class from the DHCP server.
     * @param {PWSTR} ServerIpAddress Pointer to a Unicode string that contains the IPv6 address of the DHCP server. This string is used as a handle for resolving RPC API calls.
     * @param {Integer} ReservedMustBeZero Reserved. This parameter must be set to 0.
     * @param {PWSTR} ClassName Unicode string that specifies the name of the DHCP class to delete.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
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
     * This call was performed by a client who is not a member of the "DHCP Administrators" security group.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_JET_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred while accessing the DHCP server's database.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_CLASS_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The class name could not be found in the database.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_DELETE_BUILTIN_CLASS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The class is a built-in class and cannot be deleted.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpdeleteclass
     * @since windowsserver2008
     */
    static DhcpDeleteClass(ServerIpAddress, ReservedMustBeZero, ClassName) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress
        ClassName := ClassName is String ? StrPtr(ClassName) : ClassName

        result := DllCall("DHCPSAPI.dll\DhcpDeleteClass", "ptr", ServerIpAddress, "uint", ReservedMustBeZero, "ptr", ClassName, "uint")
        return result
    }

    /**
     * The DhcpGetClassInfo function returns the user or vendor class information configured on a specific DHCP server.
     * @param {PWSTR} ServerIpAddress Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Integer} ReservedMustBeZero Reserved. This parameter must be set to 0.
     * @param {Pointer<DHCP_CLASS_INFO>} PartialClassInfo <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_class_info">DHCP_CLASS_INFO</a> structure that contains data provided by the caller for the following members, with all other fields initialized. 
     * 
     * <ul>
     * <li><b>ClassName</b></li>
     * <li><b>ClassData</b></li>
     * <li><b>ClassDataLength</b></li>
     * </ul>
     * These fields must not be null.
     * @param {Pointer<DHCP_CLASS_INFO>} FilledClassInfo <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_class_info">DHCP_CLASS_INFO</a> structure returned after lookup that contains the complete class information.
     * 
     * <div class="alert"><b>Note</b>  <p class="note">The memory for this parameter must be free using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dhcpsapi/nf-dhcpsapi-dhcprpcfreememory">DhcpRpcFreeMemory</a>.
     * 
     * </div>
     * <div> </div>
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
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
     * This call was performed by a client who is not a member of the "DHCP Administrators" security group.
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
     * The <a href="/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_class_info">DHCP_CLASS_INFO</a> structure provided in <i>PartialClassInfo</i> has null or zero values for one or more of the required members.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_CLASS_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A class name could not be found that matches the provided information.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpgetclassinfo
     * @since windowsserver2008
     */
    static DhcpGetClassInfo(ServerIpAddress, ReservedMustBeZero, PartialClassInfo, FilledClassInfo) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpGetClassInfo", "ptr", ServerIpAddress, "uint", ReservedMustBeZero, "ptr", PartialClassInfo, "ptr", FilledClassInfo, "uint")
        return result
    }

    /**
     * Enumerates the user or vendor classes configured for the DHCP server.
     * @param {PWSTR} ServerIpAddress Pointer to a Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Integer} ReservedMustBeZero Reserved. This field must be set to zero.
     * @param {Pointer<UInt32>} ResumeHandle Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_RESUME_HANDLE</a> value that identifies the enumeration operation. Initially, this value should be zero, with a successful call returning the handle value used for subsequent enumeration requests. For example, if <i>PreferredMaximum</i> is set to 100 classes, and 200 classes are stored on the server, the resume handle can be used after the first 100 classes are retrieved to obtain the next 100 on a subsequent call, and so forth.
     * @param {Integer} PreferredMaximum Specifies the preferred maximum number of classes to return. If the number of remaining unenumerated classes is less than this value, then that amount will be returned. To retrieve all classes available on the DHCP server, set this parameter to 0xFFFFFFFF.
     * @param {Pointer<DHCP_CLASS_INFO_ARRAY>} ClassInfoArray Pointer to a  <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_class_info_array">DHCP_CLASS_INFO_ARRAY</a> structure that contains the returned classes. If there are no classes available on the DHCP server, this parameter will return null.
     * @param {Pointer<UInt32>} nRead Pointer to a DWORD value that specifies the number of classes returned in <i>ClassInfoArray</i>.
     * @param {Pointer<UInt32>} nTotal Pointer to a DWORD value that specifies the total number of classes stored on the DHCP server.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
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
     * This call was performed by a client who is not a member of the "DHCP Administrators" security group.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_JET_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred while accessing the DHCP server's database.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpenumclasses
     * @since windowsserver2008
     */
    static DhcpEnumClasses(ServerIpAddress, ReservedMustBeZero, ResumeHandle, PreferredMaximum, ClassInfoArray, nRead, nTotal) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpEnumClasses", "ptr", ServerIpAddress, "uint", ReservedMustBeZero, "uint*", ResumeHandle, "uint", PreferredMaximum, "ptr", ClassInfoArray, "uint*", nRead, "uint*", nTotal, "uint")
        return result
    }

    /**
     * Returns an array that contains all options defined on the DHCP server.
     * @param {PWSTR} ServerIpAddress Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Integer} Flags Specifies a bit flag that indicates whether or not the options are vendor-specific. If the qualification of vendor options is not necessary, this parameter should be 0.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DHCP_FLAGS_OPTION_IS_VENDOR"></a><a id="dhcp_flags_option_is_vendor"></a><dl>
     * <dt><b>DHCP_FLAGS_OPTION_IS_VENDOR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This flag should be set if vendor-specific options are desired.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<DHCP_ALL_OPTIONS>} OptionStruct Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_all_options">DHCP_ALL_OPTIONS</a> structure containing every option defined for a vendor or default class. If there are no options available on the server, this value will be null.
     * 
     * <div class="alert"><b>Note</b>  <p class="note">The memory for this parameter must be free using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dhcpsapi/nf-dhcpsapi-dhcprpcfreememory">DhcpRpcFreeMemory</a>.
     * 
     * </div>
     * <div> </div>
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_JET_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred while accessing the DHCP server database.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpgetalloptions
     * @since windowsserver2008
     */
    static DhcpGetAllOptions(ServerIpAddress, Flags, OptionStruct) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpGetAllOptions", "ptr", ServerIpAddress, "uint", Flags, "ptr", OptionStruct, "uint")
        return result
    }

    /**
     * The DhcpGetAllOptionsV6 function returns an array that contains all options defined on the DHCP server.
     * @param {PWSTR} ServerIpAddress Pointer to a Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Integer} Flags Specifies a bit flag that indicates whether or not the options are vendor-specific. If the qualification of vendor options is not necessary, this parameter should be 0.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DHCP_FLAGS_OPTION_IS_VENDOR"></a><a id="dhcp_flags_option_is_vendor"></a><dl>
     * <dt><b>DHCP_FLAGS_OPTION_IS_VENDOR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This flag should be set if vendor-specific options are desired.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<DHCP_ALL_OPTIONS>} OptionStruct Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_all_options">DHCP_ALL_OPTIONS</a> structure containing every option defined on the DHCP server. If there are no options available on the server, this value will be null.
     * 
     * <div class="alert"><b>Note</b>  <p class="note">The memory for this parameter must be free using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dhcpsapi/nf-dhcpsapi-dhcprpcfreememory">DhcpRpcFreeMemory</a>.
     * 
     * </div>
     * <div> </div>
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
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
     * The parameters were invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No more items to enumerate.
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
     * Memory failure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * More data is available to enumerate.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpgetalloptionsv6
     * @since windowsserver2008
     */
    static DhcpGetAllOptionsV6(ServerIpAddress, Flags, OptionStruct) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpGetAllOptionsV6", "ptr", ServerIpAddress, "uint", Flags, "ptr", OptionStruct, "uint")
        return result
    }

    /**
     * Returns an array that contains all option values defined for a specific scope on the DHCP server.
     * @param {PWSTR} ServerIpAddress Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Integer} Flags Specifies a bit flag that indicates whether the options are vendor-specific. If the qualification of vendor options is not necessary, this parameter should be 0.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DHCP_FLAGS_OPTION_IS_VENDOR"></a><a id="dhcp_flags_option_is_vendor"></a><dl>
     * <dt><b>DHCP_FLAGS_OPTION_IS_VENDOR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This flag should be set if vendor-specific options are desired.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<DHCP_OPTION_SCOPE_INFO>} ScopeInfo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_option_scope_info">DHCP_OPTION_SCOPE_INFO</a> structure that contains information on the specific scope whose option values will be returned. This information defines the option values that are being retrieved from the default, server, or scope level, or for a specific IPv4 reservation.
     * @param {Pointer<DHCP_ALL_OPTION_VALUES>} Values Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_all_option_values">DHCP_ALL_OPTION_VALUES</a> structure that contains the returned option values for the scope specified in <i>ScopeInfo</i>.
     * 
     * <div class="alert"><b>Note</b>  <p class="note">The memory for this parameter must be free using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dhcpsapi/nf-dhcpsapi-dhcprpcfreememory">DhcpRpcFreeMemory</a>.
     * 
     * </div>
     * <div> </div>
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
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
     * This call was performed by a client who is not a member of the "DHCP Administrators" security group.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_SUBNET_NOT_PRESENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This specified IPv4 sunet is not defined on the DHCP server.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_NOT_RESERVED_CLIENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified DHCP client is not a reserved client.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpgetalloptionvalues
     * @since windowsserver2008
     */
    static DhcpGetAllOptionValues(ServerIpAddress, Flags, ScopeInfo, Values) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpGetAllOptionValues", "ptr", ServerIpAddress, "uint", Flags, "ptr", ScopeInfo, "ptr", Values, "uint")
        return result
    }

    /**
     * The DhcpGetAllOptionValuesV6 function returns an array that contains all option values defined for a specific scope on the DHCP server.
     * @param {PWSTR} ServerIpAddress Pointer to a Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Integer} Flags Specifies a bit flag that indicates whether or not the options are vendor-specific. If the qualification of vendor options is not necessary, this parameter should be 0.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DHCP_FLAGS_OPTION_IS_VENDOR"></a><a id="dhcp_flags_option_is_vendor"></a><dl>
     * <dt><b>DHCP_FLAGS_OPTION_IS_VENDOR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This flag should be set if vendor-specific options are desired.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<DHCP_OPTION_SCOPE_INFO6>} ScopeInfo DHCP_OPTION_SCOPE_INFO6 structure that contains information on the specific scope whose option values will be returned.
     * @param {Pointer<DHCP_ALL_OPTION_VALUES>} Values <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_all_option_values">DHCP_ALL_OPTION_VALUES</a> structure that contains the returned option values for the scope specified in <i>ScopeInfo</i>.
     * 
     * <div class="alert"><b>Note</b>  <p class="note">The memory for this parameter must be free using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dhcpsapi/nf-dhcpsapi-dhcprpcfreememory">DhcpRpcFreeMemory</a>.
     * 
     * </div>
     * <div> </div>
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
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
     * The parameters were invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No more items to enumerate.
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
     * Memory failure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * More data is available to enumerate.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpgetalloptionvaluesv6
     * @since windowsserver2008
     */
    static DhcpGetAllOptionValuesV6(ServerIpAddress, Flags, ScopeInfo, Values) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpGetAllOptionValuesV6", "ptr", ServerIpAddress, "uint", Flags, "ptr", ScopeInfo, "ptr", Values, "uint")
        return result
    }

    /**
     * The DhcpEnumServers function returns an enumerated list of DHCP servers found in the directory service.
     * @param {Integer} Flags Reserved for future use. This field should be set to 0.
     * @param {Pointer<Void>} IdInfo Pointer to an address containing the server's ID block. This field should be set to null.
     * @param {Pointer<DHCPDS_SERVERS>} Servers Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcpds_servers">DHCP_SERVER_INFO_ARRAY</a>structure that contains the output list of DHCP servers.
     * @param {Pointer<Void>} CallbackFn Pointer to the callback function that will be called when the server add operation completes. This field should be null.
     * @param {Pointer<Void>} CallbackData Pointer to a data block containing the formatted structure for callback information. This field should be null.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpenumservers
     * @since windowsserver2000
     */
    static DhcpEnumServers(Flags, IdInfo, Servers, CallbackFn, CallbackData) {
        result := DllCall("DHCPSAPI.dll\DhcpEnumServers", "uint", Flags, "ptr", IdInfo, "ptr", Servers, "ptr", CallbackFn, "ptr", CallbackData, "uint")
        return result
    }

    /**
     * The DhcpAddServer function attempts to add a new server to the existing list of DHCP servers maintained in the domain directory service. If the specified DHCP server already exists in the directory service, an error is returned.
     * @param {Integer} Flags Reserved for future use. This field should be set to 0x00000000.
     * @param {Pointer<Void>} IdInfo Pointer to an address containing the server's ID block. This field should be set to null.
     * @param {Pointer<DHCPDS_SERVER>} NewServer Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcpds_server">DHCP_SERVER_INFO</a> structure containing information about the new DHCP server. The <b>DsLocation</b> and <b>DsLocType</b> members present in this structure are not valid in this implementation, and they should be set to null. The <b>Version</b> member of this structure should be set to 0.
     * @param {Pointer<Void>} CallbackFn Pointer to the callback function that will be called when the server add operation completes. This field should be null.
     * @param {Pointer<Void>} CallbackData Pointer to a data block containing the formatted structure for callback information. This field should be null.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpaddserver
     * @since windowsserver2000
     */
    static DhcpAddServer(Flags, IdInfo, NewServer, CallbackFn, CallbackData) {
        result := DllCall("DHCPSAPI.dll\DhcpAddServer", "uint", Flags, "ptr", IdInfo, "ptr", NewServer, "ptr", CallbackFn, "ptr", CallbackData, "uint")
        return result
    }

    /**
     * The DhcpDeleteServer function attempts to delete a DHCP server and any related objects (such as subnet information and IP reservations) from the directory service.
     * @param {Integer} Flags Set to zero.
     * @param {Pointer<Void>} IdInfo Set to null.
     * @param {Pointer<DHCPDS_SERVER>} NewServer Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcpds_server">DHCP_SERVER_INFO</a> structure that contains the details of the DHCP server to delete from the directory service.
     * @param {Pointer<Void>} CallbackFn Pointer to the function to call after this operation is executed. Set to null.
     * @param {Pointer<Void>} CallbackData Pointer to the list of data that will be passed to the callback function specified in <i>CallbackFn</i>. Set to null.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpdeleteserver
     * @since windowsserver2000
     */
    static DhcpDeleteServer(Flags, IdInfo, NewServer, CallbackFn, CallbackData) {
        result := DllCall("DHCPSAPI.dll\DhcpDeleteServer", "uint", Flags, "ptr", IdInfo, "ptr", NewServer, "ptr", CallbackFn, "ptr", CallbackData, "uint")
        return result
    }

    /**
     * The DhcpGetServerBindingInfo function returns endpoint bindings set on the DHCP server.
     * @param {PWSTR} ServerIpAddress Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Integer} Flags Specifies a set of flags describing the endpoints to return.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DHCP_ENDPOINT_FLAG_CANT_MODIFY"></a><a id="dhcp_endpoint_flag_cant_modify"></a><dl>
     * <dt><b>DHCP_ENDPOINT_FLAG_CANT_MODIFY</b></dt>
     * <dt>0x01</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returns unmodifiable endpoints only.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<DHCP_BIND_ELEMENT_ARRAY>} BindElementsInfo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_bind_element_array">DHCP_BIND_ELEMENT_ARRAY</a> structure that contains the server network endpoint bindings.
     * 
     * <div class="alert"><b>Note</b>  <p class="note">The memory for this parameter must be free using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dhcpsapi/nf-dhcpsapi-dhcprpcfreememory">DhcpRpcFreeMemory</a>.
     * 
     * </div>
     * <div> </div>
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpgetserverbindinginfo
     * @since windowsserver2000
     */
    static DhcpGetServerBindingInfo(ServerIpAddress, Flags, BindElementsInfo) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpGetServerBindingInfo", "ptr", ServerIpAddress, "uint", Flags, "ptr", BindElementsInfo, "uint")
        return result
    }

    /**
     * The DhcpSetServerBindingInfo function sets endpoint bindings for the DHCP server.
     * @param {PWSTR} ServerIpAddress Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Integer} Flags Specifies a set of flags describing endpoint properties.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DHCP_ENDPOINT_FLAG_CANT_MODIFY"></a><a id="dhcp_endpoint_flag_cant_modify"></a><dl>
     * <dt><b>DHCP_ENDPOINT_FLAG_CANT_MODIFY</b></dt>
     * <dt>0x01</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The endpoints cannot be modified.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<DHCP_BIND_ELEMENT_ARRAY>} BindElementInfo <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_bind_element_array">DHCP_BIND_ELEMENT_ARRAY</a> structure that contains the endpoint bindings for the DHCP server.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpsetserverbindinginfo
     * @since windowsserver2000
     */
    static DhcpSetServerBindingInfo(ServerIpAddress, Flags, BindElementInfo) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpSetServerBindingInfo", "ptr", ServerIpAddress, "uint", Flags, "ptr", BindElementInfo, "uint")
        return result
    }

    /**
     * The DhcpAddSubnetElementV5 function adds an element describing a feature or aspect of the subnet to the subnet entry in the DHCP database. Windows 2000 and earlier:  This function is not available.
     * @param {PWSTR} ServerIpAddress Pointer to a Unicode string that contains the IP address or hostname of the subnet DHCP server.
     * @param {Integer} SubnetAddress <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_ADDRESS</a> structure that contains the IP address of the subnet.
     * @param {Pointer<DHCP_SUBNET_ELEMENT_DATA_V5>} AddElementInfo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_subnet_element_data_v5">DHCP_SUBNET_ELEMENT_DATA_V5</a> structure that contains the element data to add to the subnet. The V5 structure adds support for BOOTP clients.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpaddsubnetelementv5
     * @since windowsserver2000
     */
    static DhcpAddSubnetElementV5(ServerIpAddress, SubnetAddress, AddElementInfo) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpAddSubnetElementV5", "ptr", ServerIpAddress, "uint", SubnetAddress, "ptr", AddElementInfo, "uint")
        return result
    }

    /**
     * The DhcpEnumSubnetElementsV5 function returns an enumerated list of elements for a specific DHCP subnet.
     * @param {PWSTR} ServerIpAddress Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Integer} SubnetAddress <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_ADDRESS</a> value that specifies the address of the IP subnet whose elements will be enumerated.
     * @param {Integer} EnumElementType <a href="https://docs.microsoft.com/windows/win32/api/dhcpsapi/ne-dhcpsapi-dhcp_subnet_element_type">DHCP_SUBNET_ELEMENT_TYPE</a> enumeration value that indicates the type of subnet element to enumerate.
     * @param {Pointer<UInt32>} ResumeHandle Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_RESUME_HANDLE</a> value that identifies the enumeration operation. Initially, this value should be zero, with a successful call returning the handle value used for subsequent enumeration requests. For example, if <i>PreferredMaximum</i> is set to 1000 bytes, and 2000 bytes worth of subnet elements  are stored on the server, the resume handle can be used after the first 1000 bytes are retrieved to obtain the next 1000 on a subsequent call, and so forth.
     * 
     * The presence of additional enumerable data is indicated when this function returns ERROR_MORE_DATA. If no additional enumerable data is available on the DHCPv4 server, ERROR_NO_MORE_ITEMS is returned.
     * @param {Integer} PreferredMaximum Specifies the preferred maximum number of bytes of subnet elements to return. If the number of remaining unenumerated options (in bytes) is less than this value, then that amount will be returned.
     * 
     * To retrieve all the subnet client elements for the default user and vendor class at the specified level, set this parameter to 0xFFFFFFFF.
     * @param {Pointer<DHCP_SUBNET_ELEMENT_INFO_ARRAY_V5>} EnumElementInfo Pointer to a <a href="https://docs.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_subnet_element_info_array_v5">DHCP_SUBNET_ELEMENT_INFO_ARRAY_V5</a> structure containing an enumerated list of all elements available for the specified subnet. If no elements are available for enumeration, this value will be null.
     * @param {Pointer<UInt32>} ElementsRead Pointer to a DWORD value that specifies the number of subnet elements returned in <i>EnumElementInfo</i>.
     * @param {Pointer<UInt32>} ElementsTotal Pointer to a DWORD value that specifies the total number of elements for the specified subnet.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>. Common errors include the following:
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
     * This error can be returned when this function is called with <i>EnumElementType</i> set to <b>DhcpIpRangesDhcpOnly</b> or <b>DhcpIpRangesDhcpBootp</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are more elements available to enumerate.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are no more elements left to enumerate.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpenumsubnetelementsv5
     * @since windowsserver2000
     */
    static DhcpEnumSubnetElementsV5(ServerIpAddress, SubnetAddress, EnumElementType, ResumeHandle, PreferredMaximum, EnumElementInfo, ElementsRead, ElementsTotal) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpEnumSubnetElementsV5", "ptr", ServerIpAddress, "uint", SubnetAddress, "int", EnumElementType, "uint*", ResumeHandle, "uint", PreferredMaximum, "ptr", EnumElementInfo, "uint*", ElementsRead, "uint*", ElementsTotal, "uint")
        return result
    }

    /**
     * The DhcpRemoveSubnetElementV5 function removes an element from a subnet defined on the DHCP server.
     * @param {PWSTR} ServerIpAddress Pointer to a Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Integer} SubnetAddress <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_ADDRESS</a> value that specifies the IP address of the subnet gateway and uniquely identifies it.
     * @param {Pointer<DHCP_SUBNET_ELEMENT_DATA_V5>} RemoveElementInfo <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_subnet_element_data_v5">DHCP_SUBNET_ELEMENT_DATA_V5</a> structure that contains information used to find the element that will be removed from subnet specified in <i>SubnetAddress</i>.
     * @param {Integer} ForceFlag <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ne-dhcpsapi-dhcp_force_flag">DHCP_FORCE_FLAG</a> enumeration value that indicates whether or not the clients affected by the removal of the subnet element should also be deleted.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpremovesubnetelementv5
     * @since windowsserver2000
     */
    static DhcpRemoveSubnetElementV5(ServerIpAddress, SubnetAddress, RemoveElementInfo, ForceFlag) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpRemoveSubnetElementV5", "ptr", ServerIpAddress, "uint", SubnetAddress, "ptr", RemoveElementInfo, "int", ForceFlag, "uint")
        return result
    }

    /**
     * Enumerates the reservations for a specific DHCP IPv4 subnet.
     * @param {PWSTR} ServerIpAddress Pointer to a null-terminated Unicode string that represents the IP address or hostname of the DHCP server.
     * @param {Integer} SubnetAddress <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_ADDRESS</a> structure that contains the IPv4 subnet address of the reservations to enumerate.
     * @param {Pointer<UInt32>} ResumeHandle Pointer to a  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_RESUME_HANDLE</a> structure that identifies this enumeration for use in subsequent calls to this function.
     * 
     * Initially, this value should be zero on input. If successful, the returned value should be used for subsequent enumeration requests. For example, if <i>PreferredMaximum</i> is set to 100, and 200 reservation elements are configured on the server, the resume handle can be used after the first 100 policies are retrieved to obtain the next 100 on a subsequent call.
     * @param {Integer} PreferredMaximum The maximum number of bytes of subnet reservations to return in <i>EnumInfo</i>. If <i>PreferredMaximum</i> is greater than the number of remaining non-enumerated bytes of subnet reservations on the server, the remaining number of  non-enumerated bytes is returned. To retrieve all the subnet reservation elements, set this parameter to 0xFFFFFFFF.
     * @param {Pointer<DHCP_RESERVATION_INFO_ARRAY>} EnumElementInfo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_reservation_info_array">DHCP_RESERVATION_INFO_ARRAY</a> structure that contains the reservations elements available for the specified subnet. If no elements are configured, this value is <b>NULL</b>.
     * @param {Pointer<UInt32>} ElementsRead Pointer to a <b>DWORD</b> that specifies the number of reservation elements returned in <i>EnumElementInfo</i>.
     * @param {Pointer<UInt32>} ElementsTotal Pointer to a <b>DWORD</b>  that specifies the number of reservations on the DHCP server that have not yet been enumerated.
     * @returns {Integer} If the function succeeds, it returns <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, it returns one of the following or an error code from <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the parameters were invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are more elements available to enumerate.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are no more elements left to enumerate.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_SUBNET_NOT_PRESENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * IPv4 subnet does not exist on the DHCPv4 server.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpv4enumsubnetreservations
     * @since windowsserver2012
     */
    static DhcpV4EnumSubnetReservations(ServerIpAddress, SubnetAddress, ResumeHandle, PreferredMaximum, EnumElementInfo, ElementsRead, ElementsTotal) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpV4EnumSubnetReservations", "ptr", ServerIpAddress, "uint", SubnetAddress, "uint*", ResumeHandle, "uint", PreferredMaximum, "ptr", EnumElementInfo, "uint*", ElementsRead, "uint*", ElementsTotal, "uint")
        return result
    }

    /**
     * The DhcpCreateOptionV6 function creates a DHCP option.
     * @param {PWSTR} ServerIpAddress Pointer to a Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Integer} Flags Specifies a bit flag that indicates whether or not the option is vendor-specific. If it is not, this parameter should be 0.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DHCP_FLAGS_OPTION_IS_VENDOR"></a><a id="dhcp_flags_option_is_vendor"></a><dl>
     * <dt><b>DHCP_FLAGS_OPTION_IS_VENDOR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This flag must be set if the option is provided by a vendor.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} OptionId <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_OPTION_ID</a> value that contains the unique option ID number (also called an "option code") of the new option. Many of these option ID numbers are defined; a complete list of standard DHCP and BOOTP option codes can be found at <a href="https://www.ietf.org/rfc/rfc3315.txt">http://www.ietf.org/rfc/rfc3315.txt</a>.
     * @param {PWSTR} ClassName Unicode string that specifies the name of the DHCP class that will contain this option. This field is optional.
     * @param {PWSTR} VendorName Unicode string that contains a vendor name string if the class specified in <i>ClassName</i> is a vendor-specific class.
     * @param {Pointer<DHCP_OPTION>} OptionInfo <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_option">DHCP_OPTION</a> structure that contains information describing the new   DHCP option, including the name, an optional comment, and any related data items.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
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
     * The parameters were invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DUPLICATE_TAG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified scope already exists.
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
     * The vendor name is invalid. Typically, this is because the vendor name is greater than 255 characters in length.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpcreateoptionv6
     * @since windowsserver2008
     */
    static DhcpCreateOptionV6(ServerIpAddress, Flags, OptionId, ClassName, VendorName, OptionInfo) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress
        ClassName := ClassName is String ? StrPtr(ClassName) : ClassName
        VendorName := VendorName is String ? StrPtr(VendorName) : VendorName

        result := DllCall("DHCPSAPI.dll\DhcpCreateOptionV6", "ptr", ServerIpAddress, "uint", Flags, "uint", OptionId, "ptr", ClassName, "ptr", VendorName, "ptr", OptionInfo, "uint")
        return result
    }

    /**
     * The DhcpRemoveOptionV6 function removes an option defined on the DHCP server.
     * @param {PWSTR} ServerIpAddress Pointer to a Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Integer} Flags Specifies a bit flag that indicates whether or not the option is vendor-specific. If it is not, this parameter should be 0.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DHCP_FLAGS_OPTION_IS_VENDOR"></a><a id="dhcp_flags_option_is_vendor"></a><dl>
     * <dt><b>DHCP_FLAGS_OPTION_IS_VENDOR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This flag should be set if the option is provided by a vendor.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} OptionID <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_OPTION_ID</a> value that specifies the code for the option  to remove.
     * @param {PWSTR} ClassName Unicode string that specifies the DHCP  class name of the option. This parameter is optional.
     * @param {PWSTR} VendorName Unicode string that specifies the vendor of the option. This parameter is optional, and should be <b>NULL</b> when <i>Flags</i> is not set to DHCP_FLAGS_OPTION_IS_VENDOR.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
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
     * The parameters were invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_OPTION_NOT_PRESENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified option is not present on the DHCP server.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpremoveoptionv6
     * @since windowsserver2008
     */
    static DhcpRemoveOptionV6(ServerIpAddress, Flags, OptionID, ClassName, VendorName) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress
        ClassName := ClassName is String ? StrPtr(ClassName) : ClassName
        VendorName := VendorName is String ? StrPtr(VendorName) : VendorName

        result := DllCall("DHCPSAPI.dll\DhcpRemoveOptionV6", "ptr", ServerIpAddress, "uint", Flags, "uint", OptionID, "ptr", ClassName, "ptr", VendorName, "uint")
        return result
    }

    /**
     * The DhcpEnumOptionsV6 function returns an enumerated list of DHCP options for a given class and/or vendor.
     * @param {PWSTR} ServerIpAddress Pointer to a Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Integer} Flags Specifies a bit flag that indicates whether or not the option is vendor-specific. If it is not, this parameter should be 0.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DHCP_FLAGS_OPTION_IS_VENDOR"></a><a id="dhcp_flags_option_is_vendor"></a><dl>
     * <dt><b>DHCP_FLAGS_OPTION_IS_VENDOR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This flag should be set if the option is provided by a vendor.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {PWSTR} ClassName Unicode string that contains the name of the class whose options will be enumerated.
     * @param {PWSTR} VendorName Unicode string that contains the name of the vendor for the class. This parameter is optional.
     * @param {Pointer<UInt32>} ResumeHandle Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_RESUME_HANDLE</a> value that identifies the enumeration operation. Initially, this value should be zero, with a successful call returning the handle value used for subsequent enumeration requests. For example, if <i>PreferredMaximum</i> is set to 1000 bytes, and 2000 bytes worth of options are stored on the server, the resume handle can be used after the first 1000 bytes are retrieved to obtain the next 1000 on a subsequent call, and so forth.
     * @param {Integer} PreferredMaximum Specifies the preferred maximum number of bytes of options to return. If the number of remaining unenumerated options (in bytes) is less than this value, then that amount will be returned.
     * @param {Pointer<DHCP_OPTION_ARRAY>} Options Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_option_array">DHCP_OPTION_ARRAY</a> structure containing the returned options. If there are no options available on the DHCP server, this parameter will return null.
     * @param {Pointer<UInt32>} OptionsRead Pointer to a DWORD value that specifies the number of options returned in <i>Options</i>.
     * @param {Pointer<UInt32>} OptionsTotal Pointer to a DWORD value that specifies the total number of options stored on the DHCP server.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
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
     * The parameters were invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No more items to enumerate.
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
     * Memory failure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * More data is available to enumerate.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpenumoptionsv6
     * @since windowsserver2008
     */
    static DhcpEnumOptionsV6(ServerIpAddress, Flags, ClassName, VendorName, ResumeHandle, PreferredMaximum, Options, OptionsRead, OptionsTotal) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress
        ClassName := ClassName is String ? StrPtr(ClassName) : ClassName
        VendorName := VendorName is String ? StrPtr(VendorName) : VendorName

        result := DllCall("DHCPSAPI.dll\DhcpEnumOptionsV6", "ptr", ServerIpAddress, "uint", Flags, "ptr", ClassName, "ptr", VendorName, "uint*", ResumeHandle, "uint", PreferredMaximum, "ptr", Options, "uint*", OptionsRead, "uint*", OptionsTotal, "uint")
        return result
    }

    /**
     * The DhcpRemoveOptionValueV6 function removes an option value from a scope defined on the DHCP server.
     * @param {PWSTR} ServerIpAddress Pointer to a Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Integer} Flags Specifies a bit flag that indicates whether or not the option is vendor-specific. If it is not, this parameter should be zero.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DHCP_FLAGS_OPTION_IS_VENDOR"></a><a id="dhcp_flags_option_is_vendor"></a><dl>
     * <dt><b>DHCP_FLAGS_OPTION_IS_VENDOR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This flag should be set if the option is provided by a vendor.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} OptionID <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_OPTION_ID</a> value that specifies the code for the option value to remove.
     * @param {PWSTR} ClassName Unicode string that specifies the DHCP  class name of the option value. This parameter is optional.
     * @param {PWSTR} VendorName Unicode string that specifies the vendor of the option. This parameter is optional, and should be <b>NULL</b> when <i>Flags</i> is not set to DHCP_FLAGS_OPTION_IS_VENDOR.
     * @param {Pointer<DHCP_OPTION_SCOPE_INFO6>} ScopeInfo DHCP_OPTION_SCOPE_INFO6 structure that contains information describing the specific scope to remove the option value from.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
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
     * The parameters were invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_OPTION_NOT_PRESENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified option is not present on the DHCP server.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpremoveoptionvaluev6
     * @since windowsserver2008
     */
    static DhcpRemoveOptionValueV6(ServerIpAddress, Flags, OptionID, ClassName, VendorName, ScopeInfo) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress
        ClassName := ClassName is String ? StrPtr(ClassName) : ClassName
        VendorName := VendorName is String ? StrPtr(VendorName) : VendorName

        result := DllCall("DHCPSAPI.dll\DhcpRemoveOptionValueV6", "ptr", ServerIpAddress, "uint", Flags, "uint", OptionID, "ptr", ClassName, "ptr", VendorName, "ptr", ScopeInfo, "uint")
        return result
    }

    /**
     * The DhcpGetOptionInfoV6 function returns information on a specific DHCP option.
     * @param {PWSTR} ServerIpAddress Pointer to a Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Integer} Flags Specifies a bit flag that indicates whether or not the option is vendor-specific. If it is not, this parameter should be 0.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DHCP_FLAGS_OPTION_IS_VENDOR"></a><a id="dhcp_flags_option_is_vendor"></a><dl>
     * <dt><b>DHCP_FLAGS_OPTION_IS_VENDOR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This flag should be set if the option is provided by a vendor.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} OptionID <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_OPTION_ID</a> value that specifies the code for the option to retrieve information on.
     * @param {PWSTR} ClassName Unicode string that specifies the DHCP  class name of the option. This parameter is optional.
     * @param {PWSTR} VendorName Unicode string that specifies the vendor of the option. This parameter is optional, and should be null when <i>Flags</i> is not set to DHCP_FLAGS_OPTION_IS_VENDOR.
     * @param {Pointer<DHCP_OPTION>} OptionInfo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_option">DHCP_OPTION</a> structure that contains the returned information on the option specified by <i>OptionID</i>.
     * 
     * <div class="alert"><b>Note</b>  <p class="note">The memory for this parameter must be free using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dhcpsapi/nf-dhcpsapi-dhcprpcfreememory">DhcpRpcFreeMemory</a>.
     * 
     * </div>
     * <div> </div>
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
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
     * The parameters were invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No more items to enumerate.
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
     * Memory failure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * More data is available to enumerate.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpgetoptioninfov6
     * @since windowsserver2008
     */
    static DhcpGetOptionInfoV6(ServerIpAddress, Flags, OptionID, ClassName, VendorName, OptionInfo) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress
        ClassName := ClassName is String ? StrPtr(ClassName) : ClassName
        VendorName := VendorName is String ? StrPtr(VendorName) : VendorName

        result := DllCall("DHCPSAPI.dll\DhcpGetOptionInfoV6", "ptr", ServerIpAddress, "uint", Flags, "uint", OptionID, "ptr", ClassName, "ptr", VendorName, "ptr", OptionInfo, "uint")
        return result
    }

    /**
     * The DhcpSetOptionInfoV6 function sets information for a specific DHCP option.
     * @param {PWSTR} ServerIpAddress Pointer to a Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Integer} Flags Specifies a bit flag that indicates whether or not the option is vendor-specific. If it is not, this parameter should be 0.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DHCP_FLAGS_OPTION_IS_VENDOR"></a><a id="dhcp_flags_option_is_vendor"></a><dl>
     * <dt><b>DHCP_FLAGS_OPTION_IS_VENDOR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This flag should be set if the option is provided by a vendor.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} OptionID <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_OPTION_ID</a> value that specifies the code for a specific DHCP option.
     * @param {PWSTR} ClassName Unicode string that specifies the DHCP  class name of the option. This parameter is optional.
     * @param {PWSTR} VendorName Unicode string that specifies the vendor of the option. This parameter is optional, and should be <b>NULL</b> when <i>Flags</i> is not set to DHCP_FLAGS_OPTION_IS_VENDOR.
     * @param {Pointer<DHCP_OPTION>} OptionInfo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_option">DHCP_OPTION</a> structure that contains the information on the option specified by <i>OptionID</i>.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
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
     * The parameters were invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_OPTION_NOT_PRESENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified option is not present on the DHCP server.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpsetoptioninfov6
     * @since windowsserver2008
     */
    static DhcpSetOptionInfoV6(ServerIpAddress, Flags, OptionID, ClassName, VendorName, OptionInfo) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress
        ClassName := ClassName is String ? StrPtr(ClassName) : ClassName
        VendorName := VendorName is String ? StrPtr(VendorName) : VendorName

        result := DllCall("DHCPSAPI.dll\DhcpSetOptionInfoV6", "ptr", ServerIpAddress, "uint", Flags, "uint", OptionID, "ptr", ClassName, "ptr", VendorName, "ptr", OptionInfo, "uint")
        return result
    }

    /**
     * The DhcpSetOptionValueV6 function sets information for a specific option value on the DHCP server.
     * @param {PWSTR} ServerIpAddress Pointer to a Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Integer} Flags Specifies a bit flag that indicates whether or not the option is vendor-specific. If it is not, this parameter should be 0.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DHCP_FLAGS_OPTION_IS_VENDOR"></a><a id="dhcp_flags_option_is_vendor"></a><dl>
     * <dt><b>DHCP_FLAGS_OPTION_IS_VENDOR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This flag should be set if the option is provided by a vendor.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} OptionId DHCP_OPTION_ID value that contains the unique option ID number (also called an "option code") of the option being set. Many of these option ID numbers are defined; a complete list of standard DHCP and BOOTP option codes can be found at <a href="http://www.ietf.org/rfc/rfc2132.txt">http://www.ietf.org/rfc/rfc2132.txt</a>.
     * @param {PWSTR} ClassName Unicode string that specifies the DHCP  class  of the option. This parameter is optional.
     * @param {PWSTR} VendorName Unicode string that specifies the vendor of the option. This parameter is optional, and should be <b>NULL</b> when <i>Flags</i> is not set to DHCP_FLAGS_OPTION_IS_VENDOR.
     * @param {Pointer<DHCP_OPTION_SCOPE_INFO6>} ScopeInfo Pointer to a DHCP_OPTION_SCOPE_INFO6 structure that contains information describing the DHCP scope this option value will be set on.
     * @param {Pointer<DHCP_OPTION_DATA>} OptionValue Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_option_data">DHCP_OPTION_DATA</a> structure that contains the data value corresponding to the DHCP option code specified by <i>OptionID</i>.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
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
     * The parameters were invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_OPTION_NOT_PRESENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified option is not present on the DHCP server.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpsetoptionvaluev6
     * @since windowsserver2008
     */
    static DhcpSetOptionValueV6(ServerIpAddress, Flags, OptionId, ClassName, VendorName, ScopeInfo, OptionValue) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress
        ClassName := ClassName is String ? StrPtr(ClassName) : ClassName
        VendorName := VendorName is String ? StrPtr(VendorName) : VendorName

        result := DllCall("DHCPSAPI.dll\DhcpSetOptionValueV6", "ptr", ServerIpAddress, "uint", Flags, "uint", OptionId, "ptr", ClassName, "ptr", VendorName, "ptr", ScopeInfo, "ptr", OptionValue, "uint")
        return result
    }

    /**
     * Retrieves the information about a specific IPv4 subnet defined on the DHCP server.
     * @param {PWSTR} ServerIpAddress Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Integer} SubnetAddress <b>DHCP_IP_ADDRESS</b> structure that contains the IPv4 address of the subnet for which the information will be modified.
     * @param {Pointer<DHCP_SUBNET_INFO_VQ>} SubnetInfo A <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_subnet_info_vq">DHCP_SUBNET_INFO_VQ</a> structure that contains the returned information for the subnet matching the IPv4 address specified by <i>SubnetAddress</i>.
     * 
     * <div class="alert"><b>Note</b>  <p class="note">The memory for this parameter must be free using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dhcpsapi/nf-dhcpsapi-dhcprpcfreememory">DhcpRpcFreeMemory</a>.
     * 
     * </div>
     * <div> </div>
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
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
     * This call was performed by a client who is not a member of the "DHCP Administrators" security group.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_JET_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred while accessing the DHCP server's database.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_SUBNET_NOT_PRESENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified subnet is not defined on the DHCP server.
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
     * One of the parameters provides an invalid value.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpgetsubnetinfovq
     * @since windowsserver2008
     */
    static DhcpGetSubnetInfoVQ(ServerIpAddress, SubnetAddress, SubnetInfo) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpGetSubnetInfoVQ", "ptr", ServerIpAddress, "uint", SubnetAddress, "ptr", SubnetInfo, "uint")
        return result
    }

    /**
     * The DhcpCreateSubnetVQ function creates a new IPv4 subnet and its associated NAP state information on the DHCP server.
     * @param {PWSTR} ServerIpAddress Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Integer} SubnetAddress A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_ADDRESS</a> value that contains the IPv4 address of the subnet's gateway.
     * @param {Pointer<DHCP_SUBNET_INFO_VQ>} SubnetInfo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_subnet_info_vq">DHCP_SUBNET_INFO_VQ</a> structure that contains specific settings for the subnet, including the subnet mask and IPv4 address of the  subnet gateway.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>. Commonly returned error codes include:
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
     * This call was performed by a client who is not a member of the "DHCP Administrators" security group.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_JET_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred while accessing the DHCP server's database.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_SUBNET_EXISTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The IPv4 scope parameters specified in the <i>SubnetInfo</i> parameter are incorrect. Either the IPv4 scope already exists, or its subnet address and mask are inconsistent with the subnet address and mask of an existing scope.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpcreatesubnetvq
     * @since windowsserver2008
     */
    static DhcpCreateSubnetVQ(ServerIpAddress, SubnetAddress, SubnetInfo) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpCreateSubnetVQ", "ptr", ServerIpAddress, "uint", SubnetAddress, "ptr", SubnetInfo, "uint")
        return result
    }

    /**
     * Sets information about a subnet defined on the DHCP server.
     * @param {PWSTR} ServerIpAddress Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Integer} SubnetAddress <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_ADDRESS</a> value that specifies the IP address of the subnet gateway, as well as uniquely identifies the subnet.
     * @param {Pointer<DHCP_SUBNET_INFO_VQ>} SubnetInfo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_subnet_info_vq">DHCP_SUBNET_INFO_VQ</a> structure that contains the information about the subnet.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
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
     * This call was performed by a client who is not a member of the "DHCP Administrators" security group.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_JET_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred while accessing the DHCP server's database.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_SUBNET_NOT_PRESENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified IPv4 subnet is not defined on the DHCP server.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpsetsubnetinfovq
     * @since windowsserver2008
     */
    static DhcpSetSubnetInfoVQ(ServerIpAddress, SubnetAddress, SubnetInfo) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpSetSubnetInfoVQ", "ptr", ServerIpAddress, "uint", SubnetAddress, "ptr", SubnetInfo, "uint")
        return result
    }

    /**
     * The DhcpEnumOptionValuesV6 function returns an enumerated list of option values (the option data and the associated ID number) for a specific scope within a given class.
     * @param {PWSTR} ServerIpAddress Pointer to a Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Integer} Flags Specifies a bit flag that indicates whether or not the option is vendor specific. If it is not vendor specific, this parameter should be 0.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DHCP_FLAGS_OPTION_IS_VENDOR"></a><a id="dhcp_flags_option_is_vendor"></a><dl>
     * <dt><b>DHCP_FLAGS_OPTION_IS_VENDOR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This flag should be set if the option is provided by a vendor.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {PWSTR} ClassName Unicode string that contains the name of the class whose scope's option values will be enumerated.
     * @param {PWSTR} VendorName Unicode string that contains the name of the vendor for the class. This parameter is optional.
     * @param {Pointer<DHCP_OPTION_SCOPE_INFO6>} ScopeInfo DHCP_OPTION_SCOPE_INFO6 structure that contains the  scope for which the option values are defined.
     * @param {Pointer<UInt32>} ResumeHandle Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_RESUME_HANDLE</a> value that identifies the enumeration operation. Initially, this value should be zero, with a successful call returning the handle value used for subsequent enumeration requests. For example, if <i>PreferredMaximum</i> is set to 1000 bytes, and 2000 bytes worth of option values  are stored on the server, the resume handle can be used after the first 1000 bytes are retrieved to obtain the next 1000 on a subsequent call, and so forth.
     * @param {Integer} PreferredMaximum Specifies the preferred maximum number of bytes of option values to return. If the number of remaining unenumerated options (in bytes) is less than this value, then that amount will be returned.
     * @param {Pointer<DHCP_OPTION_VALUE_ARRAY>} OptionValues Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_option_value_array">DHCP_OPTION_VALUE_ARRAY</a> structure that contains the enumerated option values returned for the specified scope. If there are no option values available for this scope on the DHCP server, this parameter will return null.
     * @param {Pointer<UInt32>} OptionsRead Pointer to a DWORD value that specifies the number of option values returned in <i>OptionValues</i>.
     * @param {Pointer<UInt32>} OptionsTotal Pointer to a DWORD value that specifies the total number of option values for this scope stored on the DHCP server.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
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
     * The parameters were invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No more items to enumerate.
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
     * Memory failure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * More data is available to enumerate.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpenumoptionvaluesv6
     * @since windowsserver2008
     */
    static DhcpEnumOptionValuesV6(ServerIpAddress, Flags, ClassName, VendorName, ScopeInfo, ResumeHandle, PreferredMaximum, OptionValues, OptionsRead, OptionsTotal) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress
        ClassName := ClassName is String ? StrPtr(ClassName) : ClassName
        VendorName := VendorName is String ? StrPtr(VendorName) : VendorName

        result := DllCall("DHCPSAPI.dll\DhcpEnumOptionValuesV6", "ptr", ServerIpAddress, "uint", Flags, "ptr", ClassName, "ptr", VendorName, "ptr", ScopeInfo, "uint*", ResumeHandle, "uint", PreferredMaximum, "ptr", OptionValues, "uint*", OptionsRead, "uint*", OptionsTotal, "uint")
        return result
    }

    /**
     * The DhcpDsInit function initializes memory within the directory service for a new DHCP server process.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpdsinit
     * @since windowsserver2000
     */
    static DhcpDsInit() {
        result := DllCall("DHCPSAPI.dll\DhcpDsInit", "uint")
        return result
    }

    /**
     * The DhcpDsCleanup function frees up directory service resources allocated for DHCP services by DhcpDsInit. This function should be called exactly once for each corresponding DHCP service process, and only when the process is terminated.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpdscleanup
     * @since windowsserver2000
     */
    static DhcpDsCleanup() {
        DllCall("DHCPSAPI.dll\DhcpDsCleanup")
    }

    /**
     * The DhcpSetThreadOptions function sets options on the currently executing DHCP thread.
     * @param {Integer} Flags Set of bit flags indicating thread settings. If no thread options are  set, the value is 0. Currently, the only bit flag that can be set is as follows.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DHCP_FLAGS_DONT_ACCESS_DS"></a><a id="dhcp_flags_dont_access_ds"></a><dl>
     * <dt><b>DHCP_FLAGS_DONT_ACCESS_DS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not access the directory service while the DHCP thread is executing. After this option is set, the only functions that can access the domain directory service are as follows:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dhcpsapi/nf-dhcpsapi-dhcpenumservers">DhcpEnumServers</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dhcpsapi/nf-dhcpsapi-dhcpaddserver">DhcpAddServer</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dhcpsapi/nf-dhcpsapi-dhcpdeleteserver">DhcpDeleteServer</a>
     * </li>
     * </ul>
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Void>} Reserved Reserved. This parameter must be set to <b>NULL</b>.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpsetthreadoptions
     * @since windowsserver2008
     */
    static DhcpSetThreadOptions(Flags, Reserved) {
        result := DllCall("DHCPSAPI.dll\DhcpSetThreadOptions", "uint", Flags, "ptr", Reserved, "uint")
        return result
    }

    /**
     * The DhcpGetThreadOptions function retrieves the current thread options as set by DhcpSetThreadOptions.
     * @param {Pointer<UInt32>} pFlags Set of bit flags as set by a previous call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dhcpsapi/nf-dhcpsapi-dhcpsetthreadoptions">DhcpSetThreadOptions</a>. If no thread options are  set, the return value is 0. Currently, the only bit flag that can be set is as follows.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DHCP_FLAGS_DONT_ACCESS_DS"></a><a id="dhcp_flags_dont_access_ds"></a><dl>
     * <dt><b>DHCP_FLAGS_DONT_ACCESS_DS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not access the directory service while the DHCP thread is executing. After this option is set, the only functions that can access the domain directory service are:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dhcpsapi/nf-dhcpsapi-dhcpenumservers">DhcpEnumServers</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dhcpsapi/nf-dhcpsapi-dhcpaddserver">DhcpAddServer</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dhcpsapi/nf-dhcpsapi-dhcpdeleteserver">DhcpDeleteServer</a>
     * </li>
     * </ul>
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Void>} Reserved Reserved. This parameter must be set to null.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpgetthreadoptions
     * @since windowsserver2008
     */
    static DhcpGetThreadOptions(pFlags, Reserved) {
        result := DllCall("DHCPSAPI.dll\DhcpGetThreadOptions", "uint*", pFlags, "ptr", Reserved, "uint")
        return result
    }

    /**
     * Returns specific attribute information from the DHCP server.
     * @param {PWSTR} ServerIpAddr Unicode string that contains the IP address of the DHCP server.
     * @param {Integer} dwReserved Reserved. This value must be zero.
     * @param {Integer} DhcpAttribId <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_ATTRIB_ID</a> value that specifies the particular DHCP server attribute to retrieve.
     * @param {Pointer<DHCP_ATTRIB>} pDhcpAttrib Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_attrib">DHCP_ATTRIB</a> structure that contains the location and type of the queried DHCP server attribute.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpserverqueryattribute
     * @since windowsserver2008
     */
    static DhcpServerQueryAttribute(ServerIpAddr, dwReserved, DhcpAttribId, pDhcpAttrib) {
        ServerIpAddr := ServerIpAddr is String ? StrPtr(ServerIpAddr) : ServerIpAddr

        result := DllCall("DHCPSAPI.dll\DhcpServerQueryAttribute", "ptr", ServerIpAddr, "uint", dwReserved, "uint", DhcpAttribId, "ptr", pDhcpAttrib, "uint")
        return result
    }

    /**
     * Returns an array of attributes set on the DHCP server.
     * @param {PWSTR} ServerIpAddr Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Integer} dwReserved Reserved. This value must be set to zero.
     * @param {Integer} dwAttribCount Specifies the number of attributes listed in <i>pDhcpAttribArr</i>.
     * @param {Pointer<UInt32>} pDhcpAttribs Specifies an array of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_ATTRIB_ID</a> values (of length <i>dwAttribCount</i>) to retrieve the corresponding attribute information from.
     * @param {Pointer<DHCP_ATTRIB_ARRAY>} pDhcpAttribArr Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_attrib_array">DHCP_ATTRIB_ARRAY</a> structure that contains the attributes directly corresponding to the attribute ID values specified in <i>pDhcpAttribs[]</i>.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpserverqueryattributes
     * @since windowsserver2008
     */
    static DhcpServerQueryAttributes(ServerIpAddr, dwReserved, dwAttribCount, pDhcpAttribs, pDhcpAttribArr) {
        ServerIpAddr := ServerIpAddr is String ? StrPtr(ServerIpAddr) : ServerIpAddr

        result := DllCall("DHCPSAPI.dll\DhcpServerQueryAttributes", "ptr", ServerIpAddr, "uint", dwReserved, "uint", dwAttribCount, "uint*", pDhcpAttribs, "ptr", pDhcpAttribArr, "uint")
        return result
    }

    /**
     * The DhcpServerRedoAuthorization function attempts to determine whether the DHCP server is authorized and restores leasing operations if it is not.
     * @param {PWSTR} ServerIpAddr Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Integer} dwReserved Reserved. This parameter should be set to 0.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpserverredoauthorization
     * @since windowsserver2000
     */
    static DhcpServerRedoAuthorization(ServerIpAddr, dwReserved) {
        ServerIpAddr := ServerIpAddr is String ? StrPtr(ServerIpAddr) : ServerIpAddr

        result := DllCall("DHCPSAPI.dll\DhcpServerRedoAuthorization", "ptr", ServerIpAddr, "uint", dwReserved, "uint")
        return result
    }

    /**
     * Sets the parameters for audit log generation on a DHCP server.
     * @param {PWSTR} ServerIpAddress Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Integer} Flags Specifies a set of bit flags for filtering the audit log. Currently, this parameter is reserved and should be set to 0.
     * @param {PWSTR} AuditLogDir Unicode string that contains the specific directory and file name  where the audit log will be stored. This string should contain the absolute path within the file system; for example, "C:\logs\dhcp\20031020.log".
     * @param {Integer} DiskCheckInterval Specifies the disk check interval for attempting to write the audit log to the specified file as the number of logged DHCP server events that should occur between checks. The default is 50 DHCP server events between checks.
     * @param {Integer} MaxLogFilesSize Specifies the maximum log file size, in bytes.
     * @param {Integer} MinSpaceOnDisk Specifies the minimum required disk space, in bytes, for  audit log storage.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
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
     * This call was performed by a client who is not a member of the "DHCP Administrators" security group.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpauditlogsetparams
     * @since windowsserver2008
     */
    static DhcpAuditLogSetParams(ServerIpAddress, Flags, AuditLogDir, DiskCheckInterval, MaxLogFilesSize, MinSpaceOnDisk) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress
        AuditLogDir := AuditLogDir is String ? StrPtr(AuditLogDir) : AuditLogDir

        result := DllCall("DHCPSAPI.dll\DhcpAuditLogSetParams", "ptr", ServerIpAddress, "uint", Flags, "ptr", AuditLogDir, "uint", DiskCheckInterval, "uint", MaxLogFilesSize, "uint", MinSpaceOnDisk, "uint")
        return result
    }

    /**
     * Returns the audit log configuration settings from the DHCP server.
     * @param {PWSTR} ServerIpAddress Pointer to a Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Integer} Flags Specifies a set of bit flags for filtering the audit log. Currently, this parameter is reserved and should be set to 0.
     * @param {Pointer<PWSTR>} AuditLogDir Unicode string that contains the directory   where the audit log is stored as an absolute path within the file system.
     * @param {Pointer<UInt32>} DiskCheckInterval Specifies the disk check interval for attempting to write the audit log to the specified file as the number of logged DHCP server events that should occur between checks. The default is 50 DHCP server events between checks.
     * @param {Pointer<UInt32>} MaxLogFilesSize Specifies the maximum log file size, in bytes.
     * @param {Pointer<UInt32>} MinSpaceOnDisk Specifies the minimum required disk space, in bytes,  for  audit log storage.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
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
     * This call was performed by a client who is not a member of the "DHCP Administrators" security group.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_JET_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred while accessing the DHCP server's database.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpauditloggetparams
     * @since windowsserver2008
     */
    static DhcpAuditLogGetParams(ServerIpAddress, Flags, AuditLogDir, DiskCheckInterval, MaxLogFilesSize, MinSpaceOnDisk) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpAuditLogGetParams", "ptr", ServerIpAddress, "uint", Flags, "ptr", AuditLogDir, "uint*", DiskCheckInterval, "uint*", MaxLogFilesSize, "uint*", MinSpaceOnDisk, "uint")
        return result
    }

    /**
     * Retrieves the current Domain Name System (DNS) credentials used by the DHCP server for client dynamic DNS registration.
     * @param {PWSTR} ServerIpAddress <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_SRV_HANDLE</a> that specifies the RPC binding to the DHCP server that will be queried.
     * @param {Integer} UnameSize Unsigned 32-bit integer that indicates the size, in bytes, to allocate for the data returned in the <i>Uname</i> buffer.
     * @param {PWSTR} Uname Pointer to a null-terminated Unicode string that contains the user name for the DNS server credentials. The size of this value cannot be larger than the size specified in <i>UnameSize</i>.
     * @param {Integer} DomainSize Unsigned 32-bit integer that indicates the size, in bytes, to allocate for the data returned in the <i>Domain</i> buffer.
     * @param {PWSTR} Domain Pointer to a null-terminated Unicode string that contains the domain name for the DNS server credentials. The size of this value cannot be larger than the size specified in <i>DomainSize</i>.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpserverquerydnsregcredentials
     * @since windowsserver2008
     */
    static DhcpServerQueryDnsRegCredentials(ServerIpAddress, UnameSize, Uname, DomainSize, Domain) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress
        Uname := Uname is String ? StrPtr(Uname) : Uname
        Domain := Domain is String ? StrPtr(Domain) : Domain

        result := DllCall("DHCPSAPI.dll\DhcpServerQueryDnsRegCredentials", "ptr", ServerIpAddress, "uint", UnameSize, "ptr", Uname, "uint", DomainSize, "ptr", Domain, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} ServerIpAddress 
     * @param {PWSTR} Uname 
     * @param {PWSTR} Domain 
     * @param {PWSTR} Passwd 
     * @returns {Integer} 
     */
    static DhcpServerSetDnsRegCredentials(ServerIpAddress, Uname, Domain, Passwd) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress
        Uname := Uname is String ? StrPtr(Uname) : Uname
        Domain := Domain is String ? StrPtr(Domain) : Domain
        Passwd := Passwd is String ? StrPtr(Passwd) : Passwd

        result := DllCall("DHCPSAPI.dll\DhcpServerSetDnsRegCredentials", "ptr", ServerIpAddress, "ptr", Uname, "ptr", Domain, "ptr", Passwd, "uint")
        return result
    }

    /**
     * Sets the credentials used by the DHCP server to create Domain Name System (DNS) registrations for the DHCP client lease record.
     * @param {PWSTR} ServerIpAddress <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_SRV_HANDLE</a> that specifies the RPC binding to the DHCP server  on which the DNS credentials will be set.
     * @param {PWSTR} Uname Pointer to a null-terminated Unicode string that specifies the user name for the DNS credentials.
     * @param {PWSTR} Domain Pointer to a null-terminated Unicode string that specifies the domain name for the DNS credentials.
     * @param {PWSTR} Passwd Pointer to a null-terminated   Unicode string that specifies the password for the DNS credentials. The password can be unencrypted.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpserversetdnsregcredentialsv5
     * @since windowsserver2008
     */
    static DhcpServerSetDnsRegCredentialsV5(ServerIpAddress, Uname, Domain, Passwd) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress
        Uname := Uname is String ? StrPtr(Uname) : Uname
        Domain := Domain is String ? StrPtr(Domain) : Domain
        Passwd := Passwd is String ? StrPtr(Passwd) : Passwd

        result := DllCall("DHCPSAPI.dll\DhcpServerSetDnsRegCredentialsV5", "ptr", ServerIpAddress, "ptr", Uname, "ptr", Domain, "ptr", Passwd, "uint")
        return result
    }

    /**
     * Backs up the DHCP server database configuration, settings, and DHCP client lease record to a specified file location.
     * @param {PWSTR} ServerIpAddress Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {PWSTR} Path Unicode string that specifies the absolute path to the file where the DHCP server database will be backed up.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
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
     * This call was performed by a client who is not a member of the "DHCP Administrators" security group.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_JET_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred while accessing the DHCP server's database.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpserverbackupdatabase
     * @since windowsserver2008
     */
    static DhcpServerBackupDatabase(ServerIpAddress, Path) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress
        Path := Path is String ? StrPtr(Path) : Path

        result := DllCall("DHCPSAPI.dll\DhcpServerBackupDatabase", "ptr", ServerIpAddress, "ptr", Path, "uint")
        return result
    }

    /**
     * Restores the settings, configuration, and records for a client lease database from a specific backup location (path).
     * @param {PWSTR} ServerIpAddress Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {PWSTR} Path Unicode string that specifies the full absolute path and filename to the backup file from which the registry configuration file and client lease database will be restored. Note that this operation will overwrite any database currently held in memory.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
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
     * This call was performed by a client who is not a member of the "DHCP Administrators" security group.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_JET_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred while accessing the DHCP server's database.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpserverrestoredatabase
     * @since windowsserver2008
     */
    static DhcpServerRestoreDatabase(ServerIpAddress, Path) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress
        Path := Path is String ? StrPtr(Path) : Path

        result := DllCall("DHCPSAPI.dll\DhcpServerRestoreDatabase", "ptr", ServerIpAddress, "ptr", Path, "uint")
        return result
    }

    /**
     * Sets or updates DHCP server settings.
     * @param {PWSTR} ServerIpAddress Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Integer} FieldsToSet Specifies a bitmask of the fields to set in the <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_server_config_info_vq">DHCP_SERVER_CONFIG_INFO_VQ</a> structure passed to <i>ConfigInfo</i>.
     * @param {Pointer<DHCP_SERVER_CONFIG_INFO_VQ>} ConfigInfo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_server_config_info_vq">DHCP_SERVER_CONFIG_INFO_VQ</a> structure that contains the new or updated settings for the DHCP server.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
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
     * This call was performed by a client who is not a member of the "DHCP Administrators" security group.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpserversetconfigvq
     * @since windowsserver2008
     */
    static DhcpServerSetConfigVQ(ServerIpAddress, FieldsToSet, ConfigInfo) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpServerSetConfigVQ", "ptr", ServerIpAddress, "uint", FieldsToSet, "ptr", ConfigInfo, "uint")
        return result
    }

    /**
     * Retrieves the current DHCP server configuration settings.
     * @param {PWSTR} ServerIpAddress Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Pointer<DHCP_SERVER_CONFIG_INFO_VQ>} ConfigInfo Pointer to the address of a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_server_config_info_vq">DHCP_SERVER_CONFIG_INFO_VQ</a> structure that contains the returned DHCP server configuration settings.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
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
     * This call was performed by a client who is not a member of the "DHCP Administrators" security group.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpservergetconfigvq
     * @since windowsserver2008
     */
    static DhcpServerGetConfigVQ(ServerIpAddress, ConfigInfo) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpServerGetConfigVQ", "ptr", ServerIpAddress, "ptr", ConfigInfo, "uint")
        return result
    }

    /**
     * Retrieves the names of the default vendor class and user class.
     * @param {PWSTR} ServerIpAddress Unicode string that specifies the IPv4 address of the DHCPv4 server.
     * @param {Pointer<DHCP_SERVER_SPECIFIC_STRINGS>} ServerSpecificStrings Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_server_specific_strings">DHCP_SERVER_SPECIFIC_STRINGS</a> structure that receives the information for the default vendor class and user class name strings.
     * 
     * <div class="alert"><b>Note</b>  <p class="note">The memory for this parameter must be free using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dhcpsapi/nf-dhcpsapi-dhcprpcfreememory">DhcpRpcFreeMemory</a>.
     * 
     * </div>
     * <div> </div>
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_JET_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred while accessing the DHCP server database.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpgetserverspecificstrings
     * @since windowsserver2008
     */
    static DhcpGetServerSpecificStrings(ServerIpAddress, ServerSpecificStrings) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpGetServerSpecificStrings", "ptr", ServerIpAddress, "ptr", ServerSpecificStrings, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<DHCP_SERVER_CONFIG_INFO_VQ>} ConfigInfo 
     * @returns {String} Nothing - always returns an empty string
     */
    static DhcpServerAuditlogParamsFree(ConfigInfo) {
        DllCall("DHCPSAPI.dll\DhcpServerAuditlogParamsFree", "ptr", ConfigInfo)
    }

    /**
     * The DhcpCreateSubnetV6 function creates a new subnet on the DHCP server.
     * @param {PWSTR} ServerIpAddress Pointer to a Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {DHCP_IPV6_ADDRESS} SubnetAddress DHCP_IPV6_ADDRESS value that contains the IP address of the subnet's gateway.
     * @param {Pointer<DHCP_SUBNET_INFO_V6>} SubnetInfo DHCP_SUBNET_INFO_V6 structure that contains specific settings for the subnet, including the subnet mask and IP address of the  subnet gateway.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
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
     * The parameters were invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DUPLICATE_TAG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified scope already exists.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpcreatesubnetv6
     * @since windowsserver2008
     */
    static DhcpCreateSubnetV6(ServerIpAddress, SubnetAddress, SubnetInfo) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpCreateSubnetV6", "ptr", ServerIpAddress, "ptr", SubnetAddress, "ptr", SubnetInfo, "uint")
        return result
    }

    /**
     * The DhcpDeleteSubnetV6 function deletes a subnet from the DHCP server.
     * @param {PWSTR} ServerIpAddress Pointer to a Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {DHCP_IPV6_ADDRESS} SubnetAddress DHCP_IPV6_ADDRESS value that contains the IP address of the subnet gateway used to identify the subnet.
     * @param {Integer} ForceFlag <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ne-dhcpsapi-dhcp_force_flag">DHCP_FORCE_FLAG</a> enumeration value that indicates the type of delete operation to perform (full force or no force).
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
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
     * The parameters were invalid.
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
     * The specified scope element does not exist.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpdeletesubnetv6
     * @since windowsserver2008
     */
    static DhcpDeleteSubnetV6(ServerIpAddress, SubnetAddress, ForceFlag) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpDeleteSubnetV6", "ptr", ServerIpAddress, "ptr", SubnetAddress, "int", ForceFlag, "uint")
        return result
    }

    /**
     * The DhcpEnumSubnetsV6 function returns an enumerated list of subnets defined on the DHCP server.
     * @param {PWSTR} ServerIpAddress Pointer to a Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Pointer<UInt32>} ResumeHandle Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_RESUME_HANDLE</a> value that identifies the enumeration operation. Initially, this value should be zero, with a successful call returning the handle value used for subsequent enumeration requests. For example, if <i>PreferredMaximum</i> is set to 100, and 200 subnet addresses  are stored on the server, the resume handle can be used after the first 100 subnets are retrieved to obtain the next 100 on a subsequent call, and so forth.
     * @param {Integer} PreferredMaximum Specifies the preferred maximum number of subnet addresses to return. If the number of remaining unenumerated options is less than this value, then that amount will be returned.
     * @param {Pointer<DHCPV6_IP_ARRAY>} EnumInfo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcpv6_ip_array">DHCPV6_IP_ARRAY</a> structure that contains the subnet IDs available on the DHCP server. If no subnets are defined, this value will be null.
     * @param {Pointer<UInt32>} ElementsRead Pointer to a <b>DWORD</b> value that specifies the number of subnet addresses returned in <i>EnumInfo</i>.
     * @param {Pointer<UInt32>} ElementsTotal Pointer to a <b>DWORD</b> value that specifies the  number of subnets defined on the DHCP server that have not yet been enumerated.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. If a call is made with the same <i>ResumeHandle</i> value and all items on the server have been enumerated, this method returns <b>ERROR_NO_MORE_ITEMS</b> with <i>ElementsRead</i> and <i>ElementsTotal</i> set to 0. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
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
     * The parameters were invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No more items to enumerate.
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
     * Memory failure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * More data is available to enumerate.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpenumsubnetsv6
     * @since windowsserver2008
     */
    static DhcpEnumSubnetsV6(ServerIpAddress, ResumeHandle, PreferredMaximum, EnumInfo, ElementsRead, ElementsTotal) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpEnumSubnetsV6", "ptr", ServerIpAddress, "uint*", ResumeHandle, "uint", PreferredMaximum, "ptr", EnumInfo, "uint*", ElementsRead, "uint*", ElementsTotal, "uint")
        return result
    }

    /**
     * The DhcpAddSubnetElementV6 function adds an element describing a feature or aspect of the subnet to the subnet entry in the DHCP database.
     * @param {PWSTR} ServerIpAddress Pointer to a Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {DHCP_IPV6_ADDRESS} SubnetAddress DHCP_IPV6_ADDRESS structure that contains the IP address of the subnet.
     * @param {Pointer<DHCP_SUBNET_ELEMENT_DATA_V6>} AddElementInfo Pointer to a DHCP_SUBNET_ELEMENT_DATA_V6 structure that contains the element data to add to the subnet. The V5 structure adds support for BOOTP clients.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
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
     * The parameters were invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DUPLICATE_TAG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified scope already exists.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpaddsubnetelementv6
     * @since windowsserver2008
     */
    static DhcpAddSubnetElementV6(ServerIpAddress, SubnetAddress, AddElementInfo) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpAddSubnetElementV6", "ptr", ServerIpAddress, "ptr", SubnetAddress, "ptr", AddElementInfo, "uint")
        return result
    }

    /**
     * The DhcpRemoveSubnetElementV6 function removes an element from a subnet defined on the DHCP server.
     * @param {PWSTR} ServerIpAddress Pointer to a Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {DHCP_IPV6_ADDRESS} SubnetAddress DHCP_IPV6_ADDRESS value that specifies the IP address of the subnet gateway and uniquely identifies it.
     * @param {Pointer<DHCP_SUBNET_ELEMENT_DATA_V6>} RemoveElementInfo DHCP_SUBNET_ELEMENT_DATA_V6 structure that contains information used to find the element that will be removed from subnet specified in <i>SubnetAddress</i>.
     * @param {Integer} ForceFlag <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ne-dhcpsapi-dhcp_force_flag">DHCP_FORCE_FLAG</a> enumeration value that indicates whether or not the clients affected by the removal of the subnet element should also be deleted.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
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
     * The parameters were invalid.
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
     * The specified scope element does not exist.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpremovesubnetelementv6
     * @since windowsserver2008
     */
    static DhcpRemoveSubnetElementV6(ServerIpAddress, SubnetAddress, RemoveElementInfo, ForceFlag) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpRemoveSubnetElementV6", "ptr", ServerIpAddress, "ptr", SubnetAddress, "ptr", RemoveElementInfo, "int", ForceFlag, "uint")
        return result
    }

    /**
     * The DhcpEnumSubnetElementsV6 function returns an enumerated list of elements for a specific DHCP subnet.
     * @param {PWSTR} ServerIpAddress Pointer to a Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {DHCP_IPV6_ADDRESS} SubnetAddress DHCP_IPV6_ADDRESS value that specifies the subnet whose elements will be enumerated.
     * @param {Integer} EnumElementType DHCP_SUBNET_ELEMENT_TYPE_V6 enumeration value that indicates the type of subnet element to enumerate.
     * @param {Pointer<UInt32>} ResumeHandle Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_RESUME_HANDLE</a> value that identifies the enumeration operation. Initially, this value should be zero, with a successful call returning the handle value used for subsequent enumeration requests. For example, if <i>PreferredMaximum</i> is set to 1000 bytes, and 2000 bytes worth of subnet elements  are stored on the server, the resume handle can be used after the first 1000 bytes are retrieved to obtain the next 1000 on a subsequent call, and so forth.
     * @param {Integer} PreferredMaximum Specifies the preferred maximum number of bytes of subnet elements to return. If the number of remaining unenumerated options (in bytes) is less than this value, then that amount will be returned.
     * @param {Pointer<DHCP_SUBNET_ELEMENT_INFO_ARRAY_V6>} EnumElementInfo Pointer to a DHCP_SUBNET_ELEMENT_INFO_ARRAY_V6 structure containing an enumerated list of all elements available for the specified subnet. If no elements are available for enumeration, this value will be null.
     * @param {Pointer<UInt32>} ElementsRead Pointer to a DWORD value that specifies the number of subnet elements returned in <i>EnumElementInfo</i>.
     * @param {Pointer<UInt32>} ElementsTotal Pointer to a DWORD value that specifies the total number of elements for the specified subnet.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
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
     * The parameters were invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No more items to enumerate.
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
     * Memory failure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * More data is available to enumerate.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpenumsubnetelementsv6
     * @since windowsserver2008
     */
    static DhcpEnumSubnetElementsV6(ServerIpAddress, SubnetAddress, EnumElementType, ResumeHandle, PreferredMaximum, EnumElementInfo, ElementsRead, ElementsTotal) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpEnumSubnetElementsV6", "ptr", ServerIpAddress, "ptr", SubnetAddress, "int", EnumElementType, "uint*", ResumeHandle, "uint", PreferredMaximum, "ptr", EnumElementInfo, "uint*", ElementsRead, "uint*", ElementsTotal, "uint")
        return result
    }

    /**
     * The DhcpGetSubnetInfoV6 function returns information on a specific subnet.
     * @param {PWSTR} ServerIpAddress Pointer to a Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {DHCP_IPV6_ADDRESS} SubnetAddress DHCP_IPV6_ADDRESS value that specifies the subnet ID.
     * @param {Pointer<DHCP_SUBNET_INFO_V6>} SubnetInfo DHCP_SUBNET_INFO_V6 structure that contains the returned information for the subnet matching the ID specified by <i>SubnetAddress</i>.
     * 
     * <div class="alert"><b>Note</b>  <p class="note">The memory for this parameter must be free using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dhcpsapi/nf-dhcpsapi-dhcprpcfreememory">DhcpRpcFreeMemory</a>.
     * 
     * </div>
     * <div> </div>
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpgetsubnetinfov6
     * @since windowsserver2008
     */
    static DhcpGetSubnetInfoV6(ServerIpAddress, SubnetAddress, SubnetInfo) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpGetSubnetInfoV6", "ptr", ServerIpAddress, "ptr", SubnetAddress, "ptr", SubnetInfo, "uint")
        return result
    }

    /**
     * The DhcpEnumSubnetClientsV6 function returns an enumerated list of clients with served IP addresses in the specified subnet.
     * @param {PWSTR} ServerIpAddress Pointer to a Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {DHCP_IPV6_ADDRESS} SubnetAddress <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_ipv6_address">DHCP_IPV6_ADDRESS</a> value containing the IP address of the subnet gateway.
     * @param {Pointer<DHCP_IPV6_ADDRESS>} ResumeHandle Pointer to a DHCP_RESUME_IPV6_HANDLE value that identifies the enumeration operation. Initially, this value should be zero, with a successful call returning the handle value used for subsequent enumeration requests. For example, if <i>PreferredMaximum</i> is set to 1000 bytes, and 2000 bytes worth of subnet client information structures  are stored on the server, the resume handle can be used after the first 1000 bytes are retrieved to obtain the next 1000 on a subsequent call, and so forth.
     * @param {Integer} PreferredMaximum Specifies the preferred maximum number of bytes of subnet client information structures to return. If the number of remaining unenumerated options (in bytes) is less than this value, then that amount will be returned.
     * @param {Pointer<DHCP_CLIENT_INFO_ARRAY_V6>} ClientInfo Pointer to a DHCP_CLIENT_INFO_ARRAY_V6 structure containing information on the clients served under this specific subnet. If no clients are available, this field will be null.
     * @param {Pointer<UInt32>} ClientsRead Pointer to a DWORD value that specifies the number of clients returned in <i>ClientInfo</i>.
     * @param {Pointer<UInt32>} ClientsTotal Pointer to a DWORD value that specifies the total number of clients for the specified subnet stored on the DHCP server.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
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
     * The parameters were invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No more items to enumerate.
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
     * Memory failure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * More data is available to enumerate.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpenumsubnetclientsv6
     * @since windowsserver2008
     */
    static DhcpEnumSubnetClientsV6(ServerIpAddress, SubnetAddress, ResumeHandle, PreferredMaximum, ClientInfo, ClientsRead, ClientsTotal) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpEnumSubnetClientsV6", "ptr", ServerIpAddress, "ptr", SubnetAddress, "ptr", ResumeHandle, "uint", PreferredMaximum, "ptr", ClientInfo, "uint*", ClientsRead, "uint*", ClientsTotal, "uint")
        return result
    }

    /**
     * Retrieves the configuration information for the DHCPv6 server.
     * @param {PWSTR} ServerIpAddress Pointer to a Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Pointer<DHCP_OPTION_SCOPE_INFO6>} ScopeInfo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_option_scope_info6">DHCP_OPTION_SCOPE_INFO6</a> structure used to identify the DHCPv6 scope for which configuration information will be retrieved.
     * @param {Pointer<DHCP_SERVER_CONFIG_INFO_V6>} ConfigInfo Pointer to the address of a  <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_server_config_info_v6">DHCP_SERVER_CONFIG_INFO_V6</a> structure that contains the requested configuration information.
     * 
     * <div class="alert"><b>Note</b>  <p class="note">The memory for this parameter must be free using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dhcpsapi/nf-dhcpsapi-dhcprpcfreememory">DhcpRpcFreeMemory</a>.
     * 
     * </div>
     * <div> </div>
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
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
     * This call was performed by a client who is not a member of the "DHCP Administrators" security group.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_JET_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred while accessing the DHCP server's database.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpservergetconfigv6
     * @since windowsserver2008
     */
    static DhcpServerGetConfigV6(ServerIpAddress, ScopeInfo, ConfigInfo) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpServerGetConfigV6", "ptr", ServerIpAddress, "ptr", ScopeInfo, "ptr", ConfigInfo, "uint")
        return result
    }

    /**
     * Sets the DHCPv6 server configuration data at the scope or server level.
     * @param {PWSTR} ServerIpAddress Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Pointer<DHCP_OPTION_SCOPE_INFO6>} ScopeInfo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_option_scope_info6">DHCP_OPTION_SCOPE_INFO6</a> structure that contains the configuration information at the scope or server level.
     * @param {Integer} FieldsToSet Specifies the set of value that indicate the type of configuration information provided in <i>ConfigInfo</i>. Only one of these values may be set per call.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="Set_UnicastFlag"></a><a id="set_unicastflag"></a><a id="SET_UNICASTFLAG"></a><dl>
     * <dt><b>Set_UnicastFlag</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not used.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="Set_RapidCommitFlag"></a><a id="set_rapidcommitflag"></a><a id="SET_RAPIDCOMMITFLAG"></a><dl>
     * <dt><b>Set_RapidCommitFlag</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not used.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="Set_PreferredLifetime"></a><a id="set_preferredlifetime"></a><a id="SET_PREFERREDLIFETIME"></a><dl>
     * <dt><b>Set_PreferredLifetime</b></dt>
     * <dt>0x00000004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Sets the preferred lifetime value for a non-temporary IPv6 address.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="Set_ValidLifetime"></a><a id="set_validlifetime"></a><a id="SET_VALIDLIFETIME"></a><dl>
     * <dt><b>Set_ValidLifetime</b></dt>
     * <dt>0x00000008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Sets the valid lifetime value for a non-temporary IPv6 address.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="Set_T1"></a><a id="set_t1"></a><a id="SET_T1"></a><dl>
     * <dt><b>Set_T1</b></dt>
     * <dt>0x00000010</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Sets the T1 time value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="Set_T2"></a><a id="set_t2"></a><a id="SET_T2"></a><dl>
     * <dt><b>Set_T2</b></dt>
     * <dt>0x00000020</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Sets the T2 time value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="Set_PreferredLifetimeIATA"></a><a id="set_preferredlifetimeiata"></a><a id="SET_PREFERREDLIFETIMEIATA"></a><dl>
     * <dt><b>Set_PreferredLifetimeIATA</b></dt>
     * <dt>0x00000040</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not used.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="Set_ValidLifetimeIATA"></a><a id="set_validlifetimeiata"></a><a id="SET_VALIDLIFETIMEIATA"></a><dl>
     * <dt><b>Set_ValidLifetimeIATA</b></dt>
     * <dt>0x00000080</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not used.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="Set_AuditLogState"></a><a id="set_auditlogstate"></a><a id="SET_AUDITLOGSTATE"></a><dl>
     * <dt><b>Set_AuditLogState</b></dt>
     * <dt>0x00000800</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Sets the audit log state in the registry.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<DHCP_SERVER_CONFIG_INFO_V6>} ConfigInfo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_server_config_info_v6">DHCP_SERVER_CONFIG_INFO_V6</a> structure that contains configuration information of the type indicated by the value supplied in <i>FieldsToSet</i>.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
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
     * This call was performed by a client who is not a member of the "DHCP Administrators" security group.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_JET_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred while accessing the DHCP server's database.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpserversetconfigv6
     * @since windowsserver2008
     */
    static DhcpServerSetConfigV6(ServerIpAddress, ScopeInfo, FieldsToSet, ConfigInfo) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpServerSetConfigV6", "ptr", ServerIpAddress, "ptr", ScopeInfo, "uint", FieldsToSet, "ptr", ConfigInfo, "uint")
        return result
    }

    /**
     * Sets or updates the information for an IPv6 subnet defined on the DHCPv6 server.
     * @param {PWSTR} ServerIpAddress Pointer to a Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {DHCP_IPV6_ADDRESS} SubnetAddress <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_ipv6_address">DHCP_IPV6_ADDRESS</a> structure that contains the IPv6 address of the subnet for which the information will be modified.
     * @param {Pointer<DHCP_SUBNET_INFO_V6>} SubnetInfo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_subnet_info_v6">DHCP_SUBNET_INFO_V6</a> structure that contains the new or updated information for the IPv6 subnet identified by <i>SubnetAddress</i>.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
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
     * This call was performed by a client who is not a member of the "DHCP Administrators" security group.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_JET_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred while accessing the DHCP server's database.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_SUBNET_NOT_PRESENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified subnet is not defined on the DHCP server.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpsetsubnetinfov6
     * @since windowsserver2008
     */
    static DhcpSetSubnetInfoV6(ServerIpAddress, SubnetAddress, SubnetInfo) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpSetSubnetInfoV6", "ptr", ServerIpAddress, "ptr", SubnetAddress, "ptr", SubnetInfo, "uint")
        return result
    }

    /**
     * Retrieves the IPv6 counter values of the DHCP server.
     * @param {PWSTR} ServerIpAddress Pointer to a Unicode string that specifies the IP address or hostname of the DHCPv6 server.
     * @param {Pointer<DHCP_MIB_INFO_V6>} MibInfo Pointed to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_mib_info_v6">DHCP_MIB_INFO_V6</a> structure that points to the location containing the IPv6 MIB information about the DHCP server.
     * 
     * <div class="alert"><b>Note</b>  <p class="note">The memory for this parameter must be free using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dhcpsapi/nf-dhcpsapi-dhcprpcfreememory">DhcpRpcFreeMemory</a>.
     * 
     * </div>
     * <div> </div>
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
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
     * This call was performed by a client who is not a member of the "DHCP Administrators" security group.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_JET_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred while accessing the DHCP server's database.
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
     * One of the parameters provides an invalid value.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpgetmibinfov6
     * @since windowsserver2008
     */
    static DhcpGetMibInfoV6(ServerIpAddress, MibInfo) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpGetMibInfoV6", "ptr", ServerIpAddress, "ptr", MibInfo, "uint")
        return result
    }

    /**
     * Retrieves an array of IPv6 interface binding information specific to the DHCPv6 server.
     * @param {PWSTR} ServerIpAddress Pointer to a Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Integer} Flags This parameter is not used, and must be set to 0.
     * @param {Pointer<DHCPV6_BIND_ELEMENT_ARRAY>} BindElementsInfo Pointer to the address of a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcpv6_bind_element_array">DHCPV6_BIND_ELEMENT_ARRAY</a> structure that contains the information about the IPv6 interface bindings for the DHCPv6 server.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
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
     * This call was performed by a client who is not a member of the "DHCP Administrators" security group.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_JET_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred while accessing the DHCP server's database.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpgetserverbindinginfov6
     * @since windowsserver2008
     */
    static DhcpGetServerBindingInfoV6(ServerIpAddress, Flags, BindElementsInfo) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpGetServerBindingInfoV6", "ptr", ServerIpAddress, "uint", Flags, "ptr", BindElementsInfo, "uint")
        return result
    }

    /**
     * Sets or modifies the IPv6 interface bindings for the DHCPv6 server.
     * @param {PWSTR} ServerIpAddress Pointer to a Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Integer} Flags This parameter is not used and must be set to 0.
     * @param {Pointer<DHCPV6_BIND_ELEMENT_ARRAY>} BindElementInfo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcpv6_bind_element_array">DHCPV6_BIND_ELEMENT_ARRAY</a> structure that contains the IPv6 interface bindings for the DHCPv6 server.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
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
     * This call was performed by a client who is not a member of the "DHCP Administrators" security group.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_JET_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred while accessing the DHCP server's database.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_NETWORK_CHANGED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network has changed. Retry this operation after checking for network changes. Network changes can be caused by interfaces that are either new or no longer valid, or by IPv6 addresses that are either new or no longer valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_CANNOT_MODIFY_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The supplied bindings to internal IPv6 addresses cannot be modified. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpsetserverbindinginfov6
     * @since windowsserver2008
     */
    static DhcpSetServerBindingInfoV6(ServerIpAddress, Flags, BindElementInfo) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpSetServerBindingInfoV6", "ptr", ServerIpAddress, "uint", Flags, "ptr", BindElementInfo, "uint")
        return result
    }

    /**
     * Sets or modifies the reserved DHCPv6 client lease record in the DHCPv6 server database.
     * @param {PWSTR} ServerIpAddress Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Pointer<DHCP_CLIENT_INFO_V6>} ClientInfo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_client_info_v6">DHCP_CLIENT_INFO_V6</a> structure that contains the updated DHCPv6 client leaser record information.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
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
     * This call was performed by a client who is not a member of the "DHCP Administrators" security group.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_JET_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred while accessing the DHCP server's database.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpsetclientinfov6
     * @since windowsserver2008
     */
    static DhcpSetClientInfoV6(ServerIpAddress, ClientInfo) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpSetClientInfoV6", "ptr", ServerIpAddress, "ptr", ClientInfo, "uint")
        return result
    }

    /**
     * Retrieves IPv6 address lease information for a specific IPv6 client reservation from the DHCPv6 server.
     * @param {PWSTR} ServerIpAddress Pointer to a Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Pointer<DHCP_SEARCH_INFO_V6>} SearchInfo Pointer to a <a href="https://docs.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_search_info_v6">DHCP_SEARCH_INFO_V6</a> structure that contains the search parameters for finding the specific IPv6 lease information for a client. The <b>SearchType</b> member of this structure must be set to <b>Dhcpv6ClientIpAddress</b>.
     * @param {Pointer<DHCP_CLIENT_INFO_V6>} ClientInfo Pointer to the address of a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_client_info_v6">DHCP_CLIENT_INFO_V6</a> structure that contains the IPv6 address lease information that matched the parameters supplied in <i>SearchInfo</i>.
     * 
     * <div class="alert"><b>Note</b>  <p class="note">The memory for this parameter must be free using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dhcpsapi/nf-dhcpsapi-dhcprpcfreememory">DhcpRpcFreeMemory</a>.
     * 
     * </div>
     * <div> </div>
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
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
     * This call was performed by a client who is not a member of the "DHCP Administrators" security group.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_JET_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred while accessing the DHCP server's database.
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
     * Either <b>Dhcpc6ClientDuid</b> or <b>Dhcpv6ClientName</b> was specified for the <b>SearchType</b> member of <i>SearchInfo</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpgetclientinfov6
     * @since windowsserver2008
     */
    static DhcpGetClientInfoV6(ServerIpAddress, SearchInfo, ClientInfo) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpGetClientInfoV6", "ptr", ServerIpAddress, "ptr", SearchInfo, "ptr", ClientInfo, "uint")
        return result
    }

    /**
     * Deletes the specified DHCPv6 client address release record from the DHCPv6 server database.
     * @param {PWSTR} ServerIpAddress Pointer to a Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Pointer<DHCP_SEARCH_INFO_V6>} ClientInfo Pointer to a <a href="https://docs.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_search_info_v6">DHCP_SEARCH_INFO_V6</a> structure that contains the key used to search for the DHCPv6 client lease record that will be deleted.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>. Commonly returned error codes include:
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
     * This call was performed by a client who is not a member of the "DHCP Administrators" security group.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_JET_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred while accessing the DHCP server's database.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_RESERVEDIP_EXISTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified client lease is a reservation.
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
     * The <b>SearchType</b> member of <a href="/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_search_info_v6">DHCP_SEARCH_INFO_V6</a> was not set to <b>Dhcpv6ClientIpAddress</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpdeleteclientinfov6
     * @since windowsserver2008
     */
    static DhcpDeleteClientInfoV6(ServerIpAddress, ClientInfo) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpDeleteClientInfoV6", "ptr", ServerIpAddress, "ptr", ClientInfo, "uint")
        return result
    }

    /**
     * Creates a custom DHCPv6 option class.
     * @param {PWSTR} ServerIpAddress Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Integer} ReservedMustBeZero Reserved. This field must be set to zero.
     * @param {Pointer<DHCP_CLASS_INFO_V6>} ClassInfo <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_class_info_v6">DHCP_CLASS_INFO_V6</a> structure that contains the specific option class data.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
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
     * This call was performed by a client who is not a member of the "DHCP Administrators" security group.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_JET_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred while accessing the DHCP server's database.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_CLASS_ALREADY_EXISTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified class name is already defined on the DHCP server, or the class information is already in use.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpcreateclassv6
     * @since windowsserver2008
     */
    static DhcpCreateClassV6(ServerIpAddress, ReservedMustBeZero, ClassInfo) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpCreateClassV6", "ptr", ServerIpAddress, "uint", ReservedMustBeZero, "ptr", ClassInfo, "uint")
        return result
    }

    /**
     * Modifies a DHCPv6 user or vendor class defined on the server.
     * @param {PWSTR} ServerIpAddress Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Integer} ReservedMustBeZero Reserved. This value must be set to 0.
     * @param {Pointer<DHCP_CLASS_INFO_V6>} ClassInfo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_class_info_v6">DHCP_CLASS_INFO_V6</a> structure that contains the new information for the class.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
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
     * This call was performed by a client who is not a member of the "DHCP Administrators" security group.
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
     * The <a href="/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_class_info">DHCP_CLASS_INFO</a> structure provided in <i>ClassInfo</i> has null or invalid values for the <b>ClassName</b> or <b>ClassData</b> member (or both).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_CLASS_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A class name could not be found that matches the provided information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_JET_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred while accessing the DHCPv6 server's database.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_CLASS_ALREADY_EXISTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The new class name is currently in use, or the new class information is currently in use.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpmodifyclassv6
     * @since windowsserver2008
     */
    static DhcpModifyClassV6(ServerIpAddress, ReservedMustBeZero, ClassInfo) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpModifyClassV6", "ptr", ServerIpAddress, "uint", ReservedMustBeZero, "ptr", ClassInfo, "uint")
        return result
    }

    /**
     * Deletes a DHCP class from the DHCPv6 server.
     * @param {PWSTR} ServerIpAddress Pointer to a Unicode string that contains the IPv6 address of the DHCPv6 server. This string is used as a handle for resolving RPC API calls.
     * @param {Integer} ReservedMustBeZero Reserved. This parameter must be set to 0.
     * @param {PWSTR} ClassName Unicode string that specifies the name of the DHCPv6 class to delete.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
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
     * This call was performed by a client who is not a member of the "DHCP Administrators" security group.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_JET_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred while accessing the DHCP server's database.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_CLASS_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The class name could not be found in the database.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_DELETE_BUILTIN_CLASS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The class is a built-in class and cannot be deleted.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpdeleteclassv6
     * @since windowsserver2008
     */
    static DhcpDeleteClassV6(ServerIpAddress, ReservedMustBeZero, ClassName) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress
        ClassName := ClassName is String ? StrPtr(ClassName) : ClassName

        result := DllCall("DHCPSAPI.dll\DhcpDeleteClassV6", "ptr", ServerIpAddress, "uint", ReservedMustBeZero, "ptr", ClassName, "uint")
        return result
    }

    /**
     * Enumerates the user or vendor classes configured for the DHCPv6 server.
     * @param {PWSTR} ServerIpAddress Pointer to a Unicode string that specifies the IP address or hostname of the DHCPv6 server.
     * @param {Integer} ReservedMustBeZero Reserved. This field must be set to zero.
     * @param {Pointer<UInt32>} ResumeHandle Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_RESUME_HANDLE</a> value that identifies the enumeration operation. Initially, this value should be zero, with a successful call returning the handle value used for subsequent enumeration requests. For example, if <i>PreferredMaximum</i> is set to 100 classes, and 200 classes are stored on the server, the resume handle can be used after the first 100 classes are retrieved to obtain the next 100 on a subsequent call, and so forth.
     * @param {Integer} PreferredMaximum Specifies the preferred maximum number of classes to return. If the number of remaining unenumerated classes is less than this value, then that amount will be returned. To retrieve all classes available on the DHCPv6 server, set this parameter to 0xFFFFFFFF.
     * @param {Pointer<DHCP_CLASS_INFO_ARRAY_V6>} ClassInfoArray Pointer to a  <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_class_info_array_v6">DHCP_CLASS_INFO_ARRAY_V6</a> structure that contains the returned classes. If there are no classes available on the DHCP server, this parameter will return null.
     * @param {Pointer<UInt32>} nRead Pointer to a DWORD value that specifies the number of classes returned in <i>ClassInfoArray</i>.
     * @param {Pointer<UInt32>} nTotal Pointer to a DWORD value that specifies the total number of classes stored on the DHCP server.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
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
     * This call was performed by a client who is not a member of the "DHCP Administrators" security group.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_JET_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred while accessing the DHCP server's database.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpenumclassesv6
     * @since windowsserver2008
     */
    static DhcpEnumClassesV6(ServerIpAddress, ReservedMustBeZero, ResumeHandle, PreferredMaximum, ClassInfoArray, nRead, nTotal) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpEnumClassesV6", "ptr", ServerIpAddress, "uint", ReservedMustBeZero, "uint*", ResumeHandle, "uint", PreferredMaximum, "ptr", ClassInfoArray, "uint*", nRead, "uint*", nTotal, "uint")
        return result
    }

    /**
     * Sets the delay period for DHCP OFFER messages after a DISCOVER message is received, for a specific DHCP scope.
     * @param {PWSTR} ServerIpAddress Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Integer} SubnetAddress <b>DHCP_IP_ADDRESS</b> value that contains the IP address of the subnet gateway.
     * @param {Integer} TimeDelayInMilliseconds Unsigned 16-bit integer value that specifies the time to delay an OFFER message after receiving a DISCOVER message, in milliseconds, and set for a particular scope. This value must be between 0 and 1000 (milliseconds). The default value is 0.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
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
     * This call was performed by a client who is not a member of the "DHCP Administrators" security group.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_SUBNET_NOT_PRESENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified subnet is not defined on the DHCP server.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_INVALID_DELAY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The time delay was set to a value less than 0 or greater than 1000.
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
     * One of the parameters provides an invalid value.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpsetsubnetdelayoffer
     * @since windowsserver2008
     */
    static DhcpSetSubnetDelayOffer(ServerIpAddress, SubnetAddress, TimeDelayInMilliseconds) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpSetSubnetDelayOffer", "ptr", ServerIpAddress, "uint", SubnetAddress, "ushort", TimeDelayInMilliseconds, "uint")
        return result
    }

    /**
     * Obtains the delay period for DHCP OFFER messages after a DISCOVER message is received.
     * @param {PWSTR} ServerIpAddress Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {Integer} SubnetAddress <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_ADDRESS</a> value that contains the IP address of the subnet gateway.
     * @param {Pointer<UInt16>} TimeDelayInMilliseconds Unsigned 16-bit integer value that receive the time to delay an OFFER message after receiving a DISCOVER message as configured on the DHCP server, in milliseconds.
     * 
     * <div class="alert"><b>Note</b>  <p class="note">The memory for this parameter must be free using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dhcpsapi/nf-dhcpsapi-dhcprpcfreememory">DhcpRpcFreeMemory</a>.
     * 
     * </div>
     * <div> </div>
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
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
     * This call was performed by a client who is not a member of the "DHCP Administrators" security group.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_SUBNET_NOT_PRESENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified subnet is not defined on the DHCP server.
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
     * One of the parameters provides an invalid value.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpgetsubnetdelayoffer
     * @since windowsserver2008
     */
    static DhcpGetSubnetDelayOffer(ServerIpAddress, SubnetAddress, TimeDelayInMilliseconds) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpGetSubnetDelayOffer", "ptr", ServerIpAddress, "uint", SubnetAddress, "ushort*", TimeDelayInMilliseconds, "uint")
        return result
    }

    /**
     * Obtains a MIB data structure that contains current statistics about the specified DHCP server.
     * @param {PWSTR} ServerIpAddress Pointer to a zero-delimited string that contains the IPv4 address of the DHCP server for which statistical information is to be retrieved. This value is specified in the format "*.*.*.*". 
     * 
     * If this parameter is <b>NULL</b>, then the local DHCP server process is queried.
     * @param {Pointer<DHCP_MIB_INFO_V5>} MibInfo Pointer to the address of a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_mib_info_v5">DHCP_MIB_INFO_V5</a> structure that contains statistical information about the DHCP server specified in the <i>ServerIpAddress</i> parameter.
     * 
     * <div class="alert"><b>Note</b>  <p class="note">The memory for this parameter must be free using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dhcpsapi/nf-dhcpsapi-dhcprpcfreememory">DhcpRpcFreeMemory</a>.
     * 
     * </div>
     * <div> </div>
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
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
     * This call was performed by a client who is not a member of the "DHCP Administrators" security group.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_JET_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred while accessing the DHCP server's database.
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
     * One of the parameters provides an invalid value.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpgetmibinfov5
     * @since windowsserver2008
     */
    static DhcpGetMibInfoV5(ServerIpAddress, MibInfo) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpGetMibInfoV5", "ptr", ServerIpAddress, "ptr", MibInfo, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} pServer 
     * @returns {Integer} 
     */
    static DhcpAddSecurityGroup(pServer) {
        pServer := pServer is String ? StrPtr(pServer) : pServer

        result := DllCall("DHCPSAPI.dll\DhcpAddSecurityGroup", "ptr", pServer, "uint")
        return result
    }

    /**
     * Retrieves a DHCP option value (the option code and associated data) for a particular scope. This function extends the functionality provided by DhcpGetOptionValueV5 by allowing the caller to specify a policy for the option.
     * @param {PWSTR} ServerIpAddress Pointer to a null-terminated Unicode string that represents the IP address or hostname of the DHCP server.
     * @param {Integer} Flags Indicates whether the option is for a specific or default vendor.
     * 
     * <table>
     * <tr>
     * <th>Flags</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id=""></a><dl>
     * <dt><b></b></dt>
     * <dt>0x00000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The option value is retrieved for a default vendor.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DHCP_FLAGS_OPTION_IS_VENDOR"></a><a id="dhcp_flags_option_is_vendor"></a><dl>
     * <dt><b>DHCP_FLAGS_OPTION_IS_VENDOR</b></dt>
     * <dt>0x00000003</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The option value is retrieved for a specific vendor. The vendor is in <i>VendorName</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} OptionID <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_OPTION_ID</a> structure that specifies the unique option code for the option value to retrieve. A complete list of standard DHCP and BOOTP option codes can be found at <a href="http://www.ietf.org/rfc/rfc2132.txt">http://www.ietf.org/rfc/rfc2132.txt</a>
     * @param {PWSTR} PolicyName A null-terminated Unicode string that represents the name of the policy inside the subnet of the option value to retrieve. The subnet is identified by the <b>SubnetScopeInfo</b> member of <i>ScopeInfo</i>.
     * @param {PWSTR} VendorName A null-terminated Unicode string that represents the vendor  of the option. This parameter is optional, and should be <b>NULL</b> when <i>Flags</i> is not <b>DHCP_FLAGS_OPTION_IS_VENDOR</b>. If the vendor is not specified, the option value is returned for the default vendor.
     * @param {Pointer<DHCP_OPTION_SCOPE_INFO>} ScopeInfo <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_option_scope_info">DHCP_OPTION_SCOPE_INFO</a> structure that contains information on the scope of the option value to retrieve.
     * @param {Pointer<DHCP_OPTION_VALUE>} OptionValue Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_option_data">DHCP_OPTION_DATA</a> structure that contains the data value corresponding to the DHCP option code specified by <i>OptionID</i>.
     * @returns {Integer} If the function succeeds, it returns <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, it returns one of the following or an error code from <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the parameters were invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_SUBNET_NOT_PRESENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified IPv4 subnet does not exist.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_CLASS_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The class name being used is unknown or incorrect.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_POLICY_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified policy name does not exist.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_OPTION_NOT_PRESENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified option definition does not exist on the DHCP server database.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpv4getoptionvalue
     * @since windowsserver2012
     */
    static DhcpV4GetOptionValue(ServerIpAddress, Flags, OptionID, PolicyName, VendorName, ScopeInfo, OptionValue) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress
        PolicyName := PolicyName is String ? StrPtr(PolicyName) : PolicyName
        VendorName := VendorName is String ? StrPtr(VendorName) : VendorName

        result := DllCall("DHCPSAPI.dll\DhcpV4GetOptionValue", "ptr", ServerIpAddress, "uint", Flags, "uint", OptionID, "ptr", PolicyName, "ptr", VendorName, "ptr", ScopeInfo, "ptr", OptionValue, "uint")
        return result
    }

    /**
     * Sets information for a specific option value on the DHCP server. This function extends the functionality provided by DhcpSetOptionValueV5 by allowing the caller to specify a policy for the option.
     * @param {PWSTR} ServerIpAddress Pointer to a null-terminated Unicode string that represents the IP address or hostname of the DHCP server.
     * @param {Integer} Flags Indicates whether the option is for a specific or default vendor.
     * 
     * <table>
     * <tr>
     * <th>Flags</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id=""></a><dl>
     * <dt><b></b></dt>
     * <dt>0x00000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The option value is retrieved for a default vendor.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DHCP_FLAGS_OPTION_IS_VENDOR"></a><a id="dhcp_flags_option_is_vendor"></a><dl>
     * <dt><b>DHCP_FLAGS_OPTION_IS_VENDOR</b></dt>
     * <dt>0x00000003</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The option value is retrieved for a specific vendor. The vendor is in <i>VendorName</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} OptionId <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_OPTION_ID</a> structure that specifies the unique option code for the option value to retrieve. A complete list of standard DHCP and BOOTP option codes can be found at <a href="http://www.ietf.org/rfc/rfc2132.txt">http://www.ietf.org/rfc/rfc2132.txt</a>
     * @param {PWSTR} PolicyName A null-terminated Unicode string that represents the name of the policy inside the subnet of the option value to set. The subnet is identified by the <b>SubnetScopeInfo</b> member of <i>ScopeInfo</i>.
     * @param {PWSTR} VendorName A null-terminated Unicode string that represents the vendor  of the option. This parameter is optional, and should be <b>NULL</b> when <i>Flags</i> is not <b>DHCP_FLAGS_OPTION_IS_VENDOR</b>. If the vendor is not specified, the option value is set for the default vendor.
     * @param {Pointer<DHCP_OPTION_SCOPE_INFO>} ScopeInfo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_option_scope_info">DHCP_OPTION_SCOPE_INFO</a> structure that contains information on the scope of the option value to set.
     * @param {Pointer<DHCP_OPTION_DATA>} OptionValue Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_option_data">DHCP_OPTION_DATA</a> structure that contains the data value corresponding to the DHCP option code specified by <i>OptionID</i>.
     * @returns {Integer} If the function succeeds, it returns <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, it returns one of the following or an error code from <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the parameters were invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_SUBNET_NOT_PRESENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified IPv4 subnet does not exist.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_CLASS_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The class name being used is unknown or incorrect.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_POLICY_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified policy name does not exist.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_OPTION_NOT_PRESENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified option definition does not exist on the DHCP server database.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpv4setoptionvalue
     * @since windowsserver2012
     */
    static DhcpV4SetOptionValue(ServerIpAddress, Flags, OptionId, PolicyName, VendorName, ScopeInfo, OptionValue) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress
        PolicyName := PolicyName is String ? StrPtr(PolicyName) : PolicyName
        VendorName := VendorName is String ? StrPtr(VendorName) : VendorName

        result := DllCall("DHCPSAPI.dll\DhcpV4SetOptionValue", "ptr", ServerIpAddress, "uint", Flags, "uint", OptionId, "ptr", PolicyName, "ptr", VendorName, "ptr", ScopeInfo, "ptr", OptionValue, "uint")
        return result
    }

    /**
     * Sets option codes and their associated data values for a specific scope defined on the DHCP server. This function extends the functionality provided by DhcpSetOptionValuesV5 by allowing the caller to specify a policy for the options.
     * @param {PWSTR} ServerIpAddress Pointer to a null-terminated Unicode string that represents the IP address or hostname of the DHCP server.
     * @param {Integer} Flags Reserved. Must be 0.
     * @param {PWSTR} PolicyName A null-terminated Unicode string that represents the name of the policy inside the subnet of the option value to set. The subnet is identified by the <b>SubnetScopeInfo</b> member of <i>ScopeInfo</i>.
     * @param {PWSTR} VendorName A null-terminated Unicode string that represents the vendor  of the option. This parameter is optional, and if <b>NULL</b>, the option value is set for the default vendor.
     * @param {Pointer<DHCP_OPTION_SCOPE_INFO>} ScopeInfo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_option_scope_info">DHCP_OPTION_SCOPE_INFO</a> structure that contains information describing the DHCP scope of the option values to set. This parameter specifies whether the option value is set for the default, server, or scope level, or for an IPv4 reservation.
     * @param {Pointer<DHCP_OPTION_VALUE_ARRAY>} OptionValues Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_option_value_array">DHCP_OPTION_VALUE_ARRAY</a> structure that contains a list of option codes and the corresponding data value that will be set.
     * @returns {Integer} If the function succeeds, it returns <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, it returns one of the following or an error code from <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the parameters were invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_SUBNET_NOT_PRESENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified IPv4 subnet does not exist.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_CLASS_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The class name being used is unknown or incorrect.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_POLICY_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified policy name does not exist.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_OPTION_NOT_PRESENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified option definition does not exist on the DHCP server database.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_NOT_RESERVED_CLIENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified DHCP client is not a reserved client.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpv4setoptionvalues
     * @since windowsserver2012
     */
    static DhcpV4SetOptionValues(ServerIpAddress, Flags, PolicyName, VendorName, ScopeInfo, OptionValues) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress
        PolicyName := PolicyName is String ? StrPtr(PolicyName) : PolicyName
        VendorName := VendorName is String ? StrPtr(VendorName) : VendorName

        result := DllCall("DHCPSAPI.dll\DhcpV4SetOptionValues", "ptr", ServerIpAddress, "uint", Flags, "ptr", PolicyName, "ptr", VendorName, "ptr", ScopeInfo, "ptr", OptionValues, "uint")
        return result
    }

    /**
     * Removes an option value from a scope defined on the DHCP server. This function extends the functionality provided by DhcpRemoveOptionValueV5 by allowing the caller to specify a policy for the option.
     * @param {PWSTR} ServerIpAddress Pointer to a null-terminated Unicode string that represents the IP address or hostname of the DHCP server.
     * @param {Integer} Flags Indicates whether the option value is for a specific or default vendor.
     * 
     * <table>
     * <tr>
     * <th>Flags</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id=""></a><dl>
     * <dt><b></b></dt>
     * <dt>0x00000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The option value is removed for a default vendor.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DHCP_FLAGS_OPTION_IS_VENDOR"></a><a id="dhcp_flags_option_is_vendor"></a><dl>
     * <dt><b>DHCP_FLAGS_OPTION_IS_VENDOR</b></dt>
     * <dt>0x00000003</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The option value is removed for a specific vendor. The vendor is in <i>VendorName</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} OptionID <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_OPTION_ID</a> structure that specifies the option code for the option value to remove. A complete list of standard DHCP and BOOTP option codes can be found at <a href="http://www.ietf.org/rfc/rfc2132.txt">http://www.ietf.org/rfc/rfc2132.txt</a>
     * @param {PWSTR} PolicyName A null-terminated Unicode string that represents the name of the policy inside the subnet of the option value to remove. The subnet is identified by the <b>SubnetScopeInfo</b> member of <i>ScopeInfo</i>.
     * @param {PWSTR} VendorName A null-terminated Unicode string that represents the vendor  of the option. This parameter is optional, and should be <b>NULL</b> when <i>Flags</i> is not <b>DHCP_FLAGS_OPTION_IS_VENDOR</b>. If the vendor is not specified, the option value is set for the default vendor.
     * @param {Pointer<DHCP_OPTION_SCOPE_INFO>} ScopeInfo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_option_scope_info">DHCP_OPTION_SCOPE_INFO</a> structure that contains information on the scope of the option value to remove
     * @returns {Integer} If the function succeeds, it returns <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, it returns one of the following or an error code from <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the parameters were invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_CLASS_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The class name being used is unknown or incorrect.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_POLICY_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified policy name does not exist.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_OPTION_NOT_PRESENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified option definition does not exist on the DHCP server database or there is no value set for the specified option ID on the specified policy.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_SUBNET_NOT_PRESENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified IPv4 subnet does not exist.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpv4removeoptionvalue
     * @since windowsserver2012
     */
    static DhcpV4RemoveOptionValue(ServerIpAddress, Flags, OptionID, PolicyName, VendorName, ScopeInfo) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress
        PolicyName := PolicyName is String ? StrPtr(PolicyName) : PolicyName
        VendorName := VendorName is String ? StrPtr(VendorName) : VendorName

        result := DllCall("DHCPSAPI.dll\DhcpV4RemoveOptionValue", "ptr", ServerIpAddress, "uint", Flags, "uint", OptionID, "ptr", PolicyName, "ptr", VendorName, "ptr", ScopeInfo, "uint")
        return result
    }

    /**
     * Retrieves an array of DHCP option values (the option code and associated data) for a particular scope.
     * @param {PWSTR} ServerIpAddress Pointer to a null-terminated Unicode string that represents the IP address or hostname of the DHCP server.
     * @param {Integer} Flags Indicates whether the option values are for a specific or default vendor.
     * 
     * <table>
     * <tr>
     * <th>Flags</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id=""></a><dl>
     * <dt><b></b></dt>
     * <dt>0x00000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The option values are retrieved for a default vendor.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DHCP_FLAGS_OPTION_IS_VENDOR"></a><a id="dhcp_flags_option_is_vendor"></a><dl>
     * <dt><b>DHCP_FLAGS_OPTION_IS_VENDOR</b></dt>
     * <dt>0x00000003</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The option values are retrieved for specific vendors.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<DHCP_OPTION_SCOPE_INFO>} ScopeInfo A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_option_scope_info">DHCP_OPTION_SCOPE_INFO</a> structure that contains information on the scope of the option values to retrieve.
     * @param {Pointer<DHCP_ALL_OPTION_VALUES_PB>} Values Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_all_option_values_pb">DHCP_ALL_OPTION_VALUES_PB</a> structure that contains the retrieved option values for the scope specified in <i>ScopeInfo</i>.
     * 
     * There is one option value in the array for each vendor/policy pair defined on the DHCP server.
     * @returns {Integer} If the function succeeds, it returns <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, it returns one of the following or an error code from <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the parameters were invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpv4getalloptionvalues
     * @since windowsserver2012
     */
    static DhcpV4GetAllOptionValues(ServerIpAddress, Flags, ScopeInfo, Values) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpV4GetAllOptionValues", "ptr", ServerIpAddress, "uint", Flags, "ptr", ScopeInfo, "ptr", Values, "uint")
        return result
    }

    /**
     * Creates a new DHCPv4 failover relationship between two servers.
     * @param {PWSTR} ServerIpAddress Pointer to a null-terminated Unicode string that represents the IP address or hostname of the DHCP server.
     * @param {Pointer<DHCP_FAILOVER_RELATIONSHIP>} pRelationship Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_failover_relationship">DHCP_FAILOVER_RELATIONSHIP</a> structure that contains information about the DHCPv4 failover relationship to create.
     * @returns {Integer} If the function succeeds, it returns <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, it returns one of the following or an error code from <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the parameters were invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_SUBNET_NOT_PRESENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * IPv4 scope doesn't exist on the DHCPv4 server.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_FO_SCOPE_ALREADY_IN_RELATIONSHIP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * IPv4 is already part of another failover relationship.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_FO_RELATIONSHIP_EXISTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A failover relationship with the same name already exists on DHCPv4 server.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_FO_RELATIONSHIP_NAME_TOO_LONG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The failover relationship name is longer than the expected length.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_FO_MAX_RELATIONSHIPS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The maximum number of allowed failover relationship configured on the DHCP server has exceeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpv4failovercreaterelationship
     * @since windowsserver2012
     */
    static DhcpV4FailoverCreateRelationship(ServerIpAddress, pRelationship) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpV4FailoverCreateRelationship", "ptr", ServerIpAddress, "ptr", pRelationship, "uint")
        return result
    }

    /**
     * Sets or modifies the parameters of a DHCPv4 server failover relationship.
     * @param {PWSTR} ServerIpAddress Pointer to a null-terminated Unicode string that represents the IP address or hostname of the DHCP server.
     * @param {Integer} Flags A bitmask that specifies the fields to update in <i>pRelationship</i>. Each value specifies a member of the <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_failover_relationship">DHCP_FAILOVER_RELATIONSHIP</a> structure to be modified. 
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MCLT"></a><a id="mclt"></a><dl>
     * <dt><b>MCLT</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>mclt</b> member in <i>pRelationship</i> parameter structure is populated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SAFEPERIOD"></a><a id="safeperiod"></a><dl>
     * <dt><b>SAFEPERIOD</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>safePeriod</b> member in <i>pRelationship</i> parameter structure is populated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CHANGESTATE"></a><a id="changestate"></a><dl>
     * <dt><b>CHANGESTATE</b></dt>
     * <dt>0x00000004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>state</b> member in <i>pRelationship</i> parameter structure is populated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PERCENTAGE"></a><a id="percentage"></a><dl>
     * <dt><b>PERCENTAGE</b></dt>
     * <dt>0x00000008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>percentage</b> member in <i>pRelationship</i> parameter structure is populated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MODE"></a><a id="mode"></a><dl>
     * <dt><b>MODE</b></dt>
     * <dt>0x00000010</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>mode</b> member in <i>pRelationship</i> parameter structure is populated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PREVSTATE"></a><a id="prevstate"></a><dl>
     * <dt><b>PREVSTATE</b></dt>
     * <dt>0x00000020</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>prevState</b> member in <i>pRelationship</i> parameter structure is populated.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<DHCP_FAILOVER_RELATIONSHIP>} pRelationship Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_failover_relationship">DHCP_FAILOVER_RELATIONSHIP</a> structure that  contains  update information about the fields in the DHCPv4 failover relationship.
     * @returns {Integer} If the function succeeds, it returns <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, it returns one of the following or an error code from <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the parameters were invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_FO_RELATIONSHIP_DOES_NOT_EXIST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The failover relationship doesn’t exist.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpv4failoversetrelationship
     * @since windowsserver2012
     */
    static DhcpV4FailoverSetRelationship(ServerIpAddress, Flags, pRelationship) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpV4FailoverSetRelationship", "ptr", ServerIpAddress, "uint", Flags, "ptr", pRelationship, "uint")
        return result
    }

    /**
     * Deletes a DHCPv4 failover relationship between two servers.
     * @param {PWSTR} ServerIpAddress Pointer to a null-terminated Unicode string that represents the IP address or hostname of the DHCP server.
     * @param {PWSTR} pRelationshipName Pointer to null-terminated Unicode string that represents the name of the relationship to delete.
     * @returns {Integer} If the function succeeds, it returns <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, it returns one of the following or an error code from <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the parameters were invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_FO_RELATIONSHIP_DOES_NOT_EXIST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The failover relationship doesn't exist.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpv4failoverdeleterelationship
     * @since windowsserver2012
     */
    static DhcpV4FailoverDeleteRelationship(ServerIpAddress, pRelationshipName) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress
        pRelationshipName := pRelationshipName is String ? StrPtr(pRelationshipName) : pRelationshipName

        result := DllCall("DHCPSAPI.dll\DhcpV4FailoverDeleteRelationship", "ptr", ServerIpAddress, "ptr", pRelationshipName, "uint")
        return result
    }

    /**
     * Retrieves relationship details for a specific relationship name.
     * @param {PWSTR} ServerIpAddress Pointer to a null-terminated Unicode string that represents the IP address or hostname of the DHCP server.
     * @param {PWSTR} pRelationshipName Pointer to a null-terminated Unicode string which represents the name of the relationship to retrieve.
     * @param {Pointer<DHCP_FAILOVER_RELATIONSHIP>} pRelationship Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_failover_relationship">DHCP_FAILOVER_RELATIONSHIP</a> structure that contains information about the retrieved failover relationship.
     * 
     * <div class="alert"><b>Note</b>  <p class="note">The memory for this parameter must be free using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dhcpsapi/nf-dhcpsapi-dhcprpcfreememory">DhcpRpcFreeMemory</a>.
     * 
     * </div>
     * <div> </div>
     * @returns {Integer} If the function succeeds, it returns <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, it returns one of the following or an error code from <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the parameters were invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_FO_RELATIONSHIP_DOES_NOT_EXIST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The failover relationship does not exist.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpv4failovergetrelationship
     * @since windowsserver2012
     */
    static DhcpV4FailoverGetRelationship(ServerIpAddress, pRelationshipName, pRelationship) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress
        pRelationshipName := pRelationshipName is String ? StrPtr(pRelationshipName) : pRelationshipName

        result := DllCall("DHCPSAPI.dll\DhcpV4FailoverGetRelationship", "ptr", ServerIpAddress, "ptr", pRelationshipName, "ptr", pRelationship, "uint")
        return result
    }

    /**
     * Enumerates all failover relationships present on the server.
     * @param {PWSTR} ServerIpAddress Pointer to a null-terminated Unicode string that represents the IP address or hostname of the DHCP server.
     * @param {Pointer<UInt32>} ResumeHandle Pointer to a  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_RESUME_HANDLE</a> structure that identifies this enumeration for use in subsequent calls to this function.
     * 
     * Initially, this value should be zero on input. If successful, the returned value should be used for subsequent enumeration requests. For example, if <i>PreferredMaximum</i> is set to 100, and 200 reservation elements are configured on the server, the resume handle can be used after the first 100 policies are retrieved to obtain the next 100 on a subsequent call.
     * @param {Integer} PreferredMaximum The maximum number of failover relationship elements to return in <i>pRelationship</i>. If <i>PreferredMaximum</i> is greater than the number of remaining non-enumerated policies on the server, the remaining number of  non-enumerated policies is returned.
     * @param {Pointer<DHCP_FAILOVER_RELATIONSHIP_ARRAY>} pRelationship Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_failover_relationship_array">DHCP_FAILOVER_RELATIONSHIP_ARRAY</a> structure that contains an array of the failover relationships available on the DHCP server. If no relationships are configured,<i></i> this value is <b>NULL</b>.
     * @param {Pointer<UInt32>} RelationshipRead Pointer to a <b>DWORD</b> that specifies the number of failover relationship elements returned in <i>pRelationship</i>.
     * @param {Pointer<UInt32>} RelationshipTotal Pointer to a <b>DWORD</b>  that specifies the number of failover relationships configured on the DHCP server that have not yet been enumerated.
     * @returns {Integer} If the function succeeds, it returns <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, it returns one of the following. or an error code from <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>
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
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the parameters were invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are more elements available to enumerate.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are no more elements left to enumerate.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpv4failoverenumrelationship
     * @since windowsserver2012
     */
    static DhcpV4FailoverEnumRelationship(ServerIpAddress, ResumeHandle, PreferredMaximum, pRelationship, RelationshipRead, RelationshipTotal) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpV4FailoverEnumRelationship", "ptr", ServerIpAddress, "uint*", ResumeHandle, "uint", PreferredMaximum, "ptr", pRelationship, "uint*", RelationshipRead, "uint*", RelationshipTotal, "uint")
        return result
    }

    /**
     * Adds a DHCPv4 scope to the specified failover relationship.
     * @param {PWSTR} ServerIpAddress Pointer to a null-terminated Unicode string that represents the IP address or hostname of the DHCP server.
     * @param {Pointer<DHCP_FAILOVER_RELATIONSHIP>} pRelationship Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_failover_relationship">DHCP_FAILOVER_RELATIONSHIP</a> structure that contains both the scope information to add and the failover relationship to modify.
     * @returns {Integer} If the function succeeds, it returns <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, it returns one of the following or an error code from <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the parameters were invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_SUBNET_NOT_PRESENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * IPv4 scope doesn't exist on the DHCPv4 server.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_FO_SCOPE_ALREADY_IN_RELATIONSHIP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * IPv4 scope is already part of another failover relationship.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_FO_RELATIONSHIP_DOES_NOT_EXIST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failover relationship doesn't exist.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_FO_MAX_ADD_SCOPES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Number of scopes being added to the failover relationship exceeds the max number of scopes which can be added to a failover relationship at one time.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpv4failoveraddscopetorelationship
     * @since windowsserver2012
     */
    static DhcpV4FailoverAddScopeToRelationship(ServerIpAddress, pRelationship) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpV4FailoverAddScopeToRelationship", "ptr", ServerIpAddress, "ptr", pRelationship, "uint")
        return result
    }

    /**
     * Deletes a DHCPv4 scope from the specified failover relationship.
     * @param {PWSTR} ServerIpAddress Pointer to a null-terminated Unicode string that represents the IP address or hostname of the DHCP server.
     * @param {Pointer<DHCP_FAILOVER_RELATIONSHIP>} pRelationship Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_failover_relationship">DHCP_FAILOVER_RELATIONSHIP</a> structure that contains  the scopes to delete. The scopes are defined in the <b>pScopes</b> member of this structure.
     * @returns {Integer} If the function succeeds, it returns <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, it returns one of the following or an error code from <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the parameters were invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_SUBNET_NOT_PRESENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * IPv4 scope doesn't exist on the DHCPv4 server.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_FO_RELATIONSHIP_DOES_NOT_EXIST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failover relationship doesn't exist.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_FO_SCOPE_NOT_IN_RELATIONSHIP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * IPv4 subnet is not part of the failover relationship.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpv4failoverdeletescopefromrelationship
     * @since windowsserver2012
     */
    static DhcpV4FailoverDeleteScopeFromRelationship(ServerIpAddress, pRelationship) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpV4FailoverDeleteScopeFromRelationship", "ptr", ServerIpAddress, "ptr", pRelationship, "uint")
        return result
    }

    /**
     * Retrieves the failover relationship that is configured on a specified DHCPv4 scope.
     * @param {PWSTR} ServerIpAddress Pointer to a null-terminated Unicode string that represents the IP address or hostname of the DHCP server.
     * @param {Integer} ScopeId A <b>DHCP_IP_ADDRESS</b> field that contains the IPv4 scope address for which the relationship details are to be retrieved.
     * @param {Pointer<DHCP_FAILOVER_RELATIONSHIP>} pRelationship Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_failover_relationship">DHCP_FAILOVER_RELATIONSHIP</a> structure that contains information about the retrieved failover relationship which contains <b>scopeId</b> field in its <b>pScopes</b> member.
     * 
     * <div class="alert"><b>Note</b>  <p class="note">The memory for this parameter must be free using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dhcpsapi/nf-dhcpsapi-dhcprpcfreememory">DhcpRpcFreeMemory</a>.
     * 
     * </div>
     * <div> </div>
     * @returns {Integer} If the function succeeds, it returns <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, it returns one of the following or an error code from <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the parameters were invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_FO_SCOPE_NOT_IN_RELATIONSHIP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * IPv4 subnet is not part of the failover relationship.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpv4failovergetscoperelationship
     * @since windowsserver2012
     */
    static DhcpV4FailoverGetScopeRelationship(ServerIpAddress, ScopeId, pRelationship) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpV4FailoverGetScopeRelationship", "ptr", ServerIpAddress, "uint", ScopeId, "ptr", pRelationship, "uint")
        return result
    }

    /**
     * Retrieves the address usage statistics of a specific scope that is part of a failover relationship.
     * @param {PWSTR} ServerIpAddress Pointer to a null-terminated Unicode string that represents the IP address or hostname of the DHCP server.
     * @param {Integer} ScopeId <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_ADDRESS</a> structure that contains the IPv4 scope address of the address usage statistics to retrieve.
     * @param {Pointer<DHCP_FAILOVER_STATISTICS>} pStats Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_failover_statistics">DHCP_FAILOVER_STATISTICS</a> structure that contains the address usage information for <i>scopeId</i>.
     * 
     * <div class="alert"><b>Note</b>  <p class="note">The memory for this parameter must be free using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dhcpsapi/nf-dhcpsapi-dhcprpcfreememory">DhcpRpcFreeMemory</a>.
     * 
     * </div>
     * <div> </div>
     * @returns {Integer} If the function succeeds, it returns <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, it returns one of the following or an error code from <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the parameters were invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpv4failovergetscopestatistics
     * @since windowsserver2012
     */
    static DhcpV4FailoverGetScopeStatistics(ServerIpAddress, ScopeId, pStats) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpV4FailoverGetScopeStatistics", "ptr", ServerIpAddress, "uint", ScopeId, "ptr", pStats, "uint")
        return result
    }

    /**
     * Retrieves the DHCPv4 client lease information.
     * @param {PWSTR} ServerIpAddress Pointer to a null-terminated Unicode string that represents the IP address or hostname of the DHCP server.
     * @param {Pointer<DHCP_SEARCH_INFO>} SearchInfo Pointer to a <a href="https://docs.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_search_info">DHCP_SEARCH_INFO</a> structure that defines the key used to search the DHCPv4 client lease record on the server. 
     * If the <b>SearchType</b> member of <i>SearchInfo</i> is <b>DhcpClientName</b> and there are multiple lease records with the same client name, the server will return client information for the client with the lowest numerical IP address.
     * @param {Pointer<DHCPV4_FAILOVER_CLIENT_INFO>} ClientInfo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcpv4_failover_client_info">DHCPV4_FAILOVER_CLIENT_INFO</a> structure that contains the retrieved DHCPv4 client lease record.
     * 
     * <div class="alert"><b>Note</b>  <p class="note">The memory for this parameter must be free using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dhcpsapi/nf-dhcpsapi-dhcprpcfreememory">DhcpRpcFreeMemory</a>.
     * 
     * </div>
     * <div> </div>
     * @returns {Integer} If the function succeeds, it returns <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, it returns one of the following or an error code from <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the parameters were invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_JET_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred while accessing the DHCP server database or the client entry is not present in the database.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpv4failovergetclientinfo
     * @since windowsserver2012
     */
    static DhcpV4FailoverGetClientInfo(ServerIpAddress, SearchInfo, ClientInfo) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpV4FailoverGetClientInfo", "ptr", ServerIpAddress, "ptr", SearchInfo, "ptr", ClientInfo, "uint")
        return result
    }

    /**
     * Returns the current time on the DHCP server.
     * @param {PWSTR} ServerIpAddress Pointer to a null-terminated Unicode string that represents the IP address or hostname of the DHCP server.
     * @param {Pointer<UInt32>} pTime Pointer to a <b>DWORD</b> that returns the current time, in seconds, elapsed since midnight, January 1, 1970, Coordinated Universal Time (UTC), on the DHCP server.
     * @param {Pointer<UInt32>} pMaxAllowedDeltaTime The maximum allowed delta time.
     * @returns {Integer} If the function succeeds, it returns <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, it returns one of the following or an error code from <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the parameters were invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpv4failovergetsystemtime
     * @since windowsserver2012
     */
    static DhcpV4FailoverGetSystemTime(ServerIpAddress, pTime, pMaxAllowedDeltaTime) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpV4FailoverGetSystemTime", "ptr", ServerIpAddress, "uint*", pTime, "uint*", pMaxAllowedDeltaTime, "uint")
        return result
    }

    /**
     * Returns the status of a IPv4 address.
     * @param {PWSTR} ServerIpAddress Pointer to a null-terminated Unicode string that represents the IP address or hostname of the DHCP server.
     * @param {Integer} SubnetAddress <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_ADDRESS</a> structure that contains the IPv4 address whose status is being requested.
     * @param {Pointer<UInt32>} pStatus Pointer to a DWORD that returns the status of the IPv4 address as specified in the table below:
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
     * The IPv4 address will be leased by a primary server.
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
     * The IPv4 address will be leased by a secondary server.
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
     * The IPv4 address is part of an exclusion range.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The IPv4 address is a reservation.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} If the function succeeds, it returns <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, it returns one of the following or an error code from <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpv4failovergetaddressstatus
     * @since windowsserver2012
     */
    static DhcpV4FailoverGetAddressStatus(ServerIpAddress, SubnetAddress, pStatus) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpV4FailoverGetAddressStatus", "ptr", ServerIpAddress, "uint", SubnetAddress, "uint*", pStatus, "uint")
        return result
    }

    /**
     * Redistributes the free addresses between the primary server and the secondary server that are part of a failover relationship.
     * @param {PWSTR} ServerIpAddress Pointer to a null-terminated Unicode string that represents the IP address or hostname of the DHCP server.
     * @param {PWSTR} pFailRelName Pointer to a null-terminated Unicode string that represents the name of the failover relationship for which free addresses are to be redistributed.
     * @returns {Integer} If the function succeeds, it returns <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, it returns one of the following or an error code from <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the parameters were invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_FO_RELATIONSHIP_DOES_NOT_EXIST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failover relationship doesn't exit.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_FO_RELATION_IS_SECONDARY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>serverType</b> member of failover relationship is <b>SecondaryServer</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpv4failovertriggeraddrallocation
     * @since windowsserver2012
     */
    static DhcpV4FailoverTriggerAddrAllocation(ServerIpAddress, pFailRelName) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress
        pFailRelName := pFailRelName is String ? StrPtr(pFailRelName) : pFailRelName

        result := DllCall("DHCPSAPI.dll\DhcpV4FailoverTriggerAddrAllocation", "ptr", ServerIpAddress, "ptr", pFailRelName, "uint")
        return result
    }

    /**
     * Allocates and initializes a DHCP server policy structure.
     * @param {PWSTR} PolicyName A null-terminated unicode string that contains the name of the DHCP server policy to create.
     * @param {BOOL} fGlobalPolicy If <b>TRUE</b> a server level policy is created. Otherwise, a scope level policy is created
     * @param {Integer} Subnet <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_ADDRESS</a> structure that contains the IPv4 subnet address of the scope level policy to create.
     * @param {Integer} ProcessingOrder Integer that specifies the processing order of the DHCP server policy. 1 indicates the highest priority and <b>MAX_DWORD</b> indicates the lowest.
     * @param {Integer} RootOperator <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dhcpsapi/ne-dhcpsapi-dhcp_pol_logic_oper">DHCP_POL_LOGIC_OPER</a> enumeration that defines how the policy condition is to be evaluated in terms of the results of its constituents.
     * @param {PWSTR} Description A pointer to a null-terminated Unicode string that contains the description of the DHCP server policy.
     * @param {BOOL} Enabled <b>TRUE</b> if the policy is enabled. Otherwise, it is <b>FALSE</b>.
     * @param {Pointer<DHCP_POLICY>} Policy Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_policy">DHCP_POLICY</a> structure that contains the parameters of the policy to create.
     * @returns {Integer} If the function succeeds, it returns <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, it returns one of the following or an error code from <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the parameters were invalid.
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
     * Not enough memory available.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcphlprcreatev4policy
     * @since windowsserver2012
     */
    static DhcpHlprCreateV4Policy(PolicyName, fGlobalPolicy, Subnet, ProcessingOrder, RootOperator, Description, Enabled, Policy) {
        PolicyName := PolicyName is String ? StrPtr(PolicyName) : PolicyName
        Description := Description is String ? StrPtr(Description) : Description

        result := DllCall("DHCPSAPI.dll\DhcpHlprCreateV4Policy", "ptr", PolicyName, "ptr", fGlobalPolicy, "uint", Subnet, "uint", ProcessingOrder, "int", RootOperator, "ptr", Description, "ptr", Enabled, "ptr", Policy, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} PolicyName 
     * @param {BOOL} fGlobalPolicy 
     * @param {Integer} Subnet 
     * @param {Integer} ProcessingOrder 
     * @param {Integer} RootOperator 
     * @param {PWSTR} Description 
     * @param {BOOL} Enabled 
     * @param {Pointer<DHCP_POLICY_EX>} Policy 
     * @returns {Integer} 
     */
    static DhcpHlprCreateV4PolicyEx(PolicyName, fGlobalPolicy, Subnet, ProcessingOrder, RootOperator, Description, Enabled, Policy) {
        PolicyName := PolicyName is String ? StrPtr(PolicyName) : PolicyName
        Description := Description is String ? StrPtr(Description) : Description

        result := DllCall("DHCPSAPI.dll\DhcpHlprCreateV4PolicyEx", "ptr", PolicyName, "ptr", fGlobalPolicy, "uint", Subnet, "uint", ProcessingOrder, "int", RootOperator, "ptr", Description, "ptr", Enabled, "ptr", Policy, "uint")
        return result
    }

    /**
     * Allocates, initializes, and adds a DHCP server policy expression to a DHCP server policy.
     * @param {Pointer<DHCP_POLICY>} Policy Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_policy">DHCP_POLICY</a> structure that contains the policy to modify
     * @param {Integer} ParentExpr Integer that specifies the expression index that corresponds to this constituent condition.
     * @param {Integer} Operator A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dhcpsapi/ne-dhcpsapi-dhcp_pol_logic_oper">DHCP_POL_LOGIC_OPER</a> enumeration that defines how the expression is to be evaluated in terms of the results of its constituents.
     * @param {Pointer<UInt32>} ExprIndex Pointer to a <b>DWORD</b> that contains the newly created expression's index in the DHCP server policy.
     * @returns {Integer} If the function succeeds, it returns <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, it returns one of the following or an error code from <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the  parameters were invalid.
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
     * Not enough memory available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_POLICY_BAD_PARENT_EXPR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The parent expression specified does not exist.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcphlpraddv4policyexpr
     * @since windowsserver2012
     */
    static DhcpHlprAddV4PolicyExpr(Policy, ParentExpr, Operator, ExprIndex) {
        result := DllCall("DHCPSAPI.dll\DhcpHlprAddV4PolicyExpr", "ptr", Policy, "uint", ParentExpr, "int", Operator, "uint*", ExprIndex, "uint")
        return result
    }

    /**
     * Allocates, initializes, and adds a DHCP server policy condition to a DHCP server policy.
     * @param {Pointer<DHCP_POLICY>} Policy Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_policy">DHCP_POLICY</a> structure that contains the policy to modify.
     * @param {Integer} ParentExpr Integer that specifies the expression index that corresponds to this constituent condition.
     * @param {Integer} Type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dhcpsapi/ne-dhcpsapi-dhcp_pol_attr_type">DHCP_POL_ATTR_TYPE</a> enumeration that specifies the attribute type for this condition.
     * @param {Integer} OptionID <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_OPTION_ID</a> value that specifies the unique option identifier for criteria based on DHCP options or sub-options.
     * @param {Integer} SubOptionID <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_OPTION_ID</a> value that specifies the unique sub-option identifier for criteria based on DHCP sub-options.
     * @param {PWSTR} VendorName A pointer to a null-terminated Unicode string that represents the vendor name.
     * @param {Integer} Operator <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dhcpsapi/ne-dhcpsapi-dhcp_pol_comparator">DHCP_POL_COMPARATOR</a> enumeration that specifies the comparison operator for the condition.
     * @param {Pointer} Value Pointer to an array of bytes that contains the value to be used for the comparison.
     * @param {Integer} ValueLength Integer that specifies the length of <b>Value</b>.
     * @param {Pointer<UInt32>} ConditionIndex Pointer to a <b>DWORD</b> that contains the newly created condition's index in the DHCP server policy.
     * @returns {Integer} If the function succeeds, it returns <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, it returns one of the following or an error code from <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the parameters were invalid.
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
     * Not enough memory available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_POLICY_BAD_PARENT_EXPR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The parent expression specified does not exist.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcphlpraddv4policycondition
     * @since windowsserver2012
     */
    static DhcpHlprAddV4PolicyCondition(Policy, ParentExpr, Type, OptionID, SubOptionID, VendorName, Operator, Value, ValueLength, ConditionIndex) {
        VendorName := VendorName is String ? StrPtr(VendorName) : VendorName

        result := DllCall("DHCPSAPI.dll\DhcpHlprAddV4PolicyCondition", "ptr", Policy, "uint", ParentExpr, "int", Type, "uint", OptionID, "uint", SubOptionID, "ptr", VendorName, "int", Operator, "ptr", Value, "uint", ValueLength, "uint*", ConditionIndex, "uint")
        return result
    }

    /**
     * Adds a DHCP IPv4 range to a DHCP server policy.
     * @param {Pointer<DHCP_POLICY>} Policy Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_policy">DHCP_POLICY</a> structure that contains the policy to modify.
     * @param {Pointer<DHCP_IP_RANGE>} Range Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_ip_range">DHCP_IP_RANGE</a> structure that contains the DHCP IPv4 range to add to the DHCP server policy range array.
     * @returns {Integer} If the function succeeds, it returns <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, it returns one of the following or an error code from <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the parameters were invalid.
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
     * Not enough memory available.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcphlpraddv4policyrange
     * @since windowsserver2012
     */
    static DhcpHlprAddV4PolicyRange(Policy, Range) {
        result := DllCall("DHCPSAPI.dll\DhcpHlprAddV4PolicyRange", "ptr", Policy, "ptr", Range, "uint")
        return result
    }

    /**
     * Resets the DHCP server policy expression in a DHCP server policy structure.
     * @param {Pointer<DHCP_POLICY>} Policy Pointer to <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_policy">DHCP_POLICY</a> structure that contains the policy to reset.
     * @returns {Integer} If the function succeeds, it returns <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, it returns one of the following or an error code from <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the parameters were invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcphlprresetv4policyexpr
     * @since windowsserver2012
     */
    static DhcpHlprResetV4PolicyExpr(Policy) {
        result := DllCall("DHCPSAPI.dll\DhcpHlprResetV4PolicyExpr", "ptr", Policy, "uint")
        return result
    }

    /**
     * Modifies the DHCP server policy expression in a DHCP server policy structure.
     * @param {Pointer<DHCP_POLICY>} Policy Pointer to <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_policy">DHCP_POLICY</a> structure that contains the policy to modify.
     * @param {Integer} Operator A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dhcpsapi/ne-dhcpsapi-dhcp_pol_logic_oper">DHCP_POL_LOGIC_OPER</a> enumeration that defines how the policy condition is to be evaluated in terms of the results of its constituents.
     * @returns {Integer} If the function succeeds, it returns <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, it returns one of the following or an error code from <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the parameters were invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcphlprmodifyv4policyexpr
     * @since windowsserver2012
     */
    static DhcpHlprModifyV4PolicyExpr(Policy, Operator) {
        result := DllCall("DHCPSAPI.dll\DhcpHlprModifyV4PolicyExpr", "ptr", Policy, "int", Operator, "uint")
        return result
    }

    /**
     * Frees the memory of all the data structures within a DHCP server policy structure.
     * @param {Pointer<DHCP_POLICY>} Policy Pointer to <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_policy">DHCP_POLICY</a> structure that contains the policy structure  to free.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcphlprfreev4policy
     * @since windowsserver2012
     */
    static DhcpHlprFreeV4Policy(Policy) {
        DllCall("DHCPSAPI.dll\DhcpHlprFreeV4Policy", "ptr", Policy)
    }

    /**
     * 
     * @param {Pointer<DHCP_POLICY_ARRAY>} PolicyArray 
     * @returns {String} Nothing - always returns an empty string
     */
    static DhcpHlprFreeV4PolicyArray(PolicyArray) {
        DllCall("DHCPSAPI.dll\DhcpHlprFreeV4PolicyArray", "ptr", PolicyArray)
    }

    /**
     * 
     * @param {Pointer<DHCP_POLICY_EX>} PolicyEx 
     * @returns {String} Nothing - always returns an empty string
     */
    static DhcpHlprFreeV4PolicyEx(PolicyEx) {
        DllCall("DHCPSAPI.dll\DhcpHlprFreeV4PolicyEx", "ptr", PolicyEx)
    }

    /**
     * 
     * @param {Pointer<DHCP_POLICY_EX_ARRAY>} PolicyExArray 
     * @returns {String} Nothing - always returns an empty string
     */
    static DhcpHlprFreeV4PolicyExArray(PolicyExArray) {
        DllCall("DHCPSAPI.dll\DhcpHlprFreeV4PolicyExArray", "ptr", PolicyExArray)
    }

    /**
     * 
     * @param {Pointer<DHCP_PROPERTY>} Property 
     * @returns {String} Nothing - always returns an empty string
     */
    static DhcpHlprFreeV4DhcpProperty(Property) {
        DllCall("DHCPSAPI.dll\DhcpHlprFreeV4DhcpProperty", "ptr", Property)
    }

    /**
     * 
     * @param {Pointer<DHCP_PROPERTY_ARRAY>} PropertyArray 
     * @returns {String} Nothing - always returns an empty string
     */
    static DhcpHlprFreeV4DhcpPropertyArray(PropertyArray) {
        DllCall("DHCPSAPI.dll\DhcpHlprFreeV4DhcpPropertyArray", "ptr", PropertyArray)
    }

    /**
     * 
     * @param {Pointer<DHCP_PROPERTY_ARRAY>} PropertyArray 
     * @param {Integer} ID 
     * @param {Integer} Type 
     * @returns {Pointer<DHCP_PROPERTY>} 
     */
    static DhcpHlprFindV4DhcpProperty(PropertyArray, ID, Type) {
        result := DllCall("DHCPSAPI.dll\DhcpHlprFindV4DhcpProperty", "ptr", PropertyArray, "int", ID, "int", Type, "ptr")
        return result
    }

    /**
     * Verifies that a DHCP server policy is based on a single user class.
     * @param {Pointer<DHCP_POLICY>} Policy Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_policy">DHCP_POLICY</a> structure that contains the policy to verify.
     * @returns {BOOL} The API returns <b>TRUE</b> if there is a single condition associated with the specified policy. This condition should be based on one of the user classes defined on the DHCP server. Otherwise, it returns <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcphlprisv4policysingleuc
     * @since windowsserver2012
     */
    static DhcpHlprIsV4PolicySingleUC(Policy) {
        result := DllCall("DHCPSAPI.dll\DhcpHlprIsV4PolicySingleUC", "ptr", Policy, "ptr")
        return result
    }

    /**
     * Retrieves the policy enforcement state on the server or the specified IPv4 subnet from the DHCP Server.
     * @param {PWSTR} ServerIpAddress Pointer to a null-terminated Unicode string that represents the IP address or hostname of the DHCP server.
     * @param {BOOL} fGlobalPolicy If <b>TRUE</b> the policy enforcement state of the server is retrieved. Otherwise, the policy enforcement state of specified Ipv4 scope is retrieved.
     * @param {Integer} SubnetAddress <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_ADDRESS</a> structure that contains the IPv4 subnet address of the policy enforcement state to retrieve.
     * @param {Pointer<BOOL>} Enabled Pointer to a <b>BOOL</b> that indicates the state of policy enforcement. If  <b>TRUE</b> the policy enforcement state is enabled. Otherwise, the policy enforcement state is disabled.
     * 
     * <div class="alert"><b>Note</b>  The memory for this must be allocated by the caller.
     * 
     * </div>
     * <div> </div>
     * @returns {Integer} If the function succeeds, it returns <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, it returns one of the following or an error code from <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the parameters were invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_SUBNET_NOT_PRESENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified IPv4 subnet does not exist.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpv4querypolicyenforcement
     * @since windowsserver2012
     */
    static DhcpV4QueryPolicyEnforcement(ServerIpAddress, fGlobalPolicy, SubnetAddress, Enabled) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpV4QueryPolicyEnforcement", "ptr", ServerIpAddress, "ptr", fGlobalPolicy, "uint", SubnetAddress, "ptr", Enabled, "uint")
        return result
    }

    /**
     * Sets the policy enforcement state of the server or the specified IPv4 subnet on the DHCP Server.
     * @param {PWSTR} ServerIpAddress Pointer to a null-terminated Unicode string that represents the IP address or hostname of the DHCP server.
     * @param {BOOL} fGlobalPolicy If <b>TRUE</b> the policy enforcement state of the server is set. Otherwise, the policy enforcement state of specified Ipv4 scope is set.
     * @param {Integer} SubnetAddress <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_ADDRESS</a> structure that contains the IPv4 subnet address of the policy enforcement state to set.
     * @param {BOOL} Enable If  <b>TRUE</b> the policy enforcement state is enabled. Otherwise, the policy enforcement state is disabled.
     * @returns {Integer} If the function succeeds, it returns <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, it returns one of the following or an error code from <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the parameters were invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_SUBNET_NOT_PRESENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified IPv4 subnet does not exist.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpv4setpolicyenforcement
     * @since windowsserver2012
     */
    static DhcpV4SetPolicyEnforcement(ServerIpAddress, fGlobalPolicy, SubnetAddress, Enable) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpV4SetPolicyEnforcement", "ptr", ServerIpAddress, "ptr", fGlobalPolicy, "uint", SubnetAddress, "ptr", Enable, "uint")
        return result
    }

    /**
     * Verifies that a DHCP server policy structure is well formed.
     * @param {Pointer<DHCP_POLICY>} pPolicy Pointer to <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_policy">DHCP_POLICY</a> structure that contains the policy to verify
     * @returns {BOOL} The API returns <b>TRUE</b> if the specified policy satisfies the conditions in the <b>Remarks</b> below. Otherwise, it returns <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcphlprisv4policywellformed
     * @since windowsserver2012
     */
    static DhcpHlprIsV4PolicyWellFormed(pPolicy) {
        result := DllCall("DHCPSAPI.dll\DhcpHlprIsV4PolicyWellFormed", "ptr", pPolicy, "ptr")
        return result
    }

    /**
     * Verifies a DHCP server policy.
     * @param {Pointer<DHCP_POLICY>} pPolicy Pointer to <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_policy">DHCP_POLICY</a> structure that contains the policy to verify.
     * @returns {Integer} If the function succeeds, it returns <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, it returns one of the following or an error code from <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_SUBNET_NOT_PRESENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified IPv4 subnet does not exist.
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
     * The parameter was invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_INVALID_POLICY_EXPRESSION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified conditions or expressions of the policy are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_RANGE_INVALID_IN_SERVER_POLICY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A policy range has been specified for a server level policy.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_POLICY_RANGE_BAD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified policy range is not contained within the IP address range of the scope or the specified policy range is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcphlprisv4policyvalid
     * @since windowsserver2012
     */
    static DhcpHlprIsV4PolicyValid(pPolicy) {
        result := DllCall("DHCPSAPI.dll\DhcpHlprIsV4PolicyValid", "ptr", pPolicy, "uint")
        return result
    }

    /**
     * Creates a new policy on the DHCP Server.
     * @param {PWSTR} ServerIpAddress Pointer to a null-terminated Unicode string that represents the IP address or hostname of the DHCP server.
     * @param {Pointer<DHCP_POLICY>} pPolicy Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_policy">DHCP_POLICY</a> structure that contains the parameters of the policy to create.
     * @returns {Integer} If the function succeeds, it returns <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, it returns one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_SUBNET_NOT_PRESENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified IPv4 subnet does not exist.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_RANGE_INVALID_IN_SERVER_POLICY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A policy range has been specified for a server level policy.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_INVALID_POLICY_EXPRESSION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified conditions or expressions of the policy are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_POLICY_RANGE_BAD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified policy IP range is not contained within the IP address range of the scope or the specified policy IP range is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_POLICY_EXISTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified policy name exists at the specified level (server or scope).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_POLICY_RANGE_EXISTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified policy IP range overlaps with the policy IP ranges of an existing policy at the specified scope.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_INVALID_PROCESSING_ORDER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified processing order is greater than the maximum processing order of the existing policies at the specified level (server or scope).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_CLASS_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The vendor class or user class reference in the conditions of the policy does not exist.
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
     * The parameters were invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpv4createpolicy
     * @since windowsserver2012
     */
    static DhcpV4CreatePolicy(ServerIpAddress, pPolicy) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpV4CreatePolicy", "ptr", ServerIpAddress, "ptr", pPolicy, "uint")
        return result
    }

    /**
     * Retrieves a policy from the DHCP Server.
     * @param {PWSTR} ServerIpAddress Pointer to a null-terminated Unicode string that represents the IP address or hostname of the DHCP server.
     * @param {BOOL} fGlobalPolicy If <b>TRUE</b> the server level policy is retrieved. Otherwise, the scope level policy is retrieved.
     * @param {Integer} SubnetAddress <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_ADDRESS</a> structure that contains the IPv4 subnet address of the policy to retrieve.
     * @param {PWSTR} PolicyName A null-terminated Unicode string that represents the name of the policy to retrieve.
     * @param {Pointer<DHCP_POLICY>} Policy Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_policy">DHCP_POLICY</a> structure that contains the parameters of the policy requested in <i>PolicyName</i>.
     * @returns {Integer} If the function succeeds, it returns <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, it returns one of the following or an error code from <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the parameters were invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_SUBNET_NOT_PRESENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified IPv4 subnet does not exist.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_POLICY_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The DHCP server policy was not found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpv4getpolicy
     * @since windowsserver2012
     */
    static DhcpV4GetPolicy(ServerIpAddress, fGlobalPolicy, SubnetAddress, PolicyName, Policy) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress
        PolicyName := PolicyName is String ? StrPtr(PolicyName) : PolicyName

        result := DllCall("DHCPSAPI.dll\DhcpV4GetPolicy", "ptr", ServerIpAddress, "ptr", fGlobalPolicy, "uint", SubnetAddress, "ptr", PolicyName, "ptr", Policy, "uint")
        return result
    }

    /**
     * Updates one or more parameters of an existing policy.
     * @param {PWSTR} ServerIpAddress Pointer to a null-terminated Unicode string that represents the IP address or hostname of the DHCP server.
     * @param {Integer} FieldsModified A value from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dhcpsapi/ne-dhcpsapi-dhcp_policy_fields_to_update">DHCP_POLICY_FIELDS_TO_UPDATE</a> enumeration that defines the DHCPv4 policy fields to modify.
     * @param {BOOL} fGlobalPolicy If <b>TRUE</b> the server level policy is set. Otherwise, the scope level policy is set.
     * @param {Integer} SubnetAddress <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_ADDRESS</a> structure that contains the IPv4 subnet address of the policy to modify.
     * @param {PWSTR} PolicyName A null-terminated Unicode string that represents the name of the policy to modify.
     * @param {Pointer<DHCP_POLICY>} Policy Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_policy">DHCP_POLICY</a> structure that contains the parameters of the policy to modify.
     * @returns {Integer} If the function succeeds, it returns <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, it returns one of the following or an error code from <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the parameters were invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_SUBNET_NOT_PRESENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified IPv4 subnet does not exist.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_RANGE_INVALID_IN_SERVER_POLICY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A policy range has been specified for a server level policy.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_INVALID_POLICY_EXPRESSION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified conditions or expressions of the policy are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_POLICY_RANGE_BAD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified policy range is not contained within the IP address range of the scope or the specified policy range is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_POLICY_RANGE_EXISTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified policy range overlaps with the policy ranges of an existing policy at the specified scope.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_INVALID_PROCESSING_ORDER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified processing order is greater than the maximum processing order of the existing policies at the specified level (server or scope).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_CLASS_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The vendor class or user class reference in the conditions of the policy does not exist.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpv4setpolicy
     * @since windowsserver2012
     */
    static DhcpV4SetPolicy(ServerIpAddress, FieldsModified, fGlobalPolicy, SubnetAddress, PolicyName, Policy) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress
        PolicyName := PolicyName is String ? StrPtr(PolicyName) : PolicyName

        result := DllCall("DHCPSAPI.dll\DhcpV4SetPolicy", "ptr", ServerIpAddress, "uint", FieldsModified, "ptr", fGlobalPolicy, "uint", SubnetAddress, "ptr", PolicyName, "ptr", Policy, "uint")
        return result
    }

    /**
     * Deletes an existing policy from the DHCP Server.
     * @param {PWSTR} ServerIpAddress Pointer to a null-terminated Unicode string that represents the IP address or hostname of the DHCP server.
     * @param {BOOL} fGlobalPolicy If <b>TRUE</b> the server level policy is deleted. Otherwise, the scope level policy is deleted.
     * @param {Integer} SubnetAddress <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_ADDRESS</a> structure that contains the IPv4 subnet address of the policy to delete.
     * @param {PWSTR} PolicyName A null-terminated Unicode string that represents the name of the policy to delete.
     * @returns {Integer} If the function succeeds, it returns <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, it returns one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_SUBNET_NOT_PRESENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified IPv4 subnet does not exist.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_POLICY_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The DHCP server policy was not found.
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
     * The parameters were invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpv4deletepolicy
     * @since windowsserver2012
     */
    static DhcpV4DeletePolicy(ServerIpAddress, fGlobalPolicy, SubnetAddress, PolicyName) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress
        PolicyName := PolicyName is String ? StrPtr(PolicyName) : PolicyName

        result := DllCall("DHCPSAPI.dll\DhcpV4DeletePolicy", "ptr", ServerIpAddress, "ptr", fGlobalPolicy, "uint", SubnetAddress, "ptr", PolicyName, "uint")
        return result
    }

    /**
     * Enumerates the policies configured on the DHCP Server.
     * @param {PWSTR} ServerIpAddress Pointer to a null-terminated Unicode string that represents the IP address or hostname of the DHCP server.
     * @param {Pointer<UInt32>} ResumeHandle Pointer to a  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_RESUME_HANDLE</a> structure that identifies this enumeration for use in subsequent calls to this function.
     * 
     * Initially, this value should be zero on input. If successful, the returned value should be used for subsequent enumeration requests. For example, if <i>PreferredMaximum</i> is set to 100, and 200 policies are configured on the server, the resume handle can be used after the first 100 policies are retrieved to obtain the next 100 on a subsequent call.
     * @param {Integer} PreferredMaximum The maximum number of policy structures to return in <i>EnumInfo</i>. If <i>PreferredMaximum</i> is greater than the number of remaining non-enumerated policies on the server, the remaining number of  non-enumerated policies is returned.
     * @param {BOOL} fGlobalPolicy If <b>TRUE</b> the server level policy is enumerated. Otherwise, the scope level policy is enumerated.
     * @param {Integer} SubnetAddress <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_ADDRESS</a> structure that contains the IPv4 subnet address of the policies to enumerate.
     * @param {Pointer<DHCP_POLICY_ARRAY>} EnumInfo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_policy_array">DHCP_POLICY_ARRAY</a> structure that contains the policies available on the DHCP server. If no policies are configured, this value is <b>NULL</b>.
     * @param {Pointer<UInt32>} ElementsRead Pointer to a <b>DWORD</b> that specifies the number of policies returned in <i>EnumInfo</i>.
     * @param {Pointer<UInt32>} ElementsTotal Pointer to a <b>DWORD</b>  that specifies the number of policies configured on the DHCP server that have not yet been enumerated.
     * @returns {Integer} If the function succeeds, it returns <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, it returns one of the following or an error code from <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are more elements available to enumerate.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are no more elements left to enumerate.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpv4enumpolicies
     * @since windowsserver2012
     */
    static DhcpV4EnumPolicies(ServerIpAddress, ResumeHandle, PreferredMaximum, fGlobalPolicy, SubnetAddress, EnumInfo, ElementsRead, ElementsTotal) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpV4EnumPolicies", "ptr", ServerIpAddress, "uint*", ResumeHandle, "uint", PreferredMaximum, "ptr", fGlobalPolicy, "uint", SubnetAddress, "ptr", EnumInfo, "uint*", ElementsRead, "uint*", ElementsTotal, "uint")
        return result
    }

    /**
     * Adds an IP address range to a policy.
     * @param {PWSTR} ServerIpAddress Pointer to a null-terminated Unicode string that represents the IP address or hostname of the DHCP server.
     * @param {Integer} SubnetAddress <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_ADDRESS</a> structure that contains the IPv4 subnet address of the policy IP address range to add.
     * @param {PWSTR} PolicyName A null-terminated Unicode string that represents the name of the policy IP address range to add.
     * @param {Pointer<DHCP_IP_RANGE>} Range A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_ip_range">DHCP_IP_RANGE</a> structure that  contains the policy IP address range to add.
     * @returns {Integer} If the function succeeds, it returns <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, it returns one of the following or an error code from <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_SUBNET_NOT_PRESENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified IPv4 subnet does not exist.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_POLICY_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified policy does not exist.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_POLICY_RANGE_EXISTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified policy IP range overlaps with one of the policy IP address ranges specified.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_POLICY_RANGE_BAD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified policy IP range is not contained within the IP address range of the scope or the specified policy IP range is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpv4addpolicyrange
     * @since windowsserver2012
     */
    static DhcpV4AddPolicyRange(ServerIpAddress, SubnetAddress, PolicyName, Range) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress
        PolicyName := PolicyName is String ? StrPtr(PolicyName) : PolicyName

        result := DllCall("DHCPSAPI.dll\DhcpV4AddPolicyRange", "ptr", ServerIpAddress, "uint", SubnetAddress, "ptr", PolicyName, "ptr", Range, "uint")
        return result
    }

    /**
     * Removes the specified IP address range from the list of IP address ranges of the policy.
     * @param {PWSTR} ServerIpAddress Pointer to a null-terminated Unicode string that represents the IP address or hostname of the DHCP server.
     * @param {Integer} SubnetAddress <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_ADDRESS</a> structure that contains the IPv4 subnet address of the policy IP address range to remove.
     * @param {PWSTR} PolicyName A null-terminated Unicode string that represents the name of the policy IP address range to remove.
     * @param {Pointer<DHCP_IP_RANGE>} Range A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_ip_range">DHCP_IP_RANGE</a> structure that  contains the policy IP address range to remove.
     * @returns {Integer} If the function succeeds, it returns <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, it returns one of the following or an error code from <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the parameters were invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_SUBNET_NOT_PRESENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified IPv4 subnet does not exist.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_POLICY_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified policy does not exist.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_POLICY_RANGE_BAD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified policy range is not contained within the IP address range of the scope.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpv4removepolicyrange
     * @since windowsserver2012
     */
    static DhcpV4RemovePolicyRange(ServerIpAddress, SubnetAddress, PolicyName, Range) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress
        PolicyName := PolicyName is String ? StrPtr(PolicyName) : PolicyName

        result := DllCall("DHCPSAPI.dll\DhcpV4RemovePolicyRange", "ptr", ServerIpAddress, "uint", SubnetAddress, "ptr", PolicyName, "ptr", Range, "uint")
        return result
    }

    /**
     * Sets the DHCPv6 stateless client inventory configuration settings at the server or scope level.
     * @param {PWSTR} ServerIpAddress Pointer to a Unicode string that specifies the IP address or hostname of the DHCP server.
     * @param {BOOL} fServerLevel If <b>TRUE</b> the stateless client inventory configuration settings at server level are modified. Otherwise, the scope level configuration settings are modified.
     * @param {DHCP_IPV6_ADDRESS} SubnetAddress A <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_ipv6_address">DHCP_IPV6_ADDRESS</a> structure that contains the IPv6 subnet address of the stateless client inventory configuration settings to be modified. 
     * If the value of <i>fServerLevel</i> is <b>TRUE</b>, this must be 0.
     * @param {Integer} FieldModified A value from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dhcpsapi/ne-dhcpsapi-dhcpv6_stateless_param_type">DHCPV6_STATELESS_PARAM_TYPE</a> enumeration that defines the DHCPv6 stateless client inventory configuration parameter type to be modified.
     * @param {Pointer<DHCPV6_STATELESS_PARAMS>} Params Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcpv6_stateless_params">DHCPV6_STATELESS_PARAMS</a> structure that contains the stateless client inventory configuration settings for a DHCPv6 server.
     * @returns {Integer} If the function succeeds, it returns <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, it returns one of the following or an error code from <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the parameters were invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_SUBNET_NOT_PRESENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * IPv6 subnet does not exist on the DHCPv6 server.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpv6setstatelessstoreparams
     * @since windowsserver2012
     */
    static DhcpV6SetStatelessStoreParams(ServerIpAddress, fServerLevel, SubnetAddress, FieldModified, Params) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpV6SetStatelessStoreParams", "ptr", ServerIpAddress, "ptr", fServerLevel, "ptr", SubnetAddress, "uint", FieldModified, "ptr", Params, "uint")
        return result
    }

    /**
     * Retrieves the current DHCPv6 stateless client inventory configuration settings at the server or scope level.
     * @param {PWSTR} ServerIpAddress Pointer to a null-terminated Unicode string that represents the IP address or hostname of the DHCP server.
     * @param {BOOL} fServerLevel If <b>TRUE</b> the stateless client inventory configuration settings at server level are retrieved. Otherwise, the scope level configuration settings are retrieved.
     * @param {DHCP_IPV6_ADDRESS} SubnetAddress A <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_ipv6_address">DHCP_IPV6_ADDRESS</a> structure that contains the IPv6 subnet address of the stateless client inventory configuration settings to be retrieved. 
     * If the value of <i>fServerLevel</i> is <b>TRUE</b>, this must be 0.
     * @param {Pointer<DHCPV6_STATELESS_PARAMS>} Params Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcpv6_stateless_params">DHCPV6_STATELESS_PARAMS</a> structure that contains the stateless client inventory configuration settings for a DHCPv6 server.
     * @returns {Integer} If the function succeeds, it returns <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, it returns one of the following or an error code from <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the parameters were invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_SUBNET_NOT_PRESENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * IPv6 subnet does not exist on the DHCPv6 server.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpv6getstatelessstoreparams
     * @since windowsserver2012
     */
    static DhcpV6GetStatelessStoreParams(ServerIpAddress, fServerLevel, SubnetAddress, Params) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpV6GetStatelessStoreParams", "ptr", ServerIpAddress, "ptr", fServerLevel, "ptr", SubnetAddress, "ptr", Params, "uint")
        return result
    }

    /**
     * Retrieves the stateless server IPv6 subnet statistics.
     * @param {PWSTR} ServerIpAddress Pointer to a null-terminated Unicode string that represents the IP address or hostname of the DHCP server.
     * @param {Pointer<DHCPV6_STATELESS_STATS>} StatelessStats Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcpv6_stateless_stats">DHCPV6_STATELESS_STATS</a> structure that contain DHCPv6 stateless server IPv6 subnet statistics.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> upon a successful call. Otherwise, it returns one of the <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpv6getstatelessstatistics
     * @since windowsserver2012
     */
    static DhcpV6GetStatelessStatistics(ServerIpAddress, StatelessStats) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpV6GetStatelessStatistics", "ptr", ServerIpAddress, "ptr", StatelessStats, "uint")
        return result
    }

    /**
     * Creates a DHCPv4 client lease record in the DHCP server database.
     * @param {PWSTR} ServerIpAddress Pointer to a null-terminated Unicode string that represents the IP address or hostname of the DHCP server.
     * @param {Pointer<DHCP_CLIENT_INFO_PB>} ClientInfo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_client_info_v6">DHCP_CLIENT_INFO_PB</a> structure that contains the DHCP client lease record information. The <b>ClientIpAddress</b> and <b>ClientHardwareAddress</b> fields of this structure are required, all others are optional.
     * @returns {Integer} If the function succeeds, it returns <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, it returns one of the following or an error code from <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the parameters were invalid.
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
     * This call was performed by a client who is not a member of the <i>DHCP Administrators</i> security group.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_SUBNET_NOT_PRESENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>ClientIpAddress</b> passed within <i>ClientInfo</i> does not match any DHCPv4 scope configured on the DHCP server.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_CLIENT_EXISTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provided DHCP client record already exists in the DHCP server database.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpv4createclientinfo
     * @since windowsserver2012
     */
    static DhcpV4CreateClientInfo(ServerIpAddress, ClientInfo) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpV4CreateClientInfo", "ptr", ServerIpAddress, "ptr", ClientInfo, "uint")
        return result
    }

    /**
     * Enumerates all DHCP client records serviced from the specified IPv4 subnet.
     * @param {PWSTR} ServerIpAddress Pointer to a null-terminated Unicode string that represents the IP address or hostname of the DHCP server.
     * @param {Integer} SubnetAddress <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_ADDRESS</a> structure that contains the IPv4 subnet address of the DHCP client records to enumerate. If set to 0, the DHCP client records for all known IPv4 subnets are returned.
     * @param {Pointer<UInt32>} ResumeHandle Pointer to a  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_RESUME_HANDLE</a> structure that identifies this enumeration for use in subsequent calls to this function. Initially, this value should be zero on input. If successful, the returned value should be used for subsequent enumeration requests. The returned handle value is the last IPv4 address retrieved in the enumeration operation.
     * @param {Integer} PreferredMaximum The maximum number of bytes of client records to return in <i>ClientInfo</i>. The minimum value is 1024 bytes, and the maximum value is 65536 bytes.
     * @param {Pointer<DHCP_CLIENT_INFO_PB_ARRAY>} ClientInfo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_client_info_pb_array">DHCP_CLIENT_INFO_PB_ARRAY</a> structure that contains the DHCP client lease records set available for the specified subnet.
     * @param {Pointer<UInt32>} ClientsRead Pointer to a <b>DWORD</b> that specifies the number of DHCP client records returned in <i>ClientInfo.</i>
     * @param {Pointer<UInt32>} ClientsTotal Pointer to a <b>DWORD</b>  that specifies the number of client records on the DHCP server that have not yet been enumerated.
     * @returns {Integer} If the function succeeds, it returns <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, it returns one of the following or an error code from <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This call was performed by a client who is not a member of the <i>DHCP Users</i> or <i>DHCP Administrators</i> security groups.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_JET_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred while accessing the DHCP server's database.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are still non-enumerated client lease records on the DHCP server for the provided IPv4 subnet. Call this function again with the returned resume handle to obtain more records.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are no client lease records on the DHCP server.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpv4enumsubnetclients
     * @since windowsserver2012
     */
    static DhcpV4EnumSubnetClients(ServerIpAddress, SubnetAddress, ResumeHandle, PreferredMaximum, ClientInfo, ClientsRead, ClientsTotal) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpV4EnumSubnetClients", "ptr", ServerIpAddress, "uint", SubnetAddress, "uint*", ResumeHandle, "uint", PreferredMaximum, "ptr", ClientInfo, "uint*", ClientsRead, "uint*", ClientsTotal, "uint")
        return result
    }

    /**
     * Retrieves DHCP client lease record information from the DHCP server database.
     * @param {PWSTR} ServerIpAddress Pointer to a null-terminated Unicode string that represents the IP address or hostname of the DHCP server.
     * @param {Pointer<DHCP_SEARCH_INFO>} SearchInfo Pointer to a <a href="https://docs.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_search_info">DHCP_SEARCH_INFO</a> structure that defines the key used to search for the client lease record on the DHCP server.
     * @param {Pointer<DHCP_CLIENT_INFO_PB>} ClientInfo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_client_info_pb">DHCP_CLIENT_INFO_PB</a> structure that returns the DHCP client lease record information.
     * @returns {Integer} If the function succeeds, it returns <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, it returns one of the following or an error code from <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid or NULL <i>SearchInfo</i> was passed to the function.
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
     * This call was performed by a client that is not a member of the <i>DHCP Users</i> or  <i>DHCP Administrators</i> security groups.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_INVALID_DHCP_CLIENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The DHCP client is not valid. In this case, the search information passed had no corresponding IPv4 lease records.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpv4getclientinfo
     * @since windowsserver2012
     */
    static DhcpV4GetClientInfo(ServerIpAddress, SearchInfo, ClientInfo) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpV4GetClientInfo", "ptr", ServerIpAddress, "ptr", SearchInfo, "ptr", ClientInfo, "uint")
        return result
    }

    /**
     * Creates a DHCPv6 client lease record in the DHCP server database.
     * @param {PWSTR} ServerIpAddress Pointer to a null-terminated Unicode string that represents the IP address or hostname of the DHCP server.
     * @param {Pointer<DHCP_CLIENT_INFO_V6>} ClientInfo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_client_info_v6">DHCP_CLIENT_INFO_V6</a> structure that contains the DHCP client lease record information. The <b>ClientIpAddress</b>, <b>ClientDUID</b> and <b>IAID</b> fields of this structure are required, all others are optional.
     * @returns {Integer} If the function succeeds, it returns <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, it returns one of the following or an error code from <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>ClientDUID</b> in the <i>ClientInfo</i> parameter was <b>NULL</b> or a zero length buffer.
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
     * This call was performed by a client that is not a member of the <i>DHCP Administrators</i> security group.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_SUBNET_NOT_PRESENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified subnet does not exist. In this case, there is no subnet corresponding to <b>ClientIpAddress</b> in the <i>ClientInfo</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_CLIENT_EXISTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provided DHCP client record already exists in the DHCP server database.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpv6createclientinfo
     * @since windowsserver2012
     */
    static DhcpV6CreateClientInfo(ServerIpAddress, ClientInfo) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpV6CreateClientInfo", "ptr", ServerIpAddress, "ptr", ClientInfo, "uint")
        return result
    }

    /**
     * Retrieves the list of available IPv4 addresses that can be leased to clients.
     * @param {PWSTR} ServerIpAddress Pointer to a null-terminated Unicode string that represents the IP address or hostname of the DHCP server.
     * @param {Integer} ScopeId <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_ADDRESS</a> structure that specifies the IPv4 subnet ID from which available addresses to lease to clients are retrieved.
     * @param {Integer} StartIP <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_ADDRESS</a> structure that specifies the scope IPv4 range's starting point address from where the available addresses are retrieved. If this parameter is 0, the start address of the IPv4 subnet specified by <i>ScopeId</i> is the default.
     * @param {Integer} EndIP <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_ADDRESS</a> structure that specifies the scope IPv4 range's end point address from where the available addresses are retrieved. If this parameter is 0, the end address of the IPv4 subnet specified by <i>ScopeId</i> parameter is taken as the default.
     * @param {Integer} NumFreeAddrReq Integer that specifies the number of IPv4 addresses retrieved from the specified scope in <i>IPAddrList</i>. If this parameter is 0, only one IPv4 address is returned.
     * @param {Pointer<DHCP_IP_ARRAY>} IPAddrList Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_ip_array">DHCP_IP_ARRAY</a> structure that contains the list of available IPv4 addresses that can be leased to clients.
     * @returns {Integer} If the function succeeds, it returns <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, it returns one of the following or an error code from <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the parameters were invalid.
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
     * There are no more elements left to enumerate.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_REACHED_END_OF_SELECTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified DHCP Server has reached the end of the selected range while finding the free IP address.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpv4getfreeipaddress
     * @since windowsserver2012
     */
    static DhcpV4GetFreeIPAddress(ServerIpAddress, ScopeId, StartIP, EndIP, NumFreeAddrReq, IPAddrList) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpV4GetFreeIPAddress", "ptr", ServerIpAddress, "uint", ScopeId, "uint", StartIP, "uint", EndIP, "uint", NumFreeAddrReq, "ptr", IPAddrList, "uint")
        return result
    }

    /**
     * Retrieves the list of available IPv6 addresses that can be leased to clients.
     * @param {PWSTR} ServerIpAddress Pointer to a null-terminated Unicode string that represents the IP address or hostname of the DHCP server.
     * @param {DHCP_IPV6_ADDRESS} ScopeId <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_ipv6_address">DHCP_IPV6_ADDRESS</a> structure that specifies the IPv6 subnet ID from which available addresses to lease to clients are retrieved.
     * @param {DHCP_IPV6_ADDRESS} StartIP <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_ipv6_address">DHCP_IPV6_ADDRESS</a> structure that specifies the scope IPv6 range's starting point address from where the available addresses are retrieved. If this parameter is 0, the start address of the IPv6 subnet specified by <i>ScopeId</i> is the default.
     * @param {DHCP_IPV6_ADDRESS} EndIP <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_ipv6_address">DHCP_IPV6_ADDRESS</a> structure that specifies the scope IPv6 range's end point address from where the available addresses are retrieved. If this parameter is 0, the end address of the IPv6 subnet specified by <i>ScopeId</i> parameter is taken as the default.
     * @param {Integer} NumFreeAddrReq Integer that specifies the number of IPv6 addresses retrieved from the specified scope in <i>IPAddrList</i>. If this parameter is 0, only one IPv6 address is returned.
     * @param {Pointer<DHCPV6_IP_ARRAY>} IPAddrList Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcpv6_ip_array">DHCPV6_IP_ARRAY</a> structure that contains the list of available IPv6 addresses that can be leased to clients.
     * @returns {Integer} If the function succeeds, it returns <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, it returns one of the following or an error code from <a href="/previous-versions/windows/desktop/dhcp/dhcp-server-management-api-error-codes">DHCP Server Management API Error Codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the parameters were invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_SUBNET_NOT_PRESENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * IPv6 subnet does not exist on the DHCP server.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DHCP_REACHED_END_OF_SELECTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified DHCP server has reached the end of the selected range while finding the free IP address.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/nf-dhcpsapi-dhcpv6getfreeipaddress
     * @since windowsserver2012
     */
    static DhcpV6GetFreeIPAddress(ServerIpAddress, ScopeId, StartIP, EndIP, NumFreeAddrReq, IPAddrList) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpV6GetFreeIPAddress", "ptr", ServerIpAddress, "ptr", ScopeId, "ptr", StartIP, "ptr", EndIP, "uint", NumFreeAddrReq, "ptr", IPAddrList, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} ServerIpAddress 
     * @param {Pointer<DHCP_CLIENT_INFO_EX>} ClientInfo 
     * @returns {Integer} 
     */
    static DhcpV4CreateClientInfoEx(ServerIpAddress, ClientInfo) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpV4CreateClientInfoEx", "ptr", ServerIpAddress, "ptr", ClientInfo, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} ServerIpAddress 
     * @param {Integer} SubnetAddress 
     * @param {Pointer<UInt32>} ResumeHandle 
     * @param {Integer} PreferredMaximum 
     * @param {Pointer<DHCP_CLIENT_INFO_EX_ARRAY>} ClientInfo 
     * @param {Pointer<UInt32>} ClientsRead 
     * @param {Pointer<UInt32>} ClientsTotal 
     * @returns {Integer} 
     */
    static DhcpV4EnumSubnetClientsEx(ServerIpAddress, SubnetAddress, ResumeHandle, PreferredMaximum, ClientInfo, ClientsRead, ClientsTotal) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpV4EnumSubnetClientsEx", "ptr", ServerIpAddress, "uint", SubnetAddress, "uint*", ResumeHandle, "uint", PreferredMaximum, "ptr", ClientInfo, "uint*", ClientsRead, "uint*", ClientsTotal, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} ServerIpAddress 
     * @param {Pointer<DHCP_SEARCH_INFO>} SearchInfo 
     * @param {Pointer<DHCP_CLIENT_INFO_EX>} ClientInfo 
     * @returns {Integer} 
     */
    static DhcpV4GetClientInfoEx(ServerIpAddress, SearchInfo, ClientInfo) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpV4GetClientInfoEx", "ptr", ServerIpAddress, "ptr", SearchInfo, "ptr", ClientInfo, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} ServerIpAddress 
     * @param {Pointer<DHCP_POLICY_EX>} PolicyEx 
     * @returns {Integer} 
     */
    static DhcpV4CreatePolicyEx(ServerIpAddress, PolicyEx) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpV4CreatePolicyEx", "ptr", ServerIpAddress, "ptr", PolicyEx, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} ServerIpAddress 
     * @param {BOOL} GlobalPolicy 
     * @param {Integer} SubnetAddress 
     * @param {PWSTR} PolicyName 
     * @param {Pointer<DHCP_POLICY_EX>} Policy 
     * @returns {Integer} 
     */
    static DhcpV4GetPolicyEx(ServerIpAddress, GlobalPolicy, SubnetAddress, PolicyName, Policy) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress
        PolicyName := PolicyName is String ? StrPtr(PolicyName) : PolicyName

        result := DllCall("DHCPSAPI.dll\DhcpV4GetPolicyEx", "ptr", ServerIpAddress, "ptr", GlobalPolicy, "uint", SubnetAddress, "ptr", PolicyName, "ptr", Policy, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} ServerIpAddress 
     * @param {Integer} FieldsModified 
     * @param {BOOL} GlobalPolicy 
     * @param {Integer} SubnetAddress 
     * @param {PWSTR} PolicyName 
     * @param {Pointer<DHCP_POLICY_EX>} Policy 
     * @returns {Integer} 
     */
    static DhcpV4SetPolicyEx(ServerIpAddress, FieldsModified, GlobalPolicy, SubnetAddress, PolicyName, Policy) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress
        PolicyName := PolicyName is String ? StrPtr(PolicyName) : PolicyName

        result := DllCall("DHCPSAPI.dll\DhcpV4SetPolicyEx", "ptr", ServerIpAddress, "uint", FieldsModified, "ptr", GlobalPolicy, "uint", SubnetAddress, "ptr", PolicyName, "ptr", Policy, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} ServerIpAddress 
     * @param {Pointer<UInt32>} ResumeHandle 
     * @param {Integer} PreferredMaximum 
     * @param {BOOL} GlobalPolicy 
     * @param {Integer} SubnetAddress 
     * @param {Pointer<DHCP_POLICY_EX_ARRAY>} EnumInfo 
     * @param {Pointer<UInt32>} ElementsRead 
     * @param {Pointer<UInt32>} ElementsTotal 
     * @returns {Integer} 
     */
    static DhcpV4EnumPoliciesEx(ServerIpAddress, ResumeHandle, PreferredMaximum, GlobalPolicy, SubnetAddress, EnumInfo, ElementsRead, ElementsTotal) {
        ServerIpAddress := ServerIpAddress is String ? StrPtr(ServerIpAddress) : ServerIpAddress

        result := DllCall("DHCPSAPI.dll\DhcpV4EnumPoliciesEx", "ptr", ServerIpAddress, "uint*", ResumeHandle, "uint", PreferredMaximum, "ptr", GlobalPolicy, "uint", SubnetAddress, "ptr", EnumInfo, "uint*", ElementsRead, "uint*", ElementsTotal, "uint")
        return result
    }

;@endregion Methods
}
