#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\TCITEMHEADERA_MASK.ahk" { TCITEMHEADERA_MASK }

/**
 * Specifies or receives the attributes of a tab. It is used with the TCM_INSERTITEM, TCM_GETITEM, and TCM_SETITEM messages. This structure supersedes the TC_ITEMHEADER structure. (ANSI)
 * @remarks
 * Typically, windows display text left-to-right (LTR). Windows can be 
 * 				<i>mirrored</i> to display languages such as Hebrew or Arabic that read right-to-left (RTL). Ordinarily, 
 * 				<b>pszText</b> will be displayed in the same direction as the text in its parent window. If TCIF_RTLREADING is set, 
 * 				<b>pszText</b> will read in the opposite direction from the text in the parent window.
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The commctrl.h header defines TCITEMHEADER as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-tcitemheadera
 * @namespace Windows.Win32.UI.Controls
 * @charset ANSI
 */
export default struct TCITEMHEADERA {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     */
    mask : TCITEMHEADERA_MASK

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Reserved member. Do not use.
     */
    lpReserved1 : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Reserved member. Do not use.
     */
    lpReserved2 : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPTSTR</a></b>
     * 
     * Address of a null-terminated string that contains the tab text if item information is being set. If item information is being retrieved, this member specifies the address of the buffer that receives the tab text.
     */
    pszText : PSTR

    /**
     * Type: <b>int</b>
     * 
     * Size of the buffer pointed to by the pszText member. If the structure is not receiving information, this member is ignored.
     */
    cchTextMax : Int32

    /**
     * Type: <b>int</b>
     * 
     * Index into the tab control's image list, or -1 if there is no image for the tab.
     */
    iImage : Int32

}
