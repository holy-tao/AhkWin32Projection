#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CERT_LOGOTYPE_IMAGE_INFO.ahk" { CERT_LOGOTYPE_IMAGE_INFO }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\CERT_LOGOTYPE_DETAILS.ahk" { CERT_LOGOTYPE_DETAILS }
#Import ".\CERT_HASHED_URL.ahk" { CERT_HASHED_URL }

/**
 * Contains information about an image logotype.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_logotype_image
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_LOGOTYPE_IMAGE {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_logotype_details">CERT_LOGOTYPE_DETAILS</a> structure that contains additional information about the image.
     */
    LogotypeDetails : CERT_LOGOTYPE_DETAILS

    /**
     * The address of a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_logotype_image_info">CERT_LOGOTYPE_IMAGE_INFO</a> structure that contains the image information.
     */
    pLogotypeImageInfo : CERT_LOGOTYPE_IMAGE_INFO.Ptr

}
