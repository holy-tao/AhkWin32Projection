#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IAzRoleDefinitions.ahk
#Include .\IAzScope.ahk
#Include .\IAzRole.ahk

/**
 * Represents a role to which users and groups can be assigned.
 * @see https://learn.microsoft.com/windows/win32/api//content/azroles/nn-azroles-iazroleassignment
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 */
class IAzRoleAssignment extends IAzRole{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAzRoleAssignment
     * @type {Guid}
     */
    static IID => Guid("{55647d31-0d5a-4fa3-b4ac-2b5f9ad5ab76}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 34

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddRoleDefinition", "DeleteRoleDefinition", "get_RoleDefinitions", "get_Scope"]

    /**
     * @type {IAzRoleDefinitions} 
     */
    RoleDefinitions {
        get => this.get_RoleDefinitions()
    }

    /**
     * @type {IAzScope} 
     */
    Scope {
        get => this.get_Scope()
    }

    /**
     * Adds the specified IAzRoleDefinition object to this IAzRoleAssignment object.
     * @remarks
     * You must call the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazrole-submit">Submit</a> method to persist any changes made by this method.
     * @param {BSTR} bstrRoleDefinition The name of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazroledefinition">IAzRoleDefinition</a> to add.
     * @returns {HRESULT} If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/azroles/nf-azroles-iazroleassignment-addroledefinition
     */
    AddRoleDefinition(bstrRoleDefinition) {
        if(bstrRoleDefinition is String) {
            pin := BSTR.Alloc(bstrRoleDefinition)
            bstrRoleDefinition := pin.Value
        }

        result := ComCall(34, this, "ptr", bstrRoleDefinition, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Removes the IAzRoleDefinition object with the specified name from this IAzRoleAssignment object.
     * @remarks
     * If there are any references to an <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazroledefinition">IAzRoleDefinition</a> object that has been deleted from the cache, the <b>IAzRoleDefinition</b> object can no longer be used. In C++, you must release references to deleted <b>IAzRoleDefinition</b> objects by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method. In Visual Basic, references to deleted objects are automatically released.
     * @param {BSTR} bstrRoleDefinition The name of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazroledefinition">IAzRoleDefinition</a> object to delete.
     * @returns {HRESULT} If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/azroles/nf-azroles-iazroleassignment-deleteroledefinition
     */
    DeleteRoleDefinition(bstrRoleDefinition) {
        if(bstrRoleDefinition is String) {
            pin := BSTR.Alloc(bstrRoleDefinition)
            bstrRoleDefinition := pin.Value
        }

        result := ComCall(35, this, "ptr", bstrRoleDefinition, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves a collection of the IAzRoleDefinition objects associated with this IAzRoleAssignment object.
     * @returns {IAzRoleDefinitions} 
     * @see https://learn.microsoft.com/windows/win32/api//content/azroles/nf-azroles-iazroleassignment-get_roledefinitions
     */
    get_RoleDefinitions() {
        result := ComCall(36, this, "ptr*", &ppRoleDefinitions := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAzRoleDefinitions(ppRoleDefinitions)
    }

    /**
     * Retrieves the IAzScope object that represents the scope in which this IAzRoleAssignment object is defined.
     * @returns {IAzScope} 
     * @see https://learn.microsoft.com/windows/win32/api//content/azroles/nf-azroles-iazroleassignment-get_scope
     */
    get_Scope() {
        result := ComCall(37, this, "ptr*", &ppScope := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAzScope(ppScope)
    }
}
