#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\SysmonDataType.ahk" { SysmonDataType }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\ICounterItem.ahk" { ICounterItem }
#Import "..\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.System.Performance
 */
export default struct ICounterItem2 extends ICounterItem {
    /**
     * The interface identifier for ICounterItem2
     * @type {Guid}
     */
    static IID := Guid("{eefcd4e1-ea1c-4435-b7f4-e341ba03b4f9}")

    /**
     * The class identifier for CounterItem2
     * @type {Guid}
     */
    static CLSID := Guid("{43196c62-c31f-4ce3-a02e-79efe0f6a525}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICounterItem2 interfaces
    */
    struct Vtbl extends ICounterItem.Vtbl {
        put_Selected : IntPtr
        get_Selected : IntPtr
        put_Visible  : IntPtr
        get_Visible  : IntPtr
        GetDataAt    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICounterItem2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Selected {
        get => this.get_Selected()
        set => this.put_Selected(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Visible {
        get => this.get_Visible()
        set => this.put_Visible(value)
    }

    /**
     * 
     * @param {VARIANT_BOOL} bState 
     * @returns {HRESULT} 
     */
    put_Selected(bState) {
        result := ComCall(15, this, VARIANT_BOOL, bState, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_Selected() {
        result := ComCall(16, this, VARIANT_BOOL.Ptr, &pbState := 0, "HRESULT")
        return pbState
    }

    /**
     * 
     * @param {VARIANT_BOOL} bState 
     * @returns {HRESULT} 
     */
    put_Visible(bState) {
        result := ComCall(17, this, VARIANT_BOOL, bState, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_Visible() {
        result := ComCall(18, this, VARIANT_BOOL.Ptr, &pbState := 0, "HRESULT")
        return pbState
    }

    /**
     * 
     * @param {Integer} iIndex 
     * @param {SysmonDataType} iWhich 
     * @returns {VARIANT} 
     */
    GetDataAt(iIndex, iWhich) {
        pVariant := VARIANT()
        result := ComCall(19, this, "int", iIndex, SysmonDataType, iWhich, VARIANT.Ptr, pVariant, "HRESULT")
        return pVariant
    }

    Query(iid) {
        if (ICounterItem2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_Selected := CallbackCreate(GetMethod(implObj, "put_Selected"), flags, 2)
        this.vtbl.get_Selected := CallbackCreate(GetMethod(implObj, "get_Selected"), flags, 2)
        this.vtbl.put_Visible := CallbackCreate(GetMethod(implObj, "put_Visible"), flags, 2)
        this.vtbl.get_Visible := CallbackCreate(GetMethod(implObj, "get_Visible"), flags, 2)
        this.vtbl.GetDataAt := CallbackCreate(GetMethod(implObj, "GetDataAt"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_Selected)
        CallbackFree(this.vtbl.get_Selected)
        CallbackFree(this.vtbl.put_Visible)
        CallbackFree(this.vtbl.get_Visible)
        CallbackFree(this.vtbl.GetDataAt)
    }
}
