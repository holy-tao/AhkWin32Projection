#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WHV_CACHE_TYPE.ahk
#Include .\WHV_INPUT_VTL.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @architecture X64, Arm64
 */
class WHV_ACCESS_GPA_CONTROLS extends Win32Struct {
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    AsUINT64 {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {WHV_CACHE_TYPE}
     */
    CacheType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {WHV_INPUT_VTL}
     */
    InputVtl {
        get {
            if(!this.HasProp("__InputVtl"))
                this.__InputVtl := WHV_INPUT_VTL(4, this)
            return this.__InputVtl
        }
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 6, "char")
        set => NumPut("char", value, this, 6)
    }

    /**
     * @type {Integer}
     */
    Reserved1 {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }
}
