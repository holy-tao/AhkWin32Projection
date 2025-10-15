#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.System.Console
 * @version v4.0.30319
 */
class FOCUS_EVENT_RECORD extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {BOOL}
     */
    bSetFocus{
        get {
            if(!this.HasProp("__bSetFocus"))
                this.__bSetFocus := BOOL(this.ptr + 0)
            return this.__bSetFocus
        }
    }
}
