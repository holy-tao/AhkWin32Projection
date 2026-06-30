#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\WHEA_ERROR_SEVERITY.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class WHEA_GENERIC_ERROR_DATA_ENTRY_V1 extends Win32Struct {
    static sizeof => 80

    static packingSize => 8

    /**
     * @type {Guid}
     */
    SectionType {
        get {
            if(!this.HasProp("__SectionType"))
                this.__SectionType := Guid(0, this)
            return this.__SectionType
        }
    }

    /**
     * @type {WHEA_ERROR_SEVERITY}
     */
    ErrorSeverity {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {Pointer}
     */
    Revision {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    ValidBits {
        get => NumGet(this, 32, "char")
        set => NumPut("char", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 33, "char")
        set => NumPut("char", value, this, 33)
    }

    /**
     * @type {Integer}
     */
    ErrorDataLength {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {Guid}
     */
    FRUId {
        get {
            if(!this.HasProp("__FRUId"))
                this.__FRUId := Guid(40, this)
            return this.__FRUId
        }
    }

    /**
     * @type {Array<Integer>}
     */
    FRUText {
        get {
            if(!this.HasProp("__FRUTextProxyArray"))
                this.__FRUTextProxyArray := Win32FixedArray(this.ptr + 56, 20, Primitive, "char")
            return this.__FRUTextProxyArray
        }
    }

    /**
     * @type {Array<Integer>}
     */
    Data {
        get {
            if(!this.HasProp("__DataProxyArray"))
                this.__DataProxyArray := Win32FixedArray(this.ptr + 76, 1, Primitive, "char")
            return this.__DataProxyArray
        }
    }
}
