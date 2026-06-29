#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IInspectable.ahk" { IInspectable }

/**
 * Allows an app to get an instance of the ISystemMediaTransportControls interface.
 * @see https://learn.microsoft.com/windows/win32/api/systemmediatransportcontrolsinterop/nn-systemmediatransportcontrolsinterop-isystemmediatransportcontrolsinterop
 * @namespace Windows.Win32.System.WinRT
 */
export default struct ISystemMediaTransportControlsInterop extends IInspectable {
    /**
     * The interface identifier for ISystemMediaTransportControlsInterop
     * @type {Guid}
     */
    static IID := Guid("{ddb0472d-c911-4a1f-86d9-dc3d71a95f5a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISystemMediaTransportControlsInterop interfaces
    */
    struct Vtbl extends IInspectable.Vtbl {
        GetForWindow : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISystemMediaTransportControlsInterop.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets an instance of the ISystemMediaTransportControls interface for the specified window.
     * @remarks
     * The <i>appWindow</i> parameter must refer to a top-level window that belongs to the calling process.
     * @param {HWND} appWindow The top-level app window for which the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mediatransport/isystemmediatransportcontrols">ISystemMediaTransportControls</a> interface is retrieved.
     * @param {Pointer<Guid>} riid A reference to the IID of the interface to retrieve.
     * @returns {Pointer<Void>} Receives the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mediatransport/isystemmediatransportcontrols">ISystemMediaTransportControls</a> that corresponds to the <i>appWindow</i> window.
     * @see https://learn.microsoft.com/windows/win32/api/systemmediatransportcontrolsinterop/nf-systemmediatransportcontrolsinterop-isystemmediatransportcontrolsinterop-getforwindow
     */
    GetForWindow(appWindow, riid) {
        result := ComCall(6, this, HWND, appWindow, Guid.Ptr, riid, "ptr*", &mediaTransportControl := 0, "HRESULT")
        return mediaTransportControl
    }

    Query(iid) {
        if (ISystemMediaTransportControlsInterop.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetForWindow := CallbackCreate(GetMethod(implObj, "GetForWindow"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetForWindow)
    }
}
