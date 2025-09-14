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
     * @type {Pointer<PWSTR>}
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
     * @type {Pointer<PWSTR>}
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
