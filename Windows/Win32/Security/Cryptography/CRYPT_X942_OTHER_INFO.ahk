#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * The CRYPT_X942_OTHER_INFO structure contains additional key generation information.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-crypt_x942_other_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_X942_OTHER_INFO {
    #StructPack 8

    /**
     * OID of the content encryption algorithm.
     */
    pszContentEncryptionObjId : PSTR

    /**
     * Array of BYTES of length <b>CRYPT_X942_COUNTER_BYTE_LENGTH</b>. The value is stored in <a href="https://docs.microsoft.com/windows/desktop/SecGloss/l-gly">little-endian</a> order.
     */
    rgbCounter : Int8[4]

    /**
     * Array of BYTES of length <b>CRYPT_X942_KEY_LENGTH_BYTE_LENGTH</b>. The value is stored in little-endian order.
     */
    rgbKeyLength : Int8[4]

    /**
     * Optional <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DATA_BLOB</a> for additional information.
     */
    PubInfo : CRYPT_INTEGER_BLOB

}
