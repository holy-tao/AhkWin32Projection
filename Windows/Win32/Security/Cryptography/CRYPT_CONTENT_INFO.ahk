#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk

/**
 * Contains data encoded in the PKCS
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-crypt_content_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_CONTENT_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Object identifier (OID) of the type of data contained in the <b>Content</b> member. ContentType in PKCS #7 defines a set of predefined OIDs. However, additional OIDs can be defined and used.
     * @type {PSTR}
     */
    pszObjId{
        get {
            if(!this.HasProp("__pszObjId"))
                this.__pszObjId := PSTR(this.ptr + 0)
            return this.__pszObjId
        }
    }

    /**
     * The data encoded in the PKCS #7 ContentInfo data format.
     * @type {CRYPT_INTEGER_BLOB}
     */
    Content{
        get {
            if(!this.HasProp("__Content"))
                this.__Content := CRYPT_INTEGER_BLOB(this.ptr + 8)
            return this.__Content
        }
    }
}
