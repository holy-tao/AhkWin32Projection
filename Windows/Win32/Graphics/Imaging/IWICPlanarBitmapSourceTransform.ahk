#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to planar Y’CbCr pixel formats where pixel components are stored in separate component planes.
 * @see https://docs.microsoft.com/windows/win32/api//wincodec/nn-wincodec-iwicplanarbitmapsourcetransform
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class IWICPlanarBitmapSourceTransform extends IUnknown{
    /**
     * The interface identifier for IWICPlanarBitmapSourceTransform
     * @type {Guid}
     */
    static IID => Guid("{3aff9cce-be95-4303-b927-e7d16ff4a613}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UInt32>} puiWidth 
     * @param {Pointer<UInt32>} puiHeight 
     * @param {Integer} dstTransform 
     * @param {Integer} dstPlanarOptions 
     * @param {Pointer<Guid>} pguidDstFormats 
     * @param {Pointer<WICBitmapPlaneDescription>} pPlaneDescriptions 
     * @param {Integer} cPlanes 
     * @param {Pointer<BOOL>} pfIsSupported 
     * @returns {HRESULT} 
     */
    DoesSupportTransform(puiWidth, puiHeight, dstTransform, dstPlanarOptions, pguidDstFormats, pPlaneDescriptions, cPlanes, pfIsSupported) {
        result := ComCall(3, this, "uint*", puiWidth, "uint*", puiHeight, "int", dstTransform, "int", dstPlanarOptions, "ptr", pguidDstFormats, "ptr", pPlaneDescriptions, "uint", cPlanes, "ptr", pfIsSupported, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<WICRect>} prcSource 
     * @param {Integer} uiWidth 
     * @param {Integer} uiHeight 
     * @param {Integer} dstTransform 
     * @param {Integer} dstPlanarOptions 
     * @param {Pointer<WICBitmapPlane>} pDstPlanes 
     * @param {Integer} cPlanes 
     * @returns {HRESULT} 
     */
    CopyPixels(prcSource, uiWidth, uiHeight, dstTransform, dstPlanarOptions, pDstPlanes, cPlanes) {
        result := ComCall(4, this, "ptr", prcSource, "uint", uiWidth, "uint", uiHeight, "int", dstTransform, "int", dstPlanarOptions, "ptr", pDstPlanes, "uint", cPlanes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
