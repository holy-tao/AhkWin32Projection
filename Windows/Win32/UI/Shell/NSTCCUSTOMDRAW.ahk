#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\Controls\HIMAGELIST.ahk" { HIMAGELIST }
#Import ".\IShellItem.ahk" { IShellItem }

/**
 * Custom draw structure used by INameSpaceTreeControlCustomDraw methods.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl/ns-shobjidl-nstccustomdraw
 * @namespace Windows.Win32.UI.Shell
 */
export default struct NSTCCUSTOMDRAW {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * A pointer to a Shell item.
     */
    psi : IShellItem

    /**
     * Type: <b>UINT</b>
     * 
     * The current item state. See <a href="https://docs.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmcustomdraw">NMCUSTOMDRAW</a> for more detail.
     */
    uItemState : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_nstcitemstate">NSTCITEMSTATE</a></b>
     * 
     * The state of a tree item. See <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_nstcitemstate">NSTCITEMSTATE</a>.
     */
    nstcis : UInt32

    /**
     * Type: <b>LPCWSTR</b>
     * 
     * A pointer to a null-terminated Unicode string that contains the item text, if the structure specifies item attributes.
     */
    pszText : PWSTR

    /**
     * Type: <b>int</b>
     * 
     * The index in the tree-view control's image list.
     */
    iImage : Int32

    /**
     * Type: <b>HIMAGELIST</b>
     * 
     * A handle to an image list.
     */
    himl : HIMAGELIST

    /**
     * Type: <b>int</b>
     * 
     * The zero-based level of the item being drawn.
     */
    iLevel : Int32

    /**
     * Type: <b>int</b>
     * 
     * A tree-level indent.
     */
    iIndent : Int32

}
