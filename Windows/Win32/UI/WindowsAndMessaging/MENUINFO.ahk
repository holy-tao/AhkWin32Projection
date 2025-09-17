#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a menu.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-menuinfo
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class MENUINFO extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The size of the structure, in bytes. The caller must set this member to <c>sizeof(MENUINFO)</c>.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>DWORD</b>
     * @type {Integer}
     */
    fMask {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>DWORD</b>
     * @type {Integer}
     */
    dwStyle {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b>UINT</b>
     * 
     * The maximum height of the menu in pixels. When the menu items exceed the space available, scroll bars are automatically used. The default (0) is the screen height.
     * @type {Integer}
     */
    cyMax {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Type: <b>HBRUSH</b>
     * 
     * A handle to the brush to be used for the menu's background.
     * @type {Pointer<Void>}
     */
    hbrBack {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The context help identifier. This is the same value used in 
     * 					the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getmenucontexthelpid">GetMenuContextHelpId</a> and 
     * 					<a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-setmenucontexthelpid">SetMenuContextHelpId</a> functions.
     * @type {Integer}
     */
    dwContextHelpID {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: <b>ULONG_PTR</b>
     * 
     * An application-defined value.
     * @type {Pointer}
     */
    dwMenuData {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 40
    }
}
