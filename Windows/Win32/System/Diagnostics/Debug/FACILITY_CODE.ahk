#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
class FACILITY_CODE extends Win32Enum {

    /**
     * Native name: FACILITY_NULL
     * @type {Integer (UInt32)}
     */
    static NULL => 0

    /**
     * Native name: FACILITY_RPC
     * @type {Integer (UInt32)}
     */
    static RPC => 1

    /**
     * Native name: FACILITY_DISPATCH
     * @type {Integer (UInt32)}
     */
    static DISPATCH => 2

    /**
     * Native name: FACILITY_STORAGE
     * @type {Integer (UInt32)}
     */
    static STORAGE => 3

    /**
     * Native name: FACILITY_ITF
     * @type {Integer (UInt32)}
     */
    static ITF => 4

    /**
     * Native name: FACILITY_WIN32
     * @type {Integer (UInt32)}
     */
    static WIN32 => 7

    /**
     * Native name: FACILITY_WINDOWS
     * @type {Integer (UInt32)}
     */
    static WINDOWS => 8

    /**
     * Native name: FACILITY_SSPI
     * @type {Integer (UInt32)}
     */
    static SSPI => 9

    /**
     * Native name: FACILITY_SECURITY
     * @type {Integer (UInt32)}
     */
    static SECURITY => 9

    /**
     * Native name: FACILITY_CONTROL
     * @type {Integer (UInt32)}
     */
    static CONTROL => 10

    /**
     * Native name: FACILITY_CERT
     * @type {Integer (UInt32)}
     */
    static CERT => 11

    /**
     * Native name: FACILITY_INTERNET
     * @type {Integer (UInt32)}
     */
    static INTERNET => 12

    /**
     * Native name: FACILITY_MEDIASERVER
     * @type {Integer (UInt32)}
     */
    static MEDIASERVER => 13

    /**
     * Native name: FACILITY_MSMQ
     * @type {Integer (UInt32)}
     */
    static MSMQ => 14

    /**
     * Native name: FACILITY_SETUPAPI
     * @type {Integer (UInt32)}
     */
    static SETUPAPI => 15

    /**
     * Native name: FACILITY_SCARD
     * @type {Integer (UInt32)}
     */
    static SCARD => 16

    /**
     * Native name: FACILITY_COMPLUS
     * @type {Integer (UInt32)}
     */
    static COMPLUS => 17

    /**
     * Native name: FACILITY_AAF
     * @type {Integer (UInt32)}
     */
    static AAF => 18

    /**
     * Native name: FACILITY_URT
     * @type {Integer (UInt32)}
     */
    static URT => 19

    /**
     * Native name: FACILITY_ACS
     * @type {Integer (UInt32)}
     */
    static ACS => 20

    /**
     * Native name: FACILITY_DPLAY
     * @type {Integer (UInt32)}
     */
    static DPLAY => 21

    /**
     * Native name: FACILITY_UMI
     * @type {Integer (UInt32)}
     */
    static UMI => 22

    /**
     * Native name: FACILITY_SXS
     * @type {Integer (UInt32)}
     */
    static SXS => 23

    /**
     * Native name: FACILITY_WINDOWS_CE
     * @type {Integer (UInt32)}
     */
    static WINDOWS_CE => 24

    /**
     * Native name: FACILITY_HTTP
     * @type {Integer (UInt32)}
     */
    static HTTP => 25

    /**
     * Native name: FACILITY_USERMODE_COMMONLOG
     * @type {Integer (UInt32)}
     */
    static USERMODE_COMMONLOG => 26

    /**
     * Native name: FACILITY_WER
     * @type {Integer (UInt32)}
     */
    static WER => 27

    /**
     * Native name: FACILITY_USERMODE_FILTER_MANAGER
     * @type {Integer (UInt32)}
     */
    static USERMODE_FILTER_MANAGER => 31

    /**
     * Native name: FACILITY_BACKGROUNDCOPY
     * @type {Integer (UInt32)}
     */
    static BACKGROUNDCOPY => 32

    /**
     * Native name: FACILITY_CONFIGURATION
     * @type {Integer (UInt32)}
     */
    static CONFIGURATION => 33

    /**
     * Native name: FACILITY_WIA
     * @type {Integer (UInt32)}
     */
    static WIA => 33

    /**
     * Native name: FACILITY_STATE_MANAGEMENT
     * @type {Integer (UInt32)}
     */
    static STATE_MANAGEMENT => 34

    /**
     * Native name: FACILITY_METADIRECTORY
     * @type {Integer (UInt32)}
     */
    static METADIRECTORY => 35

    /**
     * Native name: FACILITY_WINDOWSUPDATE
     * @type {Integer (UInt32)}
     */
    static WINDOWSUPDATE => 36

    /**
     * Native name: FACILITY_DIRECTORYSERVICE
     * @type {Integer (UInt32)}
     */
    static DIRECTORYSERVICE => 37

    /**
     * Native name: FACILITY_GRAPHICS
     * @type {Integer (UInt32)}
     */
    static GRAPHICS => 38

    /**
     * Native name: FACILITY_SHELL
     * @type {Integer (UInt32)}
     */
    static SHELL => 39

    /**
     * Native name: FACILITY_NAP
     * @type {Integer (UInt32)}
     */
    static NAP => 39

    /**
     * Native name: FACILITY_TPM_SERVICES
     * @type {Integer (UInt32)}
     */
    static TPM_SERVICES => 40

    /**
     * Native name: FACILITY_TPM_SOFTWARE
     * @type {Integer (UInt32)}
     */
    static TPM_SOFTWARE => 41

    /**
     * Native name: FACILITY_UI
     * @type {Integer (UInt32)}
     */
    static UI => 42

    /**
     * Native name: FACILITY_XAML
     * @type {Integer (UInt32)}
     */
    static XAML => 43

    /**
     * Native name: FACILITY_ACTION_QUEUE
     * @type {Integer (UInt32)}
     */
    static ACTION_QUEUE => 44

    /**
     * Native name: FACILITY_PLA
     * @type {Integer (UInt32)}
     */
    static PLA => 48

    /**
     * Native name: FACILITY_WINDOWS_SETUP
     * @type {Integer (UInt32)}
     */
    static WINDOWS_SETUP => 48

    /**
     * Native name: FACILITY_FVE
     * @type {Integer (UInt32)}
     */
    static FVE => 49

    /**
     * Native name: FACILITY_FWP
     * @type {Integer (UInt32)}
     */
    static FWP => 50

    /**
     * Native name: FACILITY_WINRM
     * @type {Integer (UInt32)}
     */
    static WINRM => 51

    /**
     * Native name: FACILITY_NDIS
     * @type {Integer (UInt32)}
     */
    static NDIS => 52

    /**
     * Native name: FACILITY_USERMODE_HYPERVISOR
     * @type {Integer (UInt32)}
     */
    static USERMODE_HYPERVISOR => 53

    /**
     * Native name: FACILITY_CMI
     * @type {Integer (UInt32)}
     */
    static CMI => 54

    /**
     * Native name: FACILITY_USERMODE_VIRTUALIZATION
     * @type {Integer (UInt32)}
     */
    static USERMODE_VIRTUALIZATION => 55

    /**
     * Native name: FACILITY_USERMODE_VOLMGR
     * @type {Integer (UInt32)}
     */
    static USERMODE_VOLMGR => 56

    /**
     * Native name: FACILITY_BCD
     * @type {Integer (UInt32)}
     */
    static BCD => 57

    /**
     * Native name: FACILITY_USERMODE_VHD
     * @type {Integer (UInt32)}
     */
    static USERMODE_VHD => 58

    /**
     * Native name: FACILITY_USERMODE_HNS
     * @type {Integer (UInt32)}
     */
    static USERMODE_HNS => 59

    /**
     * Native name: FACILITY_SDIAG
     * @type {Integer (UInt32)}
     */
    static SDIAG => 60

    /**
     * Native name: FACILITY_WEBSERVICES
     * @type {Integer (UInt32)}
     */
    static WEBSERVICES => 61

    /**
     * Native name: FACILITY_WINPE
     * @type {Integer (UInt32)}
     */
    static WINPE => 61

    /**
     * Native name: FACILITY_WPN
     * @type {Integer (UInt32)}
     */
    static WPN => 62

    /**
     * Native name: FACILITY_WINDOWS_STORE
     * @type {Integer (UInt32)}
     */
    static WINDOWS_STORE => 63

    /**
     * Native name: FACILITY_INPUT
     * @type {Integer (UInt32)}
     */
    static INPUT => 64

    /**
     * Native name: FACILITY_QUIC
     * @type {Integer (UInt32)}
     */
    static QUIC => 65

    /**
     * Native name: FACILITY_EAP
     * @type {Integer (UInt32)}
     */
    static EAP => 66

    /**
     * Native name: FACILITY_IORING
     * @type {Integer (UInt32)}
     */
    static IORING => 70

    /**
     * Native name: FACILITY_WINDOWS_DEFENDER
     * @type {Integer (UInt32)}
     */
    static WINDOWS_DEFENDER => 80

    /**
     * Native name: FACILITY_OPC
     * @type {Integer (UInt32)}
     */
    static OPC => 81

    /**
     * Native name: FACILITY_XPS
     * @type {Integer (UInt32)}
     */
    static XPS => 82

    /**
     * Native name: FACILITY_MBN
     * @type {Integer (UInt32)}
     */
    static MBN => 84

    /**
     * Native name: FACILITY_POWERSHELL
     * @type {Integer (UInt32)}
     */
    static POWERSHELL => 84

    /**
     * Native name: FACILITY_RAS
     * @type {Integer (UInt32)}
     */
    static RAS => 83

    /**
     * Native name: FACILITY_P2P_INT
     * @type {Integer (UInt32)}
     */
    static P2P_INT => 98

    /**
     * Native name: FACILITY_P2P
     * @type {Integer (UInt32)}
     */
    static P2P => 99

    /**
     * Native name: FACILITY_DAF
     * @type {Integer (UInt32)}
     */
    static DAF => 100

    /**
     * Native name: FACILITY_BLUETOOTH_ATT
     * @type {Integer (UInt32)}
     */
    static BLUETOOTH_ATT => 101

    /**
     * Native name: FACILITY_AUDIO
     * @type {Integer (UInt32)}
     */
    static AUDIO => 102

    /**
     * Native name: FACILITY_STATEREPOSITORY
     * @type {Integer (UInt32)}
     */
    static STATEREPOSITORY => 103

    /**
     * Native name: FACILITY_VISUALCPP
     * @type {Integer (UInt32)}
     */
    static VISUALCPP => 109

    /**
     * Native name: FACILITY_SCRIPT
     * @type {Integer (UInt32)}
     */
    static SCRIPT => 112

    /**
     * Native name: FACILITY_PARSE
     * @type {Integer (UInt32)}
     */
    static PARSE => 113

    /**
     * Native name: FACILITY_BLB
     * @type {Integer (UInt32)}
     */
    static BLB => 120

    /**
     * Native name: FACILITY_BLB_CLI
     * @type {Integer (UInt32)}
     */
    static BLB_CLI => 121

    /**
     * Native name: FACILITY_WSBAPP
     * @type {Integer (UInt32)}
     */
    static WSBAPP => 122

    /**
     * Native name: FACILITY_BLBUI
     * @type {Integer (UInt32)}
     */
    static BLBUI => 128

    /**
     * Native name: FACILITY_USN
     * @type {Integer (UInt32)}
     */
    static USN => 129

    /**
     * Native name: FACILITY_USERMODE_VOLSNAP
     * @type {Integer (UInt32)}
     */
    static USERMODE_VOLSNAP => 130

    /**
     * Native name: FACILITY_TIERING
     * @type {Integer (UInt32)}
     */
    static TIERING => 131

    /**
     * Native name: FACILITY_WSB_ONLINE
     * @type {Integer (UInt32)}
     */
    static WSB_ONLINE => 133

    /**
     * Native name: FACILITY_ONLINE_ID
     * @type {Integer (UInt32)}
     */
    static ONLINE_ID => 134

    /**
     * Native name: FACILITY_DEVICE_UPDATE_AGENT
     * @type {Integer (UInt32)}
     */
    static DEVICE_UPDATE_AGENT => 135

    /**
     * Native name: FACILITY_DRVSERVICING
     * @type {Integer (UInt32)}
     */
    static DRVSERVICING => 136

    /**
     * Native name: FACILITY_DLS
     * @type {Integer (UInt32)}
     */
    static DLS => 153

    /**
     * Native name: FACILITY_DELIVERY_OPTIMIZATION
     * @type {Integer (UInt32)}
     */
    static DELIVERY_OPTIMIZATION => 208

    /**
     * Native name: FACILITY_USERMODE_SPACES
     * @type {Integer (UInt32)}
     */
    static USERMODE_SPACES => 231

    /**
     * Native name: FACILITY_USER_MODE_SECURITY_CORE
     * @type {Integer (UInt32)}
     */
    static USER_MODE_SECURITY_CORE => 232

    /**
     * Native name: FACILITY_USERMODE_LICENSING
     * @type {Integer (UInt32)}
     */
    static USERMODE_LICENSING => 234

    /**
     * Native name: FACILITY_SOS
     * @type {Integer (UInt32)}
     */
    static SOS => 160

    /**
     * Native name: FACILITY_OCP_UPDATE_AGENT
     * @type {Integer (UInt32)}
     */
    static OCP_UPDATE_AGENT => 173

    /**
     * Native name: FACILITY_DEBUGGERS
     * @type {Integer (UInt32)}
     */
    static DEBUGGERS => 176

    /**
     * Native name: FACILITY_SPP
     * @type {Integer (UInt32)}
     */
    static SPP => 256

    /**
     * Native name: FACILITY_RESTORE
     * @type {Integer (UInt32)}
     */
    static RESTORE => 256

    /**
     * Native name: FACILITY_DMSERVER
     * @type {Integer (UInt32)}
     */
    static DMSERVER => 256

    /**
     * Native name: FACILITY_DEPLOYMENT_SERVICES_SERVER
     * @type {Integer (UInt32)}
     */
    static DEPLOYMENT_SERVICES_SERVER => 257

    /**
     * Native name: FACILITY_DEPLOYMENT_SERVICES_IMAGING
     * @type {Integer (UInt32)}
     */
    static DEPLOYMENT_SERVICES_IMAGING => 258

    /**
     * Native name: FACILITY_DEPLOYMENT_SERVICES_MANAGEMENT
     * @type {Integer (UInt32)}
     */
    static DEPLOYMENT_SERVICES_MANAGEMENT => 259

    /**
     * Native name: FACILITY_DEPLOYMENT_SERVICES_UTIL
     * @type {Integer (UInt32)}
     */
    static DEPLOYMENT_SERVICES_UTIL => 260

    /**
     * Native name: FACILITY_DEPLOYMENT_SERVICES_BINLSVC
     * @type {Integer (UInt32)}
     */
    static DEPLOYMENT_SERVICES_BINLSVC => 261

    /**
     * Native name: FACILITY_DEPLOYMENT_SERVICES_PXE
     * @type {Integer (UInt32)}
     */
    static DEPLOYMENT_SERVICES_PXE => 263

    /**
     * Native name: FACILITY_DEPLOYMENT_SERVICES_TFTP
     * @type {Integer (UInt32)}
     */
    static DEPLOYMENT_SERVICES_TFTP => 264

    /**
     * Native name: FACILITY_DEPLOYMENT_SERVICES_TRANSPORT_MANAGEMENT
     * @type {Integer (UInt32)}
     */
    static DEPLOYMENT_SERVICES_TRANSPORT_MANAGEMENT => 272

    /**
     * Native name: FACILITY_DEPLOYMENT_SERVICES_DRIVER_PROVISIONING
     * @type {Integer (UInt32)}
     */
    static DEPLOYMENT_SERVICES_DRIVER_PROVISIONING => 278

    /**
     * Native name: FACILITY_DEPLOYMENT_SERVICES_MULTICAST_SERVER
     * @type {Integer (UInt32)}
     */
    static DEPLOYMENT_SERVICES_MULTICAST_SERVER => 289

    /**
     * Native name: FACILITY_DEPLOYMENT_SERVICES_MULTICAST_CLIENT
     * @type {Integer (UInt32)}
     */
    static DEPLOYMENT_SERVICES_MULTICAST_CLIENT => 290

    /**
     * Native name: FACILITY_DEPLOYMENT_SERVICES_CONTENT_PROVIDER
     * @type {Integer (UInt32)}
     */
    static DEPLOYMENT_SERVICES_CONTENT_PROVIDER => 293

    /**
     * Native name: FACILITY_HSP_SERVICES
     * @type {Integer (UInt32)}
     */
    static HSP_SERVICES => 296

    /**
     * Native name: FACILITY_HSP_SOFTWARE
     * @type {Integer (UInt32)}
     */
    static HSP_SOFTWARE => 297

    /**
     * Native name: FACILITY_LINGUISTIC_SERVICES
     * @type {Integer (UInt32)}
     */
    static LINGUISTIC_SERVICES => 305

    /**
     * Native name: FACILITY_AUDIOSTREAMING
     * @type {Integer (UInt32)}
     */
    static AUDIOSTREAMING => 1094

    /**
     * Native name: FACILITY_TTD
     * @type {Integer (UInt32)}
     */
    static TTD => 1490

    /**
     * Native name: FACILITY_ACCELERATOR
     * @type {Integer (UInt32)}
     */
    static ACCELERATOR => 1536

    /**
     * Native name: FACILITY_WMAAECMA
     * @type {Integer (UInt32)}
     */
    static WMAAECMA => 1996

    /**
     * Native name: FACILITY_DIRECTMUSIC
     * @type {Integer (UInt32)}
     */
    static DIRECTMUSIC => 2168

    /**
     * Native name: FACILITY_DIRECT3D10
     * @type {Integer (UInt32)}
     */
    static DIRECT3D10 => 2169

    /**
     * Native name: FACILITY_DXGI
     * @type {Integer (UInt32)}
     */
    static DXGI => 2170

    /**
     * Native name: FACILITY_DXGI_DDI
     * @type {Integer (UInt32)}
     */
    static DXGI_DDI => 2171

    /**
     * Native name: FACILITY_DIRECT3D11
     * @type {Integer (UInt32)}
     */
    static DIRECT3D11 => 2172

    /**
     * Native name: FACILITY_DIRECT3D11_DEBUG
     * @type {Integer (UInt32)}
     */
    static DIRECT3D11_DEBUG => 2173

    /**
     * Native name: FACILITY_DIRECT3D12
     * @type {Integer (UInt32)}
     */
    static DIRECT3D12 => 2174

    /**
     * Native name: FACILITY_DIRECT3D12_DEBUG
     * @type {Integer (UInt32)}
     */
    static DIRECT3D12_DEBUG => 2175

    /**
     * Native name: FACILITY_DXCORE
     * @type {Integer (UInt32)}
     */
    static DXCORE => 2176

    /**
     * Native name: FACILITY_PRESENTATION
     * @type {Integer (UInt32)}
     */
    static PRESENTATION => 2177

    /**
     * Native name: FACILITY_LEAP
     * @type {Integer (UInt32)}
     */
    static LEAP => 2184

    /**
     * Native name: FACILITY_AUDCLNT
     * @type {Integer (UInt32)}
     */
    static AUDCLNT => 2185

    /**
     * Native name: FACILITY_WINCODEC_DWRITE_DWM
     * @type {Integer (UInt32)}
     */
    static WINCODEC_DWRITE_DWM => 2200

    /**
     * Native name: FACILITY_WINML
     * @type {Integer (UInt32)}
     */
    static WINML => 2192

    /**
     * Native name: FACILITY_DIRECT2D
     * @type {Integer (UInt32)}
     */
    static DIRECT2D => 2201

    /**
     * Native name: FACILITY_DEFRAG
     * @type {Integer (UInt32)}
     */
    static DEFRAG => 2304

    /**
     * Native name: FACILITY_USERMODE_SDBUS
     * @type {Integer (UInt32)}
     */
    static USERMODE_SDBUS => 2305

    /**
     * Native name: FACILITY_JSCRIPT
     * @type {Integer (UInt32)}
     */
    static JSCRIPT => 2306

    /**
     * Native name: FACILITY_PIDGENX
     * @type {Integer (UInt32)}
     */
    static PIDGENX => 2561

    /**
     * Native name: FACILITY_EAS
     * @type {Integer (UInt32)}
     */
    static EAS => 85

    /**
     * Native name: FACILITY_WEB
     * @type {Integer (UInt32)}
     */
    static WEB => 885

    /**
     * Native name: FACILITY_WEB_SOCKET
     * @type {Integer (UInt32)}
     */
    static WEB_SOCKET => 886

    /**
     * Native name: FACILITY_MOBILE
     * @type {Integer (UInt32)}
     */
    static MOBILE => 1793

    /**
     * Native name: FACILITY_SQLITE
     * @type {Integer (UInt32)}
     */
    static SQLITE => 1967

    /**
     * Native name: FACILITY_SERVICE_FABRIC
     * @type {Integer (UInt32)}
     */
    static SERVICE_FABRIC => 1968

    /**
     * Native name: FACILITY_UTC
     * @type {Integer (UInt32)}
     */
    static UTC => 1989

    /**
     * Native name: FACILITY_WEP
     * @type {Integer (UInt32)}
     */
    static WEP => 2049

    /**
     * Native name: FACILITY_SYNCENGINE
     * @type {Integer (UInt32)}
     */
    static SYNCENGINE => 2050

    /**
     * Native name: FACILITY_XBOX
     * @type {Integer (UInt32)}
     */
    static XBOX => 2339

    /**
     * Native name: FACILITY_GAME
     * @type {Integer (UInt32)}
     */
    static GAME => 2340

    /**
     * Native name: FACILITY_USERMODE_UNIONFS
     * @type {Integer (UInt32)}
     */
    static USERMODE_UNIONFS => 2341

    /**
     * Native name: FACILITY_USERMODE_PRM
     * @type {Integer (UInt32)}
     */
    static USERMODE_PRM => 2342

    /**
     * Native name: FACILITY_USERMODE_WIN_ACCEL
     * @type {Integer (UInt32)}
     */
    static USERMODE_WIN_ACCEL => 2343

    /**
     * Native name: FACILITY_PPF
     * @type {Integer (UInt32)}
     */
    static PPF => 2344

    /**
     * Native name: FACILITY_PIX
     * @type {Integer (UInt32)}
     */
    static PIX => 2748

    /**
     * Native name: FACILITY_NT_BIT
     * @type {Integer (UInt32)}
     */
    static NT_BIT => 268435456
}
