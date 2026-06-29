#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HWND.ahk" { HWND }

/**
 * The MCI_DGV_WINDOW_PARMSW (Unicode) structure contains parameters for MCI_WINDOW command for digital-video devices.
 * @remarks
 * When assigning data to the members of this structure, set the corresponding flags in the <i>fdwCommand</i> parameter of the <a href="https://docs.microsoft.com/previous-versions/dd757160(v=vs.85)">mciSendCommand</a> function to validate the members
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The digitalv.h header defines MCI_DGV_WINDOW_PARMS as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/digitalv/ns-digitalv-mci_dgv_window_parmsw
 * @namespace Windows.Win32.Media.Multimedia
 * @charset Unicode
 */
export default struct MCI_DGV_WINDOW_PARMSW {
    #StructPack 8

    /**
     * The low-order word specifies a window handle used for the MCI_NOTIFY flag.
     */
    dwCallback : IntPtr

    /**
     * Handle to the display window. If this member is MCI_DGV_WINDOW_HWND, the system uses a default window.
     */
    hWnd : HWND

    /**
     * Window-display command.
     */
    nCmdShow : UInt32

    /**
     * Window caption.
     */
    lpstrText : PWSTR

}
