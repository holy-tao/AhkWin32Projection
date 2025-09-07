#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * Contains or receives information for a specific button in a toolbar. (ANSI)
 * @remarks
 * > [!NOTE]
  * > The commctrl.h header defines TBBUTTONINFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-tbbuttoninfoa
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 * @charset ANSI
 */
class TBBUTTONINFOA extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Size of the structure, in bytes. This member must be filled in prior to sending the associated message.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * @type {Integer}
     */
    dwMask {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>int</b>
     * 
     * Command identifier of the button.
     * @type {Integer}
     */
    idCommand {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Type: <b>int</b>
     * 
     * Image index of the button. Set this member to I_IMAGECALLBACK, and the toolbar will send the <a href="https://docs.microsoft.com/windows/desktop/Controls/tbn-getdispinfo">TBN_GETDISPINFO</a> notification code to retrieve the image index when it is needed. 
     *                     
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-versions">Version 5.81</a>. Set this member to I_IMAGENONE to indicate that the button does not have an image. The button layout will not include any space for a bitmap, only text.
     * @type {Integer}
     */
    iImage {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * State flags of the button. This can be one or more of the values listed in  <a href="https://docs.microsoft.com/windows/desktop/Controls/toolbar-button-states">Toolbar Button States</a>.
     * @type {Integer}
     */
    fsState {
        get => NumGet(this, 16, "char")
        set => NumPut("char", value, this, 16)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * Style flags of the button. This can be one or more of the values listed in <a href="https://docs.microsoft.com/windows/desktop/Controls/toolbar-control-and-button-styles">Toolbar Control and Button Styles</a>.
     * @type {Integer}
     */
    fsStyle {
        get => NumGet(this, 17, "char")
        set => NumPut("char", value, this, 17)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">WORD</a></b>
     * 
     * Width of the button, in pixels.
     * @type {Integer}
     */
    cx {
        get => NumGet(this, 18, "ushort")
        set => NumPut("ushort", value, this, 18)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD_PTR</a></b>
     * 
     * Application-defined value associated with the button.
     * @type {Pointer}
     */
    lParam {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPTSTR</a></b>
     * 
     * Address of a character buffer that contains or receives the button text.
     * @type {PSTR}
     */
    pszText{
        get {
            if(!this.HasProp("__pszText"))
                this.__pszText := PSTR(this.ptr + 32)
            return this.__pszText
        }
    }

    /**
     * Type: <b>int</b>
     * 
     * Size of the buffer at <b>pszText</b>. If the button information is being set, this member is ignored.
     * @type {Integer}
     */
    cchText {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 48
    }
}
