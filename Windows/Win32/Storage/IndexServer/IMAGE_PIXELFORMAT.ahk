#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.IndexServer
 * @version v4.0.30319
 */
class IMAGE_PIXELFORMAT extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static FILTER_PIXELFORMAT_BGRA8 => 0

    /**
     * @type {Integer (Int32)}
     */
    static FILTER_PIXELFORMAT_PBGRA8 => 1

    /**
     * @type {Integer (Int32)}
     */
    static FILTER_PIXELFORMAT_BGR8 => 2
}
