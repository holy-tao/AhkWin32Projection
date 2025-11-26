#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HWND.ahk
#Include .\FOLDERSETTINGS.ahk
#Include ..\..\System\Ole\IOleWindow.ahk

/**
 * Exposes methods that present a view in the Windows Explorer or folder windows.
 * @remarks
 * 
 * The object that exposes <b>IShellView</b> is typically created by a call to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder-createviewobject">IShellFolder::CreateViewObject</a> method. This provides the channel of communication between a view object and Windows Explorer's outermost frame window. The communication involves the translation of messages, the state of the frame window (activated or deactivated), the state of the document window (activated or deactivated), and the merging of menus and toolbar items.
 * 
 * This interface is implemented by namespace extensions that display themselves in Windows Explorer's namespace. This object is created by the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a> object that hosts the view.
 * 
 * These methods are used by the Shell view's Windows Explorer window to manipulate objects while they are active.
 * 
 * <b>IShellView</b> is derived from <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-iolewindow">IOleWindow</a>. The listed methods are specific to <b>IShellView</b>.
 * 
 * A special instance of <b>IShellView</b> known as the default Shell folder view object can be created by calling <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-shcreateshellfolderview">SHCreateShellFolderView</a> or <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-shcreateshellfolderviewex">SHCreateShellFolderViewEx</a>. This instance can be differentiated from standard implementations by calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> on an <b>IShellView</b> object using the IID_CDefView IID. This call succeeds only when made on the default Shell folder view object.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-ishellview
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IShellView extends IOleWindow{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IShellView
     * @type {Guid}
     */
    static IID => Guid("{000214e3-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TranslateAccelerator", "EnableModeless", "UIActivate", "Refresh", "CreateViewWindow", "DestroyViewWindow", "GetCurrentInfo", "AddPropertySheetPages", "SaveViewState", "SelectItem", "GetItemObject"]

    /**
     * Translates keyboard shortcut (accelerator) key strokes when a namespace extension's view has the focus.
     * @param {Pointer<MSG>} pmsg Type: <b>LPMSG</b>
     * 
     * The address of the message to be translated.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or a COM-defined error value otherwise.
     * 
     * If the view returns S_OK, it indicates that the message was translated and should not be translated or dispatched by Windows Explorer.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellview-translateaccelerator
     */
    TranslateAccelerator(pmsg) {
        result := ComCall(5, this, "ptr", pmsg, "int")
        return result
    }

    /**
     * Enables or disables modeless dialog boxes. This method is not currently implemented.
     * @param {BOOL} fEnable Type: <b>BOOL</b>
     * 
     * Nonzero to enable modeless dialog box windows or zero to disable them.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or a COM-defined error value otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellview-enablemodeless
     */
    EnableModeless(fEnable) {
        result := ComCall(6, this, "int", fEnable, "HRESULT")
        return result
    }

    /**
     * Called when the activation state of the view window is changed by an event that is not caused by the Shell view itself. For example, if the TAB key is pressed when the tree has the focus, the view should be given the focus.
     * @param {Integer} uState Type: <b>UINT</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns <b>S_OK</b> if successful, or a COM-defined error value otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellview-uiactivate
     */
    UIActivate(uState) {
        result := ComCall(7, this, "uint", uState, "HRESULT")
        return result
    }

    /**
     * Refreshes the view's contents in response to user input.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or a COM-defined error value otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellview-refresh
     */
    Refresh() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * Creates a view window. This can be either the right pane of Windows Explorer or the client window of a folder window.
     * @param {IShellView} psvPrevious Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a>*</b>
     * 
     * The address of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a> interface of the view window being exited. Views can use this parameter to communicate with a previous view of the same implementation. This interface can be used to optimize browsing between like views. This pointer may be <b>NULL</b>.
     * @param {Pointer<FOLDERSETTINGS>} pfs Type: <b>LPCFOLDERSETTINGS</b>
     * 
     * The address of a <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-foldersettings">FOLDERSETTINGS</a> structure. The view should use this when creating its view.
     * @param {IShellBrowser} psb Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellbrowser">IShellBrowser</a>*</b>
     * 
     * The address of the current instance of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellbrowser">IShellBrowser</a> interface. The view should call this interface's <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> method and keep the interface pointer to allow communication with the Windows Explorer window.
     * @param {Pointer<RECT>} prcView Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>*</b>
     * 
     * The dimensions of the new view, in client coordinates.
     * @returns {HWND} Type: <b>HWND*</b>
     * 
     * The address of the window handle being created.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellview-createviewwindow
     */
    CreateViewWindow(psvPrevious, pfs, psb, prcView) {
        phWnd := HWND()
        result := ComCall(9, this, "ptr", psvPrevious, "ptr", pfs, "ptr", psb, "ptr", prcView, "ptr", phWnd, "HRESULT")
        return phWnd
    }

    /**
     * Destroys the view window.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or a COM-defined error value otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellview-destroyviewwindow
     */
    DestroyViewWindow() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * Gets the current folder settings.
     * @returns {FOLDERSETTINGS} Type: <b>LPFOLDERSETTINGS</b>
     * 
     * The address of a <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-foldersettings">FOLDERSETTINGS</a> structure to receive the settings.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellview-getcurrentinfo
     */
    GetCurrentInfo() {
        pfs := FOLDERSETTINGS()
        result := ComCall(11, this, "ptr", pfs, "HRESULT")
        return pfs
    }

    /**
     * Allows the view to add pages to the Options property sheet from the View menu.
     * @param {Integer} dwReserved Type: <b>DWORD</b>
     * 
     * Reserved.
     * @param {Pointer<LPFNSVADDPROPSHEETPAGE>} pfn Type: <b>LPFNADDPROPSHEETPAGE</b>
     * 
     * The address of the callback function used to add the pages.
     * @param {LPARAM} lparam Type: <b>LPARAM</b>
     * 
     * A value that must be passed as the callback function's <i>lparam</i> parameter.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or a COM-defined error value otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellview-addpropertysheetpages
     */
    AddPropertySheetPages(dwReserved, pfn, lparam) {
        result := ComCall(12, this, "uint", dwReserved, "ptr", pfn, "ptr", lparam, "HRESULT")
        return result
    }

    /**
     * Saves the Shell's view settings so the current state can be restored during a subsequent browsing session.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or a COM-defined error value otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellview-saveviewstate
     */
    SaveViewState() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * Changes the selection state of one or more items within the Shell view window.
     * @param {Pointer<ITEMIDLIST>} pidlItem Type: <b>PCUITEMID_CHILD</b>
     * 
     * The address of the <a href="https://docs.microsoft.com/windows/desktop/api/shtypes/ns-shtypes-itemidlist">ITEMIDLIST</a> structure.
     * @param {Integer} uFlags Type: <b>UINT</b>
     * 
     * One of the <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_svsif">_SVSIF</a> constants that specify the type of selection to apply.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellview-selectitem
     */
    SelectItem(pidlItem, uFlags) {
        result := ComCall(14, this, "ptr", pidlItem, "uint", uFlags, "HRESULT")
        return result
    }

    /**
     * Gets an interface that refers to data presented in the view.
     * @param {Integer} uItem Type: <b>UINT</b>
     * 
     * The constants that refer to an aspect of the view. This parameter can be any one of the <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_svgio">_SVGIO</a> constants.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The identifier of the COM interface being requested.
     * @returns {Pointer<Void>} Type: <b>LPVOID*</b>
     * 
     * The address that receives the interface pointer. If an error occurs, the pointer returned must be <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellview-getitemobject
     */
    GetItemObject(uItem, riid) {
        result := ComCall(15, this, "uint", uItem, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }
}
