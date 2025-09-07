#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\M128A.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class XSAVE_FORMAT extends Win32Struct
{
    static sizeof => 384

    static packingSize => 8

    /**
     * @type {Integer}
     */
    ControlWord {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    StatusWord {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    TagWord {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    Reserved1 {
        get => NumGet(this, 5, "char")
        set => NumPut("char", value, this, 5)
    }

    /**
     * @type {Integer}
     */
    ErrorOpcode {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * @type {Integer}
     */
    ErrorOffset {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    ErrorSelector {
        get => NumGet(this, 12, "ushort")
        set => NumPut("ushort", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    Reserved2 {
        get => NumGet(this, 14, "ushort")
        set => NumPut("ushort", value, this, 14)
    }

    /**
     * @type {Integer}
     */
    DataOffset {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    DataSelector {
        get => NumGet(this, 20, "ushort")
        set => NumPut("ushort", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    Reserved3 {
        get => NumGet(this, 22, "ushort")
        set => NumPut("ushort", value, this, 22)
    }

    /**
     * @type {Integer}
     */
    MxCsr {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    MxCsr_Mask {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Array<M128A>}
     */
    FloatRegisters{
        get {
            if(!this.HasProp("__FloatRegistersProxyArray"))
                this.__FloatRegistersProxyArray := Win32FixedArray(this.ptr + 32, 8, M128A, "")
            return this.__FloatRegistersProxyArray
        }
    }

    /**
     * @type {Array<M128A>}
     */
    XmmRegisters{
        get {
            if(!this.HasProp("__XmmRegistersProxyArray"))
                this.__XmmRegistersProxyArray := Win32FixedArray(this.ptr + 96, 8, M128A, "")
            return this.__XmmRegistersProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved4{
        get {
            if(!this.HasProp("__Reserved4ProxyArray"))
                this.__Reserved4ProxyArray := Win32FixedArray(this.ptr + 160, 1, Primitive, "char")
            return this.__Reserved4ProxyArray
        }
    }
}
