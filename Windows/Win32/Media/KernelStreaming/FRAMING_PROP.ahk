#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class FRAMING_PROP extends Win32Enum {

    /**
     * Native name: FramingProp_Uninitialized
     * @type {Integer (Int32)}
     */
    static Uninitialized => 0

    /**
     * Native name: FramingProp_None
     * @type {Integer (Int32)}
     */
    static None => 1

    /**
     * Native name: FramingProp_Old
     * @type {Integer (Int32)}
     */
    static Old => 2

    /**
     * Native name: FramingProp_Ex
     * @type {Integer (Int32)}
     */
    static Ex => 3
}
