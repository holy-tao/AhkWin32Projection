#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IAzRoleDefinitions.ahk
#Include .\IAzScope.ahk
#Include .\IAzRole.ahk

/**
 * Represents a role to which users and groups can be assigned.
 * @see https://docs.microsoft.com/windows/win32/api//azroles/nn-azroles-iazroleassignment
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
     * @param {BSTR} bstrRoleDefinition The name of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazroledefinition">IAzRoleDefinition</a> to add.
     * @returns {HRESULT} If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazroleassignment-addroledefinition
     */
    AddRoleDefinition(bstrRoleDefinition) {
        bstrRoleDefinition := bstrRoleDefinition is String ? BSTR.Alloc(bstrRoleDefinition).Value : bstrRoleDefinition

        result := ComCall(34, this, "ptr", bstrRoleDefinition, "HRESULT")
        return result
    }

    /**
     * Removes the IAzRoleDefinition object with the specified name from this IAzRoleAssignment object.
     * @param {BSTR} bstrRoleDefinition The name of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazroledefinition">IAzRoleDefinition</a> object to delete.
     * @returns {HRESULT} If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazroleassignment-deleteroledefinition
     */
    DeleteRoleDefinition(bstrRoleDefinition) {
        bstrRoleDefinition := bstrRoleDefinition is String ? BSTR.Alloc(bstrRoleDefinition).Value : bstrRoleDefinition

        result := ComCall(35, this, "ptr", bstrRoleDefinition, "HRESULT")
        return result
    }

    /**
     * Retrieves a collection of the IAzRoleDefinition objects associated with this IAzRoleAssignment object.
     * @returns {IAzRoleDefinitions} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazroleassignment-get_roledefinitions
     */
    get_RoleDefinitions() {
        result := ComCall(36, this, "ptr*", &ppRoleDefinitions := 0, "HRESULT")
        return IAzRoleDefinitions(ppRoleDefinitions)
    }

    /**
     * Retrieves the IAzScope object that represents the scope in which this IAzRoleAssignment object is defined.
     * @returns {IAzScope} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazroleassignment-get_scope
     */
    get_Scope() {
        result := ComCall(37, this, "ptr*", &ppScope := 0, "HRESULT")
        return IAzScope(ppScope)
    }
}
