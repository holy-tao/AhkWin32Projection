#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class WMV_DYNAMIC_FLAGS extends Win32Enum {

    /**
     * Native name: WMV_DYNAMIC_BITRATE
     * @type {Integer (Int32)}
     */
    static BITRATE => 1

    /**
     * Native name: WMV_DYNAMIC_RESOLUTION
     * @type {Integer (Int32)}
     */
    static RESOLUTION => 2

    /**
     * Native name: WMV_DYNAMIC_COMPLEXITY
     * @type {Integer (Int32)}
     */
    static COMPLEXITY => 4
}
