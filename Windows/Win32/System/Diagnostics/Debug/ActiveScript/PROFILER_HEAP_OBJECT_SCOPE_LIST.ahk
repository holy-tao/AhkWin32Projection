#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
class PROFILER_HEAP_OBJECT_SCOPE_LIST extends Win32Struct {
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
     * @type {Array<Pointer>}
     */
    scopes {
        get {
            if(!this.HasProp("__scopesProxyArray"))
                this.__scopesProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "ptr")
            return this.__scopesProxyArray
        }
    }
}
