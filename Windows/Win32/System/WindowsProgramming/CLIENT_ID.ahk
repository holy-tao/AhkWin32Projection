#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 * @version v4.0.30319
 */
class CLIENT_ID extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {HANDLE}
     */
    UniqueProcess{
        get {
            if(!this.HasProp("__UniqueProcess"))
                this.__UniqueProcess := HANDLE(0, this)
            return this.__UniqueProcess
        }
    }

    /**
     * @type {HANDLE}
     */
    UniqueThread{
        get {
            if(!this.HasProp("__UniqueThread"))
                this.__UniqueThread := HANDLE(8, this)
            return this.__UniqueThread
        }
    }
}
