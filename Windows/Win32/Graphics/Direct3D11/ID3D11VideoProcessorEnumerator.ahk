#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\D3D11_VIDEO_PROCESSOR_CONTENT_DESC.ahk
#Include .\D3D11_VIDEO_PROCESSOR_CAPS.ahk
#Include .\D3D11_VIDEO_PROCESSOR_RATE_CONVERSION_CAPS.ahk
#Include .\D3D11_VIDEO_PROCESSOR_CUSTOM_RATE.ahk
#Include .\D3D11_VIDEO_PROCESSOR_FILTER_RANGE.ahk
#Include .\ID3D11DeviceChild.ahk

/**
 * Enumerates the video processor capabilities of a Microsoft Direct3D 11 device.
 * @remarks
 * 
 * To get a pointer to this interface, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-createvideoprocessorenumerator">ID3D11VideoDevice::CreateVideoProcessorEnumerator</a>.
 * 
 * To create an instance of the video processor, pass the <b>ID3D11VideoProcessorEnumerator</b> pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-createvideoprocessor">ID3D11VideoDevice::CreateVideoProcessor</a> method.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/nn-d3d11-id3d11videoprocessorenumerator
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3D11VideoProcessorEnumerator extends ID3D11DeviceChild{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D11VideoProcessorEnumerator
     * @type {Guid}
     */
    static IID => Guid("{31627037-53ab-4200-9061-05faa9ab45f9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetVideoProcessorContentDesc", "CheckVideoProcessorFormat", "GetVideoProcessorCaps", "GetVideoProcessorRateConversionCaps", "GetVideoProcessorCustomRate", "GetVideoProcessorFilterRange"]

    /**
     * Gets the content description that was used to create this enumerator.
     * @returns {D3D11_VIDEO_PROCESSOR_CONTENT_DESC} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_video_processor_content_desc">D3D11_VIDEO_PROCESSOR_CONTENT_DESC</a> structure that receives the content description.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videoprocessorenumerator-getvideoprocessorcontentdesc
     */
    GetVideoProcessorContentDesc() {
        pContentDesc := D3D11_VIDEO_PROCESSOR_CONTENT_DESC()
        result := ComCall(7, this, "ptr", pContentDesc, "HRESULT")
        return pContentDesc
    }

    /**
     * Queries whether the video processor supports a specified video format.
     * @param {Integer} Format The video format to query, specified as a <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a> value.
     * @returns {Integer} Receives a bitwise <b>OR</b> of zero or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_video_processor_format_support">D3D11_VIDEO_PROCESSOR_FORMAT_SUPPORT</a> enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videoprocessorenumerator-checkvideoprocessorformat
     */
    CheckVideoProcessorFormat(Format) {
        result := ComCall(8, this, "int", Format, "uint*", &pFlags := 0, "HRESULT")
        return pFlags
    }

    /**
     * Gets the capabilities of the video processor.
     * @returns {D3D11_VIDEO_PROCESSOR_CAPS} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_video_processor_caps">D3D11_VIDEO_PROCESSOR_CAPS</a> structure that receives the capabilities.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videoprocessorenumerator-getvideoprocessorcaps
     */
    GetVideoProcessorCaps() {
        pCaps := D3D11_VIDEO_PROCESSOR_CAPS()
        result := ComCall(9, this, "ptr", pCaps, "HRESULT")
        return pCaps
    }

    /**
     * Returns a group of video processor capabilities that are associated with frame-rate conversion, including deinterlacing and inverse telecine.
     * @param {Integer} TypeIndex The zero-based index of the group to retrieve. To get the maximum index, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videoprocessorenumerator-getvideoprocessorcaps">ID3D11VideoProcessorEnumerator::GetVideoProcessorCaps</a> and check the <b>RateConversionCapsCount</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_video_processor_caps">D3D11_VIDEO_PROCESSOR_CAPS</a> structure.
     * @returns {D3D11_VIDEO_PROCESSOR_RATE_CONVERSION_CAPS} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_video_processor_rate_conversion_caps">D3D11_VIDEO_PROCESSOR_RATE_CONVERSION_CAPS</a> structure that receives the frame-rate conversion capabilities.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videoprocessorenumerator-getvideoprocessorrateconversioncaps
     */
    GetVideoProcessorRateConversionCaps(TypeIndex) {
        pCaps := D3D11_VIDEO_PROCESSOR_RATE_CONVERSION_CAPS()
        result := ComCall(10, this, "uint", TypeIndex, "ptr", pCaps, "HRESULT")
        return pCaps
    }

    /**
     * Gets a list of custom frame rates that a video processor supports.
     * @param {Integer} TypeIndex The zero-based index of the frame-rate capability group. To get the maxmum index, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videoprocessorenumerator-getvideoprocessorcaps">ID3D11VideoProcessorEnumerator::GetVideoProcessorCaps </a> and check the <b>RateConversionCapsCount</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_video_processor_caps">D3D11_VIDEO_PROCESSOR_CAPS</a> structure.
     * @param {Integer} CustomRateIndex The zero-based index of the custom rate to retrieve. To get the maximum index, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videoprocessorenumerator-getvideoprocessorrateconversioncaps">ID3D11VideoProcessorEnumerator::GetVideoProcessorRateConversionCaps</a> and check the <b>CustomRateCount</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_video_processor_rate_conversion_caps">D3D11_VIDEO_PROCESSOR_RATE_CONVERSION_CAPS</a> structure.
     * 
     * This index value is always relative to the capability group specified in the <i>TypeIndex</i> parameter.
     * @returns {D3D11_VIDEO_PROCESSOR_CUSTOM_RATE} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_video_processor_custom_rate">D3D11_VIDEO_PROCESSOR_CUSTOM_RATE</a> structure that receives the custom rate.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videoprocessorenumerator-getvideoprocessorcustomrate
     */
    GetVideoProcessorCustomRate(TypeIndex, CustomRateIndex) {
        pRate := D3D11_VIDEO_PROCESSOR_CUSTOM_RATE()
        result := ComCall(11, this, "uint", TypeIndex, "uint", CustomRateIndex, "ptr", pRate, "HRESULT")
        return pRate
    }

    /**
     * Gets the range of values for an image filter.
     * @param {Integer} Filter The type of image filter, specified as a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_video_processor_filter">D3D11_VIDEO_PROCESSOR_FILTER</a> value.
     * @returns {D3D11_VIDEO_PROCESSOR_FILTER_RANGE} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_video_processor_filter_range">D3D11_VIDEO_PROCESSOR_FILTER_RANGE</a> structure. The method fills the structure with the range of values for the specified filter.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videoprocessorenumerator-getvideoprocessorfilterrange
     */
    GetVideoProcessorFilterRange(Filter) {
        pRange := D3D11_VIDEO_PROCESSOR_FILTER_RANGE()
        result := ComCall(12, this, "int", Filter, "ptr", pRange, "HRESULT")
        return pRange
    }
}
