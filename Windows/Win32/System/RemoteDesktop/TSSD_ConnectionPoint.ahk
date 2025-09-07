#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines the IP address of a target.
 * @see https://learn.microsoft.com/windows/win32/api/sessdirpublictypes/ns-sessdirpublictypes-tssd_connectionpoint
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class TSSD_ConnectionPoint extends Win32Struct
{
    static sizeof => 28

    static packingSize => 4

    /**
     * The server address.
     * @type {Array<Byte>}
     */
    ServerAddressB{
        get {
            if(!this.HasProp("__ServerAddressBProxyArray"))
                this.__ServerAddressBProxyArray := Win32FixedArray(this.ptr + 0, 1, Primitive, "char")
            return this.__ServerAddressBProxyArray
        }
    }

    /**
     * A value of the <a href="https://docs.microsoft.com/windows/win32/api/sessdirpublictypes/ne-sessdirpublictypes-tssd_addrv46type">TSSD_AddrV46Type</a> enumeration  that indicates the IP address type.
     * @type {Integer}
     */
    AddressType {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * The IP port number.
     * @type {Integer}
     */
    PortNumber {
        get => NumGet(this, 20, "ushort")
        set => NumPut("ushort", value, this, 20)
    }

    /**
     * The scope of the address.
     * @type {Integer}
     */
    AddressScope {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
