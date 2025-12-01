#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk

/**
 * The BASEBROWSERDATAXP structure contains protected members of the base class. (BASEBROWSERDATAXP structure)
 * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/ns-shdeprecated-basebrowserdataxp
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class BASEBROWSERDATAXP extends Win32Struct
{
    static sizeof => 192

    static packingSize => 8

    /**
     * Type: <b>HWND</b>
     * 
     * The handle of the browser's top-level window.
     * @type {HWND}
     */
    _hwnd{
        get {
            if(!this.HasProp("___hwnd"))
                this.___hwnd := HWND(0, this)
            return this.___hwnd
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shdeprecated/nn-shdeprecated-itravellog">ITravelLog</a>*</b>
     * 
     * A pointer to the browser's <a href="https://docs.microsoft.com/windows/desktop/api/shdeprecated/nn-shdeprecated-itravellog">ITravelLog</a>.
     * @type {ITravelLog}
     */
    _ptl {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/aa767938(v=vs.85)">IHlinkFrame</a>*</b>
     * 
     * A pointer to the browser's <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/aa767938(v=vs.85)">IHlinkFrame</a>.
     *     
     *                         
     * 
     * <div class="alert"><b>Note</b>  This member is only valid on first navigation from an hlink element-compatible application such as Word.</div>
     * <div> </div>
     * @type {IHlinkFrame}
     */
    _phlf {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/exdisp/nn-exdisp-iwebbrowser2">IWebBrowser2</a>*</b>
     * 
     * A pointer to the browser's <a href="https://docs.microsoft.com/windows/desktop/api/exdisp/nn-exdisp-iwebbrowser2">IWebBrowser2</a> object.
     * @type {IWebBrowser2}
     */
    _pautoWB2 {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shdeprecated/nn-shdeprecated-iexpdispsupport">IExpDispSupport</a>*</b>
     * 
     * A pointer to the browser's <a href="https://docs.microsoft.com/windows/desktop/api/shdeprecated/nn-shdeprecated-iexpdispsupport">IExpDispSupport</a> object.
     * @type {IExpDispSupportXP}
     */
    _pautoEDS {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shdeprecated/nn-shdeprecated-ishellservice">IShellService</a>*</b>
     * 
     * A pointer to the browser's <a href="https://docs.microsoft.com/windows/desktop/api/shdeprecated/nn-shdeprecated-ishellservice">IShellService</a> object.
     * @type {IShellService}
     */
    _pautoSS {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Type: <b>int</b>
     * @type {Integer}
     */
    _eSecureLockIcon {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }

    /**
     * This bitfield backs the following members:
     * - _fCreatingViewWindow
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * Type: <b>UINT</b>
     * 
     * A view window is being created by the browser.
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
     * @type {Integer}
     */
    _uActivateState {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * 
     * @type {Pointer<ITEMIDLIST>}
     */
    _pidlViewState {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/docobj/nn-docobj-iolecommandtarget">IOleCommandTarget</a>*</b>
     * 
     * A cached pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nn-docobj-iolecommandtarget">IOleCommandTarget</a> object associated with the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a> object pointed to by <b>_psv</b>.
     * @type {IOleCommandTarget}
     */
    _pctView {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * Type: <b>PCIDLIST_ABSOLUTE</b>
     * 
     * A PIDL of the current navigated location of the browser. This value is the same retrieved by <a href="https://docs.microsoft.com/windows/desktop/api/shdeprecated/nf-shdeprecated-ibrowserservice-getpidl">IBrowserService::GetPidl</a>.
     * @type {Pointer<ITEMIDLIST>}
     */
    _pidlCur {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a> of the current location. This <b>IShellView</b> is bound to <b>_pidlCur</b> through <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder-createviewobject">IShellFolder::CreateViewObject</a>.
     * @type {IShellView}
     */
    _psv {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a> of the current location. This <b>IShellFolder</b> is bound to <b>_pidlCur</b>.
     * @type {IShellFolder}
     */
    _psf {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * Type: <b>HWND</b>
     * 
     * A handle to the window returned by <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellview-createviewwindow">_psv->CreateViewWindow</a>.
     * @type {HWND}
     */
    _hwndView{
        get {
            if(!this.HasProp("___hwndView"))
                this.___hwndView := HWND(104, this)
            return this.___hwndView
        }
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a buffer containing the Unicode title text for the current location.
     * @type {PWSTR}
     */
    _pszTitleCur {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * Type: <b>PCIDLIST_ABSOLUTE</b>
     * 
     * The PIDL of the pending target location. Once navigation is complete, this value moves to <b>_pidlCur</b>.
     * @type {Pointer<ITEMIDLIST>}
     */
    _pidlPending {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a>*</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a> of the pending target location. Once navigation is complete, this value moves to <b>_psv</b>.
     * @type {IShellView}
     */
    _psvPending {
        get => NumGet(this, 128, "ptr")
        set => NumPut("ptr", value, this, 128)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a>*</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a> of the pending target location. Once navigation is complete, this value moves to <b>_psf</b>.
     * @type {IShellFolder}
     */
    _psfPending {
        get => NumGet(this, 136, "ptr")
        set => NumPut("ptr", value, this, 136)
    }

    /**
     * Type: <b>HWND</b>
     * 
     * A handle to the pending target location's view window. Once navigation is complete, this value moves to <b>_hwndView</b>.
     * @type {HWND}
     */
    _hwndViewPending{
        get {
            if(!this.HasProp("___hwndViewPending"))
                this.___hwndViewPending := HWND(144, this)
            return this.___hwndViewPending
        }
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a buffer containing the Unicode title text for the pending target location. Once navigation is complete, this value moves to <b>_pszTitleCur</b>.
     * @type {PWSTR}
     */
    _pszTitlePending {
        get => NumGet(this, 152, "ptr")
        set => NumPut("ptr", value, this, 152)
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * A value of type <b>BOOL</b> that indicates whether the browser is hosting folder content or web content.
     * @type {BOOL}
     */
    _fIsViewMSHTML {
        get => NumGet(this, 160, "int")
        set => NumPut("int", value, this, 160)
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * A value of type <b>BOOL</b> that indicates whether there is a privacy concern with the browser's content.
     * @type {BOOL}
     */
    _fPrivacyImpacted {
        get => NumGet(this, 164, "int")
        set => NumPut("int", value, this, 164)
    }

    /**
     * Type: <b>CLSID</b>
     * @type {Pointer<Guid>}
     */
    _clsidView {
        get => NumGet(this, 168, "ptr")
        set => NumPut("ptr", value, this, 168)
    }

    /**
     * Type: <b>CLSID</b>
     * @type {Pointer<Guid>}
     */
    _clsidViewPending {
        get => NumGet(this, 176, "ptr")
        set => NumPut("ptr", value, this, 176)
    }

    /**
     * Type: <b>HWND</b>
     * @type {HWND}
     */
    _hwndFrame{
        get {
            if(!this.HasProp("___hwndFrame"))
                this.___hwndFrame := HWND(184, this)
            return this.___hwndFrame
        }
    }
}
