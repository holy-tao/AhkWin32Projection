#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains information about the certificate store used by the digital signature wizard.
 * @see https://learn.microsoft.com/windows/win32/api/cryptuiapi/ns-cryptuiapi-cryptui_wiz_digital_sign_store_info
 * @namespace Windows.Win32.Security.Cryptography.UI
 * @version v4.0.30319
 */
class CRYPTUI_WIZ_DIGITAL_SIGN_STORE_INFO extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The size, in bytes, of the structure. This value must be set to <c>sizeof(CRYPTUI_WIZ_DIGITAL_SIGN_STORE_INFO)</c>.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Number of certificates in the <b>rghCertStore</b> member.
     * @type {Integer}
     */
    cCertStore {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A pointer to a handle to the certificate store that will be used by the digital signature wizard.
     * @type {Pointer<HCERTSTORE>}
     */
    rghCertStore {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Filter callback function used to display the certificate.
     * @type {Pointer<PFNCFILTERPROC>}
     */
    pFilterCallback {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A pointer to the callback data.
     * @type {Pointer<Void>}
     */
    pvCallbackData {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
