#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a method to handle Microsoft UI Automation events that occur when a property is changed.
 * @remarks
 * 
  * This interface is implemented by the application to handle events that it has subscribed to by using <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomation-addpropertychangedeventhandler">AddPropertyChangedEventHandler</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationpropertychangedeventhandler
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationPropertyChangedEventHandler extends IUnknown{
    /**
     * The interface identifier for IUIAutomationPropertyChangedEventHandler
     * @type {Guid}
     */
    static IID => Guid("{40cd37d4-c756-4b0c-8c6f-bddfeeb13b50}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IUIAutomationElement>} sender 
     * @param {Integer} propertyId 
     * @param {VARIANT} newValue 
     * @returns {HRESULT} 
     */
    HandlePropertyChangedEvent(sender, propertyId, newValue) {
        result := ComCall(3, this, "ptr", sender, "int", propertyId, "ptr", newValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
