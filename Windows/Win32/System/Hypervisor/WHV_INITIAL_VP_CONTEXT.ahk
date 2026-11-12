#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WHV_X64_SEGMENT_REGISTER.ahk
#Include .\WHV_X64_TABLE_REGISTER.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @architecture X64
 */
class WHV_INITIAL_VP_CONTEXT extends Win32Struct {
    static sizeof => 224

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
     * @type {WHV_X64_SEGMENT_REGISTER}
     */
    Cs {
        get {
            if(!this.HasProp("__Cs"))
                this.__Cs := WHV_X64_SEGMENT_REGISTER(24, this)
            return this.__Cs
        }
    }

    /**
     * @type {WHV_X64_SEGMENT_REGISTER}
     */
    Ds {
        get {
            if(!this.HasProp("__Ds"))
                this.__Ds := WHV_X64_SEGMENT_REGISTER(40, this)
            return this.__Ds
        }
    }

    /**
     * @type {WHV_X64_SEGMENT_REGISTER}
     */
    Es {
        get {
            if(!this.HasProp("__Es"))
                this.__Es := WHV_X64_SEGMENT_REGISTER(56, this)
            return this.__Es
        }
    }

    /**
     * @type {WHV_X64_SEGMENT_REGISTER}
     */
    Fs {
        get {
            if(!this.HasProp("__Fs"))
                this.__Fs := WHV_X64_SEGMENT_REGISTER(72, this)
            return this.__Fs
        }
    }

    /**
     * @type {WHV_X64_SEGMENT_REGISTER}
     */
    Gs {
        get {
            if(!this.HasProp("__Gs"))
                this.__Gs := WHV_X64_SEGMENT_REGISTER(88, this)
            return this.__Gs
        }
    }

    /**
     * @type {WHV_X64_SEGMENT_REGISTER}
     */
    Ss {
        get {
            if(!this.HasProp("__Ss"))
                this.__Ss := WHV_X64_SEGMENT_REGISTER(104, this)
            return this.__Ss
        }
    }

    /**
     * @type {WHV_X64_SEGMENT_REGISTER}
     */
    Tr {
        get {
            if(!this.HasProp("__Tr"))
                this.__Tr := WHV_X64_SEGMENT_REGISTER(120, this)
            return this.__Tr
        }
    }

    /**
     * @type {WHV_X64_SEGMENT_REGISTER}
     */
    Ldtr {
        get {
            if(!this.HasProp("__Ldtr"))
                this.__Ldtr := WHV_X64_SEGMENT_REGISTER(136, this)
            return this.__Ldtr
        }
    }

    /**
     * @type {WHV_X64_TABLE_REGISTER}
     */
    Idtr {
        get {
            if(!this.HasProp("__Idtr"))
                this.__Idtr := WHV_X64_TABLE_REGISTER(152, this)
            return this.__Idtr
        }
    }

    /**
     * @type {WHV_X64_TABLE_REGISTER}
     */
    Gdtr {
        get {
            if(!this.HasProp("__Gdtr"))
                this.__Gdtr := WHV_X64_TABLE_REGISTER(168, this)
            return this.__Gdtr
        }
    }

    /**
     * @type {Integer}
     */
    Efer {
        get => NumGet(this, 184, "uint")
        set => NumPut("uint", value, this, 184)
    }

    /**
     * @type {Integer}
     */
    Cr0 {
        get => NumGet(this, 192, "uint")
        set => NumPut("uint", value, this, 192)
    }

    /**
     * @type {Integer}
     */
    Cr3 {
        get => NumGet(this, 200, "uint")
        set => NumPut("uint", value, this, 200)
    }

    /**
     * @type {Integer}
     */
    Cr4 {
        get => NumGet(this, 208, "uint")
        set => NumPut("uint", value, this, 208)
    }

    /**
     * @type {Integer}
     */
    MsrCrPat {
        get => NumGet(this, 216, "uint")
        set => NumPut("uint", value, this, 216)
    }
}
