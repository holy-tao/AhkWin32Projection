#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains information that controls the operation of the CryptUIWizExport function.
 * @see https://learn.microsoft.com/windows/win32/api/cryptuiapi/ns-cryptuiapi-cryptui_wiz_export_info
 * @namespace Windows.Win32.Security.Cryptography.UI
 * @version v4.0.30319
 */
class CRYPTUI_WIZ_EXPORT_INFO extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * The size, in bytes, of this structure.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to a null-terminated Unicode string that contains the fully qualified file name to export to. If this member is
     * not <b>NULL</b> and the <b>CRYPTUI_WIZ_NO_UI</b> flag in the <i>dwFlags</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/cryptuiapi/nf-cryptuiapi-cryptuiwizexport">CryptUIWizExport</a> function is not set, this string is
     * displayed to the user as the default file name. This member is required if the <b>CRYPTUI_WIZ_NO_UI</b> flag is set.  This member is otherwise optional.
     * @type {Pointer<PWSTR>}
     */
    pwszExportFileName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * 
     * @type {Integer}
     */
    dwSubjectChoice {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Pointer<CERT_CONTEXT>}
     */
    pCertContext {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<CTL_CONTEXT>}
     */
    pCTLContext {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<CRL_CONTEXT>}
     */
    pCRLContext {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<HCERTSTORE>}
     */
    hCertStore {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * The number of elements in the <b>rghStores</b> array.
     * @type {Integer}
     */
    cStores {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * An array of extra certificate stores to search for certificates in the trust chain if the chain is being exported with a certificate.
     * This member is ignored if <b>dwSubjectChoice</b> is anything other than the   <b>CRYPTUI_WIZ_EXPORT_CERT_CONTEXT</b> value. The <b>cStores</b> member contains the number of elements in this array.
     * @type {Pointer<HCERTSTORE>}
     */
    rghStores {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
