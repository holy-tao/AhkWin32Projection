#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk
#Include ..\..\Foundation\HINSTANCE.ahk
#Include ..\..\Foundation\HRSRC.ahk
#Include ..\..\Foundation\HGLOBAL.ahk

/**
 * Contains information that the OLE User Interface Library uses to initialize the Convert dialog box, and space for the library to return information when the dialog box is dismissed.
 * @remarks
 * 
 * > [!NOTE]
 * > The oledlg.h header defines OLEUICONVERT as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * 
 * @see https://docs.microsoft.com/windows/win32/api//oledlg/ns-oledlg-oleuiconvertw
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 * @charset Unicode
 */
class OLEUICONVERTW extends Win32Struct
{
    static sizeof => 160

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
     * On input, this field specifies the initialization and creation flags. On exit, it specifies the user's choices. It may be a combination of the following flags.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CF_SHOWHELPBUTTON"></a><a id="cf_showhelpbutton"></a><dl>
     * <dt><b>CF_SHOWHELPBUTTON</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Dialog box will display a <b>Help</b> button. This flag is set on input. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CF_SETCONVERTDEFAULT"></a><a id="cf_setconvertdefault"></a><dl>
     * <dt><b>CF_SETCONVERTDEFAULT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Class whose CLSID is specified by <b>clsidConvertDefault</b> will be used as the default selection. This selection appears in the class listbox when the <b>Convert To</b> radio button is selected. This flag is set on input. 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CF_SETACTIVATEDEFAULT"></a><a id="cf_setactivatedefault"></a><dl>
     * <dt><b>CF_SETACTIVATEDEFAULT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Class whose CLSID is specified by <b>clsidActivateDefault</b> will be used as the default selection. This selection appears in the class listbox when the <b>Activate As</b> radio button is selected. This flag is set on input. 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CF_SELECTCONVERTTO"></a><a id="cf_selectconvertto"></a><dl>
     * <dt><b>CF_SELECTCONVERTTO</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * On input, this flag specifies that <b>Convert To</b> will be initially selected (default behavior). This flag is set on output if <b>Convert To</b> was selected when the user dismissed the dialog box. 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CF_SELECTACTIVATEAS"></a><a id="cf_selectactivateas"></a><dl>
     * <dt><b>CF_SELECTACTIVATEAS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * On input, this flag specifies that <b>Activate As</b> will be initially selected. This flag is set on output if <b>Activate As</b> was selected when the user dismissed the dialog box. 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CF_DISABLEDISPLAYASICON"></a><a id="cf_disabledisplayasicon"></a><dl>
     * <dt><b>CF_DISABLEDISPLAYASICON</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>Display As Icon</b> button will be disabled on initialization. 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CF_DISABLEACTIVATEAS"></a><a id="cf_disableactivateas"></a><dl>
     * <dt><b>CF_DISABLEACTIVATEAS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>Activate As</b> radio button will be disabled on initialization.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CF_HIDECHANGEICON"></a><a id="cf_hidechangeicon"></a><dl>
     * <dt><b>CF_HIDECHANGEICON</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>Change Icon</b> button will be hidden in the <b>Convert</b> dialog box. 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CF_CONVERTONLY"></a><a id="cf_convertonly"></a><dl>
     * <dt><b>CF_CONVERTONLY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>Activate As</b> radio button will be disabled in the <b>Convert</b> dialog box. 
     * 
     * 
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
     * Pointer to a string to be used as the title of the dialog box. If <b>NULL</b>, then the library uses <b>Convert</b>.
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
     * Application-defined data that the library passes to the hook function pointed to by the <b>lpfnHook</b> member. The library passes a pointer to the <b>OLEUICONVERT</b> structure in the <i>lParam</i> parameter of the WM_INITDIALOG message; this pointer can be used to retrieve the <b>lCustData</b> member.
     * @type {LPARAM}
     */
    lCustData {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Instance that contains a dialog box template specified by the <b>lpszTemplate</b> member. This member is ignored if the <b>lpszTemplate</b> member is <b>NULL</b> or invalid.
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
     * Pointer to a null-terminated string that specifies the name of the resource file for the dialog box template that is to be substituted for the library's <b>Convert</b> dialog box template.
     * @type {PWSTR}
     */
    lpszTemplate {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Resource handle for a custom dialog box. If this member is <b>NULL</b>, then the library uses the standard <b>Convert</b> dialog box template, or if it is valid, the template named by the <b>lpszTemplate</b> member.
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
     * The CLSID of the object to be converted or activated. This member is set on input.
     * @type {Pointer<Guid>}
     */
    clsid {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * The CLSID to use as the default class when <b>Convert To</b> is selected. This member is ignored if the <b>dwFlags</b> member does not include CF_SETCONVERTDEFAULT. This member is set on input.
     * @type {Pointer<Guid>}
     */
    clsidConvertDefault {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * The CLSID to use as the default class when <b>Activate As</b> is selected. This member is ignored if the <b>dwFlags</b> member does not include CF_SETACTIVATEDEFAULT. This member is set on input.
     * @type {Pointer<Guid>}
     */
    clsidActivateDefault {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * The CLSID of the selected class. This member is set on output.
     * @type {Pointer<Guid>}
     */
    clsidNew {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * Aspect of the object. This must be either DVASPECT_CONTENT or DVASPECT_ICON. If <b>dvAspect</b> is DVASPECT_ICON on input, then the <b>Display As Icon</b> box is checked and the object's icon is displayed. This member is set on input and output. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ne-wtypes-dvaspect">DVASPECT</a>.
     * @type {Integer}
     */
    dvAspect {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * Data format of the object to be converted or activated.
     * @type {Integer}
     */
    wFormat {
        get => NumGet(this, 100, "ushort")
        set => NumPut("ushort", value, this, 100)
    }

    /**
     * <b>TRUE</b> if the object is linked. This member is set on input.
     * @type {BOOL}
     */
    fIsLinkedObject {
        get => NumGet(this, 104, "int")
        set => NumPut("int", value, this, 104)
    }

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-metafilepict">METAFILEPICT</a> containing the iconic aspect. This member is set on input and output.
     * @type {HGLOBAL}
     */
    hMetaPict{
        get {
            if(!this.HasProp("__hMetaPict"))
                this.__hMetaPict := HGLOBAL(112, this)
            return this.__hMetaPict
        }
    }

    /**
     * Pointer to the User Type name of the object to be converted or activated. If this value is <b>NULL</b>, then the dialog box will retrieve the User Type name from the registry. This string is freed on exit.
     * @type {PWSTR}
     */
    lpszUserType {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * <b>TRUE</b> if the object's icon changed. (that is, if <a href="https://docs.microsoft.com/windows/desktop/api/oledlg/nf-oledlg-oleuichangeicona">OleUIChangeIcon</a> was called and not canceled.). This member is set on output.
     * @type {BOOL}
     */
    fObjectsIconChanged {
        get => NumGet(this, 128, "int")
        set => NumPut("int", value, this, 128)
    }

    /**
     * Pointer to the default label to use for the icon. If <b>NULL</b>, the short user type name will be used. If the object is a link, the caller should pass the display name of the link source. This is freed on exit.
     * @type {PWSTR}
     */
    lpszDefLabel {
        get => NumGet(this, 136, "ptr")
        set => NumPut("ptr", value, this, 136)
    }

    /**
     * Number of CLSIDs in <i>lpClsidExclude</i>.
     * @type {Integer}
     */
    cClsidExclude {
        get => NumGet(this, 144, "uint")
        set => NumPut("uint", value, this, 144)
    }

    /**
     * Pointer to the list of CLSIDs to exclude from the list.
     * @type {Pointer<Guid>}
     */
    lpClsidExclude {
        get => NumGet(this, 152, "ptr")
        set => NumPut("ptr", value, this, 152)
    }
}
