#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 * @version v4.0.30319
 */
class ATTRIBUTEID{

    /**
     * @type {Integer (UInt32)}
     */
    static ATTRIBUTE_UNDEFINED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static ATTRIBUTE_MIN_VALUE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_USER_NAME => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_USER_PASSWORD => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_CHAP_PASSWORD => 3

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_NAS_IP_ADDRESS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_NAS_PORT => 5

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_SERVICE_TYPE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_FRAMED_PROTOCOL => 7

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_FRAMED_IP_ADDRESS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_FRAMED_IP_NETMASK => 9

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_FRAMED_ROUTING => 10

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_FILTER_ID => 11

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_FRAMED_MTU => 12

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_FRAMED_COMPRESSION => 13

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_LOGIN_IP_HOST => 14

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_LOGIN_SERVICE => 15

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_LOGIN_TCP_PORT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_UNASSIGNED1 => 17

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_REPLY_MESSAGE => 18

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_CALLBACK_NUMBER => 19

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_CALLBACK_ID => 20

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_UNASSIGNED2 => 21

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_FRAMED_ROUTE => 22

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_FRAMED_IPX_NETWORK => 23

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_STATE => 24

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_CLASS => 25

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_VENDOR_SPECIFIC => 26

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_SESSION_TIMEOUT => 27

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_IDLE_TIMEOUT => 28

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_TERMINATION_ACTION => 29

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_CALLED_STATION_ID => 30

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_CALLING_STATION_ID => 31

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_NAS_IDENTIFIER => 32

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_PROXY_STATE => 33

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_LOGIN_LAT_SERVICE => 34

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_LOGIN_LAT_NODE => 35

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_LOGIN_LAT_GROUP => 36

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_FRAMED_APPLETALK_LINK => 37

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_FRAMED_APPLETALK_NET => 38

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_FRAMED_APPLETALK_ZONE => 39

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_ACCT_STATUS_TYPE => 40

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_ACCT_DELAY_TIME => 41

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_ACCT_INPUT_OCTETS => 42

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_ACCT_OUTPUT_OCTETS => 43

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_ACCT_SESSION_ID => 44

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_ACCT_AUTHENTIC => 45

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_ACCT_SESSION_TIME => 46

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_ACCT_INPUT_PACKETS => 47

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_ACCT_OUTPUT_PACKETS => 48

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_ACCT_TERMINATE_CAUSE => 49

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_ACCT_MULTI_SSN_ID => 50

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_ACCT_LINK_COUNT => 51

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_CHAP_CHALLENGE => 60

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_NAS_PORT_TYPE => 61

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_PORT_LIMIT => 62

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_LOGIN_LAT_PORT => 63

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_TUNNEL_TYPE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_TUNNEL_MEDIUM_TYPE => 65

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_TUNNEL_CLIENT_ENDPT => 66

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_TUNNEL_SERVER_ENDPT => 67

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_ACCT_TUNNEL_CONN => 68

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_TUNNEL_PASSWORD => 69

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_ARAP_PASSWORD => 70

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_ARAP_FEATURES => 71

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_ARAP_ZONE_ACCESS => 72

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_ARAP_SECURITY => 73

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_ARAP_SECURITY_DATA => 74

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_PASSWORD_RETRY => 75

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_PROMPT => 76

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_CONNECT_INFO => 77

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_CONFIGURATION_TOKEN => 78

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_EAP_MESSAGE => 79

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_SIGNATURE => 80

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_TUNNEL_PVT_GROUP_ID => 81

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_TUNNEL_ASSIGNMENT_ID => 82

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_TUNNEL_PREFERENCE => 83

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_ARAP_CHALLENGE_RESPONSE => 84

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_ACCT_INTERIM_INTERVAL => 85

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_NAS_IPv6_ADDRESS => 95

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_FRAMED_INTERFACE_ID => 96

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_FRAMED_IPv6_PREFIX => 97

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_LOGIN_IPv6_HOST => 98

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_FRAMED_IPv6_ROUTE => 99

    /**
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_FRAMED_IPv6_POOL => 100

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_SAVED_RADIUS_FRAMED_IP_ADDRESS => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_SAVED_RADIUS_CALLBACK_NUMBER => 4097

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_NP_CALLING_STATION_ID => 4098

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_SAVED_NP_CALLING_STATION_ID => 4099

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_SAVED_RADIUS_FRAMED_ROUTE => 4100

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_IGNORE_USER_DIALIN_PROPERTIES => 4101

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_NP_TIME_OF_DAY => 4102

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_NP_CALLED_STATION_ID => 4103

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_NP_ALLOWED_PORT_TYPES => 4104

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_NP_AUTHENTICATION_TYPE => 4105

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_NP_ALLOWED_EAP_TYPE => 4106

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_SHARED_SECRET => 4107

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_CLIENT_IP_ADDRESS => 4108

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_CLIENT_PACKET_HEADER => 4109

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_TOKEN_GROUPS => 4110

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_ALLOW_DIALIN => 4111

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_REQUEST_ID => 4112

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_MANIPULATION_TARGET => 4113

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_MANIPULATION_RULE => 4114

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_ORIGINAL_USER_NAME => 4115

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_CLIENT_VENDOR_TYPE => 4116

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_CLIENT_UDP_PORT => 4117

    /**
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_CHAP_CHALLENGE => 4118

    /**
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_CHAP_RESPONSE => 4119

    /**
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_CHAP_DOMAIN => 4120

    /**
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_CHAP_ERROR => 4121

    /**
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_CHAP_CPW1 => 4122

    /**
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_CHAP_CPW2 => 4123

    /**
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_CHAP_LM_ENC_PW => 4124

    /**
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_CHAP_NT_ENC_PW => 4125

    /**
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_CHAP_MPPE_KEYS => 4126

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_AUTHENTICATION_TYPE => 4127

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_CLIENT_NAME => 4128

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_NT4_ACCOUNT_NAME => 4129

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_FULLY_QUALIFIED_USER_NAME => 4130

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_NTGROUPS => 4131

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_EAP_FRIENDLY_NAME => 4132

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_AUTH_PROVIDER_TYPE => 4133

    /**
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_ACCT_AUTH_TYPE => 4134

    /**
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_ACCT_EAP_TYPE => 4135

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_PACKET_TYPE => 4136

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_AUTH_PROVIDER_NAME => 4137

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_ACCT_PROVIDER_TYPE => 4138

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_ACCT_PROVIDER_NAME => 4139

    /**
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_MPPE_SEND_KEY => 4140

    /**
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_MPPE_RECV_KEY => 4141

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_REASON_CODE => 4142

    /**
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_FILTER => 4143

    /**
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_CHAP2_RESPONSE => 4144

    /**
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_CHAP2_SUCCESS => 4145

    /**
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_CHAP2_CPW => 4146

    /**
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_RAS_VENDOR => 4147

    /**
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_RAS_VERSION => 4148

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_NP_NAME => 4149

    /**
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_PRIMARY_DNS_SERVER => 4150

    /**
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_SECONDARY_DNS_SERVER => 4151

    /**
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_PRIMARY_NBNS_SERVER => 4152

    /**
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_SECONDARY_NBNS_SERVER => 4153

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_PROXY_POLICY_NAME => 4154

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_PROVIDER_TYPE => 4155

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_PROVIDER_NAME => 4156

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_REMOTE_SERVER_ADDRESS => 4157

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_GENERATE_CLASS_ATTRIBUTE => 4158

    /**
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_RAS_CLIENT_NAME => 4159

    /**
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_RAS_CLIENT_VERSION => 4160

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_ALLOWED_CERTIFICATE_EKU => 4161

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_EXTENSION_STATE => 4162

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_GENERATE_SESSION_TIMEOUT => 4163

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_SESSION_TIMEOUT => 4164

    /**
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_QUARANTINE_IPFILTER => 4165

    /**
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_QUARANTINE_SESSION_TIMEOUT => 4166

    /**
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_USER_SECURITY_IDENTITY => 4167

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_REMOTE_RADIUS_TO_WINDOWS_USER_MAPPING => 4168

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_PASSPORT_USER_MAPPING_UPN_SUFFIX => 4169

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_TUNNEL_TAG => 4170

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_NP_PEAPUPFRONT_ENABLED => 4171

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_CERTIFICATE_EKU => 8097

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_EAP_CONFIG => 8098

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_PEAP_EMBEDDED_EAP_TYPEID => 8099

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_PEAP_FAST_ROAMED_SESSION => 8100

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_EAP_TYPEID => 8101

    /**
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_EAP_TLV => 8102

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_REJECT_REASON_CODE => 8103

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_PROXY_EAP_CONFIG => 8104

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_EAP_SESSION => 8105

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_IS_REPLAY => 8106

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_CLEAR_TEXT_PASSWORD => 8107

    /**
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_IDENTITY_TYPE => 8108

    /**
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_SERVICE_CLASS => 8109

    /**
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_QUARANTINE_USER_CLASS => 8110

    /**
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_QUARANTINE_STATE => 8111

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_OVERRIDE_RAP_AUTH => 8112

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_PEAP_CHANNEL_UP => 8113

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_NAME_MAPPED => 8114

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_POLICY_ENFORCED => 8115

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_MACHINE_NTGROUPS => 8116

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_USER_NTGROUPS => 8117

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_MACHINE_TOKEN_GROUPS => 8118

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_USER_TOKEN_GROUPS => 8119

    /**
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_QUARANTINE_GRACE_TIME => 8120

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_QUARANTINE_URL => 8121

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_QUARANTINE_FIXUP_SERVERS => 8122

    /**
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_NOT_QUARANTINE_CAPABLE => 8123

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_QUARANTINE_SYSTEM_HEALTH_RESULT => 8124

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_QUARANTINE_SYSTEM_HEALTH_VALIDATORS => 8125

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_MACHINE_NAME => 8126

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_NT4_MACHINE_NAME => 8127

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_QUARANTINE_SESSION_HANDLE => 8128

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_FULLY_QUALIFIED_MACHINE_NAME => 8129

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_QUARANTINE_FIXUP_SERVERS_CONFIGURATION => 8130

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_CLIENT_QUARANTINE_COMPATIBLE => 8131

    /**
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_NETWORK_ACCESS_SERVER_TYPE => 8132

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_QUARANTINE_SESSION_ID => 8133

    /**
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_AFW_QUARANTINE_ZONE => 8134

    /**
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_AFW_PROTECTION_LEVEL => 8135

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_QUARANTINE_UPDATE_NON_COMPLIANT => 8136

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_REQUEST_START_TIME => 8137

    /**
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_MACHINE_NAME => 8138

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_CLIENT_IPv6_ADDRESS => 8139

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_SAVED_RADIUS_FRAMED_INTERFACE_ID => 8140

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_SAVED_RADIUS_FRAMED_IPv6_PREFIX => 8141

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_SAVED_RADIUS_FRAMED_IPv6_ROUTE => 8142

    /**
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_QUARANTINE_GRACE_TIME_CONFIGURATION => 8143

    /**
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_IPv6_FILTER => 8144

    /**
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_IPV4_REMEDIATION_SERVERS => 8145

    /**
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_IPV6_REMEDIATION_SERVERS => 8146

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_PROXY_RETRY_COUNT => 8147

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_MACHINE_INVENTORY => 8148

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_ABSOLUTE_TIME => 8149

    /**
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_QUARANTINE_SOH => 8150

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_EAP_TYPES_CONFIGURED_IN_PROXYPOLICY => 8151

    /**
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_HCAP_LOCATION_GROUP_NAME => 8152

    /**
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_EXTENDED_QUARANTINE_STATE => 8153

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_SOH_CARRIER_EAPTLV => 8154

    /**
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_HCAP_USER_GROUPS => 8155

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_SAVED_MACHINE_HEALTHCHECK_ONLY => 8156

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_POLICY_EVALUATED_SHV => 8157

    /**
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_RAS_CORRELATION_ID => 8158

    /**
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_HCAP_USER_NAME => 8159

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_NT4_HCAP_ACCOUNT_NAME => 8160

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_USER_TOKEN_SID => 8161

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_MACHINE_TOKEN_SID => 8162

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_MACHINE_VALIDATED => 8163

    /**
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_USER_IPv4_ADDRESS => 8164

    /**
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_USER_IPv6_ADDRESS => 8165

    /**
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_TSG_DEVICE_REDIRECTION => 8166

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_ACCEPT_REASON_CODE => 8167

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_LOGGING_RESULT => 8168

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_SERVER_IP_ADDRESS => 8169

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_SERVER_IPv6_ADDRESS => 8170

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_RADIUS_USERNAME_ENCODING_ASCII => 8171

    /**
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_RAS_ROUTING_DOMAIN_ID => 8172

    /**
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_AZURE_POLICY_ID => 8173

    /**
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_CERTIFICATE_THUMBPRINT => 8250

    /**
     * @type {Integer (UInt32)}
     */
    static RAS_ATTRIBUTE_ENCRYPTION_TYPE => 4294967206

    /**
     * @type {Integer (UInt32)}
     */
    static RAS_ATTRIBUTE_ENCRYPTION_POLICY => 4294967207

    /**
     * @type {Integer (UInt32)}
     */
    static RAS_ATTRIBUTE_BAP_REQUIRED => 4294967208

    /**
     * @type {Integer (UInt32)}
     */
    static RAS_ATTRIBUTE_BAP_LINE_DOWN_TIME => 4294967209

    /**
     * @type {Integer (UInt32)}
     */
    static RAS_ATTRIBUTE_BAP_LINE_DOWN_LIMIT => 4294967210
}
