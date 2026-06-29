#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides an interface for the implementation of drawing behaviors when a VirtualSurfaceImageSource requests an update.
 * @remarks
 * This interface is implemented by the developer to provide specific drawing behaviors for updates to a <a href="https://docs.microsoft.com/windows/desktop/api/windows.ui.xaml.media.dxinterop/nn-windows-ui-xaml-media-dxinterop-ivirtualsurfaceimagesourcenative">VirtualSurfaceImageSource</a>. Classes that implement  this interface are provided to the <a href="https://docs.microsoft.com/windows/desktop/api/windows.ui.xaml.media.dxinterop/nf-windows-ui-xaml-media-dxinterop-ivirtualsurfaceimagesourcenative-registerforupdatesneeded">IVirtualSurfaceImageSourceNative::RegisterForUpdatesNeeded</a>, which calls the <a href="https://docs.microsoft.com/windows/desktop/api/windows.ui.xaml.media.dxinterop/nf-windows-ui-xaml-media-dxinterop-ivirtualsurfaceupdatescallbacknative-updatesneeded">UpdatesNeeded</a> method implementation whenever an update is requested.
 * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.media.dxinterop/nn-windows-ui-xaml-media-dxinterop-ivirtualsurfaceupdatescallbacknative
 * @namespace Windows.Win32.System.WinRT.Xaml
 */
export default struct IVirtualSurfaceUpdatesCallbackNative extends IUnknown {
    /**
     * The interface identifier for IVirtualSurfaceUpdatesCallbackNative
     * @type {Guid}
     */
    static IID := Guid("{dbf2e947-8e6c-4254-9eee-7738f71386c9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVirtualSurfaceUpdatesCallbackNative interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        UpdatesNeeded : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVirtualSurfaceUpdatesCallbackNative.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    UpdatesNeeded() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IVirtualSurfaceUpdatesCallbackNative.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.UpdatesNeeded := CallbackCreate(GetMethod(implObj, "UpdatesNeeded"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.UpdatesNeeded)
    }
}
