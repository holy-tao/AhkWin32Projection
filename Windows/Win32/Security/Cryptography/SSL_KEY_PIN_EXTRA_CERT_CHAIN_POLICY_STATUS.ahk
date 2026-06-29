#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct SSL_KEY_PIN_EXTRA_CERT_CHAIN_POLICY_STATUS {
    #StructPack 4

    cbSize : UInt32 := this.Size

    lError : Int32

    wszErrorText : WCHAR[512]

}
