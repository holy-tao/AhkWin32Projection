#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\TVITEMPART.ahk" { TVITEMPART }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import ".\HTREEITEM.ahk" { HTREEITEM }

/**
 * Contains information for identifying the &quot;hit zone&quot; for a specified part of a tree item. The structure is used with the TVM_GETITEMPARTRECT message and the TreeView_GetItemPartRect macro.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-tvgetitempartrectinfo
 * @namespace Windows.Win32.UI.Controls
 */
export default struct TVGETITEMPARTRECTINFO {
    #StructPack 8

    /**
     * Type: <b>HTREEITEM</b>
     * 
     * Handle to the parent item.
     */
    hti : HTREEITEM

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure to receive the coordinates of the bounding rectangle. The sender of the message (the caller) is responsible for allocating this structure.
     */
    prc : RECT.Ptr

    /**
     * Type: <b>TVITEMPART</b>
     * 
     * ID of the item part. This value must be <b>TVGIPR_BUTTON</b> (0x0001).
     */
    partID : TVITEMPART

}
