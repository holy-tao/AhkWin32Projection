#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class WMV_DYNAMIC_FLAGS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WMV_DYNAMIC_BITRATE => 1

    /**
     * @type {Integer (Int32)}
     */
    static WMV_DYNAMIC_RESOLUTION => 2

    /**
     * @type {Integer (Int32)}
     */
    static WMV_DYNAMIC_COMPLEXITY => 4
}
