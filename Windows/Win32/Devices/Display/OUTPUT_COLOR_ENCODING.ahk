#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 */
class OUTPUT_COLOR_ENCODING extends Win32Enum {

    /**
     * Native name: OUTPUT_COLOR_ENCODING_RGB
     * @type {Integer (Int32)}
     */
    static RGB => 0

    /**
     * Native name: OUTPUT_COLOR_ENCODING_YCBCR444
     * @type {Integer (Int32)}
     */
    static YCBCR444 => 1

    /**
     * Native name: OUTPUT_COLOR_ENCODING_YCBCR422
     * @type {Integer (Int32)}
     */
    static YCBCR422 => 2

    /**
     * Native name: OUTPUT_COLOR_ENCODING_YCBCR420
     * @type {Integer (Int32)}
     */
    static YCBCR420 => 3

    /**
     * Native name: OUTPUT_COLOR_ENCODING_INTENSITY
     * @type {Integer (Int32)}
     */
    static INTENSITY => 4
}
