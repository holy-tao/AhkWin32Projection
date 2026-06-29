#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import ".\TAB_CONTROL_ITEM_STATE.ahk" { TAB_CONTROL_ITEM_STATE }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\TCITEMHEADERA_MASK.ahk" { TCITEMHEADERA_MASK }

/**
 * Specifies or receives the attributes of a tab item. It is used with the TCM_INSERTITEM, TCM_GETITEM, and TCM_SETITEM messages. This structure supersedes the TC_ITEM structure. (ANSI)
 * @remarks
 * Typically, windows display text left-to-right (LTR). Windows can be 
 * 				<i>mirrored</i> to display languages such as Hebrew or Arabic that read right-to-left (RTL). Ordinarily, <b>pszText</b> will be displayed in the same direction as the text in its parent window. If TCIF_RTLREADING is set, <b>pszText</b> will read in the opposite direction from the text in the parent window.
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The commctrl.h header defines TCITEM as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-tcitema
 * @namespace Windows.Win32.UI.Controls
 * @charset ANSI
 */
export default struct TCITEMA {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     */
    mask : TCITEMHEADERA_MASK

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-versions">Version 4.70</a>. Specifies the item's current state if information is being retrieved. If item information is being set, this member contains the state value to be set for the item. For a list of valid tab control item states, see <a href="https://docs.microsoft.com/windows/desktop/Controls/tab-control-item-states">Tab Control Item States</a>. This member is ignored in the <a href="https://docs.microsoft.com/windows/desktop/Controls/tcm-insertitem">TCM_INSERTITEM</a> message.
     */
    dwState : TAB_CONTROL_ITEM_STATE

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-versions">Version 4.70</a>. Specifies which bits of the <b>dwState</b> member contain valid information. This member is ignored in the <a href="https://docs.microsoft.com/windows/desktop/Controls/tcm-insertitem">TCM_INSERTITEM</a> message.
     */
    dwStateMask : TAB_CONTROL_ITEM_STATE

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPTSTR</a></b>
     * 
     * Pointer to a null-terminated string that contains the tab text when item information is being set. If item information is being retrieved, this member specifies the address of the buffer that receives the tab text.
     */
    pszText : PSTR

    /**
     * Type: <b>int</b>
     * 
     * Size in <b>TCHAR</b><b>s</b> of the buffer pointed to by the 
     * 					<b>pszText</b> member. If the structure is not receiving information, this member is ignored.
     */
    cchTextMax : Int32

    /**
     * Type: <b>int</b>
     * 
     * Index in the tab control's image list, or -1 if there is no image for the tab.
     */
    iImage : Int32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPARAM</a></b>
     * 
     * Application-defined data associated with the tab control item. If more or less than 4 bytes of application-defined data exist per tab, an application must define a structure and use it instead of the <b>TCITEM</b> structure. The first member of the application-defined structure must be a <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-tcitemheadera">TCITEMHEADER</a> structure.
     */
    lParam : LPARAM

}
