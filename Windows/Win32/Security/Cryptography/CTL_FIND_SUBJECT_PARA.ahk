#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CTL_FIND_USAGE_PARA.ahk" { CTL_FIND_USAGE_PARA }

/**
 * Contains data used by CertFindCTLInStore with a dwFindType parameter of CTL_FIND_SUBJECT to find a Certificate Trust List (CTL).
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-ctl_find_subject_para
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CTL_FIND_SUBJECT_PARA {
    #StructPack 8

    /**
     * The size, in bytes, of this structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-ctl_find_usage_para">CTL_FIND_USAGE_PARA</a> structure. Can be <b>NULL</b> if there is no need to reference the <b>CTL_FIND_USAGE_PARA</b> parameters when finding a CTL.
     */
    pUsagePara : CTL_FIND_USAGE_PARA.Ptr

    /**
     * For CTL_CERT_SUBJECT_TYPE, the <b>pvSubject</b> member points to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_context">CERT_CONTEXT</a>. The CTL's <b>SubjectAlgorithm</b> is examined to determine the representation of the subject's identity. Initially, only SHA1 or MD5 hash will be supported. The appropriate hash property is obtained from the <b>CERT_CONTEXT</b>. 
     * 
     * 
     * 
     * 
     * For CTL_ANY_SUBJECT_TYPE, <b>pvSubject</b> points to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-ctl_any_subject_info">CTL_ANY_SUBJECT_INFO</a> structure that contains the <b>SubjectAlgorithm</b> to be matched in the CTL and the <b>SubjectIdentifier</b> to be matched in one of the CTL entries.
     */
    dwSubjectType : UInt32

    /**
     * The value of the <b>pvSubject</b> member depends upon the value of the <b>dwSubjectType</b> member. For more information, see <b>dwSubjectType</b>.
     */
    pvSubject : IntPtr

}
