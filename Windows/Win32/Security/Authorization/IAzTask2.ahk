#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IAzRoleAssignments.ahk
#Include .\IAzTask.ahk

/**
 * Extends the IAzTask interface with a method that returns the role assignments associated with the task.
 * @see https://docs.microsoft.com/windows/win32/api//azroles/nn-azroles-iaztask2
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 */
class IAzTask2 extends IAzTask{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAzTask2
     * @type {Guid}
     */
    static IID => Guid("{03a9a5ee-48c8-4832-9025-aad503c46526}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 33

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RoleAssignments"]

    /**
     * Returns a collection of the role assignments associated with this task.
     * @param {BSTR} bstrScopeName The name of the scope in which to check for role assignments. If the value of this parameter is an empty string, the method checks for role assignments at the application level.
     * @param {VARIANT_BOOL} bRecursive <b>TRUE</b> if the method checks all scopes within the application; otherwise, <b>FALSE</b>. This parameter is ignored if the value of the <i>bstrScopeName</i> parameter is not <b>NULL</b>.
     * @returns {IAzRoleAssignments} The address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazroleassignments">IAzRoleAssignments</a> interface that represents the collection of <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazroleassignment">IAzRoleAssignment</a> objects associated with this task.
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iaztask2-roleassignments
     */
    RoleAssignments(bstrScopeName, bRecursive) {
        bstrScopeName := bstrScopeName is String ? BSTR.Alloc(bstrScopeName).Value : bstrScopeName

        result := ComCall(33, this, "ptr", bstrScopeName, "short", bRecursive, "ptr*", &ppRoleAssignments := 0, "HRESULT")
        return IAzRoleAssignments(ppRoleAssignments)
    }
}
