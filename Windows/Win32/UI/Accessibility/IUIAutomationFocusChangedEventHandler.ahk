#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a method to handle events that are raised when the keyboard focus moves to another UI Automation element.
 * @remarks
 * This interface is implemented by the application to handle events that were subscribed to by using <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomation-addfocuschangedeventhandler">AddFocusChangedEventHandler</a>
 * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationclient/nn-uiautomationclient-iuiautomationfocuschangedeventhandler
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationFocusChangedEventHandler extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAutomationFocusChangedEventHandler
     * @type {Guid}
     */
    static IID => Guid("{c270f6b5-5c69-4290-9745-7a7f97169468}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["HandleFocusChangedEvent"]

    /**
     * Handles the event raised when the keyboard focus moves to a different UI Automation element.
     * @remarks
     * This method is implemented by the application to handle events that were subscribed to by using <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomation-addfocuschangedeventhandler">AddFocusChangedEventHandler</a>
     * 
     * 
     * The UI Automation element represented by <i>sender</i> might not have any cached properties or control patterns, depending on whether the application subscribed to this event while a cache request was active.
     * 
     * Adjusting an event handler from within this method is not supported.
     * @param {IUIAutomationElement} sender Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a>*</b>
     * 
     * A pointer to the element that has received the focus.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationclient/nf-uiautomationclient-iuiautomationfocuschangedeventhandler-handlefocuschangedevent
     */
    HandleFocusChangedEvent(sender) {
        result := ComCall(3, this, "ptr", sender, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
