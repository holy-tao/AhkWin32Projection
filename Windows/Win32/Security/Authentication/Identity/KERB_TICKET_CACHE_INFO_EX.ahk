#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct KERB_TICKET_CACHE_INFO_EX {
    #StructPack 8

    ClientName : LSA_UNICODE_STRING

    ClientRealm : LSA_UNICODE_STRING

    ServerName : LSA_UNICODE_STRING

    ServerRealm : LSA_UNICODE_STRING

    StartTime : Int64

    EndTime : Int64

    RenewTime : Int64

    EncryptionType : Int32

    TicketFlags : UInt32

}
