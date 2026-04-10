#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Struct.ahk
#Include .\TANALYZE_RETURN.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
class CKCL_DATA extends Win32Struct {
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Pointer<Void>}
     */
    NextLogEvent {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {PSTR}
     */
    TAnalyzeString {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {TANALYZE_RETURN}
     */
    TAnalyzeReturnType {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }
}
