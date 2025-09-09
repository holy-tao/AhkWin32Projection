#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\MINIDUMP_THREAD_NAME.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class MINIDUMP_THREAD_NAME_LIST extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {Integer}
     */
    NumberOfThreadNames {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<MINIDUMP_THREAD_NAME>}
     */
    ThreadNames{
        get {
            if(!this.HasProp("__ThreadNamesProxyArray"))
                this.__ThreadNamesProxyArray := Win32FixedArray(this.ptr + 4, 1, MINIDUMP_THREAD_NAME, "")
            return this.__ThreadNamesProxyArray
        }
    }
}
