#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The MCI_DGV_OPEN_PARMSA (ANSI) structure (digitalv.h) contains information for the MCI_OPEN command for digital-video devices.
 * @remarks
 * When assigning data to the members of this structure, set the corresponding flags in the <i>fdwCommand</i> parameter of the <a href="https://docs.microsoft.com/previous-versions/dd757160(v=vs.85)">mciSendCommand</a> function to validate the members.
  * 
  * 
  * 
  * 
  * 
  * > [!NOTE]
  * > The digitalv.h header defines MCI_DGV_OPEN_PARMS as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/digitalv/ns-digitalv-mci_dgv_open_parmsa
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
     * @type {Pointer<Byte>}
     */
    lpstrDeviceType {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Optional device alias.
     * @type {Pointer<Byte>}
     */
    lpstrElementName {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Optional device alias.
     * @type {Pointer<Byte>}
     */
    lpstrAlias {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
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
     * @type {Pointer<Void>}
     */
    hWndParent {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }
}
