#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IUIAutomationElementArray.ahk
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
     * @type {BOOL} 
     */
    CurrentIsGrabbed {
        get => this.get_CurrentIsGrabbed()
    }

    /**
     * @type {BOOL} 
     */
    CachedIsGrabbed {
        get => this.get_CachedIsGrabbed()
    }

    /**
     * @type {BSTR} 
     */
    CurrentDropEffect {
        get => this.get_CurrentDropEffect()
    }

    /**
     * @type {BSTR} 
     */
    CachedDropEffect {
        get => this.get_CachedDropEffect()
    }

    /**
     * @type {Pointer<SAFEARRAY>} 
     */
    CurrentDropEffects {
        get => this.get_CurrentDropEffects()
    }

    /**
     * @type {Pointer<SAFEARRAY>} 
     */
    CachedDropEffects {
        get => this.get_CachedDropEffects()
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationdragpattern-get_currentisgrabbed
     */
    get_CurrentIsGrabbed() {
        result := ComCall(3, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationdragpattern-get_cachedisgrabbed
     */
    get_CachedIsGrabbed() {
        result := ComCall(4, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationdragpattern-get_currentdropeffect
     */
    get_CurrentDropEffect() {
        retVal := BSTR()
        result := ComCall(5, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationdragpattern-get_cacheddropeffect
     */
    get_CachedDropEffect() {
        retVal := BSTR()
        result := ComCall(6, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationdragpattern-get_currentdropeffects
     */
    get_CurrentDropEffects() {
        result := ComCall(7, this, "ptr*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationdragpattern-get_cacheddropeffects
     */
    get_CachedDropEffects() {
        result := ComCall(8, this, "ptr*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {IUIAutomationElementArray} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationdragpattern-getcurrentgrabbeditems
     */
    GetCurrentGrabbedItems() {
        result := ComCall(9, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElementArray(retVal)
    }

    /**
     * 
     * @returns {IUIAutomationElementArray} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationdragpattern-getcachedgrabbeditems
     */
    GetCachedGrabbedItems() {
        result := ComCall(10, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElementArray(retVal)
    }
}
