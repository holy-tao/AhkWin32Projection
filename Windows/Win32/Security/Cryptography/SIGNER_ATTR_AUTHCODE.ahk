#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Specifies attributes for an Authenticode signature.
 * @see https://learn.microsoft.com/windows/win32/SecCrypto/signer-attr-authcode
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct SIGNER_ATTR_AUTHCODE {
    #StructPack 8

    /**
     * The size, in bytes, of the structure.
     */
    cbSize : UInt32 := this.Size

    fCommercial : BOOL

    fIndividual : BOOL

    /**
     * The display name of the file upon download.
     */
    pwszName : PWSTR

    /**
     * The display name of the URL of the file upon download.
     */
    pwszInfo : PWSTR

}
