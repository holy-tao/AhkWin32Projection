#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Ole
 */
export default struct IZoomEvents extends IUnknown {
    /**
     * The interface identifier for IZoomEvents
     * @type {Guid}
     */
    static IID := Guid("{41b68150-904c-4e17-a0ba-a438182e359d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IZoomEvents interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnZoomPercentChanged : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IZoomEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} ulZoomPercent 
     * @returns {HRESULT} 
     */
    OnZoomPercentChanged(ulZoomPercent) {
        result := ComCall(3, this, "uint", ulZoomPercent, "HRESULT")
        return result
    }

    Query(iid) {
        if (IZoomEvents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnZoomPercentChanged := CallbackCreate(GetMethod(implObj, "OnZoomPercentChanged"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnZoomPercentChanged)
    }
}
