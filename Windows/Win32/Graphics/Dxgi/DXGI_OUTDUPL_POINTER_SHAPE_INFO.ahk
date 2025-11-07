#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\POINT.ahk

/**
 * The DXGI_OUTDUPL_POINTER_SHAPE_INFO structure describes information about the cursor shape.
 * @remarks
 * 
 * An application draws the cursor shape with the top-left-hand corner drawn at the position that the <b>Position</b> member of the  <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/ns-dxgi1_2-dxgi_outdupl_pointer_position">DXGI_OUTDUPL_POINTER_POSITION</a> structure specifies; the application does not use the hot spot to draw the cursor shape.
 * 
 * An application calls the  <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgioutputduplication-getframepointershape">IDXGIOutputDuplication::GetFramePointerShape</a> method to retrieve cursor shape information in a  <b>DXGI_OUTDUPL_POINTER_SHAPE_INFO</b> structure.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dxgi1_2/ns-dxgi1_2-dxgi_outdupl_pointer_shape_info
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class DXGI_OUTDUPL_POINTER_SHAPE_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/ne-dxgi1_2-dxgi_outdupl_pointer_shape_type">DXGI_OUTDUPL_POINTER_SHAPE_TYPE</a>-typed value that specifies the type of cursor shape.
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The width in pixels of the mouse cursor.
     * @type {Integer}
     */
    Width {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The height in scan lines of the mouse cursor.
     * @type {Integer}
     */
    Height {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The width in bytes of the mouse cursor.
     * @type {Integer}
     */
    Pitch {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The position of the cursor's hot spot relative to its upper-left pixel. An application does not use the hot spot when it determines where to draw the cursor shape.
     * @type {POINT}
     */
    HotSpot{
        get {
            if(!this.HasProp("__HotSpot"))
                this.__HotSpot := POINT(16, this)
            return this.__HotSpot
        }
    }
}
