#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a method to handle Microsoft UI Automation events.
 * @remarks
 * 
  * This interface is implemented by the application to handle events that it has subscribed to by using <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomation-addautomationeventhandler">AddAutomationEventHandler</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationeventhandler
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationEventHandler extends IUnknown{
    /**
     * The interface identifier for IUIAutomationEventHandler
     * @type {Guid}
     */
    static IID => Guid("{146c3c17-f12e-4e22-8c27-f894b9b79c69}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IUIAutomationElement>} sender 
     * @param {Integer} eventId 
     * @returns {HRESULT} 
     */
    HandleAutomationEvent(sender, eventId) {
        result := ComCall(3, this, "ptr", sender, "int", eventId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
