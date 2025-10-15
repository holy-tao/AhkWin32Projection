#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

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
    bPortControlled{
        get {
            if(!this.HasProp("__bPortControlled"))
                this.__bPortControlled := BOOL(this.ptr + 12)
            return this.__bPortControlled
        }
    }

    /**
     * @type {BOOL}
     */
    bPortAuthorized{
        get {
            if(!this.HasProp("__bPortAuthorized"))
                this.__bPortAuthorized := BOOL(this.ptr + 16)
            return this.__bPortAuthorized
        }
    }
}
