#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PRINTER_NOTIFY_OPTIONS_TYPE.ahk" { PRINTER_NOTIFY_OPTIONS_TYPE }

/**
 * The PRINTER\_NOTIFY\_OPTIONS structure specifies options for a change notification object that monitors a printer or print server.
 * @remarks
 * Use this structure with the [**FindFirstPrinterChangeNotification**](findfirstprinterchangenotification.md) function to specify the set of printer or job information fields to monitor for change.
 * 
 * Use this structure with the [**FindNextPrinterChangeNotification**](findnextprinterchangenotification.md) function to request the current data for all monitored printer and job information fields. In this case, the **Flags** member specifies the PRINTER\_NOTIFY\_OPTIONS\_REFRESH flag, and the function ignores the other structure members.
 * @see https://learn.microsoft.com/windows/win32/printdocs/printer-notify-options
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct PRINTER_NOTIFY_OPTIONS {
    #StructPack 8

    /**
     * The version of this structure. Set this member to 2.
     */
    Version : UInt32

    /**
     * A bit flag. If you set the PRINTER\_NOTIFY\_OPTIONS\_REFRESH flag in a call to the [**FindNextPrinterChangeNotification**](findnextprinterchangenotification.md) function, the function provides current data for all monitored printer information fields. The [**FindFirstPrinterChangeNotification**](findfirstprinterchangenotification.md) function ignores the **Flags** member.
     */
    Flags : UInt32

    /**
     * The number of elements in the **pTypes** array.
     */
    Count : UInt32

    /**
     * A pointer to an array of [**PRINTER\_NOTIFY\_OPTIONS\_TYPE**](printer-notify-options-type.md) structures. Use one element of this array to specify the printer information fields to monitor, and one element to specify the job information fields to monitor. You can monitor either printer information, job information, or both.
     */
    pTypes : PRINTER_NOTIFY_OPTIONS_TYPE.Ptr

}
