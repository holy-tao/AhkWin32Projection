#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods for adding one or more events to a collection for bulk registration through the CreateEventHandlerGroup and AddEventHandlerGroup methods defined in IUIAutomation6.
 * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationclient/nn-uiautomationclient-iuiautomationeventhandlergroup
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
     * Registers a method (in an event handler group) that handles when the active text position changes.
     * @remarks
     * Before implementing an event handler, you should be familiar with the threading issues described in <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-threading">Understanding Threading Issues</a>.
     * 
     * Active text position is indicated by a navigation event within or between read-only text elements (such as web browsers, Portable Document Format (PDF) documents, or <a href="https://en.wikipedia.org/wiki/EPUB">EPUB</a> documents) using  bookmarks (or fragment identifiers to refer to a location within a resource). Examples include:
     * 
     * <ul>
     * <li>Navigating to a bookmark within the same web page</li>
     * <li>Navigating to a bookmark on a different web page </li>
     * <li>Activating a link to a different location within the same PDF</li>
     * <li>Activating a link to a different location within the same <a href="https://en.wikipedia.org/wiki/EPUB">EPUB</a></li>
     * </ul>
     * Use this event handler to sync the visual location of the bookmark/target with the focus location in a read-only text element, which can diverge when using bookmarks or fragment identifiers.
     * 
     *  For example, when a same page anchor (<c>&lt;a href=”#C4”&gt;Jump to Chapter 4&lt;/a&gt; ... &lt;h1&gt;&lt;a name="C4"&gt;Chapter 4&lt;/a&gt;&lt;/h1&gt;</c>) 
     * is invoked, the visual location is updated, but the UI Automation client remains at the original location. This results in actions such as text reading or move next item commands starting from the original location, not the new location. 
     * 
     * Similarly, activating a new page URI (with a fragment identifier: (<c>&lt;a href=”www.blah.com#C4”&gt;Jump to Chapter 4&lt;/a&gt;</c>)) loads the new page and jumps to the specified bookmark, but leaves the UI Automation clients   at the top of the page.
     * 
     * For editable text elements, such as <a href="https://docs.microsoft.com/windows/desktop/controls/edit-controls">Edit</a> and <a href="https://docs.microsoft.com/windows/desktop/controls/rich-edit-controls">Rich Edit</a> controls,  you can listen for a SelectionChanged event.
     * @param {Integer} scope 
     * @param {IUIAutomationCacheRequest} cacheRequest A pointer to a cache request, or <b>NULL</b> if no caching is wanted.
     * @param {IUIAutomationActiveTextPositionChangedEventHandler} handler A pointer to the object that handles the active text position changed event.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationclient/nf-uiautomationclient-iuiautomationeventhandlergroup-addactivetextpositionchangedeventhandler
     */
    AddActiveTextPositionChangedEventHandler(scope, cacheRequest, handler) {
        result := ComCall(3, this, "int", scope, "ptr", cacheRequest, "ptr", handler, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Registers a method that handles Microsoft UI Automation events.
     * @param {Integer} eventId The identifier of the event that the method handles. For a list of event IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-event-ids">Event Identifiers</a>.
     * @param {Integer} scope 
     * @param {IUIAutomationCacheRequest} cacheRequest A pointer to a cache request, or <b>NULL</b> if no caching is wanted.
     * @param {IUIAutomationEventHandler} handler A pointer to the object that handles the event.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationclient/nf-uiautomationclient-iuiautomationeventhandlergroup-addautomationeventhandler
     */
    AddAutomationEventHandler(eventId, scope, cacheRequest, handler) {
        result := ComCall(4, this, "int", eventId, "int", scope, "ptr", cacheRequest, "ptr", handler, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Registers a method that handles change events.
     * @remarks
     * Before implementing an event handler, you should be familiar with the threading issues described in <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-threading">Understanding Threading Issues</a>.
     * @param {Integer} scope 
     * @param {Pointer<Integer>} changeTypes A pointer to a list of integers that indicate the change types the event represents.
     * @param {Integer} changesCount The number of changes that occurred in this event.
     * @param {IUIAutomationCacheRequest} cacheRequest A pointer to a cache request, or <b>NULL</b> if no caching is wanted.
     * @param {IUIAutomationChangesEventHandler} handler A pointer to the object that handles the changes event.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationclient/nf-uiautomationclient-iuiautomationeventhandlergroup-addchangeseventhandler
     */
    AddChangesEventHandler(scope, changeTypes, changesCount, cacheRequest, handler) {
        changeTypesMarshal := changeTypes is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, "int", scope, changeTypesMarshal, changeTypes, "int", changesCount, "ptr", cacheRequest, "ptr", handler, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Registers a method that handles notification events.
     * @remarks
     * Before implementing an event handler, you should be familiar with the threading issues described in <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-threading">Understanding Threading Issues</a>.
     * @param {Integer} scope 
     * @param {IUIAutomationCacheRequest} cacheRequest A pointer to a cache request, or <b>NULL</b> if no caching is wanted.
     * @param {IUIAutomationNotificationEventHandler} handler A pointer to the object that handles the notification event.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationclient/nf-uiautomationclient-iuiautomationeventhandlergroup-addnotificationeventhandler
     */
    AddNotificationEventHandler(scope, cacheRequest, handler) {
        result := ComCall(6, this, "int", scope, "ptr", cacheRequest, "ptr", handler, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Registers a method that handles a property-changed event.
     * @remarks
     * Before implementing an event handler, you should be familiar with the threading issues described in <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-threading">Understanding Threading Issues</a>.
     * @param {Integer} scope 
     * @param {IUIAutomationCacheRequest} cacheRequest A pointer to a cache request, or <b>NULL</b> if no caching is wanted.
     * @param {IUIAutomationPropertyChangedEventHandler} handler A pointer to the object that handles the event.
     * @param {Pointer<Integer>} propertyArray A pointer to the UI Automation properties of interest. For a list of property IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-entry-propids">Property Identifiers</a>.
     * @param {Integer} propertyCount The number of properties being monitored.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationclient/nf-uiautomationclient-iuiautomationeventhandlergroup-addpropertychangedeventhandler
     */
    AddPropertyChangedEventHandler(scope, cacheRequest, handler, propertyArray, propertyCount) {
        propertyArrayMarshal := propertyArray is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, "int", scope, "ptr", cacheRequest, "ptr", handler, propertyArrayMarshal, propertyArray, "int", propertyCount, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Registers a method that handles structure-changed events.
     * @remarks
     * Before implementing an event handler, you should be familiar with the threading issues described in <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-threading">Understanding Threading Issues</a>.
     * @param {Integer} scope 
     * @param {IUIAutomationCacheRequest} cacheRequest A pointer to a cache request, or <b>NULL</b> if no caching is wanted.
     * @param {IUIAutomationStructureChangedEventHandler} handler A pointer to the object that handles the structure-changed event.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationclient/nf-uiautomationclient-iuiautomationeventhandlergroup-addstructurechangedeventhandler
     */
    AddStructureChangedEventHandler(scope, cacheRequest, handler) {
        result := ComCall(8, this, "int", scope, "ptr", cacheRequest, "ptr", handler, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Registers a method that handles programmatic text-edit events.
     * @remarks
     * Before implementing an event handler, you should be familiar with the threading issues described in <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-threading">Understanding Threading Issues</a>.
     * @param {Integer} scope 
     * @param {Integer} textEditChangeType_ 
     * @param {IUIAutomationCacheRequest} cacheRequest A pointer to a cache request, or <b>NULL</b> if no caching is wanted.
     * @param {IUIAutomationTextEditTextChangedEventHandler} handler A pointer to the object that handles the programmatic text-edit event.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationclient/nf-uiautomationclient-iuiautomationeventhandlergroup-addtextedittextchangedeventhandler
     */
    AddTextEditTextChangedEventHandler(scope, textEditChangeType_, cacheRequest, handler) {
        result := ComCall(9, this, "int", scope, "int", textEditChangeType_, "ptr", cacheRequest, "ptr", handler, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
