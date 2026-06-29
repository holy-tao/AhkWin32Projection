#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CERT_ALT_NAME_ENTRY.ahk" { CERT_ALT_NAME_ENTRY }
#Import ".\CRL_DIST_POINT_NAME.ahk" { CRL_DIST_POINT_NAME }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\CERT_ALT_NAME_INFO.ahk" { CERT_ALT_NAME_INFO }
#Import ".\CRYPT_BIT_BLOB.ahk" { CRYPT_BIT_BLOB }

/**
 * Contains information about the kinds of certificates listed in a certificate revocation list (CRL).
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-crl_issuing_dist_point
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRL_ISSUING_DIST_POINT {
    #StructPack 8

    /**
     * Optional 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crl_dist_point_name">CRL_DIST_POINT_NAME</a> member.
     */
    DistPointName : CRL_DIST_POINT_NAME

    /**
     * <b>BOOL</b> flag. <b>TRUE</b> if only user certificates are contained in the CRL.
     */
    fOnlyContainsUserCerts : BOOL

    /**
     * <b>BOOL</b> flag. <b>TRUE</b> if only CA certificates are contained in the CRL.
     */
    fOnlyContainsCACerts : BOOL

    /**
     * Optional 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_bit_blob">CRYPT_BIT_BLOB</a> with bits indicating some reasons for certificate revocation.
     */
    OnlySomeReasonFlags : CRYPT_BIT_BLOB

    /**
     * <b>BOOL</b> flag. <b>TRUE</b> if this is an indirect CRL.
     */
    fIndirectCRL : BOOL

}
