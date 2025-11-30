#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class HEADER_HITTEST_INFO_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static HHT_NOWHERE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static HHT_ONHEADER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static HHT_ONDIVIDER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static HHT_ONDIVOPEN => 8

    /**
     * @type {Integer (UInt32)}
     */
    static HHT_ONFILTER => 16

    /**
     * @type {Integer (UInt32)}
     */
    static HHT_ONFILTERBUTTON => 32

    /**
     * @type {Integer (UInt32)}
     */
    static HHT_ABOVE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static HHT_BELOW => 512

    /**
     * @type {Integer (UInt32)}
     */
    static HHT_TORIGHT => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static HHT_TOLEFT => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static HHT_ONITEMSTATEICON => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static HHT_ONDROPDOWN => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static HHT_ONOVERFLOW => 16384
}
