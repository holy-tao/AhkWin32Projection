#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
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
                this.__recipient := ENDPOINTADDRESS(this.ptr + 0)
            return this.__recipient
        }
    }

    /**
     * @type {ENDPOINTADDRESS}
     */
    issuer{
        get {
            if(!this.HasProp("__issuer"))
                this.__issuer := ENDPOINTADDRESS(this.ptr + 32)
            return this.__issuer
        }
    }

    /**
     * @type {PWSTR}
     */
    tokenType{
        get {
            if(!this.HasProp("__tokenType"))
                this.__tokenType := PWSTR(this.ptr + 64)
            return this.__tokenType
        }
    }

    /**
     * @type {CLAIMLIST}
     */
    requiredClaims{
        get {
            if(!this.HasProp("__requiredClaims"))
                this.__requiredClaims := CLAIMLIST(this.ptr + 72)
            return this.__requiredClaims
        }
    }

    /**
     * @type {CLAIMLIST}
     */
    optionalClaims{
        get {
            if(!this.HasProp("__optionalClaims"))
                this.__optionalClaims := CLAIMLIST(this.ptr + 88)
            return this.__optionalClaims
        }
    }

    /**
     * @type {PWSTR}
     */
    privacyUrl{
        get {
            if(!this.HasProp("__privacyUrl"))
                this.__privacyUrl := PWSTR(this.ptr + 104)
            return this.__privacyUrl
        }
    }

    /**
     * @type {Integer}
     */
    privacyVersion {
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }
}
