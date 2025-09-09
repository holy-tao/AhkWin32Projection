#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Struct.ahk
#Include .\PROFILER_HEAP_OBJECT_RELATIONSHIP.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class PROFILER_HEAP_OBJECT_RELATIONSHIP_LIST extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    count {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<PROFILER_HEAP_OBJECT_RELATIONSHIP>}
     */
    elements{
        get {
            if(!this.HasProp("__elementsProxyArray"))
                this.__elementsProxyArray := Win32FixedArray(this.ptr + 8, 1, PROFILER_HEAP_OBJECT_RELATIONSHIP, "")
            return this.__elementsProxyArray
        }
    }
}
