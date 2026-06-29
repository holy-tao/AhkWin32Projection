#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_TPM_SPECIFICATION_INFO {
    #StructPack 8

    pwszFamily : PWSTR

    dwLevel : UInt32

    dwRevision : UInt32

}
