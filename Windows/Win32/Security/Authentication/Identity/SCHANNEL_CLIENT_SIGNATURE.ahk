#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Specifies a client signature when a call to the InitializeSecurityContext (Schannel) function cannot access the private key for a client certificate (in this case, the function returns SEC_I_SIGNATURE_NEEDED).
 * @remarks
 * Add a client signature to a client context by using this structure as the value of the <i>pInput</i> parameter in a call to the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-applycontroltoken">ApplyControlToken</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/schannel/ns-schannel-schannel_client_signature
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SCHANNEL_CLIENT_SIGNATURE extends Win32Struct
{
    static sizeof => 68

    static packingSize => 4

    /**
     * The size, in bytes, of this structure.
     * @type {Integer}
     */
    cbLength {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The ID of the algorithm used to compute the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/h-gly">hash</a> of the certificate.
     * @type {Integer}
     */
    aiHash {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The size, in bytes, of the <b>HashValue</b> array.
     * @type {Integer}
     */
    cbHash {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * An array of byte values that specify the hash of the certificate.
     * @type {Array<Byte>}
     */
    HashValue{
        get {
            if(!this.HasProp("__HashValueProxyArray"))
                this.__HashValueProxyArray := Win32FixedArray(this.ptr + 12, 36, Primitive, "char")
            return this.__HashValueProxyArray
        }
    }

    /**
     * An array of byte values that specify the certificate thumbprint.
     * @type {Array<Byte>}
     */
    CertThumbprint{
        get {
            if(!this.HasProp("__CertThumbprintProxyArray"))
                this.__CertThumbprintProxyArray := Win32FixedArray(this.ptr + 48, 20, Primitive, "char")
            return this.__CertThumbprintProxyArray
        }
    }
}
