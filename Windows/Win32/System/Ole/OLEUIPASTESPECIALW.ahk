#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk
#Include ..\..\Foundation\HINSTANCE.ahk
#Include ..\..\Foundation\HRSRC.ahk
#Include ..\..\Foundation\HGLOBAL.ahk
#Include ..\..\Foundation\SIZE.ahk

/**
 * Contains information that the OLE User Interface Library uses to initialize the Paste Special dialog box, as well as space for the library to return information when the dialog box is dismissed.
 * @remarks
 * 
  * > [!NOTE]
  * > The oledlg.h header defines OLEUIPASTESPECIAL as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
  * 
 * @see https://docs.microsoft.com/windows/win32/api//oledlg/ns-oledlg-oleuipastespecialw
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 * @charset Unicode
 */
class OLEUIPASTESPECIALW extends Win32Struct
{
    static sizeof => 136

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
     * On input, <b>dwFlags</b> specifies the initialization and creation flags. On exit, it specifies the user's choices. It may be a combination of the following flags.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PSF_SHOWHELP"></a><a id="psf_showhelp"></a><dl>
     * <dt><b>PSF_SHOWHELP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Dialog box will display a <b>Help</b> button.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PSF_SELECTPASTE"></a><a id="psf_selectpaste"></a><dl>
     * <dt><b>PSF_SELECTPASTE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>Paste</b> radio button will be selected at dialog box startup. This is the default, if PSF_SELECTPASTE or PSF_SELECTPASTELINK are not specified. Also, it specifies the state of the button on dialog termination. IN/OUT flag. 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PSF_SELECTPASTELINK"></a><a id="psf_selectpastelink"></a><dl>
     * <dt><b>PSF_SELECTPASTELINK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>PasteLink</b> radio button will be selected at dialog box startup. Also, specifies the state of the button on dialog termination. IN/OUT flag. 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PSF_CHECKDISPLAYASICON"></a><a id="psf_checkdisplayasicon"></a><dl>
     * <dt><b>PSF_CHECKDISPLAYASICON</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Whether the <b>Display As Icon</b> radio button was checked on dialog box termination. OUT flag. 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PSF_DISABLEDISPLAYASICON"></a><a id="psf_disabledisplayasicon"></a><dl>
     * <dt><b>PSF_DISABLEDISPLAYASICON</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>Display As Icon</b> check box will be disabled on initialization.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HIDECHANGEICON"></a><a id="hidechangeicon"></a><dl>
     * <dt><b>HIDECHANGEICON</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Used to disable the change-icon button in the dialog box, which is available to users when they're pasting an OLE object by default. See <b>STAYONCLIPBOARDCHANGE</b> otherwise. 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="STAYONCLIPBOARDCHANGE"></a><a id="stayonclipboardchange"></a><dl>
     * <dt><b>STAYONCLIPBOARDCHANGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  Used to tell the dialog box to stay up if the clipboard changes while the dialog box is up. If the user switches to another application and copies or cuts something, the dialog box will, by default, perform a cancel operation, which will remove the dialog box since the options it's in the middle of presenting to the user are no longer up-to-date with respect to what's really on the clipboard. 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NOREFRESHDATAOBJECT"></a><a id="norefreshdataobject"></a><dl>
     * <dt><b>NOREFRESHDATAOBJECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  Used in conjunction with <b>STAYONCLIPBOARDCHANGE</b> (it doesn't do anything otherwise). If the clipboard changes while the dialog box is up and <b>STAYONCLIPBOARDCHANGE</b> is specified, then <b>NOREFRESHDATAOBJECT</b> indicates that the dialog box should NOT refresh the contents of the dialog box to reflect the new contents of the clipboard. This is useful if the application is using the paste-special dialog box on an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> besides the one on the clipboard, for example, as part of a right-click drag-and-drop operation. 
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
     * Pointer to a string to be used as the title of the dialog box. If <b>NULL</b>, then the library uses <b>Paste Special</b>.
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
     * Application-defined data that the library passes to the hook function pointed to by the <b>lpfnHook</b> member. The library passes a pointer to the <b>OLEUIPASTESPECIAL</b> structure in the <b>lParam</b> parameter of the WM_INITDIALOG message; this pointer can be used to retrieve the <b>lCustData</b> member.
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
     * Pointer to a null-terminated string that specifies the name of the resource file for the dialog box template that is to be substituted for the library's <b>Paste Special</b> dialog box template.
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
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> interface of the data object to be pasted (from the clipboard). This member is filled on input. If <b>lpSrcDataObj</b> is <b>NULL</b> when <a href="https://docs.microsoft.com/windows/desktop/api/oledlg/nf-oledlg-oleuipastespeciala">OleUIPasteSpecial</a> is called, then <b>OleUIPasteSpecial</b> will attempt to retrieve a pointer to an <b>IDataObject</b> from the clipboard. If <b>OleUIPasteSpecial</b> succeeds, it is the caller's responsibility to free the <b>IDataObject</b> returned in <b>lpSrcDataObj</b>.
     * @type {Pointer<IDataObject>}
     */
    lpSrcDataObj {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/oledlg/ns-oledlg-oleuipasteentrya">OLEUIPASTEENTRY</a> array which specifies acceptable formats. This member is filled on input.
     * @type {Pointer<OLEUIPASTEENTRYW>}
     */
    arrPasteEntries {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * Number of <a href="https://docs.microsoft.com/windows/desktop/api/oledlg/ns-oledlg-oleuipasteentrya">OLEUIPASTEENTRY</a> array entries. This member is filled on input.
     * @type {Integer}
     */
    cPasteEntries {
        get => NumGet(this, 80, "int")
        set => NumPut("int", value, this, 80)
    }

    /**
     * List of link types that are acceptable. Link types are referred to using <a href="https://docs.microsoft.com/windows/desktop/api/oledlg/ne-oledlg-oleuipasteflag">OLEUIPASTEFLAG</a> in <b>arrPasteEntries</b>. This member is filled on input.
     * @type {Pointer<UInt32>}
     */
    arrLinkTypes {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * Number of link types. This member is filled on input.
     * @type {Integer}
     */
    cLinkTypes {
        get => NumGet(this, 96, "int")
        set => NumPut("int", value, this, 96)
    }

    /**
     * Number of CLSIDs in <b>lpClsidExclude</b>. This member is filled on input.
     * @type {Integer}
     */
    cClsidExclude {
        get => NumGet(this, 100, "uint")
        set => NumPut("uint", value, this, 100)
    }

    /**
     * Pointer to an array of CLSIDs to exclude from the list of available server objects for a Paste operation. Note that this does not affect <b>Paste Link</b>. An application can prevent embedding into itself by listing its own CLSID in this list. This field is filled on input.
     * @type {Pointer<Guid>}
     */
    lpClsidExclude {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * Index of <b>arrPasteEntries</b> that the user selected. This member is filled on output.
     * @type {Integer}
     */
    nSelectedIndex {
        get => NumGet(this, 112, "int")
        set => NumPut("int", value, this, 112)
    }

    /**
     * Whether <b>Paste</b> or <b>Paste Link</b> was selected by the user. This member is filled on output.
     * @type {BOOL}
     */
    fLink {
        get => NumGet(this, 116, "int")
        set => NumPut("int", value, this, 116)
    }

    /**
     * Handle to the Metafile containing the icon and icon title selected by the user. This member is filled on output.
     * @type {HGLOBAL}
     */
    hMetaPict{
        get {
            if(!this.HasProp("__hMetaPict"))
                this.__hMetaPict := HGLOBAL(120, this)
            return this.__hMetaPict
        }
    }

    /**
     * The size of object as displayed in its source, if the display aspect chosen by the user matches the aspect displayed in the source. If the user chooses a different aspect, then <b>sizel.cx</b> and <b>sizel.cy</b> are both set to zero. The size of the object as it is displayed in the source is retrieved from the ObjectDescriptor if <b>fLink</b> is <b>FALSE</b> and from the LinkSrcDescriptor if <b>fLink</b> is <b>TRUE</b>. This member is filled on output.
     * @type {SIZE}
     */
    sizel{
        get {
            if(!this.HasProp("__sizel"))
                this.__sizel := SIZE(128, this)
            return this.__sizel
        }
    }
}
