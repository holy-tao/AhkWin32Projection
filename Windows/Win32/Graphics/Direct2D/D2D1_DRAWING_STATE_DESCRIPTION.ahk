#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D2D1_TEXT_ANTIALIAS_MODE.ahk" { D2D1_TEXT_ANTIALIAS_MODE }
#Import "Common\D2D_MATRIX_3X2_F.ahk" { D2D_MATRIX_3X2_F }
#Import ".\D2D1_ANTIALIAS_MODE.ahk" { D2D1_ANTIALIAS_MODE }

/**
 * Describes the drawing state of a render target.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1/ns-d2d1-d2d1_drawing_state_description
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_DRAWING_STATE_DESCRIPTION {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_antialias_mode">D2D1_ANTIALIAS_MODE</a></b>
     * 
     * The antialiasing mode for subsequent nontext drawing operations.
     */
    antialiasMode : D2D1_ANTIALIAS_MODE

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_text_antialias_mode">D2D1_TEXT_ANTIALIAS_MODE</a></b>
     * 
     * The antialiasing mode for subsequent text and glyph drawing operations.
     */
    textAntialiasMode : D2D1_TEXT_ANTIALIAS_MODE

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-tag">D2D1_TAG</a></b>
     * 
     * A label for subsequent drawing operations.
     */
    tag1 : Int64

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-tag">D2D1_TAG</a></b>
     * 
     * A label for subsequent drawing operations.
     */
    tag2 : Int64

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-matrix-3x2-f">D2D1_MATRIX_3X2_F</a></b>
     * 
     * The transformation to apply to subsequent drawing operations.
     */
    transform : D2D_MATRIX_3X2_F

}
