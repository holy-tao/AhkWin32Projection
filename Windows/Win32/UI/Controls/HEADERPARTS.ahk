#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class HEADERPARTS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static HP_HEADERITEM => 1

    /**
     * @type {Integer (Int32)}
     */
    static HP_HEADERITEMLEFT => 2

    /**
     * @type {Integer (Int32)}
     */
    static HP_HEADERITEMRIGHT => 3

    /**
     * @type {Integer (Int32)}
     */
    static HP_HEADERSORTARROW => 4

    /**
     * @type {Integer (Int32)}
     */
    static HP_HEADERDROPDOWN => 5

    /**
     * @type {Integer (Int32)}
     */
    static HP_HEADERDROPDOWNFILTER => 6

    /**
     * @type {Integer (Int32)}
     */
    static HP_HEADEROVERFLOW => 7
}
