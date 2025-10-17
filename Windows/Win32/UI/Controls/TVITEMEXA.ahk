#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk

/**
 * Specifies or receives attributes of a tree-view item. This structure is an enhancement to the TVITEM structure. New applications should use this structure where appropriate.
 * @remarks
 * 
  * > [!NOTE]
  * > The commctrl.h header defines TVITEMEX as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
  * 
 * @see https://docs.microsoft.com/windows/win32/api//commctrl/ns-commctrl-tvitemexa
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 * @charset ANSI
 */
class TVITEMEXA extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * @type {Integer}
     */
    mask {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>HTREEITEM</b>
     * 
     * Handle to the item.
     * @type {HTREEITEM}
     */
    hItem {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Set of bit flags and image list indexes that indicate the item's state. When setting the state of an item, the <b>stateMask</b> member indicates the valid bits of this member. When retrieving the state of an item, this member returns the current state for the bits indicated in the <b>stateMask</b> member.
     * For more information regarding this member, see remarks section.
     * 
     *                     
     * 
     * Bits 0 through 7 of this member contain the item state flags. For a list of possible item state flags, see <a href="https://docs.microsoft.com/windows/desktop/Controls/tree-view-control-item-states">Tree-View Control Item States</a>.
     * 
     * Bits 8 through 11 of this member specify the one-based overlay image index. The overlay image is superimposed over the item's icon image. If these bits are zero, the item has no overlay image. To isolate these bits, use the <a href="https://docs.microsoft.com/windows/desktop/Controls/tree-view-control-item-states">TVIS_OVERLAYMASK</a> mask. To set the overlay image index in this member, use the <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/nf-commctrl-indextooverlaymask">INDEXTOOVERLAYMASK</a> macro. The image list's overlay images are set with the <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/nf-commctrl-imagelist_setoverlayimage">ImageList_SetOverlayImage</a> function.
     * 
     * A state image is displayed next to an item's icon to indicate an application-defined state. Specify the state image list by sending a <a href="https://docs.microsoft.com/windows/desktop/Controls/tvm-setimagelist">TVM_SETIMAGELIST</a> message. To set an item's state image, include the <a href="https://docs.microsoft.com/windows/desktop/Controls/tree-view-control-item-states">TVIS_STATEIMAGEMASK</a> value in The <b>stateMask</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-tvitema">TVITEM</a> structure. Bits 12 through 15 of the structure's
     * <b>state</b> member specify the index in the state image list of the image to be drawn.
     * 
     * To set the state image index, use <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/nf-commctrl-indextostateimagemask">INDEXTOSTATEIMAGEMASK</a>. This macro takes an index and sets bits 12 through 15 appropriately. To indicate that the item has no state image, set the index to zero. This convention means that image zero in the state image list cannot be used as a state image. To isolate bits 12 through 15 of The <b>state</b> member, use the <a href="https://docs.microsoft.com/windows/desktop/Controls/tree-view-control-item-states">TVIS_STATEIMAGEMASK</a> mask.
     * @type {Integer}
     */
    state {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Bits of the <b>state</b> member that are valid. If you are retrieving an item's state, set the bits of the <b>stateMask</b> member to indicate the bits to be returned in the <b>state</b> member. If you are setting an item's state, set the bits of the <b>stateMask</b> member to indicate the bits of the <b>state</b> member that you want to set. To set or retrieve an item's overlay image index, set the <a href="https://docs.microsoft.com/windows/desktop/Controls/tree-view-control-item-states">TVIS_OVERLAYMASK</a> bits. To set or retrieve an item's state image index, set the <a href="https://docs.microsoft.com/windows/desktop/Controls/tree-view-control-item-states">TVIS_STATEIMAGEMASK</a> bits.
     * @type {Integer}
     */
    stateMask {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPTSTR</a></b>
     * 
     * Pointer to a null-terminated string that contains the item text if the structure specifies item attributes. If this member is the LPSTR_TEXTCALLBACK value, the parent window is responsible for storing the name. In this case, the tree-view control sends the parent window a <a href="https://docs.microsoft.com/windows/desktop/Controls/tvn-getdispinfo">TVN_GETDISPINFO</a> notification code when it needs the item text for displaying, sorting, or editing and a <a href="https://docs.microsoft.com/windows/desktop/Controls/tvn-setdispinfo">TVN_SETDISPINFO</a> notification code when the item text changes. If the structure is receiving item attributes, this member is the address of the buffer that receives the item text. Note that although the tree-view control allows any length string to be stored as item text, only the first 260 characters are displayed.
     * @type {PSTR}
     */
    pszText {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: <b>int</b>
     * 
     * Size of the buffer pointed to by the <b>pszText</b> member, in characters. If this structure is being used to set item attributes, this member is ignored.
     * @type {Integer}
     */
    cchTextMax {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * Type: <b>int</b>
     * 
     * Index in the tree-view control's image list of the icon image to use when the item is in the nonselected state. If this member is the I_IMAGECALLBACK value, the parent window is responsible for storing the index. In this case, the tree-view control sends the parent a <a href="https://docs.microsoft.com/windows/desktop/Controls/tvn-getdispinfo">TVN_GETDISPINFO</a> notification code to retrieve the index when it needs to display the image.
     * @type {Integer}
     */
    iImage {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * Type: <b>int</b>
     * 
     * Index in the tree-view control's image list of the icon image to use when the item is in the selected state. If this member is the I_IMAGECALLBACK value, the parent window is responsible for storing the index. In this case, the tree-view control sends the parent a <a href="https://docs.microsoft.com/windows/desktop/Controls/tvn-getdispinfo">TVN_GETDISPINFO</a> notification code to retrieve the index when it needs to display the image.
     * @type {Integer}
     */
    iSelectedImage {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * Type: <b>int</b>
     * @type {Integer}
     */
    cChildren {
        get => NumGet(this, 44, "int")
        set => NumPut("int", value, this, 44)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPARAM</a></b>
     * 
     * A value to associate with the item.
     * @type {LPARAM}
     */
    lParam {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Type: <b>int</b>
     * 
     * Height of the item, in multiples of the standard item height (see <a href="https://docs.microsoft.com/windows/desktop/Controls/tvm-setitemheight">TVM_SETITEMHEIGHT</a>). For example, setting this member to 2 will give the item twice the standard height. The tree-view control does not draw in the extra area, which appears below the item content, but this space can be used by the application for drawing when using <a href="https://docs.microsoft.com/windows/desktop/Controls/custom-draw">custom draw</a>. Applications that are not using custom draw should set this value to 1, as otherwise the behavior is undefined.
     * @type {Integer}
     */
    iIntegral {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * <b>Internet Explorer 6 and later</b>. One or more (as a bitwise combination) of the following extended states.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TVIS_EX_DISABLED"></a><a id="tvis_ex_disabled"></a><dl>
     * <dt><b>TVIS_EX_DISABLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>Windows Vista and later</b>. Creates a control that is drawn in gray, that the user cannot interact with.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TVIS_EX_FLAT"></a><a id="tvis_ex_flat"></a><dl>
     * <dt><b>TVIS_EX_FLAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Creates a flat item—the item is virtual and is not visible in the tree; instead, its children take its place in the tree hierarchy. This state is valid only when adding an item to the tree-view control.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TVIS_EX_HWND"></a><a id="tvis_ex_hwnd"></a><dl>
     * <dt><b>TVIS_EX_HWND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Creates a separate HWND for the item. This state is valid only when adding an item to the tree-view control.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    uStateEx {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
     * 
     * <b>Internet Explorer 6 and later</b>. Not used; must be <b>NULL</b>.
     * @type {HWND}
     */
    hwnd{
        get {
            if(!this.HasProp("__hwnd"))
                this.__hwnd := HWND(64, this)
            return this.__hwnd
        }
    }

    /**
     * Type: <b>int</b>
     * 
     * <b>Internet Explorer 6 and later</b>. Index of the image in the control's image list to display when the item is in the expanded state.
     * @type {Integer}
     */
    iExpandedImage {
        get => NumGet(this, 72, "int")
        set => NumPut("int", value, this, 72)
    }

    /**
     * Type: <b>int</b>
     * 
     * Reserved member. Do not use.
     * @type {Integer}
     */
    iReserved {
        get => NumGet(this, 76, "int")
        set => NumPut("int", value, this, 76)
    }
}
