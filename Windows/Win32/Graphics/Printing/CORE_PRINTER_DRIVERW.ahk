#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Represents a printer driver on which other printer drivers depend.
 * @remarks
 * This structure can represent a manufacturer's base driver on which the drivers for various printer models are dependent.
 * @see https://learn.microsoft.com/windows/win32/printdocs/core-printer-driver
 * @namespace Windows.Win32.Graphics.Printing
 * @charset Unicode
 */
export default struct CORE_PRINTER_DRIVERW {
    #StructPack 8

    /**
     * The GUID of the core printer driver.
     */
    CoreDriverGUID : Guid

    /**
     * The date and time of the latest version of the core printer driver.
     */
    ftDriverDate : FILETIME

    /**
     * The version ID of the latest version of the core printer driver.
     * 
     * 
     * **szPackageID\[MAX\_PATH\]**
     * 
     * The path to the driver package that contains the core printer driver.
     */
    dwlDriverVersion : Int64

    szPackageID : WCHAR[260]

}
