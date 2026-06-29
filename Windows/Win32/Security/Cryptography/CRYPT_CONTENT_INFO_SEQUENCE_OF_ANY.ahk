#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Contains information representing the Netscape certificate sequence of certificates.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-crypt_content_info_sequence_of_any
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_CONTENT_INFO_SEQUENCE_OF_ANY {
    #StructPack 8

    /**
     * Object identifier (OID) specifying the type of data contained in the <b>rgValue</b> array.
     */
    pszObjId : PSTR

    /**
     * Number of elements in the <b>rgValue</b> array.
     */
    cValue : UInt32

    /**
     * Array of pointers to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DER_BLOB</a> structures. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_INTEGER_BLOB</a>.
     */
    rgValue : CRYPT_INTEGER_BLOB.Ptr

}
