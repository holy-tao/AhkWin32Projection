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
     * 
     * @returns {IUIAutomationProxyFactory} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationproxyfactoryentry-get_proxyfactory
     */
    get_ProxyFactory() {
        result := ComCall(3, this, "ptr*", &factory := 0, "HRESULT")
        return IUIAutomationProxyFactory(factory)
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationproxyfactoryentry-get_classname
     */
    get_ClassName() {
        className := BSTR()
        result := ComCall(4, this, "ptr", className, "HRESULT")
        return className
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationproxyfactoryentry-get_imagename
     */
    get_ImageName() {
        imageName := BSTR()
        result := ComCall(5, this, "ptr", imageName, "HRESULT")
        return imageName
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationproxyfactoryentry-get_allowsubstringmatch
     */
    get_AllowSubstringMatch() {
        result := ComCall(6, this, "int*", &allowSubstringMatch := 0, "HRESULT")
        return allowSubstringMatch
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationproxyfactoryentry-get_cancheckbaseclass
     */
    get_CanCheckBaseClass() {
        result := ComCall(7, this, "int*", &canCheckBaseClass := 0, "HRESULT")
        return canCheckBaseClass
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationproxyfactoryentry-get_needsadviseevents
     */
    get_NeedsAdviseEvents() {
        result := ComCall(8, this, "int*", &adviseEvents := 0, "HRESULT")
        return adviseEvents
    }

    /**
     * 
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
     * 
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
     * 
     * @param {BOOL} allowSubstringMatch 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationproxyfactoryentry-put_allowsubstringmatch
     */
    put_AllowSubstringMatch(allowSubstringMatch) {
        result := ComCall(11, this, "int", allowSubstringMatch, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} canCheckBaseClass 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationproxyfactoryentry-put_cancheckbaseclass
     */
    put_CanCheckBaseClass(canCheckBaseClass) {
        result := ComCall(12, this, "int", canCheckBaseClass, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} adviseEvents 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationproxyfactoryentry-put_needsadviseevents
     */
    put_NeedsAdviseEvents(adviseEvents) {
        result := ComCall(13, this, "int", adviseEvents, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} eventId 
     * @param {Integer} propertyId 
     * @param {Pointer<SAFEARRAY>} winEvents 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationproxyfactoryentry-setwineventsforautomationevent
     */
    SetWinEventsForAutomationEvent(eventId, propertyId, winEvents) {
        result := ComCall(14, this, "int", eventId, "int", propertyId, "ptr", winEvents, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} eventId 
     * @param {Integer} propertyId 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationproxyfactoryentry-getwineventsforautomationevent
     */
    GetWinEventsForAutomationEvent(eventId, propertyId) {
        result := ComCall(15, this, "int", eventId, "int", propertyId, "ptr*", &winEvents := 0, "HRESULT")
        return winEvents
    }
}
