#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\ISWbemNamedValue.ahk" { ISWbemNamedValue }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import "..\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.System.Wmi
 */
export default struct ISWbemNamedValueSet extends IDispatch {
    /**
     * The interface identifier for ISWbemNamedValueSet
     * @type {Guid}
     */
    static IID := Guid("{cf2376ea-ce8c-11d1-8b05-00600806d9b6}")

    /**
     * The class identifier for SWbemNamedValueSet
     * @type {Guid}
     */
    static CLSID := Guid("{9aed384e-ce8b-11d1-8b05-00600806d9b6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISWbemNamedValueSet interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get__NewEnum : IntPtr
        Item         : IntPtr
        get_Count    : IntPtr
        Add          : IntPtr
        Remove       : IntPtr
        Clone        : IntPtr
        DeleteAll    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISWbemNamedValueSet.Vtbl()
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
     * @param {BSTR} strName 
     * @param {Integer} iFlags 
     * @returns {ISWbemNamedValue} 
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-item
     */
    Item(strName, iFlags) {
        strName := strName is String ? BSTR.Alloc(strName).Value : strName

        result := ComCall(8, this, BSTR, strName, "int", iFlags, "ptr*", &objWbemNamedValue := 0, "HRESULT")
        return ISWbemNamedValue(objWbemNamedValue)
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
     * @param {BSTR} strName 
     * @param {Pointer<VARIANT>} varValue 
     * @param {Integer} iFlags 
     * @returns {ISWbemNamedValue} 
     */
    Add(strName, varValue, iFlags) {
        strName := strName is String ? BSTR.Alloc(strName).Value : strName

        result := ComCall(10, this, BSTR, strName, VARIANT.Ptr, varValue, "int", iFlags, "ptr*", &objWbemNamedValue := 0, "HRESULT")
        return ISWbemNamedValue(objWbemNamedValue)
    }

    /**
     * 
     * @param {BSTR} strName 
     * @param {Integer} iFlags 
     * @returns {HRESULT} 
     */
    Remove(strName, iFlags) {
        strName := strName is String ? BSTR.Alloc(strName).Value : strName

        result := ComCall(11, this, BSTR, strName, "int", iFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISWbemNamedValueSet} 
     */
    Clone() {
        result := ComCall(12, this, "ptr*", &objWbemNamedValueSet := 0, "HRESULT")
        return ISWbemNamedValueSet(objWbemNamedValueSet)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DeleteAll() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISWbemNamedValueSet.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get__NewEnum := CallbackCreate(GetMethod(implObj, "get__NewEnum"), flags, 2)
        this.vtbl.Item := CallbackCreate(GetMethod(implObj, "Item"), flags, 4)
        this.vtbl.get_Count := CallbackCreate(GetMethod(implObj, "get_Count"), flags, 2)
        this.vtbl.Add := CallbackCreate(GetMethod(implObj, "Add"), flags, 5)
        this.vtbl.Remove := CallbackCreate(GetMethod(implObj, "Remove"), flags, 3)
        this.vtbl.Clone := CallbackCreate(GetMethod(implObj, "Clone"), flags, 2)
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
        CallbackFree(this.vtbl.Remove)
        CallbackFree(this.vtbl.Clone)
        CallbackFree(this.vtbl.DeleteAll)
    }
}
