#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information that the OLE User Interface Library uses to initialize the Insert Object dialog box, and space for the library to return information when the dialog box is dismissed.
 * @remarks
 * 
  * > [!NOTE]
  * > The oledlg.h header defines OLEUIINSERTOBJECT as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
  * 
 * @see https://docs.microsoft.com/windows/win32/api//oledlg/ns-oledlg-oleuiinsertobjectw
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 * @charset Unicode
 */
class OLEUIINSERTOBJECTW extends Win32Struct
{
    static sizeof => 160

    static packingSize => 8

    /**
     * The size of the structure, in bytes. This field must be filled on input.
     * @type {Integer}
     */
    cbStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * On input, specifies the initialization and creation flags. On exit, specifies the user's choices. It can be a combination of the following flags.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IOF_SHOWHELP"></a><a id="iof_showhelp"></a><dl>
     * <dt><b>IOF_SHOWHELP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The dialog box will display a <b>Help</b> button. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IOF_SELECTCREATENEW"></a><a id="iof_selectcreatenew"></a><dl>
     * <dt><b>IOF_SELECTCREATENEW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>Create New</b> radio button will initially be checked. This cannot be used with IOF_SELECTCREATEFROMFILE. 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IOF_SELECTCREATEFROMFILE"></a><a id="iof_selectcreatefromfile"></a><dl>
     * <dt><b>IOF_SELECTCREATEFROMFILE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>Create From File</b> radio button will initially be checked. This cannot be used with IOF_SELECTCREATENEW. 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IOF_CHECKLINK"></a><a id="iof_checklink"></a><dl>
     * <dt><b>IOF_CHECKLINK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>Link</b> check box will initially be checked.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IOF_CHECKDISPLAYASICON"></a><a id="iof_checkdisplayasicon"></a><dl>
     * <dt><b>IOF_CHECKDISPLAYASICON</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>Display As Icon</b> check box will initially be checked, the current icon will be displayed, and the <b>Change Icon</b> button will be enabled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IOF_CREATENEWOBJECT"></a><a id="iof_createnewobject"></a><dl>
     * <dt><b>IOF_CREATENEWOBJECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A new object should be created when the user selects <b>OK</b> to dismiss the dialog box and the <b>Create New</b> radio button was selected.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IOF_CREATEFILEOBJECT"></a><a id="iof_createfileobject"></a><dl>
     * <dt><b>IOF_CREATEFILEOBJECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A new object should be created from the specified file when the user selects <b>OK</b> to dismiss the dialog box and the <b>Create From File</b> radio button was selected.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IOF_CREATELINKOBJECT"></a><a id="iof_createlinkobject"></a><dl>
     * <dt><b>IOF_CREATELINKOBJECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  A new linked object should be created when the user selects <b>OK</b> to dismiss the dialog box and the user checked the <b>Link</b> check box. 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IOF_DISABLELINK"></a><a id="iof_disablelink"></a><dl>
     * <dt><b>IOF_DISABLELINK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  The <b>Link</b> check box will be disabled on initialization.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IOF_VERIFYSERVERSEXIST"></a><a id="iof_verifyserversexist"></a><dl>
     * <dt><b>IOF_VERIFYSERVERSEXIST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The dialog box should validate the classes it adds to the listbox by ensuring that the server specified in the registration database exists. This is a significant performance factor. 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IOF_DISABLEDISPLAYASICON"></a><a id="iof_disabledisplayasicon"></a><dl>
     * <dt><b>IOF_DISABLEDISPLAYASICON</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>Display As Icon</b> check box will be disabled on initialization. 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IOF_HIDECHANGEICON"></a><a id="iof_hidechangeicon"></a><dl>
     * <dt><b>IOF_HIDECHANGEICON</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>Change Icon</b> button will be hidden in the <b>Insert Object</b> dialog box.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IOF_SHOWINSERTCONTROL"></a><a id="iof_showinsertcontrol"></a><dl>
     * <dt><b>IOF_SHOWINSERTCONTROL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Displays the <b>Insert Control</b> radio button.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IOF_SELECTCREATECONTROL"></a><a id="iof_selectcreatecontrol"></a><dl>
     * <dt><b>IOF_SELECTCREATECONTROL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Displays the <b>Create Control</b> radio button.
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
     * @type {Pointer<Void>}
     */
    hWndOwner {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Pointer to a string to be used as the title of the dialog box. If <b>NULL</b>, then the library uses <b>Insert Object</b>.
     * @type {Pointer<Char>}
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
     * Application-defined data that the library passes to the hook function pointed to by the <b>lpfnHook</b> member. The library passes a pointer to the <b>OLEUIINSERTOBJECT</b> structure in the <i>lParam</i> parameter of the WM_INITDIALOG message; this pointer can be used to retrieve the <b>lCustData</b> member.
     * @type {Pointer}
     */
    lCustData {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Instance that contains a dialog box template specified by the <b>lpTemplateName</b> member.
     * @type {Pointer<Void>}
     */
    hInstance {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Pointer to a null-terminated string that specifies the name of the resource file for the dialog box template that is to be substituted for the library's <b>Insert Object</b> dialog box template.
     * @type {Pointer<Char>}
     */
    lpszTemplate {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Customized template handle.
     * @type {Pointer<Void>}
     */
    hResource {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * CLSID for class of the object to be inserted. Filled on output.
     * @type {Pointer<Guid>}
     */
    clsid {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * Pointer to the name of the file to be linked or embedded. Filled on output.
     * @type {Pointer<Char>}
     */
    lpszFile {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * Size of <b>lpszFile</b> buffer; will not exceed MAX_PATH.
     * @type {Integer}
     */
    cchFile {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * Number of CLSIDs included in the <b>lpClsidExclude</b> list. Filled on input.
     * @type {Integer}
     */
    cClsidExclude {
        get => NumGet(this, 84, "uint")
        set => NumPut("uint", value, this, 84)
    }

    /**
     * Pointer to a list of CLSIDs to exclude from listing.
     * @type {Pointer<Guid>}
     */
    lpClsidExclude {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * Identifier of the requested interface. If <a href="https://docs.microsoft.com/windows/desktop/api/oledlg/nf-oledlg-oleuiinsertobjecta">OleUIInsertObject</a> creates the object, then it will return a pointer to this interface. This parameter is ignored if <b>OleUIInsertObject</b> does not create the object.
     * @type {Pointer<Guid>}
     */
    iid {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * Rendering option. If <a href="https://docs.microsoft.com/windows/desktop/api/oledlg/nf-oledlg-oleuiinsertobjecta">OleUIInsertObject</a> creates the object, then it selects the rendering option when it creates the object. This parameter is ignored if <b>OleUIInsertObject</b> does not create the object.
     * @type {Integer}
     */
    oleRender {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * Desired format. If <a href="https://docs.microsoft.com/windows/desktop/api/oledlg/nf-oledlg-oleuiinsertobjecta">OleUIInsertObject</a> creates the object, then it selects the format when it creates the object. This parameter is ignored if <b>OleUIInsertObject</b> does not create the object.
     * @type {Pointer<FORMATETC>}
     */
    lpFormatEtc {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * Pointer to the client site to be used for the object. This parameter is ignored if <a href="https://docs.microsoft.com/windows/desktop/api/oledlg/nf-oledlg-oleuiinsertobjecta">OleUIInsertObject</a> does not create the object.
     * @type {Pointer<IOleClientSite>}
     */
    lpIOleClientSite {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * Pointer to the storage to be used for the object. This parameter is ignored if <a href="https://docs.microsoft.com/windows/desktop/api/oledlg/nf-oledlg-oleuiinsertobjecta">OleUIInsertObject</a> does not create the object.
     * @type {Pointer<IStorage>}
     */
    lpIStorage {
        get => NumGet(this, 128, "ptr")
        set => NumPut("ptr", value, this, 128)
    }

    /**
     * Address of output pointer variable that contains the interface pointer for the object being inserted. This parameter is ignored if <a href="https://docs.microsoft.com/windows/desktop/api/oledlg/nf-oledlg-oleuiinsertobjecta">OleUIInsertObject</a> does not create the object.
     * @type {Pointer<Void>}
     */
    ppvObj {
        get => NumGet(this, 136, "ptr")
        set => NumPut("ptr", value, this, 136)
    }

    /**
     * Result of creation calls. This parameter is ignored if <a href="https://docs.microsoft.com/windows/desktop/api/oledlg/nf-oledlg-oleuiinsertobjecta">OleUIInsertObject</a> does not create the object.
     * @type {Integer}
     */
    sc {
        get => NumGet(this, 144, "int")
        set => NumPut("int", value, this, 144)
    }

    /**
     * MetafilePict structure containing the iconic aspect, if it wasn't placed in the object's cache.
     * @type {Pointer<Void>}
     */
    hMetaPict {
        get => NumGet(this, 152, "ptr")
        set => NumPut("ptr", value, this, 152)
    }
}
