#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\KERB_TICKET_CACHE_INFO_EX.ahk" { KERB_TICKET_CACHE_INFO_EX }
#Import ".\KERB_PROTOCOL_MESSAGE_TYPE.ahk" { KERB_PROTOCOL_MESSAGE_TYPE }
#Import "..\..\..\Foundation\LUID.ahk" { LUID }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct KERB_PURGE_TKT_CACHE_EX_REQUEST {
    #StructPack 8

    MessageType : KERB_PROTOCOL_MESSAGE_TYPE

    LogonId : LUID

    Flags : UInt32

    TicketTemplate : KERB_TICKET_CACHE_INFO_EX

}
