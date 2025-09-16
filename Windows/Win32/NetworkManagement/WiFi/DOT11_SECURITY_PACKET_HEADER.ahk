#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_SECURITY_PACKET_HEADER extends Win32Struct
{
    static sizeof => 10

    static packingSize => 2

    /**
     * @type {Array<Byte>}
     */
    PeerMac{
        get {
            if(!this.HasProp("__PeerMacProxyArray"))
                this.__PeerMacProxyArray := Win32FixedArray(this.ptr + 0, 6, Primitive, "char")
            return this.__PeerMacProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    usEtherType {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * @type {Array<Byte>}
     */
    Data{
        get {
            if(!this.HasProp("__DataProxyArray"))
                this.__DataProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "char")
            return this.__DataProxyArray
        }
    }
}
