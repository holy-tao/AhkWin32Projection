#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECT.ahk
#Include ..\..\Graphics\Gdi\HDC.ahk

/**
 * The MCI_DGV_UPDATE_PARMS structure contains parameters for the MCI_UPDATE command.
 * @remarks
 * 
  * When assigning data to the members of this structure, set the corresponding flags in the <i>fdwCommand</i> parameter of the <a href="https://docs.microsoft.com/previous-versions/dd757160(v=vs.85)">mciSendCommand</a> function to validate the members.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//digitalv/ns-digitalv-mci_dgv_update_parms
 * @namespace Windows.Win32.Media.Multimedia
 * @version v4.0.30319
 */
class MCI_DGV_UPDATE_PARMS extends Win32Struct
{
    static sizeof => 32

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

    /**
     * Handle to display context.
     * @type {HDC}
     */
    hDC{
        get {
            if(!this.HasProp("__hDC"))
                this.__hDC := HDC(24, this)
            return this.__hDC
        }
    }
}
