#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Used by IObjectWithFolderEnumMode::GetMode and IObjectWithFolderEnumMode::SetMode methods to get and set the display modes for the folders.
 * @remarks
 * If an item does not support the enumeration mode value (because it is not a folder or it does not provide the enumeration mode) then it is created in the default enumeration mode.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-folder_enum_mode
 * @namespace Windows.Win32.UI.Shell
 */
export default struct FOLDER_ENUM_MODE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Display mode to view the contents of a folder.
     * @type {Integer (Int32)}
     */
    static FEM_VIEWRESULT => 0

    /**
     * Display mode to view the contents of the folders in the navigation pane.
     * @type {Integer (Int32)}
     */
    static FEM_NAVIGATION => 1
}
