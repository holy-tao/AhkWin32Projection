#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Passes initialization information to IColumnProvider::Initialize.
 * @see https://learn.microsoft.com/windows/win32/api/shlobj/ns-shlobj-shcolumninit
 * @namespace Windows.Win32.UI.Shell
 */
export default struct SHCOLUMNINIT {
    #StructPack 4

    /**
     * Type: <b>ULONG</b>
     * 
     * Initialization flags. Reserved. Set to <b>NULL</b>
     */
    dwFlags : UInt32

    /**
     * Type: <b>ULONG</b>
     * 
     * Reserved. Set to <b>NULL</b>.
     */
    dwReserved : UInt32

    /**
     * Type: <b>WCHAR[MAX_PATH]</b>
     * 
     * A pointer to a null-terminated Unicode string with a fully qualified folder path. The string will be empty if multiple folders are specified.
     */
    wszFolder : WCHAR[260]

}
