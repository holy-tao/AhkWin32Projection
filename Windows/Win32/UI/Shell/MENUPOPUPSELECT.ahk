#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class MENUPOPUPSELECT extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MPOS_EXECUTE => 0

    /**
     * @type {Integer (Int32)}
     */
    static MPOS_FULLCANCEL => 1

    /**
     * @type {Integer (Int32)}
     */
    static MPOS_CANCELLEVEL => 2

    /**
     * @type {Integer (Int32)}
     */
    static MPOS_SELECTLEFT => 3

    /**
     * @type {Integer (Int32)}
     */
    static MPOS_SELECTRIGHT => 4

    /**
     * @type {Integer (Int32)}
     */
    static MPOS_CHILDTRACKING => 5
}
