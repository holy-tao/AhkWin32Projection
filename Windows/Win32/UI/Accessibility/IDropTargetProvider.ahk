#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * Enables a Microsoft UI Automation element to describe itself as an element that can receive a drop of a dragged element as part of a UI Automation drag-and-drop operation.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nn-uiautomationcore-idroptargetprovider
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IDropTargetProvider extends IUnknown {
    /**
     * The interface identifier for IDropTargetProvider
     * @type {Guid}
     */
    static IID := Guid("{bae82bfd-358a-481c-85a0-d8b4d90a5d61}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDropTargetProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_DropTargetEffect  : IntPtr
        get_DropTargetEffects : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDropTargetProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    DropTargetEffect {
        get => this.get_DropTargetEffect()
    }

    /**
     * @type {Pointer<SAFEARRAY>} 
     */
    DropTargetEffects {
        get => this.get_DropTargetEffects()
    }

    /**
     * Retrieves a localized string that describes the effect that happens when the user drops the grabbed element on this drop target.
     * @remarks
     * This property describes the default effect that happens when the user drops a grabbed element on a target, such as moving or copying the element.  This property can be a short string such as "move", or a longer one such as "insert into Main group".  The string is always localized.
     * 
     * If this property changes, the provider must notify clients by firing a <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-event-ids">UIA_AutomationPropertyChangedEventId</a> event.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-idroptargetprovider-get_droptargeteffect
     */
    get_DropTargetEffect() {
        pRetVal := BSTR.Owned()
        result := ComCall(3, this, BSTR.Ptr, pRetVal, "HRESULT")
        return pRetVal
    }

    /**
     * Retrieves an array of localized strings that enumerate the full set of effects that can happen when the user drops a grabbed element on this drop target as part of a drag-and-drop operation. (IDropTargetProvider.get_DropTargetEffects)
     * @remarks
     * Some drag operations support a set of different drop effects. For example, a drag operation that is initiated with a right-click might display a menu of options for the action that occurs when the element is dropped.  To find out the set of effects that can happen when the grabbed element is dropped, a client can query the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nf-uiautomationcore-idragprovider-get_dropeffects">DropEffects</a> property of the dragged element.  This property can contain short strings such as "move", or longer ones such as "insert into Main group".  The strings are always localized.
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-idroptargetprovider-get_droptargeteffects
     */
    get_DropTargetEffects() {
        result := ComCall(4, this, "ptr*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    Query(iid) {
        if (IDropTargetProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_DropTargetEffect := CallbackCreate(GetMethod(implObj, "get_DropTargetEffect"), flags, 2)
        this.vtbl.get_DropTargetEffects := CallbackCreate(GetMethod(implObj, "get_DropTargetEffects"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_DropTargetEffect)
        CallbackFree(this.vtbl.get_DropTargetEffects)
    }
}
