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
     * 
     * @returns {D3D11_VIDEO_PROCESSOR_CONTENT_DESC} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videoprocessorenumerator-getvideoprocessorcontentdesc
     */
    GetVideoProcessorContentDesc() {
        pContentDesc := D3D11_VIDEO_PROCESSOR_CONTENT_DESC()
        result := ComCall(7, this, "ptr", pContentDesc, "HRESULT")
        return pContentDesc
    }

    /**
     * 
     * @param {Integer} Format 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videoprocessorenumerator-checkvideoprocessorformat
     */
    CheckVideoProcessorFormat(Format) {
        result := ComCall(8, this, "int", Format, "uint*", &pFlags := 0, "HRESULT")
        return pFlags
    }

    /**
     * 
     * @returns {D3D11_VIDEO_PROCESSOR_CAPS} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videoprocessorenumerator-getvideoprocessorcaps
     */
    GetVideoProcessorCaps() {
        pCaps := D3D11_VIDEO_PROCESSOR_CAPS()
        result := ComCall(9, this, "ptr", pCaps, "HRESULT")
        return pCaps
    }

    /**
     * 
     * @param {Integer} TypeIndex 
     * @returns {D3D11_VIDEO_PROCESSOR_RATE_CONVERSION_CAPS} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videoprocessorenumerator-getvideoprocessorrateconversioncaps
     */
    GetVideoProcessorRateConversionCaps(TypeIndex) {
        pCaps := D3D11_VIDEO_PROCESSOR_RATE_CONVERSION_CAPS()
        result := ComCall(10, this, "uint", TypeIndex, "ptr", pCaps, "HRESULT")
        return pCaps
    }

    /**
     * 
     * @param {Integer} TypeIndex 
     * @param {Integer} CustomRateIndex 
     * @returns {D3D11_VIDEO_PROCESSOR_CUSTOM_RATE} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videoprocessorenumerator-getvideoprocessorcustomrate
     */
    GetVideoProcessorCustomRate(TypeIndex, CustomRateIndex) {
        pRate := D3D11_VIDEO_PROCESSOR_CUSTOM_RATE()
        result := ComCall(11, this, "uint", TypeIndex, "uint", CustomRateIndex, "ptr", pRate, "HRESULT")
        return pRate
    }

    /**
     * 
     * @param {Integer} Filter 
     * @returns {D3D11_VIDEO_PROCESSOR_FILTER_RANGE} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videoprocessorenumerator-getvideoprocessorfilterrange
     */
    GetVideoProcessorFilterRange(Filter) {
        pRange := D3D11_VIDEO_PROCESSOR_FILTER_RANGE()
        result := ComCall(12, this, "int", Filter, "ptr", pRange, "HRESULT")
        return pRange
    }
}
