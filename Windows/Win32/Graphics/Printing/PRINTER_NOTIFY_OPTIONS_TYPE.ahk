#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The PRINTER\_NOTIFY\_OPTIONS\_TYPE structure specifies the set of printer or job information fields to be monitored by a printer change notification object.A call to the FindFirstPrinterChangeNotification function specifies a PRINTER\_NOTIFY\_OPTIONS structure, which contains an array of PRINTER\_NOTIFY\_OPTIONS\_TYPE structures.
 * @see https://learn.microsoft.com/windows/win32/printdocs/printer-notify-options-type
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct PRINTER_NOTIFY_OPTIONS_TYPE {
    #StructPack 8

    /**
     * The type to be watched. This member can be one of the following values.
     * 
     * 
     * 
     * | Value                                                                                                                                                                                                                                      | Meaning                                                                                                           |
     * |--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------|
     * | <span id="JOB_NOTIFY_TYPE"></span><span id="job_notify_type"></span><dl> <dt>**JOB\_NOTIFY\_TYPE**</dt> <dt>0x01</dt> </dl>             | Indicates that the fields specified in the **pFields** array are JOB\_NOTIFY\_FIELD\_\* constants.<br/>     |
     * | <span id="PRINTER_NOTIFY_TYPE"></span><span id="printer_notify_type"></span><dl> <dt>**PRINTER\_NOTIFY\_TYPE**</dt> <dt>0x00</dt> </dl> | Indicates that the fields specified in the **pFields** array are PRINTER\_NOTIFY\_FIELD\_\* constants.<br/> |
     */
    Type : UInt16

    /**
     * Reserved.
     */
    Reserved0 : UInt16

    /**
     * Reserved.
     */
    Reserved1 : UInt32

    /**
     * Reserved.
     */
    Reserved2 : UInt32

    /**
     * The number of elements in the **pFields** array.
     */
    Count : UInt32

    /**
     * A pointer to an array of values. Each element of the array specifies a job or printer information field of interest. For a list of supported printer and job information fields, see the [**PRINTER\_NOTIFY\_INFO\_DATA**](printer-notify-info-data.md) structure.
     */
    pFields : IntPtr

}
