#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * A Microsoft Active Accessibility object implements this interface when the object is the root of an accessibility tree that includes windowless Microsoft ActiveX controls that implement Microsoft UI Automation.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nn-uiautomationcore-iaccessiblehostingelementproviders
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IAccessibleHostingElementProviders extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAccessibleHostingElementProviders
     * @type {Guid}
     */
    static IID => Guid("{33ac331b-943e-4020-b295-db37784974a3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetEmbeddedFragmentRoots", "GetObjectIdForProvider"]

    /**
     * Retrieves the Microsoft Active Accessibility providers of all windowless Microsoft ActiveX controls that have a Microsoft UI Automation provider implementation, and are hosted in a Microsoft Active Accessibility object that implements the IAccessibleHostingElementProviders interface.
     * @returns {Pointer<SAFEARRAY>} Type: <b>SAFEARRAY**</b>
     * 
     * Receives the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementproviderfragmentroot">IRawElementProviderFragmentRoot</a> interface pointers.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-iaccessiblehostingelementproviders-getembeddedfragmentroots
     */
    GetEmbeddedFragmentRoots() {
        result := ComCall(3, this, "ptr*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Retrieves the object ID associated with a contained windowless Microsoft ActiveX control that implements Microsoft UI Automation.
     * @param {IRawElementProviderSimple} pProvider Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementprovidersimple">IRawElementProviderSimple</a>*</b>
     * 
     * The provider for the windowless ActiveX control.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The object ID of the contained windowless ActiveX control.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-iaccessiblehostingelementproviders-getobjectidforprovider
     */
    GetObjectIdForProvider(pProvider) {
        result := ComCall(4, this, "ptr", pProvider, "int*", &pidObject := 0, "HRESULT")
        return pidObject
    }
}
