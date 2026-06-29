#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Graphics\Direct3D9\IDirect3DSurface9.ahk" { IDirect3DSurface9 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DXVA2_VideoDesc.ahk" { DXVA2_VideoDesc }
#Import ".\IDirectXVideoDecoderService.ahk" { IDirectXVideoDecoderService }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\DXVA2_ConfigPictureDecode.ahk" { DXVA2_ConfigPictureDecode }
#Import ".\DXVA2_DecodeExecuteParams.ahk" { DXVA2_DecodeExecuteParams }

/**
 * Represents a DirectX Video Acceleration (DXVA) video decoder device.
 * @remarks
 * The <b>IDirectXVideoDecoder</b> methods make calls to the Direct3D device. Therefore, the <b>D3DCREATE</b> flags that you specify  when creating the device can affect the behavior of this interface. For example, if you specify the <b>D3DCREATE_MULTITHREADED</b> flag, the Direct3D global critical section will be held during decode operations.
 * @see https://learn.microsoft.com/windows/win32/api/dxva2api/nn-dxva2api-idirectxvideodecoder
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IDirectXVideoDecoder extends IUnknown {
    /**
     * The interface identifier for IDirectXVideoDecoder
     * @type {Guid}
     */
    static IID := Guid("{f2b0810a-fd00-43c9-918c-df94e2d8ef7d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDirectXVideoDecoder interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetVideoDecoderService : IntPtr
        GetCreationParameters  : IntPtr
        GetBuffer              : IntPtr
        ReleaseBuffer          : IntPtr
        BeginFrame             : IntPtr
        EndFrame               : IntPtr
        Execute                : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDirectXVideoDecoder.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the DirectX Video Acceleration (DXVA) decoder service that created this decoder device.
     * @returns {IDirectXVideoDecoderService} Receives a pointer to <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nn-dxva2api-idirectxvideodecoderservice">IDirectXVideoDecoderService</a> interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/dxva2api/nf-dxva2api-idirectxvideodecoder-getvideodecoderservice
     */
    GetVideoDecoderService() {
        result := ComCall(3, this, "ptr*", &ppService := 0, "HRESULT")
        return IDirectXVideoDecoderService(ppService)
    }

    /**
     * Retrieves the parameters that were used to create this device. (IDirectXVideoDecoder.GetCreationParameters)
     * @remarks
     * You can set any parameter to <b>NULL</b> if you are not interested in the result. At least one parameter must be non-<b>NULL</b>.
     * 
     * If you specify a non-<b>NULL</b> value for <i>pppDecoderRenderTargets</i> (to receive the render target surfaces), then <i>pNumSurfaces</i> cannot be <b>NULL</b>, because it receives the size of the array returned in <i>pppDecoderRenderTargets</i>.
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
     * @see https://learn.microsoft.com/windows/win32/api/dxva2api/nf-dxva2api-idirectxvideodecoder-getcreationparameters
     */
    GetCreationParameters(pDeviceGuid, pVideoDesc, pConfig, pDecoderRenderTargets, pNumSurfaces) {
        pDecoderRenderTargetsMarshal := pDecoderRenderTargets is VarRef ? "ptr*" : "ptr"
        pNumSurfacesMarshal := pNumSurfaces is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, Guid.Ptr, pDeviceGuid, DXVA2_VideoDesc.Ptr, pVideoDesc, DXVA2_ConfigPictureDecode.Ptr, pConfig, pDecoderRenderTargetsMarshal, pDecoderRenderTargets, pNumSurfacesMarshal, pNumSurfaces, "HRESULT")
        return result
    }

    /**
     * Retrieves a pointer to a DirectX Video Acceleration (DXVA) decoder buffer.
     * @remarks
     * The method locks the Direct3D surface that contains the buffer. When you are done using the buffer, call <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nf-dxva2api-idirectxvideodecoder-releasebuffer">IDirectXVideoDecoder::ReleaseBuffer</a> to unlock the surface.
     * 
     * This method might block if too many operations have been queued on the GPU. The method unblocks when a free buffer becomes available.
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
     * @see https://learn.microsoft.com/windows/win32/api/dxva2api/nf-dxva2api-idirectxvideodecoder-getbuffer
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
     * @see https://learn.microsoft.com/windows/win32/api/dxva2api/nf-dxva2api-idirectxvideodecoder-releasebuffer
     */
    ReleaseBuffer(BufferType) {
        result := ComCall(6, this, "uint", BufferType, "HRESULT")
        return result
    }

    /**
     * Starts the decoding operation.
     * @remarks
     * After this method is called, call <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nf-dxva2api-idirectxvideodecoder-execute">IDirectXVideoDecoder::Execute</a> to perform decoding operations. When all decoding operations have been executed, call <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nf-dxva2api-idirectxvideodecoder-endframe">IDirectXVideoDecoder::EndFrame</a>.
     * 
     * Each call to <b>BeginFrame</b> must have a matching call to <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nf-dxva2api-idirectxvideodecoder-endframe">EndFrame</a>, and <b>BeginFrame</b> calls cannot be nested.
     * 
     * DXVA 1.0 migration note: Unlike the <b>IAMVideoAccelerator::BeginFrame</b> method, which specifies the buffer as an index, this method takes a pointer directly to the uncompressed buffer.
     * 
     * The surface pointed to by <i>pRenderTarget</i> must be created by calling <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nf-dxva2api-idirectxvideoaccelerationservice-createsurface">IDirectXVideoAccelerationService::CreateSurface</a> with the value DXVA2_VideoDecoderRenderTarget for <i>DxvaType</i>.
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
     * @see https://learn.microsoft.com/windows/win32/api/dxva2api/nf-dxva2api-idirectxvideodecoder-beginframe
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
     * @see https://learn.microsoft.com/windows/win32/api/dxva2api/nf-dxva2api-idirectxvideodecoder-endframe
     */
    EndFrame(pHandleComplete) {
        result := ComCall(8, this, HANDLE.Ptr, pHandleComplete, "HRESULT")
        return result
    }

    /**
     * Executes a decoding operation on the current frame.
     * @remarks
     * You must call <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nf-dxva2api-idirectxvideodecoder-beginframe">IDirectXVideoDecoder::BeginFrame</a> before calling this method.
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
     * @see https://learn.microsoft.com/windows/win32/api/dxva2api/nf-dxva2api-idirectxvideodecoder-execute
     */
    Execute(pExecuteParams) {
        result := ComCall(9, this, DXVA2_DecodeExecuteParams.Ptr, pExecuteParams, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDirectXVideoDecoder.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetVideoDecoderService := CallbackCreate(GetMethod(implObj, "GetVideoDecoderService"), flags, 2)
        this.vtbl.GetCreationParameters := CallbackCreate(GetMethod(implObj, "GetCreationParameters"), flags, 6)
        this.vtbl.GetBuffer := CallbackCreate(GetMethod(implObj, "GetBuffer"), flags, 4)
        this.vtbl.ReleaseBuffer := CallbackCreate(GetMethod(implObj, "ReleaseBuffer"), flags, 2)
        this.vtbl.BeginFrame := CallbackCreate(GetMethod(implObj, "BeginFrame"), flags, 3)
        this.vtbl.EndFrame := CallbackCreate(GetMethod(implObj, "EndFrame"), flags, 2)
        this.vtbl.Execute := CallbackCreate(GetMethod(implObj, "Execute"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetVideoDecoderService)
        CallbackFree(this.vtbl.GetCreationParameters)
        CallbackFree(this.vtbl.GetBuffer)
        CallbackFree(this.vtbl.ReleaseBuffer)
        CallbackFree(this.vtbl.BeginFrame)
        CallbackFree(this.vtbl.EndFrame)
        CallbackFree(this.vtbl.Execute)
    }
}
