#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Cryptography\CRYPT_INTEGER_BLOB.ahk

/**
 * @namespace Windows.Win32.Security.WinTrust
 */
class SPC_SERIALIZED_OBJECT extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Array<Integer>}
     */
    ClassId {
        get {
            if(!this.HasProp("__ClassIdProxyArray"))
                this.__ClassIdProxyArray := Win32FixedArray(this.ptr + 0, 16, Primitive, "char")
            return this.__ClassIdProxyArray
        }
    }

    /**
     * @type {CRYPT_INTEGER_BLOB}
     */
    SerializedData {
        get {
            if(!this.HasProp("__SerializedData"))
                this.__SerializedData := CRYPT_INTEGER_BLOB(16, this)
            return this.__SerializedData
        }
    }
}
