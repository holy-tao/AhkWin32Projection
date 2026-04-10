#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
class MMFLUSH_TYPE extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static MmFlushForDelete => 0

    /**
     * @type {Integer (Int32)}
     */
    static MmFlushForWrite => 1
}
