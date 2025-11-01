#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IDMOVideoOutputOptimizations interface supports video optimizations on a Microsoft DirectX Media Object (DMO).
 * @remarks
 * 
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
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mediaobj/nn-mediaobj-idmovideooutputoptimizations
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
     * 
     * @param {Integer} ulOutputStreamIndex 
     * @param {Pointer<Integer>} pdwRequestedCapabilities 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mediaobj/nf-mediaobj-idmovideooutputoptimizations-queryoperationmodepreferences
     */
    QueryOperationModePreferences(ulOutputStreamIndex, pdwRequestedCapabilities) {
        result := ComCall(3, this, "uint", ulOutputStreamIndex, "uint*", pdwRequestedCapabilities, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulOutputStreamIndex 
     * @param {Integer} dwEnabledFeatures 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mediaobj/nf-mediaobj-idmovideooutputoptimizations-setoperationmode
     */
    SetOperationMode(ulOutputStreamIndex, dwEnabledFeatures) {
        result := ComCall(4, this, "uint", ulOutputStreamIndex, "uint", dwEnabledFeatures, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulOutputStreamIndex 
     * @param {Pointer<Integer>} pdwEnabledFeatures 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mediaobj/nf-mediaobj-idmovideooutputoptimizations-getcurrentoperationmode
     */
    GetCurrentOperationMode(ulOutputStreamIndex, pdwEnabledFeatures) {
        result := ComCall(5, this, "uint", ulOutputStreamIndex, "uint*", pdwEnabledFeatures, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulOutputStreamIndex 
     * @param {Pointer<Integer>} pdwRequestedFeatures 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mediaobj/nf-mediaobj-idmovideooutputoptimizations-getcurrentsamplerequirements
     */
    GetCurrentSampleRequirements(ulOutputStreamIndex, pdwRequestedFeatures) {
        result := ComCall(6, this, "uint", ulOutputStreamIndex, "uint*", pdwRequestedFeatures, "HRESULT")
        return result
    }
}
