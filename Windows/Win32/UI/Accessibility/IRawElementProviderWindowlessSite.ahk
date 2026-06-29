#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\NavigateDirection.ahk" { NavigateDirection }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IRawElementProviderFragment.ahk" { IRawElementProviderFragment }
#Import "..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * A Microsoft ActiveX control site implements this interface to enable a Microsoft UI Automation-enabled ActiveX control to express its accessibility.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nn-uiautomationcore-irawelementproviderwindowlesssite
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IRawElementProviderWindowlessSite extends IUnknown {
    /**
     * The interface identifier for IRawElementProviderWindowlessSite
     * @type {Guid}
     */
    static IID := Guid("{0a2a93cc-bfad-42ac-9b2e-0991fb0d3ea0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRawElementProviderWindowlessSite interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetAdjacentFragment : IntPtr
        GetRuntimeIdPrefix  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRawElementProviderWindowlessSite.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves a fragment pointer for a fragment that is adjacent to the windowless Microsoft ActiveX control owned by this control site.
     * @remarks
     * To return the parent of the fragment, an object that implements the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementproviderfragment">IRawElementProviderFragment</a> interface must be able to implement the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nf-uiautomationcore-irawelementproviderfragment-navigate">Navigate</a> method.  Implementing <b>Navigate</b> is difficult for a windowless ActiveX control because the control might be unable to determine its location in the accessible tree of the parent object.  The <b>GetAdjacentFragment</b> method enables the windowless ActiveX control to query its site for the adjacent fragment, and then return that fragment to the client that called <b>Navigate</b>.
     * 
     * 
     * 
     * A provider typically calls this method as part of handling the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nf-uiautomationcore-irawelementproviderfragment-navigate">IRawElementProviderFragment::Navigate</a>  method.
     * @param {NavigateDirection} _direction 
     * @returns {IRawElementProviderFragment} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementproviderfragment">IRawElementProviderFragment</a>**</b>
     * 
     * Receives the adjacent fragment.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-irawelementproviderwindowlesssite-getadjacentfragment
     */
    GetAdjacentFragment(_direction) {
        result := ComCall(3, this, NavigateDirection, _direction, "ptr*", &ppParent := 0, "HRESULT")
        return IRawElementProviderFragment(ppParent)
    }

    /**
     * Retrieves a Microsoft UI Automation runtime ID that is unique to the windowless Microsoft ActiveX control site.
     * @remarks
     * A UI Automation fragment must implement the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nf-uiautomationcore-irawelementproviderfragment-getruntimeid">IRawElementProviderFragment::GetRuntimeId</a> method to return a unique ID for the fragment.  This is difficult for a windowless ActiveX control, which must be able to identify itself as unique among other windowless controls in the ActiveX control container.  To resolve this issue, the windowless site should implement the <b>GetRuntimeIdPrefix</b>  method by forming a <a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> that contains the constant <b>UiaAppendRuntimeId</b>, followed by an integer value that is unique to this windowless site.  
     * 
     * The fragment can then append an integer value that is unique relative to all other fragments in the windowless ActiveX control, and return it to the client.  
     * 
     * 
     * 
     * For example, the site might return a SAFEARRAY with the following contents: <c>{ UiaAppendRuntimeId, 3 }</code>.  This might represent the third ActiveX control in the container.  The fragment provider's <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nf-uiautomationcore-irawelementproviderfragment-getruntimeid">GetRuntimeId</a> method could then form a SAFEARRAY with the following contents: <code>{ UiaAppendRuntimeId, 3, 5 }</c>.  This might represent the fifth fragment within the ActiveX container.  The whole SAFEARRAY would be a unique ID relative to the whole ActiveX control container.
     * 
     * 
     * 
     * A provider typically calls this method as part of handling the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nf-uiautomationcore-irawelementproviderfragment-getruntimeid">GetRuntimeId</a> method.
     * @returns {Pointer<SAFEARRAY>} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a>**</b>
     * 
     * Receives the runtime ID.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-irawelementproviderwindowlesssite-getruntimeidprefix
     */
    GetRuntimeIdPrefix() {
        result := ComCall(4, this, "ptr*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    Query(iid) {
        if (IRawElementProviderWindowlessSite.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetAdjacentFragment := CallbackCreate(GetMethod(implObj, "GetAdjacentFragment"), flags, 3)
        this.vtbl.GetRuntimeIdPrefix := CallbackCreate(GetMethod(implObj, "GetRuntimeIdPrefix"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetAdjacentFragment)
        CallbackFree(this.vtbl.GetRuntimeIdPrefix)
    }
}
