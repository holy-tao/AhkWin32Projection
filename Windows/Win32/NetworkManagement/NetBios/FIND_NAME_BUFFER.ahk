#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The FIND_NAME_BUFFER structure contains information about a local network session.
 * @see https://learn.microsoft.com/windows/win32/api/nb30/ns-nb30-find_name_buffer
 * @namespace Windows.Win32.NetworkManagement.NetBios
 * @version v4.0.30319
 */
class FIND_NAME_BUFFER extends Win32Struct
{
    static sizeof => 33

    static packingSize => 1

    /**
     * Specifies the length, in bytes, of the <b>FIND_NAME_BUFFER</b> structure. Although this structure always occupies 33 bytes, not all of the structure is necessarily valid.
     * @type {Integer}
     */
    length {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * Specifies the access control for the LAN header.
     * @type {Integer}
     */
    access_control {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * Specifies the frame control for the LAN header.
     * @type {Integer}
     */
    frame_control {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * Specifies the destination address of the remote node where the name was found.
     * @type {Array<Byte>}
     */
    destination_addr{
        get {
            if(!this.HasProp("__destination_addrProxyArray"))
                this.__destination_addrProxyArray := Win32FixedArray(this.ptr + 3, 6, Primitive, "char")
            return this.__destination_addrProxyArray
        }
    }

    /**
     * Specifies the source address for the remote node where the name was found.
     * @type {Array<Byte>}
     */
    source_addr{
        get {
            if(!this.HasProp("__source_addrProxyArray"))
                this.__source_addrProxyArray := Win32FixedArray(this.ptr + 9, 6, Primitive, "char")
            return this.__source_addrProxyArray
        }
    }

    /**
     * Specifies additional routing information.
     * @type {Array<Byte>}
     */
    routing_info{
        get {
            if(!this.HasProp("__routing_infoProxyArray"))
                this.__routing_infoProxyArray := Win32FixedArray(this.ptr + 15, 18, Primitive, "char")
            return this.__routing_infoProxyArray
        }
    }
}
