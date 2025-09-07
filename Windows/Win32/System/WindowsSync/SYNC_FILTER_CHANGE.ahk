#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SYNC_VERSION.ahk

/**
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class SYNC_FILTER_CHANGE extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    fMoveIn {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {SYNC_VERSION}
     */
    moveVersion{
        get {
            if(!this.HasProp("__moveVersion"))
                this.__moveVersion := SYNC_VERSION(this.ptr + 8)
            return this.__moveVersion
        }
    }
}
