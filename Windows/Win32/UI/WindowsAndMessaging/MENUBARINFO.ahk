#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import ".\HMENU.ahk" { HMENU }

/**
 * Contains menu bar information.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-menubarinfo
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct MENUBARINFO {
    #StructPack 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The size of the structure, in bytes. The caller must set this to <c>sizeof(MENUBARINFO)</c>.
     */
    cbSize : UInt32 := this.Size

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a></b>
     * 
     * The coordinates of the menu bar, popup menu, or menu item.
     */
    rcBar : RECT

    /**
     * Type: <b>HMENU</b>
     * 
     * A handle to the menu bar or popup menu.
     */
    hMenu : HMENU

    /**
     * Type: <b>HWND</b>
     * 
     * A handle to the submenu.
     */
    hwndMenu : HWND

    /**
     * This bitfield backs the following members:
     * - fBarFocused
     * - fFocused
     * - fUnused
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    fBarFocused {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    fFocused {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    fUnused {
        get => (this._bitfield >> 2) & 0x3FFFFFFF
        set => this._bitfield := ((value & 0x3FFFFFFF) << 2) | (this._bitfield & ~(0x3FFFFFFF << 2))
    }
}
