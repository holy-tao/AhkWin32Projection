#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class SCM_PD_PASSTHROUGH_OUTPUT extends Win32Struct {
    static sizeof => 32

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
    ProtocolGuid {
        get {
            if(!this.HasProp("__ProtocolGuid"))
                this.__ProtocolGuid := Guid(8, this)
            return this.__ProtocolGuid
        }
    }

    /**
     * @type {Integer}
     */
    DataSize {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Array<Integer>}
     */
    Data {
        get {
            if(!this.HasProp("__DataProxyArray"))
                this.__DataProxyArray := Win32FixedArray(this.ptr + 28, 1, Primitive, "char")
            return this.__DataProxyArray
        }
    }
}
