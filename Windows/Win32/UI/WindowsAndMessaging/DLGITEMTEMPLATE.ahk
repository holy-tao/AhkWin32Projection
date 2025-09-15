#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines the dimensions and style of a control in a dialog box. One or more of these structures are combined with a DLGTEMPLATE structure to form a standard template for a dialog box.
 * @remarks
 * In a standard template for a dialog box, the <b>DLGITEMTEMPLATE</b> structure is always immediately followed by three variable-length arrays specifying the class, title, and creation data for the control. Each array consists of one or more 16-bit elements. 
  * 
  * Each <b>DLGITEMTEMPLATE</b> structure in the template must be aligned on a 
  * 				<b>DWORD</b> boundary. The class and title arrays must be aligned on 
  * 				<b>WORD</b> boundaries. The creation data array must be aligned on a 
  * 				<b>WORD</b> boundary. 
  * 
  * Immediately following each <b>DLGITEMTEMPLATE</b> structure is a class array that specifies the window class of the control. If the first element of this array is any value other than 0xFFFF, the system treats the array as a null-terminated Unicode string that specifies the name of a registered window class. If the first element is 0xFFFF, the array has one additional element that specifies the ordinal value of a predefined system class. The ordinal can be one of the following atom values.
  * 
  * <table class="clsStd">
  * <tr>
  * <th>Value</th>
  * <th>Meaning</th>
  * </tr>
  * <tr>
  * <td>0x0080</td>
  * <td>Button</td>
  * </tr>
  * <tr>
  * <td>0x0081</td>
  * <td>Edit</td>
  * </tr>
  * <tr>
  * <td>0x0082</td>
  * <td>Static</td>
  * </tr>
  * <tr>
  * <td>0x0083</td>
  * <td>List box</td>
  * </tr>
  * <tr>
  * <td>0x0084</td>
  * <td>Scroll bar</td>
  * </tr>
  * <tr>
  * <td>0x0085</td>
  * <td>Combo box</td>
  * </tr>
  * </table>
  *  
  * 
  * Following the class array is a title array that contains the initial text or resource identifier of the control. If the first element of this array is 0xFFFF, the array has one additional element that specifies an ordinal value of a resource, such as an icon, in an executable file. You can use a resource identifier for controls, such as static icon controls, that load and display an icon or other resource rather than text. If the first element is any value other than 0xFFFF, the system treats the array as a null-terminated Unicode string that specifies the initial text. 
  * 
  * The creation data array begins at the next 
  * 				<b>WORD</b> boundary after the title array. This creation data can be of any size and format. If the first word of the creation data array is nonzero, it indicates the size, in bytes, of the creation data (including the size word). The control's window procedure must be able to interpret the data. When the system creates the control, it passes a pointer to this data in the 
  * 				<i>lParam</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/winmsg/wm-create">WM_CREATE</a> message that it sends to the control. 
  * 
  * If you specify character strings in the class and title arrays, you must use Unicode strings. Use the 
  * 				<a href="https://docs.microsoft.com/windows/desktop/api/stringapiset/nf-stringapiset-multibytetowidechar">MultiByteToWideChar</a> function to generate Unicode strings from ANSI strings.
  * 
  * The 
  * 				<b>x</b>, 
  * 				<b>y</b>, 
  * 				<b>cx</b>, and 
  * 				<b>cy</b> members specify values in dialog box units. You can convert these values to screen units (pixels) by using the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-mapdialogrect">MapDialogRect</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-dlgitemtemplate
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class DLGITEMTEMPLATE extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * Type: <b>DWORD</b>
     * 
     * The style of the control. This member can be a combination of <a href="https://docs.microsoft.com/windows/desktop/winmsg/window-styles">window style values</a> (such as <b>WS_BORDER</b>) and one or more of the <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-styles">control style values</a> (such as <b>BS_PUSHBUTTON</b> and <b>ES_LEFT</b>).
     * @type {Integer}
     */
    style {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The extended styles for a window. This member is not used to create controls in dialog boxes, but applications that use dialog box templates can use it to create other types of windows. For a list of values, see <a href="https://docs.microsoft.com/windows/desktop/winmsg/extended-window-styles">Extended Window Styles</a>.
     * @type {Integer}
     */
    dwExtendedStyle {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>short</b>
     * 
     * The 
     * 					<i>x</i>-coordinate, in dialog box units, of the upper-left corner of the control. This coordinate is always relative to the upper-left corner of the dialog box's client area.
     * @type {Integer}
     */
    x {
        get => NumGet(this, 8, "short")
        set => NumPut("short", value, this, 8)
    }

    /**
     * Type: <b>short</b>
     * 
     * The 
     * 					<i>y</i>-coordinate, in dialog box units, of the upper-left corner of the control. This coordinate is always relative to the upper-left corner of the dialog box's client area.
     * @type {Integer}
     */
    y {
        get => NumGet(this, 10, "short")
        set => NumPut("short", value, this, 10)
    }

    /**
     * Type: <b>short</b>
     * 
     * The width, in dialog box units, of the control.
     * @type {Integer}
     */
    cx {
        get => NumGet(this, 12, "short")
        set => NumPut("short", value, this, 12)
    }

    /**
     * Type: <b>short</b>
     * 
     * The height, in dialog box units, of the control.
     * @type {Integer}
     */
    cy {
        get => NumGet(this, 14, "short")
        set => NumPut("short", value, this, 14)
    }

    /**
     * Type: <b>WORD</b>
     * 
     * The control identifier.
     * @type {Integer}
     */
    id {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }
}
