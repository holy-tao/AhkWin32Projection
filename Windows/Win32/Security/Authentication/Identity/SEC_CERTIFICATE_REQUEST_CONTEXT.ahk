#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-sec_certificate_request_context
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SEC_CERTIFICATE_REQUEST_CONTEXT extends Win32Struct
{
    static sizeof => 2

    static packingSize => 1

    /**
     * @type {Integer}
     */
    cbCertificateRequestContext {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Array<Byte>}
     */
    rgCertificateRequestContext{
        get {
            if(!this.HasProp("__rgCertificateRequestContextProxyArray"))
                this.__rgCertificateRequestContextProxyArray := Win32FixedArray(this.ptr + 1, 1, Primitive, "char")
            return this.__rgCertificateRequestContextProxyArray
        }
    }
}
