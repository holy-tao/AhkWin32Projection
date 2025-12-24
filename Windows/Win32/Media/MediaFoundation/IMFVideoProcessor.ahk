#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\DXVA2_VideoProcessorCaps.ahk
#Include .\DXVA2_ValueRange.ahk
#Include .\DXVA2_ProcAmpValues.ahk
#Include .\DXVA2_Fixed32.ahk
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
     * Retrieves the video processor modes that the video driver supports.
     * @param {Pointer<Integer>} lpdwNumProcessingModes Receives the number of video processor modes.
     * @returns {Pointer<Guid>} Receives a pointer to an array of GUIDs. The number of elements in the array is returned in the <i>lpdwNumProcessingModes</i> parameter. The caller must release the memory for the array by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>. This parameter can be <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//evr9/nf-evr9-imfvideoprocessor-getavailablevideoprocessormodes
     */
    GetAvailableVideoProcessorModes(lpdwNumProcessingModes) {
        lpdwNumProcessingModesMarshal := lpdwNumProcessingModes is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, lpdwNumProcessingModesMarshal, lpdwNumProcessingModes, "ptr*", &ppVideoProcessingModes := 0, "HRESULT")
        return ppVideoProcessingModes
    }

    /**
     * Retrieves the capabilities of a video processor mode.
     * @param {Pointer<Guid>} lpVideoProcessorMode Pointer to a GUID that identifies the video processor mode. To get a list of available modes, call <a href="https://docs.microsoft.com/windows/desktop/api/evr9/nf-evr9-imfvideoprocessor-getavailablevideoprocessormodes">IMFVideoProcessor::GetAvailableVideoProcessorModes</a>.
     * @returns {DXVA2_VideoProcessorCaps} Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_videoprocessorcaps">DXVA2_VideoProcessorCaps</a> structure that receives the capabilities.
     * @see https://docs.microsoft.com/windows/win32/api//evr9/nf-evr9-imfvideoprocessor-getvideoprocessorcaps
     */
    GetVideoProcessorCaps(lpVideoProcessorMode) {
        lpVideoProcessorCaps := DXVA2_VideoProcessorCaps()
        result := ComCall(4, this, "ptr", lpVideoProcessorMode, "ptr", lpVideoProcessorCaps, "HRESULT")
        return lpVideoProcessorCaps
    }

    /**
     * Retrieves the application's preferred video processor mode. To set the preferred mode, call IMFVideoProcessor::SetVideoProcessorMode.
     * @returns {Guid} Receives a GUID that identifies the preferred video processor mode.
     * @see https://docs.microsoft.com/windows/win32/api//evr9/nf-evr9-imfvideoprocessor-getvideoprocessormode
     */
    GetVideoProcessorMode() {
        lpMode := Guid()
        result := ComCall(5, this, "ptr", lpMode, "HRESULT")
        return lpMode
    }

    /**
     * Sets the preferred video processor mode. The EVR will attempt to use this mode when playback starts.
     * @param {Pointer<Guid>} lpMode Pointer to a GUID that identifies the video processor mode. To get a list of available modes, call <a href="https://docs.microsoft.com/windows/desktop/api/evr9/nf-evr9-imfvideoprocessor-getavailablevideoprocessormodes">IMFVideoProcessor::GetAvailableVideoProcessorModes</a>.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>D3DERR_INVALIDCALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested mode is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_INVALIDREQUEST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The mixer has already allocated Direct3D resources and cannot change modes.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_TRANSFORM_TYPE_NOT_SET</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The media type for the reference stream is not set.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//evr9/nf-evr9-imfvideoprocessor-setvideoprocessormode
     */
    SetVideoProcessorMode(lpMode) {
        result := ComCall(6, this, "ptr", lpMode, "HRESULT")
        return result
    }

    /**
     * Retrieves the range of values for a color adjustment (ProcAmp) setting.
     * @param {Integer} dwProperty The ProcAmp setting to query. For a list of possible values, see <a href="https://docs.microsoft.com/windows/desktop/medfound/procamp-settings">ProcAmp Settings</a>.
     * @returns {DXVA2_ValueRange} Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_valuerange">DXVA2_ValueRange</a> structure that receives range of values for the specified ProcAmp setting.
     * @see https://docs.microsoft.com/windows/win32/api//evr9/nf-evr9-imfvideoprocessor-getprocamprange
     */
    GetProcAmpRange(dwProperty) {
        pPropRange := DXVA2_ValueRange()
        result := ComCall(7, this, "uint", dwProperty, "ptr", pPropRange, "HRESULT")
        return pPropRange
    }

    /**
     * Retrieves the current settings for one or more color adjustment (ProcAmp) settings.
     * @param {Integer} dwFlags Bitwise <b>OR</b> of one or more flags, specifying which operations to query. For a list of flags, see <a href="https://docs.microsoft.com/windows/desktop/medfound/procamp-settings">ProcAmp Settings</a>.
     * @returns {DXVA2_ProcAmpValues} Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_procampvalues">DXVA2_ProcAmpValues</a> structure. The method fills the structure with the current value of each operation specified in <i>dwFlags</i>.
     * @see https://docs.microsoft.com/windows/win32/api//evr9/nf-evr9-imfvideoprocessor-getprocampvalues
     */
    GetProcAmpValues(dwFlags) {
        Values := DXVA2_ProcAmpValues()
        result := ComCall(8, this, "uint", dwFlags, "ptr", Values, "HRESULT")
        return Values
    }

    /**
     * Sets one or more color adjustment (ProcAmp) settings.
     * @param {Integer} dwFlags Bitwise <b>OR</b> of one or more flags, specifying which ProcAmp values to set. For a list of flags, see <a href="https://docs.microsoft.com/windows/desktop/medfound/procamp-settings">ProcAmp Settings</a>.
     * @param {Pointer<DXVA2_ProcAmpValues>} pValues Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_procampvalues">DXVA2_ProcAmpValues</a> structure. For each flag that you set in <i>dwFlags</i>, set the corresponding structure member to the desired value. To get the valid range of values for each operation, call <a href="https://docs.microsoft.com/windows/desktop/api/evr9/nf-evr9-imfvideoprocessor-getprocamprange">IMFVideoProcessor::GetProcAmpRange</a>. The method ignores any structure members for which the corresponding flag is not set in <i>dwFlags</i>.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>dwFlags</i> parameter is invalid, or one or more values in <i>pValues</i> is not within the correct range.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_TRANSFORM_TYPE_NOT_SET</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The media type for the reference stream is not set.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//evr9/nf-evr9-imfvideoprocessor-setprocampvalues
     */
    SetProcAmpValues(dwFlags, pValues) {
        result := ComCall(9, this, "uint", dwFlags, "ptr", pValues, "HRESULT")
        return result
    }

    /**
     * Retrieves the range of values for a specified image filter setting.
     * @param {Integer} dwProperty The image filtering parameter to query. For a list of possible values, see <a href="https://docs.microsoft.com/windows/desktop/medfound/dxva-image-filter-settings">DXVA Image Filter Settings</a>.
     * @returns {DXVA2_ValueRange} Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_valuerange">DXVA2_ValueRange</a> structure that receives range of values for the specified image filtering parameter.
     * @see https://docs.microsoft.com/windows/win32/api//evr9/nf-evr9-imfvideoprocessor-getfilteringrange
     */
    GetFilteringRange(dwProperty) {
        pPropRange := DXVA2_ValueRange()
        result := ComCall(10, this, "uint", dwProperty, "ptr", pPropRange, "HRESULT")
        return pPropRange
    }

    /**
     * Retrieves the current setting for an image filter.
     * @param {Integer} dwProperty The filter setting to query. For a list of possible values, see <a href="https://docs.microsoft.com/windows/desktop/medfound/dxva-image-filter-settings">DXVA Image Filter Settings</a>.
     * @returns {DXVA2_Fixed32} Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_fixed32">DXVA2_Fixed32</a> structure that receives the current value.
     * @see https://docs.microsoft.com/windows/win32/api//evr9/nf-evr9-imfvideoprocessor-getfilteringvalue
     */
    GetFilteringValue(dwProperty) {
        pValue := DXVA2_Fixed32()
        result := ComCall(11, this, "uint", dwProperty, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * Sets a parameter for an image filter.
     * @param {Integer} dwProperty The image filtering parameter to set. For a list of possible values, see <a href="https://docs.microsoft.com/windows/desktop/medfound/dxva-image-filter-settings">DXVA Image Filter Settings</a>.
     * @param {Pointer<DXVA2_Fixed32>} pValue Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_fixed32">DXVA2_Fixed32</a> structure that specifies the new value. To get the valid range of values for each parameter, call <a href="https://docs.microsoft.com/windows/desktop/api/evr9/nf-evr9-imfvideoprocessor-getfilteringrange">IMFVideoProcessor::GetFilteringRange</a>.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value of <i>dwProperty</i> is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_TRANSFORM_TYPE_NOT_SET</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The media type for the reference stream is not set.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//evr9/nf-evr9-imfvideoprocessor-setfilteringvalue
     */
    SetFilteringValue(dwProperty, pValue) {
        result := ComCall(12, this, "uint", dwProperty, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * Retrieves the background color for the composition rectangle. The background color is used for letterboxing the video image.
     * @returns {COLORREF} Pointer to a <b>COLORREF</b> value that receives the background color.
     * @see https://docs.microsoft.com/windows/win32/api//evr9/nf-evr9-imfvideoprocessor-getbackgroundcolor
     */
    GetBackgroundColor() {
        result := ComCall(13, this, "uint*", &lpClrBkg := 0, "HRESULT")
        return lpClrBkg
    }

    /**
     * Sets the background color for the composition rectangle. The background color is used for letterboxing the video image.
     * @param {COLORREF} ClrBkg Background color, specified as a <b>COLORREF</b> value. Use the <b>RGB</b> macro to create this value.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//evr9/nf-evr9-imfvideoprocessor-setbackgroundcolor
     */
    SetBackgroundColor(ClrBkg) {
        result := ComCall(14, this, "uint", ClrBkg, "HRESULT")
        return result
    }
}
