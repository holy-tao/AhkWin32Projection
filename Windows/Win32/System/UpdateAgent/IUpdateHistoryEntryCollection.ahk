#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IUpdateHistoryEntry.ahk" { IUpdateHistoryEntry }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents an ordered read-only list of IUpdateHistoryEntry interfaces.
 * @see https://learn.microsoft.com/windows/win32/api/wuapi/nn-wuapi-iupdatehistoryentrycollection
 * @namespace Windows.Win32.System.UpdateAgent
 */
export default struct IUpdateHistoryEntryCollection extends IDispatch {
    /**
     * The interface identifier for IUpdateHistoryEntryCollection
     * @type {Guid}
     */
    static IID := Guid("{a7f04f3c-a290-435b-aadf-a116c3357a5c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUpdateHistoryEntryCollection interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Item     : IntPtr
        get__NewEnum : IntPtr
        get_Count    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUpdateHistoryEntryCollection.Vtbl()
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
     * Gets an IUpdateHistoryEntry interface in the collection.
     * @param {Integer} index 
     * @returns {IUpdateHistoryEntry} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatehistoryentrycollection-get_item
     */
    get_Item(index) {
        result := ComCall(7, this, "int", index, "ptr*", &retval := 0, "HRESULT")
        return IUpdateHistoryEntry(retval)
    }

    /**
     * Gets an IEnumVARIANT interface that can be used to enumerate the collection. (IUpdateHistoryEntryCollection.get__NewEnum)
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatehistoryentrycollection-get__newenum
     */
    get__NewEnum() {
        result := ComCall(8, this, "ptr*", &retval := 0, "HRESULT")
        return IUnknown(retval)
    }

    /**
     * Gets the number of elements in the collection. (IUpdateHistoryEntryCollection.get_Count)
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatehistoryentrycollection-get_count
     */
    get_Count() {
        result := ComCall(9, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    Query(iid) {
        if (IUpdateHistoryEntryCollection.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Item := CallbackCreate(GetMethod(implObj, "get_Item"), flags, 3)
        this.vtbl.get__NewEnum := CallbackCreate(GetMethod(implObj, "get__NewEnum"), flags, 2)
        this.vtbl.get_Count := CallbackCreate(GetMethod(implObj, "get_Count"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Item)
        CallbackFree(this.vtbl.get__NewEnum)
        CallbackFree(this.vtbl.get_Count)
    }
}
