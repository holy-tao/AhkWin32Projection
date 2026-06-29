#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISWbemRefreshableItem.ahk" { ISWbemRefreshableItem }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISWbemServicesEx.ahk" { ISWbemServicesEx }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Wmi
 */
export default struct ISWbemRefresher extends IDispatch {
    /**
     * The interface identifier for ISWbemRefresher
     * @type {Guid}
     */
    static IID := Guid("{14d8250e-d9c2-11d3-b38f-00105a1f473a}")

    /**
     * The class identifier for SWbemRefresher
     * @type {Guid}
     */
    static CLSID := Guid("{d269bf5c-d9c1-11d3-b38f-00105a1f473a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISWbemRefresher interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get__NewEnum      : IntPtr
        Item              : IntPtr
        get_Count         : IntPtr
        Add               : IntPtr
        AddEnum           : IntPtr
        Remove            : IntPtr
        Refresh           : IntPtr
        get_AutoReconnect : IntPtr
        put_AutoReconnect : IntPtr
        DeleteAll         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISWbemRefresher.Vtbl()
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
     * @type {VARIANT_BOOL} 
     */
    AutoReconnect {
        get => this.get_AutoReconnect()
        set => this.put_AutoReconnect(value)
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get__NewEnum() {
        result := ComCall(7, this, "ptr*", &pUnk := 0, "HRESULT")
        return IUnknown(pUnk)
    }

    /**
     * Windows Image Acquisition (WIA) hardware devices are represented as hierarchical trees of Item objects. The root item in this tree represents the device itself, while child items represent images, folders, or scanning beds.
     * @remarks
     * The **Item** object has these types of members:
     * 
     * -   [Methods](#methods)
     * -   [Properties](#properties)
     * @param {Integer} iIndex 
     * @returns {ISWbemRefreshableItem} 
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-item
     */
    Item(iIndex) {
        result := ComCall(8, this, "int", iIndex, "ptr*", &objWbemRefreshableItem := 0, "HRESULT")
        return ISWbemRefreshableItem(objWbemRefreshableItem)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Count() {
        result := ComCall(9, this, "int*", &iCount := 0, "HRESULT")
        return iCount
    }

    /**
     * 
     * @param {ISWbemServicesEx} objWbemServices 
     * @param {BSTR} bsInstancePath 
     * @param {Integer} iFlags 
     * @param {IDispatch} objWbemNamedValueSet 
     * @returns {ISWbemRefreshableItem} 
     */
    Add(objWbemServices, bsInstancePath, iFlags, objWbemNamedValueSet) {
        bsInstancePath := bsInstancePath is String ? BSTR.Alloc(bsInstancePath).Value : bsInstancePath

        result := ComCall(10, this, "ptr", objWbemServices, BSTR, bsInstancePath, "int", iFlags, "ptr", objWbemNamedValueSet, "ptr*", &objWbemRefreshableItem := 0, "HRESULT")
        return ISWbemRefreshableItem(objWbemRefreshableItem)
    }

    /**
     * 
     * @param {ISWbemServicesEx} objWbemServices 
     * @param {BSTR} bsClassName 
     * @param {Integer} iFlags 
     * @param {IDispatch} objWbemNamedValueSet 
     * @returns {ISWbemRefreshableItem} 
     */
    AddEnum(objWbemServices, bsClassName, iFlags, objWbemNamedValueSet) {
        bsClassName := bsClassName is String ? BSTR.Alloc(bsClassName).Value : bsClassName

        result := ComCall(11, this, "ptr", objWbemServices, BSTR, bsClassName, "int", iFlags, "ptr", objWbemNamedValueSet, "ptr*", &objWbemRefreshableItem := 0, "HRESULT")
        return ISWbemRefreshableItem(objWbemRefreshableItem)
    }

    /**
     * 
     * @param {Integer} iIndex 
     * @param {Integer} iFlags 
     * @returns {HRESULT} 
     */
    Remove(iIndex, iFlags) {
        result := ComCall(12, this, "int", iIndex, "int", iFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iFlags 
     * @returns {HRESULT} 
     */
    Refresh(iFlags) {
        result := ComCall(13, this, "int", iFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_AutoReconnect() {
        result := ComCall(14, this, VARIANT_BOOL.Ptr, &bCount := 0, "HRESULT")
        return bCount
    }

    /**
     * 
     * @param {VARIANT_BOOL} bCount 
     * @returns {HRESULT} 
     */
    put_AutoReconnect(bCount) {
        result := ComCall(15, this, VARIANT_BOOL, bCount, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DeleteAll() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISWbemRefresher.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get__NewEnum := CallbackCreate(GetMethod(implObj, "get__NewEnum"), flags, 2)
        this.vtbl.Item := CallbackCreate(GetMethod(implObj, "Item"), flags, 3)
        this.vtbl.get_Count := CallbackCreate(GetMethod(implObj, "get_Count"), flags, 2)
        this.vtbl.Add := CallbackCreate(GetMethod(implObj, "Add"), flags, 6)
        this.vtbl.AddEnum := CallbackCreate(GetMethod(implObj, "AddEnum"), flags, 6)
        this.vtbl.Remove := CallbackCreate(GetMethod(implObj, "Remove"), flags, 3)
        this.vtbl.Refresh := CallbackCreate(GetMethod(implObj, "Refresh"), flags, 2)
        this.vtbl.get_AutoReconnect := CallbackCreate(GetMethod(implObj, "get_AutoReconnect"), flags, 2)
        this.vtbl.put_AutoReconnect := CallbackCreate(GetMethod(implObj, "put_AutoReconnect"), flags, 2)
        this.vtbl.DeleteAll := CallbackCreate(GetMethod(implObj, "DeleteAll"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get__NewEnum)
        CallbackFree(this.vtbl.Item)
        CallbackFree(this.vtbl.get_Count)
        CallbackFree(this.vtbl.Add)
        CallbackFree(this.vtbl.AddEnum)
        CallbackFree(this.vtbl.Remove)
        CallbackFree(this.vtbl.Refresh)
        CallbackFree(this.vtbl.get_AutoReconnect)
        CallbackFree(this.vtbl.put_AutoReconnect)
        CallbackFree(this.vtbl.DeleteAll)
    }
}
