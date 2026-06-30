#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SCOPE_ID.ahk
#Include ..\..\System\Kernel\COMPARTMENT_ID.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
class DL_TUNNEL_ADDRESS extends Win32Struct {
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {COMPARTMENT_ID}
     */
    CompartmentId {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {SCOPE_ID}
     */
    ScopeId {
        get {
            if(!this.HasProp("__ScopeId"))
                this.__ScopeId := SCOPE_ID(4, this)
            return this.__ScopeId
        }
    }

    /**
     * @type {Array<Integer>}
     */
    IpAddress {
        get {
            if(!this.HasProp("__IpAddressProxyArray"))
                this.__IpAddressProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "char")
            return this.__IpAddressProxyArray
        }
    }
}
