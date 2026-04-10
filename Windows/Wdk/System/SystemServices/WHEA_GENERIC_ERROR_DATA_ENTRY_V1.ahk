#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WHEA_ERROR_SEVERITY.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class WHEA_GENERIC_ERROR_DATA_ENTRY_V1 extends Win32Struct {
    static sizeof => 64

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    SectionType {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {WHEA_ERROR_SEVERITY}
     */
    ErrorSeverity {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Pointer}
     */
    Revision {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    ValidBits {
        get => NumGet(this, 24, "char")
        set => NumPut("char", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 25, "char")
        set => NumPut("char", value, this, 25)
    }

    /**
     * @type {Integer}
     */
    ErrorDataLength {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Pointer}
     */
    FRUId {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Array<Integer>}
     */
    FRUText {
        get {
            if(!this.HasProp("__FRUTextProxyArray"))
                this.__FRUTextProxyArray := Win32FixedArray(this.ptr + 40, 20, Primitive, "char")
            return this.__FRUTextProxyArray
        }
    }

    /**
     * @type {Array<Integer>}
     */
    Data {
        get {
            if(!this.HasProp("__DataProxyArray"))
                this.__DataProxyArray := Win32FixedArray(this.ptr + 60, 1, Primitive, "char")
            return this.__DataProxyArray
        }
    }
}
