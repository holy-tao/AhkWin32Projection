#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IAzClientContext2.ahk" { IAzClientContext2 }
#Import ".\IAzBizRuleParameters.ahk" { IAzBizRuleParameters }
#Import ".\IAzTasks.ahk" { IAzTasks }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IAzBizRuleInterfaces.ahk" { IAzBizRuleInterfaces }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }
#Import ".\IAzOperations.ahk" { IAzOperations }

/**
 * Extends the IAzClientContext2 interface.
 * @see https://learn.microsoft.com/windows/win32/api/azroles/nn-azroles-iazclientcontext3
 * @namespace Windows.Win32.Security.Authorization
 */
export default struct IAzClientContext3 extends IAzClientContext2 {
    /**
     * The interface identifier for IAzClientContext3
     * @type {Guid}
     */
    static IID := Guid("{11894fde-1deb-4b4b-8907-6d1cda1f5d4f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAzClientContext3 interfaces
    */
    struct Vtbl extends IAzClientContext2.Vtbl {
        AccessCheck2          : IntPtr
        IsInRoleAssignment    : IntPtr
        GetOperations         : IntPtr
        GetTasks              : IntPtr
        get_BizRuleParameters : IntPtr
        get_BizRuleInterfaces : IntPtr
        GetGroups             : IntPtr
        get_Sids              : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAzClientContext3.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazclientcontext3-accesscheck2
     */
    AccessCheck2(bstrObjectName, bstrScopeName, lOperation) {
        bstrObjectName := bstrObjectName is String ? BSTR.Alloc(bstrObjectName).Value : bstrObjectName
        bstrScopeName := bstrScopeName is String ? BSTR.Alloc(bstrScopeName).Value : bstrScopeName

        result := ComCall(26, this, BSTR, bstrObjectName, BSTR, bstrScopeName, "int", lOperation, "uint*", &plResult := 0, "HRESULT")
        return plResult
    }

    /**
     * Checks whether the principal represented by the current client context is a member of the specified role in the specified scope.
     * @param {BSTR} bstrScopeName The name of the scope to check.
     * @param {BSTR} bstrRoleName The name of the role to check.
     * @returns {VARIANT_BOOL} <b>VARIANT_TRUE</b> if the principal represented by the current client context is a member of the role specified by the <i>bstrRoleName</i> parameter in the scope specified by the <i>bstrScopeName</i> parameter; otherwise, <b>VARIANT_FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazclientcontext3-isinroleassignment
     */
    IsInRoleAssignment(bstrScopeName, bstrRoleName) {
        bstrScopeName := bstrScopeName is String ? BSTR.Alloc(bstrScopeName).Value : bstrScopeName
        bstrRoleName := bstrRoleName is String ? BSTR.Alloc(bstrRoleName).Value : bstrRoleName

        result := ComCall(27, this, BSTR, bstrScopeName, BSTR, bstrRoleName, VARIANT_BOOL.Ptr, &pbIsInRole := 0, "HRESULT")
        return pbIsInRole
    }

    /**
     * Returns a collection of the operations, within the specified scope, that the principal represented by the current client context has permission to perform.
     * @param {BSTR} bstrScopeName The name of the scope to check.
     * @returns {IAzOperations} The address of a pointer to the collection of operations that the principal represented by the current client context has permission to perform.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazclientcontext3-getoperations
     */
    GetOperations(bstrScopeName) {
        bstrScopeName := bstrScopeName is String ? BSTR.Alloc(bstrScopeName).Value : bstrScopeName

        result := ComCall(28, this, BSTR, bstrScopeName, "ptr*", &ppOperationCollection := 0, "HRESULT")
        return IAzOperations(ppOperationCollection)
    }

    /**
     * Returns a collection of the tasks, within the specified scope, that the principal represented by the current client context has permission to perform.
     * @param {BSTR} bstrScopeName The name of the scope to check.
     * @returns {IAzTasks} The address of a pointer to the collection of tasks that the principal represented by the current client context has permission to perform.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazclientcontext3-gettasks
     */
    GetTasks(bstrScopeName) {
        bstrScopeName := bstrScopeName is String ? BSTR.Alloc(bstrScopeName).Value : bstrScopeName

        result := ComCall(29, this, BSTR, bstrScopeName, "ptr*", &ppTaskCollection := 0, "HRESULT")
        return IAzTasks(ppTaskCollection)
    }

    /**
     * Gets the collection of parameters that can be passed by the business rule (BizRule) script associated with this client context.
     * @returns {IAzBizRuleParameters} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazclientcontext3-get_bizruleparameters
     */
    get_BizRuleParameters() {
        result := ComCall(30, this, "ptr*", &ppBizRuleParam := 0, "HRESULT")
        return IAzBizRuleParameters(ppBizRuleParam)
    }

    /**
     * Gets the collection of IDispatch interfaces that can be called by the business rule (BizRule) script associated with this client context.
     * @returns {IAzBizRuleInterfaces} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazclientcontext3-get_bizruleinterfaces
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
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazclientcontext3-getgroups
     */
    GetGroups(bstrScopeName, ulOptions) {
        bstrScopeName := bstrScopeName is String ? BSTR.Alloc(bstrScopeName).Value : bstrScopeName

        pGroupArray := VARIANT()
        result := ComCall(32, this, BSTR, bstrScopeName, "uint", ulOptions, VARIANT.Ptr, pGroupArray, "HRESULT")
        return pGroupArray
    }

    /**
     * Gets an array of the security identifiers (SIDs) associated with this client context.
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazclientcontext3-get_sids
     */
    get_Sids() {
        pStringSidArray := VARIANT()
        result := ComCall(33, this, VARIANT.Ptr, pStringSidArray, "HRESULT")
        return pStringSidArray
    }

    Query(iid) {
        if (IAzClientContext3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AccessCheck2 := CallbackCreate(GetMethod(implObj, "AccessCheck2"), flags, 5)
        this.vtbl.IsInRoleAssignment := CallbackCreate(GetMethod(implObj, "IsInRoleAssignment"), flags, 4)
        this.vtbl.GetOperations := CallbackCreate(GetMethod(implObj, "GetOperations"), flags, 3)
        this.vtbl.GetTasks := CallbackCreate(GetMethod(implObj, "GetTasks"), flags, 3)
        this.vtbl.get_BizRuleParameters := CallbackCreate(GetMethod(implObj, "get_BizRuleParameters"), flags, 2)
        this.vtbl.get_BizRuleInterfaces := CallbackCreate(GetMethod(implObj, "get_BizRuleInterfaces"), flags, 2)
        this.vtbl.GetGroups := CallbackCreate(GetMethod(implObj, "GetGroups"), flags, 4)
        this.vtbl.get_Sids := CallbackCreate(GetMethod(implObj, "get_Sids"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AccessCheck2)
        CallbackFree(this.vtbl.IsInRoleAssignment)
        CallbackFree(this.vtbl.GetOperations)
        CallbackFree(this.vtbl.GetTasks)
        CallbackFree(this.vtbl.get_BizRuleParameters)
        CallbackFree(this.vtbl.get_BizRuleInterfaces)
        CallbackFree(this.vtbl.GetGroups)
        CallbackFree(this.vtbl.get_Sids)
    }
}
