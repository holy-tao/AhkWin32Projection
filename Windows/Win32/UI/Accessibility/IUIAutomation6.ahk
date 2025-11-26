#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUIAutomationEventHandlerGroup.ahk
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
     * @type {Integer} 
     */
    ConnectionRecoveryBehavior {
        get => this.get_ConnectionRecoveryBehavior()
        set => this.put_ConnectionRecoveryBehavior(value)
    }

    /**
     * @type {Integer} 
     */
    CoalesceEvents {
        get => this.get_CoalesceEvents()
        set => this.put_CoalesceEvents(value)
    }

    /**
     * Registers one or more event listeners in a single method call.
     * @returns {IUIAutomationEventHandlerGroup} A collection of UI Automation event listeners.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomation6-createeventhandlergroup
     */
    CreateEventHandlerGroup() {
        result := ComCall(70, this, "ptr*", &handlerGroup := 0, "HRESULT")
        return IUIAutomationEventHandlerGroup(handlerGroup)
    }

    /**
     * Registers a collection of event handler methods specified with the CreateEventHandlerGroup.
     * @param {IUIAutomationElement} element A pointer to the UI Automation element associated with the event handler group.
     * @param {IUIAutomationEventHandlerGroup} handlerGroup A collection of UI Automation event listeners.
     * @returns {HRESULT} If this method succeeds, it returns S_OK. Otherwise, it returns an HRESULT error code.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomation6-addeventhandlergroup
     */
    AddEventHandlerGroup(element, handlerGroup) {
        result := ComCall(71, this, "ptr", element, "ptr", handlerGroup, "HRESULT")
        return result
    }

    /**
     * Asynchronously removes the specified UI Automation event handler group.
     * @param {IUIAutomationElement} element A pointer to the UI Automation element associated with the event handler group.
     * @param {IUIAutomationEventHandlerGroup} handlerGroup A collection of UI Automation event listeners.
     * @returns {HRESULT} If this method succeeds, it returns S_OK. Otherwise, it returns an HRESULT error code.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomation6-removeeventhandlergroup
     */
    RemoveEventHandlerGroup(element, handlerGroup) {
        result := ComCall(72, this, "ptr", element, "ptr", handlerGroup, "HRESULT")
        return result
    }

    /**
     * Indicates whether an accessible technology client adjusts provider request timeouts when the provider is non-responsive.
     * @remarks
     * 
     * > ### Parameters
     * >
     * > `connectionRecoveryBehaviorOptions` [in]
     * >
     * > Type: **ConnectionRecoveryBehaviorOptions**
     * >
     * > Value indicating whether provider request timeouts are adjusted. The default is [ConnectionRecoveryBehaviorOptions_Disabled](ne-uiautomationclient-connectionrecoverybehavioroptions.md).
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomation6-get_connectionrecoverybehavior
     */
    get_ConnectionRecoveryBehavior() {
        result := ComCall(73, this, "int*", &connectionRecoveryBehaviorOptions := 0, "HRESULT")
        return connectionRecoveryBehaviorOptions
    }

    /**
     * Indicates whether an accessible technology client adjusts provider request timeouts when the provider is non-responsive.
     * @remarks
     * 
     * > ### Parameters
     * >
     * > `connectionRecoveryBehaviorOptions` [out]
     * >
     * > Type: **ConnectionRecoveryBehaviorOptions**
     * >
     * > Value indicating whether provider request timeouts are adjusted. The default is [ConnectionRecoveryBehaviorOptions_Disabled](ne-uiautomationclient-connectionrecoverybehavioroptions.md).
     * 
     * 
     * @param {Integer} connectionRecoveryBehaviorOptions 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomation6-put_connectionrecoverybehavior
     */
    put_ConnectionRecoveryBehavior(connectionRecoveryBehaviorOptions) {
        result := ComCall(74, this, "int", connectionRecoveryBehaviorOptions, "HRESULT")
        return result
    }

    /**
     * Gets or sets whether an accessible technology client receives all events, or a subset where duplicate events are detected and filtered.
     * @remarks
     * 
     * > ### Parameters
     * >
     * > `coalesceEventsOptions` [in]
     * >
     * > Type: **CoalesceEventsOptions**
     * >
     * > Value indicating whether events are filtered. The default is [CoalesceEventsOptions_Disabled](ne-uiautomationclient-coalesceeventsoptions.md).
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomation6-get_coalesceevents
     */
    get_CoalesceEvents() {
        result := ComCall(75, this, "int*", &coalesceEventsOptions := 0, "HRESULT")
        return coalesceEventsOptions
    }

    /**
     * Gets or sets whether an accessible technology client receives all events, or a subset where duplicate events are detected and filtered.
     * @remarks
     * 
     * > ### Parameters
     * >
     * > `coalesceEventsOptions` [out]
     * >
     * > Type: **CoalesceEventsOptions**
     * >
     * > Value indicating whether events are filtered. The default is [CoalesceEventsOptions_Disabled](ne-uiautomationclient-coalesceeventsoptions.md).
     * 
     * 
     * @param {Integer} coalesceEventsOptions 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomation6-put_coalesceevents
     */
    put_CoalesceEvents(coalesceEventsOptions) {
        result := ComCall(76, this, "int", coalesceEventsOptions, "HRESULT")
        return result
    }

    /**
     * Registers a method that handles when the active text position changes.
     * @param {IUIAutomationElement} element A pointer to the UI Automation element associated with the event handler.
     * @param {Integer} scope 
     * @param {IUIAutomationCacheRequest} cacheRequest A pointer to a cache request, or NULL if no caching is wanted.
     * @param {IUIAutomationActiveTextPositionChangedEventHandler} handler A pointer to the object that handles the active text position changed event.
     * @returns {HRESULT} If this method succeeds, it returns S_OK. Otherwise, it returns an HRESULT error code.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomation6-addactivetextpositionchangedeventhandler
     */
    AddActiveTextPositionChangedEventHandler(element, scope, cacheRequest, handler) {
        result := ComCall(77, this, "ptr", element, "int", scope, "ptr", cacheRequest, "ptr", handler, "HRESULT")
        return result
    }

    /**
     * Removes an active text position changed event handler.
     * @param {IUIAutomationElement} element A pointer to the UI Automation element associated with the event handler.
     * @param {IUIAutomationActiveTextPositionChangedEventHandler} handler A pointer to the object that handles the active text position changed event.
     * @returns {HRESULT} This method does not return a value.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomation6-removeactivetextpositionchangedeventhandler
     */
    RemoveActiveTextPositionChangedEventHandler(element, handler) {
        result := ComCall(78, this, "ptr", element, "ptr", handler, "HRESULT")
        return result
    }
}
