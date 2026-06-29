#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IWMColorLegalizerProps extends IUnknown {
    /**
     * The interface identifier for IWMColorLegalizerProps
     * @type {Guid}
     */
    static IID := Guid("{776c93b3-b72d-4508-b6d0-208785f553e7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMColorLegalizerProps interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetColorLegalizerQuality : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMColorLegalizerProps.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} lquality 
     * @returns {HRESULT} 
     */
    SetColorLegalizerQuality(lquality) {
        result := ComCall(3, this, "int", lquality, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMColorLegalizerProps.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetColorLegalizerQuality := CallbackCreate(GetMethod(implObj, "SetColorLegalizerQuality"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetColorLegalizerQuality)
    }
}
