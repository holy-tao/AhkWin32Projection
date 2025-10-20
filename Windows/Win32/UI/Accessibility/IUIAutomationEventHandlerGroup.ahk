#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods for adding one or more events to a collection for bulk registration through the CreateEventHandlerGroup and AddEventHandlerGroup methods defined in IUIAutomation6.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationeventhandlergroup
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationEventHandlerGroup extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAutomationEventHandlerGroup
     * @type {Guid}
     */
    static IID => Guid("{c9ee12f2-c13b-4408-997c-639914377f4e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddActiveTextPositionChangedEventHandler", "AddAutomationEventHandler", "AddChangesEventHandler", "AddNotificationEventHandler", "AddPropertyChangedEventHandler", "AddStructureChangedEventHandler", "AddTextEditTextChangedEventHandler"]

    /**
     * 
     * @param {Integer} scope 
     * @param {IUIAutomationCacheRequest} cacheRequest 
     * @param {IUIAutomationActiveTextPositionChangedEventHandler} handler 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationeventhandlergroup-addactivetextpositionchangedeventhandler
     */
    AddActiveTextPositionChangedEventHandler(scope, cacheRequest, handler) {
        result := ComCall(3, this, "int", scope, "ptr", cacheRequest, "ptr", handler, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} eventId 
     * @param {Integer} scope 
     * @param {IUIAutomationCacheRequest} cacheRequest 
     * @param {IUIAutomationEventHandler} handler 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationeventhandlergroup-addautomationeventhandler
     */
    AddAutomationEventHandler(eventId, scope, cacheRequest, handler) {
        result := ComCall(4, this, "int", eventId, "int", scope, "ptr", cacheRequest, "ptr", handler, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} scope 
     * @param {Pointer<Integer>} changeTypes 
     * @param {Integer} changesCount 
     * @param {IUIAutomationCacheRequest} cacheRequest 
     * @param {IUIAutomationChangesEventHandler} handler 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationeventhandlergroup-addchangeseventhandler
     */
    AddChangesEventHandler(scope, changeTypes, changesCount, cacheRequest, handler) {
        result := ComCall(5, this, "int", scope, "int*", changeTypes, "int", changesCount, "ptr", cacheRequest, "ptr", handler, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} scope 
     * @param {IUIAutomationCacheRequest} cacheRequest 
     * @param {IUIAutomationNotificationEventHandler} handler 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationeventhandlergroup-addnotificationeventhandler
     */
    AddNotificationEventHandler(scope, cacheRequest, handler) {
        result := ComCall(6, this, "int", scope, "ptr", cacheRequest, "ptr", handler, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} scope 
     * @param {IUIAutomationCacheRequest} cacheRequest 
     * @param {IUIAutomationPropertyChangedEventHandler} handler 
     * @param {Pointer<Integer>} propertyArray 
     * @param {Integer} propertyCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationeventhandlergroup-addpropertychangedeventhandler
     */
    AddPropertyChangedEventHandler(scope, cacheRequest, handler, propertyArray, propertyCount) {
        result := ComCall(7, this, "int", scope, "ptr", cacheRequest, "ptr", handler, "int*", propertyArray, "int", propertyCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} scope 
     * @param {IUIAutomationCacheRequest} cacheRequest 
     * @param {IUIAutomationStructureChangedEventHandler} handler 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationeventhandlergroup-addstructurechangedeventhandler
     */
    AddStructureChangedEventHandler(scope, cacheRequest, handler) {
        result := ComCall(8, this, "int", scope, "ptr", cacheRequest, "ptr", handler, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} scope 
     * @param {Integer} textEditChangeType 
     * @param {IUIAutomationCacheRequest} cacheRequest 
     * @param {IUIAutomationTextEditTextChangedEventHandler} handler 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationeventhandlergroup-addtextedittextchangedeventhandler
     */
    AddTextEditTextChangedEventHandler(scope, textEditChangeType, cacheRequest, handler) {
        result := ComCall(9, this, "int", scope, "int", textEditChangeType, "ptr", cacheRequest, "ptr", handler, "HRESULT")
        return result
    }
}
