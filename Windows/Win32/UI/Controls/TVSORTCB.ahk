#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information used to sort child items in a tree-view control. This structure is used with the TVM_SORTCHILDRENCB message. This structure is identical to the TV_SORTCB structure, but it has been renamed to follow current naming conventions.
 * @remarks
 * 
  * The callback function specified by <b>lpfnCompare</b> has the following form:
  * 
  * 
  * <pre class="syntax" xml:space="preserve"><code>
  * int CALLBACK CompareFunc(LPARAM lParam1, LPARAM lParam2, LPARAM lParamSort);
  * </code></pre>
  * The callback function must return a negative value if the first item should precede the second, a positive value if the first item should follow the second, or zero if the two items are equivalent.
  * 
  * The <i>lParam1</i> and <i>lParam2</i> parameters correspond to the lParam member of the <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-tvitema">TVITEM</a> structure for the two items being compared. The <i>lParamSort</i> parameter corresponds to the <b>lParam</b> member of this structure.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//commctrl/ns-commctrl-tvsortcb
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class TVSORTCB extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Type: <b>HTREEITEM</b>
     * 
     * Handle to the parent item.
     * @type {HTREEITEM}
     */
    hParent {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: <b>PFNTVCOMPARE</b>
     * 
     * Address of an application-defined callback function, which is called during a sort operation each time the relative order of two list items needs to be compared.
     * @type {Pointer<PFNTVCOMPARE>}
     */
    lpfnCompare {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPARAM</a></b>
     * 
     * Application-defined value that gets passed as the 
     * 					<i>lParamSort</i> argument in the callback function specified in 
     * 					<b>lpfnCompare</b>.
     * @type {LPARAM}
     */
    lParam {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
