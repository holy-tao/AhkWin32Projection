#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_POLICY_QUALIFIER_NOTICE_REFERENCE {
    #StructPack 8

    pszOrganization : PSTR

    cNoticeNumbers : UInt32

    rgNoticeNumbers : IntPtr

}
