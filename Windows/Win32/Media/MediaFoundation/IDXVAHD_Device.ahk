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
     * Creates one or more Microsoft Direct3D video surfaces.
     * @param {Integer} Width The width of each surface, in pixels.
     * @param {Integer} Height The height of each surface, in pixels.
     * @param {Integer} Format The pixel format, specified as a <b>D3DFORMAT</b> value or FOURCC code. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/video-fourccs">Video FOURCCs</a>.
     * @param {Integer} Pool The memory pool in which the surface is  created. This parameter must equal the <b>InputPool</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_vpdevcaps">DXVAHD_VPDEVCAPS</a> structure. Call the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nf-dxvahd-idxvahd_device-getvideoprocessordevicecaps">IDXVAHD_Device::GetVideoProcessorDeviceCaps</a> method to get this value.
     * @param {Integer} Usage Reserved. Set to 0.
     * @param {Integer} Type The type of surface to create, specified as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ne-dxvahd-dxvahd_surface_type">DXVAHD_SURFACE_TYPE</a> enumeration.
     * @param {Integer} NumSurfaces The number of surfaces to create.
     * @param {Pointer<HANDLE>} pSharedHandle Reserved. Set to <b>NULL</b>.
     * @returns {IDirect3DSurface9} A pointer to an array of <b>IDirect3DSurface9</b> pointers. The <i>NumSurfaces</i> parameter specifies the number of elements in the array. The method fills the array with pointers to the new video surfaces. The caller must release the pointers.
     * @see https://docs.microsoft.com/windows/win32/api//dxvahd/nf-dxvahd-idxvahd_device-createvideosurface
     */
    CreateVideoSurface(Width, Height, Format, Pool, Usage, Type, NumSurfaces, pSharedHandle) {
        result := ComCall(3, this, "uint", Width, "uint", Height, "uint", Format, "int", Pool, "uint", Usage, "int", Type, "uint", NumSurfaces, "ptr*", &ppSurfaces := 0, "ptr", pSharedHandle, "HRESULT")
        return IDirect3DSurface9(ppSurfaces)
    }

    /**
     * Gets the capabilities of the Microsoft DirectX Video Acceleration High Definition (DXVA-HD) device.
     * @returns {DXVAHD_VPDEVCAPS} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_vpdevcaps">DXVAHD_VPDEVCAPS</a> structure that receives the device capabilities.
     * @see https://docs.microsoft.com/windows/win32/api//dxvahd/nf-dxvahd-idxvahd_device-getvideoprocessordevicecaps
     */
    GetVideoProcessorDeviceCaps() {
        pCaps := DXVAHD_VPDEVCAPS()
        result := ComCall(4, this, "ptr", pCaps, "HRESULT")
        return pCaps
    }

    /**
     * Gets a list of the output formats supported by the Microsoft DirectX Video Acceleration High Definition (DXVA-HD) device.
     * @param {Integer} Count The number of formats to retrieve. This parameter must equal the <b>OutputFormatCount</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_vpdevcaps">DXVAHD_VPDEVCAPS</a> structure. Call the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nf-dxvahd-idxvahd_device-getvideoprocessordevicecaps">IDXVAHD_Device::GetVideoProcessorDeviceCaps</a> method to get this value.
     * @returns {Integer} A pointer to an array of <b>D3DFORMAT</b> values. The <i>Count</i> parameter specifies the number of elements in the array. The method fills the array with a list of output formats.
     * @see https://docs.microsoft.com/windows/win32/api//dxvahd/nf-dxvahd-idxvahd_device-getvideoprocessoroutputformats
     */
    GetVideoProcessorOutputFormats(Count) {
        result := ComCall(5, this, "uint", Count, "uint*", &pFormats := 0, "HRESULT")
        return pFormats
    }

    /**
     * Gets a list of the input formats supported by the Microsoft DirectX Video Acceleration High Definition (DXVA-HD) device.
     * @param {Integer} Count The number of formats to retrieve. This parameter must equal the <b>InputFormatCount</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_vpdevcaps">DXVAHD_VPDEVCAPS</a> structure. Call the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nf-dxvahd-idxvahd_device-getvideoprocessordevicecaps">IDXVAHD_Device::GetVideoProcessorDeviceCaps</a> method to get this value.
     * @returns {Integer} A pointer to an array of <b>D3DFORMAT</b> values. The <i>Count</i> parameter specifies the number of elements in the array. The method fills the array with a list of input formats.
     * @see https://docs.microsoft.com/windows/win32/api//dxvahd/nf-dxvahd-idxvahd_device-getvideoprocessorinputformats
     */
    GetVideoProcessorInputFormats(Count) {
        result := ComCall(6, this, "uint", Count, "uint*", &pFormats := 0, "HRESULT")
        return pFormats
    }

    /**
     * Gets the capabilities of one or more Microsoft DirectX Video Acceleration High Definition (DXVA-HD) video processors.
     * @param {Integer} Count The number of elements in the <i>pCaps</i> array. This parameter must equal the <b>VideoProcessorCount</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_vpdevcaps">DXVAHD_VPDEVCAPS</a> structure. Call the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nf-dxvahd-idxvahd_device-getvideoprocessordevicecaps">IDXVAHD_Device::GetVideoProcessorDeviceCaps</a> method to get this value.
     * @returns {DXVAHD_VPCAPS} A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_vpcaps">DXVAHD_VPCAPS</a> structures. The method fills the structures with the capabilities of the video processors supported by the driver.
     * @see https://docs.microsoft.com/windows/win32/api//dxvahd/nf-dxvahd-idxvahd_device-getvideoprocessorcaps
     */
    GetVideoProcessorCaps(Count) {
        pCaps := DXVAHD_VPCAPS()
        result := ComCall(7, this, "uint", Count, "ptr", pCaps, "HRESULT")
        return pCaps
    }

    /**
     * Gets a list of custom rates that a Microsoft DirectX Video Acceleration High Definition (DXVA-HD) video processor supports. Custom rates are used for frame-rate conversion and inverse telecine (IVTC).
     * @param {Pointer<Guid>} pVPGuid A GUID that identifies the video processor to query. This GUID must equal the valud of the <b>VPGuid</b> member from one of the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_vpcaps">DXVAHD_VPCAPS</a> structures retrieved by the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nf-dxvahd-idxvahd_device-getvideoprocessorcaps">IDXVAHD_Device::GetVideoProcessorCaps</a> method.
     * @param {Integer} Count The number of rates to retrieve. This parameter must equal the <b>CustomRateCount</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_vpcaps">DXVAHD_VPCAPS</a> structure for the video processor.
     * @returns {DXVAHD_CUSTOM_RATE_DATA} A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_custom_rate_data">DXVAHD_CUSTOM_RATE_DATA</a> structures. The <i>Count</i> parameter specifies the number of elements in the array. The method fills the array with a list of custom rates.
     * @see https://docs.microsoft.com/windows/win32/api//dxvahd/nf-dxvahd-idxvahd_device-getvideoprocessorcustomrates
     */
    GetVideoProcessorCustomRates(pVPGuid, Count) {
        pRates := DXVAHD_CUSTOM_RATE_DATA()
        result := ComCall(8, this, "ptr", pVPGuid, "uint", Count, "ptr", pRates, "HRESULT")
        return pRates
    }

    /**
     * Gets the range of values for an image filter that the Microsoft DirectX Video Acceleration High Definition (DXVA-HD) device supports.
     * @param {Integer} Filter The type of image filter, specified as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ne-dxvahd-dxvahd_filter">DXVAHD_FILTER</a> enumeration.
     * @returns {DXVAHD_FILTER_RANGE_DATA} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_filter_range_data">DXVAHD_FILTER_RANGE_DATA</a> structure. The method fills the structure with the range of values for the specified filter.
     * @see https://docs.microsoft.com/windows/win32/api//dxvahd/nf-dxvahd-idxvahd_device-getvideoprocessorfilterrange
     */
    GetVideoProcessorFilterRange(Filter) {
        pRange := DXVAHD_FILTER_RANGE_DATA()
        result := ComCall(9, this, "int", Filter, "ptr", pRange, "HRESULT")
        return pRange
    }

    /**
     * Creates a Microsoft DirectX Video Acceleration High Definition (DXVA-HD) video processor.
     * @param {Pointer<Guid>} pVPGuid A GUID that identifies the video processor to create. This GUID must equal the value of the <b>VPGuid</b> member from one of the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_vpcaps">DXVAHD_VPCAPS</a> structures retrieved by the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nf-dxvahd-idxvahd_device-getvideoprocessorcaps">IDXVAHD_Device::GetVideoProcessorCaps</a> method.
     * @returns {IDXVAHD_VideoProcessor} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nn-dxvahd-idxvahd_videoprocessor">IDXVAHD_VideoProcessor</a> interface. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//dxvahd/nf-dxvahd-idxvahd_device-createvideoprocessor
     */
    CreateVideoProcessor(pVPGuid) {
        result := ComCall(10, this, "ptr", pVPGuid, "ptr*", &ppVideoProcessor := 0, "HRESULT")
        return IDXVAHD_VideoProcessor(ppVideoProcessor)
    }
}
