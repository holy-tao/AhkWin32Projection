#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\StructuredStorage\PROPVARIANT.ahk" { PROPVARIANT }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\PROPERTYKEY.ahk" { PROPERTYKEY }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * This interface is accessible to the provider through IFunctionDiscoveryProviderQuery::GetPropertyConstraints.
 * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryprovider/nn-functiondiscoveryprovider-iproviderpropertyconstraintcollection
 * @namespace Windows.Win32.Devices.FunctionDiscovery
 */
export default struct IProviderPropertyConstraintCollection extends IUnknown {
    /**
     * The interface identifier for IProviderPropertyConstraintCollection
     * @type {Guid}
     */
    static IID := Guid("{f4fae42f-5778-4a13-8540-b5fd8c1398dd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IProviderPropertyConstraintCollection interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetCount : IntPtr
        Get      : IntPtr
        Item     : IntPtr
        Next     : IntPtr
        Skip     : IntPtr
        Reset    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IProviderPropertyConstraintCollection.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the number of items in the collection. (IProviderPropertyConstraintCollection.GetCount)
     * @returns {Integer} The number of items.
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryprovider/nf-functiondiscoveryprovider-iproviderpropertyconstraintcollection-getcount
     */
    GetCount() {
        result := ComCall(3, this, "uint*", &pdwCount := 0, "HRESULT")
        return pdwCount
    }

    /**
     * Gets the name and value of the specified property constraint, by property key.
     * @param {Pointer<PROPERTYKEY>} Key The property key.
     * @param {Pointer<PROPVARIANT>} pPropVar A <b>VARIANT</b> used for the property key constraint value.
     * @param {Pointer<Integer>} pdwPropertyConstraint The type of constraint to apply.
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
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed successfully, but the property key was not found in the collection.
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
     * The <i>ppropVar</i> or <i>pdwPropertyConstraint</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryprovider/nf-functiondiscoveryprovider-iproviderpropertyconstraintcollection-get
     */
    Get(Key, pPropVar, pdwPropertyConstraint) {
        pdwPropertyConstraintMarshal := pdwPropertyConstraint is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, PROPERTYKEY.Ptr, Key, PROPVARIANT.Ptr, pPropVar, pdwPropertyConstraintMarshal, pdwPropertyConstraint, "HRESULT")
        return result
    }

    /**
     * Gets the name and value of the specified property constraint, by index.
     * @param {Integer} dwIndex The index of the item in the collection.
     * @param {Pointer<PROPERTYKEY>} pKey The property key.
     * @param {Pointer<PROPVARIANT>} pPropVar A <b>PROPVARIANT</b> used for the property constraint data.
     * @param {Pointer<Integer>} pdwPropertyConstraint The type of constraint to apply.
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
     * The <i>ppropVar</i> or <i>pdwPropertyConstraint</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryprovider/nf-functiondiscoveryprovider-iproviderpropertyconstraintcollection-item
     */
    Item(dwIndex, pKey, pPropVar, pdwPropertyConstraint) {
        pdwPropertyConstraintMarshal := pdwPropertyConstraint is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "uint", dwIndex, PROPERTYKEY.Ptr, pKey, PROPVARIANT.Ptr, pPropVar, pdwPropertyConstraintMarshal, pdwPropertyConstraint, "HRESULT")
        return result
    }

    /**
     * Gets the name and value of the next property constraint in the collection.
     * @param {Pointer<PROPERTYKEY>} pKey The property key.
     * @param {Pointer<PROPVARIANT>} pPropVar A <b>PROPVARIANT</b> used for the property constraint data.
     * @param {Pointer<Integer>} pdwPropertyConstraint The type of constraint to apply.
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
     * The <i>ppropVar</i> or <i>pdwPropertyConstraint</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryprovider/nf-functiondiscoveryprovider-iproviderpropertyconstraintcollection-next
     */
    Next(pKey, pPropVar, pdwPropertyConstraint) {
        pdwPropertyConstraintMarshal := pdwPropertyConstraint is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, PROPERTYKEY.Ptr, pKey, PROPVARIANT.Ptr, pPropVar, pdwPropertyConstraintMarshal, pdwPropertyConstraint, "HRESULT")
        return result
    }

    /**
     * Skips the next item in the collection. (IProviderPropertyConstraintCollection.Skip)
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryprovider/nf-functiondiscoveryprovider-iproviderpropertyconstraintcollection-skip
     */
    Skip() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * Resets the current index to the start of the collection. (IProviderPropertyConstraintCollection.Reset)
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryprovider/nf-functiondiscoveryprovider-iproviderpropertyconstraintcollection-reset
     */
    Reset() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IProviderPropertyConstraintCollection.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCount := CallbackCreate(GetMethod(implObj, "GetCount"), flags, 2)
        this.vtbl.Get := CallbackCreate(GetMethod(implObj, "Get"), flags, 4)
        this.vtbl.Item := CallbackCreate(GetMethod(implObj, "Item"), flags, 5)
        this.vtbl.Next := CallbackCreate(GetMethod(implObj, "Next"), flags, 4)
        this.vtbl.Skip := CallbackCreate(GetMethod(implObj, "Skip"), flags, 1)
        this.vtbl.Reset := CallbackCreate(GetMethod(implObj, "Reset"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCount)
        CallbackFree(this.vtbl.Get)
        CallbackFree(this.vtbl.Item)
        CallbackFree(this.vtbl.Next)
        CallbackFree(this.vtbl.Skip)
        CallbackFree(this.vtbl.Reset)
    }
}
