#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Makes the current contents of the sample buffer available to the engine adapter.
 * @remarks
 * Your implementation of this function should convert raw data contained in the  sample buffer into a standard <a href="https://docs.microsoft.com/windows/desktop/SecBioMet/winbio-bir">WINBIO_BIR</a> structure and push this structure to the engine  by using the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_accept_sample_data_fn">EngineAdapterAcceptSampleData</a> function. The correct way to do this is to call the <b>WbioEngineAcceptSampleData</b> helper function defined in Winbio_adapter.h header file.
 * 
 * 
 * If the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_accept_sample_data_fn">EngineAdapterAcceptSampleData</a> function returns WINBIO_E_BAD_CAPTURE, your implementation of <i>SensorAdapterPushDataToEngine</i> should return the <i>RejectDetail</i> value propagated by the engine adapter. 
 * 
 * 
 * The sensor adapter retains ownership of the sample buffer passed to <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_accept_sample_data_fn">EngineAdapterAcceptSampleData</a>. The sensor adapter is responsible for releasing this buffer at some point after <i>EngineAdapterAcceptSampleData</i> returns.
 * @see https://learn.microsoft.com/windows/win32/api//content/winbio_adapter/nc-winbio_adapter-pibio_sensor_push_data_to_engine_fn
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class PIBIO_SENSOR_PUSH_DATA_TO_ENGINE_FN extends IUnknown {

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
     * @param {Integer} Purpose 
     * @param {Integer} Flags 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(Pipeline, Purpose, Flags) {
        result := ComCall(3, this, "ptr", Pipeline, "char", Purpose, "char", Flags, "uint*", &RejectDetail := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RejectDetail
    }
}
