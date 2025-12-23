#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class DESKBANDCID extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DBID_BANDINFOCHANGED => 0

    /**
     * @type {Integer (Int32)}
     */
    static DBID_SHOWONLY => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBID_MAXIMIZEBAND => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBID_PUSHCHEVRON => 3

    /**
     * @type {Integer (Int32)}
     */
    static DBID_DELAYINIT => 4

    /**
     * @type {Integer (Int32)}
     */
    static DBID_FINISHINIT => 5

    /**
     * @type {Integer (Int32)}
     */
    static DBID_SETWINDOWTHEME => 6

    /**
     * @type {Integer (Int32)}
     */
    static DBID_PERMITAUTOHIDE => 7
}
