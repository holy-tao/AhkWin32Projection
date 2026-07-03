#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\TRANSPORT_SETTING_ID.ahk" { TRANSPORT_SETTING_ID }

/**
 * Contains the transport setting ID and handle to a fully qualified domain name.
 * @remarks
 * Generally speaking, you can use <b>ASSOCIATE_NAMERES_CONTEXT_INPUT</b> to enforce policy based on Fully Qualified Domain Name (FQDN), rather than just IP address. you can do so by retrieving a handle to a FQDN with a call to <a href="https://docs.microsoft.com/windows/desktop/api/ws2tcpip/nf-ws2tcpip-getaddrinfoexa">GetAddrInfoEx</a>, using the addinfoex4 structure.  From there, you can use the handle in <b>ASSOCIATE_NAMERES_CONTEXT_INPUT</b> in a call to <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/nf-winsock2-wsaioctl">WSAIoctl</a>, using the             <b>SIO_APPLY_TRANSPORT_SETTING</b> ioctl.
 * @see https://learn.microsoft.com/windows/win32/api/mstcpip/ns-mstcpip-associate_nameres_context_input
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct ASSOCIATE_NAMERES_CONTEXT_INPUT {
    #StructPack 8

    /**
     * The transport setting ID.
     */
    TransportSettingId : TRANSPORT_SETTING_ID

    /**
     * Handle to a fully qualified domain name.
     */
    Handle : Int64

}
