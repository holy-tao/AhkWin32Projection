#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.ToolHelp
 * @version v4.0.30319
 */
class HEAPENTRY32_FLAGS extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static LF32_FIXED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LF32_FREE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LF32_MOVEABLE => 4
}
