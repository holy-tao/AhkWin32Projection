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
     * 
     * @param {BSTR} bstrScopeName 
     * @param {VARIANT_BOOL} bRecursive 
     * @returns {IAzRoleAssignments} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iaztask2-roleassignments
     */
    RoleAssignments(bstrScopeName, bRecursive) {
        bstrScopeName := bstrScopeName is String ? BSTR.Alloc(bstrScopeName).Value : bstrScopeName

        result := ComCall(33, this, "ptr", bstrScopeName, "short", bRecursive, "ptr*", &ppRoleAssignments := 0, "HRESULT")
        return IAzRoleAssignments(ppRoleAssignments)
    }
}
