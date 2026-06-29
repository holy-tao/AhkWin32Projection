#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\OPEN_AS_INFO_FLAGS.ahk" { OPEN_AS_INFO_FLAGS }

/**
 * Stores information for the SHOpenWithDialog function.
 * @remarks
 * Starting in Windows 10, the <b>OAIF_ALLOW_REGISTRATION</b>, <b>OAIF_FORCE_REGISTRATION</b>, and <b>OAIF_HIDE_REGISTRATION</b> flags will be ignored by <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-shopenwithdialog">SHOpenWithDialog</a>. The <b>Open With</b> dialog box can no longer be used to change the default program used to open a file extension. You can only use <b>SHOpenWithDialog</b> to open a single file.
 * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-openasinfo
 * @namespace Windows.Win32.UI.Shell
 */
export default struct OPENASINFO {
    #StructPack 8

    /**
     * Type: <b>LPCWSTR</b>
     * 
     * A pointer to the file name.
     */
    pcszFile : PWSTR

    /**
     * Type: <b>LPCWSTR</b>
     * 
     * A pointer to the file type description. Set this parameter to <b>NULL</b> to use the file name extension of <b>pcszFile</b>.
     */
    pcszClass : PWSTR

    /**
     * Type: <b>OPEN_AS_INFO_FLAGS</b>
     */
    oaifInFlags : OPEN_AS_INFO_FLAGS

}
