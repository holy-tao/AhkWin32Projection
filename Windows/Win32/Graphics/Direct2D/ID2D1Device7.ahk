#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID2D1DeviceContext7.ahk" { ID2D1DeviceContext7 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ID2D1Device6.ahk" { ID2D1Device6 }
#Import ".\D2D1_DEVICE_CONTEXT_OPTIONS.ahk" { D2D1_DEVICE_CONTEXT_OPTIONS }

/**
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1Device7 extends ID2D1Device6 {
    /**
     * The interface identifier for ID2D1Device7
     * @type {Guid}
     */
    static IID := Guid("{f07c8968-dd4e-4ba6-9cbd-eb6d3752dcbb}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1Device7 interfaces
    */
    struct Vtbl extends ID2D1Device6.Vtbl {
        CreateDeviceContext : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1Device7.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {D2D1_DEVICE_CONTEXT_OPTIONS} options 
     * @returns {ID2D1DeviceContext7} 
     */
    CreateDeviceContext(options) {
        result := ComCall(21, this, D2D1_DEVICE_CONTEXT_OPTIONS, options, "ptr*", &deviceContext := 0, "HRESULT")
        return ID2D1DeviceContext7(deviceContext)
    }

    Query(iid) {
        if (ID2D1Device7.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateDeviceContext := CallbackCreate(GetMethod(implObj, "CreateDeviceContext"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateDeviceContext)
    }
}
