#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
class RTL_MEMORY_TYPE extends Win32Enum {

    /**
     * Native name: MemoryTypePaged
     * @type {Integer (Int32)}
     */
    static Paged => 0

    /**
     * Native name: MemoryTypeNonPaged
     * @type {Integer (Int32)}
     */
    static NonPaged => 1

    /**
     * Native name: MemoryType64KPage
     * @type {Integer (Int32)}
     */
    static Type64KPage => 2

    /**
     * Native name: MemoryTypeLargePage
     * @type {Integer (Int32)}
     */
    static LargePage => 3

    /**
     * Native name: MemoryTypeHugePage
     * @type {Integer (Int32)}
     */
    static HugePage => 4

    /**
     * Native name: MemoryTypeCustom
     * @type {Integer (Int32)}
     */
    static Custom => 5

    /**
     * Native name: MemoryTypeMax
     * @type {Integer (Int32)}
     */
    static Max => 6
}
