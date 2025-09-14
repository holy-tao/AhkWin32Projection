#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The MCI_DGV_OPEN_PARMSW (Unicode) structure (digitalv.h) contains information for the MCI_OPEN command for digital-video devices.
 * @remarks
 * When assigning data to the members of this structure, set the corresponding flags in the <i>fdwCommand</i> parameter of the <a href="https://docs.microsoft.com/previous-versions/dd757160(v=vs.85)">mciSendCommand</a> function to validate the members.
  * 
  * 
  * 
  * 
  * 
  * > [!NOTE]
  * > The digitalv.h header defines MCI_DGV_OPEN_PARMS as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/digitalv/ns-digitalv-mci_dgv_open_parmsw
 * @namespace Windows.Win32.Media.Multimedia
 * @version v4.0.30319
 * @charset Unicode
 */
class MCI_DGV_OPEN_PARMSW extends Win32Struct
{
    static sizeof => 48

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
     * Device ID returned to user.
     * @type {Integer}
     */
    wDeviceID {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Name or constant ID of device type.
     * @type {Pointer<PWSTR>}
     */
    lpstrDeviceType {
        get => NumGet(this, 12, "ptr")
        set => NumPut("ptr", value, this, 12)
    }

    /**
     * Optional device alias.
     * @type {Pointer<PWSTR>}
     */
    lpstrElementName {
        get => NumGet(this, 20, "ptr")
        set => NumPut("ptr", value, this, 20)
    }

    /**
     * Optional device alias.
     * @type {Pointer<PWSTR>}
     */
    lpstrAlias {
        get => NumGet(this, 28, "ptr")
        set => NumPut("ptr", value, this, 28)
    }

    /**
     * Window style.
     * @type {Integer}
     */
    dwStyle {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Handle to parent window.
     * @type {Pointer<HWND>}
     */
    hWndParent {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
