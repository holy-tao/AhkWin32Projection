#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\MONITOR.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class MONITOREX extends Win32Struct
{
    static sizeof => 144

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwMonitorSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {MONITOR}
     */
    Monitor{
        get {
            if(!this.HasProp("__Monitor"))
                this.__Monitor := MONITOR(this.ptr + 8)
            return this.__Monitor
        }
    }
}
