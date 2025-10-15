#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include ..\..\Foundation\BOOL.ahk

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
     * @type {BOOL}
     */
    bForeground{
        get {
            if(!this.HasProp("__bForeground"))
                this.__bForeground := BOOL(this.ptr + 8)
            return this.__bForeground
        }
    }
}
