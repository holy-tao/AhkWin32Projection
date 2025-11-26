#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The command sink is implemented by you for an application when you want to receive a playback of the commands recorded in a command list.
 * @remarks
 * 
 * The <b>ID2D1CommandSink</b> can be implemented to receive a play-back of the commands recorded in a command list. This interface is typically used for transforming the command list into another format  where some degree of conversion between the Direct2D primitives and the target format is required.
 *       
 *       
 * 
 * The <b>ID2D1CommandSink</b> interface does not have any resource creation methods. The resources are logically bound to the Direct2D device on which the <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1commandlist">ID2D1CommandList</a> was created and will be passed in to the <b>ID2D1CommandSink</b> implementation.
 *       
 *       
 * 
 * Not all methods implemented by <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1devicecontext">ID2D1DeviceContext</a> are present.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nn-d2d1_1-id2d1commandsink
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1CommandSink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1CommandSink
     * @type {Guid}
     */
    static IID => Guid("{54d7898a-a061-40a7-bec7-e465bcba2c4f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["BeginDraw", "EndDraw", "SetAntialiasMode", "SetTags", "SetTextAntialiasMode", "SetTextRenderingParams", "SetTransform", "SetPrimitiveBlend", "SetUnitMode", "Clear", "DrawGlyphRun", "DrawLine", "DrawGeometry", "DrawRectangle", "DrawBitmap", "DrawImage", "DrawGdiMetafile", "FillMesh", "FillOpacityMask", "FillGeometry", "FillRectangle", "PushAxisAlignedClip", "PushLayer", "PopAxisAlignedClip", "PopLayer"]

    /**
     * Notifies the implementation of the command sink that drawing is about to commence.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This method always returns <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1commandsink-begindraw
     */
    BeginDraw() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Indicates when ID2D1CommandSink processing has completed.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method/function succeeds, it returns <b>S_OK</b>. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1commandsink-enddraw
     */
    EndDraw() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Sets the antialiasing mode that will be used to render any subsequent geometry.
     * @param {Integer} antialiasMode Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/ne-d2d1-d2d1_antialias_mode">D2D1_ANTIALIAS_MODE</a></b>
     * 
     * The antialiasing mode selected for the command list.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1commandsink-setantialiasmode
     */
    SetAntialiasMode(antialiasMode) {
        result := ComCall(5, this, "int", antialiasMode, "HRESULT")
        return result
    }

    /**
     * Sets the tags that correspond to the tags in the command sink.
     * @param {Integer} tag1 Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-tag">D2D1_TAG</a></b>
     * 
     * The first tag to associate with the primitive.
     * @param {Integer} tag2 Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-tag">D2D1_TAG</a></b>
     * 
     * The second tag to associate with the primitive.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1commandsink-settags
     */
    SetTags(tag1, tag2) {
        result := ComCall(6, this, "uint", tag1, "uint", tag2, "HRESULT")
        return result
    }

    /**
     * Indicates the new default antialiasing mode for text.
     * @param {Integer} textAntialiasMode Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/ne-d2d1-d2d1_text_antialias_mode">D2D1_TEXT_ANTIALIAS_MODE</a></b>
     * 
     * The antialiasing mode for the text.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1commandsink-settextantialiasmode
     */
    SetTextAntialiasMode(textAntialiasMode) {
        result := ComCall(7, this, "int", textAntialiasMode, "HRESULT")
        return result
    }

    /**
     * Indicates more detailed text rendering parameters.
     * @param {IDWriteRenderingParams} textRenderingParams Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dwrite/nn-dwrite-idwriterenderingparams">IDWriteRenderingParams</a>*</b>
     * 
     * The parameters to use for text rendering.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1commandsink-settextrenderingparams
     */
    SetTextRenderingParams(textRenderingParams) {
        result := ComCall(8, this, "ptr", textRenderingParams, "HRESULT")
        return result
    }

    /**
     * Sets a new transform.
     * @param {Pointer<D2D_MATRIX_3X2_F>} transform Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-matrix-3x2-f">D2D1_MATRIX_3X2_F</a>*</b>
     * 
     * The transform to be set.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1commandsink-settransform
     */
    SetTransform(transform) {
        result := ComCall(9, this, "ptr", transform, "HRESULT")
        return result
    }

    /**
     * Sets a new primitive blend mode.
     * @param {Integer} primitiveBlend Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_primitive_blend">D2D1_PRIMITIVE_BLEND</a></b>
     * 
     * The primitive blend that will apply to subsequent primitives.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1commandsink-setprimitiveblend
     */
    SetPrimitiveBlend(primitiveBlend) {
        result := ComCall(10, this, "int", primitiveBlend, "HRESULT")
        return result
    }

    /**
     * The unit mode changes the meaning of subsequent units from device-independent pixels (DIPs) to pixels or the other way. The command sink does not record a DPI, this is implied by the playback context or other playback interface such as ID2D1PrintControl.
     * @param {Integer} unitMode Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_unit_mode">D2D1_UNIT_MODE</a></b>
     * 
     * The enumeration that specifies how units are to be interpreted.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1commandsink-setunitmode
     */
    SetUnitMode(unitMode) {
        result := ComCall(11, this, "int", unitMode, "HRESULT")
        return result
    }

    /**
     * Clears the drawing area to the specified color.
     * @param {Pointer<D2D1_COLOR_F>} color Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-color-f">D2D1_COLOR_F</a>*</b>
     * 
     * The color to which the command sink should be cleared.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1commandsink-clear
     */
    Clear(color) {
        result := ComCall(12, this, "ptr", color, "HRESULT")
        return result
    }

    /**
     * Indicates the glyphs to be drawn.
     * @param {D2D_POINT_2F} baselineOrigin Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-point-2f">D2D1_POINT_2F</a></b>
     * 
     * The upper left corner of the baseline.
     * @param {Pointer<DWRITE_GLYPH_RUN>} glyphRun Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/dwrite/ns-dwrite-dwrite_glyph_run">DWRITE_GLYPH_RUN</a>*</b>
     * 
     * The glyphs to render.
     * @param {Pointer<DWRITE_GLYPH_RUN_DESCRIPTION>} glyphRunDescription Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/dwrite/ns-dwrite-dwrite_glyph_run_description">DWRITE_GLYPH_RUN_DESCRIPTION</a>*</b>
     * 
     * Additional non-rendering information about the glyphs.
     * @param {ID2D1Brush} foregroundBrush Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nn-d2d1-id2d1brush">ID2D1Brush</a>*</b>
     * 
     * The brush used to fill the glyphs.
     * @param {Integer} measuringMode Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcommon/ne-dcommon-dwrite_measuring_mode">DWRITE_MEASURING_MODE</a></b>
     * 
     * The measuring mode to apply to the glyphs.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1commandsink-drawglyphrun
     */
    DrawGlyphRun(baselineOrigin, glyphRun, glyphRunDescription, foregroundBrush, measuringMode) {
        result := ComCall(13, this, "ptr", baselineOrigin, "ptr", glyphRun, "ptr", glyphRunDescription, "ptr", foregroundBrush, "int", measuringMode, "HRESULT")
        return result
    }

    /**
     * Draws a line drawn between two points.
     * @param {D2D_POINT_2F} point0 Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-point-2f">D2D1_POINT_2F</a></b>
     * 
     * The start point of the line.
     * @param {D2D_POINT_2F} point1 Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-point-2f">D2D1_POINT_2F</a></b>
     * 
     * The end point of the line.
     * @param {ID2D1Brush} brush Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nn-d2d1-id2d1brush">ID2D1Brush</a>*</b>
     * 
     * The brush used to fill the line.
     * @param {Float} strokeWidth Type: <b>FLOAT</b>
     * 
     * The width of the stroke to fill the line.
     * @param {ID2D1StrokeStyle} strokeStyle Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nn-d2d1-id2d1strokestyle">ID2D1StrokeStyle</a>*</b>
     * 
     * The style of the stroke. If not specified, the stroke is solid.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1commandsink-drawline
     */
    DrawLine(point0, point1, brush, strokeWidth, strokeStyle) {
        result := ComCall(14, this, "ptr", point0, "ptr", point1, "ptr", brush, "float", strokeWidth, "ptr", strokeStyle, "HRESULT")
        return result
    }

    /**
     * Indicates the geometry to be drawn to the command sink.
     * @param {ID2D1Geometry} geometry Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nn-d2d1-id2d1geometry">ID2D1Geometry </a>*</b>
     * 
     * The geometry to be stroked.
     * @param {ID2D1Brush} brush Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nn-d2d1-id2d1brush">ID2D1Brush</a>*</b>
     * 
     * The brush that will be used to fill the stroked geometry.
     * @param {Float} strokeWidth Type: <b>FLOAT</b>
     * 
     * The width of the stroke.
     * @param {ID2D1StrokeStyle} strokeStyle Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nn-d2d1-id2d1strokestyle">ID2D1StrokeStyle</a>*</b>
     * 
     * The style of the stroke.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * An HRESULT.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1commandsink-drawgeometry
     */
    DrawGeometry(geometry, brush, strokeWidth, strokeStyle) {
        result := ComCall(15, this, "ptr", geometry, "ptr", brush, "float", strokeWidth, "ptr", strokeStyle, "HRESULT")
        return result
    }

    /**
     * Draws a rectangle.
     * @param {Pointer<D2D_RECT_F>} rect Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-rect-f">D2D1_RECT_F</a>*</b>
     * 
     * The rectangle to be drawn to the command sink.
     * @param {ID2D1Brush} brush Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nn-d2d1-id2d1brush">ID2D1Brush</a>*</b>
     * 
     * The brush used to stroke the geometry.
     * @param {Float} strokeWidth Type: <b>FLOAT</b>
     * 
     * The width of the stroke.
     * @param {ID2D1StrokeStyle} strokeStyle Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nn-d2d1-id2d1strokestyle">ID2D1StrokeStyle</a>*</b>
     * 
     * The style of the stroke.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1commandsink-drawrectangle
     */
    DrawRectangle(rect, brush, strokeWidth, strokeStyle) {
        result := ComCall(16, this, "ptr", rect, "ptr", brush, "float", strokeWidth, "ptr", strokeStyle, "HRESULT")
        return result
    }

    /**
     * Draws a bitmap to the render target.
     * @param {ID2D1Bitmap} bitmap Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nn-d2d1-id2d1bitmap">ID2D1Bitmap</a>*</b>
     * 
     * The bitmap to draw.
     * @param {Pointer<D2D_RECT_F>} destinationRectangle Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-rect-f">D2D1_RECT_F</a></b>
     * 
     * The destination rectangle. The default is the size of the bitmap and the location is the upper left corner of the render target.
     * @param {Float} opacity Type: <b>FLOAT</b>
     * 
     * The opacity of the bitmap.
     * @param {Integer} interpolationMode Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_interpolation_mode">D2D1_INTERPOLATION_MODE</a></b>
     * 
     * The interpolation mode to use.
     * @param {Pointer<D2D_RECT_F>} sourceRectangle Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-rect-f">D2D1_RECT_F</a></b>
     * 
     * An optional source rectangle.
     * @param {Pointer<D2D_MATRIX_4X4_F>} perspectiveTransform Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-matrix-4x4-f">D2D1_MATRIX_4X4_F</a></b>
     * 
     * An optional perspective transform.
     * @returns {HRESULT} This method does not return a value.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1commandsink-drawbitmap
     */
    DrawBitmap(bitmap, destinationRectangle, opacity, interpolationMode, sourceRectangle, perspectiveTransform) {
        result := ComCall(17, this, "ptr", bitmap, "ptr", destinationRectangle, "float", opacity, "int", interpolationMode, "ptr", sourceRectangle, "ptr", perspectiveTransform, "HRESULT")
        return result
    }

    /**
     * Draws the provided image to the command sink.
     * @param {ID2D1Image} image Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nn-d2d1-id2d1image">ID2D1Image</a>*</b>
     * 
     * The image to be drawn to the command sink.
     * @param {Pointer<D2D_POINT_2F>} targetOffset Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-point-2f">D2D1_POINT_2F</a>*</b>
     * 
     * This defines the offset in the destination space that the image will be rendered to. The entire logical extent of the image will be rendered to the corresponding destination. If not specified, the destination origin will be (0, 0). The top-left corner of the image will be mapped to the target offset. This will not necessarily be the origin.
     * @param {Pointer<D2D_RECT_F>} imageRectangle Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-rect-f">D2D1_RECT_F</a>*</b>
     * 
     * The corresponding rectangle in the image space will be mapped to the provided origins when processing the image.
     * @param {Integer} interpolationMode Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_interpolation_mode">D2D1_INTERPOLATION_MODE</a></b>
     * 
     * The interpolation mode to use to  scale the image if necessary.
     * @param {Integer} compositeMode Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_composite_mode">D2D1_COMPOSITE_MODE</a></b>
     * 
     * If specified, the composite mode that will be applied to the limits of the currently selected clip.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1commandsink-drawimage
     */
    DrawImage(image, targetOffset, imageRectangle, interpolationMode, compositeMode) {
        result := ComCall(18, this, "ptr", image, "ptr", targetOffset, "ptr", imageRectangle, "int", interpolationMode, "int", compositeMode, "HRESULT")
        return result
    }

    /**
     * Draw a metafile to the device context.
     * @param {ID2D1GdiMetafile} gdiMetafile Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1gdimetafile">ID2D1GdiMetafile</a>*</b>
     * 
     * The metafile to draw.
     * @param {Pointer<D2D_POINT_2F>} targetOffset Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-point-2f">D2D1_POINT_2F</a>*</b>
     * 
     * The offset from the upper left corner of the render target.
     * @returns {HRESULT} This method does not return a value.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1commandsink-drawgdimetafile
     */
    DrawGdiMetafile(gdiMetafile, targetOffset) {
        result := ComCall(19, this, "ptr", gdiMetafile, "ptr", targetOffset, "HRESULT")
        return result
    }

    /**
     * Indicates a mesh to be filled by the command sink.
     * @param {ID2D1Mesh} mesh Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nn-d2d1-id2d1mesh">ID2D1Mesh</a>*</b>
     * 
     * The mesh object to be filled.
     * @param {ID2D1Brush} brush Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nn-d2d1-id2d1brush">ID2D1Brush</a>*</b>
     * 
     * The brush with which to fill the mesh.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1commandsink-fillmesh
     */
    FillMesh(mesh, brush) {
        result := ComCall(20, this, "ptr", mesh, "ptr", brush, "HRESULT")
        return result
    }

    /**
     * Fills an opacity mask on the command sink.
     * @param {ID2D1Bitmap} opacityMask Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nn-d2d1-id2d1bitmap">ID2D1Bitmap</a>*</b>
     * 
     * The bitmap whose alpha channel will be sampled to define the opacity mask.
     * @param {ID2D1Brush} brush Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nn-d2d1-id2d1brush">ID2D1Brush</a>*</b>
     * 
     * The brush with which to fill the mask.
     * @param {Pointer<D2D_RECT_F>} destinationRectangle Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-rect-f">D2D1_RECT_F</a>*</b>
     * 
     * The destination rectangle in which to fill the mask. If not specified, this is the origin.
     * @param {Pointer<D2D_RECT_F>} sourceRectangle Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-rect-f">D2D1_RECT_F</a>*</b>
     * 
     * The source rectangle within the opacity mask. If not specified, this is the entire mask.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1commandsink-fillopacitymask
     */
    FillOpacityMask(opacityMask, brush, destinationRectangle, sourceRectangle) {
        result := ComCall(21, this, "ptr", opacityMask, "ptr", brush, "ptr", destinationRectangle, "ptr", sourceRectangle, "HRESULT")
        return result
    }

    /**
     * Indicates to the command sink a geometry to be filled.
     * @param {ID2D1Geometry} geometry Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nn-d2d1-id2d1geometry">ID2D1Geometry</a>*</b>
     * 
     * The geometry that should be filled.
     * @param {ID2D1Brush} brush Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nn-d2d1-id2d1brush">ID2D1Brush</a>*</b>
     * 
     * The primary brush used to fill the geometry.
     * @param {ID2D1Brush} opacityBrush Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nn-d2d1-id2d1brush">ID2D1Brush</a>*</b>
     * 
     * A brush whose alpha channel is used to modify the opacity of the primary fill brush.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1commandsink-fillgeometry
     */
    FillGeometry(geometry, brush, opacityBrush) {
        result := ComCall(22, this, "ptr", geometry, "ptr", brush, "ptr", opacityBrush, "HRESULT")
        return result
    }

    /**
     * Indicates to the command sink a rectangle to be filled.
     * @param {Pointer<D2D_RECT_F>} rect Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-rect-f">D2D1_RECT_F</a>*</b>
     * 
     * The rectangle to fill.
     * @param {ID2D1Brush} brush Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nn-d2d1-id2d1brush">ID2D1Brush</a>*</b>
     * 
     * The brush with which to fill the rectangle.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1commandsink-fillrectangle
     */
    FillRectangle(rect, brush) {
        result := ComCall(23, this, "ptr", rect, "ptr", brush, "HRESULT")
        return result
    }

    /**
     * Pushes a clipping rectangle onto the clip and layer stack.
     * @param {Pointer<D2D_RECT_F>} clipRect Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-rect-f">D2D1_RECT_F</a>*</b>
     * 
     * The rectangle that defines the clip.
     * @param {Integer} antialiasMode Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/ne-d2d1-d2d1_antialias_mode">D2D1_ANTIALIAS_MODE</a></b>
     * 
     * The antialias mode for the clip.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1commandsink-pushaxisalignedclip
     */
    PushAxisAlignedClip(clipRect, antialiasMode) {
        result := ComCall(24, this, "ptr", clipRect, "int", antialiasMode, "HRESULT")
        return result
    }

    /**
     * Pushes a layer onto the clip and layer stack.
     * @param {Pointer<D2D1_LAYER_PARAMETERS1>} layerParameters1 Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d2d1/ns-d2d1-d2d1_layer_parameters">D2D1_LAYER_PARAMETERS1</a>*</b>
     * 
     * The parameters that define the layer.
     * @param {ID2D1Layer} layer Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nn-d2d1-id2d1layer">ID2D1Layer</a>*</b>
     * 
     * The layer resource that receives subsequent drawing operations.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1commandsink-pushlayer
     */
    PushLayer(layerParameters1, layer) {
        result := ComCall(25, this, "ptr", layerParameters1, "ptr", layer, "HRESULT")
        return result
    }

    /**
     * Removes an axis-aligned clip from the layer and clip stack.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1commandsink-popaxisalignedclip
     */
    PopAxisAlignedClip() {
        result := ComCall(26, this, "HRESULT")
        return result
    }

    /**
     * Removes a layer from the layer and clip stack.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1commandsink-poplayer
     */
    PopLayer() {
        result := ComCall(27, this, "HRESULT")
        return result
    }
}
