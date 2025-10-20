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
     * 
     * @param {Pointer<IDirectXVideoProcessorService>} ppService 
     * @returns {HRESULT} 
     */
    GetVideoProcessorService(ppService) {
        result := ComCall(3, this, "ptr", ppService, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pDeviceGuid 
     * @param {Pointer<DXVA2_VideoDesc>} pVideoDesc 
     * @param {Pointer<UInt32>} pRenderTargetFormat 
     * @param {Pointer<UInt32>} pMaxNumSubStreams 
     * @returns {HRESULT} 
     */
    GetCreationParameters(pDeviceGuid, pVideoDesc, pRenderTargetFormat, pMaxNumSubStreams) {
        result := ComCall(4, this, "ptr", pDeviceGuid, "ptr", pVideoDesc, "uint*", pRenderTargetFormat, "uint*", pMaxNumSubStreams, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DXVA2_VideoProcessorCaps>} pCaps 
     * @returns {HRESULT} 
     */
    GetVideoProcessorCaps(pCaps) {
        result := ComCall(5, this, "ptr", pCaps, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ProcAmpCap 
     * @param {Pointer<DXVA2_ValueRange>} pRange 
     * @returns {HRESULT} 
     */
    GetProcAmpRange(ProcAmpCap, pRange) {
        result := ComCall(6, this, "uint", ProcAmpCap, "ptr", pRange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} FilterSetting 
     * @param {Pointer<DXVA2_ValueRange>} pRange 
     * @returns {HRESULT} 
     */
    GetFilterPropertyRange(FilterSetting, pRange) {
        result := ComCall(7, this, "uint", FilterSetting, "ptr", pRange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDirect3DSurface9>} pRenderTarget 
     * @param {Pointer<DXVA2_VideoProcessBltParams>} pBltParams 
     * @param {Pointer<DXVA2_VideoSample>} pSamples 
     * @param {Integer} NumSamples 
     * @param {Pointer<HANDLE>} pHandleComplete 
     * @returns {HRESULT} 
     */
    VideoProcessBlt(pRenderTarget, pBltParams, pSamples, NumSamples, pHandleComplete) {
        result := ComCall(8, this, "ptr", pRenderTarget, "ptr", pBltParams, "ptr", pSamples, "uint", NumSamples, "ptr", pHandleComplete, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
