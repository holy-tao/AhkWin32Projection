#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\HCERTSTORE.ahk" { HCERTSTORE }

/**
 * Contains information about the certificate store used by the digital signature wizard.
 * @see https://learn.microsoft.com/windows/win32/api/cryptuiapi/ns-cryptuiapi-cryptui_wiz_digital_sign_store_info
 * @namespace Windows.Win32.Security.Cryptography.UI
 */
export default struct CRYPTUI_WIZ_DIGITAL_SIGN_STORE_INFO {
    #StructPack 8

    /**
     * The size, in bytes, of the structure. This value must be set to <c>sizeof(CRYPTUI_WIZ_DIGITAL_SIGN_STORE_INFO)</c>.
     */
    dwSize : UInt32

    /**
     * Number of certificates in the <b>rghCertStore</b> member.
     */
    cCertStore : UInt32

    /**
     * A pointer to a handle to the certificate store that will be used by the digital signature wizard.
     */
    rghCertStore : HCERTSTORE.Ptr

    /**
     * Filter callback function used to display the certificate.
     */
    pFilterCallback : IntPtr

    /**
     * A pointer to the callback data.
     */
    pvCallbackData : IntPtr

}
