#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include ..\..\Foundation\HWND.ahk

/**
 * @namespace Windows.Win32.System.Console
 * @version v4.0.30319
 */
class CONSOLEENDTASK extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {HANDLE}
     */
    ProcessId{
        get {
            if(!this.HasProp("__ProcessId"))
                this.__ProcessId := HANDLE(this.ptr + 0)
            return this.__ProcessId
        }
    }

    /**
     * @type {HWND}
     */
    hwnd{
        get {
            if(!this.HasProp("__hwnd"))
                this.__hwnd := HWND(this.ptr + 8)
            return this.__hwnd
        }
    }

    /**
     * @type {Integer}
     */
    ConsoleEventCode {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    ConsoleFlags {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
