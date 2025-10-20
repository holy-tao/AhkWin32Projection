#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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

        result := ComCall(3, this, "ptr", hwndParent, "ptr", prc, "uint", nsctsFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} punk 
     * @param {Pointer<UInt32>} pdwCookie 
     * @returns {HRESULT} 
     */
    TreeAdvise(punk, pdwCookie) {
        result := ComCall(4, this, "ptr", punk, "uint*", pdwCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwCookie 
     * @returns {HRESULT} 
     */
    TreeUnadvise(dwCookie) {
        result := ComCall(5, this, "uint", dwCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IShellItem>} psiRoot 
     * @param {Integer} grfEnumFlags 
     * @param {Integer} grfRootStyle 
     * @param {Pointer<IShellItemFilter>} pif 
     * @returns {HRESULT} 
     */
    AppendRoot(psiRoot, grfEnumFlags, grfRootStyle, pif) {
        result := ComCall(6, this, "ptr", psiRoot, "uint", grfEnumFlags, "uint", grfRootStyle, "ptr", pif, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iIndex 
     * @param {Pointer<IShellItem>} psiRoot 
     * @param {Integer} grfEnumFlags 
     * @param {Integer} grfRootStyle 
     * @param {Pointer<IShellItemFilter>} pif 
     * @returns {HRESULT} 
     */
    InsertRoot(iIndex, psiRoot, grfEnumFlags, grfRootStyle, pif) {
        result := ComCall(7, this, "int", iIndex, "ptr", psiRoot, "uint", grfEnumFlags, "uint", grfRootStyle, "ptr", pif, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IShellItem>} psiRoot 
     * @returns {HRESULT} 
     */
    RemoveRoot(psiRoot) {
        result := ComCall(8, this, "ptr", psiRoot, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RemoveAllRoots() {
        result := ComCall(9, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IShellItemArray>} ppsiaRootItems 
     * @returns {HRESULT} 
     */
    GetRootItems(ppsiaRootItems) {
        result := ComCall(10, this, "ptr", ppsiaRootItems, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IShellItem>} psi 
     * @param {Integer} nstcisMask 
     * @param {Integer} nstcisFlags 
     * @returns {HRESULT} 
     */
    SetItemState(psi, nstcisMask, nstcisFlags) {
        result := ComCall(11, this, "ptr", psi, "uint", nstcisMask, "uint", nstcisFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IShellItem>} psi 
     * @param {Integer} nstcisMask 
     * @param {Pointer<UInt32>} pnstcisFlags 
     * @returns {HRESULT} 
     */
    GetItemState(psi, nstcisMask, pnstcisFlags) {
        result := ComCall(12, this, "ptr", psi, "uint", nstcisMask, "uint*", pnstcisFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IShellItemArray>} psiaItems 
     * @returns {HRESULT} 
     */
    GetSelectedItems(psiaItems) {
        result := ComCall(13, this, "ptr", psiaItems, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IShellItem>} psi 
     * @param {Pointer<Int32>} piStateNumber 
     * @returns {HRESULT} 
     */
    GetItemCustomState(psi, piStateNumber) {
        result := ComCall(14, this, "ptr", psi, "int*", piStateNumber, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IShellItem>} psi 
     * @param {Integer} iStateNumber 
     * @returns {HRESULT} 
     */
    SetItemCustomState(psi, iStateNumber) {
        result := ComCall(15, this, "ptr", psi, "int", iStateNumber, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IShellItem>} psi 
     * @returns {HRESULT} 
     */
    EnsureItemVisible(psi) {
        result := ComCall(16, this, "ptr", psi, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszTheme 
     * @returns {HRESULT} 
     */
    SetTheme(pszTheme) {
        pszTheme := pszTheme is String ? StrPtr(pszTheme) : pszTheme

        result := ComCall(17, this, "ptr", pszTheme, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IShellItem>} psi 
     * @param {Integer} nstcgi 
     * @param {Pointer<IShellItem>} ppsiNext 
     * @returns {HRESULT} 
     */
    GetNextItem(psi, nstcgi, ppsiNext) {
        result := ComCall(18, this, "ptr", psi, "int", nstcgi, "ptr", ppsiNext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<POINT>} ppt 
     * @param {Pointer<IShellItem>} ppsiOut 
     * @returns {HRESULT} 
     */
    HitTest(ppt, ppsiOut) {
        result := ComCall(19, this, "ptr", ppt, "ptr", ppsiOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IShellItem>} psi 
     * @param {Pointer<RECT>} prect 
     * @returns {HRESULT} 
     */
    GetItemRect(psi, prect) {
        result := ComCall(20, this, "ptr", psi, "ptr", prect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CollapseAll() {
        result := ComCall(21, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
