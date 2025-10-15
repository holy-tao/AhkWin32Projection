#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\COLORREF.ahk

/**
 * Contains information about a folder band. This structure is used with the IShellFolderBand::GetBandInfoSFB and IShellFolderBand::SetBandInfoSFB methods.
 * @see https://docs.microsoft.com/windows/win32/api//shlobj/ns-shlobj-bandinfosfb
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class BANDINFOSFB extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * @type {Integer}
     */
    dwMask {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>DWORD</b>
     * @type {Integer}
     */
    dwStateMask {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * State bits. One of the values listed for <b>dwStateMask</b>.
     * @type {Integer}
     */
    dwState {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a> that contains the background color of the band.
     * @type {COLORREF}
     */
    crBkgnd{
        get {
            if(!this.HasProp("__crBkgnd"))
                this.__crBkgnd := COLORREF(this.ptr + 12)
            return this.__crBkgnd
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a> that contains the light button color.
     * @type {COLORREF}
     */
    crBtnLt{
        get {
            if(!this.HasProp("__crBtnLt"))
                this.__crBtnLt := COLORREF(this.ptr + 16)
            return this.__crBtnLt
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a> that contains the dark button color.
     * @type {COLORREF}
     */
    crBtnDk{
        get {
            if(!this.HasProp("__crBtnDk"))
                this.__crBtnDk := COLORREF(this.ptr + 20)
            return this.__crBtnDk
        }
    }

    /**
     * Type: <b>WORD</b>
     * @type {Integer}
     */
    wViewMode {
        get => NumGet(this, 24, "ushort")
        set => NumPut("ushort", value, this, 24)
    }

    /**
     * Type: <b>WORD</b>
     * @type {Integer}
     */
    wAlign {
        get => NumGet(this, 26, "ushort")
        set => NumPut("ushort", value, this, 26)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a> object.
     * @type {Pointer<IShellFolder>}
     */
    psf {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Type: <b>PIDLIST_ABSOLUTE</b>
     * 
     * A PIDL.
     * @type {Pointer<ITEMIDLIST>}
     */
    pidl {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
