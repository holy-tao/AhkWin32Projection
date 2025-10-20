#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {HWND} hwnd 
     * @param {Integer} uMsg 
     * @param {WPARAM} wParam 
     * @param {LPARAM} lParam 
     * @returns {LRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-wndprocbs
     */
    WndProcBS(hwnd, uMsg, wParam, lParam) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(33, this, "ptr", hwnd, "uint", uMsg, "ptr", wParam, "ptr", lParam, "ptr")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-setasdeffoldersettings
     */
    SetAsDefFolderSettings() {
        result := ComCall(34, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} prc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-getviewrect
     */
    GetViewRect(prc) {
        result := ComCall(35, this, "ptr", prc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {WPARAM} wParam 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-onsize
     */
    OnSize(wParam) {
        result := ComCall(36, this, "ptr", wParam, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<CREATESTRUCTW>} pcs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-oncreate
     */
    OnCreate(pcs) {
        result := ComCall(37, this, "ptr", pcs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {WPARAM} wParam 
     * @param {LPARAM} lParam 
     * @returns {LRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-oncommand
     */
    OnCommand(wParam, lParam) {
        result := ComCall(38, this, "ptr", wParam, "ptr", lParam, "ptr")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-ondestroy
     */
    OnDestroy() {
        result := ComCall(39, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<NMHDR>} pnm 
     * @returns {LRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-onnotify
     */
    OnNotify(pnm) {
        result := ComCall(40, this, "ptr", pnm, "ptr")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-onsetfocus
     */
    OnSetFocus() {
        result := ComCall(41, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fActive 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-onframewindowactivatebs
     */
    OnFrameWindowActivateBS(fActive) {
        result := ComCall(42, this, "int", fActive, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-releaseshellview
     */
    ReleaseShellView() {
        result := ComCall(43, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-activatependingview
     */
    ActivatePendingView() {
        result := ComCall(44, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IShellView} psvNew 
     * @param {IShellView} psvOld 
     * @param {Pointer<RECT>} prcView 
     * @param {Pointer<HWND>} phwnd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-createviewwindow
     */
    CreateViewWindow(psvNew, psvOld, prcView, phwnd) {
        result := ComCall(45, this, "ptr", psvNew, "ptr", psvOld, "ptr", prcView, "ptr", phwnd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppv 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-createbrowserpropsheetext
     */
    CreateBrowserPropSheetExt(riid, ppv) {
        result := ComCall(46, this, "ptr", riid, "ptr*", ppv, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<HWND>} phwndView 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-getviewwindow
     */
    GetViewWindow(phwndView) {
        result := ComCall(47, this, "ptr", phwndView, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<BASEBROWSERDATALH>>} pbbd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-getbasebrowserdata
     */
    GetBaseBrowserData(pbbd) {
        result := ComCall(48, this, "ptr*", pbbd, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Pointer<BASEBROWSERDATALH>} 
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-putbasebrowserdata
     */
    PutBaseBrowserData() {
        result := ComCall(49, this, "ptr")
        return result
    }

    /**
     * 
     * @param {ITravelLog} ptl 
     * @param {Integer} dw 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-initializetravellog
     */
    InitializeTravelLog(ptl, dw) {
        result := ComCall(50, this, "ptr", ptl, "uint", dw, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-settopbrowser
     */
    SetTopBrowser() {
        result := ComCall(51, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iCmd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-offline
     */
    Offline(iCmd) {
        result := ComCall(52, this, "int", iCmd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} f 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-allowviewresize
     */
    AllowViewResize(f) {
        result := ComCall(53, this, "int", f, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} u 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-setactivatestate
     */
    SetActivateState(u) {
        result := ComCall(54, this, "uint", u, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} eSecureLock 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-updatesecurelockicon
     */
    UpdateSecureLockIcon(eSecureLock) {
        result := ComCall(55, this, "int", eSecureLock, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-initializedownloadmanager
     */
    InitializeDownloadManager() {
        result := ComCall(56, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-initializetransitionsite
     */
    InitializeTransitionSite() {
        result := ComCall(57, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hwnd 
     * @param {IUnknown} pauto 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-_initialize
     */
    _Initialize(hwnd, pauto) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(58, this, "ptr", hwnd, "ptr", pauto, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-_cancelpendingnavigationasync
     */
    _CancelPendingNavigationAsync() {
        result := ComCall(59, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-_cancelpendingview
     */
    _CancelPendingView() {
        result := ComCall(60, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-_maysavechanges
     */
    _MaySaveChanges() {
        result := ComCall(61, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fPaused 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-_pauseorresumeview
     */
    _PauseOrResumeView(fPaused) {
        result := ComCall(62, this, "int", fPaused, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
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
        result := ComCall(64, this, "ptr", pidl, "uint", grfHLNF, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IShellView} psv 
     * @param {Pointer<ITEMIDLIST>} pidlNew 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-_tryshell2rename
     */
    _TryShell2Rename(psv, pidlNew) {
        result := ComCall(65, this, "ptr", psv, "ptr", pidlNew, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-_switchactivationnow
     */
    _SwitchActivationNow() {
        result := ComCall(66, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} punkBar 
     * @param {BOOL} fBroadcast 
     * @param {Pointer<Guid>} pguidCmdGroup 
     * @param {Integer} nCmdID 
     * @param {Integer} nCmdexecopt 
     * @param {Pointer<VARIANT>} pvarargIn 
     * @param {Pointer<VARIANT>} pvarargOut 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-_execchildren
     */
    _ExecChildren(punkBar, fBroadcast, pguidCmdGroup, nCmdID, nCmdexecopt, pvarargIn, pvarargOut) {
        result := ComCall(67, this, "ptr", punkBar, "int", fBroadcast, "ptr", pguidCmdGroup, "uint", nCmdID, "uint", nCmdexecopt, "ptr", pvarargIn, "ptr", pvarargOut, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hwndBar 
     * @param {BOOL} fBroadcast 
     * @param {Integer} uMsg 
     * @param {WPARAM} wParam 
     * @param {LPARAM} lParam 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-_sendchildren
     */
    _SendChildren(hwndBar, fBroadcast, uMsg, wParam, lParam) {
        hwndBar := hwndBar is Win32Handle ? NumGet(hwndBar, "ptr") : hwndBar

        result := ComCall(68, this, "ptr", hwndBar, "int", fBroadcast, "uint", uMsg, "ptr", wParam, "ptr", lParam, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<FOLDERSETDATA>} pfsd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-getfoldersetdata
     */
    GetFolderSetData(pfsd) {
        result := ComCall(69, this, "ptr", pfsd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} itb 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-_onfocuschange
     */
    _OnFocusChange(itb) {
        result := ComCall(70, this, "uint", itb, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fChildOnly 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-v_showhidechildwindows
     */
    v_ShowHideChildWindows(fChildOnly) {
        result := ComCall(71, this, "int", fChildOnly, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-_get_itblastfocus
     */
    _get_itbLastFocus() {
        result := ComCall(72, this, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} itbLastFocus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-_put_itblastfocus
     */
    _put_itbLastFocus(itbLastFocus) {
        result := ComCall(73, this, "uint", itbLastFocus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} uState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-_uiactivateview
     */
    _UIActivateView(uState) {
        result := ComCall(74, this, "uint", uState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} prc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-_getviewborderrect
     */
    _GetViewBorderRect(prc) {
        result := ComCall(75, this, "ptr", prc, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-_updateviewrectsize
     */
    _UpdateViewRectSize() {
        result := ComCall(76, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} itb 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-_resizenextborder
     */
    _ResizeNextBorder(itb) {
        result := ComCall(77, this, "uint", itb, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-_resizeview
     */
    _ResizeView() {
        result := ComCall(78, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} lprectBorder 
     * @param {HMONITOR} hmon 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-_geteffectiveclientarea
     */
    _GetEffectiveClientArea(lprectBorder, hmon) {
        hmon := hmon is Win32Handle ? NumGet(hmon, "ptr") : hmon

        result := ComCall(79, this, "ptr", lprectBorder, "ptr", hmon, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITEMIDLIST>} pidl 
     * @param {Integer} grfMode 
     * @param {PWSTR} pwszName 
     * @returns {IStream} 
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-v_getviewstream
     */
    v_GetViewStream(pidl, grfMode, pwszName) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(80, this, "ptr", pidl, "uint", grfMode, "ptr", pwszName, "ptr")
        return result
    }

    /**
     * 
     * @param {Integer} uMsg 
     * @param {WPARAM} wParam 
     * @param {LPARAM} lParam 
     * @returns {LRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-forwardviewmsg
     */
    ForwardViewMsg(uMsg, wParam, lParam) {
        result := ComCall(81, this, "uint", uMsg, "ptr", wParam, "ptr", lParam, "ptr")
        return result
    }

    /**
     * 
     * @param {HACCEL} hacc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-setacceleratormenu
     */
    SetAcceleratorMenu(hacc) {
        hacc := hacc is Win32Handle ? NumGet(hacc, "ptr") : hacc

        result := ComCall(82, this, "ptr", hacc, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-_gettoolbarcount
     */
    _GetToolbarCount() {
        result := ComCall(83, this, "int")
        return result
    }

    /**
     * 
     * @param {Integer} itb 
     * @returns {Pointer<TOOLBARITEM>} 
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-_gettoolbaritem
     */
    _GetToolbarItem(itb) {
        result := ComCall(84, this, "int", itb, "ptr")
        return result
    }

    /**
     * 
     * @param {IStream} pstm 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-_savetoolbars
     */
    _SaveToolbars(pstm) {
        result := ComCall(85, this, "ptr", pstm, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStream} pstm 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-_loadtoolbars
     */
    _LoadToolbars(pstm) {
        result := ComCall(86, this, "ptr", pstm, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fClose 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-_closeandreleasetoolbars
     */
    _CloseAndReleaseToolbars(fClose) {
        result := ComCall(87, this, "int", fClose, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<MSG>} lpMsg 
     * @param {Integer} itbNext 
     * @param {Integer} citb 
     * @param {Pointer<Pointer<TOOLBARITEM>>} pptbi 
     * @param {Pointer<HWND>} phwnd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-v_maygetnexttoolbarfocus
     */
    v_MayGetNextToolbarFocus(lpMsg, itbNext, citb, pptbi, phwnd) {
        result := ComCall(88, this, "ptr", lpMsg, "uint", itbNext, "int", citb, "ptr*", pptbi, "ptr", phwnd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} itb 
     * @param {BOOL} bUseHmonitor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-_resizenextborderhelper
     */
    _ResizeNextBorderHelper(itb, bUseHmonitor) {
        result := ComCall(89, this, "uint", itb, "int", bUseHmonitor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} punkSrc 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-_findtbar
     */
    _FindTBar(punkSrc) {
        result := ComCall(90, this, "ptr", punkSrc, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<TOOLBARITEM>} ptbi 
     * @param {HWND} hwnd 
     * @param {Pointer<MSG>} lpMsg 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-_setfocus
     */
    _SetFocus(ptbi, hwnd, lpMsg) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(91, this, "ptr", ptbi, "ptr", hwnd, "ptr", lpMsg, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<MSG>} pmsg 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-v_maytranslateaccelerator
     */
    v_MayTranslateAccelerator(pmsg) {
        result := ComCall(92, this, "ptr", pmsg, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} punkSrc 
     * @param {Pointer<RECT>} lprectBorder 
     * @param {BOOL} bUseHmonitor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-_getborderdwhelper
     */
    _GetBorderDWHelper(punkSrc, lprectBorder, bUseHmonitor) {
        result := ComCall(93, this, "ptr", punkSrc, "ptr", lprectBorder, "int", bUseHmonitor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITEMIDLIST>} pidl 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice2-v_checkzonecrossing
     */
    v_CheckZoneCrossing(pidl) {
        result := ComCall(94, this, "ptr", pidl, "HRESULT")
        return result
    }
}
