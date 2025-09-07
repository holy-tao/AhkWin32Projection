#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\SE_ADT_PARAMETER_ARRAY_ENTRY.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SE_ADT_PARAMETER_ARRAY_EX extends Win32Struct
{
    static sizeof => 288

    static packingSize => 8

    /**
     * @type {Integer}
     */
    CategoryId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    AuditId {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    ParameterCount {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    FlatSubCategoryId {
        get => NumGet(this, 20, "ushort")
        set => NumPut("ushort", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 22, "ushort")
        set => NumPut("ushort", value, this, 22)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Array<SE_ADT_PARAMETER_ARRAY_ENTRY>}
     */
    Parameters{
        get {
            if(!this.HasProp("__ParametersProxyArray"))
                this.__ParametersProxyArray := Win32FixedArray(this.ptr + 32, 8, SE_ADT_PARAMETER_ARRAY_ENTRY, "")
            return this.__ParametersProxyArray
        }
    }
}
