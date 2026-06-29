#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global ANY_SIZE := 1

/**
 * @type {Integer (UInt32)}
 */
export global MAXLEN_PHYSADDR := 8

/**
 * @type {Integer (UInt32)}
 */
export global MAXLEN_IFDESCR := 256

/**
 * @type {Integer (UInt32)}
 */
export global MAX_INTERFACE_NAME_LEN := 256

/**
 * @type {Integer (UInt32)}
 */
export global MIN_IF_TYPE := 1

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_OTHER := 1

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_REGULAR_1822 := 2

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_HDH_1822 := 3

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_DDN_X25 := 4

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_RFC877_X25 := 5

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_ETHERNET_CSMACD := 6

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_IS088023_CSMACD := 7

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_ISO88024_TOKENBUS := 8

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_ISO88025_TOKENRING := 9

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_ISO88026_MAN := 10

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_STARLAN := 11

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_PROTEON_10MBIT := 12

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_PROTEON_80MBIT := 13

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_HYPERCHANNEL := 14

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_FDDI := 15

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_LAP_B := 16

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_SDLC := 17

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_DS1 := 18

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_E1 := 19

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_BASIC_ISDN := 20

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_PRIMARY_ISDN := 21

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_PROP_POINT2POINT_SERIAL := 22

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_PPP := 23

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_SOFTWARE_LOOPBACK := 24

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_EON := 25

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_ETHERNET_3MBIT := 26

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_NSIP := 27

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_SLIP := 28

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_ULTRA := 29

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_DS3 := 30

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_SIP := 31

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_FRAMERELAY := 32

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_RS232 := 33

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_PARA := 34

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_ARCNET := 35

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_ARCNET_PLUS := 36

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_ATM := 37

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_MIO_X25 := 38

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_SONET := 39

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_X25_PLE := 40

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_ISO88022_LLC := 41

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_LOCALTALK := 42

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_SMDS_DXI := 43

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_FRAMERELAY_SERVICE := 44

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_V35 := 45

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_HSSI := 46

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_HIPPI := 47

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_MODEM := 48

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_AAL5 := 49

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_SONET_PATH := 50

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_SONET_VT := 51

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_SMDS_ICIP := 52

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_PROP_VIRTUAL := 53

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_PROP_MULTIPLEXOR := 54

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_IEEE80212 := 55

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_FIBRECHANNEL := 56

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_HIPPIINTERFACE := 57

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_FRAMERELAY_INTERCONNECT := 58

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_AFLANE_8023 := 59

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_AFLANE_8025 := 60

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_CCTEMUL := 61

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_FASTETHER := 62

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_ISDN := 63

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_V11 := 64

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_V36 := 65

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_G703_64K := 66

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_G703_2MB := 67

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_QLLC := 68

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_FASTETHER_FX := 69

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_CHANNEL := 70

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_IEEE80211 := 71

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_IBM370PARCHAN := 72

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_ESCON := 73

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_DLSW := 74

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_ISDN_S := 75

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_ISDN_U := 76

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_LAP_D := 77

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_IPSWITCH := 78

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_RSRB := 79

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_ATM_LOGICAL := 80

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_DS0 := 81

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_DS0_BUNDLE := 82

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_BSC := 83

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_ASYNC := 84

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_CNR := 85

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_ISO88025R_DTR := 86

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_EPLRS := 87

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_ARAP := 88

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_PROP_CNLS := 89

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_HOSTPAD := 90

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_TERMPAD := 91

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_FRAMERELAY_MPI := 92

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_X213 := 93

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_ADSL := 94

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_RADSL := 95

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_SDSL := 96

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_VDSL := 97

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_ISO88025_CRFPRINT := 98

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_MYRINET := 99

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_VOICE_EM := 100

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_VOICE_FXO := 101

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_VOICE_FXS := 102

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_VOICE_ENCAP := 103

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_VOICE_OVERIP := 104

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_ATM_DXI := 105

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_ATM_FUNI := 106

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_ATM_IMA := 107

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_PPPMULTILINKBUNDLE := 108

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_IPOVER_CDLC := 109

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_IPOVER_CLAW := 110

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_STACKTOSTACK := 111

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_VIRTUALIPADDRESS := 112

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_MPC := 113

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_IPOVER_ATM := 114

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_ISO88025_FIBER := 115

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_TDLC := 116

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_GIGABITETHERNET := 117

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_HDLC := 118

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_LAP_F := 119

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_V37 := 120

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_X25_MLP := 121

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_X25_HUNTGROUP := 122

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_TRANSPHDLC := 123

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_INTERLEAVE := 124

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_FAST := 125

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_IP := 126

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_DOCSCABLE_MACLAYER := 127

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_DOCSCABLE_DOWNSTREAM := 128

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_DOCSCABLE_UPSTREAM := 129

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_A12MPPSWITCH := 130

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_TUNNEL := 131

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_COFFEE := 132

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_CES := 133

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_ATM_SUBINTERFACE := 134

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_L2_VLAN := 135

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_L3_IPVLAN := 136

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_L3_IPXVLAN := 137

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_DIGITALPOWERLINE := 138

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_MEDIAMAILOVERIP := 139

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_DTM := 140

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_DCN := 141

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_IPFORWARD := 142

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_MSDSL := 143

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_IEEE1394 := 144

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_IF_GSN := 145

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_DVBRCC_MACLAYER := 146

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_DVBRCC_DOWNSTREAM := 147

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_DVBRCC_UPSTREAM := 148

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_ATM_VIRTUAL := 149

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_MPLS_TUNNEL := 150

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_SRP := 151

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_VOICEOVERATM := 152

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_VOICEOVERFRAMERELAY := 153

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_IDSL := 154

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_COMPOSITELINK := 155

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_SS7_SIGLINK := 156

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_PROP_WIRELESS_P2P := 157

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_FR_FORWARD := 158

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_RFC1483 := 159

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_USB := 160

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_IEEE8023AD_LAG := 161

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_BGP_POLICY_ACCOUNTING := 162

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_FRF16_MFR_BUNDLE := 163

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_H323_GATEKEEPER := 164

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_H323_PROXY := 165

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_MPLS := 166

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_MF_SIGLINK := 167

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_HDSL2 := 168

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_SHDSL := 169

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_DS1_FDL := 170

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_POS := 171

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_DVB_ASI_IN := 172

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_DVB_ASI_OUT := 173

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_PLC := 174

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_NFAS := 175

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_TR008 := 176

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_GR303_RDT := 177

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_GR303_IDT := 178

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_ISUP := 179

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_PROP_DOCS_WIRELESS_MACLAYER := 180

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_PROP_DOCS_WIRELESS_DOWNSTREAM := 181

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_PROP_DOCS_WIRELESS_UPSTREAM := 182

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_HIPERLAN2 := 183

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_PROP_BWA_P2MP := 184

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_SONET_OVERHEAD_CHANNEL := 185

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_DIGITAL_WRAPPER_OVERHEAD_CHANNEL := 186

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_AAL2 := 187

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_RADIO_MAC := 188

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_ATM_RADIO := 189

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_IMT := 190

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_MVL := 191

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_REACH_DSL := 192

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_FR_DLCI_ENDPT := 193

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_ATM_VCI_ENDPT := 194

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_OPTICAL_CHANNEL := 195

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_OPTICAL_TRANSPORT := 196

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_IEEE80216_WMAN := 237

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_WWANPP := 243

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_WWANPP2 := 244

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_IEEE802154 := 259

/**
 * @type {Integer (UInt32)}
 */
export global IF_TYPE_XBOX_WIRELESS := 281

/**
 * @type {Integer (UInt32)}
 */
export global MAX_IF_TYPE := 281

/**
 * @type {Integer (UInt32)}
 */
export global IF_CHECK_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global IF_CHECK_MCAST := 1

/**
 * @type {Integer (UInt32)}
 */
export global IF_CHECK_SEND := 2

/**
 * @type {Integer (UInt32)}
 */
export global IF_CONNECTION_DEDICATED := 1

/**
 * @type {Integer (UInt32)}
 */
export global IF_CONNECTION_PASSIVE := 2

/**
 * @type {Integer (UInt32)}
 */
export global IF_CONNECTION_DEMAND := 3

/**
 * @type {Integer (UInt32)}
 */
export global IF_ADMIN_STATUS_UP := 1

/**
 * @type {Integer (UInt32)}
 */
export global IF_ADMIN_STATUS_DOWN := 2

/**
 * @type {Integer (UInt32)}
 */
export global IF_ADMIN_STATUS_TESTING := 3

/**
 * @type {Integer (UInt32)}
 */
export global MIB_IF_TYPE_OTHER := 1

/**
 * @type {Integer (UInt32)}
 */
export global MIB_IF_TYPE_ETHERNET := 6

/**
 * @type {Integer (UInt32)}
 */
export global MIB_IF_TYPE_TOKENRING := 9

/**
 * @type {Integer (UInt32)}
 */
export global MIB_IF_TYPE_FDDI := 15

/**
 * @type {Integer (UInt32)}
 */
export global MIB_IF_TYPE_PPP := 23

/**
 * @type {Integer (UInt32)}
 */
export global MIB_IF_TYPE_LOOPBACK := 24

/**
 * @type {Integer (UInt32)}
 */
export global MIB_IF_TYPE_SLIP := 28

/**
 * @type {Integer (UInt32)}
 */
export global MIB_IF_ADMIN_STATUS_UP := 1

/**
 * @type {Integer (UInt32)}
 */
export global MIB_IF_ADMIN_STATUS_DOWN := 2

/**
 * @type {Integer (UInt32)}
 */
export global MIB_IF_ADMIN_STATUS_TESTING := 3

/**
 * @type {Integer (UInt32)}
 */
export global MIB_IPADDR_PRIMARY := 1

/**
 * @type {Integer (UInt32)}
 */
export global MIB_IPADDR_DYNAMIC := 4

/**
 * @type {Integer (UInt32)}
 */
export global MIB_IPADDR_DISCONNECTED := 8

/**
 * @type {Integer (UInt32)}
 */
export global MIB_IPADDR_DELETED := 64

/**
 * @type {Integer (UInt32)}
 */
export global MIB_IPADDR_TRANSIENT := 128

/**
 * @type {Integer (UInt32)}
 */
export global MIB_IPADDR_DNS_ELIGIBLE := 256

/**
 * @type {Integer (UInt32)}
 */
export global MIB_IPROUTE_METRIC_UNUSED := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global MIB_USE_CURRENT_TTL := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global MIB_USE_CURRENT_FORWARDING := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global ICMP6_INFOMSG_MASK := 128

/**
 * @type {Integer (UInt32)}
 */
export global IPRTRMGR_PID := 10000

/**
 * @type {Integer (UInt32)}
 */
export global IF_NUMBER := 0

/**
 * @type {Integer (UInt32)}
 */
export global IF_TABLE := 1

/**
 * @type {Integer (UInt32)}
 */
export global IF_ROW := 2

/**
 * @type {Integer (UInt32)}
 */
export global IP_STATS := 3

/**
 * @type {Integer (UInt32)}
 */
export global IP_ADDRTABLE := 4

/**
 * @type {Integer (UInt32)}
 */
export global IP_ADDRROW := 5

/**
 * @type {Integer (UInt32)}
 */
export global IP_FORWARDNUMBER := 6

/**
 * @type {Integer (UInt32)}
 */
export global IP_FORWARDTABLE := 7

/**
 * @type {Integer (UInt32)}
 */
export global IP_FORWARDROW := 8

/**
 * @type {Integer (UInt32)}
 */
export global IP_NETTABLE := 9

/**
 * @type {Integer (UInt32)}
 */
export global IP_NETROW := 10

/**
 * @type {Integer (UInt32)}
 */
export global ICMP_STATS := 11

/**
 * @type {Integer (UInt32)}
 */
export global TCP_STATS := 12

/**
 * @type {Integer (UInt32)}
 */
export global TCP_TABLE := 13

/**
 * @type {Integer (UInt32)}
 */
export global TCP_ROW := 14

/**
 * @type {Integer (UInt32)}
 */
export global UDP_STATS := 15

/**
 * @type {Integer (UInt32)}
 */
export global UDP_TABLE := 16

/**
 * @type {Integer (UInt32)}
 */
export global UDP_ROW := 17

/**
 * @type {Integer (UInt32)}
 */
export global MCAST_MFE := 18

/**
 * @type {Integer (UInt32)}
 */
export global MCAST_MFE_STATS := 19

/**
 * @type {Integer (UInt32)}
 */
export global BEST_IF := 20

/**
 * @type {Integer (UInt32)}
 */
export global BEST_ROUTE := 21

/**
 * @type {Integer (UInt32)}
 */
export global PROXY_ARP := 22

/**
 * @type {Integer (UInt32)}
 */
export global MCAST_IF_ENTRY := 23

/**
 * @type {Integer (UInt32)}
 */
export global MCAST_GLOBAL := 24

/**
 * @type {Integer (UInt32)}
 */
export global IF_STATUS := 25

/**
 * @type {Integer (UInt32)}
 */
export global MCAST_BOUNDARY := 26

/**
 * @type {Integer (UInt32)}
 */
export global MCAST_SCOPE := 27

/**
 * @type {Integer (UInt32)}
 */
export global DEST_MATCHING := 28

/**
 * @type {Integer (UInt32)}
 */
export global DEST_LONGER := 29

/**
 * @type {Integer (UInt32)}
 */
export global DEST_SHORTER := 30

/**
 * @type {Integer (UInt32)}
 */
export global ROUTE_MATCHING := 31

/**
 * @type {Integer (UInt32)}
 */
export global ROUTE_LONGER := 32

/**
 * @type {Integer (UInt32)}
 */
export global ROUTE_SHORTER := 33

/**
 * @type {Integer (UInt32)}
 */
export global ROUTE_STATE := 34

/**
 * @type {Integer (UInt32)}
 */
export global MCAST_MFE_STATS_EX := 35

/**
 * @type {Integer (UInt32)}
 */
export global IP6_STATS := 36

/**
 * @type {Integer (UInt32)}
 */
export global UDP6_STATS := 37

/**
 * @type {Integer (UInt32)}
 */
export global TCP6_STATS := 38

/**
 * @type {Integer (UInt32)}
 */
export global NUMBER_OF_EXPORTED_VARIABLES := 39

/**
 * @type {Integer (UInt32)}
 */
export global MAX_SCOPE_NAME_LEN := 255

/**
 * @type {Integer (UInt32)}
 */
export global MAX_MIB_OFFSET := 8

/**
 * @type {Integer (UInt32)}
 */
export global MIB_INVALID_TEREDO_PORT_NUMBER := 0

/**
 * @type {Integer (UInt32)}
 */
export global DNS_SETTINGS_VERSION1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DNS_SETTINGS_VERSION2 := 2

/**
 * @type {Integer (UInt32)}
 */
export global DNS_INTERFACE_SETTINGS_VERSION1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DNS_INTERFACE_SETTINGS_VERSION2 := 2

/**
 * @type {Integer (UInt32)}
 */
export global DNS_INTERFACE_SETTINGS_VERSION3 := 3

/**
 * @type {Integer (UInt32)}
 */
export global DNS_INTERFACE_SETTINGS_VERSION4 := 4

/**
 * @type {Integer (UInt32)}
 */
export global DNS_SETTING_IPV6 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DNS_SETTING_NAMESERVER := 2

/**
 * @type {Integer (UInt32)}
 */
export global DNS_SETTING_SEARCHLIST := 4

/**
 * @type {Integer (UInt32)}
 */
export global DNS_SETTING_REGISTRATION_ENABLED := 8

/**
 * @type {Integer (UInt32)}
 */
export global DNS_SETTING_REGISTER_ADAPTER_NAME := 16

/**
 * @type {Integer (UInt32)}
 */
export global DNS_SETTING_DOMAIN := 32

/**
 * @type {Integer (UInt32)}
 */
export global DNS_SETTING_HOSTNAME := 64

/**
 * @type {Integer (UInt32)}
 */
export global DNS_SETTINGS_ENABLE_LLMNR := 128

/**
 * @type {Integer (UInt32)}
 */
export global DNS_SETTINGS_QUERY_ADAPTER_NAME := 256

/**
 * @type {Integer (UInt32)}
 */
export global DNS_SETTING_PROFILE_NAMESERVER := 512

/**
 * @type {Integer (UInt32)}
 */
export global DNS_SETTING_DISABLE_UNCONSTRAINED_QUERIES := 1024

/**
 * @type {Integer (UInt32)}
 */
export global DNS_SETTING_SUPPLEMENTAL_SEARCH_LIST := 2048

/**
 * @type {Integer (UInt32)}
 */
export global DNS_SETTING_DOH := 4096

/**
 * @type {Integer (UInt32)}
 */
export global DNS_SETTING_DOH_PROFILE := 8192

/**
 * @type {Integer (UInt32)}
 */
export global DNS_SETTING_ENCRYPTED_DNS_ADAPTER_FLAGS := 16384

/**
 * @type {Integer (UInt32)}
 */
export global DNS_SETTING_DDR := 32768

/**
 * @type {Integer (UInt32)}
 */
export global DNS_SETTING_DOT := 65536

/**
 * @type {Integer (UInt32)}
 */
export global DNS_SETTING_DOT_PROFILE := 131072

/**
 * @type {Integer (UInt32)}
 */
export global DNS_ENABLE_DOH := 1

/**
 * @type {Integer (UInt32)}
 */
export global DNS_DOH_POLICY_NOT_CONFIGURED := 4

/**
 * @type {Integer (UInt32)}
 */
export global DNS_DOH_POLICY_DISABLE := 8

/**
 * @type {Integer (UInt32)}
 */
export global DNS_DOH_POLICY_AUTO := 16

/**
 * @type {Integer (UInt32)}
 */
export global DNS_DOH_POLICY_REQUIRED := 32

/**
 * @type {Integer (UInt32)}
 */
export global DNS_ENCRYPTION_POLICY_NOT_CONFIGURED := 4

/**
 * @type {Integer (UInt32)}
 */
export global DNS_ENCRYPTION_POLICY_DISABLE := 8

/**
 * @type {Integer (UInt32)}
 */
export global DNS_ENCRYPTION_POLICY_AUTO := 16

/**
 * @type {Integer (UInt32)}
 */
export global DNS_ENCRYPTION_POLICY_REQUIRED := 32

/**
 * @type {Integer (UInt32)}
 */
export global DNS_ENABLE_DDR := 64

/**
 * @type {Integer (UInt32)}
 */
export global DNS_ENABLE_DOT := 128

/**
 * @type {Integer (UInt32)}
 */
export global DNS_DOT_POLICY_BLOCK := 256

/**
 * @type {Integer (UInt32)}
 */
export global DNS_DOH_POLICY_BLOCK := 512

/**
 * @type {Integer (UInt32)}
 */
export global DNS_ENABLE_DNR := 1024

/**
 * @type {Integer (UInt32)}
 */
export global DNS_SERVER_PROPERTY_VERSION1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DNS_DOH_SERVER_SETTINGS_ENABLE_AUTO := 1

/**
 * @type {Integer (UInt32)}
 */
export global DNS_DOH_SERVER_SETTINGS_ENABLE := 2

/**
 * @type {Integer (UInt32)}
 */
export global DNS_DOH_SERVER_SETTINGS_FALLBACK_TO_UDP := 4

/**
 * @type {Integer (UInt32)}
 */
export global DNS_DOH_AUTO_UPGRADE_SERVER := 8

/**
 * @type {Integer (UInt32)}
 */
export global DNS_DOH_SERVER_SETTINGS_ENABLE_DDR := 16

/**
 * @type {Integer (UInt32)}
 */
export global DNS_DOH_SERVER_SETTINGS_MAKE_DDR_NON_BLOCKING := 32

/**
 * @type {Integer (UInt32)}
 */
export global DNS_DOT_SERVER_SETTINGS_ENABLE := 1

/**
 * @type {Integer (UInt32)}
 */
export global DNS_DOT_SERVER_SETTINGS_FALLBACK_TO_UDP := 2

/**
 * @type {Integer (UInt32)}
 */
export global DNS_DOT_AUTO_UPGRADE_SERVER := 4

/**
 * @type {Integer (UInt32)}
 */
export global DNS_DOT_SERVER_SETTINGS_ENABLE_AUTO := 8

/**
 * @type {Integer (UInt32)}
 */
export global DNS_DOT_SERVER_SETTINGS_ENABLE_DDR := 16

/**
 * @type {Integer (UInt32)}
 */
export global DNS_DOT_SERVER_SETTINGS_MAKE_DDR_NON_BLOCKING := 32

/**
 * @type {Integer (UInt32)}
 */
export global DNS_DDR_ADAPTER_ENABLE_DOH := 1

/**
 * @type {Integer (UInt32)}
 */
export global DNS_DDR_ADAPTER_ENABLE := 1

/**
 * @type {Integer (UInt32)}
 */
export global DNS_DDR_ADAPTER_ENABLE_UDP_FALLBACK := 2

/**
 * @type {Integer (UInt32)}
 */
export global DNS_DDR_ADAPTER_MAKE_DDR_NON_BLOCKING := 4

/**
 * @type {Integer (UInt32)}
 */
export global TCPIP_OWNING_MODULE_SIZE := 16

/**
 * @type {Integer (Byte)}
 */
export global FILTER_ICMP_TYPE_ANY := 0xFF

/**
 * @type {Integer (Byte)}
 */
export global FILTER_ICMP_CODE_ANY := 0xFF

/**
 * @type {Integer (UInt32)}
 */
export global FD_FLAGS_NOSYN := 1

/**
 * @type {Integer (UInt32)}
 */
export global FD_FLAGS_ALLFLAGS := 1

/**
 * @type {Integer (UInt32)}
 */
export global LB_SRC_ADDR_USE_SRCADDR_FLAG := 1

/**
 * @type {Integer (UInt32)}
 */
export global LB_SRC_ADDR_USE_DSTADDR_FLAG := 2

/**
 * @type {Integer (UInt32)}
 */
export global LB_DST_ADDR_USE_SRCADDR_FLAG := 4

/**
 * @type {Integer (UInt32)}
 */
export global LB_DST_ADDR_USE_DSTADDR_FLAG := 8

/**
 * @type {Integer (UInt32)}
 */
export global LB_SRC_MASK_LATE_FLAG := 16

/**
 * @type {Integer (UInt32)}
 */
export global LB_DST_MASK_LATE_FLAG := 32

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_BASE := 23000

/**
 * @type {Integer (UInt32)}
 */
export global PFERROR_NO_PF_INTERFACE := 23000

/**
 * @type {Integer (UInt32)}
 */
export global PFERROR_NO_FILTERS_GIVEN := 23001

/**
 * @type {Integer (UInt32)}
 */
export global PFERROR_BUFFER_TOO_SMALL := 23002

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_IPV6_NOT_IMPLEMENTED := 23003

/**
 * @type {Integer (UInt32)}
 */
export global IP_EXPORT_INCLUDED := 1

/**
 * @type {Integer (UInt32)}
 */
export global MAX_ADAPTER_NAME := 128

/**
 * @type {Integer (UInt32)}
 */
export global IP_STATUS_BASE := 11000

/**
 * @type {Integer (UInt32)}
 */
export global IP_SUCCESS := 0

/**
 * @type {Integer (UInt32)}
 */
export global IP_BUF_TOO_SMALL := 11001

/**
 * @type {Integer (UInt32)}
 */
export global IP_DEST_NET_UNREACHABLE := 11002

/**
 * @type {Integer (UInt32)}
 */
export global IP_DEST_HOST_UNREACHABLE := 11003

/**
 * @type {Integer (UInt32)}
 */
export global IP_DEST_PROT_UNREACHABLE := 11004

/**
 * @type {Integer (UInt32)}
 */
export global IP_DEST_PORT_UNREACHABLE := 11005

/**
 * @type {Integer (UInt32)}
 */
export global IP_NO_RESOURCES := 11006

/**
 * @type {Integer (UInt32)}
 */
export global IP_BAD_OPTION := 11007

/**
 * @type {Integer (UInt32)}
 */
export global IP_HW_ERROR := 11008

/**
 * @type {Integer (UInt32)}
 */
export global IP_PACKET_TOO_BIG := 11009

/**
 * @type {Integer (UInt32)}
 */
export global IP_REQ_TIMED_OUT := 11010

/**
 * @type {Integer (UInt32)}
 */
export global IP_BAD_REQ := 11011

/**
 * @type {Integer (UInt32)}
 */
export global IP_BAD_ROUTE := 11012

/**
 * @type {Integer (UInt32)}
 */
export global IP_TTL_EXPIRED_TRANSIT := 11013

/**
 * @type {Integer (UInt32)}
 */
export global IP_TTL_EXPIRED_REASSEM := 11014

/**
 * @type {Integer (UInt32)}
 */
export global IP_PARAM_PROBLEM := 11015

/**
 * @type {Integer (UInt32)}
 */
export global IP_SOURCE_QUENCH := 11016

/**
 * @type {Integer (UInt32)}
 */
export global IP_OPTION_TOO_BIG := 11017

/**
 * @type {Integer (UInt32)}
 */
export global IP_BAD_DESTINATION := 11018

/**
 * @type {Integer (UInt32)}
 */
export global IP_DEST_NO_ROUTE := 11002

/**
 * @type {Integer (UInt32)}
 */
export global IP_DEST_ADDR_UNREACHABLE := 11003

/**
 * @type {Integer (UInt32)}
 */
export global IP_DEST_PROHIBITED := 11004

/**
 * @type {Integer (UInt32)}
 */
export global IP_HOP_LIMIT_EXCEEDED := 11013

/**
 * @type {Integer (UInt32)}
 */
export global IP_REASSEMBLY_TIME_EXCEEDED := 11014

/**
 * @type {Integer (UInt32)}
 */
export global IP_PARAMETER_PROBLEM := 11015

/**
 * @type {Integer (UInt32)}
 */
export global IP_DEST_UNREACHABLE := 11040

/**
 * @type {Integer (UInt32)}
 */
export global IP_TIME_EXCEEDED := 11041

/**
 * @type {Integer (UInt32)}
 */
export global IP_BAD_HEADER := 11042

/**
 * @type {Integer (UInt32)}
 */
export global IP_UNRECOGNIZED_NEXT_HEADER := 11043

/**
 * @type {Integer (UInt32)}
 */
export global IP_ICMP_ERROR := 11044

/**
 * @type {Integer (UInt32)}
 */
export global IP_DEST_SCOPE_MISMATCH := 11045

/**
 * @type {Integer (UInt32)}
 */
export global IP_ADDR_DELETED := 11019

/**
 * @type {Integer (UInt32)}
 */
export global IP_SPEC_MTU_CHANGE := 11020

/**
 * @type {Integer (UInt32)}
 */
export global IP_MTU_CHANGE := 11021

/**
 * @type {Integer (UInt32)}
 */
export global IP_UNLOAD := 11022

/**
 * @type {Integer (UInt32)}
 */
export global IP_ADDR_ADDED := 11023

/**
 * @type {Integer (UInt32)}
 */
export global IP_MEDIA_CONNECT := 11024

/**
 * @type {Integer (UInt32)}
 */
export global IP_MEDIA_DISCONNECT := 11025

/**
 * @type {Integer (UInt32)}
 */
export global IP_BIND_ADAPTER := 11026

/**
 * @type {Integer (UInt32)}
 */
export global IP_UNBIND_ADAPTER := 11027

/**
 * @type {Integer (UInt32)}
 */
export global IP_DEVICE_DOES_NOT_EXIST := 11028

/**
 * @type {Integer (UInt32)}
 */
export global IP_DUPLICATE_ADDRESS := 11029

/**
 * @type {Integer (UInt32)}
 */
export global IP_INTERFACE_METRIC_CHANGE := 11030

/**
 * @type {Integer (UInt32)}
 */
export global IP_RECONFIG_SECFLTR := 11031

/**
 * @type {Integer (UInt32)}
 */
export global IP_NEGOTIATING_IPSEC := 11032

/**
 * @type {Integer (UInt32)}
 */
export global IP_INTERFACE_WOL_CAPABILITY_CHANGE := 11033

/**
 * @type {Integer (UInt32)}
 */
export global IP_DUPLICATE_IPADD := 11034

/**
 * @type {Integer (UInt32)}
 */
export global IP_GENERAL_FAILURE := 11050

/**
 * @type {Integer (UInt32)}
 */
export global MAX_IP_STATUS := 11050

/**
 * @type {Integer (UInt32)}
 */
export global IP_PENDING := 11255

/**
 * @type {Integer (UInt32)}
 */
export global IP_FLAG_REVERSE := 1

/**
 * @type {Integer (UInt32)}
 */
export global IP_FLAG_DF := 2

/**
 * @type {Integer (UInt32)}
 */
export global MAX_OPT_SIZE := 40

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_IP_RTCHANGE_NOTIFY_REQUEST := 101

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_IP_ADDCHANGE_NOTIFY_REQUEST := 102

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_ARP_SEND_REQUEST := 103

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_IP_INTERFACE_INFO := 104

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_IP_GET_BEST_INTERFACE := 105

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_IP_UNIDIRECTIONAL_ADAPTER_ADDRESS := 106

/**
 * @type {Integer (UInt32)}
 */
export global INTERFACE_TIMESTAMP_CAPABILITIES_VERSION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global INTERFACE_HARDWARE_CROSSTIMESTAMP_VERSION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global NET_STRING_IPV4_ADDRESS := 1

/**
 * @type {Integer (UInt32)}
 */
export global NET_STRING_IPV4_SERVICE := 2

/**
 * @type {Integer (UInt32)}
 */
export global NET_STRING_IPV4_NETWORK := 4

/**
 * @type {Integer (UInt32)}
 */
export global NET_STRING_IPV6_ADDRESS := 8

/**
 * @type {Integer (UInt32)}
 */
export global NET_STRING_IPV6_ADDRESS_NO_SCOPE := 16

/**
 * @type {Integer (UInt32)}
 */
export global NET_STRING_IPV6_SERVICE := 32

/**
 * @type {Integer (UInt32)}
 */
export global NET_STRING_IPV6_SERVICE_NO_SCOPE := 64

/**
 * @type {Integer (UInt32)}
 */
export global NET_STRING_IPV6_NETWORK := 128

/**
 * @type {Integer (UInt32)}
 */
export global NET_STRING_NAMED_ADDRESS := 256

/**
 * @type {Integer (UInt32)}
 */
export global NET_STRING_NAMED_SERVICE := 512

/**
 * @type {Integer (UInt32)}
 */
export global MAX_ADAPTER_DESCRIPTION_LENGTH := 128

/**
 * @type {Integer (UInt32)}
 */
export global MAX_ADAPTER_NAME_LENGTH := 256

/**
 * @type {Integer (UInt32)}
 */
export global MAX_ADAPTER_ADDRESS_LENGTH := 8

/**
 * @type {Integer (UInt32)}
 */
export global DEFAULT_MINIMUM_ENTITIES := 32

/**
 * @type {Integer (UInt32)}
 */
export global MAX_HOSTNAME_LEN := 128

/**
 * @type {Integer (UInt32)}
 */
export global MAX_DOMAIN_NAME_LEN := 128

/**
 * @type {Integer (UInt32)}
 */
export global MAX_SCOPE_ID_LEN := 256

/**
 * @type {Integer (UInt32)}
 */
export global MAX_DHCPV6_DUID_LENGTH := 130

/**
 * @type {Integer (UInt32)}
 */
export global MAX_DNS_SUFFIX_STRING_LENGTH := 256

/**
 * @type {Integer (UInt32)}
 */
export global BROADCAST_NODETYPE := 1

/**
 * @type {Integer (UInt32)}
 */
export global PEER_TO_PEER_NODETYPE := 2

/**
 * @type {Integer (UInt32)}
 */
export global MIXED_NODETYPE := 4

/**
 * @type {Integer (UInt32)}
 */
export global HYBRID_NODETYPE := 8

/**
 * @type {Integer (UInt32)}
 */
export global IP_ADAPTER_ADDRESS_DNS_ELIGIBLE := 1

/**
 * @type {Integer (UInt32)}
 */
export global IP_ADAPTER_ADDRESS_TRANSIENT := 2

/**
 * @type {Integer (UInt32)}
 */
export global IP_ADAPTER_DDNS_ENABLED := 1

/**
 * @type {Integer (UInt32)}
 */
export global IP_ADAPTER_REGISTER_ADAPTER_SUFFIX := 2

/**
 * @type {Integer (UInt32)}
 */
export global IP_ADAPTER_DHCP_ENABLED := 4

/**
 * @type {Integer (UInt32)}
 */
export global IP_ADAPTER_RECEIVE_ONLY := 8

/**
 * @type {Integer (UInt32)}
 */
export global IP_ADAPTER_NO_MULTICAST := 16

/**
 * @type {Integer (UInt32)}
 */
export global IP_ADAPTER_IPV6_OTHER_STATEFUL_CONFIG := 32

/**
 * @type {Integer (UInt32)}
 */
export global IP_ADAPTER_NETBIOS_OVER_TCPIP_ENABLED := 64

/**
 * @type {Integer (UInt32)}
 */
export global IP_ADAPTER_IPV4_ENABLED := 128

/**
 * @type {Integer (UInt32)}
 */
export global IP_ADAPTER_IPV6_ENABLED := 256

/**
 * @type {Integer (UInt32)}
 */
export global IP_ADAPTER_IPV6_MANAGE_ADDRESS_CONFIG := 512

/**
 * @type {Integer (UInt32)}
 */
export global GAA_FLAG_SKIP_DNS_INFO := 2048

/**
 * @type {Integer (UInt32)}
 */
export global IP_ROUTER_MANAGER_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global IP_GENERAL_INFO_BASE := 4294901760

/**
 * @type {Integer (UInt32)}
 */
export global IP_IN_FILTER_INFO := 4294901761

/**
 * @type {Integer (UInt32)}
 */
export global IP_OUT_FILTER_INFO := 4294901762

/**
 * @type {Integer (UInt32)}
 */
export global IP_GLOBAL_INFO := 4294901763

/**
 * @type {Integer (UInt32)}
 */
export global IP_INTERFACE_STATUS_INFO := 4294901764

/**
 * @type {Integer (UInt32)}
 */
export global IP_ROUTE_INFO := 4294901765

/**
 * @type {Integer (UInt32)}
 */
export global IP_PROT_PRIORITY_INFO := 4294901766

/**
 * @type {Integer (UInt32)}
 */
export global IP_ROUTER_DISC_INFO := 4294901767

/**
 * @type {Integer (UInt32)}
 */
export global IP_DEMAND_DIAL_FILTER_INFO := 4294901769

/**
 * @type {Integer (UInt32)}
 */
export global IP_MCAST_HEARBEAT_INFO := 4294901770

/**
 * @type {Integer (UInt32)}
 */
export global IP_MCAST_BOUNDARY_INFO := 4294901771

/**
 * @type {Integer (UInt32)}
 */
export global IP_IPINIP_CFG_INFO := 4294901772

/**
 * @type {Integer (UInt32)}
 */
export global IP_IFFILTER_INFO := 4294901773

/**
 * @type {Integer (UInt32)}
 */
export global IP_MCAST_LIMIT_INFO := 4294901774

/**
 * @type {Integer (UInt32)}
 */
export global IPV6_GLOBAL_INFO := 4294901775

/**
 * @type {Integer (UInt32)}
 */
export global IPV6_ROUTE_INFO := 4294901776

/**
 * @type {Integer (UInt32)}
 */
export global IP_IN_FILTER_INFO_V6 := 4294901777

/**
 * @type {Integer (UInt32)}
 */
export global IP_OUT_FILTER_INFO_V6 := 4294901778

/**
 * @type {Integer (UInt32)}
 */
export global IP_DEMAND_DIAL_FILTER_INFO_V6 := 4294901779

/**
 * @type {Integer (UInt32)}
 */
export global IP_IFFILTER_INFO_V6 := 4294901780

/**
 * @type {Integer (UInt32)}
 */
export global IP_FILTER_ENABLE_INFO := 4294901781

/**
 * @type {Integer (UInt32)}
 */
export global IP_FILTER_ENABLE_INFO_V6 := 4294901782

/**
 * @type {Integer (UInt32)}
 */
export global IP_PROT_PRIORITY_INFO_EX := 4294901783
;@endregion Constants
