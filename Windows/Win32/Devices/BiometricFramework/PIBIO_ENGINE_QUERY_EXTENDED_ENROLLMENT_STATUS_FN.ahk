#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Queries the WINBIO_PROPERTY_EXTENDED_ENROLLMENT_STATUS property.
 * @remarks
 * Enrollment applications can request extended enrollment status information after each call to the <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioenrollcapture">WinBioEnrollCapture</a> function.
 * 
 * If the biometric unit is not currently an enrollment template when this routine is called, the engine adapter should set the EnrollmentStatus.TemplateStatus field to <b>WINBIO_E_INVALID_OPERATION</b> and return <b>S_OK</b> as the value of the function.
 * @see https://learn.microsoft.com/windows/win32/api//content/winbio_adapter/nc-winbio_adapter-pibio_engine_query_extended_enrollment_status_fn
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class PIBIO_ENGINE_QUERY_EXTENDED_ENROLLMENT_STATUS_FN extends IUnknown {

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
     * @param {Pointer} EnrollmentStatus 
     * @param {Pointer} EnrollmentStatusSize 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(Pipeline, EnrollmentStatus, EnrollmentStatusSize) {
        result := ComCall(3, this, "ptr", Pipeline, "ptr", EnrollmentStatus, "ptr", EnrollmentStatusSize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
