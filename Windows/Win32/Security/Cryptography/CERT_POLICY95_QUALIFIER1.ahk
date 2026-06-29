#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\CPS_URLS.ahk" { CPS_URLS }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_POLICY95_QUALIFIER1 {
    #StructPack 8

    pszPracticesReference : PWSTR

    pszNoticeIdentifier : PSTR

    pszNSINoticeIdentifier : PSTR

    cCPSURLs : UInt32

    rgCPSURLs : CPS_URLS.Ptr

}
