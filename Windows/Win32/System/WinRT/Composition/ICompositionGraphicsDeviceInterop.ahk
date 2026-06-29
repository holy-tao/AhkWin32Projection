#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * A native interoperation interface that allows getting and setting the graphics device. This is interface is available in C++ only.
 * @remarks
 * See <a href="https://docs.microsoft.com/windows/desktop/api/windows.ui.composition.interop/nn-windows-ui-composition-interop-icompositiondrawingsurfaceinterop">ICompositionDrawingSurfaceInterop</a> for usage examples.
 * @see https://learn.microsoft.com/windows/win32/api/windows.ui.composition.interop/nn-windows-ui-composition-interop-icompositiongraphicsdeviceinterop
 * @namespace Windows.Win32.System.WinRT.Composition
 */
export default struct ICompositionGraphicsDeviceInterop extends IUnknown {
    /**
     * The interface identifier for ICompositionGraphicsDeviceInterop
     * @type {Guid}
     */
    static IID := Guid("{a116ff71-f8bf-4c8a-9c98-70779a32a9c8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICompositionGraphicsDeviceInterop interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetRenderingDevice : IntPtr
        SetRenderingDevice : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICompositionGraphicsDeviceInterop.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the rendering device.
     * @returns {IUnknown} Type: <b>IUnknown**</b>
     * 
     * The retrieved rendering device.
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.composition.interop/nf-windows-ui-composition-interop-icompositiongraphicsdeviceinterop-getrenderingdevice
     */
    GetRenderingDevice() {
        result := ComCall(3, this, "ptr*", &value := 0, "HRESULT")
        return IUnknown(value)
    }

    /**
     * Sets the rendering device.
     * @param {IUnknown} value Type: <b>IUnknown*</b>
     * 
     * The new rendering device.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns S_OK. Otherwise, it returns an HRESULT error code.
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.composition.interop/nf-windows-ui-composition-interop-icompositiongraphicsdeviceinterop-setrenderingdevice
     */
    SetRenderingDevice(value) {
        result := ComCall(4, this, "ptr", value, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICompositionGraphicsDeviceInterop.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetRenderingDevice := CallbackCreate(GetMethod(implObj, "GetRenderingDevice"), flags, 2)
        this.vtbl.SetRenderingDevice := CallbackCreate(GetMethod(implObj, "SetRenderingDevice"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetRenderingDevice)
        CallbackFree(this.vtbl.SetRenderingDevice)
    }
}
