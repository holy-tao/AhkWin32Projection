#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include ..\..\Foundation\HANDLE.ahk

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
    static DNS_SETTING_DOT => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_SETTING_DOT_PROFILE => 131072

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
    static DNS_ENCRYPTION_POLICY_NOT_CONFIGURED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ENCRYPTION_POLICY_DISABLE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ENCRYPTION_POLICY_AUTO => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ENCRYPTION_POLICY_REQUIRED => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ENABLE_DDR => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ENABLE_DOT => 128

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_DOT_POLICY_BLOCK => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_DOH_POLICY_BLOCK => 512

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ENABLE_DNR => 1024

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
    static DNS_DOH_SERVER_SETTINGS_MAKE_DDR_NON_BLOCKING => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_DOT_SERVER_SETTINGS_ENABLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_DOT_SERVER_SETTINGS_FALLBACK_TO_UDP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_DOT_AUTO_UPGRADE_SERVER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_DOT_SERVER_SETTINGS_ENABLE_AUTO => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_DOT_SERVER_SETTINGS_ENABLE_DDR => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_DOT_SERVER_SETTINGS_MAKE_DDR_NON_BLOCKING => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_DDR_ADAPTER_ENABLE_DOH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_DDR_ADAPTER_ENABLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_DDR_ADAPTER_ENABLE_UDP_FALLBACK => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_DDR_ADAPTER_MAKE_DDR_NON_BLOCKING => 4

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
     * @returns {HANDLE} The 
     * <b>IcmpCreateFile</b> function returns an open handle on success. On failure, the function returns <b>INVALID_HANDLE_VALUE</b>. Call the 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function for extended error information.
     * @see https://docs.microsoft.com/windows/win32/api//icmpapi/nf-icmpapi-icmpcreatefile
     * @since windows5.0
     */
    static IcmpCreateFile() {
        A_LastError := 0

        result := DllCall("IPHLPAPI.dll\IcmpCreateFile", "ptr")
        if(A_LastError)
            throw OSError()

        return HANDLE({Value: result}, True)
    }

    /**
     * The Icmp6CreateFile function opens a handle on which IPv6 ICMP echo requests can be issued.
     * @returns {HANDLE} The 
     * <b>Icmp6CreateFile</b> function returns an open handle on success. On failure, the function returns <b>INVALID_HANDLE_VALUE</b>. Call the 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function for extended error information.
     * @see https://docs.microsoft.com/windows/win32/api//icmpapi/nf-icmpapi-icmp6createfile
     * @since windows5.1.2600
     */
    static Icmp6CreateFile() {
        A_LastError := 0

        result := DllCall("IPHLPAPI.dll\Icmp6CreateFile", "ptr")
        if(A_LastError)
            throw OSError()

        return HANDLE({Value: result}, True)
    }

    /**
     * The IcmpCloseHandle function closes a handle opened by a call to the IcmpCreateFile or Icmp6CreateFile functions.
     * @param {HANDLE} IcmpHandle The handle to close. This handle must have been returned by a call to <a href="https://docs.microsoft.com/windows/desktop/api/icmpapi/nf-icmpapi-icmpcreatefile">IcmpCreateFile</a> or <a href="https://docs.microsoft.com/windows/desktop/api/icmpapi/nf-icmpapi-icmp6createfile">Icmp6CreateFile</a>.
     * @returns {BOOL} If the handle is closed successfully the return value is <b>TRUE</b>, otherwise <b>FALSE</b>. Call the 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function for extended error information.
     * @see https://docs.microsoft.com/windows/win32/api//icmpapi/nf-icmpapi-icmpclosehandle
     * @since windows5.0
     */
    static IcmpCloseHandle(IcmpHandle) {
        IcmpHandle := IcmpHandle is Win32Handle ? NumGet(IcmpHandle, "ptr") : IcmpHandle

        A_LastError := 0

        result := DllCall("IPHLPAPI.dll\IcmpCloseHandle", "ptr", IcmpHandle, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The IcmpSendEcho function sends an IPv4 ICMP echo request and returns any echo response replies. The call returns when the time-out has expired or the reply buffer is filled.
     * @param {HANDLE} IcmpHandle The open handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/icmpapi/nf-icmpapi-icmpcreatefile">IcmpCreateFile</a> function.
     * @param {Integer} DestinationAddress The IPv4 destination address of the echo request, in the form of an <a href="https://docs.microsoft.com/windows/desktop/api/inaddr/ns-inaddr-in_addr">IPAddr</a> structure.
     * @param {Pointer} RequestData A pointer to a buffer that contains data to send in the request.
     * @param {Integer} RequestSize The size, in bytes, of the request data buffer pointed to by the <i>RequestData</i> parameter.
     * @param {Pointer<IP_OPTION_INFORMATION>} RequestOptions A pointer to the IP header options for the request, in the form of an <a href="https://docs.microsoft.com/windows/desktop/api/ipexport/ns-ipexport-ip_option_information">IP_OPTION_INFORMATION</a> structure. On a 64-bit platform, this parameter is in the form for an <a href="https://docs.microsoft.com/windows/desktop/api/ipexport/ns-ipexport-ip_option_information32">IP_OPTION_INFORMATION32</a> structure.
     * 
     * This parameter may be <b>NULL</b> if no IP header options need to be specified.
     * @param {Pointer} ReplyBuffer A buffer to hold any replies to the echo request. Upon return, the buffer contains an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ipexport/ns-ipexport-icmp_echo_reply">ICMP_ECHO_REPLY</a> structures followed by the options and data for the replies. The buffer should be large enough to hold at least one 
     * <b>ICMP_ECHO_REPLY</b> structure plus <i>RequestSize</i> bytes of data.
     * @param {Integer} ReplySize The allocated size, in bytes,  of the reply buffer. The buffer should be large enough to hold at least one 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ipexport/ns-ipexport-icmp_echo_reply">ICMP_ECHO_REPLY</a> structure plus <i>RequestSize</i> bytes of data.
     * 
     * This buffer should also be large enough to also hold 8 more bytes of data (the size of an ICMP error message).
     * @param {Integer} Timeout The time, in milliseconds, to wait for replies.
     * @returns {Integer} The 
     * 						<b>IcmpSendEcho</b> function returns the number of 
     * <a href="/windows/desktop/api/ipexport/ns-ipexport-icmp_echo_reply">ICMP_ECHO_REPLY</a> structures stored in the <i>ReplyBuffer</i>. The status of each reply is contained in the structure. If the return value is zero, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> for additional error information.
     * 
     * If the function fails, the extended error code returned by <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> can be one of the following values.
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
     * An invalid parameter was passed to the function. This error is returned if the <i>IcmpHandle</i> parameter contains an invalid handle. This error can also be returned if the <i>ReplySize</i> parameter specifies a value less than the size of an <a href="/windows/desktop/api/ipexport/ns-ipexport-icmp_echo_reply">ICMP_ECHO_REPLY</a> structure.
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//icmpapi/nf-icmpapi-icmpsendecho
     * @since windows5.0
     */
    static IcmpSendEcho(IcmpHandle, DestinationAddress, RequestData, RequestSize, RequestOptions, ReplyBuffer, ReplySize, Timeout) {
        IcmpHandle := IcmpHandle is Win32Handle ? NumGet(IcmpHandle, "ptr") : IcmpHandle

        A_LastError := 0

        result := DllCall("IPHLPAPI.dll\IcmpSendEcho", "ptr", IcmpHandle, "uint", DestinationAddress, "ptr", RequestData, "ushort", RequestSize, "ptr", RequestOptions, "ptr", ReplyBuffer, "uint", ReplySize, "uint", Timeout, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The IcmpSendEcho2 function sends an IPv4 ICMP echo request and returns either immediately (if Event or ApcRoutine is non-NULL) or returns after the specified time-out. The ReplyBuffer contains the ICMP echo responses, if any.
     * @param {HANDLE} IcmpHandle The open handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/icmpapi/nf-icmpapi-icmpcreatefile">ICMPCreateFile</a> function.
     * @param {HANDLE} Event An event to be signaled whenever an ICMP response arrives. If this parameter is specified, it requires a handle to a valid event object. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-createeventa">CreateEvent</a> or <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-createeventexa">CreateEventEx</a> function to create this event object. 
     * 
     * For more information on using events, see <a href="https://docs.microsoft.com/windows/desktop/Sync/event-objects">Event Objects</a>.
     * @param {Pointer<PIO_APC_ROUTINE>} ApcRoutine The routine that is called when the calling thread is in an alertable thread and  an ICMPv4 reply arrives. On Windows Vista and later, <b>PIO_APC_ROUTINE_DEFINED</b> must be defined to force the datatype for this parameter to <b>PIO_APC_ROUTINE</b> rather than <b>FARPROC</b>. 
     * 
     * On Windows Server 2003, Windows XP, and Windows 2000, 
     *    <b>PIO_APC_ROUTINE_DEFINED</b> must not be defined to force the datatype for this parameter to <b>FARPROC</b>.
     * @param {Pointer<Void>} ApcContext An optional parameter passed to the callback routine specified in the  <i>ApcRoutine</i> parameter whenever an ICMP response arrives or an error occurs.
     * @param {Integer} DestinationAddress The IPv4 destination of the echo request, in the form of an <a href="https://docs.microsoft.com/windows/desktop/api/inaddr/ns-inaddr-in_addr">IPAddr</a> structure.
     * @param {Pointer} RequestData A pointer to a buffer that contains data to send in the request.
     * @param {Integer} RequestSize The size, in bytes, of the request data buffer pointed to by the <i>RequestData</i> parameter.
     * @param {Pointer<IP_OPTION_INFORMATION>} RequestOptions A pointer to the IP header options for the request, in the form of an <a href="https://docs.microsoft.com/windows/desktop/api/ipexport/ns-ipexport-ip_option_information">IP_OPTION_INFORMATION</a> structure. On a 64-bit platform, this parameter is in the form for an <a href="https://docs.microsoft.com/windows/desktop/api/ipexport/ns-ipexport-ip_option_information32">IP_OPTION_INFORMATION32</a> structure.
     * 
     * This parameter may be <b>NULL</b> if no IP header options need to be specified.
     * @param {Pointer} ReplyBuffer A pointer to a buffer to hold any replies to the request. Upon return, the buffer contains an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ipexport/ns-ipexport-icmp_echo_reply">ICMP_ECHO_REPLY</a> structures followed by options and data. The buffer must be large enough to hold at least one 
     * <b>ICMP_ECHO_REPLY</b> structure plus <i>RequestSize</i> bytes of data.
     * 
     * This buffer should also be large enough to also hold 8 more bytes of data (the size of an ICMP error message) plus space for an <b>IO_STATUS_BLOCK</b> structure.
     * @param {Integer} ReplySize The allocated size, in bytes,  of the reply buffer. The buffer should be large enough to hold at least one 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ipexport/ns-ipexport-icmp_echo_reply">ICMP_ECHO_REPLY</a> structure plus <i>RequestSize</i> bytes of data.
     * 
     * This buffer should also be large enough to also hold 8 more bytes of data (the size of an ICMP error message) plus space for an <b>IO_STATUS_BLOCK</b> structure.
     * @param {Integer} Timeout The time, in milliseconds, to wait for replies.
     * @returns {Integer} When called synchronously, the <b>IcmpSendEcho2</b> function returns the number of replies received and stored in <i>ReplyBuffer</i>. If the return value is zero, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> for extended error information.
     * 
     * When called asynchronously, the <b>IcmpSendEcho2</b> function returns ERROR_IO_PENDING to indicate the operation is in progress. The results can be retrieved later when the event specified in the <i>Event</i> parameter signals or the callback function in the <i>ApcRoutine</i> parameter is called.
     * 
     * If the return value is zero, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> for extended error information.
     * 
     * If the function fails, the extended error code returned by <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> can be one of the following values.
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
     * An invalid parameter was passed to the function. This error is returned if the <i>IcmpHandle</i> parameter contains an invalid handle. This error can also be returned if the <i>ReplySize</i> parameter specifies a value less than the size of an <a href="/windows/desktop/api/ipexport/ns-ipexport-icmp_echo_reply">ICMP_ECHO_REPLY</a> structure.
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
     * The operation is in progress. This value is returned by a successful asynchronous call to <a href="/windows/desktop/api/icmpapi/nf-icmpapi-icmpsendecho2">IcmpSendEcho2</a> and is not an indication of an error.  
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//icmpapi/nf-icmpapi-icmpsendecho2
     * @since windows5.0
     */
    static IcmpSendEcho2(IcmpHandle, Event, ApcRoutine, ApcContext, DestinationAddress, RequestData, RequestSize, RequestOptions, ReplyBuffer, ReplySize, Timeout) {
        IcmpHandle := IcmpHandle is Win32Handle ? NumGet(IcmpHandle, "ptr") : IcmpHandle
        Event := Event is Win32Handle ? NumGet(Event, "ptr") : Event

        ApcContextMarshal := ApcContext is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("IPHLPAPI.dll\IcmpSendEcho2", "ptr", IcmpHandle, "ptr", Event, "ptr", ApcRoutine, ApcContextMarshal, ApcContext, "uint", DestinationAddress, "ptr", RequestData, "ushort", RequestSize, "ptr", RequestOptions, "ptr", ReplyBuffer, "uint", ReplySize, "uint", Timeout, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sends an IPv4 ICMP echo request and returns either immediately (if Event or ApcRoutine is non-NULL) or returns after the specified time-out. The ReplyBuffer contains the ICMP responses, if any.
     * @param {HANDLE} IcmpHandle An open handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/icmpapi/nf-icmpapi-icmpcreatefile">ICMPCreateFile</a> function.
     * @param {HANDLE} Event An event to be signaled whenever an ICMP response arrives. If this parameter is specified, it requires a handle to a valid event object. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-createeventa">CreateEvent</a> or <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-createeventexa">CreateEventEx</a> function to create this event object. 
     * 
     * For more information on using events, see <a href="https://docs.microsoft.com/windows/desktop/Sync/event-objects">Event Objects</a>.
     * @param {Pointer<PIO_APC_ROUTINE>} ApcRoutine The routine that is called when the calling thread is in an alertable thread and  an ICMP reply arrives. <b>PIO_APC_ROUTINE_DEFINED</b> must be defined to force the datatype for this parameter to <b>PIO_APC_ROUTINE</b> rather than <b>FARPROC</b>.
     * @param {Pointer<Void>} ApcContext An optional parameter passed to the callback routine specified in the  <i>ApcRoutine</i> parameter whenever an ICMP response arrives or an error occurs.
     * @param {Integer} SourceAddress The IPv4 source address on which to issue the echo request. This address is in the form of an <a href="https://docs.microsoft.com/windows/desktop/api/inaddr/ns-inaddr-in_addr">IPAddr</a> structure.
     * @param {Integer} DestinationAddress The IPv4 destination address for the echo request. This address is in the form of an <a href="https://docs.microsoft.com/windows/desktop/api/inaddr/ns-inaddr-in_addr">IPAddr</a> structure.
     * @param {Pointer} RequestData A pointer to a buffer that contains data to send in the request.
     * @param {Integer} RequestSize The size, in bytes, of the request data buffer pointed to by the <i>RequestData</i> parameter.
     * @param {Pointer<IP_OPTION_INFORMATION>} RequestOptions A pointer to the IP header options for the request, in the form of an <a href="https://docs.microsoft.com/windows/desktop/api/ipexport/ns-ipexport-ip_option_information">IP_OPTION_INFORMATION</a> structure. On a 64-bit platform, this parameter is in the form for an <a href="https://docs.microsoft.com/windows/desktop/api/ipexport/ns-ipexport-ip_option_information32">IP_OPTION_INFORMATION32</a> structure.
     * 
     * This parameter may be <b>NULL</b> if no IP header options need to be specified.
     * @param {Pointer} ReplyBuffer A pointer to a buffer to hold any replies to the request. Upon return, the buffer contains an array of 
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
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> for extended error information.
     * 
     * When called asynchronously, the <b>IcmpSendEcho2Ex</b> function returns ERROR_IO_PENDING  to indicate the operation is in progress. The results can be retrieved later when the event specified in the <i>Event</i> parameter signals or the callback function in the <i>ApcRoutine</i> parameter is called.
     * 
     * If the return value is zero, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> for extended error information.
     * 
     * If the function fails, the extended error code returned by <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> can be one of the following values.
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
     * An invalid parameter was passed to the function. This error is returned if the <i>IcmpHandle</i> parameter contains an invalid handle. This error can also be returned if the <i>ReplySize</i> parameter specifies a value less than the size of an <a href="/windows/desktop/api/ipexport/ns-ipexport-icmp_echo_reply">ICMP_ECHO_REPLY</a> structure.
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
     * The operation is in progress. This value is returned by a successful asynchronous call to <a href="/windows/desktop/api/icmpapi/nf-icmpapi-icmpsendecho2ex">IcmpSendEcho2Ex</a> and is not an indication of an error.  
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//icmpapi/nf-icmpapi-icmpsendecho2ex
     * @since windows6.0.6000
     */
    static IcmpSendEcho2Ex(IcmpHandle, Event, ApcRoutine, ApcContext, SourceAddress, DestinationAddress, RequestData, RequestSize, RequestOptions, ReplyBuffer, ReplySize, Timeout) {
        IcmpHandle := IcmpHandle is Win32Handle ? NumGet(IcmpHandle, "ptr") : IcmpHandle
        Event := Event is Win32Handle ? NumGet(Event, "ptr") : Event

        ApcContextMarshal := ApcContext is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("IPHLPAPI.dll\IcmpSendEcho2Ex", "ptr", IcmpHandle, "ptr", Event, "ptr", ApcRoutine, ApcContextMarshal, ApcContext, "uint", SourceAddress, "uint", DestinationAddress, "ptr", RequestData, "ushort", RequestSize, "ptr", RequestOptions, "ptr", ReplyBuffer, "uint", ReplySize, "uint", Timeout, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The Icmp6SendEcho2 function sends an IPv6 ICMPv6 echo request and returns either immediately (if Event or ApcRoutine is non-NULL) or returns after the specified time-out. The ReplyBuffer contains the IPv6 ICMPv6 echo response, if any.
     * @param {HANDLE} IcmpHandle The open handle returned by <a href="https://docs.microsoft.com/windows/desktop/api/icmpapi/nf-icmpapi-icmp6createfile">Icmp6CreateFile</a>.
     * @param {HANDLE} Event An event to be signaled whenever an ICMPv6 response arrives. If this parameter is specified, it requires a handle to a valid event object. Use the 
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
     * @param {Pointer} RequestData A pointer to a buffer that contains data to send in the request.
     * @param {Integer} RequestSize The size, in bytes, of the request data buffer pointed to by the <i>RequestData</i> parameter.
     * @param {Pointer<IP_OPTION_INFORMATION>} RequestOptions A pointer to the IPv6 header options for the request, in the form of an <a href="https://docs.microsoft.com/windows/desktop/api/ipexport/ns-ipexport-ip_option_information">IP_OPTION_INFORMATION</a> structure. On a 64-bit platform, this parameter is in the form for an <a href="https://docs.microsoft.com/windows/desktop/api/ipexport/ns-ipexport-ip_option_information32">IP_OPTION_INFORMATION32</a> structure.
     * 
     * This parameter may be NULL if no IP header options need to be specified.
     * 
     * <div class="alert"><b>Note</b>  On Windows Server 2003 and Windows XP, the <i>RequestOptions</i> parameter is not optional and must not be NULL and only the <b>Ttl</b> and <b>Flags</b> members are used.</div>
     * <div> </div>
     * @param {Pointer} ReplyBuffer A pointer to a buffer to hold replies to the request. Upon return, the buffer contains an <a href="https://docs.microsoft.com/windows/desktop/api/ipexport/ns-ipexport-icmpv6_echo_reply_lh">ICMPV6_ECHO_REPLY</a> structure followed by the message body from the ICMPv6 echo response reply data. The buffer must be large enough to hold at least one 
     * <b>ICMPV6_ECHO_REPLY</b> structure plus the number of bytes of data specified in the <i>RequestSize</i> parameter. This buffer should also be large enough to also hold 8 more bytes of data (the size of an ICMP error message) plus space for an <b>IO_STATUS_BLOCK</b> structure.
     * @param {Integer} ReplySize The size, in bytes,  of the reply buffer pointed to by the <i>ReplyBuffer</i> parameter. This buffer should be large enough to hold at least one 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ipexport/ns-ipexport-icmpv6_echo_reply_lh">ICMPV6_ECHO_REPLY</a> structure plus <i>RequestSize</i> bytes of data. This buffer should also be large enough to also hold 8 more bytes of data (the size of an ICMP error message) plus space for an <b>IO_STATUS_BLOCK</b> structure.
     * @param {Integer} Timeout The time, in milliseconds, to wait for replies. This parameter is only used if the <b>Icmp6SendEcho2</b> function is called synchronously. So this parameter is not used if either the <i>ApcRoutine</i> or <i>Event</i>parameter are not <b>NULL</b>.
     * @returns {Integer} When called synchronously, the <b>Icmp6SendEcho2</b> function returns the number of replies received and stored in <i>ReplyBuffer</i>. If the return value is zero, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> for extended error information.
     * 
     * When called asynchronously, the <b>Icmp6SendEcho2</b> function returns ERROR_IO_PENDING  to indicate the operation is in progress. The results can be retrieved later when the event specified in the <i>Event</i> parameter signals or the callback function in the <i>ApcRoutine</i> parameter is called.
     * 
     * If the return value is zero, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> for extended error information.
     * 
     * If the function fails, the extended error code returned by <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> can be one of the following values.
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
     * The operation is in progress. This value is returned by a successful asynchronous call to <a href="/windows/desktop/api/icmpapi/nf-icmpapi-icmp6sendecho2">Icmp6SendEcho2</a> and is not an indication of an error.  
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//icmpapi/nf-icmpapi-icmp6sendecho2
     * @since windows5.1.2600
     */
    static Icmp6SendEcho2(IcmpHandle, Event, ApcRoutine, ApcContext, SourceAddress, DestinationAddress, RequestData, RequestSize, RequestOptions, ReplyBuffer, ReplySize, Timeout) {
        IcmpHandle := IcmpHandle is Win32Handle ? NumGet(IcmpHandle, "ptr") : IcmpHandle
        Event := Event is Win32Handle ? NumGet(Event, "ptr") : Event

        ApcContextMarshal := ApcContext is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("IPHLPAPI.dll\Icmp6SendEcho2", "ptr", IcmpHandle, "ptr", Event, "ptr", ApcRoutine, ApcContextMarshal, ApcContext, "ptr", SourceAddress, "ptr", DestinationAddress, "ptr", RequestData, "ushort", RequestSize, "ptr", RequestOptions, "ptr", ReplyBuffer, "uint", ReplySize, "uint", Timeout, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Parses the reply buffer provided and returns the number of ICMP echo request responses found.
     * @param {Pointer} ReplyBuffer The buffer passed to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/icmpapi/nf-icmpapi-icmpsendecho2">IcmpSendEcho2</a>. This is rewritten to hold an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ipexport/ns-ipexport-icmp_echo_reply">ICMP_ECHO_REPLY</a> structures, its type is <b>PICMP_ECHO_REPLY</b>. 
     * 
     * On a 64-bit plaform, this buffer is rewritten to hold an array of <a href="https://docs.microsoft.com/windows/desktop/api/ipexport/ns-ipexport-icmp_echo_reply32">ICMP_ECHO_REPLY32</a> structures, its type is <b>PICMP_ECHO_REPLY32</b>.
     * @param {Integer} ReplySize The size, in bytes, of the buffer pointed to by the <i>ReplyBuffer</i> parameter.
     * @returns {Integer} The 
     * <b>IcmpParseReplies</b> function returns the number of ICMP responses found on success. The function returns zero on error. Call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> for additional error information.
     * @see https://docs.microsoft.com/windows/win32/api//icmpapi/nf-icmpapi-icmpparsereplies
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
     * @param {Pointer} ReplyBuffer A pointer to the buffer passed to 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/icmpapi/nf-icmpapi-icmp6sendecho2">Icmp6SendEcho2</a> function. This parameter is points to an <a href="https://docs.microsoft.com/windows/desktop/api/ipexport/ns-ipexport-icmpv6_echo_reply_lh">ICMPV6_ECHO_REPLY</a> structure to hold the response.
     * @param {Integer} ReplySize The size, in bytes, of the buffer pointed to by the <i>ReplyBuffer</i> parameter.
     * @returns {Integer} The <b>Icmp6ParseReplies</b> function returns 1 on success. In this case, the <b>Status</b> member in the <a href="/windows/desktop/api/ipexport/ns-ipexport-icmpv6_echo_reply_lh">ICMPV6_ECHO_REPLY</a> structure pointed to by the <i>ReplyBuffer</i> parameter will be either <b>IP_SUCCESS</b> if the target node responded or <b>IP_TTL_EXPIRED_TRANSIT</b>.
     * 
     * If the return value is zero, extended error information is available through 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//icmpapi/nf-icmpapi-icmp6parsereplies
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
     * @param {Pointer<Integer>} pdwNumIf Pointer to a <b>DWORD</b> variable that receives the number of interfaces on the local computer.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, use 
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-getnumberofinterfaces
     * @since windows5.0
     */
    static GetNumberOfInterfaces(pdwNumIf) {
        pdwNumIfMarshal := pdwNumIf is VarRef ? "uint*" : "ptr"

        result := DllCall("IPHLPAPI.dll\GetNumberOfInterfaces", pdwNumIfMarshal, pdwNumIf, "uint")
        return result
    }

    /**
     * The GetIfEntry function retrieves information for the specified interface on the local computer.
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
     * The data is invalid. This error is returned if the  network interface index specified by the <b>dwIndex</b>  member of the <a href="/windows/desktop/api/ifmib/ns-ifmib-mib_ifrow">MIB_IFROW</a> structure pointed to by the <i>pIfRow</i> parameter is not a valid interface index on the local computer.  
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
     * The specified interface could not be found. This error is returned if the  network interface index specified by the <b>dwIndex</b>  member of the <a href="/windows/desktop/api/ifmib/ns-ifmib-mib_ifrow">MIB_IFROW</a> structure pointed to by the <i>pIfRow</i> parameter could not be found.  
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-getifentry
     * @since windows5.0
     */
    static GetIfEntry(pIfRow) {
        result := DllCall("IPHLPAPI.dll\GetIfEntry", "ptr", pIfRow, "uint")
        return result
    }

    /**
     * The GetIfTable function retrieves the MIB-II interface table.
     * @param {Pointer} pIfTable A pointer to a buffer that receives the interface table as a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ifmib/ns-ifmib-mib_iftable">MIB_IFTABLE</a> structure.
     * @param {Pointer<Integer>} pdwSize On input, specifies the size in bytes of the buffer pointed to by the <i>pIfTable</i> parameter.
     * 
     * On output, if the buffer is not large enough to hold the returned interface table, the function sets this parameter equal to the required buffer size in bytes.
     * @param {BOOL} bOrder A Boolean value that specifies whether the returned interface table should be sorted in ascending order by interface index. If this parameter is <b>TRUE</b>, the table is sorted.
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
     * <a href="/windows/desktop/api/iphlpapi/nf-iphlpapi-getiftable">GetIfTable</a> is unable to write to the memory pointed to by the <i>pdwSize</i> parameter.
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
     * the <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-getiftable
     * @since windows5.0
     */
    static GetIfTable(pIfTable, pdwSize, bOrder) {
        pdwSizeMarshal := pdwSize is VarRef ? "uint*" : "ptr"

        result := DllCall("IPHLPAPI.dll\GetIfTable", "ptr", pIfTable, pdwSizeMarshal, pdwSize, "int", bOrder, "uint")
        return result
    }

    /**
     * The GetIpAddrTable function retrieves the interface�to�IPv4 address mapping table.
     * @param {Pointer} pIpAddrTable A pointer to a buffer that receives the interface–to–IPv4 address mapping table as a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipaddrtable">MIB_IPADDRTABLE</a> structure.
     * @param {Pointer<Integer>} pdwSize On input, specifies the size in bytes  of the buffer pointed to by the <i>pIpAddrTable</i> parameter. 
     * 
     * 
     * 
     * 
     * On output, if the buffer is not large enough to hold the returned mapping table, the function sets this parameter equal to the required buffer size in bytes.
     * @param {BOOL} bOrder If this parameter is <b>TRUE</b>, then
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
     * <a href="/windows/desktop/api/iphlpapi/nf-iphlpapi-getipaddrtable">GetIpAddrTable</a> is unable to write to the memory pointed to by the <i>pdwSize</i> parameter.
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-getipaddrtable
     * @since windows5.0
     */
    static GetIpAddrTable(pIpAddrTable, pdwSize, bOrder) {
        pdwSizeMarshal := pdwSize is VarRef ? "uint*" : "ptr"

        result := DllCall("IPHLPAPI.dll\GetIpAddrTable", "ptr", pIpAddrTable, pdwSizeMarshal, pdwSize, "int", bOrder, "uint")
        return result
    }

    /**
     * The GetIpNetTable function retrieves the IPv4 to physical address mapping table.
     * @param {Pointer} IpNetTable A pointer to a buffer that receives the IPv4 to physical address mapping table as a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipnettable">MIB_IPNETTABLE</a> structure.
     * @param {Pointer<Integer>} SizePointer On input, specifies the size in bytes of the buffer pointed to by the <i>pIpNetTable</i> parameter.
     * 
     * On output, if the buffer is not large enough to hold the returned mapping table, the function sets this parameter equal to the required buffer size in bytes.
     * @param {BOOL} Order A Boolean value that specifies whether the returned mapping table should be sorted in ascending order by IP address. If this parameter is <b>TRUE</b>, the table is sorted.
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
     * <a href="/windows/desktop/api/iphlpapi/nf-iphlpapi-getipnettable">GetIpNetTable</a> is unable to write to the memory pointed to by the <i>pdwSize</i> parameter.
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
     * There is no data to return. The IPv4 to physical address mapping table is empty. This return value indicates that the call to the <a href="/windows/desktop/api/iphlpapi/nf-iphlpapi-getipnettable">GetIpNetTable</a> function succeeded, but there was no data to return.
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-getipnettable
     * @since windows5.0
     */
    static GetIpNetTable(IpNetTable, SizePointer, Order) {
        SizePointerMarshal := SizePointer is VarRef ? "uint*" : "ptr"

        result := DllCall("IPHLPAPI.dll\GetIpNetTable", "ptr", IpNetTable, SizePointerMarshal, SizePointer, "int", Order, "uint")
        return result
    }

    /**
     * The GetIpForwardTable function retrieves the IPv4 routing table.
     * @param {Pointer} pIpForwardTable A pointer to a buffer that receives the IPv4 routing table as a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipforwardtable">MIB_IPFORWARDTABLE</a> structure.
     * @param {Pointer<Integer>} pdwSize On input, specifies the size in bytes  of the buffer pointed to by the <i>pIpForwardTable</i> parameter. 
     * 
     * 
     * 
     * 
     * On output, if the buffer is not large enough to hold the returned routing table, the function sets this parameter equal to the required buffer size in bytes.
     * @param {BOOL} bOrder A Boolean value that specifies whether the returned table should be sorted. If this parameter is <b>TRUE</b>, the table is sorted in the order of: 
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
     * <a href="/windows/desktop/api/iphlpapi/nf-iphlpapi-getipforwardtable">GetIpForwardTable</a> is unable to write to the memory pointed to by the <i>pdwSize</i> parameter.
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-getipforwardtable
     * @since windows5.0
     */
    static GetIpForwardTable(pIpForwardTable, pdwSize, bOrder) {
        pdwSizeMarshal := pdwSize is VarRef ? "uint*" : "ptr"

        result := DllCall("IPHLPAPI.dll\GetIpForwardTable", "ptr", pIpForwardTable, pdwSizeMarshal, pdwSize, "int", bOrder, "uint")
        return result
    }

    /**
     * Retrieves the IPv4 TCP connection table.
     * @param {Pointer} TcpTable A pointer to a buffer that receives the TCP connection table as a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tcpmib/ns-tcpmib-mib_tcptable">MIB_TCPTABLE</a> structure.
     * @param {Pointer<Integer>} SizePointer On input, specifies the size in  bytes  of the buffer pointed to by the <i>pTcpTable</i> parameter.
     * 
     * On output, if the buffer is not large enough to hold the returned connection table, the function sets this parameter equal to the required buffer size in bytes.
     * 
     * On the Windows SDK released for Windows Vista and later, the data type for this parameter is changed to a <b>PULONG</b> which is equivalent to a <b>PDWORD</b>.
     * @param {BOOL} Order A Boolean value that specifies whether the TCP connection table should be sorted. If this parameter is <b>TRUE</b>, the table is sorted in the order of: 
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
     * <a href="/windows/desktop/api/iphlpapi/nf-iphlpapi-gettcptable">GetTcpTable</a> is unable to write to the memory pointed to by the <i>pdwSize</i> parameter.
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-gettcptable
     * @since windows5.0
     */
    static GetTcpTable(TcpTable, SizePointer, Order) {
        SizePointerMarshal := SizePointer is VarRef ? "uint*" : "ptr"

        result := DllCall("IPHLPAPI.dll\GetTcpTable", "ptr", TcpTable, SizePointerMarshal, SizePointer, "int", Order, "uint")
        return result
    }

    /**
     * Retrieves a table that contains a list of TCP endpoints available to the application.
     * @param {Pointer} pTcpTable A pointer to the table structure that contains the filtered TCP endpoints available to the application. For information about how to determine the type of table returned based on specific input parameter combinations, see the Remarks section later in this document.
     * @param {Pointer<Integer>} pdwSize The estimated size of the structure returned in <i>pTcpTable</i>, in bytes. If this value is set too small, <b>ERROR_INSUFFICIENT_BUFFER</b> is returned by this function, and this field will contain the correct size of the structure.
     * @param {BOOL} bOrder A value that specifies whether the TCP connection table should be sorted. If this parameter is set to <b>TRUE</b>, the TCP endpoints in the table are sorted in ascending order, starting with the lowest local IP address. If this parameter is set to <b>FALSE</b>, the TCP endpoints in the table appear in the order in which they were retrieved.
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
     * An invalid parameter was passed to the function. This error is returned if the <i>TableClass</i> parameter contains a value that is not defined in the <a href="/windows/desktop/api/iprtrmib/ne-iprtrmib-tcp_table_class">TCP_TABLE_CLASS</a> enumeration.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-getextendedtcptable
     * @since windows6.0.6000
     */
    static GetExtendedTcpTable(pTcpTable, pdwSize, bOrder, ulAf, TableClass, Reserved) {
        pdwSizeMarshal := pdwSize is VarRef ? "uint*" : "ptr"

        result := DllCall("IPHLPAPI.dll\GetExtendedTcpTable", "ptr", pTcpTable, pdwSizeMarshal, pdwSize, "int", bOrder, "uint", ulAf, "int", TableClass, "uint", Reserved, "uint")
        return result
    }

    /**
     * Retrieves data about the module that issued the context bind for a specific IPv4 TCP endpoint in a MIB table row.
     * @param {Pointer<MIB_TCPROW_OWNER_MODULE>} pTcpEntry A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/tcpmib/ns-tcpmib-mib_tcprow_owner_module">MIB_TCPROW_OWNER_MODULE</a> structure that contains the IPv4 TCP endpoint entry used to obtain the owner module.
     * @param {Integer} Class A <a href="https://docs.microsoft.com/windows/desktop/api/iprtrmib/ne-iprtrmib-tcpip_owner_module_info_class">TCPIP_OWNER_MODULE_INFO_CLASS</a> enumeration value that indicates the type of data to obtain regarding the owner module. The <b>TCPIP_OWNER_MODULE_INFO_CLASS</b> enumeration is defined in the <i>Iprtrmib.h</i> header file.
     * 
     *  This parameter must be set to <b>TCPIP_OWNER_MODULE_INFO_BASIC</b>.
     * @param {Pointer} pBuffer A pointer a buffer that contains a <a href="https://docs.microsoft.com/windows/desktop/api/iprtrmib/ns-iprtrmib-tcpip_owner_module_basic_info">TCPIP_OWNER_MODULE_BASIC_INFO</a> structure with the owner module data. The type of data returned in this buffer is indicated by the value of the <i>Class</i> parameter. 
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
     * @param {Pointer<Integer>} pdwSize The estimated size, in  bytes, of the structure returned in <i>Buffer</i>. If this value is set too small, <b>ERROR_INSUFFICIENT_BUFFER</b> is returned by this function, and this field will contain the correct size of the buffer. The size required is the size of the corresponding structure plus an additional number of bytes equal to the length of data pointed to in the structure (for example, the name and path strings).
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
     * A element was no found. This value is returned if the <b>dwOwningPid</b> member of the <a href="/windows/desktop/api/tcpmib/ns-tcpmib-mib_tcprow_owner_module">MIB_TCPROW_OWNER_MODULE</a> structure pointed to by the <i>pTcpEntry</i> parameter was zero or could not be found. 
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
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-getownermodulefromtcpentry
     * @since windows6.0.6000
     */
    static GetOwnerModuleFromTcpEntry(pTcpEntry, Class, pBuffer, pdwSize) {
        pdwSizeMarshal := pdwSize is VarRef ? "uint*" : "ptr"

        result := DllCall("IPHLPAPI.dll\GetOwnerModuleFromTcpEntry", "ptr", pTcpEntry, "int", Class, "ptr", pBuffer, pdwSizeMarshal, pdwSize, "uint")
        return result
    }

    /**
     * Retrieves the IPv4 User Datagram Protocol (UDP) listener table.
     * @param {Pointer} UdpTable A pointer to a buffer that receives the IPv4 UDP listener table as a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/udpmib/ns-udpmib-mib_udptable">MIB_UDPTABLE</a> structure.
     * @param {Pointer<Integer>} SizePointer On input, specifies the size in bytes of the buffer pointed to by the <i>UdpTable</i> parameter. 
     * 
     * 
     * 
     * 
     * On output, if the buffer is not large enough to hold the returned listener table, the function sets this parameter equal to the required buffer size in bytes.
     * 
     * On the Windows SDK released for Windows Vista and later, the data type for this parameter is changed to a <b>PULONG</b> which is equivalent to a <b>PDWORD</b>.
     * @param {BOOL} Order A Boolean value that specifies whether the returned UDP listener table should be sorted. If this parameter is <b>TRUE</b>, the table is sorted in the order of: 
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
     * <a href="/windows/desktop/api/iphlpapi/nf-iphlpapi-getudptable">GetUdpTable</a> is unable to write to the memory pointed to by the <i>pdwSize</i> parameter.
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-getudptable
     * @since windows5.0
     */
    static GetUdpTable(UdpTable, SizePointer, Order) {
        SizePointerMarshal := SizePointer is VarRef ? "uint*" : "ptr"

        result := DllCall("IPHLPAPI.dll\GetUdpTable", "ptr", UdpTable, SizePointerMarshal, SizePointer, "int", Order, "uint")
        return result
    }

    /**
     * Retrieves a table that contains a list of UDP endpoints available to the application.
     * @param {Pointer} pUdpTable A pointer to the table structure that contains the filtered UDP endpoints available to the application.   For information about how to determine the type of table returned based on specific input parameter combinations, see the Remarks section later in this document.
     * @param {Pointer<Integer>} pdwSize The estimated size of the structure returned in <i>pUdpTable</i>, in bytes. If this value is set too small, <b>ERROR_INSUFFICIENT_BUFFER</b> is returned by this function, and this field will contain the correct size of the structure.
     * @param {BOOL} bOrder A value that specifies whether the UDP endpoint table should be sorted. If this parameter is set to <b>TRUE</b>, the UDP endpoints in the table are sorted in ascending order, starting with the lowest local IP address. If this parameter is set to <b>FALSE</b>, the UDP endpoints in the table appear in the order in which they were retrieved.
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
     * An invalid parameter was passed to the function. This error is returned if the <i>TableClass</i> parameter contains a value that is not defined in the  <a href="/windows/desktop/api/iprtrmib/ne-iprtrmib-udp_table_class">UDP_TABLE_CLASS</a> enumeration.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-getextendedudptable
     * @since windows6.0.6000
     */
    static GetExtendedUdpTable(pUdpTable, pdwSize, bOrder, ulAf, TableClass, Reserved) {
        pdwSizeMarshal := pdwSize is VarRef ? "uint*" : "ptr"

        result := DllCall("IPHLPAPI.dll\GetExtendedUdpTable", "ptr", pUdpTable, pdwSizeMarshal, pdwSize, "int", bOrder, "uint", ulAf, "int", TableClass, "uint", Reserved, "uint")
        return result
    }

    /**
     * Retrieves data about the module that issued the context bind for a specific IPv4 UDP endpoint in a MIB table row.
     * @param {Pointer<MIB_UDPROW_OWNER_MODULE>} pUdpEntry A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/udpmib/ns-udpmib-mib_udprow_owner_module">MIB_UDPROW_OWNER_MODULE</a> structure that contains the IPv4 UDP endpoint entry used to obtain the owner module.
     * @param {Integer} Class A <a href="https://docs.microsoft.com/windows/desktop/api/iprtrmib/ne-iprtrmib-tcpip_owner_module_info_class">TCPIP_OWNER_MODULE_INFO_CLASS</a> enumeration value that indicates the type of data to obtain regarding the owner module.
     * @param {Pointer} pBuffer The buffer that contains a <a href="https://docs.microsoft.com/windows/desktop/api/iprtrmib/ns-iprtrmib-tcpip_owner_module_basic_info">TCPIP_OWNER_MODULE_BASIC_INFO</a> structure with the owner module data. The type of data returned in this buffer is indicated by the value of the <i>Class</i> parameter.
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
     * @param {Pointer<Integer>} pdwSize The estimated size, in bytes, of the structure returned in <i>Buffer</i>. If this value is set too small, <b>ERROR_INSUFFICIENT_BUFFER</b> is returned by this function, and this field will contain the correct structure size.
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
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-getownermodulefromudpentry
     * @since windows6.0.6000
     */
    static GetOwnerModuleFromUdpEntry(pUdpEntry, Class, pBuffer, pdwSize) {
        pdwSizeMarshal := pdwSize is VarRef ? "uint*" : "ptr"

        result := DllCall("IPHLPAPI.dll\GetOwnerModuleFromUdpEntry", "ptr", pUdpEntry, "int", Class, "ptr", pBuffer, pdwSizeMarshal, pdwSize, "uint")
        return result
    }

    /**
     * Retrieves the IPv4 TCP connection table.
     * @param {Pointer} TcpTable A pointer to a buffer that receives the TCP connection table as a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tcpmib/ns-tcpmib-mib_tcptable2">MIB_TCPTABLE2</a> structure.
     * @param {Pointer<Integer>} SizePointer On input, specifies the size of the buffer pointed to by the <i>TcpTable</i> parameter. 
     * 
     * 
     * 
     * 
     * On output, if the buffer is not large enough to hold the returned connection table, the function sets this parameter equal to the required buffer size.
     * @param {BOOL} Order A value that specifies whether the TCP connection table should be sorted. If this parameter is <b>TRUE</b>, the table is sorted in the order of: 
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
     * <a href="/windows/desktop/api/iphlpapi/nf-iphlpapi-gettcptable2">GetTcpTable2</a> is unable to write to the memory pointed to by the <i>SizePointer</i> parameter.
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-gettcptable2
     * @since windows6.0.6000
     */
    static GetTcpTable2(TcpTable, SizePointer, Order) {
        SizePointerMarshal := SizePointer is VarRef ? "uint*" : "ptr"

        result := DllCall("IPHLPAPI.dll\GetTcpTable2", "ptr", TcpTable, SizePointerMarshal, SizePointer, "int", Order, "uint")
        return result
    }

    /**
     * Retrieves the TCP connection table for IPv6.
     * @param {Pointer} TcpTable A pointer to a buffer that receives the TCP connection table for IPv6 as a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tcpmib/ns-tcpmib-mib_tcp6table">MIB_TCP6TABLE</a> structure.
     * @param {Pointer<Integer>} SizePointer On input, specifies the size in bytes of the buffer pointed to by the <i>TcpTable</i> parameter.
     * 
     * On output, if the buffer is not large enough to hold the returned TCP connection table, the function sets this parameter equal to the required buffer size in bytes.
     * @param {BOOL} Order A Boolean value that specifies whether the TCP connection table should be sorted. If this parameter is <b>TRUE</b>, the table is sorted in ascending order, starting with the lowest local IP address.  If this parameter is <b>FALSE</b>, the table appears in the order in which they were retrieved.
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
     * <a href="/windows/desktop/api/iphlpapi/nf-iphlpapi-gettcp6table">GetTcp6Table</a> is unable to write to the memory pointed to by the <i>SizePointer</i> parameter.
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-gettcp6table
     * @since windows6.0.6000
     */
    static GetTcp6Table(TcpTable, SizePointer, Order) {
        SizePointerMarshal := SizePointer is VarRef ? "uint*" : "ptr"

        result := DllCall("IPHLPAPI.dll\GetTcp6Table", "ptr", TcpTable, SizePointerMarshal, SizePointer, "int", Order, "uint")
        return result
    }

    /**
     * Retrieves the TCP connection table for IPv6.
     * @param {Pointer} TcpTable A pointer to a buffer that receives the TCP connection table for IPv6 as a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tcpmib/ns-tcpmib-mib_tcp6table2">MIB_TCP6TABLE2</a> structure.
     * @param {Pointer<Integer>} SizePointer On input, specifies the size of the buffer pointed to by the <i>TcpTable</i> parameter. 
     * 
     * 
     * 
     * 
     * On output, if the buffer is not large enough to hold the returned TCP connection table, the function sets this parameter equal to the required buffer size.
     * @param {BOOL} Order A value that specifies whether the TCP connection table should be sorted. If this parameter is <b>TRUE</b>, the table is sorted in ascending order, starting with the lowest local IP address.  If this parameter is <b>FALSE</b>, the table appears in the order in which they were retrieved.
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
     * <a href="/windows/desktop/api/iphlpapi/nf-iphlpapi-gettcp6table2">GetTcp6Table2</a> is unable to write to the memory pointed to by the <i>SizePointer</i> parameter.
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-gettcp6table2
     * @since windows6.0.6000
     */
    static GetTcp6Table2(TcpTable, SizePointer, Order) {
        SizePointerMarshal := SizePointer is VarRef ? "uint*" : "ptr"

        result := DllCall("IPHLPAPI.dll\GetTcp6Table2", "ptr", TcpTable, SizePointerMarshal, SizePointer, "int", Order, "uint")
        return result
    }

    /**
     * Retrieves extended statistics for an IPv4 TCP connection.
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
     * @param {Pointer} Rw A pointer to a buffer to receive the read/write information. This parameter may be a <b>NULL</b> pointer if an application does not want to retrieve read/write information for the TCP connection.
     * @param {Integer} RwVersion The version of the read/write information requested. The current supported value is a version of zero.
     * @param {Integer} RwSize The size, in bytes, of the buffer pointed to by <i>Rw</i> parameter.
     * @param {Pointer} Ros A pointer to a buffer to receive read-only static information. This parameter may be a <b>NULL</b> pointer if an application does not want to retrieve read-only static information for the TCP connection.
     * @param {Integer} RosVersion The version of the read-only static information requested. The current supported value is a version of zero.
     * @param {Integer} RosSize The size, in bytes, of the buffer pointed to by the <i>Ros</i> parameter.
     * @param {Pointer} Rod A pointer to a buffer to receive read-only dynamic information. This parameter may be a <b>NULL</b> pointer if an application does not want to retrieve read-only dynamic information  for the TCP connection.
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-getpertcpconnectionestats
     * @since windows6.0.6000
     */
    static GetPerTcpConnectionEStats(Row, EstatsType, Rw, RwVersion, RwSize, Ros, RosVersion, RosSize, Rod, RodVersion, RodSize) {
        result := DllCall("IPHLPAPI.dll\GetPerTcpConnectionEStats", "ptr", Row, "int", EstatsType, "ptr", Rw, "uint", RwVersion, "uint", RwSize, "ptr", Ros, "uint", RosVersion, "uint", RosSize, "ptr", Rod, "uint", RodVersion, "uint", RodSize, "uint")
        return result
    }

    /**
     * Sets a value in the read/write information for an IPv4 TCP connection. This function is used to enable or disable extended statistics for an IPv4 TCP connection.
     * @param {Pointer<MIB_TCPROW_LH>} Row A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/tcpmib/ns-tcpmib-mib_tcprow_lh">MIB_TCPROW</a> structure for an IPv4 TCP connection.
     * @param {Integer} EstatsType The type of extended statistics for TCP to set. This parameter determines the data and format of information that is expected in the <i>Rw</i> parameter.
     * 
     * This parameter can be one of the values from the <a href="https://docs.microsoft.com/windows/win32/api/tcpestats/ne-tcpestats-tcp_estats_type">TCP_ESTATS_TYPE</a> enumeration type defined in the <i>Tcpestats.h</i> header file.
     * @param {Pointer} Rw A pointer to a buffer that contains the read/write information to set. The buffer should contain a value from the <a href="https://docs.microsoft.com/windows/win32/api/tcpestats/ne-tcpestats-tcp_boolean_optional">TCP_BOOLEAN_OPTIONAL</a> enumeration for each structure member that specifies how each member should be updated.
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
     * <a href="/windows/win32/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-setpertcpconnectionestats
     * @since windows6.0.6000
     */
    static SetPerTcpConnectionEStats(Row, EstatsType, Rw, RwVersion, RwSize, Offset) {
        result := DllCall("IPHLPAPI.dll\SetPerTcpConnectionEStats", "ptr", Row, "int", EstatsType, "ptr", Rw, "uint", RwVersion, "uint", RwSize, "uint", Offset, "uint")
        return result
    }

    /**
     * Retrieves extended statistics for an IPv6 TCP connection.
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
     * @param {Pointer} Rw A pointer to a buffer to receive the read/write information. This parameter may be a <b>NULL</b> pointer if an application does not want to retrieve read/write information for the TCP connection.
     * @param {Integer} RwVersion The version of the read/write information requested. The current supported value is a version of zero.
     * @param {Integer} RwSize The size, in bytes, of the buffer pointed to by <i>Rw</i> parameter.
     * @param {Pointer} Ros A pointer to a buffer to receive read-only static information. This parameter may be a <b>NULL</b> pointer if an application does not want to retrieve read-only static information for the TCP connection.
     * @param {Integer} RosVersion The version of the read-only static information requested. The current supported value is a version of zero.
     * @param {Integer} RosSize The size, in bytes, of the buffer pointed to by the <i>Ros</i> parameter.
     * @param {Pointer} Rod A pointer to a buffer to receive read-only dynamic information. This parameter may be a <b>NULL</b> pointer if an application does not want to retrieve read-only dynamic information  for the TCP connection.
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-getpertcp6connectionestats
     * @since windows6.0.6000
     */
    static GetPerTcp6ConnectionEStats(Row, EstatsType, Rw, RwVersion, RwSize, Ros, RosVersion, RosSize, Rod, RodVersion, RodSize) {
        result := DllCall("IPHLPAPI.dll\GetPerTcp6ConnectionEStats", "ptr", Row, "int", EstatsType, "ptr", Rw, "uint", RwVersion, "uint", RwSize, "ptr", Ros, "uint", RosVersion, "uint", RosSize, "ptr", Rod, "uint", RodVersion, "uint", RodSize, "uint")
        return result
    }

    /**
     * Sets a value in the read/write information for an IPv6 TCP connection. This function is used to enable or disable extended statistics for an IPv6 TCP connection.
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
     * @param {Pointer} Rw A pointer to a buffer that contains the read/write information to set. The buffer should contain a value from the <a href="https://docs.microsoft.com/windows/desktop/api/tcpestats/ne-tcpestats-tcp_boolean_optional">TCP_BOOLEAN_OPTIONAL</a> enumeration for each structure member that specifies how each member should be updated.
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-setpertcp6connectionestats
     * @since windows6.0.6000
     */
    static SetPerTcp6ConnectionEStats(Row, EstatsType, Rw, RwVersion, RwSize, Offset) {
        result := DllCall("IPHLPAPI.dll\SetPerTcp6ConnectionEStats", "ptr", Row, "int", EstatsType, "ptr", Rw, "uint", RwVersion, "uint", RwSize, "uint", Offset, "uint")
        return result
    }

    /**
     * Retrieves data about the module that issued the context bind for a specific IPv6 TCP endpoint in a MIB table row.
     * @param {Pointer<MIB_TCP6ROW_OWNER_MODULE>} pTcpEntry A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/tcpmib/ns-tcpmib-mib_tcp6row_owner_module">MIB_TCP6ROW_OWNER_MODULE</a> structure that contains the IPv6 TCP endpoint entry used to obtain the owner module.
     * @param {Integer} Class A <a href="https://docs.microsoft.com/windows/desktop/api/iprtrmib/ne-iprtrmib-tcpip_owner_module_info_class">TCPIP_OWNER_MODULE_INFO_CLASS</a> enumeration value that indicates the type of data to obtain regarding the owner module. The <b>TCPIP_OWNER_MODULE_INFO_CLASS</b> enumeration is defined in the <i>Iprtrmib.h</i> header file.
     * 
     *  This parameter must be set to <b>TCPIP_OWNER_MODULE_INFO_BASIC</b>.
     * @param {Pointer} pBuffer A pointer to a buffer that contains a <a href="https://docs.microsoft.com/windows/desktop/api/iprtrmib/ns-iprtrmib-tcpip_owner_module_basic_info">TCPIP_OWNER_MODULE_BASIC_INFO</a> structure with the owner module data. The type of data returned in this buffer is indicated by the value of the <i>Class</i> parameter.
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
     * @param {Pointer<Integer>} pdwSize The estimated size of the structure returned in <i>Buffer</i>, in bytes. If this value is set too small, <b>ERROR_INSUFFICIENT_BUFFER</b> is returned by this function, and this field will contain the correct structure size.
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
     * The element was not found. This value is returned if the  <b>dwOwningPid</b> member of the <a href="/windows/desktop/api/tcpmib/ns-tcpmib-mib_tcp6row_owner_module">MIB_TCP6ROW_OWNER_MODULE</a> pointed to by the <i>pTcpEntry</i> parameter was zero or could not be found. 
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
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-getownermodulefromtcp6entry
     * @since windows6.0.6000
     */
    static GetOwnerModuleFromTcp6Entry(pTcpEntry, Class, pBuffer, pdwSize) {
        pdwSizeMarshal := pdwSize is VarRef ? "uint*" : "ptr"

        result := DllCall("IPHLPAPI.dll\GetOwnerModuleFromTcp6Entry", "ptr", pTcpEntry, "int", Class, "ptr", pBuffer, pdwSizeMarshal, pdwSize, "uint")
        return result
    }

    /**
     * Retrieves the IPv6 User Datagram Protocol (UDP) listener table.
     * @param {Pointer} Udp6Table A pointer to a buffer that receives the IPv6 UDP listener table as a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/udpmib/ns-udpmib-mib_udp6table">MIB_UDP6TABLE</a> structure.
     * @param {Pointer<Integer>} SizePointer On input, specifies the size in bytes of the buffer pointed to by the <i>Udp6Table</i> parameter. 
     * 
     * 
     * 
     * 
     * On output, if the buffer is not large enough to hold the returned listener table, the function sets this parameter equal to the required buffer size in bytes.
     * @param {BOOL} Order A Boolean value that specifies whether the returned UDP listener table should be sorted. If this parameter is <b>TRUE</b>, the table is sorted in the order of: 
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
     * <a href="/windows/desktop/api/iphlpapi/nf-iphlpapi-getudp6table">GetUdp6Table</a> is unable to write to the memory pointed to by the <i>SizePointer</i> parameter.
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-getudp6table
     * @since windows6.0.6000
     */
    static GetUdp6Table(Udp6Table, SizePointer, Order) {
        SizePointerMarshal := SizePointer is VarRef ? "uint*" : "ptr"

        result := DllCall("IPHLPAPI.dll\GetUdp6Table", "ptr", Udp6Table, SizePointerMarshal, SizePointer, "int", Order, "uint")
        return result
    }

    /**
     * Retrieves data about the module that issued the context bind for a specific IPv6 UDP endpoint in a MIB table row.
     * @param {Pointer<MIB_UDP6ROW_OWNER_MODULE>} pUdpEntry A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/udpmib/ns-udpmib-mib_udp6row_owner_module">MIB_UDP6ROW_OWNER_MODULE</a> structure that contains the IPv6 UDP endpoint entry used to obtain the owner module.
     * @param {Integer} Class <a href="https://docs.microsoft.com/windows/desktop/api/iprtrmib/ne-iprtrmib-tcpip_owner_module_info_class">TCPIP_OWNER_MODULE_INFO_CLASS</a> enumeration value that indicates the type of data to obtain regarding the owner module.
     * @param {Pointer} pBuffer The buffer that contains a <a href="https://docs.microsoft.com/windows/desktop/api/iprtrmib/ns-iprtrmib-tcpip_owner_module_basic_info">TCPIP_OWNER_MODULE_BASIC_INFO</a> structure with the owner module data. The type of data returned in this buffer is indicated by the value of the <i>Class</i> parameter.
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
     * @param {Pointer<Integer>} pdwSize The estimated size, in bytes, of the structure returned in <i>Buffer</i>. If this value is set too small, <b>ERROR_INSUFFICIENT_BUFFER</b> is returned by this function, and this field will contain the correct size of the structure.
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
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-getownermodulefromudp6entry
     * @since windows6.0.6000
     */
    static GetOwnerModuleFromUdp6Entry(pUdpEntry, Class, pBuffer, pdwSize) {
        pdwSizeMarshal := pdwSize is VarRef ? "uint*" : "ptr"

        result := DllCall("IPHLPAPI.dll\GetOwnerModuleFromUdp6Entry", "ptr", pUdpEntry, "int", Class, "ptr", pBuffer, pdwSizeMarshal, pdwSize, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} ulPid 
     * @param {Pointer<Integer>} pInfo 
     * @param {Integer} Class 
     * @param {Pointer} pBuffer 
     * @param {Pointer<Integer>} pdwSize 
     * @returns {Integer} 
     */
    static GetOwnerModuleFromPidAndInfo(ulPid, pInfo, Class, pBuffer, pdwSize) {
        pInfoMarshal := pInfo is VarRef ? "uint*" : "ptr"
        pdwSizeMarshal := pdwSize is VarRef ? "uint*" : "ptr"

        result := DllCall("IPHLPAPI.dll\GetOwnerModuleFromPidAndInfo", "uint", ulPid, pInfoMarshal, pInfo, "int", Class, "ptr", pBuffer, pdwSizeMarshal, pdwSize, "uint")
        return result
    }

    /**
     * The GetIpStatistics function retrieves the IP statistics for the current computer.
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
     * <a href="/windows/desktop/api/iphlpapi/nf-iphlpapi-getipstatistics">GetIpStatistics</a> is unable to write to the memory pointed to by the <i>pStats</i> parameter.
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
     * the <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-getipstatistics
     * @since windows5.0
     */
    static GetIpStatistics(Statistics) {
        result := DllCall("IPHLPAPI.dll\GetIpStatistics", "ptr", Statistics, "uint")
        return result
    }

    /**
     * The GetIcmpStatistics function retrieves the Internet Control Message Protocol (ICMP) for IPv4 statistics for the local computer.
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
     * <a href="/windows/desktop/api/iphlpapi/nf-iphlpapi-geticmpstatistics">GetIcmpStatistics</a> is unable to write to the memory pointed to by the <i>pStats</i> parameter.
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
     * the <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-geticmpstatistics
     * @since windows5.0
     */
    static GetIcmpStatistics(Statistics) {
        result := DllCall("IPHLPAPI.dll\GetIcmpStatistics", "ptr", Statistics, "uint")
        return result
    }

    /**
     * The GetTcpStatistics function retrieves the TCP statistics for the local computer.
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
     * <a href="/windows/desktop/api/iphlpapi/nf-iphlpapi-gettcpstatistics">GetTcpStatistics</a> is unable to write to the memory pointed to by the <i>pStats</i> parameter.
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
     * the <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-gettcpstatistics
     * @since windows5.0
     */
    static GetTcpStatistics(Statistics) {
        result := DllCall("IPHLPAPI.dll\GetTcpStatistics", "ptr", Statistics, "uint")
        return result
    }

    /**
     * The GetUdpStatistics function retrieves the User Datagram Protocol (UDP) statistics for the local computer.
     * @param {Pointer<MIB_UDPSTATS>} Stats Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/udpmib/ns-udpmib-mib_udpstats">MIB_UDPSTATS</a> structure that receives the UDP statistics for the local computer.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, use 
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-getudpstatistics
     * @since windows5.0
     */
    static GetUdpStatistics(Stats) {
        result := DllCall("IPHLPAPI.dll\GetUdpStatistics", "ptr", Stats, "uint")
        return result
    }

    /**
     * Toggles IP forwarding on or off and sets the default time-to-live (TTL) value for the local computer.
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
     * An invalid parameter was passed to the function. This error is returned if a <b>NULL</b> pointer is passed in the <i>pIpStats</i> parameter or the <i>Family</i> parameter was not set to <b>AF_INET</b>, and <b>AF_INET6</b>. This error is also returned if the <b>dwForwarding</b> member in the <a href="/windows/desktop/api/ipmib/ns-ipmib-mib_ipstats_lh">MIB_IPSTATS</a> structure pointed to by the <i>pIpStats</i> parameter contains a value other than <b>MIB_IP_NOT_FORWARDING</b>, <b>MIB_IP_FORWARDING</b>, or <b>MIB_USE_CURRENT_FORWARDING</b>.
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-setipstatisticsex
     * @since windows6.0.6000
     */
    static SetIpStatisticsEx(Statistics, Family) {
        result := DllCall("IPHLPAPI.dll\SetIpStatisticsEx", "ptr", Statistics, "uint", Family, "uint")
        return result
    }

    /**
     * The GetIpStatisticsEx function retrieves the Internet Protocol (IP) statistics for the current computer.
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-getipstatisticsex
     * @since windows5.1.2600
     */
    static GetIpStatisticsEx(Statistics, Family) {
        result := DllCall("IPHLPAPI.dll\GetIpStatisticsEx", "ptr", Statistics, "uint", Family, "uint")
        return result
    }

    /**
     * The GetIcmpStatisticsEx function retrieves Internet Control Message Protocol (ICMP) statistics for the local computer. The GetIcmpStatisticsEx function is capable of retrieving IPv6 ICMP statistics.
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-geticmpstatisticsex
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-gettcpstatisticsex
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-getudpstatisticsex
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-gettcpstatisticsex2
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-getudpstatisticsex2
     * @since windows10.0.16299
     */
    static GetUdpStatisticsEx2(Statistics, Family) {
        result := DllCall("IPHLPAPI.dll\GetUdpStatisticsEx2", "ptr", Statistics, "uint", Family, "uint")
        return result
    }

    /**
     * The SetIfEntry function sets the administrative status of an interface.
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
     * The system cannot find the file specified. This error is returned on Windows Vista and later if the  network interface specified by the <b>dwIndex</b>  member of the <a href="/windows/desktop/api/ifmib/ns-ifmib-mib_ifrow">MIB_IFROW</a> structure pointed to by the <i>pIfRow</i> parameter could not be found.
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
     * An invalid parameter was passed to the function. This error is returned if a <b>NULL</b> pointer is passed in the <i>pIfRow</i> parameter, or the <b>dwIndex</b>  member of the <a href="/windows/desktop/api/ifmib/ns-ifmib-mib_ifrow">MIB_IFROW</a> pointed to by the <i>pIfRow</i> parameter was unspecified. This error is also returned on Windows Server 2003 and earlier if the  network interface specified by the <b>dwIndex</b>  member of the <b>MIB_IFROW</b> structure pointed to by the <i>pIfRow</i> parameter could not be found.  
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-setifentry
     * @since windows5.0
     */
    static SetIfEntry(pIfRow) {
        result := DllCall("IPHLPAPI.dll\SetIfEntry", "ptr", pIfRow, "uint")
        return result
    }

    /**
     * The CreateIpForwardEntry function creates a route in the local computer's IPv4 routing table.
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
     * <a href="/windows/desktop/api/ipmib/ns-ipmib-mib_ipforwardrow">MIB_IPFORWARDROW</a> was not set to <b>MIB_IPPROTO_NETMGMT</b>, the <b>dwForwardMask</b> member of the <b>PMIB_IPFORWARDROW</b> structure is not a valid IPv4 subnet mask, or one of the other members of the 
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-createipforwardentry
     * @since windows5.0
     */
    static CreateIpForwardEntry(pRoute) {
        result := DllCall("IPHLPAPI.dll\CreateIpForwardEntry", "ptr", pRoute, "uint")
        return result
    }

    /**
     * The SetIpForwardEntry function modifies an existing route in the local computer's IPv4 routing table.
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
     * The system cannot find the file specified. This error is returned on Windows Vista and later if the  network interface specified by the <b>dwForwardIfIndex</b>  member of the <a href="/windows/desktop/api/ipmib/ns-ipmib-mib_ipforwardrow">MIB_IPFORWARDROW</a> structure pointed to by the <i>pRoute</i> parameter could not be found.
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
     * The <i>pRoute</i> parameter is <b>NULL</b>, or <a href="/windows/desktop/api/iphlpapi/nf-iphlpapi-setipforwardentry">SetIpForwardEntry</a> is unable to read from the memory pointed to by <i>pRoute</i>, or one of the members of the 
     * <a href="/windows/desktop/api/ipmib/ns-ipmib-mib_ipforwardrow">MIB_IPFORWARDROW</a> structure is invalid.
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
     * The element is not found. The error is returned on Windows Vista and later when the <a href="/windows/desktop/api/iphlpapi/nf-iphlpapi-deleteipforwardentry">DeleteIpForwardEntry</a> function and then the <a href="/windows/desktop/api/iphlpapi/nf-iphlpapi-setipforwardentry">SetIpForwardEntry</a> function are called for the same IPv4 route table entry. 
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-setipforwardentry
     * @since windows5.0
     */
    static SetIpForwardEntry(pRoute) {
        result := DllCall("IPHLPAPI.dll\SetIpForwardEntry", "ptr", pRoute, "uint")
        return result
    }

    /**
     * Deletes an existing route in the local computer's IPv4 routing table.
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
     * An input parameter is invalid, no action was taken. This error is returned if the <b>pRoute</b> parameter is <b>NULL</b>, the <b>dwForwardMask</b> member of the <a href="/windows/desktop/api/ipmib/ns-ipmib-mib_ipforwardrow">PMIB_IPFORWARDROW</a> structure is not a valid IPv4 subnet mask, the <b>dwForwardIfIndex</b> member is <b>NULL</b>, or one of the other members of the 
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-deleteipforwardentry
     * @since windows5.0
     */
    static DeleteIpForwardEntry(pRoute) {
        result := DllCall("IPHLPAPI.dll\DeleteIpForwardEntry", "ptr", pRoute, "uint")
        return result
    }

    /**
     * The SetIpStatistics function toggles IP forwarding on or off and sets the default time-to-live (TTL) value for the local computer.
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
     * An invalid parameter was passed to the function. This error is returned if a <b>NULL</b> pointer is passed in the <i>pIpStats</i> parameter. This error is also returned if the <b>dwForwarding</b> member in the <a href="/windows/desktop/api/ipmib/ns-ipmib-mib_ipstats_lh">MIB_IPSTATS</a> structure pointed to by the <i>pIpStats</i> parameter contains a value other than <b>MIB_IP_NOT_FORWARDING</b>, <b>MIB_IP_FORWARDING</b>, or <b>MIB_USE_CURRENT_FORWARDING</b>.
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-setipstatistics
     * @since windows5.0
     */
    static SetIpStatistics(pIpStats) {
        result := DllCall("IPHLPAPI.dll\SetIpStatistics", "ptr", pIpStats, "uint")
        return result
    }

    /**
     * The SetIpTTL function sets the default time-to-live (TTL) value for the local computer.
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-setipttl
     * @since windows5.0
     */
    static SetIpTTL(nTTL) {
        result := DllCall("IPHLPAPI.dll\SetIpTTL", "uint", nTTL, "uint")
        return result
    }

    /**
     * The CreateIpNetEntry function creates an Address Resolution Protocol (ARP) entry in the ARP table on the local computer.
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
     * <a href="/windows/desktop/api/ipmib/ns-ipmib-mib_ipnetrow_lh">MIB_IPNETROW</a> is set to zero or a value greater than 8, the <b>&gt;dwAddr</b> member of the <b>MIB_IPNETROW</b> structure is invalid, or one of the other members of the 
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-createipnetentry
     * @since windows5.0
     */
    static CreateIpNetEntry(pArpEntry) {
        result := DllCall("IPHLPAPI.dll\CreateIpNetEntry", "ptr", pArpEntry, "uint")
        return result
    }

    /**
     * The SetIpNetEntry function modifies an existing ARP entry in the ARP table on the local computer.
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
     * <a href="/windows/desktop/api/ipmib/ns-ipmib-mib_ipnetrow_lh">MIB_IPNETROW</a> structure is invalid.
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-setipnetentry
     * @since windows5.0
     */
    static SetIpNetEntry(pArpEntry) {
        result := DllCall("IPHLPAPI.dll\SetIpNetEntry", "ptr", pArpEntry, "uint")
        return result
    }

    /**
     * The DeleteIpNetEntry function deletes an ARP entry from the ARP table on the local computer.
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
     * An input parameter is invalid, no action was taken.  This error is returned if the <i>pArpEntry</i> parameter is <b>NULL</b> or a member in the <a href="/windows/desktop/api/ipmib/ns-ipmib-mib_ipnetrow_lh">MIB_IPNETROW</a> structure pointed to by the <i>pArpEntry</i> parameter is invalid.
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-deleteipnetentry
     * @since windows5.0
     */
    static DeleteIpNetEntry(pArpEntry) {
        result := DllCall("IPHLPAPI.dll\DeleteIpNetEntry", "ptr", pArpEntry, "uint")
        return result
    }

    /**
     * The FlushIpNetTable function deletes all ARP entries for the specified interface from the ARP table on the local computer.
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-flushipnettable
     * @since windows5.0
     */
    static FlushIpNetTable(dwIfIndex) {
        result := DllCall("IPHLPAPI.dll\FlushIpNetTable", "uint", dwIfIndex, "uint")
        return result
    }

    /**
     * The CreateProxyArpEnry function creates a Proxy Address Resolution Protocol (PARP) entry on the local computer for the specified IPv4 address.
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-createproxyarpentry
     * @since windows5.0
     */
    static CreateProxyArpEntry(dwAddress, dwMask, dwIfIndex) {
        result := DllCall("IPHLPAPI.dll\CreateProxyArpEntry", "uint", dwAddress, "uint", dwMask, "uint", dwIfIndex, "uint")
        return result
    }

    /**
     * The DeleteProxyArpEntry function deletes the PARP entry on the local computer specified by the dwAddress and dwIfIndex parameters.
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-deleteproxyarpentry
     * @since windows5.0
     */
    static DeleteProxyArpEntry(dwAddress, dwMask, dwIfIndex) {
        result := DllCall("IPHLPAPI.dll\DeleteProxyArpEntry", "uint", dwAddress, "uint", dwMask, "uint", dwIfIndex, "uint")
        return result
    }

    /**
     * The SetTcpEntry function sets the state of a TCP connection.
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
     * An input parameter is invalid, no action was taken.  This error is returned if the <i>pTcpRow</i> parameter is <b>NULL</b> or the <b>Row</b> member in the <a href="/windows/desktop/api/tcpmib/ns-tcpmib-mib_tcprow_lh">MIB_TCPROW</a> structure pointed to by the <i>pTcpRow</i> parameter is not set to MIB_TCP_STATE_DELETE_TCB.
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-settcpentry
     * @since windows5.0
     */
    static SetTcpEntry(pTcpRow) {
        result := DllCall("IPHLPAPI.dll\SetTcpEntry", "ptr", pTcpRow, "uint")
        return result
    }

    /**
     * The GetInterfaceInfo function obtains the list of the network interface adapters with IPv4 enabled on the local system.
     * @param {Pointer} pIfTable A pointer to a buffer that specifies an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ipexport/ns-ipexport-ip_interface_info">IP_INTERFACE_INFO</a> structure that receives the list of adapters. This buffer must be allocated by the caller.
     * @param {Pointer<Integer>} dwOutBufLen A pointer to a <b>DWORD</b> variable that specifies the size of the 
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
     * An invalid parameter was passed to the function. This error is returned if the <i>dwOutBufLen</i> parameter is <b>NULL</b>, or <a href="/windows/desktop/api/iphlpapi/nf-iphlpapi-getinterfaceinfo">GetInterfaceInfo</a> is unable to write to the memory pointed to by the <i>dwOutBufLen</i> parameter.
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-getinterfaceinfo
     * @since windows5.0
     */
    static GetInterfaceInfo(pIfTable, dwOutBufLen) {
        dwOutBufLenMarshal := dwOutBufLen is VarRef ? "uint*" : "ptr"

        result := DllCall("IPHLPAPI.dll\GetInterfaceInfo", "ptr", pIfTable, dwOutBufLenMarshal, dwOutBufLen, "uint")
        return result
    }

    /**
     * The GetUniDirectionalAdapterInfo function retrieves information about the unidirectional adapters installed on the local computer. A unidirectional adapter is an adapter that can receive datagrams, but not transmit them.
     * @param {Pointer} pIPIfInfo Pointer to an 
     * <a href="https://docs.microsoft.com/windows/win32/api/ipexport/ns-ipexport-ip_unidirectional_adapter_address">IP_UNIDIRECTIONAL_ADAPTER_ADDRESS</a> structure that receives information about the unidirectional adapters installed on the local computer.
     * @param {Pointer<Integer>} dwOutBufLen Pointer to a <b>ULONG</b> variable that receives the size of the structure pointed to by the <i>pIPIfInfo</i> parameter.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, use 
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-getunidirectionaladapterinfo
     */
    static GetUniDirectionalAdapterInfo(pIPIfInfo, dwOutBufLen) {
        dwOutBufLenMarshal := dwOutBufLen is VarRef ? "uint*" : "ptr"

        result := DllCall("IPHLPAPI.dll\GetUniDirectionalAdapterInfo", "ptr", pIPIfInfo, dwOutBufLenMarshal, dwOutBufLen, "uint")
        return result
    }

    /**
     * The NhpAllocateAndGetInterfaceInfoFromStack function obtains adapter information about the local computer.
     * @param {Pointer<Pointer<IP_INTERFACE_NAME_INFO_W2KSP1>>} ppTable An array of <a href="https://docs.microsoft.com/windows/desktop/api/iptypes/ns-iptypes-ip_interface_name_info_w2ksp1">IP_INTERFACE_NAME_INFO</a> structures that contains information about each adapter on the local system. The array contains one element for each adapter on the system.
     * @param {Pointer<Integer>} pdwCount The number of elements in the <i>ppTable</i> array.
     * @param {BOOL} bOrder When <b>TRUE</b>, elements in the <i>ppTable</i> array are sorted by increasing index value.
     * @param {HANDLE} hHeap A handle that specifies the heap from which <i>ppTable</i> should be allocated. This parameter can be the process heap returned by a call to the <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-getprocessheap">GetProcessHeap</a> function, or a private heap created by a call to the <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapcreate">HeapCreate</a> function.
     * @param {Integer} dwFlags A set of flags to be passed to the <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapalloc">HeapAlloc</a> function when allocating memory for <i>ppTable</i>. See the <b>HeapAlloc</b> function for more information.
     * @returns {Integer} Returns ERROR_SUCCESS upon successful completion.
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-nhpallocateandgetinterfaceinfofromstack
     * @since windows5.1.2600
     */
    static NhpAllocateAndGetInterfaceInfoFromStack(ppTable, pdwCount, bOrder, hHeap, dwFlags) {
        hHeap := hHeap is Win32Handle ? NumGet(hHeap, "ptr") : hHeap

        ppTableMarshal := ppTable is VarRef ? "ptr*" : "ptr"
        pdwCountMarshal := pdwCount is VarRef ? "uint*" : "ptr"

        result := DllCall("IPHLPAPI.dll\NhpAllocateAndGetInterfaceInfoFromStack", ppTableMarshal, ppTable, pdwCountMarshal, pdwCount, "int", bOrder, "ptr", hHeap, "uint", dwFlags, "uint")
        return result
    }

    /**
     * The GetBestInterface function retrieves the index of the interface that has the best route to the specified IPv4 address.
     * @param {Integer} dwDestAddr The destination IPv4 address for which to retrieve the interface that has the best route, in the form of an <a href="https://docs.microsoft.com/windows/desktop/api/inaddr/ns-inaddr-in_addr">IPAddr</a> structure.
     * @param {Pointer<Integer>} pdwBestIfIndex A pointer to a <b>DWORD</b> variable that receives the index of the interface that has the best route to the IPv4 address specified by <i>dwDestAddr</i>.
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
     * the <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-getbestinterface
     * @since windows5.0
     */
    static GetBestInterface(dwDestAddr, pdwBestIfIndex) {
        pdwBestIfIndexMarshal := pdwBestIfIndex is VarRef ? "uint*" : "ptr"

        result := DllCall("IPHLPAPI.dll\GetBestInterface", "uint", dwDestAddr, pdwBestIfIndexMarshal, pdwBestIfIndex, "uint")
        return result
    }

    /**
     * The GetBestInterfaceEx function retrieves the index of the interface that has the best route to the specified IPv4 or IPv6 address.
     * @param {Pointer<SOCKADDR>} pDestAddr The destination IPv6 or IPv4 address for which to retrieve the interface with the best route, in the form of a <a href="https://docs.microsoft.com/windows/desktop/WinSock/sockaddr-2">sockaddr</a> structure.
     * @param {Pointer<Integer>} pdwBestIfIndex A pointer to the index of the interface with the best route to the IPv6 or IPv4 address specified by <i>pDestAddr</i>.
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
     * the <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-getbestinterfaceex
     * @since windows5.1.2600
     */
    static GetBestInterfaceEx(pDestAddr, pdwBestIfIndex) {
        pdwBestIfIndexMarshal := pdwBestIfIndex is VarRef ? "uint*" : "ptr"

        result := DllCall("IPHLPAPI.dll\GetBestInterfaceEx", "ptr", pDestAddr, pdwBestIfIndexMarshal, pdwBestIfIndex, "uint")
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-getbestroute
     * @since windows5.0
     */
    static GetBestRoute(dwDestAddr, dwSourceAddr, pBestRoute) {
        result := DllCall("IPHLPAPI.dll\GetBestRoute", "uint", dwDestAddr, "uint", dwSourceAddr, "ptr", pBestRoute, "uint")
        return result
    }

    /**
     * The NotifyAddrChange function causes a notification to be sent to the caller whenever a change occurs in the table that maps IPv4 addresses to interfaces.
     * @param {Pointer<HANDLE>} Handle A pointer to a <b>HANDLE</b> variable that receives a file handle for use in a subsequent call to the <a href="https://docs.microsoft.com/windows/desktop/api/ioapiset/nf-ioapiset-getoverlappedresult">GetOverlappedResult</a> function. 
     * 
     * <div class="alert"><b>Warning</b>  Do not close this handle, and do not associate it with a completion port.</div>
     * <div> </div>
     * @param {Pointer<OVERLAPPED>} overlapped A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure that  notifies the caller of any changes in the table that maps IP addresses to interfaces.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR if the caller specifies <b>NULL</b> for the <i>Handle</i> and <i>overlapped</i> parameters. If the caller specifies non-<b>NULL</b> parameters, the return value for success is ERROR_IO_PENDING.
     * 
     * If the function fails, use 
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
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
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-notifyaddrchange
     * @since windows5.0
     */
    static NotifyAddrChange(Handle, overlapped) {
        result := DllCall("IPHLPAPI.dll\NotifyAddrChange", "ptr", Handle, "ptr", overlapped, "uint")
        return result
    }

    /**
     * The NotifyRouteChange function causes a notification to be sent to the caller whenever a change occurs in the IPv4 routing table.
     * @param {Pointer<HANDLE>} Handle A pointer to a <b>HANDLE</b> variable that receives a handle to use in asynchronous notification.
     * @param {Pointer<OVERLAPPED>} overlapped A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure that  notifies the caller of any changes in the routing table.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR if the caller specifies <b>NULL</b> for the <i>Handle</i> and <i>overlapped</i> parameters. If the caller specifies non-<b>NULL</b> parameters, the return value for success is ERROR_IO_PENDING. If the function fails, use 
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
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
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-notifyroutechange
     * @since windows5.0
     */
    static NotifyRouteChange(Handle, overlapped) {
        result := DllCall("IPHLPAPI.dll\NotifyRouteChange", "ptr", Handle, "ptr", overlapped, "uint")
        return result
    }

    /**
     * Cancels notification of IPv4 address and route changes previously requested with successful calls to the NotifyAddrChange or NotifyRouteChange functions.
     * @remarks
     * 
     * The  
     * <b>CancelIPChangeNotify</b> function deregisters for a change notification previously requested for IPv4 address or route changes on  a local computer. These requests to register for notification are made  by calling the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-notifyaddrchange">NotifyAddrChange</a> or <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-notifyroutechange">NotifyRouteChange</a> functions.  
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure used in the previous call to one of these notification functions is passed to <b>CancelIPChangeNotify</b> function in the <i>notifyOverlapped</i> parameter to deregister for notifications.
     * 
     * The <b>CancelIPChangeNotify</b> can return <b>FALSE</b> if no notification request was found or an invalid <i>notifyOverlapped</i> parameter was passed.
     * 
     * 
     * @param {Pointer<OVERLAPPED>} notifyOverlapped A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure used in the previous call to <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-notifyaddrchange">NotifyAddrChange</a>  or <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-notifyroutechange">NotifyRouteChange</a>.
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-cancelipchangenotify
     * @since windows5.1.2600
     */
    static CancelIPChangeNotify(notifyOverlapped) {
        result := DllCall("IPHLPAPI.dll\CancelIPChangeNotify", "ptr", notifyOverlapped, "int")
        return result
    }

    /**
     * The GetAdapterIndex function obtains the index of an adapter, given its name.
     * @param {PWSTR} AdapterName A pointer to a Unicode string that specifies the name of the adapter.
     * @param {Pointer<Integer>} IfIndex A pointer to a <b>ULONG</b> variable that points to the index of the adapter.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, use 
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-getadapterindex
     * @since windows5.0
     */
    static GetAdapterIndex(AdapterName, IfIndex) {
        AdapterName := AdapterName is String ? StrPtr(AdapterName) : AdapterName

        IfIndexMarshal := IfIndex is VarRef ? "uint*" : "ptr"

        result := DllCall("IPHLPAPI.dll\GetAdapterIndex", "ptr", AdapterName, IfIndexMarshal, IfIndex, "uint")
        return result
    }

    /**
     * The AddIPAddress function adds the specified IPv4 address to the specified adapter.
     * @param {Integer} Address The IPv4 address to add to the adapter, in the form of an <a href="https://docs.microsoft.com/windows/desktop/api/inaddr/ns-inaddr-in_addr">IPAddr</a> structure.
     * @param {Integer} IpMask The subnet mask for the IPv4 address specified in the <i>Address</i> parameter.   The <b>IPMask</b> parameter uses the same format as an <a href="https://docs.microsoft.com/windows/desktop/api/inaddr/ns-inaddr-in_addr">IPAddr</a> structure.
     * @param {Integer} IfIndex The index of the adapter on which to add the IPv4 address.
     * @param {Pointer<Integer>} NTEContext A pointer to a <b>ULONG</b> variable. On successful return, this parameter points to the Net Table Entry (NTE) context for the IPv4 address that was added. The caller can later use this context in a call to 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-deleteipaddress">DeleteIPAddress</a> function.
     * @param {Pointer<Integer>} NTEInstance A pointer to a <b>ULONG</b> variable. On successful return, this parameter points to the NTE instance for the IPv4 address that was added.
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-addipaddress
     * @since windows5.0
     */
    static AddIPAddress(Address, IpMask, IfIndex, NTEContext, NTEInstance) {
        NTEContextMarshal := NTEContext is VarRef ? "uint*" : "ptr"
        NTEInstanceMarshal := NTEInstance is VarRef ? "uint*" : "ptr"

        result := DllCall("IPHLPAPI.dll\AddIPAddress", "uint", Address, "uint", IpMask, "uint", IfIndex, NTEContextMarshal, NTEContext, NTEInstanceMarshal, NTEInstance, "uint")
        return result
    }

    /**
     * The DeleteIPAddress function deletes an IP address previously added using AddIPAddress.
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-deleteipaddress
     * @since windows5.0
     */
    static DeleteIPAddress(NTEContext) {
        result := DllCall("IPHLPAPI.dll\DeleteIPAddress", "uint", NTEContext, "uint")
        return result
    }

    /**
     * The GetNetworkParams function retrieves network parameters for the local computer.
     * @param {Pointer} pFixedInfo A pointer to a 
     * buffer that contains a <a href="https://docs.microsoft.com/windows/desktop/api/iptypes/ns-iptypes-fixed_info_w2ksp1">FIXED_INFO</a> structure that receives the network parameters for the local computer, if the function was successful. This buffer must be allocated by the caller prior to calling the <b>GetNetworkParams</b> function.
     * @param {Pointer<Integer>} pOutBufLen A pointer to a <b>ULONG</b> variable that specifies the size of the 
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-getnetworkparams
     * @since windows5.0
     */
    static GetNetworkParams(pFixedInfo, pOutBufLen) {
        pOutBufLenMarshal := pOutBufLen is VarRef ? "uint*" : "ptr"

        result := DllCall("IPHLPAPI.dll\GetNetworkParams", "ptr", pFixedInfo, pOutBufLenMarshal, pOutBufLen, "uint")
        return result
    }

    /**
     * The GetAdaptersInfo function retrieves adapter information for the local computer.
     * @param {Pointer} AdapterInfo A pointer to a buffer that receives a linked list of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iptypes/ns-iptypes-ip_adapter_info">IP_ADAPTER_INFO</a> structures.
     * @param {Pointer<Integer>} SizePointer A pointer to a <b>ULONG</b> variable that specifies the size of the buffer pointed to by the <i>pAdapterInfo</i> parameter. If this size is insufficient to hold the adapter information, 
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
     * The <a href="/windows/desktop/api/iphlpapi/nf-iphlpapi-getadaptersinfo">GetAdaptersInfo</a> function is not supported by the operating system running on the local computer.
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-getadaptersinfo
     * @since windows5.0
     */
    static GetAdaptersInfo(AdapterInfo, SizePointer) {
        SizePointerMarshal := SizePointer is VarRef ? "uint*" : "ptr"

        result := DllCall("IPHLPAPI.dll\GetAdaptersInfo", "ptr", AdapterInfo, SizePointerMarshal, SizePointer, "uint")
        return result
    }

    /**
     * The GetAdapterOrderMap function obtains an adapter order map that indicates priority for interfaces on the local computer.
     * @returns {Pointer<IP_ADAPTER_ORDER_MAP>} Returns an <a href="/windows/desktop/api/ipexport/ns-ipexport-ip_adapter_order_map">IP_ADAPTER_ORDER_MAP</a> structure filled with adapter priority information.  See the <b>IP_ADAPTER_ORDER_MAP</b> structure for more information.
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-getadapterordermap
     * @since windows5.1.2600
     */
    static GetAdapterOrderMap() {
        result := DllCall("IPHLPAPI.dll\GetAdapterOrderMap", "ptr")
        return result
    }

    /**
     * Retrieves the addresses associated with the adapters on the local computer.
     * @param {Integer} Family 
     * @param {Integer} Flags The type of addresses to retrieve. The possible values are defined in the <i>Iptypes.h</i> header file. Note that the <i>Iptypes.h</i> header file is automatically included in <i>Iphlpapi.h</i>, and should never be used directly.
     * @param {Pointer} AdapterAddresses A pointer to a buffer that contains a linked list of <a href="https://docs.microsoft.com/windows/desktop/api/iptypes/ns-iptypes-ip_adapter_addresses_lh">IP_ADAPTER_ADDRESSES</a> structures on successful return.
     * @param {Pointer<Integer>} SizePointer A pointer to a variable that specifies the size of the buffer pointed to by <i>AdapterAddresses</i>.
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-getadaptersaddresses
     * @since windows5.1.2600
     */
    static GetAdaptersAddresses(Family, Flags, AdapterAddresses, SizePointer) {
        static Reserved := 0 ;Reserved parameters must always be NULL

        SizePointerMarshal := SizePointer is VarRef ? "uint*" : "ptr"

        result := DllCall("IPHLPAPI.dll\GetAdaptersAddresses", "uint", Family, "uint", Flags, "ptr", Reserved, "ptr", AdapterAddresses, SizePointerMarshal, SizePointer, "uint")
        return result
    }

    /**
     * The GetPerAdapterInfo function retrieves information about the adapter corresponding to the specified interface.
     * @param {Integer} IfIndex Index of an interface. 
     * The <b>GetPerAdapterInfo</b> function retrieves information for the adapter corresponding to this interface.
     * @param {Pointer} pPerAdapterInfo Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iptypes/ns-iptypes-ip_per_adapter_info_w2ksp1">IP_PER_ADAPTER_INFO</a> structure that receives information about the adapter.
     * @param {Pointer<Integer>} pOutBufLen Pointer to a <b>ULONG</b> variable that specifies the size of the 
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
     * <a href="/windows/desktop/api/iphlpapi/nf-iphlpapi-getperadapterinfo">GetPerAdapterInfo</a> is not supported by the operating system running on the local computer.
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-getperadapterinfo
     * @since windows5.0
     */
    static GetPerAdapterInfo(IfIndex, pPerAdapterInfo, pOutBufLen) {
        pOutBufLenMarshal := pOutBufLen is VarRef ? "uint*" : "ptr"

        result := DllCall("IPHLPAPI.dll\GetPerAdapterInfo", "uint", IfIndex, "ptr", pPerAdapterInfo, pOutBufLenMarshal, pOutBufLen, "uint")
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
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-getinterfaceactivetimestampcapabilities
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
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-getinterfacesupportedtimestampcapabilities
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
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-captureinterfacehardwarecrosstimestamp
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
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-registerinterfacetimestampconfigchange
     */
    static RegisterInterfaceTimestampConfigChange(Callback, CallerContext, NotificationHandle) {
        CallerContextMarshal := CallerContext is VarRef ? "ptr" : "ptr"

        result := DllCall("IPHLPAPI.dll\RegisterInterfaceTimestampConfigChange", "ptr", Callback, CallerContextMarshal, CallerContext, "ptr", NotificationHandle, "uint")
        return result
    }

    /**
     * Cancels notifications about timestamp capability changes by unregistering the callback function you registered in a call to [**RegisterInterfaceTimestampConfigChange**](/windows/win32/api/iphlpapi/nf-iphlpapi-registerinterfacetimestampconfigchange).
     * @param {HIFTIMESTAMPCHANGE} NotificationHandle Type: \_In\_ **HIFTIMESTAMPCHANGE**
     * 
     * The handle that was returned by [**RegisterInterfaceTimestampConfigChange**](/windows/win32/api/iphlpapi/nf-iphlpapi-registerinterfacetimestampconfigchange). This identifies the registration to be canceled.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-unregisterinterfacetimestampconfigchange
     */
    static UnregisterInterfaceTimestampConfigChange(NotificationHandle) {
        NotificationHandle := NotificationHandle is Win32Handle ? NumGet(NotificationHandle, "ptr") : NotificationHandle

        DllCall("IPHLPAPI.dll\UnregisterInterfaceTimestampConfigChange", "ptr", NotificationHandle)
    }

    /**
     * This function is reserved for system use, and you should not call it from your code.
     * @param {Pointer<NET_LUID_LH>} InterfaceLuid Reserved.
     * @param {Pointer<INTERFACE_TIMESTAMP_CAPABILITIES>} TimestampCapabilites Reserved.
     * @returns {Integer} Reserved.
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-getinterfacecurrenttimestampcapabilities
     */
    static GetInterfaceCurrentTimestampCapabilities(InterfaceLuid, TimestampCapabilites) {
        result := DllCall("IPHLPAPI.DLL\GetInterfaceCurrentTimestampCapabilities", "ptr", InterfaceLuid, "ptr", TimestampCapabilites, "uint")
        return result
    }

    /**
     * This function is reserved for system use, and you should not call it from your code.
     * @param {Pointer<NET_LUID_LH>} InterfaceLuid Reserved.
     * @param {Pointer<INTERFACE_TIMESTAMP_CAPABILITIES>} TimestampCapabilites Reserved.
     * @returns {Integer} Reserved.
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-getinterfacehardwaretimestampcapabilities
     */
    static GetInterfaceHardwareTimestampCapabilities(InterfaceLuid, TimestampCapabilites) {
        result := DllCall("IPHLPAPI.DLL\GetInterfaceHardwareTimestampCapabilities", "ptr", InterfaceLuid, "ptr", TimestampCapabilites, "uint")
        return result
    }

    /**
     * This function is reserved for system use, and you should not call it from your code.
     * @param {Pointer<Void>} CallerContext Reserved.
     * @param {Pointer<PINTERFACE_TIMESTAMP_CONFIG_CHANGE_CALLBACK>} Callback Reserved.
     * @param {Pointer<HIFTIMESTAMPCHANGE>} NotificationHandle Reserved.
     * @returns {Integer} Reserved.
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-notifyiftimestampconfigchange
     */
    static NotifyIfTimestampConfigChange(CallerContext, Callback, NotificationHandle) {
        CallerContextMarshal := CallerContext is VarRef ? "ptr" : "ptr"

        result := DllCall("IPHLPAPI.DLL\NotifyIfTimestampConfigChange", CallerContextMarshal, CallerContext, "ptr", Callback, "ptr", NotificationHandle, "uint")
        return result
    }

    /**
     * This function is reserved for system use, and you should not call it from your code.
     * @param {HIFTIMESTAMPCHANGE} NotificationHandle Reserved.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-canceliftimestampconfigchange
     */
    static CancelIfTimestampConfigChange(NotificationHandle) {
        NotificationHandle := NotificationHandle is Win32Handle ? NumGet(NotificationHandle, "ptr") : NotificationHandle

        DllCall("IPHLPAPI.DLL\CancelIfTimestampConfigChange", "ptr", NotificationHandle)
    }

    /**
     * The IpReleaseAddress function releases an IPv4 address previously obtained through the Dynamic Host Configuration Protocol (DHCP).
     * @param {Pointer<IP_ADAPTER_INDEX_MAP>} AdapterInfo A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ipexport/ns-ipexport-ip_adapter_index_map">IP_ADAPTER_INDEX_MAP</a> structure that specifies the adapter associated with the IPv4 address to release.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, use 
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-ipreleaseaddress
     * @since windows5.0
     */
    static IpReleaseAddress(AdapterInfo) {
        result := DllCall("IPHLPAPI.dll\IpReleaseAddress", "ptr", AdapterInfo, "uint")
        return result
    }

    /**
     * The IpRenewAddressfunction renews a lease on an IPv4 address previously obtained through Dynamic Host Configuration Protocol (DHCP).
     * @param {Pointer<IP_ADAPTER_INDEX_MAP>} AdapterInfo A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ipexport/ns-ipexport-ip_adapter_index_map">IP_ADAPTER_INDEX_MAP</a> structure that specifies the adapter associated with the IP address to renew.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, use 
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-iprenewaddress
     * @since windows5.0
     */
    static IpRenewAddress(AdapterInfo) {
        result := DllCall("IPHLPAPI.dll\IpRenewAddress", "ptr", AdapterInfo, "uint")
        return result
    }

    /**
     * The SendARP function sends an Address Resolution Protocol (ARP) request to obtain the physical address that corresponds to the specified destination IPv4 address.
     * @param {Integer} DestIP The destination IPv4 address, in the form of an <a href="https://docs.microsoft.com/windows/desktop/api/inaddr/ns-inaddr-in_addr">IPAddr</a> structure. The ARP request attempts to obtain the physical address that corresponds to this IPv4 address.
     * @param {Integer} SrcIP The source IPv4 address of the sender, in the form of an <a href="https://docs.microsoft.com/windows/desktop/api/inaddr/ns-inaddr-in_addr">IPAddr</a> structure. This parameter is optional and is used to select the interface to send the request on for the ARP entry. The caller may specify zero corresponding to the <b>INADDR_ANY</b> IPv4 address for this parameter.
     * @param {Pointer} pMacAddr A pointer to an array of <b>ULONG</b> variables. This array must have at least two <b>ULONG</b> elements to hold an  Ethernet or token ring physical address. The first six bytes of this array receive the physical address that corresponds to the IPv4 address specified by the <i>DestIP</i> parameter.
     * @param {Pointer<Integer>} PhyAddrLen On input, a pointer to a <b>ULONG</b> value that specifies the maximum buffer size, in bytes, the application has set aside to receive the physical address or MAC address. The buffer size should be at least 6 bytes for an Ethernet or token ring physical address 
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
     * The network name cannot be found. This error is returned on Windows Vista and later when an ARP reply to the <a href="/windows/desktop/api/iphlpapi/nf-iphlpapi-sendarp">SendARP</a> request was not received. This error occurs  if the destination IPv4 address could not be reached because it is not on the same subnet or  the destination computer is not operating. 
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
     * A device attached to the system is not functioning. This error is returned on Windows Server 2003 and earlier when an ARP reply to the <a href="/windows/desktop/api/iphlpapi/nf-iphlpapi-sendarp">SendARP</a> request was not received. This error can occur if destination IPv4 address could not be reached because it is not on the same subnet or  the destination computer is not operating. 
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
     * The <a href="/windows/desktop/api/iphlpapi/nf-iphlpapi-sendarp">SendARP</a> function is not supported by the operating system running on the local computer.
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-sendarp
     * @since windows5.0
     */
    static SendARP(DestIP, SrcIP, pMacAddr, PhyAddrLen) {
        PhyAddrLenMarshal := PhyAddrLen is VarRef ? "uint*" : "ptr"

        result := DllCall("IPHLPAPI.dll\SendARP", "uint", DestIP, "uint", SrcIP, "ptr", pMacAddr, PhyAddrLenMarshal, PhyAddrLen, "uint")
        return result
    }

    /**
     * The GetRTTAndHopCount function determines the round-trip time (RTT) and hop count to the specified destination.
     * @param {Integer} DestIpAddress IP address of the destination for which to determine the RTT and hop count, in the form of an <a href="https://docs.microsoft.com/windows/desktop/api/inaddr/ns-inaddr-in_addr">IPAddr</a> structure.
     * @param {Pointer<Integer>} HopCount Pointer to a <b>ULONG</b> variable. This variable receives the hop count to the destination specified by the <i>DestIpAddress</i> parameter.
     * @param {Integer} MaxHops Maximum number of hops to search for the destination. If the number of hops to the destination exceeds this number, the function terminates the search and returns <b>FALSE</b>.
     * @param {Pointer<Integer>} RTT Round-trip time, in milliseconds, to the destination specified by <i>DestIpAddress</i>.
     * @returns {BOOL} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. Call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> to obtain the error code for the failure.
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-getrttandhopcount
     * @since windows5.0
     */
    static GetRTTAndHopCount(DestIpAddress, HopCount, MaxHops, RTT) {
        HopCountMarshal := HopCount is VarRef ? "uint*" : "ptr"
        RTTMarshal := RTT is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("IPHLPAPI.dll\GetRTTAndHopCount", "uint", DestIpAddress, HopCountMarshal, HopCount, "uint", MaxHops, RTTMarshal, RTT, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Takes an interface index and returns a backward-compatible interface index, that is, an index that uses only the lower 24 bits.
     * @param {Integer} IfIndex The interface index from which the backward-compatible or "friendly" interface index is derived.
     * @returns {Integer} A backward-compatible interface index that uses only the lower 24 bits.
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-getfriendlyifindex
     * @since windows5.0
     */
    static GetFriendlyIfIndex(IfIndex) {
        result := DllCall("IPHLPAPI.dll\GetFriendlyIfIndex", "uint", IfIndex, "uint")
        return result
    }

    /**
     * The EnableRouter function turns on IPv4 forwarding on the local computer. EnableRouter also increments a reference count that tracks the number of requests to enable IPv4 forwarding.
     * @param {Pointer<HANDLE>} pHandle A pointer to a handle. This parameter is currently unused.
     * @param {Pointer<OVERLAPPED>} pOverlapped A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure. Except for the <b>hEvent</b> member, all members of this structure should be set to zero. The <b>hEvent</b> member should contain a handle to a valid event object. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-createeventa">CreateEvent</a> function to create this event object.
     * @returns {Integer} If the <b>EnableRouter</b> function succeeds, the return value is ERROR_IO_PENDING.
     * 
     * If the function fails, use <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-enablerouter
     * @since windows5.0
     */
    static EnableRouter(pHandle, pOverlapped) {
        result := DllCall("IPHLPAPI.dll\EnableRouter", "ptr", pHandle, "ptr", pOverlapped, "uint")
        return result
    }

    /**
     * The UnenableRouter function decrements the reference count that tracks the number of requests to enable IPv4 forwarding. When this reference count reaches zero, UnenableRouter turns off IPv4 forwarding on the local computer.
     * @param {Pointer<OVERLAPPED>} pOverlapped A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure. This structure should be the same as the one used in the call to 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-enablerouter">EnableRouter</a> function.
     * @param {Pointer<Integer>} lpdwEnableCount An optional pointer to a <b>DWORD</b> variable. This variable receives the number of references remaining.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, use 
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-unenablerouter
     * @since windows5.0
     */
    static UnenableRouter(pOverlapped, lpdwEnableCount) {
        lpdwEnableCountMarshal := lpdwEnableCount is VarRef ? "uint*" : "ptr"

        result := DllCall("IPHLPAPI.dll\UnenableRouter", "ptr", pOverlapped, lpdwEnableCountMarshal, lpdwEnableCount, "uint")
        return result
    }

    /**
     * The DisableMediaSense function disables the media sensing capability of the TCP/IP stack on a local computer.
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
     * The operation is in progress. This value is returned by a successful asynchronous call to <a href="/windows/desktop/api/iphlpapi/nf-iphlpapi-disablemediasense">DisableMediaSense</a>.  
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-disablemediasense
     * @since windows5.1.2600
     */
    static DisableMediaSense(pHandle, pOverLapped) {
        result := DllCall("IPHLPAPI.dll\DisableMediaSense", "ptr", pHandle, "ptr", pOverLapped, "uint")
        return result
    }

    /**
     * The RestoreMediaSense function restores the media sensing capability of the TCP/IP stack on a local computer on which the DisableMediaSense function was previously called.
     * @param {Pointer<OVERLAPPED>} pOverlapped A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure. Except for the <b>hEvent</b> member, all members of this structure must be set to zero. The <b>hEvent</b> member should contain a handle to a valid event object. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-createeventa">CreateEvent</a> function to create this event object.
     * @param {Pointer<Integer>} lpdwEnableCount An optional pointer to a DWORD variable that receives the number of references remaining if the <b>RestoreMediaSense</b> function succeeds. The variable is also used by the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-enablerouter">EnableRouter</a> and <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-unenablerouter">UnenableRouter</a> functions.
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
     * An invalid parameter was passed to the function. This error is returned if an <i>pOverlapped</i> parameter is a bad pointer.  This error is also returned if the <a href="/windows/desktop/api/iphlpapi/nf-iphlpapi-disablemediasense">DisableMediaSense</a> function was not called prior to calling the <a href="/windows/desktop/api/iphlpapi/nf-iphlpapi-restoremediasense">RestoreMediaSense</a> function.
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
     * The operation is in progress. This value may be returned by a successful asynchronous call to <a href="/windows/desktop/api/iphlpapi/nf-iphlpapi-restoremediasense">RestoreMediaSense</a>.  
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-restoremediasense
     * @since windows5.1.2600
     */
    static RestoreMediaSense(pOverlapped, lpdwEnableCount) {
        lpdwEnableCountMarshal := lpdwEnableCount is VarRef ? "uint*" : "ptr"

        result := DllCall("IPHLPAPI.dll\RestoreMediaSense", "ptr", pOverlapped, lpdwEnableCountMarshal, lpdwEnableCount, "uint")
        return result
    }

    /**
     * The GetIpErrorString function retrieves an IP Helper error string.
     * @param {Integer} ErrorCode The error code to be retrieved. The possible values for this parameter are defined in the <i>Ipexport.h</i> header file.
     * @param {PWSTR} Buffer A pointer to the buffer that contains the error code string if the function returns with NO_ERROR.
     * @param {Pointer<Integer>} Size A pointer to a <b>DWORD</b> that specifies the length, in characters, of the buffer pointed to by <i>Buffer</i> parameter, excluding the terminating null (i.e. the size of Buffer in characters, minus one).
     * @returns {Integer} Returns NO_ERROR upon success.
     * 
     * If the function fails, use <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-getiperrorstring
     * @since windows5.1.2600
     */
    static GetIpErrorString(ErrorCode, Buffer, Size) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        SizeMarshal := Size is VarRef ? "uint*" : "ptr"

        result := DllCall("IPHLPAPI.dll\GetIpErrorString", "uint", ErrorCode, "ptr", Buffer, SizeMarshal, Size, "uint")
        return result
    }

    /**
     * Resolves the physical address for a neighbor IP address entry on the local computer.
     * @param {Pointer<SOCKADDR>} NetworkAddress A pointer to a   <a href="https://docs.microsoft.com/windows/desktop/WinSock/sockaddr-2">SOCKADDR</a> structure that contains the neighbor IP address entry and address family.
     * @param {Pointer} PhysicalAddress A pointer to a byte array buffer that will receive the physical address that corresponds to the IP address specified by the <i>NetworkAddress</i> parameter if the function is successful. The length of the byte array is passed in the <i>PhysicalAddressLength</i> parameter.
     * @param {Pointer<Integer>} PhysicalAddressLength On input, this parameter specifies the maximum length, in bytes, of the buffer passed in the <i>PhysicalAddress</i> parameter to receive the physical address. If the function is successful, this parameter will receive the length of the physical address returned in the buffer pointed to by the <i>PhysicalAddress</i> parameter. If <b>ERROR_BUFFER_OVERFLOW</b> is returned, this parameter contains the number of bytes
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
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-resolveneighbor
     * @since windows5.1.2600
     */
    static ResolveNeighbor(NetworkAddress, PhysicalAddress, PhysicalAddressLength) {
        PhysicalAddressLengthMarshal := PhysicalAddressLength is VarRef ? "uint*" : "ptr"

        result := DllCall("IPHLPAPI.dll\ResolveNeighbor", "ptr", NetworkAddress, "ptr", PhysicalAddress, PhysicalAddressLengthMarshal, PhysicalAddressLength, "uint")
        return result
    }

    /**
     * Creates a persistent TCP port reservation for a consecutive block of TCP ports on the local computer.
     * @param {Integer} StartPort The starting TCP port number in network byte order.
     * @param {Integer} NumberOfPorts The number of TCP port numbers to reserve.
     * @param {Pointer<Integer>} Token A pointer to a port reservation token that is returned if the function succeeds.
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-createpersistenttcpportreservation
     * @since windows6.0.6000
     */
    static CreatePersistentTcpPortReservation(StartPort, NumberOfPorts, Token) {
        TokenMarshal := Token is VarRef ? "uint*" : "ptr"

        result := DllCall("IPHLPAPI.dll\CreatePersistentTcpPortReservation", "ushort", StartPort, "ushort", NumberOfPorts, TokenMarshal, Token, "uint")
        return result
    }

    /**
     * Creates a persistent UDP port reservation for a consecutive block of UDP ports on the local computer.
     * @param {Integer} StartPort The starting UDP port number in network byte order.
     * @param {Integer} NumberOfPorts The number of UDP port numbers to reserve.
     * @param {Pointer<Integer>} Token A pointer to a port reservation token that is returned if the function succeeds.
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-createpersistentudpportreservation
     * @since windows6.0.6000
     */
    static CreatePersistentUdpPortReservation(StartPort, NumberOfPorts, Token) {
        TokenMarshal := Token is VarRef ? "uint*" : "ptr"

        result := DllCall("IPHLPAPI.dll\CreatePersistentUdpPortReservation", "ushort", StartPort, "ushort", NumberOfPorts, TokenMarshal, Token, "uint")
        return result
    }

    /**
     * Deletes a persistent TCP port reservation for a consecutive block of TCP ports on the local computer.
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-deletepersistenttcpportreservation
     * @since windows6.0.6000
     */
    static DeletePersistentTcpPortReservation(StartPort, NumberOfPorts) {
        result := DllCall("IPHLPAPI.dll\DeletePersistentTcpPortReservation", "ushort", StartPort, "ushort", NumberOfPorts, "uint")
        return result
    }

    /**
     * Deletes a persistent TCP port reservation for a consecutive block of TCP ports on the local computer.
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-deletepersistentudpportreservation
     * @since windows6.0.6000
     */
    static DeletePersistentUdpPortReservation(StartPort, NumberOfPorts) {
        result := DllCall("IPHLPAPI.dll\DeletePersistentUdpPortReservation", "ushort", StartPort, "ushort", NumberOfPorts, "uint")
        return result
    }

    /**
     * Looks up the token for a persistent TCP port reservation for a consecutive block of TCP ports on the local computer.
     * @param {Integer} StartPort The starting TCP port number in network byte order.
     * @param {Integer} NumberOfPorts The number of TCP port numbers  that were reserved.
     * @param {Pointer<Integer>} Token A pointer to a port reservation token that is returned if the function succeeds.
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-lookuppersistenttcpportreservation
     * @since windows6.0.6000
     */
    static LookupPersistentTcpPortReservation(StartPort, NumberOfPorts, Token) {
        TokenMarshal := Token is VarRef ? "uint*" : "ptr"

        result := DllCall("IPHLPAPI.dll\LookupPersistentTcpPortReservation", "ushort", StartPort, "ushort", NumberOfPorts, TokenMarshal, Token, "uint")
        return result
    }

    /**
     * Looks up the token for a persistent UDP port reservation for a consecutive block of TCP ports on the local computer.
     * @param {Integer} StartPort The starting UDP port number in network byte order.
     * @param {Integer} NumberOfPorts The number of UDP port numbers that were reserved.
     * @param {Pointer<Integer>} Token A pointer to a port reservation token that is returned if the function succeeds.
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-lookuppersistentudpportreservation
     * @since windows6.0.6000
     */
    static LookupPersistentUdpPortReservation(StartPort, NumberOfPorts, Token) {
        TokenMarshal := Token is VarRef ? "uint*" : "ptr"

        result := DllCall("IPHLPAPI.dll\LookupPersistentUdpPortReservation", "ushort", StartPort, "ushort", NumberOfPorts, TokenMarshal, Token, "uint")
        return result
    }

    /**
     * Parses the input network string and checks whether it is a legal representation of the specified IP network string type. If the string matches a type and its specification, the function can optionally return the parsed result.
     * @param {PWSTR} NetworkString A pointer to the NULL-terminated network string to parse.
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
     * @param {Pointer<Integer>} PortNumber On success, the function returns a pointer to the parsed network port in host order if a <b>NULL</b> pointer was not passed in this parameter. If a network port was not present in the <i>NetworkString</i> parameter, then a pointer to a value of zero is returned.
     * @param {Pointer<Integer>} PrefixLength On success, the function returns a pointer to the parsed prefix length if a <b>NULL</b> pointer was not passed in this parameter. If a prefix was not present in the <i>NetworkString</i> parameter, then a pointer to a value of -1 is returned.
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
     * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/nf-iphlpapi-parsenetworkstring
     * @since windows6.0.6000
     */
    static ParseNetworkString(NetworkString, Types, AddressInfo, PortNumber, PrefixLength) {
        NetworkString := NetworkString is String ? StrPtr(NetworkString) : NetworkString

        PortNumberMarshal := PortNumber is VarRef ? "ushort*" : "ptr"
        PrefixLengthMarshal := PrefixLength is VarRef ? "char*" : "ptr"

        result := DllCall("IPHLPAPI.dll\ParseNetworkString", "ptr", NetworkString, "uint", Types, "ptr", AddressInfo, PortNumberMarshal, PortNumber, PrefixLengthMarshal, PrefixLength, "uint")
        return result
    }

    /**
     * Retrieves information for the specified interface on the local computer.
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
     * The system cannot find the file specified. This error is returned if the  network interface LUID or interface index specified by the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> member of the <a href="/windows/desktop/api/netioapi/ns-netioapi-mib_if_row2">MIB_IF_ROW2</a> pointed to by the <i>Row</i> parameter was not a value on the local machine.
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
     * An invalid parameter was passed to the function. This error is returned if a <b>NULL</b> parameter is passed in the <i>Row</i> parameter. This error is also returned if the both the <b>InterfaceLuid</b> and <b>InterfaceIndex</b> member of the <a href="/windows/desktop/api/netioapi/ns-netioapi-mib_if_row2">MIB_IF_ROW2</a> pointed to by the <i>Row</i> parameter  are unspecified.
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
     * the <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//netioapi/nf-netioapi-getifentry2
     * @since windows6.0.6000
     */
    static GetIfEntry2(Row) {
        result := DllCall("IPHLPAPI.dll\GetIfEntry2", "ptr", Row, "uint")
        return result
    }

    /**
     * Retrieves the specified level of information for the specified interface on the local computer.
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
     * The system cannot find the file specified. This error is returned if the  network interface LUID or interface index specified by the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> member of the <a href="/windows/desktop/api/netioapi/ns-netioapi-mib_if_row2">MIB_IF_ROW2</a> pointed to by the <i>Row</i> parameter was not a value on the local machine.
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
     * An invalid parameter was passed to the function. This error is returned if a <b>NULL</b> parameter is passed in the <i>Row</i> parameter. This error is also returned if the both the <b>InterfaceLuid</b> and <b>InterfaceIndex</b> member of the <a href="/windows/desktop/api/netioapi/ns-netioapi-mib_if_row2">MIB_IF_ROW2</a> pointed to by the <i>Row</i> parameter  are unspecified.
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
     * the <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//netioapi/nf-netioapi-getifentry2ex
     * @since windows10.0.15063
     */
    static GetIfEntry2Ex(Level, Row) {
        result := DllCall("IPHLPAPI.dll\GetIfEntry2Ex", "int", Level, "ptr", Row, "uint")
        return result
    }

    /**
     * Retrieves the MIB-II interface table.
     * @param {Pointer<Pointer<MIB_IF_TABLE2>>} Table A pointer to a buffer that receives the table of interfaces in a <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_if_table2">MIB_IF_TABLE2</a> structure.
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//netioapi/nf-netioapi-getiftable2
     * @since windows6.0.6000
     */
    static GetIfTable2(Table) {
        TableMarshal := Table is VarRef ? "ptr*" : "ptr"

        result := DllCall("IPHLPAPI.dll\GetIfTable2", TableMarshal, Table, "uint")
        return result
    }

    /**
     * Retrieves the MIB-II interface table.
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
     * @param {Pointer<Pointer<MIB_IF_TABLE2>>} Table A pointer to a buffer that receives the table of interfaces in a <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_if_table2">MIB_IF_TABLE2</a> structure.
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//netioapi/nf-netioapi-getiftable2ex
     * @since windows6.0.6000
     */
    static GetIfTable2Ex(Level, Table) {
        TableMarshal := Table is VarRef ? "ptr*" : "ptr"

        result := DllCall("IPHLPAPI.dll\GetIfTable2Ex", "int", Level, TableMarshal, Table, "uint")
        return result
    }

    /**
     * Retrieves a table of network interface stack row entries that specify the relationship of the network interfaces on an interface stack.
     * @param {Pointer<Pointer<MIB_IFSTACK_TABLE>>} Table A pointer to a buffer that receives the table of interface stack row entries in a <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ifstack_table">MIB_IFSTACK_TABLE</a> structure.
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
     * the <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//netioapi/nf-netioapi-getifstacktable
     * @since windows6.0.6000
     */
    static GetIfStackTable(Table) {
        TableMarshal := Table is VarRef ? "ptr*" : "ptr"

        result := DllCall("IPHLPAPI.dll\GetIfStackTable", TableMarshal, Table, "uint")
        return result
    }

    /**
     * Retrieves a table of inverted network interface stack row entries that specify the relationship of the network interfaces on an interface stack.
     * @param {Pointer<Pointer<MIB_INVERTEDIFSTACK_TABLE>>} Table A pointer to a buffer that receives the table of inverted interface stack row entries in a <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_invertedifstack_table">MIB_INVERTEDIFSTACK_TABLE</a> structure.
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
     * the <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function  to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//netioapi/nf-netioapi-getinvertedifstacktable
     * @since windows6.0.6000
     */
    static GetInvertedIfStackTable(Table) {
        TableMarshal := Table is VarRef ? "ptr*" : "ptr"

        result := DllCall("IPHLPAPI.dll\GetInvertedIfStackTable", TableMarshal, Table, "uint")
        return result
    }

    /**
     * Retrieves IP information for the specified interface on the local computer.
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
     * The system cannot find the file specified. This error is returned if the  network interface LUID or interface index specified by the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> member of the <a href="/windows/desktop/api/netioapi/ns-netioapi-mib_ipinterface_row">MIB_IPINTERFACE_ROW</a> pointed to by the <i>Row</i> parameter was not a value on the local machine.
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
     * An invalid parameter was passed to the function. This error is returned if a <b>NULL</b> pointer is passed in the <i>Row</i> parameter, the <b>Family</b> member of the <a href="/windows/desktop/api/netioapi/ns-netioapi-mib_ipinterface_row">MIB_IPINTERFACE_ROW</a> pointed to by the <i>Row</i> parameter was not specified as <b>AF_INET</b> or <b>AF_INET6</b>, or both the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> members of the <b>MIB_IPINTERFACE_ROW</b> pointed to by the <i>Row</i> parameter were unspecified.
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
     * Element not found. This error is returned if the  network interface specified by the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> member of the <a href="/windows/desktop/api/netioapi/ns-netioapi-mib_ipinterface_row">MIB_IPINTERFACE_ROW</a> structure pointed to by the <i>Row</i> parameter does not match the IP address family specified in the <b>Family</b> member in the <b>MIB_IPINTERFACE_ROW</b> structure.
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
     * the <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//netioapi/nf-netioapi-getipinterfaceentry
     * @since windows6.0.6000
     */
    static GetIpInterfaceEntry(Row) {
        result := DllCall("IPHLPAPI.dll\GetIpInterfaceEntry", "ptr", Row, "uint")
        return result
    }

    /**
     * Retrieves the IP interface entries on the local computer.
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
     * @param {Pointer<Pointer<MIB_IPINTERFACE_TABLE>>} Table A pointer to a buffer that receives the table of IP interface entries in a <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipinterface_table">MIB_IPINTERFACE_TABLE</a> structure.
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
     * the <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//netioapi/nf-netioapi-getipinterfacetable
     * @since windows6.0.6000
     */
    static GetIpInterfaceTable(Family, Table) {
        TableMarshal := Table is VarRef ? "ptr*" : "ptr"

        result := DllCall("IPHLPAPI.dll\GetIpInterfaceTable", "ushort", Family, TableMarshal, Table, "uint")
        return result
    }

    /**
     * Initializes the members of an MIB_IPINTERFACE_ROW entry with default values.
     * @param {Pointer<MIB_IPINTERFACE_ROW>} Row A pointer to a 
     * <b>MIB_IPINTERFACE_ROW</b> structure to initialize. On successful return, the fields in this parameter are initialized with default information for an interface on the local computer.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//netioapi/nf-netioapi-initializeipinterfaceentry
     * @since windows6.0.6000
     */
    static InitializeIpInterfaceEntry(Row) {
        DllCall("IPHLPAPI.dll\InitializeIpInterfaceEntry", "ptr", Row)
    }

    /**
     * Registers to be notified for changes to all IP interfaces, IPv4 interfaces, or IPv6 interfaces on a local computer.
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
     * @param {BOOLEAN} InitialNotification A value that indicates whether the callback should be invoked
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//netioapi/nf-netioapi-notifyipinterfacechange
     * @since windows6.0.6000
     */
    static NotifyIpInterfaceChange(Family, Callback, CallerContext, InitialNotification, NotificationHandle) {
        CallerContextMarshal := CallerContext is VarRef ? "ptr" : "ptr"

        result := DllCall("IPHLPAPI.dll\NotifyIpInterfaceChange", "ushort", Family, "ptr", Callback, CallerContextMarshal, CallerContext, "char", InitialNotification, "ptr", NotificationHandle, "uint")
        return result
    }

    /**
     * Sets the properties of an IP interface on the local computer.
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
     * The system cannot find the file specified. This error is returned if the  network interface LUID or interface index specified by the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> member of the <a href="/windows/desktop/api/netioapi/ns-netioapi-mib_ipinterface_row">MIB_IPINTERFACE_ROW</a> pointed to by the <i>Row</i> parameter was not a value on the local machine.
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
     * An invalid parameter was passed to the function. This error is returned if a <b>NULL</b> pointer is passed in the <i>Row</i> parameter, the <b>Family</b> member of the <a href="/windows/desktop/api/netioapi/ns-netioapi-mib_ipinterface_row">MIB_IPINTERFACE_ROW</a> pointed to by the <i>Row</i> parameter was not specified as <b>AF_INET</b> or <b>AF_INET6</b>, or both the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> members of the <b>MIB_IPINTERFACE_ROW</b> pointed to by the <i>Row</i> parameter were unspecified.
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
     * The specified interface could not be found. This error is returned if the  network interface specified by the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> member of the <a href="/windows/desktop/api/netioapi/ns-netioapi-mib_ipinterface_row">MIB_IPINTERFACE_ROW</a> pointed to by the <i>Row</i> parameter does not match the IP address family specified in the <b>Family</b> member in the <b>MIB_IPINTERFACE_ROW</b> structure.
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//netioapi/nf-netioapi-setipinterfaceentry
     * @since windows6.0.6000
     */
    static SetIpInterfaceEntry(Row) {
        result := DllCall("IPHLPAPI.dll\SetIpInterfaceEntry", "ptr", Row, "uint")
        return result
    }

    /**
     * Retrieves historical bandwidth estimates for a network connection on the specified interface.
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
     * the <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//netioapi/nf-netioapi-getipnetworkconnectionbandwidthestimates
     * @since windows8.0
     */
    static GetIpNetworkConnectionBandwidthEstimates(InterfaceIndex, AddressFamily, BandwidthEstimates) {
        result := DllCall("IPHLPAPI.dll\GetIpNetworkConnectionBandwidthEstimates", "uint", InterfaceIndex, "ushort", AddressFamily, "ptr", BandwidthEstimates, "uint")
        return result
    }

    /**
     * Adds a new unicast IP address entry on the local computer.
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
     * An invalid parameter was passed to the function. This error is returned if a <b>NULL</b> pointer is passed in the <i>Row</i> parameter, the <b>Address</b> member of the <a href="/windows/desktop/api/netioapi/ns-netioapi-mib_unicastipaddress_row">MIB_UNICASTIPADDRESS_ROW</a> pointed to by the <i>Row</i> parameter was not set to a valid unicast IPv4 or IPv6 address, or both the <b>InterfaceLuid</b> and <b>InterfaceIndex</b> members of the <b>MIB_UNICASTIPADDRESS_ROW</b> pointed to by the <i>Row</i> parameter were unspecified. 
     * 
     * This error is also returned for other errors in the values set for members in the <a href="/windows/desktop/api/netioapi/ns-netioapi-mib_unicastipaddress_row">MIB_UNICASTIPADDRESS_ROW</a> structure. These errors include the following: if the <b>ValidLifetime</b> member is less than than the <b>PreferredLifetime</b> member, if the <b>PrefixOrigin</b> member is set to <b>IpPrefixOriginUnchanged</b> and the <b>SuffixOrigin</b> is the not set to <b>IpSuffixOriginUnchanged</b>, if the <b>PrefixOrigin</b> member is not set to <b>IpPrefixOriginUnchanged</b> and the <b>SuffixOrigin</b> is set to <b>IpSuffixOriginUnchanged</b>, if the <b>PrefixOrigin</b> member is not set to a value from the <b>NL_PREFIX_ORIGIN</b> enumeration, if the <b>SuffixOrigin</b> member is not set to a value from the <b>NL_SUFFIX_ORIGIN</b> enumeration, or if the <b>OnLinkPrefixLength</b> member is set to a value greater than the IP address length, in bits (32 for a unicast IPv4 address or 128 for a unicast IPv6 address).
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
     * The specified interface could not be found. This error is returned if the  network interface specified by the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> member of the <a href="/windows/desktop/api/netioapi/ns-netioapi-mib_unicastipaddress_row">MIB_UNICASTIPADDRESS_ROW</a> pointed to by the <i>Row</i> parameter could not be found.  
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
     * The request is not supported. This error is returned if no IPv4 stack is on the local computer and an IPv4 address was specified in the <b>Address</b> member of the  <a href="/windows/desktop/api/netioapi/ns-netioapi-mib_unicastipaddress_row">MIB_UNICASTIPADDRESS_ROW</a> pointed to by the <i>Row</i> parameter.  This error is also returned if no IPv6 stack is on the local computer and an IPv6 address was specified in the <b>Address</b> member.
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
     * The object already exists. This error is returned if the  <b>Address</b> member of the <a href="/windows/desktop/api/netioapi/ns-netioapi-mib_unicastipaddress_row">MIB_UNICASTIPADDRESS_ROW</a> pointed to by the <i>Row</i> parameter is a duplicate of an existing unicast IP address on the interface specified by the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> member of the <b>MIB_UNICASTIPADDRESS_ROW</b>.  
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//netioapi/nf-netioapi-createunicastipaddressentry
     * @since windows6.0.6000
     */
    static CreateUnicastIpAddressEntry(Row) {
        result := DllCall("IPHLPAPI.dll\CreateUnicastIpAddressEntry", "ptr", Row, "uint")
        return result
    }

    /**
     * Deletes an existing unicast IP address entry on the local computer.
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
     * An invalid parameter was passed to the function. This error is returned if a <b>NULL</b> pointer is passed in the <i>Row</i> parameter, the <b>Address</b> member of the <a href="/windows/desktop/api/netioapi/ns-netioapi-mib_unicastipaddress_row">MIB_UNICASTIPADDRESS_ROW</a> pointed to by the <i>Row</i> parameter was not set to a valid unicast IPv4 or IPv6 address, or both the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> members of the <b>MIB_UNICASTIPADDRESS_ROW</b> pointed to by the <i>Row</i> parameter were unspecified.
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
     * The specified interface could not be found. This error is returned if the  network interface specified by the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> member of the <a href="/windows/desktop/api/netioapi/ns-netioapi-mib_unicastipaddress_row">MIB_UNICASTIPADDRESS_ROW</a> pointed to by the <i>Row</i> parameter could not be found.  
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
     * The request is not supported. This error is returned if no IPv4 stack is on the local computer and an IPv4 address was specified in the <b>Address</b> member <a href="/windows/desktop/api/netioapi/ns-netioapi-mib_unicastipaddress_row">MIB_UNICASTIPADDRESS_ROW</a> pointed to by the <i>Row</i> parameter. This error is also returned if no IPv6 stack is on the local computer and an IPv6 address was specified in the <b>Address</b> member.
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//netioapi/nf-netioapi-deleteunicastipaddressentry
     * @since windows6.0.6000
     */
    static DeleteUnicastIpAddressEntry(Row) {
        result := DllCall("IPHLPAPI.dll\DeleteUnicastIpAddressEntry", "ptr", Row, "uint")
        return result
    }

    /**
     * Retrieves information for an existing unicast IP address entry on the local computer.
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
     * The system cannot find the file specified. This error is returned if the  network interface LUID or interface index specified by the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> member of the <a href="/windows/desktop/api/netioapi/ns-netioapi-mib_unicastipaddress_row">MIB_UNICASTIPADDRESS_ROW</a> pointed to by the <i>Row</i> parameter is not a value on the local machine.
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
     * A parameter is incorrect. This error is returned if a <b>NULL</b> pointer is passed in the <i>Row</i> parameter, the <b>Address</b> member of the <a href="/windows/desktop/api/netioapi/ns-netioapi-mib_unicastipaddress_row">MIB_UNICASTIPADDRESS_ROW</a> pointed to by the <i>Row</i> parameter is not set to a valid unicast IPv4 or IPv6 address, or both the <b>InterfaceLuid</b> and <b>InterfaceIndex</b> members of the <b>MIB_UNICASTIPADDRESS_ROW</b> pointed to by the <i>Row</i> parameter are unspecified.
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
     * Element not found. This error is returned if the  network interface specified by the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> member of the <a href="/windows/desktop/api/netioapi/ns-netioapi-mib_unicastipaddress_row">MIB_UNICASTIPADDRESS_ROW</a> structure pointed to by the <i>Row</i> parameter does not match the IP address specified in the <b>Address</b> member in the <b>MIB_UNICASTIPADDRESS_ROW</b> structure.
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
     * The request is not supported. This error is returned if no IPv4 stack is on the local computer and an IPv4 address is specified in the <b>Address</b> member of the  <a href="/windows/desktop/api/netioapi/ns-netioapi-mib_unicastipaddress_row">MIB_UNICASTIPADDRESS_ROW</a> structure pointed to by the <i>Row</i> parameter. This error is also returned if no IPv6 stack is on the local computer and an IPv6 address is specified in the <b>Address</b> member. 
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//netioapi/nf-netioapi-getunicastipaddressentry
     * @since windows6.0.6000
     */
    static GetUnicastIpAddressEntry(Row) {
        result := DllCall("IPHLPAPI.dll\GetUnicastIpAddressEntry", "ptr", Row, "uint")
        return result
    }

    /**
     * Retrieves the unicast IP address table on the local computer.
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
     * @param {Pointer<Pointer<MIB_UNICASTIPADDRESS_TABLE>>} Table A pointer to a 
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//netioapi/nf-netioapi-getunicastipaddresstable
     * @since windows6.0.6000
     */
    static GetUnicastIpAddressTable(Family, Table) {
        TableMarshal := Table is VarRef ? "ptr*" : "ptr"

        result := DllCall("IPHLPAPI.dll\GetUnicastIpAddressTable", "ushort", Family, TableMarshal, Table, "uint")
        return result
    }

    /**
     * Initializes a MIB_UNICASTIPADDRESS_ROW structure with default values for a unicast IP address entry on the local computer.
     * @param {Pointer<MIB_UNICASTIPADDRESS_ROW>} Row On entry, a pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_unicastipaddress_row">MIB_UNICASTIPADDRESS_ROW</a> structure entry for a unicast IP address entry. On return, the  <b>MIB_UNICASTIPADDRESS_ROW</b> structure pointed to by this parameter is initialized with default values for a unicast IP address.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//netioapi/nf-netioapi-initializeunicastipaddressentry
     * @since windows6.0.6000
     */
    static InitializeUnicastIpAddressEntry(Row) {
        DllCall("IPHLPAPI.dll\InitializeUnicastIpAddressEntry", "ptr", Row)
    }

    /**
     * Registers to be notified for changes to all unicast IP interfaces, unicast IPv4 addresses, or unicast IPv6 addresses on a local computer.
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
     * @param {BOOLEAN} InitialNotification A value that indicates whether the callback should be invoked
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//netioapi/nf-netioapi-notifyunicastipaddresschange
     * @since windows6.0.6000
     */
    static NotifyUnicastIpAddressChange(Family, Callback, CallerContext, InitialNotification, NotificationHandle) {
        CallerContextMarshal := CallerContext is VarRef ? "ptr" : "ptr"

        result := DllCall("IPHLPAPI.dll\NotifyUnicastIpAddressChange", "ushort", Family, "ptr", Callback, CallerContextMarshal, CallerContext, "char", InitialNotification, "ptr", NotificationHandle, "uint")
        return result
    }

    /**
     * Retrieves the stable unicast IP address table on a local computer.
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
     * @param {Pointer<Pointer<MIB_UNICASTIPADDRESS_TABLE>>} Table A pointer to a 
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//netioapi/nf-netioapi-notifystableunicastipaddresstable
     * @since windows6.0.6000
     */
    static NotifyStableUnicastIpAddressTable(Family, Table, CallerCallback, CallerContext, NotificationHandle) {
        TableMarshal := Table is VarRef ? "ptr*" : "ptr"
        CallerContextMarshal := CallerContext is VarRef ? "ptr" : "ptr"

        result := DllCall("IPHLPAPI.dll\NotifyStableUnicastIpAddressTable", "ushort", Family, TableMarshal, Table, "ptr", CallerCallback, CallerContextMarshal, CallerContext, "ptr", NotificationHandle, "uint")
        return result
    }

    /**
     * Sets the properties of an existing unicast IP address entry on the local computer.
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
     * An invalid parameter was passed to the function. This error is returned if a <b>NULL</b> pointer is passed in the <i>Row</i> parameter, the <b>Address</b> member of the <a href="/windows/desktop/api/netioapi/ns-netioapi-mib_unicastipaddress_row">MIB_UNICASTIPADDRESS_ROW</a> pointed to by the <i>Row</i> parameter was not set to a valid unicast IPv4 or IPv6 address, or both the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> members of the <b>MIB_UNICASTIPADDRESS_ROW</b> pointed to by the <i>Row</i> parameter were unspecified.
     * 
     * This error is also returned for other errors in the values set for members in the <a href="/windows/desktop/api/netioapi/ns-netioapi-mib_unicastipaddress_row">MIB_UNICASTIPADDRESS_ROW</a> structure. These errors include the following: if the <b>ValidLifetime</b> member is less than than the <b>PreferredLifetime</b> member, if the <b>PrefixOrigin</b> member is set to <b>IpPrefixOriginUnchanged</b> and the <b>SuffixOrigin</b> is the not set to <b>IpSuffixOriginUnchanged</b>, if the <b>PrefixOrigin</b> member is not set to <b>IpPrefixOriginUnchanged</b> and the <b>SuffixOrigin</b> is set to <b>IpSuffixOriginUnchanged</b>, if the <b>PrefixOrigin</b> member is not set to a value from the <b>NL_PREFIX_ORIGIN</b> enumeration, if the <b>SuffixOrigin</b> member is not set to a value from the <b>NL_SUFFIX_ORIGIN</b> enumeration, or if the <b>OnLinkPrefixLength</b> member is set to a value greater than the IP address length, in bits (32 for an unicast IPv4 address or 128 for an unicast IPv6 address).
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
     * The specified interface could not be found. This error is returned if the  network interface specified by the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> member of the <a href="/windows/desktop/api/netioapi/ns-netioapi-mib_unicastipaddress_row">MIB_UNICASTIPADDRESS_ROW</a> pointed to by the <i>Row</i> parameter could not be found.  
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
     * The request is not supported. This error is returned if no IPv4 stack is on the local computer and an IPv4 address was specified in the <b>Address</b> member <a href="/windows/desktop/api/netioapi/ns-netioapi-mib_unicastipaddress_row">MIB_UNICASTIPADDRESS_ROW</a> pointed to by the <i>Row</i> parameter or no IPv6 stack is on the local computer and an IPv6 address was specified in the <b>Address</b> member.
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//netioapi/nf-netioapi-setunicastipaddressentry
     * @since windows6.0.6000
     */
    static SetUnicastIpAddressEntry(Row) {
        result := DllCall("IPHLPAPI.dll\SetUnicastIpAddressEntry", "ptr", Row, "uint")
        return result
    }

    /**
     * Adds a new anycast IP address entry on the local computer.
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
     * An invalid parameter was passed to the function. This error is returned if a <b>NULL</b> pointer is passed in the <i>Row</i> parameter, the <b>Address</b> member of the <a href="/windows/desktop/api/netioapi/ns-netioapi-mib_anycastipaddress_row">MIB_ANYCASTIPADDRESS_ROW</a> pointed to by the <i>Row</i> parameter was not set to a valid unicast IPv4 or IPv6 address, or both the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> members of the <b>MIB_ANYCASTIPADDRESS_ROW</b> pointed to by the <i>Row</i> parameter were unspecified. 
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
     * The specified interface could not be found. This error is returned if the  network interface specified by the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> member of the <a href="/windows/desktop/api/netioapi/ns-netioapi-mib_anycastipaddress_row">MIB_ANYCASTIPADDRESS_ROW</a> pointed to by the <i>Row</i> parameter could not be found.  
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
     * The request is not supported. This error is returned if no IPv4 stack is on the local computer and an IPv4 address was specified in the <b>Address</b> member of the <a href="/windows/desktop/api/netioapi/ns-netioapi-mib_anycastipaddress_row">MIB_ANYCASTIPADDRESS_ROW</a> pointed to by the <i>Row</i> parameter. This error is also returned if no IPv6 stack is on the local computer and an IPv6 address was specified in the <b>Address</b> member.
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
     * The object already exists. This error is returned if the  <b>Address</b> member of the <a href="/windows/desktop/api/netioapi/ns-netioapi-mib_anycastipaddress_row">MIB_ANYCASTIPADDRESS_ROW</a> pointed to by the <i>Row</i> parameter is a duplicate of an existing anycast IP address on the interface specified by the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> member of the <b>MIB_ANYCASTIPADDRESS_ROW</b>.  
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//netioapi/nf-netioapi-createanycastipaddressentry
     * @since windows6.0.6000
     */
    static CreateAnycastIpAddressEntry(Row) {
        result := DllCall("IPHLPAPI.dll\CreateAnycastIpAddressEntry", "ptr", Row, "uint")
        return result
    }

    /**
     * Deletes an existing anycast IP address entry on the local computer.
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
     * An invalid parameter was passed to the function. This error is returned if a <b>NULL</b> pointer is passed in the <i>Row</i> parameter, the <b>Address</b> member of the <a href="/windows/desktop/api/netioapi/ns-netioapi-mib_anycastipaddress_row">MIB_ANYCASTIPADDRESS_ROW</a> pointed to by the <i>Row</i> parameter was not set to a valid unicast IPv4 or IPv6 address, or both the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> members of the <b>MIB_ANYCASTIPADDRESS_ROW</b> pointed to by the <i>Row</i> parameter were unspecified.
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
     * The specified interface could not be found. This error is returned if the  network interface specified by the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> member of the <a href="/windows/desktop/api/netioapi/ns-netioapi-mib_anycastipaddress_row">MIB_ANYCASTIPADDRESS_ROW</a> pointed to by the <i>Row</i> parameter could not be found.  
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
     * The request is not supported. This error is returned if no IPv4 stack is on the local computer and an IPv4 address was specified in the <b>Address</b> member <a href="/windows/desktop/api/netioapi/ns-netioapi-mib_anycastipaddress_row">MIB_ANYCASTIPADDRESS_ROW</a> pointed to by the <i>Row</i> parameter. This error is also returned if no IPv6 stack is on the local computer and an IPv6 address was specified in the <b>Address</b> member .
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//netioapi/nf-netioapi-deleteanycastipaddressentry
     * @since windows6.0.6000
     */
    static DeleteAnycastIpAddressEntry(Row) {
        result := DllCall("IPHLPAPI.dll\DeleteAnycastIpAddressEntry", "ptr", Row, "uint")
        return result
    }

    /**
     * Retrieves information for an existing anycast IP address entry on the local computer.
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
     * The system cannot find the file specified. This error is returned if the  network interface LUID or interface index specified by the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> member of the <a href="/windows/desktop/api/netioapi/ns-netioapi-mib_anycastipaddress_row">MIB_ANYCASTIPADDRESS_ROW</a> pointed to by the <i>Row</i> parameter is not a value on the local machine.
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
     * A parameter is incorrect. This error is returned if a <b>NULL</b> pointer is passed in the <i>Row</i> parameter, the <b>Address</b> member of the <a href="/windows/desktop/api/netioapi/ns-netioapi-mib_anycastipaddress_row">MIB_ANYCASTIPADDRESS_ROW</a> pointed to by the <i>Row</i> parameter is not set to a valid anycast IPv4 or IPv6 address, or both the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> members of the <b>MIB_ANYCASTIPADDRESS_ROW</b> pointed to by the <i>Row</i> parameter were unspecified.
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
     * Element not found. This error is returned if the  network interface specified by the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> member of the <a href="/windows/desktop/api/netioapi/ns-netioapi-mib_anycastipaddress_row">MIB_ANYCASTIPADDRESS_ROW</a> structure pointed to by the <i>Row</i> parameter does not match the IP address and address family specified in the <b>Address</b> member in the <b>MIB_ANYCASTIPADDRESS_ROW</b> structure.
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
     * The request is not supported. This error is returned if no IPv4 stack is on the local computer and an IPv4 address is specified in the <b>Address</b> member of the <a href="/windows/desktop/api/netioapi/ns-netioapi-mib_unicastipaddress_row">MIB_UNICASTIPADDRESS_ROW</a> structure pointed to by the <i>Row</i> parameter. This error is returned if no IPv6 stack is on the local computer and an IPv6 address is specified in the  <b>Address</b> member. 
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//netioapi/nf-netioapi-getanycastipaddressentry
     * @since windows6.0.6000
     */
    static GetAnycastIpAddressEntry(Row) {
        result := DllCall("IPHLPAPI.dll\GetAnycastIpAddressEntry", "ptr", Row, "uint")
        return result
    }

    /**
     * Retrieves the anycast IP address table on the local computer.
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
     * @param {Pointer<Pointer<MIB_ANYCASTIPADDRESS_TABLE>>} Table A pointer to a 
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//netioapi/nf-netioapi-getanycastipaddresstable
     * @since windows6.0.6000
     */
    static GetAnycastIpAddressTable(Family, Table) {
        TableMarshal := Table is VarRef ? "ptr*" : "ptr"

        result := DllCall("IPHLPAPI.dll\GetAnycastIpAddressTable", "ushort", Family, TableMarshal, Table, "uint")
        return result
    }

    /**
     * Retrieves information for an existing multicast IP address entry on the local computer.
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
     * The system cannot find the file specified. This error is returned if the  network interface LUID or interface index specified by the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> member of the <a href="/windows/desktop/api/netioapi/ns-netioapi-mib_multicastipaddress_row">MIB_MULTICASTIPADDRESS_ROW</a> pointed to by the <i>Row</i> parameter is not a value on the local machine.
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
     * A parameter is incorrect. This error is returned if a <b>NULL</b> pointer is passed in the <i>Row</i> parameter, the <b>Address</b> member of the <a href="/windows/desktop/api/netioapi/ns-netioapi-mib_multicastipaddress_row">MIB_MULTICASTIPADDRESS_ROW</a> pointed to by the <i>Row</i> parameter is not set to a valid multicast IPv4 or IPv6 address, or both the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> members of the <b>MIB_MULTICASTIPADDRESS_ROW</b> pointed to by the <i>Row</i> parameter are unspecified.
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
     * Element not found. This error is returned if the  network interface specified by the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> member of the <a href="/windows/desktop/api/netioapi/ns-netioapi-mib_multicastipaddress_row">MIB_MULTICASTIPADDRESS_ROW</a> structure pointed to by the <i>Row</i> parameter does not match the IP address and address family specified in the <b>Address</b> member in the <b>MIB_MULTICASTIPADDRESS_ROW</b>  structure.
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
     * The request is not supported. This error is returned if no IPv4 stack is on the local computer and an IPv4 address is specified in the <b>Address</b> member <a href="/windows/desktop/api/netioapi/ns-netioapi-mib_multicastipaddress_row">MIB_MULTICASTIPADDRESS_ROW</a> pointed to by the <i>Row</i> parameter. This error is also returned if no IPv6 stack is on the local computer and an IPv6 address is specified in the <b>Address</b> member. 
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//netioapi/nf-netioapi-getmulticastipaddressentry
     * @since windows6.0.6000
     */
    static GetMulticastIpAddressEntry(Row) {
        result := DllCall("IPHLPAPI.dll\GetMulticastIpAddressEntry", "ptr", Row, "uint")
        return result
    }

    /**
     * Retrieves the multicast IP address table on the local computer.
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
     * @param {Pointer<Pointer<MIB_MULTICASTIPADDRESS_TABLE>>} Table A pointer to a 
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//netioapi/nf-netioapi-getmulticastipaddresstable
     * @since windows6.0.6000
     */
    static GetMulticastIpAddressTable(Family, Table) {
        TableMarshal := Table is VarRef ? "ptr*" : "ptr"

        result := DllCall("IPHLPAPI.dll\GetMulticastIpAddressTable", "ushort", Family, TableMarshal, Table, "uint")
        return result
    }

    /**
     * Creates a new IP route entry on the local computer.
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
     * An invalid parameter was passed to the function. This error is returned if a <b>NULL</b> pointer is passed in the <i>Row</i> parameter, the <b>DestinationPrefix</b> member of the <a href="/windows/desktop/api/netioapi/ns-netioapi-mib_ipforward_row2">MIB_IPFORWARD_ROW2</a> pointed to by the <i>Row</i> parameter was not specified, the <b>NextHop</b> member of the <b>MIB_IPFORWARD_ROW2</b> pointed to by the <i>Row</i> parameter was not specified, or both the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> members of the <b>MIB_IPFORWARD_ROW2</b> pointed to by the <i>Row</i> parameter were unspecified. This error is also returned if the <b>PreferredLifetime</b> member specified in the <b>MIB_IPFORWARD_ROW2</b> is greater than the <b>ValidLifetime</b> member or if the <b>SitePrefixLength</b> in the <b>MIB_IPFORWARD_ROW2</b> is greater than the prefix length specified in the <b>DestinationPrefix</b>. 
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
     * The specified interface could not be found. This error is returned if the  network interface specified by the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> member of the <a href="/windows/desktop/api/netioapi/ns-netioapi-mib_ipnet_row2">MIB_IPNET_ROW2</a> pointed to by the <i>Row</i> parameter could not be found.  
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
     * The request is not supported. This error is returned if the interface specified does not support routes. This error is also returned if no IPv4 stack is on the local computer and <b>AF_INET</b> was specified in the address family in the <b>DestinationPrefix</b> member of the <a href="/windows/desktop/api/netioapi/ns-netioapi-mib_ipforward_row2">MIB_IPFORWARD_ROW2</a> pointed to by the <i>Row</i> parameter. This error is also returned if no IPv6 stack is on the local computer and <b>AF_INET6</b>  was specified for the address family in the <b>DestinationPrefix</b> member.
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
     * The object already exists. This error is returned if the  <b>DestinationPrefix</b> member of the <a href="/windows/desktop/api/netioapi/ns-netioapi-mib_ipforward_row2">MIB_IPFORWARD_ROW2</a> pointed to by the <i>Row</i> parameter is a duplicate of an existing IP route entry on the interface specified by the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> member of the <b>MIB_IPFORWARD_ROW2</b>.  
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//netioapi/nf-netioapi-createipforwardentry2
     * @since windows6.0.6000
     */
    static CreateIpForwardEntry2(Row) {
        result := DllCall("IPHLPAPI.dll\CreateIpForwardEntry2", "ptr", Row, "uint")
        return result
    }

    /**
     * Deletes an IP route entry on the local computer.
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
     * An invalid parameter was passed to the function. This error is returned if a <b>NULL</b> pointer is passed in the <i>Row</i> parameter, the <b>DestinationPrefix</b> member of the <a href="/windows/desktop/api/netioapi/ns-netioapi-mib_ipforward_row2">MIB_IPFORWARD_ROW2</a> pointed to by the <i>Row</i> parameter was not specified, the <b>NextHop</b> member of the <b>MIB_IPFORWARD_ROW2</b> pointed to by the <i>Row</i> parameter was not specified, or both the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> members of the <b>MIB_IPFORWARD_ROW2</b> pointed to by the <i>Row</i> parameter were unspecified.
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
     * The specified interface could not be found. This error is returned if the  network interface specified by the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> member of the <a href="/windows/desktop/api/netioapi/ns-netioapi-mib_ipforward_row2">MIB_IPFORWARD_ROW2</a> pointed to by the <i>Row</i> parameter could not be found.  
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
     * The request is not supported. This error is returned if no IPv4 stack is on the local computer and an IPv4 address was specified in the <b>Address</b> member of the <a href="/windows/desktop/api/netioapi/ns-netioapi-mib_ipforward_row2">MIB_IPFORWARD_ROW2</a> pointed to by the <i>Row</i> parameter. This error is also returned if no IPv6 stack is on the local computer and an IPv6 address was specified in the <b>Address</b> member. 
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//netioapi/nf-netioapi-deleteipforwardentry2
     * @since windows6.0.6000
     */
    static DeleteIpForwardEntry2(Row) {
        result := DllCall("IPHLPAPI.dll\DeleteIpForwardEntry2", "ptr", Row, "uint")
        return result
    }

    /**
     * Retrieves the IP route entry on the local computer for the best route to the specified destination IP address.
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//netioapi/nf-netioapi-getbestroute2
     * @since windows6.0.6000
     */
    static GetBestRoute2(InterfaceLuid, InterfaceIndex, SourceAddress, DestinationAddress, AddressSortOptions, BestRoute, BestSourceAddress) {
        result := DllCall("IPHLPAPI.dll\GetBestRoute2", "ptr", InterfaceLuid, "uint", InterfaceIndex, "ptr", SourceAddress, "ptr", DestinationAddress, "uint", AddressSortOptions, "ptr", BestRoute, "ptr", BestSourceAddress, "uint")
        return result
    }

    /**
     * Retrieves information for an IP route entry on the local computer.
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
     * An invalid parameter was passed to the function. This error is returned if a <b>NULL</b> pointer is passed in the <i>Row</i> parameter, the <b>DestinationPrefix</b> member of the <a href="/windows/desktop/api/netioapi/ns-netioapi-mib_ipforward_row2">MIB_IPFORWARD_ROW2</a> pointed to by the <i>Row</i> parameter was not specified, the <b>NextHop</b> member of the <b>MIB_IPFORWARD_ROW2</b> pointed to by the <i>Row</i> parameter was not specified, or both the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> members of the <b>MIB_IPFORWARD_ROW2</b> pointed to by the <i>Row</i> parameter were unspecified.
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
     * Element not found. This error is returned if the  network interface specified by the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> member of the <a href="/windows/desktop/api/netioapi/ns-netioapi-mib_ipforward_row2">MIB_IPFORWARD_ROW2</a> structure pointed to by the <i>Row</i> parameter does not match the IP address prefix and address family specified in the <b>DestinationPrefix</b>  member in the <b>MIB_IPFORWARD_ROW2</b> structure.
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
     * The request is not supported. This error is returned if no IPv4 stack is on the local computer and <b>AF_INET</b> was specified in the address family in the <b>DestinationPrefix</b> member of the <a href="/windows/desktop/api/netioapi/ns-netioapi-mib_ipforward_row2">MIB_IPFORWARD_ROW2</a> pointed to by the <i>Row</i> parameter. This error is also returned if no IPv6 stack is on the local computer and <b>AF_INET6</b>  was specified for the address family in the <b>DestinationPrefix</b> member.
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//netioapi/nf-netioapi-getipforwardentry2
     * @since windows6.0.6000
     */
    static GetIpForwardEntry2(Row) {
        result := DllCall("IPHLPAPI.dll\GetIpForwardEntry2", "ptr", Row, "uint")
        return result
    }

    /**
     * The GetIpForwardTable2 function retrieves the IP route entries on the local computer.
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
     * @param {Pointer<Pointer<MIB_IPFORWARD_TABLE2>>} Table A pointer to a 
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//netioapi/nf-netioapi-getipforwardtable2
     * @since windows6.0.6000
     */
    static GetIpForwardTable2(Family, Table) {
        TableMarshal := Table is VarRef ? "ptr*" : "ptr"

        result := DllCall("IPHLPAPI.dll\GetIpForwardTable2", "ushort", Family, TableMarshal, Table, "uint")
        return result
    }

    /**
     * Initializes a MIB_IPFORWARD_ROW2 structure with default values for an IP route entry on the local computer.
     * @param {Pointer<MIB_IPFORWARD_ROW2>} Row On entry, a pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipforward_row2">MIB_IPFORWARD_ROW2</a> structure entry for an IP route entry. On return, the  <b>MIB_IPFORWARD_ROW2</b> structure pointed to by this parameter is initialized with default values for an IP route entry.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//netioapi/nf-netioapi-initializeipforwardentry
     * @since windows6.0.6000
     */
    static InitializeIpForwardEntry(Row) {
        DllCall("IPHLPAPI.dll\InitializeIpForwardEntry", "ptr", Row)
    }

    /**
     * Registers to be notified for changes to IP route entries on a local computer.
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
     * @param {BOOLEAN} InitialNotification A value that indicates whether the callback should be invoked
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//netioapi/nf-netioapi-notifyroutechange2
     * @since windows6.0.6000
     */
    static NotifyRouteChange2(AddressFamily, Callback, CallerContext, InitialNotification, NotificationHandle) {
        CallerContextMarshal := CallerContext is VarRef ? "ptr" : "ptr"

        result := DllCall("IPHLPAPI.dll\NotifyRouteChange2", "ushort", AddressFamily, "ptr", Callback, CallerContextMarshal, CallerContext, "char", InitialNotification, "ptr", NotificationHandle, "uint")
        return result
    }

    /**
     * Sets the properties of an IP route entry on the local computer.
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
     * An invalid parameter was passed to the function. This error is returned if a <b>NULL</b> pointer is passed in the <i>Route</i> parameter, the <b>DestinationPrefix</b> member of the <a href="/windows/desktop/api/netioapi/ns-netioapi-mib_ipforward_row2">MIB_IPFORWARD_ROW2</a> pointed to by the <i>Route</i> parameter was not specified, the <b>NextHop</b> member of the <b>MIB_IPFORWARD_ROW2</b> pointed to by the <i>Route</i> parameter was not specified, or both the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> members of the <b>MIB_IPFORWARD_ROW2</b> pointed to by the <i>Route</i> parameter were unspecified.
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
     * The specified interface could not be found. This error is returned if the  network interface specified by the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> member of the <a href="/windows/desktop/api/netioapi/ns-netioapi-mib_ipforward_row2">MIB_IPFORWARD_ROW2</a> pointed to by the <i>Route</i> parameter could not be found.  
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//netioapi/nf-netioapi-setipforwardentry2
     * @since windows6.0.6000
     */
    static SetIpForwardEntry2(Route) {
        result := DllCall("IPHLPAPI.dll\SetIpForwardEntry2", "ptr", Route, "uint")
        return result
    }

    /**
     * The FlushIpPathTable function flushes the IP path table on the local computer.
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//netioapi/nf-netioapi-flushippathtable
     * @since windows6.0.6000
     */
    static FlushIpPathTable(Family) {
        result := DllCall("IPHLPAPI.dll\FlushIpPathTable", "ushort", Family, "uint")
        return result
    }

    /**
     * Retrieves information for a IP path entry on the local computer.
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
     * The system cannot find the file specified. This error is returned if the  network interface LUID or interface index specified by the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> member of the <a href="/windows/desktop/api/netioapi/ns-netioapi-mib_ippath_row">MIB_IPPATH_ROW</a> pointed to by the <i>Row</i> parameter is not a value on the local machine.
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
     * A parameter is incorrect. This error is returned if a <b>NULL</b> pointer is passed in the <i>Row</i> parameter, the <b>si_family</b> member in the <b>Destination</b> member of the <a href="/windows/desktop/api/netioapi/ns-netioapi-mib_ippath_row">MIB_IPPATH_ROW</a> pointed to by the <i>Row</i> parameter is not set to <b>AF_INET</b> or <b>AF_INET6</b>, or both the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> members of the <b>MIB_IPPATH_ROW</b> pointed to by the <i>Row</i> parameter are unspecified. This error is also returned if the <b>si_family</b> member in the <b>Source</b> member of the <b>MIB_IPPATH_ROW</b> pointed to by the <i>Row</i> parameter did not match the destination IP address family and the <b>si_family</b> for the source IP address is not specified as <b>AF_UNSPEC</b>.
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
     * Element not found. This error is returned if the  network interface specified by the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> member of the <a href="/windows/desktop/api/netioapi/ns-netioapi-mib_ippath_row">MIB_IPPATH_ROW</a> structure pointed to by the <i>Row</i> parameter does not match the IP address and address family specified in the <b>Destination</b> member in the <b>MIB_IPPATH_ROW</b> structure.
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
     * The request is not supported. This error is returned if no IPv4 stack is on the local computer and an IPv4 address is specified in the <b>Source</b> and <b>Destination</b> members of the <a href="/windows/desktop/api/netioapi/ns-netioapi-mib_ippath_row">MIB_IPPATH_ROW</a> pointed to by the <i>Row</i> parameter. This error is also returned if no IPv6 stack is on the local computer and an IPv6 address is specified in the <b>Source</b> and <b>Destination</b> members. 
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//netioapi/nf-netioapi-getippathentry
     * @since windows6.0.6000
     */
    static GetIpPathEntry(Row) {
        result := DllCall("IPHLPAPI.dll\GetIpPathEntry", "ptr", Row, "uint")
        return result
    }

    /**
     * The GetIpPathTable function retrieves the IP path table on the local computer.
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
     * @param {Pointer<Pointer<MIB_IPPATH_TABLE>>} Table A pointer to a 
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//netioapi/nf-netioapi-getippathtable
     * @since windows6.0.6000
     */
    static GetIpPathTable(Family, Table) {
        TableMarshal := Table is VarRef ? "ptr*" : "ptr"

        result := DllCall("IPHLPAPI.dll\GetIpPathTable", "ushort", Family, TableMarshal, Table, "uint")
        return result
    }

    /**
     * Creates a new neighbor IP address entry on the local computer.
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
     * An invalid parameter was passed to the function. This error is returned if a <b>NULL</b> pointer is passed in the <i>Row</i> parameter, the <b>Address</b> member of the <a href="/windows/desktop/api/netioapi/ns-netioapi-mib_ipnet_row2">MIB_IPNET_ROW2</a> pointed to by the <i>Row</i> parameter was not set to a valid unicast, anycast, or multicast IPv4 or IPv6 address, the <b>PhysicalAddress</b> and <b>PhysicalAddressLength</b> members of the <b>MIB_IPNET_ROW2</b> pointed to by the <i>Row</i> parameter were not set to a valid physical address,  or both the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> members of the <b>MIB_IPNET_ROW2</b> pointed to by the <i>Row</i> parameter were unspecified. This error is also returned if a loopback address was passed in the <b>Address</b> member. 
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
     * The specified interface could not be found. This error is returned if the  network interface specified by the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> member of the <a href="/windows/desktop/api/netioapi/ns-netioapi-mib_ipnet_row2">MIB_IPNET_ROW2</a> pointed to by the <i>Row</i> parameter could not be found.  
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
     * The request is not supported. This error is returned if no IPv4 stack is on the local computer and an IPv4 address was specified in the <b>Address</b> member of the <a href="/windows/desktop/api/netioapi/ns-netioapi-mib_ipnet_row2">MIB_IPNET_ROW2</a> pointed to by the <i>Row</i> parameter. This error is also returned if no IPv6 stack is on the local computer and an IPv6 address was specified in the <b>Address</b> member.
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
     * The object already exists. This error is returned if the  <b>Address</b> member of the <a href="/windows/desktop/api/netioapi/ns-netioapi-mib_ipnet_row2">MIB_IPNET_ROW2</a> pointed to by the <i>Row</i> parameter is a duplicate of an existing neighbor IP address on the interface specified by the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> member of the <b>MIB_IPNET_ROW2</b>.  
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//netioapi/nf-netioapi-createipnetentry2
     * @since windows6.0.6000
     */
    static CreateIpNetEntry2(Row) {
        result := DllCall("IPHLPAPI.dll\CreateIpNetEntry2", "ptr", Row, "uint")
        return result
    }

    /**
     * Deletes a neighbor IP address entry on the local computer.
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
     * An invalid parameter was passed to the function. This error is returned if a <b>NULL</b> pointer is passed in the <i>Row</i> parameter, the <b>Address</b> member of the <a href="/windows/desktop/api/netioapi/ns-netioapi-mib_ipnet_row2">MIB_IPNET_ROW2</a> pointed to by the <i>Row</i> parameter was not set to a valid neighbor IPv4 or IPv6 address, or both the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> members of the <b>MIB_IPNET_ROW2</b> pointed to by the <i>Row</i> parameter were unspecified.
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
     * The specified interface could not be found. This error is returned if the  network interface specified by the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> member of the <a href="/windows/desktop/api/netioapi/ns-netioapi-mib_ipnet_row2">MIB_IPNET_ROW2</a> pointed to by the <i>Row</i> parameter could not be found.  
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
     * The request is not supported. This error is returned if no IPv4 stack is on the local computer and an IPv4 address was specified in the <b>Address</b> member of the <a href="/windows/desktop/api/netioapi/ns-netioapi-mib_ipnet_row2">MIB_IPNET_ROW2</a> pointed to by the <i>Row</i> parameter. This error is also returned if no IPv6 stack is on the local computer and an IPv6 address was specified in the <b>Address</b> member. 
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//netioapi/nf-netioapi-deleteipnetentry2
     * @since windows6.0.6000
     */
    static DeleteIpNetEntry2(Row) {
        result := DllCall("IPHLPAPI.dll\DeleteIpNetEntry2", "ptr", Row, "uint")
        return result
    }

    /**
     * The FlushIpNetTable2 function flushes the IP neighbor table on the local computer.
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//netioapi/nf-netioapi-flushipnettable2
     * @since windows6.0.6000
     */
    static FlushIpNetTable2(Family, InterfaceIndex) {
        result := DllCall("IPHLPAPI.dll\FlushIpNetTable2", "ushort", Family, "uint", InterfaceIndex, "uint")
        return result
    }

    /**
     * Retrieves information for a neighbor IP address entry on the local computer.
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
     * The system cannot find the file specified. This error is returned if the  network interface LUID or interface index specified by the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> member of the <a href="/windows/desktop/api/netioapi/ns-netioapi-mib_ipnet_row2">MIB_IPNET_ROW2</a> pointed to by the <i>Row</i> parameter was not a value on the local machine.
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
     * An invalid parameter was passed to the function. This error is returned if a <b>NULL</b> pointer is passed in the <i>Row</i> parameter, the <b>Address</b> member of the <a href="/windows/desktop/api/netioapi/ns-netioapi-mib_ipnet_row2">MIB_IPNET_ROW2</a> pointed to by the <i>Row</i> parameter was not set to a valid neighbor IPv4 or IPv6 address, or both the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> members of the <b>MIB_IPNET_ROW2</b> pointed to by the <i>Row</i> parameter were unspecified.
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
     * Element not found. This error is returned if the  network interface specified by the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> member of the <a href="/windows/desktop/api/netioapi/ns-netioapi-mib_ipnet_row2">MIB_IPNET_ROW2</a> structure pointed to by the <i>Row</i> parameter does not match the neighbor IP address and address family specified in the <b>Address</b> member in the <b>MIB_IPNET_ROW2</b> structure.
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
     * The request is not supported. This error is returned if no IPv4 stack is on the local computer and an IPv4 address was specified in the <b>Address</b> member of the <a href="/windows/desktop/api/netioapi/ns-netioapi-mib_ipnet_row2">MIB_IPNET_ROW2</a> structure pointed to by the <i>Row</i> parameter. This error is also returned if no IPv6 stack is on the local computer and an IPv6 address was specified in the <b>Address</b> member of the <b>MIB_IPNET_ROW2</b> structure.
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//netioapi/nf-netioapi-getipnetentry2
     * @since windows6.0.6000
     */
    static GetIpNetEntry2(Row) {
        result := DllCall("IPHLPAPI.dll\GetIpNetEntry2", "ptr", Row, "uint")
        return result
    }

    /**
     * The GetIpNetTable2 function retrieves the IP neighbor table on the local computer.
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
     * @param {Pointer<Pointer<MIB_IPNET_TABLE2>>} Table A pointer to a 
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
     * This return value indicates that the call to the <a href="/windows/desktop/api/netioapi/nf-netioapi-getipnettable2">GetIpNetTable2</a> function succeeded, but there was no data to return. This can occur when AF_INET is specified in the <i>Family</i> parameter and there are no ARP entries to return.
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//netioapi/nf-netioapi-getipnettable2
     * @since windows6.0.6000
     */
    static GetIpNetTable2(Family, Table) {
        TableMarshal := Table is VarRef ? "ptr*" : "ptr"

        result := DllCall("IPHLPAPI.dll\GetIpNetTable2", "ushort", Family, TableMarshal, Table, "uint")
        return result
    }

    /**
     * Resolves the physical address for a neighbor IP address entry on the local computer.
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
     * An invalid parameter was passed to the function. This error is returned if a <b>NULL</b> pointer is passed in the <i>Row</i> parameter, the <b>Address</b> member of the <a href="/windows/desktop/api/netioapi/ns-netioapi-mib_ipnet_row2">MIB_IPNET_ROW2</a> pointed to by the <i>Row</i> parameter was not set to a valid IPv4 or IPv6 address, or both the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> members of the <b>MIB_IPNET_ROW2</b> pointed to by the <i>Row</i> parameter were unspecified. This error is also returned if a loopback address was passed in the <b>Address</b> member. 
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
     * The specified interface could not be found. This error is returned if the  network interface specified by the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> member of the <a href="/windows/desktop/api/netioapi/ns-netioapi-mib_ipnet_row2">MIB_IPNET_ROW2</a> pointed to by the <i>Row</i> parameter could not be found.  
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
     * The request is not supported. This error is returned if no IPv4 stack is on the local computer and an IPv4 address was specified in the <b>Address</b> member of the <a href="/windows/desktop/api/netioapi/ns-netioapi-mib_ipnet_row2">MIB_IPNET_ROW2</a> pointed to by the <i>Row</i> parameter or no IPv6 stack is on the local computer and an IPv6 address was specified in the <b>Address</b> member.
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//netioapi/nf-netioapi-resolveipnetentry2
     * @since windows6.0.6000
     */
    static ResolveIpNetEntry2(Row, SourceAddress) {
        result := DllCall("IPHLPAPI.dll\ResolveIpNetEntry2", "ptr", Row, "ptr", SourceAddress, "uint")
        return result
    }

    /**
     * Sets the physical address of an existing neighbor IP address entry on the local computer.
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
     * An invalid parameter was passed to the function. This error is returned if a <b>NULL</b> pointer is passed in the <i>Row</i> parameter, the <b>Address</b> member of the <a href="/windows/desktop/api/netioapi/ns-netioapi-mib_ipnet_row2">MIB_IPNET_ROW2</a> pointed to by the <i>Row</i> parameter was not set to a valid unicast, anycast, or multicast IPv4 or IPv6 address, the <b>PhysicalAddress</b> and <b>PhysicalAddressLength</b> members of the <b>MIB_IPNET_ROW2</b> pointed to by the <i>Row</i> parameter were not set to a valid physical address,  or both the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> members of the <b>MIB_IPNET_ROW2</b> pointed to by the <i>Row</i> parameter were unspecified. This error is also returned if a loopback address was passed in the <b>Address</b> member. 
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
     * The specified interface could not be found. This error is returned if the  network interface specified by the <b>InterfaceLuid</b> or <b>InterfaceIndex</b> member of the <a href="/windows/desktop/api/netioapi/ns-netioapi-mib_ipnet_row2">MIB_IPNET_ROW2</a> pointed to by the <i>Row</i> parameter could not be found.  
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
     * The request is not supported. This error is returned if no IPv4 stack is on the local computer and an IPv4 address was specified in the <b>Address</b> member of the <a href="/windows/desktop/api/netioapi/ns-netioapi-mib_ipnet_row2">MIB_IPNET_ROW2</a> pointed to by the <i>Row</i> parameter or no IPv6 stack is on the local computer and an IPv6 address was specified in the <b>Address</b> member.
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//netioapi/nf-netioapi-setipnetentry2
     * @since windows6.0.6000
     */
    static SetIpNetEntry2(Row) {
        result := DllCall("IPHLPAPI.dll\SetIpNetEntry2", "ptr", Row, "uint")
        return result
    }

    /**
     * Registers to be notified for changes to the UDP port number used by the Teredo client for the Teredo service port on a local computer.
     * @param {Pointer<PTEREDO_PORT_CHANGE_CALLBACK>} Callback A pointer to the function to call when a Teredo client port change occurs. This function will be invoked
     *         when a Teredo port change notification is received.
     * @param {Pointer<Void>} CallerContext A user context passed to the callback function specified in the <i>Callback</i> parameter when a Teredo port change  notification is received.
     * @param {BOOLEAN} InitialNotification A value that indicates whether the callback should be invoked
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//netioapi/nf-netioapi-notifyteredoportchange
     * @since windows6.0.6000
     */
    static NotifyTeredoPortChange(Callback, CallerContext, InitialNotification, NotificationHandle) {
        CallerContextMarshal := CallerContext is VarRef ? "ptr" : "ptr"

        result := DllCall("IPHLPAPI.dll\NotifyTeredoPortChange", "ptr", Callback, CallerContextMarshal, CallerContext, "char", InitialNotification, "ptr", NotificationHandle, "uint")
        return result
    }

    /**
     * Retrieves the dynamic UDP port number used by the Teredo client on the local computer.
     * @param {Pointer<Integer>} Port A pointer to the  UDP port number. On successful return, this parameter will be filled with the port number used by the Teredo client.
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//netioapi/nf-netioapi-getteredoport
     * @since windows6.0.6000
     */
    static GetTeredoPort(Port) {
        PortMarshal := Port is VarRef ? "ushort*" : "ptr"

        result := DllCall("IPHLPAPI.dll\GetTeredoPort", PortMarshal, Port, "uint")
        return result
    }

    /**
     * Deregisters for change notifications for IP interface changes, IP address changes, IP route changes, Teredo port changes, and when the unicast IP address table is stable and can be retrieved.
     * @param {HANDLE} NotificationHandle The handle returned from a notification 
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//netioapi/nf-netioapi-cancelmibchangenotify2
     * @since windows6.0.6000
     */
    static CancelMibChangeNotify2(NotificationHandle) {
        NotificationHandle := NotificationHandle is Win32Handle ? NumGet(NotificationHandle, "ptr") : NotificationHandle

        result := DllCall("IPHLPAPI.dll\CancelMibChangeNotify2", "ptr", NotificationHandle, "uint")
        return result
    }

    /**
     * Frees the buffer allocated by the functions that return tables of network interfaces, addresses, and routes (GetIfTable2 and GetAnycastIpAddressTable, for example).
     * @param {Pointer<Void>} Memory A pointer to the buffer to free.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//netioapi/nf-netioapi-freemibtable
     * @since windows6.0.6000
     */
    static FreeMibTable(Memory) {
        MemoryMarshal := Memory is VarRef ? "ptr" : "ptr"

        DllCall("IPHLPAPI.dll\FreeMibTable", MemoryMarshal, Memory)
    }

    /**
     * Takes a supplied list of potential IP destination addresses, pairs the destination addresses with the host machine's local IP addresses, and sorts the pairs according to which address pair is best suited for communication between the two peers.
     * @param {Pointer<SOCKADDR_IN6>} SourceAddressList Must be <b>NULL</b>. Reserved for future use.
     * @param {Integer} SourceAddressCount Must be 0. Reserved for future use.
     * @param {Pointer<SOCKADDR_IN6>} DestinationAddressList A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/WinSock/sockaddr-2">SOCKADDR_IN6</a> structures that contain a list of potential IPv6 destination addresses.
     *         Any IPv4 addresses must be represented in the IPv4-mapped IPv6 address format which enables an IPv6 only application to communicate with an IPv4 node.
     * @param {Integer} DestinationAddressCount The number of destination addresses pointed to by the <i>DestinationAddressList</i> parameter.
     * @param {Integer} AddressSortOptions Reserved for future use.
     * @param {Pointer<Pointer<SOCKADDR_IN6_PAIR>>} SortedAddressPairList A pointer to store an array of <a href="https://docs.microsoft.com/windows/desktop/api/ws2ipdef/ns-ws2ipdef-sockaddr_in6_pair">SOCKADDR_IN6_PAIR</a> structures that contain a list of pairs of IPv6 addresses
     *         sorted in the preferred order of communication, if the function call is successful.
     * @param {Pointer<Integer>} SortedAddressPairCount A pointer to store the number of address pairs pointed to by the <i>SortedAddressPairList</i> parameter, if the function call is successful.
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
     * An invalid parameter was passed to the function. This error is returned if the <i>DestinationAddressList</i>, <i>SortedAddressPairList</i>, or  <i>SortedAddressPairCount</i> parameters <b>NULL</b>,  or the <i>DestinationAddressCount</i> was greated than 500. This error is also returned if the <i>SourceAddressList</i> is not <b>NULL</b> or the <i>SourceAddressPairCount</i> parameter is not zero. 
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//netioapi/nf-netioapi-createsortedaddresspairs
     * @since windows6.0.6000
     */
    static CreateSortedAddressPairs(SourceAddressList, SourceAddressCount, DestinationAddressList, DestinationAddressCount, AddressSortOptions, SortedAddressPairList, SortedAddressPairCount) {
        SortedAddressPairListMarshal := SortedAddressPairList is VarRef ? "ptr*" : "ptr"
        SortedAddressPairCountMarshal := SortedAddressPairCount is VarRef ? "uint*" : "ptr"

        result := DllCall("IPHLPAPI.dll\CreateSortedAddressPairs", "ptr", SourceAddressList, "uint", SourceAddressCount, "ptr", DestinationAddressList, "uint", DestinationAddressCount, "uint", AddressSortOptions, SortedAddressPairListMarshal, SortedAddressPairList, SortedAddressPairCountMarshal, SortedAddressPairCount, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} CompartmentGuid 
     * @param {Pointer<Integer>} CompartmentId 
     * @returns {Integer} 
     */
    static ConvertCompartmentGuidToId(CompartmentGuid, CompartmentId) {
        CompartmentIdMarshal := CompartmentId is VarRef ? "uint*" : "ptr"

        result := DllCall("IPHLPAPI.dll\ConvertCompartmentGuidToId", "ptr", CompartmentGuid, CompartmentIdMarshal, CompartmentId, "uint")
        return result
    }

    /**
     * 
     * @param {NET_IF_COMPARTMENT_ID} CompartmentId 
     * @param {Pointer<Guid>} CompartmentGuid 
     * @returns {Integer} 
     */
    static ConvertCompartmentIdToGuid(CompartmentId, CompartmentGuid) {
        result := DllCall("IPHLPAPI.dll\ConvertCompartmentIdToGuid", "uint", CompartmentId, "ptr", CompartmentGuid, "uint")
        return result
    }

    /**
     * Converts an ANSI network interface name to the locally unique identifier (LUID) for the interface.
     * @param {PSTR} InterfaceName A pointer to a <b>NULL</b>-terminated ANSI string containing the network interface name.
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
     * @see https://docs.microsoft.com/windows/win32/api//netioapi/nf-netioapi-convertinterfacenametoluida
     * @since windows6.0.6000
     */
    static ConvertInterfaceNameToLuidA(InterfaceName, InterfaceLuid) {
        InterfaceName := InterfaceName is String ? StrPtr(InterfaceName) : InterfaceName

        result := DllCall("IPHLPAPI.dll\ConvertInterfaceNameToLuidA", "ptr", InterfaceName, "ptr", InterfaceLuid, "uint")
        return result
    }

    /**
     * Converts a Unicode network interface name to the locally unique identifier (LUID) for the interface.
     * @param {PWSTR} InterfaceName A pointer to a <b>NULL</b>-terminated Unicode string containing the network interface name.
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
     * @see https://docs.microsoft.com/windows/win32/api//netioapi/nf-netioapi-convertinterfacenametoluidw
     * @since windows6.0.6000
     */
    static ConvertInterfaceNameToLuidW(InterfaceName, InterfaceLuid) {
        InterfaceName := InterfaceName is String ? StrPtr(InterfaceName) : InterfaceName

        result := DllCall("IPHLPAPI.dll\ConvertInterfaceNameToLuidW", "ptr", InterfaceName, "ptr", InterfaceLuid, "uint")
        return result
    }

    /**
     * Converts a locally unique identifier (LUID) for a network interface to the ANSI interface name.
     * @param {Pointer<NET_LUID_LH>} InterfaceLuid A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/ifdef/ns-ifdef-net_luid_lh">NET_LUID</a> for a network interface.
     * @param {PSTR} InterfaceName A pointer to a buffer to hold the <b>NULL</b>-terminated ANSI string containing the interface name when the function returns successfully.
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
     * @see https://docs.microsoft.com/windows/win32/api//netioapi/nf-netioapi-convertinterfaceluidtonamea
     * @since windows6.0.6000
     */
    static ConvertInterfaceLuidToNameA(InterfaceLuid, InterfaceName, Length) {
        InterfaceName := InterfaceName is String ? StrPtr(InterfaceName) : InterfaceName

        result := DllCall("IPHLPAPI.dll\ConvertInterfaceLuidToNameA", "ptr", InterfaceLuid, "ptr", InterfaceName, "ptr", Length, "uint")
        return result
    }

    /**
     * Converts a locally unique identifier (LUID) for a network interface to the Unicode interface name.
     * @param {Pointer<NET_LUID_LH>} InterfaceLuid A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/ifdef/ns-ifdef-net_luid_lh">NET_LUID</a> for a network interface.
     * @param {PWSTR} InterfaceName A pointer to a buffer to hold the <b>NULL</b>-terminated Unicode string containing the interface name when the function returns successfully.
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
     * @see https://docs.microsoft.com/windows/win32/api//netioapi/nf-netioapi-convertinterfaceluidtonamew
     * @since windows6.0.6000
     */
    static ConvertInterfaceLuidToNameW(InterfaceLuid, InterfaceName, Length) {
        InterfaceName := InterfaceName is String ? StrPtr(InterfaceName) : InterfaceName

        result := DllCall("IPHLPAPI.dll\ConvertInterfaceLuidToNameW", "ptr", InterfaceLuid, "ptr", InterfaceName, "ptr", Length, "uint")
        return result
    }

    /**
     * Converts a locally unique identifier (LUID) for a network interface to the local index for the interface.
     * @param {Pointer<NET_LUID_LH>} InterfaceLuid A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/ifdef/ns-ifdef-net_luid_lh">NET_LUID</a> for a network interface.
     * @param {Pointer<Integer>} InterfaceIndex The local index  value for the interface.
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
     * @see https://docs.microsoft.com/windows/win32/api//netioapi/nf-netioapi-convertinterfaceluidtoindex
     * @since windows6.0.6000
     */
    static ConvertInterfaceLuidToIndex(InterfaceLuid, InterfaceIndex) {
        InterfaceIndexMarshal := InterfaceIndex is VarRef ? "uint*" : "ptr"

        result := DllCall("IPHLPAPI.dll\ConvertInterfaceLuidToIndex", "ptr", InterfaceLuid, InterfaceIndexMarshal, InterfaceIndex, "uint")
        return result
    }

    /**
     * Converts a local index for a network interface to the locally unique identifier (LUID) for the interface.
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
     * @see https://docs.microsoft.com/windows/win32/api//netioapi/nf-netioapi-convertinterfaceindextoluid
     * @since windows6.0.6000
     */
    static ConvertInterfaceIndexToLuid(InterfaceIndex, InterfaceLuid) {
        result := DllCall("IPHLPAPI.dll\ConvertInterfaceIndexToLuid", "uint", InterfaceIndex, "ptr", InterfaceLuid, "uint")
        return result
    }

    /**
     * Converts a locally unique identifier (LUID) for a network interface to an interface alias.
     * @param {Pointer<NET_LUID_LH>} InterfaceLuid A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/ifdef/ns-ifdef-net_luid_lh">NET_LUID</a> for a network interface.
     * @param {PWSTR} InterfaceAlias A pointer to a buffer to hold the <b>NULL</b>-terminated Unicode string containing the alias name of the network interface when the function returns successfully.
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
     * @see https://docs.microsoft.com/windows/win32/api//netioapi/nf-netioapi-convertinterfaceluidtoalias
     * @since windows6.0.6000
     */
    static ConvertInterfaceLuidToAlias(InterfaceLuid, InterfaceAlias, Length) {
        InterfaceAlias := InterfaceAlias is String ? StrPtr(InterfaceAlias) : InterfaceAlias

        result := DllCall("IPHLPAPI.dll\ConvertInterfaceLuidToAlias", "ptr", InterfaceLuid, "ptr", InterfaceAlias, "ptr", Length, "uint")
        return result
    }

    /**
     * Converts an interface alias name for a network interface to the locally unique identifier (LUID) for the interface.
     * @param {PWSTR} InterfaceAlias A pointer to a <b>NULL</b>-terminated Unicode string containing the alias name of the network interface.
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
     * @see https://docs.microsoft.com/windows/win32/api//netioapi/nf-netioapi-convertinterfacealiastoluid
     * @since windows6.0.6000
     */
    static ConvertInterfaceAliasToLuid(InterfaceAlias, InterfaceLuid) {
        InterfaceAlias := InterfaceAlias is String ? StrPtr(InterfaceAlias) : InterfaceAlias

        result := DllCall("IPHLPAPI.dll\ConvertInterfaceAliasToLuid", "ptr", InterfaceAlias, "ptr", InterfaceLuid, "uint")
        return result
    }

    /**
     * Converts a locally unique identifier (LUID) for a network interface to a globally unique identifier (GUID) for the interface.
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
     * @see https://docs.microsoft.com/windows/win32/api//netioapi/nf-netioapi-convertinterfaceluidtoguid
     * @since windows6.0.6000
     */
    static ConvertInterfaceLuidToGuid(InterfaceLuid, InterfaceGuid) {
        result := DllCall("IPHLPAPI.dll\ConvertInterfaceLuidToGuid", "ptr", InterfaceLuid, "ptr", InterfaceGuid, "uint")
        return result
    }

    /**
     * Converts a globally unique identifier (GUID) for a network interface to the locally unique identifier (LUID) for the interface.
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
     * @see https://docs.microsoft.com/windows/win32/api//netioapi/nf-netioapi-convertinterfaceguidtoluid
     * @since windows6.0.6000
     */
    static ConvertInterfaceGuidToLuid(InterfaceGuid, InterfaceLuid) {
        result := DllCall("IPHLPAPI.dll\ConvertInterfaceGuidToLuid", "ptr", InterfaceGuid, "ptr", InterfaceLuid, "uint")
        return result
    }

    /**
     * Converts the ANSI interface name for a network interface to the local index for the interface.
     * @param {PSTR} InterfaceName A pointer to a <b>NULL</b>-terminated ANSI string containing the interface name.
     * @returns {Integer} On success, 
     * <b>if_nametoindex</b> returns the local interface index. On failure, zero is returned.
     * @see https://docs.microsoft.com/windows/win32/api//netioapi/nf-netioapi-if_nametoindex
     * @since windows6.0.6000
     */
    static if_nametoindex(InterfaceName) {
        InterfaceName := InterfaceName is String ? StrPtr(InterfaceName) : InterfaceName

        result := DllCall("IPHLPAPI.dll\if_nametoindex", "ptr", InterfaceName, "uint")
        return result
    }

    /**
     * Converts the local index for a network interface to the ANSI interface name.
     * @param {Integer} InterfaceIndex The local index for a network interface.
     * @param {PSTR} InterfaceName A pointer to a buffer to hold the <b>NULL</b>-terminated ANSI string containing the interface name when the function returns successfully. The length, in bytes, of the buffer pointed to by this parameter must be equal to or greater than 
     *         <b>IF_NAMESIZE</b>.
     * @returns {PSTR} On success, 
     * <b>if_indextoname</b> returns a pointer to <b>NULL</b>-terminated ANSI string containing the interface name. On failure, a <b>NULL</b> pointer is returned.
     * @see https://docs.microsoft.com/windows/win32/api//netioapi/nf-netioapi-if_indextoname
     * @since windows6.0.6000
     */
    static if_indextoname(InterfaceIndex, InterfaceName) {
        InterfaceName := InterfaceName is String ? StrPtr(InterfaceName) : InterfaceName

        result := DllCall("IPHLPAPI.dll\if_indextoname", "uint", InterfaceIndex, "ptr", InterfaceName, "char*")
        return result
    }

    /**
     * Reserved for future use. Do not use this function.
     * @returns {NET_IF_COMPARTMENT_ID} 
     * @see https://docs.microsoft.com/windows/win32/api//netioapi/nf-netioapi-getcurrentthreadcompartmentid
     */
    static GetCurrentThreadCompartmentId() {
        result := DllCall("IPHLPAPI.dll\GetCurrentThreadCompartmentId", "uint")
        return result
    }

    /**
     * Reserved for future use. Do not use this function.
     * @param {NET_IF_COMPARTMENT_ID} CompartmentId Reserved.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//netioapi/nf-netioapi-setcurrentthreadcompartmentid
     */
    static SetCurrentThreadCompartmentId(CompartmentId) {
        result := DllCall("IPHLPAPI.dll\SetCurrentThreadCompartmentId", "uint", CompartmentId, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} CompartmentScope 
     * @param {Pointer<Integer>} CompartmentId 
     * @returns {String} Nothing - always returns an empty string
     */
    static GetCurrentThreadCompartmentScope(CompartmentScope, CompartmentId) {
        CompartmentScopeMarshal := CompartmentScope is VarRef ? "uint*" : "ptr"
        CompartmentIdMarshal := CompartmentId is VarRef ? "uint*" : "ptr"

        DllCall("IPHLPAPI.dll\GetCurrentThreadCompartmentScope", CompartmentScopeMarshal, CompartmentScope, CompartmentIdMarshal, CompartmentId)
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
     * @param {HANDLE} JobHandle 
     * @returns {NET_IF_COMPARTMENT_ID} 
     */
    static GetJobCompartmentId(JobHandle) {
        JobHandle := JobHandle is Win32Handle ? NumGet(JobHandle, "ptr") : JobHandle

        result := DllCall("IPHLPAPI.dll\GetJobCompartmentId", "ptr", JobHandle, "uint")
        return result
    }

    /**
     * 
     * @param {HANDLE} JobHandle 
     * @param {NET_IF_COMPARTMENT_ID} CompartmentId 
     * @returns {Integer} 
     */
    static SetJobCompartmentId(JobHandle, CompartmentId) {
        JobHandle := JobHandle is Win32Handle ? NumGet(JobHandle, "ptr") : JobHandle

        result := DllCall("IPHLPAPI.dll\SetJobCompartmentId", "ptr", JobHandle, "uint", CompartmentId, "uint")
        return result
    }

    /**
     * Reserved for future use. Do not use this function.
     * @param {Integer} SessionId Reserved.
     * @returns {NET_IF_COMPARTMENT_ID} 
     * @see https://docs.microsoft.com/windows/win32/api//netioapi/nf-netioapi-getsessioncompartmentid
     */
    static GetSessionCompartmentId(SessionId) {
        result := DllCall("IPHLPAPI.dll\GetSessionCompartmentId", "uint", SessionId, "uint")
        return result
    }

    /**
     * Reserved for future use. Do not use this function.
     * @param {Integer} SessionId Reserved.
     * @param {NET_IF_COMPARTMENT_ID} CompartmentId Reserved.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//netioapi/nf-netioapi-setsessioncompartmentid
     */
    static SetSessionCompartmentId(SessionId, CompartmentId) {
        result := DllCall("IPHLPAPI.dll\SetSessionCompartmentId", "uint", SessionId, "uint", CompartmentId, "uint")
        return result
    }

    /**
     * The GetDefaultCompartmentId function retrieves the default network routing compartment identifier for the local computer.
     * @returns {NET_IF_COMPARTMENT_ID} If the function succeeds, the return value is the default Compartment ID.
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
     * @see https://docs.microsoft.com/windows/win32/api//netioapi/nf-netioapi-getdefaultcompartmentid
     * @since windows10.0.10240
     */
    static GetDefaultCompartmentId() {
        result := DllCall("IPHLPAPI.dll\GetDefaultCompartmentId", "uint")
        return result
    }

    /**
     * Reserved for future use. Do not use this function.
     * @param {Pointer<Guid>} NetworkGuid Reserved.
     * @param {Pointer<Integer>} CompartmentId Reserved.
     * @param {Pointer<Integer>} SiteId Reserved.
     * @param {PWSTR} NetworkName Reserved.
     * @param {Integer} Length Reserved.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//netioapi/nf-netioapi-getnetworkinformation
     */
    static GetNetworkInformation(NetworkGuid, CompartmentId, SiteId, NetworkName, Length) {
        NetworkName := NetworkName is String ? StrPtr(NetworkName) : NetworkName

        CompartmentIdMarshal := CompartmentId is VarRef ? "uint*" : "ptr"
        SiteIdMarshal := SiteId is VarRef ? "uint*" : "ptr"

        result := DllCall("IPHLPAPI.dll\GetNetworkInformation", "ptr", NetworkGuid, CompartmentIdMarshal, CompartmentId, SiteIdMarshal, SiteId, "ptr", NetworkName, "uint", Length, "uint")
        return result
    }

    /**
     * Reserved for future use. Do not use this function.
     * @param {Pointer<Guid>} NetworkGuid Reserved.
     * @param {NET_IF_COMPARTMENT_ID} CompartmentId Reserved.
     * @param {PWSTR} NetworkName Reserved.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//netioapi/nf-netioapi-setnetworkinformation
     */
    static SetNetworkInformation(NetworkGuid, CompartmentId, NetworkName) {
        NetworkName := NetworkName is String ? StrPtr(NetworkName) : NetworkName

        result := DllCall("IPHLPAPI.dll\SetNetworkInformation", "ptr", NetworkGuid, "uint", CompartmentId, "ptr", NetworkName, "uint")
        return result
    }

    /**
     * Converts an IPv4 prefix length to an IPv4 subnet mask.
     * @param {Integer} MaskLength The IPv4 prefix length, in bits.
     * @param {Pointer<Integer>} Mask A pointer to a <b>LONG</b> value to hold the IPv4 subnet mask when the function returns successfully.
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
     * @see https://docs.microsoft.com/windows/win32/api//netioapi/nf-netioapi-convertlengthtoipv4mask
     * @since windows6.0.6000
     */
    static ConvertLengthToIpv4Mask(MaskLength, Mask) {
        MaskMarshal := Mask is VarRef ? "uint*" : "ptr"

        result := DllCall("IPHLPAPI.dll\ConvertLengthToIpv4Mask", "uint", MaskLength, MaskMarshal, Mask, "uint")
        return result
    }

    /**
     * Converts an IPv4 subnet mask to an IPv4 prefix length.
     * @param {Integer} Mask The IPv4 subnet mask.
     * @param {Pointer<Integer>} MaskLength A pointer to a <b>UINT8</b> value to hold the IPv4 prefix length, in bits, when the function returns successfully.
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
     * @see https://docs.microsoft.com/windows/win32/api//netioapi/nf-netioapi-convertipv4masktolength
     * @since windows6.0.6000
     */
    static ConvertIpv4MaskToLength(Mask, MaskLength) {
        MaskLengthMarshal := MaskLength is VarRef ? "char*" : "ptr"

        result := DllCall("IPHLPAPI.dll\ConvertIpv4MaskToLength", "uint", Mask, MaskLengthMarshal, MaskLength, "uint")
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
     * 
     * @param {Guid} Interface 
     * @param {Pointer<DNS_INTERFACE_SETTINGS>} Settings 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/netioapi/nf-netioapi-getinterfacednssettings
     */
    static GetInterfaceDnsSettings(Interface, Settings) {
        result := DllCall("IPHLPAPI.dll\GetInterfaceDnsSettings", "ptr", Interface, "ptr", Settings, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<DNS_INTERFACE_SETTINGS>} Settings 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/netioapi/nf-netioapi-freeinterfacednssettings
     */
    static FreeInterfaceDnsSettings(Settings) {
        DllCall("IPHLPAPI.dll\FreeInterfaceDnsSettings", "ptr", Settings)
    }

    /**
     * 
     * @param {Guid} Interface 
     * @param {Pointer<DNS_INTERFACE_SETTINGS>} Settings 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/netioapi/nf-netioapi-setinterfacednssettings
     */
    static SetInterfaceDnsSettings(Interface, Settings) {
        result := DllCall("IPHLPAPI.dll\SetInterfaceDnsSettings", "ptr", Interface, "ptr", Settings, "uint")
        return result
    }

    /**
     * Retrieves the aggregate level and cost of network connectivity that an application or service is likely to experience.
     * @param {Pointer<NL_NETWORK_CONNECTIVITY_HINT>} ConnectivityHint A pointer to a value of type [NL_NETWORK_CONNECTIVITY_HINT](../nldef/ns-nldef-nl_network_connectivity_hint.md). The function sets this value to the aggregate connectivity level and cost hints.
     * @returns {Integer} In user mode, returns **NO_ERROR** on success, and an error code on failure. In kernel mode, returns **STATUS_SUCCESS** on success, and an error code on failure.
     * @see https://docs.microsoft.com/windows/win32/api//netioapi/nf-netioapi-getnetworkconnectivityhint
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
     * @returns {Integer} In user mode, returns **NO_ERROR** on success, and an error code on failure. In kernel mode, returns **STATUS_SUCCESS** on success, and an error code on failure.
     * @see https://docs.microsoft.com/windows/win32/api//netioapi/nf-netioapi-getnetworkconnectivityhintforinterface
     * @since windows10.0.19041
     */
    static GetNetworkConnectivityHintForInterface(InterfaceIndex, ConnectivityHint) {
        result := DllCall("IPHLPAPI.dll\GetNetworkConnectivityHintForInterface", "uint", InterfaceIndex, "ptr", ConnectivityHint, "uint")
        return result
    }

    /**
     * Registers an application-defined callback function, to be called when the aggregate network connectivity level and cost hints change.
     * @param {Pointer<PNETWORK_CONNECTIVITY_HINT_CHANGE_CALLBACK>} Callback A function pointer of type [PNETWORK_CONNECTIVITY_HINT_CHANGE_CALLBACK](./nc-netioapi-pnetwork_connectivity_hint_change_callback.md), which points to your application-defined callback function. The callback function will be invoked when a network connectivity level or cost change occurs.
     * @param {Pointer<Void>} CallerContext The user-specific caller context. This context will be supplied to the callback function.
     * @param {BOOLEAN} InitialNotification `True` if an initialization notification should be provided, otherwise `false`.
     * @param {Pointer<HANDLE>} NotificationHandle A pointer to a **HANDLE**. The function sets the value to a handle to the notification registration.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//netioapi/nf-netioapi-notifynetworkconnectivityhintchange
     * @since windows10.0.19041
     */
    static NotifyNetworkConnectivityHintChange(Callback, CallerContext, InitialNotification, NotificationHandle) {
        CallerContextMarshal := CallerContext is VarRef ? "ptr" : "ptr"

        result := DllCall("IPHLPAPI.dll\NotifyNetworkConnectivityHintChange", "ptr", Callback, CallerContextMarshal, CallerContext, "char", InitialNotification, "ptr", NotificationHandle, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<MIB_FL_VIRTUAL_INTERFACE_ROW>} Row 
     * @returns {Integer} 
     */
    static CreateFlVirtualInterface(Row) {
        result := DllCall("IPHLPAPI.DLL\CreateFlVirtualInterface", "ptr", Row, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<MIB_FL_VIRTUAL_INTERFACE_ROW>} Row 
     * @returns {Integer} 
     */
    static DeleteFlVirtualInterface(Row) {
        result := DllCall("IPHLPAPI.DLL\DeleteFlVirtualInterface", "ptr", Row, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<MIB_FL_VIRTUAL_INTERFACE_ROW>} Row 
     * @returns {String} Nothing - always returns an empty string
     */
    static InitializeFlVirtualInterfaceEntry(Row) {
        DllCall("IPHLPAPI.DLL\InitializeFlVirtualInterfaceEntry", "ptr", Row)
    }

    /**
     * 
     * @param {Pointer<MIB_FL_VIRTUAL_INTERFACE_ROW>} Row 
     * @returns {Integer} 
     */
    static SetFlVirtualInterface(Row) {
        result := DllCall("IPHLPAPI.DLL\SetFlVirtualInterface", "ptr", Row, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<MIB_FL_VIRTUAL_INTERFACE_ROW>} Row 
     * @returns {Integer} 
     */
    static GetFlVirtualInterface(Row) {
        result := DllCall("IPHLPAPI.DLL\GetFlVirtualInterface", "ptr", Row, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} Family 
     * @param {Pointer<Pointer<MIB_FL_VIRTUAL_INTERFACE_TABLE>>} Table 
     * @returns {Integer} 
     */
    static GetFlVirtualInterfaceTable(Family, Table) {
        TableMarshal := Table is VarRef ? "ptr*" : "ptr"

        result := DllCall("IPHLPAPI.DLL\GetFlVirtualInterfaceTable", "ushort", Family, TableMarshal, Table, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} dwName 
     * @param {Integer} inAction 
     * @param {Integer} outAction 
     * @param {BOOL} bUseLog 
     * @param {BOOL} bMustBeUnique 
     * @param {Pointer<Pointer<Void>>} ppInterface 
     * @returns {Integer} 
     */
    static PfCreateInterface(dwName, inAction, outAction, bUseLog, bMustBeUnique, ppInterface) {
        ppInterfaceMarshal := ppInterface is VarRef ? "ptr*" : "ptr"

        result := DllCall("IPHLPAPI.dll\PfCreateInterface", "uint", dwName, "int", inAction, "int", outAction, "int", bUseLog, "int", bMustBeUnique, ppInterfaceMarshal, ppInterface, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pInterface 
     * @returns {Integer} 
     */
    static PfDeleteInterface(pInterface) {
        pInterfaceMarshal := pInterface is VarRef ? "ptr" : "ptr"

        result := DllCall("IPHLPAPI.dll\PfDeleteInterface", pInterfaceMarshal, pInterface, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} ih 
     * @param {Integer} cInFilters 
     * @param {Pointer<PF_FILTER_DESCRIPTOR>} pfiltIn 
     * @param {Integer} cOutFilters 
     * @param {Pointer<PF_FILTER_DESCRIPTOR>} pfiltOut 
     * @param {Pointer<Pointer<Void>>} pfHandle 
     * @returns {Integer} 
     */
    static PfAddFiltersToInterface(ih, cInFilters, pfiltIn, cOutFilters, pfiltOut, pfHandle) {
        ihMarshal := ih is VarRef ? "ptr" : "ptr"
        pfHandleMarshal := pfHandle is VarRef ? "ptr*" : "ptr"

        result := DllCall("IPHLPAPI.dll\PfAddFiltersToInterface", ihMarshal, ih, "uint", cInFilters, "ptr", pfiltIn, "uint", cOutFilters, "ptr", pfiltOut, pfHandleMarshal, pfHandle, "uint")
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
        ihMarshal := ih is VarRef ? "ptr" : "ptr"

        result := DllCall("IPHLPAPI.dll\PfRemoveFiltersFromInterface", ihMarshal, ih, "uint", cInFilters, "ptr", pfiltIn, "uint", cOutFilters, "ptr", pfiltOut, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pInterface 
     * @param {Integer} cFilters 
     * @param {Pointer<Pointer<Void>>} pvHandles 
     * @returns {Integer} 
     */
    static PfRemoveFilterHandles(pInterface, cFilters, pvHandles) {
        pInterfaceMarshal := pInterface is VarRef ? "ptr" : "ptr"
        pvHandlesMarshal := pvHandles is VarRef ? "ptr*" : "ptr"

        result := DllCall("IPHLPAPI.dll\PfRemoveFilterHandles", pInterfaceMarshal, pInterface, "uint", cFilters, pvHandlesMarshal, pvHandles, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pInterface 
     * @returns {Integer} 
     */
    static PfUnBindInterface(pInterface) {
        pInterfaceMarshal := pInterface is VarRef ? "ptr" : "ptr"

        result := DllCall("IPHLPAPI.dll\PfUnBindInterface", pInterfaceMarshal, pInterface, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pInterface 
     * @param {Integer} dwIndex 
     * @param {Integer} pfatLinkType 
     * @param {Pointer<Integer>} LinkIPAddress 
     * @returns {Integer} 
     */
    static PfBindInterfaceToIndex(pInterface, dwIndex, pfatLinkType, LinkIPAddress) {
        pInterfaceMarshal := pInterface is VarRef ? "ptr" : "ptr"
        LinkIPAddressMarshal := LinkIPAddress is VarRef ? "char*" : "ptr"

        result := DllCall("IPHLPAPI.dll\PfBindInterfaceToIndex", pInterfaceMarshal, pInterface, "uint", dwIndex, "int", pfatLinkType, LinkIPAddressMarshal, LinkIPAddress, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pInterface 
     * @param {Integer} pfatType 
     * @param {Pointer<Integer>} IPAddress 
     * @returns {Integer} 
     */
    static PfBindInterfaceToIPAddress(pInterface, pfatType, IPAddress) {
        pInterfaceMarshal := pInterface is VarRef ? "ptr" : "ptr"
        IPAddressMarshal := IPAddress is VarRef ? "char*" : "ptr"

        result := DllCall("IPHLPAPI.dll\PfBindInterfaceToIPAddress", pInterfaceMarshal, pInterface, "int", pfatType, IPAddressMarshal, IPAddress, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pInterface 
     * @param {Pointer<PF_LATEBIND_INFO>} pLateBindInfo 
     * @returns {Integer} 
     */
    static PfRebindFilters(pInterface, pLateBindInfo) {
        pInterfaceMarshal := pInterface is VarRef ? "ptr" : "ptr"

        result := DllCall("IPHLPAPI.dll\PfRebindFilters", pInterfaceMarshal, pInterface, "ptr", pLateBindInfo, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pInterface 
     * @param {Integer} gfFilter 
     * @returns {Integer} 
     */
    static PfAddGlobalFilterToInterface(pInterface, gfFilter) {
        pInterfaceMarshal := pInterface is VarRef ? "ptr" : "ptr"

        result := DllCall("IPHLPAPI.dll\PfAddGlobalFilterToInterface", pInterfaceMarshal, pInterface, "int", gfFilter, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pInterface 
     * @param {Integer} gfFilter 
     * @returns {Integer} 
     */
    static PfRemoveGlobalFilterFromInterface(pInterface, gfFilter) {
        pInterfaceMarshal := pInterface is VarRef ? "ptr" : "ptr"

        result := DllCall("IPHLPAPI.dll\PfRemoveGlobalFilterFromInterface", pInterfaceMarshal, pInterface, "int", gfFilter, "uint")
        return result
    }

    /**
     * 
     * @param {HANDLE} hEvent 
     * @returns {Integer} 
     */
    static PfMakeLog(hEvent) {
        hEvent := hEvent is Win32Handle ? NumGet(hEvent, "ptr") : hEvent

        result := DllCall("IPHLPAPI.dll\PfMakeLog", "ptr", hEvent, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbBuffer 
     * @param {Integer} dwSize 
     * @param {Integer} dwThreshold 
     * @param {Integer} dwEntries 
     * @param {Pointer<Integer>} pdwLoggedEntries 
     * @param {Pointer<Integer>} pdwLostEntries 
     * @param {Pointer<Integer>} pdwSizeUsed 
     * @returns {Integer} 
     */
    static PfSetLogBuffer(pbBuffer, dwSize, dwThreshold, dwEntries, pdwLoggedEntries, pdwLostEntries, pdwSizeUsed) {
        pbBufferMarshal := pbBuffer is VarRef ? "char*" : "ptr"
        pdwLoggedEntriesMarshal := pdwLoggedEntries is VarRef ? "uint*" : "ptr"
        pdwLostEntriesMarshal := pdwLostEntries is VarRef ? "uint*" : "ptr"
        pdwSizeUsedMarshal := pdwSizeUsed is VarRef ? "uint*" : "ptr"

        result := DllCall("IPHLPAPI.dll\PfSetLogBuffer", pbBufferMarshal, pbBuffer, "uint", dwSize, "uint", dwThreshold, "uint", dwEntries, pdwLoggedEntriesMarshal, pdwLoggedEntries, pdwLostEntriesMarshal, pdwLostEntries, pdwSizeUsedMarshal, pdwSizeUsed, "uint")
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
     * @param {Pointer<Integer>} pdwBufferSize 
     * @param {BOOL} fResetCounters 
     * @returns {Integer} 
     */
    static PfGetInterfaceStatistics(pInterface, ppfStats, pdwBufferSize, fResetCounters) {
        pInterfaceMarshal := pInterface is VarRef ? "ptr" : "ptr"
        pdwBufferSizeMarshal := pdwBufferSize is VarRef ? "uint*" : "ptr"

        result := DllCall("IPHLPAPI.dll\PfGetInterfaceStatistics", pInterfaceMarshal, pInterface, "ptr", ppfStats, pdwBufferSizeMarshal, pdwBufferSize, "int", fResetCounters, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pInInterface 
     * @param {Pointer<Void>} pOutInterface 
     * @param {Integer} cBytes 
     * @param {Pointer<Integer>} pbPacket 
     * @param {Pointer<Integer>} ppAction 
     * @returns {Integer} 
     */
    static PfTestPacket(pInInterface, pOutInterface, cBytes, pbPacket, ppAction) {
        pInInterfaceMarshal := pInInterface is VarRef ? "ptr" : "ptr"
        pOutInterfaceMarshal := pOutInterface is VarRef ? "ptr" : "ptr"
        pbPacketMarshal := pbPacket is VarRef ? "char*" : "ptr"
        ppActionMarshal := ppAction is VarRef ? "int*" : "ptr"

        result := DllCall("IPHLPAPI.dll\PfTestPacket", pInInterfaceMarshal, pInInterface, pOutInterfaceMarshal, pOutInterface, "uint", cBytes, pbPacketMarshal, pbPacket, ppActionMarshal, ppAction, "uint")
        return result
    }

;@endregion Methods
}
