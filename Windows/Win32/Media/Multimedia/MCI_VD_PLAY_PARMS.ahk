#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The MCI\_VD\_PLAY\_PARMS structure contains position and speed information for the MCI\_PLAY command for videodisc devices.
 * @remarks
 * When assigning data to the members of this structure, set the corresponding flags in the *fdwCommand* parameter of the [**mciSendCommand**](/previous-versions//dd757160(v=vs.85)) function to validate the members.
  * 
  * You can use the [**MCI\_PLAY\_PARMS**](mci-play-parms.md) structure instead of **MCI\_VD\_PLAY\_PARMS** if you are not using the extended data members.
 * @see https://learn.microsoft.com/windows/win32/Multimedia/mci-vd-play-parms
 * @namespace Windows.Win32.Media.Multimedia
 * @version v4.0.30319
 */
class MCI_VD_PLAY_PARMS extends Win32Struct
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
     * Position to play from.
     * @type {Integer}
     */
    dwFrom {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Position to play to.
     * @type {Integer}
     */
    dwTo {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Playback speed in frames per second.
     * @type {Integer}
     */
    dwSpeed {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
