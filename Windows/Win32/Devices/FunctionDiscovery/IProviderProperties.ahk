#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\StructuredStorage\PROPVARIANT.ahk" { PROPVARIANT }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\PROPERTYKEY.ahk" { PROPERTYKEY }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IFunctionInstance.ahk" { IFunctionInstance }

/**
 * Is optionally implemented by discovery providers to directly create and manage their own property store.
 * @remarks
 * Implementing this interface enables a provider to provide access to the most current property values. Otherwise, the client uses the values in the cache created by Function Discovery when the function instance is created or the property store is opened.
 * 
 * If a provider does not implement this interface, then the provider must provide a property store
 * at the time the instance is created or when the client calls <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryprovider/nf-functiondiscoveryprovider-ifunctiondiscoveryprovider-instancepropertystoreopen">InstancePropertyStoreOpen</a>.
 * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryprovider/nn-functiondiscoveryprovider-iproviderproperties
 * @namespace Windows.Win32.Devices.FunctionDiscovery
 */
export default struct IProviderProperties extends IUnknown {
    /**
     * The interface identifier for IProviderProperties
     * @type {Guid}
     */
    static IID := Guid("{cf986ea6-3b5f-4c5f-b88a-2f8b20ceef17}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IProviderProperties interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetCount : IntPtr
        GetAt    : IntPtr
        GetValue : IntPtr
        SetValue : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IProviderProperties.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the number of properties in the property store.
     * @param {IFunctionInstance} pIFunctionInstance An <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nn-functiondiscoveryapi-ifunctioninstance">IFunctionInstance</a> interface pointer.
     * @param {Pointer} iProviderInstanceContext The context associated with the specific function instance.
     * @returns {Integer} The number of properties in the property store.
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryprovider/nf-functiondiscoveryprovider-iproviderproperties-getcount
     */
    GetCount(pIFunctionInstance, iProviderInstanceContext) {
        result := ComCall(3, this, "ptr", pIFunctionInstance, "ptr", iProviderInstanceContext, "uint*", &pdwCount := 0, "HRESULT")
        return pdwCount
    }

    /**
     * Gets the property key at the specified index.
     * @param {IFunctionInstance} pIFunctionInstance A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nn-functiondiscoveryapi-ifunctioninstance">IFunctionInstance</a> interface.
     * @param {Pointer} iProviderInstanceContext The context associated with the specific function instance.
     * @param {Integer} dwIndex The index of the property key.
     * @returns {PROPERTYKEY} The property key.
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryprovider/nf-functiondiscoveryprovider-iproviderproperties-getat
     */
    GetAt(pIFunctionInstance, iProviderInstanceContext, dwIndex) {
        pKey := PROPERTYKEY()
        result := ComCall(4, this, "ptr", pIFunctionInstance, "ptr", iProviderInstanceContext, "uint", dwIndex, PROPERTYKEY.Ptr, pKey, "HRESULT")
        return pKey
    }

    /**
     * Gets the value of the specified property key.
     * @remarks
     * To change the value of a property key, use the <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryprovider/nf-functiondiscoveryprovider-iproviderproperties-setvalue">SetValue</a> method.
     * 
     * If a value for <i>Key</i> could not be found, the return value will be <b>S_OK</b> and <i>ppropVar</i> will be set to <b>VT_NULL</b>.
     * @param {IFunctionInstance} pIFunctionInstance An <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nn-functiondiscoveryapi-ifunctioninstance">IFunctionInstance</a> interface pointer.
     * @param {Pointer} iProviderInstanceContext The context associated with the specific function instance.
     * @param {Pointer<PROPERTYKEY>} Key The property key reference.
     * @returns {PROPVARIANT} The value of the property key specified by <i>Key</i>. The <b>PROPVARIANT</b> type is VT_EMPTY if the key is not found in the property store.
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryprovider/nf-functiondiscoveryprovider-iproviderproperties-getvalue
     */
    GetValue(pIFunctionInstance, iProviderInstanceContext, Key) {
        ppropVar := PROPVARIANT()
        result := ComCall(5, this, "ptr", pIFunctionInstance, "ptr", iProviderInstanceContext, PROPERTYKEY.Ptr, Key, PROPVARIANT.Ptr, ppropVar, "HRESULT")
        return ppropVar
    }

    /**
     * Sets the value of the specified property key.
     * @param {IFunctionInstance} pIFunctionInstance An <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nn-functiondiscoveryapi-ifunctioninstance">IFunctionInstance</a> interface.
     * @param {Pointer} iProviderInstanceContext The context associated with the specific function instance.
     * @param {Pointer<PROPERTYKEY>} Key The property key for the property to be set.
     * @param {Pointer<PROPVARIANT>} ppropVar The property data. To remove the property from the store, specify a <b>PROPVARIANT</b> with the type VT_EMPTY.
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
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pIFunctionInstance</i>, <i>pvProviderInstanceContext</i>, or <i>ppropVar</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryprovider/nf-functiondiscoveryprovider-iproviderproperties-setvalue
     */
    SetValue(pIFunctionInstance, iProviderInstanceContext, Key, ppropVar) {
        result := ComCall(6, this, "ptr", pIFunctionInstance, "ptr", iProviderInstanceContext, PROPERTYKEY.Ptr, Key, PROPVARIANT.Ptr, ppropVar, "HRESULT")
        return result
    }

    Query(iid) {
        if (IProviderProperties.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCount := CallbackCreate(GetMethod(implObj, "GetCount"), flags, 4)
        this.vtbl.GetAt := CallbackCreate(GetMethod(implObj, "GetAt"), flags, 5)
        this.vtbl.GetValue := CallbackCreate(GetMethod(implObj, "GetValue"), flags, 5)
        this.vtbl.SetValue := CallbackCreate(GetMethod(implObj, "SetValue"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCount)
        CallbackFree(this.vtbl.GetAt)
        CallbackFree(this.vtbl.GetValue)
        CallbackFree(this.vtbl.SetValue)
    }
}
