#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUIAutomation3.ahk

/**
 * Extends the IUIAutomation3 interface to expose additional methods for controlling Microsoft UI Automation functionality.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomation4
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomation4 extends IUIAutomation3{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAutomation4
     * @type {Guid}
     */
    static IID => Guid("{1189c02a-05f8-4319-8e21-e817e3db2860}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 66

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddChangesEventHandler", "RemoveChangesEventHandler"]

    /**
     * Registers a method that handles change events.Note  Before implementing an event handler, you should be familiar with the threading issues described in Understanding Threading Issues.
     * @param {IUIAutomationElement} element Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a>*</b>
     * 
     * A pointer to the UI Automation element associated with the event handler.
     * @param {Integer} scope 
     * @param {Pointer<Integer>} changeTypes Type: <b>int*</b>
     * 
     * A pointer to a list of integers that indicate the change types the event represents.
     * @param {Integer} changesCount Type: <b>int</b>
     * 
     * The number of changes that occurred in this event.
     * @param {IUIAutomationCacheRequest} pCacheRequest Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationcacherequest">IUIAutomationCacheRequest</a>*</b>
     * 
     * A pointer to a cache request, or <b>NULL</b> if no caching is wanted.
     * @param {IUIAutomationChangesEventHandler} handler Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationchangeseventhandler">IUIAutomationChangesEventHandler</a>*</b>
     * 
     * A pointer to the object that handles the changes event.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomation4-addchangeseventhandler
     */
    AddChangesEventHandler(element, scope, changeTypes, changesCount, pCacheRequest, handler) {
        changeTypesMarshal := changeTypes is VarRef ? "int*" : "ptr"

        result := ComCall(66, this, "ptr", element, "int", scope, changeTypesMarshal, changeTypes, "int", changesCount, "ptr", pCacheRequest, "ptr", handler, "HRESULT")
        return result
    }

    /**
     * Removes a changes event handler.
     * @param {IUIAutomationElement} element Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a>*</b>
     * 
     * A pointer to the UI Automation element from which to remove the handler.
     * @param {IUIAutomationChangesEventHandler} handler Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationchangeseventhandler">IUIAutomationChangesEventHandler</a>*</b>
     * 
     * A pointer to the  interface that was passed to <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomation4-addchangeseventhandler">AddChangesEventHandler</a>.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomation4-removechangeseventhandler
     */
    RemoveChangesEventHandler(element, handler) {
        result := ComCall(67, this, "ptr", element, "ptr", handler, "HRESULT")
        return result
    }
}
