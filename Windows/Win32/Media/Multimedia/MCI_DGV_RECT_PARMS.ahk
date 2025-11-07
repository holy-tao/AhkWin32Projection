#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECT.ahk

/**
 * The MCI_DGV_RECT_PARMS structure contains parameters for the MCI_FREEZE, MCI_PUT, MCI_UNFREEZE, and MCI_WHERE commands for digital-video devices.
 * @remarks
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/digitalv/ns-digitalv-mci_dgv_rect_parms">MCI_DGV_FREEZE_PARMS</a>, <a href="https://docs.microsoft.com/previous-versions/dd743397(v=vs.85)">MCI_DGV_PUT_PARMS</a>, <b>MCI_DGV_UNFREEZE_PARMS</b> and <b>MCI_DGV_WHERE_PARMS</b> structures are identical to the <b>MCI_DGV_RECT_PARMS</b> structure.
 * 
 * When assigning data to the members of this structure, set the corresponding flags in the <i>fdwCommand</i> parameter of the <a href="https://docs.microsoft.com/previous-versions/dd757160(v=vs.85)">mciSendCommand</a> function to validate the members.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//digitalv/ns-digitalv-mci_dgv_rect_parms
 * @namespace Windows.Win32.Media.Multimedia
 * @version v4.0.30319
 */
class MCI_DGV_RECT_PARMS extends Win32Struct
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
     * Rectangle containing positioning information. <a href="https://docs.microsoft.com/previous-versions//ms536136(v=vs.85)">RECT</a> structures are handled differently in MCI than in other parts of Windows; in MCI, <b>rc.right</b> contains the width of the rectangle and <b>rc.bottom</b> contains its height.
     * @type {RECT}
     */
    rc{
        get {
            if(!this.HasProp("__rc"))
                this.__rc := RECT(8, this)
            return this.__rc
        }
    }
}
