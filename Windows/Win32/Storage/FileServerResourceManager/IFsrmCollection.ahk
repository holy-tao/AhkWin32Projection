#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\FsrmCollectionState.ahk" { FsrmCollectionState }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * Defines a collection of FSRM objects.
 * @see https://learn.microsoft.com/windows/win32/api/fsrm/nn-fsrm-ifsrmcollection
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
export default struct IFsrmCollection extends IDispatch {
    /**
     * The interface identifier for IFsrmCollection
     * @type {Guid}
     */
    static IID := Guid("{f76fbf3b-8ddd-4b42-b05a-cb1c3ff1fee8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFsrmCollection interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get__NewEnum      : IntPtr
        get_Item          : IntPtr
        get_Count         : IntPtr
        get_State         : IntPtr
        Cancel            : IntPtr
        WaitForCompletion : IntPtr
        GetById           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFsrmCollection.Vtbl()
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
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * @type {FsrmCollectionState} 
     */
    State {
        get => this.get_State()
    }

    /**
     * Retrieves the IUnknown pointer of a new IEnumVARIANT enumeration for the items in the collection.
     * @remarks
     * C/C++ users use this method to enumerate items in the collection. Call the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> of the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface to get the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-ienumvariant">IEnumVARIANT</a> interface. Use the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nf-oaidl-ienumvariant-next">IEnumVARIANT::Next</a> method to enumerate 
     *     the items of the collection. The items are returned as <b>VARIANT</b> values.
     * 
     * If the collection contains interfaces, the  variant type is <b>VT_DISPATCH</b>. Call the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> method on the 
     *     <b>pdispVal</b> member of the variant to get an interface to the specific object. For example, 
     *     if the collection contains report objects, you would query the <b>pdispVal</b> member for the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nn-fsrmreports-ifsrmreport">IFsrmReport</a> interface.
     * 
     * If the item is an <b>HRESULT</b> value, the variant type is 
     *     <b>VT_I4</b>. Use the <b>lVal</b> member of the variant to get the 
     *     <b>HRESULT</b> value.
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmcollection-get__newenum
     */
    get__NewEnum() {
        result := ComCall(7, this, "ptr*", &unknown := 0, "HRESULT")
        return IUnknown(unknown)
    }

    /**
     * Retrieves the requested item from the collection. (IFsrmCollection.get_Item)
     * @remarks
     * If the item is an interface, the variant type is <b>VT_DISPATCH</b>. Call the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> method on the 
     *     <b>pdispVal</b> member of the variant to get an interface to the specific object.
     * 
     * If the item is an <b>HRESULT</b> value, the variant type is 
     *     <b>VT_I4</b>. Use the <b>lVal</b> member of the variant to get the 
     *     <b>HRESULT</b> value.
     * @param {Integer} index 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmcollection-get_item
     */
    get_Item(index) {
        item := VARIANT()
        result := ComCall(8, this, "int", index, VARIANT.Ptr, item, "HRESULT")
        return item
    }

    /**
     * Retrieves the number of items in the collection. (IFsrmCollection.get_Count)
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmcollection-get_count
     */
    get_Count() {
        result := ComCall(9, this, "int*", &count := 0, "HRESULT")
        return count
    }

    /**
     * Retrieves the state of the collection.
     * @returns {FsrmCollectionState} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmcollection-get_state
     */
    get_State() {
        result := ComCall(10, this, "int*", &state := 0, "HRESULT")
        return state
    }

    /**
     * Cancels the collection of objects when the objects are collected asynchronously.
     * @returns {HRESULT} The method returns the following return values.
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmcollection-cancel
     */
    Cancel() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * Limits the time that an asynchronous collection can take to collect the objects.
     * @param {Integer} waitSeconds The number of seconds to wait for the collection to finish collecting objects. To wait indefinitely, set this parameter to –1.
     * @returns {VARIANT_BOOL} Is <b>VARIANT_TRUE</b> if the collection finished collecting objects in the time specified; otherwise, <b>VARIANT_FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmcollection-waitforcompletion
     */
    WaitForCompletion(waitSeconds) {
        result := ComCall(12, this, "int", waitSeconds, VARIANT_BOOL.Ptr, &completed := 0, "HRESULT")
        return completed
    }

    /**
     * Retrieves the specified object from the collection.
     * @param {Guid} id Identifies the object to retrieve from the collection.
     * @returns {VARIANT} A <b>VARIANT</b> that contains the retrieved object. The variant type is <b>VT_DISPATCH</b>. Use the <b>pdispVal</b> member to access the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a> interface of the object.
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmcollection-getbyid
     */
    GetById(id) {
        entry := VARIANT()
        result := ComCall(13, this, Guid, id, VARIANT.Ptr, entry, "HRESULT")
        return entry
    }

    Query(iid) {
        if (IFsrmCollection.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get__NewEnum := CallbackCreate(GetMethod(implObj, "get__NewEnum"), flags, 2)
        this.vtbl.get_Item := CallbackCreate(GetMethod(implObj, "get_Item"), flags, 3)
        this.vtbl.get_Count := CallbackCreate(GetMethod(implObj, "get_Count"), flags, 2)
        this.vtbl.get_State := CallbackCreate(GetMethod(implObj, "get_State"), flags, 2)
        this.vtbl.Cancel := CallbackCreate(GetMethod(implObj, "Cancel"), flags, 1)
        this.vtbl.WaitForCompletion := CallbackCreate(GetMethod(implObj, "WaitForCompletion"), flags, 3)
        this.vtbl.GetById := CallbackCreate(GetMethod(implObj, "GetById"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get__NewEnum)
        CallbackFree(this.vtbl.get_Item)
        CallbackFree(this.vtbl.get_Count)
        CallbackFree(this.vtbl.get_State)
        CallbackFree(this.vtbl.Cancel)
        CallbackFree(this.vtbl.WaitForCompletion)
        CallbackFree(this.vtbl.GetById)
    }
}
