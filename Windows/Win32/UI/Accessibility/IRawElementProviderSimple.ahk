#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\IRawElementProviderSimple.ahk

/**
 * Defines methods and properties that expose simple UI elements.
 * @remarks
 * 
 * This interface can be implemented on:
 * 			
 * 
 * <ul>
 * <li>UI Automation provider for simple UI elements, such as buttons.</li>
 * <li>Providers that add or override properties or control patterns on a UI element that already has a provider.</li>
 * </ul>
 * Providers for complex elements must also implement <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementproviderfragment">IRawElementProviderFragment</a> and, if they 
 * 			are root elements, <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementproviderfragmentroot">IRawElementProviderFragmentRoot</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nn-uiautomationcore-irawelementprovidersimple
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IRawElementProviderSimple extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRawElementProviderSimple
     * @type {Guid}
     */
    static IID => Guid("{d6dd68d1-86fd-4332-8666-9abedea2d24c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ProviderOptions", "GetPatternProvider", "GetPropertyValue", "get_HostRawElementProvider"]

    /**
     * @type {Integer} 
     */
    ProviderOptions {
        get => this.get_ProviderOptions()
    }

    /**
     * @type {IRawElementProviderSimple} 
     */
    HostRawElementProvider {
        get => this.get_HostRawElementProvider()
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-irawelementprovidersimple-get_provideroptions
     */
    get_ProviderOptions() {
        result := ComCall(3, this, "int*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * 
     * @param {Integer} patternId 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-irawelementprovidersimple-getpatternprovider
     */
    GetPatternProvider(patternId) {
        result := ComCall(4, this, "int", patternId, "ptr*", &pRetVal := 0, "HRESULT")
        return IUnknown(pRetVal)
    }

    /**
     * 
     * @param {Integer} propertyId 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-irawelementprovidersimple-getpropertyvalue
     */
    GetPropertyValue(propertyId) {
        pRetVal := VARIANT()
        result := ComCall(5, this, "int", propertyId, "ptr", pRetVal, "HRESULT")
        return pRetVal
    }

    /**
     * 
     * @returns {IRawElementProviderSimple} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-irawelementprovidersimple-get_hostrawelementprovider
     */
    get_HostRawElementProvider() {
        result := ComCall(6, this, "ptr*", &pRetVal := 0, "HRESULT")
        return IRawElementProviderSimple(pRetVal)
    }
}
