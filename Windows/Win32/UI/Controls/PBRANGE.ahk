#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about the high and low limits of a progress bar control. This structure is used with the PBM_GETRANGE message.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-pbrange
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class PBRANGE extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Type: <b>int</b>
     * 
     * Low limit for the progress bar control. This is a signed integer.
     * @type {Integer}
     */
    iLow {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b>int</b>
     * 
     * High limit for the progress bar control. This is a signed integer.
     * @type {Integer}
     */
    iHigh {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
