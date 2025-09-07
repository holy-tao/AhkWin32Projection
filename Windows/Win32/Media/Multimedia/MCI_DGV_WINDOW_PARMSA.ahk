#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * The MCI_DGV_WINDOW_PARMSA (ANSI) structure contains parameters for MCI_WINDOW command for digital-video devices.
 * @remarks
 * When assigning data to the members of this structure, set the corresponding flags in the <i>fdwCommand</i> parameter of the <a href="https://docs.microsoft.com/previous-versions/dd757160(v=vs.85)">mciSendCommand</a> function to validate the members
  * 
  * 
  * 
  * 
  * 
  * > [!NOTE]
  * > The digitalv.h header defines MCI_DGV_WINDOW_PARMS as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/digitalv/ns-digitalv-mci_dgv_window_parmsa
 * @namespace Windows.Win32.Media.Multimedia
 * @version v4.0.30319
 * @charset ANSI
 */
class MCI_DGV_WINDOW_PARMSA extends Win32Struct
{
    static sizeof => 28

    static packingSize => 1

    /**
     * The low-order word specifies a window handle used for the MCI_NOTIFY flag.
     * @type {Pointer}
     */
    dwCallback {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Handle to the display window. If this member is MCI_DGV_WINDOW_HWND, the system uses a default window.
     * @type {HWND}
     */
    hWnd{
        get {
            if(!this.HasProp("__hWnd"))
                this.__hWnd := HWND(this.ptr + 8)
            return this.__hWnd
        }
    }

    /**
     * Window-display command.
     * @type {Integer}
     */
    nCmdShow {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Window caption.
     * @type {PSTR}
     */
    lpstrText{
        get {
            if(!this.HasProp("__lpstrText"))
                this.__lpstrText := PSTR(this.ptr + 20)
            return this.__lpstrText
        }
    }
}
