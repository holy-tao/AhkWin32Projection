#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Tells the Engine Adapter which person to track for the current enrollment operation.
 * @remarks
 * For some biometric factors (such as WINBIO_TYPE_FACIAL_FEATURES), there can be multiple people in camera frame at the same time. During an enrollment operation, it’s necessary for the enrollment application to select one specific person to enroll. The enrollment application does this by calling the <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioenrollselect">WinBioEnrollSelect</a> function. The Windows Biometric Framework then calls the engine adapter’s <b>EngineAdapterSetEnrollmentSelector</b> function with this information.
 * 
 * The engine adapter should store this value and use it to track the proper person during the course of the enrollment.
 * @see https://learn.microsoft.com/windows/win32/api//content/winbio_adapter/nc-winbio_adapter-pibio_engine_set_enrollment_selector_fn
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class PIBIO_ENGINE_SET_ENROLLMENT_SELECTOR_FN extends IUnknown {

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
     * @param {Integer} SelectorValue 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(Pipeline, SelectorValue) {
        result := ComCall(3, this, "ptr", Pipeline, "uint", SelectorValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
