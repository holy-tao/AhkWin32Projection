#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines constants that specify the type of a resource in a resource dictionary.
 * @see https://docs.microsoft.com/windows/win32/api//xamlom/ne-xamlom-resourcetype
 * @namespace Windows.Win32.UI.Xaml.Diagnostics
 * @version v4.0.30319
 */
class ResourceType{

    /**
     * The resource is a <a href="https://docs.microsoft.com/windows/uwp/xaml-platform/staticresource-markup-extension">StaticResource</a>.
     * @type {Integer (Int32)}
     */
    static ResourceTypeStatic => 0

    /**
     * The resource is a <a href="https://docs.microsoft.com/windows/uwp/xaml-platform/themeresource-markup-extension">ThemeResource</a>.
     * @type {Integer (Int32)}
     */
    static ResourceTypeTheme => 1
}
