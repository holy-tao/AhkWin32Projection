#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DATABLOCK_HEADER.ahk" { DATABLOCK_HEADER }

/**
 * Holds an extra data block used by IShellLinkDataList. It holds the console's code page.
 * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-nt_fe_console_props
 * @namespace Windows.Win32.UI.Shell
 */
export default struct NT_FE_CONSOLE_PROPS {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-datablock_header">DATABLOCK_HEADER</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-datablock_header">DATABLOCK_HEADER</a> structure with the <b>NT_FE_CONSOLE_PROPS</b> structure's size and signature. The signature for an <b>NT_FE_CONSOLE_PROPS</b> structure is NT_FE_CONSOLE_PROPS_SIG.
     */
    dbh : DATABLOCK_HEADER

    /**
     * Type: <b>UINT</b>
     * 
     * The console's code page.
     */
    uCodePage : UInt32

}
