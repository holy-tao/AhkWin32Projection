#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a method to handle one or more Microsoft UI Automation change events.
 * @remarks
 * 
  * This interface is implemented by the application to handle events that it has subscribed to by calling <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomation4-addchangeseventhandler">AddChangesEventHandler</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationchangeseventhandler
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationChangesEventHandler extends IUnknown{
    /**
     * The interface identifier for IUIAutomationChangesEventHandler
     * @type {Guid}
     */
    static IID => Guid("{58edca55-2c3e-4980-b1b9-56c17f27a2a0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IUIAutomationElement>} sender 
     * @param {Pointer<UiaChangeInfo>} uiaChanges 
     * @param {Integer} changesCount 
     * @returns {HRESULT} 
     */
    HandleChangesEvent(sender, uiaChanges, changesCount) {
        result := ComCall(3, this, "ptr", sender, "ptr", uiaChanges, "int", changesCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
