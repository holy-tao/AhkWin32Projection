#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IX509EnrollmentHelper.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Can be used to create an IX509EnrollmentHelper object on a webpage.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-ix509machineenrollmentfactory
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
     * @param {BSTR} strProgID A <b>BSTR</b> variable that contains the ProgID value. This must be "X509Enrollment.CX509EnrollmentHelper".
     * @returns {IX509EnrollmentHelper} Address of a pointer to a variable that receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509enrollmenthelper">IX509EnrollmentHelper</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509machineenrollmentfactory-createobject
     */
    CreateObject(strProgID) {
        strProgID := strProgID is String ? BSTR.Alloc(strProgID).Value : strProgID

        result := ComCall(7, this, "ptr", strProgID, "ptr*", &ppIHelper := 0, "HRESULT")
        return IX509EnrollmentHelper(ppIHelper)
    }
}
