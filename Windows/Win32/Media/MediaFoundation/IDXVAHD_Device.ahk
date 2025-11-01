#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * @param {Pointer<IDirect3DSurface9>} ppSurfaces 
     * @param {Pointer<HANDLE>} pSharedHandle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxvahd/nf-dxvahd-idxvahd_device-createvideosurface
     */
    CreateVideoSurface(Width, Height, Format, Pool, Usage, Type, NumSurfaces, ppSurfaces, pSharedHandle) {
        result := ComCall(3, this, "uint", Width, "uint", Height, "uint", Format, "int", Pool, "uint", Usage, "int", Type, "uint", NumSurfaces, "ptr*", ppSurfaces, "ptr", pSharedHandle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DXVAHD_VPDEVCAPS>} pCaps 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxvahd/nf-dxvahd-idxvahd_device-getvideoprocessordevicecaps
     */
    GetVideoProcessorDeviceCaps(pCaps) {
        result := ComCall(4, this, "ptr", pCaps, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Count 
     * @param {Pointer<Integer>} pFormats 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxvahd/nf-dxvahd-idxvahd_device-getvideoprocessoroutputformats
     */
    GetVideoProcessorOutputFormats(Count, pFormats) {
        pFormatsMarshal := pFormats is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "uint", Count, pFormatsMarshal, pFormats, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Count 
     * @param {Pointer<Integer>} pFormats 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxvahd/nf-dxvahd-idxvahd_device-getvideoprocessorinputformats
     */
    GetVideoProcessorInputFormats(Count, pFormats) {
        pFormatsMarshal := pFormats is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "uint", Count, pFormatsMarshal, pFormats, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Count 
     * @param {Pointer<DXVAHD_VPCAPS>} pCaps 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxvahd/nf-dxvahd-idxvahd_device-getvideoprocessorcaps
     */
    GetVideoProcessorCaps(Count, pCaps) {
        result := ComCall(7, this, "uint", Count, "ptr", pCaps, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pVPGuid 
     * @param {Integer} Count 
     * @param {Pointer<DXVAHD_CUSTOM_RATE_DATA>} pRates 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxvahd/nf-dxvahd-idxvahd_device-getvideoprocessorcustomrates
     */
    GetVideoProcessorCustomRates(pVPGuid, Count, pRates) {
        result := ComCall(8, this, "ptr", pVPGuid, "uint", Count, "ptr", pRates, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Filter 
     * @param {Pointer<DXVAHD_FILTER_RANGE_DATA>} pRange 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxvahd/nf-dxvahd-idxvahd_device-getvideoprocessorfilterrange
     */
    GetVideoProcessorFilterRange(Filter, pRange) {
        result := ComCall(9, this, "int", Filter, "ptr", pRange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pVPGuid 
     * @param {Pointer<IDXVAHD_VideoProcessor>} ppVideoProcessor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxvahd/nf-dxvahd-idxvahd_device-createvideoprocessor
     */
    CreateVideoProcessor(pVPGuid, ppVideoProcessor) {
        result := ComCall(10, this, "ptr", pVPGuid, "ptr*", ppVideoProcessor, "HRESULT")
        return result
    }
}
