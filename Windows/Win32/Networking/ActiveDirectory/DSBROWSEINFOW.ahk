#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DSBROWSEINFO structure is used with the DsBrowseForContainer function to supply and return data about the Active Directory container browser dialog box. (Unicode)
 * @remarks
 * > [!NOTE]
  * > The dsclient.h header defines DSBROWSEINFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/dsclient/ns-dsclient-dsbrowseinfow
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 * @charset Unicode
 */
class DSBROWSEINFOW extends Win32Struct
{
    static sizeof => 112

    static packingSize => 8

    /**
     * Contains the size, in bytes, of the <b>DSBROWSEINFO</b> structure. This is used by the <a href="https://docs.microsoft.com/windows/desktop/api/dsclient/nf-dsclient-dsbrowseforcontainera">DsBrowseForContainer</a> function for versioning purposes.
     * @type {Integer}
     */
    cbStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Handle of the window used as the parent of the container browser dialog box.
     * @type {Pointer<HWND>}
     */
    hwndOwner {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Pointer to a null-terminated string that contains the caption of the dialog box. If this member is <b>NULL</b>, a default caption is used.
     * @type {Pointer<PWSTR>}
     */
    pszCaption {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Pointer to a null-terminated string that contains additional text to be displayed in the dialog box above the tree control. If this member is <b>NULL</b>, no additional text is displayed.
     * @type {Pointer<PWSTR>}
     */
    pszTitle {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Pointer to a null-terminated Unicode string that contains the ADsPath of the container placed at the root of the dialog box. The user cannot navigate above this level using the dialog box.
     * @type {Pointer<PWSTR>}
     */
    pszRoot {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Pointer to a null-terminated Unicode string that receives the ADsPath of the container selected in the dialog. This string will always be null-terminated even if <b>cchPath</b> is not large enough to hold the entire path. If <b>dwFlags</b> contains the <b>DSBI_EXPANDONOPEN</b> flag, this member contains the ADsPath of the container that should be initially selected in the dialog box.
     * @type {Pointer<PWSTR>}
     */
    pszPath {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Contains the size, in <b>WCHAR</b> characters, of the <b>pszPath</b> buffer.
     * @type {Integer}
     */
    cchPath {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * 
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * Pointer to an application-defined  <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nc-shlobj_core-bffcallback">BFFCallBack</a> callback function that receives notifications from the container browser dialog box. Set this member to <b>NULL</b> if it is not used.
     * @type {Pointer<BFFCALLBACK>}
     */
    pfnCallback {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Contains an application-defined 32-bit value passed as the <i>lpData</i> parameter in all calls to <b>pfnCallback</b>. This member is ignored if <b>pfnCallback</b> is <b>NULL</b>.
     * @type {Pointer}
     */
    lParam {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * Contains one of the <a href="https://docs.microsoft.com/windows/win32/api/iads/ne-iads-ads_format_enum">ADS_FORMAT_ENUM</a> values that specifies the format that the ADSI path returned in <b>pszPath</b> will accept.
     * @type {Integer}
     */
    dwReturnFormat {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * Pointer to a Unicode string that contains the user name used for the credentials. This member is ignored if <b>dwFlags</b> does not have the <b>DSBI_HASCREDENTIALS</b> flag set. If this member is <b>NULL</b>, the currently logged on  user name is used.
     * @type {Pointer<PWSTR>}
     */
    pUserName {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * Pointer to a Unicode string that contains the password used for the credentials. This member is ignored if <b>dwFlags</b> does not have the <b>DSBI_HASCREDENTIALS</b> flag set. If this member is <b>NULL</b>, the password of the currently logged on user is used.
     * @type {Pointer<PWSTR>}
     */
    pPassword {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * Pointer to a Unicode string buffer that receives the class string of the selected. This member is ignored if <b>dwFlags</b> does not have the <b>DSBI_RETURNOBJECTCLASS</b> flag set.
     * @type {Pointer<PWSTR>}
     */
    pszObjectClass {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * Contains the size, in <b>WCHAR</b> characters, of the <b>pszObjectClass</b> buffer.
     * @type {Integer}
     */
    cchObjectClass {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }
}
