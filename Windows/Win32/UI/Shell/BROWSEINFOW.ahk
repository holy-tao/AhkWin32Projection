#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains parameters for the SHBrowseForFolder function and receives information about the folder selected by the user. (Unicode)
 * @remarks
 * > [!NOTE]
  * > The shlobj_core.h header defines BROWSEINFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-browseinfow
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 * @charset Unicode
 */
class BROWSEINFOW extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * Type: <b>HWND</b>
     * 
     * A handle to the owner window for the dialog box.
     * @type {Pointer<HWND>}
     */
    hwndOwner {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: <b>PCIDLIST_ABSOLUTE</b>
     * 
     * A PIDL that specifies the location of the root folder from which to start browsing. Only the specified folder and its subfolders in the namespace hierarchy appear in the dialog box. This member can be <b>NULL</b>; in that case, a default location is used.
     * @type {Pointer<ITEMIDLIST>}
     */
    pidlRoot {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b>LPTSTR</b>
     * 
     * Pointer to a buffer to receive the display name of the folder selected by the user. The size of this buffer is assumed to be MAX_PATH characters.
     * @type {Pointer<PWSTR>}
     */
    pszDisplayName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a null-terminated string that is displayed above the tree view control in the dialog box. This string can be used to specify instructions to the user.
     * @type {Pointer<PWSTR>}
     */
    lpszTitle {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: <b>UINT</b>
     * @type {Integer}
     */
    ulFlags {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Type: <b>BFFCALLBACK</b>
     * 
     * Pointer to an application-defined function that the dialog box calls when an event occurs. For more information, see the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb762598(v=vs.85)">BrowseCallbackProc</a> function. This member can be <b>NULL</b>.
     * @type {Pointer<BFFCALLBACK>}
     */
    lpfn {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Type: <b>LPARAM</b>
     * 
     * An application-defined value that the dialog box passes to the callback function, if one is specified in <b>lpfn</b>.
     * @type {Pointer}
     */
    lParam {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Type: <b>int</b>
     * 
     * An integer value that receives the index of the image associated with the selected folder, stored in the system image list.
     * @type {Integer}
     */
    iImage {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }
}
