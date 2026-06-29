#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\UIA_EVENT_ID.ahk" { UIA_EVENT_ID }
#Import ".\IUIAutomationProxyFactory.ahk" { IUIAutomationProxyFactory }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\UIA_PROPERTY_ID.ahk" { UIA_PROPERTY_ID }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * Represents a proxy factory in the table maintained by Microsoft UI Automation, and exposes properties and methods that can be used by client applications to interact with IUIAutomationProxyFactory objects.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nn-uiautomationclient-iuiautomationproxyfactoryentry
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IUIAutomationProxyFactoryEntry extends IUnknown {
    /**
     * The interface identifier for IUIAutomationProxyFactoryEntry
     * @type {Guid}
     */
    static IID := Guid("{d50e472e-b64b-490c-bca1-d30696f9f289}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAutomationProxyFactoryEntry interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_ProxyFactory               : IntPtr
        get_ClassName                  : IntPtr
        get_ImageName                  : IntPtr
        get_AllowSubstringMatch        : IntPtr
        get_CanCheckBaseClass          : IntPtr
        get_NeedsAdviseEvents          : IntPtr
        put_ClassName                  : IntPtr
        put_ImageName                  : IntPtr
        put_AllowSubstringMatch        : IntPtr
        put_CanCheckBaseClass          : IntPtr
        put_NeedsAdviseEvents          : IntPtr
        SetWinEventsForAutomationEvent : IntPtr
        GetWinEventsForAutomationEvent : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAutomationProxyFactoryEntry.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IUIAutomationProxyFactory} 
     */
    ProxyFactory {
        get => this.get_ProxyFactory()
    }

    /**
     * @type {BSTR} 
     */
    ClassName {
        get => this.get_ClassName()
        set => this.put_ClassName(value)
    }

    /**
     * @type {BSTR} 
     */
    ImageName {
        get => this.get_ImageName()
        set => this.put_ImageName(value)
    }

    /**
     * @type {BOOL} 
     */
    AllowSubstringMatch {
        get => this.get_AllowSubstringMatch()
        set => this.put_AllowSubstringMatch(value)
    }

    /**
     * @type {BOOL} 
     */
    CanCheckBaseClass {
        get => this.get_CanCheckBaseClass()
        set => this.put_CanCheckBaseClass(value)
    }

    /**
     * @type {BOOL} 
     */
    NeedsAdviseEvents {
        get => this.get_NeedsAdviseEvents()
        set => this.put_NeedsAdviseEvents(value)
    }

    /**
     * Retrieves the proxy factory associated with this entry.
     * @returns {IUIAutomationProxyFactory} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationproxyfactoryentry-get_proxyfactory
     */
    get_ProxyFactory() {
        result := ComCall(3, this, "ptr*", &factory := 0, "HRESULT")
        return IUIAutomationProxyFactory(factory)
    }

    /**
     * Sets or retrieves the name of the window class served by the proxy factory. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationproxyfactoryentry-get_classname
     */
    get_ClassName() {
        className := BSTR.Owned()
        result := ComCall(4, this, BSTR.Ptr, className, "HRESULT")
        return className
    }

    /**
     * Sets or retrieves the name of the image of the proxy factory. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationproxyfactoryentry-get_imagename
     */
    get_ImageName() {
        imageName := BSTR.Owned()
        result := ComCall(5, this, BSTR.Ptr, imageName, "HRESULT")
        return imageName
    }

    /**
     * Sets or retrieves a value that specifies whether the proxy allows substring matching. (Get)
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationproxyfactoryentry-get_allowsubstringmatch
     */
    get_AllowSubstringMatch() {
        result := ComCall(6, this, BOOL.Ptr, &allowSubstringMatch := 0, "HRESULT")
        return allowSubstringMatch
    }

    /**
     * Sets or retrieves a value that specifies whether the base class can be checked when searching for a proxy factory. (Get)
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationproxyfactoryentry-get_cancheckbaseclass
     */
    get_CanCheckBaseClass() {
        result := ComCall(7, this, BOOL.Ptr, &canCheckBaseClass := 0, "HRESULT")
        return canCheckBaseClass
    }

    /**
     * Sets or retrieves a value that specifies whether the proxy must be notified when an application has registered for events. (Get)
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationproxyfactoryentry-get_needsadviseevents
     */
    get_NeedsAdviseEvents() {
        result := ComCall(8, this, BOOL.Ptr, &adviseEvents := 0, "HRESULT")
        return adviseEvents
    }

    /**
     * Sets or retrieves the name of the window class served by the proxy factory. (Put)
     * @param {PWSTR} className 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationproxyfactoryentry-put_classname
     */
    put_ClassName(className) {
        className := className is String ? StrPtr(className) : className

        result := ComCall(9, this, "ptr", className, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves the name of the image of the proxy factory. (Put)
     * @param {PWSTR} imageName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationproxyfactoryentry-put_imagename
     */
    put_ImageName(imageName) {
        imageName := imageName is String ? StrPtr(imageName) : imageName

        result := ComCall(10, this, "ptr", imageName, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves a value that specifies whether the proxy allows substring matching. (Put)
     * @param {BOOL} allowSubstringMatch 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationproxyfactoryentry-put_allowsubstringmatch
     */
    put_AllowSubstringMatch(allowSubstringMatch) {
        result := ComCall(11, this, BOOL, allowSubstringMatch, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves a value that specifies whether the base class can be checked when searching for a proxy factory. (Put)
     * @param {BOOL} canCheckBaseClass 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationproxyfactoryentry-put_cancheckbaseclass
     */
    put_CanCheckBaseClass(canCheckBaseClass) {
        result := ComCall(12, this, BOOL, canCheckBaseClass, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves a value that specifies whether the proxy must be notified when an application has registered for events. (Put)
     * @param {BOOL} adviseEvents 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationproxyfactoryentry-put_needsadviseevents
     */
    put_NeedsAdviseEvents(adviseEvents) {
        result := ComCall(13, this, BOOL, adviseEvents, "HRESULT")
        return result
    }

    /**
     * Maps Microsoft UI Automation events to WinEvents.
     * @remarks
     * When a client application subscribes to a UI Automation event, the UI Automation core also listens for WinEvents that map to this event. For example, suppose that <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-event-ids">UIA_Invoke_InvokedEventId</a> is mapped to <a href="https://docs.microsoft.com/windows/desktop/WinAuto/event-constants">EVENT_OBJECT_INVOKED</a>. When <b>EVENT_OBJECT_INVOKED</b> is raised, the client instantiates the proxy and calls <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nf-uiautomationcore-iproxyproviderwineventhandler-respondtowinevent">RespondToWinEvent</a> on that proxy. In the implementation of <b>RespondToWinEvent</b>, the proxy calls <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nf-uiautomationcore-iproxyproviderwineventsink-addautomationevent">AddAutomationEvent</a>. The core then raises the corresponding UI Automation event.
     * @param {UIA_EVENT_ID} eventId Type: <b>EVENTID</b>
     * 
     * The event identifier. For a list of event identifiers, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-event-ids">Event Identifiers</a>.
     * @param {UIA_PROPERTY_ID} propertyId Type: <b>PROPERTYID</b>
     * 
     * The property identifier. For a list of property IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-entry-propids">Property Identifiers</a>.
     * @param {Pointer<SAFEARRAY>} winEvents Type: <b><a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a>*</b>
     * 
     * The list of WinEvents that map to this event.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationproxyfactoryentry-setwineventsforautomationevent
     */
    SetWinEventsForAutomationEvent(eventId, propertyId, winEvents) {
        result := ComCall(14, this, UIA_EVENT_ID, eventId, UIA_PROPERTY_ID, propertyId, SAFEARRAY.Ptr, winEvents, "HRESULT")
        return result
    }

    /**
     * Retrieves the list of WinEvents that are mapped to a specific Microsoft UI Automation event. If an element represented by this proxy raises one the listed WinEvents, the proxy handles it.
     * @param {UIA_EVENT_ID} eventId Type: <b>EVENTID</b>
     * 
     * The event identifier. For a list of event identifiers, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-event-ids">Event Identifiers</a>.
     * @param {UIA_PROPERTY_ID} propertyId Type: <b>PROPERTYID</b>
     * 
     * The property identifier. For a list of property IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-entry-propids">Property Identifiers</a>.
     * @returns {Pointer<SAFEARRAY>} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a>**</b>
     * 
     * Receives a pointer to the list of WinEvents that map to this event.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationproxyfactoryentry-getwineventsforautomationevent
     */
    GetWinEventsForAutomationEvent(eventId, propertyId) {
        result := ComCall(15, this, UIA_EVENT_ID, eventId, UIA_PROPERTY_ID, propertyId, "ptr*", &winEvents := 0, "HRESULT")
        return winEvents
    }

    Query(iid) {
        if (IUIAutomationProxyFactoryEntry.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_ProxyFactory := CallbackCreate(GetMethod(implObj, "get_ProxyFactory"), flags, 2)
        this.vtbl.get_ClassName := CallbackCreate(GetMethod(implObj, "get_ClassName"), flags, 2)
        this.vtbl.get_ImageName := CallbackCreate(GetMethod(implObj, "get_ImageName"), flags, 2)
        this.vtbl.get_AllowSubstringMatch := CallbackCreate(GetMethod(implObj, "get_AllowSubstringMatch"), flags, 2)
        this.vtbl.get_CanCheckBaseClass := CallbackCreate(GetMethod(implObj, "get_CanCheckBaseClass"), flags, 2)
        this.vtbl.get_NeedsAdviseEvents := CallbackCreate(GetMethod(implObj, "get_NeedsAdviseEvents"), flags, 2)
        this.vtbl.put_ClassName := CallbackCreate(GetMethod(implObj, "put_ClassName"), flags, 2)
        this.vtbl.put_ImageName := CallbackCreate(GetMethod(implObj, "put_ImageName"), flags, 2)
        this.vtbl.put_AllowSubstringMatch := CallbackCreate(GetMethod(implObj, "put_AllowSubstringMatch"), flags, 2)
        this.vtbl.put_CanCheckBaseClass := CallbackCreate(GetMethod(implObj, "put_CanCheckBaseClass"), flags, 2)
        this.vtbl.put_NeedsAdviseEvents := CallbackCreate(GetMethod(implObj, "put_NeedsAdviseEvents"), flags, 2)
        this.vtbl.SetWinEventsForAutomationEvent := CallbackCreate(GetMethod(implObj, "SetWinEventsForAutomationEvent"), flags, 4)
        this.vtbl.GetWinEventsForAutomationEvent := CallbackCreate(GetMethod(implObj, "GetWinEventsForAutomationEvent"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_ProxyFactory)
        CallbackFree(this.vtbl.get_ClassName)
        CallbackFree(this.vtbl.get_ImageName)
        CallbackFree(this.vtbl.get_AllowSubstringMatch)
        CallbackFree(this.vtbl.get_CanCheckBaseClass)
        CallbackFree(this.vtbl.get_NeedsAdviseEvents)
        CallbackFree(this.vtbl.put_ClassName)
        CallbackFree(this.vtbl.put_ImageName)
        CallbackFree(this.vtbl.put_AllowSubstringMatch)
        CallbackFree(this.vtbl.put_CanCheckBaseClass)
        CallbackFree(this.vtbl.put_NeedsAdviseEvents)
        CallbackFree(this.vtbl.SetWinEventsForAutomationEvent)
        CallbackFree(this.vtbl.GetWinEventsForAutomationEvent)
    }
}
