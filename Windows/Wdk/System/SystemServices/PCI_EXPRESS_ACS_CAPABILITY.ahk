#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class PCI_EXPRESS_ACS_CAPABILITY extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    Header {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer}
     */
    Capability {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer}
     */
    Control {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Array<Integer>}
     */
    EgressControl {
        get {
            if(!this.HasProp("__EgressControlProxyArray"))
                this.__EgressControlProxyArray := Win32FixedArray(this.ptr + 24, 1, Primitive, "uint")
            return this.__EgressControlProxyArray
        }
    }
}
