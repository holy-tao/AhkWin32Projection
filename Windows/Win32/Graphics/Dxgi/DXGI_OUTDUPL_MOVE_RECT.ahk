#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\POINT.ahk" { POINT }
#Import "..\..\Foundation\RECT.ahk" { RECT }

/**
 * The DXGI_OUTDUPL_MOVE_RECT structure describes the movement of a rectangle.
 * @remarks
 * This structure is used by <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgioutputduplication-getframemoverects">GetFrameMoveRects</a>.
 * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/ns-dxgi1_2-dxgi_outdupl_move_rect
 * @namespace Windows.Win32.Graphics.Dxgi
 */
export default struct DXGI_OUTDUPL_MOVE_RECT {
    #StructPack 4

    /**
     * The starting position of a rectangle.
     */
    SourcePoint : POINT

    /**
     * The target region to which to move a rectangle.
     */
    DestinationRect : RECT

}
