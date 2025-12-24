#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IAzRoleAssignments.ahk
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
     * Returns a collection of the role assignments associated with this operation.
     * @param {BSTR} bstrScopeName The name of the scope in which to check for role assignments. If the value of this parameter is an empty string, the method checks for role assignments at the application level.
     * @param {VARIANT_BOOL} bRecursive <b>TRUE</b> if the method checks all scopes within the application; otherwise, <b>FALSE</b>. This parameter is ignored if the value of the <i>bstrScopeName</i> parameter is not <b>NULL</b>.
     * @returns {IAzRoleAssignments} The address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazroleassignments">IAzRoleAssignments</a> interface that represents the collection of <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazroleassignment">IAzRoleAssignment</a> objects associated with this operation.
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazoperation2-roleassignments
     */
    RoleAssignments(bstrScopeName, bRecursive) {
        bstrScopeName := bstrScopeName is String ? BSTR.Alloc(bstrScopeName).Value : bstrScopeName

        result := ComCall(19, this, "ptr", bstrScopeName, "short", bRecursive, "ptr*", &ppRoleAssignments := 0, "HRESULT")
        return IAzRoleAssignments(ppRoleAssignments)
    }
}
