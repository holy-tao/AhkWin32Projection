#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Determines the set of calibration formats supported by the Sensor Adapter.
 * @remarks
 * This method is called once during the initial configuration of a biometric unit.
 * 
 * Each calibration format supported by the Sensor Adapter is identified by a separate UUID value.
 * 
 * This method executes in the context of an arbitrary RPC server thread.
 * 
 * If the Sensor Adapter doesn’t support dynamic calibration, it should return a value of <b>E_NOTIMPL</b>. The Windows Biometric Framework will not treat this as an error unless the Engine Adapter requires dynamic calibration. (For details, see the description of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_select_calibration_format_fn">EngineAdapterSelectCalibrationFormat</a> method.)
 * 
 * If this method returns a value of <b>S_OK</b>, <i>FormatArray</i> and <i>FormatCount</i> must be set. It is an error for this method to return <b>S_OK</b> along with a zero value for <i>FormatCount</i>. Doing so will cause the Windows Biometric Framework to log a <b>WINBIO_E_INVALID_CALIBRATION_FORMAT_ARRAY</b> error message and abort the configuration of the biometric unit.
 * @see https://learn.microsoft.com/windows/win32/api//content/winbio_adapter/nc-winbio_adapter-pibio_sensor_query_calibration_formats_fn
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class PIBIO_SENSOR_QUERY_CALIBRATION_FORMATS_FN extends IUnknown {

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
     * @param {Pointer<Guid>} FormatArray 
     * @param {Pointer} FormatArraySize 
     * @param {Pointer<Pointer>} FormatCount 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(Pipeline, FormatArray, FormatArraySize, FormatCount) {
        FormatCountMarshal := FormatCount is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", Pipeline, "ptr", FormatArray, "ptr", FormatArraySize, FormatCountMarshal, FormatCount, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
