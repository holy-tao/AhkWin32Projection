#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Releases adapter specific resources attached to the pipeline.
 * @remarks
 * To prevent memory leaks, your implementation of the <i>SensorAdapterDetach</i> function must release the private <b>WINBIO_SENSOR_CONTEXT</b> structure pointed to by the  <b>SensorContext</b> member of the pipeline along with any other resources attached to the sensor context.
 * 
 * If the <b>SensorContext</b> field in the pipeline object is <b>NULL</b> when this function is called, the pipeline was not properly initialized and you must return <b>WINBIO_E_INVALID_DEVICE_STATE</b> to notify the Windows Biometric Framework of the problem.
 * 
 * Before returning S_OK, this function must set the <b>SensorContext</b> field of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/ns-winbio_adapter-winbio_pipeline">WINBIO_PIPELINE</a> structure to <b>NULL</b>.
 * 
 * Because this function is called after the storage and engine adapters have been removed from the pipeline, your implementation of this function must not call any functions referenced by the <a href="https://docs.microsoft.com/windows/win32/api/winbio_adapter/ns-winbio_adapter-winbio_storage_interface">WINBIO_ENGINE_INTERFACE</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/ns-winbio_adapter-winbio_storage_interface">WINBIO_STORAGE_INTERFACE</a> structures pointed to by the <b>EngineInterface</b> and <b>StorageInterface</b> members of the pipeline object.
 * 
 * Because the <b>SensorHandle</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/ns-winbio_adapter-winbio_pipeline">WINBIO_PIPELINE</a> structure will contain  a valid handle even after  <i>SensorAdapterDetach</i> is called, you can use the handle to access the sensor device if necessary. This function should not close the sensor handle. The Windows biometric Framework will do so after <i>SensorAdapterDetach</i> returns.
 * @see https://learn.microsoft.com/windows/win32/api//content/winbio_adapter/nc-winbio_adapter-pibio_sensor_detach_fn
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class PIBIO_SENSOR_DETACH_FN extends IUnknown {

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
