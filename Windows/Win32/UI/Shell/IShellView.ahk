#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HWND.ahk
#Include .\FOLDERSETTINGS.ahk
#Include ..\..\System\Ole\IOleWindow.ahk

/**
 * Exposes methods that present a view in the Windows Explorer or folder windows.
 * @remarks
 * The object that exposes <b>IShellView</b> is typically created by a call to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder-createviewobject">IShellFolder::CreateViewObject</a> method. This provides the channel of communication between a view object and Windows Explorer's outermost frame window. The communication involves the translation of messages, the state of the frame window (activated or deactivated), the state of the document window (activated or deactivated), and the merging of menus and toolbar items.
 * 
 * This interface is implemented by namespace extensions that display themselves in Windows Explorer's namespace. This object is created by the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a> object that hosts the view.
 * 
 * These methods are used by the Shell view's Windows Explorer window to manipulate objects while they are active.
 * 
 * <b>IShellView</b> is derived from <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-iolewindow">IOleWindow</a>. The listed methods are specific to <b>IShellView</b>.
 * 
 * A special instance of <b>IShellView</b> known as the default Shell folder view object can be created by calling <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-shcreateshellfolderview">SHCreateShellFolderView</a> or <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-shcreateshellfolderviewex">SHCreateShellFolderViewEx</a>. This instance can be differentiated from standard implementations by calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> on an <b>IShellView</b> object using the IID_CDefView IID. This call succeeds only when made on the default Shell folder view object.
 * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nn-shobjidl_core-ishellview
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
     * @remarks
     * This method is called by Windows Explorer to let the view translate its keyboard shortcuts.
     * 
     * <h3><a id="Notes_to_Calling_Applications"></a><a id="notes_to_calling_applications"></a><a id="NOTES_TO_CALLING_APPLICATIONS"></a>Notes to Calling Applications</h3>
     * Windows Explorer calls this method before any other translation if the view has the focus. If the view does not have the focus, it is called after Windows Explorer translates its own keyboard shortcuts.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * By default, the view should return S_FALSE so that Windows Explorer can either do its own keyboard shortcut translation or normal menu dispatching. The view should return S_OK only if it has processed the message as the keyboard shortcut and does not want Windows Explorer to process it further.
     * @param {Pointer<MSG>} pmsg Type: <b>LPMSG</b>
     * 
     * The address of the message to be translated.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or a COM-defined error value otherwise.
     * 
     * If the view returns S_OK, it indicates that the message was translated and should not be translated or dispatched by Windows Explorer.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-ishellview-translateaccelerator
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
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-ishellview-enablemodeless
     */
    EnableModeless(fEnable) {
        result := ComCall(6, this, "int", fEnable, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Called when the activation state of the view window is changed by an event that is not caused by the Shell view itself. For example, if the TAB key is pressed when the tree has the focus, the view should be given the focus.
     * @remarks
     * Before remerging menu items, the Shell view typically hooks the <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-setfocus">WM_SETFOCUS</a> message and calls the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellbrowser-onviewwindowactive">OnViewWindowActive</a> method. The Shell view should not hook the <a href="https://docs.microsoft.com/windows/desktop/Controls/nm-killfocus">NM_KILLFOCUS</a> message to remerge menu items.
     * 
     * <h3><a id="Notes_to_Calling_Applications"></a><a id="notes_to_calling_applications"></a><a id="NOTES_TO_CALLING_APPLICATIONS"></a>Notes to Calling Applications</h3>
     * Call this method to inform the view of an activation state change.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * Use this method to track the activation state and change any behavior, as appropriate.
     * @param {Integer} uState Type: <b>UINT</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns <b>S_OK</b> if successful, or a COM-defined error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-ishellview-uiactivate
     */
    UIActivate(uState) {
        result := ComCall(7, this, "uint", uState, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Refreshes the view's contents in response to user input.
     * @remarks
     * Tells the view to refresh its contents, revalidating any view information it has.
     * 
     * <h3><a id="Note_to_Calling_Applications"></a><a id="note_to_calling_applications"></a><a id="NOTE_TO_CALLING_APPLICATIONS"></a>Note to Calling Applications</h3>
     * Windows Explorer calls this method when the F5 key is pressed on an already open view.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * Refill the view by going to any underlying storage for the contents.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or a COM-defined error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-ishellview-refresh
     */
    Refresh() {
        result := ComCall(8, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Creates a view window. This can be either the right pane of Windows Explorer or the client window of a folder window.
     * @remarks
     * <h3><a id="Notes_to_Calling_applications"></a><a id="notes_to_calling_applications"></a><a id="NOTES_TO_CALLING_APPLICATIONS"></a>Notes to Calling applications</h3>
     * Call this method when the view needs to be created.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * Create your view window and restore any persistent state by calling the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellbrowser-getviewstatestream">GetViewStateStream</a> method. Store the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellbrowser">IShellBrowser</a> pointer for further use.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-ishellview-createviewwindow
     */
    CreateViewWindow(psvPrevious, pfs, psb, prcView) {
        phWnd := HWND()
        result := ComCall(9, this, "ptr", psvPrevious, "ptr", pfs, "ptr", psb, "ptr", prcView, "ptr", phWnd, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return phWnd
    }

    /**
     * Destroys the view window.
     * @remarks
     * Windows Explorer calls this method when a folder window or Windows Explorer is being closed.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * Clean up all states that represent the view, including the window and any other associated resources.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or a COM-defined error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-ishellview-destroyviewwindow
     */
    DestroyViewWindow() {
        result := ComCall(10, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the current folder settings.
     * @remarks
     * Windows Explorer uses this method to query the view for standard settings.
     * 
     * <h3><a id="Note_to_Calling_Applications"></a><a id="note_to_calling_applications"></a><a id="NOTE_TO_CALLING_APPLICATIONS"></a>Note to Calling Applications</h3>
     * This method is used to retrieve the current view settings of the view.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * Return as many of the settings as apply. This is intended to maintain the same basic settings when the user browses from view to view. For example, if the user sets the Details view, that view should be maintained as the user goes from one folder to the other in Windows Explorer mode.
     * @returns {FOLDERSETTINGS} Type: <b>LPFOLDERSETTINGS</b>
     * 
     * The address of a <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-foldersettings">FOLDERSETTINGS</a> structure to receive the settings.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-ishellview-getcurrentinfo
     */
    GetCurrentInfo() {
        pfs := FOLDERSETTINGS()
        result := ComCall(11, this, "ptr", pfs, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfs
    }

    /**
     * Allows the view to add pages to the Options property sheet from the View menu.
     * @remarks
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * Windows Explorer calls this method when it is opening the <b>Options</b> property sheet from the <b>View</b> menu. Views can add pages by creating them and calling the callback function with the page handles.
     * @param {Integer} dwReserved Type: <b>DWORD</b>
     * 
     * Reserved.
     * @param {Pointer<LPFNSVADDPROPSHEETPAGE>} pfn_ Type: <b>LPFNADDPROPSHEETPAGE</b>
     * 
     * The address of the callback function used to add the pages.
     * @param {LPARAM} lparam_ Type: <b>LPARAM</b>
     * 
     * A value that must be passed as the callback function's <i>lparam</i> parameter.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or a COM-defined error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-ishellview-addpropertysheetpages
     */
    AddPropertySheetPages(dwReserved, pfn_, lparam_) {
        lparam_ := lparam_ is Win32Handle ? NumGet(lparam_, "ptr") : lparam_

        result := ComCall(12, this, "uint", dwReserved, "ptr", pfn_, "ptr", lparam_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Saves the Shell's view settings so the current state can be restored during a subsequent browsing session.
     * @remarks
     * The Shell view obtains a view stream by calling the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellbrowser-getviewstatestream">GetViewStateStream</a> method and stores the current view state in that stream.
     * 
     * <h3><a id="Note_to_Calling_Applications"></a><a id="note_to_calling_applications"></a><a id="NOTE_TO_CALLING_APPLICATIONS"></a>Note to Calling Applications</h3>
     * Windows Explorer calls this method when it wants to save the view state for a view.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * Be sure to make the format of the data stored in the stream robust enough that different versions of the implementation can read it without error.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or a COM-defined error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-ishellview-saveviewstate
     */
    SaveViewState() {
        result := ComCall(13, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Changes the selection state of one or more items within the Shell view window.
     * @remarks
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * This method is used to implement the Target command from the <b>File</b> menu of the Shell shortcut property sheet.
     * @param {Pointer<ITEMIDLIST>} pidlItem Type: <b>PCUITEMID_CHILD</b>
     * 
     * The address of the <a href="https://docs.microsoft.com/windows/desktop/api/shtypes/ns-shtypes-itemidlist">ITEMIDLIST</a> structure.
     * @param {Integer} uFlags Type: <b>UINT</b>
     * 
     * One of the <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_svsif">_SVSIF</a> constants that specify the type of selection to apply.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-ishellview-selectitem
     */
    SelectItem(pidlItem, uFlags) {
        result := ComCall(14, this, "ptr", pidlItem, "uint", uFlags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets an interface that refers to data presented in the view.
     * @remarks
     * Used by the common dialog boxes to retrieve the selected items from the view.
     * @param {Integer} uItem Type: <b>UINT</b>
     * 
     * The constants that refer to an aspect of the view. This parameter can be any one of the <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_svgio">_SVGIO</a> constants.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The identifier of the COM interface being requested.
     * @returns {Pointer<Pointer<Void>>} Type: <b>LPVOID*</b>
     * 
     * The address that receives the interface pointer. If an error occurs, the pointer returned must be <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-ishellview-getitemobject
     */
    GetItemObject(uItem, riid) {
        result := ComCall(15, this, "uint", uItem, "ptr", riid, "ptr*", &ppv := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppv
    }
}
