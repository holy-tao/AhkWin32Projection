#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class BASEBROWSERDATALH extends Win32Struct
{
    static sizeof => 200

    static packingSize => 8

    /**
     * @type {Pointer<Void>}
     */
    _hwnd {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
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
     * @type {Pointer<IExpDispSupport>}
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
     * @type {Pointer<Void>}
     */
    _hwndView {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * @type {Pointer<Char>}
     */
    _pszTitleCur {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
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
     * @type {Pointer<Void>}
     */
    _hwndViewPending {
        get => NumGet(this, 144, "ptr")
        set => NumPut("ptr", value, this, 144)
    }

    /**
     * @type {Pointer<Char>}
     */
    _pszTitlePending {
        get => NumGet(this, 152, "ptr")
        set => NumPut("ptr", value, this, 152)
    }

    /**
     * @type {Integer}
     */
    _fIsViewMSHTML {
        get => NumGet(this, 160, "int")
        set => NumPut("int", value, this, 160)
    }

    /**
     * @type {Integer}
     */
    _fPrivacyImpacted {
        get => NumGet(this, 164, "int")
        set => NumPut("int", value, this, 164)
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
     * @type {Pointer<Void>}
     */
    _hwndFrame {
        get => NumGet(this, 184, "ptr")
        set => NumPut("ptr", value, this, 184)
    }

    /**
     * @type {Integer}
     */
    _lPhishingFilterStatus {
        get => NumGet(this, 192, "int")
        set => NumPut("int", value, this, 192)
    }
}
