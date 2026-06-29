#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * Use the ISdoCollection interface to manipulate a collection of SDO objects.
 * @remarks
 * To obtain a collection, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sdoias/nf-sdoias-isdo-getproperty">ISdo::GetProperty</a>, specifying a collection's property. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/Nps/sdo-retrieving-a-collection">Retrieving a Collection</a>.
 * @see https://learn.microsoft.com/windows/win32/api/sdoias/nn-sdoias-isdocollection
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 */
export default struct ISdoCollection extends IDispatch {
    /**
     * The interface identifier for ISdoCollection
     * @type {Guid}
     */
    static IID := Guid("{56bc53e2-96db-11d1-bf3f-000000000000}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISdoCollection interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Count    : IntPtr
        Add          : IntPtr
        Remove       : IntPtr
        RemoveAll    : IntPtr
        Reload       : IntPtr
        IsNameUnique : IntPtr
        Item         : IntPtr
        get__NewEnum : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISdoCollection.Vtbl()
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
     * The get_Count method returns the number of items in the collection.
     * @returns {Integer} Pointer to a <b>LONG</b> that contains the number of items in the collection.
     * @see https://learn.microsoft.com/windows/win32/api/sdoias/nf-sdoias-isdocollection-get_count
     */
    get_Count() {
        result := ComCall(7, this, "int*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * The Add method adds an item to the Server Data Objects (SDO) collection.
     * @remarks
     * If you specify the name of the object to add, ensure that the name is unique by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sdoias/nf-sdoias-isdocollection-isnameunique">ISdoCollection::IsNameUnique</a>.
     * 
     * If the <i>bstrName</i> parameter is not specified, <b>ISdoCollection::Add</b> obtains it from the object specified by the <i>ppItem</i> parameter.
     * @param {BSTR} bstrName Specifies the name of the SDO Object. This parameter may be <b>NULL</b>.
     * @param {Pointer<IDispatch>} ppItem Pointer to an <b>IDispatch</b> interface pointer for the Item to add. This parameter must not be <b>NULL</b>.
     * @returns {HRESULT} If the method succeeds the return value is <b>S_OK</b>.
     * 
     * If the method fails, the return value is one of the following error codes.
     * @see https://learn.microsoft.com/windows/win32/api/sdoias/nf-sdoias-isdocollection-add
     */
    Add(bstrName, ppItem) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(8, this, BSTR, bstrName, IDispatch.Ptr, ppItem, "HRESULT")
        return result
    }

    /**
     * The Remove method removes the specified item from the collection.
     * @param {IDispatch} pItem Pointer to an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a> interface that specifies the item to remove.
     * 
     * This parameter must not be <b>NULL</b>.
     * @returns {HRESULT} If the method succeeds the return value is <b>S_OK</b>.
     * 
     * If the method fails, the return value is one of the following error codes.
     * @see https://learn.microsoft.com/windows/win32/api/sdoias/nf-sdoias-isdocollection-remove
     */
    Remove(pItem) {
        result := ComCall(9, this, "ptr", pItem, "HRESULT")
        return result
    }

    /**
     * The RemoveAll method removes all the items from the collection.
     * @returns {HRESULT} If the method succeeds the return value is <b>S_OK</b>.
     * 
     * If the method fails, the return value is one of the following error codes.
     * @see https://learn.microsoft.com/windows/win32/api/sdoias/nf-sdoias-isdocollection-removeall
     */
    RemoveAll() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * The Reload method reloads all the objects in the collection from the underlying datastore.
     * @returns {HRESULT} If the method succeeds the return value is <b>S_OK</b>.
     * 
     * If the method fails, the return value is one of the following error codes.
     * @see https://learn.microsoft.com/windows/win32/api/sdoias/nf-sdoias-isdocollection-reload
     */
    Reload() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * The IsNameUnique method tests whether the specified name is unique in the collection.
     * @remarks
     * Neither of the parameters may be <b>NULL</b>.
     * @param {BSTR} bstrName Specifies the name to test.
     * @returns {VARIANT_BOOL} Pointer to a <b>VARIANT</b> that specifies whether the name is unique. The returned value is <b>VARIANT_TRUE</b> if the name is unique, <b>VARIANT_FALSE</b> otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/sdoias/nf-sdoias-isdocollection-isnameunique
     */
    IsNameUnique(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(12, this, BSTR, bstrName, VARIANT_BOOL.Ptr, &pBool := 0, "HRESULT")
        return pBool
    }

    /**
     * The Item method retrieves the specified item from the collection.
     * @remarks
     * Neither of the parameters can be <b>NULL</b>.
     * @param {Pointer<VARIANT>} Name Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a>. Store the name of the object in a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/automat/bstr">BSTR</a> in this <b>VARIANT</b>.
     * @returns {IDispatch} Pointer to an interface pointer that receives the address of an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a> interface for the object.
     * @see https://learn.microsoft.com/windows/win32/api/sdoias/nf-sdoias-isdocollection-item
     */
    Item(Name) {
        result := ComCall(13, this, VARIANT.Ptr, Name, "ptr*", &pItem := 0, "HRESULT")
        return IDispatch(pItem)
    }

    /**
     * The get__NewEnum method retrieves an IEnumVARIANT interface for a Server Data Objects (SDO) collection.
     * @remarks
     * Initialize the SDO before calling this method.
     * 
     * <div class="alert"><b>Note</b>  Two underscores are used between "get" and "NewEnum" in the name of this method.</div>
     * <div> </div>
     * @returns {IUnknown} Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface pointer. On successful return the <b>IUnknown</b> interface pointer, points to an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-ienumvariant">IEnumVARIANT</a> interface.
     * 
     * This parameter must not be <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/sdoias/nf-sdoias-isdocollection-get__newenum
     */
    get__NewEnum() {
        result := ComCall(14, this, "ptr*", &ppEnumVARIANT := 0, "HRESULT")
        return IUnknown(ppEnumVARIANT)
    }

    Query(iid) {
        if (ISdoCollection.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Count := CallbackCreate(GetMethod(implObj, "get_Count"), flags, 2)
        this.vtbl.Add := CallbackCreate(GetMethod(implObj, "Add"), flags, 3)
        this.vtbl.Remove := CallbackCreate(GetMethod(implObj, "Remove"), flags, 2)
        this.vtbl.RemoveAll := CallbackCreate(GetMethod(implObj, "RemoveAll"), flags, 1)
        this.vtbl.Reload := CallbackCreate(GetMethod(implObj, "Reload"), flags, 1)
        this.vtbl.IsNameUnique := CallbackCreate(GetMethod(implObj, "IsNameUnique"), flags, 3)
        this.vtbl.Item := CallbackCreate(GetMethod(implObj, "Item"), flags, 3)
        this.vtbl.get__NewEnum := CallbackCreate(GetMethod(implObj, "get__NewEnum"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Count)
        CallbackFree(this.vtbl.Add)
        CallbackFree(this.vtbl.Remove)
        CallbackFree(this.vtbl.RemoveAll)
        CallbackFree(this.vtbl.Reload)
        CallbackFree(this.vtbl.IsNameUnique)
        CallbackFree(this.vtbl.Item)
        CallbackFree(this.vtbl.get__NewEnum)
    }
}
