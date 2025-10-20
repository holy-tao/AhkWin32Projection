#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a method to handle Microsoft UI Automation events that occur when the active text position changes.
 * @remarks
 * 
  * Before implementing an event handler, you should be familiar with the threading issues described in <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-threading">Understanding Threading Issues</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationactivetextpositionchangedeventhandler
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationActiveTextPositionChangedEventHandler extends IUnknown{
    /**
     * The interface identifier for IUIAutomationActiveTextPositionChangedEventHandler
     * @type {Guid}
     */
    static IID => Guid("{f97933b0-8dae-4496-8997-5ba015fe0d82}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IUIAutomationElement>} sender 
     * @param {Pointer<IUIAutomationTextRange>} range 
     * @returns {HRESULT} 
     */
    HandleActiveTextPositionChangedEvent(sender, range) {
        result := ComCall(3, this, "ptr", sender, "ptr", range, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
