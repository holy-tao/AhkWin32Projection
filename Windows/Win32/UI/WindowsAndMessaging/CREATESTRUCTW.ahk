#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines the initialization parameters passed to the window procedure of an application. These members are identical to the parameters of the CreateWindowEx function. (Unicode)
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
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-createstructw
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 * @charset Unicode
 */
class CREATESTRUCTW extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * Type: <b>LPVOID</b>
     * 
     * Contains additional data which may be used to create the window. If the window is being created as a result of a call to the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-createwindowa">CreateWindow</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-createwindowexa">CreateWindowEx</a> function, this member contains the value of the <i>lpParam</i> parameter specified in the function call.
     * 
     * If the window being created is a MDI client window, this member contains a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-clientcreatestruct">CLIENTCREATESTRUCT</a> structure. If the window being created is a MDI child window, this member contains a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-mdicreatestructa">MDICREATESTRUCT</a> structure.
     * 
     *  If the window is being created from a dialog template, this member is the address of a <b>SHORT</b> value that specifies the size, in bytes, of the window creation data. The value is immediately followed by the creation data. For more information, see the following Remarks section.
     * @type {Pointer<Void>}
     */
    lpCreateParams {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: <b>HINSTANCE</b>
     * 
     * A handle to the module that owns the new window.
     * @type {Pointer<HINSTANCE>}
     */
    hInstance {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b>HMENU</b>
     * 
     * A handle to the menu to be used by the new window.
     * @type {Pointer<HMENU>}
     */
    hMenu {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: <b>HWND</b>
     * 
     * A handle to the parent window, if the window is a child window. If the window is owned, this member identifies the owner window. If the window is not a child or owned window, this member is <b>NULL</b>.
     * @type {Pointer<HWND>}
     */
    hwndParent {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: <b>int</b>
     * 
     * The height of the new window, in pixels.
     * @type {Integer}
     */
    cy {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * Type: <b>int</b>
     * 
     * The width of the new window, in pixels.
     * @type {Integer}
     */
    cx {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * Type: <b>int</b>
     * 
     * The y-coordinate of the upper left corner of the new window. If the new window is a child window, coordinates are relative to the parent window. Otherwise, the coordinates are relative to the screen origin.
     * @type {Integer}
     */
    y {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * Type: <b>int</b>
     * 
     * The x-coordinate of the upper left corner of the new window. If the new window is a child window, coordinates are relative to the parent window. Otherwise, the coordinates are relative to the screen origin.
     * @type {Integer}
     */
    x {
        get => NumGet(this, 44, "int")
        set => NumPut("int", value, this, 44)
    }

    /**
     * Type: <b>LONG</b>
     * 
     * The style for the new window. For a list of possible values, see <a href="https://docs.microsoft.com/windows/desktop/winmsg/window-styles">Window Styles</a>.
     * @type {Integer}
     */
    style {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * The name of the new window.
     * @type {Pointer<PWSTR>}
     */
    lpszName {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * A pointer to a null-terminated string or an atom that specifies the class name of the new window.
     * @type {Pointer<PWSTR>}
     */
    lpszClass {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The extended window style for the new window. For a list of possible values, see  <a href="https://docs.microsoft.com/windows/desktop/winmsg/extended-window-styles">Extended Window Styles</a>.
     * @type {Integer}
     */
    dwExStyle {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }
}
