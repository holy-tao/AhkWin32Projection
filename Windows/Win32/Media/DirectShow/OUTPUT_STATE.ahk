#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class OUTPUT_STATE extends Win32BitflagEnum{

    /**
     * @type {Integer (Int32)}
     */
    static Disabled => 0

    /**
     * @type {Integer (Int32)}
     */
    static ReadData => 1

    /**
     * @type {Integer (Int32)}
     */
    static RenderData => 2
}
