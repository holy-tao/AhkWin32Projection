#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import ".\CERT_OTHER_NAME.ahk" { CERT_OTHER_NAME }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Contains an alternative name in one of a variety of name forms.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_alt_name_entry
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_ALT_NAME_ENTRY {
    #StructPack 8

    /**
     * Indicates the <b>union</b> variant used for the alternative name.
     */
    dwAltNameChoice : UInt32

    pOtherName : CERT_OTHER_NAME.Ptr

    static __New() {
        DefineProp(this.Prototype, 'pwszRfc822Name', { type: PWSTR, offset: 8 })
        DefineProp(this.Prototype, 'pwszDNSName', { type: PWSTR, offset: 8 })
        DefineProp(this.Prototype, 'DirectoryName', { type: CRYPT_INTEGER_BLOB, offset: 8 })
        DefineProp(this.Prototype, 'pwszURL', { type: PWSTR, offset: 8 })
        DefineProp(this.Prototype, 'IPAddress', { type: CRYPT_INTEGER_BLOB, offset: 8 })
        DefineProp(this.Prototype, 'pszRegisteredID', { type: PSTR, offset: 8 })
        this.DeleteProp("__New")
    }
}
