#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PRINTER_NOTIFY_INFO_DATA.ahk" { PRINTER_NOTIFY_INFO_DATA }

/**
 * The PRINTER\_NOTIFY\_INFO structure contains printer information returned by the FindNextPrinterChangeNotification function. The function returns this information after a wait operation on a printer change notification object has been satisfied.
 * @remarks
 * If the **Flags** member has the PRINTER\_NOTIFY\_INFO\_DISCARDED bit set, this indicates that an overflow or error occurred, and notifications may have been lost. In this case, you must call [**FindNextPrinterChangeNotification**](findnextprinterchangenotification.md) and specify the PRINTER\_NOTIFY\_OPTIONS\_REFRESH flag to retrieve all current information. Until you request this refresh operation, the system will not send additional notifications for this change notification object.
 * @see https://learn.microsoft.com/windows/win32/printdocs/printer-notify-info
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct PRINTER_NOTIFY_INFO {
    #StructPack 8

    /**
     * The version of this structure. Set this member to 2.
     */
    Version : UInt32

    /**
     * A bit flag that indicates the state of the notification structure. If the PRINTER\_NOTIFY\_INFO\_DISCARDED bit is set, it indicates that some notifications had to be discarded.
     */
    Flags : UInt32

    /**
     * The number of [**PRINTER\_NOTIFY\_INFO\_DATA**](printer-notify-info-data.md) elements in the **aData** array.
     */
    Count : UInt32

    /**
     * An array of [**PRINTER\_NOTIFY\_INFO\_DATA**](printer-notify-info-data.md) structures. Each element of the array identifies a single job or printer information field, and provides the current data for that field.
     */
    aData : PRINTER_NOTIFY_INFO_DATA[1]

}
