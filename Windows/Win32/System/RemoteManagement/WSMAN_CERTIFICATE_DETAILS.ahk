#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

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
    subject{
        get {
            if(!this.HasProp("__subject"))
                this.__subject := PWSTR(this.ptr + 0)
            return this.__subject
        }
    }

    /**
     * Specifies the name of the issuer of the certificate.
     * @type {PWSTR}
     */
    issuerName{
        get {
            if(!this.HasProp("__issuerName"))
                this.__issuerName := PWSTR(this.ptr + 8)
            return this.__issuerName
        }
    }

    /**
     * Specifies the thumbprint of the issuer.
     * @type {PWSTR}
     */
    issuerThumbprint{
        get {
            if(!this.HasProp("__issuerThumbprint"))
                this.__issuerThumbprint := PWSTR(this.ptr + 16)
            return this.__issuerThumbprint
        }
    }

    /**
     * Specifies the subject name of the issuer.
     * @type {PWSTR}
     */
    subjectName{
        get {
            if(!this.HasProp("__subjectName"))
                this.__subjectName := PWSTR(this.ptr + 24)
            return this.__subjectName
        }
    }
}
