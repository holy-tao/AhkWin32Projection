#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains a set of logotype information.
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-cert_logotype_ext_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_LOGOTYPE_EXT_INFO extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * The number of elements in the <b>rgCommunityLogo</b> array.
     * @type {Integer}
     */
    cCommunityLogo {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_logotype_info">CERT_LOGOTYPE_INFO</a> structures that contain the community logotypes. The <b>cCommunityLogo</b>  member contains the number of elements in this array.
     * @type {Pointer<CERT_LOGOTYPE_INFO>}
     */
    rgCommunityLogo {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The address of a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_logotype_info">CERT_LOGOTYPE_INFO</a> structure that contains the issuer logotype. This member is optional and may be <b>NULL</b>.
     * @type {Pointer<CERT_LOGOTYPE_INFO>}
     */
    pIssuerLogo {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The address of a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_logotype_info">CERT_LOGOTYPE_INFO</a> structure that contains the subject logotype. This member is optional and may be <b>NULL</b>.
     * @type {Pointer<CERT_LOGOTYPE_INFO>}
     */
    pSubjectLogo {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * The number of elements in the <b>rgOtherLogo</b> array.
     * @type {Integer}
     */
    cOtherLogo {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_other_logotype_info">CERT_OTHER_LOGOTYPE_INFO</a> structures that contain any other logotypes. The <b>cOtherLogo</b>  member contains the number of elements in this array.
     * @type {Pointer<CERT_OTHER_LOGOTYPE_INFO>}
     */
    rgOtherLogo {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
