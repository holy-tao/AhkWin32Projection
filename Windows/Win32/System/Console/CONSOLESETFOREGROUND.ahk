#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Win32.System.Console
 * @version v4.0.30319
 */
class CONSOLESETFOREGROUND extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {HANDLE}
     */
    hProcess{
        get {
            if(!this.HasProp("__hProcess"))
                this.__hProcess := HANDLE(this.ptr + 0)
            return this.__hProcess
        }
    }

    /**
     * @type {Integer}
     */
    bForeground {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
