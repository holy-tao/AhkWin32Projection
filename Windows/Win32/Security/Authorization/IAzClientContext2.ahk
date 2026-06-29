#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IAzClientContext.ahk" { IAzClientContext }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * Inherits from the IAzClientContext interface and implements new methods that manipulate the client context.
 * @see https://learn.microsoft.com/windows/win32/api/azroles/nn-azroles-iazclientcontext2
 * @namespace Windows.Win32.Security.Authorization
 */
export default struct IAzClientContext2 extends IAzClientContext {
    /**
     * The interface identifier for IAzClientContext2
     * @type {Guid}
     */
    static IID := Guid("{2b0c92b8-208a-488a-8f81-e4edb22111cd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAzClientContext2 interfaces
    */
    struct Vtbl extends IAzClientContext.Vtbl {
        GetAssignedScopesPage : IntPtr
        AddRoles              : IntPtr
        AddApplicationGroups  : IntPtr
        AddStringSids         : IntPtr
        put_LDAPQueryDN       : IntPtr
        get_LDAPQueryDN       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAzClientContext2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    LDAPQueryDN {
        get => this.get_LDAPQueryDN()
        set => this.put_LDAPQueryDN(value)
    }

    /**
     * Retrieves a list of the scopes in which the client represented by the current IAzClientContext2 object is assigned to at least one role.
     * @remarks
     * If multiple threads access the same authorization store, a call to the  <b>GetAssignedScopesPage</b> method on one of the threads might not return accurate results if the other thread modifies the store.
     * 
     * In  JScript, the returned <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> values must be converted to the JScript <a href="https://docs.microsoft.com/scripting/javascript/reference/array-object-javascript">Array</a> object.
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
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazclientcontext2-getassignedscopespage
     */
    GetAssignedScopesPage(lOptions, PageSize, pvarCursor) {
        pvarScopeNames := VARIANT()
        result := ComCall(20, this, "int", lOptions, "int", PageSize, VARIANT.Ptr, pvarCursor, VARIANT.Ptr, pvarScopeNames, "HRESULT")
        return pvarScopeNames
    }

    /**
     * Adds the specified array of existing IAzRole objects to the client context.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazrole">IAzRole</a> objects associated with the names in the <i>varRoles</i> array must already exist in the specified scope.
     * 
     * The added roles are used in subsequent calls to the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazclientcontext-accesscheck">AccessCheck</a> and <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazclientcontext-getroles">GetRoles</a> methods.
     * @param {VARIANT} varRoles The array of role names that specify the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazrole">IAzRole</a> objects to add to the client context.
     * @param {BSTR} bstrScopeName The scope to which the array of roles applies.
     * @returns {HRESULT} If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazclientcontext2-addroles
     */
    AddRoles(varRoles, bstrScopeName) {
        bstrScopeName := bstrScopeName is String ? BSTR.Alloc(bstrScopeName).Value : bstrScopeName

        result := ComCall(21, this, VARIANT, varRoles, BSTR, bstrScopeName, "HRESULT")
        return result
    }

    /**
     * Adds the specified array of existing IAzApplicationGroup objects to the client context object.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplicationgroup">IAzApplicationGroup</a> objects in the <i>varApplicationGroups</i> array must already exist in the authorization store.
     * 
     * The added roles are used in subsequent calls to the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazclientcontext-accesscheck">AccessCheck</a> and <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazclientcontext-getroles">GetRoles</a> methods.
     * @param {VARIANT} varApplicationGroups The array of <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplicationgroup">IAzApplicationGroup</a> objects to add.
     * @returns {HRESULT} If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazclientcontext2-addapplicationgroups
     */
    AddApplicationGroups(varApplicationGroups) {
        result := ComCall(22, this, VARIANT, varApplicationGroups, "HRESULT")
        return result
    }

    /**
     * Adds an array of string representations of security identifiers (SIDs) to the client context.
     * @param {VARIANT} varStringSids The array of string representations of SIDs to add to the client context.
     * @returns {HRESULT} If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazclientcontext2-addstringsids
     */
    AddStringSids(varStringSids) {
        result := ComCall(23, this, VARIANT, varStringSids, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the domain name of the directory object to be used during evaluation of LDAP query groups. (Put)
     * @param {BSTR} bstrLDAPQueryDN 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazclientcontext2-put_ldapquerydn
     */
    put_LDAPQueryDN(bstrLDAPQueryDN) {
        bstrLDAPQueryDN := bstrLDAPQueryDN is String ? BSTR.Alloc(bstrLDAPQueryDN).Value : bstrLDAPQueryDN

        result := ComCall(24, this, BSTR, bstrLDAPQueryDN, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the domain name of the directory object to be used during evaluation of LDAP query groups. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazclientcontext2-get_ldapquerydn
     */
    get_LDAPQueryDN() {
        pbstrLDAPQueryDN := BSTR.Owned()
        result := ComCall(25, this, BSTR.Ptr, pbstrLDAPQueryDN, "HRESULT")
        return pbstrLDAPQueryDN
    }

    Query(iid) {
        if (IAzClientContext2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetAssignedScopesPage := CallbackCreate(GetMethod(implObj, "GetAssignedScopesPage"), flags, 5)
        this.vtbl.AddRoles := CallbackCreate(GetMethod(implObj, "AddRoles"), flags, 3)
        this.vtbl.AddApplicationGroups := CallbackCreate(GetMethod(implObj, "AddApplicationGroups"), flags, 2)
        this.vtbl.AddStringSids := CallbackCreate(GetMethod(implObj, "AddStringSids"), flags, 2)
        this.vtbl.put_LDAPQueryDN := CallbackCreate(GetMethod(implObj, "put_LDAPQueryDN"), flags, 2)
        this.vtbl.get_LDAPQueryDN := CallbackCreate(GetMethod(implObj, "get_LDAPQueryDN"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetAssignedScopesPage)
        CallbackFree(this.vtbl.AddRoles)
        CallbackFree(this.vtbl.AddApplicationGroups)
        CallbackFree(this.vtbl.AddStringSids)
        CallbackFree(this.vtbl.put_LDAPQueryDN)
        CallbackFree(this.vtbl.get_LDAPQueryDN)
    }
}
