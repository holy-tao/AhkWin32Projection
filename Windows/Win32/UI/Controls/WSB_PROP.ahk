#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class WSB_PROP extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WSB_PROP_CXHSCROLL => 2

    /**
     * @type {Integer (Int32)}
     */
    static WSB_PROP_CXHTHUMB => 16

    /**
     * @type {Integer (Int32)}
     */
    static WSB_PROP_CXVSCROLL => 8

    /**
     * @type {Integer (Int32)}
     */
    static WSB_PROP_CYHSCROLL => 4

    /**
     * @type {Integer (Int32)}
     */
    static WSB_PROP_CYVSCROLL => 1

    /**
     * @type {Integer (Int32)}
     */
    static WSB_PROP_CYVTHUMB => 32

    /**
     * @type {Integer (Int32)}
     */
    static WSB_PROP_HBKGCOLOR => 128

    /**
     * @type {Integer (Int32)}
     */
    static WSB_PROP_HSTYLE => 512

    /**
     * @type {Integer (Int32)}
     */
    static WSB_PROP_PALETTE => 2048

    /**
     * @type {Integer (Int32)}
     */
    static WSB_PROP_VBKGCOLOR => 64

    /**
     * @type {Integer (Int32)}
     */
    static WSB_PROP_VSTYLE => 256

    /**
     * @type {Integer (Int32)}
     */
    static WSB_PROP_WINSTYLE => 1024
}
