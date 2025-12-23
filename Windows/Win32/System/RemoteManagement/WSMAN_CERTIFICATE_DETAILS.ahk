#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Stores client information for an inbound request that was sent with a client certificate.
 * @see https://learn.microsoft.com/windows/win32/api/wsman/ns-wsman-wsman_certificate_details
 * @namespace Windows.Win32.System.RemoteManagement
 * @version v4.0.30319
 */
class WSMAN_CERTIFICATE_DETAILS extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Specifies the subject that is identified by the certificate.
     * @type {PWSTR}
     */
    subject {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Specifies the name of the issuer of the certificate.
     * @type {PWSTR}
     */
    issuerName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Specifies the thumbprint of the issuer.
     * @type {PWSTR}
     */
    issuerThumbprint {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Specifies the subject name of the issuer.
     * @type {PWSTR}
     */
    subjectName {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
