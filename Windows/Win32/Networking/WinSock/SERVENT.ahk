#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * The SERVENT (winsock.h) structure is used to store or return the name and service number for a given service name.
 * @see https://learn.microsoft.com/windows/win32/api/winsock/ns-winsock-servent
 * @namespace Windows.Win32.Networking.WinSock
 * @architecture X64, Arm64
 */
export default struct SERVENT {
    #StructPack 8

    /**
     * The official name of the service.
     */
    s_name : PSTR

    /**
     * A <b>NULL</b>-terminated array of alternate names.
     */
    s_aliases : IntPtr

    /**
     * The name of the protocol to use when contacting the service.
     */
    s_proto : PSTR

    /**
     * The port number at which the service can be contacted. Port numbers are returned in network byte order.
     */
    s_port : Int16

}
