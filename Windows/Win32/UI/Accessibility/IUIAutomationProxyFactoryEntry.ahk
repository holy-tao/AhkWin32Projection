#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUIAutomationProxyFactory.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a proxy factory in the table maintained by Microsoft UI Automation, and exposes properties and methods that can be used by client applications to interact with IUIAutomationProxyFactory objects.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationproxyfactoryentry
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationProxyFactoryEntry extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAutomationProxyFactoryEntry
     * @type {Guid}
     */
    static IID => Guid("{d50e472e-b64b-490c-bca1-d30696f9f289}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ProxyFactory", "get_ClassName", "get_ImageName", "get_AllowSubstringMatch", "get_CanCheckBaseClass", "get_NeedsAdviseEvents", "put_ClassName", "put_ImageName", "put_AllowSubstringMatch", "put_CanCheckBaseClass", "put_NeedsAdviseEvents", "SetWinEventsForAutomationEvent", "GetWinEventsForAutomationEvent"]

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
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationproxyfactoryentry-get_proxyfactory
     */
    get_ProxyFactory() {
        result := ComCall(3, this, "ptr*", &factory := 0, "HRESULT")
        return IUIAutomationProxyFactory(factory)
    }

    /**
     * Sets or retrieves the name of the window class served by the proxy factory.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationproxyfactoryentry-get_classname
     */
    get_ClassName() {
        className := BSTR()
        result := ComCall(4, this, "ptr", className, "HRESULT")
        return className
    }

    /**
     * Sets or retrieves the name of the image of the proxy factory.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationproxyfactoryentry-get_imagename
     */
    get_ImageName() {
        imageName := BSTR()
        result := ComCall(5, this, "ptr", imageName, "HRESULT")
        return imageName
    }

    /**
     * Sets or retrieves a value that specifies whether the proxy allows substring matching.
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationproxyfactoryentry-get_allowsubstringmatch
     */
    get_AllowSubstringMatch() {
        result := ComCall(6, this, "int*", &allowSubstringMatch := 0, "HRESULT")
        return allowSubstringMatch
    }

    /**
     * Sets or retrieves a value that specifies whether the base class can be checked when searching for a proxy factory.
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationproxyfactoryentry-get_cancheckbaseclass
     */
    get_CanCheckBaseClass() {
        result := ComCall(7, this, "int*", &canCheckBaseClass := 0, "HRESULT")
        return canCheckBaseClass
    }

    /**
     * Sets or retrieves a value that specifies whether the proxy must be notified when an application has registered for events.
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationproxyfactoryentry-get_needsadviseevents
     */
    get_NeedsAdviseEvents() {
        result := ComCall(8, this, "int*", &adviseEvents := 0, "HRESULT")
        return adviseEvents
    }

    /**
     * Sets or retrieves the name of the window class served by the proxy factory.
     * @param {PWSTR} className 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationproxyfactoryentry-put_classname
     */
    put_ClassName(className) {
        className := className is String ? StrPtr(className) : className

        result := ComCall(9, this, "ptr", className, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves the name of the image of the proxy factory.
     * @param {PWSTR} imageName 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationproxyfactoryentry-put_imagename
     */
    put_ImageName(imageName) {
        imageName := imageName is String ? StrPtr(imageName) : imageName

        result := ComCall(10, this, "ptr", imageName, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves a value that specifies whether the proxy allows substring matching.
     * @param {BOOL} allowSubstringMatch 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationproxyfactoryentry-put_allowsubstringmatch
     */
    put_AllowSubstringMatch(allowSubstringMatch) {
        result := ComCall(11, this, "int", allowSubstringMatch, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves a value that specifies whether the base class can be checked when searching for a proxy factory.
     * @param {BOOL} canCheckBaseClass 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationproxyfactoryentry-put_cancheckbaseclass
     */
    put_CanCheckBaseClass(canCheckBaseClass) {
        result := ComCall(12, this, "int", canCheckBaseClass, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves a value that specifies whether the proxy must be notified when an application has registered for events.
     * @param {BOOL} adviseEvents 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationproxyfactoryentry-put_needsadviseevents
     */
    put_NeedsAdviseEvents(adviseEvents) {
        result := ComCall(13, this, "int", adviseEvents, "HRESULT")
        return result
    }

    /**
     * Maps Microsoft UI Automation events to WinEvents.
     * @param {Integer} eventId Type: <b>EVENTID</b>
     * 
     * The event identifier. For a list of event identifiers, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-event-ids">Event Identifiers</a>.
     * @param {Integer} propertyId Type: <b>PROPERTYID</b>
     * 
     * The property identifier. For a list of property IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-entry-propids">Property Identifiers</a>.
     * @param {Pointer<SAFEARRAY>} winEvents Type: <b><a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a>*</b>
     * 
     * The list of WinEvents that map to this event.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationproxyfactoryentry-setwineventsforautomationevent
     */
    SetWinEventsForAutomationEvent(eventId, propertyId, winEvents) {
        result := ComCall(14, this, "int", eventId, "int", propertyId, "ptr", winEvents, "HRESULT")
        return result
    }

    /**
     * Retrieves the list of WinEvents that are mapped to a specific Microsoft UI Automation event. If an element represented by this proxy raises one the listed WinEvents, the proxy handles it.
     * @param {Integer} eventId Type: <b>EVENTID</b>
     * 
     * The event identifier. For a list of event identifiers, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-event-ids">Event Identifiers</a>.
     * @param {Integer} propertyId Type: <b>PROPERTYID</b>
     * 
     * The property identifier. For a list of property IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-entry-propids">Property Identifiers</a>.
     * @returns {Pointer<SAFEARRAY>} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a>**</b>
     * 
     * Receives a pointer to the list of WinEvents that map to this event.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationproxyfactoryentry-getwineventsforautomationevent
     */
    GetWinEventsForAutomationEvent(eventId, propertyId) {
        result := ComCall(15, this, "int", eventId, "int", propertyId, "ptr*", &winEvents := 0, "HRESULT")
        return winEvents
    }
}
