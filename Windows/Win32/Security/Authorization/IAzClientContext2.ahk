#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IAzClientContext.ahk

/**
 * Inherits from the IAzClientContext interface and implements new methods that manipulate the client context.
 * @see https://docs.microsoft.com/windows/win32/api//azroles/nn-azroles-iazclientcontext2
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 */
class IAzClientContext2 extends IAzClientContext{
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
     * 
     * @param {Integer} lOptions 
     * @param {Integer} PageSize 
     * @param {Pointer<VARIANT>} pvarCursor 
     * @param {Pointer<VARIANT>} pvarScopeNames 
     * @returns {HRESULT} 
     */
    GetAssignedScopesPage(lOptions, PageSize, pvarCursor, pvarScopeNames) {
        result := ComCall(20, this, "int", lOptions, "int", PageSize, "ptr", pvarCursor, "ptr", pvarScopeNames, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} varRoles 
     * @param {BSTR} bstrScopeName 
     * @returns {HRESULT} 
     */
    AddRoles(varRoles, bstrScopeName) {
        bstrScopeName := bstrScopeName is String ? BSTR.Alloc(bstrScopeName).Value : bstrScopeName

        result := ComCall(21, this, "ptr", varRoles, "ptr", bstrScopeName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} varApplicationGroups 
     * @returns {HRESULT} 
     */
    AddApplicationGroups(varApplicationGroups) {
        result := ComCall(22, this, "ptr", varApplicationGroups, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} varStringSids 
     * @returns {HRESULT} 
     */
    AddStringSids(varStringSids) {
        result := ComCall(23, this, "ptr", varStringSids, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrLDAPQueryDN 
     * @returns {HRESULT} 
     */
    put_LDAPQueryDN(bstrLDAPQueryDN) {
        bstrLDAPQueryDN := bstrLDAPQueryDN is String ? BSTR.Alloc(bstrLDAPQueryDN).Value : bstrLDAPQueryDN

        result := ComCall(24, this, "ptr", bstrLDAPQueryDN, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrLDAPQueryDN 
     * @returns {HRESULT} 
     */
    get_LDAPQueryDN(pbstrLDAPQueryDN) {
        result := ComCall(25, this, "ptr", pbstrLDAPQueryDN, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
