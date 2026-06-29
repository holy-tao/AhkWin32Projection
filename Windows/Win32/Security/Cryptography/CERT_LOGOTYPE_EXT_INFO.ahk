#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CERT_LOGOTYPE_INFO.ahk" { CERT_LOGOTYPE_INFO }
#Import ".\CERT_OTHER_LOGOTYPE_INFO.ahk" { CERT_OTHER_LOGOTYPE_INFO }

/**
 * Contains a set of logotype information.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_logotype_ext_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_LOGOTYPE_EXT_INFO {
    #StructPack 8

    /**
     * The number of elements in the <b>rgCommunityLogo</b> array.
     */
    cCommunityLogo : UInt32

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_logotype_info">CERT_LOGOTYPE_INFO</a> structures that contain the community logotypes. The <b>cCommunityLogo</b>  member contains the number of elements in this array.
     */
    rgCommunityLogo : CERT_LOGOTYPE_INFO.Ptr

    /**
     * The address of a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_logotype_info">CERT_LOGOTYPE_INFO</a> structure that contains the issuer logotype. This member is optional and may be <b>NULL</b>.
     */
    pIssuerLogo : CERT_LOGOTYPE_INFO.Ptr

    /**
     * The address of a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_logotype_info">CERT_LOGOTYPE_INFO</a> structure that contains the subject logotype. This member is optional and may be <b>NULL</b>.
     */
    pSubjectLogo : CERT_LOGOTYPE_INFO.Ptr

    /**
     * The number of elements in the <b>rgOtherLogo</b> array.
     */
    cOtherLogo : UInt32

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_other_logotype_info">CERT_OTHER_LOGOTYPE_INFO</a> structures that contain any other logotypes. The <b>cOtherLogo</b>  member contains the number of elements in this array.
     */
    rgOtherLogo : CERT_OTHER_LOGOTYPE_INFO.Ptr

}
