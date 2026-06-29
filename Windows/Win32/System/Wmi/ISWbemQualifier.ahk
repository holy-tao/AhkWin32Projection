#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.System.Wmi
 */
export default struct ISWbemQualifier extends IDispatch {
    /**
     * The interface identifier for ISWbemQualifier
     * @type {Guid}
     */
    static IID := Guid("{79b05932-d3b7-11d1-8b06-00600806d9b6}")

    /**
     * The class identifier for SWbemQualifier
     * @type {Guid}
     */
    static CLSID := Guid("{04b83d5f-21ae-11d2-8b33-00600806d9b6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISWbemQualifier interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Value                : IntPtr
        put_Value                : IntPtr
        get_Name                 : IntPtr
        get_IsLocal              : IntPtr
        get_PropagatesToSubclass : IntPtr
        put_PropagatesToSubclass : IntPtr
        get_PropagatesToInstance : IntPtr
        put_PropagatesToInstance : IntPtr
        get_IsOverridable        : IntPtr
        put_IsOverridable        : IntPtr
        get_IsAmended            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISWbemQualifier.Vtbl()
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
     * @type {VARIANT_BOOL} 
     */
    IsLocal {
        get => this.get_IsLocal()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    PropagatesToSubclass {
        get => this.get_PropagatesToSubclass()
        set => this.put_PropagatesToSubclass(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    PropagatesToInstance {
        get => this.get_PropagatesToInstance()
        set => this.put_PropagatesToInstance(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IsOverridable {
        get => this.get_IsOverridable()
        set => this.put_IsOverridable(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IsAmended {
        get => this.get_IsAmended()
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_Value() {
        varValue := VARIANT()
        result := ComCall(7, this, VARIANT.Ptr, varValue, "HRESULT")
        return varValue
    }

    /**
     * 
     * @param {Pointer<VARIANT>} varValue 
     * @returns {HRESULT} 
     */
    put_Value(varValue) {
        result := ComCall(8, this, VARIANT.Ptr, varValue, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Name() {
        strName := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, strName, "HRESULT")
        return strName
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_IsLocal() {
        result := ComCall(10, this, VARIANT_BOOL.Ptr, &bIsLocal := 0, "HRESULT")
        return bIsLocal
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_PropagatesToSubclass() {
        result := ComCall(11, this, VARIANT_BOOL.Ptr, &bPropagatesToSubclass := 0, "HRESULT")
        return bPropagatesToSubclass
    }

    /**
     * 
     * @param {VARIANT_BOOL} bPropagatesToSubclass 
     * @returns {HRESULT} 
     */
    put_PropagatesToSubclass(bPropagatesToSubclass) {
        result := ComCall(12, this, VARIANT_BOOL, bPropagatesToSubclass, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_PropagatesToInstance() {
        result := ComCall(13, this, VARIANT_BOOL.Ptr, &bPropagatesToInstance := 0, "HRESULT")
        return bPropagatesToInstance
    }

    /**
     * 
     * @param {VARIANT_BOOL} bPropagatesToInstance 
     * @returns {HRESULT} 
     */
    put_PropagatesToInstance(bPropagatesToInstance) {
        result := ComCall(14, this, VARIANT_BOOL, bPropagatesToInstance, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_IsOverridable() {
        result := ComCall(15, this, VARIANT_BOOL.Ptr, &bIsOverridable := 0, "HRESULT")
        return bIsOverridable
    }

    /**
     * 
     * @param {VARIANT_BOOL} bIsOverridable 
     * @returns {HRESULT} 
     */
    put_IsOverridable(bIsOverridable) {
        result := ComCall(16, this, VARIANT_BOOL, bIsOverridable, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_IsAmended() {
        result := ComCall(17, this, VARIANT_BOOL.Ptr, &bIsAmended := 0, "HRESULT")
        return bIsAmended
    }

    Query(iid) {
        if (ISWbemQualifier.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Value := CallbackCreate(GetMethod(implObj, "get_Value"), flags, 2)
        this.vtbl.put_Value := CallbackCreate(GetMethod(implObj, "put_Value"), flags, 2)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.get_IsLocal := CallbackCreate(GetMethod(implObj, "get_IsLocal"), flags, 2)
        this.vtbl.get_PropagatesToSubclass := CallbackCreate(GetMethod(implObj, "get_PropagatesToSubclass"), flags, 2)
        this.vtbl.put_PropagatesToSubclass := CallbackCreate(GetMethod(implObj, "put_PropagatesToSubclass"), flags, 2)
        this.vtbl.get_PropagatesToInstance := CallbackCreate(GetMethod(implObj, "get_PropagatesToInstance"), flags, 2)
        this.vtbl.put_PropagatesToInstance := CallbackCreate(GetMethod(implObj, "put_PropagatesToInstance"), flags, 2)
        this.vtbl.get_IsOverridable := CallbackCreate(GetMethod(implObj, "get_IsOverridable"), flags, 2)
        this.vtbl.put_IsOverridable := CallbackCreate(GetMethod(implObj, "put_IsOverridable"), flags, 2)
        this.vtbl.get_IsAmended := CallbackCreate(GetMethod(implObj, "get_IsAmended"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Value)
        CallbackFree(this.vtbl.put_Value)
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.get_IsLocal)
        CallbackFree(this.vtbl.get_PropagatesToSubclass)
        CallbackFree(this.vtbl.put_PropagatesToSubclass)
        CallbackFree(this.vtbl.get_PropagatesToInstance)
        CallbackFree(this.vtbl.put_PropagatesToInstance)
        CallbackFree(this.vtbl.get_IsOverridable)
        CallbackFree(this.vtbl.put_IsOverridable)
        CallbackFree(this.vtbl.get_IsAmended)
    }
}
