#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The PRINTER\_NOTIFY\_OPTIONS structure specifies options for a change notification object that monitors a printer or print server.
 * @remarks
 * Use this structure with the [**FindFirstPrinterChangeNotification**](findfirstprinterchangenotification.md) function to specify the set of printer or job information fields to monitor for change.
  * 
  * Use this structure with the [**FindNextPrinterChangeNotification**](findnextprinterchangenotification.md) function to request the current data for all monitored printer and job information fields. In this case, the **Flags** member specifies the PRINTER\_NOTIFY\_OPTIONS\_REFRESH flag, and the function ignores the other structure members.
 * @see https://learn.microsoft.com/windows/win32/printdocs/printer-notify-options
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class PRINTER_NOTIFY_OPTIONS extends Win32Struct
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
     * A bit flag. If you set the PRINTER\_NOTIFY\_OPTIONS\_REFRESH flag in a call to the [**FindNextPrinterChangeNotification**](findnextprinterchangenotification.md) function, the function provides current data for all monitored printer information fields. The [**FindFirstPrinterChangeNotification**](findfirstprinterchangenotification.md) function ignores the **Flags** member.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The number of elements in the **pTypes** array.
     * @type {Integer}
     */
    Count {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * A pointer to an array of [**PRINTER\_NOTIFY\_OPTIONS\_TYPE**](printer-notify-options-type.md) structures. Use one element of this array to specify the printer information fields to monitor, and one element to specify the job information fields to monitor. You can monitor either printer information, job information, or both.
     * @type {Pointer<PRINTER_NOTIFY_OPTIONS_TYPE>}
     */
    pTypes {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
