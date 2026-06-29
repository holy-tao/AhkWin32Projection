#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SSL_CREDENTIAL_CERTIFICATE {
    #StructPack 8

    cbPrivateKey : UInt32

    pPrivateKey : IntPtr

    cbCertificate : UInt32

    pCertificate : IntPtr

    pszPassword : PSTR

}
