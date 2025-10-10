#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the virtual IP address assigned to a session.
 * @see https://docs.microsoft.com/windows/win32/api//wtsapi32/ns-wtsapi32-wts_session_address
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class WTS_SESSION_ADDRESS extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * A null-terminated string that contains the address family. Always set this member to "AF_INET".
     * @type {Integer}
     */
    AddressFamily {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The virtual IP address assigned to the session. The format of this address is identical to that used in the <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ns-wtsapi32-wts_client_address">WTS_CLIENT_ADDRESS</a> structure.
     * @type {Array<Byte>}
     */
    Address{
        get {
            if(!this.HasProp("__AddressProxyArray"))
                this.__AddressProxyArray := Win32FixedArray(this.ptr + 4, 20, Primitive, "char")
            return this.__AddressProxyArray
        }
    }
}
