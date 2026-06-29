#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CERT_LOGOTYPE_OPTION.ahk" { CERT_LOGOTYPE_OPTION }
#Import ".\CERT_LOGOTYPE_REFERENCE.ahk" { CERT_LOGOTYPE_REFERENCE }
#Import ".\CERT_LOGOTYPE_DATA.ahk" { CERT_LOGOTYPE_DATA }

/**
 * Contains information about logotype data.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_logotype_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_LOGOTYPE_INFO {
    #StructPack 8

    dwLogotypeInfoChoice : CERT_LOGOTYPE_OPTION

    pLogotypeDirectInfo : CERT_LOGOTYPE_DATA.Ptr

    static __New() {
        DefineProp(this.Prototype, 'pLogotypeIndirectInfo', { type: CERT_LOGOTYPE_REFERENCE.Ptr, offset: 8 })
        this.DeleteProp("__New")
    }
}
