#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IInspectable.ahk" { IInspectable }

/**
 * Enables interoperability with a WinRT [UserActivity](/uwp/api/windows.applicationmodel.useractivities.useractivity) object.
 * @see https://learn.microsoft.com/windows/win32/api/useractivityinterop/nn-useractivityinterop-iuseractivityinterop
 * @namespace Windows.Win32.System.WinRT
 */
export default struct IUserActivityInterop extends IInspectable {
    /**
     * The interface identifier for IUserActivityInterop
     * @type {Guid}
     */
    static IID := Guid("{1ade314d-0e0a-40d9-824c-9a088a50059f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUserActivityInterop interfaces
    */
    struct Vtbl extends IInspectable.Vtbl {
        CreateSessionForWindow : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUserActivityInterop.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates a [UserActivitySession](/uwp/api/windows.applicationmodel.useractivities.useractivitysession) associated with the specified window.
     * @param {HWND} window Handle to the window of the active application.
     * @param {Pointer<Guid>} iid The GUID for the resource interface.
     * 
     * The REFIID, or GUID, of the interface to the resource can be obtained by using the __uuidof() macro. For example: 
     * 
     * `__uuidof(UserActivitySession)`
     * @returns {Pointer<Void>} Address of a pointer to a [UserActivitySession](/uwp/api/windows.applicationmodel.useractivities.useractivitysession) object.
     * @see https://learn.microsoft.com/windows/win32/api/useractivityinterop/nf-useractivityinterop-iuseractivityinterop-createsessionforwindow
     */
    CreateSessionForWindow(window, iid) {
        result := ComCall(6, this, HWND, window, Guid.Ptr, iid, "ptr*", &value := 0, "HRESULT")
        return value
    }

    Query(iid) {
        if (IUserActivityInterop.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateSessionForWindow := CallbackCreate(GetMethod(implObj, "CreateSessionForWindow"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateSessionForWindow)
    }
}
