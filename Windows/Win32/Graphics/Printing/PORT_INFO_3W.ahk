#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 * @charset Unicode
 */
class PORT_INFO_3W extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwStatus {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {PWSTR}
     */
    pszStatus{
        get {
            if(!this.HasProp("__pszStatus"))
                this.__pszStatus := PWSTR(this.ptr + 8)
            return this.__pszStatus
        }
    }

    /**
     * @type {Integer}
     */
    dwSeverity {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
