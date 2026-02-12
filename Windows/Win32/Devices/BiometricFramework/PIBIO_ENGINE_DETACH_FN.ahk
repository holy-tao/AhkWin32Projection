#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Releases adapter-specific resources attached to the pipeline.E
 * @remarks
 * To prevent memory leaks, your implementation of the <i>EngineAdapterDetach</i> function must release the private <b>WINBIO_ENGINE_CONTEXT</b> structure pointed to by the  <b>EngineContext</b> member of the pipeline along with any other resources attached to the engine context.
 * 
 * If the <b>EngineContext</b> field in the pipeline object is <b>NULL</b> when this function is called, the pipeline was not properly initialized and you must return <b>WINBIO_E_INVALID_DEVICE_STATE</b> to notify the Windows Biometric Framework of the problem.
 * 
 * Before returning S_OK, the <i>EngineAdapterDetach</i> function must set the <b>EngineContext</b> field of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/ns-winbio_adapter-winbio_pipeline">WINBIO_PIPELINE</a> structure to <b>NULL</b> and the <b>EngineHandle</b> field to <b>INVALID_HANDLE_VALUE</b>.
 * 
 * This function is called after the storage adapter has been removed from the pipeline. Therefore, this function must not call any functions referenced by the <a href="https://docs.microsoft.com/windows/win32/api/winbio_adapter/ns-winbio_adapter-winbio_storage_interface">WINBIO_STORAGE_INTERFACE</a> structure pointed to by the <b>StorageInterface</b> member of the pipeline object.
 * @see https://learn.microsoft.com/windows/win32/api//content/winbio_adapter/nc-winbio_adapter-pibio_engine_detach_fn
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class PIBIO_ENGINE_DETACH_FN extends IUnknown {

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
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(Pipeline) {
        result := ComCall(3, this, "ptr", Pipeline, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
