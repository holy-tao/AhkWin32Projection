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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["DoesSupportTransform", "CopyPixels"]

    /**
     * 
     * @param {Pointer<Integer>} puiWidth 
     * @param {Pointer<Integer>} puiHeight 
     * @param {Integer} dstTransform 
     * @param {Integer} dstPlanarOptions 
     * @param {Pointer<Guid>} pguidDstFormats 
     * @param {Pointer<WICBitmapPlaneDescription>} pPlaneDescriptions 
     * @param {Integer} cPlanes 
     * @param {Pointer<BOOL>} pfIsSupported 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicplanarbitmapsourcetransform-doessupporttransform
     */
    DoesSupportTransform(puiWidth, puiHeight, dstTransform, dstPlanarOptions, pguidDstFormats, pPlaneDescriptions, cPlanes, pfIsSupported) {
        puiWidthMarshal := puiWidth is VarRef ? "uint*" : "ptr"
        puiHeightMarshal := puiHeight is VarRef ? "uint*" : "ptr"
        pfIsSupportedMarshal := pfIsSupported is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, puiWidthMarshal, puiWidth, puiHeightMarshal, puiHeight, "int", dstTransform, "int", dstPlanarOptions, "ptr", pguidDstFormats, "ptr", pPlaneDescriptions, "uint", cPlanes, pfIsSupportedMarshal, pfIsSupported, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicplanarbitmapsourcetransform-copypixels
     */
    CopyPixels(prcSource, uiWidth, uiHeight, dstTransform, dstPlanarOptions, pDstPlanes, cPlanes) {
        result := ComCall(4, this, "ptr", prcSource, "uint", uiWidth, "uint", uiHeight, "int", dstTransform, "int", dstPlanarOptions, "ptr", pDstPlanes, "uint", cPlanes, "HRESULT")
        return result
    }
}
