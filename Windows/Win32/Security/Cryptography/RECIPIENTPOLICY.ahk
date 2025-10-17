#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk
#Include .\ENDPOINTADDRESS.ahk
#Include .\CLAIMLIST.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class RECIPIENTPOLICY extends Win32Struct
{
    static sizeof => 120

    static packingSize => 8

    /**
     * @type {ENDPOINTADDRESS}
     */
    recipient{
        get {
            if(!this.HasProp("__recipient"))
                this.__recipient := ENDPOINTADDRESS(0, this)
            return this.__recipient
        }
    }

    /**
     * @type {ENDPOINTADDRESS}
     */
    issuer{
        get {
            if(!this.HasProp("__issuer"))
                this.__issuer := ENDPOINTADDRESS(32, this)
            return this.__issuer
        }
    }

    /**
     * @type {PWSTR}
     */
    tokenType {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {CLAIMLIST}
     */
    requiredClaims{
        get {
            if(!this.HasProp("__requiredClaims"))
                this.__requiredClaims := CLAIMLIST(72, this)
            return this.__requiredClaims
        }
    }

    /**
     * @type {CLAIMLIST}
     */
    optionalClaims{
        get {
            if(!this.HasProp("__optionalClaims"))
                this.__optionalClaims := CLAIMLIST(88, this)
            return this.__optionalClaims
        }
    }

    /**
     * @type {PWSTR}
     */
    privacyUrl {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * @type {Integer}
     */
    privacyVersion {
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }
}
