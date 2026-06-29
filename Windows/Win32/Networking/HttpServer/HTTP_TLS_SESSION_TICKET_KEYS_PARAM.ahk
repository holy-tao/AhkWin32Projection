#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_TLS_SESSION_TICKET_KEYS_PARAM {
    #StructPack 8

    SessionTicketKeyCount : UInt32

    SessionTicketKeys : IntPtr

}
