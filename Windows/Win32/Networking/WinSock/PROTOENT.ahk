#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * The PROTOENT (winsock.h) structure contains the name and protocol numbers that correspond to a given protocol name.
 * @see https://learn.microsoft.com/windows/win32/api/winsock/ns-winsock-protoent
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class PROTOENT extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Official name of the protocol.
     * @type {PSTR}
     */
    p_name{
        get {
            if(!this.HasProp("__p_name"))
                this.__p_name := PSTR(this.ptr + 0)
            return this.__p_name
        }
    }

    /**
     * Null-terminated array of alternate names.
     * @type {Pointer<SByte>}
     */
    p_aliases {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Protocol number, in host byte order.
     * @type {Integer}
     */
    p_proto {
        get => NumGet(this, 16, "short")
        set => NumPut("short", value, this, 16)
    }
}
