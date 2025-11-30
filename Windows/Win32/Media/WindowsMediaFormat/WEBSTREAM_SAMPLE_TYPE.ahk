#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class WEBSTREAM_SAMPLE_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WEBSTREAM_SAMPLE_TYPE_FILE => 1

    /**
     * @type {Integer (Int32)}
     */
    static WEBSTREAM_SAMPLE_TYPE_RENDER => 2
}
