#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IRawElementProviderFragment.ahk" { IRawElementProviderFragment }

/**
 * Exposes methods and properties on the root element in a fragment.
 * @remarks
 * This interface is implemented by a root element within a framework; for example, a list box within a window. 
 * 			Other elements in the same fragment, such as list items, implement the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementproviderfragment">IRawElementProviderFragment</a> interface.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nn-uiautomationcore-irawelementproviderfragmentroot
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IRawElementProviderFragmentRoot extends IUnknown {
    /**
     * The interface identifier for IRawElementProviderFragmentRoot
     * @type {Guid}
     */
    static IID := Guid("{620ce2a5-ab8f-40a9-86cb-de3c75599b58}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRawElementProviderFragmentRoot interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ElementProviderFromPoint : IntPtr
        GetFocus                 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRawElementProviderFragmentRoot.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the provider of the element that is at the specified point in this fragment.
     * @remarks
     * The returned provider should correspond to the element that would receive mouse input at the specified point.
     * 
     * If the point is on this element but not on any child element, either <b>NULL</b> or the provider of the fragment root is returned. If the point is on an element in another framework that is hosted by this fragment, the method returns the element that hosts that fragment (as indicated by <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nf-uiautomationcore-irawelementproviderfragment-getembeddedfragmentroots">IRawElementProviderFragment::GetEmbeddedFragmentRoots</a>).
     * @param {Float} x Type: <b>double</b>
     * 
     * The horizontal screen coordinate.
     * @param {Float} y Type: <b>double</b>
     * 
     * The vertical screen coordinate.
     * @returns {IRawElementProviderFragment} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementproviderfragment">IRawElementProviderFragment</a>**</b>
     * 
     * Receives a pointer to the provider of the element at (x, y),	or <b>NULL</b> if none exists. This parameter is passed uninitialized.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-irawelementproviderfragmentroot-elementproviderfrompoint
     */
    ElementProviderFromPoint(x, y) {
        result := ComCall(3, this, "double", x, "double", y, "ptr*", &pRetVal := 0, "HRESULT")
        return IRawElementProviderFragment(pRetVal)
    }

    /**
     * Retrieves the element in this fragment that has the input focus.
     * @returns {IRawElementProviderFragment} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementproviderfragment">IRawElementProviderFragment</a>**</b>
     * 
     * Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementproviderfragment">IRawElementProviderFragment</a> 
     *                 interface of the
     * 				element in this fragment that has the input focus, if any; otherwise <b>NULL</b>. 
     * 				This parameter is passed uninitialized.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-irawelementproviderfragmentroot-getfocus
     */
    GetFocus() {
        result := ComCall(4, this, "ptr*", &pRetVal := 0, "HRESULT")
        return IRawElementProviderFragment(pRetVal)
    }

    Query(iid) {
        if (IRawElementProviderFragmentRoot.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ElementProviderFromPoint := CallbackCreate(GetMethod(implObj, "ElementProviderFromPoint"), flags, 4)
        this.vtbl.GetFocus := CallbackCreate(GetMethod(implObj, "GetFocus"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ElementProviderFromPoint)
        CallbackFree(this.vtbl.GetFocus)
    }
}
