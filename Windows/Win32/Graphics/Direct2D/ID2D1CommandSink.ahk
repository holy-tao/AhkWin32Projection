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
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1commandsink-begindraw
     */
    BeginDraw() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1commandsink-enddraw
     */
    EndDraw() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} antialiasMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1commandsink-setantialiasmode
     */
    SetAntialiasMode(antialiasMode) {
        result := ComCall(5, this, "int", antialiasMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} tag1 
     * @param {Integer} tag2 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1commandsink-settags
     */
    SetTags(tag1, tag2) {
        result := ComCall(6, this, "uint", tag1, "uint", tag2, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} textAntialiasMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1commandsink-settextantialiasmode
     */
    SetTextAntialiasMode(textAntialiasMode) {
        result := ComCall(7, this, "int", textAntialiasMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDWriteRenderingParams} textRenderingParams 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1commandsink-settextrenderingparams
     */
    SetTextRenderingParams(textRenderingParams) {
        result := ComCall(8, this, "ptr", textRenderingParams, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D2D_MATRIX_3X2_F>} transform 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1commandsink-settransform
     */
    SetTransform(transform) {
        result := ComCall(9, this, "ptr", transform, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} primitiveBlend 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1commandsink-setprimitiveblend
     */
    SetPrimitiveBlend(primitiveBlend) {
        result := ComCall(10, this, "int", primitiveBlend, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} unitMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1commandsink-setunitmode
     */
    SetUnitMode(unitMode) {
        result := ComCall(11, this, "int", unitMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D2D1_COLOR_F>} color 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1commandsink-clear
     */
    Clear(color) {
        result := ComCall(12, this, "ptr", color, "HRESULT")
        return result
    }

    /**
     * 
     * @param {D2D_POINT_2F} baselineOrigin 
     * @param {Pointer<DWRITE_GLYPH_RUN>} glyphRun 
     * @param {Pointer<DWRITE_GLYPH_RUN_DESCRIPTION>} glyphRunDescription 
     * @param {ID2D1Brush} foregroundBrush 
     * @param {Integer} measuringMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1commandsink-drawglyphrun
     */
    DrawGlyphRun(baselineOrigin, glyphRun, glyphRunDescription, foregroundBrush, measuringMode) {
        result := ComCall(13, this, "ptr", baselineOrigin, "ptr", glyphRun, "ptr", glyphRunDescription, "ptr", foregroundBrush, "int", measuringMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {D2D_POINT_2F} point0 
     * @param {D2D_POINT_2F} point1 
     * @param {ID2D1Brush} brush 
     * @param {Float} strokeWidth 
     * @param {ID2D1StrokeStyle} strokeStyle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1commandsink-drawline
     */
    DrawLine(point0, point1, brush, strokeWidth, strokeStyle) {
        result := ComCall(14, this, "ptr", point0, "ptr", point1, "ptr", brush, "float", strokeWidth, "ptr", strokeStyle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID2D1Geometry} geometry 
     * @param {ID2D1Brush} brush 
     * @param {Float} strokeWidth 
     * @param {ID2D1StrokeStyle} strokeStyle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1commandsink-drawgeometry
     */
    DrawGeometry(geometry, brush, strokeWidth, strokeStyle) {
        result := ComCall(15, this, "ptr", geometry, "ptr", brush, "float", strokeWidth, "ptr", strokeStyle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D2D_RECT_F>} rect 
     * @param {ID2D1Brush} brush 
     * @param {Float} strokeWidth 
     * @param {ID2D1StrokeStyle} strokeStyle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1commandsink-drawrectangle
     */
    DrawRectangle(rect, brush, strokeWidth, strokeStyle) {
        result := ComCall(16, this, "ptr", rect, "ptr", brush, "float", strokeWidth, "ptr", strokeStyle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID2D1Bitmap} bitmap 
     * @param {Pointer<D2D_RECT_F>} destinationRectangle 
     * @param {Float} opacity 
     * @param {Integer} interpolationMode 
     * @param {Pointer<D2D_RECT_F>} sourceRectangle 
     * @param {Pointer<D2D_MATRIX_4X4_F>} perspectiveTransform 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1commandsink-drawbitmap
     */
    DrawBitmap(bitmap, destinationRectangle, opacity, interpolationMode, sourceRectangle, perspectiveTransform) {
        result := ComCall(17, this, "ptr", bitmap, "ptr", destinationRectangle, "float", opacity, "int", interpolationMode, "ptr", sourceRectangle, "ptr", perspectiveTransform, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID2D1Image} image 
     * @param {Pointer<D2D_POINT_2F>} targetOffset 
     * @param {Pointer<D2D_RECT_F>} imageRectangle 
     * @param {Integer} interpolationMode 
     * @param {Integer} compositeMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1commandsink-drawimage
     */
    DrawImage(image, targetOffset, imageRectangle, interpolationMode, compositeMode) {
        result := ComCall(18, this, "ptr", image, "ptr", targetOffset, "ptr", imageRectangle, "int", interpolationMode, "int", compositeMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID2D1GdiMetafile} gdiMetafile 
     * @param {Pointer<D2D_POINT_2F>} targetOffset 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1commandsink-drawgdimetafile
     */
    DrawGdiMetafile(gdiMetafile, targetOffset) {
        result := ComCall(19, this, "ptr", gdiMetafile, "ptr", targetOffset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID2D1Mesh} mesh 
     * @param {ID2D1Brush} brush 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1commandsink-fillmesh
     */
    FillMesh(mesh, brush) {
        result := ComCall(20, this, "ptr", mesh, "ptr", brush, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID2D1Bitmap} opacityMask 
     * @param {ID2D1Brush} brush 
     * @param {Pointer<D2D_RECT_F>} destinationRectangle 
     * @param {Pointer<D2D_RECT_F>} sourceRectangle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1commandsink-fillopacitymask
     */
    FillOpacityMask(opacityMask, brush, destinationRectangle, sourceRectangle) {
        result := ComCall(21, this, "ptr", opacityMask, "ptr", brush, "ptr", destinationRectangle, "ptr", sourceRectangle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID2D1Geometry} geometry 
     * @param {ID2D1Brush} brush 
     * @param {ID2D1Brush} opacityBrush 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1commandsink-fillgeometry
     */
    FillGeometry(geometry, brush, opacityBrush) {
        result := ComCall(22, this, "ptr", geometry, "ptr", brush, "ptr", opacityBrush, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D2D_RECT_F>} rect 
     * @param {ID2D1Brush} brush 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1commandsink-fillrectangle
     */
    FillRectangle(rect, brush) {
        result := ComCall(23, this, "ptr", rect, "ptr", brush, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D2D_RECT_F>} clipRect 
     * @param {Integer} antialiasMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1commandsink-pushaxisalignedclip
     */
    PushAxisAlignedClip(clipRect, antialiasMode) {
        result := ComCall(24, this, "ptr", clipRect, "int", antialiasMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D2D1_LAYER_PARAMETERS1>} layerParameters1 
     * @param {ID2D1Layer} layer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1commandsink-pushlayer
     */
    PushLayer(layerParameters1, layer) {
        result := ComCall(25, this, "ptr", layerParameters1, "ptr", layer, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1commandsink-popaxisalignedclip
     */
    PopAxisAlignedClip() {
        result := ComCall(26, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1commandsink-poplayer
     */
    PopLayer() {
        result := ComCall(27, this, "HRESULT")
        return result
    }
}
