#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods for notification of Explorer browser navigation and view creation events.
 * @remarks
 * 
  * Implement this interface to be notified of <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iexplorerbrowser">IExplorerBrowser</a> navigation and view creation events; implementation enables handling of these events, if desired.
  * 
  * 
  * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iexplorerbrowser">IExplorerBrowser</a> must be notified of implementers (clients) who want to be advised of <b>IExplorerBrowser</b> events. Clients do this by calling the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iexplorerbrowser-advise">IExplorerBrowser::Advise</a> method. This enables event callbacks by <b>IExplorerBrowser</b> to the client using the methods in <b>IExplorerBrowserEvents</b>. To stop event callbacks, the client must call method <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iexplorerbrowser-unadvise">IExplorerBrowser::Unadvise</a> or a memory leak may result.
  * 
  * During its first navigation (<a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iexplorerbrowser-browsetoobject">IExplorerBrowser::BrowseToObject</a>), Explorer calls the methods in this interface synchronously. After that, Explorer calls them asynchronously. The order of the event callbacks is as follows: <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iexplorerbrowserevents-onnavigationpending">IExplorerBrowserEvents::OnNavigationPending</a>; <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iexplorerbrowserevents-onviewcreated">IExplorerBrowserEvents::OnViewCreated</a>;
  * and <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iexplorerbrowserevents-onnavigationcomplete">IExplorerBrowserEvents::OnNavigationComplete</a> or <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iexplorerbrowserevents-onnavigationfailed">IExplorerBrowserEvents::OnNavigationFailed</a> depending on whether the navigation succeeded or failed.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-iexplorerbrowserevents
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IExplorerBrowserEvents extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IExplorerBrowserEvents
     * @type {Guid}
     */
    static IID => Guid("{361bbdc7-e6ee-4e13-be58-58e2240c810f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnNavigationPending", "OnViewCreated", "OnNavigationComplete", "OnNavigationFailed"]

    /**
     * 
     * @param {Pointer<ITEMIDLIST>} pidlFolder 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iexplorerbrowserevents-onnavigationpending
     */
    OnNavigationPending(pidlFolder) {
        result := ComCall(3, this, "ptr", pidlFolder, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IShellView} psv 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iexplorerbrowserevents-onviewcreated
     */
    OnViewCreated(psv) {
        result := ComCall(4, this, "ptr", psv, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITEMIDLIST>} pidlFolder 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iexplorerbrowserevents-onnavigationcomplete
     */
    OnNavigationComplete(pidlFolder) {
        result := ComCall(5, this, "ptr", pidlFolder, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITEMIDLIST>} pidlFolder 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iexplorerbrowserevents-onnavigationfailed
     */
    OnNavigationFailed(pidlFolder) {
        result := ComCall(6, this, "ptr", pidlFolder, "HRESULT")
        return result
    }
}
