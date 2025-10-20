#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * This interface is implemented by a Microsoft UI Automation provider when the provider is the root of an accessibility tree that includes windowless controls that support Microsoft Active Accessibility.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nn-uiautomationcore-irawelementproviderhostingaccessibles
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IRawElementProviderHostingAccessibles extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRawElementProviderHostingAccessibles
     * @type {Guid}
     */
    static IID => Guid("{24be0b07-d37d-487a-98cf-a13ed465e9b3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetEmbeddedAccessibles"]

    /**
     * 
     * @param {Pointer<Pointer<SAFEARRAY>>} pRetVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-irawelementproviderhostingaccessibles-getembeddedaccessibles
     */
    GetEmbeddedAccessibles(pRetVal) {
        result := ComCall(3, this, "ptr*", pRetVal, "HRESULT")
        return result
    }
}
