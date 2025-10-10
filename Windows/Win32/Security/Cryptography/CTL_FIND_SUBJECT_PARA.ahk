#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains data used by CertFindCTLInStore with a dwFindType parameter of CTL_FIND_SUBJECT to find a Certificate Trust List (CTL).
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-ctl_find_subject_para
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CTL_FIND_SUBJECT_PARA extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The size, in bytes, of this structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-ctl_find_usage_para">CTL_FIND_USAGE_PARA</a> structure. Can be <b>NULL</b> if there is no need to reference the <b>CTL_FIND_USAGE_PARA</b> parameters when finding a CTL.
     * @type {Pointer<CTL_FIND_USAGE_PARA>}
     */
    pUsagePara {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * For CTL_CERT_SUBJECT_TYPE, the <b>pvSubject</b> member points to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_context">CERT_CONTEXT</a>. The CTL's <b>SubjectAlgorithm</b> is examined to determine the representation of the subject's identity. Initially, only SHA1 or MD5 hash will be supported. The appropriate hash property is obtained from the <b>CERT_CONTEXT</b>. 
     * 
     * 
     * 
     * 
     * For CTL_ANY_SUBJECT_TYPE, <b>pvSubject</b> points to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-ctl_any_subject_info">CTL_ANY_SUBJECT_INFO</a> structure that contains the <b>SubjectAlgorithm</b> to be matched in the CTL and the <b>SubjectIdentifier</b> to be matched in one of the CTL entries.
     * @type {Integer}
     */
    dwSubjectType {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The value of the <b>pvSubject</b> member depends upon the value of the <b>dwSubjectType</b> member. For more information, see <b>dwSubjectType</b>.
     * @type {Pointer<Void>}
     */
    pvSubject {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 32
    }
}
