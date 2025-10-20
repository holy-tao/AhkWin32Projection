#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a method to handle events that occur when the Microsoft UI Automation tree structure is changed.
 * @remarks
 * 
  * This interface is implemented by the application to handle events that it has subscribed to by using <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomation-addstructurechangedeventhandler">AddStructureChangedEventHandler</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationstructurechangedeventhandler
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationStructureChangedEventHandler extends IUnknown{
    /**
     * The interface identifier for IUIAutomationStructureChangedEventHandler
     * @type {Guid}
     */
    static IID => Guid("{e81d1b4e-11c5-42f8-9754-e7036c79f054}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IUIAutomationElement>} sender 
     * @param {Integer} changeType 
     * @param {Pointer<SAFEARRAY>} runtimeId 
     * @returns {HRESULT} 
     */
    HandleStructureChangedEvent(sender, changeType, runtimeId) {
        result := ComCall(3, this, "ptr", sender, "int", changeType, "ptr", runtimeId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
