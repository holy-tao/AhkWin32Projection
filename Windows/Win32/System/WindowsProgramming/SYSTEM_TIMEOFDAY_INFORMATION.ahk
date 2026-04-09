#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 */
class SYSTEM_TIMEOFDAY_INFORMATION extends Win32Struct {
    static sizeof => 48

    static packingSize => 1

    /**
     * @type {Array<Integer>}
     */
    Reserved1 {
        get {
            if(!this.HasProp("__Reserved1ProxyArray"))
                this.__Reserved1ProxyArray := Win32FixedArray(this.ptr + 0, 48, Primitive, "char")
            return this.__Reserved1ProxyArray
        }
    }
}
