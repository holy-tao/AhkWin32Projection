#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MESSAGEBOX_STYLE.ahk" { MESSAGEBOX_STYLE }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HINSTANCE.ahk" { HINSTANCE }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Contains information used to display a message box. The MessageBoxIndirect function uses this structure. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The winuser.h header defines **MSGBOXPARAMS** as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-msgboxparamsa
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @charset ANSI
 */
export default struct MSGBOXPARAMSA {
    #StructPack 8

    /**
     * Type: <b>UINT</b>
     * 
     * The structure size, in bytes.
     */
    cbSize : UInt32 := this.Size

    /**
     * Type: <b>HWND</b>
     * 
     * A handle to the owner window. This member can be <b>NULL</b>.
     */
    hwndOwner : HWND

    /**
     * Type: <b>HINSTANCE</b>
     * 
     * A handle to the module that contains the icon resource identified by the 
     * 					<b>lpszIcon</b> member, and the string resource identified by the 
     * 					<b>lpszText</b> or 
     * 					<b>lpszCaption</b> member.
     */
    hInstance : HINSTANCE

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * A null-terminated string, or the identifier of a string resource, that contains the message to be displayed.
     */
    lpszText : PSTR

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * A null-terminated string, or the identifier of a string resource, that contains the message box title. If this member is <b>NULL</b>, the default title 
     * 					<b>Error</b> is used.
     */
    lpszCaption : PSTR

    /**
     * Type: <b>DWORD</b>
     * 
     * The contents and behavior of the dialog box. This member can be a combination of flags described for the 
     * 					<i>uType</i> parameter of the <a href="https://docs.microsoft.com/windows/win32/api/winuser/nf-winuser-messageboxexa">MessageBoxEx</a> function. 
     * 
     * In addition, you can specify the <b>MB_USERICON</b> flag (0x00000080L) if you want the message box to display the icon specified by the 
     * 					<b>lpszIcon</b> member.
     */
    dwStyle : MESSAGEBOX_STYLE

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Identifies an icon resource. This parameter can be either a null-terminated string or an integer resource identifier passed to the <a href="https://docs.microsoft.com/windows/win32/api/winuser/nf-winuser-makeintresourcea">MAKEINTRESOURCE</a> macro. 
     * 
     * To load one of the standard system-defined icons, set the 
     * 						<b>hInstance</b> member to <b>NULL</b> and set 
     * 						<b>lpszIcon</b> to one of the values listed with the <a href="https://docs.microsoft.com/windows/win32/api/winuser/nf-winuser-loadicona">LoadIcon</a> function. 
     * 
     * This member is ignored if the 
     * 						<b>dwStyle</b> member does not specify the <b>MB_USERICON</b> flag.
     */
    lpszIcon : PSTR

    /**
     * Type: <b>DWORD_PTR</b>
     * 
     * Identifies a help context. If a help event occurs, this value is specified in the <a href="https://docs.microsoft.com/windows/win32/api/winuser/ns-winuser-helpinfo">HELPINFO</a> structure that the message box sends to the owner window or callback function.
     */
    dwContextHelpId : IntPtr

    /**
     * Type: **[MSGBOXCALLBACK](/windows/win32/api/winuser/nc-winuser-msgboxcallback)**
     * 
     * A pointer to the callback function that processes help events for the message box. The callback function has the following form:
     * 
     * <c>VOID CALLBACK MsgBoxCallback(LPHELPINFO lpHelpInfo);</c>
     * 
     * If this member is <b>NULL</b>, then the message box sends <a href="https://docs.microsoft.com/windows/win32/shell/wm-help">WM_HELP</a> messages to the owner window when help events occur.
     */
    lpfnMsgBoxCallback : IntPtr

    /**
     * Type: <b>DWORD</b>
     * 
     * The language in which to display the text contained in the predefined push buttons. This value must be in the form returned by the 
     * 					<a href="https://docs.microsoft.com/windows/win32/api/winnt/nf-winnt-makelangid">MAKELANGID</a> macro. 
     * 
     * For a list of supported language identifiers, see <a href="https://docs.microsoft.com/windows/win32/Intl/language-identifiers">Language Identifiers</a>. Note that each localized release of Windows typically contains resources only for a limited set of languages. Thus, for example, the U.S. version offers <b>LANG_ENGLISH</b>, the French version offers <b>LANG_FRENCH</b>, the German version offers <b>LANG_GERMAN</b>, and the Japanese version offers <b>LANG_JAPANESE</b>. Each version offers <b>LANG_NEUTRAL</b>. This limits the set of values that can be used with the 
     * 					<b>dwLanguageId</b> parameter. Before specifying a language identifier, you should enumerate the locales that are installed on a system.
     */
    dwLanguageId : UInt32

}
