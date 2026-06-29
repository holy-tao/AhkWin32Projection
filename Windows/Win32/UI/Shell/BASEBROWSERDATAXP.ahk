#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IShellService.ahk" { IShellService }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import ".\IShellFolder.ahk" { IShellFolder }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\IExpDispSupportXP.ahk" { IExpDispSupportXP }
#Import ".\IWebBrowser2.ahk" { IWebBrowser2 }
#Import ".\IShellView.ahk" { IShellView }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\ITravelLog.ahk" { ITravelLog }
#Import ".\IHlinkFrame.ahk" { IHlinkFrame }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "Common\ITEMIDLIST.ahk" { ITEMIDLIST }
#Import "..\..\System\Ole\IOleCommandTarget.ahk" { IOleCommandTarget }

/**
 * The BASEBROWSERDATAXP structure contains protected members of the base class. (BASEBROWSERDATAXP structure)
 * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/ns-shdeprecated-basebrowserdataxp
 * @namespace Windows.Win32.UI.Shell
 */
export default struct BASEBROWSERDATAXP {
    #StructPack 8

    /**
     * Type: <b>HWND</b>
     * 
     * The handle of the browser's top-level window.
     */
    _hwnd : HWND

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shdeprecated/nn-shdeprecated-itravellog">ITravelLog</a>*</b>
     * 
     * A pointer to the browser's <a href="https://docs.microsoft.com/windows/desktop/api/shdeprecated/nn-shdeprecated-itravellog">ITravelLog</a>.
     */
    _ptl : ITravelLog

    /**
     * Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/aa767938(v=vs.85)">IHlinkFrame</a>*</b>
     * 
     * A pointer to the browser's <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/aa767938(v=vs.85)">IHlinkFrame</a>.
     *     
     *                         
     * 
     * <div class="alert"><b>Note</b>  This member is only valid on first navigation from an hlink element-compatible application such as Word.</div>
     * <div> </div>
     */
    _phlf : IHlinkFrame

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/exdisp/nn-exdisp-iwebbrowser2">IWebBrowser2</a>*</b>
     * 
     * A pointer to the browser's <a href="https://docs.microsoft.com/windows/desktop/api/exdisp/nn-exdisp-iwebbrowser2">IWebBrowser2</a> object.
     */
    _pautoWB2 : IWebBrowser2

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shdeprecated/nn-shdeprecated-iexpdispsupport">IExpDispSupport</a>*</b>
     * 
     * A pointer to the browser's <a href="https://docs.microsoft.com/windows/desktop/api/shdeprecated/nn-shdeprecated-iexpdispsupport">IExpDispSupport</a> object.
     */
    _pautoEDS : IExpDispSupportXP

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shdeprecated/nn-shdeprecated-ishellservice">IShellService</a>*</b>
     * 
     * A pointer to the browser's <a href="https://docs.microsoft.com/windows/desktop/api/shdeprecated/nn-shdeprecated-ishellservice">IShellService</a> object.
     */
    _pautoSS : IShellService

    /**
     * Type: <b>int</b>
     */
    _eSecureLockIcon : Int32

    /**
     * This bitfield backs the following members:
     * - _fCreatingViewWindow
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    _fCreatingViewWindow {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }
    /**
     * Type: <b>UINT</b>
     * 
     * The browser view is in an activated state.
     */
    _uActivateState : UInt32

    _pidlViewState : ITEMIDLIST.Ptr

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/docobj/nn-docobj-iolecommandtarget">IOleCommandTarget</a>*</b>
     * 
     * A cached pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nn-docobj-iolecommandtarget">IOleCommandTarget</a> object associated with the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a> object pointed to by <b>_psv</b>.
     */
    _pctView : IOleCommandTarget

    /**
     * Type: <b>PCIDLIST_ABSOLUTE</b>
     * 
     * A PIDL of the current navigated location of the browser. This value is the same retrieved by <a href="https://docs.microsoft.com/windows/desktop/api/shdeprecated/nf-shdeprecated-ibrowserservice-getpidl">IBrowserService::GetPidl</a>.
     */
    _pidlCur : ITEMIDLIST.Ptr

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a> of the current location. This <b>IShellView</b> is bound to <b>_pidlCur</b> through <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder-createviewobject">IShellFolder::CreateViewObject</a>.
     */
    _psv : IShellView

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a> of the current location. This <b>IShellFolder</b> is bound to <b>_pidlCur</b>.
     */
    _psf : IShellFolder

    /**
     * Type: <b>HWND</b>
     * 
     * A handle to the window returned by <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellview-createviewwindow">_psv->CreateViewWindow</a>.
     */
    _hwndView : HWND

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a buffer containing the Unicode title text for the current location.
     */
    _pszTitleCur : PWSTR

    /**
     * Type: <b>PCIDLIST_ABSOLUTE</b>
     * 
     * The PIDL of the pending target location. Once navigation is complete, this value moves to <b>_pidlCur</b>.
     */
    _pidlPending : ITEMIDLIST.Ptr

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a>*</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a> of the pending target location. Once navigation is complete, this value moves to <b>_psv</b>.
     */
    _psvPending : IShellView

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a>*</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a> of the pending target location. Once navigation is complete, this value moves to <b>_psf</b>.
     */
    _psfPending : IShellFolder

    /**
     * Type: <b>HWND</b>
     * 
     * A handle to the pending target location's view window. Once navigation is complete, this value moves to <b>_hwndView</b>.
     */
    _hwndViewPending : HWND

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a buffer containing the Unicode title text for the pending target location. Once navigation is complete, this value moves to <b>_pszTitleCur</b>.
     */
    _pszTitlePending : PWSTR

    /**
     * Type: <b>BOOL</b>
     * 
     * A value of type <b>BOOL</b> that indicates whether the browser is hosting folder content or web content.
     */
    _fIsViewMSHTML : BOOL

    /**
     * Type: <b>BOOL</b>
     * 
     * A value of type <b>BOOL</b> that indicates whether there is a privacy concern with the browser's content.
     */
    _fPrivacyImpacted : BOOL

    /**
     * Type: <b>CLSID</b>
     */
    _clsidView : Guid

    /**
     * Type: <b>CLSID</b>
     */
    _clsidViewPending : Guid

    /**
     * Type: <b>HWND</b>
     */
    _hwndFrame : HWND

}
