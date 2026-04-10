#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Struct.ahk
#Include .\PROFILER_HEAP_SUMMARY_VERSION.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
class PROFILER_HEAP_SUMMARY extends Win32Struct {
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {PROFILER_HEAP_SUMMARY_VERSION}
     */
    version {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    totalHeapSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
