#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Foundation\NTSTATUS.ahk
#Include ..\EXCEPTION_RECORD64.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class DEBUG_LAST_EVENT_INFO_EXCEPTION extends Win32Struct
{
    static sizeof => 160

    static packingSize => 8

    /**
     * @type {EXCEPTION_RECORD64}
     */
    ExceptionRecord{
        get {
            if(!this.HasProp("__ExceptionRecord"))
                this.__ExceptionRecord := EXCEPTION_RECORD64(this.ptr + 0)
            return this.__ExceptionRecord
        }
    }

    /**
     * @type {Integer}
     */
    FirstChance {
        get => NumGet(this, 152, "uint")
        set => NumPut("uint", value, this, 152)
    }
}
