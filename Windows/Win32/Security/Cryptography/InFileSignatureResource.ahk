#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class InFileSignatureResource extends Win32Struct
{
    static sizeof => 96

    static packingSize => 4

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
    dwCrcOffset {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<Byte>}
     */
    rgbSignature{
        get {
            if(!this.HasProp("__rgbSignatureProxyArray"))
                this.__rgbSignatureProxyArray := Win32FixedArray(this.ptr + 8, 88, Primitive, "char")
            return this.__rgbSignatureProxyArray
        }
    }
}
