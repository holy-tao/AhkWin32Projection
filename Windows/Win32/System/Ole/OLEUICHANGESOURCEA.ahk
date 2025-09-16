#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information that is used to initialize the standard Change Source dialog box. (ANSI)
 * @remarks
 * > [!NOTE]
  * > The oledlg.h header defines OLEUICHANGESOURCE as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/oledlg/ns-oledlg-oleuichangesourcea
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 * @charset ANSI
 */
class OLEUICHANGESOURCEA extends Win32Struct
{
    static sizeof => 136

    static packingSize => 8

    /**
     * The size of the structure, in bytes.
     * @type {Integer}
     */
    cbStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * On input, this field specifies the initialization and creation flags. On exit, it specifies the user's choices. It may be a combination of the following flags.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CSF_SHOWHELP"></a><a id="csf_showhelp"></a><dl>
     * <dt><b>CSF_SHOWHELP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  Enables or shows the Help button. 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CSF_VALIDSOURCE"></a><a id="csf_validsource"></a><dl>
     * <dt><b>CSF_VALIDSOURCE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the link was validated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CSF_ONLYGETSOURCE"></a><a id="csf_onlygetsource"></a><dl>
     * <dt><b>CSF_ONLYGETSOURCE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Disables automatic validation of the link source when the user presses <b>OK</b>. If you specify this flag, you should validate the source when the dialog box returns <b>OK</b>. 
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
     * The window that owns the dialog box.
     * @type {Pointer<HWND>}
     */
    hWndOwner {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Pointer to a string to be used as the title of the dialog box. If <b>NULL</b>, then the library uses <b>Change Source</b>.
     * @type {Pointer<PSTR>}
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
     * Application-defined data that the library passes to the hook function pointed to by the [OLEUICHANGEICON](./nf-oledlg-oleuichangeicona.md) structure in the <i>lParam</i> parameter of the WM_INITDIALOG message; this pointer can be used to retrieve the <b>lCustData</b> member.
     * @type {Pointer}
     */
    lCustData {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Instance that contains a dialog box template specified by the <b>lpszTemplate</b> member. This member is ignored if the <b>lpszTemplate</b> member is <b>NULL</b> or invalid.
     * @type {Pointer<HINSTANCE>}
     */
    hInstance {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Pointer to a null-terminated string that specifies the name of the resource file for the dialog box template that is to be substituted for the library's <b>Convert</b> dialog box template.
     * @type {Pointer<PSTR>}
     */
    lpszTemplate {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Resource handle for a custom dialog box. If this member is <b>NULL</b>, then the library uses the standard <b>Convert</b> dialog box template, or if it is valid, the template named by the <b>lpszTemplate</b> member.
     * @type {Pointer<HRSRC>}
     */
    hResource {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/win32/api/commdlg/ns-commdlg-openfilenamea">OPENFILENAME</a> structure, which contains information used by the operating system to initialize the system-defined <b>Open</b> or <b>Save As</b> dialog boxes.
     * @type {Pointer<OPENFILENAMEA>}
     */
    lpOFN {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * This member is reserved.
     * @type {Array<UInt32>}
     */
    dwReserved1{
        get {
            if(!this.HasProp("__dwReserved1ProxyArray"))
                this.__dwReserved1ProxyArray := Win32FixedArray(this.ptr + 72, 4, Primitive, "uint")
            return this.__dwReserved1ProxyArray
        }
    }

    /**
     * Pointer to the container's implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/oledlg/nn-oledlg-ioleuilinkcontainera">IOleUILinkContainer</a> interface, used to validate the link source. The <b>Edit Links</b> dialog box uses this to allow the container to manipulate its links.
     * @type {Pointer<IOleUILinkContainerA>}
     */
    lpOleUILinkContainer {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * Container-defined unique link identifier used to validate link sources. Used by <b>lpOleUILinkContainer</b>.
     * @type {Integer}
     */
    dwLink {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * Pointer to the complete source display name.
     * @type {Pointer<PSTR>}
     */
    lpszDisplayName {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * File moniker portion of <b>lpszDisplayName</b>.
     * @type {Integer}
     */
    nFileLength {
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }

    /**
     * Pointer to the prefix of the source that was changed from.
     * @type {Pointer<PSTR>}
     */
    lpszFrom {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * Pointer to the prefix of the source to be changed to.
     * @type {Pointer<PSTR>}
     */
    lpszTo {
        get => NumGet(this, 128, "ptr")
        set => NumPut("ptr", value, this, 128)
    }
}
