#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IHWEventHandler.ahk" { IHWEventHandler }

/**
 * Extends the IHWEventHandler interface to address User Account Control (UAC) elevation for device handlers.
 * @remarks
 * This interface also provides the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/nn-shobjidl-ihweventhandler">IHWEventHandler</a> interface, from which it inherits.
 * 
 * Handlers that implement this interface should return quickly from calls to <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/nf-shobjidl-ihweventhandler-handleevent">IHWEventHandler::HandleEvent</a> and <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/nf-shobjidl-ihweventhandler2-handleeventwithhwnd">IHWEventHandler2::HandleEventWithHWND</a> so they do not block the AutoPlay dialog from closing. Also, if a local server must be launched for the creation of this handler, it should not block the CreateInstance call; it should return as soon as possible.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-ihweventhandler2
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IHWEventHandler2 extends IHWEventHandler {
    /**
     * The interface identifier for IHWEventHandler2
     * @type {Guid}
     */
    static IID := Guid("{cfcc809f-295d-42e8-9ffc-424b33c487e6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHWEventHandler2 interfaces
    */
    struct Vtbl extends IHWEventHandler.Vtbl {
        HandleEventWithHWND : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHWEventHandler2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Handles AutoPlay device events that contain content types that the application is not registered to handle. This method provides a handle to the owner window so that UI can be displayed if the process requires elevated privileges.
     * @remarks
     * When a handler is invoked and requires immediate privilege elevation in a new process, it requires an active parent window handle to display its consent UI. <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/nf-shobjidl-ihweventhandler-handleevent">IHWEventHandler::HandleEvent</a> cannot give a handle, so only a blinking taskbar appears. <b>IHWEventHandler2::HandleEventWithHWND</b> provides the HWND and enables the UI to be displayed.
     * 
     * Note that if the handler was launched by default instead of by direct user action, the HWND is not active and the dialog is not shown in the foreground.
     * 
     * The event types are not C/C++ language constants; they are literal text strings.
     * @param {PWSTR} pszDeviceID Type: <b>LPCWSTR</b>
     * 
     * A pointer to a string buffer that contains the device ID.
     * @param {PWSTR} pszAltDeviceID Type: <b>LPCWSTR</b>
     * 
     * A pointer to a string buffer that contains the alternate device ID. The alternate device ID is more human-readable than the primary device ID.
     * @param {PWSTR} pszEventType Type: <b>LPCWSTR</b>
     * 
     * A pointer to a string buffer that contains the event type. The event types include DeviceArrival, DeviceRemoval, MediaArrival, and MediaRemoval.
     * @param {HWND} hwndOwner Type: <b>HWND</b>
     * 
     * A handle to the AutoPlay dialog that was displayed.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-ihweventhandler2-handleeventwithhwnd
     */
    HandleEventWithHWND(pszDeviceID, pszAltDeviceID, pszEventType, hwndOwner) {
        pszDeviceID := pszDeviceID is String ? StrPtr(pszDeviceID) : pszDeviceID
        pszAltDeviceID := pszAltDeviceID is String ? StrPtr(pszAltDeviceID) : pszAltDeviceID
        pszEventType := pszEventType is String ? StrPtr(pszEventType) : pszEventType

        result := ComCall(6, this, "ptr", pszDeviceID, "ptr", pszAltDeviceID, "ptr", pszEventType, HWND, hwndOwner, "HRESULT")
        return result
    }

    Query(iid) {
        if (IHWEventHandler2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.HandleEventWithHWND := CallbackCreate(GetMethod(implObj, "HandleEventWithHWND"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.HandleEventWithHWND)
    }
}
