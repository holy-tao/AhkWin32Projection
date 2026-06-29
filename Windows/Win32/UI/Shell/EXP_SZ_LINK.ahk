#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\CHAR.ahk" { CHAR }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Holds an extra data block used by IShellLinkDataList. It holds expandable environment strings for the icon or target.
 * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-exp_sz_link
 * @namespace Windows.Win32.UI.Shell
 */
export default struct EXP_SZ_LINK {
    #StructPack 4

    /**
     * Type: <b>DWORD</b>
     * 
     * The size of the <b>EXP_SZ_LINK</b> structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * Type: <b>DWORD</b>
     */
    dwSignature : UInt32

    /**
     * Type: <b>__wchar_t[MAX_PATH]</b>
     * 
     * The null-terminated ANSI string with the path of the target or icon.
     */
    szTarget : CHAR[260]

    /**
     * Type: <b>WCHAR[MAX_PATH]</b>
     * 
     * The null-terminated Unicode string with the path of the target or icon.
     */
    swzTarget : WCHAR[260]

}
