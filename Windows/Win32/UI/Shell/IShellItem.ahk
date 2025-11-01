#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that retrieve information about a Shell item. IShellItem and IShellItem2 are the preferred representations of items in any new code.
 * @remarks
 * 
  * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
  * Third parties do not implement this interface; only use the implementation provided with the system.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-ishellitem
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IShellItem extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IShellItem
     * @type {Guid}
     */
    static IID => Guid("{43826d1e-e718-42ee-bc55-a1e261c37bfe}")

    /**
     * The class identifier for ShellItem
     * @type {Guid}
     */
    static CLSID => Guid("{9ac9fbe1-e0a2-4ad6-b4ee-e212013ea917}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["BindToHandler", "GetParent", "GetDisplayName", "GetAttributes", "Compare"]

    /**
     * 
     * @param {IBindCtx} pbc 
     * @param {Pointer<Guid>} bhid 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppv 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitem-bindtohandler
     */
    BindToHandler(pbc, bhid, riid, ppv) {
        result := ComCall(3, this, "ptr", pbc, "ptr", bhid, "ptr", riid, "ptr*", ppv, "HRESULT")
        return result
    }

    /**
     * Retrieves a handle to the specified window's parent or owner.
     * @param {Pointer<IShellItem>} ppsi 
     * @returns {HRESULT} Type: <b>HWND</b>
     * 
     * If the window is a child window, the return value is a handle to the parent window. If the window is a top-level window with the <b>WS_POPUP</b> style, the return value is a handle to the owner window. 
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * This function typically fails for one of the following reasons:
     * 
     * 
     * <ul>
     * <li>The window is a top-level window that is unowned or does not have the <b>WS_POPUP</b> style. </li>
     * <li>The owner window has <b>WS_POPUP</b> style.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getparent
     */
    GetParent(ppsi) {
        result := ComCall(4, this, "ptr*", ppsi, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} sigdnName 
     * @param {Pointer<PWSTR>} ppszName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitem-getdisplayname
     */
    GetDisplayName(sigdnName, ppszName) {
        result := ComCall(5, this, "int", sigdnName, "ptr", ppszName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} sfgaoMask 
     * @param {Pointer<Integer>} psfgaoAttribs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitem-getattributes
     */
    GetAttributes(sfgaoMask, psfgaoAttribs) {
        psfgaoAttribsMarshal := psfgaoAttribs is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "uint", sfgaoMask, psfgaoAttribsMarshal, psfgaoAttribs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IShellItem} psi 
     * @param {Integer} hint 
     * @param {Pointer<Integer>} piOrder 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitem-compare
     */
    Compare(psi, hint, piOrder) {
        piOrderMarshal := piOrder is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, "ptr", psi, "uint", hint, piOrderMarshal, piOrder, "HRESULT")
        return result
    }
}
