#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to the collection of open Shell windows.
 * @remarks
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
 * @see https://learn.microsoft.com/windows/win32/api//content/exdisp/nn-exdisp-ishellwindows
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
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * Gets the number of windows in the Shell windows collection.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The number of windows in the Shell windows collection.
     * @see https://learn.microsoft.com/windows/win32/api//content/exdisp/nf-exdisp-ishellwindows-get_count
     */
    get_Count() {
        result := ComCall(7, this, "int*", &Count := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Count
    }

    /**
     * Returns the registered Shell window for a specified index.
     * @param {VARIANT} index Type: <b>VARIANT</b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a> of type VT_UI4, VT_I2, or VT_I4. If the type is VT_UI4, the value of <i>index</i> is interpreted as a member of <a href="https://docs.microsoft.com/windows/desktop/api/exdisp/ne-exdisp-shellwindowtypeconstants">ShellWindowTypeConstants</a>; in this case, <b>Item</b> returns the window that is closest to the foreground window and has a matching type. If the type is VT_I, or VT_I4, <i>index</i> is treated as an index into the Shell windows collection.
     * @returns {IDispatch} 
     * @see https://learn.microsoft.com/windows/win32/api//content/exdisp/nf-exdisp-ishellwindows-item
     */
    Item(index) {
        result := ComCall(8, this, "ptr", index, "ptr*", &Folder_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDispatch(Folder_)
    }

    /**
     * Retrieves an enumerator for the collection of Shell windows.
     * @returns {IUnknown} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>**</b>
     * 
     * When this method returns, contains an interface pointer to an object that implements the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-ienumvariant">IEnumVARIANT</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/exdisp/nf-exdisp-ishellwindows-_newenum
     */
    _NewEnum() {
        result := ComCall(9, this, "ptr*", &ppunk := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUnknown(ppunk)
    }

    /**
     * Registers an open window as a Shell window; the window is specified by handle.
     * @remarks
     * In the context of the Shell windows collection, a <i>cookie</i> is a token that uniquely identifies a registered Shell window.
     * 
     * Use this method to register an open window; if the window is pending open, use <a href="https://docs.microsoft.com/windows/desktop/api/exdisp/nf-exdisp-ishellwindows-registerpending">IShellWindows::RegisterPending</a> instead.
     * @param {IDispatch} pid Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a>*</b>
     * 
     * The window's <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a> interface.
     * @param {Integer} hwnd_ Type: <b>long</b>
     * 
     * A handle that specifies the window to register.
     * @param {Integer} swClass Type: <b>int</b>
     * 
     * A member of <a href="https://docs.microsoft.com/windows/desktop/api/exdisp/ne-exdisp-shellwindowtypeconstants">ShellWindowTypeConstants</a> that specifies the type of window.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The window's cookie.
     * @see https://learn.microsoft.com/windows/win32/api//content/exdisp/nf-exdisp-ishellwindows-register
     */
    Register(pid, hwnd_, swClass) {
        result := ComCall(10, this, "ptr", pid, "int", hwnd_, "int", swClass, "int*", &plCookie := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return plCookie
    }

    /**
     * Registers a pending window as a Shell window; the window is specified by an absolute PIDL.
     * @remarks
     * In the context of the Shell windows collection, a <i>cookie</i> is a token that uniquely identifies a registered Shell window.
     * 
     * Use this method to register a window that is pending open; if the window is already open, use <a href="https://docs.microsoft.com/windows/desktop/api/exdisp/nf-exdisp-ishellwindows-register">IShellWindows::Register</a> instead. Use <a href="https://docs.microsoft.com/windows/desktop/api/exdisp/nf-exdisp-ishellwindows-revoke">IShellWindows::Revoke</a> to un-register a window.
     * @param {Integer} lThreadId A thread ID.
     * @param {Pointer<VARIANT>} pvarloc Type: <b>VARIANT*</b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a> of type VT_VARIANT | VT_BYREF. Set the value of <i>pvarloc</i> to an absolute <a href="https://docs.microsoft.com/windows/desktop/api/shtypes/ns-shtypes-itemidlist">PIDL</a> (PIDLIST_ABSOLUTE) that specifies the window to register.
     * @param {Pointer<VARIANT>} pvarlocRoot Type: <b>VARIANT*</b>
     * 
     * Must be <b>NULL</b> or of type VT_EMPTY.
     * @param {Integer} swClass Type: <b>int</b>
     * 
     * A member of <a href="https://docs.microsoft.com/windows/desktop/api/exdisp/ne-exdisp-shellwindowtypeconstants">ShellWindowTypeConstants</a> that specifies the type of window.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The window's cookie.
     * @see https://learn.microsoft.com/windows/win32/api//content/exdisp/nf-exdisp-ishellwindows-registerpending
     */
    RegisterPending(lThreadId, pvarloc, pvarlocRoot, swClass) {
        result := ComCall(11, this, "int", lThreadId, "ptr", pvarloc, "ptr", pvarlocRoot, "int", swClass, "int*", &plCookie := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return plCookie
    }

    /**
     * Revokes a Shell window's registration and removes the window from the Shell windows collection.
     * @remarks
     * In the context of the Shell windows collection, a <i>cookie</i> is a token that uniquely identifies a registered Shell window.
     * 
     * Use the <a href="https://docs.microsoft.com/windows/desktop/api/exdisp/nf-exdisp-ishellwindows-register">IShellWindows::Register</a> method to register an open window by handle. Use the <a href="https://docs.microsoft.com/windows/desktop/api/exdisp/nf-exdisp-ishellwindows-registerpending">IShellWindows::RegisterPending</a> method to register a pending-open window by absolute PIDL.
     * @param {Integer} lCookie Type: <b>long*</b>
     * 
     * The cookie that identifies the window to un-register.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/exdisp/nf-exdisp-ishellwindows-revoke
     */
    Revoke(lCookie) {
        result := ComCall(12, this, "int", lCookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Occurs when a Shell window is navigated to a new location.
     * @remarks
     * A window is granted a cookie when it is registered as a Shell window. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/exdisp/nf-exdisp-ishellwindows-register">IShellWindows::Register</a>.
     * @param {Integer} lCookie Type: <b>long</b>
     * 
     * The cookie that identifies the window.
     * @param {Pointer<VARIANT>} pvarLoc Type: <b>VARIANT*</b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a> of type VT_VARIANT | VT_BYREF. Set the value of <i>pvarLoc</i> to an absolute <a href="https://docs.microsoft.com/windows/desktop/api/shtypes/ns-shtypes-itemidlist">PIDL</a> (PIDLIST_ABSOLUTE) that specifies the new location.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/exdisp/nf-exdisp-ishellwindows-onnavigate
     */
    OnNavigate(lCookie, pvarLoc) {
        result := ComCall(13, this, "int", lCookie, "ptr", pvarLoc, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Occurs when a Shell window's activation state changes.
     * @remarks
     * A window is granted a cookie when it is registered as a Shell window. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/exdisp/nf-exdisp-ishellwindows-register">IShellWindows::Register</a>.
     * @param {Integer} lCookie Type: <b>long</b>
     * 
     * The cookie that identifies the window.
     * @param {VARIANT_BOOL} fActive Type: <b>VARIANT_BOOL</b>
     * 
     * <b>TRUE</b> if the window is being activated; <b>FALSE</b> if the window is being deactivated.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/exdisp/nf-exdisp-ishellwindows-onactivated
     */
    OnActivated(lCookie, fActive) {
        result := ComCall(14, this, "int", lCookie, "short", fActive, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Finds a window in the Shell windows collection and returns the window's handle and IDispatch interface.
     * @remarks
     * If the <a href="https://docs.microsoft.com/windows/desktop/api/exdisp/ne-exdisp-shellwindowfindwindowoptions">SWFO_COOKIEPASSED</a> flag is set, <i>pvarLoc</i> is interpreted as a cookie instead of a PIDL.
     * @param {Pointer<VARIANT>} pvarLoc Type: <b>VARIANT*</b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a> of type VT_VARIANT | VT_BYREF. Set the value of <i>pvarLoc</i> to an absolute <a href="https://docs.microsoft.com/windows/desktop/api/shtypes/ns-shtypes-itemidlist">PIDL</a> (PIDLIST_ABSOLUTE) that specifies the window to find. (See remarks.)
     * @param {Pointer<VARIANT>} pvarLocRoot Type: <b>VARIANT*</b>
     * 
     * Must be <b>NULL</b> or of type VT_EMPTY.
     * @param {Integer} swClass Type: <b>int</b>
     * 
     * One or more <a href="https://docs.microsoft.com/windows/desktop/api/exdisp/ne-exdisp-shellwindowtypeconstants">ShellWindowTypeConstants</a> flags that specify window types to include in the search.
     * @param {Pointer<Integer>} phwnd Type: <b>long*</b>
     * 
     * A handle for the window matching the specified search criteria, or <b>NULL</b> if no such window was found.
     * @param {Integer} swfwOptions Type: <b>int</b>
     * 
     * One or more <a href="https://docs.microsoft.com/windows/desktop/api/exdisp/ne-exdisp-shellwindowfindwindowoptions">ShellWindowFindWindowOptions</a> flags that specify search options.
     * @returns {IDispatch} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a>**</b>
     * 
     * A reference to the window's <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a> interface, or <b>NULL</b> if no such window was found.
     * @see https://learn.microsoft.com/windows/win32/api//content/exdisp/nf-exdisp-ishellwindows-findwindowsw
     */
    FindWindowSW(pvarLoc, pvarLocRoot, swClass, phwnd, swfwOptions) {
        phwndMarshal := phwnd is VarRef ? "int*" : "ptr"

        result := ComCall(15, this, "ptr", pvarLoc, "ptr", pvarLocRoot, "int", swClass, phwndMarshal, phwnd, "int", swfwOptions, "ptr*", &ppdispOut := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDispatch(ppdispOut)
    }

    /**
     * Occurs when a new Shell window is created for a frame.
     * @remarks
     * A window is granted a cookie when it is registered as a Shell window. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/exdisp/nf-exdisp-ishellwindows-register">IShellWindows::Register</a>.
     * @param {Integer} lCookie Type: <b>long</b>
     * 
     * The cookie that identifies the window.
     * @param {IUnknown} punk Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * The address of the new window's <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/exdisp/nf-exdisp-ishellwindows-oncreated
     */
    OnCreated(lCookie, punk) {
        result := ComCall(16, this, "int", lCookie, "ptr", punk, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Deprecated. Always returns S_OK.
     * @param {VARIANT_BOOL} fAttach Type: <b>VARIANT_BOOL</b>
     * 
     * Not used.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Always returns S_OK.
     * @see https://learn.microsoft.com/windows/win32/api//content/exdisp/nf-exdisp-ishellwindows-processattachdetach
     */
    ProcessAttachDetach(fAttach) {
        result := ComCall(17, this, "short", fAttach, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
