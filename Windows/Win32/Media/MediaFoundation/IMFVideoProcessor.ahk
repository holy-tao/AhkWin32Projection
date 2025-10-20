#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Controls video processing in the Enhanced Video Renderer (EVR).
 * @remarks
 * 
  * This interface provides access to functionality that is implemented by the graphics driver. The driver provides one or more video processor <i>modes</i>, which are identified by GUID. Each mode has its own set of capabilities. The list of available modes might change depending on the media type of the video.
  * 
  * To use this interface, perform the following steps:
  * 
  * <ol>
  * <li>
  * Initialize the media types on the EVR input streams. (If you are using the Media Session, this occurs after the topology is resolved. Wait for the Media Session to send the <a href="https://docs.microsoft.com/windows/desktop/medfound/mesessiontopologystatus">MESessionTopologyStatus</a> event with a status value of MF_TOPOSTATUS_READY.)
  * 
  * </li>
  * <li>
  * Call <a href="https://docs.microsoft.com/windows/desktop/api/evr9/nf-evr9-imfvideoprocessor-getavailablevideoprocessormodes">IMFVideoProcessor::GetAvailableVideoProcessorModes</a> to get the list of video processor modes that are available.
  * 
  * </li>
  * <li>
  * Call <a href="https://docs.microsoft.com/windows/desktop/api/evr9/nf-evr9-imfvideoprocessor-getvideoprocessorcaps">IMFVideoProcessor::GetVideoProcessorCaps</a> to find the capabilities of each video processor mode.
  * 
  * </li>
  * <li>
  * Call <a href="https://docs.microsoft.com/windows/desktop/api/evr9/nf-evr9-imfvideoprocessor-setvideoprocessormode">IMFVideoProcessor::SetVideoProcessorMode</a> to select a mode. If you skip this step, the EVR automatically selects a video processor mode when streaming begins. In that case, wait for playback to start before continuing to step 5.
  * 
  * </li>
  * <li>
  * Call <a href="https://docs.microsoft.com/windows/desktop/api/evr9/nf-evr9-imfvideoprocessor-getprocamprange">IMFVideoProcessor::GetProcAmpRange</a> and <a href="https://docs.microsoft.com/windows/desktop/api/evr9/nf-evr9-imfvideoprocessor-getfilteringrange">IMFVideoProcessor::GetFilteringRange</a> to find the range of values for the various ProcAmp and image filter settings.
  * 
  * </li>
  * <li>
  * Call <a href="https://docs.microsoft.com/windows/desktop/api/evr9/nf-evr9-imfvideoprocessor-setprocampvalues">IMFVideoProcessor::SetProcAmpValues</a> and <a href="https://docs.microsoft.com/windows/desktop/api/evr9/nf-evr9-imfvideoprocessor-setfilteringvalue">IMFVideoProcessor::SetFilteringValue</a> to change the ProcAmp and image filter settings.
  * 
  * </li>
  * </ol>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//evr9/nn-evr9-imfvideoprocessor
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFVideoProcessor extends IUnknown{
    /**
     * The interface identifier for IMFVideoProcessor
     * @type {Guid}
     */
    static IID => Guid("{6ab0000c-fece-4d1f-a2ac-a9573530656e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UInt32>} lpdwNumProcessingModes 
     * @param {Pointer<Guid>} ppVideoProcessingModes 
     * @returns {HRESULT} 
     */
    GetAvailableVideoProcessorModes(lpdwNumProcessingModes, ppVideoProcessingModes) {
        result := ComCall(3, this, "uint*", lpdwNumProcessingModes, "ptr", ppVideoProcessingModes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} lpVideoProcessorMode 
     * @param {Pointer<DXVA2_VideoProcessorCaps>} lpVideoProcessorCaps 
     * @returns {HRESULT} 
     */
    GetVideoProcessorCaps(lpVideoProcessorMode, lpVideoProcessorCaps) {
        result := ComCall(4, this, "ptr", lpVideoProcessorMode, "ptr", lpVideoProcessorCaps, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} lpMode 
     * @returns {HRESULT} 
     */
    GetVideoProcessorMode(lpMode) {
        result := ComCall(5, this, "ptr", lpMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} lpMode 
     * @returns {HRESULT} 
     */
    SetVideoProcessorMode(lpMode) {
        result := ComCall(6, this, "ptr", lpMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwProperty 
     * @param {Pointer<DXVA2_ValueRange>} pPropRange 
     * @returns {HRESULT} 
     */
    GetProcAmpRange(dwProperty, pPropRange) {
        result := ComCall(7, this, "uint", dwProperty, "ptr", pPropRange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Pointer<DXVA2_ProcAmpValues>} Values 
     * @returns {HRESULT} 
     */
    GetProcAmpValues(dwFlags, Values) {
        result := ComCall(8, this, "uint", dwFlags, "ptr", Values, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Pointer<DXVA2_ProcAmpValues>} pValues 
     * @returns {HRESULT} 
     */
    SetProcAmpValues(dwFlags, pValues) {
        result := ComCall(9, this, "uint", dwFlags, "ptr", pValues, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwProperty 
     * @param {Pointer<DXVA2_ValueRange>} pPropRange 
     * @returns {HRESULT} 
     */
    GetFilteringRange(dwProperty, pPropRange) {
        result := ComCall(10, this, "uint", dwProperty, "ptr", pPropRange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwProperty 
     * @param {Pointer<DXVA2_Fixed32>} pValue 
     * @returns {HRESULT} 
     */
    GetFilteringValue(dwProperty, pValue) {
        result := ComCall(11, this, "uint", dwProperty, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwProperty 
     * @param {Pointer<DXVA2_Fixed32>} pValue 
     * @returns {HRESULT} 
     */
    SetFilteringValue(dwProperty, pValue) {
        result := ComCall(12, this, "uint", dwProperty, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<COLORREF>} lpClrBkg 
     * @returns {HRESULT} 
     */
    GetBackgroundColor(lpClrBkg) {
        result := ComCall(13, this, "ptr", lpClrBkg, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {COLORREF} ClrBkg 
     * @returns {HRESULT} 
     */
    SetBackgroundColor(ClrBkg) {
        result := ComCall(14, this, "uint", ClrBkg, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
