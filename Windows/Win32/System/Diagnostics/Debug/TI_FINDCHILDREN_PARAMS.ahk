#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains type index information. It is used by the SymGetTypeInfo function.
 * @see https://learn.microsoft.com/windows/win32/api/dbghelp/ns-dbghelp-ti_findchildren_params
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class TI_FINDCHILDREN_PARAMS extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * The number of children.
     * @type {Integer}
     */
    Count {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The zero-based index of the child from which the child indexes are to be retrieved. For example, in an array with five elements, if Start is two, this indicates the third array element. In most cases, this member is zero.
     * @type {Integer}
     */
    Start {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * An array of type indexes. There is one index per child.
     * @type {Array<UInt32>}
     */
    ChildId{
        get {
            if(!this.HasProp("__ChildIdProxyArray"))
                this.__ChildIdProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "uint")
            return this.__ChildIdProxyArray
        }
    }
}
