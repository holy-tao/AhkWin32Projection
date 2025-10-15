#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Foundation\PSTR.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class CKCL_DATA extends Win32Struct
{
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
    TAnalyzeString{
        get {
            if(!this.HasProp("__TAnalyzeString"))
                this.__TAnalyzeString := PSTR(this.ptr + 8)
            return this.__TAnalyzeString
        }
    }

    /**
     * @type {Integer}
     */
    TAnalyzeReturnType {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }
}
