#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
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
     * 
     * @param {BSTR} strProgID 
     * @param {Pointer<IX509EnrollmentHelper>} ppIHelper 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509machineenrollmentfactory-createobject
     */
    CreateObject(strProgID, ppIHelper) {
        strProgID := strProgID is String ? BSTR.Alloc(strProgID).Value : strProgID

        result := ComCall(7, this, "ptr", strProgID, "ptr*", ppIHelper, "HRESULT")
        return result
    }
}
