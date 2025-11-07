#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * IExplorerBrowser is a browser object that can be either navigated or that can host a view of a data object. As a full-featured browser object, it also supports an automatic travel log.
 * @remarks
 * 
  * For example code that shows typical use of <b>IExplorerBrowser</b> and its methods, see the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd940357(v=vs.85)">Explorer Browser Custom Contents</a> and Explorer Browser Custom Contents samples.
  * 
  * After calling this object's <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iexplorerbrowser-initialize">Initialize</a> method, its <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iexplorerbrowser-destroy">Destroy</a> method must be called to free any windowed resources that were generated in the call to <b>Initialize</b>.
  * 
  * The object that hosts the ExplorerBrowser object should derive from <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/cc678965(v=vs.85)">IServiceProvider</a> and implement <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/cc678966(v=vs.85)">QueryService</a> to respond to any queries for service. For example, the number of panes shown by the browser can be controlled by implementing <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iexplorerpanevisibility">IExplorerPaneVisibility</a> and responding to any SID_ExplorerPaneVisibility service requests.
  * 
  * Frames are disabled by default. To enable frames and get the default set of panes, set the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-explorer_browser_options">EBO_SHOWFRAMES</a> flag using the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iexplorerbrowser-setoptions">IExplorerBrowser::SetOptions</a> method. The default panes, listed as <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iexplorerpanevisibility">IExplorerPaneVisibility</a> constants, are these: 
  * 
  *                 
  * 
  * <ul>
  * <li>EP_NavPane</li>
  * <li>EP_Commands</li>
  * <li>EP_Commands_Organize</li>
  * <li>EP_Commands_View</li>
  * <li>EP_DetailsPane</li>
  * <li>EP_PreviewPane</li>
  * <li>EP_QueryPane</li>
  * <li>EP_AdvQueryPane</li>
  * <li>EP_StatusBar</li>
  * <li>EP_Ribbon</li>
  * </ul>
  * See <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iexplorerpanevisibility-getpanestate">IExplorerPaneVisibility::GetPaneState</a> for more information.
  * 
  * Clients of the ExplorerBrowser object can implement the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-icommdlgbrowser">ICommDlgBrowser</a>, <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-icommdlgbrowser2">ICommDlgBrowser2</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/nn-shobjidl-icommdlgbrowser3">ICommDlgBrowser3</a> interfaces and respond to an SID_SExplorerBrowserFrame service request in their QueryService implementations that are called when any <b>ICommDlgBrowser</b> interfaces are called on the browser (usually called from the view as a result of user actions). Note that the client does not receive a call to <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-icommdlgbrowser-includeobject">ICommDlgBrowser::IncludeObject</a> if a folder filter has been set on the browser by a call to <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifolderfiltersite-setfilter">IFolderFilterSite::SetFilter</a>.
  * 
  * To remain compatible with some older applications, the default Shell view (DefView) performs filtering operations (for example, searching operations executed by a search folder) on the UI thread. For new applications, this is typically not desired; the search should execute on a background thread. To stop the UI thread from filtering and instead run filtering on a background thread, provide <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-icommdlgbrowser2">ICommDlgBrowser2</a> through the SID_SExplorerBrowserFrame service request. When <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-icommdlgbrowser2-getviewflags">ICommDlgBrowser2::GetViewFlags</a> is called, it should return CDB2GVF_NOINCLUDEITEM. For example, if you navigate to a search folder in ExplorerBrowser and you do not return CDB2GVF_NOINCLUDEITEM, the view can stop responding until the entire search is complete.
  * 
  * The Shell architecture has three main components: the browser, the views, and the data sources (for example, IShellFolder). The ExplorerBrowser object maintains the current location and navigation to other locations throughout the Shell namespace. It also keeps a travel log (forward and back history). The browser is notified when things happen in the view; for example, when the user double-clicks a folder. In response, the browser navigates to that location. The data sources are the objects that supply the items and folders in the namespace. They also have information about the location, such as the properties of the items and what to add to the context menu when the view requests it. Additionally, the data sources know what view should be created to represent their items at a location. In almost all instances, the folders create the Shell's default view (DefView). Therefore, as the browser navigates, it receives an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a> object for the new location and asks it what view to create. The browser then creates that view and makes it visible, while hiding and then destroying the view that was showing the previous location. The view is responsible for communicating with <b>IShellFolder</b> for the current location and requesting it to enumerate the items, which allows the view to show these items to the user. As the user interacts with the items, the view communicates with the <b>IShellFolder</b> to get any additional information it needs, such as specific properties of the items or the context menu entries for the item.
  * 
  * If an application uses the default implementation provided by CLSID_ExplorerBrowser, inserting it into the window of an application and then browsing to a location, ExplorerBrowser creates the proper <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a> as specified by the location that it is browsing to. The application can then ask ExplorerBrowser to give it an interface on the current view, allowing the application to manipulate the view directly if required. The default implementation of the Windows Explorer view object, created by <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-shcreateshellfolderviewex">SHCreateShellFolderViewEx</a>, supports the interface <b>IShellView</b>. You may verify that you have the default Shell folder view object by calling <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iexplorerbrowser-getcurrentview">IExplorerBrowser::GetCurrentView</a> and then calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> on the object returned using the interface ID IID_CDefView.
  * 
  * <b>Windows 7 and later</b>. CExplorerBrowser can support in-place navigation by using <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/cc678966(v=vs.85)">IServiceProvider::QueryService</a> with the Service ID SID_SlnPlaceBrowser. When using SID_SInPlaceBrowser, the CExplorerBrowser state cannot be set to EBO_NAVIGATEONCE.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-iexplorerbrowser
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IExplorerBrowser extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IExplorerBrowser
     * @type {Guid}
     */
    static IID => Guid("{dfd3b6b5-c10c-4be9-85f6-a66969f402f6}")

    /**
     * The class identifier for ExplorerBrowser
     * @type {Guid}
     */
    static CLSID => Guid("{71f96385-ddd6-48d3-a0c1-ae06e8b055fb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "Destroy", "SetRect", "SetPropertyBag", "SetEmptyText", "SetFolderSettings", "Advise", "Unadvise", "SetOptions", "GetOptions", "BrowseToIDList", "BrowseToObject", "FillFromObject", "RemoveAll", "GetCurrentView"]

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {HWND} hwndParent 
     * @param {Pointer<RECT>} prc 
     * @param {Pointer<FOLDERSETTINGS>} pfs 
     * @returns {HRESULT} <ul>
     * <li><b>S_OK</b> - Successfully initialized for the first time on the current thread</li>
     * <li><b>S_FALSE</b> - Successful nested initialization (current thread was already 
     *         initialized for the specified apartment type)</li>
     * <li><b>E_INVALIDARG</b> - Invalid <i>initType</i> value</li>
     * <li><b>CO_E_INIT_TLS</b> - Failed to allocate COM's internal TLS structure</li>
     * <li><b>E_OUTOFMEMORY</b> - Failed to allocate per-thread/per-apartment structures other 
     *         than the TLS</li>
     * <li><b>RPC_E_CHANGED_MODE</b> - The current thread is already initialized for a different 
     *         apartment type from what is specified.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//roapi/nf-roapi-initialize
     */
    Initialize(hwndParent, prc, pfs) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(3, this, "ptr", hwndParent, "ptr", prc, "ptr", pfs, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iexplorerbrowser-destroy
     */
    Destroy() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * The SetRect function sets the coordinates of the specified rectangle. This is equivalent to assigning the left, top, right, and bottom arguments to the appropriate members of the RECT structure.
     * @param {Pointer<HDWP>} phdwp 
     * @param {RECT} rcBrowser 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-setrect
     */
    SetRect(phdwp, rcBrowser) {
        result := ComCall(5, this, "ptr", phdwp, "ptr", rcBrowser, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszPropertyBag 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iexplorerbrowser-setpropertybag
     */
    SetPropertyBag(pszPropertyBag) {
        pszPropertyBag := pszPropertyBag is String ? StrPtr(pszPropertyBag) : pszPropertyBag

        result := ComCall(6, this, "ptr", pszPropertyBag, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszEmptyText 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iexplorerbrowser-setemptytext
     */
    SetEmptyText(pszEmptyText) {
        pszEmptyText := pszEmptyText is String ? StrPtr(pszEmptyText) : pszEmptyText

        result := ComCall(7, this, "ptr", pszEmptyText, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<FOLDERSETTINGS>} pfs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iexplorerbrowser-setfoldersettings
     */
    SetFolderSettings(pfs) {
        result := ComCall(8, this, "ptr", pfs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IExplorerBrowserEvents} psbe 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iexplorerbrowser-advise
     */
    Advise(psbe) {
        result := ComCall(9, this, "ptr", psbe, "uint*", &pdwCookie := 0, "HRESULT")
        return pdwCookie
    }

    /**
     * 
     * @param {Integer} dwCookie 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iexplorerbrowser-unadvise
     */
    Unadvise(dwCookie) {
        result := ComCall(10, this, "uint", dwCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlag 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iexplorerbrowser-setoptions
     */
    SetOptions(dwFlag) {
        result := ComCall(11, this, "int", dwFlag, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iexplorerbrowser-getoptions
     */
    GetOptions() {
        result := ComCall(12, this, "int*", &pdwFlag := 0, "HRESULT")
        return pdwFlag
    }

    /**
     * 
     * @param {Pointer<ITEMIDLIST>} pidl 
     * @param {Integer} uFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iexplorerbrowser-browsetoidlist
     */
    BrowseToIDList(pidl, uFlags) {
        result := ComCall(13, this, "ptr", pidl, "uint", uFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} punk 
     * @param {Integer} uFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iexplorerbrowser-browsetoobject
     */
    BrowseToObject(punk, uFlags) {
        result := ComCall(14, this, "ptr", punk, "uint", uFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} punk 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iexplorerbrowser-fillfromobject
     */
    FillFromObject(punk, dwFlags) {
        result := ComCall(15, this, "ptr", punk, "int", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iexplorerbrowser-removeall
     */
    RemoveAll() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iexplorerbrowser-getcurrentview
     */
    GetCurrentView(riid) {
        result := ComCall(17, this, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }
}
