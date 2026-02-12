#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Gives the Sensor Adapter the chance to perform any work needed to bring the sensor component out of an idle state.
 * @remarks
 * This method is called when the first client session opens a handle to an inactive biometric unit.
 * 
 * Both the Engine and Storage adapters have been activated when this method is called.
 * 
 * Returning any <b>HRESULT</b> other than <b>S_OK</b> will cause the Windows Biometric Framework to log the error and abort the activation of the biometric unit.
 * 
 * This method executes in the context of the sensor control thread that will process all other requests for the unit, including deactivation.
 * @see https://learn.microsoft.com/windows/win32/api//content/winbio_adapter/nc-winbio_adapter-pibio_sensor_activate_fn
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class PIBIO_SENSOR_ACTIVATE_FN extends IUnknown {

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
