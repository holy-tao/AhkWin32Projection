#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the identification number for a file, device, or pipe.
 * @see https://docs.microsoft.com/windows/win32/api//lmshare/ns-lmshare-file_info_2
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class FILE_INFO_2 extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Specifies a DWORD value that contains the identification number assigned to the resource when it is opened.
     * @type {Integer}
     */
    fi2_id {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
