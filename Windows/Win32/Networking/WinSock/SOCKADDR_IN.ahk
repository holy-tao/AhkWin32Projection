#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\ADDRESS_FAMILY.ahk
#Include .\IN_ADDR.ahk

/**
 * The SOCKADDR_IN (winsock.h) structure varies depending on the protocol selected.
 * @see https://learn.microsoft.com/windows/win32/api/winsock/ns-winsock-sockaddr_in
 * @namespace Windows.Win32.Networking.WinSock
 */
class SOCKADDR_IN extends Win32Struct {
    static sizeof => 16

    static packingSize => 4

    /**
     * @type {ADDRESS_FAMILY}
     */
    sin_family {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    sin_port {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {IN_ADDR}
     */
    sin_addr {
        get {
            if(!this.HasProp("__sin_addr"))
                this.__sin_addr := IN_ADDR(4, this)
            return this.__sin_addr
        }
    }

    /**
     * @type {String}
     */
    sin_zero {
        get => StrGet(this.ptr + 8, 7, "UTF-8")
        set => StrPut(value, this.ptr + 8, 7, "UTF-8")
    }
}
