#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 * @version v4.0.30319
 */
class WindowsProgramming {

;@region Constants

    /**
     * @type {String}
     */
    static WLDP_DLL => "WLDP.DLL"

    /**
     * @type {String}
     */
    static WLDP_GETLOCKDOWNPOLICY_FN => "WldpGetLockdownPolicy"

    /**
     * @type {String}
     */
    static WLDP_ISCLASSINAPPROVEDLIST_FN => "WldpIsClassInApprovedList"

    /**
     * @type {String}
     */
    static WLDP_SETDYNAMICCODETRUST_FN => "WldpSetDynamicCodeTrust"

    /**
     * @type {String}
     */
    static WLDP_ISDYNAMICCODEPOLICYENABLED_FN => "WldpIsDynamicCodePolicyEnabled"

    /**
     * @type {String}
     */
    static WLDP_QUERYDANAMICCODETRUST_FN => "WldpQueryDynamicCodeTrust"

    /**
     * @type {String}
     */
    static WLDP_QUERYDYNAMICCODETRUST_FN => "WldpQueryDynamicCodeTrust"

    /**
     * @type {String}
     */
    static WLDP_QUERYWINDOWSLOCKDOWNMODE_FN => "WldpQueryWindowsLockdownMode"

    /**
     * @type {String}
     */
    static WLDP_SETWINDOWSLOCKDOWNRESTRICTION_FN => "WldpSetWindowsLockdownRestriction"

    /**
     * @type {String}
     */
    static WLDP_QUERYDEVICESECURITYINFORMATION_FN => "WldpQueryDeviceSecurityInformation"

    /**
     * @type {String}
     */
    static WLDP_QUERYWINDOWSLOCKDOWNRESTRICTION_FN => "WldpQueryWindowsLockdownRestriction"

    /**
     * @type {String}
     */
    static WLDP_ISAPPAPPROVEDBYPOLICY_FN => "WldpIsAppApprovedByPolicy"

    /**
     * @type {String}
     */
    static WLDP_QUERYPOLICYSETTINGENABLED_FN => "WldpQueryPolicySettingEnabled"

    /**
     * @type {String}
     */
    static WLDP_QUERYPOLICYSETTINGENABLED2_FN => "WldpQueryPolicySettingEnabled2"

    /**
     * @type {String}
     */
    static WLDP_ISWCOSPRODUCTIONCONFIGURATION_FN => "WldpIsWcosProductionConfiguration"

    /**
     * @type {String}
     */
    static WLDP_RESETWCOSPRODUCTIONCONFIGURATION_FN => "WldpResetWcosProductionConfiguration"

    /**
     * @type {String}
     */
    static WLDP_ISPRODUCTIONCONFIGURATION_FN => "WldpIsProductionConfiguration"

    /**
     * @type {String}
     */
    static WLDP_RESETPRODUCTIONCONFIGURATION_FN => "WldpResetProductionConfiguration"

    /**
     * @type {String}
     */
    static WLDP_CANEXECUTEBUFFER_FN => "WldpCanExecuteBuffer"

    /**
     * @type {String}
     */
    static WLDP_CANEXECUTEFILE_FN => "WldpCanExecuteFile"

    /**
     * @type {Integer (UInt32)}
     */
    static WLDP_LOCKDOWN_UNDEFINED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WLDP_LOCKDOWN_DEFINED_FLAG => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static WLDP_LOCKDOWN_CONFIG_CI_FLAG => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WLDP_LOCKDOWN_CONFIG_CI_AUDIT_FLAG => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WLDP_LOCKDOWN_UMCIENFORCE_FLAG => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WLDP_LOCKDOWN_AUDIT_FLAG => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WLDP_LOCKDOWN_EXCLUSION_FLAG => 16

    /**
     * @type {Integer (UInt32)}
     */
    static WLDP_LOCKDOWN_OFF => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static WLDP_HOST_INFORMATION_REVISION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WLDP_FLAGS_SKIPSIGNATUREVALIDATION => 256

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_TDI_ENTITIES => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static INFO_CLASS_GENERIC => 256

    /**
     * @type {Integer (UInt32)}
     */
    static INFO_CLASS_PROTOCOL => 512

    /**
     * @type {Integer (UInt32)}
     */
    static INFO_CLASS_IMPLEMENTATION => 768

    /**
     * @type {Integer (UInt32)}
     */
    static INFO_TYPE_PROVIDER => 256

    /**
     * @type {Integer (UInt32)}
     */
    static INFO_TYPE_ADDRESS_OBJECT => 512

    /**
     * @type {Integer (UInt32)}
     */
    static INFO_TYPE_CONNECTION => 768

    /**
     * @type {Integer (UInt32)}
     */
    static ENTITY_LIST_ID => 0

    /**
     * @type {Integer (Int32)}
     */
    static INVALID_ENTITY_INSTANCE => -1

    /**
     * @type {Integer (UInt32)}
     */
    static CONTEXT_SIZE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static ENTITY_TYPE_ID => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CO_TL_NBF => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static CO_TL_SPX => 1026

    /**
     * @type {Integer (UInt32)}
     */
    static CO_TL_TCP => 1028

    /**
     * @type {Integer (UInt32)}
     */
    static CO_TL_SPP => 1030

    /**
     * @type {Integer (UInt32)}
     */
    static CL_TL_NBF => 1025

    /**
     * @type {Integer (UInt32)}
     */
    static CL_TL_UDP => 1027

    /**
     * @type {Integer (UInt32)}
     */
    static ER_ICMP => 896

    /**
     * @type {Integer (UInt32)}
     */
    static CL_NL_IPX => 769

    /**
     * @type {Integer (UInt32)}
     */
    static CL_NL_IP => 771

    /**
     * @type {Integer (UInt32)}
     */
    static AT_ARP => 640

    /**
     * @type {Integer (UInt32)}
     */
    static AT_NULL => 642

    /**
     * @type {Integer (UInt32)}
     */
    static IF_GENERIC => 512

    /**
     * @type {Integer (UInt32)}
     */
    static IF_MIB => 514

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_TDI_TL_IO_CONTROL_ENDPOINT => 2162744

    /**
     * @type {Integer (UInt32)}
     */
    static DCI_VERSION => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DCICREATEPRIMARYSURFACE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DCICREATEOFFSCREENSURFACE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DCICREATEOVERLAYSURFACE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DCIENUMSURFACE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DCIESCAPE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DCI_OK => 0

    /**
     * @type {Integer (Int32)}
     */
    static DCI_FAIL_GENERIC => -1

    /**
     * @type {Integer (Int32)}
     */
    static DCI_FAIL_UNSUPPORTEDVERSION => -2

    /**
     * @type {Integer (Int32)}
     */
    static DCI_FAIL_INVALIDSURFACE => -3

    /**
     * @type {Integer (Int32)}
     */
    static DCI_FAIL_UNSUPPORTED => -4

    /**
     * @type {Integer (Int32)}
     */
    static DCI_ERR_CURRENTLYNOTAVAIL => -5

    /**
     * @type {Integer (Int32)}
     */
    static DCI_ERR_INVALIDRECT => -6

    /**
     * @type {Integer (Int32)}
     */
    static DCI_ERR_UNSUPPORTEDFORMAT => -7

    /**
     * @type {Integer (Int32)}
     */
    static DCI_ERR_UNSUPPORTEDMASK => -8

    /**
     * @type {Integer (Int32)}
     */
    static DCI_ERR_TOOBIGHEIGHT => -9

    /**
     * @type {Integer (Int32)}
     */
    static DCI_ERR_TOOBIGWIDTH => -10

    /**
     * @type {Integer (Int32)}
     */
    static DCI_ERR_TOOBIGSIZE => -11

    /**
     * @type {Integer (Int32)}
     */
    static DCI_ERR_OUTOFMEMORY => -12

    /**
     * @type {Integer (Int32)}
     */
    static DCI_ERR_INVALIDPOSITION => -13

    /**
     * @type {Integer (Int32)}
     */
    static DCI_ERR_INVALIDSTRETCH => -14

    /**
     * @type {Integer (Int32)}
     */
    static DCI_ERR_INVALIDCLIPLIST => -15

    /**
     * @type {Integer (Int32)}
     */
    static DCI_ERR_SURFACEISOBSCURED => -16

    /**
     * @type {Integer (Int32)}
     */
    static DCI_ERR_XALIGN => -17

    /**
     * @type {Integer (Int32)}
     */
    static DCI_ERR_YALIGN => -18

    /**
     * @type {Integer (Int32)}
     */
    static DCI_ERR_XYALIGN => -19

    /**
     * @type {Integer (Int32)}
     */
    static DCI_ERR_WIDTHALIGN => -20

    /**
     * @type {Integer (Int32)}
     */
    static DCI_ERR_HEIGHTALIGN => -21

    /**
     * @type {Integer (UInt32)}
     */
    static DCI_STATUS_POINTERCHANGED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DCI_STATUS_STRIDECHANGED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DCI_STATUS_FORMATCHANGED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DCI_STATUS_SURFACEINFOCHANGED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DCI_STATUS_CHROMAKEYCHANGED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DCI_STATUS_WASSTILLDRAWING => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DCI_SURFACE_TYPE => 15

    /**
     * @type {Integer (UInt32)}
     */
    static DCI_PRIMARY => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DCI_OFFSCREEN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DCI_OVERLAY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DCI_VISIBLE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DCI_CHROMAKEY => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DCI_1632_ACCESS => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DCI_DWORDSIZE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static DCI_DWORDALIGN => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DCI_WRITEONLY => 512

    /**
     * @type {Integer (UInt32)}
     */
    static DCI_ASYNC => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static DCI_CAN_STRETCHX => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static DCI_CAN_STRETCHY => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static DCI_CAN_STRETCHXN => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static DCI_CAN_STRETCHYN => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static DCI_CANOVERLAY => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_FLAG_OPEN_REQUIRING_OPLOCK => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_FLAG_IGNORE_IMPERSONATED_DEVICEMAP => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static FAIL_FAST_GENERATE_EXCEPTION_ADDRESS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FAIL_FAST_NO_HARD_ERROR_DLG => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SP_SERIALCOMM => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PST_UNSPECIFIED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PST_RS232 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PST_PARALLELPORT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PST_RS422 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PST_RS423 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PST_RS449 => 5

    /**
     * @type {Integer (UInt32)}
     */
    static PST_MODEM => 6

    /**
     * @type {Integer (UInt32)}
     */
    static PST_FAX => 33

    /**
     * @type {Integer (UInt32)}
     */
    static PST_SCANNER => 34

    /**
     * @type {Integer (UInt32)}
     */
    static PST_NETWORK_BRIDGE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static PST_LAT => 257

    /**
     * @type {Integer (UInt32)}
     */
    static PST_TCPIP_TELNET => 258

    /**
     * @type {Integer (UInt32)}
     */
    static PST_X25 => 259

    /**
     * @type {Integer (UInt32)}
     */
    static PCF_DTRDSR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PCF_RTSCTS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PCF_RLSD => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PCF_PARITY_CHECK => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PCF_XONXOFF => 16

    /**
     * @type {Integer (UInt32)}
     */
    static PCF_SETXCHAR => 32

    /**
     * @type {Integer (UInt32)}
     */
    static PCF_TOTALTIMEOUTS => 64

    /**
     * @type {Integer (UInt32)}
     */
    static PCF_INTTIMEOUTS => 128

    /**
     * @type {Integer (UInt32)}
     */
    static PCF_SPECIALCHARS => 256

    /**
     * @type {Integer (UInt32)}
     */
    static PCF_16BITMODE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static SP_PARITY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SP_BAUD => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SP_DATABITS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SP_STOPBITS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SP_HANDSHAKING => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SP_PARITY_CHECK => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SP_RLSD => 64

    /**
     * @type {Integer (UInt32)}
     */
    static BAUD_075 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static BAUD_110 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static BAUD_134_5 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static BAUD_150 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static BAUD_300 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static BAUD_600 => 32

    /**
     * @type {Integer (UInt32)}
     */
    static BAUD_1200 => 64

    /**
     * @type {Integer (UInt32)}
     */
    static BAUD_1800 => 128

    /**
     * @type {Integer (UInt32)}
     */
    static BAUD_2400 => 256

    /**
     * @type {Integer (UInt32)}
     */
    static BAUD_4800 => 512

    /**
     * @type {Integer (UInt32)}
     */
    static BAUD_7200 => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static BAUD_9600 => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static BAUD_14400 => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static BAUD_19200 => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static BAUD_38400 => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static BAUD_56K => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static BAUD_128K => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static BAUD_115200 => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static BAUD_57600 => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static BAUD_USER => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static COMMPROP_INITIALIZED => 3879531822

    /**
     * @type {Integer (UInt32)}
     */
    static DTR_CONTROL_DISABLE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DTR_CONTROL_ENABLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DTR_CONTROL_HANDSHAKE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RTS_CONTROL_DISABLE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static RTS_CONTROL_ENABLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RTS_CONTROL_HANDSHAKE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RTS_CONTROL_TOGGLE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static GMEM_NOCOMPACT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static GMEM_NODISCARD => 32

    /**
     * @type {Integer (UInt32)}
     */
    static GMEM_MODIFY => 128

    /**
     * @type {Integer (UInt32)}
     */
    static GMEM_DISCARDABLE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static GMEM_NOT_BANKED => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static GMEM_SHARE => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static GMEM_DDESHARE => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static GMEM_NOTIFY => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static GMEM_LOWER => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static GMEM_VALID_FLAGS => 32626

    /**
     * @type {Integer (UInt32)}
     */
    static GMEM_INVALID_HANDLE => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static GMEM_DISCARDED => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static GMEM_LOCKCOUNT => 255

    /**
     * @type {Integer (UInt32)}
     */
    static THREAD_PRIORITY_ERROR_RETURN => 2147483647

    /**
     * @type {Integer (UInt32)}
     */
    static DRIVE_UNKNOWN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DRIVE_NO_ROOT_DIR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DRIVE_REMOVABLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DRIVE_FIXED => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DRIVE_REMOTE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DRIVE_CDROM => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DRIVE_RAMDISK => 6

    /**
     * @type {Integer (UInt32)}
     */
    static IGNORE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CBR_110 => 110

    /**
     * @type {Integer (UInt32)}
     */
    static CBR_300 => 300

    /**
     * @type {Integer (UInt32)}
     */
    static CBR_600 => 600

    /**
     * @type {Integer (UInt32)}
     */
    static CBR_1200 => 1200

    /**
     * @type {Integer (UInt32)}
     */
    static CBR_2400 => 2400

    /**
     * @type {Integer (UInt32)}
     */
    static CBR_4800 => 4800

    /**
     * @type {Integer (UInt32)}
     */
    static CBR_9600 => 9600

    /**
     * @type {Integer (UInt32)}
     */
    static CBR_14400 => 14400

    /**
     * @type {Integer (UInt32)}
     */
    static CBR_19200 => 19200

    /**
     * @type {Integer (UInt32)}
     */
    static CBR_38400 => 38400

    /**
     * @type {Integer (UInt32)}
     */
    static CBR_56000 => 56000

    /**
     * @type {Integer (UInt32)}
     */
    static CBR_57600 => 57600

    /**
     * @type {Integer (UInt32)}
     */
    static CBR_115200 => 115200

    /**
     * @type {Integer (UInt32)}
     */
    static CBR_128000 => 128000

    /**
     * @type {Integer (UInt32)}
     */
    static CBR_256000 => 256000

    /**
     * @type {Integer (UInt32)}
     */
    static CE_TXFULL => 256

    /**
     * @type {Integer (UInt32)}
     */
    static CE_PTO => 512

    /**
     * @type {Integer (UInt32)}
     */
    static CE_IOE => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static CE_DNS => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static CE_OOP => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static CE_MODE => 32768

    /**
     * @type {Integer (Int32)}
     */
    static IE_BADID => -1

    /**
     * @type {Integer (Int32)}
     */
    static IE_OPEN => -2

    /**
     * @type {Integer (Int32)}
     */
    static IE_NOPEN => -3

    /**
     * @type {Integer (Int32)}
     */
    static IE_MEMORY => -4

    /**
     * @type {Integer (Int32)}
     */
    static IE_DEFAULT => -5

    /**
     * @type {Integer (Int32)}
     */
    static IE_HARDWARE => -10

    /**
     * @type {Integer (Int32)}
     */
    static IE_BYTESIZE => -11

    /**
     * @type {Integer (Int32)}
     */
    static IE_BAUDRATE => -12

    /**
     * @type {Integer (UInt32)}
     */
    static RESETDEV => 7

    /**
     * @type {Integer (UInt32)}
     */
    static LPTx => 128

    /**
     * @type {Integer (UInt32)}
     */
    static S_QUEUEEMPTY => 0

    /**
     * @type {Integer (UInt32)}
     */
    static S_THRESHOLD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static S_ALLTHRESHOLD => 2

    /**
     * @type {Integer (UInt32)}
     */
    static S_NORMAL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static S_LEGATO => 1

    /**
     * @type {Integer (UInt32)}
     */
    static S_STACCATO => 2

    /**
     * @type {Integer (UInt32)}
     */
    static S_PERIOD512 => 0

    /**
     * @type {Integer (UInt32)}
     */
    static S_PERIOD1024 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static S_PERIOD2048 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static S_PERIODVOICE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static S_WHITE512 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static S_WHITE1024 => 5

    /**
     * @type {Integer (UInt32)}
     */
    static S_WHITE2048 => 6

    /**
     * @type {Integer (UInt32)}
     */
    static S_WHITEVOICE => 7

    /**
     * @type {Integer (Int32)}
     */
    static S_SERDVNA => -1

    /**
     * @type {Integer (Int32)}
     */
    static S_SEROFM => -2

    /**
     * @type {Integer (Int32)}
     */
    static S_SERMACT => -3

    /**
     * @type {Integer (Int32)}
     */
    static S_SERQFUL => -4

    /**
     * @type {Integer (Int32)}
     */
    static S_SERBDNT => -5

    /**
     * @type {Integer (Int32)}
     */
    static S_SERDLN => -6

    /**
     * @type {Integer (Int32)}
     */
    static S_SERDCC => -7

    /**
     * @type {Integer (Int32)}
     */
    static S_SERDTP => -8

    /**
     * @type {Integer (Int32)}
     */
    static S_SERDVL => -9

    /**
     * @type {Integer (Int32)}
     */
    static S_SERDMD => -10

    /**
     * @type {Integer (Int32)}
     */
    static S_SERDSH => -11

    /**
     * @type {Integer (Int32)}
     */
    static S_SERDPT => -12

    /**
     * @type {Integer (Int32)}
     */
    static S_SERDFQ => -13

    /**
     * @type {Integer (Int32)}
     */
    static S_SERDDR => -14

    /**
     * @type {Integer (Int32)}
     */
    static S_SERDSR => -15

    /**
     * @type {Integer (Int32)}
     */
    static S_SERDST => -16

    /**
     * @type {Integer (UInt32)}
     */
    static FS_CASE_IS_PRESERVED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FS_CASE_SENSITIVE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FS_UNICODE_STORED_ON_DISK => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FS_PERSISTENT_ACLS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static FS_VOL_IS_COMPRESSED => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static FS_FILE_COMPRESSION => 16

    /**
     * @type {Integer (UInt32)}
     */
    static FS_FILE_ENCRYPTION => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static OFS_MAXPATHNAME => 128

    /**
     * @type {Integer (UInt32)}
     */
    static MAXINTATOM => 49152

    /**
     * @type {Integer (UInt32)}
     */
    static SCS_32BIT_BINARY => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SCS_DOS_BINARY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SCS_WOW_BINARY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SCS_PIF_BINARY => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SCS_POSIX_BINARY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SCS_OS216_BINARY => 5

    /**
     * @type {Integer (UInt32)}
     */
    static SCS_64BIT_BINARY => 6

    /**
     * @type {Integer (UInt32)}
     */
    static SCS_THIS_PLATFORM_BINARY => 6

    /**
     * @type {Integer (UInt32)}
     */
    static FIBER_FLAG_FLOAT_SWITCH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static UMS_VERSION => 256

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_SKIP_COMPLETION_PORT_ON_SUCCESS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_SKIP_SET_EVENT_ON_HANDLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CRITICAL_SECTION_NO_DEBUG_INFO => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static HINSTANCE_ERROR => 32

    /**
     * @type {Integer (UInt32)}
     */
    static FORMAT_MESSAGE_MAX_WIDTH_MASK => 255

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_ENCRYPTABLE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_IS_ENCRYPTED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_SYSTEM_ATTR => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_ROOT_DIR => 3

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_SYSTEM_DIR => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_UNKNOWN => 5

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_SYSTEM_NOT_SUPPORT => 6

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_USER_DISALLOWED => 7

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_READ_ONLY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DIR_DISALLOWED => 9

    /**
     * @type {Integer (UInt32)}
     */
    static EFS_USE_RECOVERY_KEYS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CREATE_FOR_IMPORT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CREATE_FOR_DIR => 2

    /**
     * @type {Integer (UInt32)}
     */
    static OVERWRITE_HIDDEN => 4

    /**
     * @type {Integer (UInt32)}
     */
    static EFSRPC_SECURE_ONLY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static EFS_DROP_ALTERNATE_STREAMS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static BACKUP_INVALID => 0

    /**
     * @type {Integer (UInt32)}
     */
    static BACKUP_GHOSTED_FILE_EXTENTS => 11

    /**
     * @type {Integer (UInt32)}
     */
    static STREAM_NORMAL_ATTRIBUTE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static STREAM_MODIFIED_WHEN_READ => 1

    /**
     * @type {Integer (UInt32)}
     */
    static STREAM_CONTAINS_SECURITY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static STREAM_CONTAINS_PROPERTIES => 4

    /**
     * @type {Integer (UInt32)}
     */
    static STREAM_SPARSE_ATTRIBUTE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static STREAM_CONTAINS_GHOSTED_FILE_EXTENTS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static STARTF_HOLOGRAPHIC => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static SHUTDOWN_NORETRY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PROTECTION_LEVEL_SAME => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static PROC_THREAD_ATTRIBUTE_NUMBER => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static PROC_THREAD_ATTRIBUTE_THREAD => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static PROC_THREAD_ATTRIBUTE_INPUT => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static PROC_THREAD_ATTRIBUTE_ADDITIVE => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY_DEP_ENABLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY_DEP_ATL_THUNK_ENABLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY_SEHOP_ENABLE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_CREATION_CHILD_PROCESS_RESTRICTED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_CREATION_CHILD_PROCESS_OVERRIDE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_CREATION_CHILD_PROCESS_RESTRICTED_UNLESS_SECURE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_CREATION_ALL_APPLICATION_PACKAGES_OPT_OUT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_CREATION_DESKTOP_APP_BREAKAWAY_ENABLE_PROCESS_TREE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_CREATION_DESKTOP_APP_BREAKAWAY_DISABLE_PROCESS_TREE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_CREATION_DESKTOP_APP_BREAKAWAY_OVERRIDE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ATOM_FLAG_GLOBAL => 2

    /**
     * @type {String}
     */
    static GET_SYSTEM_WOW64_DIRECTORY_NAME_A_A => "GetSystemWow64DirectoryA"

    /**
     * @type {String}
     */
    static GET_SYSTEM_WOW64_DIRECTORY_NAME_A_W => "GetSystemWow64DirectoryA"

    /**
     * @type {String}
     */
    static GET_SYSTEM_WOW64_DIRECTORY_NAME_A_T => "GetSystemWow64DirectoryA"

    /**
     * @type {String}
     */
    static GET_SYSTEM_WOW64_DIRECTORY_NAME_W_A => "GetSystemWow64DirectoryW"

    /**
     * @type {String}
     */
    static GET_SYSTEM_WOW64_DIRECTORY_NAME_W_W => "GetSystemWow64DirectoryW"

    /**
     * @type {String}
     */
    static GET_SYSTEM_WOW64_DIRECTORY_NAME_W_T => "GetSystemWow64DirectoryW"

    /**
     * @type {String}
     */
    static GET_SYSTEM_WOW64_DIRECTORY_NAME_T_A => "GetSystemWow64DirectoryW"

    /**
     * @type {String}
     */
    static GET_SYSTEM_WOW64_DIRECTORY_NAME_T_W => "GetSystemWow64DirectoryW"

    /**
     * @type {String}
     */
    static GET_SYSTEM_WOW64_DIRECTORY_NAME_T_T => "GetSystemWow64DirectoryW"

    /**
     * @type {Integer (UInt32)}
     */
    static BASE_SEARCH_PATH_ENABLE_SAFE_SEARCHMODE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static BASE_SEARCH_PATH_DISABLE_SAFE_SEARCHMODE => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static BASE_SEARCH_PATH_PERMANENT => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static EVENTLOG_FULL_INFO => 0

    /**
     * @type {Integer (UInt32)}
     */
    static OPERATION_API_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_COMPUTERNAME_LENGTH => 15

    /**
     * @type {Integer (UInt32)}
     */
    static LOGON32_PROVIDER_WINNT35 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LOGON32_PROVIDER_VIRTUAL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LOGON_ZERO_PASSWORD_BUFFER => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static HW_PROFILE_GUIDLEN => 39

    /**
     * @type {Integer (UInt32)}
     */
    static DOCKINFO_UNDOCKED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOCKINFO_DOCKED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DOCKINFO_USER_SUPPLIED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TC_NORMAL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static TC_HARDERR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TC_GP_TRAP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TC_SIGNAL => 3

    /**
     * @type {Integer (UInt32)}
     */
    static AC_LINE_OFFLINE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static AC_LINE_ONLINE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static AC_LINE_BACKUP_POWER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static AC_LINE_UNKNOWN => 255

    /**
     * @type {Integer (UInt32)}
     */
    static BATTERY_FLAG_HIGH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static BATTERY_FLAG_LOW => 2

    /**
     * @type {Integer (UInt32)}
     */
    static BATTERY_FLAG_CRITICAL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static BATTERY_FLAG_CHARGING => 8

    /**
     * @type {Integer (UInt32)}
     */
    static BATTERY_FLAG_NO_BATTERY => 128

    /**
     * @type {Integer (UInt32)}
     */
    static BATTERY_FLAG_UNKNOWN => 255

    /**
     * @type {Integer (UInt32)}
     */
    static BATTERY_PERCENTAGE_UNKNOWN => 255

    /**
     * @type {Integer (UInt32)}
     */
    static SYSTEM_STATUS_FLAG_POWER_SAVING_ON => 1

    /**
     * @type {Integer (UInt32)}
     */
    static BATTERY_LIFE_UNKNOWN => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static ACTCTX_FLAG_PROCESSOR_ARCHITECTURE_VALID => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ACTCTX_FLAG_LANGID_VALID => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ACTCTX_FLAG_ASSEMBLY_DIRECTORY_VALID => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ACTCTX_FLAG_RESOURCE_NAME_VALID => 8

    /**
     * @type {Integer (UInt32)}
     */
    static ACTCTX_FLAG_SET_PROCESS_DEFAULT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static ACTCTX_FLAG_APPLICATION_NAME_VALID => 32

    /**
     * @type {Integer (UInt32)}
     */
    static ACTCTX_FLAG_SOURCE_IS_ASSEMBLYREF => 64

    /**
     * @type {Integer (UInt32)}
     */
    static ACTCTX_FLAG_HMODULE_VALID => 128

    /**
     * @type {Integer (UInt32)}
     */
    static DEACTIVATE_ACTCTX_FLAG_FORCE_EARLY_DEACTIVATION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FIND_ACTCTX_SECTION_KEY_RETURN_HACTCTX => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FIND_ACTCTX_SECTION_KEY_RETURN_FLAGS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FIND_ACTCTX_SECTION_KEY_RETURN_ASSEMBLY_METADATA => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ACTIVATION_CONTEXT_BASIC_INFORMATION_DEFINED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static QUERY_ACTCTX_FLAG_USE_ACTIVE_ACTCTX => 4

    /**
     * @type {Integer (UInt32)}
     */
    static QUERY_ACTCTX_FLAG_ACTCTX_IS_HMODULE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static QUERY_ACTCTX_FLAG_ACTCTX_IS_ADDRESS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static QUERY_ACTCTX_FLAG_NO_ADDREF => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static RESTART_MAX_CMD_LINE => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static RECOVERY_DEFAULT_PING_INTERVAL => 5000

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_RENAME_FLAG_REPLACE_IF_EXISTS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_RENAME_FLAG_POSIX_SEMANTICS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_RENAME_FLAG_SUPPRESS_PIN_STATE_INHERITANCE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_INFO_FLAGS_ALIGNED_DEVICE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_INFO_FLAGS_PARTITION_ALIGNED_ON_DEVICE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_INFO_OFFSET_UNKNOWN => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static REMOTE_PROTOCOL_INFO_FLAG_LOOPBACK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static REMOTE_PROTOCOL_INFO_FLAG_OFFLINE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static REMOTE_PROTOCOL_INFO_FLAG_PERSISTENT_HANDLE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RPI_FLAG_SMB2_SHARECAP_TIMEWARP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RPI_FLAG_SMB2_SHARECAP_DFS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static RPI_FLAG_SMB2_SHARECAP_CONTINUOUS_AVAILABILITY => 16

    /**
     * @type {Integer (UInt32)}
     */
    static RPI_FLAG_SMB2_SHARECAP_SCALEOUT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static RPI_FLAG_SMB2_SHARECAP_CLUSTER => 64

    /**
     * @type {Integer (UInt32)}
     */
    static RPI_SMB2_SHAREFLAG_ENCRYPT_DATA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RPI_SMB2_SHAREFLAG_COMPRESS_DATA => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RPI_SMB2_FLAG_SERVERCAP_DFS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RPI_SMB2_FLAG_SERVERCAP_LEASING => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RPI_SMB2_FLAG_SERVERCAP_LARGEMTU => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RPI_SMB2_FLAG_SERVERCAP_MULTICHANNEL => 8

    /**
     * @type {Integer (UInt32)}
     */
    static RPI_SMB2_FLAG_SERVERCAP_PERSISTENT_HANDLES => 16

    /**
     * @type {Integer (UInt32)}
     */
    static RPI_SMB2_FLAG_SERVERCAP_DIRECTORY_LEASING => 32

    /**
     * @type {Integer (UInt32)}
     */
    static MICROSOFT_WINDOWS_WINBASE_H_DEFINE_INTERLOCKED_CPLUSPLUS_OVERLOADS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MICROSOFT_WINBASE_H_DEFINE_INTERLOCKED_CPLUSPLUS_OVERLOADS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CODEINTEGRITY_OPTION_ENABLED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CODEINTEGRITY_OPTION_TESTSIGN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CODEINTEGRITY_OPTION_UMCI_ENABLED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CODEINTEGRITY_OPTION_UMCI_AUDITMODE_ENABLED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CODEINTEGRITY_OPTION_UMCI_EXCLUSIONPATHS_ENABLED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static CODEINTEGRITY_OPTION_TEST_BUILD => 32

    /**
     * @type {Integer (UInt32)}
     */
    static CODEINTEGRITY_OPTION_PREPRODUCTION_BUILD => 64

    /**
     * @type {Integer (UInt32)}
     */
    static CODEINTEGRITY_OPTION_DEBUGMODE_ENABLED => 128

    /**
     * @type {Integer (UInt32)}
     */
    static CODEINTEGRITY_OPTION_FLIGHT_BUILD => 256

    /**
     * @type {Integer (UInt32)}
     */
    static CODEINTEGRITY_OPTION_FLIGHTING_ENABLED => 512

    /**
     * @type {Integer (UInt32)}
     */
    static CODEINTEGRITY_OPTION_HVCI_KMCI_ENABLED => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static CODEINTEGRITY_OPTION_HVCI_KMCI_AUDITMODE_ENABLED => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static CODEINTEGRITY_OPTION_HVCI_KMCI_STRICTMODE_ENABLED => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static CODEINTEGRITY_OPTION_HVCI_IUM_ENABLED => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_MAXIMUM_DISPOSITION => 5

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_OPEN_REMOTE_INSTANCE => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_NO_COMPRESSION => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_OPEN_NO_RECALL => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_VALID_OPTION_FLAGS => 16777215

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_VALID_PIPE_OPTION_FLAGS => 50

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_VALID_MAILSLOT_OPTION_FLAGS => 50

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_VALID_SET_FLAGS => 54

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_SUPERSEDED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_OPENED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_CREATED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_OVERWRITTEN => 3

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_EXISTS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DOES_NOT_EXIST => 5

    /**
     * @type {Integer (UInt32)}
     */
    static WINWATCHNOTIFY_START => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WINWATCHNOTIFY_STOP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WINWATCHNOTIFY_DESTROY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WINWATCHNOTIFY_CHANGING => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WINWATCHNOTIFY_CHANGED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RSC_FLAG_INF => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RSC_FLAG_SKIPDISKSPACECHECK => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RSC_FLAG_QUIET => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RSC_FLAG_NGCONV => 8

    /**
     * @type {Integer (UInt32)}
     */
    static RSC_FLAG_UPDHLPDLLS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static RSC_FLAG_DELAYREGISTEROCX => 512

    /**
     * @type {Integer (UInt32)}
     */
    static RSC_FLAG_SETUPAPI => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static ALINF_QUIET => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ALINF_NGCONV => 8

    /**
     * @type {Integer (UInt32)}
     */
    static ALINF_UPDHLPDLLS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static ALINF_BKINSTALL => 32

    /**
     * @type {Integer (UInt32)}
     */
    static ALINF_ROLLBACK => 64

    /**
     * @type {Integer (UInt32)}
     */
    static ALINF_CHECKBKDATA => 128

    /**
     * @type {Integer (UInt32)}
     */
    static ALINF_ROLLBKDOALL => 256

    /**
     * @type {Integer (UInt32)}
     */
    static ALINF_DELAYREGISTEROCX => 512

    /**
     * @type {Integer (UInt32)}
     */
    static AIF_WARNIFSKIP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static AIF_NOSKIP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static AIF_NOVERSIONCHECK => 4

    /**
     * @type {Integer (UInt32)}
     */
    static AIF_FORCE_FILE_IN_USE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static AIF_NOOVERWRITE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static AIF_NO_VERSION_DIALOG => 32

    /**
     * @type {Integer (UInt32)}
     */
    static AIF_REPLACEONLY => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static AIF_NOLANGUAGECHECK => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static AIF_QUIET => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static IE4_RESTORE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IE4_BACKNEW => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IE4_NODELETENEW => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IE4_NOMESSAGES => 8

    /**
     * @type {Integer (UInt32)}
     */
    static IE4_NOPROGRESS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static IE4_NOENUMKEY => 32

    /**
     * @type {Integer (UInt32)}
     */
    static IE4_NO_CRC_MAPPING => 64

    /**
     * @type {Integer (UInt32)}
     */
    static IE4_REGSECTION => 128

    /**
     * @type {Integer (UInt32)}
     */
    static IE4_FRDOALL => 256

    /**
     * @type {Integer (UInt32)}
     */
    static IE4_UPDREFCNT => 512

    /**
     * @type {Integer (UInt32)}
     */
    static IE4_USEREFCNT => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static IE4_EXTRAINCREFCNT => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static IE4_REMOVREGBKDATA => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static ARSR_RESTORE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ARSR_NOMESSAGES => 8

    /**
     * @type {Integer (UInt32)}
     */
    static ARSR_REGSECTION => 128

    /**
     * @type {Integer (UInt32)}
     */
    static ARSR_REMOVREGBKDATA => 4096

    /**
     * @type {String}
     */
    static REG_SAVE_LOG_KEY => "RegSaveLogFile"

    /**
     * @type {String}
     */
    static REG_RESTORE_LOG_KEY => "RegRestoreLogFile"

    /**
     * @type {Integer (UInt32)}
     */
    static AFSR_RESTORE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static AFSR_BACKNEW => 2

    /**
     * @type {Integer (UInt32)}
     */
    static AFSR_NODELETENEW => 4

    /**
     * @type {Integer (UInt32)}
     */
    static AFSR_NOMESSAGES => 8

    /**
     * @type {Integer (UInt32)}
     */
    static AFSR_NOPROGRESS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static AFSR_UPDREFCNT => 512

    /**
     * @type {Integer (UInt32)}
     */
    static AFSR_USEREFCNT => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static AFSR_EXTRAINCREFCNT => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static AADBE_ADD_ENTRY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static AADBE_DEL_ENTRY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ADN_DEL_IF_EMPTY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ADN_DONT_DEL_SUBDIRS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ADN_DONT_DEL_DIR => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ADN_DEL_UNC_PATHS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static LIS_QUIET => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LIS_NOGRPCONV => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RUNCMDS_QUIET => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RUNCMDS_NOWAIT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RUNCMDS_DELAYPOSTCMD => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IME_MAXPROCESS => 32

    /**
     * @type {Integer (UInt32)}
     */
    static CP_HWND => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CP_OPEN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CP_DIRECT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CP_LEVEL => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MCW_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MCW_RECT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MCW_WINDOW => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MCW_SCREEN => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MCW_VERTICAL => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MCW_HIDDEN => 16

    /**
     * @type {Integer (UInt32)}
     */
    static IME_MODE_ALPHANUMERIC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IME_MODE_SBCSCHAR => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IME_MODE_KATAKANA => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IME_MODE_HIRAGANA => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IME_MODE_HANJACONVERT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IME_MODE_DBCSCHAR => 16

    /**
     * @type {Integer (UInt32)}
     */
    static IME_MODE_ROMAN => 32

    /**
     * @type {Integer (UInt32)}
     */
    static IME_MODE_NOROMAN => 64

    /**
     * @type {Integer (UInt32)}
     */
    static IME_MODE_CODEINPUT => 128

    /**
     * @type {Integer (UInt32)}
     */
    static IME_MODE_NOCODEINPUT => 256

    /**
     * @type {Integer (UInt32)}
     */
    static IME_GETIMECAPS => 3

    /**
     * @type {Integer (UInt32)}
     */
    static IME_SETOPEN => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IME_GETOPEN => 5

    /**
     * @type {Integer (UInt32)}
     */
    static IME_GETVERSION => 7

    /**
     * @type {Integer (UInt32)}
     */
    static IME_SETCONVERSIONWINDOW => 8

    /**
     * @type {Integer (UInt32)}
     */
    static IME_MOVEIMEWINDOW => 8

    /**
     * @type {Integer (UInt32)}
     */
    static IME_SETCONVERSIONMODE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static IME_GETCONVERSIONMODE => 17

    /**
     * @type {Integer (UInt32)}
     */
    static IME_SET_MODE => 18

    /**
     * @type {Integer (UInt32)}
     */
    static IME_SENDVKEY => 19

    /**
     * @type {Integer (UInt32)}
     */
    static IME_ENTERWORDREGISTERMODE => 24

    /**
     * @type {Integer (UInt32)}
     */
    static IME_SETCONVERSIONFONTEX => 25

    /**
     * @type {Integer (UInt32)}
     */
    static IME_BANJAtoJUNJA => 19

    /**
     * @type {Integer (UInt32)}
     */
    static IME_JUNJAtoBANJA => 20

    /**
     * @type {Integer (UInt32)}
     */
    static IME_JOHABtoKS => 21

    /**
     * @type {Integer (UInt32)}
     */
    static IME_KStoJOHAB => 22

    /**
     * @type {Integer (UInt32)}
     */
    static IMEA_INIT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IMEA_NEXT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IMEA_PREV => 3

    /**
     * @type {Integer (UInt32)}
     */
    static IME_REQUEST_CONVERT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IME_ENABLE_CONVERT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static INTERIM_WINDOW => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MODE_WINDOW => 1

    /**
     * @type {Integer (UInt32)}
     */
    static HANJA_WINDOW => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IME_RS_ERROR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IME_RS_NOIME => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IME_RS_TOOLONG => 5

    /**
     * @type {Integer (UInt32)}
     */
    static IME_RS_ILLEGAL => 6

    /**
     * @type {Integer (UInt32)}
     */
    static IME_RS_NOTFOUND => 7

    /**
     * @type {Integer (UInt32)}
     */
    static IME_RS_NOROOM => 10

    /**
     * @type {Integer (UInt32)}
     */
    static IME_RS_DISKERROR => 14

    /**
     * @type {Integer (UInt32)}
     */
    static IME_RS_INVALID => 17

    /**
     * @type {Integer (UInt32)}
     */
    static IME_RS_NEST => 18

    /**
     * @type {Integer (UInt32)}
     */
    static IME_RS_SYSTEMMODAL => 19

    /**
     * @type {Integer (UInt32)}
     */
    static WM_IME_REPORT => 640

    /**
     * @type {Integer (UInt32)}
     */
    static IR_STRINGSTART => 256

    /**
     * @type {Integer (UInt32)}
     */
    static IR_STRINGEND => 257

    /**
     * @type {Integer (UInt32)}
     */
    static IR_OPENCONVERT => 288

    /**
     * @type {Integer (UInt32)}
     */
    static IR_CHANGECONVERT => 289

    /**
     * @type {Integer (UInt32)}
     */
    static IR_CLOSECONVERT => 290

    /**
     * @type {Integer (UInt32)}
     */
    static IR_FULLCONVERT => 291

    /**
     * @type {Integer (UInt32)}
     */
    static IR_IMESELECT => 304

    /**
     * @type {Integer (UInt32)}
     */
    static IR_STRING => 320

    /**
     * @type {Integer (UInt32)}
     */
    static IR_DBCSCHAR => 352

    /**
     * @type {Integer (UInt32)}
     */
    static IR_UNDETERMINE => 368

    /**
     * @type {Integer (UInt32)}
     */
    static IR_STRINGEX => 384

    /**
     * @type {Integer (UInt32)}
     */
    static IR_MODEINFO => 400

    /**
     * @type {Integer (UInt32)}
     */
    static WM_WNT_CONVERTREQUESTEX => 265

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CONVERTREQUEST => 266

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CONVERTRESULT => 267

    /**
     * @type {Integer (UInt32)}
     */
    static WM_INTERIM => 268

    /**
     * @type {Integer (UInt32)}
     */
    static WM_IMEKEYDOWN => 656

    /**
     * @type {Integer (UInt32)}
     */
    static WM_IMEKEYUP => 657

    /**
     * @type {Integer (UInt32)}
     */
    static DELAYLOAD_GPA_FAILURE => 4

    /**
     * @type {String}
     */
    static CATID_DeleteBrowsingHistory => "{31caf6e4-d6aa-4090-a050-a5ac8972e9ef}"

    /**
     * @type {Integer (UInt32)}
     */
    static DELETE_BROWSING_HISTORY_HISTORY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DELETE_BROWSING_HISTORY_COOKIES => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DELETE_BROWSING_HISTORY_TIF => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DELETE_BROWSING_HISTORY_FORMDATA => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DELETE_BROWSING_HISTORY_PASSWORDS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DELETE_BROWSING_HISTORY_PRESERVEFAVORITES => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DELETE_BROWSING_HISTORY_DOWNLOADHISTORY => 64

    /**
     * @type {String}
     */
    static WLDP_HOST_CMD => "{5baea1d6-6f1c-488e-8490-347fa5c5067f}"

    /**
     * @type {String}
     */
    static WLDP_HOST_POWERSHELL => "{8e9aaa7c-198b-4879-ae41-a50d47ad6458}"

    /**
     * @type {String}
     */
    static WLDP_HOST_PYTHON => "{bfd557ef-2448-42ec-810b-0d9f09352d4a}"

    /**
     * @type {String}
     */
    static WLDP_HOST_WINDOWS_SCRIPT_HOST => "{d30b84c5-29ce-4ff3-86ec-a30007a82e49}"

    /**
     * @type {String}
     */
    static WLDP_HOST_JAVASCRIPT => "{5629f0d5-1cca-4fed-a1a3-36a8c18d74c0}"

    /**
     * @type {String}
     */
    static WLDP_HOST_HTML => "{b35a71b6-fe56-48d6-9543-2dff0ecded66}"

    /**
     * @type {String}
     */
    static WLDP_HOST_XML => "{5594be58-c6bf-4295-82f4-d494d20e3a36}"

    /**
     * @type {String}
     */
    static WLDP_HOST_MSI => "{624eb611-6e7e-4eec-9bfe-f0ecdbfcf390}"

    /**
     * @type {String}
     */
    static WLDP_HOST_OTHER => "{626cbec3-e1fa-4227-9800-ed210274cf7c}"
;@endregion Constants

;@region Methods
    /**
     * 
     * @param {Pointer<UInt16>} String1 
     * @param {Pointer<UInt16>} String2 
     * @returns {String} Nothing - always returns an empty string
     */
    static uaw_lstrcmpW(String1, String2) {
        DllCall("KERNEL32.dll\uaw_lstrcmpW", "ptr", String1, "ptr", String2)
    }

    /**
     * 
     * @param {Pointer<UInt16>} String1 
     * @param {Pointer<UInt16>} String2 
     * @returns {String} Nothing - always returns an empty string
     */
    static uaw_lstrcmpiW(String1, String2) {
        DllCall("KERNEL32.dll\uaw_lstrcmpiW", "ptr", String1, "ptr", String2)
    }

    /**
     * 
     * @param {Pointer<UInt16>} String 
     * @returns {String} Nothing - always returns an empty string
     */
    static uaw_lstrlenW(String) {
        DllCall("KERNEL32.dll\uaw_lstrlenW", "ptr", String)
    }

    /**
     * 
     * @param {Pointer<UInt16>} String 
     * @param {Integer} Character 
     * @returns {Pointer<UInt16>} 
     */
    static uaw_wcschr(String, Character) {
        result := DllCall("KERNEL32.dll\uaw_wcschr", "ptr", String, "char", Character, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt16>} Destination 
     * @param {Pointer<UInt16>} Source 
     * @returns {Pointer<UInt16>} 
     */
    static uaw_wcscpy(Destination, Source) {
        result := DllCall("KERNEL32.dll\uaw_wcscpy", "ptr", Destination, "ptr", Source, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt16>} String1 
     * @param {Pointer<UInt16>} String2 
     * @returns {String} Nothing - always returns an empty string
     */
    static uaw_wcsicmp(String1, String2) {
        DllCall("KERNEL32.dll\uaw_wcsicmp", "ptr", String1, "ptr", String2)
    }

    /**
     * Retrieves the number of characters in a null-terminated Unicode string.
     * @remarks
     * This function is available only on 64-bit Windows.
     * @param {Pointer<UInt16>} String A pointer to a null-terminated Unicode string.
     * @returns {Pointer} The return value is the number of characters in <i>String</i>, not including the terminating null character.
     * @see https://learn.microsoft.com/windows/win32/api/stralign/nf-stralign-uaw_wcslen
     */
    static uaw_wcslen(String) {
        result := DllCall("KERNEL32.dll\uaw_wcslen", "ptr", String, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt16>} String 
     * @param {Integer} Character 
     * @returns {Pointer<UInt16>} 
     */
    static uaw_wcsrchr(String, Character) {
        result := DllCall("KERNEL32.dll\uaw_wcsrchr", "ptr", String, "char", Character, "ptr")
        return result
    }

    /**
     * 
     * @returns {Pointer} 
     */
    static RtlGetReturnAddressHijackTarget() {
        result := DllCall("ntdll.dll\RtlGetReturnAddressHijackTarget", "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<CUSTOM_SYSTEM_EVENT_TRIGGER_CONFIG>} TriggerConfig 
     * @returns {Integer} 
     */
    static RtlRaiseCustomSystemEventTrigger(TriggerConfig) {
        result := DllCall("ntdll.dll\RtlRaiseCustomSystemEventTrigger", "ptr", TriggerConfig, "uint")
        return result
    }

    /**
     * The IsApiSetImplemented function tests if a specified API set is present on the computer.
     * @remarks
     * All versions of Windows 10 share a common base of OS components that is called the *core OS* (in some contexts this is also called *OneCore*). In core OS components, Win32 APIs are organized into functional groups called [API sets](/windows/win32/apiindex/windows-apisets).
     * 
     * Some API sets are not available on all Windows 10 platforms. For example, although the full breadth of the Win32 API is supported on PCs, only a subset of the Win32 API is available on other devices such as HoloLens, Xbox, and other devices running Windows 10x.
     * 
     * When writing code that targets both desktop and non-desktop Windows 10 devices, wrap the API call in **IsApiSetImplemented**. This function tests at runtime if the API set that the API belongs to is present on the target platform. For more details see [Detect API set availability](/windows/win32/apiindex/detect-api-set-availability).
     * 
     * To identify whether a given Win32 API belongs to an API set, review the requirements table in the reference documentation for the API. If the API belongs to an API set, the requirements table in the article lists the API set name.
     * @param {Pointer<PSTR>} Contract Specifies the name of the API set to query. For more info, see the Remarks section.
     * @returns {Integer} **IsApiSetImplemented** returns **TRUE** if the specified API set is present. In this case, APIs in the target API set have valid implementations on the current platform.
     * 
     * Otherwise, this function returns **FALSE**.
     * @see https://learn.microsoft.com/windows/win32/api/apiquery2/nf-apiquery2-isapisetimplemented
     */
    static IsApiSetImplemented(Contract) {
        result := DllCall("api-ms-win-core-apiquery-l2-1-0.dll\IsApiSetImplemented", "ptr", Contract, "int")
        return result
    }

    /**
     * Retrieves the cycle time for the specified thread.
     * @remarks
     * To enumerate the threads of the process, use the <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/nf-tlhelp32-thread32first">Thread32First</a> and <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/nf-tlhelp32-thread32next">Thread32Next</a> functions. To get the thread handle for a thread identifier, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-openthread">OpenThread</a> function.
     * 
     * Do not attempt to convert the CPU clock cycles returned by <b>QueryThreadCycleTime</b> to elapsed time. This function uses timer services provided by the CPU, which can vary in implementation. For example, some CPUs will vary the frequency of the timer when changing the frequency at which the CPU runs and others will leave it at a fixed rate. The behavior of each CPU is described in the documentation provided by the CPU vendor.
     * 
     * To compile an application that uses this function, define _WIN32_WINNT as 0x0600 or later.
     * @param {Pointer<HANDLE>} ThreadHandle A handle to the thread. The handle must have the PROCESS_QUERY_INFORMATION or PROCESS_QUERY_LIMITED_INFORMATION access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * @param {Pointer<UInt64>} CycleTime The number of CPU clock cycles used by the thread. This value includes cycles spent in both user mode and kernel mode.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/realtimeapiset/nf-realtimeapiset-querythreadcycletime
     * @since windows6.0.6000
     */
    static QueryThreadCycleTime(ThreadHandle, CycleTime) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\QueryThreadCycleTime", "ptr", ThreadHandle, "ptr", CycleTime, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the sum of the cycle time of all threads of the specified process.
     * @remarks
     * To enumerate the processes in the system, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/psapi/nf-psapi-enumprocesses">EnumProcesses</a> function.
     * 
     * To compile an application that uses this function, define _WIN32_WINNT as 0x0600 or later.
     * @param {Pointer<HANDLE>} ProcessHandle A handle to the process. The handle must have the PROCESS_QUERY_INFORMATION or PROCESS_QUERY_LIMITED_INFORMATION access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * @param {Pointer<UInt64>} CycleTime The number of CPU clock cycles used by the threads of the process. This value includes cycles spent in both user mode and kernel mode.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/realtimeapiset/nf-realtimeapiset-queryprocesscycletime
     * @since windows6.0.6000
     */
    static QueryProcessCycleTime(ProcessHandle, CycleTime) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\QueryProcessCycleTime", "ptr", ProcessHandle, "ptr", CycleTime, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the cycle time for the idle thread of each processor in the system.
     * @remarks
     * To compile an application that uses this function, define _WIN32_WINNT as 0x0600 or later.
     * @param {Pointer<UInt32>} BufferLength On input, specifies the size of the <i>ProcessorIdleCycleTime</i> buffer, in bytes. This buffer is expected to be 8 times the number of processors in the group.
     * 
     * On output, specifies the number of elements written to the buffer. If the buffer size is not sufficient, the function fails and this parameter receives the required length of the buffer.
     * @param {Pointer<UInt64>} ProcessorIdleCycleTime The number of CPU clock cycles used by each idle thread. This buffer must be 8  times the number of processors in the system in size.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/realtimeapiset/nf-realtimeapiset-queryidleprocessorcycletime
     * @since windows6.0.6000
     */
    static QueryIdleProcessorCycleTime(BufferLength, ProcessorIdleCycleTime) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\QueryIdleProcessorCycleTime", "ptr", BufferLength, "ptr", ProcessorIdleCycleTime, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the accumulated cycle time for the idle thread on each logical processor in the specified processor group.
     * @remarks
     * To compile an application that uses this function, set _WIN32_WINNT &gt;= 0x0601. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WinProg/using-the-windows-headers">Using the Windows Headers</a>.
     * @param {Integer} Group The number of the processor group for which to retrieve the cycle time.
     * @param {Pointer<UInt32>} BufferLength On input, specifies the size of the <i>ProcessorIdleCycleTime</i> buffer, in bytes. This buffer is expected to be 8 times the number of processors in the group. 
     * 
     * On output, specifies the number of elements written to the buffer. If the buffer size is not sufficient, the function fails and this parameter receives the required length of the buffer.
     * @param {Pointer<UInt64>} ProcessorIdleCycleTime The number of CPU clock cycles used by each idle thread. If this parameter is NULL, the function updates the <i>BufferLength</i> parameter with the required length.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, use <a href="https://docs.microsoft.com/windows/desktop/api/adshlp/nf-adshlp-adsgetlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/realtimeapiset/nf-realtimeapiset-queryidleprocessorcycletimeex
     * @since windows6.1
     */
    static QueryIdleProcessorCycleTimeEx(Group, BufferLength, ProcessorIdleCycleTime) {
        result := DllCall("KERNEL32.dll\QueryIdleProcessorCycleTimeEx", "ushort", Group, "ptr", BufferLength, "ptr", ProcessorIdleCycleTime, "int")
        return result
    }

    /**
     * Gets the current interrupt-time count, in a more precise form than QueryInterruptTime does.
     * @remarks
     * <b>QueryInterruptTimePrecise</b> is similar to the <a href="https://docs.microsoft.com/windows/desktop/api/realtimeapiset/nf-realtimeapiset-queryinterrupttime">QueryInterruptTime</a> routine, but is more precise. The interrupt time reported by <b>QueryInterruptTime</b> is based on the latest tick of the system clock timer. The system clock timer is the hardware timer that periodically generates interrupts for the system clock. The uniform period between system clock timer interrupts is referred to as a system clock tick, and is typically in the range of 0.5 milliseconds to 15.625 milliseconds, depending on the hardware platform. The interrupt time value retrieved by <b>QueryInterruptTime</b> is accurate within a system clock tick.
     * 
     * To provide a system time value that is more precise than that of <a href="https://docs.microsoft.com/windows/desktop/api/realtimeapiset/nf-realtimeapiset-queryinterrupttime">QueryInterruptTime</a>, <b>QueryInterruptTimePrecise</b> reads the timer hardware directly,  therefore a <b>QueryInterruptTimePrecise</b> call can be slower than a <b>QueryInterruptTime</b> call.
     * 
     * Call the <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/wdm/nf-wdm-kequerytimeincrement">KeQueryTimeIncrement</a> routine to determine the duration of a system clock tick.
     * 
     * Also see Remarks in <a href="https://docs.microsoft.com/windows/desktop/api/realtimeapiset/nf-realtimeapiset-queryinterrupttime">QueryInterruptTime</a>.
     * 
     * <div class="alert"><b>Note</b>  The <b>QueryInterruptTimePrecise</b> function produces different results on debug ("checked") builds of Windows, because the interrupt-time count and tick count are advanced by approximately 49 days. This helps to identify bugs that might not occur until the system has been running for a long time. The checked build is available to MSDN subscribers through the <a href="https://msdn.microsoft.com/default.aspx">Microsoft Developer Network (MSDN)</a> Web site.</div>
     * <div> </div>
     * To compile an application that uses this function, define _WIN32_WINNT as 0x0601 or later. For more information, see
     * 				<a href="https://docs.microsoft.com/windows/desktop/WinProg/using-the-windows-headers">Using the Windows Headers</a>.
     * @param {Pointer<UInt64>} lpInterruptTimePrecise A pointer to a ULONGLONG in which to receive the interrupt-time count in system time units of 100 nanoseconds. Divide by ten million, or 1e7, to get seconds (there are 1e9 nanoseconds in a second, so there are 1e7 100-nanoseconds in a second).
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/realtimeapiset/nf-realtimeapiset-queryinterrupttimeprecise
     * @since windows10.0.10240
     */
    static QueryInterruptTimePrecise(lpInterruptTimePrecise) {
        DllCall("api-ms-win-core-realtime-l1-1-1.dll\QueryInterruptTimePrecise", "ptr", lpInterruptTimePrecise)
    }

    /**
     * Gets the current unbiased interrupt-time count, in a more precise form than QueryUnbiasedInterruptTime does. The unbiased interrupt-time count does not include time the system spends in sleep or hibernation.
     * @remarks
     * <b>QueryUnbiasedInterruptTimePrecise</b> is similar to the <a href="https://docs.microsoft.com/windows/desktop/api/realtimeapiset/nf-realtimeapiset-queryunbiasedinterrupttime">QueryUnbiasedInterruptTime</a> routine, but is more precise. The interrupt time reported by <b>QueryUnbiasedInterruptTime</b> is based on the latest tick of the system clock timer. The system clock timer is the hardware timer that periodically generates interrupts for the system clock. The uniform period between system clock timer interrupts is referred to as a system clock tick, and is typically in the range of 0.5 milliseconds to 15.625 milliseconds, depending on the hardware platform. The interrupt time value retrieved by <b>QueryUnbiasedInterruptTime</b> is accurate within a system clock tick.
     * 
     * To provide a system time value that is more precise than that of <a href="https://docs.microsoft.com/windows/desktop/api/realtimeapiset/nf-realtimeapiset-queryunbiasedinterrupttime">QueryUnbiasedInterruptTime</a>, <b>QueryUnbiasedInterruptTimePrecise</b> reads the timer hardware directly,  therefore a <b>QueryUnbiasedInterruptTimePrecise</b> call can be slower than a <b>QueryUnbiasedInterruptTime</b> call.
     * 
     * Call the <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/wdm/nf-wdm-kequerytimeincrement">KeQueryTimeIncrement</a> routine to determine the duration of a system clock tick.
     * 
     * Also see Remarks in <a href="https://docs.microsoft.com/windows/desktop/api/realtimeapiset/nf-realtimeapiset-queryunbiasedinterrupttime">QueryUnbiasedInterruptTime</a>.
     * 
     * <div class="alert"><b>Note</b>  The <b>QueryUnbiasedInterruptTimePrecise</b> function produces different results on debug ("checked") builds of Windows, because the interrupt-time count and tick count are advanced by approximately 49 days. This helps to identify bugs that might not occur until the system has been running for a long time. The checked build is available to MSDN subscribers through the <a href="https://msdn.microsoft.com/default.aspx">Microsoft Developer Network (MSDN)</a> Web site.</div>
     * <div> </div>
     * To compile an application that uses this function, define _WIN32_WINNT as 0x0601 or later. For more information, see
     * 				<a href="https://docs.microsoft.com/windows/desktop/WinProg/using-the-windows-headers">Using the Windows Headers</a>.
     * @param {Pointer<UInt64>} lpUnbiasedInterruptTimePrecise A pointer to a ULONGLONG in which to receive the unbiased interrupt-time count in system time units of 100 nanoseconds. Divide by ten million, or 1e7, to get seconds (there are 1e9 nanoseconds in a second, so there are 1e7 100-nanoseconds in a second).
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/realtimeapiset/nf-realtimeapiset-queryunbiasedinterrupttimeprecise
     * @since windows10.0.10240
     */
    static QueryUnbiasedInterruptTimePrecise(lpUnbiasedInterruptTimePrecise) {
        DllCall("api-ms-win-core-realtime-l1-1-1.dll\QueryUnbiasedInterruptTimePrecise", "ptr", lpUnbiasedInterruptTimePrecise)
    }

    /**
     * Gets the current interrupt-time count.
     * @remarks
     * The interrupt-time count begins at zero when the system starts and is incremented at each clock interrupt by the length of a clock tick. The exact length of a clock tick depends on underlying hardware and can vary between systems.
     * 
     * Unlike system time, the interrupt-time count is not subject to adjustments by users or the Windows time service. Applications can use the interrupt-time count to measure finer durations than are possible with system time. Applications that require greater precision than the interrupt-time count should use a <a href="https://docs.microsoft.com/windows/desktop/winmsg/about-timers">high-resolution timer</a>. Use the <a href="https://docs.microsoft.com/windows/desktop/api/profileapi/nf-profileapi-queryperformancefrequency">QueryPerformanceFrequency</a> function to retrieve the frequency of the high-resolution timer and the <a href="https://docs.microsoft.com/windows/desktop/api/profileapi/nf-profileapi-queryperformancecounter">QueryPerformanceCounter</a> function to retrieve the counter's value.
     * 
     * The  timer resolution set by the <a href="https://docs.microsoft.com/windows/desktop/api/timeapi/nf-timeapi-timebeginperiod">timeBeginPeriod</a> and <a href="https://docs.microsoft.com/windows/desktop/api/timeapi/nf-timeapi-timeendperiod">timeEndPeriod</a> functions affects the resolution of  the <b>QueryInterruptTime</b> function. However, increasing the timer resolution is not recommended because it can reduce overall system performance and   increase system power consumption by preventing the processor from entering power-saving states. Instead, applications should use a high-resolution timer.
     * 
     * <div class="alert"><b>Note</b>  The <b>QueryInterruptTime</b> function produces different results on debug ("checked") builds of Windows, because the interrupt-time count and tick count are advanced by approximately 49 days. This helps to identify bugs that might not occur until the system has been running for a long time. The checked build is available to MSDN subscribers through the <a href="https://msdn.microsoft.com/default.aspx">Microsoft Developer Network (MSDN)</a> Web site.</div>
     * <div> </div>
     * To compile an application that uses this function, define _WIN32_WINNT as 0x0601 or later. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WinProg/using-the-windows-headers">Using the Windows Headers</a>.
     * @param {Pointer<UInt64>} lpInterruptTime A pointer to a ULONGLONG in which to receive the interrupt-time count in system time units of 100 nanoseconds. Divide by ten million, or 1e7, to get seconds (there are 1e9 nanoseconds in a second, so there are 1e7 100-nanoseconds in a second).
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/realtimeapiset/nf-realtimeapiset-queryinterrupttime
     * @since windows10.0.10240
     */
    static QueryInterruptTime(lpInterruptTime) {
        DllCall("api-ms-win-core-realtime-l1-1-1.dll\QueryInterruptTime", "ptr", lpInterruptTime)
    }

    /**
     * Gets the current unbiased interrupt-time count, in units of 100 nanoseconds. The unbiased interrupt-time count does not include time the system spends in sleep or hibernation.
     * @remarks
     * The interrupt-time count begins at zero when the system starts and is incremented at each clock interrupt by the length of a clock tick. The exact length of a clock tick depends on underlying hardware and can vary between systems.
     * 
     * The interrupt-time count retrieved by the <b>QueryUnbiasedInterruptTime</b> function reflects only the time that the system is in the working state. Therefore, the interrupt-time count is not "biased" by time the system spends in sleep or hibernation. The system uses biased interrupt time for some operations, such as ensuring that relative timers that would have expired during sleep expire immediately upon waking.
     * 
     * Unlike system time, the interrupt-time count is not subject to adjustments by users or the Windows time service. Applications can use the interrupt-time count to measure finer durations than are possible with system time. Applications that require greater precision than the interrupt-time count should use a <a href="https://docs.microsoft.com/windows/desktop/winmsg/about-timers">high-resolution timer</a>. Use the <a href="https://docs.microsoft.com/windows/desktop/api/profileapi/nf-profileapi-queryperformancefrequency">QueryPerformanceFrequency</a> function to retrieve the frequency of the high-resolution timer and the <a href="https://docs.microsoft.com/windows/desktop/api/profileapi/nf-profileapi-queryperformancecounter">QueryPerformanceCounter</a> function to retrieve the counter's value.
     * 
     * The  timer resolution set by the <a href="https://docs.microsoft.com/windows/desktop/api/timeapi/nf-timeapi-timebeginperiod">timeBeginPeriod</a> and <a href="https://docs.microsoft.com/windows/desktop/api/timeapi/nf-timeapi-timeendperiod">timeEndPeriod</a> functions affects the resolution of  the <b>QueryUnbiasedInterruptTime</b> function. However, increasing the timer resolution is not recommended because it can reduce overall system performance and   increase system power consumption by preventing the processor from entering power-saving states. Instead, applications should use a high-resolution timer.
     * 
     * <div class="alert"><b>Note</b>  The <b>QueryUnbiasedInterruptTime</b> function produces different results on debug ("checked") builds of Windows, because the interrupt-time count and tick count are advanced by approximately 49 days. This helps to identify bugs that might not occur until the system has been running for a long time. The checked build is available to MSDN subscribers through the <a href="https://msdn.microsoft.com/default.aspx">Microsoft Developer Network (MSDN)</a> Web site.</div>
     * <div> </div>
     * To compile an application that uses this function, define _WIN32_WINNT as 0x0601 or later. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WinProg/using-the-windows-headers">Using the Windows Headers</a>.
     * @param {Pointer<UInt64>} UnbiasedTime TBD
     * @returns {Integer} If the function succeeds, the return value is nonzero. If the function fails because it is called with a null parameter, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/api/realtimeapiset/nf-realtimeapiset-queryunbiasedinterrupttime
     * @since windows6.1
     */
    static QueryUnbiasedInterruptTime(UnbiasedTime) {
        result := DllCall("KERNEL32.dll\QueryUnbiasedInterruptTime", "ptr", UnbiasedTime, "int")
        return result
    }

    /**
     * Queries the auxiliary counter frequency.
     * @remarks
     * You can determine the availability of the auxiliary counter by comparing the returned value against <b>E_NOTIMPL</b>.
     * @param {Pointer<UInt64>} lpAuxiliaryCounterFrequency Long pointer to an output buffer that contains the specified auxiliary counter frequency. If the auxiliary counter is not supported, the value in the output buffer will be undefined.
     * @returns {Integer} Returns <b>S_OK</b> if the auxiliary counter is supported and <b>E_NOTIMPL</b> if the auxiliary counter is not supported.
     * @see https://learn.microsoft.com/windows/win32/api/realtimeapiset/nf-realtimeapiset-queryauxiliarycounterfrequency
     * @since windows10.0.15063
     */
    static QueryAuxiliaryCounterFrequency(lpAuxiliaryCounterFrequency) {
        result := DllCall("api-ms-win-core-realtime-l1-1-2.dll\QueryAuxiliaryCounterFrequency", "ptr", lpAuxiliaryCounterFrequency, "int")
        return result
    }

    /**
     * Converts the specified auxiliary counter value to the corresponding performance counter value; optionally provides the estimated conversion error in nanoseconds due to latencies and maximum possible drift.
     * @param {Integer} ullAuxiliaryCounterValue The auxiliary counter value to convert.
     * @param {Pointer<UInt64>} lpPerformanceCounterValue On success, contains the converted performance counter value. Will be undefined if the function fails.
     * @param {Pointer<UInt64>} lpConversionError On success, contains the estimated conversion error, in nanoseconds. Will be undefined if the function fails.
     * @returns {Integer} Returns <b>S_OK</b> if the conversion succeeds; otherwise, returns another <b>HRESULT</b> specifying the error. 
     * 
     * <table>
     * <tr>
     * <th>Return value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The auxiliary counter is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BOUNDS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value to convert is outside the permitted range (+/- 10 seconds from when the called occurred).
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/realtimeapiset/nf-realtimeapiset-convertauxiliarycountertoperformancecounter
     * @since windows10.0.15063
     */
    static ConvertAuxiliaryCounterToPerformanceCounter(ullAuxiliaryCounterValue, lpPerformanceCounterValue, lpConversionError) {
        result := DllCall("api-ms-win-core-realtime-l1-1-2.dll\ConvertAuxiliaryCounterToPerformanceCounter", "uint", ullAuxiliaryCounterValue, "ptr", lpPerformanceCounterValue, "ptr", lpConversionError, "int")
        return result
    }

    /**
     * Converts the specified performance counter value to the corresponding auxiliary counter value; optionally provides the estimated conversion error in nanoseconds due to latencies and maximum possible drift.
     * @param {Integer} ullPerformanceCounterValue The performance counter value to convert.
     * @param {Pointer<UInt64>} lpAuxiliaryCounterValue On success, contains the converted auxiliary counter value. Will be undefined if the function fails.
     * @param {Pointer<UInt64>} lpConversionError On success, contains the estimated conversion error, in nanoseconds. Will be undefined if the function fails.
     * @returns {Integer} Returns <b>S_OK</b> if the conversion succeeds; otherwise, returns another <b>HRESULT</b> specifying the error. 
     * 
     * <table>
     * <tr>
     * <th>Return value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The auxiliary counter is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BOUNDS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value to convert is outside the permitted range (+/- 10 seconds from when the called occurred).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BOUNDS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value to convert is prior to the last system boot or S3/S4 transition.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/realtimeapiset/nf-realtimeapiset-convertperformancecountertoauxiliarycounter
     * @since windows10.0.15063
     */
    static ConvertPerformanceCounterToAuxiliaryCounter(ullPerformanceCounterValue, lpAuxiliaryCounterValue, lpConversionError) {
        result := DllCall("api-ms-win-core-realtime-l1-1-2.dll\ConvertPerformanceCounterToAuxiliaryCounter", "uint", ullPerformanceCounterValue, "ptr", lpAuxiliaryCounterValue, "ptr", lpConversionError, "int")
        return result
    }

    /**
     * 
     * @param {Integer} dwMinFree 
     * @returns {Pointer} 
     */
    static GlobalCompact(dwMinFree) {
        result := DllCall("KERNEL32.dll\GlobalCompact", "uint", dwMinFree, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<HGLOBAL>} hMem 
     * @returns {String} Nothing - always returns an empty string
     */
    static GlobalFix(hMem) {
        DllCall("KERNEL32.dll\GlobalFix", "ptr", hMem)
    }

    /**
     * 
     * @param {Pointer<HGLOBAL>} hMem 
     * @returns {String} Nothing - always returns an empty string
     */
    static GlobalUnfix(hMem) {
        DllCall("KERNEL32.dll\GlobalUnfix", "ptr", hMem)
    }

    /**
     * 
     * @param {Pointer<HGLOBAL>} hMem 
     * @returns {String} Nothing - always returns an empty string
     */
    static GlobalWire(hMem) {
        DllCall("KERNEL32.dll\GlobalWire", "ptr", hMem)
    }

    /**
     * 
     * @param {Pointer<HGLOBAL>} hMem 
     * @returns {Integer} 
     */
    static GlobalUnWire(hMem) {
        result := DllCall("KERNEL32.dll\GlobalUnWire", "ptr", hMem, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HLOCAL>} hMem 
     * @param {Integer} cbNewSize 
     * @returns {Pointer} 
     */
    static LocalShrink(hMem, cbNewSize) {
        result := DllCall("KERNEL32.dll\LocalShrink", "ptr", hMem, "uint", cbNewSize, "ptr")
        return result
    }

    /**
     * 
     * @param {Integer} uMinFree 
     * @returns {Pointer} 
     */
    static LocalCompact(uMinFree) {
        result := DllCall("KERNEL32.dll\LocalCompact", "uint", uMinFree, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<PSTR>} NewEnvironment 
     * @returns {Integer} 
     */
    static SetEnvironmentStringsA(NewEnvironment) {
        result := DllCall("KERNEL32.dll\SetEnvironmentStringsA", "ptr", NewEnvironment, "int")
        return result
    }

    /**
     * The SetHandleCount function changes the number of file handles available to a process.
     * @param {Integer} uNumber The requested number of available file handles.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-sethandlecount
     */
    static SetHandleCount(uNumber) {
        DllCall("KERNEL32.dll\SetHandleCount", "uint", uNumber)
    }

    /**
     * 
     * @param {Pointer<HANDLE>} hDevice 
     * @returns {Integer} 
     */
    static RequestDeviceWakeup(hDevice) {
        result := DllCall("KERNEL32.dll\RequestDeviceWakeup", "ptr", hDevice, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} hDevice 
     * @returns {Integer} 
     */
    static CancelDeviceWakeupRequest(hDevice) {
        result := DllCall("KERNEL32.dll\CancelDeviceWakeupRequest", "ptr", hDevice, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} hMsgIndicator 
     * @param {Integer} ulMsgCount 
     * @returns {Integer} 
     */
    static SetMessageWaitingIndicator(hMsgIndicator, ulMsgCount) {
        result := DllCall("KERNEL32.dll\SetMessageWaitingIndicator", "ptr", hMsgIndicator, "uint", ulMsgCount, "int")
        return result
    }

    /**
     * Multiplies two 32-bit values and then divides the 64-bit result by a third 32-bit value.
     * @param {Integer} nNumber The multiplicand.
     * @param {Integer} nNumerator The multiplier.
     * @param {Integer} nDenominator The number by which the result of the multiplication operation is to be divided.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-muldiv
     * @since windows5.1.2600
     */
    static MulDiv(nNumber, nNumerator, nDenominator) {
        DllCall("KERNEL32.dll\MulDiv", "int", nNumber, "int", nNumerator, "int", nDenominator)
    }

    /**
     * Retrieves the current size of the registry and the maximum size that the registry is allowed to attain on the system.
     * @remarks
     * To compile an application that uses this function, define _WIN32_WINNT as 0x0501 or later. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WinProg/using-the-windows-headers">Using the Windows Headers</a>.
     * @param {Pointer<UInt32>} pdwQuotaAllowed A pointer to a variable that receives the maximum size that the registry is allowed to attain on this system, in bytes.
     * @param {Pointer<UInt32>} pdwQuotaUsed A pointer to a variable that receives the current size of  the registry, in bytes.
     * @returns {Integer} If the function succeeds, the return value is nonzero. 
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getsystemregistryquota
     * @since windows6.0.6000
     */
    static GetSystemRegistryQuota(pdwQuotaAllowed, pdwQuotaUsed) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetSystemRegistryQuota", "ptr", pdwQuotaAllowed, "ptr", pdwQuotaUsed, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Converts a file time to MS-DOS date and time values.
     * @remarks
     * The MS-DOS date format can represent only dates between 1/1/1980 and 12/31/2107; this conversion fails if the input file time is outside this range.
     * @param {Pointer<FILETIME>} lpFileTime A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure containing the file time to convert to MS-DOS date and time format.
     * @param {Pointer<UInt16>} lpFatDate A pointer to a variable to receive the MS-DOS date. The date is a packed value with the following format. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Bits</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>0–4</td>
     * <td>Day of the month (1–31)</td>
     * </tr>
     * <tr>
     * <td>5–8</td>
     * <td>Month (1 = January, 2 = February, etc.)</td>
     * </tr>
     * <tr>
     * <td>9-15</td>
     * <td>Year offset from 1980 (add 1980 to get actual year)</td>
     * </tr>
     * </table>
     * @param {Pointer<UInt16>} lpFatTime A pointer to a variable to receive the MS-DOS time. The time is a packed value with the following format. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Bits</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>0–4</td>
     * <td>Second divided by 2</td>
     * </tr>
     * <tr>
     * <td>5–10</td>
     * <td>Minute (0–59)</td>
     * </tr>
     * <tr>
     * <td>11–15</td>
     * <td>Hour (0–23 on a 24-hour clock)</td>
     * </tr>
     * </table>
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-filetimetodosdatetime
     * @since windows5.0
     */
    static FileTimeToDosDateTime(lpFileTime, lpFatDate, lpFatTime) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\FileTimeToDosDateTime", "ptr", lpFileTime, "ptr", lpFatDate, "ptr", lpFatTime, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Converts MS-DOS date and time values to a file time.
     * @param {Integer} wFatDate The MS-DOS date. The date is a packed value with the following format. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Bits</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>0-4</td>
     * <td>Day of the month (1–31)</td>
     * </tr>
     * <tr>
     * <td>5-8</td>
     * <td>Month (1 = January, 2 = February, and so on)</td>
     * </tr>
     * <tr>
     * <td>9-15</td>
     * <td>Year offset from 1980 (add 1980 to get actual year)</td>
     * </tr>
     * </table>
     * @param {Integer} wFatTime The MS-DOS time. The time is a packed value with the following format. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Bits</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>0-4</td>
     * <td>Second divided by 2</td>
     * </tr>
     * <tr>
     * <td>5-10</td>
     * <td>Minute (0–59)</td>
     * </tr>
     * <tr>
     * <td>11-15</td>
     * <td>Hour (0–23 on a 24-hour clock)</td>
     * </tr>
     * </table>
     * @param {Pointer<FILETIME>} lpFileTime A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that receives the converted file time.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-dosdatetimetofiletime
     * @since windows5.0
     */
    static DosDateTimeToFileTime(wFatDate, wFatTime, lpFileTime) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\DosDateTimeToFileTime", "ushort", wFatDate, "ushort", wFatTime, "ptr", lpFileTime, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The _lopen function opens an existing file and sets the file pointer to the beginning of the file. This function is provided for compatibility with 16-bit versions of Windows. Win32-based applications should use the CreateFile function.
     * @param {Pointer<PSTR>} lpPathName Pointer to a null-terminated string that names the file to open. The string must consist of characters from the Windows ANSI character set.
     * @param {Integer} iReadWrite 
     * @returns {Integer} If the function succeeds, the return value is a file handle.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-_lopen
     */
    static _lopen(lpPathName, iReadWrite) {
        result := DllCall("KERNEL32.dll\_lopen", "ptr", lpPathName, "int", iReadWrite, "int")
        return result
    }

    /**
     * Creates or opens the specified file.
     * @remarks
     * If the file does not exist, <b>_lcreat</b> creates and opens a new file for writing. If the file does exist, <b>_lcreat</b> truncates the file size to zero and opens it for reading and writing.
     * 
     * When the function opens a file, the pointer is set to the beginning of the file.
     * 
     * Use the <b>_lcreat</b> function with care. It can open any file, even one already opened by another function.
     * @param {Pointer<PSTR>} lpPathName The name of the file. The string must consist of characters from the Windows ANSI character set.
     * @param {Integer} iAttribute The attributes of the file.
     * @returns {Integer} If the function succeeds, the return value is a file handle. Otherwise, the return value is HFILE_ERROR. To get extended error information, use the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-_lcreat
     */
    static _lcreat(lpPathName, iAttribute) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\_lcreat", "ptr", lpPathName, "int", iAttribute, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The _lread function reads data from the specified file. This function is provided for compatibility with 16-bit versions of Windows. Win32-based applications should use the ReadFile function.
     * @param {Integer} hFile Identifies the specified file.
     * @param {Pointer<Void>} lpBuffer Pointer to a buffer that contains the data read from the file.
     * @param {Integer} uBytes Specifies the number of bytes to be read from the file.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-_lread
     */
    static _lread(hFile, lpBuffer, uBytes) {
        DllCall("KERNEL32.dll\_lread", "int", hFile, "ptr", lpBuffer, "uint", uBytes)
    }

    /**
     * Writes data to the specified file.
     * @param {Integer} hFile A handle to the file that receives the data. This handle is created by <a href="https://docs.microsoft.com/windows/win32/api/winbase/nf-winbase-_lcreat">_lcreat</a>.
     * @param {Pointer<PSTR>} lpBuffer The buffer that contains the data to be added.
     * @param {Integer} uBytes The number of bytes to write to the file.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-_lwrite
     */
    static _lwrite(hFile, lpBuffer, uBytes) {
        A_LastError := 0

        DllCall("KERNEL32.dll\_lwrite", "int", hFile, "ptr", lpBuffer, "uint", uBytes)
        if(A_LastError)
            throw OSError()

    }

    /**
     * 
     * @param {Integer} hFile 
     * @param {Pointer<Void>} lpBuffer 
     * @param {Integer} lBytes 
     * @returns {Integer} 
     */
    static _hread(hFile, lpBuffer, lBytes) {
        result := DllCall("KERNEL32.dll\_hread", "int", hFile, "ptr", lpBuffer, "int", lBytes, "int")
        return result
    }

    /**
     * 
     * @param {Integer} hFile 
     * @param {Pointer<PSTR>} lpBuffer 
     * @param {Integer} lBytes 
     * @returns {Integer} 
     */
    static _hwrite(hFile, lpBuffer, lBytes) {
        result := DllCall("KERNEL32.dll\_hwrite", "int", hFile, "ptr", lpBuffer, "int", lBytes, "int")
        return result
    }

    /**
     * The _lclose function closes the specified file so that it is no longer available for reading or writing. This function is provided for compatibility with 16-bit versions of Windows. Win32-based applications should use the CloseHandle function.
     * @param {Integer} hFile Identifies the file to be closed. This handle is returned by the function that created or last opened the file.
     * @returns {Integer} Handle to file to close.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-_lclose
     */
    static _lclose(hFile) {
        result := DllCall("KERNEL32.dll\_lclose", "int", hFile, "int")
        return result
    }

    /**
     * Repositions the file pointer for the specified file.
     * @remarks
     * When a file is initially opened, the file pointer is set to the beginning of the file. The <b>_llseek</b> function moves the pointer without reading data, which allows random access to the content of the file.
     * @param {Integer} hFile A handle to an open file. This handle is created by <a href="https://docs.microsoft.com/windows/win32/api/winbase/nf-winbase-_lcreat">_lcreat</a>.
     * @param {Integer} lOffset The number of bytes that the file pointer is to be moved.
     * @param {Integer} iOrigin The starting point and the direction that the pointer will be moved.
     * @returns {Integer} If the function succeeds, the return value specifies the new offset. Otherwise, the return value is HFILE_ERROR. To get extended error information, use the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-_llseek
     */
    static _llseek(hFile, lOffset, iOrigin) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\_llseek", "int", hFile, "int", lOffset, "int", iOrigin, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Opens an existing named mutex object.
     * @remarks
     * The 
     * <b>OpenMutex</b> function enables multiple processes to open handles of the same mutex object. The function succeeds only if some process has already created the mutex by using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-createmutexa">CreateMutex</a> function. The calling process can use the returned handle in any function that requires a handle to a mutex object, such as the 
     * <a href="https://docs.microsoft.com/windows/desktop/Sync/wait-functions">wait functions</a>, subject to the limitations of the access specified in the <i>dwDesiredAccess</i> parameter.
     * 
     * The handle can be duplicated by using the <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-duplicatehandle">DuplicateHandle</a> function. Use the <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a> function to close the handle. The system closes the handle automatically when the process terminates. The mutex object is destroyed when its last handle has been closed.
     * 
     * If your multithreaded application must repeatedly create, open, and close a named mutex object, a race condition can occur. In this situation, it is better to use <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-createmutexa">CreateMutex</a> instead of <b>OpenMutex</b>, because <b>CreateMutex</b> opens a mutex if it exists and creates it if it does not.
     * @param {Integer} dwDesiredAccess The access to the mutex object. Only the <b>SYNCHRONIZE</b> access right is required to use a mutex; to change the mutex's security, specify <b>MUTEX_ALL_ACCESS</b>. The function fails if the security descriptor of the specified object does not permit the requested access for the calling process. For a list of access rights, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Sync/synchronization-object-security-and-access-rights">Synchronization Object Security and Access Rights</a>.
     * @param {Integer} bInheritHandle If this value is <b>TRUE</b>, processes created by this process will inherit the handle. Otherwise, the processes do not inherit this handle.
     * @param {Pointer<PSTR>} lpName The name of the mutex to be opened. Name comparisons are case sensitive. 
     * 
     * 
     * 
     * 
     * This function can open objects in a private namespace. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Sync/object-namespaces">Object Namespaces</a>.
     * 
     * <b>Terminal Services:  </b>The name can have a "Global\" or "Local\" prefix to explicitly open an object in the global or session namespace. The remainder of the name can contain any character except the backslash character (\\). For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/TermServ/kernel-object-namespaces">Kernel Object Namespaces</a>.
     * 
     * <b>Note</b>  Fast user switching is implemented using Terminal Services sessions. The first user to log on uses session 0, the next user to log on uses session 1, and so on. Kernel object names must follow the guidelines outlined for Terminal Services so that applications can support multiple users.
     * @returns {Pointer<HANDLE>} If the function succeeds, the return value is a handle to the mutex object.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * If a named mutex does not exist, the function fails and <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns <b>ERROR_FILE_NOT_FOUND</b>.
     * @see https://learn.microsoft.com/windows/win32/api/synchapi/nf-synchapi-openmutexw
     */
    static OpenMutexA(dwDesiredAccess, bInheritHandle, lpName) {
        result := DllCall("KERNEL32.dll\OpenMutexA", "uint", dwDesiredAccess, "int", bInheritHandle, "ptr", lpName, "ptr")
        return result
    }

    /**
     * Opens an existing named semaphore object.
     * @remarks
     * The 
     * <b>OpenSemaphore</b> function enables multiple processes to open handles of the same semaphore object. The function succeeds only if some process has already created the semaphore by using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-createsemaphorea">CreateSemaphore</a> function. The calling process can use the returned handle in any function that requires a handle to a semaphore object, such as the 
     * <a href="https://docs.microsoft.com/windows/desktop/Sync/wait-functions">wait functions</a>, subject to the limitations of the access specified in the <i>dwDesiredAccess</i> parameter.
     * 
     * The handle can be duplicated by using the <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-duplicatehandle">DuplicateHandle</a> function. Use the <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a> function to close the handle. The system closes the handle automatically when the process terminates. The semaphore object is destroyed when its last handle has been closed.
     * @param {Integer} dwDesiredAccess The access to the semaphore object. The function fails if the security descriptor of the specified object does not permit the requested access for the calling process. For a list of access rights, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Sync/synchronization-object-security-and-access-rights">Synchronization Object Security and Access Rights</a>.
     * @param {Integer} bInheritHandle If this value is <b>TRUE</b>, processes created by this process will inherit the handle. Otherwise, the processes do not inherit this handle.
     * @param {Pointer<PSTR>} lpName The name of the semaphore to be opened. Name comparisons are case sensitive. 
     * 
     * 
     * 
     * 
     * This function can open objects in a private namespace. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Sync/object-namespaces">Object Namespaces</a>.
     * 
     * <b>Terminal Services:  </b>The name can have a "Global\" or "Local\" prefix to explicitly open an object in the global or session namespace. The remainder of the name can contain any character except the backslash character (\\). For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/TermServ/kernel-object-namespaces">Kernel Object Namespaces</a>.
     * 
     * <b>Note</b>  Fast user switching is implemented using Terminal Services sessions. The first user to log on uses session 0, the next user to log on uses session 1, and so on. Kernel object names must follow the guidelines outlined for Terminal Services so that applications can support multiple users.
     * @returns {Pointer<HANDLE>} If the function succeeds, the return value is a handle to the semaphore object.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/synchapi/nf-synchapi-opensemaphorew
     */
    static OpenSemaphoreA(dwDesiredAccess, bInheritHandle, lpName) {
        result := DllCall("KERNEL32.dll\OpenSemaphoreA", "uint", dwDesiredAccess, "int", bInheritHandle, "ptr", lpName, "ptr")
        return result
    }

    /**
     * Retrieves the value of the specified firmware environment variable. (ANSI)
     * @remarks
     * Starting with Windows 10, version 1803, Universal Windows apps can read and write Unified Extensible Firmware Interface (UEFI) firmware variables. See <a href="https://docs.microsoft.com/windows/desktop/SysInfo/access-uefi-firmware-variables-from-a-universal-windows-app">Access UEFI firmware variables from a Universal Windows App</a> for details.
     * 
     * To read a firmware environment variable, the user account that the app is running under must have the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/privilege-constants">SE_SYSTEM_ENVIRONMENT_NAME</a> privilege. A Universal Windows app must be run from an administrator account and follow the requirements outlined in <a href="https://docs.microsoft.com/windows/desktop/SysInfo/access-uefi-firmware-variables-from-a-universal-windows-app">Access UEFI firmware variables from a Universal Windows App</a>.
     * 
     * Starting with Windows 10, version 1803, reading Unified Extensible Firmware Interface (UEFI) variables is also supported from User-Mode Driver Framework (UMDF) drivers. Writing UEFI variables from UMDF drivers is not supported.
     * 
     * The exact set of firmware environment variables is determined by the boot firmware. The location of these environment variables is also specified by the firmware.  For example, on a UEFI-based system, NVRAM contains firmware environment variables that specify system boot settings. For information about specific variables used, see the <a href="https://www.uefi.org/specifications">UEFI specification</a>. For more information about UEFI and Windows, see <a href="https://docs.microsoft.com/windows-hardware/drivers/bringup/uefi-in-windows">UEFI and Windows</a>.
     * 
     * Firmware variables are not supported on a legacy BIOS-based system. The <b>GetFirmwareEnvironmentVariable</b> function will always fail on a legacy BIOS-based system, or if Windows was installed using legacy BIOS on a system that supports both legacy BIOS and UEFI. To identify these conditions, call the function with a dummy firmware environment name such as an empty string ("") for the <i>lpName</i> parameter and a dummy GUID such as "{00000000-0000-0000-0000-000000000000}" for the <i>lpGuid</i> parameter. On a legacy BIOS-based system, or on a system that supports both legacy BIOS and UEFI where Windows was installed using legacy BIOS, the function will fail with  ERROR_INVALID_FUNCTION. On a UEFI-based system, the function will  fail with an error specific to the firmware, such as ERROR_NOACCESS, to indicate that the dummy GUID namespace does not exist. 
     * 
     * If you are creating a backup application, you can use this function to save all the boot settings for the system so they can be restored using the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-setfirmwareenvironmentvariablea">SetFirmwareEnvironmentVariable</a> 
     * 	 function if needed. 
     * 
     * <b>GetFirmwareEnvironmentVariable</b> is the user-mode equivalent of the <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/wdm/nf-wdm-exgetfirmwareenvironmentvariable">ExGetFirmwareEnvironmentVariable</a> kernel-mode routine.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winbase.h header defines GetFirmwareEnvironmentVariable as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<PSTR>} lpName The name of the firmware environment variable. The pointer must not be <b>NULL</b>.
     * @param {Pointer<PSTR>} lpGuid The GUID that represents the namespace of the firmware environment variable. The GUID must be  a string in the format  "{<i>xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx</i>}" where 'x' represents a hexadecimal value.
     * @param {Pointer<Void>} pBuffer A pointer to a buffer that receives the value of the specified firmware environment variable.
     * @param {Integer} nSize The size of the <i>pBuffer</i> buffer, in bytes.
     * @returns {Integer} If the function succeeds, the return value is the number of bytes stored in the <i>pBuffer</i> buffer.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Possible error codes include ERROR_INVALID_FUNCTION.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getfirmwareenvironmentvariablea
     * @since windows6.0.6000
     */
    static GetFirmwareEnvironmentVariableA(lpName, lpGuid, pBuffer, nSize) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetFirmwareEnvironmentVariableA", "ptr", lpName, "ptr", lpGuid, "ptr", pBuffer, "uint", nSize, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the value of the specified firmware environment variable. (Unicode)
     * @remarks
     * Starting with Windows 10, version 1803, Universal Windows apps can read and write Unified Extensible Firmware Interface (UEFI) firmware variables. See <a href="https://docs.microsoft.com/windows/desktop/SysInfo/access-uefi-firmware-variables-from-a-universal-windows-app">Access UEFI firmware variables from a Universal Windows App</a> for details.
     * 
     * To read a firmware environment variable, the user account that the app is running under must have the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/privilege-constants">SE_SYSTEM_ENVIRONMENT_NAME</a> privilege. A Universal Windows app must be run from an administrator account and follow the requirements outlined in <a href="https://docs.microsoft.com/windows/desktop/SysInfo/access-uefi-firmware-variables-from-a-universal-windows-app">Access UEFI firmware variables from a Universal Windows App</a>.
     * 
     * Starting with Windows 10, version 1803, reading Unified Extensible Firmware Interface (UEFI) variables is also supported from User-Mode Driver Framework (UMDF) drivers. Writing UEFI variables from UMDF drivers is not supported.
     * 
     * The exact set of firmware environment variables is determined by the boot firmware. The location of these environment variables is also specified by the firmware.  For example, on a UEFI-based system, NVRAM contains firmware environment variables that specify system boot settings. For information about specific variables used, see the <a href="https://www.uefi.org/specifications">UEFI specification</a>. For more information about UEFI and Windows, see <a href="https://docs.microsoft.com/windows-hardware/drivers/bringup/uefi-in-windows">UEFI and Windows</a>.
     * 
     * Firmware variables are not supported on a legacy BIOS-based system. The <b>GetFirmwareEnvironmentVariable</b> function will always fail on a legacy BIOS-based system, or if Windows was installed using legacy BIOS on a system that supports both legacy BIOS and UEFI. To identify these conditions, call the function with a dummy firmware environment name such as an empty string ("") for the <i>lpName</i> parameter and a dummy GUID such as "{00000000-0000-0000-0000-000000000000}" for the <i>lpGuid</i> parameter. On a legacy BIOS-based system, or on a system that supports both legacy BIOS and UEFI where Windows was installed using legacy BIOS, the function will fail with  ERROR_INVALID_FUNCTION. On a UEFI-based system, the function will  fail with an error specific to the firmware, such as ERROR_NOACCESS, to indicate that the dummy GUID namespace does not exist. 
     * 
     * If you are creating a backup application, you can use this function to save all the boot settings for the system so they can be restored using the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-setfirmwareenvironmentvariablea">SetFirmwareEnvironmentVariable</a> 
     * 	 function if needed. 
     * 
     * <b>GetFirmwareEnvironmentVariable</b> is the user-mode equivalent of the <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/wdm/nf-wdm-exgetfirmwareenvironmentvariable">ExGetFirmwareEnvironmentVariable</a> kernel-mode routine.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winbase.h header defines GetFirmwareEnvironmentVariable as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<PWSTR>} lpName The name of the firmware environment variable. The pointer must not be <b>NULL</b>.
     * @param {Pointer<PWSTR>} lpGuid The GUID that represents the namespace of the firmware environment variable. The GUID must be  a string in the format  "{<i>xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx</i>}" where 'x' represents a hexadecimal value.
     * @param {Pointer<Void>} pBuffer A pointer to a buffer that receives the value of the specified firmware environment variable.
     * @param {Integer} nSize The size of the <i>pBuffer</i> buffer, in bytes.
     * @returns {Integer} If the function succeeds, the return value is the number of bytes stored in the <i>pBuffer</i> buffer.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Possible error codes include ERROR_INVALID_FUNCTION.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getfirmwareenvironmentvariablew
     * @since windows6.0.6000
     */
    static GetFirmwareEnvironmentVariableW(lpName, lpGuid, pBuffer, nSize) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetFirmwareEnvironmentVariableW", "ptr", lpName, "ptr", lpGuid, "ptr", pBuffer, "uint", nSize, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the value of the specified firmware environment variable and its attributes. (ANSI)
     * @remarks
     * Starting with Windows 10, version 1803, Universal Windows apps can read and write UEFI firmware variables. See <a href="https://docs.microsoft.com/windows/desktop/SysInfo/access-uefi-firmware-variables-from-a-universal-windows-app">Access UEFI firmware variables from a Universal Windows App</a> for details.
     * 
     * To read a UEFI firmware environment variable, the user account that the app is running under must have the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/privilege-constants">SE_SYSTEM_ENVIRONMENT_NAME</a> privilege. A Universal Windows app must be run from an administrator account and follow the requirements outlined in <a href="https://docs.microsoft.com/windows/desktop/SysInfo/access-uefi-firmware-variables-from-a-universal-windows-app">Access UEFI firmware variables from a Universal Windows App</a>.
     * 
     * Starting with Windows 10, version 1803, reading Unified Extensible Firmware Interface (UEFI) variables is also supported from User-Mode Driver Framework (UMDF) drivers. Writing UEFI variables from UMDF drivers is not supported.
     * 
     * The exact set of firmware environment variables is determined by the boot firmware. The location of these environment variables is also specified by the firmware.  For example, on a UEFI-based system, NVRAM contains firmware environment variables that specify system boot settings. For information about specific variables used, see the <a href="https://www.uefi.org/specifications">UEFI specification</a>. For more information about UEFI and Windows, see <a href="https://docs.microsoft.com/windows-hardware/drivers/bringup/uefi-in-windows">UEFI and Windows</a>.
     * 
     * Firmware variables are not supported on a legacy BIOS-based system. The <b>GetFirmwareEnvironmentVariableEx</b> function will always fail on a legacy BIOS-based system, or if Windows was installed using legacy BIOS on a system that supports both legacy BIOS and UEFI. To identify these conditions, call the function with a dummy firmware environment name such as an empty string ("") for the <i>lpName</i> parameter and a dummy GUID such as "{00000000-0000-0000-0000-000000000000}" for the <i>lpGuid</i> parameter. On a legacy BIOS-based system, or on a system that supports both legacy BIOS and UEFI where Windows was installed using legacy BIOS, the function will fail with  ERROR_INVALID_FUNCTION. On a UEFI-based system, the function will  fail with an error specific to the firmware, such as ERROR_NOACCESS, to indicate that the dummy GUID namespace does not exist. 
     * 
     * If you are creating a backup application, you can use this function to save all the boot settings for the system so they can be restored using the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-setfirmwareenvironmentvariablea">SetFirmwareEnvironmentVariable</a> 
     * 	 function if needed. 
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winbase.h header defines GetFirmwareEnvironmentVariableEx as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<PSTR>} lpName The name of the firmware environment variable. The pointer must not be <b>NULL</b>.
     * @param {Pointer<PSTR>} lpGuid The GUID that represents the namespace of the firmware environment variable. The GUID must be  a string in the format  "{<i>xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx</i>}" where 'x' represents a hexadecimal value. The pointer must not be <b>NULL</b>.
     * @param {Pointer<Void>} pBuffer A pointer to a buffer that receives the value of the specified firmware environment variable.
     * @param {Integer} nSize The size of the <i>pValue</i> buffer, in bytes.
     * @param {Pointer<UInt32>} pdwAttribubutes Bitmask identifying UEFI variable attributes associated with the variable. See <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-setfirmwareenvironmentvariableexa">SetFirmwareEnvironmentVariableEx</a> for the bitmask definition.
     * @returns {Integer} If the function succeeds, the return value is the number of bytes stored in the <i>pValue</i> buffer.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Possible error codes include ERROR_INVALID_FUNCTION.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getfirmwareenvironmentvariableexa
     * @since windows8.0
     */
    static GetFirmwareEnvironmentVariableExA(lpName, lpGuid, pBuffer, nSize, pdwAttribubutes) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetFirmwareEnvironmentVariableExA", "ptr", lpName, "ptr", lpGuid, "ptr", pBuffer, "uint", nSize, "ptr", pdwAttribubutes, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the value of the specified firmware environment variable and its attributes. (Unicode)
     * @remarks
     * Starting with Windows 10, version 1803, Universal Windows apps can read and write UEFI firmware variables. See <a href="https://docs.microsoft.com/windows/desktop/SysInfo/access-uefi-firmware-variables-from-a-universal-windows-app">Access UEFI firmware variables from a Universal Windows App</a> for details.
     * 
     * To read a UEFI firmware environment variable, the user account that the app is running under must have the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/privilege-constants">SE_SYSTEM_ENVIRONMENT_NAME</a> privilege. A Universal Windows app must be run from an administrator account and follow the requirements outlined in <a href="https://docs.microsoft.com/windows/desktop/SysInfo/access-uefi-firmware-variables-from-a-universal-windows-app">Access UEFI firmware variables from a Universal Windows App</a>.
     * 
     * Starting with Windows 10, version 1803, reading Unified Extensible Firmware Interface (UEFI) variables is also supported from User-Mode Driver Framework (UMDF) drivers. Writing UEFI variables from UMDF drivers is not supported.
     * 
     * The exact set of firmware environment variables is determined by the boot firmware. The location of these environment variables is also specified by the firmware.  For example, on a UEFI-based system, NVRAM contains firmware environment variables that specify system boot settings. For information about specific variables used, see the <a href="https://www.uefi.org/specifications">UEFI specification</a>. For more information about UEFI and Windows, see <a href="https://docs.microsoft.com/windows-hardware/drivers/bringup/uefi-in-windows">UEFI and Windows</a>.
     * 
     * Firmware variables are not supported on a legacy BIOS-based system. The <b>GetFirmwareEnvironmentVariableEx</b> function will always fail on a legacy BIOS-based system, or if Windows was installed using legacy BIOS on a system that supports both legacy BIOS and UEFI. To identify these conditions, call the function with a dummy firmware environment name such as an empty string ("") for the <i>lpName</i> parameter and a dummy GUID such as "{00000000-0000-0000-0000-000000000000}" for the <i>lpGuid</i> parameter. On a legacy BIOS-based system, or on a system that supports both legacy BIOS and UEFI where Windows was installed using legacy BIOS, the function will fail with  ERROR_INVALID_FUNCTION. On a UEFI-based system, the function will  fail with an error specific to the firmware, such as ERROR_NOACCESS, to indicate that the dummy GUID namespace does not exist. 
     * 
     * If you are creating a backup application, you can use this function to save all the boot settings for the system so they can be restored using the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-setfirmwareenvironmentvariablea">SetFirmwareEnvironmentVariable</a> 
     * 	 function if needed. 
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winbase.h header defines GetFirmwareEnvironmentVariableEx as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<PWSTR>} lpName The name of the firmware environment variable. The pointer must not be <b>NULL</b>.
     * @param {Pointer<PWSTR>} lpGuid The GUID that represents the namespace of the firmware environment variable. The GUID must be  a string in the format  "{<i>xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx</i>}" where 'x' represents a hexadecimal value. The pointer must not be <b>NULL</b>.
     * @param {Pointer<Void>} pBuffer A pointer to a buffer that receives the value of the specified firmware environment variable.
     * @param {Integer} nSize The size of the <i>pValue</i> buffer, in bytes.
     * @param {Pointer<UInt32>} pdwAttribubutes Bitmask identifying UEFI variable attributes associated with the variable. See <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-setfirmwareenvironmentvariableexa">SetFirmwareEnvironmentVariableEx</a> for the bitmask definition.
     * @returns {Integer} If the function succeeds, the return value is the number of bytes stored in the <i>pValue</i> buffer.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Possible error codes include ERROR_INVALID_FUNCTION.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getfirmwareenvironmentvariableexw
     * @since windows8.0
     */
    static GetFirmwareEnvironmentVariableExW(lpName, lpGuid, pBuffer, nSize, pdwAttribubutes) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetFirmwareEnvironmentVariableExW", "ptr", lpName, "ptr", lpGuid, "ptr", pBuffer, "uint", nSize, "ptr", pdwAttribubutes, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets the value of the specified firmware environment variable. (ANSI)
     * @remarks
     * Starting with Windows 10, version 1803, Universal Windows apps can read and write UEFI firmware variables. See <a href="https://docs.microsoft.com/windows/desktop/SysInfo/access-uefi-firmware-variables-from-a-universal-windows-app">Access UEFI firmware variables from a Universal Windows App</a> for details.
     * 
     * Starting with Windows 10, version 1803, reading UEFI firmware variables is also supported from User-Mode Driver Framework (UMDF) drivers. Writing UEFI firmware variables from UMDF drivers is not supported.
     * 
     * To write a firmware environment variable, the user account that the app is running under must have the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/privilege-constants">SE_SYSTEM_ENVIRONMENT_NAME</a> privilege. A Universal Windows app must be run from an administrator account and follow the requirements outlined in <a href="https://docs.microsoft.com/windows/desktop/SysInfo/access-uefi-firmware-variables-from-a-universal-windows-app">Access UEFI firmware variables from a Universal Windows App</a>.
     * 
     * The exact set of firmware environment variables is determined by the boot firmware. The location of these environment variables is also specified by the firmware.  For example, on a UEFI-based system, NVRAM contains firmware environment variables that specify system boot settings. For information about specific variables used, see the <a href="https://www.uefi.org/specifications">UEFI specification</a>. For more information about UEFI and Windows, see <a href="https://docs.microsoft.com/windows-hardware/drivers/bringup/uefi-in-windows">UEFI and Windows</a>.
     * 
     * Firmware variables are not supported on a legacy BIOS-based system. The <b>SetFirmwareEnvironmentVariable</b> function will always fail on a legacy BIOS-based system, or if Windows was installed using legacy BIOS on a system that supports both legacy BIOS and UEFI.  To identify these conditions, call the function with a dummy firmware environment name such as an empty string ("") for the <i>lpName</i> parameter and a dummy GUID such as "{00000000-0000-0000-0000-000000000000}" for the <i>lpGuid</i> parameter. On a legacy BIOS-based system, or on a system that supports both legacy BIOS and UEFI where Windows was installed using legacy BIOS, the function will fail with  ERROR_INVALID_FUNCTION. On a UEFI-based system, the function will  fail with an error specific to the firmware, such as ERROR_NOACCESS, to indicate that the dummy GUID namespace does not exist.
     * 
     * <b>SetFirmwareEnvironmentVariable</b> is the user-mode equivalent of the <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/wdm/nf-wdm-exsetfirmwareenvironmentvariable">ExSetFirmwareEnvironmentVariable</a> kernel-mode routine.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winbase.h header defines SetFirmwareEnvironmentVariable as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<PSTR>} lpName The name of the firmware environment variable. The pointer must not be <b>NULL</b>.
     * @param {Pointer<PSTR>} lpGuid The GUID that represents the namespace of the firmware environment variable. The GUID must be a string in the format  "{<i>xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx</i>}". If the system does not support GUID-based namespaces, this parameter is ignored.
     * @param {Pointer<Void>} pValue A pointer to the new value for the  firmware environment variable.
     * @param {Integer} nSize The size of the <i>pBuffer</i> buffer, in bytes. If this parameter is zero, the firmware environment variable is deleted.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Possible error codes include ERROR_INVALID_FUNCTION.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-setfirmwareenvironmentvariablea
     * @since windows6.0.6000
     */
    static SetFirmwareEnvironmentVariableA(lpName, lpGuid, pValue, nSize) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetFirmwareEnvironmentVariableA", "ptr", lpName, "ptr", lpGuid, "ptr", pValue, "uint", nSize, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets the value of the specified firmware environment variable. (Unicode)
     * @remarks
     * Starting with Windows 10, version 1803, Universal Windows apps can read and write UEFI firmware variables. See <a href="https://docs.microsoft.com/windows/desktop/SysInfo/access-uefi-firmware-variables-from-a-universal-windows-app">Access UEFI firmware variables from a Universal Windows App</a> for details.
     * 
     * Starting with Windows 10, version 1803, reading UEFI firmware variables is also supported from User-Mode Driver Framework (UMDF) drivers. Writing UEFI firmware variables from UMDF drivers is not supported.
     * 
     * To write a firmware environment variable, the user account that the app is running under must have the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/privilege-constants">SE_SYSTEM_ENVIRONMENT_NAME</a> privilege. A Universal Windows app must be run from an administrator account and follow the requirements outlined in <a href="https://docs.microsoft.com/windows/desktop/SysInfo/access-uefi-firmware-variables-from-a-universal-windows-app">Access UEFI firmware variables from a Universal Windows App</a>.
     * 
     * The exact set of firmware environment variables is determined by the boot firmware. The location of these environment variables is also specified by the firmware.  For example, on a UEFI-based system, NVRAM contains firmware environment variables that specify system boot settings. For information about specific variables used, see the <a href="https://www.uefi.org/specifications">UEFI specification</a>. For more information about UEFI and Windows, see <a href="https://docs.microsoft.com/windows-hardware/drivers/bringup/uefi-in-windows">UEFI and Windows</a>.
     * 
     * Firmware variables are not supported on a legacy BIOS-based system. The <b>SetFirmwareEnvironmentVariable</b> function will always fail on a legacy BIOS-based system, or if Windows was installed using legacy BIOS on a system that supports both legacy BIOS and UEFI.  To identify these conditions, call the function with a dummy firmware environment name such as an empty string ("") for the <i>lpName</i> parameter and a dummy GUID such as "{00000000-0000-0000-0000-000000000000}" for the <i>lpGuid</i> parameter. On a legacy BIOS-based system, or on a system that supports both legacy BIOS and UEFI where Windows was installed using legacy BIOS, the function will fail with  ERROR_INVALID_FUNCTION. On a UEFI-based system, the function will  fail with an error specific to the firmware, such as ERROR_NOACCESS, to indicate that the dummy GUID namespace does not exist.
     * 
     * <b>SetFirmwareEnvironmentVariable</b> is the user-mode equivalent of the <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/wdm/nf-wdm-exsetfirmwareenvironmentvariable">ExSetFirmwareEnvironmentVariable</a> kernel-mode routine.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winbase.h header defines SetFirmwareEnvironmentVariable as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<PWSTR>} lpName The name of the firmware environment variable. The pointer must not be <b>NULL</b>.
     * @param {Pointer<PWSTR>} lpGuid The GUID that represents the namespace of the firmware environment variable. The GUID must be a string in the format  "{<i>xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx</i>}". If the system does not support GUID-based namespaces, this parameter is ignored.
     * @param {Pointer<Void>} pValue A pointer to the new value for the  firmware environment variable.
     * @param {Integer} nSize The size of the <i>pBuffer</i> buffer, in bytes. If this parameter is zero, the firmware environment variable is deleted.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Possible error codes include ERROR_INVALID_FUNCTION.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-setfirmwareenvironmentvariablew
     * @since windows6.0.6000
     */
    static SetFirmwareEnvironmentVariableW(lpName, lpGuid, pValue, nSize) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetFirmwareEnvironmentVariableW", "ptr", lpName, "ptr", lpGuid, "ptr", pValue, "uint", nSize, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets the value of the specified firmware environment variable as the attributes that indicate how this variable is stored and maintained.
     * @remarks
     * Starting with Windows 10, version 1803, Universal Windows apps can read and write UEFI firmware variables. See <a href="https://docs.microsoft.com/windows/desktop/SysInfo/access-uefi-firmware-variables-from-a-universal-windows-app">Access UEFI firmware variables from a Universal Windows App</a> for details.
     * 
     * Starting with Windows 10, version 1803, reading UEFI firmware variables is also supported from User-Mode Driver Framework (UMDF) drivers. Writing UEFI firmware variables from UMDF drivers is not supported.
     * 
     * To write a firmware environment variable, the user account that the app is running under must have the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/privilege-constants">SE_SYSTEM_ENVIRONMENT_NAME</a> privilege. A Universal Windows app must be run from an administrator account and follow the requirements outlined in <a href="https://docs.microsoft.com/windows/desktop/SysInfo/access-uefi-firmware-variables-from-a-universal-windows-app">Access UEFI firmware variables from a Universal Windows App</a>.
     * 
     * The correct method of changing the attributes of a variable is to delete the
     * variable and recreate it with different attributes.
     * 
     * The exact set of firmware environment variables is determined by the boot firmware. The location of these environment variables is also specified by the firmware.  For example, on a UEFI-based system, NVRAM contains firmware environment variables that specify system boot settings. For information about specific variables used, see the <a href="https://www.uefi.org/specifications">UEFI specification</a>. For more information about UEFI and Windows, see <a href="https://docs.microsoft.com/windows-hardware/drivers/bringup/uefi-in-windows">UEFI and Windows</a>.
     * 
     * Firmware variables are not supported on a legacy BIOS-based system. The <b>SetFirmwareEnvironmentVariableEx</b> function will always fail on a legacy BIOS-based system, or if Windows was installed using legacy BIOS on a system that supports both legacy BIOS and UEFI.  To identify these conditions, call the function with a dummy firmware environment name such as an empty string ("") for the <i>lpName</i> parameter and a dummy GUID such as "{00000000-0000-0000-0000-000000000000}" for the <i>lpGuid</i> parameter. On a legacy BIOS-based system, or on a system that supports both legacy BIOS and UEFI where Windows was installed using legacy BIOS, the function will fail with  ERROR_INVALID_FUNCTION. On a UEFI-based system, the function will  fail with an error specific to the firmware, such as ERROR_NOACCESS, to indicate that the dummy GUID namespace does not exist.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winbase.h header defines SetFirmwareEnvironmentVariableEx as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<PSTR>} lpName The name of the firmware environment variable. The pointer must not be <b>NULL</b>.
     * @param {Pointer<PSTR>} lpGuid The GUID that represents the namespace of the firmware environment variable. The GUID must be a string in the format  "{<i>xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx</i>}". If the system does not support GUID-based namespaces, this parameter is ignored. The pointer must not be <b>NULL</b>.
     * @param {Pointer<Void>} pValue A pointer to the new value for the  firmware environment variable.
     * @param {Integer} nSize The size of the <i>pValue</i> buffer, in bytes. Unless the VARIABLE_ATTRIBUTE_APPEND_WRITE,
     * VARIABLE_ATTRIBUTE_AUTHENTICATED_WRITE_ACCESS, or
     * VARIABLE_ATTRIBUTE_TIME_BASED_AUTHENTICATED_WRITE_ACCESS variable attribute is set via <i>dwAttributes</i>,
     * setting this value to zero will result in the deletion of this variable.
     * @param {Integer} dwAttributes Bitmask to set UEFI variable attributes associated with the variable. See also <a href="https://www.uefi.org/specifications">UEFI Spec 2.3.1, Section 7.2</a>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VARIABLE_ATTRIBUTE_NON_VOLATILE"></a><a id="variable_attribute_non_volatile"></a><dl>
     * <dt><b>VARIABLE_ATTRIBUTE_NON_VOLATILE</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The firmware environment variable is stored in non-volatile memory (e.g. NVRAM).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VARIABLE_ATTRIBUTE_BOOTSERVICE_ACCESS"></a><a id="variable_attribute_bootservice_access"></a><dl>
     * <dt><b>VARIABLE_ATTRIBUTE_BOOTSERVICE_ACCESS</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The firmware environment variable can be accessed during boot service.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VARIABLE_ATTRIBUTE_RUNTIME_ACCESS"></a><a id="variable_attribute_runtime_access"></a><dl>
     * <dt><b>VARIABLE_ATTRIBUTE_RUNTIME_ACCESS</b></dt>
     * <dt>0x00000004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The firmware environment variable can be accessed at runtime.
     * 
     * <div class="alert"><b>Note</b>  Variables with this attribute set, must also have
     * <b>VARIABLE_ATTRIBUTE_BOOTSERVICE_ACCESS</b> set.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VARIABLE_ATTRIBUTE_HARDWARE_ERROR_RECORD"></a><a id="variable_attribute_hardware_error_record"></a><dl>
     * <dt><b>VARIABLE_ATTRIBUTE_HARDWARE_ERROR_RECORD</b></dt>
     * <dt>0x00000008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates hardware related errors encountered at runtime.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VARIABLE_ATTRIBUTE_AUTHENTICATED_WRITE_ACCESS"></a><a id="variable_attribute_authenticated_write_access"></a><dl>
     * <dt><b>VARIABLE_ATTRIBUTE_AUTHENTICATED_WRITE_ACCESS</b></dt>
     * <dt>0x00000010</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates an authentication requirement that must be met before writing to this firmware environment variable. For more information see, <a href="https://www.uefi.org/specifications">UEFI spec 2.3.1</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VARIABLE_ATTRIBUTE_TIME_BASED_AUTHENTICATED_WRITE_ACCESS"></a><a id="variable_attribute_time_based_authenticated_write_access"></a><dl>
     * <dt><b>VARIABLE_ATTRIBUTE_TIME_BASED_AUTHENTICATED_WRITE_ACCESS</b></dt>
     * <dt>0x00000020</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates authentication and time stamp requirements that must be met before writing to this firmware environment variable. When this attribute is set, the buffer, represented by <i>pValue</i>, will begin with an instance of a complete (and serialized) EFI_VARIABLE_AUTHENTICATION_2 descriptor.  For more information see, <a href="https://www.uefi.org/specifications">UEFI spec 2.3.1</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VARIABLE_ATTRIBUTE_APPEND_WRITE"></a><a id="variable_attribute_append_write"></a><dl>
     * <dt><b>VARIABLE_ATTRIBUTE_APPEND_WRITE</b></dt>
     * <dt>0x00000040</dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  Append an existing environment variable with the value of <i>pValue</i>. If the
     * firmware does not support the operation, then <b>SetFirmwareEnvironmentVariableEx</b> will return
     * ERROR_INVALID_FUNCTION.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Possible error codes include ERROR_INVALID_FUNCTION.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-setfirmwareenvironmentvariableexa
     * @since windows8.0
     */
    static SetFirmwareEnvironmentVariableExA(lpName, lpGuid, pValue, nSize, dwAttributes) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetFirmwareEnvironmentVariableExA", "ptr", lpName, "ptr", lpGuid, "ptr", pValue, "uint", nSize, "uint", dwAttributes, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets the value of the specified firmware environment variable and the attributes that indicate how this variable is stored and maintained.
     * @remarks
     * Starting with Windows 10, version 1803, Universal Windows apps can read and write UEFI firmware variables. See <a href="https://docs.microsoft.com/windows/desktop/SysInfo/access-uefi-firmware-variables-from-a-universal-windows-app">Access UEFI firmware variables from a Universal Windows App</a> for details.
     * 
     * Starting with Windows 10, version 1803, reading UEFI firmware variables is also supported from User-Mode Driver Framework (UMDF) drivers. Writing UEFI firmware variables from UMDF drivers is not supported.
     * 
     * To write a firmware environment variable, the user account that the app is running under must have the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/privilege-constants">SE_SYSTEM_ENVIRONMENT_NAME</a> privilege. A Universal Windows app must be run from an administrator account and follow the requirements outlined in <a href="https://docs.microsoft.com/windows/desktop/SysInfo/access-uefi-firmware-variables-from-a-universal-windows-app">Access UEFI firmware variables from a Universal Windows App</a>.
     * 
     * The correct method of changing the attributes of a variable is to delete the
     * variable and recreate it with different attributes.
     * 
     * The exact set of firmware environment variables is determined by the boot firmware. The location of these environment variables is also specified by the firmware.  For example, on a UEFI-based system, NVRAM contains firmware environment variables that specify system boot settings. For information about specific variables used, see the <a href="https://www.uefi.org/specifications">UEFI specification</a>. For more information about UEFI and Windows, see <a href="https://docs.microsoft.com/windows-hardware/drivers/bringup/uefi-in-windows">UEFI and Windows</a>.
     * 
     * Firmware variables are not supported on a legacy BIOS-based system. The <b>SetFirmwareEnvironmentVariableEx</b> function will always fail on a legacy BIOS-based system, or if Windows was installed using legacy BIOS on a system that supports both legacy BIOS and UEFI.  To identify these conditions, call the function with a dummy firmware environment name such as an empty string ("") for the <i>lpName</i> parameter and a dummy GUID such as "{00000000-0000-0000-0000-000000000000}" for the <i>lpGuid</i> parameter. On a legacy BIOS-based system, or on a system that supports both legacy BIOS and UEFI where Windows was installed using legacy BIOS, the function will fail with  ERROR_INVALID_FUNCTION. On a UEFI-based system, the function will  fail with an error specific to the firmware, such as ERROR_NOACCESS, to indicate that the dummy GUID namespace does not exist.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winbase.h header defines SetFirmwareEnvironmentVariableEx as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<PWSTR>} lpName The name of the firmware environment variable. The pointer must not be <b>NULL</b>.
     * @param {Pointer<PWSTR>} lpGuid The GUID that represents the namespace of the firmware environment variable. The GUID must be a string in the format  "{<i>xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx</i>}". If the system does not support GUID-based namespaces, this parameter is ignored. The pointer must not be <b>NULL</b>.
     * @param {Pointer<Void>} pValue A pointer to the new value for the  firmware environment variable.
     * @param {Integer} nSize The size of the <i>pValue</i> buffer, in bytes. Unless the VARIABLE_ATTRIBUTE_APPEND_WRITE,
     * VARIABLE_ATTRIBUTE_AUTHENTICATED_WRITE_ACCESS, or
     * VARIABLE_ATTRIBUTE_TIME_BASED_AUTHENTICATED_WRITE_ACCESS variable attribute is set via <i>dwAttributes</i>,
     * setting this value to zero will result in the deletion of this variable.
     * @param {Integer} dwAttributes Bitmask to set UEFI variable attributes associated with the variable. See also <a href="https://www.uefi.org/specifications">UEFI Spec 2.3.1, Section 7.2</a>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VARIABLE_ATTRIBUTE_NON_VOLATILE"></a><a id="variable_attribute_non_volatile"></a><dl>
     * <dt><b>VARIABLE_ATTRIBUTE_NON_VOLATILE</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The firmware environment variable is stored in non-volatile memory (e.g. NVRAM).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VARIABLE_ATTRIBUTE_BOOTSERVICE_ACCESS"></a><a id="variable_attribute_bootservice_access"></a><dl>
     * <dt><b>VARIABLE_ATTRIBUTE_BOOTSERVICE_ACCESS</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The firmware environment variable can be accessed during boot service.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VARIABLE_ATTRIBUTE_RUNTIME_ACCESS"></a><a id="variable_attribute_runtime_access"></a><dl>
     * <dt><b>VARIABLE_ATTRIBUTE_RUNTIME_ACCESS</b></dt>
     * <dt>0x00000004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The firmware environment variable can be accessed at runtime.
     * 
     * <div class="alert"><b>Note</b>  Variables with this attribute set, must also have
     * <b>VARIABLE_ATTRIBUTE_BOOTSERVICE_ACCESS</b> set.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VARIABLE_ATTRIBUTE_HARDWARE_ERROR_RECORD"></a><a id="variable_attribute_hardware_error_record"></a><dl>
     * <dt><b>VARIABLE_ATTRIBUTE_HARDWARE_ERROR_RECORD</b></dt>
     * <dt>0x00000008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates hardware related errors encountered at runtime.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VARIABLE_ATTRIBUTE_AUTHENTICATED_WRITE_ACCESS"></a><a id="variable_attribute_authenticated_write_access"></a><dl>
     * <dt><b>VARIABLE_ATTRIBUTE_AUTHENTICATED_WRITE_ACCESS</b></dt>
     * <dt>0x00000010</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates an authentication requirement that must be met before writing to this firmware environment variable. For more information see, <a href="https://www.uefi.org/specifications">UEFI spec 2.3.1</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VARIABLE_ATTRIBUTE_TIME_BASED_AUTHENTICATED_WRITE_ACCESS"></a><a id="variable_attribute_time_based_authenticated_write_access"></a><dl>
     * <dt><b>VARIABLE_ATTRIBUTE_TIME_BASED_AUTHENTICATED_WRITE_ACCESS</b></dt>
     * <dt>0x00000020</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates authentication and time stamp requirements that must be met before writing to this firmware environment variable. When this attribute is set, the buffer, represented by <i>pValue</i>, will begin with an instance of a complete (and serialized) EFI_VARIABLE_AUTHENTICATION_2 descriptor.  For more information see, <a href="https://www.uefi.org/specifications">UEFI spec 2.3.1</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VARIABLE_ATTRIBUTE_APPEND_WRITE"></a><a id="variable_attribute_append_write"></a><dl>
     * <dt><b>VARIABLE_ATTRIBUTE_APPEND_WRITE</b></dt>
     * <dt>0x00000040</dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  Append an existing environment variable with the value of <i>pValue</i>. If the
     * firmware does not support the operation, then <b>SetFirmwareEnvironmentVariableEx</b> will return
     * ERROR_INVALID_FUNCTION.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Possible error codes include ERROR_INVALID_FUNCTION.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-setfirmwareenvironmentvariableexw
     * @since windows8.0
     */
    static SetFirmwareEnvironmentVariableExW(lpName, lpGuid, pValue, nSize, dwAttributes) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetFirmwareEnvironmentVariableExW", "ptr", lpName, "ptr", lpGuid, "ptr", pValue, "uint", nSize, "uint", dwAttributes, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Indicates if the OS was booted from a VHD container.
     * @param {Pointer<Int32>} NativeVhdBoot Pointer to a variable that receives a boolean
     *         indicating if the OS was booted from a VHD.
     * @returns {Integer} TRUE if the OS was a native VHD boot; otherwise, FALSE.
     * 
     * Call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> to get extended error information.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-isnativevhdboot
     * @since windows8.0
     */
    static IsNativeVhdBoot(NativeVhdBoot) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\IsNativeVhdBoot", "ptr", NativeVhdBoot, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves an integer from a key in the specified section of the Win.ini file. (ANSI)
     * @remarks
     * If the key name consists of digits followed by characters that are not numeric, the function returns only the value of the digits. For example, the function returns 102 for the following line: KeyName=102abc.
     * 
     * <b>Windows Server 2003 and Windows XP/2000:  </b>Calls to profile functions may be mapped to the registry instead of to the initialization files. This mapping occurs when the initialization file and section are specified in the registry under the following key:<b>HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\IniFileMapping</b>
     * 
     * When the operation has been mapped, the 
     * <b>GetProfileInt</b> function retrieves information from the registry, not from the initialization file; the change in the storage location has no effect on the function's behavior.
     * 
     * The profile functions use the following steps to locate initialization information:
     * 				
     * 			
     * 
     * <ol>
     * <li>Look in the registry for the name of the initialization file  under the <b>IniFileMapping</b> key.</li>
     * <li>Look for the section name specified by <i>lpAppName</i>. This will be a named value under the key that has the name of the initialization file, or a subkey with this name, or the name will not exist as either a value or subkey.</li>
     * <li>If the section name specified by <i>lpAppName</i> is a named value, then that value specifies where in the registry you will find the keys for the section.</li>
     * <li>If the section name specified by <i>lpAppName</i> is a subkey, then named values under that subkey specify where in the registry you will find the keys for the section. If the key you are looking for does not exist as a named value, then there will be an unnamed value (shown as <b>&lt;No Name&gt;</b>) that specifies the default location in the registry where you will find the key.</li>
     * <li>If the section name specified by <i>lpAppName</i> does not exist as a named value or as a subkey, then there will be an unnamed value (shown as <b>&lt;No Name&gt;</b>) that specifies the default location in the registry where you will find the keys for the section.</li>
     * <li>If there is no subkey or entry for the section name, then look for the actual initialization file on the disk and read its contents.</li>
     * </ol>
     * When looking at values in the registry that specify other registry locations, there are several prefixes that change the behavior of the .ini file mapping:
     * 				
     * 			
     * 
     * <ul>
     * <li>! - this character forces all writes to go both to the registry and to the .ini file on disk.</li>
     * <li># - this character causes the registry value to be set to the value in the Windows 3.1 .ini file when a new user logs in for the first time after setup.</li>
     * <li>@ - this character prevents any reads from going to the .ini file on disk if the requested data is not found in the registry.</li>
     * <li>USR: - this prefix stands for <b>HKEY_CURRENT_USER</b>, and the text after the prefix is relative to that key.</li>
     * <li>SYS: - this prefix stands for <b>HKEY_LOCAL_MACHINE\SOFTWARE</b>, and the text after the prefix is relative to that key.</li>
     * </ul>
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winbase.h header defines GetProfileInt as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<PSTR>} lpAppName The name of the section containing the key name.
     * @param {Pointer<PSTR>} lpKeyName The name of the key whose value is to be retrieved. This value is in the form of a string; the 
     * <b>GetProfileInt</b> function converts the string into an integer and returns the integer.
     * @param {Integer} nDefault The default value to return if the key name cannot be found in the initialization file.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getprofileinta
     * @since windows5.0
     */
    static GetProfileIntA(lpAppName, lpKeyName, nDefault) {
        DllCall("KERNEL32.dll\GetProfileIntA", "ptr", lpAppName, "ptr", lpKeyName, "int", nDefault)
    }

    /**
     * Retrieves an integer from a key in the specified section of the Win.ini file. (Unicode)
     * @remarks
     * If the key name consists of digits followed by characters that are not numeric, the function returns only the value of the digits. For example, the function returns 102 for the following line: KeyName=102abc.
     * 
     * <b>Windows Server 2003 and Windows XP/2000:  </b>Calls to profile functions may be mapped to the registry instead of to the initialization files. This mapping occurs when the initialization file and section are specified in the registry under the following key:<b>HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\IniFileMapping</b>
     * 
     * When the operation has been mapped, the 
     * <b>GetProfileInt</b> function retrieves information from the registry, not from the initialization file; the change in the storage location has no effect on the function's behavior.
     * 
     * The profile functions use the following steps to locate initialization information:
     * 				
     * 			
     * 
     * <ol>
     * <li>Look in the registry for the name of the initialization file  under the <b>IniFileMapping</b> key.</li>
     * <li>Look for the section name specified by <i>lpAppName</i>. This will be a named value under the key that has the name of the initialization file, or a subkey with this name, or the name will not exist as either a value or subkey.</li>
     * <li>If the section name specified by <i>lpAppName</i> is a named value, then that value specifies where in the registry you will find the keys for the section.</li>
     * <li>If the section name specified by <i>lpAppName</i> is a subkey, then named values under that subkey specify where in the registry you will find the keys for the section. If the key you are looking for does not exist as a named value, then there will be an unnamed value (shown as <b>&lt;No Name&gt;</b>) that specifies the default location in the registry where you will find the key.</li>
     * <li>If the section name specified by <i>lpAppName</i> does not exist as a named value or as a subkey, then there will be an unnamed value (shown as <b>&lt;No Name&gt;</b>) that specifies the default location in the registry where you will find the keys for the section.</li>
     * <li>If there is no subkey or entry for the section name, then look for the actual initialization file on the disk and read its contents.</li>
     * </ol>
     * When looking at values in the registry that specify other registry locations, there are several prefixes that change the behavior of the .ini file mapping:
     * 				
     * 			
     * 
     * <ul>
     * <li>! - this character forces all writes to go both to the registry and to the .ini file on disk.</li>
     * <li># - this character causes the registry value to be set to the value in the Windows 3.1 .ini file when a new user logs in for the first time after setup.</li>
     * <li>@ - this character prevents any reads from going to the .ini file on disk if the requested data is not found in the registry.</li>
     * <li>USR: - this prefix stands for <b>HKEY_CURRENT_USER</b>, and the text after the prefix is relative to that key.</li>
     * <li>SYS: - this prefix stands for <b>HKEY_LOCAL_MACHINE\SOFTWARE</b>, and the text after the prefix is relative to that key.</li>
     * </ul>
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winbase.h header defines GetProfileInt as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<PWSTR>} lpAppName The name of the section containing the key name.
     * @param {Pointer<PWSTR>} lpKeyName The name of the key whose value is to be retrieved. This value is in the form of a string; the 
     * <b>GetProfileInt</b> function converts the string into an integer and returns the integer.
     * @param {Integer} nDefault The default value to return if the key name cannot be found in the initialization file.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getprofileintw
     * @since windows5.0
     */
    static GetProfileIntW(lpAppName, lpKeyName, nDefault) {
        DllCall("KERNEL32.dll\GetProfileIntW", "ptr", lpAppName, "ptr", lpKeyName, "int", nDefault)
    }

    /**
     * Retrieves the string associated with a key in the specified section of the Win.ini file. (ANSI)
     * @remarks
     * If the string associated with the <i>lpKeyName</i> parameter is enclosed in single or double quotation marks, the marks are discarded when the 
     * <b>GetProfileString</b> function returns the string.
     * 
     * The 
     * <b>GetProfileString</b> function is not case-sensitive; the strings can contain a combination of uppercase and lowercase letters.
     * 
     * A section in the Win.ini file must have the following form: 
     * 
     * 
     * ``` syntax
     * [section]
     * key=string
     *       .
     *       .
     *       .
     * ```
     * 
     * An application can use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-getprivateprofilestring">GetPrivateProfileString</a> function to retrieve a string from a specified initialization file.
     * 
     * The <i>lpDefault</i> parameter must point to a valid string, even if the string is empty (that is, even if its first character is a <b>null</b> character).
     * 
     * <b>Windows Server 2003 and Windows XP/2000:  </b>Calls to profile functions may be mapped to the registry instead of to the initialization files. This mapping occurs when the initialization file and section are specified in the registry under the following keys:<p class="note">
     * <b>HKEY_LOCAL_MACHINE</b>&#92;<b>Software</b>&#92;<b>Microsoft</b>&#92;<b>Windows NT</b>&#92;<b>CurrentVersion</b>&#92;<b>IniFileMapping</b>
     * 
     * 
     * 
     * 
     * 
     * When the operation has been mapped, the 
     * <b>GetProfileString</b> function retrieves information from the registry, not from the initialization file; the change in the storage location has no effect on the function's behavior.
     * 
     * The profile functions use the following steps to locate initialization information: 
     * 
     * <ol>
     * <li>Look in the registry for the name of the initialization file  under the <b>IniFileMapping</b> key.</li>
     * <li>Look for the section name specified by <i>lpAppName</i>. This will be a named value under the key that has the name of the initialization file, or a subkey with this name, or the name will not exist as either a value or subkey.</li>
     * <li>If the section name specified by <i>lpAppName</i> is a named value, then that value specifies where in the registry you will find the keys for the section.</li>
     * <li>If the section name specified by <i>lpAppName</i> is a subkey, then named values under that subkey specify where in the registry you will find the keys for the section. If the key you are looking for does not exist as a named value, then there will be an unnamed value (shown as <b>&lt;No Name&gt;</b>) that specifies the default location in the registry where you will find the key.</li>
     * <li>If the section name specified by <i>lpAppName</i> does not exist as a named value or as a subkey, then there will be an unnamed value (shown as <b>&lt;No Name&gt;</b>) that specifies the default location in the registry where you will find the keys for the section.</li>
     * <li>If there is no subkey or entry for the section name, then look for the actual initialization file on the disk and read its contents.</li>
     * </ol>
     * When looking at values in the registry that specify other registry locations, there are several prefixes that change the behavior of the .ini file mapping: 
     * 
     * <ul>
     * <li>! - this character forces all writes to go both to the registry and to the .ini file on disk.</li>
     * <li># - this character causes the registry value to be set to the value in the Windows 3.1 .ini file when a new user logs in for the first time after setup.</li>
     * <li>@ - this character prevents any reads from going to the .ini file on disk if the requested data is not found in the registry.</li>
     * <li>USR: - this prefix stands for <b>HKEY_CURRENT_USER</b>, and the text after the prefix is relative to that key.</li>
     * <li>SYS: - this prefix stands for <b>HKEY_LOCAL_MACHINE\SOFTWARE</b>, and the text after the prefix is relative to that key.</li>
     * </ul>
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winbase.h header defines GetProfileString as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<PSTR>} lpAppName The name of the section containing the key. If this parameter is <b>NULL</b>, the function copies all section names in the file to the supplied buffer.
     * @param {Pointer<PSTR>} lpKeyName The name of the key whose associated string is to be retrieved. If this parameter is <b>NULL</b>, the function copies all keys in the given section to the supplied buffer. Each string is followed by a <b>null</b> character, and the final string is followed by a second <b>null</b> character.
     * @param {Pointer<PSTR>} lpDefault A default string. If the <i>lpKeyName</i> key cannot be found in the initialization file, 
     * <b>GetProfileString</b> copies the default string to the <i>lpReturnedString</i> buffer. If this parameter is <b>NULL</b>, the default is an empty string, "". 
     * 
     * 
     * 
     * 
     * Avoid specifying a default string with trailing blank characters. The function inserts a <b>null</b> character in the <i>lpReturnedString</i> buffer to strip any trailing blanks.
     * @param {Pointer<PSTR>} lpReturnedString A pointer to a buffer that receives the character string.
     * @param {Integer} nSize The size of the buffer pointed to by the <i>lpReturnedString</i> parameter, in characters.
     * @returns {Integer} The return value is the number of characters copied to the buffer, not including the <b>null</b>-terminating character.
     * 
     * If neither <i>lpAppName</i> nor <i>lpKeyName</i> is <b>NULL</b> and the supplied destination buffer is too small to hold the requested string, the string is truncated and followed by a <b>null</b> character, and the return value is equal to <i>nSize</i> minus one.
     * 
     * If either <i>lpAppName</i> or <i>lpKeyName</i> is <b>NULL</b> and the supplied destination buffer is too small to hold all the strings, the last string is truncated and followed by two <b>null</b> characters. In this case, the return value is equal to <i>nSize</i> minus two.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getprofilestringa
     * @since windows5.0
     */
    static GetProfileStringA(lpAppName, lpKeyName, lpDefault, lpReturnedString, nSize) {
        result := DllCall("KERNEL32.dll\GetProfileStringA", "ptr", lpAppName, "ptr", lpKeyName, "ptr", lpDefault, "ptr", lpReturnedString, "uint", nSize, "uint")
        return result
    }

    /**
     * Retrieves the string associated with a key in the specified section of the Win.ini file. (Unicode)
     * @remarks
     * If the string associated with the <i>lpKeyName</i> parameter is enclosed in single or double quotation marks, the marks are discarded when the 
     * <b>GetProfileString</b> function returns the string.
     * 
     * The 
     * <b>GetProfileString</b> function is not case-sensitive; the strings can contain a combination of uppercase and lowercase letters.
     * 
     * A section in the Win.ini file must have the following form: 
     * 
     * 
     * ``` syntax
     * [section]
     * key=string
     *       .
     *       .
     *       .
     * ```
     * 
     * An application can use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-getprivateprofilestring">GetPrivateProfileString</a> function to retrieve a string from a specified initialization file.
     * 
     * The <i>lpDefault</i> parameter must point to a valid string, even if the string is empty (that is, even if its first character is a <b>null</b> character).
     * 
     * <b>Windows Server 2003 and Windows XP/2000:  </b>Calls to profile functions may be mapped to the registry instead of to the initialization files. This mapping occurs when the initialization file and section are specified in the registry under the following keys:<p class="note">
     * <b>HKEY_LOCAL_MACHINE</b>&#92;<b>Software</b>&#92;<b>Microsoft</b>&#92;<b>Windows NT</b>&#92;<b>CurrentVersion</b>&#92;<b>IniFileMapping</b>
     * 
     * 
     * 
     * 
     * 
     * When the operation has been mapped, the 
     * <b>GetProfileString</b> function retrieves information from the registry, not from the initialization file; the change in the storage location has no effect on the function's behavior.
     * 
     * The profile functions use the following steps to locate initialization information: 
     * 
     * <ol>
     * <li>Look in the registry for the name of the initialization file  under the <b>IniFileMapping</b> key.</li>
     * <li>Look for the section name specified by <i>lpAppName</i>. This will be a named value under the key that has the name of the initialization file, or a subkey with this name, or the name will not exist as either a value or subkey.</li>
     * <li>If the section name specified by <i>lpAppName</i> is a named value, then that value specifies where in the registry you will find the keys for the section.</li>
     * <li>If the section name specified by <i>lpAppName</i> is a subkey, then named values under that subkey specify where in the registry you will find the keys for the section. If the key you are looking for does not exist as a named value, then there will be an unnamed value (shown as <b>&lt;No Name&gt;</b>) that specifies the default location in the registry where you will find the key.</li>
     * <li>If the section name specified by <i>lpAppName</i> does not exist as a named value or as a subkey, then there will be an unnamed value (shown as <b>&lt;No Name&gt;</b>) that specifies the default location in the registry where you will find the keys for the section.</li>
     * <li>If there is no subkey or entry for the section name, then look for the actual initialization file on the disk and read its contents.</li>
     * </ol>
     * When looking at values in the registry that specify other registry locations, there are several prefixes that change the behavior of the .ini file mapping: 
     * 
     * <ul>
     * <li>! - this character forces all writes to go both to the registry and to the .ini file on disk.</li>
     * <li># - this character causes the registry value to be set to the value in the Windows 3.1 .ini file when a new user logs in for the first time after setup.</li>
     * <li>@ - this character prevents any reads from going to the .ini file on disk if the requested data is not found in the registry.</li>
     * <li>USR: - this prefix stands for <b>HKEY_CURRENT_USER</b>, and the text after the prefix is relative to that key.</li>
     * <li>SYS: - this prefix stands for <b>HKEY_LOCAL_MACHINE\SOFTWARE</b>, and the text after the prefix is relative to that key.</li>
     * </ul>
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winbase.h header defines GetProfileString as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<PWSTR>} lpAppName The name of the section containing the key. If this parameter is <b>NULL</b>, the function copies all section names in the file to the supplied buffer.
     * @param {Pointer<PWSTR>} lpKeyName The name of the key whose associated string is to be retrieved. If this parameter is <b>NULL</b>, the function copies all keys in the given section to the supplied buffer. Each string is followed by a <b>null</b> character, and the final string is followed by a second <b>null</b> character.
     * @param {Pointer<PWSTR>} lpDefault A default string. If the <i>lpKeyName</i> key cannot be found in the initialization file, 
     * <b>GetProfileString</b> copies the default string to the <i>lpReturnedString</i> buffer. If this parameter is <b>NULL</b>, the default is an empty string, "". 
     * 
     * 
     * 
     * 
     * Avoid specifying a default string with trailing blank characters. The function inserts a <b>null</b> character in the <i>lpReturnedString</i> buffer to strip any trailing blanks.
     * @param {Pointer<PWSTR>} lpReturnedString A pointer to a buffer that receives the character string.
     * @param {Integer} nSize The size of the buffer pointed to by the <i>lpReturnedString</i> parameter, in characters.
     * @returns {Integer} The return value is the number of characters copied to the buffer, not including the <b>null</b>-terminating character.
     * 
     * If neither <i>lpAppName</i> nor <i>lpKeyName</i> is <b>NULL</b> and the supplied destination buffer is too small to hold the requested string, the string is truncated and followed by a <b>null</b> character, and the return value is equal to <i>nSize</i> minus one.
     * 
     * If either <i>lpAppName</i> or <i>lpKeyName</i> is <b>NULL</b> and the supplied destination buffer is too small to hold all the strings, the last string is truncated and followed by two <b>null</b> characters. In this case, the return value is equal to <i>nSize</i> minus two.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getprofilestringw
     * @since windows5.0
     */
    static GetProfileStringW(lpAppName, lpKeyName, lpDefault, lpReturnedString, nSize) {
        result := DllCall("KERNEL32.dll\GetProfileStringW", "ptr", lpAppName, "ptr", lpKeyName, "ptr", lpDefault, "ptr", lpReturnedString, "uint", nSize, "uint")
        return result
    }

    /**
     * Copies a string into the specified section of the Win.ini file. (ANSI)
     * @remarks
     * A section in the Win.ini file must have the following form: <i>key</i>=<i>string</i>.
     * 
     * The system keeps a cached version of the most recent registry file mapping to improve performance. If all parameters are <b>NULL</b>, the function flushes the cache. While the system is editing the cached version of the file, processes that edit the file itself will use the original file until the cache has been cleared.
     * 
     * The system maps most .ini file references to the registry, using the mapping defined under the following registry key: <pre><b>HKEY_LOCAL_MACHINE</b>
     *    <b>SOFTWARE</b>
     *       <b>Microsoft</b>
     *          <b>Windows NT</b>
     *             <b>CurrentVersion</b>
     *                <b>IniFileMapping</b></pre>
     * 
     * 
     * When the operation has been mapped, the 
     * <b>WriteProfileString</b> function writes information to the registry, not to the initialization file; the change in the storage location has no effect on the function's behavior.
     * 
     * The profile functions use the following steps to locate initialization information:
     * 
     * <ol>
     * <li>Look in the registry for the name of the initialization file  under the <b>IniFileMapping</b> key.</li>
     * <li>Look for the section name specified by <i>lpAppName</i>. This will be a named value under the key that has the name of the initialization file, or a subkey with this name, or the name will not exist as either a value or subkey.</li>
     * <li>If the section name specified by <i>lpAppName</i> is a named value, then that value specifies where in the registry you will find the keys for the section.</li>
     * <li>If the section name specified by <i>lpAppName</i> is a subkey, then named values under that subkey specify where in the registry you will find the keys for the section. If the key you are looking for does not exist as a named value, then there will be an unnamed value (shown as <b>&lt;No Name&gt;</b>) that specifies the default location in the registry where you will find the key.</li>
     * <li>If the section name specified by <i>lpAppName</i> does not exist as a named value or as a subkey, then there will be an unnamed value (shown as <b>&lt;No Name&gt;</b>) that specifies the default location in the registry where you will find the keys for the section.</li>
     * <li>If there is no subkey or entry for the section name, then look for the actual initialization file on the disk and read its contents.</li>
     * </ol>
     * When looking at values in the registry that specify other registry locations, there are several prefixes that change the behavior of the .ini file mapping:
     * 
     * <ul>
     * <li>! - this character forces all writes to go both to the registry and to the .ini file on disk.</li>
     * <li># - this character causes the registry value to be set to the value in the Windows 3.1 .ini file when a new user logs in for the first time after setup.</li>
     * <li>@ - this character prevents any reads from going to the .ini file on disk if the requested data is not found in the registry.</li>
     * <li>USR: - this prefix stands for <b>HKEY_CURRENT_USER</b>, and the text after the prefix is relative to that key.</li>
     * <li>SYS: - this prefix stands for <b>HKEY_LOCAL_MACHINE\SOFTWARE</b>, and the text after the prefix is relative to that key.</li>
     * </ul>
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winbase.h header defines WriteProfileString as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<PSTR>} lpAppName The section to which the string is to be copied. If the section does not exist, it is created. The name of the section is not case-sensitive; the string can be any combination of uppercase and lowercase letters.
     * @param {Pointer<PSTR>} lpKeyName The key to be associated with the string. If the key does not exist in the specified section, it is created. If this parameter is <b>NULL</b>, the entire section, including all entries in the section, is deleted.
     * @param {Pointer<PSTR>} lpString A <b>null</b>-terminated string to be written to the file. If this parameter is <b>NULL</b>, the key pointed to by the <i>lpKeyName</i> parameter is deleted.
     * @returns {Integer} If the function successfully copies the string to the Win.ini file, the return value is nonzero.
     * 
     * If the function fails, or if it flushes the cached version of Win.ini, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-writeprofilestringa
     * @since windows5.0
     */
    static WriteProfileStringA(lpAppName, lpKeyName, lpString) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\WriteProfileStringA", "ptr", lpAppName, "ptr", lpKeyName, "ptr", lpString, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Copies a string into the specified section of the Win.ini file. (Unicode)
     * @remarks
     * A section in the Win.ini file must have the following form: <i>key</i>=<i>string</i>.
     * 
     * The system keeps a cached version of the most recent registry file mapping to improve performance. If all parameters are <b>NULL</b>, the function flushes the cache. While the system is editing the cached version of the file, processes that edit the file itself will use the original file until the cache has been cleared.
     * 
     * The system maps most .ini file references to the registry, using the mapping defined under the following registry key: <pre><b>HKEY_LOCAL_MACHINE</b>
     *    <b>SOFTWARE</b>
     *       <b>Microsoft</b>
     *          <b>Windows NT</b>
     *             <b>CurrentVersion</b>
     *                <b>IniFileMapping</b></pre>
     * 
     * 
     * When the operation has been mapped, the 
     * <b>WriteProfileString</b> function writes information to the registry, not to the initialization file; the change in the storage location has no effect on the function's behavior.
     * 
     * The profile functions use the following steps to locate initialization information:
     * 
     * <ol>
     * <li>Look in the registry for the name of the initialization file  under the <b>IniFileMapping</b> key.</li>
     * <li>Look for the section name specified by <i>lpAppName</i>. This will be a named value under the key that has the name of the initialization file, or a subkey with this name, or the name will not exist as either a value or subkey.</li>
     * <li>If the section name specified by <i>lpAppName</i> is a named value, then that value specifies where in the registry you will find the keys for the section.</li>
     * <li>If the section name specified by <i>lpAppName</i> is a subkey, then named values under that subkey specify where in the registry you will find the keys for the section. If the key you are looking for does not exist as a named value, then there will be an unnamed value (shown as <b>&lt;No Name&gt;</b>) that specifies the default location in the registry where you will find the key.</li>
     * <li>If the section name specified by <i>lpAppName</i> does not exist as a named value or as a subkey, then there will be an unnamed value (shown as <b>&lt;No Name&gt;</b>) that specifies the default location in the registry where you will find the keys for the section.</li>
     * <li>If there is no subkey or entry for the section name, then look for the actual initialization file on the disk and read its contents.</li>
     * </ol>
     * When looking at values in the registry that specify other registry locations, there are several prefixes that change the behavior of the .ini file mapping:
     * 
     * <ul>
     * <li>! - this character forces all writes to go both to the registry and to the .ini file on disk.</li>
     * <li># - this character causes the registry value to be set to the value in the Windows 3.1 .ini file when a new user logs in for the first time after setup.</li>
     * <li>@ - this character prevents any reads from going to the .ini file on disk if the requested data is not found in the registry.</li>
     * <li>USR: - this prefix stands for <b>HKEY_CURRENT_USER</b>, and the text after the prefix is relative to that key.</li>
     * <li>SYS: - this prefix stands for <b>HKEY_LOCAL_MACHINE\SOFTWARE</b>, and the text after the prefix is relative to that key.</li>
     * </ul>
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winbase.h header defines WriteProfileString as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<PWSTR>} lpAppName The section to which the string is to be copied. If the section does not exist, it is created. The name of the section is not case-sensitive; the string can be any combination of uppercase and lowercase letters.
     * @param {Pointer<PWSTR>} lpKeyName The key to be associated with the string. If the key does not exist in the specified section, it is created. If this parameter is <b>NULL</b>, the entire section, including all entries in the section, is deleted.
     * @param {Pointer<PWSTR>} lpString A <b>null</b>-terminated string to be written to the file. If this parameter is <b>NULL</b>, the key pointed to by the <i>lpKeyName</i> parameter is deleted.
     * @returns {Integer} If the function successfully copies the string to the Win.ini file, the return value is nonzero.
     * 
     * If the function fails, or if it flushes the cached version of Win.ini, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-writeprofilestringw
     * @since windows5.0
     */
    static WriteProfileStringW(lpAppName, lpKeyName, lpString) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\WriteProfileStringW", "ptr", lpAppName, "ptr", lpKeyName, "ptr", lpString, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves all the keys and values for the specified section of the Win.ini file. (ANSI)
     * @remarks
     * The format of the returned keys and values is one or more null-terminated strings, followed by a final null character. Each string has the following form: <i>key</i>=<i>string</i>
     * 
     * The 
     * <b>GetProfileSection</b> function is not case-sensitive; the strings can be a combination of uppercase and lowercase letters.
     * 
     * This operation is atomic; no updates to the Win.ini file are allowed while the keys and values for the section are being copied to the buffer.
     * 
     * <b>Windows Server 2003 and Windows XP/2000:  </b>Calls to profile functions may be mapped to the registry instead of to the initialization files. This mapping occurs when the initialization file and section are specified in the registry under the following key: <b>HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\IniFileMapping</b>.
     * 
     * When the operation has been mapped, the 
     * <b>GetProfileSection</b> function retrieves information from the registry, not from the initialization file; the change in the storage location has no effect on the function's behavior.
     * 
     * The profile functions use the following steps to locate initialization information:
     * 
     * <ol>
     * <li>Look in the registry for the name of the initialization file  under the <b>IniFileMapping</b> key.</li>
     * <li>Look for the section name specified by <i>lpAppName</i>. This will be a named value under the key that has the name of the initialization file, or a subkey with this name, or the name will not exist as either a value or subkey.</li>
     * <li>If the section name specified by <i>lpAppName</i> is a named value, then that value specifies where in the registry you will find the keys for the section.</li>
     * <li>If the section name specified by <i>lpAppName</i> is a subkey, then named values under that subkey specify where in the registry you will find the keys for the section. If the key you are looking for does not exist as a named value, then there will be an unnamed value (shown as <b>&lt;No Name&gt;</b>) that specifies the default location in the registry where you will find the key.</li>
     * <li>If the section name specified by <i>lpAppName</i> does not exist as a named value or as a subkey, then there will be an unnamed value (shown as <b>&lt;No Name&gt;</b>) that specifies the default location in the registry where you will find the keys for the section.</li>
     * <li>If there is no subkey or entry for the section name, then look for the actual initialization file on the disk and read its contents.</li>
     * </ol>
     * When looking at values in the registry that specify other registry locations, there are several prefixes that change the behavior of the .ini file mapping:
     * 
     * <ul>
     * <li>! - this character forces all writes to go both to the registry and to the .ini file on disk.</li>
     * <li># - this character causes the registry value to be set to the value in the Windows 3.1 .ini file when a new user logs in for the first time after setup.</li>
     * <li>@ - this character prevents any reads from going to the .ini file on disk if the requested data is not found in the registry.</li>
     * <li>USR: - this prefix stands for <b>HKEY_CURRENT_USER</b>, and the text after the prefix is relative to that key.</li>
     * <li>SYS: - this prefix stands for <b>HKEY_LOCAL_MACHINE\SOFTWARE</b>, and the text after the prefix is relative to that key.</li>
     * </ul>
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winbase.h header defines GetProfileSection as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<PSTR>} lpAppName The name of the section in the Win.ini file.
     * @param {Pointer<PSTR>} lpReturnedString A pointer to a buffer that receives the keys and values associated with the named section. The buffer is filled with one or more null-terminated strings; the last string is followed by a second null character.
     * @param {Integer} nSize The size of the buffer pointed to by the <i>lpReturnedString</i> parameter, in characters. 
     * 
     * 
     *  
     * 
     * 
     * The maximum profile section size is 32,767 characters.
     * @returns {Integer} The return value specifies the number of characters copied to the specified buffer, not including the terminating null character. If the buffer is not large enough to contain all the keys and values associated with the named section, the return value is equal to the size specified by <i>nSize</i> minus two.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getprofilesectiona
     * @since windows5.0
     */
    static GetProfileSectionA(lpAppName, lpReturnedString, nSize) {
        result := DllCall("KERNEL32.dll\GetProfileSectionA", "ptr", lpAppName, "ptr", lpReturnedString, "uint", nSize, "uint")
        return result
    }

    /**
     * Retrieves all the keys and values for the specified section of the Win.ini file. (Unicode)
     * @remarks
     * The format of the returned keys and values is one or more null-terminated strings, followed by a final null character. Each string has the following form: <i>key</i>=<i>string</i>
     * 
     * The 
     * <b>GetProfileSection</b> function is not case-sensitive; the strings can be a combination of uppercase and lowercase letters.
     * 
     * This operation is atomic; no updates to the Win.ini file are allowed while the keys and values for the section are being copied to the buffer.
     * 
     * <b>Windows Server 2003 and Windows XP/2000:  </b>Calls to profile functions may be mapped to the registry instead of to the initialization files. This mapping occurs when the initialization file and section are specified in the registry under the following key: <b>HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\IniFileMapping</b>.
     * 
     * When the operation has been mapped, the 
     * <b>GetProfileSection</b> function retrieves information from the registry, not from the initialization file; the change in the storage location has no effect on the function's behavior.
     * 
     * The profile functions use the following steps to locate initialization information:
     * 
     * <ol>
     * <li>Look in the registry for the name of the initialization file  under the <b>IniFileMapping</b> key.</li>
     * <li>Look for the section name specified by <i>lpAppName</i>. This will be a named value under the key that has the name of the initialization file, or a subkey with this name, or the name will not exist as either a value or subkey.</li>
     * <li>If the section name specified by <i>lpAppName</i> is a named value, then that value specifies where in the registry you will find the keys for the section.</li>
     * <li>If the section name specified by <i>lpAppName</i> is a subkey, then named values under that subkey specify where in the registry you will find the keys for the section. If the key you are looking for does not exist as a named value, then there will be an unnamed value (shown as <b>&lt;No Name&gt;</b>) that specifies the default location in the registry where you will find the key.</li>
     * <li>If the section name specified by <i>lpAppName</i> does not exist as a named value or as a subkey, then there will be an unnamed value (shown as <b>&lt;No Name&gt;</b>) that specifies the default location in the registry where you will find the keys for the section.</li>
     * <li>If there is no subkey or entry for the section name, then look for the actual initialization file on the disk and read its contents.</li>
     * </ol>
     * When looking at values in the registry that specify other registry locations, there are several prefixes that change the behavior of the .ini file mapping:
     * 
     * <ul>
     * <li>! - this character forces all writes to go both to the registry and to the .ini file on disk.</li>
     * <li># - this character causes the registry value to be set to the value in the Windows 3.1 .ini file when a new user logs in for the first time after setup.</li>
     * <li>@ - this character prevents any reads from going to the .ini file on disk if the requested data is not found in the registry.</li>
     * <li>USR: - this prefix stands for <b>HKEY_CURRENT_USER</b>, and the text after the prefix is relative to that key.</li>
     * <li>SYS: - this prefix stands for <b>HKEY_LOCAL_MACHINE\SOFTWARE</b>, and the text after the prefix is relative to that key.</li>
     * </ul>
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winbase.h header defines GetProfileSection as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<PWSTR>} lpAppName The name of the section in the Win.ini file.
     * @param {Pointer<PWSTR>} lpReturnedString A pointer to a buffer that receives the keys and values associated with the named section. The buffer is filled with one or more null-terminated strings; the last string is followed by a second null character.
     * @param {Integer} nSize The size of the buffer pointed to by the <i>lpReturnedString</i> parameter, in characters. 
     * 
     * 
     *  
     * 
     * 
     * The maximum profile section size is 32,767 characters.
     * @returns {Integer} The return value specifies the number of characters copied to the specified buffer, not including the terminating null character. If the buffer is not large enough to contain all the keys and values associated with the named section, the return value is equal to the size specified by <i>nSize</i> minus two.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getprofilesectionw
     * @since windows5.0
     */
    static GetProfileSectionW(lpAppName, lpReturnedString, nSize) {
        result := DllCall("KERNEL32.dll\GetProfileSectionW", "ptr", lpAppName, "ptr", lpReturnedString, "uint", nSize, "uint")
        return result
    }

    /**
     * Replaces the contents of the specified section in the Win.ini file with specified keys and values. (ANSI)
     * @remarks
     * Keys and values in the <i>lpString</i> buffer consist of one or more <b>null</b>-terminated strings, followed by a final <b>null</b> character. Each string has the following form: <i>key</i>=<i>string</i>.
     * 
     * The 
     * <b>WriteProfileSection</b> function is not case-sensitive; the strings can be a combination of uppercase and lowercase letters.
     * 
     * <b>WriteProfileSection</b> deletes the existing keys and values for the named section and inserts the key names and values in the buffer pointed to by <i>lpString</i>. The function does not attempt to correlate old and new key names; if the new names appear in a different order from the old names, any comments associated with preexisting keys and values in the initialization file will probably be associated with incorrect keys and values.
     * 
     * This operation is atomic; no other operations that read from or write to the initialization file are allowed while the information is being written.
     * 
     * The system keeps a cached version of the most recent registry file mapping to improve performance. If all parameters are <b>NULL</b>, the function flushes the cache. While the system is editing the cached version of the file, processes that edit the file itself will use the original file until the cache has been cleared.
     * 
     * The system maps most .ini file references to the registry, using the mapping defined under the following registry key: <pre><b>HKEY_LOCAL_MACHINE</b>
     *    <b>SOFTWARE</b>
     *       <b>Microsoft</b>
     *          <b>Windows NT</b>
     *             <b>CurrentVersion</b>
     *                <b>IniFileMapping</b></pre>
     * 
     * 
     * When the operation has been mapped, the 
     * <b>WriteProfileSection</b> function writes information to the registry, not to the initialization file; the change in the storage location has no effect on the function's behavior.
     * 
     * The profile functions use the following steps to locate initialization information:
     * 
     * <ol>
     * <li>Look in the registry for the name of the initialization file  under the <b>IniFileMapping</b> key.</li>
     * <li>Look for the section name specified by <i>lpAppName</i>. This will be a named value under the key that has the name of the initialization file, or a subkey with this name, or the name will not exist as either a value or subkey.</li>
     * <li>If the section name specified by <i>lpAppName</i> is a named value, then that value specifies where in the registry you will find the keys for the section.</li>
     * <li>If the section name specified by <i>lpAppName</i> is a subkey, then named values under that subkey specify where in the registry you will find the keys for the section. If the key you are looking for does not exist as a named value, then there will be an unnamed value (shown as <b>&lt;No Name&gt;</b>) that specifies the default location in the registry where you will find the key.</li>
     * <li>If the section name specified by <i>lpAppName</i> does not exist as a named value or as a subkey, then there will be an unnamed value (shown as <b>&lt;No Name&gt;</b>) that specifies the default location in the registry where you will find the keys for the section.</li>
     * <li>If there is no subkey or entry for the section name, then look for the actual initialization file on the disk and read its contents.</li>
     * </ol>
     * When looking at values in the registry that specify other registry locations, there are several prefixes that change the behavior of the .ini file mapping:
     * 
     * <ul>
     * <li>! - this character forces all writes to go both to the registry and to the .ini file on disk.</li>
     * <li># - this character causes the registry value to be set to the value in the Windows 3.1 .ini file when a new user logs in for the first time after setup.</li>
     * <li>@ - this character prevents any reads from going to the .ini file on disk if the requested data is not found in the registry.</li>
     * <li>USR: - this prefix stands for <b>HKEY_CURRENT_USER</b>, and the text after the prefix is relative to that key.</li>
     * <li>SYS: - this prefix stands for <b>HKEY_LOCAL_MACHINE\SOFTWARE</b>, and the text after the prefix is relative to that key.</li>
     * </ul>
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winbase.h header defines WriteProfileSection as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<PSTR>} lpAppName The name of the section. This section name is typically the name of the calling application.
     * @param {Pointer<PSTR>} lpString The new key names and associated values that are to be written to the named section. This string is limited to 65,535 bytes.
     * 
     * If the file exists and was created using Unicode characters, the function writes Unicode characters to the file. Otherwise, the function creates a file using ANSI characters.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-writeprofilesectiona
     * @since windows5.0
     */
    static WriteProfileSectionA(lpAppName, lpString) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\WriteProfileSectionA", "ptr", lpAppName, "ptr", lpString, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Replaces the contents of the specified section in the Win.ini file with specified keys and values. (Unicode)
     * @remarks
     * Keys and values in the <i>lpString</i> buffer consist of one or more <b>null</b>-terminated strings, followed by a final <b>null</b> character. Each string has the following form: <i>key</i>=<i>string</i>.
     * 
     * The 
     * <b>WriteProfileSection</b> function is not case-sensitive; the strings can be a combination of uppercase and lowercase letters.
     * 
     * <b>WriteProfileSection</b> deletes the existing keys and values for the named section and inserts the key names and values in the buffer pointed to by <i>lpString</i>. The function does not attempt to correlate old and new key names; if the new names appear in a different order from the old names, any comments associated with preexisting keys and values in the initialization file will probably be associated with incorrect keys and values.
     * 
     * This operation is atomic; no other operations that read from or write to the initialization file are allowed while the information is being written.
     * 
     * The system keeps a cached version of the most recent registry file mapping to improve performance. If all parameters are <b>NULL</b>, the function flushes the cache. While the system is editing the cached version of the file, processes that edit the file itself will use the original file until the cache has been cleared.
     * 
     * The system maps most .ini file references to the registry, using the mapping defined under the following registry key: <pre><b>HKEY_LOCAL_MACHINE</b>
     *    <b>SOFTWARE</b>
     *       <b>Microsoft</b>
     *          <b>Windows NT</b>
     *             <b>CurrentVersion</b>
     *                <b>IniFileMapping</b></pre>
     * 
     * 
     * When the operation has been mapped, the 
     * <b>WriteProfileSection</b> function writes information to the registry, not to the initialization file; the change in the storage location has no effect on the function's behavior.
     * 
     * The profile functions use the following steps to locate initialization information:
     * 
     * <ol>
     * <li>Look in the registry for the name of the initialization file  under the <b>IniFileMapping</b> key.</li>
     * <li>Look for the section name specified by <i>lpAppName</i>. This will be a named value under the key that has the name of the initialization file, or a subkey with this name, or the name will not exist as either a value or subkey.</li>
     * <li>If the section name specified by <i>lpAppName</i> is a named value, then that value specifies where in the registry you will find the keys for the section.</li>
     * <li>If the section name specified by <i>lpAppName</i> is a subkey, then named values under that subkey specify where in the registry you will find the keys for the section. If the key you are looking for does not exist as a named value, then there will be an unnamed value (shown as <b>&lt;No Name&gt;</b>) that specifies the default location in the registry where you will find the key.</li>
     * <li>If the section name specified by <i>lpAppName</i> does not exist as a named value or as a subkey, then there will be an unnamed value (shown as <b>&lt;No Name&gt;</b>) that specifies the default location in the registry where you will find the keys for the section.</li>
     * <li>If there is no subkey or entry for the section name, then look for the actual initialization file on the disk and read its contents.</li>
     * </ol>
     * When looking at values in the registry that specify other registry locations, there are several prefixes that change the behavior of the .ini file mapping:
     * 
     * <ul>
     * <li>! - this character forces all writes to go both to the registry and to the .ini file on disk.</li>
     * <li># - this character causes the registry value to be set to the value in the Windows 3.1 .ini file when a new user logs in for the first time after setup.</li>
     * <li>@ - this character prevents any reads from going to the .ini file on disk if the requested data is not found in the registry.</li>
     * <li>USR: - this prefix stands for <b>HKEY_CURRENT_USER</b>, and the text after the prefix is relative to that key.</li>
     * <li>SYS: - this prefix stands for <b>HKEY_LOCAL_MACHINE\SOFTWARE</b>, and the text after the prefix is relative to that key.</li>
     * </ul>
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winbase.h header defines WriteProfileSection as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<PWSTR>} lpAppName The name of the section. This section name is typically the name of the calling application.
     * @param {Pointer<PWSTR>} lpString The new key names and associated values that are to be written to the named section. This string is limited to 65,535 bytes.
     * 
     * If the file exists and was created using Unicode characters, the function writes Unicode characters to the file. Otherwise, the function creates a file using ANSI characters.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-writeprofilesectionw
     * @since windows5.0
     */
    static WriteProfileSectionW(lpAppName, lpString) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\WriteProfileSectionW", "ptr", lpAppName, "ptr", lpString, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves an integer associated with a key in the specified section of an initialization file. (GetPrivateProfileIntA)
     * @remarks
     * The function searches the file for a key that matches the name specified by the <i>lpKeyName</i> parameter under the section name specified by the <i>lpAppName</i> parameter. A section in the initialization file must have the following form:
     * 
     * 
     * ``` syntax
     * [section]
     * key=value
     *       .
     *       .
     *       .
     * ```
     * 
     * The 
     * <b>GetPrivateProfileInt</b> function is not case-sensitive; the strings in <i>lpAppName</i> and <i>lpKeyName</i> can be a combination of uppercase and lowercase letters.
     * 
     * An application can use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-getprofileinta">GetProfileInt</a> function to retrieve an integer value from the Win.ini file.
     * 
     * The system maps most .ini file references to the registry, using the mapping defined under the following registry key:<b>HKEY_LOCAL_MACHINE</b>&#92;<b>SOFTWARE</b>&#92;<b>Microsoft</b>&#92;<b>Windows NT</b>&#92;<b>CurrentVersion</b>&#92;<b>IniFileMapping</b>
     * 
     * 
     * 
     * This mapping is likely if an application modifies system-component initialization files, such as Control.ini, System.ini, and Winfile.ini. In these cases, the 
     * function retrieves information from the registry, not from the initialization file; the change in the storage location has no effect on the function's behavior.
     * 
     * The profile functions use the following steps to locate initialization information:
     * 
     * <ol>
     * <li>Look in the registry for the name of the initialization file  under the <b>IniFileMapping</b> key.</li>
     * <li>Look for the section name specified by <i>lpAppName</i>. This will be a named value under the key that has the name of the initialization file, or a subkey with this name, or the name will not exist as either a value or subkey.</li>
     * <li>If the section name specified by <i>lpAppName</i> is a named value, then that value specifies where in the registry you will find the keys for the section.</li>
     * <li>If the section name specified by <i>lpAppName</i> is a subkey, then named values under that subkey specify where in the registry you will find the keys for the section. If the key you are looking for does not exist as a named value, then there will be an unnamed value (shown as <b>&lt;No Name&gt;</b>) that specifies the default location in the registry where you will find the key.</li>
     * <li>If the section name specified by <i>lpAppName</i> does not exist as a named value or as a subkey, then there will be an unnamed value (shown as <b>&lt;No Name&gt;</b>) that specifies the default location in the registry where you will find the keys for the section.</li>
     * <li>If there is no subkey or entry for the section name, then look for the actual initialization file on the disk and read its contents.</li>
     * </ol>
     * When looking at values in the registry that specify other registry locations, there are several prefixes that change the behavior of the .ini file mapping:
     * 
     * <ul>
     * <li>! - this character forces all writes to go both to the registry and to the .ini file on disk.</li>
     * <li># - this character causes the registry value to be set to the value in the Windows 3.1 .ini file when a new user logs in for the first time after setup.</li>
     * <li>@ - this character prevents any reads from going to the .ini file on disk if the requested data is not found in the registry.</li>
     * <li>USR: - this prefix stands for <b>HKEY_CURRENT_USER</b>, and the text after the prefix is relative to that key.</li>
     * <li>SYS: - this prefix stands for <b>HKEY_LOCAL_MACHINE\SOFTWARE</b>, and the text after the prefix is relative to that key.</li>
     * </ul>
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winbase.h header defines GetPrivateProfileInt as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<PSTR>} lpAppName The name of the section in the initialization file.
     * @param {Pointer<PSTR>} lpKeyName The name of the key whose value is to be retrieved. This value is in the form of a string; the 
     * <b>GetPrivateProfileInt</b> function converts the string into an integer and returns the integer.
     * @param {Integer} nDefault The default value to return if the key name cannot be found in the initialization file.
     * @param {Pointer<PSTR>} lpFileName The name of the initialization file. If this parameter does not contain a full path to the file, the system searches for the file in the Windows directory.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getprivateprofileinta
     * @since windows5.0
     */
    static GetPrivateProfileIntA(lpAppName, lpKeyName, nDefault, lpFileName) {
        DllCall("KERNEL32.dll\GetPrivateProfileIntA", "ptr", lpAppName, "ptr", lpKeyName, "int", nDefault, "ptr", lpFileName)
    }

    /**
     * The GetPrivateProfileIntW (Unicode) function (winbase.h) retrieves an integer associated with a key in the specified section of an initialization file.
     * @remarks
     * The function searches the file for a key that matches the name specified by the <i>lpKeyName</i> parameter under the section name specified by the <i>lpAppName</i> parameter. A section in the initialization file must have the following form:
     * 
     * 
     * ``` syntax
     * [section]
     * key=value
     *       .
     *       .
     *       .
     * ```
     * 
     * The 
     * <b>GetPrivateProfileInt</b> function is not case-sensitive; the strings in <i>lpAppName</i> and <i>lpKeyName</i> can be a combination of uppercase and lowercase letters.
     * 
     * An application can use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-getprofileinta">GetProfileInt</a> function to retrieve an integer value from the Win.ini file.
     * 
     * The system maps most .ini file references to the registry, using the mapping defined under the following registry key:<b>HKEY_LOCAL_MACHINE</b>&#92;<b>SOFTWARE</b>&#92;<b>Microsoft</b>&#92;<b>Windows NT</b>&#92;<b>CurrentVersion</b>&#92;<b>IniFileMapping</b>
     * 
     * 
     * 
     * This mapping is likely if an application modifies system-component initialization files, such as Control.ini, System.ini, and Winfile.ini. In these cases, the 
     * function retrieves information from the registry, not from the initialization file; the change in the storage location has no effect on the function's behavior.
     * 
     * The profile functions use the following steps to locate initialization information:
     * 
     * <ol>
     * <li>Look in the registry for the name of the initialization file  under the <b>IniFileMapping</b> key.</li>
     * <li>Look for the section name specified by <i>lpAppName</i>. This will be a named value under the key that has the name of the initialization file, or a subkey with this name, or the name will not exist as either a value or subkey.</li>
     * <li>If the section name specified by <i>lpAppName</i> is a named value, then that value specifies where in the registry you will find the keys for the section.</li>
     * <li>If the section name specified by <i>lpAppName</i> is a subkey, then named values under that subkey specify where in the registry you will find the keys for the section. If the key you are looking for does not exist as a named value, then there will be an unnamed value (shown as <b>&lt;No Name&gt;</b>) that specifies the default location in the registry where you will find the key.</li>
     * <li>If the section name specified by <i>lpAppName</i> does not exist as a named value or as a subkey, then there will be an unnamed value (shown as <b>&lt;No Name&gt;</b>) that specifies the default location in the registry where you will find the keys for the section.</li>
     * <li>If there is no subkey or entry for the section name, then look for the actual initialization file on the disk and read its contents.</li>
     * </ol>
     * When looking at values in the registry that specify other registry locations, there are several prefixes that change the behavior of the .ini file mapping:
     * 
     * <ul>
     * <li>! - this character forces all writes to go both to the registry and to the .ini file on disk.</li>
     * <li># - this character causes the registry value to be set to the value in the Windows 3.1 .ini file when a new user logs in for the first time after setup.</li>
     * <li>@ - this character prevents any reads from going to the .ini file on disk if the requested data is not found in the registry.</li>
     * <li>USR: - this prefix stands for <b>HKEY_CURRENT_USER</b>, and the text after the prefix is relative to that key.</li>
     * <li>SYS: - this prefix stands for <b>HKEY_LOCAL_MACHINE\SOFTWARE</b>, and the text after the prefix is relative to that key.</li>
     * </ul>
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winbase.h header defines GetPrivateProfileInt as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<PWSTR>} lpAppName The name of the section in the initialization file.
     * @param {Pointer<PWSTR>} lpKeyName The name of the key whose value is to be retrieved. This value is in the form of a string; the 
     * <b>GetPrivateProfileInt</b> function converts the string into an integer and returns the integer.
     * @param {Integer} nDefault The default value to return if the key name cannot be found in the initialization file.
     * @param {Pointer<PWSTR>} lpFileName The name of the initialization file. If this parameter does not contain a full path to the file, the system searches for the file in the Windows directory.
     * @returns {Integer} The return value is the integer equivalent of the string following the specified key name in the specified initialization file. If the key is not found, the return value is the specified default value.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getprivateprofileintw
     * @since windows5.0
     */
    static GetPrivateProfileIntW(lpAppName, lpKeyName, nDefault, lpFileName) {
        result := DllCall("KERNEL32.dll\GetPrivateProfileIntW", "ptr", lpAppName, "ptr", lpKeyName, "int", nDefault, "ptr", lpFileName, "int")
        return result
    }

    /**
     * Retrieves a string from the specified section in an initialization file. (GetPrivateProfileStringA)
     * @remarks
     * The 
     * <b>GetPrivateProfileString</b> function searches the specified initialization file for a key that matches the name specified by the <i>lpKeyName</i> parameter under the section heading specified by the <i>lpAppName</i> parameter. If it finds the key, the function copies the corresponding string to the buffer. If the key does not exist, the function copies the default character string specified by the <i>lpDefault</i> parameter. A section in the initialization file must have the following form:
     * 				
     * 			
     * 
     * 
     * ``` syntax
     * [section]
     * key=string
     *       .
     *       .
     *       .
     * ```
     * 
     * If <i>lpAppName</i> is <b>NULL</b>, 
     * <b>GetPrivateProfileString</b> copies all section names in the specified file to the supplied buffer. If <i>lpKeyName</i> is <b>NULL</b>, the function copies all key names in the specified section to the supplied buffer. An application can use this method to enumerate all of the sections and keys in a file. In either case, each string is followed by a <b>null</b> character and the final string is followed by a second <b>null</b> character. If the supplied destination buffer is too small to hold all the strings, the last string is truncated and followed by two <b>null</b> characters.
     * 
     * If the string associated with <i>lpKeyName</i> is enclosed in single or double quotation marks, the marks are discarded when the 
     * <b>GetPrivateProfileString</b> function retrieves the string.
     * 
     * The 
     * <b>GetPrivateProfileString</b> function is not case-sensitive; the strings can be a combination of uppercase and lowercase letters.
     * 
     * To retrieve a string from the Win.ini file, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-getprofilestringa">GetProfileString</a> function.
     * 
     * The system maps most .ini file references to the registry, using the mapping defined under the following registry key:<b>HKEY_LOCAL_MACHINE</b>&#92;<b>SOFTWARE</b>&#92;<b>Microsoft</b>&#92;<b>Windows NT</b>&#92;<b>CurrentVersion</b>&#92;<b>IniFileMapping</b>
     * 
     * 
     * 
     * This mapping is likely if an application modifies system-component initialization files, such as Control.ini, System.ini, and Winfile.ini. In these cases, the 
     * function retrieves information from the registry, not from the initialization file; the change in the storage location has no effect on the function's behavior.
     * 
     * The profile functions use the following steps to locate initialization information:
     * 
     * <ol>
     * <li>Look in the registry for the name of the initialization file  under the <b>IniFileMapping</b> key.</li>
     * <li>Look for the section name specified by <i>lpAppName</i>. This will be a named value under the key that has the name of the initialization file, or a subkey with this name, or the name will not exist as either a value or subkey.</li>
     * <li>If the section name specified by <i>lpAppName</i> is a named value, then that value specifies where in the registry you will find the keys for the section.</li>
     * <li>If the section name specified by <i>lpAppName</i> is a subkey, then named values under that subkey specify where in the registry you will find the keys for the section. If the key you are looking for does not exist as a named value, then there will be an unnamed value (shown as <b>&lt;No Name&gt;</b>) that specifies the default location in the registry where you will find the key.</li>
     * <li>If the section name specified by <i>lpAppName</i> does not exist as a named value or as a subkey, then there will be an unnamed value (shown as <b>&lt;No Name&gt;</b>) that specifies the default location in the registry where you will find the keys for the section.</li>
     * <li>If there is no subkey or entry for the section name, then look for the actual initialization file on the disk and read its contents.</li>
     * </ol>
     * When looking at values in the registry that specify other registry locations, there are several prefixes that change the behavior of the .ini file mapping:
     * 
     * <ul>
     * <li>! - this character forces all writes to go both to the registry and to the .ini file on disk.</li>
     * <li># - this character causes the registry value to be set to the value in the Windows 3.1 .ini file when a new user logs in for the first time after setup.</li>
     * <li>@ - this character prevents any reads from going to the .ini file on disk if the requested data is not found in the registry.</li>
     * <li>USR: - this prefix stands for <b>HKEY_CURRENT_USER</b>, and the text after the prefix is relative to that key.</li>
     * <li>SYS: - this prefix stands for <b>HKEY_LOCAL_MACHINE\SOFTWARE</b>, and the text after the prefix is relative to that key.</li>
     * </ul>
     * @param {Pointer<PSTR>} lpAppName The name of the section containing the key name. If this parameter is <b>NULL</b>, the 
     * <b>GetPrivateProfileString</b> function copies all section names in the file to the supplied buffer.
     * @param {Pointer<PSTR>} lpKeyName The name of the key whose associated string is to be retrieved. If this parameter is <b>NULL</b>, all key names in the section specified by the <i>lpAppName</i> parameter are copied to the buffer specified by the <i>lpReturnedString</i> parameter.
     * @param {Pointer<PSTR>} lpDefault A default string. If the <i>lpKeyName</i> key cannot be found in the initialization file, 
     * <b>GetPrivateProfileString</b> copies the default string to the <i>lpReturnedString</i> buffer.  
     * 
     * 
     * If this parameter is <b>NULL</b>, the default is an empty string, "".
     * 
     * Avoid specifying a default string with trailing blank characters. The function inserts a <b>null</b> character in the <i>lpReturnedString</i> buffer to strip any trailing blanks.
     * @param {Pointer<PSTR>} lpReturnedString A pointer to the buffer that receives the retrieved string.
     * @param {Integer} nSize The size of the buffer pointed to by the <i>lpReturnedString</i> parameter, in characters.
     * @param {Pointer<PSTR>} lpFileName The name of the initialization file. If this parameter does not contain a full path to the file, the system searches for the file in the Windows directory.
     * @returns {Integer} The return value is the number of characters copied to the buffer, not including the terminating <b>null</b> character.
     * 
     * If neither <i>lpAppName</i> nor <i>lpKeyName</i> is <b>NULL</b> and the supplied destination buffer is too small to hold the requested string, the string is truncated and followed by a <b>null</b> character, and the return value is equal to <i>nSize</i> minus one.
     * 
     * If either <i>lpAppName</i> or <i>lpKeyName</i> is <b>NULL</b> and the supplied destination buffer is too small to hold all the strings, the last string is truncated and followed by two <b>null</b> characters. In this case, the return value is equal to <i>nSize</i> minus two.
     * 
     * In the event the initialization file specified by <i>lpFileName</i> is not found, or contains invalid values, this function will set <b>errorno</b> with a value of '0x2' (File Not Found). To retrieve extended error information, call <a href="https://docs.microsoft.com/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getprivateprofilestringa
     * @since windows5.0
     */
    static GetPrivateProfileStringA(lpAppName, lpKeyName, lpDefault, lpReturnedString, nSize, lpFileName) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetPrivateProfileStringA", "ptr", lpAppName, "ptr", lpKeyName, "ptr", lpDefault, "ptr", lpReturnedString, "uint", nSize, "ptr", lpFileName, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The GetPrivateProfileStringW (Unicode) function (winbase.h) retrieves a string from the specified section in an initialization file.
     * @remarks
     * The 
     * <b>GetPrivateProfileString</b> function searches the specified initialization file for a key that matches the name specified by the <i>lpKeyName</i> parameter under the section heading specified by the <i>lpAppName</i> parameter. If it finds the key, the function copies the corresponding string to the buffer. If the key does not exist, the function copies the default character string specified by the <i>lpDefault</i> parameter. A section in the initialization file must have the following form:
     * 				
     * 			
     * 
     * 
     * ``` syntax
     * [section]
     * key=string
     *       .
     *       .
     *       .
     * ```
     * 
     * If <i>lpAppName</i> is <b>NULL</b>, 
     * <b>GetPrivateProfileString</b> copies all section names in the specified file to the supplied buffer. If <i>lpKeyName</i> is <b>NULL</b>, the function copies all key names in the specified section to the supplied buffer. An application can use this method to enumerate all of the sections and keys in a file. In either case, each string is followed by a <b>null</b> character and the final string is followed by a second <b>null</b> character. If the supplied destination buffer is too small to hold all the strings, the last string is truncated and followed by two <b>null</b> characters.
     * 
     * If the string associated with <i>lpKeyName</i> is enclosed in single or double quotation marks, the marks are discarded when the 
     * <b>GetPrivateProfileString</b> function retrieves the string.
     * 
     * The 
     * <b>GetPrivateProfileString</b> function is not case-sensitive; the strings can be a combination of uppercase and lowercase letters.
     * 
     * To retrieve a string from the Win.ini file, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-getprofilestringa">GetProfileString</a> function.
     * 
     * The system maps most .ini file references to the registry, using the mapping defined under the following registry key:<b>HKEY_LOCAL_MACHINE</b>&#92;<b>SOFTWARE</b>&#92;<b>Microsoft</b>&#92;<b>Windows NT</b>&#92;<b>CurrentVersion</b>&#92;<b>IniFileMapping</b>
     * 
     * 
     * 
     * This mapping is likely if an application modifies system-component initialization files, such as Control.ini, System.ini, and Winfile.ini. In these cases, the 
     * function retrieves information from the registry, not from the initialization file; the change in the storage location has no effect on the function's behavior.
     * 
     * The profile functions use the following steps to locate initialization information:
     * 
     * <ol>
     * <li>Look in the registry for the name of the initialization file  under the <b>IniFileMapping</b> key.</li>
     * <li>Look for the section name specified by <i>lpAppName</i>. This will be a named value under the key that has the name of the initialization file, or a subkey with this name, or the name will not exist as either a value or subkey.</li>
     * <li>If the section name specified by <i>lpAppName</i> is a named value, then that value specifies where in the registry you will find the keys for the section.</li>
     * <li>If the section name specified by <i>lpAppName</i> is a subkey, then named values under that subkey specify where in the registry you will find the keys for the section. If the key you are looking for does not exist as a named value, then there will be an unnamed value (shown as <b>&lt;No Name&gt;</b>) that specifies the default location in the registry where you will find the key.</li>
     * <li>If the section name specified by <i>lpAppName</i> does not exist as a named value or as a subkey, then there will be an unnamed value (shown as <b>&lt;No Name&gt;</b>) that specifies the default location in the registry where you will find the keys for the section.</li>
     * <li>If there is no subkey or entry for the section name, then look for the actual initialization file on the disk and read its contents.</li>
     * </ol>
     * When looking at values in the registry that specify other registry locations, there are several prefixes that change the behavior of the .ini file mapping:
     * 
     * <ul>
     * <li>! - this character forces all writes to go both to the registry and to the .ini file on disk.</li>
     * <li># - this character causes the registry value to be set to the value in the Windows 3.1 .ini file when a new user logs in for the first time after setup.</li>
     * <li>@ - this character prevents any reads from going to the .ini file on disk if the requested data is not found in the registry.</li>
     * <li>USR: - this prefix stands for <b>HKEY_CURRENT_USER</b>, and the text after the prefix is relative to that key.</li>
     * <li>SYS: - this prefix stands for <b>HKEY_LOCAL_MACHINE\SOFTWARE</b>, and the text after the prefix is relative to that key.</li>
     * </ul>
     * @param {Pointer<PWSTR>} lpAppName The name of the section containing the key name. If this parameter is <b>NULL</b>, the 
     * <b>GetPrivateProfileString</b> function copies all section names in the file to the supplied buffer.
     * @param {Pointer<PWSTR>} lpKeyName The name of the key whose associated string is to be retrieved. If this parameter is <b>NULL</b>, all key names in the section specified by the <i>lpAppName</i> parameter are copied to the buffer specified by the <i>lpReturnedString</i> parameter.
     * @param {Pointer<PWSTR>} lpDefault A default string. If the <i>lpKeyName</i> key cannot be found in the initialization file, 
     * <b>GetPrivateProfileString</b> copies the default string to the <i>lpReturnedString</i> buffer.  
     * 
     * 
     * If this parameter is <b>NULL</b>, the default is an empty string, "".
     * 
     * Avoid specifying a default string with trailing blank characters. The function inserts a <b>null</b> character in the <i>lpReturnedString</i> buffer to strip any trailing blanks.
     * @param {Pointer<PWSTR>} lpReturnedString A pointer to the buffer that receives the retrieved string.
     * @param {Integer} nSize The size of the buffer pointed to by the <i>lpReturnedString</i> parameter, in characters.
     * @param {Pointer<PWSTR>} lpFileName The name of the initialization file. If this parameter does not contain a full path to the file, the system searches for the file in the Windows directory.
     * @returns {Integer} The return value is the number of characters copied to the buffer, not including the terminating <b>null</b> character.
     * 
     * If neither <i>lpAppName</i> nor <i>lpKeyName</i> is <b>NULL</b> and the supplied destination buffer is too small to hold the requested string, the string is truncated and followed by a <b>null</b> character, and the return value is equal to <i>nSize</i> minus one.
     * 
     * If either <i>lpAppName</i> or <i>lpKeyName</i> is <b>NULL</b> and the supplied destination buffer is too small to hold all the strings, the last string is truncated and followed by two <b>null</b> characters. In this case, the return value is equal to <i>nSize</i> minus two.
     * 
     * In the event the initialization file specified by <i>lpFileName</i> is not found, or contains invalid values, this function will set <b>errorno</b> with a value of '0x2' (File Not Found). To retrieve extended error information, call <a href="https://docs.microsoft.com/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getprivateprofilestringw
     * @since windows5.0
     */
    static GetPrivateProfileStringW(lpAppName, lpKeyName, lpDefault, lpReturnedString, nSize, lpFileName) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetPrivateProfileStringW", "ptr", lpAppName, "ptr", lpKeyName, "ptr", lpDefault, "ptr", lpReturnedString, "uint", nSize, "ptr", lpFileName, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Copies a string into the specified section of an initialization file. (ANSI)
     * @remarks
     * A section in the initialization file must have the following form:
     * 
     * 
     * ``` syntax
     * [section]
     * key=string
     *       .
     *       .
     *       .
     * ```
     * 
     * If the <i>lpFileName</i> parameter does not contain a full path and file name for the file, 
     * <b>WritePrivateProfileString</b> searches the Windows directory for the file. If the file does not exist, this function creates the file in the Windows directory.
     * 
     * If <i>lpFileName</i> contains a full path and file name and the file does not exist, 
     * <b>WritePrivateProfileString</b> creates the file. The specified directory must already exist.
     * 
     * The system keeps a cached version of the most recent registry file mapping to improve performance. If all parameters are <b>NULL</b>, the function flushes the cache. While the system is editing the cached version of the file, processes that edit the file itself will use the original file until the cache has been cleared.
     * 
     * The system maps most .ini file references to the registry, using the mapping defined under the following registry key:<pre><b>HKEY_LOCAL_MACHINE</b>
     *    <b>SOFTWARE</b>
     *       <b>Microsoft</b>
     *          <b>Windows NT</b>
     *             <b>CurrentVersion</b>
     *                <b>IniFileMapping</b></pre>
     * 
     * 
     * This mapping is likely if an application modifies system-component initialization files, such as Control.ini, System.ini, and Winfile.ini. In this case, the 
     * function writes information to the registry, not to the initialization file; the change in the storage location has no effect on the function's behavior.
     * 
     * The profile functions use the following steps to locate initialization information:
     * 				
     * 
     * <ol>
     * <li>Look in the registry for the name of the initialization file  under the <b>IniFileMapping</b> key.</li>
     * <li>Look for the section name specified by <i>lpAppName</i>. This will be a named value under the key that has the name of the initialization file, or a subkey with this name, or the name will not exist as either a value or subkey.</li>
     * <li>If the section name specified by <i>lpAppName</i> is a named value, then that value specifies where in the registry you will find the keys for the section.</li>
     * <li>If the section name specified by <i>lpAppName</i> is a subkey, then named values under that subkey specify where in the registry you will find the keys for the section. If the key you are looking for does not exist as a named value, then there will be an unnamed value (shown as <b>&lt;No Name&gt;</b>) that specifies the default location in the registry where you will find the key.</li>
     * <li>If the section name specified by <i>lpAppName</i> does not exist as a named value or as a subkey, then there will be an unnamed value (shown as <b>&lt;No Name&gt;</b>) that specifies the default location in the registry where you will find the keys for the section.</li>
     * <li>If there is no subkey or entry for the section name, then look for the actual initialization file on the disk and read its contents.</li>
     * </ol>
     * When looking at values in the registry that specify other registry locations, there are several prefixes that change the behavior of the .ini file mapping:
     * 				
     * 			
     * 
     * <ul>
     * <li>! - this character forces all writes to go both to the registry and to the .ini file on disk.</li>
     * <li># - this character causes the registry value to be set to the value in the Windows 3.1 .ini file when a new user logs in for the first time after setup.</li>
     * <li>@ - this character prevents any reads from going to the .ini file on disk if the requested data is not found in the registry.</li>
     * <li>USR: - this prefix stands for <b>HKEY_CURRENT_USER</b>, and the text after the prefix is relative to that key.</li>
     * <li>SYS: - this prefix stands for <b>HKEY_LOCAL_MACHINE\SOFTWARE</b>, and the text after the prefix is relative to that key.</li>
     * </ul>
     * An application using the <b>WritePrivateProfileString</b> function to enter .ini file information into the registry should follow these guidelines:
     * 
     * <ul>
     * <li>Ensure that no .ini file of the specified name exists on the system.</li>
     * <li>Ensure that there is a key entry in the registry that specifies the .ini file. This entry should be under the path <b>HKEY_LOCAL_MACHINE\SOFTWARE \Microsoft\Windows NT\CurrentVersion\IniFileMapping</b>.</li>
     * <li>Specify a value for that .ini file key entry that specifies a section. That is to say, an application must specify a section name, as it would appear within an .ini file or registry entry. Here is an example: [My Section].</li>
     * <li>For system files, specify SYS for an added value.</li>
     * <li>For application files, specify USR within the added value. Here is an example: "My Section: USR: App Name\Section". And, since USR indicates a mapping under <b>HKEY_CURRENT_USER</b>, the application should also create a key under <b>HKEY_CURRENT_USER</b> that specifies the application name listed in the added value. For the example just given, that would be "App Name".</li>
     * <li>After following the preceding steps, an application setup program should call <b>WritePrivateProfileString</b> with the first three parameters set to <b>NULL</b>, and the fourth parameter set to the INI file name. For example: 
     * 
     * 
     * <c>WritePrivateProfileString( NULL, NULL, NULL, L"appname.ini" );</c>
     * 
     * </li>
     * <li>Such a call causes the mapping of an .ini file to the registry to take effect before the next system reboot. The system rereads the mapping information into shared memory. A user will not have to reboot their computer after installing an application in order to have future invocations of the application see the mapping of the .ini file to the registry.</li>
     * </ul>
     * @param {Pointer<PSTR>} lpAppName The name of the section to which the string will be copied. If the section does not exist, it is created. The name of the section is case-independent; the string can be any combination of uppercase and lowercase letters.
     * @param {Pointer<PSTR>} lpKeyName The name of the key to be associated with a string. If the key does not exist in the specified section, it is created. If this parameter is <b>NULL</b>, the entire section, including all entries within the section, is deleted.
     * @param {Pointer<PSTR>} lpString A <b>null</b>-terminated string to be written to the file. If this parameter is <b>NULL</b>, the key pointed to by the <i>lpKeyName</i> parameter is deleted.
     * @param {Pointer<PSTR>} lpFileName The name of the initialization file.
     * 
     * If the file was created using Unicode characters, the function writes Unicode characters to the file. Otherwise, the function writes ANSI characters.
     * @returns {Integer} If the function successfully copies the string to the initialization file, the return value is nonzero.
     * 
     * If the function fails, or if it flushes the cached version of the most recently accessed initialization file, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-writeprivateprofilestringa
     * @since windows5.0
     */
    static WritePrivateProfileStringA(lpAppName, lpKeyName, lpString, lpFileName) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\WritePrivateProfileStringA", "ptr", lpAppName, "ptr", lpKeyName, "ptr", lpString, "ptr", lpFileName, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Copies a string into the specified section of an initialization file. (Unicode)
     * @remarks
     * A section in the initialization file must have the following form:
     * 
     * 
     * ``` syntax
     * [section]
     * key=string
     *       .
     *       .
     *       .
     * ```
     * 
     * If the <i>lpFileName</i> parameter does not contain a full path and file name for the file, 
     * <b>WritePrivateProfileString</b> searches the Windows directory for the file. If the file does not exist, this function creates the file in the Windows directory.
     * 
     * If <i>lpFileName</i> contains a full path and file name and the file does not exist, 
     * <b>WritePrivateProfileString</b> creates the file. The specified directory must already exist.
     * 
     * The system keeps a cached version of the most recent registry file mapping to improve performance. If all parameters are <b>NULL</b>, the function flushes the cache. While the system is editing the cached version of the file, processes that edit the file itself will use the original file until the cache has been cleared.
     * 
     * The system maps most .ini file references to the registry, using the mapping defined under the following registry key:<pre><b>HKEY_LOCAL_MACHINE</b>
     *    <b>SOFTWARE</b>
     *       <b>Microsoft</b>
     *          <b>Windows NT</b>
     *             <b>CurrentVersion</b>
     *                <b>IniFileMapping</b></pre>
     * 
     * 
     * This mapping is likely if an application modifies system-component initialization files, such as Control.ini, System.ini, and Winfile.ini. In this case, the 
     * function writes information to the registry, not to the initialization file; the change in the storage location has no effect on the function's behavior.
     * 
     * The profile functions use the following steps to locate initialization information:
     * 				
     * 
     * <ol>
     * <li>Look in the registry for the name of the initialization file  under the <b>IniFileMapping</b> key.</li>
     * <li>Look for the section name specified by <i>lpAppName</i>. This will be a named value under the key that has the name of the initialization file, or a subkey with this name, or the name will not exist as either a value or subkey.</li>
     * <li>If the section name specified by <i>lpAppName</i> is a named value, then that value specifies where in the registry you will find the keys for the section.</li>
     * <li>If the section name specified by <i>lpAppName</i> is a subkey, then named values under that subkey specify where in the registry you will find the keys for the section. If the key you are looking for does not exist as a named value, then there will be an unnamed value (shown as <b>&lt;No Name&gt;</b>) that specifies the default location in the registry where you will find the key.</li>
     * <li>If the section name specified by <i>lpAppName</i> does not exist as a named value or as a subkey, then there will be an unnamed value (shown as <b>&lt;No Name&gt;</b>) that specifies the default location in the registry where you will find the keys for the section.</li>
     * <li>If there is no subkey or entry for the section name, then look for the actual initialization file on the disk and read its contents.</li>
     * </ol>
     * When looking at values in the registry that specify other registry locations, there are several prefixes that change the behavior of the .ini file mapping:
     * 				
     * 			
     * 
     * <ul>
     * <li>! - this character forces all writes to go both to the registry and to the .ini file on disk.</li>
     * <li># - this character causes the registry value to be set to the value in the Windows 3.1 .ini file when a new user logs in for the first time after setup.</li>
     * <li>@ - this character prevents any reads from going to the .ini file on disk if the requested data is not found in the registry.</li>
     * <li>USR: - this prefix stands for <b>HKEY_CURRENT_USER</b>, and the text after the prefix is relative to that key.</li>
     * <li>SYS: - this prefix stands for <b>HKEY_LOCAL_MACHINE\SOFTWARE</b>, and the text after the prefix is relative to that key.</li>
     * </ul>
     * An application using the <b>WritePrivateProfileString</b> function to enter .ini file information into the registry should follow these guidelines:
     * 
     * <ul>
     * <li>Ensure that no .ini file of the specified name exists on the system.</li>
     * <li>Ensure that there is a key entry in the registry that specifies the .ini file. This entry should be under the path <b>HKEY_LOCAL_MACHINE\SOFTWARE \Microsoft\Windows NT\CurrentVersion\IniFileMapping</b>.</li>
     * <li>Specify a value for that .ini file key entry that specifies a section. That is to say, an application must specify a section name, as it would appear within an .ini file or registry entry. Here is an example: [My Section].</li>
     * <li>For system files, specify SYS for an added value.</li>
     * <li>For application files, specify USR within the added value. Here is an example: "My Section: USR: App Name\Section". And, since USR indicates a mapping under <b>HKEY_CURRENT_USER</b>, the application should also create a key under <b>HKEY_CURRENT_USER</b> that specifies the application name listed in the added value. For the example just given, that would be "App Name".</li>
     * <li>After following the preceding steps, an application setup program should call <b>WritePrivateProfileString</b> with the first three parameters set to <b>NULL</b>, and the fourth parameter set to the INI file name. For example: 
     * 
     * 
     * <c>WritePrivateProfileString( NULL, NULL, NULL, L"appname.ini" );</c>
     * 
     * </li>
     * <li>Such a call causes the mapping of an .ini file to the registry to take effect before the next system reboot. The system rereads the mapping information into shared memory. A user will not have to reboot their computer after installing an application in order to have future invocations of the application see the mapping of the .ini file to the registry.</li>
     * </ul>
     * @param {Pointer<PWSTR>} lpAppName The name of the section to which the string will be copied. If the section does not exist, it is created. The name of the section is case-independent; the string can be any combination of uppercase and lowercase letters.
     * @param {Pointer<PWSTR>} lpKeyName The name of the key to be associated with a string. If the key does not exist in the specified section, it is created. If this parameter is <b>NULL</b>, the entire section, including all entries within the section, is deleted.
     * @param {Pointer<PWSTR>} lpString A <b>null</b>-terminated string to be written to the file. If this parameter is <b>NULL</b>, the key pointed to by the <i>lpKeyName</i> parameter is deleted.
     * @param {Pointer<PWSTR>} lpFileName The name of the initialization file.
     * 
     * If the file was created using Unicode characters, the function writes Unicode characters to the file. Otherwise, the function writes ANSI characters.
     * @returns {Integer} If the function successfully copies the string to the initialization file, the return value is nonzero.
     * 
     * If the function fails, or if it flushes the cached version of the most recently accessed initialization file, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-writeprivateprofilestringw
     * @since windows5.0
     */
    static WritePrivateProfileStringW(lpAppName, lpKeyName, lpString, lpFileName) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\WritePrivateProfileStringW", "ptr", lpAppName, "ptr", lpKeyName, "ptr", lpString, "ptr", lpFileName, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves all the keys and values for the specified section of an initialization file. (GetPrivateProfileSectionA)
     * @remarks
     * The data in the buffer pointed to by the <i>lpReturnedString</i> parameter consists of one or more null-terminated strings, followed by a final null character. Each string has the following format:
     * 
     * <i>key</i><b>=</b><i>string</i>
     * 
     * The 
     * <b>GetPrivateProfileSection</b> function is not case-sensitive; the string pointed to by the <i>lpAppName</i> parameter can be a combination of uppercase and lowercase letters.
     * 
     * This operation is atomic; no updates to the specified initialization file are allowed while the key name and value pairs for the section are being copied to the buffer pointed to by the <i>lpReturnedString</i> parameter.
     * 
     * The system maps most .ini file references to the registry, using the mapping defined under the following registry key:<b>HKEY_LOCAL_MACHINE</b>&#92;<b>SOFTWARE</b>&#92;<b>Microsoft</b>&#92;<b>Windows NT</b>&#92;<b>CurrentVersion</b>&#92;<b>IniFileMapping</b>
     * 
     * 
     * 
     * This mapping is likely if an application modifies system-component initialization files, such as Control.ini, System.ini, and Winfile.ini. In these cases, the 
     * function retrieves information from the registry, not from the initialization file; the change in the storage location has no effect on the function's behavior.
     * 
     * The profile functions use the following steps to locate initialization information:
     * 
     * <ol>
     * <li>Look in the registry for the name of the initialization file  under the <b>IniFileMapping</b> key.</li>
     * <li>Look for the section name specified by <i>lpAppName</i>. This will be a named value under the key that has the name of the initialization file, or a subkey with this name, or the name will not exist as either a value or subkey.</li>
     * <li>If the section name specified by <i>lpAppName</i> is a named value, then that value specifies where in the registry you will find the keys for the section.</li>
     * <li>If the section name specified by <i>lpAppName</i> is a subkey, then named values under that subkey specify where in the registry you will find the keys for the section. If the key you are looking for does not exist as a named value, then there will be an unnamed value (shown as <b>&lt;No Name&gt;</b>) that specifies the default location in the registry where you will find the key.</li>
     * <li>If the section name specified by <i>lpAppName</i> does not exist as a named value or as a subkey, then there will be an unnamed value (shown as <b>&lt;No Name&gt;</b>) that specifies the default location in the registry where you will find the keys for the section.</li>
     * <li>If there is no subkey or entry for the section name, then look for the actual initialization file on the disk and read its contents.</li>
     * </ol>
     * When looking at values in the registry that specify other registry locations, there are several prefixes that change the behavior of the .ini file mapping:
     * 
     * <ul>
     * <li>! - this character forces all writes to go both to the registry and to the .ini file on disk.</li>
     * <li># - this character causes the registry value to be set to the value in the Windows 3.1 .ini file when a new user logs in for the first time after setup.</li>
     * <li>@ - this character prevents any reads from going to the .ini file on disk if the requested data is not found in the registry.</li>
     * <li>USR: - this prefix stands for <b>HKEY_CURRENT_USER</b>, and the text after the prefix is relative to that key.</li>
     * <li>SYS: - this prefix stands for <b>HKEY_LOCAL_MACHINE\SOFTWARE</b>, and the text after the prefix is relative to that key.</li>
     * </ul>
     * Comments (any line that starts with a semicolon) are stripped out and not returned in the <i>lpReturnedString</i> buffer.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winbase.h header defines GetPrivateProfileSection as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<PSTR>} lpAppName The name of the section in the initialization file.
     * @param {Pointer<PSTR>} lpReturnedString A pointer to a buffer that receives the key name and value pairs associated with the named section. The buffer is filled with one or more null-terminated strings; the last string is followed by a second null character.
     * @param {Integer} nSize The size of the buffer pointed to by the <i>lpReturnedString</i> parameter, in characters. 
     * 
     * 
     * The maximum profile section size is 32,767 characters.
     * @param {Pointer<PSTR>} lpFileName The name of the initialization file. If this parameter does not contain a full path to the file, the system searches for the file in the Windows directory.
     * @returns {Integer} The return value specifies the number of characters copied to the buffer, not including the terminating null character. If the buffer is not large enough to contain all the key name and value pairs associated with the named section, the return value is equal to <i>nSize</i> minus two.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getprivateprofilesectiona
     * @since windows5.0
     */
    static GetPrivateProfileSectionA(lpAppName, lpReturnedString, nSize, lpFileName) {
        result := DllCall("KERNEL32.dll\GetPrivateProfileSectionA", "ptr", lpAppName, "ptr", lpReturnedString, "uint", nSize, "ptr", lpFileName, "uint")
        return result
    }

    /**
     * The GetPrivateProfileSectionW (Unicode) function (winbase.h) retrieves all the keys and values for the specified section of an initialization file.
     * @remarks
     * The data in the buffer pointed to by the <i>lpReturnedString</i> parameter consists of one or more null-terminated strings, followed by a final null character. Each string has the following format:
     * 
     * <i>key</i><b>=</b><i>string</i>
     * 
     * The 
     * <b>GetPrivateProfileSection</b> function is not case-sensitive; the string pointed to by the <i>lpAppName</i> parameter can be a combination of uppercase and lowercase letters.
     * 
     * This operation is atomic; no updates to the specified initialization file are allowed while the key name and value pairs for the section are being copied to the buffer pointed to by the <i>lpReturnedString</i> parameter.
     * 
     * The system maps most .ini file references to the registry, using the mapping defined under the following registry key:<b>HKEY_LOCAL_MACHINE</b>&#92;<b>SOFTWARE</b>&#92;<b>Microsoft</b>&#92;<b>Windows NT</b>&#92;<b>CurrentVersion</b>&#92;<b>IniFileMapping</b>
     * 
     * 
     * 
     * This mapping is likely if an application modifies system-component initialization files, such as Control.ini, System.ini, and Winfile.ini. In these cases, the 
     * function retrieves information from the registry, not from the initialization file; the change in the storage location has no effect on the function's behavior.
     * 
     * The profile functions use the following steps to locate initialization information:
     * 
     * <ol>
     * <li>Look in the registry for the name of the initialization file  under the <b>IniFileMapping</b> key.</li>
     * <li>Look for the section name specified by <i>lpAppName</i>. This will be a named value under the key that has the name of the initialization file, or a subkey with this name, or the name will not exist as either a value or subkey.</li>
     * <li>If the section name specified by <i>lpAppName</i> is a named value, then that value specifies where in the registry you will find the keys for the section.</li>
     * <li>If the section name specified by <i>lpAppName</i> is a subkey, then named values under that subkey specify where in the registry you will find the keys for the section. If the key you are looking for does not exist as a named value, then there will be an unnamed value (shown as <b>&lt;No Name&gt;</b>) that specifies the default location in the registry where you will find the key.</li>
     * <li>If the section name specified by <i>lpAppName</i> does not exist as a named value or as a subkey, then there will be an unnamed value (shown as <b>&lt;No Name&gt;</b>) that specifies the default location in the registry where you will find the keys for the section.</li>
     * <li>If there is no subkey or entry for the section name, then look for the actual initialization file on the disk and read its contents.</li>
     * </ol>
     * When looking at values in the registry that specify other registry locations, there are several prefixes that change the behavior of the .ini file mapping:
     * 
     * <ul>
     * <li>! - this character forces all writes to go both to the registry and to the .ini file on disk.</li>
     * <li># - this character causes the registry value to be set to the value in the Windows 3.1 .ini file when a new user logs in for the first time after setup.</li>
     * <li>@ - this character prevents any reads from going to the .ini file on disk if the requested data is not found in the registry.</li>
     * <li>USR: - this prefix stands for <b>HKEY_CURRENT_USER</b>, and the text after the prefix is relative to that key.</li>
     * <li>SYS: - this prefix stands for <b>HKEY_LOCAL_MACHINE\SOFTWARE</b>, and the text after the prefix is relative to that key.</li>
     * </ul>
     * Comments (any line that starts with a semicolon) are stripped out and not returned in the <i>lpReturnedString</i> buffer.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winbase.h header defines GetPrivateProfileSection as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<PWSTR>} lpAppName The name of the section in the initialization file.
     * @param {Pointer<PWSTR>} lpReturnedString A pointer to a buffer that receives the key name and value pairs associated with the named section. The buffer is filled with one or more null-terminated strings; the last string is followed by a second null character.
     * @param {Integer} nSize The size of the buffer pointed to by the <i>lpReturnedString</i> parameter, in characters. 
     * 
     * 
     * The maximum profile section size is 32,767 characters.
     * @param {Pointer<PWSTR>} lpFileName The name of the initialization file. If this parameter does not contain a full path to the file, the system searches for the file in the Windows directory.
     * @returns {Integer} The return value specifies the number of characters copied to the buffer, not including the terminating null character. If the buffer is not large enough to contain all the key name and value pairs associated with the named section, the return value is equal to <i>nSize</i> minus two.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getprivateprofilesectionw
     * @since windows5.0
     */
    static GetPrivateProfileSectionW(lpAppName, lpReturnedString, nSize, lpFileName) {
        result := DllCall("KERNEL32.dll\GetPrivateProfileSectionW", "ptr", lpAppName, "ptr", lpReturnedString, "uint", nSize, "ptr", lpFileName, "uint")
        return result
    }

    /**
     * Replaces the keys and values for the specified section in an initialization file. (ANSI)
     * @remarks
     * The data in the buffer pointed to by the <i>lpString</i> parameter consists of one or more <b>null</b>-terminated strings, followed by a final <b>null</b> character. Each string has the following form:
     * 
     * <i>key</i><b>=</b><i>string</i>
     * 
     * The 
     * <b>WritePrivateProfileSection</b> function is not case-sensitive; the string pointed to by the <i>lpAppName</i> parameter can be a combination of uppercase and lowercase letters.
     * 
     * If no section name matches the string pointed to by the <i>lpAppName</i> parameter, 
     * <b>WritePrivateProfileSection</b> creates the section at the end of the specified initialization file and initializes the new section with the specified key name and value pairs.
     * 
     * <b>WritePrivateProfileSection</b> deletes the existing keys and values for the named section and inserts the key names and values in the buffer pointed to by the <i>lpString</i> parameter. The function does not attempt to correlate old and new key names; if the new names appear in a different order from the old names, any comments associated with preexisting keys and values in the initialization file will probably be associated with incorrect keys and values.
     * 
     * This operation is atomic; no operations that read from or write to the specified initialization file are allowed while the information is being written.
     * 
     * The system keeps a cached version of the most recent registry file mapping to improve performance. If all parameters are <b>NULL</b>, the function flushes the cache. While the system is editing the cached version of the file, processes that edit the file itself will use the original file until the cache has been cleared.
     * 
     * The system maps most .ini file references to the registry, using the mapping defined under the following registry key:<pre><b>HKEY_LOCAL_MACHINE</b>
     *    <b>SOFTWARE</b>
     *       <b>Microsoft</b>
     *          <b>Windows NT</b>
     *             <b>CurrentVersion</b>
     *                <b>IniFileMapping</b></pre>
     * 
     * 
     * This mapping is likely if an application modifies system-component initialization files, such as Control.ini, System.ini, and Winfile.ini. In this case, the 
     * function writes information to the registry, not to the initialization file; the change in the storage location has no effect on the function's behavior.
     * 
     * The profile functions use the following steps to locate initialization information:
     * 
     * <ol>
     * <li>Look in the registry for the name of the initialization file  under the <b>IniFileMapping</b> key.</li>
     * <li>Look for the section name specified by <i>lpAppName</i>. This will be a named value under the key that has the name of the initialization file, or a subkey with this name, or the name will not exist as either a value or subkey.</li>
     * <li>If the section name specified by <i>lpAppName</i> is a named value, then that value specifies where in the registry you will find the keys for the section.</li>
     * <li>If the section name specified by <i>lpAppName</i> is a subkey, then named values under that subkey specify where in the registry you will find the keys for the section. If the key you are looking for does not exist as a named value, then there will be an unnamed value (shown as <b>&lt;No Name&gt;</b>) that specifies the default location in the registry where you will find the key.</li>
     * <li>If the section name specified by <i>lpAppName</i> does not exist as a named value or as a subkey, then there will be an unnamed value (shown as <b>&lt;No Name&gt;</b>) that specifies the default location in the registry where you will find the keys for the section.</li>
     * <li>If there is no subkey or entry for the section name, then look for the actual initialization file on the disk and read its contents.</li>
     * </ol>
     * When looking at values in the registry that specify other registry locations, there are several prefixes that change the behavior of the .ini file mapping:
     * 				
     * 			
     * 
     * <ul>
     * <li>! - this character forces all writes to go both to the registry and to the .ini file on disk.</li>
     * <li># - this character causes the registry value to be set to the value in the Windows 3.1 .ini file when a new user logs in for the first time after setup.</li>
     * <li>@ - this character prevents any reads from going to the .ini file on disk if the requested data is not found in the registry.</li>
     * <li>USR: - this prefix stands for <b>HKEY_CURRENT_USER</b>, and the text after the prefix is relative to that key.</li>
     * <li>SYS: - this prefix stands for <b>HKEY_LOCAL_MACHINE\SOFTWARE</b>, and the text after the prefix is relative to that key.</li>
     * </ul>
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winbase.h header defines WritePrivateProfileSection as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<PSTR>} lpAppName The name of the section in which data is written. This section name is typically the name of the calling application.
     * @param {Pointer<PSTR>} lpString The new key names and associated values that are to be written to the named section. This string is limited to 65,535 bytes.
     * @param {Pointer<PSTR>} lpFileName The name of the initialization file. If this parameter does not contain a full path for the file, the function searches the Windows directory for the file. If the file does not exist and <i>lpFileName</i> does not contain a full path, the function creates the file in the Windows directory. 
     * 
     * If the file exists and was created using Unicode characters, the function writes Unicode characters to the file. Otherwise, the function creates a file using ANSI characters.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-writeprivateprofilesectiona
     * @since windows5.0
     */
    static WritePrivateProfileSectionA(lpAppName, lpString, lpFileName) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\WritePrivateProfileSectionA", "ptr", lpAppName, "ptr", lpString, "ptr", lpFileName, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Replaces the keys and values for the specified section in an initialization file. (Unicode)
     * @remarks
     * The data in the buffer pointed to by the <i>lpString</i> parameter consists of one or more <b>null</b>-terminated strings, followed by a final <b>null</b> character. Each string has the following form:
     * 
     * <i>key</i><b>=</b><i>string</i>
     * 
     * The 
     * <b>WritePrivateProfileSection</b> function is not case-sensitive; the string pointed to by the <i>lpAppName</i> parameter can be a combination of uppercase and lowercase letters.
     * 
     * If no section name matches the string pointed to by the <i>lpAppName</i> parameter, 
     * <b>WritePrivateProfileSection</b> creates the section at the end of the specified initialization file and initializes the new section with the specified key name and value pairs.
     * 
     * <b>WritePrivateProfileSection</b> deletes the existing keys and values for the named section and inserts the key names and values in the buffer pointed to by the <i>lpString</i> parameter. The function does not attempt to correlate old and new key names; if the new names appear in a different order from the old names, any comments associated with preexisting keys and values in the initialization file will probably be associated with incorrect keys and values.
     * 
     * This operation is atomic; no operations that read from or write to the specified initialization file are allowed while the information is being written.
     * 
     * The system keeps a cached version of the most recent registry file mapping to improve performance. If all parameters are <b>NULL</b>, the function flushes the cache. While the system is editing the cached version of the file, processes that edit the file itself will use the original file until the cache has been cleared.
     * 
     * The system maps most .ini file references to the registry, using the mapping defined under the following registry key:<pre><b>HKEY_LOCAL_MACHINE</b>
     *    <b>SOFTWARE</b>
     *       <b>Microsoft</b>
     *          <b>Windows NT</b>
     *             <b>CurrentVersion</b>
     *                <b>IniFileMapping</b></pre>
     * 
     * 
     * This mapping is likely if an application modifies system-component initialization files, such as Control.ini, System.ini, and Winfile.ini. In this case, the 
     * function writes information to the registry, not to the initialization file; the change in the storage location has no effect on the function's behavior.
     * 
     * The profile functions use the following steps to locate initialization information:
     * 
     * <ol>
     * <li>Look in the registry for the name of the initialization file  under the <b>IniFileMapping</b> key.</li>
     * <li>Look for the section name specified by <i>lpAppName</i>. This will be a named value under the key that has the name of the initialization file, or a subkey with this name, or the name will not exist as either a value or subkey.</li>
     * <li>If the section name specified by <i>lpAppName</i> is a named value, then that value specifies where in the registry you will find the keys for the section.</li>
     * <li>If the section name specified by <i>lpAppName</i> is a subkey, then named values under that subkey specify where in the registry you will find the keys for the section. If the key you are looking for does not exist as a named value, then there will be an unnamed value (shown as <b>&lt;No Name&gt;</b>) that specifies the default location in the registry where you will find the key.</li>
     * <li>If the section name specified by <i>lpAppName</i> does not exist as a named value or as a subkey, then there will be an unnamed value (shown as <b>&lt;No Name&gt;</b>) that specifies the default location in the registry where you will find the keys for the section.</li>
     * <li>If there is no subkey or entry for the section name, then look for the actual initialization file on the disk and read its contents.</li>
     * </ol>
     * When looking at values in the registry that specify other registry locations, there are several prefixes that change the behavior of the .ini file mapping:
     * 				
     * 			
     * 
     * <ul>
     * <li>! - this character forces all writes to go both to the registry and to the .ini file on disk.</li>
     * <li># - this character causes the registry value to be set to the value in the Windows 3.1 .ini file when a new user logs in for the first time after setup.</li>
     * <li>@ - this character prevents any reads from going to the .ini file on disk if the requested data is not found in the registry.</li>
     * <li>USR: - this prefix stands for <b>HKEY_CURRENT_USER</b>, and the text after the prefix is relative to that key.</li>
     * <li>SYS: - this prefix stands for <b>HKEY_LOCAL_MACHINE\SOFTWARE</b>, and the text after the prefix is relative to that key.</li>
     * </ul>
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winbase.h header defines WritePrivateProfileSection as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<PWSTR>} lpAppName The name of the section in which data is written. This section name is typically the name of the calling application.
     * @param {Pointer<PWSTR>} lpString The new key names and associated values that are to be written to the named section. This string is limited to 65,535 bytes.
     * @param {Pointer<PWSTR>} lpFileName The name of the initialization file. If this parameter does not contain a full path for the file, the function searches the Windows directory for the file. If the file does not exist and <i>lpFileName</i> does not contain a full path, the function creates the file in the Windows directory. 
     * 
     * If the file exists and was created using Unicode characters, the function writes Unicode characters to the file. Otherwise, the function creates a file using ANSI characters.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-writeprivateprofilesectionw
     * @since windows5.0
     */
    static WritePrivateProfileSectionW(lpAppName, lpString, lpFileName) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\WritePrivateProfileSectionW", "ptr", lpAppName, "ptr", lpString, "ptr", lpFileName, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the names of all sections in an initialization file. (GetPrivateProfileSectionNamesA)
     * @remarks
     * This operation is atomic; no updates to the initialization file are allowed while the section names are being copied to the buffer.
     * 
     * The system maps most .ini file references to the registry, using the mapping defined under the following registry key:<b>HKEY_LOCAL_MACHINE</b>&#92;<b>SOFTWARE</b>&#92;<b>Microsoft</b>&#92;<b>Windows NT</b>&#92;<b>CurrentVersion</b>&#92;<b>IniFileMapping</b>
     * 
     * 
     * 
     * This mapping is likely if an application modifies system-component initialization files, such as Control.ini, System.ini, and Winfile.ini. In these cases, the 
     * function retrieves information from the registry, not from the initialization file; the change in the storage location has no effect on the function's behavior.
     * 
     * The profile functions use the following steps to locate initialization information:
     * 
     * <ol>
     * <li>Look in the registry for the name of the initialization file  under the <b>IniFileMapping</b> key.</li>
     * <li>Look for the section name specified by <i>lpAppName</i>. This will be a named value under the key that has the name of the initialization file, or a subkey with this name, or the name will not exist as either a value or subkey.</li>
     * <li>If the section name specified by <i>lpAppName</i> is a named value, then that value specifies where in the registry you will find the keys for the section.</li>
     * <li>If the section name specified by <i>lpAppName</i> is a subkey, then named values under that subkey specify where in the registry you will find the keys for the section. If the key you are looking for does not exist as a named value, then there will be an unnamed value (shown as <b>&lt;No Name&gt;</b>) that specifies the default location in the registry where you will find the key.</li>
     * <li>If the section name specified by <i>lpAppName</i> does not exist as a named value or as a subkey, then there will be an unnamed value (shown as <b>&lt;No Name&gt;</b>) that specifies the default location in the registry where you will find the keys for the section.</li>
     * <li>If there is no subkey or entry for the section name, then look for the actual initialization file on the disk and read its contents.</li>
     * </ol>
     * When looking at values in the registry that specify other registry locations, there are several prefixes that change the behavior of the .ini file mapping:
     * 
     * <ul>
     * <li>! - this character forces all writes to go both to the registry and to the .ini file on disk.</li>
     * <li># - this character causes the registry value to be set to the value in the Windows 3.1 .ini file when a new user logs in for the first time after setup.</li>
     * <li>@ - this character prevents any reads from going to the .ini file on disk if the requested data is not found in the registry.</li>
     * <li>USR: - this prefix stands for <b>HKEY_CURRENT_USER</b>, and the text after the prefix is relative to that key.</li>
     * <li>SYS: - this prefix stands for <b>HKEY_LOCAL_MACHINE\SOFTWARE</b>, and the text after the prefix is relative to that key.</li>
     * </ul>
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winbase.h header defines GetPrivateProfileSectionNames as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<PSTR>} lpszReturnBuffer A pointer to a buffer that receives the section names associated with the named file. The buffer is filled with one or more <b>null</b>-terminated strings; the last string is followed by a second <b>null</b> character.
     * @param {Integer} nSize The size of the buffer pointed to by the <i>lpszReturnBuffer</i> parameter, in characters.
     * @param {Pointer<PSTR>} lpFileName The name of the initialization file. If this parameter is <b>NULL</b>, the function searches the Win.ini file. If this parameter does not contain a full path to the file, the system searches for the file in the Windows directory.
     * @returns {Integer} The return value specifies the number of characters copied to the specified buffer, not including the terminating <b>null</b> character. If the buffer is not large enough to contain all the section names associated with the specified initialization file, the return value is equal to the size specified by <i>nSize</i> minus two.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getprivateprofilesectionnamesa
     * @since windows5.0
     */
    static GetPrivateProfileSectionNamesA(lpszReturnBuffer, nSize, lpFileName) {
        result := DllCall("KERNEL32.dll\GetPrivateProfileSectionNamesA", "ptr", lpszReturnBuffer, "uint", nSize, "ptr", lpFileName, "uint")
        return result
    }

    /**
     * The GetPrivateProfileSectionNamesW (Unicode) function (winbase.h) retrieves the names of all sections in an initialization file.
     * @remarks
     * This operation is atomic; no updates to the initialization file are allowed while the section names are being copied to the buffer.
     * 
     * The system maps most .ini file references to the registry, using the mapping defined under the following registry key:<b>HKEY_LOCAL_MACHINE</b>&#92;<b>SOFTWARE</b>&#92;<b>Microsoft</b>&#92;<b>Windows NT</b>&#92;<b>CurrentVersion</b>&#92;<b>IniFileMapping</b>
     * 
     * 
     * 
     * This mapping is likely if an application modifies system-component initialization files, such as Control.ini, System.ini, and Winfile.ini. In these cases, the 
     * function retrieves information from the registry, not from the initialization file; the change in the storage location has no effect on the function's behavior.
     * 
     * The profile functions use the following steps to locate initialization information:
     * 
     * <ol>
     * <li>Look in the registry for the name of the initialization file  under the <b>IniFileMapping</b> key.</li>
     * <li>Look for the section name specified by <i>lpAppName</i>. This will be a named value under the key that has the name of the initialization file, or a subkey with this name, or the name will not exist as either a value or subkey.</li>
     * <li>If the section name specified by <i>lpAppName</i> is a named value, then that value specifies where in the registry you will find the keys for the section.</li>
     * <li>If the section name specified by <i>lpAppName</i> is a subkey, then named values under that subkey specify where in the registry you will find the keys for the section. If the key you are looking for does not exist as a named value, then there will be an unnamed value (shown as <b>&lt;No Name&gt;</b>) that specifies the default location in the registry where you will find the key.</li>
     * <li>If the section name specified by <i>lpAppName</i> does not exist as a named value or as a subkey, then there will be an unnamed value (shown as <b>&lt;No Name&gt;</b>) that specifies the default location in the registry where you will find the keys for the section.</li>
     * <li>If there is no subkey or entry for the section name, then look for the actual initialization file on the disk and read its contents.</li>
     * </ol>
     * When looking at values in the registry that specify other registry locations, there are several prefixes that change the behavior of the .ini file mapping:
     * 
     * <ul>
     * <li>! - this character forces all writes to go both to the registry and to the .ini file on disk.</li>
     * <li># - this character causes the registry value to be set to the value in the Windows 3.1 .ini file when a new user logs in for the first time after setup.</li>
     * <li>@ - this character prevents any reads from going to the .ini file on disk if the requested data is not found in the registry.</li>
     * <li>USR: - this prefix stands for <b>HKEY_CURRENT_USER</b>, and the text after the prefix is relative to that key.</li>
     * <li>SYS: - this prefix stands for <b>HKEY_LOCAL_MACHINE\SOFTWARE</b>, and the text after the prefix is relative to that key.</li>
     * </ul>
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winbase.h header defines GetPrivateProfileSectionNames as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<PWSTR>} lpszReturnBuffer A pointer to a buffer that receives the section names associated with the named file. The buffer is filled with one or more <b>null</b>-terminated strings; the last string is followed by a second <b>null</b> character.
     * @param {Integer} nSize The size of the buffer pointed to by the <i>lpszReturnBuffer</i> parameter, in characters.
     * @param {Pointer<PWSTR>} lpFileName The name of the initialization file. If this parameter is <b>NULL</b>, the function searches the Win.ini file. If this parameter does not contain a full path to the file, the system searches for the file in the Windows directory.
     * @returns {Integer} The return value specifies the number of characters copied to the specified buffer, not including the terminating <b>null</b> character. If the buffer is not large enough to contain all the section names associated with the specified initialization file, the return value is equal to the size specified by <i>nSize</i> minus two.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getprivateprofilesectionnamesw
     * @since windows5.0
     */
    static GetPrivateProfileSectionNamesW(lpszReturnBuffer, nSize, lpFileName) {
        result := DllCall("KERNEL32.dll\GetPrivateProfileSectionNamesW", "ptr", lpszReturnBuffer, "uint", nSize, "ptr", lpFileName, "uint")
        return result
    }

    /**
     * Retrieves the data associated with a key in the specified section of an initialization file. (GetPrivateProfileStructA)
     * @remarks
     * A section in the initialization file must have the following form:
     * 				
     * 			
     * 
     * 
     * ``` syntax
     * [section]
     * key=data
     *       .
     *       .
     *       .
     * ```
     * 
     * The system maps most .ini file references to the registry, using the mapping defined under the following registry key:<b>HKEY_LOCAL_MACHINE</b>&#92;<b>SOFTWARE</b>&#92;<b>Microsoft</b>&#92;<b>Windows NT</b>&#92;<b>CurrentVersion</b>&#92;<b>IniFileMapping</b>
     * 
     * 
     * 
     * This mapping is likely if an application modifies system-component initialization files, such as Control.ini, System.ini, and Winfile.ini. In these cases, the 
     *  function retrieves information from the registry, not from the initialization file; the change in the storage location has no effect on the function's behavior.
     * 
     * The profile functions use the following steps to locate initialization information:
     * 
     * <ol>
     * <li>Look in the registry for the name of the initialization file, say MyFile.ini, under <b>IniFileMapping</b>.</li>
     * <li>Look for the section name specified by <i>lpAppName</i>. This will be a named value under <b>myfile.ini</b>, or a subkey of <b>myfile.ini</b>, or will not exist.</li>
     * <li>If the section name specified by <i>lpAppName</i> is a named value under <b>myfile.ini</b>, then that value specifies where in the registry you will find the keys for the section.</li>
     * <li>If the section name specified by <i>lpAppName</i> is a subkey of <b>myfile.ini</b>, then named values under that subkey specify where in the registry you will find the keys for the section. If the key you are looking for does not exist as a named value, then there will be an unnamed value (shown as <b>&lt;No Name&gt;</b>) that specifies the default location in the registry where you will find the key.</li>
     * <li>If the section name specified by <i>lpAppName</i> does not exist as a named value or as a subkey under <b>myfile.ini</b>, then there will be an unnamed value (shown as <b>&lt;No Name&gt;</b>) under <b>myfile.ini</b> that specifies the default location in the registry where you will find the keys for the section.</li>
     * <li>If there is no <b>myfile.ini</b> subkey, or if it does not contain an entry for the section name, then look for the actual MyFile.ini on the disk and read its contents.</li>
     * </ol>
     * When looking at values in the registry that specify other registry locations, there are several prefixes that change the behavior of the .ini file mapping:
     * 
     * <ul>
     * <li>! - this character forces all writes to go both to the registry and to the .ini file on disk.</li>
     * <li># - this character causes the registry value to be set to the value in the Windows 3.1 .ini file when a new user logs in for the first time after setup.</li>
     * <li>@ - this character prevents any reads from going to the .ini file on disk if the requested data is not found in the registry.</li>
     * <li>USR: - this prefix stands for <b>HKEY_CURRENT_USER</b>, and the text after the prefix is relative to that key.</li>
     * <li>SYS: - this prefix stands for <b>HKEY_LOCAL_MACHINE\SOFTWARE</b>, and the text after the prefix is relative to that key.</li>
     * </ul>
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winbase.h header defines GetPrivateProfileStruct as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<PSTR>} lpszSection The name of the section in the initialization file.
     * @param {Pointer<PSTR>} lpszKey The name of the key whose data is to be retrieved.
     * @param {Pointer<Void>} lpStruct A pointer to the buffer that receives the data associated with the file, section, and key names.
     * @param {Integer} uSizeStruct The size of the buffer pointed to by the <i>lpStruct</i> parameter, in bytes.
     * @param {Pointer<PSTR>} szFile The name of the initialization file. If this parameter does not contain a full path to the file, the system searches for the file in the Windows directory.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getprivateprofilestructa
     * @since windows5.0
     */
    static GetPrivateProfileStructA(lpszSection, lpszKey, lpStruct, uSizeStruct, szFile) {
        result := DllCall("KERNEL32.dll\GetPrivateProfileStructA", "ptr", lpszSection, "ptr", lpszKey, "ptr", lpStruct, "uint", uSizeStruct, "ptr", szFile, "int")
        return result
    }

    /**
     * The GetPrivateProfileStructW (Unicode) function (winbase.h) retrieves the data associated with a key in the specified section of an initialization file.
     * @remarks
     * A section in the initialization file must have the following form:
     * 				
     * 			
     * 
     * 
     * ``` syntax
     * [section]
     * key=data
     *       .
     *       .
     *       .
     * ```
     * 
     * The system maps most .ini file references to the registry, using the mapping defined under the following registry key:<b>HKEY_LOCAL_MACHINE</b>&#92;<b>SOFTWARE</b>&#92;<b>Microsoft</b>&#92;<b>Windows NT</b>&#92;<b>CurrentVersion</b>&#92;<b>IniFileMapping</b>
     * 
     * 
     * 
     * This mapping is likely if an application modifies system-component initialization files, such as Control.ini, System.ini, and Winfile.ini. In these cases, the 
     *  function retrieves information from the registry, not from the initialization file; the change in the storage location has no effect on the function's behavior.
     * 
     * The profile functions use the following steps to locate initialization information:
     * 
     * <ol>
     * <li>Look in the registry for the name of the initialization file, say MyFile.ini, under <b>IniFileMapping</b>.</li>
     * <li>Look for the section name specified by <i>lpAppName</i>. This will be a named value under <b>myfile.ini</b>, or a subkey of <b>myfile.ini</b>, or will not exist.</li>
     * <li>If the section name specified by <i>lpAppName</i> is a named value under <b>myfile.ini</b>, then that value specifies where in the registry you will find the keys for the section.</li>
     * <li>If the section name specified by <i>lpAppName</i> is a subkey of <b>myfile.ini</b>, then named values under that subkey specify where in the registry you will find the keys for the section. If the key you are looking for does not exist as a named value, then there will be an unnamed value (shown as <b>&lt;No Name&gt;</b>) that specifies the default location in the registry where you will find the key.</li>
     * <li>If the section name specified by <i>lpAppName</i> does not exist as a named value or as a subkey under <b>myfile.ini</b>, then there will be an unnamed value (shown as <b>&lt;No Name&gt;</b>) under <b>myfile.ini</b> that specifies the default location in the registry where you will find the keys for the section.</li>
     * <li>If there is no <b>myfile.ini</b> subkey, or if it does not contain an entry for the section name, then look for the actual MyFile.ini on the disk and read its contents.</li>
     * </ol>
     * When looking at values in the registry that specify other registry locations, there are several prefixes that change the behavior of the .ini file mapping:
     * 
     * <ul>
     * <li>! - this character forces all writes to go both to the registry and to the .ini file on disk.</li>
     * <li># - this character causes the registry value to be set to the value in the Windows 3.1 .ini file when a new user logs in for the first time after setup.</li>
     * <li>@ - this character prevents any reads from going to the .ini file on disk if the requested data is not found in the registry.</li>
     * <li>USR: - this prefix stands for <b>HKEY_CURRENT_USER</b>, and the text after the prefix is relative to that key.</li>
     * <li>SYS: - this prefix stands for <b>HKEY_LOCAL_MACHINE\SOFTWARE</b>, and the text after the prefix is relative to that key.</li>
     * </ul>
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winbase.h header defines GetPrivateProfileStruct as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<PWSTR>} lpszSection The name of the section in the initialization file.
     * @param {Pointer<PWSTR>} lpszKey The name of the key whose data is to be retrieved.
     * @param {Pointer<Void>} lpStruct A pointer to the buffer that receives the data associated with the file, section, and key names.
     * @param {Integer} uSizeStruct The size of the buffer pointed to by the <i>lpStruct</i> parameter, in bytes.
     * @param {Pointer<PWSTR>} szFile The name of the initialization file. If this parameter does not contain a full path to the file, the system searches for the file in the Windows directory.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getprivateprofilestructw
     * @since windows5.0
     */
    static GetPrivateProfileStructW(lpszSection, lpszKey, lpStruct, uSizeStruct, szFile) {
        result := DllCall("KERNEL32.dll\GetPrivateProfileStructW", "ptr", lpszSection, "ptr", lpszKey, "ptr", lpStruct, "uint", uSizeStruct, "ptr", szFile, "int")
        return result
    }

    /**
     * Copies data into a key in the specified section of an initialization file. As it copies the data, the function calculates a checksum and appends it to the end of the data. (ANSI)
     * @remarks
     * A section in the initialization file must have the following form:
     * 				
     * 			
     * 
     * 
     * ``` syntax
     * [section]
     * key=string
     *       .
     *       .
     *       .
     * ```
     * 
     * If the <i>szFile</i> parameter does not contain a full path and file name for the file, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-writeprivateprofilestringa">WritePrivateProfileString</a> searches the Windows directory for the file. If the file does not exist, this function creates the file in the Windows directory.
     * 
     * If <i>szFile</i> contains a full path and file name and the file does not exist, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-writeprofilestringa">WriteProfileString</a> creates the file. The specified directory must already exist.
     * 
     * The system keeps a cached version of the most recent registry file mapping to improve performance. If all parameters are <b>NULL</b>, the function flushes the cache. While the system is editing the cached version of the file, processes that edit the file itself will use the original file until the cache has been cleared.
     * 
     * The system maps most .ini file references to the registry, using the mapping defined under the following registry key:<pre><b>HKEY_LOCAL_MACHINE</b>
     *    <b>SOFTWARE</b>
     *       <b>Microsoft</b>
     *          <b>Windows NT</b>
     *             <b>CurrentVersion</b>
     *                <b>IniFileMapping</b></pre>
     * 
     * 
     * This mapping is likely if an application modifies system-component initialization files, such as Control.ini, System.ini, and Winfile.ini. In this case, the 
     * function writes information to the registry, not to the initialization file; the change in the storage location has no effect on the function's behavior.
     * 
     * The profile functions use the following steps to locate initialization information:
     * 				
     * 
     * <ol>
     * <li>Look in the registry for the name of the initialization file  under the <b>IniFileMapping</b> key.</li>
     * <li>Look for the section name specified by <i>lpAppName</i>. This will be a named value under the key that has the name of the initialization file, or a subkey with this name, or the name will not exist as either a value or subkey.</li>
     * <li>If the section name specified by <i>lpAppName</i> is a named value, then that value specifies where in the registry you will find the keys for the section.</li>
     * <li>If the section name specified by <i>lpAppName</i> is a subkey, then named values under that subkey specify where in the registry you will find the keys for the section. If the key you are looking for does not exist as a named value, then there will be an unnamed value (shown as <b>&lt;No Name&gt;</b>) that specifies the default location in the registry where you will find the key.</li>
     * <li>If the section name specified by <i>lpAppName</i> does not exist as a named value or as a subkey, then there will be an unnamed value (shown as <b>&lt;No Name&gt;</b>) that specifies the default location in the registry where you will find the keys for the section.</li>
     * <li>If there is no subkey or entry for the section name, then look for the actual initialization file on the disk and read its contents.</li>
     * </ol>
     * When looking at values in the registry that specify other registry locations, there are several prefixes that change the behavior of the .ini file mapping:
     * 
     * <ul>
     * <li>! - this character forces all writes to go both to the registry and to the .ini file on disk.</li>
     * <li># - this character causes the registry value to be set to the value in the Windows 3.1 .ini file when a new user logs in for the first time after setup.</li>
     * <li>@ - this character prevents any reads from going to the .ini file on disk if the requested data is not found in the registry.</li>
     * <li>USR: - this prefix stands for <b>HKEY_CURRENT_USER</b>, and the text after the prefix is relative to that key.</li>
     * <li>SYS: - this prefix stands for <b>HKEY_LOCAL_MACHINE\SOFTWARE</b>, and the text after the prefix is relative to that key.</li>
     * </ul>
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winbase.h header defines WritePrivateProfileStruct as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<PSTR>} lpszSection The name of the section to which the string will be copied. If the section does not exist, it is created. The name of the section is case independent, the string can be any combination of uppercase and lowercase letters.
     * @param {Pointer<PSTR>} lpszKey The name of the key to be associated with a string. If the key does not exist in the specified section, it is created. If this parameter is <b>NULL</b>, the entire section, including all keys and entries within the section, is deleted.
     * @param {Pointer<Void>} lpStruct The data to be copied. If this parameter is <b>NULL</b>, the key is deleted.
     * @param {Integer} uSizeStruct The size of the buffer pointed to by the <i>lpStruct</i> parameter, in bytes.
     * @param {Pointer<PSTR>} szFile The  name of the initialization file. If this parameter is <b>NULL</b>, the information is copied into the Win.ini file.
     * 
     * If the file was created using Unicode characters, the function writes Unicode characters to the file. Otherwise, the function writes ANSI characters.
     * @returns {Integer} If the function successfully copies the string to the initialization file, the return value is nonzero.
     * 
     * If the function fails, or if it flushes the cached version of the most recently accessed initialization file, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-writeprivateprofilestructa
     * @since windows5.0
     */
    static WritePrivateProfileStructA(lpszSection, lpszKey, lpStruct, uSizeStruct, szFile) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\WritePrivateProfileStructA", "ptr", lpszSection, "ptr", lpszKey, "ptr", lpStruct, "uint", uSizeStruct, "ptr", szFile, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Copies data into a key in the specified section of an initialization file. As it copies the data, the function calculates a checksum and appends it to the end of the data. (Unicode)
     * @remarks
     * A section in the initialization file must have the following form:
     * 				
     * 			
     * 
     * 
     * 
     * ``` syntax
     * [section]
     * key=struct
     * 
     *       .
     *       .
     *       .
     * ```
     * 
     * If the <i>szFile</i> parameter does not contain a full path and file name for the file, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-writeprivateprofilestringa">WritePrivateProfileString</a> searches the Windows directory for the file. If the file does not exist, this function creates the file in the Windows directory.
     * 
     * If <i>szFile</i> contains a full path and file name and the file does not exist, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-writeprofilestringa">WriteProfileString</a> creates the file. The specified directory must already exist.
     * 
     * The system keeps a cached version of the most recent registry file mapping to improve performance. If all parameters are <b>NULL</b>, the function flushes the cache. While the system is editing the cached version of the file, processes that edit the file itself will use the original file until the cache has been cleared.
     * 
     * The system maps most .ini file references to the registry, using the mapping defined under the following registry key:<pre><b>HKEY_LOCAL_MACHINE</b>
     *    <b>SOFTWARE</b>
     *       <b>Microsoft</b>
     *          <b>Windows NT</b>
     *             <b>CurrentVersion</b>
     *                <b>IniFileMapping</b></pre>
     * 
     * 
     * This mapping is likely if an application modifies system-component initialization files, such as Control.ini, System.ini, and Winfile.ini. In this case, the 
     * function writes information to the registry, not to the initialization file; the change in the storage location has no effect on the function's behavior.
     * 
     * The profile functions use the following steps to locate initialization information:
     * 				
     * 
     * <ol>
     * <li>Look in the registry for the name of the initialization file  under the <b>IniFileMapping</b> key.</li>
     * <li>Look for the section name specified by <i>lpAppName</i>. This will be a named value under the key that has the name of the initialization file, or a subkey with this name, or the name will not exist as either a value or subkey.</li>
     * <li>If the section name specified by <i>lpAppName</i> is a named value, then that value specifies where in the registry you will find the keys for the section.</li>
     * <li>If the section name specified by <i>lpAppName</i> is a subkey, then named values under that subkey specify where in the registry you will find the keys for the section. If the key you are looking for does not exist as a named value, then there will be an unnamed value (shown as <b>&lt;No Name&gt;</b>) that specifies the default location in the registry where you will find the key.</li>
     * <li>If the section name specified by <i>lpAppName</i> does not exist as a named value or as a subkey, then there will be an unnamed value (shown as <b>&lt;No Name&gt;</b>) that specifies the default location in the registry where you will find the keys for the section.</li>
     * <li>If there is no subkey or entry for the section name, then look for the actual initialization file on the disk and read its contents.</li>
     * </ol>
     * When looking at values in the registry that specify other registry locations, there are several prefixes that change the behavior of the .ini file mapping:
     * 
     * <ul>
     * <li>! - this character forces all writes to go both to the registry and to the .ini file on disk.</li>
     * <li># - this character causes the registry value to be set to the value in the Windows 3.1 .ini file when a new user logs in for the first time after setup.</li>
     * <li>@ - this character prevents any reads from going to the .ini file on disk if the requested data is not found in the registry.</li>
     * <li>USR: - this prefix stands for <b>HKEY_CURRENT_USER</b>, and the text after the prefix is relative to that key.</li>
     * <li>SYS: - this prefix stands for <b>HKEY_LOCAL_MACHINE\SOFTWARE</b>, and the text after the prefix is relative to that key.</li>
     * </ul>
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winbase.h header defines WritePrivateProfileStruct as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<PWSTR>} lpszSection The name of the section to which the struct data will be copied. If the section does not exist, it is created. The name of the section is case independent.
     * @param {Pointer<PWSTR>} lpszKey The name of the key to be associated with a struct. If the key does not exist in the specified section, it is created. If this parameter is <b>NULL</b>, the entire section, including all keys and entries within the section, is deleted.
     * @param {Pointer<Void>} lpStruct The data to be copied. If this parameter is <b>NULL</b>, the key is deleted.
     * @param {Integer} uSizeStruct The size of the buffer pointed to by the <i>lpStruct</i> parameter, in bytes.
     * @param {Pointer<PWSTR>} szFile The  name of the initialization file. If this parameter is <b>NULL</b>, the information is copied into the Win.ini file.
     * 
     * If the file was created using Unicode characters, the function writes Unicode characters to the file. Otherwise, the function writes ANSI characters.
     * @returns {Integer} If the function successfully copies the struct to the initialization file, the return value is nonzero.
     * 
     * If the function fails, or if it flushes the cached version of the most recently accessed initialization file, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-writeprivateprofilestructw
     * @since windows5.0
     */
    static WritePrivateProfileStructW(lpszSection, lpszKey, lpStruct, uSizeStruct, szFile) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\WritePrivateProfileStructW", "ptr", lpszSection, "ptr", lpszKey, "ptr", lpStruct, "uint", uSizeStruct, "ptr", szFile, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} lp 
     * @param {Pointer} ucb 
     * @returns {Integer} 
     */
    static IsBadHugeReadPtr(lp, ucb) {
        result := DllCall("KERNEL32.dll\IsBadHugeReadPtr", "ptr", lp, "ptr", ucb, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} lp 
     * @param {Pointer} ucb 
     * @returns {Integer} 
     */
    static IsBadHugeWritePtr(lp, ucb) {
        result := DllCall("KERNEL32.dll\IsBadHugeWritePtr", "ptr", lp, "ptr", ucb, "int")
        return result
    }

    /**
     * Retrieves the NetBIOS name of the local computer. This name is established at system startup, when the system reads it from the registry. (ANSI)
     * @remarks
     * The 
     * <b>GetComputerName</b> function retrieves the NetBIOS name established at system startup. Name changes made by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sysinfoapi/nf-sysinfoapi-setcomputernamea">SetComputerName</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sysinfoapi/nf-sysinfoapi-setcomputernameexa">SetComputerNameEx</a> functions do not take effect until the user restarts the computer.
     * 
     * If the caller is running under a client session, this function returns the server name. To retrieve the client name, use the <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsquerysessioninformationa">WTSQuerySessionInformation</a> function.
     * @param {Pointer<PSTR>} lpBuffer A pointer to a buffer that receives the computer name or the cluster virtual server name. The buffer size should be large enough to contain MAX_COMPUTERNAME_LENGTH + 1 characters.
     * @param {Pointer<UInt32>} nSize On input, specifies the size of the buffer, in <b>TCHARs</b>. On output, the number of <b>TCHARs</b> copied to the destination buffer, not including the terminating null character. 
     * 
     * 
     * 
     * 
     * If the buffer is too small, the function fails and <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns ERROR_BUFFER_OVERFLOW. The <i>lpnSize</i> parameter specifies the size of the buffer required, including the terminating null character.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getcomputernamea
     * @since windows5.0
     */
    static GetComputerNameA(lpBuffer, nSize) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetComputerNameA", "ptr", lpBuffer, "ptr", nSize, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the NetBIOS name of the local computer. This name is established at system startup, when the system reads it from the registry. (Unicode)
     * @remarks
     * The 
     * <b>GetComputerName</b> function retrieves the NetBIOS name established at system startup. Name changes made by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sysinfoapi/nf-sysinfoapi-setcomputernamea">SetComputerName</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sysinfoapi/nf-sysinfoapi-setcomputernameexa">SetComputerNameEx</a> functions do not take effect until the user restarts the computer.
     * 
     * If the caller is running under a client session, this function returns the server name. To retrieve the client name, use the <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsquerysessioninformationa">WTSQuerySessionInformation</a> function.
     * @param {Pointer<PWSTR>} lpBuffer A pointer to a buffer that receives the computer name or the cluster virtual server name. The buffer size should be large enough to contain MAX_COMPUTERNAME_LENGTH + 1 characters.
     * @param {Pointer<UInt32>} nSize On input, specifies the size of the buffer, in <b>TCHARs</b>. On output, the number of <b>TCHARs</b> copied to the destination buffer, not including the terminating null character. 
     * 
     * 
     * 
     * 
     * If the buffer is too small, the function fails and <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns ERROR_BUFFER_OVERFLOW. The <i>lpnSize</i> parameter specifies the size of the buffer required, including the terminating null character.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getcomputernamew
     * @since windows5.0
     */
    static GetComputerNameW(lpBuffer, nSize) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetComputerNameW", "ptr", lpBuffer, "ptr", nSize, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Converts a DNS-style host name to a NetBIOS-style computer name. (ANSI)
     * @remarks
     * This function performs a textual mapping of the name. This convention limits the names of computers to be the common subset of the names. (Specifically, the leftmost label of the DNS name is truncated to 15-bytes of OEM characters.) Therefore, do not use this function to convert a DNS domain name to a NetBIOS domain name. There is no textual mapping for domain names.
     * 
     * To compile an application that uses this function, define _WIN32_WINNT as 0x0500 or later. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WinProg/using-the-windows-headers">Using the Windows Headers</a>.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winbase.h header defines DnsHostnameToComputerName as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<PSTR>} Hostname The DNS name. If the DNS name is not a valid, translatable name, the function fails. For more information, see <a href="https://docs.microsoft.com/windows/desktop/SysInfo/computer-names">Computer Names</a>.
     * @param {Pointer<PSTR>} ComputerName A pointer to a buffer that receives the computer name. The buffer size should be large enough to contain MAX_COMPUTERNAME_LENGTH + 1 characters.
     * @param {Pointer<UInt32>} nSize On input, specifies the size of the buffer, in <b>TCHARs</b>. On output, receives the number of <b>TCHARs</b> copied to the destination buffer, not including the terminating null character. 
     * 
     * 
     * 
     * 
     * If the buffer is too small, the function fails, <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns ERROR_MORE_DATA, and <i>nSize</i> receives the required buffer size, not including the terminating null character.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Possible values include the following.
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
     * The <i>ComputerName</i> buffer is too small. The <i>nSize</i> parameter contains the number of bytes required to receive the name.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-dnshostnametocomputernamea
     * @since windows5.0
     */
    static DnsHostnameToComputerNameA(Hostname, ComputerName, nSize) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\DnsHostnameToComputerNameA", "ptr", Hostname, "ptr", ComputerName, "ptr", nSize, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Converts a DNS-style host name to a NetBIOS-style computer name. (Unicode)
     * @remarks
     * This function performs a textual mapping of the name. This convention limits the names of computers to be the common subset of the names. (Specifically, the leftmost label of the DNS name is truncated to 15-bytes of OEM characters.) Therefore, do not use this function to convert a DNS domain name to a NetBIOS domain name. There is no textual mapping for domain names.
     * 
     * To compile an application that uses this function, define _WIN32_WINNT as 0x0500 or later. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WinProg/using-the-windows-headers">Using the Windows Headers</a>.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winbase.h header defines DnsHostnameToComputerName as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<PWSTR>} Hostname The DNS name. If the DNS name is not a valid, translatable name, the function fails. For more information, see <a href="https://docs.microsoft.com/windows/desktop/SysInfo/computer-names">Computer Names</a>.
     * @param {Pointer<PWSTR>} ComputerName A pointer to a buffer that receives the computer name. The buffer size should be large enough to contain MAX_COMPUTERNAME_LENGTH + 1 characters.
     * @param {Pointer<UInt32>} nSize On input, specifies the size of the buffer, in <b>TCHARs</b>. On output, receives the number of <b>TCHARs</b> copied to the destination buffer, not including the terminating null character. 
     * 
     * 
     * 
     * 
     * If the buffer is too small, the function fails, <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns ERROR_MORE_DATA, and <i>nSize</i> receives the required buffer size, not including the terminating null character.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Possible values include the following.
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
     * The <i>ComputerName</i> buffer is too small. The <i>nSize</i> parameter contains the number of bytes required to receive the name.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-dnshostnametocomputernamew
     * @since windows5.0
     */
    static DnsHostnameToComputerNameW(Hostname, ComputerName, nSize) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\DnsHostnameToComputerNameW", "ptr", Hostname, "ptr", ComputerName, "ptr", nSize, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the name of the user associated with the current thread. (ANSI)
     * @remarks
     * If the current thread is impersonating another client, the 
     * <b>GetUserName</b> function returns the user name of the client that the thread is impersonating.
     * 
     * If <b>GetUserName</b> is called from a process that is running under the  "NETWORK SERVICE" account, the string returned in <i>lpBuffer</i> may be different depending on the version of Windows.  On Windows XP, the "NETWORK SERVICE" string is returned. On Windows Vista, the “&lt;HOSTNAME&gt;$” string is returned.
     * @param {Pointer<PSTR>} lpBuffer A pointer to the buffer to receive the user's logon name. If this buffer is not large enough to contain the entire user name, the function fails. A buffer size of (UNLEN + 1) characters will hold the maximum length user name including the terminating null character. UNLEN is defined in Lmcons.h.
     * @param {Pointer<UInt32>} pcbBuffer On input, this variable specifies the size of the <i>lpBuffer</i> buffer, in <b>TCHARs</b>. On output, the variable receives the number of <b>TCHARs</b> copied to the buffer, including the terminating null character. 
     * 
     * 
     * 
     * 
     * If <i>lpBuffer</i> is too small, the function fails and <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns ERROR_INSUFFICIENT_BUFFER. This parameter receives the required buffer size, including the terminating null character.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value, and the variable pointed to by <i>lpnSize</i> contains the number of <b>TCHARs</b> copied to the buffer specified by <i>lpBuffer</i>, including the terminating null character.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getusernamea
     * @since windows5.0
     */
    static GetUserNameA(lpBuffer, pcbBuffer) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\GetUserNameA", "ptr", lpBuffer, "ptr", pcbBuffer, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the name of the user associated with the current thread. (Unicode)
     * @remarks
     * If the current thread is impersonating another client, the 
     * <b>GetUserName</b> function returns the user name of the client that the thread is impersonating.
     * 
     * If <b>GetUserName</b> is called from a process that is running under the  "NETWORK SERVICE" account, the string returned in <i>lpBuffer</i> may be different depending on the version of Windows.  On Windows XP, the "NETWORK SERVICE" string is returned. On Windows Vista, the “&lt;HOSTNAME&gt;$” string is returned.
     * @param {Pointer<PWSTR>} lpBuffer A pointer to the buffer to receive the user's logon name. If this buffer is not large enough to contain the entire user name, the function fails. A buffer size of (UNLEN + 1) characters will hold the maximum length user name including the terminating null character. UNLEN is defined in Lmcons.h.
     * @param {Pointer<UInt32>} pcbBuffer On input, this variable specifies the size of the <i>lpBuffer</i> buffer, in <b>TCHARs</b>. On output, the variable receives the number of <b>TCHARs</b> copied to the buffer, including the terminating null character. 
     * 
     * 
     * 
     * 
     * If <i>lpBuffer</i> is too small, the function fails and <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns ERROR_INSUFFICIENT_BUFFER. This parameter receives the required buffer size, including the terminating null character.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value, and the variable pointed to by <i>lpnSize</i> contains the number of <b>TCHARs</b> copied to the buffer specified by <i>lpBuffer</i>, including the terminating null character.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getusernamew
     * @since windows5.0
     */
    static GetUserNameW(lpBuffer, pcbBuffer) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\GetUserNameW", "ptr", lpBuffer, "ptr", pcbBuffer, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} TokenHandle 
     * @returns {Integer} 
     */
    static IsTokenUntrusted(TokenHandle) {
        result := DllCall("ADVAPI32.dll\IsTokenUntrusted", "ptr", TokenHandle, "int")
        return result
    }

    /**
     * Retrieves information about the current hardware profile for the local computer. (ANSI)
     * @remarks
     * The 
     * <b>GetCurrentHwProfile</b> function retrieves the display name and globally unique identifier (GUID) string for the hardware profile. The function also retrieves the reported docking state for portable computers with docking stations.
     * 
     * The system generates a GUID for each hardware profile and stores it as a string in the registry. You can use 
     * <b>GetCurrentHwProfile</b> to retrieve the GUID string to use as a registry subkey under your application's configuration settings key in <b>HKEY_CURRENT_USER</b>. This enables you to store each user's settings for each hardware profile. For example, the Colors control panel application could use the subkey to store each user's color preferences for different hardware profiles, such as profiles for the docked and undocked states. Applications that use this functionality can check the current hardware profile when they start up, and update their settings accordingly.
     * 
     * Applications can also update their settings when a system device message, such as 
     * <a href="https://docs.microsoft.com/windows/desktop/DevIO/dbt-configchanged">DBT_CONFIGCHANGED</a>, indicates that the hardware profile has changed.
     * 
     * To compile an application that uses this function, define the _WIN32_WINNT macro as 0x0400 or later. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WinProg/using-the-windows-headers">Using the Windows Headers</a>.
     * @param {Pointer<HW_PROFILE_INFOA>} lpHwProfileInfo A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-hw_profile_infoa">HW_PROFILE_INFO</a> structure that receives information about the current hardware profile.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getcurrenthwprofilea
     * @since windows5.0
     */
    static GetCurrentHwProfileA(lpHwProfileInfo) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\GetCurrentHwProfileA", "ptr", lpHwProfileInfo, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves information about the current hardware profile for the local computer. (Unicode)
     * @remarks
     * The 
     * <b>GetCurrentHwProfile</b> function retrieves the display name and globally unique identifier (GUID) string for the hardware profile. The function also retrieves the reported docking state for portable computers with docking stations.
     * 
     * The system generates a GUID for each hardware profile and stores it as a string in the registry. You can use 
     * <b>GetCurrentHwProfile</b> to retrieve the GUID string to use as a registry subkey under your application's configuration settings key in <b>HKEY_CURRENT_USER</b>. This enables you to store each user's settings for each hardware profile. For example, the Colors control panel application could use the subkey to store each user's color preferences for different hardware profiles, such as profiles for the docked and undocked states. Applications that use this functionality can check the current hardware profile when they start up, and update their settings accordingly.
     * 
     * Applications can also update their settings when a system device message, such as 
     * <a href="https://docs.microsoft.com/windows/desktop/DevIO/dbt-configchanged">DBT_CONFIGCHANGED</a>, indicates that the hardware profile has changed.
     * 
     * To compile an application that uses this function, define the _WIN32_WINNT macro as 0x0400 or later. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WinProg/using-the-windows-headers">Using the Windows Headers</a>.
     * @param {Pointer<HW_PROFILE_INFOW>} lpHwProfileInfo A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-hw_profile_infoa">HW_PROFILE_INFO</a> structure that receives information about the current hardware profile.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getcurrenthwprofilew
     * @since windows5.0
     */
    static GetCurrentHwProfileW(lpHwProfileInfo) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\GetCurrentHwProfileW", "ptr", lpHwProfileInfo, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} TargetPartition 
     * @param {Pointer<PWSTR>} SparePartition 
     * @param {Integer} Flags 
     * @returns {Integer} 
     */
    static ReplacePartitionUnit(TargetPartition, SparePartition, Flags) {
        result := DllCall("KERNEL32.dll\ReplacePartitionUnit", "ptr", TargetPartition, "ptr", SparePartition, "uint", Flags, "int")
        return result
    }

    /**
     * The GetThreadEnabledXStateFeatures function returns the set of XState features that are currently enabled for the current thread.
     * @remarks
     * This function is related to <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-getenabledxstatefeatures">GetEnabledXStateFeatures</a>, which returns the set of XState features enabled in the system.
     * Prior to the introduction of optional XState features, the set of enabled XState features is the same for every thread in the system because all supported features are always enabled, thus the result returned from GetEnabledXStateFeatures and this function are identical.
     * With optional XState features, it is possible for optional XState features to be disabled by default for newly created threads and enabled on demand later. Optional XState features that are currently disabled for the current thread will not be returned by this function, but will still be returned by GetEnabledXStateFeatures.
     * @returns {Integer} The return value is a bitmask in which each bit represents an XState feature that is currently enabled for the current thread.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getthreadenabledxstatefeatures
     */
    static GetThreadEnabledXStateFeatures() {
        result := DllCall("KERNEL32.dll\GetThreadEnabledXStateFeatures", "uint")
        return result
    }

    /**
     * The EnableProcessOptionalXStateFeatures function enables a set of optional XState features for the current process.
     * @remarks
     * In general, optional XState features are disabled by default for newly created threads and enabled on demand later.
     * When this function returns, the specified optional XState features will be enabled for all existing threads in the current process, and all future threads created in the process will have the specified optional XState features enabled at thread creation time.
     * 
     * Only XState feature bits supported by the system are allowed to be supplied to this function, otherwise an error is returned. The XState feature bits supported by the system can be obtained via the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-getenabledxstatefeatures">GetEnabledXStateFeatures</a> routine.
     * If non-optional XState feature bits supported by the system are supplied (for example AVX, AVX2, etc. are non-optional XState features), those are ignored and will not cause this function to return an error. Note that all non-optional XState features supported by the system are always enabled for every thread by default.
     * @param {Integer} Features A bitmask in which each bit represents an optional XState feature to enable for the current process.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-enableprocessoptionalxstatefeatures
     */
    static EnableProcessOptionalXStateFeatures(Features) {
        result := DllCall("KERNEL32.dll\EnableProcessOptionalXStateFeatures", "uint", Features, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<CUSTOM_SYSTEM_EVENT_TRIGGER_CONFIG>} CustomSystemEventTriggerConfig 
     * @returns {Integer} 
     */
    static RaiseCustomSystemEventTrigger(CustomSystemEventTriggerConfig) {
        result := DllCall("api-ms-win-core-backgroundtask-l1-1-0.dll\RaiseCustomSystemEventTrigger", "ptr", CustomSystemEventTriggerConfig, "uint")
        return result
    }

    /**
     * Determines whether or not a specified name can be used to create a file on the FAT file system.
     * @remarks
     * This function does not have an associated import library. You must use the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya">LoadLibrary</a> and 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a> functions to dynamically link to
     *     NtDll.dll.
     * @param {Pointer<UNICODE_STRING>} Name The file name, in 8.3 format.
     * @param {Pointer<STRING>} OemName A pointer to a buffer that receives the OEM string that corresponds to <i>Name</i>.
     * 
     * This parameter can be <b>NULL</b>.
     * @param {Pointer<Byte>} NameContainsSpaces If the function returns <b>TRUE</b>, this parameter indicates whether or not the name 
     *        contains spaces.
     * 
     * If the function returns <b>FALSE</b>, this parameter is undefined.
     * @returns {Integer} If the specified name forms a valid 8.3 FAT file system name in the current OEM code page, the function 
     *       returns <b>TRUE</b>. Otherwise, the function returns <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/winternl/nf-winternl-rtlisnamelegaldos8dot3
     */
    static RtlIsNameLegalDOS8Dot3(Name, OemName, NameContainsSpaces) {
        result := DllCall("ntdll.dll\RtlIsNameLegalDOS8Dot3", "ptr", Name, "ptr", OemName, "ptr", NameContainsSpaces, "char")
        return result
    }

    /**
     * Converts the specified local time to system time.
     * @remarks
     * This function has no associated import library. You must use the <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya">LoadLibrary</a> and <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a> functions to dynamically link to Ntdll.dll.
     * @param {Pointer<Int64>} LocalTime A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-large_integer-r1">LARGE_INTEGER</a> structure that specifies the local time.
     * @param {Pointer<Int64>} SystemTime A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-large_integer-r1">LARGE_INTEGER</a> structure that receives the returned system time.
     * @returns {Integer} If the function succeeds, it returns STATUS_SUCCESS.  If it fails, it will return the appropriate status code.
     * @see https://learn.microsoft.com/windows/win32/api/winternl/nf-winternl-rtllocaltimetosystemtime
     */
    static RtlLocalTimeToSystemTime(LocalTime, SystemTime) {
        result := DllCall("ntdll.dll\RtlLocalTimeToSystemTime", "ptr", LocalTime, "ptr", SystemTime, "int")
        return result
    }

    /**
     * Converts the specified 64-bit system time to the number of seconds since the beginning of January 1, 1970.
     * @remarks
     * This function has no associated import library. You must use the <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya">LoadLibrary</a> and <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a> functions to dynamically link to Ntdll.dll.
     * 
     * There is no single equivalent public  function. To perform this task using public  functions, use the following steps:
     * 
     * 
     * 
     * <ol>
     * <li>Call  <a href="https://docs.microsoft.com/windows/desktop/api/timezoneapi/nf-timezoneapi-systemtimetofiletime">SystemTimeToFileTime</a> to copy the system time to a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure. Call <a href="https://docs.microsoft.com/windows/desktop/api/sysinfoapi/nf-sysinfoapi-getsystemtime">GetSystemTime</a> to get the current system time to pass to <b>SystemTimeToFileTime</b>.</li>
     * <li>Copy the contents of the <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure to a <a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-ularge_integer-r1">ULARGE_INTEGER</a> structure.</li>
     * <li>Initialize a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure with the date and time of the first second of January 1, 1970.</li>
     * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/timezoneapi/nf-timezoneapi-systemtimetofiletime">SystemTimeToFileTime</a>, passing the <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure initialized in Step 3 to the call.</li>
     * <li>Copy the contents of the <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure returned by <a href="https://docs.microsoft.com/windows/desktop/api/timezoneapi/nf-timezoneapi-systemtimetofiletime">SystemTimeToFileTime</a> in Step 4 to a second <a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-ularge_integer-r1">ULARGE_INTEGER</a>.
     * The copied value should be less than or equal to the value copied in Step 2.</li>
     * <li>Subtract the 64-bit value in the <a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-ularge_integer-r1">ULARGE_INTEGER</a> structure initialized in Step 5 (January 1, 1970) from the 64-bit value of the <b>ULARGE_INTEGER</b> structure initialized in Step 2 (the current system time). This produces a value in 100-nanosecond intervals since January 1, 1970. To convert this value to seconds, divide by 10,000,000.</li>
     * </ol>
     * @param {Pointer<Int64>} Time A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-large_integer-r1">LARGE_INTEGER</a> structure that specifies the system time. The valid years for this value are 1970 to  2105 inclusive.
     * @param {Pointer<UInt32>} ElapsedSeconds A pointer to a variable that receives the number of seconds.
     * @returns {Integer} If the function succeeds, it returns <b>TRUE</b>. If it fails, it returns <b>FALSE</b>. Typically, this function will fail if the specified value of the  <i>Time</i> parameter is not within the valid timeframe specified in the parameter description.
     * @see https://learn.microsoft.com/windows/win32/api/winternl/nf-winternl-rtltimetosecondssince1970
     */
    static RtlTimeToSecondsSince1970(Time, ElapsedSeconds) {
        result := DllCall("ntdll.dll\RtlTimeToSecondsSince1970", "ptr", Time, "ptr", ElapsedSeconds, "char")
        return result
    }

    /**
     * Frees the string buffer allocated by RtlUnicodeStringToAnsiString.
     * @remarks
     * This routine does not release the Unicode string buffer passed to <a href="https://docs.microsoft.com/windows/desktop/api/winternl/nf-winternl-rtlunicodestringtoansistring">RtlUnicodeStringToAnsiString</a>.
     * @param {Pointer<STRING>} AnsiString A pointer to an ANSI string whose buffer was previously allocated by <a href="https://docs.microsoft.com/windows/desktop/api/winternl/nf-winternl-rtlunicodestringtoansistring">RtlUnicodeStringToAnsiString</a>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/winternl/nf-winternl-rtlfreeansistring
     * @since windows5.0
     */
    static RtlFreeAnsiString(AnsiString) {
        DllCall("ntdll.dll\RtlFreeAnsiString", "ptr", AnsiString)
    }

    /**
     * Frees the string buffer allocated by RtlAnsiStringToUnicodeString or by RtlUpcaseUnicodeString.
     * @remarks
     * This routine does not release the ANSI string buffer passed to <a href="https://docs.microsoft.com/windows/desktop/api/winternl/nf-winternl-rtlansistringtounicodestring">RtlAnsiStringToUnicodeString</a> or <b>RtlUpcaseUnicodeString</b>.
     * 		
     * 
     * Because there is no import library for this function, you must use <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a>.
     * @param {Pointer<UNICODE_STRING>} UnicodeString A pointer to the Unicode string whose
     *         buffer was previously allocated by <a href="https://docs.microsoft.com/windows/desktop/api/winternl/nf-winternl-rtlansistringtounicodestring">RtlAnsiStringToUnicodeString</a>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/winternl/nf-winternl-rtlfreeunicodestring
     * @since windows5.0
     */
    static RtlFreeUnicodeString(UnicodeString) {
        DllCall("ntdll.dll\RtlFreeUnicodeString", "ptr", UnicodeString)
    }

    /**
     * Frees the string buffer allocated by RtlUnicodeStringToOemString.
     * @remarks
     * This routine releases the <b>Buffer</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/winternl/ns-winternl-string">OEM_STRING</a> structure. The <b>Length</b> and <b>MaximumLength</b> members are not affected by this routine.
     * @param {Pointer<STRING>} OemString Address of the OEM string whose buffer
     *         was previously allocated by <a href="https://docs.microsoft.com/windows/desktop/api/winternl/nf-winternl-rtlunicodestringtooemstring">RtlUnicodeStringToOemString</a>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/winternl/nf-winternl-rtlfreeoemstring
     * @since windows5.0
     */
    static RtlFreeOemString(OemString) {
        DllCall("ntdll.dll\RtlFreeOemString", "ptr", OemString)
    }

    /**
     * Initializes a counted string.
     * @remarks
     * <b>Security Warning:  </b>Do not allow the <i>SourceString</i> parameter size to exceed <b>MAX_USHORT</b> characters.
     * 
     * Because there is no import library for this function, you must use <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a>.
     * 
     * 
     * 		
     * 
     * <div class="alert"><b>Note</b>  <b>RtlInitString</b> is available in Windows XP. It might be altered or unavailable in subsequent versions.</div>
     * <div> </div>
     * @param {Pointer<STRING>} DestinationString The counted string to be initialized. The <i>DestinationString</i> is initialized to point to the <i>SourceString</i>. The <b>Length</b> and <b>MaximumLength</b> fields of the <i>DestinationString</i> are initialized to the length of the <i>SourceString</i>.
     * @param {Pointer<SByte>} SourceString A pointer to a null-terminated string. If the <i>SourceString</i> is not specified, the <b>Length</b> and <b>MaximumLength</b> fields of the <i>DestinationString</i> are initialized to zero.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/winternl/nf-winternl-rtlinitstring
     */
    static RtlInitString(DestinationString, SourceString) {
        DllCall("ntdll.dll\RtlInitString", "ptr", DestinationString, "ptr", SourceString)
    }

    /**
     * 
     * @param {Pointer<STRING>} DestinationString 
     * @param {Pointer<SByte>} SourceString 
     * @returns {Integer} 
     */
    static RtlInitStringEx(DestinationString, SourceString) {
        result := DllCall("ntdll.dll\RtlInitStringEx", "ptr", DestinationString, "ptr", SourceString, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<STRING>} DestinationString 
     * @param {Pointer<SByte>} SourceString 
     * @returns {String} Nothing - always returns an empty string
     */
    static RtlInitAnsiString(DestinationString, SourceString) {
        DllCall("ntdll.dll\RtlInitAnsiString", "ptr", DestinationString, "ptr", SourceString)
    }

    /**
     * 
     * @param {Pointer<STRING>} DestinationString 
     * @param {Pointer<SByte>} SourceString 
     * @returns {Integer} 
     */
    static RtlInitAnsiStringEx(DestinationString, SourceString) {
        result := DllCall("ntdll.dll\RtlInitAnsiStringEx", "ptr", DestinationString, "ptr", SourceString, "int")
        return result
    }

    /**
     * Initializes a counted Unicode string.
     * @param {Pointer<UNICODE_STRING>} DestinationString The buffer for a counted Unicode string to be initialized. The length is initialized to zero if the <i>SourceString</i> is not specified.
     * @param {Pointer<PWSTR>} SourceString Optional pointer to a null-terminated Unicode string with
     *         which to initialize the counted string.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/winternl/nf-winternl-rtlinitunicodestring
     * @since windows5.0
     */
    static RtlInitUnicodeString(DestinationString, SourceString) {
        DllCall("ntdll.dll\RtlInitUnicodeString", "ptr", DestinationString, "ptr", SourceString)
    }

    /**
     * Converts the specified ANSI source string into a Unicode string.
     * @remarks
     * The translation is done with respect to the
     *     current system locale information.
     * 		
     * 
     * If caller sets <i>AllocateDestinationString</i> to <b>TRUE</b>, the routine replaces the <b>Buffer</b> member of <i>DestinationString</i> with a pointer to the buffer it allocates. The old value can be overwritten even when the routine returns an error status code.
     * 		
     * 
     * Because there is no import library for this function, you must use <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a>.
     * @param {Pointer<UNICODE_STRING>} DestinationString A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> structure to hold the converted Unicode string. If <i>AllocateDestinationString</i> is <b>TRUE</b>, the routine allocates a new buffer to hold the string data, and updates the <b>Buffer</b> member of <i>DestinationString</i> to point to the new buffer. Otherwise, the routine uses the currently specified buffer to hold the string.
     * @param {Pointer<STRING>} SourceString A pointer to the <b>ANSI_STRING</b> structure that contains the ANSI string to be converted to Unicode.
     * @param {Integer} AllocateDestinationString Controls allocation of buffer space for the destination string.
     * @returns {Integer} The various NTSTATUS values are defined in NTSTATUS.H, which is distributed with the Windows DDK.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_SUCCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The ANSI string was converted to Unicode. On failure, the routine does not allocate any memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winternl/nf-winternl-rtlansistringtounicodestring
     * @since windows5.0
     */
    static RtlAnsiStringToUnicodeString(DestinationString, SourceString, AllocateDestinationString) {
        result := DllCall("ntdll.dll\RtlAnsiStringToUnicodeString", "ptr", DestinationString, "ptr", SourceString, "char", AllocateDestinationString, "int")
        return result
    }

    /**
     * Converts the specified Unicode source string into an ANSI string.
     * @remarks
     * The translation is done with respect to the
     *     current system locale information.
     * 		
     * 
     * Because there is no import library for this function, you must use <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a>.
     * @param {Pointer<STRING>} DestinationString A pointer to an <b>ANSI_STRING</b> structure to hold the converted ANSI string. If <i>AllocateDestinationString</i> is <b>TRUE</b>, the routine allocates a new buffer to hold the string data and updates the <b>Buffer</b> member of <i>DestinationString</i> to point to the new buffer. Otherwise, the routine uses the currently specified buffer to hold the string.
     * @param {Pointer<UNICODE_STRING>} SourceString The <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> structure that contains the source string to be converted to ANSI.
     * @param {Integer} AllocateDestinationString Controls allocation of the buffer space for the <i>DestinationString</i>.
     * @returns {Integer} The various NTSTATUS values are defined in NTSTATUS.H, which is distributed with the DDK.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_SUCCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Unicode string was converted to ANSI. Otherwise, no storage was allocated and no conversion was done.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winternl/nf-winternl-rtlunicodestringtoansistring
     * @since windows5.0
     */
    static RtlUnicodeStringToAnsiString(DestinationString, SourceString, AllocateDestinationString) {
        result := DllCall("ntdll.dll\RtlUnicodeStringToAnsiString", "ptr", DestinationString, "ptr", SourceString, "char", AllocateDestinationString, "int")
        return result
    }

    /**
     * Converts the specified Unicode source string into an OEM string. The translation is done with respect to the OEM code page (OCP).
     * @remarks
     * This routine allocates a buffer for the <i>DestinationString</i> only.
     * @param {Pointer<STRING>} DestinationString A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/winternl/ns-winternl-string">OEM_STRING</a> structure that is contains the OEM equivalent to the Unicode source string. The <b>MaximumLength</b> field is set if <i>AllocateDestinationString</i> is <b>TRUE</b>.
     * @param {Pointer<UNICODE_STRING>} SourceString A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> structure that is to be
     *         converted to OEM.
     * @param {Integer} AllocateDestinationString Controls allocation of the buffer space for the destination
     *         string.
     * @returns {Integer} The various NTSTATUS values are defined in NTSTATUS.H, which is distributed with the Windows DDK.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_SUCCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Unicode string was converted to OEM. Otherwise, no storage was allocated, and no conversion was done.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winternl/nf-winternl-rtlunicodestringtooemstring
     * @since windows5.0
     */
    static RtlUnicodeStringToOemString(DestinationString, SourceString, AllocateDestinationString) {
        result := DllCall("ntdll.dll\RtlUnicodeStringToOemString", "ptr", DestinationString, "ptr", SourceString, "char", AllocateDestinationString, "int")
        return result
    }

    /**
     * Determines how many bytes are needed to represent a Unicode string as an ANSI string.
     * @remarks
     * It is recommended that you use <a href="https://docs.microsoft.com/windows/desktop/api/stringapiset/nf-stringapiset-widechartomultibyte">WideCharToMultiByte</a> instead of <b>RtlUnicodeToMultiByteSize</b>. When its <i>cbMultiByte</i> parameter is set to zero, the <b>WideCharToMultiByte</b> function returns the number of bytes required for the buffer.
     * @param {Pointer<UInt32>} BytesInMultiByteString Returns the number of bytes for the ANSI equivalent of the Unicode string pointed to by <i>UnicodeString</i>. This number does not include the terminating <b>NULL</b> character.
     * @param {Pointer<PWSTR>} UnicodeString The Unicode source string for which the ANSI length is calculated.
     * @param {Integer} BytesInUnicodeString The number of bytes in the string pointed to by
     *         <i>UnicodeString</i>.
     * @returns {Integer} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_SUCCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The count was successful. The various NTSTATUS values are defined in NTSTATUS.H, which is distributed with the Windows DDK.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winternl/nf-winternl-rtlunicodetomultibytesize
     * @since windows5.0
     */
    static RtlUnicodeToMultiByteSize(BytesInMultiByteString, UnicodeString, BytesInUnicodeString) {
        result := DllCall("ntdll.dll\RtlUnicodeToMultiByteSize", "ptr", BytesInMultiByteString, "ptr", UnicodeString, "uint", BytesInUnicodeString, "int")
        return result
    }

    /**
     * Converts a character string to an integer.
     * @remarks
     * When converting strings to integers the preferred function to use is <a href="https://docs.microsoft.com/previous-versions/visualstudio/visual-studio-2010/w4z2wdyc(v=vs.100)">strtol, wcstol</a>.
     * 
     * There is no import library for this function. Use <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a> rather than linking to the function directly.
     * @param {Pointer<SByte>} String A pointer to the string to convert. The format of the string is as follows: 
     * 
     * [whitespace] [{+ | -}] [0 [{x | o | b}]] [digits]
     * @param {Integer} Base <b>ULONG</b> that contains the number base to use for the conversion, such as base 10. Only base 2, 8, 10, and 16 are supported.
     * @param {Pointer<UInt32>} Value A pointer to a <b>ULONG</b> that receives the integer that resulted from the conversion.
     * @returns {Integer} If the function succeeds, the function returns <b>STATUS_SUCCESS</b>.
     * @see https://learn.microsoft.com/windows/win32/api/winternl/nf-winternl-rtlchartointeger
     * @since windows5.0
     */
    static RtlCharToInteger(String, Base, Value) {
        result := DllCall("ntdll.dll\RtlCharToInteger", "ptr", String, "uint", Base, "ptr", Value, "int")
        return result
    }

    /**
     * Generates a uniform random number using D.H. Lehmer's 1948 algorithm.
     * @remarks
     * This function has no associated import library. You must use the <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya">LoadLibrary</a> and <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a> functions to dynamically link to Ntdll.dll.
     * @param {Pointer<UInt32>} Seed The seed value.
     * @returns {Integer} The function returns a random number uniformly distributed over [0..MAXLONG].
     * @see https://learn.microsoft.com/windows/win32/api/winternl/nf-winternl-rtluniform
     */
    static RtlUniform(Seed) {
        result := DllCall("ntdll.dll\RtlUniform", "ptr", Seed, "uint")
        return result
    }

    /**
     * This function is intended for infrastructure use only. (GetFeatureEnabledState)
     * @param {Integer} featureId Infrastructure use only.
     * @param {Integer} changeTime Infrastructure use only.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/featurestagingapi/nf-featurestagingapi-getfeatureenabledstate
     */
    static GetFeatureEnabledState(featureId, changeTime) {
        DllCall("api-ms-win-core-featurestaging-l1-1-0.dll\GetFeatureEnabledState", "uint", featureId, "int", changeTime)
    }

    /**
     * This function is intended for infrastructure use only. (RecordFeatureUsage)
     * @param {Integer} featureId Infrastructure use only.
     * @param {Integer} kind Infrastructure use only.
     * @param {Integer} addend Infrastructure use only.
     * @param {Pointer<PSTR>} originName Infrastructure use only.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/featurestagingapi/nf-featurestagingapi-recordfeatureusage
     */
    static RecordFeatureUsage(featureId, kind, addend, originName) {
        DllCall("api-ms-win-core-featurestaging-l1-1-0.dll\RecordFeatureUsage", "uint", featureId, "uint", kind, "uint", addend, "ptr", originName)
    }

    /**
     * This function is intended for infrastructure use only. (RecordFeatureError)
     * @param {Integer} featureId Infrastructure use only.
     * @param {Pointer<FEATURE_ERROR>} error Infrastructure use only.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/featurestagingapi/nf-featurestagingapi-recordfeatureerror
     */
    static RecordFeatureError(featureId, error) {
        DllCall("api-ms-win-core-featurestaging-l1-1-0.dll\RecordFeatureError", "uint", featureId, "ptr", error)
    }

    /**
     * This function is intended for infrastructure use only. (SubscribeFeatureStateChangeNotification)
     * @param {Pointer<FEATURE_STATE_CHANGE_SUBSCRIPTION>} subscription Infrastructure use only.
     * @param {Pointer<PFEATURE_STATE_CHANGE_CALLBACK>} callback Infrastructure use only.
     * @param {Pointer<Void>} context Infrastructure use only.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/featurestagingapi/nf-featurestagingapi-subscribefeaturestatechangenotification
     */
    static SubscribeFeatureStateChangeNotification(subscription, callback, context) {
        DllCall("api-ms-win-core-featurestaging-l1-1-0.dll\SubscribeFeatureStateChangeNotification", "ptr", subscription, "ptr", callback, "ptr", context)
    }

    /**
     * This function is intended for infrastructure use only. (UnsubscribeFeatureStateChangeNotification)
     * @param {Pointer<FEATURE_STATE_CHANGE_SUBSCRIPTION>} subscription Infrastructure use only.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/featurestagingapi/nf-featurestagingapi-unsubscribefeaturestatechangenotification
     */
    static UnsubscribeFeatureStateChangeNotification(subscription) {
        DllCall("api-ms-win-core-featurestaging-l1-1-0.dll\UnsubscribeFeatureStateChangeNotification", "ptr", subscription)
    }

    /**
     * This function is intended for infrastructure use only. (GetFeatureVariant)
     * @param {Integer} featureId Infrastructure use only.
     * @param {Integer} changeTime Infrastructure use only.
     * @param {Pointer<UInt32>} payloadId Infrastructure use only.
     * @param {Pointer<Int32>} hasNotification Infrastructure use only.
     * @returns {Integer} Infrastructure use only.
     * @see https://learn.microsoft.com/windows/win32/api/featurestagingapi/nf-featurestagingapi-getfeaturevariant
     */
    static GetFeatureVariant(featureId, changeTime, payloadId, hasNotification) {
        result := DllCall("api-ms-win-core-featurestaging-l1-1-1.dll\GetFeatureVariant", "uint", featureId, "int", changeTime, "ptr", payloadId, "ptr", hasNotification, "uint")
        return result
    }

    /**
     * Obtains a device context handle of display.
     * @returns {Pointer<HDC>} Device context handle of display.
     * @see https://learn.microsoft.com/windows/win32/api/dciman/nf-dciman-dciopenprovider
     * @since windows5.0
     */
    static DCIOpenProvider() {
        result := DllCall("DCIMAN32.dll\DCIOpenProvider", "ptr")
        return result
    }

    /**
     * Closes a device context of a display.
     * @param {Pointer<HDC>} hdc The device context handle to be closed.  The handle was created with <a href="https://docs.microsoft.com/windows/desktop/api/dciman/nf-dciman-dciopenprovider">DCIOpenProvider</a>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/dciman/nf-dciman-dcicloseprovider
     * @since windows5.0
     */
    static DCICloseProvider(hdc) {
        DllCall("DCIMAN32.dll\DCICloseProvider", "ptr", hdc)
    }

    /**
     * Creates a primary surface and obtains surface information.
     * @param {Pointer<HDC>} hdc The device context handle of the device for the primary surface to be created.
     * @param {Pointer<DCISURFACEINFO>} lplpSurface A pointer to a <b>DCISURFACEINFO</b> structure.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/dciman/nf-dciman-dcicreateprimary
     * @since windows5.0
     */
    static DCICreatePrimary(hdc, lplpSurface) {
        DllCall("DCIMAN32.dll\DCICreatePrimary", "ptr", hdc, "ptr", lplpSurface)
    }

    /**
     * 
     * @param {Pointer<HDC>} hdc 
     * @param {Integer} dwCompression 
     * @param {Integer} dwRedMask 
     * @param {Integer} dwGreenMask 
     * @param {Integer} dwBlueMask 
     * @param {Integer} dwWidth 
     * @param {Integer} dwHeight 
     * @param {Integer} dwDCICaps 
     * @param {Integer} dwBitCount 
     * @param {Pointer<DCIOFFSCREEN>} lplpSurface 
     * @returns {String} Nothing - always returns an empty string
     */
    static DCICreateOffscreen(hdc, dwCompression, dwRedMask, dwGreenMask, dwBlueMask, dwWidth, dwHeight, dwDCICaps, dwBitCount, lplpSurface) {
        DllCall("DCIMAN32.dll\DCICreateOffscreen", "ptr", hdc, "uint", dwCompression, "uint", dwRedMask, "uint", dwGreenMask, "uint", dwBlueMask, "uint", dwWidth, "uint", dwHeight, "uint", dwDCICaps, "uint", dwBitCount, "ptr", lplpSurface)
    }

    /**
     * 
     * @param {Pointer<HDC>} hdc 
     * @param {Pointer<Void>} lpOffscreenSurf 
     * @param {Pointer<DCIOVERLAY>} lplpSurface 
     * @returns {String} Nothing - always returns an empty string
     */
    static DCICreateOverlay(hdc, lpOffscreenSurf, lplpSurface) {
        DllCall("DCIMAN32.dll\DCICreateOverlay", "ptr", hdc, "ptr", lpOffscreenSurf, "ptr", lplpSurface)
    }

    /**
     * 
     * @param {Pointer<HDC>} hdc 
     * @param {Pointer<RECT>} lprDst 
     * @param {Pointer<RECT>} lprSrc 
     * @param {Pointer<Void>} lpFnCallback 
     * @param {Pointer<Void>} lpContext 
     * @returns {String} Nothing - always returns an empty string
     */
    static DCIEnum(hdc, lprDst, lprSrc, lpFnCallback, lpContext) {
        DllCall("DCIMAN32.dll\DCIEnum", "ptr", hdc, "ptr", lprDst, "ptr", lprSrc, "ptr", lpFnCallback, "ptr", lpContext)
    }

    /**
     * 
     * @param {Pointer<DCIOFFSCREEN>} pdci 
     * @param {Pointer<RECT>} srcrc 
     * @param {Pointer<RECT>} destrc 
     * @param {Pointer<RGNDATA>} prd 
     * @returns {Integer} 
     */
    static DCISetSrcDestClip(pdci, srcrc, destrc, prd) {
        result := DllCall("DCIMAN32.dll\DCISetSrcDestClip", "ptr", pdci, "ptr", srcrc, "ptr", destrc, "ptr", prd, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HWND>} hwnd 
     * @returns {Pointer<HWINWATCH>} 
     */
    static WinWatchOpen(hwnd) {
        result := DllCall("DCIMAN32.dll\WinWatchOpen", "ptr", hwnd, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<HWINWATCH>} hWW 
     * @returns {String} Nothing - always returns an empty string
     */
    static WinWatchClose(hWW) {
        DllCall("DCIMAN32.dll\WinWatchClose", "ptr", hWW)
    }

    /**
     * 
     * @param {Pointer<HWINWATCH>} hWW 
     * @param {Pointer<RECT>} prc 
     * @param {Integer} size 
     * @param {Pointer<RGNDATA>} prd 
     * @returns {String} Nothing - always returns an empty string
     */
    static WinWatchGetClipList(hWW, prc, size, prd) {
        DllCall("DCIMAN32.dll\WinWatchGetClipList", "ptr", hWW, "ptr", prc, "uint", size, "ptr", prd)
    }

    /**
     * 
     * @param {Pointer<HWINWATCH>} hWW 
     * @returns {Integer} 
     */
    static WinWatchDidStatusChange(hWW) {
        result := DllCall("DCIMAN32.dll\WinWatchDidStatusChange", "ptr", hWW, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HWND>} hwnd 
     * @param {Integer} size 
     * @param {Pointer<RGNDATA>} prd 
     * @returns {Integer} 
     */
    static GetWindowRegionData(hwnd, size, prd) {
        result := DllCall("DCIMAN32.dll\GetWindowRegionData", "ptr", hwnd, "uint", size, "ptr", prd, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<HDC>} hdc 
     * @param {Integer} size 
     * @param {Pointer<RGNDATA>} prd 
     * @returns {Integer} 
     */
    static GetDCRegionData(hdc, size, prd) {
        result := DllCall("DCIMAN32.dll\GetDCRegionData", "ptr", hdc, "uint", size, "ptr", prd, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<HWINWATCH>} hWW 
     * @param {Pointer<WINWATCHNOTIFYPROC>} NotifyCallback 
     * @param {Pointer} NotifyParam 
     * @returns {Integer} 
     */
    static WinWatchNotify(hWW, NotifyCallback, NotifyParam) {
        result := DllCall("DCIMAN32.dll\WinWatchNotify", "ptr", hWW, "ptr", NotifyCallback, "ptr", NotifyParam, "int")
        return result
    }

    /**
     * Releases access to display frame buffer.
     * @param {Pointer<DCISURFACEINFO>} pdci A pointer to a <b>DCISURFACEINFO</b> structure.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/dciman/nf-dciman-dciendaccess
     * @since windows5.0
     */
    static DCIEndAccess(pdci) {
        DllCall("DCIMAN32.dll\DCIEndAccess", "ptr", pdci)
    }

    /**
     * Obtains an access pointer to display frame buffer based on the given rectangle.
     * @param {Pointer<DCISURFACEINFO>} pdci A pointer to a <b>DCISURFACEINFO</b> structure.
     * @param {Integer} x The x-coordinate of the upper-left corner of the rectangle.
     * @param {Integer} y The y-coordinate of the upper-left corner of the rectangle.
     * @param {Integer} dx The width of the rectangle.
     * @param {Integer} dy The height of the rectangle.
     * @returns {Integer} If the function succeeds, the return value is DCI_OK or DCI_STATUS_POINTERCHANGED.  DCI_STATUS_POINTERCHANGED indicates that the virtual address of the frame buffer could have been changed since the last call.  So the application should not assume the consistency of the virtual address of the display frame buffer.  If the function fails, the return value is one of the DCI errors.
     * @see https://learn.microsoft.com/windows/win32/api/dciman/nf-dciman-dcibeginaccess
     * @since windows5.0
     */
    static DCIBeginAccess(pdci, x, y, dx, dy) {
        result := DllCall("DCIMAN32.dll\DCIBeginAccess", "ptr", pdci, "int", x, "int", y, "int", dx, "int", dy, "int")
        return result
    }

    /**
     * Destroys a primary surface on the display device.
     * @param {Pointer<DCISURFACEINFO>} pdci A pointer to a <b>DCISURFACEINFO</b> structure.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/dciman/nf-dciman-dcidestroy
     * @since windows5.0
     */
    static DCIDestroy(pdci) {
        DllCall("DCIMAN32.dll\DCIDestroy", "ptr", pdci)
    }

    /**
     * 
     * @param {Pointer<DCIOFFSCREEN>} pdci 
     * @returns {Integer} 
     */
    static DCIDraw(pdci) {
        result := DllCall("DCIMAN32.dll\DCIDraw", "ptr", pdci, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<DCIOFFSCREEN>} pdci 
     * @param {Pointer<RGNDATA>} prd 
     * @returns {Integer} 
     */
    static DCISetClipList(pdci, prd) {
        result := DllCall("DCIMAN32.dll\DCISetClipList", "ptr", pdci, "ptr", prd, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<DCIOFFSCREEN>} pdci 
     * @param {Pointer<RECT>} dst 
     * @param {Pointer<RECT>} src 
     * @returns {Integer} 
     */
    static DCISetDestination(pdci, dst, src) {
        result := DllCall("DCIMAN32.dll\DCISetDestination", "ptr", pdci, "ptr", dst, "ptr", src, "int")
        return result
    }

    /**
     * Returns the current value of an integer that is incremented whenever a mode switch occurs, such as when there is a desktop switch, a Fast User Switch, or a full-screen Microsoft MS-DOS box.
     * @returns {Integer} The current value of the mode switch integer is returned.
     * @see https://learn.microsoft.com/windows/win32/api/ddrawgdi/nf-ddrawgdi-ddquerydisplaysettingsuniqueness
     */
    static GdiEntry13() {
        result := DllCall("api-ms-win-dx-d3dkmt-l1-1-0.dll\GdiEntry13", "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<HWND>} hWnd 
     * @param {Pointer<PSTR>} szCmdName 
     * @param {Pointer<PSTR>} szInfSection 
     * @param {Pointer<PSTR>} szDir 
     * @param {Pointer<PSTR>} lpszTitle 
     * @param {Pointer<HANDLE>} phEXE 
     * @param {Integer} dwFlags 
     * @param {Pointer<Void>} pvReserved 
     * @returns {Integer} 
     */
    static RunSetupCommandA(hWnd, szCmdName, szInfSection, szDir, lpszTitle, phEXE, dwFlags, pvReserved) {
        result := DllCall("ADVPACK.dll\RunSetupCommandA", "ptr", hWnd, "ptr", szCmdName, "ptr", szInfSection, "ptr", szDir, "ptr", lpszTitle, "ptr", phEXE, "uint", dwFlags, "ptr", pvReserved, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HWND>} hWnd 
     * @param {Pointer<PWSTR>} szCmdName 
     * @param {Pointer<PWSTR>} szInfSection 
     * @param {Pointer<PWSTR>} szDir 
     * @param {Pointer<PWSTR>} lpszTitle 
     * @param {Pointer<HANDLE>} phEXE 
     * @param {Integer} dwFlags 
     * @param {Pointer<Void>} pvReserved 
     * @returns {Integer} 
     */
    static RunSetupCommandW(hWnd, szCmdName, szInfSection, szDir, lpszTitle, phEXE, dwFlags, pvReserved) {
        result := DllCall("ADVPACK.dll\RunSetupCommandW", "ptr", hWnd, "ptr", szCmdName, "ptr", szInfSection, "ptr", szDir, "ptr", lpszTitle, "ptr", phEXE, "uint", dwFlags, "ptr", pvReserved, "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    static NeedRebootInit() {
        result := DllCall("ADVPACK.dll\NeedRebootInit", "uint")
        return result
    }

    /**
     * 
     * @param {Integer} dwRebootCheck 
     * @returns {Integer} 
     */
    static NeedReboot(dwRebootCheck) {
        result := DllCall("ADVPACK.dll\NeedReboot", "uint", dwRebootCheck, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HWND>} hwnd 
     * @param {Pointer<PSTR>} pszINF 
     * @param {Pointer<PSTR>} pszSec 
     * @param {Integer} dwReserved 
     * @returns {Integer} 
     */
    static RebootCheckOnInstallA(hwnd, pszINF, pszSec, dwReserved) {
        result := DllCall("ADVPACK.dll\RebootCheckOnInstallA", "ptr", hwnd, "ptr", pszINF, "ptr", pszSec, "uint", dwReserved, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HWND>} hwnd 
     * @param {Pointer<PWSTR>} pszINF 
     * @param {Pointer<PWSTR>} pszSec 
     * @param {Integer} dwReserved 
     * @returns {Integer} 
     */
    static RebootCheckOnInstallW(hwnd, pszINF, pszSec, dwReserved) {
        result := DllCall("ADVPACK.dll\RebootCheckOnInstallW", "ptr", hwnd, "ptr", pszINF, "ptr", pszSec, "uint", dwReserved, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PSTR>} pszInfFilename 
     * @param {Pointer<PSTR>} pszInstallSection 
     * @param {Pointer<PSTR>} pszTranslateSection 
     * @param {Pointer<PSTR>} pszTranslateKey 
     * @param {Pointer<PSTR>} pszBuffer 
     * @param {Integer} cchBuffer 
     * @param {Pointer<UInt32>} pdwRequiredSize 
     * @returns {Integer} 
     */
    static TranslateInfStringA(pszInfFilename, pszInstallSection, pszTranslateSection, pszTranslateKey, pszBuffer, cchBuffer, pdwRequiredSize) {
        static pvReserved := 0 ;Reserved parameters must always be NULL

        result := DllCall("ADVPACK.dll\TranslateInfStringA", "ptr", pszInfFilename, "ptr", pszInstallSection, "ptr", pszTranslateSection, "ptr", pszTranslateKey, "ptr", pszBuffer, "uint", cchBuffer, "ptr", pdwRequiredSize, "ptr", pvReserved, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} pszInfFilename 
     * @param {Pointer<PWSTR>} pszInstallSection 
     * @param {Pointer<PWSTR>} pszTranslateSection 
     * @param {Pointer<PWSTR>} pszTranslateKey 
     * @param {Pointer<PWSTR>} pszBuffer 
     * @param {Integer} cchBuffer 
     * @param {Pointer<UInt32>} pdwRequiredSize 
     * @returns {Integer} 
     */
    static TranslateInfStringW(pszInfFilename, pszInstallSection, pszTranslateSection, pszTranslateKey, pszBuffer, cchBuffer, pdwRequiredSize) {
        static pvReserved := 0 ;Reserved parameters must always be NULL

        result := DllCall("ADVPACK.dll\TranslateInfStringW", "ptr", pszInfFilename, "ptr", pszInstallSection, "ptr", pszTranslateSection, "ptr", pszTranslateKey, "ptr", pszBuffer, "uint", cchBuffer, "ptr", pdwRequiredSize, "ptr", pvReserved, "int")
        return result
    }

    /**
     * Updates the string registry values in the provided table. (ANSI)
     * @remarks
     * > [!NOTE]
     * > The advpub.h header defines RegInstall as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<HMODULE>} hmod The module containing the values to be updated.
     * @param {Pointer<PSTR>} pszSection The sections containing the values to be updated.
     * @param {Pointer<STRTABLEA>} pstTable The table of values to be updated.
     * @returns {Integer} Returns S_OK on success. Returns E_FAIL on failure.
     * @see https://learn.microsoft.com/windows/win32/api/advpub/nf-advpub-reginstalla
     * @since windows10.0.10240
     */
    static RegInstallA(hmod, pszSection, pstTable) {
        result := DllCall("ADVPACK.dll\RegInstallA", "ptr", hmod, "ptr", pszSection, "ptr", pstTable, "int")
        return result
    }

    /**
     * Updates the string registry values in the provided table. (Unicode)
     * @remarks
     * > [!NOTE]
     * > The advpub.h header defines RegInstall as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<HMODULE>} hmod The module containing the values to be updated.
     * @param {Pointer<PWSTR>} pszSection The sections containing the values to be updated.
     * @param {Pointer<STRTABLEW>} pstTable The table of values to be updated.
     * @returns {Integer} Returns S_OK on success. Returns E_FAIL on failure.
     * @see https://learn.microsoft.com/windows/win32/api/advpub/nf-advpub-reginstallw
     * @since windows10.0.10240
     */
    static RegInstallW(hmod, pszSection, pstTable) {
        result := DllCall("ADVPACK.dll\RegInstallW", "ptr", hmod, "ptr", pszSection, "ptr", pstTable, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HWND>} hwnd 
     * @param {Pointer<HINSTANCE>} hInstance 
     * @param {Pointer<PWSTR>} pszParms 
     * @param {Integer} nShow 
     * @returns {Integer} 
     */
    static LaunchINFSectionExW(hwnd, hInstance, pszParms, nShow) {
        result := DllCall("ADVPACK.dll\LaunchINFSectionExW", "ptr", hwnd, "ptr", hInstance, "ptr", pszParms, "int", nShow, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HWND>} hwnd 
     * @param {Pointer<CABINFOA>} pCab 
     * @param {Pointer<Void>} pReserved 
     * @returns {Integer} 
     */
    static ExecuteCabA(hwnd, pCab, pReserved) {
        result := DllCall("ADVPACK.dll\ExecuteCabA", "ptr", hwnd, "ptr", pCab, "ptr", pReserved, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HWND>} hwnd 
     * @param {Pointer<CABINFOW>} pCab 
     * @param {Pointer<Void>} pReserved 
     * @returns {Integer} 
     */
    static ExecuteCabW(hwnd, pCab, pReserved) {
        result := DllCall("ADVPACK.dll\ExecuteCabW", "ptr", hwnd, "ptr", pCab, "ptr", pReserved, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HWND>} hwnd 
     * @param {Pointer<PSTR>} lpszSourceDir 
     * @param {Pointer<PSTR>} lpszSourceFile 
     * @param {Pointer<PSTR>} lpszDestDir 
     * @param {Pointer<PSTR>} lpszDestFile 
     * @param {Integer} dwFlags 
     * @param {Integer} dwReserved 
     * @returns {Integer} 
     */
    static AdvInstallFileA(hwnd, lpszSourceDir, lpszSourceFile, lpszDestDir, lpszDestFile, dwFlags, dwReserved) {
        result := DllCall("ADVPACK.dll\AdvInstallFileA", "ptr", hwnd, "ptr", lpszSourceDir, "ptr", lpszSourceFile, "ptr", lpszDestDir, "ptr", lpszDestFile, "uint", dwFlags, "uint", dwReserved, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HWND>} hwnd 
     * @param {Pointer<PWSTR>} lpszSourceDir 
     * @param {Pointer<PWSTR>} lpszSourceFile 
     * @param {Pointer<PWSTR>} lpszDestDir 
     * @param {Pointer<PWSTR>} lpszDestFile 
     * @param {Integer} dwFlags 
     * @param {Integer} dwReserved 
     * @returns {Integer} 
     */
    static AdvInstallFileW(hwnd, lpszSourceDir, lpszSourceFile, lpszDestDir, lpszDestFile, dwFlags, dwReserved) {
        result := DllCall("ADVPACK.dll\AdvInstallFileW", "ptr", hwnd, "ptr", lpszSourceDir, "ptr", lpszSourceFile, "ptr", lpszDestDir, "ptr", lpszDestFile, "uint", dwFlags, "uint", dwReserved, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HWND>} hWnd 
     * @param {Pointer<PSTR>} pszTitleString 
     * @param {Pointer<HKEY>} hkBckupKey 
     * @param {Pointer<PSTR>} pcszRootKey 
     * @param {Pointer<PSTR>} pcszSubKey 
     * @param {Pointer<PSTR>} pcszValueName 
     * @param {Integer} dwFlags 
     * @returns {Integer} 
     */
    static RegSaveRestoreA(hWnd, pszTitleString, hkBckupKey, pcszRootKey, pcszSubKey, pcszValueName, dwFlags) {
        result := DllCall("ADVPACK.dll\RegSaveRestoreA", "ptr", hWnd, "ptr", pszTitleString, "ptr", hkBckupKey, "ptr", pcszRootKey, "ptr", pcszSubKey, "ptr", pcszValueName, "uint", dwFlags, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HWND>} hWnd 
     * @param {Pointer<PWSTR>} pszTitleString 
     * @param {Pointer<HKEY>} hkBckupKey 
     * @param {Pointer<PWSTR>} pcszRootKey 
     * @param {Pointer<PWSTR>} pcszSubKey 
     * @param {Pointer<PWSTR>} pcszValueName 
     * @param {Integer} dwFlags 
     * @returns {Integer} 
     */
    static RegSaveRestoreW(hWnd, pszTitleString, hkBckupKey, pcszRootKey, pcszSubKey, pcszValueName, dwFlags) {
        result := DllCall("ADVPACK.dll\RegSaveRestoreW", "ptr", hWnd, "ptr", pszTitleString, "ptr", hkBckupKey, "ptr", pcszRootKey, "ptr", pcszSubKey, "ptr", pcszValueName, "uint", dwFlags, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HWND>} hWnd 
     * @param {Pointer<PSTR>} pszTitle 
     * @param {Pointer<PSTR>} pszINF 
     * @param {Pointer<PSTR>} pszSection 
     * @param {Pointer<HKEY>} hHKLMBackKey 
     * @param {Pointer<HKEY>} hHKCUBackKey 
     * @param {Integer} dwFlags 
     * @returns {Integer} 
     */
    static RegSaveRestoreOnINFA(hWnd, pszTitle, pszINF, pszSection, hHKLMBackKey, hHKCUBackKey, dwFlags) {
        result := DllCall("ADVPACK.dll\RegSaveRestoreOnINFA", "ptr", hWnd, "ptr", pszTitle, "ptr", pszINF, "ptr", pszSection, "ptr", hHKLMBackKey, "ptr", hHKCUBackKey, "uint", dwFlags, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HWND>} hWnd 
     * @param {Pointer<PWSTR>} pszTitle 
     * @param {Pointer<PWSTR>} pszINF 
     * @param {Pointer<PWSTR>} pszSection 
     * @param {Pointer<HKEY>} hHKLMBackKey 
     * @param {Pointer<HKEY>} hHKCUBackKey 
     * @param {Integer} dwFlags 
     * @returns {Integer} 
     */
    static RegSaveRestoreOnINFW(hWnd, pszTitle, pszINF, pszSection, hHKLMBackKey, hHKCUBackKey, dwFlags) {
        result := DllCall("ADVPACK.dll\RegSaveRestoreOnINFW", "ptr", hWnd, "ptr", pszTitle, "ptr", pszINF, "ptr", pszSection, "ptr", hHKLMBackKey, "ptr", hHKCUBackKey, "uint", dwFlags, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HWND>} hWnd 
     * @param {Pointer<PSTR>} pszTitleString 
     * @param {Pointer<HKEY>} hkBckupKey 
     * @returns {Integer} 
     */
    static RegRestoreAllA(hWnd, pszTitleString, hkBckupKey) {
        result := DllCall("ADVPACK.dll\RegRestoreAllA", "ptr", hWnd, "ptr", pszTitleString, "ptr", hkBckupKey, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HWND>} hWnd 
     * @param {Pointer<PWSTR>} pszTitleString 
     * @param {Pointer<HKEY>} hkBckupKey 
     * @returns {Integer} 
     */
    static RegRestoreAllW(hWnd, pszTitleString, hkBckupKey) {
        result := DllCall("ADVPACK.dll\RegRestoreAllW", "ptr", hWnd, "ptr", pszTitleString, "ptr", hkBckupKey, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HWND>} hDlg 
     * @param {Pointer<PWSTR>} lpFileList 
     * @param {Pointer<PWSTR>} lpDir 
     * @param {Pointer<PWSTR>} lpBaseName 
     * @param {Integer} dwFlags 
     * @returns {Integer} 
     */
    static FileSaveRestoreW(hDlg, lpFileList, lpDir, lpBaseName, dwFlags) {
        result := DllCall("ADVPACK.dll\FileSaveRestoreW", "ptr", hDlg, "ptr", lpFileList, "ptr", lpDir, "ptr", lpBaseName, "uint", dwFlags, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HWND>} hWnd 
     * @param {Pointer<PSTR>} pszTitle 
     * @param {Pointer<PSTR>} pszINF 
     * @param {Pointer<PSTR>} pszSection 
     * @param {Pointer<PSTR>} pszBackupDir 
     * @param {Pointer<PSTR>} pszBaseBackupFile 
     * @param {Integer} dwFlags 
     * @returns {Integer} 
     */
    static FileSaveRestoreOnINFA(hWnd, pszTitle, pszINF, pszSection, pszBackupDir, pszBaseBackupFile, dwFlags) {
        result := DllCall("ADVPACK.dll\FileSaveRestoreOnINFA", "ptr", hWnd, "ptr", pszTitle, "ptr", pszINF, "ptr", pszSection, "ptr", pszBackupDir, "ptr", pszBaseBackupFile, "uint", dwFlags, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HWND>} hWnd 
     * @param {Pointer<PWSTR>} pszTitle 
     * @param {Pointer<PWSTR>} pszINF 
     * @param {Pointer<PWSTR>} pszSection 
     * @param {Pointer<PWSTR>} pszBackupDir 
     * @param {Pointer<PWSTR>} pszBaseBackupFile 
     * @param {Integer} dwFlags 
     * @returns {Integer} 
     */
    static FileSaveRestoreOnINFW(hWnd, pszTitle, pszINF, pszSection, pszBackupDir, pszBaseBackupFile, dwFlags) {
        result := DllCall("ADVPACK.dll\FileSaveRestoreOnINFW", "ptr", hWnd, "ptr", pszTitle, "ptr", pszINF, "ptr", pszSection, "ptr", pszBackupDir, "ptr", pszBaseBackupFile, "uint", dwFlags, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PSTR>} lpcszFileList 
     * @param {Pointer<PSTR>} lpcszBackupDir 
     * @param {Pointer<PSTR>} lpcszBaseName 
     * @param {Integer} dwFlags 
     * @returns {Integer} 
     */
    static AddDelBackupEntryA(lpcszFileList, lpcszBackupDir, lpcszBaseName, dwFlags) {
        result := DllCall("ADVPACK.dll\AddDelBackupEntryA", "ptr", lpcszFileList, "ptr", lpcszBackupDir, "ptr", lpcszBaseName, "uint", dwFlags, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} lpcszFileList 
     * @param {Pointer<PWSTR>} lpcszBackupDir 
     * @param {Pointer<PWSTR>} lpcszBaseName 
     * @param {Integer} dwFlags 
     * @returns {Integer} 
     */
    static AddDelBackupEntryW(lpcszFileList, lpcszBackupDir, lpcszBaseName, dwFlags) {
        result := DllCall("ADVPACK.dll\AddDelBackupEntryW", "ptr", lpcszFileList, "ptr", lpcszBackupDir, "ptr", lpcszBaseName, "uint", dwFlags, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PSTR>} lpFileList 
     * @param {Pointer<PSTR>} lpDir 
     * @param {Pointer<PSTR>} lpBaseName 
     * @returns {Integer} 
     */
    static FileSaveMarkNotExistA(lpFileList, lpDir, lpBaseName) {
        result := DllCall("ADVPACK.dll\FileSaveMarkNotExistA", "ptr", lpFileList, "ptr", lpDir, "ptr", lpBaseName, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} lpFileList 
     * @param {Pointer<PWSTR>} lpDir 
     * @param {Pointer<PWSTR>} lpBaseName 
     * @returns {Integer} 
     */
    static FileSaveMarkNotExistW(lpFileList, lpDir, lpBaseName) {
        result := DllCall("ADVPACK.dll\FileSaveMarkNotExistW", "ptr", lpFileList, "ptr", lpDir, "ptr", lpBaseName, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PSTR>} lpszFilename 
     * @param {Pointer<UInt32>} pdwMSVer 
     * @param {Pointer<UInt32>} pdwLSVer 
     * @param {Integer} bVersion 
     * @returns {Integer} 
     */
    static GetVersionFromFileA(lpszFilename, pdwMSVer, pdwLSVer, bVersion) {
        result := DllCall("ADVPACK.dll\GetVersionFromFileA", "ptr", lpszFilename, "ptr", pdwMSVer, "ptr", pdwLSVer, "int", bVersion, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} lpszFilename 
     * @param {Pointer<UInt32>} pdwMSVer 
     * @param {Pointer<UInt32>} pdwLSVer 
     * @param {Integer} bVersion 
     * @returns {Integer} 
     */
    static GetVersionFromFileW(lpszFilename, pdwMSVer, pdwLSVer, bVersion) {
        result := DllCall("ADVPACK.dll\GetVersionFromFileW", "ptr", lpszFilename, "ptr", pdwMSVer, "ptr", pdwLSVer, "int", bVersion, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PSTR>} lpszFilename 
     * @param {Pointer<UInt32>} pdwMSVer 
     * @param {Pointer<UInt32>} pdwLSVer 
     * @param {Integer} bVersion 
     * @returns {Integer} 
     */
    static GetVersionFromFileExA(lpszFilename, pdwMSVer, pdwLSVer, bVersion) {
        result := DllCall("ADVPACK.dll\GetVersionFromFileExA", "ptr", lpszFilename, "ptr", pdwMSVer, "ptr", pdwLSVer, "int", bVersion, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} lpszFilename 
     * @param {Pointer<UInt32>} pdwMSVer 
     * @param {Pointer<UInt32>} pdwLSVer 
     * @param {Integer} bVersion 
     * @returns {Integer} 
     */
    static GetVersionFromFileExW(lpszFilename, pdwMSVer, pdwLSVer, bVersion) {
        result := DllCall("ADVPACK.dll\GetVersionFromFileExW", "ptr", lpszFilename, "ptr", pdwMSVer, "ptr", pdwLSVer, "int", bVersion, "int")
        return result
    }

    /**
     * 
     * @param {Integer} dwReserved 
     * @param {Pointer<UInt32>} lpdwReserved 
     * @returns {Integer} 
     */
    static IsNTAdmin(dwReserved, lpdwReserved) {
        result := DllCall("ADVPACK.dll\IsNTAdmin", "uint", dwReserved, "ptr", lpdwReserved, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PSTR>} pszFileOrDirName 
     * @param {Integer} dwFlags 
     * @returns {Integer} 
     */
    static DelNodeA(pszFileOrDirName, dwFlags) {
        result := DllCall("ADVPACK.dll\DelNodeA", "ptr", pszFileOrDirName, "uint", dwFlags, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} pszFileOrDirName 
     * @param {Integer} dwFlags 
     * @returns {Integer} 
     */
    static DelNodeW(pszFileOrDirName, dwFlags) {
        result := DllCall("ADVPACK.dll\DelNodeW", "ptr", pszFileOrDirName, "uint", dwFlags, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HWND>} hwnd 
     * @param {Pointer<HINSTANCE>} hInstance 
     * @param {Pointer<PWSTR>} pszParms 
     * @param {Integer} nShow 
     * @returns {Integer} 
     */
    static DelNodeRunDLL32W(hwnd, hInstance, pszParms, nShow) {
        result := DllCall("ADVPACK.dll\DelNodeRunDLL32W", "ptr", hwnd, "ptr", hInstance, "ptr", pszParms, "int", nShow, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PSTR>} pszInfFilename 
     * @param {Pointer<PSTR>} pszInstallSection 
     * @param {Integer} dwFlags 
     * @param {Pointer<Void>} phInf 
     * @param {Pointer<Void>} pvReserved 
     * @returns {Integer} 
     */
    static OpenINFEngineA(pszInfFilename, pszInstallSection, dwFlags, phInf, pvReserved) {
        result := DllCall("ADVPACK.dll\OpenINFEngineA", "ptr", pszInfFilename, "ptr", pszInstallSection, "uint", dwFlags, "ptr", phInf, "ptr", pvReserved, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} pszInfFilename 
     * @param {Pointer<PWSTR>} pszInstallSection 
     * @param {Integer} dwFlags 
     * @param {Pointer<Void>} phInf 
     * @param {Pointer<Void>} pvReserved 
     * @returns {Integer} 
     */
    static OpenINFEngineW(pszInfFilename, pszInstallSection, dwFlags, phInf, pvReserved) {
        result := DllCall("ADVPACK.dll\OpenINFEngineW", "ptr", pszInfFilename, "ptr", pszInstallSection, "uint", dwFlags, "ptr", phInf, "ptr", pvReserved, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hInf 
     * @param {Pointer<PSTR>} pszInfFilename 
     * @param {Pointer<PSTR>} pszTranslateSection 
     * @param {Pointer<PSTR>} pszTranslateKey 
     * @param {Pointer<PSTR>} pszBuffer 
     * @param {Integer} dwBufferSize 
     * @param {Pointer<UInt32>} pdwRequiredSize 
     * @returns {Integer} 
     */
    static TranslateInfStringExA(hInf, pszInfFilename, pszTranslateSection, pszTranslateKey, pszBuffer, dwBufferSize, pdwRequiredSize) {
        static pvReserved := 0 ;Reserved parameters must always be NULL

        result := DllCall("ADVPACK.dll\TranslateInfStringExA", "ptr", hInf, "ptr", pszInfFilename, "ptr", pszTranslateSection, "ptr", pszTranslateKey, "ptr", pszBuffer, "uint", dwBufferSize, "ptr", pdwRequiredSize, "ptr", pvReserved, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hInf 
     * @param {Pointer<PWSTR>} pszInfFilename 
     * @param {Pointer<PWSTR>} pszTranslateSection 
     * @param {Pointer<PWSTR>} pszTranslateKey 
     * @param {Pointer<PWSTR>} pszBuffer 
     * @param {Integer} dwBufferSize 
     * @param {Pointer<UInt32>} pdwRequiredSize 
     * @returns {Integer} 
     */
    static TranslateInfStringExW(hInf, pszInfFilename, pszTranslateSection, pszTranslateKey, pszBuffer, dwBufferSize, pdwRequiredSize) {
        static pvReserved := 0 ;Reserved parameters must always be NULL

        result := DllCall("ADVPACK.dll\TranslateInfStringExW", "ptr", hInf, "ptr", pszInfFilename, "ptr", pszTranslateSection, "ptr", pszTranslateKey, "ptr", pszBuffer, "uint", dwBufferSize, "ptr", pdwRequiredSize, "ptr", pvReserved, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hInf 
     * @returns {Integer} 
     */
    static CloseINFEngine(hInf) {
        result := DllCall("ADVPACK.dll\CloseINFEngine", "ptr", hInf, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PSTR>} pszCabName 
     * @param {Pointer<PSTR>} pszExpandDir 
     * @param {Integer} dwFlags 
     * @param {Pointer<PSTR>} pszFileList 
     * @param {Pointer<Void>} lpReserved 
     * @param {Integer} dwReserved 
     * @returns {Integer} 
     */
    static ExtractFilesA(pszCabName, pszExpandDir, dwFlags, pszFileList, lpReserved, dwReserved) {
        result := DllCall("ADVPACK.dll\ExtractFilesA", "ptr", pszCabName, "ptr", pszExpandDir, "uint", dwFlags, "ptr", pszFileList, "ptr", lpReserved, "uint", dwReserved, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} pszCabName 
     * @param {Pointer<PWSTR>} pszExpandDir 
     * @param {Integer} dwFlags 
     * @param {Pointer<PWSTR>} pszFileList 
     * @param {Pointer<Void>} lpReserved 
     * @param {Integer} dwReserved 
     * @returns {Integer} 
     */
    static ExtractFilesW(pszCabName, pszExpandDir, dwFlags, pszFileList, lpReserved, dwReserved) {
        result := DllCall("ADVPACK.dll\ExtractFilesW", "ptr", pszCabName, "ptr", pszExpandDir, "uint", dwFlags, "ptr", pszFileList, "ptr", lpReserved, "uint", dwReserved, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HWND>} hwndOwner 
     * @param {Pointer<HINSTANCE>} hInstance 
     * @param {Pointer<PWSTR>} pszParams 
     * @param {Integer} nShow 
     * @returns {String} Nothing - always returns an empty string
     */
    static LaunchINFSectionW(hwndOwner, hInstance, pszParams, nShow) {
        DllCall("ADVPACK.dll\LaunchINFSectionW", "ptr", hwndOwner, "ptr", hInstance, "ptr", pszParams, "int", nShow)
    }

    /**
     * 
     * @param {Pointer<HWND>} hwnd 
     * @param {Pointer<HINSTANCE>} hInstance 
     * @param {Pointer<PSTR>} pszParms 
     * @param {Integer} nShow 
     * @returns {Integer} 
     */
    static UserInstStubWrapperA(hwnd, hInstance, pszParms, nShow) {
        result := DllCall("ADVPACK.dll\UserInstStubWrapperA", "ptr", hwnd, "ptr", hInstance, "ptr", pszParms, "int", nShow, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HWND>} hwnd 
     * @param {Pointer<HINSTANCE>} hInstance 
     * @param {Pointer<PWSTR>} pszParms 
     * @param {Integer} nShow 
     * @returns {Integer} 
     */
    static UserInstStubWrapperW(hwnd, hInstance, pszParms, nShow) {
        result := DllCall("ADVPACK.dll\UserInstStubWrapperW", "ptr", hwnd, "ptr", hInstance, "ptr", pszParms, "int", nShow, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HWND>} hwnd 
     * @param {Pointer<HINSTANCE>} hInstance 
     * @param {Pointer<PSTR>} pszParms 
     * @param {Integer} nShow 
     * @returns {Integer} 
     */
    static UserUnInstStubWrapperA(hwnd, hInstance, pszParms, nShow) {
        result := DllCall("ADVPACK.dll\UserUnInstStubWrapperA", "ptr", hwnd, "ptr", hInstance, "ptr", pszParms, "int", nShow, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HWND>} hwnd 
     * @param {Pointer<HINSTANCE>} hInstance 
     * @param {Pointer<PWSTR>} pszParms 
     * @param {Integer} nShow 
     * @returns {Integer} 
     */
    static UserUnInstStubWrapperW(hwnd, hInstance, pszParms, nShow) {
        result := DllCall("ADVPACK.dll\UserUnInstStubWrapperW", "ptr", hwnd, "ptr", hInstance, "ptr", pszParms, "int", nShow, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PERUSERSECTIONA>} pPerUser 
     * @returns {Integer} 
     */
    static SetPerUserSecValuesA(pPerUser) {
        result := DllCall("ADVPACK.dll\SetPerUserSecValuesA", "ptr", pPerUser, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PERUSERSECTIONW>} pPerUser 
     * @returns {Integer} 
     */
    static SetPerUserSecValuesW(pPerUser) {
        result := DllCall("ADVPACK.dll\SetPerUserSecValuesW", "ptr", pPerUser, "int")
        return result
    }

    /**
     * Specifies an action or processing for the Input Method Editor (IME) through a specified subfunction. (ANSI)
     * @remarks
     * <b>SendIMEMessageEx</b> guarantees the action stipulated in the specifications only for IMEs that support the <b>WM_CONVERTREQUESTEX</b> message. For an IME that does not support <b>WM_CONVERTREQUESTEX</b>, <b>SendIMEMessageEx</b> sends a <b>WM_CONVERTREQUEST</b> message to the IME and returns the contents of the <b>wParam</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/ime/ns-ime-imestruct">IMESTRUCT</a> structure. If the processing of the subfunction has not been completed normally, these functions set <b>IME_RS_ERROR</b> into <b>wParam</b>.
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The ime.h header defines SendIMEMessageEx as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<HWND>} param0 
     * @param {Pointer} param1 
     * @returns {Pointer} The result of processing of the subfunction. If the result is not success, one of the following error codes is stored into the <b>wParam</b> of the <a href="https://docs.microsoft.com/windows/desktop/api/ime/ns-ime-imestruct">IMESTRUCT</a> structure.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IME_RS_DISKERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Disk error.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IME_RS_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * General error.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IME_RS_ILLEGAL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Contains an illegal character.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IME_RS_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid subfunction.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IME_RS_NEST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Subfunction is nested and, therefore, cannot be used.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IME_RS_NOIME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The IME has not been selected (has not been installed).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IME_RS_NOROOM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Short of area.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IME_RS_NOTFOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No candidate found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IME_RS_SYSTEMMODAL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Windows is in system mode, data cannot be passed to the IME.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IME_RS_TOOLONG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Characters too long.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ime/nf-ime-sendimemessageexa
     * @since windows5.0
     */
    static SendIMEMessageExA(param0, param1) {
        result := DllCall("USER32.dll\SendIMEMessageExA", "ptr", param0, "ptr", param1, "ptr")
        return result
    }

    /**
     * Specifies an action or processing for the Input Method Editor (IME) through a specified subfunction. (Unicode)
     * @remarks
     * <b>SendIMEMessageEx</b> guarantees the action stipulated in the specifications only for IMEs that support the <b>WM_CONVERTREQUESTEX</b> message. For an IME that does not support <b>WM_CONVERTREQUESTEX</b>, <b>SendIMEMessageEx</b> sends a <b>WM_CONVERTREQUEST</b> message to the IME and returns the contents of the <b>wParam</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/ime/ns-ime-imestruct">IMESTRUCT</a> structure. If the processing of the subfunction has not been completed normally, these functions set <b>IME_RS_ERROR</b> into <b>wParam</b>.
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The ime.h header defines SendIMEMessageEx as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<HWND>} param0 
     * @param {Pointer} param1 
     * @returns {Pointer} The result of processing of the subfunction. If the result is not success, one of the following error codes is stored into the <b>wParam</b> of the <a href="https://docs.microsoft.com/windows/desktop/api/ime/ns-ime-imestruct">IMESTRUCT</a> structure.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IME_RS_DISKERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Disk error.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IME_RS_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * General error.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IME_RS_ILLEGAL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Contains an illegal character.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IME_RS_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid subfunction.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IME_RS_NEST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Subfunction is nested and, therefore, cannot be used.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IME_RS_NOIME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The IME has not been selected (has not been installed).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IME_RS_NOROOM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Short of area.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IME_RS_NOTFOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No candidate found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IME_RS_SYSTEMMODAL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Windows is in system mode, data cannot be passed to the IME.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IME_RS_TOOLONG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Characters too long.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ime/nf-ime-sendimemessageexw
     * @since windows5.0
     */
    static SendIMEMessageExW(param0, param1) {
        result := DllCall("USER32.dll\SendIMEMessageExW", "ptr", param0, "ptr", param1, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<HWND>} param0 
     * @param {Pointer<IMEPROA>} param1 
     * @returns {Integer} 
     */
    static IMPGetIMEA(param0, param1) {
        result := DllCall("USER32.dll\IMPGetIMEA", "ptr", param0, "ptr", param1, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HWND>} param0 
     * @param {Pointer<IMEPROW>} param1 
     * @returns {Integer} 
     */
    static IMPGetIMEW(param0, param1) {
        result := DllCall("USER32.dll\IMPGetIMEW", "ptr", param0, "ptr", param1, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IMEPROA>} param0 
     * @returns {Integer} 
     */
    static IMPQueryIMEA(param0) {
        result := DllCall("USER32.dll\IMPQueryIMEA", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IMEPROW>} param0 
     * @returns {Integer} 
     */
    static IMPQueryIMEW(param0) {
        result := DllCall("USER32.dll\IMPQueryIMEW", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HWND>} param0 
     * @param {Pointer<IMEPROA>} param1 
     * @returns {Integer} 
     */
    static IMPSetIMEA(param0, param1) {
        result := DllCall("USER32.dll\IMPSetIMEA", "ptr", param0, "ptr", param1, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HWND>} param0 
     * @param {Pointer<IMEPROW>} param1 
     * @returns {Integer} 
     */
    static IMPSetIMEW(param0, param1) {
        result := DllCall("USER32.dll\IMPSetIMEW", "ptr", param0, "ptr", param1, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HWND>} param0 
     * @returns {String} Nothing - always returns an empty string
     */
    static WINNLSGetIMEHotkey(param0) {
        DllCall("USER32.dll\WINNLSGetIMEHotkey", "ptr", param0)
    }

    /**
     * Temporarily enables or disables an Input Method Editor (IME) and, at the same time, turns on or off the display of all windows owned by the IME.
     * @remarks
     * The terms "enabled" and "disabled" in regard to this function are defined as follows:
     *             
     *                 
     * 
     * If an IME is disabled, <a href="https://docs.microsoft.com/windows/desktop/api/ime/ns-ime-imestruct">IME_WINDOWUPDATE(FALSE)</a> is issued to the IME, which responds by deleting the conversion and system windows. With the IME disabled, keyboard messages are not sent to the IME, but are sent directly to the application. Even if the IME is disabled, the API that uses the <a href="https://docs.microsoft.com/windows/desktop/api/ime/nf-ime-sendimemessageexa">SendIMEMessageEx</a> function is still valid.
     * 
     * If an IME is enabled, <a href="https://docs.microsoft.com/windows/desktop/api/ime/ns-ime-imestruct">IME_WINDOWUPDATE(TRUE)</a> is issued to the IME, which responds by redisplaying the conversion and system windows. With the IME enabled, keyboard messages are sent to the IME.
     * @param {Pointer<HWND>} param0 
     * @param {Integer} param1 
     * @returns {Integer} The previous state of the IME. <b>TRUE</b> if it was enabled before this call, otherwise, <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/winnls32/nf-winnls32-winnlsenableime
     * @since windows5.0
     */
    static WINNLSEnableIME(param0, param1) {
        result := DllCall("USER32.dll\WINNLSEnableIME", "ptr", param0, "int", param1, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HWND>} param0 
     * @returns {Integer} 
     */
    static WINNLSGetEnableStatus(param0) {
        result := DllCall("USER32.dll\WINNLSGetEnableStatus", "ptr", param0, "int")
        return result
    }

    /**
     * Enables applications to detect bad extension objects and either block them from running or fix them.
     * @remarks
     * This is a helper function for Explorer and Internet Explorer that allows those applications to detect bad extension objects and either block them from running or fix them.
     * 
     * 
     * If the database indicates that a shim should be used to fix the extension
     * and <i>bShimIfNecessary</i> is <b>TRUE</b>, this function  loads Shimeng.dll and
     * applies the fix.
     * 
     * This function has no associated import library or header file; you must call it using the <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya">LoadLibrary</a> and <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a> functions.
     * @param {Pointer<Guid>} ObjectCLSID The GUID of a register class.
     * @param {Integer} bShimIfNecessary This parameter is <b>TRUE</b> if a shim is needed; <b>FALSE</b> otherwise.
     * @param {Pointer<UInt64>} pullFlags This parameter is filled with a 64-bit flag mask that can be used to turn on application modification flags in Explorer/IE. These are located in the application compatibility database.
     * @returns {Integer} <b>FALSE</b> if the object should be blocked from instantiating; <b>TRUE</b> otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/appcompatapi/nf-appcompatapi-apphelpcheckshellobject
     */
    static ApphelpCheckShellObject(ObjectCLSID, bShimIfNecessary, pullFlags) {
        result := DllCall("APPHELP.dll\ApphelpCheckShellObject", "ptr", ObjectCLSID, "int", bShimIfNecessary, "ptr", pullFlags, "int")
        return result
    }

    /**
     * Calls the library to get the security state relative to the host, and script or msi to be used.
     * @remarks
     * > [!NOTE]
     * > [WldpCanExecuteBuffer](nf-wldp-wldpcanexecutebuffer.md), [WldpCanExecuteFile](nf-wldp-wldpcanexecutefile.md), and [WldpCanExecuteStream](nf-wldp-wldpcanexecutestream.md) are newer APIs that enable the same scenarios as **WldpGetLockdownPolicy** but with an improved implementation.
     * 
     * When called with WLDP\_HOST\_INFORMATION.szSource = NULL, the generic policy for the host is returned.
     * 
     * When called with WLDP\_HOST\_INFORMATION.dwHostId = WLDP\_HOST\_ID\_GLOBAL, WLDP\_HOST\_INFORMATION.szSource must be NULL, and the function will return the global system policy.
     * 
     * The dwFlag WLDP\_FLAGS\_SKIPSIGNATUREVALIDATION can be used to skip the SaferIdentifyLevel() validation, which will ignore whether a script is signed.
     * @param {Pointer<WLDP_HOST_INFORMATION>} hostInformation A [**WLDP\_HOST\_INFORMATION**](ns-wldp-wldp_host_information.md) structure identifying the host and source file to be evaluated.
     * @param {Pointer<UInt32>} lockdownState Provides the resulting policy secure value. If !WLDP_LOCKDOWN_IS_OFF, then UMCI is enabled. You can also check WLDP_LOCKDOWN_IS_AUDIT and WLDP_LOCKDOWN_IS_ENFORCE to determine if a policy is in audit or enforce mode.
     * @param {Integer} lockdownFlags The following flag values are defined WLDP\_FLAGS\_SKIPSIGNATUREVALIDATION 0x00000100 – when set, skip the SaferIdentifyLevel validation, which will ignore whether a script is signed.
     * @returns {Integer} This method returns S\_OK if successful or a failure code otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/wldp/nf-wldp-wldpgetlockdownpolicy
     */
    static WldpGetLockdownPolicy(hostInformation, lockdownState, lockdownFlags) {
        result := DllCall("Wldp.dll\WldpGetLockdownPolicy", "ptr", hostInformation, "ptr", lockdownState, "uint", lockdownFlags, "int")
        return result
    }

    /**
     * Calls the library to validate if a particular CLSID is safe to be called.
     * @param {Pointer<Guid>} classID The COM class ID to check for approval.
     * @param {Pointer<WLDP_HOST_INFORMATION>} hostInformation A [**WLDP\_HOST\_INFORMATION**](ns-wldp-wldp_host_information.md) structure identifying the host to be evaluated.
     * @param {Pointer<Int32>} isApproved On successful completion, contains **TRUE** if the class ID is approved; otherwise, **FALSE**.
     * @param {Integer} optionalFlags This parameter is reserved and must be set to zero.
     * @returns {Integer} This method returns **S\_OK** if successful or a failure code otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/wldp/nf-wldp-wldpisclassinapprovedlist
     */
    static WldpIsClassInApprovedList(classID, hostInformation, isApproved, optionalFlags) {
        result := DllCall("Wldp.dll\WldpIsClassInApprovedList", "ptr", classID, "ptr", hostInformation, "ptr", isApproved, "uint", optionalFlags, "int")
        return result
    }

    /**
     * Sets an on-disk .NET CRL Dynamic Code trustable for .NET.
     * @param {Pointer<HANDLE>} fileHandle Handle to a on-disk dynamic code file.
     * @returns {Integer} This method returns **S\_OK** if successful or a failure code otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/wldp/nf-wldp-wldpsetdynamiccodetrust
     */
    static WldpSetDynamicCodeTrust(fileHandle) {
        result := DllCall("Wldp.dll\WldpSetDynamicCodeTrust", "ptr", fileHandle, "int")
        return result
    }

    /**
     * Retrieves a value that describes the Device Guard policy enforcement status for .NET dynamic code.
     * @remarks
     * Dynamic code refers to .NET CRL dynamically-generated code.
     * @param {Pointer<Int32>} isEnabled On success, returns **true** if the Device Guard policy enforces .NET Dynamic Code policy; otherwise, returns **false**.
     * @returns {Integer} This method returns **S\_OK** if successful or a failure code otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/wldp/nf-wldp-wldpisdynamiccodepolicyenabled
     */
    static WldpIsDynamicCodePolicyEnabled(isEnabled) {
        result := DllCall("Wldp.dll\WldpIsDynamicCodePolicyEnabled", "ptr", isEnabled, "int")
        return result
    }

    /**
     * Retrieves a value that determines if the specified in-memory or on-disk .NET CRL dynamic code is trusted by Device Guard policy.
     * @param {Pointer<HANDLE>} fileHandle Handle to the on-disk dynamic code file to check. If *fileHandle* is non-**NULL**, *baseImage* should be **NULL**.
     * @param {Pointer<Void>} baseImage Pointer to the in-memory PE file to check. If *baseImage* is non-**NULL**, *FileHandle* should be **NULL**.
     * @param {Integer} imageSize When *baseImage* is non-**NULL**, indicates the buffer size that *baseImage* points to.
     * @returns {Integer} This method returns **S\_OK** if successful or a failure code otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/wldp/nf-wldp-wldpquerydynamiccodetrust
     */
    static WldpQueryDynamicCodeTrust(fileHandle, baseImage, imageSize) {
        result := DllCall("Wldp.dll\WldpQueryDynamicCodeTrust", "ptr", fileHandle, "ptr", baseImage, "uint", imageSize, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<WLDP_DEVICE_SECURITY_INFORMATION>} information 
     * @param {Integer} informationLength 
     * @param {Pointer<UInt32>} returnLength 
     * @returns {Integer} 
     */
    static WldpQueryDeviceSecurityInformation(information, informationLength, returnLength) {
        result := DllCall("Wldp.dll\WldpQueryDeviceSecurityInformation", "ptr", information, "uint", informationLength, "ptr", returnLength, "int")
        return result
    }

    /**
     * Queries whether the execution policy allows execution of the code in the supplied file.
     * @remarks
     * This method is provided as a replacement for [WldpGetLockdownPolicy](nf-wldp-wldpgetlockdownpolicy.md). This interface is differentiated from **WldpGetLockdownPolicy** in the following ways:
     * 
     * - Encourages callers to ensure that the subject (file, buffer, or stream) passes os execution policy.  
     * - Allows calling apps to provide additional audit information for diagnostic purposes.
     * - Allows verification of buffers and streams of code.
     * - Simplifies the calling pattern. 
     * - Supports fine grained execution policies like for example interactive mode in cmd or powershell
     * @param {Pointer<Guid>} host A GUID specifying the calling program. For the list of pre-defined GUIDs that can be used for this parameter, see [WLDP Host GUIDs](/windows/win32/devnotes/wldp-host-guids). For hosts for which a specific value is not defined, use GUID WLDP_HOST_GUID_OTHER.
     * @param {Integer} options A value from the [WLDP_EXECUTION_EVALUATION_OPTIONS](ne-wldp-wldp_execution_evaluation_options.md) specifying options for the execution authorization request.
     * @param {Pointer<HANDLE>} fileHandle The handle to the file being validated for execution approval. 
     * 
     * > [!IMPORTANT]
     * > Callers should only pass open file handles to **WldpCanExecuteFile** and should not cache the security authorization on a specific file. It should be assumed that authorization to run a particular file is revoked when its file handle is closed. These measures are necessary to prevent [TOC/TOU vulnerabilities](https://en.wikipedia.org/wiki/Time-of-check_to_time-of-use) that could subvert script enforcement policy.
     * @param {Pointer<PWSTR>} auditInfo A string that should include relevant contextual information for the caller to use in debugging. If an authorization request fails this string will be recorded in the event log, under “Applocker/MSI and Scripts/Operational”. Callers should note that, while the *AuditInfo* is not size limited, the string should be less than 4K bytes in size because it will be placed in the event log.
     * @param {Pointer<Int32>} result Receives a pointer to a value from the [WLDP_EXECUTION_POLICY](ne-wldp-wldp_execution_policy.md) enumeration, indicating the execution policy result of the query.
     * @returns {Integer} Returns S_OK on success and a failure code otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/wldp/nf-wldp-wldpcanexecutefile
     */
    static WldpCanExecuteFile(host, options, fileHandle, auditInfo, result) {
        result := DllCall("Wldp.dll\WldpCanExecuteFile", "ptr", host, "int", options, "ptr", fileHandle, "ptr", auditInfo, "ptr", result, "int")
        return result
    }

    /**
     * Queries whether the execution policy allows execution of the code in the supplied buffer.
     * @remarks
     * This method is provided as a replacement for [WldpGetLockdownPolicy](nf-wldp-wldpgetlockdownpolicy.md). This interface is differentiated from **WldpGetLockdownPolicy** in the following ways:
     * 
     * - Encourages callers to ensure that the subject (file, buffer, or stream) passes os execution policy.  
     * - Allows calling apps to provide additional audit information for diagnostic purposes.
     * - Allows verification of buffers and streams of code.
     * - Simplifies the calling pattern. 
     * - Supports fine grained execution policies like for example interactive mode in cmd or powershell
     * @param {Pointer<Guid>} host A GUID specifying the calling program. For the list of pre-defined GUIDs that can be used for this parameter, see [WLDP Host GUIDs](/windows/win32/devnotes/wldp-host-guids). For hosts for which a specific value is not defined, use GUID WLDP_HOST_GUID_OTHER.
     * @param {Integer} options A value from the [WLDP_EXECUTION_EVALUATION_OPTIONS](ne-wldp-wldp_execution_evaluation_options.md) specifying options for the execution authorization request.
     * @param {Pointer<Byte>} buffer The buffer containing script code to be validated. 
     * 
     * > [!IMPORTANT]
     * > Buffers passed to **WldpCanExecuteBuffer** should be read-only and the caller should not cache the security authorization on a specific buffer. These measures are necessary to prevent [TOC/TOU vulnerabilities](https://en.wikipedia.org/wiki/Time-of-check_to_time-of-use) that could subvert script enforcement policy.
     * @param {Integer} bufferSize The size of *buffer*, in bytes.
     * @param {Pointer<PWSTR>} auditInfo A string that should include relevant contextual information for the caller to use in debugging. If an authorization request fails this string will be recorded in the event log, under “Applocker/MSI and Scripts/Operational”. Callers should note that, while the *AuditInfo* is not size limited, the string should be less than 4K bytes in size because it will be placed in the event log.
     * @param {Pointer<Int32>} result Receives a pointer to a value from the [WLDP_EXECUTION_POLICY](ne-wldp-wldp_execution_policy.md) enumeration, indicating the execution policy result of the query.
     * @returns {Integer} Returns S_OK on success and a failure code otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/wldp/nf-wldp-wldpcanexecutebuffer
     */
    static WldpCanExecuteBuffer(host, options, buffer, bufferSize, auditInfo, result) {
        result := DllCall("Wldp.dll\WldpCanExecuteBuffer", "ptr", host, "int", options, "ptr", buffer, "uint", bufferSize, "ptr", auditInfo, "ptr", result, "int")
        return result
    }

    /**
     * Queries whether the execution policy allows execution of the code in the supplied stream.
     * @remarks
     * This method is provided as a replacement for [WldpGetLockdownPolicy](nf-wldp-wldpgetlockdownpolicy.md). This interface is differentiated from **WldpGetLockdownPolicy** in the following ways:
     * 
     * - Encourages callers to ensure that the subject (file, buffer, or stream) passes os execution policy.  
     * - Allows calling apps to provide additional audit information for diagnostic purposes.
     * - Allows verification of buffers and streams of code.
     * - Simplifies the calling pattern. 
     * - Supports fine grained execution policies like for example interactive mode in cmd or powershell
     * @param {Pointer<Guid>} host A GUID specifying the calling program. For the list of pre-defined GUIDs that can be used for this parameter, see [WLDP Host GUIDs](/windows/win32/devnotes/wldp-host-guids). For hosts for which a specific value is not defined, use GUID WLDP_HOST_GUID_OTHER.
     * @param {Integer} options A value from the [WLDP_EXECUTION_EVALUATION_OPTIONS](ne-wldp-wldp_execution_evaluation_options.md) specifying options for the execution authorization request.
     * @param {Pointer<IStream>} stream 
     * @param {Pointer<PWSTR>} auditInfo A string that should include relevant contextual information for the caller to use in debugging. If an authorization request fails this string will be recorded in the event log, under “Applocker/MSI and Scripts/Operational”. Callers should note that, while the *AuditInfo* is not size limited, the string should be less than 4K bytes in size because it will be placed in the event log.
     * @param {Pointer<Int32>} result Receives a pointer to a value from the [WLDP_EXECUTION_POLICY](ne-wldp-wldp_execution_policy.md) enumeration, indicating the execution policy result of the query.
     * @returns {Integer} Returns S_OK on success and a failure code otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/wldp/nf-wldp-wldpcanexecutestream
     */
    static WldpCanExecuteStream(host, options, stream, auditInfo, result) {
        result := DllCall("Wldp.dll\WldpCanExecuteStream", "ptr", host, "int", options, "ptr", stream, "ptr", auditInfo, "ptr", result, "int")
        return result
    }

;@endregion Methods
}
