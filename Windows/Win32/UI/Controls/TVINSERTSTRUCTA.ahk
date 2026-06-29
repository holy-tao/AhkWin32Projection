#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\TVITEMEXA.ahk" { TVITEMEXA }
#Import ".\TVITEMA.ahk" { TVITEMA }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\TVITEM_MASK.ahk" { TVITEM_MASK }
#Import ".\TREE_VIEW_ITEM_STATE_FLAGS.ahk" { TREE_VIEW_ITEM_STATE_FLAGS }
#Import ".\HTREEITEM.ahk" { HTREEITEM }
#Import ".\TVITEMEXW_CHILDREN.ahk" { TVITEMEXW_CHILDREN }

/**
 * Contains information used to add a new item to a tree-view control. This structure is used with the TVM_INSERTITEM message. The structure is identical to the TV_INSERTSTRUCT structure, but it has been renamed to follow current naming conventions. (ANSI)
 * @remarks
 * The unions in this structure have been updated to work with compilers that do not support nameless unions. If your compiler does not support nameless unions, define the NONAMELESSUNION token before including the commctrl.h header file.
 * 
 * <div class="alert"><b>Important</b>  Using TVI_LAST to insert an item into a tree-view node that already contains a large number of items can take a long time, causing  the application to stop responding until the insert operation completes.</div>
 * <div> </div>
 * 
 * 
 * 
 * > [!NOTE]
 * > The commctrl.h header defines TVINSERTSTRUCT as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-tvinsertstructa
 * @namespace Windows.Win32.UI.Controls
 * @charset ANSI
 */
export default struct TVINSERTSTRUCTA {
    #StructPack 8

    /**
     * Type: <b>HTREEITEM</b>
     * 
     * Handle to the parent item. If this member is the TVI_ROOT value or <b>NULL</b>, the item is inserted at the root of the tree-view control.
     */
    hParent : HTREEITEM

    /**
     * Type: <b>HTREEITEM</b>
     */
    hInsertAfter : HTREEITEM

    itemex : TVITEMEXA

    static __New() {
        DefineProp(this.Prototype, 'item', { type: TVITEMA, offset: 16 })
        this.DeleteProp("__New")
    }
}
