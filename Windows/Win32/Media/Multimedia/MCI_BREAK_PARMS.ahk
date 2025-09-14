#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The MCI\_BREAK\_PARMS structure contains virtual-key code and window information for the MCI\_BREAK command.
 * @remarks
 * When assigning data to the members of this structure, set the corresponding flags in the *fdwCommand* parameter of the [**mciSendCommand**](/previous-versions//dd757160(v=vs.85)) function to validate the members. The following flags are defined:
  * 
  * MCI\_BREAK\_HWND
  * 
  * Validates the **hwndBreak** member specifying the window that must have focus to enable break detection.
  * 
  * MCI\_BREAK\_KEY
  * 
  * Validates the **nVirtKey** member specifying the virtual-key code to be used for the break key.
  * 
  * MCI\_BREAK\_OFF
  * 
  * Disables any existing break key.
 * @see https://learn.microsoft.com/windows/win32/Multimedia/mci-break-parms
 * @namespace Windows.Win32.Media.Multimedia
 * @version v4.0.30319
 */
class MCI_BREAK_PARMS extends Win32Struct
{
    static sizeof => 20

    static packingSize => 1

    /**
     * The low-order word specifies a window handle used for the MCI\_NOTIFY flag.
     * @type {Pointer}
     */
    dwCallback {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Virtual-key code for break key.
     * @type {Integer}
     */
    nVirtKey {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Handle to the window that must be the current window for break detection.
     * @type {Pointer<HWND>}
     */
    hwndBreak {
        get => NumGet(this, 12, "ptr")
        set => NumPut("ptr", value, this, 12)
    }
}
