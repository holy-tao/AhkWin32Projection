#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\ISWbemObject.ahk" { ISWbemObject }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\ISWbemSecurity.ahk" { ISWbemSecurity }

/**
 * @namespace Windows.Win32.System.Wmi
 */
export default struct ISWbemObjectSet extends IDispatch {
    /**
     * The interface identifier for ISWbemObjectSet
     * @type {Guid}
     */
    static IID := Guid("{76a6415f-cb41-11d1-8b02-00600806d9b6}")

    /**
     * The class identifier for SWbemObjectSet
     * @type {Guid}
     */
    static CLSID := Guid("{04b83d61-21ae-11d2-8b33-00600806d9b6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISWbemObjectSet interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get__NewEnum  : IntPtr
        Item          : IntPtr
        get_Count     : IntPtr
        get_Security_ : IntPtr
        ItemIndex     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISWbemObjectSet.Vtbl()
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
     * @type {ISWbemSecurity} 
     */
    Security_ {
        get => this.get_Security_()
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
     * @param {BSTR} strObjectPath 
     * @param {Integer} iFlags 
     * @returns {ISWbemObject} 
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-item
     */
    Item(strObjectPath, iFlags) {
        strObjectPath := strObjectPath is String ? BSTR.Alloc(strObjectPath).Value : strObjectPath

        result := ComCall(8, this, BSTR, strObjectPath, "int", iFlags, "ptr*", &objWbemObject := 0, "HRESULT")
        return ISWbemObject(objWbemObject)
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
     * @returns {ISWbemSecurity} 
     */
    get_Security_() {
        result := ComCall(10, this, "ptr*", &objWbemSecurity := 0, "HRESULT")
        return ISWbemSecurity(objWbemSecurity)
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @returns {ISWbemObject} 
     */
    ItemIndex(lIndex) {
        result := ComCall(11, this, "int", lIndex, "ptr*", &objWbemObject := 0, "HRESULT")
        return ISWbemObject(objWbemObject)
    }

    Query(iid) {
        if (ISWbemObjectSet.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get__NewEnum := CallbackCreate(GetMethod(implObj, "get__NewEnum"), flags, 2)
        this.vtbl.Item := CallbackCreate(GetMethod(implObj, "Item"), flags, 4)
        this.vtbl.get_Count := CallbackCreate(GetMethod(implObj, "get_Count"), flags, 2)
        this.vtbl.get_Security_ := CallbackCreate(GetMethod(implObj, "get_Security_"), flags, 2)
        this.vtbl.ItemIndex := CallbackCreate(GetMethod(implObj, "ItemIndex"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get__NewEnum)
        CallbackFree(this.vtbl.Item)
        CallbackFree(this.vtbl.get_Count)
        CallbackFree(this.vtbl.get_Security_)
        CallbackFree(this.vtbl.ItemIndex)
    }
}
