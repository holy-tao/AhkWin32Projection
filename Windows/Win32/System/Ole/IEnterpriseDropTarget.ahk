#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * When implemented by the drop target application, this interface gives the OLE drag and drop engine the ability to determine whether the drop target application intends to evaluate enterprise protection policy and gives the OLE drag and drop engine a way to provide the enterprise ID of the drop source application to the drop target application.
 * @see https://docs.microsoft.com/windows/win32/api//oleidl/nn-oleidl-ienterprisedroptarget
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IEnterpriseDropTarget extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnterpriseDropTarget
     * @type {Guid}
     */
    static IID => Guid("{390e3878-fd55-4e18-819d-4682081c0cfd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetDropSourceEnterpriseId", "IsEvaluatingEdpPolicy"]

    /**
     * 
     * @param {PWSTR} identity 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ienterprisedroptarget-setdropsourceenterpriseid
     */
    SetDropSourceEnterpriseId(identity) {
        identity := identity is String ? StrPtr(identity) : identity

        result := ComCall(3, this, "ptr", identity, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ienterprisedroptarget-isevaluatingedppolicy
     */
    IsEvaluatingEdpPolicy() {
        result := ComCall(4, this, "int*", &value := 0, "HRESULT")
        return value
    }
}
