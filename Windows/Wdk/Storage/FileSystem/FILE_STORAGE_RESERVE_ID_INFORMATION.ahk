#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 * @version v4.0.30319
 */
class FILE_STORAGE_RESERVE_ID_INFORMATION extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {Integer}
     */
    StorageReserveId {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
