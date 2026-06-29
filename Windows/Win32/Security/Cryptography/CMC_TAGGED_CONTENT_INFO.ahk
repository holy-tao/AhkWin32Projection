#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }

/**
 * Used in the CMC_DATA_INFO and CMC_RESPONSE_INFO structures. (CMC_TAGGED_CONTENT_INFO)
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cmc_tagged_content_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CMC_TAGGED_CONTENT_INFO {
    #StructPack 8

    /**
     * <b>DWORD</b> identifying the tagged other message.
     */
    dwBodyPartID : UInt32

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DER_BLOB</a> structure that contains the encoded content information.
     */
    EncodedContentInfo : CRYPT_INTEGER_BLOB

}
