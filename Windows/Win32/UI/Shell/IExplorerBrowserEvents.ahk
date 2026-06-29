#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "Common\ITEMIDLIST.ahk" { ITEMIDLIST }
#Import ".\IShellView.ahk" { IShellView }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods for notification of Explorer browser navigation and view creation events.
 * @remarks
 * Implement this interface to be notified of <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iexplorerbrowser">IExplorerBrowser</a> navigation and view creation events; implementation enables handling of these events, if desired.
 * 
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iexplorerbrowser">IExplorerBrowser</a> must be notified of implementers (clients) who want to be advised of <b>IExplorerBrowser</b> events. Clients do this by calling the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iexplorerbrowser-advise">IExplorerBrowser::Advise</a> method. This enables event callbacks by <b>IExplorerBrowser</b> to the client using the methods in <b>IExplorerBrowserEvents</b>. To stop event callbacks, the client must call method <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iexplorerbrowser-unadvise">IExplorerBrowser::Unadvise</a> or a memory leak may result.
 * 
 * During its first navigation (<a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iexplorerbrowser-browsetoobject">IExplorerBrowser::BrowseToObject</a>), Explorer calls the methods in this interface synchronously. After that, Explorer calls them asynchronously. The order of the event callbacks is as follows: <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iexplorerbrowserevents-onnavigationpending">IExplorerBrowserEvents::OnNavigationPending</a>; <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iexplorerbrowserevents-onviewcreated">IExplorerBrowserEvents::OnViewCreated</a>;
 * and <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iexplorerbrowserevents-onnavigationcomplete">IExplorerBrowserEvents::OnNavigationComplete</a> or <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iexplorerbrowserevents-onnavigationfailed">IExplorerBrowserEvents::OnNavigationFailed</a> depending on whether the navigation succeeded or failed.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iexplorerbrowserevents
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IExplorerBrowserEvents extends IUnknown {
    /**
     * The interface identifier for IExplorerBrowserEvents
     * @type {Guid}
     */
    static IID := Guid("{361bbdc7-e6ee-4e13-be58-58e2240c810f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IExplorerBrowserEvents interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnNavigationPending  : IntPtr
        OnViewCreated        : IntPtr
        OnNavigationComplete : IntPtr
        OnNavigationFailed   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IExplorerBrowserEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Notifies clients of a pending Explorer browser navigation to a Shell folder.
     * @remarks
     * Explorer browser calls this method before it navigates to a folder, that is, before calling <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iexplorerbrowserevents-onnavigationfailed">IExplorerBrowserEvents::OnNavigationFailed</a> or  <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iexplorerbrowserevents-onnavigationcomplete">IExplorerBrowserEvents::OnNavigationComplete</a>.
     * 
     * 
     * Returning any failure code from this method, including E_NOTIMPL, will cancel the navigation.
     * @param {Pointer<ITEMIDLIST>} pidlFolder Type: <b>PCIDLIST_ABSOLUTE</b>
     * 
     * A PIDL that specifies the folder.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iexplorerbrowserevents-onnavigationpending
     */
    OnNavigationPending(pidlFolder) {
        result := ComCall(3, this, ITEMIDLIST.Ptr, pidlFolder, "HRESULT")
        return result
    }

    /**
     * Notifies clients that the view of the Explorer browser has been created and can be modified.
     * @remarks
     * An Explorer browser calls this method to enable the client to perform any modifications to the Explorer browser view before it is shown; for example, to set view modes or folder flags.
     * @param {IShellView} psv Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iexplorerbrowserevents-onviewcreated
     */
    OnViewCreated(psv) {
        result := ComCall(4, this, "ptr", psv, "HRESULT")
        return result
    }

    /**
     * Notifies clients that the Explorer browser has successfully navigated to a Shell folder.
     * @remarks
     * This method is called after method <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iexplorerbrowserevents-onviewcreated">IExplorerBrowserEvents::OnViewCreated</a>, assuming a successful view creation.
     * 
     * After a navigation and view creation, either <b>IExplorerBrowserEvents::OnNavigationComplete</b> or <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iexplorerbrowserevents-onnavigationfailed">IExplorerBrowserEvents::OnNavigationFailed</a> is called depending on whether the destination could be navigated to. For example, a failure to navigate includes a destination that is not reached either because there is no route to the path or the user has canceled.
     * @param {Pointer<ITEMIDLIST>} pidlFolder Type: <b>PCIDLIST_ABSOLUTE</b>
     * 
     * A PIDL that specifies the folder.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iexplorerbrowserevents-onnavigationcomplete
     */
    OnNavigationComplete(pidlFolder) {
        result := ComCall(5, this, ITEMIDLIST.Ptr, pidlFolder, "HRESULT")
        return result
    }

    /**
     * Notifies clients that the Explorer browser has failed to navigate to a Shell folder.
     * @remarks
     * This method is called after method <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iexplorerbrowserevents-onviewcreated">IExplorerBrowserEvents::OnViewCreated</a>, assuming a successful view creation.
     * 
     * After a navigation and view creation, either <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iexplorerbrowserevents-onnavigationcomplete">IExplorerBrowserEvents::OnNavigationComplete</a> or <b>IExplorerBrowserEvents::OnNavigationFailed</b> is called, depending on whether the destination could be navigated to. For example, a failure to navigate includes a destination that is not reached either because there is no route to the path or the user has canceled.
     * @param {Pointer<ITEMIDLIST>} pidlFolder Type: <b>PCIDLIST_ABSOLUTE</b>
     * 
     * A PIDL that specifies the folder.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iexplorerbrowserevents-onnavigationfailed
     */
    OnNavigationFailed(pidlFolder) {
        result := ComCall(6, this, ITEMIDLIST.Ptr, pidlFolder, "HRESULT")
        return result
    }

    Query(iid) {
        if (IExplorerBrowserEvents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnNavigationPending := CallbackCreate(GetMethod(implObj, "OnNavigationPending"), flags, 2)
        this.vtbl.OnViewCreated := CallbackCreate(GetMethod(implObj, "OnViewCreated"), flags, 2)
        this.vtbl.OnNavigationComplete := CallbackCreate(GetMethod(implObj, "OnNavigationComplete"), flags, 2)
        this.vtbl.OnNavigationFailed := CallbackCreate(GetMethod(implObj, "OnNavigationFailed"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnNavigationPending)
        CallbackFree(this.vtbl.OnViewCreated)
        CallbackFree(this.vtbl.OnNavigationComplete)
        CallbackFree(this.vtbl.OnNavigationFailed)
    }
}
