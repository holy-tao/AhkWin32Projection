#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Contains data encoded in the PKCS
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-crypt_content_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_CONTENT_INFO {
    #StructPack 8

    /**
     * Object identifier (OID) of the type of data contained in the <b>Content</b> member. ContentType in PKCS #7 defines a set of predefined OIDs. However, additional OIDs can be defined and used.
     */
    pszObjId : PSTR

    /**
     * The data encoded in the PKCS #7 ContentInfo data format.
     */
    Content : CRYPT_INTEGER_BLOB

}
