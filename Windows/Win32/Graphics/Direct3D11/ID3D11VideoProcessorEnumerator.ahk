#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D11DeviceChild.ahk" { ID3D11DeviceChild }
#Import ".\D3D11_VIDEO_PROCESSOR_FILTER.ahk" { D3D11_VIDEO_PROCESSOR_FILTER }
#Import ".\D3D11_VIDEO_PROCESSOR_FILTER_RANGE.ahk" { D3D11_VIDEO_PROCESSOR_FILTER_RANGE }
#Import ".\D3D11_VIDEO_PROCESSOR_RATE_CONVERSION_CAPS.ahk" { D3D11_VIDEO_PROCESSOR_RATE_CONVERSION_CAPS }
#Import ".\D3D11_VIDEO_PROCESSOR_CAPS.ahk" { D3D11_VIDEO_PROCESSOR_CAPS }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Dxgi\Common\DXGI_FORMAT.ahk" { DXGI_FORMAT }
#Import ".\D3D11_VIDEO_PROCESSOR_CUSTOM_RATE.ahk" { D3D11_VIDEO_PROCESSOR_CUSTOM_RATE }
#Import ".\D3D11_VIDEO_PROCESSOR_CONTENT_DESC.ahk" { D3D11_VIDEO_PROCESSOR_CONTENT_DESC }

/**
 * Enumerates the video processor capabilities of a Microsoft Direct3D 11 device. (ID3D11VideoProcessorEnumerator)
 * @remarks
 * To get a pointer to this interface, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-createvideoprocessorenumerator">ID3D11VideoDevice::CreateVideoProcessorEnumerator</a>.
 * 
 * To create an instance of the video processor, pass the <b>ID3D11VideoProcessorEnumerator</b> pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-createvideoprocessor">ID3D11VideoDevice::CreateVideoProcessor</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/nn-d3d11-id3d11videoprocessorenumerator
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct ID3D11VideoProcessorEnumerator extends ID3D11DeviceChild {
    /**
     * The interface identifier for ID3D11VideoProcessorEnumerator
     * @type {Guid}
     */
    static IID := Guid("{31627037-53ab-4200-9061-05faa9ab45f9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D11VideoProcessorEnumerator interfaces
    */
    struct Vtbl extends ID3D11DeviceChild.Vtbl {
        GetVideoProcessorContentDesc        : IntPtr
        CheckVideoProcessorFormat           : IntPtr
        GetVideoProcessorCaps               : IntPtr
        GetVideoProcessorRateConversionCaps : IntPtr
        GetVideoProcessorCustomRate         : IntPtr
        GetVideoProcessorFilterRange        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D11VideoProcessorEnumerator.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the content description that was used to create this enumerator.
     * @returns {D3D11_VIDEO_PROCESSOR_CONTENT_DESC} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_video_processor_content_desc">D3D11_VIDEO_PROCESSOR_CONTENT_DESC</a> structure that receives the content description.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videoprocessorenumerator-getvideoprocessorcontentdesc
     */
    GetVideoProcessorContentDesc() {
        pContentDesc := D3D11_VIDEO_PROCESSOR_CONTENT_DESC()
        result := ComCall(7, this, D3D11_VIDEO_PROCESSOR_CONTENT_DESC.Ptr, pContentDesc, "HRESULT")
        return pContentDesc
    }

    /**
     * Queries whether the video processor supports a specified video format.
     * @param {DXGI_FORMAT} Format The video format to query, specified as a <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a> value.
     * @returns {Integer} Receives a bitwise <b>OR</b> of zero or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_video_processor_format_support">D3D11_VIDEO_PROCESSOR_FORMAT_SUPPORT</a> enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videoprocessorenumerator-checkvideoprocessorformat
     */
    CheckVideoProcessorFormat(Format) {
        result := ComCall(8, this, DXGI_FORMAT, Format, "uint*", &pFlags := 0, "HRESULT")
        return pFlags
    }

    /**
     * Gets the capabilities of the video processor.
     * @returns {D3D11_VIDEO_PROCESSOR_CAPS} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_video_processor_caps">D3D11_VIDEO_PROCESSOR_CAPS</a> structure that receives the capabilities.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videoprocessorenumerator-getvideoprocessorcaps
     */
    GetVideoProcessorCaps() {
        pCaps := D3D11_VIDEO_PROCESSOR_CAPS()
        result := ComCall(9, this, D3D11_VIDEO_PROCESSOR_CAPS.Ptr, pCaps, "HRESULT")
        return pCaps
    }

    /**
     * Returns a group of video processor capabilities that are associated with frame-rate conversion, including deinterlacing and inverse telecine.
     * @remarks
     * The capabilities defined in the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_video_processor_rate_conversion_caps">D3D11_VIDEO_PROCESSOR_RATE_CONVERSION_CAPS</a> structure are interdependent. Therefore, the driver can support multiple, distinct groups of these capabilities.
     * @param {Integer} TypeIndex The zero-based index of the group to retrieve. To get the maximum index, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videoprocessorenumerator-getvideoprocessorcaps">ID3D11VideoProcessorEnumerator::GetVideoProcessorCaps</a> and check the <b>RateConversionCapsCount</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_video_processor_caps">D3D11_VIDEO_PROCESSOR_CAPS</a> structure.
     * @returns {D3D11_VIDEO_PROCESSOR_RATE_CONVERSION_CAPS} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_video_processor_rate_conversion_caps">D3D11_VIDEO_PROCESSOR_RATE_CONVERSION_CAPS</a> structure that receives the frame-rate conversion capabilities.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videoprocessorenumerator-getvideoprocessorrateconversioncaps
     */
    GetVideoProcessorRateConversionCaps(TypeIndex) {
        pCaps := D3D11_VIDEO_PROCESSOR_RATE_CONVERSION_CAPS()
        result := ComCall(10, this, "uint", TypeIndex, D3D11_VIDEO_PROCESSOR_RATE_CONVERSION_CAPS.Ptr, pCaps, "HRESULT")
        return pCaps
    }

    /**
     * Gets a list of custom frame rates that a video processor supports.
     * @param {Integer} TypeIndex The zero-based index of the frame-rate capability group. To get the maxmum index, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videoprocessorenumerator-getvideoprocessorcaps">ID3D11VideoProcessorEnumerator::GetVideoProcessorCaps </a> and check the <b>RateConversionCapsCount</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_video_processor_caps">D3D11_VIDEO_PROCESSOR_CAPS</a> structure.
     * @param {Integer} CustomRateIndex The zero-based index of the custom rate to retrieve. To get the maximum index, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videoprocessorenumerator-getvideoprocessorrateconversioncaps">ID3D11VideoProcessorEnumerator::GetVideoProcessorRateConversionCaps</a> and check the <b>CustomRateCount</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_video_processor_rate_conversion_caps">D3D11_VIDEO_PROCESSOR_RATE_CONVERSION_CAPS</a> structure.
     * 
     * This index value is always relative to the capability group specified in the <i>TypeIndex</i> parameter.
     * @returns {D3D11_VIDEO_PROCESSOR_CUSTOM_RATE} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_video_processor_custom_rate">D3D11_VIDEO_PROCESSOR_CUSTOM_RATE</a> structure that receives the custom rate.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videoprocessorenumerator-getvideoprocessorcustomrate
     */
    GetVideoProcessorCustomRate(TypeIndex, CustomRateIndex) {
        pRate := D3D11_VIDEO_PROCESSOR_CUSTOM_RATE()
        result := ComCall(11, this, "uint", TypeIndex, "uint", CustomRateIndex, D3D11_VIDEO_PROCESSOR_CUSTOM_RATE.Ptr, pRate, "HRESULT")
        return pRate
    }

    /**
     * Gets the range of values for an image filter.
     * @param {D3D11_VIDEO_PROCESSOR_FILTER} Filter The type of image filter, specified as a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_video_processor_filter">D3D11_VIDEO_PROCESSOR_FILTER</a> value.
     * @returns {D3D11_VIDEO_PROCESSOR_FILTER_RANGE} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_video_processor_filter_range">D3D11_VIDEO_PROCESSOR_FILTER_RANGE</a> structure. The method fills the structure with the range of values for the specified filter.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videoprocessorenumerator-getvideoprocessorfilterrange
     */
    GetVideoProcessorFilterRange(Filter) {
        pRange := D3D11_VIDEO_PROCESSOR_FILTER_RANGE()
        result := ComCall(12, this, D3D11_VIDEO_PROCESSOR_FILTER, Filter, D3D11_VIDEO_PROCESSOR_FILTER_RANGE.Ptr, pRange, "HRESULT")
        return pRange
    }

    Query(iid) {
        if (ID3D11VideoProcessorEnumerator.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetVideoProcessorContentDesc := CallbackCreate(GetMethod(implObj, "GetVideoProcessorContentDesc"), flags, 2)
        this.vtbl.CheckVideoProcessorFormat := CallbackCreate(GetMethod(implObj, "CheckVideoProcessorFormat"), flags, 3)
        this.vtbl.GetVideoProcessorCaps := CallbackCreate(GetMethod(implObj, "GetVideoProcessorCaps"), flags, 2)
        this.vtbl.GetVideoProcessorRateConversionCaps := CallbackCreate(GetMethod(implObj, "GetVideoProcessorRateConversionCaps"), flags, 3)
        this.vtbl.GetVideoProcessorCustomRate := CallbackCreate(GetMethod(implObj, "GetVideoProcessorCustomRate"), flags, 4)
        this.vtbl.GetVideoProcessorFilterRange := CallbackCreate(GetMethod(implObj, "GetVideoProcessorFilterRange"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetVideoProcessorContentDesc)
        CallbackFree(this.vtbl.CheckVideoProcessorFormat)
        CallbackFree(this.vtbl.GetVideoProcessorCaps)
        CallbackFree(this.vtbl.GetVideoProcessorRateConversionCaps)
        CallbackFree(this.vtbl.GetVideoProcessorCustomRate)
        CallbackFree(this.vtbl.GetVideoProcessorFilterRange)
    }
}
