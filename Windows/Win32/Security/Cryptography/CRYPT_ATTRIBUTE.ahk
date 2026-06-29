#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * The CRYPT_ATTRIBUTE structure specifies an attribute that has one or more values.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-crypt_attribute
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_ATTRIBUTE {
    #StructPack 8

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> (OID) that specifies the type of data contained in the <b>rgValue</b> array.
     */
    pszObjId : PSTR

    /**
     * A <b>DWORD</b>  value that indicates the number of elements in the <b>rgValue</b> array.
     */
    cValue : UInt32

    /**
     * Pointer to an array of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_INTEGER_BLOB</a> structures. The <b>cbData</b> member of the <b>CRYPT_INTEGER_BLOB</b> structure indicates the length of the <b>pbData</b> member. The <b>pbData</b> member contains the attribute information.
     */
    rgValue : CRYPT_INTEGER_BLOB.Ptr

}
