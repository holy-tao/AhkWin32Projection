#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\ADDRESS_FAMILY.ahk

/**
 * The sockaddr structure varies depending on the protocol selected. (sockaddr)
 * @see https://learn.microsoft.com/windows/win32/api/winsock/ns-winsock-sockaddr
 * @namespace Windows.Win32.Networking.WinSock
 */
class SOCKADDR extends Win32Struct {
    static sizeof => 16

    static packingSize => 2

    /**
     * @type {ADDRESS_FAMILY}
     */
    sa_family {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {String}
     */
    sa_data {
        get => StrGet(this.ptr + 2, 13, "UTF-8")
        set => StrPut(value, this.ptr + 2, 13, "UTF-8")
    }
}
