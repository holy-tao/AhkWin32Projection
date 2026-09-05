#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
class HEAP_MEMORY_INFO_CLASS extends Win32Enum {

    /**
     * Native name: HeapMemoryBasicInformation
     * @type {Integer (Int32)}
     */
    static BasicInformation => 0
}
