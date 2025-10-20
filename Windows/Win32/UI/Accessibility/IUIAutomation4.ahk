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
     * 
     * @param {IUIAutomationElement} element 
     * @param {Integer} scope 
     * @param {Pointer<Integer>} changeTypes 
     * @param {Integer} changesCount 
     * @param {IUIAutomationCacheRequest} pCacheRequest 
     * @param {IUIAutomationChangesEventHandler} handler 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation4-addchangeseventhandler
     */
    AddChangesEventHandler(element, scope, changeTypes, changesCount, pCacheRequest, handler) {
        result := ComCall(66, this, "ptr", element, "int", scope, "int*", changeTypes, "int", changesCount, "ptr", pCacheRequest, "ptr", handler, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUIAutomationElement} element 
     * @param {IUIAutomationChangesEventHandler} handler 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation4-removechangeseventhandler
     */
    RemoveChangesEventHandler(element, handler) {
        result := ComCall(67, this, "ptr", element, "ptr", handler, "HRESULT")
        return result
    }
}
