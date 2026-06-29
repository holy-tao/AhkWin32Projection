#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\Location.ahk" { Location }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDebugHostSymbol.ahk" { IDebugHostSymbol }
#Import ".\LocationKind.ahk" { LocationKind }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDebugHostPublic extends IDebugHostSymbol {
    /**
     * The interface identifier for IDebugHostPublic
     * @type {Guid}
     */
    static IID := Guid("{6c597ac9-fb4d-4f6d-9f39-22488539f8f4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugHostPublic interfaces
    */
    struct Vtbl extends IDebugHostSymbol.Vtbl {
        GetLocationKind : IntPtr
        GetLocation     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugHostPublic.Vtbl()
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

    Query(iid) {
        if (IDebugHostPublic.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetLocationKind := CallbackCreate(GetMethod(implObj, "GetLocationKind"), flags, 2)
        this.vtbl.GetLocation := CallbackCreate(GetMethod(implObj, "GetLocation"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetLocationKind)
        CallbackFree(this.vtbl.GetLocation)
    }
}
