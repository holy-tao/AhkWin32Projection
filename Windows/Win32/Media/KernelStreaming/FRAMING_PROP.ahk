#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class FRAMING_PROP extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static FramingProp_Uninitialized => 0

    /**
     * @type {Integer (Int32)}
     */
    static FramingProp_None => 1

    /**
     * @type {Integer (Int32)}
     */
    static FramingProp_Old => 2

    /**
     * @type {Integer (Int32)}
     */
    static FramingProp_Ex => 3
}
