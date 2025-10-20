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
     * 
     * @param {Pointer<Void>} pCallbacks 
     * @returns {HRESULT} 
     */
    RegisterVideoProcessorSoftwareDevice(pCallbacks) {
        result := ComCall(4, this, "ptr", pCallbacks, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DXVA2_VideoDesc>} pVideoDesc 
     * @param {Pointer<UInt32>} pCount 
     * @param {Pointer<Guid>} pGuids 
     * @returns {HRESULT} 
     */
    GetVideoProcessorDeviceGuids(pVideoDesc, pCount, pGuids) {
        result := ComCall(5, this, "ptr", pVideoDesc, "uint*", pCount, "ptr", pGuids, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} VideoProcDeviceGuid 
     * @param {Pointer<DXVA2_VideoDesc>} pVideoDesc 
     * @param {Pointer<UInt32>} pCount 
     * @param {Pointer<UInt32>} pFormats 
     * @returns {HRESULT} 
     */
    GetVideoProcessorRenderTargets(VideoProcDeviceGuid, pVideoDesc, pCount, pFormats) {
        result := ComCall(6, this, "ptr", VideoProcDeviceGuid, "ptr", pVideoDesc, "uint*", pCount, "uint*", pFormats, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} VideoProcDeviceGuid 
     * @param {Pointer<DXVA2_VideoDesc>} pVideoDesc 
     * @param {Integer} RenderTargetFormat 
     * @param {Pointer<UInt32>} pCount 
     * @param {Pointer<UInt32>} pFormats 
     * @returns {HRESULT} 
     */
    GetVideoProcessorSubStreamFormats(VideoProcDeviceGuid, pVideoDesc, RenderTargetFormat, pCount, pFormats) {
        result := ComCall(7, this, "ptr", VideoProcDeviceGuid, "ptr", pVideoDesc, "uint", RenderTargetFormat, "uint*", pCount, "uint*", pFormats, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} VideoProcDeviceGuid 
     * @param {Pointer<DXVA2_VideoDesc>} pVideoDesc 
     * @param {Integer} RenderTargetFormat 
     * @param {Pointer<DXVA2_VideoProcessorCaps>} pCaps 
     * @returns {HRESULT} 
     */
    GetVideoProcessorCaps(VideoProcDeviceGuid, pVideoDesc, RenderTargetFormat, pCaps) {
        result := ComCall(8, this, "ptr", VideoProcDeviceGuid, "ptr", pVideoDesc, "uint", RenderTargetFormat, "ptr", pCaps, "int")
        if(result != 0)
            throw OSError(result)

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
     */
    GetProcAmpRange(VideoProcDeviceGuid, pVideoDesc, RenderTargetFormat, ProcAmpCap, pRange) {
        result := ComCall(9, this, "ptr", VideoProcDeviceGuid, "ptr", pVideoDesc, "uint", RenderTargetFormat, "uint", ProcAmpCap, "ptr", pRange, "int")
        if(result != 0)
            throw OSError(result)

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
     */
    GetFilterPropertyRange(VideoProcDeviceGuid, pVideoDesc, RenderTargetFormat, FilterSetting, pRange) {
        result := ComCall(10, this, "ptr", VideoProcDeviceGuid, "ptr", pVideoDesc, "uint", RenderTargetFormat, "uint", FilterSetting, "ptr", pRange, "int")
        if(result != 0)
            throw OSError(result)

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
     */
    CreateVideoProcessor(VideoProcDeviceGuid, pVideoDesc, RenderTargetFormat, MaxNumSubStreams, ppVidProcess) {
        result := ComCall(11, this, "ptr", VideoProcDeviceGuid, "ptr", pVideoDesc, "uint", RenderTargetFormat, "uint", MaxNumSubStreams, "ptr", ppVidProcess, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
