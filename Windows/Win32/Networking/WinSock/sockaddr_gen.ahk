#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SOCKADDR.ahk
#Include .\IN_ADDR.ahk
#Include .\SOCKADDR_IN.ahk
#Include .\IN6_ADDR.ahk
#Include .\sockaddr_in6_old.ahk

/**
 * Provides generic socket address information, and is used with the INTERFACE_INFO structure.
 * @remarks
 * On the Microsoft Windows Software Development Kit (SDK) released for Windows Vista and later, the organization of header files has changed and the <b>sockaddr_gen</b> union is defined in the <i>Ws2ipdef.h</i> header file which is automatically included in the <i>Ws2tcpip.h</i> header file. The <i>Ws2ipdef.h</i>  header files should never be used directly.
 * @see https://learn.microsoft.com/windows/win32/api/ws2ipdef/ns-ws2ipdef-sockaddr_gen
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class sockaddr_gen extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * IP address information expressed in a <a href="https://docs.microsoft.com/windows/desktop/WinSock/sockaddr-2">sockaddr</a> structure.
     * @type {SOCKADDR}
     */
    Address{
        get {
            if(!this.HasProp("__Address"))
                this.__Address := SOCKADDR(this.ptr + 0)
            return this.__Address
        }
    }

    /**
     * IP address information expressed in a <a href="https://docs.microsoft.com/windows/desktop/WinSock/sockaddr-2">sockaddr_in</a> structure.
     * @type {SOCKADDR_IN}
     */
    AddressIn{
        get {
            if(!this.HasProp("__AddressIn"))
                this.__AddressIn := SOCKADDR_IN(this.ptr + 0)
            return this.__AddressIn
        }
    }

    /**
     * IP address information expressed in a <a href="https://docs.microsoft.com/windows/desktop/WinSock/sockaddr-2">sockaddr_in6_old</a> structure.
     * @type {sockaddr_in6_old}
     */
    AddressIn6{
        get {
            if(!this.HasProp("__AddressIn6"))
                this.__AddressIn6 := sockaddr_in6_old(this.ptr + 0)
            return this.__AddressIn6
        }
    }
}
