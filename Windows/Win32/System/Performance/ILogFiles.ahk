#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import ".\DILogFileItem.ahk" { DILogFileItem }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import "..\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.System.Performance
 */
export default struct ILogFiles extends IDispatch {
    /**
     * The interface identifier for ILogFiles
     * @type {Guid}
     */
    static IID := Guid("{6a2a97e6-6851-41ea-87ad-2a8225335865}")

    /**
     * The class identifier for LogFiles
     * @type {Guid}
     */
    static CLSID := Guid("{2735d9fd-f6b9-4f19-a5d9-e2d068584bc5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ILogFiles interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Count    : IntPtr
        get__NewEnum : IntPtr
        get_Item     : IntPtr
        Add          : IntPtr
        Remove       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ILogFiles.Vtbl()
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
     * 
     * @returns {Integer} 
     */
    get_Count() {
        result := ComCall(7, this, "int*", &pLong := 0, "HRESULT")
        return pLong
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get__NewEnum() {
        result := ComCall(8, this, "ptr*", &ppIunk := 0, "HRESULT")
        return IUnknown(ppIunk)
    }

    /**
     * 
     * @param {VARIANT} index 
     * @returns {DILogFileItem} 
     */
    get_Item(index) {
        result := ComCall(9, this, VARIANT, index, "ptr*", &ppI := 0, "HRESULT")
        return DILogFileItem(ppI)
    }

    /**
     * 
     * @param {BSTR} _pathname 
     * @returns {DILogFileItem} 
     */
    Add(_pathname) {
        _pathname := _pathname is String ? BSTR.Alloc(_pathname).Value : _pathname

        result := ComCall(10, this, BSTR, _pathname, "ptr*", &ppI := 0, "HRESULT")
        return DILogFileItem(ppI)
    }

    /**
     * 
     * @param {VARIANT} index 
     * @returns {HRESULT} 
     */
    Remove(index) {
        result := ComCall(11, this, VARIANT, index, "HRESULT")
        return result
    }

    Query(iid) {
        if (ILogFiles.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Count := CallbackCreate(GetMethod(implObj, "get_Count"), flags, 2)
        this.vtbl.get__NewEnum := CallbackCreate(GetMethod(implObj, "get__NewEnum"), flags, 2)
        this.vtbl.get_Item := CallbackCreate(GetMethod(implObj, "get_Item"), flags, 3)
        this.vtbl.Add := CallbackCreate(GetMethod(implObj, "Add"), flags, 3)
        this.vtbl.Remove := CallbackCreate(GetMethod(implObj, "Remove"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Count)
        CallbackFree(this.vtbl.get__NewEnum)
        CallbackFree(this.vtbl.get_Item)
        CallbackFree(this.vtbl.Add)
        CallbackFree(this.vtbl.Remove)
    }
}
