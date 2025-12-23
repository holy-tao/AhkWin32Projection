#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class FACILITY_CODE extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_NULL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_RPC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_DISPATCH => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_STORAGE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_ITF => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_WIN32 => 7

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_WINDOWS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_SSPI => 9

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_SECURITY => 9

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_CONTROL => 10

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_CERT => 11

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_INTERNET => 12

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_MEDIASERVER => 13

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_MSMQ => 14

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_SETUPAPI => 15

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_SCARD => 16

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_COMPLUS => 17

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_AAF => 18

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_URT => 19

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_ACS => 20

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_DPLAY => 21

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_UMI => 22

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_SXS => 23

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_WINDOWS_CE => 24

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_HTTP => 25

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_USERMODE_COMMONLOG => 26

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_WER => 27

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_USERMODE_FILTER_MANAGER => 31

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_BACKGROUNDCOPY => 32

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_CONFIGURATION => 33

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_WIA => 33

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_STATE_MANAGEMENT => 34

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_METADIRECTORY => 35

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_WINDOWSUPDATE => 36

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_DIRECTORYSERVICE => 37

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_GRAPHICS => 38

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_SHELL => 39

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_NAP => 39

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_TPM_SERVICES => 40

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_TPM_SOFTWARE => 41

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_UI => 42

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_XAML => 43

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_ACTION_QUEUE => 44

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_PLA => 48

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_WINDOWS_SETUP => 48

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_FVE => 49

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_FWP => 50

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_WINRM => 51

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_NDIS => 52

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_USERMODE_HYPERVISOR => 53

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_CMI => 54

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_USERMODE_VIRTUALIZATION => 55

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_USERMODE_VOLMGR => 56

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_BCD => 57

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_USERMODE_VHD => 58

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_USERMODE_HNS => 59

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_SDIAG => 60

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_WEBSERVICES => 61

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_WINPE => 61

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_WPN => 62

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_WINDOWS_STORE => 63

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_INPUT => 64

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_QUIC => 65

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_EAP => 66

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_IORING => 70

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_WINDOWS_DEFENDER => 80

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_OPC => 81

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_XPS => 82

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_MBN => 84

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_POWERSHELL => 84

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_RAS => 83

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_P2P_INT => 98

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_P2P => 99

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_DAF => 100

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_BLUETOOTH_ATT => 101

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_AUDIO => 102

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_STATEREPOSITORY => 103

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_VISUALCPP => 109

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_SCRIPT => 112

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_PARSE => 113

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_BLB => 120

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_BLB_CLI => 121

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_WSBAPP => 122

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_BLBUI => 128

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_USN => 129

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_USERMODE_VOLSNAP => 130

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_TIERING => 131

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_WSB_ONLINE => 133

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_ONLINE_ID => 134

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_DEVICE_UPDATE_AGENT => 135

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_DRVSERVICING => 136

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_DLS => 153

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_DELIVERY_OPTIMIZATION => 208

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_USERMODE_SPACES => 231

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_USER_MODE_SECURITY_CORE => 232

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_USERMODE_LICENSING => 234

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_SOS => 160

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_OCP_UPDATE_AGENT => 173

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_DEBUGGERS => 176

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_SPP => 256

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_RESTORE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_DMSERVER => 256

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_DEPLOYMENT_SERVICES_SERVER => 257

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_DEPLOYMENT_SERVICES_IMAGING => 258

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_DEPLOYMENT_SERVICES_MANAGEMENT => 259

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_DEPLOYMENT_SERVICES_UTIL => 260

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_DEPLOYMENT_SERVICES_BINLSVC => 261

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_DEPLOYMENT_SERVICES_PXE => 263

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_DEPLOYMENT_SERVICES_TFTP => 264

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_DEPLOYMENT_SERVICES_TRANSPORT_MANAGEMENT => 272

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_DEPLOYMENT_SERVICES_DRIVER_PROVISIONING => 278

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_DEPLOYMENT_SERVICES_MULTICAST_SERVER => 289

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_DEPLOYMENT_SERVICES_MULTICAST_CLIENT => 290

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_DEPLOYMENT_SERVICES_CONTENT_PROVIDER => 293

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_HSP_SERVICES => 296

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_HSP_SOFTWARE => 297

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_LINGUISTIC_SERVICES => 305

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_AUDIOSTREAMING => 1094

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_TTD => 1490

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_ACCELERATOR => 1536

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_WMAAECMA => 1996

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_DIRECTMUSIC => 2168

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_DIRECT3D10 => 2169

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_DXGI => 2170

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_DXGI_DDI => 2171

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_DIRECT3D11 => 2172

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_DIRECT3D11_DEBUG => 2173

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_DIRECT3D12 => 2174

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_DIRECT3D12_DEBUG => 2175

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_DXCORE => 2176

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_PRESENTATION => 2177

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_LEAP => 2184

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_AUDCLNT => 2185

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_WINCODEC_DWRITE_DWM => 2200

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_WINML => 2192

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_DIRECT2D => 2201

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_DEFRAG => 2304

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_USERMODE_SDBUS => 2305

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_JSCRIPT => 2306

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_PIDGENX => 2561

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_EAS => 85

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_WEB => 885

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_WEB_SOCKET => 886

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_MOBILE => 1793

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_SQLITE => 1967

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_SERVICE_FABRIC => 1968

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_UTC => 1989

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_WEP => 2049

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_SYNCENGINE => 2050

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_XBOX => 2339

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_GAME => 2340

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_USERMODE_UNIONFS => 2341

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_USERMODE_PRM => 2342

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_USERMODE_WIN_ACCEL => 2343

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_PPF => 2344

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_PIX => 2748

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_NT_BIT => 268435456
}
