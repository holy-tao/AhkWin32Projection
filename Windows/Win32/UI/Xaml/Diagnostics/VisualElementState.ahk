#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines constants that specify the state of an element in the visual tree.
 * @see https://learn.microsoft.com/windows/win32/api/xamlom/ne-xamlom-visualelementstate
 * @namespace Windows.Win32.UI.Xaml.Diagnostics
 */
export default struct VisualElementState {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The error has been fixed.
     * @type {Integer (Int32)}
     */
    static ErrorResolved => 0

    /**
     * The resource could not be resolved.
     * @type {Integer (Int32)}
     */
    static ErrorResourceNotFound => 1

    /**
     * The resource was found, but does not match the property.
     * @type {Integer (Int32)}
     */
    static ErrorInvalidResource => 2
}
