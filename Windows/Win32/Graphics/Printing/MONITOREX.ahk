#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\MONITOR.ahk
#Include .\PFN_PRINTING_ADDPORT.ahk
#Include .\PFN_PRINTING_ADDPORTEX.ahk
#Include .\PFN_PRINTING_CLOSEPORT.ahk
#Include .\PFN_PRINTING_CONFIGUREPORT.ahk
#Include .\PFN_PRINTING_DELETEPORT.ahk
#Include .\PFN_PRINTING_ENDDOCPORT.ahk
#Include .\PFN_PRINTING_ENUMPORTS.ahk
#Include .\PFN_PRINTING_GETPRINTERDATAFROMPORT.ahk
#Include .\PFN_PRINTING_OPENPORT.ahk
#Include .\PFN_PRINTING_OPENPORTEX.ahk
#Include .\PFN_PRINTING_READPORT.ahk
#Include .\PFN_PRINTING_SETPORTTIMEOUTS.ahk
#Include .\PFN_PRINTING_STARTDOCPORT.ahk
#Include .\PFN_PRINTING_WRITEPORT.ahk
#Include .\PFN_PRINTING_XCVCLOSEPORT.ahk
#Include .\PFN_PRINTING_XCVDATAPORT.ahk
#Include .\PFN_PRINTING_XCVOPENPORT.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
class MONITOREX extends Win32Struct {
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
    Monitor {
        get {
            if(!this.HasProp("__Monitor"))
                this.__Monitor := MONITOR(8, this)
            return this.__Monitor
        }
    }
}
