#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<Void>} pCallbacks 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxva2api/nf-dxva2api-idirectxvideoprocessorservice-registervideoprocessorsoftwaredevice
     */
    RegisterVideoProcessorSoftwareDevice(pCallbacks) {
        pCallbacksMarshal := pCallbacks is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, pCallbacksMarshal, pCallbacks, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DXVA2_VideoDesc>} pVideoDesc 
     * @param {Pointer<Integer>} pCount 
     * @param {Pointer<Pointer<Guid>>} pGuids 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxva2api/nf-dxva2api-idirectxvideoprocessorservice-getvideoprocessordeviceguids
     */
    GetVideoProcessorDeviceGuids(pVideoDesc, pCount, pGuids) {
        pCountMarshal := pCount is VarRef ? "uint*" : "ptr"
        pGuidsMarshal := pGuids is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, "ptr", pVideoDesc, pCountMarshal, pCount, pGuidsMarshal, pGuids, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} VideoProcDeviceGuid 
     * @param {Pointer<DXVA2_VideoDesc>} pVideoDesc 
     * @param {Pointer<Integer>} pCount 
     * @param {Pointer<Pointer<Integer>>} pFormats 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxva2api/nf-dxva2api-idirectxvideoprocessorservice-getvideoprocessorrendertargets
     */
    GetVideoProcessorRenderTargets(VideoProcDeviceGuid, pVideoDesc, pCount, pFormats) {
        pCountMarshal := pCount is VarRef ? "uint*" : "ptr"
        pFormatsMarshal := pFormats is VarRef ? "ptr*" : "ptr"

        result := ComCall(6, this, "ptr", VideoProcDeviceGuid, "ptr", pVideoDesc, pCountMarshal, pCount, pFormatsMarshal, pFormats, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} VideoProcDeviceGuid 
     * @param {Pointer<DXVA2_VideoDesc>} pVideoDesc 
     * @param {Integer} RenderTargetFormat 
     * @param {Pointer<Integer>} pCount 
     * @param {Pointer<Pointer<Integer>>} pFormats 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxva2api/nf-dxva2api-idirectxvideoprocessorservice-getvideoprocessorsubstreamformats
     */
    GetVideoProcessorSubStreamFormats(VideoProcDeviceGuid, pVideoDesc, RenderTargetFormat, pCount, pFormats) {
        pCountMarshal := pCount is VarRef ? "uint*" : "ptr"
        pFormatsMarshal := pFormats is VarRef ? "ptr*" : "ptr"

        result := ComCall(7, this, "ptr", VideoProcDeviceGuid, "ptr", pVideoDesc, "uint", RenderTargetFormat, pCountMarshal, pCount, pFormatsMarshal, pFormats, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} VideoProcDeviceGuid 
     * @param {Pointer<DXVA2_VideoDesc>} pVideoDesc 
     * @param {Integer} RenderTargetFormat 
     * @param {Pointer<DXVA2_VideoProcessorCaps>} pCaps 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxva2api/nf-dxva2api-idirectxvideoprocessorservice-getvideoprocessorcaps
     */
    GetVideoProcessorCaps(VideoProcDeviceGuid, pVideoDesc, RenderTargetFormat, pCaps) {
        result := ComCall(8, this, "ptr", VideoProcDeviceGuid, "ptr", pVideoDesc, "uint", RenderTargetFormat, "ptr", pCaps, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} VideoProcDeviceGuid 
     * @param {Pointer<DXVA2_VideoDesc>} pVideoDesc 
     * @param {Integer} RenderTargetFormat 
     * @param {Integer} ProcAmpCap 
     * @param {Pointer<DXVA2_ValueRange>} pRange 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxva2api/nf-dxva2api-idirectxvideoprocessorservice-getprocamprange
     */
    GetProcAmpRange(VideoProcDeviceGuid, pVideoDesc, RenderTargetFormat, ProcAmpCap, pRange) {
        result := ComCall(9, this, "ptr", VideoProcDeviceGuid, "ptr", pVideoDesc, "uint", RenderTargetFormat, "uint", ProcAmpCap, "ptr", pRange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} VideoProcDeviceGuid 
     * @param {Pointer<DXVA2_VideoDesc>} pVideoDesc 
     * @param {Integer} RenderTargetFormat 
     * @param {Integer} FilterSetting 
     * @param {Pointer<DXVA2_ValueRange>} pRange 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxva2api/nf-dxva2api-idirectxvideoprocessorservice-getfilterpropertyrange
     */
    GetFilterPropertyRange(VideoProcDeviceGuid, pVideoDesc, RenderTargetFormat, FilterSetting, pRange) {
        result := ComCall(10, this, "ptr", VideoProcDeviceGuid, "ptr", pVideoDesc, "uint", RenderTargetFormat, "uint", FilterSetting, "ptr", pRange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} VideoProcDeviceGuid 
     * @param {Pointer<DXVA2_VideoDesc>} pVideoDesc 
     * @param {Integer} RenderTargetFormat 
     * @param {Integer} MaxNumSubStreams 
     * @param {Pointer<IDirectXVideoProcessor>} ppVidProcess 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxva2api/nf-dxva2api-idirectxvideoprocessorservice-createvideoprocessor
     */
    CreateVideoProcessor(VideoProcDeviceGuid, pVideoDesc, RenderTargetFormat, MaxNumSubStreams, ppVidProcess) {
        result := ComCall(11, this, "ptr", VideoProcDeviceGuid, "ptr", pVideoDesc, "uint", RenderTargetFormat, "uint", MaxNumSubStreams, "ptr*", ppVidProcess, "HRESULT")
        return result
    }
}
