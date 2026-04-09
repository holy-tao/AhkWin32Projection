#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 */
class OUTPUT_COLOR_ENCODING extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static OUTPUT_COLOR_ENCODING_RGB => 0

    /**
     * @type {Integer (Int32)}
     */
    static OUTPUT_COLOR_ENCODING_YCBCR444 => 1

    /**
     * @type {Integer (Int32)}
     */
    static OUTPUT_COLOR_ENCODING_YCBCR422 => 2

    /**
     * @type {Integer (Int32)}
     */
    static OUTPUT_COLOR_ENCODING_YCBCR420 => 3

    /**
     * @type {Integer (Int32)}
     */
    static OUTPUT_COLOR_ENCODING_INTENSITY => 4
}
