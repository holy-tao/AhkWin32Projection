#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.UI.ColorSystem
 */

;@region Constants

/**
 * @type {Guid}
 */
export global CATID_WcsPlugin := Guid("{a0b402e0-8240-405f-8a16-8a5b4df2f0dd}")

/**
 * @type {Integer (UInt32)}
 */
export global MAX_COLOR_CHANNELS := 8

/**
 * @type {Integer (UInt32)}
 */
export global INTENT_PERCEPTUAL := 0

/**
 * @type {Integer (UInt32)}
 */
export global INTENT_RELATIVE_COLORIMETRIC := 1

/**
 * @type {Integer (UInt32)}
 */
export global INTENT_SATURATION := 2

/**
 * @type {Integer (UInt32)}
 */
export global INTENT_ABSOLUTE_COLORIMETRIC := 3

/**
 * @type {Integer (UInt32)}
 */
export global FLAG_EMBEDDEDPROFILE := 1

/**
 * @type {Integer (UInt32)}
 */
export global FLAG_DEPENDENTONDATA := 2

/**
 * @type {Integer (UInt32)}
 */
export global FLAG_ENABLE_CHROMATIC_ADAPTATION := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global ATTRIB_TRANSPARENCY := 1

/**
 * @type {Integer (UInt32)}
 */
export global ATTRIB_MATTE := 2

/**
 * @type {Integer (UInt32)}
 */
export global PROFILE_FILENAME := 1

/**
 * @type {Integer (UInt32)}
 */
export global PROFILE_MEMBUFFER := 2

/**
 * @type {Integer (UInt32)}
 */
export global PROFILE_READ := 1

/**
 * @type {Integer (UInt32)}
 */
export global PROFILE_READWRITE := 2

/**
 * @type {Integer (UInt32)}
 */
export global INDEX_DONT_CARE := 0

/**
 * @type {Integer (UInt32)}
 */
export global CMM_FROM_PROFILE := 0

/**
 * @type {Integer (UInt32)}
 */
export global ENUM_TYPE_VERSION := 768

/**
 * @type {Integer (UInt32)}
 */
export global ET_DEVICENAME := 1

/**
 * @type {Integer (UInt32)}
 */
export global ET_MEDIATYPE := 2

/**
 * @type {Integer (UInt32)}
 */
export global ET_DITHERMODE := 4

/**
 * @type {Integer (UInt32)}
 */
export global ET_RESOLUTION := 8

/**
 * @type {Integer (UInt32)}
 */
export global ET_CMMTYPE := 16

/**
 * @type {Integer (UInt32)}
 */
export global ET_CLASS := 32

/**
 * @type {Integer (UInt32)}
 */
export global ET_DATACOLORSPACE := 64

/**
 * @type {Integer (UInt32)}
 */
export global ET_CONNECTIONSPACE := 128

/**
 * @type {Integer (UInt32)}
 */
export global ET_SIGNATURE := 256

/**
 * @type {Integer (UInt32)}
 */
export global ET_PLATFORM := 512

/**
 * @type {Integer (UInt32)}
 */
export global ET_PROFILEFLAGS := 1024

/**
 * @type {Integer (UInt32)}
 */
export global ET_MANUFACTURER := 2048

/**
 * @type {Integer (UInt32)}
 */
export global ET_MODEL := 4096

/**
 * @type {Integer (UInt32)}
 */
export global ET_ATTRIBUTES := 8192

/**
 * @type {Integer (UInt32)}
 */
export global ET_RENDERINGINTENT := 16384

/**
 * @type {Integer (UInt32)}
 */
export global ET_CREATOR := 32768

/**
 * @type {Integer (UInt32)}
 */
export global ET_DEVICECLASS := 65536

/**
 * @type {Integer (UInt32)}
 */
export global ET_STANDARDDISPLAYCOLOR := 131072

/**
 * @type {Integer (UInt32)}
 */
export global ET_EXTENDEDDISPLAYCOLOR := 262144

/**
 * @type {Integer (UInt32)}
 */
export global PROOF_MODE := 1

/**
 * @type {Integer (UInt32)}
 */
export global NORMAL_MODE := 2

/**
 * @type {Integer (UInt32)}
 */
export global BEST_MODE := 3

/**
 * @type {Integer (UInt32)}
 */
export global ENABLE_GAMUT_CHECKING := 65536

/**
 * @type {Integer (UInt32)}
 */
export global USE_RELATIVE_COLORIMETRIC := 131072

/**
 * @type {Integer (UInt32)}
 */
export global FAST_TRANSLATE := 262144

/**
 * @type {Integer (UInt32)}
 */
export global PRESERVEBLACK := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global WCS_ALWAYS := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global SEQUENTIAL_TRANSFORM := 2155872256

/**
 * @type {Integer (UInt32)}
 */
export global RESERVED := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global CSA_A := 1

/**
 * @type {Integer (UInt32)}
 */
export global CSA_ABC := 2

/**
 * @type {Integer (UInt32)}
 */
export global CSA_DEF := 3

/**
 * @type {Integer (UInt32)}
 */
export global CSA_DEFG := 4

/**
 * @type {Integer (UInt32)}
 */
export global CSA_GRAY := 5

/**
 * @type {Integer (UInt32)}
 */
export global CSA_RGB := 6

/**
 * @type {Integer (UInt32)}
 */
export global CSA_CMYK := 7

/**
 * @type {Integer (UInt32)}
 */
export global CSA_Lab := 8

/**
 * @type {Integer (UInt32)}
 */
export global CMM_WIN_VERSION := 0

/**
 * @type {Integer (UInt32)}
 */
export global CMM_IDENT := 1

/**
 * @type {Integer (UInt32)}
 */
export global CMM_DRIVER_VERSION := 2

/**
 * @type {Integer (UInt32)}
 */
export global CMM_DLL_VERSION := 3

/**
 * @type {Integer (UInt32)}
 */
export global CMM_VERSION := 4

/**
 * @type {Integer (UInt32)}
 */
export global CMM_DESCRIPTION := 5

/**
 * @type {Integer (UInt32)}
 */
export global CMM_LOGOICON := 6

/**
 * @type {Integer (UInt32)}
 */
export global CMS_FORWARD := 0

/**
 * @type {Integer (UInt32)}
 */
export global CMS_BACKWARD := 1

/**
 * @type {Integer (UInt32)}
 */
export global COLOR_MATCH_VERSION := 512

/**
 * @type {Integer (UInt32)}
 */
export global CMS_DISABLEICM := 1

/**
 * @type {Integer (UInt32)}
 */
export global CMS_ENABLEPROOFING := 2

/**
 * @type {Integer (UInt32)}
 */
export global CMS_SETRENDERINTENT := 4

/**
 * @type {Integer (UInt32)}
 */
export global CMS_SETPROOFINTENT := 8

/**
 * @type {Integer (UInt32)}
 */
export global CMS_SETMONITORPROFILE := 16

/**
 * @type {Integer (UInt32)}
 */
export global CMS_SETPRINTERPROFILE := 32

/**
 * @type {Integer (UInt32)}
 */
export global CMS_SETTARGETPROFILE := 64

/**
 * @type {Integer (UInt32)}
 */
export global CMS_USEHOOK := 128

/**
 * @type {Integer (UInt32)}
 */
export global CMS_USEAPPLYCALLBACK := 256

/**
 * @type {Integer (UInt32)}
 */
export global CMS_USEDESCRIPTION := 512

/**
 * @type {Integer (UInt32)}
 */
export global CMS_DISABLEINTENT := 1024

/**
 * @type {Integer (UInt32)}
 */
export global CMS_DISABLERENDERINTENT := 2048

/**
 * @type {Integer (Int32)}
 */
export global CMS_MONITOROVERFLOW := -2147483648

/**
 * @type {Integer (Int32)}
 */
export global CMS_PRINTEROVERFLOW := 1073741824

/**
 * @type {Integer (Int32)}
 */
export global CMS_TARGETOVERFLOW := 536870912

/**
 * @type {Integer (Int32)}
 */
export global DONT_USE_EMBEDDED_WCS_PROFILES := 1

/**
 * @type {Integer (Int32)}
 */
export global WCS_DEFAULT := 0

/**
 * @type {Integer (Int32)}
 */
export global WCS_ICCONLY := 65536
;@endregion Constants
