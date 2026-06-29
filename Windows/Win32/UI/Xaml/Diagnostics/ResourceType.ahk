#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines constants that specify the type of a resource in a resource dictionary.
 * @see https://learn.microsoft.com/windows/win32/api/xamlom/ne-xamlom-resourcetype
 * @namespace Windows.Win32.UI.Xaml.Diagnostics
 */
export default struct ResourceType {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
