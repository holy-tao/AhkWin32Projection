#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IN_ADDR.ahk" { IN_ADDR }
#Import ".\SOCKADDR_IN.ahk" { SOCKADDR_IN }
#Import ".\IN6_ADDR.ahk" { IN6_ADDR }
#Import ".\ADDRESS_FAMILY.ahk" { ADDRESS_FAMILY }
#Import ".\sockaddr_in6_old.ahk" { sockaddr_in6_old }
#Import ".\SOCKADDR.ahk" { SOCKADDR }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * Provides generic socket address information, and is used with the INTERFACE_INFO structure.
 * @remarks
 * On the Microsoft Windows Software Development Kit (SDK) released for Windows Vista and later, the organization of header files has changed and the <b>sockaddr_gen</b> union is defined in the <i>Ws2ipdef.h</i> header file which is automatically included in the <i>Ws2tcpip.h</i> header file. The <i>Ws2ipdef.h</i>  header files should never be used directly.
 * @see https://learn.microsoft.com/windows/win32/api/ws2ipdef/ns-ws2ipdef-sockaddr_gen
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct sockaddr_gen {
    #StructPack 4

    /**
     * IP address information expressed in a <a href="https://docs.microsoft.com/windows/desktop/WinSock/sockaddr-2">sockaddr</a> structure.
     */
    Address : SOCKADDR

    static __New() {
        DefineProp(this.Prototype, 'AddressIn', { type: SOCKADDR_IN, offset: 0 })
        DefineProp(this.Prototype, 'AddressIn6', { type: sockaddr_in6_old, offset: 0 })
        this.DeleteProp("__New")
    }
}
