#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk

/**
 * Is used by the CryptXmlSign function to specify the members of the KeyInfo element to be encoded.
 * @see https://docs.microsoft.com/windows/win32/api//cryptxml/ns-cryptxml-crypt_xml_keyinfo_param
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_XML_KEYINFO_PARAM extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * A pointer to a null-terminated wide character string that contains the <b>Id</b> attribute of the <b>KeyInfo</b> element.
     * @type {PWSTR}
     */
    wszId {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A pointer to a null-terminated wide character string that contains the value in the <b>KeyName</b> element.
     * @type {PWSTR}
     */
    wszKeyName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/dpapi/ns-dpapi-crypt_integer_blob">CERT_BLOB</a> structure that contains the value of the <b>X509SKI</b> element.
     * @type {CRYPT_INTEGER_BLOB}
     */
    SKI{
        get {
            if(!this.HasProp("__SKI"))
                this.__SKI := CRYPT_INTEGER_BLOB(16, this)
            return this.__SKI
        }
    }

    /**
     * A pointer to a null-terminated wide character string that  contains the value of the <b>X509SubjectName</b> element.
     * @type {PWSTR}
     */
    wszSubjectName {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * The number of elements in the array pointed to by the <b>rgCertificate</b> member.
     * @type {Integer}
     */
    cCertificate {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * A pointer to an array of <a href="https://docs.microsoft.com/windows/win32/api/dpapi/ns-dpapi-crypt_integer_blob">CERT_BLOB</a> structures that are used to populate the <b>X509Certificate</b> elements.
     * @type {Pointer<CRYPT_INTEGER_BLOB>}
     */
    rgCertificate {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * The number of elements in the array pointed to by the <b>rgCRL</b> member.
     * @type {Integer}
     */
    cCRL {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * A pointer to an array of <a href="https://docs.microsoft.com/windows/win32/api/dpapi/ns-dpapi-crypt_integer_blob">CERT_BLOB</a> structures that are used to populate the <b>X509CRL</b> elements.
     * @type {Pointer<CRYPT_INTEGER_BLOB>}
     */
    rgCRL {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }
}
