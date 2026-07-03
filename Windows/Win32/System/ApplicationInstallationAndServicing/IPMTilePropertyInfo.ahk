#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct IPMTilePropertyInfo extends IUnknown {
    /**
     * The interface identifier for IPMTilePropertyInfo
     * @type {Guid}
     */
    static IID := Guid("{6c2b8017-1efa-42a7-86c0-6d4b640bf528}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPMTilePropertyInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_PropertyID    : IntPtr
        get_PropertyValue : IntPtr
        set_Property      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPMTilePropertyInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    PropertyID {
        get => this.get_PropertyID()
    }

    /**
     */
    PropertyValue {
        get => this.get_PropertyValue()
    }

    /**
     */
    Property {
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PropertyID() {
        result := ComCall(3, this, "uint*", &pPropID := 0, "HRESULT")
        return pPropID
    }

    /**
     * 
     * @param {Pointer<BSTR>} pPropValue 
     * @returns {HRESULT} 
     */
    get_PropertyValue(pPropValue) {
        result := ComCall(4, this, BSTR.Ptr, pPropValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} PropValue 
     * @returns {HRESULT} 
     */
    set_Property(PropValue) {
        PropValue := PropValue is String ? BSTR.Alloc(PropValue).Value : PropValue

        result := ComCall(5, this, BSTR, PropValue, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPMTilePropertyInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_PropertyID := CallbackCreate(GetMethod(implObj, "get_PropertyID"), flags, 2)
        this.vtbl.get_PropertyValue := CallbackCreate(GetMethod(implObj, "get_PropertyValue"), flags, 2)
        this.vtbl.set_Property := CallbackCreate(GetMethod(implObj, "set_Property"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_PropertyID)
        CallbackFree(this.vtbl.get_PropertyValue)
        CallbackFree(this.vtbl.set_Property)
    }
}
