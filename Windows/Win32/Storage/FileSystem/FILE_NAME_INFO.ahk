#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Receives the file name.
 * @remarks
 * If the call to `GetFileInformationByHandleEx` fails because there was not enough
  * buffer space for the full length of the <b>FileName</b> then the `FileNameLength`
  * field will contain the required length of the <b>FileName</b> in bytes.
 * @see https://learn.microsoft.com/windows/win32/api/winbase/ns-winbase-file_name_info
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class FILE_NAME_INFO extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The size of the <b>FileName</b> string, in bytes.
     * @type {Integer}
     */
    FileNameLength {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The file name that is returned.
     * @type {String}
     */
    FileName {
        get => StrGet(this.ptr + 4, 0, "UTF-16")
        set => StrPut(value, this.ptr + 4, 0, "UTF-16")
    }
}
