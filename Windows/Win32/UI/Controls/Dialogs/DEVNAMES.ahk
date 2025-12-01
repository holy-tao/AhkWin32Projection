#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains strings that identify the driver, device, and output port names for a printer.
 * @see https://learn.microsoft.com/windows/win32/api/commdlg/ns-commdlg-devnames
 * @namespace Windows.Win32.UI.Controls.Dialogs
 * @version v4.0.30319
 */
class DEVNAMES extends Win32Struct
{
    static sizeof => 8

    static packingSize => 2

    /**
     * Type: <b>WORD</b>
     * 
     * The offset, in characters, from the beginning of this structure to a null-terminated string that contains the file name (without the extension) of the device driver. On input, this string is used to determine the printer to display initially in the dialog box.
     * @type {Integer}
     */
    wDriverOffset {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Type: <b>WORD</b>
     * 
     * The offset, in characters, from the beginning of this structure to the null-terminated string that contains the name of the device.
     * @type {Integer}
     */
    wDeviceOffset {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * Type: <b>WORD</b>
     * 
     * The offset, in characters, from the beginning of this structure to the null-terminated string that contains the device name for the physical output medium (output port).
     * @type {Integer}
     */
    wOutputOffset {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * Type: <b>WORD</b>
     * 
     * Indicates whether the strings contained in the <b>DEVNAMES</b> structure identify the default printer. This string is used to verify that the default printer has not changed since the last print operation. If any of the strings do not match, a warning message is displayed informing the user that the document may need to be reformatted. On output, the <b>wDefault</b> member is changed only if the <b>Print Setup</b> dialog box was displayed and the user chose the <b>OK</b> button. The <b>DN_DEFAULTPRN</b> flag is used if the default printer was selected. If a specific printer is selected, the flag is not used. All other flags in this member are reserved for internal use by the dialog box procedure for the <b>Print</b> property sheet or <b>Print</b> dialog box.
     * @type {Integer}
     */
    wDefault {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }
}
