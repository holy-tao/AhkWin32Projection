#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRawElementProviderFragment.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * A Microsoft ActiveX control site implements this interface to enable a Microsoft UI Automation-enabled ActiveX control to express its accessibility.
 * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nn-uiautomationcore-irawelementproviderwindowlesssite
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IRawElementProviderWindowlessSite extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRawElementProviderWindowlessSite
     * @type {Guid}
     */
    static IID => Guid("{0a2a93cc-bfad-42ac-9b2e-0991fb0d3ea0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAdjacentFragment", "GetRuntimeIdPrefix"]

    /**
     * Retrieves a fragment pointer for a fragment that is adjacent to the windowless Microsoft ActiveX control owned by this control site.
     * @remarks
     * To return the parent of the fragment, an object that implements the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementproviderfragment">IRawElementProviderFragment</a> interface must be able to implement the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nf-uiautomationcore-irawelementproviderfragment-navigate">Navigate</a> method.  Implementing <b>Navigate</b> is difficult for a windowless ActiveX control because the control might be unable to determine its location in the accessible tree of the parent object.  The <b>GetAdjacentFragment</b> method enables the windowless ActiveX control to query its site for the adjacent fragment, and then return that fragment to the client that called <b>Navigate</b>.
     * 
     * 
     * 
     * A provider typically calls this method as part of handling the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nf-uiautomationcore-irawelementproviderfragment-navigate">IRawElementProviderFragment::Navigate</a>  method.
     * @param {Integer} direction_ 
     * @returns {IRawElementProviderFragment} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementproviderfragment">IRawElementProviderFragment</a>**</b>
     * 
     * Receives the adjacent fragment.
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-irawelementproviderwindowlesssite-getadjacentfragment
     */
    GetAdjacentFragment(direction_) {
        result := ComCall(3, this, "int", direction_, "ptr*", &ppParent := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-irawelementproviderwindowlesssite-getruntimeidprefix
     */
    GetRuntimeIdPrefix() {
        result := ComCall(4, this, "ptr*", &pRetVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pRetVal
    }
}
