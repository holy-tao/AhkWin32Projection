#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<D3D11_VIDEO_PROCESSOR_CONTENT_DESC>} pContentDesc 
     * @returns {HRESULT} 
     */
    GetVideoProcessorContentDesc(pContentDesc) {
        result := ComCall(7, this, "ptr", pContentDesc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Format 
     * @param {Pointer<UInt32>} pFlags 
     * @returns {HRESULT} 
     */
    CheckVideoProcessorFormat(Format, pFlags) {
        result := ComCall(8, this, "int", Format, "uint*", pFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D3D11_VIDEO_PROCESSOR_CAPS>} pCaps 
     * @returns {HRESULT} 
     */
    GetVideoProcessorCaps(pCaps) {
        result := ComCall(9, this, "ptr", pCaps, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} TypeIndex 
     * @param {Pointer<D3D11_VIDEO_PROCESSOR_RATE_CONVERSION_CAPS>} pCaps 
     * @returns {HRESULT} 
     */
    GetVideoProcessorRateConversionCaps(TypeIndex, pCaps) {
        result := ComCall(10, this, "uint", TypeIndex, "ptr", pCaps, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} TypeIndex 
     * @param {Integer} CustomRateIndex 
     * @param {Pointer<D3D11_VIDEO_PROCESSOR_CUSTOM_RATE>} pRate 
     * @returns {HRESULT} 
     */
    GetVideoProcessorCustomRate(TypeIndex, CustomRateIndex, pRate) {
        result := ComCall(11, this, "uint", TypeIndex, "uint", CustomRateIndex, "ptr", pRate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Filter 
     * @param {Pointer<D3D11_VIDEO_PROCESSOR_FILTER_RANGE>} pRange 
     * @returns {HRESULT} 
     */
    GetVideoProcessorFilterRange(Filter, pRange) {
        result := ComCall(12, this, "int", Filter, "ptr", pRange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
