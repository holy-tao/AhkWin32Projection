#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SEC_SESSION_TICKET {
    #StructPack 2

    SessionTicketSize : UInt16

    SessionTicket : Int8[1]

}
