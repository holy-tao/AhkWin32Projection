#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The MCI_DGV_STATUS_PARMSW (Unicode) structure contains parameters for the MCI_STATUS command for digital-video devices.
 * @remarks
 * When assigning data to the members of this structure, set the corresponding flags in the <i>fdwCommand</i> parameter of the <a href="https://docs.microsoft.com/previous-versions/dd757160(v=vs.85)">mciSendCommand</a> function to validate the members.
  * 
  * 
  * 
  * 
  * 
  * > [!NOTE]
  * > The digitalv.h header defines MCI_DGV_STATUS_PARMS as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/digitalv/ns-digitalv-mci_dgv_status_parmsw
 * @namespace Windows.Win32.Media.Multimedia
 * @version v4.0.30319
 * @charset Unicode
 */
class MCI_DGV_STATUS_PARMSW extends Win32Struct
{
    static sizeof => 36

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
     * Buffer for return information.
     * @type {Pointer}
     */
    dwReturn {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Identifies capability being queried.
     * @type {Integer}
     */
    dwItem {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Length or number of tracks.
     * @type {Integer}
     */
    dwTrack {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Specifies the approximate amount of disk space that can be obtained by the <a href="https://docs.microsoft.com/windows/desktop/Multimedia/mci-reserve">MCI_RESERVE</a> command.
     * @type {Pointer<PWSTR>}
     */
    lpstrDrive {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Specifies the approximate location of the nearest previous intraframe-encoded image.
     * @type {Integer}
     */
    dwReference {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}
