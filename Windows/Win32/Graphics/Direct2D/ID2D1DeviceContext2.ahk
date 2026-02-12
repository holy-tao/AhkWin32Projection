#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1Ink.ahk
#Include .\ID2D1InkStyle.ahk
#Include .\ID2D1GradientMesh.ahk
#Include .\ID2D1ImageSourceFromWic.ahk
#Include .\ID2D1LookupTable3D.ahk
#Include .\ID2D1ImageSource.ahk
#Include Common\D2D_RECT_F.ahk
#Include .\ID2D1TransformedImageSource.ahk
#Include .\ID2D1DeviceContext1.ahk

/**
 * This interface performs all the same functions as the ID2D1DeviceContext1 interface, plus it enables functionality such as ink rendering, gradient mesh rendering, and improved image loading.
 * @see https://learn.microsoft.com/windows/win32/api//content/d2d1_3/nn-d2d1_3-id2d1devicecontext2
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1DeviceContext2 extends ID2D1DeviceContext1{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1DeviceContext2
     * @type {Guid}
     */
    static IID => Guid("{394ea6a3-0c34-4321-950b-6ca20f0be6c7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 95

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateInk", "CreateInkStyle", "CreateGradientMesh", "CreateImageSourceFromWic", "CreateLookupTable3D", "CreateImageSourceFromDxgi", "GetGradientMeshWorldBounds", "DrawInk", "DrawGradientMesh", "DrawGdiMetafile", "CreateTransformedImageSource"]

    /**
     * Creates a new ID2D1Ink object that starts at the given point.
     * @param {Pointer<D2D1_INK_POINT>} startPoint 
     * @returns {Pointer<ID2D1Ink>} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/Direct2D/id2d1devicecontext2-createink-overload
     */
    CreateInk(startPoint) {
        result := ComCall(95, this, "ptr", startPoint, "ptr*", &ink_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ink_
    }

    /**
     * Creates a new ID2D1InkStyle object, for use with ink rendering methods such as DrawInk.
     * @param {Pointer<D2D1_INK_STYLE_PROPERTIES>} inkStyleProperties 
     * @returns {Pointer<ID2D1InkStyle>} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/Direct2D/id2d1devicecontext2-createinkstyle-overload
     */
    CreateInkStyle(inkStyleProperties) {
        result := ComCall(96, this, "ptr", inkStyleProperties, "ptr*", &inkStyle := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return inkStyle
    }

    /**
     * Creates a new ID2D1GradientMesh instance using the given array of patches.
     * @param {Pointer<D2D1_GRADIENT_MESH_PATCH>} patches Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/ns-d2d1_3-d2d1_gradient_mesh_patch">D2D1_GRADIENT_MESH_PATCH</a>*</b>
     * 
     * A pointer to the array containing the patches to be used in this mesh.
     * @param {Integer} patchesCount Type: <b>UINT32</b>
     * 
     * The number of patches in the patches argument to read.
     * @returns {Pointer<ID2D1GradientMesh>} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/nn-d2d1_3-id2d1gradientmesh">ID2D1GradientMesh</a>**</b>
     * 
     * When this method returns, contains the address of a pointer to the new gradient mesh.
     * @see https://learn.microsoft.com/windows/win32/api//content/d2d1_3/nf-d2d1_3-id2d1devicecontext2-creategradientmesh
     */
    CreateGradientMesh(patches, patchesCount) {
        result := ComCall(97, this, "ptr", patches, "uint", patchesCount, "ptr*", &gradientMesh := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return gradientMesh
    }

    /**
     * Creates an image source object from a WIC bitmap source, while populating all pixel memory within the image source. The image is loaded and stored while using a minimal amount of memory.
     * @param {IWICBitmapSource} wicBitmapSource 
     * @param {Integer} loadingOptions 
     * @param {Integer} alphaMode 
     * @returns {Pointer<ID2D1ImageSourceFromWic>} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/Direct2D/id2d1devicecontext2-createimagesourcefromwic-overload
     */
    CreateImageSourceFromWic(wicBitmapSource, loadingOptions, alphaMode) {
        result := ComCall(98, this, "ptr", wicBitmapSource, "int", loadingOptions, "int", alphaMode, "ptr*", &imageSource := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return imageSource
    }

    /**
     * Creates a 3D lookup table for mapping a 3-channel input to a 3-channel output. The table data must be provided in 4-channel format. (ID2D1DeviceContext2.CreateLookupTable3D)
     * @param {Integer} precision Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_buffer_precision">D2D1_BUFFER_PRECISION</a></b>
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
     * @returns {Pointer<ID2D1LookupTable3D>} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/nn-d2d1_3-id2d1lookuptable3d">ID2D1LookupTable3D</a>**</b>
     * 
     * Receives the new lookup table instance.
     * @see https://learn.microsoft.com/windows/win32/api//content/d2d1_3/nf-d2d1_3-id2d1devicecontext2-createlookuptable3d
     */
    CreateLookupTable3D(precision, extents, data, dataCount, strides) {
        extentsMarshal := extents is VarRef ? "uint*" : "ptr"
        dataMarshal := data is VarRef ? "char*" : "ptr"
        stridesMarshal := strides is VarRef ? "uint*" : "ptr"

        result := ComCall(99, this, "int", precision, extentsMarshal, extents, dataMarshal, data, "uint", dataCount, stridesMarshal, strides, "ptr*", &lookupTable := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return lookupTable
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
     * @param {Integer} colorSpace Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgicommon/ne-dxgicommon-dxgi_color_space_type">DXGI_COLOR_SPACE_TYPE</a></b>
     * 
     * The color space of the input.
     * @param {Integer} options Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/ne-d2d1_3-d2d1_image_source_from_dxgi_options">D2D1_IMAGE_SOURCE_FROM_DXGI_OPTIONS</a></b>
     * 
     * Options controlling color space conversions.
     * @returns {Pointer<ID2D1ImageSource>} Type: [out] <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/nn-d2d1_3-id2d1imagesource">ID2D1ImageSource</a>**</b>
     * 
     * Receives the new image source instance.
     * @see https://learn.microsoft.com/windows/win32/api//content/d2d1_3/nf-d2d1_3-id2d1devicecontext2-createimagesourcefromdxgi
     */
    CreateImageSourceFromDxgi(surfaces, surfaceCount, colorSpace, options) {
        result := ComCall(100, this, "ptr*", surfaces, "uint", surfaceCount, "int", colorSpace, "int", options, "ptr*", &imageSource := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return imageSource
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
     * @see https://learn.microsoft.com/windows/win32/api//content/d2d1_3/nf-d2d1_3-id2d1devicecontext2-getgradientmeshworldbounds
     */
    GetGradientMeshWorldBounds(gradientMesh) {
        pBounds := D2D_RECT_F()
        result := ComCall(101, this, "ptr", gradientMesh, "ptr", pBounds, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pBounds
    }

    /**
     * Renders the given ink object using the given brush and ink style. (ID2D1DeviceContext2.DrawInk)
     * @param {ID2D1Ink} ink_ Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/nn-d2d1_3-id2d1ink">ID2D1Ink</a>*</b>
     * 
     * The ink object to be rendered.
     * @param {ID2D1Brush} brush Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nn-d2d1-id2d1brush">ID2D1Brush</a>*</b>
     * 
     * The brush with which to render the ink object.
     * @param {ID2D1InkStyle} inkStyle Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/nn-d2d1_3-id2d1inkstyle">ID2D1InkStyle</a>*</b>
     * 
     * The ink style to use when rendering the ink object.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api//content/d2d1_3/nf-d2d1_3-id2d1devicecontext2-drawink
     */
    DrawInk(ink_, brush, inkStyle) {
        ComCall(102, this, "ptr", ink_, "ptr", brush, "ptr", inkStyle)
    }

    /**
     * Renders a given gradient mesh to the target. (ID2D1DeviceContext2.DrawGradientMesh)
     * @param {ID2D1GradientMesh} gradientMesh Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/nn-d2d1_3-id2d1gradientmesh">ID2D1GradientMesh</a>*</b>
     * 
     * The gradient mesh to be rendered.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api//content/d2d1_3/nf-d2d1_3-id2d1devicecontext2-drawgradientmesh
     */
    DrawGradientMesh(gradientMesh) {
        ComCall(103, this, "ptr", gradientMesh)
    }

    /**
     * Draw a metafile to the device context. | ID2D1DeviceContext2 DrawGdiMetafile methods
     * @param {ID2D1GdiMetafile} gdiMetafile 
     * @param {Pointer<D2D_RECT_F>} destinationRectangle 
     * @param {Pointer<D2D_RECT_F>} sourceRectangle 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/Direct2D/id2d1devicecontext2-drawgdimetafile-overload
     */
    DrawGdiMetafile(gdiMetafile, destinationRectangle, sourceRectangle) {
        ComCall(104, this, "ptr", gdiMetafile, "ptr", destinationRectangle, "ptr", sourceRectangle)
    }

    /**
     * Creates an image source which shares resources with an original.
     * @param {ID2D1ImageSource} imageSource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/nn-d2d1_3-id2d1imagesource">ID2D1ImageSource</a>*</b>
     * 
     * The original image.
     * @param {Pointer<D2D1_TRANSFORMED_IMAGE_SOURCE_PROPERTIES>} properties_ Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/ns-d2d1_3-d2d1_transformed_image_source_properties">D2D1_TRANSFORMED_IMAGE_SOURCE_PROPERTIES</a>*</b>
     * 
     * Properties for the source image.
     * @returns {Pointer<ID2D1TransformedImageSource>} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/nn-d2d1_3-id2d1transformedimagesource">ID2D1TransformedImageSource</a>**</b>
     * 
     * Receives the new image source.
     * @see https://learn.microsoft.com/windows/win32/api//content/d2d1_3/nf-d2d1_3-id2d1devicecontext2-createtransformedimagesource
     */
    CreateTransformedImageSource(imageSource, properties_) {
        result := ComCall(105, this, "ptr", imageSource, "ptr", properties_, "ptr*", &transformedImageSource := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return transformedImageSource
    }
}
