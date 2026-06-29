#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_BIT_BLOB.ahk" { CRYPT_BIT_BLOB }

/**
 * Optionally pointed to by a member of the CERT_X942_DH_PARAMETERS structure and contains additional seed information.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_x942_dh_validation_params
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_X942_DH_VALIDATION_PARAMS {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_UINT_BLOB</a> that contains an unsigned seed value.
     */
    seed : CRYPT_BIT_BLOB

    /**
     * A <b>DWORD</b> counter.
     */
    pgenCounter : UInt32

}
