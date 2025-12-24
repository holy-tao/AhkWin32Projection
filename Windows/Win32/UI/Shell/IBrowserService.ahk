#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Ole\IOleInPlaceSite.ahk
#Include ..\..\System\Ole\IOleObject.ahk
#Include .\ITravelLog.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\Graphics\Gdi\HPALETTE.ahk

/**
 * Deprecated.
 * @remarks
 * 
 * In a direct inheritance scheme, these methods would be protected members. For that reason, it is recommended that this interface not be used directly by implementers. If it is used directly, existing data could be at risk.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nn-shdeprecated-ibrowserservice
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IBrowserService extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBrowserService
     * @type {Guid}
     */
    static IID => Guid("{02ba3b52-0547-11d1-b833-00c04fc9b31f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetParentSite", "SetTitle", "GetTitle", "GetOleObject", "GetTravelLog", "ShowControlWindow", "IsControlWindowShown", "IEGetDisplayName", "IEParseDisplayName", "DisplayParseError", "NavigateToPidl", "SetNavigateState", "GetNavigateState", "NotifyRedirect", "UpdateWindowList", "UpdateBackForwardState", "SetFlags", "GetFlags", "CanNavigateNow", "GetPidl", "SetReferrer", "GetBrowserIndex", "GetBrowserByIndex", "GetHistoryObject", "SetHistoryObject", "CacheOLEServer", "GetSetCodePage", "OnHttpEquiv", "GetPalette", "RegisterWindow"]

    /**
     * Deprecated. Retrieves the browser parent's in-place client site.
     * @returns {IOleInPlaceSite} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleinplacesite">IOleInPlaceSite</a>**</b>
     * 
     * The address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleinplacesite">IOleInPlaceSite</a> that indicates the browser parent's in-place client site.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice-getparentsite
     */
    GetParentSite() {
        result := ComCall(3, this, "ptr*", &ppipsite := 0, "HRESULT")
        return IOleInPlaceSite(ppipsite)
    }

    /**
     * Deprecated. Sets the title of a browser window.
     * @param {IShellView} psv Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a> that represents the browser's view. The view must be either the browser's current view or the pending view.
     * @param {PWSTR} pszName Type: <b>LPCWSTR</b>
     * 
     * A pointer to a buffer containing the browser window's title as a Unicode string.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice-settitle
     */
    SetTitle(psv, pszName) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(4, this, "ptr", psv, "ptr", pszName, "HRESULT")
        return result
    }

    /**
     * Deprecated. Retrieves the title of a browser window.
     * @param {IShellView} psv Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a> that represents the browser's current view.
     * @param {PWSTR} pszName Type: <b>LPWSTR</b>
     * 
     * A pointer to a buffer that receives the title.
     * @param {Integer} cchName Type: <b>DWORD</b>
     * 
     * The size, in characters, of the buffer pointed to by <i>pszName</i>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice-gettitle
     */
    GetTitle(psv, pszName, cchName) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(5, this, "ptr", psv, "ptr", pszName, "uint", cchName, "HRESULT")
        return result
    }

    /**
     * Deprecated. Retrieves an IOleObject for the browser.
     * @returns {IOleObject} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleobject">IOleObject</a>**</b>
     * 
     * The address that receives a pointer to the retrieved <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleobject">IOleObject</a>.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice-getoleobject
     */
    GetOleObject() {
        result := ComCall(6, this, "ptr*", &ppobjv := 0, "HRESULT")
        return IOleObject(ppobjv)
    }

    /**
     * Deprecated. Retrieves the browser's ITravelLog.
     * @returns {ITravelLog} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shdeprecated/nn-shdeprecated-itravellog">ITravelLog</a>**</b>
     * 
     * The address that receives a pointer to the browser's <a href="https://docs.microsoft.com/windows/desktop/api/shdeprecated/nn-shdeprecated-itravellog">ITravelLog</a>.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice-gettravellog
     */
    GetTravelLog() {
        result := ComCall(7, this, "ptr*", &pptl := 0, "HRESULT")
        return ITravelLog(pptl)
    }

    /**
     * Deprecated. Shows or hides various frame controls.
     * @param {Integer} id Type: <b>UINT</b>
     * @param {BOOL} fShow Type: <b>BOOL</b>
     * 
     * A value that indicates whether to show or hide the frame control.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice-showcontrolwindow
     */
    ShowControlWindow(id, fShow) {
        result := ComCall(8, this, "uint", id, "int", fShow, "HRESULT")
        return result
    }

    /**
     * Deprecated. Retrieves a value that indicates whether a specified frame control is currently visible.
     * @param {Integer} id Type: <b>UINT</b>
     * 
     * The frame control to check.
     * 
     * <div class="alert"><b>Note</b>  These frame controls may not be supported in future versions of Windows.</div>
     * <div> </div>
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * A value of type <b>BOOL</b> that indicates whether the specified frame control is visible.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice-iscontrolwindowshown
     */
    IsControlWindowShown(id) {
        result := ComCall(9, this, "uint", id, "int*", &pfShown := 0, "HRESULT")
        return pfShown
    }

    /**
     * Deprecated. Retrieves the URL that corresponds to a pointer to an item identifier list (PIDL).
     * @param {Pointer<ITEMIDLIST>} pidl Type: <b>LPCITEMIDLIST</b>
     * 
     * The PIDL for which to get the corresponding URL.
     * @param {PWSTR} pwszName Type: <b>LPWSTR</b>
     * 
     * A pointer to a buffer of at least INTERNET_MAX_URL_LENGTH characters to receive the URL.
     * @param {Integer} uFlags Type: <b>UINT</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice-iegetdisplayname
     */
    IEGetDisplayName(pidl, pwszName, uFlags) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(10, this, "ptr", pidl, "ptr", pwszName, "uint", uFlags, "HRESULT")
        return result
    }

    /**
     * Deprecated. Parses a URL into a pointer to an item identifier list (PIDL).
     * @param {Integer} uiCP Type: <b>UINT</b>
     * 
     * A value of type <b>UINT</b> that indicates the code page (for example, CP_ACP, the system default code page) to use in the parsing.
     * @param {PWSTR} pwszPath Type: <b>LPCWSTR</b>
     * 
     * A pointer to a buffer containing the URL as a Unicode string.
     * @returns {Pointer<ITEMIDLIST>} Type: <b>LPITEMIDLIST*</b>
     * 
     * The PIDL created from the parsed URL.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice-ieparsedisplayname
     */
    IEParseDisplayName(uiCP, pwszPath) {
        pwszPath := pwszPath is String ? StrPtr(pwszPath) : pwszPath

        result := ComCall(11, this, "uint", uiCP, "ptr", pwszPath, "ptr*", &ppidlOut := 0, "HRESULT")
        return ppidlOut
    }

    /**
     * Deprecated. Displays a URL that failed to be successfully parsed by IBrowserService::IEParseDisplayName.
     * @param {HRESULT} hres Type: <b>HRESULT</b>
     * 
     * An <b>HRESULT</b> returned by <a href="https://docs.microsoft.com/windows/desktop/api/shdeprecated/nf-shdeprecated-ibrowserservice-ieparsedisplayname">IBrowserService::IEParseDisplayName</a>. If this parameter is a success code, E_OUTOFMEMORY, or HRESULT_FROM_WIN32(ERROR_CANCELLED), this method does nothing.
     * @param {PWSTR} pwszPath Type: <b>LPCWSTR</b>
     * 
     * A pointer to a buffer containing the URL that failed to parse. This method displays the failed URL in an error dialog box.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice-displayparseerror
     */
    DisplayParseError(hres, pwszPath) {
        pwszPath := pwszPath is String ? StrPtr(pwszPath) : pwszPath

        result := ComCall(12, this, "int", hres, "ptr", pwszPath, "HRESULT")
        return result
    }

    /**
     * Deprecated. Navigates the browser to the location indicated by a pointer to an item identifier list (PIDL).
     * @param {Pointer<ITEMIDLIST>} pidl Type: <b>LPCITEMIDLIST</b>
     * 
     * The PIDL of the location.
     * @param {Integer} grfHLNF Type: <b>DWORD</b>
     * 
     * One or more of the following flags.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice-navigatetopidl
     */
    NavigateToPidl(pidl, grfHLNF) {
        result := ComCall(13, this, "ptr", pidl, "uint", grfHLNF, "HRESULT")
        return result
    }

    /**
     * Deprecated. Sets the current navigation state. This method affects the cursor and animation.
     * @param {Integer} bnstate Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shdeprecated/ne-shdeprecated-bnstate">BNSTATE</a></b>
     * 
     * The value from the <a href="https://docs.microsoft.com/windows/desktop/api/shdeprecated/ne-shdeprecated-bnstate">BNSTATE</a> enumeration that indicates the navigation state.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice-setnavigatestate
     */
    SetNavigateState(bnstate) {
        result := ComCall(14, this, "int", bnstate, "HRESULT")
        return result
    }

    /**
     * Deprecated. Retrieves the browser's current navigation state.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shdeprecated/ne-shdeprecated-bnstate">BNSTATE</a>*</b>
     * 
     * A pointer to a value from the <a href="https://docs.microsoft.com/windows/desktop/api/shdeprecated/ne-shdeprecated-bnstate">BNSTATE</a> enumeration indicating the current navigation state.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice-getnavigatestate
     */
    GetNavigateState() {
        result := ComCall(15, this, "int*", &pbnstate := 0, "HRESULT")
        return pbnstate
    }

    /**
     * Deprecated. Updates the browser to the specified pointer to an item identifier list (PIDL), navigating if necessary. This method is called when a page is redirected.
     * @param {IShellView} psv Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a> that indicates the browser's view. The view must be either the browser's current view or the pending view.
     * @param {Pointer<ITEMIDLIST>} pidl Type: <b>LPCITEMIDLIST</b>
     * 
     * The PIDL to use in the update.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * Optional. A pointer to a value of type <b>BOOL</b> that indicates whether navigation occurred.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice-notifyredirect
     */
    NotifyRedirect(psv, pidl) {
        result := ComCall(16, this, "ptr", psv, "ptr", pidl, "int*", &pfDidBrowse := 0, "HRESULT")
        return pfDidBrowse
    }

    /**
     * Deprecated. Instructs the browser to update the pointer to an item identifier list (PIDL) in the window list. This method is called after navigation.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice-updatewindowlist
     */
    UpdateWindowList() {
        result := ComCall(17, this, "HRESULT")
        return result
    }

    /**
     * Deprecated. Updates the state of the browser's Back and Forward buttons.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice-updatebackforwardstate
     */
    UpdateBackForwardState() {
        result := ComCall(18, this, "HRESULT")
        return result
    }

    /**
     * Deprecated. Sets flags that indicate browser status.
     * @param {Integer} dwFlags Type: <b>DWORD</b>
     * 
     * A bitmask used in conjunction with the flags indicated in <i>dwFlagMask</i>. For each <i>dwFlagMask</i> bit, the corresponding bit in this value sets (1) or disables (0) that state.
     * @param {Integer} dwFlagMask Type: <b>DWORD</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice-setflags
     */
    SetFlags(dwFlags, dwFlagMask) {
        result := ComCall(19, this, "uint", dwFlags, "uint", dwFlagMask, "HRESULT")
        return result
    }

    /**
     * Deprecated. Retrieves the current set of browser flags.
     * @returns {Integer} Type: <b>DWORD*</b>
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice-getflags
     */
    GetFlags() {
        result := ComCall(20, this, "uint*", &pdwFlags := 0, "HRESULT")
        return pdwFlags
    }

    /**
     * Deprecated. Returns a value that indicates whether navigation is currently allowed.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if navigation is allowed, or S_FALSE if the browser is busy.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice-cannavigatenow
     */
    CanNavigateNow() {
        result := ComCall(21, this, "HRESULT")
        return result
    }

    /**
     * Deprecated. Retrieves a copy of the current pointer to an item identifier list (PIDL).
     * @returns {Pointer<ITEMIDLIST>} Type: <b>LPITEMIDLIST*</b>
     * 
     * A pointer to the current PIDL.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice-getpidl
     */
    GetPidl() {
        result := ComCall(22, this, "ptr*", &ppidl := 0, "HRESULT")
        return ppidl
    }

    /**
     * Deprecated. Sets the pointer to an item identifier list (PIDL) used for zone checking when creating a new window.
     * @param {Pointer<ITEMIDLIST>} pidl Type: <b>LPITEMIDLIST</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shtypes/ns-shtypes-itemidlist">ITEMIDLIST</a> structure (PIDL) used for zone checking.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice-setreferrer
     */
    SetReferrer(pidl) {
        result := ComCall(23, this, "ptr", pidl, "HRESULT")
        return result
    }

    /**
     * Deprecated. Retrieves the index of the browser in the window hierarchy.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * The index of the browser. A value of -1 indicates the top frame browser.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice-getbrowserindex
     */
    GetBrowserIndex() {
        result := ComCall(24, this, "uint")
        return result
    }

    /**
     * Deprecated. Retrieves the browser with the given index.
     * @param {Integer} dwID Type: <b>DWORD</b>
     * 
     * A value of type <b>DWORD</b> that indicates the index of the browser.
     * @returns {IUnknown} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>**</b>
     * 
     * The address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> that indicates the browser with the given index. The calling application must release this resource when it is no longer needed.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice-getbrowserbyindex
     */
    GetBrowserByIndex(dwID) {
        result := ComCall(25, this, "uint", dwID, "ptr*", &ppunk := 0, "HRESULT")
        return IUnknown(ppunk)
    }

    /**
     * Deprecated. Retrieves an IOleObject that represents the browser's history object.
     * @param {Pointer<IOleObject>} ppole Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleobject">IOleObject</a>**</b>
     * 
     * The address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleobject">IOleObject</a> that represents the browser's history object.
     * @param {Pointer<IStream>} pstm Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>**</b>
     * 
     * The address of a pointer to the history object's <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>. This parameter may be <b>NULL</b>.
     * @param {Pointer<IBindCtx>} ppbc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ibindctx">IBindCtx</a>**</b>
     * 
     * The address of a pointer to the history object stream's <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ibindctx">IBindCtx</a>. This parameter may be <b>NULL</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice-gethistoryobject
     */
    GetHistoryObject(ppole, pstm, ppbc) {
        result := ComCall(26, this, "ptr*", ppole, "ptr*", pstm, "ptr*", ppbc, "HRESULT")
        return result
    }

    /**
     * Deprecated. Sets the browser's history object.
     * @param {IOleObject} pole Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleobject">IOleObject</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleobject">IOleObject</a> that represents the history object to set.
     * @param {BOOL} fIsLocalAnchor Type: <b>BOOL</b>
     * 
     * A value that specifies whether the new entry is a local or a remote file. Used in the case of the reuse of an inner object.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice-sethistoryobject
     */
    SetHistoryObject(pole, fIsLocalAnchor) {
        result := ComCall(27, this, "ptr", pole, "int", fIsLocalAnchor, "HRESULT")
        return result
    }

    /**
     * Deprecated. Caches a reference to an external object to avoid reloading the server on reuse.
     * @param {IOleObject} pole Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleobject">IOleObject</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleobject">IOleObject</a> interface that represents the external object.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice-cacheoleserver
     */
    CacheOLEServer(pole) {
        result := ComCall(28, this, "ptr", pole, "HRESULT")
        return result
    }

    /**
     * Deprecated. Sets a new character code page and retrieves a pointer to the previous code page.
     * @param {Pointer<VARIANT>} pvarIn Type: <b>VARIANT*</b>
     * 
     * A pointer to a <b>VARIANT</b> that represents the new character code page. Only VT_I4 is supported. This parameter can be <b>NULL</b>.
     * @returns {VARIANT} Type: <b>VARIANT*</b>
     * 
     * A pointer to a <b>VARIANT</b> that represents the previous character code page. Only VT_I4 is supported. This parameter can be <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice-getsetcodepage
     */
    GetSetCodePage(pvarIn) {
        pvarOut := VARIANT()
        result := ComCall(29, this, "ptr", pvarIn, "ptr", pvarOut, "HRESULT")
        return pvarOut
    }

    /**
     * Deprecated. Called when the document object responds to an HTTP-EQUIV metatag by issuing either the OLECMDID_HTTPEQUIV or OLECMDID_HTTPEQUIV_DONE command through IOleCommandTarget::Exec.
     * @param {IShellView} psv Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a> that indicates the browser's view. The view must be either the browser's current view or the pending view.
     * @param {BOOL} fDone Type: <b>BOOL</b>
     * 
     * A value of type <b>BOOL</b> that indicates which command to issue.
     * @param {Pointer<VARIANT>} pvarargIn Type: <b>VARIANT*</b>
     * 
     * =A pointer to an object of type <b>VARIANT</b>. This is the equivalent of the <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nf-docobj-iolecommandtarget-exec">IOleCommandTarget::Exec</a> parameter <i>pvaIn</i>.
     * @returns {VARIANT} Type: <b>VARIANT*</b>
     * 
     * A pointer to an object of type <b>VARIANT</b>. This is the equivalent of the <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nf-docobj-iolecommandtarget-exec">IOleCommandTarget::Exec</a> parameter <i>pvaOut</i>.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice-onhttpequiv
     */
    OnHttpEquiv(psv, fDone, pvarargIn) {
        pvarargOut := VARIANT()
        result := ComCall(30, this, "ptr", psv, "int", fDone, "ptr", pvarargIn, "ptr", pvarargOut, "HRESULT")
        return pvarargOut
    }

    /**
     * Deprecated. Retrieves the browser's palette.
     * @returns {HPALETTE} Type: <b>HPALETTE*</b>
     * 
     * A pointer to the browser's palette handle, if one exists.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice-getpalette
     */
    GetPalette() {
        hpal := HPALETTE()
        result := ComCall(31, this, "ptr", hpal, "HRESULT")
        return hpal
    }

    /**
     * Deprecated. Registers the browser in the list of browser windows.
     * @param {BOOL} fForceRegister Type: <b>BOOL</b>
     * 
     * A value of type <b>BOOL</b> that indicates whether to reregister the browser window if it was previously registered. If set to <b>TRUE</b> and the window was previously registered, this method will unregister and reregister the browser window.
     * @param {Integer} swc Type: <b>int</b>
     * 
     * One of the <a href="https://docs.microsoft.com/windows/desktop/api/exdisp/ne-exdisp-shellwindowtypeconstants">ShellWindowTypeConstants</a> values to indicate the nature of the window. Note that these values are defined in Expdisp.h.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice-registerwindow
     */
    RegisterWindow(fForceRegister, swc) {
        result := ComCall(32, this, "int", fForceRegister, "int", swc, "HRESULT")
        return result
    }
}
