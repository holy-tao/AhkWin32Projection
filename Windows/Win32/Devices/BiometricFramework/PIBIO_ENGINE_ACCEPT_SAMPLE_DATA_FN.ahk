#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Accepts a raw biometric sample and extracts a feature set.
 * @remarks
 * The feature set created by calling this function is retained in the biometric unit pipeline after the function returns. It replaces any previous feature set.
 * 
 * The sensor adapter implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_push_data_to_engine_fn">SensorAdapterPushDataToEngine</a> function should use the following wrapper function (defined in Winbio_adapter.h) to call <i>EngineAdapterAcceptSampleData</i>:
 * 
 * 
 * ```cpp
 * HRESULT WbioEngineAcceptSampleData(
 * __inout PWINBIO_PIPELINE Pipeline,
 * __in PWINBIO_BIR SampleBuffer,
 * __in SIZE_T SampleSize,
 * __in WINBIO_BIR_PURPOSE Purpose,
 * __out PWINBIO_REJECT_DETAIL RejectDetail
 * );
 * ```
 * 
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/SecBioMet/winbio-bir">WINBIO_BIR</a> structure that is passed in  the <i>SampleBuffer</i> parameter  is the property of the sensor adapter. Because the sensor adapter controls the lifetime of the <b>WINBIO_BIR</b> object, the <i>EngineAdapterAcceptSampleData</i> function must not attempt to deallocate the structure or save a pointer to it.  By not saving the pointer, you prevent other parts of the engine adapter from attempting to use the <b>WINBIO_BIR</b> structure after the <i>EngineAdapterAcceptSampleData</i> function returns.
 * 
 * If the <b>Offset</b> field of the <b>StandardDataBlock</b> member of the <a href="https://docs.microsoft.com/windows/desktop/SecBioMet/winbio-bir">WINBIO_BIR</a> structure is greater than zero (indicating that the BIR contains a biometric sample in the standard data format), the <b>BiometricDataFormat</b> field of the <b>HeaderBlock</b> member must be set as follows:
 * 
 * <ul>
 * <li>The <b>Owner</b> field must be <b>WINBIO_ ANSI_381_FORMAT_OWNER</b>.</li>
 * <li>The <b>Type</b> field must be <b>WINBIO_ANSI_381_FORMAT_TYPE</b>.</li>
 * </ul>
 * This is the only standard data format supported by the Windows Biometric Framework.
 * 
 * The Windows Biometric Framework also assumes that the <b>HeaderBlock</b> member (a <a href="https://docs.microsoft.com/windows/desktop/SecBioMet/winbio-bir-header">WINBIO_BIR_HEADER</a> structure) contains the <b>DataFlags</b> and <b>Purpose</b> values used by the sensor adapter to capture the sample.
 * 
 * Fingerprint sensors processing fingerprint samples and rejecting bad swipes in the Engine Adapter should also use valid values for <b>WINBIO_BIR_PURPOSE</b>.
 * @see https://learn.microsoft.com/windows/win32/api//content/winbio_adapter/nc-winbio_adapter-pibio_engine_accept_sample_data_fn
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class PIBIO_ENGINE_ACCEPT_SAMPLE_DATA_FN extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Pointer<WINBIO_PIPELINE>} Pipeline 
     * @param {Pointer} SampleBuffer 
     * @param {Pointer} SampleSize 
     * @param {Integer} Purpose 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(Pipeline, SampleBuffer, SampleSize, Purpose) {
        result := ComCall(3, this, "ptr", Pipeline, "ptr", SampleBuffer, "ptr", SampleSize, "char", Purpose, "uint*", &RejectDetail := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RejectDetail
    }
}
