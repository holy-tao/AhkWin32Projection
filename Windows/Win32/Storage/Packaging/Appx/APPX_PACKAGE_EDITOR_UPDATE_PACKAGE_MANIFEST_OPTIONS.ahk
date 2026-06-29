#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Options for app manifest validation when updating the manifest.
 * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/ne-appxpackaging-appx_package_editor_update_package_manifest_options
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct APPX_PACKAGE_EDITOR_UPDATE_PACKAGE_MANIFEST_OPTIONS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * No options.
     * @type {Integer (Int32)}
     */
    static APPX_PACKAGE_EDITOR_UPDATE_PACKAGE_MANIFEST_OPTION_NONE => 0

    /**
     * Skip app package manifest validation.
     * @type {Integer (Int32)}
     */
    static APPX_PACKAGE_EDITOR_UPDATE_PACKAGE_MANIFEST_OPTION_SKIP_VALIDATION => 1

    /**
     * The app package manifest is localized.
     * @type {Integer (Int32)}
     */
    static APPX_PACKAGE_EDITOR_UPDATE_PACKAGE_MANIFEST_OPTION_LOCALIZED => 2
}
