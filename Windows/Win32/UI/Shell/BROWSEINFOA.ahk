#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "Common\ITEMIDLIST.ahk" { ITEMIDLIST }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Contains parameters for the SHBrowseForFolder function and receives information about the folder selected by the user. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The shlobj_core.h header defines BROWSEINFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-browseinfoa
 * @namespace Windows.Win32.UI.Shell
 * @charset ANSI
 */
export default struct BROWSEINFOA {
    #StructPack 8

    /**
     * Type: <b>HWND</b>
     * 
     * A handle to the owner window for the dialog box.
     */
    hwndOwner : HWND

    /**
     * Type: <b>PCIDLIST_ABSOLUTE</b>
     * 
     * A PIDL that specifies the location of the root folder from which to start browsing. Only the specified folder and its subfolders in the namespace hierarchy appear in the dialog box. This member can be <b>NULL</b>; in that case, a default location is used.
     */
    pidlRoot : ITEMIDLIST.Ptr

    /**
     * Type: <b>LPTSTR</b>
     * 
     * Pointer to a buffer to receive the display name of the folder selected by the user. The size of this buffer is assumed to be MAX_PATH characters.
     */
    pszDisplayName : PSTR

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a null-terminated string that is displayed above the tree view control in the dialog box. This string can be used to specify instructions to the user.
     */
    lpszTitle : PSTR

    /**
     * Type: <b>UINT</b>
     */
    ulFlags : UInt32

    /**
     * Type: <b>BFFCALLBACK</b>
     * 
     * Pointer to an application-defined function that the dialog box calls when an event occurs. For more information, see the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb762598(v=vs.85)">BrowseCallbackProc</a> function. This member can be <b>NULL</b>.
     */
    lpfn : IntPtr

    /**
     * Type: <b>LPARAM</b>
     * 
     * An application-defined value that the dialog box passes to the callback function, if one is specified in <b>lpfn</b>.
     */
    lParam : LPARAM

    /**
     * Type: <b>int</b>
     * 
     * An integer value that receives the index of the image associated with the selected folder, stored in the system image list.
     */
    iImage : Int32

}
