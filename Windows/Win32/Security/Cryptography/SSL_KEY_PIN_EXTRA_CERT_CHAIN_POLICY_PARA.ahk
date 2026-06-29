#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct SSL_KEY_PIN_EXTRA_CERT_CHAIN_POLICY_PARA {
    #StructPack 8

    cbSize : UInt32 := this.Size

    dwReserved : UInt32

    pwszServerName : PWSTR

}
