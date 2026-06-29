#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * Provides access to drag-and-drop information exposed by a Microsoft UI Automation provider for an element that can be the drop target of a drag-and-drop operation.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nn-uiautomationclient-iuiautomationdroptargetpattern
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IUIAutomationDropTargetPattern extends IUnknown {
    /**
     * The interface identifier for IUIAutomationDropTargetPattern
     * @type {Guid}
     */
    static IID := Guid("{69a095f7-eee4-430e-a46b-fb73b1ae39a5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAutomationDropTargetPattern interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_CurrentDropTargetEffect  : IntPtr
        get_CachedDropTargetEffect   : IntPtr
        get_CurrentDropTargetEffects : IntPtr
        get_CachedDropTargetEffects  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAutomationDropTargetPattern.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * This property describes the default effect that happens when the user drops a grabbed element on a target, such as moving or copying the element.  This property can be a short string such as "move", or a longer one such as "insert into Main group".  The string is always localized.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationdroptargetpattern-get_currentdroptargeteffect
     */
    get_CurrentDropTargetEffect() {
        retVal := BSTR.Owned()
        result := ComCall(3, this, BSTR.Ptr, retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a cached localized string that describes what happens when the user drops the grabbed element on this drop target.
     * @remarks
     * This property describes the default effect that happens when the user drops a grabbed element on a target, such as moving or copying the element.  This property can be a short string such as "move", or a longer one such as "insert into Main group".  The string is always localized.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationdroptargetpattern-get_cacheddroptargeteffect
     */
    get_CachedDropTargetEffect() {
        retVal := BSTR.Owned()
        result := ComCall(4, this, BSTR.Ptr, retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves an array of localized strings that enumerate the full set of effects that can happen when the user drops a grabbed element on this drop target as part of a drag-and-drop operation. (IUIAutomationDropTargetPattern.get_CurrentDropTargetEffects)
     * @remarks
     * Some drag operations support a set of different drop effects. For example, a drag operation that is initiated with a right-click might display a menu of options for the action that occurs when the element is dropped.  To find out the set of effects that can happen when the grabbed element is dropped, a client can query the DropEffects property of the dragged element.  This property can contain short strings such as "move", or longer ones such as "insert into Main group".  The strings are always localized.
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationdroptargetpattern-get_currentdroptargeteffects
     */
    get_CurrentDropTargetEffects() {
        result := ComCall(5, this, "ptr*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a cached array of localized strings that enumerate the full set of effects that can happen when the user drops a grabbed element on this drop target as part of a drag-and-drop operation.
     * @remarks
     * Some drag operations support a set of different drop effects. For example, a drag operation that is initiated with a right-click might display a menu of options for the action that occurs when the element is dropped.  To find out the set of effects that can happen when the grabbed element is dropped, a client can query the DropEffects property of the dragged element.  This property can contain short strings such as "move", or longer ones such as "insert into Main group".  The strings are always localized.
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationdroptargetpattern-get_cacheddroptargeteffects
     */
    get_CachedDropTargetEffects() {
        result := ComCall(6, this, "ptr*", &retVal := 0, "HRESULT")
        return retVal
    }

    Query(iid) {
        if (IUIAutomationDropTargetPattern.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_CurrentDropTargetEffect := CallbackCreate(GetMethod(implObj, "get_CurrentDropTargetEffect"), flags, 2)
        this.vtbl.get_CachedDropTargetEffect := CallbackCreate(GetMethod(implObj, "get_CachedDropTargetEffect"), flags, 2)
        this.vtbl.get_CurrentDropTargetEffects := CallbackCreate(GetMethod(implObj, "get_CurrentDropTargetEffects"), flags, 2)
        this.vtbl.get_CachedDropTargetEffects := CallbackCreate(GetMethod(implObj, "get_CachedDropTargetEffects"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_CurrentDropTargetEffect)
        CallbackFree(this.vtbl.get_CachedDropTargetEffect)
        CallbackFree(this.vtbl.get_CurrentDropTargetEffects)
        CallbackFree(this.vtbl.get_CachedDropTargetEffects)
    }
}
