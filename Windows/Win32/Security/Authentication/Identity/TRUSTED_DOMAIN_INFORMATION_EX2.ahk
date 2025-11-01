#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\LSA_UNICODE_STRING.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class TRUSTED_DOMAIN_INFORMATION_EX2 extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * @type {LSA_UNICODE_STRING}
     */
    Name{
        get {
            if(!this.HasProp("__Name"))
                this.__Name := LSA_UNICODE_STRING(0, this)
            return this.__Name
        }
    }

    /**
     * @type {LSA_UNICODE_STRING}
     */
    FlatName{
        get {
            if(!this.HasProp("__FlatName"))
                this.__FlatName := LSA_UNICODE_STRING(16, this)
            return this.__FlatName
        }
    }

    /**
     * @type {PSID}
     */
    Sid {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    TrustDirection {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    TrustType {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * @type {Integer}
     */
    TrustAttributes {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    ForestTrustLength {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * @type {Pointer<Integer>}
     */
    ForestTrustInfo {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }
}
