#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the changes found by the ReadDirectoryChangesW function.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-file_notify_information
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class FILE_NOTIFY_INFORMATION extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

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
     * The size of the file name portion of the record, in bytes. Note that this value does not include the 
     *       terminating null character.
     * @type {Integer}
     */
    FileNameLength {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
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
        get => StrGet(this.ptr + 12, 0, "UTF-16")
        set => StrPut(value, this.ptr + 12, 0, "UTF-16")
    }
}
