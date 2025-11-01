#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * @param {Pointer<Integer>} plResult 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazclientcontext3-accesscheck2
     */
    AccessCheck2(bstrObjectName, bstrScopeName, lOperation, plResult) {
        bstrObjectName := bstrObjectName is String ? BSTR.Alloc(bstrObjectName).Value : bstrObjectName
        bstrScopeName := bstrScopeName is String ? BSTR.Alloc(bstrScopeName).Value : bstrScopeName

        plResultMarshal := plResult is VarRef ? "uint*" : "ptr"

        result := ComCall(26, this, "ptr", bstrObjectName, "ptr", bstrScopeName, "int", lOperation, plResultMarshal, plResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrScopeName 
     * @param {BSTR} bstrRoleName 
     * @param {Pointer<VARIANT_BOOL>} pbIsInRole 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazclientcontext3-isinroleassignment
     */
    IsInRoleAssignment(bstrScopeName, bstrRoleName, pbIsInRole) {
        bstrScopeName := bstrScopeName is String ? BSTR.Alloc(bstrScopeName).Value : bstrScopeName
        bstrRoleName := bstrRoleName is String ? BSTR.Alloc(bstrRoleName).Value : bstrRoleName

        result := ComCall(27, this, "ptr", bstrScopeName, "ptr", bstrRoleName, "ptr", pbIsInRole, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrScopeName 
     * @param {Pointer<IAzOperations>} ppOperationCollection 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazclientcontext3-getoperations
     */
    GetOperations(bstrScopeName, ppOperationCollection) {
        bstrScopeName := bstrScopeName is String ? BSTR.Alloc(bstrScopeName).Value : bstrScopeName

        result := ComCall(28, this, "ptr", bstrScopeName, "ptr*", ppOperationCollection, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrScopeName 
     * @param {Pointer<IAzTasks>} ppTaskCollection 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazclientcontext3-gettasks
     */
    GetTasks(bstrScopeName, ppTaskCollection) {
        bstrScopeName := bstrScopeName is String ? BSTR.Alloc(bstrScopeName).Value : bstrScopeName

        result := ComCall(29, this, "ptr", bstrScopeName, "ptr*", ppTaskCollection, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IAzBizRuleParameters>} ppBizRuleParam 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazclientcontext3-get_bizruleparameters
     */
    get_BizRuleParameters(ppBizRuleParam) {
        result := ComCall(30, this, "ptr*", ppBizRuleParam, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IAzBizRuleInterfaces>} ppBizRuleInterfaces 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazclientcontext3-get_bizruleinterfaces
     */
    get_BizRuleInterfaces(ppBizRuleInterfaces) {
        result := ComCall(31, this, "ptr*", ppBizRuleInterfaces, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrScopeName 
     * @param {Integer} ulOptions 
     * @param {Pointer<VARIANT>} pGroupArray 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazclientcontext3-getgroups
     */
    GetGroups(bstrScopeName, ulOptions, pGroupArray) {
        bstrScopeName := bstrScopeName is String ? BSTR.Alloc(bstrScopeName).Value : bstrScopeName

        result := ComCall(32, this, "ptr", bstrScopeName, "uint", ulOptions, "ptr", pGroupArray, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pStringSidArray 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazclientcontext3-get_sids
     */
    get_Sids(pStringSidArray) {
        result := ComCall(33, this, "ptr", pStringSidArray, "HRESULT")
        return result
    }
}
