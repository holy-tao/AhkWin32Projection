#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IX509EnrollmentHelper.ahk" { IX509EnrollmentHelper }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Can be used to create an IX509EnrollmentHelper object on a webpage.
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/nn-certenroll-ix509machineenrollmentfactory
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct IX509MachineEnrollmentFactory extends IDispatch {
    /**
     * The interface identifier for IX509MachineEnrollmentFactory
     * @type {Guid}
     */
    static IID := Guid("{728ab352-217d-11da-b2a4-000e7bbb2b09}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IX509MachineEnrollmentFactory interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        CreateObject : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IX509MachineEnrollmentFactory.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates an IX509EnrollmentHelper object on a webpage.
     * @remarks
     * This method calls <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollmenthelper-initialize">Initialize</a> on the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509enrollmenthelper">IX509EnrollmentHelper</a> interface by using the <b>ContextAdministratorForceMachine</b> context value, thereby specifying that all certificates to be enrolled by the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509enrollment2">IX509Enrollment2</a> object will be requested by an administrator acting on behalf of a computer. To enroll a user certificate, call <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollmentwebclassfactory-createobject">CreateObject</a> on the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509enrollmentwebclassfactory">IX509EnrollmentWebClassFactory</a> interface.
     * @param {BSTR} strProgID A <b>BSTR</b> variable that contains the ProgID value. This must be "X509Enrollment.CX509EnrollmentHelper".
     * @returns {IX509EnrollmentHelper} Address of a pointer to a variable that receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509enrollmenthelper">IX509EnrollmentHelper</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509machineenrollmentfactory-createobject
     */
    CreateObject(strProgID) {
        strProgID := strProgID is String ? BSTR.Alloc(strProgID).Value : strProgID

        result := ComCall(7, this, BSTR, strProgID, "ptr*", &ppIHelper := 0, "HRESULT")
        return IX509EnrollmentHelper(ppIHelper)
    }

    Query(iid) {
        if (IX509MachineEnrollmentFactory.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateObject := CallbackCreate(GetMethod(implObj, "CreateObject"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateObject)
    }
}
