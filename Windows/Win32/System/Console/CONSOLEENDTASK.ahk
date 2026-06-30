#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Win32.System.Console
 */
class CONSOLEENDTASK extends Win32Struct {
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {HANDLE}
     */
    ProcessId {
        get {
            if(!this.HasProp("__ProcessId"))
                this.__ProcessId := HANDLE(0, this)
            return this.__ProcessId
        }
    }

    /**
     * @type {HWND}
     */
    hwnd {
        get {
            if(!this.HasProp("__hwnd"))
                this.__hwnd := HWND(8, this)
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
