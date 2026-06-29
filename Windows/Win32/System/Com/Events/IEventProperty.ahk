#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\IDispatch.ahk" { IDispatch }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Variant\VARIANT.ahk" { VARIANT }

/**
 * Associates a named event property with its value.
 * @see https://learn.microsoft.com/windows/win32/api/eventsys/nn-eventsys-ieventproperty
 * @namespace Windows.Win32.System.Com.Events
 */
export default struct IEventProperty extends IDispatch {
    /**
     * The interface identifier for IEventProperty
     * @type {Guid}
     */
    static IID := Guid("{da538ee2-f4de-11d1-b6bb-00805fc79216}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEventProperty interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Name  : IntPtr
        put_Name  : IntPtr
        get_Value : IntPtr
        put_Value : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEventProperty.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
        set => this.put_Name(value)
    }

    /**
     * @type {VARIANT} 
     */
    Value {
        get => this.get_Value()
        set => this.put_Value(value)
    }

    /**
     * The name of the event property. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventproperty-get_name
     */
    get_Name() {
        propertyName := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, propertyName, "HRESULT")
        return propertyName
    }

    /**
     * The name of the event property. (Put)
     * @param {BSTR} propertyName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventproperty-put_name
     */
    put_Name(propertyName) {
        propertyName := propertyName is String ? BSTR.Alloc(propertyName).Value : propertyName

        result := ComCall(8, this, BSTR, propertyName, "HRESULT")
        return result
    }

    /**
     * The value of the event property. (Get)
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventproperty-get_value
     */
    get_Value() {
        _propertyValue := VARIANT()
        result := ComCall(9, this, VARIANT.Ptr, _propertyValue, "HRESULT")
        return _propertyValue
    }

    /**
     * The value of the event property. (Put)
     * @param {Pointer<VARIANT>} _propertyValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventproperty-put_value
     */
    put_Value(_propertyValue) {
        result := ComCall(10, this, VARIANT.Ptr, _propertyValue, "HRESULT")
        return result
    }

    Query(iid) {
        if (IEventProperty.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.put_Name := CallbackCreate(GetMethod(implObj, "put_Name"), flags, 2)
        this.vtbl.get_Value := CallbackCreate(GetMethod(implObj, "get_Value"), flags, 2)
        this.vtbl.put_Value := CallbackCreate(GetMethod(implObj, "put_Value"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.put_Name)
        CallbackFree(this.vtbl.get_Value)
        CallbackFree(this.vtbl.put_Value)
    }
}
