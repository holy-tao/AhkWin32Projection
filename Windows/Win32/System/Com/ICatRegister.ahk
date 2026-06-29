#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IUnknown.ahk" { IUnknown }
#Import ".\CATEGORYINFO.ahk" { CATEGORYINFO }

/**
 * Provides methods for registering and unregistering component category information in the registry. This includes both the human-readable names of categories and the categories implemented/required by a given component or class.
 * @see https://learn.microsoft.com/windows/win32/api/comcat/nn-comcat-icatregister
 * @namespace Windows.Win32.System.Com
 */
export default struct ICatRegister extends IUnknown {
    /**
     * The interface identifier for ICatRegister
     * @type {Guid}
     */
    static IID := Guid("{0002e012-0000-0000-c000-000000000046}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICatRegister interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        RegisterCategories            : IntPtr
        UnRegisterCategories          : IntPtr
        RegisterClassImplCategories   : IntPtr
        UnRegisterClassImplCategories : IntPtr
        RegisterClassReqCategories    : IntPtr
        UnRegisterClassReqCategories  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICatRegister.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Registers one or more component categories. Each component category consists of a CATID and a list of locale-dependent description strings.
     * @remarks
     * This method can only be called by the owner of a category, usually as part of the installation or de-installation of the operating system or application.
     * @param {Integer} cCategories The number of component categories to be registered.
     * @param {Pointer<CATEGORYINFO>} rgCategoryInfo An array of <a href="https://docs.microsoft.com/windows/desktop/api/comcat/ns-comcat-categoryinfo">CATEGORYINFO</a> structures, one for each category to be registered. By providing the same CATID for multiple <b>CATEGORYINFO</b> structures, multiple locales can be registered for the same component category.
     * @returns {HRESULT} This method can return the following values.
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
     * One or more arguments are incorrect.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/comcat/nf-comcat-icatregister-registercategories
     */
    RegisterCategories(cCategories, rgCategoryInfo) {
        result := ComCall(3, this, "uint", cCategories, CATEGORYINFO.Ptr, rgCategoryInfo, "HRESULT")
        return result
    }

    /**
     * Removes the registration of one or more component categories. Each component category consists of a CATID and a list of locale-dependent description strings.
     * @remarks
     * This method will be successful even if one or more of the category IDs specified are not registered. This method can only be called by the owner of a category, usually as part of the installation or de-installation of the operating system or application.
     * 
     * This method does not remove the component category tags from individual classes. To do this, use the <a href="https://docs.microsoft.com/windows/desktop/api/comcat/nf-comcat-icatregister-unregisterclassreqcategories">ICatRegister::UnRegisterClassReqCategories</a> method.
     * @param {Integer} cCategories The number of categories to be removed.
     * @param {Pointer<Guid>} rgcatid The CATIDs of the categories to be removed.
     * @returns {HRESULT} This method can return the following values.
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
     * One or more arguments are incorrect.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/comcat/nf-comcat-icatregister-unregistercategories
     */
    UnRegisterCategories(cCategories, rgcatid) {
        result := ComCall(4, this, "uint", cCategories, Guid.Ptr, rgcatid, "HRESULT")
        return result
    }

    /**
     * Registers the class as implementing one or more component categories.
     * @remarks
     * In case of an error, this method does not ensure that the registry is restored to the state prior to the call. This method can only be called by the owner of a class, usually as part of the installation of the component.
     * @param {Pointer<Guid>} rclsid The class identifier.
     * @param {Integer} cCategories The number of categories to be associated as category identifiers for the class.
     * @param {Pointer<Guid>} rgcatid An array of CATIDs to associate as category identifiers for the class.
     * @returns {HRESULT} This method can return the following values.
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
     * One or more arguments are incorrect.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/comcat/nf-comcat-icatregister-registerclassimplcategories
     */
    RegisterClassImplCategories(rclsid, cCategories, rgcatid) {
        result := ComCall(5, this, Guid.Ptr, rclsid, "uint", cCategories, Guid.Ptr, rgcatid, "HRESULT")
        return result
    }

    /**
     * Removes one or more implemented category identifiers from a class.
     * @remarks
     * In case of an error, this method does not ensure that the registry is restored to the state prior to the call. This method will be successful even if one or more of the category IDs specified are not registered for the class. This method can only be called by the owner of a class, usually as part of the de-installation of the component.
     * @param {Pointer<Guid>} rclsid The class identifier.
     * @param {Integer} cCategories The number of category CATIDs to be removed.
     * @param {Pointer<Guid>} rgcatid An array of CATIDs that are to be removed. Only the category IDs specified in this array are removed.
     * @returns {HRESULT} This method can return the following values.
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
     * One or more arguments are incorrect.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/comcat/nf-comcat-icatregister-unregisterclassimplcategories
     */
    UnRegisterClassImplCategories(rclsid, cCategories, rgcatid) {
        result := ComCall(6, this, Guid.Ptr, rclsid, "uint", cCategories, Guid.Ptr, rgcatid, "HRESULT")
        return result
    }

    /**
     * Registers the class as requiring one or more component categories.
     * @remarks
     * In case of an error, this method does not ensure that the registry is restored to the state prior to the call. This method can only be called by the owner of a class, usually as part of the installation of the component.
     * @param {Pointer<Guid>} rclsid The class identifier.
     * @param {Integer} cCategories The number of category CATIDs to be associated as category identifiers for the class.
     * @param {Pointer<Guid>} rgcatid An array of CATIDs to be associated as category identifiers for the class.
     * @returns {HRESULT} This method can return the following values.
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
     * One or more arguments are incorrect.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/comcat/nf-comcat-icatregister-registerclassreqcategories
     */
    RegisterClassReqCategories(rclsid, cCategories, rgcatid) {
        result := ComCall(7, this, Guid.Ptr, rclsid, "uint", cCategories, Guid.Ptr, rgcatid, "HRESULT")
        return result
    }

    /**
     * Removes one or more required category identifiers from a class.
     * @remarks
     * In case of an error, this method does not ensure that the registry is restored to the state prior to the call. This method will be successful even if one or more of the category IDs specified are not registered for the class.
     * @param {Pointer<Guid>} rclsid The class identifier.
     * @param {Integer} cCategories The number of category CATIDs to be removed.
     * @param {Pointer<Guid>} rgcatid An array of CATIDs that are to be removed. Only the category IDs specified in this array are removed.
     * @returns {HRESULT} This method can return the following values.
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
     * One or more arguments are incorrect.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/comcat/nf-comcat-icatregister-unregisterclassreqcategories
     */
    UnRegisterClassReqCategories(rclsid, cCategories, rgcatid) {
        result := ComCall(8, this, Guid.Ptr, rclsid, "uint", cCategories, Guid.Ptr, rgcatid, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICatRegister.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RegisterCategories := CallbackCreate(GetMethod(implObj, "RegisterCategories"), flags, 3)
        this.vtbl.UnRegisterCategories := CallbackCreate(GetMethod(implObj, "UnRegisterCategories"), flags, 3)
        this.vtbl.RegisterClassImplCategories := CallbackCreate(GetMethod(implObj, "RegisterClassImplCategories"), flags, 4)
        this.vtbl.UnRegisterClassImplCategories := CallbackCreate(GetMethod(implObj, "UnRegisterClassImplCategories"), flags, 4)
        this.vtbl.RegisterClassReqCategories := CallbackCreate(GetMethod(implObj, "RegisterClassReqCategories"), flags, 4)
        this.vtbl.UnRegisterClassReqCategories := CallbackCreate(GetMethod(implObj, "UnRegisterClassReqCategories"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RegisterCategories)
        CallbackFree(this.vtbl.UnRegisterCategories)
        CallbackFree(this.vtbl.RegisterClassImplCategories)
        CallbackFree(this.vtbl.UnRegisterClassImplCategories)
        CallbackFree(this.vtbl.RegisterClassReqCategories)
        CallbackFree(this.vtbl.UnRegisterClassReqCategories)
    }
}
