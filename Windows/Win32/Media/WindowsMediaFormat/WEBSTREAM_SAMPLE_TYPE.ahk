#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
class WEBSTREAM_SAMPLE_TYPE extends Win32Enum {

    /**
     * Native name: WEBSTREAM_SAMPLE_TYPE_FILE
     * @type {Integer (Int32)}
     */
    static FILE => 1

    /**
     * Native name: WEBSTREAM_SAMPLE_TYPE_RENDER
     * @type {Integer (Int32)}
     */
    static RENDER => 2
}
