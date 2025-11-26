#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1CommandSink1.ahk

/**
 * This interface performs all the same functions as the existing ID2D1CommandSink1 interface. It also enables access to ink rendering and gradient mesh rendering.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nn-d2d1_3-id2d1commandsink2
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1CommandSink2 extends ID2D1CommandSink1{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1CommandSink2
     * @type {Guid}
     */
    static IID => Guid("{3bab440e-417e-47df-a2e2-bc0be6a00916}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 29

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["DrawInk", "DrawGradientMesh", "DrawGdiMetafile"]

    /**
     * Renders the given ink object using the given brush and ink style.
     * @param {ID2D1Ink} ink Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/nn-d2d1_3-id2d1ink">ID2D1Ink</a>*</b>
     * 
     * The ink object to be rendered.
     * @param {ID2D1Brush} brush Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nn-d2d1-id2d1brush">ID2D1Brush</a>*</b>
     * 
     * The brush with which to render the ink object.
     * @param {ID2D1InkStyle} inkStyle Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/nn-d2d1_3-id2d1inkstyle">ID2D1InkStyle</a>*</b>
     * 
     * The ink style to use when rendering the ink object.
     * @returns {HRESULT} This method does not return a value.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nf-d2d1_3-id2d1commandsink2-drawink
     */
    DrawInk(ink, brush, inkStyle) {
        result := ComCall(29, this, "ptr", ink, "ptr", brush, "ptr", inkStyle, "HRESULT")
        return result
    }

    /**
     * Renders a given gradient mesh to the target.
     * @param {ID2D1GradientMesh} gradientMesh Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/nn-d2d1_3-id2d1gradientmesh">ID2D1GradientMesh</a>*</b>
     * 
     * The gradient mesh to be rendered.
     * @returns {HRESULT} This method does not return a value.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nf-d2d1_3-id2d1commandsink2-drawgradientmesh
     */
    DrawGradientMesh(gradientMesh) {
        result := ComCall(30, this, "ptr", gradientMesh, "HRESULT")
        return result
    }

    /**
     * Draws a metafile to the command sink using the given source and destination rectangles.
     * @param {ID2D1GdiMetafile} gdiMetafile Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1gdimetafile">ID2D1GdiMetafile</a>*</b>
     * 
     * The metafile to draw.
     * @param {Pointer<D2D_RECT_F>} destinationRectangle Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-rect-f">D2D1_RECT_F</a>*</b>
     * 
     * The rectangle in the target where the metafile will be drawn, relative to the upper left corner (defined in DIPs). If NULL is specified, the destination rectangle is the size of the target.
     * @param {Pointer<D2D_RECT_F>} sourceRectangle Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-rect-f">D2D1_RECT_F</a>*</b>
     * 
     * The rectangle of the source metafile that will be drawn, relative to the upper left corner (defined in DIPs). 
     *      If NULL is specified, the source rectangle is the value returned by <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/nf-d2d1_3-id2d1gdimetafile1-getsourcebounds">ID2D1GdiMetafile1::GetSourceBounds</a>.
     * @returns {HRESULT} This method does not return a value.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nf-d2d1_3-id2d1commandsink2-drawgdimetafile
     */
    DrawGdiMetafile(gdiMetafile, destinationRectangle, sourceRectangle) {
        result := ComCall(31, this, "ptr", gdiMetafile, "ptr", destinationRectangle, "ptr", sourceRectangle, "HRESULT")
        return result
    }
}
