#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Cryptography\CRYPT_INTEGER_BLOB.ahk

/**
 * @namespace Windows.Win32.Security.WinTrust
 * @version v4.0.30319
 */
class SPC_SERIALIZED_OBJECT extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Array<Byte>}
     */
    ClassId{
        get {
            if(!this.HasProp("__ClassIdProxyArray"))
                this.__ClassIdProxyArray := Win32FixedArray(this.ptr + 0, 1, Primitive, "char")
            return this.__ClassIdProxyArray
        }
    }

    /**
     * @type {CRYPT_INTEGER_BLOB}
     */
    SerializedData{
        get {
            if(!this.HasProp("__SerializedData"))
                this.__SerializedData := CRYPT_INTEGER_BLOB(this.ptr + 16)
            return this.__SerializedData
        }
    }
}
