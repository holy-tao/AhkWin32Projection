#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECT.ahk

/**
 * The MCI_DGV_COPY_PARMS structure contains parameters for the MCI_COPY command for digital-video devices.
 * @remarks
 * When assigning data to the members of this structure, set the corresponding flags in the <i>fdwCommand</i> parameter of the <a href="https://docs.microsoft.com/previous-versions/dd757160(v=vs.85)">mciSendCommand</a> function to validate the members.
 * @see https://learn.microsoft.com/windows/win32/api/digitalv/ns-digitalv-mci_dgv_copy_parms
 * @namespace Windows.Win32.Media.Multimedia
 * @version v4.0.30319
 */
class MCI_DGV_COPY_PARMS extends Win32Struct
{
    static sizeof => 40

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
     * Starting position for copy.
     * @type {Integer}
     */
    dwFrom {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Ending position for copy.
     * @type {Integer}
     */
    dwTo {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Rectangle describing area to be copied.   Be aware that <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structures are handled differently in MCI than in other parts of Windows; in MCI, <b>rc.right</b> contains the width of the rectangle and <b>rc.bottom</b> contains its height.
     * @type {RECT}
     */
    rc{
        get {
            if(!this.HasProp("__rc"))
                this.__rc := RECT(this.ptr + 16)
            return this.__rc
        }
    }

    /**
     * Audio stream.
     * @type {Integer}
     */
    dwAudioStream {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Video stream.
     * @type {Integer}
     */
    dwVideoStream {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }
}
