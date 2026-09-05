#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
class PAGING_MODE extends Win32Enum {

    /**
     * Native name: Paging_Invalid
     * @type {Integer (Int32)}
     */
    static Invalid => 0

    /**
     * Native name: Paging_NonPaged
     * @type {Integer (Int32)}
     */
    static NonPaged => 1

    /**
     * Native name: Paging_32Bit
     * @type {Integer (Int32)}
     */
    static 32Bit => 2

    /**
     * Native name: Paging_Pae
     * @type {Integer (Int32)}
     */
    static Pae => 3

    /**
     * Native name: Paging_Long
     * @type {Integer (Int32)}
     */
    static Long => 4

    /**
     * Native name: Paging_Armv8
     * @type {Integer (Int32)}
     */
    static Armv8 => 5
}
