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
     * 
     * @param {Pointer<IUIAutomationEventHandlerGroup>} handlerGroup 
     * @returns {HRESULT} 
     */
    CreateEventHandlerGroup(handlerGroup) {
        result := ComCall(70, this, "ptr", handlerGroup, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationElement>} element 
     * @param {Pointer<IUIAutomationEventHandlerGroup>} handlerGroup 
     * @returns {HRESULT} 
     */
    AddEventHandlerGroup(element, handlerGroup) {
        result := ComCall(71, this, "ptr", element, "ptr", handlerGroup, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationElement>} element 
     * @param {Pointer<IUIAutomationEventHandlerGroup>} handlerGroup 
     * @returns {HRESULT} 
     */
    RemoveEventHandlerGroup(element, handlerGroup) {
        result := ComCall(72, this, "ptr", element, "ptr", handlerGroup, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} connectionRecoveryBehaviorOptions 
     * @returns {HRESULT} 
     */
    get_ConnectionRecoveryBehavior(connectionRecoveryBehaviorOptions) {
        result := ComCall(73, this, "int*", connectionRecoveryBehaviorOptions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} connectionRecoveryBehaviorOptions 
     * @returns {HRESULT} 
     */
    put_ConnectionRecoveryBehavior(connectionRecoveryBehaviorOptions) {
        result := ComCall(74, this, "int", connectionRecoveryBehaviorOptions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} coalesceEventsOptions 
     * @returns {HRESULT} 
     */
    get_CoalesceEvents(coalesceEventsOptions) {
        result := ComCall(75, this, "int*", coalesceEventsOptions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} coalesceEventsOptions 
     * @returns {HRESULT} 
     */
    put_CoalesceEvents(coalesceEventsOptions) {
        result := ComCall(76, this, "int", coalesceEventsOptions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationElement>} element 
     * @param {Integer} scope 
     * @param {Pointer<IUIAutomationCacheRequest>} cacheRequest 
     * @param {Pointer<IUIAutomationActiveTextPositionChangedEventHandler>} handler 
     * @returns {HRESULT} 
     */
    AddActiveTextPositionChangedEventHandler(element, scope, cacheRequest, handler) {
        result := ComCall(77, this, "ptr", element, "int", scope, "ptr", cacheRequest, "ptr", handler, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationElement>} element 
     * @param {Pointer<IUIAutomationActiveTextPositionChangedEventHandler>} handler 
     * @returns {HRESULT} 
     */
    RemoveActiveTextPositionChangedEventHandler(element, handler) {
        result := ComCall(78, this, "ptr", element, "ptr", handler, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
