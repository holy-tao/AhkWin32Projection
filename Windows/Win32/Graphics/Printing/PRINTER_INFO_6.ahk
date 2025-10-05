#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The PRINTER\_INFO\_6 specifies the status value of a printer.
 * @see https://learn.microsoft.com/windows/win32/printdocs/printer-info-6
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class PRINTER_INFO_6 extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * The printer status. This member can be any reasonable combination of the following values.
     * 
     * 
     * 
     * | Value                               | Meaning                                                                                                       |
     * |-------------------------------------|---------------------------------------------------------------------------------------------------------------|
     * | PRINTER\_STATUS\_BUSY               | The printer is busy.                                                                                          |
     * | PRINTER\_STATUS\_DOOR\_OPEN         | The printer door is open.                                                                                     |
     * | PRINTER\_STATUS\_ERROR              | Not used.                                                                                                     |
     * | PRINTER\_STATUS\_INITIALIZING       | The printer is initializing.                                                                                  |
     * | PRINTER\_STATUS\_IO\_ACTIVE         | The printer is in an active input/output state                                                                |
     * | PRINTER\_STATUS\_MANUAL\_FEED       | The printer is in a manual feed state.                                                                        |
     * | PRINTER\_STATUS\_NO\_TONER          | The printer is out of toner.                                                                                  |
     * | PRINTER\_STATUS\_NOT\_AVAILABLE     | The printer is not available for printing.                                                                    |
     * | PRINTER\_STATUS\_OFFLINE            | The printer is offline.                                                                                       |
     * | PRINTER\_STATUS\_OUT\_OF\_MEMORY    | The printer has run out of memory.                                                                            |
     * | PRINTER\_STATUS\_OUTPUT\_BIN\_FULL  | The printer's output bin is full.                                                                             |
     * | PRINTER\_STATUS\_PAGE\_PUNT         | The printer cannot print the current page.                                                                    |
     * | PRINTER\_STATUS\_PAPER\_JAM         | Paper is jammed in the printer                                                                                |
     * | PRINTER\_STATUS\_PAPER\_OUT         | The printer is out of paper.                                                                                  |
     * | PRINTER\_STATUS\_PAPER\_PROBLEM     | The printer has a paper problem.                                                                              |
     * | PRINTER\_STATUS\_PAUSED             | The printer is paused.                                                                                        |
     * | PRINTER\_STATUS\_PENDING\_DELETION  | The printer is pending deletion as a result of a call to the [**DeletePrinter**](deleteprinter.md) function. |
     * | PRINTER\_STATUS\_POWER\_SAVE        | The printer is in power save mode.                                                                            |
     * | PRINTER\_STATUS\_PRINTING           | The printer is printing.                                                                                      |
     * | PRINTER\_STATUS\_PROCESSING         | The printer is processing a command from the [**SetPrinter**](setprinter.md) function.                       |
     * | PRINTER\_STATUS\_SERVER\_UNKNOWN    | The printer status is unknown.                                                                                |
     * | PRINTER\_STATUS\_TONER\_LOW         | The printer is low on toner.                                                                                  |
     * | PRINTER\_STATUS\_USER\_INTERVENTION | The printer has an error that requires the user to do something.                                              |
     * | PRINTER\_STATUS\_WAITING            | The printer is waiting.                                                                                       |
     * | PRINTER\_STATUS\_WARMING\_UP        | The printer is warming up.                                                                                    |
     * @type {Integer}
     */
    dwStatus {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
