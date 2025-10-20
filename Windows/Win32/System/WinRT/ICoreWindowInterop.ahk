#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<HWND>} hwnd 
     * @returns {HRESULT} 
     */
    get_WindowHandle(hwnd) {
        result := ComCall(3, this, "ptr", hwnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MessageHandled(value) {
        result := ComCall(4, this, "char", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
