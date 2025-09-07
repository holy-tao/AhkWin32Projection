#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\SE_ADT_PARAMETER_ARRAY_ENTRY.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SE_ADT_PARAMETER_ARRAY extends Win32Struct
{
    static sizeof => 280

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
    ParameterCount {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    FlatSubCategoryId {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 18, "ushort")
        set => NumPut("ushort", value, this, 18)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Array<SE_ADT_PARAMETER_ARRAY_ENTRY>}
     */
    Parameters{
        get {
            if(!this.HasProp("__ParametersProxyArray"))
                this.__ParametersProxyArray := Win32FixedArray(this.ptr + 24, 8, SE_ADT_PARAMETER_ARRAY_ENTRY, "")
            return this.__ParametersProxyArray
        }
    }
}
