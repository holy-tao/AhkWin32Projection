#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * Contains the size and position of either a primary or secondary Help window. An application can set this information by calling the WinHelp function with the HELP_SETWINPOS value. (ANSI)
 * @remarks
 * Windows Help divides the display into 1024 units in both the X and Y directions. To create a secondary window that fills the upper-left quadrant of the display, for example, an application would specify zero for the <b>x</b> and <b>y</b> members and 512 for the <b>dx</b> and <b>dy</b> members.
 * 
 * To calculate <b>wStructSize</b> properly, the actual size of the string to be stored at <b>rgchMember</b> must be known. Since <a href="https://docs.microsoft.com/previous-versions/0w557fh7(v=vs.85)">sizeof</a>(HELPWININFO) includes two <b>TCHARs</b> by definition, they must be taken into account in the final total. The following example shows the proper calculation of an instance of  <b>wStructSize</b>.
 * 
 *                 
 * 
 * 
 * ```
 * WORD wSize;
 * TCHAR *szWndName = TEXT("wnd_menu"); 
 * size_t NameLength;  
 * HRESULT hr;
 * HELPWININFO hwi;
 * 
 * // StringCbLength returns the length of the string without 
 * // the terminating null character.
 * hr = StringCbLength(szWndName, STRSAFE_MAX_CCH * sizeof(TCHAR), &NameLength);
 *     
 * if (SUCCEEDED(hr))
 * {
 *     // Add bytes to account for the name string's terminating null character.
 *     NameLength + sizeof(TCHAR);
 *     
 *     // Determine the size of HELPWININFO without the TCHAR array.
 *     wSize = sizeof(HELPWININFO) - (2 * sizeof(TCHAR));
 *     
 *     // Determine the total size of the final HELPWININFO structure.
 *     hwi.wStructSize = wSize + NameLength;
 * }
 * ```
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The winuser.h header defines HELPWININFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-helpwininfoa
 * @namespace Windows.Win32.UI.Shell
 * @charset ANSI
 */
export default struct HELPWININFOA {
    #StructPack 4

    /**
     * Type: <b>int</b>
     * 
     * The size of this structure, in bytes.
     */
    wStructSize : Int32

    /**
     * Type: <b>int</b>
     * 
     * X-coordinate of the upper-left corner of the window, in screen coordinates.
     */
    x : Int32

    /**
     * Type: <b>int</b>
     * 
     * Y-coordinate of the upper-left corner of the window, in screen coordinates.
     */
    y : Int32

    /**
     * Type: <b>int</b>
     * 
     * The width of the window, in pixels.
     */
    dx : Int32

    /**
     * Type: <b>int</b>
     * 
     * The height of the window, in pixels.
     */
    dy : Int32

    /**
     * Type: <b>int</b>
     * 
     * Options for display of the window. It can be any of the values that can be specified in the <i>nCmdShow</i> parameter for the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-showwindow">ShowWindow</a> function.
     */
    wMax : Int32

    /**
     * Type: <b>TCHAR[2]</b>
     * 
     * The name of the window.
     */
    rgchMember : CHAR[2]

}
