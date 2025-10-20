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
     * 
     * @param {BSTR} bstrObjectName 
     * @param {BSTR} bstrScopeName 
     * @param {Integer} lOperation 
     * @param {Pointer<UInt32>} plResult 
     * @returns {HRESULT} 
     */
    AccessCheck2(bstrObjectName, bstrScopeName, lOperation, plResult) {
        bstrObjectName := bstrObjectName is String ? BSTR.Alloc(bstrObjectName).Value : bstrObjectName
        bstrScopeName := bstrScopeName is String ? BSTR.Alloc(bstrScopeName).Value : bstrScopeName

        result := ComCall(26, this, "ptr", bstrObjectName, "ptr", bstrScopeName, "int", lOperation, "uint*", plResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrScopeName 
     * @param {BSTR} bstrRoleName 
     * @param {Pointer<VARIANT_BOOL>} pbIsInRole 
     * @returns {HRESULT} 
     */
    IsInRoleAssignment(bstrScopeName, bstrRoleName, pbIsInRole) {
        bstrScopeName := bstrScopeName is String ? BSTR.Alloc(bstrScopeName).Value : bstrScopeName
        bstrRoleName := bstrRoleName is String ? BSTR.Alloc(bstrRoleName).Value : bstrRoleName

        result := ComCall(27, this, "ptr", bstrScopeName, "ptr", bstrRoleName, "ptr", pbIsInRole, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrScopeName 
     * @param {Pointer<IAzOperations>} ppOperationCollection 
     * @returns {HRESULT} 
     */
    GetOperations(bstrScopeName, ppOperationCollection) {
        bstrScopeName := bstrScopeName is String ? BSTR.Alloc(bstrScopeName).Value : bstrScopeName

        result := ComCall(28, this, "ptr", bstrScopeName, "ptr", ppOperationCollection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrScopeName 
     * @param {Pointer<IAzTasks>} ppTaskCollection 
     * @returns {HRESULT} 
     */
    GetTasks(bstrScopeName, ppTaskCollection) {
        bstrScopeName := bstrScopeName is String ? BSTR.Alloc(bstrScopeName).Value : bstrScopeName

        result := ComCall(29, this, "ptr", bstrScopeName, "ptr", ppTaskCollection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IAzBizRuleParameters>} ppBizRuleParam 
     * @returns {HRESULT} 
     */
    get_BizRuleParameters(ppBizRuleParam) {
        result := ComCall(30, this, "ptr", ppBizRuleParam, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IAzBizRuleInterfaces>} ppBizRuleInterfaces 
     * @returns {HRESULT} 
     */
    get_BizRuleInterfaces(ppBizRuleInterfaces) {
        result := ComCall(31, this, "ptr", ppBizRuleInterfaces, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrScopeName 
     * @param {Integer} ulOptions 
     * @param {Pointer<VARIANT>} pGroupArray 
     * @returns {HRESULT} 
     */
    GetGroups(bstrScopeName, ulOptions, pGroupArray) {
        bstrScopeName := bstrScopeName is String ? BSTR.Alloc(bstrScopeName).Value : bstrScopeName

        result := ComCall(32, this, "ptr", bstrScopeName, "uint", ulOptions, "ptr", pGroupArray, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pStringSidArray 
     * @returns {HRESULT} 
     */
    get_Sids(pStringSidArray) {
        result := ComCall(33, this, "ptr", pStringSidArray, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
