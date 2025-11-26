#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDirectXVideoDecoderService.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a DirectX Video Acceleration (DXVA) video decoder device.
 * @remarks
 * 
 * The <b>IDirectXVideoDecoder</b> methods make calls to the Direct3D device. Therefore, the <b>D3DCREATE</b> flags that you specify  when creating the device can affect the behavior of this interface. For example, if you specify the <b>D3DCREATE_MULTITHREADED</b> flag, the Direct3D global critical section will be held during decode operations.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dxva2api/nn-dxva2api-idirectxvideodecoder
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IDirectXVideoDecoder extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirectXVideoDecoder
     * @type {Guid}
     */
    static IID => Guid("{f2b0810a-fd00-43c9-918c-df94e2d8ef7d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetVideoDecoderService", "GetCreationParameters", "GetBuffer", "ReleaseBuffer", "BeginFrame", "EndFrame", "Execute"]

    /**
     * Retrieves the DirectX Video Acceleration (DXVA) decoder service that created this decoder device.
     * @returns {IDirectXVideoDecoderService} Receives a pointer to <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nn-dxva2api-idirectxvideodecoderservice">IDirectXVideoDecoderService</a> interface. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//dxva2api/nf-dxva2api-idirectxvideodecoder-getvideodecoderservice
     */
    GetVideoDecoderService() {
        result := ComCall(3, this, "ptr*", &ppService := 0, "HRESULT")
        return IDirectXVideoDecoderService(ppService)
    }

    /**
     * Retrieves the parameters that were used to create this device.
     * @param {Pointer<Guid>} pDeviceGuid Receives the device GUID. This parameter can be <b>NULL</b>.
     * @param {Pointer<DXVA2_VideoDesc>} pVideoDesc Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_videodesc">DXVA2_VideoDesc</a> structure that receives a description of the video format. This parameter can be <b>NULL</b>.
     * @param {Pointer<DXVA2_ConfigPictureDecode>} pConfig Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_configpicturedecode">DXVA2_ConfigPictureDecode</a> structure structure that receives the decoder configuration. This parameter can be <b>NULL</b>.
     * @param {Pointer<Pointer<IDirect3DSurface9>>} pDecoderRenderTargets Receives an array of <b>IDirect3DSurface9</b> interface pointers. These pointers represent the decoder render targets. The method allocates the memory for the array and calls <b>AddRef</b> on each of the pointers. The caller must release the pointers and call <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> to free the memory for the array. This parameter can be <b>NULL</b>.
     * @param {Pointer<Integer>} pNumSurfaces Receives the number of elements in the <i>pppDecoderRenderTargets</i> array. This parameter can be <b>NULL</b>.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument. At least one parameter must be non-<b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dxva2api/nf-dxva2api-idirectxvideodecoder-getcreationparameters
     */
    GetCreationParameters(pDeviceGuid, pVideoDesc, pConfig, pDecoderRenderTargets, pNumSurfaces) {
        pDecoderRenderTargetsMarshal := pDecoderRenderTargets is VarRef ? "ptr*" : "ptr"
        pNumSurfacesMarshal := pNumSurfaces is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr", pDeviceGuid, "ptr", pVideoDesc, "ptr", pConfig, pDecoderRenderTargetsMarshal, pDecoderRenderTargets, pNumSurfacesMarshal, pNumSurfaces, "HRESULT")
        return result
    }

    /**
     * Retrieves a pointer to a DirectX Video Acceleration (DXVA) decoder buffer.
     * @param {Integer} BufferType 
     * @param {Pointer<Pointer<Void>>} ppBuffer Receives a pointer to the start of the memory buffer.
     * @param {Pointer<Integer>} pBufferSize Receives the size of the buffer, in bytes.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * @see https://docs.microsoft.com/windows/win32/api//dxva2api/nf-dxva2api-idirectxvideodecoder-getbuffer
     */
    GetBuffer(BufferType, ppBuffer, pBufferSize) {
        ppBufferMarshal := ppBuffer is VarRef ? "ptr*" : "ptr"
        pBufferSizeMarshal := pBufferSize is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "uint", BufferType, ppBufferMarshal, ppBuffer, pBufferSizeMarshal, pBufferSize, "HRESULT")
        return result
    }

    /**
     * Releases a buffer that was obtained by calling IDirectXVideoDecoder::GetBuffer.
     * @param {Integer} BufferType The type of buffer to release. Specify the same value that was used in the <i>BufferType</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nf-dxva2api-idirectxvideodecoder-getbuffer">GetBuffer</a> method.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * @see https://docs.microsoft.com/windows/win32/api//dxva2api/nf-dxva2api-idirectxvideodecoder-releasebuffer
     */
    ReleaseBuffer(BufferType) {
        result := ComCall(6, this, "uint", BufferType, "HRESULT")
        return result
    }

    /**
     * Starts the decoding operation.
     * @param {IDirect3DSurface9} pRenderTarget Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dsurface9">IDirect3DSurface9</a> interface of the render target where the decoded frame will be written.
     * @param {Pointer<Void>} pvPVPData Reserved; set to <b>NULL</b>.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid surface type. See Remarks.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dxva2api/nf-dxva2api-idirectxvideodecoder-beginframe
     */
    BeginFrame(pRenderTarget, pvPVPData) {
        pvPVPDataMarshal := pvPVPData is VarRef ? "ptr" : "ptr"

        result := ComCall(7, this, "ptr", pRenderTarget, pvPVPDataMarshal, pvPVPData, "HRESULT")
        return result
    }

    /**
     * Signals the end of the decoding operation.
     * @param {Pointer<HANDLE>} pHandleComplete Reserved.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * @see https://docs.microsoft.com/windows/win32/api//dxva2api/nf-dxva2api-idirectxvideodecoder-endframe
     */
    EndFrame(pHandleComplete) {
        result := ComCall(8, this, "ptr", pHandleComplete, "HRESULT")
        return result
    }

    /**
     * Executes a decoding operation on the current frame.
     * @param {Pointer<DXVA2_DecodeExecuteParams>} pExecuteParams Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_decodeexecuteparams">DXVA2_DecodeExecuteParams</a> structure that contains the information needed for the decoding operation.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * @see https://docs.microsoft.com/windows/win32/api//dxva2api/nf-dxva2api-idirectxvideodecoder-execute
     */
    Execute(pExecuteParams) {
        result := ComCall(9, this, "ptr", pExecuteParams, "HRESULT")
        return result
    }
}
