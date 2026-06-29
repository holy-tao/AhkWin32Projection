#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CERT_ID_OPTION.ahk" { CERT_ID_OPTION }
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import ".\CERT_ISSUER_SERIAL_NUMBER.ahk" { CERT_ISSUER_SERIAL_NUMBER }

/**
 * Is used as a flexible means of uniquely identifying a certificate.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_id
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_ID {
    #StructPack 8

    dwIdChoice : CERT_ID_OPTION

    IssuerSerialNumber : CERT_ISSUER_SERIAL_NUMBER

    static __New() {
        DefineProp(this.Prototype, 'KeyId', { type: CRYPT_INTEGER_BLOB, offset: 8 })
        DefineProp(this.Prototype, 'HashId', { type: CRYPT_INTEGER_BLOB, offset: 8 })
        this.DeleteProp("__New")
    }
}
