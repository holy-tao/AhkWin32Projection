#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\IDispatch.ahk" { IDispatch }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\IUnknown.ahk" { IUnknown }
#Import "..\..\Variant\VARIANT.ahk" { VARIANT }
#Import ".\IEnumEventObject.ahk" { IEnumEventObject }

/**
 * Manages objects in an event objects collection.
 * @see https://learn.microsoft.com/windows/win32/api/eventsys/nn-eventsys-ieventobjectcollection
 * @namespace Windows.Win32.System.Com.Events
 */
export default struct IEventObjectCollection extends IDispatch {
    /**
     * The interface identifier for IEventObjectCollection
     * @type {Guid}
     */
    static IID := Guid("{f89ac270-d4eb-11d1-b682-00805fc79216}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEventObjectCollection interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get__NewEnum : IntPtr
        get_Item     : IntPtr
        get_NewEnum  : IntPtr
        get_Count    : IntPtr
        Add          : IntPtr
        Remove       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEventObjectCollection.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * @type {IEnumEventObject} 
     */
    NewEnum {
        get => this.get_NewEnum()
    }

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * An enumerator for the objects in the collection.
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventobjectcollection-get__newenum
     */
    get__NewEnum() {
        result := ComCall(7, this, "ptr*", &ppUnkEnum := 0, "HRESULT")
        return IUnknown(ppUnkEnum)
    }

    /**
     * An item in the collection.
     * @param {BSTR} _objectID 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventobjectcollection-get_item
     */
    get_Item(_objectID) {
        _objectID := _objectID is String ? BSTR.Alloc(_objectID).Value : _objectID

        pItem := VARIANT()
        result := ComCall(8, this, BSTR, _objectID, VARIANT.Ptr, pItem, "HRESULT")
        return pItem
    }

    /**
     * An enumeration object that implements IEnumEventObject.
     * @returns {IEnumEventObject} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventobjectcollection-get_newenum
     */
    get_NewEnum() {
        result := ComCall(9, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumEventObject(ppEnum)
    }

    /**
     * The number of objects in the collection.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventobjectcollection-get_count
     */
    get_Count() {
        result := ComCall(10, this, "int*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * Adds an event object to the collection.
     * @param {Pointer<VARIANT>} item A pointer to the event object to be added to the collection. This parameter cannot be <b>NULL</b>.
     * @param {BSTR} _objectID The ID property of the event object to be added. For example, if the collection consists of subscription objects, this parameter would contain the SubscriptionID property of the event subscription object to be added to the collection.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventobjectcollection-add
     */
    Add(item, _objectID) {
        _objectID := _objectID is String ? BSTR.Alloc(_objectID).Value : _objectID

        result := ComCall(11, this, VARIANT.Ptr, item, BSTR, _objectID, "HRESULT")
        return result
    }

    /**
     * Removes an event object from the collection.
     * @param {BSTR} _objectID The ID property of the event object to be removed. For example, if the collection consists of subscription objects, this parameter would contain the SubscriptionID property of the event subscription object to be removed from the collection.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventobjectcollection-remove
     */
    Remove(_objectID) {
        _objectID := _objectID is String ? BSTR.Alloc(_objectID).Value : _objectID

        result := ComCall(12, this, BSTR, _objectID, "HRESULT")
        return result
    }

    Query(iid) {
        if (IEventObjectCollection.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get__NewEnum := CallbackCreate(GetMethod(implObj, "get__NewEnum"), flags, 2)
        this.vtbl.get_Item := CallbackCreate(GetMethod(implObj, "get_Item"), flags, 3)
        this.vtbl.get_NewEnum := CallbackCreate(GetMethod(implObj, "get_NewEnum"), flags, 2)
        this.vtbl.get_Count := CallbackCreate(GetMethod(implObj, "get_Count"), flags, 2)
        this.vtbl.Add := CallbackCreate(GetMethod(implObj, "Add"), flags, 3)
        this.vtbl.Remove := CallbackCreate(GetMethod(implObj, "Remove"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get__NewEnum)
        CallbackFree(this.vtbl.get_Item)
        CallbackFree(this.vtbl.get_NewEnum)
        CallbackFree(this.vtbl.get_Count)
        CallbackFree(this.vtbl.Add)
        CallbackFree(this.vtbl.Remove)
    }
}
