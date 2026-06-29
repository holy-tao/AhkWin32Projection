#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import "..\Variant\VARIANT.ahk" { VARIANT }

/**
 * Provides access to a collection of security information representing a caller's identity. The items available in this collection are the SID, the account name, the authentication service, the authentication level, and the impersonation level.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-isecurityidentitycoll
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct ISecurityIdentityColl extends IDispatch {
    /**
     * The interface identifier for ISecurityIdentityColl
     * @type {Guid}
     */
    static IID := Guid("{cafc823c-b441-11d1-b82b-0000f8757e2a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISecurityIdentityColl interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Count    : IntPtr
        get_Item     : IntPtr
        get__NewEnum : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISecurityIdentityColl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * Retrieves the number of properties in the security identity collection.
     * @returns {Integer} The number of properties in the security identity collection.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-isecurityidentitycoll-get_count
     */
    get_Count() {
        result := ComCall(7, this, "int*", &plCount := 0, "HRESULT")
        return plCount
    }

    /**
     * Retrieves a specified property in the security identity collection.
     * @remarks
     * This collection represents a security identity, which provides information about a particular caller in the chain of calls ending with the current call. For each item in the security identity collection, the following table provides a description, the index name used to retrieve it, and the returned data type of the item.
     * 
     * <table>
     * <tr>
     * <th>Item</th>
     * <th>Description</th>
     * <th>Index name</th>
     * <th>Returned type</th>
     * </tr>
     * <tr>
     * <td>SID
     * </td>
     * <td>The security identifier of the caller.</td>
     * <td>"SID"
     * </td>
     * <td>V_ARRAY</td>
     * </tr>
     * <tr>
     * <td>Account Name
     * </td>
     * <td>The account name that the caller is using.</td>
     * <td>"AccountName"
     * </td>
     * <td>V_BSTR</td>
     * </tr>
     * <tr>
     * <td>Authentication Service
     * </td>
     * <td>The authentication service used by the caller, such as NTLMSSP, Kerberos, or SSL.</td>
     * <td>"AuthenticationService"
     * </td>
     * <td>V_I4</td>
     * </tr>
     * <tr>
     * <td>Impersonation Level
     * </td>
     * <td>The impersonation level, which indicates how much authority the caller has been given to act on a client's behalf.</td>
     * <td>"ImpersonationLevel"
     * </td>
     * <td>V_I4</td>
     * </tr>
     * <tr>
     * <td>Authentication Level
     * </td>
     * <td>The authentication level used by the caller, which indicates the amount of protection given during the call.</td>
     * <td>"AuthenticationLevel"
     * </td>
     * <td>V_I4</td>
     * </tr>
     * </table>
     * @param {BSTR} name The name of the property to be retrieved. See Remarks for information about the available properties.
     * @returns {VARIANT} A reference to the retrieved property.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-isecurityidentitycoll-get_item
     */
    get_Item(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        pItem := VARIANT()
        result := ComCall(8, this, BSTR, name, VARIANT.Ptr, pItem, "HRESULT")
        return pItem
    }

    /**
     * Retrieves an enumerator for the security identity collection.
     * @returns {IUnknown} A reference to the returned <a href="https://docs.microsoft.com/windows/win32/api/oaidl/nn-oaidl-ienumvariant">IEnumVARIANT</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-isecurityidentitycoll-get__newenum
     */
    get__NewEnum() {
        result := ComCall(9, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IUnknown(ppEnum)
    }

    Query(iid) {
        if (ISecurityIdentityColl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Count := CallbackCreate(GetMethod(implObj, "get_Count"), flags, 2)
        this.vtbl.get_Item := CallbackCreate(GetMethod(implObj, "get_Item"), flags, 3)
        this.vtbl.get__NewEnum := CallbackCreate(GetMethod(implObj, "get__NewEnum"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Count)
        CallbackFree(this.vtbl.get_Item)
        CallbackFree(this.vtbl.get__NewEnum)
    }
}
