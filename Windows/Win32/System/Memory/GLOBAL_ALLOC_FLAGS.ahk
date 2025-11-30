#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Memory
 * @version v4.0.30319
 */
class GLOBAL_ALLOC_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static GHND => 66

    /**
     * @type {Integer (UInt32)}
     */
    static GMEM_FIXED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static GMEM_MOVEABLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static GMEM_ZEROINIT => 64

    /**
     * @type {Integer (UInt32)}
     */
    static GPTR => 64
}
