#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECT.ahk

/**
 * The TOOLINFO structure contains information about a tool in a tooltip control. (ANSI)
 * @remarks
 * Normal windows display text left-to-right (LTR). Windows can be <i>mirrored</i> to display languages such as Hebrew or Arabic that read right-to-left (RTL). Normally, tooltip text is displayed in the same direction as the text in its parent window. If TTF_RTLREADING is set, tooltip text will read in the opposite direction from the text in the parent window.
  * 
  * 
  * 
  * 
  * > [!NOTE]
  * > The commctrl.h header defines TTTOOLINFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-tttoolinfoa
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 * @charset ANSI
 */
class TTTOOLINFOA extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Size of this structure, in bytes. This member must be specified.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * @type {Integer}
     */
    uFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
     * 
     * Handle to the window that contains the tool. If <b>lpszText</b> includes the LPSTR_TEXTCALLBACK value, this member identifies the window that receives the <a href="https://docs.microsoft.com/windows/desktop/Controls/ttn-getdispinfo">TTN_GETDISPINFO</a> notification codes.
     * @type {Pointer<Void>}
     */
    hwnd {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT_PTR</a></b>
     * 
     * Application-defined identifier of the tool. If <b>uFlags</b> includes the TTF_IDISHWND flag, <b>uId</b> must specify the window handle to the tool.
     * @type {Pointer}
     */
    uId {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a></b>
     * 
     * The bounding rectangle coordinates of the tool. The coordinates are relative to the upper-left corner of the client area of the window identified by <b>hwnd</b>. If <b>uFlags</b> includes the TTF_IDISHWND flag, this member is ignored.
     * @type {RECT}
     */
    rect{
        get {
            if(!this.HasProp("__rect"))
                this.__rect := RECT(this.ptr + 24)
            return this.__rect
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HINSTANCE</a></b>
     * 
     * Handle to the instance that contains the string resource for the tool. If <b>lpszText</b> specifies the identifier of a string resource, this member is used.
     * @type {Pointer<Void>}
     */
    hinst {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPTSTR</a></b>
     * 
     * Pointer to the buffer that contains the text for the tool, or identifier of the string resource that contains the text. This member is sometimes used to return values. If you need to examine the returned value,  must point to a valid buffer of sufficient size. Otherwise, it can be set to <b>NULL</b>. If <b>lpszText</b> is set to LPSTR_TEXTCALLBACK, the control sends
     * the <a href="https://docs.microsoft.com/windows/desktop/Controls/ttn-getdispinfo">TTN_GETDISPINFO</a> notification code to the owner window to retrieve the text.
     * @type {Pointer<Byte>}
     */
    lpszText {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPARAM</a></b>
     * 
     * <b>Version 4.70 and later</b>. A 32-bit application-defined value that is associated with the tool.
     * @type {Pointer}
     */
    lParam {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Type: <b>void*</b>
     * 
     * Reserved. Must be set to <b>NULL</b>.
     * @type {Pointer<Void>}
     */
    lpReserved {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 72
    }
}
