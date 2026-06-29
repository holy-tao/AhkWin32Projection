#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * The IADsMembers interface is a dual interface.
 * @see https://learn.microsoft.com/windows/win32/api/iads/nn-iads-iadsmembers
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct IADsMembers extends IDispatch {
    /**
     * The interface identifier for IADsMembers
     * @type {Guid}
     */
    static IID := Guid("{451a0030-72ec-11cf-b03b-00aa006e0975}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IADsMembers interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Count    : IntPtr
        get__NewEnum : IntPtr
        get_Filter   : IntPtr
        put_Filter   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IADsMembers.Vtbl()
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
     * @type {VARIANT} 
     */
    Filter {
        get => this.get_Filter()
        set => this.put_Filter(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Count() {
        result := ComCall(7, this, "int*", &plCount := 0, "HRESULT")
        return plCount
    }

    /**
     * The IADsMembers::get__NewEnum method gets a dependent enumerator object that implements IEnumVARIANT for this ADSI collection object. Be aware that there are two underscore characters in the function name (get__NewEnum).
     * @returns {IUnknown} Pointer to a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface on the enumerator object for this collection.
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadsmembers-get__newenum
     */
    get__NewEnum() {
        result := ComCall(8, this, "ptr*", &ppEnumerator := 0, "HRESULT")
        return IUnknown(ppEnumerator)
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_Filter() {
        pvFilter := VARIANT()
        result := ComCall(9, this, VARIANT.Ptr, pvFilter, "HRESULT")
        return pvFilter
    }

    /**
     * 
     * @param {VARIANT} pvFilter 
     * @returns {HRESULT} 
     */
    put_Filter(pvFilter) {
        result := ComCall(10, this, VARIANT, pvFilter, "HRESULT")
        return result
    }

    Query(iid) {
        if (IADsMembers.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Count := CallbackCreate(GetMethod(implObj, "get_Count"), flags, 2)
        this.vtbl.get__NewEnum := CallbackCreate(GetMethod(implObj, "get__NewEnum"), flags, 2)
        this.vtbl.get_Filter := CallbackCreate(GetMethod(implObj, "get_Filter"), flags, 2)
        this.vtbl.put_Filter := CallbackCreate(GetMethod(implObj, "put_Filter"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Count)
        CallbackFree(this.vtbl.get__NewEnum)
        CallbackFree(this.vtbl.get_Filter)
        CallbackFree(this.vtbl.put_Filter)
    }
}
