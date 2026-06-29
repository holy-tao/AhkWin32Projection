#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\WINDOW_STYLE.ahk" { WINDOW_STYLE }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Contains information about the class, title, owner, location, and size of a multiple-document interface (MDI) child window. (ANSI)
 * @remarks
 * When the MDI client window creates an MDI child window
 *             by calling <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-createwindowa">CreateWindow</a>, the system sends a <a href="https://docs.microsoft.com/windows/desktop/winmsg/wm-create">WM_CREATE</a> message to the created window. The <i>lParam</i> member of the <b>WM_CREATE</b> message contains a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-createstructa">CREATESTRUCT</a> structure. The 
 * 				<b>lpCreateParams</b> member of this structure contains a pointer to the <b>MDICREATESTRUCT</b> structure passed with the <a href="https://docs.microsoft.com/windows/desktop/winmsg/wm-mdicreate">WM_MDICREATE</a> message that created the MDI child window.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The winuser.h header defines MDICREATESTRUCT as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-mdicreatestructa
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @charset ANSI
 */
export default struct MDICREATESTRUCTA {
    #StructPack 8

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * The name of the window class of the MDI child window. The class name must have been registered by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-registerclassa">RegisterClass</a> function.
     */
    szClass : PSTR

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * The title of the MDI child window. The system displays the title in the child window's title bar.
     */
    szTitle : PSTR

    /**
     * Type: <b>HANDLE</b>
     * 
     * A handle to the instance of the application creating the MDI client window.
     */
    hOwner : HANDLE

    /**
     * Type: <b>int</b>
     * 
     * The initial horizontal position, in client coordinates, of the MDI child window. If this member is <b>CW_USEDEFAULT</b>, the MDI child window is assigned the default horizontal position.
     */
    x : Int32

    /**
     * Type: <b>int</b>
     * 
     * The initial vertical position, in client coordinates, of the MDI child window. If this member is <b>CW_USEDEFAULT</b>, the MDI child window is assigned the default vertical position.
     */
    y : Int32

    /**
     * Type: <b>int</b>
     * 
     * The initial width, in device units, of the MDI child window. If this member is <b>CW_USEDEFAULT</b>, the MDI child window is assigned the default width.
     */
    cx : Int32

    /**
     * Type: <b>int</b>
     * 
     * The initial height, in device units, of the MDI child window. If this member is set to <b>CW_USEDEFAULT</b>, the MDI child window is assigned the default height.
     */
    cy : Int32

    /**
     * Type: <b>DWORD</b>
     */
    style : WINDOW_STYLE

    /**
     * Type: <b>LPARAM</b>
     * 
     * An application-defined value.
     */
    lParam : LPARAM

}
