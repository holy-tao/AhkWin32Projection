#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * Provides access to controls that act as containers for a collection of individual, selectable child items.
 * @remarks
 * This interface is implemented by a UI Automation provider.
 * 
 * Providers should raise an event of type <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-event-ids">UIA_Selection_InvalidatedEventId</a> when a selection in a container has changed significantly.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nn-uiautomationcore-iselectionprovider
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct ISelectionProvider extends IUnknown {
    /**
     * The interface identifier for ISelectionProvider
     * @type {Guid}
     */
    static IID := Guid("{fb8b03af-3bdf-48d4-bd36-1a65793be168}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISelectionProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetSelection            : IntPtr
        get_CanSelectMultiple   : IntPtr
        get_IsSelectionRequired : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISelectionProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BOOL} 
     */
    CanSelectMultiple {
        get => this.get_CanSelectMultiple()
    }

    /**
     * @type {BOOL} 
     */
    IsSelectionRequired {
        get => this.get_IsSelectionRequired()
    }

    /**
     * Retrieves a Microsoft UI Automation provider for each child element that is selected.
     * @returns {Pointer<SAFEARRAY>} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a>**</b>
     * 
     * Receives a pointer to a <a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> that contains an array of pointers to the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementprovidersimple">IRawElementProviderSimple</a> interfaces
     * 				of the selected elements. This parameter is passed uninitialized.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iselectionprovider-getselection
     */
    GetSelection() {
        result := ComCall(3, this, "ptr*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Indicates whether the Microsoft UI Automation provider allows more than one child element to be selected concurrently.
     * @remarks
     * This property may be dynamic. For example, in rare cases a control might allow 
     *         multiple items to be selected on initialization but subsequently allow only single selections to be made.
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iselectionprovider-get_canselectmultiple
     */
    get_CanSelectMultiple() {
        result := ComCall(4, this, BOOL.Ptr, &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Indicates whether the Microsoft UI Automation provider requires at least one child element to be selected.
     * @remarks
     * This property can be dynamic. For example, the initial state of a control might 
     *         not have any items selected by default, meaning that <b>ISelectionProvider::IsSelectionRequired</b> is <b>FALSE</b>. 
     *         However, after an item is selected the control must always have at least one item selected.
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iselectionprovider-get_isselectionrequired
     */
    get_IsSelectionRequired() {
        result := ComCall(5, this, BOOL.Ptr, &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    Query(iid) {
        if (ISelectionProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetSelection := CallbackCreate(GetMethod(implObj, "GetSelection"), flags, 2)
        this.vtbl.get_CanSelectMultiple := CallbackCreate(GetMethod(implObj, "get_CanSelectMultiple"), flags, 2)
        this.vtbl.get_IsSelectionRequired := CallbackCreate(GetMethod(implObj, "get_IsSelectionRequired"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetSelection)
        CallbackFree(this.vtbl.get_CanSelectMultiple)
        CallbackFree(this.vtbl.get_IsSelectionRequired)
    }
}
