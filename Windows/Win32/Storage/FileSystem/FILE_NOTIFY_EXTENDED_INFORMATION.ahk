#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the changes found by the ReadDirectoryChangesExW function.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-file_notify_extended_information
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class FILE_NOTIFY_EXTENDED_INFORMATION extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * The number of bytes that must be skipped to get to the next record. A value of zero indicates that this is 
     *       the last record.
     * @type {Integer}
     */
    NextEntryOffset {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    Action {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The date and time that the directory or file was created and added to the file system.
     * @type {Integer}
     */
    CreationTime {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * The date and time that the content of the directory or file  was last modified in the file system.
     * @type {Integer}
     */
    LastModificationTime {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }

    /**
     * The date and time that the metadata or content of the directory or file  was last changed in the file system.
     * @type {Integer}
     */
    LastChangeTime {
        get => NumGet(this, 24, "int64")
        set => NumPut("int64", value, this, 24)
    }

    /**
     * The date and time the directory or file was last accessed in the file system.
     * @type {Integer}
     */
    LastAccessTime {
        get => NumGet(this, 32, "int64")
        set => NumPut("int64", value, this, 32)
    }

    /**
     * The allocated size of the file, in bytes.
     * @type {Integer}
     */
    AllocatedLength {
        get => NumGet(this, 40, "int64")
        set => NumPut("int64", value, this, 40)
    }

    /**
     * The new size of the directory or file in bytes, or the old size if 
     *             the size is unchanged.
     * @type {Integer}
     */
    FileSize {
        get => NumGet(this, 48, "int64")
        set => NumPut("int64", value, this, 48)
    }

    /**
     * The attributes of the directory or file.
     * @type {Integer}
     */
    FileAttributes {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    ReparsePointTag {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * @type {Integer}
     */
    EaSize {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * The identifier of the directory or file.
     * @type {Integer}
     */
    FileId {
        get => NumGet(this, 64, "int64")
        set => NumPut("int64", value, this, 64)
    }

    /**
     * The identifier of the parent directory for the file.
     * @type {Integer}
     */
    ParentFileId {
        get => NumGet(this, 72, "int64")
        set => NumPut("int64", value, this, 72)
    }

    /**
     * The size of the file name portion of the record, in bytes. This value does not include a 
     *       terminating null character.
     * @type {Integer}
     */
    FileNameLength {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * A variable-length field that contains the file name relative to the directory handle. The file name is in 
     *       the Unicode character format and is not null-terminated.
     * 	     
     * 
     * If there is both a short and long name for the file, the function will return one of these names, but it is 
     *  	     unspecified which one.
     * @type {String}
     */
    FileName {
        get => StrGet(this.ptr + 84, 0, "UTF-16")
        set => StrPut(value, this.ptr + 84, 0, "UTF-16")
    }
}
