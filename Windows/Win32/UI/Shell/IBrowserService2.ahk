#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\RECT.ahk
#Include ..\..\Foundation\HWND.ahk
#Include .\IBrowserService.ahk

/**
 * Deprecated.
 * @remarks
 * 
 * This interface also provides the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/shdeprecated/nn-shdeprecated-ibrowserservice">IBrowserService</a> interface, from which it inherits.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nn-shdeprecated-ibrowserservice2
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IBrowserService2 extends IBrowserService{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBrowserService2
     * @type {Guid}
     */
    static IID => Guid("{68bd21cc-438b-11d2-a560-00a0c92dbfe8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 33

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["WndProcBS", "SetAsDefFolderSettings", "GetViewRect", "OnSize", "OnCreate", "OnCommand", "OnDestroy", "OnNotify", "OnSetFocus", "OnFrameWindowActivateBS", "ReleaseShellView", "ActivatePendingView", "CreateViewWindow", "CreateBrowserPropSheetExt", "GetViewWindow", "GetBaseBrowserData", "PutBaseBrowserData", "InitializeTravelLog", "SetTopBrowser", "Offline", "AllowViewResize", "SetActivateState", "UpdateSecureLockIcon", "InitializeDownloadManager", "InitializeTransitionSite", "_Initialize", "_CancelPendingNavigationAsync", "_CancelPendingView", "_MaySaveChanges", "_PauseOrResumeView", "_DisableModeless", "_NavigateToPidl2", "_TryShell2Rename", "_SwitchActivationNow", "_ExecChildren", "_SendChildren", "GetFolderSetData", "_OnFocusChange", "v_ShowHideChildWindows", "_get_itbLastFocus", "_put_itbLastFocus", "_UIActivateView", "_GetViewBorderRect", "_UpdateViewRectSize", "_ResizeNextBorder", "_ResizeView", "_GetEffectiveClientArea", "v_GetViewStream", "ForwardViewMsg", "SetAcceleratorMenu", "_GetToolbarCount", "_GetToolbarItem", "_SaveToolbars", "_LoadToolbars", "_CloseAndReleaseToolbars", "v_MayGetNextToolbarFocus", "_ResizeNextBorderHelper", "_FindTBar", "_SetFocus", "v_MayTranslateAccelerator", "_GetBorderDWHelper", "v_CheckZoneCrossing"]

    /**
     * Deprecated. Allows a derived class to call the WinProc function of the base class.
     * @param {HWND} hwnd Type: <b>HWND</b>
     * 
     * The handle of the window receiving the message.
     * @param {Integer} uMsg Type: <b>UINT</b>
     * 
     * The message received by the window.
     * @param {WPARAM} wParam Type: <b>WPARAM</b>
     * 
     * Additional message information specific to the message type.
     * @param {LPARAM} lParam Type: <b>LPARAM</b>
     * 
     * Additional message information specific to the message type.
     * @returns {LRESULT} Type: <b>LRESULT</b>
     * 
     * The return value specifies the result of the message processing; it depends on the message sent.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice2-wndprocbs
     */
    WndProcBS(hwnd, uMsg, wParam, lParam) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(33, this, "ptr", hwnd, "uint", uMsg, "ptr", wParam, "ptr", lParam, "ptr")
        return result
    }

    /**
     * Deprecated. Sets the folder's current view mode as the default view mode for all folders. Used by the Folder Options dialog.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice2-setasdeffoldersettings
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
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice2-getviewrect
     */
    GetViewRect() {
        prc := RECT()
        result := ComCall(35, this, "ptr", prc, "HRESULT")
        return prc
    }

    /**
     * Deprecated. Calls the derived class from the base class on receipt of a WM_SIZE message. The derived class handles the message.
     * @param {WPARAM} wParam Type: <b>WPARAM</b>
     * 
     * Additional information provided by the <a href="https://docs.microsoft.com/windows/desktop/winmsg/wm-size">WM_SIZE</a> message.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice2-onsize
     */
    OnSize(wParam) {
        result := ComCall(36, this, "ptr", wParam, "HRESULT")
        return result
    }

    /**
     * Deprecated. Calls the derived class from the base class on receipt of a WM_CREATE message. The derived class handles the message.
     * @param {Pointer<CREATESTRUCTW>} pcs Type: <b>tagCREATESTRUCTW*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-createstructa">CREATESTRUCT</a> structure that receives the initialization parameters passed to the window procedure (WinProc) of the class.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice2-oncreate
     */
    OnCreate(pcs) {
        result := ComCall(37, this, "ptr", pcs, "HRESULT")
        return result
    }

    /**
     * Deprecated. Calls the derived class from the base class on receipt of a WM_COMMAND message. The derived class handles the message.
     * @param {WPARAM} wParam Type: <b>WPARAM</b>
     * 
     * Additional information taken from the <a href="https://docs.microsoft.com/windows/desktop/menurc/wm-command">WM_COMMAND</a> message. The high-order word specifies the notification code if the message is from a control. If the message is from an accelerator, this value is 1. If the message is from a menu, this value is zero. 
     *                     
     * 
     * The low-order word specifies the identifier of the menu item, control, or accelerator.
     * @param {LPARAM} lParam Type: <b>LPARAM</b>
     * 
     * Additional information taken from the <a href="https://docs.microsoft.com/windows/desktop/menurc/wm-command">WM_COMMAND</a> message. Handle to the control sending the message if the message is from a control. Otherwise, this parameter is <b>NULL</b>.
     * @returns {LRESULT} Type: <b>LRESULT</b>
     * 
     * The return value specifies the result of the command processing; it depends on the command sent.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice2-oncommand
     */
    OnCommand(wParam, lParam) {
        result := ComCall(38, this, "ptr", wParam, "ptr", lParam, "ptr")
        return result
    }

    /**
     * Deprecated. Calls the derived class from the base class on receipt of a WM_DESTROY message. The derived class handles the message.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice2-ondestroy
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
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice2-onnotify
     */
    OnNotify(pnm) {
        result := ComCall(40, this, "ptr", pnm, "ptr")
        return result
    }

    /**
     * Deprecated. Calls the derived class from the base class on receipt of a WM_SETFOCUS message. The derived class handles the message.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice2-onsetfocus
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
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice2-onframewindowactivatebs
     */
    OnFrameWindowActivateBS(fActive) {
        result := ComCall(42, this, "int", fActive, "HRESULT")
        return result
    }

    /**
     * Deprecated. Coordinates the view lifetime between the base class and its derived class.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice2-releaseshellview
     */
    ReleaseShellView() {
        result := ComCall(43, this, "HRESULT")
        return result
    }

    /**
     * Deprecated. Coordinates state updating while the browser is switching between a current and a pending view.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice2-activatependingview
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
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice2-createviewwindow
     */
    CreateViewWindow(psvNew, psvOld, prcView) {
        phwnd := HWND()
        result := ComCall(45, this, "ptr", psvNew, "ptr", psvOld, "ptr", prcView, "ptr", phwnd, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice2-createbrowserpropsheetext
     */
    CreateBrowserPropSheetExt(riid) {
        result := ComCall(46, this, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Deprecated. Provides direct access to the browser view window created by IBrowserService2::CreateViewWindow.
     * @returns {HWND} Type: <b>HWND*</b>
     * 
     * A pointer to the handle of the browser window.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice2-getviewwindow
     */
    GetViewWindow() {
        phwndView := HWND()
        result := ComCall(47, this, "ptr", phwndView, "HRESULT")
        return phwndView
    }

    /**
     * Deprecated. Gets a read-only structure containing the protected elements owned by the base class, for the purpose of determining state.
     * @returns {Pointer<BASEBROWSERDATALH>} Type: <b>LPCBASEBROWSERDATA*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/shdeprecated/ns-shdeprecated-basebrowserdatalh">BASEBROWSERDATA</a> structure that receives the read-only state of the base browser.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice2-getbasebrowserdata
     */
    GetBaseBrowserData() {
        result := ComCall(48, this, "ptr*", &pbbd := 0, "HRESULT")
        return pbbd
    }

    /**
     * Deprecated. Gets a structure that allows read/write access to protected members of the base class. Note, however, that state should only be updated by the base browser.
     * @returns {Pointer<BASEBROWSERDATALH>} Type: <b>LPBASEBROWSERDATA</b>
     * 
     * A pointer to a <a href="/windows/desktop/api/shdeprecated/ns-shdeprecated-basebrowserdatalh">BASEBROWSERDATA</a> structure.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice2-putbasebrowserdata
     */
    PutBaseBrowserData() {
        result := ComCall(49, this, "ptr")
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
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice2-initializetravellog
     */
    InitializeTravelLog(ptl, dw) {
        result := ComCall(50, this, "ptr", ptl, "uint", dw, "HRESULT")
        return result
    }

    /**
     * Deprecated. Informs the base class when it becomes the topmost browser instance.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice2-settopbrowser
     */
    SetTopBrowser() {
        result := ComCall(51, this, "HRESULT")
        return result
    }

    /**
     * Deprecated. Checks for and updates the browser's offline status, synchronzing the state between the base class and any derived classes.
     * @param {Integer} iCmd Type: <b>int</b>
     * 
     * One of the following commands.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * In the case of SBSC_TOGGLE, returns standard error codes. In the case of SBSC_QUERY, returns S_OK if offline, S_FALSE otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice2-offline
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
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice2-allowviewresize
     */
    AllowViewResize(f) {
        result := ComCall(53, this, "int", f, "HRESULT")
        return result
    }

    /**
     * Deprecated. Updates the value of the _uActivateState member of the BASEBROWSERDATA structure, which tracks whether the browser view window is in an activated state. The derived class makes this call to the base class.
     * @param {Integer} u Type: <b>UINT</b>
     * 
     * The activation state of the window. This is always the SVUIA_ACTIVATE_FOCUS (0x0002) value from the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-svuia_status">SVUIA_STATUS</a> enumeration defined in Shobjidl.h.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice2-setactivatestate
     */
    SetActivateState(u) {
        result := ComCall(54, this, "uint", u, "HRESULT")
        return result
    }

    /**
     * Deprecated. Updates the value of the _eSecureLockIcon member of the BASEBROWSERDATA structure, which tracks the icon indicating a secure site, as well as updating the icon itself in the UI.
     * @param {Integer} eSecureLock Type: <b>int</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice2-updatesecurelockicon
     */
    UpdateSecureLockIcon(eSecureLock) {
        result := ComCall(55, this, "int", eSecureLock, "HRESULT")
        return result
    }

    /**
     * Deprecated. Enables the download manager in the base class.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice2-initializedownloadmanager
     */
    InitializeDownloadManager() {
        result := ComCall(56, this, "HRESULT")
        return result
    }

    /**
     * Deprecated. Enables transitions in the browser view window.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice2-initializetransitionsite
     */
    InitializeTransitionSite() {
        result := ComCall(57, this, "HRESULT")
        return result
    }

    /**
     * Deprecated. Coordinates the initializing of state between the base and the derived classes.
     * @param {HWND} hwnd Type: <b>HWND</b>
     * 
     * A handle to the current window.
     * @param {IUnknown} pauto Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> of the outer object's <a href="https://docs.microsoft.com/windows/desktop/api/exdisp/nn-exdisp-iwebbrowser2">IWebBrowser2</a> automation interface.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice2-_initialize
     */
    _Initialize(hwnd, pauto) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(58, this, "ptr", hwnd, "ptr", pauto, "HRESULT")
        return result
    }

    /**
     * Deprecated. Enables a derived class to request that the base class cancel any pending navigation.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice2-_cancelpendingnavigationasync
     */
    _CancelPendingNavigationAsync() {
        result := ComCall(59, this, "HRESULT")
        return result
    }

    /**
     * Deprecated. Enables a derived class to request that the base class cancel any pending views.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice2-_cancelpendingview
     */
    _CancelPendingView() {
        result := ComCall(60, this, "HRESULT")
        return result
    }

    /**
     * Deprecated. Enables the base class to check whether the browser view needs to save changes before closing.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice2-_maysavechanges
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
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice2-_pauseorresumeview
     */
    _PauseOrResumeView(fPaused) {
        result := ComCall(62, this, "int", fPaused, "HRESULT")
        return result
    }

    /**
     * Deprecated. Enables a derived class to ask the base class whether a modal UI is visible. A modal UI blocks minimize and close behavior in the browser window.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice2-_disablemodeless
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
        result := ComCall(64, this, "ptr", pidl, "uint", grfHLNF, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * Deprecated. Coordinates the renaming of the current browser view when the browser is redirected.
     * @param {IShellView} psv Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a> representing the current browser view.
     * @param {Pointer<ITEMIDLIST>} pidlNew Type: <b>LPCITEMIDLIST</b>
     * 
     * A PIDL that indicates the new name of the browser view.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice2-_tryshell2rename
     */
    _TryShell2Rename(psv, pidlNew) {
        result := ComCall(65, this, "ptr", psv, "ptr", pidlNew, "HRESULT")
        return result
    }

    /**
     * Deprecated. Coordinates state updates while switching between current and pending browser views.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice2-_switchactivationnow
     */
    _SwitchActivationNow() {
        result := ComCall(66, this, "HRESULT")
        return result
    }

    /**
     * Deprecated. Enables the derived class to issue a command through the IOleCommandTarget::Exec method directly, instead of relying on the base class.
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
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice2-_execchildren
     */
    _ExecChildren(punkBar, fBroadcast, pguidCmdGroup, nCmdID, nCmdexecopt, pvarargIn, pvarargOut) {
        result := ComCall(67, this, "ptr", punkBar, "int", fBroadcast, "ptr", pguidCmdGroup, "uint", nCmdID, "uint", nCmdexecopt, "ptr", pvarargIn, "ptr", pvarargOut, "HRESULT")
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
     * @param {WPARAM} wParam Type: <b>WPARAM</b>
     * 
     * Additional message-specific information.
     * @param {LPARAM} lParam Type: <b>LPARAM</b>
     * 
     * Additional message-specific information.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice2-_sendchildren
     */
    _SendChildren(hwndBar, fBroadcast, uMsg, wParam, lParam) {
        hwndBar := hwndBar is Win32Handle ? NumGet(hwndBar, "ptr") : hwndBar

        result := ComCall(68, this, "ptr", hwndBar, "int", fBroadcast, "uint", uMsg, "ptr", wParam, "ptr", lParam, "HRESULT")
        return result
    }

    /**
     * Deprecated. Gets a structure containing folder information.
     * @param {Pointer<FOLDERSETDATA>} pfsd Type: <b>tagFolderSetData*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/shdeprecated/ns-shdeprecated-foldersetdata">FOLDERSETDATA</a> structure that receives the folder information.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice2-getfoldersetdata
     */
    GetFolderSetData(pfsd) {
        result := ComCall(69, this, "ptr", pfsd, "HRESULT")
        return result
    }

    /**
     * Deprecated. Coordinates focus between the base and the derived class when the focus shifts between the derived class's browser toolbars and its view.
     * @param {Integer} itb Type: <b>UINT</b>
     * 
     * The ID of the toolbar gaining focus, or ITB_VIEW if the view is gaining focus.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice2-_onfocuschange
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
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice2-v_showhidechildwindows
     */
    v_ShowHideChildWindows(fChildOnly) {
        result := ComCall(71, this, "int", fChildOnly, "HRESULT")
        return result
    }

    /**
     * Deprecated. Gets the ID of the last toolbar or view that had focus.
     * @returns {Integer} Type: <b>UINT</b>
     * 
     * Returns the index of the last toolbar with focus, or ITB_VIEW if the focus was last on the view.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice2-_get_itblastfocus
     */
    _get_itbLastFocus() {
        result := ComCall(72, this, "uint")
        return result
    }

    /**
     * Deprecated. Sets the last toolbar or the last view with focus.
     * @param {Integer} itbLastFocus Type: <b>UINT</b>
     * 
     * The index of the last toolbar with focus. Set this parameter to ITB_VIEW to indicate that the view had the last focus.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice2-_put_itblastfocus
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
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice2-_uiactivateview
     */
    _UIActivateView(uState) {
        result := ComCall(74, this, "uint", uState, "HRESULT")
        return result
    }

    /**
     * Deprecated. Used with IBrowserService2::_GetEffectiveClientArea to negotiate the size and position of the browser view.
     * @param {Pointer<RECT>} prc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure stating the dimensions of the browser view's border.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice2-_getviewborderrect
     */
    _GetViewBorderRect(prc) {
        result := ComCall(75, this, "ptr", prc, "HRESULT")
        return result
    }

    /**
     * Deprecated. Called to inform other functions involved in the browser view size negotiations that the allowable browser view dimensions have changed.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice2-_updateviewrectsize
     */
    _UpdateViewRectSize() {
        result := ComCall(76, this, "HRESULT")
        return result
    }

    /**
     * Deprecated. Resizes the border of the browser view in response to the addition or removal of toolbars.
     * @param {Integer} itb Type: <b>UINT</b>
     * 
     * The index of the toolbar that was added or removed.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice2-_resizenextborder
     */
    _ResizeNextBorder(itb) {
        result := ComCall(77, this, "uint", itb, "HRESULT")
        return result
    }

    /**
     * Deprecated. Calls IBrowserService2::_UpdateViewRectSize, then updates the browser view by using IOleInPlaceActiveObject::ResizeBorder.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice2-_resizeview
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
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice2-_geteffectiveclientarea
     */
    _GetEffectiveClientArea(hmon) {
        hmon := hmon is Win32Handle ? NumGet(hmon, "ptr") : hmon

        lprectBorder := RECT()
        result := ComCall(79, this, "ptr", lprectBorder, "ptr", hmon, "HRESULT")
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
     * @returns {IStream} Type: <b><a href="/windows/desktop/api/objidl/nn-objidl-istream">IStream</a></b>
     * 
     * Stream that can be used to load or save the view state.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice2-v_getviewstream
     */
    v_GetViewStream(pidl, grfMode, pwszName) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(80, this, "ptr", pidl, "uint", grfMode, "ptr", pwszName, "ptr")
        return result
    }

    /**
     * Deprecated. Calls the SendMessage function with a message received by the view, using the _hwndView member of the BASEBROWSERDATA structure as the SendMessage hWnd parameter.
     * @param {Integer} uMsg Type: <b>UINT</b>
     * 
     * The message to be sent.
     * @param {WPARAM} wParam Type: <b>WPARAM</b>
     * 
     * Additional message-specific information.
     * @param {LPARAM} lParam Type: <b>LPARAM</b>
     * 
     * Additional message-specific information.
     * @returns {LRESULT} Type: <b>LRESULT</b>
     * 
     * The return value specifies the result of the message processing; it depends on the message sent.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice2-forwardviewmsg
     */
    ForwardViewMsg(uMsg, wParam, lParam) {
        result := ComCall(81, this, "uint", uMsg, "ptr", wParam, "ptr", lParam, "ptr")
        return result
    }

    /**
     * Deprecated. Implemented by a derived class to define menu accelerators that can be used in a call to TranslateAcceleratorSB.
     * @param {HACCEL} hacc Type: <b>HACCEL</b>
     * 
     * A handle to an array of <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-accel">ACCEL</a> structures, each structure describing a keyboard mnemonic.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice2-setacceleratormenu
     */
    SetAcceleratorMenu(hacc) {
        hacc := hacc is Win32Handle ? NumGet(hacc, "ptr") : hacc

        result := ComCall(82, this, "ptr", hacc, "HRESULT")
        return result
    }

    /**
     * Deprecated. Returns the number of toolbars in the browser window.
     * @returns {Integer} Type: <b>int</b>
     * 
     * The number of toolbars in the browser window.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice2-_gettoolbarcount
     */
    _GetToolbarCount() {
        result := ComCall(83, this, "int")
        return result
    }

    /**
     * Deprecated. Gets a specific item from a toolbar.
     * @param {Integer} itb Type: <b>int</b>
     * 
     * The index of the toolbar item to retrieve.
     * @returns {Pointer<TOOLBARITEM>} Type: <b>LPTOOLBARITEM</b>
     * 
     * A pointer to a [TOOLBARITEM](./ns-shdeprecated-toolbaritem.md) structure that represents a toolbar item.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice2-_gettoolbaritem
     */
    _GetToolbarItem(itb) {
        result := ComCall(84, this, "int", itb, "ptr")
        return result
    }

    /**
     * Deprecated. Saves the state of browser toolbars.
     * @param {IStream} pstm Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> used to store the browser toolbar's state.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice2-_savetoolbars
     */
    _SaveToolbars(pstm) {
        result := ComCall(85, this, "ptr", pstm, "HRESULT")
        return result
    }

    /**
     * Deprecated. Loads the saved state of the browser's toolbars.
     * @param {IStream} pstm Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> from which to load the state  of the browser's toolbars.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice2-_loadtoolbars
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
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice2-_closeandreleasetoolbars
     */
    _CloseAndReleaseToolbars(fClose) {
        result := ComCall(87, this, "int", fClose, "HRESULT")
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
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice2-v_maygetnexttoolbarfocus
     */
    v_MayGetNextToolbarFocus(lpMsg, itbNext, citb, pptbi, phwnd) {
        pptbiMarshal := pptbi is VarRef ? "ptr*" : "ptr"

        result := ComCall(88, this, "ptr", lpMsg, "uint", itbNext, "int", citb, pptbiMarshal, pptbi, "ptr", phwnd, "HRESULT")
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
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice2-_resizenextborderhelper
     */
    _ResizeNextBorderHelper(itb, bUseHmonitor) {
        result := ComCall(89, this, "uint", itb, "int", bUseHmonitor, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice2-_findtbar
     */
    _FindTBar(punkSrc) {
        result := ComCall(90, this, "ptr", punkSrc, "uint")
        return result
    }

    /**
     * Deprecated. Sets the focus on a toolbar or on the browser's view window. Called when translating accelerators through TranslateAcceleratorSB or when IBrowserService2::v_MayGetNextToolbarFocus fails.
     * @param {Pointer<TOOLBARITEM>} ptbi Type: <b>LPTOOLBARITEM</b>
     * 
     * A pointer to a [TOOLBARITEM](./ns-shdeprecated-toolbaritem.md) structure that specifies a browser toolbar item.
     * @param {HWND} hwnd Type: <b>HWND</b>
     * 
     * The handle of the browser window in which the focus shift is taking place.
     * @param {Pointer<MSG>} lpMsg Type: <b>LPMSG</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-msg">MSG</a> that contains a keystroke message that indicates an accelerator.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice2-_setfocus
     */
    _SetFocus(ptbi, hwnd, lpMsg) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(91, this, "ptr", ptbi, "ptr", hwnd, "ptr", lpMsg, "HRESULT")
        return result
    }

    /**
     * Deprecated. Called by a derived class to instruct the base class to proceed with the translation of keyboard mnemonics.
     * @param {Pointer<MSG>} pmsg Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-msg">MSG</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-msg">MSG</a> that contains the keystroke message.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice2-v_maytranslateaccelerator
     */
    v_MayTranslateAccelerator(pmsg) {
        result := ComCall(92, this, "ptr", pmsg, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice2-_getborderdwhelper
     */
    _GetBorderDWHelper(punkSrc, bUseHmonitor) {
        lprectBorder := RECT()
        result := ComCall(93, this, "ptr", punkSrc, "ptr", lprectBorder, "int", bUseHmonitor, "HRESULT")
        return lprectBorder
    }

    /**
     * Deprecated. Called by the base class to validate a zone crossing when navigating from one page to another.
     * @param {Pointer<ITEMIDLIST>} pidl Type: <b>LPCITEMIDLIST</b>
     * 
     * The PIDL of the navigation destination.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice2-v_checkzonecrossing
     */
    v_CheckZoneCrossing(pidl) {
        result := ComCall(94, this, "ptr", pidl, "HRESULT")
        return result
    }
}
