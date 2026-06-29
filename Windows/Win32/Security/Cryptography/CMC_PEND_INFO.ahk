#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }

/**
 * A possible member of a CMC_STATUS_INFO structure.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cmc_pend_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CMC_PEND_INFO {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/SecGloss/b-gly">BLOB</a> that contains the pending request information.
     */
    PendToken : CRYPT_INTEGER_BLOB

    /**
     * <b>FILETIME</b> containing the request.
     */
    PendTime : FILETIME

}
