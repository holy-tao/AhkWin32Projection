#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains alignment information for a file.
 * @see https://learn.microsoft.com/windows/win32/api/winbase/ns-winbase-file_alignment_info
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class FILE_ALIGNMENT_INFO extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Minimum alignment requirement, in bytes.
     * @type {Integer}
     */
    AlignmentRequirement {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
