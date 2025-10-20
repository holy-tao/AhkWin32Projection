#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IAzOperation.ahk

/**
 * Extends the IAzOperation with a method that returns the role assignments associated with the operation.
 * @see https://docs.microsoft.com/windows/win32/api//azroles/nn-azroles-iazoperation2
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 */
class IAzOperation2 extends IAzOperation{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAzOperation2
     * @type {Guid}
     */
    static IID => Guid("{1f5ea01f-44a2-4184-9c48-a75b4dcc8ccc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 19

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RoleAssignments"]

    /**
     * 
     * @param {BSTR} bstrScopeName 
     * @param {VARIANT_BOOL} bRecursive 
     * @param {Pointer<IAzRoleAssignments>} ppRoleAssignments 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazoperation2-roleassignments
     */
    RoleAssignments(bstrScopeName, bRecursive, ppRoleAssignments) {
        bstrScopeName := bstrScopeName is String ? BSTR.Alloc(bstrScopeName).Value : bstrScopeName

        result := ComCall(19, this, "ptr", bstrScopeName, "short", bRecursive, "ptr*", ppRoleAssignments, "HRESULT")
        return result
    }
}
