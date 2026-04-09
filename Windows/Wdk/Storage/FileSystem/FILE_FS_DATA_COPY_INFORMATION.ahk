#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
class FILE_FS_DATA_COPY_INFORMATION extends Win32Struct {
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {Integer}
     */
    NumberOfCopies {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
