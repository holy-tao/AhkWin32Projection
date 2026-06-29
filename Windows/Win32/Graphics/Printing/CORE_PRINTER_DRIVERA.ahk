#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * Represents a printer driver on which other printer drivers depend.
 * @remarks
 * This structure can represent a manufacturer's base driver on which the drivers for various printer models are dependent.
 * @see https://learn.microsoft.com/windows/win32/printdocs/core-printer-driver
 * @namespace Windows.Win32.Graphics.Printing
 * @charset ANSI
 */
class CORE_PRINTER_DRIVERA extends Win32Struct {
    static sizeof => 296

    static packingSize => 8

    /**
     * The GUID of the core printer driver.
     * @type {Guid}
     */
    CoreDriverGUID {
        get {
            if(!this.HasProp("__CoreDriverGUID"))
                this.__CoreDriverGUID := Guid(0, this)
            return this.__CoreDriverGUID
        }
    }

    /**
     * The date and time of the latest version of the core printer driver.
     * @type {FILETIME}
     */
    ftDriverDate {
        get {
            if(!this.HasProp("__ftDriverDate"))
                this.__ftDriverDate := FILETIME(16, this)
            return this.__ftDriverDate
        }
    }

    /**
     * The version ID of the latest version of the core printer driver.
     * 
     * 
     * **szPackageID\[MAX\_PATH\]**
     * 
     * The path to the driver package that contains the core printer driver.
     * @type {Integer}
     */
    dwlDriverVersion {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {String}
     */
    szPackageID {
        get => StrGet(this.ptr + 32, 259, "UTF-8")
        set => StrPut(value, this.ptr + 32, 259, "UTF-8")
    }
}
