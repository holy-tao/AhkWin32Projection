#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Custom draw structure used by INameSpaceTreeControlCustomDraw methods.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl/ns-shobjidl-nstccustomdraw
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class NSTCCUSTOMDRAW extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * A pointer to a Shell item.
     * @type {Pointer<IShellItem>}
     */
    psi {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: <b>UINT</b>
     * 
     * The current item state. See <a href="https://docs.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmcustomdraw">NMCUSTOMDRAW</a> for more detail.
     * @type {Integer}
     */
    uItemState {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_nstcitemstate">NSTCITEMSTATE</a></b>
     * 
     * The state of a tree item. See <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_nstcitemstate">NSTCITEMSTATE</a>.
     * @type {Integer}
     */
    nstcis {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Type: <b>LPCWSTR</b>
     * 
     * A pointer to a null-terminated Unicode string that contains the item text, if the structure specifies item attributes.
     * @type {Pointer<Ptr>}
     */
    pszText {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: <b>int</b>
     * 
     * The index in the tree-view control's image list.
     * @type {Integer}
     */
    iImage {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * Type: <b>HIMAGELIST</b>
     * 
     * A handle to an image list.
     * @type {Pointer}
     */
    himl {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Type: <b>int</b>
     * 
     * The zero-based level of the item being drawn.
     * @type {Integer}
     */
    iLevel {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * Type: <b>int</b>
     * 
     * A tree-level indent.
     * @type {Integer}
     */
    iIndent {
        get => NumGet(this, 44, "int")
        set => NumPut("int", value, this, 44)
    }
}
