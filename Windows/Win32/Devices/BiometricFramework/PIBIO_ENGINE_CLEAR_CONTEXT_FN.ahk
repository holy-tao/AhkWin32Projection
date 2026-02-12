#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Prepares the processing pipeline of the biometric unit for a new operation.E
 * @remarks
 * This purpose of this function is to reset the context to the state it was in immediately after a call to the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_attach_fn">EngineAdapterAttach</a> function. The context is a reusable structure. The <b>EngineAdapterClearContext</b> function reinitializes the context but does not remove it from the pipeline.
 * 
 * Typical examples of the objects in the engine adapter context area that should be cleared include the following.
 * <table>
 * <tr>
 * <th>Object</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td>Feature set</td>
 * <td>Contains a description of a biometric sample</td>
 * </tr>
 * <tr>
 * <td>Enrollment</td>
 * <td>Tracks the current state of an enrollment transaction.</td>
 * </tr>
 * <tr>
 * <td>Template</td>
 * <td>Biometric template created by the feature set or the enrollment object.</td>
 * </tr>
 * <tr>
 * <td>Comparison</td>
 * <td>Contains the result of a comparison between the template and the feature set.</td>
 * </tr>
 * <tr>
 * <td>Index vector</td>
 * <td>Contains a set of index values associated with the template.</td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api//content/winbio_adapter/nc-winbio_adapter-pibio_engine_clear_context_fn
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class PIBIO_ENGINE_CLEAR_CONTEXT_FN extends IUnknown {

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
