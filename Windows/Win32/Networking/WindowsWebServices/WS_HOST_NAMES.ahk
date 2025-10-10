#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * A structure containing a list of host names.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ns-webservices-ws_host_names
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_HOST_NAMES extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A list of host names.  Each host name can be a DNS name or
     *                     an IPv4 or IPv6 address.  IPv6 addresses are enclosed
     *                     in brackets ('[' address ']').
     * @type {Pointer<WS_STRING>}
     */
    hostNames {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The number of elements in the hostNames array.
     * @type {Integer}
     */
    hostNameCount {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
