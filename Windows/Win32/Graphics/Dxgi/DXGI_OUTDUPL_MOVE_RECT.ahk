#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\POINT.ahk
#Include ..\..\Foundation\RECT.ahk

/**
 * The DXGI_OUTDUPL_MOVE_RECT structure describes the movement of a rectangle.
 * @remarks
 * 
  * This structure is used by <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgioutputduplication-getframemoverects">GetFrameMoveRects</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dxgi1_2/ns-dxgi1_2-dxgi_outdupl_move_rect
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class DXGI_OUTDUPL_MOVE_RECT extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The starting position of a rectangle.
     * @type {POINT}
     */
    SourcePoint{
        get {
            if(!this.HasProp("__SourcePoint"))
                this.__SourcePoint := POINT(this.ptr + 0)
            return this.__SourcePoint
        }
    }

    /**
     * The target region to which to move a rectangle.
     * @type {RECT}
     */
    DestinationRect{
        get {
            if(!this.HasProp("__DestinationRect"))
                this.__DestinationRect := RECT(this.ptr + 8)
            return this.__DestinationRect
        }
    }
}
