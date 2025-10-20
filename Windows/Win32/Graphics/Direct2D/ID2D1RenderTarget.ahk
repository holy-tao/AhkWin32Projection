#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1Resource.ahk

/**
 * Represents an object that can receive drawing commands. Interfaces that inherit from ID2D1RenderTarget render the drawing commands they receive in different ways.
 * @remarks
 * 
  * Your application should create render targets once and hold onto them for the life of the application or until the render target's  <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-enddraw">EndDraw</a> method returns the <a href="https://docs.microsoft.com/windows/win32/Direct2D/direct2d-error-codes">D2DERR_RECREATE_TARGET</a>  error. When you receive this error, you need to recreate the render target (and any resources it created).
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d2d1/nn-d2d1-id2d1rendertarget
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1RenderTarget extends ID2D1Resource{
    /**
     * The interface identifier for ID2D1RenderTarget
     * @type {Guid}
     */
    static IID => Guid("{2cd90694-12e2-11dc-9fed-001143a055f9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * The CreateBitmap function creates a bitmap with the specified width, height, and color format (color planes and bits-per-pixel).
     * @param {D2D_SIZE_U} size 
     * @param {Pointer<Void>} srcData 
     * @param {Integer} pitch 
     * @param {Pointer<D2D1_BITMAP_PROPERTIES>} bitmapProperties 
     * @param {Pointer<ID2D1Bitmap>} bitmap 
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
    CreateBitmap(size, srcData, pitch, bitmapProperties, bitmap) {
        result := ComCall(4, this, "ptr", size, "ptr", srcData, "uint", pitch, "ptr", bitmapProperties, "ptr", bitmap, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWICBitmapSource>} wicBitmapSource 
     * @param {Pointer<D2D1_BITMAP_PROPERTIES>} bitmapProperties 
     * @param {Pointer<ID2D1Bitmap>} bitmap 
     * @returns {HRESULT} 
     */
    CreateBitmapFromWicBitmap(wicBitmapSource, bitmapProperties, bitmap) {
        result := ComCall(5, this, "ptr", wicBitmapSource, "ptr", bitmapProperties, "ptr", bitmap, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} data 
     * @param {Pointer<D2D1_BITMAP_PROPERTIES>} bitmapProperties 
     * @param {Pointer<ID2D1Bitmap>} bitmap 
     * @returns {HRESULT} 
     */
    CreateSharedBitmap(riid, data, bitmapProperties, bitmap) {
        result := ComCall(6, this, "ptr", riid, "ptr", data, "ptr", bitmapProperties, "ptr", bitmap, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID2D1Bitmap>} bitmap 
     * @param {Pointer<D2D1_BITMAP_BRUSH_PROPERTIES>} bitmapBrushProperties 
     * @param {Pointer<D2D1_BRUSH_PROPERTIES>} brushProperties 
     * @param {Pointer<ID2D1BitmapBrush>} bitmapBrush 
     * @returns {HRESULT} 
     */
    CreateBitmapBrush(bitmap, bitmapBrushProperties, brushProperties, bitmapBrush) {
        result := ComCall(7, this, "ptr", bitmap, "ptr", bitmapBrushProperties, "ptr", brushProperties, "ptr", bitmapBrush, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D2D1_COLOR_F>} color 
     * @param {Pointer<D2D1_BRUSH_PROPERTIES>} brushProperties 
     * @param {Pointer<ID2D1SolidColorBrush>} solidColorBrush 
     * @returns {HRESULT} 
     */
    CreateSolidColorBrush(color, brushProperties, solidColorBrush) {
        result := ComCall(8, this, "ptr", color, "ptr", brushProperties, "ptr", solidColorBrush, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D2D1_GRADIENT_STOP>} gradientStops 
     * @param {Integer} gradientStopsCount 
     * @param {Integer} colorInterpolationGamma 
     * @param {Integer} extendMode 
     * @param {Pointer<ID2D1GradientStopCollection>} gradientStopCollection 
     * @returns {HRESULT} 
     */
    CreateGradientStopCollection(gradientStops, gradientStopsCount, colorInterpolationGamma, extendMode, gradientStopCollection) {
        result := ComCall(9, this, "ptr", gradientStops, "uint", gradientStopsCount, "int", colorInterpolationGamma, "int", extendMode, "ptr", gradientStopCollection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D2D1_LINEAR_GRADIENT_BRUSH_PROPERTIES>} linearGradientBrushProperties 
     * @param {Pointer<D2D1_BRUSH_PROPERTIES>} brushProperties 
     * @param {Pointer<ID2D1GradientStopCollection>} gradientStopCollection 
     * @param {Pointer<ID2D1LinearGradientBrush>} linearGradientBrush 
     * @returns {HRESULT} 
     */
    CreateLinearGradientBrush(linearGradientBrushProperties, brushProperties, gradientStopCollection, linearGradientBrush) {
        result := ComCall(10, this, "ptr", linearGradientBrushProperties, "ptr", brushProperties, "ptr", gradientStopCollection, "ptr", linearGradientBrush, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D2D1_RADIAL_GRADIENT_BRUSH_PROPERTIES>} radialGradientBrushProperties 
     * @param {Pointer<D2D1_BRUSH_PROPERTIES>} brushProperties 
     * @param {Pointer<ID2D1GradientStopCollection>} gradientStopCollection 
     * @param {Pointer<ID2D1RadialGradientBrush>} radialGradientBrush 
     * @returns {HRESULT} 
     */
    CreateRadialGradientBrush(radialGradientBrushProperties, brushProperties, gradientStopCollection, radialGradientBrush) {
        result := ComCall(11, this, "ptr", radialGradientBrushProperties, "ptr", brushProperties, "ptr", gradientStopCollection, "ptr", radialGradientBrush, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D2D_SIZE_F>} desiredSize 
     * @param {Pointer<D2D_SIZE_U>} desiredPixelSize 
     * @param {Pointer<D2D1_PIXEL_FORMAT>} desiredFormat 
     * @param {Integer} options 
     * @param {Pointer<ID2D1BitmapRenderTarget>} bitmapRenderTarget 
     * @returns {HRESULT} 
     */
    CreateCompatibleRenderTarget(desiredSize, desiredPixelSize, desiredFormat, options, bitmapRenderTarget) {
        result := ComCall(12, this, "ptr", desiredSize, "ptr", desiredPixelSize, "ptr", desiredFormat, "int", options, "ptr", bitmapRenderTarget, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D2D_SIZE_F>} size 
     * @param {Pointer<ID2D1Layer>} layer 
     * @returns {HRESULT} 
     */
    CreateLayer(size, layer) {
        result := ComCall(13, this, "ptr", size, "ptr", layer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID2D1Mesh>} mesh 
     * @returns {HRESULT} 
     */
    CreateMesh(mesh) {
        result := ComCall(14, this, "ptr", mesh, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {D2D_POINT_2F} point0 
     * @param {D2D_POINT_2F} point1 
     * @param {Pointer<ID2D1Brush>} brush 
     * @param {Float} strokeWidth 
     * @param {Pointer<ID2D1StrokeStyle>} strokeStyle 
     * @returns {String} Nothing - always returns an empty string
     */
    DrawLine(point0, point1, brush, strokeWidth, strokeStyle) {
        ComCall(15, this, "ptr", point0, "ptr", point1, "ptr", brush, "float", strokeWidth, "ptr", strokeStyle)
        return result
    }

    /**
     * 
     * @param {Pointer<D2D_RECT_F>} rect 
     * @param {Pointer<ID2D1Brush>} brush 
     * @param {Float} strokeWidth 
     * @param {Pointer<ID2D1StrokeStyle>} strokeStyle 
     * @returns {String} Nothing - always returns an empty string
     */
    DrawRectangle(rect, brush, strokeWidth, strokeStyle) {
        ComCall(16, this, "ptr", rect, "ptr", brush, "float", strokeWidth, "ptr", strokeStyle)
        return result
    }

    /**
     * 
     * @param {Pointer<D2D_RECT_F>} rect 
     * @param {Pointer<ID2D1Brush>} brush 
     * @returns {String} Nothing - always returns an empty string
     */
    FillRectangle(rect, brush) {
        ComCall(17, this, "ptr", rect, "ptr", brush)
        return result
    }

    /**
     * 
     * @param {Pointer<D2D1_ROUNDED_RECT>} roundedRect 
     * @param {Pointer<ID2D1Brush>} brush 
     * @param {Float} strokeWidth 
     * @param {Pointer<ID2D1StrokeStyle>} strokeStyle 
     * @returns {String} Nothing - always returns an empty string
     */
    DrawRoundedRectangle(roundedRect, brush, strokeWidth, strokeStyle) {
        ComCall(18, this, "ptr", roundedRect, "ptr", brush, "float", strokeWidth, "ptr", strokeStyle)
        return result
    }

    /**
     * 
     * @param {Pointer<D2D1_ROUNDED_RECT>} roundedRect 
     * @param {Pointer<ID2D1Brush>} brush 
     * @returns {String} Nothing - always returns an empty string
     */
    FillRoundedRectangle(roundedRect, brush) {
        ComCall(19, this, "ptr", roundedRect, "ptr", brush)
        return result
    }

    /**
     * 
     * @param {Pointer<D2D1_ELLIPSE>} ellipse 
     * @param {Pointer<ID2D1Brush>} brush 
     * @param {Float} strokeWidth 
     * @param {Pointer<ID2D1StrokeStyle>} strokeStyle 
     * @returns {String} Nothing - always returns an empty string
     */
    DrawEllipse(ellipse, brush, strokeWidth, strokeStyle) {
        ComCall(20, this, "ptr", ellipse, "ptr", brush, "float", strokeWidth, "ptr", strokeStyle)
        return result
    }

    /**
     * 
     * @param {Pointer<D2D1_ELLIPSE>} ellipse 
     * @param {Pointer<ID2D1Brush>} brush 
     * @returns {String} Nothing - always returns an empty string
     */
    FillEllipse(ellipse, brush) {
        ComCall(21, this, "ptr", ellipse, "ptr", brush)
        return result
    }

    /**
     * 
     * @param {Pointer<ID2D1Geometry>} geometry 
     * @param {Pointer<ID2D1Brush>} brush 
     * @param {Float} strokeWidth 
     * @param {Pointer<ID2D1StrokeStyle>} strokeStyle 
     * @returns {String} Nothing - always returns an empty string
     */
    DrawGeometry(geometry, brush, strokeWidth, strokeStyle) {
        ComCall(22, this, "ptr", geometry, "ptr", brush, "float", strokeWidth, "ptr", strokeStyle)
        return result
    }

    /**
     * 
     * @param {Pointer<ID2D1Geometry>} geometry 
     * @param {Pointer<ID2D1Brush>} brush 
     * @param {Pointer<ID2D1Brush>} opacityBrush 
     * @returns {String} Nothing - always returns an empty string
     */
    FillGeometry(geometry, brush, opacityBrush) {
        ComCall(23, this, "ptr", geometry, "ptr", brush, "ptr", opacityBrush)
        return result
    }

    /**
     * 
     * @param {Pointer<ID2D1Mesh>} mesh 
     * @param {Pointer<ID2D1Brush>} brush 
     * @returns {String} Nothing - always returns an empty string
     */
    FillMesh(mesh, brush) {
        ComCall(24, this, "ptr", mesh, "ptr", brush)
        return result
    }

    /**
     * 
     * @param {Pointer<ID2D1Bitmap>} opacityMask 
     * @param {Pointer<ID2D1Brush>} brush 
     * @param {Integer} content 
     * @param {Pointer<D2D_RECT_F>} destinationRectangle 
     * @param {Pointer<D2D_RECT_F>} sourceRectangle 
     * @returns {String} Nothing - always returns an empty string
     */
    FillOpacityMask(opacityMask, brush, content, destinationRectangle, sourceRectangle) {
        ComCall(25, this, "ptr", opacityMask, "ptr", brush, "int", content, "ptr", destinationRectangle, "ptr", sourceRectangle)
        return result
    }

    /**
     * 
     * @param {Pointer<ID2D1Bitmap>} bitmap 
     * @param {Pointer<D2D_RECT_F>} destinationRectangle 
     * @param {Float} opacity 
     * @param {Integer} interpolationMode 
     * @param {Pointer<D2D_RECT_F>} sourceRectangle 
     * @returns {String} Nothing - always returns an empty string
     */
    DrawBitmap(bitmap, destinationRectangle, opacity, interpolationMode, sourceRectangle) {
        ComCall(26, this, "ptr", bitmap, "ptr", destinationRectangle, "float", opacity, "int", interpolationMode, "ptr", sourceRectangle)
        return result
    }

    /**
     * The DrawText function draws formatted text in the specified rectangle. It formats the text according to the specified method (expanding tabs, justifying characters, breaking lines, and so forth).
     * @param {PWSTR} string 
     * @param {Integer} stringLength 
     * @param {Pointer<IDWriteTextFormat>} textFormat 
     * @param {Pointer<D2D_RECT_F>} layoutRect 
     * @param {Pointer<ID2D1Brush>} defaultFillBrush 
     * @param {Integer} options 
     * @param {Integer} measuringMode 
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-drawtext
     */
    DrawText(string, stringLength, textFormat, layoutRect, defaultFillBrush, options, measuringMode) {
        string := string is String ? StrPtr(string) : string

        ComCall(27, this, "ptr", string, "uint", stringLength, "ptr", textFormat, "ptr", layoutRect, "ptr", defaultFillBrush, "int", options, "int", measuringMode)
        return result
    }

    /**
     * 
     * @param {D2D_POINT_2F} origin 
     * @param {Pointer<IDWriteTextLayout>} textLayout 
     * @param {Pointer<ID2D1Brush>} defaultFillBrush 
     * @param {Integer} options 
     * @returns {String} Nothing - always returns an empty string
     */
    DrawTextLayout(origin, textLayout, defaultFillBrush, options) {
        ComCall(28, this, "ptr", origin, "ptr", textLayout, "ptr", defaultFillBrush, "int", options)
        return result
    }

    /**
     * 
     * @param {D2D_POINT_2F} baselineOrigin 
     * @param {Pointer<DWRITE_GLYPH_RUN>} glyphRun 
     * @param {Pointer<ID2D1Brush>} foregroundBrush 
     * @param {Integer} measuringMode 
     * @returns {String} Nothing - always returns an empty string
     */
    DrawGlyphRun(baselineOrigin, glyphRun, foregroundBrush, measuringMode) {
        ComCall(29, this, "ptr", baselineOrigin, "ptr", glyphRun, "ptr", foregroundBrush, "int", measuringMode)
        return result
    }

    /**
     * 
     * @param {Pointer<D2D_MATRIX_3X2_F>} transform 
     * @returns {String} Nothing - always returns an empty string
     */
    SetTransform(transform) {
        ComCall(30, this, "ptr", transform)
        return result
    }

    /**
     * 
     * @param {Pointer<D2D_MATRIX_3X2_F>} transform 
     * @returns {String} Nothing - always returns an empty string
     */
    GetTransform(transform) {
        ComCall(31, this, "ptr", transform)
        return result
    }

    /**
     * 
     * @param {Integer} antialiasMode 
     * @returns {String} Nothing - always returns an empty string
     */
    SetAntialiasMode(antialiasMode) {
        ComCall(32, this, "int", antialiasMode)
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetAntialiasMode() {
        result := ComCall(33, this, "int")
        return result
    }

    /**
     * 
     * @param {Integer} textAntialiasMode 
     * @returns {String} Nothing - always returns an empty string
     */
    SetTextAntialiasMode(textAntialiasMode) {
        ComCall(34, this, "int", textAntialiasMode)
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetTextAntialiasMode() {
        result := ComCall(35, this, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IDWriteRenderingParams>} textRenderingParams 
     * @returns {String} Nothing - always returns an empty string
     */
    SetTextRenderingParams(textRenderingParams) {
        ComCall(36, this, "ptr", textRenderingParams)
        return result
    }

    /**
     * 
     * @param {Pointer<IDWriteRenderingParams>} textRenderingParams 
     * @returns {String} Nothing - always returns an empty string
     */
    GetTextRenderingParams(textRenderingParams) {
        ComCall(37, this, "ptr", textRenderingParams)
        return result
    }

    /**
     * 
     * @param {Integer} tag1 
     * @param {Integer} tag2 
     * @returns {String} Nothing - always returns an empty string
     */
    SetTags(tag1, tag2) {
        ComCall(38, this, "uint", tag1, "uint", tag2)
        return result
    }

    /**
     * 
     * @param {Pointer<UInt64>} tag1 
     * @param {Pointer<UInt64>} tag2 
     * @returns {String} Nothing - always returns an empty string
     */
    GetTags(tag1, tag2) {
        ComCall(39, this, "uint*", tag1, "uint*", tag2)
        return result
    }

    /**
     * 
     * @param {Pointer<D2D1_LAYER_PARAMETERS>} layerParameters 
     * @param {Pointer<ID2D1Layer>} layer 
     * @returns {String} Nothing - always returns an empty string
     */
    PushLayer(layerParameters, layer) {
        ComCall(40, this, "ptr", layerParameters, "ptr", layer)
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    PopLayer() {
        ComCall(41, this)
        return result
    }

    /**
     * 
     * @param {Pointer<UInt64>} tag1 
     * @param {Pointer<UInt64>} tag2 
     * @returns {HRESULT} 
     */
    Flush(tag1, tag2) {
        result := ComCall(42, this, "uint*", tag1, "uint*", tag2, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID2D1DrawingStateBlock>} drawingStateBlock 
     * @returns {String} Nothing - always returns an empty string
     */
    SaveDrawingState(drawingStateBlock) {
        ComCall(43, this, "ptr", drawingStateBlock)
        return result
    }

    /**
     * 
     * @param {Pointer<ID2D1DrawingStateBlock>} drawingStateBlock 
     * @returns {String} Nothing - always returns an empty string
     */
    RestoreDrawingState(drawingStateBlock) {
        ComCall(44, this, "ptr", drawingStateBlock)
        return result
    }

    /**
     * 
     * @param {Pointer<D2D_RECT_F>} clipRect 
     * @param {Integer} antialiasMode 
     * @returns {String} Nothing - always returns an empty string
     */
    PushAxisAlignedClip(clipRect, antialiasMode) {
        ComCall(45, this, "ptr", clipRect, "int", antialiasMode)
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    PopAxisAlignedClip() {
        ComCall(46, this)
        return result
    }

    /**
     * 
     * @param {Pointer<D2D1_COLOR_F>} clearColor 
     * @returns {String} Nothing - always returns an empty string
     */
    Clear(clearColor) {
        ComCall(47, this, "ptr", clearColor)
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    BeginDraw() {
        ComCall(48, this)
        return result
    }

    /**
     * 
     * @param {Pointer<UInt64>} tag1 
     * @param {Pointer<UInt64>} tag2 
     * @returns {HRESULT} 
     */
    EndDraw(tag1, tag2) {
        result := ComCall(49, this, "uint*", tag1, "uint*", tag2, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The GetPixelFormat function obtains the index of the currently selected pixel format of the specified device context.
     * @returns {D2D1_PIXEL_FORMAT} If the function succeeds, the return value is the currently selected pixel format index of the specified device context. This is a positive, one-based index value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getpixelformat
     */
    GetPixelFormat() {
        result := ComCall(50, this, "ptr")
        return result
    }

    /**
     * 
     * @param {Float} dpiX 
     * @param {Float} dpiY 
     * @returns {String} Nothing - always returns an empty string
     */
    SetDpi(dpiX, dpiY) {
        ComCall(51, this, "float", dpiX, "float", dpiY)
        return result
    }

    /**
     * 
     * @param {Pointer<Single>} dpiX 
     * @param {Pointer<Single>} dpiY 
     * @returns {String} Nothing - always returns an empty string
     */
    GetDpi(dpiX, dpiY) {
        ComCall(52, this, "float*", dpiX, "float*", dpiY)
        return result
    }

    /**
     * 
     * @returns {D2D_SIZE_F} 
     */
    GetSize() {
        result := ComCall(53, this, "ptr")
        return result
    }

    /**
     * 
     * @returns {D2D_SIZE_U} 
     */
    GetPixelSize() {
        result := ComCall(54, this, "ptr")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetMaximumBitmapSize() {
        result := ComCall(55, this, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<D2D1_RENDER_TARGET_PROPERTIES>} renderTargetProperties 
     * @returns {BOOL} 
     */
    IsSupported(renderTargetProperties) {
        result := ComCall(56, this, "ptr", renderTargetProperties, "int")
        return result
    }
}
