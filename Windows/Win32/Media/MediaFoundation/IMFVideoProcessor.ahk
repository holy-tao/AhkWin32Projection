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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAvailableVideoProcessorModes", "GetVideoProcessorCaps", "GetVideoProcessorMode", "SetVideoProcessorMode", "GetProcAmpRange", "GetProcAmpValues", "SetProcAmpValues", "GetFilteringRange", "GetFilteringValue", "SetFilteringValue", "GetBackgroundColor", "SetBackgroundColor"]

    /**
     * 
     * @param {Pointer<Integer>} lpdwNumProcessingModes 
     * @param {Pointer<Pointer<Guid>>} ppVideoProcessingModes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/evr9/nf-evr9-imfvideoprocessor-getavailablevideoprocessormodes
     */
    GetAvailableVideoProcessorModes(lpdwNumProcessingModes, ppVideoProcessingModes) {
        lpdwNumProcessingModesMarshal := lpdwNumProcessingModes is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, lpdwNumProcessingModesMarshal, lpdwNumProcessingModes, "ptr*", ppVideoProcessingModes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} lpVideoProcessorMode 
     * @param {Pointer<DXVA2_VideoProcessorCaps>} lpVideoProcessorCaps 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/evr9/nf-evr9-imfvideoprocessor-getvideoprocessorcaps
     */
    GetVideoProcessorCaps(lpVideoProcessorMode, lpVideoProcessorCaps) {
        result := ComCall(4, this, "ptr", lpVideoProcessorMode, "ptr", lpVideoProcessorCaps, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} lpMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/evr9/nf-evr9-imfvideoprocessor-getvideoprocessormode
     */
    GetVideoProcessorMode(lpMode) {
        result := ComCall(5, this, "ptr", lpMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} lpMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/evr9/nf-evr9-imfvideoprocessor-setvideoprocessormode
     */
    SetVideoProcessorMode(lpMode) {
        result := ComCall(6, this, "ptr", lpMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwProperty 
     * @param {Pointer<DXVA2_ValueRange>} pPropRange 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/evr9/nf-evr9-imfvideoprocessor-getprocamprange
     */
    GetProcAmpRange(dwProperty, pPropRange) {
        result := ComCall(7, this, "uint", dwProperty, "ptr", pPropRange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Pointer<DXVA2_ProcAmpValues>} Values 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/evr9/nf-evr9-imfvideoprocessor-getprocampvalues
     */
    GetProcAmpValues(dwFlags, Values) {
        result := ComCall(8, this, "uint", dwFlags, "ptr", Values, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Pointer<DXVA2_ProcAmpValues>} pValues 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/evr9/nf-evr9-imfvideoprocessor-setprocampvalues
     */
    SetProcAmpValues(dwFlags, pValues) {
        result := ComCall(9, this, "uint", dwFlags, "ptr", pValues, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwProperty 
     * @param {Pointer<DXVA2_ValueRange>} pPropRange 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/evr9/nf-evr9-imfvideoprocessor-getfilteringrange
     */
    GetFilteringRange(dwProperty, pPropRange) {
        result := ComCall(10, this, "uint", dwProperty, "ptr", pPropRange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwProperty 
     * @param {Pointer<DXVA2_Fixed32>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/evr9/nf-evr9-imfvideoprocessor-getfilteringvalue
     */
    GetFilteringValue(dwProperty, pValue) {
        result := ComCall(11, this, "uint", dwProperty, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwProperty 
     * @param {Pointer<DXVA2_Fixed32>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/evr9/nf-evr9-imfvideoprocessor-setfilteringvalue
     */
    SetFilteringValue(dwProperty, pValue) {
        result := ComCall(12, this, "uint", dwProperty, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COLORREF>} lpClrBkg 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/evr9/nf-evr9-imfvideoprocessor-getbackgroundcolor
     */
    GetBackgroundColor(lpClrBkg) {
        result := ComCall(13, this, "ptr", lpClrBkg, "HRESULT")
        return result
    }

    /**
     * 
     * @param {COLORREF} ClrBkg 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/evr9/nf-evr9-imfvideoprocessor-setbackgroundcolor
     */
    SetBackgroundColor(ClrBkg) {
        result := ComCall(14, this, "uint", ClrBkg, "HRESULT")
        return result
    }
}
