#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SCOPE_ID.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class DL_TUNNEL_ADDRESS extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {Integer}
     */
    CompartmentId {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {SCOPE_ID}
     */
    ScopeId{
        get {
            if(!this.HasProp("__ScopeId"))
                this.__ScopeId := SCOPE_ID(4, this)
            return this.__ScopeId
        }
    }

    /**
     * @type {Array<Byte>}
     */
    IpAddress{
        get {
            if(!this.HasProp("__IpAddressProxyArray"))
                this.__IpAddressProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "char")
            return this.__IpAddressProxyArray
        }
    }
}
