#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Graphics\Direct3D9\IDirect3DSurface9.ahk
#Include .\DXVAHD_VPDEVCAPS.ahk
#Include .\DXVAHD_VPCAPS.ahk
#Include .\DXVAHD_CUSTOM_RATE_DATA.ahk
#Include .\DXVAHD_FILTER_RANGE_DATA.ahk
#Include .\IDXVAHD_VideoProcessor.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a Microsoft DirectX Video Acceleration High Definition (DXVA-HD) device.
 * @see https://docs.microsoft.com/windows/win32/api//dxvahd/nn-dxvahd-idxvahd_device
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IDXVAHD_Device extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDXVAHD_Device
     * @type {Guid}
     */
    static IID => Guid("{95f12dfd-d77e-49be-815f-57d579634d6d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateVideoSurface", "GetVideoProcessorDeviceCaps", "GetVideoProcessorOutputFormats", "GetVideoProcessorInputFormats", "GetVideoProcessorCaps", "GetVideoProcessorCustomRates", "GetVideoProcessorFilterRange", "CreateVideoProcessor"]

    /**
     * 
     * @param {Integer} Width 
     * @param {Integer} Height 
     * @param {Integer} Format 
     * @param {Integer} Pool 
     * @param {Integer} Usage 
     * @param {Integer} Type 
     * @param {Integer} NumSurfaces 
     * @param {Pointer<HANDLE>} pSharedHandle 
     * @returns {IDirect3DSurface9} 
     * @see https://learn.microsoft.com/windows/win32/api/dxvahd/nf-dxvahd-idxvahd_device-createvideosurface
     */
    CreateVideoSurface(Width, Height, Format, Pool, Usage, Type, NumSurfaces, pSharedHandle) {
        result := ComCall(3, this, "uint", Width, "uint", Height, "uint", Format, "int", Pool, "uint", Usage, "int", Type, "uint", NumSurfaces, "ptr*", &ppSurfaces := 0, "ptr", pSharedHandle, "HRESULT")
        return IDirect3DSurface9(ppSurfaces)
    }

    /**
     * 
     * @returns {DXVAHD_VPDEVCAPS} 
     * @see https://learn.microsoft.com/windows/win32/api/dxvahd/nf-dxvahd-idxvahd_device-getvideoprocessordevicecaps
     */
    GetVideoProcessorDeviceCaps() {
        pCaps := DXVAHD_VPDEVCAPS()
        result := ComCall(4, this, "ptr", pCaps, "HRESULT")
        return pCaps
    }

    /**
     * 
     * @param {Integer} Count 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dxvahd/nf-dxvahd-idxvahd_device-getvideoprocessoroutputformats
     */
    GetVideoProcessorOutputFormats(Count) {
        result := ComCall(5, this, "uint", Count, "uint*", &pFormats := 0, "HRESULT")
        return pFormats
    }

    /**
     * 
     * @param {Integer} Count 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dxvahd/nf-dxvahd-idxvahd_device-getvideoprocessorinputformats
     */
    GetVideoProcessorInputFormats(Count) {
        result := ComCall(6, this, "uint", Count, "uint*", &pFormats := 0, "HRESULT")
        return pFormats
    }

    /**
     * 
     * @param {Integer} Count 
     * @returns {DXVAHD_VPCAPS} 
     * @see https://learn.microsoft.com/windows/win32/api/dxvahd/nf-dxvahd-idxvahd_device-getvideoprocessorcaps
     */
    GetVideoProcessorCaps(Count) {
        pCaps := DXVAHD_VPCAPS()
        result := ComCall(7, this, "uint", Count, "ptr", pCaps, "HRESULT")
        return pCaps
    }

    /**
     * 
     * @param {Pointer<Guid>} pVPGuid 
     * @param {Integer} Count 
     * @returns {DXVAHD_CUSTOM_RATE_DATA} 
     * @see https://learn.microsoft.com/windows/win32/api/dxvahd/nf-dxvahd-idxvahd_device-getvideoprocessorcustomrates
     */
    GetVideoProcessorCustomRates(pVPGuid, Count) {
        pRates := DXVAHD_CUSTOM_RATE_DATA()
        result := ComCall(8, this, "ptr", pVPGuid, "uint", Count, "ptr", pRates, "HRESULT")
        return pRates
    }

    /**
     * 
     * @param {Integer} Filter 
     * @returns {DXVAHD_FILTER_RANGE_DATA} 
     * @see https://learn.microsoft.com/windows/win32/api/dxvahd/nf-dxvahd-idxvahd_device-getvideoprocessorfilterrange
     */
    GetVideoProcessorFilterRange(Filter) {
        pRange := DXVAHD_FILTER_RANGE_DATA()
        result := ComCall(9, this, "int", Filter, "ptr", pRange, "HRESULT")
        return pRange
    }

    /**
     * 
     * @param {Pointer<Guid>} pVPGuid 
     * @returns {IDXVAHD_VideoProcessor} 
     * @see https://learn.microsoft.com/windows/win32/api/dxvahd/nf-dxvahd-idxvahd_device-createvideoprocessor
     */
    CreateVideoProcessor(pVPGuid) {
        result := ComCall(10, this, "ptr", pVPGuid, "ptr*", &ppVideoProcessor := 0, "HRESULT")
        return IDXVAHD_VideoProcessor(ppVideoProcessor)
    }
}
