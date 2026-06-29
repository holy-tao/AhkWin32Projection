#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HINSTANCE.ahk" { HINSTANCE }
#Import ".\WINDOW_EX_STYLE.ahk" { WINDOW_EX_STYLE }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\HMENU.ahk" { HMENU }

/**
 * Defines the initialization parameters passed to the window procedure of an application. These members are identical to the parameters of the CreateWindowEx function. (ANSI)
 * @remarks
 * Because the <b>lpszClass</b> member can contain a pointer to a local (and thus inaccessible) atom, do not obtain the class name by using this member. Use the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getclassname">GetClassName</a> function instead.
 * 
 *  You should access the data represented by the <b>lpCreateParams</b> member using a pointer that has been declared using the <b>UNALIGNED</b> type, because the pointer may not be <b>DWORD</b> aligned. This is demonstrated in the following example:
 * 
 *                 
 * 
 * 
 * ```
 * typedef struct tagMyData 
 * {
 *     // Define creation data here. 
 * } MYDATA; 
 *  
 * typedef struct tagMyDlgData 
 * { 
 *     SHORT   cbExtra; 
 *     MYDATA  myData; 
 * } MYDLGDATA, UNALIGNED *PMYDLGDATA; 
 *  
 * PMYDLGDATA pMyDlgdata = (PMYDLGDATA) (((LPCREATESTRUCT) lParam)->lpCreateParams);
 * ```
 * 
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The winuser.h header defines CREATESTRUCT as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-createstructa
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @charset ANSI
 */
export default struct CREATESTRUCTA {
    #StructPack 8

    /**
     * Type: <b>LPVOID</b>
     * 
     * Contains additional data which may be used to create the window. If the window is being created as a result of a call to the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-createwindowa">CreateWindow</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-createwindowexa">CreateWindowEx</a> function, this member contains the value of the <i>lpParam</i> parameter specified in the function call.
     * 
     * If the window being created is a MDI client window, this member contains a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-clientcreatestruct">CLIENTCREATESTRUCT</a> structure. If the window being created is a MDI child window, this member contains a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-mdicreatestructa">MDICREATESTRUCT</a> structure.
     * 
     *  If the window is being created from a dialog template, this member is the address of a <b>SHORT</b> value that specifies the size, in bytes, of the window creation data. The value is immediately followed by the creation data. For more information, see the following Remarks section.
     */
    lpCreateParams : IntPtr

    /**
     * Type: <b>HINSTANCE</b>
     * 
     * A handle to the module that owns the new window.
     */
    hInstance : HINSTANCE

    /**
     * Type: <b>HMENU</b>
     * 
     * A handle to the menu to be used by the new window.
     */
    hMenu : HMENU

    /**
     * Type: <b>HWND</b>
     * 
     * A handle to the parent window, if the window is a child window. If the window is owned, this member identifies the owner window. If the window is not a child or owned window, this member is <b>NULL</b>.
     */
    hwndParent : HWND

    /**
     * Type: <b>int</b>
     * 
     * The height of the new window, in pixels.
     */
    cy : Int32

    /**
     * Type: <b>int</b>
     * 
     * The width of the new window, in pixels.
     */
    cx : Int32

    /**
     * Type: <b>int</b>
     * 
     * The y-coordinate of the upper left corner of the new window. If the new window is a child window, coordinates are relative to the parent window. Otherwise, the coordinates are relative to the screen origin.
     */
    y : Int32

    /**
     * Type: <b>int</b>
     * 
     * The x-coordinate of the upper left corner of the new window. If the new window is a child window, coordinates are relative to the parent window. Otherwise, the coordinates are relative to the screen origin.
     */
    x : Int32

    /**
     * Type: <b>LONG</b>
     * 
     * The style for the new window. For a list of possible values, see <a href="https://docs.microsoft.com/windows/desktop/winmsg/window-styles">Window Styles</a>.
     */
    style : Int32

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * The name of the new window.
     */
    lpszName : PSTR

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * A pointer to a null-terminated string or an atom that specifies the class name of the new window.
     */
    lpszClass : PSTR

    /**
     * Type: <b>DWORD</b>
     * 
     * The extended window style for the new window. For a list of possible values, see  <a href="https://docs.microsoft.com/windows/desktop/winmsg/extended-window-styles">Extended Window Styles</a>.
     */
    dwExStyle : WINDOW_EX_STYLE

}
