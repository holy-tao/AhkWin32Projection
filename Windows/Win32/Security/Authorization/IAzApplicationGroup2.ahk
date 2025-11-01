#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IAzApplicationGroup.ahk

/**
 * Extends the IAzApplicationGroup interface by adding support for the BizRule group type.
 * @see https://docs.microsoft.com/windows/win32/api//azroles/nn-azroles-iazapplicationgroup2
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 */
class IAzApplicationGroup2 extends IAzApplicationGroup{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAzApplicationGroup2
     * @type {Guid}
     */
    static IID => Guid("{3f0613fc-b71a-464e-a11d-5b881a56cefa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 39

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BizRule", "put_BizRule", "get_BizRuleLanguage", "put_BizRuleLanguage", "get_BizRuleImportedPath", "put_BizRuleImportedPath", "RoleAssignments"]

    /**
     * 
     * @param {Pointer<BSTR>} pbstrProp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplicationgroup2-get_bizrule
     */
    get_BizRule(pbstrProp) {
        result := ComCall(39, this, "ptr", pbstrProp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrProp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplicationgroup2-put_bizrule
     */
    put_BizRule(bstrProp) {
        bstrProp := bstrProp is String ? BSTR.Alloc(bstrProp).Value : bstrProp

        result := ComCall(40, this, "ptr", bstrProp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrProp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplicationgroup2-get_bizrulelanguage
     */
    get_BizRuleLanguage(pbstrProp) {
        result := ComCall(41, this, "ptr", pbstrProp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrProp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplicationgroup2-put_bizrulelanguage
     */
    put_BizRuleLanguage(bstrProp) {
        bstrProp := bstrProp is String ? BSTR.Alloc(bstrProp).Value : bstrProp

        result := ComCall(42, this, "ptr", bstrProp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrProp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplicationgroup2-get_bizruleimportedpath
     */
    get_BizRuleImportedPath(pbstrProp) {
        result := ComCall(43, this, "ptr", pbstrProp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrProp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplicationgroup2-put_bizruleimportedpath
     */
    put_BizRuleImportedPath(bstrProp) {
        bstrProp := bstrProp is String ? BSTR.Alloc(bstrProp).Value : bstrProp

        result := ComCall(44, this, "ptr", bstrProp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrScopeName 
     * @param {VARIANT_BOOL} bRecursive 
     * @param {Pointer<IAzRoleAssignments>} ppRoleAssignments 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplicationgroup2-roleassignments
     */
    RoleAssignments(bstrScopeName, bRecursive, ppRoleAssignments) {
        bstrScopeName := bstrScopeName is String ? BSTR.Alloc(bstrScopeName).Value : bstrScopeName

        result := ComCall(45, this, "ptr", bstrScopeName, "short", bRecursive, "ptr*", ppRoleAssignments, "HRESULT")
        return result
    }
}
