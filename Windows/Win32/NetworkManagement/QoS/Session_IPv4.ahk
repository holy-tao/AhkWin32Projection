#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Networking\WinSock\IN_ADDR.ahk

/**
 * The Session_IPv4 structure stores information about an IPv4 RSVP SESSION object.
 * @see https://learn.microsoft.com/windows/win32/api/lpmapi/ns-lpmapi-session_ipv4
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class Session_IPv4 extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Destination IP address for the session.
     * @type {IN_ADDR}
     */
    sess_destaddr{
        get {
            if(!this.HasProp("__sess_destaddr"))
                this.__sess_destaddr := IN_ADDR(this.ptr + 0)
            return this.__sess_destaddr
        }
    }

    /**
     * Protocol ID for the session.
     * @type {Integer}
     */
    sess_protid {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }

    /**
     * Session flags.
     * @type {Integer}
     */
    sess_flags {
        get => NumGet(this, 5, "char")
        set => NumPut("char", value, this, 5)
    }

    /**
     * Destination IP address for the session.
     * @type {Integer}
     */
    sess_destport {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }
}
