#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRL_DIST_POINT.ahk" { CRL_DIST_POINT }

/**
 * Contains a list of certificate revocation list (CRL) distribution points a certificate user can reference to determine whether the certificate has been revoked.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-crl_dist_points_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRL_DIST_POINTS_INFO {
    #StructPack 8

    /**
     * Number of elements in the <b>rgDistPoint</b> member array.
     */
    cDistPoint : UInt32

    /**
     * Array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crl_dist_point">CRL_DIST_POINT</a> structures.
     */
    rgDistPoint : CRL_DIST_POINT.Ptr

}
