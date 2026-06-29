#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import ".\CHANGE_SOURCE_FLAGS.ahk" { CHANGE_SOURCE_FLAGS }
#Import "..\..\Foundation\HRSRC.ahk" { HRSRC }
#Import ".\IOleUILinkContainerW.ahk" { IOleUILinkContainerW }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\UI\Controls\Dialogs\OPENFILENAMEW.ahk" { OPENFILENAMEW }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HINSTANCE.ahk" { HINSTANCE }

/**
 * Contains information that is used to initialize the standard Change Source dialog box. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The oledlg.h header defines OLEUICHANGESOURCE as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/oledlg/ns-oledlg-oleuichangesourcew
 * @namespace Windows.Win32.System.Ole
 * @charset Unicode
 */
export default struct OLEUICHANGESOURCEW {
    #StructPack 8

    /**
     * The size of the structure, in bytes.
     */
    cbStruct : UInt32

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
     */
    dwFlags : CHANGE_SOURCE_FLAGS

    /**
     * The window that owns the dialog box.
     */
    hWndOwner : HWND

    /**
     * Pointer to a string to be used as the title of the dialog box. If <b>NULL</b>, then the library uses <b>Change Source</b>.
     */
    lpszCaption : PWSTR

    /**
     * Pointer to a hook function that processes messages intended for the dialog box. The hook function must return zero to pass a message that it didn't process back to the dialog box procedure in the library. The hook function must return a nonzero value to prevent the library's dialog box procedure from processing a message it has already processed.
     */
    lpfnHook : IntPtr

    /**
     * Application-defined data that the library passes to the hook function pointed to by the [OLEUICHANGEICON](./nf-oledlg-oleuichangeicona.md) structure in the <i>lParam</i> parameter of the WM_INITDIALOG message; this pointer can be used to retrieve the <b>lCustData</b> member.
     */
    lCustData : LPARAM

    /**
     * Instance that contains a dialog box template specified by the <b>lpszTemplate</b> member. This member is ignored if the <b>lpszTemplate</b> member is <b>NULL</b> or invalid.
     */
    hInstance : HINSTANCE

    /**
     * Pointer to a null-terminated string that specifies the name of the resource file for the dialog box template that is to be substituted for the library's <b>Convert</b> dialog box template.
     */
    lpszTemplate : PWSTR

    /**
     * Resource handle for a custom dialog box. If this member is <b>NULL</b>, then the library uses the standard <b>Convert</b> dialog box template, or if it is valid, the template named by the <b>lpszTemplate</b> member.
     */
    hResource : HRSRC

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/win32/api/commdlg/ns-commdlg-openfilenamea">OPENFILENAME</a> structure, which contains information used by the operating system to initialize the system-defined <b>Open</b> or <b>Save As</b> dialog boxes.
     */
    lpOFN : OPENFILENAMEW.Ptr

    /**
     * This member is reserved.
     */
    dwReserved1 : UInt32[4]

    /**
     * Pointer to the container's implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/oledlg/nn-oledlg-ioleuilinkcontainera">IOleUILinkContainer</a> interface, used to validate the link source. The <b>Edit Links</b> dialog box uses this to allow the container to manipulate its links.
     */
    lpOleUILinkContainer : IOleUILinkContainerW

    /**
     * Container-defined unique link identifier used to validate link sources. Used by <b>lpOleUILinkContainer</b>.
     */
    dwLink : UInt32

    /**
     * Pointer to the complete source display name.
     */
    lpszDisplayName : PWSTR

    /**
     * File moniker portion of <b>lpszDisplayName</b>.
     */
    nFileLength : UInt32

    /**
     * Pointer to the prefix of the source that was changed from.
     */
    lpszFrom : PWSTR

    /**
     * Pointer to the prefix of the source to be changed to.
     */
    lpszTo : PWSTR

}
