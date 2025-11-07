#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk
#Include .\TVITEMEXW.ahk
#Include .\TVITEMW.ahk

/**
 * Contains information used to add a new item to a tree-view control. This structure is used with the TVM_INSERTITEM message. The structure is identical to the TV_INSERTSTRUCT structure, but it has been renamed to follow current naming conventions.
 * @remarks
 * 
 * The unions in this structure have been updated to work with compilers that do not support nameless unions. If your compiler does not support nameless unions, define the NONAMELESSUNION token before including the commctrl.h header file.
 * 
 * <div class="alert"><b>Important</b>  Using TVI_LAST to insert an item into a tree-view node that already contains a large number of items can take a long time, causing  the application to stop responding until the insert operation completes.</div>
 * <div> </div>
 * 
 * 
 * 
 * > [!NOTE]
 * > The commctrl.h header defines TVINSERTSTRUCT as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * 
 * @see https://docs.microsoft.com/windows/win32/api//commctrl/ns-commctrl-tvinsertstructw
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 * @charset Unicode
 */
class TVINSERTSTRUCTW extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * Type: <b>HTREEITEM</b>
     * 
     * Handle to the parent item. If this member is the TVI_ROOT value or <b>NULL</b>, the item is inserted at the root of the tree-view control.
     * @type {HTREEITEM}
     */
    hParent {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: <b>HTREEITEM</b>
     * @type {HTREEITEM}
     */
    hInsertAfter {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {TVITEMEXW}
     */
    itemex{
        get {
            if(!this.HasProp("__itemex"))
                this.__itemex := TVITEMEXW(16, this)
            return this.__itemex
        }
    }

    /**
     * @type {TVITEMW}
     */
    item{
        get {
            if(!this.HasProp("__item"))
                this.__item := TVITEMW(16, this)
            return this.__item
        }
    }
}
