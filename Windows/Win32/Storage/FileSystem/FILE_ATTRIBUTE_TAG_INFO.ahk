#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Receives the requested file attribute information. Used for any handles.
 * @see https://docs.microsoft.com/windows/win32/api//winbase/ns-winbase-file_attribute_tag_info
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class FILE_ATTRIBUTE_TAG_INFO extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The file attribute information.
     * @type {Integer}
     */
    FileAttributes {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The reparse tag.
     * @type {Integer}
     */
    ReparseTag {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
