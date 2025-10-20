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
     * 
     * @param {Integer} scope 
     * @param {Pointer<IUIAutomationCacheRequest>} cacheRequest 
     * @param {Pointer<IUIAutomationActiveTextPositionChangedEventHandler>} handler 
     * @returns {HRESULT} 
     */
    AddActiveTextPositionChangedEventHandler(scope, cacheRequest, handler) {
        result := ComCall(3, this, "int", scope, "ptr", cacheRequest, "ptr", handler, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} eventId 
     * @param {Integer} scope 
     * @param {Pointer<IUIAutomationCacheRequest>} cacheRequest 
     * @param {Pointer<IUIAutomationEventHandler>} handler 
     * @returns {HRESULT} 
     */
    AddAutomationEventHandler(eventId, scope, cacheRequest, handler) {
        result := ComCall(4, this, "int", eventId, "int", scope, "ptr", cacheRequest, "ptr", handler, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} scope 
     * @param {Pointer<Int32>} changeTypes 
     * @param {Integer} changesCount 
     * @param {Pointer<IUIAutomationCacheRequest>} cacheRequest 
     * @param {Pointer<IUIAutomationChangesEventHandler>} handler 
     * @returns {HRESULT} 
     */
    AddChangesEventHandler(scope, changeTypes, changesCount, cacheRequest, handler) {
        result := ComCall(5, this, "int", scope, "int*", changeTypes, "int", changesCount, "ptr", cacheRequest, "ptr", handler, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} scope 
     * @param {Pointer<IUIAutomationCacheRequest>} cacheRequest 
     * @param {Pointer<IUIAutomationNotificationEventHandler>} handler 
     * @returns {HRESULT} 
     */
    AddNotificationEventHandler(scope, cacheRequest, handler) {
        result := ComCall(6, this, "int", scope, "ptr", cacheRequest, "ptr", handler, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} scope 
     * @param {Pointer<IUIAutomationCacheRequest>} cacheRequest 
     * @param {Pointer<IUIAutomationPropertyChangedEventHandler>} handler 
     * @param {Pointer<Int32>} propertyArray 
     * @param {Integer} propertyCount 
     * @returns {HRESULT} 
     */
    AddPropertyChangedEventHandler(scope, cacheRequest, handler, propertyArray, propertyCount) {
        result := ComCall(7, this, "int", scope, "ptr", cacheRequest, "ptr", handler, "int*", propertyArray, "int", propertyCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} scope 
     * @param {Pointer<IUIAutomationCacheRequest>} cacheRequest 
     * @param {Pointer<IUIAutomationStructureChangedEventHandler>} handler 
     * @returns {HRESULT} 
     */
    AddStructureChangedEventHandler(scope, cacheRequest, handler) {
        result := ComCall(8, this, "int", scope, "ptr", cacheRequest, "ptr", handler, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} scope 
     * @param {Integer} textEditChangeType 
     * @param {Pointer<IUIAutomationCacheRequest>} cacheRequest 
     * @param {Pointer<IUIAutomationTextEditTextChangedEventHandler>} handler 
     * @returns {HRESULT} 
     */
    AddTextEditTextChangedEventHandler(scope, textEditChangeType, cacheRequest, handler) {
        result := ComCall(9, this, "int", scope, "int", textEditChangeType, "ptr", cacheRequest, "ptr", handler, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
