#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The MCI\_WAVE\_DELETE\_PARMS structure contains position information for the MCI\_DELETE command for waveform-audio devices.
 * @remarks
 * When assigning data to the members of this structure, set the corresponding flags in the *fdwCommand* parameter of the [**mciSendCommand**](/previous-versions//dd757160(v=vs.85)) function to validate the members.
 * @see https://learn.microsoft.com/windows/win32/Multimedia/mci-wave-delete-parms
 * @namespace Windows.Win32.Media.Multimedia
 * @version v4.0.30319
 */
class MCI_WAVE_DELETE_PARMS extends Win32Struct
{
    static sizeof => 16

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
     * Position to delete from.
     * @type {Integer}
     */
    dwFrom {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Position to delete to.
     * @type {Integer}
     */
    dwTo {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
