#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\FILE_FULL_EA_INFORMATION.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
class QUERY_ON_CREATE_EA_INFORMATION extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    EaBufferSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<FILE_FULL_EA_INFORMATION>}
     */
    EaBuffer {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
