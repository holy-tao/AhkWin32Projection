#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class OLECMDID_REFRESHFLAG extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static OLECMDIDF_REFRESH_NORMAL => 0

    /**
     * @type {Integer (Int32)}
     */
    static OLECMDIDF_REFRESH_IFEXPIRED => 1

    /**
     * @type {Integer (Int32)}
     */
    static OLECMDIDF_REFRESH_CONTINUE => 2

    /**
     * @type {Integer (Int32)}
     */
    static OLECMDIDF_REFRESH_COMPLETELY => 3

    /**
     * @type {Integer (Int32)}
     */
    static OLECMDIDF_REFRESH_NO_CACHE => 4

    /**
     * @type {Integer (Int32)}
     */
    static OLECMDIDF_REFRESH_RELOAD => 5

    /**
     * @type {Integer (Int32)}
     */
    static OLECMDIDF_REFRESH_LEVELMASK => 255

    /**
     * @type {Integer (Int32)}
     */
    static OLECMDIDF_REFRESH_CLEARUSERINPUT => 4096

    /**
     * @type {Integer (Int32)}
     */
    static OLECMDIDF_REFRESH_PROMPTIFOFFLINE => 8192

    /**
     * @type {Integer (Int32)}
     */
    static OLECMDIDF_REFRESH_THROUGHSCRIPT => 16384

    /**
     * @type {Integer (Int32)}
     */
    static OLECMDIDF_REFRESH_SKIPBEFOREUNLOADEVENT => 32768

    /**
     * @type {Integer (Int32)}
     */
    static OLECMDIDF_REFRESH_PAGEACTION_ACTIVEXINSTALL => 65536

    /**
     * @type {Integer (Int32)}
     */
    static OLECMDIDF_REFRESH_PAGEACTION_FILEDOWNLOAD => 131072

    /**
     * @type {Integer (Int32)}
     */
    static OLECMDIDF_REFRESH_PAGEACTION_LOCALMACHINE => 262144

    /**
     * @type {Integer (Int32)}
     */
    static OLECMDIDF_REFRESH_PAGEACTION_POPUPWINDOW => 524288

    /**
     * @type {Integer (Int32)}
     */
    static OLECMDIDF_REFRESH_PAGEACTION_PROTLOCKDOWNLOCALMACHINE => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static OLECMDIDF_REFRESH_PAGEACTION_PROTLOCKDOWNTRUSTED => 2097152

    /**
     * @type {Integer (Int32)}
     */
    static OLECMDIDF_REFRESH_PAGEACTION_PROTLOCKDOWNINTRANET => 4194304

    /**
     * @type {Integer (Int32)}
     */
    static OLECMDIDF_REFRESH_PAGEACTION_PROTLOCKDOWNINTERNET => 8388608

    /**
     * @type {Integer (Int32)}
     */
    static OLECMDIDF_REFRESH_PAGEACTION_PROTLOCKDOWNRESTRICTED => 16777216

    /**
     * @type {Integer (Int32)}
     */
    static OLECMDIDF_REFRESH_PAGEACTION_MIXEDCONTENT => 33554432

    /**
     * @type {Integer (Int32)}
     */
    static OLECMDIDF_REFRESH_PAGEACTION_INVALID_CERT => 67108864

    /**
     * @type {Integer (Int32)}
     */
    static OLECMDIDF_REFRESH_PAGEACTION_ALLOW_VERSION => 134217728
}
