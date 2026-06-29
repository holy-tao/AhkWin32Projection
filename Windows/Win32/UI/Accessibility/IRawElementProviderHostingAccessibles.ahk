#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * This interface is implemented by a Microsoft UI Automation provider when the provider is the root of an accessibility tree that includes windowless controls that support Microsoft Active Accessibility.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nn-uiautomationcore-irawelementproviderhostingaccessibles
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IRawElementProviderHostingAccessibles extends IUnknown {
    /**
     * The interface identifier for IRawElementProviderHostingAccessibles
     * @type {Guid}
     */
    static IID := Guid("{24be0b07-d37d-487a-98cf-a13ed465e9b3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRawElementProviderHostingAccessibles interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetEmbeddedAccessibles : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRawElementProviderHostingAccessibles.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the IAccessible interface pointers of the windowless Microsoft ActiveX controls that are hosted by this provider.
     * @remarks
     * An ActiveX control container with an existing <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementproviderfragmentroot">IRawElementProviderFragmentRoot</a> interface implements this method on the same object that implements <b>IRawElementProviderFragmentRoot</b>.  When called, this method should query each contained windowless control for an <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a> pointer and then add the pointer  to the safe array.  
     * 
     * 
     * 
     * This method should ignore providers that do not implement <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a>.
     * @returns {Pointer<SAFEARRAY>} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a>**</b>
     * 
     * Receives the <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a> pointers of the hosted windowless ActiveX controls.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-irawelementproviderhostingaccessibles-getembeddedaccessibles
     */
    GetEmbeddedAccessibles() {
        result := ComCall(3, this, "ptr*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    Query(iid) {
        if (IRawElementProviderHostingAccessibles.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetEmbeddedAccessibles := CallbackCreate(GetMethod(implObj, "GetEmbeddedAccessibles"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetEmbeddedAccessibles)
    }
}
