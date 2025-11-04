#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Enables a Microsoft UI Automation element to describe itself as an element that can be dragged as part of a drag-and-drop operation.
 * @remarks
 * 
  * A provider can implement <b>IDragProvider</b> only on the element being dragged, or it can use an intermediary drag object that implements <b>IDragProvider</b>, in addition to the <b>IDragProvider</b> implementation on the individual element.  The intermediary is responsible for firing all events, which enables the provider to support dragging multiple elements at once, and to describe the multi-element drag operation with a single set of drag properties and events.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nn-uiautomationcore-idragprovider
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IDragProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDragProvider
     * @type {Guid}
     */
    static IID => Guid("{6aa7bbbb-7ff9-497d-904f-d20b897929d8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsGrabbed", "get_DropEffect", "get_DropEffects", "GetGrabbedItems"]

    /**
     * 
     * @param {Pointer<BOOL>} pRetVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-idragprovider-get_isgrabbed
     */
    get_IsGrabbed(pRetVal) {
        result := ComCall(3, this, "ptr", pRetVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pRetVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-idragprovider-get_dropeffect
     */
    get_DropEffect(pRetVal) {
        result := ComCall(4, this, "ptr", pRetVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<SAFEARRAY>>} pRetVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-idragprovider-get_dropeffects
     */
    get_DropEffects(pRetVal) {
        pRetValMarshal := pRetVal is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, pRetValMarshal, pRetVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<SAFEARRAY>>} pRetVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-idragprovider-getgrabbeditems
     */
    GetGrabbedItems(pRetVal) {
        pRetValMarshal := pRetVal is VarRef ? "ptr*" : "ptr"

        result := ComCall(6, this, pRetValMarshal, pRetVal, "HRESULT")
        return result
    }
}
