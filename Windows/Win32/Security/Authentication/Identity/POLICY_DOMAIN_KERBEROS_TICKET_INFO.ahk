#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct POLICY_DOMAIN_KERBEROS_TICKET_INFO {
    #StructPack 8

    AuthenticationOptions : UInt32

    MaxServiceTicketAge : Int64

    MaxTicketAge : Int64

    MaxRenewAge : Int64

    MaxClockSkew : Int64

    Reserved : Int64

}
