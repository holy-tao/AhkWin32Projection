#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\WHEA_ERROR_SEVERITY.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class WHEA_ERROR_RECORD_SECTION_DESCRIPTOR extends Win32Struct {
    static sizeof => 96

    static packingSize => 8

    /**
     * @type {Integer}
     */
    SectionOffset {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    SectionLength {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Pointer}
     */
    Revision {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer}
     */
    ValidBits {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 24, "char")
        set => NumPut("char", value, this, 24)
    }

    /**
     * @type {Pointer}
     */
    Flags {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Guid}
     */
    SectionType {
        get {
            if(!this.HasProp("__SectionType"))
                this.__SectionType := Guid(40, this)
            return this.__SectionType
        }
    }

    /**
     * @type {Guid}
     */
    FRUId {
        get {
            if(!this.HasProp("__FRUId"))
                this.__FRUId := Guid(56, this)
            return this.__FRUId
        }
    }

    /**
     * @type {WHEA_ERROR_SEVERITY}
     */
    SectionSeverity {
        get => NumGet(this, 72, "int")
        set => NumPut("int", value, this, 72)
    }

    /**
     * @type {Array<Integer>}
     */
    FRUText {
        get {
            if(!this.HasProp("__FRUTextProxyArray"))
                this.__FRUTextProxyArray := Win32FixedArray(this.ptr + 76, 20, Primitive, "char")
            return this.__FRUTextProxyArray
        }
    }
}
