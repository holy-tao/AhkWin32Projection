#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\CERT_POLICY_QUALIFIER_NOTICE_REFERENCE.ahk" { CERT_POLICY_QUALIFIER_NOTICE_REFERENCE }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_POLICY_QUALIFIER_USER_NOTICE {
    #StructPack 8

    pNoticeReference : CERT_POLICY_QUALIFIER_NOTICE_REFERENCE.Ptr

    pszDisplayText : PWSTR

}
