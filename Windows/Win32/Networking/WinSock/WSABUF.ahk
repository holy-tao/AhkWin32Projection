#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The WSABUF structure enables the creation or manipulation of a data buffer used by some Winsock functions.
 * @see https://learn.microsoft.com/windows/win32/api/ws2def/ns-ws2def-wsabuf
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class WSABUF extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The length of the buffer, in bytes.
     * @type {Integer}
     */
    len {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to the buffer.
     * @type {Pointer<PSTR>}
     */
    buf {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
