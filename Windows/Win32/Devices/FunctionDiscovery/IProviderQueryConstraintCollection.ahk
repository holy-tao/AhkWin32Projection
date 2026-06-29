#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * This interface is accessible to the provider through the IFunctionDiscoveryProviderQuery::GetQueryConstraints method.
 * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryprovider/nn-functiondiscoveryprovider-iproviderqueryconstraintcollection
 * @namespace Windows.Win32.Devices.FunctionDiscovery
 */
export default struct IProviderQueryConstraintCollection extends IUnknown {
    /**
     * The interface identifier for IProviderQueryConstraintCollection
     * @type {Guid}
     */
    static IID := Guid("{9c243e11-3261-4bcd-b922-84a873d460ae}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IProviderQueryConstraintCollection interfaces
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
            this.vtbl := IProviderQueryConstraintCollection.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the number of items in the collection. (IProviderQueryConstraintCollection.GetCount)
     * @returns {Integer} The number of items.
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryprovider/nf-functiondiscoveryprovider-iproviderqueryconstraintcollection-getcount
     */
    GetCount() {
        result := ComCall(3, this, "uint*", &pdwCount := 0, "HRESULT")
        return pdwCount
    }

    /**
     * Gets the value of the specified query constraint, by name.
     * @param {PWSTR} pszConstraintName The constraint name.
     * @returns {Pointer<Integer>} The constraint value.
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryprovider/nf-functiondiscoveryprovider-iproviderqueryconstraintcollection-get
     */
    Get(pszConstraintName) {
        pszConstraintName := pszConstraintName is String ? StrPtr(pszConstraintName) : pszConstraintName

        result := ComCall(4, this, "ptr", pszConstraintName, "ptr*", &ppszConstraintValue := 0, "HRESULT")
        return ppszConstraintValue
    }

    /**
     * Gets the name and value of the specified query constraint, by index.
     * @param {Integer} dwIndex The index of the item in the collection.
     * @param {Pointer<Pointer<Integer>>} ppszConstraintName The constraint name.
     * @param {Pointer<Pointer<Integer>>} ppszConstraintValue The constraint value.
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
     * The <i>pszConstraintName</i> or <i>ppszConstraintValue</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryprovider/nf-functiondiscoveryprovider-iproviderqueryconstraintcollection-item
     */
    Item(dwIndex, ppszConstraintName, ppszConstraintValue) {
        ppszConstraintNameMarshal := ppszConstraintName is VarRef ? "ptr*" : "ptr"
        ppszConstraintValueMarshal := ppszConstraintValue is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, "uint", dwIndex, ppszConstraintNameMarshal, ppszConstraintName, ppszConstraintValueMarshal, ppszConstraintValue, "HRESULT")
        return result
    }

    /**
     * Gets the name and value of the next query constraint in the collection.
     * @param {Pointer<Pointer<Integer>>} ppszConstraintName The constraint name.
     * @param {Pointer<Pointer<Integer>>} ppszConstraintValue The constraint value.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryprovider/nf-functiondiscoveryprovider-iproviderqueryconstraintcollection-next
     */
    Next(ppszConstraintName, ppszConstraintValue) {
        ppszConstraintNameMarshal := ppszConstraintName is VarRef ? "ptr*" : "ptr"
        ppszConstraintValueMarshal := ppszConstraintValue is VarRef ? "ptr*" : "ptr"

        result := ComCall(6, this, ppszConstraintNameMarshal, ppszConstraintName, ppszConstraintValueMarshal, ppszConstraintValue, "HRESULT")
        return result
    }

    /**
     * Skips the next item in the collection. (IProviderQueryConstraintCollection.Skip)
     * @remarks
     * This method works from the beginning of the collection regardless of any get item calls.
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryprovider/nf-functiondiscoveryprovider-iproviderqueryconstraintcollection-skip
     */
    Skip() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * Resets the current index to the start of the collection. (IProviderQueryConstraintCollection.Reset)
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryprovider/nf-functiondiscoveryprovider-iproviderqueryconstraintcollection-reset
     */
    Reset() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IProviderQueryConstraintCollection.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCount := CallbackCreate(GetMethod(implObj, "GetCount"), flags, 2)
        this.vtbl.Get := CallbackCreate(GetMethod(implObj, "Get"), flags, 3)
        this.vtbl.Item := CallbackCreate(GetMethod(implObj, "Item"), flags, 4)
        this.vtbl.Next := CallbackCreate(GetMethod(implObj, "Next"), flags, 3)
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
