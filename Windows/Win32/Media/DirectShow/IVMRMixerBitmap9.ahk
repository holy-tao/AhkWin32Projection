#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IVMRMixerBitmap9 interface enables an application to blend a static image from a bitmap or Direct3D surface onto the video stream, when using the Video Mixing Renderer Filter 9 (VMR-9).You can pass images to the VMR as frequently as you like, but changing the image several times per second may impact the performance and smoothness of the video being rendered. The new image will be blended with the next and all subsequent video frames rendered by the VMR.Internally, the VMR uses its mixer component to perform the blending operation. In the VMR-9, the mixer is always present by default except in &#0034;renderless&#0034; mode in which the application is performing its own rendering. The image can contain embedded per pixel alpha information; this allows the image to contain regions that are transparent. Transparent areas can also be identified by a color key value. Changes in the image are only shown on the screen while the filter graph is running.
 * @remarks
 * 
  * Include DShow.h and D3d9.h before Vmr9.h.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//vmr9/nn-vmr9-ivmrmixerbitmap9
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IVMRMixerBitmap9 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVMRMixerBitmap9
     * @type {Guid}
     */
    static IID => Guid("{ced175e5-1935-4820-81bd-ff6ad00c9108}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetAlphaBitmap", "UpdateAlphaBitmapParameters", "GetAlphaBitmapParameters"]

    /**
     * 
     * @param {Pointer<VMR9AlphaBitmap>} pBmpParms 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrmixerbitmap9-setalphabitmap
     */
    SetAlphaBitmap(pBmpParms) {
        result := ComCall(3, this, "ptr", pBmpParms, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VMR9AlphaBitmap>} pBmpParms 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrmixerbitmap9-updatealphabitmapparameters
     */
    UpdateAlphaBitmapParameters(pBmpParms) {
        result := ComCall(4, this, "ptr", pBmpParms, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VMR9AlphaBitmap>} pBmpParms 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrmixerbitmap9-getalphabitmapparameters
     */
    GetAlphaBitmapParameters(pBmpParms) {
        result := ComCall(5, this, "ptr", pBmpParms, "HRESULT")
        return result
    }
}
