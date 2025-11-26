#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\DXVA2_VideoProcessorCaps.ahk
#Include .\DXVA2_ValueRange.ahk
#Include .\IDirectXVideoProcessor.ahk
#Include .\IDirectXVideoAccelerationService.ahk

/**
 * Provides access to DirectX Video Acceleration (DXVA) video processing services.
 * @see https://docs.microsoft.com/windows/win32/api//dxva2api/nn-dxva2api-idirectxvideoprocessorservice
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IDirectXVideoProcessorService extends IDirectXVideoAccelerationService{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirectXVideoProcessorService
     * @type {Guid}
     */
    static IID => Guid("{fc51a552-d5e7-11d9-af55-00054e43ff02}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RegisterVideoProcessorSoftwareDevice", "GetVideoProcessorDeviceGuids", "GetVideoProcessorRenderTargets", "GetVideoProcessorSubStreamFormats", "GetVideoProcessorCaps", "GetProcAmpRange", "GetFilterPropertyRange", "CreateVideoProcessor"]

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
     * @see https://docs.microsoft.com/windows/win32/api//dxva2api/nf-dxva2api-idirectxvideoprocessorservice-registervideoprocessorsoftwaredevice
     */
    RegisterVideoProcessorSoftwareDevice(pCallbacks) {
        pCallbacksMarshal := pCallbacks is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, pCallbacksMarshal, pCallbacks, "HRESULT")
        return result
    }

    /**
     * Gets an array of GUIDs which identify the video processors supported by the graphics hardware.
     * @param {Pointer<DXVA2_VideoDesc>} pVideoDesc Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_videodesc">DXVA2_VideoDesc</a> structure that describes the video content.
     * @param {Pointer<Integer>} pCount Receives the number of GUIDs.
     * @param {Pointer<Pointer<Guid>>} pGuids Receives an array of GUIDs. The size of the array is retrieved in the <i>pCount</i> parameter. The method allocates the memory for the array. The caller must free the memory by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dxva2api/nf-dxva2api-idirectxvideoprocessorservice-getvideoprocessordeviceguids
     */
    GetVideoProcessorDeviceGuids(pVideoDesc, pCount, pGuids) {
        pCountMarshal := pCount is VarRef ? "uint*" : "ptr"
        pGuidsMarshal := pGuids is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, "ptr", pVideoDesc, pCountMarshal, pCount, pGuidsMarshal, pGuids, "HRESULT")
        return result
    }

    /**
     * Gets the render target formats that a video processor device supports. The list may include RGB and YUV formats.
     * @param {Pointer<Guid>} VideoProcDeviceGuid A GUID that identifies the video processor device.
     *           To get the list of video processor GUIDs, call <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nf-dxva2api-idirectxvideoprocessorservice-getvideoprocessordeviceguids">IDirectXVideoProcessorService::GetVideoProcessorDeviceGuids</a>.
     * @param {Pointer<DXVA2_VideoDesc>} pVideoDesc A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_videodesc">DXVA2_VideoDesc</a> structure that describes the video content.
     * @param {Pointer<Integer>} pCount Receives the number of formats.
     * @param {Pointer<Pointer<Integer>>} pFormats Receives an array of formats, specified as <b>D3DFORMAT</b> values. The size of the array is retrieved in the <i>pCount</i> parameter. The method allocates the memory for the array. The caller must free the memory by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
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
     * @see https://docs.microsoft.com/windows/win32/api//dxva2api/nf-dxva2api-idirectxvideoprocessorservice-getvideoprocessorrendertargets
     */
    GetVideoProcessorRenderTargets(VideoProcDeviceGuid, pVideoDesc, pCount, pFormats) {
        pCountMarshal := pCount is VarRef ? "uint*" : "ptr"
        pFormatsMarshal := pFormats is VarRef ? "ptr*" : "ptr"

        result := ComCall(6, this, "ptr", VideoProcDeviceGuid, "ptr", pVideoDesc, pCountMarshal, pCount, pFormatsMarshal, pFormats, "HRESULT")
        return result
    }

    /**
     * Gets a list of substream formats supported by a specified video processor device.
     * @param {Pointer<Guid>} VideoProcDeviceGuid A GUID that identifies the video processor device. 
     *           To get the list of video processor GUIDs, call <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nf-dxva2api-idirectxvideoprocessorservice-getvideoprocessordeviceguids">IDirectXVideoProcessorService::GetVideoProcessorDeviceGuids</a>.
     * @param {Pointer<DXVA2_VideoDesc>} pVideoDesc A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_videodesc">DXVA2_VideoDesc</a> structure that describes the video content.
     * @param {Integer} RenderTargetFormat The format of the render target surface, specified as a <b>D3DFORMAT</b> value. For more information, see the Direct3D documentation. You can also use a FOURCC code to specify a format that is not defined in the <b>D3DFORMAT</b> enumeration. See <a href="https://docs.microsoft.com/windows/desktop/medfound/video-fourccs">Video FOURCCs</a>.
     * @param {Pointer<Integer>} pCount Receives the number of elements returned in the <i>ppFormats</i> array.
     * @param {Pointer<Pointer<Integer>>} pFormats Receives an array of <b>D3DFORMAT</b> values. The caller must free the array by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>. The array can contain both RGB and YUB pixel formats.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dxva2api/nf-dxva2api-idirectxvideoprocessorservice-getvideoprocessorsubstreamformats
     */
    GetVideoProcessorSubStreamFormats(VideoProcDeviceGuid, pVideoDesc, RenderTargetFormat, pCount, pFormats) {
        pCountMarshal := pCount is VarRef ? "uint*" : "ptr"
        pFormatsMarshal := pFormats is VarRef ? "ptr*" : "ptr"

        result := ComCall(7, this, "ptr", VideoProcDeviceGuid, "ptr", pVideoDesc, "uint", RenderTargetFormat, pCountMarshal, pCount, pFormatsMarshal, pFormats, "HRESULT")
        return result
    }

    /**
     * Gets the capabilities of a specified video processor device.
     * @param {Pointer<Guid>} VideoProcDeviceGuid A GUID that identifies the video processor device. To get the list of video processor GUIDs, call <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nf-dxva2api-idirectxvideoprocessorservice-getvideoprocessordeviceguids">IDirectXVideoProcessorService::GetVideoProcessorDeviceGuids</a>.
     * @param {Pointer<DXVA2_VideoDesc>} pVideoDesc A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_videodesc">DXVA2_VideoDesc</a> structure that describes the video content.
     * @param {Integer} RenderTargetFormat The format of the render target surface, specified as a <b>D3DFORMAT</b> value. For more information, see the Direct3D documentation. You can also use a FOURCC code to specify a format that is not defined in the <b>D3DFORMAT</b> enumeration. See <a href="https://docs.microsoft.com/windows/desktop/medfound/video-fourccs">Video FOURCCs</a>.
     * @returns {DXVA2_VideoProcessorCaps} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_videoprocessorcaps">DXVA2_VideoProcessorCaps</a> structure that receives the video processor capabilities.
     * @see https://docs.microsoft.com/windows/win32/api//dxva2api/nf-dxva2api-idirectxvideoprocessorservice-getvideoprocessorcaps
     */
    GetVideoProcessorCaps(VideoProcDeviceGuid, pVideoDesc, RenderTargetFormat) {
        pCaps := DXVA2_VideoProcessorCaps()
        result := ComCall(8, this, "ptr", VideoProcDeviceGuid, "ptr", pVideoDesc, "uint", RenderTargetFormat, "ptr", pCaps, "HRESULT")
        return pCaps
    }

    /**
     * Gets the range of values for a video processor (ProcAmp) setting.
     * @param {Pointer<Guid>} VideoProcDeviceGuid A 
     *             GUID that identifies the video processor device.
     *           To get the list of video processor GUIDs, call <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nf-dxva2api-idirectxvideoprocessorservice-getvideoprocessordeviceguids">IDirectXVideoProcessorService::GetVideoProcessorDeviceGuids</a>.
     * @param {Pointer<DXVA2_VideoDesc>} pVideoDesc A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_videodesc">DXVA2_VideoDesc</a> structure that describes the video content.
     * @param {Integer} RenderTargetFormat The format of the render target surface, specified as a <b>D3DFORMAT</b> value. For more information, see the Direct3D documentation. You can also use a FOURCC code to specify a format that is not defined in the <b>D3DFORMAT</b> enumeration. See <a href="https://docs.microsoft.com/windows/desktop/medfound/video-fourccs">Video FOURCCs</a>.
     * @param {Integer} ProcAmpCap The 
     *             ProcAmp setting to query. See <a href="https://docs.microsoft.com/windows/desktop/medfound/procamp-settings">ProcAmp Settings</a>.
     * @returns {DXVA2_ValueRange} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_valuerange">DXVA2_ValueRange</a> structure that receives the range of values for the setting specified in <i>ProcAmpCaps</i>.
     * @see https://docs.microsoft.com/windows/win32/api//dxva2api/nf-dxva2api-idirectxvideoprocessorservice-getprocamprange
     */
    GetProcAmpRange(VideoProcDeviceGuid, pVideoDesc, RenderTargetFormat, ProcAmpCap) {
        pRange := DXVA2_ValueRange()
        result := ComCall(9, this, "ptr", VideoProcDeviceGuid, "ptr", pVideoDesc, "uint", RenderTargetFormat, "uint", ProcAmpCap, "ptr", pRange, "HRESULT")
        return pRange
    }

    /**
     * Retrieves the range of values for an image filter supported by a video processor device.
     * @param {Pointer<Guid>} VideoProcDeviceGuid A GUID that identifies the video processor device.
     *           To get the list of video processor GUIDs, call <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nf-dxva2api-idirectxvideoprocessorservice-getvideoprocessordeviceguids">IDirectXVideoProcessorService::GetVideoProcessorDeviceGuids</a>.
     * @param {Pointer<DXVA2_VideoDesc>} pVideoDesc A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_videodesc">DXVA2_VideoDesc</a> structure that describes the video content.
     * @param {Integer} RenderTargetFormat The format of the render target surface, specified as a <b>D3DFORMAT</b> value. For more information, see the Direct3D documentation. You can also use a FOURCC code to specify a format that is not defined in the <b>D3DFORMAT</b> enumeration. See <a href="https://docs.microsoft.com/windows/desktop/medfound/video-fourccs">Video FOURCCs</a>.
     * @param {Integer} FilterSetting The filter setting to query. See <a href="https://docs.microsoft.com/windows/desktop/medfound/dxva-image-filter-settings">DXVA Image Filter Settings</a>.
     * @returns {DXVA2_ValueRange} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_valuerange">DXVA2_ValueRange</a> structure that receives range of values for the image filter setting specified in <i>FilterSetting</i>.
     * @see https://docs.microsoft.com/windows/win32/api//dxva2api/nf-dxva2api-idirectxvideoprocessorservice-getfilterpropertyrange
     */
    GetFilterPropertyRange(VideoProcDeviceGuid, pVideoDesc, RenderTargetFormat, FilterSetting) {
        pRange := DXVA2_ValueRange()
        result := ComCall(10, this, "ptr", VideoProcDeviceGuid, "ptr", pVideoDesc, "uint", RenderTargetFormat, "uint", FilterSetting, "ptr", pRange, "HRESULT")
        return pRange
    }

    /**
     * Creates a video processor device.
     * @param {Pointer<Guid>} VideoProcDeviceGuid A GUID that specifies the video processor to create.
     *           To get the list of video processor GUIDs, call <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nf-dxva2api-idirectxvideoprocessorservice-getvideoprocessordeviceguids">IDirectXVideoProcessorService::GetVideoProcessorDeviceGuids</a>.
     * @param {Pointer<DXVA2_VideoDesc>} pVideoDesc A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_videodesc">DXVA2_VideoDesc</a> structure that describes the video content.
     * @param {Integer} RenderTargetFormat The format of the render target surface, specified as a <b>D3DFORMAT</b> value. For more information, see the Direct3D documentation. You can also use a FOURCC code to specify a format that is not defined in the <b>D3DFORMAT</b> enumeration. See <a href="https://docs.microsoft.com/windows/desktop/medfound/video-fourccs">Video FOURCCs</a>.
     * @param {Integer} MaxNumSubStreams The maximum number of substreams that will be used with this device.
     * @returns {IDirectXVideoProcessor} Receives a pointer to the video processor's <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nn-dxva2api-idirectxvideoprocessor">IDirectXVideoProcessor</a> interface. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//dxva2api/nf-dxva2api-idirectxvideoprocessorservice-createvideoprocessor
     */
    CreateVideoProcessor(VideoProcDeviceGuid, pVideoDesc, RenderTargetFormat, MaxNumSubStreams) {
        result := ComCall(11, this, "ptr", VideoProcDeviceGuid, "ptr", pVideoDesc, "uint", RenderTargetFormat, "uint", MaxNumSubStreams, "ptr*", &ppVidProcess := 0, "HRESULT")
        return IDirectXVideoProcessor(ppVidProcess)
    }
}
