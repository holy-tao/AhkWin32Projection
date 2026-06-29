#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Graphics\Direct3D9\D3DPOOL.ahk" { D3DPOOL }
#Import ".\DXVAHD_FILTER_RANGE_DATA.ahk" { DXVAHD_FILTER_RANGE_DATA }
#Import ".\IDXVAHD_VideoProcessor.ahk" { IDXVAHD_VideoProcessor }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Graphics\Direct3D9\D3DFORMAT.ahk" { D3DFORMAT }
#Import ".\DXVAHD_CUSTOM_RATE_DATA.ahk" { DXVAHD_CUSTOM_RATE_DATA }
#Import "..\..\Graphics\Direct3D9\IDirect3DSurface9.ahk" { IDirect3DSurface9 }
#Import ".\DXVAHD_FILTER.ahk" { DXVAHD_FILTER }
#Import ".\DXVAHD_SURFACE_TYPE.ahk" { DXVAHD_SURFACE_TYPE }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\DXVAHD_VPDEVCAPS.ahk" { DXVAHD_VPDEVCAPS }
#Import ".\DXVAHD_VPCAPS.ahk" { DXVAHD_VPCAPS }

/**
 * Represents a Microsoft DirectX Video Acceleration High Definition (DXVA-HD) device.
 * @see https://learn.microsoft.com/windows/win32/api/dxvahd/nn-dxvahd-idxvahd_device
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IDXVAHD_Device extends IUnknown {
    /**
     * The interface identifier for IDXVAHD_Device
     * @type {Guid}
     */
    static IID := Guid("{95f12dfd-d77e-49be-815f-57d579634d6d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDXVAHD_Device interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateVideoSurface             : IntPtr
        GetVideoProcessorDeviceCaps    : IntPtr
        GetVideoProcessorOutputFormats : IntPtr
        GetVideoProcessorInputFormats  : IntPtr
        GetVideoProcessorCaps          : IntPtr
        GetVideoProcessorCustomRates   : IntPtr
        GetVideoProcessorFilterRange   : IntPtr
        CreateVideoProcessor           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDXVAHD_Device.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates one or more Microsoft Direct3D video surfaces.
     * @param {Integer} Width The width of each surface, in pixels.
     * @param {Integer} Height The height of each surface, in pixels.
     * @param {D3DFORMAT} Format The pixel format, specified as a <b>D3DFORMAT</b> value or FOURCC code. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/video-fourccs">Video FOURCCs</a>.
     * @param {D3DPOOL} Pool The memory pool in which the surface is  created. This parameter must equal the <b>InputPool</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_vpdevcaps">DXVAHD_VPDEVCAPS</a> structure. Call the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nf-dxvahd-idxvahd_device-getvideoprocessordevicecaps">IDXVAHD_Device::GetVideoProcessorDeviceCaps</a> method to get this value.
     * @param {Integer} Usage Reserved. Set to 0.
     * @param {DXVAHD_SURFACE_TYPE} Type The type of surface to create, specified as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ne-dxvahd-dxvahd_surface_type">DXVAHD_SURFACE_TYPE</a> enumeration.
     * @param {Integer} NumSurfaces The number of surfaces to create.
     * @param {Pointer<HANDLE>} pSharedHandle Reserved. Set to <b>NULL</b>.
     * @returns {IDirect3DSurface9} A pointer to an array of <b>IDirect3DSurface9</b> pointers. The <i>NumSurfaces</i> parameter specifies the number of elements in the array. The method fills the array with pointers to the new video surfaces. The caller must release the pointers.
     * @see https://learn.microsoft.com/windows/win32/api/dxvahd/nf-dxvahd-idxvahd_device-createvideosurface
     */
    CreateVideoSurface(Width, Height, Format, Pool, Usage, Type, NumSurfaces, pSharedHandle) {
        result := ComCall(3, this, "uint", Width, "uint", Height, D3DFORMAT, Format, D3DPOOL, Pool, "uint", Usage, DXVAHD_SURFACE_TYPE, Type, "uint", NumSurfaces, "ptr*", &ppSurfaces := 0, HANDLE.Ptr, pSharedHandle, "HRESULT")
        return IDirect3DSurface9(ppSurfaces)
    }

    /**
     * Gets the capabilities of the Microsoft DirectX Video Acceleration High Definition (DXVA-HD) device.
     * @returns {DXVAHD_VPDEVCAPS} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_vpdevcaps">DXVAHD_VPDEVCAPS</a> structure that receives the device capabilities.
     * @see https://learn.microsoft.com/windows/win32/api/dxvahd/nf-dxvahd-idxvahd_device-getvideoprocessordevicecaps
     */
    GetVideoProcessorDeviceCaps() {
        pCaps := DXVAHD_VPDEVCAPS()
        result := ComCall(4, this, DXVAHD_VPDEVCAPS.Ptr, pCaps, "HRESULT")
        return pCaps
    }

    /**
     * Gets a list of the output formats supported by the Microsoft DirectX Video Acceleration High Definition (DXVA-HD) device.
     * @remarks
     * The list of formats can include both <b>D3DFORMAT</b> values, such as <b>D3DFMT_X8R8G8B8</b>, and FOURCC codes, such as 'NV12'. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/video-fourccs">Video FOURCCs</a>.
     * @param {Integer} Count The number of formats to retrieve. This parameter must equal the <b>OutputFormatCount</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_vpdevcaps">DXVAHD_VPDEVCAPS</a> structure. Call the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nf-dxvahd-idxvahd_device-getvideoprocessordevicecaps">IDXVAHD_Device::GetVideoProcessorDeviceCaps</a> method to get this value.
     * @returns {D3DFORMAT} A pointer to an array of <b>D3DFORMAT</b> values. The <i>Count</i> parameter specifies the number of elements in the array. The method fills the array with a list of output formats.
     * @see https://learn.microsoft.com/windows/win32/api/dxvahd/nf-dxvahd-idxvahd_device-getvideoprocessoroutputformats
     */
    GetVideoProcessorOutputFormats(Count) {
        result := ComCall(5, this, "uint", Count, "uint*", &pFormats := 0, "HRESULT")
        return pFormats
    }

    /**
     * Gets a list of the input formats supported by the Microsoft DirectX Video Acceleration High Definition (DXVA-HD) device.
     * @remarks
     * The list of formats can include both <b>D3DFORMAT</b> values, such as <b>D3DFMT_X8R8G8B8</b>, and FOURCC codes, such as 'NV12'. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/video-fourccs">Video FOURCCs</a>.
     * @param {Integer} Count The number of formats to retrieve. This parameter must equal the <b>InputFormatCount</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_vpdevcaps">DXVAHD_VPDEVCAPS</a> structure. Call the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nf-dxvahd-idxvahd_device-getvideoprocessordevicecaps">IDXVAHD_Device::GetVideoProcessorDeviceCaps</a> method to get this value.
     * @returns {D3DFORMAT} A pointer to an array of <b>D3DFORMAT</b> values. The <i>Count</i> parameter specifies the number of elements in the array. The method fills the array with a list of input formats.
     * @see https://learn.microsoft.com/windows/win32/api/dxvahd/nf-dxvahd-idxvahd_device-getvideoprocessorinputformats
     */
    GetVideoProcessorInputFormats(Count) {
        result := ComCall(6, this, "uint", Count, "uint*", &pFormats := 0, "HRESULT")
        return pFormats
    }

    /**
     * Gets the capabilities of one or more Microsoft DirectX Video Acceleration High Definition (DXVA-HD) video processors.
     * @param {Integer} Count The number of elements in the <i>pCaps</i> array. This parameter must equal the <b>VideoProcessorCount</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_vpdevcaps">DXVAHD_VPDEVCAPS</a> structure. Call the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nf-dxvahd-idxvahd_device-getvideoprocessordevicecaps">IDXVAHD_Device::GetVideoProcessorDeviceCaps</a> method to get this value.
     * @returns {DXVAHD_VPCAPS} A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_vpcaps">DXVAHD_VPCAPS</a> structures. The method fills the structures with the capabilities of the video processors supported by the driver.
     * @see https://learn.microsoft.com/windows/win32/api/dxvahd/nf-dxvahd-idxvahd_device-getvideoprocessorcaps
     */
    GetVideoProcessorCaps(Count) {
        pCaps := DXVAHD_VPCAPS()
        result := ComCall(7, this, "uint", Count, DXVAHD_VPCAPS.Ptr, pCaps, "HRESULT")
        return pCaps
    }

    /**
     * Gets a list of custom rates that a Microsoft DirectX Video Acceleration High Definition (DXVA-HD) video processor supports. Custom rates are used for frame-rate conversion and inverse telecine (IVTC).
     * @param {Pointer<Guid>} pVPGuid A GUID that identifies the video processor to query. This GUID must equal the value of the <b>VPGuid</b> member from one of the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_vpcaps">DXVAHD_VPCAPS</a> structures retrieved by the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nf-dxvahd-idxvahd_device-getvideoprocessorcaps">IDXVAHD_Device::GetVideoProcessorCaps</a> method.
     * @param {Integer} Count The number of rates to retrieve. This parameter must equal the <b>CustomRateCount</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_vpcaps">DXVAHD_VPCAPS</a> structure for the video processor.
     * @returns {DXVAHD_CUSTOM_RATE_DATA} A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_custom_rate_data">DXVAHD_CUSTOM_RATE_DATA</a> structures. The <i>Count</i> parameter specifies the number of elements in the array. The method fills the array with a list of custom rates.
     * @see https://learn.microsoft.com/windows/win32/api/dxvahd/nf-dxvahd-idxvahd_device-getvideoprocessorcustomrates
     */
    GetVideoProcessorCustomRates(pVPGuid, Count) {
        pRates := DXVAHD_CUSTOM_RATE_DATA()
        result := ComCall(8, this, Guid.Ptr, pVPGuid, "uint", Count, DXVAHD_CUSTOM_RATE_DATA.Ptr, pRates, "HRESULT")
        return pRates
    }

    /**
     * Gets the range of values for an image filter that the Microsoft DirectX Video Acceleration High Definition (DXVA-HD) device supports.
     * @remarks
     * To find out which image filters the device supports, check the <b>FilterCaps</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_vpdevcaps">DXVAHD_VPDEVCAPS</a> structure. Call the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nf-dxvahd-idxvahd_device-getvideoprocessordevicecaps">IDXVAHD_Device::GetVideoProcessorDeviceCaps</a> method to get this value.
     * @param {DXVAHD_FILTER} Filter The type of image filter, specified as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ne-dxvahd-dxvahd_filter">DXVAHD_FILTER</a> enumeration.
     * @returns {DXVAHD_FILTER_RANGE_DATA} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_filter_range_data">DXVAHD_FILTER_RANGE_DATA</a> structure. The method fills the structure with the range of values for the specified filter.
     * @see https://learn.microsoft.com/windows/win32/api/dxvahd/nf-dxvahd-idxvahd_device-getvideoprocessorfilterrange
     */
    GetVideoProcessorFilterRange(Filter) {
        pRange := DXVAHD_FILTER_RANGE_DATA()
        result := ComCall(9, this, DXVAHD_FILTER, Filter, DXVAHD_FILTER_RANGE_DATA.Ptr, pRange, "HRESULT")
        return pRange
    }

    /**
     * Creates a Microsoft DirectX Video Acceleration High Definition (DXVA-HD) video processor.
     * @param {Pointer<Guid>} pVPGuid A GUID that identifies the video processor to create. This GUID must equal the value of the <b>VPGuid</b> member from one of the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_vpcaps">DXVAHD_VPCAPS</a> structures retrieved by the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nf-dxvahd-idxvahd_device-getvideoprocessorcaps">IDXVAHD_Device::GetVideoProcessorCaps</a> method.
     * @returns {IDXVAHD_VideoProcessor} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nn-dxvahd-idxvahd_videoprocessor">IDXVAHD_VideoProcessor</a> interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/dxvahd/nf-dxvahd-idxvahd_device-createvideoprocessor
     */
    CreateVideoProcessor(pVPGuid) {
        result := ComCall(10, this, Guid.Ptr, pVPGuid, "ptr*", &ppVideoProcessor := 0, "HRESULT")
        return IDXVAHD_VideoProcessor(ppVideoProcessor)
    }

    Query(iid) {
        if (IDXVAHD_Device.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateVideoSurface := CallbackCreate(GetMethod(implObj, "CreateVideoSurface"), flags, 10)
        this.vtbl.GetVideoProcessorDeviceCaps := CallbackCreate(GetMethod(implObj, "GetVideoProcessorDeviceCaps"), flags, 2)
        this.vtbl.GetVideoProcessorOutputFormats := CallbackCreate(GetMethod(implObj, "GetVideoProcessorOutputFormats"), flags, 3)
        this.vtbl.GetVideoProcessorInputFormats := CallbackCreate(GetMethod(implObj, "GetVideoProcessorInputFormats"), flags, 3)
        this.vtbl.GetVideoProcessorCaps := CallbackCreate(GetMethod(implObj, "GetVideoProcessorCaps"), flags, 3)
        this.vtbl.GetVideoProcessorCustomRates := CallbackCreate(GetMethod(implObj, "GetVideoProcessorCustomRates"), flags, 4)
        this.vtbl.GetVideoProcessorFilterRange := CallbackCreate(GetMethod(implObj, "GetVideoProcessorFilterRange"), flags, 3)
        this.vtbl.CreateVideoProcessor := CallbackCreate(GetMethod(implObj, "CreateVideoProcessor"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateVideoSurface)
        CallbackFree(this.vtbl.GetVideoProcessorDeviceCaps)
        CallbackFree(this.vtbl.GetVideoProcessorOutputFormats)
        CallbackFree(this.vtbl.GetVideoProcessorInputFormats)
        CallbackFree(this.vtbl.GetVideoProcessorCaps)
        CallbackFree(this.vtbl.GetVideoProcessorCustomRates)
        CallbackFree(this.vtbl.GetVideoProcessorFilterRange)
        CallbackFree(this.vtbl.CreateVideoProcessor)
    }
}
