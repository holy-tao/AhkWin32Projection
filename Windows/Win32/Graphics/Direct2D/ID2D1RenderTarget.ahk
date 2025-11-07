#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1Bitmap.ahk
#Include .\ID2D1BitmapBrush.ahk
#Include .\ID2D1SolidColorBrush.ahk
#Include .\ID2D1GradientStopCollection.ahk
#Include .\ID2D1LinearGradientBrush.ahk
#Include .\ID2D1RadialGradientBrush.ahk
#Include .\ID2D1BitmapRenderTarget.ahk
#Include .\ID2D1Layer.ahk
#Include .\ID2D1Mesh.ahk
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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateBitmap", "CreateBitmapFromWicBitmap", "CreateSharedBitmap", "CreateBitmapBrush", "CreateSolidColorBrush", "CreateGradientStopCollection", "CreateLinearGradientBrush", "CreateRadialGradientBrush", "CreateCompatibleRenderTarget", "CreateLayer", "CreateMesh", "DrawLine", "DrawRectangle", "FillRectangle", "DrawRoundedRectangle", "FillRoundedRectangle", "DrawEllipse", "FillEllipse", "DrawGeometry", "FillGeometry", "FillMesh", "FillOpacityMask", "DrawBitmap", "DrawText", "DrawTextLayout", "DrawGlyphRun", "SetTransform", "GetTransform", "SetAntialiasMode", "GetAntialiasMode", "SetTextAntialiasMode", "GetTextAntialiasMode", "SetTextRenderingParams", "GetTextRenderingParams", "SetTags", "GetTags", "PushLayer", "PopLayer", "Flush", "SaveDrawingState", "RestoreDrawingState", "PushAxisAlignedClip", "PopAxisAlignedClip", "Clear", "BeginDraw", "EndDraw", "GetPixelFormat", "SetDpi", "GetDpi", "GetSize", "GetPixelSize", "GetMaximumBitmapSize", "IsSupported"]

    /**
     * The CreateBitmap function creates a bitmap with the specified width, height, and color format (color planes and bits-per-pixel).
     * @param {D2D_SIZE_U} size 
     * @param {Pointer<Void>} srcData 
     * @param {Integer} pitch 
     * @param {Pointer<D2D1_BITMAP_PROPERTIES>} bitmapProperties 
     * @returns {ID2D1Bitmap} 
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-createbitmap
     */
    CreateBitmap(size, srcData, pitch, bitmapProperties) {
        srcDataMarshal := srcData is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, "ptr", size, srcDataMarshal, srcData, "uint", pitch, "ptr", bitmapProperties, "ptr*", &bitmap := 0, "HRESULT")
        return ID2D1Bitmap(bitmap)
    }

    /**
     * 
     * @param {IWICBitmapSource} wicBitmapSource 
     * @param {Pointer<D2D1_BITMAP_PROPERTIES>} bitmapProperties 
     * @returns {ID2D1Bitmap} 
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1rendertarget-createbitmapfromwicbitmap
     */
    CreateBitmapFromWicBitmap(wicBitmapSource, bitmapProperties) {
        result := ComCall(5, this, "ptr", wicBitmapSource, "ptr", bitmapProperties, "ptr*", &bitmap := 0, "HRESULT")
        return ID2D1Bitmap(bitmap)
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} data 
     * @param {Pointer<D2D1_BITMAP_PROPERTIES>} bitmapProperties 
     * @returns {ID2D1Bitmap} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-createsharedbitmap
     */
    CreateSharedBitmap(riid, data, bitmapProperties) {
        dataMarshal := data is VarRef ? "ptr" : "ptr"

        result := ComCall(6, this, "ptr", riid, dataMarshal, data, "ptr", bitmapProperties, "ptr*", &bitmap := 0, "HRESULT")
        return ID2D1Bitmap(bitmap)
    }

    /**
     * 
     * @param {ID2D1Bitmap} bitmap 
     * @param {Pointer<D2D1_BITMAP_BRUSH_PROPERTIES>} bitmapBrushProperties 
     * @param {Pointer<D2D1_BRUSH_PROPERTIES>} brushProperties 
     * @returns {ID2D1BitmapBrush} 
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1rendertarget-createbitmapbrush
     */
    CreateBitmapBrush(bitmap, bitmapBrushProperties, brushProperties) {
        result := ComCall(7, this, "ptr", bitmap, "ptr", bitmapBrushProperties, "ptr", brushProperties, "ptr*", &bitmapBrush := 0, "HRESULT")
        return ID2D1BitmapBrush(bitmapBrush)
    }

    /**
     * 
     * @param {Pointer<D2D1_COLOR_F>} color 
     * @param {Pointer<D2D1_BRUSH_PROPERTIES>} brushProperties 
     * @returns {ID2D1SolidColorBrush} 
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1rendertarget-createsolidcolorbrush
     */
    CreateSolidColorBrush(color, brushProperties) {
        result := ComCall(8, this, "ptr", color, "ptr", brushProperties, "ptr*", &solidColorBrush := 0, "HRESULT")
        return ID2D1SolidColorBrush(solidColorBrush)
    }

    /**
     * 
     * @param {Pointer<D2D1_GRADIENT_STOP>} gradientStops 
     * @param {Integer} gradientStopsCount 
     * @param {Integer} colorInterpolationGamma 
     * @param {Integer} extendMode 
     * @returns {ID2D1GradientStopCollection} 
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1rendertarget-creategradientstopcollection
     */
    CreateGradientStopCollection(gradientStops, gradientStopsCount, colorInterpolationGamma, extendMode) {
        result := ComCall(9, this, "ptr", gradientStops, "uint", gradientStopsCount, "int", colorInterpolationGamma, "int", extendMode, "ptr*", &gradientStopCollection := 0, "HRESULT")
        return ID2D1GradientStopCollection(gradientStopCollection)
    }

    /**
     * 
     * @param {Pointer<D2D1_LINEAR_GRADIENT_BRUSH_PROPERTIES>} linearGradientBrushProperties 
     * @param {Pointer<D2D1_BRUSH_PROPERTIES>} brushProperties 
     * @param {ID2D1GradientStopCollection} gradientStopCollection 
     * @returns {ID2D1LinearGradientBrush} 
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1rendertarget-createlineargradientbrush
     */
    CreateLinearGradientBrush(linearGradientBrushProperties, brushProperties, gradientStopCollection) {
        result := ComCall(10, this, "ptr", linearGradientBrushProperties, "ptr", brushProperties, "ptr", gradientStopCollection, "ptr*", &linearGradientBrush := 0, "HRESULT")
        return ID2D1LinearGradientBrush(linearGradientBrush)
    }

    /**
     * 
     * @param {Pointer<D2D1_RADIAL_GRADIENT_BRUSH_PROPERTIES>} radialGradientBrushProperties 
     * @param {Pointer<D2D1_BRUSH_PROPERTIES>} brushProperties 
     * @param {ID2D1GradientStopCollection} gradientStopCollection 
     * @returns {ID2D1RadialGradientBrush} 
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1rendertarget-createradialgradientbrush
     */
    CreateRadialGradientBrush(radialGradientBrushProperties, brushProperties, gradientStopCollection) {
        result := ComCall(11, this, "ptr", radialGradientBrushProperties, "ptr", brushProperties, "ptr", gradientStopCollection, "ptr*", &radialGradientBrush := 0, "HRESULT")
        return ID2D1RadialGradientBrush(radialGradientBrush)
    }

    /**
     * 
     * @param {Pointer<D2D_SIZE_F>} desiredSize 
     * @param {Pointer<D2D_SIZE_U>} desiredPixelSize 
     * @param {Pointer<D2D1_PIXEL_FORMAT>} desiredFormat 
     * @param {Integer} options 
     * @returns {ID2D1BitmapRenderTarget} 
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1rendertarget-createcompatiblerendertarget
     */
    CreateCompatibleRenderTarget(desiredSize, desiredPixelSize, desiredFormat, options) {
        result := ComCall(12, this, "ptr", desiredSize, "ptr", desiredPixelSize, "ptr", desiredFormat, "int", options, "ptr*", &bitmapRenderTarget := 0, "HRESULT")
        return ID2D1BitmapRenderTarget(bitmapRenderTarget)
    }

    /**
     * 
     * @param {Pointer<D2D_SIZE_F>} size 
     * @returns {ID2D1Layer} 
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1rendertarget-createlayer
     */
    CreateLayer(size) {
        result := ComCall(13, this, "ptr", size, "ptr*", &layer := 0, "HRESULT")
        return ID2D1Layer(layer)
    }

    /**
     * 
     * @returns {ID2D1Mesh} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-createmesh
     */
    CreateMesh() {
        result := ComCall(14, this, "ptr*", &mesh := 0, "HRESULT")
        return ID2D1Mesh(mesh)
    }

    /**
     * 
     * @param {D2D_POINT_2F} point0 
     * @param {D2D_POINT_2F} point1 
     * @param {ID2D1Brush} brush 
     * @param {Float} strokeWidth 
     * @param {ID2D1StrokeStyle} strokeStyle 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-drawline
     */
    DrawLine(point0, point1, brush, strokeWidth, strokeStyle) {
        ComCall(15, this, "ptr", point0, "ptr", point1, "ptr", brush, "float", strokeWidth, "ptr", strokeStyle)
    }

    /**
     * 
     * @param {Pointer<D2D_RECT_F>} rect 
     * @param {ID2D1Brush} brush 
     * @param {Float} strokeWidth 
     * @param {ID2D1StrokeStyle} strokeStyle 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1rendertarget-drawrectangle
     */
    DrawRectangle(rect, brush, strokeWidth, strokeStyle) {
        ComCall(16, this, "ptr", rect, "ptr", brush, "float", strokeWidth, "ptr", strokeStyle)
    }

    /**
     * 
     * @param {Pointer<D2D_RECT_F>} rect 
     * @param {ID2D1Brush} brush 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1rendertarget-fillrectangle
     */
    FillRectangle(rect, brush) {
        ComCall(17, this, "ptr", rect, "ptr", brush)
    }

    /**
     * 
     * @param {Pointer<D2D1_ROUNDED_RECT>} roundedRect 
     * @param {ID2D1Brush} brush 
     * @param {Float} strokeWidth 
     * @param {ID2D1StrokeStyle} strokeStyle 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1rendertarget-drawroundedrectangle
     */
    DrawRoundedRectangle(roundedRect, brush, strokeWidth, strokeStyle) {
        ComCall(18, this, "ptr", roundedRect, "ptr", brush, "float", strokeWidth, "ptr", strokeStyle)
    }

    /**
     * 
     * @param {Pointer<D2D1_ROUNDED_RECT>} roundedRect 
     * @param {ID2D1Brush} brush 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1rendertarget-fillroundedrectangle
     */
    FillRoundedRectangle(roundedRect, brush) {
        ComCall(19, this, "ptr", roundedRect, "ptr", brush)
    }

    /**
     * 
     * @param {Pointer<D2D1_ELLIPSE>} ellipse 
     * @param {ID2D1Brush} brush 
     * @param {Float} strokeWidth 
     * @param {ID2D1StrokeStyle} strokeStyle 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1rendertarget-drawellipse
     */
    DrawEllipse(ellipse, brush, strokeWidth, strokeStyle) {
        ComCall(20, this, "ptr", ellipse, "ptr", brush, "float", strokeWidth, "ptr", strokeStyle)
    }

    /**
     * 
     * @param {Pointer<D2D1_ELLIPSE>} ellipse 
     * @param {ID2D1Brush} brush 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1rendertarget-fillellipse
     */
    FillEllipse(ellipse, brush) {
        ComCall(21, this, "ptr", ellipse, "ptr", brush)
    }

    /**
     * 
     * @param {ID2D1Geometry} geometry 
     * @param {ID2D1Brush} brush 
     * @param {Float} strokeWidth 
     * @param {ID2D1StrokeStyle} strokeStyle 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-drawgeometry
     */
    DrawGeometry(geometry, brush, strokeWidth, strokeStyle) {
        ComCall(22, this, "ptr", geometry, "ptr", brush, "float", strokeWidth, "ptr", strokeStyle)
    }

    /**
     * 
     * @param {ID2D1Geometry} geometry 
     * @param {ID2D1Brush} brush 
     * @param {ID2D1Brush} opacityBrush 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-fillgeometry
     */
    FillGeometry(geometry, brush, opacityBrush) {
        ComCall(23, this, "ptr", geometry, "ptr", brush, "ptr", opacityBrush)
    }

    /**
     * 
     * @param {ID2D1Mesh} mesh 
     * @param {ID2D1Brush} brush 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-fillmesh
     */
    FillMesh(mesh, brush) {
        ComCall(24, this, "ptr", mesh, "ptr", brush)
    }

    /**
     * 
     * @param {ID2D1Bitmap} opacityMask 
     * @param {ID2D1Brush} brush 
     * @param {Integer} content 
     * @param {Pointer<D2D_RECT_F>} destinationRectangle 
     * @param {Pointer<D2D_RECT_F>} sourceRectangle 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1rendertarget-fillopacitymask
     */
    FillOpacityMask(opacityMask, brush, content, destinationRectangle, sourceRectangle) {
        ComCall(25, this, "ptr", opacityMask, "ptr", brush, "int", content, "ptr", destinationRectangle, "ptr", sourceRectangle)
    }

    /**
     * 
     * @param {ID2D1Bitmap} bitmap 
     * @param {Pointer<D2D_RECT_F>} destinationRectangle 
     * @param {Float} opacity 
     * @param {Integer} interpolationMode 
     * @param {Pointer<D2D_RECT_F>} sourceRectangle 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1rendertarget-drawbitmap
     */
    DrawBitmap(bitmap, destinationRectangle, opacity, interpolationMode, sourceRectangle) {
        ComCall(26, this, "ptr", bitmap, "ptr", destinationRectangle, "float", opacity, "int", interpolationMode, "ptr", sourceRectangle)
    }

    /**
     * The DrawText function draws formatted text in the specified rectangle. It formats the text according to the specified method (expanding tabs, justifying characters, breaking lines, and so forth).
     * @param {PWSTR} string 
     * @param {Integer} stringLength 
     * @param {IDWriteTextFormat} textFormat 
     * @param {Pointer<D2D_RECT_F>} layoutRect 
     * @param {ID2D1Brush} defaultFillBrush 
     * @param {Integer} options 
     * @param {Integer} measuringMode 
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-drawtext
     */
    DrawText(string, stringLength, textFormat, layoutRect, defaultFillBrush, options, measuringMode) {
        string := string is String ? StrPtr(string) : string

        ComCall(27, this, "ptr", string, "uint", stringLength, "ptr", textFormat, "ptr", layoutRect, "ptr", defaultFillBrush, "int", options, "int", measuringMode)
    }

    /**
     * 
     * @param {D2D_POINT_2F} origin 
     * @param {IDWriteTextLayout} textLayout 
     * @param {ID2D1Brush} defaultFillBrush 
     * @param {Integer} options 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-drawtextlayout
     */
    DrawTextLayout(origin, textLayout, defaultFillBrush, options) {
        ComCall(28, this, "ptr", origin, "ptr", textLayout, "ptr", defaultFillBrush, "int", options)
    }

    /**
     * 
     * @param {D2D_POINT_2F} baselineOrigin 
     * @param {Pointer<DWRITE_GLYPH_RUN>} glyphRun 
     * @param {ID2D1Brush} foregroundBrush 
     * @param {Integer} measuringMode 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-drawglyphrun
     */
    DrawGlyphRun(baselineOrigin, glyphRun, foregroundBrush, measuringMode) {
        ComCall(29, this, "ptr", baselineOrigin, "ptr", glyphRun, "ptr", foregroundBrush, "int", measuringMode)
    }

    /**
     * 
     * @param {Pointer<D2D_MATRIX_3X2_F>} transform 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1rendertarget-settransform
     */
    SetTransform(transform) {
        ComCall(30, this, "ptr", transform)
    }

    /**
     * 
     * @param {Pointer<D2D_MATRIX_3X2_F>} transform 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-gettransform
     */
    GetTransform(transform) {
        ComCall(31, this, "ptr", transform)
    }

    /**
     * 
     * @param {Integer} antialiasMode 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-setantialiasmode
     */
    SetAntialiasMode(antialiasMode) {
        ComCall(32, this, "int", antialiasMode)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-getantialiasmode
     */
    GetAntialiasMode() {
        result := ComCall(33, this, "int")
        return result
    }

    /**
     * 
     * @param {Integer} textAntialiasMode 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-settextantialiasmode
     */
    SetTextAntialiasMode(textAntialiasMode) {
        ComCall(34, this, "int", textAntialiasMode)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-gettextantialiasmode
     */
    GetTextAntialiasMode() {
        result := ComCall(35, this, "int")
        return result
    }

    /**
     * 
     * @param {IDWriteRenderingParams} textRenderingParams 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-settextrenderingparams
     */
    SetTextRenderingParams(textRenderingParams) {
        ComCall(36, this, "ptr", textRenderingParams)
    }

    /**
     * 
     * @param {Pointer<IDWriteRenderingParams>} textRenderingParams 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-gettextrenderingparams
     */
    GetTextRenderingParams(textRenderingParams) {
        ComCall(37, this, "ptr*", textRenderingParams)
    }

    /**
     * 
     * @param {Integer} tag1 
     * @param {Integer} tag2 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-settags
     */
    SetTags(tag1, tag2) {
        ComCall(38, this, "uint", tag1, "uint", tag2)
    }

    /**
     * 
     * @param {Pointer<Integer>} tag1 
     * @param {Pointer<Integer>} tag2 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-gettags
     */
    GetTags(tag1, tag2) {
        tag1Marshal := tag1 is VarRef ? "uint*" : "ptr"
        tag2Marshal := tag2 is VarRef ? "uint*" : "ptr"

        ComCall(39, this, tag1Marshal, tag1, tag2Marshal, tag2)
    }

    /**
     * 
     * @param {Pointer<D2D1_LAYER_PARAMETERS>} layerParameters 
     * @param {ID2D1Layer} layer 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-pushlayer(constd2d1_layer_parameters_id2d1layer)
     */
    PushLayer(layerParameters, layer) {
        ComCall(40, this, "ptr", layerParameters, "ptr", layer)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-poplayer
     */
    PopLayer() {
        ComCall(41, this)
    }

    /**
     * 
     * @param {Pointer<Integer>} tag1 
     * @param {Pointer<Integer>} tag2 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-flush
     */
    Flush(tag1, tag2) {
        tag1Marshal := tag1 is VarRef ? "uint*" : "ptr"
        tag2Marshal := tag2 is VarRef ? "uint*" : "ptr"

        result := ComCall(42, this, tag1Marshal, tag1, tag2Marshal, tag2, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID2D1DrawingStateBlock} drawingStateBlock 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-savedrawingstate
     */
    SaveDrawingState(drawingStateBlock) {
        ComCall(43, this, "ptr", drawingStateBlock)
    }

    /**
     * 
     * @param {ID2D1DrawingStateBlock} drawingStateBlock 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-restoredrawingstate
     */
    RestoreDrawingState(drawingStateBlock) {
        ComCall(44, this, "ptr", drawingStateBlock)
    }

    /**
     * 
     * @param {Pointer<D2D_RECT_F>} clipRect 
     * @param {Integer} antialiasMode 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1rendertarget-pushaxisalignedclip
     */
    PushAxisAlignedClip(clipRect, antialiasMode) {
        ComCall(45, this, "ptr", clipRect, "int", antialiasMode)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-popaxisalignedclip
     */
    PopAxisAlignedClip() {
        ComCall(46, this)
    }

    /**
     * 
     * @param {Pointer<D2D1_COLOR_F>} clearColor 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1rendertarget-clear
     */
    Clear(clearColor) {
        ComCall(47, this, "ptr", clearColor)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-begindraw
     */
    BeginDraw() {
        ComCall(48, this)
    }

    /**
     * 
     * @param {Pointer<Integer>} tag1 
     * @param {Pointer<Integer>} tag2 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-enddraw
     */
    EndDraw(tag1, tag2) {
        tag1Marshal := tag1 is VarRef ? "uint*" : "ptr"
        tag2Marshal := tag2 is VarRef ? "uint*" : "ptr"

        result := ComCall(49, this, tag1Marshal, tag1, tag2Marshal, tag2, "int")
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
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-setdpi
     */
    SetDpi(dpiX, dpiY) {
        ComCall(51, this, "float", dpiX, "float", dpiY)
    }

    /**
     * 
     * @param {Pointer<Float>} dpiX 
     * @param {Pointer<Float>} dpiY 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-getdpi
     */
    GetDpi(dpiX, dpiY) {
        dpiXMarshal := dpiX is VarRef ? "float*" : "ptr"
        dpiYMarshal := dpiY is VarRef ? "float*" : "ptr"

        ComCall(52, this, dpiXMarshal, dpiX, dpiYMarshal, dpiY)
    }

    /**
     * 
     * @returns {D2D_SIZE_F} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-getsize
     */
    GetSize() {
        result := ComCall(53, this, "ptr")
        return result
    }

    /**
     * 
     * @returns {D2D_SIZE_U} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-getpixelsize
     */
    GetPixelSize() {
        result := ComCall(54, this, "ptr")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-getmaximumbitmapsize
     */
    GetMaximumBitmapSize() {
        result := ComCall(55, this, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<D2D1_RENDER_TARGET_PROPERTIES>} renderTargetProperties 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-issupported(constd2d1_render_target_properties_)
     */
    IsSupported(renderTargetProperties) {
        result := ComCall(56, this, "ptr", renderTargetProperties, "int")
        return result
    }
}
