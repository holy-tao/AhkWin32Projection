#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a method to handle events that occur when Microsoft UI Automation reports a text-changed event from text edit controls.
 * @remarks
 * 
 * This interface is implemented by the application to handle events that it has subscribed to by using <b>AddTextEditTextChangedEventHandler</b>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationtextedittextchangedeventhandler
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationTextEditTextChangedEventHandler extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAutomationTextEditTextChangedEventHandler
     * @type {Guid}
     */
    static IID => Guid("{92faa680-e704-4156-931a-e32d5bb38f3f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["HandleTextEditTextChangedEvent"]

    /**
     * Handles an event that is raised when a Microsoft UI Automation provider for a text-edit control reports a programmatic text change.
     * @param {IUIAutomationElement} sender Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a>*</b>
     * 
     * A pointer to the element that raised the event.
     * @param {Integer} textEditChangeType 
     * @param {Pointer<SAFEARRAY>} eventStrings Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-workingwithsafearrays">SAFEARRAY</a>*</b>
     * 
     * Event data passed by the event.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationtextedittextchangedeventhandler-handletextedittextchangedevent
     */
    HandleTextEditTextChangedEvent(sender, textEditChangeType, eventStrings) {
        result := ComCall(3, this, "ptr", sender, "int", textEditChangeType, "ptr", eventStrings, "HRESULT")
        return result
    }
}
