#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Adds a sensor adapter to the processing pipeline of the biometric unit.
 * @remarks
 * This function is called before the engine and storage adapters have been initialized for the biometric unit. Therefore, this function must not call any functions referenced by the <a href="https://docs.microsoft.com/windows/win32/api/winbio_adapter/ns-winbio_adapter-winbio_storage_interface">WINBIO_ENGINE_INTERFACE</a> or the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/ns-winbio_adapter-winbio_storage_interface">WINBIO_STORAGE_INTERFACE</a> structure pointed to by the <b>EngineInterface</b> and <b>StorageInterface</b> members of the pipeline object.
 * 
 * Because the <b>SensorHandle</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/ns-winbio_adapter-winbio_pipeline">WINBIO_PIPELINE</a> structure will contain  a valid handle before  this method is called, your implementation of <i>SensorAdapterAttach</i>  can use the handle to access the sensor device if necessary.
 * 
 * When implementing this function, you must allocate and manage any resources required by the adapter and attach these to the biometric unit pipeline. To do this, allocate a private <b>WINBIO_SENSOR_CONTEXT</b> structure on the  heap, initialize it, and set its address in the <b>SensorContext</b> member of the pipeline object.
 * 
 * If there is an error during the creation and initialization of engine adapter resources used by this function, you must perform any required cleanup before returning.
 * 
 * If the <b>SensorContext</b> field is not <b>NULL</b> when this function is called, the pipeline was not properly reset by a prior call to <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_detach_fn">SensorAdapterDetach</a> and you must return <b>WINBIO_E_INVALID_DEVICE_STATE</b> to notify the Windows Biometric Framework of the problem.
 * @see https://learn.microsoft.com/windows/win32/api//content/winbio_adapter/nc-winbio_adapter-pibio_sensor_attach_fn
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class PIBIO_SENSOR_ATTACH_FN extends IUnknown {

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
