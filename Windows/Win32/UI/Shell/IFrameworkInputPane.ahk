#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IFrameworkInputPaneHandler.ahk" { IFrameworkInputPaneHandler }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides methods that enable apps to be informed of state changes and location for the input pane.
 * @remarks
 * <h3><a id="When_to_implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to implement</h3>
 * Do not implement this interface; the implementation is supplied with Windows as CLSID_FrameworkInputPane.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iframeworkinputpane
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IFrameworkInputPane extends IUnknown {
    /**
     * The interface identifier for IFrameworkInputPane
     * @type {Guid}
     */
    static IID := Guid("{5752238b-24f0-495a-82f1-2fd593056796}")

    /**
     * The class identifier for FrameworkInputPane
     * @type {Guid}
     */
    static CLSID := Guid("{d5120aa3-46ba-44c5-822d-ca8092c1fc72}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFrameworkInputPane interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Advise         : IntPtr
        AdviseWithHWND : IntPtr
        Unadvise       : IntPtr
        Location       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFrameworkInputPane.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Registers the app's input pane handler object to receive notifications on behalf of a window when an event triggers the input pane. This method differs from AdviseWithHWND in that it references its window through an object that implements ICoreWindow.
     * @param {IUnknown} pWindow Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * A pointer to the window (an object that implements <a href="https://docs.microsoft.com/uwp/api/windows.ui.core.icorewindow">ICoreWindow</a>) for which the handler should listen for input pane events.
     * @param {IFrameworkInputPaneHandler} pHandler Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iframeworkinputpanehandler">IFrameworkInputPaneHandler</a>*</b>
     * 
     * An <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iframeworkinputpanehandler">IFrameworkInputPaneHandler</a> interface pointer to the handler instance for this app.
     * @returns {Integer} Type: <b>DWORD*</b>
     * 
     * A pointer to a value that, when this method returns successfully, receives a cookie for that can be used later to unregister the handler through the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iframeworkinputpane-unadvise">Unadvise</a> method.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iframeworkinputpane-advise
     */
    Advise(pWindow, pHandler) {
        result := ComCall(3, this, "ptr", pWindow, "ptr", pHandler, "uint*", &pdwCookie := 0, "HRESULT")
        return pdwCookie
    }

    /**
     * Registers the app's input pane handler object to receive notifications on behalf of a window when an event triggers the input pane. This method differs from Advise in that it references its window through an HWND.
     * @param {HWND} _hwnd Type: <b>HWND</b>
     * 
     * The handle of the window for which the handler should listen for input pane events.
     * @param {IFrameworkInputPaneHandler} pHandler Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iframeworkinputpanehandler">IFrameworkInputPaneHandler</a>*</b>
     * 
     * An <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iframeworkinputpanehandler">IFrameworkInputPaneHandler</a> interface pointer to the handler instance for this app.
     * @returns {Integer} Type: <b>DWORD*</b>
     * 
     * A pointer to a value that, when this method returns successfully, receives a cookie for that can be used later to unregister the handler through the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iframeworkinputpane-unadvise">Unadvise</a> method.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iframeworkinputpane-advisewithhwnd
     */
    AdviseWithHWND(_hwnd, pHandler) {
        result := ComCall(4, this, HWND, _hwnd, "ptr", pHandler, "uint*", &pdwCookie := 0, "HRESULT")
        return pdwCookie
    }

    /**
     * Unregisters an app's input pane handler object so that it no longer receives notifications.
     * @param {Integer} dwCookie Type: <b>DWORD</b>
     * 
     * A cookie that identifies the handler. This value was obtained when you registered the handler through the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iframeworkinputpane-advise">Advise</a> method.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iframeworkinputpane-unadvise
     */
    Unadvise(dwCookie) {
        result := ComCall(5, this, "uint", dwCookie, "HRESULT")
        return result
    }

    /**
     * Gets the current location of the input pane.
     * @returns {RECT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that, when this method returns successfully, receives the location of the input pane, in screen coordinates. If the input pane is not visible, this structure receives an empty rectangle.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iframeworkinputpane-location
     */
    Location() {
        prcInputPaneScreenLocation := RECT()
        result := ComCall(6, this, RECT.Ptr, prcInputPaneScreenLocation, "HRESULT")
        return prcInputPaneScreenLocation
    }

    Query(iid) {
        if (IFrameworkInputPane.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Advise := CallbackCreate(GetMethod(implObj, "Advise"), flags, 4)
        this.vtbl.AdviseWithHWND := CallbackCreate(GetMethod(implObj, "AdviseWithHWND"), flags, 4)
        this.vtbl.Unadvise := CallbackCreate(GetMethod(implObj, "Unadvise"), flags, 2)
        this.vtbl.Location := CallbackCreate(GetMethod(implObj, "Location"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Advise)
        CallbackFree(this.vtbl.AdviseWithHWND)
        CallbackFree(this.vtbl.Unadvise)
        CallbackFree(this.vtbl.Location)
    }
}
