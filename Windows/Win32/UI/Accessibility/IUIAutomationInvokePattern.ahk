#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a method that enables a client application to invoke the action of a control (typically a button).
 * @remarks
 * 
  * A control should support this interface if it initiates or performs a single, unambiguous action and does not maintain state when activated.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationinvokepattern
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationInvokePattern extends IUnknown{
    /**
     * The interface identifier for IUIAutomationInvokePattern
     * @type {Guid}
     */
    static IID => Guid("{fb377fbe-8ea6-46d5-9c73-6499642d3059}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @returns {HRESULT} 
     */
    Invoke() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
