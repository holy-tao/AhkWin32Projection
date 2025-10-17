#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\COORD.ahk

/**
 * @namespace Windows.Win32.System.Console
 * @version v4.0.30319
 */
class WINDOW_BUFFER_SIZE_RECORD extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {COORD}
     */
    dwSize{
        get {
            if(!this.HasProp("__dwSize"))
                this.__dwSize := COORD(0, this)
            return this.__dwSize
        }
    }
}
