#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/printdocs/port-info-2
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
    pPortName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {PSTR}
     */
    pMonitorName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {PSTR}
     */
    pDescription {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
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
