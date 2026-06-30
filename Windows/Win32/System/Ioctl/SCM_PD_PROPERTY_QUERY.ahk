#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SCM_PD_QUERY_TYPE.ahk
#Include .\SCM_PD_PROPERTY_ID.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class SCM_PD_PROPERTY_QUERY extends Win32Struct {
    static sizeof => 20

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {SCM_PD_PROPERTY_ID}
     */
    PropertyId {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {SCM_PD_QUERY_TYPE}
     */
    QueryType {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {Array<Integer>}
     */
    AdditionalParameters {
        get {
            if(!this.HasProp("__AdditionalParametersProxyArray"))
                this.__AdditionalParametersProxyArray := Win32FixedArray(this.ptr + 16, 1, Primitive, "char")
            return this.__AdditionalParametersProxyArray
        }
    }
}
