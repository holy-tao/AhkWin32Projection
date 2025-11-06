#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDirectXVideoProcessorService.ahk
#Include .\DXVA2_VideoProcessorCaps.ahk
#Include .\DXVA2_ValueRange.ahk
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
     * @returns {IDirectXVideoProcessorService} 
     * @see https://learn.microsoft.com/windows/win32/api/dxva2api/nf-dxva2api-idirectxvideoprocessor-getvideoprocessorservice
     */
    GetVideoProcessorService() {
        result := ComCall(3, this, "ptr*", &ppService := 0, "HRESULT")
        return IDirectXVideoProcessorService(ppService)
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
        pRenderTargetFormatMarshal := pRenderTargetFormat is VarRef ? "uint*" : "ptr"
        pMaxNumSubStreamsMarshal := pMaxNumSubStreams is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr", pDeviceGuid, "ptr", pVideoDesc, pRenderTargetFormatMarshal, pRenderTargetFormat, pMaxNumSubStreamsMarshal, pMaxNumSubStreams, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {DXVA2_VideoProcessorCaps} 
     * @see https://learn.microsoft.com/windows/win32/api/dxva2api/nf-dxva2api-idirectxvideoprocessor-getvideoprocessorcaps
     */
    GetVideoProcessorCaps() {
        pCaps := DXVA2_VideoProcessorCaps()
        result := ComCall(5, this, "ptr", pCaps, "HRESULT")
        return pCaps
    }

    /**
     * 
     * @param {Integer} ProcAmpCap 
     * @returns {DXVA2_ValueRange} 
     * @see https://learn.microsoft.com/windows/win32/api/dxva2api/nf-dxva2api-idirectxvideoprocessor-getprocamprange
     */
    GetProcAmpRange(ProcAmpCap) {
        pRange := DXVA2_ValueRange()
        result := ComCall(6, this, "uint", ProcAmpCap, "ptr", pRange, "HRESULT")
        return pRange
    }

    /**
     * 
     * @param {Integer} FilterSetting 
     * @returns {DXVA2_ValueRange} 
     * @see https://learn.microsoft.com/windows/win32/api/dxva2api/nf-dxva2api-idirectxvideoprocessor-getfilterpropertyrange
     */
    GetFilterPropertyRange(FilterSetting) {
        pRange := DXVA2_ValueRange()
        result := ComCall(7, this, "uint", FilterSetting, "ptr", pRange, "HRESULT")
        return pRange
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
