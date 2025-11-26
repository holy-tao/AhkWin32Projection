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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitCompositionDevice", "TermCompositionDevice", "SetStreamMediaType", "CompositeImage"]

    /**
     * The InitCompositionDevice method informs the compositor that a new composition target has been created.
     * @param {IUnknown} pD3DDevice Pointer to the <b>IUnknown</b> interface of the Direct3D device object.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vmr9/nf-vmr9-ivmrimagecompositor9-initcompositiondevice
     */
    InitCompositionDevice(pD3DDevice) {
        result := ComCall(3, this, "ptr", pD3DDevice, "HRESULT")
        return result
    }

    /**
     * The TermCompositionDevice method informs the compositor that the current composition target is being replaced. Compositors should perform any necessary cleanup of the composition target in this method.
     * @param {IUnknown} pD3DDevice Pointer to the <b>IUnknown</b> interface of the Direct3D device object.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vmr9/nf-vmr9-ivmrimagecompositor9-termcompositiondevice
     */
    TermCompositionDevice(pD3DDevice) {
        result := ComCall(4, this, "ptr", pD3DDevice, "HRESULT")
        return result
    }

    /**
     * The SetStreamMediaType method sets the media type for the input stream.
     * @param {Integer} dwStrmID Specifies the input stream; must be from 1 through 16.
     * @param {Pointer<AM_MEDIA_TYPE>} pmt Pointer to the AM_MEDIA_TYPE struct that specifies the media type.
     * @param {BOOL} fTexture If <b>TRUE</b>, specifies that the target surface is a Direct3D texture surface.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vmr9/nf-vmr9-ivmrimagecompositor9-setstreammediatype
     */
    SetStreamMediaType(dwStrmID, pmt, fTexture) {
        result := ComCall(5, this, "uint", dwStrmID, "ptr", pmt, "int", fTexture, "HRESULT")
        return result
    }

    /**
     * The CompositeImage method composites the current frames available in each input stream.
     * @param {IUnknown} pD3DDevice Pointer to the <b>IUnknown</b> interface of the Direct3D device object.
     * @param {IDirect3DSurface9} pddsRenderTarget Specifies the Direct3D surface that all drawing should be performed on.
     * @param {Pointer<AM_MEDIA_TYPE>} pmtRenderTarget Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-am_media_type">AM_MEDIA_TYPE</a> structure that contains the media type of the target surface.
     * @param {Integer} rtStart Specifies the start time.
     * @param {Integer} rtEnd Specifies the end time.
     * @param {Integer} dwClrBkGnd Specifies the background color, as a <b>D3DCOLOR</b> type.
     * @param {Pointer<VMR9VideoStreamInfo>} pVideoStreamInfo Pointer to an array of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/vmr9/ns-vmr9-vmr9videostreaminfo">VMR9VideoStreamInfo</a> structures, which descibe each video stream.
     * @param {Integer} cStreams Specifies the number of streams to mix, which is also the size of the <i>pVideoStreamInfo</i> array.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vmr9/nf-vmr9-ivmrimagecompositor9-compositeimage
     */
    CompositeImage(pD3DDevice, pddsRenderTarget, pmtRenderTarget, rtStart, rtEnd, dwClrBkGnd, pVideoStreamInfo, cStreams) {
        result := ComCall(6, this, "ptr", pD3DDevice, "ptr", pddsRenderTarget, "ptr", pmtRenderTarget, "int64", rtStart, "int64", rtEnd, "uint", dwClrBkGnd, "ptr", pVideoStreamInfo, "uint", cStreams, "HRESULT")
        return result
    }
}
