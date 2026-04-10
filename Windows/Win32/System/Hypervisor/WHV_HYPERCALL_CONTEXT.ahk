#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WHV_UINT128.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
class WHV_HYPERCALL_CONTEXT extends Win32Struct {
    static sizeof => 272

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Rax {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Rbx {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Rcx {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    Rdx {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    R8 {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    Rsi {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    Rdi {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    Reserved0 {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {WHV_UINT128}
     */
    XmmRegisters {
        get {
            if(!this.HasProp("__XmmRegistersProxyArray"))
                this.__XmmRegistersProxyArray := Win32FixedArray(this.ptr + 64, 6, WHV_UINT128, "")
            return this.__XmmRegistersProxyArray
        }
    }

    /**
     * @type {Array<Integer>}
     */
    Reserved1 {
        get {
            if(!this.HasProp("__Reserved1ProxyArray"))
                this.__Reserved1ProxyArray := Win32FixedArray(this.ptr + 256, 2, Primitive, "uint")
            return this.__Reserved1ProxyArray
        }
    }
}
