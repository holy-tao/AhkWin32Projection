#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 */

;@region Constants

/**
 * @type {String}
 */
export global WLDP_DLL := "WLDP.DLL"

/**
 * @type {String}
 */
export global WLDP_GETLOCKDOWNPOLICY_FN := "WldpGetLockdownPolicy"

/**
 * @type {String}
 */
export global WLDP_ISCLASSINAPPROVEDLIST_FN := "WldpIsClassInApprovedList"

/**
 * @type {String}
 */
export global WLDP_SETDYNAMICCODETRUST_FN := "WldpSetDynamicCodeTrust"

/**
 * @type {String}
 */
export global WLDP_ISDYNAMICCODEPOLICYENABLED_FN := "WldpIsDynamicCodePolicyEnabled"

/**
 * @type {String}
 */
export global WLDP_QUERYDANAMICCODETRUST_FN := "WldpQueryDynamicCodeTrust"

/**
 * @type {String}
 */
export global WLDP_QUERYDYNAMICCODETRUST_FN := "WldpQueryDynamicCodeTrust"

/**
 * @type {String}
 */
export global WLDP_QUERYWINDOWSLOCKDOWNMODE_FN := "WldpQueryWindowsLockdownMode"

/**
 * @type {String}
 */
export global WLDP_SETWINDOWSLOCKDOWNRESTRICTION_FN := "WldpSetWindowsLockdownRestriction"

/**
 * @type {String}
 */
export global WLDP_QUERYDEVICESECURITYINFORMATION_FN := "WldpQueryDeviceSecurityInformation"

/**
 * @type {String}
 */
export global WLDP_QUERYWINDOWSLOCKDOWNRESTRICTION_FN := "WldpQueryWindowsLockdownRestriction"

/**
 * @type {String}
 */
export global WLDP_ISAPPAPPROVEDBYPOLICY_FN := "WldpIsAppApprovedByPolicy"

/**
 * @type {String}
 */
export global WLDP_QUERYPOLICYSETTINGENABLED_FN := "WldpQueryPolicySettingEnabled"

/**
 * @type {String}
 */
export global WLDP_QUERYPOLICYSETTINGENABLED2_FN := "WldpQueryPolicySettingEnabled2"

/**
 * @type {String}
 */
export global WLDP_ISWCOSPRODUCTIONCONFIGURATION_FN := "WldpIsWcosProductionConfiguration"

/**
 * @type {String}
 */
export global WLDP_RESETWCOSPRODUCTIONCONFIGURATION_FN := "WldpResetWcosProductionConfiguration"

/**
 * @type {String}
 */
export global WLDP_ISPRODUCTIONCONFIGURATION_FN := "WldpIsProductionConfiguration"

/**
 * @type {String}
 */
export global WLDP_RESETPRODUCTIONCONFIGURATION_FN := "WldpResetProductionConfiguration"

/**
 * @type {String}
 */
export global WLDP_CANEXECUTEBUFFER_FN := "WldpCanExecuteBuffer"

/**
 * @type {String}
 */
export global WLDP_CANEXECUTEFILE_FN := "WldpCanExecuteFile"

/**
 * @type {String}
 */
export global WLDP_CANEXECUTEFILEFROMDETACHEDSIGNATURE_FN := "WldpCanExecuteFileFromDetachedSignature"

/**
 * @type {String}
 */
export global WLDP_QUERYSECURITYPOLICY_FN := "WldpQuerySecurityPolicy"

/**
 * @type {Integer (UInt32)}
 */
export global WLDP_LOCKDOWN_UNDEFINED := 0

/**
 * @type {Integer (UInt32)}
 */
export global WLDP_LOCKDOWN_DEFINED_FLAG := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global WLDP_LOCKDOWN_CONFIG_CI_FLAG := 1

/**
 * @type {Integer (UInt32)}
 */
export global WLDP_LOCKDOWN_CONFIG_CI_AUDIT_FLAG := 2

/**
 * @type {Integer (UInt32)}
 */
export global WLDP_LOCKDOWN_UMCIENFORCE_FLAG := 4

/**
 * @type {Integer (UInt32)}
 */
export global WLDP_LOCKDOWN_AUDIT_FLAG := 8

/**
 * @type {Integer (UInt32)}
 */
export global WLDP_LOCKDOWN_EXCLUSION_FLAG := 16

/**
 * @type {Integer (UInt32)}
 */
export global WLDP_LOCKDOWN_OFF := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global WLDP_HOST_INFORMATION_REVISION := 1

/**
 * @type {Integer (UInt32)}
 */
export global WLDP_FLAGS_SKIPSIGNATUREVALIDATION := 256

/**
 * @type {Integer (UInt32)}
 */
export global MAX_TDI_ENTITIES := 4096

/**
 * @type {Integer (UInt32)}
 */
export global INFO_CLASS_GENERIC := 256

/**
 * @type {Integer (UInt32)}
 */
export global INFO_CLASS_PROTOCOL := 512

/**
 * @type {Integer (UInt32)}
 */
export global INFO_CLASS_IMPLEMENTATION := 768

/**
 * @type {Integer (UInt32)}
 */
export global INFO_TYPE_PROVIDER := 256

/**
 * @type {Integer (UInt32)}
 */
export global INFO_TYPE_ADDRESS_OBJECT := 512

/**
 * @type {Integer (UInt32)}
 */
export global INFO_TYPE_CONNECTION := 768

/**
 * @type {Integer (UInt32)}
 */
export global ENTITY_LIST_ID := 0

/**
 * @type {Integer (Int32)}
 */
export global INVALID_ENTITY_INSTANCE := -1

/**
 * @type {Integer (UInt32)}
 */
export global CONTEXT_SIZE := 16

/**
 * @type {Integer (UInt32)}
 */
export global ENTITY_TYPE_ID := 1

/**
 * @type {Integer (UInt32)}
 */
export global CO_TL_NBF := 1024

/**
 * @type {Integer (UInt32)}
 */
export global CO_TL_SPX := 1026

/**
 * @type {Integer (UInt32)}
 */
export global CO_TL_TCP := 1028

/**
 * @type {Integer (UInt32)}
 */
export global CO_TL_SPP := 1030

/**
 * @type {Integer (UInt32)}
 */
export global CL_TL_NBF := 1025

/**
 * @type {Integer (UInt32)}
 */
export global CL_TL_UDP := 1027

/**
 * @type {Integer (UInt32)}
 */
export global ER_ICMP := 896

/**
 * @type {Integer (UInt32)}
 */
export global CL_NL_IPX := 769

/**
 * @type {Integer (UInt32)}
 */
export global CL_NL_IP := 771

/**
 * @type {Integer (UInt32)}
 */
export global AT_ARP := 640

/**
 * @type {Integer (UInt32)}
 */
export global AT_NULL := 642

/**
 * @type {Integer (UInt32)}
 */
export global IF_GENERIC := 512

/**
 * @type {Integer (UInt32)}
 */
export global IF_MIB := 514

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_TDI_TL_IO_CONTROL_ENDPOINT := 2162744

/**
 * @type {Integer (UInt32)}
 */
export global DCI_VERSION := 256

/**
 * @type {Integer (UInt32)}
 */
export global DCICREATEPRIMARYSURFACE := 1

/**
 * @type {Integer (UInt32)}
 */
export global DCICREATEOFFSCREENSURFACE := 2

/**
 * @type {Integer (UInt32)}
 */
export global DCICREATEOVERLAYSURFACE := 3

/**
 * @type {Integer (UInt32)}
 */
export global DCIENUMSURFACE := 4

/**
 * @type {Integer (UInt32)}
 */
export global DCIESCAPE := 5

/**
 * @type {Integer (UInt32)}
 */
export global DCI_OK := 0

/**
 * @type {Integer (Int32)}
 */
export global DCI_FAIL_GENERIC := -1

/**
 * @type {Integer (Int32)}
 */
export global DCI_FAIL_UNSUPPORTEDVERSION := -2

/**
 * @type {Integer (Int32)}
 */
export global DCI_FAIL_INVALIDSURFACE := -3

/**
 * @type {Integer (Int32)}
 */
export global DCI_FAIL_UNSUPPORTED := -4

/**
 * @type {Integer (Int32)}
 */
export global DCI_ERR_CURRENTLYNOTAVAIL := -5

/**
 * @type {Integer (Int32)}
 */
export global DCI_ERR_INVALIDRECT := -6

/**
 * @type {Integer (Int32)}
 */
export global DCI_ERR_UNSUPPORTEDFORMAT := -7

/**
 * @type {Integer (Int32)}
 */
export global DCI_ERR_UNSUPPORTEDMASK := -8

/**
 * @type {Integer (Int32)}
 */
export global DCI_ERR_TOOBIGHEIGHT := -9

/**
 * @type {Integer (Int32)}
 */
export global DCI_ERR_TOOBIGWIDTH := -10

/**
 * @type {Integer (Int32)}
 */
export global DCI_ERR_TOOBIGSIZE := -11

/**
 * @type {Integer (Int32)}
 */
export global DCI_ERR_OUTOFMEMORY := -12

/**
 * @type {Integer (Int32)}
 */
export global DCI_ERR_INVALIDPOSITION := -13

/**
 * @type {Integer (Int32)}
 */
export global DCI_ERR_INVALIDSTRETCH := -14

/**
 * @type {Integer (Int32)}
 */
export global DCI_ERR_INVALIDCLIPLIST := -15

/**
 * @type {Integer (Int32)}
 */
export global DCI_ERR_SURFACEISOBSCURED := -16

/**
 * @type {Integer (Int32)}
 */
export global DCI_ERR_XALIGN := -17

/**
 * @type {Integer (Int32)}
 */
export global DCI_ERR_YALIGN := -18

/**
 * @type {Integer (Int32)}
 */
export global DCI_ERR_XYALIGN := -19

/**
 * @type {Integer (Int32)}
 */
export global DCI_ERR_WIDTHALIGN := -20

/**
 * @type {Integer (Int32)}
 */
export global DCI_ERR_HEIGHTALIGN := -21

/**
 * @type {Integer (UInt32)}
 */
export global DCI_STATUS_POINTERCHANGED := 1

/**
 * @type {Integer (UInt32)}
 */
export global DCI_STATUS_STRIDECHANGED := 2

/**
 * @type {Integer (UInt32)}
 */
export global DCI_STATUS_FORMATCHANGED := 4

/**
 * @type {Integer (UInt32)}
 */
export global DCI_STATUS_SURFACEINFOCHANGED := 8

/**
 * @type {Integer (UInt32)}
 */
export global DCI_STATUS_CHROMAKEYCHANGED := 16

/**
 * @type {Integer (UInt32)}
 */
export global DCI_STATUS_WASSTILLDRAWING := 32

/**
 * @type {Integer (UInt32)}
 */
export global DCI_SURFACE_TYPE := 15

/**
 * @type {Integer (UInt32)}
 */
export global DCI_PRIMARY := 0

/**
 * @type {Integer (UInt32)}
 */
export global DCI_OFFSCREEN := 1

/**
 * @type {Integer (UInt32)}
 */
export global DCI_OVERLAY := 2

/**
 * @type {Integer (UInt32)}
 */
export global DCI_VISIBLE := 16

/**
 * @type {Integer (UInt32)}
 */
export global DCI_CHROMAKEY := 32

/**
 * @type {Integer (UInt32)}
 */
export global DCI_1632_ACCESS := 64

/**
 * @type {Integer (UInt32)}
 */
export global DCI_DWORDSIZE := 128

/**
 * @type {Integer (UInt32)}
 */
export global DCI_DWORDALIGN := 256

/**
 * @type {Integer (UInt32)}
 */
export global DCI_WRITEONLY := 512

/**
 * @type {Integer (UInt32)}
 */
export global DCI_ASYNC := 1024

/**
 * @type {Integer (UInt32)}
 */
export global DCI_CAN_STRETCHX := 4096

/**
 * @type {Integer (UInt32)}
 */
export global DCI_CAN_STRETCHY := 8192

/**
 * @type {Integer (UInt32)}
 */
export global DCI_CAN_STRETCHXN := 16384

/**
 * @type {Integer (UInt32)}
 */
export global DCI_CAN_STRETCHYN := 32768

/**
 * @type {Integer (UInt32)}
 */
export global DCI_CANOVERLAY := 65536

/**
 * @type {Integer (UInt32)}
 */
export global FILE_FLAG_OPEN_REQUIRING_OPLOCK := 262144

/**
 * @type {Integer (UInt32)}
 */
export global FILE_FLAG_IGNORE_IMPERSONATED_DEVICEMAP := 131072

/**
 * @type {Integer (UInt32)}
 */
export global FILE_FLAG_DISALLOW_PATH_REDIRECTS := 65536

/**
 * @type {Integer (UInt32)}
 */
export global FAIL_FAST_GENERATE_EXCEPTION_ADDRESS := 1

/**
 * @type {Integer (UInt32)}
 */
export global FAIL_FAST_NO_HARD_ERROR_DLG := 2

/**
 * @type {Integer (UInt32)}
 */
export global SP_SERIALCOMM := 1

/**
 * @type {Integer (UInt32)}
 */
export global PST_UNSPECIFIED := 0

/**
 * @type {Integer (UInt32)}
 */
export global PST_RS232 := 1

/**
 * @type {Integer (UInt32)}
 */
export global PST_PARALLELPORT := 2

/**
 * @type {Integer (UInt32)}
 */
export global PST_RS422 := 3

/**
 * @type {Integer (UInt32)}
 */
export global PST_RS423 := 4

/**
 * @type {Integer (UInt32)}
 */
export global PST_RS449 := 5

/**
 * @type {Integer (UInt32)}
 */
export global PST_MODEM := 6

/**
 * @type {Integer (UInt32)}
 */
export global PST_FAX := 33

/**
 * @type {Integer (UInt32)}
 */
export global PST_SCANNER := 34

/**
 * @type {Integer (UInt32)}
 */
export global PST_NETWORK_BRIDGE := 256

/**
 * @type {Integer (UInt32)}
 */
export global PST_LAT := 257

/**
 * @type {Integer (UInt32)}
 */
export global PST_TCPIP_TELNET := 258

/**
 * @type {Integer (UInt32)}
 */
export global PST_X25 := 259

/**
 * @type {Integer (UInt32)}
 */
export global PCF_DTRDSR := 1

/**
 * @type {Integer (UInt32)}
 */
export global PCF_RTSCTS := 2

/**
 * @type {Integer (UInt32)}
 */
export global PCF_RLSD := 4

/**
 * @type {Integer (UInt32)}
 */
export global PCF_PARITY_CHECK := 8

/**
 * @type {Integer (UInt32)}
 */
export global PCF_XONXOFF := 16

/**
 * @type {Integer (UInt32)}
 */
export global PCF_SETXCHAR := 32

/**
 * @type {Integer (UInt32)}
 */
export global PCF_TOTALTIMEOUTS := 64

/**
 * @type {Integer (UInt32)}
 */
export global PCF_INTTIMEOUTS := 128

/**
 * @type {Integer (UInt32)}
 */
export global PCF_SPECIALCHARS := 256

/**
 * @type {Integer (UInt32)}
 */
export global PCF_16BITMODE := 512

/**
 * @type {Integer (UInt32)}
 */
export global SP_PARITY := 1

/**
 * @type {Integer (UInt32)}
 */
export global SP_BAUD := 2

/**
 * @type {Integer (UInt32)}
 */
export global SP_DATABITS := 4

/**
 * @type {Integer (UInt32)}
 */
export global SP_STOPBITS := 8

/**
 * @type {Integer (UInt32)}
 */
export global SP_HANDSHAKING := 16

/**
 * @type {Integer (UInt32)}
 */
export global SP_PARITY_CHECK := 32

/**
 * @type {Integer (UInt32)}
 */
export global SP_RLSD := 64

/**
 * @type {Integer (UInt32)}
 */
export global BAUD_075 := 1

/**
 * @type {Integer (UInt32)}
 */
export global BAUD_110 := 2

/**
 * @type {Integer (UInt32)}
 */
export global BAUD_134_5 := 4

/**
 * @type {Integer (UInt32)}
 */
export global BAUD_150 := 8

/**
 * @type {Integer (UInt32)}
 */
export global BAUD_300 := 16

/**
 * @type {Integer (UInt32)}
 */
export global BAUD_600 := 32

/**
 * @type {Integer (UInt32)}
 */
export global BAUD_1200 := 64

/**
 * @type {Integer (UInt32)}
 */
export global BAUD_1800 := 128

/**
 * @type {Integer (UInt32)}
 */
export global BAUD_2400 := 256

/**
 * @type {Integer (UInt32)}
 */
export global BAUD_4800 := 512

/**
 * @type {Integer (UInt32)}
 */
export global BAUD_7200 := 1024

/**
 * @type {Integer (UInt32)}
 */
export global BAUD_9600 := 2048

/**
 * @type {Integer (UInt32)}
 */
export global BAUD_14400 := 4096

/**
 * @type {Integer (UInt32)}
 */
export global BAUD_19200 := 8192

/**
 * @type {Integer (UInt32)}
 */
export global BAUD_38400 := 16384

/**
 * @type {Integer (UInt32)}
 */
export global BAUD_56K := 32768

/**
 * @type {Integer (UInt32)}
 */
export global BAUD_128K := 65536

/**
 * @type {Integer (UInt32)}
 */
export global BAUD_115200 := 131072

/**
 * @type {Integer (UInt32)}
 */
export global BAUD_57600 := 262144

/**
 * @type {Integer (UInt32)}
 */
export global BAUD_USER := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global COMMPROP_INITIALIZED := 3879531822

/**
 * @type {Integer (UInt32)}
 */
export global DTR_CONTROL_DISABLE := 0

/**
 * @type {Integer (UInt32)}
 */
export global DTR_CONTROL_ENABLE := 1

/**
 * @type {Integer (UInt32)}
 */
export global DTR_CONTROL_HANDSHAKE := 2

/**
 * @type {Integer (UInt32)}
 */
export global RTS_CONTROL_DISABLE := 0

/**
 * @type {Integer (UInt32)}
 */
export global RTS_CONTROL_ENABLE := 1

/**
 * @type {Integer (UInt32)}
 */
export global RTS_CONTROL_HANDSHAKE := 2

/**
 * @type {Integer (UInt32)}
 */
export global RTS_CONTROL_TOGGLE := 3

/**
 * @type {Integer (UInt32)}
 */
export global GMEM_NOCOMPACT := 16

/**
 * @type {Integer (UInt32)}
 */
export global GMEM_NODISCARD := 32

/**
 * @type {Integer (UInt32)}
 */
export global GMEM_MODIFY := 128

/**
 * @type {Integer (UInt32)}
 */
export global GMEM_DISCARDABLE := 256

/**
 * @type {Integer (UInt32)}
 */
export global GMEM_NOT_BANKED := 4096

/**
 * @type {Integer (UInt32)}
 */
export global GMEM_SHARE := 8192

/**
 * @type {Integer (UInt32)}
 */
export global GMEM_DDESHARE := 8192

/**
 * @type {Integer (UInt32)}
 */
export global GMEM_NOTIFY := 16384

/**
 * @type {Integer (UInt32)}
 */
export global GMEM_LOWER := 4096

/**
 * @type {Integer (UInt32)}
 */
export global GMEM_VALID_FLAGS := 32626

/**
 * @type {Integer (UInt32)}
 */
export global GMEM_INVALID_HANDLE := 32768

/**
 * @type {Integer (UInt32)}
 */
export global GMEM_DISCARDED := 16384

/**
 * @type {Integer (UInt32)}
 */
export global GMEM_LOCKCOUNT := 255

/**
 * @type {Integer (UInt32)}
 */
export global THREAD_PRIORITY_ERROR_RETURN := 2147483647

/**
 * @type {Integer (UInt32)}
 */
export global DRIVE_UNKNOWN := 0

/**
 * @type {Integer (UInt32)}
 */
export global DRIVE_NO_ROOT_DIR := 1

/**
 * @type {Integer (UInt32)}
 */
export global DRIVE_REMOVABLE := 2

/**
 * @type {Integer (UInt32)}
 */
export global DRIVE_FIXED := 3

/**
 * @type {Integer (UInt32)}
 */
export global DRIVE_REMOTE := 4

/**
 * @type {Integer (UInt32)}
 */
export global DRIVE_CDROM := 5

/**
 * @type {Integer (UInt32)}
 */
export global DRIVE_RAMDISK := 6

/**
 * @type {Integer (UInt32)}
 */
export global IGNORE := 0

/**
 * @type {Integer (UInt32)}
 */
export global CBR_110 := 110

/**
 * @type {Integer (UInt32)}
 */
export global CBR_300 := 300

/**
 * @type {Integer (UInt32)}
 */
export global CBR_600 := 600

/**
 * @type {Integer (UInt32)}
 */
export global CBR_1200 := 1200

/**
 * @type {Integer (UInt32)}
 */
export global CBR_2400 := 2400

/**
 * @type {Integer (UInt32)}
 */
export global CBR_4800 := 4800

/**
 * @type {Integer (UInt32)}
 */
export global CBR_9600 := 9600

/**
 * @type {Integer (UInt32)}
 */
export global CBR_14400 := 14400

/**
 * @type {Integer (UInt32)}
 */
export global CBR_19200 := 19200

/**
 * @type {Integer (UInt32)}
 */
export global CBR_38400 := 38400

/**
 * @type {Integer (UInt32)}
 */
export global CBR_56000 := 56000

/**
 * @type {Integer (UInt32)}
 */
export global CBR_57600 := 57600

/**
 * @type {Integer (UInt32)}
 */
export global CBR_115200 := 115200

/**
 * @type {Integer (UInt32)}
 */
export global CBR_128000 := 128000

/**
 * @type {Integer (UInt32)}
 */
export global CBR_256000 := 256000

/**
 * @type {Integer (UInt32)}
 */
export global CE_TXFULL := 256

/**
 * @type {Integer (UInt32)}
 */
export global CE_PTO := 512

/**
 * @type {Integer (UInt32)}
 */
export global CE_IOE := 1024

/**
 * @type {Integer (UInt32)}
 */
export global CE_DNS := 2048

/**
 * @type {Integer (UInt32)}
 */
export global CE_OOP := 4096

/**
 * @type {Integer (UInt32)}
 */
export global CE_MODE := 32768

/**
 * @type {Integer (Int32)}
 */
export global IE_BADID := -1

/**
 * @type {Integer (Int32)}
 */
export global IE_OPEN := -2

/**
 * @type {Integer (Int32)}
 */
export global IE_NOPEN := -3

/**
 * @type {Integer (Int32)}
 */
export global IE_MEMORY := -4

/**
 * @type {Integer (Int32)}
 */
export global IE_DEFAULT := -5

/**
 * @type {Integer (Int32)}
 */
export global IE_HARDWARE := -10

/**
 * @type {Integer (Int32)}
 */
export global IE_BYTESIZE := -11

/**
 * @type {Integer (Int32)}
 */
export global IE_BAUDRATE := -12

/**
 * @type {Integer (UInt32)}
 */
export global RESETDEV := 7

/**
 * @type {Integer (UInt32)}
 */
export global LPTx := 128

/**
 * @type {Integer (UInt32)}
 */
export global S_QUEUEEMPTY := 0

/**
 * @type {Integer (UInt32)}
 */
export global S_THRESHOLD := 1

/**
 * @type {Integer (UInt32)}
 */
export global S_ALLTHRESHOLD := 2

/**
 * @type {Integer (UInt32)}
 */
export global S_NORMAL := 0

/**
 * @type {Integer (UInt32)}
 */
export global S_LEGATO := 1

/**
 * @type {Integer (UInt32)}
 */
export global S_STACCATO := 2

/**
 * @type {Integer (UInt32)}
 */
export global S_PERIOD512 := 0

/**
 * @type {Integer (UInt32)}
 */
export global S_PERIOD1024 := 1

/**
 * @type {Integer (UInt32)}
 */
export global S_PERIOD2048 := 2

/**
 * @type {Integer (UInt32)}
 */
export global S_PERIODVOICE := 3

/**
 * @type {Integer (UInt32)}
 */
export global S_WHITE512 := 4

/**
 * @type {Integer (UInt32)}
 */
export global S_WHITE1024 := 5

/**
 * @type {Integer (UInt32)}
 */
export global S_WHITE2048 := 6

/**
 * @type {Integer (UInt32)}
 */
export global S_WHITEVOICE := 7

/**
 * @type {Integer (Int32)}
 */
export global S_SERDVNA := -1

/**
 * @type {Integer (Int32)}
 */
export global S_SEROFM := -2

/**
 * @type {Integer (Int32)}
 */
export global S_SERMACT := -3

/**
 * @type {Integer (Int32)}
 */
export global S_SERQFUL := -4

/**
 * @type {Integer (Int32)}
 */
export global S_SERBDNT := -5

/**
 * @type {Integer (Int32)}
 */
export global S_SERDLN := -6

/**
 * @type {Integer (Int32)}
 */
export global S_SERDCC := -7

/**
 * @type {Integer (Int32)}
 */
export global S_SERDTP := -8

/**
 * @type {Integer (Int32)}
 */
export global S_SERDVL := -9

/**
 * @type {Integer (Int32)}
 */
export global S_SERDMD := -10

/**
 * @type {Integer (Int32)}
 */
export global S_SERDSH := -11

/**
 * @type {Integer (Int32)}
 */
export global S_SERDPT := -12

/**
 * @type {Integer (Int32)}
 */
export global S_SERDFQ := -13

/**
 * @type {Integer (Int32)}
 */
export global S_SERDDR := -14

/**
 * @type {Integer (Int32)}
 */
export global S_SERDSR := -15

/**
 * @type {Integer (Int32)}
 */
export global S_SERDST := -16

/**
 * @type {Integer (UInt32)}
 */
export global FS_CASE_IS_PRESERVED := 2

/**
 * @type {Integer (UInt32)}
 */
export global FS_CASE_SENSITIVE := 1

/**
 * @type {Integer (UInt32)}
 */
export global FS_UNICODE_STORED_ON_DISK := 4

/**
 * @type {Integer (UInt32)}
 */
export global FS_PERSISTENT_ACLS := 8

/**
 * @type {Integer (UInt32)}
 */
export global FS_VOL_IS_COMPRESSED := 32768

/**
 * @type {Integer (UInt32)}
 */
export global FS_FILE_COMPRESSION := 16

/**
 * @type {Integer (UInt32)}
 */
export global FS_FILE_ENCRYPTION := 131072

/**
 * @type {Integer (UInt32)}
 */
export global OFS_MAXPATHNAME := 128

/**
 * @type {Integer (UInt32)}
 */
export global MAXINTATOM := 49152

/**
 * @type {Integer (UInt32)}
 */
export global SCS_32BIT_BINARY := 0

/**
 * @type {Integer (UInt32)}
 */
export global SCS_DOS_BINARY := 1

/**
 * @type {Integer (UInt32)}
 */
export global SCS_WOW_BINARY := 2

/**
 * @type {Integer (UInt32)}
 */
export global SCS_PIF_BINARY := 3

/**
 * @type {Integer (UInt32)}
 */
export global SCS_POSIX_BINARY := 4

/**
 * @type {Integer (UInt32)}
 */
export global SCS_OS216_BINARY := 5

/**
 * @type {Integer (UInt32)}
 */
export global SCS_64BIT_BINARY := 6

/**
 * @type {Integer (UInt32)}
 */
export global SCS_THIS_PLATFORM_BINARY := 6

/**
 * @type {Integer (UInt32)}
 */
export global FIBER_FLAG_FLOAT_SWITCH := 1

/**
 * @type {Integer (UInt32)}
 */
export global UMS_VERSION := 256

/**
 * @type {Integer (UInt32)}
 */
export global FILE_SKIP_COMPLETION_PORT_ON_SUCCESS := 1

/**
 * @type {Integer (UInt32)}
 */
export global FILE_SKIP_SET_EVENT_ON_HANDLE := 2

/**
 * @type {Integer (UInt32)}
 */
export global CRITICAL_SECTION_NO_DEBUG_INFO := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global HINSTANCE_ERROR := 32

/**
 * @type {Integer (UInt32)}
 */
export global FORMAT_MESSAGE_MAX_WIDTH_MASK := 255

/**
 * @type {Integer (UInt32)}
 */
export global FILE_ENCRYPTABLE := 0

/**
 * @type {Integer (UInt32)}
 */
export global FILE_IS_ENCRYPTED := 1

/**
 * @type {Integer (UInt32)}
 */
export global FILE_SYSTEM_ATTR := 2

/**
 * @type {Integer (UInt32)}
 */
export global FILE_ROOT_DIR := 3

/**
 * @type {Integer (UInt32)}
 */
export global FILE_SYSTEM_DIR := 4

/**
 * @type {Integer (UInt32)}
 */
export global FILE_UNKNOWN := 5

/**
 * @type {Integer (UInt32)}
 */
export global FILE_SYSTEM_NOT_SUPPORT := 6

/**
 * @type {Integer (UInt32)}
 */
export global FILE_USER_DISALLOWED := 7

/**
 * @type {Integer (UInt32)}
 */
export global FILE_READ_ONLY := 8

/**
 * @type {Integer (UInt32)}
 */
export global FILE_DIR_DISALLOWED := 9

/**
 * @type {Integer (UInt32)}
 */
export global EFS_USE_RECOVERY_KEYS := 1

/**
 * @type {Integer (UInt32)}
 */
export global CREATE_FOR_IMPORT := 1

/**
 * @type {Integer (UInt32)}
 */
export global CREATE_FOR_DIR := 2

/**
 * @type {Integer (UInt32)}
 */
export global OVERWRITE_HIDDEN := 4

/**
 * @type {Integer (UInt32)}
 */
export global EFSRPC_SECURE_ONLY := 8

/**
 * @type {Integer (UInt32)}
 */
export global EFS_DROP_ALTERNATE_STREAMS := 16

/**
 * @type {Integer (UInt32)}
 */
export global BACKUP_INVALID := 0

/**
 * @type {Integer (UInt32)}
 */
export global BACKUP_GHOSTED_FILE_EXTENTS := 11

/**
 * @type {Integer (UInt32)}
 */
export global STREAM_NORMAL_ATTRIBUTE := 0

/**
 * @type {Integer (UInt32)}
 */
export global STREAM_MODIFIED_WHEN_READ := 1

/**
 * @type {Integer (UInt32)}
 */
export global STREAM_CONTAINS_SECURITY := 2

/**
 * @type {Integer (UInt32)}
 */
export global STREAM_CONTAINS_PROPERTIES := 4

/**
 * @type {Integer (UInt32)}
 */
export global STREAM_SPARSE_ATTRIBUTE := 8

/**
 * @type {Integer (UInt32)}
 */
export global STREAM_CONTAINS_GHOSTED_FILE_EXTENTS := 16

/**
 * @type {Integer (UInt32)}
 */
export global STARTF_HOLOGRAPHIC := 262144

/**
 * @type {Integer (UInt32)}
 */
export global SHUTDOWN_NORETRY := 1

/**
 * @type {Integer (UInt32)}
 */
export global PROTECTION_LEVEL_SAME := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global ATOM_FLAG_GLOBAL := 2

/**
 * @type {String}
 */
export global GET_SYSTEM_WOW64_DIRECTORY_NAME_A_A := "GetSystemWow64DirectoryA"

/**
 * @type {String}
 */
export global GET_SYSTEM_WOW64_DIRECTORY_NAME_A_W := "GetSystemWow64DirectoryA"

/**
 * @type {String}
 */
export global GET_SYSTEM_WOW64_DIRECTORY_NAME_A_T := "GetSystemWow64DirectoryA"

/**
 * @type {String}
 */
export global GET_SYSTEM_WOW64_DIRECTORY_NAME_W_A := "GetSystemWow64DirectoryW"

/**
 * @type {String}
 */
export global GET_SYSTEM_WOW64_DIRECTORY_NAME_W_W := "GetSystemWow64DirectoryW"

/**
 * @type {String}
 */
export global GET_SYSTEM_WOW64_DIRECTORY_NAME_W_T := "GetSystemWow64DirectoryW"

/**
 * @type {String}
 */
export global GET_SYSTEM_WOW64_DIRECTORY_NAME_T_A := "GetSystemWow64DirectoryW"

/**
 * @type {String}
 */
export global GET_SYSTEM_WOW64_DIRECTORY_NAME_T_W := "GetSystemWow64DirectoryW"

/**
 * @type {String}
 */
export global GET_SYSTEM_WOW64_DIRECTORY_NAME_T_T := "GetSystemWow64DirectoryW"

/**
 * @type {Integer (UInt32)}
 */
export global BASE_SEARCH_PATH_ENABLE_SAFE_SEARCHMODE := 1

/**
 * @type {Integer (UInt32)}
 */
export global BASE_SEARCH_PATH_DISABLE_SAFE_SEARCHMODE := 65536

/**
 * @type {Integer (UInt32)}
 */
export global BASE_SEARCH_PATH_PERMANENT := 32768

/**
 * @type {Integer (UInt32)}
 */
export global EVENTLOG_FULL_INFO := 0

/**
 * @type {Integer (UInt32)}
 */
export global OPERATION_API_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global MAX_COMPUTERNAME_LENGTH := 15

/**
 * @type {Integer (UInt32)}
 */
export global LOGON32_PROVIDER_WINNT35 := 1

/**
 * @type {Integer (UInt32)}
 */
export global LOGON32_PROVIDER_VIRTUAL := 4

/**
 * @type {Integer (UInt32)}
 */
export global LOGON_ZERO_PASSWORD_BUFFER := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global HW_PROFILE_GUIDLEN := 39

/**
 * @type {Integer (UInt32)}
 */
export global DOCKINFO_UNDOCKED := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOCKINFO_DOCKED := 2

/**
 * @type {Integer (UInt32)}
 */
export global DOCKINFO_USER_SUPPLIED := 4

/**
 * @type {Integer (UInt32)}
 */
export global TC_NORMAL := 0

/**
 * @type {Integer (UInt32)}
 */
export global TC_HARDERR := 1

/**
 * @type {Integer (UInt32)}
 */
export global TC_GP_TRAP := 2

/**
 * @type {Integer (UInt32)}
 */
export global TC_SIGNAL := 3

/**
 * @type {Integer (UInt32)}
 */
export global AC_LINE_OFFLINE := 0

/**
 * @type {Integer (UInt32)}
 */
export global AC_LINE_ONLINE := 1

/**
 * @type {Integer (UInt32)}
 */
export global AC_LINE_BACKUP_POWER := 2

/**
 * @type {Integer (UInt32)}
 */
export global AC_LINE_UNKNOWN := 255

/**
 * @type {Integer (UInt32)}
 */
export global BATTERY_FLAG_HIGH := 1

/**
 * @type {Integer (UInt32)}
 */
export global BATTERY_FLAG_LOW := 2

/**
 * @type {Integer (UInt32)}
 */
export global BATTERY_FLAG_CRITICAL := 4

/**
 * @type {Integer (UInt32)}
 */
export global BATTERY_FLAG_CHARGING := 8

/**
 * @type {Integer (UInt32)}
 */
export global BATTERY_FLAG_NO_BATTERY := 128

/**
 * @type {Integer (UInt32)}
 */
export global BATTERY_FLAG_UNKNOWN := 255

/**
 * @type {Integer (UInt32)}
 */
export global BATTERY_PERCENTAGE_UNKNOWN := 255

/**
 * @type {Integer (UInt32)}
 */
export global SYSTEM_STATUS_FLAG_POWER_SAVING_ON := 1

/**
 * @type {Integer (UInt32)}
 */
export global BATTERY_LIFE_UNKNOWN := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global ACTCTX_FLAG_PROCESSOR_ARCHITECTURE_VALID := 1

/**
 * @type {Integer (UInt32)}
 */
export global ACTCTX_FLAG_LANGID_VALID := 2

/**
 * @type {Integer (UInt32)}
 */
export global ACTCTX_FLAG_ASSEMBLY_DIRECTORY_VALID := 4

/**
 * @type {Integer (UInt32)}
 */
export global ACTCTX_FLAG_RESOURCE_NAME_VALID := 8

/**
 * @type {Integer (UInt32)}
 */
export global ACTCTX_FLAG_SET_PROCESS_DEFAULT := 16

/**
 * @type {Integer (UInt32)}
 */
export global ACTCTX_FLAG_APPLICATION_NAME_VALID := 32

/**
 * @type {Integer (UInt32)}
 */
export global ACTCTX_FLAG_SOURCE_IS_ASSEMBLYREF := 64

/**
 * @type {Integer (UInt32)}
 */
export global ACTCTX_FLAG_HMODULE_VALID := 128

/**
 * @type {Integer (UInt32)}
 */
export global DEACTIVATE_ACTCTX_FLAG_FORCE_EARLY_DEACTIVATION := 1

/**
 * @type {Integer (UInt32)}
 */
export global FIND_ACTCTX_SECTION_KEY_RETURN_HACTCTX := 1

/**
 * @type {Integer (UInt32)}
 */
export global FIND_ACTCTX_SECTION_KEY_RETURN_FLAGS := 2

/**
 * @type {Integer (UInt32)}
 */
export global FIND_ACTCTX_SECTION_KEY_RETURN_ASSEMBLY_METADATA := 4

/**
 * @type {Integer (UInt32)}
 */
export global ACTIVATION_CONTEXT_BASIC_INFORMATION_DEFINED := 1

/**
 * @type {Integer (UInt32)}
 */
export global QUERY_ACTCTX_FLAG_USE_ACTIVE_ACTCTX := 4

/**
 * @type {Integer (UInt32)}
 */
export global QUERY_ACTCTX_FLAG_ACTCTX_IS_HMODULE := 8

/**
 * @type {Integer (UInt32)}
 */
export global QUERY_ACTCTX_FLAG_ACTCTX_IS_ADDRESS := 16

/**
 * @type {Integer (UInt32)}
 */
export global QUERY_ACTCTX_FLAG_NO_ADDREF := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global RESTART_MAX_CMD_LINE := 1024

/**
 * @type {Integer (UInt32)}
 */
export global RECOVERY_DEFAULT_PING_INTERVAL := 5000

/**
 * @type {Integer (UInt32)}
 */
export global FILE_RENAME_FLAG_REPLACE_IF_EXISTS := 1

/**
 * @type {Integer (UInt32)}
 */
export global FILE_RENAME_FLAG_POSIX_SEMANTICS := 2

/**
 * @type {Integer (UInt32)}
 */
export global FILE_RENAME_FLAG_SUPPRESS_PIN_STATE_INHERITANCE := 4

/**
 * @type {Integer (UInt32)}
 */
export global STORAGE_INFO_FLAGS_ALIGNED_DEVICE := 1

/**
 * @type {Integer (UInt32)}
 */
export global STORAGE_INFO_FLAGS_PARTITION_ALIGNED_ON_DEVICE := 2

/**
 * @type {Integer (UInt32)}
 */
export global STORAGE_INFO_OFFSET_UNKNOWN := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global REMOTE_PROTOCOL_INFO_FLAG_LOOPBACK := 1

/**
 * @type {Integer (UInt32)}
 */
export global REMOTE_PROTOCOL_INFO_FLAG_OFFLINE := 2

/**
 * @type {Integer (UInt32)}
 */
export global REMOTE_PROTOCOL_INFO_FLAG_PERSISTENT_HANDLE := 4

/**
 * @type {Integer (UInt32)}
 */
export global RPI_FLAG_SMB2_SHARECAP_TIMEWARP := 2

/**
 * @type {Integer (UInt32)}
 */
export global RPI_FLAG_SMB2_SHARECAP_DFS := 8

/**
 * @type {Integer (UInt32)}
 */
export global RPI_FLAG_SMB2_SHARECAP_CONTINUOUS_AVAILABILITY := 16

/**
 * @type {Integer (UInt32)}
 */
export global RPI_FLAG_SMB2_SHARECAP_SCALEOUT := 32

/**
 * @type {Integer (UInt32)}
 */
export global RPI_FLAG_SMB2_SHARECAP_CLUSTER := 64

/**
 * @type {Integer (UInt32)}
 */
export global RPI_SMB2_SHAREFLAG_ENCRYPT_DATA := 1

/**
 * @type {Integer (UInt32)}
 */
export global RPI_SMB2_SHAREFLAG_COMPRESS_DATA := 2

/**
 * @type {Integer (UInt32)}
 */
export global RPI_SMB2_FLAG_SERVERCAP_DFS := 1

/**
 * @type {Integer (UInt32)}
 */
export global RPI_SMB2_FLAG_SERVERCAP_LEASING := 2

/**
 * @type {Integer (UInt32)}
 */
export global RPI_SMB2_FLAG_SERVERCAP_LARGEMTU := 4

/**
 * @type {Integer (UInt32)}
 */
export global RPI_SMB2_FLAG_SERVERCAP_MULTICHANNEL := 8

/**
 * @type {Integer (UInt32)}
 */
export global RPI_SMB2_FLAG_SERVERCAP_PERSISTENT_HANDLES := 16

/**
 * @type {Integer (UInt32)}
 */
export global RPI_SMB2_FLAG_SERVERCAP_DIRECTORY_LEASING := 32

/**
 * @type {Integer (UInt32)}
 */
export global MICROSOFT_WINDOWS_WINBASE_H_DEFINE_INTERLOCKED_CPLUSPLUS_OVERLOADS := 0

/**
 * @type {Integer (UInt32)}
 */
export global MICROSOFT_WINBASE_H_DEFINE_INTERLOCKED_CPLUSPLUS_OVERLOADS := 0

/**
 * @type {Integer (UInt32)}
 */
export global CODEINTEGRITY_OPTION_ENABLED := 1

/**
 * @type {Integer (UInt32)}
 */
export global CODEINTEGRITY_OPTION_TESTSIGN := 2

/**
 * @type {Integer (UInt32)}
 */
export global CODEINTEGRITY_OPTION_UMCI_ENABLED := 4

/**
 * @type {Integer (UInt32)}
 */
export global CODEINTEGRITY_OPTION_UMCI_AUDITMODE_ENABLED := 8

/**
 * @type {Integer (UInt32)}
 */
export global CODEINTEGRITY_OPTION_UMCI_EXCLUSIONPATHS_ENABLED := 16

/**
 * @type {Integer (UInt32)}
 */
export global CODEINTEGRITY_OPTION_TEST_BUILD := 32

/**
 * @type {Integer (UInt32)}
 */
export global CODEINTEGRITY_OPTION_PREPRODUCTION_BUILD := 64

/**
 * @type {Integer (UInt32)}
 */
export global CODEINTEGRITY_OPTION_DEBUGMODE_ENABLED := 128

/**
 * @type {Integer (UInt32)}
 */
export global CODEINTEGRITY_OPTION_FLIGHT_BUILD := 256

/**
 * @type {Integer (UInt32)}
 */
export global CODEINTEGRITY_OPTION_FLIGHTING_ENABLED := 512

/**
 * @type {Integer (UInt32)}
 */
export global CODEINTEGRITY_OPTION_HVCI_KMCI_ENABLED := 1024

/**
 * @type {Integer (UInt32)}
 */
export global CODEINTEGRITY_OPTION_HVCI_KMCI_AUDITMODE_ENABLED := 2048

/**
 * @type {Integer (UInt32)}
 */
export global CODEINTEGRITY_OPTION_HVCI_KMCI_STRICTMODE_ENABLED := 4096

/**
 * @type {Integer (UInt32)}
 */
export global CODEINTEGRITY_OPTION_HVCI_IUM_ENABLED := 8192

/**
 * @type {Integer (UInt32)}
 */
export global FILE_MAXIMUM_DISPOSITION := 5

/**
 * @type {Integer (UInt32)}
 */
export global FILE_OPEN_REMOTE_INSTANCE := 1024

/**
 * @type {Integer (UInt32)}
 */
export global FILE_NO_COMPRESSION := 32768

/**
 * @type {Integer (UInt32)}
 */
export global FILE_OPEN_NO_RECALL := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global FILE_VALID_OPTION_FLAGS := 16777215

/**
 * @type {Integer (UInt32)}
 */
export global FILE_VALID_PIPE_OPTION_FLAGS := 50

/**
 * @type {Integer (UInt32)}
 */
export global FILE_VALID_MAILSLOT_OPTION_FLAGS := 50

/**
 * @type {Integer (UInt32)}
 */
export global FILE_VALID_SET_FLAGS := 54

/**
 * @type {Integer (UInt32)}
 */
export global FILE_SUPERSEDED := 0

/**
 * @type {Integer (UInt32)}
 */
export global FILE_OPENED := 1

/**
 * @type {Integer (UInt32)}
 */
export global FILE_CREATED := 2

/**
 * @type {Integer (UInt32)}
 */
export global FILE_OVERWRITTEN := 3

/**
 * @type {Integer (UInt32)}
 */
export global FILE_EXISTS := 4

/**
 * @type {Integer (UInt32)}
 */
export global FILE_DOES_NOT_EXIST := 5

/**
 * @type {Integer (UInt32)}
 */
export global WINWATCHNOTIFY_START := 0

/**
 * @type {Integer (UInt32)}
 */
export global WINWATCHNOTIFY_STOP := 1

/**
 * @type {Integer (UInt32)}
 */
export global WINWATCHNOTIFY_DESTROY := 2

/**
 * @type {Integer (UInt32)}
 */
export global WINWATCHNOTIFY_CHANGING := 3

/**
 * @type {Integer (UInt32)}
 */
export global WINWATCHNOTIFY_CHANGED := 4

/**
 * @type {Integer (UInt32)}
 */
export global RSC_FLAG_INF := 1

/**
 * @type {Integer (UInt32)}
 */
export global RSC_FLAG_SKIPDISKSPACECHECK := 2

/**
 * @type {Integer (UInt32)}
 */
export global RSC_FLAG_QUIET := 4

/**
 * @type {Integer (UInt32)}
 */
export global RSC_FLAG_NGCONV := 8

/**
 * @type {Integer (UInt32)}
 */
export global RSC_FLAG_UPDHLPDLLS := 16

/**
 * @type {Integer (UInt32)}
 */
export global RSC_FLAG_DELAYREGISTEROCX := 512

/**
 * @type {Integer (UInt32)}
 */
export global RSC_FLAG_SETUPAPI := 1024

/**
 * @type {Integer (UInt32)}
 */
export global ALINF_QUIET := 4

/**
 * @type {Integer (UInt32)}
 */
export global ALINF_NGCONV := 8

/**
 * @type {Integer (UInt32)}
 */
export global ALINF_UPDHLPDLLS := 16

/**
 * @type {Integer (UInt32)}
 */
export global ALINF_BKINSTALL := 32

/**
 * @type {Integer (UInt32)}
 */
export global ALINF_ROLLBACK := 64

/**
 * @type {Integer (UInt32)}
 */
export global ALINF_CHECKBKDATA := 128

/**
 * @type {Integer (UInt32)}
 */
export global ALINF_ROLLBKDOALL := 256

/**
 * @type {Integer (UInt32)}
 */
export global ALINF_DELAYREGISTEROCX := 512

/**
 * @type {Integer (UInt32)}
 */
export global AIF_WARNIFSKIP := 1

/**
 * @type {Integer (UInt32)}
 */
export global AIF_NOSKIP := 2

/**
 * @type {Integer (UInt32)}
 */
export global AIF_NOVERSIONCHECK := 4

/**
 * @type {Integer (UInt32)}
 */
export global AIF_FORCE_FILE_IN_USE := 8

/**
 * @type {Integer (UInt32)}
 */
export global AIF_NOOVERWRITE := 16

/**
 * @type {Integer (UInt32)}
 */
export global AIF_NO_VERSION_DIALOG := 32

/**
 * @type {Integer (UInt32)}
 */
export global AIF_REPLACEONLY := 1024

/**
 * @type {Integer (UInt32)}
 */
export global AIF_NOLANGUAGECHECK := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global AIF_QUIET := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global IE4_RESTORE := 1

/**
 * @type {Integer (UInt32)}
 */
export global IE4_BACKNEW := 2

/**
 * @type {Integer (UInt32)}
 */
export global IE4_NODELETENEW := 4

/**
 * @type {Integer (UInt32)}
 */
export global IE4_NOMESSAGES := 8

/**
 * @type {Integer (UInt32)}
 */
export global IE4_NOPROGRESS := 16

/**
 * @type {Integer (UInt32)}
 */
export global IE4_NOENUMKEY := 32

/**
 * @type {Integer (UInt32)}
 */
export global IE4_NO_CRC_MAPPING := 64

/**
 * @type {Integer (UInt32)}
 */
export global IE4_REGSECTION := 128

/**
 * @type {Integer (UInt32)}
 */
export global IE4_FRDOALL := 256

/**
 * @type {Integer (UInt32)}
 */
export global IE4_UPDREFCNT := 512

/**
 * @type {Integer (UInt32)}
 */
export global IE4_USEREFCNT := 1024

/**
 * @type {Integer (UInt32)}
 */
export global IE4_EXTRAINCREFCNT := 2048

/**
 * @type {Integer (UInt32)}
 */
export global IE4_REMOVREGBKDATA := 4096

/**
 * @type {Integer (UInt32)}
 */
export global ARSR_RESTORE := 1

/**
 * @type {Integer (UInt32)}
 */
export global ARSR_NOMESSAGES := 8

/**
 * @type {Integer (UInt32)}
 */
export global ARSR_REGSECTION := 128

/**
 * @type {Integer (UInt32)}
 */
export global ARSR_REMOVREGBKDATA := 4096

/**
 * @type {String}
 */
export global REG_SAVE_LOG_KEY := "RegSaveLogFile"

/**
 * @type {String}
 */
export global REG_RESTORE_LOG_KEY := "RegRestoreLogFile"

/**
 * @type {Integer (UInt32)}
 */
export global AFSR_RESTORE := 1

/**
 * @type {Integer (UInt32)}
 */
export global AFSR_BACKNEW := 2

/**
 * @type {Integer (UInt32)}
 */
export global AFSR_NODELETENEW := 4

/**
 * @type {Integer (UInt32)}
 */
export global AFSR_NOMESSAGES := 8

/**
 * @type {Integer (UInt32)}
 */
export global AFSR_NOPROGRESS := 16

/**
 * @type {Integer (UInt32)}
 */
export global AFSR_UPDREFCNT := 512

/**
 * @type {Integer (UInt32)}
 */
export global AFSR_USEREFCNT := 1024

/**
 * @type {Integer (UInt32)}
 */
export global AFSR_EXTRAINCREFCNT := 2048

/**
 * @type {Integer (UInt32)}
 */
export global AADBE_ADD_ENTRY := 1

/**
 * @type {Integer (UInt32)}
 */
export global AADBE_DEL_ENTRY := 2

/**
 * @type {Integer (UInt32)}
 */
export global ADN_DEL_IF_EMPTY := 1

/**
 * @type {Integer (UInt32)}
 */
export global ADN_DONT_DEL_SUBDIRS := 2

/**
 * @type {Integer (UInt32)}
 */
export global ADN_DONT_DEL_DIR := 4

/**
 * @type {Integer (UInt32)}
 */
export global ADN_DEL_UNC_PATHS := 8

/**
 * @type {Integer (UInt32)}
 */
export global LIS_QUIET := 1

/**
 * @type {Integer (UInt32)}
 */
export global LIS_NOGRPCONV := 2

/**
 * @type {Integer (UInt32)}
 */
export global RUNCMDS_QUIET := 1

/**
 * @type {Integer (UInt32)}
 */
export global RUNCMDS_NOWAIT := 2

/**
 * @type {Integer (UInt32)}
 */
export global RUNCMDS_DELAYPOSTCMD := 4

/**
 * @type {Integer (UInt32)}
 */
export global IME_MAXPROCESS := 32

/**
 * @type {Integer (UInt32)}
 */
export global CP_HWND := 0

/**
 * @type {Integer (UInt32)}
 */
export global CP_OPEN := 1

/**
 * @type {Integer (UInt32)}
 */
export global CP_DIRECT := 2

/**
 * @type {Integer (UInt32)}
 */
export global CP_LEVEL := 3

/**
 * @type {Integer (UInt32)}
 */
export global MCW_DEFAULT := 0

/**
 * @type {Integer (UInt32)}
 */
export global MCW_RECT := 1

/**
 * @type {Integer (UInt32)}
 */
export global MCW_WINDOW := 2

/**
 * @type {Integer (UInt32)}
 */
export global MCW_SCREEN := 4

/**
 * @type {Integer (UInt32)}
 */
export global MCW_VERTICAL := 8

/**
 * @type {Integer (UInt32)}
 */
export global MCW_HIDDEN := 16

/**
 * @type {Integer (UInt32)}
 */
export global IME_MODE_ALPHANUMERIC := 1

/**
 * @type {Integer (UInt32)}
 */
export global IME_MODE_SBCSCHAR := 2

/**
 * @type {Integer (UInt32)}
 */
export global IME_MODE_KATAKANA := 2

/**
 * @type {Integer (UInt32)}
 */
export global IME_MODE_HIRAGANA := 4

/**
 * @type {Integer (UInt32)}
 */
export global IME_MODE_HANJACONVERT := 4

/**
 * @type {Integer (UInt32)}
 */
export global IME_MODE_DBCSCHAR := 16

/**
 * @type {Integer (UInt32)}
 */
export global IME_MODE_ROMAN := 32

/**
 * @type {Integer (UInt32)}
 */
export global IME_MODE_NOROMAN := 64

/**
 * @type {Integer (UInt32)}
 */
export global IME_MODE_CODEINPUT := 128

/**
 * @type {Integer (UInt32)}
 */
export global IME_MODE_NOCODEINPUT := 256

/**
 * @type {Integer (UInt32)}
 */
export global IME_GETIMECAPS := 3

/**
 * @type {Integer (UInt32)}
 */
export global IME_SETOPEN := 4

/**
 * @type {Integer (UInt32)}
 */
export global IME_GETOPEN := 5

/**
 * @type {Integer (UInt32)}
 */
export global IME_GETVERSION := 7

/**
 * @type {Integer (UInt32)}
 */
export global IME_SETCONVERSIONWINDOW := 8

/**
 * @type {Integer (UInt32)}
 */
export global IME_MOVEIMEWINDOW := 8

/**
 * @type {Integer (UInt32)}
 */
export global IME_SETCONVERSIONMODE := 16

/**
 * @type {Integer (UInt32)}
 */
export global IME_GETCONVERSIONMODE := 17

/**
 * @type {Integer (UInt32)}
 */
export global IME_SET_MODE := 18

/**
 * @type {Integer (UInt32)}
 */
export global IME_SENDVKEY := 19

/**
 * @type {Integer (UInt32)}
 */
export global IME_ENTERWORDREGISTERMODE := 24

/**
 * @type {Integer (UInt32)}
 */
export global IME_SETCONVERSIONFONTEX := 25

/**
 * @type {Integer (UInt32)}
 */
export global IME_BANJAtoJUNJA := 19

/**
 * @type {Integer (UInt32)}
 */
export global IME_JUNJAtoBANJA := 20

/**
 * @type {Integer (UInt32)}
 */
export global IME_JOHABtoKS := 21

/**
 * @type {Integer (UInt32)}
 */
export global IME_KStoJOHAB := 22

/**
 * @type {Integer (UInt32)}
 */
export global IMEA_INIT := 1

/**
 * @type {Integer (UInt32)}
 */
export global IMEA_NEXT := 2

/**
 * @type {Integer (UInt32)}
 */
export global IMEA_PREV := 3

/**
 * @type {Integer (UInt32)}
 */
export global IME_REQUEST_CONVERT := 1

/**
 * @type {Integer (UInt32)}
 */
export global IME_ENABLE_CONVERT := 2

/**
 * @type {Integer (UInt32)}
 */
export global INTERIM_WINDOW := 0

/**
 * @type {Integer (UInt32)}
 */
export global MODE_WINDOW := 1

/**
 * @type {Integer (UInt32)}
 */
export global HANJA_WINDOW := 2

/**
 * @type {Integer (UInt32)}
 */
export global IME_RS_ERROR := 1

/**
 * @type {Integer (UInt32)}
 */
export global IME_RS_NOIME := 2

/**
 * @type {Integer (UInt32)}
 */
export global IME_RS_TOOLONG := 5

/**
 * @type {Integer (UInt32)}
 */
export global IME_RS_ILLEGAL := 6

/**
 * @type {Integer (UInt32)}
 */
export global IME_RS_NOTFOUND := 7

/**
 * @type {Integer (UInt32)}
 */
export global IME_RS_NOROOM := 10

/**
 * @type {Integer (UInt32)}
 */
export global IME_RS_DISKERROR := 14

/**
 * @type {Integer (UInt32)}
 */
export global IME_RS_INVALID := 17

/**
 * @type {Integer (UInt32)}
 */
export global IME_RS_NEST := 18

/**
 * @type {Integer (UInt32)}
 */
export global IME_RS_SYSTEMMODAL := 19

/**
 * @type {Integer (UInt32)}
 */
export global WM_IME_REPORT := 640

/**
 * @type {Integer (UInt32)}
 */
export global IR_STRINGSTART := 256

/**
 * @type {Integer (UInt32)}
 */
export global IR_STRINGEND := 257

/**
 * @type {Integer (UInt32)}
 */
export global IR_OPENCONVERT := 288

/**
 * @type {Integer (UInt32)}
 */
export global IR_CHANGECONVERT := 289

/**
 * @type {Integer (UInt32)}
 */
export global IR_CLOSECONVERT := 290

/**
 * @type {Integer (UInt32)}
 */
export global IR_FULLCONVERT := 291

/**
 * @type {Integer (UInt32)}
 */
export global IR_IMESELECT := 304

/**
 * @type {Integer (UInt32)}
 */
export global IR_STRING := 320

/**
 * @type {Integer (UInt32)}
 */
export global IR_DBCSCHAR := 352

/**
 * @type {Integer (UInt32)}
 */
export global IR_UNDETERMINE := 368

/**
 * @type {Integer (UInt32)}
 */
export global IR_STRINGEX := 384

/**
 * @type {Integer (UInt32)}
 */
export global IR_MODEINFO := 400

/**
 * @type {Integer (UInt32)}
 */
export global WM_WNT_CONVERTREQUESTEX := 265

/**
 * @type {Integer (UInt32)}
 */
export global WM_CONVERTREQUEST := 266

/**
 * @type {Integer (UInt32)}
 */
export global WM_CONVERTRESULT := 267

/**
 * @type {Integer (UInt32)}
 */
export global WM_INTERIM := 268

/**
 * @type {Integer (UInt32)}
 */
export global WM_IMEKEYDOWN := 656

/**
 * @type {Integer (UInt32)}
 */
export global WM_IMEKEYUP := 657

/**
 * @type {Integer (UInt32)}
 */
export global DELAYLOAD_GPA_FAILURE := 4

/**
 * @type {Guid}
 */
export global CATID_DeleteBrowsingHistory := Guid("{31caf6e4-d6aa-4090-a050-a5ac8972e9ef}")

/**
 * @type {Integer (UInt32)}
 */
export global DELETE_BROWSING_HISTORY_HISTORY := 1

/**
 * @type {Integer (UInt32)}
 */
export global DELETE_BROWSING_HISTORY_COOKIES := 2

/**
 * @type {Integer (UInt32)}
 */
export global DELETE_BROWSING_HISTORY_TIF := 4

/**
 * @type {Integer (UInt32)}
 */
export global DELETE_BROWSING_HISTORY_FORMDATA := 8

/**
 * @type {Integer (UInt32)}
 */
export global DELETE_BROWSING_HISTORY_PASSWORDS := 16

/**
 * @type {Integer (UInt32)}
 */
export global DELETE_BROWSING_HISTORY_PRESERVEFAVORITES := 32

/**
 * @type {Integer (UInt32)}
 */
export global DELETE_BROWSING_HISTORY_DOWNLOADHISTORY := 64

/**
 * @type {Guid}
 */
export global WLDP_HOST_CMD := Guid("{5baea1d6-6f1c-488e-8490-347fa5c5067f}")

/**
 * @type {Guid}
 */
export global WLDP_HOST_POWERSHELL := Guid("{8e9aaa7c-198b-4879-ae41-a50d47ad6458}")

/**
 * @type {Guid}
 */
export global WLDP_HOST_PYTHON := Guid("{bfd557ef-2448-42ec-810b-0d9f09352d4a}")

/**
 * @type {Guid}
 */
export global WLDP_HOST_WINDOWS_SCRIPT_HOST := Guid("{d30b84c5-29ce-4ff3-86ec-a30007a82e49}")

/**
 * @type {Guid}
 */
export global WLDP_HOST_JAVASCRIPT := Guid("{5629f0d5-1cca-4fed-a1a3-36a8c18d74c0}")

/**
 * @type {Guid}
 */
export global WLDP_HOST_HTML := Guid("{b35a71b6-fe56-48d6-9543-2dff0ecded66}")

/**
 * @type {Guid}
 */
export global WLDP_HOST_XML := Guid("{5594be58-c6bf-4295-82f4-d494d20e3a36}")

/**
 * @type {Guid}
 */
export global WLDP_HOST_MSI := Guid("{624eb611-6e7e-4eec-9bfe-f0ecdbfcf390}")

/**
 * @type {Guid}
 */
export global WLDP_HOST_OTHER := Guid("{626cbec3-e1fa-4227-9800-ed210274cf7c}")
;@endregion Constants
