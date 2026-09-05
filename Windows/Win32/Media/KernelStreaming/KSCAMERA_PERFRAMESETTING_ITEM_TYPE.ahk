#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSCAMERA_PERFRAMESETTING_ITEM_TYPE extends Win32Enum {

    /**
     * Native name: KSCAMERA_PERFRAMESETTING_ITEM_EXPOSURE_TIME
     * @type {Integer (Int32)}
     */
    static EXPOSURE_TIME => 1

    /**
     * Native name: KSCAMERA_PERFRAMESETTING_ITEM_FLASH
     * @type {Integer (Int32)}
     */
    static FLASH => 2

    /**
     * Native name: KSCAMERA_PERFRAMESETTING_ITEM_EXPOSURE_COMPENSATION
     * @type {Integer (Int32)}
     */
    static EXPOSURE_COMPENSATION => 3

    /**
     * Native name: KSCAMERA_PERFRAMESETTING_ITEM_ISO
     * @type {Integer (Int32)}
     */
    static ISO => 4

    /**
     * Native name: KSCAMERA_PERFRAMESETTING_ITEM_FOCUS
     * @type {Integer (Int32)}
     */
    static FOCUS => 5

    /**
     * Native name: KSCAMERA_PERFRAMESETTING_ITEM_PHOTOCONFIRMATION
     * @type {Integer (Int32)}
     */
    static PHOTOCONFIRMATION => 6

    /**
     * Native name: KSCAMERA_PERFRAMESETTING_ITEM_CUSTOM
     * @type {Integer (Int32)}
     */
    static CUSTOM => 7
}
