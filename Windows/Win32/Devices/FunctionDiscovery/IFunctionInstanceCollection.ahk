#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IFunctionInstance.ahk" { IFunctionInstance }

/**
 * Represents a group of IFunctionInstance objects returned as the result of a query or get instance request.
 * @remarks
 * The <b>IFunctionInstanceCollection</b> interface allows a client program to enumerate a collection of  <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nn-functiondiscoveryapi-ifunctioninstance">IFunctionInstance</a> objects.
 * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryapi/nn-functiondiscoveryapi-ifunctioninstancecollection
 * @namespace Windows.Win32.Devices.FunctionDiscovery
 */
export default struct IFunctionInstanceCollection extends IUnknown {
    /**
     * The interface identifier for IFunctionInstanceCollection
     * @type {Guid}
     */
    static IID := Guid("{f0a3d895-855c-42a2-948d-2f97d450ecb1}")

    /**
     * The class identifier for FunctionInstanceCollection
     * @type {Guid}
     */
    static CLSID := Guid("{ba818ce5-b55f-443f-ad39-2fe89be6191f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFunctionInstanceCollection interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetCount  : IntPtr
        Get       : IntPtr
        Item      : IntPtr
        Add       : IntPtr
        Remove    : IntPtr
        Delete    : IntPtr
        DeleteAll : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFunctionInstanceCollection.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the number of function instances in the collection.
     * @remarks
     * The <b>GetCount</b> and <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nf-functiondiscoveryapi-ifunctioninstancecollection-item">Item</a> methods enables you to enumerate all of the function instances contained in a collection using a simple <b>for</b> or <b>while</b> loop.
     * @returns {Integer} The number of function instances.
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryapi/nf-functiondiscoveryapi-ifunctioninstancecollection-getcount
     */
    GetCount() {
        result := ComCall(3, this, "uint*", &pdwCount := 0, "HRESULT")
        return pdwCount
    }

    /**
     * Gets the specified function instance and its index from the collection.
     * @param {PWSTR} pszInstanceIdentity The identifier of the function instance to be retrieved (see <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nf-functiondiscoveryapi-ifunctioninstance-getid">GetID</a>).
     * @param {Pointer<Integer>} pdwIndex The index number.
     * @returns {IFunctionInstance} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nn-functiondiscoveryapi-ifunctioninstance">IFunctionInstance</a> interface pointer that receives the function instance.
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryapi/nf-functiondiscoveryapi-ifunctioninstancecollection-get
     */
    Get(pszInstanceIdentity, pdwIndex) {
        pszInstanceIdentity := pszInstanceIdentity is String ? StrPtr(pszInstanceIdentity) : pszInstanceIdentity

        pdwIndexMarshal := pdwIndex is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr", pszInstanceIdentity, pdwIndexMarshal, pdwIndex, "ptr*", &ppIFunctionInstance := 0, "HRESULT")
        return IFunctionInstance(ppIFunctionInstance)
    }

    /**
     * Gets the specified function instance, by index.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nf-functiondiscoveryapi-ifunctioninstancecollection-getcount">GetCount</a> and <b>Item</b> methods enables you to enumerate all of the function instances contained in a collection using a simple <b>for</b> or <b>while</b> loop.
     * @param {Integer} dwIndex The zero-based index of the function instance to be retrieved.
     * @returns {IFunctionInstance} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nn-functiondiscoveryapi-ifunctioninstance">IFunctionInstance</a> interface pointer that receives the function instance.
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryapi/nf-functiondiscoveryapi-ifunctioninstancecollection-item
     */
    Item(dwIndex) {
        result := ComCall(5, this, "uint", dwIndex, "ptr*", &ppIFunctionInstance := 0, "HRESULT")
        return IFunctionInstance(ppIFunctionInstance)
    }

    /**
     * Adds a function instance to the collection.
     * @param {IFunctionInstance} pIFunctionInstance A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nn-functiondiscoveryapi-ifunctioninstance">IFunctionInstance</a> interface for the function instance to be added to the collection.
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
     * The value of <i>pIFunctionInstance</i> is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method is unable to allocate the memory required to perform this operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryapi/nf-functiondiscoveryapi-ifunctioninstancecollection-add
     */
    Add(pIFunctionInstance) {
        result := ComCall(6, this, "ptr", pIFunctionInstance, "HRESULT")
        return result
    }

    /**
     * Deletes the specified function instance and returns a pointer to the function instance being removed.
     * @param {Integer} dwIndex The index number within the collection.
     * @returns {IFunctionInstance} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nn-functiondiscoveryapi-ifunctioninstance">IFunctionInstance</a> interface pointer that receives the function instance.
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryapi/nf-functiondiscoveryapi-ifunctioninstancecollection-remove
     */
    Remove(dwIndex) {
        result := ComCall(7, this, "uint", dwIndex, "ptr*", &ppIFunctionInstance := 0, "HRESULT")
        return IFunctionInstance(ppIFunctionInstance)
    }

    /**
     * Removes the specified function instance from the collection.
     * @param {Integer} dwIndex The index number of the item to be removed from the collection.
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
     * The value of <i>dwIndex</i> is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method is unable to allocate the memory required to perform this operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryapi/nf-functiondiscoveryapi-ifunctioninstancecollection-delete
     */
    Delete(dwIndex) {
        result := ComCall(8, this, "uint", dwIndex, "HRESULT")
        return result
    }

    /**
     * Removes all function instances from the collection.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryapi/nf-functiondiscoveryapi-ifunctioninstancecollection-deleteall
     */
    DeleteAll() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFunctionInstanceCollection.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCount := CallbackCreate(GetMethod(implObj, "GetCount"), flags, 2)
        this.vtbl.Get := CallbackCreate(GetMethod(implObj, "Get"), flags, 4)
        this.vtbl.Item := CallbackCreate(GetMethod(implObj, "Item"), flags, 3)
        this.vtbl.Add := CallbackCreate(GetMethod(implObj, "Add"), flags, 2)
        this.vtbl.Remove := CallbackCreate(GetMethod(implObj, "Remove"), flags, 3)
        this.vtbl.Delete := CallbackCreate(GetMethod(implObj, "Delete"), flags, 2)
        this.vtbl.DeleteAll := CallbackCreate(GetMethod(implObj, "DeleteAll"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCount)
        CallbackFree(this.vtbl.Get)
        CallbackFree(this.vtbl.Item)
        CallbackFree(this.vtbl.Add)
        CallbackFree(this.vtbl.Remove)
        CallbackFree(this.vtbl.Delete)
        CallbackFree(this.vtbl.DeleteAll)
    }
}
