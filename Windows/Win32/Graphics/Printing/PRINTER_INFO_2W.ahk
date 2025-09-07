#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Security\PSECURITY_DESCRIPTOR.ahk

/**
 * The PRINTER\_INFO\_2 structure specifies detailed printer information.
 * @see https://learn.microsoft.com/windows/win32/printdocs/printer-info-2
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 * @charset Unicode
 */
class PRINTER_INFO_2W extends Win32Struct
{
    static sizeof => 136

    static packingSize => 8

    /**
     * A pointer to a null-terminated string identifying the server that controls the printer. If this string is **NULL**, the printer is controlled locally.
     * @type {PWSTR}
     */
    pServerName{
        get {
            if(!this.HasProp("__pServerName"))
                this.__pServerName := PWSTR(this.ptr + 0)
            return this.__pServerName
        }
    }

    /**
     * A pointer to a null-terminated string that specifies the name of the printer.
     * @type {PWSTR}
     */
    pPrinterName{
        get {
            if(!this.HasProp("__pPrinterName"))
                this.__pPrinterName := PWSTR(this.ptr + 8)
            return this.__pPrinterName
        }
    }

    /**
     * A pointer to a null-terminated string that identifies the share point for the printer. (This string is used only if the PRINTER\_ATTRIBUTE\_SHARED constant was set for the **Attributes** member.)
     * @type {PWSTR}
     */
    pShareName{
        get {
            if(!this.HasProp("__pShareName"))
                this.__pShareName := PWSTR(this.ptr + 16)
            return this.__pShareName
        }
    }

    /**
     * A pointer to a null-terminated string that identifies the port(s) used to transmit data to the printer. If a printer is connected to more than one port, the names of each port must be separated by commas (for example, "LPT1:,LPT2:,LPT3:").
     * @type {PWSTR}
     */
    pPortName{
        get {
            if(!this.HasProp("__pPortName"))
                this.__pPortName := PWSTR(this.ptr + 24)
            return this.__pPortName
        }
    }

    /**
     * A pointer to a null-terminated string that specifies the name of the printer driver.
     * @type {PWSTR}
     */
    pDriverName{
        get {
            if(!this.HasProp("__pDriverName"))
                this.__pDriverName := PWSTR(this.ptr + 32)
            return this.__pDriverName
        }
    }

    /**
     * A pointer to a null-terminated string that provides a brief description of the printer.
     * @type {PWSTR}
     */
    pComment{
        get {
            if(!this.HasProp("__pComment"))
                this.__pComment := PWSTR(this.ptr + 40)
            return this.__pComment
        }
    }

    /**
     * A pointer to a null-terminated string that specifies the physical location of the printer (for example, "Bldg. 38, Room 1164").
     * @type {PWSTR}
     */
    pLocation{
        get {
            if(!this.HasProp("__pLocation"))
                this.__pLocation := PWSTR(this.ptr + 48)
            return this.__pLocation
        }
    }

    /**
     * A pointer to a [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) structure that defines default printer data such as the paper orientation and the resolution.
     * @type {Pointer<DEVMODEW>}
     */
    pDevMode {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * A pointer to a null-terminated string that specifies the name of the file used to create the separator page. This page is used to separate print jobs sent to the printer.
     * @type {PWSTR}
     */
    pSepFile{
        get {
            if(!this.HasProp("__pSepFile"))
                this.__pSepFile := PWSTR(this.ptr + 64)
            return this.__pSepFile
        }
    }

    /**
     * A pointer to a null-terminated string that specifies the name of the print processor used by the printer. You can use the [**EnumPrintProcessors**](enumprintprocessors.md) function to obtain a list of print processors installed on a server.
     * @type {PWSTR}
     */
    pPrintProcessor{
        get {
            if(!this.HasProp("__pPrintProcessor"))
                this.__pPrintProcessor := PWSTR(this.ptr + 72)
            return this.__pPrintProcessor
        }
    }

    /**
     * A pointer to a null-terminated string that specifies the data type used to record the print job. You can use the [**EnumPrintProcessorDatatypes**](enumprintprocessordatatypes.md) function to obtain a list of data types supported by a specific print processor.
     * @type {PWSTR}
     */
    pDatatype{
        get {
            if(!this.HasProp("__pDatatype"))
                this.__pDatatype := PWSTR(this.ptr + 80)
            return this.__pDatatype
        }
    }

    /**
     * A pointer to a null-terminated string that specifies the default print-processor parameters.
     * @type {PWSTR}
     */
    pParameters{
        get {
            if(!this.HasProp("__pParameters"))
                this.__pParameters := PWSTR(this.ptr + 88)
            return this.__pParameters
        }
    }

    /**
     * A pointer to a [**SECURITY\_DESCRIPTOR**](/windows/desktop/api/winnt/ns-winnt-security_descriptor) structure for the printer. This member may be **NULL**.
     * @type {PSECURITY_DESCRIPTOR}
     */
    pSecurityDescriptor{
        get {
            if(!this.HasProp("__pSecurityDescriptor"))
                this.__pSecurityDescriptor := PSECURITY_DESCRIPTOR(this.ptr + 96)
            return this.__pSecurityDescriptor
        }
    }

    /**
     * The printer attributes. This member can be any reasonable combination of the following values.
     * 
     * | Value                                   | Meaning                                                                                                                                                                                 |
     * |-----------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | PRINTER\_ATTRIBUTE\_DIRECT              | Job is sent directly to the printer (it is not spooled).                                                                                                                                |
     * | PRINTER\_ATTRIBUTE\_DO\_COMPLETE\_FIRST | If set and printer is set for print-while-spooling, any jobs that have completed spooling are scheduled to print before jobs that have not completed spooling.                          |
     * | PRINTER\_ATTRIBUTE\_ENABLE\_DEVQ        | If set, **DevQueryPrint** is called. **DevQueryPrint** may fail if the document and printer setups do not match. Setting this flag causes mismatched documents to be held in the queue. |
     * | PRINTER\_ATTRIBUTE\_HIDDEN              | Reserved.                                                                                                                                                                               |
     * | PRINTER\_ATTRIBUTE\_KEEPPRINTEDJOBS     | If set, jobs are kept after they are printed. If unset, jobs are deleted.                                                                                                               |
     * | PRINTER\_ATTRIBUTE\_LOCAL               | Printer is a local printer.                                                                                                                                                             |
     * | PRINTER\_ATTRIBUTE\_NETWORK             | Printer is a network printer connection.                                                                                                                                                |
     * | PRINTER\_ATTRIBUTE\_PUBLISHED           | Indicates whether the printer is published in the directory service.                                                                                                                    |
     * | PRINTER\_ATTRIBUTE\_QUEUED              | If set, the printer spools and starts printing after the last page is spooled. If not set and PRINTER\_ATTRIBUTE\_DIRECT is not set, the printer spools and prints while spooling.      |
     * | PRINTER\_ATTRIBUTE\_RAW\_ONLY           | Indicates that only raw data type print jobs can be spooled.                                                                                                                            |
     * | PRINTER\_ATTRIBUTE\_SHARED              | Printer is shared.                                                                                                                                                                      |
     * 
     * 
     * 
     *  
     * 
     * In Windows XP and later versions of Windows, the following value can also be used.
     * 
     * | Value                   | Meaning                                                                                                                                                                                           |
     * |-------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | PRINTER\_ATTRIBUTE\_FAX | If set, printer is a fax printer. This can only be set by [**AddPrinter**](addprinter.md), but it can be retrieved by [**EnumPrinters**](enumprinters.md) and [**GetPrinter**](getprinter.md). |
     * 
     * 
     * 
     *  
     * 
     * In Windows Vista and later versions of Windows, the following values can also be used.
     * 
     * | Value                               | Meaning                                                                          |
     * |-------------------------------------|----------------------------------------------------------------------------------|
     * | PRINTER\_ATTRIBUTE\_FRIENDLY\_NAME  | A computer has connected to this printer and given it a friendly name.           |
     * | PRINTER\_ATTRIBUTE\_MACHINE         | Printer is a per-machine connection.                                             |
     * | PRINTER\_ATTRIBUTE\_PUSHED\_USER    | The printer was installed by using the Push Printer Connections user policy.     |
     * | PRINTER\_ATTRIBUTE\_PUSHED\_MACHINE | The printer was installed by using the Push Printer Connections computer policy. |
     * 
     * 
     * 
     *  
     * 
     * In Windows Server 2003, the following value can also be used.
     * 
     * | Value                  | Meaning                                                                 |
     * |------------------------|-------------------------------------------------------------------------|
     * | PRINTER\_ATTRIBUTE\_TS | Indicates the printer is currently connected through a terminal server. |
     * @type {Integer}
     */
    Attributes {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * A priority value that the spooler uses to route print jobs.
     * @type {Integer}
     */
    Priority {
        get => NumGet(this, 108, "uint")
        set => NumPut("uint", value, this, 108)
    }

    /**
     * The default priority value assigned to each print job.
     * @type {Integer}
     */
    DefaultPriority {
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }

    /**
     * The earliest time at which the printer will print a job. This value is expressed as minutes elapsed since 12:00 AM GMT (Greenwich Mean Time).
     * @type {Integer}
     */
    StartTime {
        get => NumGet(this, 116, "uint")
        set => NumPut("uint", value, this, 116)
    }

    /**
     * The latest time at which the printer will print a job. This value is expressed as minutes elapsed since 12:00 AM GMT (Greenwich Mean Time).
     * @type {Integer}
     */
    UntilTime {
        get => NumGet(this, 120, "uint")
        set => NumPut("uint", value, this, 120)
    }

    /**
     * The printer status. This member can be any reasonable combination of the following values.
     * 
     * 
     * 
     * | Value                               | Meaning                                                          |
     * |-------------------------------------|------------------------------------------------------------------|
     * | PRINTER\_STATUS\_BUSY               | The printer is busy.                                             |
     * | PRINTER\_STATUS\_DOOR\_OPEN         | The printer door is open.                                        |
     * | PRINTER\_STATUS\_ERROR              | The printer is in an error state.                                |
     * | PRINTER\_STATUS\_INITIALIZING       | The printer is initializing.                                     |
     * | PRINTER\_STATUS\_IO\_ACTIVE         | The printer is in an active input/output state                   |
     * | PRINTER\_STATUS\_MANUAL\_FEED       | The printer is in a manual feed state.                           |
     * | PRINTER\_STATUS\_NO\_TONER          | The printer is out of toner.                                     |
     * | PRINTER\_STATUS\_NOT\_AVAILABLE     | The printer is not available for printing.                       |
     * | PRINTER\_STATUS\_OFFLINE            | The printer is offline.                                          |
     * | PRINTER\_STATUS\_OUT\_OF\_MEMORY    | The printer has run out of memory.                               |
     * | PRINTER\_STATUS\_OUTPUT\_BIN\_FULL  | The printer's output bin is full.                                |
     * | PRINTER\_STATUS\_PAGE\_PUNT         | The printer cannot print the current page.                       |
     * | PRINTER\_STATUS\_PAPER\_JAM         | Paper is jammed in the printer                                   |
     * | PRINTER\_STATUS\_PAPER\_OUT         | The printer is out of paper.                                     |
     * | PRINTER\_STATUS\_PAPER\_PROBLEM     | The printer has a paper problem.                                 |
     * | PRINTER\_STATUS\_PAUSED             | The printer is paused.                                           |
     * | PRINTER\_STATUS\_PENDING\_DELETION  | The printer is being deleted.                                    |
     * | PRINTER\_STATUS\_POWER\_SAVE        | The printer is in power save mode.                               |
     * | PRINTER\_STATUS\_PRINTING           | The printer is printing.                                         |
     * | PRINTER\_STATUS\_PROCESSING         | The printer is processing a print job.                           |
     * | PRINTER\_STATUS\_SERVER\_UNKNOWN    | The printer status is unknown.                                   |
     * | PRINTER\_STATUS\_TONER\_LOW         | The printer is low on toner.                                     |
     * | PRINTER\_STATUS\_USER\_INTERVENTION | The printer has an error that requires the user to do something. |
     * | PRINTER\_STATUS\_WAITING            | The printer is waiting.                                          |
     * | PRINTER\_STATUS\_WARMING\_UP        | The printer is warming up.                                       |
     * @type {Integer}
     */
    Status {
        get => NumGet(this, 124, "uint")
        set => NumPut("uint", value, this, 124)
    }

    /**
     * The number of print jobs that have been queued for the printer.
     * @type {Integer}
     */
    cJobs {
        get => NumGet(this, 128, "uint")
        set => NumPut("uint", value, this, 128)
    }

    /**
     * The average number of pages per minute that have been printed on the printer.
     * @type {Integer}
     */
    AveragePPM {
        get => NumGet(this, 132, "uint")
        set => NumPut("uint", value, this, 132)
    }
}
