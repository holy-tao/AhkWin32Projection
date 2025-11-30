#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 * @version v4.0.30319
 */
class RTL_MEMORY_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MemoryTypePaged => 0

    /**
     * @type {Integer (Int32)}
     */
    static MemoryTypeNonPaged => 1

    /**
     * @type {Integer (Int32)}
     */
    static MemoryType64KPage => 2

    /**
     * @type {Integer (Int32)}
     */
    static MemoryTypeLargePage => 3

    /**
     * @type {Integer (Int32)}
     */
    static MemoryTypeHugePage => 4

    /**
     * @type {Integer (Int32)}
     */
    static MemoryTypeCustom => 5

    /**
     * @type {Integer (Int32)}
     */
    static MemoryTypeMax => 6
}
