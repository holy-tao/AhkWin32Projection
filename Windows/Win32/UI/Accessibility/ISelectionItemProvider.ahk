#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IRawElementProviderSimple.ahk" { IRawElementProviderSimple }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides access to individual, selectable child controls of containers that implement ISelectionProvider.
 * @remarks
 * Implemented on a Microsoft UI Automation provider that 
 *             must support the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-implementingselectionitem">SelectionItem</a> control pattern.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nn-uiautomationcore-iselectionitemprovider
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct ISelectionItemProvider extends IUnknown {
    /**
     * The interface identifier for ISelectionItemProvider
     * @type {Guid}
     */
    static IID := Guid("{2acad808-b2d4-452d-a407-91ff1ad167b2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISelectionItemProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Select                 : IntPtr
        AddToSelection         : IntPtr
        RemoveFromSelection    : IntPtr
        get_IsSelected         : IntPtr
        get_SelectionContainer : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISelectionItemProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BOOL} 
     */
    IsSelected {
        get => this.get_IsSelected()
    }

    /**
     * @type {IRawElementProviderSimple} 
     */
    SelectionContainer {
        get => this.get_SelectionContainer()
    }

    /**
     * Deselects any selected items and then selects the current element.
     * @remarks
     * If the current element isn’t selected, this method deselects any selected items and then selects the current element.  If the current element is already selected, this method does nothing.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iselectionitemprovider-select
     */
    Select() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Adds the current element to the collection of selected items. (ISelectionItemProvider.AddToSelection)
     * @remarks
     * If the result of a call to <b>ISelectionItemProvider::AddToSelection</b> is that a single item is selected, then 
     * 			send an <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-event-ids">UIA_SelectionItem_ElementSelectedEventId</a> event for that element; otherwise send an <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-event-ids">UIA_SelectionItem_ElementAddedToSelectionEventId</a> or 
     * 			<a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-event-ids">UIA_SelectionItem_ElementRemovedFromSelectionEventId</a> event as appropriate. 
     * 
     * <div class="alert"><b>Note</b>  This rule does not depend on whether the container allows single or multiple selection, 
     * 			or on what method was used to change the selection. Only the result matters.</div>
     * <div> </div>
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iselectionitemprovider-addtoselection
     */
    AddToSelection() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Removes the current element from the collection of selected items.
     * @remarks
     * Send an <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-event-ids">UIA_SelectionItem_ElementRemovedFromSelectionEventId</a> event as appropriate. 
     * 
     * <div class="alert"><b>Note</b>  This rule does not depend on whether the container allows single or multiple selection, 
     * 			or on what method was used to change the selection. Only the result matters.</div>
     * <div> </div>
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iselectionitemprovider-removefromselection
     */
    RemoveFromSelection() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Indicates whether an item is selected.
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iselectionitemprovider-get_isselected
     */
    get_IsSelected() {
        result := ComCall(6, this, BOOL.Ptr, &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Specifies the provider that implements ISelectionProvider and acts as the container for the calling object.
     * @returns {IRawElementProviderSimple} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iselectionitemprovider-get_selectioncontainer
     */
    get_SelectionContainer() {
        result := ComCall(7, this, "ptr*", &pRetVal := 0, "HRESULT")
        return IRawElementProviderSimple(pRetVal)
    }

    Query(iid) {
        if (ISelectionItemProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Select := CallbackCreate(GetMethod(implObj, "Select"), flags, 1)
        this.vtbl.AddToSelection := CallbackCreate(GetMethod(implObj, "AddToSelection"), flags, 1)
        this.vtbl.RemoveFromSelection := CallbackCreate(GetMethod(implObj, "RemoveFromSelection"), flags, 1)
        this.vtbl.get_IsSelected := CallbackCreate(GetMethod(implObj, "get_IsSelected"), flags, 2)
        this.vtbl.get_SelectionContainer := CallbackCreate(GetMethod(implObj, "get_SelectionContainer"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Select)
        CallbackFree(this.vtbl.AddToSelection)
        CallbackFree(this.vtbl.RemoveFromSelection)
        CallbackFree(this.vtbl.get_IsSelected)
        CallbackFree(this.vtbl.get_SelectionContainer)
    }
}
