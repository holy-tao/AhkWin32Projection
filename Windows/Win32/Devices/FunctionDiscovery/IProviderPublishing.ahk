#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\SystemVisibilityFlags.ahk" { SystemVisibilityFlags }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IFunctionInstance.ahk" { IFunctionInstance }

/**
 * Is implemented by a discovery provider to enable a client program to add and remove function instances.
 * @remarks
 * Clients access the function instance through <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nf-functiondiscoveryapi-ifunctiondiscovery-addinstance">IFunctionDiscovery::AddInstance</a> and <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nf-functiondiscoveryapi-ifunctiondiscovery-removeinstance">IFunctionDiscovery::RemoveInstance</a>.
 * 
 * The <b>IProviderPublishing</b> interface can only be implemented by discovery providers that support category change notification. At this time only PnP providers support change notification.
 * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryprovider/nn-functiondiscoveryprovider-iproviderpublishing
 * @namespace Windows.Win32.Devices.FunctionDiscovery
 */
export default struct IProviderPublishing extends IUnknown {
    /**
     * The interface identifier for IProviderPublishing
     * @type {Guid}
     */
    static IID := Guid("{cd1b9a04-206c-4a05-a0c8-1635a21a2b7c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IProviderPublishing interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateInstance : IntPtr
        RemoveInstance : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IProviderPublishing.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates a new function instance.
     * @param {SystemVisibilityFlags} enumVisibilityFlags A <a href="https://docs.microsoft.com/windows/win32/api/functiondiscoveryapi/ne-functiondiscoveryapi-systemvisibilityflags">SystemVisibilityFlags</a> enumeration value that specifies the visibility of the function instance which the provider is about to create.  It is up to the provider whether or not to honor this flag, however the current user visibility can be used to allow processes running in a non-Administrator security context to still be able to add function instances.
     * @param {PWSTR} pszSubCategory The subcategory string for the function instance.
     * @param {PWSTR} pszProviderInstanceIdentity The provider instance identifier.
     * @returns {IFunctionInstance} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nn-functiondiscoveryapi-ifunctioninstance">IFunctionInstance</a> interface pointer used to return the newly created function instance.
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryprovider/nf-functiondiscoveryprovider-iproviderpublishing-createinstance
     */
    CreateInstance(enumVisibilityFlags, pszSubCategory, pszProviderInstanceIdentity) {
        pszSubCategory := pszSubCategory is String ? StrPtr(pszSubCategory) : pszSubCategory
        pszProviderInstanceIdentity := pszProviderInstanceIdentity is String ? StrPtr(pszProviderInstanceIdentity) : pszProviderInstanceIdentity

        result := ComCall(3, this, SystemVisibilityFlags, enumVisibilityFlags, "ptr", pszSubCategory, "ptr", pszProviderInstanceIdentity, "ptr*", &ppIFunctionInstance := 0, "HRESULT")
        return IFunctionInstance(ppIFunctionInstance)
    }

    /**
     * Deletes an existing function instance.
     * @param {SystemVisibilityFlags} enumVisibilityFlags A <a href="https://docs.microsoft.com/windows/win32/api/functiondiscoveryapi/ne-functiondiscoveryapi-systemvisibilityflags">SystemVisibilityFlags</a> enumeration value which specifies the visibility of the function instance which the provider is about to delete.  It is up to the provider whether or not to honor this setting, however the current user visibility can be used to allow processes running in a non-Administrator security context to still be able to remove function instances.
     * @param {PWSTR} pszSubCategory The subcategory string of the function instance.
     * @param {PWSTR} pszProviderInstanceIdentity The provider instance identifier.
     * @returns {HRESULT} Possible return values include, but are not limited to, the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters contains an invalid argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pSiteInfo</i>, <i>pszSubCategory</i>, or <i>pszProviderInstanceIdentity</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryprovider/nf-functiondiscoveryprovider-iproviderpublishing-removeinstance
     */
    RemoveInstance(enumVisibilityFlags, pszSubCategory, pszProviderInstanceIdentity) {
        pszSubCategory := pszSubCategory is String ? StrPtr(pszSubCategory) : pszSubCategory
        pszProviderInstanceIdentity := pszProviderInstanceIdentity is String ? StrPtr(pszProviderInstanceIdentity) : pszProviderInstanceIdentity

        result := ComCall(4, this, SystemVisibilityFlags, enumVisibilityFlags, "ptr", pszSubCategory, "ptr", pszProviderInstanceIdentity, "HRESULT")
        return result
    }

    Query(iid) {
        if (IProviderPublishing.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateInstance := CallbackCreate(GetMethod(implObj, "CreateInstance"), flags, 5)
        this.vtbl.RemoveInstance := CallbackCreate(GetMethod(implObj, "RemoveInstance"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateInstance)
        CallbackFree(this.vtbl.RemoveInstance)
    }
}
