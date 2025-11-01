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
     * 
     * @param {Pointer<Pointer<SAFEARRAY>>} pRetVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iaccessiblehostingelementproviders-getembeddedfragmentroots
     */
    GetEmbeddedFragmentRoots(pRetVal) {
        result := ComCall(3, this, "ptr*", pRetVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IRawElementProviderSimple} pProvider 
     * @param {Pointer<Integer>} pidObject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iaccessiblehostingelementproviders-getobjectidforprovider
     */
    GetObjectIdForProvider(pProvider, pidObject) {
        result := ComCall(4, this, "ptr", pProvider, "int*", pidObject, "HRESULT")
        return result
    }
}
