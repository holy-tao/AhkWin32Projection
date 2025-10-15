#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\PSTR.ahk

/**
 * Contains information about a debugging event.
 * @see https://docs.microsoft.com/windows/win32/api//dbghelp/ns-dbghelp-imagehlp_cba_event
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 * @charset ANSI
 */
class IMAGEHLP_CBA_EVENT extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * 
     * @type {Integer}
     */
    severity {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * This member is reserved for future use.
     * @type {Integer}
     */
    code {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A text description of the error.
     * @type {PSTR}
     */
    desc{
        get {
            if(!this.HasProp("__desc"))
                this.__desc := PSTR(this.ptr + 8)
            return this.__desc
        }
    }

    /**
     * This member is reserved for future use.
     * @type {Pointer<Void>}
     */
    object {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
