#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILE_OBJECT.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
class READ_LIST extends Win32Struct {
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Pointer<FILE_OBJECT>}
     */
    FileObject {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    NumberOfEntries {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    IsImage {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Array<Pointer>}
     */
    List {
        get {
            if(!this.HasProp("__ListProxyArray"))
                this.__ListProxyArray := Win32FixedArray(this.ptr + 16, 1, Primitive, "ptr")
            return this.__ListProxyArray
        }
    }
}
