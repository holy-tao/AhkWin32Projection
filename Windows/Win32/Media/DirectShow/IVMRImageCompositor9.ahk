#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IVMRImageCompositor9 interface is implemented by the default compositor for the Video Mixing Renderer Filter 9 (VMR-9).
 * @remarks
 * 
  * Include DShow.h and D3d9.h before Vmr9.h.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//vmr9/nn-vmr9-ivmrimagecompositor9
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IVMRImageCompositor9 extends IUnknown{
    /**
     * The interface identifier for IVMRImageCompositor9
     * @type {Guid}
     */
    static IID => Guid("{4a5c89eb-df51-4654-ac2a-e48e02bbabf6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IUnknown>} pD3DDevice 
     * @returns {HRESULT} 
     */
    InitCompositionDevice(pD3DDevice) {
        result := ComCall(3, this, "ptr", pD3DDevice, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pD3DDevice 
     * @returns {HRESULT} 
     */
    TermCompositionDevice(pD3DDevice) {
        result := ComCall(4, this, "ptr", pD3DDevice, "int")
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
     * @param {Pointer<IDirect3DSurface9>} pddsRenderTarget 
     * @param {Pointer<AM_MEDIA_TYPE>} pmtRenderTarget 
     * @param {Integer} rtStart 
     * @param {Integer} rtEnd 
     * @param {Integer} dwClrBkGnd 
     * @param {Pointer<VMR9VideoStreamInfo>} pVideoStreamInfo 
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
