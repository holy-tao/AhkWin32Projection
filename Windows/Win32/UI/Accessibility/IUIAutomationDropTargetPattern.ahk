#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to drag-and-drop information exposed by a Microsoft UI Automation provider for an element that can be the drop target of a drag-and-drop operation.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationdroptargetpattern
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationDropTargetPattern extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAutomationDropTargetPattern
     * @type {Guid}
     */
    static IID => Guid("{69a095f7-eee4-430e-a46b-fb73b1ae39a5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CurrentDropTargetEffect", "get_CachedDropTargetEffect", "get_CurrentDropTargetEffects", "get_CachedDropTargetEffects"]

    /**
     * 
     * @param {Pointer<BSTR>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationdroptargetpattern-get_currentdroptargeteffect
     */
    get_CurrentDropTargetEffect(retVal) {
        result := ComCall(3, this, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationdroptargetpattern-get_cacheddroptargeteffect
     */
    get_CachedDropTargetEffect(retVal) {
        result := ComCall(4, this, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<SAFEARRAY>>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationdroptargetpattern-get_currentdroptargeteffects
     */
    get_CurrentDropTargetEffects(retVal) {
        result := ComCall(5, this, "ptr*", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<SAFEARRAY>>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationdroptargetpattern-get_cacheddroptargeteffects
     */
    get_CachedDropTargetEffects(retVal) {
        result := ComCall(6, this, "ptr*", retVal, "HRESULT")
        return result
    }
}
