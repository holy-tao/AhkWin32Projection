#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\NavigateDirection.ahk" { NavigateDirection }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IRawElementProviderFragmentRoot.ahk" { IRawElementProviderFragmentRoot }
#Import ".\UiaRect.ahk" { UiaRect }
#Import "..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * Exposes methods and properties on UI elements that are part of a structure more than one level deep, such as a list box or list item. Implemented by Microsoft UI Automation provider.
 * @remarks
 * The root node of the fragment must also support the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementproviderfragmentroot">IRawElementProviderFragmentRoot</a> interface.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nn-uiautomationcore-irawelementproviderfragment
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IRawElementProviderFragment extends IUnknown {
    /**
     * The interface identifier for IRawElementProviderFragment
     * @type {Guid}
     */
    static IID := Guid("{f7063da8-8359-439c-9297-bbc5299a7d87}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRawElementProviderFragment interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Navigate                 : IntPtr
        GetRuntimeId             : IntPtr
        get_BoundingRectangle    : IntPtr
        GetEmbeddedFragmentRoots : IntPtr
        SetFocus                 : IntPtr
        get_FragmentRoot         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRawElementProviderFragment.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {UiaRect} 
     */
    BoundingRectangle {
        get => this.get_BoundingRectangle()
    }

    /**
     * @type {IRawElementProviderFragmentRoot} 
     */
    FragmentRoot {
        get => this.get_FragmentRoot()
    }

    /**
     * Retrieves the Microsoft UI Automation element in a specified direction within the UI Automation tree.
     * @remarks
     * The UI Automation server's implementations of this method define the structure of the UI Automation tree.
     * 
     * Navigation must be supported upward to the parent, downward to the first and last child, and laterally to the next and previous siblings, as applicable.
     * 
     * Each child node has only one parent and must be placed in the chain of siblings reached from the parent by <b>NavigateDirection_FirstChild</b> and <b>NavigateDirection_LastChild</b>.
     * 
     * Relationships among siblings must be identical in both directions: if A is B's previous sibling (<b>NavigateDirection_PreviousSibling</b>), then B is A's next sibling (<b>NavigateDirection_NextSibling</b>). A first child (<b>NavigateDirection_FirstChild</b>) has no previous sibling, and a last child  (<b>NavigateDirection_LastChild</b>) has no next sibling. 
     * 
     * Fragment roots do not enable navigation to a parent or siblings; navigation among fragment roots is handled by the default window providers. Elements in fragments must navigate only to other elements within that fragment.
     * @param {NavigateDirection} _direction 
     * @returns {IRawElementProviderFragment} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementproviderfragment">IRawElementProviderFragment</a>**</b>
     * 
     * Receives a pointer to the provider of the 
     * 				UI Automation element in the specified direction, or <b>NULL</b> if there is no element in that direction.
     * 				This parameter is passed uninitialized.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-irawelementproviderfragment-navigate
     */
    Navigate(_direction) {
        result := ComCall(3, this, NavigateDirection, _direction, "ptr*", &pRetVal := 0, "HRESULT")
        return IRawElementProviderFragment(pRetVal)
    }

    /**
     * Retrieves the runtime identifier of an element.
     * @remarks
     * Implementations should return <b>NULL</b> for a top-level element that is hosted in a window. 
     * 			Other elements should return an array that contains <b>UiaAppendRuntimeId</b> 
     *             (defined in Uiautomationcoreapi.h), 
     * 			followed by a value that is unique within an instance of the fragment.
     * @returns {Pointer<SAFEARRAY>} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a>**</b>
     * 
     * Receives a pointer to the runtime identifier. This parameter is passed uninitialized.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-irawelementproviderfragment-getruntimeid
     */
    GetRuntimeId() {
        result := ComCall(4, this, "ptr*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Specifies the bounding rectangle of this element.
     * @remarks
     * The bounding rectangle is defined by the location of the top left corner on the screen, and the dimensions.
     * 
     * No clipping is required if the element is partly obscured or partly off-screen. The IsOffscreen property should be set to indicate whether the rectangle is actually visible.
     * 
     * Not all points within the bounding rectangle are necessarily clickable.
     * @returns {UiaRect} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-irawelementproviderfragment-get_boundingrectangle
     */
    get_BoundingRectangle() {
        pRetVal := UiaRect()
        result := ComCall(5, this, UiaRect.Ptr, pRetVal, "HRESULT")
        return pRetVal
    }

    /**
     * Retrieves an array of root fragments that are embedded in the Microsoft UI Automation tree rooted at the current element.
     * @remarks
     * This method returns an array of fragments only if the current element is hosting another automation framework. 
     * 			Most providers return <b>NULL</b>.
     * @returns {Pointer<SAFEARRAY>} Type: <b>SAFEARRAY**</b>
     * 
     * Receives an array of pointers to the root fragments, or <b>NULL</b> (see Remarks). This parameter is passed uninitialized.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-irawelementproviderfragment-getembeddedfragmentroots
     */
    GetEmbeddedFragmentRoots() {
        result := ComCall(6, this, "ptr*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Sets the focus to this element.
     * @remarks
     * The Microsoft UI Automation framework will ensure that the part of the interface that hosts this fragment is 
     * 			already focused before calling this method. Your implementation should update only its internal focus state; 
     * 			for example, by repainting a list item to show that it has the focus. If you prefer that UI Automation 
     * 			not focus the parent window, set <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ne-uiautomationcore-provideroptions">ProviderOptions_ProviderOwnsSetFocus</a> in <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nf-uiautomationcore-irawelementprovidersimple-get_provideroptions">IRawElementProviderSimple::ProviderOptions</a> for the fragment root.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-irawelementproviderfragment-setfocus
     */
    SetFocus() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * Specifies the root node of the fragment.
     * @remarks
     * A provider for a fragment root should return a pointer to its own implementation of 
     * 			<a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementproviderfragmentroot">IRawElementProviderFragmentRoot</a>.
     * @returns {IRawElementProviderFragmentRoot} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-irawelementproviderfragment-get_fragmentroot
     */
    get_FragmentRoot() {
        result := ComCall(8, this, "ptr*", &pRetVal := 0, "HRESULT")
        return IRawElementProviderFragmentRoot(pRetVal)
    }

    Query(iid) {
        if (IRawElementProviderFragment.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Navigate := CallbackCreate(GetMethod(implObj, "Navigate"), flags, 3)
        this.vtbl.GetRuntimeId := CallbackCreate(GetMethod(implObj, "GetRuntimeId"), flags, 2)
        this.vtbl.get_BoundingRectangle := CallbackCreate(GetMethod(implObj, "get_BoundingRectangle"), flags, 2)
        this.vtbl.GetEmbeddedFragmentRoots := CallbackCreate(GetMethod(implObj, "GetEmbeddedFragmentRoots"), flags, 2)
        this.vtbl.SetFocus := CallbackCreate(GetMethod(implObj, "SetFocus"), flags, 1)
        this.vtbl.get_FragmentRoot := CallbackCreate(GetMethod(implObj, "get_FragmentRoot"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Navigate)
        CallbackFree(this.vtbl.GetRuntimeId)
        CallbackFree(this.vtbl.get_BoundingRectangle)
        CallbackFree(this.vtbl.GetEmbeddedFragmentRoots)
        CallbackFree(this.vtbl.SetFocus)
        CallbackFree(this.vtbl.get_FragmentRoot)
    }
}
