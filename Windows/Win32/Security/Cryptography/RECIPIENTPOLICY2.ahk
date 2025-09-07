#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\ENDPOINTADDRESS2.ahk
#Include .\CLAIMLIST.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class RECIPIENTPOLICY2 extends Win32Struct
{
    static sizeof => 120

    static packingSize => 8

    /**
     * @type {ENDPOINTADDRESS2}
     */
    recipient{
        get {
            if(!this.HasProp("__recipient"))
                this.__recipient := ENDPOINTADDRESS2(this.ptr + 0)
            return this.__recipient
        }
    }

    /**
     * @type {ENDPOINTADDRESS2}
     */
    issuer{
        get {
            if(!this.HasProp("__issuer"))
                this.__issuer := ENDPOINTADDRESS2(this.ptr + 32)
            return this.__issuer
        }
    }

    /**
     * @type {Pointer<Ptr>}
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
     * @type {Pointer<Ptr>}
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
