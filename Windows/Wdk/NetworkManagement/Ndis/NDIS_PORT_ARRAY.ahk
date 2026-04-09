#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
class NDIS_PORT_ARRAY extends Win32Struct {
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
     * @type {Integer}
     */
    NumberOfPorts {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    OffsetFirstPort {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    ElementSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Array<Pointer>}
     */
    Ports {
        get {
            if(!this.HasProp("__PortsProxyArray"))
                this.__PortsProxyArray := Win32FixedArray(this.ptr + 24, 1, Primitive, "ptr")
            return this.__PortsProxyArray
        }
    }
}
