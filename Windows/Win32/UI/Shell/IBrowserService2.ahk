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
     * 
     * @param {HWND} hwnd 
     * @param {Integer} uMsg 
     * @param {WPARAM} wParam 
     * @param {LPARAM} lParam 
     * @returns {LRESULT} 
     */
    WndProcBS(hwnd, uMsg, wParam, lParam) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(33, this, "ptr", hwnd, "uint", uMsg, "ptr", wParam, "ptr", lParam, "ptr")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SetAsDefFolderSettings() {
        result := ComCall(34, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} prc 
     * @returns {HRESULT} 
     */
    GetViewRect(prc) {
        result := ComCall(35, this, "ptr", prc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {WPARAM} wParam 
     * @returns {HRESULT} 
     */
    OnSize(wParam) {
        result := ComCall(36, this, "ptr", wParam, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<CREATESTRUCTW>} pcs 
     * @returns {HRESULT} 
     */
    OnCreate(pcs) {
        result := ComCall(37, this, "ptr", pcs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {WPARAM} wParam 
     * @param {LPARAM} lParam 
     * @returns {LRESULT} 
     */
    OnCommand(wParam, lParam) {
        result := ComCall(38, this, "ptr", wParam, "ptr", lParam, "ptr")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    OnDestroy() {
        result := ComCall(39, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<NMHDR>} pnm 
     * @returns {LRESULT} 
     */
    OnNotify(pnm) {
        result := ComCall(40, this, "ptr", pnm, "ptr")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    OnSetFocus() {
        result := ComCall(41, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fActive 
     * @returns {HRESULT} 
     */
    OnFrameWindowActivateBS(fActive) {
        result := ComCall(42, this, "int", fActive, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ReleaseShellView() {
        result := ComCall(43, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ActivatePendingView() {
        result := ComCall(44, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IShellView>} psvNew 
     * @param {Pointer<IShellView>} psvOld 
     * @param {Pointer<RECT>} prcView 
     * @param {Pointer<HWND>} phwnd 
     * @returns {HRESULT} 
     */
    CreateViewWindow(psvNew, psvOld, prcView, phwnd) {
        result := ComCall(45, this, "ptr", psvNew, "ptr", psvOld, "ptr", prcView, "ptr", phwnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {HRESULT} 
     */
    CreateBrowserPropSheetExt(riid, ppv) {
        result := ComCall(46, this, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<HWND>} phwndView 
     * @returns {HRESULT} 
     */
    GetViewWindow(phwndView) {
        result := ComCall(47, this, "ptr", phwndView, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BASEBROWSERDATALH>} pbbd 
     * @returns {HRESULT} 
     */
    GetBaseBrowserData(pbbd) {
        result := ComCall(48, this, "ptr", pbbd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {Pointer<BASEBROWSERDATALH>} 
     */
    PutBaseBrowserData() {
        result := ComCall(49, this, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<ITravelLog>} ptl 
     * @param {Integer} dw 
     * @returns {HRESULT} 
     */
    InitializeTravelLog(ptl, dw) {
        result := ComCall(50, this, "ptr", ptl, "uint", dw, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SetTopBrowser() {
        result := ComCall(51, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iCmd 
     * @returns {HRESULT} 
     */
    Offline(iCmd) {
        result := ComCall(52, this, "int", iCmd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} f 
     * @returns {HRESULT} 
     */
    AllowViewResize(f) {
        result := ComCall(53, this, "int", f, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} u 
     * @returns {HRESULT} 
     */
    SetActivateState(u) {
        result := ComCall(54, this, "uint", u, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} eSecureLock 
     * @returns {HRESULT} 
     */
    UpdateSecureLockIcon(eSecureLock) {
        result := ComCall(55, this, "int", eSecureLock, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    InitializeDownloadManager() {
        result := ComCall(56, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    InitializeTransitionSite() {
        result := ComCall(57, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} hwnd 
     * @param {Pointer<IUnknown>} pauto 
     * @returns {HRESULT} 
     */
    _Initialize(hwnd, pauto) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(58, this, "ptr", hwnd, "ptr", pauto, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    _CancelPendingNavigationAsync() {
        result := ComCall(59, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    _CancelPendingView() {
        result := ComCall(60, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    _MaySaveChanges() {
        result := ComCall(61, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fPaused 
     * @returns {HRESULT} 
     */
    _PauseOrResumeView(fPaused) {
        result := ComCall(62, this, "int", fPaused, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    _DisableModeless() {
        result := ComCall(63, this, "int")
        if(result != 0)
            throw OSError(result)

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
        result := ComCall(64, this, "ptr", pidl, "uint", grfHLNF, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IShellView>} psv 
     * @param {Pointer<ITEMIDLIST>} pidlNew 
     * @returns {HRESULT} 
     */
    _TryShell2Rename(psv, pidlNew) {
        result := ComCall(65, this, "ptr", psv, "ptr", pidlNew, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    _SwitchActivationNow() {
        result := ComCall(66, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} punkBar 
     * @param {BOOL} fBroadcast 
     * @param {Pointer<Guid>} pguidCmdGroup 
     * @param {Integer} nCmdID 
     * @param {Integer} nCmdexecopt 
     * @param {Pointer<VARIANT>} pvarargIn 
     * @param {Pointer<VARIANT>} pvarargOut 
     * @returns {HRESULT} 
     */
    _ExecChildren(punkBar, fBroadcast, pguidCmdGroup, nCmdID, nCmdexecopt, pvarargIn, pvarargOut) {
        result := ComCall(67, this, "ptr", punkBar, "int", fBroadcast, "ptr", pguidCmdGroup, "uint", nCmdID, "uint", nCmdexecopt, "ptr", pvarargIn, "ptr", pvarargOut, "int")
        if(result != 0)
            throw OSError(result)

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
     */
    _SendChildren(hwndBar, fBroadcast, uMsg, wParam, lParam) {
        hwndBar := hwndBar is Win32Handle ? NumGet(hwndBar, "ptr") : hwndBar

        result := ComCall(68, this, "ptr", hwndBar, "int", fBroadcast, "uint", uMsg, "ptr", wParam, "ptr", lParam, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<FOLDERSETDATA>} pfsd 
     * @returns {HRESULT} 
     */
    GetFolderSetData(pfsd) {
        result := ComCall(69, this, "ptr", pfsd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} itb 
     * @returns {HRESULT} 
     */
    _OnFocusChange(itb) {
        result := ComCall(70, this, "uint", itb, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fChildOnly 
     * @returns {HRESULT} 
     */
    v_ShowHideChildWindows(fChildOnly) {
        result := ComCall(71, this, "int", fChildOnly, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    _get_itbLastFocus() {
        result := ComCall(72, this, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} itbLastFocus 
     * @returns {HRESULT} 
     */
    _put_itbLastFocus(itbLastFocus) {
        result := ComCall(73, this, "uint", itbLastFocus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} uState 
     * @returns {HRESULT} 
     */
    _UIActivateView(uState) {
        result := ComCall(74, this, "uint", uState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} prc 
     * @returns {HRESULT} 
     */
    _GetViewBorderRect(prc) {
        result := ComCall(75, this, "ptr", prc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    _UpdateViewRectSize() {
        result := ComCall(76, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} itb 
     * @returns {HRESULT} 
     */
    _ResizeNextBorder(itb) {
        result := ComCall(77, this, "uint", itb, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    _ResizeView() {
        result := ComCall(78, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} lprectBorder 
     * @param {HMONITOR} hmon 
     * @returns {HRESULT} 
     */
    _GetEffectiveClientArea(lprectBorder, hmon) {
        hmon := hmon is Win32Handle ? NumGet(hmon, "ptr") : hmon

        result := ComCall(79, this, "ptr", lprectBorder, "ptr", hmon, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITEMIDLIST>} pidl 
     * @param {Integer} grfMode 
     * @param {PWSTR} pwszName 
     * @returns {Pointer<IStream>} 
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
     */
    ForwardViewMsg(uMsg, wParam, lParam) {
        result := ComCall(81, this, "uint", uMsg, "ptr", wParam, "ptr", lParam, "ptr")
        return result
    }

    /**
     * 
     * @param {HACCEL} hacc 
     * @returns {HRESULT} 
     */
    SetAcceleratorMenu(hacc) {
        hacc := hacc is Win32Handle ? NumGet(hacc, "ptr") : hacc

        result := ComCall(82, this, "ptr", hacc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    _GetToolbarCount() {
        result := ComCall(83, this, "int")
        return result
    }

    /**
     * 
     * @param {Integer} itb 
     * @returns {Pointer<TOOLBARITEM>} 
     */
    _GetToolbarItem(itb) {
        result := ComCall(84, this, "int", itb, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} pstm 
     * @returns {HRESULT} 
     */
    _SaveToolbars(pstm) {
        result := ComCall(85, this, "ptr", pstm, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} pstm 
     * @returns {HRESULT} 
     */
    _LoadToolbars(pstm) {
        result := ComCall(86, this, "ptr", pstm, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fClose 
     * @returns {HRESULT} 
     */
    _CloseAndReleaseToolbars(fClose) {
        result := ComCall(87, this, "int", fClose, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<MSG>} lpMsg 
     * @param {Integer} itbNext 
     * @param {Integer} citb 
     * @param {Pointer<TOOLBARITEM>} pptbi 
     * @param {Pointer<HWND>} phwnd 
     * @returns {HRESULT} 
     */
    v_MayGetNextToolbarFocus(lpMsg, itbNext, citb, pptbi, phwnd) {
        result := ComCall(88, this, "ptr", lpMsg, "uint", itbNext, "int", citb, "ptr", pptbi, "ptr", phwnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} itb 
     * @param {BOOL} bUseHmonitor 
     * @returns {HRESULT} 
     */
    _ResizeNextBorderHelper(itb, bUseHmonitor) {
        result := ComCall(89, this, "uint", itb, "int", bUseHmonitor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} punkSrc 
     * @returns {Integer} 
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
     */
    _SetFocus(ptbi, hwnd, lpMsg) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(91, this, "ptr", ptbi, "ptr", hwnd, "ptr", lpMsg, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<MSG>} pmsg 
     * @returns {HRESULT} 
     */
    v_MayTranslateAccelerator(pmsg) {
        result := ComCall(92, this, "ptr", pmsg, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} punkSrc 
     * @param {Pointer<RECT>} lprectBorder 
     * @param {BOOL} bUseHmonitor 
     * @returns {HRESULT} 
     */
    _GetBorderDWHelper(punkSrc, lprectBorder, bUseHmonitor) {
        result := ComCall(93, this, "ptr", punkSrc, "ptr", lprectBorder, "int", bUseHmonitor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITEMIDLIST>} pidl 
     * @returns {HRESULT} 
     */
    v_CheckZoneCrossing(pidl) {
        result := ComCall(94, this, "ptr", pidl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
