#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HICON.ahk" { HICON }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HINSTANCE.ahk" { HINSTANCE }
#Import "..\..\Graphics\Gdi\HBRUSH.ahk" { HBRUSH }
#Import ".\WNDCLASS_STYLES.ahk" { WNDCLASS_STYLES }
#Import ".\HCURSOR.ahk" { HCURSOR }

/**
 * Contains the window class attributes that are registered by the RegisterClass function. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The winuser.h header defines WNDCLASS as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-wndclassw
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @charset Unicode
 */
export default struct WNDCLASSW {
    #StructPack 8

    /**
     * Type: <b>UINT</b>
     * 
     * The class style(s). This member can be any combination of the <a href="https://docs.microsoft.com/windows/desktop/winmsg/about-window-classes">Class Styles</a>.
     */
    style : WNDCLASS_STYLES

    /**
     * Type: <b>WNDPROC</b>
     * 
     * A pointer to the window procedure. You must use the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-callwindowproca">CallWindowProc</a> function to call the window procedure. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms633573(v=vs.85)">WindowProc</a>.
     */
    lpfnWndProc : IntPtr

    /**
     * Type: <b>int</b>
     * 
     * The number of extra bytes to allocate following the window-class structure. The system initializes the bytes to zero.
     */
    cbClsExtra : Int32

    /**
     * Type: <b>int</b>
     * 
     * The number of extra bytes to allocate following the window instance. The system initializes the bytes to zero. If an application uses <b>WNDCLASS</b> to register a dialog box created by using the 
     * 					<b>CLASS</b> directive in the resource file, it must set this member to <b>DLGWINDOWEXTRA</b>.
     */
    cbWndExtra : Int32

    /**
     * Type: <b>HINSTANCE</b>
     * 
     * A handle to the instance that contains the window procedure for the class.
     */
    hInstance : HINSTANCE

    /**
     * Type: <b>HICON</b>
     * 
     * A handle to the class icon. This member must be a handle to an icon resource. If this member is <b>NULL</b>, the system provides a default icon.
     */
    hIcon : HICON

    /**
     * Type: <b>HCURSOR</b>
     * 
     * A handle to the class cursor. This member must be a handle to a cursor resource. If this member is <b>NULL</b>, an application must explicitly set the cursor shape whenever the mouse moves into the application's window.
     */
    hCursor : HCURSOR

    /**
     * Type: <b>HBRUSH</b>
     * 
     * A handle to the class background brush. This member can be a handle to the physical brush to be used for painting the background, or it can be a color value. A color value must be one of the following standard system colors (the value 1 must be added to the chosen color). If a color value is given, you must convert it to one of the following 
     * <b>HBRUSH</b> types: 
     * 
     * 
     * <ul>
     * <li>COLOR_ACTIVEBORDER</li>
     * <li>COLOR_ACTIVECAPTION</li>
     * <li>COLOR_APPWORKSPACE</li>
     * <li>COLOR_BACKGROUND</li>
     * <li>COLOR_BTNFACE</li>
     * <li>COLOR_BTNSHADOW</li>
     * <li>COLOR_BTNTEXT</li>
     * <li>COLOR_CAPTIONTEXT</li>
     * <li>COLOR_GRAYTEXT</li>
     * <li>COLOR_HIGHLIGHT</li>
     * <li>COLOR_HIGHLIGHTTEXT</li>
     * <li>COLOR_INACTIVEBORDER</li>
     * <li>COLOR_INACTIVECAPTION</li>
     * <li>COLOR_MENU</li>
     * <li>COLOR_MENUTEXT</li>
     * <li>COLOR_SCROLLBAR</li>
     * <li>COLOR_WINDOW</li>
     * <li>COLOR_WINDOWFRAME</li>
     * <li>COLOR_WINDOWTEXT </li>
     * </ul>
     * The system automatically deletes class background brushes when the class is unregistered by using <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-unregisterclassa">UnregisterClass</a>. An application should not delete these brushes. 
     * 
     * When this member is <b>NULL</b>, an application must paint its own background whenever it is requested to paint in its client area. To determine whether the background must be painted, an application can either process the 
     * 						<a href="https://docs.microsoft.com/windows/desktop/winmsg/wm-erasebkgnd">WM_ERASEBKGND</a> message or test the 
     * 						<b>fErase</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-paintstruct">PAINTSTRUCT</a> structure filled by the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-beginpaint">BeginPaint</a> function.
     */
    hbrBackground : HBRUSH

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * The resource name of the class menu, as the name appears in the resource file. If you use an integer to identify the menu, use the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-makeintresourcea">MAKEINTRESOURCE</a> macro. If this member is <b>NULL</b>, windows belonging to this class have no default menu.
     */
    lpszMenuName : PWSTR

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * A pointer to a null-terminated string or is an atom. If this parameter is an atom, it must be a class atom created by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-registerclassa">RegisterClass</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-registerclassexa">RegisterClassEx</a> function. The atom must be in the low-order word of 
     * 					<b>lpszClassName</b>; the high-order word must be zero. 
     * 					
     * 
     * If <b>lpszClassName</b> is a string, it specifies the window class name. The class name can be any name registered with <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-registerclassa">RegisterClass</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-registerclassexa">RegisterClassEx</a>, or any of the predefined control-class names. 
     * 
     * The maximum length for <b>lpszClassName</b> is 256. If <b>lpszClassName</b> is greater than the maximum length, the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-registerclassa">RegisterClass</a> function will fail.
     */
    lpszClassName : PWSTR

}
