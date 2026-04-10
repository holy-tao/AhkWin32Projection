#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\MINIDUMP_THREAD_NAME.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
class MINIDUMP_THREAD_NAME_LIST extends Win32Struct {
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    NumberOfThreadNames {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {MINIDUMP_THREAD_NAME}
     */
    ThreadNames {
        get {
            if(!this.HasProp("__ThreadNamesProxyArray"))
                this.__ThreadNamesProxyArray := Win32FixedArray(this.ptr + 8, 1, MINIDUMP_THREAD_NAME, "")
            return this.__ThreadNamesProxyArray
        }
    }
}
