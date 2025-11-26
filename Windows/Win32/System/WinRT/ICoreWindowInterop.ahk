#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HWND.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Enables apps to obtain the window handle of the window (CoreWindow) associated with this interface.
 * @remarks
 * 
 * Windows Store apps can have multiple <a href="https://docs.microsoft.com/uwp/api/windows.ui.core.corewindow">CoreWindow</a> instances. Each <b>CoreWindow</b> instance also has a native interface for accessing the underlying HWND, represented as an instance of <b>ICoreWindowInterop</b>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//corewindow/nn-corewindow-icorewindowinterop
 * @namespace Windows.Win32.System.WinRT
 * @version v4.0.30319
 */
class ICoreWindowInterop extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICoreWindowInterop
     * @type {Guid}
     */
    static IID => Guid("{45d64a29-a63e-4cb6-b498-5781d298cb4f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_WindowHandle", "put_MessageHandled"]

    /**
     * @type {HWND} 
     */
    WindowHandle {
        get => this.get_WindowHandle()
    }

    /**
     * @type {HRESULT} 
     */
    MessageHandled {
        set => this.put_MessageHandled(value)
    }

    /**
     * 
     * @returns {HWND} 
     * @see https://learn.microsoft.com/windows/win32/api/corewindow/nf-corewindow-icorewindowinterop-get_windowhandle
     */
    get_WindowHandle() {
        hwnd := HWND()
        result := ComCall(3, this, "ptr", hwnd, "HRESULT")
        return hwnd
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/corewindow/nf-corewindow-icorewindowinterop-put_messagehandled
     */
    put_MessageHandled(value) {
        result := ComCall(4, this, "char", value, "HRESULT")
        return result
    }
}
