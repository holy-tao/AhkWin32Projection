#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The PRINTER\_NOTIFY\_OPTIONS\_TYPE structure specifies the set of printer or job information fields to be monitored by a printer change notification object.A call to the FindFirstPrinterChangeNotification function specifies a PRINTER\_NOTIFY\_OPTIONS structure, which contains an array of PRINTER\_NOTIFY\_OPTIONS\_TYPE structures.
 * @see https://learn.microsoft.com/windows/win32/printdocs/printer-notify-options-type
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class PRINTER_NOTIFY_OPTIONS_TYPE extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The type to be watched. This member can be one of the following values.
     * 
     * 
     * 
     * | Value                                                                                                                                                                                                                                      | Meaning                                                                                                           |
     * |--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------|
     * | <span id="JOB_NOTIFY_TYPE"></span><span id="job_notify_type"></span><dl> <dt>**JOB\_NOTIFY\_TYPE**</dt> <dt>0x01</dt> </dl>             | Indicates that the fields specified in the **pFields** array are JOB\_NOTIFY\_FIELD\_\* constants.<br/>     |
     * | <span id="PRINTER_NOTIFY_TYPE"></span><span id="printer_notify_type"></span><dl> <dt>**PRINTER\_NOTIFY\_TYPE**</dt> <dt>0x00</dt> </dl> | Indicates that the fields specified in the **pFields** array are PRINTER\_NOTIFY\_FIELD\_\* constants.<br/> |
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    Reserved0 {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    Reserved1 {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    Reserved2 {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The number of elements in the **pFields** array.
     * @type {Integer}
     */
    Count {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * A pointer to an array of values. Each element of the array specifies a job or printer information field of interest. For a list of supported printer and job information fields, see the [**PRINTER\_NOTIFY\_INFO\_DATA**](printer-notify-info-data.md) structure.
     * @type {Pointer<UInt16>}
     */
    pFields {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
