#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk
#Include .\FILE_OBJECT.ahk

/**
 * @namespace Windows.Wdk.Foundation
 */
class TARGET_DEVICE_CUSTOM_NOTIFICATION extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Pointer}
     */
    Event {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<FILE_OBJECT>}
     */
    FileObject {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    NameBufferOffset {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * @type {Array<Integer>}
     */
    CustomDataBuffer {
        get {
            if(!this.HasProp("__CustomDataBufferProxyArray"))
                this.__CustomDataBufferProxyArray := Win32FixedArray(this.ptr + 28, 1, Primitive, "char")
            return this.__CustomDataBufferProxyArray
        }
    }
}
