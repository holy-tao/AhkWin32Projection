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
     * 
     * @param {Pointer<IUnknown>} pD3DDevice 
     * @param {Pointer<IDirectDrawSurface7>} pddsRenderTarget 
     * @returns {HRESULT} 
     */
    InitCompositionTarget(pD3DDevice, pddsRenderTarget) {
        result := ComCall(3, this, "ptr", pD3DDevice, "ptr", pddsRenderTarget, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pD3DDevice 
     * @param {Pointer<IDirectDrawSurface7>} pddsRenderTarget 
     * @returns {HRESULT} 
     */
    TermCompositionTarget(pD3DDevice, pddsRenderTarget) {
        result := ComCall(4, this, "ptr", pD3DDevice, "ptr", pddsRenderTarget, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwStrmID 
     * @param {Pointer<AM_MEDIA_TYPE>} pmt 
     * @param {BOOL} fTexture 
     * @returns {HRESULT} 
     */
    SetStreamMediaType(dwStrmID, pmt, fTexture) {
        result := ComCall(5, this, "uint", dwStrmID, "ptr", pmt, "int", fTexture, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pD3DDevice 
     * @param {Pointer<IDirectDrawSurface7>} pddsRenderTarget 
     * @param {Pointer<AM_MEDIA_TYPE>} pmtRenderTarget 
     * @param {Integer} rtStart 
     * @param {Integer} rtEnd 
     * @param {Integer} dwClrBkGnd 
     * @param {Pointer<VMRVIDEOSTREAMINFO>} pVideoStreamInfo 
     * @param {Integer} cStreams 
     * @returns {HRESULT} 
     */
    CompositeImage(pD3DDevice, pddsRenderTarget, pmtRenderTarget, rtStart, rtEnd, dwClrBkGnd, pVideoStreamInfo, cStreams) {
        result := ComCall(6, this, "ptr", pD3DDevice, "ptr", pddsRenderTarget, "ptr", pmtRenderTarget, "int64", rtStart, "int64", rtEnd, "uint", dwClrBkGnd, "ptr", pVideoStreamInfo, "uint", cStreams, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
