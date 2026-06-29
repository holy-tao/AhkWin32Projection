#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\Foundation\HRSRC.ahk" { HRSRC }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HINSTANCE.ahk" { HINSTANCE }
#Import ".\IOleUILinkContainerA.ahk" { IOleUILinkContainerA }
#Import ".\EDIT_LINKS_FLAGS.ahk" { EDIT_LINKS_FLAGS }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Contains information that the OLE User Interface Library uses to initialize the Edit Links dialog box, and contains space for the library to return information when the dialog box is dismissed. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The oledlg.h header defines OLEUIEDITLINKS as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/oledlg/ns-oledlg-oleuieditlinksa
 * @namespace Windows.Win32.System.Ole
 * @charset ANSI
 */
export default struct OLEUIEDITLINKSA {
    #StructPack 8

    /**
     * The size of the structure, in bytes. This member must be filled on input.
     */
    cbStruct : UInt32

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
     */
    dwFlags : EDIT_LINKS_FLAGS

    /**
     * The window that owns the dialog box. This member should not be <b>NULL</b>.
     */
    hWndOwner : HWND

    /**
     * Pointer to a string to be used as the title of the dialog box. If <b>NULL</b>, then the library uses <b>Links</b>.
     */
    lpszCaption : PSTR

    /**
     * Pointer to a hook function that processes messages intended for the dialog box. The hook function must return zero to pass a message that it didn't process back to the dialog box procedure in the library. The hook function must return a nonzero value to prevent the library's dialog box procedure from processing a message it has already processed.
     */
    lpfnHook : IntPtr

    /**
     * Application-defined data that the library passes to the hook function pointed to by the <b>lpfnHook</b> member. The library passes a pointer to the <b>OLEUIEDITLINKS</b> structure in the <i>lParam</i> parameter of the WM_INITDIALOG message; this pointer can be used to retrieve the <b>lCustData</b> member.
     */
    lCustData : LPARAM

    /**
     * Instance that contains a dialog box template specified by the <b>lpTemplateName</b> member.
     */
    hInstance : HINSTANCE

    /**
     * Pointer to a null-terminated string that specifies the name of the resource file for the dialog box template that is to be substituted for the library's <b>Edit Links</b> dialog box template.
     */
    lpszTemplate : PSTR

    /**
     * Customized template handle.
     */
    hResource : HRSRC

    /**
     * Pointer to the container's implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/oledlg/nn-oledlg-ioleuilinkcontainera">IOleUILinkContainer</a> Interface. The <b>Edit Links</b> dialog box uses this to allow the container to manipulate its links.
     */
    lpOleUILinkContainer : IOleUILinkContainerA

}
