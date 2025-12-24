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
     * @type {BSTR} 
     */
    LDAPQueryDN {
        get => this.get_LDAPQueryDN()
        set => this.put_LDAPQueryDN(value)
    }

    /**
     * Retrieves a list of the scopes in which the client represented by the current IAzClientContext2 object is assigned to at least one role.
     * @param {Integer} lOptions A flag that specifies whether this method checks LDAP query groups for scope assignment. Previously cached LDAP query groups are checked regardless of the value of this flag.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_CLIENT_CONTEXT_SKIP_LDAP_QUERY"></a><a id="az_client_context_skip_ldap_query"></a><dl>
     * <dt><b>AZ_CLIENT_CONTEXT_SKIP_LDAP_QUERY</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * LDAP query groups that were not previously cached are not checked.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} PageSize The number of elements in each page result.
     * @param {Pointer<VARIANT>} pvarCursor A pointer to a <b>VARIANT</b> that represents the current page of results. For the first call to the  <b>GetAssignedScopesPage</b> method, pass <b>VT_EMPTY</b> as the value for this parameter to retrieve the first page of results. The number of elements on a page is determined by the value of the <i>PageSize</i> parameter. On output, this parameter contains the value to be passed in the next call to <b>GetAssignedScopesPage</b> to retrieve the next page of results. If the value of this parameter on output is <b>EMPTY</b>, there are no more result pages.
     * @returns {VARIANT} On return, contains an array of variables of type <b>VARIANT</b>. Each element of the array is of type <b>VT_BSTR</b> and contains the name of a scope to which the current client is assigned. The number of elements in the array is specified by the <i>PageSize</i> parameter.
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazclientcontext2-getassignedscopespage
     */
    GetAssignedScopesPage(lOptions, PageSize, pvarCursor) {
        pvarScopeNames := VARIANT()
        result := ComCall(20, this, "int", lOptions, "int", PageSize, "ptr", pvarCursor, "ptr", pvarScopeNames, "HRESULT")
        return pvarScopeNames
    }

    /**
     * Adds the specified array of existing IAzRole objects to the client context.
     * @param {VARIANT} varRoles The array of role names that specify the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazrole">IAzRole</a> objects to add to the client context.
     * @param {BSTR} bstrScopeName The scope to which the array of roles applies.
     * @returns {HRESULT} If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazclientcontext2-addroles
     */
    AddRoles(varRoles, bstrScopeName) {
        bstrScopeName := bstrScopeName is String ? BSTR.Alloc(bstrScopeName).Value : bstrScopeName

        result := ComCall(21, this, "ptr", varRoles, "ptr", bstrScopeName, "HRESULT")
        return result
    }

    /**
     * Adds the specified array of existing IAzApplicationGroup objects to the client context object.
     * @param {VARIANT} varApplicationGroups The array of <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplicationgroup">IAzApplicationGroup</a> objects to add.
     * @returns {HRESULT} If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazclientcontext2-addapplicationgroups
     */
    AddApplicationGroups(varApplicationGroups) {
        result := ComCall(22, this, "ptr", varApplicationGroups, "HRESULT")
        return result
    }

    /**
     * Adds an array of string representations of security identifiers (SIDs) to the client context.
     * @param {VARIANT} varStringSids The array of string representations of SIDs to add to the client context.
     * @returns {HRESULT} If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazclientcontext2-addstringsids
     */
    AddStringSids(varStringSids) {
        result := ComCall(23, this, "ptr", varStringSids, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the domain name of the directory object to be used during evaluation of LDAP query groups.
     * @param {BSTR} bstrLDAPQueryDN 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazclientcontext2-put_ldapquerydn
     */
    put_LDAPQueryDN(bstrLDAPQueryDN) {
        bstrLDAPQueryDN := bstrLDAPQueryDN is String ? BSTR.Alloc(bstrLDAPQueryDN).Value : bstrLDAPQueryDN

        result := ComCall(24, this, "ptr", bstrLDAPQueryDN, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the domain name of the directory object to be used during evaluation of LDAP query groups.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazclientcontext2-get_ldapquerydn
     */
    get_LDAPQueryDN() {
        pbstrLDAPQueryDN := BSTR()
        result := ComCall(25, this, "ptr", pbstrLDAPQueryDN, "HRESULT")
        return pbstrLDAPQueryDN
    }
}
