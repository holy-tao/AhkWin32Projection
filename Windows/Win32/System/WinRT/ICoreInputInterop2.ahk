#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HWND.ahk
#Include .\IInspectable.ahk

/**
 * @namespace Windows.Win32.System.WinRT
 * @version v4.0.30319
 */
class ICoreInputInterop2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICoreInputInterop2
     * @type {Guid}
     */
    static IID => Guid("{b8a2acd7-a0f0-40ee-8ee7-c82f59cc5cd4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_WindowHandle", "ChangeHostingContext"]

    /**
     * @type {HWND} 
     */
    WindowHandle {
        get => this.get_WindowHandle()
    }

    /**
     * 
     * @returns {HWND} 
     */
    get_WindowHandle() {
        window := HWND()
        result := ComCall(6, this, "ptr", window, "HRESULT")
        return window
    }

    /**
     * 
     * @param {HWND} newParentWindow 
     * @param {Integer} newViewInstanceId 
     * @returns {HRESULT} 
     */
    ChangeHostingContext(newParentWindow, newViewInstanceId) {
        newParentWindow := newParentWindow is Win32Handle ? NumGet(newParentWindow, "ptr") : newParentWindow

        result := ComCall(7, this, "ptr", newParentWindow, "uint", newViewInstanceId, "HRESULT")
        return result
    }
}
