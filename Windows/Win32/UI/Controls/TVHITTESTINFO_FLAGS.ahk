#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class TVHITTESTINFO_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static TVHT_ABOVE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static TVHT_BELOW => 512

    /**
     * @type {Integer (UInt32)}
     */
    static TVHT_NOWHERE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TVHT_ONITEM => 70

    /**
     * @type {Integer (UInt32)}
     */
    static TVHT_ONITEMBUTTON => 16

    /**
     * @type {Integer (UInt32)}
     */
    static TVHT_ONITEMICON => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TVHT_ONITEMINDENT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static TVHT_ONITEMLABEL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TVHT_ONITEMRIGHT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static TVHT_ONITEMSTATEICON => 64

    /**
     * @type {Integer (UInt32)}
     */
    static TVHT_TOLEFT => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static TVHT_TORIGHT => 1024
}
