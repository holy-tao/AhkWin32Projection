#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * @type {BSTR} 
     */
    CurrentDropTargetEffect {
        get => this.get_CurrentDropTargetEffect()
    }

    /**
     * @type {BSTR} 
     */
    CachedDropTargetEffect {
        get => this.get_CachedDropTargetEffect()
    }

    /**
     * @type {Pointer<SAFEARRAY>} 
     */
    CurrentDropTargetEffects {
        get => this.get_CurrentDropTargetEffects()
    }

    /**
     * @type {Pointer<SAFEARRAY>} 
     */
    CachedDropTargetEffects {
        get => this.get_CachedDropTargetEffects()
    }

    /**
     * Retrieves a localized string that describes what happens when the user drops the grabbed element on this drop target.
     * @remarks
     * 
     * This property describes the default effect that happens when the user drops a grabbed element on a target, such as moving or copying the element.  This property can be a short string such as "move", or a longer one such as "insert into Main group".  The string is always localized.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationdroptargetpattern-get_currentdroptargeteffect
     */
    get_CurrentDropTargetEffect() {
        retVal := BSTR()
        result := ComCall(3, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a cached localized string that describes what happens when the user drops the grabbed element on this drop target.
     * @remarks
     * 
     * This property describes the default effect that happens when the user drops a grabbed element on a target, such as moving or copying the element.  This property can be a short string such as "move", or a longer one such as "insert into Main group".  The string is always localized.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationdroptargetpattern-get_cacheddroptargeteffect
     */
    get_CachedDropTargetEffect() {
        retVal := BSTR()
        result := ComCall(4, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves an array of localized strings that enumerate the full set of effects that can happen when the user drops a grabbed element on this drop target as part of a drag-and-drop operation.
     * @remarks
     * 
     * Some drag operations support a set of different drop effects. For example, a drag operation that is initiated with a right-click might display a menu of options for the action that occurs when the element is dropped.  To find out the set of effects that can happen when the grabbed element is dropped, a client can query the DropEffects property of the dragged element.  This property can contain short strings such as "move", or longer ones such as "insert into Main group".  The strings are always localized.
     * 
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationdroptargetpattern-get_currentdroptargeteffects
     */
    get_CurrentDropTargetEffects() {
        result := ComCall(5, this, "ptr*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a cached array of localized strings that enumerate the full set of effects that can happen when the user drops a grabbed element on this drop target as part of a drag-and-drop operation.
     * @remarks
     * 
     * Some drag operations support a set of different drop effects. For example, a drag operation that is initiated with a right-click might display a menu of options for the action that occurs when the element is dropped.  To find out the set of effects that can happen when the grabbed element is dropped, a client can query the DropEffects property of the dragged element.  This property can contain short strings such as "move", or longer ones such as "insert into Main group".  The strings are always localized.
     * 
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationdroptargetpattern-get_cacheddroptargeteffects
     */
    get_CachedDropTargetEffects() {
        result := ComCall(6, this, "ptr*", &retVal := 0, "HRESULT")
        return retVal
    }
}
