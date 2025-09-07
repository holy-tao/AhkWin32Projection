#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class ENCRYPTION_BUFFER extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Integer}
     */
    EncryptionOperation {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<Byte>}
     */
    Private{
        get {
            if(!this.HasProp("__PrivateProxyArray"))
                this.__PrivateProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "char")
            return this.__PrivateProxyArray
        }
    }
}
