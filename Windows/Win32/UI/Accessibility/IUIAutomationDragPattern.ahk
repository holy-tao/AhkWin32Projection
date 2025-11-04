#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to information exposed by a UI Automation provider for an element that can be dragged as part of a drag-and-drop operation.
 * @remarks
 * 
  * Microsoft UI Automation clients use this interface to access the dragging properties and functionality of a control or UI element that the user can drag-and-drop on a drop target.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationdragpattern
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationDragPattern extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAutomationDragPattern
     * @type {Guid}
     */
    static IID => Guid("{1dc7b570-1f54-4bad-bcda-d36a722fb7bd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CurrentIsGrabbed", "get_CachedIsGrabbed", "get_CurrentDropEffect", "get_CachedDropEffect", "get_CurrentDropEffects", "get_CachedDropEffects", "GetCurrentGrabbedItems", "GetCachedGrabbedItems"]

    /**
     * 
     * @param {Pointer<BOOL>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationdragpattern-get_currentisgrabbed
     */
    get_CurrentIsGrabbed(retVal) {
        result := ComCall(3, this, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationdragpattern-get_cachedisgrabbed
     */
    get_CachedIsGrabbed(retVal) {
        result := ComCall(4, this, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationdragpattern-get_currentdropeffect
     */
    get_CurrentDropEffect(retVal) {
        result := ComCall(5, this, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationdragpattern-get_cacheddropeffect
     */
    get_CachedDropEffect(retVal) {
        result := ComCall(6, this, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<SAFEARRAY>>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationdragpattern-get_currentdropeffects
     */
    get_CurrentDropEffects(retVal) {
        retValMarshal := retVal is VarRef ? "ptr*" : "ptr"

        result := ComCall(7, this, retValMarshal, retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<SAFEARRAY>>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationdragpattern-get_cacheddropeffects
     */
    get_CachedDropEffects(retVal) {
        retValMarshal := retVal is VarRef ? "ptr*" : "ptr"

        result := ComCall(8, this, retValMarshal, retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationElementArray>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationdragpattern-getcurrentgrabbeditems
     */
    GetCurrentGrabbedItems(retVal) {
        result := ComCall(9, this, "ptr*", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationElementArray>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationdragpattern-getcachedgrabbeditems
     */
    GetCachedGrabbedItems(retVal) {
        result := ComCall(10, this, "ptr*", retVal, "HRESULT")
        return result
    }
}
