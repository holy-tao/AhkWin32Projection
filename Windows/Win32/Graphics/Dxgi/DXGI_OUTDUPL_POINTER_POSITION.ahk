#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\POINT.ahk" { POINT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * The DXGI_OUTDUPL_POINTER_POSITION structure describes the position of the hardware cursor.
 * @remarks
 * The <b>Position</b> member is valid only if the <b>Visible</b> member’s value is set to <b>TRUE</b>.
 * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/ns-dxgi1_2-dxgi_outdupl_pointer_position
 * @namespace Windows.Win32.Graphics.Dxgi
 */
export default struct DXGI_OUTDUPL_POINTER_POSITION {
    #StructPack 4

    /**
     * The position of the hardware cursor relative to the top-left of the adapter output.
     */
    Position : POINT

    /**
     * Specifies whether the hardware cursor is visible. <b>TRUE</b> if visible; otherwise, <b>FALSE</b>. If the hardware cursor is not visible, the calling application does not display the cursor in the client.
     */
    Visible : BOOL

}
