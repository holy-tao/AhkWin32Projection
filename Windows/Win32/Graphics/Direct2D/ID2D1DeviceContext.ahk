#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1RenderTarget.ahk

/**
 * Represents a set of state and command buffers that are used to render to a target.
 * @remarks
 * 
  *  Any resource created from a device context can be shared with any other resource created from a device context when both contexts are created on the same device.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nn-d2d1_1-id2d1devicecontext
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1DeviceContext extends ID2D1RenderTarget{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1DeviceContext
     * @type {Guid}
     */
    static IID => Guid("{e8f7fe7a-191c-466d-ad95-975678bda998}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 57

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateBitmap", "CreateBitmapFromWicBitmap", "CreateColorContext", "CreateColorContextFromFilename", "CreateColorContextFromWicColorContext", "CreateBitmapFromDxgiSurface", "CreateEffect", "CreateGradientStopCollection", "CreateImageBrush", "CreateBitmapBrush", "CreateCommandList", "IsDxgiFormatSupported", "IsBufferPrecisionSupported", "GetImageLocalBounds", "GetImageWorldBounds", "GetGlyphRunWorldBounds", "GetDevice", "SetTarget", "GetTarget", "SetRenderingControls", "GetRenderingControls", "SetPrimitiveBlend", "GetPrimitiveBlend", "SetUnitMode", "GetUnitMode", "DrawGlyphRun", "DrawImage", "DrawGdiMetafile", "DrawBitmap", "PushLayer", "InvalidateEffectInputRectangle", "GetEffectInvalidRectangleCount", "GetEffectInvalidRectangles", "GetEffectRequiredInputRectangles", "FillOpacityMask"]

    /**
     * The CreateBitmap function creates a bitmap with the specified width, height, and color format (color planes and bits-per-pixel).
     * @param {D2D_SIZE_U} size 
     * @param {Pointer<Void>} sourceData 
     * @param {Integer} pitch 
     * @param {Pointer<D2D1_BITMAP_PROPERTIES1>} bitmapProperties 
     * @param {Pointer<ID2D1Bitmap1>} bitmap 
     * @returns {HRESULT} If the function succeeds, the return value is a handle to a bitmap.
     * 
     * If the function fails, the return value is <b>NULL</b>.
     * 
     * This function can return the following value.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_BITMAP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The calculated size of the bitmap is less than zero.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-createbitmap
     */
    CreateBitmap(size, sourceData, pitch, bitmapProperties, bitmap) {
        sourceDataMarshal := sourceData is VarRef ? "ptr" : "ptr"

        result := ComCall(57, this, "ptr", size, sourceDataMarshal, sourceData, "uint", pitch, "ptr", bitmapProperties, "ptr*", bitmap, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IWICBitmapSource} wicBitmapSource 
     * @param {Pointer<D2D1_BITMAP_PROPERTIES1>} bitmapProperties 
     * @param {Pointer<ID2D1Bitmap1>} bitmap 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-createbitmapfromwicbitmap(iwicbitmapsource_id2d1bitmap1)
     */
    CreateBitmapFromWicBitmap(wicBitmapSource, bitmapProperties, bitmap) {
        result := ComCall(58, this, "ptr", wicBitmapSource, "ptr", bitmapProperties, "ptr*", bitmap, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} space 
     * @param {Pointer<Integer>} profile 
     * @param {Integer} profileSize 
     * @param {Pointer<ID2D1ColorContext>} colorContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-createcolorcontext
     */
    CreateColorContext(space, profile, profileSize, colorContext) {
        profileMarshal := profile is VarRef ? "char*" : "ptr"

        result := ComCall(59, this, "int", space, profileMarshal, profile, "uint", profileSize, "ptr*", colorContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} filename 
     * @param {Pointer<ID2D1ColorContext>} colorContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-createcolorcontextfromfilename
     */
    CreateColorContextFromFilename(filename, colorContext) {
        filename := filename is String ? StrPtr(filename) : filename

        result := ComCall(60, this, "ptr", filename, "ptr*", colorContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IWICColorContext} wicColorContext 
     * @param {Pointer<ID2D1ColorContext>} colorContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-createcolorcontextfromwiccolorcontext
     */
    CreateColorContextFromWicColorContext(wicColorContext, colorContext) {
        result := ComCall(61, this, "ptr", wicColorContext, "ptr*", colorContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDXGISurface} surface 
     * @param {Pointer<D2D1_BITMAP_PROPERTIES1>} bitmapProperties 
     * @param {Pointer<ID2D1Bitmap1>} bitmap 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-createbitmapfromdxgisurface(idxgisurface_constd2d1_bitmap_properties1_id2d1bitmap1)
     */
    CreateBitmapFromDxgiSurface(surface, bitmapProperties, bitmap) {
        result := ComCall(62, this, "ptr", surface, "ptr", bitmapProperties, "ptr*", bitmap, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} effectId 
     * @param {Pointer<ID2D1Effect>} effect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-createeffect
     */
    CreateEffect(effectId, effect) {
        result := ComCall(63, this, "ptr", effectId, "ptr*", effect, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D2D1_GRADIENT_STOP>} straightAlphaGradientStops 
     * @param {Integer} straightAlphaGradientStopsCount 
     * @param {Integer} preInterpolationSpace 
     * @param {Integer} postInterpolationSpace 
     * @param {Integer} bufferPrecision 
     * @param {Integer} extendMode 
     * @param {Integer} colorInterpolationMode 
     * @param {Pointer<ID2D1GradientStopCollection1>} gradientStopCollection1 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-creategradientstopcollection
     */
    CreateGradientStopCollection(straightAlphaGradientStops, straightAlphaGradientStopsCount, preInterpolationSpace, postInterpolationSpace, bufferPrecision, extendMode, colorInterpolationMode, gradientStopCollection1) {
        result := ComCall(64, this, "ptr", straightAlphaGradientStops, "uint", straightAlphaGradientStopsCount, "int", preInterpolationSpace, "int", postInterpolationSpace, "int", bufferPrecision, "int", extendMode, "int", colorInterpolationMode, "ptr*", gradientStopCollection1, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID2D1Image} image 
     * @param {Pointer<D2D1_IMAGE_BRUSH_PROPERTIES>} imageBrushProperties 
     * @param {Pointer<D2D1_BRUSH_PROPERTIES>} brushProperties 
     * @param {Pointer<ID2D1ImageBrush>} imageBrush 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-createimagebrush(id2d1image_constd2d1_image_brush_properties__id2d1imagebrush)
     */
    CreateImageBrush(image, imageBrushProperties, brushProperties, imageBrush) {
        result := ComCall(65, this, "ptr", image, "ptr", imageBrushProperties, "ptr", brushProperties, "ptr*", imageBrush, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID2D1Bitmap} bitmap 
     * @param {Pointer<D2D1_BITMAP_BRUSH_PROPERTIES1>} bitmapBrushProperties 
     * @param {Pointer<D2D1_BRUSH_PROPERTIES>} brushProperties 
     * @param {Pointer<ID2D1BitmapBrush1>} bitmapBrush 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-createbitmapbrush(id2d1bitmap_constd2d1_bitmap_brush_properties1__constd2d1_brush_properties__id2d1bitmapbrush1)
     */
    CreateBitmapBrush(bitmap, bitmapBrushProperties, brushProperties, bitmapBrush) {
        result := ComCall(66, this, "ptr", bitmap, "ptr", bitmapBrushProperties, "ptr", brushProperties, "ptr*", bitmapBrush, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ID2D1CommandList>} commandList 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-createcommandlist
     */
    CreateCommandList(commandList) {
        result := ComCall(67, this, "ptr*", commandList, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} format 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-isdxgiformatsupported
     */
    IsDxgiFormatSupported(format) {
        result := ComCall(68, this, "int", format, "int")
        return result
    }

    /**
     * 
     * @param {Integer} bufferPrecision 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-isbufferprecisionsupported
     */
    IsBufferPrecisionSupported(bufferPrecision) {
        result := ComCall(69, this, "int", bufferPrecision, "int")
        return result
    }

    /**
     * 
     * @param {ID2D1Image} image 
     * @param {Pointer<D2D_RECT_F>} localBounds 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-getimagelocalbounds
     */
    GetImageLocalBounds(image, localBounds) {
        result := ComCall(70, this, "ptr", image, "ptr", localBounds, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID2D1Image} image 
     * @param {Pointer<D2D_RECT_F>} worldBounds 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-getimageworldbounds
     */
    GetImageWorldBounds(image, worldBounds) {
        result := ComCall(71, this, "ptr", image, "ptr", worldBounds, "HRESULT")
        return result
    }

    /**
     * 
     * @param {D2D_POINT_2F} baselineOrigin 
     * @param {Pointer<DWRITE_GLYPH_RUN>} glyphRun 
     * @param {Integer} measuringMode 
     * @param {Pointer<D2D_RECT_F>} bounds 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-getglyphrunworldbounds
     */
    GetGlyphRunWorldBounds(baselineOrigin, glyphRun, measuringMode, bounds) {
        result := ComCall(72, this, "ptr", baselineOrigin, "ptr", glyphRun, "int", measuringMode, "ptr", bounds, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ID2D1Device>} device 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-getdevice
     */
    GetDevice(device) {
        ComCall(73, this, "ptr*", device)
    }

    /**
     * 
     * @param {ID2D1Image} image 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-settarget
     */
    SetTarget(image) {
        ComCall(74, this, "ptr", image)
    }

    /**
     * 
     * @param {Pointer<ID2D1Image>} image 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-gettarget
     */
    GetTarget(image) {
        ComCall(75, this, "ptr*", image)
    }

    /**
     * 
     * @param {Pointer<D2D1_RENDERING_CONTROLS>} renderingControls 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-setrenderingcontrols(constd2d1_rendering_controls_)
     */
    SetRenderingControls(renderingControls) {
        ComCall(76, this, "ptr", renderingControls)
    }

    /**
     * 
     * @param {Pointer<D2D1_RENDERING_CONTROLS>} renderingControls 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-getrenderingcontrols
     */
    GetRenderingControls(renderingControls) {
        ComCall(77, this, "ptr", renderingControls)
    }

    /**
     * 
     * @param {Integer} primitiveBlend 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-setprimitiveblend
     */
    SetPrimitiveBlend(primitiveBlend) {
        ComCall(78, this, "int", primitiveBlend)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-getprimitiveblend
     */
    GetPrimitiveBlend() {
        result := ComCall(79, this, "int")
        return result
    }

    /**
     * 
     * @param {Integer} unitMode 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-setunitmode
     */
    SetUnitMode(unitMode) {
        ComCall(80, this, "int", unitMode)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-getunitmode
     */
    GetUnitMode() {
        result := ComCall(81, this, "int")
        return result
    }

    /**
     * 
     * @param {D2D_POINT_2F} baselineOrigin 
     * @param {Pointer<DWRITE_GLYPH_RUN>} glyphRun 
     * @param {Pointer<DWRITE_GLYPH_RUN_DESCRIPTION>} glyphRunDescription 
     * @param {ID2D1Brush} foregroundBrush 
     * @param {Integer} measuringMode 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-drawglyphrun
     */
    DrawGlyphRun(baselineOrigin, glyphRun, glyphRunDescription, foregroundBrush, measuringMode) {
        ComCall(82, this, "ptr", baselineOrigin, "ptr", glyphRun, "ptr", glyphRunDescription, "ptr", foregroundBrush, "int", measuringMode)
    }

    /**
     * 
     * @param {ID2D1Image} image 
     * @param {Pointer<D2D_POINT_2F>} targetOffset 
     * @param {Pointer<D2D_RECT_F>} imageRectangle 
     * @param {Integer} interpolationMode 
     * @param {Integer} compositeMode 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-drawimage(id2d1image_constd2d1_point_2f_constd2d1_rect_f_d2d1_interpolation_mode_d2d1_composite_mode)
     */
    DrawImage(image, targetOffset, imageRectangle, interpolationMode, compositeMode) {
        ComCall(83, this, "ptr", image, "ptr", targetOffset, "ptr", imageRectangle, "int", interpolationMode, "int", compositeMode)
    }

    /**
     * 
     * @param {ID2D1GdiMetafile} gdiMetafile 
     * @param {Pointer<D2D_POINT_2F>} targetOffset 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-drawgdimetafile(id2d1gdimetafile_constd2d1_point_2f)
     */
    DrawGdiMetafile(gdiMetafile, targetOffset) {
        ComCall(84, this, "ptr", gdiMetafile, "ptr", targetOffset)
    }

    /**
     * 
     * @param {ID2D1Bitmap} bitmap 
     * @param {Pointer<D2D_RECT_F>} destinationRectangle 
     * @param {Float} opacity 
     * @param {Integer} interpolationMode 
     * @param {Pointer<D2D_RECT_F>} sourceRectangle 
     * @param {Pointer<D2D_MATRIX_4X4_F>} perspectiveTransform 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-drawbitmap(id2d1bitmap_constd2d1_rect_f_float_d2d1_interpolation_mode_constd2d1_rect_f_constd2d1_matrix_4x4_f)
     */
    DrawBitmap(bitmap, destinationRectangle, opacity, interpolationMode, sourceRectangle, perspectiveTransform) {
        ComCall(85, this, "ptr", bitmap, "ptr", destinationRectangle, "float", opacity, "int", interpolationMode, "ptr", sourceRectangle, "ptr", perspectiveTransform)
    }

    /**
     * 
     * @param {Pointer<D2D1_LAYER_PARAMETERS1>} layerParameters 
     * @param {ID2D1Layer} layer 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-pushlayer(constd2d1_layer_parameters1__id2d1layer)
     */
    PushLayer(layerParameters, layer) {
        ComCall(86, this, "ptr", layerParameters, "ptr", layer)
    }

    /**
     * 
     * @param {ID2D1Effect} effect 
     * @param {Integer} input 
     * @param {Pointer<D2D_RECT_F>} inputRectangle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-invalidateeffectinputrectangle
     */
    InvalidateEffectInputRectangle(effect, input, inputRectangle) {
        result := ComCall(87, this, "ptr", effect, "uint", input, "ptr", inputRectangle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID2D1Effect} effect 
     * @param {Pointer<Integer>} rectangleCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-geteffectinvalidrectanglecount
     */
    GetEffectInvalidRectangleCount(effect, rectangleCount) {
        rectangleCountMarshal := rectangleCount is VarRef ? "uint*" : "ptr"

        result := ComCall(88, this, "ptr", effect, rectangleCountMarshal, rectangleCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID2D1Effect} effect 
     * @param {Pointer<D2D_RECT_F>} rectangles 
     * @param {Integer} rectanglesCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-geteffectinvalidrectangles
     */
    GetEffectInvalidRectangles(effect, rectangles, rectanglesCount) {
        result := ComCall(89, this, "ptr", effect, "ptr", rectangles, "uint", rectanglesCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID2D1Effect} renderEffect 
     * @param {Pointer<D2D_RECT_F>} renderImageRectangle 
     * @param {Pointer<D2D1_EFFECT_INPUT_DESCRIPTION>} inputDescriptions 
     * @param {Pointer<D2D_RECT_F>} requiredInputRects 
     * @param {Integer} inputCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-geteffectrequiredinputrectangles
     */
    GetEffectRequiredInputRectangles(renderEffect, renderImageRectangle, inputDescriptions, requiredInputRects, inputCount) {
        result := ComCall(90, this, "ptr", renderEffect, "ptr", renderImageRectangle, "ptr", inputDescriptions, "ptr", requiredInputRects, "uint", inputCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID2D1Bitmap} opacityMask 
     * @param {ID2D1Brush} brush 
     * @param {Pointer<D2D_RECT_F>} destinationRectangle 
     * @param {Pointer<D2D_RECT_F>} sourceRectangle 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-fillopacitymask(id2d1bitmap_id2d1brush_constd2d1_rect_f__constd2d1_rect_f)
     */
    FillOpacityMask(opacityMask, brush, destinationRectangle, sourceRectangle) {
        ComCall(91, this, "ptr", opacityMask, "ptr", brush, "ptr", destinationRectangle, "ptr", sourceRectangle)
    }
}
