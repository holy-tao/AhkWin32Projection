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
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nn-d2d1_3-id2d1devicecontext2
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
     * 
     * @param {Pointer<D2D1_INK_POINT>} startPoint 
     * @returns {ID2D1Ink} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1devicecontext2-createink(constd2d1_ink_point__id2d1ink)
     */
    CreateInk(startPoint) {
        result := ComCall(95, this, "ptr", startPoint, "ptr*", &ink := 0, "HRESULT")
        return ID2D1Ink(ink)
    }

    /**
     * 
     * @param {Pointer<D2D1_INK_STYLE_PROPERTIES>} inkStyleProperties 
     * @returns {ID2D1InkStyle} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1devicecontext2-createinkstyle(constd2d1_ink_style_properties_id2d1inkstyle)
     */
    CreateInkStyle(inkStyleProperties) {
        result := ComCall(96, this, "ptr", inkStyleProperties, "ptr*", &inkStyle := 0, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nf-d2d1_3-id2d1devicecontext2-creategradientmesh
     */
    CreateGradientMesh(patches, patchesCount) {
        result := ComCall(97, this, "ptr", patches, "uint", patchesCount, "ptr*", &gradientMesh := 0, "HRESULT")
        return ID2D1GradientMesh(gradientMesh)
    }

    /**
     * 
     * @param {IWICBitmapSource} wicBitmapSource 
     * @param {Integer} loadingOptions 
     * @param {Integer} alphaMode 
     * @returns {ID2D1ImageSourceFromWic} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1devicecontext2-createimagesourcefromwic(iwicbitmapsource_d2d1_image_source_loading_options_id2d1imagesourcefromwic)
     */
    CreateImageSourceFromWic(wicBitmapSource, loadingOptions, alphaMode) {
        result := ComCall(98, this, "ptr", wicBitmapSource, "int", loadingOptions, "int", alphaMode, "ptr*", &imageSource := 0, "HRESULT")
        return ID2D1ImageSourceFromWic(imageSource)
    }

    /**
     * Creates a 3D lookup table for mapping a 3-channel input to a 3-channel output. The table data must be provided in 4-channel format.
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
     * @returns {ID2D1LookupTable3D} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/nn-d2d1_3-id2d1lookuptable3d">ID2D1LookupTable3D</a>**</b>
     * 
     * Receives the new lookup table instance.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nf-d2d1_3-id2d1devicecontext2-createlookuptable3d
     */
    CreateLookupTable3D(precision, extents, data, dataCount, strides) {
        extentsMarshal := extents is VarRef ? "uint*" : "ptr"
        dataMarshal := data is VarRef ? "char*" : "ptr"
        stridesMarshal := strides is VarRef ? "uint*" : "ptr"

        result := ComCall(99, this, "int", precision, extentsMarshal, extents, dataMarshal, data, "uint", dataCount, stridesMarshal, strides, "ptr*", &lookupTable := 0, "HRESULT")
        return ID2D1LookupTable3D(lookupTable)
    }

    /**
     * Creates an image source from a set of DXGI surface(s). The YCbCr surface(s) are converted to RGBA automatically during subsequent drawing.
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
     * @returns {ID2D1ImageSource} Type: [out] <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/nn-d2d1_3-id2d1imagesource">ID2D1ImageSource</a>**</b>
     * 
     * Receives the new image source instance.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nf-d2d1_3-id2d1devicecontext2-createimagesourcefromdxgi
     */
    CreateImageSourceFromDxgi(surfaces, surfaceCount, colorSpace, options) {
        result := ComCall(100, this, "ptr*", surfaces, "uint", surfaceCount, "int", colorSpace, "int", options, "ptr*", &imageSource := 0, "HRESULT")
        return ID2D1ImageSource(imageSource)
    }

    /**
     * Returns the world bounds of a given gradient mesh.
     * @param {ID2D1GradientMesh} gradientMesh Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/nn-d2d1_3-id2d1gradientmesh">ID2D1GradientMesh</a>*</b>
     * 
     * The gradient mesh whose world bounds will be calculated.
     * @returns {D2D_RECT_F} Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-rect-f">D2D1_RECT_F</a>*</b>
     * 
     * When this method returns, contains a pointer to the bounds of the gradient mesh, in device independent pixels (DIPs).
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nf-d2d1_3-id2d1devicecontext2-getgradientmeshworldbounds
     */
    GetGradientMeshWorldBounds(gradientMesh) {
        pBounds := D2D_RECT_F()
        result := ComCall(101, this, "ptr", gradientMesh, "ptr", pBounds, "HRESULT")
        return pBounds
    }

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
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nf-d2d1_3-id2d1devicecontext2-drawink
     */
    DrawInk(ink, brush, inkStyle) {
        ComCall(102, this, "ptr", ink, "ptr", brush, "ptr", inkStyle)
    }

    /**
     * Renders a given gradient mesh to the target.
     * @param {ID2D1GradientMesh} gradientMesh Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/nn-d2d1_3-id2d1gradientmesh">ID2D1GradientMesh</a>*</b>
     * 
     * The gradient mesh to be rendered.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nf-d2d1_3-id2d1devicecontext2-drawgradientmesh
     */
    DrawGradientMesh(gradientMesh) {
        ComCall(103, this, "ptr", gradientMesh)
    }

    /**
     * 
     * @param {ID2D1GdiMetafile} gdiMetafile 
     * @param {Pointer<D2D_RECT_F>} destinationRectangle 
     * @param {Pointer<D2D_RECT_F>} sourceRectangle 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1devicecontext2-drawgdimetafile(id2d1gdimetafile_constd2d1_rect_f__constd2d1_rect_f_)
     */
    DrawGdiMetafile(gdiMetafile, destinationRectangle, sourceRectangle) {
        ComCall(104, this, "ptr", gdiMetafile, "ptr", destinationRectangle, "ptr", sourceRectangle)
    }

    /**
     * Creates an image source which shares resources with an original.
     * @param {ID2D1ImageSource} imageSource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/nn-d2d1_3-id2d1imagesource">ID2D1ImageSource</a>*</b>
     * 
     * The original image.
     * @param {Pointer<D2D1_TRANSFORMED_IMAGE_SOURCE_PROPERTIES>} properties Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/ns-d2d1_3-d2d1_transformed_image_source_properties">D2D1_TRANSFORMED_IMAGE_SOURCE_PROPERTIES</a>*</b>
     * 
     * Properties for the source image.
     * @returns {ID2D1TransformedImageSource} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/nn-d2d1_3-id2d1transformedimagesource">ID2D1TransformedImageSource</a>**</b>
     * 
     * Receives the new image source.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nf-d2d1_3-id2d1devicecontext2-createtransformedimagesource
     */
    CreateTransformedImageSource(imageSource, properties) {
        result := ComCall(105, this, "ptr", imageSource, "ptr", properties, "ptr*", &transformedImageSource := 0, "HRESULT")
        return ID2D1TransformedImageSource(transformedImageSource)
    }
}
