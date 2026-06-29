#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\TBBUTTONINFOW_MASK.ahk" { TBBUTTONINFOW_MASK }

/**
 * Contains or receives information for a specific button in a toolbar. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The commctrl.h header defines TBBUTTONINFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-tbbuttoninfow
 * @namespace Windows.Win32.UI.Controls
 * @charset Unicode
 */
export default struct TBBUTTONINFOW {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Size of the structure, in bytes. This member must be filled in prior to sending the associated message.
     */
    cbSize : UInt32 := this.Size

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     */
    dwMask : TBBUTTONINFOW_MASK

    /**
     * Type: <b>int</b>
     * 
     * Command identifier of the button.
     */
    idCommand : Int32

    /**
     * Type: <b>int</b>
     * 
     * Image index of the button. Set this member to I_IMAGECALLBACK, and the toolbar will send the <a href="https://docs.microsoft.com/windows/desktop/Controls/tbn-getdispinfo">TBN_GETDISPINFO</a> notification code to retrieve the image index when it is needed. 
     *                     
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-versions">Version 5.81</a>. Set this member to I_IMAGENONE to indicate that the button does not have an image. The button layout will not include any space for a bitmap, only text.
     */
    iImage : Int32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * State flags of the button. This can be one or more of the values listed in  <a href="https://docs.microsoft.com/windows/desktop/Controls/toolbar-button-states">Toolbar Button States</a>.
     */
    fsState : Int8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * Style flags of the button. This can be one or more of the values listed in <a href="https://docs.microsoft.com/windows/desktop/Controls/toolbar-control-and-button-styles">Toolbar Control and Button Styles</a>.
     */
    fsStyle : Int8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">WORD</a></b>
     * 
     * Width of the button, in pixels.
     */
    cx : UInt16

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD_PTR</a></b>
     * 
     * Application-defined value associated with the button.
     */
    lParam : IntPtr

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPTSTR</a></b>
     * 
     * Address of a character buffer that contains or receives the button text.
     */
    pszText : PWSTR

    /**
     * Type: <b>int</b>
     * 
     * Size of the buffer at <b>pszText</b>. If the button information is being set, this member is ignored.
     */
    cchText : Int32

}
