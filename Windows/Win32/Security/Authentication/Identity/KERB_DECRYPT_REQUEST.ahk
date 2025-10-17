#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\LUID.ahk
#Include .\KERB_CRYPTO_KEY.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class KERB_DECRYPT_REQUEST extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {Integer}
     */
    MessageType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {LUID}
     */
    LogonId{
        get {
            if(!this.HasProp("__LogonId"))
                this.__LogonId := LUID(8, this)
            return this.__LogonId
        }
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    CryptoType {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    KeyUsage {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * @type {KERB_CRYPTO_KEY}
     */
    Key{
        get {
            if(!this.HasProp("__Key"))
                this.__Key := KERB_CRYPTO_KEY(32, this)
            return this.__Key
        }
    }

    /**
     * @type {Integer}
     */
    EncryptedDataSize {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    InitialVectorSize {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * @type {Pointer<Byte>}
     */
    InitialVector {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Pointer<Byte>}
     */
    EncryptedData {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }
}
