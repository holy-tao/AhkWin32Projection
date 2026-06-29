#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\PRINTER_ACCESS_RIGHTS.ahk" { PRINTER_ACCESS_RIGHTS }
#Import "..\Gdi\DEVMODEW.ahk" { DEVMODEW }

/**
 * The PRINTER\_DEFAULTS structure specifies the default data type, environment, initialization data, and access rights for a printer.
 * @see https://learn.microsoft.com/windows/win32/printdocs/printer-defaults
 * @namespace Windows.Win32.Graphics.Printing
 * @charset Unicode
 */
export default struct PRINTER_DEFAULTSW {
    #StructPack 8

    /**
     * Pointer to a null-terminated string that specifies the default data type for a printer.
     */
    pDatatype : PWSTR

    /**
     * Pointer to a [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) structure that identifies the default environment and initialization data for a printer.
     */
    pDevMode : DEVMODEW.Ptr

    /**
     * Specifies desired access rights for a printer. The [**OpenPrinter**](openprinter.md) function uses this member to set access rights to the printer. These rights can affect the operation of the [**SetPrinter**](setprinter.md) and [**DeletePrinter**](deleteprinter.md) functions. The access rights can be one of the following.
     * 
     * 
     * 
     * | Value                                       | Meaning                                                                                                                                                                                      |
     * |---------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | PRINTER\_ACCESS\_ADMINISTER                 | To perform administrative tasks, such as those provided by [**SetPrinter**](setprinter.md).                                                                                                 |
     * | PRINTER\_ACCESS\_USE                        | To perform basic printing operations.                                                                                                                                                        |
     * | PRINTER\_ACCESS\_MANAGE\_LIMITED            | To perform administrative tasks, such as those provided by [**SetPrinter**](setprinter.md) and [**SetPrinterData**](setprinterdata.md). This value is available starting from Windows 8.1. |
     * | PRINTER\_ALL\_ACCESS                        | To perform all administrative tasks and basic printing operations except for SYNCHRONIZE (see [Standard Access Rights](/windows/desktop/SecAuthZ/standard-access-rights) ).                                   |
     * | generic security values, such as WRITE\_DAC | To allow specific control access rights. See [Standard Access Rights](/windows/desktop/SecAuthZ/standard-access-rights).                                                                                      |
     */
    DesiredAccess : PRINTER_ACCESS_RIGHTS

}
