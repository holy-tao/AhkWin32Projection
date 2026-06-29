#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CERT_LOGOTYPE_OPTION.ahk" { CERT_LOGOTYPE_OPTION }
#Import ".\CERT_LOGOTYPE_REFERENCE.ahk" { CERT_LOGOTYPE_REFERENCE }
#Import ".\CERT_LOGOTYPE_DATA.ahk" { CERT_LOGOTYPE_DATA }
#Import ".\CERT_LOGOTYPE_INFO.ahk" { CERT_LOGOTYPE_INFO }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Contains information about logo types that are not predefined.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_other_logotype_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_OTHER_LOGOTYPE_INFO {
    #StructPack 8

    pszObjId : PSTR

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_logotype_info">CERT_LOGOTYPE_INFO</a> structure that contains the logo type information.
     */
    LogotypeInfo : CERT_LOGOTYPE_INFO

}
