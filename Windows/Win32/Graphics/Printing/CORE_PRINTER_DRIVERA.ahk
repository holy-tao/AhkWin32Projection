#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * Represents a printer driver on which other printer drivers depend.
 * @remarks
 * This structure can represent a manufacturer's base driver on which the drivers for various printer models are dependent.
 * @see https://learn.microsoft.com/windows/win32/printdocs/core-printer-driver
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 * @charset ANSI
 */
class CORE_PRINTER_DRIVERA extends Win32Struct
{
    static sizeof => 288

    static packingSize => 8

    /**
     * The GUID of the core printer driver.
     * @type {Pointer<Guid>}
     */
    CoreDriverGUID {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The date and time of the latest version of the core printer driver.
     * @type {FILETIME}
     */
    ftDriverDate{
        get {
            if(!this.HasProp("__ftDriverDate"))
                this.__ftDriverDate := FILETIME(this.ptr + 8)
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
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Array<SByte>}
     */
    szPackageID{
        get {
            if(!this.HasProp("__szPackageIDProxyArray"))
                this.__szPackageIDProxyArray := Win32FixedArray(this.ptr + 24, 260, Primitive, "char")
            return this.__szPackageIDProxyArray
        }
    }
}
