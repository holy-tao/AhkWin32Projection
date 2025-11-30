#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class OLECMDID_PAGEACTIONFLAG extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static OLECMDIDF_PAGEACTION_FILEDOWNLOAD => 1

    /**
     * @type {Integer (Int32)}
     */
    static OLECMDIDF_PAGEACTION_ACTIVEXINSTALL => 2

    /**
     * @type {Integer (Int32)}
     */
    static OLECMDIDF_PAGEACTION_ACTIVEXTRUSTFAIL => 4

    /**
     * @type {Integer (Int32)}
     */
    static OLECMDIDF_PAGEACTION_ACTIVEXUSERDISABLE => 8

    /**
     * @type {Integer (Int32)}
     */
    static OLECMDIDF_PAGEACTION_ACTIVEXDISALLOW => 16

    /**
     * @type {Integer (Int32)}
     */
    static OLECMDIDF_PAGEACTION_ACTIVEXUNSAFE => 32

    /**
     * @type {Integer (Int32)}
     */
    static OLECMDIDF_PAGEACTION_POPUPWINDOW => 64

    /**
     * @type {Integer (Int32)}
     */
    static OLECMDIDF_PAGEACTION_LOCALMACHINE => 128

    /**
     * @type {Integer (Int32)}
     */
    static OLECMDIDF_PAGEACTION_MIMETEXTPLAIN => 256

    /**
     * @type {Integer (Int32)}
     */
    static OLECMDIDF_PAGEACTION_SCRIPTNAVIGATE => 512

    /**
     * @type {Integer (Int32)}
     */
    static OLECMDIDF_PAGEACTION_SCRIPTNAVIGATE_ACTIVEXINSTALL => 512

    /**
     * @type {Integer (Int32)}
     */
    static OLECMDIDF_PAGEACTION_PROTLOCKDOWNLOCALMACHINE => 1024

    /**
     * @type {Integer (Int32)}
     */
    static OLECMDIDF_PAGEACTION_PROTLOCKDOWNTRUSTED => 2048

    /**
     * @type {Integer (Int32)}
     */
    static OLECMDIDF_PAGEACTION_PROTLOCKDOWNINTRANET => 4096

    /**
     * @type {Integer (Int32)}
     */
    static OLECMDIDF_PAGEACTION_PROTLOCKDOWNINTERNET => 8192

    /**
     * @type {Integer (Int32)}
     */
    static OLECMDIDF_PAGEACTION_PROTLOCKDOWNRESTRICTED => 16384

    /**
     * @type {Integer (Int32)}
     */
    static OLECMDIDF_PAGEACTION_PROTLOCKDOWNDENY => 32768

    /**
     * @type {Integer (Int32)}
     */
    static OLECMDIDF_PAGEACTION_POPUPALLOWED => 65536

    /**
     * @type {Integer (Int32)}
     */
    static OLECMDIDF_PAGEACTION_SCRIPTPROMPT => 131072

    /**
     * @type {Integer (Int32)}
     */
    static OLECMDIDF_PAGEACTION_ACTIVEXUSERAPPROVAL => 262144

    /**
     * @type {Integer (Int32)}
     */
    static OLECMDIDF_PAGEACTION_MIXEDCONTENT => 524288

    /**
     * @type {Integer (Int32)}
     */
    static OLECMDIDF_PAGEACTION_INVALID_CERT => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static OLECMDIDF_PAGEACTION_INTRANETZONEREQUEST => 2097152

    /**
     * @type {Integer (Int32)}
     */
    static OLECMDIDF_PAGEACTION_XSSFILTERED => 4194304

    /**
     * @type {Integer (Int32)}
     */
    static OLECMDIDF_PAGEACTION_SPOOFABLEIDNHOST => 8388608

    /**
     * @type {Integer (Int32)}
     */
    static OLECMDIDF_PAGEACTION_ACTIVEX_EPM_INCOMPATIBLE => 16777216

    /**
     * @type {Integer (Int32)}
     */
    static OLECMDIDF_PAGEACTION_SCRIPTNAVIGATE_ACTIVEXUSERAPPROVAL => 33554432

    /**
     * @type {Integer (Int32)}
     */
    static OLECMDIDF_PAGEACTION_WPCBLOCKED => 67108864

    /**
     * @type {Integer (Int32)}
     */
    static OLECMDIDF_PAGEACTION_WPCBLOCKED_ACTIVEX => 134217728

    /**
     * @type {Integer (Int32)}
     */
    static OLECMDIDF_PAGEACTION_EXTENSION_COMPAT_BLOCKED => 268435456

    /**
     * @type {Integer (Int32)}
     */
    static OLECMDIDF_PAGEACTION_NORESETACTIVEX => 536870912

    /**
     * @type {Integer (Int32)}
     */
    static OLECMDIDF_PAGEACTION_GENERIC_STATE => 1073741824

    /**
     * @type {Integer (Int32)}
     */
    static OLECMDIDF_PAGEACTION_RESET => -2147483648
}
