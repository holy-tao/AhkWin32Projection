#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\ALG_ID.ahk" { ALG_ID }

/**
 * Used with the KP_CMS_DH_KEY_INFO parameter in the CryptSetKeyParam function to contain Diffie-Hellman key information.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cms_dh_key_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CMS_DH_KEY_INFO {
    #StructPack 8

    /**
     * The size, in bytes, of this structure.
     */
    dwVersion : UInt32

    /**
     * One of the <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/alg-id">ALG_ID</a> values that identifies the algorithm for the key to be converted.
     */
    Algid : ALG_ID

    /**
     * The address of a null-terminated ANSI string that contains the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> (OID) of the content encryption algorithm.
     */
    pszContentEncObjId : PSTR

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DATA_BLOB</a> structure that contains additional public information. This member is optional and the <b>cbData</b> member of this structure can be zero if this is not needed.
     */
    PubInfo : CRYPT_INTEGER_BLOB

    /**
     * Reserved for future use and must be <b>NULL</b>.
     */
    pReserved : IntPtr

}
