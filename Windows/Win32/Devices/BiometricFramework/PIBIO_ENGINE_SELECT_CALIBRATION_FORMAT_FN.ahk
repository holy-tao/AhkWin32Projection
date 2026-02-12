#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Called by the Windows Biometric Framework to determine which of the Sensor Adapter’s calibration formats the Engine Adapter wants to use.
 * @remarks
 * This method is called once during configuration of the biometric unit. After a calibration format has been selected, it cannot be changed.
 * @see https://learn.microsoft.com/windows/win32/api//content/winbio_adapter/nc-winbio_adapter-pibio_engine_select_calibration_format_fn
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class PIBIO_ENGINE_SELECT_CALIBRATION_FORMAT_FN extends IUnknown {

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
     * @param {Pointer} FormatCount 
     * @param {Pointer<Guid>} SelectedFormat 
     * @param {Pointer<Pointer>} MaxBufferSize 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(Pipeline, FormatArray, FormatCount, SelectedFormat, MaxBufferSize) {
        MaxBufferSizeMarshal := MaxBufferSize is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", Pipeline, "ptr", FormatArray, "ptr", FormatCount, "ptr", SelectedFormat, MaxBufferSizeMarshal, MaxBufferSize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
