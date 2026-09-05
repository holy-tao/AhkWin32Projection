#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSPROPERTY_OVERLAYUPDATE extends Win32Enum {

    /**
     * Native name: KSPROPERTY_OVERLAYUPDATE_INTERESTS
     * @type {Integer (Int32)}
     */
    static INTERESTS => 0

    /**
     * Native name: KSPROPERTY_OVERLAYUPDATE_CLIPLIST
     * @type {Integer (Int32)}
     */
    static CLIPLIST => 1

    /**
     * Native name: KSPROPERTY_OVERLAYUPDATE_PALETTE
     * @type {Integer (Int32)}
     */
    static PALETTE => 2

    /**
     * Native name: KSPROPERTY_OVERLAYUPDATE_COLORKEY
     * @type {Integer (Int32)}
     */
    static COLORKEY => 4

    /**
     * Native name: KSPROPERTY_OVERLAYUPDATE_VIDEOPOSITION
     * @type {Integer (Int32)}
     */
    static VIDEOPOSITION => 8

    /**
     * Native name: KSPROPERTY_OVERLAYUPDATE_DISPLAYCHANGE
     * @type {Integer (Int32)}
     */
    static DISPLAYCHANGE => 16

    /**
     * Native name: KSPROPERTY_OVERLAYUPDATE_COLORREF
     * @type {Integer (Int32)}
     */
    static COLORREF => 268435456
}
