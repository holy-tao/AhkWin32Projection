#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class OLEIVERB extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static OLEIVERB_PRIMARY => 0

    /**
     * @type {Integer (Int32)}
     */
    static OLEIVERB_SHOW => -1

    /**
     * @type {Integer (Int32)}
     */
    static OLEIVERB_OPEN => -2

    /**
     * @type {Integer (Int32)}
     */
    static OLEIVERB_HIDE => -3

    /**
     * @type {Integer (Int32)}
     */
    static OLEIVERB_UIACTIVATE => -4

    /**
     * @type {Integer (Int32)}
     */
    static OLEIVERB_INPLACEACTIVATE => -5

    /**
     * @type {Integer (Int32)}
     */
    static OLEIVERB_DISCARDUNDOSTATE => -6
}
