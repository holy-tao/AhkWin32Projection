#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }

/**
 * Contains a relative distinguished name (RDN) attribute value.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_name_value
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_NAME_VALUE {
    #StructPack 8

    /**
     * Indicates the interpretation of the <b>Value</b> member. For documentation on possible values of <b>dwValueType</b>, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_rdn_attr">CERT_RDN_ATTR</a>.
     */
    dwValueType : UInt32

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_INTEGER_BLOB</a> structure that contains the RDN attribute. The <b>cbData</b> member of <b>Value</b> is the length, in bytes, of the <b>pbData</b> member. It is not the number of elements in the <b>pbData</b> string. 
     * 
     * 
     * 
     * 
     * For example, a <b>DWORD</b> is 32 bits or 4 bytes long. If the <b>pbData</b> member of <b>Value</b> is a <b>DWORD</b> array, the <b>cbData</b> member of <b>Value</b> would be four times the number of <b>DWORD</b> elements in the array. A <b>short</b> data type is 16 bits or 2 bytes long. If the <b>pbData</b> member is an array of <b>short</b> data types, the <b>cbData</b> member must be two times the length of the array.
     * 
     * The <b>pbData</b> member of <b>Value</b> can be a null-terminated array of 8-bit or 16-bit characters or a fixed-length array of elements. If <b>dwValueType</b> is set to CERT_RDN_ENCODED_BLOB, <b>pbData</b> is encoded.
     */
    Value : CRYPT_INTEGER_BLOB

}
