#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Used in the CMC_DATA_INFO and CMC_RESPONSE_INFO structures. (CMC_TAGGED_OTHER_MSG)
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cmc_tagged_other_msg
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CMC_TAGGED_OTHER_MSG {
    #StructPack 8

    /**
     * <b>DWORD</b> identifying the tagged other message.
     */
    dwBodyPartID : UInt32

    /**
     * Object identifier (OID) of the other message.
     */
    pszObjId : PSTR

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_OBJID_BLOB</a> structure that contains the encoded other message information.
     */
    Value : CRYPT_INTEGER_BLOB

}
