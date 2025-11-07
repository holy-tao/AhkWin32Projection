#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\HWND.ahk
#Include ..\..\..\Graphics\Gdi\HDC.ahk
#Include ..\..\..\Foundation\HINSTANCE.ahk

/**
 * Contains information that the ChooseFont function uses to initialize the Font dialog box. After the user closes the dialog box, the system returns information about the user's selection in this structure.
 * @remarks
 * 
 * > [!NOTE]
 * > The commdlg.h header defines CHOOSEFONT as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * 
 * @see https://docs.microsoft.com/windows/win32/api//commdlg/ns-commdlg-choosefontw
 * @namespace Windows.Win32.UI.Controls.Dialogs
 * @version v4.0.30319
 * @charset Unicode
 */
class CHOOSEFONTW extends Win32Struct
{
    static sizeof => 104

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The length of the structure, in bytes.
     * @type {Integer}
     */
    lStructSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>HWND</b>
     * 
     * A handle to the window that owns the dialog box. This member can be any valid window handle, or it can be <b>NULL</b> if the dialog box has no owner.
     * @type {HWND}
     */
    hwndOwner{
        get {
            if(!this.HasProp("__hwndOwner"))
                this.__hwndOwner := HWND(8, this)
            return this.__hwndOwner
        }
    }

    /**
     * Type: <b>HDC</b>
     * 
     * This member is ignored by the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms646914(v=vs.85)">ChooseFont</a> function.
     * 
     * <b>Windows Vista and Windows XP/2000:  </b>A handle to the device context or information context of the printer whose fonts will be listed in the dialog box. This member is used only if the <b>Flags</b> member specifies the <b>CF_PRINTERFONTS</b> or <b>CF_BOTH</b> flag; otherwise, this member is ignored.
     * @type {HDC}
     */
    hDC{
        get {
            if(!this.HasProp("__hDC"))
                this.__hDC := HDC(16, this)
            return this.__hDC
        }
    }

    /**
     * Type: <b>LPLOGFONT</b>
     * 
     * A pointer to a  <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logfonta">LOGFONT</a> structure. If you set the <b>CF_INITTOLOGFONTSTRUCT</b> flag in the <b>Flags</b> member and initialize the other members, the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms646914(v=vs.85)">ChooseFont</a> function initializes the dialog box with a font that matches the <b>LOGFONT</b> members. If the user clicks the <b>OK</b> button, <b>ChooseFont</b> sets the members of the <b>LOGFONT</b> structure based on the user's selections.
     * @type {Pointer<LOGFONTW>}
     */
    lpLogFont {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: <b>INT</b>
     * 
     * The size of the selected font, in units of 1/10 of a point. The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms646914(v=vs.85)">ChooseFont</a> function sets this value after the user closes the dialog box.
     * @type {Integer}
     */
    iPointSize {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * Type: <b>DWORD</b>
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a></b>
     * 
     * If the <b>CF_EFFECTS</b> flag is set, <b>rgbColors</b> specifies the initial text color. When <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms646914(v=vs.85)">ChooseFont</a> returns successfully, this member contains the RGB value of the text color that the user selected. To create a <a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a> color value, use the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-rgb">RGB</a> macro.
     * @type {COLORREF}
     */
    rgbColors {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Type: <b>LPARAM</b>
     * 
     * Application-defined data that the system passes to the hook procedure identified by the <b>lpfnHook</b> member. When the system sends the <a href="https://docs.microsoft.com/windows/desktop/dlgbox/wm-initdialog">WM_INITDIALOG</a> message to the hook procedure, the message's <i>lParam</i> parameter is a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms646914(v=vs.85)">CHOOSEFONT</a> structure specified when the dialog was created. The hook procedure can use this pointer to get the <b>lCustData</b> value.
     * @type {LPARAM}
     */
    lCustData {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Type: <b>LPCFHOOKPROC</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/nc-commdlg-lpcfhookproc">CFHookProc</a> hook procedure that can process messages intended for the dialog box. This member is ignored unless the <b>CF_ENABLEHOOK</b> flag is set in the <b>Flags</b> member.
     * @type {Pointer<LPCFHOOKPROC>}
     */
    lpfnHook {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * The name of the dialog box template resource in the module identified by the <b>hInstance</b> member. This template is substituted for the standard dialog box template. For numbered dialog box resources, <b>lpTemplateName</b> can be a value returned by the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-makeintresourcea">MAKEINTRESOURCE</a> macro. This member is ignored unless the <b>CF_ENABLETEMPLATE</b> flag is set in the <b>Flags</b> member.
     * @type {PWSTR}
     */
    lpTemplateName {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * Type: <b>HINSTANCE</b>
     * 
     * If the <b>CF_ENABLETEMPLATEHANDLE</b> flag is set in the <b>Flags</b> member, <b>hInstance</b> is a handle to a memory object containing a dialog box template. If the <b>CF_ENABLETEMPLATE</b> flag is set, <b>hInstance</b> is a handle to a module that contains a dialog box template named by the <b>lpTemplateName</b> member. If neither <b>CF_ENABLETEMPLATEHANDLE</b> nor <b>CF_ENABLETEMPLATE</b> is set, this member is ignored.
     * @type {HINSTANCE}
     */
    hInstance{
        get {
            if(!this.HasProp("__hInstance"))
                this.__hInstance := HINSTANCE(72, this)
            return this.__hInstance
        }
    }

    /**
     * Type: <b>LPTSTR</b>
     * 
     * The style data. If the <b>CF_USESTYLE</b> flag is specified, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms646914(v=vs.85)">ChooseFont</a> uses the data in this buffer to initialize the <b>Font Style</b> combo box. When the user closes the dialog box, <b>ChooseFont</b> copies the string in the <b>Font Style</b> combo box into this buffer.
     * @type {PWSTR}
     */
    lpszStyle {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * Type: <b>WORD</b>
     * @type {Integer}
     */
    nFontType {
        get => NumGet(this, 88, "ushort")
        set => NumPut("ushort", value, this, 88)
    }

    /**
     * Type: <b>INT</b>
     * 
     * The minimum point size a user can select. <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms646914(v=vs.85)">ChooseFont</a> recognizes this member only if the <b>CF_LIMITSIZE</b> flag is specified.
     * @type {Integer}
     */
    nSizeMin {
        get => NumGet(this, 92, "int")
        set => NumPut("int", value, this, 92)
    }

    /**
     * Type: <b>INT</b>
     * 
     * The maximum point size a user can select. <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms646914(v=vs.85)">ChooseFont</a> recognizes this member only if the <b>CF_LIMITSIZE</b> flag is specified.
     * @type {Integer}
     */
    nSizeMax {
        get => NumGet(this, 96, "int")
        set => NumPut("int", value, this, 96)
    }
}
