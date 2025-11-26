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
     * Specifies the type of Microsoft UI Automation provider; for example, whether it is a client-side (proxy) or server-side provider.
     * @remarks
     * 
     * The method must return either <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ne-uiautomationcore-provideroptions">ProviderOptions_ServerSideProvider</a> or <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ne-uiautomationcore-provideroptions">ProviderOptions_ClientSideProvider</a>.
     * 
     * UI Automation handles the various types of providers differently. 
     * 			For example, events from a server-side provider are broadcast to all listening clients, 
     * 			but events from client-side (proxy) providers remain in the client.
     * 
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-irawelementprovidersimple-get_provideroptions
     */
    get_ProviderOptions() {
        result := ComCall(3, this, "int*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Retrieves a pointer to an object that provides support for a control pattern on a Microsoft UI Automation element.
     * @param {Integer} patternId Type: <b>PATTERNID</b>
     * 
     * The identifier of the control pattern. For a list of control pattern IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-controlpattern-ids">Control Pattern Identifiers</a>.
     * @returns {IUnknown} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>**</b>
     * 
     * Receives a pointer to the object that supports the control pattern,
     * 				or <b>NULL</b> if the control pattern is not supported. 
     * 				This parameter is passed uninitialized.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-irawelementprovidersimple-getpatternprovider
     */
    GetPatternProvider(patternId) {
        result := ComCall(4, this, "int", patternId, "ptr*", &pRetVal := 0, "HRESULT")
        return IUnknown(pRetVal)
    }

    /**
     * Retrieves the value of a property supported by the Microsoft UI Automation provider.
     * @param {Integer} propertyId Type: <b>PROPERTYID</b>
     * 
     * The property identifier. For a list of property IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-entry-propids">Property Identifiers</a>.
     * @returns {VARIANT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinAuto/variant-structure">VARIANT</a>*</b>
     * 
     * Receives the property value, or <b>VT_EMPTY</b> if the property is not supported by this
     * 				provider. This parameter is passed uninitialized. See Remarks.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-irawelementprovidersimple-getpropertyvalue
     */
    GetPropertyValue(propertyId) {
        pRetVal := VARIANT()
        result := ComCall(5, this, "int", propertyId, "ptr", pRetVal, "HRESULT")
        return pRetVal
    }

    /**
     * Specifies the host provider for this element.
     * @remarks
     * 
     * This property is generally the Microsoft UI Automation provider for the window of a custom control.
     * 			UI Automation uses this provider in combination with the custom provider. For example, the runtime identifier 
     * 			of the element is usually obtained from the host provider.
     * 
     * A host provider must be returned in the following cases: when the element is a fragment root, 
     * 			when the element is a simple element (such as a push button), and when the provider is a repositioning placeholder (for more information, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-serversideprovider">Provider Repositioning</a>). 
     * 			 In other cases, the property should be <b>NULL</b>.
     * 
     * 
     * 
     * @returns {IRawElementProviderSimple} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-irawelementprovidersimple-get_hostrawelementprovider
     */
    get_HostRawElementProvider() {
        result := ComCall(6, this, "ptr*", &pRetVal := 0, "HRESULT")
        return IRawElementProviderSimple(pRetVal)
    }
}
