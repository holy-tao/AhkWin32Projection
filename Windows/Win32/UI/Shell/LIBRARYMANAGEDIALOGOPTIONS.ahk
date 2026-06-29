#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Used by SHShowManageLibraryUI to define options for handling a name collision when saving a library.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-librarymanagedialogoptions
 * @namespace Windows.Win32.UI.Shell
 */
export default struct LIBRARYMANAGEDIALOGOPTIONS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Show default warning UI to the user.
     * @type {Integer (Int32)}
     */
    static LMD_DEFAULT => 0

    /**
     * Do not display a warning dialog to the user in collisions that concern network locations that cannot be indexed.
     * @type {Integer (Int32)}
     */
    static LMD_ALLOWUNINDEXABLENETWORKLOCATIONS => 1
}
