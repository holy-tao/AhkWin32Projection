#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class TXTNATURALSIZE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static TXTNS_FITTOCONTENT2 => 0

    /**
     * @type {Integer (Int32)}
     */
    static TXTNS_FITTOCONTENT => 1

    /**
     * @type {Integer (Int32)}
     */
    static TXTNS_ROUNDTOLINE => 2

    /**
     * @type {Integer (Int32)}
     */
    static TXTNS_FITTOCONTENT3 => 3

    /**
     * @type {Integer (Int32)}
     */
    static TXTNS_FITTOCONTENTWSP => 4

    /**
     * @type {Integer (Int32)}
     */
    static TXTNS_INCLUDELASTLINE => 1073741824

    /**
     * @type {Integer (Int32)}
     */
    static TXTNS_EMU => -2147483648
}
