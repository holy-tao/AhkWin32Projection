#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Security\Cryptography\HCERTSTORE.ahk

/**
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class WSD_SECURITY_CERT_VALIDATION_V1 extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Pointer<CERT_CONTEXT>}
     */
    certMatchArray {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwCertMatchArrayCount {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {HCERTSTORE}
     */
    hCertMatchStore{
        get {
            if(!this.HasProp("__hCertMatchStore"))
                this.__hCertMatchStore := HCERTSTORE(this.ptr + 16)
            return this.__hCertMatchStore
        }
    }

    /**
     * @type {HCERTSTORE}
     */
    hCertIssuerStore{
        get {
            if(!this.HasProp("__hCertIssuerStore"))
                this.__hCertIssuerStore := HCERTSTORE(this.ptr + 24)
            return this.__hCertIssuerStore
        }
    }

    /**
     * @type {Integer}
     */
    dwCertCheckOptions {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}
