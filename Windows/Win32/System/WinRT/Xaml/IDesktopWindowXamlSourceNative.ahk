#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Xaml
 * @version v4.0.30319
 */
class IDesktopWindowXamlSourceNative extends IUnknown{
    /**
     * The interface identifier for IDesktopWindowXamlSourceNative
     * @type {Guid}
     */
    static IID => Guid("{3cbcf1bf-2f76-4e9c-96ab-e84b37972554}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {HWND} parentWnd 
     * @returns {HRESULT} 
     */
    AttachToWindow(parentWnd) {
        parentWnd := parentWnd is Win32Handle ? NumGet(parentWnd, "ptr") : parentWnd

        result := ComCall(3, this, "ptr", parentWnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<HWND>} hWnd 
     * @returns {HRESULT} 
     */
    get_WindowHandle(hWnd) {
        result := ComCall(4, this, "ptr", hWnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
