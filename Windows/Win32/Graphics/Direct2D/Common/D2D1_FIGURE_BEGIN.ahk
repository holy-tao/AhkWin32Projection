#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates whether a specific ID2D1SimplifiedGeometrySink figure is filled or hollow.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1/ne-d2d1-d2d1_figure_begin
 * @namespace Windows.Win32.Graphics.Direct2D.Common
 * @version v4.0.30319
 */
class D2D1_FIGURE_BEGIN{

    /**
     * Indicates the figure will be filled by the FillGeometry (<a href="https://docs.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1commandsink-fillgeometry">ID2D1CommandSink::FillGeometry</a> 
 *           or <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-fillgeometry">ID2D1RenderTarget::FillGeometry</a>) method.
     * @type {Integer (Int32)}
     */
    static D2D1_FIGURE_BEGIN_FILLED => 0

    /**
     * Indicates the figure will not be filled by the FillGeometry (<a href="https://docs.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1commandsink-fillgeometry">ID2D1CommandSink::FillGeometry</a> 
 *           or <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-fillgeometry">ID2D1RenderTarget::FillGeometry</a>) method and will only consist of an outline. 
 *           Moreover, the bounds of a hollow figure are zero. 
 *           D2D1_FIGURE_BEGIN_HOLLOW should be used for stroking, or for other geometry operations.
     * @type {Integer (Int32)}
     */
    static D2D1_FIGURE_BEGIN_HOLLOW => 1
}
