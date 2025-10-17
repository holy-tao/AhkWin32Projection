#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk

/**
 * @namespace Windows.Win32.System.Console
 * @version v4.0.30319
 */
class CONSOLEWINDOWOWNER extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {HWND}
     */
    hwnd{
        get {
            if(!this.HasProp("__hwnd"))
                this.__hwnd := HWND(0, this)
            return this.__hwnd
        }
    }

    /**
     * @type {Integer}
     */
    ProcessId {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    ThreadId {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
