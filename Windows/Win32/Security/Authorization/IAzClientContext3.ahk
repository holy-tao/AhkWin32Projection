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
     * 
     * @param {BSTR} bstrObjectName 
     * @param {BSTR} bstrScopeName 
     * @param {Integer} lOperation 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazclientcontext3-accesscheck2
     */
    AccessCheck2(bstrObjectName, bstrScopeName, lOperation) {
        bstrObjectName := bstrObjectName is String ? BSTR.Alloc(bstrObjectName).Value : bstrObjectName
        bstrScopeName := bstrScopeName is String ? BSTR.Alloc(bstrScopeName).Value : bstrScopeName

        result := ComCall(26, this, "ptr", bstrObjectName, "ptr", bstrScopeName, "int", lOperation, "uint*", &plResult := 0, "HRESULT")
        return plResult
    }

    /**
     * 
     * @param {BSTR} bstrScopeName 
     * @param {BSTR} bstrRoleName 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazclientcontext3-isinroleassignment
     */
    IsInRoleAssignment(bstrScopeName, bstrRoleName) {
        bstrScopeName := bstrScopeName is String ? BSTR.Alloc(bstrScopeName).Value : bstrScopeName
        bstrRoleName := bstrRoleName is String ? BSTR.Alloc(bstrRoleName).Value : bstrRoleName

        result := ComCall(27, this, "ptr", bstrScopeName, "ptr", bstrRoleName, "short*", &pbIsInRole := 0, "HRESULT")
        return pbIsInRole
    }

    /**
     * 
     * @param {BSTR} bstrScopeName 
     * @returns {IAzOperations} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazclientcontext3-getoperations
     */
    GetOperations(bstrScopeName) {
        bstrScopeName := bstrScopeName is String ? BSTR.Alloc(bstrScopeName).Value : bstrScopeName

        result := ComCall(28, this, "ptr", bstrScopeName, "ptr*", &ppOperationCollection := 0, "HRESULT")
        return IAzOperations(ppOperationCollection)
    }

    /**
     * 
     * @param {BSTR} bstrScopeName 
     * @returns {IAzTasks} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazclientcontext3-gettasks
     */
    GetTasks(bstrScopeName) {
        bstrScopeName := bstrScopeName is String ? BSTR.Alloc(bstrScopeName).Value : bstrScopeName

        result := ComCall(29, this, "ptr", bstrScopeName, "ptr*", &ppTaskCollection := 0, "HRESULT")
        return IAzTasks(ppTaskCollection)
    }

    /**
     * 
     * @returns {IAzBizRuleParameters} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazclientcontext3-get_bizruleparameters
     */
    get_BizRuleParameters() {
        result := ComCall(30, this, "ptr*", &ppBizRuleParam := 0, "HRESULT")
        return IAzBizRuleParameters(ppBizRuleParam)
    }

    /**
     * 
     * @returns {IAzBizRuleInterfaces} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazclientcontext3-get_bizruleinterfaces
     */
    get_BizRuleInterfaces() {
        result := ComCall(31, this, "ptr*", &ppBizRuleInterfaces := 0, "HRESULT")
        return IAzBizRuleInterfaces(ppBizRuleInterfaces)
    }

    /**
     * 
     * @param {BSTR} bstrScopeName 
     * @param {Integer} ulOptions 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazclientcontext3-getgroups
     */
    GetGroups(bstrScopeName, ulOptions) {
        bstrScopeName := bstrScopeName is String ? BSTR.Alloc(bstrScopeName).Value : bstrScopeName

        pGroupArray := VARIANT()
        result := ComCall(32, this, "ptr", bstrScopeName, "uint", ulOptions, "ptr", pGroupArray, "HRESULT")
        return pGroupArray
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazclientcontext3-get_sids
     */
    get_Sids() {
        pStringSidArray := VARIANT()
        result := ComCall(33, this, "ptr", pStringSidArray, "HRESULT")
        return pStringSidArray
    }
}
