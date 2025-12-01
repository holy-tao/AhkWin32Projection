#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the size and position of either a primary or secondary Help window. An application can set this information by calling the WinHelp function with the HELP_SETWINPOS value. (Unicode)
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
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-helpwininfow
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 * @charset Unicode
 */
class HELPWININFOW extends Win32Struct
{
    static sizeof => 28

    static packingSize => 4

    /**
     * Type: <b>int</b>
     * 
     * The size of this structure, in bytes.
     * @type {Integer}
     */
    wStructSize {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b>int</b>
     * 
     * X-coordinate of the upper-left corner of the window, in screen coordinates.
     * @type {Integer}
     */
    x {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Type: <b>int</b>
     * 
     * Y-coordinate of the upper-left corner of the window, in screen coordinates.
     * @type {Integer}
     */
    y {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Type: <b>int</b>
     * 
     * The width of the window, in pixels.
     * @type {Integer}
     */
    dx {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * Type: <b>int</b>
     * 
     * The height of the window, in pixels.
     * @type {Integer}
     */
    dy {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Type: <b>int</b>
     * 
     * Options for display of the window. It can be any of the values that can be specified in the <i>nCmdShow</i> parameter for the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-showwindow">ShowWindow</a> function.
     * @type {Integer}
     */
    wMax {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * Type: <b>TCHAR[2]</b>
     * 
     * The name of the window.
     * @type {String}
     */
    rgchMember {
        get => StrGet(this.ptr + 24, 1, "UTF-16")
        set => StrPut(value, this.ptr + 24, 1, "UTF-16")
    }
}
