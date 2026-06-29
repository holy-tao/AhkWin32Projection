#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\Foundation\HRSRC.ahk" { HRSRC }
#Import ".\BUSY_DIALOG_FLAGS.ahk" { BUSY_DIALOG_FLAGS }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HTASK.ahk" { HTASK }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HINSTANCE.ahk" { HINSTANCE }

/**
 * Contains information that the OLE User Interface Library uses to initialize the Busy dialog box, and space for the library to return information when the dialog box is dismissed. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The oledlg.h header defines OLEUIBUSY as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/oledlg/ns-oledlg-oleuibusyw
 * @namespace Windows.Win32.System.Ole
 * @charset Unicode
 */
export default struct OLEUIBUSYW {
    #StructPack 8

    /**
     * The size of the structure, in bytes. This field must be filled on input.
     */
    cbStruct : UInt32

    /**
     * On input, specifies the initialization and creation flags. On exit, it specifies the user's choices. It may be a combination of the following flags.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BZ_DISABLECANCELBUTTON"></a><a id="bz_disablecancelbutton"></a><dl>
     * <dt><b>BZ_DISABLECANCELBUTTON</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This flag disables the <b>Cancel</b> button.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BZ_DISABLESWITCHTOBUTTON"></a><a id="bz_disableswitchtobutton"></a><dl>
     * <dt><b>BZ_DISABLESWITCHTOBUTTON</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Input only. This flag disables the <b>Switch To...</b> button.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BZ_DISABLERETRYBUTTON"></a><a id="bz_disableretrybutton"></a><dl>
     * <dt><b>BZ_DISABLERETRYBUTTON</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Input only. This flag disables the <b>Retry</b> button. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BZ_NOTRESPONDINGDIALOG"></a><a id="bz_notrespondingdialog"></a><dl>
     * <dt><b>BZ_NOTRESPONDINGDIALOG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Input only. This flag generates a <b>Not Responding</b> dialog box instead of a <b>Busy</b> dialog box. The text is slightly different, and the <b>Cancel</b> button is disabled.
     * 
     * </td>
     * </tr>
     * </table>
     */
    dwFlags : BUSY_DIALOG_FLAGS

    /**
     * The window that owns the dialog box. This member should not be <b>NULL</b>.
     */
    hWndOwner : HWND

    /**
     * A pointer to a string to be used as the title of the dialog box. If <b>NULL</b>, then the library uses <b>Busy</b>.
     */
    lpszCaption : PWSTR

    /**
     * Pointer to a hook function that processes messages intended for the dialog box. The hook function must return zero to pass a message that it didn't process back to the dialog box procedure in the library. The hook function must return a nonzero value to prevent the library's dialog box procedure from processing a message it has already processed.
     */
    lpfnHook : IntPtr

    /**
     * Application-defined data that the library passes to the hook function pointed to by the <b>lpfnHook</b> member. The library passes a pointer to the <b>OLEUIBUSY</b> structure in the <i>lParam</i> parameter of the WM_INITDIALOG message; this pointer can be used to retrieve the <b>lCustData</b> member.
     */
    lCustData : LPARAM

    /**
     * Instance that contains a dialog box template specified by the <b>lpTemplateName</b> member.
     */
    hInstance : HINSTANCE

    /**
     * Pointer to a null-terminated string that specifies the name of the resource file for the dialog box template that is to be substituted for the library's <b>Busy</b> dialog box template.
     */
    lpszTemplate : PWSTR

    /**
     * Customized template handle.
     */
    hResource : HRSRC

    /**
     * Input only. Handle to the task that is blocking.
     */
    hTask : HTASK

    /**
     * Pointer to the dialog box's <b>HWND</b>.
     */
    lphWndDialog : HWND.Ptr

}
