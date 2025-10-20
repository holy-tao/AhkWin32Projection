#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a method to support access by a Microsoft UI Automation client to controls that support a custom navigation order.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationcustomnavigationpattern
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationCustomNavigationPattern extends IUnknown{
    /**
     * The interface identifier for IUIAutomationCustomNavigationPattern
     * @type {Guid}
     */
    static IID => Guid("{01ea217a-1766-47ed-a6cc-acf492854b1f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} direction 
     * @param {Pointer<IUIAutomationElement>} pRetVal 
     * @returns {HRESULT} 
     */
    Navigate(direction, pRetVal) {
        result := ComCall(3, this, "int", direction, "ptr", pRetVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
