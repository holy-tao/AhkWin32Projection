#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Gets a set of post-capture calibration data from the engine adapter.
 * @remarks
 * The <b>EngineAdapterQueryCalibrationData</b> method can independently control the biometric service’s repeat-capture behavior and the calibration behavior by setting <i>DiscardAndRepeatCapture</i> and <i>CalibrationBufferSize</i>, respectively.
 * 
 * <table>
 * <tr>
 * <th>Desired Behavior</th>
 * <th><i>DiscardAndRepeatCapture</i></th>
 * <th><i>CalibrationBufferSize</i></th>
 * </tr>
 * <tr>
 * <td>Repeat capture after calibration.</td>
 * <td><b>TRUE</b></td>
 * <td>Non-zero</td>
 * </tr>
 * <tr>
 * <td>Repeat capture without calibration.</td>
 * <td><b>TRUE</b></td>
 * <td>Zero</td>
 * </tr>
 * <tr>
 * <td>Continue processing the sample after calibration.</td>
 * <td><b>FALSE</b></td>
 * <td>Non-zero</td>
 * </tr>
 * <tr>
 * <td>Continue processing the sample without calibration.</td>
 * <td><b>FALSE</b></td>
 * <td>Zero</td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api//content/winbio_adapter/nc-winbio_adapter-pibio_engine_query_calibration_data_fn
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class PIBIO_ENGINE_QUERY_CALIBRATION_DATA_FN extends IUnknown {

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
     * @param {Pointer<BOOLEAN>} DiscardAndRepeatCapture 
     * @param {Pointer} CalibrationBuffer 
     * @param {Pointer<Pointer>} CalibrationBufferSize 
     * @param {Pointer} MaxBufferSize 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(Pipeline, DiscardAndRepeatCapture, CalibrationBuffer, CalibrationBufferSize, MaxBufferSize) {
        DiscardAndRepeatCaptureMarshal := DiscardAndRepeatCapture is VarRef ? "char*" : "ptr"
        CalibrationBufferSizeMarshal := CalibrationBufferSize is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", Pipeline, DiscardAndRepeatCaptureMarshal, DiscardAndRepeatCapture, "ptr", CalibrationBuffer, CalibrationBufferSizeMarshal, CalibrationBufferSize, "ptr", MaxBufferSize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
