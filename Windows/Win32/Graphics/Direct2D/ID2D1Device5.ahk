#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID2D1DeviceContext5.ahk" { ID2D1DeviceContext5 }
#Import ".\ID2D1Device4.ahk" { ID2D1Device4 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\D2D1_DEVICE_CONTEXT_OPTIONS.ahk" { D2D1_DEVICE_CONTEXT_OPTIONS }

/**
 * Represents a resource domain whose objects and device contexts can be used together. This interface performs all the same functions as the ID2D1Device4 interface. It also enables the creation of ID2D1DeviceContext5 objects.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nn-d2d1_3-id2d1device5
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1Device5 extends ID2D1Device4 {
    /**
     * The interface identifier for ID2D1Device5
     * @type {Guid}
     */
    static IID := Guid("{d55ba0a4-6405-4694-aef5-08ee1a4358b4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1Device5 interfaces
    */
    struct Vtbl extends ID2D1Device4.Vtbl {
        CreateDeviceContext : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1Device5.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates a new device context with no initially assigned target. (ID2D1Device5.CreateDeviceContext)
     * @param {D2D1_DEVICE_CONTEXT_OPTIONS} options Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_device_context_options">D2D1_DEVICE_CONTEXT_OPTIONS</a></b>
     * 
     * Options for creating the device context.
     * @returns {ID2D1DeviceContext5} Type: <b>ID2D1DeviceContext5**</b>
     * 
     * The created device context.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1device5-createdevicecontext
     */
    CreateDeviceContext(options) {
        result := ComCall(19, this, D2D1_DEVICE_CONTEXT_OPTIONS, options, "ptr*", &deviceContext5 := 0, "HRESULT")
        return ID2D1DeviceContext5(deviceContext5)
    }

    Query(iid) {
        if (ID2D1Device5.IID.Equals(iid)) {
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
