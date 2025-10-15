#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CARD_DERIVE_KEY extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {PWSTR}
     */
    pwszKDF{
        get {
            if(!this.HasProp("__pwszKDF"))
                this.__pwszKDF := PWSTR(this.ptr + 8)
            return this.__pwszKDF
        }
    }

    /**
     * @type {Integer}
     */
    bSecretAgreementIndex {
        get => NumGet(this, 16, "char")
        set => NumPut("char", value, this, 16)
    }

    /**
     * @type {Pointer<Void>}
     */
    pParameterList {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<Byte>}
     */
    pbDerivedKey {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    cbDerivedKey {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {PWSTR}
     */
    pwszAlgId{
        get {
            if(!this.HasProp("__pwszAlgId"))
                this.__pwszAlgId := PWSTR(this.ptr + 48)
            return this.__pwszAlgId
        }
    }

    /**
     * @type {Integer}
     */
    dwKeyLen {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Pointer}
     */
    hKey {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }
}
