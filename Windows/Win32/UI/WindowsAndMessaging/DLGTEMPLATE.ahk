#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines the dimensions and style of a dialog box.
 * @remarks
 * In a standard template for a dialog box, the <b>DLGTEMPLATE</b> structure is always immediately followed by three variable-length arrays that specify the menu, class, and title for the dialog box. When the DS_SETFONT style is specified, these arrays are also followed by a 16-bit value specifying point size and another variable-length array specifying a typeface name. Each array consists of one or more 16-bit elements. The menu, class, title, and font arrays must be aligned on 
  * 				<b>WORD</b> boundaries. 
  * 
  * Immediately following the <b>DLGTEMPLATE</b> structure is a menu array that identifies a menu resource for the dialog box. If the first element of this array is 0x0000, the dialog box has no menu and the array has no other elements. If the first element is 0xFFFF, the array has one additional element that specifies the ordinal value of a menu resource in an executable file. If the first element has any other value, the system treats the array as a null-terminated Unicode string that specifies the name of a menu resource in an executable file. 
  * 
  * Following the menu array is a class array that identifies the window class of the dialog box. If the first element of the array is 0x0000, the system uses the predefined dialog box class for the dialog box and the array has no other elements. If the first element is 0xFFFF, the array has one additional element that specifies the ordinal value of a predefined system window class. If the first element has any other value, the system treats the array as a null-terminated Unicode string that specifies the name of a registered window class. 
  * 
  * Following the class array is a title array that specifies a null-terminated Unicode string that contains the title of the dialog box. If the first element of this array is 0x0000, the dialog box has no title and the array has no other elements. 
  * 
  * The 16-bit point size value and the typeface array follow the title array, but only if the 
  * 				<b>style</b> member specifies the DS_SETFONT style. The point size value
  * specifies the point size of the font to use for the text in the dialog box and its controls. The typeface array is a null-terminated Unicode string specifying the name of the typeface for the font. When these values are specified, the system creates a font having the specified size and typeface (if possible) and sends a <a href="https://docs.microsoft.com/windows/desktop/winmsg/wm-setfont">WM_SETFONT</a> message to the dialog box procedure and the control window procedures as it creates the dialog box and controls. 
  * 
  * Following the <b>DLGTEMPLATE</b> header in a standard dialog box template are one or more <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-dlgitemtemplate">DLGITEMTEMPLATE</a> structures that define the dimensions and style of the controls in the dialog box. The 
  * 				<b>cdit</b> member specifies the number of <b>DLGITEMTEMPLATE</b> structures in the template. These <b>DLGITEMTEMPLATE</b> structures must be aligned on 
  * 				<b>DWORD</b> boundaries.
  * 
  * If you specify character strings in the menu, class, title, or typeface arrays, you must use Unicode strings. 
  * 
  * The 
  * 				<b>x</b>, 
  * 				<b>y</b>, 
  * 				<b>cx</b>, and 
  * 				<b>cy</b> members specify values in dialog box units. You can convert these values to screen units (pixels) by using the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-mapdialogrect">MapDialogRect</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-dlgtemplate
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class DLGTEMPLATE extends Win32Struct
{
    static sizeof => 18

    static packingSize => 2

    /**
     * Type: <b>DWORD</b>
     * 
     * The style of the dialog box. This member can be a combination of <a href="https://docs.microsoft.com/windows/desktop/winmsg/window-styles">window style values</a> (such as <b>WS_CAPTION</b> and <b>WS_SYSMENU</b>) and <a href="https://docs.microsoft.com/windows/desktop/dlgbox/dialog-box-styles">dialog box style values</a> (such as <b>DS_CENTER</b>).
     * 
     * If the style member includes the <b>DS_SETFONT</b> style, the header of the dialog box template contains additional data specifying the font to use for text in the client area and controls of the dialog box. The font data begins on the 
     * 						<b>WORD</b> boundary that follows the title array. The font data specifies a 16-bit point size value and a Unicode font name string. If possible, the system creates a font according to the specified values. Then the system sends a <a href="https://docs.microsoft.com/windows/desktop/winmsg/wm-setfont">WM_SETFONT</a> message to the dialog box and to each control to provide a handle to the font. If <b>DS_SETFONT</b> is not specified, the dialog box template does not include the font data. 
     * 
     * The <b>DS_SHELLFONT</b> style is not supported in the <b>DLGTEMPLATE</b> header.
     * @type {Integer}
     */
    style {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The extended styles for a window. This member is not used to create dialog boxes, but applications that use dialog box templates can use it to create other types of windows. For a list of values, see <a href="https://docs.microsoft.com/windows/desktop/winmsg/extended-window-styles">Extended Window Styles</a>.
     * @type {Integer}
     */
    dwExtendedStyle {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>WORD</b>
     * 
     * The number of items in the dialog box.
     * @type {Integer}
     */
    cdit {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * Type: <b>short</b>
     * 
     * The x-coordinate, in dialog box units, of the upper-left corner of the dialog box.
     * @type {Integer}
     */
    x {
        get => NumGet(this, 10, "short")
        set => NumPut("short", value, this, 10)
    }

    /**
     * Type: <b>short</b>
     * 
     * The y-coordinate, in dialog box units, of the upper-left corner of the dialog box.
     * @type {Integer}
     */
    y {
        get => NumGet(this, 12, "short")
        set => NumPut("short", value, this, 12)
    }

    /**
     * Type: <b>short</b>
     * 
     * The width, in dialog box units, of the dialog box.
     * @type {Integer}
     */
    cx {
        get => NumGet(this, 14, "short")
        set => NumPut("short", value, this, 14)
    }

    /**
     * Type: <b>short</b>
     * 
     * The height, in dialog box units, of the dialog box.
     * @type {Integer}
     */
    cy {
        get => NumGet(this, 16, "short")
        set => NumPut("short", value, this, 16)
    }
}
