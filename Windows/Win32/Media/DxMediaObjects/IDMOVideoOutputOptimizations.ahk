#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IDMOVideoOutputOptimizations interface supports video optimizations on a Microsoft DirectX Media Object (DMO).
 * @remarks
 * This interface enables an application to negotiate with a DMO about video output optimizations. A DMO exposes this interface when it can perform optimizations that require support from the application. The application can query the DMO for its preferred features, and then agree (or not agree) to provide them. The DMO must process output even if the application rejects the optimizations.
 * 
 * For example, a video decoder might generate an output frame by applying deltas to the previous output frame. When queried, it requests that the application supply the previous frame in the output buffer. The application can agree to this request or not.
 * 
 * Video optimizations are negotiated separately for each output stream.
 * 
 * The following pseudo-code shows how an application might negotiate with the DMO:
 * 
 * 
 * ```
 * IDMOVideoOutputOptimizations *pVidOpt;
 * // Query the DMO for IDMOVideoOutputOptimizations (not shown).
 * 
 * BOOL  bWantsPreviousBuffer = FALSE;
 * DWORD wFlags;
 * pVidOpt->QueryOperationModePreferences(0,&dwFlags);
 * 
 * if (dwFlags & DMO_VOSF_NEEDS_PREVIOUS_SAMPLE) 
 * {
 *     // Agree to the request.      
 *     pVidOpt->SetOperationMode(0, DMO_VOSF_NEEDS_PREVIOUS_SAMPLE);
 *     bWantsPreviousBuffer = TRUE;
 * }
 * 
 * // Processing loop
 * while (there is input).
 * {
 *     ProcessInput(0, ...);
 *     if (bWantsPreviousBuffer)
 *         pDMO->ProcessOutput(0, ...) // Use the same buffer as last time.
 *     else
 *         pDMO->ProcessOutput(0, ...) // OK to use a new buffer.
 * }
 * ```
 * @see https://learn.microsoft.com/windows/win32/api//content/mediaobj/nn-mediaobj-idmovideooutputoptimizations
 * @namespace Windows.Win32.Media.DxMediaObjects
 * @version v4.0.30319
 */
class IDMOVideoOutputOptimizations extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDMOVideoOutputOptimizations
     * @type {Guid}
     */
    static IID => Guid("{be8f4f4e-5b16-4d29-b350-7f6b5d9298ac}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QueryOperationModePreferences", "SetOperationMode", "GetCurrentOperationMode", "GetCurrentSampleRequirements"]

    /**
     * The QueryOperationModePreferences method retrieves the DMO's preferred optimization features.
     * @param {Integer} ulOutputStreamIndex Zero-based index of an output stream on the DMO.
     * @returns {Integer} Pointer to a variable that receives the DMO's requested features. The returned value is a bitwise combination of zero or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/mediaobj/ne-mediaobj-_dmo_video_output_stream_flags">DMO_VIDEO_OUTPUT_STREAM_FLAGS</a> enumeration.
     * @see https://learn.microsoft.com/windows/win32/api//content/mediaobj/nf-mediaobj-idmovideooutputoptimizations-queryoperationmodepreferences
     */
    QueryOperationModePreferences(ulOutputStreamIndex) {
        result := ComCall(3, this, "uint", ulOutputStreamIndex, "uint*", &pdwRequestedCapabilities := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pdwRequestedCapabilities
    }

    /**
     * The SetOperationMode method notifies the DMO of the optimization features that are in effect.
     * @remarks
     * Before calling this method, call the <a href="https://docs.microsoft.com/windows/desktop/api/mediaobj/nf-mediaobj-idmovideooutputoptimizations-queryoperationmodepreferences">IDMOVideoOutputOptimizations::QueryOperationModePreferences</a> method to determine which features the DMO requests. Then call this method to inform the DMO which of those features you are providing. If you are not providing any of them, it is not necessary to call this method. The DMO does not assume that any of them will be provided.
     * 
     * The application must provide all the features it has agreed to. For some features, however, the DMO might not require the feature on every sample. To determine if the DMO can dispense with any features on the next sample, call the <a href="https://docs.microsoft.com/windows/desktop/api/mediaobj/nf-mediaobj-idmovideooutputoptimizations-getcurrentsamplerequirements">IDMOVideoOutputOptimizations::GetCurrentSampleRequirements</a> method. In effect, this enables the DMO to waive an agreed-upon feature for one sample.
     * 
     * Before streaming begins, subsequent calls to this method override earlier calls. To set multiple features, you must do so in a single method call. Once streaming begins, this method returns an error. Streaming begins when the applications calls <a href="https://docs.microsoft.com/windows/desktop/api/mediaobj/nf-mediaobj-imediaobject-processinput">IMediaObject::ProcessInput</a> on at least one input stream.
     * 
     * When streaming ends, the application can renegotiate the features. Streaming ends if the application calls the <a href="https://docs.microsoft.com/windows/desktop/api/mediaobj/nf-mediaobj-imediaobject-flush">IMediaObject::Flush</a> method, or if the application calls <a href="https://docs.microsoft.com/windows/desktop/api/mediaobj/nf-mediaobj-imediaobject-discontinuity">IMediaObject::Discontinuity</a> on all the input streams and then processes all of the remaining output.
     * @param {Integer} ulOutputStreamIndex Zero-based index of an output stream on the DMO.
     * @param {Integer} dwEnabledFeatures Bitwise combination of zero or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/mediaobj/ne-mediaobj-_dmo_video_output_stream_flags">DMO_VIDEO_OUTPUT_STREAM_FLAGS</a> enumeration.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DMO_E_INVALIDSTREAMINDEX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid stream index
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
     * Invalid argument
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/mediaobj/nf-mediaobj-idmovideooutputoptimizations-setoperationmode
     */
    SetOperationMode(ulOutputStreamIndex, dwEnabledFeatures) {
        result := ComCall(4, this, "uint", ulOutputStreamIndex, "uint", dwEnabledFeatures, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetCurrentOperationMode method retrieves the optimization features in effect.
     * @param {Integer} ulOutputStreamIndex Zero-based index of an output stream on the DMO.
     * @returns {Integer} Pointer to a variable that receives the current features. The returned value is a bitwise combination of zero or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/mediaobj/ne-mediaobj-_dmo_video_output_stream_flags">DMO_VIDEO_OUTPUT_STREAM_FLAGS</a> enumeration.
     * @see https://learn.microsoft.com/windows/win32/api//content/mediaobj/nf-mediaobj-idmovideooutputoptimizations-getcurrentoperationmode
     */
    GetCurrentOperationMode(ulOutputStreamIndex) {
        result := ComCall(5, this, "uint", ulOutputStreamIndex, "uint*", &pdwEnabledFeatures := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pdwEnabledFeatures
    }

    /**
     * The GetCurrentSampleRequirements method retrieves the optimization features required to process the next sample, given the features already agreed to by the application.
     * @remarks
     * After an application calls the <a href="https://docs.microsoft.com/windows/desktop/api/mediaobj/nf-mediaobj-idmovideooutputoptimizations-setoperationmode">IDMOVideoOutputOptimizations::SetOperationMode</a> method, it must provide all the features it has agreed to. However, the DMO might not require every feature on every sample. This method enables the DMO to waive an agreed-upon feature for one sample.
     * 
     * Before processing a sample, the application can call this method. If the DMO does not require a given feature in order to process the next sample, it omits the corresponding flag from the <i>pdwRequestedFeatures</i> parameter. For the next sample only, the application can ignore the feature. The results of this method are valid only for the next call to the <a href="https://docs.microsoft.com/windows/desktop/api/mediaobj/nf-mediaobj-imediaobject-processoutput">IMediaObject::ProcessOutput</a> method.
     * 
     * The DMO will return only the flags that were agreed to in the <b>SetOperationMode</b> method. In other words, you cannot dynamically enable new features with this method.
     * @param {Integer} ulOutputStreamIndex Zero-based index of an output stream on the DMO.
     * @returns {Integer} Pointer to a variable that receives the required features. The returned value is a bitwise combination of zero or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/mediaobj/ne-mediaobj-_dmo_video_output_stream_flags">DMO_VIDEO_OUTPUT_STREAM_FLAGS</a> enumeration.
     * @see https://learn.microsoft.com/windows/win32/api//content/mediaobj/nf-mediaobj-idmovideooutputoptimizations-getcurrentsamplerequirements
     */
    GetCurrentSampleRequirements(ulOutputStreamIndex) {
        result := ComCall(6, this, "uint", ulOutputStreamIndex, "uint*", &pdwRequestedFeatures := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pdwRequestedFeatures
    }
}
