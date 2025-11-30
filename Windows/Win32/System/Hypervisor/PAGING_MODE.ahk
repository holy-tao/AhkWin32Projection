#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @version v4.0.30319
 */
class PAGING_MODE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static Paging_Invalid => 0

    /**
     * @type {Integer (Int32)}
     */
    static Paging_NonPaged => 1

    /**
     * @type {Integer (Int32)}
     */
    static Paging_32Bit => 2

    /**
     * @type {Integer (Int32)}
     */
    static Paging_Pae => 3

    /**
     * @type {Integer (Int32)}
     */
    static Paging_Long => 4

    /**
     * @type {Integer (Int32)}
     */
    static Paging_Armv8 => 5
}
