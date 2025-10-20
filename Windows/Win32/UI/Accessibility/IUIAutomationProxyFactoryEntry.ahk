#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a proxy factory in the table maintained by Microsoft UI Automation, and exposes properties and methods that can be used by client applications to interact with IUIAutomationProxyFactory objects.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationproxyfactoryentry
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationProxyFactoryEntry extends IUnknown{
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
     * 
     * @param {Pointer<IUIAutomationProxyFactory>} factory 
     * @returns {HRESULT} 
     */
    get_ProxyFactory(factory) {
        result := ComCall(3, this, "ptr", factory, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} className 
     * @returns {HRESULT} 
     */
    get_ClassName(className) {
        result := ComCall(4, this, "ptr", className, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} imageName 
     * @returns {HRESULT} 
     */
    get_ImageName(imageName) {
        result := ComCall(5, this, "ptr", imageName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} allowSubstringMatch 
     * @returns {HRESULT} 
     */
    get_AllowSubstringMatch(allowSubstringMatch) {
        result := ComCall(6, this, "ptr", allowSubstringMatch, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} canCheckBaseClass 
     * @returns {HRESULT} 
     */
    get_CanCheckBaseClass(canCheckBaseClass) {
        result := ComCall(7, this, "ptr", canCheckBaseClass, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} adviseEvents 
     * @returns {HRESULT} 
     */
    get_NeedsAdviseEvents(adviseEvents) {
        result := ComCall(8, this, "ptr", adviseEvents, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} className 
     * @returns {HRESULT} 
     */
    put_ClassName(className) {
        className := className is String ? StrPtr(className) : className

        result := ComCall(9, this, "ptr", className, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} imageName 
     * @returns {HRESULT} 
     */
    put_ImageName(imageName) {
        imageName := imageName is String ? StrPtr(imageName) : imageName

        result := ComCall(10, this, "ptr", imageName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} allowSubstringMatch 
     * @returns {HRESULT} 
     */
    put_AllowSubstringMatch(allowSubstringMatch) {
        result := ComCall(11, this, "int", allowSubstringMatch, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} canCheckBaseClass 
     * @returns {HRESULT} 
     */
    put_CanCheckBaseClass(canCheckBaseClass) {
        result := ComCall(12, this, "int", canCheckBaseClass, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} adviseEvents 
     * @returns {HRESULT} 
     */
    put_NeedsAdviseEvents(adviseEvents) {
        result := ComCall(13, this, "int", adviseEvents, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} eventId 
     * @param {Integer} propertyId 
     * @param {Pointer<SAFEARRAY>} winEvents 
     * @returns {HRESULT} 
     */
    SetWinEventsForAutomationEvent(eventId, propertyId, winEvents) {
        result := ComCall(14, this, "int", eventId, "int", propertyId, "ptr", winEvents, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} eventId 
     * @param {Integer} propertyId 
     * @param {Pointer<SAFEARRAY>} winEvents 
     * @returns {HRESULT} 
     */
    GetWinEventsForAutomationEvent(eventId, propertyId, winEvents) {
        result := ComCall(15, this, "int", eventId, "int", propertyId, "ptr", winEvents, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
