#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IVMRImageCompositor interface is implemented by the default compositor for the Video Mixing Renderer Filter 7 (VMR-7).
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-ivmrimagecompositor
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IVMRImageCompositor extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVMRImageCompositor
     * @type {Guid}
     */
    static IID => Guid("{7a4fb5af-479f-4074-bb40-ce6722e43c82}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitCompositionTarget", "TermCompositionTarget", "SetStreamMediaType", "CompositeImage"]

    /**
     * 
     * @param {IUnknown} pD3DDevice 
     * @param {IDirectDrawSurface7} pddsRenderTarget 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrimagecompositor-initcompositiontarget
     */
    InitCompositionTarget(pD3DDevice, pddsRenderTarget) {
        result := ComCall(3, this, "ptr", pD3DDevice, "ptr", pddsRenderTarget, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pD3DDevice 
     * @param {IDirectDrawSurface7} pddsRenderTarget 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrimagecompositor-termcompositiontarget
     */
    TermCompositionTarget(pD3DDevice, pddsRenderTarget) {
        result := ComCall(4, this, "ptr", pD3DDevice, "ptr", pddsRenderTarget, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwStrmID 
     * @param {Pointer<AM_MEDIA_TYPE>} pmt 
     * @param {BOOL} fTexture 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrimagecompositor-setstreammediatype
     */
    SetStreamMediaType(dwStrmID, pmt, fTexture) {
        result := ComCall(5, this, "uint", dwStrmID, "ptr", pmt, "int", fTexture, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pD3DDevice 
     * @param {IDirectDrawSurface7} pddsRenderTarget 
     * @param {Pointer<AM_MEDIA_TYPE>} pmtRenderTarget 
     * @param {Integer} rtStart 
     * @param {Integer} rtEnd 
     * @param {Integer} dwClrBkGnd 
     * @param {Pointer<VMRVIDEOSTREAMINFO>} pVideoStreamInfo 
     * @param {Integer} cStreams 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrimagecompositor-compositeimage
     */
    CompositeImage(pD3DDevice, pddsRenderTarget, pmtRenderTarget, rtStart, rtEnd, dwClrBkGnd, pVideoStreamInfo, cStreams) {
        result := ComCall(6, this, "ptr", pD3DDevice, "ptr", pddsRenderTarget, "ptr", pmtRenderTarget, "int64", rtStart, "int64", rtEnd, "uint", dwClrBkGnd, "ptr", pVideoStreamInfo, "uint", cStreams, "HRESULT")
        return result
    }
}
