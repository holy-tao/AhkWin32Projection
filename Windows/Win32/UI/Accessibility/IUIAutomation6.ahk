#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUIAutomation5.ahk

/**
 * Extends the IUIAutomation5 interface to expose additional methods for controlling Microsoft UI Automation functionality.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomation6
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomation6 extends IUIAutomation5{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAutomation6
     * @type {Guid}
     */
    static IID => Guid("{aae072da-29e3-413d-87a7-192dbf81ed10}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 70

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateEventHandlerGroup", "AddEventHandlerGroup", "RemoveEventHandlerGroup", "get_ConnectionRecoveryBehavior", "put_ConnectionRecoveryBehavior", "get_CoalesceEvents", "put_CoalesceEvents", "AddActiveTextPositionChangedEventHandler", "RemoveActiveTextPositionChangedEventHandler"]

    /**
     * 
     * @param {Pointer<IUIAutomationEventHandlerGroup>} handlerGroup 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation6-createeventhandlergroup
     */
    CreateEventHandlerGroup(handlerGroup) {
        result := ComCall(70, this, "ptr*", handlerGroup, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUIAutomationElement} element 
     * @param {IUIAutomationEventHandlerGroup} handlerGroup 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation6-addeventhandlergroup
     */
    AddEventHandlerGroup(element, handlerGroup) {
        result := ComCall(71, this, "ptr", element, "ptr", handlerGroup, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUIAutomationElement} element 
     * @param {IUIAutomationEventHandlerGroup} handlerGroup 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation6-removeeventhandlergroup
     */
    RemoveEventHandlerGroup(element, handlerGroup) {
        result := ComCall(72, this, "ptr", element, "ptr", handlerGroup, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} connectionRecoveryBehaviorOptions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation6-get_connectionrecoverybehavior
     */
    get_ConnectionRecoveryBehavior(connectionRecoveryBehaviorOptions) {
        connectionRecoveryBehaviorOptionsMarshal := connectionRecoveryBehaviorOptions is VarRef ? "int*" : "ptr"

        result := ComCall(73, this, connectionRecoveryBehaviorOptionsMarshal, connectionRecoveryBehaviorOptions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} connectionRecoveryBehaviorOptions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation6-put_connectionrecoverybehavior
     */
    put_ConnectionRecoveryBehavior(connectionRecoveryBehaviorOptions) {
        result := ComCall(74, this, "int", connectionRecoveryBehaviorOptions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} coalesceEventsOptions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation6-get_coalesceevents
     */
    get_CoalesceEvents(coalesceEventsOptions) {
        coalesceEventsOptionsMarshal := coalesceEventsOptions is VarRef ? "int*" : "ptr"

        result := ComCall(75, this, coalesceEventsOptionsMarshal, coalesceEventsOptions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} coalesceEventsOptions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation6-put_coalesceevents
     */
    put_CoalesceEvents(coalesceEventsOptions) {
        result := ComCall(76, this, "int", coalesceEventsOptions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUIAutomationElement} element 
     * @param {Integer} scope 
     * @param {IUIAutomationCacheRequest} cacheRequest 
     * @param {IUIAutomationActiveTextPositionChangedEventHandler} handler 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation6-addactivetextpositionchangedeventhandler
     */
    AddActiveTextPositionChangedEventHandler(element, scope, cacheRequest, handler) {
        result := ComCall(77, this, "ptr", element, "int", scope, "ptr", cacheRequest, "ptr", handler, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUIAutomationElement} element 
     * @param {IUIAutomationActiveTextPositionChangedEventHandler} handler 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation6-removeactivetextpositionchangedeventhandler
     */
    RemoveActiveTextPositionChangedEventHandler(element, handler) {
        result := ComCall(78, this, "ptr", element, "ptr", handler, "HRESULT")
        return result
    }
}
