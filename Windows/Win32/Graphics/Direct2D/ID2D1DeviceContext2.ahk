#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Imaging\IWICBitmapSource.ahk" { IWICBitmapSource }
#Import ".\ID2D1ImageSource.ahk" { ID2D1ImageSource }
#Import "Common\D2D_RECT_F.ahk" { D2D_RECT_F }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\D2D1_INK_STYLE_PROPERTIES.ahk" { D2D1_INK_STYLE_PROPERTIES }
#Import ".\D2D1_GRADIENT_MESH_PATCH.ahk" { D2D1_GRADIENT_MESH_PATCH }
#Import ".\ID2D1ImageSourceFromWic.ahk" { ID2D1ImageSourceFromWic }
#Import ".\D2D1_IMAGE_SOURCE_FROM_DXGI_OPTIONS.ahk" { D2D1_IMAGE_SOURCE_FROM_DXGI_OPTIONS }
#Import ".\ID2D1TransformedImageSource.ahk" { ID2D1TransformedImageSource }
#Import ".\D2D1_INK_POINT.ahk" { D2D1_INK_POINT }
#Import ".\ID2D1Brush.ahk" { ID2D1Brush }
#Import "..\Dxgi\IDXGISurface.ahk" { IDXGISurface }
#Import ".\ID2D1GdiMetafile.ahk" { ID2D1GdiMetafile }
#Import ".\D2D1_BUFFER_PRECISION.ahk" { D2D1_BUFFER_PRECISION }
#Import ".\D2D1_IMAGE_SOURCE_LOADING_OPTIONS.ahk" { D2D1_IMAGE_SOURCE_LOADING_OPTIONS }
#Import ".\ID2D1LookupTable3D.ahk" { ID2D1LookupTable3D }
#Import "Common\D2D1_ALPHA_MODE.ahk" { D2D1_ALPHA_MODE }
#Import ".\ID2D1Ink.ahk" { ID2D1Ink }
#Import ".\ID2D1InkStyle.ahk" { ID2D1InkStyle }
#Import ".\D2D1_TRANSFORMED_IMAGE_SOURCE_PROPERTIES.ahk" { D2D1_TRANSFORMED_IMAGE_SOURCE_PROPERTIES }
#Import ".\ID2D1GradientMesh.ahk" { ID2D1GradientMesh }
#Import ".\ID2D1DeviceContext1.ahk" { ID2D1DeviceContext1 }
#Import "..\Dxgi\Common\DXGI_COLOR_SPACE_TYPE.ahk" { DXGI_COLOR_SPACE_TYPE }

/**
 * This interface performs all the same functions as the ID2D1DeviceContext1 interface, plus it enables functionality such as ink rendering, gradient mesh rendering, and improved image loading.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nn-d2d1_3-id2d1devicecontext2
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1DeviceContext2 extends ID2D1DeviceContext1 {
    /**
     * The interface identifier for ID2D1DeviceContext2
     * @type {Guid}
     */
    static IID := Guid("{394ea6a3-0c34-4321-950b-6ca20f0be6c7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1DeviceContext2 interfaces
    */
    struct Vtbl extends ID2D1DeviceContext1.Vtbl {
        CreateInk                    : IntPtr
        CreateInkStyle               : IntPtr
        CreateGradientMesh           : IntPtr
        CreateImageSourceFromWic     : IntPtr
        CreateLookupTable3D          : IntPtr
        CreateImageSourceFromDxgi    : IntPtr
        GetGradientMeshWorldBounds   : IntPtr
        DrawInk                      : IntPtr
        DrawGradientMesh             : IntPtr
        DrawGdiMetafile              : IntPtr
        CreateTransformedImageSource : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1DeviceContext2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates a new ID2D1Ink object that starts at the given point. (overload 1/2)
     * @param {Pointer<D2D1_INK_POINT>} startPoint Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/ns-d2d1_3-d2d1_ink_point">D2D1_INK_POINT</a></b>
     * 
     * The starting point of the first segment of the first stroke in the new ink object.
     * @returns {ID2D1Ink} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/nn-d2d1_3-id2d1ink">ID2D1Ink</a>**</b>
     * 
     * When this method returns, contains the address of a pointer to a new ink object.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1devicecontext2-createink(constd2d1_ink_point__id2d1ink)
     */
    CreateInk(startPoint) {
        result := ComCall(95, this, D2D1_INK_POINT.Ptr, startPoint, "ptr*", &_ink := 0, "HRESULT")
        return ID2D1Ink(_ink)
    }

    /**
     * Creates a new ID2D1InkStyle object, for use with ink rendering methods such as DrawInk. (overload 2/2)
     * @param {Pointer<D2D1_INK_STYLE_PROPERTIES>} inkStyleProperties Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/ns-d2d1_3-d2d1_ink_style_properties">D2D1_INK_STYLE_PROPERTIES</a></b>
     * 
     * The properties of the ink style to be created.
     * @returns {ID2D1InkStyle} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/nn-d2d1_3-id2d1inkstyle">ID2D1InkStyle</a>**</b>
     * 
     * When this method returns, contains the address of a pointer to a new ink style object.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1devicecontext2-createinkstyle(constd2d1_ink_style_properties_id2d1inkstyle)
     */
    CreateInkStyle(inkStyleProperties) {
        result := ComCall(96, this, D2D1_INK_STYLE_PROPERTIES.Ptr, inkStyleProperties, "ptr*", &inkStyle := 0, "HRESULT")
        return ID2D1InkStyle(inkStyle)
    }

    /**
     * Creates a new ID2D1GradientMesh instance using the given array of patches.
     * @param {Pointer<D2D1_GRADIENT_MESH_PATCH>} patches Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/ns-d2d1_3-d2d1_gradient_mesh_patch">D2D1_GRADIENT_MESH_PATCH</a>*</b>
     * 
     * A pointer to the array containing the patches to be used in this mesh.
     * @param {Integer} patchesCount Type: <b>UINT32</b>
     * 
     * The number of patches in the patches argument to read.
     * @returns {ID2D1GradientMesh} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/nn-d2d1_3-id2d1gradientmesh">ID2D1GradientMesh</a>**</b>
     * 
     * When this method returns, contains the address of a pointer to the new gradient mesh.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1devicecontext2-creategradientmesh
     */
    CreateGradientMesh(patches, patchesCount) {
        result := ComCall(97, this, D2D1_GRADIENT_MESH_PATCH.Ptr, patches, "uint", patchesCount, "ptr*", &gradientMesh := 0, "HRESULT")
        return ID2D1GradientMesh(gradientMesh)
    }

    /**
     * Creates an image source object from a WIC bitmap source, while populating all pixel memory within the image source. The image is loaded and stored while using a minimal amount of memory. (overload 2/3)
     * @remarks
     * This method creates an image source which can be used to draw the image.  
     * 
     * This method supports images that exceed the maximum texture size.  Large images are internally stored within a sparse tile cache.   
     * 
     * This API supports the same set of pixel formats and alpha modes supported by <a href="https://docs.microsoft.com/windows/desktop/Direct2D/id2d1devicecontext-createbitmapfromwicbitmap-overload">CreateBitmapFromWicBitmap</a>.  
     *           If the GPU does not support a given pixel format,
     *           this method will return D2DERR_UNSUPPORTED_PIXEL_FORMAT.  This method does not apply adjustments such as gamma 
     *           or alpha premultiplication which affect the appearance of the image.
     *         
     * 
     * This method automatically selects an appropriate storage format to minimize GPU memory usage., such as using separate 
     *         luminance and chrominance textures for JPEG images. 
     * 
     * If the loadingOptions argument is NULL, D2D uses D2D1_IMAGE_SOURCE_LOADING_OPTIONS_NONE.
     * @param {IWICBitmapSource} wicBitmapSource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapsource">IWICBitmapSource</a>*</b>
     * 
     * The WIC bitmap source to create the image source from.
     * @param {D2D1_IMAGE_SOURCE_LOADING_OPTIONS} loadingOptions Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/ne-d2d1_3-d2d1_image_source_loading_options">D2D1_IMAGE_SOURCE_LOADING_OPTIONS</a></b>
     * 
     * Options for creating the image source.  Default options are used if NULL.
     * @param {D2D1_ALPHA_MODE} alphaMode 
     * @returns {ID2D1ImageSourceFromWic} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/nn-d2d1_3-id2d1imagesourcefromwic">ID2D1ImageSourceFromWic</a>**</b>
     * 
     * Receives the new image source instance.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1devicecontext2-createimagesourcefromwic(iwicbitmapsource_d2d1_image_source_loading_options_id2d1imagesourcefromwic)
     */
    CreateImageSourceFromWic(wicBitmapSource, loadingOptions, alphaMode) {
        result := ComCall(98, this, "ptr", wicBitmapSource, D2D1_IMAGE_SOURCE_LOADING_OPTIONS, loadingOptions, D2D1_ALPHA_MODE, alphaMode, "ptr*", &imageSource := 0, "HRESULT")
        return ID2D1ImageSourceFromWic(imageSource)
    }

    /**
     * Creates a 3D lookup table for mapping a 3-channel input to a 3-channel output. The table data must be provided in 4-channel format. (ID2D1DeviceContext2.CreateLookupTable3D)
     * @param {D2D1_BUFFER_PRECISION} precision Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_buffer_precision">D2D1_BUFFER_PRECISION</a></b>
     * 
     * Precision of the input lookup table data.
     * @param {Pointer<Integer>} extents Type: <b>const UINT32*</b>
     * 
     * Number of lookup table elements per dimension (X, Y, Z).
     * @param {Pointer<Integer>} data Type: <b>const BYTE*</b>
     * 
     * Buffer holding the lookup table data.
     * @param {Integer} dataCount Type: <b>UINT32</b>
     * 
     * Size of the lookup table data buffer.
     * @param {Pointer<Integer>} strides Type: <b>const UINT32*</b>
     * 
     * An array containing two values.  The first value is the size in bytes from one row (X dimension) of LUT data to the next.  
     *           The second value is the size in bytes from one LUT data plane (X and Y dimensions) to the next.
     * @returns {ID2D1LookupTable3D} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/nn-d2d1_3-id2d1lookuptable3d">ID2D1LookupTable3D</a>**</b>
     * 
     * Receives the new lookup table instance.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1devicecontext2-createlookuptable3d
     */
    CreateLookupTable3D(precision, extents, data, dataCount, strides) {
        extentsMarshal := extents is VarRef ? "uint*" : "ptr"
        dataMarshal := data is VarRef ? "char*" : "ptr"
        stridesMarshal := strides is VarRef ? "uint*" : "ptr"

        result := ComCall(99, this, D2D1_BUFFER_PRECISION, precision, extentsMarshal, extents, dataMarshal, data, "uint", dataCount, stridesMarshal, strides, "ptr*", &lookupTable := 0, "HRESULT")
        return ID2D1LookupTable3D(lookupTable)
    }

    /**
     * Creates an image source from a set of DXGI surface(s). The YCbCr surface(s) are converted to RGBA automatically during subsequent drawing.
     * @remarks
     * This method creates an image source, which can be used to draw the image.
     * 
     * This method supports surfaces that use a limited set of DXGI formats and DXGI color space types.  Only the below set of combinations of color space types, surface formats, and surface counts are supported:
     * 
     * <table>
     * <tr>
     * <th>Color Space Type</th>
     * <th>Surface Count(s)</th>
     * <th>Surface Format(s)</th>
     * </tr>
     * <tr>
     * <td>DXGI_COLOR_SPACE_RGB_FULL_G22_NONE_P709</td>
     * <td>1</td>
     * <td>Standard D2D-supported pixel formats:
     *               <ul>
     * <li>DXGI_FORMAT_A8_UNORM</li>
     * <li>DXGI_FORMAT_R8_UNORM</li>
     * <li>DXGI_FORMAT_R8G8_UNORM</li>
     * <li>DXGI_FORMAT_R8G8B8A8_UNORM</li>
     * <li>DXGI_FORMAT_B8G8R8A8_UNORM</li>
     * <li>DXGI_FORMAT_B8G8R8X8_UNORM</li>
     * <li>DXGI_FORMAT_R8G8B8A8_UNORM_SRGB</li>
     * <li>DXGI_FORMAT_B8G8R8A8_UNORM_SRGB</li>
     * <li>DXGI_FORMAT_R16G16B16A16_FLOAT</li>
     * <li>DXGI_FORMAT_R16G16B16A16_UNORM</li>
     * <li>DXGI_FORMAT_R32G32B32A32_FLOAT</li>
     * <li>DXGI_FORMAT_BC1_UNORM</li>
     * <li>DXGI_FORMAT_BC2_UNORM</li>
     * <li>DXGI_FORMAT_BC3_UNORM</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td>DXGI_COLOR_SPACE_YCBCR_FULL_G22_NONE_P709_X601</td>
     * <td>1, 2, 3</td>
     * <td>When Surface count is 1:
     *               <ul>
     * <li>DXGI_FORMAT_AYUV</li>
     * <li>DXGI_FORMAT_NV12</li>
     * <li>DXGI_FORMAT_YUY2</li>
     * <li>DXGI_FORMAT_P208</li>
     * <li>DXGI_FORMAT_V208</li>
     * <li>DXGI_FORMAT_V408</li>
     * </ul>
     * When Surface Count is 2:
     * 
     * <ul>
     * <li>{DXGI_FORMAT_R8_UNORM, DXGI_FORMAT_R8G8_UNORM}</li>
     * </ul>
     * When Surface Count is 3:
     * 
     * <ul>
     * <li>{DXGI_FORMAT_R8_UNORM, DXGI_FORMAT_R8_UNORM, DXGI_FORMAT_R8_UNORM}</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td>DXGI_COLOR_SPACE_YCBCR_STUDIO_G22_LEFT_P601
     *               DXGI_COLOR_SPACE_YCBCR_FULL_G22_LEFT_P601
     * 
     * DXGI_COLOR_SPACE_YCBCR_STUDIO_G22_LEFT_P709
     * 
     * DXGI_COLOR_SPACE_YCBCR_FULL_G22_LEFT_P709
     * 
     * DXGI_COLOR_SPACE_YCBCR_STUDIO_G22_LEFT_P2020
     * 
     * DXGI_COLOR_SPACE_YCBCR_FULL_G22_LEFT_P2020
     * 
     * </td>
     * <td>1,2,3</td>
     * <td>
     * When Surface count is 1: 
     * 
     * <ul>
     * <li>DXGI_FORMAT_NV12</li>
     * <li>DXGI_FORMAT_YUY2</li>
     * <li>DXGI_FORMAT_P208</li>
     * <li>DXGI_FORMAT_V208</li>
     * </ul>
     * When Surface Count is 2:
     * 
     * <ul>
     * <li>{DXGI_FORMAT_R8_UNORM, DXGI_FORMAT_R8G8_UNORM}</li>
     * </ul>
     * When Surface Count is 3:
     * 
     * <ul>
     * <li>{DXGI_FORMAT_R8_UNORM, DXGI_FORMAT_R8_UNORM, DXGI_FORMAT_R8_UNORM}</li>
     * </ul>
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * The GPU must also have sufficient support for a pixel format to be supported by D2D.  To determine whether D2D supports a format, call IsDxgiFormatSupported.
     * 
     * This API converts YCbCr formats to sRGB using the provided color space type and options.  RGBA data is assumed to be in the desired space, and D2D does not apply any conversion.
     * 
     * If multiple surfaces are provided, this method infers whether chroma planes are subsampled (by 2x) from the relative sizes of each
     *           corresponding source rectangle (or if the source rectangles parameter is NULL, the bounds of each surface).  The second and third rectangle must each
     *           be equal in size to the first rectangle, or to the first rectangle with one or both dimensions scaled by 0.5 (while rounding up).
     *         
     * 
     * If provided, the source rectangles must be within the bounds of the corresponding surface.  The source rectangles may have different origins.
     *           In this case, this method shifts the data from each plane to align with one another.
     * @param {Pointer<IDXGISurface>} surfaces Type: [in] <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgisurface">IDXGISurface</a>**</b>
     * 
     * The DXGI surfaces to create the image source from.
     * @param {Integer} surfaceCount Type: <b>UINT32</b>
     * 
     * The number of surfaces provided; must be between one and three.
     * @param {DXGI_COLOR_SPACE_TYPE} colorSpace Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgicommon/ne-dxgicommon-dxgi_color_space_type">DXGI_COLOR_SPACE_TYPE</a></b>
     * 
     * The color space of the input.
     * @param {D2D1_IMAGE_SOURCE_FROM_DXGI_OPTIONS} options Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/ne-d2d1_3-d2d1_image_source_from_dxgi_options">D2D1_IMAGE_SOURCE_FROM_DXGI_OPTIONS</a></b>
     * 
     * Options controlling color space conversions.
     * @returns {ID2D1ImageSource} Type: [out] <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/nn-d2d1_3-id2d1imagesource">ID2D1ImageSource</a>**</b>
     * 
     * Receives the new image source instance.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1devicecontext2-createimagesourcefromdxgi
     */
    CreateImageSourceFromDxgi(surfaces, surfaceCount, colorSpace, options) {
        result := ComCall(100, this, IDXGISurface.Ptr, surfaces, "uint", surfaceCount, DXGI_COLOR_SPACE_TYPE, colorSpace, D2D1_IMAGE_SOURCE_FROM_DXGI_OPTIONS, options, "ptr*", &imageSource := 0, "HRESULT")
        return ID2D1ImageSource(imageSource)
    }

    /**
     * Returns the world bounds of a given gradient mesh.
     * @remarks
     * The world bounds reflect the current DPI, unit mode, and world transform of the context. They indicate which pixels would be impacted by calling DrawGradientMesh with the given gradient mesh. 
     * They do not reflect the current clip rectangle set on the device context or the extent of the context’s current target.
     * @param {ID2D1GradientMesh} gradientMesh Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/nn-d2d1_3-id2d1gradientmesh">ID2D1GradientMesh</a>*</b>
     * 
     * The gradient mesh whose world bounds will be calculated.
     * @returns {D2D_RECT_F} Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-rect-f">D2D1_RECT_F</a>*</b>
     * 
     * When this method returns, contains a pointer to the bounds of the gradient mesh, in device independent pixels (DIPs).
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1devicecontext2-getgradientmeshworldbounds
     */
    GetGradientMeshWorldBounds(gradientMesh) {
        pBounds := D2D_RECT_F()
        result := ComCall(101, this, "ptr", gradientMesh, D2D_RECT_F.Ptr, pBounds, "HRESULT")
        return pBounds
    }

    /**
     * Renders the given ink object using the given brush and ink style. (ID2D1DeviceContext2.DrawInk)
     * @param {ID2D1Ink} _ink Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/nn-d2d1_3-id2d1ink">ID2D1Ink</a>*</b>
     * 
     * The ink object to be rendered.
     * @param {ID2D1Brush} brush Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nn-d2d1-id2d1brush">ID2D1Brush</a>*</b>
     * 
     * The brush with which to render the ink object.
     * @param {ID2D1InkStyle} inkStyle Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/nn-d2d1_3-id2d1inkstyle">ID2D1InkStyle</a>*</b>
     * 
     * The ink style to use when rendering the ink object.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1devicecontext2-drawink
     */
    DrawInk(_ink, brush, inkStyle) {
        ComCall(102, this, "ptr", _ink, "ptr", brush, "ptr", inkStyle)
    }

    /**
     * Renders a given gradient mesh to the target. (ID2D1DeviceContext2.DrawGradientMesh)
     * @param {ID2D1GradientMesh} gradientMesh Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/nn-d2d1_3-id2d1gradientmesh">ID2D1GradientMesh</a>*</b>
     * 
     * The gradient mesh to be rendered.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1devicecontext2-drawgradientmesh
     */
    DrawGradientMesh(gradientMesh) {
        ComCall(103, this, "ptr", gradientMesh)
    }

    /**
     * Draws a metafile to the device context using the given source and destination rectangles. (overload 1/3)
     * @param {ID2D1GdiMetafile} gdiMetafile Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1gdimetafile">ID2D1GdiMetafile</a>*</b>
     * 
     * The metafile to draw.
     * @param {Pointer<D2D_RECT_F>} destinationRectangle Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-rect-f">D2D1_RECT_F</a></b>
     * 
     * The rectangle in the target where the metafile will be drawn, relative to the upper left corner (defined in DIPs) of the render target. 
     *      If NULL is specified, the destination rectangle is {0, 0, w, h}, where w and h are the width and height of the metafile as reported by 
     *      <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nf-d2d1_1-id2d1gdimetafile-getbounds">ID2D1GdiMetafile::GetBounds</a>.
     * @param {Pointer<D2D_RECT_F>} sourceRectangle Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-rect-f">D2D1_RECT_F</a></b>
     * 
     * The rectangle of the source metafile that will be drawn, relative to the upper left corner (defined in DIPs) of the metafile. 
     *      If NULL is specified, the source rectangle is the value returned by <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/nf-d2d1_3-id2d1gdimetafile1-getsourcebounds">ID2D1GdiMetafile1::GetSourceBounds</a>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1devicecontext2-drawgdimetafile(id2d1gdimetafile_constd2d1_rect_f__constd2d1_rect_f_)
     */
    DrawGdiMetafile(gdiMetafile, destinationRectangle, sourceRectangle) {
        ComCall(104, this, "ptr", gdiMetafile, D2D_RECT_F.Ptr, destinationRectangle, D2D_RECT_F.Ptr, sourceRectangle)
    }

    /**
     * Creates an image source which shares resources with an original.
     * @param {ID2D1ImageSource} imageSource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/nn-d2d1_3-id2d1imagesource">ID2D1ImageSource</a>*</b>
     * 
     * The original image.
     * @param {Pointer<D2D1_TRANSFORMED_IMAGE_SOURCE_PROPERTIES>} _properties Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/ns-d2d1_3-d2d1_transformed_image_source_properties">D2D1_TRANSFORMED_IMAGE_SOURCE_PROPERTIES</a>*</b>
     * 
     * Properties for the source image.
     * @returns {ID2D1TransformedImageSource} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/nn-d2d1_3-id2d1transformedimagesource">ID2D1TransformedImageSource</a>**</b>
     * 
     * Receives the new image source.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1devicecontext2-createtransformedimagesource
     */
    CreateTransformedImageSource(imageSource, _properties) {
        result := ComCall(105, this, "ptr", imageSource, D2D1_TRANSFORMED_IMAGE_SOURCE_PROPERTIES.Ptr, _properties, "ptr*", &transformedImageSource := 0, "HRESULT")
        return ID2D1TransformedImageSource(transformedImageSource)
    }

    Query(iid) {
        if (ID2D1DeviceContext2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateInk := CallbackCreate(GetMethod(implObj, "CreateInk"), flags, 3)
        this.vtbl.CreateInkStyle := CallbackCreate(GetMethod(implObj, "CreateInkStyle"), flags, 3)
        this.vtbl.CreateGradientMesh := CallbackCreate(GetMethod(implObj, "CreateGradientMesh"), flags, 4)
        this.vtbl.CreateImageSourceFromWic := CallbackCreate(GetMethod(implObj, "CreateImageSourceFromWic"), flags, 5)
        this.vtbl.CreateLookupTable3D := CallbackCreate(GetMethod(implObj, "CreateLookupTable3D"), flags, 7)
        this.vtbl.CreateImageSourceFromDxgi := CallbackCreate(GetMethod(implObj, "CreateImageSourceFromDxgi"), flags, 6)
        this.vtbl.GetGradientMeshWorldBounds := CallbackCreate(GetMethod(implObj, "GetGradientMeshWorldBounds"), flags, 3)
        this.vtbl.DrawInk := CallbackCreate(GetMethod(implObj, "DrawInk"), flags, 4)
        this.vtbl.DrawGradientMesh := CallbackCreate(GetMethod(implObj, "DrawGradientMesh"), flags, 2)
        this.vtbl.DrawGdiMetafile := CallbackCreate(GetMethod(implObj, "DrawGdiMetafile"), flags, 4)
        this.vtbl.CreateTransformedImageSource := CallbackCreate(GetMethod(implObj, "CreateTransformedImageSource"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateInk)
        CallbackFree(this.vtbl.CreateInkStyle)
        CallbackFree(this.vtbl.CreateGradientMesh)
        CallbackFree(this.vtbl.CreateImageSourceFromWic)
        CallbackFree(this.vtbl.CreateLookupTable3D)
        CallbackFree(this.vtbl.CreateImageSourceFromDxgi)
        CallbackFree(this.vtbl.GetGradientMeshWorldBounds)
        CallbackFree(this.vtbl.DrawInk)
        CallbackFree(this.vtbl.DrawGradientMesh)
        CallbackFree(this.vtbl.DrawGdiMetafile)
        CallbackFree(this.vtbl.CreateTransformedImageSource)
    }
}
