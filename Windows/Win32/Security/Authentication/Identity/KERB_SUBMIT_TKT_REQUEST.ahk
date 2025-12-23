#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\LUID.ahk
#Include .\KERB_CRYPTO_KEY32.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class KERB_SUBMIT_TKT_REQUEST extends Win32Struct
{
    static sizeof => 36

    static packingSize => 4

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
                this.__LogonId := LUID(4, this)
            return this.__LogonId
        }
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {KERB_CRYPTO_KEY32}
     */
    Key{
        get {
            if(!this.HasProp("__Key"))
                this.__Key := KERB_CRYPTO_KEY32(16, this)
            return this.__Key
        }
    }

    /**
     * @type {Integer}
     */
    KerbCredSize {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    KerbCredOffset {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}
