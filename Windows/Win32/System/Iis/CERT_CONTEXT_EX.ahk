#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Security\Cryptography\CERT_CONTEXT.ahk

/**
 * @namespace Windows.Win32.System.Iis
 * @version v4.0.30319
 */
class CERT_CONTEXT_EX extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {CERT_CONTEXT}
     */
    CertContext{
        get {
            if(!this.HasProp("__CertContext"))
                this.__CertContext := CERT_CONTEXT(this.ptr + 0)
            return this.__CertContext
        }
    }

    /**
     * @type {Integer}
     */
    cbAllocated {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    dwCertificateFlags {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }
}
