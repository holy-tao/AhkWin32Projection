#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\PRINTER_NOTIFY_INFO_DATA.ahk

/**
 * The PRINTER\_NOTIFY\_INFO structure contains printer information returned by the FindNextPrinterChangeNotification function. The function returns this information after a wait operation on a printer change notification object has been satisfied.
 * @remarks
 * If the **Flags** member has the PRINTER\_NOTIFY\_INFO\_DISCARDED bit set, this indicates that an overflow or error occurred, and notifications may have been lost. In this case, you must call [**FindNextPrinterChangeNotification**](findnextprinterchangenotification.md) and specify the PRINTER\_NOTIFY\_OPTIONS\_REFRESH flag to retrieve all current information. Until you request this refresh operation, the system will not send additional notifications for this change notification object.
 * @see https://learn.microsoft.com/windows/win32/printdocs/printer-notify-info
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class PRINTER_NOTIFY_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The version of this structure. Set this member to 2.
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A bit flag that indicates the state of the notification structure. If the PRINTER\_NOTIFY\_INFO\_DISCARDED bit is set, it indicates that some notifications had to be discarded.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The number of [**PRINTER\_NOTIFY\_INFO\_DATA**](printer-notify-info-data.md) elements in the **aData** array.
     * @type {Integer}
     */
    Count {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * An array of [**PRINTER\_NOTIFY\_INFO\_DATA**](printer-notify-info-data.md) structures. Each element of the array identifies a single job or printer information field, and provides the current data for that field.
     * @type {Array<PRINTER_NOTIFY_INFO_DATA>}
     */
    aData{
        get {
            if(!this.HasProp("__aDataProxyArray"))
                this.__aDataProxyArray := Win32FixedArray(this.ptr + 16, 1, PRINTER_NOTIFY_INFO_DATA, "")
            return this.__aDataProxyArray
        }
    }
}
