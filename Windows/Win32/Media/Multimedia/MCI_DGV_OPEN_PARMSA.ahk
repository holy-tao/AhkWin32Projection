#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk
#Include ..\..\Foundation\HWND.ahk

/**
 * The MCI_DGV_OPEN_PARMS structure contains information for the MCI_OPEN command for digital-video devices.
 * @remarks
 * 
  * When assigning data to the members of this structure, set the corresponding flags in the <i>fdwCommand</i> parameter of the <a href="https://docs.microsoft.com/previous-versions/dd757160(v=vs.85)">mciSendCommand</a> function to validate the members.
  * 
  * 
  * 
  * 
  * 
  * > [!NOTE]
  * > The digitalv.h header defines MCI_DGV_OPEN_PARMS as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//digitalv/ns-digitalv-mci_dgv_open_parmsa
 * @namespace Windows.Win32.Media.Multimedia
 * @version v4.0.30319
 * @charset ANSI
 */
class MCI_DGV_OPEN_PARMSA extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * The low-order word specifies a window handle used for the MCI_NOTIFY flag.
     * @type {Pointer}
     */
    dwCallback {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Device ID returned to user.
     * @type {Integer}
     */
    wDeviceID {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Name or constant ID of device type.
     * @type {PSTR}
     */
    lpstrDeviceType{
        get {
            if(!this.HasProp("__lpstrDeviceType"))
                this.__lpstrDeviceType := PSTR(this.ptr + 16)
            return this.__lpstrDeviceType
        }
    }

    /**
     * Optional device alias.
     * @type {PSTR}
     */
    lpstrElementName{
        get {
            if(!this.HasProp("__lpstrElementName"))
                this.__lpstrElementName := PSTR(this.ptr + 24)
            return this.__lpstrElementName
        }
    }

    /**
     * Optional device alias.
     * @type {PSTR}
     */
    lpstrAlias{
        get {
            if(!this.HasProp("__lpstrAlias"))
                this.__lpstrAlias := PSTR(this.ptr + 32)
            return this.__lpstrAlias
        }
    }

    /**
     * Window style.
     * @type {Integer}
     */
    dwStyle {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Handle to parent window.
     * @type {HWND}
     */
    hWndParent{
        get {
            if(!this.HasProp("__hWndParent"))
                this.__hWndParent := HWND(this.ptr + 48)
            return this.__hWndParent
        }
    }
}
