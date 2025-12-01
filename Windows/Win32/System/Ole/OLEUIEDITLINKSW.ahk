#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk
#Include ..\..\Foundation\HINSTANCE.ahk
#Include ..\..\Foundation\HRSRC.ahk

/**
 * Contains information that the OLE User Interface Library uses to initialize the Edit Links dialog box, and contains space for the library to return information when the dialog box is dismissed. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The oledlg.h header defines OLEUIEDITLINKS as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/oledlg/ns-oledlg-oleuieditlinksw
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 * @charset Unicode
 */
class OLEUIEDITLINKSW extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * The size of the structure, in bytes. This member must be filled on input.
     * @type {Integer}
     */
    cbStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * On input, <b>dwFlags</b> specifies the initialization and creation flags. It may be a combination of the following flags.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ELF_SHOWHELP"></a><a id="elf_showhelp"></a><dl>
     * <dt><b>ELF_SHOWHELP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specifies that the dialog box will display a <b>Help</b> button. 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ELF_DISABLEUPDATENOW"></a><a id="elf_disableupdatenow"></a><dl>
     * <dt><b>ELF_DISABLEUPDATENOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specifies that the <b>Update Now</b> button will be disabled on initialization.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ELF_DISABLEOPENSOURCE"></a><a id="elf_disableopensource"></a><dl>
     * <dt><b>ELF_DISABLEOPENSOURCE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specifies that the <b>Open Source</b> button will be disabled on initialization.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ELF_DISABLECHANGESOURCE"></a><a id="elf_disablechangesource"></a><dl>
     * <dt><b>ELF_DISABLECHANGESOURCE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  Specifies that the <b>Change Source</b> button will be disabled on initialization.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ELF_DISABLECANCELLINK"></a><a id="elf_disablecancellink"></a><dl>
     * <dt><b>ELF_DISABLECANCELLINK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specifies that the <b>Cancel Link</b> button will be disabled on initialization. 
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The window that owns the dialog box. This member should not be <b>NULL</b>.
     * @type {HWND}
     */
    hWndOwner{
        get {
            if(!this.HasProp("__hWndOwner"))
                this.__hWndOwner := HWND(8, this)
            return this.__hWndOwner
        }
    }

    /**
     * Pointer to a string to be used as the title of the dialog box. If <b>NULL</b>, then the library uses <b>Links</b>.
     * @type {PWSTR}
     */
    lpszCaption {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Pointer to a hook function that processes messages intended for the dialog box. The hook function must return zero to pass a message that it didn't process back to the dialog box procedure in the library. The hook function must return a nonzero value to prevent the library's dialog box procedure from processing a message it has already processed.
     * @type {Pointer<LPFNOLEUIHOOK>}
     */
    lpfnHook {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Application-defined data that the library passes to the hook function pointed to by the <b>lpfnHook</b> member. The library passes a pointer to the <b>OLEUIEDITLINKS</b> structure in the <i>lParam</i> parameter of the WM_INITDIALOG message; this pointer can be used to retrieve the <b>lCustData</b> member.
     * @type {LPARAM}
     */
    lCustData {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Instance that contains a dialog box template specified by the <b>lpTemplateName</b> member.
     * @type {HINSTANCE}
     */
    hInstance{
        get {
            if(!this.HasProp("__hInstance"))
                this.__hInstance := HINSTANCE(40, this)
            return this.__hInstance
        }
    }

    /**
     * Pointer to a null-terminated string that specifies the name of the resource file for the dialog box template that is to be substituted for the library's <b>Edit Links</b> dialog box template.
     * @type {PWSTR}
     */
    lpszTemplate {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Customized template handle.
     * @type {HRSRC}
     */
    hResource{
        get {
            if(!this.HasProp("__hResource"))
                this.__hResource := HRSRC(56, this)
            return this.__hResource
        }
    }

    /**
     * Pointer to the container's implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/oledlg/nn-oledlg-ioleuilinkcontainera">IOleUILinkContainer</a> Interface. The <b>Edit Links</b> dialog box uses this to allow the container to manipulate its links.
     * @type {IOleUILinkContainerW}
     */
    lpOleUILinkContainer {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }
}
