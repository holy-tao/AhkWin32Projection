#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\FILETIME.ahk
#Include ..\..\..\Foundation\PSTR.ahk

/**
 * Represents an X.509 certificate.
 * @see https://docs.microsoft.com/windows/win32/api//schannel/ns-schannel-x509certificate
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class X509Certificate extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * The X.509 version number.
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The serial number of the certificate.
     * @type {Array<UInt32>}
     */
    SerialNumber{
        get {
            if(!this.HasProp("__SerialNumberProxyArray"))
                this.__SerialNumberProxyArray := Win32FixedArray(this.ptr + 4, 4, Primitive, "uint")
            return this.__SerialNumberProxyArray
        }
    }

    /**
     * The ID of the algorithm used to create the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/d-gly">digital signature</a> for the certificate.
     * @type {Integer}
     */
    SignatureAlgorithm {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * The beginning of the period of validity for the certificate.
     * @type {FILETIME}
     */
    ValidFrom{
        get {
            if(!this.HasProp("__ValidFrom"))
                this.__ValidFrom := FILETIME(this.ptr + 24)
            return this.__ValidFrom
        }
    }

    /**
     * The end of the period of validity for the certificate.
     * @type {FILETIME}
     */
    ValidUntil{
        get {
            if(!this.HasProp("__ValidUntil"))
                this.__ValidUntil := FILETIME(this.ptr + 32)
            return this.__ValidUntil
        }
    }

    /**
     * A pointer to a string that specifies the issuer of the certificate.
     * @type {PSTR}
     */
    pszIssuer{
        get {
            if(!this.HasProp("__pszIssuer"))
                this.__pszIssuer := PSTR(this.ptr + 40)
            return this.__pszIssuer
        }
    }

    /**
     * A pointer to a string that specifies the subject of the certificate.
     * @type {PSTR}
     */
    pszSubject{
        get {
            if(!this.HasProp("__pszSubject"))
                this.__pszSubject := PSTR(this.ptr + 48)
            return this.__pszSubject
        }
    }

    /**
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">public key</a> used to create the signature for the certificate.
     * @type {Pointer<PctPublicKey>}
     */
    pPublicKey {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }
}
