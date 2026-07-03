#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * Enables performing bulk operations across all SurfaceImageSource objects created in the same process.
 * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.media.dxinterop/nn-windows-ui-xaml-media-dxinterop-isurfaceimagesourcemanagernative
 * @namespace Windows.Win32.System.WinRT.Xaml
 */
export default struct ISurfaceImageSourceManagerNative extends IUnknown {
    /**
     * The interface identifier for ISurfaceImageSourceManagerNative
     * @type {Guid}
     */
    static IID := Guid("{4c8798b7-1d88-4a0f-b59b-b93f600de8c8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISurfaceImageSourceManagerNative interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        FlushAllSurfacesWithDevice : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISurfaceImageSourceManagerNative.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IUnknown} device 
     * @returns {HRESULT} 
     */
    FlushAllSurfacesWithDevice(device) {
        result := ComCall(3, this, "ptr", device, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISurfaceImageSourceManagerNative.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.FlushAllSurfacesWithDevice := CallbackCreate(GetMethod(implObj, "FlushAllSurfacesWithDevice"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.FlushAllSurfacesWithDevice)
    }
}
