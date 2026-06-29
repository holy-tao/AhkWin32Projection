#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }
#Import ".\KERB_LOGON_SUBMIT_TYPE.ahk" { KERB_LOGON_SUBMIT_TYPE }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Contains information about a smart card logon session. (KERB_SMART_CARD_LOGON)
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-kerb_smart_card_logon
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct KERB_SMART_CARD_LOGON {
    #StructPack 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ne-ntsecapi-kerb_logon_submit_type">KERB_LOGON_SUBMIT_TYPE</a> value identifying the type of logon request being made. This member must be set to <b>KerbInteractiveLogon</b>.
     */
    MessageType : KERB_LOGON_SUBMIT_TYPE

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> that specifies the PIN associated with the smart card.
     */
    Pin : LSA_UNICODE_STRING

    /**
     * The length, in characters, of the <b>CspData</b> member.
     */
    CspDataLength : UInt32

    /**
     * A pointer to a <b>KERB_SMARTCARD_CSP_INFO</b> structure that contains information about the smart card cryptographic service provider (CSP) or a pointer to a marshaled <b>KERB_CERTIFICATE_INFO</b> structure when updating certificate credentials.
     */
    CspData : IntPtr

}
