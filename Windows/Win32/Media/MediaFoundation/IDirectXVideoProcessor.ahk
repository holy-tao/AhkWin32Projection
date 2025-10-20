#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a DirectX Video Acceleration (DXVA) video processor device.
 * @see https://docs.microsoft.com/windows/win32/api//dxva2api/nn-dxva2api-idirectxvideoprocessor
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IDirectXVideoProcessor extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirectXVideoProcessor
     * @type {Guid}
     */
    static IID => Guid("{8c3a39f0-916e-4690-804f-4c8001355d25}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetVideoProcessorService", "GetCreationParameters", "GetVideoProcessorCaps", "GetProcAmpRange", "GetFilterPropertyRange", "VideoProcessBlt"]

    /**
     * 
     * @param {Pointer<IDirectXVideoProcessorService>} ppService 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxva2api/nf-dxva2api-idirectxvideoprocessor-getvideoprocessorservice
     */
    GetVideoProcessorService(ppService) {
        result := ComCall(3, this, "ptr*", ppService, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pDeviceGuid 
     * @param {Pointer<DXVA2_VideoDesc>} pVideoDesc 
     * @param {Pointer<Integer>} pRenderTargetFormat 
     * @param {Pointer<Integer>} pMaxNumSubStreams 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxva2api/nf-dxva2api-idirectxvideoprocessor-getcreationparameters
     */
    GetCreationParameters(pDeviceGuid, pVideoDesc, pRenderTargetFormat, pMaxNumSubStreams) {
        result := ComCall(4, this, "ptr", pDeviceGuid, "ptr", pVideoDesc, "uint*", pRenderTargetFormat, "uint*", pMaxNumSubStreams, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DXVA2_VideoProcessorCaps>} pCaps 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxva2api/nf-dxva2api-idirectxvideoprocessor-getvideoprocessorcaps
     */
    GetVideoProcessorCaps(pCaps) {
        result := ComCall(5, this, "ptr", pCaps, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ProcAmpCap 
     * @param {Pointer<DXVA2_ValueRange>} pRange 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxva2api/nf-dxva2api-idirectxvideoprocessor-getprocamprange
     */
    GetProcAmpRange(ProcAmpCap, pRange) {
        result := ComCall(6, this, "uint", ProcAmpCap, "ptr", pRange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} FilterSetting 
     * @param {Pointer<DXVA2_ValueRange>} pRange 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxva2api/nf-dxva2api-idirectxvideoprocessor-getfilterpropertyrange
     */
    GetFilterPropertyRange(FilterSetting, pRange) {
        result := ComCall(7, this, "uint", FilterSetting, "ptr", pRange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDirect3DSurface9} pRenderTarget 
     * @param {Pointer<DXVA2_VideoProcessBltParams>} pBltParams 
     * @param {Pointer<DXVA2_VideoSample>} pSamples 
     * @param {Integer} NumSamples 
     * @param {Pointer<HANDLE>} pHandleComplete 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxva2api/nf-dxva2api-idirectxvideoprocessor-videoprocessblt
     */
    VideoProcessBlt(pRenderTarget, pBltParams, pSamples, NumSamples, pHandleComplete) {
        result := ComCall(8, this, "ptr", pRenderTarget, "ptr", pBltParams, "ptr", pSamples, "uint", NumSamples, "ptr", pHandleComplete, "HRESULT")
        return result
    }
}
