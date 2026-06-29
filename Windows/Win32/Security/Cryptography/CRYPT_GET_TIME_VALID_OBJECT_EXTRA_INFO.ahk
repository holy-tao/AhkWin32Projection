#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import ".\CERT_REVOCATION_CHAIN_PARA.ahk" { CERT_REVOCATION_CHAIN_PARA }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }

/**
 * Contains optional extra information that can be passed to the CryptGetTimeValidObject function in the pExtraInfo parameter.
 * @remarks
 * All members of the <b>CRYPT_GET_TIME_VALID_OBJECT_EXTRA_INFO</b> structure that do not have a value must be set to zero.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-crypt_get_time_valid_object_extra_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_GET_TIME_VALID_OBJECT_EXTRA_INFO {
    #StructPack 8

    /**
     * The size, in bytes, of this structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * A value used to compare to the base <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate revocation list</a> (CRL) number. If the base CRL number is less than this value, the caller should attempt to retrieve a newer base CRL.
     * 
     * If the <b>pDeltaCrlIndicator</b> member is non-<b>NULL</b>  the value of this member must be 0x7fffffff.<b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>Because the <b>pDeltaCrlIndicator</b> member does not exist, the  <b>iDeltaCrlIndicator</b> value requirement does not apply.
     */
    iDeltaCrlIndicator : Int32

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that governs the use of cached information. Any information cached  before this time is considered invalid and new information is retrieved.
     */
    pftCacheResync : FILETIME.Ptr

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the time of the last synchronization of the data retrieved for the object.
     */
    pLastSyncTime : FILETIME.Ptr

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that specifies an expiration time of the data retrieved based on the <b>dwMaxAge</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cryptnet_url_cache_response_info">CRYPTNET_URL_CACHE_RESPONSE_INFO</a> structure.
     */
    pMaxAgeTime : FILETIME.Ptr

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_revocation_chain_para">CERT_REVOCATION_CHAIN_PARA</a> structure that contains the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certgetcertificatechain">CertGetCertificateChain</a> function parameters used by the caller. The data in this member enables independent <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">online certificate status protocol</a> (OCSP) signer certificate chain verification.
     */
    pChainPara : CERT_REVOCATION_CHAIN_PARA.Ptr

    /**
     * A pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_INTEGER_BLOB</a> structure that contains a CRL with a length of more than 4 bytes. If this member is  non-<b>NULL</b> and the <b>iDeltaCrlIndicator</b> member is equal to <b>MAXLONG</b>, then if the base CRL number is less than this value, the caller should attempt to retrieve a newer base CRL.
     * 
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This member is not supported.
     */
    pDeltaCrlIndicator : CRYPT_INTEGER_BLOB.Ptr

}
