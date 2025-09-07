#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The MCI\_SET\_PARMS structure contains information for the MCI\_SET command.
 * @remarks
 * When assigning data to the members of this structure, set the corresponding flags in the *fdwCommand* parameter of the [**mciSendCommand**](/previous-versions//dd757160(v=vs.85)) function to validate the members.
 * @see https://learn.microsoft.com/windows/win32/Multimedia/mci-set-parms
 * @namespace Windows.Win32.Media.Multimedia
 * @version v4.0.30319
 */
class MCI_SET_PARMS extends Win32Struct
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
     * Time format for device.
     * @type {Integer}
     */
    dwTimeFormat {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Audio output channel.
     * @type {Integer}
     */
    dwAudio {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
