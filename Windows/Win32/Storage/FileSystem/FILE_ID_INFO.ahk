#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\FILE_ID_128.ahk

/**
 * Contains identification information for a file. (FILE_ID_INFO)
 * @see https://learn.microsoft.com/windows/win32/api/winbase/ns-winbase-file_id_info
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class FILE_ID_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The serial number of the volume that contains a file.
     * @type {Integer}
     */
    VolumeSerialNumber {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The 128-bit file identifier for the file. The file identifier and the volume serial number uniquely identify 
     *      a file on a single computer. To determine whether two open handles represent the same file, combine the 
     *      identifier and the volume serial number for each file and compare them.
     * @type {FILE_ID_128}
     */
    FileId{
        get {
            if(!this.HasProp("__FileId"))
                this.__FileId := FILE_ID_128(8, this)
            return this.__FileId
        }
    }
}
