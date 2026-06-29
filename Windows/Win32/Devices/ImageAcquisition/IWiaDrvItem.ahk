#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Devices.ImageAcquisition
 */
export default struct IWiaDrvItem extends IUnknown {
    /**
     * The interface identifier for IWiaDrvItem
     * @type {Guid}
     */
    static IID := Guid("{1f02b5c5-b00c-11d2-a094-00c04f72dc3c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWiaDrvItem interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetItemFlags         : IntPtr
        GetDeviceSpecContext : IntPtr
        GetFullItemName      : IntPtr
        GetItemName          : IntPtr
        AddItemToFolder      : IntPtr
        UnlinkItemTree       : IntPtr
        RemoveItemFromFolder : IntPtr
        FindItemByName       : IntPtr
        FindChildItemByName  : IntPtr
        GetParentItem        : IntPtr
        GetFirstChildItem    : IntPtr
        GetNextSiblingItem   : IntPtr
        DumpItemData         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWiaDrvItem.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetItemFlags() {
        result := ComCall(3, this, "int*", &__MIDL__IWiaDrvItem0000 := 0, "HRESULT")
        return __MIDL__IWiaDrvItem0000
    }

    /**
     * 
     * @returns {Pointer<Integer>} 
     */
    GetDeviceSpecContext() {
        result := ComCall(4, this, "ptr*", &__MIDL__IWiaDrvItem0001 := 0, "HRESULT")
        return __MIDL__IWiaDrvItem0001
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetFullItemName() {
        __MIDL__IWiaDrvItem0002 := BSTR.Owned()
        result := ComCall(5, this, BSTR.Ptr, __MIDL__IWiaDrvItem0002, "HRESULT")
        return __MIDL__IWiaDrvItem0002
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetItemName() {
        __MIDL__IWiaDrvItem0003 := BSTR.Owned()
        result := ComCall(6, this, BSTR.Ptr, __MIDL__IWiaDrvItem0003, "HRESULT")
        return __MIDL__IWiaDrvItem0003
    }

    /**
     * 
     * @param {IWiaDrvItem} __MIDL__IWiaDrvItem0004 
     * @returns {HRESULT} 
     */
    AddItemToFolder(__MIDL__IWiaDrvItem0004) {
        result := ComCall(7, this, "ptr", __MIDL__IWiaDrvItem0004, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} __MIDL__IWiaDrvItem0005 
     * @returns {HRESULT} 
     */
    UnlinkItemTree(__MIDL__IWiaDrvItem0005) {
        result := ComCall(8, this, "int", __MIDL__IWiaDrvItem0005, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} __MIDL__IWiaDrvItem0006 
     * @returns {HRESULT} 
     */
    RemoveItemFromFolder(__MIDL__IWiaDrvItem0006) {
        result := ComCall(9, this, "int", __MIDL__IWiaDrvItem0006, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} __MIDL__IWiaDrvItem0007 
     * @param {BSTR} __MIDL__IWiaDrvItem0008 
     * @returns {IWiaDrvItem} 
     */
    FindItemByName(__MIDL__IWiaDrvItem0007, __MIDL__IWiaDrvItem0008) {
        __MIDL__IWiaDrvItem0008 := __MIDL__IWiaDrvItem0008 is String ? BSTR.Alloc(__MIDL__IWiaDrvItem0008).Value : __MIDL__IWiaDrvItem0008

        result := ComCall(10, this, "int", __MIDL__IWiaDrvItem0007, BSTR, __MIDL__IWiaDrvItem0008, "ptr*", &__MIDL__IWiaDrvItem0009 := 0, "HRESULT")
        return IWiaDrvItem(__MIDL__IWiaDrvItem0009)
    }

    /**
     * 
     * @param {BSTR} __MIDL__IWiaDrvItem0010 
     * @returns {IWiaDrvItem} 
     */
    FindChildItemByName(__MIDL__IWiaDrvItem0010) {
        __MIDL__IWiaDrvItem0010 := __MIDL__IWiaDrvItem0010 is String ? BSTR.Alloc(__MIDL__IWiaDrvItem0010).Value : __MIDL__IWiaDrvItem0010

        result := ComCall(11, this, BSTR, __MIDL__IWiaDrvItem0010, "ptr*", &__MIDL__IWiaDrvItem0011 := 0, "HRESULT")
        return IWiaDrvItem(__MIDL__IWiaDrvItem0011)
    }

    /**
     * 
     * @returns {IWiaDrvItem} 
     */
    GetParentItem() {
        result := ComCall(12, this, "ptr*", &__MIDL__IWiaDrvItem0012 := 0, "HRESULT")
        return IWiaDrvItem(__MIDL__IWiaDrvItem0012)
    }

    /**
     * 
     * @returns {IWiaDrvItem} 
     */
    GetFirstChildItem() {
        result := ComCall(13, this, "ptr*", &__MIDL__IWiaDrvItem0013 := 0, "HRESULT")
        return IWiaDrvItem(__MIDL__IWiaDrvItem0013)
    }

    /**
     * 
     * @returns {IWiaDrvItem} 
     */
    GetNextSiblingItem() {
        result := ComCall(14, this, "ptr*", &__MIDL__IWiaDrvItem0014 := 0, "HRESULT")
        return IWiaDrvItem(__MIDL__IWiaDrvItem0014)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    DumpItemData() {
        __MIDL__IWiaDrvItem0015 := BSTR.Owned()
        result := ComCall(15, this, BSTR.Ptr, __MIDL__IWiaDrvItem0015, "HRESULT")
        return __MIDL__IWiaDrvItem0015
    }

    Query(iid) {
        if (IWiaDrvItem.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetItemFlags := CallbackCreate(GetMethod(implObj, "GetItemFlags"), flags, 2)
        this.vtbl.GetDeviceSpecContext := CallbackCreate(GetMethod(implObj, "GetDeviceSpecContext"), flags, 2)
        this.vtbl.GetFullItemName := CallbackCreate(GetMethod(implObj, "GetFullItemName"), flags, 2)
        this.vtbl.GetItemName := CallbackCreate(GetMethod(implObj, "GetItemName"), flags, 2)
        this.vtbl.AddItemToFolder := CallbackCreate(GetMethod(implObj, "AddItemToFolder"), flags, 2)
        this.vtbl.UnlinkItemTree := CallbackCreate(GetMethod(implObj, "UnlinkItemTree"), flags, 2)
        this.vtbl.RemoveItemFromFolder := CallbackCreate(GetMethod(implObj, "RemoveItemFromFolder"), flags, 2)
        this.vtbl.FindItemByName := CallbackCreate(GetMethod(implObj, "FindItemByName"), flags, 4)
        this.vtbl.FindChildItemByName := CallbackCreate(GetMethod(implObj, "FindChildItemByName"), flags, 3)
        this.vtbl.GetParentItem := CallbackCreate(GetMethod(implObj, "GetParentItem"), flags, 2)
        this.vtbl.GetFirstChildItem := CallbackCreate(GetMethod(implObj, "GetFirstChildItem"), flags, 2)
        this.vtbl.GetNextSiblingItem := CallbackCreate(GetMethod(implObj, "GetNextSiblingItem"), flags, 2)
        this.vtbl.DumpItemData := CallbackCreate(GetMethod(implObj, "DumpItemData"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetItemFlags)
        CallbackFree(this.vtbl.GetDeviceSpecContext)
        CallbackFree(this.vtbl.GetFullItemName)
        CallbackFree(this.vtbl.GetItemName)
        CallbackFree(this.vtbl.AddItemToFolder)
        CallbackFree(this.vtbl.UnlinkItemTree)
        CallbackFree(this.vtbl.RemoveItemFromFolder)
        CallbackFree(this.vtbl.FindItemByName)
        CallbackFree(this.vtbl.FindChildItemByName)
        CallbackFree(this.vtbl.GetParentItem)
        CallbackFree(this.vtbl.GetFirstChildItem)
        CallbackFree(this.vtbl.GetNextSiblingItem)
        CallbackFree(this.vtbl.DumpItemData)
    }
}
