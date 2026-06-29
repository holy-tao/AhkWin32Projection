#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Enables apps to obtain the window handle of the window (CoreWindow) associated with this interface.
 * @remarks
 * Windows Store apps can have multiple <a href="https://docs.microsoft.com/uwp/api/windows.ui.core.corewindow">CoreWindow</a> instances. Each <b>CoreWindow</b> instance also has a native interface for accessing the underlying HWND, represented as an instance of <b>ICoreWindowInterop</b>.
 * @see https://learn.microsoft.com/windows/win32/api/corewindow/nn-corewindow-icorewindowinterop
 * @namespace Windows.Win32.System.WinRT
 */
export default struct ICoreWindowInterop extends IUnknown {
    /**
     * The interface identifier for ICoreWindowInterop
     * @type {Guid}
     */
    static IID := Guid("{45d64a29-a63e-4cb6-b498-5781d298cb4f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICoreWindowInterop interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_WindowHandle   : IntPtr
        put_MessageHandled : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICoreWindowInterop.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {HWND} 
     */
    WindowHandle {
        get => this.get_WindowHandle()
    }

    /**
     * @type {Integer} 
     */
    MessageHandled {
        set => this.put_MessageHandled(value)
    }

    /**
     * Obtains the handle (HWND) to the CoreWindow for an app.
     * @returns {HWND} 
     * @see https://learn.microsoft.com/windows/win32/api/corewindow/nf-corewindow-icorewindowinterop-get_windowhandle
     */
    get_WindowHandle() {
        _hwnd := HWND()
        result := ComCall(3, this, HWND.Ptr, _hwnd, "HRESULT")
        return _hwnd
    }

    /**
     * Sets whether or not the message to the CoreWindow has been handled. (ICoreWindowInterop.put_MessageHandled)
     * @param {Integer} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/corewindow/nf-corewindow-icorewindowinterop-put_messagehandled
     */
    put_MessageHandled(value) {
        result := ComCall(4, this, "char", value, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICoreWindowInterop.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_WindowHandle := CallbackCreate(GetMethod(implObj, "get_WindowHandle"), flags, 2)
        this.vtbl.put_MessageHandled := CallbackCreate(GetMethod(implObj, "put_MessageHandled"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_WindowHandle)
        CallbackFree(this.vtbl.put_MessageHandled)
    }
}
