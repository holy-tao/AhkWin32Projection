#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_XML_X509DATA_TYPE.ahk" { CRYPT_XML_X509DATA_TYPE }
#Import ".\CRYPT_XML_DATA_BLOB.ahk" { CRYPT_XML_DATA_BLOB }
#Import ".\CRYPT_XML_CHARSET.ahk" { CRYPT_XML_CHARSET }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\CRYPT_XML_ISSUER_SERIAL.ahk" { CRYPT_XML_ISSUER_SERIAL }
#Import ".\CRYPT_XML_BLOB.ahk" { CRYPT_XML_BLOB }

/**
 * Represents X.509 data that is to be encoded in an X509Data named element.
 * @see https://learn.microsoft.com/windows/win32/api/cryptxml/ns-cryptxml-crypt_xml_x509data_item
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_XML_X509DATA_ITEM {
    #StructPack 8

    /**
     * Specifies the data item type.
     */
    dwType : CRYPT_XML_X509DATA_TYPE

    IssuerSerial : CRYPT_XML_ISSUER_SERIAL

    static __New() {
        DefineProp(this.Prototype, 'SKI', { type: CRYPT_XML_DATA_BLOB, offset: 8 })
        DefineProp(this.Prototype, 'wszSubjectName', { type: PWSTR, offset: 8 })
        DefineProp(this.Prototype, 'Certificate', { type: CRYPT_XML_DATA_BLOB, offset: 8 })
        DefineProp(this.Prototype, 'CRL', { type: CRYPT_XML_DATA_BLOB, offset: 8 })
        DefineProp(this.Prototype, 'Custom', { type: CRYPT_XML_BLOB, offset: 8 })
        this.DeleteProp("__New")
    }
}
