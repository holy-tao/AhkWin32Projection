#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D11DeviceChild.ahk

/**
 * Represents a video processor for Microsoft Direct3D 11.
 * @remarks
 * 
 * To get a pointer to this interface, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-createvideoprocessor">ID3D11VideoDevice::CreateVideoProcessor</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/nn-d3d11-id3d11videoprocessor
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3D11VideoProcessor extends ID3D11DeviceChild{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D11VideoProcessor
     * @type {Guid}
     */
    static IID => Guid("{1d7b0652-185f-41c6-85ce-0c5be3d4ae6c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetContentDesc", "GetRateConversionCaps"]

    /**
     * Gets the content description that was used to create the video processor.
     * @param {Pointer<D3D11_VIDEO_PROCESSOR_CONTENT_DESC>} pDesc A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_video_processor_content_desc">D3D11_VIDEO_PROCESSOR_CONTENT_DESC</a> structure that receives the content description.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videoprocessor-getcontentdesc
     */
    GetContentDesc(pDesc) {
        ComCall(7, this, "ptr", pDesc)
    }

    /**
     * Gets the rate conversion capabilities of the video processor.
     * @param {Pointer<D3D11_VIDEO_PROCESSOR_RATE_CONVERSION_CAPS>} pCaps A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_video_processor_rate_conversion_caps">D3D11_VIDEO_PROCESSOR_RATE_CONVERSION_CAPS</a> structure that receives the rate conversion capabilities.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videoprocessor-getrateconversioncaps
     */
    GetRateConversionCaps(pCaps) {
        ComCall(8, this, "ptr", pCaps)
    }
}
