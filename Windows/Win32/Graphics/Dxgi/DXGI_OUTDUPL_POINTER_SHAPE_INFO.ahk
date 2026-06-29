#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\POINT.ahk" { POINT }

/**
 * The DXGI_OUTDUPL_POINTER_SHAPE_INFO structure describes information about the cursor shape.
 * @remarks
 * An application draws the cursor shape with the top-left-hand corner drawn at the position that the <b>Position</b> member of the  <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/ns-dxgi1_2-dxgi_outdupl_pointer_position">DXGI_OUTDUPL_POINTER_POSITION</a> structure specifies; the application does not use the hot spot to draw the cursor shape.
 * 
 * An application calls the  <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgioutputduplication-getframepointershape">IDXGIOutputDuplication::GetFramePointerShape</a> method to retrieve cursor shape information in a  <b>DXGI_OUTDUPL_POINTER_SHAPE_INFO</b> structure.
 * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/ns-dxgi1_2-dxgi_outdupl_pointer_shape_info
 * @namespace Windows.Win32.Graphics.Dxgi
 */
export default struct DXGI_OUTDUPL_POINTER_SHAPE_INFO {
    #StructPack 4

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/ne-dxgi1_2-dxgi_outdupl_pointer_shape_type">DXGI_OUTDUPL_POINTER_SHAPE_TYPE</a>-typed value that specifies the type of cursor shape.
     */
    Type : UInt32

    /**
     * The width in pixels of the mouse cursor.
     */
    Width : UInt32

    /**
     * The height in scan lines of the mouse cursor.
     */
    Height : UInt32

    /**
     * The width in bytes of the mouse cursor.
     */
    Pitch : UInt32

    /**
     * The position of the cursor's hot spot relative to its upper-left pixel. An application does not use the hot spot when it determines where to draw the cursor shape.
     */
    HotSpot : POINT

}
