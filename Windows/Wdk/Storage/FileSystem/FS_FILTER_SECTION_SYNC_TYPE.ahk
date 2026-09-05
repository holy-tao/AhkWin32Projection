#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
class FS_FILTER_SECTION_SYNC_TYPE extends Win32Enum {

    /**
     * Native name: SyncTypeOther
     * @type {Integer (Int32)}
     */
    static Other => 0

    /**
     * Native name: SyncTypeCreateSection
     * @type {Integer (Int32)}
     */
    static CreateSection => 1
}
