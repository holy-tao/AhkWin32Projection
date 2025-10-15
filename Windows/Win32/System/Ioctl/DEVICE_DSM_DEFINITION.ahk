#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class DEVICE_DSM_DEFINITION extends Win32Struct
{
    static sizeof => 28

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Action {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {BOOLEAN}
     */
    SingleRange{
        get {
            if(!this.HasProp("__SingleRange"))
                this.__SingleRange := BOOLEAN(this.ptr + 4)
            return this.__SingleRange
        }
    }

    /**
     * @type {Integer}
     */
    ParameterBlockAlignment {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    ParameterBlockLength {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {BOOLEAN}
     */
    HasOutput{
        get {
            if(!this.HasProp("__HasOutput"))
                this.__HasOutput := BOOLEAN(this.ptr + 16)
            return this.__HasOutput
        }
    }

    /**
     * @type {Integer}
     */
    OutputBlockAlignment {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    OutputBlockLength {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
