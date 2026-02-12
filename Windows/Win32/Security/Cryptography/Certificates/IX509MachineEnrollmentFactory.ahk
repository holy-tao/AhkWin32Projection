#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IX509EnrollmentHelper.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Can be used to create an IX509EnrollmentHelper object on a webpage.
 * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nn-certenroll-ix509machineenrollmentfactory
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IX509MachineEnrollmentFactory extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IX509MachineEnrollmentFactory
     * @type {Guid}
     */
    static IID => Guid("{728ab352-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateObject"]

    /**
     * Creates an IX509EnrollmentHelper object on a webpage.
     * @remarks
     * This method calls <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollmenthelper-initialize">Initialize</a> on the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509enrollmenthelper">IX509EnrollmentHelper</a> interface by using the <b>ContextAdministratorForceMachine</b> context value, thereby specifying that all certificates to be enrolled by the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509enrollment2">IX509Enrollment2</a> object will be requested by an administrator acting on behalf of a computer. To enroll a user certificate, call <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollmentwebclassfactory-createobject">CreateObject</a> on the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509enrollmentwebclassfactory">IX509EnrollmentWebClassFactory</a> interface.
     * @param {BSTR} strProgID A <b>BSTR</b> variable that contains the ProgID value. This must be "X509Enrollment.CX509EnrollmentHelper".
     * @returns {IX509EnrollmentHelper} Address of a pointer to a variable that receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509enrollmenthelper">IX509EnrollmentHelper</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ix509machineenrollmentfactory-createobject
     */
    CreateObject(strProgID) {
        if(strProgID is String) {
            pin := BSTR.Alloc(strProgID)
            strProgID := pin.Value
        }

        result := ComCall(7, this, "ptr", strProgID, "ptr*", &ppIHelper := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IX509EnrollmentHelper(ppIHelper)
    }
}
