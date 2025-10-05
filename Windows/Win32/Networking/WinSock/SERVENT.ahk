#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The SERVENT (winsock.h) structure is used to store or return the name and service number for a given service name.
 * @see https://learn.microsoft.com/windows/win32/api/winsock/ns-winsock-servent
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class SERVENT extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The official name of the service.
     * @type {Pointer<Byte>}
     */
    s_name {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A <b>NULL</b>-terminated array of alternate names.
     * @type {Pointer<SByte>}
     */
    s_aliases {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The name of the protocol to use when contacting the service.
     * @type {Pointer<Byte>}
     */
    s_proto {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The port number at which the service can be contacted. Port numbers are returned in network byte order.
     * @type {Integer}
     */
    s_port {
        get => NumGet(this, 24, "short")
        set => NumPut("short", value, this, 24)
    }
}
