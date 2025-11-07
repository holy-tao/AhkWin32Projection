#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to the collection of open Shell windows.
 * @remarks
 * 
  * A <i>Shell window</i> is a window that has been registered by calling <a href="https://docs.microsoft.com/windows/desktop/api/exdisp/nf-exdisp-ishellwindows-register">IShellWindows::Register</a> or <a href="https://docs.microsoft.com/windows/desktop/api/exdisp/nf-exdisp-ishellwindows-registerpending">IShellWindows::RegisterPending</a>. Upon registration, the specified window is added to the collection of Shell windows, and granted a cookie that uniquely identifies the window within the collection. A window can be un-registered by calling <a href="https://docs.microsoft.com/windows/desktop/api/exdisp/nf-exdisp-ishellwindows-revoke">IShellWindows::Revoke</a>.
  * 
  * The Shell windows collection includes file explorer windows and web browser windows Internet Explorer and 3rd-party web browsers). Normally each Shell window implements <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a>; <a href="https://docs.microsoft.com/windows/desktop/api/exdisp/nf-exdisp-ishellwindows-item">IShellWindows::Item</a> and <a href="https://docs.microsoft.com/windows/desktop/api/exdisp/nf-exdisp-ishellwindows-findwindowsw">IShellWindows::FindWindowSW</a> provide ways to access a Shell window's <b>IDispatch</b> interface. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/automat/dispatch-interfaces">Dispatch Interface and Automation Functions</a>.
  * 
  * 
  * <table class="clsStd">
  * <tr>
  * <th>IID</th>
  * <td>IID_IShellWindows (85CB6900-4D95-11CF-960C-0080C7F4EE85)</td>
  * </tr>
  * <tr>
  * <th>CLSID</th>
  * <td>CLSID_ShellWindows (9BA05972-F6A8-11CF-A442-00A0C90A8F39)</td>
  * </tr>
  * </table>
  *  
  * 
  * 
  * 
  * The following example shows how to retrieve an <b>IShellWindows</b> instance.
  * 
  * 
  * ```
  * 
 * @see https://docs.microsoft.com/windows/win32/api//exdisp/nn-exdisp-ishellwindows
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IShellWindows extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IShellWindows
     * @type {Guid}
     */
    static IID => Guid("{85cb6900-4d95-11cf-960c-0080c7f4ee85}")

    /**
     * The class identifier for ShellWindows
     * @type {Guid}
     */
    static CLSID => Guid("{9ba05972-f6a8-11cf-a442-00a0c90a8f39}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Count", "Item", "_NewEnum", "Register", "RegisterPending", "Revoke", "OnNavigate", "OnActivated", "FindWindowSW", "OnCreated", "ProcessAttachDetach"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/exdisp/nf-exdisp-ishellwindows-get_count
     */
    get_Count() {
        result := ComCall(7, this, "int*", &Count := 0, "HRESULT")
        return Count
    }

    /**
     * 
     * @param {VARIANT} index 
     * @returns {IDispatch} 
     * @see https://learn.microsoft.com/windows/win32/api/exdisp/nf-exdisp-ishellwindows-item
     */
    Item(index) {
        result := ComCall(8, this, "ptr", index, "ptr*", &Folder := 0, "HRESULT")
        return IDispatch(Folder)
    }

    /**
     * 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/exdisp/nf-exdisp-ishellwindows-_newenum
     */
    _NewEnum() {
        result := ComCall(9, this, "ptr*", &ppunk := 0, "HRESULT")
        return IUnknown(ppunk)
    }

    /**
     * 
     * @param {IDispatch} pid 
     * @param {Integer} hwnd 
     * @param {Integer} swClass 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/exdisp/nf-exdisp-ishellwindows-register
     */
    Register(pid, hwnd, swClass) {
        result := ComCall(10, this, "ptr", pid, "int", hwnd, "int", swClass, "int*", &plCookie := 0, "HRESULT")
        return plCookie
    }

    /**
     * 
     * @param {Integer} lThreadId 
     * @param {Pointer<VARIANT>} pvarloc 
     * @param {Pointer<VARIANT>} pvarlocRoot 
     * @param {Integer} swClass 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/exdisp/nf-exdisp-ishellwindows-registerpending
     */
    RegisterPending(lThreadId, pvarloc, pvarlocRoot, swClass) {
        result := ComCall(11, this, "int", lThreadId, "ptr", pvarloc, "ptr", pvarlocRoot, "int", swClass, "int*", &plCookie := 0, "HRESULT")
        return plCookie
    }

    /**
     * 
     * @param {Integer} lCookie 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/exdisp/nf-exdisp-ishellwindows-revoke
     */
    Revoke(lCookie) {
        result := ComCall(12, this, "int", lCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lCookie 
     * @param {Pointer<VARIANT>} pvarLoc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/exdisp/nf-exdisp-ishellwindows-onnavigate
     */
    OnNavigate(lCookie, pvarLoc) {
        result := ComCall(13, this, "int", lCookie, "ptr", pvarLoc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lCookie 
     * @param {VARIANT_BOOL} fActive 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/exdisp/nf-exdisp-ishellwindows-onactivated
     */
    OnActivated(lCookie, fActive) {
        result := ComCall(14, this, "int", lCookie, "short", fActive, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarLoc 
     * @param {Pointer<VARIANT>} pvarLocRoot 
     * @param {Integer} swClass 
     * @param {Pointer<Integer>} phwnd 
     * @param {Integer} swfwOptions 
     * @returns {IDispatch} 
     * @see https://learn.microsoft.com/windows/win32/api/exdisp/nf-exdisp-ishellwindows-findwindowsw
     */
    FindWindowSW(pvarLoc, pvarLocRoot, swClass, phwnd, swfwOptions) {
        phwndMarshal := phwnd is VarRef ? "int*" : "ptr"

        result := ComCall(15, this, "ptr", pvarLoc, "ptr", pvarLocRoot, "int", swClass, phwndMarshal, phwnd, "int", swfwOptions, "ptr*", &ppdispOut := 0, "HRESULT")
        return IDispatch(ppdispOut)
    }

    /**
     * 
     * @param {Integer} lCookie 
     * @param {IUnknown} punk 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/exdisp/nf-exdisp-ishellwindows-oncreated
     */
    OnCreated(lCookie, punk) {
        result := ComCall(16, this, "int", lCookie, "ptr", punk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} fAttach 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/exdisp/nf-exdisp-ishellwindows-processattachdetach
     */
    ProcessAttachDetach(fAttach) {
        result := ComCall(17, this, "short", fAttach, "HRESULT")
        return result
    }
}
