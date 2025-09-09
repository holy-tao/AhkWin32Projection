#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a button in a toolbar.
 * @remarks
 * The <b>iString</b> member can return either a string pointer or an index. You can use the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-is_intresource">IS_INTRESOURCE</a> macro to determine which is returned.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-tbbutton
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class TBBUTTON extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: <b>int</b>
     * 
     * Zero-based index of the button image. Set this member to I_IMAGECALLBACK, and the toolbar will send the <a href="https://docs.microsoft.com/windows/desktop/Controls/tbn-getdispinfo">TBN_GETDISPINFO</a> notification code to retrieve the image index when it is needed. 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-versions">Version 5.81</a>. Set this member to I_IMAGENONE to indicate that the button does not have an image. The button layout will not include any space for a bitmap, only text.
     * 
     * If the button is a separator, that is, if <b>fsStyle</b> is set to <a href="https://docs.microsoft.com/windows/desktop/Controls/toolbar-control-and-button-styles">BTNS_SEP</a>, <b>iBitmap</b> determines the width of the separator, in pixels. For information on selecting button images from image lists, see <a href="https://docs.microsoft.com/windows/desktop/Controls/tb-setimagelist">TB_SETIMAGELIST</a> message.
     * @type {Integer}
     */
    iBitmap {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b>int</b>
     * 
     * Command identifier associated with the button. This identifier is used in a <a href="https://docs.microsoft.com/windows/desktop/menurc/wm-command">WM_COMMAND</a> message when the button is chosen.
     * @type {Integer}
     */
    idCommand {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * Button state flags. This member can be a combination of the values listed in <a href="https://docs.microsoft.com/windows/desktop/Controls/toolbar-button-states">Toolbar Button States</a>.
     * @type {Integer}
     */
    fsState {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * Button style. This member can be a combination of the button style values listed in <a href="https://docs.microsoft.com/windows/desktop/Controls/toolbar-control-and-button-styles">Toolbar Control and Button Styles</a>.
     * @type {Integer}
     */
    fsStyle {
        get => NumGet(this, 9, "char")
        set => NumPut("char", value, this, 9)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * Reserved.
     * @type {Array<Byte>}
     */
    bReserved{
        get {
            if(!this.HasProp("__bReservedProxyArray"))
                this.__bReservedProxyArray := Win32FixedArray(this.ptr + 10, 2, Primitive, "char")
            return this.__bReservedProxyArray
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD_PTR</a></b>
     * 
     * Application-defined value.
     * @type {Pointer}
     */
    dwData {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">INT_PTR</a></b>
     * 
     * Zero-based index of the button string, or a pointer to a string buffer that contains text for the button.
     * @type {Pointer}
     */
    iString {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
