#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\LRESULT.ahk" { LRESULT }
#Import ".\FOLDERSETDATA.ahk" { FOLDERSETDATA }
#Import "..\WindowsAndMessaging\HACCEL.ahk" { HACCEL }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\WindowsAndMessaging\CREATESTRUCTW.ahk" { CREATESTRUCTW }
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import ".\IBrowserService.ahk" { IBrowserService }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }
#Import ".\IShellView.ahk" { IShellView }
#Import "..\..\System\Com\IStream.ahk" { IStream }
#Import "..\WindowsAndMessaging\MSG.ahk" { MSG }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\ITravelLog.ahk" { ITravelLog }
#Import "..\Controls\NMHDR.ahk" { NMHDR }
#Import ".\BASEBROWSERDATALH.ahk" { BASEBROWSERDATALH }
#Import ".\TOOLBARITEM.ahk" { TOOLBARITEM }
#Import "..\..\Graphics\Gdi\HMONITOR.ahk" { HMONITOR }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "Common\ITEMIDLIST.ahk" { ITEMIDLIST }
#Import "..\..\Foundation\WPARAM.ahk" { WPARAM }
#Import "..\..\Foundation\RECT.ahk" { RECT }

/**
 * Deprecated. (IBrowserService2)
 * @remarks
 * This interface also provides the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/shdeprecated/nn-shdeprecated-ibrowserservice">IBrowserService</a> interface, from which it inherits.
 * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nn-shdeprecated-ibrowserservice2
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IBrowserService2 extends IBrowserService {
    /**
     * The interface identifier for IBrowserService2
     * @type {Guid}
     */
    static IID := Guid("{68bd21cc-438b-11d2-a560-00a0c92dbfe8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBrowserService2 interfaces
    */
    struct Vtbl extends IBrowserService.Vtbl {
        WndProcBS                     : IntPtr
        SetAsDefFolderSettings        : IntPtr
        GetViewRect                   : IntPtr
        OnSize                        : IntPtr
        OnCreate                      : IntPtr
        OnCommand                     : IntPtr
        OnDestroy                     : IntPtr
        OnNotify                      : IntPtr
        OnSetFocus                    : IntPtr
        OnFrameWindowActivateBS       : IntPtr
        ReleaseShellView              : IntPtr
        ActivatePendingView           : IntPtr
        CreateViewWindow              : IntPtr
        CreateBrowserPropSheetExt     : IntPtr
        GetViewWindow                 : IntPtr
        GetBaseBrowserData            : IntPtr
        PutBaseBrowserData            : IntPtr
        InitializeTravelLog           : IntPtr
        SetTopBrowser                 : IntPtr
        Offline                       : IntPtr
        AllowViewResize               : IntPtr
        SetActivateState              : IntPtr
        UpdateSecureLockIcon          : IntPtr
        InitializeDownloadManager     : IntPtr
        InitializeTransitionSite      : IntPtr
        _Initialize                   : IntPtr
        _CancelPendingNavigationAsync : IntPtr
        _CancelPendingView            : IntPtr
        _MaySaveChanges               : IntPtr
        _PauseOrResumeView            : IntPtr
        _DisableModeless              : IntPtr
        _NavigateToPidl2              : IntPtr
        _TryShell2Rename              : IntPtr
        _SwitchActivationNow          : IntPtr
        _ExecChildren                 : IntPtr
        _SendChildren                 : IntPtr
        GetFolderSetData              : IntPtr
        _OnFocusChange                : IntPtr
        v_ShowHideChildWindows        : IntPtr
        _get_itbLastFocus             : IntPtr
        _put_itbLastFocus             : IntPtr
        _UIActivateView               : IntPtr
        _GetViewBorderRect            : IntPtr
        _UpdateViewRectSize           : IntPtr
        _ResizeNextBorder             : IntPtr
        _ResizeView                   : IntPtr
        _GetEffectiveClientArea       : IntPtr
        v_GetViewStream               : IntPtr
        ForwardViewMsg                : IntPtr
        SetAcceleratorMenu            : IntPtr
        _GetToolbarCount              : IntPtr
        _GetToolbarItem               : IntPtr
        _SaveToolbars                 : IntPtr
        _LoadToolbars                 : IntPtr
        _CloseAndReleaseToolbars      : IntPtr
        v_MayGetNextToolbarFocus      : IntPtr
        _ResizeNextBorderHelper       : IntPtr
        _FindTBar                     : IntPtr
        _SetFocus                     : IntPtr
        v_MayTranslateAccelerator     : IntPtr
        _GetBorderDWHelper            : IntPtr
        v_CheckZoneCrossing           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBrowserService2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Deprecated. Allows a derived class to call the WinProc function of the base class.
     * @param {HWND} _hwnd Type: <b>HWND</b>
     * 
     * The handle of the window receiving the message.
     * @param {Integer} uMsg Type: <b>UINT</b>
     * 
     * The message received by the window.
     * @param {WPARAM} _wParam Type: <b>WPARAM</b>
     * 
     * Additional message information specific to the message type.
     * @param {LPARAM} _lParam Type: <b>LPARAM</b>
     * 
     * Additional message information specific to the message type.
     * @returns {LRESULT} Type: <b>LRESULT</b>
     * 
     * The return value specifies the result of the message processing; it depends on the message sent.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-wndprocbs
     */
    WndProcBS(_hwnd, uMsg, _wParam, _lParam) {
        result := ComCall(33, this, HWND, _hwnd, "uint", uMsg, WPARAM, _wParam, LPARAM, _lParam, LRESULT)
        return result
    }

    /**
     * Deprecated. Sets the folder's current view mode as the default view mode for all folders. Used by the Folder Options dialog.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-setasdeffoldersettings
     */
    SetAsDefFolderSettings() {
        result := ComCall(34, this, "HRESULT")
        return result
    }

    /**
     * Deprecated. Retrieves a value that is used to negotiate the allowed size of the window.
     * @returns {RECT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>*</b>
     * 
     * A pointer to a <b>RECT</b> structure that receives the allowed dimensions.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-getviewrect
     */
    GetViewRect() {
        prc := RECT()
        result := ComCall(35, this, RECT.Ptr, prc, "HRESULT")
        return prc
    }

    /**
     * Deprecated. Calls the derived class from the base class on receipt of a WM_SIZE message. The derived class handles the message.
     * @param {WPARAM} _wParam Type: <b>WPARAM</b>
     * 
     * Additional information provided by the <a href="https://docs.microsoft.com/windows/desktop/winmsg/wm-size">WM_SIZE</a> message.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-onsize
     */
    OnSize(_wParam) {
        result := ComCall(36, this, WPARAM, _wParam, "HRESULT")
        return result
    }

    /**
     * Deprecated. Calls the derived class from the base class on receipt of a WM_CREATE message. The derived class handles the message.
     * @param {Pointer<CREATESTRUCTW>} pcs Type: <b>tagCREATESTRUCTW*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-createstructa">CREATESTRUCT</a> structure that receives the initialization parameters passed to the window procedure (WinProc) of the class.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-oncreate
     */
    OnCreate(pcs) {
        result := ComCall(37, this, CREATESTRUCTW.Ptr, pcs, "HRESULT")
        return result
    }

    /**
     * Deprecated. Calls the derived class from the base class on receipt of a WM_COMMAND message. The derived class handles the message.
     * @param {WPARAM} _wParam Type: <b>WPARAM</b>
     * 
     * Additional information taken from the <a href="https://docs.microsoft.com/windows/desktop/menurc/wm-command">WM_COMMAND</a> message. The high-order word specifies the notification code if the message is from a control. If the message is from an accelerator, this value is 1. If the message is from a menu, this value is zero. 
     *                     
     * 
     * The low-order word specifies the identifier of the menu item, control, or accelerator.
     * @param {LPARAM} _lParam Type: <b>LPARAM</b>
     * 
     * Additional information taken from the <a href="https://docs.microsoft.com/windows/desktop/menurc/wm-command">WM_COMMAND</a> message. Handle to the control sending the message if the message is from a control. Otherwise, this parameter is <b>NULL</b>.
     * @returns {LRESULT} Type: <b>LRESULT</b>
     * 
     * The return value specifies the result of the command processing; it depends on the command sent.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-oncommand
     */
    OnCommand(_wParam, _lParam) {
        result := ComCall(38, this, WPARAM, _wParam, LPARAM, _lParam, LRESULT)
        return result
    }

    /**
     * Deprecated. Calls the derived class from the base class on receipt of a WM_DESTROY message. The derived class handles the message.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-ondestroy
     */
    OnDestroy() {
        result := ComCall(39, this, "HRESULT")
        return result
    }

    /**
     * Deprecated. Calls the derived class from the base class on receipt of a WM_NOTIFY message. The derived class handles the message.
     * @param {Pointer<NMHDR>} pnm Type: <b>tagNMHDR*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure that receives the initialization parameters passed to the window procedure (WinProc) of the class.
     * @returns {LRESULT} Type: <b>LRESULT</b>
     * 
     * The return value specifies the result of the notification processing; it depends on the notification sent.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-onnotify
     */
    OnNotify(pnm) {
        result := ComCall(40, this, NMHDR.Ptr, pnm, LRESULT)
        return result
    }

    /**
     * Deprecated. Calls the derived class from the base class on receipt of a WM_SETFOCUS message. The derived class handles the message.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-onsetfocus
     */
    OnSetFocus() {
        result := ComCall(41, this, "HRESULT")
        return result
    }

    /**
     * Deprecated. Calls the derived class from the base class in response to a subframe window being activated or deactivated. The derived class determines what to do in response to the action.
     * @param {BOOL} fActive Type: <b>BOOL</b>
     * 
     * The state of the subframe window.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-onframewindowactivatebs
     */
    OnFrameWindowActivateBS(fActive) {
        result := ComCall(42, this, BOOL, fActive, "HRESULT")
        return result
    }

    /**
     * Deprecated. Coordinates the view lifetime between the base class and its derived class.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-releaseshellview
     */
    ReleaseShellView() {
        result := ComCall(43, this, "HRESULT")
        return result
    }

    /**
     * Deprecated. Coordinates state updating while the browser is switching between a current and a pending view.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-activatependingview
     */
    ActivatePendingView() {
        result := ComCall(44, this, "HRESULT")
        return result
    }

    /**
     * Deprecated. Coordinates the updating of state when creating a new browser view window.
     * @param {IShellView} psvNew Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a> of the new browser window.
     * @param {IShellView} psvOld Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a> of the old browser window.
     * @param {Pointer<RECT>} prcView Type: <b>LPRECT</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that specifies the current dimensions of the browser view.
     * @returns {HWND} Type: <b>HWND*</b>
     * 
     * A pointer to the new browser window handle.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-createviewwindow
     */
    CreateViewWindow(psvNew, psvOld, prcView) {
        phwnd := HWND()
        result := ComCall(45, this, "ptr", psvNew, "ptr", psvOld, RECT.Ptr, prcView, HWND.Ptr, phwnd, "HRESULT")
        return phwnd
    }

    /**
     * Deprecated. Allows the derived class to add Folder Options property sheets to the base class.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The IID of the interface pointer that should be returned in the <i>ppv</i> parameter.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * The address of a pointer to the interface pointer requested in the <i>riid</i> parameter.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-createbrowserpropsheetext
     */
    CreateBrowserPropSheetExt(riid) {
        result := ComCall(46, this, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Deprecated. Provides direct access to the browser view window created by IBrowserService2::CreateViewWindow.
     * @remarks
     * <b>IBrowserService2::GetViewWindow</b> retrieves the same handle as found in the <b>_hwndView</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/shdeprecated/ns-shdeprecated-basebrowserdatalh">BASEBROWSERDATA</a> structure. This method simply provides direct access to that view, bypassing the need to access the <b>BASEBROWSERDATA</b> structure though a method such as <a href="https://docs.microsoft.com/windows/desktop/api/shdeprecated/nf-shdeprecated-ibrowserservice2-getbasebrowserdata">IBrowserService2::GetBaseBrowserData</a>.
     * @returns {HWND} Type: <b>HWND*</b>
     * 
     * A pointer to the handle of the browser window.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-getviewwindow
     */
    GetViewWindow() {
        phwndView := HWND()
        result := ComCall(47, this, HWND.Ptr, phwndView, "HRESULT")
        return phwndView
    }

    /**
     * Deprecated. Gets a read-only structure containing the protected elements owned by the base class, for the purpose of determining state.
     * @remarks
     * This method is used as an optimization to access the internal state of the base browser. The state should be updated only by the base browser.
     * @returns {Pointer<BASEBROWSERDATALH>} Type: <b>LPCBASEBROWSERDATA*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/shdeprecated/ns-shdeprecated-basebrowserdatalh">BASEBROWSERDATA</a> structure that receives the read-only state of the base browser.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-getbasebrowserdata
     */
    GetBaseBrowserData() {
        result := ComCall(48, this, "ptr*", &pbbd := 0, "HRESULT")
        return pbbd
    }

    /**
     * Deprecated. Gets a structure that allows read/write access to protected members of the base class. Note, however, that state should only be updated by the base browser.
     * @returns {Pointer<BASEBROWSERDATALH>} Type: <b>LPBASEBROWSERDATA</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/shdeprecated/ns-shdeprecated-basebrowserdatalh">BASEBROWSERDATA</a> structure.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-putbasebrowserdata
     */
    PutBaseBrowserData() {
        result := ComCall(49, this, BASEBROWSERDATALH.Ptr)
        return result
    }

    /**
     * Deprecated. Allows the derived class to specify a navigation record to be used in a new window.
     * @param {ITravelLog} ptl Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shdeprecated/nn-shdeprecated-itravellog">ITravelLog</a>*</b>
     * 
     * A pointer to an existing <a href="https://docs.microsoft.com/windows/desktop/api/shdeprecated/nn-shdeprecated-itravellog">ITravelLog</a> object to be used for the new window.
     * @param {Integer} dw Type: <b>DWORD</b>
     * 
     * The new browser window's ID.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-initializetravellog
     */
    InitializeTravelLog(ptl, dw) {
        result := ComCall(50, this, "ptr", ptl, "uint", dw, "HRESULT")
        return result
    }

    /**
     * Deprecated. Informs the base class when it becomes the topmost browser instance.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-settopbrowser
     */
    SetTopBrowser() {
        result := ComCall(51, this, "HRESULT")
        return result
    }

    /**
     * Deprecated. Checks for and updates the browser's offline status, synchronizing the state between the base class and any derived classes.
     * @param {Integer} iCmd Type: <b>int</b>
     * 
     * One of the following commands.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * In the case of SBSC_TOGGLE, returns standard error codes. In the case of SBSC_QUERY, returns S_OK if offline, S_FALSE otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-offline
     */
    Offline(iCmd) {
        result := ComCall(52, this, "int", iCmd, "HRESULT")
        return result
    }

    /**
     * Deprecated. Informs the base class whether to allow view resizing.
     * @param {BOOL} f Type: <b>BOOL</b>
     * 
     * A value of type <b>BOOL</b> that indicates whether to allow view resizing.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-allowviewresize
     */
    AllowViewResize(f) {
        result := ComCall(53, this, BOOL, f, "HRESULT")
        return result
    }

    /**
     * Deprecated. Updates the value of the _uActivateState member of the BASEBROWSERDATA structure, which tracks whether the browser view window is in an activated state. The derived class makes this call to the base class.
     * @param {Integer} u Type: <b>UINT</b>
     * 
     * The activation state of the window. This is always the SVUIA_ACTIVATE_FOCUS (0x0002) value from the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-svuia_status">SVUIA_STATUS</a> enumeration defined in Shobjidl.h.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-setactivatestate
     */
    SetActivateState(u) {
        result := ComCall(54, this, "uint", u, "HRESULT")
        return result
    }

    /**
     * Deprecated. Updates the value of the _eSecureLockIcon member of the BASEBROWSERDATA structure, which tracks the icon indicating a secure site, as well as updating the icon itself in the UI.
     * @remarks
     * SECURELOCK_SUGGEST_UNSECURE is equivalent to SECURELOCK_FIRSTSUGGEST.
     * @param {Integer} eSecureLock Type: <b>int</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-updatesecurelockicon
     */
    UpdateSecureLockIcon(eSecureLock) {
        result := ComCall(55, this, "int", eSecureLock, "HRESULT")
        return result
    }

    /**
     * Deprecated. Enables the download manager in the base class.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-initializedownloadmanager
     */
    InitializeDownloadManager() {
        result := ComCall(56, this, "HRESULT")
        return result
    }

    /**
     * Deprecated. Enables transitions in the browser view window.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-initializetransitionsite
     */
    InitializeTransitionSite() {
        result := ComCall(57, this, "HRESULT")
        return result
    }

    /**
     * Deprecated. Coordinates the initializing of state between the base and the derived classes.
     * @param {HWND} _hwnd Type: <b>HWND</b>
     * 
     * A handle to the current window.
     * @param {IUnknown} pauto Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> of the outer object's <a href="https://docs.microsoft.com/windows/desktop/api/exdisp/nn-exdisp-iwebbrowser2">IWebBrowser2</a> automation interface.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-_initialize
     */
    _Initialize(_hwnd, pauto) {
        result := ComCall(58, this, HWND, _hwnd, "ptr", pauto, "HRESULT")
        return result
    }

    /**
     * Deprecated. Enables a derived class to request that the base class cancel any pending navigation.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-_cancelpendingnavigationasync
     */
    _CancelPendingNavigationAsync() {
        result := ComCall(59, this, "HRESULT")
        return result
    }

    /**
     * Deprecated. Enables a derived class to request that the base class cancel any pending views.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-_cancelpendingview
     */
    _CancelPendingView() {
        result := ComCall(60, this, "HRESULT")
        return result
    }

    /**
     * Deprecated. Enables the base class to check whether the browser view needs to save changes before closing.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-_maysavechanges
     */
    _MaySaveChanges() {
        result := ComCall(61, this, "HRESULT")
        return result
    }

    /**
     * Deprecated. Enables a derived class to request the base class to either pause (such as before a minimize operation) or resume the browser view.
     * @param {BOOL} fPaused Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> to indicate that the view is to be paused, <b>FALSE</b> otherwise.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-_pauseorresumeview
     */
    _PauseOrResumeView(fPaused) {
        result := ComCall(62, this, BOOL, fPaused, "HRESULT")
        return result
    }

    /**
     * Deprecated. Enables a derived class to ask the base class whether a modal UI is visible. A modal UI blocks minimize and close behavior in the browser window.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-_disablemodeless
     */
    _DisableModeless() {
        result := ComCall(63, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITEMIDLIST>} pidl 
     * @param {Integer} grfHLNF 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    _NavigateToPidl2(pidl, grfHLNF, dwFlags) {
        result := ComCall(64, this, ITEMIDLIST.Ptr, pidl, "uint", grfHLNF, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * Deprecated. Coordinates the renaming of the current browser view when the browser is redirected.
     * @remarks
     * This method is called in response to <a href="https://docs.microsoft.com/windows/desktop/api/shdeprecated/nf-shdeprecated-ibrowserservice-notifyredirect">NotifyRedirect</a>.
     * @param {IShellView} psv Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a> representing the current browser view.
     * @param {Pointer<ITEMIDLIST>} pidlNew Type: <b>LPCITEMIDLIST</b>
     * 
     * A PIDL that indicates the new name of the browser view.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-_tryshell2rename
     */
    _TryShell2Rename(psv, pidlNew) {
        result := ComCall(65, this, "ptr", psv, ITEMIDLIST.Ptr, pidlNew, "HRESULT")
        return result
    }

    /**
     * Deprecated. Coordinates state updates while switching between current and pending browser views.
     * @remarks
     * This method is called by <a href="https://docs.microsoft.com/windows/desktop/api/shdeprecated/nf-shdeprecated-ibrowserservice2-activatependingview">IBrowserService2::ActivatePendingView</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-_switchactivationnow
     */
    _SwitchActivationNow() {
        result := ComCall(66, this, "HRESULT")
        return result
    }

    /**
     * Deprecated. Enables the derived class to issue a command through the IOleCommandTarget::Exec method directly, instead of relying on the base class.
     * @remarks
     * For further information, see <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nf-docobj-iolecommandtarget-exec">IOleCommandTarget::Exec</a>.
     * @param {IUnknown} punkBar Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> of the <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nn-docobj-iolecommandtarget">IOleCommandTarget</a> interface.
     * @param {BOOL} fBroadcast Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> to broadcast the command; <b>FALSE</b> otherwise.
     * @param {Pointer<Guid>} pguidCmdGroup Type: <b>const GUID*</b>
     * 
     * A pointer to the unique identifier of the command group; can be <b>NULL</b> to specify the standard group.
     * @param {Integer} nCmdID Type: <b>DWORD</b>
     * 
     * The command to be executed. This command must belong to the group specified with <i>pguidCmdGroup</i>.
     * @param {Integer} nCmdexecopt Type: <b>DWORD</b>
     * 
     * The values taken from the <a href="https://docs.microsoft.com/windows/desktop/api/docobj/ne-docobj-olecmdexecopt">OLECMDEXECOPT</a> enumeration, which describe how the object should execute the command.
     * @param {Pointer<VARIANT>} pvarargIn Type: <b>VARIANTARG*</b>
     * 
     * A pointer to a <b>VARIANTARG</b> structure containing input arguments. Can be <b>NULL</b>.
     * @param {Pointer<VARIANT>} pvarargOut Type: <b>VARIANTARG*</b>
     * 
     * A pointer to a <b>VARIANTARG</b> structure to receive command output. Can be <b>NULL</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-_execchildren
     */
    _ExecChildren(punkBar, fBroadcast, pguidCmdGroup, nCmdID, nCmdexecopt, pvarargIn, pvarargOut) {
        result := ComCall(67, this, "ptr", punkBar, BOOL, fBroadcast, Guid.Ptr, pguidCmdGroup, "uint", nCmdID, "uint", nCmdexecopt, VARIANT.Ptr, pvarargIn, VARIANT.Ptr, pvarargOut, "HRESULT")
        return result
    }

    /**
     * Deprecated. Allows the derived class to send a message through the SendMessage function directly instead of relying on the base class.
     * @param {HWND} hwndBar Type: <b>HWND</b>
     * 
     * A handle to the browser window whose window procedure receives the message.
     * @param {BOOL} fBroadcast Type: <b>BOOL</b>
     * 
     * The <b>BOOL</b> that indicates whether to allow the derived class to broadcast the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-sendmessage">SendMessage</a> function. <b>TRUE</b> to allow broadcasting; <b>FALSE</b> otherwise.
     * @param {Integer} uMsg Type: <b>UINT</b>
     * 
     * The message to be sent.
     * @param {WPARAM} _wParam Type: <b>WPARAM</b>
     * 
     * Additional message-specific information.
     * @param {LPARAM} _lParam Type: <b>LPARAM</b>
     * 
     * Additional message-specific information.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-_sendchildren
     */
    _SendChildren(hwndBar, fBroadcast, uMsg, _wParam, _lParam) {
        result := ComCall(68, this, HWND, hwndBar, BOOL, fBroadcast, "uint", uMsg, WPARAM, _wParam, LPARAM, _lParam, "HRESULT")
        return result
    }

    /**
     * Deprecated. Gets a structure containing folder information.
     * @remarks
     * This method is called by the derived class.
     * @param {Pointer<FOLDERSETDATA>} pfsd Type: <b>tagFolderSetData*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/shdeprecated/ns-shdeprecated-foldersetdata">FOLDERSETDATA</a> structure that receives the folder information.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-getfoldersetdata
     */
    GetFolderSetData(pfsd) {
        result := ComCall(69, this, FOLDERSETDATA.Ptr, pfsd, "HRESULT")
        return result
    }

    /**
     * Deprecated. Coordinates focus between the base and the derived class when the focus shifts between the derived class's browser toolbars and its view.
     * @param {Integer} itb Type: <b>UINT</b>
     * 
     * The ID of the toolbar gaining focus, or ITB_VIEW if the view is gaining focus.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-_onfocuschange
     */
    _OnFocusChange(itb) {
        result := ComCall(70, this, "uint", itb, "HRESULT")
        return result
    }

    /**
     * Deprecated. Allows a derived class to update its child windows after a sizing event.
     * @param {BOOL} fChildOnly Type: <b>BOOL</b>
     * 
     * A value of type <b>BOOL</b> that indicates whether child windows should be shown or hidden.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-v_showhidechildwindows
     */
    v_ShowHideChildWindows(fChildOnly) {
        result := ComCall(71, this, BOOL, fChildOnly, "HRESULT")
        return result
    }

    /**
     * Deprecated. Gets the ID of the last toolbar or view that had focus.
     * @returns {Integer} Type: <b>UINT</b>
     * 
     * Returns the index of the last toolbar with focus, or ITB_VIEW if the focus was last on the view.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-_get_itblastfocus
     */
    _get_itbLastFocus() {
        result := ComCall(72, this, UInt32)
        return result
    }

    /**
     * Deprecated. Sets the last toolbar or the last view with focus.
     * @param {Integer} itbLastFocus Type: <b>UINT</b>
     * 
     * The index of the last toolbar with focus. Set this parameter to ITB_VIEW to indicate that the view had the last focus.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-_put_itblastfocus
     */
    _put_itbLastFocus(itbLastFocus) {
        result := ComCall(73, this, "uint", itbLastFocus, "HRESULT")
        return result
    }

    /**
     * Deprecated. Allows a derived class to request that the base class update the browser view.
     * @param {Integer} uState Type: <b>UINT</b>
     * 
     * A member of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-svuia_status">SVUIA_STATUS</a> enumeration declaring the browser view's state value.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-_uiactivateview
     */
    _UIActivateView(uState) {
        result := ComCall(74, this, "uint", uState, "HRESULT")
        return result
    }

    /**
     * Deprecated. Used with IBrowserService2::_GetEffectiveClientArea to negotiate the size and position of the browser view.
     * @remarks
     * This method is called by <a href="https://docs.microsoft.com/windows/desktop/api/shdeprecated/nf-shdeprecated-ibrowserservice2-getviewrect">IBrowserService2::GetViewRect</a>.
     * @param {Pointer<RECT>} prc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure stating the dimensions of the browser view's border.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-_getviewborderrect
     */
    _GetViewBorderRect(prc) {
        result := ComCall(75, this, RECT.Ptr, prc, "HRESULT")
        return result
    }

    /**
     * Deprecated. Called to inform other functions involved in the browser view size negotiations that the allowable browser view dimensions have changed.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-_updateviewrectsize
     */
    _UpdateViewRectSize() {
        result := ComCall(76, this, "HRESULT")
        return result
    }

    /**
     * Deprecated. Resizes the border of the browser view in response to the addition or removal of toolbars.
     * @remarks
     * The implementation of this method calls <a href="https://docs.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-_resizenextborderhelper">IBrowserService2::_ResizeNextBorderHelper</a>.
     * @param {Integer} itb Type: <b>UINT</b>
     * 
     * The index of the toolbar that was added or removed.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-_resizenextborder
     */
    _ResizeNextBorder(itb) {
        result := ComCall(77, this, "uint", itb, "HRESULT")
        return result
    }

    /**
     * Deprecated. Calls IBrowserService2::_UpdateViewRectSize, then updates the browser view by using IOleInPlaceActiveObject::ResizeBorder.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-_resizeview
     */
    _ResizeView() {
        result := ComCall(78, this, "HRESULT")
        return result
    }

    /**
     * Deprecated. Used with IBrowserService2::_GetViewBorderRect to negotiate the dimensions of the browser view.
     * @param {HMONITOR} hmon Type: <b>HMONITOR</b>
     * 
     * The handle of the monitor on which the view is displayed.
     * @returns {RECT} Type: <b>LPRECT</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure indicating the dimensions of the available client area.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-_geteffectiveclientarea
     */
    _GetEffectiveClientArea(hmon) {
        lprectBorder := RECT()
        result := ComCall(79, this, RECT.Ptr, lprectBorder, HMONITOR, hmon, "HRESULT")
        return lprectBorder
    }

    /**
     * Deprecated. Returns a stream used to load or save the view state.
     * @param {Pointer<ITEMIDLIST>} pidl Type: <b>LPCITEMIDLIST</b>
     * 
     * A PIDL that identifies the view.
     * @param {Integer} grfMode Type: <b>DWORD</b>
     * 
     * Not used.
     * @param {PWSTR} pwszName Type: <b>LPCWSTR</b>
     * 
     * A pointer to a buffer that contains the Unicode name of the window.
     * @returns {IStream} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a></b>
     * 
     * Stream that can be used to load or save the view state.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-v_getviewstream
     */
    v_GetViewStream(pidl, grfMode, pwszName) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(80, this, ITEMIDLIST.Ptr, pidl, "uint", grfMode, "ptr", pwszName, IStream)
        return result
    }

    /**
     * Deprecated. Calls the SendMessage function with a message received by the view, using the _hwndView member of the BASEBROWSERDATA structure as the SendMessage hWnd parameter.
     * @param {Integer} uMsg Type: <b>UINT</b>
     * 
     * The message to be sent.
     * @param {WPARAM} _wParam Type: <b>WPARAM</b>
     * 
     * Additional message-specific information.
     * @param {LPARAM} _lParam Type: <b>LPARAM</b>
     * 
     * Additional message-specific information.
     * @returns {LRESULT} Type: <b>LRESULT</b>
     * 
     * The return value specifies the result of the message processing; it depends on the message sent.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-forwardviewmsg
     */
    ForwardViewMsg(uMsg, _wParam, _lParam) {
        result := ComCall(81, this, "uint", uMsg, WPARAM, _wParam, LPARAM, _lParam, LRESULT)
        return result
    }

    /**
     * Deprecated. Implemented by a derived class to define menu accelerators that can be used in a call to TranslateAcceleratorSB.
     * @param {HACCEL} hacc Type: <b>HACCEL</b>
     * 
     * A handle to an array of <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-accel">ACCEL</a> structures, each structure describing a keyboard mnemonic.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-setacceleratormenu
     */
    SetAcceleratorMenu(hacc) {
        result := ComCall(82, this, HACCEL, hacc, "HRESULT")
        return result
    }

    /**
     * Deprecated. Returns the number of toolbars in the browser window.
     * @remarks
     * This method is implemented by the derived class.
     * @returns {Integer} Type: <b>int</b>
     * 
     * The number of toolbars in the browser window.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-_gettoolbarcount
     */
    _GetToolbarCount() {
        result := ComCall(83, this, Int32)
        return result
    }

    /**
     * Deprecated. Gets a specific item from a toolbar.
     * @remarks
     * This method is implemented by the derived class.
     * @param {Integer} itb Type: <b>int</b>
     * 
     * The index of the toolbar item to retrieve.
     * @returns {Pointer<TOOLBARITEM>} Type: <b>LPTOOLBARITEM</b>
     * 
     * A pointer to a [TOOLBARITEM](./ns-shdeprecated-toolbaritem.md) structure that represents a toolbar item.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-_gettoolbaritem
     */
    _GetToolbarItem(itb) {
        result := ComCall(84, this, "int", itb, TOOLBARITEM.Ptr)
        return result
    }

    /**
     * Deprecated. Saves the state of browser toolbars.
     * @remarks
     * This method is implemented by the derived class.
     * @param {IStream} pstm Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> used to store the browser toolbar's state.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-_savetoolbars
     */
    _SaveToolbars(pstm) {
        result := ComCall(85, this, "ptr", pstm, "HRESULT")
        return result
    }

    /**
     * Deprecated. Loads the saved state of the browser's toolbars.
     * @remarks
     * This method is implemented by the derived class.
     * @param {IStream} pstm Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> from which to load the state  of the browser's toolbars.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-_loadtoolbars
     */
    _LoadToolbars(pstm) {
        result := ComCall(86, this, "ptr", pstm, "HRESULT")
        return result
    }

    /**
     * Deprecated. Requests the closing of the browser toolbars hosted by the derived class.
     * @param {BOOL} fClose Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> to close the toolbar through <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-idockingwindow-closedw">IDockingWindow::CloseDW</a>; <b>FALSE</b> to release the toolbar.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-_closeandreleasetoolbars
     */
    _CloseAndReleaseToolbars(fClose) {
        result := ComCall(87, this, BOOL, fClose, "HRESULT")
        return result
    }

    /**
     * Deprecated. Used when translating accelerators through TranslateAcceleratorSB and in checking the cycle of focus between the view and the browser's toolbars.
     * @param {Pointer<MSG>} lpMsg Type: <b>LPMSG</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-msg">MSG</a> that contains the keystroke message.
     * @param {Integer} itbNext Type: <b>UINT</b>
     * 
     * The index of the next toolbar, or ITB_VIEW if focus is shifting to the view.
     * @param {Integer} citb Type: <b>int</b>
     * 
     * The ID of the current toolbar with focus, or ITB_VIEW if the view has focus.
     * @param {Pointer<Pointer<TOOLBARITEM>>} pptbi Type: <b>LPTOOLBARITEM*</b>
     * 
     * A pointer to a [TOOLBARITEM](./ns-shdeprecated-toolbaritem.md) structure that represents the toolbar receiving the focus.
     * @param {Pointer<HWND>} phwnd Type: <b>HWND*</b>
     * 
     * A pointer to the handle of the window that contains the toolbar.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-v_maygetnexttoolbarfocus
     */
    v_MayGetNextToolbarFocus(lpMsg, itbNext, citb, pptbi, phwnd) {
        pptbiMarshal := pptbi is VarRef ? "ptr*" : "ptr"

        result := ComCall(88, this, MSG.Ptr, lpMsg, "uint", itbNext, "int", citb, pptbiMarshal, pptbi, HWND.Ptr, phwnd, "HRESULT")
        return result
    }

    /**
     * Deprecated. A helper method used by the implementation of IBrowserService2::_ResizeNextBorder.
     * @param {Integer} itb Type: <b>UINT</b>
     * 
     * The index of the browser toolbar.
     * @param {BOOL} bUseHmonitor Type: <b>BOOL</b>
     * 
     * A value of type <b>BOOL</b> that indicates whether to use an <b>HMONITOR</b> to determine the display. <b>TRUE</b> to use the <b>HMONITOR</b>; <b>FALSE</b> to ignore the particular display in the size determination.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-_resizenextborderhelper
     */
    _ResizeNextBorderHelper(itb, bUseHmonitor) {
        result := ComCall(89, this, "uint", itb, BOOL, bUseHmonitor, "HRESULT")
        return result
    }

    /**
     * Deprecated. Returns the index of a browser toolbar item based on Component Object Model (COM) identity rules.
     * @param {IUnknown} punkSrc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> of the browser toolbar item.
     * @returns {Integer} Type: <b>UINT</b>
     * 
     * The index of the browser toolbar item.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-_findtbar
     */
    _FindTBar(punkSrc) {
        result := ComCall(90, this, "ptr", punkSrc, UInt32)
        return result
    }

    /**
     * Deprecated. Sets the focus on a toolbar or on the browser's view window. Called when translating accelerators through TranslateAcceleratorSB or when IBrowserService2::v_MayGetNextToolbarFocus fails.
     * @param {Pointer<TOOLBARITEM>} ptbi Type: <b>LPTOOLBARITEM</b>
     * 
     * A pointer to a [TOOLBARITEM](./ns-shdeprecated-toolbaritem.md) structure that specifies a browser toolbar item.
     * @param {HWND} _hwnd Type: <b>HWND</b>
     * 
     * The handle of the browser window in which the focus shift is taking place.
     * @param {Pointer<MSG>} lpMsg Type: <b>LPMSG</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-msg">MSG</a> that contains a keystroke message that indicates an accelerator.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-_setfocus
     */
    _SetFocus(ptbi, _hwnd, lpMsg) {
        result := ComCall(91, this, TOOLBARITEM.Ptr, ptbi, HWND, _hwnd, MSG.Ptr, lpMsg, "HRESULT")
        return result
    }

    /**
     * Deprecated. Called by a derived class to instruct the base class to proceed with the translation of keyboard mnemonics.
     * @param {Pointer<MSG>} pmsg Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-msg">MSG</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-msg">MSG</a> that contains the keystroke message.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-v_maytranslateaccelerator
     */
    v_MayTranslateAccelerator(pmsg) {
        result := ComCall(92, this, MSG.Ptr, pmsg, "HRESULT")
        return result
    }

    /**
     * Deprecated. A helper method for the implementation of GetBorderDW.
     * @param {IUnknown} punkSrc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> that represents the object for which the border space is being requested.
     * @param {BOOL} bUseHmonitor Type: <b>BOOL</b>
     * 
     * A value of type <b>BOOL</b> that indicates whether to use an <b>HMONITOR</b> to determine the display. <b>TRUE</b> to use the <b>HMONITOR</b>; <b>FALSE</b> to ignore the particular display in the size determination.
     * @returns {RECT} Type: <b>LPRECT</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that contains the dimensions of the available border space for the browser.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-_getborderdwhelper
     */
    _GetBorderDWHelper(punkSrc, bUseHmonitor) {
        lprectBorder := RECT()
        result := ComCall(93, this, "ptr", punkSrc, RECT.Ptr, lprectBorder, BOOL, bUseHmonitor, "HRESULT")
        return lprectBorder
    }

    /**
     * Deprecated. Called by the base class to validate a zone crossing when navigating from one page to another.
     * @param {Pointer<ITEMIDLIST>} pidl Type: <b>LPCITEMIDLIST</b>
     * 
     * The PIDL of the navigation destination.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-v_checkzonecrossing
     */
    v_CheckZoneCrossing(pidl) {
        result := ComCall(94, this, ITEMIDLIST.Ptr, pidl, "HRESULT")
        return result
    }

    Query(iid) {
        if (IBrowserService2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.WndProcBS := CallbackCreate(GetMethod(implObj, "WndProcBS"), flags, 5)
        this.vtbl.SetAsDefFolderSettings := CallbackCreate(GetMethod(implObj, "SetAsDefFolderSettings"), flags, 1)
        this.vtbl.GetViewRect := CallbackCreate(GetMethod(implObj, "GetViewRect"), flags, 2)
        this.vtbl.OnSize := CallbackCreate(GetMethod(implObj, "OnSize"), flags, 2)
        this.vtbl.OnCreate := CallbackCreate(GetMethod(implObj, "OnCreate"), flags, 2)
        this.vtbl.OnCommand := CallbackCreate(GetMethod(implObj, "OnCommand"), flags, 3)
        this.vtbl.OnDestroy := CallbackCreate(GetMethod(implObj, "OnDestroy"), flags, 1)
        this.vtbl.OnNotify := CallbackCreate(GetMethod(implObj, "OnNotify"), flags, 2)
        this.vtbl.OnSetFocus := CallbackCreate(GetMethod(implObj, "OnSetFocus"), flags, 1)
        this.vtbl.OnFrameWindowActivateBS := CallbackCreate(GetMethod(implObj, "OnFrameWindowActivateBS"), flags, 2)
        this.vtbl.ReleaseShellView := CallbackCreate(GetMethod(implObj, "ReleaseShellView"), flags, 1)
        this.vtbl.ActivatePendingView := CallbackCreate(GetMethod(implObj, "ActivatePendingView"), flags, 1)
        this.vtbl.CreateViewWindow := CallbackCreate(GetMethod(implObj, "CreateViewWindow"), flags, 5)
        this.vtbl.CreateBrowserPropSheetExt := CallbackCreate(GetMethod(implObj, "CreateBrowserPropSheetExt"), flags, 3)
        this.vtbl.GetViewWindow := CallbackCreate(GetMethod(implObj, "GetViewWindow"), flags, 2)
        this.vtbl.GetBaseBrowserData := CallbackCreate(GetMethod(implObj, "GetBaseBrowserData"), flags, 2)
        this.vtbl.PutBaseBrowserData := CallbackCreate(GetMethod(implObj, "PutBaseBrowserData"), flags, 1)
        this.vtbl.InitializeTravelLog := CallbackCreate(GetMethod(implObj, "InitializeTravelLog"), flags, 3)
        this.vtbl.SetTopBrowser := CallbackCreate(GetMethod(implObj, "SetTopBrowser"), flags, 1)
        this.vtbl.Offline := CallbackCreate(GetMethod(implObj, "Offline"), flags, 2)
        this.vtbl.AllowViewResize := CallbackCreate(GetMethod(implObj, "AllowViewResize"), flags, 2)
        this.vtbl.SetActivateState := CallbackCreate(GetMethod(implObj, "SetActivateState"), flags, 2)
        this.vtbl.UpdateSecureLockIcon := CallbackCreate(GetMethod(implObj, "UpdateSecureLockIcon"), flags, 2)
        this.vtbl.InitializeDownloadManager := CallbackCreate(GetMethod(implObj, "InitializeDownloadManager"), flags, 1)
        this.vtbl.InitializeTransitionSite := CallbackCreate(GetMethod(implObj, "InitializeTransitionSite"), flags, 1)
        this.vtbl._Initialize := CallbackCreate(GetMethod(implObj, "_Initialize"), flags, 3)
        this.vtbl._CancelPendingNavigationAsync := CallbackCreate(GetMethod(implObj, "_CancelPendingNavigationAsync"), flags, 1)
        this.vtbl._CancelPendingView := CallbackCreate(GetMethod(implObj, "_CancelPendingView"), flags, 1)
        this.vtbl._MaySaveChanges := CallbackCreate(GetMethod(implObj, "_MaySaveChanges"), flags, 1)
        this.vtbl._PauseOrResumeView := CallbackCreate(GetMethod(implObj, "_PauseOrResumeView"), flags, 2)
        this.vtbl._DisableModeless := CallbackCreate(GetMethod(implObj, "_DisableModeless"), flags, 1)
        this.vtbl._NavigateToPidl2 := CallbackCreate(GetMethod(implObj, "_NavigateToPidl2"), flags, 4)
        this.vtbl._TryShell2Rename := CallbackCreate(GetMethod(implObj, "_TryShell2Rename"), flags, 3)
        this.vtbl._SwitchActivationNow := CallbackCreate(GetMethod(implObj, "_SwitchActivationNow"), flags, 1)
        this.vtbl._ExecChildren := CallbackCreate(GetMethod(implObj, "_ExecChildren"), flags, 8)
        this.vtbl._SendChildren := CallbackCreate(GetMethod(implObj, "_SendChildren"), flags, 6)
        this.vtbl.GetFolderSetData := CallbackCreate(GetMethod(implObj, "GetFolderSetData"), flags, 2)
        this.vtbl._OnFocusChange := CallbackCreate(GetMethod(implObj, "_OnFocusChange"), flags, 2)
        this.vtbl.v_ShowHideChildWindows := CallbackCreate(GetMethod(implObj, "v_ShowHideChildWindows"), flags, 2)
        this.vtbl._get_itbLastFocus := CallbackCreate(GetMethod(implObj, "_get_itbLastFocus"), flags, 1)
        this.vtbl._put_itbLastFocus := CallbackCreate(GetMethod(implObj, "_put_itbLastFocus"), flags, 2)
        this.vtbl._UIActivateView := CallbackCreate(GetMethod(implObj, "_UIActivateView"), flags, 2)
        this.vtbl._GetViewBorderRect := CallbackCreate(GetMethod(implObj, "_GetViewBorderRect"), flags, 2)
        this.vtbl._UpdateViewRectSize := CallbackCreate(GetMethod(implObj, "_UpdateViewRectSize"), flags, 1)
        this.vtbl._ResizeNextBorder := CallbackCreate(GetMethod(implObj, "_ResizeNextBorder"), flags, 2)
        this.vtbl._ResizeView := CallbackCreate(GetMethod(implObj, "_ResizeView"), flags, 1)
        this.vtbl._GetEffectiveClientArea := CallbackCreate(GetMethod(implObj, "_GetEffectiveClientArea"), flags, 3)
        this.vtbl.v_GetViewStream := CallbackCreate(GetMethod(implObj, "v_GetViewStream"), flags, 4)
        this.vtbl.ForwardViewMsg := CallbackCreate(GetMethod(implObj, "ForwardViewMsg"), flags, 4)
        this.vtbl.SetAcceleratorMenu := CallbackCreate(GetMethod(implObj, "SetAcceleratorMenu"), flags, 2)
        this.vtbl._GetToolbarCount := CallbackCreate(GetMethod(implObj, "_GetToolbarCount"), flags, 1)
        this.vtbl._GetToolbarItem := CallbackCreate(GetMethod(implObj, "_GetToolbarItem"), flags, 2)
        this.vtbl._SaveToolbars := CallbackCreate(GetMethod(implObj, "_SaveToolbars"), flags, 2)
        this.vtbl._LoadToolbars := CallbackCreate(GetMethod(implObj, "_LoadToolbars"), flags, 2)
        this.vtbl._CloseAndReleaseToolbars := CallbackCreate(GetMethod(implObj, "_CloseAndReleaseToolbars"), flags, 2)
        this.vtbl.v_MayGetNextToolbarFocus := CallbackCreate(GetMethod(implObj, "v_MayGetNextToolbarFocus"), flags, 6)
        this.vtbl._ResizeNextBorderHelper := CallbackCreate(GetMethod(implObj, "_ResizeNextBorderHelper"), flags, 3)
        this.vtbl._FindTBar := CallbackCreate(GetMethod(implObj, "_FindTBar"), flags, 2)
        this.vtbl._SetFocus := CallbackCreate(GetMethod(implObj, "_SetFocus"), flags, 4)
        this.vtbl.v_MayTranslateAccelerator := CallbackCreate(GetMethod(implObj, "v_MayTranslateAccelerator"), flags, 2)
        this.vtbl._GetBorderDWHelper := CallbackCreate(GetMethod(implObj, "_GetBorderDWHelper"), flags, 4)
        this.vtbl.v_CheckZoneCrossing := CallbackCreate(GetMethod(implObj, "v_CheckZoneCrossing"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.WndProcBS)
        CallbackFree(this.vtbl.SetAsDefFolderSettings)
        CallbackFree(this.vtbl.GetViewRect)
        CallbackFree(this.vtbl.OnSize)
        CallbackFree(this.vtbl.OnCreate)
        CallbackFree(this.vtbl.OnCommand)
        CallbackFree(this.vtbl.OnDestroy)
        CallbackFree(this.vtbl.OnNotify)
        CallbackFree(this.vtbl.OnSetFocus)
        CallbackFree(this.vtbl.OnFrameWindowActivateBS)
        CallbackFree(this.vtbl.ReleaseShellView)
        CallbackFree(this.vtbl.ActivatePendingView)
        CallbackFree(this.vtbl.CreateViewWindow)
        CallbackFree(this.vtbl.CreateBrowserPropSheetExt)
        CallbackFree(this.vtbl.GetViewWindow)
        CallbackFree(this.vtbl.GetBaseBrowserData)
        CallbackFree(this.vtbl.PutBaseBrowserData)
        CallbackFree(this.vtbl.InitializeTravelLog)
        CallbackFree(this.vtbl.SetTopBrowser)
        CallbackFree(this.vtbl.Offline)
        CallbackFree(this.vtbl.AllowViewResize)
        CallbackFree(this.vtbl.SetActivateState)
        CallbackFree(this.vtbl.UpdateSecureLockIcon)
        CallbackFree(this.vtbl.InitializeDownloadManager)
        CallbackFree(this.vtbl.InitializeTransitionSite)
        CallbackFree(this.vtbl._Initialize)
        CallbackFree(this.vtbl._CancelPendingNavigationAsync)
        CallbackFree(this.vtbl._CancelPendingView)
        CallbackFree(this.vtbl._MaySaveChanges)
        CallbackFree(this.vtbl._PauseOrResumeView)
        CallbackFree(this.vtbl._DisableModeless)
        CallbackFree(this.vtbl._NavigateToPidl2)
        CallbackFree(this.vtbl._TryShell2Rename)
        CallbackFree(this.vtbl._SwitchActivationNow)
        CallbackFree(this.vtbl._ExecChildren)
        CallbackFree(this.vtbl._SendChildren)
        CallbackFree(this.vtbl.GetFolderSetData)
        CallbackFree(this.vtbl._OnFocusChange)
        CallbackFree(this.vtbl.v_ShowHideChildWindows)
        CallbackFree(this.vtbl._get_itbLastFocus)
        CallbackFree(this.vtbl._put_itbLastFocus)
        CallbackFree(this.vtbl._UIActivateView)
        CallbackFree(this.vtbl._GetViewBorderRect)
        CallbackFree(this.vtbl._UpdateViewRectSize)
        CallbackFree(this.vtbl._ResizeNextBorder)
        CallbackFree(this.vtbl._ResizeView)
        CallbackFree(this.vtbl._GetEffectiveClientArea)
        CallbackFree(this.vtbl.v_GetViewStream)
        CallbackFree(this.vtbl.ForwardViewMsg)
        CallbackFree(this.vtbl.SetAcceleratorMenu)
        CallbackFree(this.vtbl._GetToolbarCount)
        CallbackFree(this.vtbl._GetToolbarItem)
        CallbackFree(this.vtbl._SaveToolbars)
        CallbackFree(this.vtbl._LoadToolbars)
        CallbackFree(this.vtbl._CloseAndReleaseToolbars)
        CallbackFree(this.vtbl.v_MayGetNextToolbarFocus)
        CallbackFree(this.vtbl._ResizeNextBorderHelper)
        CallbackFree(this.vtbl._FindTBar)
        CallbackFree(this.vtbl._SetFocus)
        CallbackFree(this.vtbl.v_MayTranslateAccelerator)
        CallbackFree(this.vtbl._GetBorderDWHelper)
        CallbackFree(this.vtbl.v_CheckZoneCrossing)
    }
}
