#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Indicates whether a file should be deleted. Used for any handles.
 * @see https://learn.microsoft.com/windows/win32/api/winbase/ns-winbase-file_disposition_info
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class FILE_DISPOSITION_INFO extends Win32Struct
{
    static sizeof => 1

    static packingSize => 1

    /**
     * Indicates whether the file should be deleted. Set to <b>TRUE</b> to delete the file. 
     *       This member has no effect if the handle was opened with 
     *       <b>FILE_FLAG_DELETE_ON_CLOSE</b>.
     * @type {Integer}
     */
    DeleteFile {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }
}
