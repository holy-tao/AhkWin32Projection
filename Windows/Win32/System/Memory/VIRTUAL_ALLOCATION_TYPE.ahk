#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Memory
 * @version v4.0.30319
 */
class VIRTUAL_ALLOCATION_TYPE extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static MEM_COMMIT => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static MEM_RESERVE => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static MEM_RESET => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static MEM_RESET_UNDO => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static MEM_REPLACE_PLACEHOLDER => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static MEM_LARGE_PAGES => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static MEM_RESERVE_PLACEHOLDER => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static MEM_FREE => 65536
}
