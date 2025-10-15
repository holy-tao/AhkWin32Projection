#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 * @charset ANSI
 */
class PORT_INFO_2A extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {PSTR}
     */
    pPortName{
        get {
            if(!this.HasProp("__pPortName"))
                this.__pPortName := PSTR(this.ptr + 0)
            return this.__pPortName
        }
    }

    /**
     * @type {PSTR}
     */
    pMonitorName{
        get {
            if(!this.HasProp("__pMonitorName"))
                this.__pMonitorName := PSTR(this.ptr + 8)
            return this.__pMonitorName
        }
    }

    /**
     * @type {PSTR}
     */
    pDescription{
        get {
            if(!this.HasProp("__pDescription"))
                this.__pDescription := PSTR(this.ptr + 16)
            return this.__pDescription
        }
    }

    /**
     * @type {Integer}
     */
    fPortType {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }
}
