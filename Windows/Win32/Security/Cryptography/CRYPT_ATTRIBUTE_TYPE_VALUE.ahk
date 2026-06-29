#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Contains a single attribute value. The Value member's CRYPT_OBJID_BLOB is encoded.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-crypt_attribute_type_value
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_ATTRIBUTE_TYPE_VALUE {
    #StructPack 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">Object identifier</a> (OID) that specifies the attribute type data contained in the <b>Value</b> BLOB.
     */
    pszObjId : PSTR

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_OBJID_BLOB</a> that contains the encoded attribute. The <b>cbData</b> member of the <b>CRYPT_OBJID_BLOB</b> structure indicates the length of the <b>pbData</b> member. The <b>pbData</b> member contains the attribute information.
     */
    Value : CRYPT_INTEGER_BLOB

}
