#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
class KERB_DECRYPT_RESPONSE extends Win32Struct {
    static sizeof => 1

    static packingSize => 1

    /**
     * @type {Array<Integer>}
     */
    DecryptedData {
        get {
            if(!this.HasProp("__DecryptedDataProxyArray"))
                this.__DecryptedDataProxyArray := Win32FixedArray(this.ptr + 0, 1, Primitive, "char")
            return this.__DecryptedDataProxyArray
        }
    }
}
