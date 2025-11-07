#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IGPMGPO.ahk

/**
 * The IGPMGPO2 interface supports methods that enable you to manage Group Policy objects (GPOs) and Starter Group Policy objects in the directory service.
 * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nn-gpmgmt-igpmgpo2
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class IGPMGPO2 extends IGPMGPO{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGPMGPO2
     * @type {Guid}
     */
    static IID => Guid("{8a66a210-b78b-4d99-88e2-c306a817c925}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 36

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Description", "put_Description"]

    /**
     * 
     * @returns {BSTR} 
     */
    get_Description() {
        pVal := BSTR()
        result := ComCall(36, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {BSTR} newVal 
     * @returns {HRESULT} 
     */
    put_Description(newVal) {
        newVal := newVal is String ? BSTR.Alloc(newVal).Value : newVal

        result := ComCall(37, this, "ptr", newVal, "HRESULT")
        return result
    }
}
