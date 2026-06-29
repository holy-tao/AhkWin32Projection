#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DXVA2_VideoDesc.ahk" { DXVA2_VideoDesc }
#Import "..\..\Graphics\Direct3D9\D3DFORMAT.ahk" { D3DFORMAT }
#Import "..\..\Graphics\Direct3D9\IDirect3DSurface9.ahk" { IDirect3DSurface9 }
#Import ".\DXVA2_ConfigPictureDecode.ahk" { DXVA2_ConfigPictureDecode }
#Import ".\IDirectXVideoAccelerationService.ahk" { IDirectXVideoAccelerationService }
#Import ".\IDirectXVideoDecoder.ahk" { IDirectXVideoDecoder }

/**
 * Provides access to DirectX Video Acceleration (DXVA) decoder services.
 * @see https://learn.microsoft.com/windows/win32/api/dxva2api/nn-dxva2api-idirectxvideodecoderservice
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IDirectXVideoDecoderService extends IDirectXVideoAccelerationService {
    /**
     * The interface identifier for IDirectXVideoDecoderService
     * @type {Guid}
     */
    static IID := Guid("{fc51a551-d5e7-11d9-af55-00054e43ff02}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDirectXVideoDecoderService interfaces
    */
    struct Vtbl extends IDirectXVideoAccelerationService.Vtbl {
        GetDecoderDeviceGuids    : IntPtr
        GetDecoderRenderTargets  : IntPtr
        GetDecoderConfigurations : IntPtr
        CreateVideoDecoder       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDirectXVideoDecoderService.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves an array of GUIDs that identifies the decoder devices supported by the graphics hardware.
     * @remarks
     * The following decoder GUIDs are defined. Some of these GUIDs have alternate names, shown in parentheses.
     * 
     * <table>
     * <tr>
     * <th>GUID</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>DXVA2_ModeH264_A (DXVA2_ModeH264_MoComp_NoFGT)</td>
     * <td>H.264 motion compensation (MoComp), no film grain technology (FGT).</td>
     * </tr>
     * <tr>
     * <td>DXVA2_ModeH264_B (DXVA2_ModeH264_MoComp_FGT)</td>
     * <td>H.264 MoComp, FGT.</td>
     * </tr>
     * <tr>
     * <td>DXVA2_ModeH264_C (DXVA2_ModeH264_IDCT_NoFGT)</td>
     * <td>H.264 inverse discrete cosine transform (IDCT), no FGT.</td>
     * </tr>
     * <tr>
     * <td>DXVA2_ModeH264_D (DXVA2_ModeH264_IDCT_FGT)</td>
     * <td>H.264 IDCT, FGT.</td>
     * </tr>
     * <tr>
     * <td>DXVA2_ModeH264_E (DXVA2_ModeH264_VLD_NoFGT)</td>
     * <td>H.264 VLD, no FGT.</td>
     * </tr>
     * <tr>
     * <td>DXVA2_ModeH264_F (DXVA2_ModeH264_VLD_FGT)</td>
     * <td>H.264 variable-length decoder (VLD), FGT.</td>
     * </tr>
     * <tr>
     * <td>DXVA2_ModeHEVC_VLD_Main</td>
     * <td>H.265 / HEVC Main profile</td>
     * </tr>
     * <tr>
     * <td>DXVA2_ModeHEVC_VLD_Main10</td>
     * <td>H.265 / HEVC Main 10 profile</td>
     * </tr>
     * <tr>
     * <td>DXVA2_ModeMPEG2_IDCT</td>
     * <td>MPEG-2 IDCT.</td>
     * </tr>
     * <tr>
     * <td>DXVA2_ModeMPEG2_MoComp</td>
     * <td>MPEG-2 MoComp.</td>
     * </tr>
     * <tr>
     * <td>DXVA2_ModeMPEG2_VLD</td>
     * <td>MPEG-2 VLD.</td>
     * </tr>
     * <tr>
     * <td>DXVA2_ModeVC1_A (DXVA2_ModeVC1_PostProc)</td>
     * <td>VC-1 post processing.</td>
     * </tr>
     * <tr>
     * <td>DXVA2_ModeVC1_B (DXVA2_ModeVC1_MoComp)</td>
     * <td>VC-1 MoComp.</td>
     * </tr>
     * <tr>
     * <td>DXVA2_ModeVC1_C (DXVA2_ModeVC1_IDCT)</td>
     * <td>VC-1 IDCT.</td>
     * </tr>
     * <tr>
     * <td>DXVA2_ModeVC1_D (DXVA2_ModeVC1_VLD)</td>
     * <td>VC-1 VLD.</td>
     * </tr>
     * <tr>
     * <td>DXVA2_ModeWMV8_A (DXVA2_ModeWMV8_PostProc)</td>
     * <td>Windows Media Video 8 post processing.</td>
     * </tr>
     * <tr>
     * <td>DXVA2_ModeWMV8_B (DXVA2_ModeWMV8_MoComp)</td>
     * <td>Windows Media Video 8 MoComp.</td>
     * </tr>
     * <tr>
     * <td>DXVA2_ModeWMV9_A (DXVA2_ModeWMV9_PostProc)</td>
     * <td>Windows Media Video 9 post processing.</td>
     * </tr>
     * <tr>
     * <td>DXVA2_ModeWMV9_B (DXVA2_ModeWMV9_MoComp)</td>
     * <td>Windows Media Video 9 MoComp.</td>
     * </tr>
     * <tr>
     * <td>DXVA2_ModeWMV9_C (DXVA2_ModeWMV9_IDCT)</td>
     * <td>Windows Media Video 9 IDCT.</td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} pCount Receives the number of GUIDs.
     * @param {Pointer<Pointer<Guid>>} pGuids Receives an array of GUIDs. The size of the array is retrieved in the <i>Count</i> parameter. The method allocates the memory for the array. The caller must free the memory by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
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
     * <dt><b>D3DERR_INVALIDCALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Error from the Direct3D device.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If the Microsoft Basic Display Adapter is being used or the Direct3D 11 device type is the reference rasterizer.  These devices do not support video decoders.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/dxva2api/nf-dxva2api-idirectxvideodecoderservice-getdecoderdeviceguids
     */
    GetDecoderDeviceGuids(pCount, pGuids) {
        pCountMarshal := pCount is VarRef ? "uint*" : "ptr"
        pGuidsMarshal := pGuids is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, pCountMarshal, pCount, pGuidsMarshal, pGuids, "HRESULT")
        return result
    }

    /**
     * Retrieves the supported render targets for a specified decoder device.
     * @param {Pointer<Guid>} Guid GUID that identifies the decoder device. To get the available device GUIDs, call <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nf-dxva2api-idirectxvideodecoderservice-getdecoderdeviceguids">IDirectXVideoDecoderService::GetDecoderDeviceGuids</a>.
     * @param {Pointer<Integer>} pCount Receives the number of formats.
     * @param {Pointer<Pointer<D3DFORMAT>>} pFormats Receives an array of formats, specified as <b>D3DFORMAT</b> values. The size of the array is retrieved in the <i>pCount</i> parameter. The method allocates the memory for the array. The caller must free the memory by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/dxva2api/nf-dxva2api-idirectxvideodecoderservice-getdecoderrendertargets
     */
    GetDecoderRenderTargets(Guid, pCount, pFormats) {
        pCountMarshal := pCount is VarRef ? "uint*" : "ptr"
        pFormatsMarshal := pFormats is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, Guid.Ptr, Guid, pCountMarshal, pCount, pFormatsMarshal, pFormats, "HRESULT")
        return result
    }

    /**
     * Gets the configurations that are available for a decoder device.
     * @param {Pointer<Guid>} Guid A GUID that identifies the decoder device. To get the available device GUIDs, call <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nf-dxva2api-idirectxvideodecoderservice-getdecoderdeviceguids">IDirectXVideoDecoderService::GetDecoderDeviceGuids</a>.
     * @param {Pointer<DXVA2_VideoDesc>} pVideoDesc A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_videodesc">DXVA2_VideoDesc</a> structure that describes the video content.
     * @param {Pointer<Integer>} pCount Receives the number of configurations.
     * @param {Pointer<Pointer<DXVA2_ConfigPictureDecode>>} ppConfigs Receives an array of <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_configpicturedecode">DXVA2_ConfigPictureDecode</a> structures. The size of the array is retrieved in the <i>pCount</i> parameter. The caller must free the memory for the array by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>. This parameter can be <b>NULL</b> if you simply want the number of configurations (returned in <i>pCount</i>) but not the GUIDs.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dxva2api/nf-dxva2api-idirectxvideodecoderservice-getdecoderconfigurations
     */
    GetDecoderConfigurations(Guid, pVideoDesc, pCount, ppConfigs) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        pCountMarshal := pCount is VarRef ? "uint*" : "ptr"
        ppConfigsMarshal := ppConfigs is VarRef ? "ptr*" : "ptr"

        result := ComCall(6, this, Guid.Ptr, Guid, DXVA2_VideoDesc.Ptr, pVideoDesc, "ptr", pReserved, pCountMarshal, pCount, ppConfigsMarshal, ppConfigs, "HRESULT")
        return result
    }

    /**
     * Creates a video decoder device.
     * @param {Pointer<Guid>} Guid GUID that specifies the decoder device to create. To get the available device GUIDs, call <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nf-dxva2api-idirectxvideodecoderservice-getdecoderdeviceguids">IDirectXVideoDecoderService::GetDecoderDeviceGuids</a>.
     * @param {Pointer<DXVA2_VideoDesc>} pVideoDesc Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_videodesc">DXVA2_VideoDesc</a> structure that describes the video content.
     * @param {Pointer<DXVA2_ConfigPictureDecode>} pConfig Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_configpicturedecode">DXVA2_ConfigPictureDecode</a> structure that specifies the decoder configuration.
     * @param {Pointer<IDirect3DSurface9>} ppDecoderRenderTargets Pointer to an array of <b>IDirect3DSurface9</b> pointers containing pointers to the decoder render targets. To create these surfaces, call <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nf-dxva2api-idirectxvideoaccelerationservice-createsurface">IDirectXVideoAccelerationService::CreateSurface</a>. Specify DXVA2_VideoDecoderRenderTarget for the <i>DxvaType</i> parameter.
     * @param {Integer} NumRenderTargets Size of the <i>ppDecoderRenderTargets</i> array. This value cannot be zero.
     * @returns {IDirectXVideoDecoder} Receives a pointer to the decoder's <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nn-dxva2api-idirectxvideodecoder">IDirectXVideoDecoder</a> interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/dxva2api/nf-dxva2api-idirectxvideodecoderservice-createvideodecoder
     */
    CreateVideoDecoder(Guid, pVideoDesc, pConfig, ppDecoderRenderTargets, NumRenderTargets) {
        result := ComCall(7, this, Guid.Ptr, Guid, DXVA2_VideoDesc.Ptr, pVideoDesc, DXVA2_ConfigPictureDecode.Ptr, pConfig, IDirect3DSurface9.Ptr, ppDecoderRenderTargets, "uint", NumRenderTargets, "ptr*", &ppDecode := 0, "HRESULT")
        return IDirectXVideoDecoder(ppDecode)
    }

    Query(iid) {
        if (IDirectXVideoDecoderService.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDecoderDeviceGuids := CallbackCreate(GetMethod(implObj, "GetDecoderDeviceGuids"), flags, 3)
        this.vtbl.GetDecoderRenderTargets := CallbackCreate(GetMethod(implObj, "GetDecoderRenderTargets"), flags, 4)
        this.vtbl.GetDecoderConfigurations := CallbackCreate(GetMethod(implObj, "GetDecoderConfigurations"), flags, 6)
        this.vtbl.CreateVideoDecoder := CallbackCreate(GetMethod(implObj, "CreateVideoDecoder"), flags, 7)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDecoderDeviceGuids)
        CallbackFree(this.vtbl.GetDecoderRenderTargets)
        CallbackFree(this.vtbl.GetDecoderConfigurations)
        CallbackFree(this.vtbl.CreateVideoDecoder)
    }
}
