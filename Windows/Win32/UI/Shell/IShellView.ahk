#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<MSG>} pmsg 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellview-translateaccelerator
     */
    TranslateAccelerator(pmsg) {
        result := ComCall(5, this, "ptr", pmsg, "int")
        return result
    }

    /**
     * 
     * @param {BOOL} fEnable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellview-enablemodeless
     */
    EnableModeless(fEnable) {
        result := ComCall(6, this, "int", fEnable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} uState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellview-uiactivate
     */
    UIActivate(uState) {
        result := ComCall(7, this, "uint", uState, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellview-refresh
     */
    Refresh() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IShellView} psvPrevious 
     * @param {Pointer<FOLDERSETTINGS>} pfs 
     * @param {IShellBrowser} psb 
     * @param {Pointer<RECT>} prcView 
     * @param {Pointer<HWND>} phWnd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellview-createviewwindow
     */
    CreateViewWindow(psvPrevious, pfs, psb, prcView, phWnd) {
        result := ComCall(9, this, "ptr", psvPrevious, "ptr", pfs, "ptr", psb, "ptr", prcView, "ptr", phWnd, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellview-destroyviewwindow
     */
    DestroyViewWindow() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<FOLDERSETTINGS>} pfs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellview-getcurrentinfo
     */
    GetCurrentInfo(pfs) {
        result := ComCall(11, this, "ptr", pfs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwReserved 
     * @param {Pointer<LPFNSVADDPROPSHEETPAGE>} pfn 
     * @param {LPARAM} lparam 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellview-addpropertysheetpages
     */
    AddPropertySheetPages(dwReserved, pfn, lparam) {
        result := ComCall(12, this, "uint", dwReserved, "ptr", pfn, "ptr", lparam, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellview-saveviewstate
     */
    SaveViewState() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITEMIDLIST>} pidlItem 
     * @param {Integer} uFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellview-selectitem
     */
    SelectItem(pidlItem, uFlags) {
        result := ComCall(14, this, "ptr", pidlItem, "uint", uFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} uItem 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppv 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellview-getitemobject
     */
    GetItemObject(uItem, riid, ppv) {
        result := ComCall(15, this, "uint", uItem, "ptr", riid, "ptr*", ppv, "HRESULT")
        return result
    }
}
