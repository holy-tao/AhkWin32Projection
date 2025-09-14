#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The PRINTER\_INFO\_7 structure specifies directory services printer information.
 * @remarks
 * The **PRINTER\_INFO\_7** structure is used in a [**SetPrinter**](setprinter.md) call to publish printer information to the directory service. The published data includes all values and data for the specified printer found under the SPLDS\_SPOOLER\_KEY, SPLDS\_DRIVER\_KEY, or SPLDS\_USER\_KEY keys created by [**SetPrinterDataEx**](setprinterdataex.md).
  * 
  * For [**SetPrinter**](setprinter.md), *pszObjectGUID* should be set to **NULL**. For [**GetPrinter**](getprinter.md), *pszObjectGUID* returns the GUID of the directory services print queue object associated with a published printer. You can use this GUID with Active Directory Services Interface (ADSI) methods to retrieve published data for the printer. However, the recommended method for retrieving published data is to call the [**GetPrinterDataEx**](getprinterdataex.md) function.
 * @see https://learn.microsoft.com/windows/win32/printdocs/printer-info-7
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 * @charset ANSI
 */
class PRINTER_INFO_7A extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A pointer to a null-terminated string containing the GUID of the directory service print queue object associated with a published printer. Use the [**GetPrinter**](getprinter.md) function to retrieve this GUID.
     * 
     * Before calling [**SetPrinter**](setprinter.md), set **pszObjectGUID** to **NULL**.
     * @type {Pointer<PSTR>}
     */
    pszObjectGUID {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Indicates the action for the [**SetPrinter**](setprinter.md) function to perform. For the [**GetPrinter**](getprinter.md) function, this member indicates whether the specified printer is published. This member can be a combination of the following values.
     * 
     * 
     * 
     * | Value                                                                                                                                                                                                                                     | Meaning                                                                                                                                                                                                                                                                                                     |
     * |-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | <span id="DSPRINT_PENDING"></span><span id="dsprint_pending"></span><dl> <dt>**DSPRINT\_PENDING**</dt> <dt>0x80000000</dt> </dl>       | [**GetPrinter**](getprinter.md): Indicates that the system is attempting to complete a publish or unpublish operation started by a [**SetPrinter**](setprinter.md) call.<br/> [**SetPrinter**](setprinter.md): This value is not valid. <br/>                                                |
     * | <span id="DSPRINT_PUBLISH"></span><span id="dsprint_publish"></span><dl> <dt>**DSPRINT\_PUBLISH**</dt> <dt>0x00000001</dt> </dl>       | [**SetPrinter**](setprinter.md): Publishes the printer's data in the DS.<br/> [**GetPrinter**](getprinter.md): Indicates the printer is published. <br/>                                                                                                                                      |
     * | <span id="DSPRINT_REPUBLISH"></span><span id="dsprint_republish"></span><dl> <dt>**DSPRINT\_REPUBLISH**</dt> <dt>0x00000008</dt> </dl> | [**SetPrinter**](setprinter.md): The DS data for the printer is unpublished and then published again, refreshing all properties in the published printer. Re-publishing also changes the GUID of the published printer.<br/> [**GetPrinter**](getprinter.md): Never returns this value. <br/> |
     * | <span id="DSPRINT_UNPUBLISH"></span><span id="dsprint_unpublish"></span><dl> <dt>**DSPRINT\_UNPUBLISH**</dt> <dt>0x00000004</dt> </dl> | [**SetPrinter**](setprinter.md): Removes the printer's published data from the DS.<br/> [**GetPrinter**](getprinter.md): Indicates the printer is not published. <br/>                                                                                                                        |
     * | <span id="DSPRINT_UPDATE"></span><span id="dsprint_update"></span><dl> <dt>**DSPRINT\_UPDATE**</dt> <dt>0x00000002</dt> </dl>          | [**SetPrinter**](setprinter.md): Updates the printer's published data in the DS.<br/> [**GetPrinter**](getprinter.md): Never returns this value. <br/>                                                                                                                                        |
     * @type {Integer}
     */
    dwAction {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
