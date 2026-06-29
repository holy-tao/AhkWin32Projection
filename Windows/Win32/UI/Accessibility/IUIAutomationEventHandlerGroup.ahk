#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IUIAutomationCacheRequest.ahk" { IUIAutomationCacheRequest }
#Import ".\IUIAutomationNotificationEventHandler.ahk" { IUIAutomationNotificationEventHandler }
#Import ".\IUIAutomationEventHandler.ahk" { IUIAutomationEventHandler }
#Import ".\IUIAutomationTextEditTextChangedEventHandler.ahk" { IUIAutomationTextEditTextChangedEventHandler }
#Import ".\UIA_EVENT_ID.ahk" { UIA_EVENT_ID }
#Import ".\IUIAutomationPropertyChangedEventHandler.ahk" { IUIAutomationPropertyChangedEventHandler }
#Import ".\IUIAutomationChangesEventHandler.ahk" { IUIAutomationChangesEventHandler }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IUIAutomationActiveTextPositionChangedEventHandler.ahk" { IUIAutomationActiveTextPositionChangedEventHandler }
#Import ".\UIA_PROPERTY_ID.ahk" { UIA_PROPERTY_ID }
#Import ".\TreeScope.ahk" { TreeScope }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\TextEditChangeType.ahk" { TextEditChangeType }
#Import ".\IUIAutomationStructureChangedEventHandler.ahk" { IUIAutomationStructureChangedEventHandler }

/**
 * Exposes methods for adding one or more events to a collection for bulk registration through the CreateEventHandlerGroup and AddEventHandlerGroup methods defined in IUIAutomation6.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nn-uiautomationclient-iuiautomationeventhandlergroup
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IUIAutomationEventHandlerGroup extends IUnknown {
    /**
     * The interface identifier for IUIAutomationEventHandlerGroup
     * @type {Guid}
     */
    static IID := Guid("{c9ee12f2-c13b-4408-997c-639914377f4e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAutomationEventHandlerGroup interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AddActiveTextPositionChangedEventHandler : IntPtr
        AddAutomationEventHandler                : IntPtr
        AddChangesEventHandler                   : IntPtr
        AddNotificationEventHandler              : IntPtr
        AddPropertyChangedEventHandler           : IntPtr
        AddStructureChangedEventHandler          : IntPtr
        AddTextEditTextChangedEventHandler       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAutomationEventHandlerGroup.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @param {TreeScope} scope 
     * @param {IUIAutomationCacheRequest} cacheRequest A pointer to a cache request, or <b>NULL</b> if no caching is wanted.
     * @param {IUIAutomationActiveTextPositionChangedEventHandler} handler A pointer to the object that handles the active text position changed event.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationeventhandlergroup-addactivetextpositionchangedeventhandler
     */
    AddActiveTextPositionChangedEventHandler(scope, cacheRequest, handler) {
        result := ComCall(3, this, TreeScope, scope, "ptr", cacheRequest, "ptr", handler, "HRESULT")
        return result
    }

    /**
     * Registers a method that handles Microsoft UI Automation events.
     * @param {UIA_EVENT_ID} eventId The identifier of the event that the method handles. For a list of event IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-event-ids">Event Identifiers</a>.
     * @param {TreeScope} scope 
     * @param {IUIAutomationCacheRequest} cacheRequest A pointer to a cache request, or <b>NULL</b> if no caching is wanted.
     * @param {IUIAutomationEventHandler} handler A pointer to the object that handles the event.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationeventhandlergroup-addautomationeventhandler
     */
    AddAutomationEventHandler(eventId, scope, cacheRequest, handler) {
        result := ComCall(4, this, UIA_EVENT_ID, eventId, TreeScope, scope, "ptr", cacheRequest, "ptr", handler, "HRESULT")
        return result
    }

    /**
     * Registers a method that handles change events.
     * @remarks
     * Before implementing an event handler, you should be familiar with the threading issues described in <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-threading">Understanding Threading Issues</a>.
     * @param {TreeScope} scope 
     * @param {Pointer<Integer>} changeTypes A pointer to a list of integers that indicate the change types the event represents.
     * @param {Integer} changesCount The number of changes that occurred in this event.
     * @param {IUIAutomationCacheRequest} cacheRequest A pointer to a cache request, or <b>NULL</b> if no caching is wanted.
     * @param {IUIAutomationChangesEventHandler} handler A pointer to the object that handles the changes event.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationeventhandlergroup-addchangeseventhandler
     */
    AddChangesEventHandler(scope, changeTypes, changesCount, cacheRequest, handler) {
        changeTypesMarshal := changeTypes is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, TreeScope, scope, changeTypesMarshal, changeTypes, "int", changesCount, "ptr", cacheRequest, "ptr", handler, "HRESULT")
        return result
    }

    /**
     * Registers a method that handles notification events.
     * @remarks
     * Before implementing an event handler, you should be familiar with the threading issues described in <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-threading">Understanding Threading Issues</a>.
     * @param {TreeScope} scope 
     * @param {IUIAutomationCacheRequest} cacheRequest A pointer to a cache request, or <b>NULL</b> if no caching is wanted.
     * @param {IUIAutomationNotificationEventHandler} handler A pointer to the object that handles the notification event.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationeventhandlergroup-addnotificationeventhandler
     */
    AddNotificationEventHandler(scope, cacheRequest, handler) {
        result := ComCall(6, this, TreeScope, scope, "ptr", cacheRequest, "ptr", handler, "HRESULT")
        return result
    }

    /**
     * Registers a method that handles a property-changed event.
     * @remarks
     * Before implementing an event handler, you should be familiar with the threading issues described in <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-threading">Understanding Threading Issues</a>.
     * @param {TreeScope} scope 
     * @param {IUIAutomationCacheRequest} cacheRequest A pointer to a cache request, or <b>NULL</b> if no caching is wanted.
     * @param {IUIAutomationPropertyChangedEventHandler} handler A pointer to the object that handles the event.
     * @param {Pointer<UIA_PROPERTY_ID>} propertyArray A pointer to the UI Automation properties of interest. For a list of property IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-entry-propids">Property Identifiers</a>.
     * @param {Integer} propertyCount The number of properties being monitored.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationeventhandlergroup-addpropertychangedeventhandler
     */
    AddPropertyChangedEventHandler(scope, cacheRequest, handler, propertyArray, propertyCount) {
        propertyArrayMarshal := propertyArray is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, TreeScope, scope, "ptr", cacheRequest, "ptr", handler, propertyArrayMarshal, propertyArray, "int", propertyCount, "HRESULT")
        return result
    }

    /**
     * Registers a method that handles structure-changed events.
     * @remarks
     * Before implementing an event handler, you should be familiar with the threading issues described in <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-threading">Understanding Threading Issues</a>.
     * @param {TreeScope} scope 
     * @param {IUIAutomationCacheRequest} cacheRequest A pointer to a cache request, or <b>NULL</b> if no caching is wanted.
     * @param {IUIAutomationStructureChangedEventHandler} handler A pointer to the object that handles the structure-changed event.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationeventhandlergroup-addstructurechangedeventhandler
     */
    AddStructureChangedEventHandler(scope, cacheRequest, handler) {
        result := ComCall(8, this, TreeScope, scope, "ptr", cacheRequest, "ptr", handler, "HRESULT")
        return result
    }

    /**
     * Registers a method that handles programmatic text-edit events.
     * @remarks
     * Before implementing an event handler, you should be familiar with the threading issues described in <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-threading">Understanding Threading Issues</a>.
     * @param {TreeScope} scope 
     * @param {TextEditChangeType} _textEditChangeType 
     * @param {IUIAutomationCacheRequest} cacheRequest A pointer to a cache request, or <b>NULL</b> if no caching is wanted.
     * @param {IUIAutomationTextEditTextChangedEventHandler} handler A pointer to the object that handles the programmatic text-edit event.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationeventhandlergroup-addtextedittextchangedeventhandler
     */
    AddTextEditTextChangedEventHandler(scope, _textEditChangeType, cacheRequest, handler) {
        result := ComCall(9, this, TreeScope, scope, TextEditChangeType, _textEditChangeType, "ptr", cacheRequest, "ptr", handler, "HRESULT")
        return result
    }

    Query(iid) {
        if (IUIAutomationEventHandlerGroup.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddActiveTextPositionChangedEventHandler := CallbackCreate(GetMethod(implObj, "AddActiveTextPositionChangedEventHandler"), flags, 4)
        this.vtbl.AddAutomationEventHandler := CallbackCreate(GetMethod(implObj, "AddAutomationEventHandler"), flags, 5)
        this.vtbl.AddChangesEventHandler := CallbackCreate(GetMethod(implObj, "AddChangesEventHandler"), flags, 6)
        this.vtbl.AddNotificationEventHandler := CallbackCreate(GetMethod(implObj, "AddNotificationEventHandler"), flags, 4)
        this.vtbl.AddPropertyChangedEventHandler := CallbackCreate(GetMethod(implObj, "AddPropertyChangedEventHandler"), flags, 6)
        this.vtbl.AddStructureChangedEventHandler := CallbackCreate(GetMethod(implObj, "AddStructureChangedEventHandler"), flags, 4)
        this.vtbl.AddTextEditTextChangedEventHandler := CallbackCreate(GetMethod(implObj, "AddTextEditTextChangedEventHandler"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddActiveTextPositionChangedEventHandler)
        CallbackFree(this.vtbl.AddAutomationEventHandler)
        CallbackFree(this.vtbl.AddChangesEventHandler)
        CallbackFree(this.vtbl.AddNotificationEventHandler)
        CallbackFree(this.vtbl.AddPropertyChangedEventHandler)
        CallbackFree(this.vtbl.AddStructureChangedEventHandler)
        CallbackFree(this.vtbl.AddTextEditTextChangedEventHandler)
    }
}
