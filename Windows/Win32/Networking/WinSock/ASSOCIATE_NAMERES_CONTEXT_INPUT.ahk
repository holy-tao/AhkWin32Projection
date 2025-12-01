#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\TRANSPORT_SETTING_ID.ahk

/**
 * Contains the transport setting ID and handle to a fully qualified domain name.
 * @remarks
 * Generally speaking, you can use <b>ASSOCIATE_NAMERES_CONTEXT_INPUT</b> to enforce policy based on Fully Qualified Domain Name (FQDN), rather than just IP address. you can do so by retrieving a handle to a FQDN with a call to <a href="https://docs.microsoft.com/windows/desktop/api/ws2tcpip/nf-ws2tcpip-getaddrinfoexa">GetAddrInfoEx</a>, using the addinfoex4 structure.  From there, you can use the handle in <b>ASSOCIATE_NAMERES_CONTEXT_INPUT</b> in a call to <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/nf-winsock2-wsaioctl">WSAIoctl</a>, using the             <b>SIO_APPLY_TRANSPORT_SETTING</b> ioctl.
 * @see https://learn.microsoft.com/windows/win32/api/mstcpip/ns-mstcpip-associate_nameres_context_input
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class ASSOCIATE_NAMERES_CONTEXT_INPUT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The transport setting ID.
     * @type {TRANSPORT_SETTING_ID}
     */
    TransportSettingId{
        get {
            if(!this.HasProp("__TransportSettingId"))
                this.__TransportSettingId := TRANSPORT_SETTING_ID(0, this)
            return this.__TransportSettingId
        }
    }

    /**
     * Handle to a fully qualified domain name.
     * @type {Integer}
     */
    Handle {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
