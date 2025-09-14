#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class IpHelper {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static ANY_SIZE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MAXLEN_PHYSADDR => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MAXLEN_IFDESCR => 256

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_INTERFACE_NAME_LEN => 256

    /**
     * @type {Integer (UInt32)}
     */
    static MIN_IF_TYPE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_OTHER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_REGULAR_1822 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_HDH_1822 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_DDN_X25 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_RFC877_X25 => 5

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_ETHERNET_CSMACD => 6

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_IS088023_CSMACD => 7

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_ISO88024_TOKENBUS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_ISO88025_TOKENRING => 9

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_ISO88026_MAN => 10

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_STARLAN => 11

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_PROTEON_10MBIT => 12

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_PROTEON_80MBIT => 13

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_HYPERCHANNEL => 14

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_FDDI => 15

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_LAP_B => 16

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_SDLC => 17

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_DS1 => 18

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_E1 => 19

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_BASIC_ISDN => 20

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_PRIMARY_ISDN => 21

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_PROP_POINT2POINT_SERIAL => 22

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_PPP => 23

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_SOFTWARE_LOOPBACK => 24

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_EON => 25

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_ETHERNET_3MBIT => 26

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_NSIP => 27

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_SLIP => 28

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_ULTRA => 29

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_DS3 => 30

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_SIP => 31

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_FRAMERELAY => 32

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_RS232 => 33

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_PARA => 34

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_ARCNET => 35

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_ARCNET_PLUS => 36

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_ATM => 37

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_MIO_X25 => 38

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_SONET => 39

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_X25_PLE => 40

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_ISO88022_LLC => 41

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_LOCALTALK => 42

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_SMDS_DXI => 43

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_FRAMERELAY_SERVICE => 44

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_V35 => 45

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_HSSI => 46

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_HIPPI => 47

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_MODEM => 48

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_AAL5 => 49

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_SONET_PATH => 50

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_SONET_VT => 51

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_SMDS_ICIP => 52

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_PROP_VIRTUAL => 53

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_PROP_MULTIPLEXOR => 54

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_IEEE80212 => 55

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_FIBRECHANNEL => 56

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_HIPPIINTERFACE => 57

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_FRAMERELAY_INTERCONNECT => 58

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_AFLANE_8023 => 59

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_AFLANE_8025 => 60

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_CCTEMUL => 61

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_FASTETHER => 62

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_ISDN => 63

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_V11 => 64

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_V36 => 65

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_G703_64K => 66

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_G703_2MB => 67

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_QLLC => 68

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_FASTETHER_FX => 69

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_CHANNEL => 70

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_IEEE80211 => 71

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_IBM370PARCHAN => 72

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_ESCON => 73

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_DLSW => 74

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_ISDN_S => 75

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_ISDN_U => 76

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_LAP_D => 77

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_IPSWITCH => 78

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_RSRB => 79

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_ATM_LOGICAL => 80

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_DS0 => 81

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_DS0_BUNDLE => 82

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_BSC => 83

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_ASYNC => 84

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_CNR => 85

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_ISO88025R_DTR => 86

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_EPLRS => 87

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_ARAP => 88

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_PROP_CNLS => 89

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_HOSTPAD => 90

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_TERMPAD => 91

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_FRAMERELAY_MPI => 92

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_X213 => 93

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_ADSL => 94

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_RADSL => 95

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_SDSL => 96

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_VDSL => 97

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_ISO88025_CRFPRINT => 98

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_MYRINET => 99

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_VOICE_EM => 100

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_VOICE_FXO => 101

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_VOICE_FXS => 102

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_VOICE_ENCAP => 103

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_VOICE_OVERIP => 104

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_ATM_DXI => 105

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_ATM_FUNI => 106

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_ATM_IMA => 107

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_PPPMULTILINKBUNDLE => 108

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_IPOVER_CDLC => 109

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_IPOVER_CLAW => 110

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_STACKTOSTACK => 111

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_VIRTUALIPADDRESS => 112

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_MPC => 113

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_IPOVER_ATM => 114

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_ISO88025_FIBER => 115

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_TDLC => 116

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_GIGABITETHERNET => 117

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_HDLC => 118

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_LAP_F => 119

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_V37 => 120

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_X25_MLP => 121

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_X25_HUNTGROUP => 122

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_TRANSPHDLC => 123

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_INTERLEAVE => 124

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_FAST => 125

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_IP => 126

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_DOCSCABLE_MACLAYER => 127

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_DOCSCABLE_DOWNSTREAM => 128

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_DOCSCABLE_UPSTREAM => 129

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_A12MPPSWITCH => 130

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_TUNNEL => 131

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_COFFEE => 132

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_CES => 133

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_ATM_SUBINTERFACE => 134

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_L2_VLAN => 135

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_L3_IPVLAN => 136

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_L3_IPXVLAN => 137

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_DIGITALPOWERLINE => 138

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_MEDIAMAILOVERIP => 139

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_DTM => 140

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_DCN => 141

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_IPFORWARD => 142

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_MSDSL => 143

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_IEEE1394 => 144

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_IF_GSN => 145

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_DVBRCC_MACLAYER => 146

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_DVBRCC_DOWNSTREAM => 147

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_DVBRCC_UPSTREAM => 148

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_ATM_VIRTUAL => 149

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_MPLS_TUNNEL => 150

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_SRP => 151

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_VOICEOVERATM => 152

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_VOICEOVERFRAMERELAY => 153

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_IDSL => 154

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_COMPOSITELINK => 155

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_SS7_SIGLINK => 156

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_PROP_WIRELESS_P2P => 157

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_FR_FORWARD => 158

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_RFC1483 => 159

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_USB => 160

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_IEEE8023AD_LAG => 161

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_BGP_POLICY_ACCOUNTING => 162

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_FRF16_MFR_BUNDLE => 163

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_H323_GATEKEEPER => 164

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_H323_PROXY => 165

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_MPLS => 166

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_MF_SIGLINK => 167

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_HDSL2 => 168

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_SHDSL => 169

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_DS1_FDL => 170

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_POS => 171

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_DVB_ASI_IN => 172

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_DVB_ASI_OUT => 173

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_PLC => 174

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_NFAS => 175

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_TR008 => 176

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_GR303_RDT => 177

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_GR303_IDT => 178

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_ISUP => 179

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_PROP_DOCS_WIRELESS_MACLAYER => 180

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_PROP_DOCS_WIRELESS_DOWNSTREAM => 181

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_PROP_DOCS_WIRELESS_UPSTREAM => 182

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_HIPERLAN2 => 183

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_PROP_BWA_P2MP => 184

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_SONET_OVERHEAD_CHANNEL => 185

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_DIGITAL_WRAPPER_OVERHEAD_CHANNEL => 186

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_AAL2 => 187

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_RADIO_MAC => 188

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_ATM_RADIO => 189

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_IMT => 190

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_MVL => 191

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_REACH_DSL => 192

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_FR_DLCI_ENDPT => 193

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_ATM_VCI_ENDPT => 194

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_OPTICAL_CHANNEL => 195

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_OPTICAL_TRANSPORT => 196

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_IEEE80216_WMAN => 237

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_WWANPP => 243

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_WWANPP2 => 244

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_IEEE802154 => 259

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TYPE_XBOX_WIRELESS => 281

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_IF_TYPE => 281

    /**
     * @type {Integer (UInt32)}
     */
    static IF_CHECK_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static IF_CHECK_MCAST => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IF_CHECK_SEND => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IF_CONNECTION_DEDICATED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IF_CONNECTION_PASSIVE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IF_CONNECTION_DEMAND => 3

    /**
     * @type {Integer (UInt32)}
     */
    static IF_ADMIN_STATUS_UP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IF_ADMIN_STATUS_DOWN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IF_ADMIN_STATUS_TESTING => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MIB_IF_TYPE_OTHER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MIB_IF_TYPE_ETHERNET => 6

    /**
     * @type {Integer (UInt32)}
     */
    static MIB_IF_TYPE_TOKENRING => 9

    /**
     * @type {Integer (UInt32)}
     */
    static MIB_IF_TYPE_FDDI => 15

    /**
     * @type {Integer (UInt32)}
     */
    static MIB_IF_TYPE_PPP => 23

    /**
     * @type {Integer (UInt32)}
     */
    static MIB_IF_TYPE_LOOPBACK => 24

    /**
     * @type {Integer (UInt32)}
     */
    static MIB_IF_TYPE_SLIP => 28

    /**
     * @type {Integer (UInt32)}
     */
    static MIB_IF_ADMIN_STATUS_UP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MIB_IF_ADMIN_STATUS_DOWN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MIB_IF_ADMIN_STATUS_TESTING => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MIB_IPADDR_PRIMARY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MIB_IPADDR_DYNAMIC => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MIB_IPADDR_DISCONNECTED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MIB_IPADDR_DELETED => 64

    /**
     * @type {Integer (UInt32)}
     */
    static MIB_IPADDR_TRANSIENT => 128

    /**
     * @type {Integer (UInt32)}
     */
    static MIB_IPADDR_DNS_ELIGIBLE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static MIB_IPROUTE_METRIC_UNUSED => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static MIB_USE_CURRENT_TTL => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static MIB_USE_CURRENT_FORWARDING => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static ICMP6_INFOMSG_MASK => 128

    /**
     * @type {Integer (UInt32)}
     */
    static IPRTRMGR_PID => 10000

    /**
     * @type {Integer (UInt32)}
     */
    static IF_NUMBER => 0

    /**
     * @type {Integer (UInt32)}
     */
    static IF_TABLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IF_ROW => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IP_STATS => 3

    /**
     * @type {Integer (UInt32)}
     */
    static IP_ADDRTABLE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IP_ADDRROW => 5

    /**
     * @type {Integer (UInt32)}
     */
    static IP_FORWARDNUMBER => 6

    /**
     * @type {Integer (UInt32)}
     */
    static IP_FORWARDTABLE => 7

    /**
     * @type {Integer (UInt32)}
     */
    static IP_FORWARDROW => 8

    /**
     * @type {Integer (UInt32)}
     */
    static IP_NETTABLE => 9

    /**
     * @type {Integer (UInt32)}
     */
    static IP_NETROW => 10

    /**
     * @type {Integer (UInt32)}
     */
    static ICMP_STATS => 11

    /**
     * @type {Integer (UInt32)}
     */
    static TCP_STATS => 12

    /**
     * @type {Integer (UInt32)}
     */
    static TCP_TABLE => 13

    /**
     * @type {Integer (UInt32)}
     */
    static TCP_ROW => 14

    /**
     * @type {Integer (UInt32)}
     */
    static UDP_STATS => 15

    /**
     * @type {Integer (UInt32)}
     */
    static UDP_TABLE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static UDP_ROW => 17

    /**
     * @type {Integer (UInt32)}
     */
    static MCAST_MFE => 18

    /**
     * @type {Integer (UInt32)}
     */
    static MCAST_MFE_STATS => 19

    /**
     * @type {Integer (UInt32)}
     */
    static BEST_IF => 20

    /**
     * @type {Integer (UInt32)}
     */
    static BEST_ROUTE => 21

    /**
     * @type {Integer (UInt32)}
     */
    static PROXY_ARP => 22

    /**
     * @type {Integer (UInt32)}
     */
    static MCAST_IF_ENTRY => 23

    /**
     * @type {Integer (UInt32)}
     */
    static MCAST_GLOBAL => 24

    /**
     * @type {Integer (UInt32)}
     */
    static IF_STATUS => 25

    /**
     * @type {Integer (UInt32)}
     */
    static MCAST_BOUNDARY => 26

    /**
     * @type {Integer (UInt32)}
     */
    static MCAST_SCOPE => 27

    /**
     * @type {Integer (UInt32)}
     */
    static DEST_MATCHING => 28

    /**
     * @type {Integer (UInt32)}
     */
    static DEST_LONGER => 29

    /**
     * @type {Integer (UInt32)}
     */
    static DEST_SHORTER => 30

    /**
     * @type {Integer (UInt32)}
     */
    static ROUTE_MATCHING => 31

    /**
     * @type {Integer (UInt32)}
     */
    static ROUTE_LONGER => 32

    /**
     * @type {Integer (UInt32)}
     */
    static ROUTE_SHORTER => 33

    /**
     * @type {Integer (UInt32)}
     */
    static ROUTE_STATE => 34

    /**
     * @type {Integer (UInt32)}
     */
    static MCAST_MFE_STATS_EX => 35

    /**
     * @type {Integer (UInt32)}
     */
    static IP6_STATS => 36

    /**
     * @type {Integer (UInt32)}
     */
    static UDP6_STATS => 37

    /**
     * @type {Integer (UInt32)}
     */
    static TCP6_STATS => 38

    /**
     * @type {Integer (UInt32)}
     */
    static NUMBER_OF_EXPORTED_VARIABLES => 39

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_SCOPE_NAME_LEN => 255

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_MIB_OFFSET => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MIB_INVALID_TEREDO_PORT_NUMBER => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_SETTINGS_VERSION1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_SETTINGS_VERSION2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_INTERFACE_SETTINGS_VERSION1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_INTERFACE_SETTINGS_VERSION2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_INTERFACE_SETTINGS_VERSION3 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_INTERFACE_SETTINGS_VERSION4 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_SETTING_IPV6 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_SETTING_NAMESERVER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_SETTING_SEARCHLIST => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_SETTING_REGISTRATION_ENABLED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_SETTING_REGISTER_ADAPTER_NAME => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_SETTING_DOMAIN => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_SETTING_HOSTNAME => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_SETTINGS_ENABLE_LLMNR => 128

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_SETTINGS_QUERY_ADAPTER_NAME => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_SETTING_PROFILE_NAMESERVER => 512

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_SETTING_DISABLE_UNCONSTRAINED_QUERIES => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_SETTING_SUPPLEMENTAL_SEARCH_LIST => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_SETTING_DOH => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_SETTING_DOH_PROFILE => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_SETTING_ENCRYPTED_DNS_ADAPTER_FLAGS => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_SETTING_DDR => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ENABLE_DOH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_DOH_POLICY_NOT_CONFIGURED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_DOH_POLICY_DISABLE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_DOH_POLICY_AUTO => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_DOH_POLICY_REQUIRED => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ENABLE_DDR => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_SERVER_PROPERTY_VERSION1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_DOH_SERVER_SETTINGS_ENABLE_AUTO => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_DOH_SERVER_SETTINGS_ENABLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_DOH_SERVER_SETTINGS_FALLBACK_TO_UDP => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_DOH_AUTO_UPGRADE_SERVER => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_DOH_SERVER_SETTINGS_ENABLE_DDR => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_DDR_ADAPTER_ENABLE_DOH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_DDR_ADAPTER_ENABLE_UDP_FALLBACK => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TCPIP_OWNING_MODULE_SIZE => 16

    /**
     * @type {Integer (Byte)}
     */
    static FILTER_ICMP_TYPE_ANY => 0xFF

    /**
     * @type {Integer (Byte)}
     */
    static FILTER_ICMP_CODE_ANY => 0xFF

    /**
     * @type {Integer (UInt32)}
     */
    static FD_FLAGS_NOSYN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FD_FLAGS_ALLFLAGS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LB_SRC_ADDR_USE_SRCADDR_FLAG => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LB_SRC_ADDR_USE_DSTADDR_FLAG => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LB_DST_ADDR_USE_SRCADDR_FLAG => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LB_DST_ADDR_USE_DSTADDR_FLAG => 8

    /**
     * @type {Integer (UInt32)}
     */
    static LB_SRC_MASK_LATE_FLAG => 16

    /**
     * @type {Integer (UInt32)}
     */
    static LB_DST_MASK_LATE_FLAG => 32

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BASE => 23000

    /**
     * @type {Integer (UInt32)}
     */
    static PFERROR_NO_PF_INTERFACE => 23000

    /**
     * @type {Integer (UInt32)}
     */
    static PFERROR_NO_FILTERS_GIVEN => 23001

    /**
     * @type {Integer (UInt32)}
     */
    static PFERROR_BUFFER_TOO_SMALL => 23002

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPV6_NOT_IMPLEMENTED => 23003

    /**
     * @type {Integer (UInt32)}
     */
    static IP_EXPORT_INCLUDED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_ADAPTER_NAME => 128

    /**
     * @type {Integer (UInt32)}
     */
    static IP_STATUS_BASE => 11000

    /**
     * @type {Integer (UInt32)}
     */
    static IP_SUCCESS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static IP_BUF_TOO_SMALL => 11001

    /**
     * @type {Integer (UInt32)}
     */
    static IP_DEST_NET_UNREACHABLE => 11002

    /**
     * @type {Integer (UInt32)}
     */
    static IP_DEST_HOST_UNREACHABLE => 11003

    /**
     * @type {Integer (UInt32)}
     */
    static IP_DEST_PROT_UNREACHABLE => 11004

    /**
     * @type {Integer (UInt32)}
     */
    static IP_DEST_PORT_UNREACHABLE => 11005

    /**
     * @type {Integer (UInt32)}
     */
    static IP_NO_RESOURCES => 11006

    /**
     * @type {Integer (UInt32)}
     */
    static IP_BAD_OPTION => 11007

    /**
     * @type {Integer (UInt32)}
     */
    static IP_HW_ERROR => 11008

    /**
     * @type {Integer (UInt32)}
     */
    static IP_PACKET_TOO_BIG => 11009

    /**
     * @type {Integer (UInt32)}
     */
    static IP_REQ_TIMED_OUT => 11010

    /**
     * @type {Integer (UInt32)}
     */
    static IP_BAD_REQ => 11011

    /**
     * @type {Integer (UInt32)}
     */
    static IP_BAD_ROUTE => 11012

    /**
     * @type {Integer (UInt32)}
     */
    static IP_TTL_EXPIRED_TRANSIT => 11013

    /**
     * @type {Integer (UInt32)}
     */
    static IP_TTL_EXPIRED_REASSEM => 11014

    /**
     * @type {Integer (UInt32)}
     */
    static IP_PARAM_PROBLEM => 11015

    /**
     * @type {Integer (UInt32)}
     */
    static IP_SOURCE_QUENCH => 11016

    /**
     * @type {Integer (UInt32)}
     */
    static IP_OPTION_TOO_BIG => 11017

    /**
     * @type {Integer (UInt32)}
     */
    static IP_BAD_DESTINATION => 11018

    /**
     * @type {Integer (UInt32)}
     */
    static IP_DEST_NO_ROUTE => 11002

    /**
     * @type {Integer (UInt32)}
     */
    static IP_DEST_ADDR_UNREACHABLE => 11003

    /**
     * @type {Integer (UInt32)}
     */
    static IP_DEST_PROHIBITED => 11004

    /**
     * @type {Integer (UInt32)}
     */
    static IP_HOP_LIMIT_EXCEEDED => 11013

    /**
     * @type {Integer (UInt32)}
     */
    static IP_REASSEMBLY_TIME_EXCEEDED => 11014

    /**
     * @type {Integer (UInt32)}
     */
    static IP_PARAMETER_PROBLEM => 11015

    /**
     * @type {Integer (UInt32)}
     */
    static IP_DEST_UNREACHABLE => 11040

    /**
     * @type {Integer (UInt32)}
     */
    static IP_TIME_EXCEEDED => 11041

    /**
     * @type {Integer (UInt32)}
     */
    static IP_BAD_HEADER => 11042

    /**
     * @type {Integer (UInt32)}
     */
    static IP_UNRECOGNIZED_NEXT_HEADER => 11043

    /**
     * @type {Integer (UInt32)}
     */
    static IP_ICMP_ERROR => 11044

    /**
     * @type {Integer (UInt32)}
     */
    static IP_DEST_SCOPE_MISMATCH => 11045

    /**
     * @type {Integer (UInt32)}
     */
    static IP_ADDR_DELETED => 11019

    /**
     * @type {Integer (UInt32)}
     */
    static IP_SPEC_MTU_CHANGE => 11020

    /**
     * @type {Integer (UInt32)}
     */
    static IP_MTU_CHANGE => 11021

    /**
     * @type {Integer (UInt32)}
     */
    static IP_UNLOAD => 11022

    /**
     * @type {Integer (UInt32)}
     */
    static IP_ADDR_ADDED => 11023

    /**
     * @type {Integer (UInt32)}
     */
    static IP_MEDIA_CONNECT => 11024

    /**
     * @type {Integer (UInt32)}
     */
    static IP_MEDIA_DISCONNECT => 11025

    /**
     * @type {Integer (UInt32)}
     */
    static IP_BIND_ADAPTER => 11026

    /**
     * @type {Integer (UInt32)}
     */
    static IP_UNBIND_ADAPTER => 11027

    /**
     * @type {Integer (UInt32)}
     */
    static IP_DEVICE_DOES_NOT_EXIST => 11028

    /**
     * @type {Integer (UInt32)}
     */
    static IP_DUPLICATE_ADDRESS => 11029

    /**
     * @type {Integer (UInt32)}
     */
    static IP_INTERFACE_METRIC_CHANGE => 11030

    /**
     * @type {Integer (UInt32)}
     */
    static IP_RECONFIG_SECFLTR => 11031

    /**
     * @type {Integer (UInt32)}
     */
    static IP_NEGOTIATING_IPSEC => 11032

    /**
     * @type {Integer (UInt32)}
     */
    static IP_INTERFACE_WOL_CAPABILITY_CHANGE => 11033

    /**
     * @type {Integer (UInt32)}
     */
    static IP_DUPLICATE_IPADD => 11034

    /**
     * @type {Integer (UInt32)}
     */
    static IP_GENERAL_FAILURE => 11050

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_IP_STATUS => 11050

    /**
     * @type {Integer (UInt32)}
     */
    static IP_PENDING => 11255

    /**
     * @type {Integer (UInt32)}
     */
    static IP_FLAG_REVERSE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IP_FLAG_DF => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_OPT_SIZE => 40

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_IP_RTCHANGE_NOTIFY_REQUEST => 101

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_IP_ADDCHANGE_NOTIFY_REQUEST => 102

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_ARP_SEND_REQUEST => 103

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_IP_INTERFACE_INFO => 104

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_IP_GET_BEST_INTERFACE => 105

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_IP_UNIDIRECTIONAL_ADAPTER_ADDRESS => 106

    /**
     * @type {Integer (UInt32)}
     */
    static INTERFACE_TIMESTAMP_CAPABILITIES_VERSION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static INTERFACE_HARDWARE_CROSSTIMESTAMP_VERSION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NET_STRING_IPV4_ADDRESS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NET_STRING_IPV4_SERVICE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NET_STRING_IPV4_NETWORK => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NET_STRING_IPV6_ADDRESS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static NET_STRING_IPV6_ADDRESS_NO_SCOPE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static NET_STRING_IPV6_SERVICE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static NET_STRING_IPV6_SERVICE_NO_SCOPE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static NET_STRING_IPV6_NETWORK => 128

    /**
     * @type {Integer (UInt32)}
     */
    static NET_STRING_NAMED_ADDRESS => 256

    /**
     * @type {Integer (UInt32)}
     */
    static NET_STRING_NAMED_SERVICE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_ADAPTER_DESCRIPTION_LENGTH => 128

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_ADAPTER_NAME_LENGTH => 256

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_ADAPTER_ADDRESS_LENGTH => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DEFAULT_MINIMUM_ENTITIES => 32

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_HOSTNAME_LEN => 128

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_DOMAIN_NAME_LEN => 128

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_SCOPE_ID_LEN => 256

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_DHCPV6_DUID_LENGTH => 130

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_DNS_SUFFIX_STRING_LENGTH => 256

    /**
     * @type {Integer (UInt32)}
     */
    static BROADCAST_NODETYPE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PEER_TO_PEER_NODETYPE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MIXED_NODETYPE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static HYBRID_NODETYPE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static IP_ADAPTER_ADDRESS_DNS_ELIGIBLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IP_ADAPTER_ADDRESS_TRANSIENT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IP_ADAPTER_DDNS_ENABLED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IP_ADAPTER_REGISTER_ADAPTER_SUFFIX => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IP_ADAPTER_DHCP_ENABLED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IP_ADAPTER_RECEIVE_ONLY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static IP_ADAPTER_NO_MULTICAST => 16

    /**
     * @type {Integer (UInt32)}
     */
    static IP_ADAPTER_IPV6_OTHER_STATEFUL_CONFIG => 32

    /**
     * @type {Integer (UInt32)}
     */
    static IP_ADAPTER_NETBIOS_OVER_TCPIP_ENABLED => 64

    /**
     * @type {Integer (UInt32)}
     */
    static IP_ADAPTER_IPV4_ENABLED => 128

    /**
     * @type {Integer (UInt32)}
     */
    static IP_ADAPTER_IPV6_ENABLED => 256

    /**
     * @type {Integer (UInt32)}
     */
    static IP_ADAPTER_IPV6_MANAGE_ADDRESS_CONFIG => 512

    /**
     * @type {Integer (UInt32)}
     */
    static GAA_FLAG_SKIP_DNS_INFO => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static IP_ROUTER_MANAGER_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IP_GENERAL_INFO_BASE => 4294901760

    /**
     * @type {Integer (UInt32)}
     */
    static IP_IN_FILTER_INFO => 4294901761

    /**
     * @type {Integer (UInt32)}
     */
    static IP_OUT_FILTER_INFO => 4294901762

    /**
     * @type {Integer (UInt32)}
     */
    static IP_GLOBAL_INFO => 4294901763

    /**
     * @type {Integer (UInt32)}
     */
    static IP_INTERFACE_STATUS_INFO => 4294901764

    /**
     * @type {Integer (UInt32)}
     */
    static IP_ROUTE_INFO => 4294901765

    /**
     * @type {Integer (UInt32)}
     */
    static IP_PROT_PRIORITY_INFO => 4294901766

    /**
     * @type {Integer (UInt32)}
     */
    static IP_ROUTER_DISC_INFO => 4294901767

    /**
     * @type {Integer (UInt32)}
     */
    static IP_DEMAND_DIAL_FILTER_INFO => 4294901769

    /**
     * @type {Integer (UInt32)}
     */
    static IP_MCAST_HEARBEAT_INFO => 4294901770

    /**
     * @type {Integer (UInt32)}
     */
    static IP_MCAST_BOUNDARY_INFO => 4294901771

    /**
     * @type {Integer (UInt32)}
     */
    static IP_IPINIP_CFG_INFO => 4294901772

    /**
     * @type {Integer (UInt32)}
     */
    static IP_IFFILTER_INFO => 4294901773

    /**
     * @type {Integer (UInt32)}
     */
    static IP_MCAST_LIMIT_INFO => 4294901774

    /**
     * @type {Integer (UInt32)}
     */
    static IPV6_GLOBAL_INFO => 4294901775

    /**
     * @type {Integer (UInt32)}
     */
    static IPV6_ROUTE_INFO => 4294901776

    /**
     * @type {Integer (UInt32)}
     */
    static IP_IN_FILTER_INFO_V6 => 4294901777

    /**
     * @type {Integer (UInt32)}
     */
    static IP_OUT_FILTER_INFO_V6 => 4294901778

    /**
     * @type {Integer (UInt32)}
     */
    static IP_DEMAND_DIAL_FILTER_INFO_V6 => 4294901779

    /**
     * @type {Integer (UInt32)}
     */
    static IP_IFFILTER_INFO_V6 => 4294901780

    /**
     * @type {Integer (UInt32)}
     */
    static IP_FILTER_ENABLE_INFO => 4294901781

    /**
     * @type {Integer (UInt32)}
     */
    static IP_FILTER_ENABLE_INFO_V6 => 4294901782

    /**
     * @type {Integer (UInt32)}
     */
    static IP_PROT_PRIORITY_INFO_EX => 4294901783
;@endregion Constants

;@region Methods
    /**
     * The IcmpCreateFile function opens a handle on which IPv4 ICMP echo requests can be issued.
     * @remarks
     * The <b>IcmpCreateFile</b> function is exported from the <i>Icmp.dll</i> on Windows 2000. The <b>IcmpCreateFile</b> function is exported from the <i>Iphlpapi.dll</i> on Windows XP and later. Windows version checking is not recommended to use this function. Applications requiring portability  with this function across Windows 2000, Windows XP, Windows Server 2003 and later Windows versions should not statically link to either the <i>Icmp.lib</i> or the <i>Iphlpapi.lib</i> file. Instead, the application should check for the presence of <b>IcmpCreateFile</b> in the <i>Iphlpapi.dll</i> with calls to <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya">LoadLibrary</a> and <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a>.  Failing that, the application should check for the presence of <b>IcmpCreateFile</b> in the <i>Icmp.dll</i> with  calls to <b>LoadLibrary</b> and <b>GetProcAddress</b>. 
     * 
     * For IPv6, use the <a href="https://docs.microsoft.com/windows/desktop/api/icmpapi/nf-icmpapi-icmp6createfile">Icmp6CreateFile</a>, <a href="https://docs.microsoft.com/windows/desktop/api/icmpapi/nf-icmpapi-icmp6sendecho2">Icmp6SendEcho2</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/icmpapi/nf-icmpapi-icmp6parsereplies">Icmp6ParseReplies</a> functions.
     * 
     * Note that the include directive for <i>Iphlpapi.h</i> header file must be placed before the <i>Icmpapi.h</i> header file.
     * @returns {Pointer<HANDLE>} The 
     * <b>IcmpCreateFile</b> function returns an open handle on success. On failure, the function returns <b>INVALID_HANDLE_VALUE</b>. Call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function for extended error information.
     * @see https://learn.microsoft.com/windows/win32/api/icmpapi/nf-icmpapi-icmpcreatefile
     * @since windows5.0
     */
    static IcmpCreateFile() {
        A_LastError := 0

        result := DllCall("IPHLPAPI.dll\IcmpCreateFile", "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The Icmp6CreateFile function opens a handle on which IPv6 ICMP echo requests can be issued.
     * @remarks
     * The 
     * <b>Icmp6CreateFile</b> function opens a handle on which IPv6 ICMP echo requests can be issued. The <a href="https://docs.microsoft.com/windows/desktop/api/icmpapi/nf-icmpapi-icmp6sendecho2">Icmp6SendEcho2</a> function is used to send the IPv6 ICMP echo requests. The <a href="https://docs.microsoft.com/windows/desktop/api/icmpapi/nf-icmpapi-icmp6parsereplies">Icmp6ParseReplies</a> function is used to parse the IPv6 ICMP replies. The <a href="https://docs.microsoft.com/windows/desktop/api/icmpapi/nf-icmpapi-icmpclosehandle">IcmpCloseHandle</a> function is used to close the ICMP handle opened by the <b>Icmp6CreateFile</b> function. 
     * 
     * For IPv4, use the <a href="https://docs.microsoft.com/windows/desktop/api/icmpapi/nf-icmpapi-icmpcreatefile">IcmpCreateFile</a> function.
     * 
     * For IPv4, use the <a href="https://docs.microsoft.com/windows/desktop/api/icmpapi/nf-icmpapi-icmpcreatefile">IcmpCreateFile</a>,  <b>IcmpSendEcho</b>, <a href="https://docs.microsoft.com/windows/desktop/api/icmpapi/nf-icmpapi-icmpsendecho2">IcmpSendEcho2</a>, <a href="https://docs.microsoft.com/windows/desktop/api/icmpapi/nf-icmpapi-icmpsendecho2ex">IcmpSendEcho2Ex</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/icmpapi/nf-icmpapi-icmpparsereplies">IcmpParseReplies</a> functions.
     * 
     * Note that the include directive for <i>Iphlpapi.h</i> header file must be placed before the <i>Icmpapi.h</i> header file.
     * @returns {Pointer<HANDLE>} The 
     * <b>Icmp6CreateFile</b> function returns an open handle on success. On failure, the function returns <b>INVALID_HANDLE_VALUE</b>. Call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function for extended error information.
     * @see https://learn.microsoft.com/windows/win32/api/icmpapi/nf-icmpapi-icmp6createfile
     * @since windows5.1.2600
     */
    static Icmp6CreateFile() {
        A_LastError := 0

        result := DllCall("IPHLPAPI.dll\Icmp6CreateFile", "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The IcmpCloseHandle function closes a handle opened by a call to the IcmpCreateFile or Icmp6CreateFile functions.
     * @remarks
     * The <b>IcmpCloseHandle</b> function is exported from the <i>Icmp.dll</i> on Windows 2000. The <b>IcmpCloseHandle</b> function is exported from the <i>Iphlpapi.dll</i> on Windows XP and later. Windows version checking is not recommended to use this function. Applications requiring portability  with this function across Windows 2000, Windows XP, Windows Server 2003 and later Windows versions should not statically link to either the <i>Icmp.lib</i> or the <i>Iphlpapi.lib</i> file. Instead, the application should check for the presence of <b>IcmpCloseHandle</b> in the <i>Iphlpapi.dll</i> with calls to <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya">LoadLibrary</a> and <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a>.  Failing that, the application should check for the presence of <b>IcmpCloseHandle</b> in the <i>Icmp.dll</i> with  calls to <b>LoadLibrary</b> and <b>GetProcAddress</b>. 
     * 
     * Note that the include directive for <i>Iphlpapi.h</i> header file must be placed before the <i>Icmpapi.h</i> header file.
     * @param {Pointer<HANDLE>} IcmpHandle The handle to close. This handle must have been returned by a call to <a href="https://docs.microsoft.com/windows/desktop/api/icmpapi/nf-icmpapi-icmpcreatefile">IcmpCreateFile</a> or <a href="https://docs.microsoft.com/windows/desktop/api/icmpapi/nf-icmpapi-icmp6createfile">Icmp6CreateFile</a>.
     * @returns {Integer} If the handle is closed successfully the return value is <b>TRUE</b>, otherwise <b>FALSE</b>. Call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function for extended error information.
     * @see https://learn.microsoft.com/windows/win32/api/icmpapi/nf-icmpapi-icmpclosehandle
     * @since windows5.0
     */
    static IcmpCloseHandle(IcmpHandle) {
        A_LastError := 0

        result := DllCall("IPHLPAPI.dll\IcmpCloseHandle", "ptr", IcmpHandle, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The IcmpSendEcho function sends an IPv4 ICMP echo request and returns any echo response replies. The call returns when the time-out has expired or the reply buffer is filled.
     * @remarks
     * The <b>IcmpSendEcho</b> function send an ICMP echo request to the specified address and returns the number of replies received and stored in <i>ReplyBuffer</i>.  The <b>IcmpSendEcho</b> function is a synchronous function and returns after waiting for the time specified in the <i>Timeout</i> parameter for a response. If the return value is zero, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> for extended error information.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/icmpapi/nf-icmpapi-icmpsendecho2">IcmpSendEcho2</a> and <a href="https://docs.microsoft.com/windows/desktop/api/icmpapi/nf-icmpapi-icmpsendecho2ex">IcmpSendEcho2Ex</a> functions are enhanced version of <b>IcmpSendEcho</b> that support asynchronous operation. The <b>IcmpSendEcho2Ex</b> function also allows the source IP address to be specified. This feature is useful on computers with multiple network interfaces.
     * 
     * For IPv6, use the <a href="https://docs.microsoft.com/windows/desktop/api/icmpapi/nf-icmpapi-icmp6createfile">Icmp6CreateFile</a>, <a href="https://docs.microsoft.com/windows/desktop/api/icmpapi/nf-icmpapi-icmp6sendecho2">Icmp6SendEcho2</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/icmpapi/nf-icmpapi-icmp6parsereplies">Icmp6ParseReplies</a> functions.
     * 
     * The <b>IcmpSendEcho</b> function is exported from the <i>Icmp.dll</i> on Windows 2000. The <b>IcmpSendEcho</b> function is exported from the <i>Iphlpapi.dll</i> on Windows XP and later. Windows version checking is not recommended to use this function. Applications requiring portability  with this function across Windows 2000, Windows XP, Windows Server 2003 and later Windows versions should not statically link to either the <i>Icmp.lib</i> or the <i>Iphlpapi.lib</i> file. Instead, the application should check for the presence of <b>IcmpSendEcho</b> in the <i>Iphlpapi.dll</i> with calls to <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya">LoadLibrary</a> and <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a>.  Failing that, the application should check for the presence of <b>IcmpSendEcho</b> in the <i>Icmp.dll</i> with  calls to <b>LoadLibrary</b> and <b>GetProcAddress</b>. 
     * 
     * Note that the include directive for <i>Iphlpapi.h</i> header file must be placed before the <i>Icmpapi.h</i> header file.
     * @param {Pointer<HANDLE>} IcmpHandle The open handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/icmpapi/nf-icmpapi-icmpcreatefile">IcmpCreateFile</a> function.
     * @param {Integer} DestinationAddress The IPv4 destination address of the echo request, in the form of an <a href="https://docs.microsoft.com/windows/desktop/api/inaddr/ns-inaddr-in_addr">IPAddr</a> structure.
     * @param {Pointer<Void>} RequestData A pointer to a buffer that contains data to send in the request.
     * @param {Integer} RequestSize The size, in bytes, of the request data buffer pointed to by the <i>RequestData</i> parameter.
     * @param {Pointer<IP_OPTION_INFORMATION>} RequestOptions A pointer to the IP header options for the request, in the form of an <a href="https://docs.microsoft.com/windows/desktop/api/ipexport/ns-ipexport-ip_option_information">IP_OPTION_INFORMATION</a> structure. On a 64-bit platform, this parameter is in the form for an <a href="https://docs.microsoft.com/windows/desktop/api/ipexport/ns-ipexport-ip_option_information32">IP_OPTION_INFORMATION32</a> structure.
     * 
     * This parameter may be <b>NULL</b> if no IP header options need to be specified.
     * @param {Pointer<Void>} ReplyBuffer A buffer to hold any replies to the echo request. Upon return, the buffer contains an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ipexport/ns-ipexport-icmp_echo_reply">ICMP_ECHO_REPLY</a> structures followed by the options and data for the replies. The buffer should be large enough to hold at least one 
     * <b>ICMP_ECHO_REPLY</b> structure plus <i>RequestSize</i> bytes of data.
     * @param {Integer} ReplySize The allocated size, in bytes,  of the reply buffer. The buffer should be large enough to hold at least one 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ipexport/ns-ipexport-icmp_echo_reply">ICMP_ECHO_REPLY</a> structure plus <i>RequestSize</i> bytes of data.
     * 
     * This buffer should also be large enough to also hold 8 more bytes of data (the size of an ICMP error message).
     * @param {Integer} Timeout The time, in milliseconds, to wait for replies.
     * @returns {Integer} The 
     * 						<b>IcmpSendEcho</b> function returns the number of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ipexport/ns-ipexport-icmp_echo_reply">ICMP_ECHO_REPLY</a> structures stored in the <i>ReplyBuffer</i>. The status of each reply is contained in the structure. If the return value is zero, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> for additional error information.
     * 
     * If the function fails, the extended error code returned by <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> can be one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The data area passed to a system call is too small. This error is returned if the <i>ReplySize</i> parameter indicates that the buffer pointed to by the <i>ReplyBuffer</i> parameter is too small. 
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
     * An invalid parameter was passed to the function. This error is returned if the <i>IcmpHandle</i> parameter contains an invalid handle. This error can also be returned if the <i>ReplySize</i> parameter specifies a value less than the size of an <a href="https://docs.microsoft.com/windows/desktop/api/ipexport/ns-ipexport-icmp_echo_reply">ICMP_ECHO_REPLY</a> structure.
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
     * Not enough memory is available to complete the operation.
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
     * The request is not supported. This error is returned if no IPv4 stack is on the local computer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IP_BUF_TOO_SMALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The size of the <i>ReplyBuffer</i> specified in the <i>ReplySize</i> parameter was too small.
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/icmpapi/nf-icmpapi-icmpsendecho
     * @since windows5.0
     */
    static IcmpSendEcho(IcmpHandle, DestinationAddress, RequestData, RequestSize, RequestOptions, ReplyBuffer, ReplySize, Timeout) {
        A_LastError := 0

        result := DllCall("IPHLPAPI.dll\IcmpSendEcho", "ptr", IcmpHandle, "uint", DestinationAddress, "ptr", RequestData, "ushort", RequestSize, "ptr", RequestOptions, "ptr", ReplyBuffer, "uint", ReplySize, "uint", Timeout, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The **IcmpSendEcho2** function sends an IPv4 ICMP echo request, and returns either immediately (if *Event* or *ApcRoutine* is non-**NULL**), or returns after the specified time-out. The *ReplyBuffer* contains the ICMP echo responses, if any.
     * @remarks
     * The **IcmpSendEcho2** function is called synchronously if the *ApcRoutine* or *Event* parameters are **NULL**. When called synchronously, the return value contains the number of replies received and stored in *ReplyBuffer* after waiting for the time specified in the *Timeout* parameter. If the return value is zero, then for extended error information call [GetLastError](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * 
     * The **IcmpSendEcho2** function is called asynchronously when either the *ApcRoutine* or *Event* parameters are specified. When called asynchronously, the *ReplyBuffer* and *ReplySize* parameters are required to accept the response. ICMP response data is copied to the *ReplyBuffer* provided, and the application is signaled (when the *Event* parameter is specified) or the callback function is called (when the *ApcRoutine* parameter is specified). The application must parse the data pointed to by *ReplyBuffer* parameter using the [IcmpParseReplies](/windows/win32/api/icmpapi/nf-icmpapi-icmpparsereplies) function. 
     * 
     * If the *Event* parameter is specified, then the **IcmpSendEcho2** function is called asynchronously. The event specified in the *Event* parameter is signaled (at most once) when an ICMP response arrives. Use the [CreateEvent](/windows/win32/api/synchapi/nf-synchapi-createeventa) or [CreateEventEx](/windows/win32/api/synchapi/nf-synchapi-createeventexa) function to create this event object.
     * 
     * If the *ApcRoutine* parameter is specified, then the **IcmpSendEcho2** function is called asynchronously. The *ApcRoutine* parameter should point to a user-defined callback function. The callback function specified in the *ApcRoutine* parameter is called (at most once) when an ICMP response arrives. The invocation of the callback function specified in the *ApcRoutine* parameter is serialized.
     * 
     * If both the *Event* and *ApcRoutine* parameters are specified, then the event specified in the *Event* parameter is signaled (at most once) when an ICMP response arrives, but the callback function specified in the *ApcRoutine* parameter is ignored.
     * 
     * Any application that calls **IcmpSendEcho2** function asynchronously using the *ApcRoutine* parameter must define **PIO_APC_ROUTINE_DEFINED** to force the datatype for the *ApcRoutine* parameter to **PIO_APC_ROUTINE** rather than **FARPROC**.
     * 
     * > [!NOTE]
     * > **PIO_APC_ROUTINE_DEFINED** must be defined before the *Icmpapi.h* header file is included.
     * 
     * The callback function pointed to by the *ApcRoutine* must be defined as a function of type **VOID** with the following syntax:
     * 
     * ```cpp
     * typedef
     * VOID WINAPI
     * (*PIO_APC_ROUTINE) (
     *     IN PVOID ApcContext,
     *     IN PIO_STATUS_BLOCK IoStatusBlock,
     *     IN ULONG Reserved
     *     );
     * ```
     * 
     * The parameters passed to the callback function include the following:
     * 
     * |Parameter|Description|
     * |-|-|
     * |IN PVOID ApcContext|The *AppContext* parameter passed to the **IcmpSendEcho2** function. This parameter can be used by the application to identify the **IcmpSendEcho2** request that the callback function is responding to.|
     * |IN PIO_STATUS_BLOCK IoStatusBlock|A pointer to a **IO_STATUS_BLOCK**. This variable contains the final completion status and information about the operation. The number of bytes actually received in the reply is returned in the *Information* member of the **IO_STATUS_BLOCK** struct.<br/><br/>The **IO_STATUS_BLOCK** structure is defined in the `Wdm.h` header file.|
     * |IN ULONG Reserved|This parameter is reserved.|
     * 
     * The callback function specified in the *ApcRoutine* parameter must be implemented in the same process as the application calling the **IcmpSendEcho2** function. If the callback function is in a separate DLL, then the DLL should be loaded before calling the **IcmpSendEcho2** function. 
     * 
     * The **IcmpSendEcho2** function is exported from the `Iphlpapi.dll`.
     * 
     * For IPv6, use the [Icmp6CreateFile](/windows/win32/api/icmpapi/nf-icmpapi-icmp6createfile), [Icmp6SendEcho2](/windows/win32/api/icmpapi/nf-icmpapi-icmp6sendecho2), and [Icmp6ParseReplies](/windows/win32/api/icmpapi/nf-icmpapi-icmp6parsereplies) functions.
     * 
     * The include directive for the `Iphlpapi.h` header file must be placed before the one for the `Icmpapi.h` header file.
     * @param {Pointer<HANDLE>} IcmpHandle The open handle returned by the [ICMPCreateFile](/windows/win32/api/icmpapi/nf-icmpapi-icmpcreatefile) function.
     * @param {Pointer<HANDLE>} Event An event to be signaled (at most once) when an ICMP response arrives. If this parameter is specified, then it requires a handle to a valid event object. Use the [CreateEvent](/windows/win32/api/synchapi/nf-synchapi-createeventa) or [CreateEventEx](/windows/win32/api/synchapi/nf-synchapi-createeventexa) function to create this event object.
     * 
     * For more information on using events, see [Event objects](/windows/win32/Sync/event-objects).
     * @param {Pointer<PIO_APC_ROUTINE>} ApcRoutine The routine that's called when the calling thread is in an alertable thread, and an ICMPv4 reply arrives. **PIO_APC_ROUTINE_DEFINED** must be defined in order to force the datatype for this parameter to **PIO_APC_ROUTINE** rather than **FARPROC**.
     * @param {Pointer<Void>} ApcContext An optional parameter passed to the callback routine specified in the *ApcRoutine* parameter (at most once) when an ICMP response arrives, or an error occurs.
     * @param {Integer} DestinationAddress The IPv4 destination of the echo request, in the form of an [IPAddr](/windows/win32/api/inaddr/ns-inaddr-in_addr) structure.
     * @param {Pointer<Void>} RequestData A pointer to a buffer that contains data to send in the request.
     * @param {Integer} RequestSize The size, in bytes, of the request data buffer pointed to by the *RequestData* parameter.
     * @param {Pointer<IP_OPTION_INFORMATION>} RequestOptions A pointer to the IP header options for the request, in the form of an [IP_OPTION_INFORMATION](/windows/win32/api/ipexport/ns-ipexport-ip_option_information) structure.
     * 
     * This parameter may be **NULL** if no IP header options need to be specified.
     * @param {Pointer<Void>} ReplyBuffer A pointer to a buffer to hold any replies to the request. Upon return, the buffer contains an array of [ICMP_ECHO_REPLY](/windows/win32/api/ipexport/ns-ipexport-icmp_echo_reply) structures followed by options and data.
     * 
     * The buffer must be large enough to hold at least one **ICMP_ECHO_REPLY** structure, plus *RequestSize* bytes of data, plus an additional 8 bytes of data (the size of an ICMP error message).
     * @param {Integer} ReplySize The allocated size, in bytes, of the reply buffer.
     * 
     * The buffer must be large enough to hold at least one **ICMP_ECHO_REPLY** structure, plus *RequestSize* bytes of data, plus an additional 8 bytes of data (the size of an ICMP error message).
     * @param {Integer} Timeout The time in milliseconds to wait for replies.
     * @returns {Integer} When called synchronously, the **IcmpSendEcho2** function returns the number of replies received and stored in *ReplyBuffer*. If the return value is zero, then for extended error information call [GetLastError](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * 
     * When called asynchronously, the **IcmpSendEcho2** function returns zero. A subsequent call to [GetLastError](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror) returns extended error code **ERROR_IO_PENDING** to indicate that the operation is in progress. The results can be retrieved later when the event specified in the *Event* parameter signals, or the callback function in the *ApcRoutine* parameter is called.
     * 
     * If the return value is zero, then for extended error information call [GetLastError](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * 
     * If the function fails, then the extended error code returned by **GetLastError** can be one of the following values.
     * 
     * |Return code|Description|
     * |-|-|
     * |**ERROR_INVALID_PARAMETER**|An invalid parameter was passed to the function. This error is returned if the *IcmpHandle* parameter contains an invalid handle. This error can also be returned if the *ReplySize* parameter specifies a value less than the size of an [ICMP_ECHO_REPLY](/windows/win32/api/ipexport/ns-ipexport-icmp_echo_reply) structure.|
     * |**ERROR_IO_PENDING**|The operation is in progress. This value is returned by a successful asynchronous call to **IcmpSendEcho2**, and is not an indication of an error.|
     * |**ERROR_NOT_ENOUGH_MEMORY**|Not enough memory is available to complete the operation.|
     * |**ERROR_NOT_SUPPORTED**|The request is not supported. This error is returned if no IPv4 stack is on the local computer.|
     * |**IP_BUF_TOO_SMALL**|The size of the *ReplyBuffer* specified in the *ReplySize* parameter was too small.|
     * |**Other**|Use [FormatMessage](/windows/win32/api/winbase/nf-winbase-formatmessage) to obtain the message string for the returned error.|
     * @see https://learn.microsoft.com/windows/win32/api/icmpapi/nf-icmpapi-icmpsendecho2
     * @since windows5.0
     */
    static IcmpSendEcho2(IcmpHandle, Event, ApcRoutine, ApcContext, DestinationAddress, RequestData, RequestSize, RequestOptions, ReplyBuffer, ReplySize, Timeout) {
        A_LastError := 0

        result := DllCall("IPHLPAPI.dll\IcmpSendEcho2", "ptr", IcmpHandle, "ptr", Event, "ptr", ApcRoutine, "ptr", ApcContext, "uint", DestinationAddress, "ptr", RequestData, "ushort", RequestSize, "ptr", RequestOptions, "ptr", ReplyBuffer, "uint", ReplySize, "uint", Timeout, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sends an IPv4 ICMP echo request and returns either immediately (if Event or ApcRoutine is non-NULL) or returns after the specified time-out. The ReplyBuffer contains the ICMP responses, if any.
     * @remarks
     * The <b>IcmpSendEcho2Ex</b> function is available on Windows Server 2008 and later. 
     * 
     * The <b>IcmpSendEcho2Ex</b> function is an enhanced version of the <a href="https://docs.microsoft.com/windows/desktop/api/icmpapi/nf-icmpapi-icmpsendecho2">IcmpSendEcho2</a> function that allows the user to specify the IPv4 source address on which to issue the ICMP request. The <b>IcmpSendEcho2Ex</b> function is useful in cases where a computer has multiple network interfaces.
     * 
     * The <b>IcmpSendEcho2Ex</b> function is called synchronously if the <i>ApcRoutine</i> or <i>Event</i> parameters are <b>NULL</b>. When called synchronously, the return value contains the number of replies received and stored in <i>ReplyBuffer</i> after waiting for the time specified in the <i>Timeout</i> parameter. If the return value is zero, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> for extended error information.
     * 
     * The <b>IcmpSendEcho2Ex</b> function is called asynchronously when either the <i>ApcRoutine</i> or <i>Event</i> parameters are specified. When called asynchronously,  the <i>ReplyBuffer</i> and <i>ReplySize</i> parameters are  required to accept the response. ICMP response data is copied to the <i>ReplyBuffer</i> provided and the application is signaled (when the <i>Event</i> parameter is specified) or the callback function is called (when the <i>ApcRoutine</i> parameter is specified). The application must parse the data pointed to by <i>ReplyBuffer</i> parameter using the <a href="https://docs.microsoft.com/windows/desktop/api/icmpapi/nf-icmpapi-icmpparsereplies">IcmpParseReplies</a> function. 
     * 
     * If the <i>Event</i> parameter is specified, the <b>IcmpSendEcho2Ex</b> function is called asynchronously. The event specified in the <i>Event</i> parameter is signaled whenever an ICMP response arrives. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-createeventa">CreateEvent</a> function to create this event object. 
     * 
     * If the <i>ApcRoutine</i> parameter is specified, the <b>IcmpSendEcho2Ex</b> function is called asynchronously. The <i>ApcRoutine</i>  parameter should point to a user-defined callback function. The callback function specified in the <i>ApcRoutine</i> parameter is called whenever an ICMP response arrives. The invocation of the callback function specified in the <i>ApcRoutine</i> parameter is serialized. 
     * 
     * If both the <i>Event</i> and <i>ApcRoutine</i> parameters are specified, the event specified in the <i>Event</i> parameter is signaled whenever an ICMP response arrives, but the callback function specified in the <i>ApcRoutine</i> parameter is ignored . 
     * 
     * Any application that calls the <b>IcmpSendEcho2Ex</b> function asynchronously using the <i>ApcRoutine</i> parameter must define <b>PIO_APC_ROUTINE_DEFINED</b> to force the datatype for the <i>ApcRoutine</i> parameter to <b>PIO_APC_ROUTINE</b> rather than <b>FARPROC</b>. <div class="alert"><b>Note</b>  <b>PIO_APC_ROUTINE_DEFINED</b> must be defined before the <i>Icmpapi.h</i> header file is included.</div>
     * <div> </div>
     * 
     * 
     * The callback function pointed to by the <i>ApcRoutine</i> must be defined as a function of type <b>VOID</b> with the following syntax:
     * 
     * 
     * ``` syntax
     * typedef
     * VOID WINAPI
     * (*PIO_APC_ROUTINE) (
     *     IN PVOID ApcContext,
     *     IN PIO_STATUS_BLOCK IoStatusBlock,
     *     IN ULONG Reserved
     *     );
     * ```
     * 
     * The parameters passed to the callback function include the following:
     * 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Parameter</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <a id="IN_PVOID_ApcContext"></a><a id="in_pvoid_apccontext"></a><a id="IN_PVOID_APCCONTEXT"></a>IN PVOID ApcContext
     * 
     * </td>
     * <td width="60%">
     * The <i>ApcContext</i> parameter passed to the <b>IcmpSendEcho2Ex</b> function. This parameter can be used by the application to identify the <b>IcmpSendEcho2Ex</b> request that the callback function is responding to. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <a id="IN_PIO_STATUS_BLOCK_IoStatusBlock"></a><a id="in_pio_status_block_iostatusblock"></a><a id="IN_PIO_STATUS_BLOCK_IOSTATUSBLOCK"></a>IN PIO_STATUS_BLOCK IoStatusBlock
     * 
     * </td>
     * <td width="60%">
     * A pointer to a <b>IO_STATUS_BLOCK</b>. This variable contains the final completion status and information about the operation.  The number of bytes actually received in the reply is returned in the <b>Information</b> member of the <b>IO_STATUS_BLOCK</b> struct.
     * 
     * The <b>IO_STATUS_BLOCK</b> structure is defined in the <i>Wdm.h</i> header file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <a id="IN_ULONG_Reserved"></a><a id="in_ulong_reserved"></a><a id="IN_ULONG_RESERVED"></a>IN ULONG Reserved
     * 
     * </td>
     * <td width="60%">
     * This parameter is reserved. 
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * 
     * The callback function specified in the <i>ApcRoutine</i> parameter must be implemented in the same process as the application calling the <b>IcmpSendEcho2Ex</b> function. If the callback function is in a separate DLL, then the DLL should be loaded before calling the <b>IcmpSendEcho2Ex</b> function. 
     * 
     * For IPv6, use the <a href="https://docs.microsoft.com/windows/desktop/api/icmpapi/nf-icmpapi-icmp6createfile">Icmp6CreateFile</a>, <a href="https://docs.microsoft.com/windows/desktop/api/icmpapi/nf-icmpapi-icmp6sendecho2">Icmp6SendEcho2</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/icmpapi/nf-icmpapi-icmp6parsereplies">Icmp6ParseReplies</a> functions.
     * 
     * Note that the include directive for <i>Iphlpapi.h</i> header file must be placed before the <i>Icmpapi.h</i> header file.
     * @param {Pointer<HANDLE>} IcmpHandle An open handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/icmpapi/nf-icmpapi-icmpcreatefile">ICMPCreateFile</a> function.
     * @param {Pointer<HANDLE>} Event An event to be signaled whenever an ICMP response arrives. If this parameter is specified, it requires a handle to a valid event object. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-createeventa">CreateEvent</a> or <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-createeventexa">CreateEventEx</a> function to create this event object. 
     * 
     * For more information on using events, see <a href="https://docs.microsoft.com/windows/desktop/Sync/event-objects">Event Objects</a>.
     * @param {Pointer<PIO_APC_ROUTINE>} ApcRoutine The routine that is called when the calling thread is in an alertable thread and  an ICMP reply arrives. <b>PIO_APC_ROUTINE_DEFINED</b> must be defined to force the datatype for this parameter to <b>PIO_APC_ROUTINE</b> rather than <b>FARPROC</b>.
     * @param {Pointer<Void>} ApcContext An optional parameter passed to the callback routine specified in the  <i>ApcRoutine</i> parameter whenever an ICMP response arrives or an error occurs.
     * @param {Integer} SourceAddress The IPv4 source address on which to issue the echo request. This address is in the form of an <a href="https://docs.microsoft.com/windows/desktop/api/inaddr/ns-inaddr-in_addr">IPAddr</a> structure.
     * @param {Integer} DestinationAddress The IPv4 destination address for the echo request. This address is in the form of an <a href="https://docs.microsoft.com/windows/desktop/api/inaddr/ns-inaddr-in_addr">IPAddr</a> structure.
     * @param {Pointer<Void>} RequestData A pointer to a buffer that contains data to send in the request.
     * @param {Integer} RequestSize The size, in bytes, of the request data buffer pointed to by the <i>RequestData</i> parameter.
     * @param {Pointer<IP_OPTION_INFORMATION>} RequestOptions A pointer to the IP header options for the request, in the form of an <a href="https://docs.microsoft.com/windows/desktop/api/ipexport/ns-ipexport-ip_option_information">IP_OPTION_INFORMATION</a> structure. On a 64-bit platform, this parameter is in the form for an <a href="https://docs.microsoft.com/windows/desktop/api/ipexport/ns-ipexport-ip_option_information32">IP_OPTION_INFORMATION32</a> structure.
     * 
     * This parameter may be <b>NULL</b> if no IP header options need to be specified.
     * @param {Pointer<Void>} ReplyBuffer A pointer to a buffer to hold any replies to the request. Upon return, the buffer contains an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ipexport/ns-ipexport-icmp_echo_reply">ICMP_ECHO_REPLY</a> structures followed by options and data. The buffer must be large enough to hold at least one 
     * <b>ICMP_ECHO_REPLY</b> structure plus <i>RequestSize</i> bytes of data.
     * 
     * This buffer should also be large enough to also hold 8 more bytes of data (the size of an ICMP error message) plus space for an <b>IO_STATUS_BLOCK</b> structure.
     * @param {Integer} ReplySize The allocated size, in bytes,  of the reply buffer. The buffer should be large enough to hold at least one 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ipexport/ns-ipexport-icmp_echo_reply">ICMP_ECHO_REPLY</a> structure plus <i>RequestSize</i> bytes of data.
     * 
     * This buffer should also be large enough to also hold 8 more bytes of data (the size of an ICMP error message) plus space for an <b>IO_STATUS_BLOCK</b> structure.
     * @param {Integer} Timeout The time, in milliseconds, to wait for replies.
     * @returns {Integer} When called synchronously, the <b>IcmpSendEcho2Ex</b> function returns the number of replies received and stored in <i>ReplyBuffer</i>. If the return value is zero, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> for extended error information.
     * 
     * When called asynchronously, the <b>IcmpSendEcho2Ex</b> function returns ERROR_IO_PENDING  to indicate the operation is in progress. The results can be retrieved later when the event specified in the <i>Event</i> parameter signals or the callback function in the <i>ApcRoutine</i> parameter is called.
     * 
     * If the return value is zero, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> for extended error information.
     * 
     * If the function fails, the extended error code returned by <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> can be one of the following values.
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
     * An invalid parameter was passed to the function. This error is returned if the <i>IcmpHandle</i> parameter contains an invalid handle. This error can also be returned if the <i>ReplySize</i> parameter specifies a value less than the size of an <a href="https://docs.microsoft.com/windows/desktop/api/ipexport/ns-ipexport-icmp_echo_reply">ICMP_ECHO_REPLY</a> structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_IO_PENDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is in progress. This value is returned by a successful asynchronous call to <a href="https://docs.microsoft.com/windows/desktop/api/icmpapi/nf-icmpapi-icmpsendecho2ex">IcmpSendEcho2Ex</a> and is not an indication of an error.  
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
     * Not enough memory is available to complete the operation.
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
     * The request is not supported. This error is returned if no IPv4 stack is on the local computer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IP_BUF_TOO_SMALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The size of the <i>ReplyBuffer</i> specified in the <i>ReplySize</i> parameter was too small.
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/icmpapi/nf-icmpapi-icmpsendecho2ex
     * @since windows6.0.6000
     */
    static IcmpSendEcho2Ex(IcmpHandle, Event, ApcRoutine, ApcContext, SourceAddress, DestinationAddress, RequestData, RequestSize, RequestOptions, ReplyBuffer, ReplySize, Timeout) {
        A_LastError := 0

        result := DllCall("IPHLPAPI.dll\IcmpSendEcho2Ex", "ptr", IcmpHandle, "ptr", Event, "ptr", ApcRoutine, "ptr", ApcContext, "uint", SourceAddress, "uint", DestinationAddress, "ptr", RequestData, "ushort", RequestSize, "ptr", RequestOptions, "ptr", ReplyBuffer, "uint", ReplySize, "uint", Timeout, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The Icmp6SendEcho2 function sends an IPv6 ICMPv6 echo request and returns either immediately (if Event or ApcRoutine is non-NULL) or returns after the specified time-out. The ReplyBuffer contains the IPv6 ICMPv6 echo response, if any.
     * @remarks
     * The <b>Icmp6SendEcho2</b> function is called synchronously if the <i>ApcRoutine</i> or <i>Event</i> parameters are <b>NULL</b>. When called synchronously, the return value contains the number of replies received and stored in <i>ReplyBuffer</i> after waiting for the time specified in the <i>Timeout</i> parameter. If the return value is zero, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> for extended error information.
     * 
     * The <b>Icmp6SendEcho2</b> function is called asynchronously when either the <i>ApcRoutine</i> or <i>Event</i> parameters are specified. When called asynchronously,  the <i>ReplyBuffer</i> and <i>ReplySize</i> parameters are  required to accept the response. ICMP response data is copied to the <i>ReplyBuffer</i> provided and the application is signaled (when the <i>Event</i> parameter is specified) or the callback function is called (when the <i>ApcRoutine</i> parameter is specified). The application must parse the data pointed to by <i>ReplyBuffer</i> parameter using the <a href="https://docs.microsoft.com/windows/desktop/api/icmpapi/nf-icmpapi-icmp6parsereplies">Icmp6ParseReplies</a> function. 
     * 
     * If the <i>Event</i> parameter is specified, the <b>Icmp6SendEcho2</b> function is called asynchronously. The event specified in the <i>Event</i> parameter is signaled whenever an ICMPv6 response arrives. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-createeventa">CreateEvent</a> function to create this event object. 
     * 
     * If the <i>ApcRoutine</i> parameter is specified, the <b>Icmp6SendEcho2</b> function is called asynchronously. The <i>ApcRoutine</i>  parameter should point to a user-defined callback function. The callback function specified in the <i>ApcRoutine</i> parameter is called whenever an ICMPv6 response arrives. The invocation of the callback function specified in the <i>ApcRoutine</i> parameter is serialized. 
     * 
     * If both the <i>Event</i> and <i>ApcRoutine</i> parameters are specified, the event specified in the <i>Event</i> parameter is signaled whenever an ICMPv6 response arrives, but the callback function specified in the <i>ApcRoutine</i> parameter is ignored . 
     * 
     * On Windows Vista and later, any application that calls <b>Icmp6SendEcho2</b> function asynchronously using the <i>ApcRoutine</i> parameter must define <b>PIO_APC_ROUTINE_DEFINED</b> to force the datatype for the <i>ApcRoutine</i> parameter to <b>PIO_APC_ROUTINE</b> rather than <b>FARPROC</b>. <div class="alert"><b>Note</b>  <b>PIO_APC_ROUTINE_DEFINED</b> must be defined before the <i>Icmpapi.h</i> header file is included.</div>
     * <div> </div>
     * 
     * 
     * On Windows Vista and later, the callback function pointed to by the <i>ApcRoutine</i> must be defined as a function of type <b>VOID</b> with the following syntax:
     * 
     * 
     * ``` syntax
     * typedef
     * VOID WINAPI
     * (*PIO_APC_ROUTINE) (
     *     IN PVOID ApcContext,
     *     IN PIO_STATUS_BLOCK IoStatusBlock,
     *     IN ULONG Reserved
     *     );
     * ```
     * 
     * On Windows Vista and later, the parameters passed to the callback function include the following:
     * 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Parameter</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <a id="IN_PVOID_ApcContext"></a><a id="in_pvoid_apccontext"></a><a id="IN_PVOID_APCCONTEXT"></a>IN PVOID ApcContext
     * 
     * </td>
     * <td width="60%">
     * The <i>ApcContext</i> parameter passed to the <b>Icmp6SendEcho2</b> function. This parameter can be used by the application to identify the <b>Icmp6SendEcho2</b> request that the callback function is responding to. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <a id="IN_PIO_STATUS_BLOCK_IoStatusBlock"></a><a id="in_pio_status_block_iostatusblock"></a><a id="IN_PIO_STATUS_BLOCK_IOSTATUSBLOCK"></a>IN PIO_STATUS_BLOCK IoStatusBlock
     * 
     * </td>
     * <td width="60%">
     * A pointer to a <b>IO_STATUS_BLOCK</b>. This variable contains the final completion status and information about the operation.  The number of bytes actually received in the reply is returned in the <b>Information</b> member of the <b>IO_STATUS_BLOCK</b> struct.
     * 
     * The <b>IO_STATUS_BLOCK</b> structure is defined in the <i>Wdm.h</i> header file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <a id="IN_ULONG_Reserved"></a><a id="in_ulong_reserved"></a><a id="IN_ULONG_RESERVED"></a>IN ULONG Reserved
     * 
     * </td>
     * <td width="60%">
     * This parameter is reserved. 
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * 
     * On Windows Server 2003 and Windows XP, any application that calls the <b>Icmp6SendEcho2</b> function asynchronously using the <i>ApcRoutine</i> parameter must not define <b>PIO_APC_ROUTINE_DEFINED</b> to force the datatype for the <i>ApcRoutine</i> parameter to <b>FARPROC</b> rather than <b>PIO_APC_ROUTINE</b>. 
     * 
     * On Windows Server 2003 and Windows XP, the callback function pointed to by the <i>ApcRoutine</i> must be defined as a function of type <b>VOID</b> with the following syntax:
     * 
     * 
     * ``` syntax
     * typedef
     * VOID WINAPI
     * (*FARPROC) (
     *     IN PVOID ApcContext,
     *     );
     * ```
     * 
     * On Windows Server 2003 and Windows XP, the parameters passed to the callback function include the following:
     * 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Parameter</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <a id="IN_PVOID_ApcContext"></a><a id="in_pvoid_apccontext"></a><a id="IN_PVOID_APCCONTEXT"></a>IN PVOID ApcContext
     * 
     * </td>
     * <td width="60%">
     * The <i>ApcContext</i> parameter passed to the <b>Icmp6SendEcho2</b> function. This parameter can be used by the application to identify the <b>Icmp6SendEcho2</b> request that the callback function is responding to. 
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * 
     * The callback function specified in the <i>ApcRoutine</i> parameter must be implemented in the same process as the application calling the <b>Icmp6SendEcho2</b> function. If the callback function is in a separate DLL, then the DLL should be loaded before calling the <b>Icmp6SendEcho2</b> function. 
     * 
     * For IPv4, use the <a href="https://docs.microsoft.com/windows/desktop/api/icmpapi/nf-icmpapi-icmpcreatefile">IcmpCreateFile</a>,  <b>IcmpSendEcho</b>, <a href="https://docs.microsoft.com/windows/desktop/api/icmpapi/nf-icmpapi-icmpsendecho2">IcmpSendEcho2</a>, <a href="https://docs.microsoft.com/windows/desktop/api/icmpapi/nf-icmpapi-icmpsendecho2ex">IcmpSendEcho2Ex</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/icmpapi/nf-icmpapi-icmpparsereplies">IcmpParseReplies</a> functions.
     * 
     * Note that the include directive for <i>Iphlpapi.h</i> header file must be placed before the <i>Icmpapi.h</i> header file.
     * @param {Pointer<HANDLE>} IcmpHandle The open handle returned by <a href="https://docs.microsoft.com/windows/desktop/api/icmpapi/nf-icmpapi-icmp6createfile">Icmp6CreateFile</a>.
     * @param {Pointer<HANDLE>} Event An event to be signaled whenever an ICMPv6 response arrives. If this parameter is specified, it requires a handle to a valid event object. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-createeventa">CreateEvent</a> or <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-createeventexa">CreateEventEx</a> function to create this event object. 
     * 
     * For more information on using events, see <a href="https://docs.microsoft.com/windows/desktop/Sync/event-objects">Event Objects</a>.
     * @param {Pointer<PIO_APC_ROUTINE>} ApcRoutine The routine that is called when the calling thread is in an alertable thread and  an ICMPv6 reply arrives. On Windows Vista and later, <b>PIO_APC_ROUTINE_DEFINED</b> must be defined to force the datatype for this parameter to <b>PIO_APC_ROUTINE</b> rather than <b>FARPROC</b>. 
     * 
     * On Windows Server 2003 and Windows XP, 
     *    <b>PIO_APC_ROUTINE_DEFINED</b> must not be defined to force the datatype for this parameter to <b>FARPROC</b>.
     * @param {Pointer<Void>} ApcContext An optional parameter passed to the callback routine specified in the  <i>ApcRoutine</i> parameter whenever an ICMPv6 response arrives or an error occurs.
     * @param {Pointer<SOCKADDR_IN6>} SourceAddress The IPv6 source address on which to issue the echo request, in the form of a <a href="https://docs.microsoft.com/windows/desktop/WinSock/sockaddr-2">sockaddr</a> structure.
     * @param {Pointer<SOCKADDR_IN6>} DestinationAddress The IPv6 destination address of the echo request, in the form of a <a href="https://docs.microsoft.com/windows/desktop/WinSock/sockaddr-2">sockaddr</a> structure.
     * @param {Pointer<Void>} RequestData A pointer to a buffer that contains data to send in the request.
     * @param {Integer} RequestSize The size, in bytes, of the request data buffer pointed to by the <i>RequestData</i> parameter.
     * @param {Pointer<IP_OPTION_INFORMATION>} RequestOptions A pointer to the IPv6 header options for the request, in the form of an <a href="https://docs.microsoft.com/windows/desktop/api/ipexport/ns-ipexport-ip_option_information">IP_OPTION_INFORMATION</a> structure. On a 64-bit platform, this parameter is in the form for an <a href="https://docs.microsoft.com/windows/desktop/api/ipexport/ns-ipexport-ip_option_information32">IP_OPTION_INFORMATION32</a> structure.
     * 
     * This parameter may be NULL if no IP header options need to be specified.
     * 
     * <div class="alert"><b>Note</b>  On Windows Server 2003 and Windows XP, the <i>RequestOptions</i> parameter is not optional and must not be NULL and only the <b>Ttl</b> and <b>Flags</b> members are used.</div>
     * <div> </div>
     * @param {Pointer<Void>} ReplyBuffer A pointer to a buffer to hold replies to the request. Upon return, the buffer contains an <a href="https://docs.microsoft.com/windows/desktop/api/ipexport/ns-ipexport-icmpv6_echo_reply_lh">ICMPV6_ECHO_REPLY</a> structure followed by the message body from the ICMPv6 echo response reply data. The buffer must be large enough to hold at least one 
     * <b>ICMPV6_ECHO_REPLY</b> structure plus the number of bytes of data specified in the <i>RequestSize</i> parameter. This buffer should also be large enough to also hold 8 more bytes of data (the size of an ICMP error message) plus space for an <b>IO_STATUS_BLOCK</b> structure.
     * @param {Integer} ReplySize The size, in bytes,  of the reply buffer pointed to by the <i>ReplyBuffer</i> parameter. This buffer should be large enough to hold at least one 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ipexport/ns-ipexport-icmpv6_echo_reply_lh">ICMPV6_ECHO_REPLY</a> structure plus <i>RequestSize</i> bytes of data. This buffer should also be large enough to also hold 8 more bytes of data (the size of an ICMP error message) plus space for an <b>IO_STATUS_BLOCK</b> structure.
     * @param {Integer} Timeout The time, in milliseconds, to wait for replies. This parameter is only used if the <b>Icmp6SendEcho2</b> function is called synchronously. So this parameter is not used if either the <i>ApcRoutine</i> or <i>Event</i> parameter are not <b>NULL</b>.
     * @returns {Integer} When called synchronously, the <b>Icmp6SendEcho2</b> function returns the number of replies received and stored in <i>ReplyBuffer</i>. If the return value is zero, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> for extended error information.
     * 
     * When called asynchronously, the <b>Icmp6SendEcho2</b> function returns ERROR_IO_PENDING  to indicate the operation is in progress. The results can be retrieved later when the event specified in the <i>Event</i> parameter signals or the callback function in the <i>ApcRoutine</i> parameter is called.
     * 
     * If the return value is zero, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> for extended error information.
     * 
     * If the function fails, the extended error code returned by <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> can be one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CALL_NOT_IMPLEMENTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function is not supported on this system.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The data area passed to a system call is too small. This error is returned if the <i>ReplySize</i> parameter indicates that the buffer pointed to by the <i>ReplyBuffer</i> parameter is too small. 
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
     * One of the parameters is invalid. This error is returned if the <i>IcmpHandle</i> parameter contains an invalid handle. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_IO_PENDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is in progress. This value is returned by a successful asynchronous call to <a href="https://docs.microsoft.com/windows/desktop/api/icmpapi/nf-icmpapi-icmp6sendecho2">Icmp6SendEcho2</a> and is not an indication of an error.  
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
     * Not enough memory is available to process this command.
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
     * The request is not supported. This error is returned if no IPv6 stack is on the local computer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IP_BUF_TOO_SMALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The size of the <i>ReplyBuffer</i> specified in the <i>ReplySize</i> parameter was too small.
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/icmpapi/nf-icmpapi-icmp6sendecho2
     * @since windows5.1.2600
     */
    static Icmp6SendEcho2(IcmpHandle, Event, ApcRoutine, ApcContext, SourceAddress, DestinationAddress, RequestData, RequestSize, RequestOptions, ReplyBuffer, ReplySize, Timeout) {
        A_LastError := 0

        result := DllCall("IPHLPAPI.dll\Icmp6SendEcho2", "ptr", IcmpHandle, "ptr", Event, "ptr", ApcRoutine, "ptr", ApcContext, "ptr", SourceAddress, "ptr", DestinationAddress, "ptr", RequestData, "ushort", RequestSize, "ptr", RequestOptions, "ptr", ReplyBuffer, "uint", ReplySize, "uint", Timeout, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Parses the reply buffer provided and returns the number of ICMP echo request responses found.
     * @remarks
     * The <b>IcmpParseReplies</b> function should not be used on a reply buffer previously passed to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/icmpapi/nf-icmpapi-icmpsendecho">IcmpSendEcho</a>. The 
     * <b>IcmpSendEcho</b> function parses that buffer before returning to the user. Use this function only with 
     * <a href="https://docs.microsoft.com/windows/desktop/api/icmpapi/nf-icmpapi-icmpsendecho2">IcmpSendEcho2</a>.
     * 
     * The <b>IcmpParseReplies</b> function is exported from the <i>Icmp.dll</i> on Windows 2000. The <b>IcmpParseReplies</b> function is exported from the <i>Iphlpapi.dll</i> on Windows XP and later. Windows version checking is not recommended to use this function. Applications requiring portability  with this function across Windows 2000, Windows XP, Windows Server 2003 and later Windows versions should not statically link to either the <i>Icmp.lib</i> or the <i>Iphlpapi.lib</i> file. Instead, the application should check for the presence of <b>IcmpParseReplies</b> in the <i>Iphlpapi.dll</i> with calls to <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya">LoadLibrary</a> and <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a>.  Failing that, the application should check for the presence of <b>IcmpParseReplies</b> in the <i>Icmp.dll</i> with  calls to <b>LoadLibrary</b> and <b>GetProcAddress</b>. 
     * 
     * Note that the include directive for <i>Iphlpapi.h</i> header file must be placed before the <i>Icmpapi.h</i> header file.
     * @param {Pointer<Void>} ReplyBuffer The buffer passed to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/icmpapi/nf-icmpapi-icmpsendecho2">IcmpSendEcho2</a>. This is rewritten to hold an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ipexport/ns-ipexport-icmp_echo_reply">ICMP_ECHO_REPLY</a> structures, its type is <b>PICMP_ECHO_REPLY</b>. 
     * 
     * On a 64-bit platform, this buffer is rewritten to hold an array of <a href="https://docs.microsoft.com/windows/desktop/api/ipexport/ns-ipexport-icmp_echo_reply32">ICMP_ECHO_REPLY32</a> structures, its type is <b>PICMP_ECHO_REPLY32</b>.
     * @param {Integer} ReplySize The size, in bytes, of the buffer pointed to by the <i>ReplyBuffer</i> parameter.
     * @returns {Integer} The 
     * <b>IcmpParseReplies</b> function returns the number of ICMP responses found on success. The function returns zero on error. Call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> for additional error information.
     * @see https://learn.microsoft.com/windows/win32/api/icmpapi/nf-icmpapi-icmpparsereplies
     * @since windows5.0
     */
    static IcmpParseReplies(ReplyBuffer, ReplySize) {
        A_LastError := 0

        result := DllCall("IPHLPAPI.dll\IcmpParseReplies", "ptr", ReplyBuffer, "uint", ReplySize, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The Icmp6ParseReplies function parses the reply buffer provided and returns an IPv6 ICMPv6 echo response reply if found.
     * @remarks
     * The <b>Icmp6ParseReplies</b> function is used by IPv6 to parse replies that result from an ICMPv6 echo request. The <b>Icmp6ParseReplies</b> function  parses a reply buffer previously passed to 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/icmpapi/nf-icmpapi-icmp6sendecho2">Icmp6SendEcho2</a> function. Use the <b>Icmp6ParseReplies</b>  function only with 
     * the <b>Icmp6SendEcho2</b> function.
     * 
     * The <b>Icmp6ParseReplies</b> function cannot be used on a reply buffer previously passed to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/icmpapi/nf-icmpapi-icmpsendecho">IcmpSendEcho</a> or <a href="https://docs.microsoft.com/windows/desktop/api/icmpapi/nf-icmpapi-icmpsendecho2">IcmpSendEcho2</a> for IPv4.
     * 
     * For IPv4, use the <a href="https://docs.microsoft.com/windows/desktop/api/icmpapi/nf-icmpapi-icmpcreatefile">IcmpCreateFile</a>,  <b>IcmpSendEcho</b>, <a href="https://docs.microsoft.com/windows/desktop/api/icmpapi/nf-icmpapi-icmpsendecho2">IcmpSendEcho2</a>, <a href="https://docs.microsoft.com/windows/desktop/api/icmpapi/nf-icmpapi-icmpsendecho2ex">IcmpSendEcho2Ex</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/icmpapi/nf-icmpapi-icmpparsereplies">IcmpParseReplies</a> functions.
     * 
     * Note that the include directive for <i>Iphlpapi.h</i> header file must be placed before the <i>Icmpapi.h</i> header file.
     * @param {Pointer<Void>} ReplyBuffer A pointer to the buffer passed to 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/icmpapi/nf-icmpapi-icmp6sendecho2">Icmp6SendEcho2</a> function. This parameter is points to an <a href="https://docs.microsoft.com/windows/desktop/api/ipexport/ns-ipexport-icmpv6_echo_reply_lh">ICMPV6_ECHO_REPLY</a> structure to hold the response.
     * @param {Integer} ReplySize The size, in bytes, of the buffer pointed to by the <i>ReplyBuffer</i> parameter.
     * @returns {Integer} The <b>Icmp6ParseReplies</b> function returns 1 on success. In this case, the <b>Status</b> member in the <a href="https://docs.microsoft.com/windows/desktop/api/ipexport/ns-ipexport-icmpv6_echo_reply_lh">ICMPV6_ECHO_REPLY</a> structure pointed to by the <i>ReplyBuffer</i> parameter will be either <b>IP_SUCCESS</b> if the target node responded or <b>IP_TTL_EXPIRED_TRANSIT</b>.
     * 
     * If the return value is zero, extended error information is available through 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 						
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_GEN_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A general failure occurred. This error is returned if the <i>ReplyBuffer</i> parameter is a <b>NULL</b> pointer or the <i>ReplySize </i> parameter is zero. 
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/icmpapi/nf-icmpapi-icmp6parsereplies
     * @since windows5.1.2600
     */
    static Icmp6ParseReplies(ReplyBuffer, ReplySize) {
        A_LastError := 0

        result := DllCall("IPHLPAPI.dll\Icmp6ParseReplies", "ptr", ReplyBuffer, "uint", ReplySize, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The GetNumberOfInterfaces functions retrieves the number of interfaces on the local computer.
     * @remarks
     * The 
     * <b>GetNumberOfInterfaces</b> function returns the number of interfaces on the local computer, including the loopback interface. This number is one more than the number of adapters returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getadaptersinfo">GetAdaptersInfo</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getinterfaceinfo">GetInterfaceInfo</a> functions because these functions do not return information about the loopback interface.
     * @param {Pointer<UInt32>} pdwNumIf Pointer to a <b>DWORD</b> variable that receives the number of interfaces on the local computer.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-getnumberofinterfaces
     * @since windows5.0
     */
    static GetNumberOfInterfaces(pdwNumIf) {
        result := DllCall("IPHLPAPI.dll\GetNumberOfInterfaces", "ptr", pdwNumIf, "uint")
        return result
    }

    /**
     * The GetIfEntry function retrieves information for the specified interface on the local computer.
     * @remarks
     * The <b>GetIfEntry</b> function retrieves information for an interface on a local computer. 
     * 
     * The <b>dwIndex</b> member in the <a href="https://docs.microsoft.com/windows/desktop/api/ifmib/ns-ifmib-mib_ifrow">MIB_IFROW</a> structure pointed to by the <i>pIfRow</i> parameter must be initialized to a valid network interface index retrieved by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getiftable">GetIfTable</a>, <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-getiftable2">GetIfTable2</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-getiftable2ex">GetIfTable2Ex</a> function.
     * 
     * The <b>GetIfEntry</b> function will fail if the  <b>dwIndex</b>  member of the <a href="https://docs.microsoft.com/windows/desktop/api/ifmib/ns-ifmib-mib_ifrow">MIB_IFROW</a> pointed to by the <i>pIfRow</i> parameter does not match an existing interface index on the local computer.
     * @param {Pointer<MIB_IFROW>} pIfRow A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ifmib/ns-ifmib-mib_ifrow">MIB_IFROW</a> structure that, on successful return, receives information for an interface on the local computer. On input, set the <b>dwIndex</b> member of <b>MIB_IFROW</b> to the index of the interface for which to retrieve information. The value for the <b>dwIndex</b> must be retrieved by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getiftable">GetIfTable</a>, <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-getiftable2">GetIfTable2</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-getiftable2ex">GetIfTable2Ex</a> function.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CAN_NOT_COMPLETE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The request could not be completed. This is an internal error. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The data is invalid. This error is returned if the  network interface index specified by the <b>dwIndex</b>  member of the <a href="https://docs.microsoft.com/windows/desktop/api/ifmib/ns-ifmib-mib_ifrow">MIB_IFROW</a> structure pointed to by the <i>pIfRow</i> parameter is not a valid interface index on the local computer.  
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
     * An invalid parameter was passed to the function. This error is returned if a <b>NULL</b> pointer is passed in the <i>pIfRow</i> parameter.
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
     * The specified interface could not be found. This error is returned if the  network interface index specified by the <b>dwIndex</b>  member of the <a href="https://docs.microsoft.com/windows/desktop/api/ifmib/ns-ifmib-mib_ifrow">MIB_IFROW</a> structure pointed to by the <i>pIfRow</i> parameter could not be found.  
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
     * The request is not supported. This error is returned if IPv4 is not configured on the local computer. 
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-getifentry
     * @since windows5.0
     */
    static GetIfEntry(pIfRow) {
        result := DllCall("IPHLPAPI.dll\GetIfEntry", "ptr", pIfRow, "uint")
        return result
    }

    /**
     * The GetIfTable function retrieves the MIB-II interface table.
     * @remarks
     * The  
     * <b>GetIfTable</b> function enumerates physical interfaces on a local system and returns this information in a <a href="https://docs.microsoft.com/windows/desktop/api/ifmib/ns-ifmib-mib_iftable">MIB_IFTABLE</a> structure. The physical interfaces include the software loopback interface. 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-getiftable2">GetIfTable2</a> and <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-getiftable2ex">GetIfTable2Ex</a> functions available on Windows Vista and later are an enhanced version of the <b>GetIfTable</b> function that enumerate both the physical and logical interfaces on a local system. Logical interfaces include various WAN Miniport interfaces used for L2TP, PPTP, PPOE, and other tunnel encapsulations.
     * 
     * Interfaces are returned in a <a href="https://docs.microsoft.com/windows/desktop/api/ifmib/ns-ifmib-mib_iftable">MIB_IFTABLE</a> structure in the buffer pointed to by the <i>pIfTable</i> parameter. The <b>MIB_IFTABLE</b> structure contains an interface count and an array of <a href="https://docs.microsoft.com/windows/desktop/api/ifmib/ns-ifmib-mib_ifrow">MIB_IFROW</a> structures for each interface. 
     * 
     * Note that the returned <a href="https://docs.microsoft.com/windows/desktop/api/ifmib/ns-ifmib-mib_iftable">MIB_IFTABLE</a> structure pointed to by the <i>pIfTable</i> parameter may contain padding for alignment between the <b>dwNumEntries</b> member and the first <a href="https://docs.microsoft.com/windows/desktop/api/ifmib/ns-ifmib-mib_ifrow">MIB_IFROW</a> array entry in the <b>table</b> member of the <b>MIB_IFTABLE</b> structure. Padding for alignment may also be present between the <b>MIB_IFROW</b> array entries. Any access to a <b>MIB_IFROW</b> array entry should assume  padding may exist.
     * @param {Pointer<MIB_IFTABLE>} pIfTable A pointer to a buffer that receives the interface table as a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ifmib/ns-ifmib-mib_iftable">MIB_IFTABLE</a> structure.
     * @param {Pointer<UInt32>} pdwSize On input, specifies the size in bytes of the buffer pointed to by the <i>pIfTable</i> parameter.
     * 
     * On output, if the buffer is not large enough to hold the returned interface table, the function sets this parameter equal to the required buffer size in bytes.
     * @param {Integer} bOrder A Boolean value that specifies whether the returned interface table should be sorted in ascending order by interface index. If this parameter is <b>TRUE</b>, the table is sorted.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer pointed to by the <i>pIfTable</i> parameter is not large enough. The required size is returned in the <b>DWORD</b> variable pointed to by the <i>pdwSize</i> parameter.
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
     * The <i>pdwSize</i> parameter is <b>NULL</b>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getiftable">GetIfTable</a> is unable to write to the memory pointed to by the <i>pdwSize</i> parameter.
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
     * This function is not supported on the operating system in use on the local system.
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
     * Use 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-getiftable
     * @since windows5.0
     */
    static GetIfTable(pIfTable, pdwSize, bOrder) {
        result := DllCall("IPHLPAPI.dll\GetIfTable", "ptr", pIfTable, "ptr", pdwSize, "int", bOrder, "uint")
        return result
    }

    /**
     * The GetIpAddrTable function retrieves the interface�to�IPv4 address mapping table.
     * @remarks
     * The <b>GetIpAddrTable</b> function retrieves the interface–to–IPv4 address mapping table on a local computer and returns this information in an <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipaddrtable">MIB_IPADDRTABLE</a> structure.
     * 
     * The IPv4 addresses returned by the <b>GetIpAddrTable</b> function are affected by the status of the network interfaces on a local computer. Manually resetting a network interface card (NIC) and certain PnP events may result in an IP address being removed or changed. 
     * 
     * On Windows Server 2003 and Windows XP, the IPv4 addresses returned by the <b>GetIpAddrTable</b> function are also affected if the media sensing capability of the TCP/IP stack on a local computer has been disabled by calling the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-disablemediasense">DisableMediaSense</a> function. When media sensing has been disabled, the <b>GetIpAddrTable</b> function may return IPv4 addresses associated with disconnected interfaces. These Ipv4 addresses for disconnected interfaces are not valid for use. 
     * 
     * On Windows Server 2008 and Windows Vista, the IPv4 addresses returned by the <b>GetIpAddrTable</b> function are not affected by the media sensing capability of the TCP/IP stack on a local computer. The <b>GetIpAddrTable</b> function returns only valid IPv4 addresses. 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getadaptersaddresses">GetAdaptersAddresses</a> function available on Windows XP can be used to retrieve both IPv6 and IPv4 addresses and interface information. 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipaddrtable">MIB_IPADDRTABLE</a> structure returned by the <b>GetIpAddrTable</b> function may contain padding for alignment between the <b>dwNumEntries</b> member and the first <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipaddrrow_w2k">MIB_IPADDRROW</a> array entry in the <b>table</b> member. Padding for alignment may also be present between the <b>MIB_IPADDRROW</b> array entries in the <b>table</b> member. Any access to a <b>MIB_IPADDRROW</b> array entry should assume  padding may exist. 
     * 
     * 
     * 
     * On the Microsoft Windows Software Development Kit (SDK) released for Windows Vista and later, the organization of header files has changed and the <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipaddrrow_w2k">MIB_IPADDRROW</a> is defined in the <i>Ipmib.h</i> header file not in the <i>Iprtrmib.h</i> header file. Note that the <i>Ipmib.h</i> header file is automatically included in <i>Iprtrmib.h</i> which is automatically included in the <i>Iphlpapi.h</i> header file. The <i>Ipmib.h</i> and <i>Iprtrmib.h</i> header files should never be used directly.
     * @param {Pointer<MIB_IPADDRTABLE>} pIpAddrTable A pointer to a buffer that receives the interface–to–IPv4 address mapping table as a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipaddrtable">MIB_IPADDRTABLE</a> structure.
     * @param {Pointer<UInt32>} pdwSize On input, specifies the size in bytes  of the buffer pointed to by the <i>pIpAddrTable</i> parameter. 
     * 
     * 
     * 
     * 
     * On output, if the buffer is not large enough to hold the returned mapping table, the function sets this parameter equal to the required buffer size in bytes.
     * @param {Integer} bOrder If this parameter is <b>TRUE</b>, then
     * the returned mapping table
     * is sorted in ascending order by IPv4 address.
     * The sorting is performed in network byte order.
     * For example, 10.0.0.255 comes immediately before 10.0.1.0.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer pointed to by the <i>pIpAddrTable</i> parameter is not large enough. The required size is returned in the <b>DWORD</b> variable pointed to by the <i>pdwSize</i> parameter.
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
     * The <i>pdwSize</i> parameter is <b>NULL</b>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getipaddrtable">GetIpAddrTable</a> is unable to write to the memory pointed to by the <i>pdwSize</i> parameter.
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
     * This function is not supported on the operating system in use on the local system.
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-getipaddrtable
     * @since windows5.0
     */
    static GetIpAddrTable(pIpAddrTable, pdwSize, bOrder) {
        result := DllCall("IPHLPAPI.dll\GetIpAddrTable", "ptr", pIpAddrTable, "ptr", pdwSize, "int", bOrder, "uint")
        return result
    }

    /**
     * The GetIpNetTable function retrieves the IPv4 to physical address mapping table.
     * @remarks
     * The  
     * <b>GetIpNetTable</b> function enumerates the Address Resolution Protocol (ARP) entries for IPv4 on a local system from the IPv4 to physical address mapping table and returns this information in a <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipnettable">MIB_IPNETTABLE</a> structure. 
     * 
     * The IPv4 address entries are returned in a <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipnettable">MIB_IPNETTABLE</a> structure in the buffer pointed to by the <i>pIpNetTable</i> parameter. The <b>MIB_IPNETTABLE</b> structure contains a count of ARP entries and an array of <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipnetrow_lh">MIB_IPNETROW</a> structures for each IPv4 address entry. 
     * 
     * Note that the returned <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipnettable">MIB_IPNETTABLE</a> structure pointed to by the <i>pIpNetTable</i> parameter may contain padding for alignment between the <b>dwNumEntries</b> member and the first <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipnetrow_lh">MIB_IPNETROW</a> array entry in the <b>table</b> member of the <b>MIB_IPNETTABLE</b> structure. Padding for alignment may also be present between the <b>MIB_IPNETROW</b> array entries. Any access to a <b>MIB_IPNETROW</b> array entry should assume  padding may exist. 
     * 
     * 
     * 
     *  on Windows Vista and later, the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-getipnettable2">GetIpNetTable2</a> function can be used to retrieve the neighbor IP addresses for both IPv6 and IPv4.
     * @param {Pointer<MIB_IPNETTABLE>} IpNetTable A pointer to a buffer that receives the IPv4 to physical address mapping table as a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipnettable">MIB_IPNETTABLE</a> structure.
     * @param {Pointer<UInt32>} SizePointer On input, specifies the size in bytes of the buffer pointed to by the <i>pIpNetTable</i> parameter.
     * 
     * On output, if the buffer is not large enough to hold the returned mapping table, the function sets this parameter equal to the required buffer size in bytes.
     * @param {Integer} Order A Boolean value that specifies whether the returned mapping table should be sorted in ascending order by IP address. If this parameter is <b>TRUE</b>, the table is sorted.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR or ERROR_NO_DATA.
     * 
     * If the function fails or does not return any data, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer pointed to by the <i>pIpNetTable</i> parameter is not large enough. The required size is returned in the <b>DWORD</b> variable pointed to by the <i>pdwSize</i> parameter.
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
     * An invalid parameter was passed to the function. This error is returned if the <i>pdwSize</i> parameter is <b>NULL</b>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getipnettable">GetIpNetTable</a> is unable to write to the memory pointed to by the <i>pdwSize</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is no data to return. The IPv4 to physical address mapping table is empty. This return value indicates that the call to the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getipnettable">GetIpNetTable</a> function succeeded, but there was no data to return.
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
     * The IPv4 transport is not configured on the local computer.
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-getipnettable
     * @since windows5.0
     */
    static GetIpNetTable(IpNetTable, SizePointer, Order) {
        result := DllCall("IPHLPAPI.dll\GetIpNetTable", "ptr", IpNetTable, "ptr", SizePointer, "int", Order, "uint")
        return result
    }

    /**
     * The GetIpForwardTable function retrieves the IPv4 routing table.
     * @remarks
     * The  <b>dwForwardProto</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipforwardrow">MIB_IPFORWARDROW</a> structure specifies the protocol or routing mechanism that generated the route. See 
     * <a href="https://docs.microsoft.com/windows/desktop/RRAS/protocol-identifiers">Protocol Identifiers</a> for a list of possible protocols and routing mechanisms.
     * 
     * The  <b>dwForwardDest</b>, <b>dwForwardMask</b>, and <b>dwForwardNextHop</b> members of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipforwardrow">MIB_IPFORWARDROW</a> structure represent an IPv4 address in network byte order.
     * 
     * An IPv4 address of 0.0.0.0 in the  <b>dwForwardDest</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipforwardrow">MIB_IPFORWARDROW</a> structure is considered a
     *                 default route. The <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipforwardtable">MIB_IPFORWARDTABLE</a> may contain multiple <b>MIB_IPFORWARDROW</b> entries with the <b>dwForwardDest</b> member set to 0.0.0.0 when there are multiple network adapters installed.
     * 
     * When <b>dwForwardAge</b> is set to <b>INFINITE</b>, the route will not be removed based on a timeout
     *  
     * value. Any other value for <b>dwForwardAge</b> specifies the number of seconds since the route was added or modified in the network routing table.
     * 
     * 
     * 
     * On Windows Server 2003 or
     *   Windows 2000 Server when the Routing and Remote Access Service (RRAS) is running, the  <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipforwardrow">MIB_IPFORWARDROW</a> entries returned have the <b>dwForwardType</b> and <b>dwForwardAge</b> members set to zero. 
     * 
     * On Windows Vista and Windows Server 2008, the route metric specified in the <b>dwForwardMetric1</b> member of the  <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipforwardrow">MIB_IPFORWARDROW</a> structure represents a combination of the route metric added to the interface metric specified in the <b>Metric</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipinterface_row">MIB_IPINTERFACE_ROW</a> structure of the associated interface.  So the <b>dwForwardMetric1</b> member of the  <b>MIB_IPFORWARDROW</b> structure should be equal to or greater than <b>Metric</b> member of the associated <b>MIB_IPINTERFACE_ROW</b> structure. If an application would like to set the route metric to 0 on Windows Vista and Windows Server 2008, then the <b>dwForwardMetric1</b> member of the <b>MIB_IPFORWARDROW</b> structure  should be set equal to the value of the interface metric specified in the <b>Metric</b> member of the associated <b>MIB_IPINTERFACE_ROW</b> structure. An application can retrieve the interface metric by calling the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-getipinterfaceentry">GetIpInterfaceEntry</a> function.
     * 
     * A number of members of the <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipforwardrow">MIB_IPFORWARDROW</a> structure  entries returned by <b>GetIpForwardTable</b> are not currently used by IPv4 routing. These members include <b>dwForwardPolicy</b>, <b>dwForwardNextHopAS</b>, <b>dwForwardMetric2</b>, <b>dwForwardMetric3</b>, <b>dwForwardMetric4</b>, and <b>dwForwardMetric5</b>.
     * @param {Pointer<MIB_IPFORWARDTABLE>} pIpForwardTable A pointer to a buffer that receives the IPv4 routing table as a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipforwardtable">MIB_IPFORWARDTABLE</a> structure.
     * @param {Pointer<UInt32>} pdwSize On input, specifies the size in bytes  of the buffer pointed to by the <i>pIpForwardTable</i> parameter. 
     * 
     * 
     * 
     * 
     * On output, if the buffer is not large enough to hold the returned routing table, the function sets this parameter equal to the required buffer size in bytes.
     * @param {Integer} bOrder A Boolean value that specifies whether the returned table should be sorted. If this parameter is <b>TRUE</b>, the table is sorted in the order of: 
     * 
     * 
     * <ol>
     * <li>Destination address</li>
     * <li>Protocol that generated the route</li>
     * <li>Multipath routing policy</li>
     * <li>Next-hop address</li>
     * </ol>
     * @returns {Integer} If the function succeeds, the return value is <b>NO_ERROR</b> (zero).
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer pointed to by the <i>pIpForwardTable</i> parameter is not large enough. The required size is returned in the <b>DWORD</b> variable pointed to by the <i>pdwSize</i> parameter.
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
     * The <i>pdwSize</i> parameter is <b>NULL</b>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getipforwardtable">GetIpForwardTable</a> is unable to write to the memory pointed to by the <i>pdwSize</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No data is available. This error is returned if there are no routes present on the local computer.
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
     * This function is not supported on the operating system in use on the local system. This error is returned if there is no IP stack installed on the local computer.
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-getipforwardtable
     * @since windows5.0
     */
    static GetIpForwardTable(pIpForwardTable, pdwSize, bOrder) {
        result := DllCall("IPHLPAPI.dll\GetIpForwardTable", "ptr", pIpForwardTable, "ptr", pdwSize, "int", bOrder, "uint")
        return result
    }

    /**
     * Retrieves the IPv4 TCP connection table. (GetTcpTable)
     * @remarks
     * On the Windows SDK released for Windows Vista and later, the return value from the <b>GetTcpTable</b> function is changed to a data type of <b>ULONG</b> which is equivalent to a <b>DWORD</b>.
     * @param {Pointer<MIB_TCPTABLE>} TcpTable A pointer to a buffer that receives the TCP connection table as a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tcpmib/ns-tcpmib-mib_tcptable">MIB_TCPTABLE</a> structure.
     * @param {Pointer<UInt32>} SizePointer On input, specifies the size in  bytes  of the buffer pointed to by the <i>pTcpTable</i> parameter.
     * 
     * On output, if the buffer is not large enough to hold the returned connection table, the function sets this parameter equal to the required buffer size in bytes.
     * 
     * On the Windows SDK released for Windows Vista and later, the data type for this parameter is changed to a <b>PULONG</b> which is equivalent to a <b>PDWORD</b>.
     * @param {Integer} Order A Boolean value that specifies whether the TCP connection table should be sorted. If this parameter is <b>TRUE</b>, the table is sorted in the order of: 
     * 
     * 
     * <ol>
     * <li>Local IP address</li>
     * <li>Local port</li>
     * <li>Remote IP address</li>
     * <li>Remote port</li>
     * </ol>
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer pointed to by the <i>pTcpTable</i> parameter is not large enough. The required size is returned in the <b>DWORD</b> variable pointed to by the <i>pdwSize</i> parameter.
     * 
     * This error is also returned if the <i>pTcpTable</i> parameter is <b>NULL</b>.
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
     * The <i>pdwSize</i> parameter is <b>NULL</b>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-gettcptable">GetTcpTable</a> is unable to write to the memory pointed to by the <i>pdwSize</i> parameter.
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
     * This function is not supported on the operating system in use on the local system.
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
     * If you receive this return code then calling the function again is usually enough to clear the issue and get the desired result. This return code can be a consequence of the system being under high load. For example, if the size of the TCP connection table changes by more than 2 additional items 3 consecutive times.
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-gettcptable
     * @since windows5.0
     */
    static GetTcpTable(TcpTable, SizePointer, Order) {
        result := DllCall("IPHLPAPI.dll\GetTcpTable", "ptr", TcpTable, "ptr", SizePointer, "int", Order, "uint")
        return result
    }

    /**
     * Retrieves a table that contains a list of TCP endpoints available to the application.
     * @remarks
     * The table type returned by this function depends on the specific combination of the <i>ulAf</i> parameter and the <i>TableClass</i> parameter. 
     * 
     * When the <i>ulAf</i> parameter is set to <b>AF_INET</b>, the following table indicates the TCP table type to retrieve in the structure pointed to by the <i>pTcpTable</i> parameter for each possible <i>TableClass</i> value.
     * 
     * 
     * <table>
     * <tr>
     * <th><i>TableClass</i> value</th>
     * <th><i>pTcpTable</i> structure</th>
     * </tr>
     * <tr>
     * <td><b>TCP_TABLE_BASIC_ALL</b></td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/tcpmib/ns-tcpmib-mib_tcptable">MIB_TCPTABLE</a>
     * </td>
     * </tr>
     * <tr>
     * <td><b>TCP_TABLE_BASIC_CONNECTIONS</b></td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/tcpmib/ns-tcpmib-mib_tcptable">MIB_TCPTABLE</a>
     * </td>
     * </tr>
     * <tr>
     * <td><b>TCP_TABLE_BASIC_LISTENER</b></td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/tcpmib/ns-tcpmib-mib_tcptable">MIB_TCPTABLE</a>
     * </td>
     * </tr>
     * <tr>
     * <td><b>TCP_TABLE_OWNER_MODULE_ALL</b></td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/tcpmib/ns-tcpmib-mib_tcptable_owner_module">MIB_TCPTABLE_OWNER_MODULE</a>
     * </td>
     * </tr>
     * <tr>
     * <td><b>TCP_TABLE_OWNER_MODULE_CONNECTIONS</b></td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/tcpmib/ns-tcpmib-mib_tcptable_owner_module">MIB_TCPTABLE_OWNER_MODULE</a>
     * </td>
     * </tr>
     * <tr>
     * <td><b>TCP_TABLE_OWNER_MODULE_LISTENER</b></td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/tcpmib/ns-tcpmib-mib_tcptable_owner_module">MIB_TCPTABLE_OWNER_MODULE</a>
     * </td>
     * </tr>
     * <tr>
     * <td><b>TCP_TABLE_OWNER_PID_ALL</b></td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/tcpmib/ns-tcpmib-mib_tcptable_owner_pid">MIB_TCPTABLE_OWNER_PID</a>
     * </td>
     * </tr>
     * <tr>
     * <td><b>TCP_TABLE_OWNER_PID_CONNECTIONS</b></td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/tcpmib/ns-tcpmib-mib_tcptable_owner_pid">MIB_TCPTABLE_OWNER_PID</a>
     * </td>
     * </tr>
     * <tr>
     * <td><b>TCP_TABLE_OWNER_PID_LISTENER</b></td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/tcpmib/ns-tcpmib-mib_tcptable_owner_pid">MIB_TCPTABLE_OWNER_PID</a>
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * 
     *  When the <i>ulAf</i> parameter is set to <b>AF_INET6</b>, the following table indicates the TCP table type to retrieve in the structure pointed to by the <i>pTcpTable</i> parameter for each possible <i>TableClass</i> value.
     * 
     * 
     * <table>
     * <tr>
     * <th><i>TableClass</i> value</th>
     * <th><i>pTcpTable</i> structure</th>
     * </tr>
     * <tr>
     * <td><b>TCP_TABLE_OWNER_MODULE_ALL</b></td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/tcpmib/ns-tcpmib-mib_tcp6table_owner_module">MIB_TCP6TABLE_OWNER_MODULE</a>
     * </td>
     * </tr>
     * <tr>
     * <td><b>TCP_TABLE_OWNER_MODULE_CONNECTIONS</b></td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/tcpmib/ns-tcpmib-mib_tcp6table_owner_module">MIB_TCP6TABLE_OWNER_MODULE</a>
     * </td>
     * </tr>
     * <tr>
     * <td><b>TCP_TABLE_OWNER_MODULE_LISTENER</b></td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/tcpmib/ns-tcpmib-mib_tcp6table_owner_module">MIB_TCP6TABLE_OWNER_MODULE</a>
     * </td>
     * </tr>
     * <tr>
     * <td><b>TCP_TABLE_OWNER_PID_ALL</b></td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/tcpmib/ns-tcpmib-mib_tcp6table_owner_pid">MIB_TCP6TABLE_OWNER_PID</a>
     * </td>
     * </tr>
     * <tr>
     * <td><b>TCP_TABLE_OWNER_PID_CONNECTIONS</b></td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/tcpmib/ns-tcpmib-mib_tcp6table_owner_pid">MIB_TCP6TABLE_OWNER_PID</a>
     * </td>
     * </tr>
     * <tr>
     * <td><b>TCP_TABLE_OWNER_PID_LISTENER</b></td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/tcpmib/ns-tcpmib-mib_tcp6table_owner_pid">MIB_TCP6TABLE_OWNER_PID</a>
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * 
     * The <b>GetExtendedTcpTable</b> function called with the <i>ulAf</i> parameter set to <b>AF_INET6</b> and the <i>TableClass</i> set to <b>TCP_TABLE_BASIC_LISTENER</b>, <b>TCP_TABLE_BASIC_CONNECTIONS</b>, or <b>TCP_TABLE_BASIC_ALL</b> is not supported and returns <b>ERROR_NOT_SUPPORTED</b>. 
     * 
     * On the Windows SDK released for Windows Vista and later, the organization of header files has changed. The various <a href="https://docs.microsoft.com/windows/desktop/api/tcpmib/ns-tcpmib-mib_tcptable">MIB_TCPTABLE</a> structures are defined in the <i>Tcpmib.h</i> header file, not in the <i>Iprtrmib.h</i> header file. Note that the <i>Tcpmib.h</i> header file is automatically included in <i>Iprtrmib.h</i>, which is automatically included in the <i>Iphlpapi.h</i> header file. The <i>Tcpmib.h</i> and <i>Iprtrmib.h</i> header files should never be used directly.
     * @param {Pointer<Void>} pTcpTable A pointer to the table structure that contains the filtered TCP endpoints available to the application. For information about how to determine the type of table returned based on specific input parameter combinations, see the Remarks section later in this document.
     * @param {Pointer<UInt32>} pdwSize The estimated size of the structure returned in <i>pTcpTable</i>, in bytes. If this value is set too small, <b>ERROR_INSUFFICIENT_BUFFER</b> is returned by this function, and this field will contain the correct size of the structure.
     * @param {Integer} bOrder A value that specifies whether the TCP connection table should be sorted. If this parameter is set to <b>TRUE</b>, the TCP endpoints in the table are sorted in ascending order, starting with the lowest local IP address. If this parameter is set to <b>FALSE</b>, the TCP endpoints in the table appear in the order in which they were retrieved.
     * 
     * The following values are compared (as listed) when ordering the TCP endpoints:<ol>
     * <li>Local IP address</li>
     * <li>Local scope ID (applicable when the <i>ulAf</i> parameter is set to AF_INET6)</li>
     * <li>Local TCP port</li>
     * <li>Remote IP address</li>
     * <li>Remote scope ID (applicable when the <i>ulAf</i> parameter is set to AF_INET6)</li>
     * <li>Remote TCP port</li>
     * </ol>
     * @param {Integer} ulAf The version of IP used by the TCP endpoints.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AF_INET"></a><a id="af_inet"></a><dl>
     * <dt><b>AF_INET</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * IPv4 is used.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AF_INET6"></a><a id="af_inet6"></a><dl>
     * <dt><b>AF_INET6</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * IPv6 is used.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} TableClass The type of the TCP table structure to retrieve. This parameter can be one of the values from the <a href="https://docs.microsoft.com/windows/desktop/api/iprtrmib/ne-iprtrmib-tcp_table_class">TCP_TABLE_CLASS</a> enumeration. 
     * 
     * On the Windows SDK released for Windows Vista and later, the organization of header files has changed and the <a href="https://docs.microsoft.com/windows/desktop/api/iprtrmib/ne-iprtrmib-tcp_table_class">TCP_TABLE_CLASS</a> enumeration is defined in the <i>Iprtrmib.h</i> header file, not in the <i>Iphlpapi.h</i> header file. 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/iprtrmib/ne-iprtrmib-tcp_table_class">TCP_TABLE_CLASS</a> enumeration value is combined with the value of the <i>ulAf</i> parameter to determine the extended TCP information to retrieve.
     * @param {Integer} Reserved Reserved. This value must be zero.
     * @returns {Integer} If the call is successful, the value <b>NO_ERROR</b> is returned. 
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An insufficient amount of space was allocated for the table. The size of the table is returned in the <i>pdwSize</i> parameter, and must be used in a subsequent call to this function in order to successfully retrieve the table.
     * 
     * This error is also returned if the <i>pTcpTable</i> parameter is <b>NULL</b>.
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
     * An invalid parameter was passed to the function. This error is returned if the <i>TableClass</i> parameter contains a value that is not defined in the <a href="https://docs.microsoft.com/windows/desktop/api/iprtrmib/ne-iprtrmib-tcp_table_class">TCP_TABLE_CLASS</a> enumeration.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-getextendedtcptable
     * @since windows6.0.6000
     */
    static GetExtendedTcpTable(pTcpTable, pdwSize, bOrder, ulAf, TableClass, Reserved) {
        result := DllCall("IPHLPAPI.dll\GetExtendedTcpTable", "ptr", pTcpTable, "ptr", pdwSize, "int", bOrder, "uint", ulAf, "int", TableClass, "uint", Reserved, "uint")
        return result
    }

    /**
     * Retrieves data about the module that issued the context bind for a specific IPv4 TCP endpoint in a MIB table row.
     * @remarks
     * The <i>Buffer</i> parameter contains not only a structure with pointers to specific data,  for example, pointers to the zero-terminated strings that contain the name and path of the owner module, but the actual data itself; that is the name and path strings. Therefore, when calculating the buffer size, ensure that you have enough space for both the structure as well as the data the members of the structure point to.
     * 
     * The resolution of TCP table entries to owner modules is a best practice. In a few cases, the owner module name returned in the <a href="https://docs.microsoft.com/windows/desktop/api/iprtrmib/ns-iprtrmib-tcpip_owner_module_basic_info">TCPIP_OWNER_MODULE_BASIC_INFO</a> structure can be a process name, such as "svchost.exe", a service name (such as "RPC"), or a component name, such as "timer.dll".
     * 
     * For computers running on Windows Vista or later, the <b>pModuleName</b> and <b>pModulePath</b> members of the <a href="https://docs.microsoft.com/windows/desktop/api/iprtrmib/ns-iprtrmib-tcpip_owner_module_basic_info">TCPIP_OWNER_MODULE_BASIC_INFO</a> retrieved by  <b>GetOwnerModuleFromTcpEntry</b> function may point to an empty string for some TCP connections. Applications that start TCP connections located in the Windows system folder (C:\Windows\System32, by default) are considered protected. If the <b>GetOwnerModuleFromTcpEntry</b> function is called by a user that is not a member of the Administrators group, the function call will succeed but the <b>pModuleName</b> and <b>pModulePath</b> members will point to memory that contains an empty string for the TCP connections started by protected applications. 
     * 
     * For computers running on Windows Vista or later, accessing the <b>pModuleName</b> and <b>pModulePath</b> members of the <a href="https://docs.microsoft.com/windows/desktop/api/iprtrmib/ns-iprtrmib-tcpip_owner_module_basic_info">TCPIP_OWNER_MODULE_BASIC_INFO</a> structure is limited  by user account control (UAC). If an application that calls this function is executed by a user logged on as a member of the Administrators group other than the built-in Administrator, this call will succeed but access to these members returns an empty string unless the application has been marked in the manifest file with a <b>requestedExecutionLevel</b> set to requireAdministrator. If the application on Windows Vista or later lacks this manifest file, a user logged on as a member of the Administrators group other than the built-in Administrator must then be executing the application in an enhanced shell as the built-in Administrator (RunAs administrator) for access to the protected <b>pModuleName</b> and <b>pModulePath</b> members to be allowed.
     * @param {Pointer<MIB_TCPROW_OWNER_MODULE>} pTcpEntry A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/tcpmib/ns-tcpmib-mib_tcprow_owner_module">MIB_TCPROW_OWNER_MODULE</a> structure that contains the IPv4 TCP endpoint entry used to obtain the owner module.
     * @param {Integer} Class A <a href="https://docs.microsoft.com/windows/desktop/api/iprtrmib/ne-iprtrmib-tcpip_owner_module_info_class">TCPIP_OWNER_MODULE_INFO_CLASS</a> enumeration value that indicates the type of data to obtain regarding the owner module. The <b>TCPIP_OWNER_MODULE_INFO_CLASS</b> enumeration is defined in the <i>Iprtrmib.h</i> header file.
     * 
     *  This parameter must be set to <b>TCPIP_OWNER_MODULE_INFO_BASIC</b>.
     * @param {Pointer<Void>} pBuffer A pointer a buffer that contains a <a href="https://docs.microsoft.com/windows/desktop/api/iprtrmib/ns-iprtrmib-tcpip_owner_module_basic_info">TCPIP_OWNER_MODULE_BASIC_INFO</a> structure with the owner module data. The type of data returned in this buffer is indicated by the value of the <i>Class</i> parameter. 
     * 
     * The following structures are used for the data in <i>Buffer</i> when  <i>Class</i> is set to the corresponding value.
     * 
     * <table>
     * <tr>
     * <th><i>Class</i> enumeration value</th>
     * <th><i>Buffer</i> data format</th>
     * </tr>
     * <tr>
     * <td>TCPIP_OWNER_MODULE_BASIC_INFO</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/iprtrmib/ns-iprtrmib-tcpip_owner_module_basic_info">TCPIP_OWNER_MODULE_BASIC_INFO</a>
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<UInt32>} pdwSize The estimated size, in  bytes, of the structure returned in <i>Buffer</i>. If this value is set too small, <b>ERROR_INSUFFICIENT_BUFFER</b> is returned by this function, and this field will contain the correct size of the buffer. The size required is the size of the corresponding structure plus an additional number of bytes equal to the length of data pointed to in the structure (for example, the name and path strings).
     * @returns {Integer} If the function call is successful, the value <b>NO_ERROR</b> is returned. 
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient space was allocated for the table. The size of the table is returned in the <i>pdwSize</i> parameter, and must be used in a subsequent call to this function in order to successfully retrieve the table.
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
     * A parameter is incorrect. This value is returned if either of the <i>pTcpEntry</i> or <i>pdwSize</i> parameters are <b>NULL</b>. This value is also returned if the <i>Class</i> parameter is not equal to <b>TCPIP_OWNER_MODULE_INFO_BASIC</b>. 
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
     * Not enough memory is available to complete the operation.
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
     * A element was no found. This value is returned if the <b>dwOwningPid</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/tcpmib/ns-tcpmib-mib_tcprow_owner_module">MIB_TCPROW_OWNER_MODULE</a> structure pointed to by the <i>pTcpEntry</i> parameter was zero or could not be found. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_PARTIAL_COPY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Only part of a request was completed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-getownermodulefromtcpentry
     * @since windows6.0.6000
     */
    static GetOwnerModuleFromTcpEntry(pTcpEntry, Class, pBuffer, pdwSize) {
        result := DllCall("IPHLPAPI.dll\GetOwnerModuleFromTcpEntry", "ptr", pTcpEntry, "int", Class, "ptr", pBuffer, "ptr", pdwSize, "uint")
        return result
    }

    /**
     * Retrieves the IPv4 User Datagram Protocol (UDP) listener table.
     * @remarks
     * On the Windows SDK released for Windows Vista and later, the return value from the <b>GetUdpTable</b> function is changed to a data type of <b>ULONG</b> which is equivalent to a <b>DWORD</b>.
     * @param {Pointer<MIB_UDPTABLE>} UdpTable A pointer to a buffer that receives the IPv4 UDP listener table as a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/udpmib/ns-udpmib-mib_udptable">MIB_UDPTABLE</a> structure.
     * @param {Pointer<UInt32>} SizePointer On input, specifies the size in bytes of the buffer pointed to by the <i>UdpTable</i> parameter. 
     * 
     * 
     * 
     * 
     * On output, if the buffer is not large enough to hold the returned listener table, the function sets this parameter equal to the required buffer size in bytes.
     * 
     * On the Windows SDK released for Windows Vista and later, the data type for this parameter is changed to a <b>PULONG</b> which is equivalent to a <b>PDWORD</b>.
     * @param {Integer} Order A Boolean value that specifies whether the returned UDP listener table should be sorted. If this parameter is <b>TRUE</b>, the table is sorted in the order of: 
     * 
     * 
     * <ol>
     * <li>Local IP address</li>
     * <li>Local port</li>
     * </ol>
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer pointed to by the <i>pUdpTable</i> parameter is not large enough. The required size is returned in the <b>ULONG</b> variable pointed to by the <i>pdwSize</i> parameter.
     * 
     * This error is also returned if the <i>pUdpTable</i> parameter is <b>NULL</b>.
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
     * The <i>pdwSize</i> parameter is <b>NULL</b>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getudptable">GetUdpTable</a> is unable to write to the memory pointed to by the <i>pdwSize</i> parameter.
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
     * This function is not supported on the operating system in use on the local system.
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-getudptable
     * @since windows5.0
     */
    static GetUdpTable(UdpTable, SizePointer, Order) {
        result := DllCall("IPHLPAPI.dll\GetUdpTable", "ptr", UdpTable, "ptr", SizePointer, "int", Order, "uint")
        return result
    }

    /**
     * Retrieves a table that contains a list of UDP endpoints available to the application.
     * @remarks
     * The table type returned by this function depends on the specific combination of the <i>ulAf</i> parameter and the <i>TableClass</i> parameter. 
     * 
     * When the <i>ulAf</i> parameter is set to <b>AF_INET</b>, the following table indicates the UDP table type to retrieve in the structure pointed to by the <i>pUdpTable</i> parameter for each possible <i>TableClass</i> value.
     * 
     * 
     * <table>
     * <tr>
     * <th><i>TableClass</i> value</th>
     * <th><i>pUdpTable</i> structure</th>
     * </tr>
     * <tr>
     * <td><b>UDP_TABLE_BASIC</b></td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/udpmib/ns-udpmib-mib_udptable">MIB_UDPTABLE</a>
     * </td>
     * </tr>
     * <tr>
     * <td><b>UDP_TABLE_OWNER_MODULE</b></td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/udpmib/ns-udpmib-mib_udptable_owner_module">MIB_UDPTABLE_OWNER_MODULE</a>
     * </td>
     * </tr>
     * <tr>
     * <td><b>UDP_TABLE_OWNER_PID</b></td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/udpmib/ns-udpmib-mib_udptable_owner_pid">MIB_UDPTABLE_OWNER_PID</a>
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * 
     *  When the <i>ulAf</i> parameter is set to <b>AF_INET6</b>, the following table indicates the TCP table type to retrieve in the structure pointed to by the <i>pUdpTable</i> parameter for each possible <i>TableClass</i> value.
     * 
     * 
     * <table>
     * <tr>
     * <th><i>TableClass</i> value</th>
     * <th><i>pUdpTable</i> structure</th>
     * </tr>
     * <tr>
     * <td><b>UDP_TABLE_BASIC</b></td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/udpmib/ns-udpmib-mib_udp6table">MIB_UDP6TABLE</a>
     * </td>
     * </tr>
     * <tr>
     * <td><b>UDP_TABLE_OWNER_MODULE</b></td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/udpmib/ns-udpmib-mib_udp6table_owner_module">MIB_UDP6TABLE_OWNER_MODULE</a>
     * </td>
     * </tr>
     * <tr>
     * <td><b>UDP_TABLE_OWNER_PID</b></td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/udpmib/ns-udpmib-mib_udp6table_owner_pid">MIB_UDP6TABLE_OWNER_PID</a>
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * 
     * The <b>GetExtendedUdpTable</b> function when called with the <i>ulAf</i> parameter set to <b>AF_INET6</b> and the <i>TableClass</i> set to <b>UDP_TABLE_BASIC</b> is only supported on  Windows Vista and later. 
     * 
     * On Windows Server 2003 with Service Pack 1 (SP1) and Windows XP with Service Pack 2 (SP2), the <b>GetExtendedUdpTable</b> function called with the <i>ulAf</i> parameter set to <b>AF_INET6</b> and the <i>TableClass</i> set to <b>UDP_TABLE_BASIC</b> fails and returns <b>ERROR_NOT_SUPPORTED</b>.
     * 
     * On the Windows SDK released for Windows Vista and later, the organization of header files has changed. The various <a href="https://docs.microsoft.com/windows/desktop/api/udpmib/ns-udpmib-mib_udptable">MIB_UDPTABLE</a>  structures are defined in the <i>Udpmib.h</i> header file, not in the <i>Iprtrmib.h</i> header file. Note that the <i>Udpmib.h</i> header file is automatically included in <i>Iprtrmib.h</i>, which is automatically included in the <i>Iphlpapi.h</i> header file. The  <i>Udpmib.h</i> and <i>Iprtrmib.h</i> header files should never be used directly.
     * @param {Pointer<Void>} pUdpTable A pointer to the table structure that contains the filtered UDP endpoints available to the application.   For information about how to determine the type of table returned based on specific input parameter combinations, see the Remarks section later in this document.
     * @param {Pointer<UInt32>} pdwSize The estimated size of the structure returned in <i>pUdpTable</i>, in bytes. If this value is set too small, <b>ERROR_INSUFFICIENT_BUFFER</b> is returned by this function, and this field will contain the correct size of the structure.
     * @param {Integer} bOrder A value that specifies whether the UDP endpoint table should be sorted. If this parameter is set to <b>TRUE</b>, the UDP endpoints in the table are sorted in ascending order, starting with the lowest local IP address. If this parameter is set to <b>FALSE</b>, the UDP endpoints in the table appear in the order in which they were retrieved.
     * 
     * The following values are compared as listed when ordering the UDP endpoints: <ol>
     * <li>Local IP address</li>
     * <li>Local scope ID (applicable when the <i>ulAf</i> parameter is set to AF_INET6)</li>
     * <li>Local UDP port</li>
     * </ol>
     * @param {Integer} ulAf The version of IP used by the UDP endpoint.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AF_INET"></a><a id="af_inet"></a><dl>
     * <dt><b>AF_INET</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * IPv4 is used.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AF_INET6"></a><a id="af_inet6"></a><dl>
     * <dt><b>AF_INET6</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * IPv6 is used.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} TableClass The type of the UDP table structure to retrieve.  This parameter can be one of the values from the <a href="https://docs.microsoft.com/windows/desktop/api/iprtrmib/ne-iprtrmib-udp_table_class">UDP_TABLE_CLASS</a> enumeration. 
     * 
     * On the Windows SDK released for Windows Vista and later, the organization of header files has changed and the <a href="https://docs.microsoft.com/windows/desktop/api/iprtrmib/ne-iprtrmib-udp_table_class">UDP_TABLE_CLASS</a> enumeration  is defined in the <i>Iprtrmib.h</i> header file, not in the <i>Iphlpapi.h</i> header file.
     * 
     *  The <a href="https://docs.microsoft.com/windows/desktop/api/iprtrmib/ne-iprtrmib-udp_table_class">UDP_TABLE_CLASS</a> enumeration value is combined with the value of the <i>ulAf</i> parameter to determine the extended UDP information to retrieve.
     * @param {Integer} Reserved Reserved. This value must be zero.
     * @returns {Integer} If the call is successful, the value <b>NO_ERROR</b> is returned. 
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An insufficient amount of space was allocated for the table. The size of the table is returned in the <i>pdwSize</i> parameter, and must be used in a subsequent call to this function in order to successfully retrieve the table.
     * 
     * This error is also returned if the <i>pUdpTable</i> parameter is <b>NULL</b>.
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
     * An invalid parameter was passed to the function. This error is returned if the <i>TableClass</i> parameter contains a value that is not defined in the  <a href="https://docs.microsoft.com/windows/desktop/api/iprtrmib/ne-iprtrmib-udp_table_class">UDP_TABLE_CLASS</a> enumeration.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-getextendedudptable
     * @since windows6.0.6000
     */
    static GetExtendedUdpTable(pUdpTable, pdwSize, bOrder, ulAf, TableClass, Reserved) {
        result := DllCall("IPHLPAPI.dll\GetExtendedUdpTable", "ptr", pUdpTable, "ptr", pdwSize, "int", bOrder, "uint", ulAf, "int", TableClass, "uint", Reserved, "uint")
        return result
    }

    /**
     * Retrieves data about the module that issued the context bind for a specific IPv4 UDP endpoint in a MIB table row.
     * @remarks
     * The <i>Buffer</i> parameter contains not only a structure with pointers to specific data, for example, pointers to the zero-terminated strings that contain the name and path of the owner module, but also the actual data itself; that is the name and path strings. Therefore, when calculating the buffer size, ensure that you have enough space for both the structure as well as the data the members of the structure point to.
     * 
     * The resolution of UDP table entries to owner modules is a best practice. In a few cases, the owner module name returned in the <a href="https://docs.microsoft.com/windows/desktop/api/iprtrmib/ns-iprtrmib-tcpip_owner_module_basic_info">TCPIP_OWNER_MODULE_BASIC_INFO</a> structure can be a process name, such as "svchost.exe", a service name, such as "RPC", or a component name, such as "timer.dll".
     * 
     * For computers running on Windows Vista or later, accessing the <b>pModuleName</b> and <b>pModulePath</b> members of the <a href="https://docs.microsoft.com/windows/desktop/api/iprtrmib/ns-iprtrmib-tcpip_owner_module_basic_info">TCPIP_OWNER_MODULE_BASIC_INFO</a> structure is limited  by user account control (UAC). If an application that calls this function is executed by a user logged on as a member of the Administrators group other than the built-in Administrator, this call will succeed but access to these members returns an empty string unless the application has been marked in the manifest file with a <b>requestedExecutionLevel</b> set to requireAdministrator. If the application on Windows Vista or later lacks this manifest file, a user logged on as a member of the Administrators group other than the built-in Administrator must then be executing the application in an enhanced shell as the built-in Administrator (RunAs administrator) for access to the protected <b>pModuleName</b> and <b>pModulePath</b> members to be allowed.
     * @param {Pointer<MIB_UDPROW_OWNER_MODULE>} pUdpEntry A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/udpmib/ns-udpmib-mib_udprow_owner_module">MIB_UDPROW_OWNER_MODULE</a> structure that contains the IPv4 UDP endpoint entry used to obtain the owner module.
     * @param {Integer} Class A <a href="https://docs.microsoft.com/windows/desktop/api/iprtrmib/ne-iprtrmib-tcpip_owner_module_info_class">TCPIP_OWNER_MODULE_INFO_CLASS</a> enumeration value that indicates the type of data to obtain regarding the owner module.
     * @param {Pointer<Void>} pBuffer The buffer that contains a <a href="https://docs.microsoft.com/windows/desktop/api/iprtrmib/ns-iprtrmib-tcpip_owner_module_basic_info">TCPIP_OWNER_MODULE_BASIC_INFO</a> structure with the owner module data. The type of data returned in this buffer is indicated by the value of the <i>Class</i> parameter.
     * 
     * The following structures are used for the data in <i>Buffer</i> when  <i>Class</i> is set to the corresponding value.
     * 
     * <table>
     * <tr>
     * <th><i>Class</i> enumeration value</th>
     * <th><i>Buffer</i> data format</th>
     * </tr>
     * <tr>
     * <td>TCPIP_OWNER_MODULE_BASIC_INFO</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/iprtrmib/ns-iprtrmib-tcpip_owner_module_basic_info">TCPIP_OWNER_MODULE_BASIC_INFO</a>
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<UInt32>} pdwSize The estimated size, in bytes, of the structure returned in <i>Buffer</i>. If this value is set too small, <b>ERROR_INSUFFICIENT_BUFFER</b> is returned by this function, and this field will contain the correct structure size.
     * @returns {Integer} If the call is successful, the value <b>NO_ERROR</b> is returned. Otherwise, the following error is returned.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient space was allocated for the table. The size of the table is returned in the <i>pdwSize</i> parameter, and must be used in a subsequent call to this function in order to successfully retrieve the table.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-getownermodulefromudpentry
     * @since windows6.0.6000
     */
    static GetOwnerModuleFromUdpEntry(pUdpEntry, Class, pBuffer, pdwSize) {
        result := DllCall("IPHLPAPI.dll\GetOwnerModuleFromUdpEntry", "ptr", pUdpEntry, "int", Class, "ptr", pBuffer, "ptr", pdwSize, "uint")
        return result
    }

    /**
     * Retrieves the IPv4 TCP connection table. (GetTcpTable2)
     * @remarks
     * The <b>GetTcpTable2</b> function is defined on Windows Vista and later. 
     * 
     * The <b>GetTcpTable2</b> function is an enhanced version of the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-gettcptable">GetTcpTable</a> function that also retrieves information on the TCP offload state of the TCP connection.
     * @param {Pointer<MIB_TCPTABLE2>} TcpTable A pointer to a buffer that receives the TCP connection table as a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tcpmib/ns-tcpmib-mib_tcptable2">MIB_TCPTABLE2</a> structure.
     * @param {Pointer<UInt32>} SizePointer On input, specifies the size of the buffer pointed to by the <i>TcpTable</i> parameter. 
     * 
     * 
     * 
     * 
     * On output, if the buffer is not large enough to hold the returned connection table, the function sets this parameter equal to the required buffer size.
     * @param {Integer} Order A value that specifies whether the TCP connection table should be sorted. If this parameter is <b>TRUE</b>, the table is sorted in the order of: 
     * 
     * 
     * 
     * 
     * <ol>
     * <li>Local IP address</li>
     * <li>Local port</li>
     * <li>Remote IP address</li>
     * <li>Remote port</li>
     * </ol>
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer pointed to by the <i>TcpTable</i> parameter is not large enough. The required size is returned in the <b>PULONG</b> variable pointed to by the <i>SizePointer</i> parameter.
     * 
     * This error is also returned if the <i>pTcpTable</i> parameter is <b>NULL</b>.
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
     * The <i>SizePointer</i> parameter is <b>NULL</b>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-gettcptable2">GetTcpTable2</a> is unable to write to the memory pointed to by the <i>SizePointer</i> parameter.
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
     * This function is not supported on the operating system in use on the local system.
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-gettcptable2
     * @since windows6.0.6000
     */
    static GetTcpTable2(TcpTable, SizePointer, Order) {
        result := DllCall("IPHLPAPI.dll\GetTcpTable2", "ptr", TcpTable, "ptr", SizePointer, "int", Order, "uint")
        return result
    }

    /**
     * Retrieves the TCP connection table for IPv6. (GetTcp6Table)
     * @remarks
     * The <b>GetTcp6Table</b> function is defined on Windows Vista and later.
     * @param {Pointer<MIB_TCP6TABLE>} TcpTable A pointer to a buffer that receives the TCP connection table for IPv6 as a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tcpmib/ns-tcpmib-mib_tcp6table">MIB_TCP6TABLE</a> structure.
     * @param {Pointer<UInt32>} SizePointer On input, specifies the size in bytes of the buffer pointed to by the <i>TcpTable</i> parameter.
     * 
     * On output, if the buffer is not large enough to hold the returned TCP connection table, the function sets this parameter equal to the required buffer size in bytes.
     * @param {Integer} Order A Boolean value that specifies whether the TCP connection table should be sorted. If this parameter is <b>TRUE</b>, the table is sorted in ascending order, starting with the lowest local IP address.  If this parameter is <b>FALSE</b>, the table appears in the order in which they were retrieved.
     * 
     * The following values are compared (as listed) when ordering the TCP endpoints:
     * 
     * 
     * <ol>
     * <li>Local IPv6 address</li>
     * <li>Local scope ID</li>
     * <li>Local port</li>
     * <li>Remote IPv6 address</li>
     * <li>Remote scope ID</li>
     * <li>Remote port</li>
     * </ol>
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer pointed to by the <i>TcpTable</i> parameter is not large enough. The required size is returned in the variable pointed to by the <i>SizePointer</i> parameter.
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
     * The <i>SizePointer</i> parameter is <b>NULL</b>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-gettcp6table">GetTcp6Table</a> is unable to write to the memory pointed to by the <i>SizePointer</i> parameter.
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
     * This function is not supported on the operating system in use on the local system.
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-gettcp6table
     * @since windows6.0.6000
     */
    static GetTcp6Table(TcpTable, SizePointer, Order) {
        result := DllCall("IPHLPAPI.dll\GetTcp6Table", "ptr", TcpTable, "ptr", SizePointer, "int", Order, "uint")
        return result
    }

    /**
     * Retrieves the TCP connection table for IPv6. (GetTcp6Table2)
     * @remarks
     * The <b>GetTcp6Table2</b> function is defined on Windows Vista and later. 
     * 
     * The <b>GetTcp6Table2</b> function is an enhanced version of the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-gettcp6table">GetTcp6Table</a> function that also retrieves information on the TCP offload state of the TCP connection.
     * @param {Pointer<MIB_TCP6TABLE2>} TcpTable A pointer to a buffer that receives the TCP connection table for IPv6 as a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tcpmib/ns-tcpmib-mib_tcp6table2">MIB_TCP6TABLE2</a> structure.
     * @param {Pointer<UInt32>} SizePointer On input, specifies the size of the buffer pointed to by the <i>TcpTable</i> parameter. 
     * 
     * 
     * 
     * 
     * On output, if the buffer is not large enough to hold the returned TCP connection table, the function sets this parameter equal to the required buffer size.
     * @param {Integer} Order A value that specifies whether the TCP connection table should be sorted. If this parameter is <b>TRUE</b>, the table is sorted in ascending order, starting with the lowest local IP address.  If this parameter is <b>FALSE</b>, the table appears in the order in which they were retrieved.
     * 
     * The following values are compared (as listed) when ordering the TCP endpoints:
     * 
     * <ol>
     * <li>Local IPv6 address</li>
     * <li>Local scope ID</li>
     * <li>Local port</li>
     * <li>Remote IPv6 address</li>
     * <li>Remote scope ID</li>
     * <li>Remote port</li>
     * </ol>
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer pointed to by the <i>TcpTable</i> parameter is not large enough. The required size is returned in the variable pointed to by the <i>SizePointer</i> parameter.
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
     * The <i>SizePointer</i> parameter is <b>NULL</b>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-gettcp6table2">GetTcp6Table2</a> is unable to write to the memory pointed to by the <i>SizePointer</i> parameter.
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
     * This function is not supported on the operating system in use on the local system.
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-gettcp6table2
     * @since windows6.0.6000
     */
    static GetTcp6Table2(TcpTable, SizePointer, Order) {
        result := DllCall("IPHLPAPI.dll\GetTcp6Table2", "ptr", TcpTable, "ptr", SizePointer, "int", Order, "uint")
        return result
    }

    /**
     * Retrieves extended statistics for an IPv4 TCP connection.
     * @remarks
     * The <b>GetPerTcpConnectionEStats</b> function is defined on Windows Vista and later. 
     * 
     * The <b>GetPerTcpConnectionEStats</b> function is designed to use TCP to diagnose performance
     *    problems in both the network and the application.  If a network based
     *    application is performing poorly, TCP can determine if the bottleneck
     *    is in the sender, the receiver or the network itself.  If the
     *    bottleneck is in the network, TCP can provide specific information
     *    about its nature.
     * 
     * 
     * The <b>GetPerTcpConnectionEStats</b> function retrieves extended statistics for the IPv4 TCP connection passed in the <i>Row</i> parameter. The type of extended statistics that is retrieved is specified in the <i>EstatsType</i> parameter. Extended statistics on this TCP connection must have previously been enabled by calls to the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-setpertcpconnectionestats">SetPerTcpConnectionEStats</a> function for all <a href="https://docs.microsoft.com/windows/desktop/api/tcpestats/ne-tcpestats-tcp_estats_type">TCP_ESTATS_TYPE</a> values except when <b>TcpConnectionEstatsSynOpts</b> is passed in the <i>EstatsType</i> parameter.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-gettcptable">GetTcpTable</a> function is used to retrieve the IPv4 TCP connection table on the local computer. This function returns a <a href="https://docs.microsoft.com/windows/desktop/api/tcpmib/ns-tcpmib-mib_tcptable">MIB_TCPTABLE</a> structure that contain an array of <a href="https://docs.microsoft.com/windows/desktop/api/tcpmib/ns-tcpmib-mib_tcprow_lh">MIB_TCPROW</a> entries. The <i>Row</i> parameter passed to the <b>GetPerTcpConnectionEStats</b> function must be an entry for an existing IPv4 TCP connection.
     * 
     * The only version of TCP connection statistics currently supported is version zero. So the <i>RwVersion</i>, <i>RosVersion</i>, and <i>RodVersion</i> parameters passed to <b>GetPerTcpConnectionEStats</b> should be set to 0.
     * 
     * For information on extended TCP statistics on an IPv6 connection, see the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getpertcp6connectionestats">GetPerTcp6ConnectionEStats</a> and <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-setpertcp6connectionestats">SetPerTcp6ConnectionEStats</a> functions.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-setpertcpconnectionestats">SetPerTcpConnectionEStats</a> function can only be called by a user logged on as a member of the Administrators group. If <b>SetPerTcpConnectionEStats</b> is called by a user that is not a member of the Administrators group, the function call will fail and <b>ERROR_ACCESS_DENIED</b> is returned. This function can also fail because of user account control (UAC) on Windows Vista and later. If an application that contains this function is executed by a user logged on as a member of the Administrators group other than the built-in Administrator, this call will fail unless the application has been marked in the manifest file with a <b>requestedExecutionLevel</b> set to requireAdministrator. If the application lacks this manifest file, a user logged on as a member of the Administrators group other than the built-in Administrator must then be executing the application in an enhanced shell as the built-in Administrator (RunAs administrator) for this function to succeed.
     * 
     * The caller of **GetPerTcpConnectionEStats** should check the *EnableCollection* field in the returned *Rw* struct, and if it is not `TRUE`, then the caller should ignore the data in the *Ros* and *Rod* structs. If *EnableCollection* is set to `FALSE`, then the data returned in *Ros* and *Rod* are undefined. For example, one condition under which this can happen is when you're using **GetPerTcpConnectionEStats** to retrieve extended statistics for an IPv4 TCP connection, and you've previously called [SetPerTcpConnectionEStats](./nf-iphlpapi-setpertcpconnectionestats.md) to enable extended statistics. If the **SetPerTcpConnectionEStats** call fails then subsequent calls to **GetPerTcpConnectionEStats** will return meaningless random data, and not extended TCP statistics. You can observe that example by running the example below as both an administrator, and as a normal user.
     * @param {Pointer<MIB_TCPROW_LH>} Row A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/tcpmib/ns-tcpmib-mib_tcprow_lh">MIB_TCPROW</a> structure for an IPv4 TCP connection.
     * @param {Integer} EstatsType The type of extended statistics for TCP requested. This parameter determines the data and format of information that is returned in the <i>Rw</i>, <i>Rod</i>, and <i>Ros</i> parameters if the call is successful.
     * 
     * This parameter can be one of the values from the <a href="https://docs.microsoft.com/windows/desktop/api/tcpestats/ne-tcpestats-tcp_estats_type">TCP_ESTATS_TYPE</a> enumeration type defined in the <i>Tcpestats.h</i> header file. 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TcpConnectionEstatsSynOpts"></a><a id="tcpconnectionestatssynopts"></a><a id="TCPCONNECTIONESTATSSYNOPTS"></a><dl>
     * <dt><b>TcpConnectionEstatsSynOpts</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This value requests SYN exchange information for a TCP connection.
     * 
     * Only read-only static information is available for this enumeration value.
     * 
     * If the <i>Ros</i> parameter was not <b>NULL</b> and the function succeeds, the buffer pointed to by the <i>Ros</i> parameter should contain a <a href="https://docs.microsoft.com/windows/desktop/api/tcpestats/ns-tcpestats-tcp_estats_syn_opts_ros_v0">TCP_ESTATS_SYN_OPTS_ROS_v0</a> structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TcpConnectionEstatsData"></a><a id="tcpconnectionestatsdata"></a><a id="TCPCONNECTIONESTATSDATA"></a><dl>
     * <dt><b>TcpConnectionEstatsData</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This value requests extended data transfer information for a TCP connection. 
     * 
     * Only read-only dynamic information and read/write information are available for this enumeration value.
     * 
     * If the <i>Rw</i> parameter was not <b>NULL</b> and the function succeeds, the buffer pointed to by the <i>Rw</i> parameter should contain a <a href="https://docs.microsoft.com/windows/desktop/api/tcpestats/ns-tcpestats-tcp_estats_data_rw_v0">TCP_ESTATS_DATA_RW_v0</a> structure. 
     * 
     * If extended data transfer information was enabled  for this TCP connection, the <i>Rod</i> parameter was not <b>NULL</b>, and the function succeeds, the buffer pointed to by the <i>Rod</i> parameter should contain a <a href="https://docs.microsoft.com/windows/desktop/api/tcpestats/ns-tcpestats-tcp_estats_data_rod_v0">TCP_ESTATS_DATA_ROD_v0</a> structure. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TcpConnectionEstatsSndCong"></a><a id="tcpconnectionestatssndcong"></a><a id="TCPCONNECTIONESTATSSNDCONG"></a><dl>
     * <dt><b>TcpConnectionEstatsSndCong</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This value requests sender congestion for a TCP connection. 
     * 
     * All three types of information (read-only static, read-only dynamic,  and read/write information) are available for this enumeration value.
     * 
     * If the <i>Rw</i> parameter was not <b>NULL</b> and the function succeeds, the buffer pointed to by the <i>Rw</i> parameter should contain a <a href="https://docs.microsoft.com/windows/desktop/api/tcpestats/ns-tcpestats-tcp_estats_snd_cong_rw_v0">TCP_ESTATS_SND_CONG_RW_v0</a> structure. 
     * 
     * If the <i>Ros</i> parameter was not <b>NULL</b> and the function succeeds, the buffer pointed to by the <i>Ros</i> parameter should contain a <a href="https://docs.microsoft.com/windows/desktop/api/tcpestats/ns-tcpestats-tcp_estats_snd_cong_ros_v0">TCP_ESTATS_SND_CONG_ROS_v0</a> structure.
     * 
     * If sender congestion information was enabled  for this TCP connection, the <i>Rod</i> parameter was not <b>NULL</b>, and the function succeeds, the buffer pointed to by the <i>Rod</i> parameter should contain a <a href="https://docs.microsoft.com/windows/desktop/api/tcpestats/ns-tcpestats-tcp_estats_snd_cong_rod_v0">TCP_ESTATS_SND_CONG_ROD_v0</a> structure. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TcpConnectionEstatsPath"></a><a id="tcpconnectionestatspath"></a><a id="TCPCONNECTIONESTATSPATH"></a><dl>
     * <dt><b>TcpConnectionEstatsPath</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This value requests extended path measurement information for a TCP connection.
     * 
     * Only read-only dynamic information and read/write information are available for this enumeration value.
     * 
     * If the <i>Rw</i> parameter was not <b>NULL</b> and the function succeeds, the buffer pointed to by the <i>Rw</i> parameter should contain a <a href="https://docs.microsoft.com/windows/desktop/api/tcpestats/ns-tcpestats-tcp_estats_path_rw_v0">TCP_ESTATS_PATH_RW_v0</a> structure. 
     * 
     * If extended path measurement information was enabled  for this TCP connection, the <i>Rod</i> parameter was not <b>NULL</b>, and the function succeeds, the buffer pointed to by the <i>Rod</i> parameter should contain a <a href="https://docs.microsoft.com/windows/desktop/api/tcpestats/ns-tcpestats-tcp_estats_path_rod_v0">TCP_ESTATS_PATH_ROD_v0</a> structure. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TcpConnectionEstatsSendBuff"></a><a id="tcpconnectionestatssendbuff"></a><a id="TCPCONNECTIONESTATSSENDBUFF"></a><dl>
     * <dt><b>TcpConnectionEstatsSendBuff</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This value requests extended output-queuing information for a TCP connection.
     * 
     * Only read-only dynamic information and read/write information are available for this enumeration value.
     * 
     * If the <i>Rw</i> parameter was not <b>NULL</b> and the function succeeds, the buffer pointed to by the <i>Rw</i> parameter should contain a <a href="https://docs.microsoft.com/windows/desktop/api/tcpestats/ns-tcpestats-tcp_estats_send_buff_rw_v0">TCP_ESTATS_SEND_BUFF_RW_v0</a> structure. 
     * 
     * If extended output-queuing information was enabled  for this TCP connection, the <i>Rod</i> parameter was not <b>NULL</b>, and the function succeeds, the buffer pointed to by the <i>Rod</i> parameter should contain a <a href="https://docs.microsoft.com/windows/desktop/api/tcpestats/ns-tcpestats-tcp_estats_send_buff_rod_v0">TCP_ESTATS_SEND_BUFF_ROD_v0</a> structure. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TcpConnectionEstatsRec"></a><a id="tcpconnectionestatsrec"></a><a id="TCPCONNECTIONESTATSREC"></a><dl>
     * <dt><b>TcpConnectionEstatsRec</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This value requests extended local-receiver information for a TCP connection.
     * 
     * Only read-only dynamic information and read/write information are available for this enumeration value.
     * 
     * If the <i>Rw</i> parameter was not <b>NULL</b> and the function succeeds, the buffer pointed to by the <i>Rw</i> parameter should contain a <a href="https://docs.microsoft.com/windows/desktop/api/tcpestats/ns-tcpestats-tcp_estats_rec_rw_v0">TCP_ESTATS_REC_RW_v0</a> structure. 
     * 
     * If extended local-receiver information was enabled  for this TCP connection, the <i>Rod</i> parameter was not <b>NULL</b>, and the function succeeds, the buffer pointed to by the <i>Rod</i> parameter should contain a <a href="https://docs.microsoft.com/windows/desktop/api/tcpestats/ns-tcpestats-tcp_estats_rec_rod_v0">TCP_ESTATS_REC_ROD_v0</a> structure. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TcpConnectionEstatsObsRec"></a><a id="tcpconnectionestatsobsrec"></a><a id="TCPCONNECTIONESTATSOBSREC"></a><dl>
     * <dt><b>TcpConnectionEstatsObsRec</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This value requests extended remote-receiver information for a TCP connection.
     * 
     * Only read-only dynamic information and read/write information are available for this enumeration value.
     * 
     * If the <i>Rw</i> parameter was not <b>NULL</b> and the function succeeds, the buffer pointed to by the <i>Rw</i> parameter should contain a <a href="https://docs.microsoft.com/windows/desktop/api/tcpestats/ns-tcpestats-tcp_estats_obs_rec_rw_v0">TCP_ESTATS_OBS_REC_RW_v0</a> structure. 
     * 
     * If extended remote-receiver information was enabled  for this TCP connection, the <i>Rod</i> parameter was not <b>NULL</b>, and the function succeeds, the buffer pointed to by the <i>Rod</i> parameter should contain a <a href="https://docs.microsoft.com/windows/desktop/api/tcpestats/ns-tcpestats-tcp_estats_obs_rec_rod_v0">TCP_ESTATS_OBS_REC_ROD_v0</a> structure. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TcpConnectionEstatsBandwidth"></a><a id="tcpconnectionestatsbandwidth"></a><a id="TCPCONNECTIONESTATSBANDWIDTH"></a><dl>
     * <dt><b>TcpConnectionEstatsBandwidth</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This value requests bandwidth estimation statistics for a TCP connection on bandwidth.
     * 
     * Only read-only dynamic information and read/write information are available for this enumeration value.
     * 
     * If the <i>Rw</i> parameter was not <b>NULL</b> and the function succeeds, the buffer pointed to by the <i>Rw</i> parameter should contain a <a href="https://docs.microsoft.com/windows/desktop/api/tcpestats/ns-tcpestats-tcp_estats_bandwidth_rw_v0">TCP_ESTATS_BANDWIDTH_RW_v0</a> structure. 
     * 
     * If bandwidth estimation statistics was enabled  for this TCP connection, the <i>Rod</i> parameter was not <b>NULL</b>, and the function succeeds, the buffer pointed to by the <i>Rod</i> parameter should contain a <a href="https://docs.microsoft.com/windows/desktop/api/tcpestats/ns-tcpestats-tcp_estats_bandwidth_rod_v0">TCP_ESTATS_BANDWIDTH_ROD_v0</a> structure. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TcpConnectionEstatsFineRtt"></a><a id="tcpconnectionestatsfinertt"></a><a id="TCPCONNECTIONESTATSFINERTT"></a><dl>
     * <dt><b>TcpConnectionEstatsFineRtt</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This value requests fine-grained round-trip time (RTT) estimation statistics for a TCP connection.
     * 
     * Only read-only dynamic information and read/write information are available for this enumeration value.
     * 
     * If the <i>Rw</i> parameter was not <b>NULL</b> and the function succeeds, the buffer pointed to by the <i>Rw</i> parameter should contain a <a href="https://docs.microsoft.com/windows/desktop/api/tcpestats/ns-tcpestats-tcp_estats_fine_rtt_rw_v0">TCP_ESTATS_FINE_RTT_RW_v0</a> structure. 
     * 
     * If fine-grained RTT estimation statistics was enabled  for this TCP connection, the <i>Rod</i> parameter was not <b>NULL</b>, and the function succeeds, the buffer pointed to by the <i>Rod</i> parameter should contain a <a href="https://docs.microsoft.com/windows/desktop/api/tcpestats/ns-tcpestats-tcp_estats_fine_rtt_rod_v0">TCP_ESTATS_FINE_RTT_ROD_v0</a> structure. 
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Byte>} Rw A pointer to a buffer to receive the read/write information. This parameter may be a <b>NULL</b> pointer if an application does not want to retrieve read/write information for the TCP connection.
     * @param {Integer} RwVersion The version of the read/write information requested. The current supported value is a version of zero.
     * @param {Integer} RwSize The size, in bytes, of the buffer pointed to by <i>Rw</i> parameter.
     * @param {Pointer<Byte>} Ros A pointer to a buffer to receive read-only static information. This parameter may be a <b>NULL</b> pointer if an application does not want to retrieve read-only static information for the TCP connection.
     * @param {Integer} RosVersion The version of the read-only static information requested. The current supported value is a version of zero.
     * @param {Integer} RosSize The size, in bytes, of the buffer pointed to by the <i>Ros</i> parameter.
     * @param {Pointer<Byte>} Rod A pointer to a buffer to receive read-only dynamic information. This parameter may be a <b>NULL</b> pointer if an application does not want to retrieve read-only dynamic information  for the TCP connection.
     * @param {Integer} RodVersion The version of the read-only dynamic information requested. The current supported value is a version of zero.
     * @param {Integer} RodSize The size, in bytes, of the buffer pointed to by the <i>Rod</i> parameter.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A buffer passed to a function is too small. This error is returned if the buffer pointed to by the <i>Rw</i>, <i>Ros</i>,  or <i>Rod</i> parameters is not large enough to receive the data.  This error also returned if one of the given buffers pointed to by the <i>Rw</i>, <i>Ros</i>,  or <i>Rod</i> parameters is <b>NULL</b>,
     *                 but a length was specified in the associated <i>RwSize</i>, <i>RosSize</i>,  or <i>RodSize</i>.
     * 
     * This error value is returned on Windows Vista and Windows Server 2008.  
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
     * The parameter is incorrect. This error is returned if the <i>Row</i> parameter is a <b>NULL</b> pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_USER_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The supplied user buffer is not valid for the requested operation. This error is returned if one of the given buffers pointed to by the <i>Rw</i>, <i>Ros</i>,  or <i>Rod</i> parameters is <b>NULL</b>,
     *                 but a length was specified in the associated <i>RwSize</i>, <i>RosSize</i>,  or <i>RodSize</i>. As a result, this error is returned if any of the following conditions are met:
     * 
     * 
     * <ul>
     * <li>The <i>Row</i> parameter is a <b>NULL</b> pointer and the <i>RwSize</i> parameter is nonzero.</li>
     * <li>The <i>Ros</i> parameter is a <b>NULL</b> pointer and the <i>RosSize</i> parameter is nonzero.</li>
     * <li>The <i>Rod</i> parameter is a <b>NULL</b> pointer and the <i>RodSize</i> parameter is nonzero.</li>
     * </ul>
     * 
     * 
     * This error value is returned on Windows 7 and Windows Server 2008 R2.  
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
     * This requested entry was not found. This error is returned if the TCP connection specified in the <i>Row</i> parameter could not be found.
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
     * The request is not supported. This error is returned if the <i>RwVersion</i>, <i>RosVersion</i>, or <i>RodVersion</i> parameter is not set to zero.
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-getpertcpconnectionestats
     * @since windows6.0.6000
     */
    static GetPerTcpConnectionEStats(Row, EstatsType, Rw, RwVersion, RwSize, Ros, RosVersion, RosSize, Rod, RodVersion, RodSize) {
        result := DllCall("IPHLPAPI.dll\GetPerTcpConnectionEStats", "ptr", Row, "int", EstatsType, "ptr", Rw, "uint", RwVersion, "uint", RwSize, "ptr", Ros, "uint", RosVersion, "uint", RosSize, "ptr", Rod, "uint", RodVersion, "uint", RodSize, "uint")
        return result
    }

    /**
     * Sets a value in the read/write information for an IPv4 TCP connection. This function is used to enable or disable extended statistics for an IPv4 TCP connection.
     * @remarks
     * The <b>SetPerTcpConnectionEStats</b> function is defined on Windows Vista and later. 
     * 
     * The <b>SetPerTcpConnectionEStats</b> function is used to enable or disable extended statistics on an IPv4 TCP connection passed in the <i>Row</i> parameter. Extended statistics on a TCP connection are disabled by default. The <b>SetPerTcpConnectionEStats</b> function is used to set the value of a member in the read/write information for extended statistics for an IPv4 TCP connection. The type and format of the structure to be set is specified by the <i>EstatsType</i> parameter. The <i>Rw</i> parameter contains a pointer to the structure being passed.  All members in the structure pointed to by <i>Rw</i> parameter must be specified. 
     * 
     * The only version of TCP connection statistics currently supported is version zero. So the <i>RwVersion</i> parameter passed to <b>SetPerTcpConnectionEStats</b> should be set to 0.
     * 
     * The structure pointed to by the <i>Rw</i> parameter passed this function depends on the enumeration value passed in the <i>EstatsType</i> parameter. The following table below indicates the structure type that should be passed in the <i>Rw</i> parameter for each possible <i>EstatsType</i> parameter type.  
     * 
     * 
     * <table>
     * <tr>
     * <th><i>EstatsType</i></th>
     * <th>Structure pointed to by <i>Rw</i></th>
     * </tr>
     * <tr>
     * <td><b>TcpConnectionEstatsData</b></td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/win32/api/tcpestats/ns-tcpestats-tcp_estats_data_rw_v0">TCP_ESTATS_DATA_RW_v0</a>
     * </td>
     * </tr>
     * <tr>
     * <td><b>TcpConnectionEstatsSndCong</b></td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/win32/api/tcpestats/ns-tcpestats-tcp_estats_snd_cong_rw_v0">TCP_ESTATS_SND_CONG_RW_v0</a>
     * </td>
     * </tr>
     * <tr>
     * <td><b>TcpConnectionEstatsPath</b></td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/win32/api/tcpestats/ns-tcpestats-tcp_estats_path_rw_v0">TCP_ESTATS_PATH_RW_v0</a>
     * </td>
     * </tr>
     * <tr>
     * <td><b>TcpConnectionEstatsSendBuff</b></td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/win32/api/tcpestats/ns-tcpestats-tcp_estats_send_buff_rw_v0">TCP_ESTATS_SEND_BUFF_RW_v0</a>
     * </td>
     * </tr>
     * <tr>
     * <td><b>TcpConnectionEstatsRec</b></td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/win32/api/tcpestats/ns-tcpestats-tcp_estats_rec_rw_v0">TCP_ESTATS_REC_RW_v0</a>
     * </td>
     * </tr>
     * <tr>
     * <td><b>TcpConnectionEstatsObsRec</b></td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/win32/api/tcpestats/ns-tcpestats-tcp_estats_obs_rec_rw_v0">TCP_ESTATS_OBS_REC_RW_v0</a>
     * </td>
     * </tr>
     * <tr>
     * <td><b>TcpConnectionEstatsBandwidth</b></td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/win32/api/tcpestats/ns-tcpestats-tcp_estats_bandwidth_rw_v0">TCP_ESTATS_BANDWIDTH_RW_v0</a>
     * </td>
     * </tr>
     * <tr>
     * <td><b>TcpConnectionEstatsFineRtt</b></td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/win32/api/tcpestats/ns-tcpestats-tcp_estats_fine_rtt_rw_v0">TCP_ESTATS_FINE_RTT_RW_v0</a>
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * 
     * The <i>Offset</i> parameter is currently unused and must be set to 0. The possible structures pointed to by the <i>Rw</i> parameter all have a single member except for the <a href="https://docs.microsoft.com/windows/win32/api/tcpestats/ns-tcpestats-tcp_estats_bandwidth_rw_v0">TCP_ESTATS_BANDWIDTH_RW_v0</a> structure.  When the <i>EstatsType</i> parameter is set to <b>TcpConnectionEstatsBandwidth</b>, the <b>TCP_ESTATS_BANDWIDTH_RW_v0</b> structure pointed to by the <i>Rw</i> parameter must have both structure members set  to the preferred values in a single call to the  <b>SetPerTcpConnectionEStats</b> function.
     * 
     * If the <i>RwSize</i> parameter is set to 0, the <b>SetPerTcpConnectionEStats</b> function  returns NO_ERROR and makes no changes to the extended statistics status.
     * 
     * The <a href="https://docs.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-gettcptable">GetTcpTable</a> function is used to retrieve the IPv4 TCP connection table on the local computer. This function returns a <a href="https://docs.microsoft.com/windows/win32/api/tcpmib/ns-tcpmib-mib_tcptable">MIB_TCPTABLE</a> structure that contain an array of <a href="https://docs.microsoft.com/windows/win32/api/tcpmib/ns-tcpmib-mib_tcprow_lh">MIB_TCPROW</a> entries. The <i>Row</i> parameter passed to the <b>SetPerTcpConnectionEStats</b> function must be an entry for an existing IPv4 TCP connection.
     * 
     * Once extended statistics are enabled on a TCP connection for IPv4, applications call the <a href="https://docs.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-getpertcpconnectionestats">GetPerTcpConnectionEStats</a> function to retrieve extended statistics on the TCP connection.
     * 
     * The <a href="https://docs.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-getpertcpconnectionestats">GetPerTcpConnectionEStats</a> function is designed to use TCP to diagnose performance
     *    problems in both the network and the application.  If a network based
     *    application is performing poorly, TCP can determine if the bottleneck
     *    is in the sender, the receiver or the network itself.  If the
     *    bottleneck is in the network, TCP can provide specific information
     *    about its nature.
     * 
     * 
     * For information on extended TCP statistics on an IPv6 connection, see the <a href="https://docs.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-getpertcp6connectionestats">GetPerTcp6ConnectionEStats</a> and <a href="https://docs.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-setpertcp6connectionestats">SetPerTcp6ConnectionEStats</a> functions.
     * 
     * The <b>SetPerTcpConnectionEStats</b> function can only be called by a user logged on as a member of the Administrators group. If <b>SetPerTcpConnectionEStats</b> is called by a user that is not a member of the Administrators group, the function call will fail and <b>ERROR_ACCESS_DENIED</b> is returned. This function can also fail because of user account control (UAC) on Windows Vista and Windows Server 2008. If an application that contains this function is executed by a user logged on as a member of the Administrators group other than the built-in Administrator, this call will fail unless the application has been marked in the manifest file with a <b>requestedExecutionLevel</b> set to requireAdministrator. If the application on Windows Vista or Windows Server 2008 lacks this manifest file, a user logged on as a member of the Administrators group other than the built-in Administrator must then be executing the application in an enhanced shell as the built-in Administrator (RunAs administrator) for this function to succeed.
     * 
     * In Windows versions prior to Windows 10, version 1709 (Fall Creators Update), you can use **SetPerTcpConnectionEStats** to disable and reenable statistics on a connection, causing any statistics counters to be reset to zero. As of Windows 10, version 1709 (Fall Creators Update), some statistics counters don't reset when statistics are disabled and reenabled. Also, if two applications are monitoring statistics for the same connection, then one application can confuse the other by disabling statistics. For these reasons, we recommend that your application refrains from disabling statistics on connections. To detect changes over time, you should save the counter values read by a previous call to [GetPerTcpConnectionEStats](./nf-iphlpapi-getpertcpconnectionestats.md), and subtract them from those read by a subsequent call.
     * @param {Pointer<MIB_TCPROW_LH>} Row A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/tcpmib/ns-tcpmib-mib_tcprow_lh">MIB_TCPROW</a> structure for an IPv4 TCP connection.
     * @param {Integer} EstatsType The type of extended statistics for TCP to set. This parameter determines the data and format of information that is expected in the <i>Rw</i> parameter.
     * 
     * This parameter can be one of the values from the <a href="https://docs.microsoft.com/windows/win32/api/tcpestats/ne-tcpestats-tcp_estats_type">TCP_ESTATS_TYPE</a> enumeration type defined in the <i>Tcpestats.h</i> header file.
     * @param {Pointer<Byte>} Rw A pointer to a buffer that contains the read/write information to set. The buffer should contain a value from the <a href="https://docs.microsoft.com/windows/win32/api/tcpestats/ne-tcpestats-tcp_boolean_optional">TCP_BOOLEAN_OPTIONAL</a> enumeration for each structure member that specifies how each member should be updated.
     * @param {Integer} RwVersion The version of the read/write information to be set. This parameter should be set to zero for Windows Vista, Windows Server 2008, and Windows 7.
     * @param {Integer} RwSize The size, in bytes, of the buffer pointed to by the <i>Rw</i> parameter.
     * @param {Integer} Offset The offset, in bytes, to the member in the structure pointed to by the <i>Rw</i> parameter to be set. This parameter is currently unused and must be set to zero.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
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
     * Access is denied. This error is returned under several conditions that include the following: the  user lacks the required administrative privileges on the local computer or the application is not running in an enhanced shell as the built-in Administrator (RunAs administrator).  
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_USER_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The supplied user buffer is not valid for the requested operation. This error is returned if the <i>Row</i> parameter is a <b>NULL</b> pointer and the <i>RwSize</i> parameter is nonzero.
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
     * The parameter is incorrect. This error is returned if the <i>Row</i> parameter is a <b>NULL</b> pointer.
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
     * This requested entry was not found. This error is returned if the TCP connection specified in the <i>Row</i> parameter could not be found.
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
     * The request is not supported. This error is returned if the <i>RwVersion</i> or the <i>Offset</i> parameter is not set to 0.
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/win32/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-setpertcpconnectionestats
     * @since windows6.0.6000
     */
    static SetPerTcpConnectionEStats(Row, EstatsType, Rw, RwVersion, RwSize, Offset) {
        result := DllCall("IPHLPAPI.dll\SetPerTcpConnectionEStats", "ptr", Row, "int", EstatsType, "ptr", Rw, "uint", RwVersion, "uint", RwSize, "uint", Offset, "uint")
        return result
    }

    /**
     * Retrieves extended statistics for an IPv6 TCP connection.
     * @remarks
     * The <b>GetPerTcp6ConnectionEStats</b> function is defined on Windows Vista and later. 
     * 
     * The <b>GetPerTcp6ConnectionEStats</b> function is designed to use TCP to diagnose performance
     *    problems in both the network and the application.  If a network based
     *    application is performing poorly, TCP can determine if the bottleneck
     *    is in the sender, the receiver or the network itself.  If the
     *    bottleneck is in the network, TCP can provide specific information
     *    about its nature.
     * 
     * 
     * The <b>GetPerTcp6ConnectionEStats</b> function retrieves extended statistics for the IPv6 TCP connection passed in the <i>Row</i> parameter. The type of extended statistics that is retrieved is specified in the <i>EstatsType</i> parameter. Extended statistics on this TCP connection must have previously been enabled by calls to the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-setpertcp6connectionestats">SetPerTcp6ConnectionEStats</a> function for all <a href="https://docs.microsoft.com/windows/desktop/api/tcpestats/ne-tcpestats-tcp_estats_type">TCP_ESTATS_TYPE</a> values except when <b>TcpConnectionEstatsSynOpts</b> is passed in the <i>EstatsType</i> parameter. 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-gettcp6table">GetTcp6Table</a> function is used to retrieve the IPv6 TCP connection table on the local computer. This function returns a <a href="https://docs.microsoft.com/windows/desktop/api/tcpmib/ns-tcpmib-mib_tcp6table">MIB_TCP6TABLE</a> structure that contain an array of <a href="https://docs.microsoft.com/windows/desktop/api/tcpmib/ns-tcpmib-mib_tcp6row">MIB_TCP6ROW</a> entries. The <i>Row</i> parameter passed to the <b>GetPerTcp6ConnectionEStats</b> function must be an entry for an existing IPv6 TCP connection.
     * 
     * The only version of TCP connection statistics currently supported is version zero. So the <i>RwVersion</i>, <i>RosVersion</i>, and <i>RodVersion</i> parameters passed to <b>GetPerTcp6ConnectionEStats</b> should be set to 0.
     * 
     * For information on extended TCP statistics on an IPv4 connection, see the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getpertcpconnectionestats">GetPerTcpConnectionEStats</a> and <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-setpertcpconnectionestats">SetPerTcpConnectionEStats</a> functions.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-setpertcp6connectionestats">SetPerTcp6ConnectionEStats</a> function can only be called by a user logged on as a member of the Administrators group. If <b>SetPerTcp6ConnectionEStats</b> is called by a user that is not a member of the Administrators group, the function call will fail and <b>ERROR_ACCESS_DENIED</b> is returned. This function can also fail because of user account control (UAC) on Windows Vista and later. If an application that contains this function is executed by a user logged on as a member of the Administrators group other than the built-in Administrator, this call will fail unless the application has been marked in the manifest file with a <b>requestedExecutionLevel</b> set to requireAdministrator. If the application lacks this manifest file, a user logged on as a member of the Administrators group other than the built-in Administrator must then be executing the application in an enhanced shell as the built-in Administrator (RunAs administrator) for this function to succeed.
     * 
     * The caller of **GetPerTcp6ConnectionEStats** should check the *EnableCollection* field in the returned *Rw* struct, and if it is not `TRUE`, then the caller should ignore the data in the *Ros* and *Rod* structs. If *EnableCollection* is set to `FALSE`, then the data returned in *Ros* and *Rod* are undefined. For example, one condition under which this can happen is when you're using **GetPerTcp6ConnectionEStats** to retrieve extended statistics for an IPv6 TCP connection, and you've previously called [SetPerTcp6ConnectionEStats](./nf-iphlpapi-setpertcp6connectionestats.md) to enable extended statistics. If the **SetPerTcp6ConnectionEStats** call fails then subsequent calls to **GetPerTcp6ConnectionEStats** will return meaningless random data, and not extended TCP statistics. You can observe that example by running the example below as both an administrator, and as a normal user.
     * @param {Pointer<MIB_TCP6ROW>} Row A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/tcpmib/ns-tcpmib-mib_tcp6row">MIB_TCP6ROW</a> structure for an IPv6 TCP connection.
     * @param {Integer} EstatsType The type of extended statistics for TCP requested. This parameter determines the data and format of information that is returned in the <i>Rw</i>, <i>Rod</i>, and <i>Ros</i> parameters if the call is successful.
     * 
     * This parameter can be one of the values from the <a href="https://docs.microsoft.com/windows/desktop/api/tcpestats/ne-tcpestats-tcp_estats_type">TCP_ESTATS_TYPE</a> enumeration type defined in the <i>Tcpestats.h</i> header file. 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TcpConnectionEstatsSynOpts"></a><a id="tcpconnectionestatssynopts"></a><a id="TCPCONNECTIONESTATSSYNOPTS"></a><dl>
     * <dt><b>TcpConnectionEstatsSynOpts</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This value requests SYN exchange information for a TCP connection.
     * 
     * Only read-only static information is available for this enumeration value.
     * 
     * If the <i>Ros</i> parameter was not <b>NULL</b> and the function succeeds, the buffer pointed to by the <i>Ros</i> parameter should contain a <a href="https://docs.microsoft.com/windows/desktop/api/tcpestats/ns-tcpestats-tcp_estats_syn_opts_ros_v0">TCP_ESTATS_SYN_OPTS_ROS_v0</a> structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TcpConnectionEstatsData"></a><a id="tcpconnectionestatsdata"></a><a id="TCPCONNECTIONESTATSDATA"></a><dl>
     * <dt><b>TcpConnectionEstatsData</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This value requests extended data transfer information for a TCP connection. 
     * 
     * Only read-only dynamic information and read/write information are available for this enumeration value.
     * 
     * If the <i>Rw</i> parameter was not <b>NULL</b> and the function succeeds, the buffer pointed to by the <i>Rw</i> parameter should contain a <a href="https://docs.microsoft.com/windows/desktop/api/tcpestats/ns-tcpestats-tcp_estats_data_rw_v0">TCP_ESTATS_DATA_RW_v0</a> structure. 
     * 
     * If extended data transfer information was enabled  for this TCP connection, the <i>Rod</i> parameter was not <b>NULL</b>, and the function succeeds, the buffer pointed to by the <i>Rod</i> parameter should contain a <a href="https://docs.microsoft.com/windows/desktop/api/tcpestats/ns-tcpestats-tcp_estats_data_rod_v0">TCP_ESTATS_DATA_ROD_v0</a> structure. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TcpConnectionEstatsSndCong"></a><a id="tcpconnectionestatssndcong"></a><a id="TCPCONNECTIONESTATSSNDCONG"></a><dl>
     * <dt><b>TcpConnectionEstatsSndCong</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This value requests sender congestion for a TCP connection. 
     * 
     * All three types of information (read-only static, read-only dynamic,  and read/write information) are available for this enumeration value.
     * 
     * If the <i>Rw</i> parameter was not <b>NULL</b> and the function succeeds, the buffer pointed to by the <i>Rw</i> parameter should contain a <a href="https://docs.microsoft.com/windows/desktop/api/tcpestats/ns-tcpestats-tcp_estats_snd_cong_rw_v0">TCP_ESTATS_SND_CONG_RW_v0</a> structure. 
     * 
     * If the <i>Ros</i> parameter was not <b>NULL</b> and the function succeeds, the buffer pointed to by the <i>Ros</i> parameter should contain a <a href="https://docs.microsoft.com/windows/desktop/api/tcpestats/ns-tcpestats-tcp_estats_snd_cong_ros_v0">TCP_ESTATS_SND_CONG_ROS_v0</a> structure.
     * 
     * If sender congestion information was enabled  for this TCP connection, the <i>Rod</i> parameter was not <b>NULL</b>, and the function succeeds, the buffer pointed to by the <i>Rod</i> parameter should contain a <a href="https://docs.microsoft.com/windows/desktop/api/tcpestats/ns-tcpestats-tcp_estats_snd_cong_rod_v0">TCP_ESTATS_SND_CONG_ROD_v0</a> structure. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TcpConnectionEstatsPath"></a><a id="tcpconnectionestatspath"></a><a id="TCPCONNECTIONESTATSPATH"></a><dl>
     * <dt><b>TcpConnectionEstatsPath</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This value requests extended path measurement information for a TCP connection.
     * 
     * Only read-only dynamic information and read/write information are available for this enumeration value.
     * 
     * If the <i>Rw</i> parameter was not <b>NULL</b> and the function succeeds, the buffer pointed to by the <i>Rw</i> parameter should contain a <a href="https://docs.microsoft.com/windows/desktop/api/tcpestats/ns-tcpestats-tcp_estats_path_rw_v0">TCP_ESTATS_PATH_RW_v0</a> structure. 
     * 
     * If extended path measurement information was enabled  for this TCP connection, the <i>Rod</i> parameter was not <b>NULL</b>, and the function succeeds, the buffer pointed to by the <i>Rod</i> parameter should contain a <a href="https://docs.microsoft.com/windows/desktop/api/tcpestats/ns-tcpestats-tcp_estats_path_rod_v0">TCP_ESTATS_PATH_ROD_v0</a> structure. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TcpConnectionEstatsSendBuff"></a><a id="tcpconnectionestatssendbuff"></a><a id="TCPCONNECTIONESTATSSENDBUFF"></a><dl>
     * <dt><b>TcpConnectionEstatsSendBuff</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This value requests extended output-queuing information for a TCP connection.
     * 
     * Only read-only dynamic information and read/write information are available for this enumeration value.
     * 
     * If the <i>Rw</i> parameter was not <b>NULL</b> and the function succeeds, the buffer pointed to by the <i>Rw</i> parameter should contain a <a href="https://docs.microsoft.com/windows/desktop/api/tcpestats/ns-tcpestats-tcp_estats_send_buff_rw_v0">TCP_ESTATS_SEND_BUFF_RW_v0</a> structure. 
     * 
     * If extended output-queuing information was enabled  for this TCP connection, the <i>Rod</i> parameter was not <b>NULL</b>, and the function succeeds, the buffer pointed to by the <i>Rod</i> parameter should contain a <a href="https://docs.microsoft.com/windows/desktop/api/tcpestats/ns-tcpestats-tcp_estats_send_buff_rod_v0">TCP_ESTATS_SEND_BUFF_ROD_v0</a> structure. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TcpConnectionEstatsRec"></a><a id="tcpconnectionestatsrec"></a><a id="TCPCONNECTIONESTATSREC"></a><dl>
     * <dt><b>TcpConnectionEstatsRec</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This value requests extended local-receiver information for a TCP connection.
     * 
     * Only read-only dynamic information and read/write information are available for this enumeration value.
     * 
     * If the <i>Rw</i> parameter was not <b>NULL</b> and the function succeeds, the buffer pointed to by the <i>Rw</i> parameter should contain a <a href="https://docs.microsoft.com/windows/desktop/api/tcpestats/ns-tcpestats-tcp_estats_rec_rw_v0">TCP_ESTATS_REC_RW_v0</a> structure. 
     * 
     * If extended local-receiver information was enabled  for this TCP connection, the <i>Rod</i> parameter was not <b>NULL</b>, and the function succeeds, the buffer pointed to by the <i>Rod</i> parameter should contain a <a href="https://docs.microsoft.com/windows/desktop/api/tcpestats/ns-tcpestats-tcp_estats_rec_rod_v0">TCP_ESTATS_REC_ROD_v0</a> structure. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TcpConnectionEstatsObsRec"></a><a id="tcpconnectionestatsobsrec"></a><a id="TCPCONNECTIONESTATSOBSREC"></a><dl>
     * <dt><b>TcpConnectionEstatsObsRec</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This value requests extended remote-receiver information for a TCP connection.
     * 
     * Only read-only dynamic information and read/write information are available for this enumeration value.
     * 
     * If the <i>Rw</i> parameter was not <b>NULL</b> and the function succeeds, the buffer pointed to by the <i>Rw</i> parameter should contain a <a href="https://docs.microsoft.com/windows/desktop/api/tcpestats/ns-tcpestats-tcp_estats_obs_rec_rw_v0">TCP_ESTATS_OBS_REC_RW_v0</a> structure. 
     * 
     * If extended remote-receiver information was enabled  for this TCP connection, the <i>Rod</i> parameter was not <b>NULL</b>, and the function succeeds, the buffer pointed to by the <i>Rod</i> parameter should contain a <a href="https://docs.microsoft.com/windows/desktop/api/tcpestats/ns-tcpestats-tcp_estats_obs_rec_rod_v0">TCP_ESTATS_OBS_REC_ROD_v0</a> structure. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TcpConnectionEstatsBandwidth"></a><a id="tcpconnectionestatsbandwidth"></a><a id="TCPCONNECTIONESTATSBANDWIDTH"></a><dl>
     * <dt><b>TcpConnectionEstatsBandwidth</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This value requests bandwidth estimation statistics for a TCP connection on bandwidth.
     * 
     * Only read-only dynamic information and read/write information are available for this enumeration value.
     * 
     * If the <i>Rw</i> parameter was not <b>NULL</b> and the function succeeds, the buffer pointed to by the <i>Rw</i> parameter should contain a <a href="https://docs.microsoft.com/windows/desktop/api/tcpestats/ns-tcpestats-tcp_estats_bandwidth_rw_v0">TCP_ESTATS_BANDWIDTH_RW_v0</a> structure. 
     * 
     * If bandwidth estimation statistics was enabled  for this TCP connection, the <i>Rod</i> parameter was not <b>NULL</b>, and the function succeeds, the buffer pointed to by the <i>Rod</i> parameter should contain a <a href="https://docs.microsoft.com/windows/desktop/api/tcpestats/ns-tcpestats-tcp_estats_bandwidth_rod_v0">TCP_ESTATS_BANDWIDTH_ROD_v0</a> structure. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TcpConnectionEstatsFineRtt"></a><a id="tcpconnectionestatsfinertt"></a><a id="TCPCONNECTIONESTATSFINERTT"></a><dl>
     * <dt><b>TcpConnectionEstatsFineRtt</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This value requests fine-grained round-trip time (RTT) estimation statistics for a TCP connection.
     * 
     * Only read-only dynamic information and read/write information are available for this enumeration value.
     * 
     * If the <i>Rw</i> parameter was not <b>NULL</b> and the function succeeds, the buffer pointed to by the <i>Rw</i> parameter should contain a <a href="https://docs.microsoft.com/windows/desktop/api/tcpestats/ns-tcpestats-tcp_estats_fine_rtt_rw_v0">TCP_ESTATS_FINE_RTT_RW_v0</a> structure. 
     * 
     * If fine-grained RTT estimation statistics was enabled  for this TCP connection, the <i>Rod</i> parameter was not <b>NULL</b>, and the function succeeds, the buffer pointed to by the <i>Rod</i> parameter should contain a <a href="https://docs.microsoft.com/windows/desktop/api/tcpestats/ns-tcpestats-tcp_estats_fine_rtt_rod_v0">TCP_ESTATS_FINE_RTT_ROD_v0</a> structure. 
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Byte>} Rw A pointer to a buffer to receive the read/write information. This parameter may be a <b>NULL</b> pointer if an application does not want to retrieve read/write information for the TCP connection.
     * @param {Integer} RwVersion The version of the read/write information requested. The current supported value is a version of zero.
     * @param {Integer} RwSize The size, in bytes, of the buffer pointed to by <i>Rw</i> parameter.
     * @param {Pointer<Byte>} Ros A pointer to a buffer to receive read-only static information. This parameter may be a <b>NULL</b> pointer if an application does not want to retrieve read-only static information for the TCP connection.
     * @param {Integer} RosVersion The version of the read-only static information requested. The current supported value is a version of zero.
     * @param {Integer} RosSize The size, in bytes, of the buffer pointed to by the <i>Ros</i> parameter.
     * @param {Pointer<Byte>} Rod A pointer to a buffer to receive read-only dynamic information. This parameter may be a <b>NULL</b> pointer if an application does not want to retrieve read-only dynamic information  for the TCP connection.
     * @param {Integer} RodVersion The version of the read-only dynamic information requested. The current supported value is a version of zero..
     * @param {Integer} RodSize The size, in bytes, of the buffer pointed to by the <i>Rod</i> parameter.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A buffer passed to a function is too small. This error is returned if the buffer pointed to by the <i>Rw</i>, <i>Ros</i>,  or <i>Rod</i> parameters is not large enough to receive the data.  This error also returned if one of the given buffers pointed to by the <i>Rw</i>, <i>Ros</i>,  or <i>Rod</i> parameters is <b>NULL</b>,
     *                 but a length was specified in the associated <i>RwSize</i>, <i>RosSize</i>,  or <i>RodSize</i>.
     * 
     * This error value is returned on Windows Vista and Windows Server 2008.  
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
     * The parameter is incorrect. This error is returned if the <i>Row</i> parameter is a <b>NULL</b> pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_USER_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The supplied user buffer is not valid for the requested operation. This error is returned if one of the given buffers pointed to by the <i>Rw</i>, <i>Ros</i>,  or <i>Rod</i> parameters is <b>NULL</b>,
     *                 but a length was specified in the associated <i>RwSize</i>, <i>RosSize</i>,  or <i>RodSize</i>. As a result, this error is returned if any of the following conditions are met:
     * 
     * 
     * <ul>
     * <li>The <i>Row</i> parameter is a <b>NULL</b> pointer and the <i>RwSize</i> parameter is nonzero.</li>
     * <li>The <i>Ros</i> parameter is a <b>NULL</b> pointer and the <i>RosSize</i> parameter is nonzero.</li>
     * <li>The <i>Rod</i> parameter is a <b>NULL</b> pointer and the <i>RodSize</i> parameter is nonzero.</li>
     * </ul>
     * 
     * 
     * This error value is returned on Windows 7 and Windows Server 2008 R2.  
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
     * This requested entry was not found. This error is returned if the TCP connection specified in the <i>Row</i> parameter could not be found.
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
     * The request is not supported. This error is returned if the <i>RwVersion</i>, <i>RosVersion</i>, or <i>RodVersion</i> parameter is not set to zero.
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-getpertcp6connectionestats
     * @since windows6.0.6000
     */
    static GetPerTcp6ConnectionEStats(Row, EstatsType, Rw, RwVersion, RwSize, Ros, RosVersion, RosSize, Rod, RodVersion, RodSize) {
        result := DllCall("IPHLPAPI.dll\GetPerTcp6ConnectionEStats", "ptr", Row, "int", EstatsType, "ptr", Rw, "uint", RwVersion, "uint", RwSize, "ptr", Ros, "uint", RosVersion, "uint", RosSize, "ptr", Rod, "uint", RodVersion, "uint", RodSize, "uint")
        return result
    }

    /**
     * Sets a value in the read/write information for an IPv6 TCP connection. This function is used to enable or disable extended statistics for an IPv6 TCP connection.
     * @remarks
     * The <b>SetPerTcp6ConnectionEStats</b> function is defined on Windows Vista and later. 
     * 
     * The <b>SetPerTcp6ConnectionEStats</b> function is used to enable or disable extended statistics for the IPv6 TCP connection passed in the <i>Row</i> parameter. Extended statistics on a TCP connection are disabled by default. 
     * 
     * The <b>SetPerTcp6ConnectionEStats</b> function is used to set the value of a member in the read/write information for extended statistics for an IPv6 TCP connection. The type and format of the structure to be set is specified by the <i>EstatsType</i> parameter. The <i>Rw</i> parameter contains a pointer to the structure being passed. The member to set in this structure is specified by the <i>Offset</i> parameter. All members in the structure pointed to by <i>Rw</i> parameter must be specified. 
     * 
     * The only version of TCP connection statistics currently supported is version zero. So the <i>RwVersion</i> parameter passed to <b>SetPerTcp6ConnectionEStats</b> should be set to 0.
     * 
     * The structure pointed to by the <i>Rw</i> parameter passed this function depends on the enumeration value passed in the <i>EstatsType</i> parameter. The following table below indicates the structure type that should be passed in the <i>Rw</i> parameter for each possible <i>EstatsType</i> parameter type.  
     * 
     * 
     * <table>
     * <tr>
     * <th><i>EstatsType</i></th>
     * <th>Structure pointed to by <i>Rw</i></th>
     * </tr>
     * <tr>
     * <td><b>TcpConnectionEstatsData</b></td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/tcpestats/ns-tcpestats-tcp_estats_data_rw_v0">TCP_ESTATS_DATA_RW_v0</a>
     * </td>
     * </tr>
     * <tr>
     * <td><b>TcpConnectionEstatsSndCong</b></td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/tcpestats/ns-tcpestats-tcp_estats_snd_cong_rw_v0">TCP_ESTATS_SND_CONG_RW_v0</a>
     * </td>
     * </tr>
     * <tr>
     * <td><b>TcpConnectionEstatsPath</b></td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/tcpestats/ns-tcpestats-tcp_estats_path_rw_v0">TCP_ESTATS_PATH_RW_v0</a>
     * </td>
     * </tr>
     * <tr>
     * <td><b>TcpConnectionEstatsSendBuff</b></td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/tcpestats/ns-tcpestats-tcp_estats_send_buff_rw_v0">TCP_ESTATS_SEND_BUFF_RW_v0</a>
     * </td>
     * </tr>
     * <tr>
     * <td><b>TcpConnectionEstatsRec</b></td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/tcpestats/ns-tcpestats-tcp_estats_rec_rw_v0">TCP_ESTATS_REC_RW_v0</a>
     * </td>
     * </tr>
     * <tr>
     * <td><b>TcpConnectionEstatsObsRec</b></td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/tcpestats/ns-tcpestats-tcp_estats_obs_rec_rw_v0">TCP_ESTATS_OBS_REC_RW_v0</a>
     * </td>
     * </tr>
     * <tr>
     * <td><b>TcpConnectionEstatsBandwidth</b></td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/tcpestats/ns-tcpestats-tcp_estats_bandwidth_rw_v0">TCP_ESTATS_BANDWIDTH_RW_v0</a>
     * </td>
     * </tr>
     * <tr>
     * <td><b>TcpConnectionEstatsFineRtt</b></td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/tcpestats/ns-tcpestats-tcp_estats_fine_rtt_rw_v0">TCP_ESTATS_FINE_RTT_RW_v0</a>
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * 
     * The <i>Offset</i> parameter is currently unused. The possible structures pointed to by the <i>Rw</i> parameter all have a single member except for the <a href="https://docs.microsoft.com/windows/desktop/api/tcpestats/ns-tcpestats-tcp_estats_bandwidth_rw_v0">TCP_ESTATS_BANDWIDTH_RW_v0</a> structure.  When the <i>EstatsType</i> parameter is set to <b>TcpConnectionEstatsBandwidth</b>, the <b>TCP_ESTATS_BANDWIDTH_RW_v0</b> structure pointed to by the <i>Rw</i> parameter must have both structure members set to the preferred values in a single call to the  <b>SetPerTcp6ConnectionEStats</b> function.
     * 
     * If the <i>RwSize</i> parameter is set to 0, the <b>SetPerTcp6ConnectionEStats</b> function returns NO_ERROR and makes no changes to the extended statistics status.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-gettcp6table">GetTcp6Table</a> function is used to retrieve the IPv6 TCP connection table on the local computer. This function returns a <a href="https://docs.microsoft.com/windows/desktop/api/tcpmib/ns-tcpmib-mib_tcp6table">MIB_TCP6TABLE</a> structure that contain an array of <a href="https://docs.microsoft.com/windows/desktop/api/tcpmib/ns-tcpmib-mib_tcp6row">MIB_TCP6ROW</a> entries. The <i>Row</i> parameter passed to the <b>SetPerTcp6ConnectionEStats</b> function must be an entry for an existing IPv6 TCP connection.
     * 
     * Once extended statistics are enabled on a TCP connection for IPv6, an application calls the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getpertcp6connectionestats">GetPerTcp6ConnectionEStats</a> function to retrieve extended statistics on the TCP connection.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getpertcp6connectionestats">GetPerTcp6ConnectionEStats</a> function is designed to use TCP to diagnose performance
     *    problems in both the network and the application.  If a network based
     *    application is performing poorly, TCP can determine if the bottleneck
     *    is in the sender, the receiver or the network itself.  If the
     *    bottleneck is in the network, TCP can provide specific information
     *    about its nature.
     * 
     * 
     * For information on extended TCP statistics on an IPv4 connection, see the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getpertcpconnectionestats">GetPerTcpConnectionEStats</a> and <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-setpertcpconnectionestats">SetPerTcpConnectionEStats</a> functions.
     * 
     * The <b>SetPerTcp6ConnectionEStats</b> function can only be called by a user logged on as a member of the Administrators group. If <b>SetPerTcp6ConnectionEStats</b> is called by a user that is not a member of the Administrators group, the function call will fail and <b>ERROR_ACCESS_DENIED</b> is returned. This function can also fail because of user account control (UAC) on Windows Vista and Windows Server 2008. If an application that contains this function is executed by a user logged on as a member of the Administrators group other than the built-in Administrator, this call will fail unless the application has been marked in the manifest file with a <b>requestedExecutionLevel</b> set to requireAdministrator. If the application on Windows Vista or Windows Server 2008 lacks this manifest file, a user logged on as a member of the Administrators group other than the built-in Administrator must then be executing the application in an enhanced shell as the built-in Administrator (RunAs administrator) for this function to succeed.
     * @param {Pointer<MIB_TCP6ROW>} Row A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/tcpmib/ns-tcpmib-mib_tcp6row">MIB_TCP6ROW</a> structure for an IPv6 TCP connection.
     * @param {Integer} EstatsType The type of extended statistics for TCP to set. This parameter determines the data and format of information that is expected in the <i>Rw</i> parameter.
     * 
     * This parameter can be one of the values from the <a href="https://docs.microsoft.com/windows/desktop/api/tcpestats/ne-tcpestats-tcp_estats_type">TCP_ESTATS_TYPE</a> enumeration type defined in the <i>Tcpestats.h</i> header file. 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TcpConnectionEstatsData"></a><a id="tcpconnectionestatsdata"></a><a id="TCPCONNECTIONESTATSDATA"></a><dl>
     * <dt><b>TcpConnectionEstatsData</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This value specifies extended data transfer information for a TCP connection. 
     * 
     * When this value is specified, the buffer pointed to by the <i>Rw</i> parameter should point to a <a href="https://docs.microsoft.com/windows/desktop/api/tcpestats/ns-tcpestats-tcp_estats_data_rw_v0">TCP_ESTATS_DATA_RW_v0</a> structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TcpConnectionEstatsSndCong"></a><a id="tcpconnectionestatssndcong"></a><a id="TCPCONNECTIONESTATSSNDCONG"></a><dl>
     * <dt><b>TcpConnectionEstatsSndCong</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This value specifies sender congestion for a TCP connection. 
     * 
     * When this value is specified, the buffer pointed to by the <i>Rw</i> parameter should point to a <a href="https://docs.microsoft.com/windows/desktop/api/tcpestats/ns-tcpestats-tcp_estats_snd_cong_rw_v0">TCP_ESTATS_SND_CONG_RW_v0</a> structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TcpConnectionEstatsPath"></a><a id="tcpconnectionestatspath"></a><a id="TCPCONNECTIONESTATSPATH"></a><dl>
     * <dt><b>TcpConnectionEstatsPath</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This value specifies extended path measurement information for a TCP connection.
     * 
     * When this value is specified, the buffer pointed to by the <i>Rw</i> parameter should point to a <a href="https://docs.microsoft.com/windows/desktop/api/tcpestats/ns-tcpestats-tcp_estats_path_rw_v0">TCP_ESTATS_PATH_RW_v0</a> structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TcpConnectionEstatsSendBuff"></a><a id="tcpconnectionestatssendbuff"></a><a id="TCPCONNECTIONESTATSSENDBUFF"></a><dl>
     * <dt><b>TcpConnectionEstatsSendBuff</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This value specifies extended output-queuing information for a TCP connection.
     * 
     * When this value is specified, the buffer pointed to by the <i>Rw</i> parameter should point to a <a href="https://docs.microsoft.com/windows/desktop/api/tcpestats/ns-tcpestats-tcp_estats_send_buff_rw_v0">TCP_ESTATS_SEND_BUFF_RW_v0</a> structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TcpConnectionEstatsRec"></a><a id="tcpconnectionestatsrec"></a><a id="TCPCONNECTIONESTATSREC"></a><dl>
     * <dt><b>TcpConnectionEstatsRec</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This value specifies extended local-receiver information for a TCP connection.
     * 
     * When this value is specified, the buffer pointed to by the <i>Rw</i> parameter should point to a <a href="https://docs.microsoft.com/windows/desktop/api/tcpestats/ns-tcpestats-tcp_estats_rec_rw_v0">TCP_ESTATS_REC_RW_v0</a> structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TcpConnectionEstatsObsRec"></a><a id="tcpconnectionestatsobsrec"></a><a id="TCPCONNECTIONESTATSOBSREC"></a><dl>
     * <dt><b>TcpConnectionEstatsObsRec</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This value specifies extended remote-receiver information for a TCP connection.
     * 
     * When this value is specified, the buffer pointed to by the <i>Rw</i> parameter should point to a <a href="https://docs.microsoft.com/windows/desktop/api/tcpestats/ns-tcpestats-tcp_estats_obs_rec_rw_v0">TCP_ESTATS_OBS_REC_RW_v0</a> structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TcpConnectionEstatsBandwidth"></a><a id="tcpconnectionestatsbandwidth"></a><a id="TCPCONNECTIONESTATSBANDWIDTH"></a><dl>
     * <dt><b>TcpConnectionEstatsBandwidth</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This value specifies bandwidth estimation statistics for a TCP connection on bandwidth.
     * 
     * When this value is specified, the buffer pointed to by the <i>Rw</i> parameter should point to a <a href="https://docs.microsoft.com/windows/desktop/api/tcpestats/ns-tcpestats-tcp_estats_bandwidth_rw_v0">TCP_ESTATS_BANDWIDTH_RW_v0</a> structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TcpConnectionEstatsFineRtt"></a><a id="tcpconnectionestatsfinertt"></a><a id="TCPCONNECTIONESTATSFINERTT"></a><dl>
     * <dt><b>TcpConnectionEstatsFineRtt</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This value specifies fine-grained round-trip time (RTT) estimation statistics for a TCP connection.
     * 
     * When this value is specified, the buffer pointed to by the <i>Rw</i> parameter should point to a <a href="https://docs.microsoft.com/windows/desktop/api/tcpestats/ns-tcpestats-tcp_estats_fine_rtt_rw_v0">TCP_ESTATS_FINE_RTT_RW_v0</a> structure.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Byte>} Rw A pointer to a buffer that contains the read/write information to set. The buffer should contain a value from the <a href="https://docs.microsoft.com/windows/desktop/api/tcpestats/ne-tcpestats-tcp_boolean_optional">TCP_BOOLEAN_OPTIONAL</a> enumeration for each structure member that specifies how each member should be updated.
     * @param {Integer} RwVersion The version of the read/write information to be set. This parameter should be set to zero for Windows Vista, Windows Server 2008, and Windows 7.
     * @param {Integer} RwSize The size, in bytes, of the buffer pointed to by the <i>Rw</i> parameter.
     * @param {Integer} Offset The offset, in bytes, to the member in the structure pointed to by the <i>Rw</i> parameter to be set.  This parameter is currently unused and must be set to zero.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
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
     * Access is denied. This error is returned under several conditions that include the following: the  user lacks the required administrative privileges on the local computer or the application is not running in an enhanced shell as the built-in Administrator (RunAs administrator).  
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
     * The parameter is incorrect. This error is returned if the <i>Row</i> parameter is a <b>NULL</b> pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_USER_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The supplied user buffer is not valid for the requested operation. This error is returned if the <i>Row</i> parameter is a <b>NULL</b> pointer and the <i>RwSize</i> parameter is nonzero.
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
     * This requested entry was not found. This error is returned if the TCP connection specified in the <i>Row</i> parameter could not be found.
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
     * The request is not supported. This error is returned if the <i>RwVersion</i> or the <i>Offset</i> parameter is not set to 0.
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-setpertcp6connectionestats
     * @since windows6.0.6000
     */
    static SetPerTcp6ConnectionEStats(Row, EstatsType, Rw, RwVersion, RwSize, Offset) {
        result := DllCall("IPHLPAPI.dll\SetPerTcp6ConnectionEStats", "ptr", Row, "int", EstatsType, "ptr", Rw, "uint", RwVersion, "uint", RwSize, "uint", Offset, "uint")
        return result
    }

    /**
     * Retrieves data about the module that issued the context bind for a specific IPv6 TCP endpoint in a MIB table row.
     * @remarks
     * The <i>Buffer</i> parameter contains not only a structure with pointers to specific data,  for example, pointers to the zero-terminated strings that contain the name and path of the owner module, but the actual data itself; that is the name and path strings. Therefore, when calculating the size of the buffer, ensure that you have enough space for both the structure as well as the data the members of the structure point to.
     * 
     * The resolution of TCP table entries to owner modules is a best practice. In a few cases, the owner module name returned in the <a href="https://docs.microsoft.com/windows/desktop/api/iprtrmib/ns-iprtrmib-tcpip_owner_module_basic_info">TCPIP_OWNER_MODULE_BASIC_INFO</a> structure can be a process name (such as "svchost.exe"), a service name (such as "RPC"), or a component name (such as "timer.dll").
     * 
     * For computers running on Windows Vista or later, the <b>pModuleName</b> and <b>pModulePath</b> members of the <a href="https://docs.microsoft.com/windows/desktop/api/iprtrmib/ns-iprtrmib-tcpip_owner_module_basic_info">TCPIP_OWNER_MODULE_BASIC_INFO</a> retrieved by  <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getownermodulefromtcpentry">GetOwnerModuleFromTcpEntry</a> function may point to an empty string for some TCP connections. Applications that start TCP connections located in the Windows system folder (C:\Windows\System32, by default) are considered protected. If the <b>GetOwnerModuleFromTcpEntry</b> function is called by a user that is not a member of the Administrators group, the function call will succeed but the <b>pModuleName</b> and <b>pModulePath</b> members will point to memory that contains an empty string for the TCP connections started by protected applications. 
     * 
     * For computers running on Windows Vista or later, accessing the <b>pModuleName</b> and <b>pModulePath</b> members of the <a href="https://docs.microsoft.com/windows/desktop/api/iprtrmib/ns-iprtrmib-tcpip_owner_module_basic_info">TCPIP_OWNER_MODULE_BASIC_INFO</a> structure is limited  by user account control (UAC). If an application that calls this function is executed by a user logged on as a member of the Administrators group other than the built-in Administrator, this call will succeed but access to these members returns an empty string unless the application has been marked in the manifest file with a <b>requestedExecutionLevel</b> set to requireAdministrator. If the application on Windows Vista or later lacks this manifest file, a user logged on as a member of the Administrators group other than the built-in Administrator must then be executing the application in an enhanced shell as the built-in Administrator (RunAs administrator) for access to the protected <b>pModuleName</b> and <b>pModulePath</b> members to be allowed.
     * @param {Pointer<MIB_TCP6ROW_OWNER_MODULE>} pTcpEntry A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/tcpmib/ns-tcpmib-mib_tcp6row_owner_module">MIB_TCP6ROW_OWNER_MODULE</a> structure that contains the IPv6 TCP endpoint entry used to obtain the owner module.
     * @param {Integer} Class A <a href="https://docs.microsoft.com/windows/desktop/api/iprtrmib/ne-iprtrmib-tcpip_owner_module_info_class">TCPIP_OWNER_MODULE_INFO_CLASS</a> enumeration value that indicates the type of data to obtain regarding the owner module. The <b>TCPIP_OWNER_MODULE_INFO_CLASS</b> enumeration is defined in the <i>Iprtrmib.h</i> header file.
     * 
     *  This parameter must be set to <b>TCPIP_OWNER_MODULE_INFO_BASIC</b>.
     * @param {Pointer<Void>} pBuffer A pointer to a buffer that contains a <a href="https://docs.microsoft.com/windows/desktop/api/iprtrmib/ns-iprtrmib-tcpip_owner_module_basic_info">TCPIP_OWNER_MODULE_BASIC_INFO</a> structure with the owner module data. The type of data returned in this buffer is indicated by the value of the <i>Class</i> parameter.
     * 
     * The following structures are used for the data in <i>Buffer</i> when  <i>Class</i> is set to the corresponding value.
     * 
     * <table>
     * <tr>
     * <th><i>Class</i> enumeration value</th>
     * <th><i>Buffer</i> data format</th>
     * </tr>
     * <tr>
     * <td>TCPIP_OWNER_MODULE_BASIC_INFO</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/iprtrmib/ns-iprtrmib-tcpip_owner_module_basic_info">TCPIP_OWNER_MODULE_BASIC_INFO</a>
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<UInt32>} pdwSize The estimated size of the structure returned in <i>Buffer</i>, in bytes. If this value is set too small, <b>ERROR_INSUFFICIENT_BUFFER</b> is returned by this function, and this field will contain the correct structure size.
     * @returns {Integer} If the function call is successful, the value <b>NO_ERROR</b> is returned. 
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient space was allocated for the table. The size of the table is returned in the <i>pdwSize</i> parameter, and must be used in a subsequent call to this function in order to successfully retrieve the table.
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
     * A parameter is incorrect. This value is returned if either of the <i>pTcpEntry</i> or <i>pdwSize</i> parameters are <b>NULL</b>. This value is also returned if the <i>Class</i> parameter is not equal to <b>TCPIP_OWNER_MODULE_INFO_BASIC</b>. 
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
     * Not enough memory is available to complete the operation.
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
     * The element was not found. This value is returned if the  <b>dwOwningPid</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/tcpmib/ns-tcpmib-mib_tcp6row_owner_module">MIB_TCP6ROW_OWNER_MODULE</a> pointed to by the <i>pTcpEntry</i> parameter was zero or could not be found. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_PARTIAL_COPY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Only part of a request was completed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-getownermodulefromtcp6entry
     * @since windows6.0.6000
     */
    static GetOwnerModuleFromTcp6Entry(pTcpEntry, Class, pBuffer, pdwSize) {
        result := DllCall("IPHLPAPI.dll\GetOwnerModuleFromTcp6Entry", "ptr", pTcpEntry, "int", Class, "ptr", pBuffer, "ptr", pdwSize, "uint")
        return result
    }

    /**
     * Retrieves the IPv6 User Datagram Protocol (UDP) listener table.
     * @remarks
     * The <b>GetUdp6Table</b> function is defined on Windows Vista and later.
     * @param {Pointer<MIB_UDP6TABLE>} Udp6Table A pointer to a buffer that receives the IPv6 UDP listener table as a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/udpmib/ns-udpmib-mib_udp6table">MIB_UDP6TABLE</a> structure.
     * @param {Pointer<UInt32>} SizePointer On input, specifies the size in bytes of the buffer pointed to by the <i>Udp6Table</i> parameter. 
     * 
     * 
     * 
     * 
     * On output, if the buffer is not large enough to hold the returned listener table, the function sets this parameter equal to the required buffer size in bytes.
     * @param {Integer} Order A Boolean value that specifies whether the returned UDP listener table should be sorted. If this parameter is <b>TRUE</b>, the table is sorted in the order of: 
     * 
     * 
     * <ol>
     * <li>Local IPv6 address</li>
     * <li>Local scope ID</li>
     * <li>Local port</li>
     * </ol>
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer pointed to by the <i>Udp6Table</i> parameter is not large enough. The required size is returned in the <b>ULONG</b> variable pointed to by the <i>SizePointer</i> parameter.
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
     * The <i>SizePointer</i> parameter is <b>NULL</b>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getudp6table">GetUdp6Table</a> is unable to write to the memory pointed to by the <i>SizePointer</i> parameter.
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
     * This function is not supported on the operating system in use on the local system.
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-getudp6table
     * @since windows6.0.6000
     */
    static GetUdp6Table(Udp6Table, SizePointer, Order) {
        result := DllCall("IPHLPAPI.dll\GetUdp6Table", "ptr", Udp6Table, "ptr", SizePointer, "int", Order, "uint")
        return result
    }

    /**
     * Retrieves data about the module that issued the context bind for a specific IPv6 UDP endpoint in a MIB table row.
     * @remarks
     * The <i>Buffer</i> parameter contains not only a structure with pointers to specific data, for example, pointers to the zero-terminated strings that contain the name and path of the owner module, but the actual data itself; that is the name and path strings. Therefore, when calculating the buffer size, ensure that you have enough space for both the structure as well as the data the members of the structure point to.
     * 
     * The resolution of UDP table entries to owner modules is a best practice. In a few cases, the owner module name returned in the <a href="https://docs.microsoft.com/windows/desktop/api/iprtrmib/ns-iprtrmib-tcpip_owner_module_basic_info">TCPIP_OWNER_MODULE_BASIC_INFO</a> structure can be a process name, such as "svchost.exe", a service name, such as "RPC", or a component name, such as "timer.dll".
     * 
     * For computers running on Windows Vista or later, accessing the <b>pModuleName</b> and <b>pModulePath</b> members of the <a href="https://docs.microsoft.com/windows/desktop/api/iprtrmib/ns-iprtrmib-tcpip_owner_module_basic_info">TCPIP_OWNER_MODULE_BASIC_INFO</a> structure is limited  by user account control (UAC). If an application that calls this function is executed by a user logged on as a member of the Administrators group other than the built-in Administrator, this call will succeed but access to these members returns an empty string unless the application has been marked in the manifest file with a <b>requestedExecutionLevel</b> set to requireAdministrator. If the application on Windows Vista or later lacks this manifest file, a user logged on as a member of the Administrators group other than the built-in Administrator must then be executing the application in an enhanced shell as the built-in Administrator (RunAs administrator) for access to the protected <b>pModuleName</b> and <b>pModulePath</b> members to be allowed.
     * @param {Pointer<MIB_UDP6ROW_OWNER_MODULE>} pUdpEntry A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/udpmib/ns-udpmib-mib_udp6row_owner_module">MIB_UDP6ROW_OWNER_MODULE</a> structure that contains the IPv6 UDP endpoint entry used to obtain the owner module.
     * @param {Integer} Class <a href="https://docs.microsoft.com/windows/desktop/api/iprtrmib/ne-iprtrmib-tcpip_owner_module_info_class">TCPIP_OWNER_MODULE_INFO_CLASS</a> enumeration value that indicates the type of data to obtain regarding the owner module.
     * @param {Pointer<Void>} pBuffer The buffer that contains a <a href="https://docs.microsoft.com/windows/desktop/api/iprtrmib/ns-iprtrmib-tcpip_owner_module_basic_info">TCPIP_OWNER_MODULE_BASIC_INFO</a> structure with the owner module data. The type of data returned in this buffer is indicated by the value of the <i>Class</i> parameter.
     * 
     * The following structures are used for the data in <i>Buffer</i> when  <i>Class</i> is set to the corresponding value.
     * 
     * <table>
     * <tr>
     * <th><i>Class</i> enumeration value</th>
     * <th><i>Buffer</i> data format</th>
     * </tr>
     * <tr>
     * <td>TCPIP_OWNER_MODULE_BASIC_INFO</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/iprtrmib/ns-iprtrmib-tcpip_owner_module_basic_info">TCPIP_OWNER_MODULE_BASIC_INFO</a>
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<UInt32>} pdwSize The estimated size, in bytes, of the structure returned in <i>Buffer</i>. If this value is set too small, <b>ERROR_INSUFFICIENT_BUFFER</b> is returned by this function, and this field will contain the correct size of the structure.
     * @returns {Integer} If the call is successful, the value <b>NO_ERROR</b> is returned. Otherwise, the following error is returned.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An insufficient amount of space was allocated for the table. The size of the table is returned in the <i>pdwSize</i> parameter, and must be used in a subsequent call to this function in order to successfully retrieve the table.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-getownermodulefromudp6entry
     * @since windows6.0.6000
     */
    static GetOwnerModuleFromUdp6Entry(pUdpEntry, Class, pBuffer, pdwSize) {
        result := DllCall("IPHLPAPI.dll\GetOwnerModuleFromUdp6Entry", "ptr", pUdpEntry, "int", Class, "ptr", pBuffer, "ptr", pdwSize, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} ulPid 
     * @param {Pointer<UInt64>} pInfo 
     * @param {Integer} Class 
     * @param {Pointer<Void>} pBuffer 
     * @param {Pointer<UInt32>} pdwSize 
     * @returns {Integer} 
     */
    static GetOwnerModuleFromPidAndInfo(ulPid, pInfo, Class, pBuffer, pdwSize) {
        result := DllCall("IPHLPAPI.dll\GetOwnerModuleFromPidAndInfo", "uint", ulPid, "ptr", pInfo, "int", Class, "ptr", pBuffer, "ptr", pdwSize, "uint")
        return result
    }

    /**
     * The GetIpStatistics function retrieves the IP statistics for the current computer.
     * @remarks
     * The 
     * <b>GetIpStatistics</b> function returns the statistics for IPv4 on the current computer.     On Windows XP and later, the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getipstatisticsex">GetIpStatisticsEx</a> can be used to obtain the IP statistics for either IPv4 or IPv6.
     * @param {Pointer<MIB_IPSTATS_LH>} Statistics A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipstats_lh">MIB_IPSTATS</a> structure that receives the IP statistics for the local computer.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
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
     * The <i>pStats</i> parameter is <b>NULL</b>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getipstatistics">GetIpStatistics</a> is unable to write to the memory pointed to by the <i>pStats</i> parameter.
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
     * Use 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-getipstatistics
     * @since windows5.0
     */
    static GetIpStatistics(Statistics) {
        result := DllCall("IPHLPAPI.dll\GetIpStatistics", "ptr", Statistics, "uint")
        return result
    }

    /**
     * The GetIcmpStatistics function retrieves the Internet Control Message Protocol (ICMP) for IPv4 statistics for the local computer.
     * @remarks
     * The 
     * <b>GetIcmpStatistics</b> function returns the ICMP statistics for IPv4 on the local computer.     On Windows XP and later, the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getipstatisticsex">GetIpStatisticsEx</a> can be used to obtain the ICMP statistics for either IPv4 or IPv6 on the local computer.
     * @param {Pointer<MIB_ICMP>} Statistics A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_icmp">MIB_ICMP</a> structure that receives the ICMP statistics for the local computer.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
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
     * The <i>pStats</i> parameter is <b>NULL</b>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-geticmpstatistics">GetIcmpStatistics</a> is unable to write to the memory pointed to by the <i>pStats</i> parameter.
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
     * Use 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-geticmpstatistics
     * @since windows5.0
     */
    static GetIcmpStatistics(Statistics) {
        result := DllCall("IPHLPAPI.dll\GetIcmpStatistics", "ptr", Statistics, "uint")
        return result
    }

    /**
     * The GetTcpStatistics function retrieves the TCP statistics for the local computer.
     * @remarks
     * The 
     * <b>GetTcpStatistics</b> function returns the TCP statistics for IPv4 on the current computer.     On Windows XP and later, the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-gettcpstatisticsex">GetTcpStatisticsEx</a> can be used to obtain the TCP statistics for either IPv4 or IPv6.
     * @param {Pointer<MIB_TCPSTATS_LH>} Statistics A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tcpmib/ns-tcpmib-mib_tcpstats_lh">MIB_TCPSTATS</a> structure that receives the TCP statistics for the local computer.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
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
     * The <i>pStats</i> parameter is <b>NULL</b>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-gettcpstatistics">GetTcpStatistics</a> is unable to write to the memory pointed to by the <i>pStats</i> parameter.
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
     * Use 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-gettcpstatistics
     * @since windows5.0
     */
    static GetTcpStatistics(Statistics) {
        result := DllCall("IPHLPAPI.dll\GetTcpStatistics", "ptr", Statistics, "uint")
        return result
    }

    /**
     * The GetUdpStatistics function retrieves the User Datagram Protocol (UDP) statistics for the local computer.
     * @remarks
     * <b>Windows Server 2003 and Windows XP:  </b>Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getudpstatisticsex">GetUdpStatisticsEx</a> function to obtain the UDP statistics for the IPv6 protocol.
     * @param {Pointer<MIB_UDPSTATS>} Stats Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/udpmib/ns-udpmib-mib_udpstats">MIB_UDPSTATS</a> structure that receives the UDP statistics for the local computer.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-getudpstatistics
     * @since windows5.0
     */
    static GetUdpStatistics(Stats) {
        result := DllCall("IPHLPAPI.dll\GetUdpStatistics", "ptr", Stats, "uint")
        return result
    }

    /**
     * Toggles IP forwarding on or off and sets the default time-to-live (TTL) value for the local computer.
     * @remarks
     * To set only the default TTL, the caller can also use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-setipttl">SetIpTTL</a> function.
     * 
     * The <b>SetIpStatisticsEx</b> function can only be called by a user logged on as a member of the Administrators group. If <b>SetIpStatisticsEx</b> is called by a user that is not a member of the Administrators group, the function call will fail and <b>ERROR_ACCESS_DENIED</b> is returned. 
     * 
     * The <b>SetIpStatisticsEx</b> function can also fail because of user account control (UAC) on Windows Vista and later. If an application that contains this function is executed by a user logged on as a member of the Administrators group other than the built-in Administrator, this call will fail unless the application has been marked in the manifest file with a <b>requestedExecutionLevel</b> set to requireAdministrator. If the application on lacks this manifest file, a user logged on as a member of the Administrators group other than the built-in Administrator must then be executing the application in an enhanced shell as the built-in Administrator (RunAs administrator) for this function to succeed.
     * @param {Pointer<MIB_IPSTATS_LH>} Statistics A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipstats_lh">MIB_IPSTATS</a> structure. The caller should set the <b>dwForwarding</b> and <b>dwDefaultTTL</b> members of this structure to the new values. To keep one of the members at its current value, use MIB_USE_CURRENT_TTL or MIB_USE_CURRENT_FORWARDING.
     * @param {Integer} Family The address family for which forwarding and TTL is to be set. 
     * 
     * Possible values for the address family are listed in the <i>Winsock2.h</i> header file. Note that the values for the AF_ address family and PF_ protocol family constants  are identical (for example, <b>AF_INET</b> and <b>PF_INET</b>), so either constant can be used.
     * 
     * On the Windows SDK released for Windows Vista and later, the organization of header files has changed and possible values for this member are defined in the <i>Ws2def.h</i> header file. Note that the <i>Ws2def.h</i> header file is automatically included in <i>Winsock2.h</i>, and should never be used directly.
     * 
     * The values currently supported are <b>AF_INET</b>, and <b>AF_INET6</b>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AF_INET"></a><a id="af_inet"></a><dl>
     * <dt><b>AF_INET</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Internet Protocol version 4 (IPv4) address family. When this parameter is specified,  this function  sets forwarding and TTL options for IPv4 entries. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AF_INET6"></a><a id="af_inet6"></a><dl>
     * <dt><b>AF_INET6</b></dt>
     * <dt>23</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Internet Protocol version 6 (IPv6) address family. When this parameter is specified,  this function  sets forwarding and TTL options for IPv6 entries. 
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
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
     * Access is denied. This error is returned under several conditions that include the following: the  user lacks the required administrative privileges on the local computer or the application is not running in an enhanced shell as the built-in Administrator (RunAs administrator).  
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
     * An invalid parameter was passed to the function. This error is returned if a <b>NULL</b> pointer is passed in the <i>pIpStats</i> parameter or the <i>Family</i> parameter was not set to <b>AF_INET</b>, and <b>AF_INET6</b>. This error is also returned if the <b>dwForwarding</b> member in the <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipstats_lh">MIB_IPSTATS</a> structure pointed to by the <i>pIpStats</i> parameter contains a value other than <b>MIB_IP_NOT_FORWARDING</b>, <b>MIB_IP_FORWARDING</b>, or <b>MIB_USE_CURRENT_FORWARDING</b>.
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
     * The request is not supported. This error is returned if no IPv4 stack is on the local computer and AF_INET was specified in the <i>Family</i> parameter or no IPv6 stack is on the local computer and AF_INET6 was specified in the <i>Family</i> member.
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-setipstatisticsex
     * @since windows6.0.6000
     */
    static SetIpStatisticsEx(Statistics, Family) {
        result := DllCall("IPHLPAPI.dll\SetIpStatisticsEx", "ptr", Statistics, "uint", Family, "uint")
        return result
    }

    /**
     * The GetIpStatisticsEx function retrieves the Internet Protocol (IP) statistics for the current computer.
     * @remarks
     * The <b>GetIpStatisticsEx</b> can be used to obtain the IP statistics for either IPv4 or IPv6 on the local computer. 
     * 
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getipstatistics">GetIpStatistics</a> function returns the statistics for only IPv4 on the local computer.
     * @param {Pointer<MIB_IPSTATS_LH>} Statistics A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipstats_lh">MIB_IPSTATS</a> structure that receives the IP statistics for the local computer.
     * @param {Integer} Family 
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
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
     * The <i>pStats</i> parameter is <b>NULL</b> or does not point to valid memory, or the <i>dwFamily</i> parameter is not a valid value.
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
     * This function is not supported on the operating system on which the function call was made.
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-getipstatisticsex
     * @since windows5.1.2600
     */
    static GetIpStatisticsEx(Statistics, Family) {
        result := DllCall("IPHLPAPI.dll\GetIpStatisticsEx", "ptr", Statistics, "uint", Family, "uint")
        return result
    }

    /**
     * The GetIcmpStatisticsEx function retrieves Internet Control Message Protocol (ICMP) statistics for the local computer. The GetIcmpStatisticsEx function is capable of retrieving IPv6 ICMP statistics.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getipstatisticsex">GetIpStatisticsEx</a> can be used to obtain the ICMP statistics for either IPv4 or IPv6 on the local computer. 
     * 
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-geticmpstatistics">GetIcmpStatistics</a> function returns the ICMP statistics for only IPv4 on the local computer.
     * @param {Pointer<MIB_ICMP_EX_XPSP1>} Statistics A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_icmp_ex_xpsp1">MIB_ICMP_EX</a> structure that contains ICMP statistics for the local computer.
     * @param {Integer} Family The protocol family for which to retrieve ICMP statistics. Must be one of the following: 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AF_INET"></a><a id="af_inet"></a><dl>
     * <dt><b>AF_INET</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Internet Protocol version 4 (IPv4).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AF_INET6"></a><a id="af_inet6"></a><dl>
     * <dt><b>AF_INET6</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Internet Protocol version 6 (IPv6).
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
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
     * The <i>pStats</i> parameter is <b>NULL</b> or does not point to valid memory, or the <i>dwFamily</i> parameter is not a valid value.
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
     * This function is not supported on the operating system on which the function call was made.
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-geticmpstatisticsex
     * @since windows5.1.2600
     */
    static GetIcmpStatisticsEx(Statistics, Family) {
        result := DllCall("IPHLPAPI.dll\GetIcmpStatisticsEx", "ptr", Statistics, "uint", Family, "uint")
        return result
    }

    /**
     * The GetTcpStatisticsEx function retrieves the Transmission Control Protocol (TCP) statistics for the current computer.
     * @param {Pointer<MIB_TCPSTATS_LH>} Statistics A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tcpmib/ns-tcpmib-mib_tcpstats_lh">MIB_TCPSTATS</a> structure that receives the TCP statistics for the local computer.
     * @param {Integer} Family 
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
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
     * The <i>pStats</i> parameter is <b>NULL</b> or does not point to valid memory, or the <i>dwFamily</i> parameter is not a valid value.
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
     * This function is not supported on the operating system on which the function call was made.
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-gettcpstatisticsex
     * @since windows5.1.2600
     */
    static GetTcpStatisticsEx(Statistics, Family) {
        result := DllCall("IPHLPAPI.dll\GetTcpStatisticsEx", "ptr", Statistics, "uint", Family, "uint")
        return result
    }

    /**
     * The GetUdpStatisticsEx function retrieves the User Datagram Protocol (UDP) statistics for the current computer.
     * @param {Pointer<MIB_UDPSTATS>} Statistics A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/udpmib/ns-udpmib-mib_udpstats">MIB_UDPSTATS</a> structure that receives the UDP statistics for the local computer.
     * @param {Integer} Family 
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
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
     * The <i>pStats</i> parameter is <b>NULL</b> or does not point to valid memory, or the <i>dwFamily</i> parameter is not a valid value.
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
     * This function is not supported on the operating system on which the function call was made.
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-getudpstatisticsex
     * @since windows5.1.2600
     */
    static GetUdpStatisticsEx(Statistics, Family) {
        result := DllCall("IPHLPAPI.dll\GetUdpStatisticsEx", "ptr", Statistics, "uint", Family, "uint")
        return result
    }

    /**
     * The GetTcpStatisticsEx2 function retrieves the Transmission Control Protocol (TCP) statistics for the current computer.
     * @param {Pointer<MIB_TCPSTATS2>} Statistics A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tcpmib/ns-tcpmib-mib_tcpstats_lh">MIB_TCPSTATS2</a> structure that receives the TCP statistics for the local computer.
     * @param {Integer} Family 
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
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
     * The <i>pStats</i> parameter is <b>NULL</b> or does not point to valid memory, or the <i>dwFamily</i> parameter is not a valid value.
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
     * This function is not supported on the operating system on which the function call was made.
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-gettcpstatisticsex2
     * @since windows10.0.16299
     */
    static GetTcpStatisticsEx2(Statistics, Family) {
        result := DllCall("IPHLPAPI.dll\GetTcpStatisticsEx2", "ptr", Statistics, "uint", Family, "uint")
        return result
    }

    /**
     * The GetUdpStatisticsEx2 function retrieves the User Datagram Protocol (UDP) statistics for the current computer.
     * @param {Pointer<MIB_UDPSTATS2>} Statistics A pointer to a 
     * <a href="../udpmib/ns-udpmib-mib_udpstats2.md">MIB_UDPSTATS2</a> structure that receives the UDP statistics for the local computer.
     * @param {Integer} Family 
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
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
     * The <i>Statistics</i> parameter is <b>NULL</b> or does not point to valid memory, or the <i>Family</i> parameter is not a valid value.
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
     * This function is not supported on the operating system on which the function call was made.
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-getudpstatisticsex2
     * @since windows10.0.16299
     */
    static GetUdpStatisticsEx2(Statistics, Family) {
        result := DllCall("IPHLPAPI.dll\GetUdpStatisticsEx2", "ptr", Statistics, "uint", Family, "uint")
        return result
    }

    /**
     * The SetIfEntry function sets the administrative status of an interface.
     * @remarks
     * The <b>SetIfEntry</b> function is used to set the administrative status of an interface on a local computer. 
     * 
     * The <b>dwIndex</b> member in the <a href="https://docs.microsoft.com/windows/desktop/api/ifmib/ns-ifmib-mib_ifrow">MIB_IFROW</a> structure pointed to by the <i>pIfRow</i> parameter must be initialized to the interface index.
     * 
     * 
     * The <b>SetIfEntry</b> function will fail if the  <b>dwIndex</b>  member of the <a href="https://docs.microsoft.com/windows/desktop/api/ifmib/ns-ifmib-mib_ifrow">MIB_IFROW</a> pointed to by the <i>pIfRow</i> parameter does not match an existing interface on the local computer. 
     * 
     * On Windows Vista and later, the <b>SetIfEntry</b> function can only be called by a user logged on as a member of the Administrators group. If <b>SetIfEntry</b> is called by a user that is not a member of the Administrators group, the function call will fail and <b>ERROR_ACCESS_DENIED</b> is returned. 
     * 
     * The <b>SetIfEntry</b> function can also fail because of user account control (UAC) on Windows Vista and later. If an application that contains this function is executed by a user logged on as a member of the Administrators group other than the built-in Administrator, this call will fail unless the application has been marked in the manifest file with a <b>requestedExecutionLevel</b> set to requireAdministrator. If the application lacks this manifest file, a user logged on as a member of the Administrators group other than the built-in Administrator must then be executing the application in an enhanced shell as the built-in Administrator (RunAs administrator) for this function to succeed.
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>   On Windows NT 4.0 and Windows 2000 and later, this function executes a privileged operation. For this function to execute successfully, the caller must be logged on as a member of the Administrators group or the NetworkConfigurationOperators group.</div>
     * <div> </div>
     * @param {Pointer<MIB_IFROW>} pIfRow A pointer to a
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
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
     * Access is denied. This error is returned on Windows Vista and later under several conditions that include the following: the  user lacks the required administrative privileges on the local computer or the application is not running in an enhanced shell as the built-in Administrator (RunAs administrator).  
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
     * The system cannot find the file specified. This error is returned on Windows Vista and later if the  network interface specified by the <b>dwIndex</b>  member of the <a href="https://docs.microsoft.com/windows/desktop/api/ifmib/ns-ifmib-mib_ifrow">MIB_IFROW</a> structure pointed to by the <i>pIfRow</i> parameter could not be found.
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
     * An invalid parameter was passed to the function. This error is returned if a <b>NULL</b> pointer is passed in the <i>pIfRow</i> parameter, or the <b>dwIndex</b>  member of the <a href="https://docs.microsoft.com/windows/desktop/api/ifmib/ns-ifmib-mib_ifrow">MIB_IFROW</a> pointed to by the <i>pIfRow</i> parameter was unspecified. This error is also returned on Windows Server 2003 and earlier if the  network interface specified by the <b>dwIndex</b>  member of the <b>MIB_IFROW</b> structure pointed to by the <i>pIfRow</i> parameter could not be found.  
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
     * The request is not supported. This error is returned on Windows Server 2003 and earlier if no TCP/IP stack is configured on the local computer.  
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-setifentry
     * @since windows5.0
     */
    static SetIfEntry(pIfRow) {
        result := DllCall("IPHLPAPI.dll\SetIfEntry", "ptr", pIfRow, "uint")
        return result
    }

    /**
     * The CreateIpForwardEntry function creates a route in the local computer's IPv4 routing table.
     * @remarks
     * The <b>dwForwardProto</b> member of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipforwardrow">MIB_IPFORWARDROW</a> structure pointed to by the <i>route</i> parameter must be set to <b>MIB_IPPROTO_NETMGMT</b> otherwise <b>CreateIpForwardEntry</b> will fail. Routing protocol identifiers are used to identify route information for the specified routing protocol. For example, <b>MIB_IPPROTO_NETMGMT</b> is used to identify route information for IP  routing set through network management such as the Dynamic Host Configuration Protocol (DHCP), the Simple Network Management Protocol (SNMP), or by calls to the <b>CreateIpForwardEntry</b>,  <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-deleteipforwardentry">DeleteIpForwardEntry</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-setipforwardentry">SetIpForwardEntry</a> functions.
     * 
     * On Windows Vista and Windows Server 2008, the route metric specified in the <b>dwForwardMetric1</b> member of the  <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipforwardrow">MIB_IPFORWARDROW</a> structure pointed to by <i>pRoute</i> parameter represents a combination of the route metric added to the interface metric specified in the <b>Metric</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipinterface_row">MIB_IPINTERFACE_ROW</a> structure of the associated interface.  So the <b>dwForwardMetric1</b> member of the  <b>MIB_IPFORWARDROW</b> structure should be equal to or greater than <b>Metric</b> member of the associated <b>MIB_IPINTERFACE_ROW</b> structure. If an application would like to set the route metric to 0, then the <b>dwForwardMetric1</b> member of the <b>MIB_IPFORWARDROW</b> structure  should be set equal to the value of the interface metric specified in the <b>Metric</b> member of the associated <b>MIB_IPINTERFACE_ROW</b> structure. An application can retrieve the interface metric by calling the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-getipinterfaceentry">GetIpInterfaceEntry</a> function.
     * 
     * On Windows Vista and Windows Server 2008, the <b>CreateIpForwardEntry</b> only works on interfaces with a single sub-interface (where the interface LUID and subinterface LUID are the same). The <b>dwForwardIfIndex</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipforwardrow">MIB_IPFORWARDROW</a> structure specifies the interface.
     * 
     * A number of members of the <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipforwardrow">MIB_IPFORWARDROW</a> structure  pointed to by the <i>route</i> parameter are not currently used by <b>CreateIpForwardEntry</b>. These members include <b>dwForwardPolicy</b>, <b>dwForwardType</b>, <b>dwForwardAge</b>, <b>dwForwardNextHopAS</b>, <b>dwForwardMetric2</b>, <b>dwForwardMetric3</b>, <b>dwForwardMetric4</b>, and <b>dwForwardMetric5</b>. 
     * 
     * A new route created by <b>CreateIpForwardEntry</b> will automatically have a default value for <b>dwForwardAge</b> of INFINITE.
     * 
     * To modify an existing route in the IPv4 routing table, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-setipforwardentry">SetIpForwardEntry</a> function. To retrieve the IPv4 routing table, call the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getipforwardtable">GetIpForwardTable</a> function.
     * 
     * On Windows Vista and later, the <b>CreateIpForwardEntry</b> function can only be called by a user logged on as a member of the Administrators group. If <b>CreateIpForwardEntry</b> is called by a user that is not a member of the Administrators group, the function call will fail and <b>ERROR_ACCESS_DENIED</b> is returned. 
     * 
     * The <b>CreateIpForwardEntry</b> function can also fail because of user account control (UAC) on Windows Vista and later. If an application that contains this function is executed by a user logged on as a member of the Administrators group other than the built-in Administrator, this call will fail unless the application has been marked in the manifest file with a <b>requestedExecutionLevel</b> set to requireAdministrator. If the application lacks this manifest file, a user logged on as a member of the Administrators group other than the built-in Administrator must then be executing the application in an enhanced shell as the built-in Administrator (RunAs administrator) for this function to succeed.
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  On Windows NT 4.0 and Windows 2000 and later, this function executes a privileged operation. For this function to execute successfully, the caller must be logged on as a member of the Administrators group or the NetworkConfigurationOperators group.</div>
     * <div> </div>
     * @param {Pointer<MIB_IPFORWARDROW>} pRoute A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipforwardrow">MIB_IPFORWARDROW</a> structure that specifies the information for the new route. The caller must specify values for all members of this structure. The caller must specify <b>MIB_IPPROTO_NETMGMT</b> for the <b>dwForwardProto</b> member of 
     * <b>MIB_IPFORWARDROW</b>.
     * @returns {Integer} The function returns <b>NO_ERROR</b> (zero) if the function is successful. 
     * 
     * If the function fails, the return value is one of the following error codes.
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
     * Access is denied. This error is returned on Windows Vista and Windows Server 2008 under several conditions that include the following: the  user lacks the required administrative privileges on the local computer or the application is not running in an enhanced shell as the built-in Administrator (RunAs administrator).  
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
     * An input parameter is invalid, no action was taken. This error is returned if the <i>pRoute</i> parameter is <b>NULL</b>,  the  <b>dwForwardProto</b> member of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipforwardrow">MIB_IPFORWARDROW</a> was not set to <b>MIB_IPPROTO_NETMGMT</b>, the <b>dwForwardMask</b> member of the <b>PMIB_IPFORWARDROW</b> structure is not a valid IPv4 subnet mask, or one of the other members of the 
     * <b>MIB_IPFORWARDROW</b> structure is invalid. 
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
     * The IPv4 transport is not configured on the local computer.
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-createipforwardentry
     * @since windows5.0
     */
    static CreateIpForwardEntry(pRoute) {
        result := DllCall("IPHLPAPI.dll\CreateIpForwardEntry", "ptr", pRoute, "uint")
        return result
    }

    /**
     * The SetIpForwardEntry function modifies an existing route in the local computer's IPv4 routing table.
     * @remarks
     * The <b>dwForwardProto</b> member of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipforwardrow">MIB_IPFORWARDROW</a> structure pointed to by the <i>route</i> parameter must be set to <b>MIB_IPPROTO_NETMGMT</b> otherwise <b>SetIpForwardEntry</b> will fail. Routing protocol identifiers are used to identify route information for the specified routing protocol. For example, <b>MIB_IPPROTO_NETMGMT</b> is used to identify route information for IP  routing set through network management such as the Dynamic Host Configuration Protocol (DHCP), the Simple Network Management Protocol (SNMP), or by calls to the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-createipforwardentry">CreateIpForwardEntry</a>,  <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-deleteipforwardentry">DeleteIpForwardEntry</a>, or <b>SetIpForwardEntry</b> functions.
     * 
     * On Windows Vista and Windows Server 2008, the route metric specified in the <b>dwForwardMetric1</b> member of the  <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipforwardrow">MIB_IPFORWARDROW</a> structure pointed to by <i>pRoute</i> parameter represents a combination of the route metric added to the interface metric specified in the <b>Metric</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipinterface_row">MIB_IPINTERFACE_ROW</a> structure of the associated interface.  So the <b>dwForwardMetric1</b> member of the  <b>MIB_IPFORWARDROW</b> structure should be equal to or greater than <b>Metric</b> member of the associated <b>MIB_IPINTERFACE_ROW</b> structure. If an application would like to set the route metric to 0, then the <b>dwForwardMetric1</b> member of the <b>MIB_IPFORWARDROW</b> structure  should be set equal to the value of the interface metric specified in the <b>Metric</b> member of the associated <b>MIB_IPINTERFACE_ROW</b> structure. An application can retrieve the interface metric by calling the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-getipinterfaceentry">GetIpInterfaceEntry</a> function.
     * 
     * On Windows Vista and Windows Server 2008, the <b>SetIpForwardEntry</b> function only works on interfaces with a single sub-interface (where the interface LUID and subinterface LUID are the same). The <b>dwForwardIfIndex</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipforwardrow">MIB_IPFORWARDROW</a> structure specifies the interface.
     * 
     * The <b>dwForwardAge</b> member the <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipforwardrow">MIB_IPFORWARDROW</a> structure  pointed to by the <i>route</i> parameter is not currently used by <b>SetIpForwardEntry</b>. The <b>dwForwardAge</b> member is used only if the Routing and Remote Access Service (RRAS)is running, and then only for routes of type <b>MIB_IPPROTO_NETMGMT</b> as defined on the <a href="https://docs.microsoft.com/windows/desktop/RRAS/protocol-identifiers">Protocol Identifiers</a> reference page. When <b>dwForwardAge</b> is set to <b>INFINITE</b>, the route will not be removed based on a timeout
     *  
     * value. Any other value for <b>dwForwardAge</b> specifies the number of seconds until the TCP/IP stack will remove the route from the network routing table.
     * 
     * A route modified by <b>SetIpForwardEntry</b> will automatically have a default value for <b>dwForwardAge</b> of INFINITE.
     * 
     * A number of members of the <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipforwardrow">MIB_IPFORWARDROW</a> structure  pointed to by the <i>route</i> parameter are not currently used by <b>SetIpForwardEntry</b>. These members include <b>dwForwardPolicy</b>, <b>dwForwardType</b>, <b>dwForwardAge</b>, <b>dwForwardNextHopAS</b>, <b>dwForwardMetric1</b>, <b>dwForwardMetric2</b>, <b>dwForwardMetric3</b>, <b>dwForwardMetric4</b>, and <b>dwForwardMetric5</b>. 
     * 
     * To create a new route in the IP routing table, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-createipforwardentry">CreateIpForwardEntry</a> function. To retrieve the IP routing table, call the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getipforwardtable">GetIpForwardTable</a> function.
     * 
     * On Windows Vista and later, the <b>SetIpForwardEntry</b> function can only be called by a user logged on as a member of the Administrators group. If <b>SetIpForwardEntry</b> is called by a user that is not a member of the Administrators group, the function call will fail and <b>ERROR_ACCESS_DENIED</b> is returned. 
     * 
     * This function can also fail because of user account control (UAC) on Windows Vista and later. If an application that contains this function is executed by a user logged on as a member of the Administrators group other than the built-in Administrator, this call will fail unless the application has been marked in the manifest file with a <b>requestedExecutionLevel</b> set to requireAdministrator. If the application lacks this manifest file, a user logged on as a member of the Administrators group other than the built-in Administrator must then be executing the application in an enhanced shell as the built-in Administrator (RunAs administrator) for this function to succeed.
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  On Windows NT 4.0 and Windows 2000 and later, this function executes a privileged operation. For this function to execute successfully, the caller must be logged on as a member of the Administrators group or the NetworkConfigurationOperators group.</div>
     * <div> </div>
     * @param {Pointer<MIB_IPFORWARDROW>} pRoute A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipforwardrow">MIB_IPFORWARDROW</a> structure that specifies the new information for the existing route. The caller must specify <b>MIB_IPPROTO_NETMGMT</b> for the <b>dwForwardProto</b> member of this structure. The caller must also specify values for the <b>dwForwardIfIndex</b>, <b>dwForwardDest</b>, <b>dwForwardMask</b>, <b>dwForwardNextHop</b>, and <b>dwForwardPolicy</b> members of the structure.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
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
     * Access is denied. This error is returned on Windows Vista and Windows Server 2008 under several conditions that include the following: the  user lacks the required administrative privileges on the local computer or the application is not running in an enhanced shell as the built-in Administrator (RunAs administrator).  
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
     * The system cannot find the file specified. This error is returned on Windows Vista and later if the  network interface specified by the <b>dwForwardIfIndex</b>  member of the <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipforwardrow">MIB_IPFORWARDROW</a> structure pointed to by the <i>pRoute</i> parameter could not be found.
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
     * The <i>pRoute</i> parameter is <b>NULL</b>, or <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-setipforwardentry">SetIpForwardEntry</a> is unable to read from the memory pointed to by <i>pRoute</i>, or one of the members of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipforwardrow">MIB_IPFORWARDROW</a> structure is invalid.
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
     * The element is not found. The error is returned on Windows Vista and later when the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-deleteipforwardentry">DeleteIpForwardEntry</a> function and then the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-setipforwardentry">SetIpForwardEntry</a> function are called for the same IPv4 route table entry. 
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
     * The request is not supported. This value is returned if the IPv4 transport is not configured on the local computer. This error is also returned on Windows Server 2003 and earlier if no TCP/IP stack is configured on the local computer.  
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-setipforwardentry
     * @since windows5.0
     */
    static SetIpForwardEntry(pRoute) {
        result := DllCall("IPHLPAPI.dll\SetIpForwardEntry", "ptr", pRoute, "uint")
        return result
    }

    /**
     * Deletes an existing route in the local computer's IPv4 routing table.
     * @remarks
     * The <b>dwForwardProto</b> member of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipforwardrow">MIB_IPFORWARDROW</a> structure pointer to by the <i>route</i> parameter must be set to <b>MIB_IPPROTO_NETMGMT</b> otherwise <b>DeleteIpForwardEntry</b> will fail. Routing protocol identifiers are used to identify route information for the specified routing protocol. For example, <b>MIB_IPPROTO_NETMGMT</b> is used to identify route information for IP  routing set through network management such as the Dynamic Host Configuration Protocol (DHCP), the Simple Network Management Protocol (SNMP), or by calls to the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-createipforwardentry">CreateIpForwardEntry</a>,  <b>DeleteIpForwardEntry</b> 
     * 		, or <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-setipforwardentry">SetIpForwardEntry</a> functions.
     * 
     * On Windows Vista and Windows Server 2008, the <b>DeleteIpForwardEntry</b> only works on interfaces with a single sub-interface (where the interface LUID and subinterface LUID are the same). The <b>dwForwardIfIndex</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipforwardrow">MIB_IPFORWARDROW</a> structure specifies the interface.
     * 
     * A number of members of the <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipforwardrow">MIB_IPFORWARDROW</a> structure  pointed to by the <i>route</i> parameter are not currently used by <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-createipforwardentry">CreateIpForwardEntry</a>. These members include <b>dwForwardPolicy</b>, <b>dwForwardType</b>, <b>dwForwardAge</b>, <b>dwForwardNextHopAS</b>, <b>dwForwardMetric1</b>, <b>dwForwardMetric2</b>, <b>dwForwardMetric3</b>, <b>dwForwardMetric4</b>, and <b>dwForwardMetric5</b>. 
     * 
     * To modify an existing route in the IPv4 routing table, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-setipforwardentry">SetIpForwardEntry</a> function. To retrieve the IPv4 routing table, call the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getipforwardtable">GetIpForwardTable</a> function.
     * 
     * On Windows Vista and later, the <b>DeleteIpForwardEntry</b> function can only be called by a user logged on as a member of the Administrators group. If <b>DeleteIpForwardEntry</b> is called by a user that is not a member of the Administrators group, the function call will fail and <b>ERROR_ACCESS_DENIED</b> is returned. 
     * 
     * The <b>DeleteIpForwardEntry</b> function can also fail because of user account control (UAC) on Windows Vista and later. If an application that contains this function is executed by a user logged on as a member of the Administrators group other than the built-in Administrator, this call will fail unless the application has been marked in the manifest file with a <b>requestedExecutionLevel</b> set to requireAdministrator. If the application lacks this manifest file, a user logged on as a member of the Administrators group other than the built-in Administrator must then be executing the application in an enhanced shell as the built-in Administrator (RunAs administrator) for this function to succeed.
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>   On Windows NT 4.0 and Windows 2000 and later, this function executes a privileged operation. For this function to execute successfully, the caller must be logged on as a member of the Administrators group or the NetworkConfigurationOperators group.</div>
     * <div> </div>
     * @param {Pointer<MIB_IPFORWARDROW>} pRoute A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipforwardrow">MIB_IPFORWARDROW</a> structure. This structure specifies information that identifies the route to delete. The caller must specify values for the <b>dwForwardIfIndex</b>, <b>dwForwardDest</b>, <b>dwForwardMask</b>, <b>dwForwardNextHop</b>,  and <b>dwForwardProto</b> members of the structure.
     * @returns {Integer} The function returns <b>NO_ERROR</b> (zero) if the routine is successful. 
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Error code</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Access is denied. This error is returned on Windows Vista and Windows Server 2008 under several conditions that include the following: the  user lacks the required administrative privileges on the local computer or the application is not running in an enhanced shell as the built-in Administrator (RunAs administrator).  
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An input parameter is invalid, no action was taken. This error is returned if the <b>pRoute</b> parameter is <b>NULL</b>, the <b>dwForwardMask</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipforwardrow">PMIB_IPFORWARDROW</a> structure is not a valid IPv4 subnet mask, the <b>dwForwardIfIndex</b> member is <b>NULL</b>, or one of the other members of the 
     * <b>MIB_IPFORWARDROW</b> structure is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> ERROR_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>pRoute</b> parameter points to a route entry that does not exist.
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
     * The IPv4 transport is not configured on the local computer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>(other)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function may return other error codes.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * If the function fails, use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-deleteipforwardentry
     * @since windows5.0
     */
    static DeleteIpForwardEntry(pRoute) {
        result := DllCall("IPHLPAPI.dll\DeleteIpForwardEntry", "ptr", pRoute, "uint")
        return result
    }

    /**
     * The SetIpStatistics function toggles IP forwarding on or off and sets the default time-to-live (TTL) value for the local computer.
     * @remarks
     * To set only the default TTL, the caller can also use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-setipttl">SetIpTTL</a> function.
     * 
     * On Windows Vista and later, the <b>SetIpStatistics</b> function can only be called by a user logged on as a member of the Administrators group. If <b>SetIpStatistics</b> is called by a user that is not a member of the Administrators group, the function call will fail and <b>ERROR_ACCESS_DENIED</b> is returned. 
     * 
     * The <b>SetIpStatistics</b> function can also fail because of user account control (UAC) on Windows Vista and later. If an application that contains this function is executed by a user logged on as a member of the Administrators group other than the built-in Administrator, this call will fail unless the application has been marked in the manifest file with a <b>requestedExecutionLevel</b> set to requireAdministrator. If the application lacks this manifest file, a user logged on as a member of the Administrators group other than the built-in Administrator must then be executing the application in an enhanced shell as the built-in Administrator (RunAs administrator) for this function to succeed.
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>   On Windows NT 4.0 and Windows 2000 and later, this function executes a privileged operation. For this function to execute successfully, the caller must be logged on as a member of the Administrators group or the NetworkConfigurationOperators group.</div>
     * <div> </div>
     * @param {Pointer<MIB_IPSTATS_LH>} pIpStats A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipstats_lh">MIB_IPSTATS</a> structure. The caller should set the <b>dwForwarding</b> and <b>dwDefaultTTL</b> members of this structure to the new values. To keep one of the members at its current value, use MIB_USE_CURRENT_TTL or MIB_USE_CURRENT_FORWARDING.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
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
     * Access is denied. This error is returned on Windows Vista and Windows Server 2008 under several conditions that include the following: the  user lacks the required administrative privileges on the local computer or the application is not running in an enhanced shell as the built-in Administrator (RunAs administrator).  
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
     * An invalid parameter was passed to the function. This error is returned if a <b>NULL</b> pointer is passed in the <i>pIpStats</i> parameter. This error is also returned if the <b>dwForwarding</b> member in the <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipstats_lh">MIB_IPSTATS</a> structure pointed to by the <i>pIpStats</i> parameter contains a value other than <b>MIB_IP_NOT_FORWARDING</b>, <b>MIB_IP_FORWARDING</b>, or <b>MIB_USE_CURRENT_FORWARDING</b>.
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-setipstatistics
     * @since windows5.0
     */
    static SetIpStatistics(pIpStats) {
        result := DllCall("IPHLPAPI.dll\SetIpStatistics", "ptr", pIpStats, "uint")
        return result
    }

    /**
     * The SetIpTTL function sets the default time-to-live (TTL) value for the local computer.
     * @remarks
     * The default TTL can also be set using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-setipstatistics">SetIpStatistics</a> function.
     * 
     * On Windows Vista and later, the <b>SetIpTTL</b> function can only be called by a user logged on as a member of the Administrators group. If <b>SetIpTTL</b> is called by a user that is not a member of the Administrators group, the function call will fail and <b>ERROR_ACCESS_DENIED</b> is returned. 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-setipstatistics">SetIpStatistics</a> function can also fail because of user account control (UAC) on Windows Vista and later. If an application that contains this function is executed by a user logged on as a member of the Administrators group other than the built-in Administrator, this call will fail unless the application has been marked in the manifest file with a <b>requestedExecutionLevel</b> set to requireAdministrator. If the application lacks this manifest file, a user logged on as a member of the Administrators group other than the built-in Administrator must then be executing the application in an enhanced shell as the built-in Administrator (RunAs administrator) for this function to succeed.
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>   On Windows NT 4.0 and Windows 2000 and later, this function executes a privileged operation. For this function to execute successfully, the caller must be logged on as a member of the Administrators group or the NetworkConfigurationOperators group.</div>
     * <div> </div>
     * @param {Integer} nTTL The new TTL value for the local computer.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
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
     * Access is denied. This error is returned on Windows Vista and Windows Server 2008 under several conditions that include the following: the  user lacks the required administrative privileges on the local computer or the application is not running in an enhanced shell as the built-in Administrator (RunAs administrator).  
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
     * An invalid parameter was passed to the function. This error is returned if the  <i>nTTL</i> parameter is invalid. 
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-setipttl
     * @since windows5.0
     */
    static SetIpTTL(nTTL) {
        result := DllCall("IPHLPAPI.dll\SetIpTTL", "uint", nTTL, "uint")
        return result
    }

    /**
     * The CreateIpNetEntry function creates an Address Resolution Protocol (ARP) entry in the ARP table on the local computer.
     * @remarks
     * To modify an existing ARP entry, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-setipnetentry">SetIpNetEntry</a> function. To retrieve the ARP table, call the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getipnettable">GetIpNetTable</a> function. To delete an existing ARP entry, call the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-deleteipnetentry">DeleteIpNetEntry</a>.
     * 
     * On Windows Vista and later, the <b>CreateIpNetEntry</b> function can only be called by a user logged on as a member of the Administrators group. If <b>CreateIpNetEntry</b> is called by a user that is not a member of the Administrators group, the function call will fail and <b>ERROR_ACCESS_DENIED</b> is returned. 
     * 
     * The <b>CreateIpNetEntry</b> function can also fail because of user account control (UAC) on Windows Vista later. If an application that contains this function is executed by a user logged on as a member of the Administrators group other than the built-in Administrator, this call will fail unless the application has been marked in the manifest file with a <b>requestedExecutionLevel</b> set to requireAdministrator. If the application lacks this manifest file, a user logged on as a member of the Administrators group other than the built-in Administrator must then be executing the application in an enhanced shell as the built-in Administrator (RunAs administrator) for this function to succeed.
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  On Windows NT 4.0 and Windows 2000 and later, this function executes a privileged operation. For this function to execute successfully, the caller must be logged on as a member of the Administrators group or the NetworkConfigurationOperators group.</div>
     * <div> </div>
     * @param {Pointer<MIB_IPNETROW_LH>} pArpEntry A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipnetrow_lh">MIB_IPNETROW</a> structure that specifies information for the new entry. The caller must specify values for all members of this structure.
     * @returns {Integer} The function returns <b>NO_ERROR</b> (zero) if the function is successful. 
     * 
     * If the function fails, the return value is one of the following error codes.
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
     * Access is denied. This error is returned on Windows Vista and Windows Server 2008 under several conditions that include the following: the  user lacks the required administrative privileges on the local computer or the application is not running in an enhanced shell as the built-in Administrator (RunAs administrator).  
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
     * An input parameter is invalid, no action was taken. This error is returned if the <i>pArpEntry</i> parameter is <b>NULL</b>,  the  <b>dwPhysAddrLen</b> member of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipnetrow_lh">MIB_IPNETROW</a> is set to zero or a value greater than 8, the <b>&gt;dwAddr</b> member of the <b>MIB_IPNETROW</b> structure is invalid, or one of the other members of the 
     * <b>MIB_IPNETROW</b> structure is invalid. 
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
     * The IPv4 transport is not configured on the local computer.
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-createipnetentry
     * @since windows5.0
     */
    static CreateIpNetEntry(pArpEntry) {
        result := DllCall("IPHLPAPI.dll\CreateIpNetEntry", "ptr", pArpEntry, "uint")
        return result
    }

    /**
     * The SetIpNetEntry function modifies an existing ARP entry in the ARP table on the local computer.
     * @remarks
     * On Windows Vista and later , the <b>SetIpNetEntry</b> function can only be called by a user logged on as a member of the Administrators group. If <b>SetIpNetEntry</b> is called by a user that is not a member of the Administrators group, the function call will fail and <b>ERROR_ACCESS_DENIED</b> is returned. 
     * 
     * The <b>SetIpNetEntry</b> function can also fail because of user account control (UAC) on Windows Vista and later. If an application that contains this function is executed by a user logged on as a member of the Administrators group other than the built-in Administrator, this call will fail unless the application has been marked in the manifest file with a <b>requestedExecutionLevel</b> set to requireAdministrator. If the application lacks this manifest file, a user logged on as a member of the Administrators group other than the built-in Administrator must then be executing the application in an enhanced shell as the built-in Administrator (RunAs administrator) for this function to succeed.
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  On Windows NT 4.0 and Windows 2000 and later, this function executes a privileged operation. For this function to execute successfully, the caller must be logged on as a member of the Administrators group or the NetworkConfigurationOperators group.</div>
     * <div> </div>
     * @param {Pointer<MIB_IPNETROW_LH>} pArpEntry A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipnetrow_lh">MIB_IPNETROW</a> structure. The information in this structure specifies the entry to modify and the new information for the entry. The caller must specify values for all members of this structure.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
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
     * Access is denied. This error is returned on Windows Vista and Windows Server 2008 under several conditions that include the following: the  user lacks the required administrative privileges on the local computer or the application is not running in an enhanced shell as the built-in Administrator (RunAs administrator).  
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
     * The <i>pArpEntry</i> parameter is <b>NULL</b>, or <b>SetIpNetEntry</b> is unable to read from the memory pointed to by <i>pArpEntry</i>, or one of the members of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipnetrow_lh">MIB_IPNETROW</a> structure is invalid.
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
     * The IPv4 transport is not configured on the local computer.
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-setipnetentry
     * @since windows5.0
     */
    static SetIpNetEntry(pArpEntry) {
        result := DllCall("IPHLPAPI.dll\SetIpNetEntry", "ptr", pArpEntry, "uint")
        return result
    }

    /**
     * The DeleteIpNetEntry function deletes an ARP entry from the ARP table on the local computer.
     * @remarks
     * To retrieve the ARP table, call the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getipnettable">GetIpNetTable</a> function. 
     * 
     * On Windows Vista and later, the <b>DeleteIpNetEntry</b> function can only be called by a user logged on as a member of the Administrators group. If <b>DeleteIpNetEntry</b> is called by a user that is not a member of the Administrators group, the function call will fail and <b>ERROR_ACCESS_DENIED</b> is returned. 
     * 
     * The <b>DeleteIpNetEntry</b> function can also fail because of user account control (UAC) on Windows Vista and later. If an application that contains this function is executed by a user logged on as a member of the Administrators group other than the built-in Administrator, this call will fail unless the application has been marked in the manifest file with a <b>requestedExecutionLevel</b> set to requireAdministrator. If the application lacks this manifest file, a user logged on as a member of the Administrators group other than the built-in Administrator must then be executing the application in an enhanced shell as the built-in Administrator (RunAs administrator) for this function to succeed.
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  On Windows NT 4.0 and Windows 2000 and later, this function executes a privileged operation. For this function to execute successfully, the caller must be logged on as a member of the Administrators group or the NetworkConfigurationOperators group.</div>
     * <div> </div>
     * @param {Pointer<MIB_IPNETROW_LH>} pArpEntry A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipnetrow_lh">MIB_IPNETROW</a> structure. The information in this structure specifies the entry to delete. The caller must specify values for at least the <b>dwIndex</b> and <b>dwAddr</b> members of this structure.
     * @returns {Integer} The function returns <b>NO_ERROR</b> (zero) if the function is successful. 
     * 
     * If the function fails, the return value is one of the following error codes.
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
     * Access is denied. This error is returned on Windows Vista and Windows Server 2008 under several conditions that include the following: the  user lacks the required administrative privileges on the local computer or the application is not running in an enhanced shell as the built-in Administrator (RunAs administrator).  
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
     * An input parameter is invalid, no action was taken.  This error is returned if the <i>pArpEntry</i> parameter is <b>NULL</b> or a member in the <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipnetrow_lh">MIB_IPNETROW</a> structure pointed to by the <i>pArpEntry</i> parameter is invalid.
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
     * The IPv4 transport is not configured on the local computer.
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-deleteipnetentry
     * @since windows5.0
     */
    static DeleteIpNetEntry(pArpEntry) {
        result := DllCall("IPHLPAPI.dll\DeleteIpNetEntry", "ptr", pArpEntry, "uint")
        return result
    }

    /**
     * The FlushIpNetTable function deletes all ARP entries for the specified interface from the ARP table on the local computer.
     * @remarks
     * To retrieve the ARP table, call the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getipnettable">GetIpNetTable</a> function. 
     * 
     * On Windows Vista and later, the <b>FlushIpNetTable</b> function can only be called by a user logged on as a member of the Administrators group. If <b>FlushIpNetTable</b> is called by a user that is not a member of the Administrators group, the function call will fail and <b>ERROR_ACCESS_DENIED</b> is returned. This function can also fail because of user account control (UAC) on Windows Vista and later. If an application that contains this function is executed by a user logged on as a member of the Administrators group other than the built-in Administrator, this call will fail unless the application has been marked in the manifest file with a <b>requestedExecutionLevel</b> set to requireAdministrator. If the application on Windows Vista and later lacks this manifest file, a user logged on as a member of the Administrators group other than the built-in Administrator must then be executing the application in an enhanced shell as the built-in Administrator (RunAs administrator) for this function to succeed.
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  This function executes a privileged operation. For this function to execute successfully, the caller must be logged on as a member of the Administrators group or the NetworkConfigurationOperators group.</div>
     * <div> </div>
     * @param {Integer} dwIfIndex The index of the interface for which to delete all ARP entries.
     * @returns {Integer} The function returns <b>NO_ERROR</b> (zero) if the function is successful. 
     * 
     * If the function fails, the return value is one of the following error codes.
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
     * Access is denied. This error is returned on Windows Vista and Windows Server 2008 under several conditions that include the following: the  user lacks the required administrative privileges on the local computer or the application is not running in an enhanced shell as the built-in Administrator (RunAs administrator).  
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
     * An input parameter is invalid, no action was taken.  This error is returned if the <i>dwIfIndex</i> parameter is invalid.
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
     * The IPv4 transport is not configured on the local computer.
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-flushipnettable
     * @since windows5.0
     */
    static FlushIpNetTable(dwIfIndex) {
        result := DllCall("IPHLPAPI.dll\FlushIpNetTable", "uint", dwIfIndex, "uint")
        return result
    }

    /**
     * The CreateProxyArpEnry function creates a Proxy Address Resolution Protocol (PARP) entry on the local computer for the specified IPv4 address.
     * @remarks
     * To retrieve the ARP table, call the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getipnettable">GetIpNetTable</a> function. To delete an existing PARP entry, call the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-deleteproxyarpentry">DeleteProxyArpEntry</a>.
     * 
     * On Windows Vista and later, the <b>CreateProxyArpEnry</b> function can only be called by a user logged on as a member of the Administrators group. If <b>CreateProxyArpEnry</b> is called by a user that is not a member of the Administrators group, the function call will fail and <b>ERROR_ACCESS_DENIED</b> is returned. This function can also fail because of user account control (UAC) on Windows Vista and later. If an application that contains this function is executed by a user logged on as a member of the Administrators group other than the built-in Administrator, this call will fail unless the application has been marked in the manifest file with a <b>requestedExecutionLevel</b> set to requireAdministrator. If the application on Windows Vista and later lacks this manifest file, a user logged on as a member of the Administrators group other than the built-in Administrator must then be executing the application in an enhanced shell as the built-in Administrator (RunAs administrator) for this function to succeed.
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  This function executes a privileged operation. For this function to execute successfully, the caller must be logged on as a member of the Administrators group or the NetworkConfigurationOperators group.</div>
     * <div> </div>
     * @param {Integer} dwAddress The IPv4 address for which this computer acts as a proxy.
     * @param {Integer} dwMask The subnet mask for the IPv4 address specified in <i>dwAddress</i>.
     * @param {Integer} dwIfIndex The index of the interface on which to proxy ARP for the IPv4 address identified by <i>dwAddress</i>. In other words, when an ARP request for <i>dwAddress</i> is received on this interface, the local computer responds with the physical address of this interface. If this interface is of a type that does not support ARP, such as PPP, then the call fails.
     * @returns {Integer} The function returns <b>NO_ERROR</b> (zero) if the function is successful. 
     * 
     * If the function fails, the return value is one of the following error codes.
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
     * Access is denied. This error is returned on Windows Vista and Windows Server 2008 under several conditions that include the following: the  user lacks the required administrative privileges on the local computer or the application is not running in an enhanced shell as the built-in Administrator (RunAs administrator).  
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
     * An input parameter is invalid, no action was taken. This error is returned if the <i>dwAddress</i> parameter is <b>zero</b> or an invalid value,  one of the other parameters is invalid. 
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
     * The IPv4 transport is not configured on the local computer.
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-createproxyarpentry
     * @since windows5.0
     */
    static CreateProxyArpEntry(dwAddress, dwMask, dwIfIndex) {
        result := DllCall("IPHLPAPI.dll\CreateProxyArpEntry", "uint", dwAddress, "uint", dwMask, "uint", dwIfIndex, "uint")
        return result
    }

    /**
     * The DeleteProxyArpEntry function deletes the PARP entry on the local computer specified by the dwAddress and dwIfIndex parameters.
     * @remarks
     * To retrieve the ARP table, call the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getipnettable">GetIpNetTable</a> function. 
     * 
     * On Windows Vista and later, the <b>DeleteProxyArpEntry</b> function can only be called by a user logged on as a member of the Administrators group. If <b>DeleteProxyArpEntry</b> is called by a user that is not a member of the Administrators group, the function call will fail and <b>ERROR_ACCESS_DENIED</b> is returned. This function can also fail because of user account control (UAC) on Windows Vista and later. If an application that contains this function is executed by a user logged on as a member of the Administrators group other than the built-in Administrator, this call will fail unless the application has been marked in the manifest file with a <b>requestedExecutionLevel</b> set to requireAdministrator. If the application on Windows Vista and later lacks this manifest file, a user logged on as a member of the Administrators group other than the built-in Administrator must then be executing the application in an enhanced shell as the built-in Administrator (RunAs administrator) for this function to succeed.
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  This function executes a privileged operation. For this function to execute successfully, the caller must be logged on as a member of the Administrators group or the NetworkConfigurationOperators group.</div>
     * <div> </div>
     * @param {Integer} dwAddress The IPv4 address for which this computer is acting as a proxy.
     * @param {Integer} dwMask The subnet mask for the IPv4 address specified in the <i>dwAddress</i> parameter.
     * @param {Integer} dwIfIndex The index of the interface on which this computer is supporting proxy ARP for the IP address specified by the <i>dwAddress</i> parameter.
     * @returns {Integer} The function returns <b>NO_ERROR</b> (zero) if the function is successful. 
     * 
     * If the function fails, the return value is one of the following error codes.
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
     * Access is denied. This error is returned on Windows Vista and Windows Server 2008 under several conditions that include the following: the  user lacks the required administrative privileges on the local computer or the application is not running in an enhanced shell as the built-in Administrator (RunAs administrator).  
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
     * An input parameter is invalid, no action was taken.  
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
     * The IPv4 transport is not configured on the local computer.
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-deleteproxyarpentry
     * @since windows5.0
     */
    static DeleteProxyArpEntry(dwAddress, dwMask, dwIfIndex) {
        result := DllCall("IPHLPAPI.dll\DeleteProxyArpEntry", "uint", dwAddress, "uint", dwMask, "uint", dwIfIndex, "uint")
        return result
    }

    /**
     * The SetTcpEntry function sets the state of a TCP connection.
     * @remarks
     * Currently, the only state to which a TCP connection can be set is MIB_TCP_STATE_DELETE_TCB.
     * 
     * On Windows Vista and later, the <b>SetTcpEntry</b> function can only be called by a user logged on as a member of the Administrators group. If <b>SetTcpEntry</b> is called by a user that is not a member of the Administrators group, the function call will fail and <b>ERROR_ACCESS_DENIED</b> is returned. 
     * 
     * The <b>SetTcpEntry</b> function can also fail because of user account control (UAC) on Windows Vista and later. If an application that contains this function is executed by a user logged on as a member of the Administrators group other than the built-in Administrator, this call will fail unless the application has been marked in the manifest file with a <b>requestedExecutionLevel</b> set to requireAdministrator. If the application lacks this manifest file, a user logged on as a member of the Administrators group other than the built-in Administrator must then be executing the application in an enhanced shell as the built-in Administrator (RunAs administrator) for this function to succeed.
     * @param {Pointer<MIB_TCPROW_LH>} pTcpRow A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tcpmib/ns-tcpmib-mib_tcprow_lh">MIB_TCPROW</a> structure. This structure specifies information to identify the TCP connection to modify. It also specifies the new state for the TCP connection. The caller must specify values for all the members in this structure.
     * @returns {Integer} The function returns <b>NO_ERROR</b> (zero) if the function is successful. 
     * 
     * If the function fails, the return value is one of the following error codes.
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
     * </dl>
     * </td>
     * <td width="60%">
     * Access is denied. This error is returned on Windows Vista and Windows Server 2008 under several conditions that include the following: the  user lacks the required administrative privileges on the local computer or the application is not running in an enhanced shell as the built-in Administrator (RunAs administrator).  
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
     * An input parameter is invalid, no action was taken.  This error is returned if the <i>pTcpRow</i> parameter is <b>NULL</b> or the <b>Row</b> member in the <a href="https://docs.microsoft.com/windows/desktop/api/tcpmib/ns-tcpmib-mib_tcprow_lh">MIB_TCPROW</a> structure pointed to by the <i>pTcpRow</i> parameter is not set to MIB_TCP_STATE_DELETE_TCB.
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
     * The IPv4 transport is not configured on the local computer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>317</dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  The function is unable to set the TCP entry since the application is running non-elevated.
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-settcpentry
     * @since windows5.0
     */
    static SetTcpEntry(pTcpRow) {
        result := DllCall("IPHLPAPI.dll\SetTcpEntry", "ptr", pTcpRow, "uint")
        return result
    }

    /**
     * The GetInterfaceInfo function obtains the list of the network interface adapters with IPv4 enabled on the local system.
     * @remarks
     * The 
     * <b>GetInterfaceInfo</b> function is specific to network adapters with IPv4 enabled. The function returns an <a href="https://docs.microsoft.com/windows/desktop/api/ipexport/ns-ipexport-ip_interface_info">IP_INTERFACE_INFO</a> structure pointed to by the <i>pIfTable</i> parameter that contains the number of network adapters with IPv4 enabled on the local system and an array of <a href="https://docs.microsoft.com/windows/desktop/api/ipexport/ns-ipexport-ip_adapter_index_map">IP_ADAPTER_INDEX_MAP</a> structures with information on each network adapter with IPv4 enabled. The <b>IP_INTERFACE_INFO</b> structure returned by <b>GetInterfaceInfo</b> contains at least one <b>IP_ADAPTER_INDEX_MAP</b> structure even if the <b>NumAdapters</b> member of the <b>IP_INTERFACE_INFO</b> structure indicates that no network adapters with IPv4 are enabled. When the <b>NumAdapters</b> member of the <b>IP_INTERFACE_INFO</b> structure returned by <b>GetInterfaceInfo</b> is zero, the value of the members of the single  <b>IP_ADAPTER_INDEX_MAP</b> structure returned in the <b>IP_INTERFACE_INFO</b> structure is undefined. 
     * 
     * If the  <b>GetInterfaceInfo</b> function is called with too small a buffer to retrieve the IPv4 interface information  (the  <i>dwOutBufLen</i> parameter indicates that the buffer pointed to by the <i>pIfTable</i> parameter is too small), the function returns  <b>ERROR_INSUFFICIENT_BUFFER</b>. The required size is returned in the <b>DWORD</b> variable pointed to by the <i>dwOutBufLen</i> parameter.
     * 
     *  The  correct way to use the <b>GetInterfaceInfo</b> function is to call this function twice. In the first call, pass a <b>NULL</b> pointer in the <i>pIfTable</i> parameter and zero in the variable pointed to by the <i>dwOutBufLen</i> parameter. The call will fail with <b>ERROR_INSUFFICIENT_BUFFER</b> and the required size for this buffer is returned in the <b>DWORD</b> variable pointed to by the <i>dwOutBufLen</i> parameter. A buffer can then  be allocated of the required size using the value pointed by the <i>dwOutBufLen</i>. Then  the <b>GetInterfaceInfo</b> function can be called a second time with a pointer to this buffer passed in the <i>pIfTable</i> parameter and the length of the buffer set to the size of this buffer. 
     * 
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getadaptersinfo">GetAdaptersInfo</a> and 
     * <b>GetInterfaceInfo</b> functions do not return information about the loopback interface. Information on the loopback interface is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getipaddrtable">GetIpAddrTable</a> function.
     * 
     * On Windows Vista and later, the <b>Name</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/ipexport/ns-ipexport-ip_adapter_index_map">IP_ADAPTER_INDEX_MAP</a> structure returned in the <a href="https://docs.microsoft.com/windows/desktop/api/ipexport/ns-ipexport-ip_interface_info">IP_INTERFACE_INFO</a> structure may be a Unicode string of the GUID for the network interface (the string begins with the '{' character).
     * @param {Pointer<IP_INTERFACE_INFO>} pIfTable A pointer to a buffer that specifies an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ipexport/ns-ipexport-ip_interface_info">IP_INTERFACE_INFO</a> structure that receives the list of adapters. This buffer must be allocated by the caller.
     * @param {Pointer<UInt32>} dwOutBufLen A pointer to a <b>DWORD</b> variable that specifies the size of the 
     * buffer pointed to by <i>pIfTable</i> parameter to receive the <a href="https://docs.microsoft.com/windows/desktop/api/ipexport/ns-ipexport-ip_interface_info">IP_INTERFACE_INFO</a> structure. If this size is insufficient to hold the IPv4 interface information, 
     * <b>GetInterfaceInfo</b> fills in this variable with the required size, and returns an error code of <b>ERROR_INSUFFICIENT_BUFFER</b>.
     * @returns {Integer} If the function succeeds, the return value is <b>NO_ERROR</b>.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer to receive the IPv4 adapter information is too small. This value is returned if the  <i>dwOutBufLen</i> parameter indicates that the buffer pointed to by the <i>pIfTable</i> parameter is too small to retrieve the IPv4 interface information. The required size is returned in the <b>DWORD</b> variable pointed to by the <i>dwOutBufLen</i> parameter.
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
     * An invalid parameter was passed to the function. This error is returned if the <i>dwOutBufLen</i> parameter is <b>NULL</b>, or <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getinterfaceinfo">GetInterfaceInfo</a> is unable to write to the memory pointed to by the <i>dwOutBufLen</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are no network adapters enabled for IPv4 on the local system. This value is also returned if all network adapters on the local system are disabled.
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
     * This function is not supported on the operating system in use on the local system.
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-getinterfaceinfo
     * @since windows5.0
     */
    static GetInterfaceInfo(pIfTable, dwOutBufLen) {
        result := DllCall("IPHLPAPI.dll\GetInterfaceInfo", "ptr", pIfTable, "ptr", dwOutBufLen, "uint")
        return result
    }

    /**
     * The GetUniDirectionalAdapterInfo function retrieves information about the unidirectional adapters installed on the local computer. A unidirectional adapter is an adapter that can receive datagrams, but not transmit them.
     * @param {Pointer<IP_UNIDIRECTIONAL_ADAPTER_ADDRESS>} pIPIfInfo Pointer to an 
     * <a href="https://docs.microsoft.com/windows/win32/api/ipexport/ns-ipexport-ip_unidirectional_adapter_address">IP_UNIDIRECTIONAL_ADAPTER_ADDRESS</a> structure that receives information about the unidirectional adapters installed on the local computer.
     * @param {Pointer<UInt32>} dwOutBufLen Pointer to a <b>ULONG</b> variable that receives the size of the structure pointed to by the <i>pIPIfInfo</i> parameter.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-getunidirectionaladapterinfo
     */
    static GetUniDirectionalAdapterInfo(pIPIfInfo, dwOutBufLen) {
        result := DllCall("IPHLPAPI.dll\GetUniDirectionalAdapterInfo", "ptr", pIPIfInfo, "ptr", dwOutBufLen, "uint")
        return result
    }

    /**
     * The NhpAllocateAndGetInterfaceInfoFromStack function obtains adapter information about the local computer.
     * @remarks
     * In the Microsoft Windows Software Development Kit (SDK), the <b>NhpAllocateAndGetInterfaceInfoFromStack</b> function is  defined on Windows 2000 with Service Pack 1 (SP1) and later. When compiling an application, if the target platform is Windows 2000 with SP1 and later (<c>NTDDI_VERSION &gt;= NTDDI_WIN2KSP1</code>, <code>_WIN32_WINNT &gt;= 0x0500</code>, or <code>WINVER &gt;= 0x0500</c>), the <b>NhpAllocateAndGetInterfaceInfoFromStack</b> is defined.
     * @param {Pointer<IP_INTERFACE_NAME_INFO_W2KSP1>} ppTable An array of <a href="https://docs.microsoft.com/windows/desktop/api/iptypes/ns-iptypes-ip_interface_name_info_w2ksp1">IP_INTERFACE_NAME_INFO</a> structures that contains information about each adapter on the local system. The array contains one element for each adapter on the system.
     * @param {Pointer<UInt32>} pdwCount The number of elements in the <i>ppTable</i> array.
     * @param {Integer} bOrder When <b>TRUE</b>, elements in the <i>ppTable</i> array are sorted by increasing index value.
     * @param {Pointer<HANDLE>} hHeap A handle that specifies the heap from which <i>ppTable</i> should be allocated. This parameter can be the process heap returned by a call to the <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-getprocessheap">GetProcessHeap</a> function, or a private heap created by a call to the <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapcreate">HeapCreate</a> function.
     * @param {Integer} dwFlags A set of flags to be passed to the <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapalloc">HeapAlloc</a> function when allocating memory for <i>ppTable</i>. See the <b>HeapAlloc</b> function for more information.
     * @returns {Integer} Returns ERROR_SUCCESS upon successful completion.
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-nhpallocateandgetinterfaceinfofromstack
     * @since windows5.1.2600
     */
    static NhpAllocateAndGetInterfaceInfoFromStack(ppTable, pdwCount, bOrder, hHeap, dwFlags) {
        result := DllCall("IPHLPAPI.dll\NhpAllocateAndGetInterfaceInfoFromStack", "ptr", ppTable, "ptr", pdwCount, "int", bOrder, "ptr", hHeap, "uint", dwFlags, "uint")
        return result
    }

    /**
     * The GetBestInterface function retrieves the index of the interface that has the best route to the specified IPv4 address.
     * @remarks
     * The <b>GetBestInterface</b> function only works with IPv4 addresses. For use with IPv6 addresses, the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getbestinterfaceex">GetBestInterfaceEx</a> must be used. 
     * 
     * For information about the <b>IPAddr</b> data type, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">Windows Data Types</a>. To convert an IP address between dotted decimal notation and <b>IPAddr</b> format, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wsipv6ok/nf-wsipv6ok-inet_addr">inet_addr</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wsipv6ok/nf-wsipv6ok-inet_ntoa">inet_ntoa</a> functions.
     * 
     * On Windows Vista and later, the <i>pdwBestIfIndex</i> parameter is treated internally by IP Helper as a pointer to a <b>NET_IFINDEX</b> datatype.
     * @param {Integer} dwDestAddr The destination IPv4 address for which to retrieve the interface that has the best route, in the form of an <a href="https://docs.microsoft.com/windows/desktop/api/inaddr/ns-inaddr-in_addr">IPAddr</a> structure.
     * @param {Pointer<UInt32>} pdwBestIfIndex A pointer to a <b>DWORD</b> variable that receives the index of the interface that has the best route to the IPv4 address specified by <i>dwDestAddr</i>.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CAN_NOT_COMPLETE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation could not be completed. 
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
     * An invalid parameter was passed to the function. This error is returned if a <b>NULL</b> pointer is passed in the <i>pdwBestIfIndex</i> parameter or if the <i>pdwBestIfIndex</i> points to memory that cannot be written.
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
     * The request is not supported. This error is returned if no IPv4 stack is on the local computer.
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
     * Use 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-getbestinterface
     * @since windows5.0
     */
    static GetBestInterface(dwDestAddr, pdwBestIfIndex) {
        result := DllCall("IPHLPAPI.dll\GetBestInterface", "uint", dwDestAddr, "ptr", pdwBestIfIndex, "uint")
        return result
    }

    /**
     * The GetBestInterfaceEx function retrieves the index of the interface that has the best route to the specified IPv4 or IPv6 address.
     * @remarks
     * The <b>GetBestInterfaceEx</b> function differs from the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getbestinterface">GetBestInterface</a> function in that it can be used with either IPv4 or IPv6 addresses.
     * 
     * The <b>Family</b> member of the sockaddr structure pointed to by the <i>pDestAddr</i> parameter must be set to one of the following values: <b>AF_INET</b> or <b>AF_INET6</b>. 
     * 
     * On Windows Vista and later, the <i>pdwBestIfIndex</i> parameter is treated internally by IP Helper as a pointer to a <b>NET_IFINDEX</b> datatype.
     * @param {Pointer<SOCKADDR>} pDestAddr The destination IPv6 or IPv4 address for which to retrieve the interface with the best route, in the form of a <a href="https://docs.microsoft.com/windows/desktop/WinSock/sockaddr-2">sockaddr</a> structure.
     * @param {Pointer<UInt32>} pdwBestIfIndex A pointer to the index of the interface with the best route to the IPv6 or IPv4 address specified by <i>pDestAddr</i>.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CAN_NOT_COMPLETE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation could not be completed. 
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
     * An invalid parameter was passed to the function. This error is returned if a <b>NULL</b> pointer is passed in the <i>pdwBestIfIndex</i> parameter or if the <i>pDestAddr </i> or <i>pdwBestIfIndex</i> parameters point to memory that cannot be accessed. This error can also be returned if the <i>pdwBestIfIndex</i> parameter points to memory that can't be written to.
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
     * The request is not supported. This error is returned if no IPv4 stack is on the local computer and an IPv4 address was specified in the <i>pDestAddr</i> parameter or no IPv6 stack is on the local computer and an IPv6 address was specified in the <i>pDestAddr</i> parameter.
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
     * Use 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-getbestinterfaceex
     * @since windows5.1.2600
     */
    static GetBestInterfaceEx(pDestAddr, pdwBestIfIndex) {
        result := DllCall("IPHLPAPI.dll\GetBestInterfaceEx", "ptr", pDestAddr, "ptr", pdwBestIfIndex, "uint")
        return result
    }

    /**
     * The GetBestRoute function retrieves the best route to the specified destination IP address.
     * @param {Integer} dwDestAddr Destination IP address for which to obtain the best route.
     * @param {Integer} dwSourceAddr Source IP address. This IP address corresponds to an interface on the local computer. If multiple best routes to the destination address exist, the function selects the route that uses this interface. 
     * 
     * 
     * 
     * 
     * This parameter is optional. The caller may specify zero for this parameter.
     * @param {Pointer<MIB_IPFORWARDROW>} pBestRoute Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipforwardrow">MIB_IPFORWARDROW</a> structure containing the best route for the IP address specified by <i>dwDestAddr</i>.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-getbestroute
     * @since windows5.0
     */
    static GetBestRoute(dwDestAddr, dwSourceAddr, pBestRoute) {
        result := DllCall("IPHLPAPI.dll\GetBestRoute", "uint", dwDestAddr, "uint", dwSourceAddr, "ptr", pBestRoute, "uint")
        return result
    }

    /**
     * The NotifyAddrChange function causes a notification to be sent to the caller whenever a change occurs in the table that maps IPv4 addresses to interfaces.
     * @remarks
     * The  
     * <b>NotifyAddrChange</b> function may be called in two ways:<ul>
     * <li>Synchronous method</li>
     * <li>Asynchronous method</li>
     * </ul>
     * 
     * 
     * If the caller specifies <b>NULL</b> for the <i>Handle</i> and <i>overlapped</i> parameters, the call to 
     * <b>NotifyAddrChange</b> is synchronous and will block until an IP address change occurs. In this case if a change occurs, the <b>NotifyAddrChange</b> function completes to indicate that a change has occurred. 
     * 
     * If the <b>NotifyAddrChange</b> function is called synchronously, a notification will be sent on the next IPv4 address change until the application terminates. 
     * 
     * If the caller specifies a handle variable and an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure, then the <b>NotifyAddrChange</b> function call is asynchronous and the caller can use the returned handle with the <b>OVERLAPPED</b> structure to receive asynchronous notification of IPv4 address changes using the <a href="https://docs.microsoft.com/windows/desktop/api/ioapiset/nf-ioapiset-getoverlappedresult">GetOverlappedResult</a> function. See the following topics for information about using the handle and 
     * <b>OVERLAPPED</b> structure to receive notifications:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/Sync/synchronization-and-overlapped-input-and-output">Synchronization and Overlapped Input and Output</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/ioapiset/nf-ioapiset-getoverlappedresult">GetOverlappedResult</a>
     * </li>
     * </ul>
     * The <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-cancelipchangenotify">CancelIPChangeNotify</a> function cancels notification of IPv4 address and route changes previously requested with successful calls to the <b>NotifyAddrChange</b> or <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-notifyroutechange">NotifyRouteChange</a> functions.
     * 
     * Once an application has been notified of a change, the application can then call the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getipaddrtable">GetIpAddrTable</a> or <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getadaptersaddresses">GetAdaptersAddresses</a> function to retrieve the table of IPv4 addresses to determine what has changed. If the application is notified and requires notification for the next change, then the <b>NotifyAddrChange</b> function must be called again.
     * 
     * If the <b>NotifyAddrChange</b> function is called asynchronously, a notification will be sent on the next IPv4 address change until either the application cancels the notification by calling the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-cancelipchangenotify">CancelIPChangeNotify</a> function or the application terminates. If the application terminates, the system will automatically cancel the registration for the notification. It is still recommended that an application explicitly cancel any notification before it terminates.  
     * 
     * Any registration for a notification does not persist across a system shut down or reboot.
     * 
     * On Windows Vista and later, the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-notifyipinterfacechange">NotifyIpInterfaceChange</a> function  can be used to  register to be notified for changes to IPv4 and IPv6 interfaces on  the local computer.
     * @param {Pointer<HANDLE>} Handle A pointer to a <b>HANDLE</b> variable that receives a file handle for use in a subsequent call to the <a href="https://docs.microsoft.com/windows/desktop/api/ioapiset/nf-ioapiset-getoverlappedresult">GetOverlappedResult</a> function. 
     * 
     * <div class="alert"><b>Warning</b>  Do not close this handle, and do not associate it with a completion port.</div>
     * <div> </div>
     * @param {Pointer<OVERLAPPED>} overlapped A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure that  notifies the caller of any changes in the table that maps IP addresses to interfaces.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR if the caller specifies <b>NULL</b> for the <i>Handle</i> and <i>overlapped</i> parameters. If the caller specifies non-<b>NULL</b> parameters, the return value for success is ERROR_IO_PENDING.
     * 
     * If the function fails, use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANCELLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The context is being deregistered, so the call was canceled immediately.
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
     * An invalid parameter was passed. This error is returned if the both the <i>Handle</i> and <i>overlapped</i> parameters are not <b>NULL</b>, but the memory specified by the
     *     input parameters cannot be written by the calling process.  This error is also returned if the client already has made a change notification request, so this duplicate request will fail.
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
     * There was insufficient memory available to complete the operation.
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
     * This error is returned on versions of Windows where this function is not supported such as Windows 98/95 and Windows NT 4.0.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-notifyaddrchange
     * @since windows5.0
     */
    static NotifyAddrChange(Handle, overlapped) {
        result := DllCall("IPHLPAPI.dll\NotifyAddrChange", "ptr", Handle, "ptr", overlapped, "uint")
        return result
    }

    /**
     * The NotifyRouteChange function causes a notification to be sent to the caller whenever a change occurs in the IPv4 routing table.
     * @remarks
     * The  
     * <b>NotifyRouteChange</b> function may be called in two ways:<ul>
     * <li>Synchronous method</li>
     * <li>Asynchronous method</li>
     * </ul>
     * 
     * 
     * If the caller specifies <b>NULL</b> for the <i>Handle</i> and <i>overlapped</i> parameters, the call to 
     * <b>NotifyRouteChange</b> is synchronous and will block until  an IPv4 routing table change occurs. In this case if a change occurs, the <b>NotifyRouteChange</b> function completes to indicate that a change has occurred. 
     * 
     * If the <b>NotifyRouteChange</b> function is called synchronously, a notification will be sent on the next IPv4 routing change until the application terminates. 
     * 
     * If the caller specifies a handle variable and an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure, the caller can use the returned handle with the <b>OVERLAPPED</b> structure to receive asynchronous notification of IPv4 routing table changes. See the following topics for information about using the handle and 
     * <b>OVERLAPPED</b> structure to receive notifications:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/Sync/synchronization-and-overlapped-input-and-output">Synchronization and Overlapped Input and Output</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/ioapiset/nf-ioapiset-getqueuedcompletionstatus">GetQueuedCompletionStatus</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/FileIO/i-o-completion-ports">I/O Completion Ports</a>
     * </li>
     * </ul>
     * If the application receives a notification and requires notification for the next change, then the <b>NotifyRouteChange</b> function must be called again.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-cancelipchangenotify">CancelIPChangeNotify</a> function cancels notification of IP address and route changes previously requested with successful calls to the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-notifyaddrchange">NotifyAddrChange</a> or <b>NotifyRouteChange</b> functions.
     * 
     * Once an application has been notified of a change, the application can then call the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getipforwardtable">GetIpForwardTable</a> or <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-getipforwardtable2">GetIpForwardTable2</a> function to retrieve the IPv4 routing table to determine what has changed. If the application is notified and requires notification for the next change, then the <b>NotifyRouteChange</b> function must be called again.
     * 
     * If the <b>NotifyRouteChange</b> function is called asynchronously, a notification will be sent on the next IPv4 route change until either the application cancels the notification by calling the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-cancelipchangenotify">CancelIPChangeNotify</a> function or the application terminates. If the application terminates, the system will automatically cancel the registration for the notification. It is still recommended that an application explicitly cancel any notification before it terminates.  
     * 
     * Any registration for a notification does not persist across a system shut down or reboot.
     * 
     * On Windows Vista and later, the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-notifyroutechange2">NotifyRouteChange2</a> function  can be used to  register to be notified for changes to the IPv6 routing table  on the local computer.
     * @param {Pointer<HANDLE>} Handle A pointer to a <b>HANDLE</b> variable that receives a handle to use in asynchronous notification.
     * @param {Pointer<OVERLAPPED>} overlapped A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure that  notifies the caller of any changes in the routing table.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR if the caller specifies <b>NULL</b> for the <i>Handle</i> and <i>overlapped</i> parameters. If the caller specifies non-<b>NULL</b> parameters, the return value for success is ERROR_IO_PENDING. If the function fails, use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANCELLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The context is being deregistered, so the call was canceled immediately.
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
     * An invalid parameter was passed. This error is returned if the both the <i>Handle</i> and <i>overlapped</i> parameters are not <b>NULL</b>, but the memory specified by the
     *     input parameters cannot be written by the calling process.  This error is also returned if the client already has made a change notification request, so this duplicate request will fail.
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
     * There was insufficient memory available to complete the operation.
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
     * This error is returned on versions of Windows where this function is not supported such as Windows 98/95 and Windows NT 4.0.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-notifyroutechange
     * @since windows5.0
     */
    static NotifyRouteChange(Handle, overlapped) {
        result := DllCall("IPHLPAPI.dll\NotifyRouteChange", "ptr", Handle, "ptr", overlapped, "uint")
        return result
    }

    /**
     * Cancels notification of IPv4 address and route changes previously requested with successful calls to the NotifyAddrChange or NotifyRouteChange functions.
     * @remarks
     * The  
     * <b>CancelIPChangeNotify</b> function deregisters for a change notification previously requested for IPv4 address or route changes on  a local computer. These requests to register for notification are made  by calling the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-notifyaddrchange">NotifyAddrChange</a> or <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-notifyroutechange">NotifyRouteChange</a> functions.  
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure used in the previous call to one of these notification functions is passed to <b>CancelIPChangeNotify</b> function in the <i>notifyOverlapped</i> parameter to deregister for notifications.
     * 
     * The <b>CancelIPChangeNotify</b> can return <b>FALSE</b> if no notification request was found or an invalid <i>notifyOverlapped</i> parameter was passed.
     * @param {Pointer<OVERLAPPED>} notifyOverlapped A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure used in the previous call to <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-notifyaddrchange">NotifyAddrChange</a>  or <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-notifyroutechange">NotifyRouteChange</a>.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-cancelipchangenotify
     * @since windows5.1.2600
     */
    static CancelIPChangeNotify(notifyOverlapped) {
        result := DllCall("IPHLPAPI.dll\CancelIPChangeNotify", "ptr", notifyOverlapped, "int")
        return result
    }

    /**
     * The GetAdapterIndex function obtains the index of an adapter, given its name.
     * @remarks
     * Until an adapter is fully disabled, the <b>GetAdapterIndex</b> function reports the adapter as present. For example, the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-notifyaddrchange">NotifyAddrChange</a> function may indicate a recently disabled adapter's IP address is removed, but <b>GetAdapterIndex</b> continues to report an adapter  index until the process of disabling the adapter is complete.
     * 
     * When one or more adapters are present on the system, <b>GetAdapterIndex</b>  returns ERROR_DEV_NOT_EXIST when the adapter being queried does not exist. When no adapters are present, the <b>GetAdapterIndex</b> function returns ERROR_NO_DATA.
     * 
     *  The adapter index  may change when an adapter is disabled and then enabled, or under other circumstances, and should not be considered persistent.
     * @param {Pointer<PWSTR>} AdapterName A pointer to a Unicode string that specifies the name of the adapter.
     * @param {Pointer<UInt32>} IfIndex A pointer to a <b>ULONG</b> variable that points to the index of the adapter.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-getadapterindex
     * @since windows5.0
     */
    static GetAdapterIndex(AdapterName, IfIndex) {
        result := DllCall("IPHLPAPI.dll\GetAdapterIndex", "ptr", AdapterName, "ptr", IfIndex, "uint")
        return result
    }

    /**
     * The AddIPAddress function adds the specified IPv4 address to the specified adapter.
     * @remarks
     * The <b>AddIPAddress</b> function is used to add a new IPv4 address entry on a local computer. The IPv4 address added by 
     * the <b>AddIPAddress</b> function is not persistent. The IPv4 address exists only as long as the adapter object exists. Restarting the computer destroys the IPv4 address, as does manually resetting the network interface card (NIC). Also, certain PnP events may destroy the address.
     * 
     * To create an IPv4 address that persists, the <a href="https://docs.microsoft.com/windows/desktop/CIMWin32Prov/enablestatic-method-in-class-win32-networkadapterconfiguration">EnableStatic method of the Win32_NetworkAdapterConfiguration Class</a> in the Windows Management Instrumentation (WMI) controls may be used. The netsh commands can also be used to create a persistent IPv4 address. 
     * 
     * For more information, please see the documentation on <a href="https://docs.microsoft.com/windows/desktop/WinSock/netsh-exe">Netsh.exe</a> in the Windows Sockets documentation.
     * 
     * On  Windows Server 2003, Windows XP, and Windows 2000, if the IPv4 address in the <i>Address</i> parameter already exists on the network, the <b>AddIPAddress</b> function returns <b>NO_ERROR</b> and  the IPv4 address added is 0.0.0.0. 
     * 
     * On  Windows Vista and later, if the IPv4 address passed in the <i>Address</i> parameter already exists on the network, the <b>AddIPAddress</b> function returns <b>NO_ERROR</b> and  the duplicate IPv4 address is added with the <b>IP_DAD_STATE</b> member in  the <a href="https://docs.microsoft.com/windows/desktop/api/iptypes/ns-iptypes-ip_adapter_unicast_address_lh">IP_ADAPTER_UNICAST_ADDRESS</a> structure set to <b>IpDadStateDuplicate</b>. 
     * 
     * An IPv4 address that is added using the <b>AddIPAddress</b> function can later be deleted by calling the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-deleteipaddress">DeleteIPAddress</a> function  passing the  <i>NTEContext</i> parameter returned by the <b>AddIPAddress</b> function.
     * 
     * For information about the <b>IPAddr</b> and <b>IPMask</b> data types, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">Windows Data Types</a>. To convert an IPv4 address between dotted decimal notation and <b>IPAddr</b> format, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wsipv6ok/nf-wsipv6ok-inet_addr">inet_addr</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wsipv6ok/nf-wsipv6ok-inet_ntoa">inet_ntoa</a> functions.
     * 
     * On Windows Vista and later, the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-createunicastipaddressentry">CreateUnicastIpAddressEntry</a> function can be used to add a new unicast IPv4 or IPv6 address entry on a local computer.
     * @param {Integer} Address The IPv4 address to add to the adapter, in the form of an <a href="https://docs.microsoft.com/windows/desktop/api/inaddr/ns-inaddr-in_addr">IPAddr</a> structure.
     * @param {Integer} IpMask The subnet mask for the IPv4 address specified in the <i>Address</i> parameter.   The <b>IPMask</b> parameter uses the same format as an <a href="https://docs.microsoft.com/windows/desktop/api/inaddr/ns-inaddr-in_addr">IPAddr</a> structure.
     * @param {Integer} IfIndex The index of the adapter on which to add the IPv4 address.
     * @param {Pointer<UInt32>} NTEContext A pointer to a <b>ULONG</b> variable. On successful return, this parameter points to the Net Table Entry (NTE) context for the IPv4 address that was added. The caller can later use this context in a call to 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-deleteipaddress">DeleteIPAddress</a> function.
     * @param {Pointer<UInt32>} NTEInstance A pointer to a <b>ULONG</b> variable. On successful return, this parameter points to the NTE instance for the IPv4 address that was added.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DEV_NOT_EXIST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The adapter specified by the <i>IfIndex</i> parameter does not exist.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DUP_DOMAINNAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The IPv4 address to add that is specified in the <i>Address</i> parameter already exists.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_GEN_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A general failure. This error is returned for some values specified in the <i>Address</i> parameter, such as an IPv4 address normally considered to be a broadcast addresses.
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
     * The user attempting to make the function call is not an administrator.
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
     * One or more of the parameters is invalid. This error is returned if the <i>NTEContext</i> or <i>NTEInstance</i> parameters are <b>NULL</b>. This error is also returned when the IP address specified in the <i>Address</i> parameter is inconsistent with the interface index specified in the <i>IfIndex</i> parameter (for example, a loopback address on a non-loopback interface).
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
     * The function call is not supported on the version of Windows on which it was run.
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-addipaddress
     * @since windows5.0
     */
    static AddIPAddress(Address, IpMask, IfIndex, NTEContext, NTEInstance) {
        result := DllCall("IPHLPAPI.dll\AddIPAddress", "uint", Address, "uint", IpMask, "uint", IfIndex, "ptr", NTEContext, "ptr", NTEInstance, "uint")
        return result
    }

    /**
     * The DeleteIPAddress function deletes an IP address previously added using AddIPAddress.
     * @remarks
     * On Windows Vista and later, the <b>DeleteIPAddress</b> function can only be called by a user logged on as a member of the Administrators group. If <b>DeleteIPAddress</b> is called by a user that is not a member of the Administrators group, the function call will fail and <b>ERROR_ACCESS_DENIED</b> is returned. This function can also fail because of user account control (UAC) on Windows Vista and later. If an application that contains this function is executed by a user logged on as a member of the Administrators group other than the built-in Administrator, this call will fail unless the application has been marked in the manifest file with a <b>requestedExecutionLevel</b> set to requireAdministrator. If the application on Windows Vista and later lacks this manifest file, a user logged on as a member of the Administrators group other than the built-in Administrator must then be executing the application in an enhanced shell as the built-in Administrator (RunAs administrator) for this function to succeed.
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  On Windows NT 4.0 and Windows 2000 and later, this function executes a privileged operation. For this function to execute successfully, the caller must be logged on as a member of the Administrators group or the NetworkConfigurationOperators group.</div>
     * <div> </div>
     * @param {Integer} NTEContext The Net Table Entry (NTE) context for the IP address. This context was returned by the previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-addipaddress">AddIPAddress</a>.
     * @returns {Integer} The function returns <b>NO_ERROR</b> (zero) if the function is successful. 
     * 
     * If the function fails, the return value is one of the following error codes.
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
     * Access is denied. This error is returned on Windows Vista and Windows Server 2008 under several conditions that include the following: the  user lacks the required administrative privileges on the local computer or the application is not running in an enhanced shell as the built-in Administrator (RunAs administrator).  
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
     * An input parameter is invalid, no action was taken.  
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
     * The IPv4 transport is not configured on the local computer.
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-deleteipaddress
     * @since windows5.0
     */
    static DeleteIPAddress(NTEContext) {
        result := DllCall("IPHLPAPI.dll\DeleteIPAddress", "uint", NTEContext, "uint")
        return result
    }

    /**
     * The GetNetworkParams function retrieves network parameters for the local computer.
     * @remarks
     * The <b>GetNetworkParams</b> function is used to retrieve  network parameters for the local computer. Network parameters are returned  in a <a href="https://docs.microsoft.com/windows/desktop/api/iptypes/ns-iptypes-fixed_info_w2ksp1">FIXED_INFO</a> structure. The  memory for the <b>FIXED_INFO</b> structure must be allocated by the application. It is the responsibility of the application to free this memory when it is no longer needed. 
     * 
     * In the Microsoft Windows Software Development Kit (SDK), the <a href="https://docs.microsoft.com/windows/desktop/api/iptypes/ns-iptypes-fixed_info_w2ksp1">FIXED_INFO_WIN2KSP1</a> structure is defined.   When compiling an 
     *      application if the target platform is Windows 2000 with Service Pack 1 (SP1) and later (<c>NTDDI_VERSION &gt;= NTDDI_WIN2KSP1</c>, 
     *      <c>_WIN32_WINNT &gt;= 0x0501</c>, or 
     *      <c>WINVER &gt;= 0x0501</c>), the <b>FIXED_INFO_WIN2KSP1</b> struct is typedefed to the <b>FIXED_INFO</b> structure. When compiling an application if the target 
     *      platform is not Windows 2000 with SP1 and later, the 
     *      <b>FIXED_INFO</b> structure is undefined.
     * 
     * The <b>GetNetworkParams</b> function and the 
     *      <a href="https://docs.microsoft.com/windows/desktop/api/iptypes/ns-iptypes-fixed_info_w2ksp1">FIXED_INFO</a> structure are supported on  Windows 98and later. But to build an application for a target platform earlier than Windows 2000 with Service Pack 1 (SP1), an earlier version of the Platform Software Development Kit (SDK)  must be used.
     * @param {Pointer<FIXED_INFO_W2KSP1>} pFixedInfo A pointer to a 
     * buffer that contains a <a href="https://docs.microsoft.com/windows/desktop/api/iptypes/ns-iptypes-fixed_info_w2ksp1">FIXED_INFO</a> structure that receives the network parameters for the local computer, if the function was successful. This buffer must be allocated by the caller prior to calling the <b>GetNetworkParams</b> function.
     * @param {Pointer<UInt32>} pOutBufLen A pointer to a <b>ULONG</b> variable that specifies the size of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iptypes/ns-iptypes-fixed_info_w2ksp1">FIXED_INFO</a> structure. If this size is insufficient to hold the information, 
     * <b>GetNetworkParams</b> fills in this variable with the required size, and returns an error code of <b>ERROR_BUFFER_OVERFLOW</b>.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BUFFER_OVERFLOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer to receive the network parameter information is too small. This value is returned if the <i>pOutBufLen</i> parameter is too small to hold the network parameter information or the <i>pFixedInfo</i> parameter was a <b>NULL</b> pointer. When this error code is returned, the <i>pOutBufLen</i> parameter points to the required buffer size.
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
     * An invalid parameter was passed to the function. This error is returned if the  <i>pOutBufLen</i> parameter is a <b>NULL</b> pointer, the calling process does not have read/write access to the memory pointed to by <i>pOutBufLen</i>, or the calling process does not have write access to the memory pointed to by the <i>pFixedInfo</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No network parameter information exists for the local computer.
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
     * The <b>GetNetworkParams</b> function is not supported by the operating system running on the local computer.
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
     * If the function fails, use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-getnetworkparams
     * @since windows5.0
     */
    static GetNetworkParams(pFixedInfo, pOutBufLen) {
        result := DllCall("IPHLPAPI.dll\GetNetworkParams", "ptr", pFixedInfo, "ptr", pOutBufLen, "uint")
        return result
    }

    /**
     * The GetAdaptersInfo function retrieves adapter information for the local computer.
     * @remarks
     * The <b>GetAdaptersInfo</b> function can retrieve information only for IPv4 addresses. 
     * 
     * In versions prior to Windows 10, the order in which adapters appear in the list returned by this function can be controlled from the Network Connections folder: select the Advanced Settings menu item from the Advanced menu. Starting with Windows 10, the order is unspecified.
     * 
     * The 
     * <b>GetAdaptersInfo</b> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getinterfaceinfo">GetInterfaceInfo</a> functions do not return information about the IPv4 loopback interface. Information on the loopback interface is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getipaddrtable">GetIpAddrTable</a> function.
     * 
     * <b>On Windows XP and later:  </b>The list of adapters returned by 
     * <b>GetAdaptersInfo</b> includes unidirectional adapters. To generate a list of adapters that can both send and receive data, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getunidirectionaladapterinfo">GetUniDirectionalAdapterInfo</a>, and exclude the returned adapters from the list returned by 
     * <b>GetAdaptersInfo</b>.
     * @param {Pointer<IP_ADAPTER_INFO>} AdapterInfo A pointer to a buffer that receives a linked list of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iptypes/ns-iptypes-ip_adapter_info">IP_ADAPTER_INFO</a> structures.
     * @param {Pointer<UInt32>} SizePointer A pointer to a <b>ULONG</b> variable that specifies the size of the buffer pointed to by the <i>pAdapterInfo</i> parameter. If this size is insufficient to hold the adapter information, 
     * <b>GetAdaptersInfo</b> fills in this variable with the required size, and returns an error code of <b>ERROR_BUFFER_OVERFLOW</b>.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b> (defined to the same value as <b>NO_ERROR</b>).
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BUFFER_OVERFLOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer to receive the adapter information is too small. This value is returned if the buffer size indicated by the <i>pOutBufLen</i> parameter is too small to hold the adapter information or the <i>pAdapterInfo</i> parameter was a <b>NULL</b> pointer. When this error code is returned, the <i>pOutBufLen</i> parameter points to the required buffer size.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid adapter information was retrieved.
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
     * One of the parameters is invalid. This error is returned if the  <i>pOutBufLen</i> parameter is a <b>NULL</b> pointer, or the calling process does not have read/write access to the memory pointed to by <i>pOutBufLen</i> or the calling process does not have write access to the memory pointed to by the <i>pAdapterInfo</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No adapter information exists for the local computer.
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
     * The <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getadaptersinfo">GetAdaptersInfo</a> function is not supported by the operating system running on the local computer.
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
     * If the function fails, use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-getadaptersinfo
     * @since windows5.0
     */
    static GetAdaptersInfo(AdapterInfo, SizePointer) {
        result := DllCall("IPHLPAPI.dll\GetAdaptersInfo", "ptr", AdapterInfo, "ptr", SizePointer, "uint")
        return result
    }

    /**
     * The GetAdapterOrderMap function obtains an adapter order map that indicates priority for interfaces on the local computer.
     * @remarks
     * Interface indices appear in the order specified in the Adapters and Bindings dialog box in the Advanced Settings property sheet. This ordering is used as a tie breaker controlling the sequence in which interfaces are used on multihomed systems for situations including route selection, DNS name resolution, and other network related operations.
     * 
     * This function should not be called directly. Instead, use the <a href="https://docs.microsoft.com/windows/desktop/api/iptypes/ns-iptypes-ip_adapter_info">IP_ADAPTER_INFO</a> structure returned in a <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getadaptersinfo">GetAdaptersInfo</a> function call.
     * 
     * <div class="alert"><b>Note</b>  The caller is responsible for calling the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> function to free the array returned by <b>GetAdapterOrderMap</b>.</div>
     * <div> </div>
     * @returns {Pointer<IP_ADAPTER_ORDER_MAP>} Returns an <a href="https://docs.microsoft.com/windows/desktop/api/ipexport/ns-ipexport-ip_adapter_order_map">IP_ADAPTER_ORDER_MAP</a> structure filled with adapter priority information.  See the <b>IP_ADAPTER_ORDER_MAP</b> structure for more information.
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-getadapterordermap
     * @since windows5.1.2600
     */
    static GetAdapterOrderMap() {
        result := DllCall("IPHLPAPI.dll\GetAdapterOrderMap", "ptr")
        return result
    }

    /**
     * Retrieves the addresses associated with the adapters on the local computer.
     * @remarks
     * The  
     * <b>GetAdaptersAddresses</b> function can retrieve information for IPv4 and IPv6 addresses. 
     * 
     * Addresses are returned as a linked list of <a href="https://docs.microsoft.com/windows/desktop/api/iptypes/ns-iptypes-ip_adapter_addresses_lh">IP_ADAPTER_ADDRESSES</a> structures in the buffer pointed to by the <i>AdapterAddresses</i> parameter. The application that calls the <b>GetAdaptersAddresses</b> function must allocate the amount of memory needed to return the <b>IP_ADAPTER_ADDRESSES</b> structures pointed to by the <i>AdapterAddresses</i> parameter. When these returned structures are no longer required, the application should free the memory allocated. This can be accomplished by calling the <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapalloc">HeapAlloc</a> function to allocate memory and later calling the <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapfree">HeapFree</a> function to free the allocated memory, as shown in the example code. Other memory allocation and free functions can be used as long as the same family of functions are used for both the allocation and the free function.
     * 
     * <b>GetAdaptersAddresses</b> is implemented only as a synchronous function call.  The <b>GetAdaptersAddresses</b> function requires a significant amount of network resources and time to complete since all of the low-level network interface tables must be traversed. 
     * 
     * One method that can be used to determine the memory needed to return the <a href="https://docs.microsoft.com/windows/desktop/api/iptypes/ns-iptypes-ip_adapter_addresses_lh">IP_ADAPTER_ADDRESSES</a> structures pointed to by the <i>AdapterAddresses</i> parameter is to pass too small a buffer size as indicated in the <i>SizePointer</i> parameter in the first call to the <b>GetAdaptersAddresses</b> function,  so the function will fail with <b>ERROR_BUFFER_OVERFLOW</b>. When the return value is <b>ERROR_BUFFER_OVERFLOW</b>, the <i>SizePointer</i> parameter returned points to the required size of the buffer to hold the adapter information. Note that it is possible for the buffer size required for the <b>IP_ADAPTER_ADDRESSES</b> structures pointed to by the <i>AdapterAddresses</i> parameter to change between subsequent calls to the <b>GetAdaptersAddresses</b> function if an adapter address is added or removed.   However, this method of using the <b>GetAdaptersAddresses</b> function is strongly discouraged. This method requires calling the <b>GetAdaptersAddresses</b> function multiple times. 
     * 
     * The recommended method of calling the <b>GetAdaptersAddresses</b> function is to pre-allocate a 15KB working buffer pointed to by the <i>AdapterAddresses</i> parameter. On typical computers, this dramatically reduces the chances that the <b>GetAdaptersAddresses</b> function returns <b>ERROR_BUFFER_OVERFLOW</b>, which would require calling  <b>GetAdaptersAddresses</b> function multiple times. The example code illustrates this method of use. 
     * 
     * In versions prior to Windows 10, the order in which adapters appear in the list returned by this function can be controlled from the Network Connections folder: select the Advanced Settings menu item from the Advanced menu. Starting with Windows 10, the order in which adapters appear in the list is determined by the IPv4 or IPv6 route metric.
     * 
     * If the GAA_FLAG_INCLUDE_ALL_INTERFACES is set, then all NDIS adapters will be retrieved even those addresses associated with adapters not bound to an address family specified in the <i>Family</i> parameter. When this flag is not set, then only the addresses that are bound to an adapter enabled for the address family specified in the <i>Family</i> parameter are returned.
     * 
     * The size of the <a href="https://docs.microsoft.com/windows/desktop/api/iptypes/ns-iptypes-ip_adapter_addresses_lh">IP_ADAPTER_ADDRESSES</a> structure was changed on Windows XP with Service Pack 1 (SP1) and later. Several additional members were added to this structure. The size of the <b>IP_ADAPTER_ADDRESSES</b> structure was also changed on Windows Vista and later. A number of additional members were added to this structure. The size of the 
     *      <b>IP_ADAPTER_ADDRESSES</b> structure also changed on 
     *      Windows Vista with Service Pack 1 (SP1)and later and onWindows Server 2008 and later. One additional member was added to this structure. The <b>Length</b> member of the <b>IP_ADAPTER_ADDRESSES</b> structure returned in the linked list of structures in the buffer pointed to by the <i>AdapterAddresses</i> parameter should be used to determine which version of the <b>IP_ADAPTER_ADDRESSES</b> structure is being used. 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getipaddrtable">GetIpAddrTable</a> function retrieves the interface–to–IPv4 address mapping table on a local computer and returns this information in an <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipaddrtable">MIB_IPADDRTABLE</a> structure.
     * 
     * On the Platform Software Development Kit (SDK) released for Windows Server 2003 and earlier, the return value for the <b>GetAdaptersAddresses</b> function was defined as a <b>DWORD</b>, rather than a <b>ULONG</b>.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/ws2def/ns-ws2def-socket_address">SOCKET_ADDRESS</a> structure is used in the <a href="https://docs.microsoft.com/windows/desktop/api/iptypes/ns-iptypes-ip_adapter_addresses_lh">IP_ADAPTER_ADDRESSES</a> structure pointed to by the <i>AdapterAddresses</i> parameter. On the Microsoft Windows Software Development Kit (SDK) released for Windows Vista and later, the organization of header files has changed and the <b>SOCKET_ADDRESS</b> structure is defined in the <i>Ws2def.h</i> header file which is automatically included by the <i>Winsock2.h</i> header file. On the Platform SDK released for Windows Server 2003 and Windows XP, the <b>SOCKET_ADDRESS</b> structure is declared in the <i>Winsock2.h</i> header file. In order to use the <b>IP_ADAPTER_ADDRESSES</b> structure, the <i>Winsock2.h</i> header file must be included before the <i>Iphlpapi.h</i> header file.
     * @param {Integer} Family 
     * @param {Integer} Flags The type of addresses to retrieve. The possible values are defined in the <i>Iptypes.h</i> header file. Note that the <i>Iptypes.h</i> header file is automatically included in <i>Iphlpapi.h</i>, and should never be used directly.
     * @param {Pointer<IP_ADAPTER_ADDRESSES_LH>} AdapterAddresses A pointer to a buffer that contains a linked list of <a href="https://docs.microsoft.com/windows/desktop/api/iptypes/ns-iptypes-ip_adapter_addresses_lh">IP_ADAPTER_ADDRESSES</a> structures on successful return.
     * @param {Pointer<UInt32>} SizePointer A pointer to a variable that specifies the size of the buffer pointed to by <i>AdapterAddresses</i>.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b> (defined to the same value as <b>NO_ERROR</b>).
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ADDRESS_NOT_ASSOCIATED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An address has not yet been associated with the network endpoint. DHCP lease information was available.
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
     * The buffer size indicated by the <i>SizePointer</i> parameter is too small to hold the adapter information or the <i>AdapterAddresses</i> parameter is <b>NULL</b>. The <i>SizePointer</i> parameter returned points to the required size of the buffer to hold the adapter information.
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
     * One of the parameters is invalid. This error is returned for any of the following conditions: the <i>SizePointer</i> parameter is <b>NULL</b>, the <i>Address</i> parameter is not <b>AF_INET</b>, <b>AF_INET6</b>, or <b>AF_UNSPEC</b>, or the address information for the parameters requested is greater than <b>ULONG_MAX</b>.
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
     * Insufficient memory resources are available to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No addresses were found for the requested parameters.
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-getadaptersaddresses
     * @since windows5.1.2600
     */
    static GetAdaptersAddresses(Family, Flags, AdapterAddresses, SizePointer) {
        static Reserved := 0 ;Reserved parameters must always be NULL

        result := DllCall("IPHLPAPI.dll\GetAdaptersAddresses", "uint", Family, "uint", Flags, "ptr", Reserved, "ptr", AdapterAddresses, "ptr", SizePointer, "uint")
        return result
    }

    /**
     * The GetPerAdapterInfo function retrieves information about the adapter corresponding to the specified interface.
     * @remarks
     * An  adapter index  may change when the adapter is disabled and then enabled, or under other circumstances, and should not be considered persistent.
     * @param {Integer} IfIndex Index of an interface. 
     * The <b>GetPerAdapterInfo</b> function retrieves information for the adapter corresponding to this interface.
     * @param {Pointer<IP_PER_ADAPTER_INFO_W2KSP1>} pPerAdapterInfo Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iptypes/ns-iptypes-ip_per_adapter_info_w2ksp1">IP_PER_ADAPTER_INFO</a> structure that receives information about the adapter.
     * @param {Pointer<UInt32>} pOutBufLen Pointer to a <b>ULONG</b> variable that specifies the size of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iptypes/ns-iptypes-ip_per_adapter_info_w2ksp1">IP_PER_ADAPTER_INFO</a> structure. If this size is insufficient to hold the information, 
     * <b>GetPerAdapterInfo</b> fills in this variable with the required size, and returns an error code of ERROR_BUFFER_OVERFLOW.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BUFFER_OVERFLOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer size indicated by the <i>pOutBufLen</i> parameter is too small to hold the adapter information. The <i>pOutBufLen</i> parameter points to the required size.
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
     * The <i>pOutBufLen</i> parameter is <b>NULL</b>, or the calling process does not have read/write access to the memory pointed to by <i>pOutBufLen</i>, or the calling process does not have write access to the memory pointed to by the <i>pAdapterInfo</i> parameter.
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
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getperadapterinfo">GetPerAdapterInfo</a> is not supported by the operating system running on the local computer.
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
     * If the function fails, use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-getperadapterinfo
     * @since windows5.0
     */
    static GetPerAdapterInfo(IfIndex, pPerAdapterInfo, pOutBufLen) {
        result := DllCall("IPHLPAPI.dll\GetPerAdapterInfo", "uint", IfIndex, "ptr", pPerAdapterInfo, "ptr", pOutBufLen, "uint")
        return result
    }

    /**
     * Retrieves the currently enabled timestamp capabilities of a network adapter.
     * @param {Pointer<NET_LUID_LH>} InterfaceLuid Type: \_In\_ **CONST [NET_LUID](/windows/win32/api/ifdef/ns-ifdef-net_luid_lh)\***
     * 
     * The network locally unique identifier (LUID) of the network adapter for which currently enabled timestamp capabilities are to be retrieved.
     * @param {Pointer<INTERFACE_TIMESTAMP_CAPABILITIES>} TimestampCapabilites Type: \_Out\_ **[PINTERFACE_TIMESTAMP_CAPABILITIES](/windows/win32/api/iphlpapi/ns-iphlpapi-interface_timestamp_capabilities)**
     * 
     * If the function succeeds, then *TimestampCapabilites* returns a structure that describes the currently enabled timestamp capabilities.
     * @returns {Integer} Type: **[DWORD](/windows/win32/winprog/windows-data-types)**
     * 
     * If the function succeeds, then it returns **NO_ERROR**. If the network card corresponding to *InterfaceLuid* isn't timestamp-aware, then the function returns **ERROR_NOT_SUPPORTED**. If the network card driver advertises an unsupported timestamp configuration, then the function returns **ERROR_BAD_DRIVER**.
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-getinterfaceactivetimestampcapabilities
     */
    static GetInterfaceActiveTimestampCapabilities(InterfaceLuid, TimestampCapabilites) {
        result := DllCall("IPHLPAPI.dll\GetInterfaceActiveTimestampCapabilities", "ptr", InterfaceLuid, "ptr", TimestampCapabilites, "uint")
        return result
    }

    /**
     * Retrieves the supported timestamp capabilities of a network adapter.
     * @param {Pointer<NET_LUID_LH>} InterfaceLuid Type: \_In\_ **CONST [NET_LUID](/windows/win32/api/ifdef/ns-ifdef-net_luid_lh)\***
     * 
     * The network locally unique identifier (LUID) of the network adapter for which supported timestamp capabilities are to be retrieved.
     * @param {Pointer<INTERFACE_TIMESTAMP_CAPABILITIES>} TimestampCapabilites Type: \_Out\_ **[PINTERFACE_TIMESTAMP_CAPABILITIES](/windows/win32/api/iphlpapi/ns-iphlpapi-interface_timestamp_capabilities)**
     * 
     * If the function succeeds, then *TimestampCapabilites* returns a structure that describes the supported timestamp capabilities.
     * @returns {Integer} Type: **[DWORD](/windows/win32/winprog/windows-data-types)**
     * 
     * If the function succeeds, then it returns **NO_ERROR**. If the network card corresponding to *InterfaceLuid* isn't timestamp-aware, then the function returns **ERROR_NOT_SUPPORTED**.
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-getinterfacesupportedtimestampcapabilities
     */
    static GetInterfaceSupportedTimestampCapabilities(InterfaceLuid, TimestampCapabilites) {
        result := DllCall("IPHLPAPI.dll\GetInterfaceSupportedTimestampCapabilities", "ptr", InterfaceLuid, "ptr", TimestampCapabilites, "uint")
        return result
    }

    /**
     * Retrieves cross timestamp info for a network adapter.
     * @param {Pointer<NET_LUID_LH>} InterfaceLuid Type: \_In\_ **CONST [NET_LUID](/windows/win32/api/ifdef/ns-ifdef-net_luid_lh)\***
     * 
     * The network locally unique identifier (LUID) of the network adapter from which a cross timestamp is to be retrieved.
     * @param {Pointer<INTERFACE_HARDWARE_CROSSTIMESTAMP>} CrossTimestamp Type: \_Inout\_ **[PINTERFACE_HARDWARE_CROSSTIMESTAMP](/windows/win32/api/iphlpapi/ns-iphlpapi-interface_hardware_crosstimestamp)**
     * 
     * The timestamp is returned by the network adapter in the form of an [**INTERFACE_HARDWARE_CROSSTIMESTAMP**](/windows/win32/api/iphlpapi/ns-iphlpapi-interface_hardware_crosstimestamp) object.
     * @returns {Integer} Type: **[DWORD](/windows/win32/winprog/windows-data-types)**
     * 
     * A **DWORD** return code indicating success or failure.
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-captureinterfacehardwarecrosstimestamp
     */
    static CaptureInterfaceHardwareCrossTimestamp(InterfaceLuid, CrossTimestamp) {
        result := DllCall("IPHLPAPI.dll\CaptureInterfaceHardwareCrossTimestamp", "ptr", InterfaceLuid, "ptr", CrossTimestamp, "uint")
        return result
    }

    /**
     * Registers a user-implemented callback function, which the system calls to notify you of a timestamp capability change.
     * @param {Pointer<PINTERFACE_TIMESTAMP_CONFIG_CHANGE_CALLBACK>} Callback Type: \_In\_ **[PINTERFACE_TIMESTAMP_CONFIG_CHANGE_CALLBACK](/windows/win32/api/iphlpapi/nc-iphlpapi-interface_timestamp_config_change_callback)**
     * 
     * Your callback function, to be invoked when a timestamp capability change happens.
     * @param {Pointer<Void>} CallerContext Type: \_In_opt\_ **PVOID**
     * 
     * An optional caller-allocated context.
     * @param {Pointer<HIFTIMESTAMPCHANGE>} NotificationHandle Type: \_Out\_ **HIFTIMESTAMPCHANGE**
     * 
     * A handle, returned by the function, that identifies the registration.
     * @returns {Integer} Type: **[DWORD](/windows/win32/winprog/windows-data-types)**
     * 
     * A **DWORD** return code indicating success or failure.
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-registerinterfacetimestampconfigchange
     */
    static RegisterInterfaceTimestampConfigChange(Callback, CallerContext, NotificationHandle) {
        result := DllCall("IPHLPAPI.dll\RegisterInterfaceTimestampConfigChange", "ptr", Callback, "ptr", CallerContext, "ptr", NotificationHandle, "uint")
        return result
    }

    /**
     * Cancels notifications about timestamp capability changes by unregistering the callback function you registered in a call to [**RegisterInterfaceTimestampConfigChange**](/windows/win32/api/iphlpapi/nf-iphlpapi-registerinterfacetimestampconfigchange).
     * @param {Pointer<HIFTIMESTAMPCHANGE>} NotificationHandle Type: \_In\_ **HIFTIMESTAMPCHANGE**
     * 
     * The handle that was returned by [**RegisterInterfaceTimestampConfigChange**](/windows/win32/api/iphlpapi/nf-iphlpapi-registerinterfacetimestampconfigchange). This identifies the registration to be canceled.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-unregisterinterfacetimestampconfigchange
     */
    static UnregisterInterfaceTimestampConfigChange(NotificationHandle) {
        DllCall("IPHLPAPI.dll\UnregisterInterfaceTimestampConfigChange", "ptr", NotificationHandle)
    }

    /**
     * This function is reserved for system use, and you should not call it from your code. (GetInterfaceCurrentTimestampCapabilities)
     * @param {Pointer<NET_LUID_LH>} InterfaceLuid Reserved.
     * @param {Pointer<INTERFACE_TIMESTAMP_CAPABILITIES>} TimestampCapabilites Reserved.
     * @returns {Integer} Reserved.
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-getinterfacecurrenttimestampcapabilities
     */
    static GetInterfaceCurrentTimestampCapabilities(InterfaceLuid, TimestampCapabilites) {
        result := DllCall("IPHLPAPI.DLL\GetInterfaceCurrentTimestampCapabilities", "ptr", InterfaceLuid, "ptr", TimestampCapabilites, "uint")
        return result
    }

    /**
     * This function is reserved for system use, and you should not call it from your code. (GetInterfaceHardwareTimestampCapabilities)
     * @param {Pointer<NET_LUID_LH>} InterfaceLuid Reserved.
     * @param {Pointer<INTERFACE_TIMESTAMP_CAPABILITIES>} TimestampCapabilites Reserved.
     * @returns {Integer} Reserved.
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-getinterfacehardwaretimestampcapabilities
     */
    static GetInterfaceHardwareTimestampCapabilities(InterfaceLuid, TimestampCapabilites) {
        result := DllCall("IPHLPAPI.DLL\GetInterfaceHardwareTimestampCapabilities", "ptr", InterfaceLuid, "ptr", TimestampCapabilites, "uint")
        return result
    }

    /**
     * This function is reserved for system use, and you should not call it from your code. (NotifyIfTimestampConfigChange)
     * @param {Pointer<Void>} CallerContext Reserved.
     * @param {Pointer<PINTERFACE_TIMESTAMP_CONFIG_CHANGE_CALLBACK>} Callback Reserved.
     * @param {Pointer<HIFTIMESTAMPCHANGE>} NotificationHandle Reserved.
     * @returns {Integer} Reserved.
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-notifyiftimestampconfigchange
     */
    static NotifyIfTimestampConfigChange(CallerContext, Callback, NotificationHandle) {
        result := DllCall("IPHLPAPI.DLL\NotifyIfTimestampConfigChange", "ptr", CallerContext, "ptr", Callback, "ptr", NotificationHandle, "uint")
        return result
    }

    /**
     * This function is reserved for system use, and you should not call it from your code. (CancelIfTimestampConfigChange)
     * @param {Pointer<HIFTIMESTAMPCHANGE>} NotificationHandle Reserved.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-canceliftimestampconfigchange
     */
    static CancelIfTimestampConfigChange(NotificationHandle) {
        DllCall("IPHLPAPI.DLL\CancelIfTimestampConfigChange", "ptr", NotificationHandle)
    }

    /**
     * The IpReleaseAddress function releases an IPv4 address previously obtained through the Dynamic Host Configuration Protocol (DHCP).
     * @remarks
     * The 
     * <b>IpReleaseAddress</b> function is specific to IPv4 and releases only an IPv4 address previously obtained through the Dynamic Host Configuration Protocol (DHCP). The <b>Name</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/ipexport/ns-ipexport-ip_adapter_index_map">IP_ADAPTER_INDEX_MAP</a> structure pointed to by the <i>AdapterInfo</i> parameter is the only member used to determine the DHCP address to release. 
     * 
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/ipexport/ns-ipexport-ip_adapter_index_map">IP_ADAPTER_INDEX_MAP</a> structures is returned in the <a href="https://docs.microsoft.com/windows/desktop/api/ipexport/ns-ipexport-ip_interface_info">IP_INTERFACE_INFO</a> structure by the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getinterfaceinfo">GetInterfaceInfo</a> function.  The <b>IP_INTERFACE_INFO</b> structure returned by <b>GetInterfaceInfo</b> contains at least one <b>IP_ADAPTER_INDEX_MAP</b> structure even if the <b>NumAdapters</b> member of the <b>IP_INTERFACE_INFO</b> structure indicates that no network adapters with IPv4 are enabled. When the <b>NumAdapters</b> member of the <b>IP_INTERFACE_INFO</b> structure returned by <b>GetInterfaceInfo</b> is zero, the value of the members of the single  <b>IP_ADAPTER_INDEX_MAP</b> structure returned in the <b>IP_INTERFACE_INFO</b> structure is undefined. 
     * 
     * If the <b>Name</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/ipexport/ns-ipexport-ip_adapter_index_map">IP_ADAPTER_INDEX_MAP</a> structure pointed to by the <i>AdapterInfo</i> parameter is <b>NULL</b>, the 
     * <b>IpReleaseAddress</b> function returns <b>ERROR_INVALID_PARAMETER</b>.  
     * 
     * There are no functions available for releasing or renewing an IPv6 address. This can only be done by executing the Ipconfig command:
     *   
     * 
     * <b>ipconfig /release6
     *   </b>
     * 
     * <b>ipconfig /renew6</b>
     * @param {Pointer<IP_ADAPTER_INDEX_MAP>} AdapterInfo A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ipexport/ns-ipexport-ip_adapter_index_map">IP_ADAPTER_INDEX_MAP</a> structure that specifies the adapter associated with the IPv4 address to release.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
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
     * One of the parameters is invalid. This error is returned if the <i>AdapterInfo</i> parameter is <b>NULL</b> or if the <b>Name</b> member of the <b>PIP_ADAPTER_INDEX_MAP</b> structure pointed to by the <i>AdapterInfo</i> parameter is invalid. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_PROC_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An exception occurred during the request to DHCP for the release of the IPv4 address.
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-ipreleaseaddress
     * @since windows5.0
     */
    static IpReleaseAddress(AdapterInfo) {
        result := DllCall("IPHLPAPI.dll\IpReleaseAddress", "ptr", AdapterInfo, "uint")
        return result
    }

    /**
     * The IpRenewAddressfunction renews a lease on an IPv4 address previously obtained through Dynamic Host Configuration Protocol (DHCP).
     * @remarks
     * The 
     * <b>IpRenewAddress</b> function is specific to IPv4 and renews only an IPv4 address previously obtained through the Dynamic Host Configuration Protocol (DHCP). The <b>Name</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/ipexport/ns-ipexport-ip_adapter_index_map">IP_ADAPTER_INDEX_MAP</a> structure pointed to by the <i>AdapterInfo</i> parameter is the only member used to determine the DHCP address to renew.
     * 
     *   An array of  <a href="https://docs.microsoft.com/windows/desktop/api/ipexport/ns-ipexport-ip_adapter_index_map">IP_ADAPTER_INDEX_MAP</a> structures are returned in the <a href="https://docs.microsoft.com/windows/desktop/api/ipexport/ns-ipexport-ip_interface_info">IP_INTERFACE_INFO</a> structure by the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getinterfaceinfo">GetInterfaceInfo</a> function.  The <b>IP_INTERFACE_INFO</b> structure returned by <b>GetInterfaceInfo</b> contains at least one <b>IP_ADAPTER_INDEX_MAP</b> structure even if the <b>NumAdapters</b> member of the <b>IP_INTERFACE_INFO</b> structure indicates that no network adapters with IPv4 are enabled. When the <b>NumAdapters</b> member of the <b>IP_INTERFACE_INFO</b> structure returned by <b>GetInterfaceInfo</b> is zero, the value of the members of the single  <b>IP_ADAPTER_INDEX_MAP</b> structure returned in the <b>IP_INTERFACE_INFO</b> structure is undefined. 
     * 
     * If the <b>Name</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/ipexport/ns-ipexport-ip_adapter_index_map">IP_ADAPTER_INDEX_MAP</a> structure pointed to by the <i>AdapterInfo</i> parameter is <b>NULL</b>, the 
     * <b>IpRenewAddress</b> function returns <b>ERROR_INVALID_PARAMETER</b>.
     * 
     * There are no functions available for releasing or renewing an IPv6 address. This can only be done by executing the Ipconfig command:
     *   
     * 
     * <b>ipconfig /release6
     *   </b>
     * 
     * <b>ipconfig /renew6</b>
     * @param {Pointer<IP_ADAPTER_INDEX_MAP>} AdapterInfo A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ipexport/ns-ipexport-ip_adapter_index_map">IP_ADAPTER_INDEX_MAP</a> structure that specifies the adapter associated with the IP address to renew.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
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
     * One of the parameters is invalid. This error is returned if the <i>AdapterInfo</i> parameter is <b>NULL</b> or if the <b>Name</b> member of the <b>PIP_ADAPTER_INDEX_MAP</b> structure pointed to by the <i>AdapterInfo</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_PROC_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An exception occurred during the request to DHCP for the renewal of the IPv4 address.
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-iprenewaddress
     * @since windows5.0
     */
    static IpRenewAddress(AdapterInfo) {
        result := DllCall("IPHLPAPI.dll\IpRenewAddress", "ptr", AdapterInfo, "uint")
        return result
    }

    /**
     * The SendARP function sends an Address Resolution Protocol (ARP) request to obtain the physical address that corresponds to the specified destination IPv4 address.
     * @remarks
     * The <b>SendARP</b> function is used to request the physical hardware address (sometimes referred to as the MAC address) that corresponds to a specified destination IPv4 address. If the information requested is not in the ARP table on the local computer, then the <b>SendARP</b> function will cause an ARP request to be sent to obtain the physical address. If the function is successful, the physical address that corresponds to the specified destination IPv4 address is returned in the array pointed to by the <i>pMacAddr</i> parameter. 
     * 
     * The physical address of an IPv4 address is only available if the destination IPv4 address is on the local subnet (the IPv4 address can be reached directly without going through any routers). The <b>SendARP</b> function will fail if the destination IPv4 address is not on the local subnet. 
     * 
     * If the <b>SendARP</b> function is successful on Windows Vista and later, the ARP table on the local computer is updated with the results.  If the <b>SendARP</b> function is successful on Windows Server 2003 and earlier, the ARP table on the local computer is not affected. 
     * 
     * The <b>SendARP</b> function on Windows Vista and later returns different error return values  than the  <b>SendARP</b> function on    Windows Server 2003 and earlier. 
     * 
     *  On Windows Vista and later, a <b>NULL</b> pointer passed as the <i>pMacAddr</i> or <i>PhyAddrLen</i> parameter to the <b>SendARP</b> function causes an access violation and the application is terminated. If an error occurs on Windows Vista and later and <b>ERROR_BAD_NET_NAME</b>,  <b>ERROR_BUFFER_OVERFLOW</b>, or <b>ERROR_NOT_FOUND</b> is returned, the <b>ULONG</b> value pointed to by the <i>PhyAddrLen</i> parameter is set to zero. If the <b>ULONG</b> value pointed to by the <i>PhyAddrLen</i> parameter is less than 6 on  Windows Vista and later, <b>SendARP</b> function returns  <b>ERROR_BUFFER_OVERFLOW</b> indicating the buffer to receive the physical address is too small. If the <i>SrcIp</i> parameter specifies an IPv4 address that is not an interface on the local computer, the <b>SendARP</b> function on    Windows Vista and later  returns <b>ERROR_NOT_FOUND</b>. 
     * 
     *  On Windows Server 2003 and earlier, a <b>NULL</b> pointer passed as the <i>pMacAddr</i> or <i>PhyAddrLen</i> parameter to the <b>SendARP</b> function returns <b>ERROR_INVALID_PARAMETER</b>. If an error occurs on Windows Server 2003 and earlier and <b>ERROR_GEN_FAILURE</b> or   <b>ERROR_INVALID_USER_BUFFER</b> is returned, the <b>ULONG</b> value pointed to by the <i>PhyAddrLen</i> parameter is set to zero. If the <b>ULONG</b> value pointed to by the <i>PhyAddrLen</i> parameter is less than 6 on  Windows Server 2003 and earlier, the <b>SendARP</b> function does not return an error but only returns part of the hardware address in the array pointed to by the <i>pMacAddr</i> parameter. So if the value pointed to by the <i>PhyAddrLen</i> parameter is 4, then only the first 4 bytes of the hardware address are returned in the array pointed to by the <i>pMacAddr</i> parameter. If the <i>SrcIp</i> parameter specifies an IPv4 address that is not an interface on the local computer, the <b>SendARP</b> function on    Windows Server 2003 and  earlier ignores the <i>SrcIp</i> parameter and uses an IPv4 address on the local computer for the source IPv4 address. 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getipnettable">GetIpNetTable</a> function retrieves the ARP table on the local computer that maps IPv4 addresses to physical addresses.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-createipnetentry">CreateIpNetEntry</a> function creates an ARP entry in the ARP table on the local computer.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-deleteipnetentry">DeleteIpNetEntry</a> function deletes an ARP entry from the ARP table on the local computer.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-setipnetentry">SetIpNetEntry</a> function modifies an existing ARP entry in the ARP table on the local computer.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-flushipnettable">FlushIpNetTable</a> function deletes all ARP entries for the specified interface from the ARP table on the local computer. 
     * 
     * 
     * 
     * On Windows Vista and later, the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-resolveipnetentry2">ResolveIpNetEntry2</a> function can used to replace the <b>SendARP</b> function. An ARP request is sent if the <b>Address</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipnet_row2">MIB_IPNET_ROW2</a> structure passed to the <b>ResolveIpNetEntry2</b> function is an IPv4 address.  
     * 
     * On Windows Vista, a new group of functions can be used to access, modify, and delete the ARP table entries when the <b>Address</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipnet_row2">MIB_IPNET_ROW2</a> structure passed to these functions is an IPv4 address.  The new functions include the following: <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-getipnettable2">GetIpNetTable2</a>, <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-createipnetentry2">CreateIpNetEntry2</a>, <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-deleteipnetentry2">DeleteIpNetEntry2</a>,  <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-flushipnettable2">FlushIpNetTable2</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-setipnetentry2">SetIpNetEntry2</a>.
     * 
     * For information about the <b>IPAddr</b> data type, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">Windows Data Types</a>. To convert an IP address between dotted decimal notation and <b>IPAddr</b> format, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wsipv6ok/nf-wsipv6ok-inet_addr">inet_addr</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wsipv6ok/nf-wsipv6ok-inet_ntoa">inet_ntoa</a> functions.
     * @param {Integer} DestIP The destination IPv4 address, in the form of an <a href="https://docs.microsoft.com/windows/desktop/api/inaddr/ns-inaddr-in_addr">IPAddr</a> structure. The ARP request attempts to obtain the physical address that corresponds to this IPv4 address.
     * @param {Integer} SrcIP The source IPv4 address of the sender, in the form of an <a href="https://docs.microsoft.com/windows/desktop/api/inaddr/ns-inaddr-in_addr">IPAddr</a> structure. This parameter is optional and is used to select the interface to send the request on for the ARP entry. The caller may specify zero corresponding to the <b>INADDR_ANY</b> IPv4 address for this parameter.
     * @param {Pointer<Void>} pMacAddr A pointer to an array of <b>ULONG</b> variables. This array must have at least two <b>ULONG</b> elements to hold an  Ethernet or token ring physical address. The first six bytes of this array receive the physical address that corresponds to the IPv4 address specified by the <i>DestIP</i> parameter.
     * @param {Pointer<UInt32>} PhyAddrLen On input, a pointer to a <b>ULONG</b> value that specifies the maximum buffer size, in bytes, the application has set aside to receive the physical address or MAC address. The buffer size should be at least 6 bytes for an Ethernet or token ring physical address 
     * 
     * The buffer to receive the physical address is pointed to by the <i>pMacAddr</i> parameter. 
     * 
     * On successful output, this parameter points to a value that specifies the number of bytes written to the buffer pointed to by the <i>pMacAddr</i>.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_NET_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network name cannot be found. This error is returned on Windows Vista and later when an ARP reply to the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-sendarp">SendARP</a> request was not received. This error occurs  if the destination IPv4 address could not be reached because it is not on the same subnet or  the destination computer is not operating. 
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
     * The file name is too long. This error is returned on Windows Vista if the  <b>ULONG</b> value pointed to by the <i>PhyAddrLen</i> parameter is less than 6, the size required to store a complete physical address. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_GEN_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A device attached to the system is not functioning. This error is returned on Windows Server 2003 and earlier when an ARP reply to the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-sendarp">SendARP</a> request was not received. This error can occur if destination IPv4 address could not be reached because it is not on the same subnet or  the destination computer is not operating. 
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
     * One of the parameters is invalid. This error is returned on Windows Server 2003 and earlier if either the  <i>pMacAddr</i> or <i>PhyAddrLen</i> parameter is a <b>NULL</b> pointer. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_USER_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The supplied user buffer is not valid for the requested operation. This error is returned on Windows Server 2003 and earlier if the  <b>ULONG</b> value pointed to by the <i>PhyAddrLen</i> parameter is zero. 
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
     * Element not found. This error is returned on Windows Vista if the  the <i>SrcIp</i> parameter does not specify a source IPv4 address on an interface on the local computer or the <b>INADDR_ANY</b> IP address (an IPv4 address of 0.0.0.0). 
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
     * The <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-sendarp">SendARP</a> function is not supported by the operating system running on the local computer.
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
     * If the function fails, use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-sendarp
     * @since windows5.0
     */
    static SendARP(DestIP, SrcIP, pMacAddr, PhyAddrLen) {
        result := DllCall("IPHLPAPI.dll\SendARP", "uint", DestIP, "uint", SrcIP, "ptr", pMacAddr, "ptr", PhyAddrLen, "uint")
        return result
    }

    /**
     * The GetRTTAndHopCount function determines the round-trip time (RTT) and hop count to the specified destination.
     * @remarks
     * For information about the <b>IPAddr</b> data type, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">Windows Data Types</a>. To convert an IP address between dotted decimal notation and <b>IPAddr</b> format, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wsipv6ok/nf-wsipv6ok-inet_addr">inet_addr</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wsipv6ok/nf-wsipv6ok-inet_ntoa">inet_ntoa</a> functions.
     * @param {Integer} DestIpAddress IP address of the destination for which to determine the RTT and hop count, in the form of an <a href="https://docs.microsoft.com/windows/desktop/api/inaddr/ns-inaddr-in_addr">IPAddr</a> structure.
     * @param {Pointer<UInt32>} HopCount Pointer to a <b>ULONG</b> variable. This variable receives the hop count to the destination specified by the <i>DestIpAddress</i> parameter.
     * @param {Integer} MaxHops Maximum number of hops to search for the destination. If the number of hops to the destination exceeds this number, the function terminates the search and returns <b>FALSE</b>.
     * @param {Pointer<UInt32>} RTT Round-trip time, in milliseconds, to the destination specified by <i>DestIpAddress</i>.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. Call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> to obtain the error code for the failure.
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-getrttandhopcount
     * @since windows5.0
     */
    static GetRTTAndHopCount(DestIpAddress, HopCount, MaxHops, RTT) {
        A_LastError := 0

        result := DllCall("IPHLPAPI.dll\GetRTTAndHopCount", "uint", DestIpAddress, "ptr", HopCount, "uint", MaxHops, "ptr", RTT, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Takes an interface index and returns a backward-compatible interface index, that is, an index that uses only the lower 24 bits.
     * @param {Integer} IfIndex The interface index from which the backward-compatible or "friendly" interface index is derived.
     * @returns {Integer} A backward-compatible interface index that uses only the lower 24 bits.
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-getfriendlyifindex
     * @since windows5.0
     */
    static GetFriendlyIfIndex(IfIndex) {
        result := DllCall("IPHLPAPI.dll\GetFriendlyIfIndex", "uint", IfIndex, "uint")
        return result
    }

    /**
     * The EnableRouter function turns on IPv4 forwarding on the local computer. EnableRouter also increments a reference count that tracks the number of requests to enable IPv4 forwarding.
     * @remarks
     * The <b>EnableRouter</b> function is specific to IPv4 forwarding. If the process that calls 
     * <b>EnableRouter</b> terminates without calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-unenablerouter">UnenableRouter</a>, the system  decrements the reference count that tracks the number of requests to enable IPv4 forwarding as though the process had called 
     * <b>UnenableRouter</b>.
     * @param {Pointer<HANDLE>} pHandle A pointer to a handle. This parameter is currently unused.
     * @param {Pointer<OVERLAPPED>} pOverlapped A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure. Except for the <b>hEvent</b> member, all members of this structure should be set to zero. The <b>hEvent</b> member should contain a handle to a valid event object. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-createeventa">CreateEvent</a> function to create this event object.
     * @returns {Integer} If the <b>EnableRouter</b> function succeeds, the return value is ERROR_IO_PENDING.
     * 
     * If the function fails, use <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
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
     * One of the parameters is invalid. This error is returned if the <i>pOverlapped</i> parameter is <b>NULL</b>.
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-enablerouter
     * @since windows5.0
     */
    static EnableRouter(pHandle, pOverlapped) {
        result := DllCall("IPHLPAPI.dll\EnableRouter", "ptr", pHandle, "ptr", pOverlapped, "uint")
        return result
    }

    /**
     * The UnenableRouter function decrements the reference count that tracks the number of requests to enable IPv4 forwarding. When this reference count reaches zero, UnenableRouter turns off IPv4 forwarding on the local computer.
     * @remarks
     * The <b>UnenableRouter</b> function is specific to IPv4 forwarding. Each call that a process makes to 
     * <b>UnenableRouter</b> must correspond to a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-enablerouter">EnableRouter</a> by the same process. The system returns an error on extraneous calls to 
     * <b>UnenableRouter</b>. As a result, a given process is not able to decrement the reference count that tracks the number of requests for enabling IPv4 forwarding for another process. Also, if IPv4 forwarding was enabled by a given process, it cannot be disabled by a different process.
     * 
     * It is not possible to accurately determine the reference count that tracks the number of requests for enabling IPv4 forwarding since there might be other outstanding <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-enablerouter">EnableRouter</a> requests.
     *         So the value returned for the <i>lpdwEnableCount</i> parameter is always a large count equal to ULONG_MAX/2.
     *         
     * 
     * If the process that calls 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-enablerouter">EnableRouter</a> terminates without calling 
     * <b>UnenableRouter</b>, the system  decrements the reference count that tracks requests to enable  IPv4 forwarding as though the process had called 
     * <b>UnenableRouter</b>. 
     * 
     * After calling the 
     * <b>UnenableRouter</b>, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a> call to close the handle to the event object in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure.
     * @param {Pointer<OVERLAPPED>} pOverlapped A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure. This structure should be the same as the one used in the call to 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-enablerouter">EnableRouter</a> function.
     * @param {Pointer<UInt32>} lpdwEnableCount An optional pointer to a <b>DWORD</b> variable. This variable receives the number of references remaining.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-unenablerouter
     * @since windows5.0
     */
    static UnenableRouter(pOverlapped, lpdwEnableCount) {
        result := DllCall("IPHLPAPI.dll\UnenableRouter", "ptr", pOverlapped, "ptr", lpdwEnableCount, "uint")
        return result
    }

    /**
     * The DisableMediaSense function disables the media sensing capability of the TCP/IP stack on a local computer.
     * @remarks
     * If the <i>pHandle</i> or <i>pOverlapped</i> parameters are <b>NULL</b>, the <b>DisableMediaSense</b> function is  executed synchronously. 
     * 
     * If both the <i>pHandle</i> and  <i>pOverlapped</i> parameters are not <b>NULL</b>, the <b>DisableMediaSense</b> function is  executed asynchronously using the <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure pointed to by the <i>pOverlapped</i> parameter. 
     * 
     * The <b>DisableMediaSense</b> function does not complete until the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-restoremediasense">RestoreMediaSense</a> function is called later to restore the media sensing capability. Until then, an I/O request packet (IRP) remains queued up. Alternatively, when the process that called <b>DisableMediaSense</b> exits, the IRP is canceled and a cancel routine is called that would again restore the media sensing capability. 
     * 
     * 
     * To call <b>DisableMediaSense</b> synchronously, an application needs to create a separate thread for this call. Otherwise it would keep waiting for IRP completion and the function will block. 
     * 
     * To call <b>DisableMediaSense</b> asynchronously, an application needs to allocate an <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure. Except for the <b>hEvent</b> member, all members of this structure must be set to zero. The <b>hEvent</b> member requires a handle to a valid event object. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-createeventa">CreateEvent</a> function to create this event. When called asynchronously, <b>DisableMediaSense</b> always returns ERROR_IO_PENDING. The IRP will be completed only when <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-restoremediasense">RestoreMediaSense</a> is called later.   Use the <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a> function to close the handle to the event object when it is no longer needed. The system closes the handle automatically when the process terminates. The event object is destroyed when its last handle has been closed. 
     * 
     * On Windows Server 2003and Windows XP, the TCP/IP stack implements a policy of deleting all IP addresses on an interface in response to a media sense disconnect event from an underlying network interface. If a network switch or hub that the local computer is connected to is powered off, or a network cable is disconnected, the network interface will deliver disconnection events. IP configuration information associated with the network interface is lost. As a result, the TCP/IP stack implements a policy of hiding disconnected interfaces so these interfaces and their associated IP addresses do not show up in configuration information retrieved through IP helper. This policy prevents some applications from easily detecting that a network interface is merely disconnected, rather than removed from the system.
     * 
     * This behavior does not normally impact a local client computer if it is using DHCP requests to a DHCP server for IP configuration information. But this can have a serious impact on server computers, particularly computers used as part of clusters. The <b>DisableMediaSense</b> function can be used to temporarily disable the media sensing capability for these cases. At some later time, the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-restoremediasense">RestoreMediaSense</a> function would be called to restore the media sensing capability.
     * 
     * The following registry setting is related to the <b>DisableMediaSense</b> and <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-restoremediasense">RestoreMediaSense</a> functions:
     * 
     * 
     * <b>System</b>&#92;<b>CurrentControlSet</b>&#92;<b>Services</b>&#92;<b>Tcpip</b>&#92;<b>Parameters</b>&#92;<b>DisableDHCPMediaSense</b>
     * 
     * 
     * 
     * There is an internal flag in Windows that is set if this registry key exists when the machine first boots up. The same internal flag also gets set and reset by calling <b>DisableMediaSense</b> and <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-restoremediasense">RestoreMediaSense</a>. However with registry setting, you need to reboot the machine for the changes to take place.
     * 
     * 
     * The TCP/IP stack on Windows Vista and later was changed to not hide disconnected interfaces when a disconnect event occurs. So on Windows Vista and later, the <b>DisableMediaSense</b> and <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-restoremediasense">RestoreMediaSense</a> functions don't do anything and always returns NO_ERROR.
     * @param {Pointer<HANDLE>} pHandle A pointer to a variable that is used to store a handle. If the <i>pOverlapped</i> parameter is not <b>NULL</b>, this variable will be used internally to store a handle required to call the IP driver and disable the media sensing capability.
     * 
     * An application should not use the value pointed to by this variable. This handle is for internal use and should not be closed.
     * @param {Pointer<OVERLAPPED>} pOverLapped A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure. Except for the <b>hEvent</b> member, all members of this structure must be set to zero. The <b>hEvent</b> member requires a handle to a valid event object. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-createeventa">CreateEvent</a> function to create this event object.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
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
     * An invalid parameter was passed to the function. This error is returned if an <i>pOverlapped</i> parameter is a bad pointer.  
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_IO_PENDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is in progress. This value is returned by a successful asynchronous call to <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-disablemediasense">DisableMediaSense</a>.  
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_OPEN_FAILED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle pointed to by the <i>pHandle</i> parameter was invalid.
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
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-disablemediasense
     * @since windows5.1.2600
     */
    static DisableMediaSense(pHandle, pOverLapped) {
        result := DllCall("IPHLPAPI.dll\DisableMediaSense", "ptr", pHandle, "ptr", pOverLapped, "uint")
        return result
    }

    /**
     * The RestoreMediaSense function restores the media sensing capability of the TCP/IP stack on a local computer on which the DisableMediaSense function was previously called.
     * @remarks
     * If the <i>pOverlapped</i> parameter is <b>NULL</b>, the <b>RestoreMediaSense</b> function is  executed synchronously. 
     * 
     * If the <i>pOverlapped</i> parameter is not <b>NULL</b>, the <b>RestoreMediaSense</b> function is  executed asynchronously using the <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure pointed to by the <i>pOverlapped</i> parameter. 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-disablemediasense">DisableMediaSense</a> function does not complete until the <b>RestoreMediaSense</b> function is called later to restore the media sensing capability. Until then, an I/O request packet (IRP) remains queued up. Alternatively, when the process that called <b>DisableMediaSense</b> exits, the IRP is canceled and a cancel routine is called that would again restore the media sensing capability. 
     * 
     * 
     * To call <b>RestoreMediaSense</b> synchronously, an application needs to pass a <b>NULL</b> pointer in the <i>pOverlapped</i> parameter. When <b>RestoreMediaSense</b> is called synchronously, the function returns when the I/O request packet (IRP) to restore the media sense has completed. 
     * 
     * To call <b>RestoreMediaSense</b> asynchronously, an application needs to allocate an <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure. Except for the <b>hEvent</b> member, all members of this structure must be set to zero. The <b>hEvent</b> member requires a handle to a valid event object. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-createeventa">CreateEvent</a> function to create this event. When called asynchronously, <b>RestoreMediaSense</b> can return return ERROR_IO_PENDING. The IRP completes when the media sensing capability has been restored. Use the <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a> function to close the handle to the event object when it is no longer needed. The system closes the handle automatically when the process terminates. The event object is destroyed when its last handle has been closed. 
     * 
     * If <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-disablemediasense">DisableMediaSense</a> was not called prior to calling <b>RestoreMediaSense</b>, then <b>RestoreMediaSense</b> returns ERROR_INVALID_PARAMETER.
     * 
     * On Windows Server 2003and Windows XP, the TCP/IP stack implements a policy of deleting all IP addresses on an interface in response to a media sense disconnect event from an underlying network interface. If a network switch or hub that the local computer is connected to is powered off, or a network cable is disconnected, the network interface will deliver disconnection events. IP configuration information associated with the network interface is lost. As a result, the TCP/IP stack implements a policy of hiding disconnected interfaces so these interfaces and their associated IP addresses do not show up in configuration information retrieved through IP helper. This policy prevents some applications from easily detecting that a network interface is merely disconnected, rather than removed from the system.
     * 
     * This behavior does not normally impact a local client computer if it is using DHCP requests to a DHCP server for IP configuration information. But this can have a serious impact on server computers, particularly computers used as part of clusters. The <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-disablemediasense">DisableMediaSense</a> function can be used to temporarily disable the media sense capability for these cases. At some later time, the <b>RestoreMediaSense</b> function would be called to restore the media sensing capability.
     * 
     * The following registry setting is related to the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-disablemediasense">DisableMediaSense</a> and <b>RestoreMediaSense</b> functions:
     * 
     * 
     * <b>System</b>&#92;<b>CurrentControlSet</b>&#92;<b>Services</b>&#92;<b>Tcpip</b>&#92;<b>Parameters</b>&#92;<b>DisableDHCPMediaSense</b>
     * 
     * 
     * 
     * There is an internal flag in Windows that is set if this registry key exists when the machine first boots up. The same internal flag also gets set and reset by calling <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-disablemediasense">DisableMediaSense</a> and <b>RestoreMediaSense</b>. However with registry setting, you need to reboot the machine for the changes to take place.
     * 
     * 
     * The TCP/IP stack on Windows Vista and later was changed to not hide disconnected interfaces when a disconnect event occurs. So on Windows Vista and later, the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-disablemediasense">DisableMediaSense</a> and <b>RestoreMediaSense</b> functions don't do anything and always returns NO_ERROR.
     * @param {Pointer<OVERLAPPED>} pOverlapped A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure. Except for the <b>hEvent</b> member, all members of this structure must be set to zero. The <b>hEvent</b> member should contain a handle to a valid event object. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-createeventa">CreateEvent</a> function to create this event object.
     * @param {Pointer<UInt32>} lpdwEnableCount An optional pointer to a DWORD variable that receives the number of references remaining if the <b>RestoreMediaSense</b> function succeeds. The variable is also used by the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-enablerouter">EnableRouter</a> and <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-unenablerouter">UnenableRouter</a> functions.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
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
     * An invalid parameter was passed to the function. This error is returned if an <i>pOverlapped</i> parameter is a bad pointer.  This error is also returned if the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-disablemediasense">DisableMediaSense</a> function was not called prior to calling the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-restoremediasense">RestoreMediaSense</a> function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_IO_PENDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is in progress. This value may be returned by a successful asynchronous call to <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-restoremediasense">RestoreMediaSense</a>.  
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_OPEN_FAILED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An internal handle to the driver was invalid. 
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
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-restoremediasense
     * @since windows5.1.2600
     */
    static RestoreMediaSense(pOverlapped, lpdwEnableCount) {
        result := DllCall("IPHLPAPI.dll\RestoreMediaSense", "ptr", pOverlapped, "ptr", lpdwEnableCount, "uint")
        return result
    }

    /**
     * The GetIpErrorString function retrieves an IP Helper error string.
     * @remarks
     * The <b>GetIpErrorString</b> function can be used to retrieve an IP Helper error string for an IP error code. The <b>IP_STATUS</b> error code passed in the <i>ErrorCode</i> parameter is returned in the <b>Status</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/ipexport/ns-ipexport-icmp_echo_reply">ICMP_ECHO_REPLY</a>, <a href="https://docs.microsoft.com/windows/desktop/api/ipexport/ns-ipexport-icmp_echo_reply32">ICMP_ECHO_REPLY32</a>, and  <a href="https://docs.microsoft.com/windows/desktop/api/ipexport/ns-ipexport-icmpv6_echo_reply_lh">ICMPV6_ECHO_REPLY</a> structures used by the ICMP and ICMPv6 functions.   The functions that use these structures include <a href="https://docs.microsoft.com/windows/desktop/api/icmpapi/nf-icmpapi-icmp6parsereplies">Icmp6ParseReplies</a>, <a href="https://docs.microsoft.com/windows/desktop/api/icmpapi/nf-icmpapi-icmp6sendecho2">Icmp6SendEcho2</a>, <a href="https://docs.microsoft.com/windows/desktop/api/icmpapi/nf-icmpapi-icmpparsereplies">IcmpParseReplies</a>, 
     * 			<a href="https://docs.microsoft.com/windows/desktop/api/icmpapi/nf-icmpapi-icmpsendecho">IcmpSendEcho</a>, <a href="https://docs.microsoft.com/windows/desktop/api/icmpapi/nf-icmpapi-icmpsendecho2">IcmpSendEcho2</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/icmpapi/nf-icmpapi-icmpsendecho2ex">IcmpSendEcho2Ex</a>.
     * 
     * The syntax for the <b>GetIpErrorString</b> function was slightly changed on the Microsoft Windows Software Development Kit (SDK) released for Windows Vista and later. The data type for the <i>Buffer</i> parameter was changed from <b>PWCHAR</b> to <b>PWSTR</b>.
     * @param {Integer} ErrorCode The error code to be retrieved. The possible values for this parameter are defined in the <i>Ipexport.h</i> header file.
     * @param {Pointer<PWSTR>} Buffer A pointer to the buffer that contains the error code string if the function returns with NO_ERROR.
     * @param {Pointer<UInt32>} Size A pointer to a <b>DWORD</b> that specifies the length, in characters, of the buffer pointed to by <i>Buffer</i> parameter, excluding the terminating null (i.e. the size of Buffer in characters, minus one).
     * @returns {Integer} Returns NO_ERROR upon success.
     * 
     * If the function fails, use <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-getiperrorstring
     * @since windows5.1.2600
     */
    static GetIpErrorString(ErrorCode, Buffer, Size) {
        result := DllCall("IPHLPAPI.dll\GetIpErrorString", "uint", ErrorCode, "ptr", Buffer, "ptr", Size, "uint")
        return result
    }

    /**
     * Resolves the physical address for a neighbor IP address entry on the local computer. (ResolveNeighbor)
     * @param {Pointer<SOCKADDR>} NetworkAddress A pointer to a   <a href="https://docs.microsoft.com/windows/desktop/WinSock/sockaddr-2">SOCKADDR</a> structure that contains the neighbor IP address entry and address family.
     * @param {Pointer<Void>} PhysicalAddress A pointer to a byte array buffer that will receive the physical address that corresponds to the IP address specified by the <i>NetworkAddress</i> parameter if the function is successful. The length of the byte array is passed in the <i>PhysicalAddressLength</i> parameter.
     * @param {Pointer<UInt32>} PhysicalAddressLength On input, this parameter specifies the maximum length, in bytes, of the buffer passed in the <i>PhysicalAddress</i> parameter to receive the physical address. If the function is successful, this parameter will receive the length of the physical address returned in the buffer pointed to by the <i>PhysicalAddress</i> parameter. If <b>ERROR_BUFFER_OVERFLOW</b> is returned, this parameter contains the number of bytes
     *         required to hold the physical address.
     * @returns {Integer} The <b>ResolveNeighbor</b> function always fails and returns the following error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
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
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-resolveneighbor
     * @since windows5.1.2600
     */
    static ResolveNeighbor(NetworkAddress, PhysicalAddress, PhysicalAddressLength) {
        result := DllCall("IPHLPAPI.dll\ResolveNeighbor", "ptr", NetworkAddress, "ptr", PhysicalAddress, "ptr", PhysicalAddressLength, "uint")
        return result
    }

    /**
     * Creates a persistent TCP port reservation for a consecutive block of TCP ports on the local computer.
     * @remarks
     * The <b>CreatePersistentTcpPortReservation</b> function is defined on Windows Vista and later. 
     * 
     * The <b>CreatePersistentTcpPortReservation</b> function is used to add a persistent reservation for a block of TCP ports. 
     * 
     * Applications and services which need to reserve ports fall into two categories. The first category includes components which need a particular port as part of their operation. Such components will generally prefer to specify their required port at installation time (in an application manifest, for example). The second category includes components which need any available port or block of ports at runtime. 
     * 
     * These two categories correspond to specific and wildcard port reservation requests. Specific reservation requests may be persistent or runtime, while wildcard port reservation requests are only supported at runtime. 
     * 
     * The <b>CreatePersistentTcpPortReservation</b> function provides the ability for an application or service to reserve a persistent block of TCP ports.  Persistent TCP port reservations are recorded in a persistent store for the TCP module in Windows. 
     * 
     * A caller obtains a persistent port reservation by specifying how many ports are required and whether a specific range is needed. If the request can be satisfied, the <b>CreatePersistentTcpPortReservation</b> function returns a unique opaque ULONG64 token, which subsequently identifies the reservation. A persistent TCP port reservation may be released by calling the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-deletepersistenttcpportreservation">DeletePersistentTcpPortReservation</a> function. Note that the token for a given persistent TCP port reservation may change each time the system is restarted.
     * 
     * 
     * 
     * Windows does not implement inter-component security for persistent reservations obtained using these functions. This means that if a component is granted the ability to obtain any persistent port reservations, that component automatically gains the ability to consume any persistent port reservations granted to any other component on the system. Process-level security is enforced for runtime reservations, but such control cannot be extended to persistent port reservations created using the <b>CreatePersistentTcpPortReservation</b> or  <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-createpersistentudpportreservation">CreatePersistentUdpPortReservation</a> function.
     * 
     * 
     * 
     * Once a persistent TCP port reservation has been obtained, an application can request port assignments from the TCP port reservation by opening a TCP socket, then calling the <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/nf-winsock2-wsaioctl">WSAIoctl</a> function specifying the <a href="https://docs.microsoft.com/windows/win32/winsock/sio-associate-port-reservation">SIO_ASSOCIATE_PORT_RESERVATION</a> IOCTL and passing the reservation token before issuing a call to the <a href="https://docs.microsoft.com/windows/desktop/api/winsock/nf-winsock-bind">bind</a> function on the socket. 
     * 
     * The <a href="https://docs.microsoft.com/windows/win32/winsock/sio-acquire-port-reservation">SIO_ACQUIRE_PORT_RESERVATION</a> IOCTL can be used to request a runtime reservation for a block of TCP or UDP ports. For runtime port reservations, the port pool requires that reservations be consumed from the process on whose socket the reservation was granted. Runtime port reservations last only as long as the lifetime of the socket on which the <b>SIO_ACQUIRE_PORT_RESERVATION</b> IOCTL was called.  In contrast, persistent port reservations created using the <b>CreatePersistentTcpPortReservation</b> function may be consumed by any process with the ability to obtain persistent reservations. 
     * 
     * 
     * 
     * The <b>CreatePersistentTcpPortReservation</b> function can only be called by a user logged on as a member of the Administrators group. If <b>CreatePersistentTcpPortReservation</b> is called by a user that is not a member of the Administrators group, the function call will fail and <b>ERROR_ACCESS_DENIED</b> is returned. This function can also fail because of user account control (UAC) on Windows Vista and later. If an application that contains this function is executed by a user logged on as a member of the Administrators group other than the built-in Administrator, this call will fail unless the application has been marked in the manifest file with a <b>requestedExecutionLevel</b> set to requireAdministrator. If the application lacks this manifest file, a user logged on as a member of the Administrators group other than the built-in Administrator must then be executing the application in an enhanced shell as the built-in Administrator (RunAs administrator) for this function to succeed.
     * @param {Integer} StartPort The starting TCP port number in network byte order.
     * @param {Integer} NumberOfPorts The number of TCP port numbers to reserve.
     * @param {Pointer<UInt64>} Token A pointer to a port reservation token that is returned if the function succeeds.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
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
     * Access is denied. This error is returned under several conditions that include the following: the  user lacks the required administrative privileges on the local computer or the application is not running in an enhanced shell as the built-in Administrator (RunAs administrator).  
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
     * An invalid parameter was passed to the function. 
     * 
     * This error is returned if zero is passed in the <i>StartPort</i>  or <i>NumberOfPorts</i> parameters. This error is also returned if the <i>NumberOfPorts</i> parameter is too large a block of ports depending on the <i>StartPort</i> parameter that the allocable block of ports would exceed the maximum port that can be allocated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SHARING_VIOLATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The process cannot access the file because it is being used by another process. This error is returned if a TCP port in the block of TCP ports specified by the <i>StartPort</i>  and <i>NumberOfPorts</i> parameters is already being used. This error is also returned if a persistent reservation for a block of TCP ports specified by the <i>StartPort</i>  and <i>NumberOfPorts</i> parameters matches or overlaps a persistent reservation for a block of TCP ports that was already created. 
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-createpersistenttcpportreservation
     * @since windows6.0.6000
     */
    static CreatePersistentTcpPortReservation(StartPort, NumberOfPorts, Token) {
        result := DllCall("IPHLPAPI.dll\CreatePersistentTcpPortReservation", "ushort", StartPort, "ushort", NumberOfPorts, "ptr", Token, "uint")
        return result
    }

    /**
     * Creates a persistent UDP port reservation for a consecutive block of UDP ports on the local computer.
     * @remarks
     * The <b>CreatePersistentUdpPortReservation</b> function is defined on Windows Vista and later. 
     * 
     * The <b>CreatePersistentUdpPortReservation</b> function is used to add a persistent reservation for a block of UDP ports. 
     * 
     * Applications and services which need to reserve ports fall into two categories. The first category includes components which need a particular port as part of their operation. Such components will generally prefer to specify their required port at installation time (in an application manifest, for example). The second category includes components which need any available port or block of ports at runtime. 
     * 
     * These two categories correspond to specific and wildcard port reservation requests. Specific reservation requests may be persistent or runtime, while wildcard port reservation requests are only supported at runtime. 
     * 
     * The <b>CreatePersistentUdpPortReservation</b> function provides the ability for an application or service to reserve persistently a block of UDP ports.  Persistent TCP reservations are recorded in a persistent store for the UDP module in Windows. 
     * 
     * A caller obtains a persistent port reservation by specifying how many ports are required and whether a specific range is needed. If the request can be satisfied, the <b>CreatePersistentUdpPortReservation</b> function returns a unique opaque ULONG64 token, which subsequently identifies the reservation. A persistent UDP port reservation may be released by calling the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-deletepersistentudpportreservation">DeletePersistentUdpPortReservation</a> function. Note that the token for a given persistent UDP port reservation may change each time the system is restarted.
     * 
     * 
     * 
     * Windows does not implement inter-component security for persistent reservations obtained using these functions. This means that if a component is granted the ability to obtain any persistent port reservations, that component automatically gains the ability to consume any persistent port reservations granted to any other component on the system. Process-level security is enforced for runtime reservations, but such control cannot be extended to persistent reservations created using the created using the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-createpersistenttcpportreservation">CreatePersistentTcpPortReservation</a> or  <b>CreatePersistentUdpPortReservation</b> function.
     * 
     * 
     * 
     * Once a persistent UDP port reservation has been obtained, an application can request port assignments from the UDP port reservation by opening a UDP socket, then calling the <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/nf-winsock2-wsaioctl">WSAIoctl</a> function specifying the <a href="https://docs.microsoft.com/windows/win32/winsock/sio-associate-port-reservation">SIO_ASSOCIATE_PORT_RESERVATION</a> IOCTL and passing the reservation token before issuing a call to the <a href="https://docs.microsoft.com/windows/desktop/api/winsock/nf-winsock-bind">bind</a> function on the socket. 
     * 
     * The <a href="https://docs.microsoft.com/windows/win32/winsock/sio-acquire-port-reservation">SIO_ACQUIRE_PORT_RESERVATION</a> IOCTL can be used to request a runtime reservation for a block of TCP or UDP ports. For runtime port reservations, the port pool requires that reservations be consumed from the process on whose socket the reservation was granted. Runtime port reservations last only as long as the lifetime of the socket on which the <b>SIO_ACQUIRE_PORT_RESERVATION</b> IOCTL was called.  In contrast, persistent port reservations created using the <b>CreatePersistentUdpPortReservation</b> function may be consumed by any process with the ability to obtain persistent reservations. 
     * 
     * 
     * 
     * The <b>CreatePersistentUdpPortReservation</b> function can only be called by a user logged on as a member of the Administrators group. If <b>CreatePersistentUdpPortReservation</b> is called by a user that is not a member of the Administrators group, the function call will fail and <b>ERROR_ACCESS_DENIED</b> is returned. This function can also fail because of user account control (UAC) on Windows Vista and later. If an application that contains this function is executed by a user logged on as a member of the Administrators group other than the built-in Administrator, this call will fail unless the application has been marked in the manifest file with a <b>requestedExecutionLevel</b> set to requireAdministrator. If the application lacks this manifest file, a user logged on as a member of the Administrators group other than the built-in Administrator must then be executing the application in an enhanced shell as the built-in Administrator (RunAs administrator) for this function to succeed.
     * @param {Integer} StartPort The starting UDP port number in network byte order.
     * @param {Integer} NumberOfPorts The number of UDP port numbers to reserve.
     * @param {Pointer<UInt64>} Token A pointer to a port reservation token that is returned if the function succeeds.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
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
     * Access is denied. This error is returned under several conditions that include the following: the  user lacks the required administrative privileges on the local computer or the application is not running in an enhanced shell as the built-in Administrator (RunAs administrator).  
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
     * An invalid parameter was passed to the function. 
     * 
     * This error is returned if zero is passed in the <i>StartPort</i>  or <i>NumberOfPorts</i> parameters. This error is also returned if the <i>NumberOfPorts</i> parameter is too large a block of ports depending on the <i>StartPort</i> parameter that the allocable block of ports would exceed the maximum port that can be allocated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SHARING_VIOLATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The process cannot access the file because it is being used by another process. This error is returned if a UDP port in the block of UDP ports specified by the <i>StartPort</i>  and <i>NumberOfPorts</i> parameters is already being used. This error is also returned if a persistent reservation for a block of UDP ports specified by the <i>StartPort</i>  and <i>NumberOfPorts</i> parameters matches or overlaps a persistent reservation for a block of UDP ports that was already created. 
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-createpersistentudpportreservation
     * @since windows6.0.6000
     */
    static CreatePersistentUdpPortReservation(StartPort, NumberOfPorts, Token) {
        result := DllCall("IPHLPAPI.dll\CreatePersistentUdpPortReservation", "ushort", StartPort, "ushort", NumberOfPorts, "ptr", Token, "uint")
        return result
    }

    /**
     * Deletes a persistent TCP port reservation for a consecutive block of TCP ports on the local computer. (DeletePersistentTcpPortReservation)
     * @remarks
     * The <b>DeletePersistentTcpPortReservation</b> function is defined on Windows Vista and later. 
     * 
     * The <b>DeletePersistentTcpPortReservation</b> function is used to delete a persistent reservation for a block of TCP ports. 
     * 
     * The <b>DeletePersistentTcpPortReservation</b> function can only be called by a user logged on as a member of the Administrators group. If <b>DeletePersistentTcpPortReservation</b> is called by a user that is not a member of the Administrators group, the function call will fail and <b>ERROR_ACCESS_DENIED</b> is returned. This function can also fail because of user account control (UAC) on Windows Vista and later. If an application that contains this function is executed by a user logged on as a member of the Administrators group other than the built-in Administrator, this call will fail unless the application has been marked in the manifest file with a <b>requestedExecutionLevel</b> set to requireAdministrator. If the application lacks this manifest file, a user logged on as a member of the Administrators group other than the built-in Administrator must then be executing the application in an enhanced shell as the built-in Administrator (RunAs administrator) for this function to succeed.
     * @param {Integer} StartPort The starting TCP port number in network byte order.
     * @param {Integer} NumberOfPorts The number of TCP port numbers to delete.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
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
     * Access is denied. This error is returned under several conditions that include the following: the  user lacks the required administrative privileges on the local computer or the application is not running in an enhanced shell as the built-in Administrator (RunAs administrator).  
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
     * An invalid parameter was passed to the function. This error is returned if zero is passed in the <i>StartPort</i>  or <i>NumberOfPorts</i> parameters. 
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
     * The element was not found. This error is returned if persistent port block specified by the <i>StartPort</i>  and <i>NumberOfPorts</i> parameters could not be found. 
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-deletepersistenttcpportreservation
     * @since windows6.0.6000
     */
    static DeletePersistentTcpPortReservation(StartPort, NumberOfPorts) {
        result := DllCall("IPHLPAPI.dll\DeletePersistentTcpPortReservation", "ushort", StartPort, "ushort", NumberOfPorts, "uint")
        return result
    }

    /**
     * Deletes a persistent TCP port reservation for a consecutive block of TCP ports on the local computer. (DeletePersistentUdpPortReservation)
     * @remarks
     * The <b>DeletePersistentUdpPortReservation</b> function is defined on Windows Vista and later. 
     * 
     * The <b>DeletePersistentUdpPortReservation</b> function is used to delete a persistent reservation for a block of UDP ports. 
     * 
     * The <b>DeletePersistentUdpPortReservation</b> function can only be called by a user logged on as a member of the Administrators group. If <b>DeletePersistentUdpPortReservation</b> is called by a user that is not a member of the Administrators group, the function call will fail and <b>ERROR_ACCESS_DENIED</b> is returned. This function can also fail because of user account control (UAC) on Windows Vista and later. If an application that contains this function is executed by a user logged on as a member of the Administrators group other than the built-in Administrator, this call will fail unless the application has been marked in the manifest file with a <b>requestedExecutionLevel</b> set to requireAdministrator. If the application lacks this manifest file, a user logged on as a member of the Administrators group other than the built-in Administrator must then be executing the application in an enhanced shell as the built-in Administrator (RunAs administrator) for this function to succeed.
     * @param {Integer} StartPort The starting UDP port number in network byte order.
     * @param {Integer} NumberOfPorts The number of UDP port numbers to delete.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
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
     * Access is denied. This error is returned under several conditions that include the following: the  user lacks the required administrative privileges on the local computer or the application is not running in an enhanced shell as the built-in Administrator (RunAs administrator).  
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
     * An invalid parameter was passed to the function. This error is returned if zero is passed in the <i>StartPort</i>  or <i>NumberOfPorts</i> parameters. 
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
     * The element was not found. This error is returned if persistent port block specified by the <i>StartPort</i>  and <i>NumberOfPorts</i> parameters could not be found. 
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-deletepersistentudpportreservation
     * @since windows6.0.6000
     */
    static DeletePersistentUdpPortReservation(StartPort, NumberOfPorts) {
        result := DllCall("IPHLPAPI.dll\DeletePersistentUdpPortReservation", "ushort", StartPort, "ushort", NumberOfPorts, "uint")
        return result
    }

    /**
     * Looks up the token for a persistent TCP port reservation for a consecutive block of TCP ports on the local computer.
     * @remarks
     * The <b>LookupPersistentTcpPortReservation</b>  function is defined on Windows Vista and later. 
     * 
     * The <b>LookupPersistentTcpPortReservation</b>  function is used to lookup the token for a persistent reservation for a block of TCP ports. 
     * 
     * A persistent reservation for a block of TCP ports is  created by a call to the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-createpersistenttcpportreservation">CreatePersistentTcpPortReservation</a> function. The <i>StartPort</i>  or <i>NumberOfPorts</i> parameters passed to the <b>LookupPersistentTcpPortReservation</b>  function must match the values used when the persistent reservation for a block of TCP ports was created by  the <b>CreatePersistentTcpPortReservation</b> function.
     * 
     * If the <b>LookupPersistentTcpPortReservation</b> function succeeds, the <i>Token</i> parameter returned will point to the token for the persistent port reservation for the block of TCP ports. Note that the token for a given persistent reservation for a block of TCP ports may change each time the system is restarted.
     * 
     * 
     * 
     * An application can request port assignments from the TCP port reservation by opening a TCP socket, then calling the <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/nf-winsock2-wsaioctl">WSAIoctl</a> function specifying the <a href="https://docs.microsoft.com/windows/win32/winsock/sio-associate-port-reservation">SIO_ASSOCIATE_PORT_RESERVATION</a> IOCTL and passing the reservation token before issuing a call to the <a href="https://docs.microsoft.com/windows/desktop/api/winsock/nf-winsock-bind">bind</a> function on the socket.
     * @param {Integer} StartPort The starting TCP port number in network byte order.
     * @param {Integer} NumberOfPorts The number of TCP port numbers  that were reserved.
     * @param {Pointer<UInt64>} Token A pointer to a port reservation token that is returned if the function succeeds.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
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
     * An invalid parameter was passed to the function. This error is returned if zero is passed in the <i>StartPort</i>  or <i>NumberOfPorts</i> parameters.
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
     * The element was not found. This error is returned if persistent port block specified by the <i>StartPort</i>  and <i>NumberOfPorts</i> parameters could not be found. 
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-lookuppersistenttcpportreservation
     * @since windows6.0.6000
     */
    static LookupPersistentTcpPortReservation(StartPort, NumberOfPorts, Token) {
        result := DllCall("IPHLPAPI.dll\LookupPersistentTcpPortReservation", "ushort", StartPort, "ushort", NumberOfPorts, "ptr", Token, "uint")
        return result
    }

    /**
     * Looks up the token for a persistent UDP port reservation for a consecutive block of TCP ports on the local computer.
     * @remarks
     * The <b>LookupPersistentUdpPortReservation</b>  function is defined on Windows Vista and later. 
     * 
     * The <b>LookupPersistentUdpPortReservation</b>  function is used to lookup the token for a persistent reservation for a block of UDP ports. 
     * 
     * A persistent reservation for a block of UDP ports is  created by a call to the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-createpersistentudpportreservation">CreatePersistentUdpPortReservation</a> function. The <i>StartPort</i>  or <i>NumberOfPorts</i> parameters passed to the <b>LookupPersistentUdpPortReservation</b>  function must match the values used when the persistent reservation for a block of TCP ports was created by  the <b>CreatePersistentUdpPortReservation</b> function.
     * 
     * If the <b>LookupPersistentUdpPortReservation</b> function succeeds, the <i>Token</i> parameter returned will point to the token for the persistent port reservation for the block of UDP ports. Note that the token for a given persistent reservation for a block of TCP ports may change each time the system is restarted.
     * 
     * 
     * 
     * An application can request port assignments from the UDP port reservation by opening a UDP socket, then calling the <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/nf-winsock2-wsaioctl">WSAIoctl</a> function specifying the <a href="https://docs.microsoft.com/windows/win32/winsock/sio-associate-port-reservation">SIO_ASSOCIATE_PORT_RESERVATION</a> IOCTL and passing the reservation token before issuing a call to the <a href="https://docs.microsoft.com/windows/desktop/api/winsock/nf-winsock-bind">bind</a> function on the socket.
     * @param {Integer} StartPort The starting UDP port number in network byte order.
     * @param {Integer} NumberOfPorts The number of UDP port numbers that were reserved.
     * @param {Pointer<UInt64>} Token A pointer to a port reservation token that is returned if the function succeeds.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
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
     * An invalid parameter was passed to the function. This error is returned if zero is passed in the <i>StartPort</i>  or <i>NumberOfPorts</i> parameters.
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
     * The element was not found. This error is returned if persistent port block specified by the <i>StartPort</i>  and <i>NumberOfPorts</i> parameters could not be found. 
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-lookuppersistentudpportreservation
     * @since windows6.0.6000
     */
    static LookupPersistentUdpPortReservation(StartPort, NumberOfPorts, Token) {
        result := DllCall("IPHLPAPI.dll\LookupPersistentUdpPortReservation", "ushort", StartPort, "ushort", NumberOfPorts, "ptr", Token, "uint")
        return result
    }

    /**
     * Parses the input network string and checks whether it is a legal representation of the specified IP network string type. If the string matches a type and its specification, the function can optionally return the parsed result.
     * @remarks
     * The <b>ParseNetworkString</b> function parses the input network string passed in the <i>NetworkString</i> parameter and checks whether it
     *     is a legal representation of one of the string types as specified in 
     *     the <i>Types</i> argument. If the string matches a type and its specification,
     *     the function succeeds and can optionally return the parsed result
     *     to the caller in the optional <i>AddressInfo</i>, <i>PortNumber</i>, and <i>PrefixLength</i> parameters when these parameters are not <b>NULL</b> pointers.
     * 
     * The <b>ParseNetworkString</b> function can parse representations of IPv4 or IPv6 addresses, 
     *     services, and networks, as well as named Internet addresses and 
     *     services using DNS names.
     * 
     * 
     * The [NET_ADDRESS_INFO](/windows/desktop/api/iphlpapi/ns-iphlpapi-net_address_info) structure pointed to by the <i>AddressInfo</i> parameter. The SOCKADDR_IN and SOCKADDR structures are defined in the  <i>Ws2def.h</i> header file which is automatically included by the <i>Winsock2.h</i> header file. The SOCKADDR_IN6 structure is defined in the <i>Ws2ipdef.h</i> header file which is automatically included by the <i>Ws2tcpip.h</i> header file. In order to use the <b>ParseNetworkString</b> function  and the <b>NET_ADDRESS_INFO</b> structure, the <i>Winsock2.h</i> and <i>Ws2tcpip.h</i> header files must be included before the <i>Iphlpapi.h</i> header file.
     * @param {Pointer<PWSTR>} NetworkString A pointer to the NULL-terminated network string to parse.
     * @param {Integer} Types The type of IP network string to parse. This parameter consists of one of network string types as defined in the <i>Iphlpapi.h</i> 
     *         header file.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NET_STRING_IPV4_ADDRESS"></a><a id="net_string_ipv4_address"></a><dl>
     * <dt><b>NET_STRING_IPV4_ADDRESS</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>NetworkString</i> parameter  points to an IPv4 address using Internet standard dotted-decimal notation.
     *    A network port or prefix must not be present in the network string. 
     * 
     * An example network string is the following:
     * 
     * <b>192.168.100.10</b>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NET_STRING_IPV4_SERVICE"></a><a id="net_string_ipv4_service"></a><dl>
     * <dt><b>NET_STRING_IPV4_SERVICE</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>NetworkString</i> parameter  points to an IPv4 service using Internet standard dotted-decimal notation.
     *    A network port is required as part of the network string. A prefix must not be present in the network string. 
     * 
     * An example network string is the following:
     * 
     * <b>192.168.100.10:80</b>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NET_STRING_IPV4_NETWORK"></a><a id="net_string_ipv4_network"></a><dl>
     * <dt><b>NET_STRING_IPV4_NETWORK</b></dt>
     * <dt>0x00000004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>NetworkString</i> parameter  points to an IPv4 network using Internet standard dotted-decimal notation.
     *    A network prefix that uses the Classless Inter-Domain Routing (CIDR) notation is required as part of the network string. A network port must not be present in the network string. 
     * 
     * An example network string is the following:
     * 
     * <b>192.168.100/24</b>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NET_STRING_IPV6_ADDRESS"></a><a id="net_string_ipv6_address"></a><dl>
     * <dt><b>NET_STRING_IPV6_ADDRESS</b></dt>
     * <dt>0x00000008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>NetworkString</i> parameter  points to an IPv6 address using Internet standard hexadecimal encoding.
     *    An IPv6 scope ID may be present in the network string. A network port or prefix must not be present in the network string.  
     * 
     * An example network string is the following:
     * 
     * <b>21DA:00D3:0000:2F3B:02AA:00FF:FE28:9C5A%2</b>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NET_STRING_IPV6_ADDRESS_NO_SCOPE"></a><a id="net_string_ipv6_address_no_scope"></a><dl>
     * <dt><b>NET_STRING_IPV6_ADDRESS_NO_SCOPE</b></dt>
     * <dt>0x00000008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>NetworkString</i> parameter  points to an IPv6 address using Internet standard hexadecimal encoding. An IPv6 scope ID must not be  present in the network string. A network port or prefix must not be present in the network string.  
     * 
     * An example network string is the following:
     * 
     * <b>21DA:00D3:0000:2F3B:02AA:00FF:FE28:9C5A</b>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NET_STRING_IPV6_SERVICE"></a><a id="net_string_ipv6_service"></a><dl>
     * <dt><b>NET_STRING_IPV6_SERVICE</b></dt>
     * <dt>0x00000020</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>NetworkString</i> parameter  points to an IPv6 service using Internet standard hexadecimal encoding.
     *    A network port is required as part of the network string. An IPv6 scope ID may be present in the network string. A prefix must not be present in the network string. 
     * 
     * An example network string with a scope ID is the following:
     * 
     * <b>[21DA:00D3:0000:2F3B:02AA:00FF:FE28:9C5A%2]:8080</b>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NET_STRING_IPV6_SERVICE_NO_SCOPE"></a><a id="net_string_ipv6_service_no_scope"></a><dl>
     * <dt><b>NET_STRING_IPV6_SERVICE_NO_SCOPE</b></dt>
     * <dt>0x00000040</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>NetworkString</i> parameter  points to an IPv6 service using Internet standard hexadecimal encoding.
     *    A network port is required as part of the network string. An IPv6 scope ID must not be present in the network string. A prefix must not be present in the network string. 
     * 
     * An example network string is the following:
     * 
     * <b>21DA:00D3:0000:2F3B:02AA:00FF:FE28:9C5A:8080</b>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NET_STRING_IPV6_NETWORK"></a><a id="net_string_ipv6_network"></a><dl>
     * <dt><b>NET_STRING_IPV6_NETWORK</b></dt>
     * <dt>0x00000080</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>NetworkString</i> parameter  points to an IPv6 network using Internet standard hexadecimal encoding.
     *    A network prefix in CIDR notation is required as part of the network string. A network port or scope ID must not be present in the network string. 
     * 
     * An example network string is the following:
     * 
     * <b>21DA:D3::/48</b>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NET_STRING_NAMED_ADDRESS"></a><a id="net_string_named_address"></a><dl>
     * <dt><b>NET_STRING_NAMED_ADDRESS</b></dt>
     * <dt>0x00000100</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>NetworkString</i> parameter  points to an Internet address using a Domain Name System (DNS) name.
     *    A network port or prefix must not be present in the network string. 
     * 
     * An example network string is the following:
     * 
     * <b>www.microsoft.com</b>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NET_STRING_NAMED_SERVICE"></a><a id="net_string_named_service"></a><dl>
     * <dt><b>NET_STRING_NAMED_SERVICE</b></dt>
     * <dt>0x00000200</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>NetworkString</i> parameter  points to an Internet service using a DNS name.
     *    A network port must be present in the network string. 
     * 
     * An example network string is the following:
     * 
     * <b>www.microsoft.com:80</b>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NET_STRING_IP_ADDRESS"></a><a id="net_string_ip_address"></a><dl>
     * <dt><b>NET_STRING_IP_ADDRESS</b></dt>
     * <dt>0x00000009</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>NetworkString</i> parameter  points to an IPv4 address using Internet standard dotted-decimal notation or an IPv6 address using the Internet standard hexadecimal encoding.
     *    An IPv6 scope ID may be present in the network string. A network port or prefix must not be present in the network string.  
     * 
     * This type matches either the <b>NET_STRING_IPV4_ADDRESS</b> or <b>NET_STRING_IPV6_ADDRESS</b> types.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NET_STRING_IP_ADDRESS_NO_SCOPE"></a><a id="net_string_ip_address_no_scope"></a><dl>
     * <dt><b>NET_STRING_IP_ADDRESS_NO_SCOPE</b></dt>
     * <dt>0x00000011</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>NetworkString</i> parameter  points to an IPv4 address using Internet standard dotted-decimal notation or an IPv6 address using Internet standard hexadecimal encoding.
     *    An IPv6 scope ID must not be present in the network string. A network port or prefix must not be present in the network string.  
     * 
     * This type matches either the <b>NET_STRING_IPV4_ADDRESS</b> or <b>NET_STRING_IPV6_ADDRESS_NO_SCOPE</b> types.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NET_STRING_IP_SERVICE"></a><a id="net_string_ip_service"></a><dl>
     * <dt><b>NET_STRING_IP_SERVICE</b></dt>
     * <dt>0x00000022</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>NetworkString</i> parameter  points to an IPv4 service or IPv6 service.
     *    A network port is required as part of the network string. An IPv6 scope ID may be present in the network string. A prefix must not be present in the network string. 
     * 
     * This type matches either the <b>NET_STRING_IPV4_SERVICE</b> or <b>NET_STRING_IPV6_SERVICE</b> types.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NET_STRING_IP_SERVICE_NO_SCOPE"></a><a id="net_string_ip_service_no_scope"></a><dl>
     * <dt><b>NET_STRING_IP_SERVICE_NO_SCOPE</b></dt>
     * <dt>0x00000042</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>NetworkString</i> parameter  points to an IPv4 service or IPv6 service.
     *    A network port is required as part of the network string. An IPv6 scope ID must not be present in the network string. A prefix must not be present in the network string. 
     * 
     * This type matches either the <b>NET_STRING_IPV4_SERVICE</b> or <b>NET_STRING_IPV6_SERVICE_NO_SCOPE</b> types.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NET_STRING_IP_NETWORK"></a><a id="net_string_ip_network"></a><dl>
     * <dt><b>NET_STRING_IP_NETWORK</b></dt>
     * <dt>0x00000084</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>NetworkString</i> parameter  points to an IPv4 or IPv6 network.
     *    A network prefix in CIDR notation is required as part of the network string. A network port or scope ID must not be present in the network. 
     * 
     * This type matches either the <b>NET_STRING_IPV4_NETWORK</b> or <b>NET_STRING_IPV6_NETWORK</b> types.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NET_STRING_ANY_ADDRESS"></a><a id="net_string_any_address"></a><dl>
     * <dt><b>NET_STRING_ANY_ADDRESS</b></dt>
     * <dt>0x00000209</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>NetworkString</i> parameter  points to an IPv4 address in Internet standard dotted-decimal notation, an IPv6 address in Internet standard hexadecimal encoding, or a DNS name.
     *    An IPv6 scope ID may be present in the network string for an IPv6 address. A network port or prefix must not be present in the network string.  
     * 
     * This type matches either the <b>NET_STRING_NAMED_ADDRESS</b> or <b>NET_STRING_IP_ADDRESS</b> types.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NET_STRING_ANY_ADDRESS_NO_SCOPE"></a><a id="net_string_any_address_no_scope"></a><dl>
     * <dt><b>NET_STRING_ANY_ADDRESS_NO_SCOPE</b></dt>
     * <dt>0x00000211</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>NetworkString</i> parameter  points to an IPv4 address in Internet standard dotted-decimal notation, an IPv6 address in Internet standard hexadecimal encoding, or a DNS name.
     *    An IPv6 scope ID must not be present in the network string for an IPv6 address. A network port or prefix must not be present in the network string.  
     * 
     * This type matches either the <b>NET_STRING_NAMED_ADDRESS</b> or <b>NET_STRING_IP_ADDRESS_NO_SCOPE</b> types.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NET_STRING_ANY_SERVICE"></a><a id="net_string_any_service"></a><dl>
     * <dt><b>NET_STRING_ANY_SERVICE</b></dt>
     * <dt>0x00000222</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>NetworkString</i> parameter  points to an IPv4 service or IPv6 service using IP address notation or a DNS name.
     *    A network port is required as part of the network string. An IPv6 scope ID may be present in the network string. A prefix must not be present in the network string. 
     * 
     * This type matches either the <b>NET_STRING_NAMED_SERVICE</b> or <b>NET_STRING_IP_SERVICE</b> types.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NET_STRING_ANY_SERVICE_NO_SCOPE"></a><a id="net_string_any_service_no_scope"></a><dl>
     * <dt><b>NET_STRING_ANY_SERVICE_NO_SCOPE</b></dt>
     * <dt>0x00000242</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>NetworkString</i> parameter  points to an IPv4 service or IPv6 service using IP address notation or a DNS name.
     *    A network port is required as part of the network string. An IPv6 scope ID must not be present in the network string. A prefix must not be present in the network string. 
     * 
     * This type matches either the <b>NET_STRING_NAMED_SERVICE</b> or <b>NET_STRING_IP_SERVICE_NO_SCOPE</b> types.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<NET_ADDRESS_INFO>} AddressInfo On success, the function returns a pointer to a <b>NET_ADDRESS_INFO</b> structure that contains the parsed IP address information if a <b>NULL</b> pointer was not passed in this parameter.
     * @param {Pointer<UInt16>} PortNumber On success, the function returns a pointer to the parsed network port in host order if a <b>NULL</b> pointer was not passed in this parameter. If a network port was not present in the <i>NetworkString</i> parameter, then a pointer to a value of zero is returned.
     * @param {Pointer<Byte>} PrefixLength On success, the function returns a pointer to the parsed prefix length if a <b>NULL</b> pointer was not passed in this parameter. If a prefix was not present in the <i>NetworkString</i> parameter, then a pointer to a value of -1 is returned.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer passed to the function is too small. This error is returned if the buffer pointed to by the <i>AddressInfo</i> parameter is too small to hold the parsed 
     *     network address.
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
     * An invalid parameter was passed to the function. This error is returned if a <b>NULL</b> pointer is passed in the <i>NetworkString</i> parameter
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-parsenetworkstring
     * @since windows6.0.6000
     */
    static ParseNetworkString(NetworkString, Types, AddressInfo, PortNumber, PrefixLength) {
        result := DllCall("IPHLPAPI.dll\ParseNetworkString", "ptr", NetworkString, "uint", Types, "ptr", AddressInfo, "ptr", PortNumber, "ptr", PrefixLength, "uint")
        return result
    }

    /**
     * Retrieves information for the specified interface on the local computer.
     * @remarks
     * The <b>GetIfEntry2</b> function is defined on Windows Vista and later. 
     * 
     * On input, at least one of the following members in the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_if_row2">MIB_IF_ROW2</a> structure passed in the <i>Row</i> parameter must be initialized: <b>InterfaceLuid</b> or <b>InterfaceIndex</b>.
     * 
     * The fields are used in the order listed above. So if the <b>InterfaceLuid</b> is specified, then this member is used to determine the interface. If no value was set for the  <b>InterfaceLuid</b> member (the value of this member was set to zero), then the <b>InterfaceIndex</b> member is next used to determine the interface. 
     * 
     * On output, the remaining fields of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_if_row2">MIB_IF_ROW2</a> structure pointed to by the <i>Row</i> parameter are filled in.
     * 
     * Note that the <i>Netioapi.h</i> header file is automatically included in <i>Iphlpapi.h</i> header file, and should never be used directly.
     * @param {Pointer<MIB_IF_ROW2>} Row A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_if_row2">MIB_IF_ROW2</a> structure that, on successful return, receives information for an interface on the local computer. On input, the <b>InterfaceLuid</b> or the <b>InterfaceIndex</b> member of the <b>MIB_IF_ROW2</b> must be set to the interface for which to retrieve information.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
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
     * The system cannot find the file specified. This error is returned if the  network interface LUID or interface index specified by the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_if_row2">MIB_IF_ROW2</a> pointed to by the <i>Row</i> parameter was not a value on the local machine.
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
     * An invalid parameter was passed to the function. This error is returned if a <b>NULL</b> parameter is passed in the <i>Row</i> parameter. This error is also returned if the both the <b>InterfaceLuid</b> and <b>InterfaceIndex</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_if_row2">MIB_IF_ROW2</a> pointed to by the <i>Row</i> parameter  are unspecified.
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
     * Use 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/netioapi/nf-netioapi-getifentry2
     * @since windows6.0.6000
     */
    static GetIfEntry2(Row) {
        result := DllCall("IPHLPAPI.dll\GetIfEntry2", "ptr", Row, "uint")
        return result
    }

    /**
     * Retrieves the specified level of information for the specified interface on the local computer.
     * @remarks
     * The  
     * <b>GetIfEntry2Ex</b> function retrieves information for a specified interface on a local system and returns this information in a pointer to a  
     * <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_if_row2">MIB_IF_ROW2</a> structure. <b>GetIfEntry2Ex</b> is an enhanced version of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-getifentry2">GetIfEntry2</a> function that allows selecting the level of interface information to retrieve.
     * 
     * On input, at least one of the following members in the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_if_row2">MIB_IF_ROW2</a> structure passed in the <i>Row</i> parameter must be initialized: <b>InterfaceLuid</b> or <b>InterfaceIndex</b>.
     * 
     * The fields are used in the order listed above. So if the <b>InterfaceLuid</b> is specified, then this member is used to determine the interface. If no value was set for the  <b>InterfaceLuid</b> member (the value of this member was set to zero), then the <b>InterfaceIndex</b> member is next used to determine the interface. 
     * 
     * On output, the remaining fields of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_if_row2">MIB_IF_ROW2</a> structure pointed to by the <i>Row</i> parameter are filled in.
     * 
     * Note that the <i>Netioapi.h</i> header file is automatically included in <i>Iphlpapi.h</i> header file, and should never be used directly.
     * @param {Integer} Level The level of interface information to retrieve. This parameter can be one of the values from the <b>MIB_IF_ENTRY_LEVEL</b> enumeration type defined in the <i>Netioapi.h</i> header file.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MibIfEntryNormal"></a><a id="mibifentrynormal"></a><a id="MIBIFENTRYNORMAL"></a><dl>
     * <dt><b>MibIfEntryNormal</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The values of statistics and state returned in members of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_if_row2">MIB_IF_ROW2</a> structure pointed to by the <i>Row</i> parameter are returned from the top of the filter stack.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MibIfEntryNormalWithoutStatistics_"></a><a id="mibifentrynormalwithoutstatistics_"></a><a id="MIBIFENTRYNORMALWITHOUTSTATISTICS_"></a><dl>
     * <dt><b>MibIfEntryNormalWithoutStatistics </b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The values of state (without statistics) returned in members of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_if_row2">MIB_IF_ROW2</a> structure  pointed to by the <i>Row</i> parameter are returned from the top of the filter stack.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<MIB_IF_ROW2>} Row A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_if_row2">MIB_IF_ROW2</a> structure that, on successful return, receives information for an interface on the local computer. On input, the <b>InterfaceLuid</b> or the <b>InterfaceIndex</b> member of the <b>MIB_IF_ROW2</b> must be set to the interface for which to retrieve information.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
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
     * The system cannot find the file specified. This error is returned if the  network interface LUID or interface index specified by the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_if_row2">MIB_IF_ROW2</a> pointed to by the <i>Row</i> parameter was not a value on the local machine.
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
     * An invalid parameter was passed to the function. This error is returned if a <b>NULL</b> parameter is passed in the <i>Row</i> parameter. This error is also returned if the both the <b>InterfaceLuid</b> and <b>InterfaceIndex</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_if_row2">MIB_IF_ROW2</a> pointed to by the <i>Row</i> parameter  are unspecified.
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
     * Use 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/netioapi/nf-netioapi-getifentry2ex
     * @since windows10.0.15063
     */
    static GetIfEntry2Ex(Level, Row) {
        result := DllCall("IPHLPAPI.dll\GetIfEntry2Ex", "int", Level, "ptr", Row, "uint")
        return result
    }

    /**
     * Retrieves the MIB-II interface table. (GetIfTable2)
     * @remarks
     * The  
     * <b>GetIfTable2</b> function enumerates the logical and physical interfaces on a local system and returns this information in a <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_if_table2">MIB_IF_TABLE2</a> structure. <b>GetIfTable2</b> is an enhanced version of the <b>GetIfTable</b> function. 
     * 
     * A similar <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-getiftable2ex">GetIfTable2Ex</a> function can be used to specify the level of interfaces to return. Calling the <b>GetIfTable2Ex</b> function with the <i>Level</i> parameter set to <b>MibIfTableNormal</b> retrieves the same results as calling the <b>GetIfTable2</b> function.
     * 
     * Interfaces are returned in a <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_if_table2">MIB_IF_TABLE2</a> structure in the buffer pointed to by the <i>Table</i> parameter. The <b>MIB_IF_TABLE2</b> structure contains an interface count and an array of <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_if_row2">MIB_IF_ROW2</a> structures for each interface. Memory is allocated by the <b>GetIfTable2</b> function for the <b>MIB_IF_TABLE2</b> structure and the <b>MIB_IF_ROW2</b> entries in this structure. When these returned structures are no longer required, free the memory by calling the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-freemibtable">FreeMibTable</a>.
     * 
     * Note that the returned <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_if_table2">MIB_IF_TABLE2</a> structure pointed to by the <i>Table</i> parameter may contain padding for alignment between the <b>NumEntries</b> member and the first <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_if_row2">MIB_IF_ROW2</a> array entry in the <b>Table</b> member of the <b>MIB_IF_TABLE2</b> structure. Padding for alignment may also be present between the <b>MIB_IF_ROW2</b> array entries. Any access to a <b>MIB_IF_ROW2</b> array entry should assume  padding may exist.
     * @param {Pointer<MIB_IF_TABLE2>} Table A pointer to a buffer that receives the table of interfaces in a <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_if_table2">MIB_IF_TABLE2</a> structure.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory resources are available to complete the operation.
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/netioapi/nf-netioapi-getiftable2
     * @since windows6.0.6000
     */
    static GetIfTable2(Table) {
        result := DllCall("IPHLPAPI.dll\GetIfTable2", "ptr", Table, "uint")
        return result
    }

    /**
     * Retrieves the MIB-II interface table. (GetIfTable2Ex)
     * @remarks
     * The  
     * <b>GetIfTable2Ex</b> function enumerates the logical and physical interfaces on a local system and returns this information in a <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_if_table2">MIB_IF_TABLE2</a> structure. <b>GetIfTable2Ex</b> is an enhanced version of the <b>GetIfTable</b> function that allows selecting the level of interface information to retrieve.
     * 
     * A similar <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-getiftable2">GetIfTable2</a> function can also be used to retrieve interfaces. but does not allow specifying the level of interfaces  to return. Calling the <b>GetIfTable2Ex</b> function with the <i>Level</i> parameter set to <b>MibIfTableNormal</b> retrieves the same results as calling the <b>GetIfTable2</b> function.
     * 
     * Interfaces are returned in a <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_if_table2">MIB_IF_TABLE2</a> structure in the buffer pointed to by the <i>Table</i> parameter. The <b>MIB_IF_TABLE2</b> structure contains an interface count and an array of <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_if_row2">MIB_IF_ROW2</a> structures for each interface. Memory is allocated by the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-getiftable2">GetIfTable2</a> function for the <b>MIB_IF_TABLE2</b> structure and the <b>MIB_IF_ROW2</b> entries in this structure. When these returned structures are no longer required, free the memory by calling the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-freemibtable">FreeMibTable</a>.
     * 
     * All interfaces including NDIS intermediate driver interfaces and NDIS filter driver interfaces are returned for either of the possible values for the <i>Level</i> parameter. The setting for the <i>Level</i> parameter affects how statistics and state members of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_if_row2">MIB_IF_ROW2</a> structure in the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_if_table2">MIB_IF_TABLE2</a> structure pointed to by the <i>Table</i> parameter for the interface are returned. For example, a network interface card (NIC)  will have a NDIS miniport driver.  An NDIS intermediate driver can be installed to  interface between upper-level protocol drivers and NDIS miniport drivers. An NDIS filter driver (LWF) can be attached on top of the NDIS intermediate driver. Assume that the NIC reports the MediaConnectState member of the  <b>MIB_IF_ROW2</b> structure as <b>MediaConnectStateConnected</b> but NDIS filter driver modifies the state and reports the state as <b>MediaConnectStateDisconnected</b>.
     * When the interface information is queried with <i>Level</i> parameter set to <b>MibIfTableNormal</b>, the state at the top of the filter stack, that is <b>MediaConnectStateDisconnected</b> is reported. When the interface is queried with the <i>Level</i> parameter set to <b>MibIfTableRaw</b>, the state at the interface level directly, that is <b>MediaConnectStateConnected</b> is returned.
     * 
     * 
     * Note that the returned <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_if_table2">MIB_IF_TABLE2</a> structure pointed to by the <i>Table</i> parameter may contain padding for alignment between the <b>NumEntries</b> member and the first <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_if_row2">MIB_IF_ROW2</a> array entry in the <b>Table</b> member of the <b>MIB_IF_TABLE2</b> structure. Padding for alignment may also be present between the <b>MIB_IF_ROW2</b> array entries. Any access to a <b>MIB_IF_ROW2</b> array entry should assume  padding may exist.
     * @param {Integer} Level The level of interface information to retrieve. This parameter can be one of the values from the <b>MIB_IF_TABLE_LEVEL</b> enumeration type defined in the <i>Netioapi.h</i> header file.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MibIfTableNormal"></a><a id="mibiftablenormal"></a><a id="MIBIFTABLENORMAL"></a><dl>
     * <dt><b>MibIfTableNormal</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The values of statistics and state returned in members of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_if_row2">MIB_IF_ROW2</a> structure in the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_if_table2">MIB_IF_TABLE2</a> structure pointed to by the <i>Table</i> parameter are returned from the top of the filter stack when this parameter is specified.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MibIfTableRaw"></a><a id="mibiftableraw"></a><a id="MIBIFTABLERAW"></a><dl>
     * <dt><b>MibIfTableRaw</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The values of statistics and state returned in members of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_if_row2">MIB_IF_ROW2</a> structure in the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_if_table2">MIB_IF_TABLE2</a> structure pointed to by the <i>Table</i> parameter are returned directly for the interface being queried.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<MIB_IF_TABLE2>} Table A pointer to a buffer that receives the table of interfaces in a <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_if_table2">MIB_IF_TABLE2</a> structure.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
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
     * An invalid parameter was passed to the function. This error is returned if an illegal value was passed in the <i>Level</i> parameter.
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
     * Insufficient memory resources are available to complete the operation.
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/netioapi/nf-netioapi-getiftable2ex
     * @since windows6.0.6000
     */
    static GetIfTable2Ex(Level, Table) {
        result := DllCall("IPHLPAPI.dll\GetIfTable2Ex", "int", Level, "ptr", Table, "uint")
        return result
    }

    /**
     * Retrieves a table of network interface stack row entries that specify the relationship of the network interfaces on an interface stack.
     * @remarks
     * The <b>GetIfStackTable</b> function is defined on Windows Vista and later. 
     * 
     * The  
     * <b>GetIfStackTable</b> function enumerates the physical and logical network interfaces on an interface stack on a local system and returns this information in a <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ifstack_table">MIB_IFSTACK_TABLE</a> structure. 
     * 
     * Interface stack entries are returned in a <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ifstack_table">MIB_IFSTACK_TABLE</a> structure in the buffer pointed to by the <i>Table</i> parameter. The <b>MIB_IFSTACK_TABLE</b> structure contains an interface stack entry count and an array of <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ifstack_row">MIB_IFSTACK_ROW</a> structures for each interface stack entry. 
     * 
     * The relationship between the interfaces in the interface stack is that the interface with index in the <b>HigherLayerInterfaceIndex</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ifstack_row">MIB_IFSTACK_ROW</a> structure is immediately above the interface with index in the <b>LowerLayerInterfaceIndex</b> member of the <b>MIB_IFSTACK_ROW</b> structure.
     * 
     * Memory is allocated by the <b>GetIfStackTable</b> function for the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ifstack_table">MIB_IFSTACK_TABLE</a> structure and the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ifstack_row">MIB_IFSTACK_ROW</a> entries in this structure. When these returned structures are no longer required, free the memory by calling the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-freemibtable">FreeMibTable</a>.
     * 
     * Note that the returned <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ifstack_table">MIB_IFSTACK_TABLE</a> structure pointed to by the <i>Table</i> parameter may contain padding for alignment between the <b>NumEntries</b> member and the first <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ifstack_row">MIB_IFSTACK_ROW</a> array entry in the <b>Table</b> member of the <b>MIB_IFSTACK_TABLE</b> structure. Padding for alignment may also be present between the <b>MIB_IFSTACK_ROW</b> array entries. Any access to a <b>MIB_IFSTACK_ROW</b> array entry should assume  padding may exist.
     * @param {Pointer<MIB_IFSTACK_TABLE>} Table A pointer to a buffer that receives the table of interface stack row entries in a <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ifstack_table">MIB_IFSTACK_TABLE</a> structure.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
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
     * An invalid parameter was passed to the function. This error is returned if a <b>NULL</b> pointer is passed in the  <i>Table</i> parameter. 
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
     * Insufficient memory resources are available to complete the operation.
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
     * No interface stack entries were found.
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
     * Use 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/netioapi/nf-netioapi-getifstacktable
     * @since windows6.0.6000
     */
    static GetIfStackTable(Table) {
        result := DllCall("IPHLPAPI.dll\GetIfStackTable", "ptr", Table, "uint")
        return result
    }

    /**
     * Retrieves a table of inverted network interface stack row entries that specify the relationship of the network interfaces on an interface stack.
     * @remarks
     * The <b>GetInvertedIfStackTable</b> function is defined on Windows Vista and later. 
     * 
     * The  
     * <b>GetInvertedIfStackTable</b> function enumerates the physical and logical network interfaces on an interface stack on a local system and returns this information in an inverted form in the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_invertedifstack_table">MIB_INVERTEDIFSTACK_TABLE</a> structure. 
     * 
     * Interface stack entries are returned in a <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_invertedifstack_table">MIB_INVERTEDIFSTACK_TABLE</a> structure in the buffer pointed to by the <i>Table</i> parameter. The <b>MIB_INVERTEDIFSTACK_TABLE</b> structure contains an interface stack entry count and an array of <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_invertedifstack_row">MIB_INVERTEDIFSTACK_ROW</a> structures for each interface stack entry. 
     * 
     * The relationship between the interfaces in the interface stack is that the interface with index in the <b>HigherLayerInterfaceIndex</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_invertedifstack_row">MIB_INVERTEDIFSTACK_ROW</a> structure is immediately above the interface with index in the <b>LowerLayerInterfaceIndex</b> member of the <b>MIB_INVERTEDIFSTACK_ROW</b> structure.
     * 
     * Memory is allocated by the <b>GetInvertedIfStackTable</b> function for the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_invertedifstack_table">MIB_INVERTEDIFSTACK_TABLE</a> structure and the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_invertedifstack_row">MIB_INVERTEDIFSTACK_ROW</a> entries in this structure. When these returned structures are no longer required, free the memory by calling the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-freemibtable">FreeMibTable</a>.
     * 
     * Note that the returned <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_invertedifstack_table">MIB_INVERTEDIFSTACK_TABLE</a> structure pointed to by the <i>Table</i> parameter may contain padding for alignment between the <b>NumEntries</b> member and the first <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_invertedifstack_row">MIB_INVERTEDIFSTACK_ROW</a> array entry in the <b>Table</b> member of the <b>MIB_INVERTEDIFSTACK_TABLE</b> structure. Padding for alignment may also be present between the <b>MIB_INVERTEDIFSTACK_ROW</b> array entries. Any access to a <b>MIB_INVERTEDIFSTACK_ROW</b> array entry should assume  padding may exist.
     * @param {Pointer<MIB_INVERTEDIFSTACK_TABLE>} Table A pointer to a buffer that receives the table of inverted interface stack row entries in a <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_invertedifstack_table">MIB_INVERTEDIFSTACK_TABLE</a> structure.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
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
     * An invalid parameter was passed to the function. This error is returned if a <b>NULL</b> pointer is passed in the  <i>Table</i> parameter. 
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
     * Insufficient memory resources are available to complete the operation.
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
     * No interface stack entries were found.
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
     * Use 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function  to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/netioapi/nf-netioapi-getinvertedifstacktable
     * @since windows6.0.6000
     */
    static GetInvertedIfStackTable(Table) {
        result := DllCall("IPHLPAPI.dll\GetInvertedIfStackTable", "ptr", Table, "uint")
        return result
    }

    /**
     * Retrieves IP information for the specified interface on the local computer.
     * @remarks
     * The <b>GetIpInterfaceEntry</b> function is defined on Windows Vista and later. 
     * 
     * On input, the <b>Family</b> member in the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipinterface_row">MIB_IPINTERFACE_ROW</a> structure pointed to by the <i>Row</i> parameter must be initialized to either <b>AF_INET</b> or <b>AF_INET6</b>. In addition on input, at least one of the following members in the <b>MIB_IPINTERFACE_ROW</b> structure pointed to the <i>Row</i> parameter must be initialized: the <b>InterfaceLuid</b> or <b>InterfaceIndex</b>.
     * 
     * The fields are used in the order listed above. So if the <b>InterfaceLuid</b> is specified, then this member is used to determine the interface. If no value was set for the  <b>InterfaceLuid</b> member (the values of this member was set to zero), then the <b>InterfaceIndex</b> member is next used to determine the interface. 
     * 
     * On output, the <b>InterfaceLuid</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipinterface_row">MIB_IPINTERFACE_ROW</a> structure pointed to by the <i>Row</i> parameter is filled in if the <b>InterfaceIndex</b> was specified. The other members of <b>MIB_IPINTERFACE_ROW</b> structure pointed to by the <i>Row</i> parameter are also filled in.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-initializeipinterfaceentry">InitializeIpInterfaceEntry</a> function must be used to initialize the fields of a
     *     <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipinterface_row">MIB_IPINTERFACE_ROW</a> structure entry with default values.  An application can then change the
     *     fields in the <b>MIB_IPINTERFACE_ROW</b> entry it wishes to modify, and then call the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-setipinterfaceentry">SetIpInterfaceEntry</a> function.
     * 
     * Unprivileged simultaneous access to multiple networks of different security requirements creates a security hole and allows an unprivileged application to accidentally relay data between the two networks. A typical example is simultaneous access to a virtual private network (VPN) and the Internet. Windows Server 2003 and Windows XP use a weak host model, where RAS prevents such simultaneous access by increasing the route metric of all default routes over other interfaces. Thus all traffic is routed through the VPN interface, disrupting other network connectivity. 
     * 
     * On Windows Vista and later, a strong host model is used by default. If a source IP address is specified in the route lookup using <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-getbestroute2">GetBestRoute2</a> or <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getbestroute">GetBestRoute</a>, the route lookup is restricted to the interface of the source IP address. The route metric modification by RAS has no effect as the list of potential routes does not even have the route for the VPN interface thereby allowing traffic to the Internet. The <b>DisableDefaultRoutes</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipinterface_row">MIB_IPINTERFACE_ROW</a> can be used to disable using the default route on an interface. This member can be used as a security measure by VPN clients to restrict split tunneling when split tunneling is not required by the VPN client. A VPN client can call the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-setipinterfaceentry">SetIpInterfaceEntry</a> function to set the <b>DisableDefaultRoutes</b> member to <b>TRUE</b> when required. A VPN client can query the current state of the <b>DisableDefaultRoutes</b> member by calling  the <b>GetIpInterfaceEntry</b> function.
     * @param {Pointer<MIB_IPINTERFACE_ROW>} Row A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipinterface_row">MIB_IPINTERFACE_ROW</a> structure that, on successful return, receives information for an interface on the local computer. On input, the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> member of the <b>MIB_IPINTERFACE_ROW</b> must be set to the interface for which to retrieve information.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
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
     * The system cannot find the file specified. This error is returned if the  network interface LUID or interface index specified by the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipinterface_row">MIB_IPINTERFACE_ROW</a> pointed to by the <i>Row</i> parameter was not a value on the local machine.
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
     * An invalid parameter was passed to the function. This error is returned if a <b>NULL</b> pointer is passed in the <i>Row</i> parameter, the <b>Family</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipinterface_row">MIB_IPINTERFACE_ROW</a> pointed to by the <i>Row</i> parameter was not specified as <b>AF_INET</b> or <b>AF_INET6</b>, or both the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> members of the <b>MIB_IPINTERFACE_ROW</b> pointed to by the <i>Row</i> parameter were unspecified.
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
     * Element not found. This error is returned if the  network interface specified by the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipinterface_row">MIB_IPINTERFACE_ROW</a> structure pointed to by the <i>Row</i> parameter does not match the IP address family specified in the <b>Family</b> member in the <b>MIB_IPINTERFACE_ROW</b> structure.
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
     * Use 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/netioapi/nf-netioapi-getipinterfaceentry
     * @since windows6.0.6000
     */
    static GetIpInterfaceEntry(Row) {
        result := DllCall("IPHLPAPI.dll\GetIpInterfaceEntry", "ptr", Row, "uint")
        return result
    }

    /**
     * Retrieves the IP interface entries on the local computer.
     * @remarks
     * The <b>GetIpInterfaceTable</b> function is defined on Windows Vista and later. 
     * 
     * The  
     * <b>GetIpInterfaceTable</b> function enumerates the IP interfaces on a local system and returns this information in an <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipinterface_table">MIB_IPINTERFACE_TABLE</a> structure. 
     * 
     * IP interface entries are returned in a <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipinterface_table">MIB_IPINTERFACE_TABLE</a> structure in the buffer pointed to by the <i>Table</i> parameter. The <b>MIB_IPINTERFACE_TABLE</b> structure contains an IP interface entry count and an array of <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipinterface_row">MIB_IPINTERFACE_ROW</a> structures for each IP interface entry. When these returned structures are no longer required, free the memory by calling the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-freemibtable">FreeMibTable</a>.
     * 
     * The <i>Family</i> parameter must be initialized to either <b>AF_INET</b> or <b>AF_INET6</b>. 
     * 
     * Note that the returned <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipinterface_table">MIB_IPINTERFACE_TABLE</a> structure pointed to by the <i>Table</i> parameter may contain padding for alignment between the <b>NumEntries</b> member and the first <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipinterface_row">MIB_IPINTERFACE_ROW</a> array entry in the <b>Table</b> member of the <b>MIB_IPINTERFACE_TABLE</b> structure. Padding for alignment may also be present between the <b>MIB_IPINTERFACE_ROW</b> array entries. Any access to a <b>MIB_IPINTERFACE_ROW</b> array entry should assume  padding may exist.
     * @param {Integer} Family The address family of IP interfaces to retrieve. 
     * 
     * Possible values for the address family are listed in the <i>Winsock2.h</i> header file. Note that the values for the AF_ address family and PF_ protocol family constants  are identical (for example, <b>AF_INET</b> and <b>PF_INET</b>), so either constant can be used.
     * 
     * On Windows Vista and later as well as on the Windows SDK, the organization of header files has changed and possible values for this member are defined in the <i>Ws2def.h</i> header file. Note that the <i>Ws2def.h</i> header file is automatically included in <i>Winsock2.h</i>, and should never be used directly.
     * 
     * The values currently supported are <b>AF_INET</b>, <b>AF_INET6</b>, and <b>AF_UNSPEC</b>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AF_UNSPEC"></a><a id="af_unspec"></a><dl>
     * <dt><b>AF_UNSPEC</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The address family is unspecified. When this parameter is specified,  the <b>GetIpInterfaceTable</b> function  returns the IP interface table containing both IPv4 and IPv6 entries. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AF_INET"></a><a id="af_inet"></a><dl>
     * <dt><b>AF_INET</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Internet Protocol version 4 (IPv4) address family.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AF_INET6"></a><a id="af_inet6"></a><dl>
     * <dt><b>AF_INET6</b></dt>
     * <dt>23</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Internet Protocol version 6 (IPv6) address family.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<MIB_IPINTERFACE_TABLE>} Table A pointer to a buffer that receives the table of IP interface entries in a <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipinterface_table">MIB_IPINTERFACE_TABLE</a> structure.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
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
     * An invalid parameter was passed to the function. This error is returned if a <b>NULL</b> pointer is passed in the <i>Table</i> parameter or the <i>Family</i> parameter was not specified as <b>AF_INET</b>, <b>AF_INET6</b>, or <b>AF_UNSPEC</b>.
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
     * Insufficient memory resources are available to complete the operation.
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
     * No IP interface entries as specified in the <i>Family</i> parameter were found. 
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
     * The function is not supported. This error is returned when the IP transport specified in the <i>Address</i> parameter is not configured on the local computer. This error is also returned on versions of Windows where this function is not supported.
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
     * Use 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/netioapi/nf-netioapi-getipinterfacetable
     * @since windows6.0.6000
     */
    static GetIpInterfaceTable(Family, Table) {
        result := DllCall("IPHLPAPI.dll\GetIpInterfaceTable", "ushort", Family, "ptr", Table, "uint")
        return result
    }

    /**
     * Initializes the members of an MIB_IPINTERFACE_ROW entry with default values.
     * @remarks
     * The <b>InitializeIpInterfaceEntry</b> function is defined on Windows Vista and later. 
     * 
     * On output, the <b>Family</b> member in the <b>MIB_IPINTERFACE_ROW</b> structure pointed to by the <i>Row</i> parameter will be initialized to either <b>AF_UNSPEC</b>, the <b>InterfaceLuid</b> member in the <b>MIB_IPINTERFACE_ROW</b> structure will be initialized to an unspecified value, and other fields are initialized to zero. 
     * 
     * The <b>InitializeIpInterfaceEntry</b> function must be used to initialize the fields of a
     *     <b>MIB_IPINTERFACE_ROW</b> structure entry with default values.  An application can then change the
     *     fields in the <b>MIB_IPINTERFACE_ROW</b> entry it wishes to modify, and then call the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-setipinterfaceentry">SetIpInterfaceEntry</a> function.
     * @param {Pointer<MIB_IPINTERFACE_ROW>} Row A pointer to a 
     * <b>MIB_IPINTERFACE_ROW</b> structure to initialize. On successful return, the fields in this parameter are initialized with default information for an interface on the local computer.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/netioapi/nf-netioapi-initializeipinterfaceentry
     * @since windows6.0.6000
     */
    static InitializeIpInterfaceEntry(Row) {
        DllCall("IPHLPAPI.dll\InitializeIpInterfaceEntry", "ptr", Row)
    }

    /**
     * Registers to be notified for changes to all IP interfaces, IPv4 interfaces, or IPv6 interfaces on a local computer.
     * @remarks
     * The <b>NotifyIpInterfaceChange</b> function is defined on Windows Vista and later. 
     * 
     * The <i>Family</i> parameter must be set to either <b>AF_INET</b>, <b>AF_INET6</b>, or <b>AF_UNSPEC</b>. 
     * 
     * The invocation of the callback function specified in the <i>Callback</i> parameter is serialized. The callback function should be defined as a function of type <b>VOID</b>. The parameters passed to the callback function include the following:
     * 
     * <table>
     * <tr>
     * <th>Parameter</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <a id="IN_PVOID_CallerContext"></a><a id="in_pvoid_callercontext"></a><a id="IN_PVOID_CALLERCONTEXT"></a>IN PVOID CallerContext
     * 
     * </td>
     * <td width="60%">
     * The <i>CallerContext</i> parameter passed to the <b>NotifyIpInterfaceChange</b> function when registering for notifications.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <a id="IN_PMIB_IPINTERFACE_ROW_Row_OPTIONAL"></a><a id="in_pmib_ipinterface_row_row_optional"></a><a id="IN_PMIB_IPINTERFACE_ROW_ROW_OPTIONAL"></a>IN PMIB_IPINTERFACE_ROW Row OPTIONAL
     * 
     * </td>
     * <td width="60%">
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipinterface_row">MIB_IPINTERFACE_ROW</a> entry for the  interface that was changed. This parameter is a <b>NULL</b> pointer when the <b>MIB_NOTIFICATION_TYPE</b> value passed in the <i>NotificationType</i> parameter to the callback function is set to <b>MibInitialNotification</b>. This can only occur if the <i>InitialNotification</i> parameter passed to <b>NotifyIpInterfaceChange</b> was set to <b>TRUE</b> when registering for notifications.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <a id="IN_MIB_NOTIFICATION_TYPE_NotificationType"></a><a id="in_mib_notification_type_notificationtype"></a><a id="IN_MIB_NOTIFICATION_TYPE_NOTIFICATIONTYPE"></a>IN MIB_NOTIFICATION_TYPE NotificationType
     * 
     * </td>
     * <td width="60%">
     * The notification type. This member can be one of the values from the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ne-netioapi-mib_notification_type">MIB_NOTIFICATION_TYPE</a> enumeration type defined in the <i>Netioapi.h</i> header file.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * 
     * The callback function specified in the <i>Callback</i> parameter must be implemented in the same process as the application calling the <b>NotifyIpInterfaceChange</b> function. If the callback function is in a separate DLL, then the DLL should be loaded before calling the <b>NotifyIpInterfaceChange</b> function to register for change notifications. 
     * 
     * When the callback function is received when a change occurs and the <i>Row</i> parameter is not <b>NULL</b>, the pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipinterface_row">MIB_IPINTERFACE_ROW</a> structure passed in the <i>Row</i> parameter contains incomplete data. The  information returned in the <b>MIB_IPINTERFACE_ROW</b> structure is only enough information that an application can call the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-getipinterfaceentry">GetIpInterfaceEntry</a> function to query complete information on the IP interface that changed. When the callback function is received, an application should allocate a <b>MIB_IPINTERFACE_ROW</b> structure and initialize it with the <b>Family</b>,  <b>InterfaceLuid</b> and <b>InterfaceIndex</b> members in the <b>MIB_IPINTERFACE_ROW</b> structure pointed to by the <i>Row</i> parameter received. A pointer to this newly initialized <b>MIB_IPINTERFACE_ROW</b> structure should be passed to the <b>GetIpInterfaceEntry</b> function to retrieve complete information on the IP interface that was changed. 
     * 
     * The memory pointed to by the <i>Row</i> parameter used in the callback indications is managed by the operating system.  An application that receives a notification should never attempt to free the memory pointed to by the <i>Row</i> parameter. 
     * 
     * To deregister for change notifications, call the  <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-cancelmibchangenotify2">CancelMibChangeNotify2</a> function passing the <i>NotificationHandle</i> parameter returned by  <b>NotifyIpInterfaceChange</b>. 
     * 
     * An application cannot make a call to the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-cancelmibchangenotify2">CancelMibChangeNotify2</a> function from the context of the thread which is currently executing the notification callback function for the same <i>NotificationHandle</i> parameter. Otherwise, the thread executing that callback will result in deadlock. So the <b>CancelMibChangeNotify2</b> function must not be called directly as part of the notification callback routine. In a more general situation, a thread that executes the <b>CancelMibChangeNotify2</b> function cannot own a resource on which the thread that executes a notification callback operation would wait because it would result in a similar deadlock. The <b>CancelMibChangeNotify2</b> function should be called from a different thread, on which the thread that receives the notification callback doesn’t have dependencies on.
     * 
     * Once the <b>NotifyIpInterfaceChange</b> function is called to register for change notifications, these notifications will continue to be sent until the application deregisters for change notifications or the application terminates. If the application terminates, the system will automatically deregister any registration for change notifications. It is still recommended that an application explicitly deregister for change notifications before it terminates.  
     * 
     * Any registration for change notifications does not persist across a system shut down or reboot.
     * @param {Integer} Family The address family on which to register for change notifications.
     * 
     * Possible values for the address family are listed in the <i>Winsock2.h</i> header file. Note that the values for the AF_ address family and PF_ protocol family constants  are identical (for example, <b>AF_INET</b> and <b>PF_INET</b>), so either constant can be used.
     * 
     * On the Windows SDK released for Windows Vista and later, the organization of header files has changed and possible values for this member are defined in the <i>Ws2def.h</i> header file. Note that the <i>Ws2def.h</i> header file is automatically included in <i>Winsock2.h</i>, and should never be used directly.
     * 
     * The values currently supported are <b>AF_INET</b>, <b>AF_INET6</b>, and <b>AF_UNSPEC</b>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AF_UNSPEC"></a><a id="af_unspec"></a><dl>
     * <dt><b>AF_UNSPEC</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The address family is unspecified. When this parameter is specified,  this function registers for both IPv4 and IPv6 change notifications.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AF_INET"></a><a id="af_inet"></a><dl>
     * <dt><b>AF_INET</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  The Internet Protocol version 4 (IPv4) address family. When this parameter is specified,  this function register for only IPv4 change notifications.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AF_INET6"></a><a id="af_inet6"></a><dl>
     * <dt><b>AF_INET6</b></dt>
     * <dt>23</dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  The Internet Protocol version 6 (IPv6) address family. When this parameter is specified,  this function registers for only IPv6 change notifications.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<PIPINTERFACE_CHANGE_CALLBACK>} Callback A pointer to the function to call when a change occurs. This function will be invoked
     *         when an interface notification is received.
     * @param {Pointer<Void>} CallerContext A user context passed to the callback function specified in the <i>Callback</i> parameter when an interface notification is received.
     * @param {Integer} InitialNotification A value that indicates whether the callback should be invoked
     *         immediately after registration for change notification completes. This initial notification does not indicate a change occurred to an IP interface. The purpose of this parameter to provide confirmation that the callback is registered.
     * @param {Pointer<HANDLE>} NotificationHandle A pointer used to return a handle that can be later used to
     *         deregister the change notification. On success, a notification handle is returned in this parameter. If an error occurs, <b>NULL</b> is returned.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
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
     * An internal error occurred where an invalid handle was encountered. 
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
     * An invalid parameter was passed to the function. This error is returned if the <i>Family</i> parameter was not either <b>AF_INET</b>, <b>AF_INET6</b>, or <b>AF_UNSPEC</b>.
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
     * There was insufficient memory.
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/netioapi/nf-netioapi-notifyipinterfacechange
     * @since windows6.0.6000
     */
    static NotifyIpInterfaceChange(Family, Callback, CallerContext, InitialNotification, NotificationHandle) {
        result := DllCall("IPHLPAPI.dll\NotifyIpInterfaceChange", "ushort", Family, "ptr", Callback, "ptr", CallerContext, "char", InitialNotification, "ptr", NotificationHandle, "uint")
        return result
    }

    /**
     * Sets the properties of an IP interface on the local computer.
     * @remarks
     * The <b>SetIpInterfaceEntry</b> function is defined on Windows Vista and later. 
     * 
     * The <b>SetIpInterfaceEntry</b> function can is used to modify an existing IP interface entry.
     * 
     * On input, the <b>Family</b> member in the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipinterface_row">MIB_IPINTERFACE_ROW</a> structure pointed to by the <i>Row</i> parameter must be initialized to either <b>AF_INET</b> or <b>AF_INET6</b>. In addition on input, at least one of the following members in the <b>MIB_IPINTERFACE_ROW</b> structure pointed to the <i>Row</i> parameter must be initialized: the <b>InterfaceLuid</b> or <b>InterfaceIndex</b>.
     * 
     * The fields are used in the order listed above. So if the <b>InterfaceLuid</b> is specified, then this member is used to determine the interface. If no value was set for the  <b>InterfaceLuid</b> member (the values of this member was set to zero), then the <b>InterfaceIndex</b> member is next used to determine the interface. 
     * 
     * On output, the <b>InterfaceLuid</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipinterface_row">MIB_IPINTERFACE_ROW</a> structure pointed to by the <i>Row</i> parameter is filled in if the <b>InterfaceIndex</b> was specified.
     * 
     * The <b>MaxReassemblySize</b>, <b>MinRouterAdvertisementInterval</b>, <b>MaxRouterAdvertisementInterval </b>,   <b>Connected</b>, <b>SupportsWakeUpPatterns</b>, <b>SupportsNeighborDiscovery</b>, <b>SupportsRouterDiscovery</b>, <b>ReachableTime</b>, <b>TransmitOffload</b>, and <b>ReceiveOffload</b> members of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipinterface_row">MIB_IPINTERFACE_ROW</a> structure pointed to by the <i>Row</i> are ignored when the  <b>SetIpInterfaceEntry</b> function is called. These members are set by the network stack and cannot be changed using the <b>SetIpInterfaceEntry</b> function.
     * 
     * An application would typically call the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-getipinterfacetable">GetIpInterfaceTable</a> function to retrieve the IP interface entries on the local computer or call the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-getipinterfaceentry">GetIpInterfaceEntry</a> function to retrieve just the IP interface entry to modify.     The  <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipinterface_row">MIB_IPINTERFACE_ROW</a> structure for the specific IP interface entry could then be modified and a pointer to this structure passed to the <b>SetIpInterfaceEntry</b> function in the <i>Row</i> parameter. However for IPv4, an application must not try to modify the <b>SitePrefixLength</b> member of the <b>MIB_IPINTERFACE_ROW</b> structure. For IPv4, the <b>SitePrefixLength</b> member must be set to 0. 
     * 
     * Another possible method to modify an existing IP interface entry is to use <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-initializeipinterfaceentry">InitializeIpInterfaceEntry</a> function to initialize the fields of a
     *     <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipinterface_row">MIB_IPINTERFACE_ROW</a> structure entry with default values.  Then set the <b>Family</b> member and either the  <b>InterfaceIndex</b> or <b>InterfaceLuid</b> members in the <b>MIB_IPINTERFACE_ROW</b> structure pointed to by the <i>Row</i> parameter to match the IP interface to change. An application can then change the
     *     fields in the <b>MIB_IPINTERFACE_ROW</b> entry it wishes to modify, and then call the <b>SetIpInterfaceEntry</b> function. However for IPv4, an application must not try to modify the <b>SitePrefixLength</b> member of the <b>MIB_IPINTERFACE_ROW</b> structure. For IPv4, the <b>SitePrefixLength</b> member must be set to 0. Caution must be used with this approach because the only way to determine  all of the fields being changed would be to compare the fields in the <b>MIB_IPINTERFACE_ROW</b> of the specific IP interface entry with fields set by the <b>InitializeIpInterfaceEntry</b> function when a <b>MIB_IPINTERFACE_ROW</b> is initialized to default values.
     * 
     * Unprivileged simultaneous access to multiple networks of different security requirements creates a security hole and allows an unprivileged application to accidentally relay data between the two networks. A typical example is simultaneous access to a virtual private network (VPN) and the Internet. Windows Server 2003 and Windows XP use a weak host model, where RAS prevents such simultaneous access by increasing the route metric of all default routes over other interfaces. Thus all traffic is routed through the VPN interface, disrupting other network connectivity. 
     * 
     * On Windows Vista and later, a strong host model is used by default. If a source IP address is specified in the route lookup using <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-getbestroute2">GetBestRoute2</a> or <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getbestroute">GetBestRoute</a>, the route lookup is restricted to the interface of the source IP address. The route metric modification by RAS has no effect as the list of potential routes does not even have the route for the VPN interface thereby allowing traffic to the Internet. The <b>DisableDefaultRoutes</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipinterface_row">MIB_IPINTERFACE_ROW</a> can be used to disable using the default route on an interface. This member can be used as a security measure by VPN clients to restrict split tunneling when split tunneling is not required by the VPN client. A VPN client can call the <b>SetIpInterfaceEntry</b> function to set the <b>DisableDefaultRoutes</b> member to <b>TRUE</b> when required. A VPN client can query the current state of the <b>DisableDefaultRoutes</b> member by calling  the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-getipinterfaceentry">GetIpInterfaceEntry</a> function. 
     * 
     * The
     * 
     * The <b>SetIpInterfaceEntry</b> function can only be called by a user logged on as a member of the Administrators group. If <b>SetIpInterfaceEntry</b> is called by a user that is not a member of the Administrators group, the function call will fail and <b>ERROR_ACCESS_DENIED</b> is returned. This function can also fail because of user account control (UAC) on Windows Vista and later. If an application that contains this function is executed by a user logged on as a member of the Administrators group other than the built-in Administrator, this call will fail unless the application has been marked in the manifest file with a <b>requestedExecutionLevel</b> set to requireAdministrator. If the application lacks this manifest file, a user logged on as a member of the Administrators group other than the built-in Administrator must then be executing the application in an enhanced shell as the built-in Administrator (RunAs administrator) for this function to succeed.
     * @param {Pointer<MIB_IPINTERFACE_ROW>} Row A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipinterface_row">MIB_IPINTERFACE_ROW</a> structure entry for an interface. On input, the <b>Family</b> member of the <b>MIB_IPINTERFACE_ROW</b> must be set to <b>AF_INET6</b> or <b>AF_INET</b>  and the <b>InterfaceLuid</b> or the  <b>InterfaceIndex</b> member of the <b>MIB_IPINTERFACE_ROW</b> must be specified. On a successful return, the <b>InterfaceLuid</b> member of the <b>MIB_IPINTERFACE_ROW</b> is filled in if <b>InterfaceIndex</b> member of the <b>MIB_IPINTERFACE_ROW</b> entry was specified.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
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
     * Access is denied. This error is returned under several conditions that include the following: the  user lacks the required administrative privileges on the local computer or the application is not running in an enhanced shell as the built-in Administrator (RunAs administrator).
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
     * The system cannot find the file specified. This error is returned if the  network interface LUID or interface index specified by the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipinterface_row">MIB_IPINTERFACE_ROW</a> pointed to by the <i>Row</i> parameter was not a value on the local machine.
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
     * An invalid parameter was passed to the function. This error is returned if a <b>NULL</b> pointer is passed in the <i>Row</i> parameter, the <b>Family</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipinterface_row">MIB_IPINTERFACE_ROW</a> pointed to by the <i>Row</i> parameter was not specified as <b>AF_INET</b> or <b>AF_INET6</b>, or both the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> members of the <b>MIB_IPINTERFACE_ROW</b> pointed to by the <i>Row</i> parameter were unspecified.
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
     * The specified interface could not be found. This error is returned if the  network interface specified by the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipinterface_row">MIB_IPINTERFACE_ROW</a> pointed to by the <i>Row</i> parameter does not match the IP address family specified in the <b>Family</b> member in the <b>MIB_IPINTERFACE_ROW</b> structure.
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/netioapi/nf-netioapi-setipinterfaceentry
     * @since windows6.0.6000
     */
    static SetIpInterfaceEntry(Row) {
        result := DllCall("IPHLPAPI.dll\SetIpInterfaceEntry", "ptr", Row, "uint")
        return result
    }

    /**
     * Retrieves historical bandwidth estimates for a network connection on the specified interface.
     * @remarks
     * The <b>GetIpNetworkConnectionBandwidthEstimates</b> function is defined on Windows 8  and later. 
     * 
     * On input, the <i>AddressFamily</i> parameter must be initialized to either <b>AF_INET</b> or <b>AF_INET6</b>. In addition on input, the <i>InterfaceIndex</i> parameter must be initialized with the specified interface index.
     * 
     * A value must be set for the  <i>InterfaceIndex</i> parameter (the value of this parameter must not be set to zero). 
     * 
     * On output, the <a href="https://docs.microsoft.com/windows/win32/api/netioapi/ns-netioapi-mib_ip_network_connection_bandwidth_estimates">MIB_IP_NETWORK_CONNECTION_BANDWIDTH_ESTIMATES</a>  structure pointed to by the <i>BandwidthEstimates</i> parameter is filled in if the <i>AddressFamily</i> and <i>InterfaceIndex</i> parameters were specified. 
     * 
     * The <b>GetIpNetworkConnectionBandwidthEstimates</b> function returns historical estimates of available bandwidth at the point of attachment (the first hop) for use by an application. The estimates are intended as a guide to tune performance parameters and the application should maintain thresholds and differentiate behavior for low and high bandwidth situations. 
     * 
     * It is possible that the true available bandwidth changes over  time as more bandwidth is consumed by devices competing on the same network. So applications should be prepared to handle cases where the available bandwidth drops below historical limits reported by the <b>GetIpNetworkConnectionBandwidthEstimates</b> function. 
     * 
     * It is possible that the TCP/IP stack has not built up any estimates for the given interface,  in a particular or both directions. In this case the estimate returned will be zero. The application should be prepared to handle such cases by picking reasonable defaults and fine tuning if required.
     * 
     * The <i>Netioapi.h</i> header file is automatically included by the <i>Iphlpapi.h</i> header file. The <i>Netioapi.h</i> header file should never be used directly.
     * @param {Integer} InterfaceIndex The local index value for the network interface. 
     * 
     * This index value may change when a network adapter is disabled and then enabled, or under other circumstances, and should not be considered persistent.
     * @param {Integer} AddressFamily The address family. Possible values for the address family are listed in the <i>Ws2def.h</i> header file. Note that the values for the AF_ address family and PF_ protocol family constants  are identical (for example, <b>AF_INET</b> and <b>PF_INET</b>), so either constant can be used.
     * 
     *  Note that the <i>Ws2def.h</i> header file is automatically included in <i>Winsock2.h</i>, and should never be used directly.
     * 
     * The values currently supported are <b>AF_INET</b> or <b>AF_INET6</b>, which are the Internet
     *                      address family formats for IPv4 and IPv6. 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AF_INET"></a><a id="af_inet"></a><dl>
     * <dt><b>AF_INET</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Internet Protocol version 4 (IPv4) address family.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AF_INET6"></a><a id="af_inet6"></a><dl>
     * <dt><b>AF_INET6</b></dt>
     * <dt>23</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Internet Protocol version 6 (IPv6) address family.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<MIB_IP_NETWORK_CONNECTION_BANDWIDTH_ESTIMATES>} BandwidthEstimates A pointer to a buffer that returns the historical bandwidth estimates maintained for the point of attachment to which the interface is currently connected.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
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
     * The system cannot find the file specified. This error is returned if the  interface index specified by the <i>InterfaceIndex</i> parameter was not a value on the local machine.
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
     * An invalid parameter was passed to the function. This error is returned if a <b>NULL</b> pointer is passed in the <i>BandwidthEstimates</i> parameter or the <i>AddressFamily</i> parameter was not specified as <b>AF_INET</b> or <b>AF_INET6</b>.
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
     * Element not found. This error is returned if the  network interface specified by the <i>InterfaceIndex</i> parameter does not match the IP address family specified in the <i>AddressFamily</i> parameter.
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
     * Use 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/netioapi/nf-netioapi-getipnetworkconnectionbandwidthestimates
     * @since windows8.0
     */
    static GetIpNetworkConnectionBandwidthEstimates(InterfaceIndex, AddressFamily, BandwidthEstimates) {
        result := DllCall("IPHLPAPI.dll\GetIpNetworkConnectionBandwidthEstimates", "uint", InterfaceIndex, "ushort", AddressFamily, "ptr", BandwidthEstimates, "uint")
        return result
    }

    /**
     * Adds a new unicast IP address entry on the local computer.
     * @remarks
     * The <b>CreateUnicastIpAddressEntry</b> function is defined on Windows Vista and later. 
     * 
     * The <b>CreateUnicastIpAddressEntry</b> function is used to add a new unicast IP address entry on a local computer. The unicast IP address added by 
     * the <b>CreateUnicastIpAddressEntry</b> function is not persistent. The IP address exists only as long as the adapter object exists. Restarting the computer destroys the IP address, as does manually resetting the network interface card (NIC). Also, certain PnP events may destroy the address.
     * 
     * To create an IPv4 address that persists, the <a href="https://docs.microsoft.com/windows/desktop/CIMWin32Prov/enablestatic-method-in-class-win32-networkadapterconfiguration">EnableStatic method of the Win32_NetworkAdapterConfiguration Class</a> in the Windows Management Instrumentation (WMI) controls may be used. The netsh command can also be used to create a persistent IPv4 or IPv6 address. 
     * 
     * For more information, please see the documentation on <a href="https://docs.microsoft.com/windows/desktop/WinSock/netsh-exe">Netsh.exe</a> in the Windows Sockets documentation.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-initializeunicastipaddressentry">InitializeUnicastIpAddressEntry</a> function should be used to initialize the members of a
     *     <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_unicastipaddress_row">MIB_UNICASTIPADDRESS_ROW</a> structure entry with default values.  An application can then change the
     *     members in the <b>MIB_UNICASTIPADDRESS_ROW</b> entry it wishes to modify, and then call the <b>CreateUnicastIpAddressEntry</b> function.
     * 
     * The <b>Address</b> member in the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_unicastipaddress_row">MIB_UNICASTIPADDRESS_ROW</a> structure pointed to by the <i>Row</i> parameter must be initialized to a valid unicast IPv4 or IPv6 address. The <b>si_family</b> member of the <b>SOCKADDR_INET</b> structure  in the  <b>Address</b> member must be initialized to either <b>AF_INET</b> or <b>AF_INET6</b> and the related <b>Ipv4</b> or <b>Ipv6</b> member of the  <b>SOCKADDR_INET</b> structure must be set to a valid unicast IP address. In addition, at least one of the following members in the <b>MIB_UNICASTIPADDRESS_ROW</b> structure pointed to the <i>Row</i> parameter must be initialized to the interface: the <b>InterfaceLuid</b> or <b>InterfaceIndex</b>.
     * 
     * The fields are used in the order listed above. So if the <b>InterfaceLuid</b> is specified, then this member is used to determine the interface on which to add the unicast IP address. If no value was set for the  <b>InterfaceLuid</b> member (the values of this member was set to zero), then the <b>InterfaceIndex</b> member is next used to determine the interface. 
     * 
     * If the <b>OnLinkPrefixLength</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_unicastipaddress_row">MIB_UNICASTIPADDRESS_ROW</a> pointed to by the <i>Row</i> parameter is set to 255, then <b>CreateUnicastIpAddressEntry</b> will add the new unicast IP address with the  <b>OnLinkPrefixLength</b> member set equal to the length of the IP address. So for a unicast IPv4 address, the  <b>OnLinkPrefixLength</b> is set to 32 and the <b>OnLinkPrefixLength</b> is set to 128 for a unicast IPv6 address. If this would result in the incorrect subnet mask for an IPv4 address or the incorrect link prefix for an IPv6 address, then the application should set this member to the correct value before calling <b>CreateUnicastIpAddressEntry</b>. 
     * 
     * If a unicast IP address is created with the <b>OnLinkPrefixLength</b> member set incorrectly, then the IP address may be changed by calling <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-setunicastipaddressentry">SetUnicastIpAddressEntry</a> with the  <b>OnLinkPrefixLength</b> member set to the correct value.
     * 
     * The <b>DadState</b>, <b>ScopeId</b>, and <b>CreationTimeStamp</b> members of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_unicastipaddress_row">MIB_UNICASTIPADDRESS_ROW</a> structure pointed to by the <i>Row</i> are ignored when the  <b>CreateUnicastIpAddressEntry</b> function is called. These members are set by the network stack. The  <b>ScopeId</b> member is automatically determined by the interface on which the address is added. Beginning in Windows 10, if <b>DadState</b> is set to <b>IpDadStatePreferred</b> in the <b>MIB_UNICASTIPADDRESS_ROW</b> structure when calling <b>CreateUnicastIpAddressEntry</b>, the stack will set the initial DAD state of the address to “preferred” instead of “tentative” and will do optimistic DAD for the address.
     * 
     * The <b>CreateUnicastIpAddressEntry</b> function will fail if the unicast IP address passed in the <b>Address</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_unicastipaddress_row">MIB_UNICASTIPADDRESS_ROW</a> pointed to by the <i>Row</i> parameter is a duplicate of an existing unicast IP address on the interface. Note that a loopback IP address can only be added to a loopback interface using the <b>CreateUnicastIpAddressEntry</b> function. 
     * 
     * The unicast IP address passed in the <b>Address</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_unicastipaddress_row">MIB_UNICASTIPADDRESS_ROW</a> pointed to by the <i>Row</i> parameter is not usable immediately. The IP address is usable after the duplicate address detection process has completed successfully. It can take several seconds for the duplicate address detection process to complete since IP packets need to  be sent and potential responses must be awaited. For IPv6, the duplicate address detection process typically takes about a second. For IPv4, the duplicate address detection process typically takes about three seconds. 
     * 
     * If an application that needs to know when an IP address is usable after a call to  the <b>CreateUnicastIpAddressEntry</b> function, there are two methods that can be used. One method uses polling and the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-getunicastipaddressentry">GetUnicastIpAddressEntry</a> function. The second method calls one of the notification functions, <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-notifyaddrchange">NotifyAddrChange</a>, <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-notifyipinterfacechange">NotifyIpInterfaceChange</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-notifyunicastipaddresschange">NotifyUnicastIpAddressChange</a> to set up an asynchronous notification for when an address changes.
     * 
     * The following method describes how to use the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-getunicastipaddressentry">GetUnicastIpAddressEntry</a> and polling. After the call to the <b>CreateUnicastIpAddressEntry</b> function returns successfully, pause for one to three seconds (depending on whether an IPv6 or IPv4 address is being created) to allow time for the successful completion of the duplication address detection process. Then call the <b>GetUnicastIpAddressEntry</b> function to retrieve the updated <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_unicastipaddress_row">MIB_UNICASTIPADDRESS_ROW</a> structure and examine the value of the <b>DadState</b> member. If the value of the <b>DadState</b> member is set to <b>IpDadStatePreferred</b>, the IP address is now usable.  If the value of the <b>DadState</b> member is set to <b>IpDadStateTentative</b>, then duplicate address detection has not yet completed. In this case, call the <b>GetUnicastIpAddressEntry</b> function again every half a second while the <b>DadState</b> member is still set to <b>IpDadStateTentative</b>. If the value of the <b>DadState</b> member returns with some value other than <b>IpDadStatePreferred</b> or <b>IpDadStateTentative</b>, duplicate address detection has failed and the IP address is not usable.  
     * 
     * The following method describes how to use an appropriate notification function. After the call to the <b>CreateUnicastIpAddressEntry</b> function returns successfully, call the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-notifyunicastipaddresschange">NotifyUnicastIpAddressChange</a> function to register to be notified of changes to either IPv6 or IPv4 unicast IP addresses, depending on the type of IP address being created. When a notification is received for the IP address being created, call the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-getunicastipaddressentry">GetUnicastIpAddressEntry</a> function to retrieve the <b>DadState</b> member.  If the value of the <b>DadState</b> member is set to <b>IpDadStatePreferred</b>, the IP address is now usable.  If the value of the <b>DadState</b> member is set to <b>IpDadStateTentative</b>, then duplicate address detection has not yet completed and the application needs to wait for future notifications. If the value of the <b>DadState</b> member returns with some value other than <b>IpDadStatePreferred</b> or <b>IpDadStateTentative</b>, duplicate address detection has failed and the IP address is not usable.  
     * 
     * If during the duplicate address detection process the media is disconnected and then reconnected, the duplicate address detection process is restarted. So it is possible for the time to complete the process to increase beyond the typical 1 second value for IPv6 or 3 second value for IPv4.
     * 
     * The <b>CreateUnicastIpAddressEntry</b> function can only be called by a user logged on as a member of the Administrators group. If <b>CreateUnicastIpAddressEntry</b> is called by a user that is not a member of the Administrators group, the function call will fail and ERROR_ACCESS_DENIED is returned. This function can also fail because of user account control (UAC) on Windows Vista and later. If an application that contains this function is executed by a user logged on as a member of the Administrators group other than the built-in Administrator, this call will fail unless the application has been marked in the manifest file with a <b>requestedExecutionLevel</b> set to requireAdministrator. If the application on lacks this manifest file, a user logged on as a member of the Administrators group other than the built-in Administrator must then be executing the application in an enhanced shell as the built-in Administrator (RunAs administrator) for this function to succeed.
     * @param {Pointer<MIB_UNICASTIPADDRESS_ROW>} Row A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_unicastipaddress_row">MIB_UNICASTIPADDRESS_ROW</a> structure entry for a unicast IP address entry.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
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
     * Access is denied. This error is returned under several conditions that include the following: the  user lacks the required administrative privileges on the local computer or the application is not running in an enhanced shell as the built-in Administrator (RunAs administrator).  
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
     * An invalid parameter was passed to the function. This error is returned if a <b>NULL</b> pointer is passed in the <i>Row</i> parameter, the <b>Address</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_unicastipaddress_row">MIB_UNICASTIPADDRESS_ROW</a> pointed to by the <i>Row</i> parameter was not set to a valid unicast IPv4 or IPv6 address, or both the <b>InterfaceLuid</b> and <b>InterfaceIndex</b> members of the <b>MIB_UNICASTIPADDRESS_ROW</b> pointed to by the <i>Row</i> parameter were unspecified. 
     * 
     * This error is also returned for other errors in the values set for members in the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_unicastipaddress_row">MIB_UNICASTIPADDRESS_ROW</a> structure. These errors include the following: if the <b>ValidLifetime</b> member is less than than the <b>PreferredLifetime</b> member, if the <b>PrefixOrigin</b> member is set to <b>IpPrefixOriginUnchanged</b> and the <b>SuffixOrigin</b> is the not set to <b>IpSuffixOriginUnchanged</b>, if the <b>PrefixOrigin</b> member is not set to <b>IpPrefixOriginUnchanged</b> and the <b>SuffixOrigin</b> is set to <b>IpSuffixOriginUnchanged</b>, if the <b>PrefixOrigin</b> member is not set to a value from the <b>NL_PREFIX_ORIGIN</b> enumeration, if the <b>SuffixOrigin</b> member is not set to a value from the <b>NL_SUFFIX_ORIGIN</b> enumeration, or if the <b>OnLinkPrefixLength</b> member is set to a value greater than the IP address length, in bits (32 for a unicast IPv4 address or 128 for a unicast IPv6 address).
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
     * The specified interface could not be found. This error is returned if the  network interface specified by the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_unicastipaddress_row">MIB_UNICASTIPADDRESS_ROW</a> pointed to by the <i>Row</i> parameter could not be found.  
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
     * The request is not supported. This error is returned if no IPv4 stack is on the local computer and an IPv4 address was specified in the <b>Address</b> member of the  <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_unicastipaddress_row">MIB_UNICASTIPADDRESS_ROW</a> pointed to by the <i>Row</i> parameter.  This error is also returned if no IPv6 stack is on the local computer and an IPv6 address was specified in the <b>Address</b> member.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_OBJECT_ALREADY_EXISTS </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object already exists. This error is returned if the  <b>Address</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_unicastipaddress_row">MIB_UNICASTIPADDRESS_ROW</a> pointed to by the <i>Row</i> parameter is a duplicate of an existing unicast IP address on the interface specified by the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> member of the <b>MIB_UNICASTIPADDRESS_ROW</b>.  
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/netioapi/nf-netioapi-createunicastipaddressentry
     * @since windows6.0.6000
     */
    static CreateUnicastIpAddressEntry(Row) {
        result := DllCall("IPHLPAPI.dll\CreateUnicastIpAddressEntry", "ptr", Row, "uint")
        return result
    }

    /**
     * Deletes an existing unicast IP address entry on the local computer.
     * @remarks
     * The <b>DeleteUnicastIpAddressEntry</b> function is defined on Windows Vista and later. 
     * 
     * The <b>DeleteUnicastIpAddressEntry</b> function is used to delete an existing <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_unicastipaddress_row">MIB_UNICASTIPADDRESS_ROW</a> structure entry on the local computer.  
     * 
     * On input, the <b>Address</b> member in the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_unicastipaddress_row">MIB_UNICASTIPADDRESS_ROW</a> structure pointed to by the <i>Row</i> parameter must be set to a valid unicast IPv4 or IPv6 address and family. In addition, at least one of the following members in the <b>MIB_UNICASTIPADDRESS_ROW</b> structure pointed to the <i>Row</i> parameter must be initialized: the <b>InterfaceLuid</b> or <b>InterfaceIndex</b>.
     * 
     * The fields are used in the order listed above. So if the <b>InterfaceLuid</b> is specified, then this member is used to determine the interface. If no value was set for the  <b>InterfaceLuid</b> member (the values of this member was set to zero), then the <b>InterfaceIndex</b> member is next used to determine the interface. 
     * 
     * If the function is successful, the existing IP address represented by the <i>Row</i> parameter was deleted. 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-getunicastipaddresstable">GetUnicastIpAddressTable</a> function can be called to enumerate the unicast IP address entries on a local computer. The <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-getunicastipaddressentry">GetUnicastIpAddressEntry</a> function can be called to retrieve a specific existing unicast IP address entry.
     * 
     * The <b>DeleteUnicastIpAddressEntry</b> function can only be called by a user logged on as a member of the Administrators group. If <b>DeleteUnicastIpAddressEntry</b> is called by a user that is not a member of the Administrators group, the function call will fail and <b>ERROR_ACCESS_DENIED</b> is returned. This function can also fail because of user account control (UAC) on Windows Vista and later. If an application that contains this function is executed by a user logged on as a member of the Administrators group other than the built-in Administrator, this call will fail unless the application has been marked in the manifest file with a <b>requestedExecutionLevel</b> set to requireAdministrator. If the application lacks this manifest file, a user logged on as a member of the Administrators group other than the built-in Administrator must then be executing the application in an enhanced shell as the built-in Administrator (RunAs administrator) for this function to succeed.
     * @param {Pointer<MIB_UNICASTIPADDRESS_ROW>} Row A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_unicastipaddress_row">MIB_UNICASTIPADDRESS_ROW</a> structure entry for an existing unicast IP address entry to delete from the local computer.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
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
     * Access is denied. This error is returned under several conditions that include the following: the  user lacks the required administrative privileges on the local computer or the application is not running in an enhanced shell as the built-in Administrator (RunAs administrator).  
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
     * An invalid parameter was passed to the function. This error is returned if a <b>NULL</b> pointer is passed in the <i>Row</i> parameter, the <b>Address</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_unicastipaddress_row">MIB_UNICASTIPADDRESS_ROW</a> pointed to by the <i>Row</i> parameter was not set to a valid unicast IPv4 or IPv6 address, or both the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> members of the <b>MIB_UNICASTIPADDRESS_ROW</b> pointed to by the <i>Row</i> parameter were unspecified.
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
     * The specified interface could not be found. This error is returned if the  network interface specified by the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_unicastipaddress_row">MIB_UNICASTIPADDRESS_ROW</a> pointed to by the <i>Row</i> parameter could not be found.  
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
     * The request is not supported. This error is returned if no IPv4 stack is on the local computer and an IPv4 address was specified in the <b>Address</b> member <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_unicastipaddress_row">MIB_UNICASTIPADDRESS_ROW</a> pointed to by the <i>Row</i> parameter. This error is also returned if no IPv6 stack is on the local computer and an IPv6 address was specified in the <b>Address</b> member.
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/netioapi/nf-netioapi-deleteunicastipaddressentry
     * @since windows6.0.6000
     */
    static DeleteUnicastIpAddressEntry(Row) {
        result := DllCall("IPHLPAPI.dll\DeleteUnicastIpAddressEntry", "ptr", Row, "uint")
        return result
    }

    /**
     * Retrieves information for an existing unicast IP address entry on the local computer.
     * @remarks
     * The <b>GetUnicastIpAddressEntry</b> function is defined on Windows Vista and later. 
     * 
     * The <b>GetUnicastIpAddressEntry</b> function is normally used to retrieve an existing <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_unicastipaddress_row">MIB_UNICASTIPADDRESS_ROW</a> structure entry to be modified.  An application can then change the members in the <b>MIB_UNICASTIPADDRESS_ROW</b> entry it wishes to modify, and then call the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-createunicastipaddressentry">SetUnicastIpAddressEntry</a> function. 
     * 
     * On input, the <b>Address</b> member in the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_unicastipaddress_row">MIB_UNICASTIPADDRESS_ROW</a> structure pointed to by the <i>Row</i> parameter must be initialized to a valid unicast IPv4 or IPv6 address. The <b>si_family</b> member of the <b>SOCKADDR_INET</b> structure  in the  <b>Address</b> member must be initialized to either <b>AF_INET</b> or <b>AF_INET6</b> and the related <b>Ipv4</b> or <b>Ipv6</b> member of the  <b>SOCKADDR_INET</b> structure must be set to a valid unicast IP address. In addition, at least one of the following members in the <b>MIB_UNICASTIPADDRESS_ROW</b> structure pointed to the <i>Row</i> parameter must be initialized: the <b>InterfaceLuid</b> or <b>InterfaceIndex</b>.
     * 
     * The fields are used in the order listed above. So if the <b>InterfaceLuid</b> is specified, then this member is used to determine the interface. If no value is set for the  <b>InterfaceLuid</b> member (the value of this member is set to zero), then the <b>InterfaceIndex</b> member is next used to determine the interface. 
     * 
     * On output when the call is successful, <b>GetUnicastIpAddressEntry</b> retrieves the other properties for the unicast IP address and fills out the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_unicastipaddress_row">MIB_UNICASTIPADDRESS_ROW</a> structure pointed to by the <i>Row</i> parameter. 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-getunicastipaddresstable">GetUnicastIpAddressTable</a> function can be called to enumerate the unicast IP address entries on a local computer.
     * @param {Pointer<MIB_UNICASTIPADDRESS_ROW>} Row A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_unicastipaddress_row">MIB_UNICASTIPADDRESS_ROW</a> structure entry for a unicast IP address entry. On successful return, this structure will be updated with the properties for an existing unicast IP address.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
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
     * The system cannot find the file specified. This error is returned if the  network interface LUID or interface index specified by the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_unicastipaddress_row">MIB_UNICASTIPADDRESS_ROW</a> pointed to by the <i>Row</i> parameter is not a value on the local machine.
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
     * A parameter is incorrect. This error is returned if a <b>NULL</b> pointer is passed in the <i>Row</i> parameter, the <b>Address</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_unicastipaddress_row">MIB_UNICASTIPADDRESS_ROW</a> pointed to by the <i>Row</i> parameter is not set to a valid unicast IPv4 or IPv6 address, or both the <b>InterfaceLuid</b> and <b>InterfaceIndex</b> members of the <b>MIB_UNICASTIPADDRESS_ROW</b> pointed to by the <i>Row</i> parameter are unspecified.
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
     * Element not found. This error is returned if the  network interface specified by the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_unicastipaddress_row">MIB_UNICASTIPADDRESS_ROW</a> structure pointed to by the <i>Row</i> parameter does not match the IP address specified in the <b>Address</b> member in the <b>MIB_UNICASTIPADDRESS_ROW</b> structure.
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
     * The request is not supported. This error is returned if no IPv4 stack is on the local computer and an IPv4 address is specified in the <b>Address</b> member of the  <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_unicastipaddress_row">MIB_UNICASTIPADDRESS_ROW</a> structure pointed to by the <i>Row</i> parameter. This error is also returned if no IPv6 stack is on the local computer and an IPv6 address is specified in the <b>Address</b> member. 
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/netioapi/nf-netioapi-getunicastipaddressentry
     * @since windows6.0.6000
     */
    static GetUnicastIpAddressEntry(Row) {
        result := DllCall("IPHLPAPI.dll\GetUnicastIpAddressEntry", "ptr", Row, "uint")
        return result
    }

    /**
     * Retrieves the unicast IP address table on the local computer.
     * @remarks
     * The <b>GetUnicastIpAddressTable</b> function is defined on Windows Vista and later. 
     * 
     * The  
     * <b>GetUnicastIpAddressTable</b> function enumerates the unicast IP addresses on a local system and returns this information in an <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_unicastipaddress_table">MIB_UNICASTIPADDRESS_TABLE</a> structure. 
     * 
     * The unicast IP address entries are returned in a <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_unicastipaddress_table">MIB_UNICASTIPADDRESS_TABLE</a> structure in the buffer pointed to by the <i>Table</i> parameter. The <b>MIB_UNICASTIPADDRESS_TABLE</b> structure contains a unicast IP address entry count and an array of <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_unicastipaddress_row">MIB_UNICASTIPADDRESS_ROW</a> structures for each unicast IP address entry. When these returned structures are no longer required, free the memory by calling the <b>FreeMibTable</b>.
     * 
     * The <i>Family</i> parameter must be initialized to either <b>AF_INET</b>,  <b>AF_INET6</b>, or <b>AF_UNSPEC</b>. 
     * 
     * Note that the returned <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_unicastipaddress_table">MIB_UNICASTIPADDRESS_TABLE</a> structure pointed to by the <i>Table</i> parameter may contain padding for alignment between the <b>NumEntries</b> member and the first <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_unicastipaddress_row">MIB_UNICASTIPADDRESS_ROW</a> array entry in the <b>Table</b> member of the <b>MIB_UNICASTIPADDRESS_TABLE</b> structure. Padding for alignment may also be present between the <b>MIB_UNICASTIPADDRESS_ROW</b> array entries. Any access to a <b>MIB_UNICASTIPADDRESS_ROW</b> array entry should assume  padding may exist.
     * @param {Integer} Family The address family to retrieve. 
     * 
     * Possible values for the address family are listed in the <i>Winsock2.h</i> header file. Note that the values for the AF_ address family and PF_ protocol family constants  are identical (for example, <b>AF_INET</b> and <b>PF_INET</b>), so either constant can be used.
     * 
     * On the Windows SDK released for Windows Vista and later, the organization of header files has changed and possible values for this member are defined in the <i>Ws2def.h</i> header file. Note that the <i>Ws2def.h</i> header file is automatically included in <i>Winsock2.h</i>, and should never be used directly.
     * 
     * The values currently supported are <b>AF_INET</b>, <b>AF_INET6</b>, and <b>AF_UNSPEC</b>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AF_UNSPEC"></a><a id="af_unspec"></a><dl>
     * <dt><b>AF_UNSPEC</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The address family is unspecified. When this parameter is specified,  this function returns the unicast IP address table containing both IPv4 and IPv6 entries.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AF_INET"></a><a id="af_inet"></a><dl>
     * <dt><b>AF_INET</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Internet Protocol version 4 (IPv4) address family. When this parameter is specified,  this function returns the unicast IP address table containing only IPv4 entries. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AF_INET6"></a><a id="af_inet6"></a><dl>
     * <dt><b>AF_INET6</b></dt>
     * <dt>23</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Internet Protocol version 6 (IPv6) address family. When this parameter is specified,  this function returns the unicast IP address table containing only IPv6 entries.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<MIB_UNICASTIPADDRESS_TABLE>} Table A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_unicastipaddress_table">MIB_UNICASTIPADDRESS_TABLE</a> structure that contains a table of unicast IP address entries on the local computer.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
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
     * An invalid parameter was passed to the function. This error is returned if a <b>NULL</b> pointer is passed in the <i>Table</i> parameter or the <i>Family</i> parameter was not specified as <b>AF_INET</b>, <b>AF_INET6</b>, or <b>AF_UNSPEC</b>.
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
     * Insufficient memory resources are available to complete the operation.
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
     * Element not found. This error is returned if no  unicast IP address entries as specified in the <i>Family</i> parameter were found. 
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
     * The request is not supported. This error is returned if no IPv4 stack is on the local computer and <b>AF_INET</b> was specified in the <b>Family</b> parameter. This error is also returned if no IPv6 stack is on the local computer and <b>AF_INET6</b> was specified in the <b>Family</b> parameter. This error is also returned on versions of Windows where this function is not supported.
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/netioapi/nf-netioapi-getunicastipaddresstable
     * @since windows6.0.6000
     */
    static GetUnicastIpAddressTable(Family, Table) {
        result := DllCall("IPHLPAPI.dll\GetUnicastIpAddressTable", "ushort", Family, "ptr", Table, "uint")
        return result
    }

    /**
     * Initializes a MIB_UNICASTIPADDRESS_ROW structure with default values for a unicast IP address entry on the local computer.
     * @remarks
     * The <b>InitializeUnicastIpAddressEntry</b> function is defined on Windows Vista and later. 
     * 
     * The <b>InitializeUnicastIpAddressEntry</b> function must be used to initialize the members of a
     *     <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_unicastipaddress_row">MIB_UNICASTIPADDRESS_ROW</a> structure entry with default values for a unicast IP address for later use with the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-createunicastipaddressentry">CreateUnicastIpAddressEntry</a> function.  
     * 
     * On input, <b>InitializeUnicastIpAddressEntry</b> must be passed a new <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_unicastipaddress_row">MIB_UNICASTIPADDRESS_ROW</a> structure to initialize. 
     * 
     * On output, the <b>PrefixOrigin</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_unicastipaddress_row">MIB_UNICASTIPADDRESS_ROW</a> structure pointed to by <i>Row</i> parameter the will be initialized to <b>IpPrefixOriginUnchanged</b>, the <b>SuffixOrigin</b> member will be initialized to <b>IpSuffixOriginUnchanged</b>, and the  <b>OnLinkPrefixLength</b> member will be initialized to an illegal value. In addition, the <b>PreferredLifetime</b> and <b>ValidLifetime</b> members are set to infinite, the <b>SkipAsSource</b> member is set to <b>FALSE</b>, and other fields are initialized to zero. 
     * 
     * After calling <b>InitializeUnicastIpAddressEntry</b>, an application can then change the
     *     members in the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_unicastipaddress_row">MIB_UNICASTIPADDRESS_ROW</a> entry it wishes to modify, and then call the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-createunicastipaddressentry">CreateUnicastIpAddressEntry</a>  to add the new unicast IP address to the local computer.
     * @param {Pointer<MIB_UNICASTIPADDRESS_ROW>} Row On entry, a pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_unicastipaddress_row">MIB_UNICASTIPADDRESS_ROW</a> structure entry for a unicast IP address entry. On return, the  <b>MIB_UNICASTIPADDRESS_ROW</b> structure pointed to by this parameter is initialized with default values for a unicast IP address.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/netioapi/nf-netioapi-initializeunicastipaddressentry
     * @since windows6.0.6000
     */
    static InitializeUnicastIpAddressEntry(Row) {
        DllCall("IPHLPAPI.dll\InitializeUnicastIpAddressEntry", "ptr", Row)
    }

    /**
     * Registers to be notified for changes to all unicast IP interfaces, unicast IPv4 addresses, or unicast IPv6 addresses on a local computer.
     * @remarks
     * The <b>NotifyUnicastIpAddressChange</b> function is defined on Windows Vista and later. 
     * 
     * The <i>Family</i> parameter must be set to either <b>AF_INET</b>, <b>AF_INET6</b>, or <b>AF_UNSPEC</b>. 
     * 
     * The invocation of the callback function specified in the <i>Callback</i> parameter is serialized. The callback function should be defined as a function of type <b>VOID</b>. The parameters passed to the callback function include the following:
     * 
     * <table>
     * <tr>
     * <th>Parameter</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <a id="IN_PVOID_CallerContext"></a><a id="in_pvoid_callercontext"></a><a id="IN_PVOID_CALLERCONTEXT"></a>IN PVOID CallerContext
     * 
     * </td>
     * <td width="60%">
     * The <i>CallerContext</i> parameter passed to the <b>NotifyUnicastIpAddressChange</b> function when registering for notifications.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <a id="IN_PMIB_UNICASTIPADDRESS_ROW_Row_OPTIONAL"></a><a id="in_pmib_unicastipaddress_row_row_optional"></a><a id="IN_PMIB_UNICASTIPADDRESS_ROW_ROW_OPTIONAL"></a>IN PMIB_UNICASTIPADDRESS_ROW Row OPTIONAL
     * 
     * </td>
     * <td width="60%">
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_unicastipaddress_row">MIB_UNICASTIPADDRESS_ROW</a> entry for the  unicast IP address that was changed. This parameter is a <b>NULL</b> pointer when the <b>MIB_NOTIFICATION_TYPE</b> value passed in the <i>NotificationType</i> parameter to the callback function is set to <b>MibInitialNotification</b>. This can only occur if the <i>InitialNotification</i> parameter passed to <b>NotifyUnicastIpAddressChange</b> was set to <b>TRUE</b> when registering for notifications.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <a id="IN_MIB_NOTIFICATION_TYPE_NotificationType"></a><a id="in_mib_notification_type_notificationtype"></a><a id="IN_MIB_NOTIFICATION_TYPE_NOTIFICATIONTYPE"></a>IN MIB_NOTIFICATION_TYPE NotificationType
     * 
     * </td>
     * <td width="60%">
     * The notification type. This member can be one of the values from the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ne-netioapi-mib_notification_type">MIB_NOTIFICATION_TYPE</a> enumeration type defined in the <i>Netioapi.h</i> header file.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * 
     * The callback function specified in the <i>Callback</i> parameter must be implemented in the same process as the application calling the <b>NotifyUnicastIpAddressChange</b> function. If the callback function is in a separate DLL, then the DLL should be loaded before calling the <b>NotifyUnicastIpAddressChange</b> function to register for change notifications. 
     * 
     * When the callback function is received when a change occurs and the <i>Row</i> parameter is not <b>NULL</b>, the pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_unicastipaddress_row">MIB_UNICASTIPADDRESS_ROW</a> structure passed in the <i>Row</i> parameter contains incomplete data. The  information returned in the <b>MIB_UNICASTIPADDRESS_ROW</b> structure is only enough information that an application can call the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-getunicastipaddressentry">GetUnicastIpAddressEntry</a> function to query complete information on the IP address that changed. When the callback function is received, an application should allocate a <b>MIB_UNICASTIPADDRESS_ROW</b> structure and initialize it with the <b>Address</b>,  <b>InterfaceLuid</b> and <b>InterfaceIndex</b> members in the <b>MIB_UNICASTIPADDRESS_ROW</b> structure pointed to by the <i>Row</i> parameter received. A pointer to this newly initialized <b>MIB_UNICASTIPADDRESS_ROW</b> structure should be passed to the <b>GetUnicastIpAddressEntry</b> function to retrieve complete information on the unicast IP address that was changed. 
     * 
     * The memory pointed to by the <i>Row</i> parameter used in the callback indications is managed by the operating system.  An application that receives a notification should never attempt to free the memory pointed to by the <i>Row</i> parameter. 
     * 
     * Once the <b>NotifyUnicastIpAddressChange</b> function is called to register for change notifications, these notifications will continue to be sent until the application deregisters for change notifications or the application terminates. If the application terminates, the system will automatically deregister any registration for change notifications. It is still recommended that an application explicitly deregister for change notifications before it terminates.  
     * 
     * Any registration for change notifications does not persist if the system is shutdown or rebooted. 
     * 
     * To deregister for change notifications, call the  <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-cancelmibchangenotify2">CancelMibChangeNotify2</a> function passing the <i>NotificationHandle</i> parameter returned by  <b>NotifyUnicastIpAddressChange</b>. 
     * 
     * An application cannot make a call to the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-cancelmibchangenotify2">CancelMibChangeNotify2</a> function from the context of the thread which is currently executing the notification callback function for the same <i>NotificationHandle</i> parameter. Otherwise, the thread executing that callback will result in deadlock. So the <b>CancelMibChangeNotify2</b> function must not be called directly as part of the notification callback routine. In a more general situation, a thread that executes the <b>CancelMibChangeNotify2</b> function cannot own a resource on which the thread that executes a notification callback operation would wait because it would result in a similar deadlock. The <b>CancelMibChangeNotify2</b> function should be called from a different thread, on which the thread that receives the notification callback doesn’t have dependencies on.
     * @param {Integer} Family The address family on which to register for change notifications. 
     * 
     * Possible values for the address family are listed in the <i>Winsock2.h</i> header file. Note that the values for the AF_ address family and PF_ protocol family constants  are identical (for example, <b>AF_INET</b> and <b>PF_INET</b>), so either constant can be used.
     * 
     * On the Windows SDK released for Windows Vista and later, the organization of header files has changed and possible values for this member are defined in the <i>Ws2def.h</i> header file. Note that the <i>Ws2def.h</i> header file is automatically included in <i>Winsock2.h</i>, and should never be used directly.
     * 
     * The values currently supported are <b>AF_INET</b>, <b>AF_INET6</b>, and <b>AF_UNSPEC</b>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AF_INET"></a><a id="af_inet"></a><dl>
     * <dt><b>AF_INET</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  Register for only unicast IPv4 address change notifications.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AF_INET6"></a><a id="af_inet6"></a><dl>
     * <dt><b>AF_INET6</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  Register for only unicast IPv6 address change notifications.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AF_UNSPEC"></a><a id="af_unspec"></a><dl>
     * <dt><b>AF_UNSPEC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  Register for both unicast IPv4 and IPv6 address change notifications.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<PUNICAST_IPADDRESS_CHANGE_CALLBACK>} Callback A pointer to the function to call when a change occurs. This function will be invoked
     *         when a unicast IP address notification is received.
     * @param {Pointer<Void>} CallerContext A user context passed to the callback function specified in the <i>Callback</i> parameter when an interface notification is received.
     * @param {Integer} InitialNotification A value that indicates whether the callback should be invoked
     *         immediately after registration for change notification completes. This initial notification does not indicate a change occurred to a unicast IP address. The purpose of this parameter to provide confirmation that the callback is registered.
     * @param {Pointer<HANDLE>} NotificationHandle A pointer used to return a handle that can be later used to
     *         deregister the change notification. On success, a notification handle is returned in this parameter. If an error occurs, <b>NULL</b> is returned.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
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
     * An internal error occurred where an invalid handle was encountered. 
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
     * An invalid parameter was passed to the function. This error is returned if the <i>Family</i> parameter was not either <b>AF_INET</b>, <b>AF_INET6</b>, or <b>AF_UNSPEC</b>.
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
     * There was insufficient memory.
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/netioapi/nf-netioapi-notifyunicastipaddresschange
     * @since windows6.0.6000
     */
    static NotifyUnicastIpAddressChange(Family, Callback, CallerContext, InitialNotification, NotificationHandle) {
        result := DllCall("IPHLPAPI.dll\NotifyUnicastIpAddressChange", "ushort", Family, "ptr", Callback, "ptr", CallerContext, "char", InitialNotification, "ptr", NotificationHandle, "uint")
        return result
    }

    /**
     * Retrieves the stable unicast IP address table on a local computer.
     * @remarks
     * The <b>NotifyStableUnicastIpAddressTable</b> function is defined on Windows Vista and later. 
     * 
     * If the <b>NotifyStableUnicastIpAddressTable</b> function succeeds immediately, the return value is NO_ERROR and the stable unicast IP table is returned in the <i>Table</i> parameter.  The calling application should free the memory pointed to by the <i>Table</i> parameter using the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-freemibtable">FreeMibTable</a> function when the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_unicastipaddress_table">MIB_UNICASTIPADDRESS_TABLE</a> information is no longer needed.
     * 
     * All unicast IP addresses except dial-on-demand addresses are considered stable only if they are in the preferred state.  For a normal unicast IP address entry, this would correspond to a DadState member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_unicastipaddress_row">MIB_UNICASTIPADDRESS_ROW</a> for the IP address set to <b>IpDadStatePreferred</b>. 
     * Every dial-on-demand address defines its own stability metric.  Currently the only dial-on-demand address considered by this function is the unicast IP address used by the Teredo client on the local computer. 
     * 
     * The <i>Family</i> parameter must be set to either <b>AF_INET</b>, <b>AF_INET6</b>, or <b>AF_UNSPEC</b>. 
     * 
     * When <b>NotifyStableUnicastIpAddressTable</b> is successful and returns NO_ERROR, the <i>Table</i> parameter returns the stable unicast IP address table on the local computer. 
     * 
     * When <b>NotifyStableUnicastIpAddressTable</b> returns <b>ERROR_IO_PENDING</b> indicating that the I/O request is pending, then the  stable unicast IP address table is returned to the function in the <i>CallerCallback</i>  parameter.
     * 
     * The <b>NotifyStableUnicastIpAddressTable</b> function is used primarily by applications that use the Teredo client.
     * 
     * If the unicast IP address used by Teredo is available on the local computer but not in the stable (qualified) state, <b>NotifyStableUnicastIpAddressTable</b> returns ERROR_IO_PENDING and the stable unicast IP address table is eventually returned by  calling the function in the <i>CallerCallback</i>  parameter.  If the Teredo address is not available or is in the stable state and the other unicast IP addresses are in a stable state, then the function  in the <i>CallerCallback</i>  parameter will never be invoked.  
     * 
     * The callback function specified in the <i>CallerCallback</i> parameter should be defined as a function of type <b>VOID</b>. The parameters passed to the callback function include the following:
     * 
     * <table>
     * <tr>
     * <th>Parameter</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <a id="IN_PVOID_CallerContext"></a><a id="in_pvoid_callercontext"></a><a id="IN_PVOID_CALLERCONTEXT"></a>IN PVOID CallerContext
     * 
     * </td>
     * <td width="60%">
     * The <i>CallerContext</i> parameter passed to the <b>NotifyStableUnicastIpAddressTable</b> function when registering for notifications.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <a id="IN_PMIB_UNICASTIPADDRESS_TABLE_AddressTable"></a><a id="in_pmib_unicastipaddress_table_addresstable"></a><a id="IN_PMIB_UNICASTIPADDRESS_TABLE_ADDRESSTABLE"></a>IN PMIB_UNICASTIPADDRESS_TABLE AddressTable
     * 
     * </td>
     * <td width="60%">
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_unicastipaddress_table">MIB_UNICASTIPADDRESS_TABLE</a> containing the stable unicast IP address table on the local computer. 
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * 
     * The callback function specified in the <i>CallerCallback</i> parameter must be implemented in the same process as the application calling the <b>NotifyStableUnicastIpAddressTable</b> function. If the callback function is in a separate DLL, then the DLL should be loaded before calling the <b>NotifyStableUnicastIpAddressTable</b> function to register for change notifications. 
     * 
     * The memory pointed to by the <i>AddressTable</i> parameter used in a callback indication is allocated by the operating system. An application that receives a notification should free the memory pointed to by the <i>AddressTable</i> parameter using the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-freemibtable">FreeMibTable</a> function when the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_unicastipaddress_table">MIB_UNICASTIPADDRESS_TABLE</a> information is no longer needed. 
     * 
     * Once the <b>NotifyStableUnicastIpAddressTable</b> function is called to register for change notifications, these notifications will continue to be sent until the application deregisters for change notifications or the application terminates. If the application terminates, the system will automatically deregister any registration for change notifications. It is still recommended that an application explicitly deregister any change notifications before it terminates.  
     * 
     * Any registration for change notifications does not persist if the system is shutdown or rebooted. 
     * 
     * To deregister for change notifications, call the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-cancelmibchangenotify2">CancelMibChangeNotify2</a> function passing the <i>NotificationHandle</i> parameter returned by <b>NotifyStableUnicastIpAddressTable</b>. 
     * 
     * An application cannot make a call to the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-cancelmibchangenotify2">CancelMibChangeNotify2</a> function from the context of the thread which is currently executing the notification callback function for the same <i>NotificationHandle</i> parameter. Otherwise, the thread executing that callback will result in deadlock. So the <b>CancelMibChangeNotify2</b> function must not be called directly as part of the notification callback routine. In a more general situation, a thread that executes the <b>CancelMibChangeNotify2</b> function cannot own a resource on which the thread that executes a notification callback operation would wait because it would result in a similar deadlock. The <b>CancelMibChangeNotify2</b> function should be called from a different thread, on which the thread that receives the notification callback doesn’t have dependencies on.
     * @param {Integer} Family The address family to retrieve. 
     * 
     * Possible values for the address family are listed in the <i>Winsock2.h</i> header file. Note that the values for the AF_ address family and PF_ protocol family constants  are identical (for example, <b>AF_INET</b> and <b>PF_INET</b>), so either constant can be used.
     * 
     * On the Windows SDK released for Windows Vista and later, the organization of header files has changed and possible values for this member are defined in the <i>Ws2def.h</i> header file. Note that the <i>Ws2def.h</i> header file is automatically included in <i>Winsock2.h</i>, and should never be used directly.
     * 
     * The values currently supported are <b>AF_INET</b>, <b>AF_INET6</b>, and <b>AF_UNSPEC</b>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AF_UNSPEC"></a><a id="af_unspec"></a><dl>
     * <dt><b>AF_UNSPEC</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The address family is unspecified. When this parameter is specified,  the function  retrieves the stable unicast IP address table containing both IPv4 and IPv6 entries. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AF_INET"></a><a id="af_inet"></a><dl>
     * <dt><b>AF_INET</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Internet Protocol version 4 (IPv4) address family. When this parameter is specified,  the function retrieves the stable unicast IP address table containing only IPv4 entries. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AF_INET6"></a><a id="af_inet6"></a><dl>
     * <dt><b>AF_INET6</b></dt>
     * <dt>23</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Internet Protocol version 6 (IPv6) address family. When this parameter is specified,  the function retrieves the stable unicast IP address table containing only IPv6 entries. 
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<MIB_UNICASTIPADDRESS_TABLE>} Table A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_unicastipaddress_table">MIB_UNICASTIPADDRESS_TABLE</a> structure. When <b>NotifyStableUnicastIpAddressTable</b> is successful, this parameter returns the stable unicast IP address table on the local computer.  
     * 
     * When <b>NotifyStableUnicastIpAddressTable</b> returns <b>ERROR_IO_PENDING</b> indicating that the I/O request is pending, then the  stable unicast IP address table is returned to the function in the <i>CallerCallback</i>  parameter.
     * @param {Pointer<PSTABLE_UNICAST_IPADDRESS_TABLE_CALLBACK>} CallerCallback A pointer to the function to call with the stable unicast IP address table. This function will be invoked
     *         if <b>NotifyStableUnicastIpAddressTable</b> returns <b>ERROR_IO_PENDING</b>, indicating that the I/O request is pending.
     * @param {Pointer<Void>} CallerContext A user context passed to the callback function specified in the <i>CallerCallback</i> parameter when the stable unicast IP address table si available.
     * @param {Pointer<HANDLE>} NotificationHandle A pointer used to return a handle that can be used to
     *         cancel the request to retrieve the stable unicast IP address table. This parameter is returned if  the return value from <b>NotifyStableUnicastIpAddressTable</b> is <b>ERROR_IO_PENDING</b> indicating that the I/O request is pending.
     * @returns {Integer} If the function succeeds immediately, the return value is NO_ERROR and the stable unicast IP table is returned in the <i>Table</i> parameter.
     * 
     * If the I/O request is pending, the function returns <b>ERROR_IO_PENDING</b> and the function pointed to by the <i>CallerCallback</i> parameter is called when the I/O request has completed with the stable unicast IP address table.
     * 
     * If the function fails, the return value is one of the following error codes.
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
     * An internal error occurred where an invalid handle was encountered. 
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
     * An invalid parameter was passed to the function. This error is returned if the <i>Table</i> parameter was  a <b>NULL</b> pointer, the <i>NotificationHandle</i> parameter was  a <b>NULL</b> pointer,  or the <i>Family</i> parameter was not either <b>AF_INET</b>, <b>AF_INET6</b>, or <b>AF_UNSPEC</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There was insufficient memory.
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/netioapi/nf-netioapi-notifystableunicastipaddresstable
     * @since windows6.0.6000
     */
    static NotifyStableUnicastIpAddressTable(Family, Table, CallerCallback, CallerContext, NotificationHandle) {
        result := DllCall("IPHLPAPI.dll\NotifyStableUnicastIpAddressTable", "ushort", Family, "ptr", Table, "ptr", CallerCallback, "ptr", CallerContext, "ptr", NotificationHandle, "uint")
        return result
    }

    /**
     * Sets the properties of an existing unicast IP address entry on the local computer.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-createunicastipaddressentry">SetUnicastIpAddressEntry</a> function is defined on Windows Vista and later. 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-getunicastipaddressentry">GetUnicastIpAddressEntry</a> function is normally used to retrieve an existing <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_unicastipaddress_row">MIB_UNICASTIPADDRESS_ROW</a> structure entry to be modified.  An application can then change the
     *     members in the <b>MIB_UNICASTIPADDRESS_ROW</b> entry it wishes to modify, and then call the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-createunicastipaddressentry">SetUnicastIpAddressEntry</a> function. 
     * 
     * An application may call the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-initializeunicastipaddressentry">InitializeUnicastIpAddressEntry</a> function to initialize the members of a
     *     <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_unicastipaddress_row">MIB_UNICASTIPADDRESS_ROW</a> structure entry with default values before making changes. However, the application would normally save either the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> member before calling <b>InitializeUnicastIpAddressEntry</b> and restore one of these members after the call. 
     * 
     * The <b>Address</b> member in the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_unicastipaddress_row">MIB_UNICASTIPADDRESS_ROW</a> structure pointed to by the <i>Row</i> parameter must be initialized to a valid unicast IPv4 or IPv6 address and family. In addition, at least one of the following members in the <b>MIB_UNICASTIPADDRESS_ROW</b> structure pointed to the <i>Row</i> parameter must be initialized: the <b>InterfaceLuid</b> or <b>InterfaceIndex</b>.
     * 
     * The fields are used in the order listed above. So if the <b>InterfaceLuid</b> is specified, then this member is used to determine the interface. If no value was set for the  <b>InterfaceLuid</b> member (the values of this member was set to zero), then the <b>InterfaceIndex</b> member is next used to determine the interface. 
     * 
     * If the <b>OnLinkPrefixLength</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_unicastipaddress_row">MIB_UNICASTIPADDRESS_ROW</a> pointed to by the <i>Row</i> parameter is set to 255, then <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-createunicastipaddressentry">SetUnicastIpAddressEntry</a> will set the unicast IP address properties so that the <b>OnLinkPrefixLength</b> member is equal to the length of the IP address. So for a unicast IPv4 address, the  <b>OnLinkPrefixLength</b> is set to 32 and the <b>OnLinkPrefixLength</b> is set to 128 for a unicast IPv6 address. If this would result in the incorrect subnet mask for an IPv4 address or the incorrect link prefix for an IPv6 address, then the application should set this member to the correct value before calling <b>SetUnicastIpAddressEntry</b>. 
     * 
     * The <b>DadState</b>, <b>ScopeId</b>, and <b>CreationTimeStamp</b> members of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_unicastipaddress_row">MIB_UNICASTIPADDRESS_ROW</a> structure pointed to by the <i>Row</i> are ignored when the  <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-createunicastipaddressentry">SetUnicastIpAddressEntry</a>  function is called. These members are set by the network stack and cannot be changed using the <b>SetUnicastIpAddressEntry</b>  function. The  <b>ScopeId</b> member is automatically determined by the interface on which the address was added.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-createunicastipaddressentry">SetUnicastIpAddressEntry</a> function can only be called by a user logged on as a member of the Administrators group. If <b>SetUnicastIpAddressEntry</b> is called by a user that is not a member of the Administrators group, the function call will fail and <b>ERROR_ACCESS_DENIED</b> is returned. 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-createunicastipaddressentry">SetUnicastIpAddressEntry</a> function can also fail because of user account control (UAC) on Windows Vista and later. If an application that contains this function is executed by a user logged on as a member of the Administrators group other than the built-in Administrator, this call will fail unless the application has been marked in the manifest file with a <b>requestedExecutionLevel</b> set to requireAdministrator. If the application lacks this manifest file, a user logged on as a member of the Administrators group other than the built-in Administrator must then be executing the application in an enhanced shell as the built-in Administrator (RunAs administrator) for this function to succeed.
     * @param {Pointer<MIB_UNICASTIPADDRESS_ROW>} Row A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_unicastipaddress_row">MIB_UNICASTIPADDRESS_ROW</a> structure entry for an existing unicast IP address entry.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
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
     * Access is denied. This error is returned under several conditions that include the following: the  user lacks the required administrative privileges on the local computer or the application is not running in an enhanced shell as the built-in Administrator (RunAs administrator).  
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
     * An invalid parameter was passed to the function. This error is returned if a <b>NULL</b> pointer is passed in the <i>Row</i> parameter, the <b>Address</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_unicastipaddress_row">MIB_UNICASTIPADDRESS_ROW</a> pointed to by the <i>Row</i> parameter was not set to a valid unicast IPv4 or IPv6 address, or both the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> members of the <b>MIB_UNICASTIPADDRESS_ROW</b> pointed to by the <i>Row</i> parameter were unspecified.
     * 
     * This error is also returned for other errors in the values set for members in the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_unicastipaddress_row">MIB_UNICASTIPADDRESS_ROW</a> structure. These errors include the following: if the <b>ValidLifetime</b> member is less than than the <b>PreferredLifetime</b> member, if the <b>PrefixOrigin</b> member is set to <b>IpPrefixOriginUnchanged</b> and the <b>SuffixOrigin</b> is the not set to <b>IpSuffixOriginUnchanged</b>, if the <b>PrefixOrigin</b> member is not set to <b>IpPrefixOriginUnchanged</b> and the <b>SuffixOrigin</b> is set to <b>IpSuffixOriginUnchanged</b>, if the <b>PrefixOrigin</b> member is not set to a value from the <b>NL_PREFIX_ORIGIN</b> enumeration, if the <b>SuffixOrigin</b> member is not set to a value from the <b>NL_SUFFIX_ORIGIN</b> enumeration, or if the <b>OnLinkPrefixLength</b> member is set to a value greater than the IP address length, in bits (32 for an unicast IPv4 address or 128 for an unicast IPv6 address).
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
     * The specified interface could not be found. This error is returned if the  network interface specified by the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_unicastipaddress_row">MIB_UNICASTIPADDRESS_ROW</a> pointed to by the <i>Row</i> parameter could not be found.  
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
     * The request is not supported. This error is returned if no IPv4 stack is on the local computer and an IPv4 address was specified in the <b>Address</b> member <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_unicastipaddress_row">MIB_UNICASTIPADDRESS_ROW</a> pointed to by the <i>Row</i> parameter or no IPv6 stack is on the local computer and an IPv6 address was specified in the <b>Address</b> member.
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/netioapi/nf-netioapi-setunicastipaddressentry
     * @since windows6.0.6000
     */
    static SetUnicastIpAddressEntry(Row) {
        result := DllCall("IPHLPAPI.dll\SetUnicastIpAddressEntry", "ptr", Row, "uint")
        return result
    }

    /**
     * Adds a new anycast IP address entry on the local computer.
     * @remarks
     * The <b>CreateAnycastIpAddressEntry</b> function is defined on Windows Vista and later. 
     * 
     * The <b>CreateAnycastIpAddressEntry</b> function is used to add a new anycast IP address entry on a local computer. 
     * 
     * The <b>Address</b> member in the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_anycastipaddress_row">MIB_ANYCASTIPADDRESS_ROW</a> structure pointed to by the <i>Row</i> parameter must be initialized to a valid unicast IPv4 or IPv6 address and family. In addition, at least one of the following members in the <b>MIB_ANYCASTIPADDRESS_ROW</b> structure pointed to the <i>Row</i> parameter must be initialized to the interface: the <b>InterfaceLuid</b> or <b>InterfaceIndex</b>.
     * 
     * The fields are used in the order listed above. So if the <b>InterfaceLuid</b> is specified, then this member is used to determine the interface on which to add the unicast IP address. If no value was set for the  <b>InterfaceLuid</b> member (the values of this member was set to zero), then the <b>InterfaceIndex</b> member is next used to determine the interface. 
     * 
     * The <b>ScopeId</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_anycastipaddress_row">MIB_ANYCASTIPADDRESS_ROW</a> structure pointed to by the <i>Row</i> is ignored when the  <b>CreateAnycastIpAddressEntry</b> function is called. The  <b>ScopeId</b> member is automatically determined by the interface on which the address is added.
     * 
     * The <b>CreateAnycastIpAddressEntry</b> function will fail if the anycast IP address passed in the <b>Address</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_anycastipaddress_row">MIB_ANYCASTIPADDRESS_ROW</a> pointed to by the <i>Row</i> parameter is a duplicate of an existing anycast IP address on the interface. 
     * 
     * The <b>CreateAnycastIpAddressEntry</b> function can only be called by a user logged on as a member of the Administrators group. If <b>CreateAnycastIpAddressEntry</b> is called by a user that is not a member of the Administrators group, the function call will fail and <b>ERROR_ACCESS_DENIED</b> is returned. This function can also fail because of user account control (UAC) on Windows Vista and later. If an application that contains this function is executed by a user logged on as a member of the Administrators group other than the built-in Administrator, this call will fail unless the application has been marked in the manifest file with a <b>requestedExecutionLevel</b> set to requireAdministrator. If the application lacks this manifest file, a user logged on as a member of the Administrators group other than the built-in Administrator must then be executing the application in an enhanced shell as the built-in Administrator (RunAs administrator) for this function to succeed.
     * @param {Pointer<MIB_ANYCASTIPADDRESS_ROW>} Row A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_anycastipaddress_row">MIB_ANYCASTIPADDRESS_ROW</a> structure entry for an anycast IP address entry.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
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
     * Access is denied. This error is returned under several conditions that include the following: the  user lacks the required administrative privileges on the local computer or the application is not running in an enhanced shell as the built-in Administrator (RunAs administrator).  
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
     * An invalid parameter was passed to the function. This error is returned if a <b>NULL</b> pointer is passed in the <i>Row</i> parameter, the <b>Address</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_anycastipaddress_row">MIB_ANYCASTIPADDRESS_ROW</a> pointed to by the <i>Row</i> parameter was not set to a valid unicast IPv4 or IPv6 address, or both the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> members of the <b>MIB_ANYCASTIPADDRESS_ROW</b> pointed to by the <i>Row</i> parameter were unspecified. 
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
     * The specified interface could not be found. This error is returned if the  network interface specified by the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_anycastipaddress_row">MIB_ANYCASTIPADDRESS_ROW</a> pointed to by the <i>Row</i> parameter could not be found.  
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
     * The request is not supported. This error is returned if no IPv4 stack is on the local computer and an IPv4 address was specified in the <b>Address</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_anycastipaddress_row">MIB_ANYCASTIPADDRESS_ROW</a> pointed to by the <i>Row</i> parameter. This error is also returned if no IPv6 stack is on the local computer and an IPv6 address was specified in the <b>Address</b> member.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_OBJECT_ALREADY_EXISTS </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object already exists. This error is returned if the  <b>Address</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_anycastipaddress_row">MIB_ANYCASTIPADDRESS_ROW</a> pointed to by the <i>Row</i> parameter is a duplicate of an existing anycast IP address on the interface specified by the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> member of the <b>MIB_ANYCASTIPADDRESS_ROW</b>.  
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/netioapi/nf-netioapi-createanycastipaddressentry
     * @since windows6.0.6000
     */
    static CreateAnycastIpAddressEntry(Row) {
        result := DllCall("IPHLPAPI.dll\CreateAnycastIpAddressEntry", "ptr", Row, "uint")
        return result
    }

    /**
     * Deletes an existing anycast IP address entry on the local computer.
     * @remarks
     * The <b>DeleteAnycastIpAddressEntry</b> function is defined on Windows Vista and later. 
     * 
     * The <b>DeleteAnycastIpAddressEntry</b> function is used to delete an existing <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_anycastipaddress_row">MIB_ANYCASTIPADDRESS_ROW</a> structure entry on the local computer.  
     * 
     * On input, the <b>Address</b> member in the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_anycastipaddress_row">MIB_ANYCASTIPADDRESS_ROW</a> structure pointed to by the <i>Row</i> parameter must be set to a valid unicast IPv4 or IPv6 address and family. In addition, at least one of the following members in the <b>MIB_ANYCASTIPADDRESS_ROW</b> structure pointed to the <i>Row</i> parameter must be initialized: the <b>InterfaceLuid</b> or <b>InterfaceIndex</b>.
     * 
     * The fields are used in the order listed above. So if the <b>InterfaceLuid</b> is specified, then this member is used to determine the interface. If no value was set for the  <b>InterfaceLuid</b> member (the values of this member was set to zero), then the <b>InterfaceIndex</b> member is next used to determine the interface. 
     * 
     * If the function is successful, the existing IP address represented by the <i>Row</i> parameter was deleted. 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-getanycastipaddresstable">GetAnycastIpAddressTable</a> function can be called to enumerate the anycast IP address entries on a local computer. The <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-getanycastipaddressentry">GetAnycastIpAddressEntry</a> function can be called to retrieve a specific existing anycast IP address entry.
     * 
     * The <b>DeleteAnycastIpAddressEntry</b> function can only be called by a user logged on as a member of the Administrators group. If <b>DeleteAnycastIpAddressEntry</b> is called by a user that is not a member of the Administrators group, the function call will fail and <b>ERROR_ACCESS_DENIED</b> is returned. This function can also fail because of user account control (UAC) on Windows Vista and later. If an application that contains this function is executed by a user logged on as a member of the Administrators group other than the built-in Administrator, this call will fail unless the application has been marked in the manifest file with a <b>requestedExecutionLevel</b> set to requireAdministrator. If the application lacks this manifest file, a user logged on as a member of the Administrators group other than the built-in Administrator must then be executing the application in an enhanced shell as the built-in Administrator (RunAs administrator) for this function to succeed.
     * @param {Pointer<MIB_ANYCASTIPADDRESS_ROW>} Row A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_anycastipaddress_row">MIB_ANYCASTIPADDRESS_ROW</a>  structure entry for an existing anycast IP address entry to delete from the local computer.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
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
     * Access is denied. This error is returned under several conditions that include the following: the  user lacks the required administrative privileges on the local computer or the application is not running in an enhanced shell as the built-in Administrator (RunAs administrator).  
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
     * An invalid parameter was passed to the function. This error is returned if a <b>NULL</b> pointer is passed in the <i>Row</i> parameter, the <b>Address</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_anycastipaddress_row">MIB_ANYCASTIPADDRESS_ROW</a> pointed to by the <i>Row</i> parameter was not set to a valid unicast IPv4 or IPv6 address, or both the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> members of the <b>MIB_ANYCASTIPADDRESS_ROW</b> pointed to by the <i>Row</i> parameter were unspecified.
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
     * The specified interface could not be found. This error is returned if the  network interface specified by the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_anycastipaddress_row">MIB_ANYCASTIPADDRESS_ROW</a> pointed to by the <i>Row</i> parameter could not be found.  
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
     * The request is not supported. This error is returned if no IPv4 stack is on the local computer and an IPv4 address was specified in the <b>Address</b> member <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_anycastipaddress_row">MIB_ANYCASTIPADDRESS_ROW</a> pointed to by the <i>Row</i> parameter. This error is also returned if no IPv6 stack is on the local computer and an IPv6 address was specified in the <b>Address</b> member .
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/netioapi/nf-netioapi-deleteanycastipaddressentry
     * @since windows6.0.6000
     */
    static DeleteAnycastIpAddressEntry(Row) {
        result := DllCall("IPHLPAPI.dll\DeleteAnycastIpAddressEntry", "ptr", Row, "uint")
        return result
    }

    /**
     * Retrieves information for an existing anycast IP address entry on the local computer.
     * @remarks
     * The <b>GetAnycastIpAddressEntry</b> function is defined on Windows Vista and later. 
     * 
     * The <b>GetAnycastIpAddressEntry</b> function is used to retrieve an existing <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_anycastipaddress_row">MIB_ANYCASTIPADDRESS_ROW</a> structure entry.  
     * 
     * On input, the <b>Address</b> member in the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_anycastipaddress_row">MIB_ANYCASTIPADDRESS_ROW</a> structure pointed to by the <i>Row</i> parameter must be initialized to a valid anycast IPv4 or IPv6 address and family. In addition, at least one of the following members in the <b>MIB_ANYCASTIPADDRESS_ROW</b> structure pointed to the <i>Row</i> parameter must be initialized: the <b>InterfaceLuid</b> or <b>InterfaceIndex</b>.
     * 
     * The fields are used in the order listed above. So if the <b>InterfaceLuid</b> is specified, then this member is used to determine the interface. If no value is set for the  <b>InterfaceLuid</b> member (the value of this member is set to zero), then the <b>InterfaceIndex</b> member is next used to determine the interface. 
     * 
     * On output when the call is successful, <b>GetAnycastIpAddressEntry</b> retrieves the other properties for the anycast IP address and fills out the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_anycastipaddress_row">MIB_ANYCASTIPADDRESS_ROW</a> structure pointed to by the <i>Row</i> parameter. 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-getanycastipaddresstable">GetAnycastIpAddressTable</a> function can be called to enumerate the anycast IP address entries on a local computer.
     * @param {Pointer<MIB_ANYCASTIPADDRESS_ROW>} Row A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_anycastipaddress_row">MIB_ANYCASTIPADDRESS_ROW</a> structure entry for an anycast IP address entry. On successful return, this structure will be updated with the properties for an existing anycast IP address.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
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
     * The system cannot find the file specified. This error is returned if the  network interface LUID or interface index specified by the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_anycastipaddress_row">MIB_ANYCASTIPADDRESS_ROW</a> pointed to by the <i>Row</i> parameter is not a value on the local machine.
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
     * A parameter is incorrect. This error is returned if a <b>NULL</b> pointer is passed in the <i>Row</i> parameter, the <b>Address</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_anycastipaddress_row">MIB_ANYCASTIPADDRESS_ROW</a> pointed to by the <i>Row</i> parameter is not set to a valid anycast IPv4 or IPv6 address, or both the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> members of the <b>MIB_ANYCASTIPADDRESS_ROW</b> pointed to by the <i>Row</i> parameter were unspecified.
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
     * Element not found. This error is returned if the  network interface specified by the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_anycastipaddress_row">MIB_ANYCASTIPADDRESS_ROW</a> structure pointed to by the <i>Row</i> parameter does not match the IP address and address family specified in the <b>Address</b> member in the <b>MIB_ANYCASTIPADDRESS_ROW</b> structure.
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
     * The request is not supported. This error is returned if no IPv4 stack is on the local computer and an IPv4 address is specified in the <b>Address</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_unicastipaddress_row">MIB_UNICASTIPADDRESS_ROW</a> structure pointed to by the <i>Row</i> parameter. This error is returned if no IPv6 stack is on the local computer and an IPv6 address is specified in the  <b>Address</b> member. 
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/netioapi/nf-netioapi-getanycastipaddressentry
     * @since windows6.0.6000
     */
    static GetAnycastIpAddressEntry(Row) {
        result := DllCall("IPHLPAPI.dll\GetAnycastIpAddressEntry", "ptr", Row, "uint")
        return result
    }

    /**
     * Retrieves the anycast IP address table on the local computer.
     * @remarks
     * The <b>GetAnycastIpAddressTable</b> function is defined on Windows Vista and later. 
     * 
     * The  
     * <b>GetAnycastIpAddressTable</b> function enumerates the anycast IP addresses on a local system and returns this information in a <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_anycastipaddress_table">MIB_ANYCASTIPADDRESS_TABLE</a> structure. 
     * 
     * The anycast IP address entries are returned in a <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_anycastipaddress_table">MIB_ANYCASTIPADDRESS_TABLE</a> structure in the buffer pointed to by the <i>Table</i> parameter. The <b>MIB_ANYCASTIPADDRESS_TABLE</b> structure contains an anycast IP address entry count and an array of <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_anycastipaddress_row">MIB_ANYCASTIPADDRESS_ROW</a> structures for each anycast IP address entry. When these returned structures are no longer required, free the memory by calling the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-freemibtable">FreeMibTable</a>.
     * 
     * The <i>Family</i> parameter must be initialized to either <b>AF_INET</b>,  <b>AF_INET6</b>, or <b>AF_UNSPEC</b>. 
     * 
     * Note that the returned <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_anycastipaddress_table">MIB_ANYCASTIPADDRESS_TABLE</a> structure pointed to by the <i>Table</i> parameter may contain padding  for alignment between the <b>NumEntries</b> member and the first <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_anycastipaddress_row">MIB_ANYCASTIPADDRESS_ROW</a> array entry in the <b>Table</b> member of the <b>MIB_ANYCASTIPADDRESS_TABLE</b> structure. Padding for alignment may also be present between the <b>MIB_ANYCASTIPADDRESS_ROW</b> array entries. Any access to a <b>MIB_ANYCASTIPADDRESS_ROW</b> array entry should assume  padding may exist.
     * @param {Integer} Family The address family to retrieve. 
     * 
     * Possible values for the address family are listed in the <i>Winsock2.h</i> header file. Note that the values for the AF_ address family and PF_ protocol family constants  are identical (for example, <b>AF_INET</b> and <b>PF_INET</b>), so either constant can be used.
     * 
     * On the Windows SDK released for Windows Vista and later, the organization of header files has changed and possible values for this member are defined in the <i>Ws2def.h</i> header file. Note that the <i>Ws2def.h</i> header file is automatically included in <i>Winsock2.h</i>, and should never be used directly.
     * 
     * The values currently supported are <b>AF_INET</b>, <b>AF_INET6</b>, and <b>AF_UNSPEC</b>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AF_UNSPEC"></a><a id="af_unspec"></a><dl>
     * <dt><b>AF_UNSPEC</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The address family is unspecified. When this parameter is specified,  this function  returns the anycast IP address table containing both IPv4 and IPv6 entries. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AF_INET"></a><a id="af_inet"></a><dl>
     * <dt><b>AF_INET</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Internet Protocol version 4 (IPv4) address family. When this parameter is specified,  this function  returns the anycast IP address table containing only  IPv4 entries. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AF_INET6"></a><a id="af_inet6"></a><dl>
     * <dt><b>AF_INET6</b></dt>
     * <dt>23</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Internet Protocol version 6 (IPv6) address family. When this parameter is specified,  this function  returns the anycast IP address table containing only IPv6 entries. 
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<MIB_ANYCASTIPADDRESS_TABLE>} Table A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_anycastipaddress_table">MIB_ANYCASTIPADDRESS_TABLE</a> structure that contains a table of anycast IP address entries on the local computer.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
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
     * An invalid parameter was passed to the function. This error is returned if a <b>NULL</b> pointer is passed in the <i>Table</i> parameter or the <i>Family</i> parameter was not specified as <b>AF_INET</b>, <b>AF_INET6</b>, or <b>AF_UNSPEC</b>.
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
     * Insufficient memory resources are available to complete the operation.
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
     * No anycast IP address entries as specified in the <i>Family</i> parameter were found. 
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
     * The request is not supported. This error is returned if no IPv4 stack is on the local computer and <b>AF_INET</b> was specified in the <b>Family</b> parameter. This error is also returned if no IPv6 stack is on the local computer and <b>AF_INET6</b> was specified in the <b>Family</b> parameter. This error is also returned on versions of Windows where this function is not supported.
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/netioapi/nf-netioapi-getanycastipaddresstable
     * @since windows6.0.6000
     */
    static GetAnycastIpAddressTable(Family, Table) {
        result := DllCall("IPHLPAPI.dll\GetAnycastIpAddressTable", "ushort", Family, "ptr", Table, "uint")
        return result
    }

    /**
     * Retrieves information for an existing multicast IP address entry on the local computer.
     * @remarks
     * The <b>GetMulticastIpAddressEntry</b> function is defined on Windows Vista and later. 
     * 
     * The <b>GetMulticastIpAddressEntry</b> function is used to retrieve an existing <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_multicastipaddress_row">MIB_MULTICASTIPADDRESS_ROW</a> structure entry.  
     * 
     * On input, the <b>Address</b> member in the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_multicastipaddress_row">MIB_MULTICASTIPADDRESS_ROW</a> structure pointed to by the <i>Row</i> parameter must be initialized to a valid multicast IPv4 or IPv6 address and family. In addition, at least one of the following members in the <b>MIB_MULTICASTIPADDRESS_ROW</b> structure pointed to the <i>Row</i> parameter must be initialized: the <b>InterfaceLuid</b> or <b>InterfaceIndex</b>.
     * 
     * The fields are used in the order listed above. So if the <b>InterfaceLuid</b> is specified, then this member is used to determine the interface. If no value is set for the  <b>InterfaceLuid</b> member (the value of this member is set to zero), then the <b>InterfaceIndex</b> member is next used to determine the interface. 
     * 
     * On output when the call is successful, <b>GetMulticastIpAddressEntry</b> retrieves the other properties for the multicast IP address and fills out the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_multicastipaddress_row">MIB_MULTICASTIPADDRESS_ROW</a> structure pointed to by the <i>Row</i> parameter. 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-getmulticastipaddresstable">GetMulticastIpAddressTable</a> function can be called to enumerate the multicast IP address entries on a local computer.
     * @param {Pointer<MIB_MULTICASTIPADDRESS_ROW>} Row A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_multicastipaddress_row">MIB_MULTICASTIPADDRESS_ROW</a> structure entry for a multicast IP address entry. On successful return, this structure will be updated with the properties for an existing multicast IP address.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
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
     * The system cannot find the file specified. This error is returned if the  network interface LUID or interface index specified by the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_multicastipaddress_row">MIB_MULTICASTIPADDRESS_ROW</a> pointed to by the <i>Row</i> parameter is not a value on the local machine.
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
     * A parameter is incorrect. This error is returned if a <b>NULL</b> pointer is passed in the <i>Row</i> parameter, the <b>Address</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_multicastipaddress_row">MIB_MULTICASTIPADDRESS_ROW</a> pointed to by the <i>Row</i> parameter is not set to a valid multicast IPv4 or IPv6 address, or both the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> members of the <b>MIB_MULTICASTIPADDRESS_ROW</b> pointed to by the <i>Row</i> parameter are unspecified.
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
     * Element not found. This error is returned if the  network interface specified by the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_multicastipaddress_row">MIB_MULTICASTIPADDRESS_ROW</a> structure pointed to by the <i>Row</i> parameter does not match the IP address and address family specified in the <b>Address</b> member in the <b>MIB_MULTICASTIPADDRESS_ROW</b>  structure.
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
     * The request is not supported. This error is returned if no IPv4 stack is on the local computer and an IPv4 address is specified in the <b>Address</b> member <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_multicastipaddress_row">MIB_MULTICASTIPADDRESS_ROW</a> pointed to by the <i>Row</i> parameter. This error is also returned if no IPv6 stack is on the local computer and an IPv6 address is specified in the <b>Address</b> member. 
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/netioapi/nf-netioapi-getmulticastipaddressentry
     * @since windows6.0.6000
     */
    static GetMulticastIpAddressEntry(Row) {
        result := DllCall("IPHLPAPI.dll\GetMulticastIpAddressEntry", "ptr", Row, "uint")
        return result
    }

    /**
     * Retrieves the multicast IP address table on the local computer.
     * @remarks
     * The <b>GetMulticastIpAddressTable</b> function is defined on Windows Vista and later. 
     * 
     * The  
     * <b>GetMulticastIpAddressTable</b> function enumerates the multicast IP addresses on a local system and returns this information in a <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_multicastipaddress_table">MIB_MULTICASTIPADDRESS_TABLE</a> structure. 
     * 
     * The multicast IP address entries are returned in a <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_multicastipaddress_table">MIB_MULTICASTIPADDRESS_TABLE</a> structure in the buffer pointed to by the <i>Table</i> parameter. The <b>MIB_MULTICASTIPADDRESS_TABLE</b> structure contains a multicast IP address entry count and an array of <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_multicastipaddress_row">MIB_MULTICASTIPADDRESS_ROW</a> structures for each multicast IP address entry. When these returned structures are no longer required, free the memory by calling the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-freemibtable">FreeMibTable</a>.
     * 
     * The <i>Family</i> parameter must be initialized to either <b>AF_INET</b>,  <b>AF_INET6</b>, or <b>AF_UNSPEC</b>. 
     * 
     * Note that the returned <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_multicastipaddress_table">MIB_MULTICASTIPADDRESS_TABLE</a> structure pointed to by the <i>Table</i> parameter may contain padding for alignment between the <b>NumEntries</b> member and the first <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_multicastipaddress_row">MIB_MULTICASTIPADDRESS_ROW</a> array entry in the <b>Table</b> member of the <b>MIB_MULTICASTIPADDRESS_TABLE</b> structure. Padding for alignment may also be present between the <b>MIB_MULTICASTIPADDRESS_ROW</b> array entries. Any access to a <b>MIB_MULTICASTIPADDRESS_ROW</b> array entry should assume  padding may exist.
     * @param {Integer} Family The address family to retrieve. 
     * 
     * Possible values for the address family are listed in the <i>Winsock2.h</i> header file. Note that the values for the AF_ address family and PF_ protocol family constants  are identical (for example, <b>AF_INET</b> and <b>PF_INET</b>), so either constant can be used.
     * 
     * On the Windows SDK released for Windows Vista and later, the organization of header files has changed and possible values for this member are defined in the <i>Ws2def.h</i> header file. Note that the <i>Ws2def.h</i> header file is automatically included in <i>Winsock2.h</i>, and should never be used directly.
     * 
     * The values currently supported are <b>AF_INET</b>, <b>AF_INET6</b>, and <b>AF_UNSPEC</b>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AF_UNSPEC"></a><a id="af_unspec"></a><dl>
     * <dt><b>AF_UNSPEC</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The address family is unspecified. When this parameter is specified,  this function  returns the multicast IP address table containing both IPv4 and IPv6 entries. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AF_INET"></a><a id="af_inet"></a><dl>
     * <dt><b>AF_INET</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Internet Protocol version 4 (IPv4) address family. When this parameter is specified,  this function  returns the multicast IP address table containing only IPv4 entries. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AF_INET6"></a><a id="af_inet6"></a><dl>
     * <dt><b>AF_INET6</b></dt>
     * <dt>23</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Internet Protocol version 6 (IPv6) address family. When this parameter is specified,  this function  returns the multicast IP address table containing only IPv6 entries. 
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<MIB_MULTICASTIPADDRESS_TABLE>} Table A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_multicastipaddress_table">MIB_MULTICASTIPADDRESS_TABLE</a> structure that contains a table of anycast IP address entries on the local computer.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
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
     * An invalid parameter was passed to the function. This error is returned if a <b>NULL</b> pointer is passed in the <i>Table</i> parameter or the <i>Family</i> parameter was not specified as <b>AF_INET</b>, <b>AF_INET6</b>, or <b>AF_UNSPEC</b>.
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
     * Insufficient memory resources are available to complete the operation.
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
     * No anycast IP address entries as specified in the <i>Family</i> parameter were found. 
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
     * The request is not supported. This error is returned if no IPv4 stack is on the local computer and <b>AF_INET</b> was specified in the <b>Family</b> parameter. This error is also returned if no IPv6 stack is on the local computer and <b>AF_INET6</b> was specified in the <b>Family</b> parameter. This error is also returned on versions of Windows where this function is not supported.
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/netioapi/nf-netioapi-getmulticastipaddresstable
     * @since windows6.0.6000
     */
    static GetMulticastIpAddressTable(Family, Table) {
        result := DllCall("IPHLPAPI.dll\GetMulticastIpAddressTable", "ushort", Family, "ptr", Table, "uint")
        return result
    }

    /**
     * Creates a new IP route entry on the local computer.
     * @remarks
     * The <b>CreateIpForwardEntry2</b> function is defined on Windows Vista and later. 
     * 
     * The <b>CreateIpForwardEntry2</b> function is used to add a new neighbor IP address entry on a local computer. The <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-initializeipforwardentry">InitializeIpForwardEntry</a> function should be used to initialize the members of a
     *     <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipforward_row2">MIB_IPFORWARD_ROW2</a> structure entry with default values.  An application can then change the
     *     members in the <b>MIB_IPFORWARD_ROW2</b> entry it wishes to modify, and then call the <b>CreateIpForwardEntry2</b> function.
     * 
     * The <b>DestinationPrefix</b> member in the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipforward_row2">MIB_IPFORWARD_ROW2</a> structure pointed to by the <i>Row</i> parameter must be initialized to a valid IPv4 or IPv6 address prefix. The <b>NextHop</b> member in the <b>MIB_IPFORWARD_ROW2</b> structure pointed to by the <i>Row</i> parameter must be initialized to a valid IPv4 or IPv6 address and family. In addition, at least one of the following members in the <b>MIB_IPFORWARD_ROW2</b> structure pointed to the <i>Row</i> parameter must be initialized to the interface: the <b>InterfaceLuid</b> or <b>InterfaceIndex</b>.
     * 
     * The fields are used in the order listed above. So if the <b>InterfaceLuid</b> is specified, then this member is used to determine the interface on which to add the IP route entry. If no value was set for the  <b>InterfaceLuid</b> member (the values of this member was set to zero), then the <b>InterfaceIndex</b> member is next used to determine the interface. 
     * 
     * The route metric offset specified in the <b>Metric</b> member of the  <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipforward_row2">MIB_IPFORWARD_ROW2</a> structure pointed to by <i>Row</i> parameter represents only part of the complete route metric. The complete metric is a combination of this route metric  offset added to the interface metric specified in the <b>Metric</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipinterface_row">MIB_IPINTERFACE_ROW</a> structure of the associated interface.  An application can retrieve the interface metric by calling the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-getipinterfaceentry">GetIpInterfaceEntry</a> function.
     * 
     * The <b>Age</b> and <b>Origin</b> members of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipforward_row2">MIB_IPFORWARD_ROW2</a> structure pointed to by the <i>Row</i> are ignored when the  <b>CreateIpForwardEntry2</b> function is called. These members are set by the network stack and cannot be set using the <b>CreateIpForwardEntry2</b> function.
     * 
     * The <b>CreateIpForwardEntry2</b> function will fail if the <b>DestinationPrefix</b> and <b>NextHop</b> members of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipforward_row2">MIB_IPFORWARD_ROW2</a> pointed to by the <i>Row</i> parameter are a duplicate of an existing IP route entry on the interface specified in the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> members. 
     * 
     * The <b>CreateIpForwardEntry2</b> function can only be called by a user logged on as a member of the Administrators group. If <b>CreateIpForwardEntry2</b> is called by a user that is not a member of the Administrators group, the function call will fail and <b>ERROR_ACCESS_DENIED</b> is returned. This function can also fail because of user account control (UAC) on Windows Vista and later. If an application that contains this function is executed by a user logged on as a member of the Administrators group other than the built-in Administrator, this call will fail unless the application has been marked in the manifest file with a <b>requestedExecutionLevel</b> set to requireAdministrator. If the application lacks this manifest file, a user logged on as a member of the Administrators group other than the built-in Administrator must then be executing the application in an enhanced shell as the built-in Administrator (RunAs administrator) for this function to succeed.
     * @param {Pointer<MIB_IPFORWARD_ROW2>} Row A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipforward_row2">MIB_IPFORWARD_ROW2</a> structure entry for an IP route entry.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
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
     * Access is denied. This error is returned under several conditions that include the following: the  user lacks the required administrative privileges on the local computer or the application is not running in an enhanced shell as the built-in Administrator (RunAs administrator).  
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
     * An invalid parameter was passed to the function. This error is returned if a <b>NULL</b> pointer is passed in the <i>Row</i> parameter, the <b>DestinationPrefix</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipforward_row2">MIB_IPFORWARD_ROW2</a> pointed to by the <i>Row</i> parameter was not specified, the <b>NextHop</b> member of the <b>MIB_IPFORWARD_ROW2</b> pointed to by the <i>Row</i> parameter was not specified, or both the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> members of the <b>MIB_IPFORWARD_ROW2</b> pointed to by the <i>Row</i> parameter were unspecified. This error is also returned if the <b>PreferredLifetime</b> member specified in the <b>MIB_IPFORWARD_ROW2</b> is greater than the <b>ValidLifetime</b> member or if the <b>SitePrefixLength</b> in the <b>MIB_IPFORWARD_ROW2</b> is greater than the prefix length specified in the <b>DestinationPrefix</b>. 
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
     * The specified interface could not be found. This error is returned if the  network interface specified by the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipnet_row2">MIB_IPNET_ROW2</a> pointed to by the <i>Row</i> parameter could not be found.  
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
     * The request is not supported. This error is returned if the interface specified does not support routes. This error is also returned if no IPv4 stack is on the local computer and <b>AF_INET</b> was specified in the address family in the <b>DestinationPrefix</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipforward_row2">MIB_IPFORWARD_ROW2</a> pointed to by the <i>Row</i> parameter. This error is also returned if no IPv6 stack is on the local computer and <b>AF_INET6</b>  was specified for the address family in the <b>DestinationPrefix</b> member.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_OBJECT_ALREADY_EXISTS </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object already exists. This error is returned if the  <b>DestinationPrefix</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipforward_row2">MIB_IPFORWARD_ROW2</a> pointed to by the <i>Row</i> parameter is a duplicate of an existing IP route entry on the interface specified by the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> member of the <b>MIB_IPFORWARD_ROW2</b>.  
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/netioapi/nf-netioapi-createipforwardentry2
     * @since windows6.0.6000
     */
    static CreateIpForwardEntry2(Row) {
        result := DllCall("IPHLPAPI.dll\CreateIpForwardEntry2", "ptr", Row, "uint")
        return result
    }

    /**
     * Deletes an IP route entry on the local computer.
     * @remarks
     * The <b>DeleteIpForwardEntry2</b> function is defined on Windows Vista and later. 
     * 
     * The <b>DeleteIpForwardEntry2</b> function is used to delete a <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipforward_row2">MIB_IPFORWARD_ROW2</a> structure entry.  
     * 
     * On input, the <b>DestinationPrefix</b> member in the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipforward_row2">MIB_IPFORWARD_ROW2</a> structure pointed to by the <i>Row</i> parameter must be initialized to a valid IPv4 or IPv6 address prefix and family. On input, the <b>NextHop</b> member in the <b>MIB_IPFORWARD_ROW2</b> structure pointed to by the <i>Row</i> parameter must be initialized to a valid IPv4 or IPv6 address and family. In addition, at least one of the following members in the <b>MIB_IPFORWARD_ROW2</b> structure pointed to the <i>Row</i> parameter must be initialized: the <b>InterfaceLuid</b> or <b>InterfaceIndex</b>.
     * 
     * The fields are used in the order listed above. So if the <b>InterfaceLuid</b> is specified, then this member is used to determine the interface. If no value was set for the  <b>InterfaceLuid</b> member (the values of this member was set to zero), then the <b>InterfaceIndex</b> member is next used to determine the interface. 
     * 
     * On output when the call is successful, <b>DeleteIpForwardEntry2</b> deletes the IP route entry. 
     * 
     * The <b>DeleteIpForwardEntry2</b> function will fail if the <b>DestinationPrefix</b> and <b>NextHop</b> members of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipforward_row2">MIB_IPFORWARD_ROW2</a> pointed to by the <i>Row</i> parameter do not match an existing IP route entry on the interface specified in the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> members. 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-getipforwardtable2">GetIpForwardTable2</a> function can be called to enumerate the IP route entries on a local computer.
     * 
     * The <b>DeleteIpForwardEntry2</b> function can only be called by a user logged on as a member of the Administrators group. If <b>DeleteIpForwardEntry2</b> is called by a user that is not a member of the Administrators group, the function call will fail and <b>ERROR_ACCESS_DENIED</b> is returned. This function can also fail because of user account control (UAC) on Windows Vista and later. If an application that contains this function is executed by a user logged on as a member of the Administrators group other than the built-in Administrator, this call will fail unless the application has been marked in the manifest file with a <b>requestedExecutionLevel</b> set to requireAdministrator. If the application lacks this manifest file, a user logged on as a member of the Administrators group other than the built-in Administrator must then be executing the application in an enhanced shell as the built-in Administrator (RunAs administrator) for this function to succeed.
     * @param {Pointer<MIB_IPFORWARD_ROW2>} Row A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipforward_row2">MIB_IPFORWARD_ROW2</a> structure entry for an IP route entry. On successful return, this entry will be deleted.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
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
     * Access is denied. This error is returned under several conditions that include the following: the  user lacks the required administrative privileges on the local computer or the application is not running in an enhanced shell as the built-in Administrator (RunAs administrator).  
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
     * An invalid parameter was passed to the function. This error is returned if a <b>NULL</b> pointer is passed in the <i>Row</i> parameter, the <b>DestinationPrefix</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipforward_row2">MIB_IPFORWARD_ROW2</a> pointed to by the <i>Row</i> parameter was not specified, the <b>NextHop</b> member of the <b>MIB_IPFORWARD_ROW2</b> pointed to by the <i>Row</i> parameter was not specified, or both the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> members of the <b>MIB_IPFORWARD_ROW2</b> pointed to by the <i>Row</i> parameter were unspecified.
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
     * The specified interface could not be found. This error is returned if the  network interface specified by the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipforward_row2">MIB_IPFORWARD_ROW2</a> pointed to by the <i>Row</i> parameter could not be found.  
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
     * The request is not supported. This error is returned if no IPv4 stack is on the local computer and an IPv4 address was specified in the <b>Address</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipforward_row2">MIB_IPFORWARD_ROW2</a> pointed to by the <i>Row</i> parameter. This error is also returned if no IPv6 stack is on the local computer and an IPv6 address was specified in the <b>Address</b> member. 
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/netioapi/nf-netioapi-deleteipforwardentry2
     * @since windows6.0.6000
     */
    static DeleteIpForwardEntry2(Row) {
        result := DllCall("IPHLPAPI.dll\DeleteIpForwardEntry2", "ptr", Row, "uint")
        return result
    }

    /**
     * Retrieves the IP route entry on the local computer for the best route to the specified destination IP address.
     * @remarks
     * The <b>GetBestRoute2</b> function is defined on Windows Vista and later. 
     * 
     * The <b>GetBestRoute2</b> function is used to retrieve a <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipforward_row2">MIB_IPFORWARD_ROW2</a> structure entry for the best route from a source IP address to a destination IP address.  
     * 
     * On input, the <i>DestinationAddress</i> parameter must be initialized to a valid IPv4 or IPv6 address and family. On input, the <i>SourceAddress</i> parameter may be initialized to the preferred IPv4 or IPv6 address and family. In addition, at least one of the following parameters must be initialized: the <i>InterfaceLuid</i> or <i>InterfaceIndex</i>.
     * 
     * The parameters are used in the order listed above. So if the <i>InterfaceLuid</i> is specified, then this member is used to determine the interface. If no value was set for the  <i>InterfaceLuid</i> member (the values of this member was set to zero), then the <i>InterfaceIndex</i> member is next used to determine the interface. 
     * 
     * On output when the call is successful, <b>GetBestRoute2</b> retrieves and <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipforward_row2">MIB_IPFORWARD_ROW2</a> structure for the best route from the source IP address the destination IP address.
     * @param {Pointer<NET_LUID_LH>} InterfaceLuid The locally unique identifier (LUID) to specify the network interface associated with an IP route entry.
     * @param {Integer} InterfaceIndex The local index value to specify the network interface associated with an IP route entry. This index value may change when a network adapter is disabled and then enabled, or under other circumstances, and should not be considered persistent.
     * @param {Pointer<SOCKADDR_INET>} SourceAddress The source IP address. This parameter may be omitted and passed as a <b>NULL</b> pointer.
     * @param {Pointer<SOCKADDR_INET>} DestinationAddress The destination IP address.
     * @param {Integer} AddressSortOptions A set of options that affect how IP addresses are sorted. This parameter is not currently used.
     * @param {Pointer<MIB_IPFORWARD_ROW2>} BestRoute A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipforward_row2">MIB_IPFORWARD_ROW2</a> for the best route from the source IP address to the destination IP address.
     * @param {Pointer<SOCKADDR_INET>} BestSourceAddress A pointer to the best source IP address.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
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
     * An invalid parameter was passed to the function. This error is returned if a <b>NULL</b> pointer is passed in the <i>DestinationAddress</i>,  <i>BestSourceAddress</i>, or the <i>BestRoute</i> parameter. This error is also returned if the  <i>DestinationAddress</i> parameter does not specify an IPv4 or IPv6 address and family.
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
     * The specified interface could not be found. This error is returned if the  network interface specified by the <i>InterfaceLuid</i> or <i>InterfaceIndex</i> parameter could not be found.  
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
     * The request is not supported. This error is returned if no IPv4 stack is on the local computer and an IPv4 address and family  was specified in the <i>DestinationAddress</i>  parameter. This error is also returned if no IPv6 stack is on the local computer and an IPv6 address and family  was specified in the <i>DestinationAddress</i>  parameter. 
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/netioapi/nf-netioapi-getbestroute2
     * @since windows6.0.6000
     */
    static GetBestRoute2(InterfaceLuid, InterfaceIndex, SourceAddress, DestinationAddress, AddressSortOptions, BestRoute, BestSourceAddress) {
        result := DllCall("IPHLPAPI.dll\GetBestRoute2", "ptr", InterfaceLuid, "uint", InterfaceIndex, "ptr", SourceAddress, "ptr", DestinationAddress, "uint", AddressSortOptions, "ptr", BestRoute, "ptr", BestSourceAddress, "uint")
        return result
    }

    /**
     * Retrieves information for an IP route entry on the local computer.
     * @remarks
     * The <b>GetIpForwardEntry2</b> function is defined on Windows Vista and later. 
     * 
     * The <b>GetIpForwardEntry2</b> function is used to retrieve a <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipforward_row2">MIB_IPFORWARD_ROW2</a> structure entry.  
     * 
     * On input, the <b>DestinationPrefix</b> member in the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipforward_row2">MIB_IPFORWARD_ROW2</a> structure pointed to by the <i>Row</i> parameter must be initialized to a valid IPv4 or IPv6 address prefix and family. On input, the <b>NextHop</b> member in the <b>MIB_IPFORWARD_ROW2</b> structure pointed to by the <i>Row</i> parameter must be initialized to a valid IPv4 or IPv6 address and family. In addition, at least one of the following members in the <b>MIB_IPFORWARD_ROW2</b> structure pointed to the <i>Row</i> parameter must be initialized: the <b>InterfaceLuid</b> or <b>InterfaceIndex</b>.
     * 
     * The fields are used in the order listed above. So if the <b>InterfaceLuid</b> is specified, then this member is used to determine the interface. If no value was set for the  <b>InterfaceLuid</b> member (the values of this member was set to zero), then the <b>InterfaceIndex</b> member is next used to determine the interface. 
     * 
     * On output when the call is successful, <b>GetIpForwardEntry2</b> retrieves the other properties for the IP route entry and fills out the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipforward_row2">MIB_IPFORWARD_ROW2</a> structure pointed to by the <i>Row</i> parameter. 
     * 
     * The route metric offset specified in the <b>Metric</b> member of the  <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipforward_row2">MIB_IPFORWARD_ROW2</a> structure pointed to by <i>Row</i> parameter represents only part of the complete route metric. The complete metric is a combination of this route metric  added to the interface metric specified in the <b>Metric</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipinterface_row">MIB_IPINTERFACE_ROW</a> structure of the associated interface.  An application can retrieve the interface metric by calling the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-getipinterfaceentry">GetIpInterfaceEntry</a> function.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-getipforwardtable2">GetIpForwardTable2</a> function can be called to enumerate the IP route entries on a local computer.
     * @param {Pointer<MIB_IPFORWARD_ROW2>} Row A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipforward_row2">MIB_IPFORWARD_ROW2</a> structure entry for an IP route entry. On successful return, this structure will be updated with the properties for the IP route entry.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
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
     * An invalid parameter was passed to the function. This error is returned if a <b>NULL</b> pointer is passed in the <i>Row</i> parameter, the <b>DestinationPrefix</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipforward_row2">MIB_IPFORWARD_ROW2</a> pointed to by the <i>Row</i> parameter was not specified, the <b>NextHop</b> member of the <b>MIB_IPFORWARD_ROW2</b> pointed to by the <i>Row</i> parameter was not specified, or both the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> members of the <b>MIB_IPFORWARD_ROW2</b> pointed to by the <i>Row</i> parameter were unspecified.
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
     * Element not found. This error is returned if the  network interface specified by the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipforward_row2">MIB_IPFORWARD_ROW2</a> structure pointed to by the <i>Row</i> parameter does not match the IP address prefix and address family specified in the <b>DestinationPrefix</b>  member in the <b>MIB_IPFORWARD_ROW2</b> structure.
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
     * The request is not supported. This error is returned if no IPv4 stack is on the local computer and <b>AF_INET</b> was specified in the address family in the <b>DestinationPrefix</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipforward_row2">MIB_IPFORWARD_ROW2</a> pointed to by the <i>Row</i> parameter. This error is also returned if no IPv6 stack is on the local computer and <b>AF_INET6</b>  was specified for the address family in the <b>DestinationPrefix</b> member.
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/netioapi/nf-netioapi-getipforwardentry2
     * @since windows6.0.6000
     */
    static GetIpForwardEntry2(Row) {
        result := DllCall("IPHLPAPI.dll\GetIpForwardEntry2", "ptr", Row, "uint")
        return result
    }

    /**
     * The GetIpForwardTable2 function retrieves the IP route entries on the local computer.
     * @remarks
     * The <b>GetIpForwardTable2</b> function is defined on Windows Vista and later. 
     * 
     * The  
     * <b>GetIpForwardTable2</b> function enumerates the IP route entries on a local system and returns this information in a <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipforward_table2">MIB_IPFORWARD_TABLE2</a> structure. 
     * 
     * The IP route entries are returned in a <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipforward_table2">MIB_IPFORWARD_TABLE2</a> structure in the buffer pointed to by the <i>Table</i> parameter. The <b>MIB_IPFORWARD_TABLE2</b> structure contains an IP route entry count and an array of <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipforward_row2">MIB_IPFORWARD_ROW2</a> structures for each IP route entry. When these returned structures are no longer required, free the memory by calling the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-freemibtable">FreeMibTable</a>.
     * 
     * The <i>Family</i> parameter must be initialized to either <b>AF_INET</b>,  <b>AF_INET6</b>, or <b>AF_UNSPEC</b>. 
     * 
     * Note that the returned <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipforward_table2">MIB_IPFORWARD_TABLE2</a> structure pointed to by the <i>Table</i> parameter may contain padding for alignment between the <b>NumEntries</b> member and the first <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipforward_row2">MIB_IPFORWARD_ROW2</a> array entry in the <b>Table</b> member of the <b>MIB_IPFORWARD_TABLE2</b> structure. Padding for alignment may also be present between the <b>MIB_IPFORWARD_ROW2</b> array entries. Any access to a <b>MIB_IPFORWARD_ROW2</b> array entry should assume  padding may exist.
     * @param {Integer} Family The address family to retrieve. 
     * 
     * Possible values for the address family are listed in the <i>Winsock2.h</i> header file. Note that the values for the AF_ address family and PF_ protocol family constants  are identical (for example, <b>AF_INET</b> and <b>PF_INET</b>), so either constant can be used.
     * 
     * On the Windows SDK released for Windows Vista and later, the organization of header files has changed and possible values for this member are defined in the <i>Ws2def.h</i> header file. Note that the <i>Ws2def.h</i> header file is automatically included in <i>Winsock2.h</i>, and should never be used directly.
     * 
     * The values currently supported are <b>AF_INET</b>, <b>AF_INET6</b>, and <b>AF_UNSPEC</b>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AF_UNSPEC"></a><a id="af_unspec"></a><dl>
     * <dt><b>AF_UNSPEC</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The address family is unspecified. When this parameter is specified,  this function  returns the IP routing table containing both IPv4 and IPv6 entries. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AF_INET"></a><a id="af_inet"></a><dl>
     * <dt><b>AF_INET</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Internet Protocol version 4 (IPv4) address family. When this parameter is specified,  this function  returns the IP routing table containing only  IPv4 entries. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AF_INET6"></a><a id="af_inet6"></a><dl>
     * <dt><b>AF_INET6</b></dt>
     * <dt>23</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Internet Protocol version 6 (IPv6) address family. When this parameter is specified,  this function  returns the IP routing table containing only IPv6 entries. 
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<MIB_IPFORWARD_TABLE2>} Table A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipforward_table2">MIB_IPFORWARD_TABLE2</a> structure that contains a table of IP route entries on the local computer.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
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
     * An invalid parameter was passed to the function. This error is returned if a <b>NULL</b> pointer is passed in the <i>Table</i> parameter or the <i>Family</i> parameter was not specified as <b>AF_INET</b>, <b>AF_INET6</b>, or <b>AF_UNSPEC</b>.
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
     * Insufficient memory resources are available to complete the operation.
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
     * No IP route entries as specified in the <i>Family</i> parameter were found. 
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
     * The request is not supported. This error is returned if no IPv4 stack is on the local computer and <b>AF_INET</b> was specified in the <b>Family</b> parameter. This error is also returned if no IPv6 stack is on the local computer and <b>AF_INET6</b> was specified in the <b>Family</b> parameter. This error is also returned on versions of Windows where this function is not supported.
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/netioapi/nf-netioapi-getipforwardtable2
     * @since windows6.0.6000
     */
    static GetIpForwardTable2(Family, Table) {
        result := DllCall("IPHLPAPI.dll\GetIpForwardTable2", "ushort", Family, "ptr", Table, "uint")
        return result
    }

    /**
     * Initializes a MIB_IPFORWARD_ROW2 structure with default values for an IP route entry on the local computer.
     * @remarks
     * The <b>InitializeIpForwardEntry</b> function is defined on Windows Vista and later. 
     * 
     * The <b>InitializeIpForwardEntry</b> function must be used to initialize the members of a
     *     <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipforward_row2">MIB_IPFORWARD_ROW2</a> structure entry with default values for an IP route entry for later use with the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-createipforwardentry2">CreateIpForwardEntry2</a> function.  
     * 
     * On input, <b>InitializeIpForwardEntry</b> must be passed a new <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipforward_row2">MIB_IPFORWARD_ROW2</a> structure to initialize. 
     * 
     * On output, the <b>ValidLifetime</b> and <b>PreferredLifetime</b> members of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipforward_row2">MIB_IPFORWARD_ROW2</a> structure pointed to by <i>Row</i> parameter will be initialized to infinite and the <b>Loopback</b>,  <b>AutoconfigureAddress</b>, <b>Publish</b>, and <b>Immortal</b> members  will be initialized to <b>TRUE</b>. In addition, the <b>SitePrefixLength</b>,   <b>Metric</b>, and  <b>Protocol</b> members are set to an illegal value and other fields are initialized to zero. 
     * 
     * After calling <b>InitializeIpForwardEntry</b>, an application can then change the
     *     members in the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipforward_row2">MIB_IPFORWARD_ROW2</a> entry it wishes to modify, and then call the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-createipforwardentry2">CreateIpForwardEntry2</a>  to add the new IP route entry to the local computer.
     * @param {Pointer<MIB_IPFORWARD_ROW2>} Row On entry, a pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipforward_row2">MIB_IPFORWARD_ROW2</a> structure entry for an IP route entry. On return, the  <b>MIB_IPFORWARD_ROW2</b> structure pointed to by this parameter is initialized with default values for an IP route entry.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/netioapi/nf-netioapi-initializeipforwardentry
     * @since windows6.0.6000
     */
    static InitializeIpForwardEntry(Row) {
        DllCall("IPHLPAPI.dll\InitializeIpForwardEntry", "ptr", Row)
    }

    /**
     * Registers to be notified for changes to IP route entries on a local computer.
     * @remarks
     * The <b>NotifyRouteChange2</b> function is defined on Windows Vista and later. 
     * 
     * The <i>Family</i> parameter must be set to either <b>AF_INET</b>, <b>AF_INET6</b>, or <b>AF_UNSPEC</b>. 
     * 
     * The invocation of the callback function specified in the <i>Callback</i> parameter is serialized. The callback function should be defined as a function of type <b>VOID</b>. The parameters passed to the callback function include the following:
     * 
     * <table>
     * <tr>
     * <th>Parameter</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <a id="IN_PVOID_CallerContext"></a><a id="in_pvoid_callercontext"></a><a id="IN_PVOID_CALLERCONTEXT"></a>IN PVOID CallerContext
     * 
     * </td>
     * <td width="60%">
     * The <i>CallerContext</i> parameter passed to the <b>NotifyRouteChange2</b> function when registering for notifications.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <a id="IN_PMIB_IPFORWARD_ROW2_Row_OPTIONAL"></a><a id="in_pmib_ipforward_row2_row_optional"></a><a id="IN_PMIB_IPFORWARD_ROW2_ROW_OPTIONAL"></a>IN PMIB_IPFORWARD_ROW2 Row OPTIONAL
     * 
     * </td>
     * <td width="60%">
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipforward_row2">MIB_IPFORWARD_ROW2</a> entry for the  IP route entry that was changed. This parameter is a <b>NULL</b> pointer when the <b>MIB_NOTIFICATION_TYPE</b> value passed in the <i>NotificationType</i> parameter to the callback function is set to <b>MibInitialNotification</b>. This can only occur if the <i>InitialNotification</i> parameter passed to <b>NotifyRouteChange2</b> was set to <b>TRUE</b> when registering for notifications.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <a id="IN_MIB_NOTIFICATION_TYPE_NotificationType"></a><a id="in_mib_notification_type_notificationtype"></a><a id="IN_MIB_NOTIFICATION_TYPE_NOTIFICATIONTYPE"></a>IN MIB_NOTIFICATION_TYPE NotificationType
     * 
     * </td>
     * <td width="60%">
     * The notification type. This member can be one of the values from the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ne-netioapi-mib_notification_type">MIB_NOTIFICATION_TYPE</a> enumeration type defined in the <i>Netioapi.h</i> header file.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * 
     * The callback function specified in the <i>Callback</i> parameter must be implemented in the same process as the application calling the <b>NotifyRouteChange2</b> function. If the callback function is in a separate DLL, then the DLL should be loaded before calling the <b>NotifyRouteChange2</b> function to register for change notifications. 
     * 
     * When the callback function is received when a change occurs and the <i>Row</i> parameter is not <b>NULL</b>, the pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipforward_row2">MIB_IPFORWARD_ROW2</a> structure passed in the <i>Row</i> parameter contains incomplete data. The  information returned in the <b>MIB_IPFORWARD_ROW2</b> structure is only enough information that an application can call the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-getipforwardentry2">GetIpForwardEntry2</a>  function to query complete information on the IP route that changed. When the callback function is received, an application should allocate a <b>MIB_IPFORWARD_ROW2</b> structure and initialize it with the <b>DestinationPrefix</b>,  <b>NextHop</b>,  <b>InterfaceLuid</b> and <b>InterfaceIndex</b> members in the <b>MIB_IPFORWARD_ROW2</b> structure pointed to by the <i>Row</i> parameter received. A pointer to this newly initialized <b>MIB_IPFORWARD_ROW2</b> structure should be passed to the <b>GetIpForwardEntry2</b> function to retrieve complete information on the IP route that was changed. 
     * 
     * The memory pointed to by the <i>Row</i> parameter used in the callback indications is managed by the operating system.  An application that receives a notification should never attempt to free the memory pointed to by the <i>Row</i> parameter. 
     * 
     * Once the <b>NotifyRouteChange2</b> function is called to register for change notifications, these notifications will continue to be sent until the application deregisters for change notifications or the application terminates. If the application terminates, the system will automatically deregister any registration for change notifications. It is still recommended that an application explicitly deregister for change notifications before it terminates.  
     * 
     * Any registration for change notifications does not persist if the system is shutdown or rebooted. 
     * 
     * To deregister for change notifications, call the  <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-cancelmibchangenotify2">CancelMibChangeNotify2</a> function passing the <i>NotificationHandle</i> parameter returned by  <b>NotifyRouteChange2</b>. 
     * 
     * An application cannot make a call to the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-cancelmibchangenotify2">CancelMibChangeNotify2</a> function from the context of the thread which is currently executing the notification callback function for the same <i>NotificationHandle</i> parameter. Otherwise, the thread executing that callback will result in deadlock. So the <b>CancelMibChangeNotify2</b> function must not be called directly as part of the notification callback routine. In a more general situation, a thread that executes the <b>CancelMibChangeNotify2</b> function cannot own a resource on which the thread that executes a notification callback operation would wait because it would result in a similar deadlock. The <b>CancelMibChangeNotify2</b> function should be called from a different thread, on which the thread that receives the notification callback doesn’t have dependencies on.
     * @param {Integer} AddressFamily The address family on which to register for change notifications. 
     * 
     * Possible values for the address family are listed in the <i>Winsock2.h</i> header file. Note that the values for the AF_ address family and PF_ protocol family constants  are identical (for example, <b>AF_INET</b> and <b>PF_INET</b>), so either constant can be used.
     * 
     * On the Windows SDK released for Windows Vista and later, the organization of header files has changed and possible values for this member are defined in the <i>Ws2def.h</i> header file. Note that the <i>Ws2def.h</i> header file is automatically included in <i>Winsock2.h</i>, and should never be used directly.
     * 
     * The values currently supported are <b>AF_INET</b>, <b>AF_INET6</b>, and <b>AF_UNSPEC</b>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AF_INET"></a><a id="af_inet"></a><dl>
     * <dt><b>AF_INET</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  Register for only IPv4 route  change notifications.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AF_INET6"></a><a id="af_inet6"></a><dl>
     * <dt><b>AF_INET6</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  Register for only IPv6 route  change notifications.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AF_UNSPEC"></a><a id="af_unspec"></a><dl>
     * <dt><b>AF_UNSPEC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  Register for both IPv4 and IPv6 route change notifications.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<PIPFORWARD_CHANGE_CALLBACK>} Callback A pointer to the function to call when a change occurs. This function will be invoked
     *         when an IP route notification is received.
     * @param {Pointer<Void>} CallerContext A user context passed to the callback function specified in the <i>Callback</i> parameter when an IP route notification is received.
     * @param {Integer} InitialNotification A value that indicates whether the callback should be invoked
     *         immediately after registration for change notification completes. This initial notification does not indicate a change occurred to an IP route entry. The purpose of this parameter to provide confirmation that the callback is registered.
     * @param {Pointer<HANDLE>} NotificationHandle A pointer used to return a handle that can be later used to
     *         deregister the change notification. On success, a notification handle is returned in this parameter. If an error occurs, <b>NULL</b> is returned.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
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
     * An internal error occurred where an invalid handle was encountered. 
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
     * An invalid parameter was passed to the function. This error is returned if the <i>Family</i> parameter was not either <b>AF_INET</b>, <b>AF_INET6</b>, or <b>AF_UNSPEC</b>.
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
     * There was insufficient memory.
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/netioapi/nf-netioapi-notifyroutechange2
     * @since windows6.0.6000
     */
    static NotifyRouteChange2(AddressFamily, Callback, CallerContext, InitialNotification, NotificationHandle) {
        result := DllCall("IPHLPAPI.dll\NotifyRouteChange2", "ushort", AddressFamily, "ptr", Callback, "ptr", CallerContext, "char", InitialNotification, "ptr", NotificationHandle, "uint")
        return result
    }

    /**
     * Sets the properties of an IP route entry on the local computer.
     * @remarks
     * The <b>SetIpForwardEntry2</b> function is defined on Windows Vista and later. 
     * 
     * The <b>SetIpForwardEntry2</b> function is used to set the properties for an existing IP route entry on a local computer. 
     * 
     * The <b>DestinationPrefix</b> member in the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipforward_row2">MIB_IPFORWARD_ROW2</a> structure pointed to by the <i>Route</i> parameter must be initialized to a valid IP address prefix and family. The <b>NextHop</b> member in the <b>MIB_IPFORWARD_ROW2</b> structure pointed to by the <i>Route</i> parameter must be initialized to a valid IP address and family. In addition, at least one of the following members in the <b>MIB_IPFORWARD_ROW2</b> structure pointed to the <i>Route</i> parameter must be initialized to the interface: the <b>InterfaceLuid</b> or <b>InterfaceIndex</b>.
     * 
     * The fields are used in the order listed above. So if the <b>InterfaceLuid</b> is specified, then this member is used to determine the interface on which to add the unicast IP address. If no value was set for the  <b>InterfaceLuid</b> member (the values of this member was set to zero), then the <b>InterfaceIndex</b> member is next used to determine the interface. 
     * 
     * The route metric offset specified in the <b>Metric</b> member of the  <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipforward_row2">MIB_IPFORWARD_ROW2</a> structure pointed to by <i>Route</i> parameter represents only part of the complete route metric. The complete metric is a combination of this route metric  offset added to the interface metric specified in the <b>Metric</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipinterface_row">MIB_IPINTERFACE_ROW</a> structure of the associated interface.  An application can retrieve the interface metric by calling the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-getipinterfaceentry">GetIpInterfaceEntry</a> function.
     * 
     * The <b>Age</b> and <b>Origin</b> members of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipforward_row2">MIB_IPFORWARD_ROW2</a> structure pointed to by the <i>Row</i> are ignored when the  <b>SetIpForwardEntry2</b> function is called. These members are set by the network stack and cannot be changed using the <b>SetIpForwardEntry2</b> function.
     * 
     * The <b>SetIpForwardEntry2</b> function will fail if the  <b>DestinationPrefix</b> and <b>NextHop</b> members of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipforward_row2">MIB_IPFORWARD_ROW2</a> pointed to by the <i>Route</i> parameter do not match an IP route entry on the interface specified. 
     * 
     * The <b>SetIpForwardEntry2</b> function can only be called by a user logged on as a member of the Administrators group. If <b>SetIpForwardEntry2</b> is called by a user that is not a member of the Administrators group, the function call will fail and <b>ERROR_ACCESS_DENIED</b> is returned. 
     * 
     * The <b>SetIpForwardEntry2</b> function can also fail because of user account control (UAC) on Windows Vista and later. If an application that contains this function is executed by a user logged on as a member of the Administrators group other than the built-in Administrator, this call will fail unless the application has been marked in the manifest file with a <b>requestedExecutionLevel</b> set to requireAdministrator. If the application lacks this manifest file, a user logged on as a member of the Administrators group other than the built-in Administrator must then be executing the application in an enhanced shell as the built-in Administrator (RunAs administrator) for this function to succeed.
     * @param {Pointer<MIB_IPFORWARD_ROW2>} Route A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipforward_row2">MIB_IPFORWARD_ROW2</a> structure entry for an IP route entry. The <b>DestinationPrefix</b> member of the <b>MIB_IPFORWARD_ROW2</b> must be set to a valid IP destination prefix, the <b>NextHop</b> member of the <b>MIB_IPFORWARD_ROW2</b> must be set to a valid IP address family and IP address,   and the <b>InterfaceLuid</b> or the  <b>InterfaceIndex</b> member of the <b>MIB_IPFORWARD_ROW2</b> must be specified.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
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
     * Access is denied. This error is returned under several conditions that include the following: the  user lacks the required administrative privileges on the local computer or the application is not running in an enhanced shell as the built-in Administrator (RunAs administrator).  
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
     * An invalid parameter was passed to the function. This error is returned if a <b>NULL</b> pointer is passed in the <i>Route</i> parameter, the <b>DestinationPrefix</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipforward_row2">MIB_IPFORWARD_ROW2</a> pointed to by the <i>Route</i> parameter was not specified, the <b>NextHop</b> member of the <b>MIB_IPFORWARD_ROW2</b> pointed to by the <i>Route</i> parameter was not specified, or both the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> members of the <b>MIB_IPFORWARD_ROW2</b> pointed to by the <i>Route</i> parameter were unspecified.
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
     * The specified interface could not be found. This error is returned if the  network interface specified by the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipforward_row2">MIB_IPFORWARD_ROW2</a> pointed to by the <i>Route</i> parameter could not be found.  
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/netioapi/nf-netioapi-setipforwardentry2
     * @since windows6.0.6000
     */
    static SetIpForwardEntry2(Route) {
        result := DllCall("IPHLPAPI.dll\SetIpForwardEntry2", "ptr", Route, "uint")
        return result
    }

    /**
     * The FlushIpPathTable function flushes the IP path table on the local computer.
     * @remarks
     * The <b>FlushIpPathTable</b> function is defined on Windows Vista and later. 
     * 
     * The  
     * <b>FlushIpPathTable</b> function flushes or deletes the IP path entries on a local system.  The <i>Family</i> parameter can be used to limit the IP path entries to delete to a particular IP address family. If IP path entries for both IPv4 and IPv6 should be deleted, set the  <i>Family</i> parameter to <b>AF_UNSPEC</b>. 
     * 
     * The <i>Family</i> parameter must be initialized to either <b>AF_INET</b>,  <b>AF_INET6</b>, or <b>AF_UNSPEC</b>. 
     * 
     * The <b>FlushIpPathTable</b> function can only be called by a user logged on as a member of the Administrators group. If <b>FlushIpPathTable</b> is called by a user that is not a member of the Administrators group, the function call will fail and <b>ERROR_ACCESS_DENIED</b> is returned. This function can also fail because of user account control (UAC) on Windows Vista and later. If an application that contains this function is executed by a user logged on as a member of the Administrators group other than the built-in Administrator, this call will fail unless the application has been marked in the manifest file with a <b>requestedExecutionLevel</b> set to requireAdministrator. If the application lacks this manifest file, a user logged on as a member of the Administrators group other than the built-in Administrator must then be executing the application in an enhanced shell as the built-in Administrator (RunAs administrator) for this function to succeed.
     * @param {Integer} Family The address family to flush. 
     * 
     * Possible values for the address family are listed in the <i>Winsock2.h</i> header file. Note that the values for the AF_ address family and PF_ protocol family constants  are identical (for example, <b>AF_INET</b> and <b>PF_INET</b>), so either constant can be used.
     * 
     * On the Windows SDK released for Windows Vista and later, the organization of header files has changed and possible values for this member are defined in the <i>Ws2def.h</i> header file. Note that the <i>Ws2def.h</i> header file is automatically included in <i>Winsock2.h</i>, and should never be used directly.
     * 
     * The values currently supported are <b>AF_INET</b>, <b>AF_INET6</b>, and <b>AF_UNSPEC</b>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AF_UNSPEC"></a><a id="af_unspec"></a><dl>
     * <dt><b>AF_UNSPEC</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The address family is unspecified. When this parameter is specified,  this function  flushes the IP path table containing both IPv4 and IPv6 entries. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AF_INET"></a><a id="af_inet"></a><dl>
     * <dt><b>AF_INET</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Internet Protocol version 4 (IPv4) address family. When this parameter is specified,  this function  flushes the IP path table containing only  IPv4 entries. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AF_INET6"></a><a id="af_inet6"></a><dl>
     * <dt><b>AF_INET6</b></dt>
     * <dt>23</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Internet Protocol version 6 (IPv6) address family. When this parameter is specified,  this function  flushes the IP path table containing only IPv6 entries. 
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
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
     * Access is denied. This error is returned under several conditions that include the following: the  user lacks the required administrative privileges on the local computer or the application is not running in an enhanced shell as the built-in Administrator (RunAs administrator).  
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
     * An invalid parameter was passed to the function. This error is returned if the <i>Family</i> parameter was not specified as <b>AF_INET</b>, <b>AF_INET6</b>, or <b>AF_UNSPEC</b>.
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
     * The request is not supported. This error is returned if no IPv4 stack is on the local computer and <b>AF_INET</b> was specified in the <b>Family</b> parameter. This error is also returned if no IPv6 stack is on the local computer and <b>AF_INET6</b> was specified in the <b>Family</b> parameter. This error is also returned on versions of Windows where this function is not supported.
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/netioapi/nf-netioapi-flushippathtable
     * @since windows6.0.6000
     */
    static FlushIpPathTable(Family) {
        result := DllCall("IPHLPAPI.dll\FlushIpPathTable", "ushort", Family, "uint")
        return result
    }

    /**
     * Retrieves information for a IP path entry on the local computer.
     * @remarks
     * The <b>GetIpPathEntry</b> function is defined on Windows Vista and later. 
     * 
     * The <b>GetIpPathEntry</b> function is used to retrieve a <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ippath_row">MIB_IPPATH_ROW</a> structure entry.  
     * 
     * On input, the <b>Destination</b> member in the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ippath_row">MIB_IPPATH_ROW</a> structure pointed to by the <i>Row</i> parameter must be initialized to a valid IPv4 or IPv6 address and family. The address family specified in <b>Source</b> member in the <b>MIB_IPPATH_ROW</b> structure must also either match the destination IP address family specified in the <b>Destination</b> member or the address family in the <b>Source</b> member must be specified as <b>AF_UNSPEC</b>. In addition , at least one of the following members in the <b>MIB_IPPATH_ROW</b> structure pointed to the <i>Row</i> parameter must be initialized: the <b>InterfaceLuid</b> or <b>InterfaceIndex</b>.
     * 
     * The fields are used in the order listed above. So if the <b>InterfaceLuid</b> is specified, then this member is used to determine the interface. If no value is set for the  <b>InterfaceLuid</b> member (the values of this member is set to zero), then the <b>InterfaceIndex</b> member is next used to determine the interface. 
     * 
     * On output when the call is successful, <b>GetIpPathEntry</b> retrieves the other properties for the IP path entry and fills out the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ippath_row">MIB_IPPATH_ROW</a> structure pointed to by the <i>Row</i> parameter. 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-getippathtable">GetIpPathTable</a> function can be called to enumerate the IP path entries on a local computer.
     * @param {Pointer<MIB_IPPATH_ROW>} Row A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ippath_row">MIB_IPPATH_ROW</a> structure entry for a IP path entry. On successful return, this structure will be updated with the properties for IP path entry.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
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
     * The system cannot find the file specified. This error is returned if the  network interface LUID or interface index specified by the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ippath_row">MIB_IPPATH_ROW</a> pointed to by the <i>Row</i> parameter is not a value on the local machine.
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
     * A parameter is incorrect. This error is returned if a <b>NULL</b> pointer is passed in the <i>Row</i> parameter, the <b>si_family</b> member in the <b>Destination</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ippath_row">MIB_IPPATH_ROW</a> pointed to by the <i>Row</i> parameter is not set to <b>AF_INET</b> or <b>AF_INET6</b>, or both the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> members of the <b>MIB_IPPATH_ROW</b> pointed to by the <i>Row</i> parameter are unspecified. This error is also returned if the <b>si_family</b> member in the <b>Source</b> member of the <b>MIB_IPPATH_ROW</b> pointed to by the <i>Row</i> parameter did not match the destination IP address family and the <b>si_family</b> for the source IP address is not specified as <b>AF_UNSPEC</b>.
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
     * Element not found. This error is returned if the  network interface specified by the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ippath_row">MIB_IPPATH_ROW</a> structure pointed to by the <i>Row</i> parameter does not match the IP address and address family specified in the <b>Destination</b> member in the <b>MIB_IPPATH_ROW</b> structure.
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
     * The request is not supported. This error is returned if no IPv4 stack is on the local computer and an IPv4 address is specified in the <b>Source</b> and <b>Destination</b> members of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ippath_row">MIB_IPPATH_ROW</a> pointed to by the <i>Row</i> parameter. This error is also returned if no IPv6 stack is on the local computer and an IPv6 address is specified in the <b>Source</b> and <b>Destination</b> members. 
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/netioapi/nf-netioapi-getippathentry
     * @since windows6.0.6000
     */
    static GetIpPathEntry(Row) {
        result := DllCall("IPHLPAPI.dll\GetIpPathEntry", "ptr", Row, "uint")
        return result
    }

    /**
     * The GetIpPathTable function retrieves the IP path table on the local computer.
     * @remarks
     * The <b>GetIpPathTable</b> function is defined on Windows Vista and later. 
     * 
     * The  
     * <b>GetIpPathTable</b> function enumerates the IP path entries on a local system and returns this information in a <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ippath_table">MIB_IPPATH_TABLE</a> structure. 
     * 
     * The IP path entries are returned in a <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ippath_table">MIB_IPPATH_TABLE</a> structure in the buffer pointed to by the <i>Table</i> parameter. The <b>MIB_IPPATH_TABLE</b> structure contains an IP path entry count and an array of <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ippath_row">MIB_IPPATH_ROW</a> structures for each IP path entry. When these returned structures are no longer required, free the memory by calling the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-freemibtable">FreeMibTable</a>.
     * 
     * The <i>Family</i> parameter must be initialized to either <b>AF_INET</b>,  <b>AF_INET6</b>, or <b>AF_UNSPEC</b>. 
     * 
     * Note that the returned <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ippath_table">MIB_IPPATH_TABLE</a> structure pointed to by the <i>Table</i> parameter may contain padding for alignment between the <b>NumEntries</b> member and the first <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ippath_row">MIB_IPPATH_ROW</a> array entry in the <b>Table</b> member of the <b>MIB_IPPATH_TABLE</b> structure. Padding for alignment may also be present between the <b>MIB_IPPATH_ROW</b> array entries. Any access to a <b>MIB_IPPATH_ROW</b> array entry should assume  padding may exist.
     * @param {Integer} Family The address family to retrieve. 
     * 
     * Possible values for the address family are listed in the <i>Winsock2.h</i> header file. Note that the values for the AF_ address family and PF_ protocol family constants  are identical (for example, <b>AF_INET</b> and <b>PF_INET</b>), so either constant can be used.
     * 
     * On the Windows SDK released for Windows Vista and later, the organization of header files has changed and possible values for this member are defined in the <i>Ws2def.h</i> header file. Note that the <i>Ws2def.h</i> header file is automatically included in <i>Winsock2.h</i>, and should never be used directly.
     * 
     * The values currently supported are <b>AF_INET</b>, <b>AF_INET6</b>, and <b>AF_UNSPEC</b>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AF_UNSPEC"></a><a id="af_unspec"></a><dl>
     * <dt><b>AF_UNSPEC</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The address family is unspecified. When this parameter is specified,  this function  returns the IP path table containing both IPv4 and IPv6 entries. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AF_INET"></a><a id="af_inet"></a><dl>
     * <dt><b>AF_INET</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Internet Protocol version 4 (IPv4) address family. When this parameter is specified,  this function  returns the IP path table containing only  IPv4 entries. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AF_INET6"></a><a id="af_inet6"></a><dl>
     * <dt><b>AF_INET6</b></dt>
     * <dt>23</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Internet Protocol version 6 (IPv6) address family. When this parameter is specified,  this function  returns the IP path table containing only IPv6 entries. 
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<MIB_IPPATH_TABLE>} Table A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ippath_table">MIB_IPPATH_TABLE</a> structure that contains a table of IP path entries on the local computer.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
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
     * An invalid parameter was passed to the function. This error is returned if a <b>NULL</b> pointer is passed in the <i>Table</i> parameter or the <i>Family</i> parameter was not specified as <b>AF_INET</b>, <b>AF_INET6</b>, or <b>AF_UNSPEC</b>.
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
     * Insufficient memory resources are available to complete the operation.
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
     * No IP path entries as specified in the <i>Family</i> parameter were found. 
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
     * The request is not supported. This error is returned if no IPv4 stack is on the local computer and <b>AF_INET</b> was specified in the <b>Family</b> parameter. This error is also returned if no IPv6 stack is on the local computer and <b>AF_INET6</b> was specified in the <b>Family</b> parameter. This error is also returned on versions of Windows where this function is not supported.
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/netioapi/nf-netioapi-getippathtable
     * @since windows6.0.6000
     */
    static GetIpPathTable(Family, Table) {
        result := DllCall("IPHLPAPI.dll\GetIpPathTable", "ushort", Family, "ptr", Table, "uint")
        return result
    }

    /**
     * Creates a new neighbor IP address entry on the local computer.
     * @remarks
     * The <b>CreateIpNetEntry2</b> function is defined on Windows Vista and later. 
     * 
     * The <b>CreateIpNetEntry2</b> function is used to add a new neighbor IP address entry on a local computer. 
     * 
     * The <b>Address</b> member in the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipnet_row2">MIB_IPNET_ROW2</a> structure pointed to by the <i>Row</i> parameter must be initialized to a valid unicast, anycast, or multicast IPv4 or IPv6 address and family. The  <b>PhysicalAddress</b> and <b>PhysicalAddressLength</b> members in the <b>MIB_IPNET_ROW2</b> structure pointed to by the <i>Row</i> parameter must be initialized to a valid physical address. In addition, at least one of the following members in the <b>MIB_IPNET_ROW2</b> structure pointed to the <i>Row</i> parameter must be initialized to the interface: the <b>InterfaceLuid</b> or <b>InterfaceIndex</b>.
     * 
     * The fields are used in the order listed above. So if the <b>InterfaceLuid</b> is specified, then this member is used to determine the interface on which to add the unicast IP address. If no value was set for the  <b>InterfaceLuid</b> member (the values of this member was set to zero), then the <b>InterfaceIndex</b> member is next used to determine the interface. 
     * 
     * The <b>CreateIpNetEntry2</b> function will fail if the IP address passed in the <b>Address</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipnet_row2">MIB_IPNET_ROW2</a> pointed to by the <i>Row</i> parameter is a duplicate of an existing neighbor IP address on the interface. 
     * 
     * The <b>CreateIpNetEntry2</b> function can only be called by a user logged on as a member of the Administrators group. If <b>CreateIpNetEntry2</b> is called by a user that is not a member of the Administrators group, the function call will fail and <b>ERROR_ACCESS_DENIED</b> is returned. This function can also fail because of user account control (UAC) on Windows Vista and later. If an application that contains this function is executed by a user logged on as a member of the Administrators group other than the built-in Administrator, this call will fail unless the application has been marked in the manifest file with a <b>requestedExecutionLevel</b> set to requireAdministrator. If the application lacks this manifest file, a user logged on as a member of the Administrators group other than the built-in Administrator must then be executing the application in an enhanced shell as the built-in Administrator (RunAs administrator) for this function to succeed.
     * @param {Pointer<MIB_IPNET_ROW2>} Row A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipnet_row2">MIB_IPNET_ROW2</a> structure entry for a neighbor IP address entry.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
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
     * Access is denied. This error is returned under several conditions that include the following: the  user lacks the required administrative privileges on the local computer or the application is not running in an enhanced shell as the built-in Administrator (RunAs administrator).  
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
     * An invalid parameter was passed to the function. This error is returned if a <b>NULL</b> pointer is passed in the <i>Row</i> parameter, the <b>Address</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipnet_row2">MIB_IPNET_ROW2</a> pointed to by the <i>Row</i> parameter was not set to a valid unicast, anycast, or multicast IPv4 or IPv6 address, the <b>PhysicalAddress</b> and <b>PhysicalAddressLength</b> members of the <b>MIB_IPNET_ROW2</b> pointed to by the <i>Row</i> parameter were not set to a valid physical address,  or both the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> members of the <b>MIB_IPNET_ROW2</b> pointed to by the <i>Row</i> parameter were unspecified. This error is also returned if a loopback address was passed in the <b>Address</b> member. 
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
     * The specified interface could not be found. This error is returned if the  network interface specified by the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipnet_row2">MIB_IPNET_ROW2</a> pointed to by the <i>Row</i> parameter could not be found.  
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
     * The request is not supported. This error is returned if no IPv4 stack is on the local computer and an IPv4 address was specified in the <b>Address</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipnet_row2">MIB_IPNET_ROW2</a> pointed to by the <i>Row</i> parameter. This error is also returned if no IPv6 stack is on the local computer and an IPv6 address was specified in the <b>Address</b> member.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_OBJECT_ALREADY_EXISTS </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object already exists. This error is returned if the  <b>Address</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipnet_row2">MIB_IPNET_ROW2</a> pointed to by the <i>Row</i> parameter is a duplicate of an existing neighbor IP address on the interface specified by the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> member of the <b>MIB_IPNET_ROW2</b>.  
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/netioapi/nf-netioapi-createipnetentry2
     * @since windows6.0.6000
     */
    static CreateIpNetEntry2(Row) {
        result := DllCall("IPHLPAPI.dll\CreateIpNetEntry2", "ptr", Row, "uint")
        return result
    }

    /**
     * Deletes a neighbor IP address entry on the local computer.
     * @remarks
     * The <b>DeleteIpNetEntry2</b> function is defined on Windows Vista and later. 
     * 
     * The <b>DeleteIpNetEntry2</b> function is used to delete a <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipnet_row2">MIB_IPNET_ROW2</a> structure entry.  
     * 
     * On input, the <b>Address</b> member in the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipnet_row2">MIB_IPNET_ROW2</a> structure pointed to by the <i>Row</i> parameter must be initialized to a valid neighbor IPv4 or IPv6 address and family. In addition, at least one of the following members in the <b>MIB_IPNET_ROW2</b> structure pointed to the <i>Row</i> parameter must be initialized: the <b>InterfaceLuid</b> or <b>InterfaceIndex</b>.
     * 
     * The fields are used in the order listed above. So if the <b>InterfaceLuid</b> is specified, then this member is used to determine the interface. If no value was set for the  <b>InterfaceLuid</b> member (the values of this member was set to zero), then the <b>InterfaceIndex</b> member is next used to determine the interface. 
     * 
     * On output when the call is successful, <b>DeleteIpNetEntry2</b> deletes the neighbor IP address. 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-getipnettable2">GetIpNetTable2</a> function can be called to enumerate the neighbor IP address entries on a local computer.
     * 
     * The <b>DeleteIpNetEntry2</b> function can only be called by a user logged on as a member of the Administrators group. If <b>DeleteIpNetEntry2</b> is called by a user that is not a member of the Administrators group, the function call will fail and <b>ERROR_ACCESS_DENIED</b> is returned. This function can also fail because of user account control (UAC) on Windows Vista and later. If an application that contains this function is executed by a user logged on as a member of the Administrators group other than the built-in Administrator, this call will fail unless the application has been marked in the manifest file with a <b>requestedExecutionLevel</b> set to requireAdministrator. If the application lacks this manifest file, a user logged on as a member of the Administrators group other than the built-in Administrator must then be executing the application in an enhanced shell as the built-in Administrator (RunAs administrator) for this function to succeed.
     * @param {Pointer<MIB_IPNET_ROW2>} Row A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipnet_row2">MIB_IPNET_ROW2</a> structure entry for a neighbor IP address entry. On successful return, this entry will be deleted.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
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
     * Access is denied. This error is returned under several conditions that include the following: the  user lacks the required administrative privileges on the local computer or the application is not running in an enhanced shell as the built-in Administrator (RunAs administrator).  
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
     * An invalid parameter was passed to the function. This error is returned if a <b>NULL</b> pointer is passed in the <i>Row</i> parameter, the <b>Address</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipnet_row2">MIB_IPNET_ROW2</a> pointed to by the <i>Row</i> parameter was not set to a valid neighbor IPv4 or IPv6 address, or both the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> members of the <b>MIB_IPNET_ROW2</b> pointed to by the <i>Row</i> parameter were unspecified.
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
     * The specified interface could not be found. This error is returned if the  network interface specified by the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipnet_row2">MIB_IPNET_ROW2</a> pointed to by the <i>Row</i> parameter could not be found.  
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
     * The request is not supported. This error is returned if no IPv4 stack is on the local computer and an IPv4 address was specified in the <b>Address</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipnet_row2">MIB_IPNET_ROW2</a> pointed to by the <i>Row</i> parameter. This error is also returned if no IPv6 stack is on the local computer and an IPv6 address was specified in the <b>Address</b> member. 
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/netioapi/nf-netioapi-deleteipnetentry2
     * @since windows6.0.6000
     */
    static DeleteIpNetEntry2(Row) {
        result := DllCall("IPHLPAPI.dll\DeleteIpNetEntry2", "ptr", Row, "uint")
        return result
    }

    /**
     * The FlushIpNetTable2 function flushes the IP neighbor table on the local computer.
     * @remarks
     * The <b>FlushIpNetTable2</b> function is defined on Windows Vista and later. 
     * 
     * The  
     * <b>FlushIpNetTable2</b> function flushes or deletes the neighbor IP addresses on a local system.  The <i>Family</i> parameter can be used to limit neighbor IP addresses to delete to a particular IP address family. If neighbor IP addresses for both IPv4 and IPv6 should be deleted, set the  <i>Family</i> parameter to <b>AF_UNSPEC</b>. The <i>InterfaceIndex</i> parameter can be used to limit neighbor IP addresses to delete to a particular interface. If neighbor IP addresses for all interfaces should be deleted, set the  <i>InterfaceIndex</i> parameter to zero. 
     * 
     * The <i>Family</i> parameter must be initialized to either <b>AF_INET</b>,  <b>AF_INET6</b>, or <b>AF_UNSPEC</b>. 
     * 
     * The <b>FlushIpNetTable2</b> function can only be called by a user logged on as a member of the Administrators group. If <b>FlushIpNetTable2</b> is called by a user that is not a member of the Administrators group, the function call will fail and <b>ERROR_ACCESS_DENIED</b> is returned. This function can also fail because of user account control (UAC) on Windows Vista and later. If an application that contains this function is executed by a user logged on as a member of the Administrators group other than the built-in Administrator, this call will fail unless the application has been marked in the manifest file with a <b>requestedExecutionLevel</b> set to requireAdministrator. If the application lacks this manifest file, a user logged on as a member of the Administrators group other than the built-in Administrator must then be executing the application in an enhanced shell as the built-in Administrator (RunAs administrator) for this function to succeed.
     * @param {Integer} Family The address family to flush. 
     * 
     * Possible values for the address family are listed in the <i>Winsock2.h</i> header file. Note that the values for the AF_ address family and PF_ protocol family constants  are identical (for example, <b>AF_INET</b> and <b>PF_INET</b>), so either constant can be used.
     * 
     * On the Windows SDK released for Windows Vista and later, the organization of header files has changed and possible values for this member are defined in the <i>Ws2def.h</i> header file. Note that the <i>Ws2def.h</i> header file is automatically included in <i>Winsock2.h</i>, and should never be used directly.
     * 
     * The values currently supported are <b>AF_INET</b>, <b>AF_INET6</b>, and <b>AF_UNSPEC</b>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AF_UNSPEC"></a><a id="af_unspec"></a><dl>
     * <dt><b>AF_UNSPEC</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The address family is unspecified. When this parameter is specified,  this function  flushes the neighbor IP address table containing both IPv4 and IPv6 entries. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AF_INET"></a><a id="af_inet"></a><dl>
     * <dt><b>AF_INET</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Internet Protocol version 4 (IPv4) address family. When this parameter is specified,  this function  flushes the neighbor IP address table containing only  IPv4 entries. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AF_INET6"></a><a id="af_inet6"></a><dl>
     * <dt><b>AF_INET6</b></dt>
     * <dt>23</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Internet Protocol version 6 (IPv6) address family. When this parameter is specified,  this function  flushes the neighbor IP address table containing only IPv6 entries. 
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} InterfaceIndex The interface index.  If the index is specified,
     *         flush the neighbor IP address entries on a specific interface, otherwise flush the
     *         neighbor IP address entries on all the interfaces. To ignore the interface, set this parameter to zero.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
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
     * Access is denied. This error is returned under several conditions that include the following: the  user lacks the required administrative privileges on the local computer or the application is not running in an enhanced shell as the built-in Administrator (RunAs administrator).  
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
     * An invalid parameter was passed to the function. This error is returned if the <i>Family</i> parameter was not specified as <b>AF_INET</b>, <b>AF_INET6</b>, or <b>AF_UNSPEC</b>.
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
     * The request is not supported. This error is returned if no IPv4 stack is on the local computer and <b>AF_INET</b> was specified in the <b>Family</b> parameter.  This error is also returned if no IPv6 stack is on the local computer and <b>AF_INET6</b> was specified in the <b>Family</b> parameter. This error is also returned on versions of Windows where this function is not supported.
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/netioapi/nf-netioapi-flushipnettable2
     * @since windows6.0.6000
     */
    static FlushIpNetTable2(Family, InterfaceIndex) {
        result := DllCall("IPHLPAPI.dll\FlushIpNetTable2", "ushort", Family, "uint", InterfaceIndex, "uint")
        return result
    }

    /**
     * Retrieves information for a neighbor IP address entry on the local computer.
     * @remarks
     * The <b>GetIpNetEntry2</b> function is defined on Windows Vista and later. 
     * 
     * The <b>GetIpNetEntry2</b> function is used to retrieve a <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipnet_row2">MIB_IPNET_ROW2</a> structure entry.  
     * 
     * On input, the <b>Address</b> member in the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipnet_row2">MIB_IPNET_ROW2</a> structure pointed to by the <i>Row</i> parameter must be initialized to a valid neighbor IPv4 or IPv6 address and family. In addition, at least one of the following members in the <b>MIB_IPNET_ROW2</b> structure pointed to the <i>Row</i> parameter must be initialized:
     *     the <b>InterfaceLuid</b> or <b>InterfaceIndex</b>.
     * 
     * The fields are used in the order listed above. So if the <b>InterfaceLuid</b> is specified, then this member is used to determine the interface. If no value was set for the  <b>InterfaceLuid</b> member (the values of this member was set to zero), then the <b>InterfaceIndex</b> member is next used to determine the interface. 
     * 
     * On output when the call is successful, <b>GetIpNetEntry2</b> retrieves the other properties for the neighbor IP address and fills out the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipnet_row2">MIB_IPNET_ROW2</a> structure pointed to by the <i>Row</i> parameter. 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-getipnettable2">GetIpNetTable2</a> function can be called to enumerate the neighbor IP address entries on a local computer.
     * @param {Pointer<MIB_IPNET_ROW2>} Row A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipnet_row2">MIB_IPNET_ROW2</a> structure entry for a neighbor IP address entry. On successful return, this structure will be updated with the properties for neighbor IP address.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
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
     * The system cannot find the file specified. This error is returned if the  network interface LUID or interface index specified by the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipnet_row2">MIB_IPNET_ROW2</a> pointed to by the <i>Row</i> parameter was not a value on the local machine.
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
     * An invalid parameter was passed to the function. This error is returned if a <b>NULL</b> pointer is passed in the <i>Row</i> parameter, the <b>Address</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipnet_row2">MIB_IPNET_ROW2</a> pointed to by the <i>Row</i> parameter was not set to a valid neighbor IPv4 or IPv6 address, or both the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> members of the <b>MIB_IPNET_ROW2</b> pointed to by the <i>Row</i> parameter were unspecified.
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
     * Element not found. This error is returned if the  network interface specified by the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipnet_row2">MIB_IPNET_ROW2</a> structure pointed to by the <i>Row</i> parameter does not match the neighbor IP address and address family specified in the <b>Address</b> member in the <b>MIB_IPNET_ROW2</b> structure.
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
     * The request is not supported. This error is returned if no IPv4 stack is on the local computer and an IPv4 address was specified in the <b>Address</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipnet_row2">MIB_IPNET_ROW2</a> structure pointed to by the <i>Row</i> parameter. This error is also returned if no IPv6 stack is on the local computer and an IPv6 address was specified in the <b>Address</b> member of the <b>MIB_IPNET_ROW2</b> structure.
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/netioapi/nf-netioapi-getipnetentry2
     * @since windows6.0.6000
     */
    static GetIpNetEntry2(Row) {
        result := DllCall("IPHLPAPI.dll\GetIpNetEntry2", "ptr", Row, "uint")
        return result
    }

    /**
     * The GetIpNetTable2 function retrieves the IP neighbor table on the local computer.
     * @remarks
     * The <b>GetIpNetTable2</b> function is defined on Windows Vista and later. 
     * 
     * The  
     * <b>GetIpNetTable2</b> function enumerates the neighbor IP addresses on a local system and returns this information in a <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipnet_table2">MIB_IPNET_TABLE2</a> structure. 
     * 
     * The neighbor IP address entries are returned in a <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipnet_table2">MIB_IPNET_TABLE2</a> structure in the buffer pointed to by the <i>Table</i> parameter. The <b>MIB_IPNET_TABLE2</b> structure contains a neighbor IP address entry count and an array of <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipnet_row2">MIB_IPNET_ROW2</a> structures for each neighbor IP address entry. When these returned structures are no longer required, free the memory by calling the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-freemibtable">FreeMibTable</a>.
     * 
     * The <i>Family</i> parameter must be initialized to either <b>AF_INET</b>,  <b>AF_INET6</b>, or <b>AF_UNSPEC</b>. 
     * 
     * Note that the returned <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipnet_table2">MIB_IPNET_TABLE2</a> structure pointed to by the <i>Table</i> parameter may contain padding for alignment between the <b>NumEntries</b> member and the first <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipnet_row2">MIB_IPNET_ROW2</a> array entry in the <b>Table</b> member of the <b>MIB_IPNET_TABLE2</b> structure. Padding for alignment may also be present between the <b>MIB_IPNET_ROW2</b> array entries. Any access to a <b>MIB_IPNET_ROW2</b> array entry should assume  padding may exist.
     * @param {Integer} Family The address family to retrieve.
     * 
     * Possible values for the address family are listed in the <i>Winsock2.h</i> header file. Note that the values for the AF_ address family and PF_ protocol family constants  are identical (for example, <b>AF_INET</b> and <b>PF_INET</b>), so either constant can be used.
     * 
     * On the Windows SDK released for Windows Vista and later, the organization of header files has changed and possible values for this member are defined in the <i>Ws2def.h</i> header file. Note that the <i>Ws2def.h</i> header file is automatically included in <i>Winsock2.h</i>, and should never be used directly.
     * 
     * The values currently supported are <b>AF_INET</b>, <b>AF_INET6</b>, and <b>AF_UNSPEC</b>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AF_UNSPEC"></a><a id="af_unspec"></a><dl>
     * <dt><b>AF_UNSPEC</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The address family is unspecified. When this parameter is specified,  this function  returns the neighbor IP address table containing both IPv4 and IPv6 entries. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AF_INET"></a><a id="af_inet"></a><dl>
     * <dt><b>AF_INET</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Internet Protocol version 4 (IPv4) address family. When this parameter is specified,  this function  returns the neighbor IP address table containing only  IPv4 entries.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AF_INET6"></a><a id="af_inet6"></a><dl>
     * <dt><b>AF_INET6</b></dt>
     * <dt>23</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Internet Protocol version 6 (IPv6) address family. When this parameter is specified,  this function  returns the neighbor IP address table containing only IPv6 entries. 
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<MIB_IPNET_TABLE2>} Table A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipnet_table2">MIB_IPNET_TABLE2</a> structure that contains a table of neighbor IP address entries on the local computer.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR or ERROR_NOT_FOUND.
     * 
     * If the function fails or returns no data, the return value is one of the following error codes.
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
     * An invalid parameter was passed to the function. This error is returned if a <b>NULL</b> pointer is passed in the <i>Table</i> parameter or the <i>Family</i> parameter was not specified as <b>AF_INET</b>, <b>AF_INET6</b>, or <b>AF_UNSPEC</b>.
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
     * Insufficient memory resources are available to complete the operation.
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
     * No neighbor IP address entries as specified in the <i>Family</i> parameter were found.  
     * 
     * This return value indicates that the call to the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-getipnettable2">GetIpNetTable2</a> function succeeded, but there was no data to return. This can occur when AF_INET is specified in the <i>Family</i> parameter and there are no ARP entries to return.
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
     * This error is returned if no IPv4 stack is on the local computer and <b>AF_INET</b> was specified in the <b>Family</b> parameter. This error is also returned if no IPv6 stack is on the local computer and <b>AF_INET6</b> was specified in the <b>Family</b> parameter. This error is also returned on versions of Windows where this function is not supported.
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/netioapi/nf-netioapi-getipnettable2
     * @since windows6.0.6000
     */
    static GetIpNetTable2(Family, Table) {
        result := DllCall("IPHLPAPI.dll\GetIpNetTable2", "ushort", Family, "ptr", Table, "uint")
        return result
    }

    /**
     * Resolves the physical address for a neighbor IP address entry on the local computer. (ResolveIpNetEntry2)
     * @remarks
     * The <b>ResolveIpNetEntry2</b> function is defined on Windows Vista and later. 
     * 
     * The <b>ResolveIpNetEntry2</b> function is used to resolve the physical address for a neighbor IP address entry on a local computer. This function flushes any existing neighbor entry that matches the IP address on the interface and then resolves the physical address (MAC) address
     *     by sending ARP requests for an IPv4 address or neighbor solicitation requests for an IPv6 address.
     *     If the <i>SourceAddress</i> parameter is specified, the <b>ResolveIpNetEntry2</b> function will select the
     *     interface with this source IP address to send the requests on.
     * If the <i>SourceAddress</i> parameter is not specified (NULL was passed in this parameter), the <b>ResolveIpNetEntry2</b> function will automatically select the
     *     best interface to send the requests on.
     * 
     * 
     * The <b>Address</b> member in the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipnet_row2">MIB_IPNET_ROW2</a> structure pointed to by the <i>Row</i> parameter must be initialized to a valid IPv4 or IPv6 address and family. In addition, at least one of the following members in the <b>MIB_IPNET_ROW2</b> structure pointed to the <i>Row</i> parameter must be initialized to the interface: the <b>InterfaceLuid</b> or <b>InterfaceIndex</b>.
     * 
     * The fields are used in the order listed above. So if the <b>InterfaceLuid</b> is specified, then this member is used to determine the interface on which to add the unicast IP address. If no value was set for the  <b>InterfaceLuid</b> member (the values of this member was set to zero), then the <b>InterfaceIndex</b> member is next used to determine the interface. 
     * 
     * If the IP address passed in the <b>Address</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipnet_row2">MIB_IPNET_ROW2</a> pointed to by the <i>Row</i> parameter is a duplicate of an existing neighbor IP address on the interface, the <b>ResolveIpNetEntry2</b> function will flush the existing entry before resolving the IP address. 
     * 
     * On output when the call is successful, <b>ResolveIpNetEntry2</b> retrieves the other properties for the neighbor IP address and fills out the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipnet_row2">MIB_IPNET_ROW2</a> structure pointed to by the <i>Row</i> parameter. The  <b>PhysicalAddress</b> and <b>PhysicalAddressLength</b> members in the <b>MIB_IPNET_ROW2</b> structure pointed to by the <i>Row</i> parameter will be initialized to a valid physical address.
     * @param {Pointer<MIB_IPNET_ROW2>} Row A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipnet_row2">MIB_IPNET_ROW2</a> structure entry for a neighbor IP address entry. On successful return, this structure will be updated with the properties for neighbor IP address.
     * @param {Pointer<SOCKADDR_INET>} SourceAddress A pointer to a 
     * an optional source IP address used to select the interface to send the requests on for the neighbor IP address entry.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_NET_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network name cannot be found. This error is returned if the network with the neighbor IP address is unreachable.
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
     * An invalid parameter was passed to the function. This error is returned if a <b>NULL</b> pointer is passed in the <i>Row</i> parameter, the <b>Address</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipnet_row2">MIB_IPNET_ROW2</a> pointed to by the <i>Row</i> parameter was not set to a valid IPv4 or IPv6 address, or both the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> members of the <b>MIB_IPNET_ROW2</b> pointed to by the <i>Row</i> parameter were unspecified. This error is also returned if a loopback address was passed in the <b>Address</b> member. 
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
     * The specified interface could not be found. This error is returned if the  network interface specified by the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipnet_row2">MIB_IPNET_ROW2</a> pointed to by the <i>Row</i> parameter could not be found.  
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
     * The request is not supported. This error is returned if no IPv4 stack is on the local computer and an IPv4 address was specified in the <b>Address</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipnet_row2">MIB_IPNET_ROW2</a> pointed to by the <i>Row</i> parameter or no IPv6 stack is on the local computer and an IPv6 address was specified in the <b>Address</b> member.
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/netioapi/nf-netioapi-resolveipnetentry2
     * @since windows6.0.6000
     */
    static ResolveIpNetEntry2(Row, SourceAddress) {
        result := DllCall("IPHLPAPI.dll\ResolveIpNetEntry2", "ptr", Row, "ptr", SourceAddress, "uint")
        return result
    }

    /**
     * Sets the physical address of an existing neighbor IP address entry on the local computer.
     * @remarks
     * The <b>SetIpNetEntry2</b> function is defined on Windows Vista and later. 
     * 
     * The <b>SetIpNetEntry2</b> function is used to set the physical address for an existing neighbor IP address entry on a local computer. 
     * 
     * The <b>Address</b> member in the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipnet_row2">MIB_IPNET_ROW2</a> structure pointed to by the <i>Row</i> parameter must be initialized to a valid unicast, anycast, or multicast IPv4 or IPv6 address and family. The  <b>PhysicalAddress</b> and <b>PhysicalAddressLength</b> members in the <b>MIB_IPNET_ROW2</b> structure pointed to by the <i>Row</i> parameter must be initialized to a valid physical address. In addition, at least one of the following members in the <b>MIB_IPNET_ROW2</b> structure pointed to the <i>Row</i> parameter must be initialized to the interface: the <b>InterfaceLuid</b> or <b>InterfaceIndex</b>.
     * 
     * The fields are used in the order listed above. So if the <b>InterfaceLuid</b> is specified, then this member is used to determine the interface on which to add the unicast IP address. If no value was set for the  <b>InterfaceLuid</b> member (the values of this member was set to zero), then the <b>InterfaceIndex</b> member is next used to determine the interface. 
     * 
     * The <b>SetIpNetEntry2</b> function will fail if the IP address passed in the <b>Address</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipnet_row2">MIB_IPNET_ROW2</a> pointed to by the <i>Row</i> parameter is not an existing neighbor IP address on the interface specified. 
     * 
     * The <b>SetIpNetEntry2</b> function can only be called by a user logged on as a member of the Administrators group. If <b>SetIpNetEntry2</b> is called by a user that is not a member of the Administrators group, the function call will fail and <b>ERROR_ACCESS_DENIED</b> is returned. 
     * 
     * The <b>SetIpNetEntry2</b> function can also fail because of user account control (UAC) on Windows Vista and later. If an application that contains this function is executed by a user logged on as a member of the Administrators group other than the built-in Administrator, this call will fail unless the application has been marked in the manifest file with a <b>requestedExecutionLevel</b> set to requireAdministrator. If the application lacks this manifest file, a user logged on as a member of the Administrators group other than the built-in Administrator must then be executing the application in an enhanced shell as the built-in Administrator (RunAs administrator) for this function to succeed.
     * @param {Pointer<MIB_IPNET_ROW2>} Row A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipnet_row2">MIB_IPNET_ROW2</a> structure entry for a neighbor IP address entry.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
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
     * Access is denied. This error is returned under several conditions that include the following: the  user lacks the required administrative privileges on the local computer or the application is not running in an enhanced shell as the built-in Administrator (RunAs administrator).  
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
     * An invalid parameter was passed to the function. This error is returned if a <b>NULL</b> pointer is passed in the <i>Row</i> parameter, the <b>Address</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipnet_row2">MIB_IPNET_ROW2</a> pointed to by the <i>Row</i> parameter was not set to a valid unicast, anycast, or multicast IPv4 or IPv6 address, the <b>PhysicalAddress</b> and <b>PhysicalAddressLength</b> members of the <b>MIB_IPNET_ROW2</b> pointed to by the <i>Row</i> parameter were not set to a valid physical address,  or both the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> members of the <b>MIB_IPNET_ROW2</b> pointed to by the <i>Row</i> parameter were unspecified. This error is also returned if a loopback address was passed in the <b>Address</b> member. 
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
     * The specified interface could not be found. This error is returned if the  network interface specified by the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipnet_row2">MIB_IPNET_ROW2</a> pointed to by the <i>Row</i> parameter could not be found.  
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
     * The request is not supported. This error is returned if no IPv4 stack is on the local computer and an IPv4 address was specified in the <b>Address</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipnet_row2">MIB_IPNET_ROW2</a> pointed to by the <i>Row</i> parameter or no IPv6 stack is on the local computer and an IPv6 address was specified in the <b>Address</b> member.
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/netioapi/nf-netioapi-setipnetentry2
     * @since windows6.0.6000
     */
    static SetIpNetEntry2(Row) {
        result := DllCall("IPHLPAPI.dll\SetIpNetEntry2", "ptr", Row, "uint")
        return result
    }

    /**
     * Registers to be notified for changes to the UDP port number used by the Teredo client for the Teredo service port on a local computer.
     * @remarks
     * The <b>NotifyTeredoPortChange</b> function is defined on Windows Vista and later. 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-getteredoport">GetTeredoPort</a> function can be used to retrieve the initial UDP port number used by the Teredo client for the Teredo service port. 
     * 
     * The Teredo port is dynamic and can change any time the Teredo client is restarted on the local computer. An application can  register to be notified when the Teredo service port changes by calling the <b>NotifyTeredoPortChange</b> function. 
     * 
     * The invocation of the callback function specified in the <i>Callback</i> parameter is serialized. The callback function should be defined as a function of type <b>VOID</b>. The parameters passed to the callback function include the following:
     * 
     * <table>
     * <tr>
     * <th>Parameter</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <a id="IN_PVOID_CallerContext"></a><a id="in_pvoid_callercontext"></a><a id="IN_PVOID_CALLERCONTEXT"></a>IN PVOID CallerContext
     * 
     * </td>
     * <td width="60%">
     * The <i>CallerContext</i> parameter passed to the <b>NotifyTeredoPortChange</b> function when registering for notifications.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <a id="IN_USHORT_Port"></a><a id="in_ushort_port"></a><a id="IN_USHORT_PORT"></a>IN USHORT Port
     * 
     * </td>
     * <td width="60%">
     * The UDP port number currently used by the Teredo client. This parameter is <b>zero</b> when the <b>MIB_NOTIFICATION_TYPE</b> value passed in the <i>NotificationType</i> parameter to the callback function is set to <b>MibInitialNotification</b>. This can only occur if the <i>InitialNotification</i> parameter passed to <b>NotifyTeredoPortChange</b> was set to <b>TRUE</b> when registering for notifications.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <a id="IN_MIB_NOTIFICATION_TYPE_NotificationType"></a><a id="in_mib_notification_type_notificationtype"></a><a id="IN_MIB_NOTIFICATION_TYPE_NOTIFICATIONTYPE"></a>IN MIB_NOTIFICATION_TYPE NotificationType
     * 
     * </td>
     * <td width="60%">
     * The notification type. This member can be one of the values from the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ne-netioapi-mib_notification_type">MIB_NOTIFICATION_TYPE</a> enumeration type defined in the <i>Netioapi.h</i> header file.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * 
     * The callback function specified in the <i>Callback</i> parameter must be implemented in the same process as the application calling the <b>NotifyTeredoPortChange</b> function. If the callback function is in a separate DLL, then the DLL should be loaded before calling the <b>NotifyTeredoPortChange</b> function to register for change notifications. 
     * 
     * Once the <b>NotifyTeredoPortChange</b> function is called to register for change notifications, these notifications will continue to be sent until the application deregisters for change notifications or the application terminates. If the application terminates, the system will automatically deregister any registration for change notifications. It is still recommended that an application explicitly deregister for change notifications before it terminates.  
     * 
     * Any registration for change notifications does not persist across a system shut down or reboot.
     * 
     * To deregister for change notifications, call the  <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-cancelmibchangenotify2">CancelMibChangeNotify2</a> function passing the <i>NotificationHandle</i> parameter returned by  <b>NotifyTeredoPortChange</b>. 
     * 
     * An application cannot make a call to the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-cancelmibchangenotify2">CancelMibChangeNotify2</a> function from the context of the thread which is currently executing the notification callback function for the same <i>NotificationHandle</i> parameter. Otherwise, the thread executing that callback will result in deadlock. So the <b>CancelMibChangeNotify2</b> function must not be called directly as part of the notification callback routine. In a more general situation, a thread that executes the <b>CancelMibChangeNotify2</b> function cannot own a resource on which the thread that executes a notification callback operation would wait because it would result in a similar deadlock. The <b>CancelMibChangeNotify2</b> function should be called from a different thread, on which the thread that receives the notification callback doesn’t have dependencies on.
     * 
     * The Teredo client also uses static UDP port 3544 for listening to multicast traffic sent on multicast IPv4 address 224.0.0.253 as defined in RFC 4380. For more information, see <a href="https://www.ietf.org/rfc/rfc4380.txt">http://www.ietf.org/rfc/rfc4380.txt</a>.
     * 
     * The <b>NotifyTeredoPortChange</b> function is used primarily by firewall applications in order to configure the appropriate exceptions to allow incoming and outgoing Teredo traffic. 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-notifystableunicastipaddresstable">NotifyStableUnicastIpAddressTable</a> function is used primarily by applications that use the Teredo client.
     * @param {Pointer<PTEREDO_PORT_CHANGE_CALLBACK>} Callback A pointer to the function to call when a Teredo client port change occurs. This function will be invoked
     *         when a Teredo port change notification is received.
     * @param {Pointer<Void>} CallerContext A user context passed to the callback function specified in the <i>Callback</i> parameter when a Teredo port change  notification is received.
     * @param {Integer} InitialNotification A value that indicates whether the callback should be invoked
     *         immediately after registration for change notification completes. This initial notification does not indicate a change occurred to the Teredo client port. The purpose of this parameter to provide confirmation that the callback is registered.
     * @param {Pointer<HANDLE>} NotificationHandle A pointer used to return a handle that can be later used to
     *         deregister the change notification. On success, a notification handle is returned in this parameter. If an error occurs, <b>NULL</b> is returned.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
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
     * An internal error occurred where an invalid handle was encountered. 
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
     * An invalid parameter was passed to the function. This error is returned if the <i>Callback</i> parameter is a <b>NULL</b> pointer.
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
     * There was insufficient memory.
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/netioapi/nf-netioapi-notifyteredoportchange
     * @since windows6.0.6000
     */
    static NotifyTeredoPortChange(Callback, CallerContext, InitialNotification, NotificationHandle) {
        result := DllCall("IPHLPAPI.dll\NotifyTeredoPortChange", "ptr", Callback, "ptr", CallerContext, "char", InitialNotification, "ptr", NotificationHandle, "uint")
        return result
    }

    /**
     * Retrieves the dynamic UDP port number used by the Teredo client on the local computer.
     * @remarks
     * The <b>GetTeredoPort</b> function is defined on Windows Vista and later. 
     * 
     * The <b>GetTeredoPort</b> function retrieves the current UDP port number used by the Teredo client for the Teredo service port. The Teredo port is dynamic and can change any time the Teredo client is restarted on the local computer. An application can  register to be notified when the Teredo service port changes by calling the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-notifyteredoportchange">NotifyTeredoPortChange</a> function. 
     * 
     * The Teredo client also uses static UDP port 3544 for listening to multicast traffic sent on multicast IPv4 address 224.0.0.253 as defined in RFC 4380. For more information, see <a href="https://www.ietf.org/rfc/rfc4380.txt">http://www.ietf.org/rfc/rfc4380.txt</a>.
     * 
     * The <b>GetTeredoPort</b> function is used primarily by firewall applications in order to configure the appropriate exceptions to allow incoming and outgoing Teredo traffic.
     * @param {Pointer<UInt16>} Port A pointer to the  UDP port number. On successful return, this parameter will be filled with the port number used by the Teredo client.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
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
     * An invalid parameter was passed to the function. This error is returned if a <b>NULL</b> pointer is passed in the <i>Port</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_READY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device is not ready. This error is returned if the Teredo client is not started on the local computer. 
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
     * The request is not supported. This error is returned if no IPv6 stack is on the local computer. 
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/netioapi/nf-netioapi-getteredoport
     * @since windows6.0.6000
     */
    static GetTeredoPort(Port) {
        result := DllCall("IPHLPAPI.dll\GetTeredoPort", "ptr", Port, "uint")
        return result
    }

    /**
     * Deregisters for change notifications for IP interface changes, IP address changes, IP route changes, Teredo port changes, and when the unicast IP address table is stable and can be retrieved.
     * @remarks
     * The <b>CancelMibChangeNotify2</b> function is defined on Windows Vista and later. 
     * 
     * The  
     * <b>CancelMibChangeNotify2</b> function deregisters for a change notification previously requested for IP interface changes, IP  address changes, IP route changes, or Teredo port changes on  a local computer. These requests are made  by calling <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-notifyipinterfacechange">NotifyIpInterfaceChange</a>, <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-notifyunicastipaddresschange">NotifyUnicastIpAddressChange</a>, <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-notifyroutechange2">NotifyRouteChange2</a>,  or <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-notifyteredoportchange">NotifyTeredoPortChange</a>. The  
     * <b>CancelMibChangeNotify2</b> function also cancels a previous request to be notified when the unicast IP address table is stable on a local computer and can be  retrieved. This request is made by calling the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-notifystableunicastipaddresstable">NotifyStableUnicastIpAddressTable</a> function. 
     * 
     * The <i>NotificationHandle</i> parameter returned to these notification functions is passed to <b>CancelMibChangeNotify2</b> to deregister for notifications or cancel a pending request to retrieve the stable unicast IP address table.
     * 
     * An application cannot make a call to the <b>CancelMibChangeNotify2</b> function from the context of the thread which is currently executing the notification callback function for the same <i>NotificationHandle</i> parameter. Otherwise, the thread executing that callback will result in deadlock. So the <b>CancelMibChangeNotify2</b> function must not be called directly as part of the notification callback routine. In a more general situation, a thread that executes the <b>CancelMibChangeNotify2</b> function cannot own a resource on which the thread that executes a notification callback operation would wait because it would result in a similar deadlock. The <b>CancelMibChangeNotify2</b> function should be called from a different thread, on which the thread that receives the notification callback doesn’t have dependencies on.
     * @param {Pointer<HANDLE>} NotificationHandle The handle returned from a notification 
     *         registration or retrieval function to indicate which notification to cancel.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
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
     * An invalid parameter was passed to the function. This error is returned if the <i>NotificationHandle</i> parameter was  a <b>NULL</b> pointer.
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/netioapi/nf-netioapi-cancelmibchangenotify2
     * @since windows6.0.6000
     */
    static CancelMibChangeNotify2(NotificationHandle) {
        result := DllCall("IPHLPAPI.dll\CancelMibChangeNotify2", "ptr", NotificationHandle, "uint")
        return result
    }

    /**
     * Frees the buffer allocated by the functions that return tables of network interfaces, addresses, and routes (GetIfTable2 and GetAnycastIpAddressTable, for example).
     * @remarks
     * The <b>FreeMibTable</b> function is defined on Windows Vista and later. 
     * 
     * The <b>FreeMibTable</b> function is used to free the internal buffers used by various functions to retrieve tables of interfaces, addresses, and routes. When these tables are no longer needed, then <b>FreeMibTable</b> should be called to release the memory used by these tables.
     * @param {Pointer<Void>} Memory A pointer to the buffer to free.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/netioapi/nf-netioapi-freemibtable
     * @since windows6.0.6000
     */
    static FreeMibTable(Memory) {
        DllCall("IPHLPAPI.dll\FreeMibTable", "ptr", Memory)
    }

    /**
     * Takes a supplied list of potential IP destination addresses, pairs the destination addresses with the host machine's local IP addresses, and sorts the pairs according to which address pair is best suited for communication between the two peers.
     * @remarks
     * The <b>CreateSortedAddressPairs</b> function is defined on Windows Vista and later. 
     * 
     * The <b>CreateSortedAddressPairs</b> function takes a list of source and destination IPv6 addresses, and returns a list of
     *     pairs of addresses in sorted order.  The list is sorted by which address
     *     pair is best suited for communication between the source and destination address. 
     * 
     * The list of source addresses pointed to by the <i>SourceAddressList</i> is currently reserved for future and must be a <b>NULL</b> pointer. The <i>SourceAddressCount</i> is currently reserved for future and must be zero. The <b>CreateSortedAddressPairs</b> function currently  uses all of the host machine's local addresses for the source address list.
     * 
     * 
     * The list of destination addresses is pointed to by the <i>DestinationAddressList</i> parameter. The list of destination addresses is an array of <a href="https://docs.microsoft.com/windows/desktop/WinSock/sockaddr-2">SOCKADDR_IN6</a> structures.  Any IPv4 addresses must be represented in the IPv4-mapped IPv6 address format which enables an IPv6 only application to communicate with an IPv4 node. For more information on the IPv4-mapped IPv6 address format, see <a href="https://docs.microsoft.com/windows/desktop/WinSock/dual-stack-sockets">Dual-Stack Sockets</a>. The <i>DestinationAddressCount</i> parameter contains the number of destination addresses pointed to by the <i>DestinationAddressList</i> parameter. The <b>CreateSortedAddressPairs</b> function supports a maximum of 500 destination addresses.
     * 
     * If the <b>CreateSortedAddressPairs</b> function is successful, the <i>SortedAddressPairList</i> parameter points to an array of <a href="https://docs.microsoft.com/windows/desktop/api/ws2ipdef/ns-ws2ipdef-sockaddr_in6_pair">SOCKADDR_IN6_PAIR</a> structures that contain the sorted address pairs. When this returned list is no longer required, free the memory used by the list by calling the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-freemibtable">FreeMibTable</a> function.
     * @param {Pointer<SOCKADDR_IN6>} SourceAddressList Must be <b>NULL</b>. Reserved for future use.
     * @param {Integer} SourceAddressCount Must be 0. Reserved for future use.
     * @param {Pointer<SOCKADDR_IN6>} DestinationAddressList A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/WinSock/sockaddr-2">SOCKADDR_IN6</a> structures that contain a list of potential IPv6 destination addresses.
     *         Any IPv4 addresses must be represented in the IPv4-mapped IPv6 address format which enables an IPv6 only application to communicate with an IPv4 node.
     * @param {Integer} DestinationAddressCount The number of destination addresses pointed to by the <i>DestinationAddressList</i> parameter.
     * @param {Integer} AddressSortOptions Reserved for future use.
     * @param {Pointer<SOCKADDR_IN6_PAIR>} SortedAddressPairList A pointer to store an array of <a href="https://docs.microsoft.com/windows/desktop/api/ws2ipdef/ns-ws2ipdef-sockaddr_in6_pair">SOCKADDR_IN6_PAIR</a> structures that contain a list of pairs of IPv6 addresses
     *         sorted in the preferred order of communication, if the function call is successful.
     * @param {Pointer<UInt32>} SortedAddressPairCount A pointer to store the number of address pairs pointed to by the <i>SortedAddressPairList</i> parameter, if the function call is successful.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
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
     * An invalid parameter was passed to the function. This error is returned if the <i>DestinationAddressList</i>, <i>SortedAddressPairList</i>, or  <i>SortedAddressPairCount</i> parameters <b>NULL</b>,  or the <i>DestinationAddressCount</i> was greater than 500. This error is also returned if the <i>SourceAddressList</i> is not <b>NULL</b> or the <i>SourceAddressPairCount</i> parameter is not zero. 
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
     * The request is not supported. This error is returned if no IPv6 stack is on the local computer.
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
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/netioapi/nf-netioapi-createsortedaddresspairs
     * @since windows6.0.6000
     */
    static CreateSortedAddressPairs(SourceAddressList, SourceAddressCount, DestinationAddressList, DestinationAddressCount, AddressSortOptions, SortedAddressPairList, SortedAddressPairCount) {
        result := DllCall("IPHLPAPI.dll\CreateSortedAddressPairs", "ptr", SourceAddressList, "uint", SourceAddressCount, "ptr", DestinationAddressList, "uint", DestinationAddressCount, "uint", AddressSortOptions, "ptr", SortedAddressPairList, "ptr", SortedAddressPairCount, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} CompartmentGuid 
     * @param {Pointer<UInt32>} CompartmentId 
     * @returns {Integer} 
     */
    static ConvertCompartmentGuidToId(CompartmentGuid, CompartmentId) {
        result := DllCall("IPHLPAPI.dll\ConvertCompartmentGuidToId", "ptr", CompartmentGuid, "ptr", CompartmentId, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} CompartmentId 
     * @param {Pointer<Guid>} CompartmentGuid 
     * @returns {Integer} 
     */
    static ConvertCompartmentIdToGuid(CompartmentId, CompartmentGuid) {
        result := DllCall("IPHLPAPI.dll\ConvertCompartmentIdToGuid", "uint", CompartmentId, "ptr", CompartmentGuid, "uint")
        return result
    }

    /**
     * Converts an ANSI network interface name to the locally unique identifier (LUID) for the interface.
     * @remarks
     * The <b>ConvertInterfaceNameToLuidA</b> function is available on Windows Vista and later.
     * 
     * The <b>ConvertInterfaceNameToLuidA</b> function is protocol independent and works with network interfaces for both the IPv6 and IPv4 protocol. The <b>ConvertInterfaceNameToLuidA</b> converts an ANSI interface name to a LUID. 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-convertinterfacenametoluidw">ConvertInterfaceNameToLuidW</a> converts a Unicode interface name to a LUID. 
     * 
     * The maximum length of an interface name, <b>NDIS_IF_MAX_STRING_SIZE</b>, without the terminating <b>NULL</b> is declared in the <i>Ntddndis.h</i> header file. The <b>NDIS_IF_MAX_STRING_SIZE</b> is defined to be the <b>IF_MAX_STRING_SIZE</b> constant defined in the <i>Ifdef.h</i> header file. The <i>Ntddndis.h</i> and <i>Ifdef.h</i> header files are automatically included in the <i>Netioapi.h</i> header file which is automatically included by the <i>Iphlpapi.h</i> header file. The <i>Ntddndis.h</i>, <i>Ifdef.h</i>, and <i> Netioapi.h</i> header files should never be used directly.
     * @param {Pointer<PSTR>} InterfaceName A pointer to a <b>NULL</b>-terminated ANSI string containing the network interface name.
     * @param {Pointer<NET_LUID_LH>} InterfaceLuid A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ifdef/ns-ifdef-net_luid_lh">NET_LUID</a> for this interface.
     * @returns {Integer} On success, 
     * <b>ConvertInterfaceNameToLuidA</b> returns <b>NETIO_ERROR_SUCCESS</b>. Any nonzero return value indicates failure. 
     * 
     * <table>
     * <tr>
     * <th>Error code</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BUFFER_OVERFLOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The length of the ANSI interface name was invalid.  This error is returned if the <i>InterfaceName</i> parameter exceeded the maximum allowed string length for this parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The interface name was invalid.  This error is returned if the <i>InterfaceName</i> parameter contained an invalid name.
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
     * One of the parameters was invalid. This error is returned if the <i>InterfaceLuid</i> parameter was <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/netioapi/nf-netioapi-convertinterfacenametoluida
     * @since windows6.0.6000
     */
    static ConvertInterfaceNameToLuidA(InterfaceName, InterfaceLuid) {
        result := DllCall("IPHLPAPI.dll\ConvertInterfaceNameToLuidA", "ptr", InterfaceName, "ptr", InterfaceLuid, "uint")
        return result
    }

    /**
     * Converts a Unicode network interface name to the locally unique identifier (LUID) for the interface.
     * @remarks
     * The <b>ConvertInterfaceNameToLuidW</b> function is available on Windows Vista and later.
     * 
     * The <b>ConvertInterfaceNameToLuidW</b> function is protocol independent and works with network interfaces for both the IPv6 and IPv4 protocol. The <b>ConvertInterfaceNameToLuidW</b> converts a Unicode interface name to a LUID. 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-convertinterfacenametoluida">ConvertInterfaceNameToLuidA</a> converts an ANSI interface name to a LUID. 
     * 
     * The maximum length of an interface name, <b>NDIS_IF_MAX_STRING_SIZE</b>, without the terminating <b>NULL</b> is declared in the <i>Ntddndis.h</i> header file. The <b>NDIS_IF_MAX_STRING_SIZE</b> is defined to be the <b>IF_MAX_STRING_SIZE</b> constant defined in the <i>Ifdef.h</i> header file. The <i>Ntddndis.h</i> and <i>Ifdef.h</i> header files are automatically included in the <i>Netioapi.h</i> header file which is automatically included by the <i>Iphlpapi.h</i> header file. The <i>Ntddndis.h</i>, <i>Ifdef.h</i>, and <i> Netioapi.h</i> header files should never be used directly.
     * @param {Pointer<PWSTR>} InterfaceName A pointer to a <b>NULL</b>-terminated Unicode string containing the network interface name.
     * @param {Pointer<NET_LUID_LH>} InterfaceLuid A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ifdef/ns-ifdef-net_luid_lh">NET_LUID</a> for this interface.
     * @returns {Integer} On success, 
     * <b>ConvertInterfaceNameToLuidW</b> returns <b>NETIO_ERROR_SUCCESS</b>. Any nonzero return value indicates failure. 
     * 
     * <table>
     * <tr>
     * <th>Error code</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The interface name was invalid.  This error is returned if the <i>InterfaceName</i> parameter contained an invalid name or the length of the <i>InterfaceName</i> parameter exceeded the maximum allowed string length for this parameter.
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
     * One of the parameters was invalid. This error is returned if the <i>InterfaceLuid</i> parameter was <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/netioapi/nf-netioapi-convertinterfacenametoluidw
     * @since windows6.0.6000
     */
    static ConvertInterfaceNameToLuidW(InterfaceName, InterfaceLuid) {
        result := DllCall("IPHLPAPI.dll\ConvertInterfaceNameToLuidW", "ptr", InterfaceName, "ptr", InterfaceLuid, "uint")
        return result
    }

    /**
     * Converts a locally unique identifier (LUID) for a network interface to the ANSI interface name.
     * @remarks
     * The <b>ConvertInterfaceLuidToNameA</b> function is available on Windows Vista and later.
     * 
     * The <b>ConvertInterfaceLuidToNameA</b> function is protocol independent and works with network interfaces for both the IPv6 and IPv4 protocol. The <b>ConvertInterfaceLuidToNameA</b> converts a network interface LUID to an ANSI interface name. 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-convertinterfaceluidtonamew">ConvertInterfaceLuidToNameW</a> converts a network interface LUID to a Unicode interface name. 
     * 
     * The maximum length of an interface name, <b>NDIS_IF_MAX_STRING_SIZE</b>, without the terminating <b>NULL</b> is declared in the <i>Ntddndis.h</i> header file. The <b>NDIS_IF_MAX_STRING_SIZE</b> is defined to be the <b>IF_MAX_STRING_SIZE</b> constant defined in the <i>Ifdef.h</i> header file. The <i>Ntddndis.h</i> and <i>Ifdef.h</i> header files are automatically included in the <i>Netioapi.h</i> header file which is automatically included by the <i>Iphlpapi.h</i> header file. The <i>Ntddndis.h</i>, <i>Ifdef.h</i>, and <i> Netioapi.h</i> header files should never be used directly.
     * @param {Pointer<NET_LUID_LH>} InterfaceLuid A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/ifdef/ns-ifdef-net_luid_lh">NET_LUID</a> for a network interface.
     * @param {Pointer<PSTR>} InterfaceName A pointer to a buffer to hold the <b>NULL</b>-terminated ANSI string containing the interface name when the function returns successfully.
     * @param {Pointer} Length The length, in bytes, of the buffer pointed to by the <i>InterfaceName</i> parameter. This value must be large enough to accommodate the interface name
     *         and the terminating null character.  The maximum required length is
     *         <b>NDIS_IF_MAX_STRING_SIZE</b> + 1.
     * @returns {Integer} On success, 
     * <b>ConvertInterfaceLuidToNameA</b> returns <b>NETIO_ERROR_SUCCESS</b>. Any nonzero return value indicates failure. 
     * 
     * <table>
     * <tr>
     * <th>Error code</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters was invalid. This error is returned if either the <i>InterfaceLuid</i> or the <i>InterfaceName</i> parameter was <b>NULL</b> or if the <i>InterfaceLuid</i> parameter was invalid.
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
     * Not enough storage is available to process this command. This error is returned if the size of the buffer pointed to by <i>InterfaceName</i> parameter was not large enough as specified in the <i>Length</i> parameter to hold the interface name.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/netioapi/nf-netioapi-convertinterfaceluidtonamea
     * @since windows6.0.6000
     */
    static ConvertInterfaceLuidToNameA(InterfaceLuid, InterfaceName, Length) {
        result := DllCall("IPHLPAPI.dll\ConvertInterfaceLuidToNameA", "ptr", InterfaceLuid, "ptr", InterfaceName, "ptr", Length, "uint")
        return result
    }

    /**
     * Converts a locally unique identifier (LUID) for a network interface to the Unicode interface name.
     * @remarks
     * The <b>ConvertInterfaceLuidToNameW</b> function is available on Windows Vista and later.
     * 
     * The <b>ConvertInterfaceLuidToNameW</b> function is protocol independent and works with network interfaces for both the IPv6 and IPv4 protocol. The <b>ConvertInterfaceLuidToNameW</b> converts a network interface LUID to a Unicode interface name.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-convertinterfaceluidtonamea">ConvertInterfaceLuidToNameA</a> converts an ANSI interface name to a LUID. 
     * 
     * The maximum length of an interface name, <b>NDIS_IF_MAX_STRING_SIZE</b>, without the terminating <b>NULL</b> is declared in the <i>Ntddndis.h</i> header file. The <b>NDIS_IF_MAX_STRING_SIZE</b> is defined to be the <b>IF_MAX_STRING_SIZE</b> constant defined in the <i>Ifdef.h</i> header file. The <i>Ntddndis.h</i> and <i>Ifdef.h</i> header files are automatically included in the <i>Netioapi.h</i> header file which is automatically included by the <i>Iphlpapi.h</i> header file. The <i>Ntddndis.h</i>, <i>Ifdef.h</i>, and <i> Netioapi.h</i> header files should never be used directly.
     * @param {Pointer<NET_LUID_LH>} InterfaceLuid A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/ifdef/ns-ifdef-net_luid_lh">NET_LUID</a> for a network interface.
     * @param {Pointer<PWSTR>} InterfaceName A pointer to a buffer to hold the <b>NULL</b>-terminated Unicode string containing the interface name when the function returns successfully.
     * @param {Pointer} Length The number of characters in the array pointed to by the <i>InterfaceName</i> parameter. This value must be large enough to accommodate the interface name
     *         and the terminating null character.  The maximum required length is
     *         <b>NDIS_IF_MAX_STRING_SIZE</b> + 1.
     * @returns {Integer} On success, 
     * <b>ConvertInterfaceLuidToNameW</b> returns <b>NETIO_ERROR_SUCCESS</b>. Any nonzero return value indicates failure. 
     * 
     * <table>
     * <tr>
     * <th>Error code</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters was invalid. This error is returned if either the <i>InterfaceLuid</i> or the <i>InterfaceName</i> parameter was <b>NULL</b> or if the <i>InterfaceLuid</i> parameter was invalid.
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
     *  Not enough storage is available to process this command. This error is returned if the size of the buffer pointed to by <i>InterfaceName</i> parameter was not large enough as specified in the <i>Length</i> parameter to hold the interface name.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/netioapi/nf-netioapi-convertinterfaceluidtonamew
     * @since windows6.0.6000
     */
    static ConvertInterfaceLuidToNameW(InterfaceLuid, InterfaceName, Length) {
        result := DllCall("IPHLPAPI.dll\ConvertInterfaceLuidToNameW", "ptr", InterfaceLuid, "ptr", InterfaceName, "ptr", Length, "uint")
        return result
    }

    /**
     * Converts a locally unique identifier (LUID) for a network interface to the local index for the interface.
     * @remarks
     * The <b>ConvertInterfaceLuidToIndex</b> function is available on Windows Vista and later.
     * 
     * The <b>ConvertInterfaceLuidToIndex</b> function is protocol independent and works with network interfaces for both the IPv6 and IPv4 protocol.
     * @param {Pointer<NET_LUID_LH>} InterfaceLuid A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/ifdef/ns-ifdef-net_luid_lh">NET_LUID</a> for a network interface.
     * @param {Pointer<UInt32>} InterfaceIndex The local index  value for the interface.
     * @returns {Integer} On success, 
     * <b>ConvertInterfaceLuidToIndex</b> returns NO_ERROR. Any nonzero return value indicates failure and a <b>NET_IFINDEX_UNSPECIFIED</b> is returned in the <i>InterfaceIndex</i> parameter. 
     * 
     * <table>
     * <tr>
     * <th>Error code</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters was invalid. This error is returned if either the <i>InterfaceLuid</i> or <i>InterfaceIndex</i> parameter was <b>NULL</b> or if the <i>InterfaceLuid</i> parameter was invalid. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/netioapi/nf-netioapi-convertinterfaceluidtoindex
     * @since windows6.0.6000
     */
    static ConvertInterfaceLuidToIndex(InterfaceLuid, InterfaceIndex) {
        result := DllCall("IPHLPAPI.dll\ConvertInterfaceLuidToIndex", "ptr", InterfaceLuid, "ptr", InterfaceIndex, "uint")
        return result
    }

    /**
     * Converts a local index for a network interface to the locally unique identifier (LUID) for the interface.
     * @remarks
     * The <b>ConvertInterfaceIndexToLuid</b> function is available on Windows Vista and later.
     * 
     * The <b>ConvertInterfaceIndexToLuid</b> function is protocol independent and works with network interfaces for both the IPv6 and IPv4 protocol.
     * @param {Integer} InterfaceIndex The local index  value for a network interface.
     * @param {Pointer<NET_LUID_LH>} InterfaceLuid A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ifdef/ns-ifdef-net_luid_lh">NET_LUID</a> for this interface.
     * @returns {Integer} On success, 
     * <b>ConvertInterfaceIndexToLuid</b> returns NO_ERROR. Any nonzero return value indicates failure and a <b>NULL</b> is returned in the <i>InterfaceLuid</i> parameter. 
     * 
     * <table>
     * <tr>
     * <th>Error code</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system cannot find the file specified. This error is returned if the  network interface specified by the <i>InterfaceIndex</i> parameter was not a value on the local machine.
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
     * One of the parameters was invalid. This error is returned if the <i>InterfaceLuid</i> parameter was <b>NULL</b> or if the <i>InterfaceIndex</i> parameter was invalid. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/netioapi/nf-netioapi-convertinterfaceindextoluid
     * @since windows6.0.6000
     */
    static ConvertInterfaceIndexToLuid(InterfaceIndex, InterfaceLuid) {
        result := DllCall("IPHLPAPI.dll\ConvertInterfaceIndexToLuid", "uint", InterfaceIndex, "ptr", InterfaceLuid, "uint")
        return result
    }

    /**
     * Converts a locally unique identifier (LUID) for a network interface to an interface alias.
     * @remarks
     * The <b>ConvertInterfaceLuidToAlias</b> function is available on Windows Vista and later.
     * 
     * The <b>ConvertInterfaceLuidToAlias</b> function is protocol independent and works with network interfaces for both the IPv6 and IPv4 protocol.
     * 
     * The maximum length of the alias name for a network interface, <b>NDIS_IF_MAX_STRING_SIZE</b>, without the terminating <b>NULL</b> is declared in the <i>Ntddndis.h</i> header file. The <b>NDIS_IF_MAX_STRING_SIZE</b> is defined to be the <b>IF_MAX_STRING_SIZE</b> constant defined in the <i>Ifdef.h</i> header file. The <i>Ntddndis.h</i> and <i>Ifdef.h</i> header files are automatically included in the <i>Netioapi.h</i> header file which is automatically included by the <i>Iphlpapi.h</i> header file. The <i>Ntddndis.h</i>, <i>Ifdef.h</i>, and <i> Netioapi.h</i> header files should never be used directly.
     * @param {Pointer<NET_LUID_LH>} InterfaceLuid A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/ifdef/ns-ifdef-net_luid_lh">NET_LUID</a> for a network interface.
     * @param {Pointer<PWSTR>} InterfaceAlias A pointer to a buffer to hold the <b>NULL</b>-terminated Unicode string containing the alias name of the network interface when the function returns successfully.
     * @param {Pointer} Length The length, in characters, of the buffer pointed to by the <i>InterfaceAlias</i> parameter. This value must be large enough to accommodate the alias name of the network interface and the terminating <b>NULL</b> character.  The maximum required length is
     *         <b>NDIS_IF_MAX_STRING_SIZE</b> + 1.
     * @returns {Integer} On success, 
     * <b>ConvertInterfaceLuidToAlias</b> returns NO_ERROR. Any nonzero return value indicates failure. 
     * 
     * <table>
     * <tr>
     * <th>Error code</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters was invalid. This error is returned if either the <i>InterfaceLuid</i> or <i>InterfaceAlias</i> parameter was <b>NULL</b> or if the <i>InterfaceLuid</i> parameter was invalid.
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
     * Not enough storage is available to process this command. This error is returned if the size of the buffer pointed to by the <i>InterfaceAlias</i> parameter was not large enough as specified in the <i>Length</i> parameter to hold the alias name.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/netioapi/nf-netioapi-convertinterfaceluidtoalias
     * @since windows6.0.6000
     */
    static ConvertInterfaceLuidToAlias(InterfaceLuid, InterfaceAlias, Length) {
        result := DllCall("IPHLPAPI.dll\ConvertInterfaceLuidToAlias", "ptr", InterfaceLuid, "ptr", InterfaceAlias, "ptr", Length, "uint")
        return result
    }

    /**
     * Converts an interface alias name for a network interface to the locally unique identifier (LUID) for the interface.
     * @remarks
     * The <b>ConvertInterfaceAliasToLuid</b> function is available on Windows Vista and later.
     * 
     * The <b>ConvertInterfaceAliasToLuid</b> function is protocol independent and works with network interfaces for both the IPv6 and IPv4 protocol.
     * @param {Pointer<PWSTR>} InterfaceAlias A pointer to a <b>NULL</b>-terminated Unicode string containing the alias name of the network interface.
     * @param {Pointer<NET_LUID_LH>} InterfaceLuid A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ifdef/ns-ifdef-net_luid_lh">NET_LUID</a> for this interface.
     * @returns {Integer} On success, 
     * <b>ConvertInterfaceAliasToLuid</b> returns NO_ERROR. Any nonzero return value indicates failure and a <b>NULL</b> is returned in the <i>InterfaceLuid</i> parameter. 
     * 
     * <table>
     * <tr>
     * <th>Error code</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters was invalid. This error is returned if either the <i>InterfaceAlias</i> or <i>InterfaceLuid</i> parameter was <b>NULL</b> or if the <i>InterfaceAlias</i> parameter was invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/netioapi/nf-netioapi-convertinterfacealiastoluid
     * @since windows6.0.6000
     */
    static ConvertInterfaceAliasToLuid(InterfaceAlias, InterfaceLuid) {
        result := DllCall("IPHLPAPI.dll\ConvertInterfaceAliasToLuid", "ptr", InterfaceAlias, "ptr", InterfaceLuid, "uint")
        return result
    }

    /**
     * Converts a locally unique identifier (LUID) for a network interface to a globally unique identifier (GUID) for the interface.
     * @remarks
     * The <b>ConvertInterfaceLuidToGuid</b> function is available on Windows Vista and later.
     * 
     * The <b>ConvertInterfaceLuidToGuid</b> function is protocol independent and works with network interfaces for both the IPv6 and IPv4 protocol.
     * @param {Pointer<NET_LUID_LH>} InterfaceLuid A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/ifdef/ns-ifdef-net_luid_lh">NET_LUID</a> for a network interface.
     * @param {Pointer<Guid>} InterfaceGuid A pointer to the <b>GUID</b> for this interface.
     * @returns {Integer} On success, 
     * <b>ConvertInterfaceLuidToGuid</b> returns NO_ERROR. Any nonzero return value indicates failure and a <b>NULL</b> is returned in the <i>InterfaceGuid</i> parameter. 
     * 
     * <table>
     * <tr>
     * <th>Error code</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters was invalid. This error is returned if either the <i>InterfaceLuid</i> or <i>InterfaceGuid</i> parameter was <b>NULL</b> or if the <i>InterfaceLuid</i> parameter was invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/netioapi/nf-netioapi-convertinterfaceluidtoguid
     * @since windows6.0.6000
     */
    static ConvertInterfaceLuidToGuid(InterfaceLuid, InterfaceGuid) {
        result := DllCall("IPHLPAPI.dll\ConvertInterfaceLuidToGuid", "ptr", InterfaceLuid, "ptr", InterfaceGuid, "uint")
        return result
    }

    /**
     * Converts a globally unique identifier (GUID) for a network interface to the locally unique identifier (LUID) for the interface.
     * @remarks
     * The <b>ConvertInterfaceGuidToLuid</b> function is available on Windows Vista and later.
     * 
     * The <b>ConvertInterfaceGuidToLuid</b> function is protocol independent and works with network interfaces for both the IPv6 and IPv4 protocol.
     * @param {Pointer<Guid>} InterfaceGuid A pointer to a GUID for a network interface.
     * @param {Pointer<NET_LUID_LH>} InterfaceLuid A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ifdef/ns-ifdef-net_luid_lh">NET_LUID</a> for this interface.
     * @returns {Integer} On success, 
     * <b>ConvertInterfaceGuidToLuid</b> returns NO_ERROR. Any nonzero return value indicates failure and a <b>NULL</b> is returned in the <i>InterfaceLuid</i> parameter. 
     * 
     * <table>
     * <tr>
     * <th>Error code</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters was invalid. This error is returned if either the <i>InterfaceAlias</i> or <i>InterfaceLuid</i> parameter was <b>NULL</b> or if the <i>InterfaceGuid</i> parameter was invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/netioapi/nf-netioapi-convertinterfaceguidtoluid
     * @since windows6.0.6000
     */
    static ConvertInterfaceGuidToLuid(InterfaceGuid, InterfaceLuid) {
        result := DllCall("IPHLPAPI.dll\ConvertInterfaceGuidToLuid", "ptr", InterfaceGuid, "ptr", InterfaceLuid, "uint")
        return result
    }

    /**
     * Converts the ANSI interface name for a network interface to the local index for the interface.
     * @remarks
     * The <b>if_nametoindex</b> function is available on Windows Vista and later.
     * 
     * The <b>if_nametoindex</b> function maps an interface name into its corresponding
     *    index. This function is designed as part of basic socket extensions for IPv6 as described by the IETF in RFC 2553. For more information, see <a href="http://tools.ietf.org/html/rfc2553">http://www.ietf.org/rfc/rfc2553.txt</a>. 
     * 
     * The <b>if_nametoindex</b> function is implemented for portability of applications with Unix environments, but the ConvertInterface functions are preferred. The <b>if_nametoindex</b> function can be replaced by a call to the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-convertinterfacenametoluida">ConvertInterfaceNameToLuidA</a> function to convert the ANSI interface name to a  <a href="https://docs.microsoft.com/windows/desktop/api/ifdef/ns-ifdef-net_luid_lh">NET_LUID</a> followed by a call to the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-convertinterfaceluidtoindex">ConvertInterfaceLuidToIndex</a> to convert the NET_LUID to the local interface index.
     * 
     * If the <b>if_nametoindex</b> function fails and returns zero, it is not possible to determine an error code.
     * @param {Pointer<PSTR>} InterfaceName A pointer to a <b>NULL</b>-terminated ANSI string containing the interface name.
     * @returns {Integer} On success, 
     * <b>if_nametoindex</b> returns the local interface index. On failure, zero is returned.
     * @see https://learn.microsoft.com/windows/win32/api/netioapi/nf-netioapi-if_nametoindex
     * @since windows6.0.6000
     */
    static if_nametoindex(InterfaceName) {
        result := DllCall("IPHLPAPI.dll\if_nametoindex", "ptr", InterfaceName, "uint")
        return result
    }

    /**
     * Converts the local index for a network interface to the ANSI interface name.
     * @remarks
     * The <b>if_indextoname</b> function is available on Windows Vista and later.
     * 
     * The <b>if_indextoname</b> function maps an interface index into its corresponding
     *    name. This function is designed as part of basic socket extensions for IPv6 as described by the IETF in RFC 2553. For more information, see <a href="http://tools.ietf.org/html/rfc2553">http://www.ietf.org/rfc/rfc2553.txt</a>. 
     * 
     * The <b>if_indextoname</b> function is implemented for portability of applications with Unix environments, but the ConvertInterface functions are preferred. The <b>if_indextoname</b> function can be replaced by a call to the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-convertinterfaceindextoluid">ConvertInterfaceIndexToLuid</a> function to convert an interface index to a  <a href="https://docs.microsoft.com/windows/desktop/api/ifdef/ns-ifdef-net_luid_lh">NET_LUID</a> followed by a call to the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-convertinterfaceluidtonamea">ConvertInterfaceLuidToNameA</a> to convert the NET_LUID to the ANSI interface name.
     * 
     * If the <b>if_indextoname</b> fails and returns a <b>NULL</b> pointer, it is not possible to determine an error code. 
     * 
     * The length, in bytes, of the buffer pointed to by the <i>InterfaceName</i> parameter must be equal or greater than <b>IF_NAMESIZE</b>, a value declared in the <i>Netioapi.h</i> header file equal to <b>NDIS_IF_MAX_STRING_SIZE</b>. The maximum length of an interface name, <b>NDIS_IF_MAX_STRING_SIZE</b>, without the terminating <b>NULL</b> is declared in the <i>Ntddndis.h</i> header file. The <b>NDIS_IF_MAX_STRING_SIZE</b> is defined to be the <b>IF_MAX_STRING_SIZE</b> constant defined in the <i>Ifdef.h</i> header file. The <i>Ntddndis.h</i> and <i>Ifdef.h</i> header files are automatically included in the <i>Netioapi.h</i> header file which is automatically included by the <i>Iphlpapi.h</i> header file. The <i>Ntddndis.h</i>, <i>Ifdef.h</i>, and <i> Netioapi.h</i> header files should never be used directly.
     * @param {Integer} InterfaceIndex The local index for a network interface.
     * @param {Pointer<PSTR>} InterfaceName A pointer to a buffer to hold the <b>NULL</b>-terminated ANSI string containing the interface name when the function returns successfully. The length, in bytes, of the buffer pointed to by this parameter must be equal to or greater than 
     *         <b>IF_NAMESIZE</b>.
     * @returns {Pointer<PSTR>} On success, 
     * <b>if_indextoname</b> returns a pointer to <b>NULL</b>-terminated ANSI string containing the interface name. On failure, a <b>NULL</b> pointer is returned.
     * @see https://learn.microsoft.com/windows/win32/api/netioapi/nf-netioapi-if_indextoname
     * @since windows6.0.6000
     */
    static if_indextoname(InterfaceIndex, InterfaceName) {
        result := DllCall("IPHLPAPI.dll\if_indextoname", "uint", InterfaceIndex, "ptr", InterfaceName, "ptr")
        return result
    }

    /**
     * Reserved for future use. Do not use this function. (GetCurrentThreadCompartmentId)
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/netioapi/nf-netioapi-getcurrentthreadcompartmentid
     */
    static GetCurrentThreadCompartmentId() {
        result := DllCall("IPHLPAPI.dll\GetCurrentThreadCompartmentId", "uint")
        return result
    }

    /**
     * Reserved for future use. Do not use this function. (SetCurrentThreadCompartmentId)
     * @param {Integer} CompartmentId Reserved.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/netioapi/nf-netioapi-setcurrentthreadcompartmentid
     */
    static SetCurrentThreadCompartmentId(CompartmentId) {
        result := DllCall("IPHLPAPI.dll\SetCurrentThreadCompartmentId", "uint", CompartmentId, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} CompartmentScope 
     * @param {Pointer<UInt32>} CompartmentId 
     * @returns {String} Nothing - always returns an empty string
     */
    static GetCurrentThreadCompartmentScope(CompartmentScope, CompartmentId) {
        DllCall("IPHLPAPI.dll\GetCurrentThreadCompartmentScope", "ptr", CompartmentScope, "ptr", CompartmentId)
    }

    /**
     * 
     * @param {Integer} CompartmentScope 
     * @returns {Integer} 
     */
    static SetCurrentThreadCompartmentScope(CompartmentScope) {
        result := DllCall("IPHLPAPI.dll\SetCurrentThreadCompartmentScope", "uint", CompartmentScope, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} JobHandle 
     * @returns {Integer} 
     */
    static GetJobCompartmentId(JobHandle) {
        result := DllCall("IPHLPAPI.dll\GetJobCompartmentId", "ptr", JobHandle, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} JobHandle 
     * @param {Integer} CompartmentId 
     * @returns {Integer} 
     */
    static SetJobCompartmentId(JobHandle, CompartmentId) {
        result := DllCall("IPHLPAPI.dll\SetJobCompartmentId", "ptr", JobHandle, "uint", CompartmentId, "uint")
        return result
    }

    /**
     * Reserved for future use. Do not use this function. (GetSessionCompartmentId)
     * @param {Integer} SessionId Reserved.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/netioapi/nf-netioapi-getsessioncompartmentid
     */
    static GetSessionCompartmentId(SessionId) {
        result := DllCall("IPHLPAPI.dll\GetSessionCompartmentId", "uint", SessionId, "uint")
        return result
    }

    /**
     * Reserved for future use. Do not use this function. (SetSessionCompartmentId)
     * @param {Integer} SessionId Reserved.
     * @param {Integer} CompartmentId Reserved.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/netioapi/nf-netioapi-setsessioncompartmentid
     */
    static SetSessionCompartmentId(SessionId, CompartmentId) {
        result := DllCall("IPHLPAPI.dll\SetSessionCompartmentId", "uint", SessionId, "uint", CompartmentId, "uint")
        return result
    }

    /**
     * The GetDefaultCompartmentId function retrieves the default network routing compartment identifier for the local computer.
     * @returns {Integer} If the function succeeds, the return value is the default Compartment ID.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NET_IF_COMPARTMENT_ID_UNSPECIFIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function failed to obtain a Compartment ID.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/netioapi/nf-netioapi-getdefaultcompartmentid
     * @since windows10.0.10240
     */
    static GetDefaultCompartmentId() {
        result := DllCall("IPHLPAPI.dll\GetDefaultCompartmentId", "uint")
        return result
    }

    /**
     * Reserved for future use. Do not use this function. (GetNetworkInformation)
     * @param {Pointer<Guid>} NetworkGuid Reserved.
     * @param {Pointer<UInt32>} CompartmentId Reserved.
     * @param {Pointer<UInt32>} SiteId Reserved.
     * @param {Pointer<PWSTR>} NetworkName Reserved.
     * @param {Integer} Length Reserved.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/netioapi/nf-netioapi-getnetworkinformation
     */
    static GetNetworkInformation(NetworkGuid, CompartmentId, SiteId, NetworkName, Length) {
        result := DllCall("IPHLPAPI.dll\GetNetworkInformation", "ptr", NetworkGuid, "ptr", CompartmentId, "ptr", SiteId, "ptr", NetworkName, "uint", Length, "uint")
        return result
    }

    /**
     * Reserved for future use. Do not use this function. (SetNetworkInformation)
     * @param {Pointer<Guid>} NetworkGuid Reserved.
     * @param {Integer} CompartmentId Reserved.
     * @param {Pointer<PWSTR>} NetworkName Reserved.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/netioapi/nf-netioapi-setnetworkinformation
     */
    static SetNetworkInformation(NetworkGuid, CompartmentId, NetworkName) {
        result := DllCall("IPHLPAPI.dll\SetNetworkInformation", "ptr", NetworkGuid, "uint", CompartmentId, "ptr", NetworkName, "uint")
        return result
    }

    /**
     * Converts an IPv4 prefix length to an IPv4 subnet mask.
     * @remarks
     * The <b>ConvertLengthToIpv4Mask</b> function is available on Windows Vista and later.
     * @param {Integer} MaskLength The IPv4 prefix length, in bits.
     * @param {Pointer<UInt32>} Mask A pointer to a <b>LONG</b> value to hold the IPv4 subnet mask when the function returns successfully.
     * @returns {Integer} On success, 
     * <b>ConvertLengthToIpv4Mask</b> returns <b>NO_ERROR</b>. Any nonzero return value indicates failure and the <i>Mask</i> parameter is set to <b>INADDR_NONE</b> defined in the <i>Ws2def.h</i> header file. 
     * 
     * <table>
     * <tr>
     * <th>Error code</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters was invalid. This error is returned if the <i>MaskLength</i> parameter was invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/netioapi/nf-netioapi-convertlengthtoipv4mask
     * @since windows6.0.6000
     */
    static ConvertLengthToIpv4Mask(MaskLength, Mask) {
        result := DllCall("IPHLPAPI.dll\ConvertLengthToIpv4Mask", "uint", MaskLength, "ptr", Mask, "uint")
        return result
    }

    /**
     * Converts an IPv4 subnet mask to an IPv4 prefix length.
     * @remarks
     * The <b>ConvertIpv4MaskToLength</b> function is available on Windows Vista and later.
     * @param {Integer} Mask The IPv4 subnet mask.
     * @param {Pointer<Byte>} MaskLength A pointer to a <b>UINT8</b> value to hold the IPv4 prefix length, in bits, when the function returns successfully.
     * @returns {Integer} On success, 
     * <b>ConvertIpv4MaskToLength</b> returns <b>NO_ERROR</b>. Any nonzero return value indicates failure. 
     * 
     * <table>
     * <tr>
     * <th>Error code</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters was invalid. This error is returned if the <i>Mask</i> parameter was invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/netioapi/nf-netioapi-convertipv4masktolength
     * @since windows6.0.6000
     */
    static ConvertIpv4MaskToLength(Mask, MaskLength) {
        result := DllCall("IPHLPAPI.dll\ConvertIpv4MaskToLength", "uint", Mask, "ptr", MaskLength, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<DNS_SETTINGS>} Settings 
     * @returns {Integer} 
     */
    static GetDnsSettings(Settings) {
        result := DllCall("IPHLPAPI.dll\GetDnsSettings", "ptr", Settings, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<DNS_SETTINGS>} Settings 
     * @returns {String} Nothing - always returns an empty string
     */
    static FreeDnsSettings(Settings) {
        DllCall("IPHLPAPI.dll\FreeDnsSettings", "ptr", Settings)
    }

    /**
     * 
     * @param {Pointer<DNS_SETTINGS>} Settings 
     * @returns {Integer} 
     */
    static SetDnsSettings(Settings) {
        result := DllCall("IPHLPAPI.dll\SetDnsSettings", "ptr", Settings, "uint")
        return result
    }

    /**
     * Retrieves the DNS settings from the interface specified in the *Interface* parameter.
     * @param {Pointer<Guid>} Interface Type: \_In\_ **[GUID](/windows/win32/api/guiddef/ns-guiddef-guid)**
     * 
     * The **GUID** of the COM interface that the settings refer to.
     * @param {Pointer<DNS_INTERFACE_SETTINGS>} Settings Type: \_Inout\_ const **[DNS_INTERFACE_SETTINGS](ns-netioapi-dns_interface_settings.md)\***
     * 
     * **GetInterfaceDnsSettings** populates all the settings in this structure.
     * 
     * You should set only the *Version* member; the *Flags* field must be empty.
     * 
     * If you set the *Version* member to **DNS_INTERFACE_SETTINGS_VERSION1**, then the *Settings* parameter must point to a valid [**DNS_INTERFACE_SETTINGS**](ns-netioapi-dns_interface_settings.md) structure.
     * 
     * If you set the *Version* member to **DNS_INTERFACE_SETTINGS_VERSION3**, then the *Settings* parameter must point to a valid [**DNS_INTERFACE_SETTINGS3**](/windows/win32/api/netioapi/ns-netioapi-dns_interface_settings3) structure.
     * @returns {Integer} Returns **NO_ERROR** if successful. A non-zero return value indicates failure.
     * @see https://learn.microsoft.com/windows/win32/api/netioapi/nf-netioapi-getinterfacednssettings
     */
    static GetInterfaceDnsSettings(Interface, Settings) {
        result := DllCall("IPHLPAPI.dll\GetInterfaceDnsSettings", "ptr", Interface, "ptr", Settings, "uint")
        return result
    }

    /**
     * Frees the settings object returned by [GetInterfaceDnsSettings](/windows/win32/api/netioapi/nf-netioapi-getinterfacednssettings).
     * @param {Pointer<DNS_INTERFACE_SETTINGS>} Settings 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/netioapi/nf-netioapi-freeinterfacednssettings
     */
    static FreeInterfaceDnsSettings(Settings) {
        DllCall("IPHLPAPI.dll\FreeInterfaceDnsSettings", "ptr", Settings)
    }

    /**
     * Sets the per-interface DNS settings specified in the *Settings* parameter.
     * @param {Pointer<Guid>} Interface Type: \_In\_ **[GUID](/windows/win32/api/guiddef/ns-guiddef-guid)**
     * 
     * The **GUID** of the COM interface that the settings refer to.
     * @param {Pointer<DNS_INTERFACE_SETTINGS>} Settings Type: \_In\_ const **[DNS_INTERFACE_SETTINGS](ns-netioapi-dns_interface_settings.md)\***
     * 
     * A pointer to a **DNS_INTERFACE_SETTINGS**-type structure that contains the DNS interface settings.
     * 
     * If this parameter points to a **DNS_INTERFACE_SETTINGS** structure, then the **DNS_INTERFACE_SETTINGS::Version** member must be set to **DNS_INTERFACE_SETTINGS_VERSION1**.
     * 
     * If this parameter points to a **DNS_INTERFACE_SETTINGS3** structure, then the version must to be set to **DNS_INTERFACE_SETTINGS_VERSION3**.
     * 
     * You must set appropriately all the desired options in the **DNS_INTERFACE_SETTINGS::Flags** field, and populate only the fields for which an option was set. You must zero out all other fields that don't have a corresponding option.
     * @returns {Integer} Returns **NO_ERROR** if successful. A non-zero return value indicates failure.
     * @see https://learn.microsoft.com/windows/win32/api/netioapi/nf-netioapi-setinterfacednssettings
     */
    static SetInterfaceDnsSettings(Interface, Settings) {
        result := DllCall("IPHLPAPI.dll\SetInterfaceDnsSettings", "ptr", Interface, "ptr", Settings, "uint")
        return result
    }

    /**
     * Retrieves the aggregate level and cost of network connectivity that an application or service is likely to experience.
     * @param {Pointer<NL_NETWORK_CONNECTIVITY_HINT>} ConnectivityHint A pointer to a value of type [NL_NETWORK_CONNECTIVITY_HINT](../nldef/ns-nldef-nl_network_connectivity_hint.md). The function sets this value to the aggregate connectivity level and cost hints.
     * @returns {Integer} In user mode, returns **NO_ERROR** on success, and a Win32 error code on failure. In kernel mode, returns **STATUS_SUCCESS** on success, and an NTSTATUS error code on failure.
     * @see https://learn.microsoft.com/windows/win32/api/netioapi/nf-netioapi-getnetworkconnectivityhint
     * @since windows10.0.19041
     */
    static GetNetworkConnectivityHint(ConnectivityHint) {
        result := DllCall("IPHLPAPI.dll\GetNetworkConnectivityHint", "ptr", ConnectivityHint, "uint")
        return result
    }

    /**
     * Retrieves the level and cost of network connectivity for the specified interface.
     * @param {Integer} InterfaceIndex A value of type **NET_IFINDEX** representing the index of the interface for which to retrieve connectivity information.
     * @param {Pointer<NL_NETWORK_CONNECTIVITY_HINT>} ConnectivityHint A pointer to a value of type [NL_NETWORK_CONNECTIVITY_HINT](../nldef/ns-nldef-nl_network_connectivity_hint.md). The function sets this value to the connectivity level and cost hints for the specified interface.
     * @returns {Integer} In user mode, returns **NO_ERROR** on success, and a Win32 error code on failure. In kernel mode, returns **STATUS_SUCCESS** on success, and an NTSTATUS error code on failure.
     * @see https://learn.microsoft.com/windows/win32/api/netioapi/nf-netioapi-getnetworkconnectivityhintforinterface
     * @since windows10.0.19041
     */
    static GetNetworkConnectivityHintForInterface(InterfaceIndex, ConnectivityHint) {
        result := DllCall("IPHLPAPI.dll\GetNetworkConnectivityHintForInterface", "uint", InterfaceIndex, "ptr", ConnectivityHint, "uint")
        return result
    }

    /**
     * Registers an application-defined callback function, to be called when the aggregate network connectivity level and cost hints change.
     * @remarks
     * To deregister for change notifications, call the **CancelMibChangeNotify2** function, passing the *NotificationHandle* parameter returned by **NotifyNetworkConnectivityHintChange**.
     * @param {Pointer<PNETWORK_CONNECTIVITY_HINT_CHANGE_CALLBACK>} Callback A function pointer of type [PNETWORK_CONNECTIVITY_HINT_CHANGE_CALLBACK](./nc-netioapi-pnetwork_connectivity_hint_change_callback.md), which points to your application-defined callback function. The callback function will be invoked when a network connectivity level or cost change occurs.
     * @param {Pointer<Void>} CallerContext The user-specific caller context. This context will be supplied to the callback function.
     * @param {Integer} InitialNotification `True` if an initialization notification should be provided, otherwise `false`.
     * @param {Pointer<HANDLE>} NotificationHandle A pointer to a **HANDLE**. The function sets the value to a handle to the notification registration.
     * @returns {Integer} If the function succeeds, the return value is **NO_ERROR**. Otherwise, an error code is returned.
     * @see https://learn.microsoft.com/windows/win32/api/netioapi/nf-netioapi-notifynetworkconnectivityhintchange
     * @since windows10.0.19041
     */
    static NotifyNetworkConnectivityHintChange(Callback, CallerContext, InitialNotification, NotificationHandle) {
        result := DllCall("IPHLPAPI.dll\NotifyNetworkConnectivityHintChange", "ptr", Callback, "ptr", CallerContext, "char", InitialNotification, "ptr", NotificationHandle, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} dwName 
     * @param {Integer} inAction 
     * @param {Integer} outAction 
     * @param {Integer} bUseLog 
     * @param {Integer} bMustBeUnique 
     * @param {Pointer<Void>} ppInterface 
     * @returns {Integer} 
     */
    static PfCreateInterface(dwName, inAction, outAction, bUseLog, bMustBeUnique, ppInterface) {
        result := DllCall("IPHLPAPI.dll\PfCreateInterface", "uint", dwName, "int", inAction, "int", outAction, "int", bUseLog, "int", bMustBeUnique, "ptr", ppInterface, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pInterface 
     * @returns {Integer} 
     */
    static PfDeleteInterface(pInterface) {
        result := DllCall("IPHLPAPI.dll\PfDeleteInterface", "ptr", pInterface, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} ih 
     * @param {Integer} cInFilters 
     * @param {Pointer<PF_FILTER_DESCRIPTOR>} pfiltIn 
     * @param {Integer} cOutFilters 
     * @param {Pointer<PF_FILTER_DESCRIPTOR>} pfiltOut 
     * @param {Pointer<Void>} pfHandle 
     * @returns {Integer} 
     */
    static PfAddFiltersToInterface(ih, cInFilters, pfiltIn, cOutFilters, pfiltOut, pfHandle) {
        result := DllCall("IPHLPAPI.dll\PfAddFiltersToInterface", "ptr", ih, "uint", cInFilters, "ptr", pfiltIn, "uint", cOutFilters, "ptr", pfiltOut, "ptr", pfHandle, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} ih 
     * @param {Integer} cInFilters 
     * @param {Pointer<PF_FILTER_DESCRIPTOR>} pfiltIn 
     * @param {Integer} cOutFilters 
     * @param {Pointer<PF_FILTER_DESCRIPTOR>} pfiltOut 
     * @returns {Integer} 
     */
    static PfRemoveFiltersFromInterface(ih, cInFilters, pfiltIn, cOutFilters, pfiltOut) {
        result := DllCall("IPHLPAPI.dll\PfRemoveFiltersFromInterface", "ptr", ih, "uint", cInFilters, "ptr", pfiltIn, "uint", cOutFilters, "ptr", pfiltOut, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pInterface 
     * @param {Integer} cFilters 
     * @param {Pointer<Void>} pvHandles 
     * @returns {Integer} 
     */
    static PfRemoveFilterHandles(pInterface, cFilters, pvHandles) {
        result := DllCall("IPHLPAPI.dll\PfRemoveFilterHandles", "ptr", pInterface, "uint", cFilters, "ptr", pvHandles, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pInterface 
     * @returns {Integer} 
     */
    static PfUnBindInterface(pInterface) {
        result := DllCall("IPHLPAPI.dll\PfUnBindInterface", "ptr", pInterface, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pInterface 
     * @param {Integer} dwIndex 
     * @param {Integer} pfatLinkType 
     * @param {Pointer<Byte>} LinkIPAddress 
     * @returns {Integer} 
     */
    static PfBindInterfaceToIndex(pInterface, dwIndex, pfatLinkType, LinkIPAddress) {
        result := DllCall("IPHLPAPI.dll\PfBindInterfaceToIndex", "ptr", pInterface, "uint", dwIndex, "int", pfatLinkType, "ptr", LinkIPAddress, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pInterface 
     * @param {Integer} pfatType 
     * @param {Pointer<Byte>} IPAddress 
     * @returns {Integer} 
     */
    static PfBindInterfaceToIPAddress(pInterface, pfatType, IPAddress) {
        result := DllCall("IPHLPAPI.dll\PfBindInterfaceToIPAddress", "ptr", pInterface, "int", pfatType, "ptr", IPAddress, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pInterface 
     * @param {Pointer<PF_LATEBIND_INFO>} pLateBindInfo 
     * @returns {Integer} 
     */
    static PfRebindFilters(pInterface, pLateBindInfo) {
        result := DllCall("IPHLPAPI.dll\PfRebindFilters", "ptr", pInterface, "ptr", pLateBindInfo, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pInterface 
     * @param {Integer} gfFilter 
     * @returns {Integer} 
     */
    static PfAddGlobalFilterToInterface(pInterface, gfFilter) {
        result := DllCall("IPHLPAPI.dll\PfAddGlobalFilterToInterface", "ptr", pInterface, "int", gfFilter, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pInterface 
     * @param {Integer} gfFilter 
     * @returns {Integer} 
     */
    static PfRemoveGlobalFilterFromInterface(pInterface, gfFilter) {
        result := DllCall("IPHLPAPI.dll\PfRemoveGlobalFilterFromInterface", "ptr", pInterface, "int", gfFilter, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} hEvent 
     * @returns {Integer} 
     */
    static PfMakeLog(hEvent) {
        result := DllCall("IPHLPAPI.dll\PfMakeLog", "ptr", hEvent, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pbBuffer 
     * @param {Integer} dwSize 
     * @param {Integer} dwThreshold 
     * @param {Integer} dwEntries 
     * @param {Pointer<UInt32>} pdwLoggedEntries 
     * @param {Pointer<UInt32>} pdwLostEntries 
     * @param {Pointer<UInt32>} pdwSizeUsed 
     * @returns {Integer} 
     */
    static PfSetLogBuffer(pbBuffer, dwSize, dwThreshold, dwEntries, pdwLoggedEntries, pdwLostEntries, pdwSizeUsed) {
        result := DllCall("IPHLPAPI.dll\PfSetLogBuffer", "ptr", pbBuffer, "uint", dwSize, "uint", dwThreshold, "uint", dwEntries, "ptr", pdwLoggedEntries, "ptr", pdwLostEntries, "ptr", pdwSizeUsed, "uint")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    static PfDeleteLog() {
        result := DllCall("IPHLPAPI.dll\PfDeleteLog", "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pInterface 
     * @param {Pointer<PF_INTERFACE_STATS>} ppfStats 
     * @param {Pointer<UInt32>} pdwBufferSize 
     * @param {Integer} fResetCounters 
     * @returns {Integer} 
     */
    static PfGetInterfaceStatistics(pInterface, ppfStats, pdwBufferSize, fResetCounters) {
        result := DllCall("IPHLPAPI.dll\PfGetInterfaceStatistics", "ptr", pInterface, "ptr", ppfStats, "ptr", pdwBufferSize, "int", fResetCounters, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pInInterface 
     * @param {Pointer<Void>} pOutInterface 
     * @param {Integer} cBytes 
     * @param {Pointer<Byte>} pbPacket 
     * @param {Pointer<Int32>} ppAction 
     * @returns {Integer} 
     */
    static PfTestPacket(pInInterface, pOutInterface, cBytes, pbPacket, ppAction) {
        result := DllCall("IPHLPAPI.dll\PfTestPacket", "ptr", pInInterface, "ptr", pOutInterface, "uint", cBytes, "ptr", pbPacket, "ptr", ppAction, "uint")
        return result
    }

;@endregion Methods
}
