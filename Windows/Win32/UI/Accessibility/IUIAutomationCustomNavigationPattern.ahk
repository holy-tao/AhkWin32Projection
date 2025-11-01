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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Navigate"]

    /**
     * 
     * @param {Integer} direction 
     * @param {Pointer<IUIAutomationElement>} pRetVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationcustomnavigationpattern-navigate
     */
    Navigate(direction, pRetVal) {
        result := ComCall(3, this, "int", direction, "ptr*", pRetVal, "HRESULT")
        return result
    }
}
