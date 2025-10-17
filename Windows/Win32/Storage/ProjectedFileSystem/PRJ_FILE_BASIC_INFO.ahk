#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Basic information about an item.
 * @see https://docs.microsoft.com/windows/win32/api//projectedfslib/ns-projectedfslib-prj_file_basic_info
 * @namespace Windows.Win32.Storage.ProjectedFileSystem
 * @version v4.0.30319
 */
class PRJ_FILE_BASIC_INFO extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * Specifies whether the item is a directory.
     * @type {BOOLEAN}
     */
    IsDirectory {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * Size of the item, in bytes.
     * @type {Integer}
     */
    FileSize {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * Creation time of the item.
     * @type {Integer}
     */
    CreationTime {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }

    /**
     * Last time the item was accessed.
     * @type {Integer}
     */
    LastAccessTime {
        get => NumGet(this, 24, "int64")
        set => NumPut("int64", value, this, 24)
    }

    /**
     * Last time the item was written to.
     * @type {Integer}
     */
    LastWriteTime {
        get => NumGet(this, 32, "int64")
        set => NumPut("int64", value, this, 32)
    }

    /**
     * The last time the item was changed.
     * @type {Integer}
     */
    ChangeTime {
        get => NumGet(this, 40, "int64")
        set => NumPut("int64", value, this, 40)
    }

    /**
     * Attributes of the item.
     * @type {Integer}
     */
    FileAttributes {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }
}
