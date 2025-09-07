#Requires AutoHotkey v2.0.0 64-bit

/**
 * Options for app manifest validation when updating the manifest.
 * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/ne-appxpackaging-appx_package_editor_update_package_manifest_options
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class APPX_PACKAGE_EDITOR_UPDATE_PACKAGE_MANIFEST_OPTIONS{

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
