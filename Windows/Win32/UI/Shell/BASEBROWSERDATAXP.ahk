#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class BASEBROWSERDATAXP extends Win32Struct
{
    static sizeof => 192

    static packingSize => 8

    /**
     * @type {HWND}
     */
    _hwnd{
        get {
            if(!this.HasProp("___hwnd"))
                this.___hwnd := HWND(this.ptr + 0)
            return this.___hwnd
        }
    }

    /**
     * @type {Pointer<ITravelLog>}
     */
    _ptl {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<IHlinkFrame>}
     */
    _phlf {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<IWebBrowser2>}
     */
    _pautoWB2 {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<IExpDispSupportXP>}
     */
    _pautoEDS {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<IShellService>}
     */
    _pautoSS {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
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
     * @type {Integer}
     */
    _fCreatingViewWindow {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    _uActivateState {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Pointer<ITEMIDLIST>}
     */
    _pidlViewState {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Pointer<IOleCommandTarget>}
     */
    _pctView {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Pointer<ITEMIDLIST>}
     */
    _pidlCur {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * @type {Pointer<IShellView>}
     */
    _psv {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * @type {Pointer<IShellFolder>}
     */
    _psf {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * @type {HWND}
     */
    _hwndView{
        get {
            if(!this.HasProp("___hwndView"))
                this.___hwndView := HWND(this.ptr + 104)
            return this.___hwndView
        }
    }

    /**
     * @type {PWSTR}
     */
    _pszTitleCur{
        get {
            if(!this.HasProp("___pszTitleCur"))
                this.___pszTitleCur := PWSTR(this.ptr + 112)
            return this.___pszTitleCur
        }
    }

    /**
     * @type {Pointer<ITEMIDLIST>}
     */
    _pidlPending {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * @type {Pointer<IShellView>}
     */
    _psvPending {
        get => NumGet(this, 128, "ptr")
        set => NumPut("ptr", value, this, 128)
    }

    /**
     * @type {Pointer<IShellFolder>}
     */
    _psfPending {
        get => NumGet(this, 136, "ptr")
        set => NumPut("ptr", value, this, 136)
    }

    /**
     * @type {HWND}
     */
    _hwndViewPending{
        get {
            if(!this.HasProp("___hwndViewPending"))
                this.___hwndViewPending := HWND(this.ptr + 144)
            return this.___hwndViewPending
        }
    }

    /**
     * @type {PWSTR}
     */
    _pszTitlePending{
        get {
            if(!this.HasProp("___pszTitlePending"))
                this.___pszTitlePending := PWSTR(this.ptr + 152)
            return this.___pszTitlePending
        }
    }

    /**
     * @type {BOOL}
     */
    _fIsViewMSHTML{
        get {
            if(!this.HasProp("___fIsViewMSHTML"))
                this.___fIsViewMSHTML := BOOL(this.ptr + 160)
            return this.___fIsViewMSHTML
        }
    }

    /**
     * @type {BOOL}
     */
    _fPrivacyImpacted{
        get {
            if(!this.HasProp("___fPrivacyImpacted"))
                this.___fPrivacyImpacted := BOOL(this.ptr + 164)
            return this.___fPrivacyImpacted
        }
    }

    /**
     * @type {Pointer<Guid>}
     */
    _clsidView {
        get => NumGet(this, 168, "ptr")
        set => NumPut("ptr", value, this, 168)
    }

    /**
     * @type {Pointer<Guid>}
     */
    _clsidViewPending {
        get => NumGet(this, 176, "ptr")
        set => NumPut("ptr", value, this, 176)
    }

    /**
     * @type {HWND}
     */
    _hwndFrame{
        get {
            if(!this.HasProp("___hwndFrame"))
                this.___hwndFrame := HWND(this.ptr + 184)
            return this.___hwndFrame
        }
    }
}
