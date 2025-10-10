#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The MCI_DGV_SET_PARMS structure contains parameters for the MCI_SET command for digital-video devices.
 * @remarks
 * 
  * When assigning data to the members of this structure, set the corresponding flags in the <i>fdwCommand</i> parameter of the <a href="https://docs.microsoft.com/previous-versions/dd757160(v=vs.85)">mciSendCommand</a> function to validate the members.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//digitalv/ns-digitalv-mci_dgv_set_parms
 * @namespace Windows.Win32.Media.Multimedia
 * @version v4.0.30319
 */
class MCI_DGV_SET_PARMS extends Win32Struct
{
    static sizeof => 24

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
     * Time format of device.
     * @type {Integer}
     */
    dwTimeFormat {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Channel for audio output.
     * @type {Integer}
     */
    dwAudio {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * File format.
     * @type {Integer}
     */
    dwFileFormat {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Playback speed.
     * @type {Integer}
     */
    dwSpeed {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
