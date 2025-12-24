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
     * 
     * @param {D2D_SIZE_U} size 
     * @param {Pointer<Void>} srcData 
     * @param {Integer} pitch 
     * @param {Pointer<D2D1_BITMAP_PROPERTIES>} bitmapProperties 
     * @returns {ID2D1Bitmap} 
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1rendertarget-createbitmap
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
     * Creates an ID2D1Bitmap whose data is shared with another resource.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The interface ID of the object supplying the source data.
     * @param {Pointer<Void>} data Type: <b>void*</b>
     * 
     * An <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1bitmap">ID2D1Bitmap</a>, <a href="https://docs.microsoft.com/windows/win32/api/dxgi/nn-dxgi-idxgisurface">IDXGISurface</a>, or an <a href="https://docs.microsoft.com/windows/win32/api/wincodec/nn-wincodec-iwicbitmaplock">IWICBitmapLock</a> that contains the data to share with the new <b>ID2D1Bitmap</b>. For more information, see the Remarks section.
     * @param {Pointer<D2D1_BITMAP_PROPERTIES>} bitmapProperties Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/ns-d2d1-d2d1_bitmap_properties">D2D1_BITMAP_PROPERTIES</a>*</b>
     * 
     * The pixel format  and DPI of the bitmap to create . The <a href="https://docs.microsoft.com/windows/win32/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a> portion of the pixel format  must match the <a href="https://docs.microsoft.com/windows/win32/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a> of <i>data</i> or the method will fail, but the alpha modes don't have to match. To prevent a  mismatch, you can pass <b>NULL</b> or the value obtained from the <a href="https://docs.microsoft.com/windows/win32/api/d2d1helper/nf-d2d1helper-pixelformat">D2D1::PixelFormat</a> helper function. The DPI settings do not have to match those of <i>data</i>. If both <i>dpiX</i> and <i>dpiY</i> are  0.0f, the DPI of the render target is used.
     * @returns {ID2D1Bitmap} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1bitmap">ID2D1Bitmap</a>**</b>
     * 
     * When this method returns, contains the address of a pointer to the new bitmap. This parameter is passed uninitialized.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1/nf-d2d1-id2d1rendertarget-createsharedbitmap
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
     * Create a mesh that uses triangles to describe a shape.
     * @returns {ID2D1Mesh} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1mesh">ID2D1Mesh</a>**</b>
     * 
     * When this method returns, contains a pointer to a pointer to the new mesh.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1/nf-d2d1-id2d1rendertarget-createmesh
     */
    CreateMesh() {
        result := ComCall(14, this, "ptr*", &mesh := 0, "HRESULT")
        return ID2D1Mesh(mesh)
    }

    /**
     * Draws a line between the specified points using the specified stroke style.
     * @remarks
     * 
     * This method doesn't return an error code if it fails. To determine whether a drawing operation (such as <b>DrawLine</b>) failed, check the result returned by the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-enddraw">ID2D1RenderTarget::EndDraw</a> or <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-flush">ID2D1RenderTarget::Flush</a> methods. 
     * 
     * 
     * 
     * @param {D2D_POINT_2F} point0 Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-point-2f">D2D1_POINT_2F</a></b>
     * 
     * The start point of the line, in device-independent pixels.
     * @param {D2D_POINT_2F} point1 Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-point-2f">D2D1_POINT_2F</a></b>
     * 
     * The end point of the line, in device-independent pixels.
     * @param {ID2D1Brush} brush Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1brush">ID2D1Brush</a>*</b>
     * 
     * The brush used to paint the line's stroke.
     * @param {Float} strokeWidth Type: <b>FLOAT</b>
     * 
     * The width of the stroke, in device-independent pixels. The value must be greater than or equal to 0.0f. If this parameter isn't specified, it defaults to 1.0f. The stroke is centered on the line.
     * @param {ID2D1StrokeStyle} strokeStyle Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1strokestyle">ID2D1StrokeStyle</a>*</b>
     * 
     * The style of stroke to paint, or <b>NULL</b> to paint a solid line.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1/nf-d2d1-id2d1rendertarget-drawline
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
     * Draws the outline of the specified geometry using the specified stroke style.
     * @remarks
     * 
     * This method doesn't return an error code if it fails. To determine whether a drawing operation (such as <b>DrawGeometry</b>) failed, check the result returned by the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-enddraw">ID2D1RenderTarget::EndDraw</a> or <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-flush">ID2D1RenderTarget::Flush</a> methods. 
     * 
     * 
     * 
     * @param {ID2D1Geometry} geometry Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1geometry">ID2D1Geometry</a>*</b>
     * 
     * The geometry to draw.
     * @param {ID2D1Brush} brush Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1brush">ID2D1Brush</a>*</b>
     * 
     * The brush used to paint the geometry's stroke.
     * @param {Float} strokeWidth Type: <b>FLOAT</b>
     * 
     * The width of the stroke, in device-independent pixels. The value must be greater than or equal to 0.0f. If this parameter isn't specified, it defaults to 1.0f. The stroke is centered on the line.
     * @param {ID2D1StrokeStyle} strokeStyle Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1strokestyle">ID2D1StrokeStyle</a>*</b>
     * 
     * The style of stroke to apply to the geometry's outline, or <b>NULL</b> to paint a solid stroke.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1/nf-d2d1-id2d1rendertarget-drawgeometry
     */
    DrawGeometry(geometry, brush, strokeWidth, strokeStyle) {
        ComCall(22, this, "ptr", geometry, "ptr", brush, "float", strokeWidth, "ptr", strokeStyle)
    }

    /**
     * Paints the interior of the specified geometry.
     * @remarks
     * 
     * If the <i>opacityBrush</i> parameter is not <b>NULL</b>, the alpha value of each pixel of the mapped <i>opacityBrush</i> is used to determine the resulting opacity of each corresponding pixel of the geometry. Only the alpha value of each color in the brush is used for this processing; all other color information is ignored. 
     * 
     * The alpha value specified by the brush is multiplied by the alpha value of the geometry after the geometry has been painted by <i>brush</i>.  
     * 
     * 
     * When this method fails, it does not return an error code. To determine whether a drawing operation (such as <b>FillGeometry</b>) failed, check the result returned by the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-enddraw">ID2D1RenderTarget::EndDraw</a> or <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-flush">ID2D1RenderTarget::Flush</a> method. 
     * 
     * 
     * 
     * @param {ID2D1Geometry} geometry Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1geometry">ID2D1Geometry</a>*</b>
     * 
     * The geometry to paint.
     * @param {ID2D1Brush} brush Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1brush">ID2D1Brush</a>*</b>
     * 
     * The brush used to paint the geometry's interior.
     * @param {ID2D1Brush} opacityBrush Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1brush">ID2D1Brush</a>*</b>
     * 
     * The opacity mask to apply to the geometry, or <b>NULL</b> for no opacity mask. If an opacity mask (the <i>opacityBrush</i> parameter) is specified, <i>brush</i> must be an <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1bitmapbrush">ID2D1BitmapBrush</a> that has   its x- and y-extend modes set to <a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_extend_mode">D2D1_EXTEND_MODE_CLAMP</a>. For more information, see the Remarks section.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1/nf-d2d1-id2d1rendertarget-fillgeometry
     */
    FillGeometry(geometry, brush, opacityBrush) {
        ComCall(23, this, "ptr", geometry, "ptr", brush, "ptr", opacityBrush)
    }

    /**
     * Paints the interior of the specified mesh.
     * @remarks
     * 
     * The current antialias mode of the render target must be <a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_antialias_mode">D2D1_ANTIALIAS_MODE_ALIASED</a> when <b>FillMesh</b> is called. To change the render target's antialias mode, use the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-setantialiasmode">SetAntialiasMode</a> method.
     * 
     * <b>FillMesh</b> does not expect a particular winding order for the triangles in the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1mesh">ID2D1Mesh</a>; both clockwise and counter-clockwise will work. 
     * 
     * This method doesn't return an error code if it fails. To determine whether a drawing operation (such as <b>FillMesh</b>) failed, check the result returned by the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-enddraw">ID2D1RenderTarget::EndDraw</a> or <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-flush">ID2D1RenderTarget::Flush</a> methods.
     * 
     * 
     * @param {ID2D1Mesh} mesh Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1mesh">ID2D1Mesh</a>*</b>
     * 
     * The mesh to paint.
     * @param {ID2D1Brush} brush Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1brush">ID2D1Brush</a>*</b>
     * 
     * The brush used to paint the mesh.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1/nf-d2d1-id2d1rendertarget-fillmesh
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
     * 
     * @param {PWSTR} string 
     * @param {Integer} stringLength 
     * @param {IDWriteTextFormat} textFormat 
     * @param {Pointer<D2D_RECT_F>} layoutRect 
     * @param {ID2D1Brush} defaultFillBrush 
     * @param {Integer} options 
     * @param {Integer} measuringMode 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1rendertarget-drawtext
     */
    DrawText(string, stringLength, textFormat, layoutRect, defaultFillBrush, options, measuringMode) {
        string := string is String ? StrPtr(string) : string

        ComCall(27, this, "ptr", string, "uint", stringLength, "ptr", textFormat, "ptr", layoutRect, "ptr", defaultFillBrush, "int", options, "int", measuringMode)
    }

    /**
     * Draws the formatted text described by the specified IDWriteTextLayout object.
     * @remarks
     * 
     * When drawing the same text repeatedly, using the <b>DrawTextLayout</b> method is more efficient than using the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-drawtext(constwchar_uint32_idwritetextformat_constd2d1_rect_f__id2d1brush_d2d1_draw_text_options_dwrite_measuring_mode)">DrawText</a> method because the text doesn't need to be formatted and the layout processed with each call.
     * 
     * This method doesn't return an error code if it fails. To determine whether a drawing operation (such as <b>DrawTextLayout</b>) failed, check the result returned by the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-enddraw">ID2D1RenderTarget::EndDraw</a> or <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-flush">ID2D1RenderTarget::Flush</a> methods.
     * 
     * 
     * @param {D2D_POINT_2F} origin Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-point-2f">D2D1_POINT_2F</a></b>
     * 
     * The point, described in device-independent pixels, at which the upper-left corner of the text described by <i>textLayout</i> is drawn.
     * @param {IDWriteTextLayout} textLayout Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritetextlayout">IDWriteTextLayout</a>*</b>
     * 
     * The formatted text to draw. Any drawing effects that do not inherit from <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1resource">ID2D1Resource</a> are ignored. If there are drawing effects that inherit from <b>ID2D1Resource</b> that are not brushes, this method fails and the render target is put in an error state.
     * @param {ID2D1Brush} defaultFillBrush Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1brush">ID2D1Brush</a>*</b>
     * 
     * The brush used to paint any text in <i>textLayout</i> that does not already have a brush associated with it as a drawing effect (specified by the <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextlayout-setdrawingeffect">IDWriteTextLayout::SetDrawingEffect</a> method).
     * @param {Integer} options Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_draw_text_options">D2D1_DRAW_TEXT_OPTIONS</a></b>
     * 
     * A value that indicates whether the text should be snapped to pixel boundaries and whether the text should be clipped to the layout rectangle. The default value is <a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_draw_text_options">D2D1_DRAW_TEXT_OPTIONS_NONE</a>, which indicates that text should be snapped to pixel boundaries and it should not be clipped to the layout rectangle.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1/nf-d2d1-id2d1rendertarget-drawtextlayout
     */
    DrawTextLayout(origin, textLayout, defaultFillBrush, options) {
        ComCall(28, this, "ptr", origin, "ptr", textLayout, "ptr", defaultFillBrush, "int", options)
    }

    /**
     * Draws the specified glyphs.
     * @remarks
     * 
     * This method doesn't return an error code if it fails. To determine whether a drawing operation (such as <b>DrawGlyphRun</b>) failed, check the result returned by the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-enddraw">ID2D1RenderTarget::EndDraw</a> or <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-flush">ID2D1RenderTarget::Flush</a> methods.
     * 
     * 
     * @param {D2D_POINT_2F} baselineOrigin Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-point-2f">D2D1_POINT_2F</a></b>
     * 
     * The origin, in device-independent pixels, of the glyphs' baseline.
     * @param {Pointer<DWRITE_GLYPH_RUN>} glyphRun Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_glyph_run">DWRITE_GLYPH_RUN</a>*</b>
     * 
     * The glyphs to render.
     * @param {ID2D1Brush} foregroundBrush Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1brush">ID2D1Brush</a>*</b>
     * 
     * The brush used to paint the specified glyphs.
     * @param {Integer} measuringMode Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dcommon/ne-dcommon-dwrite_measuring_mode">DWRITE_MEASURING_MODE</a></b>
     * 
     * A value that indicates how glyph metrics are used to measure text when it is formatted.  The default value is <a href="https://docs.microsoft.com/windows/win32/api/dcommon/ne-dcommon-dwrite_measuring_mode">DWRITE_MEASURING_MODE_NATURAL</a>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1/nf-d2d1-id2d1rendertarget-drawglyphrun
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
     * Gets the current transform of the render target.
     * @param {Pointer<D2D_MATRIX_3X2_F>} transform Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-matrix-3x2-f">D2D1_MATRIX_3X2_F</a>*</b>
     * 
     * When this returns, contains the current transform of the render target. This parameter is passed uninitialized.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1/nf-d2d1-id2d1rendertarget-gettransform
     */
    GetTransform(transform) {
        ComCall(31, this, "ptr", transform)
    }

    /**
     * Sets the antialiasing mode of the render target. The antialiasing mode applies to all subsequent drawing operations, excluding text and glyph drawing operations.
     * @remarks
     * 
     * To specify the antialiasing mode for text and glyph operations, use the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-settextantialiasmode">SetTextAntialiasMode</a> method.
     * 
     * 
     * @param {Integer} antialiasMode Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_antialias_mode">D2D1_ANTIALIAS_MODE</a></b>
     * 
     * The antialiasing mode for future drawing operations.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1/nf-d2d1-id2d1rendertarget-setantialiasmode
     */
    SetAntialiasMode(antialiasMode) {
        ComCall(32, this, "int", antialiasMode)
    }

    /**
     * Retrieves the current antialiasing mode for nontext drawing operations.
     * @returns {Integer} Type: <b><a href="/windows/win32/api/d2d1/ne-d2d1-d2d1_antialias_mode">D2D1_ANTIALIAS_MODE</a></b>
     * 
     * The current antialiasing mode for nontext drawing operations.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1/nf-d2d1-id2d1rendertarget-getantialiasmode
     */
    GetAntialiasMode() {
        result := ComCall(33, this, "int")
        return result
    }

    /**
     * Specifies the antialiasing mode to use for subsequent text and glyph drawing operations.
     * @param {Integer} textAntialiasMode Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_text_antialias_mode">D2D1_TEXT_ANTIALIAS_MODE</a></b>
     * 
     * The antialiasing mode to use for subsequent text and glyph drawing operations.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1/nf-d2d1-id2d1rendertarget-settextantialiasmode
     */
    SetTextAntialiasMode(textAntialiasMode) {
        ComCall(34, this, "int", textAntialiasMode)
    }

    /**
     * Gets the current antialiasing mode for text and glyph drawing operations.
     * @returns {Integer} Type: <b><a href="/windows/win32/api/d2d1/ne-d2d1-d2d1_text_antialias_mode">D2D1_TEXT_ANTIALIAS_MODE</a></b>
     * 
     * The current antialiasing mode for text and glyph drawing operations.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1/nf-d2d1-id2d1rendertarget-gettextantialiasmode
     */
    GetTextAntialiasMode() {
        result := ComCall(35, this, "int")
        return result
    }

    /**
     * Specifies text rendering options to be applied to all subsequent text and glyph drawing operations.
     * @remarks
     * 
     * If the settings specified by  <i>textRenderingParams</i> are incompatible with the render target's text antialiasing mode (specified by <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-settextantialiasmode">SetTextAntialiasMode</a>), subsequent text and glyph drawing operations will fail and put the render target into an error state.
     * 
     * 
     * @param {IDWriteRenderingParams} textRenderingParams Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwriterenderingparams">IDWriteRenderingParams</a>*</b>
     * 
     * The text rendering options to be applied to all subsequent text and glyph drawing operations; <b>NULL</b> to clear current text rendering options.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1/nf-d2d1-id2d1rendertarget-settextrenderingparams
     */
    SetTextRenderingParams(textRenderingParams) {
        ComCall(36, this, "ptr", textRenderingParams)
    }

    /**
     * Retrieves the render target's current text rendering options.
     * @remarks
     * 
     * If the settings specified by  <i>textRenderingParams</i> are incompatible with the render target's text antialiasing mode (specified by <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-settextantialiasmode">SetTextAntialiasMode</a>), subsequent text and glyph drawing operations will fail and put the render target into an error state.
     * 
     * 
     * @param {Pointer<IDWriteRenderingParams>} textRenderingParams Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwriterenderingparams">IDWriteRenderingParams</a>**</b>
     * 
     *  When this method returns, <i>textRenderingParams</i>contains the address  of a pointer to the render target's current text rendering options.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1/nf-d2d1-id2d1rendertarget-gettextrenderingparams
     */
    GetTextRenderingParams(textRenderingParams) {
        ComCall(37, this, "ptr*", textRenderingParams)
    }

    /**
     * Specifies a label for subsequent drawing operations.
     * @remarks
     * 
     * The labels specified by this method are printed by debug error messages. If no tag is set, the default value for each tag is 0.
     * 
     * 
     * @param {Integer} tag1 Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-tag">D2D1_TAG</a></b>
     * 
     * A label to apply to subsequent drawing operations.
     * @param {Integer} tag2 Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-tag">D2D1_TAG</a></b>
     * 
     * A label to apply to subsequent drawing operations.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1/nf-d2d1-id2d1rendertarget-settags
     */
    SetTags(tag1, tag2) {
        ComCall(38, this, "uint", tag1, "uint", tag2)
    }

    /**
     * Gets the label for subsequent drawing operations.
     * @remarks
     * 
     * If the same address is passed for both parameters, both parameters receive the value of the second tag.
     * 
     * 
     * @param {Pointer<Integer>} tag1 Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-tag">D2D1_TAG</a>*</b>
     * 
     * When this method returns, contains the first label for subsequent drawing operations. This parameter is passed uninitialized. If <b>NULL</b> is specified, no value is retrieved for this parameter.
     * @param {Pointer<Integer>} tag2 Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-tag">D2D1_TAG</a>*</b>
     * 
     * When this method returns, contains the second label for subsequent drawing operations. This parameter is passed uninitialized. If <b>NULL</b> is specified, no value is retrieved for this parameter.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1/nf-d2d1-id2d1rendertarget-gettags
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
     * Stops redirecting drawing operations to the layer that is specified by the last PushLayer call.
     * @remarks
     * 
     * A <b>PopLayer</b>  must match a previous <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-pushlayer(constd2d1_layer_parameters__id2d1layer)">PushLayer</a> call.
     * 
     * This method doesn't return an error code if it fails. To determine whether a drawing operation (such as <b>PopLayer</b>) failed, check the result returned by the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-enddraw">ID2D1RenderTarget::EndDraw</a> or <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-flush">ID2D1RenderTarget::Flush</a> methods. 
     * 
     * 
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1/nf-d2d1-id2d1rendertarget-poplayer
     */
    PopLayer() {
        ComCall(41, this)
    }

    /**
     * Executes all pending drawing commands.
     * @param {Pointer<Integer>} tag1 Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-tag">D2D1_TAG</a>*</b>
     * 
     * When this method returns, contains the tag for drawing operations that caused errors or 0 if there were no errors. This parameter is passed uninitialized.
     * @param {Pointer<Integer>} tag2 Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-tag">D2D1_TAG</a>*</b>
     * 
     * When this method returns, contains the tag for drawing operations that caused errors or 0 if there were no errors. This parameter is passed uninitialized.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code and sets <i>tag1</i> and <i>tag2</i> to the tags that were active when the error occurred. If no error occurred, this method sets the error tag state to be (0,0).
     * @see https://docs.microsoft.com/windows/win32/api//d2d1/nf-d2d1-id2d1rendertarget-flush
     */
    Flush(tag1, tag2) {
        tag1Marshal := tag1 is VarRef ? "uint*" : "ptr"
        tag2Marshal := tag2 is VarRef ? "uint*" : "ptr"

        result := ComCall(42, this, tag1Marshal, tag1, tag2Marshal, tag2, "HRESULT")
        return result
    }

    /**
     * Saves the current drawing state to the specified ID2D1DrawingStateBlock.
     * @param {ID2D1DrawingStateBlock} drawingStateBlock Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1drawingstateblock">ID2D1DrawingStateBlock</a>*</b>
     * 
     * When this method returns, contains the current drawing state of the render target. This parameter must be initialized before passing it to the method.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1/nf-d2d1-id2d1rendertarget-savedrawingstate
     */
    SaveDrawingState(drawingStateBlock) {
        ComCall(43, this, "ptr", drawingStateBlock)
    }

    /**
     * Sets the render target's drawing state to that of the specified ID2D1DrawingStateBlock.
     * @param {ID2D1DrawingStateBlock} drawingStateBlock Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1drawingstateblock">ID2D1DrawingStateBlock</a>*</b>
     * 
     * The new drawing state of the render target.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1/nf-d2d1-id2d1rendertarget-restoredrawingstate
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
     * Removes the last axis-aligned clip from the render target. After this method is called, the clip is no longer applied to subsequent drawing operations.
     * @remarks
     * 
     * A <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-pushaxisalignedclip(constd2d1_rect_f__d2d1_antialias_mode)">PushAxisAlignedClip</a>/<b>PopAxisAlignedClip</b> pair can occur around or within a <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-pushlayer(constd2d1_layer_parameters__id2d1layer)">PushLayer</a>/<a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-poplayer">PopLayer</a> pair, but may not overlap. For example, a <b>PushAxisAlignedClip</b>, <b>PushLayer</b>, <b>PopLayer</b>, <b>PopAxisAlignedClip</b>  sequence is valid, but a <b>PushAxisAlignedClip</b>, <b>PushLayer</b>, <b>PopAxisAlignedClip</b>, <b>PopLayer</b> sequence is not. 
     * 
     * <b>PopAxisAlignedClip</b> must be called once for every call to <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-pushaxisalignedclip(constd2d1_rect_f__d2d1_antialias_mode)">PushAxisAlignedClip</a>.
     * 
     * For an example, see <a href="https://docs.microsoft.com/windows/win32/Direct2D/how-to-clip-with-axis-aligned-rects">How to Clip with an Axis-Aligned Clip Rectangle</a>.
     * 
     * This method doesn't return an error code if it fails. To determine whether a drawing operation (such as <b>PopAxisAlignedClip</b>) failed, check the result returned by the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-enddraw">ID2D1RenderTarget::EndDraw</a> or <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-flush">ID2D1RenderTarget::Flush</a> methods.
     * 
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1/nf-d2d1-id2d1rendertarget-popaxisalignedclip
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
     * Initiates drawing on this render target.
     * @remarks
     * 
     * Drawing operations can only be issued between a <b>BeginDraw</b> and <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-enddraw">EndDraw</a> call.
     * 
     * BeginDraw and EndDraw are used to indicate that a render target is in use by the Direct2D system. Different implementations of <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1rendertarget">ID2D1RenderTarget</a> might behave differently when <b>BeginDraw</b> is called. An <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1bitmaprendertarget">ID2D1BitmapRenderTarget</a> may be locked between <b>BeginDraw</b>/<a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-enddraw">EndDraw</a> calls, a DXGI surface render target might be acquired on <b>BeginDraw</b> and released on <b>EndDraw</b>, while an <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1hwndrendertarget">ID2D1HwndRenderTarget</a> may begin batching at <b>BeginDraw</b> and may present on <b>EndDraw</b>, for example.
     * 
     * The BeginDraw method must be called before rendering operations can be called, though state-setting and state-retrieval operations can be performed even outside of <b>BeginDraw</b>/<a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-enddraw">EndDraw</a>. 
     * 
     * After <b>BeginDraw</b> is called, a render target will normally build up a batch of rendering commands, but defer processing of these commands until either an internal buffer is full, the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-flush">Flush</a> method is called, or until <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-enddraw">EndDraw</a> is called. The <b>EndDraw</b> method causes any batched drawing operations to complete, and then returns an HRESULT indicating the success of the operations and, optionally, the tag state of the render target at the time the error occurred. The <b>EndDraw</b> method always succeeds: it should not be called twice even if a previous <b>EndDraw</b> resulted in a failing HRESULT. 
     * 
     * If <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-enddraw">EndDraw</a> is called without a matched call to <b>BeginDraw</b>, it returns an error indicating that <b>BeginDraw</b> must be called before <b>EndDraw</b>.
     * 
     * Calling <b>BeginDraw</b> twice on a render target puts the target into an error state where nothing further is drawn, and returns an appropriate HRESULT and error information when <b>EndDraw</b> is called.
     * 
     * 
     * 
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1/nf-d2d1-id2d1rendertarget-begindraw
     */
    BeginDraw() {
        ComCall(48, this)
    }

    /**
     * Ends drawing operations on the render target and indicates the current error state and associated tags.
     * @param {Pointer<Integer>} tag1 Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-tag">D2D1_TAG</a>*</b>
     * 
     * When this method returns, contains the tag for drawing operations that caused errors or 0 if there were no errors. This parameter is passed uninitialized.
     * @param {Pointer<Integer>} tag2 Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-tag">D2D1_TAG</a>*</b>
     * 
     * When this method returns, contains the tag for drawing operations that caused errors or 0 if there were no errors. This parameter is passed uninitialized.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code and sets <i>tag1</i> and <i>tag2</i> to the tags that were active when the error occurred.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1/nf-d2d1-id2d1rendertarget-enddraw
     */
    EndDraw(tag1, tag2) {
        tag1Marshal := tag1 is VarRef ? "uint*" : "ptr"
        tag2Marshal := tag2 is VarRef ? "uint*" : "ptr"

        result := ComCall(49, this, tag1Marshal, tag1, tag2Marshal, tag2, "int")
        return result
    }

    /**
     * Retrieves the pixel format and alpha mode of the render target.
     * @returns {D2D1_PIXEL_FORMAT} Type: <b><a href="/windows/win32/api/dcommon/ns-dcommon-d2d1_pixel_format">D2D1_PIXEL_FORMAT</a></b>
     * 
     * The pixel format and alpha mode of the render target.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1/nf-d2d1-id2d1rendertarget-getpixelformat
     */
    GetPixelFormat() {
        result := ComCall(50, this, "ptr")
        return result
    }

    /**
     * Sets the dots per inch (DPI) of the render target.
     * @remarks
     * 
     * This method specifies the mapping from pixel space to device-independent space  for the render target.  If both <i>dpiX</i> and <i>dpiY</i> are 0, the factory-read system DPI is chosen. If one parameter is zero and the other unspecified, the DPI is not changed.
     * 
     * For <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1hwndrendertarget">ID2D1HwndRenderTarget</a>, the DPI defaults to the most recently factory-read system DPI. The default value for all other render targets is 96 DPI.
     * 
     * 
     * @param {Float} dpiX Type: <b>FLOAT</b>
     * 
     * A value greater than or equal to zero that specifies the horizontal DPI of the render target.
     * @param {Float} dpiY Type: <b>FLOAT</b>
     * 
     * A value greater than or equal to zero that specifies the vertical DPI of the render target.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1/nf-d2d1-id2d1rendertarget-setdpi
     */
    SetDpi(dpiX, dpiY) {
        ComCall(51, this, "float", dpiX, "float", dpiY)
    }

    /**
     * Return the render target's dots per inch (DPI).
     * @remarks
     * 
     * This method indicates the mapping from pixel space to device-independent space  for the render target.  
     * 
     * For <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1hwndrendertarget">ID2D1HwndRenderTarget</a>, the DPI defaults to the most recently factory-read system DPI. The default value for all other render targets is 96 DPI.
     * 
     * 
     * @param {Pointer<Float>} dpiX Type: <b>FLOAT*</b>
     * 
     * When this method returns, contains the horizontal DPI of the render target. This parameter is passed uninitialized.
     * @param {Pointer<Float>} dpiY Type: <b>FLOAT*</b>
     * 
     * When this method returns, contains the vertical DPI of the render target. This parameter is passed uninitialized.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1/nf-d2d1-id2d1rendertarget-getdpi
     */
    GetDpi(dpiX, dpiY) {
        dpiXMarshal := dpiX is VarRef ? "float*" : "ptr"
        dpiYMarshal := dpiY is VarRef ? "float*" : "ptr"

        ComCall(52, this, dpiXMarshal, dpiX, dpiYMarshal, dpiY)
    }

    /**
     * Returns the size of the render target in device-independent pixels.
     * @returns {D2D_SIZE_F} Type: <b><a href="/windows/win32/Direct2D/d2d1-size-f">D2D1_SIZE_F</a></b>
     * 
     * The current size of the render target in device-independent pixels.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1/nf-d2d1-id2d1rendertarget-getsize
     */
    GetSize() {
        result := ComCall(53, this, "ptr")
        return result
    }

    /**
     * Returns the size of the render target in device pixels.
     * @returns {D2D_SIZE_U} Type: <b><a href="/windows/win32/Direct2D/d2d1-size-u">D2D1_SIZE_U</a></b>
     * 
     * The size of the render target in device pixels.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1/nf-d2d1-id2d1rendertarget-getpixelsize
     */
    GetPixelSize() {
        result := ComCall(54, this, "ptr")
        return result
    }

    /**
     * Gets the maximum size, in device-dependent units (pixels), of any one bitmap dimension supported by the render target.
     * @returns {Integer} Type: <b>UINT32</b>
     * 
     *  The maximum size, in pixels, of  any one bitmap dimension supported by the render target.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1/nf-d2d1-id2d1rendertarget-getmaximumbitmapsize
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
