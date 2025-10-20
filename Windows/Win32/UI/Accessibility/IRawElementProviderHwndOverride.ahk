#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a method that enables repositioning of window-based elements within the fragment's UI Automation tree.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nn-uiautomationcore-irawelementproviderhwndoverride
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IRawElementProviderHwndOverride extends IUnknown{
    /**
     * The interface identifier for IRawElementProviderHwndOverride
     * @type {Guid}
     */
    static IID => Guid("{1d5df27c-8947-4425-b8d9-79787bb460b8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {HWND} hwnd 
     * @param {Pointer<IRawElementProviderSimple>} pRetVal 
     * @returns {HRESULT} 
     */
    GetOverrideProviderForHwnd(hwnd, pRetVal) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(3, this, "ptr", hwnd, "ptr", pRetVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
