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
     * The InitCompositionTarget method informs the compositor that a new composition target has been created.
     * @param {IUnknown} pD3DDevice Pointer to the <b>IUnknown</b> interface of the Direct3D device object.
     * @param {IDirectDrawSurface7} pddsRenderTarget Specifies the DirectDraw surface.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ivmrimagecompositor-initcompositiontarget
     */
    InitCompositionTarget(pD3DDevice, pddsRenderTarget) {
        result := ComCall(3, this, "ptr", pD3DDevice, "ptr", pddsRenderTarget, "HRESULT")
        return result
    }

    /**
     * The TermCompositionTarget method informs the compositor that the current composition target is being replaced. Compositors should perform any necessary cleanup of the composition target in this method.
     * @param {IUnknown} pD3DDevice Pointer to the <b>IUnknown</b> interface of the Direct3D device object.
     * @param {IDirectDrawSurface7} pddsRenderTarget Specifies the DirectDraw surface
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ivmrimagecompositor-termcompositiontarget
     */
    TermCompositionTarget(pD3DDevice, pddsRenderTarget) {
        result := ComCall(4, this, "ptr", pD3DDevice, "ptr", pddsRenderTarget, "HRESULT")
        return result
    }

    /**
     * The SetStreamMediaType method sets the media type for the input stream.
     * @param {Integer} dwStrmID Specifies the input stream. The value must be from 1 through 16.
     * @param {Pointer<AM_MEDIA_TYPE>} pmt Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-am_media_type">AM_MEDIA_TYPE</a> structure that specifies the media type.
     * @param {BOOL} fTexture If <b>TRUE</b>, specifies that the target surface is a Direct3D texture surface.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ivmrimagecompositor-setstreammediatype
     */
    SetStreamMediaType(dwStrmID, pmt, fTexture) {
        result := ComCall(5, this, "uint", dwStrmID, "ptr", pmt, "int", fTexture, "HRESULT")
        return result
    }

    /**
     * The CompositeImage method composites the current frames available in each input stream.
     * @param {IUnknown} pD3DDevice Pointer to the <b>IUnknown</b> interface of the Direct3D device. The compositor must cast this to a <b>LPDIRECT3DDEVICE7</b> type.
     * @param {IDirectDrawSurface7} pddsRenderTarget Specifies the DirectDraw surface that all drawing should be performed on.
     * @param {Pointer<AM_MEDIA_TYPE>} pmtRenderTarget Specifies the media type of the DirectDraw surface.
     * @param {Integer} rtStart Specifies the start time.
     * @param {Integer} rtEnd Specifies the end time.
     * @param {Integer} dwClrBkGnd Specifies the background color.
     * @param {Pointer<VMRVIDEOSTREAMINFO>} pVideoStreamInfo Pointer to an array of video stream info objects.
     * @param {Integer} cStreams Specifies the number of streams to be mixed, which is equal to the size of the pVideoStreamInfo array.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ivmrimagecompositor-compositeimage
     */
    CompositeImage(pD3DDevice, pddsRenderTarget, pmtRenderTarget, rtStart, rtEnd, dwClrBkGnd, pVideoStreamInfo, cStreams) {
        result := ComCall(6, this, "ptr", pD3DDevice, "ptr", pddsRenderTarget, "ptr", pmtRenderTarget, "int64", rtStart, "int64", rtEnd, "uint", dwClrBkGnd, "ptr", pVideoStreamInfo, "uint", cStreams, "HRESULT")
        return result
    }
}
