#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The MCI\_STATUS\_PARMS structure contains information for the MCI\_STATUS command.
 * @remarks
 * The MCI\_STATUS\_ITEM flag must be set in the *fdwCommand* parameter of the [**mciSendCommand**](/previous-versions//dd757160(v=vs.85)) function to validate the **dwItem** member, which should contain one of the constants indicating what status information is being requested.
 * @see https://learn.microsoft.com/windows/win32/Multimedia/mci-status-parms
 * @namespace Windows.Win32.Media.Multimedia
 * @version v4.0.30319
 */
class MCI_STATUS_PARMS extends Win32Struct
{
    static sizeof => 24

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
     * Contains information on return.
     * @type {Pointer}
     */
    dwReturn {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Capability being queried.
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
}
