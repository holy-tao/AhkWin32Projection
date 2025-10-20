#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class KNONVOLATILE_CONTEXT_POINTERS extends Win32Struct
{
    static sizeof => 256

    static packingSize => 8

    /**
     * @type {Array<M128A>}
     */
    FloatingContext{
        get {
            if(!this.HasProp("__FloatingContextProxyArray"))
                this.__FloatingContextProxyArray := Win32FixedArray(this.ptr + 0, 16, Primitive, "ptr")
            return this.__FloatingContextProxyArray
        }
    }

    /**
     * @type {Pointer<M128A>}
     */
    Xmm0 {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<M128A>}
     */
    Xmm1 {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<M128A>}
     */
    Xmm2 {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<M128A>}
     */
    Xmm3 {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<M128A>}
     */
    Xmm4 {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<M128A>}
     */
    Xmm5 {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<M128A>}
     */
    Xmm6 {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer<M128A>}
     */
    Xmm7 {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Pointer<M128A>}
     */
    Xmm8 {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Pointer<M128A>}
     */
    Xmm9 {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Pointer<M128A>}
     */
    Xmm10 {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * @type {Pointer<M128A>}
     */
    Xmm11 {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * @type {Pointer<M128A>}
     */
    Xmm12 {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * @type {Pointer<M128A>}
     */
    Xmm13 {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * @type {Pointer<M128A>}
     */
    Xmm14 {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * @type {Pointer<M128A>}
     */
    Xmm15 {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * @type {Array<UInt64>}
     */
    IntegerContext{
        get {
            if(!this.HasProp("__IntegerContextProxyArray"))
                this.__IntegerContextProxyArray := Win32FixedArray(this.ptr + 128, 16, Primitive, "ptr")
            return this.__IntegerContextProxyArray
        }
    }

    /**
     * @type {Pointer<Integer>}
     */
    Rax {
        get => NumGet(this, 128, "ptr")
        set => NumPut("ptr", value, this, 128)
    }

    /**
     * @type {Pointer<Integer>}
     */
    Rcx {
        get => NumGet(this, 136, "ptr")
        set => NumPut("ptr", value, this, 136)
    }

    /**
     * @type {Pointer<Integer>}
     */
    Rdx {
        get => NumGet(this, 144, "ptr")
        set => NumPut("ptr", value, this, 144)
    }

    /**
     * @type {Pointer<Integer>}
     */
    Rbx {
        get => NumGet(this, 152, "ptr")
        set => NumPut("ptr", value, this, 152)
    }

    /**
     * @type {Pointer<Integer>}
     */
    Rsp {
        get => NumGet(this, 160, "ptr")
        set => NumPut("ptr", value, this, 160)
    }

    /**
     * @type {Pointer<Integer>}
     */
    Rbp {
        get => NumGet(this, 168, "ptr")
        set => NumPut("ptr", value, this, 168)
    }

    /**
     * @type {Pointer<Integer>}
     */
    Rsi {
        get => NumGet(this, 176, "ptr")
        set => NumPut("ptr", value, this, 176)
    }

    /**
     * @type {Pointer<Integer>}
     */
    Rdi {
        get => NumGet(this, 184, "ptr")
        set => NumPut("ptr", value, this, 184)
    }

    /**
     * @type {Pointer<Integer>}
     */
    R8 {
        get => NumGet(this, 192, "ptr")
        set => NumPut("ptr", value, this, 192)
    }

    /**
     * @type {Pointer<Integer>}
     */
    R9 {
        get => NumGet(this, 200, "ptr")
        set => NumPut("ptr", value, this, 200)
    }

    /**
     * @type {Pointer<Integer>}
     */
    R10 {
        get => NumGet(this, 208, "ptr")
        set => NumPut("ptr", value, this, 208)
    }

    /**
     * @type {Pointer<Integer>}
     */
    R11 {
        get => NumGet(this, 216, "ptr")
        set => NumPut("ptr", value, this, 216)
    }

    /**
     * @type {Pointer<Integer>}
     */
    R12 {
        get => NumGet(this, 224, "ptr")
        set => NumPut("ptr", value, this, 224)
    }

    /**
     * @type {Pointer<Integer>}
     */
    R13 {
        get => NumGet(this, 232, "ptr")
        set => NumPut("ptr", value, this, 232)
    }

    /**
     * @type {Pointer<Integer>}
     */
    R14 {
        get => NumGet(this, 240, "ptr")
        set => NumPut("ptr", value, this, 240)
    }

    /**
     * @type {Pointer<Integer>}
     */
    R15 {
        get => NumGet(this, 248, "ptr")
        set => NumPut("ptr", value, this, 248)
    }
}
