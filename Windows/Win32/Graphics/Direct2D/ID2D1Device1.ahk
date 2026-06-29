#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D2D1_RENDERING_PRIORITY.ahk" { D2D1_RENDERING_PRIORITY }
#Import ".\ID2D1Device.ahk" { ID2D1Device }
#Import ".\ID2D1DeviceContext1.ahk" { ID2D1DeviceContext1 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\D2D1_DEVICE_CONTEXT_OPTIONS.ahk" { D2D1_DEVICE_CONTEXT_OPTIONS }

/**
 * Represents a resource domain whose objects and device contexts can be used together. (ID2D1Device1)
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_2/nn-d2d1_2-id2d1device1
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1Device1 extends ID2D1Device {
    /**
     * The interface identifier for ID2D1Device1
     * @type {Guid}
     */
    static IID := Guid("{d21768e1-23a4-4823-a14b-7c3eba85d658}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1Device1 interfaces
    */
    struct Vtbl extends ID2D1Device.Vtbl {
        GetRenderingPriority : IntPtr
        SetRenderingPriority : IntPtr
        CreateDeviceContext  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1Device1.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the current rendering priority of the device.
     * @returns {D2D1_RENDERING_PRIORITY} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_2/ne-d2d1_2-d2d1_rendering_priority">D2D1_RENDERING_PRIORITY</a></b>
     * 
     * The current rendering priority of the device.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_2/nf-d2d1_2-id2d1device1-getrenderingpriority
     */
    GetRenderingPriority() {
        result := ComCall(9, this, D2D1_RENDERING_PRIORITY)
        return result
    }

    /**
     * Sets the priority of Direct2D rendering operations performed on any device context associated with the device.
     * @remarks
     * Calling this method affects the rendering priority of all device contexts associated with the device. This method can be called at any time, but is not guaranteed to take effect until the beginning of the next frame. The recommended usage is to call this method outside of <a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nf-d2d1-id2d1rendertarget-begindraw">BeginDraw</a> and <a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nf-d2d1-id2d1rendertarget-enddraw">EndDraw</a> blocks. Cycling this property frequently within drawing blocks will effectively reduce the benefits of any throttling that is applied.
     * @param {D2D1_RENDERING_PRIORITY} renderingPriority Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_2/ne-d2d1_2-d2d1_rendering_priority">D2D1_RENDERING_PRIORITY</a></b>
     * 
     * The desired rendering priority for the device and associated contexts.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_2/nf-d2d1_2-id2d1device1-setrenderingpriority
     */
    SetRenderingPriority(renderingPriority) {
        ComCall(10, this, D2D1_RENDERING_PRIORITY, renderingPriority)
    }

    /**
     * 
     * @param {D2D1_DEVICE_CONTEXT_OPTIONS} options 
     * @returns {ID2D1DeviceContext1} 
     */
    CreateDeviceContext(options) {
        result := ComCall(11, this, D2D1_DEVICE_CONTEXT_OPTIONS, options, "ptr*", &deviceContext1 := 0, "HRESULT")
        return ID2D1DeviceContext1(deviceContext1)
    }

    Query(iid) {
        if (ID2D1Device1.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetRenderingPriority := CallbackCreate(GetMethod(implObj, "GetRenderingPriority"), flags, 1)
        this.vtbl.SetRenderingPriority := CallbackCreate(GetMethod(implObj, "SetRenderingPriority"), flags, 2)
        this.vtbl.CreateDeviceContext := CallbackCreate(GetMethod(implObj, "CreateDeviceContext"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetRenderingPriority)
        CallbackFree(this.vtbl.SetRenderingPriority)
        CallbackFree(this.vtbl.CreateDeviceContext)
    }
}
