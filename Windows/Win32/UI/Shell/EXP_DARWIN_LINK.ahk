#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DATABLOCK_HEADER.ahk" { DATABLOCK_HEADER }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Holds an extra data block used by IShellLinkDataList. It holds the link's Windows Installer ID.
 * @remarks
 * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishelllinkdatalist-getflags">IShellLinkDataList::GetFlags</a> returns the flag SLDF_HAS_DARWINID for links that have a darwin signature.
 * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-exp_darwin_link
 * @namespace Windows.Win32.UI.Shell
 */
export default struct EXP_DARWIN_LINK {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-datablock_header">DATABLOCK_HEADER</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-datablock_header">DATABLOCK_HEADER</a> structure stating the size and signature of the <b>EXP_DARWIN_LINK</b> structure. The following is the only recognized signature value.
     */
    dbh : DATABLOCK_HEADER

    /**
     * Type: <b>__wchar_t[MAX_PATH]</b>
     * 
     * The link's ID in the form of an ANSI string.
     */
    szDarwinID : CHAR[260]

    /**
     * Type: <b>WCHAR[MAX_PATH]</b>
     * 
     * The link's ID in the form of an Unicode string.
     */
    szwDarwinID : WCHAR[260]

}
