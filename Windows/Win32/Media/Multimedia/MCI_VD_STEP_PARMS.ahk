#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The MCI\_VD\_STEP\_PARMS structure contains information for the MCI\_STEP command for videodisc devices.
 * @remarks
 * When assigning data to the members of this structure, set the corresponding flags in the *fdwCommand* parameter of the [**mciSendCommand**](/previous-versions//dd757160(v=vs.85)) function to validate the members.
 * @see https://learn.microsoft.com/windows/win32/Multimedia/mci-vd-step-parms
 * @namespace Windows.Win32.Media.Multimedia
 * @version v4.0.30319
 */
class MCI_VD_STEP_PARMS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The low-order word specifies a window handle used for the MCI\_NOTIFY flag.
     * @type {Pointer}
     */
    dwCallback {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Number of frames to step.
     * @type {Integer}
     */
    dwFrames {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
