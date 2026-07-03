#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\FOLDERSETTINGS.ahk" { FOLDERSETTINGS }

/**
 * Deprecated. Data used in IBrowserService2::GetFolderSetData.
 * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/ns-shdeprecated-foldersetdata
 * @namespace Windows.Win32.UI.Shell
 */
export default struct FOLDERSETDATA {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-foldersettings">FOLDERSETTINGS</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-foldersettings">FOLDERSETTINGS</a> structure containing folder view information.
     */
    _fs : FOLDERSETTINGS

    /**
     * Type: <b>SHELLVIEWID</b>
     * 
     * The last view used for this folder, used as a suggestion for this visit.
     */
    _vidRestore : Guid

    /**
     * Type: <b>DWORD</b>
     */
    _dwViewPriority : UInt32

}
