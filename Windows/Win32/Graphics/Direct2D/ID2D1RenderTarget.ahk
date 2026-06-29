#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\DirectWrite\IDWriteTextFormat.ahk" { IDWriteTextFormat }
#Import ".\D2D1_DRAW_TEXT_OPTIONS.ahk" { D2D1_DRAW_TEXT_OPTIONS }
#Import ".\ID2D1SolidColorBrush.ahk" { ID2D1SolidColorBrush }
#Import ".\ID2D1BitmapRenderTarget.ahk" { ID2D1BitmapRenderTarget }
#Import ".\D2D1_TEXT_ANTIALIAS_MODE.ahk" { D2D1_TEXT_ANTIALIAS_MODE }
#Import "..\Imaging\IWICBitmapSource.ahk" { IWICBitmapSource }
#Import ".\ID2D1Mesh.ahk" { ID2D1Mesh }
#Import ".\D2D1_RADIAL_GRADIENT_BRUSH_PROPERTIES.ahk" { D2D1_RADIAL_GRADIENT_BRUSH_PROPERTIES }
#Import ".\ID2D1DrawingStateBlock.ahk" { ID2D1DrawingStateBlock }
#Import ".\D2D1_EXTEND_MODE.ahk" { D2D1_EXTEND_MODE }
#Import ".\D2D1_GAMMA.ahk" { D2D1_GAMMA }
#Import "Common\D2D_RECT_F.ahk" { D2D_RECT_F }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ID2D1Geometry.ahk" { ID2D1Geometry }
#Import ".\D2D1_LINEAR_GRADIENT_BRUSH_PROPERTIES.ahk" { D2D1_LINEAR_GRADIENT_BRUSH_PROPERTIES }
#Import ".\ID2D1BitmapBrush.ahk" { ID2D1BitmapBrush }
#Import ".\D2D1_ROUNDED_RECT.ahk" { D2D1_ROUNDED_RECT }
#Import ".\D2D1_BRUSH_PROPERTIES.ahk" { D2D1_BRUSH_PROPERTIES }
#Import ".\D2D1_ANTIALIAS_MODE.ahk" { D2D1_ANTIALIAS_MODE }
#Import "Common\D2D_POINT_2F.ahk" { D2D_POINT_2F }
#Import ".\D2D1_COMPATIBLE_RENDER_TARGET_OPTIONS.ahk" { D2D1_COMPATIBLE_RENDER_TARGET_OPTIONS }
#Import "..\DirectWrite\DWRITE_GLYPH_RUN.ahk" { DWRITE_GLYPH_RUN }
#Import ".\D2D1_OPACITY_MASK_CONTENT.ahk" { D2D1_OPACITY_MASK_CONTENT }
#Import ".\D2D1_LAYER_PARAMETERS.ahk" { D2D1_LAYER_PARAMETERS }
#Import "Common\D2D1_PIXEL_FORMAT.ahk" { D2D1_PIXEL_FORMAT }
#Import "Common\D2D1_GRADIENT_STOP.ahk" { D2D1_GRADIENT_STOP }
#Import ".\ID2D1Brush.ahk" { ID2D1Brush }
#Import "..\DirectWrite\DWRITE_MEASURING_MODE.ahk" { DWRITE_MEASURING_MODE }
#Import "Common\D2D_SIZE_U.ahk" { D2D_SIZE_U }
#Import ".\D2D1_BITMAP_PROPERTIES.ahk" { D2D1_BITMAP_PROPERTIES }
#Import ".\ID2D1Layer.ahk" { ID2D1Layer }
#Import ".\ID2D1GradientStopCollection.ahk" { ID2D1GradientStopCollection }
#Import ".\D2D1_ELLIPSE.ahk" { D2D1_ELLIPSE }
#Import "Common\D2D1_COLOR_F.ahk" { D2D1_COLOR_F }
#Import "Common\D2D_SIZE_F.ahk" { D2D_SIZE_F }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\ID2D1Bitmap.ahk" { ID2D1Bitmap }
#Import ".\ID2D1LinearGradientBrush.ahk" { ID2D1LinearGradientBrush }
#Import ".\ID2D1RadialGradientBrush.ahk" { ID2D1RadialGradientBrush }
#Import "..\DirectWrite\IDWriteRenderingParams.ahk" { IDWriteRenderingParams }
#Import ".\D2D1_RENDER_TARGET_PROPERTIES.ahk" { D2D1_RENDER_TARGET_PROPERTIES }
#Import ".\D2D1_BITMAP_BRUSH_PROPERTIES.ahk" { D2D1_BITMAP_BRUSH_PROPERTIES }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\ID2D1Resource.ahk" { ID2D1Resource }
#Import ".\ID2D1StrokeStyle.ahk" { ID2D1StrokeStyle }
#Import ".\D2D1_BITMAP_INTERPOLATION_MODE.ahk" { D2D1_BITMAP_INTERPOLATION_MODE }
#Import "Common\D2D_MATRIX_3X2_F.ahk" { D2D_MATRIX_3X2_F }
#Import "..\DirectWrite\IDWriteTextLayout.ahk" { IDWriteTextLayout }

/**
 * Represents an object that can receive drawing commands. Interfaces that inherit from ID2D1RenderTarget render the drawing commands they receive in different ways.
 * @remarks
 * Your application should create render targets once and hold onto them for the life of the application or until the render target's  <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-enddraw">EndDraw</a> method returns the <a href="https://docs.microsoft.com/windows/win32/Direct2D/direct2d-error-codes">D2DERR_RECREATE_TARGET</a>  error. When you receive this error, you need to recreate the render target (and any resources it created).
 * @see https://learn.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1rendertarget
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1RenderTarget extends ID2D1Resource {
    /**
     * The interface identifier for ID2D1RenderTarget
     * @type {Guid}
     */
    static IID := Guid("{2cd90694-12e2-11dc-9fed-001143a055f9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1RenderTarget interfaces
    */
    struct Vtbl extends ID2D1Resource.Vtbl {
        CreateBitmap                 : IntPtr
        CreateBitmapFromWicBitmap    : IntPtr
        CreateSharedBitmap           : IntPtr
        CreateBitmapBrush            : IntPtr
        CreateSolidColorBrush        : IntPtr
        CreateGradientStopCollection : IntPtr
        CreateLinearGradientBrush    : IntPtr
        CreateRadialGradientBrush    : IntPtr
        CreateCompatibleRenderTarget : IntPtr
        CreateLayer                  : IntPtr
        CreateMesh                   : IntPtr
        DrawLine                     : IntPtr
        DrawRectangle                : IntPtr
        FillRectangle                : IntPtr
        DrawRoundedRectangle         : IntPtr
        FillRoundedRectangle         : IntPtr
        DrawEllipse                  : IntPtr
        FillEllipse                  : IntPtr
        DrawGeometry                 : IntPtr
        FillGeometry                 : IntPtr
        FillMesh                     : IntPtr
        FillOpacityMask              : IntPtr
        DrawBitmap                   : IntPtr
        DrawText                     : IntPtr
        DrawTextLayout               : IntPtr
        DrawGlyphRun                 : IntPtr
        SetTransform                 : IntPtr
        GetTransform                 : IntPtr
        SetAntialiasMode             : IntPtr
        GetAntialiasMode             : IntPtr
        SetTextAntialiasMode         : IntPtr
        GetTextAntialiasMode         : IntPtr
        SetTextRenderingParams       : IntPtr
        GetTextRenderingParams       : IntPtr
        SetTags                      : IntPtr
        GetTags                      : IntPtr
        PushLayer                    : IntPtr
        PopLayer                     : IntPtr
        Flush                        : IntPtr
        SaveDrawingState             : IntPtr
        RestoreDrawingState          : IntPtr
        PushAxisAlignedClip          : IntPtr
        PopAxisAlignedClip           : IntPtr
        Clear                        : IntPtr
        BeginDraw                    : IntPtr
        EndDraw                      : IntPtr
        GetPixelFormat               : IntPtr
        SetDpi                       : IntPtr
        GetDpi                       : IntPtr
        GetSize                      : IntPtr
        GetPixelSize                 : IntPtr
        GetMaximumBitmapSize         : IntPtr
        IsSupported                  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1RenderTarget.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates a Direct2D bitmap.
     * @param {D2D_SIZE_U} _size 
     * @param {Pointer<Void>} srcData 
     * @param {Integer} pitch 
     * @param {Pointer<D2D1_BITMAP_PROPERTIES>} bitmapProperties 
     * @returns {ID2D1Bitmap} 
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1rendertarget-createbitmap
     */
    CreateBitmap(_size, srcData, pitch, bitmapProperties) {
        srcDataMarshal := srcData is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, D2D_SIZE_U, _size, srcDataMarshal, srcData, "uint", pitch, D2D1_BITMAP_PROPERTIES.Ptr, bitmapProperties, "ptr*", &_bitmap := 0, "HRESULT")
        return ID2D1Bitmap(_bitmap)
    }

    /**
     * Creates an ID2D1Bitmap by copying the specified Microsoft Windows Imaging Component (WIC) bitmap.
     * @remarks
     * Before Direct2D can load a WIC image, it must be converted to a supported pixel format and alpha mode. For a list of supported pixel formats and alpha modes, see [Supported Pixel Formats and Alpha Modes](supported-pixel-formats-and-alpha-modes.md).
     * @param {IWICBitmapSource} wicBitmapSource 
     * @param {Pointer<D2D1_BITMAP_PROPERTIES>} bitmapProperties 
     * @returns {ID2D1Bitmap} 
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1rendertarget-createbitmapfromwicbitmap
     */
    CreateBitmapFromWicBitmap(wicBitmapSource, bitmapProperties) {
        result := ComCall(5, this, "ptr", wicBitmapSource, D2D1_BITMAP_PROPERTIES.Ptr, bitmapProperties, "ptr*", &_bitmap := 0, "HRESULT")
        return ID2D1Bitmap(_bitmap)
    }

    /**
     * Creates an ID2D1Bitmap whose data is shared with another resource.
     * @remarks
     * The <b>CreateSharedBitmap</b> method is useful for efficiently reusing bitmap data and can also be used to provide interoperability with Direct3D. 
     * 
     * <h3><a id="Sharing_an_ID2D1Bitmap"></a><a id="sharing_an_id2d1bitmap"></a><a id="SHARING_AN_ID2D1BITMAP"></a>Sharing an ID2D1Bitmap</h3>
     * By passing an <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1bitmap">ID2D1Bitmap</a> created by a render target that is resource-compatible, you can share a bitmap with that render target; both the original <b>ID2D1Bitmap</b> and the new <b>ID2D1Bitmap</b> created by this method will point to the same bitmap data. For more information about when render target resources can be shared, see the Sharing Render Target Resources section of the <a href="https://docs.microsoft.com/windows/win32/Direct2D/resources-and-resource-domains">Resources Overview</a>.
     * 
     * You may also use this method to reinterpret the data of an existing bitmap and specify a new DPI or alpha mode. For example, in the case of a bitmap atlas, an <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1bitmap">ID2D1Bitmap</a> may contain multiple sub-images, each of which should be rendered with a different <a href="https://docs.microsoft.com/windows/win32/api/dcommon/ne-dcommon-d2d1_alpha_mode">D2D1_ALPHA_MODE</a> (<b>D2D1_ALPHA_MODE_PREMULTIPLIED</b>  or <b>D2D1_ALPHA_MODE_IGNORE</b>). You could use the <b>CreateSharedBitmap</b> method to reinterpret the bitmap using the desired alpha mode  without having to load a separate copy of the bitmap into memory.
     * 
     * <h3><a id="Sharing_an_IDXGISurface"></a><a id="sharing_an_idxgisurface"></a><a id="SHARING_AN_IDXGISURFACE"></a>Sharing an IDXGISurface</h3>
     * 
     * When using a DXGI surface render target (an <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1rendertarget">ID2D1RenderTarget</a> object created by the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1factory-createdxgisurfacerendertarget(idxgisurface_constd2d1_render_target_properties_id2d1rendertarget)">CreateDxgiSurfaceRenderTarget</a> method), you can pass an  <a href="https://docs.microsoft.com/windows/win32/api/dxgi/nn-dxgi-idxgisurface">IDXGISurface</a> surface to the <b>CreateSharedBitmap</b> method to share video memory with Direct3D and manipulate Direct3D content as an <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1bitmap">ID2D1Bitmap</a>. As described in  the <a href="https://docs.microsoft.com/windows/win32/Direct2D/resources-and-resource-domains">Resources Overview</a>, the render target and the <a href="https://docs.microsoft.com/windows/win32/api/dxgi/nn-dxgi-idxgisurface">IDXGISurface</a> must be using the same Direct3D device. 
     * 
     * 
     * Note also that the <a href="https://docs.microsoft.com/windows/win32/api/dxgi/nn-dxgi-idxgisurface">IDXGISurface</a> must use one of the supported pixel formats and alpha modes described in <a href="https://docs.microsoft.com/windows/win32/Direct2D/supported-pixel-formats-and-alpha-modes">Supported Pixel Formats and Alpha Modes</a>.
     * 
     * For more information about interoperability with Direct3D, see the <a href="https://docs.microsoft.com/windows/win32/Direct2D/direct2d-and-direct3d-interoperation-overview">Direct2D and Direct3D Interoperability Overview</a>.
     * 
     * <h3><a id="Sharing_an_IWICBitmapLock"></a><a id="sharing_an_iwicbitmaplock"></a><a id="SHARING_AN_IWICBITMAPLOCK"></a>Sharing an IWICBitmapLock</h3>
     * An <a href="https://docs.microsoft.com/windows/win32/api/wincodec/nn-wincodec-iwicbitmaplock">IWICBitmapLock</a> stores the content of a WIC bitmap and shields it from simultaneous accesses. By passing an <b>IWICBitmapLock</b>  to the <b>CreateSharedBitmap</b> method, you can create an <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1bitmap">ID2D1Bitmap</a> that points to the bitmap data already stored in the  <b>IWICBitmapLock</b>. 
     * 
     * To use an <a href="https://docs.microsoft.com/windows/win32/api/wincodec/nn-wincodec-iwicbitmaplock">IWICBitmapLock</a> with the <b>CreateSharedBitmap</b> method, the render target must use software rendering. To force a render target to use software rendering, set to <a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_render_target_type">D2D1_RENDER_TARGET_TYPE_SOFTWARE</a>  the <b>type</b> field of the  <a href="https://docs.microsoft.com/windows/win32/api/d2d1/ns-d2d1-d2d1_render_target_properties">D2D1_RENDER_TARGET_PROPERTIES</a> structure that you use to create the render target. To check whether an existing render target uses software rendering, use the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-issupported(constd2d1_render_target_properties_)">IsSupported</a> method.
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
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-createsharedbitmap
     */
    CreateSharedBitmap(riid, data, bitmapProperties) {
        dataMarshal := data is VarRef ? "ptr" : "ptr"

        result := ComCall(6, this, Guid.Ptr, riid, dataMarshal, data, D2D1_BITMAP_PROPERTIES.Ptr, bitmapProperties, "ptr*", &_bitmap := 0, "HRESULT")
        return ID2D1Bitmap(_bitmap)
    }

    /**
     * Creates an ID2D1BitmapBrush from the specified bitmap.
     * @param {ID2D1Bitmap} _bitmap 
     * @param {Pointer<D2D1_BITMAP_BRUSH_PROPERTIES>} bitmapBrushProperties 
     * @param {Pointer<D2D1_BRUSH_PROPERTIES>} brushProperties 
     * @returns {ID2D1BitmapBrush} 
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1rendertarget-createbitmapbrush
     */
    CreateBitmapBrush(_bitmap, bitmapBrushProperties, brushProperties) {
        result := ComCall(7, this, "ptr", _bitmap, D2D1_BITMAP_BRUSH_PROPERTIES.Ptr, bitmapBrushProperties, D2D1_BRUSH_PROPERTIES.Ptr, brushProperties, "ptr*", &bitmapBrush := 0, "HRESULT")
        return ID2D1BitmapBrush(bitmapBrush)
    }

    /**
     * Creates a new ID2D1SolidColorBrush that can be used to paint areas with a solid color.
     * @param {Pointer<D2D1_COLOR_F>} _color 
     * @param {Pointer<D2D1_BRUSH_PROPERTIES>} brushProperties 
     * @returns {ID2D1SolidColorBrush} 
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1rendertarget-createsolidcolorbrush
     */
    CreateSolidColorBrush(_color, brushProperties) {
        result := ComCall(8, this, D2D1_COLOR_F.Ptr, _color, D2D1_BRUSH_PROPERTIES.Ptr, brushProperties, "ptr*", &solidColorBrush := 0, "HRESULT")
        return ID2D1SolidColorBrush(solidColorBrush)
    }

    /**
     * Creates an ID2D1GradientStopCollection from the specified array of D2D1\_GRADIENT\_STOP structures.
     * @param {Pointer<D2D1_GRADIENT_STOP>} gradientStops 
     * @param {Integer} gradientStopsCount 
     * @param {D2D1_GAMMA} colorInterpolationGamma 
     * @param {D2D1_EXTEND_MODE} extendMode 
     * @returns {ID2D1GradientStopCollection} 
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1rendertarget-creategradientstopcollection
     */
    CreateGradientStopCollection(gradientStops, gradientStopsCount, colorInterpolationGamma, extendMode) {
        result := ComCall(9, this, D2D1_GRADIENT_STOP.Ptr, gradientStops, "uint", gradientStopsCount, D2D1_GAMMA, colorInterpolationGamma, D2D1_EXTEND_MODE, extendMode, "ptr*", &gradientStopCollection := 0, "HRESULT")
        return ID2D1GradientStopCollection(gradientStopCollection)
    }

    /**
     * Creates an ID2D1LinearGradientBrush object for painting areas with a linear gradient.
     * @param {Pointer<D2D1_LINEAR_GRADIENT_BRUSH_PROPERTIES>} linearGradientBrushProperties 
     * @param {Pointer<D2D1_BRUSH_PROPERTIES>} brushProperties 
     * @param {ID2D1GradientStopCollection} gradientStopCollection 
     * @returns {ID2D1LinearGradientBrush} 
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1rendertarget-createlineargradientbrush
     */
    CreateLinearGradientBrush(linearGradientBrushProperties, brushProperties, gradientStopCollection) {
        result := ComCall(10, this, D2D1_LINEAR_GRADIENT_BRUSH_PROPERTIES.Ptr, linearGradientBrushProperties, D2D1_BRUSH_PROPERTIES.Ptr, brushProperties, "ptr", gradientStopCollection, "ptr*", &linearGradientBrush := 0, "HRESULT")
        return ID2D1LinearGradientBrush(linearGradientBrush)
    }

    /**
     * Creates an ID2D1RadialGradientBrush object that can be used to paint areas with a radial gradient.
     * @param {Pointer<D2D1_RADIAL_GRADIENT_BRUSH_PROPERTIES>} radialGradientBrushProperties 
     * @param {Pointer<D2D1_BRUSH_PROPERTIES>} brushProperties 
     * @param {ID2D1GradientStopCollection} gradientStopCollection 
     * @returns {ID2D1RadialGradientBrush} 
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1rendertarget-createradialgradientbrush
     */
    CreateRadialGradientBrush(radialGradientBrushProperties, brushProperties, gradientStopCollection) {
        result := ComCall(11, this, D2D1_RADIAL_GRADIENT_BRUSH_PROPERTIES.Ptr, radialGradientBrushProperties, D2D1_BRUSH_PROPERTIES.Ptr, brushProperties, "ptr", gradientStopCollection, "ptr*", &radialGradientBrush := 0, "HRESULT")
        return ID2D1RadialGradientBrush(radialGradientBrush)
    }

    /**
     * Creates a new bitmap render target for use during intermediate offscreen drawing that is compatible with the current render target .
     * @param {Pointer<D2D_SIZE_F>} desiredSize 
     * @param {Pointer<D2D_SIZE_U>} desiredPixelSize 
     * @param {Pointer<D2D1_PIXEL_FORMAT>} desiredFormat 
     * @param {D2D1_COMPATIBLE_RENDER_TARGET_OPTIONS} options 
     * @returns {ID2D1BitmapRenderTarget} 
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1rendertarget-createcompatiblerendertarget
     */
    CreateCompatibleRenderTarget(desiredSize, desiredPixelSize, desiredFormat, options) {
        result := ComCall(12, this, D2D_SIZE_F.Ptr, desiredSize, D2D_SIZE_U.Ptr, desiredPixelSize, D2D1_PIXEL_FORMAT.Ptr, desiredFormat, D2D1_COMPATIBLE_RENDER_TARGET_OPTIONS, options, "ptr*", &bitmapRenderTarget := 0, "HRESULT")
        return ID2D1BitmapRenderTarget(bitmapRenderTarget)
    }

    /**
     * Creates a layer resource that can be used with this render target and its compatible render targets.
     * @remarks
     * The layer automatically resizes itself, as needed.
     * @param {Pointer<D2D_SIZE_F>} _size 
     * @returns {ID2D1Layer} 
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1rendertarget-createlayer
     */
    CreateLayer(_size) {
        result := ComCall(13, this, D2D_SIZE_F.Ptr, _size, "ptr*", &layer := 0, "HRESULT")
        return ID2D1Layer(layer)
    }

    /**
     * Create a mesh that uses triangles to describe a shape.
     * @remarks
     * To populate a mesh, use its <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1mesh-open">Open</a> method to obtain an <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1tessellationsink">ID2D1TessellationSink</a>. To draw the mesh, use the render target's <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-fillmesh">FillMesh</a> method.
     * @returns {ID2D1Mesh} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1mesh">ID2D1Mesh</a>**</b>
     * 
     * When this method returns, contains a pointer to a pointer to the new mesh.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-createmesh
     */
    CreateMesh() {
        result := ComCall(14, this, "ptr*", &mesh := 0, "HRESULT")
        return ID2D1Mesh(mesh)
    }

    /**
     * Draws a line between the specified points using the specified stroke style.
     * @remarks
     * This method doesn't return an error code if it fails. To determine whether a drawing operation (such as <b>DrawLine</b>) failed, check the result returned by the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-enddraw">ID2D1RenderTarget::EndDraw</a> or <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-flush">ID2D1RenderTarget::Flush</a> methods.
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
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-drawline
     */
    DrawLine(point0, point1, brush, strokeWidth, strokeStyle) {
        ComCall(15, this, D2D_POINT_2F, point0, D2D_POINT_2F, point1, "ptr", brush, "float", strokeWidth, "ptr", strokeStyle)
    }

    /**
     * Draws the outline of a rectangle that has the specified dimensions and stroke style.
     * @remarks
     * When this method fails, it does not return an error code. To determine whether a drawing method (such as **DrawRectangle**) failed, check the result returned by the [**ID2D1RenderTarget::EndDraw**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-enddraw) or [**ID2D1RenderTarget::Flush**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-flush) method.
     * @param {Pointer<D2D_RECT_F>} _rect 
     * @param {ID2D1Brush} brush 
     * @param {Float} strokeWidth 
     * @param {ID2D1StrokeStyle} strokeStyle 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1rendertarget-drawrectangle
     */
    DrawRectangle(_rect, brush, strokeWidth, strokeStyle) {
        ComCall(16, this, D2D_RECT_F.Ptr, _rect, "ptr", brush, "float", strokeWidth, "ptr", strokeStyle)
    }

    /**
     * Paints the interior of the specified rectangle.
     * @remarks
     * This method doesn't return an error code if it fails. To determine whether a drawing operation (such as **FillRectangle**) failed, check the result returned by the [**ID2D1RenderTarget::EndDraw**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-enddraw) or [**ID2D1RenderTarget::Flush**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-flush) methods.
     * @param {Pointer<D2D_RECT_F>} _rect 
     * @param {ID2D1Brush} brush 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1rendertarget-fillrectangle
     */
    FillRectangle(_rect, brush) {
        ComCall(17, this, D2D_RECT_F.Ptr, _rect, "ptr", brush)
    }

    /**
     * Draws the outline of the specified rounded rectangle using the specified stroke style.
     * @remarks
     * This method doesn't return an error code if it fails. To determine whether a drawing operation (such as **DrawRoundedRectangle**) failed, check the result returned by the [**ID2D1RenderTarget::EndDraw**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-enddraw) or [**ID2D1RenderTarget::Flush**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-flush) methods.
     * @param {Pointer<D2D1_ROUNDED_RECT>} roundedRect 
     * @param {ID2D1Brush} brush 
     * @param {Float} strokeWidth 
     * @param {ID2D1StrokeStyle} strokeStyle 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1rendertarget-drawroundedrectangle
     */
    DrawRoundedRectangle(roundedRect, brush, strokeWidth, strokeStyle) {
        ComCall(18, this, D2D1_ROUNDED_RECT.Ptr, roundedRect, "ptr", brush, "float", strokeWidth, "ptr", strokeStyle)
    }

    /**
     * Paints the interior of the specified rounded rectangle.
     * @remarks
     * This method doesn't return an error code if it fails. To determine whether a drawing operation (such as **FillRoundedRectangle**) failed, check the result returned by the [**ID2D1RenderTarget::EndDraw**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-enddraw) or [**ID2D1RenderTarget::Flush**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-flush) methods.
     * @param {Pointer<D2D1_ROUNDED_RECT>} roundedRect 
     * @param {ID2D1Brush} brush 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1rendertarget-fillroundedrectangle
     */
    FillRoundedRectangle(roundedRect, brush) {
        ComCall(19, this, D2D1_ROUNDED_RECT.Ptr, roundedRect, "ptr", brush)
    }

    /**
     * Draws the outline of an ellipse with the specified dimensions and stroke.
     * @remarks
     * The **DrawEllipse** method doesn't return an error code if it fails. To determine whether a drawing operation (such as **DrawEllipse**) failed, check the result returned by the [**ID2D1RenderTarget::EndDraw**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-enddraw) or [**ID2D1RenderTarget::Flush**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-flush) methods.
     * @param {Pointer<D2D1_ELLIPSE>} ellipse 
     * @param {ID2D1Brush} brush 
     * @param {Float} strokeWidth 
     * @param {ID2D1StrokeStyle} strokeStyle 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1rendertarget-drawellipse
     */
    DrawEllipse(ellipse, brush, strokeWidth, strokeStyle) {
        ComCall(20, this, D2D1_ELLIPSE.Ptr, ellipse, "ptr", brush, "float", strokeWidth, "ptr", strokeStyle)
    }

    /**
     * Paints the interior of the specified ellipse.
     * @remarks
     * This method doesn't return an error code if it fails. To determine whether a drawing operation (such as **FillEllipse**) failed, check the result returned by the [**ID2D1RenderTarget::EndDraw**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-enddraw) or [**ID2D1RenderTarget::Flush**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-flush) methods.
     * @param {Pointer<D2D1_ELLIPSE>} ellipse 
     * @param {ID2D1Brush} brush 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1rendertarget-fillellipse
     */
    FillEllipse(ellipse, brush) {
        ComCall(21, this, D2D1_ELLIPSE.Ptr, ellipse, "ptr", brush)
    }

    /**
     * Draws the outline of the specified geometry using the specified stroke style.
     * @remarks
     * This method doesn't return an error code if it fails. To determine whether a drawing operation (such as <b>DrawGeometry</b>) failed, check the result returned by the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-enddraw">ID2D1RenderTarget::EndDraw</a> or <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-flush">ID2D1RenderTarget::Flush</a> methods.
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
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-drawgeometry
     */
    DrawGeometry(geometry, brush, strokeWidth, strokeStyle) {
        ComCall(22, this, "ptr", geometry, "ptr", brush, "float", strokeWidth, "ptr", strokeStyle)
    }

    /**
     * Paints the interior of the specified geometry.
     * @remarks
     * If the <i>opacityBrush</i> parameter is not <b>NULL</b>, the alpha value of each pixel of the mapped <i>opacityBrush</i> is used to determine the resulting opacity of each corresponding pixel of the geometry. Only the alpha value of each color in the brush is used for this processing; all other color information is ignored. 
     * 
     * The alpha value specified by the brush is multiplied by the alpha value of the geometry after the geometry has been painted by <i>brush</i>.  
     * 
     * 
     * When this method fails, it does not return an error code. To determine whether a drawing operation (such as <b>FillGeometry</b>) failed, check the result returned by the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-enddraw">ID2D1RenderTarget::EndDraw</a> or <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-flush">ID2D1RenderTarget::Flush</a> method.
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
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-fillgeometry
     */
    FillGeometry(geometry, brush, opacityBrush) {
        ComCall(23, this, "ptr", geometry, "ptr", brush, "ptr", opacityBrush)
    }

    /**
     * Paints the interior of the specified mesh.
     * @remarks
     * The current antialias mode of the render target must be <a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_antialias_mode">D2D1_ANTIALIAS_MODE_ALIASED</a> when <b>FillMesh</b> is called. To change the render target's antialias mode, use the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-setantialiasmode">SetAntialiasMode</a> method.
     * 
     * <b>FillMesh</b> does not expect a particular winding order for the triangles in the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1mesh">ID2D1Mesh</a>; both clockwise and counter-clockwise will work. 
     * 
     * This method doesn't return an error code if it fails. To determine whether a drawing operation (such as <b>FillMesh</b>) failed, check the result returned by the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-enddraw">ID2D1RenderTarget::EndDraw</a> or <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-flush">ID2D1RenderTarget::Flush</a> methods.
     * @param {ID2D1Mesh} mesh Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1mesh">ID2D1Mesh</a>*</b>
     * 
     * The mesh to paint.
     * @param {ID2D1Brush} brush Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1brush">ID2D1Brush</a>*</b>
     * 
     * The brush used to paint the mesh.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-fillmesh
     */
    FillMesh(mesh, brush) {
        ComCall(24, this, "ptr", mesh, "ptr", brush)
    }

    /**
     * Applies the opacity mask described by the specified bitmap to a brush and uses that brush to paint a region of the render target.
     * @remarks
     * For this method to work properly, the render target must be using the [**D2D1\_ANTIALIAS\_MODE\_ALIASED**](/windows/desktop/api/d2d1/ne-d2d1-d2d1_antialias_mode) antialiasing mode. You can set the antialiasing mode by calling the [**ID2D1RenderTarget::SetAntialiasMode**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-setantialiasmode) method.
     * 
     * This method doesn't return an error code if it fails. To determine whether a drawing operation (such as **FillOpacityMask**) failed, check the result returned by the [**ID2D1RenderTarget::EndDraw**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-enddraw) or [**ID2D1RenderTarget::Flush**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-flush) methods.
     * @param {ID2D1Bitmap} opacityMask 
     * @param {ID2D1Brush} brush 
     * @param {D2D1_OPACITY_MASK_CONTENT} content 
     * @param {Pointer<D2D_RECT_F>} destinationRectangle 
     * @param {Pointer<D2D_RECT_F>} sourceRectangle 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1rendertarget-fillopacitymask
     */
    FillOpacityMask(opacityMask, brush, content, destinationRectangle, sourceRectangle) {
        ComCall(25, this, "ptr", opacityMask, "ptr", brush, D2D1_OPACITY_MASK_CONTENT, content, D2D_RECT_F.Ptr, destinationRectangle, D2D_RECT_F.Ptr, sourceRectangle)
    }

    /**
     * Draws the specified ID2D1Bitmap.
     * @remarks
     * This method doesn't return an error code if it fails. To determine whether a drawing operation (such as **DrawBitmap**) failed, check the result returned by the [**ID2D1RenderTarget::EndDraw**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-enddraw) or [**ID2D1RenderTarget::Flush**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-flush) methods.
     * @param {ID2D1Bitmap} _bitmap 
     * @param {Pointer<D2D_RECT_F>} destinationRectangle 
     * @param {Float} opacity 
     * @param {D2D1_BITMAP_INTERPOLATION_MODE} _interpolationMode 
     * @param {Pointer<D2D_RECT_F>} sourceRectangle 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1rendertarget-drawbitmap
     */
    DrawBitmap(_bitmap, destinationRectangle, opacity, _interpolationMode, sourceRectangle) {
        ComCall(26, this, "ptr", _bitmap, D2D_RECT_F.Ptr, destinationRectangle, "float", opacity, D2D1_BITMAP_INTERPOLATION_MODE, _interpolationMode, D2D_RECT_F.Ptr, sourceRectangle)
    }

    /**
     * Draws the specified text using the format information provided by an IDWriteTextFormat object.
     * @remarks
     * To draw text with Direct2D, use the [**ID2D1RenderTarget::DrawText**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-drawtext(constwchar_uint32_idwritetextformat_constd2d1_rect_f__id2d1brush_d2d1_draw_text_options_dwrite_measuring_mode)) method for text that has a single format, or the [**ID2D1RenderTarget::DrawTextLayout**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-drawtextlayout) method when you need multiple formats, advanced OpenType features, or hit testing. These methods use the DirectWrite API to provide high-quality text display.
     * 
     * This method doesn't return an error code if it fails. To determine whether a drawing operation (such as **DrawText**) failed, check the result returned by the [**ID2D1RenderTarget::EndDraw**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-enddraw) or [**ID2D1RenderTarget::Flush**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-flush) methods.
     * @param {PWSTR} _string 
     * @param {Integer} stringLength 
     * @param {IDWriteTextFormat} textFormat 
     * @param {Pointer<D2D_RECT_F>} layoutRect 
     * @param {ID2D1Brush} defaultFillBrush 
     * @param {D2D1_DRAW_TEXT_OPTIONS} options 
     * @param {DWRITE_MEASURING_MODE} measuringMode 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1rendertarget-drawtext
     */
    DrawText(_string, stringLength, textFormat, layoutRect, defaultFillBrush, options, measuringMode) {
        _string := _string is String ? StrPtr(_string) : _string

        ComCall(27, this, "ptr", _string, "uint", stringLength, "ptr", textFormat, D2D_RECT_F.Ptr, layoutRect, "ptr", defaultFillBrush, D2D1_DRAW_TEXT_OPTIONS, options, DWRITE_MEASURING_MODE, measuringMode)
    }

    /**
     * Draws the formatted text described by the specified IDWriteTextLayout object.
     * @remarks
     * When drawing the same text repeatedly, using the <b>DrawTextLayout</b> method is more efficient than using the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-drawtext(constwchar_uint32_idwritetextformat_constd2d1_rect_f__id2d1brush_d2d1_draw_text_options_dwrite_measuring_mode)">DrawText</a> method because the text doesn't need to be formatted and the layout processed with each call.
     * 
     * This method doesn't return an error code if it fails. To determine whether a drawing operation (such as <b>DrawTextLayout</b>) failed, check the result returned by the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-enddraw">ID2D1RenderTarget::EndDraw</a> or <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-flush">ID2D1RenderTarget::Flush</a> methods.
     * @param {D2D_POINT_2F} origin Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-point-2f">D2D1_POINT_2F</a></b>
     * 
     * The point, described in device-independent pixels, at which the upper-left corner of the text described by <i>textLayout</i> is drawn.
     * @param {IDWriteTextLayout} textLayout Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritetextlayout">IDWriteTextLayout</a>*</b>
     * 
     * The formatted text to draw. Any drawing effects that do not inherit from <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1resource">ID2D1Resource</a> are ignored. If there are drawing effects that inherit from <b>ID2D1Resource</b> that are not brushes, this method fails and the render target is put in an error state.
     * @param {ID2D1Brush} defaultFillBrush Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1brush">ID2D1Brush</a>*</b>
     * 
     * The brush used to paint any text in <i>textLayout</i> that does not already have a brush associated with it as a drawing effect (specified by the <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextlayout-setdrawingeffect">IDWriteTextLayout::SetDrawingEffect</a> method).
     * @param {D2D1_DRAW_TEXT_OPTIONS} options Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_draw_text_options">D2D1_DRAW_TEXT_OPTIONS</a></b>
     * 
     * A value that indicates whether the text should be snapped to pixel boundaries and whether the text should be clipped to the layout rectangle. The default value is <a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_draw_text_options">D2D1_DRAW_TEXT_OPTIONS_NONE</a>, which indicates that text should be snapped to pixel boundaries and it should not be clipped to the layout rectangle.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-drawtextlayout
     */
    DrawTextLayout(origin, textLayout, defaultFillBrush, options) {
        ComCall(28, this, D2D_POINT_2F, origin, "ptr", textLayout, "ptr", defaultFillBrush, D2D1_DRAW_TEXT_OPTIONS, options)
    }

    /**
     * Draws the specified glyphs.
     * @remarks
     * This method doesn't return an error code if it fails. To determine whether a drawing operation (such as <b>DrawGlyphRun</b>) failed, check the result returned by the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-enddraw">ID2D1RenderTarget::EndDraw</a> or <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-flush">ID2D1RenderTarget::Flush</a> methods.
     * @param {D2D_POINT_2F} baselineOrigin Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-point-2f">D2D1_POINT_2F</a></b>
     * 
     * The origin, in device-independent pixels, of the glyphs' baseline.
     * @param {Pointer<DWRITE_GLYPH_RUN>} _glyphRun Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_glyph_run">DWRITE_GLYPH_RUN</a>*</b>
     * 
     * The glyphs to render.
     * @param {ID2D1Brush} foregroundBrush Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1brush">ID2D1Brush</a>*</b>
     * 
     * The brush used to paint the specified glyphs.
     * @param {DWRITE_MEASURING_MODE} measuringMode Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dcommon/ne-dcommon-dwrite_measuring_mode">DWRITE_MEASURING_MODE</a></b>
     * 
     * A value that indicates how glyph metrics are used to measure text when it is formatted.  The default value is <a href="https://docs.microsoft.com/windows/win32/api/dcommon/ne-dcommon-dwrite_measuring_mode">DWRITE_MEASURING_MODE_NATURAL</a>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-drawglyphrun
     */
    DrawGlyphRun(baselineOrigin, _glyphRun, foregroundBrush, measuringMode) {
        ComCall(29, this, D2D_POINT_2F, baselineOrigin, DWRITE_GLYPH_RUN.Ptr, _glyphRun, "ptr", foregroundBrush, DWRITE_MEASURING_MODE, measuringMode)
    }

    /**
     * Applies the specified transform to the render target, replacing the existing transformation. All subsequent drawing operations occur in the transformed space.
     * @param {Pointer<D2D_MATRIX_3X2_F>} transform 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1rendertarget-settransform
     */
    SetTransform(transform) {
        ComCall(30, this, D2D_MATRIX_3X2_F.Ptr, transform)
    }

    /**
     * Gets the current transform of the render target.
     * @param {Pointer<D2D_MATRIX_3X2_F>} transform Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-matrix-3x2-f">D2D1_MATRIX_3X2_F</a>*</b>
     * 
     * When this returns, contains the current transform of the render target. This parameter is passed uninitialized.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-gettransform
     */
    GetTransform(transform) {
        ComCall(31, this, D2D_MATRIX_3X2_F.Ptr, transform)
    }

    /**
     * Sets the antialiasing mode of the render target. The antialiasing mode applies to all subsequent drawing operations, excluding text and glyph drawing operations.
     * @remarks
     * To specify the antialiasing mode for text and glyph operations, use the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-settextantialiasmode">SetTextAntialiasMode</a> method.
     * @param {D2D1_ANTIALIAS_MODE} antialiasMode Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_antialias_mode">D2D1_ANTIALIAS_MODE</a></b>
     * 
     * The antialiasing mode for future drawing operations.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-setantialiasmode
     */
    SetAntialiasMode(antialiasMode) {
        ComCall(32, this, D2D1_ANTIALIAS_MODE, antialiasMode)
    }

    /**
     * Retrieves the current antialiasing mode for nontext drawing operations.
     * @returns {D2D1_ANTIALIAS_MODE} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_antialias_mode">D2D1_ANTIALIAS_MODE</a></b>
     * 
     * The current antialiasing mode for nontext drawing operations.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-getantialiasmode
     */
    GetAntialiasMode() {
        result := ComCall(33, this, D2D1_ANTIALIAS_MODE)
        return result
    }

    /**
     * Specifies the antialiasing mode to use for subsequent text and glyph drawing operations.
     * @param {D2D1_TEXT_ANTIALIAS_MODE} textAntialiasMode Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_text_antialias_mode">D2D1_TEXT_ANTIALIAS_MODE</a></b>
     * 
     * The antialiasing mode to use for subsequent text and glyph drawing operations.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-settextantialiasmode
     */
    SetTextAntialiasMode(textAntialiasMode) {
        ComCall(34, this, D2D1_TEXT_ANTIALIAS_MODE, textAntialiasMode)
    }

    /**
     * Gets the current antialiasing mode for text and glyph drawing operations.
     * @returns {D2D1_TEXT_ANTIALIAS_MODE} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_text_antialias_mode">D2D1_TEXT_ANTIALIAS_MODE</a></b>
     * 
     * The current antialiasing mode for text and glyph drawing operations.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-gettextantialiasmode
     */
    GetTextAntialiasMode() {
        result := ComCall(35, this, D2D1_TEXT_ANTIALIAS_MODE)
        return result
    }

    /**
     * Specifies text rendering options to be applied to all subsequent text and glyph drawing operations.
     * @remarks
     * If the settings specified by  <i>textRenderingParams</i> are incompatible with the render target's text antialiasing mode (specified by <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-settextantialiasmode">SetTextAntialiasMode</a>), subsequent text and glyph drawing operations will fail and put the render target into an error state.
     * @param {IDWriteRenderingParams} textRenderingParams Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwriterenderingparams">IDWriteRenderingParams</a>*</b>
     * 
     * The text rendering options to be applied to all subsequent text and glyph drawing operations; <b>NULL</b> to clear current text rendering options.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-settextrenderingparams
     */
    SetTextRenderingParams(textRenderingParams) {
        ComCall(36, this, "ptr", textRenderingParams)
    }

    /**
     * Retrieves the render target's current text rendering options.
     * @remarks
     * If the settings specified by  <i>textRenderingParams</i> are incompatible with the render target's text antialiasing mode (specified by <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-settextantialiasmode">SetTextAntialiasMode</a>), subsequent text and glyph drawing operations will fail and put the render target into an error state.
     * @param {Pointer<IDWriteRenderingParams>} textRenderingParams Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwriterenderingparams">IDWriteRenderingParams</a>**</b>
     * 
     *  When this method returns, <i>textRenderingParams</i> contains the address  of a pointer to the render target's current text rendering options.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-gettextrenderingparams
     */
    GetTextRenderingParams(textRenderingParams) {
        ComCall(37, this, IDWriteRenderingParams.Ptr, textRenderingParams)
    }

    /**
     * Specifies a label for subsequent drawing operations.
     * @remarks
     * The labels specified by this method are printed by debug error messages. If no tag is set, the default value for each tag is 0.
     * @param {Integer} tag1 Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-tag">D2D1_TAG</a></b>
     * 
     * A label to apply to subsequent drawing operations.
     * @param {Integer} tag2 Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-tag">D2D1_TAG</a></b>
     * 
     * A label to apply to subsequent drawing operations.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-settags
     */
    SetTags(tag1, tag2) {
        ComCall(38, this, "uint", tag1, "uint", tag2)
    }

    /**
     * Gets the label for subsequent drawing operations.
     * @remarks
     * If the same address is passed for both parameters, both parameters receive the value of the second tag.
     * @param {Pointer<Integer>} tag1 Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-tag">D2D1_TAG</a>*</b>
     * 
     * When this method returns, contains the first label for subsequent drawing operations. This parameter is passed uninitialized. If <b>NULL</b> is specified, no value is retrieved for this parameter.
     * @param {Pointer<Integer>} tag2 Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-tag">D2D1_TAG</a>*</b>
     * 
     * When this method returns, contains the second label for subsequent drawing operations. This parameter is passed uninitialized. If <b>NULL</b> is specified, no value is retrieved for this parameter.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-gettags
     */
    GetTags(tag1, tag2) {
        tag1Marshal := tag1 is VarRef ? "uint*" : "ptr"
        tag2Marshal := tag2 is VarRef ? "uint*" : "ptr"

        ComCall(39, this, tag1Marshal, tag1, tag2Marshal, tag2)
    }

    /**
     * Adds the specified layer to the render target so that it receives all subsequent drawing operations until PopLayer is called. (overload 1/2)
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-pushlayer(constd2d1_layer_parameters_id2d1layer)">PushLayer</a> method allows a caller to begin redirecting rendering to a layer. All rendering operations are valid in a layer. The location of the layer is affected by the world transform set on the render target. 
     * 
     * Each <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-pushlayer(constd2d1_layer_parameters_id2d1layer)">PushLayer</a> must have a matching <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-poplayer">PopLayer</a> call. If there are more <b>PopLayer</b> calls than <b>PushLayer</b> calls, the render target is placed into an error state. If <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-flush">Flush</a> is called before all outstanding layers are popped, the render target is placed into an error state, and an error is returned. The error state can be cleared by a call to <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-enddraw">EndDraw</a>.
     * 
     * A particular <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-pushlayer(constd2d1_layer_parameters_id2d1layer)">ID2D1Layer</a> resource can be active only at one time. In other words, you cannot call a <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-pushlayer(constd2d1_layer_parameters__id2d1layer)">PushLayer</a> method, and then  immediately follow with another <b>PushLayer</b> method with the same layer resource. Instead, you must call the second <b>PushLayer</b> method with different layer resources. 
     * 
     * 
     * This method doesn't return an error code if it fails. To determine whether a drawing operation (such as <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-pushlayer(constd2d1_layer_parameters_id2d1layer)">PushLayer</a>) failed, check the result returned by the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-enddraw">ID2D1RenderTarget::EndDraw</a> or <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-flush">ID2D1RenderTarget::Flush</a> methods.
     * @param {Pointer<D2D1_LAYER_PARAMETERS>} layerParameters Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/d2d1/ns-d2d1-d2d1_layer_parameters">D2D1_LAYER_PARAMETERS</a>*</b>
     * 
     * The content bounds, geometric mask, opacity, opacity mask, and antialiasing options for the layer.
     * @param {ID2D1Layer} layer Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1layer">ID2D1Layer</a>*</b>
     * 
     * The layer that receives subsequent drawing operations.
     * 
     * <div class="alert"><b>Note</b>  Starting with Windows 8, this parameter is optional. If a layer is not specified, Direct2D manages the layer resource automatically.</div>
     * <div> </div>
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-pushlayer(constd2d1_layer_parameters_id2d1layer)
     */
    PushLayer(layerParameters, layer) {
        ComCall(40, this, D2D1_LAYER_PARAMETERS.Ptr, layerParameters, "ptr", layer)
    }

    /**
     * Stops redirecting drawing operations to the layer that is specified by the last PushLayer call.
     * @remarks
     * A <b>PopLayer</b>  must match a previous <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-pushlayer(constd2d1_layer_parameters__id2d1layer)">PushLayer</a> call.
     * 
     * This method doesn't return an error code if it fails. To determine whether a drawing operation (such as <b>PopLayer</b>) failed, check the result returned by the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-enddraw">ID2D1RenderTarget::EndDraw</a> or <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-flush">ID2D1RenderTarget::Flush</a> methods.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-poplayer
     */
    PopLayer() {
        ComCall(41, this)
    }

    /**
     * Executes all pending drawing commands.
     * @remarks
     * This command does not flush the Direct3D device context that is associated with the render target.
     * 
     * Calling this method resets the error state of the render target.
     * @param {Pointer<Integer>} tag1 Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-tag">D2D1_TAG</a>*</b>
     * 
     * When this method returns, contains the tag for drawing operations that caused errors or 0 if there were no errors. This parameter is passed uninitialized.
     * @param {Pointer<Integer>} tag2 Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-tag">D2D1_TAG</a>*</b>
     * 
     * When this method returns, contains the tag for drawing operations that caused errors or 0 if there were no errors. This parameter is passed uninitialized.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code and sets <i>tag1</i> and <i>tag2</i> to the tags that were active when the error occurred. If no error occurred, this method sets the error tag state to be (0,0).
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-flush
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
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-savedrawingstate
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
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-restoredrawingstate
     */
    RestoreDrawingState(drawingStateBlock) {
        ComCall(44, this, "ptr", drawingStateBlock)
    }

    /**
     * Specifies a rectangle to which all subsequent drawing operations are clipped.
     * @remarks
     * A [**PushAxisAlignedClip**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-pushaxisalignedclip(constd2d1_rect_f__d2d1_antialias_mode)) and [**PopAxisAlignedClip**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-popaxisalignedclip) pair can occur around or within a [**PushLayer**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-pushlayer(constd2d1_layer_parameters__id2d1layer)) and [**PopLayer**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-poplayer), but cannot overlap. For example, the sequence of **PushAxisAlignedClip**, [**PushLayer**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-pushlayer(constd2d1_layer_parameters__id2d1layer)), **PopLayer**, **PopAxisAlignedClip** is valid, but the sequence of **PushAxisAlignedClip**, **PushLayer**, **PopAxisAlignedClip**, **PopLayer** is invalid.
     * 
     * This method doesn't return an error code if it fails. To determine whether a drawing operation (such as **PushAxisAlignedClip**) failed, check the result returned by the [**ID2D1RenderTarget::EndDraw**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-enddraw) or [**ID2D1RenderTarget::Flush**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-flush) methods.
     * @param {Pointer<D2D_RECT_F>} clipRect 
     * @param {D2D1_ANTIALIAS_MODE} antialiasMode 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1rendertarget-pushaxisalignedclip
     */
    PushAxisAlignedClip(clipRect, antialiasMode) {
        ComCall(45, this, D2D_RECT_F.Ptr, clipRect, D2D1_ANTIALIAS_MODE, antialiasMode)
    }

    /**
     * Removes the last axis-aligned clip from the render target. After this method is called, the clip is no longer applied to subsequent drawing operations.
     * @remarks
     * A <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-pushaxisalignedclip(constd2d1_rect_f__d2d1_antialias_mode)">PushAxisAlignedClip</a>/<b>PopAxisAlignedClip</b> pair can occur around or within a <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-pushlayer(constd2d1_layer_parameters__id2d1layer)">PushLayer</a>/<a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-poplayer">PopLayer</a> pair, but may not overlap. For example, a <b>PushAxisAlignedClip</b>, <b>PushLayer</b>, <b>PopLayer</b>, <b>PopAxisAlignedClip</b>  sequence is valid, but a <b>PushAxisAlignedClip</b>, <b>PushLayer</b>, <b>PopAxisAlignedClip</b>, <b>PopLayer</b> sequence is not. 
     * 
     * <b>PopAxisAlignedClip</b> must be called once for every call to <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-pushaxisalignedclip(constd2d1_rect_f__d2d1_antialias_mode)">PushAxisAlignedClip</a>.
     * 
     * For an example, see <a href="https://docs.microsoft.com/windows/win32/Direct2D/how-to-clip-with-axis-aligned-rects">How to Clip with an Axis-Aligned Clip Rectangle</a>.
     * 
     * This method doesn't return an error code if it fails. To determine whether a drawing operation (such as <b>PopAxisAlignedClip</b>) failed, check the result returned by the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-enddraw">ID2D1RenderTarget::EndDraw</a> or <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-flush">ID2D1RenderTarget::Flush</a> methods.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-popaxisalignedclip
     */
    PopAxisAlignedClip() {
        ComCall(46, this)
    }

    /**
     * Clears the drawing area to the specified color.
     * @remarks
     * Direct2D interprets the *clearColor* as straight alpha (not premultiplied). If the render target's alpha mode is [**D2D1\_ALPHA\_MODE\_IGNORE**](/windows/desktop/api/dcommon/ne-dcommon-d2d1_alpha_mode), the alpha channel of *clearColor* is ignored and replaced with 1.0f (fully opaque).
     * 
     * If the render target has an active clip (specified by [**PushAxisAlignedClip**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-pushaxisalignedclip(constd2d1_rect_f__d2d1_antialias_mode))), the clear command is only applied to the area within the clip region.
     * @param {Pointer<D2D1_COLOR_F>} clearColor 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1rendertarget-clear
     */
    Clear(clearColor) {
        ComCall(47, this, D2D1_COLOR_F.Ptr, clearColor)
    }

    /**
     * Initiates drawing on this render target.
     * @remarks
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
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-begindraw
     */
    BeginDraw() {
        ComCall(48, this)
    }

    /**
     * Ends drawing operations on the render target and indicates the current error state and associated tags.
     * @remarks
     * Drawing operations can only be issued between a <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-begindraw">BeginDraw</a> and <b>EndDraw</b> call.
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-begindraw">BeginDraw</a> and <b>EndDraw</b> are use to indicate that a render target is in use by the Direct2D system. Different implementations of <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1rendertarget">ID2D1RenderTarget</a> might behave differently when <b>BeginDraw</b> is called. An <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1bitmaprendertarget">ID2D1BitmapRenderTarget</a> may be locked between <b>BeginDraw</b>/<b>EndDraw</b> calls, a DXGI surface render target might be acquired on <b>BeginDraw</b> and released on <b>EndDraw</b>, while an <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1hwndrendertarget">ID2D1HwndRenderTarget</a> may begin batching at <b>BeginDraw</b> and may present on <b>EndDraw</b>, for example.
     * 
     * The <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-begindraw">BeginDraw</a> method must be called before rendering operations can be called, though state-setting and state-retrieval operations can be performed even outside of <b>BeginDraw</b>/<b>EndDraw</b>. 
     * 
     * After <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-begindraw">BeginDraw</a> is called, a render target will normally build up a batch of rendering commands, but defer processing of these commands until either an internal buffer is full, the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-flush">Flush</a> method is called, or until <b>EndDraw</b> is called. The <b>EndDraw</b> method causes any batched drawing operations to complete, and then returns an <b>HRESULT</b> indicating the success of the operations and, optionally, the tag state of the render target at the time the error occurred. The <b>EndDraw</b> method always succeeds: it should not be called twice even if a previous <b>EndDraw</b> resulted in a failing <b>HRESULT</b>. 
     * 
     * If <b>EndDraw</b> is called without a matched call to <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-begindraw">BeginDraw</a>, it returns an error indicating that <b>BeginDraw</b> must be called before <b>EndDraw</b>.
     * 
     * Calling <b>BeginDraw</b> twice on a render target puts the target into an error state where nothing further is drawn, and returns an appropriate <b>HRESULT</b> and error information when <b>EndDraw</b> is called.
     * @param {Pointer<Integer>} tag1 Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-tag">D2D1_TAG</a>*</b>
     * 
     * When this method returns, contains the tag for drawing operations that caused errors or 0 if there were no errors. This parameter is passed uninitialized.
     * @param {Pointer<Integer>} tag2 Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-tag">D2D1_TAG</a>*</b>
     * 
     * When this method returns, contains the tag for drawing operations that caused errors or 0 if there were no errors. This parameter is passed uninitialized.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code and sets <i>tag1</i> and <i>tag2</i> to the tags that were active when the error occurred.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-enddraw
     */
    EndDraw(tag1, tag2) {
        tag1Marshal := tag1 is VarRef ? "uint*" : "ptr"
        tag2Marshal := tag2 is VarRef ? "uint*" : "ptr"

        result := ComCall(49, this, tag1Marshal, tag1, tag2Marshal, tag2, Int32)
        return result
    }

    /**
     * Retrieves the pixel format and alpha mode of the render target.
     * @returns {D2D1_PIXEL_FORMAT} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dcommon/ns-dcommon-d2d1_pixel_format">D2D1_PIXEL_FORMAT</a></b>
     * 
     * The pixel format and alpha mode of the render target.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-getpixelformat
     */
    GetPixelFormat() {
        result := ComCall(50, this, D2D1_PIXEL_FORMAT)
        return result
    }

    /**
     * Sets the dots per inch (DPI) of the render target.
     * @remarks
     * This method specifies the mapping from pixel space to device-independent space  for the render target.  If both <i>dpiX</i> and <i>dpiY</i> are 0, the factory-read system DPI is chosen. If one parameter is zero and the other unspecified, the DPI is not changed.
     * 
     * For <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1hwndrendertarget">ID2D1HwndRenderTarget</a>, the DPI defaults to the most recently factory-read system DPI. The default value for all other render targets is 96 DPI.
     * @param {Float} dpiX Type: <b>FLOAT</b>
     * 
     * A value greater than or equal to zero that specifies the horizontal DPI of the render target.
     * @param {Float} dpiY Type: <b>FLOAT</b>
     * 
     * A value greater than or equal to zero that specifies the vertical DPI of the render target.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-setdpi
     */
    SetDpi(dpiX, dpiY) {
        ComCall(51, this, "float", dpiX, "float", dpiY)
    }

    /**
     * Return the render target's dots per inch (DPI).
     * @remarks
     * This method indicates the mapping from pixel space to device-independent space  for the render target.  
     * 
     * For <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1hwndrendertarget">ID2D1HwndRenderTarget</a>, the DPI defaults to the most recently factory-read system DPI. The default value for all other render targets is 96 DPI.
     * @param {Pointer<Float>} dpiX Type: <b>FLOAT*</b>
     * 
     * When this method returns, contains the horizontal DPI of the render target. This parameter is passed uninitialized.
     * @param {Pointer<Float>} dpiY Type: <b>FLOAT*</b>
     * 
     * When this method returns, contains the vertical DPI of the render target. This parameter is passed uninitialized.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-getdpi
     */
    GetDpi(dpiX, dpiY) {
        dpiXMarshal := dpiX is VarRef ? "float*" : "ptr"
        dpiYMarshal := dpiY is VarRef ? "float*" : "ptr"

        ComCall(52, this, dpiXMarshal, dpiX, dpiYMarshal, dpiY)
    }

    /**
     * Returns the size of the render target in device-independent pixels.
     * @returns {D2D_SIZE_F} Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-size-f">D2D1_SIZE_F</a></b>
     * 
     * The current size of the render target in device-independent pixels.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-getsize
     */
    GetSize() {
        result := ComCall(53, this, D2D_SIZE_F)
        return result
    }

    /**
     * Returns the size of the render target in device pixels.
     * @returns {D2D_SIZE_U} Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-size-u">D2D1_SIZE_U</a></b>
     * 
     * The size of the render target in device pixels.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-getpixelsize
     */
    GetPixelSize() {
        result := ComCall(54, this, D2D_SIZE_U)
        return result
    }

    /**
     * Gets the maximum size, in device-dependent units (pixels), of any one bitmap dimension supported by the render target.
     * @remarks
     * This method returns the maximum texture size of the Direct3D device.
     * 
     * <div class="alert"><b>Note</b>  The software renderer and WARP devices return the value of 16 megapixels (16*1024*1024).  You can create a <a href="https://docs.microsoft.com/windows/win32/Direct2D/direct2d-portal">Direct2D</a> texture that is this size, but not a Direct3D texture that is this size.</div>
     * <div> </div>
     * @returns {Integer} Type: <b>UINT32</b>
     * 
     *  The maximum size, in pixels, of  any one bitmap dimension supported by the render target.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-getmaximumbitmapsize
     */
    GetMaximumBitmapSize() {
        result := ComCall(55, this, UInt32)
        return result
    }

    /**
     * Indicates whether the render target supports the specified properties. (overload 1/2)
     * @remarks
     * This method does not evaluate the DPI settings specified by the <i>renderTargetProperties</i> parameter.
     * @param {Pointer<D2D1_RENDER_TARGET_PROPERTIES>} renderTargetProperties Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/d2d1/ns-d2d1-d2d1_render_target_properties">D2D1_RENDER_TARGET_PROPERTIES</a>*</b>
     * 
     * The render target properties to test.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> if the specified render target properties are supported by this render target; otherwise, <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-issupported(constd2d1_render_target_properties_)
     */
    IsSupported(renderTargetProperties) {
        result := ComCall(56, this, D2D1_RENDER_TARGET_PROPERTIES.Ptr, renderTargetProperties, BOOL)
        return result
    }

    Query(iid) {
        if (ID2D1RenderTarget.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateBitmap := CallbackCreate(GetMethod(implObj, "CreateBitmap"), flags, 6)
        this.vtbl.CreateBitmapFromWicBitmap := CallbackCreate(GetMethod(implObj, "CreateBitmapFromWicBitmap"), flags, 4)
        this.vtbl.CreateSharedBitmap := CallbackCreate(GetMethod(implObj, "CreateSharedBitmap"), flags, 5)
        this.vtbl.CreateBitmapBrush := CallbackCreate(GetMethod(implObj, "CreateBitmapBrush"), flags, 5)
        this.vtbl.CreateSolidColorBrush := CallbackCreate(GetMethod(implObj, "CreateSolidColorBrush"), flags, 4)
        this.vtbl.CreateGradientStopCollection := CallbackCreate(GetMethod(implObj, "CreateGradientStopCollection"), flags, 6)
        this.vtbl.CreateLinearGradientBrush := CallbackCreate(GetMethod(implObj, "CreateLinearGradientBrush"), flags, 5)
        this.vtbl.CreateRadialGradientBrush := CallbackCreate(GetMethod(implObj, "CreateRadialGradientBrush"), flags, 5)
        this.vtbl.CreateCompatibleRenderTarget := CallbackCreate(GetMethod(implObj, "CreateCompatibleRenderTarget"), flags, 6)
        this.vtbl.CreateLayer := CallbackCreate(GetMethod(implObj, "CreateLayer"), flags, 3)
        this.vtbl.CreateMesh := CallbackCreate(GetMethod(implObj, "CreateMesh"), flags, 2)
        this.vtbl.DrawLine := CallbackCreate(GetMethod(implObj, "DrawLine"), flags, 6)
        this.vtbl.DrawRectangle := CallbackCreate(GetMethod(implObj, "DrawRectangle"), flags, 5)
        this.vtbl.FillRectangle := CallbackCreate(GetMethod(implObj, "FillRectangle"), flags, 3)
        this.vtbl.DrawRoundedRectangle := CallbackCreate(GetMethod(implObj, "DrawRoundedRectangle"), flags, 5)
        this.vtbl.FillRoundedRectangle := CallbackCreate(GetMethod(implObj, "FillRoundedRectangle"), flags, 3)
        this.vtbl.DrawEllipse := CallbackCreate(GetMethod(implObj, "DrawEllipse"), flags, 5)
        this.vtbl.FillEllipse := CallbackCreate(GetMethod(implObj, "FillEllipse"), flags, 3)
        this.vtbl.DrawGeometry := CallbackCreate(GetMethod(implObj, "DrawGeometry"), flags, 5)
        this.vtbl.FillGeometry := CallbackCreate(GetMethod(implObj, "FillGeometry"), flags, 4)
        this.vtbl.FillMesh := CallbackCreate(GetMethod(implObj, "FillMesh"), flags, 3)
        this.vtbl.FillOpacityMask := CallbackCreate(GetMethod(implObj, "FillOpacityMask"), flags, 6)
        this.vtbl.DrawBitmap := CallbackCreate(GetMethod(implObj, "DrawBitmap"), flags, 6)
        this.vtbl.DrawText := CallbackCreate(GetMethod(implObj, "DrawText"), flags, 8)
        this.vtbl.DrawTextLayout := CallbackCreate(GetMethod(implObj, "DrawTextLayout"), flags, 5)
        this.vtbl.DrawGlyphRun := CallbackCreate(GetMethod(implObj, "DrawGlyphRun"), flags, 5)
        this.vtbl.SetTransform := CallbackCreate(GetMethod(implObj, "SetTransform"), flags, 2)
        this.vtbl.GetTransform := CallbackCreate(GetMethod(implObj, "GetTransform"), flags, 2)
        this.vtbl.SetAntialiasMode := CallbackCreate(GetMethod(implObj, "SetAntialiasMode"), flags, 2)
        this.vtbl.GetAntialiasMode := CallbackCreate(GetMethod(implObj, "GetAntialiasMode"), flags, 1)
        this.vtbl.SetTextAntialiasMode := CallbackCreate(GetMethod(implObj, "SetTextAntialiasMode"), flags, 2)
        this.vtbl.GetTextAntialiasMode := CallbackCreate(GetMethod(implObj, "GetTextAntialiasMode"), flags, 1)
        this.vtbl.SetTextRenderingParams := CallbackCreate(GetMethod(implObj, "SetTextRenderingParams"), flags, 2)
        this.vtbl.GetTextRenderingParams := CallbackCreate(GetMethod(implObj, "GetTextRenderingParams"), flags, 2)
        this.vtbl.SetTags := CallbackCreate(GetMethod(implObj, "SetTags"), flags, 3)
        this.vtbl.GetTags := CallbackCreate(GetMethod(implObj, "GetTags"), flags, 3)
        this.vtbl.PushLayer := CallbackCreate(GetMethod(implObj, "PushLayer"), flags, 3)
        this.vtbl.PopLayer := CallbackCreate(GetMethod(implObj, "PopLayer"), flags, 1)
        this.vtbl.Flush := CallbackCreate(GetMethod(implObj, "Flush"), flags, 3)
        this.vtbl.SaveDrawingState := CallbackCreate(GetMethod(implObj, "SaveDrawingState"), flags, 2)
        this.vtbl.RestoreDrawingState := CallbackCreate(GetMethod(implObj, "RestoreDrawingState"), flags, 2)
        this.vtbl.PushAxisAlignedClip := CallbackCreate(GetMethod(implObj, "PushAxisAlignedClip"), flags, 3)
        this.vtbl.PopAxisAlignedClip := CallbackCreate(GetMethod(implObj, "PopAxisAlignedClip"), flags, 1)
        this.vtbl.Clear := CallbackCreate(GetMethod(implObj, "Clear"), flags, 2)
        this.vtbl.BeginDraw := CallbackCreate(GetMethod(implObj, "BeginDraw"), flags, 1)
        this.vtbl.EndDraw := CallbackCreate(GetMethod(implObj, "EndDraw"), flags, 3)
        this.vtbl.GetPixelFormat := CallbackCreate(GetMethod(implObj, "GetPixelFormat"), flags, 1)
        this.vtbl.SetDpi := CallbackCreate(GetMethod(implObj, "SetDpi"), flags, 3)
        this.vtbl.GetDpi := CallbackCreate(GetMethod(implObj, "GetDpi"), flags, 3)
        this.vtbl.GetSize := CallbackCreate(GetMethod(implObj, "GetSize"), flags, 1)
        this.vtbl.GetPixelSize := CallbackCreate(GetMethod(implObj, "GetPixelSize"), flags, 1)
        this.vtbl.GetMaximumBitmapSize := CallbackCreate(GetMethod(implObj, "GetMaximumBitmapSize"), flags, 1)
        this.vtbl.IsSupported := CallbackCreate(GetMethod(implObj, "IsSupported"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateBitmap)
        CallbackFree(this.vtbl.CreateBitmapFromWicBitmap)
        CallbackFree(this.vtbl.CreateSharedBitmap)
        CallbackFree(this.vtbl.CreateBitmapBrush)
        CallbackFree(this.vtbl.CreateSolidColorBrush)
        CallbackFree(this.vtbl.CreateGradientStopCollection)
        CallbackFree(this.vtbl.CreateLinearGradientBrush)
        CallbackFree(this.vtbl.CreateRadialGradientBrush)
        CallbackFree(this.vtbl.CreateCompatibleRenderTarget)
        CallbackFree(this.vtbl.CreateLayer)
        CallbackFree(this.vtbl.CreateMesh)
        CallbackFree(this.vtbl.DrawLine)
        CallbackFree(this.vtbl.DrawRectangle)
        CallbackFree(this.vtbl.FillRectangle)
        CallbackFree(this.vtbl.DrawRoundedRectangle)
        CallbackFree(this.vtbl.FillRoundedRectangle)
        CallbackFree(this.vtbl.DrawEllipse)
        CallbackFree(this.vtbl.FillEllipse)
        CallbackFree(this.vtbl.DrawGeometry)
        CallbackFree(this.vtbl.FillGeometry)
        CallbackFree(this.vtbl.FillMesh)
        CallbackFree(this.vtbl.FillOpacityMask)
        CallbackFree(this.vtbl.DrawBitmap)
        CallbackFree(this.vtbl.DrawText)
        CallbackFree(this.vtbl.DrawTextLayout)
        CallbackFree(this.vtbl.DrawGlyphRun)
        CallbackFree(this.vtbl.SetTransform)
        CallbackFree(this.vtbl.GetTransform)
        CallbackFree(this.vtbl.SetAntialiasMode)
        CallbackFree(this.vtbl.GetAntialiasMode)
        CallbackFree(this.vtbl.SetTextAntialiasMode)
        CallbackFree(this.vtbl.GetTextAntialiasMode)
        CallbackFree(this.vtbl.SetTextRenderingParams)
        CallbackFree(this.vtbl.GetTextRenderingParams)
        CallbackFree(this.vtbl.SetTags)
        CallbackFree(this.vtbl.GetTags)
        CallbackFree(this.vtbl.PushLayer)
        CallbackFree(this.vtbl.PopLayer)
        CallbackFree(this.vtbl.Flush)
        CallbackFree(this.vtbl.SaveDrawingState)
        CallbackFree(this.vtbl.RestoreDrawingState)
        CallbackFree(this.vtbl.PushAxisAlignedClip)
        CallbackFree(this.vtbl.PopAxisAlignedClip)
        CallbackFree(this.vtbl.Clear)
        CallbackFree(this.vtbl.BeginDraw)
        CallbackFree(this.vtbl.EndDraw)
        CallbackFree(this.vtbl.GetPixelFormat)
        CallbackFree(this.vtbl.SetDpi)
        CallbackFree(this.vtbl.GetDpi)
        CallbackFree(this.vtbl.GetSize)
        CallbackFree(this.vtbl.GetPixelSize)
        CallbackFree(this.vtbl.GetMaximumBitmapSize)
        CallbackFree(this.vtbl.IsSupported)
    }
}
