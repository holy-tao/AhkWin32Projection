#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ShellWindowTypeConstants.ahk" { ShellWindowTypeConstants }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\ShellWindowFindWindowOptions.ahk" { ShellWindowFindWindowOptions }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

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
 * @see https://learn.microsoft.com/windows/win32/api/exdisp/nn-exdisp-ishellwindows
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IShellWindows extends IDispatch {
    /**
     * The interface identifier for IShellWindows
     * @type {Guid}
     */
    static IID := Guid("{85cb6900-4d95-11cf-960c-0080c7f4ee85}")

    /**
     * The class identifier for ShellWindows
     * @type {Guid}
     */
    static CLSID := Guid("{9ba05972-f6a8-11cf-a442-00a0c90a8f39}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IShellWindows interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Count           : IntPtr
        Item                : IntPtr
        _NewEnum            : IntPtr
        Register            : IntPtr
        RegisterPending     : IntPtr
        Revoke              : IntPtr
        OnNavigate          : IntPtr
        OnActivated         : IntPtr
        FindWindowSW        : IntPtr
        OnCreated           : IntPtr
        ProcessAttachDetach : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IShellWindows.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @see https://learn.microsoft.com/windows/win32/api/exdisp/nf-exdisp-ishellwindows-get_count
     */
    get_Count() {
        result := ComCall(7, this, "int*", &Count := 0, "HRESULT")
        return Count
    }

    /**
     * Returns the registered Shell window for a specified index.
     * @param {VARIANT} index Type: <b>VARIANT</b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a> of type VT_UI4, VT_I2, or VT_I4. If the type is VT_UI4, the value of <i>index</i> is interpreted as a member of <a href="https://docs.microsoft.com/windows/desktop/api/exdisp/ne-exdisp-shellwindowtypeconstants">ShellWindowTypeConstants</a>; in this case, <b>Item</b> returns the window that is closest to the foreground window and has a matching type. If the type is VT_I, or VT_I4, <i>index</i> is treated as an index into the Shell windows collection.
     * @returns {IDispatch} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a>**</b>
     * 
     * A reference to the window's <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a> interface, or <b>NULL</b> if the specified window was not found.
     * @see https://learn.microsoft.com/windows/win32/api/exdisp/nf-exdisp-ishellwindows-item
     */
    Item(index) {
        result := ComCall(8, this, VARIANT, index, "ptr*", &_Folder := 0, "HRESULT")
        return IDispatch(_Folder)
    }

    /**
     * Retrieves an enumerator for the collection of Shell windows.
     * @returns {IUnknown} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>**</b>
     * 
     * When this method returns, contains an interface pointer to an object that implements the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-ienumvariant">IEnumVARIANT</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/exdisp/nf-exdisp-ishellwindows-_newenum
     */
    _NewEnum() {
        result := ComCall(9, this, "ptr*", &ppunk := 0, "HRESULT")
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
     * @param {Integer} _hwnd Type: <b>long</b>
     * 
     * A handle that specifies the window to register.
     * @param {ShellWindowTypeConstants} swClass Type: <b>int</b>
     * 
     * A member of <a href="https://docs.microsoft.com/windows/desktop/api/exdisp/ne-exdisp-shellwindowtypeconstants">ShellWindowTypeConstants</a> that specifies the type of window.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The window's cookie.
     * @see https://learn.microsoft.com/windows/win32/api/exdisp/nf-exdisp-ishellwindows-register
     */
    Register(pid, _hwnd, swClass) {
        result := ComCall(10, this, "ptr", pid, "int", _hwnd, ShellWindowTypeConstants, swClass, "int*", &plCookie := 0, "HRESULT")
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
     * @param {ShellWindowTypeConstants} swClass Type: <b>int</b>
     * 
     * A member of <a href="https://docs.microsoft.com/windows/desktop/api/exdisp/ne-exdisp-shellwindowtypeconstants">ShellWindowTypeConstants</a> that specifies the type of window.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The window's cookie.
     * @see https://learn.microsoft.com/windows/win32/api/exdisp/nf-exdisp-ishellwindows-registerpending
     */
    RegisterPending(lThreadId, pvarloc, pvarlocRoot, swClass) {
        result := ComCall(11, this, "int", lThreadId, VARIANT.Ptr, pvarloc, VARIANT.Ptr, pvarlocRoot, ShellWindowTypeConstants, swClass, "int*", &plCookie := 0, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/exdisp/nf-exdisp-ishellwindows-revoke
     */
    Revoke(lCookie) {
        result := ComCall(12, this, "int", lCookie, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/exdisp/nf-exdisp-ishellwindows-onnavigate
     */
    OnNavigate(lCookie, pvarLoc) {
        result := ComCall(13, this, "int", lCookie, VARIANT.Ptr, pvarLoc, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/exdisp/nf-exdisp-ishellwindows-onactivated
     */
    OnActivated(lCookie, fActive) {
        result := ComCall(14, this, "int", lCookie, VARIANT_BOOL, fActive, "HRESULT")
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
     * @param {ShellWindowTypeConstants} swClass Type: <b>int</b>
     * 
     * One or more <a href="https://docs.microsoft.com/windows/desktop/api/exdisp/ne-exdisp-shellwindowtypeconstants">ShellWindowTypeConstants</a> flags that specify window types to include in the search.
     * @param {Pointer<Integer>} phwnd Type: <b>long*</b>
     * 
     * A handle for the window matching the specified search criteria, or <b>NULL</b> if no such window was found.
     * @param {ShellWindowFindWindowOptions} swfwOptions Type: <b>int</b>
     * 
     * One or more <a href="https://docs.microsoft.com/windows/desktop/api/exdisp/ne-exdisp-shellwindowfindwindowoptions">ShellWindowFindWindowOptions</a> flags that specify search options.
     * @returns {IDispatch} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a>**</b>
     * 
     * A reference to the window's <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a> interface, or <b>NULL</b> if no such window was found.
     * @see https://learn.microsoft.com/windows/win32/api/exdisp/nf-exdisp-ishellwindows-findwindowsw
     */
    FindWindowSW(pvarLoc, pvarLocRoot, swClass, phwnd, swfwOptions) {
        phwndMarshal := phwnd is VarRef ? "int*" : "ptr"

        result := ComCall(15, this, VARIANT.Ptr, pvarLoc, VARIANT.Ptr, pvarLocRoot, ShellWindowTypeConstants, swClass, phwndMarshal, phwnd, ShellWindowFindWindowOptions, swfwOptions, "ptr*", &ppdispOut := 0, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/exdisp/nf-exdisp-ishellwindows-oncreated
     */
    OnCreated(lCookie, punk) {
        result := ComCall(16, this, "int", lCookie, "ptr", punk, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/exdisp/nf-exdisp-ishellwindows-processattachdetach
     */
    ProcessAttachDetach(fAttach) {
        result := ComCall(17, this, VARIANT_BOOL, fAttach, "HRESULT")
        return result
    }

    Query(iid) {
        if (IShellWindows.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Count := CallbackCreate(GetMethod(implObj, "get_Count"), flags, 2)
        this.vtbl.Item := CallbackCreate(GetMethod(implObj, "Item"), flags, 3)
        this.vtbl._NewEnum := CallbackCreate(GetMethod(implObj, "_NewEnum"), flags, 2)
        this.vtbl.Register := CallbackCreate(GetMethod(implObj, "Register"), flags, 5)
        this.vtbl.RegisterPending := CallbackCreate(GetMethod(implObj, "RegisterPending"), flags, 6)
        this.vtbl.Revoke := CallbackCreate(GetMethod(implObj, "Revoke"), flags, 2)
        this.vtbl.OnNavigate := CallbackCreate(GetMethod(implObj, "OnNavigate"), flags, 3)
        this.vtbl.OnActivated := CallbackCreate(GetMethod(implObj, "OnActivated"), flags, 3)
        this.vtbl.FindWindowSW := CallbackCreate(GetMethod(implObj, "FindWindowSW"), flags, 7)
        this.vtbl.OnCreated := CallbackCreate(GetMethod(implObj, "OnCreated"), flags, 3)
        this.vtbl.ProcessAttachDetach := CallbackCreate(GetMethod(implObj, "ProcessAttachDetach"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Count)
        CallbackFree(this.vtbl.Item)
        CallbackFree(this.vtbl._NewEnum)
        CallbackFree(this.vtbl.Register)
        CallbackFree(this.vtbl.RegisterPending)
        CallbackFree(this.vtbl.Revoke)
        CallbackFree(this.vtbl.OnNavigate)
        CallbackFree(this.vtbl.OnActivated)
        CallbackFree(this.vtbl.FindWindowSW)
        CallbackFree(this.vtbl.OnCreated)
        CallbackFree(this.vtbl.ProcessAttachDetach)
    }
}
