#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * Basic information about an item.
 * @see https://learn.microsoft.com/windows/win32/api/projectedfslib/ns-projectedfslib-prj_file_basic_info
 * @namespace Windows.Win32.Storage.ProjectedFileSystem
 */
export default struct PRJ_FILE_BASIC_INFO {
    #StructPack 8

    /**
     * Specifies whether the item is a directory.
     */
    IsDirectory : BOOLEAN

    /**
     * Size of the item, in bytes.
     */
    FileSize : Int64

    /**
     * Creation time of the item.
     */
    CreationTime : Int64

    /**
     * Last time the item was accessed.
     */
    LastAccessTime : Int64

    /**
     * Last time the item was written to.
     */
    LastWriteTime : Int64

    /**
     * The last time the item was changed.
     */
    ChangeTime : Int64

    /**
     * Attributes of the item.
     */
    FileAttributes : UInt32

}
