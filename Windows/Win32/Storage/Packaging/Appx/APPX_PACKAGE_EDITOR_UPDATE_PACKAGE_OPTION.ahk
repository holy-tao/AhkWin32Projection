#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Options to use when updating an app package.
 * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/ne-appxpackaging-appx_package_editor_update_package_option
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct APPX_PACKAGE_EDITOR_UPDATE_PACKAGE_OPTION {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Appends the delta (difference) of the baseline package and the updated package.
     * @type {Integer (Int32)}
     */
    static APPX_PACKAGE_EDITOR_UPDATE_PACKAGE_OPTION_APPEND_DELTA => 0
}
