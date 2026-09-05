#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 */
class WSB_PROP extends Win32Enum {

    /**
     * Native name: WSB_PROP_CXHSCROLL
     * @type {Integer (Int32)}
     */
    static CXHSCROLL => 2

    /**
     * Native name: WSB_PROP_CXHTHUMB
     * @type {Integer (Int32)}
     */
    static CXHTHUMB => 16

    /**
     * Native name: WSB_PROP_CXVSCROLL
     * @type {Integer (Int32)}
     */
    static CXVSCROLL => 8

    /**
     * Native name: WSB_PROP_CYHSCROLL
     * @type {Integer (Int32)}
     */
    static CYHSCROLL => 4

    /**
     * Native name: WSB_PROP_CYVSCROLL
     * @type {Integer (Int32)}
     */
    static CYVSCROLL => 1

    /**
     * Native name: WSB_PROP_CYVTHUMB
     * @type {Integer (Int32)}
     */
    static CYVTHUMB => 32

    /**
     * Native name: WSB_PROP_HBKGCOLOR
     * @type {Integer (Int32)}
     */
    static HBKGCOLOR => 128

    /**
     * Native name: WSB_PROP_HSTYLE
     * @type {Integer (Int32)}
     */
    static HSTYLE => 512

    /**
     * Native name: WSB_PROP_PALETTE
     * @type {Integer (Int32)}
     */
    static PALETTE => 2048

    /**
     * Native name: WSB_PROP_VBKGCOLOR
     * @type {Integer (Int32)}
     */
    static VBKGCOLOR => 64

    /**
     * Native name: WSB_PROP_VSTYLE
     * @type {Integer (Int32)}
     */
    static VSTYLE => 256

    /**
     * Native name: WSB_PROP_WINSTYLE
     * @type {Integer (Int32)}
     */
    static WINSTYLE => 1024
}
