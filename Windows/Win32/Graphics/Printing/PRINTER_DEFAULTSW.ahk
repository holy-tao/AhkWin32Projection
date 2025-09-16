#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The PRINTER\_DEFAULTS structure specifies the default data type, environment, initialization data, and access rights for a printer.
 * @see https://learn.microsoft.com/windows/win32/printdocs/printer-defaults
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 * @charset Unicode
 */
class PRINTER_DEFAULTSW extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Pointer to a null-terminated string that specifies the default data type for a printer.
     * @type {Pointer<PWSTR>}
     */
    pDatatype {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Pointer to a [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) structure that identifies the default environment and initialization data for a printer.
     * @type {Pointer<DEVMODEW>}
     */
    pDevMode {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

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
     * @type {Integer}
     */
    DesiredAccess {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
