#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Cryptography\CRYPT_INTEGER_BLOB.ahk

/**
 * @namespace Windows.Win32.Security.WinTrust
 * @version v4.0.30319
 */
class SEALING_TIMESTAMP_ATTRIBUTE extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    signerIndex {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {CRYPT_INTEGER_BLOB}
     */
    sealTimeStampToken{
        get {
            if(!this.HasProp("__sealTimeStampToken"))
                this.__sealTimeStampToken := CRYPT_INTEGER_BLOB(this.ptr + 8)
            return this.__sealTimeStampToken
        }
    }
}
