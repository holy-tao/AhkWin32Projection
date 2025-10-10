#Requires AutoHotkey v2.0.0 64-bit

/**
 * Options to use when updating an app package.
 * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/ne-appxpackaging-appx_package_editor_update_package_option
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class APPX_PACKAGE_EDITOR_UPDATE_PACKAGE_OPTION{

    /**
     * Appends the delta (difference) of the baseline package and the updated package.
     * @type {Integer (Int32)}
     */
    static APPX_PACKAGE_EDITOR_UPDATE_PACKAGE_OPTION_APPEND_DELTA => 0
}
