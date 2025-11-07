#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates how pixel shader sampling will be restricted.
 * @remarks
 * 
 * If the shader specifies <b>D2D1_PIXEL_OPTIONS_NONE</b>, it must still correctly implement the region of interest calculations in <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1transform-mapoutputrecttoinputrects">ID2D1Transform::MapOutputRectToInputRects</a> and <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1transform-mapinputrectstooutputrect">ID2D1Transform::MapInputRectsToOutputRect</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d2d1effectauthor/ne-d2d1effectauthor-d2d1_pixel_options
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_PIXEL_OPTIONS{

    /**
     * The pixel shader is not restricted in its sampling.
     * @type {Integer (Int32)}
     */
    static D2D1_PIXEL_OPTIONS_NONE => 0

    /**
     * The pixel shader samples inputs only at the same scene coordinate as the output pixel and returns transparent black whenever the input pixels are also transparent black.
     * @type {Integer (Int32)}
     */
    static D2D1_PIXEL_OPTIONS_TRIVIAL_SAMPLING => 1
}
