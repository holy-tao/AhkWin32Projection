#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.IscsiDisc
 * @version v4.0.30319
 */
class IDE_IO_CONTROL extends Win32Struct
{
    static sizeof => 28

    static packingSize => 4

    /**
     * @type {Integer}
     */
    HeaderLength {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<Byte>}
     */
    Signature{
        get {
            if(!this.HasProp("__SignatureProxyArray"))
                this.__SignatureProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "char")
            return this.__SignatureProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    Timeout {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    ControlCode {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    ReturnStatus {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    DataLength {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
