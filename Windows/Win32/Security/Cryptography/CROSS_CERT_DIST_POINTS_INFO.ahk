#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CERT_ALT_NAME_INFO.ahk" { CERT_ALT_NAME_INFO }

/**
 * Provides information used to update dynamic cross certificates.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cross_cert_dist_points_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CROSS_CERT_DIST_POINTS_INFO {
    #StructPack 8

    /**
     * <b>DWORD</b> indicating seconds between synchronization. If this member is zero, the client default synchronization time is used.
     */
    dwSyncDeltaTime : UInt32

    /**
     * Count of the number of elements in the <b>rgDistPoint</b> member array.
     */
    cDistPoint : UInt32

    /**
     * Array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_alt_name_info">CERT_ALT_NAME_INFO</a> structures for distribution points for updating cross certificates.
     */
    rgDistPoint : CERT_ALT_NAME_INFO.Ptr

}
