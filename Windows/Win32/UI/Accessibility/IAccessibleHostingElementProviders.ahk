#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IRawElementProviderSimple.ahk" { IRawElementProviderSimple }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * A Microsoft Active Accessibility object implements this interface when the object is the root of an accessibility tree that includes windowless Microsoft ActiveX controls that implement Microsoft UI Automation.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nn-uiautomationcore-iaccessiblehostingelementproviders
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IAccessibleHostingElementProviders extends IUnknown {
    /**
     * The interface identifier for IAccessibleHostingElementProviders
     * @type {Guid}
     */
    static IID := Guid("{33ac331b-943e-4020-b295-db37784974a3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAccessibleHostingElementProviders interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetEmbeddedFragmentRoots : IntPtr
        GetObjectIdForProvider   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAccessibleHostingElementProviders.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the Microsoft Active Accessibility providers of all windowless Microsoft ActiveX controls that have a Microsoft UI Automation provider implementation, and are hosted in a Microsoft Active Accessibility object that implements the IAccessibleHostingElementProviders interface.
     * @remarks
     * The container of windowless ActiveX controls implements this method on the same object that implements the <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a> interface.  When called, this method queries each of the contained windowless ActiveX controls for an <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementproviderfragmentroot">IRawElementProviderFragmentRoot</a> pointer, and then adds the pointer to the safe array.  
     * 
     * This method should not include any providers that do not implement <b>IRawElementProviderFragmentRoot</b>.
     * @returns {Pointer<SAFEARRAY>} Type: <b>SAFEARRAY**</b>
     * 
     * Receives the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementproviderfragmentroot">IRawElementProviderFragmentRoot</a> interface pointers.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iaccessiblehostingelementproviders-getembeddedfragmentroots
     */
    GetEmbeddedFragmentRoots() {
        result := ComCall(3, this, "ptr*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Retrieves the object ID associated with a contained windowless Microsoft ActiveX control that implements Microsoft UI Automation.
     * @param {IRawElementProviderSimple} pProvider Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementprovidersimple">IRawElementProviderSimple</a>*</b>
     * 
     * The provider for the windowless ActiveX control.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The object ID of the contained windowless ActiveX control.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iaccessiblehostingelementproviders-getobjectidforprovider
     */
    GetObjectIdForProvider(pProvider) {
        result := ComCall(4, this, "ptr", pProvider, "int*", &pidObject := 0, "HRESULT")
        return pidObject
    }

    Query(iid) {
        if (IAccessibleHostingElementProviders.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetEmbeddedFragmentRoots := CallbackCreate(GetMethod(implObj, "GetEmbeddedFragmentRoots"), flags, 2)
        this.vtbl.GetObjectIdForProvider := CallbackCreate(GetMethod(implObj, "GetObjectIdForProvider"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetEmbeddedFragmentRoots)
        CallbackFree(this.vtbl.GetObjectIdForProvider)
    }
}
