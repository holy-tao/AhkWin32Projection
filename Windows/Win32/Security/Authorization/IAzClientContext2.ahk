#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\IAzClientContext.ahk

/**
 * Inherits from the IAzClientContext interface and implements new methods that manipulate the client context.
 * @see https://docs.microsoft.com/windows/win32/api//azroles/nn-azroles-iazclientcontext2
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 */
class IAzClientContext2 extends IAzClientContext{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAzClientContext2
     * @type {Guid}
     */
    static IID => Guid("{2b0c92b8-208a-488a-8f81-e4edb22111cd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 20

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAssignedScopesPage", "AddRoles", "AddApplicationGroups", "AddStringSids", "put_LDAPQueryDN", "get_LDAPQueryDN"]

    /**
     * 
     * @param {Integer} lOptions 
     * @param {Integer} PageSize 
     * @param {Pointer<VARIANT>} pvarCursor 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazclientcontext2-getassignedscopespage
     */
    GetAssignedScopesPage(lOptions, PageSize, pvarCursor) {
        pvarScopeNames := VARIANT()
        result := ComCall(20, this, "int", lOptions, "int", PageSize, "ptr", pvarCursor, "ptr", pvarScopeNames, "HRESULT")
        return pvarScopeNames
    }

    /**
     * 
     * @param {VARIANT} varRoles 
     * @param {BSTR} bstrScopeName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazclientcontext2-addroles
     */
    AddRoles(varRoles, bstrScopeName) {
        bstrScopeName := bstrScopeName is String ? BSTR.Alloc(bstrScopeName).Value : bstrScopeName

        result := ComCall(21, this, "ptr", varRoles, "ptr", bstrScopeName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} varApplicationGroups 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazclientcontext2-addapplicationgroups
     */
    AddApplicationGroups(varApplicationGroups) {
        result := ComCall(22, this, "ptr", varApplicationGroups, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} varStringSids 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazclientcontext2-addstringsids
     */
    AddStringSids(varStringSids) {
        result := ComCall(23, this, "ptr", varStringSids, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrLDAPQueryDN 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazclientcontext2-put_ldapquerydn
     */
    put_LDAPQueryDN(bstrLDAPQueryDN) {
        bstrLDAPQueryDN := bstrLDAPQueryDN is String ? BSTR.Alloc(bstrLDAPQueryDN).Value : bstrLDAPQueryDN

        result := ComCall(24, this, "ptr", bstrLDAPQueryDN, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazclientcontext2-get_ldapquerydn
     */
    get_LDAPQueryDN() {
        pbstrLDAPQueryDN := BSTR()
        result := ComCall(25, this, "ptr", pbstrLDAPQueryDN, "HRESULT")
        return pbstrLDAPQueryDN
    }
}
