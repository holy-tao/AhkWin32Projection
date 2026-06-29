#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\Location.ahk" { Location }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDebugHostSymbol.ahk" { IDebugHostSymbol }
#Import "..\..\..\Variant\VARIANT.ahk" { VARIANT }
#Import ".\LocationKind.ahk" { LocationKind }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDebugHostData extends IDebugHostSymbol {
    /**
     * The interface identifier for IDebugHostData
     * @type {Guid}
     */
    static IID := Guid("{a3d64993-826c-44fa-897d-926f2fe7ad0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugHostData interfaces
    */
    struct Vtbl extends IDebugHostSymbol.Vtbl {
        GetLocationKind : IntPtr
        GetLocation     : IntPtr
        GetValue        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugHostData.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {LocationKind} 
     */
    GetLocationKind() {
        result := ComCall(10, this, "int*", &_locationKind := 0, "HRESULT")
        return _locationKind
    }

    /**
     * 
     * @returns {Location} 
     */
    GetLocation() {
        _location := Location()
        result := ComCall(11, this, Location.Ptr, _location, "HRESULT")
        return _location
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    GetValue() {
        value := VARIANT()
        result := ComCall(12, this, VARIANT.Ptr, value, "HRESULT")
        return value
    }

    Query(iid) {
        if (IDebugHostData.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetLocationKind := CallbackCreate(GetMethod(implObj, "GetLocationKind"), flags, 2)
        this.vtbl.GetLocation := CallbackCreate(GetMethod(implObj, "GetLocation"), flags, 2)
        this.vtbl.GetValue := CallbackCreate(GetMethod(implObj, "GetValue"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetLocationKind)
        CallbackFree(this.vtbl.GetLocation)
        CallbackFree(this.vtbl.GetValue)
    }
}
