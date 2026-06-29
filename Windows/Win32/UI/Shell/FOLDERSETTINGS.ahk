#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains folder view information.
 * @remarks
 * These settings assume a particular user interface, which the Shell's folder view has. A Shell extension can use these settings if they apply to the view implemented by the extension.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ns-shobjidl_core-foldersettings
 * @namespace Windows.Win32.UI.Shell
 */
export default struct FOLDERSETTINGS {
    #StructPack 4

    /**
     * Type: <b>UINT</b>
     * 
     * Folder view mode. One of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-folderviewmode">FOLDERVIEWMODE</a> values.
     */
    ViewMode : UInt32

    /**
     * Type: <b>UINT</b>
     * 
     * A set of flags that indicate the options for the folder. This can be zero or a combination of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-folderflags">FOLDERFLAGS</a> values.
     */
    fFlags : UInt32

}
