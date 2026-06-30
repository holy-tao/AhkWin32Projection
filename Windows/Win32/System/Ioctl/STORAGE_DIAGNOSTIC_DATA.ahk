#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class STORAGE_DIAGNOSTIC_DATA extends Win32Struct {
    static sizeof => 36

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Guid}
     */
    ProviderId {
        get {
            if(!this.HasProp("__ProviderId"))
                this.__ProviderId := Guid(8, this)
            return this.__ProviderId
        }
    }

    /**
     * @type {Integer}
     */
    BufferSize {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Array<Integer>}
     */
    DiagnosticDataBuffer {
        get {
            if(!this.HasProp("__DiagnosticDataBufferProxyArray"))
                this.__DiagnosticDataBufferProxyArray := Win32FixedArray(this.ptr + 32, 1, Primitive, "char")
            return this.__DiagnosticDataBufferProxyArray
        }
    }
}
