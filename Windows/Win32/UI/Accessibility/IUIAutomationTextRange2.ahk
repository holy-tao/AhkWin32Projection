#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUIAutomationTextRange.ahk

/**
 * Extends the IUIAutomationTextRange interface to enable Microsoft UI Automation clients to programmatically invoke context menus.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationtextrange2
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationTextRange2 extends IUIAutomationTextRange{
    /**
     * The interface identifier for IUIAutomationTextRange2
     * @type {Guid}
     */
    static IID => Guid("{bb9b40e0-5e04-46bd-9be0-4b601b9afad4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 21

    /**
     * 
     * @returns {HRESULT} 
     */
    ShowContextMenu() {
        result := ComCall(21, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
