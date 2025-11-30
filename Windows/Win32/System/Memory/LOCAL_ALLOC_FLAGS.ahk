#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Memory
 * @version v4.0.30319
 */
class LOCAL_ALLOC_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static LHND => 66

    /**
     * @type {Integer (UInt32)}
     */
    static LMEM_FIXED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static LMEM_MOVEABLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LMEM_ZEROINIT => 64

    /**
     * @type {Integer (UInt32)}
     */
    static LPTR => 64

    /**
     * @type {Integer (UInt32)}
     */
    static NONZEROLHND => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NONZEROLPTR => 0
}
