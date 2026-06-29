#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * The DSBROWSEINFO structure is used with the DsBrowseForContainer function to supply and return data about the Active Directory container browser dialog box. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The dsclient.h header defines DSBROWSEINFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/dsclient/ns-dsclient-dsbrowseinfoa
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @charset ANSI
 */
export default struct DSBROWSEINFOA {
    #StructPack 8

    /**
     * Contains the size, in bytes, of the <b>DSBROWSEINFO</b> structure. This is used by the <a href="https://docs.microsoft.com/windows/desktop/api/dsclient/nf-dsclient-dsbrowseforcontainera">DsBrowseForContainer</a> function for versioning purposes.
     */
    cbStruct : UInt32

    /**
     * Handle of the window used as the parent of the container browser dialog box.
     */
    hwndOwner : HWND

    /**
     * Pointer to a null-terminated string that contains the caption of the dialog box. If this member is <b>NULL</b>, a default caption is used.
     */
    pszCaption : PSTR

    /**
     * Pointer to a null-terminated string that contains additional text to be displayed in the dialog box above the tree control. If this member is <b>NULL</b>, no additional text is displayed.
     */
    pszTitle : PSTR

    /**
     * Pointer to a null-terminated Unicode string that contains the ADsPath of the container placed at the root of the dialog box. The user cannot navigate above this level using the dialog box.
     */
    pszRoot : PWSTR

    /**
     * Pointer to a null-terminated Unicode string that receives the ADsPath of the container selected in the dialog. This string will always be null-terminated even if <b>cchPath</b> is not large enough to hold the entire path. If <b>dwFlags</b> contains the <b>DSBI_EXPANDONOPEN</b> flag, this member contains the ADsPath of the container that should be initially selected in the dialog box.
     */
    pszPath : PWSTR

    /**
     * Contains the size, in <b>WCHAR</b> characters, of the <b>pszPath</b> buffer.
     */
    cchPath : UInt32

    dwFlags : UInt32

    /**
     * Pointer to an application-defined  <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nc-shlobj_core-bffcallback">BFFCallBack</a> callback function that receives notifications from the container browser dialog box. Set this member to <b>NULL</b> if it is not used.
     */
    pfnCallback : IntPtr

    /**
     * Contains an application-defined 32-bit value passed as the <i>lpData</i> parameter in all calls to <b>pfnCallback</b>. This member is ignored if <b>pfnCallback</b> is <b>NULL</b>.
     */
    lParam : LPARAM

    /**
     * Contains one of the <a href="https://docs.microsoft.com/windows/win32/api/iads/ne-iads-ads_format_enum">ADS_FORMAT_ENUM</a> values that specifies the format that the ADSI path returned in <b>pszPath</b> will accept.
     */
    dwReturnFormat : UInt32

    /**
     * Pointer to a Unicode string that contains the user name used for the credentials. This member is ignored if <b>dwFlags</b> does not have the <b>DSBI_HASCREDENTIALS</b> flag set. If this member is <b>NULL</b>, the currently logged on  user name is used.
     */
    pUserName : PWSTR

    /**
     * Pointer to a Unicode string that contains the password used for the credentials. This member is ignored if <b>dwFlags</b> does not have the <b>DSBI_HASCREDENTIALS</b> flag set. If this member is <b>NULL</b>, the password of the currently logged on user is used.
     */
    pPassword : PWSTR

    /**
     * Pointer to a Unicode string buffer that receives the class string of the selected. This member is ignored if <b>dwFlags</b> does not have the <b>DSBI_RETURNOBJECTCLASS</b> flag set.
     */
    pszObjectClass : PWSTR

    /**
     * Contains the size, in <b>WCHAR</b> characters, of the <b>pszObjectClass</b> buffer.
     */
    cchObjectClass : UInt32

}
