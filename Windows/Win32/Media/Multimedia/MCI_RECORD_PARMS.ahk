#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The MCI\_RECORD\_PARMS structure contains positioning information for the MCI\_RECORD command.
 * @remarks
 * When assigning data to the members of this structure, set the corresponding flags in the *fdwCommand* parameter of the [**mciSendCommand**](/previous-versions//dd757160(v=vs.85)) function to validate the members.
 * @see https://learn.microsoft.com/windows/win32/Multimedia/mci-record-parms
 * @namespace Windows.Win32.Media.Multimedia
 * @version v4.0.30319
 */
class MCI_RECORD_PARMS extends Win32Struct
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
}
