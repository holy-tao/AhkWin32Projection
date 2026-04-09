#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Memory
 */
class PAGE_TYPE extends Win32BitflagEnum {

    /**
     * @type {Integer (UInt32)}
     */
    static MEM_PRIVATE => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static MEM_MAPPED => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static MEM_IMAGE => 16777216
}
