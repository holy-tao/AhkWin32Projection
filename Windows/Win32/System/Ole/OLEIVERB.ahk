#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ole
 */
class OLEIVERB extends Win32Enum {

    /**
     * Native name: OLEIVERB_PRIMARY
     * @type {Integer (Int32)}
     */
    static PRIMARY => 0

    /**
     * Native name: OLEIVERB_SHOW
     * @type {Integer (Int32)}
     */
    static SHOW => -1

    /**
     * Native name: OLEIVERB_OPEN
     * @type {Integer (Int32)}
     */
    static OPEN => -2

    /**
     * Native name: OLEIVERB_HIDE
     * @type {Integer (Int32)}
     */
    static HIDE => -3

    /**
     * Native name: OLEIVERB_UIACTIVATE
     * @type {Integer (Int32)}
     */
    static UIACTIVATE => -4

    /**
     * Native name: OLEIVERB_INPLACEACTIVATE
     * @type {Integer (Int32)}
     */
    static INPLACEACTIVATE => -5

    /**
     * Native name: OLEIVERB_DISCARDUNDOSTATE
     * @type {Integer (Int32)}
     */
    static DISCARDUNDOSTATE => -6
}
