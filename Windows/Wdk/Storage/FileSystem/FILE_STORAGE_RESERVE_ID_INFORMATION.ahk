#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\System\Ioctl\STORAGE_RESERVE_ID.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
class FILE_STORAGE_RESERVE_ID_INFORMATION extends Win32Struct {
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {STORAGE_RESERVE_ID}
     */
    StorageReserveId {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
