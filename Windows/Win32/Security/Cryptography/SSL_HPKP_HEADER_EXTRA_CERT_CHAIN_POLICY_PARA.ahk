#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct SSL_HPKP_HEADER_EXTRA_CERT_CHAIN_POLICY_PARA {
    #StructPack 8

    cbSize : UInt32 := this.Size

    dwReserved : UInt32

    pwszServerName : PWSTR

    rgpszHpkpValue : PSTR[2]

}
