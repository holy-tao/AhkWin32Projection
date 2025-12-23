#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the specified value to which the end of the file should be set.
 * @see https://learn.microsoft.com/windows/win32/api/winbase/ns-winbase-file_end_of_file_info
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class FILE_END_OF_FILE_INFO extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * The specified value for the new end of the file.
     * @type {Integer}
     */
    EndOfFile {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }
}
