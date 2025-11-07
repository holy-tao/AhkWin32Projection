#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\POINT.ahk

/**
 * The DXGI_OUTDUPL_POINTER_POSITION structure describes the position of the hardware cursor.
 * @remarks
 * 
 * The <b>Position</b> member is valid only if the <b>Visible</b> member’s value is set to <b>TRUE</b>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dxgi1_2/ns-dxgi1_2-dxgi_outdupl_pointer_position
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class DXGI_OUTDUPL_POINTER_POSITION extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The position of the hardware cursor relative to the top-left of the adapter output.
     * @type {POINT}
     */
    Position{
        get {
            if(!this.HasProp("__Position"))
                this.__Position := POINT(0, this)
            return this.__Position
        }
    }

    /**
     * Specifies whether the hardware cursor is visible. <b>TRUE</b> if visible; otherwise, <b>FALSE</b>. If the hardware cursor is not visible, the calling application does not display the cursor in the client.
     * @type {BOOL}
     */
    Visible {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
