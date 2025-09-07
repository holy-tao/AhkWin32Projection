#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains a packet of opaque data sent during an EAP authentication session.
 * @see https://learn.microsoft.com/windows/win32/api/eapmethodtypes/ns-eapmethodtypes-eappacket
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 * @version v4.0.30319
 */
class EapPacket extends Win32Struct
{
    static sizeof => 5

    static packingSize => 1

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/eapmethodtypes/ne-eapmethodtypes-eapcode">EapCode</a> enumeration value that identifies the packet type.
     * @type {Integer}
     */
    Code {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * The packet ID number.
     * @type {Integer}
     */
    Id {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * The length of the entire packet
     * @type {Array<Byte>}
     */
    Length{
        get {
            if(!this.HasProp("__LengthProxyArray"))
                this.__LengthProxyArray := Win32FixedArray(this.ptr + 2, 1, Primitive, "char")
            return this.__LengthProxyArray
        }
    }

    /**
     * The packet message data. This opaque data block continues after the first byte for <b>Length</b> - 1 bytes.
     * @type {Array<Byte>}
     */
    Data{
        get {
            if(!this.HasProp("__DataProxyArray"))
                this.__DataProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "char")
            return this.__DataProxyArray
        }
    }
}
