#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DXVA2_VideoDesc.ahk" { DXVA2_VideoDesc }
#Import ".\IDirectXVideoProcessor.ahk" { IDirectXVideoProcessor }
#Import "..\..\Graphics\Direct3D9\D3DFORMAT.ahk" { D3DFORMAT }
#Import ".\IDirectXVideoAccelerationService.ahk" { IDirectXVideoAccelerationService }
#Import ".\DXVA2_VideoProcessorCaps.ahk" { DXVA2_VideoProcessorCaps }
#Import ".\DXVA2_ValueRange.ahk" { DXVA2_ValueRange }

/**
 * Provides access to DirectX Video Acceleration (DXVA) video processing services.
 * @see https://learn.microsoft.com/windows/win32/api/dxva2api/nn-dxva2api-idirectxvideoprocessorservice
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IDirectXVideoProcessorService extends IDirectXVideoAccelerationService {
    /**
     * The interface identifier for IDirectXVideoProcessorService
     * @type {Guid}
     */
    static IID := Guid("{fc51a552-d5e7-11d9-af55-00054e43ff02}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDirectXVideoProcessorService interfaces
    */
    struct Vtbl extends IDirectXVideoAccelerationService.Vtbl {
        RegisterVideoProcessorSoftwareDevice : IntPtr
        GetVideoProcessorDeviceGuids         : IntPtr
        GetVideoProcessorRenderTargets       : IntPtr
        GetVideoProcessorSubStreamFormats    : IntPtr
        GetVideoProcessorCaps                : IntPtr
        GetProcAmpRange                      : IntPtr
        GetFilterPropertyRange               : IntPtr
        CreateVideoProcessor                 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDirectXVideoProcessorService.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Registers a software video processing device.
     * @param {Pointer<Void>} pCallbacks Pointer to an initialization function.
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
     * @see https://learn.microsoft.com/windows/win32/api/dxva2api/nf-dxva2api-idirectxvideoprocessorservice-registervideoprocessorsoftwaredevice
     */
    RegisterVideoProcessorSoftwareDevice(pCallbacks) {
        pCallbacksMarshal := pCallbacks is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, pCallbacksMarshal, pCallbacks, "HRESULT")
        return result
    }

    /**
     * Gets an array of GUIDs which identify the video processors supported by the graphics hardware.
     * @remarks
     * The following video processor GUIDs are predefined.
     * 
     * <table>
     * <tr>
     * <th>GUID</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td><b>DXVA2_VideoProcBobDevice</b></td>
     * <td>Bob deinterlace device. This device uses a "bob" algorithm to deinterlace the video. Bob algorithms create missing field lines by interpolating the lines in a single field.</td>
     * </tr>
     * <tr>
     * <td><b>DXVA2_VideoProcProgressiveDevice</b></td>
     * <td>Progressive video device. This device is available for progressive video, which does not require a deinterlace algorithm.</td>
     * </tr>
     * <tr>
     * <td><b>DXVA2_VideoProcSoftwareDevice</b></td>
     * <td>Reference (software) device.</td>
     * </tr>
     * </table>
     *  
     * 
     * The graphics device may define additional vendor-specific GUIDs. The driver provides the list of GUIDs in descending quality order. The mode with the highest quality is first in the list. To get the capabilities of each mode, call <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nf-dxva2api-idirectxvideoprocessorservice-getvideoprocessorcaps">IDirectXVideoProcessorService::GetVideoProcessorCaps</a> and pass in the GUID for the mode.
     * @param {Pointer<DXVA2_VideoDesc>} pVideoDesc Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_videodesc">DXVA2_VideoDesc</a> structure that describes the video content.
     * @param {Pointer<Integer>} pCount Receives the number of GUIDs.
     * @param {Pointer<Pointer<Guid>>} pGuids Receives an array of GUIDs. The size of the array is retrieved in the <i>pCount</i> parameter. The method allocates the memory for the array. The caller must free the memory by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dxva2api/nf-dxva2api-idirectxvideoprocessorservice-getvideoprocessordeviceguids
     */
    GetVideoProcessorDeviceGuids(pVideoDesc, pCount, pGuids) {
        pCountMarshal := pCount is VarRef ? "uint*" : "ptr"
        pGuidsMarshal := pGuids is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, DXVA2_VideoDesc.Ptr, pVideoDesc, pCountMarshal, pCount, pGuidsMarshal, pGuids, "HRESULT")
        return result
    }

    /**
     * Gets the render target formats that a video processor device supports. The list may include RGB and YUV formats.
     * @param {Pointer<Guid>} VideoProcDeviceGuid A GUID that identifies the video processor device.
     *           To get the list of video processor GUIDs, call <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nf-dxva2api-idirectxvideoprocessorservice-getvideoprocessordeviceguids">IDirectXVideoProcessorService::GetVideoProcessorDeviceGuids</a>.
     * @param {Pointer<DXVA2_VideoDesc>} pVideoDesc A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_videodesc">DXVA2_VideoDesc</a> structure that describes the video content.
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
     * @see https://learn.microsoft.com/windows/win32/api/dxva2api/nf-dxva2api-idirectxvideoprocessorservice-getvideoprocessorrendertargets
     */
    GetVideoProcessorRenderTargets(VideoProcDeviceGuid, pVideoDesc, pCount, pFormats) {
        pCountMarshal := pCount is VarRef ? "uint*" : "ptr"
        pFormatsMarshal := pFormats is VarRef ? "ptr*" : "ptr"

        result := ComCall(6, this, Guid.Ptr, VideoProcDeviceGuid, DXVA2_VideoDesc.Ptr, pVideoDesc, pCountMarshal, pCount, pFormatsMarshal, pFormats, "HRESULT")
        return result
    }

    /**
     * Gets a list of substream formats supported by a specified video processor device.
     * @param {Pointer<Guid>} VideoProcDeviceGuid A GUID that identifies the video processor device. 
     *           To get the list of video processor GUIDs, call <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nf-dxva2api-idirectxvideoprocessorservice-getvideoprocessordeviceguids">IDirectXVideoProcessorService::GetVideoProcessorDeviceGuids</a>.
     * @param {Pointer<DXVA2_VideoDesc>} pVideoDesc A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_videodesc">DXVA2_VideoDesc</a> structure that describes the video content.
     * @param {D3DFORMAT} RenderTargetFormat The format of the render target surface, specified as a <b>D3DFORMAT</b> value. For more information, see the Direct3D documentation. You can also use a FOURCC code to specify a format that is not defined in the <b>D3DFORMAT</b> enumeration. See <a href="https://docs.microsoft.com/windows/desktop/medfound/video-fourccs">Video FOURCCs</a>.
     * @param {Pointer<Integer>} pCount Receives the number of elements returned in the <i>ppFormats</i> array.
     * @param {Pointer<Pointer<D3DFORMAT>>} pFormats Receives an array of <b>D3DFORMAT</b> values. The caller must free the array by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>. The array can contain both RGB and YUB pixel formats.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dxva2api/nf-dxva2api-idirectxvideoprocessorservice-getvideoprocessorsubstreamformats
     */
    GetVideoProcessorSubStreamFormats(VideoProcDeviceGuid, pVideoDesc, RenderTargetFormat, pCount, pFormats) {
        pCountMarshal := pCount is VarRef ? "uint*" : "ptr"
        pFormatsMarshal := pFormats is VarRef ? "ptr*" : "ptr"

        result := ComCall(7, this, Guid.Ptr, VideoProcDeviceGuid, DXVA2_VideoDesc.Ptr, pVideoDesc, D3DFORMAT, RenderTargetFormat, pCountMarshal, pCount, pFormatsMarshal, pFormats, "HRESULT")
        return result
    }

    /**
     * Gets the capabilities of a specified video processor device.
     * @param {Pointer<Guid>} VideoProcDeviceGuid A GUID that identifies the video processor device. To get the list of video processor GUIDs, call <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nf-dxva2api-idirectxvideoprocessorservice-getvideoprocessordeviceguids">IDirectXVideoProcessorService::GetVideoProcessorDeviceGuids</a>.
     * @param {Pointer<DXVA2_VideoDesc>} pVideoDesc A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_videodesc">DXVA2_VideoDesc</a> structure that describes the video content.
     * @param {D3DFORMAT} RenderTargetFormat The format of the render target surface, specified as a <b>D3DFORMAT</b> value. For more information, see the Direct3D documentation. You can also use a FOURCC code to specify a format that is not defined in the <b>D3DFORMAT</b> enumeration. See <a href="https://docs.microsoft.com/windows/desktop/medfound/video-fourccs">Video FOURCCs</a>.
     * @returns {DXVA2_VideoProcessorCaps} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_videoprocessorcaps">DXVA2_VideoProcessorCaps</a> structure that receives the video processor capabilities.
     * @see https://learn.microsoft.com/windows/win32/api/dxva2api/nf-dxva2api-idirectxvideoprocessorservice-getvideoprocessorcaps
     */
    GetVideoProcessorCaps(VideoProcDeviceGuid, pVideoDesc, RenderTargetFormat) {
        pCaps := DXVA2_VideoProcessorCaps()
        result := ComCall(8, this, Guid.Ptr, VideoProcDeviceGuid, DXVA2_VideoDesc.Ptr, pVideoDesc, D3DFORMAT, RenderTargetFormat, DXVA2_VideoProcessorCaps.Ptr, pCaps, "HRESULT")
        return pCaps
    }

    /**
     * Gets the range of values for a video processor (ProcAmp) setting.
     * @param {Pointer<Guid>} VideoProcDeviceGuid A 
     *             GUID that identifies the video processor device.
     *           To get the list of video processor GUIDs, call <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nf-dxva2api-idirectxvideoprocessorservice-getvideoprocessordeviceguids">IDirectXVideoProcessorService::GetVideoProcessorDeviceGuids</a>.
     * @param {Pointer<DXVA2_VideoDesc>} pVideoDesc A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_videodesc">DXVA2_VideoDesc</a> structure that describes the video content.
     * @param {D3DFORMAT} RenderTargetFormat The format of the render target surface, specified as a <b>D3DFORMAT</b> value. For more information, see the Direct3D documentation. You can also use a FOURCC code to specify a format that is not defined in the <b>D3DFORMAT</b> enumeration. See <a href="https://docs.microsoft.com/windows/desktop/medfound/video-fourccs">Video FOURCCs</a>.
     * @param {Integer} ProcAmpCap The 
     *             ProcAmp setting to query. See <a href="https://docs.microsoft.com/windows/desktop/medfound/procamp-settings">ProcAmp Settings</a>.
     * @returns {DXVA2_ValueRange} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_valuerange">DXVA2_ValueRange</a> structure that receives the range of values for the setting specified in <i>ProcAmpCaps</i>.
     * @see https://learn.microsoft.com/windows/win32/api/dxva2api/nf-dxva2api-idirectxvideoprocessorservice-getprocamprange
     */
    GetProcAmpRange(VideoProcDeviceGuid, pVideoDesc, RenderTargetFormat, ProcAmpCap) {
        pRange := DXVA2_ValueRange()
        result := ComCall(9, this, Guid.Ptr, VideoProcDeviceGuid, DXVA2_VideoDesc.Ptr, pVideoDesc, D3DFORMAT, RenderTargetFormat, "uint", ProcAmpCap, DXVA2_ValueRange.Ptr, pRange, "HRESULT")
        return pRange
    }

    /**
     * Retrieves the range of values for an image filter supported by a video processor device.
     * @param {Pointer<Guid>} VideoProcDeviceGuid A GUID that identifies the video processor device.
     *           To get the list of video processor GUIDs, call <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nf-dxva2api-idirectxvideoprocessorservice-getvideoprocessordeviceguids">IDirectXVideoProcessorService::GetVideoProcessorDeviceGuids</a>.
     * @param {Pointer<DXVA2_VideoDesc>} pVideoDesc A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_videodesc">DXVA2_VideoDesc</a> structure that describes the video content.
     * @param {D3DFORMAT} RenderTargetFormat The format of the render target surface, specified as a <b>D3DFORMAT</b> value. For more information, see the Direct3D documentation. You can also use a FOURCC code to specify a format that is not defined in the <b>D3DFORMAT</b> enumeration. See <a href="https://docs.microsoft.com/windows/desktop/medfound/video-fourccs">Video FOURCCs</a>.
     * @param {Integer} FilterSetting The filter setting to query. See <a href="https://docs.microsoft.com/windows/desktop/medfound/dxva-image-filter-settings">DXVA Image Filter Settings</a>.
     * @returns {DXVA2_ValueRange} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_valuerange">DXVA2_ValueRange</a> structure that receives range of values for the image filter setting specified in <i>FilterSetting</i>.
     * @see https://learn.microsoft.com/windows/win32/api/dxva2api/nf-dxva2api-idirectxvideoprocessorservice-getfilterpropertyrange
     */
    GetFilterPropertyRange(VideoProcDeviceGuid, pVideoDesc, RenderTargetFormat, FilterSetting) {
        pRange := DXVA2_ValueRange()
        result := ComCall(10, this, Guid.Ptr, VideoProcDeviceGuid, DXVA2_VideoDesc.Ptr, pVideoDesc, D3DFORMAT, RenderTargetFormat, "uint", FilterSetting, DXVA2_ValueRange.Ptr, pRange, "HRESULT")
        return pRange
    }

    /**
     * Creates a video processor device.
     * @param {Pointer<Guid>} VideoProcDeviceGuid A GUID that specifies the video processor to create.
     *           To get the list of video processor GUIDs, call <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nf-dxva2api-idirectxvideoprocessorservice-getvideoprocessordeviceguids">IDirectXVideoProcessorService::GetVideoProcessorDeviceGuids</a>.
     * @param {Pointer<DXVA2_VideoDesc>} pVideoDesc A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_videodesc">DXVA2_VideoDesc</a> structure that describes the video content.
     * @param {D3DFORMAT} RenderTargetFormat The format of the render target surface, specified as a <b>D3DFORMAT</b> value. For more information, see the Direct3D documentation. You can also use a FOURCC code to specify a format that is not defined in the <b>D3DFORMAT</b> enumeration. See <a href="https://docs.microsoft.com/windows/desktop/medfound/video-fourccs">Video FOURCCs</a>.
     * @param {Integer} MaxNumSubStreams The maximum number of substreams that will be used with this device.
     * @returns {IDirectXVideoProcessor} Receives a pointer to the video processor's <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nn-dxva2api-idirectxvideoprocessor">IDirectXVideoProcessor</a> interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/dxva2api/nf-dxva2api-idirectxvideoprocessorservice-createvideoprocessor
     */
    CreateVideoProcessor(VideoProcDeviceGuid, pVideoDesc, RenderTargetFormat, MaxNumSubStreams) {
        result := ComCall(11, this, Guid.Ptr, VideoProcDeviceGuid, DXVA2_VideoDesc.Ptr, pVideoDesc, D3DFORMAT, RenderTargetFormat, "uint", MaxNumSubStreams, "ptr*", &ppVidProcess := 0, "HRESULT")
        return IDirectXVideoProcessor(ppVidProcess)
    }

    Query(iid) {
        if (IDirectXVideoProcessorService.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RegisterVideoProcessorSoftwareDevice := CallbackCreate(GetMethod(implObj, "RegisterVideoProcessorSoftwareDevice"), flags, 2)
        this.vtbl.GetVideoProcessorDeviceGuids := CallbackCreate(GetMethod(implObj, "GetVideoProcessorDeviceGuids"), flags, 4)
        this.vtbl.GetVideoProcessorRenderTargets := CallbackCreate(GetMethod(implObj, "GetVideoProcessorRenderTargets"), flags, 5)
        this.vtbl.GetVideoProcessorSubStreamFormats := CallbackCreate(GetMethod(implObj, "GetVideoProcessorSubStreamFormats"), flags, 6)
        this.vtbl.GetVideoProcessorCaps := CallbackCreate(GetMethod(implObj, "GetVideoProcessorCaps"), flags, 5)
        this.vtbl.GetProcAmpRange := CallbackCreate(GetMethod(implObj, "GetProcAmpRange"), flags, 6)
        this.vtbl.GetFilterPropertyRange := CallbackCreate(GetMethod(implObj, "GetFilterPropertyRange"), flags, 6)
        this.vtbl.CreateVideoProcessor := CallbackCreate(GetMethod(implObj, "CreateVideoProcessor"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RegisterVideoProcessorSoftwareDevice)
        CallbackFree(this.vtbl.GetVideoProcessorDeviceGuids)
        CallbackFree(this.vtbl.GetVideoProcessorRenderTargets)
        CallbackFree(this.vtbl.GetVideoProcessorSubStreamFormats)
        CallbackFree(this.vtbl.GetVideoProcessorCaps)
        CallbackFree(this.vtbl.GetProcAmpRange)
        CallbackFree(this.vtbl.GetFilterPropertyRange)
        CallbackFree(this.vtbl.CreateVideoProcessor)
    }
}
