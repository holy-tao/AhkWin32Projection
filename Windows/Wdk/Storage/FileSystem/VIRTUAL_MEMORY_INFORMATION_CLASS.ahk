#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
class VIRTUAL_MEMORY_INFORMATION_CLASS extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static VmPrefetchInformation => 0
}
