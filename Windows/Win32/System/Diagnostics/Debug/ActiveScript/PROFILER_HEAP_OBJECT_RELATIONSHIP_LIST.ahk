#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Struct.ahk
#Include .\PROFILER_HEAP_OBJECT_RELATIONSHIP.ahk
#Include .\PROFILER_RELATIONSHIP_INFO.ahk
#Include ..\..\..\..\Foundation\BSTR.ahk
#Include .\PROFILER_PROPERTY_TYPE_SUBSTRING_INFO.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
class PROFILER_HEAP_OBJECT_RELATIONSHIP_LIST extends Win32Struct {
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    count {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {PROFILER_HEAP_OBJECT_RELATIONSHIP}
     */
    elements {
        get {
            if(!this.HasProp("__elementsProxyArray"))
                this.__elementsProxyArray := Win32FixedArray(this.ptr + 8, 1, PROFILER_HEAP_OBJECT_RELATIONSHIP, "")
            return this.__elementsProxyArray
        }
    }
}
