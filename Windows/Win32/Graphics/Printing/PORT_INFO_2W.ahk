#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 * @charset Unicode
 */
class PORT_INFO_2W extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    pPortName{
        get {
            if(!this.HasProp("__pPortName"))
                this.__pPortName := PWSTR(this.ptr + 0)
            return this.__pPortName
        }
    }

    /**
     * @type {PWSTR}
     */
    pMonitorName{
        get {
            if(!this.HasProp("__pMonitorName"))
                this.__pMonitorName := PWSTR(this.ptr + 8)
            return this.__pMonitorName
        }
    }

    /**
     * @type {PWSTR}
     */
    pDescription{
        get {
            if(!this.HasProp("__pDescription"))
                this.__pDescription := PWSTR(this.ptr + 16)
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
