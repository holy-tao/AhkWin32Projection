#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IAzOperations.ahk
#Include .\IAzTasks.ahk
#Include .\IAzBizRuleParameters.ahk
#Include .\IAzBizRuleInterfaces.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\IAzClientContext2.ahk

/**
 * Extends the IAzClientContext2 interface.
 * @see https://docs.microsoft.com/windows/win32/api//azroles/nn-azroles-iazclientcontext3
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 */
class IAzClientContext3 extends IAzClientContext2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAzClientContext3
     * @type {Guid}
     */
    static IID => Guid("{11894fde-1deb-4b4b-8907-6d1cda1f5d4f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 26

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AccessCheck2", "IsInRoleAssignment", "GetOperations", "GetTasks", "get_BizRuleParameters", "get_BizRuleInterfaces", "GetGroups", "get_Sids"]

    /**
     * @type {IAzBizRuleParameters} 
     */
    BizRuleParameters {
        get => this.get_BizRuleParameters()
    }

    /**
     * @type {IAzBizRuleInterfaces} 
     */
    BizRuleInterfaces {
        get => this.get_BizRuleInterfaces()
    }

    /**
     * @type {VARIANT} 
     */
    Sids {
        get => this.get_Sids()
    }

    /**
     * Returns a value that specifies whether the principal represented by the current client context is allowed to perform the specified operation.
     * @param {BSTR} bstrObjectName The name of the accessed object. This string is used in audits.
     * @param {BSTR} bstrScopeName The name of the scope that contains the operation specified by the <i>lOperation</i> parameter.
     * @param {Integer} lOperation The <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazoperation-get_operationid">OperationID</a> property of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazoperation">IAzOperation</a> object for which to check access.
     * @returns {Integer} A pointer to a value that indicates whether the principal represented by the current client context is allowed to perform the operation specified by the <i>lOperation</i> parameter.
     * 
     *  A value of <b>NO_ERROR</b> indicates that the principal does have permission. Any other value indicates that the principal does not have permission.
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazclientcontext3-accesscheck2
     */
    AccessCheck2(bstrObjectName, bstrScopeName, lOperation) {
        bstrObjectName := bstrObjectName is String ? BSTR.Alloc(bstrObjectName).Value : bstrObjectName
        bstrScopeName := bstrScopeName is String ? BSTR.Alloc(bstrScopeName).Value : bstrScopeName

        result := ComCall(26, this, "ptr", bstrObjectName, "ptr", bstrScopeName, "int", lOperation, "uint*", &plResult := 0, "HRESULT")
        return plResult
    }

    /**
     * Checks whether the principal represented by the current client context is a member of the specified role in the specified scope.
     * @param {BSTR} bstrScopeName The name of the scope to check.
     * @param {BSTR} bstrRoleName The name of the role to check.
     * @returns {VARIANT_BOOL} <b>VARIANT_TRUE</b> if the principal represented by the current client context is a member of the role specified by the <i>bstrRoleName</i> parameter in the scope specified by the <i>bstrScopeName</i> parameter; otherwise, <b>VARIANT_FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazclientcontext3-isinroleassignment
     */
    IsInRoleAssignment(bstrScopeName, bstrRoleName) {
        bstrScopeName := bstrScopeName is String ? BSTR.Alloc(bstrScopeName).Value : bstrScopeName
        bstrRoleName := bstrRoleName is String ? BSTR.Alloc(bstrRoleName).Value : bstrRoleName

        result := ComCall(27, this, "ptr", bstrScopeName, "ptr", bstrRoleName, "short*", &pbIsInRole := 0, "HRESULT")
        return pbIsInRole
    }

    /**
     * Returns a collection of the operations, within the specified scope, that the principal represented by the current client context has permission to perform.
     * @param {BSTR} bstrScopeName The name of the scope to check.
     * @returns {IAzOperations} The address of a pointer to the collection of operations that the principal represented by the current client context has permission to perform.
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazclientcontext3-getoperations
     */
    GetOperations(bstrScopeName) {
        bstrScopeName := bstrScopeName is String ? BSTR.Alloc(bstrScopeName).Value : bstrScopeName

        result := ComCall(28, this, "ptr", bstrScopeName, "ptr*", &ppOperationCollection := 0, "HRESULT")
        return IAzOperations(ppOperationCollection)
    }

    /**
     * Returns a collection of the tasks, within the specified scope, that the principal represented by the current client context has permission to perform.
     * @param {BSTR} bstrScopeName The name of the scope to check.
     * @returns {IAzTasks} The address of a pointer to the collection of tasks that the principal represented by the current client context has permission to perform.
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazclientcontext3-gettasks
     */
    GetTasks(bstrScopeName) {
        bstrScopeName := bstrScopeName is String ? BSTR.Alloc(bstrScopeName).Value : bstrScopeName

        result := ComCall(29, this, "ptr", bstrScopeName, "ptr*", &ppTaskCollection := 0, "HRESULT")
        return IAzTasks(ppTaskCollection)
    }

    /**
     * Gets the collection of parameters that can be passed by the business rule (BizRule) script associated with this client context.
     * @returns {IAzBizRuleParameters} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazclientcontext3-get_bizruleparameters
     */
    get_BizRuleParameters() {
        result := ComCall(30, this, "ptr*", &ppBizRuleParam := 0, "HRESULT")
        return IAzBizRuleParameters(ppBizRuleParam)
    }

    /**
     * Gets the collection of IDispatch interfaces that can be called by the business rule (BizRule) script associated with this client context.
     * @returns {IAzBizRuleInterfaces} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazclientcontext3-get_bizruleinterfaces
     */
    get_BizRuleInterfaces() {
        result := ComCall(31, this, "ptr*", &ppBizRuleInterfaces := 0, "HRESULT")
        return IAzBizRuleInterfaces(ppBizRuleInterfaces)
    }

    /**
     * Returns an array of the application groups associated with this client context.
     * @param {BSTR} bstrScopeName The name of the scope in which to check for application groups. This parameter is ignored if the value of the ulOptions parameter is set to <b>AZ_CLIENT_CONTEXT_GET_GROUPS_STORE_LEVEL_ONLY</b>.
     * @param {Integer} ulOptions 
     * @returns {VARIANT} A pointer to an array of the names of application groups associated with this client context.
     * 
     * This is a variant that contains either a <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> or the  JScript <a href="https://docs.microsoft.com/scripting/javascript/reference/array-object-javascript">Array</a> object. Each element of the array holds a <b>VT_BSTR</b> that contains the name of an application group.
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazclientcontext3-getgroups
     */
    GetGroups(bstrScopeName, ulOptions) {
        bstrScopeName := bstrScopeName is String ? BSTR.Alloc(bstrScopeName).Value : bstrScopeName

        pGroupArray := VARIANT()
        result := ComCall(32, this, "ptr", bstrScopeName, "uint", ulOptions, "ptr", pGroupArray, "HRESULT")
        return pGroupArray
    }

    /**
     * Gets an array of the security identifiers (SIDs) associated with this client context.
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazclientcontext3-get_sids
     */
    get_Sids() {
        pStringSidArray := VARIANT()
        result := ComCall(33, this, "ptr", pStringSidArray, "HRESULT")
        return pStringSidArray
    }
}
