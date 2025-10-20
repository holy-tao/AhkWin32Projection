#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to controls that act as containers for a collection of individual, selectable child items.
 * @remarks
 * 
  * This interface is implemented by a UI Automation provider.
  * 
  * Providers should raise an event of type <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-event-ids">UIA_Selection_InvalidatedEventId</a> when a selection in a container has changed significantly.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nn-uiautomationcore-iselectionprovider
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class ISelectionProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISelectionProvider
     * @type {Guid}
     */
    static IID => Guid("{fb8b03af-3bdf-48d4-bd36-1a65793be168}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSelection", "get_CanSelectMultiple", "get_IsSelectionRequired"]

    /**
     * 
     * @param {Pointer<Pointer<SAFEARRAY>>} pRetVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iselectionprovider-getselection
     */
    GetSelection(pRetVal) {
        result := ComCall(3, this, "ptr*", pRetVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pRetVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iselectionprovider-get_canselectmultiple
     */
    get_CanSelectMultiple(pRetVal) {
        result := ComCall(4, this, "ptr", pRetVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pRetVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iselectionprovider-get_isselectionrequired
     */
    get_IsSelectionRequired(pRetVal) {
        result := ComCall(5, this, "ptr", pRetVal, "HRESULT")
        return result
    }
}
