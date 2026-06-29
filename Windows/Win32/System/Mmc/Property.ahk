#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Variant\VARIANT.ahk" { VARIANT }

/**
 * Windows Portable Devices supports the following property attributes.
 * @see https://learn.microsoft.com/windows/win32/wpd_sdk/attributes
 * @namespace Windows.Win32.System.Mmc
 */
export default struct Property extends IDispatch {
    /**
     * The interface identifier for Property
     * @type {Guid}
     */
    static IID := Guid("{4600c3a5-e301-41d8-b6d0-ef2e4212e0ca}")

    /**
     * The class identifier for Property
     * @type {Guid}
     */
    static CLSID := Guid("{4600c3a5-e301-41d8-b6d0-ef2e4212e0ca}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for Property interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Value : IntPtr
        put_Value : IntPtr
        get_Name  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := Property.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT} 
     */
    Value {
        get => this.get_Value()
        set => this.put_Value(value)
    }

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_Value() {
        Value := VARIANT()
        result := ComCall(7, this, VARIANT.Ptr, Value, "HRESULT")
        return Value
    }

    /**
     * 
     * @param {VARIANT} Value 
     * @returns {HRESULT} 
     */
    put_Value(Value) {
        result := ComCall(8, this, VARIANT, Value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Name() {
        Name := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, Name, "HRESULT")
        return Name
    }

    Query(iid) {
        if (Property.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Value := CallbackCreate(GetMethod(implObj, "get_Value"), flags, 2)
        this.vtbl.put_Value := CallbackCreate(GetMethod(implObj, "put_Value"), flags, 2)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Value)
        CallbackFree(this.vtbl.put_Value)
        CallbackFree(this.vtbl.get_Name)
    }
}
