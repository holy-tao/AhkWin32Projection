#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WHV_SVM_VMCB_SELECTOR.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @architecture X64, Arm64
 */
class WHV_SVM_NESTED_HOST_STATE extends Win32Struct {
    static sizeof => 216

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Rip {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Rsp {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Rflags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    Rax {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {WHV_SVM_VMCB_SELECTOR}
     */
    Es {
        get {
            if(!this.HasProp("__Es"))
                this.__Es := WHV_SVM_VMCB_SELECTOR(32, this)
            return this.__Es
        }
    }

    /**
     * @type {WHV_SVM_VMCB_SELECTOR}
     */
    Cs {
        get {
            if(!this.HasProp("__Cs"))
                this.__Cs := WHV_SVM_VMCB_SELECTOR(48, this)
            return this.__Cs
        }
    }

    /**
     * @type {WHV_SVM_VMCB_SELECTOR}
     */
    Ss {
        get {
            if(!this.HasProp("__Ss"))
                this.__Ss := WHV_SVM_VMCB_SELECTOR(64, this)
            return this.__Ss
        }
    }

    /**
     * @type {WHV_SVM_VMCB_SELECTOR}
     */
    Ds {
        get {
            if(!this.HasProp("__Ds"))
                this.__Ds := WHV_SVM_VMCB_SELECTOR(80, this)
            return this.__Ds
        }
    }

    /**
     * @type {WHV_SVM_VMCB_SELECTOR}
     */
    Gdtr {
        get {
            if(!this.HasProp("__Gdtr"))
                this.__Gdtr := WHV_SVM_VMCB_SELECTOR(96, this)
            return this.__Gdtr
        }
    }

    /**
     * @type {WHV_SVM_VMCB_SELECTOR}
     */
    Idtr {
        get {
            if(!this.HasProp("__Idtr"))
                this.__Idtr := WHV_SVM_VMCB_SELECTOR(112, this)
            return this.__Idtr
        }
    }

    /**
     * @type {Integer}
     */
    Efer {
        get => NumGet(this, 128, "uint")
        set => NumPut("uint", value, this, 128)
    }

    /**
     * @type {Integer}
     */
    Cr0 {
        get => NumGet(this, 136, "uint")
        set => NumPut("uint", value, this, 136)
    }

    /**
     * @type {Integer}
     */
    Cr3 {
        get => NumGet(this, 144, "uint")
        set => NumPut("uint", value, this, 144)
    }

    /**
     * @type {Integer}
     */
    Cr4 {
        get => NumGet(this, 152, "uint")
        set => NumPut("uint", value, this, 152)
    }

    /**
     * @type {Integer}
     */
    VirtualTpr {
        get => NumGet(this, 160, "uint")
        set => NumPut("uint", value, this, 160)
    }

    /**
     * @type {Array<Integer>}
     */
    Reserved {
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 168, 6, Primitive, "uint")
            return this.__ReservedProxyArray
        }
    }
}
