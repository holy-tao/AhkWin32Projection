#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * The PROTOENT (winsock.h) structure contains the name and protocol numbers that correspond to a given protocol name.
 * @see https://learn.microsoft.com/windows/win32/api/winsock/ns-winsock-protoent
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct PROTOENT {
    #StructPack 8

    /**
     * Official name of the protocol.
     */
    p_name : PSTR

    /**
     * Null-terminated array of alternate names.
     */
    p_aliases : IntPtr

    /**
     * Protocol number, in host byte order.
     */
    p_proto : Int16

}
