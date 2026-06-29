#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Contains information that identifies a particular file. It is used by IColumnProvider::GetItemData when requesting data for a particular file.
 * @see https://learn.microsoft.com/windows/win32/api/shlobj/ns-shlobj-shcolumndata
 * @namespace Windows.Win32.UI.Shell
 */
export default struct SHCOLUMNDATA {
    #StructPack 8

    /**
     * Type: <b>ULONG</b>
     * 
     * Flags used to specify the nature of the request.
     */
    dwFlags : UInt32

    /**
     * Type: <b>DWORD</b>
     */
    dwFileAttributes : UInt32

    /**
     * Type: <b>ULONG</b>
     * 
     * Reserved. Set to <b>NULL</b>.
     */
    dwReserved : UInt32

    /**
     * Type: <b>WCHAR*</b>
     * 
     * A pointer to a null-terminated Unicode string with a file name extension.
     */
    pwszExt : PWSTR

    /**
     * Type: <b>WCHAR[MAX_PATH]</b>
     * 
     * A null-terminated Unicode string containing a fully qualified file path.
     */
    wszFile : WCHAR[260]

}
