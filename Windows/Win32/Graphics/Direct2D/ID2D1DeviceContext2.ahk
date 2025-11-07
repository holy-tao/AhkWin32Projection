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
     * 
     * @param {Pointer<D2D1_GRADIENT_MESH_PATCH>} patches 
     * @param {Integer} patchesCount 
     * @returns {ID2D1GradientMesh} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1devicecontext2-creategradientmesh
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
     * 
     * @param {Integer} precision 
     * @param {Pointer<Integer>} extents 
     * @param {Pointer<Integer>} data 
     * @param {Integer} dataCount 
     * @param {Pointer<Integer>} strides 
     * @returns {ID2D1LookupTable3D} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1devicecontext2-createlookuptable3d
     */
    CreateLookupTable3D(precision, extents, data, dataCount, strides) {
        extentsMarshal := extents is VarRef ? "uint*" : "ptr"
        dataMarshal := data is VarRef ? "char*" : "ptr"
        stridesMarshal := strides is VarRef ? "uint*" : "ptr"

        result := ComCall(99, this, "int", precision, extentsMarshal, extents, dataMarshal, data, "uint", dataCount, stridesMarshal, strides, "ptr*", &lookupTable := 0, "HRESULT")
        return ID2D1LookupTable3D(lookupTable)
    }

    /**
     * 
     * @param {Pointer<IDXGISurface>} surfaces 
     * @param {Integer} surfaceCount 
     * @param {Integer} colorSpace 
     * @param {Integer} options 
     * @returns {ID2D1ImageSource} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1devicecontext2-createimagesourcefromdxgi
     */
    CreateImageSourceFromDxgi(surfaces, surfaceCount, colorSpace, options) {
        result := ComCall(100, this, "ptr*", surfaces, "uint", surfaceCount, "int", colorSpace, "int", options, "ptr*", &imageSource := 0, "HRESULT")
        return ID2D1ImageSource(imageSource)
    }

    /**
     * 
     * @param {ID2D1GradientMesh} gradientMesh 
     * @returns {D2D_RECT_F} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1devicecontext2-getgradientmeshworldbounds
     */
    GetGradientMeshWorldBounds(gradientMesh) {
        pBounds := D2D_RECT_F()
        result := ComCall(101, this, "ptr", gradientMesh, "ptr", pBounds, "HRESULT")
        return pBounds
    }

    /**
     * 
     * @param {ID2D1Ink} ink 
     * @param {ID2D1Brush} brush 
     * @param {ID2D1InkStyle} inkStyle 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1devicecontext2-drawink
     */
    DrawInk(ink, brush, inkStyle) {
        ComCall(102, this, "ptr", ink, "ptr", brush, "ptr", inkStyle)
    }

    /**
     * 
     * @param {ID2D1GradientMesh} gradientMesh 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1devicecontext2-drawgradientmesh
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
     * 
     * @param {ID2D1ImageSource} imageSource 
     * @param {Pointer<D2D1_TRANSFORMED_IMAGE_SOURCE_PROPERTIES>} properties 
     * @returns {ID2D1TransformedImageSource} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1devicecontext2-createtransformedimagesource
     */
    CreateTransformedImageSource(imageSource, properties) {
        result := ComCall(105, this, "ptr", imageSource, "ptr", properties, "ptr*", &transformedImageSource := 0, "HRESULT")
        return ID2D1TransformedImageSource(transformedImageSource)
    }
}
