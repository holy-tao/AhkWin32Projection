#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class FLOATING_SAVE_AREA extends Win32Struct
{
    static sizeof => 112

    static packingSize => 4

    /**
     * @type {Integer}
     */
    ControlWord {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    StatusWord {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    TagWord {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    ErrorOffset {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    ErrorSelector {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    DataOffset {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    DataSelector {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Array<Byte>}
     */
    RegisterArea{
        get {
            if(!this.HasProp("__RegisterAreaProxyArray"))
                this.__RegisterAreaProxyArray := Win32FixedArray(this.ptr + 28, 80, Primitive, "char")
            return this.__RegisterAreaProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    Spare0 {
        get => NumGet(this, 108, "uint")
        set => NumPut("uint", value, this, 108)
    }
}
