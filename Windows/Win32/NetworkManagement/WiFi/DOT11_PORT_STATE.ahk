#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_PORT_STATE extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * @type {Array<Byte>}
     */
    PeerMacAddress{
        get {
            if(!this.HasProp("__PeerMacAddressProxyArray"))
                this.__PeerMacAddressProxyArray := Win32FixedArray(this.ptr + 0, 6, Primitive, "char")
            return this.__PeerMacAddressProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    uSessionId {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {BOOL}
     */
    bPortControlled {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {BOOL}
     */
    bPortAuthorized {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }
}
