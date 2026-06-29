#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HWND.ahk" { HWND }

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
 */
export default struct MCI_BREAK_PARMS {
    #StructPack 8

    /**
     * The low-order word specifies a window handle used for the MCI\_NOTIFY flag.
     */
    dwCallback : IntPtr

    /**
     * Virtual-key code for break key.
     */
    nVirtKey : Int32

    /**
     * Handle to the window that must be the current window for break detection.
     */
    hwndBreak : HWND

}
