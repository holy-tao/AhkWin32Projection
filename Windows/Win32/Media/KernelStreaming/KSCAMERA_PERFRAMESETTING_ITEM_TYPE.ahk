#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSCAMERA_PERFRAMESETTING_ITEM_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static KSCAMERA_PERFRAMESETTING_ITEM_EXPOSURE_TIME => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSCAMERA_PERFRAMESETTING_ITEM_FLASH => 2

    /**
     * @type {Integer (Int32)}
     */
    static KSCAMERA_PERFRAMESETTING_ITEM_EXPOSURE_COMPENSATION => 3

    /**
     * @type {Integer (Int32)}
     */
    static KSCAMERA_PERFRAMESETTING_ITEM_ISO => 4

    /**
     * @type {Integer (Int32)}
     */
    static KSCAMERA_PERFRAMESETTING_ITEM_FOCUS => 5

    /**
     * @type {Integer (Int32)}
     */
    static KSCAMERA_PERFRAMESETTING_ITEM_PHOTOCONFIRMATION => 6

    /**
     * @type {Integer (Int32)}
     */
    static KSCAMERA_PERFRAMESETTING_ITEM_CUSTOM => 7
}
