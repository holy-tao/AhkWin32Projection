#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\STORAGE_PROPERTY_ID.ahk
#Include .\STORAGE_SET_TYPE.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class STORAGE_PROPERTY_SET extends Win32Struct {
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {STORAGE_PROPERTY_ID}
     */
    PropertyId {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {STORAGE_SET_TYPE}
     */
    SetType {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Array<Integer>}
     */
    AdditionalParameters {
        get {
            if(!this.HasProp("__AdditionalParametersProxyArray"))
                this.__AdditionalParametersProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "char")
            return this.__AdditionalParametersProxyArray
        }
    }
}
