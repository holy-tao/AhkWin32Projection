#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SOCKET.ahk

/**
 * The FD_SET macro (winsock.h) structure is used by Windows Sockets (Winsock) functions and service providers to place sockets into a set.
 * @see https://learn.microsoft.com/windows/win32/api/winsock/nf-winsock-fd_set
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class FD_SET extends Win32Struct
{
    static sizeof => 520

    static packingSize => 8

    /**
     * @type {Integer}
     */
    fd_count {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<SOCKET>}
     */
    fd_array{
        get {
            if(!this.HasProp("__fd_arrayProxyArray"))
                this.__fd_arrayProxyArray := Win32FixedArray(this.ptr + 8, 64, SOCKET, "")
            return this.__fd_arrayProxyArray
        }
    }
}
