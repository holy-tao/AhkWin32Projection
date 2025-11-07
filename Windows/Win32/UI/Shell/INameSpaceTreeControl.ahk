#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IShellItemArray.ahk
#Include .\IShellItem.ahk
#Include ..\..\Foundation\RECT.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods used to view and manipulate nodes in a tree of Shell items.
 * @remarks
 * 
 * To implement this interface use class ID CLSID_NameSpaceTreeControl.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-inamespacetreecontrol
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class INameSpaceTreeControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INameSpaceTreeControl
     * @type {Guid}
     */
    static IID => Guid("{028212a3-b627-47e9-8856-c14265554e4f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "TreeAdvise", "TreeUnadvise", "AppendRoot", "InsertRoot", "RemoveRoot", "RemoveAllRoots", "GetRootItems", "SetItemState", "GetItemState", "GetSelectedItems", "GetItemCustomState", "SetItemCustomState", "EnsureItemVisible", "SetTheme", "GetNextItem", "HitTest", "GetItemRect", "CollapseAll"]

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {HWND} hwndParent 
     * @param {Pointer<RECT>} prc 
     * @param {Integer} nsctsFlags 
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
    Initialize(hwndParent, prc, nsctsFlags) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(3, this, "ptr", hwndParent, "ptr", prc, "uint", nsctsFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} punk 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-inamespacetreecontrol-treeadvise
     */
    TreeAdvise(punk) {
        result := ComCall(4, this, "ptr", punk, "uint*", &pdwCookie := 0, "HRESULT")
        return pdwCookie
    }

    /**
     * 
     * @param {Integer} dwCookie 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-inamespacetreecontrol-treeunadvise
     */
    TreeUnadvise(dwCookie) {
        result := ComCall(5, this, "uint", dwCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IShellItem} psiRoot 
     * @param {Integer} grfEnumFlags 
     * @param {Integer} grfRootStyle 
     * @param {IShellItemFilter} pif 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-inamespacetreecontrol-appendroot
     */
    AppendRoot(psiRoot, grfEnumFlags, grfRootStyle, pif) {
        result := ComCall(6, this, "ptr", psiRoot, "uint", grfEnumFlags, "uint", grfRootStyle, "ptr", pif, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iIndex 
     * @param {IShellItem} psiRoot 
     * @param {Integer} grfEnumFlags 
     * @param {Integer} grfRootStyle 
     * @param {IShellItemFilter} pif 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-inamespacetreecontrol-insertroot
     */
    InsertRoot(iIndex, psiRoot, grfEnumFlags, grfRootStyle, pif) {
        result := ComCall(7, this, "int", iIndex, "ptr", psiRoot, "uint", grfEnumFlags, "uint", grfRootStyle, "ptr", pif, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IShellItem} psiRoot 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-inamespacetreecontrol-removeroot
     */
    RemoveRoot(psiRoot) {
        result := ComCall(8, this, "ptr", psiRoot, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-inamespacetreecontrol-removeallroots
     */
    RemoveAllRoots() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IShellItemArray} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-inamespacetreecontrol-getrootitems
     */
    GetRootItems() {
        result := ComCall(10, this, "ptr*", &ppsiaRootItems := 0, "HRESULT")
        return IShellItemArray(ppsiaRootItems)
    }

    /**
     * 
     * @param {IShellItem} psi 
     * @param {Integer} nstcisMask 
     * @param {Integer} nstcisFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-inamespacetreecontrol-setitemstate
     */
    SetItemState(psi, nstcisMask, nstcisFlags) {
        result := ComCall(11, this, "ptr", psi, "uint", nstcisMask, "uint", nstcisFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IShellItem} psi 
     * @param {Integer} nstcisMask 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-inamespacetreecontrol-getitemstate
     */
    GetItemState(psi, nstcisMask) {
        result := ComCall(12, this, "ptr", psi, "uint", nstcisMask, "uint*", &pnstcisFlags := 0, "HRESULT")
        return pnstcisFlags
    }

    /**
     * 
     * @returns {IShellItemArray} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-inamespacetreecontrol-getselecteditems
     */
    GetSelectedItems() {
        result := ComCall(13, this, "ptr*", &psiaItems := 0, "HRESULT")
        return IShellItemArray(psiaItems)
    }

    /**
     * 
     * @param {IShellItem} psi 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-inamespacetreecontrol-getitemcustomstate
     */
    GetItemCustomState(psi) {
        result := ComCall(14, this, "ptr", psi, "int*", &piStateNumber := 0, "HRESULT")
        return piStateNumber
    }

    /**
     * 
     * @param {IShellItem} psi 
     * @param {Integer} iStateNumber 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-inamespacetreecontrol-setitemcustomstate
     */
    SetItemCustomState(psi, iStateNumber) {
        result := ComCall(15, this, "ptr", psi, "int", iStateNumber, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IShellItem} psi 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-inamespacetreecontrol-ensureitemvisible
     */
    EnsureItemVisible(psi) {
        result := ComCall(16, this, "ptr", psi, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszTheme 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-inamespacetreecontrol-settheme
     */
    SetTheme(pszTheme) {
        pszTheme := pszTheme is String ? StrPtr(pszTheme) : pszTheme

        result := ComCall(17, this, "ptr", pszTheme, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IShellItem} psi 
     * @param {Integer} nstcgi 
     * @returns {IShellItem} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-inamespacetreecontrol-getnextitem
     */
    GetNextItem(psi, nstcgi) {
        result := ComCall(18, this, "ptr", psi, "int", nstcgi, "ptr*", &ppsiNext := 0, "HRESULT")
        return IShellItem(ppsiNext)
    }

    /**
     * 
     * @param {Pointer<POINT>} ppt 
     * @returns {IShellItem} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-inamespacetreecontrol-hittest
     */
    HitTest(ppt) {
        result := ComCall(19, this, "ptr", ppt, "ptr*", &ppsiOut := 0, "HRESULT")
        return IShellItem(ppsiOut)
    }

    /**
     * 
     * @param {IShellItem} psi 
     * @returns {RECT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-inamespacetreecontrol-getitemrect
     */
    GetItemRect(psi) {
        prect := RECT()
        result := ComCall(20, this, "ptr", psi, "ptr", prect, "HRESULT")
        return prect
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-inamespacetreecontrol-collapseall
     */
    CollapseAll() {
        result := ComCall(21, this, "HRESULT")
        return result
    }
}
